Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73159CA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:55 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18110.1790786321900887195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Xs5gIABr;
 spf=pass (domain: baylibre.com, ip: 74.125.230.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so47323566d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786321; x=1791391121; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5/3jo/4PvVYQ1Hdfd0nMAkEBuwz2ztOJYtJgKpIz2c=;
        b=Xs5gIABrAB4uVSW05l2Ke0YYx/vGVmyNt2n6+TQ1yuPv0CFCnu64kApca8qjWEuNzK
         bfYA0fqL5F4BlI96NanEg+KPiwFvz+N7QQaTwoJhWVo49ZGGwQFMCSlLl+kSseR2wEoU
         PLMPhi6UVbgS9MKQXID0HenuONlyKgrD3XJs6SMvmMN/tctiFGSkR42JtCQB3iDS+4Nd
         pckKDwfVow8h79EtbzcFSyFpbzrW2JsphXximwbgm+c6bRluFTAbOT9osvv1alCpTERz
         yE9RG8ijM2In7eFvFlH35AEwI5X+lyIr2GecBvi2042bMswMs0oeQ7yFWvlDEwDrcJ2b
         c3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786321; x=1791391121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5/3jo/4PvVYQ1Hdfd0nMAkEBuwz2ztOJYtJgKpIz2c=;
        b=PHyxxcWZskCZ1h6Ht+Vjt97b7Rds3NfwaVyjH0RkiZewjAQSj8sW+js8ZsG+6lvYiE
         51NlhnIofLm6k/Cko45Am1K3IYvF4IdcYEDEtZNf2acqjKJQSB8ImZUUGTET+LQGUC9E
         YEZo5jzsAG3VI7PHy2CLMYMuPQEsRNMzbxXKpDO+z2zfzYm4YjfvHviCzPpMzModvL8c
         kULZRVwKUgKhxfZDr5qlwop9KCdlTXPUFEtWOg7II4mcM395nrSSbJPOKNYY+Q5aOcFT
         vYG1cvfzCnRF8uOAPMBLTGlLaQOXJwPijq2jc/gJdh7WZreMX5T2huLN6fSR7EMKFHKc
         RIEA==
X-Gm-Message-State: AFuF++kqUhOQ4eGiF8xsOQn3MQuBNzBaK9KEFyYybNLryC4419DHSgwA
	FSe7ekjGJynqNILwqEdg2AJZ57+OGe11z4f+wQLPIQezl3lOIEkabD+c8APEff475QCpnmeor8P
	2Rm2t
X-Gm-Gg: AYBFou3Zx72Lhg1ytpBwWjhIgXiZZwNriB0KPe5Ejq2YmJ21VgN+5FtJMIpp0WrWhKH
	X6gBrW+eAB80cmz/9Nh0AjIFV64r2/IW8Ncx/NsNRR487rvrT81ciulRJbIN9/u0bYE5SksCHE+
	lPFUpm5nbgcoCGIsOV1BovV+5eRKF+Z7VqtlBei0aAu6AUCuESAOZfvijBY9INP9SKII2LnMx7o
	y8pgLmrUH1LFlgjIKpsZ8txBmxBJOWGQZg2Avyi0yg+JTdRGBIOejqI99cJiqbq4I5/I0flL5qN
	1cXCVkjsBXMTA+CrXAynSirl35Vp7VU2hDScZfxEWpCE2r9kTL6Y36oCxEpVsFThiTBf5JryLUw
	NR49+TDGJLQnCmfh1zKGKHpgZfASR97s7GPVHcUZ7sgE8RRiS1wegpjsRRWsHvWgK66rY7U796U
	sjiG/KutiZL9h2wr072tO72J5+8mNTGdp7AK/cmwFDWwYauZ3XPPKyou1GtTWM8ocKRp8TR4WEx
	xcKy8/xg/BT0hWAIwGgqent72ho8M8gf9rfzkT55ec=
X-Received: by 2002:a05:6214:2123:b0:917:841d:ac71 with SMTP id 6a1803df08f44-917a0e7813amr30736636d6.36.1790786320856;
        Wed, 30 Sep 2026 09:38:40 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:40 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:22 -0400
Subject: [OE-core][PATCH RFC v2 18/19] selftest: oelib: add tune.py
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-18-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246998

Add a basic suite for meta/lib/oe/tune.py to test:

- riscv_isa_to_tune() logic/expansion/parsing
- riscv_implied() rules handling
- Profile compatibility/nesting (e.g. rva22 is a superset of rva20)
- riscv_pkgarch() profile naming/matching, including zifencei
- Include testing of vector subsets when 'v' isn't specified, since
  these are technically valid

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/oelib/tune.py | 88 ++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/tune.py b/meta/lib/oeqa/selftest/cases/oelib/tune.py
new file mode 100644
index 0000000000..ff9b895fce
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/tune.py
@@ -0,0 +1,88 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from unittest.case import TestCase
+from oe.tune import RISCV_PROFILES, riscv_isa_to_tune, riscv_implied, riscv_pkgarch
+
+def features(isa):
+    return set(riscv_isa_to_tune(isa).split())
+
+class TestRiscvIsaToTune(TestCase):
+    def test_abbreviation(self):
+        self.assertEqual(riscv_isa_to_tune('rv64gc'), 'rv 64 i m a f d c zicsr zifencei')
+        self.assertEqual(riscv_isa_to_tune('rv32gcv'), 'rv 32 i m a f d c v zicsr zifencei')
+
+    def test_explicit(self):
+        self.assertEqual(riscv_isa_to_tune('rv32imac_zicsr_zifencei'), 'rv 32 i m a c zicsr zifencei')
+        self.assertEqual(riscv_isa_to_tune('RV64IMAFD_Zicsr'), 'rv 64 i m a f d zicsr')
+
+    def test_profile(self):
+        for name, isa in RISCV_PROFILES.items():
+            self.assertEqual(riscv_isa_to_tune(name), riscv_isa_to_tune(isa))
+
+    def test_not_riscv(self):
+        self.assertEqual(riscv_isa_to_tune('x86_64'), 'x86_64')
+
+class TestRiscvImplied(TestCase):
+    def test_implied(self):
+        self.assertEqual(riscv_implied({'m'}), {'zmmul'})
+        self.assertEqual(riscv_implied({'c', 'd'}), {'zca', 'zcd'})
+        self.assertEqual(riscv_implied({'za64rs'}), {'za128rs'})
+        self.assertIn('zve64d', riscv_implied({'v'}))
+        # vector subsets, without v
+        self.assertEqual(riscv_implied({'zve64d', 'zvl128b'}),
+                         {'zve32f', 'zve32x', 'zve64f', 'zve64x', 'zvl32b', 'zvl64b'})
+
+    def test_zicsr_kept(self):
+        # Dropping zicsr would rename the existing non-profile package archs
+        self.assertNotIn('zicsr', riscv_implied({'f', 'd'}))
+
+    def test_profiles_nest(self):
+        # Later profiles are supersets of earlier ones, which tune-riscv.inc
+        # relies on for PACKAGE_EXTRA_ARCHS
+        names = ['rva20u64', 'rva22u64', 'rva23u64']
+        for lower, higher in zip(names, names[1:]):
+            h = features(higher)
+            self.assertLessEqual(features(lower), h | riscv_implied(h), '%s is not a subset of %s' % (lower, higher))
+
+class TestRiscvPkgarch(TestCase):
+    def test_no_features(self):
+        self.assertEqual(riscv_pkgarch('', 'riscv64imafdc'), 'riscv64imafdc')
+
+    def test_profiles(self):
+        for name in RISCV_PROFILES:
+            self.assertEqual(riscv_pkgarch(riscv_isa_to_tune(name), 'unused'), name)
+            self.assertEqual(riscv_pkgarch(riscv_isa_to_tune(name) + ' zifencei', 'unused'), name + '_zifencei')
+
+    def test_existing_names_unchanged(self):
+        self.assertEqual(riscv_pkgarch(riscv_isa_to_tune('rv64gc'), 'riscv64imafdc_zicsr_zifencei'),
+                         'riscv64imafdc_zicsr_zifencei')
+        self.assertEqual(riscv_pkgarch(riscv_isa_to_tune('rv32imac_zicsr_zifencei'), 'riscv32imac_zicsr_zifencei'),
+                         'riscv32imac_zicsr_zifencei')
+
+    def test_most_specific_profile(self):
+        # rva23u64 without supm isn't rva23u64, but still contains all of rva22u64
+        f = riscv_isa_to_tune('rva23u64').replace(' supm', '')
+        pkgarch = riscv_pkgarch(f, 'unused')
+        self.assertTrue(pkgarch.startswith('rva22u64_v_'), pkgarch)
+        # implied by v, so left out
+        self.assertNotIn('zve', pkgarch)
+
+    def test_implied_not_listed(self):
+        # b is implied by zba/zbb/zbs, so leaving it out still matches the profile
+        f = riscv_isa_to_tune('rva22u64').replace(' b ', ' ')
+        self.assertEqual(riscv_pkgarch(f, 'unused'), 'rva22u64')
+
+    def test_exact_drops_implied(self):
+        f = riscv_isa_to_tune('rv32imafdcv_zmmul_zaamo_zalrsc_zca_zcd_zve32x_zvl32b_zicsr_zifencei')
+        exact = 'riscv32imafdcv_zicsr_zifencei_zmmul_zaamo_zalrsc_zca_zcd_zve32x_zvl32b'
+        self.assertEqual(riscv_pkgarch(f, exact), 'riscv32imafdcv_zicsr_zifencei')
+
+    def test_exact_keeps_bitmanip(self):
+        # b is never written out in the exact pkgarch, so zba/zbb/zbs must stay
+        f = riscv_isa_to_tune('rv64gc_zba_zbb_zbs')
+        exact = 'riscv64imafdc_zicsr_zifencei_zba_zbb_zbs'
+        self.assertEqual(riscv_pkgarch(f, exact), exact)

-- 
2.55.0


