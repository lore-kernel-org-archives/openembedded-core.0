Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAC6C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 10:28:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.48041.1699007292764027802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 03:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gd5GVww8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40853c639abso14206575e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699007291; x=1699612091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieahQZSj6qKJmQKsOaGmi7ikLiTlObdwxrLsrN6IrcQ=;
        b=gd5GVww8Gym7u9QdaX/yvZ+Nzq3oMSVgyNw01oDWsjp6HhTpxN0d4RWmFsSwF9BpO2
         53UHT0ZS7JBBoG0EtWlUIOCtV2ktvsfDf6RU0Fwe43FUMl8E2wTRonvBwz4u3bsUFbd4
         e7Auevrd1KPs6lh0QjNw0iidNqfAEOABH/wsbwU3RzlU/tpuupdGnMIPMgYU87MI+Vrw
         v9S3+BHB08pJ07k+5PEb8kA6ZEeVwlut+RkUbF4T2x2w883h0bCiGXDDlf92CXFVxwW/
         RSO4bKLTKcFW1QP5YQSyhpg0jmL22P4oytK6bME4zfQNAn40unmALU8s0uHSJxqfTTEG
         DZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699007291; x=1699612091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieahQZSj6qKJmQKsOaGmi7ikLiTlObdwxrLsrN6IrcQ=;
        b=I++2IQxr+nfd335P00NhoQ54EhsHDJX4aZVL5p1aYpVGJYigjumc5AjW/+CgtjVGFV
         b9NAjPvXV+xSU+8V+I4nSazGRxJ1pPuL+ImoA9SKYf9GbXAIkIwRvWcG4YjCT7JaiTdp
         WkypBnJggOfxqFp3Qp5P1ffnz3oRp/96dDeEc53jxgZkJaEnA5ZIUCsOXlTGKBj2Q+g9
         W7MYINLaqaEXyxLkvk4HtZLW/bTp4ALPdJXUA9cDRfF4ahWx7ua1m1gcsJ6d+TYfopRY
         DAGY0LoooMMG0mho7lfDFqEl7uUw4ffMRtNu3OZBrU9uTvkMrkWzzkHv2+E58Q/o8vF3
         UN2g==
X-Gm-Message-State: AOJu0YzZdxMidH9ifq7jtG0XJU4svqKb+XYtE7Qgvkrn9KNqOdip4Ak6
	AiZIRd+imuA8M0DT3rpTajOjLU7xKSY=
X-Google-Smtp-Source: AGHT+IGqVSx+wO0fucOkqjDYBYbizbc9IWD4SLDcvxhkSc2BJPRUMuQh5RiG8FvH6fJdlTFfdI4rVQ==
X-Received: by 2002:a05:600c:46cf:b0:406:52f1:7e6f with SMTP id q15-20020a05600c46cf00b0040652f17e6fmr18531362wmo.12.1699007290934;
        Fri, 03 Nov 2023 03:28:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id y14-20020a05600c2b0e00b00405718cbeadsm1976643wme.1.2023.11.03.03.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 03:28:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] meta/lib/oe/copy_buildsystem.py: do not derefence symlinks
Date: Fri,  3 Nov 2023 11:28:04 +0100
Message-Id: <20231103102806.2332746-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103102806.2332746-1-alex@linutronix.de>
References: <20231103102806.2332746-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 10:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190149

This was added (I think) for the purpose of supporting layers that refer
to items outside of the layer via relative symlinks:
https://git.yoctoproject.org/poky-contrib/commit/?id=d31d1ad4e566e42d0bbcf1f41ac25e33181fb517

I do not think copying the link target into the layer that references it is the
correct solution: rather the original target should be included
into the SDK with the same relative path.

This change is done for the sake of preserving symlinks
that are referencing things inside the layer as they are;
particularly the content of scripts/esdk-tools/.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/copy_buildsystem.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index a0d829054e1..81abfbf9e23 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -22,7 +22,7 @@ def _smart_copy(src, dest):
     mode = os.stat(src).st_mode
     if stat.S_ISDIR(mode):
         bb.utils.mkdirhier(dest)
-        cmd = "tar --exclude='.git' --exclude='__pycache__' --xattrs --xattrs-include='*' -chf - -C %s -p . \
+        cmd = "tar --exclude='.git' --exclude='__pycache__' --xattrs --xattrs-include='*' -cf - -C %s -p . \
         | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dest)
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
     else:
-- 
2.39.2


