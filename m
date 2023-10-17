Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7436CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:30:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.215017.1697549457393830246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fs9AHE24;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so9928785a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697549456; x=1698154256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhMyz5Qhu/mTqz9tIkgVze52Wu129gn4ot1H+CtUW/w=;
        b=fs9AHE24XZtvySndAbt+xXcKD63v2N5P3yHQ8WVDIDg5u8ayDg//wzyV1cWZcCfNHE
         1rFwt1jKKi4XrTNUc14B4tK3ZwQlv9krTgX3NvHX8tiiwe/wKB3dn6AmiiKa+Cg3pySO
         aO5LvxJcFlyRKDbUfPS6FYWoBBLTqVJW4Dt0ESegnWi20n5OFi+elJ8EjcQJQWxFFZi4
         SKfjff4XqfqR9cXvzGmWks0JVneAhyMix2FfthgBIGOAyzAWBwgp1mUSfsvjX1fry0j8
         CMwzKw8GPivipeN0Adq8Mo+dJrUjKt2BIDFWJ0u8hLX816uXTUGrEBWbr1tWsreJqgYP
         AE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549456; x=1698154256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhMyz5Qhu/mTqz9tIkgVze52Wu129gn4ot1H+CtUW/w=;
        b=o+hvGk1etzKuqoKlTbw0uS0gl5AMgylMm2rqzv7dQ7L+EI+3EmDRB6w2RKFhve7Whj
         xQa/9Jh00dGGeVfXx0p6Vv6kaYncF4t9ZYLQdb3YGVgUhPKyCSaob1bu0dWam4DJ7v4x
         gNTBRP6i4wZUzGk59m2ycDRr4Ie5JgfQR0yLUKor/illD+rga3fF/p3nh8z2tDXj2dxL
         dnZ56HTpzvlHSXjYO09v6PCy8uewgSW7Cwb0A60hfLvpuiz4gNNR1GtLOk02LRFwymna
         yVQpYQ2bcggGtyuHp1Mdfq2L/k7R43PUVaU4A33RPBAhwazOefYhyCY9ebI9nKDBR++t
         OysA==
X-Gm-Message-State: AOJu0Ywl4bBQksNv9OUukKlE/32iCckDlJTput7C+BrXkMgZ12IoFPuN
	GKZl52YtTy8McF1fpKEpKV7cS5ymD0A=
X-Google-Smtp-Source: AGHT+IG6p2jvScEReZDO99fLcY6wN9RAZeMgBEZQqWKobFic7BJQV6zKujBdQwI03n9XhDJMMbOzjQ==
X-Received: by 2002:a05:6402:4410:b0:530:bd6b:7a94 with SMTP id y16-20020a056402441000b00530bd6b7a94mr2183296eda.24.1697549455183;
        Tue, 17 Oct 2023 06:30:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s22-20020a50ab16000000b0053e589016a7sm956576edc.16.2023.10.17.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:30:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] lib/oe/sstatesig.py: dump locked.sigs.inc only when explicitly asked via -S lockedsigs
Date: Tue, 17 Oct 2023 15:30:48 +0200
Message-Id: <20231017133050.147000-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189331

This was writing out locked-sigs.inc into cwd with every
'bitbake -S' invocation. When the intent is only to to get task
stamps (-S none), or print the difference between them (-S printdiff),
the file is unnecessary clutter.

A couple of selftests were however relying on this, so they're
adjusted to explicitly request the file.

eSDK code calls dump_lockedsigs() separately via
oe.copy_buildsystem.generate_locked_sigs() and so isn't affected.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/sstatesig.py                 | 7 ++++---
 meta/lib/oeqa/selftest/cases/archiver.py | 2 +-
 meta/lib/oeqa/selftest/cases/signing.py  | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5bf1697e727..63d792efe9d 100644
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
-- 
2.39.2


