Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEB6D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 16:31:51 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25965.1764606702366483873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 08:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H0ynnPzJ;
 spf=pass (domain: smile.fr, ip: 209.85.208.51, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640a3317b89so6899885a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764606700; x=1765211500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=H0ynnPzJbP8JIFHpCCP5ODgU9oHAk7F2XkuEdKGd4hsaF4ARHmI895yhHAl9p3EkmG
         zh2PBkOgknRqjnYD0PVFCNBpH592anKvJPZ3ou8w6dSZOXdXzQJ9a7gT0WDKZLpckdqY
         An0ROt3YyVQNpHVSohfg+L/P8dK5UFg96kzDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606700; x=1765211500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=VB+9EI2wiQz1/Nz+Bk5Y8cNPil66eH4tJW59pZW618zrsD9gvXla5YRGqH41ABCpvK
         GuarjRECUJWrJoa88M1UQxFaN3+3XplqZ/TR0Eya+6+8TgE66aDH4Y1+NE0JeTYZni4D
         2YP4yiM7Khmu/RS9aOBu3mEqzYTNNafZTrOB5dWHe3ys9O6pHS9SN8CA3ZP17QS9OMb1
         EZaJZiwI+wYIEw8cYB/Ucp61UmKyOUZAkLO+/Eaii2RwUMwhaPppGIcB+0x4JzYoVb0v
         4jEZ6pbYt9gORltZvJtcf27LKrPx06M9VkdK+08cQ96G7v1VSk9gj8XmLy75al1MHxjk
         Rt8g==
X-Gm-Message-State: AOJu0YwuSQJx4Y0BmK+Bq1+g7d5Txgs3nE2qacJenB8T4HYIZTW1HJ2m
	hKeyOqtDtHiIJBtQO451VxI3Pvbxi1ybByGadiX5YRKTqdAmcSVSEy/M772akEAX9WNDJjIaSsf
	CuDpC
X-Gm-Gg: ASbGncvJUnWIAEabrOUHHd29j+yrUcZeZMiZbzHb1m1fbFAcE98inxjD/+qS1dEbKn8
	Pg9UwOmDPuDuGXSGU4TR8LprdwoCVEhD4Lvseg2wdz8/yWmEpvf5CDMz68II9dOZHYvo6/3dkRS
	Ph4cPoQw7FZwyoZY5Ed55wyqy4RWeDB+Yz7rekMFenUXShvImwj01JD2kbPcRZKhkxquU6etPRL
	/GQaB43mjfG1RRwcPFDx9j4V/6SCgtlAegXD1aSpdf2DcyXl0Cxmdr8SAMYaY0oifOaFo/8voZ6
	qelxwq1EvQaS85lxBlosVB4zeEhx9zehVWI6tuCgf+h5QRRVR9Yeg+xhclkvCuNKwfErPPALwUU
	KMIPXSp1Z6PTs3KGreC1R14yjqOAOxEE62jkuXXJ6qctWRVChiRVCS6LDLN+mvzX20Vcn8QiJUT
	2eOFzVtSCvCBLX1tHvkDzEiv231NjjZKHQpwc58odxzpIDws+a93z0iQPJuIze9a5y4pm/+Q/6k
	xPpGTOKqDUoI+yDmCMNbMY=
X-Google-Smtp-Source: AGHT+IEAApefWJnwbEpKEyOu1b/pvY742rgbqM0eM8gSrPbX3/Yg5fmgUfVN2zCjdKANY9Cli9tL2g==
X-Received: by 2002:a05:6402:2787:b0:640:9d8f:3c73 with SMTP id 4fb4d7f45d1cf-645eb799fbamr23486372a12.32.1764606700407;
        Mon, 01 Dec 2025 08:31:40 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-3d1a-8466-8f7c-672d.rev.sfr.net. [2a02:8434:8fe1:4f01:3d1a:8466:8f7c:672d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm12980290a12.8.2025.12.01.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:31:40 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH v2 1/6] patchtest: fix failure when oe-core repo is in detached HEAD
Date: Mon,  1 Dec 2025 17:30:55 +0100
Message-Id: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227129

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

