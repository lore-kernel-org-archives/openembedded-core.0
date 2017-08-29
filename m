Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C61907830F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 044211842D;
	Tue, 29 Aug 2017 23:21:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dqDkcp7yWyih; Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 31CC118443;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CAD21A0B2;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11B911A0B1;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 066392198;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLf6Q030239;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLf3u030238;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:10 +0200
Message-Id: <04eed674955f96502cdf6fde8207631cc53cb479.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 14/25] rpm: Add a new option --alldeps to rpmdeps
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:50 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This will send the output from rpmfcPrint() to stdout. This is an
alternative to using the --rpmfcdebug option, which will send the same
output to stderr. The two options have totally different use cases
though. While --alldeps is used when the output from rpmfcPrint() is
what is wanted, --rpmfcdebug can be used together with the other
output options, e.g., --requires, without affecting their output.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0013-Add-a-new-option-alldeps-to-rpmdeps.patch | 152 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch

diff --git a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
new file mode 100644
index 0000000000..faaf62960c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
@@ -0,0 +1,152 @@
+From 3bf20a6116ae3e1a5a3a6907bee7e881b17efb2f Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Mon, 15 May 2017 11:23:26 +0200
+Subject: [PATCH 13/13] Add a new option --alldeps to rpmdeps
+
+This will send the output from rpmfcPrint() to stdout. This is an
+alternative to using the --rpmfcdebug option, which will send the same
+output to stderr. The two options have totally different use cases
+though. While --alldeps is used when the output from rpmfcPrint() is
+what is wanted, --rpmfcdebug can be used together with the other
+output options, e.g., --requires, without affecting their output.
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/220]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ build/rpmfc.c   | 27 ++++++++++++++-------------
+ build/rpmfc.h   |  1 -
+ tools/rpmdeps.c | 44 +++++++++++++++++++++++++-------------------
+ 3 files changed, 39 insertions(+), 33 deletions(-)
+
+diff --git a/build/rpmfc.c b/build/rpmfc.c
+index c8e2f876a..44f1cdc9a 100644
+--- a/build/rpmfc.c
++++ b/build/rpmfc.c
+@@ -732,7 +732,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)
+ 
+ void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
+ {
+-    rpm_color_t fcolor;
+     int ndx;
+     int dx;
+     int fx;
+@@ -744,21 +743,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
+ 
+     if (fc)
+     for (fx = 0; fx < fc->nfiles; fx++) {
+-	rpmsid cx = fc->fcdictx[fx] + 1; /* id's are one off */
+-	fcolor = fc->fcolor[fx];
+-	ARGV_t fattrs = fc->fattrs[fx];
+-
+ 	fprintf(fp, "%3d %s", fx, fc->fn[fx]);
+-	if (fcolor != RPMFC_BLACK)
++	if (_rpmfc_debug) {
++	    rpmsid cx = fc->fcdictx[fx] + 1; /* id's are one off */
++	    rpm_color_t fcolor = fc->fcolor[fx];
++	    ARGV_t fattrs = fc->fattrs[fx];
++
++	    if (fcolor != RPMFC_BLACK)
+ 		fprintf(fp, "\t0x%x", fc->fcolor[fx]);
+-	else
++	    else
+ 		fprintf(fp, "\t%s", rpmstrPoolStr(fc->cdict, cx));
+-	if (fattrs) {
+-	    char *attrs = argvJoin(fattrs, ",");
+-	    fprintf(fp, " [%s]", attrs);
+-	    free(attrs);
+-	} else {
+-	    fprintf(fp, " [none]");
++	    if (fattrs) {
++		char *attrs = argvJoin(fattrs, ",");
++		fprintf(fp, " [%s]", attrs);
++		free(attrs);
++	    } else {
++		fprintf(fp, " [none]");
++	    }
+ 	}
+ 	fprintf(fp, "\n");
+ 
+diff --git a/build/rpmfc.h b/build/rpmfc.h
+index dae8ea5b1..3d87b31cf 100644
+--- a/build/rpmfc.h
++++ b/build/rpmfc.h
+@@ -45,7 +45,6 @@ typedef const struct rpmfcTokens_s * rpmfcToken;
+ 
+ /** \ingroup rpmfc
+  * Print results of file classification.
+- * @todo Remove debugging routine.
+  * @param msg		message prefix (NULL for none)
+  * @param fc		file classifier
+  * @param fp		output file handle (NULL for stderr)
+diff --git a/tools/rpmdeps.c b/tools/rpmdeps.c
+index a414b6343..f260a38c4 100644
+--- a/tools/rpmdeps.c
++++ b/tools/rpmdeps.c
+@@ -23,6 +23,8 @@ static int print_conflicts;
+ 
+ static int print_obsoletes;
+ 
++static int print_alldeps;
++
+ static void rpmdsPrint(const char * msg, rpmds ds, FILE * fp)
+ {
+     if (fp == NULL) fp = stderr;
+@@ -57,6 +59,8 @@ static struct poptOption optionsTable[] = {
+         NULL, NULL },
+  { "obsoletes", '\0', POPT_ARG_VAL, &print_obsoletes, -1,
+         NULL, NULL },
++ { "alldeps", '\0', POPT_ARG_VAL, &print_alldeps, -1,
++        NULL, NULL },
+ 
+    POPT_AUTOALIAS
+    POPT_AUTOHELP
+@@ -100,25 +104,27 @@ main(int argc, char *argv[])
+     if (rpmfcClassify(fc, av, NULL) || rpmfcApply(fc))
+ 	goto exit;
+ 
+-    if (_rpmfc_debug)
+-	rpmfcPrint(buf, fc, NULL);
+-
+-    if (print_provides)
+-	rpmdsPrint(NULL, rpmfcProvides(fc), stdout);
+-    if (print_requires)
+-	rpmdsPrint(NULL, rpmfcRequires(fc), stdout);
+-    if (print_recommends)
+-	rpmdsPrint(NULL, rpmfcRecommends(fc), stdout);
+-    if (print_suggests)
+-	rpmdsPrint(NULL, rpmfcSuggests(fc), stdout);
+-    if (print_supplements)
+-	rpmdsPrint(NULL, rpmfcSupplements(fc), stdout);
+-    if (print_enhances)
+-	rpmdsPrint(NULL, rpmfcEnhances(fc), stdout);
+-    if (print_conflicts)
+-	rpmdsPrint(NULL, rpmfcConflicts(fc), stdout);
+-    if (print_obsoletes)
+-	rpmdsPrint(NULL, rpmfcObsoletes(fc), stdout);
++    if (print_alldeps || _rpmfc_debug)
++	rpmfcPrint(NULL, fc, print_alldeps ? stdout : NULL);
++
++    if (!print_alldeps) {
++	if (print_provides)
++	    rpmdsPrint(NULL, rpmfcProvides(fc), stdout);
++	if (print_requires)
++	    rpmdsPrint(NULL, rpmfcRequires(fc), stdout);
++	if (print_recommends)
++	    rpmdsPrint(NULL, rpmfcRecommends(fc), stdout);
++	if (print_suggests)
++	    rpmdsPrint(NULL, rpmfcSuggests(fc), stdout);
++	if (print_supplements)
++	    rpmdsPrint(NULL, rpmfcSupplements(fc), stdout);
++	if (print_enhances)
++	    rpmdsPrint(NULL, rpmfcEnhances(fc), stdout);
++	if (print_conflicts)
++	    rpmdsPrint(NULL, rpmfcConflicts(fc), stdout);
++	if (print_obsoletes)
++	    rpmdsPrint(NULL, rpmfcObsoletes(fc), stdout);
++    }
+ 
+     ec = 0;
+ 
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 7c5f649a8b..5fe52b83ec 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
            file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
            file://0012-Use-conditional-to-access-_docdir-in-macros.in.patch \
+           file://0013-Add-a-new-option-alldeps-to-rpmdeps.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
-- 
2.12.0


