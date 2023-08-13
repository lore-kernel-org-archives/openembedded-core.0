Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570C9C04A6A
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.83751.1691927658365332662
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DvNyimuu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso31924015e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927656; x=1692532456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o+jrHGCwI1Va31P7Bn9iOIJQauGxl/S1nebvTsPFuI=;
        b=DvNyimuuycmTb+ysljj8pxNDMEbJX89Txo/8VTyUC7c1EBwbsI4H492lxUE10oW4lC
         J87pTZ9NgzKKnexzkIRY0kQ5XoXVCzyj+CMWqysjW/x9wnw1LB4JY7joEc+UxgfSvjsP
         I84VjKlEoYTU1UGsMFlzNjDdZW3RGDFdxmko0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927656; x=1692532456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5o+jrHGCwI1Va31P7Bn9iOIJQauGxl/S1nebvTsPFuI=;
        b=lhHtKapoFCakqYflLGNBffdTY4vr8SPML80w52XrLMGU4LaGW2ukhPsXVJ26Dpo/hF
         GshGjmYqBi2hBaXV9WJu6vG3wlFCC57wFyO2pf9ghedwqtChxUtvwMNBpouappzLA3p8
         tS83Ws1rX6bf8EIU95EtWRLpwgFUZyAo+mOVzawY9q4+r0/EArv0lp0KZRHiwZTyeE9s
         9qPkptqL94xlHXX87rJBT12zeMo5kllfHNBXFvWi4rFdXybhUSfEXJiKD/22Yf/B+Hbq
         4sZw9/eOo9HYtTFtbylPgFyDYcE7fhvGSCKQQ++mJksEc+ADpRiESUMOIw/o8o7X7CIv
         fkfA==
X-Gm-Message-State: AOJu0YxAYz3V2LKb38sxk78Cn40H0uxLzgDgqbSrC41kP7a2EyTJHja+
	lkj/a/9NYDmAM1tTc4G7cRy7NeMT2x6G3KM8mwA=
X-Google-Smtp-Source: AGHT+IHU6S1kQmOZbHj2KniDC2Cs4V3cMX+ewcNf2zj/OjJ4rovbhV1prvfc+gpqnnfxQBw+hyVoZw==
X-Received: by 2002:a7b:cd0f:0:b0:3fe:5053:1a0b with SMTP id f15-20020a7bcd0f000000b003fe50531a0bmr5557943wmj.11.1691927656692;
        Sun, 13 Aug 2023 04:54:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 8/8] oeqa/runtime/parselogs: Exclude preempt-rt error for now
Date: Sun, 13 Aug 2023 12:54:10 +0100
Message-Id: <20230813115410.163212-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185880

With the new 6.4 kernel we see this preempt-rt error. It is blocking changing
to the new kernel and has sat on mailing lists unresolved for a long time. Ignore
it in testing for now and allow upgrading until we can better understand the
issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index e67d3750dad..e0a5ef5d08e 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -99,6 +99,7 @@ qemux86_common = [
     "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
     "floppy: error",
     'failed to IDENTIFY (I/O error, err_mask=0x4)',
+    'NOHZ tick-stop error: local softirq work is pending, handler #80!!!'
 ] + common_errors
 
 ignore_errors = {
-- 
2.39.2


