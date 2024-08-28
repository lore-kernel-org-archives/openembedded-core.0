Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DFFC71147
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 20:58:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.7228.1724878704768628394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 13:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f6N/u768;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-533488ffaddso8740304e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 13:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724878702; x=1725483502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLqX3b/NiCXhNhdFBBEcH/7xZYC7WvCByT11to8Oi64=;
        b=f6N/u768JgLI5qaiAZsRDRro/Gps2hZ7A9BoSek5gmbz2lGc1yvtJ3cvntHMtNJyGF
         ITHfGJi/Z3NBTdruhPtzq9b828T98wJa5DNNf7FOK/w2VA/on6hzBYMkygZWhVKCcHkQ
         0Lgab48aTuqqYg+AghrnK9nKzEbI+kHDyP/fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878702; x=1725483502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLqX3b/NiCXhNhdFBBEcH/7xZYC7WvCByT11to8Oi64=;
        b=VOorURYl+kMjbrIycpn66QKJDSNSNnnYhj5RU8oB4GFEOkKZggN83n5BoVg5I/PS+/
         Rd51apMzIoD54RFzeuM8WmmbnmJTMvr8x4cvWgel9IF8ptbnDfPEMKJ61urQ1JU1cb63
         UNa+WhHCMFI1psPakfZ7YmOUwwGflLV7zJiIVG1WFAcX9MgB1ZRJtyGF9MjxmahgaHFS
         o8P33HcXUW2IkImO15kgVWdAsprpi+fsLb3JH9IFtqH0UE3lSnuohvqwjfCsvgzgdmTJ
         DLIfz90Wim/ruC3myi5d30co/iaNSTu8aG3AilrVCVq0P4IsFcx9WfbUitp+sCrvrfPj
         v/sA==
X-Gm-Message-State: AOJu0Yw9asfLL8W49vyVNKPwwXUP3WxeuqHUu2bV+xLK3xH+MAK48qjf
	qJXOssdVV/8HoUNRrkS3Lh4Fngd2BwMrUcUHgTvdwxvyNTeF/uN4DagZHbzS72im8DJ1n1VGSnu
	P
X-Google-Smtp-Source: AGHT+IGf3voUvNQM0B+qMACEJR4DOpaMtmIb1TWL6Cjj17RyMKgpDdR6LQ6rUIc0IQpmKJnEQXERxw==
X-Received: by 2002:a2e:4a09:0:b0:2f5:c4f:ddbe with SMTP id 38308e7fff4ca-2f61092397emr4625191fa.38.1724878701428;
        Wed, 28 Aug 2024 13:58:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:354e:532a:804e:264e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba64258absm31162925e9.41.2024.08.28.13.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:58:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] insane: Further simplify code
Date: Wed, 28 Aug 2024 21:58:18 +0100
Message-ID: <20240828205819.1697047-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 20:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203895

Now handle_error is used, we can further simplify the QA test execution
as we don't need seperate function lists for warnings and errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 41 ++++++++++--------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index c664a86b41c..7ef2ffcc8b3 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -780,21 +780,12 @@ def qa_check_staged(path,d):
             if not skip_shebang_size:
                 package_qa_check_shebang_size(path, "", d, None, errors)
 
-
-
-# Run all recipe-wide warnfuncs and errorfuncs
-def package_qa_recipe(warnfuncs, errorfuncs, pn, d):
-    for func in warnfuncs:
-        func(pn, d)
-    for func in errorfuncs:
-        func(pn, d)
-
 def prepopulate_objdump_p(elf, d):
     output = elf.run_objdump("-p", d)
     return (elf.name, output)
 
 # Walk over all files in a directory and call func
-def package_qa_walk(warnfuncs, errorfuncs, package, d):
+def package_qa_walk(checkfuncs, package, d):
     elves = {}
     for path in pkgfiles[package]:
             elf = None
@@ -815,9 +806,7 @@ def package_qa_walk(warnfuncs, errorfuncs, package, d):
     for path in pkgfiles[package]:
             if path in elves:
                 elves[path].open()
-            for func in warnfuncs:
-                func(path, package, d, elves.get(path))
-            for func in errorfuncs:
+            for func in checkfuncs:
                 func(path, package, d, elves.get(path))
             if path in elves:
                 elves[path].close()
@@ -1005,7 +994,7 @@ def package_qa_check_unlisted_pkg_lics(package, d):
                                "listed in LICENSE" % (package, ' '.join(unlisted)), d)
     obsolete = set(oe.license.obsolete_license_list()) & package_lics - recipe_lics_set
     if obsolete:
-        oe.qa.handle_error(messages, "obsolete-license",
+        oe.qa.handle_error("obsolete-license",
                                "LICENSE:%s includes obsolete licenses %s" % (package, ' '.join(obsolete)), d)
 
 QAPKGTEST[empty-dirs] = "package_qa_check_empty_dirs"
@@ -1150,20 +1139,19 @@ python do_package_qa () {
     def parse_test_matrix(matrix_name):
         testmatrix = d.getVarFlags(matrix_name) or {}
         g = globals()
-        warnchecks = []
+        checks = []
         for w in (d.getVar("WARN_QA") or "").split():
             if w in skip:
                continue
             if w in testmatrix and testmatrix[w] in g:
-                warnchecks.append(g[testmatrix[w]])
+                checks.append(g[testmatrix[w]])
 
-        errorchecks = []
         for e in (d.getVar("ERROR_QA") or "").split():
             if e in skip:
                continue
             if e in testmatrix and testmatrix[e] in g:
-                errorchecks.append(g[testmatrix[e]])
-        return warnchecks, errorchecks
+                checks.append(g[testmatrix[e]])
+        return checks
 
     for package in packages:
         skip = set((d.getVar('INSANE_SKIP') or "").split() +
@@ -1177,20 +1165,19 @@ python do_package_qa () {
             oe.qa.handle_error("pkgname",
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
-        warn_checks, error_checks = parse_test_matrix("QAPATHTEST")
-        package_qa_walk(warn_checks, error_checks, package, d)
+        checks = parse_test_matrix("QAPATHTEST")
+        package_qa_walk(checks, package, d)
 
-        warn_checks, error_checks = parse_test_matrix("QAPKGTEST")
-        for func in warn_checks:
-            func(package, d)
-        for func in error_checks:
+        checks = parse_test_matrix("QAPKGTEST")
+        for func in checks:
             func(package, d)
 
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, d)
 
-    warn_checks, error_checks = parse_test_matrix("QARECIPETEST")
-    package_qa_recipe(warn_checks, error_checks, pn, d)
+    checks = parse_test_matrix("QARECIPETEST")
+    for func in checks:
+        func(pn, d)
 
     if 'libdir' in d.getVar("ALL_QA").split():
         package_qa_check_libdir(d)

