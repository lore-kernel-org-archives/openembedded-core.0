Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id CF4267CE73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 13:08:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z11so2689781wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 06:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7NtyM/aUzzanst4MRwVGvllH6kUKIn1oUz6o5T7AzA8=;
	b=cV+9ntcYIsnS642gNf0QPaDuWjV+9OTmABpC3WN0/ESswl2j/R93uH+gfes8Dm+P01
	0smBp1m2z/O2mWKsm8thqVn0N7J2LPtHsEEbaV8Nq91WmL4bLse8jF1bKNFn7kY4nsw+
	utL55jrHIGuMT4Foj/NFLx/glNmtt+r2F5beAMFLmE7SiVChyOp01h8mGGuVt2scTArZ
	eZBhIY7TX6QX9KAFZHOqWRFmWHMifgkYmAwxM9PTozaZoWnseVrfAS9P9cj21KtbYcHe
	99NYsdyCC+2TKgpBEyEvfGMaQJxG+6Mp2yoPTfYLJCCQRPNcTSjaPi5eIOjIAF58UjNf
	6lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7NtyM/aUzzanst4MRwVGvllH6kUKIn1oUz6o5T7AzA8=;
	b=P8hZJHTEzDi3f63+UWSaYHGZ9Dh0NbaxBzkZk1tqUJeKxr4qq4rx3hiEBC3kLiEyfV
	80clwNMjf1Jyo+ExYppXa8UbyYwiCKUNv18SiiQFIjh0hGruigvwO+pHYiVNVoDhQ4ob
	brIdV2i2zmzyGKDLQ10lZctfDXHMcSamJYDke0Kx8tpQGESu2uK7Fd0577Ywe00hGkEc
	9CpRLLuboNgMlz0iooXmNaoWvcHbhWLzY5SZRygn4yrXlUQd5axOFxx8gV3EFgQXCmic
	gNfmQCmCI3SR3U9MDCFWsfL97IxtMLKz+usL6l7GNYrArpnjt/a1aCkwLuDhSxRbca1N
	uzRQ==
X-Gm-Message-State: APjAAAVN5gdOGZyvdTJRFko+HCp/Hf79CrIQZ0apXf95HzxyQRF9Ctdq
	z5s+TipflTmknkHGl9m1BSJO6e+d
X-Google-Smtp-Source: APXvYqxp5BejBdIuXIPWF9bhLKz289ed1HYlGiby3xI5V3InobPbG9cC2HrGrQ13GZRvfvWeHBjoVQ==
X-Received: by 2002:a1c:c18d:: with SMTP id r135mr2431137wmf.112.1553173710156;
	Thu, 21 Mar 2019 06:08:30 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	e135sm9968776wmg.24.2019.03.21.06.08.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 06:08:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 14:08:12 +0100
Message-Id: <20190321130812.7452-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glew: Fix build errors at recipes depending on glew
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
X-List-Received-Date: Thu, 21 Mar 2019 13:08:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Glew headers override mesa headers by setting mesa's include guards. This
stopped working since mesa renamed them.

Fixes errors like this in depending recipes:

| <...>/recipe-sysroot/usr/include/GL/glext.h:12066:105: error: conflicting declaration 'typedef void (* PFNGLFRAGMENTLIGHTFVSGIXPROC)(GLenum, GLenum, const GLfloat*)'
|  typedef void (APIENTRYP PFNGLFRAGMENTLIGHTFVSGIXPROC) (GLenum light, GLenum pname, const GLfloat *params);
|                                                                                                          ^

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...mpilation-with-current-mesa-versions.patch | 71 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.1.0.bb      |  3 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch

diff --git a/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch b/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
new file mode 100644
index 0000000000..6ab1794fd1
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
@@ -0,0 +1,71 @@
+From 7f65a36866f4e24dd1446fe1c9d21424f28bcabd Mon Sep 17 00:00:00 2001
+From: Deve <deveee@gmail.com>
+Date: Wed, 14 Nov 2018 21:07:29 +0100
+Subject: [PATCH] Fixed compilation with current mesa versions.
+
+As you can see in
+https://cgit.freedesktop.org/mesa/mesa/tree/include/GL/glext.h
+now the file uses __gl_glext_h_ instead of __glext_h_
+It's precisely caused by commit f7d42ee7d319256608ad60778f6787c140badada
+
+Backoprt notes: 
+
+* The original patch adjusts auto/src/glew_head.h only
+* include/GL/glew.h is not part of git repo and gets created on tarball
+  creation
+
+=> patch include/GL/glew.h either to cause the desired fix
+
+Upstream-Status: Backport [1]
+
+[1] https://github.com/nigels-com/glew/commit/7f65a36866f4e24dd1446fe1c9d21424f28bcabd
+---
+ auto/src/glew_head.h | 3 ++-
+ include/GL/glew.h    | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/auto/src/glew_head.h b/auto/src/glew_head.h
+index c19cefb..8f313d9 100644
+--- a/auto/src/glew_head.h
++++ b/auto/src/glew_head.h
+@@ -14,7 +14,7 @@
+ #if defined(__REGAL_H__)
+ #error Regal.h included before glew.h
+ #endif
+-#if defined(__glext_h_) || defined(__GLEXT_H_)
++#if defined(__glext_h_) || defined(__GLEXT_H_) || defined(__gl_glext_h_)
+ #error glext.h included before glew.h
+ #endif
+ #if defined(__gl_ATI_h_)
+@@ -30,6 +30,7 @@
+ #define __X_GL_H
+ #define __glext_h_
+ #define __GLEXT_H_
++#define __gl_glext_h_
+ #define __gl_ATI_h_
+ 
+ #if defined(_WIN32)
+diff --git a/include/GL/glew.h b/include/GL/glew.h
+index b5b6987..a9f9e4b 100644
+--- a/include/GL/glew.h
++++ b/include/GL/glew.h
+@@ -93,7 +93,7 @@
+ #if defined(__REGAL_H__)
+ #error Regal.h included before glew.h
+ #endif
+-#if defined(__glext_h_) || defined(__GLEXT_H_)
++#if defined(__glext_h_) || defined(__GLEXT_H_) || defined(__gl_glext_h_)
+ #error glext.h included before glew.h
+ #endif
+ #if defined(__gl_ATI_h_)
+@@ -109,6 +109,7 @@
+ #define __X_GL_H
+ #define __glext_h_
+ #define __GLEXT_H_
++#define __gl_glext_h_
+ #define __gl_ATI_h_
+ 
+ #if defined(_WIN32)
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/glew/glew_2.1.0.bb b/meta/recipes-graphics/glew/glew_2.1.0.bb
index be725e0530..18e6909aa7 100644
--- a/meta/recipes-graphics/glew/glew_2.1.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.1.0.bb
@@ -6,7 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
-           file://no-strip.patch"
+           file://no-strip.patch \
+           file://0001-Fixed-compilation-with-current-mesa-versions.patch"
 
 SRC_URI[md5sum] = "b2ab12331033ddfaa50dc39345343980"
 SRC_URI[sha256sum] = "04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95"
-- 
2.20.1


