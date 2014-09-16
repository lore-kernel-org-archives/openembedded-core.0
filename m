Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E65D714C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 15:07:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8GF7E2V006921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 08:07:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 16 Sep 2014 08:07:13 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 23:06:27 +0800
Message-ID: <447d7e5f2da3c5b2c58b2df1a93ecc7fdfd9d9a1.1410879378.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410879378.git.kai.kang@windriver.com>
References: <cover.1410879378.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org, jslater@windriver.com
Subject: [PATCH 6/9] qt4: add aarch64 support
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
X-List-Received-Date: Tue, 16 Sep 2014 15:07:14 -0000
Content-Type: text/plain

Add qt4 aarch64 support. Use same patches with qt-native. Add arch check
to set right QT_ARCH.

Disable webkit temporarily that it fails to build:

| runtime/JSValueInlineMethods.h: In constructor
'JSC::JSValue::JSValue(const JSC::JSCell*)':
| runtime/JSValueInlineMethods.h:242:78: error: cast from 'JSC::JSCell*'
to 'int32_t {aka int}' loses precision [-fpermissive]

It has been fix by Qt5, but didn't backport to Qt4. There is an still open
defect for it:
https://bugreports.qt-project.org/browse/QTBUG-35442

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-4.8.6.inc         | 4 ++++
 meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb | 3 +++
 meta/recipes-qt/qt4/qt4_arch.inc          | 1 +
 3 files changed, 8 insertions(+)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index ae6692b..d479bb3 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -22,6 +22,10 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0027-tools.pro-disable-qmeegographicssystemhelper.patch \
            file://0028-Don-t-crash-on-broken-GIF-images.patch \
+           file://0029-aarch64_arm64_fix_arch_detection.patch \
+           file://0030-aarch64_arm64_qatomic_support.patch \
+           file://0031-aarch64_arm64_mkspecs.patch \
+           file://0032-aarch64_add_header.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
index 5cb5e68..dc792c5 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
@@ -7,3 +7,6 @@ QT_CONFIG_FLAGS += " \
  -no-embedded \
  -xrandr \
  -x11"
+
+# disable webkit for aarch64 temporarily that fails to compile
+QT_CONFIG_FLAGS_append_aarch64 = " -no-webkit"
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
index c1d35ab..07512db 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -4,6 +4,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 set_arch() {
    case ${TARGET_ARCH} in
+       aarch64)  QT_ARCH=aarch64 ;;
        arm*)     QT_ARCH=arm ;;
        i*86*)    QT_ARCH=i386 ;;
        mips*)    QT_ARCH=mips ;;
-- 
1.9.1


