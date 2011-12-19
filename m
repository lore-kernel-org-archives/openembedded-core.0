Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RcYJk-0007Or-6L
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 09:11:28 +0100
Received: by eeit10 with SMTP id t10so1400816eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 00:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6TyIeNPgBGBnkSGNeAvta6zXGWsLrhLf0xlzoDuOog0=;
	b=km7OBZ4khKSOllL8pXIVj9M55ah404y66MYcHLgphxsaXKDohBlxHCgdYgLYQyaxvz
	FzhsdukL6Jyr6mC25nWUfrIdr53jiEB23NmsuI2xXjexZ/3TgitgSLbmnIlFQG6FyEdt
	3wueVZal4REQMV2Hq6yp8jmVLFwNOZWYfug40=
Received: by 10.14.39.140 with SMTP id d12mr3686183eeb.54.1324281866010;
	Mon, 19 Dec 2011 00:04:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm41571249eeb.3.2011.12.19.00.04.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 00:04:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 09:04:17 +0100
Message-Id: <1324281857-5159-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <20111219055401.GO3997@jama.jama.net>
References: <20111219055401.GO3997@jama.jama.net>
Subject: [PATCH] opkg: add patch to make sure that D is empty when executing postinst scripts on target
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
X-List-Received-Date: Mon, 19 Dec 2011 08:11:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../opkg/opkg/offlineroot_varname.patch            |   33 +++++++++++++++-----
 meta/recipes-devtools/opkg/opkg_svn.bb             |    4 +-
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch b/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
index a67f389..73600e3 100644
--- a/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
+++ b/meta/recipes-devtools/opkg/opkg/offlineroot_varname.patch
@@ -1,20 +1,37 @@
 OE uses D as the offline install directory in its scripts, not PKG_ROOT.
+D is expected to be empty on when offline_root is not used.
 
 Upstream-Status: Inappropriate [OE specific usage]
 
 RP 2011/12/15
 
-Index: trunk/libopkg/pkg.c
-===================================================================
---- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
-+++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
-@@ -1280,7 +1280,7 @@
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff --git a/libopkg/pkg.c b/libopkg/pkg.c
+index 6ccbde2..7d16f84 100644
+--- a/libopkg/pkg.c
++++ b/libopkg/pkg.c
+@@ -1250,6 +1250,7 @@ pkg_run_script(pkg_t *pkg, const char *script, const char *args)
+      int err;
+      char *path;
+      char *cmd;
++     char *pkg_root;
+ 
+      if (conf->noaction)
+ 	     return 0;
+@@ -1280,8 +1281,13 @@ pkg_run_script(pkg_t *pkg, const char *script, const char *args)
  
       opkg_msg(INFO, "Running script %s.\n", path);
  
 -     setenv("PKG_ROOT",
-+     setenv("D",
- 	    pkg->dest ? pkg->dest->root_dir : conf->default_dest->root_dir, 1);
+-	    pkg->dest ? pkg->dest->root_dir : conf->default_dest->root_dir, 1);
++     pkg_root=pkg->dest ? pkg->dest->root_dir : conf->default_dest->root_dir;
++     setenv("PKG_ROOT", pkg_root, 1);
++     if (conf->offline_root) {
++       setenv("D", pkg_root, 1);
++     } else {
++       setenv("D", "", 1);
++     }
  
       if (! file_exists(path)) {
-
+ 	  free(path);
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index dbdfc7e..065a2cb 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -13,7 +13,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
            file://add_uname_support.patch \
            file://fix_installorder.patch \
-           file://offline_postinstall.patch\
+           file://offline_postinstall.patch \
            file://offlineroot_varname.patch \
            file://track_parents.patch \
 "
@@ -22,7 +22,7 @@ S = "${WORKDIR}/trunk"
 
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
-- 
1.7.8



