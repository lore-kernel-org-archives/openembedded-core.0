Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B9C4D761AC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 01:27:07 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so27024765igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 18:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TTpAIm9N4GPffGEuuB0b0K2eRBlX5r8hhgYDvK+kWvk=;
	b=wBEjjTXIbQkjkbs7xloJ3rRtK+D/lYsno2JMTF1HlRj5x5wRuVDtKovPVg5AI86nww
	MXykSngYmPDko/5fxhqVGFJvnu4bC7pWTn3CUwsiRRRYNl1WyncW8p4srJlswYCOFrp+
	AzPCepMLAyAFFMP1+xKA5GuuFZg6X+vfMx62hcvJTL2wZQrOqmUVcfdvGfyLabWxEmPw
	RahPIQivcIbDc14lmS2/nHxbmIEVCztSU2hEqax+5rai1kjBj0832YXSvPNqoEQYQ9CD
	akrTU3reO/5m4z7lJGeh+um0f6j/v/uL/jzvKnCEQ0nYfkyHocx3c/ypRnbVWhRNr2Xw
	8CnQ==
X-Received: by 10.50.225.35 with SMTP id rh3mr919932igc.29.1437787627076; Fri,
	24 Jul 2015 18:27:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.8.149 with HTTP; Fri, 24 Jul 2015 18:26:37 -0700 (PDT)
In-Reply-To: <1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
References: <1437746580-31696-1-git-send-email-pau.espin@aweurope.be>
	<1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jul 2015 18:26:37 -0700
Message-ID: <CAMKF1spNMSGJ-9+PtFHxGvTjG16GDUJf+8H6iE3aJirLVc7RBA@mail.gmail.com>
To: Pau Espin Pedrol <pau.espin@aweurope.be>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] systemd.bbclass: Use systemd_system_unitdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Jul 2015 01:27:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 24, 2015 at 7:02 AM, Pau Espin Pedrol <pau.espin@aweurope.be> wrote:
> Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
> ---
>  meta/classes/systemd.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index cfe1eb5..46e72c7 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -136,8 +136,7 @@ python systemd_populate_packages() {
>      # Check service-files and call systemd_add_files_and_parse for each entry
>      def systemd_check_services():
>          searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
> -        searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir", True), "systemd", "system"))
> -        searchpaths.append(oe.path.join(d.getVar("exec_prefix", True), d.getVar("nonarch_base_libdir", True), "systemd", "system"))
> +        searchpaths.append(d.getVar("systemd_system_unitdir", True))
>          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>
>          keys = 'Also'
> @@ -185,10 +184,10 @@ python rm_sysvinit_initddir (){
>      if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and \
>          not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
>          os.path.exists(sysv_initddir):
> -        systemd_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_unitdir', True), "system")
> +        systemd_system_unitdir = oe.path.join(d.getVar("D", True), d.getVar('systemd_system_unitdir', True))
>
> -        # If systemd_unitdir contains anything, delete sysv_initddir
> -        if (os.path.exists(systemd_unitdir) and os.listdir(systemd_unitdir)):
> +        # If systemd_system_unitdir contains anything, delete sysv_initddir
> +        if (os.path.exists(systemd_system_unitdir) and os.listdir(systemd_system_unitdir)):
>              shutil.rmtree(sysv_initddir)
>  }
>  do_install[postfuncs] += "rm_sysvinit_initddir "

what does this patch solve ?

