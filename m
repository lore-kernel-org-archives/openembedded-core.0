Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADD5CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 08:47:05 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.276885.1697618823314929822
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 01:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H3CWMa+r;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso6812864a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 01:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697618822; x=1698223622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLtKsIPix/rULgK0eAtr3cdJ1+umTwvyfO0TEWrcz1Q=;
        b=H3CWMa+rDwsNe84PdwrRqTKylnvCbOZw6gb3QD4kjDgk/aW7RWI1BnaulPQqCKIdHR
         3b5B+PvJRf2YKMxZ3tjC3H7+QV6Taai10mE8gTml1cgqQvFBrSsZ9EAvtfcLVmOK2TmV
         gPHebaL4rAY1N6vzzaBhHfQoy2McaNOEbMeBARJ67190PVX0u8XgFuxLIABoKrqriXuW
         UMD28Ibz1Xl3Nz4/3hF/nCuIketU0M1CcE7fdHeN1wCx1WQe01P5D22Hba9Ry+sF9Frq
         YbWPHVQzpk7eScuZ3QaIztjGiyC5sVjHJzKV1PZhKJ399j6IfDQKkC11DjrxsQ6hFcY4
         airQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697618822; x=1698223622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLtKsIPix/rULgK0eAtr3cdJ1+umTwvyfO0TEWrcz1Q=;
        b=fQFFvx19lcjjYN0hc/29kGrnuDthnd9kS11RVOWp3RJz/JmnJ0Xw0WDVgnvCujsXtp
         yD93B7QlDPyuqEqbyduRzYbH3r3Ho2/aPs8LuGIGiyg2iWy4FZnVpPOv7SQ1NaOfl+Qk
         M24N8Ps7aWNCAkK4v24c/gw7BcyVtNho0ZY133KaRiRihrcCX9jYJYnf8CbGTNSZfoRL
         FFOpa7xPcOmUkxsF7IsJX3jMhs3/CKpvt9DqHnZPkID85q1NM7wQEKR0HoKfpCMA8/+q
         ZK/vcCSiErAq/XZBAuxSdHzUnBAql5UBlUgGMlkoIuW+0CTODNddFR1VGYsPV3IXX+xb
         669g==
X-Gm-Message-State: AOJu0YxEcsPxXkBUMfgb6aLVpqZp6P7BUqStx4MQuaFz1ZV1Mi2VIT28
	IWjhsnH+uSlqssYGWiBZYJzr//L5c7w=
X-Google-Smtp-Source: AGHT+IFA3kJncHAf6lSDXJbwYwokw3ktax8J3mSdqEazTyd9Ra3Ok4X1QQDrh1pSRBDInDqkT+HIjA==
X-Received: by 2002:a05:6402:3595:b0:53d:d9d0:9c8f with SMTP id y21-20020a056402359500b0053dd9d09c8fmr2844084edc.40.1697618821389;
        Wed, 18 Oct 2023 01:47:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id e17-20020a50a691000000b00534e791296bsm2514741edc.37.2023.10.18.01.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:47:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] selftest/sstatetests: add tests for 'bitbake -S printdiff'
Date: Wed, 18 Oct 2023 10:46:52 +0200
Message-Id: <20231018084652.900785-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189370

'bitbake -S printdiff' is a useful diagnostic facility for finding out
why sstate is not being reused, but until now it had no tests that would
ensure it works. This commit adds three basic scenarios:

1. make a change in a really basic, common recipe that is at the very root
of dependency trees (quilt-native), and ensure that change is correctly discovered when
building an image.

2. make a change in gcc-source recipe, which is somewhat special
(operates in work-shared), and ensure that gcc-runtime builds track
that down as well.

3. make a change in base_do_configure() definition from base.bbclass,
which is not recipe-specific, but affects many basic recipes, and ensure that
is correctly reported as well.

The test itself actually runs twice:
- first against a fully populated build directory, where
the printdiff code is guaranteed to find the correct previous
stamp that can be compared with in a predictable manner.

- then in an empty build directory where the printdiff code
goes to look in the sstate cache, and so the existence of the
previous signature can be tested, but not the difference with it
(what the exact difference would be is unpredictable as the
sstate cache is indeed shared between many builds).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../base-do-configure-modified.bbclass        |   3 +
 .../gcc-source/gcc-source_%.bbappend          |   2 +
 .../quilt-native/quilt-native_%.bbappend      |   2 +
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 106 ++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 meta-selftest/classes/base-do-configure-modified.bbclass
 create mode 100644 meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
 create mode 100644 meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend

diff --git a/meta-selftest/classes/base-do-configure-modified.bbclass b/meta-selftest/classes/base-do-configure-modified.bbclass
new file mode 100644
index 00000000000..3f96827a428
--- /dev/null
+++ b/meta-selftest/classes/base-do-configure-modified.bbclass
@@ -0,0 +1,3 @@
+base_do_configure:append () {
+	echo "this changes base_do_configure() definiton"
+}
diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
new file mode 100644
index 00000000000..205720982cb
--- /dev/null
+++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
new file mode 100644
index 00000000000..205720982cb
--- /dev/null
+++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index bdad9088d37..6ef339897bf 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -773,3 +773,109 @@ addtask tmptask2 before do_tmptask1
                 latestfiles = sorted(filedates.keys(), key=lambda f: filedates[f])[-2:]
                 bb.siggen.compare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)
                 self.assertEqual(recursecb_count,1)
+
+class SStatePrintdiff(SStateBase):
+    def run_test_printdiff_changerecipe(self, target, change_recipe, change_bbtask, change_content, expected_sametmp_output, expected_difftmp_output):
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
+        bitbake(target)
+        bitbake("-S none {}".format(target))
+        bitbake(change_bbtask)
+        self.write_recipeinc(change_recipe, change_content)
+        result_sametmp = bitbake("-S printdiff {}".format(target))
+
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
+        result_difftmp = bitbake("-S printdiff {}".format(target))
+
+        self.delete_recipeinc(change_recipe)
+        for item in expected_sametmp_output:
+            self.assertIn(item, result_sametmp.output)
+        for item in expected_difftmp_output:
+            self.assertIn(item, result_difftmp.output)
+
+    def run_test_printdiff_changeconfig(self, target, change_content, expected_sametmp_output, expected_difftmp_output):
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstateprintdiff"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
+        bitbake(target)
+        bitbake("-S none {}".format(target))
+        self.append_config(change_content)
+        result_sametmp = bitbake("-S printdiff {}".format(target))
+
+        self.write_config("""
+TMPDIR = "${TOPDIR}/tmp-sstateprintdiff-2"
+""")
+        self.append_config(change_content)
+        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
+        result_difftmp = bitbake("-S printdiff {}".format(target))
+
+        for item in expected_sametmp_output:
+            self.assertIn(item, result_sametmp.output)
+        for item in expected_difftmp_output:
+            self.assertIn(item, result_difftmp.output)
+
+
+    # Check if printdiff walks the full dependency chain from the image target to where the change is in a specific recipe
+    def test_image_minimal_vs_quilt(self):
+        expected_output = ("Task quilt-native:do_install couldn't be used from the cache because:",
+"We need hash",
+"most recent matching task was")
+        expected_sametmp_output = expected_output + ("Variable do_install value changed",'+    echo "this changes the task signature"')
+        expected_difftmp_output = expected_output
+
+        self.run_test_printdiff_changerecipe("core-image-minimal", "quilt-native", "-c do_install quilt-native",
+"""
+do_install:append() {
+    echo "this changes the task signature"
+}
+""",
+expected_sametmp_output, expected_difftmp_output)
+
+    # Check if changes to gcc-source (which uses tmp/work-shared) are correctly discovered
+    def test_gcc_runtime_vs_gcc_source(self):
+        gcc_source_pn = 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
+
+        expected_output = ("Task {}:do_preconfigure couldn't be used from the cache because:".format(gcc_source_pn),
+"We need hash",
+"most recent matching task was")
+        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
+        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
+        #expected_difftmp_output = expected_output
+        expected_difftmp_output = ()
+
+        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure {}".format(gcc_source_pn),
+"""
+python do_preconfigure:append() {
+    print("this changes the task signature")
+}
+""",
+expected_sametmp_output, expected_difftmp_output)
+
+    # Check if changing a really base task definiton is reported against multiple core recipes using it
+    def test_image_minimal_vs_base_do_configure(self):
+        expected_output = ("Task zstd-native:do_configure couldn't be used from the cache because:",
+"Task texinfo-dummy-native:do_configure couldn't be used from the cache because:",
+"Task ldconfig-native:do_configure couldn't be used from the cache because:",
+"Task gettext-minimal-native:do_configure couldn't be used from the cache because:",
+"Task tzcode-native:do_configure couldn't be used from the cache because:",
+"Task makedevs-native:do_configure couldn't be used from the cache because:",
+"Task pigz-native:do_configure couldn't be used from the cache because:",
+"Task update-rc.d-native:do_configure couldn't be used from the cache because:",
+"Task unzip-native:do_configure couldn't be used from the cache because:",
+"Task gnu-config-native:do_configure couldn't be used from the cache because:",
+"We need hash",
+"most recent matching task was")
+        expected_sametmp_output = expected_output + ("Variable base_do_configure value changed",'+	echo "this changes base_do_configure() definiton"')
+        expected_difftmp_output = expected_output
+
+        self.run_test_printdiff_changeconfig("core-image-minimal",
+"""
+INHERIT += "base-do-configure-modified"
+""",
+expected_sametmp_output, expected_difftmp_output)
-- 
2.39.2


