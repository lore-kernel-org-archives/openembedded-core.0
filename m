Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E17C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 18:09:22 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.547.1645812560910052456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QOFQU7cP;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so5563722pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FaLgaZEgGnfODtYr9d4Zl1meAzLatdJtuWHmpcZB1w8=;
        b=QOFQU7cPxIot1IUffzaCSUEegHw+lrBjVlbROQ0zOjALwPua0qpAelBpbQRvz3XWSO
         TQiQlkEVlMi1uEL2ZoOYvQpC6gM7wA/BJVHg9bzrEd6k3Xd2slb/ClH04GQNpE2d697b
         OUkTHPfLLCLz2hpHF4HP/9hrsnK4e3gpt9I6vo5bPwOtFQpu7RQTE2clcj5ObOWu5X6J
         5tT4e4RQD8eBouSqrfyXPBTIjFvqoBHgat4cJdwnnoLMBuJQQTvUW7ij/GCWxQZiN00P
         C7e5misZLPT6m72BDkvTXGz9TVqICqxKHcvx46f5yhP9qZ7By4SqN75q32cKpPORJKOQ
         ubiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FaLgaZEgGnfODtYr9d4Zl1meAzLatdJtuWHmpcZB1w8=;
        b=A1fajSfPdkwle2GWca/jOSt6m3rezyFwa4lhyTVBVuqy2osB320AZmvw77gSug7o05
         3lE+vJUViTT5478dMOQ/AGY5ikUr7vlAYP1RG2qoC8CLBJSRmefcsEvlPI6ZHgkqRL8T
         ae0qQDTCTH+1psxOFdl+x8GZrQgM7fCo9SIJkkT6Yvva9We1wfi4jwIzDXEr/6/J7d+0
         TWp5UblxKJ7EOljEVqlOAD+JZhQqCgtAutC167lIHWcNycmLehw5BlzgLilnHQPVB+pP
         t7Hu1SDU3PMCibDrGNXQaG9wdi9lO703Fbcgq7BOr+4OmGKhuqv6CVUHMK6v4axZuMu/
         OGnA==
X-Gm-Message-State: AOAM532liyy2uDsInOP7cQAobWDzT1YtwNruVZPtq0JtyjBkw1RJm8c0
	wVOT5zZ7xsw2HGb4HhFLqq+8iK4EZz6KVA==
X-Google-Smtp-Source: 
 ABdhPJwxRBRqpGZa3VuT2QFi0xryS8vKiLA6BsisLsPZO4k+hn/vNDeam0bFDkiOF9pJTgw9lJdhrQ==
X-Received: by 2002:a17:902:be10:b0:14d:66b5:7065 with SMTP id
 r16-20020a170902be1000b0014d66b57065mr8283756pls.81.1645812560009;
        Fri, 25 Feb 2022 10:09:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 a15-20020a637f0f000000b00372e075b2efsm3143210pgd.30.2022.02.25.10.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 10:09:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Fri, 25 Feb 2022 10:09:17 -0800
Message-Id: <20220225180917.491175-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 18:09:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162408

brings in these fixes

  * f8bdc304 fix spurious failures by fgetws when buffer ends with partial character
  * 5690668a add missing strerror text for key management
  * 3b7b4155 fix out-of-bound read processing time zone data with distant-past dates
  * 75b3412f fix potentially wrong-sign zero in cproj functions at infinity
  * 52f0deb9 make fseek detect and produce an error for invalid whence arguments
  * cbacd638 add SEEK_DATA and SEEK_HOLE to unistd.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 1e33ad5317b..04752f40c45 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "c4d4028dde90562f631edf559fbc42d8ec1b29de"
+SRCREV = "f8bdc3048216f41eaaf655524fa286cfb1184a70"
 
 BASEVER = "1.2.2"
 
-- 
2.35.1


