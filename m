Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954E3D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:55:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5064.1765277743269902682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2dDnXpCq;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so42636555e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765277741; x=1765882541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGQlNp2uNdzR9boq3JF5o7GfOo+2iFUN3orS5SRXRIQ=;
        b=2dDnXpCqNq5UJFljTN11KI41cl74WJmo+zWAMiB5Li67cotuzrw+V4wQBh/cEWVyRm
         U3x/wdWsBcl98EGSMU+dOqMDNTkwOXyXDfprBqM6pe0LbjoA4Gim5HuCZI7rS83CEegu
         G2c6llUfL4K+5ZvuEenLZEVaWm9kGQ+eBKdu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277741; x=1765882541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGQlNp2uNdzR9boq3JF5o7GfOo+2iFUN3orS5SRXRIQ=;
        b=QZUyRAmlKpQymRMz/qwP2Vo2iN6rYa/oQ4q5NFijS/aycF0f5IbY7PrBXqAW1LV6b6
         stoHB0txMMSZQnuUR48ojqEU691fF2QxdZVxjmu/M8DDVXkjmgvyeW+yggJMCfDo3YQd
         ROrYhdvJ40X+iNpkd/qoFRDEq++eoDj1q3xX0B0uL1I/hs3hUvN/6abng8QPHUypse5C
         ewq3XAJTaysRZuzDtZ3doR+MRaEp0VZCTLWQSRKAUURb+dEzmj88rV5ebW5iV72QWI2g
         7C4ST2Q01UjqbblkZZjlFD6O0qqvVbr+UQBNdRPohxyl8Ph7Rm1M2m9i5Bm4FGu4FC7P
         DBXg==
X-Gm-Message-State: AOJu0Yx/thJG+t6fnh5OGUeU8o8s7tQN2C1ZF/OyURSlz9nbP9JqkL5f
	LAmQtoop6d3FRAN3Bxu2hcmznZuzWkw08ux7pWfZA2c1DT/5vEQBBH0yu3Gx3vaKUAL02YA9+GX
	l8NIc
X-Gm-Gg: ASbGncvTIELHCZTIYh54moZVgcFJcIbndUfpz5UfjjfMsJIYnqLe8LUc6GBd/8MIviK
	KnHdILeweW4wzkCBoQoGnqgRna3dEPER2/H+F82xEmmCP5Vdd+0tO0aBy9JG6GvRFUblwUXQg7h
	SGTNopuVNIAyNEDQeohBc2aWt4/i84RCCGI5ZMMTj0ZOLs9WKa7bpX6WtfpM8OmQuTlo9FqEINB
	H/Ot2Y8zx1nEXVLWqfpoVqR29gj/n8eIVOZqiRvYuDBzcC/cXgsI6Ivl06McBvgr4yGKLcXAyH4
	fNJ4RU0IMTDL9tGxMUoxu1Oh6e3r5PQcI8H/06pTJ4EIkEPyguEgQGUxq88UXqTebr3RXLQ2DjS
	n65soMSxRti4nrJFA+FbOfA1WwiLuHwBMNzyucb3PI0Z+QUJvWpi6CJeuFGaoaAz/bRC9eya3lh
	fj1e0pVnQgjRqShXach1iePyCTH70nOgyigcy5g3roPaMkt+JiCx/EUGmsr0pn1Fs6r5HUDRGEb
	KwJB03l8BJFhvdxcubyexA=
X-Google-Smtp-Source: AGHT+IHPbFGelh+sJoGOTCb8quqwLwyKJ/KFH7qp4zcsXRQNgd1fF31qy1Oty9e+Qg53saCRmbRTtA==
X-Received: by 2002:a05:600c:1990:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-47939e4d013mr122339545e9.35.1765277741519;
        Tue, 09 Dec 2025 02:55:41 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-fc4a-65a9-382e-6f5d.rev.sfr.net. [2a02:8434:8fe1:4f01:fc4a:65a9:382e:6f5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7435sm17412895e9.0.2025.12.09.02.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:55:41 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v3 5/6] patchtest/selftest: Add coverage for detached and attached HEAD cases
Date: Tue,  9 Dec 2025 11:55:12 +0100
Message-Id: <20251209105513.273859-5-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227429

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Extend the selftest to run against both modes to ensure correct behavior and
prevent regressions when operating in a detached HEAD environment.

Two test modes are run: Git attached and detached, via the
'run_tests()' function.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
changes in v3:
    - Simplified printouts message in test_head_detached when test failed
    - Fixed the result message for test_head_detached
    - Incrementing xpass so it is properly included in the test results
---
 meta/lib/patchtest/selftest/selftest | 68 +++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 92acc4d556..74b50f65e9 100755
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
@@ -101,6 +142,31 @@ def test_head_attached(patches, counts):
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
+        print(" Test '%s' failed with git in detach HEAD mode: state changed after test" % testid.strip("."))
+        counts["error"] = counts["error"] + 1
+    else:
+        counts["xpass"] = counts["xpass"] + 1
+        print("XPASS: %s.test_head_detached" % os.path.basename(__file__))
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
@@ -118,5 +184,5 @@ if __name__ == '__main__':
     if not patches:
         print(f"Error: Unable to find patch(es) in {patchesdir}")
         sys.exit(1)
-    counts = test_head_attached(patches, counts)
+    counts = run_tests(patches, counts)
     print_results(counts)

