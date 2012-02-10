Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RveAg-0001KE-AT for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 01:17:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A08v5D024038
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:08:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22290-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:08:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A08oFa024032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:08:51 GMT
Message-ID: <1328832539.10451.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 00:08:59 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] rpm: Add rpmdeps-oecore to replace rpmdeps for package.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 00:17:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a performance enhancement by adding a binary allowing batch processing
of individual file dependencies. The second patch in this series uses the binary
this patch creates.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
new file mode 100644
index 0000000..e3ef7db
--- a/dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
@@ -0,0 +1,188 @@
+Add an "rpmdeps-oecore" binary which allows batch processing of individual file 
+dependencies in a similar manner to rpmdeps --provides --requires -v, prefixing
+each line of output with the filename that has the dependency.
+
+This is much faster than individually calling rpmdeps on each file.
+
+This binary is used by package.bbclass.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+RP 2012/2/7
+
+Index: rpm-5.4.0/tools/Makefile.am
+===================================================================
+--- rpm-5.4.0.orig/tools/Makefile.am	2012-02-07 12:21:25.155941075 +0000
++++ rpm-5.4.0/tools/Makefile.am	2012-02-07 12:25:19.115941183 +0000
+@@ -58,7 +58,7 @@
+ 	@WITH_AUGEAS_AUGTOOL@ chroot cp @WITH_CUDF_CUDFTOOL@ find mtree \
+ 	@WITH_SEMANAGE_SEMODULE@ wget \
+ 	rpmcache rpmdigest rpmrepo rpmspecdump \
+-	rpmcmp rpmdeps sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
++	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
+ dist_man_MANS =		rpmgrep.1
+ 
+ augtool_SOURCES =	augtool.c
+@@ -155,6 +155,10 @@
+ rpmdeps_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
+ rpmdeps_LDADD =		$(RPM_LDADD_COMMON)
+ 
++rpmdeps_oecore_SOURCES =	rpmdeps-oecore.c
++rpmdeps_oecore_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
++rpmdeps_oecore_LDADD =		$(RPM_LDADD_COMMON)
++
+ rpmdigest_SOURCES =	rpmdigest.c
+ rpmdigest_LDFLAGS =	@LDFLAGS_STATIC@ $(LDFLAGS)
+ rpmdigest_LDADD =	$(RPMIO_LDADD_COMMON)
+Index: rpm-5.4.0/tools/rpmdeps-oecore.c
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ rpm-5.4.0/tools/rpmdeps-oecore.c	2012-02-07 12:12:42.000000000 +0000
+@@ -0,0 +1,147 @@
++#include "system.h"
++const char *__progname;
++
++#include <rpmio.h>
++#include <rpmiotypes.h>
++#include <rpmcb.h>
++#include <argv.h>
++#include <rpmtypes.h>
++#include <rpmtag.h>
++
++#include <rpmds.h>
++#define	_RPMFC_INTERNAL		/* XXX for debugging */
++#include <rpmfc.h>
++
++#include <rpmcli.h>
++
++#include "debug.h"
++
++/*@unchecked@*/
++char *progname;
++
++#define	RPMDEP_RPMFC		1
++
++static int rpmdepPrint(char *filename, rpmds ds, FILE * fp)
++{
++    if (fp == NULL) fp = stderr;
++
++    ds = rpmdsInit(ds);
++    while (rpmdsNext(ds) >= 0) {
++	fprintf(fp, "%s %s: %s\n", filename, rpmdsType(ds), rpmdsDNEVR(ds)+2);
++    }
++    return 0;
++}
++
++static struct poptOption optionsTable[] = {
++
++ { NULL, '\0', POPT_ARG_INCLUDE_TABLE, rpmcliAllPoptTable, 0,
++	N_("Common options:"),
++	NULL }, 
++
++   POPT_AUTOALIAS
++   POPT_AUTOHELP
++   POPT_TABLEEND
++};
++
++
++int
++main(int argc, char *argv[])
++{
++    poptContext optCon;
++    ARGV_t av = NULL;
++    rpmfc fc = NULL;
++    FILE * fp = NULL;
++    int flags = 0;
++    int ac = 0;
++    int ec = 1;
++    int xx;
++    int i;
++    char buf[BUFSIZ];
++    int nddict;
++    const char * s;
++    char * se;
++    const char * fn;
++    const char * N;
++    const char * EVR;
++    evrFlags Flags;
++    unsigned char deptype;
++    int ix;
++    rpmds ds;
++
++/*@-modobserver@*/
++    if ((progname = strrchr(argv[0], '/')) != NULL)
++	progname++;
++    else
++	progname = argv[0];
++/*@=modobserver@*/
++
++    optCon = rpmcliInit(argc, argv, optionsTable);
++    if (optCon == NULL)
++	goto exit;
++
++    av = poptGetArgs(optCon);
++    ac = argvCount(av);
++
++    if (ac == 0) {
++	av = NULL;
++	xx = argvFgets(&av, NULL);
++	ac = argvCount(av);
++    }
++
++    /* Make sure file names are sorted. */
++    xx = argvSort(av, NULL);
++
++    /* Build file class dictionary. */
++    fc = rpmfcNew();
++    xx = rpmfcClassify(fc, av, NULL);
++
++    /* Build file/package dependency dictionary. */
++    xx = rpmfcApply(fc);
++
++    /* Generate per-file indices into package dependencies. */
++    nddict = argvCount(fc->ddict);
++
++    for (i = 0; i < nddict; i++) {
++	s = fc->ddict[i];
++
++	/* Parse out (file#,deptype,N,EVR,Flags) */
++	ix = strtol(s, &se, 10);
++	assert(se != NULL);
++	deptype = *se++;
++	se++;
++	N = se;
++	while (*se && *se != ' ')
++	    se++;
++	*se++ = '\0';
++	EVR = se;
++	while (*se && *se != ' ')
++	    se++;
++	*se++ = '\0';
++	Flags = strtol(se, NULL, 16);
++
++	switch (deptype) {
++	default:
++	    /*@switchbreak@*/ break;
++	case 'P':	
++	    ds = rpmdsSingle(RPMTAG_PROVIDENAME, N, EVR, Flags);
++	    rpmdepPrint((char *)fc->fn[ix], ds, stdout);
++	    (void)rpmdsFree(ds);
++	    ds = NULL;
++	    /*@switchbreak@*/ break;
++	case 'R':
++	    ds = rpmdsSingle(RPMTAG_REQUIRENAME, N, EVR, Flags);
++	    rpmdepPrint((char *)fc->fn[ix], ds, stdout);
++	    (void)rpmdsFree(ds);
++	    ds = NULL;
++	    /*@switchbreak@*/ break;
++	}
++    }
++
++    fc = rpmfcFree(fc);
++
++    ec = 0;
++
++exit:
++    optCon = rpmcliFini(optCon);
++    return ec;
++}
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 83ee890..5ebfcc9 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r29"
+PR = "r30"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -68,6 +68,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-scriptletexechelper.patch \
 	   file://fix_for_automake_1.11.2.patch \
 	   file://pythondeps.sh \
+	   file://rpmdeps-oecore.patch \
 	  "
 
 #	   file://rpm-autoconf.patch \




