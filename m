Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7E3077E6F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:53:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,495,1559491200"; d="scan'208";a="75357004"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Sep 2019 15:53:40 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 26D094CE14E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:53:31 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 12 Sep 2019 15:53:50 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2019 15:52:11 +0800
Message-ID: <1568274731-47147-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 26D094CE14E7.A8211
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] rpm: make rpm work in toolchain.
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
X-List-Received-Date: Thu, 12 Sep 2019 07:53:42 -0000
Content-Type: text/plain

We need to configure rpm to use package architecture from yocto build system.

Install rpmrc and rpm/platform to ${SDKTARGETSYSROOT} because config file in host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux will be covered by another ARCH which result in previous config settings inefficacy.

To resolve it, put config file in target-sysroot like /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has its own target-sysroot, config file will not be covered.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 063f4269a5..5634f6702f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -102,6 +102,9 @@ do_install_append_class-native() {
         done
 }
 
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}-${DISTRO}-${TARGET_OS}"
+SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
+
 do_install_append_class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
                 create_wrapper ${D}$tool \
@@ -112,6 +115,17 @@ do_install_append_class-nativesdk() {
         done
 
         rm -rf ${D}/var
+        install -d ${D}/${SDKTARGETSYSROOT}/etc/rpm
+
+        cat >${D}/${SDKTARGETSYSROOT}/etc/rpmrc <<EOF
+arch_compat: ${MACHINE_ARCH}: all any noarch ${PACKAGE_EXTRA_ARCHS}
+EOF
+
+# Arch Info should be fixed as '-' is instead of '_'.
+        sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
+        cat >${D}/${SDKTARGETSYSROOT}/etc/rpm/platform <<EOF
+${MACHINE_ARCH}-pc-linux
+EOF
 }
 
 # Rpm's make install creates var/tmp which clashes with base-files packaging
@@ -133,6 +147,8 @@ FILES_${PN} += "${libdir}/rpm-plugins/*.so \
 
 FILES_${PN}-dev += "${libdir}/rpm-plugins/*.la \
                     "
+FILES_${PN}_append_class-nativesdk += "${SDKTARGETSYSROOT}"
+
 
 PACKAGES += "python3-rpm"
 PROVIDES += "python3-rpm"
-- 
2.17.1




