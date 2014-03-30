Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 210EA6F751
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 10:30:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2UAUbXJ029411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 03:30:37 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 30 Mar 2014 03:30:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 30 Mar 2014 06:30:33 -0400
Message-ID: <f54eb96dbc54cf4fce2cfee8e865a1e6cc41c905.1396175372.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1396175372.git.liezhi.yang@windriver.com>
References: <cover.1396175372.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gtk+3: set proper FLAGS for native
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
X-List-Received-Date: Sun, 30 Mar 2014 10:30:37 -0000
Content-Type: text/plain

The target gtk+3 does a native build in its "native" directory, we need
set proper FLAGS for it, otherwise, there might be build failures.

[YOCTO #6070]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gtk+/gtk+3/fix-flags-for-native.patch          |   40 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb            |    4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch b/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
new file mode 100644
index 0000000..800f52c
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
@@ -0,0 +1,40 @@
+From 5e16904f94b5f5961f8f6e75716e6d7d228de119 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 28 Mar 2014 03:10:12 +0000
+Subject: [PATCH] gtk/native/Makefile.am: set proper FLAGS for native
+
+This Makefile.am has set:
+CC = @CC_FOR_BUILD@
+It shoudl also set:
+CFLAGS = @CFLAGS_FOR_BUILD@
+
+Otherwise there might be build failures when doing cross build, for example,
+several CFLAGS are special to arm or mips, and the native gcc can't recognize
+them.
+
+The similar to CPPFLAGS and LDFLAGS.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ gtk/native/Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gtk/native/Makefile.am b/gtk/native/Makefile.am
+index 64899e9..a1c814a 100644
+--- a/gtk/native/Makefile.am
++++ b/gtk/native/Makefile.am
+@@ -3,6 +3,9 @@ AM_CFLAGS = @CFLAGS_FOR_BUILD@
+ CPP = @CPP_FOR_BUILD@
+ AM_CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+ AM_LDFLAGS = @LDFLAGS_FOR_BUILD@
++CFLAGS = @CFLAGS_FOR_BUILD@
++CPPFLAGS = @CPPFLAGS_FOR_BUILD@
++LDFLAGS = @LDFLAGS_FOR_BUILD@
+ 
+ if CROSS_COMPILING
+ if !USE_EXTERNAL_ICON_CACHE
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb b/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
index 9f8c6ab..d0174f6 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.10.7.bb
@@ -4,7 +4,9 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://hardcoded_libtool.patch \
-           file://fix-build-when-wayland-backend-enabled.patch"
+           file://fix-build-when-wayland-backend-enabled.patch \
+           file://fix-flags-for-native.patch \
+          "
 
 SRC_URI[md5sum] = "18a81944a8506231529a76bf2b68372b"
 SRC_URI[sha256sum] = "b7e9de15385031cff43897e7e59f6692eaabf500f36eef80e6b9d6486ad49427"
-- 
1.7.10.4


