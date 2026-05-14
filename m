Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7C5CD4F42
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:27 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19891.1778787741995680451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=etI3c2ZV;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so127235426d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787740; x=1779392540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nkeeLbqRVoHNO0OGqbIdgMRYgQNLcDrWm7X/mzEJ1o=;
        b=etI3c2ZVpEIDbi5bESUCGv7d0vSIlACgPA+unaThQvKscblZMeU72HcOYPW2GtqK1N
         5/4cnu7FgiGsFac12wVGwP1PrTK8+YNcxpMWtmpQ67rjdqMPALzPD3e/Cnn9rxzbqdLs
         lCKY3Rg+8r7+amWjHSvUmhd3uD+GMvUmeKQzvMrzXlhdhUrzfA77J73X5g6vpPcD6GlV
         bzaRgWZNoHqsLEpVvYYaWfdBjM467eD6mqURzWxRfxq7CVss12Abx9mcua5dZbnG8yqO
         ZuCdNn0XAswGrLKqP8maPV4psRJwBo0O8Y9k4qHYuai4Nq2KkBmoM9X4k+koUQJCzb7E
         vDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787740; x=1779392540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nkeeLbqRVoHNO0OGqbIdgMRYgQNLcDrWm7X/mzEJ1o=;
        b=frxUpFZSmIexYy7fbmcEX1468hlFMWRBVT40IWhhrZWBF7Sbdap6kqEYrMyEQLS862
         T+tg57PE2G/tWg/sbpT0qilaf9pLy+KYR2s6HyWPR+6pFvO7EgNK1LW5exHRnG+GKj61
         36ErIsXuu5UuaY6Fr+gI/z/N+DkfBGTG9IXVG3U2LGW0AwRe+QeEtKhk7hzV3TwhOZx1
         +umBYRDTlU3cnYUu9xryToit5/8YvhPtPL44TxDU6wZhLGyyls52004rrz1IBdplMJTf
         t9VkFW2aIXEZsnLzZryVy8tV1t3g04miRrnzOBH+xPJJIBWbh8nJFTnouzzSVBYe0hzm
         0yBA==
X-Gm-Message-State: AOJu0Ywdvs5FxGhOTKg7940+8Mvy++b/0giZmJ48KD0+Ut3czXI81zHD
	N1E3iJwXOcZDY9uUugJ+qdS1w8+tP08+lRwfEKUyJuAniSz6vNEZYPetKPBusrNyWTGhRmTvmFA
	UURKP3sI=
X-Gm-Gg: Acq92OF2HHlfas1vG0/g0ClrbXtzLzxgDLmg1oMCjBgcuZt9vgItO7I6z+rqCtc/ypH
	8LEmB7uRPee9Rfu/snhU9ZUpDRoMsjdxuR6SuRtBcGt+Ww2xSF5bi3A8imbyXjbNPP5Dwt0bc5f
	T4zfE6/G2kleYDvBvA0x6WxLZoZvV60u9K/wrwkxjntL+vrEABvo5zTNqoegvZkQQmbwNWiruz8
	lZRRQuxQi0xrPHE7SbciposyeHqDgGzKY3xSa8WDpKHcDTZuVJ1VCRC0MA8dpu/YWGSuK+WG0MK
	zoy12ds23853GyMQ1eZyzOep3KXwbQC7hV4sMiJuSBfIM27Prja5xs5ztp1cVrbz+YYoJlN0g6m
	nuLX7oJL0MpNLeBVkCBARZJIpe8rAeYplGGpM+zVVHA1rolAqcIlZv6Ra+Kkt0zSscMdQnNkRwv
	+j2VdEZf5aTAnbPUmpF8lWc7n3qp0x7s3Jt7zO
X-Received: by 2002:a05:6214:5a05:b0:8b1:f784:7ec8 with SMTP id 6a1803df08f44-8ca0f6fcd58mr19874696d6.47.1778787740483;
        Thu, 14 May 2026 12:42:20 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b2dc42csm31548366d6.26.2026.05.14.12.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:19 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 05/11] patchtest: fix branch applicability reporting
Date: Thu, 14 May 2026 15:42:01 -0400
Message-ID: <20260514194207.1958325-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237052

There are two issues with how patchtest reports results for testing a
patch series:

1. When a target branch mismatch is detected, it reports (for example)
   "scarthgap 50/71" as the target branch instead of just "scarthgap";
2. It doesn't report the full shortlog for a commit which fails to
   apply, as expected.

Fix both issues, but make sure that we only print shortlogs for patches
which fail to apply if there's more than one actual commit being tested,
as otherwise the patch failing to merge is obvious.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/mbox.py            | 5 ++++-
 meta/lib/patchtest/tests/test_mbox.py | 2 +-
 scripts/patchtest                     | 5 ++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/lib/patchtest/mbox.py b/meta/lib/patchtest/mbox.py
index 400d73f19f..2342fbda65 100644
--- a/meta/lib/patchtest/mbox.py
+++ b/meta/lib/patchtest/mbox.py
@@ -70,7 +70,10 @@ class PatchSeries:
         # Parse each [tag] in the subject individually
         tags = re.findall(r'\[([^\[\]]*)\]', self.patches[0].subject)
         valid_branches = [t.strip() for t in tags if PatchSeries.valid_branch(t.strip())]
-        return valid_branches[0] if valid_branches else None
+        if not valid_branches:
+            return None
+        # Strip trailing series position, e.g. "scarthgap 50/71" -> "scarthgap"
+        return re.sub(r'\s+\d+/\d+$', '', valid_branches[0])
 
     @staticmethod
     def valid_branch(branch):
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index f158f4472c..a216028250 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -89,7 +89,7 @@ class TestMbox(base.Base):
         if failures:
             self.fail(
                 'One or more patches in the series do not apply cleanly',
-                data=[('Patch', subject) for subject, _ in failures],
+                data=[('Patch', subject) for subject, _ in failures] if len(results) > 1 else None,
             )
 
     def test_target_mailing_list(self):
diff --git a/scripts/patchtest b/scripts/patchtest
index 435610b54f..f359a6a96d 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -90,8 +90,11 @@ def make_result_class(patch, mergepatch, logfile=None):
         def addFailure(self, test, err):
             self.test_failure = True
             desc = _format_test_description(test)
-            issue = json.loads(str(err[1]))["issue"]
+            parsed = json.loads(str(err[1]))
+            issue = parsed["issue"]
             _emit('{}: {}: {} ({})'.format(self.fail, desc, issue, test.id()), logfile)
+            for key, val in parsed.get('data') or []:
+                _emit('    {}: {}'.format(key, val), logfile)
 
         def addSuccess(self, test):
             desc = _format_test_description(test)
-- 
2.54.0


