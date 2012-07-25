Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su6jA-0008FU-T3
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:54:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 11:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173137535"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 11:43:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 19:42:52 +0100
Message-Id: <2776e086d3f1300cc3241527dfdf2e572744f17e.1343241383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] classes/rootfs_rpm: improve speed of RPM rootfs construction
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
X-List-Received-Date: Wed, 25 Jul 2012 18:54:33 -0000

Improve the performance of the RPM backend during do_rootfs by
performing most of the package name to file resolution in a separate
utility written in C, processing the entire list of packages at once
rather than running rpm on the command line which loads the RPM database
for every package.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_rpm.bbclass                  |  109 ++++----
 meta/classes/rootfs_rpm.bbclass                   |    1 +
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |  273 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb       |   22 ++
 4 files changed, 341 insertions(+), 64 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
 create mode 100644 meta/recipes-devtools/rpm/rpmresolve_1.0.bb

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 983be4c..29018e9 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -197,6 +197,45 @@ rpm_update_pkg () {
     fi
 }
 
+process_pkg_list_rpm() {
+	local insttype=$1
+	shift
+	local pkgs="$@"
+	local confbase=${INSTALL_CONFBASE_RPM}
+
+	echo -n > ${target_rootfs}/install/base_archs.pkglist
+	echo -n > ${target_rootfs}/install/ml_archs.pkglist
+
+	for pkg in $pkgs; do
+		echo "Processing $pkg..."
+
+		archvar=base_archs
+		ml_pkg=$pkg
+		for i in ${MULTILIB_PREFIX_LIST} ; do
+				subst=${pkg#${i}-}
+				if [ $subst != $pkg ] ; then
+						ml_pkg=$subst
+						archvar=ml_archs
+						break
+				fi
+		done
+
+		echo $ml_pkg >> ${target_rootfs}/install/$archvar.pkglist
+	done
+
+	local manifestpfx="install"
+	local extraopt=""
+	if [ "$insttype" = "attemptonly" ] ; then
+		manifestpfx="install_attemptonly"
+		extraopt="-i"
+	fi
+
+	rpmresolve $extraopt ${confbase}-base_archs.conf ${target_rootfs}/install/base_archs.pkglist >> ${target_rootfs}/install/${manifestpfx}.manifest
+	if [ -s ${target_rootfs}/install/ml_archs.pkglist ] ; then
+		rpmresolve $extraopt ${confbase}-ml_archs.conf ${target_rootfs}/install/ml_archs.pkglist >> ${target_rootfs}/install/${manifestpfx}_multilib.manifest
+	fi
+}
+
 #
 # install a bunch of packages using rpm
 # the following shell variables needs to be set before calling this func:
@@ -256,55 +295,12 @@ package_install_internal_rpm () {
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
 		if [ ! -z "${package_linguas}" ]; then
-			for pkg in ${package_linguas}; do
-				echo "Processing $pkg..."
-
-				archvar=base_archs
-				manifest=install.manifest
-				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
-				ml_pkg=$pkg
-				for i in ${MULTILIB_PREFIX_LIST} ; do
-					if [ ${ml_prefix} = ${i} ]; then
-						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
-						archvar=ml_archs
-						manifest=install_multilib.manifest
-						break
-					fi
-				done
-
-				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
-				if [ -z "$pkg_name" ]; then
-					echo "Unable to find package $pkg ($ml_pkg)!"
-					exit 1
-				fi
-				echo $pkg_name >> ${target_rootfs}/install/${manifest}
-			done
+			process_pkg_list_rpm linguas ${package_linguas}
 		fi
 	fi
-	if [ ! -z "${package_to_install}" ]; then
-		for pkg in ${package_to_install} ; do
-			echo "Processing $pkg..."
 
-			archvar=base_archs
-			manifest=install.manifest
-			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
-			ml_pkg=$pkg
-			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} = ${i} ]; then
-					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
-					archvar=ml_archs
-					manifest=install_multilib.manifest
-					break
-				fi
-			done
-
-			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
-			if [ -z "$pkg_name" ]; then
-				echo "Unable to find package $pkg ($ml_pkg)!"
-				exit 1
-			fi
-			echo $pkg_name >> ${target_rootfs}/install/${manifest}
-		done
+	if [ ! -z "${package_to_install}" ]; then
+		process_pkg_list_rpm default ${package_to_install}
 	fi
 
 	# Normal package installation
@@ -324,24 +320,9 @@ package_install_internal_rpm () {
 
 	if [ ! -z "${package_attemptonly}" ]; then
 		echo "Adding attempt only packages..."
-		for pkg in ${package_attemptonly} ; do
-			echo "Processing $pkg..."
-			archvar=base_archs
-			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
-			ml_pkg=$pkg
-			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} = ${i} ]; then
-					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
-					archvar=ml_archs
-					break
-				fi
-			done
-
-			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
-			if [ -z "$pkg_name" ]; then
-				echo "Note: Unable to find package $pkg ($ml_pkg) -- PACKAGE_INSTALL_ATTEMPTONLY"
-				continue
-			fi
+		process_pkg_list_rpm attemptonly ${package_attemptonly}
+		cat ${target_rootfs}/install/install_attemptonly.manifest | while read pkg_name
+		do
 			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 4551f7a..cd9c5ab 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -11,6 +11,7 @@ IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "zypper",
 ROOTFS_PKGMANAGE_BOOTSTRAP = ""
 
 do_rootfs[depends] += "rpm-native:do_populate_sysroot"
+do_rootfs[depends] += "rpmresolve-native:do_populate_sysroot"
 
 # Needed for update-alternatives
 do_rootfs[depends] += "opkg-native:do_populate_sysroot"
diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
new file mode 100644
index 0000000..9f6cdf2
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
@@ -0,0 +1,273 @@
+/* OpenEmbedded RPM resolver utility
+
+  Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+  Copyright 2012 Intel Corporation
+
+  This program is free software; you can redistribute it and/or modify
+  it under the terms of the GNU General Public License version 2 as
+  published by the Free Software Foundation.
+
+  This program is distributed in the hope that it will be useful,
+  but WITHOUT ANY WARRANTY; without even the implied warranty of
+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+  GNU General Public License for more details.
+
+  You should have received a copy of the GNU General Public License along
+  with this program; if not, write to the Free Software Foundation, Inc.,
+  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+*/
+
+#include <ctype.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+
+#include <rpmdb.h>
+#include <rpmtypes.h>
+#include <rpmtag.h>
+#include <rpmts.h>
+#include <rpmmacro.h>
+#include <rpmcb.h>
+#include <rpmlog.h>
+#include <argv.h>
+#include <mire.h>
+
+int getPackageStr(rpmts ts, const char *NVRA, rpmTag tag, char **value)
+{
+    int rc = -1;
+    rpmmi mi = rpmtsInitIterator(ts, RPMTAG_NVRA, NVRA, 0);
+    Header h;
+    if ((h = rpmmiNext(mi)) != NULL) {
+        HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
+        he->tag = tag;
+        rc = (headerGet(h, he, 0) != 1);
+        if(rc==0)
+            *value = strdup((char *)he->p.ptr);
+    }
+    (void)rpmmiFree(mi);
+    return rc;
+}
+
+int loadTs(rpmts **ts, int *tsct, const char *dblistfn)
+{
+    int count = 0;
+    int sz = 5;
+    int rc = 0;
+    int listfile = 1;
+    struct stat st_buf;
+
+    rc = stat(dblistfn, &st_buf);
+    if(rc != 0) {
+        perror("stat");
+        return 1;
+    }
+    if(S_ISDIR(st_buf.st_mode))
+        listfile = 0;
+
+    if(listfile) {
+        *ts = malloc(sz * sizeof(rpmts));
+        FILE *f = fopen(dblistfn, "r" );
+        if(f) {
+            char line[2048];
+            while(fgets(line, sizeof(line), f)) {
+                int len = strlen(line) - 1;
+                if(len > 0)
+                    // Trim trailing whitespace
+                    while(len > 0 && isspace(line[len]))
+                        line[len--] = '\0';
+
+                if(len > 0) {
+                    // Expand array if needed
+                    if(count == sz) {
+                        sz += 5;
+                        *ts = (rpmts *)realloc(*ts, sz);
+                    }
+
+                    char *dbpathm = malloc(strlen(line) + 10);
+                    sprintf(dbpathm, "_dbpath %s", line);
+                    rpmDefineMacro(NULL, dbpathm, RMIL_CMDLINE);
+                    free(dbpathm);
+
+                    rpmts tsi = rpmtsCreate();
+                    (*ts)[count] = tsi;
+                    rc = rpmtsOpenDB(tsi, O_RDONLY);
+                    if( rc ) {
+                        fprintf(stderr, "Failed to open database %s\n", line);
+                        rc = -1;
+                        break;
+                    }
+
+                    count++;
+                }
+            }
+            fclose(f);
+            *tsct = count;
+        }
+        else {
+            perror(dblistfn);
+            rc = -1;
+        }
+    }
+    else {
+        // Load from single database
+        *ts = malloc(sizeof(rpmts));
+        char *dbpathm = malloc(strlen(dblistfn) + 10);
+        sprintf(dbpathm, "_dbpath %s", dblistfn);
+        rpmDefineMacro(NULL, dbpathm, RMIL_CMDLINE);
+        free(dbpathm);
+
+        rpmts tsi = rpmtsCreate();
+        (*ts)[0] = tsi;
+        rc = rpmtsOpenDB(tsi, O_RDONLY);
+        if( rc ) {
+            fprintf(stderr, "Failed to open database %s\n", dblistfn);
+            rc = -1;
+        }
+        *tsct = 1;
+    }
+
+    return rc;
+}
+
+int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignoremissing)
+{
+    int rc = 0;
+    int count = 0;
+    int sz = 100;
+    int i = 0;
+    int missing = 0;
+
+    FILE *f = fopen(packagelistfn, "r" );
+    if(f) {
+        char line[255];
+        while(fgets(line, sizeof(line), f)) {
+            int len = strlen(line) - 1;
+            if(len > 0)
+                // Trim trailing whitespace
+                while(len > 0 && isspace(line[len]))
+                    line[len--] = '\0';
+
+            if(len > 0) {
+                int found = 0;
+                for(i=0; i<tscount; i++) {
+                    ARGV_t keys = NULL;
+                    rpmdb db = rpmtsGetRdb(ts[i]);
+                    rc = rpmdbMireApply(db, RPMTAG_NAME,
+                                RPMMIRE_STRCMP, line, &keys);
+                    if (keys) {
+                        int nkeys = argvCount(keys);
+                        if( nkeys == 1 ) {
+                            char *value = NULL;
+                            rc = getPackageStr(ts[i], keys[0], RPMTAG_PACKAGEORIGIN, &value);
+                            if(rc == 0)
+                                printf("%s\n", value);
+                            else
+                                fprintf(stderr, "Failed to get package origin for %s\n", line);
+                            found = 1;
+                        }
+                        else if( nkeys > 1 ) {
+                            fprintf(stderr, "Multiple matches for %s!\n", line);
+                        }
+                    }
+                    if(found)
+                        break;
+                }
+
+                if( !found ) {
+                    if( ignoremissing ) {
+                        fprintf(stderr, "unable to find package %s - ignoring\n", line);
+                    }
+                    else {
+                        fprintf(stderr, "unable to find package %s\n", line);
+                        missing = 1;
+                    }
+                }
+            }
+            count++;
+        }
+        fclose(f);
+
+        if( missing ) {
+            fprintf(stderr, "ERROR: some packages were missing\n");
+            rc = 1;
+        }
+    }
+    else {
+        perror(packagelistfn);
+        rc = -1;
+    }
+
+    return rc;
+}
+
+void usage()
+{
+    fprintf(stderr, "OpenEmbedded rpm resolver utility\n");
+    fprintf(stderr, "syntax: rpmresolve [-i] <dblistfile> <packagelistfile>\n");
+}
+
+int main(int argc, char **argv)
+{
+    rpmts *ts = NULL;
+    int tscount = 0;
+    int rc = 0;
+    int i;
+    int c;
+    int ignoremissing = 0;
+
+    opterr = 0;
+    while ((c = getopt (argc, argv, "i")) != -1) {
+        switch (c) {
+            case 'i':
+                ignoremissing = 1;
+                break;
+            case '?':
+                if(isprint(optopt))
+                    fprintf(stderr, "Unknown option `-%c'.\n", optopt);
+                else
+                    fprintf(stderr, "Unknown option character `\\x%x'.\n",
+                        optopt);
+                usage();
+                return 1;
+            default:
+                abort();
+        }
+    }
+
+    if( argc - optind < 1 ) {
+        usage();
+        return 1;
+    }
+
+    const char *dblistfn = argv[optind];
+
+    //rpmSetVerbosity(RPMLOG_DEBUG);
+
+    rpmReadConfigFiles( NULL, NULL );
+    rpmDefineMacro(NULL, "__dbi_txn create nofsync", RMIL_CMDLINE);
+
+    rc = loadTs(&ts, &tscount, dblistfn);
+    if( rc )
+        return 1;
+    if( tscount == 0 ) {
+        fprintf(stderr, "Please specify database list file or database location\n");
+        return 1;
+    }
+
+    if( argc - optind < 2 ) {
+        fprintf(stderr, "Please specify package list file\n");
+        return 1;
+    }
+    const char *pkglistfn = argv[optind+1];
+    rc = processPackages(ts, tscount, pkglistfn, ignoremissing);
+
+    for(i=0; i<tscount; i++)
+        (void) rpmtsCloseDB(ts[i]);
+    free(ts);
+
+    return rc;
+}
diff --git a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
new file mode 100644
index 0000000..f8750e0
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "OpenEmbedded RPM resolver utility"
+DESCRIPTION = "OpenEmbedded RPM resolver - performs RPM database lookups in batches to avoid \
+ repeated invocations of rpm on the command line."
+DEPENDS = "rpm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+PR = "r0"
+
+SRC_URI = "file://rpmresolve.c"
+
+S = "${WORKDIR}"
+
+do_compile() {
+	${CC} ${CFLAGS} -ggdb -I${STAGING_INCDIR}/rpm ${LDFLAGS} rpmresolve.c -o rpmresolve -lrpmbuild -lrpm -lrpmio -lrpmdb -lpopt
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 rpmresolve ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5



