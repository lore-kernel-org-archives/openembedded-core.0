Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F1BCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:30:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.215662.1697549458144574874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OoL0k3hC;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so915216266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697549456; x=1698154256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+orJAU5qKbCFhIw84Np4f5XTDZeBKrdiF19t45j6f0=;
        b=OoL0k3hCLgtvhDuzVb+nemvFcW8POkEjkn0rZwuU2MX+Hy24b+yJ2NLtjTs33wccWt
         2/Xs0yphblENwGNmfYkY5G20M3u6kYSrMo/VpEEh9RBeh5p3UWRpnC0tsboWL7MywUIe
         tk9k3xWfM262JRpgkoJxF8ofFFjCErBDXmM/nSDFDbPbqM4MZmGXc3SuP8RtNNNgjWLO
         nC44HRrb+tos8dn4rUnsEr9Vn+oy8s5v1XstnRCe5kak4+DWuEFpeJVoxnmWU8lc/FQA
         ezCkcoe1ZNHfTUZvPXixGgjYyl30nrlcnPHfLknAr7Z16d3wXdvA8Y3Zo9WrTGSY8O8A
         ejnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549456; x=1698154256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+orJAU5qKbCFhIw84Np4f5XTDZeBKrdiF19t45j6f0=;
        b=gqen5UK6nQqIjdWgTEktyg7zW97iH7TowXh3mxBgeuzbDTFYcYgpd4upewEqXJVvI+
         VN6vHri3a9b9hmSOHboGkdfRnGG4zKLqpomNl+uHEBVWt3HhCZBGqPLbfnfTHwjPgcJo
         ez2llzDB67CDqiu0rGBCmH61BdNbxOMuUAJx+Gc2fR55EqhzBUj81ZT2QOdOmzBGzsd6
         jVg2m2eWmbrKFT0kWPdYVkjUPYeJw8eFkRsET4bOlY6HXc3s0P0FINpnihd+74279V3B
         Y9vdKEnVz1ZsE1PVJU5dgMxb1+O5reWMUBCPfiJKOLgXF++O30Ejohf9ux5mscN+LwB7
         iZgA==
X-Gm-Message-State: AOJu0YwoXjOAogeo+GORbzthWtHvz5JyksMWBpXl3ZLQMu8PpOrpoL9/
	oUbslizQJJf6S793sMGDJNavLWUNhEw=
X-Google-Smtp-Source: AGHT+IG2AU60cJ74bAk3uOL9jEOJjq23W/luffSq8UpNQbEnQRAwPuBgfw6PrOFI6/HgCqjaBRgvUw==
X-Received: by 2002:a17:907:d8a:b0:9a1:f10d:9746 with SMTP id go10-20020a1709070d8a00b009a1f10d9746mr1724851ejc.20.1697549456129;
        Tue, 17 Oct 2023 06:30:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s22-20020a50ab16000000b0053e589016a7sm956576edc.16.2023.10.17.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:30:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] selftest/sstatetests: add tests for 'bitbake -S printdiff'
Date: Tue, 17 Oct 2023 15:30:49 +0200
Message-Id: <20231017133050.147000-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017133050.147000-1-alex@linutronix.de>
References: <20231017133050.147000-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189332

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
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 104 ++++++++++++++++++
 4 files changed, 111 insertions(+)
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
index bdad9088d37..29e31f2ef9f 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1
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
+        expected_output = ("Task gcc-source-13.2.0:do_preconfigure couldn't be used from the cache because:",
+"We need hash",
+"most recent matching task was")
+        expected_sametmp_output = expected_output + ("Variable do_preconfigure value changed",'+    print("this changes the task signature")')
+        #FIXME: printdiff is supposed to find at least one preconfigure task signature in the sstate cache, but isn't able to
+        #expected_difftmp_output = expected_output
+        expected_difftmp_output = ()
+
+        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source", "-c do_preconfigure gcc-source-13.2.0",
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


