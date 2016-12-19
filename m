Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B30671D31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:04 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g1so5643079pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XjbwxU73Vm6K0eL1JDLrNh6zE2FQqInKSHgvGW3KOZM=;
	b=mtovY1Qb00GUBZKzlMt76dLMKyLFNYJhZpq50NS0ASM0IY9CdChGyDO7STDmWtprTX
	dedD5kd6Jf7eyUMpwQ7aw8SGNJ/2BSi00d6fP1lNd+UeNbuUPERPO6aPLsFRkJj6wRUU
	5iq5iVWHiEIjAXVh7G5PE37TjhNQ2voBEmFPl6FYIavun36wyPxvzi8DWEHOQCfBO5Q4
	WLilRgneX9TfROkb+alMxlsg3U45llpWuGS++St7kFvX/MRFvbxxrENeOm8QAOZ0i/sY
	CYM30ooJzxndiiOKV/C45W8/ALwgqsgnk5yL9+Wk+a8rzAqWvCeaNac0MH0CjJ6vEJ6D
	WSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XjbwxU73Vm6K0eL1JDLrNh6zE2FQqInKSHgvGW3KOZM=;
	b=MyQqAcrSrL6TO5XMMKbrngQcWVYAyaP3/N+qZOuIZRpk7Ju2VhYdI4LPVRUUiZWnJ0
	SFOWe8QSIMo76xLg6X4mDj2QKJkgkczAHNijo54Xm0TY//1ICS+fixS/thBLe/Tfpcr7
	BSsewWnz9P3i8Wkxd6M6jeMSddwJU4ybXwkAJgGvcLc8vZ2CwsaVvghZ1CBEQrjcp3nL
	KaZ/iPusntw9oUc5qQur5zZCdgjV+ClbTms7kxbViwDa2fPK1I1ruElpwFVoXEtNhdBR
	P8mV82IzBcSverNBkOWmMR+jIusAvefs1xU7sS9DjTAj51zTGHz0y1mk54XHvHr+8U2a
	qLKQ==
X-Gm-Message-State: AKaTC03XwOL04/speDsUUOYeDaL2qED48d8Vl6vI7pWnHM14RrfwylDODbk64sh7/v/i4g==
X-Received: by 10.99.66.198 with SMTP id p189mr26293552pga.30.1482129605825;
	Sun, 18 Dec 2016 22:40:05 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:48 -0800
Message-Id: <20161219063957.18716-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [V2 01/10] webkitgtk: Fix atomic detection on arm architecture
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-sato/webkit/files/detect_atomics.patch | 38 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.14.2.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/files/detect_atomics.patch

diff --git a/meta/recipes-sato/webkit/files/detect_atomics.patch b/meta/recipes-sato/webkit/files/detect_atomics.patch
new file mode 100644
index 0000000000..c4e80a7d96
--- /dev/null
+++ b/meta/recipes-sato/webkit/files/detect_atomics.patch
@@ -0,0 +1,38 @@
+Sourced from https://bugs.webkit.org/show_bug.cgi?id=161900
+
+on arm fixes
+
+| /usr/src/debug/libgcc/6.2.0-r0/gcc-6.2.0/build.arm-oe-linux-gnueabi.arm-oe-linux-gnueabi/libgcc/../../../../../../../work-shared/gcc-6.2.0-r0/gcc-6.2.0/libgcc/config/arm/linux-atomic-64bit.c:117: multiple definition of `__sync_sub_and_fetch_8'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Backport
+
+diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
+index 867999e..ea69322 100644
+--- a/Source/WTF/wtf/CMakeLists.txt
++++ b/Source/WTF/wtf/CMakeLists.txt
+@@ -171,7 +171,6 @@ set(WTF_HEADERS
+ 
+ set(WTF_SOURCES
+     Assertions.cpp
+-    Atomics.cpp
+     BitVector.cpp
+     CompilationThread.cpp
+     CrossThreadCopier.cpp
+@@ -276,6 +275,15 @@ if (NOT USE_SYSTEM_MALLOC)
+     list(APPEND WTF_LIBRARIES bmalloc)
+ endif ()
+ 
++file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
++     "int main(void)\n"
++     "{ long long x = 1; return (int) __sync_add_and_fetch_8(&x, 1); }\n")
++try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/test_atomics.cpp)
++if (NOT ATOMICS_BUILD_SUCCEEDED)
++    list(APPEND WTF_SOURCES Atomics.cpp)
++endif ()
++file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
++
+ list(APPEND WTF_SOURCES
+     unicode/icu/CollatorICU.cpp
+ )
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
index 1c327babfb..46b54683fb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
+           file://detect_atomics.patch \
            "
 
 SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
-- 
2.11.0


