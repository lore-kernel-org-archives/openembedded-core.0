Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A08C54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 16:01:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.40402.1710086465314687166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 09:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eJLBDGOu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dd878da011so3446765ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710086464; x=1710691264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUvO7yqMuiBA/8o0UYyOwHDNyF5Z1AY3zHj6iBWF4Zk=;
        b=eJLBDGOuLvc7LccRUjmvhxjgYLrG1qnnOwF9/uRzBULbLvUxjZ7HkJl5Kcip8/bIXn
         ovZL2D9tEKKO2vu87Z+rutSs5E1o06B0FYnOLFZ1DhVzvvjbZfdslopu3wCX7UMX4bIG
         E/HR4ZUFvio0uZNE3I+sKFq+o2RDVQ3f9BChdwPmfvvZJMgfi17ZxHTbvbJdrMZdPxnb
         CJPtT6Mi+IUihuq1MPRr/ah3dW5tWtIFPuwN5bImaccu/4hQ1vqrFu4ae5dt7jECW9ix
         tJ8VnOdD2YhBH0h9kn39bjkRUYzuEQn6M/n9QNXOQI88bMZWwUAC8avifKYIbHQr0MGR
         g93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710086464; x=1710691264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUvO7yqMuiBA/8o0UYyOwHDNyF5Z1AY3zHj6iBWF4Zk=;
        b=imSdrQCDiw8zhkMcBaNe/aVR47A3sS3DFm5TzJY5oJxp4Xpho3AdlA9yder1O51Zr4
         +glb4KHgi0FBX2pMxIIuXcjfIspRYrtPsKTOnlEPuB7Tb+0O3HjaR0iODvVeIAyKrbXE
         Yfr55kNAFl+sC1J2FBhyBj6JO/CXvEyMj/kitu9+Z2JsLjuiH7BU850U1da8HKAkVcaA
         zISVX7Klv5aKMWM3Xg/nfIt0L8vswdDlXHJ8NiDmjxdTKtrscV2zZyu0w1Sj8qeu0v/S
         //L/gCeYpT0hfEjv4MvV9OYcrtIbxqvutBNtK+ycba8JBRyhtFW3u2v/a2NmJEWQNZx9
         rtUw==
X-Gm-Message-State: AOJu0Yz08cNn8fz3M8AZxp6vssPXiYVZZaT0tvkfRX6qXLpDQMQIHvig
	wcZkkiAnkIWV0Ks0x9GydZg7EOZq0LBkjyLFEWBN6z/xuc6ng9BrwmEfkpFl7HtHPtejRIDATBz
	hS0nBgg==
X-Google-Smtp-Source: AGHT+IGPE4ytZ5wp67bV3Ujl3154h33tdHOWio2f0p0quN99i2tXPnuOPAPn0lWxOG1E1kbp/gIKQQ==
X-Received: by 2002:a17:902:e54a:b0:1db:4419:e925 with SMTP id n10-20020a170902e54a00b001db4419e925mr4764646plf.1.1710086464521;
        Sun, 10 Mar 2024 09:01:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902cf4900b001da105d6a83sm2836862plg.224.2024.03.10.09.01.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 09:01:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 2/5] vim: upgrade v9.0.2130 -> v9.0.2190
Date: Sun, 10 Mar 2024 06:00:51 -1000
Message-Id: <8155a1f60b490859b1c942da2a35d5106eddc901.1710086264.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710086264.git.steve@sakoman.com>
References: <cover.1710086264.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 16:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196895

From: Tim Orling <ticotimo@gmail.com>

This is the latest/last of the 9.0.z upgrades, since 9.1 is now
released.

CVE: CVE-2024-22667
(includes the patch for .2142 https://github.com/vim/vim/commit/b39b240c386a5a29241415541f1c99e2e6b8ce47)

Changes:
https://github.com/vim/vim/compare/v9.0.2130...v9.0.2190

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6b440d8947..906aa53a16 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".2130"
-SRCREV = "075ad7047457debfeef13442c01e74088b461092"
+PV .= ".2190"
+SRCREV = "6a950da86d7a6eb09d5ebeab17657986420d07ac"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


