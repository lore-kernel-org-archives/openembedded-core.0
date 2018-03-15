Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC89B78910
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 22:50:11 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id n12so9940463wra.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QEO+oi4QIyQn619YTDiEFkkS8u7zAQucxopi5rhQ85U=;
	b=Yce6AV0h9s4F3AisMkOYAR2xn2nMtrA6fbfQLnzeE8n8j6EAD3VzEuGXNfkcv4F4mk
	tHKqmunEyk9t7+tRyPbzhAKbV2kOahfygT5BFwMxxdfAB/N0CIkET0tAg4hrxxA1kLAr
	46rLo2WJKMKkQPyjdYDvOZw6Nm/6ezmyWekrq/hP+DMZxNlRWGvq6xidXa1TO5myQBN0
	6xJTiLA33RotyRL8s59rQ6Jff/jOp1ntIv7+Eaz1n6CGpzBJMC5zsl6pflwlmycBm1T8
	+9ytCUHA82OwJ8ldzClloaKygYSx77ZGm1jptaYNLhDqerL0P8yc+UI75eDVHWcFcLx8
	tjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QEO+oi4QIyQn619YTDiEFkkS8u7zAQucxopi5rhQ85U=;
	b=LrIpA4xXu0r5yj7vB+a/vxazEQ08HwBG1FfY7JecuHQBUSvUabP2Mkn6dPv1B62hwV
	klPMhWg7oa+uacPtOCv709Bklyz21RmsPVqMxUIZ2mlyTedlHwcT9UwespTHnsmo2ppp
	LUuE/TLTO0dFS3VZvqbyxqmjcRh2Wci9YQ5cJk7yEJXXzn3z9e/Nmh1fANpsiXzDb8Fg
	OTwqFzcrAFhy2zVx2ySVhoC66z5kA3E6ZWW/5aQwkJ+k7jOQtB6enfGH7ub7oKIbA3Nz
	13EMqdW54USds8T5bKhznRdjQfUBF98qFnq2fDcP8BCokBqMg1iE92xgpeSdZTZqVWXv
	N+SA==
X-Gm-Message-State: AElRT7F2G6oh9gpVSz+5kyCXJ5aRVTkYCiKuURHkqVLGKCaoFlrEQtJD
	PN3MADeT6shy6b7KS6MQogYUTg==
X-Google-Smtp-Source: AG47ELuNMhVNx8K6Eweiz21D8FDIGJ2SK0lSrD/loFOO6NWdBLJy3TiL29PGBQ1vq6OTUzb4EcV9Ew==
X-Received: by 10.223.133.70 with SMTP id 64mr8784392wrh.164.1521154212201;
	Thu, 15 Mar 2018 15:50:12 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n64sm4687096wmd.11.2018.03.15.15.50.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Mar 2018 15:50:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 22:50:10 +0000
Message-Id: <20180315225010.48-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] patch.py: Use git format-patch with --no-signature --no-numbered params
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2018 22:50:11 -0000

* --no-signature saves unnecessary .patch modifications when executed on
  host with different git version
* --no-numbered saves unnecessary .patch modifications when number of the
  applied patches is changed (the number is still in the filename so the
  order how they should be applied is still preserved)
* both options exist for very long time, I've tested them with git 1.9.1
  from Ubuntu 14.04 and I'm quite sure they were available even in much
  older releases, so there shouldn't be any issue on relatively new sanity
  tested distros

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index bfa7d21879..af7aa52351 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -448,7 +448,7 @@ class GitApplyTree(PatchTree):
         import re
         tempdir = tempfile.mkdtemp(prefix='oepatch')
         try:
-            shellcmd = ["git", "format-patch", startcommit, "-o", tempdir]
+            shellcmd = ["git", "format-patch", "--no-signature", "--no-numbered", startcommit, "-o", tempdir]
             if paths:
                 shellcmd.append('--')
                 shellcmd.extend(paths)
-- 
2.15.1


