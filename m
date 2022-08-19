Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CC0C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 13:16:20 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.2932.1660914978788672499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 06:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=X1T9Hxhh;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25,
 mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 155FF32007CF;
	Fri, 19 Aug 2022 09:16:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 19 Aug 2022 09:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1660914977; x=1661001377; bh=J0
	48trCsW2bYQ2v9ELNsNweF6HyPCoFBouK/Jlhx4a4=; b=X1T9HxhhA2IHHKKGuT
	luwVu1iI456eZvewgjXnm8z9ojkeiQymhpteavZ5rlBLLgPN5F9iYJ9Vu8BZSBn7
	l9942pCKUYRRulcvS/urm/6/sbM0kFAb8GE5vEaljOQ8hR4vujohbwEvFPFtSFQ2
	YXVAdMAhisbQPk3CpVxL3gPbsvra1rJaQO7JlTBgZOvhGEkrbBpsOpwrm3rMcrk4
	aixcMmmbSWZ5hk+sTw5ujNNmk58Ri9pCx2n55vT1E2vFlfFOBZG+gmUswYnTbsbI
	q6Cwt6hyFlPRU/1UUFKp5V1/lkmWo3YKlz5x+WgeC+iKVxYGReDnOhOAOnx7C+m5
	4nyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660914977; x=1661001377; bh=J048trCsW2bYQ
	2v9ELNsNweF6HyPCoFBouK/Jlhx4a4=; b=wFff2eN0bmj3EJNS+fsts2RuCz67y
	bj+0PusagqyYqrtrXiIUtgQ0/bp+KTQWXFY5KOtTX5ZvYO9aHYQGIgvLv+SP9l01
	CMZ5LmFPT5HJJSxvRfeDwoLG+WArBqMG67tdS6zWIdeyMg+61s1OfeUQycFylq39
	uuA7pZfGhFtNktIS9RpJWW9ZvNnJTZcA+0mTqIRDNFOw8zWSyaWU844KWtnjznZI
	X+8mYOqbuMuL8rCmvzOr5NZFDLkpLySzYJo5DNBeIAyOgmwJaDzCCumYQ/Jdv8Ye
	QK0QT3wyZBXbubbeVYsfx24FuoHqtYR06aQuTjRRRZZPvRs8Vib7cF27w==
X-ME-Sender: <xms:IY3_YugucH6pY73NwzL5kv-LZj-MFeHOeYRYS9j-ho6nojYqhb4oMA>
    <xme:IY3_YvCEvlXUwY_L3eTJqtE4QKYCPSFVttRvBQDNVQE4O6r_GW9ADuSpDxsPE9r5g
    5Cxd-C0t4AdfJwEcLo>
X-ME-Received: 
 <xmr:IY3_YmGSLlIz16AalDauqqm1uJRFawlfBR7ASQPJJFap5oKSdU1IW11CjN-JrM3OcoJ_oSdFwTE9OcrYLkj3ukE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhu
    khhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeejgfelvdejhfefgfeffffgudelud
    ffhedtleefueegkedtjedvleevtdeuieeiudenucffohhmrghinhepshgvlhhfthgvshht
    rdgtrghsvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:IY3_YnTlpilyNYBA5sEF-XIaZWA13uMbA_7IJfXakFoodFtUbQHo3w>
    <xmx:IY3_YryuaQnHOsedWAv1o9AtPs4-a8v7PEHUMSxZU5DkPDyhJyjtYw>
    <xmx:IY3_Yl7qMpMD_aJpZUfftGn9ufBcqbyywL0qDXvTvH_qzfpaF4eisQ>
    <xmx:IY3_YkqrIVjoIPdU7EZvneZB22wsX-TOYhDlBe7igXfM2c1QISXrfw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 09:16:16 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH v2 2/2] selftest: Add regression test for rpm filesnames
Date: Fri, 19 Aug 2022 15:15:38 +0200
Message-Id: <20220819131536.5353-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220819131536.5353-1-pavel@zhukoff.net>
References: <20220819131536.5353-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 13:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169629

Escaping globs and quoting in rpm spec files is tricky and requires a
bit of dancing. In addition to that it changes from time to time.
Adding (simple) regression test for different types of filename
patterns. Cover brackets and parentheses in first iteration

[Yocto #13746]

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../recipes-test/testrpm/files/testfile.txt    |  1 +
 .../recipes-test/testrpm/testrpm_0.0.1.bb      | 18 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/rpmtests.py       | 14 ++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-selftest/recipes-test/testrpm/files/testfile.txt
 create mode 100644 meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/rpmtests.py

diff --git a/meta-selftest/recipes-test/testrpm/files/testfile.txt b/meta-selftest/recipes-test/testrpm/files/testfile.txt
new file mode 100644
index 00000000000..c4d7630c1e1
--- /dev/null
+++ b/meta-selftest/recipes-test/testrpm/files/testfile.txt
@@ -0,0 +1 @@
+== This file serves the purposes of SRC_URI only
diff --git a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
new file mode 100644
index 00000000000..5e8761ab554
--- /dev/null
+++ b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Test recipe for testing rpm generated by oe-core"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+SRC_URI = "file://testfile.txt"
+INHIBIT_DEFAULT_DEPS = "1"
+
+do_compile(){
+	echo "testdata" > ${B}/"file with [brackets].txt"
+	echo "testdata" > ${B}/"file with (parentheses).txt"
+}
+
+do_install(){
+	install ${B}/* ${D}/
+}
+
+FILES:${PN} = "*"
diff --git a/meta/lib/oeqa/selftest/cases/rpmtests.py b/meta/lib/oeqa/selftest/cases/rpmtests.py
new file mode 100644
index 00000000000..902d7dca3da
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/rpmtests.py
@@ -0,0 +1,14 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class BitbakeTests(OESelftestTestCase):
+
+    def test_rpm_filenames(self):
+        test_recipe = "testrpm"
+        bitbake(test_recipe)
-- 
2.35.1


