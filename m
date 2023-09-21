Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA965E7D0A7
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 20:24:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6308.1695327844302153797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 13:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FC1+Cz6u;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso11702855ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695327843; x=1695932643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfHrZNKD87gVldD0lYK0vbhM3euiHXQMxKBlMKpXU0M=;
        b=FC1+Cz6uyOaWCNKiHI6iPapt36xmTpBkiVvX5byX/Lf0U41l3PThOFZdvPpaXNj1Cm
         opj4ZWFqfPSOinDMyEES/FdWxCVMk32KNvqH/1qHoXD126Lw1jLQwOzwgEb5QHROuqFL
         HbYLA8GL9xaHWULreMgcz7cDBbORqCMlx8dvaGT67g2FEPbiqj/8kUMRr8ZgGDUMWwLh
         J+yroxea/YzIS3v0EB9Zj1fY6x6z3pVkkGFIs6E1L3FCs2m5UH7fGRIVIc3ntlsDvFXn
         aBEro3Ho/Hn/1ow52IoXL0zNFR9f3+dY2LOV8CcD3MhRQ4g90KgO6ssOkwnAKRLwysT3
         sSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695327843; x=1695932643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfHrZNKD87gVldD0lYK0vbhM3euiHXQMxKBlMKpXU0M=;
        b=TKSBQPt8a9sX1GWuntE6Ksc+zWWU2PsJqu9j40qx7QM9C7IhXy9xuy5LQ0arU3m0Tc
         UK0VoaGEDZLKLzGuSwh2ZSkHHl1redIqMtsUtwrcSA0CF7oMWdDRquyoSG+pEJtaou2E
         cctdEhMHpHjX56An38i4u7UwpPmvQwai61aO+ArMdIyWj6+U4y9GL3OSalaZSNjzonq9
         BdX9fKP5J7cInESa6jLKWfrGIn4VH9ZBdcC+3TfsTbajBytYX3OA1CjkQYmG2oHknQz4
         C/+agygio6YpTEbUaJrLEU7hWLTl9vXFayIngqqXo3pKQ5H8f/3MX5/a3OQL+RH09nB8
         YaZg==
X-Gm-Message-State: AOJu0YwCyqc+cWpT5cks9kdO30WrAnYLvGNDtNf+S7SvBs3SeTqiKd7B
	3mSmHngTn4apWqhV2kUvST6CTtfyfONG/A==
X-Google-Smtp-Source: AGHT+IGqzfrgLtfW86/D4tYwZYrVsvCh6cY84Gr6vtVuCFMmCF0SU3hEpKrqJaY5N3sL5ntU4SuxGA==
X-Received: by 2002:a17:902:e54c:b0:1c3:dad8:bb99 with SMTP id n12-20020a170902e54c00b001c3dad8bb99mr7026982plf.64.1695327843352;
        Thu, 21 Sep 2023 13:24:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902d18100b001c3f7fd1ef7sm1963549plb.12.2023.09.21.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 13:24:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest
Date: Thu, 21 Sep 2023 13:24:00 -0700
Message-ID: <20230921202400.2328029-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 20:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188022

Brings following bug fixes

* 79bdacff glob: fix wrong return code when aborting before any matches
* 7291c6c6 statvfs: allocate spare for f_type
* 39e43f08 math: fix ld80 powl(x,huge) and powl(LDBL_MAX,small)
* 6d101027 math: fix ld80 acoshl(x) for x < 0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4a4fe978f93..dbc31e1d83b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
+SRCREV = "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
 
 BASEVER = "1.2.4"
 
-- 
2.42.0


