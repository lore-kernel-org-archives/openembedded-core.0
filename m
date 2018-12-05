Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D53A86D253
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 01:54:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB51sI6R014330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Dec 2018 17:54:19 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Dec 2018 17:54:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 5 Dec 2018 10:11:47 +0800
Message-ID: <1543975908-38890-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] pulseaudio: improve reproducibility
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
X-List-Received-Date: Wed, 05 Dec 2018 01:54:20 -0000
Content-Type: text/plain

Remove build host paths from generated binaries, the modification
is harmless for build time compiling and runtime executing.

[YOCTO #12638]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../pulseaudio/0001-improve-reproducibility.patch  | 50 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_12.2.bb                  |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch
new file mode 100644
index 0000000..b13adb2
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility.patch
@@ -0,0 +1,50 @@
+From e03d1d77471ee16c149590dd97085cf54be1e261 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 4 Dec 2018 16:29:18 +0800
+Subject: [PATCH] improve reproducibility
+
+- Do not define PA_CFLAGS with $CFLAGS which contains build host path,
+  macro PA_CFLAGS is used for debug log, the modification is harmless;
+
+- Tweak definition of PA_BUILDDIR and PA_SRCDIR with relative directory,
+  it is also harmless;
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac    | 2 +-
+ src/Makefile.am | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c9c414f..94a2167 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1452,7 +1452,7 @@ AS_IF([test "x$ax_pthread_ok" = "xyes"],
+ #            Output               #
+ ###################################
+ 
+-AC_DEFINE_UNQUOTED(PA_CFLAGS, "$CFLAGS", [The CFLAGS used during compilation])
++AC_DEFINE_UNQUOTED(PA_CFLAGS, "***", [The CFLAGS used during compilation])
+ 
+ # Check whether to build tests by default (as compile-test) or not
+ AC_ARG_ENABLE([default-build-tests],
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f4464d2..1ec0bfc 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -48,8 +48,8 @@ AM_CPPFLAGS = \
+ 	-I$(top_builddir)/src/modules \
+ 	-DPA_ALSA_PATHS_DIR=\"$(alsapathsdir)\" \
+ 	-DPA_ALSA_PROFILE_SETS_DIR=\"$(alsaprofilesetsdir)\" \
+-	-DPA_SRCDIR=\"$(abs_srcdir)\" \
+-	-DPA_BUILDDIR=\"$(abs_builddir)\" \
++	-DPA_SRCDIR=\"$(ac_srcdir)\" \
++	-DPA_BUILDDIR=\"$(ac_builddir)\" \
+ 	-DPULSE_LOCALEDIR=\"$(localedir)\"
+ AM_CFLAGS = -std=gnu11 \
+ 	$(PTHREAD_CFLAGS)
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
index 36d92bc..9cda50a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
@@ -2,6 +2,7 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
+           file://0001-improve-reproducibility.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "c42f1f1465e8df9859d023dc184734bf"
-- 
2.7.4


