Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF08CE7DF19
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:08:19 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57908.1770052093110421829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GTo7E+Uy;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c531473fdcso595342485a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052091; x=1770656891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSdMgrwzPdhJkSuOGoM+i0LfjbuvMK6UhGPaoMbc5cY=;
        b=GTo7E+UykP3G+HNKlS7buke6ZTZNttAIqtRjCbnK6G4KjdCmgLuaNkBG/ZPiD1EIxo
         yGTwHGxgjuxvxSYWwmiAkaQQLHKorVFdCtWghge5UyyFuBy3yafGlRu+DVEvQzmAqVeK
         Yf0opet4PKHj5iZm82u3VHzEqaXGkQUpcIeVpOALl27TLhtjvqgeS7P86GhiDG2dNBGt
         nEi5bUWMenPLtcpvkZrclAc7iGyZ4yueusBFdLY8OYLIizQmB3AL/6ZjXxW5fbdPUUW2
         2fvYUbk4d7ouEIuf/wGWCiMkUD3sImkcgRxrDwvQ4hMmCjIyto4MTNcUHGnbyXA4xzuk
         HddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052091; x=1770656891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jSdMgrwzPdhJkSuOGoM+i0LfjbuvMK6UhGPaoMbc5cY=;
        b=WVvrmtV/LltDcV4MNOnCm4HXW5x+9EFkhHa/taQr4ZcOh/3u3i+iIagQMRjWAAo0XD
         k5+7WkmmsfeaeO8bT4DxfeI2kJ0Oni7H81NDMKv8Qt6xW4ttnINFdPVHJZBmc9xzXJzO
         WSsTKDUIGnCQ+SUHlc2TPqzdHVQsV2zSBey+IcqtnPWgqCpmIldG3BuqwACXIKS0JrgD
         1hVX5Z4k1gwyNQA49m3hVEoHycFJUqOM0y9sqlHt9Xk0k103N+kgxwfiiaATpxNocNcJ
         a/YseH9sWxdbwOqD/bE16+dN3lGZBw/J9pZsdUTfzJ/51ZtnLLqtKx1b3VInW5psPCWO
         bzyg==
X-Gm-Message-State: AOJu0YwjD5fnABW7XdASpUvRE/VZQ0bjy/DMz1Bma+woHBgtjtdagMH6
	HvefLWe3oydsOXDjEjM6qm42XabTk5MwDWLCz8SmtdcEs5afVwHngrB71N0B6RC0
X-Gm-Gg: AZuq6aLS+YNud2wG+qMqbMRJOZzjeAEDLNlpDNCidbA1QdHyv/f2xJEcAJw7fD5Yiix
	HUR7cptJ0rNuSrmUbMRqjVgLWZQdAu/a+KAAjpZK4wNFlowWLV3Ti25ly4GDqGPmm4ED+r4+wO9
	wGbhTZ1WqiRlYijAlonydUBECn52KMMMWAYsCbyc643NOIFkzFdwDyPGxV0KLNDdG9ZqKC6iE7N
	ql9Vw40gz0We7crOUwYxSEqkhBXDuH+xxLlEUgmJ4QlBd8JFD8hQi8elkyuk0a35Sg8ITPUn+6c
	OTo51AVwbKLt5ydkyhZKMozJoe1n/UvoyYDsrBoy2LpJkBRdgBNokazCLoXNTMve+m7KZeEpAK4
	8aPdoGJGuIMwNL2ynQcjAKFEuZdWKjkJBUWp6tYlkijnu0j0jfczljrMLPTFwykNtmmdFMcMUON
	36x4MQRCal6auiDLKMAX5e9K7vmKYdtoBh34UKC+mTFFNVGbteVzDp1vITU0XpsE8F
X-Received: by 2002:a05:620a:45a6:b0:8c6:af59:5e2c with SMTP id af79cd13be357-8c9eb22e922mr1610917085a.18.1770052091509;
        Mon, 02 Feb 2026 09:08:11 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02f07efasm502815585a.51.2026.02.02.09.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:08:10 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH v2 5/9] oe-selftest -r wic.CLITests -> PASS
Date: Mon,  2 Feb 2026 12:07:56 -0500
Message-ID: <20260202170800.4172778-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202170800.4172778-1-twoerner@gmail.com>
References: <20260202170800.4172778-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230384

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


