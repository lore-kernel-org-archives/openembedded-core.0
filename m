Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCE1D41D53
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:06:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11348.1765465612118881827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0dvG0w6h;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae77516so2390505e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765465610; x=1766070410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=0dvG0w6hmZ2Q3SaKJ/AsIvLrV4GgAuaRyUeN4S9Th+skQG2TzZ6s0me+clm9Enfw48
         O3t2wO5sDWPDsx0bVKJlx+1u5PK8ja0mIl2g+8RqxG3ICI4GCIwFUkvBN0ox+rpiowq7
         SHPgKUGAxwPb8SoH3za7IvPWju0F46mAS8b70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465610; x=1766070410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj9TkxFdu5isGQ9OXGna9LM1/ciFtjAxo3pry0VaGdo=;
        b=i1Hcpv2SZEzYC+MIYTFzWBStg7efSUl5FEBOdGD9Fb7ZVvkgeTYLSF9J0CBc3zMPvO
         ZKnc638bhSF5a5lXxXFSikrz6ssofkJuTpgNIR4R8W0jZxK0IoU0uujpFcUamBrRhg3o
         We/MbExs+ppJ7R7DFoJ67Tssl14uyavbGnecOXIf4ISKAAtpBwOpSAz9dZhocd+VO86X
         gwnJ4D6rOi5W6bPEgS8VYVKFChmn+LzR5sSDmNs8tQzkBua2oPxxgOLCUnSD+dl6BwOC
         0Sc3JlH9bl1bwD4mQSt6LnNorZp/Ai3pt4avMWEWuvV1fa4O46uOW8Gm0Q/jSsj5ZDPl
         e8XQ==
X-Gm-Message-State: AOJu0Yz2aeuY9F9HMM+HpEt6gFCpg/sqL6Rpeqeqh4Y+qZFJFVz4lbFY
	ChOwf8WU1VHFOXpNU+XTEGiNhNkmF++DT/nSzrfiiBZLF5E+tbat2cLHBAKL79d0pIfy8xQmpnw
	pZCMA
X-Gm-Gg: AY/fxX5e6QIGBP6p6mIx+aeiugqAnUCoEkICDYMRCOBpJkyVkLX5KdVNrSbmMt/mK42
	e8Q7YgWbR59foGwatpbaevpPG0pye4UjW1bcMcOgfIyZNoSl4KAChHSWRRR6Ilf5uMgDuT1UPW2
	PkZ2qB4MrxLhj5czNRI/yyjxy9TH3js9J7EzDhCub8SZGgKKMkjwUWu27F0R3Gh60NxMIE2z9Eg
	7XTVPLM6p7fbEY6NuSgoXLhAwlTr4zKClPbwSxYiVvkWn3lyavWWTubrTzsQOox7xkpRX7qCPDQ
	tzHn4pD80RAR8Sg2+CsiKvwJsBbS655Xrk/T9RY7G7Hk7GaI0JjHjEB2Ak7pfMnR2hFgph50ACT
	8I2tcDuDn5ny2ZhQ6fuhOFO9K3FR6ExEf2r9QJwDUokWS0loJGyQVjgbzVHQypuBmyEm+mDshG5
	zczmLz/nBh6Q5Um0PltUbajHLZ39/7q/ekcRO+qO7pt9YA+vB1KK/QFu+zVAI1RNfGx67DiEgOX
	rZZowVbVfGXrdCCUFnejw==
X-Google-Smtp-Source: AGHT+IEkmurhvbjfQuGAc99+gzpDYbzG3ghnEWgpjIkSixFJdKLgw56Qj0zAcvWxQCrFi/6dNZK8CA==
X-Received: by 2002:a05:6000:2409:b0:42b:3090:2680 with SMTP id ffacd0b85a97d-42fa39ced51mr7459334f8f.10.1765465610139;
        Thu, 11 Dec 2025 07:06:50 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-5250-bba4-03e6-c67a.rev.sfr.net. [2a02:8434:8fe1:4f01:5250:bba4:3e6:c67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm6504043f8f.11.2025.12.11.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:49 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v4 1/6] patchtest: fix failure when oe-core repo is in detached HEAD
Date: Thu, 11 Dec 2025 16:06:41 +0100
Message-Id: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227539

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

