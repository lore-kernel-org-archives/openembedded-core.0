Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82490C77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 16:41:58 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.1032.1751474514724331155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 09:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=luTGdyIG;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3df3854e622so333895ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751474513; x=1752079313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k06lpekCjlPDqUV3xCAhOJe0Dl2aQRSQCNOVqej+/+Q=;
        b=luTGdyIGxF7oEiUNdZf8JWY9xfalDZfK/LZxsgf1dv+i+x2gjMwxmIGZGx5uqbSMEc
         CRrs+sp0z+TkAebX4FQZVKYPcPLRW0XBE95ZiCALLqqfKDXlbu5D9wSpbkRO5H0pgeCS
         20LekWVNJVjwng81lBoTEHr85nT1wOVhW87QqZoSLQbSrkmK28dxSbi2ZFFyKrT1IPxX
         JOqBfZv4AuTlkviTiZS1U6joIomMpGCYIM1WlmSqSY5YOC55qk2ZZ1MI/QqaLkv1eq8s
         RZRxG0QkColO6ylkfxaBtN4/TRx9nWvhRM4XLXMw5wdnwd9hsDjgxJp/x1PIhYUmaJ13
         heFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751474513; x=1752079313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k06lpekCjlPDqUV3xCAhOJe0Dl2aQRSQCNOVqej+/+Q=;
        b=oY+SpgL/gXEWz1OTykGvKoUlfB6RCK9uVORP1odydl33AUPp6poV6tGQge18YFkI+F
         HWVJML0HZfBPNOEDhVqziir99Yea/j+CRVGk/7k8FP/4w7pzqD8/w8TWVWivKrZbXzit
         Yzs+p8wuOTp5+8TvSBN7FLqoQWG9GXwzwH+usTFmlmub0fB13FB2cZXg+XVsz5cDimRv
         3y1mDgCcBO6hQKsirNd6+DEfWBFXeum6KRzPfm84nAbTLCNOwTHJEGNrjsfVwnIRMXZZ
         PINkdWa9AcPGiuHCd663sMaNNWnn5BoM7ryk6vsO9n2xcgURYAdu+cLJyBIoTpUTqhOO
         nJkw==
X-Gm-Message-State: AOJu0YyKMvM5d8vj0YTUzcvsw9o97FivkCSIEvwvQm7K0LSwE9RtQC+J
	QJMVX8+T/gPw6HdYOqv6wGG3StyREi4+QprbV79nXXINwVVCqrds0fQA6yy9lA==
X-Gm-Gg: ASbGncuB8VPZhiIcHjuGxfO06glKHNRs3yKeSmSaYGIeUdHBWEOfcU4Ss3E+WmqLAjF
	uNs/Zul/EB6z/mhZC391hBr50x4Ed3o9p76p8Jga/+SvCnbGD0BncW0ouZVhx0N3xVXlkOvtf2z
	ZcxRKXzQboGnGJigS/DI2q6IXS8dAAeLyK8jNUVhvf2a8+7O1SlbCBJJ7CVlVteZTVKVcTXCk8E
	pyZT/eKEbq4hg2QVX1M28+R7OhvQU6B2W5fgmXyVmXjf1upiw39wNPZw+fhE+mlBXPvFhjXL1R1
	nRGDMPR/i67poVd7iahKsmm8hK8YoiECgfCnjq0QbbiL9z/pIINAix3/8WxJ
X-Google-Smtp-Source: AGHT+IGWX69svFsgClS1/mkvhiVg43bEcZsZbj87mBZWvkeuvihElo6EbCge1gZrD3S7w6WlEWLWaA==
X-Received: by 2002:a05:6e02:214f:b0:3dd:bf91:23f7 with SMTP id e9e14a558f8ab-3e05c3503f0mr3284175ab.7.1751474513240;
        Wed, 02 Jul 2025 09:41:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::6df4])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df49f2f20csm35442635ab.0.2025.07.02.09.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:41:52 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] devtool: Handle workspaces for multiconfig
Date: Wed,  2 Jul 2025 10:41:47 -0600
Message-ID: <20250702164147.472067-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 16:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219849

If a multiconfig recipe is passed to devtool, find the correct workspace
name by removing the multiconfig prefix

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/devtool/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index fa6e1a34fd1..c9d7ade9ff7 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -147,6 +147,8 @@ def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
     Check that a recipe is in the workspace and (optionally) that source
     is present.
     """
+    import bb.runqueue
+    _, pn = bb.runqueue.split_mc(pn)
 
     workspacepn = pn
 
-- 
2.49.0


