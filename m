Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 2D11C765DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id CB1D91EE081E;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VI4cvX7ircBv; Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 8A5F81EE081A;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:27 +0200
Message-Id: <d3bcbd9587a4a4dcfec1b75f427e24361dfa3657.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 6/8] [busybox] allow overriding compiler name in KConfig
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
X-List-Received-Date: Tue, 23 Aug 2016 07:25:41 -0000

The KConfig infrastructure hardwires the compiler name to gcc, which breaks
the BUILD_CC feature. This is needed even when cross compiling because
make *config rely on the kconfig infrastructure
---
 meta/recipes-core/busybox/busybox.inc                                                |  5 +++++
 meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch | 27 +++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 39c2eef..defeb2e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -47,6 +47,11 @@ CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
 
+export HOSTCC = "${BUILD_CC}"
+export HOSTCXX = "${BUILD_CXX}"
+SRC_URI_append = " \
+           file://0001-Allow-overriding-of-host-compiler-names.patch \
+"
 inherit cml1 systemd update-rc.d ptest
 
 # internal helper
diff --git a/meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch b/meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch
new file mode 100644
index 0000000..9df0035
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-Allow-overriding-of-host-compiler-names.patch
@@ -0,0 +1,27 @@
+From a4dc894195ccf58b60e867a170c27f6a4747b094 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
+Date: Wed, 17 Aug 2016 22:30:48 +0200
+Subject: [PATCH] Allow overriding of host compiler names
+
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 064d037..d1c4494 100644
+--- a/Makefile
++++ b/Makefile
+@@ -271,8 +271,8 @@ export quiet Q KBUILD_VERBOSE
+ # Look for make include files relative to root of kernel src
+ MAKEFLAGS += --include-dir=$(srctree)
+ 
+-HOSTCC  	= gcc
+-HOSTCXX  	= g++
++HOSTCC  	?= gcc
++HOSTCXX  	?= g++
+ HOSTCFLAGS	:=
+ HOSTCXXFLAGS	:=
+ # We need some generic definitions
+-- 
+2.8.1
+
-- 
git-series 0.8.9

