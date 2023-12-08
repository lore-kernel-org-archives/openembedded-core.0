Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7625BC10DCE
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 10:15:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17183.1702030531163914527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 02:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JzaylOde;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso25725375e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702030529; x=1702635329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+waqYYg7VWbzxV6xh4FVg3G93gSoP5P0Fg4TpcTCpVo=;
        b=JzaylOdeLkfr+aWVP2/xz4BGAyCwNtS6UBRZ1/ksUxpRz0h0S4VyFLn7OiaNEw0Vin
         f/4rTNkYidcXN8D4NyxXjub70fQdiSeyEdnaM1Lv8sD8fNRly+oQjY/Qmu0F44Np25yq
         c80CHIF19UMNeP5jMBcSVV0vs0S9k4j8UoRA7cLmSP2TW62kz0jwP6xWGE6lxGNPVQfD
         NW2cNziTm8m4UbGu+egpZo1hPpj4NVlctiP0WMon09xqQFpnqH9KTlqs0p506oTSjpH3
         /59a+4gtZ4UKPizwymljtPXVihyGd8U+FWofQAcmwi/DGAScbosmtGRoWcD147Rq3Gv8
         sQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702030529; x=1702635329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+waqYYg7VWbzxV6xh4FVg3G93gSoP5P0Fg4TpcTCpVo=;
        b=DPyWmaCauDQjZKxlEjmi/mcObiC3x4qcTDCYURzZ0qKJ7xpGkZpLr2oNrEYeKm37V/
         peFtmxWFQlYVGZkqPBvUl9+wbNwJqgmd7SLNAGt2FMqXlb3I8BxlI5EZVqccMO4LTJJk
         XSdlxW4bRzCa/j0lShXu+opI+vYRhp7/dZxyZgsPFfu+2F2dnsAoG8G6f7Q/JrdtzM6D
         VZIk7tg0+6JENUPv6u8nKvAMoFnjB0XwFIAo1wofUeZEjYtEkfjGuesHUqSZPRHANN6g
         kO5DF7R/Zb5zzbqCKOIRsqGs5+KhA3TxyudVrynqGHc3IXc4NTVGV6370+HD+cGy9GDk
         +a6g==
X-Gm-Message-State: AOJu0YyCAZ2dOYWDb0VNOz6Wed+qvTdfnHeHEmJtXJ4yfC4wP4cxDWSs
	Wgc6FIjNEh6UTCtexoUKpS8Pokt73uE=
X-Google-Smtp-Source: AGHT+IFL8emwP8feMGBzHMB9SlR3hDGWIjJ94EYMuFsxSkrPNaabMmOIJHweFAAm0T95VVHnEXQCxw==
X-Received: by 2002:a05:600c:1e16:b0:40c:20f1:8f8c with SMTP id ay22-20020a05600c1e1600b0040c20f18f8cmr2528433wmb.112.1702030529300;
        Fri, 08 Dec 2023 02:15:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm2746707wmq.43.2023.12.08.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:15:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] runqueue: rework 'bitbake -S printdiff' logic
Date: Fri,  8 Dec 2023 11:15:21 +0100
Message-Id: <20231208101522.198832-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208101522.198832-1-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 10:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192032

Previously printdiff code would iterate over tasks that were reported as invalid or absent,
trying to follow dependency chains that would reach the most basic invalid items in the tree.

While this works in tightly controlled local builds, it can lead to bizarre reports
against industrial-sized sstate caches, as the code would not consider whether the
overall target can be fulfilled from valid sstate objects, and instead report
missing sstate signature files that perhaps were never even created due to hash
equivalency providing shortcuts in builds.

This commit reworks the logic in two ways:

- start the iteration over final targets rather than missing objects
and stop at the first invalid object

- if a given object can be fulfilled from sstate, do not recurse into
its dependencies; bitbake wouldn't care if they're absent, and neither
should printdiff

This changes the console output significantly: where previously
printdiff would report the most basic invalid tasks it could find,
with this change the most top-level tasks are reported instead. This
is not a problem as diffsigs has its own task recursion facility, and will
track down the actual change anyway. This is reflected in
fixing up the selftests.

[YOCTO #15289]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py                    | 27 +++++-----
 .../perlcross_%.bbappend}                     |  0
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 51 +++++++++++--------
 3 files changed, 43 insertions(+), 35 deletions(-)
 rename meta-selftest/recipes-test/{quilt-native/quilt-native_%.bbappend => perlcross/perlcross_%.bbappend} (100%)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 864708ee4a5..c9fe38615cf 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1717,35 +1717,32 @@ class RunQueue:
                     valid_new.add(dep)
 
         invalidtasks = set()
-        for tid in self.rqdata.runtaskentries:
-            if tid not in valid_new and tid not in noexec:
-                invalidtasks.add(tid)
 
-        found = set()
-        processed = set()
-        for tid in invalidtasks:
+        toptasks = set(["{}:{}".format(t[3], t[2]) for t in self.rqdata.targets])
+        for tid in toptasks:
             toprocess = set([tid])
             while toprocess:
                 next = set()
                 for t in toprocess:
+                    if t not in valid_new and t not in noexec:
+                        invalidtasks.add(t)
+                        continue
+                    if t in self.rqdata.runq_setscene_tids:
+                        continue
+
                     for dep in self.rqdata.runtaskentries[t].depends:
-                        if dep in invalidtasks:
-                            found.add(tid)
-                        if dep not in processed:
-                            processed.add(dep)
-                            next.add(dep)
+                        next.add(dep)
+
                 toprocess = next
-                if tid in found:
-                    toprocess = set()
 
         tasklist = []
-        for tid in invalidtasks.difference(found):
+        for tid in invalidtasks:
             tasklist.append(tid)
 
         if tasklist:
             bb.plain("The differences between the current build and any cached tasks start at the following tasks:\n" + "\n".join(tasklist))
 
-        return invalidtasks.difference(found)
+        return invalidtasks
 
     def write_diffscenetasks(self, invalidtasks):
 
diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend b/meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
rename to meta-selftest/recipes-test/perlcross/perlcross_%.bbappend
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 795cd5bd85f..07e82d25c62 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -824,14 +824,22 @@ TMPDIR = "${{TOPDIR}}/tmp-sstateprintdiff-difftmp-{}"
 
 
     # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
-    def test_image_minimal_vs_quilt(self):
-        expected_output = ("Task quilt-native:do_install couldn't be used from the cache because:",
+    def test_image_minimal_vs_perlcross(self):
+        expected_output = ("Task core-image-minimal:do_create_spdx couldn't be used from the cache because:",
+"Task linux-yocto:do_deploy couldn't be used from the cache because:",
+"Task core-image-minimal:do_create_runtime_spdx couldn't be used from the cache because:",
+"Task core-image-minimal:do_populate_lic_deploy couldn't be used from the cache because:",
+"Task run-postinsts:do_package_write_rpm couldn't be used from the cache because:",
+"Task packagegroup-core-boot:do_package_write_rpm couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable do_install value changed",'+    echo "this changes the task signature"')
+        expected_sametmp_output = expected_output + (
+"Hash for task dependency perlcross-native:do_install changed from",
+"Variable do_install value changed",
+'+    echo "this changes the task signature"')
         expected_difftmp_output = expected_output
 
-        self.run_test_printdiff_changerecipe("core-image-minimal", "quilt-native", "-c do_install quilt-native",
+        self.run_test_printdiff_changerecipe("core-image-minimal", "perlcross", "-c do_install perlcross-native",
 """
 do_install:append() {
     echo "this changes the task signature"
@@ -843,13 +851,18 @@ expected_sametmp_output, expected_difftmp_output)
     def test_gcc_runtime_vs_gcc_source(self):
         gcc_source_pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
 
-        expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
+        expected_output = ("Task gcc-runtime:do_create_spdx couldn't be used from the cache because:",
+"Task gcc-runtime:do_create_runtime_spdx couldn't be used from the cache because:",
+"Task gcc-runtime:do_populate_sysroot couldn't be used from the cache because:",
+"Task gcc-runtime:do_package_qa couldn't be used from the cache because:",
+"Task gcc-runtime:do_packagedata couldn't be used from the cache because:",
+"Task gcc-runtime:do_package_write_rpm couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
-        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
-        #expected_difftmp_output = expected_output
-        expected_difftmp_output = ()
+        expected_sametmp_output = expected_output + ("Hash for task dependency {}:do_preconfigure changed from".format(gcc_source_pn),
+"Variable do_preconfigure value changed",
+'+    print("this changes the task signature")')
+        expected_difftmp_output = expected_output
 
         self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
 """
@@ -861,19 +874,17 @@ expected_sametmp_output, expected_difftmp_output)
 
     # Check if changing a really base task definiton is reported against multiple core recipes using it
     def test_image_minimal_vs_base_do_configure(self):
-        expected_output = ("Task zstd-native:do_configure couldn't be used from the cache because:",
-"Task texinfo-dummy-native:do_configure couldn't be used from the cache because:",
-"Task ldconfig-native:do_configure couldn't be used from the cache because:",
-"Task gettext-minimal-native:do_configure couldn't be used from the cache because:",
-"Task tzcode-native:do_configure couldn't be used from the cache because:",
-"Task makedevs-native:do_configure couldn't be used from the cache because:",
-"Task pigz-native:do_configure couldn't be used from the cache because:",
-"Task update-rc.d-native:do_configure couldn't be used from the cache because:",
-"Task unzip-native:do_configure couldn't be used from the cache because:",
-"Task gnu-config-native:do_configure couldn't be used from the cache because:",
+        expected_output = ("Task core-image-minimal:do_create_spdx couldn't be used from the cache because:",
+"Task linux-yocto:do_deploy couldn't be used from the cache because:",
+"Task core-image-minimal:do_create_runtime_spdx couldn't be used from the cache because:",
+"Task core-image-minimal:do_populate_lic_deploy couldn't be used from the cache because:",
+"Task run-postinsts:do_package_write_rpm couldn't be used from the cache because:",
+"Task packagegroup-core-boot:do_package_write_rpm couldn't be used from the cache because:",
 "We need hash",
 "most recent matching task was")
-        expected_sametmp_output = expected_output + ("Variable base_do_configure value changed",'+	echo "this changes base_do_configure() definiton "')
+        expected_sametmp_output = expected_output + ("Hash for task dependency gnu-config-native:do_configure changed from",
+"Variable base_do_configure value changed",
+'+	echo "this changes base_do_configure() definiton "')
         expected_difftmp_output = expected_output
 
         self.run_test_printdiff_changeconfig("core-image-minimal",
-- 
2.39.2


