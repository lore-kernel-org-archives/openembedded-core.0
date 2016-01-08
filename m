Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id D0B4076294
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:36 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n135so198826342qka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tubz7HbXeGSInsZhvZP5hFaBqbkY5pnaXKMq+sbK1iM=;
	b=u4E9oI/kvbwoUjj6x8biRmlQliXgxqIV/DjxT5ed9119bSYkNucecDWdkx68z/snAG
	occs8PUVo2d6MQ8XR4UxW9W/M7R7k1zVSX79FaNdICO4y7X4DBSJ5WPHc/BgxNQ5Y5bR
	OjNP5yvcONu+RVxoKHq1U2I8QRas+6ilGUwbpffRUu0Mrw5uhn7BNLuHfRwIEzEv+mv/
	Ow3Ol7nfA4pHUdoyQ8WENleJDPm1Kyj7HO+kuGkxCzQAwG+Xmw6n/sjnJmpbMMemLR6L
	T7qaKk4LU7TwyFOsyMbQnE+LomtmMKLUWV8SrqeEtbrnLC0lW7M4r87gY2joyIUHE4D7
	Z+hA==
X-Received: by 10.55.76.11 with SMTP id z11mr142094798qka.83.1452248377592;
	Fri, 08 Jan 2016 02:19:37 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:43 +0000
Message-Id: <19d62253b48387b5f6aba7ca0beacc76b34ea3ab.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 15/53] webkitgtk: Fix build with clang
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:37 -0000

backtrace is glibc only feature on linux so check for glibc before using
it
Clangs clear_cache has different signature than gcc provided builtin
make it compatible for both

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nable-backtrace-on-linux-when-using-glibc.patch | 39 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk/clang.patch     | 25 ++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.10.4.bb       |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
new file mode 100644
index 0000000..146087b
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
@@ -0,0 +1,39 @@
+From 0b68ad206d2d90df78d91cad4da19152084014cf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Sep 2015 05:15:04 +0000
+Subject: [PATCH] Enable backtrace on linux when using glibc
+
+We dont have backtrace() implemented on non-glibc libc's on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ Source/WTF/wtf/Assertions.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Source/WTF/wtf/Assertions.cpp b/Source/WTF/wtf/Assertions.cpp
+index 191d53f..a4d86b5 100644
+--- a/Source/WTF/wtf/Assertions.cpp
++++ b/Source/WTF/wtf/Assertions.cpp
+@@ -68,7 +68,7 @@
+ #include <unistd.h>
+ #endif
+ 
+-#if OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))
++#if OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <cxxabi.h>
+ #include <dlfcn.h>
+ #include <execinfo.h>
+@@ -225,7 +225,7 @@ void WTFReportArgumentAssertionFailure(const char* file, int line, const char* f
+ 
+ void WTFGetBacktrace(void** stack, int* size)
+ {
+-#if OS(DARWIN) || (OS(LINUX) && !defined(__UCLIBC__))
++#if OS(DARWIN) || (OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+     *size = backtrace(stack, *size);
+ #elif OS(WINDOWS)
+     // The CaptureStackBackTrace function is available in XP, but it is not defined
+-- 
+2.5.2
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/clang.patch b/meta/recipes-sato/webkit/webkitgtk/clang.patch
new file mode 100644
index 0000000..ef77755
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/clang.patch
@@ -0,0 +1,25 @@
+Clang's builtin for clear_cache accepts char* and errors out when using void*,
+using char* work on both gcc and clang since char* is auto-converted to void* in gcc case
+
+Source/JavaScriptCore/assembler/ARM64Assembler.h:2857:33: error: cannot initialize a parameter of type 'char *' with an rvalue of type 'void *'
+        __builtin___clear_cache(reinterpret_cast<void*>(begin), reinterpret_cast<void*>(end));
+                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+1 error generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: webkitgtk-2.8.5/Source/JavaScriptCore/assembler/ARM64Assembler.h
+===================================================================
+--- webkitgtk-2.8.5.orig/Source/JavaScriptCore/assembler/ARM64Assembler.h
++++ webkitgtk-2.8.5/Source/JavaScriptCore/assembler/ARM64Assembler.h
+@@ -2854,7 +2854,7 @@ public:
+ #if OS(LINUX) && COMPILER(GCC)
+     static inline void linuxPageFlush(uintptr_t begin, uintptr_t end)
+     {
+-        __builtin___clear_cache(reinterpret_cast<void*>(begin), reinterpret_cast<void*>(end));
++        __builtin___clear_cache(reinterpret_cast<char*>(begin), reinterpret_cast<char*>(end));
+     }
+ #endif
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
index 4d5aeb4..f5add32 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+  file://clang.patch \
+  file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
   "
 SRC_URI[md5sum] = "fb010031c6f61c3a1a00793b112badb5"
 SRC_URI[sha256sum] = "dbf8260da5cac0c74de2d3cce1fe7c519da3cd816a2c769cb6c6d56addd2f055"
-- 
2.7.0


