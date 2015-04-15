Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
X-Greylist: delayed 82839 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Apr 2015 08:39:45 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0053.outbound.protection.outlook.com [65.55.169.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5A29073D1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:39:45 +0000 (UTC)
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
Received: from Ubuntu64.mydomain.com (111.93.218.67) by
	BY1PR0701MB1141.namprd07.prod.outlook.com (25.160.104.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Wed, 15 Apr 2015 08:23:59 +0000
From: "Krishnanjanappa, Jagadeesh"
	<jagadeesh.krishnanjanappa@caviumnetworks.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Apr 2015 13:53:48 +0530
Message-ID: <1429086228-27288-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
X-Mailer: git-send-email 1.8.2.3
MIME-Version: 1.0
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: DM2PR07CA0022.namprd07.prod.outlook.com (10.141.52.150) To
	BY1PR0701MB1141.namprd07.prod.outlook.com (25.160.104.27)
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1141;
X-Microsoft-Antispam-PRVS: <BY1PR0701MB1141734213D7D2E426E590C58EE50@BY1PR0701MB1141.namprd07.prod.outlook.com>
X-Forefront-Antispam-Report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(66066001)(47776003)(46102003)(40100003)(33646002)(19580395003)(450100001)(19580405001)(2351001)(229853001)(36756003)(87976001)(50466002)(48376002)(110136001)(86362001)(15975445007)(92566002)(50226001)(62966003)(42186005)(122386002)(53416004)(77156002)(50986999)(7099027)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1141;
	H:Ubuntu64.mydomain.com; FPR:; SPF:None; MLV:ovrnspm;
	PTR:InfoNoRecords; LANG:en; 
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BY1PR0701MB1141; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0701MB1141; 
X-Forefront-PRVS: 0547116B72
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2015 08:23:59.2603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1141
Subject: [PATCH] qt4-embedded: add checking for AArch64 ilp32
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
X-List-Received-Date: Wed, 15 Apr 2015 08:39:47 -0000
Content-Type: text/plain

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetworks.com>

1. Cross-compiling qt4-embedded and qt4-x11-free applications for AArch64 ilp32
   (both big and little endian) fails with below error,

(snip)
In file included from ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.h:31:0,
                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalData.h:32,
                 from ../3rdparty/javascriptcore/JavaScriptCore/interpreter/CallFrame.h:26,
                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/ClassInfo.h:26,
                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h:27,
                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackConstructor.h:30,
                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackConstructor.cpp:27:
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantiation of 'TO QTWTF::bitwise_cast(FROM) [with TO = int; FROM = double]':
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:52:49: required from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: size of array is negative
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantiation of 'TO QTWTF::bitwise_cast(FROM) [with TO = double; FROM = int]':
../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:57:47: required from here
../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: size of array is negative
make[1]: *** [obj/release/JSCallbackConstructor.o] Error 1
-- CUT --

    the error is because of JSVALUE64 is being defined while compiling
    programs for AArch64 ilp32. This makes equal condition checking of
    intptr_t and double datatypes as false, and results in -1 (negative)
    as array size in bitwise_cast function.
    The patch defines JSVALUE64, if the programs are being compiled for
    AArch64 64bit NOT for ilp32.

2. qt4_arch.inc is modified to set system architecture as aarch64 if the
   TARGET_ARCH is other than aarch64. Without this modification, for
   TARGET_ARCH equal to aarch64_32, aarch64be, aarch64be_32; the system
   architecture is set as 'generic' and results in below error.

configure log:
(snip)
64-bit AMD 80x86 (x86_64)
'-opensource' is unsupported, using 'generic'
'x86_64' is supported
System architecture: 'generic'
Host architecture: 'x86_64'
-- CUT --

build error:
(snip)
In file included from ../../include/QtCore/qatomic_generic.h:1:0,
                 from ../../include/QtCore/../../src/corelib/arch/qatomic_arch.h:64,
                 from ../../include/QtCore/qatomic_arch.h:1,
                 from ../../include/QtCore/../../src/corelib/thread/qbasicatomic.h:227,
                 from ../../include/QtCore/qbasicatomic.h:1,
                 from ../../include/QtCore/../../src/corelib/thread/qatomic.h:46,
                 from ../../include/QtCore/qatomic.h:1,
                 from ../../include/QtCore/../../src/corelib/tools/qbytearray.h:45,
                 from ../../include/QtCore/qbytearray.h:1,
                 from ../../include/QtCore/../../src/corelib/tools/qstring.h:46,
                 from ../../include/QtCore/qstring.h:1,
                 from ../../include/QtCore/../../src/corelib/kernel/qobject.h:48,
                 from ../../include/QtCore/qobject.h:1,
                 from ../../include/QtCore/../../src/corelib/kernel/qcoreapplication.h:45,
                 from ../../include/QtCore/qcoreapplication.h:1,
                 from qdbusintegrator.cpp:42:
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h: In instantiation of 'bool QBasicAtomicPointer<T>::testAndSetOrdered(T*, T*) [with T = const QString]':
qdbusintegrator.cpp:76:1:   required from here
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:197:88: error: invalid conversion from 'const void*' to 'void*' [-fpermissive]
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:108:20: error: initializing argument 2 of 'bool QBasicAtomicPointer_testAndSetOrdered(void* volatile*, void*, void*)' [-fpermissive]
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:197:88: error: invalid conversion from 'const void*' to 'void*' [-fpermissive]
../../include/QtCore/../../src/corelib/arch/qatomic_generic.h:108:20: error: initializing argument 3 of 'bool QBasicAtomicPointer_testAndSetOrdered(void* volatile*, void*, void*)' [-fpermissive]
make[1]: *** [.obj/release-shared-emb-auto/qdbusintegrator.o] Error 1
make[1]: *** Waiting for unfinished jobs....
-- CUT --

   So, select system architecture (via QT_ARCH) as aarch64 for
   AArch64 and its other variants

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |  1 +
 .../qt4/qt4-4.8.6/add_check_for_aarch64_32.patch   | 55 ++++++++++++++++++++++
 meta/recipes-qt/qt4/qt4_arch.inc                   |  2 +-
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index 19f52a7..0cb7f80 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -28,6 +28,7 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0032-aarch64_add_header.patch \
            file://0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
+           file://add_check_for_aarch64_32.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch b/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch
new file mode 100644
index 0000000..ad5103d
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch
@@ -0,0 +1,55 @@
+Author: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+Date:   Sun Apr 12 19:27:10 2015 +0530
+
+[PATCH] add checking for AArch64 ilp32
+
+Cross-compiling qt4-embedded and qt4-x11-free applications for AArch64 ilp32
+(both big and little endian) fails with below error,
+
+(snip)
+In file included from ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.h:31:0,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalData.h:32,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/interpreter/CallFrame.h:26,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/ClassInfo.h:26,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h:27,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackConstructor.h:30,
+                 from ../3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackConstructor.cpp:27:
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantiation of 'TO QTWTF::bitwise_cast(FROM) [w
+../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:52:49: required from here
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: size of array is negative
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h: In instantiation of 'TO QTWTF::bitwise_cast(FROM) [w
+../3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h:57:47: required from here
+../3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h:63:1: error: size of array is negative
+make[1]: *** [obj/release/JSCallbackConstructor.o] Error 1
+-- CUT --
+
+the error is because of JSVALUE64 is being defined while compiling programs
+for AArch64 ilp32. This makes equal condition checking of intptr_t and double
+datatypes as false, and results in -1 (negative) as array size in bitwise_cast
+function.
+
+Upstream-Status: Pending
+
+Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
+
+--- a/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h	2014-04-11 00:07:12.000000000 +0530
++++ b/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h	2015-04-10 22:19:51.066279426 +0530
+@@ -214,6 +214,9 @@
+ #define WTF_CPU_AARCH64 1
+ #if defined(__AARCH64EB__)
+ #define WTF_CPU_BIG_ENDIAN 1
++#if !defined(__LP64__)
++#define WTF_CPU_AARCH64_32 1
++#endif
+ #endif
+ #endif
+ 
+@@ -903,7 +906,7 @@
+ #endif
+ 
+ #if !defined(WTF_USE_JSVALUE64) && !defined(WTF_USE_JSVALUE32) && !defined(WTF_USE_JSVALUE32_64)
+-#if (CPU(X86_64) && (OS(UNIX) || OS(WINDOWS) || OS(SOLARIS) || OS(HPUX))) || (CPU(IA64) && !CPU(IA64_32)) || CPU(ALPHA) || CPU(AIX64) || CPU(SPARC64) || CPU(MIPS64) || CPU(AARCH64)
++#if (CPU(X86_64) && (OS(UNIX) || OS(WINDOWS) || OS(SOLARIS) || OS(HPUX))) || (CPU(IA64) && !CPU(IA64_32)) || CPU(ALPHA) || CPU(AIX64) || CPU(SPARC64) || CPU(MIPS64) || (CPU(AARCH64) && !CPU(AARCH64_32))
+ #define WTF_USE_JSVALUE64 1
+ #elif CPU(ARM) || CPU(PPC64)
+ #define WTF_USE_JSVALUE32 1
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
index 07512db..e94c284 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -4,7 +4,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 set_arch() {
    case ${TARGET_ARCH} in
-       aarch64)  QT_ARCH=aarch64 ;;
+       aarch64*) QT_ARCH=aarch64 ;;
        arm*)     QT_ARCH=arm ;;
        i*86*)    QT_ARCH=i386 ;;
        mips*)    QT_ARCH=mips ;;
-- 
1.8.2.3


