Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlU-0001ob-Vw
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:26:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 00:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="736914029"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 00:24:31 -0700
Message-Id: <5ef17f7591a3e53a8e21bf529d117b906fe611bb.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 11:07:50 -0700
Date: Fri, 22 Apr 2011  0:24:30 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 02/33] cdrtools: upgrade to v3.00
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
X-List-Received-Date: Fri, 22 Apr 2011 07:26:57 -0000

From: Scott Garman <scott.a.garman@intel.com>

* Addresses CVE-2003-0655
* Fixes [YOCTO #976]

Note that the license has changed to the CDDL for most utilities.

Note the following discussion of distribution issues with mixing GPL
and CDDL licenses:

http://lwn.net/Articles/195167/

This should not impact us at this is a -native recipe only.

Recipe changes derived from OpenEmbedded.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../cdrtools-native/glibc-conflict-rename.patch    |  228 --------------------
 .../cdrtools/cdrtools-native/no_usr_src.patch      |   26 ---
 .../cdrtools/cdrtools-native_2.01.bb               |   26 ---
 .../cdrtools/cdrtools-native_3.00.bb               |   24 ++
 4 files changed, 24 insertions(+), 280 deletions(-)
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch b/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
deleted file mode 100644
index 0b9b892..0000000
--- a/meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
+++ /dev/null
@@ -1,228 +0,0 @@
-Index: cdrtools-2.01/include/schily.h
-===================================================================
---- cdrtools-2.01.orig/include/schily.h	2009-06-18 11:30:45.000000000 +0100
-+++ cdrtools-2.01/include/schily.h	2009-06-18 11:31:22.000000000 +0100
-@@ -108,7 +108,7 @@
- 		/* 6th arg not const, fexecv forces av[ac] = NULL */
- extern	int	fexecv __PR((const char *, FILE *, FILE *, FILE *, int,
- 							char **));
--extern	int	fexecve __PR((const char *, FILE *, FILE *, FILE *,
-+extern	int	fexecve_schily __PR((const char *, FILE *, FILE *, FILE *,
- 					char * const *, char * const *));
- extern	int	fspawnv __PR((FILE *, FILE *, FILE *, int, char * const *));
- extern	int	fspawnl __PR((FILE *, FILE *, FILE *,
-@@ -187,7 +187,7 @@
- extern	char	*findbytes __PR((const void *, int, char));
- extern	int	findline __PR((const char *, char, const char *,
- 							int, char **, int));
--extern	int	getline __PR((char *, int));
-+extern	int	getline_schily __PR((char *, int));
- extern	int	getstr __PR((char *, int));
- extern	int	breakline __PR((char *, char, char **, int));
- extern	int	getallargs __PR((int *, char * const**, const char *, ...));
-Index: cdrtools-2.01/libscg/scsitransp.c
-===================================================================
---- cdrtools-2.01.orig/libscg/scsitransp.c	2009-06-18 11:33:57.000000000 +0100
-+++ cdrtools-2.01/libscg/scsitransp.c	2009-06-18 11:34:24.000000000 +0100
-@@ -323,7 +323,7 @@
- 
- 	js_printf("%s", msg);
- 	flush();
--	if (getline(okbuf, sizeof (okbuf)) == EOF)
-+	if (getline_schily(okbuf, sizeof (okbuf)) == EOF)
- 		exit(EX_BAD);
- 	if (streql(okbuf, "y") || streql(okbuf, "yes") ||
- 	    streql(okbuf, "Y") || streql(okbuf, "YES"))
-Index: cdrtools-2.01/libschily/fexec.c
-===================================================================
---- cdrtools-2.01.orig/libschily/fexec.c	2009-06-18 11:29:29.000000000 +0100
-+++ cdrtools-2.01/libschily/fexec.c	2009-06-18 11:30:36.000000000 +0100
-@@ -159,7 +159,7 @@
- 	} while (p != NULL);
- 	va_end(args);
- 
--	ret = fexecve(name, in, out, err, av, env);
-+	ret = fexecve_schily(name, in, out, err, av, env);
- 	if (av != xav)
- 		free(av);
- 	return (ret);
-@@ -173,11 +173,11 @@
- 	char *av[];
- {
- 	av[ac] = NULL;			/*  force list to be null terminated */
--	return (fexecve(name, in, out, err, av, environ));
-+	return (fexecve_schily(name, in, out, err, av, environ));
- }
- 
- EXPORT int
--fexecve(name, in, out, err, av, env)
-+fexecve_schily(name, in, out, err, av, env)
- 	const char *name;
- 	FILE *in, *out, *err;
- 	char * const av[], * const env[];
-Index: cdrtools-2.01/libschily/stdio/fgetline.c
-===================================================================
---- cdrtools-2.01.orig/libschily/stdio/fgetline.c	2009-06-18 11:28:14.000000000 +0100
-+++ cdrtools-2.01/libschily/stdio/fgetline.c	2009-06-18 11:28:55.000000000 +0100
-@@ -64,7 +64,7 @@
- }
- 
- EXPORT int
--getline(buf, len)
-+getline_schily(buf, len)
- 	char	*buf;
- 	int	len;
- {
-Index: cdrtools-2.01/readcd/io.c
-===================================================================
---- cdrtools-2.01.orig/readcd/io.c	2009-06-18 11:33:57.000000000 +0100
-+++ cdrtools-2.01/readcd/io.c	2009-06-18 11:34:38.000000000 +0100
-@@ -138,7 +138,7 @@
- 		(*prt)(s, *lp, mini, maxi, dp);
- 		flush();
- 		line[0] = '\0';
--		if (getline(line, 80) == EOF)
-+		if (getline_schily(line, 80) == EOF)
- 			exit(EX_BAD);
- 
- 		linep = skipwhite(line);
-@@ -205,7 +205,7 @@
- 	printf("%r", form, args);
- 	va_end(args);
- 	flush();
--	if (getline(okbuf, sizeof(okbuf)) == EOF)
-+	if (getline_schily(okbuf, sizeof(okbuf)) == EOF)
- 		exit(EX_BAD);
- 	if (okbuf[0] == '?') {
- 		printf("Enter 'y', 'Y', 'yes' or 'YES' if you agree with the previous asked question.\n");
-Index: cdrtools-2.01/readcd/readcd.c
-===================================================================
---- cdrtools-2.01.orig/readcd/readcd.c	2009-06-18 11:33:58.000000000 +0100
-+++ cdrtools-2.01/readcd/readcd.c	2009-06-18 11:35:03.000000000 +0100
-@@ -1651,7 +1651,7 @@
- 		error("Copy from SCSI (%d,%d,%d) disk to file\n",
- 					scg_scsibus(scgp), scg_target(scgp), scg_lun(scgp));
- 		error("Enter filename [%s]: ", defname); flush();
--		(void) getline(filename, sizeof (filename));
-+		(void) getline_schily(filename, sizeof (filename));
- 	}
- 
- 	if (askrange) {
-@@ -1820,7 +1820,7 @@
- 		error("Copy from file to SCSI (%d,%d,%d) disk\n",
- 					scg_scsibus(scgp), scg_target(scgp), scg_lun(scgp));
- 		error("Enter filename [%s]: ", defname); flush();
--		(void) getline(filename, sizeof (filename));
-+		(void) getline_schily(filename, sizeof (filename));
- 		error("Notice: reading from file always starts at file offset 0.\n");
- 
- 		getlong("Enter starting sector for copy:", &addr, 0L, end-1);
-Index: cdrtools-2.01/scgcheck/dmaresid.c
-===================================================================
---- cdrtools-2.01.orig/scgcheck/dmaresid.c	2009-06-18 11:33:59.000000000 +0100
-+++ cdrtools-2.01/scgcheck/dmaresid.c	2009-06-18 11:35:43.000000000 +0100
-@@ -64,7 +64,7 @@
- 	printf("Ready to start test for working DMA residual count? Enter <CR> to continue: ");
- 	fprintf(logfile, "**********> Testing for working DMA residual count.\n");
- 	flushit();
--	(void) getline(abuf, sizeof (abuf));
-+	(void) getline_schily(abuf, sizeof (abuf));
- 
- 	printf("**********> Testing for working DMA residual count == 0.\n");
- 	fprintf(logfile, "**********> Testing for working DMA residual count == 0.\n");
-@@ -95,7 +95,7 @@
- 	printf("Ready to start test for working DMA residual count == DMA count? Enter <CR> to continue: ");
- 	fprintf(logfile, "**********> Testing for working DMA residual count == DMA count.\n");
- 	flushit();
--	(void) getline(abuf, sizeof (abuf));
-+	(void) getline_schily(abuf, sizeof (abuf));
- 	passed = TRUE;
- 	dmacnt = cnt;
- 	ret = xtinquiry(scgp, 0, dmacnt);
-@@ -130,7 +130,7 @@
- 	printf("Ready to start test for working DMA residual count == 1? Enter <CR> to continue: ");
- 	fprintf(logfile, "**********> Testing for working DMA residual count == 1.\n");
- 	flushit();
--	(void) getline(abuf, sizeof (abuf));
-+	(void) getline_schily(abuf, sizeof (abuf));
- 	passed = TRUE;
- 	dmacnt = cnt+1;
- 	ret = xtinquiry(scgp, cnt, dmacnt);
-Index: cdrtools-2.01/scgcheck/scgcheck.c
-===================================================================
---- cdrtools-2.01.orig/scgcheck/scgcheck.c	2009-06-18 11:33:59.000000000 +0100
-+++ cdrtools-2.01/scgcheck/scgcheck.c	2009-06-18 11:35:31.000000000 +0100
-@@ -189,7 +189,7 @@
- 			break;
- 		error("Enter SCSI device name for bus scanning [%s]: ", device);
- 		flushit();
--		(void) getline(device, sizeof (device));
-+		(void) getline_schily(device, sizeof (device));
- 		if (device[0] == '\0')
- 			strcpy(device, "0,6,0");
- 
-@@ -227,7 +227,7 @@
- 	do {
- 		error("Enter SCSI device name [%s]: ", device);
- 		flushit();
--		(void) getline(device, sizeof (device));
-+		(void) getline_schily(device, sizeof (device));
- 		if (device[0] == '\0')
- 			strcpy(device, "0,6,0");
- 
-@@ -256,7 +256,7 @@
- 
- 	printf("Ready to start test for second SCSI open? Enter <CR> to continue: ");
- 	flushit();
--	(void) getline(abuf, sizeof (abuf));
-+	(void) getline_schily(abuf, sizeof (abuf));
- #define	CHECK_SECOND_OPEN
- #ifdef	CHECK_SECOND_OPEN
- 	if (!streql(abuf, "n")) {
-@@ -344,7 +344,7 @@
- 
- 	printf("Ready to start test for succeeded command? Enter <CR> to continue: ");
- 	flushit();
--	(void) getline(abuf, sizeof (abuf));
-+	(void) getline_schily(abuf, sizeof (abuf));
- 	scgp->verbose++;
- 	ret = inquiry(scgp, buf, sizeof (struct scsi_inquiry));
- 	scg_vsetup(scgp);
-Index: cdrtools-2.01/scgcheck/sense.c
-===================================================================
---- cdrtools-2.01.orig/scgcheck/sense.c	2009-06-18 11:33:58.000000000 +0100
-+++ cdrtools-2.01/scgcheck/sense.c	2009-06-18 11:35:54.000000000 +0100
-@@ -66,7 +66,7 @@
- 	printf("Ready to start test for failing command? Enter <CR> to continue: ");
- 	fprintf(logfile, "**********> Testing for failed SCSI command.\n");
- 	flushit();
--	(void)getline(abuf, sizeof(abuf));
-+	(void)getline_schily(abuf, sizeof(abuf));
- /*	scgp->verbose++;*/
- 	fillbytes(buf, sizeof(struct scsi_inquiry), '\0');
- 	fillbytes((caddr_t)scgp->scmd, sizeof(*scgp->scmd), '\0');
-@@ -82,13 +82,13 @@
- 		printf("the test utility. Otherwise remove any medium from the drive.\n");
- 		printf("Ready to start test for failing command? Enter <CR> to continue: ");
- 		flushit();
--		(void)getline(abuf, sizeof(abuf));
-+		(void)getline_schily(abuf, sizeof(abuf));
- 		ret = test_unit_ready(scgp);
- 		if (ret >= 0 || !scg_cmd_err(scgp)) {
- 			printf("Test Unit Ready did not fail.\n");
- 			printf("Ready to eject tray? Enter <CR> to continue: ");
- 			flushit();
--			(void)getline(abuf, sizeof(abuf));
-+			(void)getline_schily(abuf, sizeof(abuf));
- 			scsi_unload(scgp, (cdr_t *)0);
- 			ret = test_unit_ready(scgp);
- 		}
-@@ -127,7 +127,7 @@
- 	printf("Ready to start test for sense data count? Enter <CR> to continue: ");
- 	fprintf(logfile, "**********> Testing for SCSI sense data count.\n");
- 	flushit();
--	(void)getline(abuf, sizeof(abuf));
-+	(void)getline_schily(abuf, sizeof(abuf));
- 	printf("Testing if at least CCS_SENSE_LEN (%d) is supported...\n", CCS_SENSE_LEN);
- 	fprintf(logfile, "**********> Testing if at least CCS_SENSE_LEN (%d) is supported...\n", CCS_SENSE_LEN);
- 	ret = sensecount(scgp, CCS_SENSE_LEN);
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch b/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
deleted file mode 100644
index 0318d31..0000000
--- a/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Index: cdrtools-2.01/DEFAULTS/Defaults.gnu
-===================================================================
---- cdrtools-2.01.orig/DEFAULTS/Defaults.gnu	2008-09-22 12:42:12.000000000 +0100
-+++ cdrtools-2.01/DEFAULTS/Defaults.gnu	2008-09-22 12:42:27.000000000 +0100
-@@ -18,7 +18,7 @@
- ###########################################################################
- CWARNOPTS=
- 
--DEFINCDIRS=	$(SRCROOT)/include /usr/src/linux/include
-+DEFINCDIRS=	$(SRCROOT)/include
- LDPATH=		-L/opt/schily/lib
- RUNPATH=	-R $(INS_BASE)/lib -R /opt/schily/lib -R $(OLIBSDIR)
- 
-Index: cdrtools-2.01/DEFAULTS/Defaults.linux
-===================================================================
---- cdrtools-2.01.orig/DEFAULTS/Defaults.linux	2008-09-22 12:42:08.000000000 +0100
-+++ cdrtools-2.01/DEFAULTS/Defaults.linux	2008-09-22 12:42:37.000000000 +0100
-@@ -18,7 +18,7 @@
- ###########################################################################
- CWARNOPTS=
- 
--DEFINCDIRS=	$(SRCROOT)/include /usr/src/linux/include
-+DEFINCDIRS=	$(SRCROOT)/include
- LDPATH=		-L/opt/schily/lib
- RUNPATH=	-R $(INS_BASE)/lib -R /opt/schily/lib -R $(OLIBSDIR)
- 
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
deleted file mode 100644
index 769e5e2..0000000
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-# cdrtools-native OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-LICENSE="GPL"
-DESCRIPTION="A set of tools for CD recording, including cdrecord"
-HOMEPAGE="http://cdrecord.berlios.de/old/private/cdrecord.html"
-PR = "r2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI="ftp://ftp.berlios.de/pub/cdrecord/cdrtools-${PV}.tar.bz2 \
-         file://no_usr_src.patch;patch=1 \
-         file://glibc-conflict-rename.patch;patch=1"
-
-inherit native
-
-STAGE_TEMP="${WORKDIR}/image-temp"
-
-do_install() {
-	install -d ${STAGE_TEMP}
-	make install INS_BASE=${STAGE_TEMP}
-
-	install -d ${D}${bindir}/
-	install ${STAGE_TEMP}/bin/* ${D}${bindir}/
-}
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
new file mode 100644
index 0000000..9927cc9
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A set of tools for CD recording, including cdrecord"
+DESCRIPTION = "A set of tools for CD recording, including cdrecord"
+HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
+SECTION = "utils"
+PRIORITY = "optional"
+# This package includes many utilities under different licenses
+LICENSE = "GPLv2+ & LGPLv2.1 & BSD & CDDL"
+# The top-level COPYING file lists all licenses of included utilities
+LIC_FILES_CHKSUM = "file://COPYING;md5=8d16123ffd39e649a5e4a6bc1de60e6d \
+                    file://cdrecord/LICENSE;md5=7f1cc1a48802a2ea3bf6febbb4c3b55e"
+
+PR = "r0"
+
+SRC_URI="ftp://ftp.berlios.de/pub/cdrecord/cdrtools-3.00.tar.gz"
+SRC_URI[md5sum] = "bb21cefefcfbb76cf249120e8978ffdd"
+SRC_URI[sha256sum] = "6326762da8b8281c9a910c66fe698cd4d1bc5f33c37b59e8f1c83343c25f3e98"
+
+S="${WORKDIR}/cdrtools-${PV}"
+
+inherit native
+
+do_install() {
+	make install INS_BASE=${D}/${exec_prefix}
+}
-- 
1.7.1



