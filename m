Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44491CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 22:21:57 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.87305.1755037308465718672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 15:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tTozM6fk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4af123c6fc4so60012641cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 15:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755037307; x=1755642107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdJiUZUl8ngf31s7XrqrHtgTIdv0Z8X/7ePww7pV0XQ=;
        b=tTozM6fkc8TIJOSGQMSeADLrvVapA/w8XQ6WOuyAVQ3Zo/Vqn+8wpFeRpSpYt1BZAn
         YzN7i/nXqfuhjCHqKo2mvrJjOFuGbaS2X55tRvuScNFNxfCYun3ChJyccTIBruWClso6
         Z6tA2CqabbuoFeB3xdzBqBdKI8dRh/P+HgvzlLIEioQT0YcksUN9KvIMhpyVhljQqSO5
         ITLgNtdQCqnePPRbeozpgelbqKb6sM5DGhDgXjq45hso/1875X1UbvHdR/F3ShDwlInP
         y8CIxWfAlqAsfbtffBNfCOZEtwBmTppqOErqx2c2I242RWN1NS1vXi6VFzFE2wihkpQ3
         9zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755037307; x=1755642107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sdJiUZUl8ngf31s7XrqrHtgTIdv0Z8X/7ePww7pV0XQ=;
        b=wgQQaDmwaIugIesFpWChWPYvzax85gQS8WS2E0bQeg0NWgYZOblxQieF7nnbOtaoCn
         M+Juy2g+YQIKqJlZsJZRUDdXZrxy1X5touD4pUdk5nb8IiZlQOn3cjUGKbm087AHSib6
         MZ1q9v5fAwhtC3Yrx8mV4ZZOaWG/HUb6YKDaPv1588t1oMcmJc4KwJfIJ9vplVOz84Xa
         y49Hsy+WR++3dJzFUoUhiLR+bn5NgZdKxeDTUAOIZ4yNLE9+Ve5tXk4DhL5jkLpXr3oC
         Jt5bP0MqEEsf94qw2I+zw8Zj1eTmnO2bL0bzKp2F4OKi3L1yHumyNjFmeI/A4KURHBya
         6x4g==
X-Gm-Message-State: AOJu0Ywf0md/zdcwcuwe84xFEeApjvSmOGvNBi3WKtBJ6hDjH+nIqvsB
	8ZQmxkhW4UUedA0xvOkaHAzQTIyXznu1SKt/oHalu9MxmcxeOBU0rRNMDUNV6xewCxldVPHcXa1
	UPS0=
X-Gm-Gg: ASbGnculFKTsQVzv2IqR9VtEoXYZzCsVD8z5RinKNVD/mHRbky07z92cPARq+KZY6MC
	RC30jXv2KXtTgw7VeJfi0MexpkJnKosr2GkWPToy/q3/GxiU3GKArive9eIG8fgKOy8Vpd4nAOv
	fosoLUIjEVnamo7MH4/S1C37EG3/tjbrpLW0Sb50W/eckQqEW6LemKt+H+bScXFUEHekyS3QdL6
	+IYixvNg4utMiqAVG0ypEJk5UtwUd1NuJ35tNyy4Zl3uODHbb9/Tsi2xtqTomoeilkTA7FTfRwh
	vku6i12hTWF1XyvDXdeUcNcnCiDUe5UCHjouDeoptqOLUvXBTHHJopxoPrGG73GTHVzsyxpAJfM
	Q3LIIID5ZLiXzFzo83aXaP0Ui
X-Google-Smtp-Source: AGHT+IFKaiFTW+VPEE2/JClXLj6ryPFEAdIsm7wGxz5OcOkDmmoJaGtY4tDNbPof3na2RXHAxbhxMQ==
X-Received: by 2002:a05:622a:15d0:b0:4b0:cf1d:abde with SMTP id d75a77b69052e-4b0fc4df415mr12050301cf.0.1755037307011;
        Tue, 12 Aug 2025 15:21:47 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b061be8c43sm137365391cf.12.2025.08.12.15.21.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 15:21:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Revert "feature-arm-crypto: Add +nocrypto to -mcpu when crypto not in features"
Date: Tue, 12 Aug 2025 18:21:41 -0400
Message-Id: <20250812222142.1761197-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 22:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221781

This reverts commit db1b355b2b15ba57bd89c2dfb88c2c667551863e.
---
 meta/conf/machine/include/arm/feature-arm-crypto.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/conf/machine/include/arm/feature-arm-crypto.inc
index 8202de78e46e..aade6ce08d5e 100644
--- a/meta/conf/machine/include/arm/feature-arm-crypto.inc
+++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
@@ -2,5 +2,4 @@
 # armv8-a, armv8.1-a, armv8.3-a, armv8.4-a, armv8.5-a, armv8.6-a, and armv8-r
 
 TUNEVALID[crypto] = "Enable cryptographic instructions for ARMv8"
-# See  https://github.com/llvm/llvm-project/issues/85699
-TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '+nocrypto', d)}"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
-- 
2.39.5


