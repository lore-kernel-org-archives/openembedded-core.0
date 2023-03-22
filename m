Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A619C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:04 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.44009.1679494920781267003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ka7UrP87;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id bc12so18819090plb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW7wNNAWR0Fr34lVIxKK60TKG9wYmaMrYam0Ves1xLc=;
        b=ka7UrP87TtuAagFpw58B6Dwb+6YL13SHMb0Zz6O/NB0Td/d7Wqj//nk4V0bBRWnfMN
         Ilk2b1LhEg3+5xM2CdkiOQ7SE+Jxi50eAOq8T41hPj7XsQsQX+LVmx730g4XRCiQO1KQ
         wCwnwVC2zbTskhLdIcZ8AJmai6HgQpLEYJBcoxbEQnFbWI82BKsSlXZKRlQt+dEBg+wZ
         T+l5D2leBI38Oi9EYMMBFo4mqz1qNwhbvqX/Wku36Ltwf9NrojiYp3RkxFQminh9beo0
         g55ZKq3EN2BGqtlXfJA3EQdWnLdnMj8Tcywyn8I8tn6u1ETzJwMICQra9/nfyklbFOj+
         3/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iW7wNNAWR0Fr34lVIxKK60TKG9wYmaMrYam0Ves1xLc=;
        b=G64XPkvkXHvI53rBKzbmgzow6WunhxN6G244xxbAsvuWceCPXjRomHc5vSx5m4qFh5
         XnmhNlaIk1dcSOkzbZwvnVzJ7lkWPnYm+5udy+alevK4Jz6TZFuYHOJlGE1OddGZibZy
         GIT2aXXiRwMY0X7VsL8gYNNTdUfI0rbaL4CuVBQyt5Z6ZaShux0NKNgwShXFVDP3vvdM
         d93nw4hK8Xn+d95U9wbdNqQDsSfnv/xhm1+Jtd8hcAMdC5yJ1zTRDQyHkTOTs3/j8xLa
         hhUQMmzIG61NNQlKgKDEKtMM33Qmj1ADQuAh8txr92Lnig43RYNbxF03GOdgHVPxTOiA
         Anig==
X-Gm-Message-State: AO0yUKVLIBRcS1apekuqRjSjW2+bgI3MV+udRnKTU0SzDU3ciaUDZI+M
	lxlYVuDh446N9jr8vvCcCGOvUcTviafU6jrJ/ag=
X-Google-Smtp-Source: AK7set/fajJAISRIWSOQ7f/8HAHIJ0mLKC2JNf1/OzeyldKM+xUSuDZ8gy5LgdT/XdBF89rysicKUg==
X-Received: by 2002:a05:6a20:b214:b0:cd:5334:e25e with SMTP id eh20-20020a056a20b21400b000cd5334e25emr5282612pzb.17.1679494919871;
        Wed, 22 Mar 2023 07:21:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/21] devtool/upgrade: do not delete the workspace/recipes directory
Date: Wed, 22 Mar 2023 04:21:25 -1000
Message-Id: <bb350782ba1a66f1cf0d3e043000f5e1535cf961.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178931

From: Alexander Kanavin <alex.kanavin@gmail.com>

If it exists, there is no need to delete it, and if it does not,
devtool prints an ugly traceback.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af82e59e8f08369aabd5fa6eb43022982d4e59a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


