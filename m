Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB77C982F9
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:22 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43676.1789974440805084050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Urh7mcRM;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so12225505e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974439; x=1790579239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CNpvJROpbS0tGiItcrlHRkpVo6x63QMQqcIyEOSfBMg=;
        b=Urh7mcRM1j79uCRspzPl0Rf194dL6tnXekjj7vTPN3ZHd2cnAHsWHwXVu4HCRuwcA+
         3Nqj4ouw/AQaNnkDRHM2gmRaCh3FMM8u7Pevmq2vWxgdCeWv/mGB8ZFOTb3BgyEw3+42
         y90KN2/8UVy26uR3aM3YCwqL17Q78vAjMSYO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974439; x=1790579239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CNpvJROpbS0tGiItcrlHRkpVo6x63QMQqcIyEOSfBMg=;
        b=bHiuHWXQe5hLrkyy6fWT3MoK/tGnH69IH0EPU/5P9uxyi1PDb8NxghBaBpDsCn0iPh
         Kr5CU86KNzV0tIIEN4mMyO3yMdPIQp/2ZDwm6P8Xn0NtJiSHRaCYQaYb3MsDrQ0QJGor
         TlOZoHjQAIVkd6tzITTKkLAfwjH9uTIEWdJZwBjWR/hZszXDDpqzy6rO7ZL2xzbWYluT
         NzuUhU5cpcMiWLJoyvu8mHLXXaCKDWeWBtCyPdbhJNDV+tQF/9c6G+Zm6XUhrZvQ7vtW
         AZz5dIpPxPqoH1hI3wiTyeKtPMiWV3Oq5sR4jhteZ0CLT8PSD0cXJ0V7YS2jTWwUlZ6D
         uHeg==
X-Gm-Message-State: AFuF++nhpsro1uPCU5fVZATKRINdxco6ClQD8pm9xGnSxKOuZ+6gSs06
	Yl1gCsR7SGdO1r8qN3YRsMroVn7vfpxTIgyvbNFWS8ZQQ8yuAINwh9NGhAsWUBZZVlcGH00lSk7
	0tc0dZR4=
X-Gm-Gg: AYBFou0YPffYlQVeCTbeEeXxzGHMz6NzuUD3TnObd98Zftf3nKsaa1+8+4Ee8cIAa0F
	LFJBW50RVlDqTGMxHI96ipGER5sQWSkr8l43RWrg6SmjSPv+H5dJlJ0F9caBmthAVtxEy2hEu3H
	gbFbI9Qkhhj9nde1hEvpys8Ugl4Ec8j7/RNqj+zz6wB9LVjmLTRWtvr7APUqghDoZDHg8cFn6ZM
	TSnehcN3ukCp9lJSUoNuJVbxSLKlGQhPL8m3NohABvU0eZyHWBKSb8PmGpGNyWLH6OpZrXZ9YwL
	we6tiNVPkHBKqW/R95qtRd+fKdk79+mQM+ZEDDnBCf+fRuMj5oUAdGz2Zt0vNTiP7PsJRSGuKzQ
	5wjiD5hCPlfxlR+yW/ZHTdUyM2vKuZFukVDYOvMCYZPjv6ISIvvXH+UqvyXquG6H4O3XY++tZoy
	g8lGEJwPGVpbP+V6JT0NWpRp0hb2h6rhQcEsR+85M3V3mM/DcOHg0BtZ/ma+4HKvm5m5uo/g/Lf
	WgwZUr8wK4aaTLNG603viO19l1jSpDD422p73Q=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr125763955e9.23.1789974438869;
        Mon, 21 Sep 2026 00:07:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/20] fastfloat: upgrade 8.2.10 -> 8.3.0
Date: Mon, 21 Sep 2026 08:06:51 +0100
Message-ID: <20260921070656.521680-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246302

b0ab987 Version 8.3.0
3254622 Add chars_format::javascript_sloppy (Annex B NonOctalDecimalIntegerLiteral)
e0e355c Merge pull request #407 from fastfloat/javascript-format
4fcb7e3 Fix clang-format 17 on FASTFLOAT_ASSERT macros
f837a78 Add chars_format::javascript (ECMAScript DecimalLiteral)
a8a02f7 Merge pull request #405 from fastfloat/old-style-cast
12e310a Avoid old-style casts
13ecd70 Merge pull request #399 from dg0yt/max
a1f63a8 Merge pull request #404 from latent-9/docs/fix-strtod-typo
37fb7d7 docs: fix strtod function name in README
c335514 Fix compat with min() macro
ec239e0 Fix compat with max() macro
f6df0f2 Merge pull request #398 from redis-performance/exp062-063-combo
11c390b Merge pull request #396 from fastfloat/dependabot/github_actions/github-actions-640176b5ab
1fa146e Bump actions/checkout in the github-actions group across 1 directory
ce25f0d Remove Stars section from README
46b2fba Reconcile redis-perf/optim: content superseded by upstream #381/#382/#387
5082489 EXP-063: test the mode-independent mantissa bound before the rounds_to_nearest probe
f4f36e0 EXP-062: enable the 4-digit SWAR fraction follow-up on all compilers (drop __clang__ gate)
8ec5d23 Merge pull request #395 from sahvx655-wq/is-space-signed-compare
c539b53 guard is_space against negative signed code units
3ff2c0b EXP-053: clang-format (reflow comment + expression wrap; no semantic change)
a30c1f3 EXP-053: 4-digit SWAR follow-up in loop_parse_if_eight_digits, GCC path (ffc EXP-001)
ee84946 EXP-052: 2x unroll of char loop_parse_if_eight_digits (ported from ffc EXP-044)
8db9edb EXP-050: straight-line nested-if integer-part scan (ported from ffc EXP-026/028)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../fastfloat/{fastfloat_8.2.10.bb => fastfloat_8.3.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.10.bb => fastfloat_8.3.0.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
index 3a5635bdebf..a041f329883 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "34164f547b7df3f5d794ff67e9f885c36819ebfc"
+SRCREV = "b0ab987b3dfdde13fa1915f65ef2a5c068d9208c"
 
 inherit cmake

