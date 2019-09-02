Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 542047F343
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 01:15:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,457,1559491200"; d="scan'208";a="74674504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Sep 2019 09:15:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id F2E214CE14E4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 09:15:29 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 2 Sep 2019 09:15:34 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Sep 2019 09:14:45 +0800
Message-ID: <1567386885-110297-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: F2E214CE14E4.A947A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] meta-environment: make rpm and dnf work in toolchain
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
X-List-Received-Date: Mon, 02 Sep 2019 01:15:49 -0000
Content-Type: text/plain

We need to configure dnf and rpm to use and make it compatible with package architecture from yocto build system.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-core/meta/meta-environment.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index da1230bead..3b25dcc8d0 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -62,6 +62,16 @@ create_sdk_files() {
 do_install() {
     install -d ${D}/${SDKPATH}
     install -m 0644 -t ${D}/${SDKPATH} ${SDK_OUTPUT}/${SDKPATH}/*
+
+    mkdir -p ${D}/${SDKTARGETSYSROOT}/etc/rpm
+    echo "arch_compat: ${MACHINE_ARCH}: ${PACKAGE_ARCHS}" > ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
+    sed -i 's/-nativesdk//g' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
+    sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/rpmrc
+    echo "${MACHINE_ARCH}-pc-linux" > ${D}/${SDKTARGETSYSROOT}/etc/rpm/platform
+
+    mkdir -p ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars
+    echo "${DEFAULTTUNE}:${MACHINE_ARCH}:${TARGET_ARCH}" > ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch
+    sed -i 's/-/_/' ${D}/${SDKTARGETSYSROOT}/etc/dnf/vars/arch
 }
 
 PN = "meta-environment-${MACHINE}"
-- 
2.17.1




