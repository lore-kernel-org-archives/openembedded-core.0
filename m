Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5C6CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:10:47 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.8213.1759410638548665952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 06:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qQIR86sF;
 spf=pass (domain: smile.fr, ip: 209.85.208.48, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso1780109a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 06:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1759410637; x=1760015437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=qQIR86sFJObk2a77iuVN6bxXM+ZYBfywZkGWxeXavdkCQzgF+h5iZiZLbhA7gGvB+j
         d+w9OhXXu0KBJADwD/NmitQnMGxgAwCQdwfB83fukHxVNYvNPJiuIaf1S5qeWFjWjGC8
         R+GYF9E1YfDXlTHwvPY1ZJyKJS/d07q/4ELFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410637; x=1760015437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=URnLr+/J5Ei8aQUVk96nCCj7IYtt/mdDPLgXIzjmaO0kJE/9FyvtJiKIDaDpz4No5G
         IMDcyRtvJlA6Ju5LSA/H6zrajBLwFgC7gsA91yZBzAkmrypVqv2IzJORi86ES2aTUBJs
         xKoqDKFqNmqn6fYWRNDNw05muqJg1jNmM3m57r/5+l/SNRijFbQfO9QAGEkLsNU2xRZ+
         a+o803GNqnKUBHDfzzBmTd2q2K+D7aV1yueGAJqwvF50NLqKes/ijXVdbaQExT2X5R4z
         XgEy6mtkpoJuhYnk/useyCFtpUghxvkMzMPO1SH9a2iH26zAfDieRDd5CXZRe5/dRcU2
         dMNQ==
X-Gm-Message-State: AOJu0YwQ3IaFWkz/GyEnB5sghDaYS9jc2Q5p/wgX8G+km8KGCS0DGBZC
	L4qW1c6zeB4xfsANrcYaKAjeCtcE5ce5TD54PJbAyQB9TvI1qIaBsYACMgMqIZG8QSQdAOqKSxh
	7w/RC
X-Gm-Gg: ASbGncsqBWMWwaXcGpDplL1InsDIvfojD0K3SmWURey0DbBoReVM2plm5AhDnvLMDzw
	wgLr4VBoUtDLtxCrhUsqiAqHfcsV22Lx735pLM1wJY7zlOFNffNMmrTmQ6vIvdQaVvTyxlVdHXF
	nf5dqVJB0ZwJ45R3QAX7hT+7xihCIx8G9+bohT8aty44E5ZJTVV4/wzKDz2I1CNaSEYDE/Ju+95
	ddLAUrGQytbaFPj/xUAgIfH/pS0+fK/YpIrFeBQoaK/UdLaz8UoA0DTpeX8AwQjla6ElL2mwSHj
	AgKWrccRi3HaP64+bPXDvtvyIrtjBZraZWZ+FD5UUc8Gt9MYc83IUG2LDOWnffNI5OHaJiNGcy3
	NAjP/fEF9hrgTXlKbYVuoDv3eO3dTIOthNT/Qbk83WrIQ/d1ZRSvAv5GKMvsQp5gJo2TGUdf9Cz
	iyUZoCxb5B+kZiNU7AUOPLgymdGPhVqAfqYO7WDA2QjEUlsEt0PvdgHak=
X-Google-Smtp-Source: AGHT+IGn7iHOZ29wJjKrN/LwpgKYn60D7zqo1dOGO6fNJGmH55z4vcgjOa8ORbopYK/kMWyaNTK60g==
X-Received: by 2002:a05:6402:254c:b0:636:67c8:59d0 with SMTP id 4fb4d7f45d1cf-63678bfe9d1mr8573518a12.10.1759410636708;
        Thu, 02 Oct 2025 06:10:36 -0700 (PDT)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-6026-9b79-a82d-e35a.rev.sfr.net. [2a02:8434:8fe1:4f01:6026:9b79:a82d:e35a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aaf87sm1872187a12.4.2025.10.02.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 06:10:36 -0700 (PDT)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH] patchtest: fix failure when oe-core repo is in detached HEAD
Date: Thu,  2 Oct 2025 15:10:24 +0200
Message-Id: <20251002131024.48843-1-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 13:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224357

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

