Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D0DD3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:55:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5199.1765277743712778945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HMDA5fsx;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47118259fd8so44594435e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765277742; x=1765882542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBLTGZNLSPZEAMHPCdlWjaMHwlo7lsl/mMKKYW3VfQc=;
        b=HMDA5fsxzFrH4KsbhXxKUa9/1tHz7IK+VSAdaXle5heUYuf36vsSiU118nUGizw7qP
         QvI3gCQd2wY4PWxaH/tWoRlCCrEYytipJrZ1yLWYVxEpLmy/gWpYwh9IzRbaVcpWoUmD
         XjpLdZcRH0PLmfTFVmOsKnOVXdsSEbsasnAcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277742; x=1765882542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBLTGZNLSPZEAMHPCdlWjaMHwlo7lsl/mMKKYW3VfQc=;
        b=cwpU/zGLHDpa98C4uNQYHRB4lTK/LIJG0pqASi+gCLrAQnoHnYqb7zN6ZkmSaKkWiP
         Q3GntswmEIXjuw4sGeKgpZFB3mr5eNS/zkX3KCJN9RFin1ME99oONVA6Lod3M5gmSgLT
         G/6BxZsLyH6KCMC5EHnCOmXWtFMcASQkaZg0wZ0DKZgP8tkG11xq5laZ8fOy5bdwhgkO
         jmomUCTA9qYjcSKQSSjloadylvi+EqIOtG6vTCkufmFA6ABXRtTxV1v1GXgXLooa8zkr
         m7sJyLevx5DLjwMgzpl2Yp84Sqeprp3J3fjgNAXB6cqDUXote1Xw7ikuJGbyJ9D4G/N2
         bFQg==
X-Gm-Message-State: AOJu0Yyvi062cuAv+pAAIwMYj8Tn4iaMj6fFOPWQrFUFWH6Cn/wT3GV1
	az8NM+pT5u0l2oPvfVZwdVCJqSAao+ZdIjDC9wbgC/oUo8v/IUvhrZOHhRtMtgJNrvc4DGAJ+gd
	ha3+R
X-Gm-Gg: ASbGnctopEZFQA+0JomxqEyVY/AVU0uUhxiKFsSt1rbCgOgeku94kaLCxJk0HpOVZ3f
	LhCnOb2SKQ1BveBx8TdKDnn0uf5Fz2fCiBge3QMATLtObD5FzWoyFKebCmyxpcXQfNQTU4RhtDl
	t6J//e2jrErJSqAMBBVvA/qX8Mx49BYVueZtmVJZ6ywXQf5wJ1P4Oqh0P2eIMJnWoA9i13nsN5l
	2j/6oDZH2UiuvNaUs58ARL3i8f2539rvgJPOYr3D6LwhGclA1/qfgZFAhmwa4y6RntvGqys0pG4
	LA8uoy0NYiCX8ui9RlDh0A/fcWCxY0yruY3h6k3IrpDSgvsaC5ydEOYiv2E9yb9pHxPau1LMJVn
	iUHxm4aIhKPXPJ4OV9nLmqeA+mBwgbXq4VYWlQt695WTVDyrZnbfJ6Z24F3V2G/RUfnS8NOgQoO
	SBE+3W675NFnKS3Ng3bQ68a+0G85JgzMEmn8OlMCJkwVWJwj/12g0INRj1NJxjMzLtEOrhXzADf
	+foA9seBI6YcUUoWP1x3eQ=
X-Google-Smtp-Source: AGHT+IFek1OV7pbv8TyVfD3d9zY1ecY+j3eVvkJZJIEy7yz2y/j0UlDAfvmgRwWNz9UAC2uhGB5WzQ==
X-Received: by 2002:a05:600c:4586:b0:477:7658:572a with SMTP id 5b1f17b1804b1-47939e27924mr97112595e9.20.1765277741938;
        Tue, 09 Dec 2025 02:55:41 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-fc4a-65a9-382e-6f5d.rev.sfr.net. [2a02:8434:8fe1:4f01:fc4a:65a9:382e:6f5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7435sm17412895e9.0.2025.12.09.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:55:41 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v3 6/6] patchtest/selftest: Ensure HEAD is attached before running attach tests case
Date: Tue,  9 Dec 2025 11:55:13 +0100
Message-Id: <20251209105513.273859-6-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227430

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

If the repo is in a detached HEAD state, create and check out a temporary branch
to attach HEAD. If the branch already exists, the error is raised via run_sh.

Add a check to verify that the Git state has not changed before and
after the test in the attached HEAD.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 74b50f65e9..dc8a636821 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -120,6 +120,9 @@ def is_git_state_same(before, after):
 
     return ret
 
+def git_attach_head(temp_branch):
+    run_sh(f"git switch -C {temp_branch}")
+
 def git_detach_head():
     run_sh("git switch --detach HEAD")
     assert run_sh("git rev-parse --abbrev-ref HEAD") == "HEAD", "Failed to enter detached HEAD state"
@@ -136,10 +139,15 @@ def test(root, patch):
 
     return results
 
-def test_head_attached(patches, counts):
+def test_head_attached(patches, counts, branch):
+
+    git_attach_head(branch)
+    git_state_before = get_git_state()
     for patch_info in patches:
         results = test(patch_info["root"], patch_info["patch"])
         counts = analyze_result(results, patch_info, counts)
+    git_state_after = get_git_state()
+    assert is_git_state_same(git_state_before, git_state_after), "Repository state changed after attached HEAD test."
     return counts
 
 def test_head_detached(patches, counts):
@@ -160,10 +168,13 @@ def test_head_detached(patches, counts):
     return counts
 
 def run_tests(patches, counts):
+    temp_branch = "test_patchtest_head_attached"
     git_state = get_git_state()
-    counts = test_head_attached(patches, counts)
+    assert git_state['branch'] != temp_branch, f"Cannot run patchtest selftest while on branch '{temp_branch}'"
+    counts = test_head_attached(patches, counts, temp_branch)
     counts = test_head_detached(patches, counts)
     restore_git_state(git_state)
+    run_sh(f"git branch -D {temp_branch}")
 
     return counts
 

