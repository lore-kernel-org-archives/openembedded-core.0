Return-Path: <psidhu@gateworks.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id DC85273CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 17:23:29 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so129161457pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1OmaduB7eRYUQ76UA8Y8jUfLklnqnRRFFLOR2C9XDRM=;
	b=Tt/OfHsf4JdLGIepP67ogmdfnkOViaB0JtJHSiDSBsBLq8/Yx90lM3wGAiDqCSCJS4
	gykcH1JDkoj26hPxwX2QhtotaM4DMeuers0fMfLv7iiqD3kWWwjR+6uac8Ekl0ZTwigP
	7tmIWRes4sceU3bOCkupLr1Kj+v+JKMcfKQUumj++8akyWmjJJsPtwzeyB9IK55yETeP
	fAfB5s4zLy0U8pDU8wl1SXCBbd1x6FnsQMfI0Q0IQEgPGxhuk5SQf5n9XkBFgPhA/wGg
	CFYdx1qOMXGJ4zj+lRrfh0WIj9706pTfVsCVd7nojp6ahvtDBXyuljyyWaXp80gVOo2o
	91wQ==
X-Gm-Message-State: ALoCoQnGnU5Bhay4+m8ytIb4B7Es6o6FKYcrEHKHSw1XJMNYUDl01Z9Mtda+tZ33zzdTTfpoZq70
X-Received: by 10.66.242.138 with SMTP id wq10mr25560212pac.2.1445621009875;
	Fri, 23 Oct 2015 10:23:29 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by smtp.gmail.com with ESMTPSA id
	ir5sm20005011pbc.13.2015.10.23.10.23.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Oct 2015 10:23:29 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: alexander.kanavin@intel.com
Date: Fri, 23 Oct 2015 10:23:07 -0700
Message-Id: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.6.2
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Fri, 23 Oct 2015 17:23:31 -0000

From upstream webkit: fd15a368fa73fe08d91cc1dd7ef05c0c5a3ae851

Webkit will fail to compile under certain circumstances. Please see
https://bugs.webkit.org/show_bug.cgi?id=149172 for more details.

Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
---
 ...ailure-with-ACCELERATED_2D_CANVAS-when-ca.patch | 35 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch

diff --git a/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
new file mode 100644
index 0000000..5d43e0f
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch
@@ -0,0 +1,35 @@
+From 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefba4 Mon Sep 17 00:00:00 2001
+From: "clopez@igalia.com" <clopez@igalia.com>
+Date: Tue, 15 Sep 2015 21:50:18 +0000
+Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when cairo-gl has
+ built with OpenGLESv2 support only.
+ https://bugs.webkit.org/show_bug.cgi?id=149172
+
+Reviewed by Martin Robinson.
+
+No new tests, no behavior change.
+
+* platform/graphics/glx/GLContextGLX.cpp:
+(WebCore::GLContextGLX::cairoDevice):
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@189826 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/WebCore/platform/graphics/glx/GLContextGLX.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
+index 7890d8d..4ed3a43 100644
+--- a/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
++++ b/Source/WebCore/platform/graphics/glx/GLContextGLX.cpp
+@@ -266,7 +266,7 @@ cairo_device_t* GLContextGLX::cairoDevice()
+     if (m_cairoDevice)
+         return m_cairoDevice;
+ 
+-#if ENABLE(ACCELERATED_2D_CANVAS)
++#if ENABLE(ACCELERATED_2D_CANVAS) && CAIRO_HAS_GLX_FUNCTIONS
+     m_cairoDevice = cairo_glx_device_create(sharedX11Display(), m_context);
+ #endif
+ 
+-- 
+2.6.2
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index e29666a..68634a9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
   file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
+  file://0002-GTK-Build-failure-with-ACCELERATED_2D_CANVAS-when-ca.patch \
   file://gcc5.patch \
   "
 SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
-- 
2.6.2


