Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED0BC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.4917.1720077023126824171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WoGO2RyA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3678aa359b7so879458f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077021; x=1720681821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7o8et+Cj/JsBgxSKbRMLY9RJBx4VeDQyfVPIwUOdoM=;
        b=WoGO2RyAzAljjkhjbEUZ2aNegMN//P+HBpt3ryRrpUrRDLmZcn+UxMcpUb66m8VdSm
         ghp11yw1rOq6hssSZVciizJ5FpUlqx6W7gsgTZR+TxAQD+l6Sib04qcSEcz45ZWciTfE
         K2pv2Z35mPkUZBHJSBV7NHr5fZEMibuPKmKirn5qP8hOuLDGYFFWWwNoDyDRAfC8bGmw
         xI61hmmgAjAn+/+2d2MmJWYLo8GUrXCxHAzOhPBi56M2N8uar5stG3SEvqzREMWTCLiS
         exReObmwYtFHrf8+GX8OaLUM48eokunqccbtRHioPDrsqHC/beIe0dm80veyY0iiFLyf
         3PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077021; x=1720681821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7o8et+Cj/JsBgxSKbRMLY9RJBx4VeDQyfVPIwUOdoM=;
        b=h92LcHFa93mG1wBxQgsaEPObW1VtqzKHj3QYRJhspfp6dOXs9NqTy7QflV+J5G6/6/
         xCdTwfkXXHuL/E/F3if8k7eF3GHS5zWDuH1jsEcpYvCLwNRGqV+pfSms8Aqk8O4ShxJh
         hmBM9+62zUllfX4QGuKNm+/b7eFgIN+wWFjtyrDbmBRTXkK8f4Ncp+FvWiG01VLOij42
         zv/CaiGZz+1vi1y7+OdMOGtbh1BGZ7bJuz246y6vX1bxZZhTNKX9fsY8shWzLg7UiHv0
         rxsa62ZMxIGHnk9WwYNHAYnBt8PRtyYZ+QpiHNrZETKmW8m2ot3UD3Lxj8kip/iKUc7o
         OFpA==
X-Gm-Message-State: AOJu0Yw5PIHtagM+PFWhm5tkfNxR8XuE755+1xMwg+CvECLIYTZC1dWY
	zQtrazS2z5Y34w/1ySBJDjfTdOTDroZlbJDutfw9GGD/6Di5eyamgtS/1g==
X-Google-Smtp-Source: AGHT+IF2kSj/OHcWjrqfdxCTJTOy7QWnX381p590yOwnhg6NShYQyZx0uPOa8DxsEWxC+Pr/NmPj2g==
X-Received: by 2002:a05:6000:a82:b0:367:89ae:c204 with SMTP id ffacd0b85a97d-3679f6e5592mr493573f8f.12.1720077021053;
        Thu, 04 Jul 2024 00:10:21 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:20 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/14] oe-selftest: fitimage refactor u-boot-tools-native
Date: Thu,  4 Jul 2024 09:09:38 +0200
Message-ID: <20240704071013.2982700-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201507

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Eliminate code duplication with a new function.
Use get_bb_var instead of bitbake -e | grep.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 347c0653776..15baf3b2392 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -11,6 +11,11 @@ import re
 
 class FitImageTests(OESelftestTestCase):
 
+    def _setup_uboot_tools_native(self):
+        """build u-boot-tools-native and return RECIPE_SYSROOT_NATIVE"""
+        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
+        return get_bb_var('RECIPE_SYSROOT_NATIVE', 'u-boot-tools-native')
+
     def test_fit_image(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are built
@@ -195,10 +200,8 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
                 self.assertEqual(value, reqvalue)
 
         # Dump the image to see if it really got signed
-        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
-        result = runCmd('bitbake -e u-boot-tools-native | grep ^RECIPE_SYSROOT_NATIVE=')
-        recipe_sysroot_native = result.output.split('=')[1].strip('"')
-        dumpimage_path = os.path.join(recipe_sysroot_native, 'usr', 'bin', 'dumpimage')
+        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
+        dumpimage_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'dumpimage')
         result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
         in_signed = None
         signed_sections = {}
@@ -516,10 +519,8 @@ UBOOT_FIT_HASH_ALG = "sha256"
                 self.assertEqual(value, reqvalue)
 
         # Dump the image to see if it really got signed
-        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
-        result = runCmd('bitbake -e u-boot-tools-native | grep ^RECIPE_SYSROOT_NATIVE=')
-        recipe_sysroot_native = result.output.split('=')[1].strip('"')
-        dumpimage_path = os.path.join(recipe_sysroot_native, 'usr', 'bin', 'dumpimage')
+        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
+        dumpimage_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'dumpimage')
         result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
         in_signed = None
         signed_sections = {}
@@ -671,10 +672,8 @@ FIT_SIGN_INDIVIDUAL = "1"
                 self.assertEqual(value, reqvalue)
 
         # Dump the image to see if it really got signed
-        bitbake("u-boot-tools-native -c addto_recipe_sysroot")
-        result = runCmd('bitbake -e u-boot-tools-native | grep ^RECIPE_SYSROOT_NATIVE=')
-        recipe_sysroot_native = result.output.split('=')[1].strip('"')
-        dumpimage_path = os.path.join(recipe_sysroot_native, 'usr', 'bin', 'dumpimage')
+        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
+        dumpimage_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'dumpimage')
         result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
         in_signed = None
         signed_sections = {}
-- 
2.45.2


