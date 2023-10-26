Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC2BC25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:33:35 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.67477.1698316406059794294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HowRVFie;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso112284366b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698316404; x=1698921204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=HowRVFiegMF8TmYyx4XHoqtkLL3Il9YGA1A6VAOFNuO1NtdYYjU807q/Il3lZsn9y1
         uby3YaEX7+iAhkzrsz4xcH7cCJHgTwSMuiQ0y61VJaEOIs1j5JQa5kd382gtPtEdNuo0
         lOWlA5cyhASYSZ2tbBMXLn5eseVO/IOzdbZsNSVwqqfkVGr3qN8b5KZ7OroutqpZpnFW
         BtoDfg85BFjhIRk7dAOaipxU3OwzxRrbiWVwkN+hHrbVUHpJzdTXebObChWMiECwBLkl
         F1aVR65balXymt/5hiJz00wersJSovWBFDh7YPygpBsALQguKoltlonPRqK4hd57LVil
         jkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698316404; x=1698921204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=VESa4Z0K4unGqZ/+owSyVrkZaHU+HB8gO4eQ2iEA1wCTNUv6mDy3vJb0HXN2ZkSreI
         V64Jvp1Bj7eSTUVyq8vLyeJuGoJswFwhcasUX3GFYErSfBb8tCixfwrmRB3HDN+PH395
         E4KnYriX8dyfR5cVMEHan5pOAtt9jcEKa/vzvRlAcbxeZEqQCp/ZohxxZmLtlhZyD1Kr
         Ye6DUWXbeTLMV+UZzjXWWg48V96enT2ITAHybg00b//1aIdb04RxwPvosw1GRtEQQ1XO
         cNACLNnTfE7AamfIvaYS05QSvenO8T9V3H5VMH80ur/ZrhBm1o6SAaK03LFQPQYmEgCo
         SSng==
X-Gm-Message-State: AOJu0YzZFl5sfYAaku7LhCXD1ifp6O8A+GwIZsgJsOp1v4vXtTka8wZx
	GAThrhp9ycbEGG30kB7KFm1TqZ+NwYk=
X-Google-Smtp-Source: AGHT+IE+iTWsOemdKdqUNd+kSeWbd5yGqV3erx8NcMsRRBpB9ZSQuwQ0JN/wVkugRCgwhqr9BE7UTg==
X-Received: by 2002:a17:907:2ce2:b0:9bd:d7bd:1a52 with SMTP id hz2-20020a1709072ce200b009bdd7bd1a52mr12996251ejc.20.1698316404231;
        Thu, 26 Oct 2023 03:33:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u24-20020a170906409800b009bf94de8971sm11444747ejj.70.2023.10.26.03.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:33:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] lib/oe/sstatesig.py: dump locked.sigs.inc only when explicitly asked via -S lockedsigs
Date: Thu, 26 Oct 2023 12:33:19 +0200
Message-Id: <20231026103320.2751277-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231026103320.2751277-1-alex@linutronix.de>
References: <20231026103320.2751277-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189707

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


