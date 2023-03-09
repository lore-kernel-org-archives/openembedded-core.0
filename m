Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1548C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.16012.1678375206331469382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U3yzEZh8;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id j2so2224792wrh.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PunAzaCufJCJQi9WZNoCgJwGhqV7JsAMOHEc3pVHTA=;
        b=U3yzEZh840R8LKbCZWhAuvVZkNfF14fqdCm8J4+yIUTSkLADvraDeDlMZiZBXdD6od
         Tv3F5dJLr47GIhgSzeEmyCIm3ypjV3w39IS/xeVFsi2Hytz8ztCObUzbYWBvmV1f9N8L
         TNud33hhF1l1Dy860w+CvUCb2rU05z4rq47S3pGG9CjSp8vyJ/5A7d4tZ9k8pXigzUjB
         53ah+sOBO/ZolXtsw19wJg0cVLwcuCNl79qF9bobcoAsiJ0C5bG78CX4hYx9qdocaykF
         NsxcAdY7xD2tt8aNOARXfII2ZJct5/WF7aYqgEvSFo7LhLdklw3aXrSGq1nWlAmZ4gwv
         prWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PunAzaCufJCJQi9WZNoCgJwGhqV7JsAMOHEc3pVHTA=;
        b=sY77Ld7NAUvwyDcYLDlUHbduGbj/eW110Qv3yXoXteFsRsXQjnA/FjPFKKqHXRjN70
         3HOmzIUXm9xcEoVil7uOYkWiq4ZzaB0jwrqu+ElxZQApM9bZ7RciQ0aHe6xqLMG/SuPY
         2OWeJ63WwhoCWNS82993DRAjXGv6TONkc2Va+nYWhUX2e0QCZ4YENS+n2PEzL+DTthTi
         OJuX5phr5i25LMf/Aeb8f0GRCDm5ndgDdgFeK3Wwm/8suY+sL0eBDKdqSyK84rx98kE2
         UQCFiP9uaAePTZkeDj04lH7Pg9k5oCeI+pSOI2p70XeUy7fZpXY1IUdIbCOBBXXX+EOk
         9SUQ==
X-Gm-Message-State: AO0yUKXDJmmA4Q80Xfutx8Dw01ASPjwnotJY+W56Tq0MGW5UO7fPZE2Q
	Ru4RC0ywwHtB2VbH9R3bftIE8sZs6t4=
X-Google-Smtp-Source: AK7set8VLSAxcQp6qyyHcd9qKS26mgzD/XuG4N0Q7J9mcqVGmVCtSJddr5CR6U8TLokUOGGMlk8DnA==
X-Received: by 2002:a5d:6543:0:b0:2ce:46b5:8c42 with SMTP id z3-20020a5d6543000000b002ce46b58c42mr13560532wrv.29.1678375204670;
        Thu, 09 Mar 2023 07:20:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/26] devtool/upgrade: do not delete the workspace/recipes directory
Date: Thu,  9 Mar 2023 16:19:33 +0100
Message-Id: <20230309151958.3619193-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178226

If it exists, there is no need to delete it, and if it does not,
devtool prints an ugly traceback.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 967d157077..6c4a62b558 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -125,11 +125,8 @@ def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, rev, copied,
     return af
 
 def _cleanup_on_error(rd, srctree):
-    rdp = os.path.split(rd)[0] # recipes folder
     if os.path.exists(rd):
         shutil.rmtree(rd)
-    if not len(os.listdir(rdp)):
-        os.rmdir(rdp)
     srctree = os.path.abspath(srctree)
     if os.path.exists(srctree):
         shutil.rmtree(srctree)
-- 
2.30.2


