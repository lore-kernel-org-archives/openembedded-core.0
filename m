Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8805C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9686.1718288457357800805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NBi6eG8i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f44b45d6abso9009405ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288456; x=1718893256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lCsUZXzz1wPpOZB4v1wxAhFmq5JTCqqow3OSFMxSho=;
        b=NBi6eG8iFzoN3bFaXWbSvbzPDk6MvByLzlsEJ7ukmrQaC8uedEHFtsSwVaE6ZT2Nqn
         s0i/S7UwTjz5+rpwyzwK4qjw7j0CKoZTrFvDy/SkqcJW0nVdmNI61psl/h90sjmGaizG
         Jx4Sdj4aGGDSp+1cHQtwHSsOGGoK10SJQlOReWah7eycCsYZr/BlF6GgU4OLyZ/kUYwR
         pzpswSZfol8ZE55gf1lc+gMsRoI8NhZoeG0+AGlwSyFbs6PJ1lGPXZzRQ6K3UE3ENSPR
         rxazOm+iPaJl+FyUfkT/MpSBheM2UqWHD3xnwqQlkr6yk+d4T3Pfp121rPsDoe83obX+
         qwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288456; x=1718893256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lCsUZXzz1wPpOZB4v1wxAhFmq5JTCqqow3OSFMxSho=;
        b=fwzTfmqaVkIihDmk8WYQKg+LA/eVuAJzpH2grY9QcWbaJeToAi9WJrhj8pDnviv2r3
         vvIS6Oy8nULuiYjux1qxtQACXy71A3HDDN9OlQQB1YMtIGtMswxEcocvrRtZnnBv9isH
         vsnaEnqNl52Sj5CH44DkiVwF1X5Pw4pyvIEVF4HTSl6diNMc3Lf/RsvKEKtNxWC/BrUE
         1GS/R5DDKV1DYp1AIIykt3MTYoWd7xZXJ9p0bRWQZAksPhuT28ZrgDyym0I70YVt9XFu
         k8VTFWCmMUbNL9VlqTukL8mrON5BROFZBjoJHNOdY/DmkjlLNdSrzdVMWEKo9330bHTf
         WA5g==
X-Gm-Message-State: AOJu0YyMp00Xe8zQMWjFsawUY7DXczEU+kLV1hJZaz3nGXq8RvNIpstk
	NbT/EE61jhOamugv1PeWe/YDRkhHg9MDOEsMJ17nXhmryhc2dPqOZQsl06yu/XrbnpKBAnBRHfn
	Y
X-Google-Smtp-Source: AGHT+IHDDoAExFhDdZGT74i2LOfhJqH19YaT8M9vTtW7LU0KDblzJWLIp2QE36rfMRNA9yQJrLfVIw==
X-Received: by 2002:a17:902:dac7:b0:1f7:2c0c:4218 with SMTP id d9443c01a7336-1f83b7e575bmr50546145ad.62.1718288456468;
        Thu, 13 Jun 2024 07:20:56 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:20:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/29] devtool: sync: Fix Execution error
Date: Thu, 13 Jun 2024 07:20:17 -0700
Message-Id: <ee712c8b3c32fedd6af0521d2e34ea655f8cd5ca.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200615

From: Vincent Kriek <vincent@coelebs.dev>

When executing devtool sync on a recipe that was extract with devtool
extract earlier the following error occured:

    Traceback (most recent call last):
    [...]
    bb.process.ExecutionError: Execution of 'git fetch file:///home/vin/projects/poky/build/tmp/work/all-poky-linux/netbase/6.4/devtooltmp-figt1jmr/workdir/netbase devtool:devtool' failed with exit code 128:
    fatal: refusing to fetch into branch 'refs/heads/devtool' checked out at '/home/vin/projects/poky/build/netbase-src'

Fix this by adding --update-head-ok and --force to git fetch so it will
override the current head even if it is checked out and has changes.
Possible existing changes in the devtool branch can be retrieved by
checking out the devtool.bak branch

Signed-off-by: Vincent Kriek <vincent@coelebs.dev>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4c89b061003a0f4143c6d3838e39fc2643edc8d6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2beb058de8..05161942b7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -661,7 +661,18 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
         if sync:
-            bb.process.run('git fetch file://' + srcsubdir + ' ' + devbranch + ':' + devbranch, cwd=srctree)
+            try:
+                logger.info('Backing up current %s branch as branch: %s.bak' % (devbranch, devbranch))
+                bb.process.run('git branch -f ' + devbranch + '.bak', cwd=srctree)
+
+                # Use git fetch to update the source with the current recipe
+                # To be able to update the currently checked out branch with
+                # possibly new history (no fast-forward) git needs to be told
+                # that's ok
+                logger.info('Syncing source files including patches to git branch: %s' % devbranch)
+                bb.process.run('git fetch --update-head-ok --force file://' + srcsubdir + ' ' + devbranch + ':' + devbranch, cwd=srctree)
+            except bb.process.ExecutionError as e:
+                raise DevtoolError("Error when syncing source files to local checkout: %s" % str(e))
 
             # Move the oe-local-files directory to srctree.
             # As oe-local-files is not part of the constructed git tree,
-- 
2.34.1


