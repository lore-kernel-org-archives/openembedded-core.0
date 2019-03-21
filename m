Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id DCE947CF75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 14:05:44 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t124so2835113wma.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 07:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1/V8dDFMeQzL26cgfgSkXojupbKDL14psKdspa8h0k4=;
	b=PFO9Mu5fVv8P6ZQdkUnGlibCEVrC063Q9II8pg+Ui+AVA+g8AWOrhGLE6EcsnmLcKr
	ld6l1ZIswsfcxc9nADWgKhdWdkLUVuU1GKLkLyMhCN1/61nfQ+5gt1Y7QP/4b6C8fjbi
	HkvtY8Q1dF+TQ5/WpRc13Wl6m2N9+yCnfLrz+8s86oNmhM4cyfNmkz5QzFBNLapS9yha
	GVBlef4SQHzv3uNl7satG7Em9a2vYlG+Rp62vNWQ+1zy6qKEOzgjyQfjfLxdO0yIlCS5
	p+rueDdB+tSmW6ygw2W1kAR7EsFdQoJF4CUXVW9ge7zIwAJE/PNXvH33iui2Gw8y+6nz
	kiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1/V8dDFMeQzL26cgfgSkXojupbKDL14psKdspa8h0k4=;
	b=ePgyQ0j07tvKWYlAkyBQ//Almmta8km22fkhW4Y78MXbTYjz5rYb9S4/av0JZJrnNs
	YN0JqzFpOr3fnp2s0WemCRG5StoPb8yN/s/T+jlTgXSSk8XNMPRC5xHhlhBk/TevAPAp
	rGFR13/bfafGwOBmKM39ynorvy9mifxv1akoKuMCvc9NSYpdARwNLwL481hAm0af6poE
	sAajhk3i3yXO4jzq6/ZzweApdzJWmksqdOeOGMb16LXV776nLCen9bRcoH21vJv5UEzp
	zjrYprDu1tiY91dlfCwTot1bkfuOTYqBusmso9WGb65ezVRNhCz6jel11UcicdPhmCz7
	cYWQ==
X-Gm-Message-State: APjAAAUUHG1R4l88BfpgaOzhOnax3qAhYAQp4wLhlTmHRLamMjINsJiz
	cMsfnV/OM2mf9C6nQEGkmnuzdXz4
X-Google-Smtp-Source: APXvYqzLZU8CKcdL9uZM2ID/SAP3KsAVUoQKnWJzfS4eyXw7cd/9Xso8KQ/w59qZsHLHS90XDWEczA==
X-Received: by 2002:a1c:eb17:: with SMTP id j23mr2573407wmh.86.1553177145346; 
	Thu, 21 Mar 2019 07:05:45 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	j11sm6826106wrw.85.2019.03.21.07.05.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Mar 2019 07:05:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 15:05:32 +0100
Message-Id: <20190321140532.27536-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][v2] glew: Fix build errors at recipes depending on glew
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
X-List-Received-Date: Thu, 21 Mar 2019 14:05:45 -0000
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
 ...mpilation-with-current-mesa-versions.patch | 73 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.1.0.bb      |  3 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch

diff --git a/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch b/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
new file mode 100644
index 0000000000..64f3e2fd9b
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
@@ -0,0 +1,73 @@
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
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
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


