Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 819B075E2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 23:46:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,545,1559491200"; d="scan'208";a="75964521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Sep 2019 07:46:10 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 40B7F4CDFCE9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 07:46:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 25 Sep 2019 07:46:18 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Sep 2019 07:45:23 +0800
Message-ID: <1569368723-80048-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 40B7F4CDFCE9.AADA8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v4] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Tue, 24 Sep 2019 23:46:12 -0000
Content-Type: text/plain

We need to configure rpm to use package architecture from yocto build system.

Install rpmrc and rpm/platform to ${SDKTARGETSYSROOT} because config file in host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux will be covered by another ARCH which result in previous config settings inefficacy.

To resolve it, put config file in target-sysroot like /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has its own target-sysroot, config file will not be covered.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/rpm/files/rpm-setup.py | 27 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb    | 19 ++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/rpm-setup.py

diff --git a/meta/recipes-devtools/rpm/files/rpm-setup.py b/meta/recipes-devtools/rpm/files/rpm-setup.py
new file mode 100644
index 0000000000..b3e8a1198c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/rpm-setup.py
@@ -0,0 +1,27 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+import shutil
+
+try:
+    native_sysroot = os.environ['OECORE_NATIVE_SYSROOT']
+    sdktarget_sysroot = os.environ['SDKTARGETSYSROOT']
+except KeyError:
+    print("Not in environment setup, bailing")
+    sys.exit(1)
+
+target_etc_dir = os.path.join(sdktarget_sysroot, 'etc/rpm')
+
+if not os.path.exists(target_etc_dir):
+    os.makedirs(target_etc_dir)
+
+template_file = os.path.join(native_sysroot, 'usr/share/rpm/rpmrc')
+cross_file = os.path.join(sdktarget_sysroot, 'etc/rpmrc')
+shutil.copy(template_file, cross_file)
+
+template_file = os.path.join(native_sysroot, 'usr/share/rpm/platform')
+cross_file = os.path.join(sdktarget_sysroot, 'etc/rpm/platform')
+shutil.copy(template_file, cross_file)
+
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index c37330eb4c..e1d1951d74 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -44,6 +44,9 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            "
 
+SRC_URI_append_class-nativesdk = "file://rpm-setup.py \
+                                 "
+
 PE = "1"
 SRCREV = "4a9440006398646583f0d9ae1837dad2875013aa"
 
@@ -113,6 +116,20 @@ do_install_append_class-nativesdk() {
         done
 
         rm -rf ${D}/var
+        install -d ${D}${datadir}/rpm
+
+        cat >${D}/${datadir}/rpm/rpmrc <<EOF
+arch_compat: ${MACHINE_ARCH}: all any noarch ${PACKAGE_EXTRA_ARCHS}
+EOF
+
+# Arch Info should be fixed as '-' is instead of '_'.
+        sed -i 's/-/_/' ${D}${datadir}/rpm/rpmrc
+        cat >${D}/${datadir}/rpm/platform <<EOF
+${MACHINE_ARCH}-pc-linux
+EOF
+
+        install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+        install -m 0755 ${WORKDIR}/rpm-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
 }
 
 # Rpm's make install creates var/tmp which clashes with base-files packaging
@@ -134,6 +151,8 @@ FILES_${PN} += "${libdir}/rpm-plugins/*.so \
 
 FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
+FILES_${PN}_append_class-nativesdk += "${SDKPATHNATIVE}/post-relocate-setup.d"
+
 
 PACKAGES += "python3-rpm"
 PROVIDES += "python3-rpm"
-- 
2.17.1




