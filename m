Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D32177F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:06 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n23so17287620pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qMYUpjNCUfQ4p/IC5iayFK4p6cQnmaLu5MxBp8ieVuw=;
	b=uEjAMUTAYi9pXRwldFVajRafu6JqgRUWx24VEBqoJUFO2+xiDAE2UeG4mpynDVtsfK
	j1TFihEH2kKsuXpMcj34PchxHLrADaFU3B5ogRY2LwBA9YfVWjOHHQSkokQl3Yq7X8Fx
	KVhp9mO9nmQBjpgoH1JbssXpsImca9k5gORv03HpyPrSN9a1C7YA9uY+FvFaVAKtY+FS
	H9aboUmt9T4ju/g1Lul0t0Z78QfziVVINHP/d7RmCoB0RG4MFPrxxFuXxU6qrXqg7ZJf
	DLK+d2x18GpJywATYtS23VFslicdScvYGsnSAll5uEvhGnCZnr9AFnq/KTC+IweGuLEe
	EOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qMYUpjNCUfQ4p/IC5iayFK4p6cQnmaLu5MxBp8ieVuw=;
	b=Tc35pxqq4pCpCLNdvfEQCJJOekAPL/bcyRrUM7W47XIEKUdJC/0fLpL6ISVAVuQQaF
	upwqbzhkO/BfZMTKF+x7nWa9qiuoUWwADkpnWCuFk8eDqkRTiGNPDKL5vr51hzDv+SRW
	/nGxC4iYHZHWWa66v9uFGt2t6YB4NT3s3VZ5BXBa8Iek+0CNegCrqREnLbN+z1pRutFF
	aslnH6PwN03g56vphJ1/UUJ8929kfyD1Mk2XLFN92zsIYuofHikXjahbbKQc3ndPK26O
	x9CMfkE9cS6/dPSsLwre7IQPt6mXl3Bf2aM30jd+Vwy8AX+vone991ec27DHJb047han
	U/Wg==
X-Gm-Message-State: AODbwcBveuhiESqOtmyl5U68zb4+RHDjlmYJNJVSRU2KVK9VLkuyaqeE
	OZaGdqOv8VC262IY
X-Received: by 10.84.232.77 with SMTP id f13mr1086840pln.0.1495429266318;
	Sun, 21 May 2017 22:01:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:34 -0700
Message-Id: <20170522050042.42403-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 07/15] webkitgtk: Fix build for armv5
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
X-List-Received-Date: Mon, 22 May 2017 05:01:06 -0000

Detect atomics during configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../detect-atomics-during-configure.patch          | 34 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.16.1.bb       |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
new file mode 100644
index 0000000000..12836f28f2
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
@@ -0,0 +1,34 @@
+Taken from
+https://bugs.webkit.org/show_bug.cgi?id=161900
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
+===================================================================
+--- webkitgtk-2.16.1.orig/Source/WTF/wtf/CMakeLists.txt
++++ webkitgtk-2.16.1/Source/WTF/wtf/CMakeLists.txt
+@@ -182,7 +182,6 @@ set(WTF_HEADERS
+ 
+ set(WTF_SOURCES
+     Assertions.cpp
+-    Atomics.cpp
+     AutomaticThread.cpp
+     BitVector.cpp
+     ClockType.cpp
+@@ -301,6 +300,15 @@ if (NOT USE_SYSTEM_MALLOC)
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
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
index 0931a50636..a52d93cfbe 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://x32_support.patch \
            file://cross-compile.patch \
            file://gcc7.patch \
+           file://detect-atomics-during-configure.patch \
            "
 SRC_URI[md5sum] = "d3bcf995a667fd9febb9ab991acf0ca7"
 SRC_URI[sha256sum] = "eb92383232328ce655b703c64370ed3795662479719ad1b4a869ed46769d2945"
-- 
2.13.0


