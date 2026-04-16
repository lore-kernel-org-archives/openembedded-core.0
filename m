Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9431F8E48A
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28277.1776378806907643686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nT3Tm+Eb;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so732615e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378805; x=1776983605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOJc0sc2X9W0KluyZy40GdVF8HL/+LAlKeITT2hK1+4=;
        b=nT3Tm+Eb5y7wGM+PIo4ZTABWBAEHy2/0ysrD/yqpnRT7jw35gUR0bxUmLl9hNLVBsR
         rbKkvQAn2sVJKGWYxpVfbOYzhruDoIRuPzmlssgv2S/VJnSTTSc6Wf6PKNgMhjk4mwpO
         Hv8c/G7/1s0Yli5XOB9cxa4sWmy/FglW5gVg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378805; x=1776983605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cOJc0sc2X9W0KluyZy40GdVF8HL/+LAlKeITT2hK1+4=;
        b=fJdJ5z/+K7ZXHH2EqvU2Dk0kkwovQdb4aoSijPa5a1pZ8W2iLo0ZVovuz9JZVQOTeZ
         h9xegmzD3Cs9klBVp84nEBNh/keic77Yb9jSrkeoQqlLexreY239HpgjdPo/pdAyef8V
         Jcw2sgtVxot4s4AzX1BcjVVDeH7ef1EQ8XCxIFWiLzLX9qElV0kEO0x+Q3N+A7iM8DwZ
         dw+u56iOqmNnAT6tZfGHmXupEEzGDd05U+dXJbiEkuClsTHhCex5QoS7B6bRv6fJTfAs
         Khm9fJ3Zf0+4sH0/cKzHhJSa7Nx9DYoBTNPVJivZqP2RBYbjatBQD76uJ2frmWyivBUH
         X0lg==
X-Gm-Message-State: AOJu0YyhYOAta/7Yn5vhzFpbi3mUmerXbpDq4HKJ6+mlEqIFAXS2Ejrc
	ngTLIJXsvBuVrK5XfR5MJISk03ZzAyE/paT5qwWgXPGJr3/mwg4X2XXwUvOYwvC7UwdN0BM1v4W
	gUYlAumjoCg==
X-Gm-Gg: AeBDiev1OgS8dOirVk2qSibOKKNWalFx730mIjW5T0Mj4l+K7Y3WKBEcZ0NvFzGBGN6
	NvYuECOARpv3JYYQ3X9RwI/ywu8vGBZnxQhK4JnQhamsSGkiOHXHuAxk19ROWlf8qiPKQ8Sw7cY
	s0iw457iVHBiD/5K4813Yf1DMLMZxtULi1Ui0oqK7ggbPnQTKiZqhZo2vbQFOTezgeSoSue2TEC
	YwCwg8H0iuewOeN2gSlD/ZYNmU6E17yHyporYa64FWWUiz2SHZXKR/KXMxW4dbY884eLa/PyOeL
	E85yDA6uwWXuV0tQPwR2CQrbQh1f0O+rimnSaKx77zYK+aZ6/kuOz1Qn/kT6MjSdx2mO3ObBYGe
	DP17wVyCRykcjV5g5PFqp63J5ecRR9HO1/tLitw2xgqRY8MSGteRU8FrxLc2h66Vo+d4dYP0c2o
	QnJ8Z7/PHHTHGJZ9xpVkaC/Sl7YkwYm6bOi9dj9XT8XMPqx4AEIO0J6pinf3ZIPitb0cbgdhsd/
	t2o67b07/g+6m6j3hDp1iS61KCUNsDbTr/eOA==
X-Received: by 2002:a05:600c:621b:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488fb742e74mr5488045e9.9.1776378805016;
        Thu, 16 Apr 2026 15:33:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 40/51] oeqa/selftest: add wayland feature check for tests needing it
Date: Fri, 17 Apr 2026 00:30:23 +0200
Message-ID: <17841fd5e64cb2f0e966e848481a1807918dc62d.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235469

From: Yoann Congal <yoann.congal@smile.fr>

When run with a distro without 'wayland' DISTRO_FEATURES:
2026-04-14 17:42:00,568 - oe-selftest - INFO - FAIL: test_sstate_32_64_same_hash (sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash)
2026-04-14 17:42:00,568 - oe-selftest - INFO - ----------------------------------------------------------------------
2026-04-14 17:42:00,568 - oe-selftest - INFO - Traceback (most recent call last):
  File ".../openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 407, in test_sstate_32_64_same_hash
    self.sstate_hashtest("i686")
    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^
  File ".../openembedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File ".../openembedded-core/meta/lib/oeqa/selftest/cases/sstatetests.py", line 371, in sstate_hashtest
    bitbake("core-image-weston -S none")
    ~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
...
AssertionError: Command 'bitbake  core-image-weston -S none' returned non-zero exit status 1:
...
ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: using DISTRO 'nodistro', which is missing required DISTRO_FEATURES: 'wayland'

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
 meta/lib/oeqa/selftest/cases/sstatetests.py      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 93884f57319..0e225ad02c7 100644
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
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 687640a4016..02fd45fe0d9 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -15,6 +15,7 @@ import re
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfNotFeature
 
 import oe
 import bb.siggen
@@ -354,6 +355,7 @@ class SStateCacheManagement(SStateBase):
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
 class SStateHashSameSigs(SStateBase):
+    @skipIfNotFeature('wayland', 'Test requires wayland to be in DISTRO_FEATURES')
     def sstate_hashtest(self, sdkmachine):
 
         self.write_config("""

