Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12875C47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 10:35:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.12991.1704623694394247981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 02:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJnJL/v2;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d5f402571so13128705e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704623692; x=1705228492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkGBYuw7stYXMtFp+VPG7GvfPRYgcjWDzVyxA7bGJ8Y=;
        b=MJnJL/v24YgumZ7k5H+6PwTjnfg7A38KJf13jnbPh2Qj+fCbmQmuZySNBWBZrH9Ggi
         pWqDMVF5AtZv2gOJASDpT+/iKo46zSb4INwTHFQUUjMm8nYLTpSei95k2v21OS764caw
         YnC3vuLshtugmwlVPYhnfVGjPZ8DNQIAHNAfiS5umtrx7Z096k6KYj1b5RMa305yl8SS
         179tEDDwu68f99FwRpBKpS1c6w6KXXhjas3H6WsUPLHSsVvQVysuomEywxxDpPbEXVFb
         YFtCE0kG0PXLzVeX/hor7SDC/gcU15vyHZkN2xiVx9oJvfMtVBlCsBkSepZrDSel6ERY
         Oinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704623692; x=1705228492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkGBYuw7stYXMtFp+VPG7GvfPRYgcjWDzVyxA7bGJ8Y=;
        b=PCHj0csVdqY/e8ojUPrP1eO/Z0Yt49gZ70fYxg+q9GlJb2L2Z82qHp/zHzTWiaOdpG
         hTZ2BVp+rAVPtpYJvuQUaZqiuOdD46QIAR2DCyKS1XY/ISkDAiOo/R1qY6FhOXG9lKBc
         mnsn1PQUl+3DxwhdgJLtXiMT5u/AZUYGBUdu30qRe+nMdz5MLLjhVlxu3hZHk9sxhnQ1
         hMIICZCu3q8/8h6aKdiCy3kWIYBVaqN/HpyqKHxsimRsU10sNDNv59yC1aSIqFyymg6v
         uDuXksC/CBLChACAr3/rsayZsDYz1/XQXz25L69bqouDR48geZoY9lD+ogbxG+zCIHB7
         NT7A==
X-Gm-Message-State: AOJu0YzVV9boVzc1UIe/4TldW5f/nAK5DFwbrtFKqnbFeQsZDORZlIUN
	xi6c7fW9hbQbi1i1zI+q2HFOcDAlEXM=
X-Google-Smtp-Source: AGHT+IGJGZM9mruzFtlHz6ucc00JjFiH3W602PCtBDTCAH+hBYmXhnAB/vQQe4p2qymoZgRmosR98A==
X-Received: by 2002:a05:600c:1386:b0:40d:8794:8535 with SMTP id u6-20020a05600c138600b0040d87948535mr956395wmf.160.1704623691845;
        Sun, 07 Jan 2024 02:34:51 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id fc12-20020a05600c524c00b0040d5a9d6b68sm7285846wmb.6.2024.01.07.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 02:34:51 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] qemu.bbclass: fix a python TypeError
Date: Sun,  7 Jan 2024 11:34:48 +0100
Message-Id: <20240107103448.9844-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 10:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193383

From: Ming Liu <liu.ming50@gmail.com>

QEMU_OPTIONS can be empty which will trigger a exception TypeError:
| can only concatenate str (not "NoneType") to str. Fix it by setting a
empty string.

ALso removed two useless blanks.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index 874b15127c..dbb5ee0b66 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -34,7 +34,7 @@ def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
     if qemu_binary == "qemu-allarch":
         qemu_binary = "qemuwrapper"
 
-    qemu_options = data.getVar("QEMU_OPTIONS")    
+    qemu_options = data.getVar("QEMU_OPTIONS") or ""
 
     return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
-- 
2.34.1


