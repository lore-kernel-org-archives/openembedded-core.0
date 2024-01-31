Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1CBC47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 12:04:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.12289.1706702684184851779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 04:04:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YKMMeize;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40fb020de65so9629395e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 04:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706702682; x=1707307482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O+bs6ZKJgpbPe8zOe5uKmId4xqBaBtwT+PhVGOgna8=;
        b=YKMMeize/G0BcAcN/Hc+feTF0crCJ2jS506mg/KY/khlYt7kidobrj1grnlBknBDxN
         W7NJkSkghOBRqLhoueOpiwDSUhybUMkLMKkbxkgCgLlWUv61ZxzyKDnrdYF1YnSatKEM
         rmgghR0JhfsxoXSbbLYlcUgFiGuMwAsf1YZOBJ/EGbqvi+dQSgWRql6p48a8GglgiZSE
         5352uWNQMKG3NqGLjCo+MDHa9EAwUD/BaMCsIlWwYmvVILaVchZN7Co0C4KTERPUDuGz
         qOphHjQutBD16D7texEvEjnt8dQhFbXWqusr5G9t8ixlzOzXNHsFcUyafHBBlaeYOZ6v
         pyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702682; x=1707307482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O+bs6ZKJgpbPe8zOe5uKmId4xqBaBtwT+PhVGOgna8=;
        b=odEi4FH3yPSiiNRW2XVOXuiTZ0BO3qfhT1oE4gQwB+4IQM9TSZZl5pNUqEch98h6JN
         soMirz8JyAvnGHxZrDCV3dZvcKKbnaEo6xu/SJDRfjO4tyR0Jymvdk0y3lrTM9kTcJJD
         KtGrXlOxV7UXL751W/b/yARsDQuy5AgTCVJ9ollm3YDxks/Y4HRG+hLtXzfFNVg1fZCt
         SiKgYcEsdzu1Dmhka8f/aRjg4RcfP0QLrYcFQflfp/5ysR6Wz3lOTP0OjR8dx1u5dS7s
         5Lo2FbAKoEKB8qWqX1oQJ3Yt8v+Yf0e8yzF2MNqQHtq8iC6Bq0JiawWBfNiZeLtXDDBE
         xeVw==
X-Gm-Message-State: AOJu0YxoIpQpxhEmpOoyqhyM2I3wmLITMwWyTECJ+WBRugHBNkRMphdR
	b/ZydY3mg8TJscRWwfCLMt81TkujellGMEwjotdVzRCSN+lNI1tOethh0Pnb
X-Google-Smtp-Source: AGHT+IGD7jmoVA+xpcx5Eqnzk93a7Jt8PXED7Y8qVIqfRmMc3DHOIhZE5GIE5ufbY4Mnf0cuvXDEFg==
X-Received: by 2002:a05:600c:45c9:b0:40e:f626:483d with SMTP id s9-20020a05600c45c900b0040ef626483dmr1062296wmo.13.1706702682337;
        Wed, 31 Jan 2024 04:04:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600c450c00b0040d5ae2906esm1429854wmo.30.2024.01.31.04.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:04:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] classes/package_rpm: additionally escape \ and " in filenames
Date: Wed, 31 Jan 2024 13:04:37 +0100
Message-Id: <20240131120438.1097632-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 12:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194515

As specified in:
https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/spec.md#shell-globbing

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 819ee502783..c9354734756 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -217,7 +217,7 @@ python write_specfile () {
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
             def escape_chars(p):
-                return p.replace("%", "%%")
+                return p.replace("%", "%%").replace("\\", "\\\\").replace('"', '\\"'))
 
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
-- 
2.39.2


