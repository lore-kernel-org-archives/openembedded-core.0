Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1561CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 09:47:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.13601.1758880025012868052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 02:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zwvnC2uR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D8BA1A0FE6
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:47:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 346CA606B5;
	Fri, 26 Sep 2025 09:47:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B874102F189E;
	Fri, 26 Sep 2025 11:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758880022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UKr0CChnH3ztqUDnHUKgkWbSPAvP84C1XZF4Gh1vNco=;
	b=zwvnC2uRMHun7ke+PXgbozzIDW3Vi3ua3hUZAVtMXixo/BhDadmn8BSs8A4XUJ/mLJaONc
	Sb4L5eu0B9wTRtz8+40MBNF/OvDeOYruD/Z5/Q0iTuCOXoBCPItGg0MPDdFTbJjgq/LN7q
	/slEQmNsgybCu4Ls+aQ4JAZOHTBW1OnEnTHQGqfGdYXnrgzhwFo8hHOrliLSPkskibN2Tt
	wsULMXoKJpsRl8x/4NbZYhHtZTiILEwri6SMD+F7iTL7BkpeL4uMz08PPLOf7qRD/W8YTw
	masxOt5rYYFVEmLCNFP3iA1f7OEvYfL7leGR3Y8EzYl/0SxaKU/Zs+1dIyQNZw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 26 Sep 2025 11:46:53 +0200
Subject: [PATCH] oeqa/bblayers.py: add tests for adding new built-in
 fragments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-builtin-fragments-tests-v1-1-28c32d45bc15@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAxh1mgC/yXM0QqCQBCF4VeRuW5BJ1LqVaILXc/oRG2xs4Ygv
 rub3hz4Ls6/kCEqjG7FQhE/Nf2EjOpUkB/bMMBpn01c8qW8cu26SV9Jg5PYDm+EZC7B8oL7c92
 wr0SE8vsbITrv5fvjsE3dEz79c7SuG/vsl1F7AAAA
X-Change-ID: 20250926-builtin-fragments-tests-e2d3672c1fff
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexander Kanavin <alex.kanavin@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3730;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1XQcv8c4WTMGzBRt1baIk2Oz2CG2SUeX80aC9vCongI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1mEUR03SMMF1Kn4vc2lltl2a1R/qhsYDMjPzF
 0K0Zc0RN5CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNZhFAAKCRDRgEFAKaOo
 NpsPEACD46LDDfF5mg1tP3FumBYepTv/1ztIBZFNvZlKwqRe/nlomPZMvk99XzJMSsClnLls0J0
 uFIggM71sUbTugRxgOCOAfXnTwPogdIMaUBUTdvmDRsoTH1v8ch5VCUDfz+kChsBW3b9TNDYSia
 cl6dTjOb/lc1RoKk5a016ytZ6cBJ8gN7uUylMDy+Ls+8NAgedRX1/JjHvmzGDv9PfCEIGdcY6us
 f9stAQG+JFoBdsMIsHW2coC6ffElBimMXwd5ry4uR56GkGrRLj3qetWRtkwFE3x7dd2X4X++rnq
 wAv3J7qNPCJooOy0+W/AUZw5Wdfh1Bz6jrEsq99HibGFJ/Y4n1IdhjxzAMk937DlSylO4X4cfNY
 awqOOx90KwmzT65C2EgJK3wya6w1qbTTBHeuovRxCZEacoagGhKv9s13XGmPZFYg42HPr3DKsFA
 /zJByA3zjCDn0DEOojs1iz7UQSOWl+w3EEJ/pSDOfpuJnaVwF8YISqY1JwhnaBGyMP9aVd7/vRq
 ygwbqZqiw+YTF3XvGI4JhTI16VqebxFjs5co75ZU5spk2YpiBswN1oSktXwgZlJmLjOA2CKSHsz
 dvu8qP4QZ8DdWObpmfK78Av7M5d/uW02MdCqjj3ayEiqM/ush4sn0e3MBbHx7SIKBOmeK5RlhjR
 XcFQT/H4hj+Ajkg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 09:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224067

Add discussed in [1], our best option for customizing built-in fragments
is to pass them from a layer configuration. In short, the reason is that
our statement must be parsed before the addfragments call is parsed.We
also have to use the :append override as using += would override the
original definition of OE_FRAGMENTS_BUILTIN (since it uses a ?=
assignment).

Provide a test case for customizing built-in fragments with
meta-selftest.

[1]: https://lore.kernel.org/yocto-docs/20250925-fragments-v1-0-c9f747361fb2@bootlin.com/T/#m9f7c9f110c084eba17e0f64d8b2ac7a88af3f38e

Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta-selftest/conf/layer.conf            |  2 ++
 meta/lib/oeqa/selftest/cases/bblayers.py | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/meta-selftest/conf/layer.conf b/meta-selftest/conf/layer.conf
index ecc45ded8c..de7d6340ed 100644
--- a/meta-selftest/conf/layer.conf
+++ b/meta-selftest/conf/layer.conf
@@ -12,3 +12,5 @@ BBFILE_PRIORITY_selftest = "5"
 addpylib ${LAYERDIR}/lib oeqa
 
 LAYERSERIES_COMPAT_selftest = "whinlatter"
+
+OE_FRAGMENTS_BUILTIN:append = " selftest-fragment:SELFTEST_BUILTIN_FRAGMENT_VARIABLE"
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8c05ec5d3d..d82c5aaf37 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -272,6 +272,35 @@ class BitbakeConfigBuild(OESelftestTestCase):
         self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
         self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
 
+    def test_enable_disable_builtin_fragments(self):
+        """
+        Tests that the meta-selftest properly adds a new built-in fragment from
+        its layer.conf configuration file.
+        The test sequence goes as follows:
+        1. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is not set yet.
+        2. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set after setting
+           the fragment.
+        3. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set after setting
+           the fragment with another value that overrides the first one.
+        4. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is set to the previous
+           value after removing the second assignment (from step 3).
+        5. Verify that SELFTEST_BUILTIN_FRAGMENT_VARIABLE is not set after
+           removing the original assignment.
+        """
+        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), None)
+
+        runCmd('bitbake-config-build enable-fragment selftest-fragment/somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'somevalue')
+
+        runCmd('bitbake-config-build enable-fragment selftest-fragment/someothervalue')
+        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'someothervalue')
+
+        runCmd('bitbake-config-build disable-fragment selftest-fragment/someothervalue')
+        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), 'somevalue')
+
+        runCmd('bitbake-config-build disable-fragment selftest-fragment/somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_BUILTIN_FRAGMENT_VARIABLE'), None)
+
     def test_show_fragment(self):
         """
         Test that bitbake-config-build show-fragment returns the expected

---
base-commit: 07747aa7390e98bf2853154e5fd473e4984a1d3d
change-id: 20250926-builtin-fragments-tests-e2d3672c1fff

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


