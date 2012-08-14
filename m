Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GDL-0001V8-Pe
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:27:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181653"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:15:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:51 +0300
Message-Id: <93c9faa3e03aa436bb5c1b874d7f1e1560741477.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 64/64] rpmresolve: improve debug output
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
X-List-Received-Date: Tue, 14 Aug 2012 12:27:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Rename rpmresolve's -d option to -t and make -d enable debug output;
add a -o option to specify the output file (so rpm debug output doesn't
go to the output file) and also add a little more detail to some of the
error messages.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package_rpm.bbclass                  |    4 +-
 meta/classes/rootfs_rpm.bbclass                   |    2 +-
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |   69 ++++++++++++++++----
 3 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 50e9b31..b58ae85 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -235,9 +235,9 @@ process_pkg_list_rpm() {
 		extraopt="-i"
 	fi
 
-	rpmresolve $extraopt ${confbase}-base_archs.conf ${target_rootfs}/install/base_archs.pkglist >> ${target_rootfs}/install/${manifestpfx}.manifest
+	rpmresolve $extraopt ${confbase}-base_archs.conf ${target_rootfs}/install/base_archs.pkglist -o ${target_rootfs}/install/${manifestpfx}.manifest
 	if [ -s ${target_rootfs}/install/ml_archs.pkglist ] ; then
-		rpmresolve $extraopt ${confbase}-ml_archs.conf ${target_rootfs}/install/ml_archs.pkglist >> ${target_rootfs}/install/${manifestpfx}_multilib.manifest
+		rpmresolve $extraopt ${confbase}-ml_archs.conf ${target_rootfs}/install/ml_archs.pkglist -o ${target_rootfs}/install/${manifestpfx}_multilib.manifest
 	fi
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index a03e9f3..c0207d8 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -151,7 +151,7 @@ list_installed_packages() {
 }
 
 rootfs_list_installed_depends() {
-	rpmresolve -d $INSTALL_ROOTFS_RPM/${rpmlibdir}
+	rpmresolve -t $INSTALL_ROOTFS_RPM/${rpmlibdir}
 }
 
 rootfs_install_packages() {
diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
index 2d9ed14..aedea05 100644
--- a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
+++ b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
@@ -36,6 +36,9 @@
 #include <argv.h>
 #include <mire.h>
 
+int debugmode;
+FILE *outf;
+
 int getPackageStr(rpmts ts, const char *NVRA, rpmTag tag, char **value)
 {
     int rc = -1;
@@ -69,6 +72,8 @@ int loadTs(rpmts **ts, int *tsct, const char *dblistfn)
         listfile = 0;
 
     if(listfile) {
+        if(debugmode)
+            printf("DEBUG: reading database list file '%s'\n", dblistfn);
         *ts = malloc(sz * sizeof(rpmts));
         FILE *f = fopen(dblistfn, "r" );
         if(f) {
@@ -87,6 +92,8 @@ int loadTs(rpmts **ts, int *tsct, const char *dblistfn)
                         *ts = (rpmts *)realloc(*ts, sz);
                     }
 
+                    if(debugmode)
+                        printf("DEBUG: opening database '%s'\n", line);
                     char *dbpathm = malloc(strlen(line) + 10);
                     sprintf(dbpathm, "_dbpath %s", line);
                     rpmDefineMacro(NULL, dbpathm, RMIL_CMDLINE);
@@ -113,6 +120,8 @@ int loadTs(rpmts **ts, int *tsct, const char *dblistfn)
         }
     }
     else {
+        if(debugmode)
+            printf("DEBUG: opening database '%s'\n", dblistfn);
         // Load from single database
         *ts = malloc(sizeof(rpmts));
         char *dbpathm = malloc(strlen(dblistfn) + 10);
@@ -164,13 +173,22 @@ int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignor
                             char *value = NULL;
                             rc = getPackageStr(ts[i], keys[0], RPMTAG_PACKAGEORIGIN, &value);
                             if(rc == 0)
-                                printf("%s\n", value);
+                                fprintf(outf, "%s\n", value);
                             else
                                 fprintf(stderr, "Failed to get package origin for %s\n", line);
                             found = 1;
                         }
                         else if( nkeys > 1 ) {
-                            fprintf(stderr, "Multiple matches for %s!\n", line);
+                            int keyindex = 0;
+                            fprintf(stderr, "Multiple matches for %s:\n", line);
+                            for( keyindex=0; keyindex<nkeys; keyindex++) {
+                                char *value = NULL;
+                                rc = getPackageStr(ts[i], keys[keyindex], RPMTAG_PACKAGEORIGIN, &value);
+                                if(rc == 0)
+                                    fprintf(outf, "  %s\n", value);
+                                else
+                                    fprintf(stderr, "  (%s)\n", keys[keyindex]);
+                            }
                         }
                     }
                     if(found)
@@ -230,7 +248,7 @@ int printDepList(rpmts *ts, int tscount)
     int rc = 0;
 
     if( tscount > 1 )
-        printf(">1 database specified with dependency list, using first only\n");
+        fprintf(stderr, ">1 database specified with dependency list, using first only\n");
 
     /* Get list of names */
     rpmdb db = rpmtsGetRdb(ts[0]);
@@ -274,17 +292,17 @@ int printDepList(rpmts *ts, int tscount)
                     }
                     if(prov) {
                         if((int)reqflags[j] & 0x80000)
-                            printf("%s|%s [REC]\n", name, prov);
+                            fprintf(outf, "%s|%s [REC]\n", name, prov);
                         else
-                            printf("%s|%s\n", name, prov);
+                            fprintf(outf, "%s|%s\n", name, prov);
                     }
                     else {
                         rc = lookupProvider(ts[0], reqs[j], &prov);
                         if(rc==0 && prov) {
                             if((int)reqflags[j] & 0x80000)
-                                printf("%s|%s [REC]\n", name, prov);
+                                fprintf(outf, "%s|%s [REC]\n", name, prov);
                             else
-                                printf("%s|%s\n", name, prov);
+                                fprintf(outf, "%s|%s\n", name, prov);
                             free(prov);
                         }
                     }
@@ -301,7 +319,7 @@ int printDepList(rpmts *ts, int tscount)
 void usage()
 {
     fprintf(stderr, "OpenEmbedded rpm resolver utility\n");
-    fprintf(stderr, "syntax: rpmresolve [-i] [-d] <dblistfile> <packagelistfile>\n");
+    fprintf(stderr, "syntax: rpmresolve [-i] [-d] [-t] <dblistfile> <packagelistfile>\n");
 }
 
 int main(int argc, char **argv)
@@ -313,16 +331,26 @@ int main(int argc, char **argv)
     int c;
     int ignoremissing = 0;
     int deplistmode = 0;
+    char *outfile = NULL;
+
+    debugmode = 0;
+    outf = stdout;
 
     opterr = 0;
-    while ((c = getopt (argc, argv, "id")) != -1) {
+    while ((c = getopt (argc, argv, "itdo:")) != -1) {
         switch (c) {
             case 'i':
                 ignoremissing = 1;
                 break;
-            case 'd':
+            case 't':
                 deplistmode = 1;
                 break;
+            case 'd':
+                debugmode = 1;
+                break;
+            case 'o':
+                outfile = strdup(optarg);
+                break;
             case '?':
                 if(isprint(optopt))
                     fprintf(stderr, "Unknown option `-%c'.\n", optopt);
@@ -341,9 +369,16 @@ int main(int argc, char **argv)
         return 1;
     }
 
+    if( outfile ) {
+        if(debugmode)
+            printf("DEBUG: Using output file %s\n", outfile);
+        outf = fopen(outfile, "w");
+    }
+
     const char *dblistfn = argv[optind];
 
-    //rpmSetVerbosity(RPMLOG_DEBUG);
+    if(debugmode)
+        rpmSetVerbosity(RPMLOG_DEBUG);
 
     rpmReadConfigFiles( NULL, NULL );
     rpmDefineMacro(NULL, "__dbi_txn create nofsync", RMIL_CMDLINE);
@@ -362,15 +397,21 @@ int main(int argc, char **argv)
     else {
         if( argc - optind < 2 ) {
             fprintf(stderr, "Please specify package list file\n");
-            return 1;
         }
-        const char *pkglistfn = argv[optind+1];
-        rc = processPackages(ts, tscount, pkglistfn, ignoremissing);
+        else {
+            const char *pkglistfn = argv[optind+1];
+            rc = processPackages(ts, tscount, pkglistfn, ignoremissing);
+        }
     }
 
     for(i=0; i<tscount; i++)
         (void) rpmtsCloseDB(ts[i]);
     free(ts);
 
+    if( outfile ) {
+        fclose(outf);
+        free(outfile);
+    }
+
     return rc;
 }
-- 
1.7.7.6



