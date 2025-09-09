Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F39CAC582
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.868.1757438264382280832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 10:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mZHa897a;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b042cc39551so1055265166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438263; x=1758043063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL82xcXvmf9rPhn6sWrZ2F+kAe6apgyoGs4Bgqb4u6s=;
        b=mZHa897asYWGSRwSQdSVfBkAo2C2QZHNNW2SbWc38kQYrIo128ab3t3C40z5ksuUWn
         jo2K1jrIBmpCRw/7DpwSHLOCaE6ffyoQsKAyg+qrNqBiEhUMW0Kk3Jy1oQZv/95CGTNH
         4pVDH6bMecWD2Cx9QzmCwX8PaEBU506cOvPjjP5Bl9WgYmIGex+nH3hWMNE5YzIL+Hcw
         P7eppR1llBzyS73pIqT5qjEpodi2VIklWF7rlUX3io2seGAGSBWIMmuwmP1/0Wq2x3SW
         VTLQ1SZr/UBkRYCfYv752C4rOUMf+gOupg53VBIZ77jsc4nSHEOqU94A6ZjR6SeTOk5Z
         LAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438263; x=1758043063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL82xcXvmf9rPhn6sWrZ2F+kAe6apgyoGs4Bgqb4u6s=;
        b=nztY5A25agvnz6XnxLDCH3PzQkRpYN7zFr4c/lJMkXTM6saWqJHvpY8q113G1mlKg7
         lGd1sovq4Uww7ve0lOKpkFUGCtakPcbhHJBKLTx3d4FW2jgb4qIPN1gDGyCTfIOSw8j+
         sn2Kx7h7fJCEDJxKyVKVkMaiED5TrO0itOQisqeZl2wVL4rhGM4Fh3ybBb/wtZK34fhY
         kNUVJ7n2ZucdDFFYJfql6C1ikZBGawdpTwghBBFGOIwsDOcL3xgJIfO6nb5ZyjSHzbkm
         S5YWWMTHzgV0U21tJEAwcy6fd1C1zAzPFNYqj1Vo6muEoy3Q3onCpHbVcxatk8xr33PD
         VNnw==
X-Gm-Message-State: AOJu0YyPPm7B3/ZFPDlP4XwQAj6wzYge/Vmqg/5k0H8nKbeoSWfLGRzH
	K1AQIDe38lHG30aPnajz0ae/z36JrrFoI0EcQpxjy0RL1mUyBgydAODT6uSUAw==
X-Gm-Gg: ASbGncvMAO3IBXn+K8ThL5yW2K4AS8r9debBkinTE9PHHA6EKzOAPz+CU1OrQkY3jjn
	abXSb/6ctZzG3xrgFpyJHOz3yh24lNpVATO/h+fsF9aEt6SPwrfyjO4fVvDnVVooFmuSgPuq8a3
	KjWB6qefcMFNvNP/Xy4FAbYBsFOH4fgZyWy4rSWfzf0rH5tzVnH/mxkK0FBuIiX1KJa5Jl87eUf
	cuNSOYDCd0wf0+L3qVU52W6KG8MjtHsT7mhke/H4rxZJ2wGsd8UkhZjtrEoSY0mUyjjbm04SKB0
	0/iWbp9kD2TMwkUW/rzyC2dxuj4MesGgFDKzGro/wEd5+tG0gJEiv6fpuD185Qw0w7XYxKl6FXP
	TZf2iGevj5MdDvUY6Ln6+psXpP85jKZwq0s/T
X-Google-Smtp-Source: AGHT+IHv4prixumZWZQEC0/X5uzYYuFDNnzrlapHRx4uEwh7QBjVbV5vKduVcBmDwZ2zkdap2Etc5A==
X-Received: by 2002:a17:906:7945:b0:b04:11e5:9a8e with SMTP id a640c23a62f3a-b04b1687eadmr1261021266b.40.1757438262581;
        Tue, 09 Sep 2025 10:17:42 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62bff24d0a4sm1518657a12.22.2025.09.09.10.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 10:17:41 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 2/3] sanity.conf: Update minimum bitbake version to 2.8.1
Date: Tue,  9 Sep 2025 19:17:34 +0200
Message-ID: <20250909171735.1588343-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909171735.1588343-1-martin.jansa@gmail.com>
References: <20250909171735.1588343-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 17:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223128

From: Martin Jansa <martin.jansa@gmail.com>

Needed for multiprocessing module in bb used in the next commit.

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
which was backported to 2.8 branch and tagged as 2.8.1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index d2f56a3fb0..5f8d3b7619 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.7.3"
+BB_MIN_VERSION = "2.8.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 

