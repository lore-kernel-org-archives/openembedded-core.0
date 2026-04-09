Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064ECF364DA
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:18 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145066.1775776276781047440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DKhxIVzH;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so20789945e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776275; x=1776381075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=DKhxIVzHEMwxZdyewh44Nu3oWX0ZWXX1hS41g9u5+AttWNMv2XBYyyAnyjkgSekL5R
         JiTo7rlpXbroffAtezWlKnVbfmxhpd+7Z7Fetc11yboGV48e9vjLWwIvWdzD3uw8uY0/
         NaVPE1YzVJ1xYUR2A3iBeIW35fmjqZLMhkyXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776275; x=1776381075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZXJksZ6cDyZy+zz8rFNmc7ug59d92x1hFHDvQgME1M=;
        b=hw2vgylz4sici30nbLtpx7gZaBY2CFr1B/YDgiX5lm7+xQmeq13ePJDL4F4S7pWr2z
         F9/Aqmf5a/MDuz9RvZyMmN5kCUIos+WiB5dlnWwqsAosXJMq7XGdIB2NcyUhAZo2lTWb
         ivFQFWTNdyWab+H6qX+9m4jd9A+dBUXKuPB21FaesJGuZgxyaLOeISs1wqFwIonmgX5v
         n4CVOtHUazs35HpMq6mf9WBH2adjuU/Ii9anvT+ZPXRWGofae7olqRqFrZBgJHV26Ilq
         b5vkTubWtnIK/QFePv8kFvUiqkEJFA1JBh9yYmffDFS5aQ7tjdXcZp0Jdpv38TME8yRv
         Ugjg==
X-Gm-Message-State: AOJu0Yw8poGYfMnQpcUGjxS+O31TWYhEGpve7Al71Qot+v1JfnjDbq1c
	0P3qeMzM8oXCJgJsWv1/PGR7JmddmtPB1uqYA80+8szhfr6R1zShiiCsPNCO0WrjVpLqRhMj8sd
	5mb4/3/m9I9UT
X-Gm-Gg: AeBDiev60HVALzuTbFsQv80AiGf06taMudUuj6yuYSgjF9UPRxwi4v2NVFS0v2s94Jl
	j4EK2bCJWx5OcMsZXgRi8QaH5Qh4ff+eVOLJyvz9mO5F2o6/qWlJyaj9W732+BKzBo3lWiFBPMi
	LQSLeQuK808MvDFywUwnw3nSKcgaxURSY0aag26tAJEO+JDSjafUVRtahdlrbbQBOG6LoHMefOu
	K7darccDAZuEorkLE3mmhUad9+UETP5eGUVRVRk1OCDNrwjeqXrlE9uBaVYtMF/vc+J1HoNmMyd
	p3cI5UvaiiWK5f6jSJAl/Lsd7Kzqbp9NgBebQAEJudjt2GJpkH959ucX5xGPvZH9Vi7xuqpHoHw
	b4RbpFf9M3X5+CgLtG1Qf3JwhBnNgZBur75EK+jV91C9boeuofXcs0SbI0rRv4ObgBcynpugziI
	0fzjNpTg+35rSYbkMQsxybwIQ9s0vooKm5l0JlkzRMZkKa322BxLXQwMxqoA+/JUJi+A4hJz2OY
	i/9HkIWFaD+S6Wbtc4i+MA4bRv6
X-Received: by 2002:a05:600c:c0da:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488d685c12dmr6089925e9.19.1775776274966;
        Thu, 09 Apr 2026 16:11:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 04/30] README.OE-Core: update contributor links and add kirkstone prefix
Date: Fri, 10 Apr 2026 01:10:04 +0200
Message-ID: <2e04debcb02caa9121a8f933c59fd69666a44fd8.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234963

From: Fabien Thomas <fabien.thomas@smile.fr>

The current README points to an old Wiki page. Update this to the
Yocto documentation.

Additionally, add a helper command for git-send-email that includes
the 'kirkstone' subject prefix to ensure patches are correctly
identified by the maintainers and CI.

Suggested-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.OE-Core.md | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 2f2127fb03a..8a724dd6d0a 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -16,9 +16,13 @@ which can be found at:
 Contributing
 ------------
 
-Please refer to
-https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
-for guidelines on how to submit patches.
+Please refer to our contributor guide here: https://docs.yoctoproject.org/dev/contributor-guide/
+for full details on how to submit changes.
+
+As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
+The git command to do that would be:
+
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='kirkstone][PATCH'
 
 Mailing list:
 

