Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C7B2471DA1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:41 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546514"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:41 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:34 +0200
Message-Id: <5d8b2dbf9040343ee9384032d96162110923bdf4.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/36] rpmresolve: remove the recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:41 -0000

The source code is incompatible with rpm4 API - let's use rpm
binary itself for now.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c | 426 ----------------------
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb       |  29 --
 2 files changed, 455 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
 delete mode 100644 meta/recipes-devtools/rpm/rpmresolve_1.0.bb

diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
deleted file mode 100644
index c0b4d567fb0..00000000000
--- a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
+++ /dev/null
@@ -1,426 +0,0 @@
-/* OpenEmbedded RPM resolver utility
-
-  Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-  Copyright 2012 Intel Corporation
-
-  This program is free software; you can redistribute it and/or modify
-  it under the terms of the GNU General Public License version 2 as
-  published by the Free Software Foundation.
-
-  This program is distributed in the hope that it will be useful,
-  but WITHOUT ANY WARRANTY; without even the implied warranty of
-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-  GNU General Public License for more details.
-
-  You should have received a copy of the GNU General Public License along
-  with this program; if not, write to the Free Software Foundation, Inc.,
-  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
-*/
-
-#include <ctype.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-
-#include <rpmdb.h>
-#include <rpmtypes.h>
-#include <rpmtag.h>
-#include <rpmts.h>
-#include <rpmmacro.h>
-#include <rpmcb.h>
-#include <rpmlog.h>
-#include <argv.h>
-#include <mire.h>
-
-int debugmode;
-FILE *outf;
-
-int getPackageStr(rpmts ts, const char *NVRA, rpmTag tag, char **value)
-{
-    int rc = -1;
-    rpmmi mi = rpmmiInit(rpmtsGetRdb(ts), RPMTAG_NVRA, NVRA, 0);
-    Header h;
-    if ((h = rpmmiNext(mi)) != NULL) {
-        HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
-        he->tag = tag;
-        rc = (headerGet(h, he, 0) != 1);
-        if(rc==0)
-            *value = strdup((char *)he->p.ptr);
-    }
-    (void)rpmmiFree(mi);
-    return rc;
-}
-
-int loadTs(rpmts **ts, int *tsct, const char *dblistfn)
-{
-    int count = 0;
-    int sz = 5;
-    int rc = 0;
-    int listfile = 1;
-    struct stat st_buf;
-
-    rc = stat(dblistfn, &st_buf);
-    if(rc != 0) {
-        perror("stat");
-        return 1;
-    }
-    if(S_ISDIR(st_buf.st_mode))
-        listfile = 0;
-
-    if(listfile) {
-        if(debugmode)
-            printf("DEBUG: reading database list file '%s'\n", dblistfn);
-        *ts = malloc(sz * sizeof(rpmts));
-        FILE *f = fopen(dblistfn, "r" );
-        if(f) {
-            char line[2048];
-            while(fgets(line, sizeof(line), f)) {
-                int len = strlen(line) - 1;
-                if(len > 0)
-                    // Trim trailing whitespace
-                    while(len > 0 && isspace(line[len]))
-                        line[len--] = '\0';
-
-                if(len > 0) {
-                    // Expand array if needed
-                    if(count == sz) {
-                        sz += 5;
-                        *ts = (rpmts *)realloc(*ts, sz);
-                    }
-
-                    if(debugmode)
-                        printf("DEBUG: opening database '%s'\n", line);
-                    char *dbpathm = malloc(strlen(line) + 10);
-                    sprintf(dbpathm, "_dbpath %s", line);
-                    rpmDefineMacro(NULL, dbpathm, RMIL_CMDLINE);
-                    free(dbpathm);
-
-                    rpmts tsi = rpmtsCreate();
-                    (*ts)[count] = tsi;
-                    rc = rpmtsOpenDB(tsi, O_RDONLY);
-                    if( rc ) {
-                        fprintf(stderr, "Failed to open database %s\n", line);
-                        rc = -1;
-                        break;
-                    }
-
-                    count++;
-                }
-            }
-            fclose(f);
-            *tsct = count;
-        }
-        else {
-            perror(dblistfn);
-            rc = -1;
-        }
-    }
-    else {
-        if(debugmode)
-            printf("DEBUG: opening database '%s'\n", dblistfn);
-        // Load from single database
-        *ts = malloc(sizeof(rpmts));
-        char *dbpathm = malloc(strlen(dblistfn) + 10);
-        sprintf(dbpathm, "_dbpath %s", dblistfn);
-        rpmDefineMacro(NULL, dbpathm, RMIL_CMDLINE);
-        free(dbpathm);
-
-        rpmts tsi = rpmtsCreate();
-        (*ts)[0] = tsi;
-        rc = rpmtsOpenDB(tsi, O_RDONLY);
-        if( rc ) {
-            fprintf(stderr, "Failed to open database %s\n", dblistfn);
-            rc = -1;
-        }
-        *tsct = 1;
-    }
-
-    return rc;
-}
-
-int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignoremissing)
-{
-    int rc = 0;
-    int count = 0;
-    int sz = 100;
-    int i = 0;
-    int missing = 0;
-
-    FILE *f = fopen(packagelistfn, "r" );
-    if(f) {
-        char line[255];
-        while(fgets(line, sizeof(line), f)) {
-            int len = strlen(line) - 1;
-            if(len > 0)
-                // Trim trailing whitespace
-                while(len > 0 && isspace(line[len]))
-                    line[len--] = '\0';
-
-            if(len > 0) {
-                int found = 0;
-                for(i=0; i<tscount; i++) {
-                    ARGV_t keys = NULL;
-                    rpmdb db = rpmtsGetRdb(ts[i]);
-                    rc = rpmdbMireApply(db, RPMTAG_NAME,
-                                RPMMIRE_STRCMP, line, &keys);
-                    if (keys) {
-                        int nkeys = argvCount(keys);
-                        if( nkeys == 1 ) {
-                            char *value = NULL;
-                            rc = getPackageStr(ts[i], keys[0], RPMTAG_PACKAGEORIGIN, &value);
-                            if(rc == 0)
-                                fprintf(outf, "%s\n", value);
-                            else
-                                fprintf(stderr, "Failed to get package origin for %s\n", line);
-                            found = 1;
-                        }
-                        else if( nkeys > 1 ) {
-                            int keyindex = 0;
-                            fprintf(stderr, "Multiple matches for %s:\n", line);
-                            for( keyindex=0; keyindex<nkeys; keyindex++) {
-                                char *value = NULL;
-                                rc = getPackageStr(ts[i], keys[keyindex], RPMTAG_PACKAGEORIGIN, &value);
-                                if(rc == 0)
-                                    fprintf(stderr, "  %s\n", value);
-                                else
-                                    fprintf(stderr, "  (%s)\n", keys[keyindex]);
-                            }
-                        }
-                    }
-                    if(found)
-                        break;
-                }
-
-                if( !found ) {
-                    if( ignoremissing ) {
-                        fprintf(stderr, "Unable to resolve package %s - ignoring\n", line);
-                    }
-                    else {
-                        fprintf(stderr, "Unable to resolve package %s\n", line);
-                        missing = 1;
-                    }
-                }
-            }
-            count++;
-        }
-        fclose(f);
-
-        if( missing ) {
-            fprintf(stderr, "ERROR: some packages were missing\n");
-            rc = 1;
-        }
-    }
-    else {
-        perror(packagelistfn);
-        rc = -1;
-    }
-
-    return rc;
-}
-
-int lookupProvider(rpmts ts, const char *req, char **provider)
-{
-    int rc = 0;
-    rpmmi provmi = rpmmiInit(rpmtsGetRdb(ts), RPMTAG_PROVIDENAME, req, 0);
-    if(provmi) {
-        Header h;
-        if ((h = rpmmiNext(provmi)) != NULL) {
-            HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
-            he->tag = RPMTAG_NAME;
-            rc = (headerGet(h, he, 0) != 1);
-            if(rc==0)
-                *provider = strdup((char *)he->p.ptr);
-        }
-        (void)rpmmiFree(provmi);
-    }
-    else {
-        rc = -1;
-    }
-    return rc;
-}
-
-int printDepList(rpmts *ts, int tscount)
-{
-    int rc = 0;
-
-    if( tscount > 1 )
-        fprintf(stderr, ">1 database specified with dependency list, using first only\n");
-
-    /* Get list of names */
-    rpmdb db = rpmtsGetRdb(ts[0]);
-    ARGV_t names = NULL;
-    rc = rpmdbMireApply(db, RPMTAG_NAME,
-                RPMMIRE_STRCMP, NULL, &names);
-    int nnames = argvCount(names);
-
-    /* Get list of NVRAs */
-    ARGV_t keys = NULL;
-    rc = rpmdbMireApply(db, RPMTAG_NVRA,
-                RPMMIRE_STRCMP, NULL, &keys);
-    if (keys) {
-        int i, j;
-        HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
-        int nkeys = argvCount(keys);
-        for(i=0; i<nkeys; i++) {
-            rpmmi mi = rpmmiInit(db, RPMTAG_NVRA, keys[i], 0);
-            Header h;
-            if ((h = rpmmiNext(mi)) != NULL) {
-                /* Get name of package */
-                he->tag = RPMTAG_NAME;
-                rc = (headerGet(h, he, 0) != 1);
-                char *name = strdup((char *)he->p.ptr);
-                /* Get its requires */
-                he->tag = RPMTAG_REQUIRENAME;
-                if (rc = (headerGet(h, he, 0) != 1)) {
-                    if (debugmode) {
-                        printf("DEBUG: %s requires null\n", name);
-                    }
-                    rc = 0;
-                    free(name);
-                    (void)rpmmiFree(mi);
-                    continue;
-                }
-                ARGV_t reqs = (ARGV_t)he->p.ptr;
-                /* Get its requireflags */
-                he->tag = RPMTAG_REQUIREFLAGS;
-                rc = (headerGet(h, he, 0) != 1);
-                rpmuint32_t *reqflags = (rpmuint32_t *)he->p.ui32p;
-                for(j=0; j<he->c; j++) {
-                    int k;
-                    char *prov = NULL;
-                    for(k=0; k<nnames; k++) {
-                        if(strcmp(names[k], reqs[j]) == 0) {
-                            prov = names[k];
-                            break;
-                        }
-                    }
-                    if(prov) {
-                        if((int)reqflags[j] & 0x80000)
-                            fprintf(outf, "%s|%s [REC]\n", name, prov);
-                        else
-                            fprintf(outf, "%s|%s\n", name, prov);
-                    }
-                    else {
-                        rc = lookupProvider(ts[0], reqs[j], &prov);
-                        if(rc==0 && prov) {
-                            if((int)reqflags[j] & 0x80000)
-                                fprintf(outf, "%s|%s [REC]\n", name, prov);
-                            else
-                                fprintf(outf, "%s|%s\n", name, prov);
-                            free(prov);
-                        }
-                    }
-                }
-                free(name);
-            }
-            (void)rpmmiFree(mi);
-        }
-    }
-
-    return rc;
-}
-
-void usage()
-{
-    fprintf(stderr, "OpenEmbedded rpm resolver utility\n");
-    fprintf(stderr, "syntax: rpmresolve [-i] [-d] [-t] <dblistfile> <packagelistfile>\n");
-}
-
-int main(int argc, char **argv)
-{
-    rpmts *ts = NULL;
-    int tscount = 0;
-    int rc = 0;
-    int i;
-    int c;
-    int ignoremissing = 0;
-    int deplistmode = 0;
-    char *outfile = NULL;
-
-    debugmode = 0;
-    outf = stdout;
-
-    opterr = 0;
-    while ((c = getopt (argc, argv, "itdo:")) != -1) {
-        switch (c) {
-            case 'i':
-                ignoremissing = 1;
-                break;
-            case 't':
-                deplistmode = 1;
-                break;
-            case 'd':
-                debugmode = 1;
-                break;
-            case 'o':
-                outfile = strdup(optarg);
-                break;
-            case '?':
-                if(isprint(optopt))
-                    fprintf(stderr, "Unknown option `-%c'.\n", optopt);
-                else
-                    fprintf(stderr, "Unknown option character `\\x%x'.\n",
-                        optopt);
-                usage();
-                return 1;
-            default:
-                abort();
-        }
-    }
-
-    if( argc - optind < 1 ) {
-        usage();
-        return 1;
-    }
-
-    if( outfile ) {
-        if(debugmode)
-            printf("DEBUG: Using output file %s\n", outfile);
-        outf = fopen(outfile, "w");
-    }
-
-    const char *dblistfn = argv[optind];
-
-    rpmcliInit(argc, argv, NULL);
-
-    if(debugmode)
-        rpmSetVerbosity(RPMLOG_DEBUG);
-
-    rpmDefineMacro(NULL, "__dbi_txn create nofsync", RMIL_CMDLINE);
-
-    rc = loadTs(&ts, &tscount, dblistfn);
-    if( rc )
-        return 1;
-    if( tscount == 0 ) {
-        fprintf(stderr, "Please specify database list file or database location\n");
-        return 1;
-    }
-
-    if(deplistmode) {
-        rc = printDepList(ts, tscount);
-    }
-    else {
-        if( argc - optind < 2 ) {
-            fprintf(stderr, "Please specify package list file\n");
-        }
-        else {
-            const char *pkglistfn = argv[optind+1];
-            rc = processPackages(ts, tscount, pkglistfn, ignoremissing);
-        }
-    }
-
-    for(i=0; i<tscount; i++)
-        (void)rpmtsFree(ts[i]);
-    free(ts);
-
-    if( outfile ) {
-        fclose(outf);
-        free(outfile);
-    }
-
-    return rc;
-}
diff --git a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
deleted file mode 100644
index 0c13a67107a..00000000000
--- a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "OpenEmbedded RPM resolver utility"
-DESCRIPTION = "OpenEmbedded RPM resolver - performs RPM database lookups in batches to avoid \
- repeated invocations of rpm on the command line."
-DEPENDS = "rpm"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-PR = "r2"
-
-SRC_URI = "file://rpmresolve.c"
-
-S = "${WORKDIR}"
-
-do_compile() {
-	${CC} ${CFLAGS} -ggdb -I${STAGING_INCDIR}/rpm ${LDFLAGS} rpmresolve.c -o rpmresolve -lrpmbuild -lrpm -lrpmio -lrpmdb
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 rpmresolve ${D}${bindir}
-}
-
-do_install_append_class-native() {
-	create_wrapper ${D}/${bindir}/rpmresolve \
-			RPM_USRLIBRPM=${STAGING_LIBDIR_NATIVE}/rpm \
-			RPM_ETCRPM=${STAGING_ETCDIR_NATIVE}/rpm \
-			RPM_LOCALEDIRRPM=${STAGING_DATADIR_NATIVE}/locale
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


