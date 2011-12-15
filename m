Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbIek-0000Fm-Vi for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 22:15:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFL90Gp009535;
	Thu, 15 Dec 2011 21:09:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09076-06; Thu, 15 Dec 2011 21:08:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFL8oaR009529
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 15 Dec 2011 21:08:50 GMT
Message-ID: <1323983329.4568.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 21:08:49 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Graham Gower <graham.gower@gmail.com>
Subject: opkg: Update svn 625 -> 633 and fix preinst issues
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
X-List-Received-Date: Thu, 15 Dec 2011 21:15:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is a major issue with opkg images at the moment as preinst
functions are not being executed before their dependencies are installed
and this is leading to corruption of images containing avahi/dbus in
particular.

There are various changes in upstream opkg in the last 8 revisions which
make changes in this area but sadly these aren't enough to get things
working for us. I've updated to the latest svn revision with this patch
since it makes sense to pull in those changes first and then supplement
them with the attached patches.

There is a full description of the patches in the patch headers but in
summary they:

a) Ensure preinst functions execute with their dependencies installed.
   This is a pretty invasive change as it changes the package install
   ordering in general.
b) Ensure opkg sets $D, not $PKG_ROOT which we don't use
c) Change opkg to allow execution of postinstall functions which fail
   resulting in execution on the target device as rootfs_ipk.bbclass
   currently does manually.

The remaining changes interface this with the rest of the OE build
infrastructure, adding in the option to tell opkg to run the preinst and
postinst functions, ensure the correct environment is present for the
postinst scripts and removing the now unneeded rootfs_ipk class code
which opkg now does itself.

[YOCTO #1711]
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 1633aff..aeabc11 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -133,7 +133,7 @@ package_install_internal_ipk() {
 
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
 
-	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite"
+	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite --force_postinstall"
 
 	opkg-cl ${ipkg_args} update
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index ec01951..b5556fa 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -60,14 +60,14 @@ fakeroot rootfs_ipk_do_rootfs () {
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_PACKAGES_IPK="${PACKAGE_INSTALL}"
 
-	package_install_internal_ipk
-
 	#post install
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
 
+	package_install_internal_ipk
+
 	# Distro specific packages should create this
 	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
 	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf
@@ -75,28 +75,8 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${OPKG_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTINSTALL_COMMAND}
 	
-	runtime_script_required=0
-
-	# Base-passwd needs to run first to install /etc/passwd and friends
-	if [ -e ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst ] ; then
-		sh ${IMAGE_ROOTFS}${opkglibdir}/info/base-passwd.preinst
-	fi
-
-	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.preinst; do
-		if [ -f $i ] && ! sh $i; then
-		     	runtime_script_required=1
-			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
-		fi
-	done
-	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.postinst; do
-		if [ -f $i ] && ! sh $i configure; then
-		     	runtime_script_required=1
-			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
-		fi
-	done
-
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if [ $runtime_script_required -eq 1 ]; then
+		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}${opkglibdir}status; then
 			echo "Some packages could not be configured offline and rootfs is read-only."
 			exit 1
 		fi
diff --git a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
new file mode 100644
index 0000000..e782ce7
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
@@ -0,0 +1,174 @@
+There is a problem with dependency order when installing packages. The key 
+problem revolves around the satisfy_dependencies_for() function which is 
+called from opkg_install_pkg just before the installation (and preinst)
+happens.
+
+The satisfy_dependencies_for() function calls pkg_hash_fetch_unsatisfied_dependencies()
+which will only return packages which were previously not marked as 
+*going* to be installed at some point. For the purposes of 
+opkg_install_pkg() we really need to know which dependencies haven't been 
+installed yet.
+
+This patch adds pkg_hash_fetch_satisfied_dependencies() which returns a 
+list of package dependencies. We can then directly check the status of 
+these and ensure any hard dependencies (not suggestions or recommendations)
+are installed before returning.
+
+Consider the situation (where -> means 'depends on'):
+
+X -> A,E
+A -> B,E
+E -> B
+B -> C
+
+Currently X would install A and E. When installing A the packages B, E 
+and C would be marked as "to install". When the package B is considered
+the second time (as a dependency of E rather than A), it would install 
+straight away even though C was not currently installed, just marked
+as needing to be installed.
+
+The patch changes the behaviour so B can't install until C really is installed.
+
+This change is required to run the postinst scripts in the correct order.
+
+Upstream-Status: Pending
+
+RP 2011/12/15
+
+Index: trunk/libopkg/opkg_install.c
+===================================================================
+--- trunk.orig/libopkg/opkg_install.c	2011-12-15 15:58:39.000000000 +0000
++++ trunk/libopkg/opkg_install.c	2011-12-15 15:58:41.838334788 +0000
+@@ -76,6 +77,27 @@
+      }
+ 
+      if (ndepends <= 0) {
++	  pkg_vec_free(depends);      
++	  depends = pkg_hash_fetch_satisfied_dependencies(pkg);
++
++	  for (i = 0; i < depends->len; i++) {
++	       dep = depends->pkgs[i];
++	       /* The package was uninstalled when we started, but another
++	          dep earlier in this loop may have depended on it and pulled
++	          it in, so check first. */
++	       if ((dep->state_status != SS_INSTALLED) && (dep->state_status != SS_UNPACKED)) {
++		    opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
++		    err = opkg_install_pkg(dep, 0);
++		    /* mark this package as having been automatically installed to
++		     * satisfy a dependancy */
++		    dep->auto_installed = 1;
++		    if (err) {
++			 pkg_vec_free(depends);
++			 return err;
++		    }
++	       }
++	  }
++
+ 	  pkg_vec_free(depends);
+ 	  return 0;
+      }
+Index: trunk/libopkg/pkg_depends.c
+===================================================================
+--- trunk.orig/libopkg/pkg_depends.c	2010-12-22 16:04:43.000000000 +0000
++++ trunk/libopkg/pkg_depends.c	2011-12-15 15:58:41.838334788 +0000
+@@ -259,6 +259,88 @@
+      return unsatisfied->len;
+ }
+ 
++
++pkg_vec_t *
++pkg_hash_fetch_satisfied_dependencies(pkg_t * pkg)
++{
++     pkg_vec_t *satisfiers;
++     int i, j, k;
++     int count;
++     abstract_pkg_t * ab_pkg;
++
++     satisfiers = pkg_vec_alloc();
++
++     /*
++      * this is a setup to check for redundant/cyclic dependency checks,
++      * which are marked at the abstract_pkg level
++      */
++     if (!(ab_pkg = pkg->parent)) {
++	  opkg_msg(ERROR, "Internal error, with pkg %s.\n", pkg->name);
++	  return satisfiers;
++     }
++
++     count = pkg->pre_depends_count + pkg->depends_count + pkg->recommends_count + pkg->suggests_count;
++     if (!count)
++	  return satisfiers;
++
++     /* foreach dependency */
++     for (i = 0; i < count; i++) {
++	  compound_depend_t * compound_depend = &pkg->depends[i];
++	  depend_t ** possible_satisfiers = compound_depend->possibilities;;
++
++          if (compound_depend->type == RECOMMEND || compound_depend->type == SUGGEST)
++              continue;
++
++	  if (compound_depend->type == GREEDY_DEPEND) {
++	       /* foreach possible satisfier */
++	       for (j = 0; j < compound_depend->possibility_count; j++) {
++		    /* foreach provided_by, which includes the abstract_pkg itself */
++		    abstract_pkg_t *abpkg = possible_satisfiers[j]->pkg;
++		    abstract_pkg_vec_t *ab_provider_vec = abpkg->provided_by;
++		    int nposs = ab_provider_vec->len;
++		    abstract_pkg_t **ab_providers = ab_provider_vec->pkgs;
++		    int l;
++		    for (l = 0; l < nposs; l++) {
++			 pkg_vec_t *test_vec = ab_providers[l]->pkgs;
++			 /* if no depends on this one, try the first package that Provides this one */
++			 if (!test_vec){   /* no pkg_vec hooked up to the abstract_pkg!  (need another feed?) */
++			      continue;
++			 }
++
++			 /* cruise this possiblity's pkg_vec looking for an installed version */
++			 for (k = 0; k < test_vec->len; k++) {
++			      pkg_t *pkg_scout = test_vec->pkgs[k];
++			      /* not installed, and not already known about? */
++			      if (pkg_scout->state_want == SW_INSTALL && pkg_scout != pkg)
++      			          pkg_vec_insert(satisfiers, pkg_scout);
++			 }
++		    }
++	       }
++
++	       continue;
++	  }
++
++	  /* foreach possible satisfier, look for installed package  */
++	  for (j = 0; j < compound_depend->possibility_count; j++) {
++	       /* foreach provided_by, which includes the abstract_pkg itself */
++	       depend_t *dependence_to_satisfy = possible_satisfiers[j];
++	       abstract_pkg_t *satisfying_apkg = possible_satisfiers[j]->pkg;
++	       pkg_t *satisfying_pkg =
++		    pkg_hash_fetch_best_installation_candidate(satisfying_apkg,
++							       pkg_installed_and_constraint_satisfied,
++							       dependence_to_satisfy, 1);
++               /* Being that I can't test constraing in pkg_hash, I will test it here */
++	       if (satisfying_pkg != NULL && satisfying_pkg != pkg) {
++                  if (pkg_constraint_satisfied(satisfying_pkg, dependence_to_satisfy) && satisfying_pkg->state_want == SW_INSTALL)
++	              pkg_vec_insert(satisfiers, satisfying_pkg);
++               }
++
++	  }
++     }
++     return satisfiers;
++}
++
++
+ /*checking for conflicts !in replaces
+   If a packages conflicts with another but is also replacing it, I should not consider it a
+   really conflicts
+Index: trunk/libopkg/pkg_depends.h
+===================================================================
+--- trunk.orig/libopkg/pkg_depends.h	2010-12-22 16:04:43.000000000 +0000
++++ trunk/libopkg/pkg_depends.h	2011-12-15 15:58:41.838334788 +0000
+@@ -82,6 +82,7 @@
+ void buildDependedUponBy(pkg_t * pkg, abstract_pkg_t * ab_pkg);
+ int version_constraints_satisfied(depend_t * depends, pkg_t * pkg);
+ int pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *depends, char *** unresolved);
++pkg_vec_t * pkg_hash_fetch_satisfied_dependencies(pkg_t * pkg);
+ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
+ int pkg_dependence_satisfiable(depend_t *depend);
+ int pkg_dependence_satisfied(depend_t *depend);
diff --git a/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch b/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch
new file mode 100644
index 0000000..b197f6b
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch
@@ -0,0 +1,57 @@
+When we have an offline root and have specified force-postinstall, 
+attempt to run the postinstall but if it fails, just leave it in the
+status file as neeing to run. We can issue a NOTICE this is happened
+but supress errors. This means the OE class doesn't have to do any
+further post processing of the postinstalls itself.
+
+Upstream-Status: Pending
+
+RP 2011/12/15
+
+
+Index: trunk/libopkg/pkg.c
+===================================================================
+--- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
++++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
+@@ -1297,8 +1297,9 @@
+      free(cmd);
+ 
+      if (err) {
+-	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
+-               pkg->name, script, err);
++          if (!conf->offline_root)
++	       opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
++                    pkg->name, script, err);
+ 	  return err;
+      }
+ 
+Index: trunk/libopkg/opkg_cmd.c
+===================================================================
+--- trunk.orig/libopkg/opkg_cmd.c	2011-12-15 19:49:25.826014150 +0000
++++ trunk/libopkg/opkg_cmd.c	2011-12-15 19:50:52.346012148 +0000
+@@ -453,7 +453,8 @@
+ 		    pkg->state_flag &= ~SF_PREFER;
+ 		    opkg_state_changed++;
+ 	       } else {
+-		    err = -1;
++                    if (!conf->offline_root)
++		         err = -1;
+ 	       }
+ 	  }
+      }
+Index: trunk/libopkg/opkg_configure.c
+===================================================================
+--- trunk.orig/libopkg/opkg_configure.c	2011-12-15 19:50:11.586013081 +0000
++++ trunk/libopkg/opkg_configure.c	2011-12-15 19:52:15.082010347 +0000
+@@ -35,7 +35,10 @@
+ 
+     err = pkg_run_script(pkg, "postinst", "configure");
+     if (err) {
+-	opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
++        if (!conf->offline_root)
++	     opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
++        else
++	     opkg_msg(NOTICE, "%s.postinst returned %d, marking as unpacked only, configuration required on target.\n", pkg->name, err);
+ 	return err;
+     }
+ 
diff --git a/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch b/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
new file mode 100644
index 0000000..a67f389
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
@@ -0,0 +1,20 @@
+OE uses D as the offline install directory in its scripts, not PKG_ROOT.
+
+Upstream-Status: Inappropriate [OE specific usage]
+
+RP 2011/12/15
+
+Index: trunk/libopkg/pkg.c
+===================================================================
+--- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
++++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
+@@ -1280,7 +1280,7 @@
+ 
+      opkg_msg(INFO, "Running script %s.\n", path);
+ 
+-     setenv("PKG_ROOT",
++     setenv("D",
+ 	    pkg->dest ? pkg->dest->root_dir : conf->default_dest->root_dir, 1);
+ 
+      if (! file_exists(path)) {
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index acb21f2..2645d52 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -12,13 +12,16 @@ RREPLACES_${PN} = "opkg-nogpg"
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
            file://add_uname_support.patch \
+           file://fix_installorder.patch \
+           file://offline_postinstall.patch\
+           file://offlineroot_varname.patch \
 "
 
 S = "${WORKDIR}/trunk"
 
-SRCREV = "625"
+SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r4"
+PR = "r2"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 



