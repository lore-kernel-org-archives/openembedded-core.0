Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEO5V-0002jb-If
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:29:25 +0200
Received: by mail-bk0-f47.google.com with SMTP id i18so368943bkv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WXKfZH+pHpeUxAo9kTdGVMHtYhfLr61oy2wqAxMFHGI=;
	b=bydv2H5DBwCGrGJmOHcj68QYKgUc5/gEle98rLDFPlf2lAU56mAXqEbusQ62/mmNs1
	HJcScO6Bq/w2+h6ONru2I88WZT1LJEmAl69ACDJyfXOzF65j52vP86EmDnOQsTvczkTB
	OoeKHHl8EzIqWpbk/A2zp60vwEL8aDv8bx36eTM5GJ2DhP2kqHiNtgwwUFRFBO0VCa6v
	GYR6djPyJ6eMAVQrX1LN9WqRvp1opNwbZUWynXBrL0mOQWkkgOXqDStF4mILHoJkYuWo
	TnOWFy6h44ZGofFHY5aFbSiUERpy+0iZ01ro7nKUPR/ccHOBZKSpoCx1vwMbihNz9KH9
	O1QA==
Received: by 10.204.4.130 with SMTP id 2mr1585704bkr.37.1348075006305;
	Wed, 19 Sep 2012 10:16:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s26sm2571293bks.13.2012.09.19.10.16.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 10:16:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 19:16:29 +0200
Message-Id: <199a8c1c6b43162a26d05f57d919d81151b3c189.1348074403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348074403.git.Martin.Jansa@gmail.com>
References: <cover.1348074403.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] opkg: replace local patches with git patches submitted upstream
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 17:29:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-add-opkg_compare_versions-function.patch  | 51 ++++++++++++++
 ...e-the-uname-gname-fields-when-extracting.patch} | 30 +++++---
 ...ix-dependency-issues-for-preinst-scripts.patch} | 65 ++++++++++--------
 ...nst-script-is-not-fatal-with-conf-offlin.patch} | 75 +++++++++++---------
 ...ot-read-etc-opkg-.conf-if-f-is-specified.patch} | 11 ++-
 ...tch => 0006-detect-circular-dependencies.patch} | 79 +++++++++++++---------
 meta/recipes-devtools/opkg/opkg/add_vercmp.patch   | 36 ----------
 meta/recipes-devtools/opkg/opkg_svn.bb             | 12 ++--
 8 files changed, 210 insertions(+), 149 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
 rename meta/recipes-devtools/opkg/opkg/{add_uname_support.patch => 0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch} (71%)
 rename meta/recipes-devtools/opkg/opkg/{fix_installorder.patch => 0003-Fix-dependency-issues-for-preinst-scripts.patch} (82%)
 rename meta/recipes-devtools/opkg/opkg/{offline_postinstall.patch => 0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch} (52%)
 rename meta/recipes-devtools/opkg/opkg/{conf_override.patch => 0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch} (91%)
 rename meta/recipes-devtools/opkg/opkg/{track_parents.patch => 0006-detect-circular-dependencies.patch} (59%)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch b/meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
new file mode 100644
index 0000000..51853fa
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
@@ -0,0 +1,51 @@
+From 029cf99fd44645b5fe1b6491355c631da3096e09 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 17 Dec 2011 12:51:07 +0100
+Subject: [PATCH 1/7] add opkg_compare_versions function
+
+* not used in opkg but can be usefull, e.g. instead of
+  opkg-utils/opkg-compare-versions.c
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/opkg.c | 15 +++++++++++++++
+ libopkg/opkg.h |  2 ++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/libopkg/opkg.c b/libopkg/opkg.c
+index 92f61f4..eaea529 100644
+--- a/libopkg/opkg.c
++++ b/libopkg/opkg.c
+@@ -870,3 +870,18 @@ opkg_repository_accessibility_check(void)
+ 
+ 	return ret;
+ }
++
++int
++opkg_compare_versions (const char *ver1, const char *ver2)
++{
++  pkg_t *pkg1, *pkg2;
++
++  pkg1 = pkg_new();
++  pkg2 = pkg_new();
++
++  parse_version(pkg1, ver1);
++  parse_version(pkg2, ver2);
++
++  return pkg_compare_versions(pkg1, pkg2);
++}
++
+diff --git a/libopkg/opkg.h b/libopkg/opkg.h
+index 4fbd404..7aa86eb 100644
+--- a/libopkg/opkg.h
++++ b/libopkg/opkg.h
+@@ -58,4 +58,6 @@ pkg_t* opkg_find_package (const char *name, const char *version, const char *arc
+ 
+ int opkg_repository_accessibility_check(void);
+ 
++int opkg_compare_versions (const char *ver1, const char *ver2);
++
+ #endif /* OPKG_H */
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch b/meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch
similarity index 71%
rename from meta/recipes-devtools/opkg/opkg/add_uname_support.patch
rename to meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch
index 0f627f1..a2fb036 100644
--- a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
+++ b/meta/recipes-devtools/opkg/opkg/0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch
@@ -1,17 +1,24 @@
+From 254780ab3b0db398447150251332916598d3b9f4 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 11 Nov 2011 17:17:01 +0000
+Subject: [PATCH 2/7] Ensure we use the uname/gname fields when extracting
+ tarballs
 
-When updating packages on the target device we ideally want to match 
+When updating packages on the target device we ideally want to match
 user and group numbers from the existing file system. This patch encourages
 opkg to lookup the uname/gname fields first and only use the hardcoded
 numerical values if that fails.
 
-Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libbb/unarchive.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 47 insertions(+), 2 deletions(-)
 
-RP 11/11/11
-
-Index: trunk/libbb/unarchive.c
-===================================================================
---- trunk.orig/libbb/unarchive.c	2011-11-11 15:52:59.761674091 +0000
-+++ trunk/libbb/unarchive.c	2011-11-11 17:04:56.501574419 +0000
+diff --git a/libbb/unarchive.c b/libbb/unarchive.c
+index 5d4464f..d583767 100644
+--- a/libbb/unarchive.c
++++ b/libbb/unarchive.c
 @@ -22,10 +22,13 @@
  #include <stdio.h>
  #include <errno.h>
@@ -26,7 +33,7 @@ Index: trunk/libbb/unarchive.c
  
  #include "libbb.h"
  
-@@ -436,6 +439,42 @@
+@@ -436,6 +439,42 @@ free_header_ar(file_header_t *ar_entry)
  	free(ar_entry);
  }
  
@@ -69,7 +76,7 @@ Index: trunk/libbb/unarchive.c
  
  static file_header_t *
  get_header_tar(FILE *tar_stream)
-@@ -515,8 +554,14 @@
+@@ -515,8 +554,14 @@ get_header_tar(FILE *tar_stream)
  */
          tar_entry->mode = 07777 & strtol(tar.formated.mode, NULL, 8);
  
@@ -86,3 +93,6 @@ Index: trunk/libbb/unarchive.c
  	tar_entry->size  = strtol(tar.formated.size, NULL, 8);
  	tar_entry->mtime = strtol(tar.formated.mtime, NULL, 8);
  
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch b/meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch
similarity index 82%
rename from meta/recipes-devtools/opkg/opkg/fix_installorder.patch
rename to meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch
index 6a7e6db..2d7f8ba 100644
--- a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
+++ b/meta/recipes-devtools/opkg/opkg/0003-Fix-dependency-issues-for-preinst-scripts.patch
@@ -1,16 +1,21 @@
-There is a problem with dependency order when installing packages. The key 
-problem revolves around the satisfy_dependencies_for() function which is 
+From 6a294b6dad681b0e95aa061bc368d801d2ddc781 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 15 Dec 2011 21:08:49 +0000
+Subject: [PATCH 3/7] Fix dependency issues for preinst scripts
+
+There is a problem with dependency order when installing packages. The key
+problem revolves around the satisfy_dependencies_for() function which is
 called from opkg_install_pkg just before the installation (and preinst)
 happens.
 
 The satisfy_dependencies_for() function calls pkg_hash_fetch_unsatisfied_dependencies()
-which will only return packages which were previously not marked as 
-*going* to be installed at some point. For the purposes of 
-opkg_install_pkg() we really need to know which dependencies haven't been 
+which will only return packages which were previously not marked as
+*going* to be installed at some point. For the purposes of
+opkg_install_pkg() we really need to know which dependencies haven't been
 installed yet.
 
-This patch adds pkg_hash_fetch_satisfied_dependencies() which returns a 
-list of package dependencies. We can then directly check the status of 
+This patch adds pkg_hash_fetch_satisfied_dependencies() which returns a
+list of package dependencies. We can then directly check the status of
 these and ensure any hard dependencies (not suggestions or recommendations)
 are installed before returning.
 
@@ -21,9 +26,9 @@ A -> B,E
 E -> B
 B -> C
 
-Currently X would install A and E. When installing A the packages B, E 
+Currently X would install A and E. When installing A the packages B, E
 and C would be marked as "to install". When the package B is considered
-the second time (as a dependency of E rather than A), it would install 
+the second time (as a dependency of E rather than A), it would install
 straight away even though C was not currently installed, just marked
 as needing to be installed.
 
@@ -31,15 +36,18 @@ The patch changes the behaviour so B can't install until C really is installed.
 
 This change is required to run the postinst scripts in the correct order.
 
-Upstream-Status: Pending
-
-RP 2011/12/15
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/opkg_install.c | 21 +++++++++++++
+ libopkg/pkg_depends.c  | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ libopkg/pkg_depends.h  |  1 +
+ 3 files changed, 104 insertions(+)
 
-Index: trunk/libopkg/opkg_install.c
-===================================================================
---- trunk.orig/libopkg/opkg_install.c	2011-12-15 15:58:39.000000000 +0000
-+++ trunk/libopkg/opkg_install.c	2011-12-15 15:58:41.838334788 +0000
-@@ -76,6 +77,27 @@
+diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
+index 3925f58..1632066 100644
+--- a/libopkg/opkg_install.c
++++ b/libopkg/opkg_install.c
+@@ -76,6 +76,27 @@ satisfy_dependencies_for(pkg_t *pkg)
       }
  
       if (ndepends <= 0) {
@@ -67,11 +75,11 @@ Index: trunk/libopkg/opkg_install.c
  	  pkg_vec_free(depends);
  	  return 0;
       }
-Index: trunk/libopkg/pkg_depends.c
-===================================================================
---- trunk.orig/libopkg/pkg_depends.c	2010-12-22 16:04:43.000000000 +0000
-+++ trunk/libopkg/pkg_depends.c	2011-12-15 15:58:41.838334788 +0000
-@@ -259,6 +259,88 @@
+diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
+index 1e14d1f..36c76aa 100644
+--- a/libopkg/pkg_depends.c
++++ b/libopkg/pkg_depends.c
+@@ -259,6 +259,88 @@ pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *unsatisfied,
       return unsatisfied->len;
  }
  
@@ -160,11 +168,11 @@ Index: trunk/libopkg/pkg_depends.c
  /*checking for conflicts !in replaces
    If a packages conflicts with another but is also replacing it, I should not consider it a
    really conflicts
-Index: trunk/libopkg/pkg_depends.h
-===================================================================
---- trunk.orig/libopkg/pkg_depends.h	2010-12-22 16:04:43.000000000 +0000
-+++ trunk/libopkg/pkg_depends.h	2011-12-15 15:58:41.838334788 +0000
-@@ -82,6 +82,7 @@
+diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
+index 5d1f074..b8072e2 100644
+--- a/libopkg/pkg_depends.h
++++ b/libopkg/pkg_depends.h
+@@ -82,6 +82,7 @@ char *pkg_depend_str(pkg_t *pkg, int index);
  void buildDependedUponBy(pkg_t * pkg, abstract_pkg_t * ab_pkg);
  int version_constraints_satisfied(depend_t * depends, pkg_t * pkg);
  int pkg_hash_fetch_unsatisfied_dependencies(pkg_t * pkg, pkg_vec_t *depends, char *** unresolved);
@@ -172,3 +180,6 @@ Index: trunk/libopkg/pkg_depends.h
  pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
  int pkg_dependence_satisfiable(depend_t *depend);
  int pkg_dependence_satisfied(depend_t *depend);
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch b/meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch
similarity index 52%
rename from meta/recipes-devtools/opkg/opkg/offline_postinstall.patch
rename to meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch
index b197f6b..902fe5c 100644
--- a/meta/recipes-devtools/opkg/opkg/offline_postinstall.patch
+++ b/meta/recipes-devtools/opkg/opkg/0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch
@@ -1,35 +1,27 @@
-When we have an offline root and have specified force-postinstall, 
+From 1f709b4540e12cf7e08592aae0ad7e3e35322cab Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 15 Dec 2011 21:08:49 +0000
+Subject: [PATCH 4/7] Failed postinst script is not fatal with
+ conf->offline_root
+
+When we have an offline root and have specified force-postinstall,
 attempt to run the postinstall but if it fails, just leave it in the
-status file as neeing to run. We can issue a NOTICE this is happened
+status file as needing to run. We can issue a NOTICE this is happened
 but supress errors. This means the OE class doesn't have to do any
 further post processing of the postinstalls itself.
 
-Upstream-Status: Pending
-
-RP 2011/12/15
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/opkg_cmd.c       | 3 ++-
+ libopkg/opkg_configure.c | 5 ++++-
+ libopkg/pkg.c            | 5 +++--
+ 3 files changed, 9 insertions(+), 4 deletions(-)
 
-
-Index: trunk/libopkg/pkg.c
-===================================================================
---- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
-+++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
-@@ -1297,8 +1297,9 @@
-      free(cmd);
- 
-      if (err) {
--	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
--               pkg->name, script, err);
-+          if (!conf->offline_root)
-+	       opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n", 
-+                    pkg->name, script, err);
- 	  return err;
-      }
- 
-Index: trunk/libopkg/opkg_cmd.c
-===================================================================
---- trunk.orig/libopkg/opkg_cmd.c	2011-12-15 19:49:25.826014150 +0000
-+++ trunk/libopkg/opkg_cmd.c	2011-12-15 19:50:52.346012148 +0000
-@@ -453,7 +453,8 @@
+diff --git a/libopkg/opkg_cmd.c b/libopkg/opkg_cmd.c
+index 11e7867..36ff8eb 100644
+--- a/libopkg/opkg_cmd.c
++++ b/libopkg/opkg_cmd.c
+@@ -453,7 +453,8 @@ opkg_configure_packages(char *pkg_name)
  		    pkg->state_flag &= ~SF_PREFER;
  		    opkg_state_changed++;
  	       } else {
@@ -39,11 +31,11 @@ Index: trunk/libopkg/opkg_cmd.c
  	       }
  	  }
       }
-Index: trunk/libopkg/opkg_configure.c
-===================================================================
---- trunk.orig/libopkg/opkg_configure.c	2011-12-15 19:50:11.586013081 +0000
-+++ trunk/libopkg/opkg_configure.c	2011-12-15 19:52:15.082010347 +0000
-@@ -35,7 +35,10 @@
+diff --git a/libopkg/opkg_configure.c b/libopkg/opkg_configure.c
+index 719da5a..169828d 100644
+--- a/libopkg/opkg_configure.c
++++ b/libopkg/opkg_configure.c
+@@ -35,7 +35,10 @@ opkg_configure(pkg_t *pkg)
  
      err = pkg_run_script(pkg, "postinst", "configure");
      if (err) {
@@ -55,3 +47,22 @@ Index: trunk/libopkg/opkg_configure.c
  	return err;
      }
  
+diff --git a/libopkg/pkg.c b/libopkg/pkg.c
+index d8c3984..6ccbde2 100644
+--- a/libopkg/pkg.c
++++ b/libopkg/pkg.c
+@@ -1297,8 +1297,9 @@ pkg_run_script(pkg_t *pkg, const char *script, const char *args)
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
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg/conf_override.patch b/meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch
similarity index 91%
rename from meta/recipes-devtools/opkg/opkg/conf_override.patch
rename to meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch
index b1698d8..2d006c3 100644
--- a/meta/recipes-devtools/opkg/opkg/conf_override.patch
+++ b/meta/recipes-devtools/opkg/opkg/0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch
@@ -1,17 +1,16 @@
-From 45d0468f7f9e9be633b2819aa43ab9b6287b8e6a Mon Sep 17 00:00:00 2001
+From 541b6b7bd80dc321493e42955d93b277af0c9221 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Mon, 9 Jul 2012 11:01:15 +0100
-Subject: [PATCH] Do not read /etc/opkg/*.conf if -f is specified
+Subject: [PATCH 5/7] Do not read /etc/opkg/*.conf if -f is specified
 
 If a configuration file is specified on the command line, we should
 assume it contains all of the configuration and not try to read the
 configuration in /etc/opkg.
 
-Upstream-Status: Pending
-
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- libopkg/opkg_conf.c |   55 ++++++++++++++++++++++++++-------------------------
+ libopkg/opkg_conf.c | 55 +++++++++++++++++++++++++++--------------------------
  1 file changed, 28 insertions(+), 27 deletions(-)
 
 diff --git a/libopkg/opkg_conf.c b/libopkg/opkg_conf.c
@@ -87,5 +86,5 @@ index 4711ce7..1e65bad 100644
  	if (conf->offline_root)
  		sprintf_alloc (&lock_file, "%s/%s", conf->offline_root, OPKGLOCKFILE);
 -- 
-1.7.9.5
+1.7.12
 
diff --git a/meta/recipes-devtools/opkg/opkg/track_parents.patch b/meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch
similarity index 59%
rename from meta/recipes-devtools/opkg/opkg/track_parents.patch
rename to meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch
index ef327e3..cdf5e76 100644
--- a/meta/recipes-devtools/opkg/opkg/track_parents.patch
+++ b/meta/recipes-devtools/opkg/opkg/0006-detect-circular-dependencies.patch
@@ -1,15 +1,27 @@
-Add logic to detect circular dependencies. If we see any dependency from any
-given parent twice, ignore it the second time and print a notice message
+From f434078a342435ae8a666b599d989c30d4c6a7f5 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 18 Dec 2011 23:54:30 +0000
+Subject: [PATCH 6/7] detect circular dependencies
+
+Add logic to detect circular dependencies. If we see any dependency from
+any given parent twice, ignore it the second time and print a notice message
 that we did so.
 
-Upstream-Status: Pending
-RP 2011/12/18
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libopkg/opkg_install.c | 8 ++++++++
+ libopkg/pkg.c          | 2 ++
+ libopkg/pkg.h          | 1 +
+ libopkg/pkg_depends.c  | 3 +--
+ libopkg/pkg_depends.h  | 1 +
+ 5 files changed, 13 insertions(+), 2 deletions(-)
 
-Index: trunk/libopkg/opkg_install.c
-===================================================================
---- trunk.orig/libopkg/opkg_install.c	2011-12-18 11:15:17.320725365 +0000
-+++ trunk/libopkg/opkg_install.c	2011-12-18 12:38:54.980609225 +0000
-@@ -84,8 +84,14 @@
+diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
+index 1632066..0216914 100644
+--- a/libopkg/opkg_install.c
++++ b/libopkg/opkg_install.c
+@@ -84,8 +84,14 @@ satisfy_dependencies_for(pkg_t *pkg)
  	       /* The package was uninstalled when we started, but another
  	          dep earlier in this loop may have depended on it and pulled
  	          it in, so check first. */
@@ -24,7 +36,7 @@ Index: trunk/libopkg/opkg_install.c
  		    err = opkg_install_pkg(dep, 0);
  		    /* mark this package as having been automatically installed to
  		     * satisfy a dependency */
-@@ -115,6 +121,8 @@
+@@ -115,6 +121,8 @@ satisfy_dependencies_for(pkg_t *pkg)
  	  /* The package was uninstalled when we started, but another
  	     dep earlier in this loop may have depended on it and pulled
  	     it in, so check first. */
@@ -33,11 +45,11 @@ Index: trunk/libopkg/opkg_install.c
  	  if ((dep->state_status != SS_INSTALLED)
  	      && (dep->state_status != SS_UNPACKED)) {
                 opkg_msg(DEBUG2,"Calling opkg_install_pkg.\n");
-Index: trunk/libopkg/pkg.c
-===================================================================
---- trunk.orig/libopkg/pkg.c	2011-12-18 11:12:39.976729002 +0000
-+++ trunk/libopkg/pkg.c	2011-12-18 11:22:34.528715535 +0000
-@@ -86,6 +86,7 @@
+diff --git a/libopkg/pkg.c b/libopkg/pkg.c
+index 6ccbde2..be486ee 100644
+--- a/libopkg/pkg.c
++++ b/libopkg/pkg.c
+@@ -86,6 +86,7 @@ pkg_init(pkg_t *pkg)
       pkg->section = NULL;
       pkg->description = NULL;
       pkg->state_want = SW_UNKNOWN;
@@ -45,7 +57,7 @@ Index: trunk/libopkg/pkg.c
       pkg->state_flag = SF_OK;
       pkg->state_status = SS_NOT_INSTALLED;
       pkg->depends_str = NULL;
-@@ -191,6 +192,7 @@
+@@ -191,6 +192,7 @@ pkg_deinit(pkg_t *pkg)
  	pkg->description = NULL;
  
  	pkg->state_want = SW_UNKNOWN;
@@ -53,11 +65,11 @@ Index: trunk/libopkg/pkg.c
  	pkg->state_flag = SF_OK;
  	pkg->state_status = SS_NOT_INSTALLED;
  
-Index: trunk/libopkg/pkg.h
-===================================================================
---- trunk.orig/libopkg/pkg.h	2011-12-18 11:12:37.120728742 +0000
-+++ trunk/libopkg/pkg.h	2011-12-18 11:15:39.080725150 +0000
-@@ -129,6 +129,7 @@
+diff --git a/libopkg/pkg.h b/libopkg/pkg.h
+index 775b656..5d468cb 100644
+--- a/libopkg/pkg.h
++++ b/libopkg/pkg.h
+@@ -129,6 +129,7 @@ struct pkg
       char *description;
       char *tags;
       pkg_state_want_t state_want;
@@ -65,11 +77,11 @@ Index: trunk/libopkg/pkg.h
       pkg_state_flag_t state_flag;
       pkg_state_status_t state_status;
       char **depends_str;
-Index: trunk/libopkg/pkg_depends.c
-===================================================================
---- trunk.orig/libopkg/pkg_depends.c	2011-12-18 11:14:24.464726569 +0000
-+++ trunk/libopkg/pkg_depends.c	2011-12-18 11:30:32.516704127 +0000
-@@ -30,7 +30,6 @@
+diff --git a/libopkg/pkg_depends.c b/libopkg/pkg_depends.c
+index 36c76aa..a72eed7 100644
+--- a/libopkg/pkg_depends.c
++++ b/libopkg/pkg_depends.c
+@@ -30,7 +30,6 @@ static int parseDepends(compound_depend_t *compound_depend, char * depend_str);
  static depend_t * depend_init(void);
  static char ** add_unresolved_dep(pkg_t * pkg, char ** the_lost, int ref_ndx);
  static char ** merge_unresolved(char ** oldstuff, char ** newstuff);
@@ -77,7 +89,7 @@ Index: trunk/libopkg/pkg_depends.c
  
  static int pkg_installed_and_constraint_satisfied(pkg_t *pkg, void *cdata)
  {
-@@ -531,7 +530,7 @@
+@@ -531,7 +530,7 @@ int pkg_dependence_satisfied(depend_t *depend)
       return 0;
  }
  
@@ -86,14 +98,17 @@ Index: trunk/libopkg/pkg_depends.c
  {
      int i;
      pkg_t ** pkgs = vec->pkgs;
-Index: trunk/libopkg/pkg_depends.h
-===================================================================
---- trunk.orig/libopkg/pkg_depends.h	2011-12-18 11:28:51.960706484 +0000
-+++ trunk/libopkg/pkg_depends.h	2011-12-18 11:29:19.400705862 +0000
-@@ -87,5 +87,6 @@
+diff --git a/libopkg/pkg_depends.h b/libopkg/pkg_depends.h
+index b8072e2..ca0801f 100644
+--- a/libopkg/pkg_depends.h
++++ b/libopkg/pkg_depends.h
+@@ -87,5 +87,6 @@ pkg_vec_t * pkg_hash_fetch_conflicts(pkg_t * pkg);
  int pkg_dependence_satisfiable(depend_t *depend);
  int pkg_dependence_satisfied(depend_t *depend);
  const char* constraint_to_str(enum version_constraint c);
 +int is_pkg_in_pkg_vec(pkg_vec_t * vec, pkg_t * pkg);
  
  #endif
+-- 
+1.7.12
+
diff --git a/meta/recipes-devtools/opkg/opkg/add_vercmp.patch b/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
deleted file mode 100644
index 1203c54..0000000
--- a/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [function not used]
-
-Index: trunk/libopkg/opkg.c
-===================================================================
---- trunk.orig/libopkg/opkg.c	2010-01-26 20:32:19.000000000 +0000
-+++ trunk/libopkg/opkg.c	2010-01-26 20:40:34.000000000 +0000
-@@ -876,3 +876,18 @@
- 
- 	return ret;
- }
-+
-+int
-+opkg_compare_versions (const char *ver1, const char *ver2)
-+{
-+  pkg_t *pkg1, *pkg2;
-+
-+  pkg1 = pkg_new();
-+  pkg2 = pkg_new();
-+
-+  parse_version(pkg1, ver1);
-+  parse_version(pkg2, ver2);
-+
-+  return pkg_compare_versions(pkg1, pkg2);
-+}
-+
-Index: trunk/libopkg/opkg.h
-===================================================================
---- trunk.orig/libopkg/opkg.h	2010-01-26 20:32:19.000000000 +0000
-+++ trunk/libopkg/opkg.h	2010-01-26 20:35:19.000000000 +0000
-@@ -58,4 +58,6 @@
- 
- int opkg_repository_accessibility_check(void);
- 
-+int opkg_compare_versions (const char *ver1, const char *ver2);
-+
- #endif /* OPKG_H */
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 4146b7e..03ed103 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -1,12 +1,12 @@
 require opkg.inc
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
-           file://add_vercmp.patch \
-           file://add_uname_support.patch \
-           file://fix_installorder.patch \
-           file://offline_postinstall.patch\
-           file://track_parents.patch \
-           file://conf_override.patch \
+  file://0001-add-opkg_compare_versions-function.patch \
+  file://0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch \
+  file://0003-Fix-dependency-issues-for-preinst-scripts.patch \
+  file://0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch \
+  file://0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch \
+  file://0006-detect-circular-dependencies.patch \
 "
 
 S = "${WORKDIR}/trunk"
-- 
1.7.12



