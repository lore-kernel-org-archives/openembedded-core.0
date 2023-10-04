Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D791E7C4E3
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:16:05 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.23122.1696436162833423717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=aNBq9bUT;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=nkVoPUGf;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.25, mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 2DBD95C01C5;
	Wed,  4 Oct 2023 12:16:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 04 Oct 2023 12:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696436162; x=
	1696522562; bh=U5h2qX5fS5zk+HoQyUJ+Ks9HKqplbPZBa+79YH2Wh+Q=; b=a
	NBq9bUTLfkBNes7HbO+YZNW12Dm2y09m7VhPwUXu1lFZ2nlzTcU6fYVvXw92/Z+X
	H9bW/DGybFJ9oefd5PLCMzSLhmMUdB2J74N+JQzMOfrUqgLBN6W+VTgQJ+dRbgJ5
	79/geEPsYbR6UNVkghqcTmf7urfDWJE0Ev6cg+Gs4ZCtKc8zKPhvQ6HXiLsblt5e
	ecHFzYNx3UQBZBU8ZtvdCjWfUxyjmDTjzk2kLZYMTN8rQEc8VNhShWM6PI3E5qfS
	pVaXPwAWKzpVsOAzISdBWP02d3uHZo+eES01P5AzfdmQkHTIHgywopqGgzeOsREt
	eYaKTC2aHwcgNyFh3BI+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1696436162; x=
	1696522562; bh=U5h2qX5fS5zk+HoQyUJ+Ks9HKqplbPZBa+79YH2Wh+Q=; b=n
	kVoPUGfbagOUM/yHTo6xqDdt3MUlFtthOdr++EvKk9WNOYs+yAQK9zLSjVRvWmSB
	DIwRUg3TiBTDygmCs/v1txOszclghQlR/NpbNHqvUsrEw2odOeDopsJZbFUVi22P
	mjOAEaVQQFgxwfkwJLa2BX1xqWHDZ9dMqdNx+ws+XJcYvMc9k6KjhVlfLYMzY/9l
	P2vT8s+FLlGg9VsArPLDZSNIg20lC4xf829UdPalxb90RgcygwyQX0T0Q9Wf6Dj/
	h5lzpNnnW9C/Ogpc6shpHuOmGRukhwpU0CMNyLabNdsEDI/8cTG47gOvUiguPaPH
	WfDujgIAGUVePK5QrwjVQ==
X-ME-Sender: <xms:wY8dZSR3XQ0nqgqJ7u0atUBkKfMVeqGTCRuyh93WgU6NhhGu2zAM5g>
    <xme:wY8dZXwu_P59Pv5h_thrTo4QzKz7GNEx1JED9f0oh8btY9SbtVC5pjEfvv2Pj2L9C
    eTKA3JO25bO6qcdzgA>
X-ME-Received: <xmr:wY8dZf2K03wbnY5fKMd_GJyqEFWDRrHA2v23wMFqIa8QfsUy6bN_sEcskpNGYzXCydo9G-cviogn--0G2xwxTWtq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgedvgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheprfgrvhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhk
    ohhffhdrnhgvtheqnecuggftrfgrthhtvghrnhepteeigfejueekfeetjeefueeggfeihe
    egueehveeiieekgfegffevgefgjeeuudetnecuffhomhgrihhnpehsvghlfhhtvghsthdr
    tggrshgvpdhlohhgghgvrhdrihhnfhhonecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:wo8dZeDnEAF_YFDZiW03wHwzCL7OKxVC-kR7FGKRNsJ9lEYxoj7Vew>
    <xmx:wo8dZbi-SeMqrFxoAKhrOIO-Qx2b7wwl0YkmWu4NrlX_2T9YiCI4oA>
    <xmx:wo8dZaogRuoXKEu-8OGK9Uw9jXH3jK93mJeEqJrmHYSwii8nDQh9pA>
    <xmx:wo8dZbIqdtzteUerbaVATs7VvQcCcIOAeqH5-s5cIH2_EKKsQa03tw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Oct 2023 12:16:01 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH 3/3] selftest: Add tests for populate_sdk task
Date: Wed,  4 Oct 2023 18:13:18 +0200
Message-ID: <20231004161318.576312-3-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004161318.576312-1-pavel@zhukoff.net>
References: <20231004161318.576312-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 16:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188692

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


