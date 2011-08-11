Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QrXUa-0001jl-B7
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 17:48:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7BFhmdQ003106
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 08:43:48 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 11 Aug 2011 08:43:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Aug 2011 10:46:37 -0500
Message-ID: <d11315c37635089a0f55941d4d2f71bb3c2f2664.1313077484.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313077484.git.mark.hatle@windriver.com>
References: <cover.1313077484.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] rpm: Fix the canonical arch --target processing and cleanup
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
X-List-Received-Date: Thu, 11 Aug 2011 15:48:20 -0000
Content-Type: text/plain

[YOCTO #1352]

Fix the canonical arch --target processor to work with the way OE
handles the GNU canonical arch.

Also cleanup a number of files that are no longer used, and refactor
the no-loop patch into the "no-loopmsg" patch.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-devtools/rpm/rpm/export-rpmbag-h.patch |   45 -------
 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch |   22 ----
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  134 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch    |   38 ------
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   16 +++
 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch    |   17 ---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    8 +-
 7 files changed, 153 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch

diff --git a/meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch b/meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
deleted file mode 100644
index 2f203fb..0000000
--- a/meta/recipes-devtools/rpm/rpm/export-rpmbag-h.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-rpmbag.h (added in 5.1.10) is used by rpmts.h, thus should be
-exported. Change Makefile.in as well since currently autoreconf
-is not performed for rpm.
-
-8/26/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/rpmio/Makefile.am b/rpmio/Makefile.am
-index ce9e4f7..0d825b6 100644
---- a/rpmio/Makefile.am
-+++ b/rpmio/Makefile.am
-@@ -59,12 +59,12 @@ pkginc_HEADERS = \
- 	argv.h envvar.h fts.h mire.h rpmbc.h rpmcb.h rpmdav.h rpmgc.h \
- 	rpmhash.h rpmio.h rpmiotypes.h rpmio-stub.h rpmku.h rpmlog.h \
- 	rpmmacro.h rpmmg.h rpmnss.h rpmpgp.h rpmsq.h rpmssl.h rpmsw.h \
--	rpmurl.h rpmxar.h ugid.h rpmuuid.h rpmzlog.h yarn.h
-+	rpmurl.h rpmxar.h ugid.h rpmuuid.h rpmzlog.h yarn.h rpmbag.h
- noinst_HEADERS = \
- 	ar.h cpio.h crc.h fnmatch.h glob.h iosm.h \
- 	md2.h md4.h poptIO.h rmd128.h rmd160.h rmd256.h rmd320.h sha224.h \
- 	salsa10.h salsa20.h tar.h tiger.h \
--	rpmbag.h rpmbf.h rpmbz.h rpmhook.h rpmio_internal.h rpmlua.h
-+	rpmbf.h rpmbz.h rpmhook.h rpmio_internal.h rpmlua.h
- 
- usrlibdir = $(libdir)
- usrlib_LTLIBRARIES = librpmio.la
-diff --git a/rpmio/Makefile.in b/rpmio/Makefile.in
-index ef76570..0b212bd 100644
---- a/rpmio/Makefile.in
-+++ b/rpmio/Makefile.in
-@@ -638,13 +638,13 @@ pkginc_HEADERS = \
- 	argv.h envvar.h fts.h mire.h rpmbc.h rpmcb.h rpmdav.h rpmgc.h \
- 	rpmhash.h rpmio.h rpmiotypes.h rpmio-stub.h rpmku.h rpmlog.h \
- 	rpmmacro.h rpmmg.h rpmnss.h rpmpgp.h rpmsq.h rpmssl.h rpmsw.h \
--	rpmurl.h rpmxar.h ugid.h rpmuuid.h rpmzlog.h yarn.h
-+	rpmurl.h rpmxar.h ugid.h rpmuuid.h rpmzlog.h yarn.h rpmbag.h
- 
- noinst_HEADERS = \
- 	ar.h cpio.h crc.h fnmatch.h glob.h iosm.h \
- 	md2.h md4.h poptIO.h rmd128.h rmd160.h rmd256.h rmd320.h sha224.h \
- 	salsa10.h salsa20.h tar.h tiger.h \
--	rpmbag.h rpmbf.h rpmbz.h rpmhook.h rpmio_internal.h rpmlua.h
-+	rpmbf.h rpmbz.h rpmhook.h rpmio_internal.h rpmlua.h
- 
- usrlibdir = $(libdir)
- usrlib_LTLIBRARIES = librpmio.la
diff --git a/meta/recipes-devtools/rpm/rpm/hdraddorappend.patch b/meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
deleted file mode 100644
index 020337a..0000000
--- a/meta/recipes-devtools/rpm/rpm/hdraddorappend.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff --git a/lib/rpm4compat.h b/lib/rpm4compat.h
-index b957f8e..b1954d5 100644
---- a/lib/rpm4compat.h
-+++ b/lib/rpm4compat.h
-@@ -211,6 +211,17 @@ static inline int headerAddEntry(Header h, int_32 tag, int_32 type, const void *
- 	return headerPut(h, he, 0);
- }
- 
-+static inline int headerAddOrAppendEntry(Header h, int_32 tag, int_32 type, const void * p, int_32 c) {
-+	HE_t he = (HE_s*)memset(alloca(sizeof(*he)), 0, sizeof(*he));
-+
-+	he->tag = (rpmTag)tag;
-+	he->t = (rpmTagType)type;
-+	he->p.str = (const char*)p;
-+	he->c = (rpmTagCount)c;
-+	he->append = 1;
-+	return headerPut(h, he, 0);
-+}
-+
- static inline int headerRemoveEntry(Header h, int_32 tag) {
- 	HE_t he = (HE_s*)memset(alloca(sizeof(*he)), 0, sizeof(*he));
- 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
new file mode 100644
index 0000000..3619058
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch
@@ -0,0 +1,134 @@
+lib/rpmrc.c: Update --target processing to support full GNU canonical arch
+
+Prior to this patch, when using --target, RPM supported the format:
+  <arch>
+  <arch>-<os>
+  <arch>-<os>-gnu
+  <arch>-<arbitrary items>-<os>
+  <arch>-<arbitrary items>-<os>-gnu
+
+This patch changes the list of supported items to:
+  <arch>
+  <arch>-<os>
+  <arch>-<os>-gnu
+  <arch>-<vendor>-<os>
+  <arch>-<vendor>-<os>-<extension>
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: rpm-5.4.0/lib/rpmrc.c
+===================================================================
+--- rpm-5.4.0.orig/lib/rpmrc.c	2011-08-10 17:04:35.798814821 -0500
++++ rpm-5.4.0/lib/rpmrc.c	2011-08-10 17:33:51.505871895 -0500
+@@ -916,8 +916,8 @@
+ 
+ static void rpmRebuildTargetVars(const char ** target, const char ** canontarget)
+ {
+-
+-    char *ca = NULL, *co = NULL, *ct = NULL;
++    /* ca = arch, cv = vendor, co = os, ce = extension, ct = canon target */
++    char *ca = NULL, *cv = NULL, *co = NULL, *ce = NULL, *ct = NULL;
+     int x;
+ 
+     /* Rebuild the compat table to recalculate the current target arch.  */
+@@ -927,23 +927,60 @@
+     rpmSetTables(RPM_MACHTABLE_BUILDARCH, RPM_MACHTABLE_BUILDOS);
+ 
+     if (target && *target) {
++	/* GNU canonical format is:
++	 *  <arch>-<vendor>-<os>[-extension]
++	 *
++	 * We support the both the GNU canonical format
++	 * as well as the traditional RPM formats: 
++	 *  <arch>
++	 *  <arch>-<os>[-gnu]
++	 */
+ 	char *c;
+ 	/* Set arch and os from specified build target */
+ 	ca = xstrdup(*target);
+-	if ((c = strchr(ca, '-')) != NULL) {
++	if ((c = strchr(ca, '-')) == NULL) {
++	    /* Format is <arch> */
++	    ;
++	} else {
+ 	    *c++ = '\0';
+-	    
+-	    if ((co = strrchr(c, '-')) == NULL) {
+-		co = c;
++	    cv = c;
++
++	    if ((c = strchr(c, '-')) == NULL) {
++		/* Format is <arch>-<os> */
++		co = cv;
++		cv = NULL;
+ 	    } else {
+-		if (!xstrcasecmp(co, "-gnu"))
+-		    *co = '\0';
+-		if ((co = strrchr(c, '-')) == NULL)
+-		    co = c;
+-		else
+-		    co++;
++		*c++ = '\0';
++		co = c;
++
++		if ((c = strchr(c, '-')) == NULL) {
++		    /* Might be:
++		     *  <arch>-<vendor>-<os>
++		     *  <arch>-<os>-gnu
++		     */
++		    if (!xstrcasecmp(co, "gnu")) {
++			/* Format was <arch>-<os>-gnu */
++			ce = co;
++			co = cv;
++			cv = NULL;
++		    }
++		} else {
++		    /* Format was <arch>-<vendor>-<os>-<extension> */
++		    *c++ = '\0';
++		    ce = c;
++		}
+ 	    }
++	    if (cv != NULL) cv = xstrdup(cv);
+ 	    if (co != NULL) co = xstrdup(co);
++	    if (ce != NULL) {
++		/* We need to prefix it with a "-" */
++		char * lce = NULL;
++
++		lce = xmalloc(strlen(ce) + sizeof("-"));
++		sprintf(lce, "-%s", ce);
++
++		ce = lce;
++	    }
+ 	}
+     } else {
+ 	const char *a = NULL;
+@@ -988,8 +1025,16 @@
+     addMacro(NULL, "_target", NULL, ct, RMIL_RPMRC);
+     delMacro(NULL, "_target_cpu");
+     addMacro(NULL, "_target_cpu", NULL, ca, RMIL_RPMRC);
++    if (cv) {
++	delMacro(NULL, "_target_vendor");
++	addMacro(NULL, "_target_vendor", NULL, cv, RMIL_RPMRC);
++    }
+     delMacro(NULL, "_target_os");
+     addMacro(NULL, "_target_os", NULL, co, RMIL_RPMRC);
++    if (ce) {
++	delMacro(NULL, "_gnu");
++	addMacro(NULL, "_gnu", NULL, ce, RMIL_RPMRC);
++    }
+ 
+     if (canontarget)
+ 	*canontarget = ct;
+@@ -997,8 +1041,12 @@
+ 	ct = _free(ct);
+     ca = _free(ca);
+     /*@-usereleased@*/
++    cv = _free(cv);
++    /*@-usereleased@*/
+     co = _free(co);
+     /*@=usereleased@*/
++    ce = _free(ce);
++    /*@-usereleased@*/
+ }
+ 
+ void rpmFreeRpmrc(void)
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
deleted file mode 100644
index 1f0dbcb..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-no-loop.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-The LOOP: ... messages appear to be errors, but in reality they are
-simply debug messages that indicate there is one or more dependency
-loop within the system.
-
-Due to Poky packages owning all of the directories they use, a large
-number of depedency loops may be present.  So disabling this message
-seems to make the most sense.
-
-Signed-off-by: mark.hatle@windriver.com
-
-diff -ur rpm-5.1.10.orig/lib/depends.c rpm-5.1.10/lib/depends.c
---- rpm-5.1.10.orig/lib/depends.c	2010-09-29 12:23:48.307048065 -0500
-+++ rpm-5.1.10/lib/depends.c	2010-09-29 12:33:23.306022259 -0500
-@@ -2044,9 +2044,11 @@
- 	 * Attempt to unravel a dependency loop by eliminating Requires's.
- 	 */
- 	if (zap) {
-+#if 0
- 	    rpmlog(msglvl,
- 			_("removing %s \"%s\" from tsort relations.\n"),
- 			(rpmteNEVRA(p) ?  rpmteNEVRA(p) : "???"), dp);
-+#endif
- 	    rpmteTSI(p)->tsi_count--;
- 	    if (tsi_prev) tsi_prev->tsi_next = tsi->tsi_next;
- 	    tsi->tsi_next = NULL;
-@@ -2676,10 +2678,12 @@
- 		/* Unchain predecessor loop. */
- 		rpmteTSI(p)->tsi_chain = NULL;
- 
-+#if 0
- 		if (!printed) {
- 		    rpmlog(msglvl, _("LOOP:\n"));
- 		    printed = 1;
- 		}
-+#endif
- 
- 		/* Find (and destroy if co-requisite) "q <- p" relation. */
- 		dp = zapRelation(q, p, 1, &nzaps, msglvl);
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
new file mode 100644
index 0000000..4aded75
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch
@@ -0,0 +1,16 @@
+lib/order.c: Make the dependency loop messages into debug msgs
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -urN rpm-5.4.0.orig/lib/order.c rpm-5.4.0/lib/order.c
+--- rpm-5.4.0.orig/lib/order.c	2010-12-13 17:36:39.000000000 -0600
++++ rpm-5.4.0/lib/order.c	2011-08-10 11:11:43.194686332 -0500
+@@ -2170,7 +2170,7 @@
+ 		const char * dp;
+ 		rpmlogLvl msglvl = (anaconda || (rpmtsDFlags(ts) & RPMDEPS_FLAG_DEPLOOPS))
+ 			? RPMLOG_WARNING : RPMLOG_ERR;
+-#if defined(RPM_VENDOR_MANDRIVA) /* loop-detection-optional-loglevel */
++#if defined(RPM_VENDOR_MANDRIVA) || defined(RPM_VENDOR_POKY) /* loop-detection-optional-loglevel */
+ 		// Report loops as debug-level message by default (7 = RPMLOG_DEBUG), overridable
+ 		msglvl = rpmExpandNumeric("%{?_loop_detection_loglevel}%{?!_loop_detection_loglevel:7}");
+ #endif
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch b/meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch
deleted file mode 100644
index db4f8b3..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-nrescan.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-We need to increase the number of dependency rescans as we have a large
-number of self-referencing dependencies within Poky.  100 seem reasonable.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur rpm-5.1.10.orig/lib/depends.c rpm-5.1.10/lib/depends.c
---- rpm-5.1.10.orig/lib/depends.c	2010-08-20 17:12:43.000000000 -0500
-+++ rpm-5.1.10/lib/depends.c	2010-09-02 13:37:21.966116309 -0500
-@@ -2310,7 +2310,7 @@
-     int numOrderList;
-     int npeer = 128;	/* XXX more than deep enough for now. */
-     int * peer = memset(alloca(npeer*sizeof(*peer)), 0, (npeer*sizeof(*peer)));
--    int nrescans = 10;
-+    int nrescans = 100;
-     int _printed = 0;
-     char deptypechar;
-     size_t tsbytes;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index c0e3208..0882df7 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r19"
+PR = "r20"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -61,14 +61,12 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-tools-mtree-LDFLAGS.patch \
 	   file://fprint-pointer-fix.patch \
 	   file://rpm-fileclass.patch \
+	   file://rpm-canonarch.patch \
+	   file://rpm-no-loopmsg.patch \
 	  "
 
-#           file://hdraddorappend.patch \
-#           file://export-rpmbag-h.patch \
-#	   file://rpm-nrescan.patch \
 #	   file://rpm-autoconf.patch \
 #	   file://remove-compiled-tests.patch;apply=no \
-#	   file://rpm-no-loop.patch \
 #	  "
 
 SRC_URI[md5sum] = "19c1a7f68d7765eeb7615c9c4e54e380"
-- 
1.7.3.4



