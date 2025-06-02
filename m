Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B11BC71133
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 07:57:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.44072.1748851049109953140
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=edZR8RU0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-202506020757268d37fcd212e0c3217a-iavgwx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202506020757268d37fcd212e0c3217a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Jun 2025 09:57:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6q86jXRFxKPhX1jBCIhhlWf1dmRpDQ9Bg5Irfo5/ZVk=;
 b=edZR8RU0hLZwk1CLt3ZJfr4H4oAy8YyLmG5cnvI1Aa/mMN/DfbzNkPTXprHgSYFUyicB2J
 cFXDCGp8dTN8+JIoe6f2tczj5S2XzFHhS0pdRQuxPcdEMcsbUTV5vhnHWjB/H1MsLqYCk3Ng
 qIkW2s0b2L9k+c5kX3l12MTJrZd0rMyQPOc0ZiZQJSl5K8O3IaHnBtLA+G/pKtra8H91EF3o
 xjgMkhS1hzBYkKnMBY6OYxe5NW6olLGp41sz7g8EJb33foIk0lB30KINJNwN26Rb8Nh57EW/
 vR4nnaAJJiZr+vDborH7IDdnCiGk25SyQd5C2frxt2AXMFnqunRDJ/LQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v6 05/21] oe-selftest: fitimage: test FIT_CONF_DEFAULT_DTB
Date: Mon,  2 Jun 2025 09:56:15 +0200
Message-ID: <20250602075714.32122-6-adrian.freihofer@siemens.com>
In-Reply-To: <20250602075714.32122-1-adrian.freihofer@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 07:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217697

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add some test coverage for non default FIT_CONF_DEFAULT_DTB.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 812b34fab47..8a3eb7f8c11 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -380,6 +380,7 @@ class KernelFitImageTests(FitImageTestCase):
         """
         internal_used = {
             'DEPLOY_DIR_IMAGE',
+            'FIT_CONF_DEFAULT_DTB',
             'FIT_CONF_PREFIX',
             'FIT_DESC',
             'FIT_HASH_ALG',
@@ -526,10 +527,14 @@ class KernelFitImageTests(FitImageTestCase):
                 its_field_check.append("load = <%s>;" % uboot_rd_loadaddress)
             if uboot_rd_entrypoint:
                 its_field_check.append("entry = <%s>;" % uboot_rd_entrypoint)
-        its_field_check += [
-            # 'default = bb_vars['FIT_CONF_PREFIX'] + "1";', needs more work
-            'kernel = "kernel-1";',
-        ]
+
+        fit_conf_default_dtb = bb_vars.get('FIT_CONF_DEFAULT_DTB')
+        if fit_conf_default_dtb:
+            fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
+            its_field_check.append('default = "' + fit_conf_prefix + fit_conf_default_dtb + '";')
+
+        its_field_check.append('kernel = "kernel-1";')
+
         if initramfs_image and initramfs_image_bundle != "1":
             its_field_check.append('ramdisk = "ramdisk-1";')
 
@@ -773,6 +778,7 @@ UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
 UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
+FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
 """
         config = self._config_add_uboot_env(config)
         self.write_config(config)
-- 
2.49.0


