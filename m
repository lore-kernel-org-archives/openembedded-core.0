Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SuAnB-0004lZ-0a
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 01:14:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2012 16:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171468486"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2012 16:03:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 00:03:18 +0100
Message-Id: <1daa0eea7f97498d5f520701ea9b089fd2f64d57.1343256969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343256969.git.paul.eggleton@linux.intel.com>
References: <cover.1343256969.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343256969.git.paul.eggleton@linux.intel.com>
References: <cover.1343256969.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] buildhistory: improve performance of image info collection
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
X-List-Received-Date: Wed, 25 Jul 2012 23:14:57 -0000

Reduce the number of calls to the packaging tool, especially in the case
of rpm, using helper utilities to gather the required information more
efficiently where possible.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass                 |   51 ++++-----
 meta/classes/rootfs_deb.bbclass                   |   28 +++--
 meta/classes/rootfs_ipk.bbclass                   |   34 +++---
 meta/classes/rootfs_rpm.bbclass                   |   33 +-----
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c |  117 +++++++++++++++++++--
 5 files changed, 162 insertions(+), 101 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f0bf849..ddb76e8 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -285,48 +285,43 @@ buildhistory_get_image_installed() {
 	mkdir -p ${BUILDHISTORY_DIR_IMAGE}
 
 	# Get list of installed packages
-	list_installed_packages | sort > ${BUILDHISTORY_DIR_IMAGE}/installed-package-names.txt
-	INSTALLED_PKGS=`cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-names.txt`
+	pkgcache="${BUILDHISTORY_DIR_IMAGE}/installed-packages.tmp"
+	list_installed_packages file | sort > $pkgcache
+
+	cat $pkgcache | awk '{ print $1 }' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-names.txt
+	cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
+
+	# Produce dependency graph
+	# First, filter out characters that cause issues for dot
+	rootfs_list_installed_depends | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' > ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
+	# Change delimiter from pipe to -> and set style for recommend lines
+	sed -i -e 's:|: -> :' -e 's:\[REC\]:[style=dotted]:' -e 's:$:;:' ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
+	# Add header, sorted and de-duped contents and footer and then delete the temp file
+	echo -e "digraph depends {\n    node [shape=plaintext]" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+	cat ${BUILDHISTORY_DIR_IMAGE}/depends.tmp | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+	rm ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 
-	# Produce installed package file and size lists and dependency graph
-	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
+	# Produce installed package sizes list
 	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
-	echo -e "digraph depends {\n    node [shape=plaintext]" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
-	for pkg in $INSTALLED_PKGS; do
-		pkgfile=`get_package_filename $pkg`
-		echo `basename $pkgfile` >> ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
+	cat $pkgcache | while read pkg pkgfile
+	do
 		if [ -f $pkgfile ] ; then
 			pkgsize=`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
 			echo $pkgsize $pkg >> ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
 		fi
-
-		deps=`list_package_depends $pkg`
-		for dep in $deps ; do
-			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
-		done
-
-		recs=`list_package_recommends $pkg`
-		for rec in $recs ; do
-			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
-		done
-	done | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
-	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
-
+	done
 	cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.txt
 	rm ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
 
+	# We're now done with the cache, delete it
+	rm $pkgcache
+
 	# Produce some cut-down graphs (for readability)
 	grep -v kernel_image ${BUILDHISTORY_DIR_IMAGE}/depends.dot | grep -v kernel_2 | grep -v kernel_3 > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot
 	grep -v libc6 ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot | grep -v libgcc > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot
 	grep -v update_ ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot
 	grep -v kernel_module ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate-nomodules.dot
-
-	# Workaround for broken shell function dependencies
-	if false ; then
-		get_package_filename
-		list_package_depends
-		list_package_recommends
-	fi
 }
 
 buildhistory_get_imageinfo() {
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index a002b1e..750a8ca 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -96,26 +96,24 @@ list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
 		# Here we want the PACKAGE_ARCH not the deb architecture
 		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch}\n'
+	elif [ "$1" = "file" ] ; then
+		${DPKG_QUERY_COMMAND} -W -f='${Package} ${Package}_${Version}_${Architecture}.deb\n' | while read pkg pkgfile
+		do
+			fullpath=`find ${DEPLOY_DIR_DEB} -name "$pkgfile" || true`
+			if [ "$fullpath" = "" ] ; then
+				echo "$pkg $pkgfile"
+			else
+				echo "$pkg $fullpath"
+			fi
+		done
 	else
 		${DPKG_QUERY_COMMAND} -W -f='${Package}\n'
 	fi
 }
 
-get_package_filename() {
-	fullname=`find ${DEPLOY_DIR_DEB} -name "$1_*.deb" || true`
-	if [ "$fullname" = "" ] ; then
-		echo $name
-	else
-		echo $fullname
-	fi
-}
-
-list_package_depends() {
-	${DPKG_QUERY_COMMAND} -s $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
-}
-
-list_package_recommends() {
-	${DPKG_QUERY_COMMAND} -s $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
+rootfs_list_installed_depends() {
+	# Cheat here a little bit by using the opkg query helper util
+	${DPKG_QUERY_COMMAND} -W -f='Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n' | opkg-query-helper.py
 }
 
 rootfs_install_packages() {
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 7df97a0..6cdd8f6 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -131,33 +131,23 @@ remove_packaging_data_files() {
 list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
 		opkg-cl ${IPKG_ARGS_POST} status | opkg-query-helper.py -a
+	elif [ "$1" = "file" ] ; then
+		opkg-cl ${IPKG_ARGS_POST} status | opkg-query-helper.py -f | while read pkg pkgfile
+		do
+			fullpath=`find ${DEPLOY_DIR_IPK} -name "$pkgfile" || true`
+			if [ "$fullpath" = "" ] ; then
+				echo "$pkg $pkgfile"
+			else
+				echo "$pkg $fullpath"
+			fi
+		done
 	else
 		opkg-cl ${IPKG_ARGS_POST} list_installed | awk '{ print $1 }'
 	fi
 }
 
-get_package_filename() {
-	set +x
-	info=`opkg-cl ${IPKG_ARGS_POST} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
-	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
-	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
-	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
-	set -x
-
-	fullname=`find ${DEPLOY_DIR_IPK} -name "$name" || true`
-	if [ "$fullname" = "" ] ; then
-		echo $name
-	else
-		echo $fullname
-	fi
-}
-
-list_package_depends() {
-	opkg-cl ${IPKG_ARGS_POST} info $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
-}
-
-list_package_recommends() {
-	opkg-cl ${IPKG_ARGS_POST} info $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
+rootfs_list_installed_depends() {
+	opkg-cl ${IPKG_ARGS_POST} status | opkg-query-helper.py
 }
 
 rootfs_install_packages() {
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 1cc4a84..c9258df 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -143,40 +143,15 @@ RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
 list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]"
+	elif [ "$1" = "file" ] ; then
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]"
 	else
 		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
 	fi
 }
 
-get_package_filename() {
-	resolve_package_rpm ${RPMCONF_TARGET_BASE}-base_archs.conf $1
-}
-
-list_package_depends() {
-	pkglist=`list_installed_packages`
-
-	# REQUIRE* lists "soft" requirements (which we know as recommends and RPM refers to
-	# as "suggests") so filter these out with the help of awk
-	for req in `${RPM_QUERY_CMD} -q --qf "[%{REQUIRENAME} %{REQUIREFLAGS}\n]" $1 | awk '{ if( and($2, 0x80000) == 0) print $1 }'`; do
-		if echo "$req" | grep -q "^rpmlib" ; then continue ; fi
-
-		realpkg=""
-		for dep in $pkglist; do
-			if [ "$dep" = "$req" ] ; then
-				realpkg="1"
-				echo $req
-				break
-			fi
-		done
-
-		if [ "$realdep" = "" ] ; then
-			${RPM_QUERY_CMD} -q --whatprovides $req --qf "%{NAME}\n"
-		fi
-	done
-}
-
-list_package_recommends() {
-	${RPM_QUERY_CMD} -q --suggests $1
+rootfs_list_installed_depends() {
+	rpmresolve -d $INSTALL_ROOTFS_RPM/${rpmlibdir}
 }
 
 rootfs_install_packages() {
diff --git a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
index 9f6cdf2..2d9ed14 100644
--- a/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
+++ b/meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c
@@ -204,10 +204,104 @@ int processPackages(rpmts *ts, int tscount, const char *packagelistfn, int ignor
     return rc;
 }
 
+int lookupProvider(rpmts ts, const char *req, char **provider)
+{
+    int rc = 0;
+    rpmmi provmi = rpmtsInitIterator(ts, RPMTAG_PROVIDENAME, req, 0);
+    if(provmi) {
+        Header h;
+        if ((h = rpmmiNext(provmi)) != NULL) {
+            HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
+            he->tag = RPMTAG_NAME;
+            rc = (headerGet(h, he, 0) != 1);
+            if(rc==0)
+                *provider = strdup((char *)he->p.ptr);
+        }
+        (void)rpmmiFree(provmi);
+    }
+    else {
+        rc = -1;
+    }
+    return rc;
+}
+
+int printDepList(rpmts *ts, int tscount)
+{
+    int rc = 0;
+
+    if( tscount > 1 )
+        printf(">1 database specified with dependency list, using first only\n");
+
+    /* Get list of names */
+    rpmdb db = rpmtsGetRdb(ts[0]);
+    ARGV_t names = NULL;
+    rc = rpmdbMireApply(db, RPMTAG_NAME,
+                RPMMIRE_STRCMP, NULL, &names);
+    int nnames = argvCount(names);
+
+    /* Get list of NVRAs */
+    ARGV_t keys = NULL;
+    rc = rpmdbMireApply(db, RPMTAG_NVRA,
+                RPMMIRE_STRCMP, NULL, &keys);
+    if (keys) {
+        int i, j;
+        HE_t he = (HE_t) memset(alloca(sizeof(*he)), 0, sizeof(*he));
+        int nkeys = argvCount(keys);
+        for(i=0; i<nkeys; i++) {
+            rpmmi mi = rpmtsInitIterator(ts[0], RPMTAG_NVRA, keys[i], 0);
+            Header h;
+            if ((h = rpmmiNext(mi)) != NULL) {
+                /* Get name of package */
+                he->tag = RPMTAG_NAME;
+                rc = (headerGet(h, he, 0) != 1);
+                char *name = strdup((char *)he->p.ptr);
+                /* Get its requires */
+                he->tag = RPMTAG_REQUIRENAME;
+                rc = (headerGet(h, he, 0) != 1);
+                ARGV_t reqs = (ARGV_t)he->p.ptr;
+                /* Get its requireflags */
+                he->tag = RPMTAG_REQUIREFLAGS;
+                rc = (headerGet(h, he, 0) != 1);
+                rpmuint32_t *reqflags = (rpmuint32_t *)he->p.ui32p;
+                for(j=0; j<he->c; j++) {
+                    int k;
+                    char *prov = NULL;
+                    for(k=0; k<nnames; k++) {
+                        if(strcmp(names[k], reqs[j]) == 0) {
+                            prov = names[k];
+                            break;
+                        }
+                    }
+                    if(prov) {
+                        if((int)reqflags[j] & 0x80000)
+                            printf("%s|%s [REC]\n", name, prov);
+                        else
+                            printf("%s|%s\n", name, prov);
+                    }
+                    else {
+                        rc = lookupProvider(ts[0], reqs[j], &prov);
+                        if(rc==0 && prov) {
+                            if((int)reqflags[j] & 0x80000)
+                                printf("%s|%s [REC]\n", name, prov);
+                            else
+                                printf("%s|%s\n", name, prov);
+                            free(prov);
+                        }
+                    }
+                }
+                free(name);
+            }
+            (void)rpmmiFree(mi);
+        }
+    }
+
+    return rc;
+}
+
 void usage()
 {
     fprintf(stderr, "OpenEmbedded rpm resolver utility\n");
-    fprintf(stderr, "syntax: rpmresolve [-i] <dblistfile> <packagelistfile>\n");
+    fprintf(stderr, "syntax: rpmresolve [-i] [-d] <dblistfile> <packagelistfile>\n");
 }
 
 int main(int argc, char **argv)
@@ -218,13 +312,17 @@ int main(int argc, char **argv)
     int i;
     int c;
     int ignoremissing = 0;
+    int deplistmode = 0;
 
     opterr = 0;
-    while ((c = getopt (argc, argv, "i")) != -1) {
+    while ((c = getopt (argc, argv, "id")) != -1) {
         switch (c) {
             case 'i':
                 ignoremissing = 1;
                 break;
+            case 'd':
+                deplistmode = 1;
+                break;
             case '?':
                 if(isprint(optopt))
                     fprintf(stderr, "Unknown option `-%c'.\n", optopt);
@@ -258,12 +356,17 @@ int main(int argc, char **argv)
         return 1;
     }
 
-    if( argc - optind < 2 ) {
-        fprintf(stderr, "Please specify package list file\n");
-        return 1;
+    if(deplistmode) {
+        rc = printDepList(ts, tscount);
+    }
+    else {
+        if( argc - optind < 2 ) {
+            fprintf(stderr, "Please specify package list file\n");
+            return 1;
+        }
+        const char *pkglistfn = argv[optind+1];
+        rc = processPackages(ts, tscount, pkglistfn, ignoremissing);
     }
-    const char *pkglistfn = argv[optind+1];
-    rc = processPackages(ts, tscount, pkglistfn, ignoremissing);
 
     for(i=0; i<tscount; i++)
         (void) rpmtsCloseDB(ts[i]);
-- 
1.7.9.5



