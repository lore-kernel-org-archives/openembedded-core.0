Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 259FF6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 03:31:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8B3VHAd015450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 20:31:19 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 10 Sep 2014 20:31:17 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Sep 2014 11:31:09 +0800
Message-ID: <1410406269-926-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] xserver-xorg: remove aarch64.patch
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
X-List-Received-Date: Thu, 11 Sep 2014 03:31:28 -0000
Content-Type: text/plain

Patch aarch64.patch adds aarch64 support for xserver-xorg 1.13.1 in
header file servermd.h. And aarch64 is supported in version 1.15.1
already and the patch causes redefine error.

So remove aarch64.patch.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xorg-xserver/xserver-xorg/aarch64.patch        | 35 ----------------------
 .../xorg-xserver/xserver-xorg_1.15.1.bb            |  1 -
 2 files changed, 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch
deleted file mode 100644
index 045e24a..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/aarch64.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Subject: Add AArch64 support to xserver-xorg
-Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-lnx_video.c parts are not existing in 1.14 branch.
-
-Xserver was checked in AArch64 fastmodel (commercial one with graphics support).
-
-http://patchwork.freedesktop.org/patch/12785/
-
-Upstream-Status: Pending
-
----
- include/servermd.h                      |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
---- xorg-server-1.13.1.orig/include/servermd.h
-+++ xorg-server-1.13.1/include/servermd.h
-@@ -243,10 +243,17 @@ SOFTWARE.
- #define BITMAP_BIT_ORDER       LSBFirst
- #define GLYPHPADBYTES		4
- /* ???? */
- #endif                          /* AMD64 */
- 
-+#if defined(__aarch64__) || defined(aarch64) || defined(__aarch64)
-+#define IMAGE_BYTE_ORDER	MSBFirst
-+#define BITMAP_BIT_ORDER       MSBFirst
-+#define GLYPHPADBYTES		4
-+/* ???? */
-+#endif                          /* AArch64 */
-+
- #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
- 	defined(__alpha__) || defined(__alpha) || \
- 	defined(__i386__) || \
- 	defined(__s390x__) || defined(__s390__)
- 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
index 22ac604..e952e60 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
@@ -4,7 +4,6 @@ require xserver-xorg.inc
 SRC_URI += "file://crosscompile.patch \
             file://fix_open_max_preprocessor_error.patch \
             file://mips64-compiler.patch \
-            file://aarch64.patch \
             file://xorg-CVE-2013-6424.patch \
             file://xshmfence-option.patch \
            "
-- 
1.9.1


