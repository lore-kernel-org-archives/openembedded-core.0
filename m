Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB7CE95A95
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 14:40:30 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web11.63285.1696862425289974668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 07:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=zS7TQjMs;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=TFLIPcvI;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id A465C32001E9;
	Mon,  9 Oct 2023 10:40:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 09 Oct 2023 10:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696862424; x=
	1696948824; bh=U5h2qX5fS5zk+HoQyUJ+Ks9HKqplbPZBa+79YH2Wh+Q=; b=z
	S7TQjMsTp1xTFLKIucM3IiDgUGw+rjWu0Ex37RhW9ECdO2DbR8YDNIMZ5Vas4wVT
	51eqQCymQFc5VtCm0tLAm869uMBhwVkM5jiio5uOUK0HUF4GDZpKygqQ4VOFadh5
	tV2swUp2KEnRm2dN1ssfWx/l3v8L1Qn5zzDePqjd4fdaBR5TLQIYgEoKIqQmydsy
	AjtMxV2st3/H+Ha537hTd5liMheLocfNvkrztid4gYVvyjcEW3jdaLksQsKQVwWL
	eQisYhtgWHDQWn0VuzeBBcDIpZkRSYs2BP4ZgQjkK1AyIQpEvB9eoW9VtjZzaQgj
	qHihoRU6ZmHO/Ejr0Z3WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696862424; x=
	1696948824; bh=U5h2qX5fS5zk+HoQyUJ+Ks9HKqplbPZBa+79YH2Wh+Q=; b=T
	FLIPcvIwsHgwDRcAA1lQ02TlXsJj/sMI9zE6FfA7LAUmwoXItpJRB9a9XIQYI4Mf
	H3UVgnibS5+KolhrgdAaGWaj1r/i5PP+DIDd0XxuR/5LaO6+HWDvWvvt8tJGZA5o
	xtDyU2QAM7H+eMSJot7mNbxdAn1CRMtb+Nvem0wzJUbuRnmNGR9S3amD1U3R6oa/
	8/+G67zYkgDR6GWcwlkQ2H9Su6DQ9pKuwIaYIaDNeZobvdKcigI7f1JnkKfFUTQq
	G/clQWwayEgsdyrV2Vu9EDJQYRGUn6q816U/kEm6y7KDuJb3GqipBpOVszylS1gv
	hM65nEE3i25fJkuUE0ykA==
X-ME-Sender: <xms:2BAkZdv5-BKv41k26jd6b6UIhpFEBUF8uHtE2-Q4q640qkoT5C6QIw>
    <xme:2BAkZWdAV0xw3eoDNPv2oecd5Qu13H7PrjRl0S82ALEAAJe4LuuOxEo7vrE8T_3p0
    6vWgMZaYJWUkqigKiM>
X-ME-Received: <xmr:2BAkZQxOV40imJxDkFvr65rxfi19wW56jeomoI7AFlYXxGsmJFXVCTNWs4-tmi8k9wEnLZAX89Q2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepteeigfejueekfeetjeefueeggfeihe
    egueehveeiieekgfegffevgefgjeeuudetnecuffhomhgrihhnpehsvghlfhhtvghsthdr
    tggrshgvpdhlohhgghgvrhdrihhnfhhonecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:2BAkZUNvPj6DbMQSGGzP6Z_gcK6OQeOVfFmnbdfbiAvlQgxEXBsGKw>
    <xmx:2BAkZd9Vk4A903d18KVOGqApLQaIoiGaASY_a_S3FFvLahDJJwBHMQ>
    <xmx:2BAkZUWGXCoUkWvlryLAW3540FK0vMzzZczhp9CZV0Gpsx2ECwCMfw>
    <xmx:2BAkZaGgw1XBgGHxtKmsfxHTxT9WK-0-H5JUq3z685jvIhOCX8YD6A>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 10:40:23 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v3 4/4] selftest: Add tests for populate_sdk task
Date: Mon,  9 Oct 2023 16:40:01 +0200
Message-ID: <20231009144001.21150-4-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009144001.21150-1-pavel@zhukoff.net>
References: <20231009144001.21150-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188840

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


