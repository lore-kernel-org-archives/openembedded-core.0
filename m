Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ABACA5FCE
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 01:09:02 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2083.1790903332199750880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 18:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D46AOYpI;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91ede8035so61000055ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903331; x=1791508131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzkncOSeGPAUbNPFLzntewBUdqYWJZjGago7GboX2dE=;
        b=D46AOYpIHZKeRhq1ThGxZFhhhLNAXcsgxYduylLwhWfFnoTC4SY2FDEvLpe3MrkX51
         r3wDH+z9kMVctJ7Vqq9FHRvse8rxhe1xECv7c55j1eej19fl3KodurkYrs+dhftz6i+p
         9d0GwyIU2q5bUn+JFdL0J0aMbsXcxJ6loyajXAEKKmogN1xU6Z69eRXn4ZFA12WM7dhR
         O20OGXv+Fstpb5KUng9y5AFMni1YwCA6sXyQHNftUca4Hr17wIfRQfHrN/p2d9ka+7u6
         rmPS4YVPeBX4hYV62sGOu5wkwtKaJbOHt4JACDUqeKxEfvOwz10tIyiXM5/4g7nEex7E
         v1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903331; x=1791508131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EzkncOSeGPAUbNPFLzntewBUdqYWJZjGago7GboX2dE=;
        b=ycVXepR81yydmkb1RjHNBt5j2fGFIkN8O96AnjhPL7fpBcXNe1H8n8PTqI3hTu0z/I
         PtWCDD1zlXthtrlEkxGagOnlBn9md6u3k72i++PP9b01BaXLDv1JINOOzVhfMHP9fVmx
         cq6TcadczPcsN24EmFqQMOHBDXhy49pM+I1xgfaWloD04olxU9LxeUo6LTm28fUygzn6
         0kopkZ2NWQQ49cq4SCxTRoO0LdgGlvXcswR2a40I7I1wIb93YYx5OLAi/ZY6pA3TADIR
         G5BUGhFyiHFP3FbhzprVHoH+jUbRQ0BorGJeB9ZF9kboCv2E/6k7PFSDwiKLcoQIrAEk
         jqTQ==
X-Gm-Message-State: AFq9FYIXYdj6LoRwZaIPlnugInWucgIFPr5rHPG3N/GzG7xk4l3vWVDS
	k0M9FpvkMoACRGDi6Wdg5tfGqwsxoYxSFxXTfLOekD2grFAeL2CBsQLo4tFAIAKyK3pTnvMS
X-Gm-Gg: AYBFou2yy9QtunS3Ru4CAPRSMQnIqokAbPI1gxTNL5VjH5CBK0y7HOGumyG3xPGdxA5
	HTPnduryVawkRCue29HNQ0n3b38TqdG+CD75Mgxzen8/LJRPRQcLn98gfIxUZBt7kExh4VDpuSf
	1F7Zrpi7CCRSFbPr9WyuKaOYoK8x2VcqgW06DxXA8OT7WitntJou3nv1/aEhSRRhwQXLJZVFM4n
	byTKxXW86NtWVQ6CNfodtj7Q9WJsb2ZCh72hDVXwOAbgPMqJ8uk5SeeHMVMEzQwKuObXI0LSV4Q
	TfYQ1/FE1EFvk4XwQgN10Yu8t1lS9qrVHLEN7SD2qmnZo4sn2pdDa2y1DjsO2Vuwp2OE+K1hwyT
	grtcOoaKWoDALR3KqtU7j1xDCP3a0qBevAFoZ8u9jVK3DM+ubd9MBhnk+Nu9jWUxmKDUjcY5iDX
	1lA9aakHQZRz+rkGss+ZX4Gg+6ntOG9l0xD9jIwbVcWWGgD3UJn5QOzDtiNnOg8zghrBIhvw==
X-Received: by 2002:a17:90b:1f86:b0:3a4:adea:50c1 with SMTP id 98e67ed59e1d1-3a6ced92fe9mr1091735a91.62.1790903331277;
        Thu, 01 Oct 2026 18:08:51 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6fe249sm2375965ad.61.2026.10.01.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:08:50 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Julien Stephan <jstephan@baylibre.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [wrynose][PATCH 2/2] oeqa/selftest/devtool: cover update-recipe --initial-rev
Date: Fri,  2 Oct 2026 01:08:49 +0000
Message-ID: <20261002010849.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002010849.7-1-bbnpreetsingh@gmail.com>
References: <20261002010849.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 01:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247057

The --initial-rev option had no selftest coverage. Extend
test_devtool_update_recipe to run update-recipe with --initial-rev
set to the recorded initial revision, which should match the default
output, and to a revision partway through the local commits, which
should export only the commits after it.

AI-Generated: Uses Claude (claude-fable-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 171af3b2915dd076c8d1b205ff75eac1ebd5a586)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5ed69aee1b..b485d752e7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1219,6 +1219,28 @@ class DevtoolUpdateTests(DevtoolBase):
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
         result = runCmd(cleanup_cmd)
         self._check_repo_status(os.path.dirname(recipefile), [])
+        # Now try the same passing --initial-rev: the recorded initial
+        # revision must give the same result as not passing the option, and a
+        # later revision must export only the commits after it
+        result = runCmd('git rev-parse devtool-base', cwd=tempdir)
+        initial_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (initial_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Change-the-README.patch$'),
+                           ('A ', '.*/0002-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
+        midpoint_rev = result.output.strip()
+        result = runCmd('devtool update-recipe --initial-rev %s %s' % (midpoint_rev, testrecipe))
+        result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('A ', '.*/0001-Add-a-new-file.patch$')]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd(cleanup_cmd)
+        self._check_repo_status(os.path.dirname(recipefile), [])
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
-- 
2.43.0


