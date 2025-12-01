Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2997FD116F6
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 16:32:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25976.1764606719953605507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 08:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qb8LMRI4;
 spf=pass (domain: smile.fr, ip: 209.85.208.51, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so891066a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764606718; x=1765211518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvMKt8L+q17DFV0JT8WPvbRvfEPNwCYznrvWQ0ld7+E=;
        b=qb8LMRI4rSUXiqQjSr3kApJ88kAH1wpiuk/9MvkV8TVsMTDESUBJgJ0m2KjeCpr+us
         9hY48r+j2ZGt/+Rrwa+PipdQcZXN44Q3XzJgLsYG4W23vX+MiXzIVsQUWdbSqnP9L1k1
         KROl2fK6LV63rSB/62SKDdJ+OGDqIebbIXCzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606718; x=1765211518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kvMKt8L+q17DFV0JT8WPvbRvfEPNwCYznrvWQ0ld7+E=;
        b=r4FOczzIIhSeHYV0rYB8V+5lbMtRNFU+A6Xr35CLqC7gG/ypJ3BvzSSoxkb4ZNAIMV
         xiTmdT/CrmIPzkSE4c26VEyamMAZcUulb0dhDnxoJXQw9+GiIjJWp6syW6WqxCLF9QaD
         lbMIYX1al8NwVQjSbCmvuBipjEbqI8n7JEiT0tlzf1VVB2znhLP9hHYE5C0ickaWgfGZ
         oHVjjh3BRu0yw888NOR3HsCLfjEyW3s8SnQV7Kfz4f67Roj6eHh4vSiRodf0KmFnXmuF
         1jqiJG2Uom/wc2zZvYkaQ9LBQCtpPZVr4NRyzy9Pn5SiDjsZbehpBqKiT5oXyJVjCD2E
         BExQ==
X-Gm-Message-State: AOJu0YwuqEMP2s4JsxGSYzBzpEU5w4vAbzmYmcAnJsz/W+CYH5xAYk6M
	m+DXDOY7CkQx8R+y44uDFMrwMd2ZgnUDwf1/z+fwdYgZMwwoGvGZ6EN/JpGGelDeEfRoBDLt7ZH
	p+ZrJ
X-Gm-Gg: ASbGncvpMz1oBEcMVDk8WlUKxZErpu9L+aS460BOz2AyGSQJixgvhqalG87Sag1Cvog
	zAm5dpnXJgHwxsg3TNB7ynKOOp2v6/dK37Sc81eLA3/jFqe11hql+HT9uMp5o12QNkLm3K2ILWf
	P26s500RpwHDrT1Sr9kOKxN0/2ysArz/cAq4vJ6gbCHGUk3Xb/HyCmRmeMAmbZ7b9FxSEXSdHv6
	kD2Uv76ELULt6eW6pm2Q6JG+R5M9fG2S98NlFqiTtkGLX58zoPEANSEpQYXhGWaRkSUky0+eR91
	wDDXWcNrjo9mEDY0ulwnhbtwvUaraiOJ2+Ku9E1XNMbI8/Okbwm+/iLzAIlipUZL3HQdjppwfEc
	6GED4JHyupsKCq/qm/18Ls/KVy9G+X6d/9qPcfbEjhJt/LwUV4+9Uug6zd0D8sFnvDy6JG272gI
	Gt+azUahJht5ycz/yM1e8tOUDtfyqrQI6Pe/s6QvbieuD49z6DlTYSH63zYX+7rKIORZXTG0ym2
	hAshqcBFPcqRbsNai8qsVbdhdv7LDWZbw==
X-Google-Smtp-Source: AGHT+IFzEQJefyr/oXzcHhGW+j37imhN3ciLp/RSlyKwuw/7vl7D94TLA9A17gPYxDs+9Nh6N42FAw==
X-Received: by 2002:a05:6402:254d:b0:643:1659:758a with SMTP id 4fb4d7f45d1cf-64554677268mr37097312a12.28.1764606718075;
        Mon, 01 Dec 2025 08:31:58 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-3d1a-8466-8f7c-672d.rev.sfr.net. [2a02:8434:8fe1:4f01:3d1a:8466:8f7c:672d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d45sm12980290a12.8.2025.12.01.08.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:31:57 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [PATCH v2 5/6] patchtest/selftest: Add coverage for detached and attached HEAD cases
Date: Mon,  1 Dec 2025 17:30:59 +0100
Message-Id: <20251201163100.143476-5-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
References: <20251201163100.143476-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227133

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Extend the selftest to run against both modes to ensure correct behavior and
prevent regressions when operating in a detached HEAD environment.

Two test modes are run: Git attached and detached, via the
'run_tests()' function.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 67 +++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 92acc4d556..c85d59c415 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -84,6 +84,47 @@ def analyze_result(results, patch, counts):
 
     return counts
 
+def run_sh(cmd):
+    """Run a shell command and return its stdout as a stripped string."""
+    return subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True).strip()
+
+def get_git_state():
+    """Return the current Git HEAD state (branch, commit)."""
+    try:
+        inside_repo = run_sh("git rev-parse --is-inside-work-tree")
+    except subprocess.CalledProcessError:
+        print("Not a Git repository")
+        return None
+
+    state = {
+        "branch": run_sh("git rev-parse --abbrev-ref HEAD"),
+        "commit": run_sh("git rev-parse HEAD"),
+    }
+
+    return state
+
+def restore_git_state(git_state):
+    assert git_state['branch'] is not None, "Failed to restore git state, no valid branch"
+    if git_state['branch'] == "HEAD":
+        run_sh(f"git switch --detach {git_state['commit']}")
+    else:
+        run_sh(f"git switch {git_state['branch']}")
+
+def is_git_state_same(before, after):
+    ret = True
+
+    for k in ("branch", "commit"):
+        if before[k] != after[k]:
+            print(f"Git state changed: {k} changed: {before[k]} -> {after[k]}")
+            ret = False
+
+    return ret
+
+def git_detach_head():
+    run_sh("git switch --detach HEAD")
+    assert run_sh("git rev-parse --abbrev-ref HEAD") == "HEAD", "Failed to enter detached HEAD state"
+
+    return get_git_state()
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
 def test(root, patch):
@@ -101,6 +142,30 @@ def test_head_attached(patches, counts):
         counts = analyze_result(results, patch_info, counts)
     return counts
 
+def test_head_detached(patches, counts):
+    git_state = get_git_state()
+    git_st_detach_before = git_detach_head()
+    patch_info = patches[0]
+    testid   = patch_info["testid"]
+    results = test(patch_info["root"], patch_info["patch"])
+    git_st_detach_after = get_git_state()
+    counts = analyze_result(results, patch_info, counts)
+    if not is_git_state_same(git_st_detach_before, git_st_detach_after):
+        print(" Test '%s' failed with git in detach HEAD repository state changed after detached HEAD test." % testid.strip("."))
+        counts["error"] = counts["error"] + 1
+    else:
+        print(" Test '%s' passed, with git in detach HEAD repository state remained identical after detached HEAD test." % testid.strip("."))
+
+    return counts
+
+def run_tests(patches, counts):
+    git_state = get_git_state()
+    counts = test_head_attached(patches, counts)
+    counts = test_head_detached(patches, counts)
+    restore_git_state(git_state)
+
+    return counts
+
 if __name__ == '__main__':
     counts = {
         "pass": 0,
@@ -118,5 +183,5 @@ if __name__ == '__main__':
     if not patches:
         print(f"Error: Unable to find patch(es) in {patchesdir}")
         sys.exit(1)
-    counts = test_head_attached(patches, counts)
+    counts = run_tests(patches, counts)
     print_results(counts)

