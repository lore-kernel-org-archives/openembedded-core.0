Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVoR8-0006Jv-Dc for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 18:59:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUHqWfI002540;
	Wed, 30 Nov 2011 17:52:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02209-05; Wed, 30 Nov 2011 17:52:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUHqOoC002534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 17:52:24 GMT
Message-ID: <1322675553.17484.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 17:52:33 +0000
In-Reply-To: <1322660459-333-1-git-send-email-koen@dominion.thruhere.net>
References: <1322660459-333-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Wed, 30 Nov 2011 17:59:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 14:40 +0100, Koen Kooi wrote:
> Upstream has grown cmake support which would allow us to dump the OE
> autotools hack, but the cmakefile doesn't install the .pc file either
> and breaks with zlib-native
> 
> Also remove unused site config file

How did you determine this was unused?

Cheers,

Richard

> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-core/zlib/site_config/headers |    1 -
>  meta/recipes-core/zlib/zlib_1.2.5.bb       |   18 ++++++++++++++++--
>  2 files changed, 16 insertions(+), 3 deletions(-)
>  delete mode 100644 meta/recipes-core/zlib/site_config/headers
> 
> diff --git a/meta/recipes-core/zlib/site_config/headers b/meta/recipes-core/zlib/site_config/headers
> deleted file mode 100644
> index 5026891..0000000
> --- a/meta/recipes-core/zlib/site_config/headers
> +++ /dev/null
> @@ -1 +0,0 @@
> -zlib.h
> diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zlib/zlib_1.2.5.bb
> index bca400c..b5756d9 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.5.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
> @@ -7,12 +7,12 @@ LICENSE = "Zlib"
>  LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=084e9c30e4e6272c3b057b13c6467f3d"
>  
>  DEPENDS = "libtool-cross"
> -PR = "r1"
> +PR = "r3"
>  
>  SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>             file://configure.ac \
>             file://Makefile.am \
> -	   file://fix.inverted.LFS.logic.patch"
> +           file://fix.inverted.LFS.logic.patch"
>  
>  SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
>  SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
> @@ -24,4 +24,18 @@ do_configure_prepend () {
>  	cp ${WORKDIR}/Makefile.am ${S}/
>  }
>  
> +do_install_append () {
> +	sed \
> +		-e 's:@prefix@:${prefix}:' \
> +		-e 's:@exec_prefix@:${exec_prefix}:' \
> +		-e 's:@libdir@:${libdir}:' \
> +		-e 's:@sharedlibdir@:${libdir}:' \
> +		-e 's:@includedir@:${includedir}:' \
> +		-e 's:@VERSION@:${PV}:' \
> +		zlib.pc.in > zlib.pc
> +
> +	install -d ${D}${libdir}/pkgconfig
> +	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"




