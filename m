Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F79FC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 09:50:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.40417.1656323398542786910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 02:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=asf8CQ8D;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id n1so12179809wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9GEdqUhiyjGQWnrea6C1hddFn6cRHwqvL0ilos497xg=;
        b=asf8CQ8DiwMaFJFy9j25HtyEG8Y0DmuKGYJGbGWjWdZc725L2w1Sdawora9Mti0esj
         MFogXbwU5EWEHhF7DDzxFDkwHbvj0UOoXCawtV3krMZAdAc7v6MRVd6QCm9uLjDCbDdN
         bLYKGEKRK3MrJUda5HzP80u1qNvrB/VWUsZRLygdhAIm1iUU9hskf1u1w37uuidMwH3+
         WG5WEinrJtcvpVb9FPowrJ1sk1zbjg14faYFxYCVDa6wCg2Q6jEemKWARM7gpNC1FxqC
         fES+1y593lpDXfbMzYloJ5lLmNGNiywT38DsPkxiVLx1aM5Ie/acIaXnwLEbmmqxtTHI
         z18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9GEdqUhiyjGQWnrea6C1hddFn6cRHwqvL0ilos497xg=;
        b=zcj2r/68AMoc0vLFas8ZRzdlVaO36QipnKar3Bfcx8X3XD0xwqZiLnQEpx/T9pOumm
         CVujEwxdkfGit2Sp39OTWQA52EuEDDVcQzPGQcQDtbmHug8W7KTFPBYQlgSJTz7u6R2o
         LBOIQ7d12sNy+5Fq/kodihYQ1V7G/i5AWPVN3nCFwvU1Y5GYju4fZFpOcGumXECWTLR8
         vvH7DNB/D4E7w6j2z3T97DEeeqYg435LemhxbeveblxyCL/PIT5z/8/Paw9VjG3WqB8A
         RuLn6DAJd0cry+6Qykusb51JgOS20JWk9HRQPrdY8XoXFs0EzZcZILWuj2nUoaafVi4K
         wtdQ==
X-Gm-Message-State: AJIora9HymVFzcSaKUxhwjIKt6sR1+fNB5mW2iTpvxLYAZpqweAgxyLZ
	b+kc5Y3f6VupuJFANhp9zkDQPTp3Qc+svd9D
X-Google-Smtp-Source: 
 AGRyM1tSuyaY5AnKtVLoqrlUlc4iTBQNl1IEN4xtAcA8ccw9xbS+fJZzgGMm9XxqnzOIRAeATKr7aw==
X-Received: by 2002:a5d:67cf:0:b0:21b:9fb8:e6d6 with SMTP id
 n15-20020a5d67cf000000b0021b9fb8e6d6mr11161536wrw.205.1656323396766;
        Mon, 27 Jun 2022 02:49:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b0039c7dbafa7asm17249081wms.19.2022.06.27.02.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:49:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] python3-hatch-vcs: fix upstream version check
Date: Mon, 27 Jun 2022 11:49:49 +0200
Message-Id: <20220627094951.1882744-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 09:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167314

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
index 100099c130..cca2c49d2b 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
@@ -10,3 +10,5 @@ PYPI_PACKAGE = "hatch_vcs"
 SRC_URI[sha256sum] = "9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce643c36d09ca908abff"
 
 BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = "/hatch-vcs/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.30.2


