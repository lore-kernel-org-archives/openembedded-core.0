Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF5C272792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:53:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBI8rnu9021975
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Dec 2014 00:53:49 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 18 Dec 2014 00:53:48 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:51:03 +0800
Message-ID: <5ea3ba521913d52e5ffc944e8459919019806fcf.1418885580.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418885577.git.kai.kang@windriver.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/19] qt4: add aarch64 support
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
X-List-Received-Date: Thu, 18 Dec 2014 08:53:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add aarch64 support for qt4 packages.

Most of the patches are derived from debian:
http://anonscm.debian.org/cgit/pkg-kde/qt/qt4-x11.git/tree/debian/patches

Add arch check to set right QT_ARCH.

Disable webkit temporarily for qt4 and qt4-embedded that they fail to build=
:

| runtime/JSValueInlineMethods.h: In constructor
'JSC::JSValue::JSValue(const JSC::JSCell*)':
| runtime/JSValueInlineMethods.h:242:78: error: cast from 'JSC::JSCell*'
to 'int32_t {aka int}' loses precision [-fpermissive]

It has been fix by Qt5, but didn't backport to Qt4. There is an still open
defect for it:
https://bugreports.qt-project.org/browse/QTBUG-35442

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   7 +
 .../0029-aarch64_arm64_fix_arch_detection.patch    |  53 +++
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 +++++++++++++++++=
++++
 .../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch | 124 ++++++
 .../qt4/qt4-4.8.6/0032-aarch64_add_header.patch    |  18 +
 meta/recipes-qt/qt4/qt4-native.inc                 |   4 +
 meta/recipes-qt/qt4/qt4_arch.inc                   |   1 +
 7 files changed, 698 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_ar=
ch_detection.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomi=
c_support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspec=
s.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.p=
atch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.=
8.6.inc
index 924a6ad..074e82d 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -22,6 +22,10 @@ SRC_URI =3D "http://download.qt-project.org/official_rel=
eases/qt/4.8/${PV}/qt-ever
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch =
\
            file://0028-Don-t-crash-on-broken-GIF-images.patch \
+           file://0029-aarch64_arm64_fix_arch_detection.patch \
+           file://0030-aarch64_arm64_qatomic_support.patch \
+           file://0031-aarch64_arm64_mkspecs.patch \
+           file://0032-aarch64_add_header.patch \
            file://g++.conf \
            file://linux.conf \
            "
@@ -36,6 +40,9 @@ S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 # https://bugreports.qt-project.org/browse/QTBUG-39224
 QT_CONFIG_FLAGS_append_mips64 =3D "${@bb.utils.contains("TUNE_FEATURES", "=
n32", " -no-webkit", "" ,d)}"
=20
+# disable webkit for aarch64 temporarily that fails to compile
+QT_CONFIG_FLAGS_append_aarch64 =3D " -no-webkit"
+
 FILES_${QT_BASE_NAME}-tools_append     =3D " ${bindir}/qml ${bindir}/qmlpl=
ugindump"
 FILES_${QT_BASE_NAME}-tools-dbg_append =3D " ${bindir}/.debug/qml ${bindir=
}/.debug/qmlplugindump"
=20
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_dete=
ction.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_det=
ection.patch
new file mode 100644
index 0000000..fbd32b1
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.p=
atch
@@ -0,0 +1,53 @@
+From 800abbba658203fc8e746e3fc780a297cd4110cf Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA9=
rez=3D20Meyer?=3D
+ <perezmeyer@gmail.com>
+Date: Wed, 20 Aug 2014 17:52:49 -0300
+Subject: [PATCH] Fix AArch64/arm64 detection.
+
+The detection needs to go before arm, else the system will detect AArch64/=
arm64
+as arm.
+
+This patch comes from Wookey, he has agreed to put it under BSD or Expat
+to allow it's inclusion in here:
+<https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#255>
+
+Change-Id: Ic2171c03fca8bb871347940fa3a2bc467776f797
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure b/configure
+index a9ba7c8..eb88b72 100755
+--- a/configure
++++ b/configure
+@@ -3241,17 +3241,17 @@ if [ -z "${CFG_HOST_ARCH}" ]; then
+     	fi
+     	CFG_HOST_ARCH=3Ds390
+     	;;
+-    *:*:arm*)
++    *:*:aarch64*|*:*:arm64*)
+         if [ "$OPT_VERBOSE" =3D "yes" ]; then
+-            echo "    ARM (arm)"
++            echo "    AArch64 (aarch64)"
+         fi
+-        CFG_HOST_ARCH=3Darm
++        CFG_HOST_ARCH=3Daarch64
+         ;;
+-    *:*:aarch64*)
++    *:*:arm*)
+         if [ "$OPT_VERBOSE" =3D "yes" ]; then
+-            echo "    AArch64 (aarch64)"
++            echo "    ARM (arm)"
+         fi
+-        CFG_HOST_ARCH=3Daarch64
++        CFG_HOST_ARCH=3Darm
+         ;;
+     Linux:*:sparc*)
+         if [ "$OPT_VERBOSE" =3D "yes" ]; then
+--=20
+2.1.0
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_suppo=
rt.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support=
.patch
new file mode 100644
index 0000000..ba4c2a6
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patc=
h
@@ -0,0 +1,491 @@
+From 294010b562c9846bb2bc4ee9c63ff78adc7c1f4f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA9=
rez=3D20Meyer?=3D
+ <perezmeyer@gmail.com>
+Date: Sat, 15 Mar 2014 15:40:49 -0300
+Subject: [PATCH] Add qatomic support for AArch64 (aka arm64).
+
+Patch by Mark Salter <msalter@redhat.com>
+licensed under BSD:
+
+<https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#195>
+
+This patch is known to not be the most correct way
+to implement them, as it seems to be possible to do it in a faster way,
+but should work non the less until we can provide something better.
+
+Change-Id: Ib392b27dc54691fd4c2ea9896240ad71fb8128cc
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ src/corelib/arch/aarch64/arch.pri            |   4 +
+ src/corelib/arch/aarch64/qatomic_aarch64.cpp |  70 ++++++
+ src/corelib/arch/arch.pri                    |   4 +-
+ src/corelib/arch/qatomic_aarch64.h           | 335 ++++++++++++++++++++++=
+++++
+ src/corelib/arch/qatomic_arch.h              |   2 +
+ 5 files changed, 414 insertions(+), 1 deletion(-)
+ create mode 100644 src/corelib/arch/aarch64/arch.pri
+ create mode 100644 src/corelib/arch/aarch64/qatomic_aarch64.cpp
+ create mode 100644 src/corelib/arch/qatomic_aarch64.h
+
+diff --git a/src/corelib/arch/aarch64/arch.pri b/src/corelib/arch/aarch64/=
arch.pri
+new file mode 100644
+index 0000000..63523d9
+--- /dev/null
++++ b/src/corelib/arch/aarch64/arch.pri
+@@ -0,0 +1,4 @@
++#
++# AArch64 architecture
++#
++SOURCES +=3D $$QT_ARCH_CPP/qatomic_aarch64.cpp
+diff --git a/src/corelib/arch/aarch64/qatomic_aarch64.cpp b/src/corelib/ar=
ch/aarch64/qatomic_aarch64.cpp
+new file mode 100644
+index 0000000..fc851b9
+--- /dev/null
++++ b/src/corelib/arch/aarch64/qatomic_aarch64.cpp
+@@ -0,0 +1,70 @@
++/************************************************************************=
****
++**
++** Copyright (C) 2012, 2013 Digia Plc and/or its subsidiary(-ies).
++** Contact: http://www.qt-project.org/legal
++**
++** This file is part of the QtCore module of the Qt Toolkit.
++**
++** $QT_BEGIN_LICENSE:LGPL$
++** Commercial License Usage
++** Licensees holding valid commercial Qt licenses may use this file in
++** accordance with the commercial license agreement provided with the
++** Software or, alternatively, in accordance with the terms contained in
++** a written agreement between you and Digia.  For licensing terms and
++** conditions see http://qt.digia.com/licensing.  For further information
++** use the contact form at http://qt.digia.com/contact-us.
++**
++** GNU Lesser General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU Lesser
++** General Public License version 2.1 as published by the Free Software
++** Foundation and appearing in the file LICENSE.LGPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU Lesser General Public License version 2.1 requirements
++** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
++**
++** In addition, as a special exception, Digia gives you certain additiona=
l
++** rights.  These rights are described in the Digia Qt LGPL Exception
++** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
++**
++** GNU General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU
++** General Public License version 3.0 as published by the Free Software
++** Foundation and appearing in the file LICENSE.GPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU General Public License version 3.0 requirements will be
++** met: http://www.gnu.org/copyleft/gpl.html.
++**
++**
++** $QT_END_LICENSE$
++**
++*************************************************************************=
***/
++
++#include <QtCore/qglobal.h>
++
++#include <unistd.h>
++#ifdef _POSIX_PRIORITY_SCHEDULING
++# include <sched.h>
++#endif
++#include <time.h>
++
++QT_BEGIN_NAMESPACE
++
++QT_USE_NAMESPACE
++
++Q_CORE_EXPORT void qt_atomic_yield(int *count)
++{
++#ifdef _POSIX_PRIORITY_SCHEDULING
++    if ((*count)++ < 50) {
++        sched_yield();
++    } else
++#endif
++    {
++        struct timespec tm;
++        tm.tv_sec =3D 0;
++        tm.tv_nsec =3D 2000001;
++        nanosleep(&tm, NULL);
++        *count =3D 0;
++    }
++}
++
++QT_END_NAMESPACE
+diff --git a/src/corelib/arch/arch.pri b/src/corelib/arch/arch.pri
+index cd23e5e..f50fca7 100644
+--- a/src/corelib/arch/arch.pri
++++ b/src/corelib/arch/arch.pri
+@@ -31,7 +31,9 @@ integrity:HEADERS +=3D arch/qatomic_integrity.h
+                        arch/qatomic_s390.h \
+                        arch/qatomic_x86_64.h \
+                        arch/qatomic_sh.h \
+-                       arch/qatomic_sh4a.h
++                       arch/qatomic_sh4a.h \
++                       arch/qatomic_aarch64.h \
++
+=20
+ QT_ARCH_CPP =3D $$QT_SOURCE_TREE/src/corelib/arch/$$QT_ARCH
+ DEPENDPATH +=3D $$QT_ARCH_CPP
+diff --git a/src/corelib/arch/qatomic_aarch64.h b/src/corelib/arch/qatomic=
_aarch64.h
+new file mode 100644
+index 0000000..de61ca8
+--- /dev/null
++++ b/src/corelib/arch/qatomic_aarch64.h
+@@ -0,0 +1,335 @@
++/************************************************************************=
****
++**
++** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
++** Contact: http://www.qt-project.org/legal
++**
++** This file is part of the QtCore module of the Qt Toolkit.
++**
++** $QT_BEGIN_LICENSE:LGPL$
++** Commercial License Usage
++** Licensees holding valid commercial Qt licenses may use this file in
++** accordance with the commercial license agreement provided with the
++** Software or, alternatively, in accordance with the terms contained in
++** a written agreement between you and Digia.  For licensing terms and
++** conditions see http://qt.digia.com/licensing.  For further information
++** use the contact form at http://qt.digia.com/contact-us.
++**
++** GNU Lesser General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU Lesser
++** General Public License version 2.1 as published by the Free Software
++** Foundation and appearing in the file LICENSE.LGPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU Lesser General Public License version 2.1 requirements
++** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
++**
++** In addition, as a special exception, Digia gives you certain additiona=
l
++** rights.  These rights are described in the Digia Qt LGPL Exception
++** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
++**
++** GNU General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU
++** General Public License version 3.0 as published by the Free Software
++** Foundation and appearing in the file LICENSE.GPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU General Public License version 3.0 requirements will be
++** met: http://www.gnu.org/copyleft/gpl.html.
++**
++**
++** $QT_END_LICENSE$
++**
++*************************************************************************=
***/
++
++#ifndef QATOMIC_AARCH64_H
++#define QATOMIC_AARCH64_H
++
++QT_BEGIN_HEADER
++
++QT_BEGIN_NAMESPACE
++
++#define Q_ATOMIC_INT_REFERENCE_COUNTING_IS_ALWAYS_NATIVE
++
++inline bool QBasicAtomicInt::isReferenceCountingNative()
++{ return true; }
++inline bool QBasicAtomicInt::isReferenceCountingWaitFree()
++{ return false; }
++
++#define Q_ATOMIC_INT_TEST_AND_SET_IS_ALWAYS_NATIVE
++
++inline bool QBasicAtomicInt::isTestAndSetNative()
++{ return true; }
++inline bool QBasicAtomicInt::isTestAndSetWaitFree()
++{ return false; }
++
++#define Q_ATOMIC_INT_FETCH_AND_STORE_IS_ALWAYS_NATIVE
++
++inline bool QBasicAtomicInt::isFetchAndStoreNative()
++{ return true; }
++inline bool QBasicAtomicInt::isFetchAndStoreWaitFree()
++{ return false; }
++
++#define Q_ATOMIC_INT_FETCH_AND_ADD_IS_ALWAYS_NATIVE
++
++inline bool QBasicAtomicInt::isFetchAndAddNative()
++{ return true; }
++inline bool QBasicAtomicInt::isFetchAndAddWaitFree()
++{ return false; }
++
++#define Q_ATOMIC_POINTER_TEST_AND_SET_IS_ALWAYS_NATIVE
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isTestAndSetNative()
++{ return true; }
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isTestAndSetWaitFree()
++{ return false; }
++
++#define Q_ATOMIC_POINTER_FETCH_AND_STORE_IS_ALWAYS_NATIVE
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndStoreNative()
++{ return true; }
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndStoreWaitFree()
++{ return false; }
++
++#define Q_ATOMIC_POINTER_FETCH_AND_ADD_IS_ALWAYS_NATIVE
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndAddNative()
++{ return true; }
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndAddWaitFree()
++{ return false; }
++
++#ifndef Q_DATA_MEMORY_BARRIER
++# define Q_DATA_MEMORY_BARRIER asm volatile("dmb sy\n":::"memory")
++#endif
++#ifndef Q_COMPILER_MEMORY_BARRIER
++# define Q_COMPILER_MEMORY_BARRIER asm volatile("":::"memory")
++#endif
++
++inline bool QBasicAtomicInt::ref()
++{
++    int newValue;
++
++    Q_COMPILER_MEMORY_BARRIER;
++    newValue =3D __atomic_add_fetch(&_q_value, 1, __ATOMIC_ACQ_REL);
++    Q_COMPILER_MEMORY_BARRIER;
++
++    return newValue !=3D 0;
++}
++
++inline bool QBasicAtomicInt::deref()
++{
++    int newValue;
++
++    Q_COMPILER_MEMORY_BARRIER;
++    newValue =3D __atomic_sub_fetch(&_q_value, 1, __ATOMIC_ACQ_REL);
++    Q_COMPILER_MEMORY_BARRIER;
++
++    return newValue !=3D 0;
++}
++
++inline bool QBasicAtomicInt::testAndSetRelaxed(int expectedValue, int new=
Value)
++{
++    bool val;
++
++    Q_COMPILER_MEMORY_BARRIER;
++    val =3D  __atomic_compare_exchange_n (&_q_value, &expectedValue, newV=
alue,
++                                        false, __ATOMIC_RELAXED, __ATOMIC=
_RELAXED);
++    Q_COMPILER_MEMORY_BARRIER;
++    return val;
++}
++
++inline int QBasicAtomicInt::fetchAndStoreRelaxed(int newValue)
++{
++    int val;
++    Q_COMPILER_MEMORY_BARRIER;
++    val =3D __atomic_exchange_n(&_q_value, newValue, __ATOMIC_RELAXED);
++    Q_COMPILER_MEMORY_BARRIER;
++    return val;
++}
++
++inline int QBasicAtomicInt::fetchAndAddRelaxed(int valueToAdd)
++{
++    int val;
++    Q_COMPILER_MEMORY_BARRIER;
++    val =3D __atomic_fetch_add(&_q_value, valueToAdd, __ATOMIC_RELAXED);
++    Q_COMPILER_MEMORY_BARRIER;
++    return val;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetRelaxed(T *expec=
tedValue, T *newValue)
++{
++    bool val;
++    Q_COMPILER_MEMORY_BARRIER;
++    val =3D  __atomic_compare_exchange_n (&_q_value, &expectedValue, newV=
alue,
++                                        false, __ATOMIC_RELAXED, __ATOMIC=
_RELAXED);
++    Q_COMPILER_MEMORY_BARRIER;
++    return val;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreRelaxed(T *newV=
alue)
++{
++    T *val;
++    Q_COMPILER_MEMORY_BARRIER;
++    val =3D __atomic_exchange_n(&_q_value, newValue, __ATOMIC_RELAXED);
++    Q_COMPILER_MEMORY_BARRIER;
++    return val;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddRelaxed(qptrdiff =
valueToAdd)
++{
++    T *val;
++    Q_COMPILER_MEMORY_BARRIER;
++    val =3D __atomic_fetch_add(&_q_value, valueToAdd, __ATOMIC_RELAXED);
++    Q_COMPILER_MEMORY_BARRIER;
++    return val;
++}
++
++inline bool QBasicAtomicInt::testAndSetAcquire(int expectedValue, int new=
Value)
++{
++    bool returnValue =3D testAndSetRelaxed(expectedValue, newValue);
++    Q_DATA_MEMORY_BARRIER;
++    return returnValue;
++}
++
++inline bool QBasicAtomicInt::testAndSetRelease(int expectedValue, int new=
Value)
++{
++    Q_DATA_MEMORY_BARRIER;
++    return testAndSetRelaxed(expectedValue, newValue);
++}
++
++inline bool QBasicAtomicInt::testAndSetOrdered(int expectedValue, int new=
Value)
++{
++    Q_DATA_MEMORY_BARRIER;
++    bool returnValue =3D testAndSetRelaxed(expectedValue, newValue);
++    Q_COMPILER_MEMORY_BARRIER;
++    return returnValue;
++}
++
++inline int QBasicAtomicInt::fetchAndStoreAcquire(int newValue)
++{
++    int returnValue =3D fetchAndStoreRelaxed(newValue);
++    Q_DATA_MEMORY_BARRIER;
++    return returnValue;
++}
++
++inline int QBasicAtomicInt::fetchAndStoreRelease(int newValue)
++{
++    Q_DATA_MEMORY_BARRIER;
++    return fetchAndStoreRelaxed(newValue);
++}
++
++inline int QBasicAtomicInt::fetchAndStoreOrdered(int newValue)
++{
++    Q_DATA_MEMORY_BARRIER;
++    int returnValue =3D fetchAndStoreRelaxed(newValue);
++    Q_COMPILER_MEMORY_BARRIER;
++    return returnValue;
++}
++
++inline int QBasicAtomicInt::fetchAndAddAcquire(int valueToAdd)
++{
++    int returnValue =3D fetchAndAddRelaxed(valueToAdd);
++    Q_DATA_MEMORY_BARRIER;
++    return returnValue;
++}
++
++inline int QBasicAtomicInt::fetchAndAddRelease(int valueToAdd)
++{
++    Q_DATA_MEMORY_BARRIER;
++    return fetchAndAddRelaxed(valueToAdd);
++}
++
++inline int QBasicAtomicInt::fetchAndAddOrdered(int valueToAdd)
++{
++    Q_DATA_MEMORY_BARRIER;
++    int returnValue =3D fetchAndAddRelaxed(valueToAdd);
++    Q_COMPILER_MEMORY_BARRIER;
++    return returnValue;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetAcquire(T *expec=
tedValue, T *newValue)
++{
++    bool returnValue =3D testAndSetRelaxed(expectedValue, newValue);
++    Q_DATA_MEMORY_BARRIER;
++    return returnValue;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetRelease(T *expec=
tedValue, T *newValue)
++{
++    Q_DATA_MEMORY_BARRIER;
++    return testAndSetRelaxed(expectedValue, newValue);
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetOrdered(T *expec=
tedValue, T *newValue)
++{
++    Q_DATA_MEMORY_BARRIER;
++    bool returnValue =3D testAndSetAcquire(expectedValue, newValue);
++    Q_COMPILER_MEMORY_BARRIER;
++    return returnValue;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreAcquire(T *newV=
alue)
++{
++    T *returnValue =3D fetchAndStoreRelaxed(newValue);
++    Q_DATA_MEMORY_BARRIER;
++    return returnValue;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreRelease(T *newV=
alue)
++{
++    Q_DATA_MEMORY_BARRIER;
++    return fetchAndStoreRelaxed(newValue);
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreOrdered(T *newV=
alue)
++{
++    Q_DATA_MEMORY_BARRIER;
++    T *returnValue =3D fetchAndStoreRelaxed(newValue);
++    Q_COMPILER_MEMORY_BARRIER;
++    return returnValue;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddAcquire(qptrdiff =
valueToAdd)
++{
++    T *returnValue =3D fetchAndAddRelaxed(valueToAdd);
++    Q_DATA_MEMORY_BARRIER;
++    return returnValue;
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddRelease(qptrdiff =
valueToAdd)
++{
++    Q_DATA_MEMORY_BARRIER;
++    return fetchAndAddRelaxed(valueToAdd);
++}
++
++template <typename T>
++Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddOrdered(qptrdiff =
valueToAdd)
++{
++    Q_DATA_MEMORY_BARRIER;
++    T *returnValue =3D fetchAndAddRelaxed(valueToAdd);
++    Q_COMPILER_MEMORY_BARRIER;
++    return returnValue;
++}
++
++#undef Q_DATA_MEMORY_BARRIER
++#undef Q_COMPILER_MEMORY_BARRIER
++
++QT_END_NAMESPACE
++
++QT_END_HEADER
++
++#endif // QATOMIC_AARCH64_H
+diff --git a/src/corelib/arch/qatomic_arch.h b/src/corelib/arch/qatomic_ar=
ch.h
+index 141726c..3e96926 100644
+--- a/src/corelib/arch/qatomic_arch.h
++++ b/src/corelib/arch/qatomic_arch.h
+@@ -94,6 +94,8 @@ QT_BEGIN_HEADER
+ #  include "QtCore/qatomic_sh4a.h"
+ #elif defined(QT_ARCH_NACL)
+ #  include "QtCore/qatomic_generic.h"
++#elif defined(QT_ARCH_AARCH64)
++#  include "QtCore/qatomic_aarch64.h"
+ #else
+ #  error "Qt has not been ported to this architecture"
+ #endif
+--=20
+2.1.0
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch=
 b/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
new file mode 100644
index 0000000..a01e7ad
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
@@ -0,0 +1,124 @@
+From 7090fc80ff630712a90de92403190f647dd38a39 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA9=
rez=3D20Meyer?=3D
+ <perezmeyer@gmail.com>
+Date: Sat, 15 Mar 2014 15:35:00 -0300
+Subject: [PATCH] mkspecs for AArch64 (aka arm64).
+
+Patch by Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
+licensed under either Public Domain or BSD:
+
+<https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#179>
+
+Change-Id: I21f17953234cfb176bac023e52ecdc927fc5c1a9
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ configure                                 |  3 +++
+ mkspecs/linux-g++-aarch64/qmake.conf      | 27 ++++++++++++++++++++
+ mkspecs/linux-g++-aarch64/qplatformdefs.h | 42 ++++++++++++++++++++++++++=
+++++
+ 3 files changed, 72 insertions(+)
+ create mode 100644 mkspecs/linux-g++-aarch64/qmake.conf
+ create mode 100644 mkspecs/linux-g++-aarch64/qplatformdefs.h
+
+diff --git a/configure b/configure
+index a9ba7c8..e57d053 100755
+--- a/configure
++++ b/configure
+@@ -2808,6 +2808,9 @@ if [ "$CFG_EMBEDDED" !=3D "no" ]; then
+             *86_64)
+                 PLATFORM=3Dqws/linux-x86_64-g++
+                 ;;
++            aarch64)
++                PLATFORM=3Dlinux-aarch64-g++
++                ;;
+             *)
+                 PLATFORM=3Dqws/linux-generic-g++
+                 ;;
+diff --git a/mkspecs/linux-g++-aarch64/qmake.conf b/mkspecs/linux-g++-aarc=
h64/qmake.conf
+new file mode 100644
+index 0000000..ebc0a92
+--- /dev/null
++++ b/mkspecs/linux-g++-aarch64/qmake.conf
+@@ -0,0 +1,27 @@
++#
++# qmake configuration for linux-g++
++#
++# Written for GNU/Linux platforms that have both lib and lib64 directorie=
s,
++# like the AMD Opteron.
++#
++
++MAKEFILE_GENERATOR    =3D UNIX
++TARGET_PLATFORM       =3D unix
++TEMPLATE              =3D app
++CONFIG               +=3D qt warn_on release incremental link_prl gdb_dwa=
rf_index
++QT                   +=3D core gui
++QMAKE_INCREMENTAL_STYLE =3D sublib
++
++QMAKE_CFLAGS     =3D
++QMAKE_LFLAGS     =3D
++
++QMAKE_CFLAGS_RELEASE   +=3D -O2
++
++include(../common/linux.conf)
++include(../common/gcc-base-unix.conf)
++include(../common/g++-unix.conf)
++
++QMAKE_LIBDIR_X11      =3D /usr/X11R6/lib64
++QMAKE_LIBDIR_OPENGL   =3D /usr/X11R6/lib64
++
++load(qt_config)
+diff --git a/mkspecs/linux-g++-aarch64/qplatformdefs.h b/mkspecs/linux-g++=
-aarch64/qplatformdefs.h
+new file mode 100644
+index 0000000..562128b
+--- /dev/null
++++ b/mkspecs/linux-g++-aarch64/qplatformdefs.h
+@@ -0,0 +1,42 @@
++/************************************************************************=
****
++**
++** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
++** Contact: http://www.qt-project.org/legal
++**
++** This file is part of the qmake spec of the Qt Toolkit.
++**
++** $QT_BEGIN_LICENSE:LGPL$
++** Commercial License Usage
++** Licensees holding valid commercial Qt licenses may use this file in
++** accordance with the commercial license agreement provided with the
++** Software or, alternatively, in accordance with the terms contained in
++** a written agreement between you and Digia.  For licensing terms and
++** conditions see http://qt.digia.com/licensing.  For further information
++** use the contact form at http://qt.digia.com/contact-us.
++**
++** GNU Lesser General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU Lesser
++** General Public License version 2.1 as published by the Free Software
++** Foundation and appearing in the file LICENSE.LGPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU Lesser General Public License version 2.1 requirements
++** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
++**
++** In addition, as a special exception, Digia gives you certain additiona=
l
++** rights.  These rights are described in the Digia Qt LGPL Exception
++** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
++**
++** GNU General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU
++** General Public License version 3.0 as published by the Free Software
++** Foundation and appearing in the file LICENSE.GPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU General Public License version 3.0 requirements will be
++** met: http://www.gnu.org/copyleft/gpl.html.
++**
++**
++** $QT_END_LICENSE$
++**
++*************************************************************************=
***/
++
++#include "../linux-g++/qplatformdefs.h"
+--=20
+2.1.0
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch b/=
meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
new file mode 100644
index 0000000..7132224
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
@@ -0,0 +1,18 @@
+Add missing header for aarch64. And install ../corelib/arch/qatomic_aarch6=
4.h.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff -Nru qt-everywhere-opensource-src-4.8.6.orig/include/QtCore/qatomic_a=
arch64.h qt-everywhere-opensource-src-4.8.6/include/QtCore/qatomic_aarch64.=
h
+--- qt-everywhere-opensource-src-4.8.6.orig/include/QtCore/qatomic_aarch64=
.h	1970-01-01 08:30:00.000000000 +0830
++++ qt-everywhere-opensource-src-4.8.6/include/QtCore/qatomic_aarch64.h	20=
14-09-09 17:18:03.768352551 +0800
+@@ -0,0 +1 @@
++#include "../../src/corelib/arch/qatomic_aarch64.h"
+--- qt-everywhere-opensource-src-4.8.6/include/QtCore/headers.pri.orig	201=
4-09-09 18:05:37.100430311 +0800
++++ qt-everywhere-opensource-src-4.8.6/include/QtCore/headers.pri	2014-09-=
09 18:05:59.112430911 +0800
+@@ -1,3 +1,3 @@
+-SYNCQT.HEADER_FILES =3D ../corelib/statemachine/qabstractstate.h ../corel=
ib/statemachine/qabstracttransition.h ../corelib/statemachine/qeventtransit=
ion.h ../corelib/statemachine/qfinalstate.h ../corelib/statemachine/qhistor=
ystate.h ../corelib/statemachine/qsignaltransition.h ../corelib/statemachin=
e/qstate.h ../corelib/statemachine/qstatemachine.h ../corelib/arch/qatomic_=
alpha.h ../corelib/arch/qatomic_arch.h ../corelib/arch/qatomic_arm.h ../cor=
elib/arch/qatomic_armv5.h ../corelib/arch/qatomic_armv6.h ../corelib/arch/q=
atomic_armv7.h ../corelib/arch/qatomic_avr32.h ../corelib/arch/qatomic_bfin=
.h ../corelib/arch/qatomic_bootstrap.h ../corelib/arch/qatomic_generic.h ..=
/corelib/arch/qatomic_i386.h ../corelib/arch/qatomic_ia64.h ../corelib/arch=
/qatomic_integrity.h ../corelib/arch/qatomic_m68k.h ../corelib/arch/qatomic=
_macosx.h ../corelib/arch/qatomic_mips.h ../corelib/arch/qatomic_parisc.h .=
./corelib/arch/qatomic_powerpc.h ../corelib/arch/qatomic_s390.h ../corelib/=
arch/qatomic_sh.h ../corelib/arch/qatomic_sh4a.h ../corelib/arch/qatomic_sp=
arc.h ../corelib/arch/qatomic_symbian.h ../corelib/arch/qatomic_vxworks.h .=
./corelib/arch/qatomic_windows.h ../corelib/arch/qatomic_windowsce.h ../cor=
elib/arch/qatomic_x86_64.h ../corelib/thread/qatomic.h ../corelib/thread/qb=
asicatomic.h ../corelib/thread/qmutex.h ../corelib/thread/qreadwritelock.h =
../corelib/thread/qsemaphore.h ../corelib/thread/qthread.h ../corelib/threa=
d/qthreadstorage.h ../corelib/thread/qwaitcondition.h ../corelib/xml/qxmlst=
ream.h ../corelib/concurrent/qfuture.h ../corelib/concurrent/qfutureinterfa=
ce.h ../corelib/concurrent/qfuturesynchronizer.h ../corelib/concurrent/qfut=
urewatcher.h ../corelib/concurrent/qrunnable.h ../corelib/concurrent/qtconc=
urrentcompilertest.h ../corelib/concurrent/qtconcurrentexception.h ../corel=
ib/concurrent/qtconcurrentfilter.h ../corelib/concurrent/qtconcurrentfilter=
kernel.h ../corelib/concurrent/qtconcurrentfunctionwrappers.h ../corelib/co=
ncurrent/qtconcurrentiteratekernel.h ../corelib/concurrent/qtconcurrentmap.=
h ../corelib/concurrent/qtconcurrentmapkernel.h ../corelib/concurrent/qtcon=
currentmedian.h ../corelib/concurrent/qtconcurrentreducekernel.h ../corelib=
/concurrent/qtconcurrentresultstore.h ../corelib/concurrent/qtconcurrentrun=
.h ../corelib/concurrent/qtconcurrentrunbase.h ../corelib/concurrent/qtconc=
urrentstoredfunctioncall.h ../corelib/concurrent/qtconcurrentthreadengine.h=
 ../corelib/concurrent/qthreadpool.h ../corelib/kernel/qabstracteventdispat=
cher.h ../corelib/kernel/qabstractitemmodel.h ../corelib/kernel/qbasictimer=
.h ../corelib/kernel/qcoreapplication.h ../corelib/kernel/qcoreevent.h ../c=
orelib/kernel/qeventloop.h ../corelib/kernel/qfunctions_nacl.h ../corelib/k=
ernel/qfunctions_vxworks.h ../corelib/kernel/qfunctions_wince.h ../corelib/=
kernel/qmath.h ../corelib/kernel/qmetaobject.h ../corelib/kernel/qmetatype.=
h ../corelib/kernel/qmimedata.h ../corelib/kernel/qobject.h ../corelib/kern=
el/qobjectcleanuphandler.h ../corelib/kernel/qobjectdefs.h ../corelib/kerne=
l/qpointer.h ../corelib/kernel/qsharedmemory.h ../corelib/kernel/qsignalmap=
per.h ../corelib/kernel/qsocketnotifier.h ../corelib/kernel/qsystemsemaphor=
e.h ../corelib/kernel/qtimer.h ../corelib/kernel/qtranslator.h ../corelib/k=
ernel/qvariant.h ../corelib/plugin/qfactoryinterface.h ../corelib/plugin/ql=
ibrary.h ../corelib/plugin/qplugin.h ../corelib/plugin/qpluginloader.h ../c=
orelib/plugin/quuid.h ../corelib/global/qconfig-dist.h ../corelib/global/qc=
onfig-large.h ../corelib/global/qconfig-medium.h ../corelib/global/qconfig-=
minimal.h ../corelib/global/qconfig-nacl.h ../corelib/global/qconfig-small.=
h ../corelib/global/qendian.h ../corelib/global/qfeatures.h ../corelib/glob=
al/qglobal.h ../corelib/global/qlibraryinfo.h ../corelib/global/qnamespace.=
h ../corelib/global/qnumeric.h ../corelib/global/qt_windows.h ../corelib/gl=
obal/qconfig.h ../corelib/codecs/qtextcodec.h ../corelib/codecs/qtextcodecp=
lugin.h ../corelib/io/qabstractfileengine.h ../corelib/io/qbuffer.h ../core=
lib/io/qdatastream.h ../corelib/io/qdebug.h ../corelib/io/qdir.h ../corelib=
/io/qdiriterator.h ../corelib/io/qfile.h ../corelib/io/qfileinfo.h ../corel=
ib/io/qfilesystemwatcher.h ../corelib/io/qfsfileengine.h ../corelib/io/qiod=
evice.h ../corelib/io/qprocess.h ../corelib/io/qresource.h ../corelib/io/qs=
ettings.h ../corelib/io/qtemporaryfile.h ../corelib/io/qtextstream.h ../cor=
elib/io/qurl.h ../corelib/animation/qabstractanimation.h ../corelib/animati=
on/qanimationgroup.h ../corelib/animation/qparallelanimationgroup.h ../core=
lib/animation/qpauseanimation.h ../corelib/animation/qpropertyanimation.h .=
./corelib/animation/qsequentialanimationgroup.h ../corelib/animation/qvaria=
ntanimation.h ../corelib/tools/qalgorithms.h ../corelib/tools/qbitarray.h .=
./corelib/tools/qbytearray.h ../corelib/tools/qbytearraymatcher.h ../coreli=
b/tools/qcache.h ../corelib/tools/qchar.h ../corelib/tools/qcontainerfwd.h =
../corelib/tools/qcontiguouscache.h ../corelib/tools/qcryptographichash.h .=
./corelib/tools/qdatetime.h ../corelib/tools/qeasingcurve.h ../corelib/tool=
s/qelapsedtimer.h ../corelib/tools/qhash.h ../corelib/tools/qiterator.h ../=
corelib/tools/qline.h ../corelib/tools/qlinkedlist.h ../corelib/tools/qlist=
.h ../corelib/tools/qlocale.h ../corelib/tools/qlocale_blackberry.h ../core=
lib/tools/qmap.h ../corelib/tools/qmargins.h ../corelib/tools/qpair.h ../co=
relib/tools/qpoint.h ../corelib/tools/qqueue.h ../corelib/tools/qrect.h ../=
corelib/tools/qregexp.h ../corelib/tools/qscopedpointer.h ../corelib/tools/=
qscopedvaluerollback.h ../corelib/tools/qset.h ../corelib/tools/qshareddata=
.h ../corelib/tools/qsharedpointer.h ../corelib/tools/qsharedpointer_impl.h=
 ../corelib/tools/qsize.h ../corelib/tools/qstack.h ../corelib/tools/qstrin=
g.h ../corelib/tools/qstringbuilder.h ../corelib/tools/qstringlist.h ../cor=
elib/tools/qstringmatcher.h ../corelib/tools/qtextboundaryfinder.h ../corel=
ib/tools/qtimeline.h ../corelib/tools/qvarlengtharray.h ../corelib/tools/qv=
ector.h ../../include/QtCore/QtCore=20
++SYNCQT.HEADER_FILES =3D ../corelib/statemachine/qabstractstate.h ../corel=
ib/statemachine/qabstracttransition.h ../corelib/statemachine/qeventtransit=
ion.h ../corelib/statemachine/qfinalstate.h ../corelib/statemachine/qhistor=
ystate.h ../corelib/statemachine/qsignaltransition.h ../corelib/statemachin=
e/qstate.h ../corelib/statemachine/qstatemachine.h ../corelib/arch/qatomic_=
alpha.h ../corelib/arch/qatomic_arch.h ../corelib/arch/qatomic_arm.h ../cor=
elib/arch/qatomic_armv5.h ../corelib/arch/qatomic_armv6.h ../corelib/arch/q=
atomic_armv7.h ../corelib/arch/qatomic_aarch64.h ../corelib/arch/qatomic_av=
r32.h ../corelib/arch/qatomic_bfin.h ../corelib/arch/qatomic_bootstrap.h ..=
/corelib/arch/qatomic_generic.h ../corelib/arch/qatomic_i386.h ../corelib/a=
rch/qatomic_ia64.h ../corelib/arch/qatomic_integrity.h ../corelib/arch/qato=
mic_m68k.h ../corelib/arch/qatomic_macosx.h ../corelib/arch/qatomic_mips.h =
../corelib/arch/qatomic_parisc.h ../corelib/arch/qatomic_powerpc.h ../corel=
ib/arch/qatomic_s390.h ../corelib/arch/qatomic_sh.h ../corelib/arch/qatomic=
_sh4a.h ../corelib/arch/qatomic_sparc.h ../corelib/arch/qatomic_symbian.h .=
./corelib/arch/qatomic_vxworks.h ../corelib/arch/qatomic_windows.h ../corel=
ib/arch/qatomic_windowsce.h ../corelib/arch/qatomic_x86_64.h ../corelib/thr=
ead/qatomic.h ../corelib/thread/qbasicatomic.h ../corelib/thread/qmutex.h .=
./corelib/thread/qreadwritelock.h ../corelib/thread/qsemaphore.h ../corelib=
/thread/qthread.h ../corelib/thread/qthreadstorage.h ../corelib/thread/qwai=
tcondition.h ../corelib/xml/qxmlstream.h ../corelib/concurrent/qfuture.h ..=
/corelib/concurrent/qfutureinterface.h ../corelib/concurrent/qfuturesynchro=
nizer.h ../corelib/concurrent/qfuturewatcher.h ../corelib/concurrent/qrunna=
ble.h ../corelib/concurrent/qtconcurrentcompilertest.h ../corelib/concurren=
t/qtconcurrentexception.h ../corelib/concurrent/qtconcurrentfilter.h ../cor=
elib/concurrent/qtconcurrentfilterkernel.h ../corelib/concurrent/qtconcurre=
ntfunctionwrappers.h ../corelib/concurrent/qtconcurrentiteratekernel.h ../c=
orelib/concurrent/qtconcurrentmap.h ../corelib/concurrent/qtconcurrentmapke=
rnel.h ../corelib/concurrent/qtconcurrentmedian.h ../corelib/concurrent/qtc=
oncurrentreducekernel.h ../corelib/concurrent/qtconcurrentresultstore.h ../=
corelib/concurrent/qtconcurrentrun.h ../corelib/concurrent/qtconcurrentrunb=
ase.h ../corelib/concurrent/qtconcurrentstoredfunctioncall.h ../corelib/con=
current/qtconcurrentthreadengine.h ../corelib/concurrent/qthreadpool.h ../c=
orelib/kernel/qabstracteventdispatcher.h ../corelib/kernel/qabstractitemmod=
el.h ../corelib/kernel/qbasictimer.h ../corelib/kernel/qcoreapplication.h .=
./corelib/kernel/qcoreevent.h ../corelib/kernel/qeventloop.h ../corelib/ker=
nel/qfunctions_nacl.h ../corelib/kernel/qfunctions_vxworks.h ../corelib/ker=
nel/qfunctions_wince.h ../corelib/kernel/qmath.h ../corelib/kernel/qmetaobj=
ect.h ../corelib/kernel/qmetatype.h ../corelib/kernel/qmimedata.h ../coreli=
b/kernel/qobject.h ../corelib/kernel/qobjectcleanuphandler.h ../corelib/ker=
nel/qobjectdefs.h ../corelib/kernel/qpointer.h ../corelib/kernel/qsharedmem=
ory.h ../corelib/kernel/qsignalmapper.h ../corelib/kernel/qsocketnotifier.h=
 ../corelib/kernel/qsystemsemaphore.h ../corelib/kernel/qtimer.h ../corelib=
/kernel/qtranslator.h ../corelib/kernel/qvariant.h ../corelib/plugin/qfacto=
ryinterface.h ../corelib/plugin/qlibrary.h ../corelib/plugin/qplugin.h ../c=
orelib/plugin/qpluginloader.h ../corelib/plugin/quuid.h ../corelib/global/q=
config-dist.h ../corelib/global/qconfig-large.h ../corelib/global/qconfig-m=
edium.h ../corelib/global/qconfig-minimal.h ../corelib/global/qconfig-nacl.=
h ../corelib/global/qconfig-small.h ../corelib/global/qendian.h ../corelib/=
global/qfeatures.h ../corelib/global/qglobal.h ../corelib/global/qlibraryin=
fo.h ../corelib/global/qnamespace.h ../corelib/global/qnumeric.h ../corelib=
/global/qt_windows.h ../corelib/global/qconfig.h ../corelib/codecs/qtextcod=
ec.h ../corelib/codecs/qtextcodecplugin.h ../corelib/io/qabstractfileengine=
.h ../corelib/io/qbuffer.h ../corelib/io/qdatastream.h ../corelib/io/qdebug=
.h ../corelib/io/qdir.h ../corelib/io/qdiriterator.h ../corelib/io/qfile.h =
../corelib/io/qfileinfo.h ../corelib/io/qfilesystemwatcher.h ../corelib/io/=
qfsfileengine.h ../corelib/io/qiodevice.h ../corelib/io/qprocess.h ../corel=
ib/io/qresource.h ../corelib/io/qsettings.h ../corelib/io/qtemporaryfile.h =
../corelib/io/qtextstream.h ../corelib/io/qurl.h ../corelib/animation/qabst=
ractanimation.h ../corelib/animation/qanimationgroup.h ../corelib/animation=
/qparallelanimationgroup.h ../corelib/animation/qpauseanimation.h ../coreli=
b/animation/qpropertyanimation.h ../corelib/animation/qsequentialanimationg=
roup.h ../corelib/animation/qvariantanimation.h ../corelib/tools/qalgorithm=
s.h ../corelib/tools/qbitarray.h ../corelib/tools/qbytearray.h ../corelib/t=
ools/qbytearraymatcher.h ../corelib/tools/qcache.h ../corelib/tools/qchar.h=
 ../corelib/tools/qcontainerfwd.h ../corelib/tools/qcontiguouscache.h ../co=
relib/tools/qcryptographichash.h ../corelib/tools/qdatetime.h ../corelib/to=
ols/qeasingcurve.h ../corelib/tools/qelapsedtimer.h ../corelib/tools/qhash.=
h ../corelib/tools/qiterator.h ../corelib/tools/qline.h ../corelib/tools/ql=
inkedlist.h ../corelib/tools/qlist.h ../corelib/tools/qlocale.h ../corelib/=
tools/qlocale_blackberry.h ../corelib/tools/qmap.h ../corelib/tools/qmargin=
s.h ../corelib/tools/qpair.h ../corelib/tools/qpoint.h ../corelib/tools/qqu=
eue.h ../corelib/tools/qrect.h ../corelib/tools/qregexp.h ../corelib/tools/=
qscopedpointer.h ../corelib/tools/qscopedvaluerollback.h ../corelib/tools/q=
set.h ../corelib/tools/qshareddata.h ../corelib/tools/qsharedpointer.h ../c=
orelib/tools/qsharedpointer_impl.h ../corelib/tools/qsize.h ../corelib/tool=
s/qstack.h ../corelib/tools/qstring.h ../corelib/tools/qstringbuilder.h ../=
corelib/tools/qstringlist.h ../corelib/tools/qstringmatcher.h ../corelib/to=
ols/qtextboundaryfinder.h ../corelib/tools/qtimeline.h ../corelib/tools/qva=
rlengtharray.h ../corelib/tools/qvector.h ../../include/QtCore/QtCore=20
+ SYNCQT.HEADER_CLASSES =3D ../../include/QtCore/QAbstractState ../../inclu=
de/QtCore/QAbstractTransition ../../include/QtCore/QEventTransition ../../i=
nclude/QtCore/QFinalState ../../include/QtCore/QHistoryState ../../include/=
QtCore/QSignalTransition ../../include/QtCore/QState ../../include/QtCore/Q=
StateMachine ../../include/QtCore/QAtomicInt ../../include/QtCore/QAtomicPo=
inter ../../include/QtCore/QBasicAtomicInt ../../include/QtCore/QBasicAtomi=
cPointer ../../include/QtCore/QMutex ../../include/QtCore/QMutexLocker ../.=
./include/QtCore/QMutexData ../../include/QtCore/QReadWriteLock ../../inclu=
de/QtCore/QReadLocker ../../include/QtCore/QWriteLocker ../../include/QtCor=
e/QSemaphore ../../include/QtCore/QThread ../../include/QtCore/QThreadStora=
geData ../../include/QtCore/QThreadStorage ../../include/QtCore/QWaitCondit=
ion ../../include/QtCore/QXmlStreamStringRef ../../include/QtCore/QXmlStrea=
mAttribute ../../include/QtCore/QXmlStreamAttributes ../../include/QtCore/Q=
XmlStreamNamespaceDeclaration ../../include/QtCore/QXmlStreamNamespaceDecla=
rations ../../include/QtCore/QXmlStreamNotationDeclaration ../../include/Qt=
Core/QXmlStreamNotationDeclarations ../../include/QtCore/QXmlStreamEntityDe=
claration ../../include/QtCore/QXmlStreamEntityDeclarations ../../include/Q=
tCore/QXmlStreamEntityResolver ../../include/QtCore/QXmlStreamReader ../../=
include/QtCore/QXmlStreamWriter ../../include/QtCore/QFuture ../../include/=
QtCore/QFutureIterator ../../include/QtCore/QMutableFutureIterator ../../in=
clude/QtCore/QFutureInterfaceBase ../../include/QtCore/QFutureInterface ../=
../include/QtCore/QFutureSynchronizer ../../include/QtCore/QFutureWatcherBa=
se ../../include/QtCore/QFutureWatcher ../../include/QtCore/QRunnable ../..=
/include/QtCore/QtConcurrentFilter ../../include/QtCore/QtConcurrentMap ../=
../include/QtCore/QtConcurrentRun ../../include/QtCore/QThreadPool ../../in=
clude/QtCore/QAbstractEventDispatcher ../../include/QtCore/QModelIndex ../.=
./include/QtCore/QPersistentModelIndex ../../include/QtCore/QModelIndexList=
 ../../include/QtCore/QAbstractItemModel ../../include/QtCore/QAbstractTabl=
eModel ../../include/QtCore/QAbstractListModel ../../include/QtCore/QBasicT=
imer ../../include/QtCore/QCoreApplication ../../include/QtCore/QtCleanUpFu=
nction ../../include/QtCore/QEvent ../../include/QtCore/QTimerEvent ../../i=
nclude/QtCore/QChildEvent ../../include/QtCore/QCustomEvent ../../include/Q=
tCore/QDynamicPropertyChangeEvent ../../include/QtCore/QEventLoop ../../inc=
lude/QtCore/QMetaMethod ../../include/QtCore/QMetaEnum ../../include/QtCore=
/QMetaProperty ../../include/QtCore/QMetaClassInfo ../../include/QtCore/QMe=
taType ../../include/QtCore/QMetaTypeId ../../include/QtCore/QMetaTypeId2 .=
./../include/QtCore/QMimeData ../../include/QtCore/QObjectList ../../includ=
e/QtCore/QObjectData ../../include/QtCore/QObject ../../include/QtCore/QObj=
ectUserData ../../include/QtCore/QObjectCleanupHandler ../../include/QtCore=
/QGenericArgument ../../include/QtCore/QGenericReturnArgument ../../include=
/QtCore/QArgument ../../include/QtCore/QReturnArgument ../../include/QtCore=
/QMetaObject ../../include/QtCore/QMetaObjectAccessor ../../include/QtCore/=
QMetaObjectExtraData ../../include/QtCore/QPointer ../../include/QtCore/QSh=
aredMemory ../../include/QtCore/QSignalMapper ../../include/QtCore/QSocketN=
otifier ../../include/QtCore/QSystemSemaphore ../../include/QtCore/QTimer .=
./../include/QtCore/QTranslator ../../include/QtCore/QVariant ../../include=
/QtCore/QVariantList ../../include/QtCore/QVariantMap ../../include/QtCore/=
QVariantHash ../../include/QtCore/QVariantComparisonHelper ../../include/Qt=
Core/QFactoryInterface ../../include/QtCore/QLibrary ../../include/QtCore/Q=
tPlugin ../../include/QtCore/QtPluginInstanceFunction ../../include/QtCore/=
QPluginLoader ../../include/QtCore/QUuid ../../include/QtCore/QtEndian ../.=
./include/QtCore/QtGlobal ../../include/QtCore/QIntegerForSize ../../includ=
e/QtCore/QNoImplicitBoolCast ../../include/QtCore/Q_INT8 ../../include/QtCo=
re/Q_UINT8 ../../include/QtCore/Q_INT16 ../../include/QtCore/Q_UINT16 ../..=
/include/QtCore/Q_INT32 ../../include/QtCore/Q_UINT32 ../../include/QtCore/=
Q_INT64 ../../include/QtCore/Q_UINT64 ../../include/QtCore/Q_LLONG ../../in=
clude/QtCore/Q_ULLONG ../../include/QtCore/Q_LONG ../../include/QtCore/Q_UL=
ONG ../../include/QtCore/QSysInfo ../../include/QtCore/QtMsgHandler ../../i=
nclude/QtCore/QGlobalStatic ../../include/QtCore/QGlobalStaticDeleter ../..=
/include/QtCore/QBool ../../include/QtCore/QTypeInfo ../../include/QtCore/Q=
Flag ../../include/QtCore/QIncompatibleFlag ../../include/QtCore/QFlags ../=
../include/QtCore/QForeachContainer ../../include/QtCore/QForeachContainerB=
ase ../../include/QtCore/QLibraryInfo ../../include/QtCore/Qt ../../include=
/QtCore/QInternal ../../include/QtCore/QCOORD ../../include/QtCore/QtConfig=
 ../../include/QtCore/QTextCodec ../../include/QtCore/QTextEncoder ../../in=
clude/QtCore/QTextDecoder ../../include/QtCore/QTextCodecFactoryInterface .=
./../include/QtCore/QTextCodecPlugin ../../include/QtCore/QAbstractFileEngi=
ne ../../include/QtCore/QAbstractFileEngineHandler ../../include/QtCore/QAb=
stractFileEngineIterator ../../include/QtCore/QBuffer ../../include/QtCore/=
QDataStream ../../include/QtCore/QtDebug ../../include/QtCore/QDebug ../../=
include/QtCore/QNoDebug ../../include/QtCore/QDir ../../include/QtCore/QDir=
Iterator ../../include/QtCore/QFile ../../include/QtCore/QFileInfo ../../in=
clude/QtCore/QFileInfoList ../../include/QtCore/QFileInfoListIterator ../..=
/include/QtCore/QFileSystemWatcher ../../include/QtCore/QFSFileEngine ../..=
/include/QtCore/QIODevice ../../include/QtCore/Q_PID ../../include/QtCore/Q=
ProcessEnvironment ../../include/QtCore/QProcess ../../include/QtCore/QReso=
urce ../../include/QtCore/QSettings ../../include/QtCore/QTemporaryFile ../=
../include/QtCore/QTextStream ../../include/QtCore/QTextStreamFunction ../.=
./include/QtCore/QTextStreamManipulator ../../include/QtCore/QTS ../../incl=
ude/QtCore/QTextIStream ../../include/QtCore/QTextOStream ../../include/QtC=
ore/QUrl ../../include/QtCore/QAbstractAnimation ../../include/QtCore/QAnim=
ationDriver ../../include/QtCore/QAnimationGroup ../../include/QtCore/QPara=
llelAnimationGroup ../../include/QtCore/QPauseAnimation ../../include/QtCor=
e/QPropertyAnimation ../../include/QtCore/QSequentialAnimationGroup ../../i=
nclude/QtCore/QVariantAnimation ../../include/QtCore/QtAlgorithms ../../inc=
lude/QtCore/QBitArray ../../include/QtCore/QBitRef ../../include/QtCore/QBy=
teArray ../../include/QtCore/QByteRef ../../include/QtCore/QByteArrayMatche=
r ../../include/QtCore/QCache ../../include/QtCore/QLatin1Char ../../includ=
e/QtCore/QChar ../../include/QtCore/QtContainerFwd ../../include/QtCore/QCo=
ntiguousCacheData ../../include/QtCore/QContiguousCacheTypedData ../../incl=
ude/QtCore/QContiguousCache ../../include/QtCore/QCryptographicHash ../../i=
nclude/QtCore/QDate ../../include/QtCore/QTime ../../include/QtCore/QDateTi=
me ../../include/QtCore/QEasingCurve ../../include/QtCore/QElapsedTimer ../=
../include/QtCore/QHashData ../../include/QtCore/QHashDummyValue ../../incl=
ude/QtCore/QHashDummyNode ../../include/QtCore/QHashNode ../../include/QtCo=
re/QHash ../../include/QtCore/QMultiHash ../../include/QtCore/QHashIterator=
 ../../include/QtCore/QMutableHashIterator ../../include/QtCore/QLine ../..=
/include/QtCore/QLineF ../../include/QtCore/QLinkedListData ../../include/Q=
tCore/QLinkedListNode ../../include/QtCore/QLinkedList ../../include/QtCore=
/QLinkedListIterator ../../include/QtCore/QMutableLinkedListIterator ../../=
include/QtCore/QListData ../../include/QtCore/QList ../../include/QtCore/QL=
istIterator ../../include/QtCore/QMutableListIterator ../../include/QtCore/=
QSystemLocale ../../include/QtCore/QLocale ../../include/QtCore/QBBSystemLo=
caleData ../../include/QtCore/QMapData ../../include/QtCore/QMapNode ../../=
include/QtCore/QMapPayloadNode ../../include/QtCore/QMap ../../include/QtCo=
re/QMultiMap ../../include/QtCore/QMapIterator ../../include/QtCore/QMutabl=
eMapIterator ../../include/QtCore/QMargins ../../include/QtCore/QPair ../..=
/include/QtCore/QPoint ../../include/QtCore/QPointF ../../include/QtCore/QQ=
ueue ../../include/QtCore/QRect ../../include/QtCore/QRectF ../../include/Q=
tCore/QRegExp ../../include/QtCore/QScopedPointerDeleter ../../include/QtCo=
re/QScopedPointerArrayDeleter ../../include/QtCore/QScopedPointerPodDeleter=
 ../../include/QtCore/QScopedPointer ../../include/QtCore/QScopedArrayPoint=
er ../../include/QtCore/QScopedValueRollback ../../include/QtCore/QSet ../.=
./include/QtCore/QSetIterator ../../include/QtCore/QMutableSetIterator ../.=
./include/QtCore/QSharedData ../../include/QtCore/QSharedDataPointer ../../=
include/QtCore/QExplicitlySharedDataPointer ../../include/QtCore/QSharedPoi=
nter ../../include/QtCore/QWeakPointer ../../include/QtCore/QSize ../../inc=
lude/QtCore/QSizeF ../../include/QtCore/QStack ../../include/QtCore/QStdWSt=
ring ../../include/QtCore/QString ../../include/QtCore/QLatin1String ../../=
include/QtCore/QCharRef ../../include/QtCore/QConstString ../../include/QtC=
ore/QStringRef ../../include/QtCore/QLatin1Literal ../../include/QtCore/QAb=
stractConcatenable ../../include/QtCore/QConcatenable ../../include/QtCore/=
QStringBuilder ../../include/QtCore/QStringListIterator ../../include/QtCor=
e/QMutableStringListIterator ../../include/QtCore/QStringList ../../include=
/QtCore/QStringMatcher ../../include/QtCore/QTextBoundaryFinder ../../inclu=
de/QtCore/QTimeLine ../../include/QtCore/QVarLengthArray ../../include/QtCo=
re/QVectorData ../../include/QtCore/QVectorTypedData ../../include/QtCore/Q=
Vector ../../include/QtCore/QVectorIterator ../../include/QtCore/QMutableVe=
ctorIterator=20
+ SYNCQT.PRIVATE_HEADER_FILES =3D ../corelib/statemachine/qabstractstate_p.=
h ../corelib/statemachine/qabstracttransition_p.h ../corelib/statemachine/q=
eventtransition_p.h ../corelib/statemachine/qhistorystate_p.h ../corelib/st=
atemachine/qsignaleventgenerator_p.h ../corelib/statemachine/qsignaltransit=
ion_p.h ../corelib/statemachine/qstate_p.h ../corelib/statemachine/qstatema=
chine_p.h ../corelib/thread/qmutex_p.h ../corelib/thread/qmutexpool_p.h ../=
corelib/thread/qorderedmutexlocker_p.h ../corelib/thread/qreadwritelock_p.h=
 ../corelib/thread/qthread_p.h ../corelib/xml/qxmlstream_p.h ../corelib/xml=
/qxmlutils_p.h ../corelib/concurrent/qfutureinterface_p.h ../corelib/concur=
rent/qfuturewatcher_p.h ../corelib/concurrent/qthreadpool_p.h ../corelib/ke=
rnel/qabstracteventdispatcher_p.h ../corelib/kernel/qabstractitemmodel_p.h =
../corelib/kernel/qcore_mac_p.h ../corelib/kernel/qcore_symbian_p.h ../core=
lib/kernel/qcore_unix_p.h ../corelib/kernel/qcoreapplication_p.h ../corelib=
/kernel/qcorecmdlineargs_p.h ../corelib/kernel/qcoreglobaldata_p.h ../corel=
ib/kernel/qcrashhandler_p.h ../corelib/kernel/qeventdispatcher_blackberry_p=
.h ../corelib/kernel/qeventdispatcher_glib_p.h ../corelib/kernel/qeventdisp=
atcher_symbian_p.h ../corelib/kernel/qeventdispatcher_unix_p.h ../corelib/k=
ernel/qeventdispatcher_win_p.h ../corelib/kernel/qfunctions_p.h ../corelib/=
kernel/qmetaobject_p.h ../corelib/kernel/qobject_p.h ../corelib/kernel/qsha=
redmemory_p.h ../corelib/kernel/qsystemerror_p.h ../corelib/kernel/qsystems=
emaphore_p.h ../corelib/kernel/qtranslator_p.h ../corelib/kernel/qvariant_p=
.h ../corelib/kernel/qwineventnotifier_p.h ../corelib/plugin/qelfparser_p.h=
 ../corelib/plugin/qfactoryloader_p.h ../corelib/plugin/qlibrary_p.h ../cor=
elib/plugin/qsystemlibrary_p.h ../corelib/global/qnumeric_p.h ../corelib/gl=
obal/qt_pch.h ../corelib/codecs/qfontlaocodec_p.h ../corelib/codecs/qiconvc=
odec_p.h ../corelib/codecs/qisciicodec_p.h ../corelib/codecs/qlatincodec_p.=
h ../corelib/codecs/qsimplecodec_p.h ../corelib/codecs/qtextcodec_p.h ../co=
relib/codecs/qtsciicodec_p.h ../corelib/codecs/qutfcodec_p.h ../corelib/io/=
qabstractfileengine_p.h ../corelib/io/qdatastream_p.h ../corelib/io/qdataur=
l_p.h ../corelib/io/qdir_p.h ../corelib/io/qfile_p.h ../corelib/io/qfileinf=
o_p.h ../corelib/io/qfilesystemengine_p.h ../corelib/io/qfilesystementry_p.=
h ../corelib/io/qfilesystemiterator_p.h ../corelib/io/qfilesystemmetadata_p=
.h ../corelib/io/qfilesystemwatcher_dnotify_p.h ../corelib/io/qfilesystemwa=
tcher_fsevents_p.h ../corelib/io/qfilesystemwatcher_inotify_p.h ../corelib/=
io/qfilesystemwatcher_kqueue_p.h ../corelib/io/qfilesystemwatcher_p.h ../co=
relib/io/qfilesystemwatcher_symbian_p.h ../corelib/io/qfilesystemwatcher_wi=
n_p.h ../corelib/io/qfsfileengine_iterator_p.h ../corelib/io/qfsfileengine_=
p.h ../corelib/io/qiodevice_p.h ../corelib/io/qnoncontiguousbytedevice_p.h =
../corelib/io/qprocess_p.h ../corelib/io/qresource_iterator_p.h ../corelib/=
io/qresource_p.h ../corelib/io/qsettings_p.h ../corelib/io/qtldurl_p.h ../c=
orelib/io/qurltlds_p.h ../corelib/io/qwindowspipewriter_p.h ../corelib/anim=
ation/qabstractanimation_p.h ../corelib/animation/qanimationgroup_p.h ../co=
relib/animation/qparallelanimationgroup_p.h ../corelib/animation/qpropertya=
nimation_p.h ../corelib/animation/qsequentialanimationgroup_p.h ../corelib/=
animation/qvariantanimation_p.h ../corelib/tools/qbytedata_p.h ../corelib/t=
ools/qdatetime_p.h ../corelib/tools/qharfbuzz_p.h ../corelib/tools/qlocale_=
data_p.h ../corelib/tools/qlocale_p.h ../corelib/tools/qlocale_tools_p.h ..=
/corelib/tools/qpodlist_p.h ../corelib/tools/qringbuffer_p.h ../corelib/too=
ls/qscopedpointer_p.h ../corelib/tools/qsimd_p.h ../corelib/tools/qtools_p.=
h ../corelib/tools/qunicodetables_p.h=20
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-n=
ative.inc
index bb16da6..70bda73 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -18,6 +18,10 @@ SRC_URI =3D "http://download.qt-project.org/official_rel=
eases/qt/4.8/${PV}/qt-ever
            file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch=
 \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://0021-configure-make-qt4-native-work-with-long-building-p=
a.patch \
+           file://0029-aarch64_arm64_fix_arch_detection.patch \
+           file://0030-aarch64_arm64_qatomic_support.patch \
+           file://0031-aarch64_arm64_mkspecs.patch \
+           file://0032-aarch64_add_header.patch \
            file://g++.conf \
            file://linux.conf \
 	"
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arc=
h.inc
index c1d35ab..07512db 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -4,6 +4,7 @@ ARM_INSTRUCTION_SET =3D "arm"
=20
 set_arch() {
    case ${TARGET_ARCH} in
+       aarch64)  QT_ARCH=3Daarch64 ;;
        arm*)     QT_ARCH=3Darm ;;
        i*86*)    QT_ARCH=3Di386 ;;
        mips*)    QT_ARCH=3Dmips ;;
--=20
1.9.1


