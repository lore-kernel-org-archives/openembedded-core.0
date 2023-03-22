Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21137C761AF
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:24 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.44020.1679494935536657144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5wjxsdgJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so19834563pjp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDuCOp/iGFDu2TrgS6dFtpNKtYJnpKsoSA1NX8fwoWc=;
        b=5wjxsdgJQup95omJnilSfmp8BmDsnw5euejIOf8bjS4gkpNY8+7u+IBJr7Taj2Q4rF
         ASAR7WXB/o/xvOlaT39hZJNjIrGmXGah1QzJdi2pkzA1MkptH0DMLZ3KVQgfHDCvRrFX
         WwsCxRKLhavm/cRpE5bJggEKY75gwjnrONJgLCd91vWdc4qVSiVxahJWCpFIEV4wbBk0
         4KvhAyJPQh0dHKgr0Pv1OgtNC7Jku1dHaAUvIU3Do5sRqtTFUPZbDcWG21NpjhPEbTe5
         Xg3afYFmKJJHYrKce0JUrpy4WyuKanpKZrBoYIHo3z+2K7TPmduo30jUzgcBJ2oY+4q0
         ieSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDuCOp/iGFDu2TrgS6dFtpNKtYJnpKsoSA1NX8fwoWc=;
        b=1sqLAQQa1Ca/QkHeNT42RNAvbySd3oQd0eUNX+nCBbFKW0SRx9ueNL6jehBTDt4sFY
         AvQBlccYB0jBDT6zvqWKO7nzPjD8BYnvQNKZSUR+tPqajAQ+KVXwrrzmyDwh6XN6kFtT
         5VAyqJl5rGe3uQN3sUxs4el+1W6o0JreQLwVRrn0tb707sjcDw6X+YurIosZ7B0NuToB
         g8L/NgILoTM1/4LPRtYNXu8VqCi5123D8Ga3kRDMef8X5KlNuU6dQDbUxkqvFihC3IOx
         LMmRSW5RwnVQ8ku5r8G6df8mW4hR2c9rogn0TNMCfgisPY5OsjrApviFgrhj7JXegBbR
         9Gyw==
X-Gm-Message-State: AO0yUKVW4WKFo590JO2uMfuT/VeaH5mI28TWvB/UBlkxOot/uqC3FO9y
	g2t2Z3ee8zelBfgVPOk1JTOvXO4/VEX7CFys1Dw=
X-Google-Smtp-Source: AK7set/eB7vwGTvExkj6GbViG+GrAjcFwUdtD6YJYHoa0ox6YT/UN2qFQ/GqXCJ2bKIJJM4NvY0WSA==
X-Received: by 2002:a05:6a20:ba83:b0:db:6d41:d628 with SMTP id fb3-20020a056a20ba8300b000db6d41d628mr1993901pzb.22.1679494934709;
        Wed, 22 Mar 2023 07:22:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/21] pybootchart: Fix extents handling to account for cpu/io/mem pressure changes
Date: Wed, 22 Mar 2023 04:21:34 -1000
Message-Id: <abbeea66297cfaf77bca9550400be37b39486b57.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178940

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous addition of pressure values to the chart didn't fix the extents
function which meant the bottom of the chart was cut off. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc8cef69e717e08f80d10f775f0fffc644267b59)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/pybootchartgui/pybootchartgui/draw.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 4326361426..6d445aad4f 100644
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
2.34.1


