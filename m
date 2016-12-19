Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 910AF71993
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:06:11 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so16868842pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 19:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XjbwxU73Vm6K0eL1JDLrNh6zE2FQqInKSHgvGW3KOZM=;
	b=d4J3zVkIoWGwJbtGVDWgQxg25Yzlx/G/1+WQ75/kqjxPKtfjh/PGPL0X2es0sIR4MF
	7EqQbPV79bzVAaUPEIyrbzyXtzDDFhr0p+wrqt5aa/dJr3T0th+8s7aeymSyvUWmclu6
	y5Kbusmz79R6sVtO+48dGRY+IR03Kf2Mim8ZZeNiqdwihP+dH4BgKmfEwTwHnhJAElAu
	tGC+vQoEuD8c8RsiwS+f0ixmFX5TE9sDxpzPHE265HmCUMtnTZkB78YV0LcwKTM9dc3y
	cSp66T/7OlJQtOUvZAn9ssYq2l4cXY2i2W/h2+f4jp+u0LL6qJhoCd84wsXFBFTUNGDK
	o9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XjbwxU73Vm6K0eL1JDLrNh6zE2FQqInKSHgvGW3KOZM=;
	b=rLZiuyISi1+0kGFSXrB0y0usSjOsDTRIdz3p5/GWQb4YronbV3jCDDCSYrFSPMu7/P
	5+yZ4wjkcZC5DyfadBX61gNsaz1PRWcXn0a6qYLdr0Py1q87r+/ZCMgfPwm3wOyB7Zau
	FiW5cGyo77uSlCSGWvLhOXQiXfUrFWgQ5wqmWMdcK1J9Q47kWjTOWQ/+xfjoyPKWpoLr
	tbKwfVz8RcHgZ1ILVFfFGF027ZlIOYRFITq/Jo49Iu2TN4g99CSpCtjixmBeLUvxMjwR
	fAGxcyKz4nDehE91/RlTQafRLPnCkM8j0vJ32gUKaXN7Sw6OnMp+hQ0on3P1lmeDyyXl
	Rn9A==
X-Gm-Message-State: AKaTC010wfwHK6c+3WNGxvDElWpQNsTidB2CCtaS7/6PASyF3uSj86ChFBLPPPukzesghA==
X-Received: by 10.99.181.76 with SMTP id u12mr25204991pgo.64.1482116773526;
	Sun, 18 Dec 2016 19:06:13 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	65sm26830276pfn.12.2016.12.18.19.06.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 19:06:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 19:05:53 -0800
Message-Id: <20161219030600.1284-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/8] webkitgtk: Fix atomic detection on arm architecture
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
X-List-Received-Date: Mon, 19 Dec 2016 03:06:12 -0000

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


