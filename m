Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDE0C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 04:54:11 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.39395.1712897644279817147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 21:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R1xiCg+x;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed32341906so599348b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 21:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712897643; x=1713502443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEgITK/+bVCTWDyWMhuEF5DW7PnXVhXM5lw+DdHfvak=;
        b=R1xiCg+xwYUbjJgjINtXZ7+4G/d5thSiBoW1CbOm7xNa20tWKyAI5S2LNg4erbsLBW
         KLHTLQSsudzutqeOQMYbyNbs3gpaEhdUDbvfZvZ+a9rKOP78qP1CUrAdxmv/llNxb250
         1lvDk6zUTtq4BBi6FOS+6aEvjAqzgbuDPNIb4Y8a6Pw7MlRj+0KXkw07Lt70ZkeaYyP5
         O+OsiDsn5VkvNQMDctiIRQzTbS7hCueVQl9DqYxMa7p2TBQUbMw++MhXRyJrAAucMyhT
         DLrXbVwDteazroldhmvFN9dlenAgy3mHNLdW//MzM/iZDX4KeZPYo0iiZ6FDfnsy0RW1
         yCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712897643; x=1713502443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEgITK/+bVCTWDyWMhuEF5DW7PnXVhXM5lw+DdHfvak=;
        b=kH26ogKThIM4XFlrBkWyE6q91GGKfzkzDrHTlPdM3RSKNt0HsdY31QtntD0jUE2BT2
         mD8MBGeRzvPFTjlk0KntiO2RNaFJ+FgRTeaAfZgYMJvQDoBpzUEZHv0DjJJv37wLpf+U
         kTx0GBkE3zyLxKC5bx7SWhzs6Yl4oSNtNFydptXnPSujDeOtKMi+XQiYSodynjpx7sEr
         5RM6o5rmeM0yD7rGU0u344SgZ381N7scyCL9xfQQ1A7iGgpsqu0N1bhw915BAvt5x5Qz
         +vgaEIGKNw26LYAW86NZaVU2tIkKEsX2xF2xDGTyb2TfPFI9NLKncTrQ9F8jEE8XSfXN
         m7Xg==
X-Gm-Message-State: AOJu0YyPD18FhugIoLWBnYhP88CehXxG91FdfTmeUZSHPBbFabVuj0El
	CtIc7TYBKIz0I+txAtg+egy1l4PdjTkC2XuaGosrgaK4QrTY312mfflA+xmL
X-Google-Smtp-Source: AGHT+IHzFzmY9NZSDZ2wdo3ca497QUzWp3fg4f4lCVTpQ2E7mRpJM5dTDMr/rdjq57Wgh7/ShIs6aA==
X-Received: by 2002:a05:6a20:3d8a:b0:1a3:4863:f70e with SMTP id s10-20020a056a203d8a00b001a34863f70emr2262306pzi.46.1712897643431;
        Thu, 11 Apr 2024 21:54:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902ab8700b001e4ea358407sm2036457plr.46.2024.04.11.21.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:54:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] oeqa/postactions: Do not use -l option with df
Date: Thu, 11 Apr 2024 21:54:00 -0700
Message-ID: <20240412045400.1117307-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 04:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198153

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
---
 meta/lib/oeqa/utils/postactions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 8104400ac25..ecdddd2d40e 100644
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
2.44.0


