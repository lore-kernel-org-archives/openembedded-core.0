Return-Path: <valentin.popa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E47AE6E7F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 17:30:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2014 09:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,833,1384329600"; d="scan'208";a="480377010"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.47])
	([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 12 Feb 2014 09:30:16 -0800
Message-ID: <52FBAFAB.6000000@intel.com>
Date: Wed, 12 Feb 2014 19:30:19 +0200
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1392142325-9258-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1392142325-9258-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] wayland/weston: upgrade to 1.4.0
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
X-List-Received-Date: Wed, 12 Feb 2014 17:30:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2014 08:12 PM, Valentin Popa wrote:
> tested on qemux86 and genericx86 with
> core-image-weston and core-image-sato
>
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>   .../wayland/wayland/just-scanner.patch             | 21 +++++++++++++---
>   .../wayland/{wayland_1.3.0.bb => wayland_1.4.0.bb} |  7 +++---
>   ...move-dependencie-of-wayland-scanner-flags.patch | 29 ++++++++++++++++++++++
>   .../wayland/{weston_1.3.1.bb => weston_1.4.0.bb}   | 12 ++++-----
>   4 files changed, 56 insertions(+), 13 deletions(-)
>   rename meta/recipes-graphics/wayland/{wayland_1.3.0.bb => wayland_1.4.0.bb} (83%)
>   create mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-dependencie-of-wayland-scanner-flags.patch
>   rename meta/recipes-graphics/wayland/{weston_1.3.1.bb => weston_1.4.0.bb} (89%)
>
> diff --git a/meta/recipes-graphics/wayland/wayland/just-scanner.patch b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
> index 234a9c5..ae9935e 100644
> --- a/meta/recipes-graphics/wayland/wayland/just-scanner.patch
> +++ b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
> @@ -1,3 +1,8 @@
> +From f674544d4f6f5f763e449207da77a561b22eff97 Mon Sep 17 00:00:00 2001
> +From: Valentin Popa <valentin.popa@intel.com>
> +Date: Fri, 7 Feb 2014 16:36:47 +0200
> +Subject: [PATCH] just scanner
> +
>   We only build wayland-native for the scanner, so disable the bits we don't
>   actually need.  This gives us a small speed up but importantly should allow
>   wayland-native to compile on older hosts such as CentOS 5 which currently fails:
> @@ -10,22 +15,27 @@ wayland-native to compile on older hosts such as CentOS 5 which currently fails:
>   
>   Upstream-Status: Inappropriate
>   Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> +---
> + Makefile.am     | 2 +-
> + src/Makefile.am | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/Makefile.am b/Makefile.am
> -index 306d7b3..571fe89 100644
> +index 99607b0..ecce1f1 100644
>   --- a/Makefile.am
>   +++ b/Makefile.am
>   @@ -2,7 +2,7 @@ if BUILD_DOCS
>    doc_subdir = doc
>    endif
>    
> --SUBDIRS = src protocol $(doc_subdir) tests cursor
> -+SUBDIRS = src protocol $(doc_subdir)
> +-SUBDIRS = protocol src $(doc_subdir) tests cursor
> ++SUBDIRS = protocol src $(doc_subdir)
>    
>    ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
>    
>   diff --git a/src/Makefile.am b/src/Makefile.am
> -index e1d04ea..702342e 100644
> +index 15f44a5..b938d17 100644
>   --- a/src/Makefile.am
>   +++ b/src/Makefile.am
>   @@ -1,4 +1,4 @@
> @@ -34,3 +44,6 @@ index e1d04ea..702342e 100644
>    noinst_LTLIBRARIES = libwayland-util.la
>    
>    include_HEADERS =				\
> +--
> +1.8.3.2
> +
> diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
> similarity index 83%
> rename from meta/recipes-graphics/wayland/wayland_1.3.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.4.0.bb
> index 212e08a..ff18083 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.3.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.4.0.bb
> @@ -11,10 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
>                       file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
>   
>   SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
> -SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
> +SRC_URI[md5sum] = "332cf9191837be12638a29265ed7cf46"
> +SRC_URI[sha256sum] = "18f33b9f15b4c8b662fb1968e7636e7926b419dfc48de8a164b3a3d7095c5a58"
>   
>   SRC_URI_append_class-native = " file://just-scanner.patch"
> +EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
>   
>   inherit autotools pkgconfig
>   
> @@ -24,7 +25,7 @@ BBCLASSEXTEND = "native"
>   DEPENDS_virtclass-native = "expat-native libffi-native"
>   DEPENDS = "expat libffi wayland-native"
>   
> -EXTRA_OECONF_virtclass-native = "--disable-documentation"
> +EXTRA_OECONF_virtclass-native = "--disable-documentation --enable-scanner"
>   EXTRA_OECONF = "--disable-documentation --disable-scanner"
>   
>   # Wayland installs a M4 macro for other projects to use, which uses the target
> diff --git a/meta/recipes-graphics/wayland/weston/0001-remove-dependencie-of-wayland-scanner-flags.patch b/meta/recipes-graphics/wayland/weston/0001-remove-dependencie-of-wayland-scanner-flags.patch
> new file mode 100644
> index 0000000..57c8490
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-remove-dependencie-of-wayland-scanner-flags.patch
> @@ -0,0 +1,29 @@
> +From a0335393ddde2228c84eda1081b5d7b175f78a94 Mon Sep 17 00:00:00 2001
> +From: Valentin Popa <valentin.popa@intel.com>
> +Date: Fri, 7 Feb 2014 16:59:58 +0200
> +Subject: [PATCH] remove dependencie of wayland-scanner flags
> +
> +weston doesn't make use of wayland-scanner flags,
> +it only uses the -native- wayland-scanner for protocol.
> +
> +Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index cce1850..8775eb9 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -482,7 +482,7 @@ if test x$wayland_scanner = x; then
> + 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
> + fi
> +
> +-PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
> ++#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
> + AC_PATH_PROG(XMLLINT, xmllint)
> + AC_ARG_WITH([dtddir],
> + 	    AS_HELP_STRING([--with-dtddir],
> +--
> +1.8.3.2
> +
> diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> similarity index 89%
> rename from meta/recipes-graphics/wayland/weston_1.3.1.bb
> rename to meta/recipes-graphics/wayland/weston_1.4.0.bb
> index 585de66..2cac0ad 100644
> --- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
> @@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
>   
>   SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>              file://weston.png \
> -           file://weston.desktop"
> -SRC_URI[md5sum] = "ffe7c3bc0e7eb39a305cbbea8c7766f3"
> -SRC_URI[sha256sum] = "f7141334b141ae1a6435bd03bfdb01b7fb628f39259164f201e7e71c8d815bc7"
> +           file://weston.desktop \
> +           file://0001-remove-dependencie-of-wayland-scanner-flags.patch"
> +SRC_URI[md5sum] = "4438d2b1f3c9ba9a4a2b10d89fac6fd0"
> +SRC_URI[sha256sum] = "74a2319d98e9cdb1acf24659699719aa89ac268cf549759271e326edc5f9ed64"
>   
>   
>   inherit autotools pkgconfig useradd
> @@ -18,18 +19,17 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
>   DEPENDS += "wayland virtual/egl pango"
>   
>   EXTRA_OECONF = "--enable-setuid-install \
> -                --disable-tablet-shell \
>                   --disable-xwayland \
>                   --enable-simple-clients \
>                   --enable-clients \
> -                --enable-demo-clients \
> +                --enable-demo-clients-install \
>                   --disable-simple-egl-clients \
>                   --disable-libunwind \
>                   --disable-rpi-compositor \
>                   --disable-rdp-compositor"
>   
>   
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland', '', d)} \
>                      ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>                      ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
>                     "
Please ignore this. After discussing with Ross, I'll split this patch 
for weston and wayland.

