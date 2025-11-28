Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9902CD116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:07 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10198.1764310745832436045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEj5+9KM;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2981f9ce15cso16377965ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310745; x=1764915545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJBB/DHj43UfAg0PPJpGnbeCs++88NXouruMm3C8zlo=;
        b=OEj5+9KM9nJInbb6M2k5MOPtvfV0q43bDpAFgyOvkStJLFi4dG9mhzsuGP1oiCCkpV
         Ab3mUZ9H5EY3IWN+matslv1PAv7MZg6M3Px9dPkm0x2UE6NgayxOcysytUkbwmUxdvVp
         ZMThLv5kZMSAeejMnDcT9yPQ+gy87Q1zGuKaiE9pqnznvx0cXE4ybUI4pbofydhHkWOt
         /ULYBsSdwFyHQo84kXtKY+vTXXN0JryCK7ZoXbhM3e/8by2CVW+CJQl+zEcbS5dewCcg
         VrVMcL3QjgX8TFvMKQYeyqmkYS/UUK0IqrwjtIQu11BKNQz5t6SAH3z+yE4iN/gKcruM
         jKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310745; x=1764915545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJBB/DHj43UfAg0PPJpGnbeCs++88NXouruMm3C8zlo=;
        b=kFBhLKy9cGoglMrI2SklUcUsoXQHuqwmlJX/hVmcI/j6id0pJd8meOm6alRNY5tcka
         KfuNzvbmT3Ht3d5oIyAZzfbfdQa9YzFI+uzRorCMAZAZOoCLHAoxvoJn55wKPmPCYiAf
         9lQLUz1tpIo0hEViAlQhhtok+HaBgTj4Vxl+iu2pHDKoF58Pd1J2asyEGsA+RymtB3fy
         W/hxy9BtETKzlOnGfZvx7iNxPq9o9wk/mDeQcqI6Gqosz3R3OAnMwaicGbIHqUCyJjy3
         haAR5wGCFUxSZTiW7H+mloYAjHL8mz2VWKAnOO8TvJXnAkYyaGjBdFOF6nY7fHA8syJf
         4jow==
X-Gm-Message-State: AOJu0Yw1X9axbzEu4gVanUXsricZh3PniO61rsryCd6ZCFACOYIRLwg1
	Tom/5n+9aAWesz/FC0QJo7G5iXWgf8QOLTcnIhULA4CHh2mWw5v/6dqMKgIaAA==
X-Gm-Gg: ASbGncuBGY7K4FfiuNK2qZAmEm7saL/1WBVCgnPmNhTDpSUw5N5WiCCu1ctaludrbxY
	ue6W+ZWBTCM3T2PEBNVNRFY+wQNL+18gzyFom0n2FLQ5+fhIXf6hbc3VtjfH+0pCe/iWpnKm8G+
	HeKutQV2p57czKWSAOe+5DGtoiF+iYJgcZnoq2rlvfVZPgVJteEV84ilVRaBE0xckmg/yvDlO6G
	9Pe+VWWNsdGwfqFP1Ue1AahIRVp0pBMeVPGfQj19TUF5HAmJaJP5lXGNyATBoQtpbelx8++uvkz
	MTb17ZV9fOUkMV5/3Jmqmk6xGpDNwKkGrt5hYRKbskciuxllyF0px1jAtYwDaOHinB0VTjp2eSx
	FujE7yJ/yHaQF6QfSIsd/ubvQAeN4Nm2rWmli3GhExZWTRhqVBtBUygkuv/4Vk9gSZYDx8RXN/5
	5aPgOw27VyeD30hw1ucG6bBXP9
X-Google-Smtp-Source: AGHT+IEdxCFoQmYLlvzXvJMj5aSR4rAiA+yHsYSLAnJarEOauQtezbC1JDMjl3ZDjxxqEQrz/v0Qtg==
X-Received: by 2002:a17:903:1904:b0:297:cf96:45bd with SMTP id d9443c01a7336-29b6bec4726mr267002205ad.19.1764310745007;
        Thu, 27 Nov 2025 22:19:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 05/14] btrfs-tools: upgrade 6.17 -> 6.17.1
Date: Fri, 28 Nov 2025 19:18:42 +1300
Message-ID: <20251128061851.1634479-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226888

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/kdave/btrfs-progs/releases/tag/v6.17.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_6.17.bb => btrfs-tools_6.17.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.17.bb => btrfs-tools_6.17.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
index bb72cb0c04..8a6e4c268f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "c03e29f083678f47a7d7d810db4d21d905979b77"
+SRCREV = "06981428c08f78f019a2f4956407fd84b495e21e"
 
 PACKAGECONFIG ??= " \
     programs \

