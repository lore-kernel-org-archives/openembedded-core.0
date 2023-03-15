Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1CDC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:43:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9946.1678891430244012063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HAE0rWyo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id o7so8161098wrg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678891428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXLyUi4NWeDVraGc3/EQB278RYYArEcuz6Tan9FXksc=;
        b=HAE0rWyo50j5DW21bQErYXcI92mrnG2bbKcMksqfUS2WVPZ9p5c9ujt0/vAEZtCNb0
         6wGE7bwuTvtt3o1Ak/cXAiife+XL8eMHGMjQWpXicdFIgSyohutkB546vY/07Fe6+2PJ
         i9zhalk10Y34c2KHoqYbEG+WUaGamCX1l7dFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678891428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXLyUi4NWeDVraGc3/EQB278RYYArEcuz6Tan9FXksc=;
        b=IBzDzO9Lr/I2nKI4kD2I08ai+NJeYVIpHmyp25dJfBFx5m/EmMWR1ABtrrL/EoYtjh
         AnMwTQahfpgY7cDTeMM34CG3i5vEsN3tO5o4DEryPFGfmXf7GH8gX1OW3fVtimMleR5h
         6wjvtXF/ajhJxZMw51nYFvzbjToqLVYaFqcR6m4SnkN0K1stbIxW48hxtlKmkFB5AZnM
         Egw0q8NQ73jr9UEaSt9xtaPtiK0Iy1VfrosItipLd/MHrgM8gw7KNRraQKGSUtlBWxkD
         pek9d+2zpOSghSmdStAvc9HPGZo7ozUcCksSKSHcPBuUtabzssj+Q23qnOas2OgDwrk9
         EwLA==
X-Gm-Message-State: AO0yUKVYj9sUHTIWqZaKt6LF+1iNJzt+Cz9srzz5duNZJE0/XpUdjtAL
	+NJI0Tp724s21VciDPQKXeKuy4iR3hC8CN1+ccM=
X-Google-Smtp-Source: AK7set8RezL+YOUTO7CxJsLO/A9D6lLbk/uAKnKuzJl6up/Jc5Deld8Zz3HRfiGVOPxH0v5+yb3DHw==
X-Received: by 2002:adf:e94c:0:b0:2cf:efd7:2f1d with SMTP id m12-20020adfe94c000000b002cfefd72f1dmr2016645wrn.13.1678891428503;
        Wed, 15 Mar 2023 07:43:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ec68:35fb:ce4:5d63])
        by smtp.gmail.com with ESMTPSA id z4-20020adff744000000b002c55de1c72bsm4925583wrp.62.2023.03.15.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:43:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [PATCH] pybootchart: Fix extents handling to account for cpu/io/mem pressure changes
Date: Wed, 15 Mar 2023 14:43:47 +0000
Message-Id: <20230315144347.4125824-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178578

The previous addition of pressure values to the chart didn't fix the extents
function which meant the bottom of the chart was cut off. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 43263614263..6d445aad4f4 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -356,6 +356,12 @@ def extents(options, xscale, trace):
             h += 30 + bar_h
         if trace.disk_stats:
             h += 30 + bar_h
+        if trace.cpu_pressure:
+            h += 30 + bar_h
+        if trace.io_pressure:
+            h += 30 + bar_h
+        if trace.mem_pressure:
+            h += 30 + bar_h
         if trace.monitor_disk:
             h += 30 + bar_h
         if trace.mem_stats:
-- 
2.38.1


