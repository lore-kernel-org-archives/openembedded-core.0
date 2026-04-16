Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE898F8808C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7592.1776322126826079091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bw809IBk;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7650202fso3335896f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322125; x=1776926925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOJc0sc2X9W0KluyZy40GdVF8HL/+LAlKeITT2hK1+4=;
        b=Bw809IBkwA7c227/zHOmCU2dgOub4GCtFQExAgDOlHZrDJA5DsMqxC+thE3Q+WD6FP
         95jRLm/87tnzIV1r1AIWE4QvWx+6y2BzgQ01dn8X3mdJdrT9YAZnZvKQ4LLx6EPCv2RP
         sFt9u1LmdSXGSqPwup8M5sH7aBZuyzmhGtzv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322125; x=1776926925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cOJc0sc2X9W0KluyZy40GdVF8HL/+LAlKeITT2hK1+4=;
        b=qg2lnjLp/7wUXW26CZK1/O8jbk/VGIP3m9wujwAqlkVVEHSOfNTRudl0dCpfcD5PKu
         3vvbKQGCiwq+vYYT2I7JEgp0FaNlZhLZn7ThmMSSfJVmqUBwPkLqktWofX+aK8Z5sfUh
         o/wZ4m1SZ9DcXjmWPfXNTucvPn0tYPZwzvqz8iAKHBy7RLDvvU22OfEjLSCafkwbudgc
         szI7pBhh3Ey11rhxD81+xjR9eK5iBWzY1TuoeafHsjMdb4nEmF8rvoEmE41NJrsRJyDJ
         8PHLvbj1uLsVz/CZQ9K3XoPZO4zgNpYki/cgPQM9hMyE02mQp/5rCkYTehBTygRUnBYT
         umZw==
X-Gm-Message-State: AOJu0Yxdy+iL2kUfnewU3KHGNWbsHys6vws+czBcn51qeiYbN+m4jtpN
	FXavNbmH10iFucW0fMZjWKAacdqSYfvm4alyJ/5tNtrID3kJC6RaSAMKgLFjPvN9MfF2K/QcPaS
	FIkzx5Xwh7A==
X-Gm-Gg: AeBDiesEjKUbcUzFlQecE2mLFEwtEDkLml1Wa1oHqbtCZyaztqTVhoPCheHqKNlLRgx
	0C5MJzrRc//phFupPbPF3jcwJ6hL527BvlJQEHly41iiDFdZuO2N7k+5QsXS4z24YgYuj/4NOeX
	penq2LU3ywW1dit0SFDN6vwBCpExmofTik3nH/JSF0gsBh4tMmSY86PH9NGo9rrF6AYAuLTJW1w
	Pn11cC0o7cFXBAWSWd/Dl2i8/hWg4G0ui641iFs02gMF7bUjmuowhemeg7PmV68TnMGDq334Pdi
	yvehDydq8y7zmSDpIQpiaTEkKoqEeZBLe/mzYIgEysQrXfm/ETMgdhTOpdlMwBpPVFCbMMC1Mct
	/JBi+H/PzJB4vcD9soqCan0vx6zPP8fDOfaW4BnCKq22UQigbv6puG+mfD7ObXn+CDirAi3eF+W
	Ily2Wubf+Y0HPPzw5eUd7xWD7D9sd2Eu3Toz4b+O5Yzd07v7g72s9JY3SVOAlMbsI+B8NdEbEIg
	8YX6FKK8GHxhbHzrma7L+uvgQrkQYaxWl/E3A==
X-Received: by 2002:a05:6000:178b:b0:43d:7940:f143 with SMTP id ffacd0b85a97d-43d7940f22cmr22156209f8f.1.1776322124870;
        Wed, 15 Apr 2026 23:48:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 40/47] oeqa/selftest: add wayland feature check for tests needing it
Date: Thu, 16 Apr 2026 08:47:41 +0200
Message-ID: <17841fd5e64cb2f0e966e848481a1807918dc62d.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235382

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

