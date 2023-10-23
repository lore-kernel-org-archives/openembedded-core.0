Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD5EC004C0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 11:06:30 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.117783.1698059183323513364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 04:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksP5l/UR;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53e3e7e478bso4745707a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698059182; x=1698663982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=ksP5l/URke309yr1K+TAxkJQIBZreo7EhSdiALX7gQA8zHipeLYajbzvkjAkrrS5Qf
         lLs66lDXTxeL3+cG1B0yCEqR+n/X28de8AMUCiI2pf5ifR3dIevsPMFvp+ldm3tEYN+g
         nWrw5ITmvpKkj2GQ4MsnFX7KS6qG8xKJ+5Kl+A54kX37p4OkzXzfTCVyZ15MmEPhDohT
         f2ayZ1hCQww9etNzaWueYpks90z9GAMo5freLxOh00FeXOZleWEumjdrPzYQc2n50QhR
         w9tMxjwYCFcPECb2Fsf9eas4JJivhUaTdfg1xWXgL/cWNziPP1koz98lluN74UIZRugW
         nsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059182; x=1698663982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=lD8qpqVufCsILHD8odinmjtYEklVplGptVbPJmtvtScvHDm11rq+cr/dq46XFbXI2w
         ce2bweSafePR+CM0Q68oEvOJOisGnKpM3IcfOqf8oW4ML+UHMRY6NO9uvytVjViJf43n
         JQ1I2gBr40LVZeYMzMElS4NumYYIho6Jqmcv0uHPyiVD4rN0BSVerLia4ywnelDBetTz
         jEUAcqNhmKWhJbSIzBjmBOq+u4tMh0a0N9IDP4tA6EzPL1OdmAssW0fDIisnL+LIIzQS
         JAPy1QHLME3tfSPVAJFjDka92WCYhx6NsC9KbZWnUbnoRINO9UKpITpn8a+3lyDa5V11
         ydRg==
X-Gm-Message-State: AOJu0YxT/AS4H30KMxCbaL4GPpUMWy/4f4fNbUNg3zmZ9Ci1ZJOvu0Tx
	DsbNJRvQIDrimic4t3JlWWy8vGGfDXc=
X-Google-Smtp-Source: AGHT+IEs5YjLmFZF/CnZ9i7i1IPNAHUGifJdV/SBM0IV/2ETdvkf3l0I47AcdxpwSRj6TEs1mFttjw==
X-Received: by 2002:a50:ab13:0:b0:53f:aa86:e839 with SMTP id s19-20020a50ab13000000b0053faa86e839mr5723243edc.30.1698059181282;
        Mon, 23 Oct 2023 04:06:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v28-20020a50d59c000000b00536159c6c45sm6234798edi.15.2023.10.23.04.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 04:06:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] lib/oe/sstatesig.py: dump locked.sigs.inc only when explicitly asked via -S lockedsigs
Date: Mon, 23 Oct 2023 13:06:17 +0200
Message-Id: <20231023110618.3525311-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023110618.3525311-1-alex@linutronix.de>
References: <20231023110618.3525311-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 11:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189619

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


