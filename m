Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.5141.1627123745240827406
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jul 2021 03:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 318D9240007;
	Sat, 24 Jul 2021 10:49:03 +0000 (UTC)
Date: Sat, 24 Jul 2021 12:49:02 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/8] mtools: update 4.0.32 -> 4.0.33
Message-ID: <YPvwHs6o9qCOlty8@piout.net>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
 <20210722224508.51967-5-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210722224508.51967-5-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 23/07/2021 00:45:05+0200, Alexander Kanavin wrote:
> Drop no-x11.gplv3.patch (the libraries are now
> dynamically enabled from configure.in).
> 

This update causes failures with wic because mcopy fails with:
mcopy: No directory slots

Full log here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/3686/steps/11/logs/stdio

12 builds failed so this should be easily reproducible.

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../mtools/disable-hardcoded-configs.patch     |  4 ++--
>  .../mtools/mtools/no-x11.gplv3.patch           | 18 ------------------
>  .../{mtools_4.0.32.bb => mtools_4.0.33.bb}     |  3 +--
>  3 files changed, 3 insertions(+), 22 deletions(-)
>  delete mode 100644 meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
>  rename meta/recipes-devtools/mtools/{mtools_4.0.32.bb => mtools_4.0.33.bb} (91%)
> 
> diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> index 81d76d060e..90573dcb1a 100644
> --- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> +++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
> @@ -1,4 +1,4 @@
> -From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 2001
> +From 7efdb47246413f938e3b2d8378ce9c363d98b371 Mon Sep 17 00:00:00 2001
>  From: Ed Bartosh <ed.bartosh@linux.intel.com>
>  Date: Tue, 13 Jun 2017 14:55:52 +0300
>  Subject: [PATCH] Disabled reading host configs.
> @@ -12,7 +12,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>   1 file changed, 8 deletions(-)
>  
>  diff --git a/config.c b/config.c
> -index bb13682..9186c77 100644
> +index 173eae0..0654cc1 100644
>  --- a/config.c
>  +++ b/config.c
>  @@ -836,14 +836,6 @@ void read_config(void)
> diff --git a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch b/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
> deleted file mode 100644
> index 9cb3e39f5c..0000000000
> --- a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Disable building with X11 support.
> -
> -Upstream-Status: Inappropriate [disable feature]
> -
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -diff -urN mtools-4.0.15.orig//Makefile.in mtools-4.0.15//Makefile.in
> ---- mtools-4.0.15.orig//Makefile.in	2010-10-17 08:41:09.000000000 -0700
> -+++ mtools-4.0.15//Makefile.in	2010-11-23 13:59:49.258258374 -0800
> -@@ -146,7 +146,7 @@
> - CXXFLAGS  = $(CPPFLAGS) $(DEFS) $(MYCXXFLAGS) -I. @extraincludedir@ -I@srcdir@ $(USERCFLAGS)
> - LINK      = $(CC) $(LDFLAGS) $(USERLDFLAGS) @extralibdir@
> - ALLLIBS   = $(USERLDLIBS) $(MACHDEPLIBS) $(SHLIB) $(LIBS)
> --X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) -lXau -lX11 $(LIBS)
> -+X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) $(LIBS)
> - X_CCFLAGS = $(X_CFLAGS) $(CFLAGS)
> - 
> - all:    mtools $(LINKS) mkmanifest @FLOPPYD@ mtools.1 mtools.5
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.32.bb b/meta/recipes-devtools/mtools/mtools_4.0.33.bb
> similarity index 91%
> rename from meta/recipes-devtools/mtools/mtools_4.0.32.bb
> rename to meta/recipes-devtools/mtools/mtools_4.0.33.bb
> index 501875037a..fd9febb01d 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.32.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.33.bb
> @@ -24,11 +24,10 @@ RRECOMMENDS_${PN}_libc-glibc = "\
>  	glibc-gconv-ibm866 \
>  	glibc-gconv-ibm869 \
>  	"
> -SRC_URI[sha256sum] = "62498cd51ae7c79a27c879a45f0d2a8c44e1404cbb901372d09b02735ef5ad89"
> +SRC_URI[sha256sum] = "1cb10f8e1e20302f86eaa9c5db262f4559d1dc94bd11fdda7692bc2d1beab954"
>  
>  SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
>             file://mtools-makeinfo.patch \
> -           file://no-x11.gplv3.patch \
>             file://clang_UNUSED.patch \
>             "
>  
> -- 
> 2.31.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
