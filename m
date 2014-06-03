Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDBE6FA49
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 04:51:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s534pMsb014474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jun 2014 21:51:22 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Jun 2014 21:51:22 -0700
Message-ID: <538D5448.2040308@windriver.com>
Date: Tue, 3 Jun 2014 12:51:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Tim Orling <ticotimo@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1400774540-4405-1-git-send-email-ticotimo@gmail.com>
	<1400774540-4405-2-git-send-email-ticotimo@gmail.com>
In-Reply-To: <1400774540-4405-2-git-send-email-ticotimo@gmail.com>
Subject: Re: [RFC/RFT 1/2] wayland: upgrade to 1.5.0
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
X-List-Received-Date: Tue, 03 Jun 2014 04:51:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/23/2014 12:02 AM, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>
> * update disable-macro-checks-not-used-for-scanner.patch
>    = trivial change to non-patched text (+ posix_fallocate)
> * drop just-scanner.patch, no longer needed

I'm afraid that we can't drop this patch, I met the same error on
CentOS 5.10 again, as described in the original patch:

 From f674544d4f6f5f763e449207da77a561b22eff97 Mon Sep 17 00:00:00 2001
From: Valentin Popa <valentin.popa@intel.com>
Date: Fri, 7 Feb 2014 16:36:47 +0200
Subject: [PATCH] just scanner

We only build wayland-native for the scanner, so disable the bits we don't
actually need.  This gives us a small speed up but importantly should allow
wayland-native to compile on older hosts such as CentOS 5 which currently fails:

| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first 
use in this function)
| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or 
directory
| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first 
use in this function)
| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use 
in this function)
| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use 
in this function)

Upstream-Status: Inappropriate
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Valentin Popa <valentin.popa@intel.com>

// Robert

>
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>   ...disable-macro-checks-not-used-for-scanner.patch |  2 +-
>   .../wayland/wayland/just-scanner.patch             | 49 ----------------------
>   .../wayland/{wayland_1.4.0.bb => wayland_1.5.0.bb} |  7 ++--
>   3 files changed, 4 insertions(+), 54 deletions(-)
>   delete mode 100644 meta/recipes-graphics/wayland/wayland/just-scanner.patch
>   rename meta/recipes-graphics/wayland/{wayland_1.4.0.bb => wayland_1.5.0.bb} (89%)
>
> diff --git a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
> index bf499bb..cd8bc55 100644
> --- a/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
> +++ b/meta/recipes-graphics/wayland/wayland/disable-macro-checks-not-used-for-scanner.patch
> @@ -20,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
>   +++ b/configure.ac
>   @@ -41,16 +41,16 @@ AC_SUBST(GCC_CFLAGS)
>
> - AC_CHECK_FUNCS([accept4 mkostemp])
> + AC_CHECK_FUNCS([accept4 mkostemp posix_fallocate])
>
>   -AC_CHECK_DECL(SFD_CLOEXEC,[],
>   -	      [AC_MSG_ERROR("SFD_CLOEXEC is needed to compile wayland")],
> diff --git a/meta/recipes-graphics/wayland/wayland/just-scanner.patch b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
> deleted file mode 100644
> index ae9935e..0000000
> --- a/meta/recipes-graphics/wayland/wayland/just-scanner.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From f674544d4f6f5f763e449207da77a561b22eff97 Mon Sep 17 00:00:00 2001
> -From: Valentin Popa <valentin.popa@intel.com>
> -Date: Fri, 7 Feb 2014 16:36:47 +0200
> -Subject: [PATCH] just scanner
> -
> -We only build wayland-native for the scanner, so disable the bits we don't
> -actually need.  This gives us a small speed up but importantly should allow
> -wayland-native to compile on older hosts such as CentOS 5 which currently fails:
> -
> -| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first use in this function)
> -| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
> -| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
> -| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use in this function)
> -| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use in this function)
> -
> -Upstream-Status: Inappropriate
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ----
> - Makefile.am     | 2 +-
> - src/Makefile.am | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 99607b0..ecce1f1 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -2,7 +2,7 @@ if BUILD_DOCS
> - doc_subdir = doc
> - endif
> -
> --SUBDIRS = protocol src $(doc_subdir) tests cursor
> -+SUBDIRS = protocol src $(doc_subdir)
> -
> - ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
> -
> -diff --git a/src/Makefile.am b/src/Makefile.am
> -index 15f44a5..b938d17 100644
> ---- a/src/Makefile.am
> -+++ b/src/Makefile.am
> -@@ -1,4 +1,4 @@
> --lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
> -+#lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
> - noinst_LTLIBRARIES = libwayland-util.la
> -
> - include_HEADERS =				\
> ---
> -1.8.3.2
> -
> diff --git a/meta/recipes-graphics/wayland/wayland_1.4.0.bb b/meta/recipes-graphics/wayland/wayland_1.5.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/wayland/wayland_1.4.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.5.0.bb
> index 9f6419d..b1ae59e 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.4.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.5.0.bb
> @@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
>                       file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
>
>   SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "332cf9191837be12638a29265ed7cf46"
> -SRC_URI[sha256sum] = "18f33b9f15b4c8b662fb1968e7636e7926b419dfc48de8a164b3a3d7095c5a58"
> -
> -SRC_URI_append_class-native = " file://just-scanner.patch \
> +SRC_URI[md5sum] = "1d882776b27329b91d2d500b6d66dd1d"
> +SRC_URI[sha256sum] = "0069e1e9af888b3e05384380ad8cc6c976ea3e81d08ba19b7675ce1d693a41b5"
> +SRC_URI_append_class-native = " \
>       file://disable-macro-checks-not-used-for-scanner.patch \
>       "
>   EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
>

