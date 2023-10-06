Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA2BE94108
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 19:13:07 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.2786.1696619579056870727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 12:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=7hvKCHBL;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=WrNw3zHa;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 661905C01BB;
	Fri,  6 Oct 2023 15:12:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 06 Oct 2023 15:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696619578; x=
	1696705978; bh=U5h2qX5fS5zk+HoQyUJ+Ks9HKqplbPZBa+79YH2Wh+Q=; b=7
	hvKCHBLgN0tKJOwBOpHI5X5bYwSw4HSI7iczuvuwDHaf6DFxunOaG6+8fR0sOU4Y
	0vQIdA2NSSW1izgWF4dpl/okQUk7gMvltw410U62c/MO9Ec4FV/7ccawHCWphhJs
	CpNKtshXqN2zxHZlHMa+PUpHgBmdcxK6OVybpG2YkxZC8xEqNmcggxfdoi//Z09S
	W5EaxRHvw0cEN+IC7qhpKsbddaaocUVLlfKCCixuAwMNkfwKOPpBJt4fSIKvcpZc
	he8z6oRgpl8xjSlfKLwYMZs3AtBeNdJqq0t29MDEaP9TbcRrSBjSk/aBgIYQHIkJ
	pHUMujSjwXjXDnrU1IKWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696619578; x=
	1696705978; bh=U5h2qX5fS5zk+HoQyUJ+Ks9HKqplbPZBa+79YH2Wh+Q=; b=W
	rNw3zHaK2U6dYHXVxh2/E6orgfPsT8WYP07lxYCxyiWWYG2Aje071qN1HFJRsAh2
	oRPV0p0qS7JIxDEelz4ull4srMok8rb4ok7N7/3RJnbRFiaSQGunzmBOP8Pnwbzn
	0B56YsN+i4OujqNrGPI6oot4tK5ckQAPj77nmi3/KpJBWQX+IDYp88r3xSq9mxns
	wO1hU9MaRTn/N6dJSXtckXW4sMnBg6qNWKMAWTxMQucL9EmrIVdRyr9xJWCSryoh
	j7aknVHhN+FeDw0ddE1QKTaNbXeW7dsJBWvJ/vI6SGLCHz4837HOYYDM9erS6vbj
	esAFt7fJGkEMkeByjwZUQ==
X-ME-Sender: <xms:OlwgZRKtJKf42rIBkMVXjmVPApa8b_P79WJDZOmRDQN7wIph1veikg>
    <xme:OlwgZdL4qY5L_l4x1HMSIpH_bdOKTI-ysdfAcT79QIG2Bzn967ODkJ5BIVR3HVJ3B
    wTCb8AbjsJ9ZRViYMI>
X-ME-Received: <xmr:OlwgZZv14-iLSj8NCz6Q0A09bsod_VuxjzTsEonArchFYT6Zy39CTWzWpEit6r5vKcBdsxAGi9W9QOeFFsgNzDqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhu
    khhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeetiefgjeeukeefteejfeeugefgie
    ehgeeuheevieeikefggeffveeggfejueduteenucffohhmrghinhepshgvlhhfthgvshht
    rdgtrghsvgdplhhoghhgvghrrdhinhhfohenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:OlwgZSZBgBHPpbG9Hxe64AlqSk-3p1bzz5j4B7FF6ol-mZArqPaXMg>
    <xmx:OlwgZYalb-2q8iA2kbHVABYjx0vDMJ1H_kx3X5_ZlK8k6Dv2hlE4Zg>
    <xmx:OlwgZWB6rrPwGROA1p6_EZjPjcAC6jDNT2yPd5Dbd9n1VJprQBo8rg>
    <xmx:OlwgZRALoodiVmVWNmVXs-w1frPndmzi7gW-E-Nbu50CfbSD5dDAdA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 15:12:57 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2 4/4] selftest: Add tests for populate_sdk task
Date: Fri,  6 Oct 2023 21:10:14 +0200
Message-ID: <20231006191013.3770695-5-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006191013.3770695-2-pavel@zhukoff.net>
References: <20231006191013.3770695-2-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 19:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188781

Two tests to cover both installing package with IMAGE_INSTALL as
well as installing versioned dependencies of the package (using perl (>=
5.XX).

Related: [Yocto #13338] [Yocto #14995] [Yocto #14066]

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 .../testsdk-perldepends.bb                    | 16 ++++
 meta/lib/oeqa/selftest/cases/sdk.py           | 79 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/sdk.py

diff --git a/meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb b/meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb
new file mode 100644
index 0000000000..428e1f52e2
--- /dev/null
+++ b/meta-selftest/recipes-test/testsdk-perldepends/testsdk-perldepends.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Test recipe for sdk populate test case"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+RDEPENDS:${PN}="perl (>= 5.12)"
+
+do_install(){
+	mkdir -p ${D}/var/lib/
+	touch ${D}/var/lib/testname 
+	echo "${PN}" > ${D}/var/lib/testname
+}
+
+
+
diff --git a/meta/lib/oeqa/selftest/cases/sdk.py b/meta/lib/oeqa/selftest/cases/sdk.py
new file mode 100644
index 0000000000..35734d8a7a
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/sdk.py
@@ -0,0 +1,79 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_var, bitbake
+
+class PopulateSDK(OESelftestTestCase):
+    '''Tests for populate SDK task(s)'''
+
+    @classmethod
+    def setUpClass(self):
+
+        super(PopulateSDK, self).setUpClass()
+        self.buildtarget = 'core-image-minimal'
+        self.classname = 'PopulateSDK'
+
+    def sdk_build(self):
+        """
+        Test if package added via IMAGE_INSTALL
+        conflicts with dummy SDK providers
+        """
+        SDKTASK = '-c populate_sdk'
+        bbargs = "{} {}".format(SDKTASK, self.buildtarget)
+        self.logger.info("{}: doing bitbake {} ".format(self.classname, bbargs))
+        return bitbake(bbargs).status
+
+    def set_config(self, image_install, package_classes):
+        config = 'IMAGE_INSTALL:append = " {}"\n'.format(image_install)
+        config += 'PACKAGE_CLASSES = " package_{}"\n'.format(package_classes)
+        return config
+
+    def do_test_build(self, image_install, package_manager):
+        self.write_config(self.set_config(image_install, package_manager))
+        res = self.sdk_build()
+        self.assertEqual(0, res, "Failed to populate SDK with {} in IMAGE_INSTALL and {} package manager"\
+            .format(image_install, package_manager))
+
+    def test_image_install_ipk(self):
+        """
+        Regression test for [Yocto #13338] 
+        """
+        self.do_test_build("bash", "ipk")
+
+    def test_image_install_rpm(self):
+        """
+        Regression test for [Yocto #13338] 
+        """
+        self.do_test_build("bash", "rpm")
+
+    def test_image_install_deb(self):
+        """
+        Regression test for [Yocto #13338] 
+        """
+        self.do_test_build("bash", "deb")
+        
+
+    def test_image_install_confictdeps_ipk(self):
+        """
+        Regression test for [Yocto #14995]
+        """
+        self.skipTest("Disabled until [Yocto #14995] is fixed")
+        self.do_test_build("testsdk-perldepends", "ipk")
+        
+    def test_image_install_confictdeps_rpm(self):
+        """
+        Regression test for [Yocto #14995]
+        """
+        self.do_test_build("testsdk-perldepends", "rpm")
+
+    def test_image_install_confictdeps_deb(self):
+        """
+        Regression test for [Yocto #14995]
+        """
+        self.do_test_build("testsdk-perldepends", "deb")
-- 
2.41.0


