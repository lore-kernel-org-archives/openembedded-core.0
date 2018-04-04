Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id AD18E746F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599831"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:10 +0300
Message-Id: <20180404111321.10824-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/22] gnome-desktop3: update to 3.28.0
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:05 -0000

Rebase 0001-Disable-libseccomp-sycall-filtering-mechanism.patch
Remove 0001-configure.ac-Remove-gnome-common-macro-calls.patch as
the lines it removes are no longer in upstream code.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ble-libseccomp-sycall-filtering-mechanism.patch | 31 ++++++++++++--------
 ...figure.ac-Remove-gnome-common-macro-calls.patch | 33 ----------------------
 ...desktop3_3.26.2.bb => gnome-desktop3_3.28.0.bb} |  5 ++--
 3 files changed, 21 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.26.2.bb => gnome-desktop3_3.28.0.bb} (81%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
index 10b07435c42..aa11e8a62ec 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
@@ -1,4 +1,4 @@
-From 9dfada06f8d2e02d7a04f793ba6e1d4a2aa5ffb7 Mon Sep 17 00:00:00 2001
+From 96753d85d8b53dd8f87b8f444892efffdbfab388 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 5 Oct 2017 14:54:17 +0300
 Subject: [PATCH] Disable libseccomp (sycall filtering mechanism)
@@ -7,32 +7,39 @@ Upstream forgot to make it optional, and it is not currently used in Yocto
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
- configure.ac | 11 -----------
- 1 file changed, 11 deletions(-)
+ configure.ac | 20 --------------------
+ 1 file changed, 20 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 86bcf1f..8911f19 100644
+index 118d04f..47c8894 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -157,17 +157,6 @@ else
- fi
+@@ -151,26 +151,6 @@ fi
  
  SECCOMP_PKG=""
+ enable_seccomp="no"
 -dnl Check for bubblewrap compatible platform
 -case $host_os in
 -  linux*)
--    PKG_CHECK_MODULES(LIBSECCOMP, [libseccomp])
--    SECCOMP_PKG="libseccomp"
+-    case $host_cpu in
+-      alpha|ia64|m68k|sh4|sparc64)
+-        enable_seccomp="no (not available on this architecture)"
+-        AC_MSG_WARN("seccomp not available on this architecture")
+-        ;;
+-      *)
+-        PKG_CHECK_MODULES(LIBSECCOMP, [libseccomp])
+-        SECCOMP_PKG="libseccomp"
+-        AC_DEFINE([ENABLE_SECCOMP], [1], [Define if using seccomp])
+-        enable_seccomp="yes"
+-        ;;
+-    esac
 -    AC_DEFINE_UNQUOTED(_GNU_SOURCE, 1, [Define to include GNU extensions])
 -    AC_DEFINE_UNQUOTED(HAVE_BWRAP, 1, [Define to 1 if Bubblewrap support is available])
--    AC_DEFINE([ENABLE_SECCOMP], [1], [Define if using seccomp])
 -    AC_DEFINE_UNQUOTED(INSTALL_PREFIX, "$prefix", [Path to library install prefix])
 -    ;;
 -esac
  
  dnl pkg-config dependency checks
  
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
deleted file mode 100644
index e95393c6b5c..00000000000
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-configure.ac-Remove-gnome-common-macro-calls.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 834bc861921fe0361f2d6a5b5716fc97a9519478 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 6 Jul 2017 13:13:45 +0300
-Subject: [PATCH] configure.ac: Remove gnome-common macro calls
-
-gnome-common is deprecated and these aren't doing much for us.
-
-Upstreamable fix would probably involve using autoconf-archive:
-Trying to avoid that dependency for now.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7adcf0e..bb7659d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,9 +71,6 @@ AC_SUBST(GNOME_DATE)
- AC_SUBST(GNOME_DATE_COMMENT_START)
- AC_SUBST(GNOME_DATE_COMMENT_END)
- 
--GNOME_COMPILE_WARNINGS([maximum])
--GNOME_MAINTAINER_MODE_DEFINES
--
- AC_ARG_ENABLE(deprecation_flags,
-               [AC_HELP_STRING([--enable-deprecation-flags],
-                               [use *_DISABLE_DEPRECATED flags @<:@default=no@:>@])],,
--- 
-2.1.4
-
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.0.bb
similarity index 81%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.0.bb
index 879dc9a2f6e..e23c0305775 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.0.bb
@@ -7,12 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "6cee2ecd677d87eaa0eb5ebfa7b45fb3"
-SRC_URI[archive.sha256sum] = "f7561a7a313fc474b2c390cd9696df1f5c1e1556080e43f4afe042b1060e5f2a"
+SRC_URI[archive.md5sum] = "3e7b67578307220a21688f28307b6789"
+SRC_URI[archive.sha256sum] = "f1df71c39e32147f6d58f53a9c05b964b00b7c98fbca090419355437c72fd59d"
 
 SRC_URI += " \
            file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-           file://0001-configure.ac-Remove-gnome-common-macro-calls.patch \
            file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch \
            "
 
-- 
2.16.1


