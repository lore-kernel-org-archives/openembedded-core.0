Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4554C615C7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:54:37 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so1279829obc.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 17:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=mZvbngx3CvtKXdXLa+QqGCxE438NII8bVOR5iJlVL2g=;
	b=E4beXOrxfnRyq0vaOs3Di7VSifPQjY3u7S+WJs/j6wScKyBU/6ONtbZYHg1hzZXs/w
	Z1/C5BzNBsghgiVaZzgFNDA8p/0kIobW2c8337FNqkUAupLwmooVrS7uESyMo8ZB1oUT
	lOAM/ayakqsIp76rnI/iOp4E6acRXvFRYnAiNwXyz9417HWiEkqsUiqw1EMzMmwyklZa
	6nThaMwT1W2KIstcl3AzSjUMycOIBzVczyEqFH3Cpt7AfddpWJ1RAPjOBBllFlOFdEvE
	+t7zWeYsd5nYgVHh9Jzdfb3EuTfPJpsgNSIxGcnluaS7JxUAWaVpeqm7tLG2YYt0Nfm5
	r/Ug==
MIME-Version: 1.0
X-Received: by 10.60.78.227 with SMTP id e3mr4412699oex.5.1378342478705; Wed,
	04 Sep 2013 17:54:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 17:54:38 -0700 (PDT)
In-Reply-To: <7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<b2e7d64bcfed785d28da77202d46157f4ce7dfd6.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
Date: Wed, 4 Sep 2013 21:54:38 -0300
X-Google-Sender-Auth: 0a46PSOAdaIMJ78xGhrg3eeLYHE
Message-ID: <CAP9ODKoZKArHD5+bTGwLrdNoa7DE+RWTOO7A_pVtPNevaz8sWg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 00:54:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> As part of pulling in the more generic components of the meta-intel
> xserver infrastructure, include the configure and install appends from
> the meta-intel version of xorg-driver-common.
>
> Modify the configure prepend to use ${S} in the paths explicitly as
> without this the script appears to be running in a build/ directory
> instead of the source directory, and cannot find the configure.ac.
> This prepend is required for at least the -intel and -mga drivers.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../xorg-driver/xorg-driver-common.inc             |   17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index 5f5d282..2d4f2ce 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -5,7 +5,7 @@ SECTION = "x11/drivers"
>  LICENSE = "MIT-X"
>
>  PE = "2"
> -INC_PR = "r21"
> +INC_PR = "r22"

This is need because you had a PRINC?

>  DEPENDS = "virtual/xserver xproto randrproto util-macros"
>
> @@ -39,3 +39,18 @@ def add_abi_depends(d, name):
>
>      pn = d.getVar("PN", True)
>      d.appendVar('RDEPENDS_' + pn, ' ' + abi)
> +
> +# AC_CHECK_FILE doesn't work when cross compiling, so we create a replacement
> +# macro that simply assumes the test succeeds. This is required for at least
> +# the -intel and -mga drivers.
> +do_configure_prepend () {
> +       echo 'AC_DEFUN(CC_AC_CHECK_FILE, $2)' > ${S}/configure.ac.new
> +       sed 's/AC_CHECK_FILE/CC_AC_CHECK_FILE/g' ${S}/configure.ac >> ${S}/configure.ac.new
> +       mv ${S}/configure.ac.new ${S}/configure.ac
> +}
> +
> +# FIXME: We don't want to include the libtool archives (*.la) from modules
> +# directory, as they serve no useful purpose. Upstream should fix Makefile.am
> +do_install_append() {
> +       find ${D}${libdir}/xorg/modules -regex ".*\.la$" | xargs rm -f --
> +}

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

