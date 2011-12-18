Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RcQfj-0007mo-CR for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 01:01:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBINsbZL008556;
	Sun, 18 Dec 2011 23:54:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06963-06; Sun, 18 Dec 2011 23:54:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBINsTj8008550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 18 Dec 2011 23:54:30 GMT
Message-ID: <1324252470.4568.156.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Dec 2011 23:54:30 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "graham.gower" <graham.gower@gmail.com>
Subject: [PATCH] opkg: Add logic to detect and creak circular dependencies
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
X-List-Received-Date: Mon, 19 Dec 2011 00:01:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This addresses some of the concerns about the previous opkg changes
allowing it to break out of circular dependency loops with just a notice
in the logs rather than effectively going OOM.
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/opkg/opkg/track_parents.patch b/meta/recipes-devtools/opkg/opkg/track_parents.patch
new file mode 100644
index 0000000..1f54256
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/track_parents.patch
@@ -0,0 +1,99 @@
+Add logic to detect circular dependencies. If we see any dependency from any
+given parent twice, ignore it the second time and print a notice message
+that we did so.
+
+Upstream-Status: Pending
+RP 2011/12/18
+
+Index: trunk/libopkg/opkg_install.c
+===================================================================
+--- trunk.orig/libopkg/opkg_install.c	2011-12-18 11:15:17.320725365 +0000
++++ trunk/libopkg/opkg_install.c	2011-12-18 12:38:54.980609225 +0000
+@@ -84,8 +84,14 @@
+ 	       /* The package was uninstalled when we started, but another
+ 	          dep earlier in this loop may have depended on it and pulled
+ 	          it in, so check first. */
++               if (is_pkg_in_pkg_vec(dep->wanted_by, pkg)) {
++		    opkg_msg(NOTICE,"Breaking cicular dependency on %s for %s.\n", pkg->name, dep->name);
++	            continue;
++               }
+ 	       if ((dep->state_status != SS_INSTALLED) && (dep->state_status != SS_UNPACKED)) {
+ 		    opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
++                    if (!is_pkg_in_pkg_vec(dep->wanted_by, pkg))
++     	                 pkg_vec_insert(dep->wanted_by, pkg);
+ 		    err = opkg_install_pkg(dep, 0);
+ 		    /* mark this package as having been automatically installed to
+ 		     * satisfy a dependancy */
+@@ -115,6 +121,8 @@
+ 	  /* The package was uninstalled when we started, but another
+ 	     dep earlier in this loop may have depended on it and pulled
+ 	     it in, so check first. */
++          if (!is_pkg_in_pkg_vec(dep->wanted_by, pkg))
++	       pkg_vec_insert(dep->wanted_by, pkg);
+ 	  if ((dep->state_status != SS_INSTALLED)
+ 	      && (dep->state_status != SS_UNPACKED)) {
+                opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
+Index: trunk/libopkg/pkg.c
+===================================================================
+--- trunk.orig/libopkg/pkg.c	2011-12-18 11:12:39.976729002 +0000
++++ trunk/libopkg/pkg.c	2011-12-18 11:22:34.528715535 +0000
+@@ -86,6 +86,7 @@
+      pkg->section = NULL;
+      pkg->description = NULL;
+      pkg->state_want = SW_UNKNOWN;
++     pkg->wanted_by = pkg_vec_alloc();
+      pkg->state_flag = SF_OK;
+      pkg->state_status = SS_NOT_INSTALLED;
+      pkg->depends_str = NULL;
+@@ -191,6 +192,7 @@
+ 	pkg->description = NULL;
+ 
+ 	pkg->state_want = SW_UNKNOWN;
++	pkg_vec_free(pkg->wanted_by);
+ 	pkg->state_flag = SF_OK;
+ 	pkg->state_status = SS_NOT_INSTALLED;
+ 
+Index: trunk/libopkg/pkg.h
+===================================================================
+--- trunk.orig/libopkg/pkg.h	2011-12-18 11:12:37.120728742 +0000
++++ trunk/libopkg/pkg.h	2011-12-18 11:15:39.080725150 +0000
+@@ -129,6 +129,7 @@
+      char *description;
+      char *tags;
+      pkg_state_want_t state_want;
++     pkg_vec_t *wanted_by;
+      pkg_state_flag_t state_flag;
+      pkg_state_status_t state_status;
+      char **depends_str;
+Index: trunk/libopkg/pkg_depends.c
+===================================================================
+--- trunk.orig/libopkg/pkg_depends.c	2011-12-18 11:14:24.464726569 +0000
++++ trunk/libopkg/pkg_depends.c	2011-12-18 11:30:32.516704127 +0000
+@@ -30,7 +30,6 @@
+ static depend_t * depend_init(void);
+ static char ** add_unresolved_dep(pkg_t * pkg, char ** the_lost, int ref_ndx);
+ static char ** merge_unresolved(char ** oldstuff, char ** newstuff);
+-static int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
+ 
+ static int pkg_installed_and_constraint_satisfied(pkg_t *pkg, void *cdata)
+ {
+@@ -531,7 +530,7 @@
+      return 0;
+ }
+ 
+-static int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg)
++int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg)
+ {
+     int i;
+     pkg_t ** pkgs = vec->pkgs;
+Index: trunk/libopkg/pkg_depends.h
+===================================================================
+--- trunk.orig/libopkg/pkg_depends.h	2011-12-18 11:28:51.960706484 +0000
++++ trunk/libopkg/pkg_depends.h	2011-12-18 11:29:19.400705862 +0000
+@@ -87,5 +87,6 @@
+ int pkg_dependence_satisfiable(depend_t *depend);
+ int pkg_dependence_satisfied(depend_t *depend);
+ const char* constraint_to_str(enum version_constraint c);
++int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
+ 
+ #endif
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 2645d52..dbdfc7e 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -15,13 +15,14 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://fix_installorder.patch \
            file://offline_postinstall.patch\
            file://offlineroot_varname.patch \
+           file://track_parents.patch \
 "
 
 S = "${WORKDIR}/trunk"
 
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 



