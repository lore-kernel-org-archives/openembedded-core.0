Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6F468780B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:07:45 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 77so76359020wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JouENV+GF45qTkQXmm8BtBbahR6kyQlZ2Bbe5vGoYzA=;
	b=wo7cftrSe+k3+gq/J/udL9q6BndmBx31nGrdHvKY3EsEMIFnyK3nwGQdLcM0CMLS7e
	Jry3cHiOR/J8Tol1bLKe/pzCQdDV1bbwUhyDSVBdD7Lkyj+GfQJK0SMQ7IGGSz7wDIxB
	7FfYZFEvFV8t8inyxiz4BmTGdDNYhqar/e2UVZ4smoemRMO0K0o8ceLrZEh0EMAv5JQT
	pj8ar3rqfZpGqEVThvJytg3MQMzOjxzy+3eBlIN06QipjfCXqnnRFY9UtFAKBLpmcRW4
	49vwNUqH8LYToI6KhYnjK0jdNH3KkP8PRD7sVHQYBs7zhW3bcnPzLOvmTiTQcpwY4hWg
	e+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JouENV+GF45qTkQXmm8BtBbahR6kyQlZ2Bbe5vGoYzA=;
	b=Blw7Kr3OEPqzizLHKi9dL8oKGYp8qmOzsD0oMTpD7qf5gwR7qyxb6mj34xmz1bp54z
	qf5RPp1Sm315gf5MfkPCnKkF7TdFirvESsJWvfPXjV5yEa3Gl8rpEtjhIzT3RQpb2DTs
	l3+C9TbWJfYebTfkVqkG/wkJ8KskFrJ0da3VhHJuyzmh5+dQl/1fGCOs2A1EixDQ75bb
	sJVPpb60PNRC/Tr15a0ThNzArt+qbQS+ytkjqEkd5BQ31Tdi2OwTuU1mk/D34WCAz1t7
	/M6jfp5Tb96/Dl8kjPGgF0jK9AvDwSBCe8bhGcucv4PY5ZiMagbf2Q8mZbNyiO3OkGuF
	x0Fg==
X-Gm-Message-State: AKS2vOyQbwDRJ2+ssaExOVO3TnT8P/DXNII5w4niRskcG64uetFCy3Xx
	zathemfOFBRfluNDJdE=
X-Received: by 10.223.155.222 with SMTP id e30mr5224156wrc.55.1497884865948;
	Mon, 19 Jun 2017 08:07:45 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	f21sm15987569wra.5.2017.06.19.08.07.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:07:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 16:07:41 +0100
Message-Id: <20170619150741.14635-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170619150741.14635-1-ross.burton@intel.com>
References: <20170619150741.14635-1-ross.burton@intel.com>
Subject: [PATCH 2/2] insane: add extensible framework for recipe-wide QA tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jun 2017 15:07:46 -0000

Following QAPATHTEST (QA hook for each file in each package) and QAPKGTEST (QA
hook for each package), add QARECIPETEST: a hook which is executed once per
recipe in do_package_qa.

This makes it trivial to add recipe-wide QA tests that integrate with the
existing tests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 65 +++++++++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 17c9058b04e..0e974b51471 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -808,6 +808,23 @@ def package_qa_package(warnfuncs, errorfuncs, skip, package, d):
 
     return len(errors) == 0
 
+# Run all recipe-wide warnfuncs and errorfuncs
+def package_qa_recipe(warnfuncs, errorfuncs, skip, pn, d):
+    warnings = {}
+    errors = {}
+
+    for func in warnfuncs:
+        func(pn, d, warnings)
+    for func in errorfuncs:
+        func(pn, d, errors)
+
+    for w in warnings:
+        package_qa_handle_error(w, warnings[w], d)
+    for e in errors:
+        package_qa_handle_error(e, errors[e], d)
+
+    return len(errors) == 0
+
 # Walk over all files in a directory and call func
 def package_qa_walk(warnfuncs, errorfuncs, skip, package, d):
     import oe.qa
@@ -1108,34 +1125,33 @@ python do_package_qa () {
     for dep in taskdepdata:
         taskdeps.add(taskdepdata[dep][0])
 
-    for package in packages:
-        def parse_test_matrix(matrix_name):
-            testmatrix = d.getVarFlags(matrix_name) or {}
-            g = globals()
-            warnchecks = []
-            for w in (d.getVar("WARN_QA") or "").split():
-                if w in skip:
-                   continue
-                if w in testmatrix and testmatrix[w] in g:
-                    warnchecks.append(g[testmatrix[w]])
-                if w == 'unsafe-references-in-binaries':
-                    oe.utils.write_ld_so_conf(d)
-
-            errorchecks = []
-            for e in (d.getVar("ERROR_QA") or "").split():
-                if e in skip:
-                   continue
-                if e in testmatrix and testmatrix[e] in g:
-                    errorchecks.append(g[testmatrix[e]])
-                if e == 'unsafe-references-in-binaries':
-                    oe.utils.write_ld_so_conf(d)
-            return warnchecks, errorchecks
+    def parse_test_matrix(matrix_name):
+        testmatrix = d.getVarFlags(matrix_name) or {}
+        g = globals()
+        warnchecks = []
+        for w in (d.getVar("WARN_QA") or "").split():
+            if w in skip:
+               continue
+            if w in testmatrix and testmatrix[w] in g:
+                warnchecks.append(g[testmatrix[w]])
+            if w == 'unsafe-references-in-binaries':
+                oe.utils.write_ld_so_conf(d)
+
+        errorchecks = []
+        for e in (d.getVar("ERROR_QA") or "").split():
+            if e in skip:
+               continue
+            if e in testmatrix and testmatrix[e] in g:
+                errorchecks.append(g[testmatrix[e]])
+            if e == 'unsafe-references-in-binaries':
+                oe.utils.write_ld_so_conf(d)
+        return warnchecks, errorchecks
 
+    for package in packages:
         skip = (d.getVar('INSANE_SKIP_' + package) or "").split()
         if skip:
             bb.note("Package %s skipping QA tests: %s" % (package, str(skip)))
 
-
         bb.note("Checking Package: %s" % package)
         # Check package name
         if not pkgname_pattern.match(package):
@@ -1151,6 +1167,9 @@ python do_package_qa () {
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, skip, d)
 
+    warn_checks, error_checks = parse_test_matrix("QARECIPETEST")
+    package_qa_recipe(warn_checks, error_checks, skip, pn, d)
+
     if 'libdir' in d.getVar("ALL_QA").split():
         package_qa_check_libdir(d)
 
-- 
2.11.0


