Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13712C021A7
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 16:16:14 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.31620.1739722566272660343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Feb 2025 08:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rxp9CzDl;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb8045c3f3so109293966b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739722565; x=1740327365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1w6AMVKTIVBPkwbgKG8PMcBoEGknzd/WY6Ygue/qO1w=;
        b=Rxp9CzDlmKSkHp789B6+P5Qtncz6N9kwC62aMY9oZKdJw0Cy1QIieqxsE8VLgg8aB4
         GbDe2Lw0bWcouaI5/R1V+BT5/0foSS5iiaHiO6CDDljSMM2qrUgGfNXwoLEGF213SCpb
         etRUELptOWDW6TNcHQQzvlrUHhMhw83cCyHGygd5nH/31SQGKZz/ZxvUGRakzjaTKpQW
         QY/wQcmGdA9g9PDjWiJyrS4a8jx4tnKMxR+aiS4x48VXeq3iWQcI+tODWylVXZMKs2uE
         jHBFCrPzDrtLdQCQaYa9KF023Oa9a5jv1H/j+vKUKD0ivaBxkqaaf3vTb9qzih9dsN7m
         95gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739722565; x=1740327365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1w6AMVKTIVBPkwbgKG8PMcBoEGknzd/WY6Ygue/qO1w=;
        b=MbvjaonoQg6mznc6lrnW3T31YU3ZQUdpryTs04u8wIS613SL8oZjydf6Jq0YGcQI1M
         m52YcbF6NGyX76kvCHGPnom8P0TgffGSuf5IDXOOUJ4WNFW4LwluYU1Ew6Iay9VqNbmA
         zOzRO/H+f0euYlmy3YNgoTfTncWrmkpCj43Sv4JQPYubxtHtKE3NNL062Psu6s9uE1Av
         qKytW2RB2MVSyhU65Bny2/ABEGWxuTGPRvnvj+fcLbdxID8JYC/9xrlfC3Vd1Ek8OA4h
         EE4+zfac8ybmCabBKtxQx6exp4cbOLJGZyhl49kZ39fD662pjSnUpZOdcGL9mZy+0UO/
         D7OQ==
X-Gm-Message-State: AOJu0YzDdIc+reTaYSAnLga3jnSjnXAQEgXMHyuhOBHpJnglAXBlORD3
	SeTIxy2c1Rk4vcVKNLobJdpd5fYojJnRVJmd4MHM4nCOH/w6iY34wWp0WRLO
X-Gm-Gg: ASbGnctyy/6u07TVlDQCQz88OicffuaxPNENE+J+oAFiSkLwAI4iiLR3dbwwl6yPpNI
	HxDyV6SXZXjYFlmiCYLGS6Qz4O8JVhF4gFKsCq7PMrUV9bdEjHd0OjrydcHit03Z/zY58/OHWws
	4gNKlkXQTw1bzKPZmcBP/keocw0nfVmTM+U1TW0Dnowhhp6ggl3UiWyOezXwiP4fl5unWAlHy0y
	ggDanprTPqVmFUgctFHPPDDLok/38T/+KK3yBrzF05k+R6imqcIjP/orHwKCYdYEiQuQM3qyc+2
	kmG06GEQjdFz
X-Google-Smtp-Source: AGHT+IFSfhrrnHicFHOKIwcP8otj5wghaONUD1++0uKkAwL4M2O30OBf4cJUA2w4MZtPUYMJ9kgq7A==
X-Received: by 2002:a17:906:c10f:b0:ab7:be81:8944 with SMTP id a640c23a62f3a-abb70a95959mr695479466b.6.1739722564383;
        Sun, 16 Feb 2025 08:16:04 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:600:5a3c:6621:dedc:472:571])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb6e4df5basm357917966b.152.2025.02.16.08.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 08:16:03 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.24
Date: Sun, 16 Feb 2025 17:15:58 +0100
Message-ID: <20250216161600.406219-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 16:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211502

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.24 release of the 4.0 series for buildtools.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 01253e5f95..56b22e4270 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.23'
-DEFAULT_INSTALLER_VERSION = '4.0.23'
+DEFAULT_RELEASE = 'yocto-4.0.24'
+DEFAULT_INSTALLER_VERSION = '4.0.24'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


