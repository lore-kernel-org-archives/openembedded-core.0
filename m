Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45416C83F27
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.40208.1752720963446372091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xk81fj8N;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-313154270bbso541892a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720963; x=1753325763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beAT1wtkQi5YYXqYehixsdsjH4VwJ8T+F14kNlFsA9Q=;
        b=Xk81fj8NI/WysGrN+CNa9MVNIbbAXEgRlKvDHhWjuowiSLHmyJTifa30N1RbH4Pw/j
         Hugd1s5CLLgsTcbrNNUWGMys/k3uyyNpFr1/zWe2sRu05WunruMujWkFERduiMSBcvTj
         7f1p/ukHs8Q9DIaz1QoBH31R9uHGHQu5rU5nxgn2DxMnYnXsyfbtmd6zcxTM/vXXGIlg
         YHxv0EaJSrhKlpcDhKuTLee4QZxxYXziqON3zApA7yh+mtdFDUKGIwP4JG444NTIya4m
         ASUKrXiQrK8eNvjQr3c5SQ+pX+q9Kp47IfkSEeDel57cwS+udYeJNlSBW6zhIjihtlRx
         LHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720963; x=1753325763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beAT1wtkQi5YYXqYehixsdsjH4VwJ8T+F14kNlFsA9Q=;
        b=mJytWva/Ky1HCJkeigqdGVXyzLPHlBdY/LcqvEgHq61nQeA3VliOwZ5s1OtNsbbgeo
         6Arfu3rHcmgq3KDyxeOmN2IIi6Qsg8ilBkov0V1L+AoGSjz48fxvPHW2zK43Pha0DocF
         COeXNKsw0aLuJ6cgNOthCh1HW0zDn9OdvvqeHQfEMArT8Ewpud60Qn8akicHPx9VJEIZ
         t9OEZNVLPug19M1Ct31rs8hXJDOMs6up0BsRo3kvY+HtEs7agxG1tcit3zdbqI1GAU6W
         qdvrB5BKghPIlGIDUd+wZk69oV1Wyt5T4QohKAOm5x9aHjAKwkqAMvDxnNwD3F1vA44C
         DtVw==
X-Gm-Message-State: AOJu0YzKPc9AaZR9j4PA9BlB6rlYh7iZTLb2HUDyo2uRHVD49LQtWbyA
	j8gH7de2FFO2hFsr/d1JkquAJkiAV0G6UA4TH9ySq/2PPa/6WBRJko8bPC0B1e6WeBGBpvZ9uih
	DnT9b
X-Gm-Gg: ASbGncuQGJyqnGkZsp4n+pL/tLDD0gADWW7NociLaSgOo2Q0VL4pJPRNDcovHLcZd55
	sw5ScTJNKxlOAHV47BYcpaogPNeB+NqTMfg8iMErqkfERcfBb072CQWuLJq96p2urgXXPeA9BG8
	C7Wi6rIgwZaKWRVNdCt74WfY6veRVvFwmHfhKoXjFAm57+22VqCZdVRVM+Ek0HYQiaO1r+EnkQg
	qtb9A9ChLgR1YmGWo/NW64K8ev7l9drYbMgg5Qvg0YcFpXAUIVKRs0H1Icp4Uzzq46ZUywUdUye
	2S2CbGddMpv9gCGuCbhSuzwCTz5V/LM6kqSUJ9do9/x43nMGkHR+3ctn1eqKoMaHUB8BQw7zJ1Y
	sXhKnFnPa4BzcYA==
X-Google-Smtp-Source: AGHT+IGTSwSWUhwL60sKv7Hj1I6s2esrryBvKSDtPr5t2tuAtZkJ88uAG6I5EbIlY5bDNiFqIN0oQQ==
X-Received: by 2002:a17:90b:4f49:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-31c9f45e26cmr6352172a91.22.1752720962599;
        Wed, 16 Jul 2025 19:56:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.56.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:56:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/13] kea: set correct permissions for /var/run/kea
Date: Wed, 16 Jul 2025 19:55:36 -0700
Message-ID: <acbed746f321e1a42df9035d2b6f1029f5a6a6a2.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220499

From: Yi Zhao <yi.zhao@eng.windriver.com>

Set the permissions of /var/run/kea to 750 to fix kea server startup
error:

ERROR [kea-dhcp4.dhcp4/445.140718820303936] DHCP4_INIT_FAIL failed to
initialize Kea server: configuration error using file
'/etc/kea/kea-dhcp4.conf': 'socket-name' is invalid: socket
path:/var/run/kea does not exist or does not have permssions = 750

This permission check was introduced by commit[1] in kea 2.6.3.

[1] https://gitlab.isc.org/isc-projects/kea/-/commit/43bba7799f6892f739b4745b35bbeacef3645ad3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp4.service     | 1 +
 meta/recipes-connectivity/kea/files/kea-dhcp6.service     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index f6059d73cb..aec6446f0e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index b851ea71c5..a2ed4edb59 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index 0f9f0ef8d9..ed6e017d0c 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -6,6 +6,7 @@ After=time-sync.target
 
 [Service]
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
 ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
-- 
2.43.0


