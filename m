Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D6A6760723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:35:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAR3ZKDE001969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 19:35:21 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 Nov 2015 19:35:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 19:35:19 -0800
Message-ID: <5fe993c3d1274aeeafe7b91df698ad20428eda81.1448594831.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448594831.git.liezhi.yang@windriver.com>
References: <cover.1448594831.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt4-4.8.7: fix build for mips n32
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
X-List-Received-Date: Fri, 27 Nov 2015 03:35:21 -0000
Content-Type: text/plain

Issue: LIN8-1720

If _ABIN32 is defined, it should go into 32 bit branch.

Fixed:
./wtf/StdLibExtras.h: In instantiation of 'TO WTF::bitwise_cast(FROM) [with TO = int; FROM = double]':
runtime/JSValueInlineMethods.h:495:44:   required from here
./wtf/Assertions.h:326:47: error: size of array is negative
 #define COMPILE_ASSERT(exp, name) typedef int dummy##name [(exp) ? 1 : -1]

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20151127

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |    1 +
 .../qt4/qt4-4.8.7/fix-for-mips-n32.patch           |   38 ++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.7.inc b/meta/recipes-qt/qt4/qt4-4.8.7.inc
index d165514..d71c68d 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.7.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
@@ -29,6 +29,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://add_check_for_aarch64_32.patch \
            file://g++.conf \
            file://linux.conf \
+           file://fix-for-mips-n32.patch \
            "
 
 SRC_URI[md5sum] = "d990ee66bf7ab0c785589776f35ba6ad"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch b/meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch
new file mode 100644
index 0000000..9f90b78
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch
@@ -0,0 +1,38 @@
+From 269b1a82e654d9b8d682d861b4d0db0bd50d3106 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 27 Nov 2015 03:09:07 +0000
+Subject: [PATCH] wtf/Platform.h: fix build for mips n32
+
+If _ABIN32 is defined, it should go into 32 bit branch.
+
+Fixed:
+./wtf/StdLibExtras.h: In instantiation of 'TO WTF::bitwise_cast(FROM) [with TO = int; FROM = double]':
+runtime/JSValueInlineMethods.h:495:44:   required from here
+./wtf/Assertions.h:326:47: error: size of array is negative
+ #define COMPILE_ASSERT(exp, name) typedef int dummy##name [(exp) ? 1 : -1]
+
+https://bugreports.qt.io/browse/QTBUG-39224
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
+index e8b03be..dfc6a74 100644
+--- a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
++++ b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
+@@ -147,7 +147,7 @@
+ /* CPU(MIPS) - MIPS 32-bit and 64-bit */
+ #if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_) \
+     || defined(__mips64))
+-#if defined(__mips64)
++#if defined(__mips64) && !defined(_ABIN32)
+ #define WTF_CPU_MIPS64 1
+ #define WTF_MIPS_ARCH __mips64
+ #else
+-- 
+2.5.0
+
-- 
1.7.9.5


