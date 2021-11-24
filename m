Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADCEC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 09:25:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.4015.1637745925716288554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 01:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ghj10NXo;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso4767876wml.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 01:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=ghj10NXodxk8Mn+1EH61JmK3Pcwaigbw6pmG9gHmvDdTR6KkFQvevp53uusiJgYRO8
         LyZZVXaBnZjOjviwBw4yPmBrhAstu/OGC/T7vzHa53g1ruLqSDxJ/4W78CqOvk/wgqRn
         E5Mdmf1x+qTlZr+Y5xkd9qs5WqE2f5BZGHLIfmhPrqk4/hT6PyZB53GjDMeoBQwZd4UA
         17+gr29fMZrLfH/lKkZfXGTyQAhhgNEgNqWMk3BkNB90fNAflG/rNw7W2b6ByVQA7xw+
         y8HOTY0W5oTxsDOBwwXY4OicXk8uo4wPwQtQGdNs/+lPu6GzVdj6lFfmFUAQyPmsGCPr
         XpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=zeWV8LTXonbTe9iNUVJulkGh3pzdHdPXGAWSOzZm1pfGpClNOj7BCqq0EuANTFosQV
         6gQBB2eUMxdpS4Odvh9yedlPOvcEQ/qumSvHA3y/eC/0Ch/3CILkxUiRG8nrdn71F6x7
         d9W2HDcmIa412K1Iexrv7ZGE7AKiXQLj/X5ZwTV2raQY2vKx5kbUgKn76haiZgkf8Q64
         qKwvXmTJ7sGrOAOUMiM9Cydm35ECYOaZ2yMpl8nAqDhqwpwvv0xwcCuYZg+X8SSU0H+j
         sss17B47eIQtfSWJYu16YyWI61ijlvtalTp1FL2jfBJ5QdDttUCEpDeHUpXf+o2DCZno
         MBtw==
X-Gm-Message-State: AOAM533/wPGB5gm9JVRuw42rUU+2VCwbPUA3/juvHSPVfYNGXGjfZkp4
	x0eaAVnGH4My9eiRL8YYCc+TH1Nmmps7+A==
X-Google-Smtp-Source: 
 ABdhPJy8kPl4kIMO9Aq+TVjwxjZhpLL7Kv89gik+RvOLQTPOr+B3lljtvw4vM6MluDdcgZkIkf7LxQ==
X-Received: by 2002:a05:600c:1e27:: with SMTP id
 ay39mr13197065wmb.84.1637745924056;
        Wed, 24 Nov 2021 01:25:24 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id f7sm4934748wmg.6.2021.11.24.01.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 01:25:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] insane.bbclass: do not hardcode oe-core path in
 upstream-status check
Date: Wed, 24 Nov 2021 10:25:21 +0100
Message-Id: <20211124092521.1077244-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 09:25:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158682

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..8a47da5a09 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1176,7 +1176,9 @@ python do_qa_patch() {
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
+       match_oecore = oecore_re.search(fullpath)
+       if not match_oecore:
            continue
 
        content = open(fullpath, encoding='utf-8', errors='ignore').read()
-- 
2.20.1


