Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 61D857704E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:51 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id 6so270215881qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zZE/egiffTXNyhp42qS64NbFgvUuEh0Mxdi46D1uYRk=;
	b=UP8NeJEJxYtuplFV22Uw45P7y17rKWEZSiyGn/Mu1OJsYEIXT9K/q025BHSYkvVlUz
	+iKHsT4ROO5taGk6CbmYHaYK8+PbTbD3jq5KvsAN/a2OkPZwbSMmxb2X8taBxaT8nce3
	Zprl1FLihPWW36s18V0bP2WHEiJULWJS38+MVhhs5NIakRecPNMk3UlrbeWKXa8bw+FA
	dNqYVUyNn/uu+mOp/FMulLvOdyciV3+ywFE5UfP3B1eUT327JvErlTln8f1UWIzdr28u
	L0gD33vngclPyT86yj51lEMsbWg3GwFYpzTEy3ffwyQn3UMGDHwh6TC+/EFZ6Zk54vTh
	wByA==
X-Received: by 10.140.194.16 with SMTP id p16mr147909731qha.44.1452248391779; 
	Fri, 08 Jan 2016 02:19:51 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:05 +0000
Message-Id: <551c4bd718a1b8a26295d696e023076d8d42136e.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 37/53] webkitgtk: Fix build on non-glibc linux systems
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-build-with-non-glibc-libraries-on-linux.patch | 61 ++++++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.10.4.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-non-glibc-libraries-on-linux.patch
new file mode 100644
index 0000000..c57fcde
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
+Upstream-Status: Submitted
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
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
index f5add32..098bbbb 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "\
   http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
   file://clang.patch \
   file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
+  file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
   "
 SRC_URI[md5sum] = "fb010031c6f61c3a1a00793b112badb5"
 SRC_URI[sha256sum] = "dbf8260da5cac0c74de2d3cce1fe7c519da3cd816a2c769cb6c6d56addd2f055"
-- 
2.7.0


