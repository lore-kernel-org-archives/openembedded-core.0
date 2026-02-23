Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C48EEEC29F
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:35 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6362.1771883433829964960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsyoPvUk;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-899a2f4cdddso1664386d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883432; x=1772488232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziPaPy0MUJCJqPh5lLEbYWtw+3gQanHJ8DGciOzeTUY=;
        b=VsyoPvUk86M7QoDFJY7JK6x2teLeE5kDRk/pR2WuKNbFN6zQyro2ABPADY1EAtVe38
         rAIsKiUx0JQdg5oLB16tN8gtaUXQusabGAAbmik2WnNyqWT950q8QIpTw973oNysAjwq
         XM4YAW9ayV1qTQ8kYCkECC0jhnOZleQeMfwPHDWmCON5lokkl0/G5HFj3mRfsje7+WA7
         +A0lEMSm1D5nbUlFAZX3FhwOlrv6HbjAEZCdF+Hrr4/qayctwP4NkpTPWKbdxxsOfcIC
         AqGMahT5BkkwhZ8uYRHUMMeOlOBMba5pkFfOxnr59anKxrEcqcqk1Pm7Tym6nKVAi85s
         4DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883432; x=1772488232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ziPaPy0MUJCJqPh5lLEbYWtw+3gQanHJ8DGciOzeTUY=;
        b=kLh7UGjH0z5HzDCGKTwCUPa5q2Ehgf4qq3RE+j8YWrW1gb0Rovrg6SlQnwXWmMJmfe
         g5ASp0aZMU5zXXvmY/B+um3IC3sH1fg6yDaGEO66hLW4xp0pBKr8ZI1LlaagyqT8krUU
         RBi+4sLBJCTP+Bxj8mQzPfMrLyMNnkkfzg9b7eLcaiZlDJBEYwaw1lu3PyrEmojb2t4y
         4/pIvNi3pMvNIE5t1Rtxe1CRlarZYSk+4CtngDoh3A/aWf6LU9yOtJzXAMpLJjyHSfM/
         y90LDQs+HrX0okWzVJ63qZ9QFEX8DFxusH8C8NQ5j3zgBnTp2FQHHgnWXUaHLLfsf/98
         foFQ==
X-Gm-Message-State: AOJu0YwiaAILsbmbGih/nrrPKjhYxNGKyaWYpMwR/vYlVwDiykmDOjEs
	M/WjIyuZVI0Twtb/oHNqkEHX+KkHDUNdk7x7HohQM/mYCT/biUgtKrd40izveocLmOo=
X-Gm-Gg: ATEYQzzP8c68Ng/GOIGLod9Ssaddxe7MepDaiz3G0Wa1yEqiyUKhmqTuJuOTNDLfX+P
	Uv76ZN4DvS58fxHiawu/OaHpxwjMTXcqHkTo/BUNxZQPHAZKtotU6K4n/px3ptOCFuQC7TFySy/
	IrnMhbtwuMlkGzRE9M0AffYezi6eaoCum2Qk2xx97rxhPlczgeyK3pY1GAETJ/3auL/ePiDxqod
	ezjRHPaxFwZhjt6NPjnOrt7GymguItbNkdHXcLgh1GisGJkt2OOOAvXkUr3k8lF1Ipx+gF+Xhuw
	8jUoE4lS3PY+NdAZe1sfR6Z5sEjIgXKlcR8b2V16jrIqdnGpAqWqnHIuQ263BDg5/tRL5ubLT7t
	tjIhRcWVTItsdqaTti6grnJYMH0zkO8QYPszwGvAz5aG8bwIGmoLlPp7uWfxVeEoNVDpC41pZJl
	9/QH2YF20qyD6hhQVicAWbCZn9NvcnCfPHro12NrQNa8rCdqJN8LPdf0LVDb6oxpSWJg==
X-Received: by 2002:a05:6214:da9:b0:895:3ec:9e6c with SMTP id 6a1803df08f44-89979c5612amr154503566d6.1.1771883431993;
        Mon, 23 Feb 2026 13:50:31 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:30 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 07/10] oe-selftest/cases/wic.py: oe-selftest -r wic.CLITests -> PASS
Date: Mon, 23 Feb 2026 16:50:05 -0500
Message-ID: <20260223215008.2062721-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223215008.2062721-1-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231708

Changes for the wic.CLITests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Note that the base class for these tests had to change to WicTestCase so
that the wic-native tool would be built and available.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- rebase with master
- split back out into smaller patches
- now that the sector-size re-implementation is ahead of this patch,
  various wic sub commands (ls, rm, cp) no longer need a --vars file

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e9c28baf51eb..22163ccdb3e2 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -99,7 +99,7 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
 
-class CLITests(OESelftestTestCase):
+class CLITests(WicTestCase):
     def test_version(self):
         """Test wic --version"""
         runCmd('wic --version')
@@ -139,18 +139,18 @@ class CLITests(OESelftestTestCase):
 
     def test_list_images(self):
         """Test wic list images"""
-        runCmd('wic list images')
+        runCmd('wic list images -v %s' % self.envfile)
 
     def test_list_source_plugins(self):
         """Test wic list source-plugins"""
-        runCmd('wic list source-plugins')
+        runCmd('wic list source-plugins -v %s' % self.envfile)
 
     def test_listed_images_help(self):
         """Test wic listed images help"""
-        output = runCmd('wic list images').output
+        output = runCmd('wic list images -v %s' % self.envfile).output
         imagelist = [line.split()[0] for line in output.splitlines()]
         for image in imagelist:
-            runCmd('wic list %s help' % image)
+            runCmd('wic list -v %s %s help' % (self.envfile, image))
 
     def test_unsupported_subcommand(self):
         """Test unsupported subcommand"""
-- 
2.51.0


