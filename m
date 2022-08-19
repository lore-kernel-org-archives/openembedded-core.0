Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AD3C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 09:21:19 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web08.1101.1660900878818356126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 02:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=hGOrmpDf;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.21,
 mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A1A8D320046E;
	Fri, 19 Aug 2022 05:21:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 19 Aug 2022 05:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1660900877; x=1660987277; bh=Li
	RSNHb8oRQbmRvclDvICjxJKOczfodMhA5jDE8Y3xI=; b=hGOrmpDflGKmFcL8sK
	9PF1V5k4wAJEuE4CFG772hnfixa3GcO3IKKE1u/Q0yeVr9R1f/SvA1v5Ty/xTsVN
	d2e8ihJb3BUqBETVQaqnuBRb0w+cCFKcz+aowKhMXLEVJarI0f4th59E5zeEjLjs
	u6j1FVFhpdZFCei5+IjjeabIWQyEy6Xq4DW9FlzRWLpXOCx8T1hum1x7/KrSUPbt
	DOTysgteYhCx6DRPHlqZ57GlkYISOTM0QZIR5KVVvoabfQHwIghaByT9eSdMYcq+
	FXddHSO8khl3Hvia1OQwnENwzdJ0YDP+G9qUvq7wJGJGICt5oe/yNVzcMc4UbMGd
	t0pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660900877; x=1660987277; bh=LiRSNHb8oRQbm
	RvclDvICjxJKOczfodMhA5jDE8Y3xI=; b=k/xJdso1q4Tdbb5+dgsfgUNUPo0eA
	291ij03ZoixYXN0k2DF5swtFo5P6RRqJmzHi5i3gyoAcyyS8LWC1wXNORTwmzdRr
	hAtEB4SHz3LR0GSLoHrSuZbuvbdiV1z1au2CMe/qebLGAUsvLOD5W3hc1Eq0i/1M
	CVvg70bX6AlUio9HJXvTFTt0BWNUtntwKvZozySn3EAXowrFBV92iykbigrBFbBU
	SM41UKdIt2i/ee679D2Pka6xVbwfv6AjVtI/0haS4gimr8GjOch2y8iyRN04YZ0k
	SopnOXcHyGPcdRzmDE8c3Mq3pujmYMY7zFyPDiiBx+dHrT92yhH9VezUQ==
X-ME-Sender: <xms:DFb_YiRK9EXZY6WUIamvA_qQLJj3Hi4WPKpRO3puoOOMSMpAHC89bQ>
    <xme:DFb_YnwFxhyug30G7hMBjD6Yb7YVDwuXtbUIOAfZ76kx8X_wOgYOWEy2DHD094dOE
    7z1jsZwGt-e92erhJM>
X-ME-Received: 
 <xmr:DFb_Yv0V7rZ7Iloya0FPbYsm_4wZjVtUPPlyagnjaT_w3RoyI8o672OleH2SnWbfM5acpwVCn_4xWYn63tik5vc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhu
    khhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeejgfelvdejhfefgfeffffgudelud
    ffhedtleefueegkedtjedvleevtdeuieeiudenucffohhmrghinhepshgvlhhfthgvshht
    rdgtrghsvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:DVb_YuAWQLttManGJnmSOSciJEtPLWJdjfPddSZo89geRW4QClXr5A>
    <xmx:DVb_YrjBmuHuexzmv7bQzYWOmLXGr-LQ_SL1GIoOoRvGnuNVBmi-jg>
    <xmx:DVb_Yqpndr9cKzIgFDGgc8YJiDA__LJizkFO0VW6a9KyhrBvKdOyoQ>
    <xmx:DVb_YjYeL3s2pfq3-Gv5wWqIUWjlNzgPYisR9cBac8gJh0xOcGXgjQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 05:21:16 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH 2/2] selftest: Add regression test for rpm filenames
Date: Fri, 19 Aug 2022 11:20:04 +0200
Message-Id: <20220819092002.31294-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220819092002.31294-1-pavel@zhukoff.net>
References: <20220819092002.31294-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 09:21:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169617

Escaping globs and quoting in rpm spec files is tricky and requires a
bit of dancing. In addition to that it changes from time to time.
Adding (simple) regression test for different types of filename
patterns. Cover bracket in first iteration

[Yocto #13746]

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../recipes-test/testrpm/files/testfile.txt     |  6 ++++++
 .../recipes-test/testrpm/testrpm_0.0.1.bb       | 17 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/rpmtests.py        | 16 ++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta-selftest/recipes-test/testrpm/files/testfile.txt
 create mode 100644 meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/rpmtests.py

diff --git a/meta-selftest/recipes-test/testrpm/files/testfile.txt b/meta-selftest/recipes-test/testrpm/files/testfile.txt
new file mode 100644
index 00000000000..d1e50ff79a2
--- /dev/null
+++ b/meta-selftest/recipes-test/testrpm/files/testfile.txt
@@ -0,0 +1,6 @@
+  /mnt/builds/yocto/sources/meta-selftest/recipes-test/testrpm:
+  total used in directory 16 available 76.4 GiB
+  drwxr-xr-x  2 pavel pavel 4096 Aug 19 08:59 .
+  drwxr-xr-x 34 pavel pavel 4096 Aug 18 17:59 ..
+  -rw-r--r--  1 pavel pavel  408 Aug 19 08:59 testrpm_0.0.1.bb
+  -rw-r--r--  1 pavel pavel  355 Aug 18 21:54 testrpm_0.0.1.bb~
diff --git a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
new file mode 100644
index 00000000000..e42c7db3b39
--- /dev/null
+++ b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Test recipe for testing rpm generated by oe-core"
+LICENSE = "CLOSED"
+
+SRC_URI = "file://testfile.txt"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_compile(){
+	echo "testdata" > ${B}/"file with [quotes].txt"
+	echo "testdata" > ${B}/"file with (quites).txt"
+}
+
+do_install(){
+	install ${B}/* ${D}/
+}
+
+FILES:${PN} = "*"
diff --git a/meta/lib/oeqa/selftest/cases/rpmtests.py b/meta/lib/oeqa/selftest/cases/rpmtests.py
new file mode 100644
index 00000000000..dafbbc21360
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rpmtests.py
@@ -0,0 +1,16 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class BitbakeTests(OESelftestTestCase):
+
+    def test_rpm_filenames(self):
+        test_recipe = "testrpm"
+        bitbake(test_recipe)
+        
-- 
2.35.1


