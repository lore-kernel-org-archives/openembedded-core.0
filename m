Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60B4C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:12 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.23098.1750176002725277615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rMHNG1L2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33677183so51441845ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176002; x=1750780802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bo7uram/F8Og38FQpgpW5iL6LKoBUGlpZ92xGQYAHyM=;
        b=rMHNG1L22xBbqi/OHOojhf/k7tfNCEfUkI8spZ2+7WIBaYJbYCX32/Ibu7o8LwtAVJ
         dAyWgPOMGgUc0bmeE8zBxAvRjs9/3AJ46g3g4+GCWS+QkmjvHMbcSy6F+pbVj5LVXt9Y
         1gO9WzxncfkszjlDOZ3F82J/Yf64varJN0jCb7XB4QL2x//I2tMRIkSmjdbQPqSqo4qw
         yKKQIHonlBxsMT1fBU90Z9RwDO111rKx3NDbra+74WoerZn6qDGjNA+588kjKsphsbsH
         0B/FxLMB6+ICeQmLGF174jDwfw6iKO2hfCEc3e7syk/WZVaspIc1W/DIwRZNU0ABMuAV
         XF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176002; x=1750780802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bo7uram/F8Og38FQpgpW5iL6LKoBUGlpZ92xGQYAHyM=;
        b=gMJ4wucXRbtg1z6oxJGSc8qPolMPNU8bIsBYSfKqcKq6kUd718tZ6RiKmUlULBRFfW
         LrAeT27mirmQ2urW3dF9SxqboVFXtKc6keVSFKQyJfLh60jW9laIXMQOm5Y+1NBRZLJ3
         D5MgBMHu6F7DV9vl5icagxvaKPawHh/fGqJG4y8SMUVbKgmFTXLz5oQZ8TzdyU9Wq5gP
         L+FI1PPm7UanfFv6YEabJ6eyOyFw10lxNvM8fHcQ8dV9z+oK9flscotlfQndIahN8BpC
         6uxrT0fLstoO2IQx3iuRFbIe9zxkScU8yNIklXM6/bD21/c6feIZTb3Dk5OfIUrximjQ
         GdTw==
X-Gm-Message-State: AOJu0Yyedk09s52usSxPJ1ktYgjztYWvf17CsSAoJi2PxwrJM0OmK9hN
	9n9Qf1KA7ufU2uRFSvcH4VOl+LbKnVuHN+hDhAz0D76LyElf00NYmAksOYfDKexOFHl0z8QYX7b
	YSxA2
X-Gm-Gg: ASbGncsOpFLbLzJtDnGKqHb1JGEmyP8f102+Pa6nhnpAmI6Q0iOe5rDOWLRBZM2c+mz
	mHCGzVVxm3UpUnE4Fu0FgU+baQCkrk2+awGmJgNVxMHv6a7kP0l1UcBzJHmnapCvsT3BMsu736W
	+U6uhT0+TdhpF90bRV9yh4BjdCmH9xUfA/kTG0kPYFo2DBBWXG4TBSQoduzBzIsvFEG+BLoix7M
	pXU/kDaJ4Ry3SJxJmmRaQQV4sFTjYIWo1u2SUqO8qhnS1ACDMXsOCJ9F6VNaFOicevDNIb7thwX
	dbTY90j+3kkMFsnxKkFvyULCXYCJXNKE9yostaXOss9Sw0ILJupDtQ==
X-Google-Smtp-Source: AGHT+IF5B304XCLLKzgUEnGYFiPLU5mMX4kEncfYZ9XYA8JrXf4t40TONsPTToAKLgUoDzv+ZPSPaQ==
X-Received: by 2002:a17:903:228b:b0:235:655:11aa with SMTP id d9443c01a7336-2366b17b16bmr204096695ad.39.1750176001924;
        Tue, 17 Jun 2025 09:00:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 01/12] binutils: Fix for CVE-2025-3198
Date: Tue, 17 Jun 2025 08:59:41 -0700
Message-ID: <3516188a077bd27e1de3bb42bd5630dba0b3b07f.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218889

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
CVE: CVE-2025-3198

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.44.inc                |  1 +
 .../binutils/0016-CVE-2025-3198.patch         | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 0b8a298be0..e5df62b14e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -41,5 +41,6 @@ SRC_URI = "\
      file://0016-CVE-2025-1181-1.patch \
      file://0017-CVE-2025-1181-2.patch \
      file://0016-CVE-2025-5244.patch \
+     file://0016-CVE-2025-3198.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch
new file mode 100644
index 0000000000..49d7c94b9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-3198.patch
@@ -0,0 +1,28 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+	PR binutils/32716
+	* bucomm.c (display_info): Free arg.info.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
+CVE: CVE-2025-3198
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
-- 
2.43.0


