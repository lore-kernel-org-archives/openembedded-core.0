Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwwbR-0002TQ-Vh for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:42:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72EUdQb008820
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 15:30:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05020-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 15:30:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72EUSKF008812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 15:30:29 +0100
Message-ID: <1343917830.9756.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2012 15:30:30 +0100
In-Reply-To: <1343767324-11395-1-git-send-email-msm@freescale.com>
References: <1343767324-11395-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] foomatic-filters_4.0.16.bb: update recipe to work on Fedora 17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 14:42:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-31 at 15:42 -0500, Matthew McClintock wrote:
> This fixes isses on distro that have perl in /bin/perl instead
> of /usr/bin/perl such as Fedora 17
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  .../foomatic/foomatic-filters_4.0.16.bb            |    9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
> index 5f145b0..d5ae4c7 100644
> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
> @@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
>  "
>  
>  DEPENDS += "cups perl libxml2"
> -PR = "r0"
> +PR = "r1"
>  
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
> @@ -31,6 +31,13 @@ do_configure_prepend() {
>      export CUPS_PPDS=${datadir}/cups/model
>  }
>  
> +PERLPATH = "${bindir}/env perl"
> +PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
> +
> +do_install_append() {
> +    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${libdir}/cups/backend/beh
> +}
> +
>  do_install_append_linuxstdbase() {
>      install -d ${D}${exec_prefix}/lib/cups/filter
>      ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter

Could you adjust this to account for:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ac7a0311825e20c544d17bfd8be63546ad36e665

please?

Thanks,

Richard



