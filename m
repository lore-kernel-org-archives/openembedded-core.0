Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C89CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:12:40 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.60038.1697821958468500070
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 10:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FvothLDd;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-53db1fbee70so1544490a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697821957; x=1698426757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=FvothLDdz7Y++xdm5zogZmWx2w6e234L4MNfg7n+7txCUydloVCfeF5t8BCXR9TH3N
         jpdtCSXAMhyJQRLcqeRrzdnbm7QAEky22j3+9c0GrzPJNsrXTV3sL54BHx+d+py5N8jN
         UVioF5ws6LjVyNOjpCUKX1AsKP79iGb1VKsz1scRuOlNxHsEMWj5y3nCqLVZyMG5bM2Q
         X9BsXLRhN8h0ZWFHaWTTtTiqV2dggiq+qWfC7DMkYrlZKU8SXcrQalVgGFLmvL2BYS7U
         3oV/VEN9glpKEBIn7RqfdWNf5tKkmM4TwxO+nbvRvtqDwybUKU+WxisEip/ooZciThDQ
         516A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697821957; x=1698426757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=tO+2MjptaeFl+et9zMdfqUPvZL1a6IzVIrtwvyPPfqwRk+aSSHv4JanwPlmWVX8kxt
         S7jCQeGDrvQe66cdcMtCWSpyhx7iqtvltYJxQa5s1ToNBrH27cftBMgBiARuGR+2rt+3
         zOLqcjYt/zUog1TD/ZKNaw/GlMrsUpAIOXrH2of2r32JQVLpYnni+6ko70N44oY+Jw/z
         OQuRPz8etNUtzd1xbaKfg6jya0XWWikt6u5sMKBQ0+OEaglYLFVLwnquef8D4tDpsBI1
         0b3Rd55+dzEJPKMWlSLoz3cI4+wvzZuws1/wx6NxjEoDl/dYi8FJBN2RDejVeDBh4LgR
         f41w==
X-Gm-Message-State: AOJu0YxRm7sJCCOZU6FIZmnqFK9vLqXucw1kPT8sCaaBpRJUnwYjiFEQ
	SBm8dCZDmIlAyTsskPhm3e8jb/zHD+s=
X-Google-Smtp-Source: AGHT+IFmWP2G8PN4bWxqaUTxf58GXkuiU8lwXc/zJTRACHL0DpxVpzeYnk21/Oyyts+2j44AGPeiBQ==
X-Received: by 2002:a17:907:3206:b0:9be:4af4:f5f4 with SMTP id xg6-20020a170907320600b009be4af4f5f4mr1761223ejb.32.1697821956446;
        Fri, 20 Oct 2023 10:12:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090657ca00b009b8dbdd5203sm1857751ejr.107.2023.10.20.10.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:12:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] lib/oe/sstatesig.py: dump locked.sigs.inc only when explicitly asked via -S lockedsigs
Date: Fri, 20 Oct 2023 19:12:31 +0200
Message-Id: <20231020171232.3072396-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 17:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189574

This was writing out locked-sigs.inc into cwd with every
'bitbake -S' invocation. When the intent is only to to get task
stamps (-S none), or print the difference between them (-S printdiff),
the file is unnecessary clutter.

A couple of selftests/scripts were however relying on this, so they're
adjusted to explicitly request the file.

eSDK code calls dump_lockedsigs() separately via
oe.copy_buildsystem.generate_locked_sigs() and so isn't affected.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py                 | 7 ++++---
 meta/lib/oeqa/selftest/cases/archiver.py | 2 +-
 meta/lib/oeqa/selftest/cases/signing.py  | 2 +-
 scripts/lib/checklayer/__init__.py       | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 42e13a8c800..e250f51c124 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -142,9 +142,10 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         super().set_taskdata(data[3:])
 
     def dump_sigs(self, dataCache, options):
-        sigfile = os.getcwd() + "/locked-sigs.inc"
-        bb.plain("Writing locked sigs to %s" % sigfile)
-        self.dump_lockedsigs(sigfile)
+        if 'lockedsigs' in options:
+            sigfile = os.getcwd() + "/locked-sigs.inc"
+            bb.plain("Writing locked sigs to %s" % sigfile)
+            self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
 
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 3fa59fff510..3cb888c5067 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -141,7 +141,7 @@ class Archiver(OESelftestTestCase):
         pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
 
         # Generate the tasks signatures
-        bitbake('mc:mc1:%s mc:mc2:%s -c %s -S none' % (pn, pn, task))
+        bitbake('mc:mc1:%s mc:mc2:%s -c %s -S lockedsigs' % (pn, pn, task))
 
         # Check the tasks signatures
         # To be machine agnostic the tasks needs to generate the same signature for each machine
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 322e753ed3b..18cce0ba258 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -191,7 +191,7 @@ class LockedSignatures(OESelftestTestCase):
 
         bitbake(test_recipe)
         # Generate locked sigs include file
-        bitbake('-S none %s' % test_recipe)
+        bitbake('-S lockedsigs %s' % test_recipe)
 
         feature = 'require %s\n' % locked_sigs_file
         feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 0a0db2f02ac..8271ed7fe3b 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -307,7 +307,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
     cmd += 'bitbake '
     if failsafe:
         cmd += '-k '
-    cmd += '-S none world'
+    cmd += '-S lockedsigs world'
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
     if os.path.exists(sigs_file):
         os.unlink(sigs_file)
-- 
2.39.2


