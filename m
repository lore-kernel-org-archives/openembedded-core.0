Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 66B6760B87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 02:16:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,569,1574092800"; d="scan'208";a="86569414"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 10:16:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6DFE5406AB15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:05:52 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 10:15:55 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Mar 2020 10:16:03 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2020 00:41:44 -0700
Message-ID: <1584603707-43423-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 6DFE5406AB15.AB21B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] glew: upgrade 2.1.0 -> 2.2.0
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
X-List-Received-Date: Thu, 19 Mar 2020 02:16:02 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

0001-Fixed-compilation-with-current-mesa-versions.patch
removed since it is included in 2.2.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...mpilation-with-current-mesa-versions.patch | 73 -------------------
 .../glew/{glew_2.1.0.bb => glew_2.2.0.bb}     |  7 +-
 2 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
 rename meta/recipes-graphics/glew/{glew_2.1.0.bb => glew_2.2.0.bb} (87%)

diff --git a/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch b/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
deleted file mode 100644
index 64f3e2fd9b..0000000000
--- a/meta/recipes-graphics/glew/glew/0001-Fixed-compilation-with-current-mesa-versions.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 7f65a36866f4e24dd1446fe1c9d21424f28bcabd Mon Sep 17 00:00:00 2001
-From: Deve <deveee@gmail.com>
-Date: Wed, 14 Nov 2018 21:07:29 +0100
-Subject: [PATCH] Fixed compilation with current mesa versions.
-
-As you can see in
-https://cgit.freedesktop.org/mesa/mesa/tree/include/GL/glext.h
-now the file uses __gl_glext_h_ instead of __glext_h_
-It's precisely caused by commit f7d42ee7d319256608ad60778f6787c140badada
-
-Backoprt notes: 
-
-* The original patch adjusts auto/src/glew_head.h only
-* include/GL/glew.h is not part of git repo and gets created on tarball
-  creation
-
-=> patch include/GL/glew.h either to cause the desired fix
-
-Upstream-Status: Backport [1]
-
-[1] https://github.com/nigels-com/glew/commit/7f65a36866f4e24dd1446fe1c9d21424f28bcabd
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- auto/src/glew_head.h | 3 ++-
- include/GL/glew.h    | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/auto/src/glew_head.h b/auto/src/glew_head.h
-index c19cefb..8f313d9 100644
---- a/auto/src/glew_head.h
-+++ b/auto/src/glew_head.h
-@@ -14,7 +14,7 @@
- #if defined(__REGAL_H__)
- #error Regal.h included before glew.h
- #endif
--#if defined(__glext_h_) || defined(__GLEXT_H_)
-+#if defined(__glext_h_) || defined(__GLEXT_H_) || defined(__gl_glext_h_)
- #error glext.h included before glew.h
- #endif
- #if defined(__gl_ATI_h_)
-@@ -30,6 +30,7 @@
- #define __X_GL_H
- #define __glext_h_
- #define __GLEXT_H_
-+#define __gl_glext_h_
- #define __gl_ATI_h_
- 
- #if defined(_WIN32)
-diff --git a/include/GL/glew.h b/include/GL/glew.h
-index b5b6987..a9f9e4b 100644
---- a/include/GL/glew.h
-+++ b/include/GL/glew.h
-@@ -93,7 +93,7 @@
- #if defined(__REGAL_H__)
- #error Regal.h included before glew.h
- #endif
--#if defined(__glext_h_) || defined(__GLEXT_H_)
-+#if defined(__glext_h_) || defined(__GLEXT_H_) || defined(__gl_glext_h_)
- #error glext.h included before glew.h
- #endif
- #if defined(__gl_ATI_h_)
-@@ -109,6 +109,7 @@
- #define __X_GL_H
- #define __glext_h_
- #define __GLEXT_H_
-+#define __gl_glext_h_
- #define __gl_ATI_h_
- 
- #if defined(_WIN32)
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/glew/glew_2.1.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
similarity index 87%
rename from meta/recipes-graphics/glew/glew_2.1.0.bb
rename to meta/recipes-graphics/glew/glew_2.2.0.bb
index edcbdc0a7a..8948444e08 100644
--- a/meta/recipes-graphics/glew/glew_2.1.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -6,11 +6,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
-           file://no-strip.patch \
-           file://0001-Fixed-compilation-with-current-mesa-versions.patch"
+           file://no-strip.patch"
 
-SRC_URI[md5sum] = "b2ab12331033ddfaa50dc39345343980"
-SRC_URI[sha256sum] = "04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95"
+SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
+SRC_URI[sha256sum] = "d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1




