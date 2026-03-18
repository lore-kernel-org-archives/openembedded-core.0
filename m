Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441AC10775E6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:12:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18199.1773850351581220196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rFgsFLUy;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48541edecf9so219995e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773850350; x=1774455150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4o7c9o2FdC3GK7EjnihSo+RuuiOVSZkdQNMJSLNo2M=;
        b=rFgsFLUyZNlbRDuAa1JXulawRvMglRDa1eXpV4KE19hRHcv3E/kt+HWLVamaZrH2K0
         Z5KlXuR7y9+cPSy8AgL+JiOoeOgjbVjyOZcYvf1l+NS2NLlnXLg8bAD1iy/bETBGir5K
         nNOszgwx+INeYcmp3G544mBF0+5y98bv6OrsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850350; x=1774455150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4o7c9o2FdC3GK7EjnihSo+RuuiOVSZkdQNMJSLNo2M=;
        b=tVotUiL6gE5wn6Xw0Bsbh+7JTPCsgct8VTDqyakC773fMBjGl/l7zgEUfZmR/WJBZP
         PSJnrrdMwFfN7CJxbzrka+1p1nMwZi6TsiMtts2gH0RVdZ52p8/NmOSvLlCk6PMEXcUi
         Z3iaGJHZkNv0SFy1vRdI/oI1nkEfpRD1gCzpAEdl8nhKE+1LduC/GPjl2I+oDuYn9QRv
         sNtivOAeqIeLZuTCq99GUAvH8+sfJ4yRN2lBV2Tq8Wb21QefakIGkie+mHBrBcbk7Jdo
         kvEEKBymzZJbaAVhS1XCKN0SQ4V5i7ESxLYlg85wTL9hTjrYxvoFjlcTOePLxnyZUb8K
         xP9A==
X-Gm-Message-State: AOJu0YzCeSCQXYHFjSfUYL4RSz5k9uRsaGznFQ6N6wMtkA9D/M02PSgI
	bu3IP3cZ+GIbxfsRQNCGnZZ8zI8uFBn3cgK5SAq8gJQcYYXYK4HJJYRvYrAf8afOvhU1YVGen3W
	c1s5j
X-Gm-Gg: ATEYQzwGFNVjT/EVIqpYL7WR4mopoQw8QoLJLadhh7coKKyITPqYu+wza4pNvNQqnOZ
	lDQCNiWXSOf0Pz1otvR4pMmF2JiBuNy7rZ9V164Lx32dED7TomZFO63cPCWDxEPslaW3HXMUzPB
	FX0l/m0dvmR2kIzAxnCWwhbIdhLNo9l+2FxI6U51ZEz8rLzMngaD6LSjvxYviZncfyLS1XTb4xE
	+fBL+FlQAERpGH3WVXBgE5zQBnO4nYZOrppexU1zpxrx5EkNmoekmtvvc0tW/SZdA2np7CTJvyu
	+evqqsb3axrzwpRrPktr0o0ctuyjOnCITM046q85lYWGQxP7AMTDk312oAKtj2CSpEvB1gJbzUm
	8gcR87I/BOU65z8cDeVKIgBGmKtF1jMm7oJI9yMOpLb/zpj5nug0qBGmV+NBYEXxKXc3ux8//VG
	RTdUvQmnXSTvPPdE0+jEzoClQ5+l7gS8G6SbmZF5SVWqzNECLYW7vjfshvlfs7O+3ZLJBTKajRH
	bngZsLSL0iYXC/nOIC+SaqLdPOkheNi3Z1aN9rdRLUIAA==
X-Received: by 2002:a05:600d:8495:10b0:485:40c6:f51a with SMTP id 5b1f17b1804b1-486f4465dfbmr51147485e9.31.1773850349767;
        Wed, 18 Mar 2026 09:12:29 -0700 (PDT)
Received: from P-ASN-DERVAUX.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45d8e3dsm23629365e9.0.2026.03.18.09.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:12:29 -0700 (PDT)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH 3/3] patchtest/selftest: add test case for --error-on-failure return code
Date: Wed, 18 Mar 2026 17:12:09 +0100
Message-Id: <20260318161209.54396-3-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
References: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233414

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Add a test case to verify that patchtest --error-on-failure
returns the correct exit code for PASS,FAIL and SKIP scenarios.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 51681bec38..39114a45a0 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -142,6 +142,42 @@ def test(root, patch, extra_args=None):
 
     return results
 
+def test_error_on_failure(root, patch):
+    try:
+        output = test(root, patch, "--error-on-failure")
+        return output, 0
+    except subprocess.CalledProcessError as e:
+        return e.output, e.returncode
+
+def test_returncode(patches, counts):
+
+    for target in ("FAIL", "PASS", "SKIP"):
+        for patch_info in patches:
+
+            testid = patch_info["testid"]
+            expected = str(patch_info["expected"]).upper()
+
+            if expected == target:
+                results, returncode = test_error_on_failure(
+                    patch_info["root"], patch_info["patch"]
+                )
+
+                if target == "FAIL" and returncode != 0:
+                    print("XFAIL: test_returncode.%s (file: %s)" % (testid.strip("."), os.path.basename(patch_info["patch"])))
+                    counts["xfail"] = counts["xfail"] + 1
+                elif target == "PASS" and returncode == 0:
+                    counts["xpass"] = counts["xpass"] + 1
+                    print("XPASS: test_returncode.%s (file: %s)" % (testid.strip("."), os.path.basename(patch_info["patch"])))
+                elif target == "SKIP" and returncode == 0:
+                    counts["xskip"] = counts["xskip"] + 1
+                    print("XSKIP: test_returncode.%s (file: %s)" % (testid.strip("."), os.path.basename(patch_info["patch"])))
+                else:
+                    print(f"Test failed: target '{target}', expected return code '{expected}', got '{returncode}'")
+
+                break
+
+    return counts
+
 def test_head_attached(patches, counts, branch):
 
     git_attach_head(branch)
@@ -178,6 +214,7 @@ def run_tests(patches, counts):
     counts = test_head_detached(patches, counts)
     restore_git_state(git_state)
     run_sh(f"git branch -D {temp_branch}")
+    counts = test_returncode(patches, counts)
 
     return counts
 

