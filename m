Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id F011D71B80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 23:44:30 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g23so128374404wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uMMp9aQ+3AxiS5iphKvRgW/P7gcZjY/dUxGk3O3olSI=;
	b=yszxg59PHcXSNu+tV400NJiDHy3s2nK8ihWuOMSiK2OQ0EIEZaGtdqfzdzZ5QAcJPm
	qPgtkqV6vDNs82i2alwzi32cYaEtkfzMNpaBkKT9scn31K6+QOWuuj21iowS+F67Ea+I
	LQon26BTXADrK4ffwse1kDJXzHtu7YgBL9p8JyNX8Q1xkF1HVB+xyUcO8ZLxJpNJunpL
	n/YkW8uaR9/jHBMleOmIuiC1D3K1RrzKCKM92gKODROYLVkBSghDn3vLd9INzp5DdekZ
	TZhu1Ha9qDC6JDRaBssz6A+d6+Ieb6ndEjh28WOrwQwIAfA95sSWhc+JUC6AKcCdsFgk
	6Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uMMp9aQ+3AxiS5iphKvRgW/P7gcZjY/dUxGk3O3olSI=;
	b=d7OJ2JvreX/SHbbiKOrvQpU0Nzt8kYGnxgfafChu6OX7yFOLZpTnIZwKz+o0ZLcWmf
	gVSPB2F9Hk7/sazzH95FYlZ3hIPvRU05D7kESOEJsx0xiQHWdyE1hmhCzqtFMoI9VJtZ
	XMrX7pepUfq7OMJegqjoSrX0wyrxQwGMDSg+BFfAjfYR7KoAtAf7gSkdTq059M1Ie65m
	3pRdKl8o1SBU88/QPAFAMJQBZyLqTVpyJJ4/JqMCZ4hoKK6KA3tvL0T5YTTbvvhbh0Xo
	KQm3zOiJwdT9XuCJX/Pn1ribm6ZDsba5A17Y1SbRP3OV7FN3cfsr/JRx2s0fb7jqFh3s
	EpWQ==
X-Gm-Message-State: AKaTC01GcrvPp9BGtjstydP87UMbW9aQ77nKZrgPIK4BTHGebzWpsK5xeKDvP8ak1B7IChr8
X-Received: by 10.28.74.133 with SMTP id n5mr4460126wmi.132.1480031071507;
	Thu, 24 Nov 2016 15:44:31 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yg1sm44209118wjb.12.2016.11.24.15.44.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Nov 2016 15:44:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 23:44:23 +0000
Message-Id: <1480031065-19435-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
References: <1480031065-19435-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] insane: factor out the test matrix processing
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
X-List-Received-Date: Thu, 24 Nov 2016 23:44:31 -0000

Pull the test matrix processing out as a function so it can be reused.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9f3065f..0ba4cae 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1116,7 +1116,6 @@ python do_package_qa () {
     if not packages:
         return
 
-    testmatrix = d.getVarFlags("QAPATHTEST")
     import re
     # The package name matches the [a-z0-9.+-]+ regular expression
     pkgname_pattern = re.compile("^[a-z0-9.+-]+$")
@@ -1126,28 +1125,33 @@ python do_package_qa () {
     for dep in taskdepdata:
         taskdeps.add(taskdepdata[dep][0])
 
-    g = globals()
     for package in packages:
+        def parse_test_matrix(matrix_name):
+            testmatrix = d.getVarFlags(matrix_name) or {}
+            g = globals()
+            warnchecks = []
+            for w in (d.getVar("WARN_QA", True) or "").split():
+                if w in skip:
+                   continue
+                if w in testmatrix and testmatrix[w] in g:
+                    warnchecks.append(g[testmatrix[w]])
+                if w == 'unsafe-references-in-binaries':
+                    oe.utils.write_ld_so_conf(d)
+
+            errorchecks = []
+            for e in (d.getVar("ERROR_QA", True) or "").split():
+                if e in skip:
+                   continue
+                if e in testmatrix and testmatrix[e] in g:
+                    errorchecks.append(g[testmatrix[e]])
+                if e == 'unsafe-references-in-binaries':
+                    oe.utils.write_ld_so_conf(d)
+            return warnchecks, errorchecks
+
         skip = (d.getVar('INSANE_SKIP_' + package, True) or "").split()
         if skip:
             bb.note("Package %s skipping QA tests: %s" % (package, str(skip)))
-        warnchecks = []
-        for w in (d.getVar("WARN_QA", True) or "").split():
-            if w in skip:
-               continue
-            if w in testmatrix and testmatrix[w] in g:
-                warnchecks.append(g[testmatrix[w]])
-            if w == 'unsafe-references-in-binaries':
-                oe.utils.write_ld_so_conf(d)
-
-        errorchecks = []
-        for e in (d.getVar("ERROR_QA", True) or "").split():
-            if e in skip:
-               continue
-            if e in testmatrix and testmatrix[e] in g:
-                errorchecks.append(g[testmatrix[e]])
-            if e == 'unsafe-references-in-binaries':
-                oe.utils.write_ld_so_conf(d)
+
 
         bb.note("Checking Package: %s" % package)
         # Check package name
@@ -1155,8 +1159,8 @@ python do_package_qa () {
             package_qa_handle_error("pkgname",
                     "%s doesn't match the [a-z0-9.+-]+ regex" % package, d)
 
-        path = "%s/%s" % (pkgdest, package)
-        package_qa_walk(warnchecks, errorchecks, skip, package, d)
+        warn_checks, error_checks = parse_test_matrix("QAPATHTEST")
+        package_qa_walk(warn_checks, error_checks, skip, package, d)
 
         package_qa_check_rdepends(package, pkgdest, skip, taskdeps, packages, d)
         package_qa_check_deps(package, pkgdest, skip, d)
-- 
2.8.1


