Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5DF107637D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 13:46:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13602.1775051151614721238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 06:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ormh5Eps;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so1614217f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775051150; x=1775655950; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO3aftoLWTrbD9DcHccffKt4CJxGA/juM1W5MFbuL2w=;
        b=Ormh5Epsf2Glj+lbzUEiaSnNWKx08p4tKGEixWDWhJNloVUb7XrYuIIhcxxfz0MeKf
         nq7uvjkMi0dNe+8qhsR68k9QCfGT4C98cALTbTqTD0v7mCVbDoU/db24phUoLMW6Nv9G
         UpO4qVaxfAuqRCQ3rnaIro1qggFpkJBD8nxPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051150; x=1775655950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dO3aftoLWTrbD9DcHccffKt4CJxGA/juM1W5MFbuL2w=;
        b=E2EK2NH3gH3OfZYTCXhgxvKzPFuW7Y/WTB3vc1BD5kq45yOzolRNFWiqA8Sx0FDhXB
         bVObaM3l1tpfjlhgNfsDu/BU4rU7ixOmYTOgJ/rCHdOQj3dvV/ncSaAxL6ca9eNOD01t
         UdLWWWm/o9lPrZmVz0PDa963BUyKxysmoS10WtkYNJdS4fSaBjjUUlvNYKXSO7x/8Xyl
         1GsuylRh+ng5GaEhfbHnF199vElmjjqGW19rj6gVAlptFZOKlf8I60oYPJ/i1YpaihJv
         99DvTAsO4ykWc9OHLbuzn5tsnJRyOZ5qYZWCVIh1qU1AAlALDKlU1AGIYIsqitOJx5To
         TLGQ==
X-Gm-Message-State: AOJu0YzR0Hd82eEL7sfWZhGMAp1BMfzlQg5FTNBkLJfQb8ICknk+cuOb
	j7iY96V8/17bdszgTuMYr+U8ywyHAHhcJyHWBzfqerfEC9gGEIEa0w1sqLybzqwvLc304kvlHjB
	M1VtmVVc=
X-Gm-Gg: ATEYQzwZ+msehdFmtqx5AQTCwBG/reHFXnkz8vitUTo0JGdTJuv2V63cojQZe3p9Mj9
	0f0HFX/qEGdkRHwDC/utTlGsrwOmmzI5vOy+ZWPNK+ikj6uH/m1c4PkFfNfKpE0lkaDe1AbYtfK
	6ve/T2c8XcJocIymdcxPQO7M49sq2VD9ZKn2imnqAOhsNEHf3SCvh0TJrUqpyokF9r7PCb63vuu
	FsqKGziDJupqUBRfi6VuSQll6Q7IWSqyy42JwWXZyXgBnp6HK22RCnhulcDUw8f8XAf/A/b1+Ea
	vEz4c9MsPS6oTVuy8UWHNe3igXWcBareAVQGvGFWTJ4Fz9LFmYgKIZsTfXVP6aG025S1V6E6d5W
	SLRFXrnye0i6vNyLKelPBAAiwFq5oouuzunFB9qK+O9PxruN1cCAVqgf+z29pP7QT1nuTbE5bHp
	yBF8xEgMELh4yfsIqfx+e2l0OP0m8uTvn4YpNtpo7kf2gVSdcS2NbKcPOCtZ/MjMjINYuTeJFQM
	5QgcZJ9Yft+GJHsFMB9vd2HBhieUAiwL9WvE4nAp/B8Wg==
X-Received: by 2002:a05:6000:2303:b0:439:beb9:5a96 with SMTP id ffacd0b85a97d-43d150e8ba7mr7043603f8f.31.1775051149713;
        Wed, 01 Apr 2026 06:45:49 -0700 (PDT)
Received: from P-ASN-DERVAUX.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm84653f8f.0.2026.04.01.06.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 06:45:49 -0700 (PDT)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v2 2/2] patchtest/selftest: Update selftest to handle non-zero exit code
Date: Wed,  1 Apr 2026 15:45:33 +0200
Message-Id: <20260401134533.322260-2-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401134533.322260-1-naftaly.ralamboarivony@smile.fr>
References: <20260401134533.322260-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 13:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234349

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Use subprocess.run() instead of subprocess.check_output(),
supbrocess.run() return CompletedProcess instance who provide:
    - returncode
    - stdout and stderr with stderr=subprocess.STDOUT argument

Update callers of test() to capture the return code returned by patchtest along
with the command output.

Include the command return code in analyze_result() and use it to validate test
for XPASS, XFAIL and XSKIP.

This allows selftest to take the command exit status into account when
analyzing results.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
changes in v2:
    - Removed the --error-on-failure option; if a test fails, a non-zero value is returned.
    - Updated selftest to align with the new patchtest behavior when a test fails
---
 meta/lib/patchtest/selftest/selftest | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 43cccf4c85..26d1b61227 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -51,20 +51,20 @@ def get_patches(patchesdir):
             })
     return patch_list
 
-def analyze_result(results, patch, counts):
+def analyze_result(results, patch, counts, return_code):
     testid   = patch["testid"]
     expected_result = str(patch["expected"])
     for resultline in results.splitlines():
         if testid in resultline:
             result, _ = resultline.split(':', 1)
 
-            if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
+            if expected_result.upper() == "FAIL" and result.upper() == "FAIL" and return_code != 0:
                     counts["xfail"] = counts["xfail"] + 1
                     print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch["patch"])))
-            elif expected_result.upper() == "PASS" and result.upper() == "PASS":
+            elif expected_result.upper() == "PASS" and result.upper() == "PASS" and return_code == 0:
                     counts["xpass"] = counts["xpass"] + 1
                     print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch["patch"])))
-            elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
+            elif expected_result.upper() == "SKIP" and result.upper() == "SKIP" and return_code == 0:
                     counts["xskip"] = counts["xskip"] + 1
                     print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch["patch"])))
             else:
@@ -135,17 +135,17 @@ def test(root, patch):
     patchpath = os.path.abspath(os.path.join(root, patch))
     
     cmd     = 'patchtest --base-commit HEAD --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
-    results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
+    results = subprocess.run(cmd, capture_output=True, universal_newlines=True, shell=True)
 
-    return results
+    return results.returncode, results.stdout
 
 def test_head_attached(patches, counts, branch):
 
     git_attach_head(branch)
     git_state_before = get_git_state()
     for patch_info in patches:
-        results = test(patch_info["root"], patch_info["patch"])
-        counts = analyze_result(results, patch_info, counts)
+        return_code, results = test(patch_info["root"], patch_info["patch"])
+        counts = analyze_result(results, patch_info, counts, return_code)
     git_state_after = get_git_state()
     assert is_git_state_same(git_state_before, git_state_after), "Repository state changed after attached HEAD test."
     return counts
@@ -155,9 +155,9 @@ def test_head_detached(patches, counts):
     git_st_detach_before = git_detach_head()
     patch_info = patches[0]
     testid   = patch_info["testid"]
-    results = test(patch_info["root"], patch_info["patch"])
+    return_code, results = test(patch_info["root"], patch_info["patch"])
     git_st_detach_after = get_git_state()
-    counts = analyze_result(results, patch_info, counts)
+    counts = analyze_result(results, patch_info, counts, return_code)
     if not is_git_state_same(git_st_detach_before, git_st_detach_after):
         print(" Test '%s' failed with git in detach HEAD mode: state changed after test" % testid.strip("."))
         counts["error"] = counts["error"] + 1

