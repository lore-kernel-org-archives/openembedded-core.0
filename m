Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A60FEE4FF
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:50 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150263.1772411921526821039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bpnd+enJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-897002b7576so61324426d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411920; x=1773016720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4m22ezMbAi28P1LjypCaTjoESW1+KxpML59C7xCJBsQ=;
        b=bpnd+enJbuSuv3/nXho9sYbkUXE7p6vdXpcxQZDQqUoaFo1m/gNXrWysWTuvzLy3rO
         9M5bk52S0f/aZe2Q0Vs3pFuCSs2qNf7OYG6vpXwjnGMmqrvLxmFFxlirG3Hw33VnWedR
         fYGcb6UQDmR4a1a4fKCPEdu1jic0m5ySrSpLTriKqhyCZwbvStozhrDb4Na0q3i0pQP6
         eotAuaiJ9FiCX6XlALq1JlAaGv81IJILsI9dIOvy56HSgmJE6jlXDBgeXvH1No03zMQR
         rajb6kPXx5BxykMXlYaRoApwkMiKqGfIQuEgyu8C5f5+0cnB7Jkwkk6iQ1C6nClJlmHp
         avkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411920; x=1773016720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4m22ezMbAi28P1LjypCaTjoESW1+KxpML59C7xCJBsQ=;
        b=Gwd4xCz/4FVtnpZpAx6h2YpEYTEq7J23QMZ0HCha+Oip63sVfiVPJEN2ieng05m/tk
         aFLYYhI44VcZeDTf6VJgnAYVZ1Uiyb77WRd715BzlV3aQtMT9dBgptAUv6yUcwO5ga8/
         MhceqBvEseT8wnnCz729PdHd5HgWs5/dwGxPT9cKkE2Tll8jrhEfs0ILVn3D6Tu03elc
         QPAsm7aGp9PMPWxSlRSFPYgS3a1RWKLgTtzOrG55WTrpfXOwEiibuLMN5PiS1zFfhPAm
         P9tpv6+GAZNp6dyt5mkR1FYWFi8sx4zrf5CjAgF0d4GsQcZTxMIWkKqg5OEazs8RWf8l
         KhBg==
X-Gm-Message-State: AOJu0YwGNdQQ7x3LXAKpliMMoaebgK9QcgoSiYlmOunNGHzlBfzJllxo
	8nEz0GGQWETDkI4B1Wz+kN5dHlNSKXIb8RuJqAy7+/ZW5mjNkv8gfVrR9Qq7Li9v
X-Gm-Gg: ATEYQzyznX5w4U1KVeNgSSktfZOsgX0/aUIevoIenREe3ArLXcGJYtO4GvUlk7pRphY
	dn45WZozCiWzG5nVRNtyXmnwGDskVFW7m3RIQqioU04cNz3UQ4OHrcHRxTToMxFWEMQSvSaDjka
	ROtD7qcz3FgK0TteECg0Frf98rHdT8y52wgLs+8nj7lCByhanZsUkAamOIjDH3Zd+XY84xZzCOW
	id79n3OLSBUKeARA95Vl1I239xlU1xe6L03ZTBDxj9w9uDBE6cbzJyY6RMsUjpxJDWvXmkCzy9g
	F+dSbm2awXSBWIj/FunOfPX2A8HLP6ThKQCJTu1aCef00HW0dr8vi7VtOgKuB1GuqU7iB645/cD
	NSEe9jUiqIJh4bNsnXL51DG7yTrVoHeGY3mj8tfKwm2dFb4Oy0Su6EIkcz9ta/lnq4RBjYtoJPt
	skbbwglrs8cG1k1XT5mcKDIPCkCejbZDVUpJNpJyEABKBSebf0s+M+LGVznbwyL+WeVw==
X-Received: by 2002:a05:6214:2682:b0:899:c770:4e9d with SMTP id 6a1803df08f44-899d1e59398mr159617106d6.59.1772411919620;
        Sun, 01 Mar 2026 16:38:39 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:37 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 6/9] oe-selftest/cases/wic.py: oe-selftest -r wic.CLITests -> PASS
Date: Sun,  1 Mar 2026 19:38:23 -0500
Message-ID: <20260302003826.3995222-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302003826.3995222-1-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232152

Changes for the wic.CLITests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

Note that the base class for these tests had to change to WicTestCase so
that the wic-native tool would be built and available.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v7:
- none

changes in v6:
- none

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


