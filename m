Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123C3CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8324.1782310631984445762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=syIZKnSd;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69e1f777bcaso944259eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310631; x=1782915431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++NZ7kP5+FKwUt7mt/GFaoHNn/3GJp5DT7XWKOlW0d4=;
        b=syIZKnSdgQ8671gFOn8Iza4HaFWk8fAI5IZ6HqEJqxB3VOuAq/HbzoLD/rYWCP2A1H
         nFtWFrIj1cPUg3ZHYxDwrN5CVoYy8Bm3l8yH25j8GCnoMtoJrqR8hPL42Zd32V8NhjzG
         6tTZCXGnyA2ZhgKoBwzvdtITmybaZ5wk7oyML49RHEuzNegTAA8GeMPhRR7muxRrZv3I
         qnRbrjCzc9Wq8t97gXKAOOH6KAIveaIuLeuhUzpLtdV7RaLYmxoV1OAvUlx0kWBSNHd4
         9s4wudy2PAkuXIOT1Uzi4+cC5CJkGEtjfs0SWPtg3nHThQmZM0H9eU5hdTmqP6joZYiZ
         /bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310631; x=1782915431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++NZ7kP5+FKwUt7mt/GFaoHNn/3GJp5DT7XWKOlW0d4=;
        b=BjH02UtvbE+8y64vVLs4cKvHSm+EBaLMugsNa9cazlgS5VmGdIaHR5i1ThjgcN5Ljp
         aSCV3cvqr6Rb7j+QWj+0XW1ti42LzwOnbkyMRUm0Y17M4JqDXHade01hpbNNyDvmQq1p
         FbQF2r1DZfeUNWO3TCEYOUaKSkuXp8om9a9gupCGVtr7b8Hg9hGigZTo70lKZ0d0sx0B
         NRqy7rYB+4ypm2amkL5Ori/ESdCWbDeE/quB9ucCKQgJRMItcSW7J1ybiJeF1OO4enIn
         MNb5vjYc/ZjwglIF4OnqDEnMueIH6ZyMpYy8uNgKLT66Wbs41zNYqzpkhgxTeDRBioHU
         kDcA==
X-Gm-Message-State: AOJu0YzXQXjxE0d2DAEcLG3d0+nhllQC1zPZP7Ou0QJ1+YnI07sSeCZG
	pMVJVDohVEaSzAVqzNrQlumGlNx7SfaLBLrDKSgb4/pvJ/kflhO25L9b0Ix/NA==
X-Gm-Gg: AfdE7clS9Mypb4Fi9xOXKMhjJ+POZ26gaSCBAA2jBR5FhgEyObOnNNxWqELilSkD98U
	g4+ahIKIYODMdtfxSb+Uw0ikFVJUR7dBDrFOIWAqkxZg/+B7wz+jgWLWIwLteKbSpoEXyfxT2th
	ryyuCnlkGqUtXhhuUqhCNTLtXyVQqBZjI7PbZsIDDYCpYtmfjptkG7Cvri0nce3erB9Sr5HEXrU
	JOAY+z9zd3glwqVMYwMn7Em3rDsENm50bqNm0GXZI2hb3G8g8y+kR7Q+ilDOAlpoibg1K3fmqQ0
	ABK69HTuEs2amH6zGV7bm/hZ/q9XuamR+jvDYB+o35TBZR1QoYxSsmXf+vW9+z5qvzSKH4u9Ekb
	wzimM7eEcJxPd5Y28E8LxazRntUJbKpZijU3Ca0Fr2ZjqHQjLLcGgJnRnaE4fRrvDLRomjR8JG3
	42456BQReT2AYSdeMBjrOu
X-Received: by 2002:a05:6820:2d02:b0:69e:390e:b98b with SMTP id 006d021491bc7-6a12d7893aemr299516eaf.1.1782310630811;
        Wed, 24 Jun 2026 07:17:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 1/8] spdx: Skip dependencies that are not in the taskhash
Date: Wed, 24 Jun 2026 08:15:18 -0600
Message-ID: <20260624141706.2164567-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239510

If a dependency is not in the taskhash, it cannot be included in the
SPDX data because the dependency may not trigger the recipe to rebuild
if it changes (although aliases help with this), but more importantly
bitbake may not restore the sstate object associated with the dependency
which causes errors when constructing the final SBoM

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 72d17aade6..fc78586cf2 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -330,13 +330,14 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
             d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
-        # If the dependency is part of the taskhash, return it to be linked
-        # against. Otherwise, it cannot be linked against because this recipe
-        # will not rebuilt if dependency changes
-        if dep.in_taskhash:
-            dep_objsets.append(dep_objset)
+        # If the dependency is not part of the task hash, do not include it
+        # since the dependency may not be present in subsequent runs, and may
+        # not rebuild if it changes
+        if not dep.in_taskhash:
+            bb.debug(1, f"Skipping dependency {dep.pn} (not in taskhash)")
+            continue
 
-        # The object _can_ be linked against (by alias)
+        dep_objsets.append(dep_objset)
         dep_objs.add(dep_obj)
 
     return dep_objsets, dep_objs
-- 
2.54.0


