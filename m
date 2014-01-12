Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id EC1C96B302
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2014 17:33:00 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d49so2755566eek.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2014 09:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6R4GuS5AXQxS8QCOaDNdHBXR3aCPYwPdn7huU/uc07w=;
	b=sAoeG05kR+On+TUUH8cFLs5MpOyJi8jcv+QHQLn1DB73N6v7872tKcfoqlakTzA7az
	RGHL0phYGsMt3B9gz2ZqM8Qq+skGY/HmmTsRJ22fHQHSyljBhTRRPoritbHDePzq4Br+
	DMS8TWZUFemceTHavDOTp8lz4Tq0sJ6Luj1PcDRqF2If3vks0DjlD02RpA8hVD5DkpGZ
	wiP+/WDrB1bkp2SJUYHfbiwU9YgtxiVRyoew80WWhn8AzscJms6pSflrLIDllURgWCog
	tk2AwY+SLZlqjRwG261mWzhn7nOsZPEBTYmHOjl6Mlb+RSV9GUx9NYdhKJazNjoTQQuY
	HluQ==
X-Received: by 10.15.94.201 with SMTP id bb49mr9756537eeb.45.1389547981330;
	Sun, 12 Jan 2014 09:33:01 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm32689949eel.2.2014.01.12.09.33.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Jan 2014 09:33:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2014 18:33:11 +0100
Message-Id: <1389547991-3456-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH] cmake: Fix freetype detection
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
X-List-Received-Date: Sun, 12 Jan 2014 17:33:02 -0000

* since last freetype upgrade cmake cannot detect it
* e.g. webkit-efl requires freetype and is failing because of this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 .../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch  | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 69f4fe2..f76f68b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz
            file://aarch64-cmake.patch \
            file://aarch64-kwsys.patch \
            file://qt4-fail-silent.patch \
+           file://cmake-2.8.11.2-FindFreetype.patch \
            "
 
 inherit autotools
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
new file mode 100644
index 0000000..1b523c0
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
@@ -0,0 +1,47 @@
+From: Julian Ospald <hasufell@gentoo.org>
+Date: Sun Dec  8 13:38:06 UTC 2013
+Subject: fix check for freetype-2.5.1
+
+Upstream-Status: Submitted http://www.cmake.org/Bug/view.php?id=14601
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- old/Modules/FindFreetype.cmake
++++ new/Modules/FindFreetype.cmake
+@@ -64,6 +64,19 @@
+   PATH_SUFFIXES include/freetype2 include
+ )
+ 
++if(NOT FREETYPE_INCLUDE_DIR_freetype2)
++  find_path(FREETYPE_INCLUDE_DIR_freetype2 config/ftheader.h
++    HINTS
++      ENV FREETYPE_DIR
++    PATHS
++      /usr/X11R6
++      /usr/local/X11R6
++      /usr/local/X11
++      /usr/freeware
++    PATH_SUFFIXES include/freetype2 include
++  )
++endif()
++
+ find_library(FREETYPE_LIBRARY
+   NAMES freetype libfreetype freetype219
+   HINTS
+@@ -82,8 +95,14 @@
+ endif()
+ set(FREETYPE_LIBRARIES "${FREETYPE_LIBRARY}")
+ 
+-if(FREETYPE_INCLUDE_DIR_freetype2 AND EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
+-    file(STRINGS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h" freetype_version_str
++if(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
++  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype/freetype.h")
++elseif(EXISTS "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
++  set(FREETYPE_H "${FREETYPE_INCLUDE_DIR_freetype2}/freetype.h")
++endif()
++
++if(FREETYPE_INCLUDE_DIR_freetype2 AND FREETYPE_H)
++    file(STRINGS "${FREETYPE_H}" freetype_version_str
+          REGEX "^#[\t ]*define[\t ]+FREETYPE_(MAJOR|MINOR|PATCH)[\t ]+[0-9]+$")
+ 
+     unset(FREETYPE_VERSION_STRING)
-- 
1.8.5.2


