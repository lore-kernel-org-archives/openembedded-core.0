Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 604AA766E1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:30 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e65so142595681pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BX5my3MPvxsvBEOcyLY4IaqciymSs74uziN4z+05oXw=;
	b=yL+zsOvFh2jWV4YTGAaPg+P6QkoJdhsv2iFjIMSCNvh8aAsCkhm/o7/kuI3TwkRgrS
	4DB84Gc3NSKTdC6RClHTBSnTVzuexSJ0ugpnagIBzJmVyrFkp6ey0iTvh0pU8fpZyiXd
	rgAtn8AW1yR6nxXBsJFHPMHTktQM7aVjgWrH5XedW2JN+pSAkzMwiVgawHsMOPAX6aQX
	SEt1pQyqmvhN0P23QB5CeynNDylizJjhaQIOxPmLRBQqr6pkMKyXgzvfLBsDpGYjP4iI
	cX4zTUcnQGSX7qF5yamIYna1xI0zuSxXZIv+e6n/av2yJJCWvVf8tFSbeWlttmW0Y/Iy
	gt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=BX5my3MPvxsvBEOcyLY4IaqciymSs74uziN4z+05oXw=;
	b=SiSfj2rw34KcujuQydM0JBrykT66o4KotlydrPKisgh+A6sxfZUvOj0TrHblFFxC6I
	v7KU6SwJj/mLNvaMewtdNg8Mw2ON8k2/EmQTwXfOQZZVJl6zPRKxzOJlTzyjEi/CpAmz
	dCDsSKI/36ChD82ENIFu+azomk2dcfsDLdcqq/dRfuTUcWeueJyu9/YDq77ZZhcRIOcH
	HaBjjHnamLZyuLQJ7/IR1/KMaTBOulb0KjTZyhJusF168tbKvotOIE9URtPlyp369mJl
	9wTWaPeGxXfBjHQg8+8FgArmuB7Ewj8Hm/DZfKGvnmcNHZQD8ZtWSnnrVjCaoMtQ//Va
	W8Sg==
X-Gm-Message-State: ALoCoQnWSpPK3E3ehd/MEnW555YHu1ariktdM4tgFNMmra3NkP/wLXtC0/7/BVKB1oQwXaaDN1vOzFGdcjbrAVgbzCk3kjB4Kw==
X-Received: by 10.98.42.81 with SMTP id q78mr28145083pfq.142.1453030651428;
	Sun, 17 Jan 2016 03:37:31 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:07 -0800
Message-Id: <9662d06dc8e473df384a88ca0de1b89c27e7815b.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 34/73] webkitgtk: Fix build with clang/musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:30 -0000

backtrace is glibc only feature on linux so check for glibc before using
it
Clangs clear_cache has different signature than gcc provided builtin
make it compatible for both

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nable-backtrace-on-linux-when-using-glibc.patch | 39 ++++++++++++++
 ...x-build-with-non-glibc-libraries-on-linux.patch | 61 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk/clang.patch     | 25 +++++++++
 meta/recipes-sato/webkit/webkitgtk_2.10.4.bb       |  3 ++
 4 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/clang.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-backtrace-on-linux-when-using-glibc.patch
new file mode 100644
index 0000000..d7e4ef6
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
+Upstream-Status: Accepted
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
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
new file mode 100644
index 0000000..77ebf37
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
@@ -0,0 +1,61 @@
+From 30e2ef302a329850ba55c7c458c98cbf396186ec Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 21:47:34 +0000
+Subject: [PATCH] Fix build with non-glibc libraries on linux
+
+qualify isnan() calls with std namespace
+malloc_trim is glibc specific API so guard it with __GLIBC__
+let ctype be used on non-glibc ( musl ) C library
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Accepted
+
+ Source/JavaScriptCore/runtime/Options.cpp                    | 2 +-
+ Source/WTF/wtf/DisallowCType.h                               | 2 +-
+ Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp | 2 ++
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/runtime/Options.cpp b/Source/JavaScriptCore/runtime/Options.cpp
+index fe830b4..c49aade 100644
+--- a/Source/JavaScriptCore/runtime/Options.cpp
++++ b/Source/JavaScriptCore/runtime/Options.cpp
+@@ -610,7 +610,7 @@ bool Option::operator==(const Option& other) const
+     case Options::Type::unsignedType:
+         return m_entry.unsignedVal == other.m_entry.unsignedVal;
+     case Options::Type::doubleType:
+-        return (m_entry.doubleVal == other.m_entry.doubleVal) || (isnan(m_entry.doubleVal) && isnan(other.m_entry.doubleVal));
++        return (m_entry.doubleVal == other.m_entry.doubleVal) || (std::isnan(m_entry.doubleVal) && std::isnan(other.m_entry.doubleVal));
+     case Options::Type::int32Type:
+         return m_entry.int32Val == other.m_entry.int32Val;
+     case Options::Type::optionRangeType:
+diff --git a/Source/WTF/wtf/DisallowCType.h b/Source/WTF/wtf/DisallowCType.h
+index d85e767..dc6bcab 100644
+--- a/Source/WTF/wtf/DisallowCType.h
++++ b/Source/WTF/wtf/DisallowCType.h
+@@ -40,7 +40,7 @@
+ // are used from wx headers. On GTK+ for Mac many GTK+ files include <libintl.h>
+ // or <glib/gi18n-lib.h>, which in turn include <xlocale/_ctype.h> which uses
+ // isacii(). 
+-#if !(OS(DARWIN) && PLATFORM(GTK)) && !PLATFORM(EFL) && !defined(_LIBCPP_VERSION)
++#if !(OS(DARWIN) && PLATFORM(GTK)) && !PLATFORM(EFL) && !defined(_LIBCPP_VERSION) && defined(__GLIBC__)
+ 
+ #include <ctype.h>
+ 
+diff --git a/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp b/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp
+index ea61909..1495642 100644
+--- a/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp
++++ b/Source/WebCore/platform/linux/MemoryPressureHandlerLinux.cpp
+@@ -202,7 +202,9 @@ void MemoryPressureHandler::respondToMemoryPressure(Critical critical, Synchrono
+ void MemoryPressureHandler::platformReleaseMemory(Critical)
+ {
+     ReliefLogger log("Run malloc_trim");
++#ifdef __GLIBC__
+     malloc_trim(0);
++#endif
+ }
+ 
+ void MemoryPressureHandler::ReliefLogger::platformLog()
+-- 
+2.6.4
+
diff --git a/meta/recipes-sato/webkit/webkitgtk/clang.patch b/meta/recipes-sato/webkit/webkitgtk/clang.patch
new file mode 100644
index 0000000..e526713
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
+Upstream-Status: Accepted
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
index 4d5aeb4..098bbbb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
@@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 
 SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
+  file://clang.patch \
+  file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
+  file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
   "
 SRC_URI[md5sum] = "fb010031c6f61c3a1a00793b112badb5"
 SRC_URI[sha256sum] = "dbf8260da5cac0c74de2d3cce1fe7c519da3cd816a2c769cb6c6d56addd2f055"
-- 
2.7.0


