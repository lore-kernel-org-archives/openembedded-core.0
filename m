Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014FDE77186
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.3945.1733864205678554350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uCsRUVJ8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea9739647bso4448433a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864205; x=1734469005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+L+o5R+WzOhmMwOLidCY80pFVQEYtsamxVDTCHke8Q=;
        b=uCsRUVJ8Q6BmUAS14eBri9dug18+iE9xo1w8CkHq8tPNz9iSF2vTDedLCduEkq89/c
         8GNLsrPteHM9YzkN1YN6Y6ebQbhsXPXX0HPz9m/MKMn02IhJ/Fp+SAV3TwMmdTFHgi1z
         ZoAJQlAGI7SE7kIG03MVOGJjc1Nt55GOdQ5G//O+N/LuIZ0TOtIqKu2yBYlqUAvxn41q
         f+pn6Saehy6WgBO1yq3JLlwUC8UOQ5XiRMik6CpQ4MQzQkNSiUMCjhUwRTdiWnJItemu
         nPfr8Q+r5w4AMEbdNOgxnh82CZFZTlMkBEcF1dJFqDFDV+a0CGIIUjxr136Bea1gfHbg
         k31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864205; x=1734469005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+L+o5R+WzOhmMwOLidCY80pFVQEYtsamxVDTCHke8Q=;
        b=gNE2w6WTQK/2MCM2Jo67vp0BK6AGBu5W7Dv0NS0EaGtDBdca36pLxMgna3rNpJ4yk7
         lJhkbvvK5LCaf12fHhthV8aoHN3OPCXawvJnGoKMQPs7a52FwNvzN0RKn7htm+iiXnkm
         Ppjs4VQ69dL/OVy//Ha7SHVbzLqa32iKPCMlWUddxuYNNmAR+3LvjHUhen9Ghl3mPQOj
         bJpkMYfTTXmFrqiFilZ1Qiee4aeSuoE7SjO8Hs4pEby+ik7HbV2gY4150HSbBZ0Z/o9p
         UMrD20pGwE+2WvOYYJ1fNUdM0HMERrAbVZY/4S1vegItB4WSWSTZY+nbW3xPxSzIAda3
         +Nqw==
X-Gm-Message-State: AOJu0YwWF3bDlgGq3tjTeRJNKiO8MOZLaX85PAIyR11/xLhFYsERbFX4
	GBsjkFkYth7C6OXf7ufY6WjQiFOXYeA62lYZr5Bc54Tjurqf8dQs4QQDeNyIK4au74RrFhvumXD
	G
X-Gm-Gg: ASbGncsMWAQkOuiq8UTL/SirhyKltxurasVwEvt3OJvZ6mTotL4SOoET453Jz2rEDQd
	zBde0utYLDgI37jzKvygWhwINCNn+ZTys2snNpKdvYOL0ktTMTfdFBeJwV5aYySixz9sZJ64UZy
	GC+bEIrnt9M6jTuTFDvdHasH565JYkXI4PQxrqkpvBpDV3q5CRbrrhaZW4+2X9i1EigcwtqQM0z
	VKNyZDDiyIU66u5khXBIojxGbl1iSV8BwF9FzqbyDc=
X-Google-Smtp-Source: AGHT+IFUIciwZ4/SUs+hzeGtXQx0dhR8zI42IHvZsCRzomDrrhxYM6SJeV6qEnTAVXjRNj+VOnu/ig==
X-Received: by 2002:a17:90b:1c05:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-2f127f7e124mr660478a91.5.1733864204866;
        Tue, 10 Dec 2024 12:56:44 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/12] qemu: set CVE-2024-6505 to fixed
Date: Tue, 10 Dec 2024 12:56:22 -0800
Message-Id: <33050bf82add43409675122a8f29acbcda4e8439.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208549

From: Peter Marko <peter.marko@siemens.com>

CVE patch was removed on last upgrade as fixing commit was backported to
stable 8.2.x branch.

NVD DB has this CVE as version-less (with "-").
So explicit status set is needed to mark it as fixed.

(From OE-Core rev: 64359ec3b60ae68d39c2e6444f903fd20e397cff)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 40ee267a42..4dc6c104c7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -78,6 +78,9 @@ CVE_STATUS[CVE-2023-6683] = "cpe-incorrect: Applies only against version 8.2.1 a
 
 CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
+# NVD DB has this CVE as version-less (with "-")
+CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


