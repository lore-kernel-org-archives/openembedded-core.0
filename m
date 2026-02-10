Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32513EA3F1C
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:08:13 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15402.1770710888686606122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Ah7kNYLq;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=R29GYM1X;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id DEF0FEC053B;
	Tue, 10 Feb 2026 03:08:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 10 Feb 2026 03:08:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1770710887; x=1770797287; bh=vu
	SWR4UuPECMFSJN3s1fR21sOUjRVJRe2hd1KY9nUic=; b=Ah7kNYLqbMG4Of1juR
	EcbreQ2LKm171U5ZaUzZpIx7HOtwSGxQAaT1YFETcMDCkZ5F6xU94/wkTkEMsfBY
	XAvXaSHYbr/DB5BrETUdOQCqo00YfJDSmVYVHkJAZVw/N94xW4gVkC02FzIaEIg0
	lH+rnM2IKqI7vIiEnL1cfP/OifqE0ClI8652K14jqD1HETgf60zCYvR9nJTUf9Wl
	Q/nSfeAoxwGe0ap+1ieFih63ImGI96JIWjkN0wZlF134wMxSHMD4crE80UqAbJBW
	zBofcEPRkaz6/LwQwD8v51bupxKQV3WRnHFOr2HfyOS+9BcbyLH2UKGd+TIMwrGz
	xeMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770710887; x=1770797287; bh=vuSWR4UuPECMFSJN3s1fR21sOUjR
	VJRe2hd1KY9nUic=; b=R29GYM1XciU1iR1tuKUYY13o3HxQAoIL+g3MnIYWoy7s
	qUvqT4kCd0xugjUwvEwuvOaIm7rJPivAz5Ai14dO3X/MW3qCQhxDUEm36Ml0T/Ns
	WNpVxDUUuMaeUOtsZ4y2rDgY3JiirK08pNO0wTlRDRNWxpmFATxywOpaDNhEzVUA
	XrC7BUEbPWPnF4iFU2awMlwSyxEmaqXUll++8vlCOdUS6OrVBFNq6m/Y1zV6XhMz
	n0g8o0GsP6OkLSkAHb8oEtruA/pvRsqGgJ36IDEkPa7quZRBc8DkEltD4c+sRevG
	61tY60qRAJ6gT9YVtMVE31q+I/PqgG0U42YOnRwO9g==
X-ME-Sender: <xms:Z-eKafcSvOxnwCQ6l9HRzLNKK9GMBZ9-bpLLczg-JdMBUKrraqh_gA>
    <xme:Z-eKabOcZUtH0G3iV4dsdvCuc2QFFLGj9bzxEXhSdbBPIimhfOPlTuan5-cEcNWTB
    GrPdnrihHw1FDwt3DOfPAKjAN-8kA9Ws7zyI0bFTNf5sdsexjdmeic>
X-ME-Received: <xmr:Z-eKaWKAWUhsTVrKq_OcRUYXVs97RVqjDJ9txtTODBTQultqE0s_temX3nhWUbiAwqfIlEiVh7bofdrOug2yXoH74_Q9EPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeludeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepueejhfelkefhhfdvhfevleefudelfeelveevgf
    fhkefghfegvdefleffveeuudetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshgv
    lhhfthgvshhtrdgtrghsvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqd
    gtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohep
    phgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:Z-eKacH-pbXaYehRI-0Rg-5YPTJPa7BL3Itox4YdEt2zBxNHYcysMA>
    <xmx:Z-eKaeRbQZxk4wBuRHCxilygWpzgCqqGRTscDsRJTGfLPHrKuxuhTQ>
    <xmx:Z-eKaYHjKkz4qqOKgPIzT2pUX94Wb6hRVMtnhLcjVs2H5oFYDhTnEg>
    <xmx:Z-eKaa92KWvwP3Qb8DEi4_DpqSGNHMLu_rjMkuIpMr_ol9ftCvXuVg>
    <xmx:Z-eKaYmd3h01vV6UqmKljBvITUfOSfykeBoPwSk0p4anSJhGB3EiAUMB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Feb 2026 03:08:07 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Tue, 10 Feb 2026 08:07:57 +0000
Subject: [PATCH] selftest: Test installation of recipes with complex
 packaging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-install-tests-v1-1-2c99e3ca1d34@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAFznimkC/x3MQQqAIBBA0avIrBPUyKCrRAvJsQbEwpEIxLsnL
 d/i/wqMmZBhERUyPsR0pQ49CNhPlw6U5LvBKGOV0UpS4uJilAW5sLQ4KeuDH+0coDd3xkDv/1u
 31j5eG1NfXwAAAA==
X-Change-ID: 20260210-install-tests-6e506dfd367f
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2737; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=3LjHW2fRLcaeh8ICacAXw5nThhcp6cOacF/B/sMbOpo=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWR2PU9LnnLy+u3NKv3sq1+bJC9TPHPFfJ5NWa7m1tzEX
 ScV/UOedZSyMIhxMciKKbJs7vl6/2mvI29GyC0FmDmsTCBDGLg4BWAiGy0ZGU4l2HacqQw8dYAt
 9pbV36MT3uvMW8o/Pfiz8nTe5zYlWe6MDMdsbP+wd8nccP+2aON2kS2+f5pCnzZEbul7xVQmyZ6
 fyAsA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230861

When recipes have complex and dynamic packaging, it's easy to
accidentally end up with one or more packages that build but can't be
installed. We've seen this recently with linux-firmware [1].

Skimming through the recipes that set PACKAGESPLITFUNCS or
PACKAGES_DYNAMIC or are otherwise known offenders, I've also picked out
gstreamer1.0-plugins-*, kernel-modules, perl and python3 as recipes
where it would be easy to end up with similar issues in the future.

[1]: https://lore.kernel.org/openembedded-core/20260123163305.880111-1-dmitry.baryshkov@oss.qualcomm.com/

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/lib/oeqa/selftest/cases/install.py | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/install.py b/meta/lib/oeqa/selftest/cases/install.py
new file mode 100644
index 000000000000..06ce5fd3b559
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/install.py
@@ -0,0 +1,37 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+
+class InstallTests(OESelftestTestCase):
+    """Test installability of recipes which use complex dynamic packaging"""
+
+    def do_installation_test(self, packages, extra_config=""):
+        self.write_config('CORE_IMAGE_EXTRA_INSTALL = "{}"\n{}'.format(packages, extra_config))
+        bitbake("core-image-minimal")
+
+    def test_gstreamer_plugins(self):
+        """Ensure that all gstreamer plugins can be installed together"""
+        self.do_installation_test("gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
+                                   gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly",
+                                  extra_config='LICENSE_FLAGS_ACCEPTED += "commercial"')
+
+    def test_linux_firmware(self):
+        """Ensure that all linux-firmware packages can be installed together"""
+        self.do_installation_test("linux-firmware")
+
+    def test_linux_modules(self):
+        """Ensure that all in-tree kernel modules can be installed together"""
+        self.do_installation_test("kernel-modules")
+
+    def test_perl(self):
+        """Ensure that all built-in perl modules can be installed together"""
+        self.do_installation_test("perl perl-modules")
+
+    def test_python(self):
+        """Ensure that all built-in python modules can be installed together"""
+        self.do_installation_test("python3 python3-modules python3-misc")

---
base-commit: 6ce19709f7835ee5cd7915e181f89397975236c8
change-id: 20260210-install-tests-6e506dfd367f

Best regards,
-- 
Paul Barker


