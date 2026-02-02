Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8576CE7C714
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:38 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52588.1770040473630329984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efz1Gswd;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c6a0702b86so455423885a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040472; x=1770645272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSdMgrwzPdhJkSuOGoM+i0LfjbuvMK6UhGPaoMbc5cY=;
        b=efz1GswdgN4WMrjs6eFCsJt3CjipYPCDDnFB+DTj2IGY840IHO8F4WFMJoLUw7CSQP
         6IBkbK1DphP4zmrwFEiXWPc0UijWvMCRCWsD3wHPmvDfkqgk4UsSYDca62/N2iYrGz01
         h1KEO0xMGor8kdzItE6zVaTVdwmBtloYGWe4FrYWaefl1Ef0FLQdCnVf8DIbh3U8oT56
         LHeiiBKd+2Ehof3LhzluGhOrP0MJLxQ5Fax4bkhp10QogrAM4BM5QKo1zTzaz0uJjUWz
         dCXo7yJpdqpkqIeSFzcy+145jxhau9Md+ZS4XXdyHdjLGcDDXGScXIQgQp2di8AoiHZW
         VmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040472; x=1770645272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jSdMgrwzPdhJkSuOGoM+i0LfjbuvMK6UhGPaoMbc5cY=;
        b=WV1oi1WPSXno75MbuAy2ycKUFAJSknACbPr8cshUi1ajsczbRM+ALi8xWgJytvR+Oz
         YJ90bV1qbFUjDWFc9GxtJznTe8fzqSppCa0TL8sErIEN2oYtTX/pauL+F7BT+sL807Em
         LAYoWdvmUpl0JIzucikg0gKj4+r+U8tSlUWroA6EjLayUSrgG7kFUoNQBiY9Dd8G/2y6
         hnq8gaSqGI3CHtqG4nzQffirQO7i5I4w44zwtB4eefQj9QM5L7CWx75xWSh5En6Dxbtr
         8VjNsI5vx2SixTHOlhmKU6gGkOthVJv4mBjY6ZYuFCUPRdDQa5N9cTAkxchTGa2s3N2Z
         eQ6w==
X-Gm-Message-State: AOJu0YySW59xNOVZi8R9ciLRHx+j4GK+619GHIDHnaSDC6bbB7z7K/z0
	4ocCM6zC704wISjgb+7rzBixsjlbbiHn8+uX201hT9IBjrNdOPKmgZwKC13oyzij
X-Gm-Gg: AZuq6aLC0SPFpkgNKFfVnvBZAVKBhRyNmnna8bkCEInz1Bdg/+w9GgTwqRM5PLZ3XEA
	l6tBTgGPAR/hLIybdnIAsoTnGgOy5Jjp5nWF7v607/YeOOY3fchGNKbp/dSg2GZrclr6f3oRk8E
	9SEg9wPxq2yo9KS+9TZbirpbgH1LqyLv+mnK0CoUD+KoivcIPSDYlJjy6snUIxQccQwJ0/nWSVs
	ipQWZocvCdzTdDtDfLcWRkBzIbh1ztu6+sT6Ryc7ldNO3sfGww9ucpfDQ3XSTj9fp1tEzCdaXxf
	nuysFxE4GSDOFDlshMw0+uSzacRkSRqRRszu6gT4WVU8raceS6oj+XxyB/ZnZoY3wfyFJq+gial
	KswzvpI7MHmmWzkUsA3zS4Sc3ZUaR6YAVV7RVLbhxnUn5t8nS1DNJghuQfsm/a+uR+/awI9AnEU
	P9fEC9VS7QS8UFWSY+LBEPvLDdgCRL2ef0vqKHPMmwvh4mTMH3UE3i3g==
X-Received: by 2002:a05:620a:408d:b0:8c0:ceb0:890a with SMTP id af79cd13be357-8c9eb215d76mr1496125885a.16.1770040472039;
        Mon, 02 Feb 2026 05:54:32 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:30 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 5/9] oe-selftest -r wic.CLITests -> PASS
Date: Mon,  2 Feb 2026 08:54:10 -0500
Message-ID: <20260202135414.682558-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230357

Changes for the wic.CLITests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Note that the base class for these tests had to change to WicTestCase so
that the wic-native tool would be built and available.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 8eb0d3dcc464..d8f89e79e7f2 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -101,7 +101,7 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
 
-class CLITests(OESelftestTestCase):
+class CLITests(WicTestCase):
     def test_version(self):
         """Test wic --version"""
         runCmd('wic --version')
@@ -141,18 +141,18 @@ class CLITests(OESelftestTestCase):
 
     def test_list_images(self):
         """Test wic list images"""
-        runCmd('wic list images')
+        runCmd('wic list images --vars %s' % self.envfile)
 
     def test_list_source_plugins(self):
         """Test wic list source-plugins"""
-        runCmd('wic list source-plugins')
+        runCmd('wic list source-plugins --vars %s' % self.envfile)
 
     def test_listed_images_help(self):
         """Test wic listed images help"""
-        output = runCmd('wic list images').output
+        output = runCmd('wic list images --vars %s' % self.envfile).output
         imagelist = [line.split()[0] for line in output.splitlines()]
         for image in imagelist:
-            runCmd('wic list %s help' % image)
+            runCmd('wic list %s help --vars %s' % (image, self.envfile))
 
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
-- 
2.51.0


