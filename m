Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF1AC41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 19:45:12 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.177902.1697485503772565730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 12:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UOTnK9Me;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41b2bf4e9edso50762831cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697485503; x=1698090303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYq9FjFAiTecFl6L3S5t94rIw2Zlo7fI2VC5nT2VJzQ=;
        b=UOTnK9MejdT3Ko/XWdnVCzhOoecL3SBm+Twf5T7qFOlY/dVdGSPQeUGKugLHOgfGfI
         g8nlx50ZurXX842m8BGMLuR17Eb0jBxicZGXgB/SqvUUaoXL70B47BJoPM6dVOxVpKzl
         zBw1LxY1xCejQVUqC9V4tkoHCSRYtxBYh1vVuorT7D8hADktFNpHZ/I94XfT/ZyiuhOD
         S5Hn5Txno/PgCGA/C5p2YmzCRC7jdoPu0Gl/FAwg/oQC1ozowU2OGyjWCVmgZZNX2CHe
         DISXMgnbcVcpUVtdq6T/PpXkBAf5AOXD/riCUiddYi1j5t8bVk/HeIjGEQ9Q4mKYM1Sn
         2fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485503; x=1698090303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYq9FjFAiTecFl6L3S5t94rIw2Zlo7fI2VC5nT2VJzQ=;
        b=onf6ffz4NzLnVjH9FdJodXFiqF88D16My/Eb7F6WxT+RsiFFgK92+HGZTJrsTIdS9q
         fXtf33tVJ2+HxQLlMNIIsTlPFN8fD5uJmzeGNwT0jDMb883OD0nNlcj1I5sH7VlpFNRZ
         UDeH0A/sqaXE3ggb8Rnva9ZWBfBPRyK2sbqI9MzybkIDw4pOZUixtJpEGZV0cNd/CI4K
         tLrhZnt25Jx/HlCNhc+O/9ojJMJmQeWMi3RXSuEIZg19ZxTYRXgI49deAPXeFglQ6H1R
         Za60r4/X5teqHEUsjuFaaAguuesiL8Waqkl2/OONM6OWL888IF/5Bq49xHMs6ETWo2Kt
         TWWQ==
X-Gm-Message-State: AOJu0YynO4Zma1zdXT4zt/FlkPX0I1LGAhL8f/R1VeelCgeJqgvyZtFm
	pIsFu9EaZy6M66elUyobbNRXGbmKn4ngpUhOv9+NPw==
X-Google-Smtp-Source: AGHT+IG2c1596Mol5CDjDKk5D57+OBT7k9TJ6kQzpxyQ3Npv9gVA4ZjxAxrzV3rXKNw5NSpj26PrLg==
X-Received: by 2002:a05:622a:1450:b0:410:92ca:3dcd with SMTP id v16-20020a05622a145000b0041092ca3dcdmr11537940qtx.9.1697485502680;
        Mon, 16 Oct 2023 12:45:02 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id l22-20020ac87256000000b004033c3948f9sm6733qtp.42.2023.10.16.12.45.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:45:02 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] patchtest: set default repo and testdir targets
Date: Mon, 16 Oct 2023 15:44:58 -0400
Message-ID: <20231016194458.2243201-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016194458.2243201-1-tgamblin@baylibre.com>
References: <20231016194458.2243201-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 19:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189312

Since patchtest is in oe-core, the Python os module's methods can be
used to retrieve the repository path and tests directory by default.
This reduces the number of mandatory arguments for invocation of
patchtest unless the user wants to use a custom test suite or test
patches against a different repo. The REPO and TESTDIR arguments are
likewise adjusted so that they are optional. Also, make it more obvious
what the --startdir flag is meant for on the command line by renaming it
to --testdir, and update the scripts/patchtest.README file to be
consistent with the new usage.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/data.py |  9 +++++++--
 scripts/patchtest          |  6 +++---
 scripts/patchtest.README   | 10 +++++++---
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/lib/patchtest/data.py b/meta/lib/patchtest/data.py
index b661dd64796..12f36aa14d9 100644
--- a/meta/lib/patchtest/data.py
+++ b/meta/lib/patchtest/data.py
@@ -35,6 +35,9 @@ import logging
 logger=logging.getLogger('patchtest')
 info=logger.info
 
+default_testdir = os.path.abspath(os.path.dirname(__file__) + "/tests")
+default_repodir = os.path.abspath(os.path.dirname(__file__) + "/../../..")
+
 # Data store commonly used to share values between pre and post-merge tests
 PatchTestDataStore = collections.defaultdict(str)
 
@@ -58,10 +61,12 @@ class PatchTestInput(object):
         target_patch_group.add_argument('--directory', metavar='DIRECTORY', dest='patch_path',
                             help='The directory containing patches to be tested')
 
-        parser.add_argument('repodir', metavar='REPO',
+        parser.add_argument('--repodir', metavar='REPO',
+                            default=default_repodir,
                             help="Name of the repository where patch is merged")
 
-        parser.add_argument('startdir', metavar='TESTDIR',
+        parser.add_argument('--testdir', metavar='TESTDIR',
+                            default=default_testdir,
                             help="Directory where test cases are located")
 
         parser.add_argument('--top-level-directory', '-t',
diff --git a/scripts/patchtest b/scripts/patchtest
index 9525a2be17d..b25ef183216 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -142,7 +142,7 @@ def _runner(resultklass, prefix=None):
         loader.testMethodPrefix = prefix
 
     # create the suite with discovered tests and the corresponding runner
-    suite = loader.discover(start_dir=PatchTestInput.startdir, pattern=PatchTestInput.pattern, top_level_dir=PatchTestInput.topdir)
+    suite = loader.discover(start_dir=PatchTestInput.testdir, pattern=PatchTestInput.pattern, top_level_dir=PatchTestInput.topdir)
     ntc = suite.countTestCases()
 
     # if there are no test cases, just quit
@@ -220,9 +220,9 @@ if __name__ == '__main__':
     if PatchTestInput.debug:
         logger.setLevel(logging.DEBUG)
 
-    # if topdir not define, default it to startdir
+    # if topdir not define, default it to testdir
     if not PatchTestInput.topdir:
-        PatchTestInput.topdir = PatchTestInput.startdir
+        PatchTestInput.topdir = PatchTestInput.testdir
 
     try:
         ret = main()
diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 689d513df51..ad46b02ad6e 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -79,15 +79,19 @@ To run patchtest on the host, do the following:
    or patchtest-get-series
 3. Run patchtest on a patch file by doing the following:
 
-        patchtest --patch /path/to/patch/file /path/to/target/repo /path/to/tests/directory 
+        patchtest --patch /path/to/patch/file
 
     or, if you have stored the patch files in a directory, do:
 
-        patchtest --directory /path/to/patch/directory /path/to/target/repo /path/to/tests/directory 
+        patchtest --directory /path/to/patch/directory
 
     For example, to test `master-gcc-Fix--fstack-protector-issue-on-aarch64.patch` against the oe-core test suite:
         
-        patchtest --patch master-gcc-Fix--fstack-protector-issue-on-aarch64.patch /path/to/openembedded-core /path/to/openembedded-core/meta/lib/patchtest/tests 
+        patchtest --patch master-gcc-Fix--fstack-protector-issue-on-aarch64.patch
+
+    If you want to use a different test suite or target repository, you can use the --testdir and --repodir flags:
+    
+        patchtest --patch /path/to/patch/file --repodir /path/to/repo --testdir /path/to/test/dir
 
 ### Guest Mode
 
-- 
2.41.0


