Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E0AF8A171
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:08:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26625.1776373734227340869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HjxtBXKs;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so29595e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373732; x=1776978532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgHIj4Xxd5n0RXNvK7ojySMx24ccOk1nbQNAz53x0+M=;
        b=HjxtBXKsatfShwTx2eYp2MURzSzoGaG7RWNYDyVBcbLTOgq+11hP3JRjrZQpSxNTUv
         F4Ug8GpVVMlx9J4ZYT6OvlIYiM10rUG2K8V2OmKjo54SaD0826HFiHi8sMUxT0Non+z7
         2307zfshd66gRIUijXiZqNKWOUM9FAzj3P+Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373732; x=1776978532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgHIj4Xxd5n0RXNvK7ojySMx24ccOk1nbQNAz53x0+M=;
        b=lwm54Zavq2oj3yyReZ1ykvZxodkKALcL3wXgPs7JVX9sGSeX45lAVk4i5oi/rEYeni
         N/oRbT0YcpooBZRdNSq8sHloxX6WzksWmClESwhPO4ecyb/8V4lJBwLf+VpLmLabh3mV
         u7G+aoh6tY49wr74+R6uul5tQgzqNInjPE3yjBz94Clwme0CVCdPDr1zSliToRx56h8U
         xLpSOv9hh3h1/8yDaD94cs/APjo9ldWtQojdWSolMjYggCJZhtWgVBXVqsgsdXJg25Sp
         fLcv21diSyGVjTgejBfCP6nHg1FTDQ0QUgpeRyo2WXdYAFUzNgzSy8WxSk7/SDMfJmbX
         Pu5A==
X-Gm-Message-State: AOJu0Yz5dwBiPdPbNwM6NFAug0alX0t/Y4U0zxFR/orR2K2LE/8K0hv8
	l/uAf5X3e8i2aGb2+SDqQA4hl4HmBUrb86+bbkOpUPSARLEN0VL7HCp1GPPuzDAseBfBF+c5w0Q
	zDxDmf8ql8g==
X-Gm-Gg: AeBDietI2ksdaVbHW6QI2naqzop6201VLS44llQMkTFgXdXXxLDF/1i82urVPRN8NP4
	unJhHQlECoaIA9lE63B9CBlCFxn+WL7ZLPoJhQsCv/RGRiP5Rg3bmyTKpNkhXLUXcmuEbzE/zQW
	960nV5CBWy3RN38qQ43OU6AsxQ3y9c+BWIHlMAGkkhbbToD4oFa6diRYOuDvQiNtiqPkDnQiOBS
	WGPwMr9kOrgMSnO5f6nAwjVzSYXO+XdQMlzzjodsBbCSSmQ+W1h75djErgxIUGemnQW3FLjPm5k
	A8zKTVO3JG8p7DCO2+WZNP35Ks4VC/lIBmYAP0PSUwkfBd01HCe2udsLNNNWUvKN+bKYWmLLTTE
	i5VnmSiV2PgUv9wbI+iZFWfVmgQsqXdo1P603/wvlT1aSW93rQE7b7DfAzdC3CwBrobvPMdJ9co
	6yHP5wjkXy+7w12xkj/P99ZfGX1lXgMzr0GwerS0AtEfFVGkVhXWTS03T7aMgrqA+GcA5UKNUaB
	wPXYD8XcXDIhX4OvC9GHh9vsfCNWwQn8O4pCQ==
X-Received: by 2002:a05:600c:5252:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-488fb768483mr3106815e9.18.1776373732324;
        Thu, 16 Apr 2026 14:08:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/8] oeqa/selftest/incompatible_lic: add wayland feature check for test needing it
Date: Thu, 16 Apr 2026 23:03:55 +0200
Message-ID: <20260416210836.1336162-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235419

From: Yoann Congal <yoann.congal@smile.fr>

When run with a distro without 'wayland' DISTRO_FEATURES:
2026-04-14 17:42:00,568 - oe-selftest - INFO - FAIL: test_core_image_full_cmdline_weston (incompatible_lic.NoGPL3InImagesTests.test_core_image_full_cmdline_weston)
2026-04-14 17:42:00,568 - oe-selftest - INFO - ----------------------------------------------------------------------
2026-04-14 17:42:00,568 - oe-selftest - INFO - Traceback (most recent call last):
  File ".../openembedded-core/meta/lib/oeqa/selftest/cases/incompatible_lic.py", line 153, in test_core_image_full_cmdline_weston
    bitbake('core-image-full-cmdline core-image-weston')
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
...
AssertionError: Command 'bitbake  core-image-full-cmdline core-image-weston' returned non-zero exit status 1:
...
ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: using DISTRO 'nodistro', which is missing required DISTRO_FEATURES: 'wayland'

This is caused by core-image-weston being skipped because it needs the
wayland DISTRO_FEATURES.

Note that this is not seen in testing because nodistro has wayland
enabled by default since
2e1e7c86064 (bitbake.conf: Enable opengl ptest multiarch wayland vulkan in DISTRO_FEATURES by default, 2026-02-21)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/incompatible_lic.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 1395e5d1376..12f4d14f165 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -5,6 +5,7 @@
 #
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
+from oeqa.core.decorator.data import skipIfNotFeature
 
 class IncompatibleLicenseTestObsolete(OESelftestTestCase):
 
@@ -142,6 +143,7 @@ require conf/distro/include/no-gplv3.inc
 """)
         bitbake('core-image-minimal')
 
+    @skipIfNotFeature('wayland', 'Test requires wayland to be in DISTRO_FEATURES')
     def test_core_image_full_cmdline_weston(self):
         self.write_config("""
 IMAGE_CLASSES += "testimage"

