Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE949C87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 19:54:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3092.1753386844468175809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 12:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+DG2En9;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so2530329a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 12:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753386843; x=1753991643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fc9vr/wc7+trlNMF+2n4k7ONRnnGzunAE2m6jEbXgcM=;
        b=D+DG2En9glUsRCsLzwAMFLib+ynavxGFSn+0CeYTnwcujG37SOTuFxwBKZzaGBKHgD
         mBj4nXeczibZrbhAOTCo/XaF5/soIcsz7RR7aUgyQgEt1lQ5cc2aF0F+rWD8RV5D4SAB
         MGWKtE9SIafPwvn3CNtN13/lgfOZ/PYUynfnAPrk5sibGwGwdLeBKBW/f1T7ZDvGCaLx
         fFI97061WSwpjtt6ktBzhsJX5zRy0DTWN72PbFElWyzL9CGSg/zo4bRbhGHdPs5Bgzoq
         MEmpCKge3ElFuGsrCN8Gr+SIXNNiEiZpSoBEdC39a7lasPLeAUtdBfiCiM52DqNzwEru
         BkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753386843; x=1753991643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fc9vr/wc7+trlNMF+2n4k7ONRnnGzunAE2m6jEbXgcM=;
        b=nMKmx8bO3XvEaEOrtm79PyNnGeSs4sGG8WC/EUbX8LUhVsw3Ffw/O8O+/JU3oJCJwd
         rdYrsG9tuoHBIwV66pDtl2WUPA+ycRWEGWZPPIN/OgzJsFOP2+I09fMAiEZwfiwnhzeE
         GBmErY2h+VGCXg36bbNNnz5VoZnEW27rlPp6341QfpTPWShm7OlVrSAuJ/SiUjcxKMAH
         6zcAnxPgLWj5czeQ/pSqontHFF453BnOKczwCfMbQxrVAfiwlx54xxIEWVsS1leWXJH1
         ejtDInHPM8YQfZMGoOUNe90P5brB/xPTjfXCP9+ORHumLX9kXTn8PV4Tt3T0X0xD3reg
         UHtg==
X-Gm-Message-State: AOJu0Yx/nnTRQ1Kp2IU4DWEhPy9OKzI2rKAt8hCto2ED1O0J4RRB+r3r
	7UrU36heva3cbxI4cIVpYtD1mYBgBBXUNt/W59UhDJNFtQ4l7QHHIkTYowtPbQ==
X-Gm-Gg: ASbGncsnZJn/FQEu/2JBpX+2a3NqpYG+cpcXlg3Uph5xW3699EyfCU1VoxedNzZjkSZ
	ccY1YX+4RNkHpJ9+vTrBJzcYmtu0uDn0i3wYvHhczVnb3TQVeC7vWbL+M80LJ6y14lZ1uZKTjdi
	iqLbhLopfOPQyMmWs3QoX7ksnGqeVRzWXILiRLRwgmep0hoL09PXiVy+nfW6WGOVvacglHSMVSx
	YOx+nQJNNJ/se/yf5DSC9ujERT5mWUqgKrgdThr7gCPYWWsHWNwE9RRvB3vLz0MU3+S9pBozje7
	LhNgQfaYvfE+g0qKAI4HjgrhufTXyHvZjTr3KVdw1XKeyJa28QDPV5/Xx6gr/RAQLyQ8pkJdfNZ
	bXsHgIWd498QswHBxVD9+
X-Google-Smtp-Source: AGHT+IG4JreNAS633brjXOXyCyAVRJsPBEf+/bxHNYJAi9iRHLkUTp/zC5A/grlnciyMNo6zXE5L6g==
X-Received: by 2002:a05:6402:4412:b0:612:b552:5a4d with SMTP id 4fb4d7f45d1cf-6149b593e74mr6941433a12.17.1753386842520;
        Thu, 24 Jul 2025 12:54:02 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:a5c4:a4a:87da:e28d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd3432b6sm1197428a12.63.2025.07.24.12.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 12:54:02 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [walnascar][PATCH] scripts/install-buildtools: Update to 5.2.2
Date: Thu, 24 Jul 2025 21:53:54 +0200
Message-ID: <20250724195354.33606-4-an010@live.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724195354.33606-1-an010@live.com>
References: <20250724195354.33606-1-an010@live.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 19:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220869

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 5.2.2 release of the 5.2 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index aa23942858..50b5487eb8 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.2.1'
-DEFAULT_INSTALLER_VERSION = '5.2.1'
+DEFAULT_RELEASE = 'yocto-5.2.2'
+DEFAULT_INSTALLER_VERSION = '5.2.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


