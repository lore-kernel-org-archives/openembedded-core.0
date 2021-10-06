Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF8EC4332F
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:55 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web08.5067.1633479175595761337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GHeJOKtE;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 138so749588qko.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvCgEtWVYNfOBE3A3LyrddrLyWEOEF6OcO2/i13rhbU=;
        b=GHeJOKtEPUZ+QIDAz7wk0qwxbzlEFFajEe3Mr7ZVU4DZZqqtDH9RVQQ3IKS5e+6hnz
         eG6Y0xsF+uRV+OZGKgGR/JRdsgqa2dcxu7BsU97cAT92KjkVra0pv+gGxuWz1gQDm50d
         LNn1WFLwaDm96kNUlB6AsXWMTChPMJvNs3eTX2ayHY+CpU6LA3Nb3ELi27exmgseQ3uJ
         OqQFkcIuQQgHrYLBjI9qO5qEOP23GmSPlFAmu640xWKYuGb/3f4uEFhSkqsV6nP7PtRs
         4ijsdmG5QOwa5xkJlX/qwKDfDO3luzpBWou1QNfmEZ2WrgKwZbelJfjLgbv1iYHlBoWk
         RiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvCgEtWVYNfOBE3A3LyrddrLyWEOEF6OcO2/i13rhbU=;
        b=7sRf5cj8LQ84flrnViGmLi9tn0Klh+d2xxjqnUYE3Q5cClKZM4cgio7ibimPmL8qOK
         rJ5lC1KPOVmOQU4SGg7+fO6XNmSOuQInJHfVdQuvcTrcN9X/RSh/0VWNO/iwvmTo+uX1
         tAQkT7Q60F05HZNYuvk7TnZQmMGLVN2NRRE7vsjRVITKBNM8SHYHR7BPzhmHqOhWi5aB
         wivtmVibqp0HEsYwsk/sA5HFdAGlcfAxbIzBUZO5Rkn3b4HANvgvbdt3OIyWrv9BOo0l
         uAgTLGwMXj/OrhIiRkrBOEYvbcMmnidQ9LTLJ31i3CClpFNMrdHzeDbSY76XsYgv6f7R
         eLqA==
X-Gm-Message-State: AOAM532vrZH+poUm5lIMb3pky0C+se4YpTtMCv2cunGl8T9DqHu5tJTo
	A5qKaluQpi5RNfmm9hEnwzSOk0wTVzn3YQ==
X-Google-Smtp-Source: 
 ABdhPJws5nFnzrfN/lrvwSb9sqxZJtsq4gO/f7U7essf16+BrWbmyDf1ocE8IfirqSbpzdRmvSrZtw==
X-Received: by 2002:a37:92c6:: with SMTP id
 u189mr17326451qkd.521.1633479174669;
        Tue, 05 Oct 2021 17:12:54 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] kernel-yocto: don't apply config metadata patches twice
Date: Tue,  5 Oct 2021 20:12:46 -0400
Message-Id: 
 <6bf351545a8bf21fff5c00ff1ed8978b475f05d4.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1633478971.git.bruce.ashfield@gmail.com>
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156667

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 549dfd97a4..1d5a8cdf29 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -36,7 +36,10 @@ def find_patches(d,subdir):
             if subdir == patchdir:
                 patch_list.append(local)
         else:
-            patch_list.append(local)
+            # skip the patch if a patchdir was supplied, it won't be handled
+            # properly
+            if not patchdir:
+                patch_list.append(local)
 
     return patch_list
 
-- 
2.19.1


