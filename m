Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3188571A37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BBD4320911;
	Tue, 25 Oct 2016 18:24:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id I3CBbK1PlidF; Tue, 25 Oct 2016 18:24:39 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8EAA6204E0;
	Tue, 25 Oct 2016 18:24:38 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id E96D716217E; Tue, 25 Oct 2016 14:24:37 -0400 (EDT)
Date: Tue, 25 Oct 2016 14:24:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Davis, Michael" <michael.davis@essvote.com>
Message-ID: <20161025182437.GD2494@denix.org>
References: <1477405943-3543-1-git-send-email-michael.davis@essvote.com>
MIME-Version: 1.0
In-Reply-To: <1477405943-3543-1-git-send-email-michael.davis@essvote.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][krogoth][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Tue, 25 Oct 2016 18:24:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

meta-oe patches should be submitted to openembedded-devel mailing list. Thanks.

-- 
Denys


On Tue, Oct 25, 2016 at 02:32:55PM +0000, Davis, Michael wrote:
> From: "Davis, Michael" <michael.davis@essvote.com>
> 
> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy and
> pcsc-lite-spy-dev so the package can be used with GPLv3 blacklisted.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> (cherry picked from commit 54c7e784c7689d8cff4173db716bb7913c65315f)
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  .../recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb  | 24 ++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> index cc72549..0d2cb33 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> @@ -1,7 +1,13 @@
>  SUMMARY = "PC/SC Lite smart card framework and applications"
>  HOMEPAGE = "http://pcsclite.alioth.debian.org/"
>  LICENSE = "BSD & GPLv3+"
> -LICENSE_${PN}-dev = "GPLv3+"
> +LICENSE_${PN} = "BSD"
> +LICENSE_${PN}-lib = "BSD"
> +LICENSE_${PN}-doc = "BSD"
> +LICENSE_${PN}-dev = "BSD"
> +LICENSE_${PN}-dbg = "BSD & GPLv3+"
> +LICENSE_${PN}-spy = "GPLv3+"
> +LICENSE_${PN}-spy-dev = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
>  DEPENDS = "udev"
>  
> @@ -20,14 +26,24 @@ EXTRA_OECONF = " \
>  
>  S = "${WORKDIR}/pcsc-lite-${PV}"
>  
> -PACKAGES =+ "${PN}-lib"
> +PACKAGES = "${PN} ${PN}-dbg ${PN}-dev ${PN}-lib ${PN}-doc ${PN}-spy ${PN}-spy-dev"
>  
>  RRECOMMENDS_${PN} = "ccid"
>  
> -FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN} = "${sbindir}/pcscd"
> +FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
> +FILES_${PN}-dev = "${includedir} \
> +                   ${libdir}/pkgconfig \
> +                   ${libdir}/libpcsclite.la \
> +                   ${libdir}/libpcsclite.so"
> +                   
> +FILES_${PN}-spy = "${bindir}/pcsc-spy \
> +                   ${libdir}/libpcscspy*${SOLIBS}"
> +FILES_${PN}-spy-dev = "${libdir}/libpcscspy.la \
> +                       ${libdir}/libpcscspy.so "
>  
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> -RDEPENDS_${PN} +="python"
> +RDEPENDS_${PN}-spy +="python"
> -- 
> 2.5.5
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

