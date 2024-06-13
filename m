Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473A2C27C6E
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:20:53 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.9967.1718288453121644287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S3RaoFBg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f6f1677b26so8286765ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288452; x=1718893252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4cceVFHt4f3hqXqG+h1RSV/sfjux4PtVLuMzNZe6Jk=;
        b=S3RaoFBgKIF4p/KcNF4jP7h6pLKyfHNYMdozjtYBHrOOF4FSDXlKsu5pQFjVt2kwHT
         +CCEYLmE1A8bAz6TU6AibJFAOdcMUVrYoNaCiRD9JrSKS69JkS8M8p+GVRf2tmEjxw3P
         8/gH1iBO5SEMkydqbduEyeS2SSgeiLb/DXvofIWMmU6fHgZX4/tN6r0q4vQYF/UvZYun
         n3+ghyJ0nCag6+XdB9KKamF+2epohdTkjQjI4DVzGckDn7Yb3lJRYFeM4u48BAyUS+id
         itTNFv/2waMBTmggCvWz2NmJngTlBkNN49upVxvj3Taovssr7xgOSG8ye2p+f3B9eYHa
         1Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288452; x=1718893252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4cceVFHt4f3hqXqG+h1RSV/sfjux4PtVLuMzNZe6Jk=;
        b=SPs3cyMbmcxct3qspq68ooQ9od1A5acG6O+r/aendimJ/jcA1ARc0jaNrXdCLbDx5Q
         61dJTmkouxyISSj55U0WVZJdtT/x1/NBRsXmogS6xyuzGjTjkHenZuGgdag/um9MHXtP
         L6oOUhO6od/FPJjLowWLxpUzBjooKaRf0lilzUyPbAFL6WoJ5mj/20kigL8wZKesMf81
         2bL8Rin2p/fLLTVAxF0mXfzHoL+5ztLTSb0OVMbtizhP+mIbcA66RZ3uT6I1UURAjK5g
         5ObQ9weLYU8Bp8uenvpp1fvOmlm2hjW/J5LyQrEDLQe2wcwtbMapKX45fOSYBHpPABcb
         2Ixg==
X-Gm-Message-State: AOJu0YwZa20kofHjFLbCdvEMKKOZAWJiNTQprikk4aMZESX4VhoeHpx9
	P9+Ve9BMATb37zcDK+vq4G/zJy7B9QCNKFXwQc0J9kwUH6g5n8oXrVzMJUzYltn1FJIgpy41UTt
	B
X-Google-Smtp-Source: AGHT+IE2D2kSFIv2Eiz8/Mj1zgwtbhBNYDYCZVCTny82vFpe7OfLRqie4n3ThUp4J8k61Biq3Gbhww==
X-Received: by 2002:a17:902:d2cd:b0:1f7:12f5:d7d6 with SMTP id d9443c01a7336-1f84e42e048mr45426845ad.33.1718288452328;
        Thu, 13 Jun 2024 07:20:52 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/29] oeqa/postactions: Do not use -l option with df
Date: Thu, 13 Jun 2024 07:20:14 -0700
Message-Id: <82a0df6cc2c5b18cb48fd8c3be26a11f4016d98d.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200612

From: Khem Raj <raj.khem@gmail.com>

-l option is specific to df provided by coreutils, if df
applet from busybox is used then it does not work and fails
like below

Fixes
   df: invalid option -- 'l'
   BusyBox v1.36.1 () multi-call binary.

   Usage: df [-PkmhT] [-t TYPE] [FILESYSTEM]...
   DEBUG: [Command returned '1' after 0.71 seconds]
   DEBUG: Command: df -hl
   Status: 1 Output:  df: invalid option -- 'l'

it seems worth a compromise to show remote mounted filesystems if any
during ptests and it works with both df implementations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 75cc1ea4348a2294fdc5ab20530fcff27056ff06)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/postactions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 8104400ac2..ecdddd2d40 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -25,7 +25,7 @@ def create_artifacts_directory(d, tc):
 def get_target_disk_usage(d, tc):
     output_file = os.path.join(get_json_result_dir(d), "artifacts", "target_disk_usage.txt")
     try:
-        (status, output) = tc.target.run('df -hl')
+        (status, output) = tc.target.run('df -h')
         with open(output_file, 'w') as f:
             f.write(output)
             f.write("\n")
-- 
2.34.1


