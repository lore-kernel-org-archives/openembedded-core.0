Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C0CCD98F9
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 20:36:52 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28958.1781815010562241575
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 13:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=l192KUxy;
 spf=pass (domain: baylibre.com, ip: 209.85.222.196, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-915b5ce94c7so173018785a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 13:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781815009; x=1782419809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7FYAOoDWipoQKi6AJI7r6DJox4NJtOMo0zf66UmzGw=;
        b=l192KUxyYguP7SmY1mv6xsccZ9g2aX2bJir50J7K6L6DBQN99Z29bGRAcTAd3nT0MI
         mX4rMFFGAYPy0oq4oIrB4P+SDfr3My/sE41HSocI2+Ih5kvtWAXEaw2I1pG/qyg2q7/s
         3yXnDbSIrVP/m+sN/b8B8IiSIjVuhYZRQkFuV35sVx4Bry7WGk5PqPkw/iuHxSCMtEfW
         x2nxZ5K3UbIxQOt9EyGUPFTgo736F4F1N9/zQepzfDNqm7dwy1Xt+TS362RZ4INrtSfn
         D/4kts3j6XMW8wZmiPy/dNJKTRGqWDWloGNhalQvY9u1dh72iDxU6wQQ+eUFyrtxvHv3
         y/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781815009; x=1782419809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7FYAOoDWipoQKi6AJI7r6DJox4NJtOMo0zf66UmzGw=;
        b=sBdasocOLT7ed84KG4pW4OP1f2zwP9h+fDNtj9xTZFtHiL3sq2MGgpUdbr4Z40XCdb
         FOs7tCSkBCNcp/i1NMRM2qIRq6F2UTlEmOvGK71VaFQVaEh7PxC8ASNs8EIJtlqNmIqJ
         selmX7P+jgQwpVc2SU0LaKurKQtvoP3ZfT/SJNKOP+7mJaeQFjQ6Dx6dwamp0jHH4Bpb
         9eHNz8qSu955aVKqUv08r4gJIFYyAfsB874HzyYxT333c4bT3x+3MFX0wK3L60U+d5nd
         NRfEN6VdOZuUfRnAmEyJxj/tuYWEF3RlRGj4P/82q4BLLZeWWcP5yjmbb5YpmA1mu+ET
         AVHA==
X-Gm-Message-State: AOJu0Yw96UD1cEu5dvvWpYewLZrZ4talPBRiY5ued0J2KUOdDOaN+5Kt
	NY4yggPgHGOm+OMXfvFwoLadtVkIlFlXMz+AFEgBn+PULvREerP2VkMOgVMeYeH3GYwmehGq8qA
	ns+Od3VQaugho
X-Gm-Gg: AfdE7ckaFkai6+mhMDQirvkbH3QamLo5qrpnrlvBdnt5Ndq6ebtV+XKQn/cS3aDwODC
	SyugF+uYdXK8ErVCLsi2+aZRelfFqZ4tuxQouGH+CmSxk0r141AhmgKlptMRLKMf3Glfx/utHDL
	TjkfqDw4EhbSXjvavruEWmgI7PTAqoCQ6zvl7T2h8URKrFrytLHdJz+A3h3Pb6Ot/mzFC720tE0
	rqyy5CWT3tjDtxkF2NpIcOYDKIIS52dFlt8IjGAhKqbS5v0ppUR1PCKQ5yYX5cHZ04cdIdFbMoo
	MFppRA3Sn4pZLepGIUtHduaEYqIPXx1+UBJuqquziNssIiZMQBRu8mO6aSGnmwTkbNo28TqfThm
	S3drrtOwP7274ZBqTvtskDcXiZL1Q0kkRCe5QkWgf5RhpHClJj6cMievQ1RxB5U9Asd0n7iIC/s
	WQ45OFupZum+ZpvRx56zZrDLtK7JI=
X-Received: by 2002:a05:620a:17a5:b0:915:b718:accd with SMTP id af79cd13be357-9208e497f13mr98176785a.6.1781815009409;
        Thu, 18 Jun 2026 13:36:49 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a4348cd8sm18387585a.27.2026.06.18.13.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 13:36:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [PATCH 6/7] scripts/patchtest: clean up main()
Date: Thu, 18 Jun 2026 16:36:31 -0400
Message-ID: <20260618203632.131125-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618203632.131125-1-tgamblin@baylibre.com>
References: <20260618203632.131125-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 20:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239107

- Reference PatchtestParser members directly instead of setting local
  variables
- Remove unused variables
- Declare 'ret' just before where it gets used
- Use subprocess.run() instead of os.popen() for a cleaner 'git status'
  call
- Remove unnecessary square brackets in the status_matches if block
- Remove unneeded try-finally block

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index d2f6302743..592d91dbb0 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -12,6 +12,7 @@
 import json
 import logging
 import os
+import subprocess
 import sys
 import traceback
 import unittest
@@ -162,16 +163,14 @@ def print_result_message(preresult, postresult):
     print("----------------------------------------------------------------------\n")
 
 def main():
-    ret = 0
-    tmp_patch = False
     patch_path = PatchtestParser.patch_path
-    log_results = PatchtestParser.log_results
-    log_path = None
-    patch_list = None
 
-    git_status = os.popen("(cd %s && git status)" % PatchtestParser.repodir).read()
+    git_status = subprocess.run(
+        ['git', '-C', PatchtestParser.repodir, 'status'],
+        capture_output=True, text=True,
+    ).stdout
     status_matches = ["Changes not staged for commit", "Changes to be committed"]
-    if any([match in git_status for match in status_matches]):
+    if any(match in git_status for match in status_matches):
         logger.error("patchtest: there are uncommitted changes in the target repo that would be overwritten. Please commit or restore them before running patchtest")
         return 1
 
@@ -180,6 +179,7 @@ def main():
     else:
         patch_list = [patch_path]
 
+    ret = 0
     for patch in patch_list:
         if os.path.getsize(patch) == 0:
             logger.error('patchtest: patch is empty')
@@ -187,19 +187,13 @@ def main():
 
         logger.info('Testing patch %s' % patch)
 
-        if log_results:
+        log_path = None
+        if PatchtestParser.log_results:
             log_path = patch + ".testresult"
             with open(log_path, "a") as f:
                 f.write("Patchtest results for patch '%s':\n\n" % patch)
 
-        try:
-            if log_path:
-                ret = run(patch, log_path)
-            else:
-                ret = run(patch)
-        finally:
-            if tmp_patch:
-                os.remove(patch)
+        ret = run(patch, log_path)
 
     return ret
 
-- 
2.54.0


