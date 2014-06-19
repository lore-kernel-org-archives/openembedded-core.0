Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 075826FE9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 08:33:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,506,1400018400"; d="scan'208";a="53240740"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 19 Jun 2014 10:33:59 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Thu, 19 Jun 2014 10:33:58 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Thu, 19 Jun 2014 10:33:58 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2014 10:33:59 +0200
Message-ID: <1403166839-5909-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] eglibc (2.19): fix hardcoded /sbin path
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
X-List-Received-Date: Thu, 19 Jun 2014 08:34:11 -0000
Content-Type: text/plain

Apply for ldconfig and sln packages.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../eglibc/eglibc-2.19/fix_am_rootsbindir.patch    | 32 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |  2 +-
 meta/recipes-core/eglibc/eglibc.inc                | 13 +++++----
 meta/recipes-core/eglibc/eglibc_2.19.bb            |  3 +-
 4 files changed, 42 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/fix_am_rootsbindir.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/fix_am_rootsbindir.patch b/meta/recipes-core/eglibc/eglibc-2.19/fix_am_rootsbindir.patch
new file mode 100644
index 0000000..ac1e2e8
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/fix_am_rootsbindir.patch
@@ -0,0 +1,32 @@
+sysdeps/gnu/configure.ac: handle correctly $libc_cv_rootsbindir
+
+Upstream-Status:Pending
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+
+diff --git a/libc/sysdeps/gnu/configure b/libc/sysdeps/gnu/configure
+index e7f0e43..687beab 100644
+--- a/libc/sysdeps/gnu/configure
++++ b/libc/sysdeps/gnu/configure
+@@ -42,6 +42,6 @@ case "$prefix" in
+   else
+     libc_cv_localstatedir=$localstatedir
+    fi
+-  libc_cv_rootsbindir=/sbin
++  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
+   ;;
+ esac
+diff --git a/libc/sysdeps/gnu/configure.ac b/libc/sysdeps/gnu/configure.ac
+index ce251df..57c1e77 100644
+--- a/libc/sysdeps/gnu/configure.ac
++++ b/libc/sysdeps/gnu/configure.ac
+@@ -42,6 +42,6 @@ case "$prefix" in
+   else
+     libc_cv_localstatedir=$localstatedir
+    fi
+-  libc_cv_rootsbindir=/sbin
++  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
+   ;;
+ esac
+-- 
+2.0.0
+
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 6721819..d5d407f 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -39,7 +39,7 @@ FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
 FILES_libmemusage = "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
-FILES_sln = "/sbin/sln"
+FILES_sln = "${base_sbindir}/sln"
 FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 3a623bb..68128e9 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -43,11 +43,14 @@ require eglibc-options.inc
 
 LEAD_SONAME = "libc.so"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
-                       ac_cv_path_BASH_SHELL=${base_bindir}/bash \
-                       libc_cv_localedir=${localedir} \
-		       libc_cv_ssp=no \
-		       "
+CACHED_CONFIGUREVARS += " \
+  ac_cv_path_KSH=${base_bindir}/bash \
+  ac_cv_path_BASH_SHELL=${base_bindir}/bash \
+  libc_cv_slibdir=${base_libdir} \
+  libc_cv_rootsbindir=${base_sbindir} \
+  libc_cv_localedir=${localedir} \
+  libc_cv_ssp=no \
+"
 
 GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_class-nativesdk = ""
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 10b4bb1..2d354cb 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://fix-tibetian-locales.patch \
            file://ppce6500-32b_slow_ieee754_sqrt.patch \
            file://grok_gold.patch \
+           file://fix_am_rootsbindir.patch;striplevel=2 \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
@@ -66,8 +67,6 @@ python __anonymous () {
                                    d.getVar('TARGET_OS', True))
 }
 
-export libc_cv_slibdir = "${base_libdir}"
-
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile \
                 --disable-debug --without-gd \
-- 
2.0.0


