Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 74BBC606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 10:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t39ACLTE031665; Thu, 9 Apr 2015 11:12:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id E7Pr3uI1aN-b; Thu,  9 Apr 2015 11:12:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t39ACUPO031674
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Apr 2015 11:12:42 +0100
Message-ID: <1428574350.6976.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 09 Apr 2015 11:12:30 +0100
In-Reply-To: <1428405673-29955-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150330172759.GC14928@jama>
	<1428405673-29955-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Thu, 09 Apr 2015 10:12:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 13:21 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> v2: added --with-cache-dir to fontconfig EXTRA_OECONF in case that was
>     what Ross wanted
> 
>  meta/classes/fontcache.bbclass                        | 4 ++--
>  meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb | 4 +++-
>  scripts/postinst-intercepts/update_font_cache         | 4 +---
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
> index dfbdfa1..d122387 100644
> --- a/meta/classes/fontcache.bbclass
> +++ b/meta/classes/fontcache.bbclass
> @@ -8,11 +8,11 @@ inherit qemu
>  
>  FONT_PACKAGES ??= "${PN}"
>  FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
> -
> +FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
>  fontcache_common() {
>  if [ "x$D" != "x" ] ; then
>  	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} bindir=${bindir} \
> -		libdir=${libdir} base_libdir=${base_libdir} localstatedir=${localstatedir}
> +		libdir=${libdir} base_libdir=${base_libdir} fontconfigcachedir=${FONTCONFIG_CACHE_DIR}
>  else
>  	fc-cache
>  fi
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> index 797b321..7c5b4b4 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb
> @@ -37,6 +37,8 @@ DEBIAN_NOAUTONAME_fontconfig-utils = "1"
>  
>  inherit autotools pkgconfig
>  
> -EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts"
> +FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
> +
> +EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR}"
>  
>  BBCLASSEXTEND = "native"
> diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
> index 3907f25..c8c6018 100644
> --- a/scripts/postinst-intercepts/update_font_cache
> +++ b/scripts/postinst-intercepts/update_font_cache
> @@ -2,6 +2,4 @@
>  
>  PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir}\
>  					$D${bindir}/fc-cache --sysroot=$D
> -chown -R root:root $D${localstatedir}/cache/fontconfig
> -
> -
> +chown -R root:root $D${fontconfigcachedir}

This looks better but what sets fontconfigcachedir ?

Cheers,

Richard


