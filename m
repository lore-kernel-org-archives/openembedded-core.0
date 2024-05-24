Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D68FC41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.14312.1716552884450134893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WCidDYWu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f304533064so22327295ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552884; x=1717157684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEINDDztw8Iplm+SYiB/I2IXWLeO4jrpkrxNAqdmNTA=;
        b=WCidDYWuA4CJeQomUoGHV2bAX1bJjHzLmC9TYCT8NAqcOnuezyioZL/anasKazSx1Z
         4x3O1JNxh3ItyXmd2XZcvQtSDkoWzKZpiAjyy8HW6hH423i96YGJezbqmiRY8KJ9wHGQ
         99lkV/hUWyCA4SisC3RHlLUr0Lvm2lt/yDIbpqT4xcQsJMO9BvcCtwcougXE4Kb0Ddpw
         +oxsPS2d7XNSwLvCCtuEY5kt97t1JYmhbqNl4zvA8nv+L2WJKmQcjmtTkNlHPG5mX3qO
         3y1HXVqceMox3mWGf7mwF+Zgl1EXgc9FZOPOcukqdYiZHESqr/vfqIbzyA7wQQ5E3xn9
         11Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552884; x=1717157684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEINDDztw8Iplm+SYiB/I2IXWLeO4jrpkrxNAqdmNTA=;
        b=KGnGXjZBo+kpUOKAPA4QEOWydrd2gDkX4T6h0pPB6gpLcui+66Puoq+C8n9UXFp2kd
         t4mtbX8ZoWAl7k3bpTatiTKGYbO+nnJSfqecwvXWWXT+U8VpwzJI6Q0UtqjewVvj4Z4E
         gB3ubxUU9BV92+S3RJ4TAtwc3ItTDZNEIErDnYB7K6Q35EslpA6hEXOSIGHOQ/cGEJjb
         qRsQ4+P2L7j+AWOXEai9/76ey2jBsXPoQDP7K+gzatLaHxttwkTOjfvNMTR1wqXsbthL
         DDQDVefVZPkTO6OnEJAPOzoD2mn+CUeyPjxQI8dDDtXpY9sZuGoIP1TM4SDr92jiPiY1
         SLbw==
X-Gm-Message-State: AOJu0YxQxuyGT7Z9yQyKQXrWTo4eiIWeSs4Uu0/ZmGFSwDt6NxKX/Wbg
	3v2kwbBopz5Vh72Z4p5IW0+pCdfKsJ/+EILIMBwVZfs6c6eq0GG6vUGPe4MucCjvZx3j+zTx/B4
	1
X-Google-Smtp-Source: AGHT+IGi41heG0x9At84GuC8FiNsnJlwiVP/hV9n2lz121Wj3UfxkkNbCx5A0iHKj6S8gkgFh0O6lA==
X-Received: by 2002:a17:903:2451:b0:1f3:a41:92fb with SMTP id d9443c01a7336-1f339ef1437mr75164945ad.4.1716552883732;
        Fri, 24 May 2024 05:14:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] systemd-systemctl: Fix WantedBy processing
Date: Fri, 24 May 2024 05:14:23 -0700
Message-Id: <9e3a2e143ef2aaab335439ddbe1ab976aeeed35d.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199849

From: Bob Henz <robert_henz@jabil.com>

An empty string assignment to WantedBy should clear all prior WantedBy
settings. This matches behavior of the current systemd implementation.

(From OE-Core rev: 8ede0083c28fadf1e83c9256618190b931edd306)

Signed-off-by: Bob Henz <robert_henz@jabil.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c653bfc68b06bfd4fa07ba18322599a130b1c59a)
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 0fd7e24085..7fe751b397 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -26,6 +26,9 @@ locations = list()
 
 class SystemdFile():
     """Class representing a single systemd configuration file"""
+
+    _clearable_keys = ['WantedBy']
+
     def __init__(self, root, path, instance_unit_name):
         self.sections = dict()
         self._parse(root, path)
@@ -80,6 +83,14 @@ class SystemdFile():
                 v = m.group('value')
                 if k not in section:
                     section[k] = list()
+
+                # If we come across a "key=" line for a "clearable key", then
+                # forget all preceding assignments. This works because we are
+                # processing files in correct parse order.
+                if k in self._clearable_keys and not v:
+                    del section[k]
+                    continue
+
                 section[k].extend(v.split())
 
     def get(self, section, prop):
-- 
2.34.1


