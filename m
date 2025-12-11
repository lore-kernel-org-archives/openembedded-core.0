Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55663D41D56
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 15:07:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11351.1765465614179373457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 07:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GVpr83ya;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e2b80ab25so118468f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 07:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765465612; x=1766070412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBC3bxyU5gwgVpqlPVndjRqp8xzQAr3Pf0Twv6+gHZM=;
        b=GVpr83yaX0lciTzU+6ALZtkxpE6L630SOml80pIqu4xWoKoDv0XUyErL/P8d9Iwm07
         JudmTLx+agzJuTfh4RZYv9VEOPnu2aC0unAVu/TyiJUMcwFLiW4K+HVgaSO/f+fxwgYo
         joZbaSOUKXM3ULkOWbUANA1ILC67juufVCDQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465612; x=1766070412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBC3bxyU5gwgVpqlPVndjRqp8xzQAr3Pf0Twv6+gHZM=;
        b=pTt6pg4j43e8+GvC3AFXZxomnkTyir3yN0lVvLcc5rYe1k9zmTTPCE6fUJMLbwnMwe
         z1/SsBYdmWh8xumlxPj0xp0zZSbgO3MBA7LCy2AbkYencfTOa2OQBd38oF8nCASUvf0Y
         r1DeMkn9sWa8toOoyxeaHnUk5OJiBohjqWvFv2k9rO3KrE8A6OudOpVqx3X2P9PcpqO9
         A4ewZIPyn3oXCpa4+MfziAnUMkDMFNmoBfk8PwGYD6KdsMQ3JE2dwAaD1lZ+ZkSUUS6I
         PjXCGEjkkYRgrOsGflT/pRp7P6CVJh7p3cRfUuKFRZTb7SVBtOi5zF3WutLx41Ee8t1C
         ggzw==
X-Gm-Message-State: AOJu0YyOtsSGP10RoW2RZySR7RJShj6zv0TOSn9+7Gis0hdx4iWRVGjQ
	g6iA5mqiYxtNU2C2y8kCXeeRt1Xhosj4XRuBxAsLSlsizfbTbpeeOV+sun7FX5B1tUDyunoNO08
	/px9i
X-Gm-Gg: AY/fxX5VbWOCsThmZ7hvC9gzW+eDmaTQr7i8N7kqczNywlC+81CB+o2yDTfiBPSwJGy
	2m+MeQDozba3ThX01zEOqiiIJ9Sm9C+/Gu8kFdizRPAlwpNFyZgxaivaqRWEHYZNODejJJFyhrE
	MGjRT8tfwhlSW0dcmcul86hnwhZuQA9W1KGa3iIIqoz9nAkzWnzjA/u638X/KAdiB6+yGPaliOS
	6FofFIwbEn+FeU5Jlku8oLe3EyGhgKIsCOtOBy7bvrkovki+npK/nRKYNT9dOaxD8BNbDh+YojS
	KA6BQAOMNg/oLuzmm6rnR5BDo2OOGtW18/LoAEQ5zk9KeFkjmZiFbGTTCat2Vqd8fO/7GcBp310
	SORqFYUh6TeqRN2yMWU4h/cueqpC6HaiBPfOwQmvlgkXHW1ttiernOUOBFSVT3QtRqFHm9W8o3+
	ON6R+KHcI9kj02pBzRisj8co0JYAFpbVEsfENBcyUQ6em6DaVUwV6phWRAKxUMTRBoxKqrgdBqp
	6hX+jNqZWsvTw//46ptNQ==
X-Google-Smtp-Source: AGHT+IEl2LnMxN1s6ysRN6t0PNhegok1GN+a9O2lHHxFTK/Z6Sdjw7jRuGMJmtBk2RPChkuQ2YEzhg==
X-Received: by 2002:a5d:5f55:0:b0:42b:36f4:cd20 with SMTP id ffacd0b85a97d-42fa39d8199mr6999724f8f.27.1765465612056;
        Thu, 11 Dec 2025 07:06:52 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-5250-bba4-03e6-c67a.rev.sfr.net. [2a02:8434:8fe1:4f01:5250:bba4:3e6:c67a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70379sm6504043f8f.11.2025.12.11.07.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 07:06:51 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v4 5/6] patchtest/selftest: Add coverage for detached and attached HEAD cases
Date: Thu, 11 Dec 2025 16:06:45 +0100
Message-Id: <20251211150646.2647853-5-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
References: <20251211150646.2647853-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 15:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227543

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Extend the selftest to run against both modes to ensure correct behavior and
prevent regressions when operating in a detached HEAD environment.

Two test modes are run: Git attached and detached, via the
'run_tests()' function.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
changes in v4:

- Fix incorrect working directory when running Git commands on the
autobuilder : https://lists.openembedded.org/g/openembedded-core/message/227474

The run-patchtest-selftest script uses an incorrect cwd when executing
Git commands during autobuilder tests. This causes failures when the
script is launched from outside the expected repository.

To resolve this, the run_sh() function is updated to pass the cwd
argument to subprocess.check_output, ensuring all Git operations run
from the correct directory.

+ /srv/pokybuild/yocto-worker/patchtest-selftest/build/layers/openembedded-core//meta/lib/patchtest/selftest/selftest
Not a Git repository
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/patchtest-selftest/build/layers/openembedded-core//meta/lib/patchtest/selftest/selftest", line 198, in <module>
    counts = run_tests(patches, counts)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/patchtest-selftest/build/layers/openembedded-core//meta/lib/patchtest/selftest/selftest", line 173, in run_tests
    assert git_state['branch'] != temp_branch, f"Cannot run patchtest selftest while on branch '{temp_branch}'"
           ~~~~~~~~~^^^^^^^^^^

changes in v3:
    - Simplified printouts message in test_head_detached when test failed
    - Fixed the result message for test_head_detached
    - Incrementing xpass so it is properly included in the test results

---
 meta/lib/patchtest/selftest/selftest | 68 +++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 92acc4d556..01a0888499 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -84,6 +84,47 @@ def analyze_result(results, patch, counts):
 
     return counts
 
+def run_sh(cmd):
+    """Run a shell command and return its stdout as a stripped string."""
+    return subprocess.check_output(cmd, cwd=currentdir, stderr=subprocess.STDOUT, universal_newlines=True, shell=True).strip()
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

