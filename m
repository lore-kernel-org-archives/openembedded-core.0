Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8FECCD1A2
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:27:30 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.14209.1760704045776483115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=l51wzJuw;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5797c8612b4so2720925e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760704044; x=1761308844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGOhKf8bAWQ25ZIuQhoqD1gi/4MHO8cN2QfNI/ZZpN0=;
        b=l51wzJuwFiPWttUygm57WRkuVrDPod6VgAJFVJ14dY6RWOQsEm3i7yA5kg2OtDQ3c0
         MnFJyBVdmzxaX7OUniGZH68BA7LkIDDLkMCxPMS4V/0HyqKccERb8dstvFkOnkrfHias
         FnJM62vezXEhG35k8kR7dMvfluHaJP0nm5rLD32PKW/fyfjKsMyHhAMSbOUyGvxRHmAL
         Bm0tmrhqbXmkTkF4ckH0bhkzhcykEI5lbJJe+maxl/+JqTSAFJlG0Ooe7FQiXwb8R/eN
         1H0PsgM6FB48jf3LVerFVAJMu8wYwsSynu5XoqmDWJ0zlEv5p4MDS8ZlhDQBQKH2Sn4b
         Unvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760704044; x=1761308844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGOhKf8bAWQ25ZIuQhoqD1gi/4MHO8cN2QfNI/ZZpN0=;
        b=J7ME9oMRNUTV7kcCx/1qncDe07G7iGK5ae361wD9x1XyKZg/QI31kDaHz2ajxzTNMi
         3f8MzO0bXaK3gI+06jwB2p27f26FvYxK/0Lmllt3HsQZa/d5FJGF1owj9sPJ9MRfYdIC
         sqkIYfZe3zf5LoawVRxrJtVaIcwPdAfdHd5Z02njE4vPD3ngJKZB+NdF7l+LibJjTlE/
         tugIWL2qQlTjxXjOc67sP97fHbChDa9HUq7sOrfoYhjMuEm7jmqhLGNUkYZR1u25CxY0
         8eal4HzdEjLDFT3cIT58wjKLQhxWHF61yLB2karSzZsWNw3l1DB+XVLhxosSbxBrIoER
         oXVA==
X-Gm-Message-State: AOJu0YxDtydH5EaDvdxD4yNZ65txtISgbvVVXyleqTazj8UMy4EUlSRD
	jc3/HnZGkNKTZ49y8lWctNgNL6pXWvbHdJxT2xNbjWAu1w1Ecksj2Pa6T4v5NyCHhOA1JScK7Je
	rPkYD/U4=
X-Gm-Gg: ASbGncvfcBVIoQ1+hZgvplSp61ama2MBkHYnyItbfCeUZkDkyQ2Tw8/Or5ibSzPWJow
	WChmzQLJetOuT/JyKjtD9RCK0Boi/vZd7EjuSgewELKGm6Td6P1LdjO3YmySNfstq3IXj3LTrd5
	q0LEYSSNQK6XrQKeHPqg5JUexuCw/l0drSIJR3JRY3dAUSNk6BbbzzP/TygP+bX1xif7wxOZ8MY
	pRId78r67W5oYB3dbAqba/BlgtCtaXaOy8GyVJK4WugzggniFHpJGIDpJWtGgHvEKZlIBl3tDXH
	Uj+5UbWkHLMtehmC1cYP2RVm0cLFXV+Nrsta/CwHU91CzID4ZPo7fZ6FApJMKfxvIgyJvC6IhxZ
	2iFe6/Zzw2fKK0h6oXVLZi8AOcD+wLSySYlu0WPc4HED6E5x/9owht1zpDJdbS9u/3w3kfIRfFf
	XUPiTbkIhRpI0Stfi8wycLLw9nFjPqV/qVXA==
X-Google-Smtp-Source: AGHT+IEI0soL/Fm7tFfu08hhD4UxTtA3Ys9lMmxU39ahK1WIvHNN5nKCkR6+C/lXa/zSoafnvnT8vQ==
X-Received: by 2002:a2e:bcc2:0:b0:375:ffc2:1b1d with SMTP id 38308e7fff4ca-3779783a3bbmr11092681fa.4.1760704043873;
        Fri, 17 Oct 2025 05:27:23 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ab05sm61421371fa.44.2025.10.17.05.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:27:23 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 5/5] selftest runtime_test.py: disable qemu graphics
Date: Fri, 17 Oct 2025 15:26:49 +0300
Message-ID: <20251017122649.493701-6-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017122649.493701-1-mikko.rapeli@linaro.org>
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225017

Tests don't need it and graphics can cause boot failures.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index d58ffa80f5..8f99bcd4cb 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -42,7 +42,7 @@ class TestExport(OESelftestTestCase):
         isdir = os.path.isdir(testexport_dir)
         self.assertEqual(True, isdir, 'Failed to create testexport dir: %s' % testexport_dir)
 
-        with runqemu('core-image-minimal') as qemu:
+        with runqemu('core-image-minimal', runqemuparams='nographic') as qemu:
             # Attempt to run runexported.py to perform ping test
             test_path = os.path.join(testexport_dir, "oe-test")
             data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
@@ -318,7 +318,7 @@ class Postinst(OESelftestTestCase):
                 self.assertTrue(os.path.isfile(os.path.join(hosttestdir, "rootfs")),
                                 "rootfs state file was not created")
 
-                with runqemu('core-image-minimal') as qemu:
+                with runqemu('core-image-minimal', runqemuparams='nographic') as qemu:
                     # Make the test echo a string and search for that as
                     # run_serial()'s status code is useless.'
                     for filename in ("rootfs", "delayed-a", "delayed-b"):
@@ -441,7 +441,7 @@ IMAGE_INSTALL:append = " systemtap-runtime"
             systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
-            with runqemu(self.image) as qemu:
+            with runqemu(self.image, runqemuparams='nographic') as qemu:
                 cmd = "crosstap -r root@192.168.7.2 -s %s/general/helloworld.stp " % systemtap_examples 
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap helloworld returned a non 0 status:%s' % result.output)
@@ -453,7 +453,7 @@ IMAGE_INSTALL:append = " systemtap-runtime"
             systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
-            with runqemu(self.image) as qemu:
+            with runqemu(self.image, runqemuparams='nographic') as qemu:
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/pstree.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap pstree returned a non 0 status:%s' % result.output)
@@ -465,7 +465,7 @@ IMAGE_INSTALL:append = " systemtap-runtime"
             systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
-            with runqemu(self.image) as qemu:
+            with runqemu(self.image, runqemuparams='nographic') as qemu:
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_proc.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_proc returned a non 0 status:%s' % result.output)
@@ -477,7 +477,7 @@ IMAGE_INSTALL:append = " systemtap-runtime"
             systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
             bitbake(self.image)
 
-            with runqemu(self.image) as qemu:
+            with runqemu(self.image, runqemuparams='nographic') as qemu:
                 cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
                 result = runCmd(cmd)
                 self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
-- 
2.34.1


