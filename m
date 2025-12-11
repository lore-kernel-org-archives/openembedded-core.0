Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA7D41D57
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:07:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11402.1765465614488200924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3qigTea2;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso1711385e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765465613; x=1766070413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3kS3vunvv2kQRP1rLXVgo+ylMa2Jc/DyHA3Yh060bo=;
        b=3qigTea22fHH6z4gQLh0apTTp5amtuctGMBU58kaenG2tbI+4j1IicK5MphBpuhna/
         3Rrn57jAL/4IvlP+IIhkAxpSy2ohRTfq/mnlJ97K04SlLVSfNCRsgwtYQp9AxF/D45Mr
         BRZYCzQ4NzSLDvKeZth+v/GGmIK+BzHx31BNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465613; x=1766070413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E3kS3vunvv2kQRP1rLXVgo+ylMa2Jc/DyHA3Yh060bo=;
        b=YVyYjaDeaFiWDUUvSqxvy3xcDQNvKUzzFvqXxCxI/L7497LBofp/I12KwBch3mTO/o
         2iem3tIUkXG5ejckCHMAIo2Ck0K32cpX7pylEvTafPU1++E1nm1eKx/tMTiKcYCIxcIl
         u7HWnAykZ4uHfUIQz56Cd7AJk/fic/fhMK7TYFWoDLhOfnkCg6znENejkFhRDnVe+lQ0
         IF0gGPFOJHG3nH8/Bt8xLHDV1UimFd9w9KAjBx79MXahW3bcwebJ/nxstAHB+uO8Kk5M
         IhvEiQRGzDJ0NJBROnyvYXC4p+NnwTQxTb8TYuAM1xY5SyqhPW2BYBrTGnjyu5Ky5aWe
         54ew==
X-Gm-Message-State: AOJu0YzLdjj7TeOe4+xCS2r0mXTaMaPCaQVRp1apx14geHKDls3UcyGn
	RZkf7vDlV4rFfrNN7G8zoSTrWnQVUV8PWQsQ1uqFvZeeyQgqEY9W/lktiK3lnJJHbV/3AawH6FU
	JGf59
X-Gm-Gg: AY/fxX6so8p9SCv6jgUjHL+jo2Znrka9XErVGpwFIpqVmyg+PmjTEGQgjFpuTnN+pX4
	IsuZ9mrcWJGc06/RA8mp7w0hNQF3S7SWWaJPcRt4v2OJKcXZOyJ4aYeQ0Ecaf2SoWHu9oAtpASk
	x52TgjO+r39WCxBq77xG0yRqMvjBHZQZmHURLbnBlPyy/Aed1MUVLvxIOCkNnL8n25/V7WWzNQD
	qY1KYbfu5DY3SOL1eY+vtaTHLc7qWIsROYHaVVdXyP8GYsual9HbL8hh/O3N8JS1PIXgNCXB3Kh
	A9qeB7pvi3XKbdz1qENcbyq2Vkt6svKJzTFOs1dfR9JQRcKFnwQPSR2ZeIGD9D6ndTsT4t/u5Y9
	dgi71K3A0VYsndqWOeMYrrpUhvcZTcae/2JfnmFIxJ3jaMBU8lMhR9lroHZT8/22/+kXenUBaRY
	oIv/p7v0wdpS09xQkHAcN15qUP8pTfaB6RILj3KeF2Fdnnw9ARqmAxXhtzYz2jUavlBt4Frd5kj
	kPkVrJfr3AQtFClHNA5/y/xLw5mn6dZ
X-Google-Smtp-Source: AGHT+IH1xk7J+PROxOyUNfQXdeh3fqBWUsPMk2BSQmJkcB4MR9r8x/LG679MGbLr0/xIl+2MaiikiA==
X-Received: by 2002:a05:600c:4851:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47a83c61a6dmr38039145e9.36.1765465612627;
        Thu, 11 Dec 2025 07:06:52 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-5250-bba4-03e6-c67a.rev.sfr.net. [2a02:8434:8fe1:4f01:5250:bba4:3e6:c67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm6504043f8f.11.2025.12.11.07.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:52 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v4 6/6] patchtest/selftest: Ensure HEAD is attached before running attach tests case
Date: Thu, 11 Dec 2025 16:06:46 +0100
Message-Id: <20251211150646.2647853-6-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
References: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227544

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
index 01a0888499..43cccf4c85 100755
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
 

