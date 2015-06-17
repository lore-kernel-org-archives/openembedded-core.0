Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4231E73CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 01:40:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5H1e5ql013398
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jun 2015 18:40:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 16 Jun 2015 18:40:05 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 17 Jun 2015 09:32:47 +0800
Message-ID: <1434504767-17802-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434504767-17802-1-git-send-email-kai.kang@windriver.com>
References: <1434504767-17802-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] qt4-4.8.7: restore arm64 patches which are dropped by mistake
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
X-List-Received-Date: Wed, 17 Jun 2015 01:40:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

During upgrade qt4 from 4.8.6 to 4.8.7, four arm64 patches are removed.
But three of them are dropped by mistake that they are not merged by
upstream and still needed.

Restore them.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |   3 +
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 +++++++++++++++++=
++++
 .../qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch | 124 ++++++
 .../qt4/qt4-4.8.7/0032-aarch64_add_header.patch    |  18 +
 4 files changed, 636 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomi=
c_support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspec=
s.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.p=
atch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.7.inc b/meta/recipes-qt/qt4/qt4-4.=
8.7.inc
index 2f580cc..67fad3a 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.7.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
@@ -22,6 +22,9 @@ SRC_URI =3D "http://download.qt-project.org/official_rele=
ases/qt/4.8/${PV}/qt-ever
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch =
\
            file://0028-Don-t-crash-on-broken-GIF-images.patch \
+           file://0030-aarch64_arm64_qatomic_support.patch \
+           file://0031-aarch64_arm64_mkspecs.patch \
+           file://0032-aarch64_add_header.patch \
            file://Fix-QWSLock-invalid-argument-logs.patch \
            file://add_check_for_aarch64_32.patch \
            file://g++.conf \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_suppo=
rt.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_support=
.patch
new file mode 100644
index 0000000..ba4c2a6
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/0030-aarch64_arm64_qatomic_support.patc=
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
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch=
 b/meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch
new file mode 100644
index 0000000..a01e7ad
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/0031-aarch64_arm64_mkspecs.patch
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
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch b/=
meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch
new file mode 100644
index 0000000..178f784
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/0032-aarch64_add_header.patch
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
+-SYNCQT.HEADER_FILES =3D ../corelib/kernel/qabstracteventdispatcher.h ../c=
orelib/kernel/qabstractitemmodel.h ../corelib/kernel/qbasictimer.h ../corel=
ib/kernel/qcoreapplication.h ../corelib/kernel/qcoreevent.h ../corelib/kern=
el/qeventloop.h ../corelib/kernel/qfunctions_nacl.h ../corelib/kernel/qfunc=
tions_vxworks.h ../corelib/kernel/qfunctions_wince.h ../corelib/kernel/qmat=
h.h ../corelib/kernel/qmetaobject.h ../corelib/kernel/qmetatype.h ../coreli=
b/kernel/qmimedata.h ../corelib/kernel/qobject.h ../corelib/kernel/qobjectc=
leanuphandler.h ../corelib/kernel/qobjectdefs.h ../corelib/kernel/qpointer.=
h ../corelib/kernel/qsharedmemory.h ../corelib/kernel/qsignalmapper.h ../co=
relib/kernel/qsocketnotifier.h ../corelib/kernel/qsystemsemaphore.h ../core=
lib/kernel/qtimer.h ../corelib/kernel/qtranslator.h ../corelib/kernel/qvari=
ant.h ../corelib/animation/qabstractanimation.h ../corelib/animation/qanima=
tiongroup.h ../corelib/animation/qparallelanimationgroup.h ../corelib/anima=
tion/qpauseanimation.h ../corelib/animation/qpropertyanimation.h ../corelib=
/animation/qsequentialanimationgroup.h ../corelib/animation/qvariantanimati=
on.h ../corelib/arch/qatomic_alpha.h ../corelib/arch/qatomic_arch.h ../core=
lib/arch/qatomic_arm.h ../corelib/arch/qatomic_armv5.h ../corelib/arch/qato=
mic_armv6.h ../corelib/arch/qatomic_armv7.h ../corelib/arch/qatomic_avr32.h=
 ../corelib/arch/qatomic_bfin.h ../corelib/arch/qatomic_bootstrap.h ../core=
lib/arch/qatomic_generic.h ../corelib/arch/qatomic_i386.h ../corelib/arch/q=
atomic_ia64.h ../corelib/arch/qatomic_integrity.h ../corelib/arch/qatomic_m=
68k.h ../corelib/arch/qatomic_macosx.h ../corelib/arch/qatomic_mips.h ../co=
relib/arch/qatomic_parisc.h ../corelib/arch/qatomic_powerpc.h ../corelib/ar=
ch/qatomic_s390.h ../corelib/arch/qatomic_sh.h ../corelib/arch/qatomic_sh4a=
.h ../corelib/arch/qatomic_sparc.h ../corelib/arch/qatomic_symbian.h ../cor=
elib/arch/qatomic_vxworks.h ../corelib/arch/qatomic_windows.h ../corelib/ar=
ch/qatomic_windowsce.h ../corelib/arch/qatomic_x86_64.h ../corelib/tools/qa=
lgorithms.h ../corelib/tools/qbitarray.h ../corelib/tools/qbytearray.h ../c=
orelib/tools/qbytearraymatcher.h ../corelib/tools/qcache.h ../corelib/tools=
/qchar.h ../corelib/tools/qcontainerfwd.h ../corelib/tools/qcontiguouscache=
.h ../corelib/tools/qcryptographichash.h ../corelib/tools/qdatetime.h ../co=
relib/tools/qeasingcurve.h ../corelib/tools/qelapsedtimer.h ../corelib/tool=
s/qhash.h ../corelib/tools/qiterator.h ../corelib/tools/qline.h ../corelib/=
tools/qlinkedlist.h ../corelib/tools/qlist.h ../corelib/tools/qlocale.h ../=
corelib/tools/qlocale_blackberry.h ../corelib/tools/qmap.h ../corelib/tools=
/qmargins.h ../corelib/tools/qpair.h ../corelib/tools/qpoint.h ../corelib/t=
ools/qqueue.h ../corelib/tools/qrect.h ../corelib/tools/qregexp.h ../coreli=
b/tools/qscopedpointer.h ../corelib/tools/qscopedvaluerollback.h ../corelib=
/tools/qset.h ../corelib/tools/qshareddata.h ../corelib/tools/qsharedpointe=
r.h ../corelib/tools/qsharedpointer_impl.h ../corelib/tools/qsize.h ../core=
lib/tools/qstack.h ../corelib/tools/qstring.h ../corelib/tools/qstringbuild=
er.h ../corelib/tools/qstringlist.h ../corelib/tools/qstringmatcher.h ../co=
relib/tools/qtextboundaryfinder.h ../corelib/tools/qtimeline.h ../corelib/t=
ools/qvarlengtharray.h ../corelib/tools/qvector.h ../corelib/plugin/qfactor=
yinterface.h ../corelib/plugin/qlibrary.h ../corelib/plugin/qplugin.h ../co=
relib/plugin/qpluginloader.h ../corelib/plugin/quuid.h ../corelib/xml/qxmls=
tream.h ../corelib/thread/qatomic.h ../corelib/thread/qbasicatomic.h ../cor=
elib/thread/qmutex.h ../corelib/thread/qreadwritelock.h ../corelib/thread/q=
semaphore.h ../corelib/thread/qthread.h ../corelib/thread/qthreadstorage.h =
../corelib/thread/qwaitcondition.h ../corelib/statemachine/qabstractstate.h=
 ../corelib/statemachine/qabstracttransition.h ../corelib/statemachine/qeve=
nttransition.h ../corelib/statemachine/qfinalstate.h ../corelib/statemachin=
e/qhistorystate.h ../corelib/statemachine/qsignaltransition.h ../corelib/st=
atemachine/qstate.h ../corelib/statemachine/qstatemachine.h ../corelib/conc=
urrent/qfuture.h ../corelib/concurrent/qfutureinterface.h ../corelib/concur=
rent/qfuturesynchronizer.h ../corelib/concurrent/qfuturewatcher.h ../coreli=
b/concurrent/qrunnable.h ../corelib/concurrent/qtconcurrentcompilertest.h .=
./corelib/concurrent/qtconcurrentexception.h ../corelib/concurrent/qtconcur=
rentfilter.h ../corelib/concurrent/qtconcurrentfilterkernel.h ../corelib/co=
ncurrent/qtconcurrentfunctionwrappers.h ../corelib/concurrent/qtconcurrenti=
teratekernel.h ../corelib/concurrent/qtconcurrentmap.h ../corelib/concurren=
t/qtconcurrentmapkernel.h ../corelib/concurrent/qtconcurrentmedian.h ../cor=
elib/concurrent/qtconcurrentreducekernel.h ../corelib/concurrent/qtconcurre=
ntresultstore.h ../corelib/concurrent/qtconcurrentrun.h ../corelib/concurre=
nt/qtconcurrentrunbase.h ../corelib/concurrent/qtconcurrentstoredfunctionca=
ll.h ../corelib/concurrent/qtconcurrentthreadengine.h ../corelib/concurrent=
/qthreadpool.h ../corelib/io/qabstractfileengine.h ../corelib/io/qbuffer.h =
../corelib/io/qdatastream.h ../corelib/io/qdebug.h ../corelib/io/qdir.h ../=
corelib/io/qdiriterator.h ../corelib/io/qfile.h ../corelib/io/qfileinfo.h .=
./corelib/io/qfilesystemwatcher.h ../corelib/io/qfsfileengine.h ../corelib/=
io/qiodevice.h ../corelib/io/qprocess.h ../corelib/io/qresource.h ../coreli=
b/io/qsettings.h ../corelib/io/qtemporaryfile.h ../corelib/io/qtextstream.h=
 ../corelib/io/qurl.h ../corelib/global/qconfig-dist.h ../corelib/global/qc=
onfig-large.h ../corelib/global/qconfig-medium.h ../corelib/global/qconfig-=
minimal.h ../corelib/global/qconfig-nacl.h ../corelib/global/qconfig-small.=
h ../corelib/global/qendian.h ../corelib/global/qfeatures.h ../corelib/glob=
al/qglobal.h ../corelib/global/qlibraryinfo.h ../corelib/global/qnamespace.=
h ../corelib/global/qnumeric.h ../corelib/global/qt_windows.h ../corelib/gl=
obal/qconfig.h ../corelib/codecs/qtextcodec.h ../corelib/codecs/qtextcodecp=
lugin.h ../../include/QtCore/QtCore=20
++SYNCQT.HEADER_FILES =3D ../corelib/kernel/qabstracteventdispatcher.h ../c=
orelib/kernel/qabstractitemmodel.h ../corelib/kernel/qbasictimer.h ../corel=
ib/kernel/qcoreapplication.h ../corelib/kernel/qcoreevent.h ../corelib/kern=
el/qeventloop.h ../corelib/kernel/qfunctions_nacl.h ../corelib/kernel/qfunc=
tions_vxworks.h ../corelib/kernel/qfunctions_wince.h ../corelib/kernel/qmat=
h.h ../corelib/kernel/qmetaobject.h ../corelib/kernel/qmetatype.h ../coreli=
b/kernel/qmimedata.h ../corelib/kernel/qobject.h ../corelib/kernel/qobjectc=
leanuphandler.h ../corelib/kernel/qobjectdefs.h ../corelib/kernel/qpointer.=
h ../corelib/kernel/qsharedmemory.h ../corelib/kernel/qsignalmapper.h ../co=
relib/kernel/qsocketnotifier.h ../corelib/kernel/qsystemsemaphore.h ../core=
lib/kernel/qtimer.h ../corelib/kernel/qtranslator.h ../corelib/kernel/qvari=
ant.h ../corelib/animation/qabstractanimation.h ../corelib/animation/qanima=
tiongroup.h ../corelib/animation/qparallelanimationgroup.h ../corelib/anima=
tion/qpauseanimation.h ../corelib/animation/qpropertyanimation.h ../corelib=
/animation/qsequentialanimationgroup.h ../corelib/animation/qvariantanimati=
on.h ../corelib/arch/qatomic_alpha.h ../corelib/arch/qatomic_arch.h ../core=
lib/arch/qatomic_arm.h ../corelib/arch/qatomic_armv5.h ../corelib/arch/qato=
mic_armv6.h ../corelib/arch/qatomic_armv7.h ../corelib/arch/qatomic_aarch64=
.h ../corelib/arch/qatomic_avr32.h ../corelib/arch/qatomic_bfin.h ../coreli=
b/arch/qatomic_bootstrap.h ../corelib/arch/qatomic_generic.h ../corelib/arc=
h/qatomic_i386.h ../corelib/arch/qatomic_ia64.h ../corelib/arch/qatomic_int=
egrity.h ../corelib/arch/qatomic_m68k.h ../corelib/arch/qatomic_macosx.h ..=
/corelib/arch/qatomic_mips.h ../corelib/arch/qatomic_parisc.h ../corelib/ar=
ch/qatomic_powerpc.h ../corelib/arch/qatomic_s390.h ../corelib/arch/qatomic=
_sh.h ../corelib/arch/qatomic_sh4a.h ../corelib/arch/qatomic_sparc.h ../cor=
elib/arch/qatomic_symbian.h ../corelib/arch/qatomic_vxworks.h ../corelib/ar=
ch/qatomic_windows.h ../corelib/arch/qatomic_windowsce.h ../corelib/arch/qa=
tomic_x86_64.h ../corelib/tools/qalgorithms.h ../corelib/tools/qbitarray.h =
../corelib/tools/qbytearray.h ../corelib/tools/qbytearraymatcher.h ../corel=
ib/tools/qcache.h ../corelib/tools/qchar.h ../corelib/tools/qcontainerfwd.h=
 ../corelib/tools/qcontiguouscache.h ../corelib/tools/qcryptographichash.h =
../corelib/tools/qdatetime.h ../corelib/tools/qeasingcurve.h ../corelib/too=
ls/qelapsedtimer.h ../corelib/tools/qhash.h ../corelib/tools/qiterator.h ..=
/corelib/tools/qline.h ../corelib/tools/qlinkedlist.h ../corelib/tools/qlis=
t.h ../corelib/tools/qlocale.h ../corelib/tools/qlocale_blackberry.h ../cor=
elib/tools/qmap.h ../corelib/tools/qmargins.h ../corelib/tools/qpair.h ../c=
orelib/tools/qpoint.h ../corelib/tools/qqueue.h ../corelib/tools/qrect.h ..=
/corelib/tools/qregexp.h ../corelib/tools/qscopedpointer.h ../corelib/tools=
/qscopedvaluerollback.h ../corelib/tools/qset.h ../corelib/tools/qshareddat=
a.h ../corelib/tools/qsharedpointer.h ../corelib/tools/qsharedpointer_impl.=
h ../corelib/tools/qsize.h ../corelib/tools/qstack.h ../corelib/tools/qstri=
ng.h ../corelib/tools/qstringbuilder.h ../corelib/tools/qstringlist.h ../co=
relib/tools/qstringmatcher.h ../corelib/tools/qtextboundaryfinder.h ../core=
lib/tools/qtimeline.h ../corelib/tools/qvarlengtharray.h ../corelib/tools/q=
vector.h ../corelib/plugin/qfactoryinterface.h ../corelib/plugin/qlibrary.h=
 ../corelib/plugin/qplugin.h ../corelib/plugin/qpluginloader.h ../corelib/p=
lugin/quuid.h ../corelib/xml/qxmlstream.h ../corelib/thread/qatomic.h ../co=
relib/thread/qbasicatomic.h ../corelib/thread/qmutex.h ../corelib/thread/qr=
eadwritelock.h ../corelib/thread/qsemaphore.h ../corelib/thread/qthread.h .=
./corelib/thread/qthreadstorage.h ../corelib/thread/qwaitcondition.h ../cor=
elib/statemachine/qabstractstate.h ../corelib/statemachine/qabstracttransit=
ion.h ../corelib/statemachine/qeventtransition.h ../corelib/statemachine/qf=
inalstate.h ../corelib/statemachine/qhistorystate.h ../corelib/statemachine=
/qsignaltransition.h ../corelib/statemachine/qstate.h ../corelib/statemachi=
ne/qstatemachine.h ../corelib/concurrent/qfuture.h ../corelib/concurrent/qf=
utureinterface.h ../corelib/concurrent/qfuturesynchronizer.h ../corelib/con=
current/qfuturewatcher.h ../corelib/concurrent/qrunnable.h ../corelib/concu=
rrent/qtconcurrentcompilertest.h ../corelib/concurrent/qtconcurrentexceptio=
n.h ../corelib/concurrent/qtconcurrentfilter.h ../corelib/concurrent/qtconc=
urrentfilterkernel.h ../corelib/concurrent/qtconcurrentfunctionwrappers.h .=
./corelib/concurrent/qtconcurrentiteratekernel.h ../corelib/concurrent/qtco=
ncurrentmap.h ../corelib/concurrent/qtconcurrentmapkernel.h ../corelib/conc=
urrent/qtconcurrentmedian.h ../corelib/concurrent/qtconcurrentreducekernel.=
h ../corelib/concurrent/qtconcurrentresultstore.h ../corelib/concurrent/qtc=
oncurrentrun.h ../corelib/concurrent/qtconcurrentrunbase.h ../corelib/concu=
rrent/qtconcurrentstoredfunctioncall.h ../corelib/concurrent/qtconcurrentth=
readengine.h ../corelib/concurrent/qthreadpool.h ../corelib/io/qabstractfil=
eengine.h ../corelib/io/qbuffer.h ../corelib/io/qdatastream.h ../corelib/io=
/qdebug.h ../corelib/io/qdir.h ../corelib/io/qdiriterator.h ../corelib/io/q=
file.h ../corelib/io/qfileinfo.h ../corelib/io/qfilesystemwatcher.h ../core=
lib/io/qfsfileengine.h ../corelib/io/qiodevice.h ../corelib/io/qprocess.h .=
./corelib/io/qresource.h ../corelib/io/qsettings.h ../corelib/io/qtemporary=
file.h ../corelib/io/qtextstream.h ../corelib/io/qurl.h ../corelib/global/q=
config-dist.h ../corelib/global/qconfig-large.h ../corelib/global/qconfig-m=
edium.h ../corelib/global/qconfig-minimal.h ../corelib/global/qconfig-nacl.=
h ../corelib/global/qconfig-small.h ../corelib/global/qendian.h ../corelib/=
global/qfeatures.h ../corelib/global/qglobal.h ../corelib/global/qlibraryin=
fo.h ../corelib/global/qnamespace.h ../corelib/global/qnumeric.h ../corelib=
/global/qt_windows.h ../corelib/global/qconfig.h ../corelib/codecs/qtextcod=
ec.h ../corelib/codecs/qtextcodecplugin.h ../../include/QtCore/QtCore=20
+ SYNCQT.HEADER_CLASSES =3D ../../include/QtCore/QAbstractEventDispatcher .=
./../include/QtCore/QModelIndex ../../include/QtCore/QPersistentModelIndex =
../../include/QtCore/QModelIndexList ../../include/QtCore/QAbstractItemMode=
l ../../include/QtCore/QAbstractTableModel ../../include/QtCore/QAbstractLi=
stModel ../../include/QtCore/QBasicTimer ../../include/QtCore/QCoreApplicat=
ion ../../include/QtCore/QtCleanUpFunction ../../include/QtCore/QEvent ../.=
./include/QtCore/QTimerEvent ../../include/QtCore/QChildEvent ../../include=
/QtCore/QCustomEvent ../../include/QtCore/QDynamicPropertyChangeEvent ../..=
/include/QtCore/QEventLoop ../../include/QtCore/QMetaMethod ../../include/Q=
tCore/QMetaEnum ../../include/QtCore/QMetaProperty ../../include/QtCore/QMe=
taClassInfo ../../include/QtCore/QMetaType ../../include/QtCore/QMetaTypeId=
 ../../include/QtCore/QMetaTypeId2 ../../include/QtCore/QMimeData ../../inc=
lude/QtCore/QObjectList ../../include/QtCore/QObjectData ../../include/QtCo=
re/QObject ../../include/QtCore/QObjectUserData ../../include/QtCore/QObjec=
tCleanupHandler ../../include/QtCore/QGenericArgument ../../include/QtCore/=
QGenericReturnArgument ../../include/QtCore/QArgument ../../include/QtCore/=
QReturnArgument ../../include/QtCore/QMetaObject ../../include/QtCore/QMeta=
ObjectAccessor ../../include/QtCore/QMetaObjectExtraData ../../include/QtCo=
re/QPointer ../../include/QtCore/QSharedMemory ../../include/QtCore/QSignal=
Mapper ../../include/QtCore/QSocketNotifier ../../include/QtCore/QSystemSem=
aphore ../../include/QtCore/QTimer ../../include/QtCore/QTranslator ../../i=
nclude/QtCore/QVariant ../../include/QtCore/QVariantList ../../include/QtCo=
re/QVariantMap ../../include/QtCore/QVariantHash ../../include/QtCore/QVari=
antComparisonHelper ../../include/QtCore/QAbstractAnimation ../../include/Q=
tCore/QAnimationDriver ../../include/QtCore/QAnimationGroup ../../include/Q=
tCore/QParallelAnimationGroup ../../include/QtCore/QPauseAnimation ../../in=
clude/QtCore/QPropertyAnimation ../../include/QtCore/QSequentialAnimationGr=
oup ../../include/QtCore/QVariantAnimation ../../include/QtCore/QtAlgorithm=
s ../../include/QtCore/QBitArray ../../include/QtCore/QBitRef ../../include=
/QtCore/QByteArray ../../include/QtCore/QByteRef ../../include/QtCore/QByte=
ArrayMatcher ../../include/QtCore/QCache ../../include/QtCore/QLatin1Char .=
./../include/QtCore/QChar ../../include/QtCore/QtContainerFwd ../../include=
/QtCore/QContiguousCacheData ../../include/QtCore/QContiguousCacheTypedData=
 ../../include/QtCore/QContiguousCache ../../include/QtCore/QCryptographicH=
ash ../../include/QtCore/QDate ../../include/QtCore/QTime ../../include/QtC=
ore/QDateTime ../../include/QtCore/QEasingCurve ../../include/QtCore/QElaps=
edTimer ../../include/QtCore/QHashData ../../include/QtCore/QHashDummyValue=
 ../../include/QtCore/QHashDummyNode ../../include/QtCore/QHashNode ../../i=
nclude/QtCore/QHash ../../include/QtCore/QMultiHash ../../include/QtCore/QH=
ashIterator ../../include/QtCore/QMutableHashIterator ../../include/QtCore/=
QLine ../../include/QtCore/QLineF ../../include/QtCore/QLinkedListData ../.=
./include/QtCore/QLinkedListNode ../../include/QtCore/QLinkedList ../../inc=
lude/QtCore/QLinkedListIterator ../../include/QtCore/QMutableLinkedListIter=
ator ../../include/QtCore/QListData ../../include/QtCore/QList ../../includ=
e/QtCore/QListIterator ../../include/QtCore/QMutableListIterator ../../incl=
ude/QtCore/QSystemLocale ../../include/QtCore/QLocale ../../include/QtCore/=
QBBSystemLocaleData ../../include/QtCore/QMapData ../../include/QtCore/QMap=
Node ../../include/QtCore/QMapPayloadNode ../../include/QtCore/QMap ../../i=
nclude/QtCore/QMultiMap ../../include/QtCore/QMapIterator ../../include/QtC=
ore/QMutableMapIterator ../../include/QtCore/QMargins ../../include/QtCore/=
QPair ../../include/QtCore/QPoint ../../include/QtCore/QPointF ../../includ=
e/QtCore/QQueue ../../include/QtCore/QRect ../../include/QtCore/QRectF ../.=
./include/QtCore/QRegExp ../../include/QtCore/QScopedPointerDeleter ../../i=
nclude/QtCore/QScopedPointerArrayDeleter ../../include/QtCore/QScopedPointe=
rPodDeleter ../../include/QtCore/QScopedPointer ../../include/QtCore/QScope=
dArrayPointer ../../include/QtCore/QScopedValueRollback ../../include/QtCor=
e/QSet ../../include/QtCore/QSetIterator ../../include/QtCore/QMutableSetIt=
erator ../../include/QtCore/QSharedData ../../include/QtCore/QSharedDataPoi=
nter ../../include/QtCore/QExplicitlySharedDataPointer ../../include/QtCore=
/QSharedPointer ../../include/QtCore/QWeakPointer ../../include/QtCore/QSiz=
e ../../include/QtCore/QSizeF ../../include/QtCore/QStack ../../include/QtC=
ore/QStdWString ../../include/QtCore/QString ../../include/QtCore/QLatin1St=
ring ../../include/QtCore/QCharRef ../../include/QtCore/QConstString ../../=
include/QtCore/QStringRef ../../include/QtCore/QLatin1Literal ../../include=
/QtCore/QAbstractConcatenable ../../include/QtCore/QConcatenable ../../incl=
ude/QtCore/QStringBuilder ../../include/QtCore/QStringListIterator ../../in=
clude/QtCore/QMutableStringListIterator ../../include/QtCore/QStringList ..=
/../include/QtCore/QStringMatcher ../../include/QtCore/QTextBoundaryFinder =
../../include/QtCore/QTimeLine ../../include/QtCore/QVarLengthArray ../../i=
nclude/QtCore/QVectorData ../../include/QtCore/QVectorTypedData ../../inclu=
de/QtCore/QVector ../../include/QtCore/QVectorIterator ../../include/QtCore=
/QMutableVectorIterator ../../include/QtCore/QFactoryInterface ../../includ=
e/QtCore/QLibrary ../../include/QtCore/QtPlugin ../../include/QtCore/QtPlug=
inInstanceFunction ../../include/QtCore/QPluginLoader ../../include/QtCore/=
QUuid ../../include/QtCore/QXmlStreamStringRef ../../include/QtCore/QXmlStr=
eamAttribute ../../include/QtCore/QXmlStreamAttributes ../../include/QtCore=
/QXmlStreamNamespaceDeclaration ../../include/QtCore/QXmlStreamNamespaceDec=
larations ../../include/QtCore/QXmlStreamNotationDeclaration ../../include/=
QtCore/QXmlStreamNotationDeclarations ../../include/QtCore/QXmlStreamEntity=
Declaration ../../include/QtCore/QXmlStreamEntityDeclarations ../../include=
/QtCore/QXmlStreamEntityResolver ../../include/QtCore/QXmlStreamReader ../.=
./include/QtCore/QXmlStreamWriter ../../include/QtCore/QAtomicInt ../../inc=
lude/QtCore/QAtomicPointer ../../include/QtCore/QBasicAtomicInt ../../inclu=
de/QtCore/QBasicAtomicPointer ../../include/QtCore/QMutex ../../include/QtC=
ore/QMutexLocker ../../include/QtCore/QMutexData ../../include/QtCore/QRead=
WriteLock ../../include/QtCore/QReadLocker ../../include/QtCore/QWriteLocke=
r ../../include/QtCore/QSemaphore ../../include/QtCore/QThread ../../includ=
e/QtCore/QThreadStorageData ../../include/QtCore/QThreadStorage ../../inclu=
de/QtCore/QWaitCondition ../../include/QtCore/QAbstractState ../../include/=
QtCore/QAbstractTransition ../../include/QtCore/QEventTransition ../../incl=
ude/QtCore/QFinalState ../../include/QtCore/QHistoryState ../../include/QtC=
ore/QSignalTransition ../../include/QtCore/QState ../../include/QtCore/QSta=
teMachine ../../include/QtCore/QFuture ../../include/QtCore/QFutureIterator=
 ../../include/QtCore/QMutableFutureIterator ../../include/QtCore/QFutureIn=
terfaceBase ../../include/QtCore/QFutureInterface ../../include/QtCore/QFut=
ureSynchronizer ../../include/QtCore/QFutureWatcherBase ../../include/QtCor=
e/QFutureWatcher ../../include/QtCore/QRunnable ../../include/QtCore/QtConc=
urrentFilter ../../include/QtCore/QtConcurrentMap ../../include/QtCore/QtCo=
ncurrentRun ../../include/QtCore/QThreadPool ../../include/QtCore/QAbstract=
FileEngine ../../include/QtCore/QAbstractFileEngineHandler ../../include/Qt=
Core/QAbstractFileEngineIterator ../../include/QtCore/QBuffer ../../include=
/QtCore/QDataStream ../../include/QtCore/QtDebug ../../include/QtCore/QDebu=
g ../../include/QtCore/QNoDebug ../../include/QtCore/QDir ../../include/QtC=
ore/QDirIterator ../../include/QtCore/QFile ../../include/QtCore/QFileInfo =
../../include/QtCore/QFileInfoList ../../include/QtCore/QFileInfoListIterat=
or ../../include/QtCore/QFileSystemWatcher ../../include/QtCore/QFSFileEngi=
ne ../../include/QtCore/QIODevice ../../include/QtCore/Q_PID ../../include/=
QtCore/QProcessEnvironment ../../include/QtCore/QProcess ../../include/QtCo=
re/QResource ../../include/QtCore/QSettings ../../include/QtCore/QTemporary=
File ../../include/QtCore/QTextStream ../../include/QtCore/QTextStreamFunct=
ion ../../include/QtCore/QTextStreamManipulator ../../include/QtCore/QTS ..=
/../include/QtCore/QTextIStream ../../include/QtCore/QTextOStream ../../inc=
lude/QtCore/QUrl ../../include/QtCore/QtEndian ../../include/QtCore/QtGloba=
l ../../include/QtCore/QIntegerForSize ../../include/QtCore/QNoImplicitBool=
Cast ../../include/QtCore/Q_INT8 ../../include/QtCore/Q_UINT8 ../../include=
/QtCore/Q_INT16 ../../include/QtCore/Q_UINT16 ../../include/QtCore/Q_INT32 =
../../include/QtCore/Q_UINT32 ../../include/QtCore/Q_INT64 ../../include/Qt=
Core/Q_UINT64 ../../include/QtCore/Q_LLONG ../../include/QtCore/Q_ULLONG ..=
/../include/QtCore/Q_LONG ../../include/QtCore/Q_ULONG ../../include/QtCore=
/QSysInfo ../../include/QtCore/QtMsgHandler ../../include/QtCore/QGlobalSta=
tic ../../include/QtCore/QGlobalStaticDeleter ../../include/QtCore/QBool ..=
/../include/QtCore/QTypeInfo ../../include/QtCore/QFlag ../../include/QtCor=
e/QIncompatibleFlag ../../include/QtCore/QFlags ../../include/QtCore/QForea=
chContainer ../../include/QtCore/QForeachContainerBase ../../include/QtCore=
/QLibraryInfo ../../include/QtCore/Qt ../../include/QtCore/QInternal ../../=
include/QtCore/QCOORD ../../include/QtCore/QtConfig ../../include/QtCore/QT=
extCodec ../../include/QtCore/QTextEncoder ../../include/QtCore/QTextDecode=
r ../../include/QtCore/QTextCodecFactoryInterface ../../include/QtCore/QTex=
tCodecPlugin=20
+ SYNCQT.PRIVATE_HEADER_FILES =3D ../corelib/kernel/qabstracteventdispatche=
r_p.h ../corelib/kernel/qabstractitemmodel_p.h ../corelib/kernel/qcore_mac_=
p.h ../corelib/kernel/qcore_symbian_p.h ../corelib/kernel/qcore_unix_p.h ..=
/corelib/kernel/qcoreapplication_p.h ../corelib/kernel/qcorecmdlineargs_p.h=
 ../corelib/kernel/qcoreglobaldata_p.h ../corelib/kernel/qcrashhandler_p.h =
../corelib/kernel/qeventdispatcher_blackberry_p.h ../corelib/kernel/qeventd=
ispatcher_glib_p.h ../corelib/kernel/qeventdispatcher_symbian_p.h ../coreli=
b/kernel/qeventdispatcher_unix_p.h ../corelib/kernel/qeventdispatcher_win_p=
.h ../corelib/kernel/qfunctions_p.h ../corelib/kernel/qmetaobject_p.h ../co=
relib/kernel/qobject_p.h ../corelib/kernel/qsharedmemory_p.h ../corelib/ker=
nel/qsystemerror_p.h ../corelib/kernel/qsystemsemaphore_p.h ../corelib/kern=
el/qtranslator_p.h ../corelib/kernel/qvariant_p.h ../corelib/kernel/qwineve=
ntnotifier_p.h ../corelib/animation/qabstractanimation_p.h ../corelib/anima=
tion/qanimationgroup_p.h ../corelib/animation/qparallelanimationgroup_p.h .=
./corelib/animation/qpropertyanimation_p.h ../corelib/animation/qsequential=
animationgroup_p.h ../corelib/animation/qvariantanimation_p.h ../corelib/to=
ols/qbytedata_p.h ../corelib/tools/qdatetime_p.h ../corelib/tools/qharfbuzz=
_p.h ../corelib/tools/qlocale_data_p.h ../corelib/tools/qlocale_p.h ../core=
lib/tools/qlocale_tools_p.h ../corelib/tools/qpodlist_p.h ../corelib/tools/=
qringbuffer_p.h ../corelib/tools/qscopedpointer_p.h ../corelib/tools/qsimd_=
p.h ../corelib/tools/qtools_p.h ../corelib/tools/qunicodetables_p.h ../core=
lib/plugin/qelfparser_p.h ../corelib/plugin/qfactoryloader_p.h ../corelib/p=
lugin/qlibrary_p.h ../corelib/plugin/qsystemlibrary_p.h ../corelib/xml/qxml=
stream_p.h ../corelib/xml/qxmlutils_p.h ../corelib/thread/qmutex_p.h ../cor=
elib/thread/qmutexpool_p.h ../corelib/thread/qorderedmutexlocker_p.h ../cor=
elib/thread/qreadwritelock_p.h ../corelib/thread/qthread_p.h ../corelib/sta=
temachine/qabstractstate_p.h ../corelib/statemachine/qabstracttransition_p.=
h ../corelib/statemachine/qeventtransition_p.h ../corelib/statemachine/qhis=
torystate_p.h ../corelib/statemachine/qsignaleventgenerator_p.h ../corelib/=
statemachine/qsignaltransition_p.h ../corelib/statemachine/qstate_p.h ../co=
relib/statemachine/qstatemachine_p.h ../corelib/concurrent/qfutureinterface=
_p.h ../corelib/concurrent/qfuturewatcher_p.h ../corelib/concurrent/qthread=
pool_p.h ../corelib/io/qabstractfileengine_p.h ../corelib/io/qdatastream_p.=
h ../corelib/io/qdataurl_p.h ../corelib/io/qdir_p.h ../corelib/io/qfile_p.h=
 ../corelib/io/qfileinfo_p.h ../corelib/io/qfilesystemengine_p.h ../corelib=
/io/qfilesystementry_p.h ../corelib/io/qfilesystemiterator_p.h ../corelib/i=
o/qfilesystemmetadata_p.h ../corelib/io/qfilesystemwatcher_dnotify_p.h ../c=
orelib/io/qfilesystemwatcher_fsevents_p.h ../corelib/io/qfilesystemwatcher_=
inotify_p.h ../corelib/io/qfilesystemwatcher_kqueue_p.h ../corelib/io/qfile=
systemwatcher_p.h ../corelib/io/qfilesystemwatcher_symbian_p.h ../corelib/i=
o/qfilesystemwatcher_win_p.h ../corelib/io/qfsfileengine_iterator_p.h ../co=
relib/io/qfsfileengine_p.h ../corelib/io/qiodevice_p.h ../corelib/io/qnonco=
ntiguousbytedevice_p.h ../corelib/io/qprocess_p.h ../corelib/io/qresource_i=
terator_p.h ../corelib/io/qresource_p.h ../corelib/io/qsettings_p.h ../core=
lib/io/qtldurl_p.h ../corelib/io/qurltlds_p.h ../corelib/io/qwindowspipewri=
ter_p.h ../corelib/global/qnumeric_p.h ../corelib/global/qt_pch.h ../coreli=
b/codecs/qfontlaocodec_p.h ../corelib/codecs/qiconvcodec_p.h ../corelib/cod=
ecs/qisciicodec_p.h ../corelib/codecs/qlatincodec_p.h ../corelib/codecs/qsi=
mplecodec_p.h ../corelib/codecs/qtextcodec_p.h ../corelib/codecs/qtsciicode=
c_p.h ../corelib/codecs/qutfcodec_p.h=20
--=20
1.9.1


