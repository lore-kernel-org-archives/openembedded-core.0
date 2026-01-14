Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB35D37E5D
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:48:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13360.1768405715096498507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:48:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=kwsgFLSX;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8718294331so57379166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768405713; x=1769010513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipED3fNgHaVDGE8D18j6ZhsWqER2VovFS/DiYGRdJic=;
        b=kwsgFLSXdsG+qRQUd9m0jALQ/syrzSLyCsFEouyGceWUZbw1BcWximhqD4Kt7OtvVk
         AIlgrmznRnbDVcar4f3dAcf8DIN67bMbEYTaIsLTKq0LcORNYCvchFEJr1IhoPJ/PWY8
         jknqMEKTrATGONXp58jbxT3pahOQ2YUN9Td5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405713; x=1769010513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ipED3fNgHaVDGE8D18j6ZhsWqER2VovFS/DiYGRdJic=;
        b=KpfeZCCVfxwsCLK5mQgVFhUsuYRQn/Lqh61YMUobk/0xk8Xw8Ex1fz6s5p34pnqbpC
         mn1RCENF8jakKKUh1oalqPNFsEq3Q3dlV8tkYwxmIPhmmMmZKW+PketCmeMmtcLyG84a
         1IRduI+zATjJUf8orx3bwX8yZdilMhjcTlipiXqeOfTiMu/4TqC8QTfh8zR+CQviyVuK
         LEpDU0otNYtSCRadepls59kbhMTCyJGOomJPsWAUD6nCiGo567fKmG1ja+J9X1LMGsC7
         Hp/KyAl83zFJmLact0jsTfNixitExgghqD3vaTI+GN5AYCjv746MGWDkLraXnzE1Frft
         BNrw==
X-Gm-Message-State: AOJu0YxL4/TSf3UzywYLTVY3TgYgnMIApWGVR3IPEf9hJgd/cJRiwFRd
	8f2Iz8n+xOZdF34wRGgpZh9ZG9ahJRF+N43JphHidqviVzDC/W4gFGEPiVO/4YoMR9wi+u7qM0W
	wyj9a
X-Gm-Gg: AY/fxX7nlLdE5xayBiuFW1lg30LRNdOBj5Zwjvl4DLPcIPpBe6CoCEOR15RevhOyYYL
	Ex6FN9JuJoTRUiBiI1OTLWXXX29eu3x1yZYekczPYSEijCNGGjXQ7pq9+ZY34HxIF7uCPgBsdv7
	QEiif9s9uz6qgVesg+EzJoEjwpA/TeBdK7ypKIa6DzmnTdNzw+gRngIm24bRfsGxo0Erxnqw3sN
	Ch0UfiTqsKae9Yy2WDDSui+AhqthHD7fJRdevsXJpCAXWWmwlOrWwmlFE1JloEj1VjBzjV4+F89
	ULU8LpYPVvNgj9SaBbqIZaPeORpxnSB1pWCFYfMB0UP44oooml9ayYtpokiF+/Wk7y8fCsq8e96
	e7qVv+Je2x5GwkF8xkNvjzFLmToAKH+7ePJ+6i55YhLmLX1MoO/SUaYkhdvsjffcaxGHFDpND0n
	ViSlvxK5T+0rojQ5K1HXGyN+DAwSQnMiyyiAGh7FBabL4F/Lk7txG4qsX5BRGLx5NGMtfNJjK4o
	B7a4DN9ulCvl+Ia0W5Emjb7/knvn3FdG045HA+83rYDLdIejF1W
X-Received: by 2002:a17:907:c22:b0:b86:f194:9ed5 with SMTP id a640c23a62f3a-b8760fce9a9mr154022766b.1.1768405713355;
        Wed, 14 Jan 2026 07:48:33 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm135616466b.6.2026.01.14.07.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:48:33 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 4/6] wic: extra-partition: Rename install_task to extra_files_task
Date: Wed, 14 Jan 2026 16:48:23 +0100
Message-ID: <20260114154825.4043483-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
References: <20260114154825.4043483-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229341

Rename install_task to extra_files_task for clarity

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 scripts/lib/wic/plugins/source/extra_partition.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/extra_partition.py b/scripts/lib/wic/plugins/source/extra_partition.py
index d41743ec40..efe15a4d15 100644
--- a/scripts/lib/wic/plugins/source/extra_partition.py
+++ b/scripts/lib/wic/plugins/source/extra_partition.py
@@ -74,7 +74,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
-        cls.install_task = []
+        cls.extra_files_task = []
         for deploy_entry in deploy_files:
             src, dst = deploy_entry
             if '*' in src:
@@ -93,9 +93,9 @@ class ExtraPartitionPlugin(SourcePlugin):
                 for entry in srcs:
                     src = os.path.relpath(entry, kernel_dir)
                     entry_dst_name = entry_name_fn(entry)
-                    cls.install_task.append((src, entry_dst_name))
+                    cls.extra_files_task.append((src, entry_dst_name))
             else:
-                cls.install_task.append((src, dst))
+                cls.extra_files_task.append((src, dst))
 
     @classmethod
     def do_configure_partition(cls, part, source_params, cr, cr_workdir,
@@ -131,7 +131,7 @@ class ExtraPartitionPlugin(SourcePlugin):
             if not kernel_dir:
                 raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
-        for task in cls.install_task:
+        for task in cls.extra_files_task:
             src_path, dst_path = task
             logger.debug('Install %s as %s', src_path, dst_path)
             install_cmd = "install -m 0644 -D %s %s" \
-- 
2.52.0


