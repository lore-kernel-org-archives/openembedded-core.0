Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F3BC982F8
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 14:58:51 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50861.1790002720690864844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 07:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jq/TgIZJ;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so1470065f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790002719; x=1790607519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TzEe40gG+G4Mf7yUgdQY0vEVrFbwNh57O/ZC3l7Oroo=;
        b=Jq/TgIZJZHd85cOKsEIBn0iPCDcqtCfbvh0lSSMRMtZ5Szw4dMYDRPvCDmRo1nR7WU
         ymQYN7TsHWKHgcscyPlgM7AnVtgp0DuxI6p/Z3RTbPEwD+P7FZt1P9YJhx3JC/MGDGba
         RhCSfYsLT2PqZLeZTObJdSk6Z7OwQrSWr5OCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002719; x=1790607519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TzEe40gG+G4Mf7yUgdQY0vEVrFbwNh57O/ZC3l7Oroo=;
        b=QzRK87sHHLl0wqVdHWg0lmjKByM91dkokH9dDRcTKd6Uq+ZOh4Ywq4gBKNcTyxSCLK
         eb/j3JSHEnxDR5Ml4rxv6hhU9AW1m5CgzsvnfqkObP9cUnI3S4koHYbBXqwXIG8wuDrs
         DVdwhe9Ejb63UabsVqIxh11O7hvIxd6w1rW2LOjVFJ7tnrVcC8gSu61qNRnZdVeQcFb/
         LhMMLwN2xas5Pbxo+GY/+Gt62xpy8dZ6FnTIY7f61JeYFxcxmUwdJdj8iDhM5ZRi1jmS
         SauFjJAdgFP4QI+aMoZ/VNjqWYJ2AG9UdmZZh6rSUOjJeZHamOTYGVx/De6UCGHofbs6
         +rCg==
X-Gm-Message-State: AFuF++mektSsa9k072vd4kWGnaPlw2KE09rsBvhD8+WM+mWMSHYq6cXE
	69SCH4PWwKHyrhlAlzuYGxraR53BR2rs8dIPmmHGrltlMBTdU1oeCsvMZwkEW4dA9H3VcWR7BSn
	tL8d60R4=
X-Gm-Gg: AYBFou3wgfRw4bh2uqRkWSk7s8W878oTbP4EGN2IIxpt09IZDYk8Ql77/TerX0A6Ja7
	ekxLzUq/wSX0lA6tIsQObiVKdwNyJifrA95So1jWgB0EH6Bhm0VO3+o3by8SiJsRgJksG9ckEHp
	nR0fYY8PAK9FaF6t7WeO022G08kFZQc9v6d9gGE+3ZIgJoiqF/PZfdZ/jHR1X9QFuC/RwSr/R0z
	DRLAPzRS9scvx+7Cj1Y7iad0lhdfA3rou1nEiTujU9ik8/GYGpEWQSLsy8KAaZDZfNSbNl8sqiH
	QMjuZzhxCSdWANkvYmrMLkS0BOP2c3fDChwXveMpt0actwJOzIHt4lkzjt5Eoqmbe7+4MZIAydw
	NA9lQvn5t0MCcbFsyTuJL5P6O6uEWEDF+A7ni/Pb4wuyPqvVJk9y/6X+Vj/EtzpOyji0T0lIYh4
	rZ/2dlhlP7ixZOeZLCM2jKg/t9dMD2lvciqt9TC+n6xhIffwlKIRJszFKnfK04qx1XpzFy9zZTm
	CBF30TIytqWvMM2Q1JWXsrFLXU=
X-Received: by 2002:a05:6000:4548:b0:487:221f:65b8 with SMTP id ffacd0b85a97d-487221f65cdmr10194822f8f.50.1790002718566;
        Mon, 21 Sep 2026 07:58:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a46d:d671:f81e:e5f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724596604sm23856287f8f.30.2026.09.21.07.58.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:58:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] harfbuzz: upgrade 14.4.0 -> 14.5.0
Date: Mon, 21 Sep 2026 15:58:32 +0100
Message-ID: <20260921145835.1106731-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
References: <20260921145835.1106731-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 14:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246335

Overview of changes leading to 14.5.0
Monday, September 21, 2026
=====================================
- Update Unicode 18.0 data and script support, including script values for
  Jurchen, Proto-Cuneiform, and Seal, and the corresponding shaping support.
- Add support for VARC table subsetting, including pruning auxiliary data,
  remapping glyph IDs, and guarding the feature in lean builds.
- Add rendering work budgets to the draw and paint APIs and share them across
  the raster, vector, GPU, and Cairo renderers so nested outline work remains
  bounded.
- Improve performance in set iteration, lookup traversal, and the repacker, and
  add coverage for new benchmarks and fuzzing seeds.
- Fix various correctness and robustness issues across the CFF, Graphite,
  DirectWrite, and repacker code paths, including memory leaks, overflow checks,
  bounds issues, and malformed-font handling.
- Various build, portability, and CI fixes.

- New API:
  * Common:
    +HB_BUDGET_DEFAULT
    +HB_BUDGET_UNLIMITED
    +HB_SCRIPT_JURCHEN
    +HB_SCRIPT_PROTO_CUNEIFORM
    +HB_SCRIPT_SEAL
  * Draw:
    +hb_draw_set_budget_func_t
    +hb_draw_get_budget_func_t
    +hb_draw_get_budget_remaining_func_t
    +hb_draw_funcs_set_set_budget_func()
    +hb_draw_funcs_set_get_budget_func()
    +hb_draw_funcs_set_get_budget_remaining_func()
    +hb_draw_set_budget()
    +hb_draw_get_budget()
    +hb_draw_get_budget_remaining()
  * Paint:
    +hb_paint_set_budget_func_t
    +hb_paint_get_budget_func_t
    +hb_paint_get_budget_remaining_func_t
    +hb_paint_funcs_set_set_budget_func()
    +hb_paint_funcs_set_get_budget_func()
    +hb_paint_funcs_set_get_budget_remaining_func()
    +hb_paint_set_budget()
    +hb_paint_get_budget()
    +hb_paint_get_budget_remaining()

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_14.4.0.bb => harfbuzz_14.5.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.4.0.bb => harfbuzz_14.5.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
index a5c601b1dee..438aa23133c 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371"
+SRC_URI[sha256sum] = "b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 

