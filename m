Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EE4CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:37 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19897.1778787749130114660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=J4oMBF1G;
 spf=pass (domain: baylibre.com, ip: 209.85.219.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b5de17382cso61012326d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787747; x=1779392547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeyK0wgBvEGvRBzxwPhgqKGbT7kA4AAeUKYw+Q1AWRU=;
        b=J4oMBF1GhudxYwezZfHdnR7o6S/BWSvAXpWRZbL4+DJct4UkdpuEH6x+cVwi2daTpq
         8kJk9ovANisIUFDW0KFM/8Cs7Ivl50ISUIhdFTJRPqiUpPa3S+SLarii5evx3otZedKd
         FPvxSt/FGRQSuuIwgxjQsTcsJ6sgOceuEdp91eLQqlOXKF/rJXW+kzArhLq6JJPUW3oy
         hC2LdMs6tbNtDVitsdkgg7AWnpy6OzxhKtcU9DKCZYibdKoRODLg+S4hFxSPb71HfVek
         wzG8YBPMtmRmoWYytRV0+L6ugG0XaFuidCDRopp8jaonnkavsdXT6idSS6phBfimBdcC
         SE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787747; x=1779392547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PeyK0wgBvEGvRBzxwPhgqKGbT7kA4AAeUKYw+Q1AWRU=;
        b=jJ1DWAtfFx/r4eXpI/8tClHxJIK1WnRe3nOZZSs5Tvu1DlCokFs1bWJ0VtKs3XyRBB
         IkFRr7Lda5YTz9xy65oqA0KbI/3jRLyCAWOAmuaigwZNYeZk8lt/gfsquajKg3MqzI4k
         X74JUDA0b/GdJXNk3graZT60ligjjOWMO5tIq7fteOoDlA7O2sh3bOpAsMLV3dQECMfB
         B1lSe143aD+VTwJzNBpbofAnVgIp8SCIUoTObm9lfQTTaiRx1Kx19ZPq3i85iseT27qa
         M5VRu6zAVAOw6hDM9CN064w6sQPQgktBGbmMffBGejc1U1iOueTGadn8lUFa2gjIr6CR
         GHaQ==
X-Gm-Message-State: AOJu0YybrkDBK9q1Vc4m57j4PEWxzr/E1D8Sg6VWBWd5OUaMNZjbVdfb
	VZM4BrdCd+sFTz6bgD/671WilPXfQ6GehO+gUIbtn5StbcLQJM2YgDQkgO6T1oWnSGWr4yEsAxV
	0tk0wXJA=
X-Gm-Gg: Acq92OEjRYV+kK7kYDmcoGLf2JKNdoSAqSObQhfsw3niCnGExynmlMhVkqxuW85PiqB
	k7+I+EbP6BHQJ8QRD2ImgojQOURjwMtCDfRlrziZ8Qx24+3iG/beC34OeTZoJ1jzPZYP3jlQ+Ug
	ny0GeGBR2VjKVEngIUzVZZbIlHVln7ZdCsNzAC6EPatNOKppuUNuPPOKbMSkyW/kHW8T9E4swM3
	ezWAK+sp+SfrlolfCT7gF2PnOAd7fQWeAi1Ul/pAMQxbNlr5XrZFZDG6AztmgVI1N6VuvbaulDU
	uyGzMQvmuvITUuhESsuCs9L5r56A3th9VCw6obGtIFNtA1Y6fMY3Z96Ihxk7aH7U1mKM2D/L1Wr
	Ek1Q9wPzKxj2L6OWkNrA3z5IAvJVmRypxnzKEEikEA1hGOFkJFEBcacmnoKD1ecDF/xc9eteNq5
	zgyh8Lt/kZg4PdzL1NF3hCufXg9Q==
X-Received: by 2002:a0c:f003:0:b0:8ca:eca:dc91 with SMTP id 6a1803df08f44-8ca0f634fa2mr19778636d6.6.1778787747490;
        Thu, 14 May 2026 12:42:27 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90c372117sm31517996d6.47.2026.05.14.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 09/11] patchtest: selftest: stop if patchtest fails
Date: Thu, 14 May 2026 15:42:05 -0400
Message-ID: <20260514194207.1958325-10-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237056

- Make sure that the selftest doesn't run the full suite and provide
  useless output if patchtest itself fails. Now we see this sort of
  message, for example when meta-selftest isn't in bblayers.conf:

  |(venv) tgamblin@megalith ~/workspace/yocto/openembedded-core (master)$ ./meta/lib/patchtest/selftest/selftest
  |patchtest failed before producing results:
  |patchtest: meta-selftest layer not found in /home/tgamblin/workspace/yocto/openembedded-core/build/conf/bblayers.conf - add it to BBLAYERS before running patchtest

- If the selftest stops because patchtest does, the branch isn't reset.
  Make sure this happens.

- Adjust the way we parse the resultline content in selftests so that
  malformed output lines are skipped instead of crashing the selftest
  script when we split on a ':' character.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/selftest/selftest | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 26d1b61227..d922e12206 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -56,6 +56,8 @@ def analyze_result(results, patch, counts, return_code):
     expected_result = str(patch["expected"])
     for resultline in results.splitlines():
         if testid in resultline:
+            if ':' not in resultline:
+                continue
             result, _ = resultline.split(':', 1)
 
             if expected_result.upper() == "FAIL" and result.upper() == "FAIL" and return_code != 0:
@@ -80,7 +82,10 @@ def analyze_result(results, patch, counts, return_code):
                      counts["error"] = counts["error"] + 1
             break
     else:
-        print ("No test for=%s" % patch["patch"])
+        if return_code != 0:
+            print("patchtest failed before producing results:\n%s" % results.strip())
+            sys.exit(return_code)
+        print("No test for=%s" % patch["patch"])
 
     return counts
 
@@ -131,12 +136,10 @@ def git_detach_head():
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
 def test(root, patch):
-    res = True
     patchpath = os.path.abspath(os.path.join(root, patch))
-    
-    cmd     = 'patchtest --base-commit HEAD --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
-    results = subprocess.run(cmd, capture_output=True, universal_newlines=True, shell=True)
-
+    cmd = 'patchtest --base-commit HEAD --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
+    results = subprocess.run(cmd, universal_newlines=True, shell=True,
+                             stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
     return results.returncode, results.stdout
 
 def test_head_attached(patches, counts, branch):
@@ -171,10 +174,12 @@ def run_tests(patches, counts):
     temp_branch = "test_patchtest_head_attached"
     git_state = get_git_state()
     assert git_state['branch'] != temp_branch, f"Cannot run patchtest selftest while on branch '{temp_branch}'"
-    counts = test_head_attached(patches, counts, temp_branch)
-    counts = test_head_detached(patches, counts)
-    restore_git_state(git_state)
-    run_sh(f"git branch -D {temp_branch}")
+    try:
+        counts = test_head_attached(patches, counts, temp_branch)
+        counts = test_head_detached(patches, counts)
+    finally:
+        restore_git_state(git_state)
+        run_sh(f"git branch -D {temp_branch}")
 
     return counts
 
-- 
2.54.0


