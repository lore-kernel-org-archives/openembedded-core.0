Return-Path: <daniil.batalov.123@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11B5EEB584
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 10:03:21 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.44574.1726135399854259341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 03:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dPStL0I4;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: daniil.batalov.123@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f758f84dfbso7241301fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726135398; x=1726740198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SuIEVy3HKmTR7EG5AzTQEzxlsgtyKjBuFTCuB4kHrZY=;
        b=dPStL0I4YDOOILg75owfRiyV8z8qOraPOt7vOBpClgFz187aZ32ZhrLkR7xDlMSJsg
         lSHhfb4vWe7YnUTDqm+z21eri0zfPEYerrSztqhJzQmfgWbsGfhGeOIndCNxRh6DQJJN
         Kv6XPM27kCo2sbp/yWMDQOStts9PUtVnaBdL79OPf4qVLb5UtIIpxtyYx7R1W0NzeWB4
         QhkIvJ1TKnlVVsStpAiNkGJtfYsPvn5NvZdlqFmjnfqPRd3aTMa5EkjghC1IceCEp+Ia
         si2lVkvXgC6LqH2HXT0V2HEcs18yHhLjY0bg2m91NpWKASI8/ecXr1GwXPRMppH9U9CE
         NpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135398; x=1726740198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuIEVy3HKmTR7EG5AzTQEzxlsgtyKjBuFTCuB4kHrZY=;
        b=VoDmB+WPic9PL/qw3bIfdBfBE/w5gBPMi4I73w2PbfUwj79qZqalTsXZWmmq4aMni4
         lTCpduEfvQnJkR8LY3u3hHzET82Gc4mKVn7nFoIolnPXHjned3pID0u9YhJrHI6xXeR2
         OdfKGVNG5d21cxhYkd7PpNxSjV6VNyXrj8Lrc9UrrcNC9o3OON7SLSTd+FiPzOmXU9Ip
         uhNV1EPkvEYjdF3T+H/kQsCvptKUxba756HImOn4sMV9wIpXJHj5ba3oZMun03tL115L
         X2xyG3Ystfjl/cIHCrX2Bd0190YBopUPtIbfEuuLO3Ajn1tcrU6ImrED/lSwSPP4fVek
         kQfA==
X-Gm-Message-State: AOJu0YxaXO000IAg5S+KKBHNy4R3cn8k6E8Pmv/TXbLBhgOtK7AkXd1A
	yd3UKuPGSOSxOGTHqbPKjcboVRWN9torVvzz3FSk/KVK/Mn8oNAM+fxz6+ZRmptkgw==
X-Google-Smtp-Source: AGHT+IGxmesrj9vkM/gby8gBh0QsfdhKp4CjSM7tLhYZCywWq8m+Cg4ZQsB2Z4D+EvTlm6VXvLKnhg==
X-Received: by 2002:a05:6512:3b0a:b0:533:44e8:5565 with SMTP id 2adb3069b0e04-53678feb143mr1298194e87.46.1726135397194;
        Thu, 12 Sep 2024 03:03:17 -0700 (PDT)
Received: from daniil-HP-295-G8-Microtower-PC.deltard.local ([84.22.156.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870b93sm1881829e87.101.2024.09.12.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 03:03:15 -0700 (PDT)
From: Daniil Batalov <daniil.batalov.123@gmail.com>
X-Google-Original-From: Daniil Batalov <dbatalov@deltard.ru>
To: openembedded-core@lists.openembedded.org
Cc: Daniil Batalov <dbatalov@deltard.ru>
Subject: [PATCH v2] spdx30_tasks.py: fix typo in call of is_file method
Date: Thu, 12 Sep 2024 17:03:09 +0700
Message-Id: <20240912100309.2158525-1-dbatalov@deltard.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204440

Method is_file() was wrongly called as isfile()

Signed-off-by: Daniil Batalov <dbatalov@deltard.ru>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 4da52da654..6a2858c665 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -239,7 +239,7 @@ def get_package_sources_from_debug(
                         continue
                 else:
                     # We can only hash files below, skip directories, links, etc.
-                    if not debugsrc_path.isfile():
+                    if not debugsrc_path.is_file():
                         source_hash_cache[debugsrc_path] = None
                         continue
 
-- 
2.40.1


