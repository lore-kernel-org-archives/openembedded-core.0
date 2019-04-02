Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1B7F7CFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 09:36:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3297QL0026484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 02:09:12 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Apr 2019 02:08:35 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2019 17:08:33 +0800
Message-ID: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
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
X-List-Received-Date: Tue, 02 Apr 2019 09:36:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix below compile error with -Werror=maybe-uninitialized

| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|      *out_gltype = gltype;
|      ~~~~~~~~~~~~^~~~~~~~
| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|      *out_glintformat = glintformat;
|      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...mpile-error-with-Werror-maybe-uninitializ.patch | 40 ++++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb      |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
new file mode 100644
index 0000000..3c99d25
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch
@@ -0,0 +1,40 @@
+From e05ee89fcc978fceccab3e4724a3a37f7a338499 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 2 Apr 2019 14:48:49 +0800
+Subject: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
+
+fix below compile error with -Werror=maybe-uninitialized
+
+| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|      *out_gltype = gltype;
+|      ~~~~~~~~~~~~^~~~~~~~
+| ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|      *out_glintformat = glintformat;
+|      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/GNOME/cogl/pull/4/commits/be7a7b983952d3f2ce2cbaa7b89f413b92e15066]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ cogl/driver/gl/gles/cogl-driver-gles.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cogl/driver/gl/gles/cogl-driver-gles.c b/cogl/driver/gl/gles/cogl-driver-gles.c
+index e94449f..a59d815 100644
+--- a/cogl/driver/gl/gles/cogl-driver-gles.c
++++ b/cogl/driver/gl/gles/cogl-driver-gles.c
+@@ -74,9 +74,9 @@ _cogl_driver_pixel_format_to_gl (CoglContext *context,
+                                  GLenum *out_gltype)
+ {
+   CoglPixelFormat required_format;
+-  GLenum glintformat;
++  GLenum glintformat = 0;
+   GLenum glformat = 0;
+-  GLenum gltype;
++  GLenum gltype = 0;
+ 
+   required_format = format;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
index 5901062..5ddeb4a 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb
@@ -1,7 +1,9 @@
 require cogl-1.0.inc
 
 SRC_URI += "file://test-backface-culling.c-fix-may-be-used-uninitialize.patch \
-            file://0001-Fix-an-incorrect-preprocessor-conditional.patch"
+            file://0001-Fix-an-incorrect-preprocessor-conditional.patch \
+            file://0001-cogl-fix-compile-error-with-Werror-maybe-uninitializ.patch \
+           "
 SRC_URI[archive.md5sum] = "d53b708ca7c4af03d7254e46945d6b33"
 SRC_URI[archive.sha256sum] = "39a718cdb64ea45225a7e94f88dddec1869ab37a21b339ad058a9d898782c00d"
 
-- 
2.7.4


