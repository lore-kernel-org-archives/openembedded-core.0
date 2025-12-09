Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E384D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:55:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5062.1765277740868235312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:55:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lv50/JLJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so69695495e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765277739; x=1765882539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=lv50/JLJSZsLNZlJtcvolgRtDgzC0PVzSXkRmMUTcLHq44FIOAZRTIV0A1dGPJ/jt2
         /zJ2Dg03D7UujV54GKtI30zgmi5+jjLOWO5pgObY1ZeEXUUJ/LuGRnF2whlCGJ5InS5+
         kNc3J+8ePUpsG7Yyb3mLw8L5s80ObXxoGvKW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277739; x=1765882539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=vXXSBrVMrXP/9nE1H3LRmgITgG5gA3dNDxTgbTq/tpKGXIe/OFg9XVmQD99vDLrhJ8
         nZxR2OlbAE7DxShWjpi1cX/4tfPXtSDl37kvHOos5tiea+h/kko2QT5rdcLan6gGT5T8
         1s7bSMPYOxSEbnD+LJ2Xjh/yynQOxd01bSjhbPKqDrb1bHWgT2zONbsIA2+8CmXPRfc3
         UfyktpI+nOdVpJ63MjGCmGVEYSZmUbzpp+AXZeenLNQRoKfP1+tEwHm/dAnx2/OLr/eN
         kKHtxqaFfoEyo2HlkoO76fIXTnnVil7oZNvrjc7K3gsqEufpRFZaJDBOJCVAu6zkFhPx
         WlAA==
X-Gm-Message-State: AOJu0YxyxHMrULM8XbCIp/h8yvnl9e9g5cCklOVso9Gx73Eny3cc35nK
	MoOd9ex/iNEfiR1YZ5ptoL9DrtOVXyPBMo53zeE/q2llCestbXZyIbZuG64yvV5vCAvjHO6AbrN
	ckMxJ
X-Gm-Gg: ASbGnctg4hk+ZHjBv28SUKAmjmLN3RPIJUkbffNe1CK9gbPlmV8CP8BpgXdJoFAbJZP
	5UA2ptHWY3qwg9kKV29mSAXaJZMZS87vtiW4hMd7cDhMcpV3SWCHe/JBBW1BIaDxsSVhxxqHl/l
	ZIL44zKaB3e9slHlvkOWkqahKISwrGq4Lusw0RS/liQMxmrFlH7kZWEZY/RQSKWedsNO6FvODA9
	xT5uJw/VHheF5H0TUkOtbygbXXOXqpLMLIno2rdyUzOtft1q6BeId9uqfum3GrlD5ub+0sj7yVN
	xeRr7BNSHBM+5+eq5oXq92gtjD6vL3YdbVUeVD2zZFpDjhhu1yt//l0JNYK+A+dlX63A0cIEVIE
	CiiLYXtHDMl56aSeY9HHIMEA6bIgy2uuHTDDgvZQQzeKOWcFjuUMGCEgi4d12hBgHQ7VSEYHMiZ
	xt5JGtsxci8MEoGdvXtOXv6rztfqN5NVPN6BsAAzVR3VEJDot2Ld5dwTlucaUPn2sxPVyjRZfC6
	4nr2SkuPkG7VNWyNhomoXM=
X-Google-Smtp-Source: AGHT+IGjfudUTfqG0rlH2Trp5OflUYBWQXlPz9wiOuNHDXt4nJn8x+CdmhD9PQylMMMp0SVhG+M4Hg==
X-Received: by 2002:a05:600c:8108:b0:477:a977:b8c2 with SMTP id 5b1f17b1804b1-47939dfdc1fmr96156745e9.13.1765277739021;
        Tue, 09 Dec 2025 02:55:39 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-fc4a-65a9-382e-6f5d.rev.sfr.net. [2a02:8434:8fe1:4f01:fc4a:65a9:382e:6f5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7435sm17412895e9.0.2025.12.09.02.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:55:38 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v3 1/6] patchtest: fix failure when oe-core repo is in detached HEAD
Date: Tue,  9 Dec 2025 11:55:08 +0100
Message-Id: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227425

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Patchtest fails when oe-core git repo is in a "detached HEAD" state:

Error log:

> File "/usr/lib/python3/dist-packages/git/repo/base.py", line 881, in
active_branch return self.head.reference ^^^^^^^^^^^^^^^^^^^

> File "/usr/lib/python3/dist-packages/git/refs/symbolic.py", line 311, in
_get_reference raise TypeError("%s is a detached symbolic reference as it
points to %r" % (self, sha)) TypeError: HEAD is a detached symbolic reference
as it points to '3dd31d3b29730fa1130645d76bb71914ac036335' None

In this case, no current branch is available for the clean operation.

To fix this, updates the checkout logic:
- if a current branch is available, use it,
- otherwise, fall back to the commit pointed to by HEAD.

This ensures that the script works correctly even when HEAD is detached.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/repo.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 2cdd6736e4..6a7d7d2d3b 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -21,7 +21,12 @@ class PatchTestRepo(object):
         self.repodir = repodir
         self.repo = git.Repo.init(repodir)
         self.patch = mbox.PatchSeries(patch)
-        self.current_branch = self.repo.active_branch.name
+
+        if self.repo.head.is_detached:
+            self.current_commit = self.repo.head.commit.hexsha
+            self.current_branch = None
+        else:
+            self.current_branch = self.repo.active_branch.name
 
         # targeted branch defined on the patch may be invalid, so make sure there
         # is a corresponding remote branch
@@ -80,6 +85,6 @@ class PatchTestRepo(object):
             self._patchmerged = True
 
     def clean(self):
-        self.repo.git.execute(['git', 'checkout', self.current_branch])
+        self.repo.git.execute(['git', 'checkout', self.current_branch if self.current_branch else self.current_commit])
         self.repo.git.execute(['git', 'branch', '-D', self._workingbranch])
         self._patchmerged = False

