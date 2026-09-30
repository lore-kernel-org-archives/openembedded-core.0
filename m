Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6617CCA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:35 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18108.1790786317075220333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Ma2ghaXG;
 spf=pass (domain: baylibre.com, ip: 74.125.230.235, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93ca7aa84e4so77204985a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786316; x=1791391116; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf0nOZ4HP13InUx48vdmCWSCf07V3OVL/HKwyfwrbaE=;
        b=Ma2ghaXGW6wOSZxMjdxqwE9zrO02J5v+xNHASLo7suuCTkISjAIOYzFJ/XOVnVm3Sh
         NhsZUPMyqfh1r7CmtwmFn8a6hcAtAABZFkamL68S+niUyg/vzywA1OWAYDmO776aCaYk
         XuWHLuAvUJDcwbvCZZ7gfDpkac260tnLynDGuuKwj28MLSHk1EwIqlXunbkwkXnpURkU
         p2Yue80R5OlmAUN4D2PQZTCB7lMwx6vWokUClbU8gjGxa6HxDoRzBRVAddAXD7C276/B
         HduZi/D58SCRV3ulqOwkRGdEIE3gk9cJ+Ma7KrFRBu5iUC9iHu4sKSEkHJpkQuOCGxW6
         5lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786316; x=1791391116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf0nOZ4HP13InUx48vdmCWSCf07V3OVL/HKwyfwrbaE=;
        b=FrxRu4lixUbEHu21K4x5lj2x1FFgb5hWrlJYrZv8dfZvLZZjn7fCOQlXqs9hqJsHuT
         PgwtTvb54tOlB8vX4UR7qscPVOv9rNDUX9nH7OrmDvNr3y6n6cNYL4QMvnfKYwUD1Qhh
         PLJvLMx2w+ej762Ol9twqSXPcA3aSUiGwNs7pMbJ7hub8GsPLLq3bqDSWcD14KEufu77
         u4QE6VBV3/JgER1CwVLw9ivVVZwBHcX9ONtKA/D1D+uPvbuSN/Xe43V7nfbZ7yXloNoQ
         YaUq7nrCJ9+NJhCEfsx1DT+KigfyCWnbPdLccJgeAF8bge3Sf3uWKe6OV3Zghirn/5NG
         Rrfw==
X-Gm-Message-State: AFuF++lN1bLSpWFrNVmpvLOhjmkhozaM8dkMq/xeKX9Io90toL5UiWVo
	hOnWuqdFrTLpsCXtvEXMcLoDwaBmGm0X0EgvRpKzjlMUbIpvAD5FJn9vRBegqLwcdhw=
X-Gm-Gg: AYBFou2hSEY/tMt94wyk4Nhxb0Dst16E257AIyhucbKAMG0mqJZCS9QkpU9PD7TOB59
	uHLKpin0d4931XWN8xmVyy71RPGtRGgPl8wOmgDChvqnI4aVUXLAOvS40ieslq2S1DGsPORJ06D
	sJcV3DkKPfppa8m73i4O3qTMRwt28lO40YoFtt7XNmaOWNh2CUu7NUZyxJhSX1Heo9UruJ7u3zq
	VtVOyrTbNtzHQ/tIQNnUcAF9neHzqCS10CMq2rwBBC4EIA/0jXyZJT1YvbVcPjLOScUwgncz6E1
	B2VgDW3tGEUY9hMBKMPa7A8IlrCELfxih5dJN41DiLzgpCfsbi0B3UdbLI3MEFjHeshRtDmOUUj
	bHABPMYrX4pyl3CvvPd80C7HLi9xwha24/SfOEwbQDtPsEslbmgJoPVp4QnWDI+dxFpzQUM+L7n
	WqHn55pYcrGtWzRD1fgiKjCfY5jlJH8LsrhnkjDh2ulrPrXNMIW3aDtZPcoDhf2jkuy6Ofa+Edl
	JuVBDFngkgnpFk46eh1ThpG1L8yMDh3f70BgnRkYbY=
X-Received: by 2002:a05:620a:172b:b0:93b:c3ac:a94f with SMTP id af79cd13be357-93ca96cef57mr336308585a.37.1790786315883;
        Wed, 30 Sep 2026 09:38:35 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:35 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:18 -0400
Subject: [OE-core][PATCH RFC v2 14/19] tune.py: add implied tuning logic
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-14-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246994

Add a new function, riscv_implied() and corresponding tuning lists to
help with shortening PKGARCH-related variables. There's no need to
specify every extension when some (e.g. 'm' implying 'zmmul') are
automatic.

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 59 ++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 0d8e4417e7..1ff4b32e74 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -4,15 +4,42 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-# RISC-V profile name -> equivalent ISA string. These are determined from compiler output, like:
-# tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=rva20u64 -mabi=lp64d -Q --help=target | grep rv64
-#   -march=rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd
+# RISC-V profile name -> equivalent ISA string, i.e. the mandatory extensions of
+# each profile as ratified in the RISC-V Profiles specification
+# (https://github.com/riscv/riscv-profiles):
+#   RVA20U64, RVA22U64: RVA20/RVA22 Profiles, version 1.0
+#   RVA23U64: RVA23 Profiles, version 1.0
+# plus the extensions those imply (e.g. zmmul, zaamo, zca, zve*).
+#
+# The profile names are used as package architectures, so each entry here is an
+# ABI claim: packages built for "rva22u64" must keep meaning exactly this
+# extension set. Do not regenerate these from compiler output (e.g. gcc's
+# -march expansion); a newer compiler, or clang, may expand a profile
+# differently. Changing an entry changes what existing package feeds mean.
 RISCV_PROFILES = {
     'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
     'rva22u64': 'rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt',
     'rva23u64': 'rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_zvl128b_zvl32b_zvl64b_supm',
 }
 
+# Extensions implied by another enabled extension (per GCC's
+# riscv_implied_info). zicsr (implied by f) is left out for backwards
+# compatibility, i.e. so the package archs of the existing non-profile tunes
+# (e.g.  riscv64imafdc_zicsr_zifencei) stay the same.
+RISCV_IMPLIED = {
+    'm': ['zmmul'],
+    'a': ['zaamo', 'zalrsc'],
+    'c': ['zca'],
+    'b': ['zba', 'zbb', 'zbs'],
+    'v': ['zve32f', 'zve32x', 'zve64d', 'zve64f', 'zve64x', 'zvl32b', 'zvl64b', 'zvl128b'],
+    'zcb': ['zca'],
+    'zcd': ['zca'],
+    'zcmop': ['zca'],
+    'zvbb': ['zvkb'],
+    # a reservation set of at most 64 bytes is also at most 128 bytes
+    'za64rs': ['za128rs'],
+}
+
 # riscv_isa_to_tune(isa)
 #
 # Automatically translate a RISC-V ISA string to TUNE_FEATURES
@@ -91,6 +118,15 @@ def riscv_isa_to_tune(isa):
     feature = list(dict.fromkeys(feature))
     return ' '.join(feature)
 
+# riscv_implied(enabled)
+#
+# Return the set of extensions implied by those in enabled.
+def riscv_implied(enabled):
+    implied = {i for e in enabled for i in RISCV_IMPLIED.get(e, [])}
+    if 'c' in enabled and 'd' in enabled:
+        implied |= {'zcd', 'zca'}
+    return implied
+
 # riscv_pkgarch(features, exact_pkgarch)
 #
 # Prefer a RISCV_PROFILES name (plus any extensions enabled on top of it) as the
@@ -98,12 +134,25 @@ def riscv_isa_to_tune(isa):
 # what the sstate class can handle. When several profiles match, the one with
 # the most extensions is preferred, as it is the more specific/clearer match.
 # If there's no clear profile matching the extension list, then fall back to
-# exact_pkgarch.
+# exact_pkgarch. Either way, extensions implied by others are left out.
 def riscv_pkgarch(features, exact_pkgarch):
     if not features:
         return exact_pkgarch
 
     current = set(features.split())
+    # Match profiles whether or not implied extensions (or the b shorthand)
+    # were listed
+    if {'zba', 'zbb', 'zbs'} <= current:
+        current.add('b')
+    implied = riscv_implied(current)
+    current |= implied
+
+    # Drop implied extensions from the exact form too, keeping its base
+    # (e.g. riscv64imafdc) and canonical ordering. Only drop what the string
+    # itself implies, as b is never written out there.
+    base, *exts = exact_pkgarch.split('_')
+    exact_implied = riscv_implied(set(base[len('riscv64'):]) | set(exts))
+    exact_pkgarch = '_'.join([base] + [e for e in exts if e not in exact_implied])
 
     best_match = None
     best_features = None
@@ -117,5 +166,5 @@ def riscv_pkgarch(features, exact_pkgarch):
     if best_match is None:
         return exact_pkgarch
 
-    extra = sorted(current - best_features)
+    extra = sorted(current - best_features - implied)
     return '_'.join([best_match] + extra)

-- 
2.55.0


