Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA3FC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.22332.1638602010293051527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XndVvWjT;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t9so10513986wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=XndVvWjTUgwAq6Qg6RgUIlAbqd/zxCqfjfGt6SNwy3QYYR1/USjIzRzWPdIOEZ9ZBv
         We5sTbT97o8H+o+XckXm7dXZ7HoqD3OxJMNayc0h4/+gQn5ux8xWIxvkCSNtsR1Q8GY6
         hHpczEArBP3Wzg6HBL79L7Cxux2AJLUr7APjeqNtJ73l8kWvjwHU18p6z1n0VjnIwCfa
         cnuxJIvi4RNBfKzHWzbYcQmmRf+UaTKeAcojRKtVbnL97VygmnKjnVSamvOclCvxKSxz
         R3XaSzE/EyL+vsIOGfEEmjOs3+Vkdl3oXLWKp93buN/mez4kXV0ltkkqlddxkt6rHwlW
         akuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=PpFHK8A6EER3DbzkyiXsIvlfwlvBdQm1dKz1eHuh2ijvyy6phZtT0y4qRa+wtHzLME
         0YJO5gumbi+vREDz4Vwm3eDvKvh2MjGVAFAsFZezc3l9lDpkACa1vRNUJjDU/0ViChiZ
         AS3wgUtJxnSsoWnHCDDjUDGj0GJHs0tImbVATkfd9ShuPpThb7apxWWbnnCaKudrtsSl
         mfPyRsGTypEhKjLOUu6wekIuDxDimq0/JUvwnJAp1oBqjNMXN63bGHs7T+p5IKzVDrXb
         V14/beOZyGQWt3xNb0yEEmCSbIetHG88c6gAfeQgVOm+f2Dx6nlvGZ15idyO8rb684wY
         c77g==
X-Gm-Message-State: AOAM532n6OPNxK03hVcYFmbhPfG500U8GvBfbrkUmqjP2nbdzuyLbrgN
	cRcOkBRNt1X8G5KhZH+RyB1G/Xcu7LAprQ==
X-Google-Smtp-Source: 
 ABdhPJzIuhwJrnLdo9BdY5+RFVRgDi0zSBeXL5Mu4dIt/OyPghrkFEp/5CkW+EL5UB2/918broY9zQ==
X-Received: by 2002:a5d:52c2:: with SMTP id r2mr27620887wrv.548.1638602008486;
        Fri, 03 Dec 2021 23:13:28 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/26] insane.bbclass: do not hardcode oe-core path in
 upstream-status check
Date: Sat,  4 Dec 2021 08:12:58 +0100
Message-Id: <20211204071323.2480163-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159148

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


