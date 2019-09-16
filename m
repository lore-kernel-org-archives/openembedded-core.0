Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4E00F7E63A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 06:36:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75510987"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 14:36:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E0C884CE14E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 14:36:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 14:36:51 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2019 14:36:45 +0800
Message-ID: <1568615805-50657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: E0C884CE14E8.AB0A7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] dnf: make dnf work in toolchain
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
X-List-Received-Date: Mon, 16 Sep 2019 06:36:49 -0000
Content-Type: text/plain

We need to configure dnf to use package architecture from yocto build system.

Install etc/dnf/vars to ${SDKTARGETSYSROOT} because config file in host-sysroot as /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux will be covered by another ARCH which result in previous config settings inefficacy.

To resolve it, put config file in target-sysroot like /opt/poky/2.7+snapshot/sysroots/core2-64-poky-linux. As each ARCH has its own target-sysroot, config file will not be covered.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index c77773332c..02500a33c2 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -68,10 +68,22 @@ do_install_append_class-native() {
                 RPM_NO_CHROOT_FOR_SCRIPTS=1
 }
 
+
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}-${DISTRO}-${TARGET_OS}"
+SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
+
 do_install_append_class-nativesdk() {
         create_wrapper ${D}/${bindir}/dnf \
                 RPM_CONFIGDIR=${SDKPATHNATIVE}${libdir_nativesdk}/rpm \
                 RPM_NO_CHROOT_FOR_SCRIPTS=1 
+
+        install -d ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars
+        cat >${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch <<EOF
+${DEFAULTTUNE}:${MACHINE_ARCH}:${TARGET_ARCH}
+EOF
+
+# Default ${TARGET_ARCH} should be fixed as '-' is instead of '_'.
+        sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch
 }
 
 SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
@@ -81,3 +93,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+FILES_${PN}_append_class-nativesdk += "${SDKTARGETSYSROOT}"
-- 
2.17.1




