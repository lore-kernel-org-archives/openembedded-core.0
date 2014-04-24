Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id E557465D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 21:56:24 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2302285eei.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VO1pfd7H5QCEY5FeaL88XrwWB+XabEz9v4memnTMY/0=;
	b=BMDUUABxWqowokWiwrZmeky86aFz44g0wsjgDAa1/LT5PytacMG8F1D/q6IJTnRhzr
	I704s7eIL6BgW9vu1w4SJ9Xe8wTCwp6hxqSb/A0+1/GgWbha5FkG6bnbDCFHbVPwpL24
	1fRfyHR+HDgdFb9F+uw1tANlNt6wuDpe36jP+4gdnAnNDt9mht7IQCnlJvI9c6GXC4DV
	RHB8KtWuh5c+ZLMJIL2UAktlKljgiPeUSfOgxVjq/HhW3bh3hmkyZQgSFkRl0SCwgh1R
	Ml+q8KHq0uRzcivI0R/yuZPPKQYE2cts6ppKW6XzaSUd9dQF9hcmGjT+fUQjFAnsMH2Z
	BA3g==
X-Received: by 10.15.24.201 with SMTP id j49mr29164eeu.99.1398376584918;
	Thu, 24 Apr 2014 14:56:24 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	e42sm19399584eev.32.2014.04.24.14.56.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Apr 2014 14:56:24 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 21:56:14 +0000
Message-Id: <1398376574-24241-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] opkg: Upgrade to v0.2.2
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
X-List-Received-Date: Thu, 24 Apr 2014 21:56:32 -0000

The patches for opkg have been rebased using git so that they apply cleanly onto
the new release.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  | 64 +++++++++++++---------
 .../opkg/opkg/no-install-recommends.patch          | 53 +++++++++++-------
 .../opkg/{opkg_0.2.1.bb => opkg_0.2.2.bb}          |  4 +-
 3 files changed, 74 insertions(+), 47 deletions(-)
 rename meta/recipes-devtools/opkg/{opkg_0.2.1.bb => opkg_0.2.2.bb} (65%)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index 8d328d5..cf95ee2 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -1,3 +1,8 @@
+From 45a1e33a048f479b15b99d09df3dd1b62fef0253 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Fri, 28 Mar 2014 15:20:22 +0000
+Subject: [PATCH 2/2] opkg-0.2.x: add-exclude
+
 Add a way to exclude specific packages from the install
 
 When an excluded package is required by another package an error
@@ -11,11 +16,17 @@ Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ libopkg/opkg_conf.c   |  1 +
+ libopkg/opkg_conf.h   |  2 ++
+ libopkg/pkg_depends.c | 16 ++++++++++++++++
+ src/opkg-cl.c         | 15 +++++++++++++++
+ 4 files changed, 34 insertions(+)
 
-Index: trunk/libopkg/opkg_conf.c
-===================================================================
---- trunk.orig/libopkg/opkg_conf.c
-+++ trunk/libopkg/opkg_conf.c
+diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
+index 1e65bad..9c4c854 100644
+--- a/libopkg/opkg_conf.c
++++ b/libopkg/opkg_conf.c
 @@ -442,6 +442,7 @@ opkg_conf_init(void)
  	pkg_dest_list_init(&conf->pkg_dest_list);
  	pkg_dest_list_init(&conf->tmp_dest_list);
@@ -24,11 +35,11 @@ Index: trunk/libopkg/opkg_conf.c
  
  	return 0;
  }
-Index: trunk/libopkg/opkg_conf.h
-===================================================================
---- trunk.orig/libopkg/opkg_conf.h
-+++ trunk/libopkg/opkg_conf.h
-@@ -49,6 +49,8 @@ struct opkg_conf
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
+index 6045a58..ad58849 100644
+--- a/libopkg/opkg_conf.h
++++ b/libopkg/opkg_conf.h
+@@ -51,6 +51,8 @@ struct opkg_conf
       pkg_dest_list_t pkg_dest_list;
       pkg_dest_list_t tmp_dest_list;
       nv_pair_list_t arch_list;
@@ -37,11 +48,11 @@ Index: trunk/libopkg/opkg_conf.h
  
       int restrict_to_default_dest;
       pkg_dest_t *default_dest;
-Index: trunk/libopkg/pkg_depends.c
-===================================================================
---- trunk.orig/libopkg/pkg_depends.c
-+++ trunk/libopkg/pkg_depends.c
-@@ -212,6 +212,22 @@ pkg_hash_fetch_unsatisfied_dependencies(
+diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
+index d2d279e..b572e18 100644
+--- a/libopkg/pkg_depends.c
++++ b/libopkg/pkg_depends.c
+@@ -212,6 +212,22 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
  			 continue;
  		    }
  
@@ -64,10 +75,10 @@ Index: trunk/libopkg/pkg_depends.c
  		    opkg_msg(DEBUG, "satisfying_pkg=%p\n", satisfying_pkg);
  		    if (satisfying_pkg != NULL) {
  			 satisfier_entry_pkg = satisfying_pkg;
-Index: trunk/src/opkg-cl.c
-===================================================================
---- trunk.orig/src/opkg-cl.c
-+++ trunk/src/opkg-cl.c
+diff --git a/src/opkg-cl.c b/src/opkg-cl.c
+index 0315d41..0db2794 100644
+--- a/src/opkg-cl.c
++++ b/src/opkg-cl.c
 @@ -45,6 +45,7 @@ enum {
  	ARGS_OPT_PREFER_ARCH_TO_VERSION,
  	ARGS_OPT_ADD_ARCH,
@@ -104,10 +115,13 @@ Index: trunk/src/opkg-cl.c
  			conf->noaction = 1;
  			break;
 @@ -282,6 +296,7 @@ usage()
- 	printf("\t--offline-root <dir>	offline installation of packages.\n");
- 	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
- 	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
-+	printf("\t--add-exclude <name>		Register package to be excluded from install\n");
- 	printf("\t--prefer-arch-to-version\t 	Use the architecture priority package rather\n");
- 	printf("\t				than the higher version one if more\n");
- 	printf("\t				than one candidate is found.\n");
+ 	printf("\t--offline-root <dir>            offline installation of packages.\n");
+ 	printf("\t--add-arch <arch>:<prio>        Register architecture with given priority\n");
+ 	printf("\t--add-dest <name>:<path>        Register destination with given path\n");
++	printf("\t--add-exclude <name>		  Register package to be excluded from install\n");
+ 	printf("\t--prefer-arch-to-version        Use the architecture priority package rather\n");
+ 	printf("\t                                than the higher version one if more\n");
+ 	printf("\t                                than one candidate is found.\n");
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
index 6d1ccec..bcca56c 100644
--- a/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
+++ b/meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
@@ -1,14 +1,24 @@
+From 610207c9bc82f20c77d6f234465e36857c997ea0 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Fri, 28 Mar 2014 15:19:08 +0000
+Subject: [PATCH 1/2] opkg-0.2.x: no-install-recommends
+
 Add the ability to not install ANY recommended packages.
 
 Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ libopkg/opkg_conf.h   | 1 +
+ libopkg/pkg_depends.c | 3 ++-
+ src/opkg-cl.c         | 7 +++++++
+ 3 files changed, 10 insertions(+), 1 deletion(-)
 
-Index: trunk/libopkg/opkg_conf.h
-===================================================================
---- trunk.orig/libopkg/opkg_conf.h
-+++ trunk/libopkg/opkg_conf.h
-@@ -80,6 +80,7 @@ struct opkg_conf
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
+index 38fa375..6045a58 100644
+--- a/libopkg/opkg_conf.h
++++ b/libopkg/opkg_conf.h
+@@ -82,6 +82,7 @@ struct opkg_conf
       int prefer_arch_to_version;
       int check_signature;
       int nodeps; /* do not follow dependencies */
@@ -16,10 +26,10 @@ Index: trunk/libopkg/opkg_conf.h
       char *offline_root;
       char *overlay_root;
       int query_all;
-Index: trunk/libopkg/pkg_depends.c
-===================================================================
---- trunk.orig/libopkg/pkg_depends.c
-+++ trunk/libopkg/pkg_depends.c
+diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
+index a4df7de..d2d279e 100644
+--- a/libopkg/pkg_depends.c
++++ b/libopkg/pkg_depends.c
 @@ -19,6 +19,7 @@
  #include <ctype.h>
  
@@ -28,7 +38,7 @@ Index: trunk/libopkg/pkg_depends.c
  #include "opkg_utils.h"
  #include "pkg_hash.h"
  #include "opkg_message.h"
-@@ -204,7 +205,7 @@ pkg_hash_fetch_unsatisfied_dependencies(
+@@ -204,7 +205,7 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
  		    /* user request overrides package recommendation */
  		    if (satisfying_pkg != NULL
  			&& (compound_depend->type == RECOMMEND || compound_depend->type == SUGGEST)
@@ -37,10 +47,10 @@ Index: trunk/libopkg/pkg_depends.c
  			 opkg_msg(NOTICE, "%s: ignoring recommendation for "
  					"%s at user request\n",
  					pkg->name, satisfying_pkg->name);
-Index: trunk/src/opkg-cl.c
-===================================================================
---- trunk.orig/src/opkg-cl.c
-+++ trunk/src/opkg-cl.c
+diff --git a/src/opkg-cl.c b/src/opkg-cl.c
+index b711511..0315d41 100644
+--- a/src/opkg-cl.c
++++ b/src/opkg-cl.c
 @@ -50,6 +50,7 @@ enum {
  	ARGS_OPT_NODEPS,
  	ARGS_OPT_AUTOREMOVE,
@@ -68,11 +78,14 @@ Index: trunk/src/opkg-cl.c
  			conf->download_only = 1;
  			break;
 @@ -293,6 +298,8 @@ usage()
- 	printf("\t--noaction		No action -- test only\n");
- 	printf("\t--download-only	No action -- download only\n");
- 	printf("\t--nodeps		Do not follow dependencies\n");
+ 	printf("\t--noaction                      No action -- test only\n");
+ 	printf("\t--download-only                 No action -- download only\n");
+ 	printf("\t--nodeps                        Do not follow dependencies\n");
 +	printf("\t--no-install-recommends\n");
-+	printf("\t                      Do not install any recommended packages\n");
++	printf("\t                                Do not install any recommended packages\n");
  	printf("\t--force-removal-of-dependent-packages\n");
- 	printf("\t			Remove package and all dependencies\n");
- 	printf("\t--autoremove		Remove packages that were installed\n");
+ 	printf("\t                                Remove package and all dependencies\n");
+ 	printf("\t--autoremove                    Remove packages that were installed\n");
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.1.bb b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
similarity index 65%
rename from meta/recipes-devtools/opkg/opkg_0.2.1.bb
rename to meta/recipes-devtools/opkg/opkg_0.2.2.bb
index 09c0cca..3dd7489 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
@@ -8,5 +8,5 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-SRC_URI[md5sum] = "1881d170b9dfbd7ecf0aa468cb9779c0"
-SRC_URI[sha256sum] = "43c2d95e4cd3ef5e341e233e63de78698ec7522bca446972963160bb0f1e62db"
+SRC_URI[md5sum] = "b3ecef90d67d2aed2a14c2116a027482"
+SRC_URI[sha256sum] = "aa554ce7538544aac4f69e8274a0f9b8b433b8c3b1d00704bd393f713303a12b"
-- 
1.9.2


