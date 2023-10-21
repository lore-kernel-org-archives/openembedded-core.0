Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B254EC004C0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 12:56:16 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.78801.1697892970847981537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 05:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J2LVqKgb;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so254201166b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697892969; x=1698497769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=J2LVqKgbhIm01giErsRW4VZUcz3G0m855b7SRiT0IjOSja0k2mhJXbcWOfNHzDCTZ3
         xihO4OchsSX4KhsTvYwrs02nm95amGPhJO01MP6gN7Lxj3KlhI5p8mcW1A4e/eAulDdL
         5VTKl2aypE9BrssA0aOnzumbW6wL09s/Etw8ArdRxOyNmD26XvhOee3Mq9husxY4DYI9
         WKfFxsvVcuLOBYDzl240haEg+CwqBfj1tQs1xmNPiF/BK+e6N4RISIEj12yGemPvI8dD
         1NJEM0kEwZvlD/RhAo8vDaxAxW2VmKx+lmEMkMIPhNqyAGLfjiGZf+0fiayrRIPCgtpb
         eviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697892969; x=1698497769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZKuCm5kWrWiInk4myyLcvqCZGzfwAFVfLBX1mV43cQ=;
        b=MyOPxiPh4vxjTHeLdfPjxe5vD8ta+qLxG9ZtHlxt8AQaniZ0ixhAQpj+NNgG5GHApO
         faa/7wngFkmp3oRpS2Q4NgeeE5HBrwKXzqmVajxPhze5ZqLaIB/yGmeMXhYLX+VgpR0Z
         QhV2FQhUpIgqVeQ2DLAv3Sy0yjdwRght/tiSfRWbCsmBNyaSR6tQgL8UxJF4qD9Ibwbu
         o9utdYSeIAgge/6wC2GSJ1MpwDjI9CyA2eEKQoFxkMvvQEFkDtfdEkPWcq7KH88WcMTA
         IB4G8VEdwoNl8uVD54TNiz1P4Tr+RjfXm/EisSQqiwd2OJTjoVfOaSUfapF3b5kqIjio
         3JoQ==
X-Gm-Message-State: AOJu0YzkNUVxoWPQooawyQKxVfcKsCCqrvhM2ZSsRxp0X1u/xsQj5KoH
	V/iIlWO19wnQ4XsahZz0H5w9oTVwhYg=
X-Google-Smtp-Source: AGHT+IG/XrzfkV6iqwVdkwrcRp1YeBPVr+1X4vEtWov5K2DwB4A6k3CqT2zs2OcrWZm4MJM/NKghAA==
X-Received: by 2002:a17:907:928c:b0:9be:6050:7f1b with SMTP id bw12-20020a170907928c00b009be60507f1bmr3090617ejc.0.1697892968885;
        Sat, 21 Oct 2023 05:56:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906088d00b0098ec690e6d7sm3572666eje.73.2023.10.21.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 05:56:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] lib/oe/sstatesig.py: dump locked.sigs.inc only when explicitly asked via -S lockedsigs
Date: Sat, 21 Oct 2023 14:56:03 +0200
Message-Id: <20231021125604.3078754-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 12:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189584

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


