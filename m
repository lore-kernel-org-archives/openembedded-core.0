Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROvGb-00027w-25 for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 18:51:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pABHjZL3018184
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 17:45:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17697-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 17:45:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pABHjPBY018178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 17:45:26 GMT
Message-ID: <1321033528.26881.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Nov 2011 17:45:28 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] opkg: Ensure we use the uname/gname fields when extracting tarballs
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
X-List-Received-Date: Fri, 11 Nov 2011 17:51:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When extracting packages onto the target system in particular, we really
want to ensure the name fields in the tarball are used over and above
the numerical uid/gid values. This patch adds this functionality to opkg
and ensures package upgrades work correctly permission wise

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

---
diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
new file mode 100644
index 0000000..885f75f
--- a/dev/null
+++ b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
@@ -0,0 +1,85 @@
+When updating packages on the target device we ideally want to match 
+user and group numbers from the existing file system. This patch encourages
+opkg to lookup the uname/gname fields first and only use the hardcoded
+numerical values if that fails.
+
+RP 11/11/11
+
+Index: trunk/libbb/unarchive.c
+===================================================================
+--- trunk.orig/libbb/unarchive.c	2011-11-11 15:52:59.761674091 +0000
++++ trunk/libbb/unarchive.c	2011-11-11 17:04:56.501574419 +0000
+@@ -22,10 +22,13 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
++#include <stdbool.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <utime.h>
+ #include <libgen.h>
++#include <grp.h>
++#include <pwd.h>
+ 
+ #include "libbb.h"
+ 
+@@ -436,6 +439,42 @@
+ 	free(ar_entry);
+ }
+ 
++static char uname_cache[32] = "";
++static uid_t uid_cache;
++
++static bool update_unamecache(char *uname) {
++	struct passwd *passwd;
++	if (!uname)
++		return FALSE;
++	if (!uname_cache[0] && strcmp(uname_cache, uname) == 0)
++		return TRUE;
++	passwd = getpwnam(uname);
++	if (passwd) {
++		uid_cache = passwd->pw_uid;
++		strncpy(uname, uname_cache, 32);
++		return TRUE;
++	}
++	return FALSE;
++}
++
++static char gname_cache[32] = "";
++static gid_t gid_cache;
++
++static bool update_gnamecache(char *gname) {
++	struct group *group;
++	if (!gname)
++		return FALSE;
++	if (!gname_cache[0] && strcmp(gname_cache, gname) == 0)
++		return TRUE;
++	group = getgrnam(gname);
++	if (group) {
++		gid_cache = group->gr_gid;
++		strncpy(gname, gname_cache, 32);
++		return TRUE;
++	}
++	return FALSE;
++}
++
+ 
+ static file_header_t *
+ get_header_tar(FILE *tar_stream)
+@@ -515,8 +554,14 @@
+ */
+         tar_entry->mode = 07777 & strtol(tar.formated.mode, NULL, 8);
+ 
+-	tar_entry->uid   = strtol(tar.formated.uid, NULL, 8);
+-	tar_entry->gid   = strtol(tar.formated.gid, NULL, 8);
++	if (update_unamecache(tar.formated.uname))
++		tar_entry->uid = uid_cache;
++	else
++		tar_entry->uid = strtol(tar.formated.uid, NULL, 8);
++	if (update_gnamecache(tar.formated.gname))
++		tar_entry->gid = gid_cache;
++	else
++		tar_entry->gid = strtol(tar.formated.gid, NULL, 8);
+ 	tar_entry->size  = strtol(tar.formated.size, NULL, 8);
+ 	tar_entry->mtime = strtol(tar.formated.mtime, NULL, 8);
+ 
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 099a373..8f50f67 10From a781e059562e91c6467be7c4aac43561413b3703 Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 11 Nov 2011 17:17:01 +0000
Subject: opkg: Ensure we use the uname/gname fields when extracting tarballs

---
diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
new file mode 100644
index 0000000..885f75f
--- a/dev/null
+++ b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
@@ -0,0 +1,85 @@
+When updating packages on the target device we ideally want to match 
+user and group numbers from the existing file system. This patch encourages
+opkg to lookup the uname/gname fields first and only use the hardcoded
+numerical values if that fails.
+
+RP 11/11/11
+
+Index: trunk/libbb/unarchive.c
+===================================================================
+--- trunk.orig/libbb/unarchive.c	2011-11-11 15:52:59.761674091 +0000
++++ trunk/libbb/unarchive.c	2011-11-11 17:04:56.501574419 +0000
+@@ -22,10 +22,13 @@
+ #include <stdio.h>
+ #include <errno.h>
+ #include <stdlib.h>
++#include <stdbool.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <utime.h>
+ #include <libgen.h>
++#include <grp.h>
++#include <pwd.h>
+ 
+ #include "libbb.h"
+ 
+@@ -436,6 +439,42 @@
+ 	free(ar_entry);
+ }
+ 
++static char uname_cache[32] = "";
++static uid_t uid_cache;
++
++static bool update_unamecache(char *uname) {
++	struct passwd *passwd;
++	if (!uname)
++		return FALSE;
++	if (!uname_cache[0] && strcmp(uname_cache, uname) == 0)
++		return TRUE;
++	passwd = getpwnam(uname);
++	if (passwd) {
++		uid_cache = passwd->pw_uid;
++		strncpy(uname, uname_cache, 32);
++		return TRUE;
++	}
++	return FALSE;
++}
++
++static char gname_cache[32] = "";
++static gid_t gid_cache;
++
++static bool update_gnamecache(char *gname) {
++	struct group *group;
++	if (!gname)
++		return FALSE;
++	if (!gname_cache[0] && strcmp(gname_cache, gname) == 0)
++		return TRUE;
++	group = getgrnam(gname);
++	if (group) {
++		gid_cache = group->gr_gid;
++		strncpy(gname, gname_cache, 32);
++		return TRUE;
++	}
++	return FALSE;
++}
++
+ 
+ static file_header_t *
+ get_header_tar(FILE *tar_stream)
+@@ -515,8 +554,14 @@
+ */
+         tar_entry->mode = 07777 & strtol(tar.formated.mode, NULL, 8);
+ 
+-	tar_entry->uid   = strtol(tar.formated.uid, NULL, 8);
+-	tar_entry->gid   = strtol(tar.formated.gid, NULL, 8);
++	if (update_unamecache(tar.formated.uname))
++		tar_entry->uid = uid_cache;
++	else
++		tar_entry->uid = strtol(tar.formated.uid, NULL, 8);
++	if (update_gnamecache(tar.formated.gname))
++		tar_entry->gid = gid_cache;
++	else
++		tar_entry->gid = strtol(tar.formated.gid, NULL, 8);
+ 	tar_entry->size  = strtol(tar.formated.size, NULL, 8);
+ 	tar_entry->mtime = strtol(tar.formated.mtime, NULL, 8);
+ 
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 099a373..8f50f67 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -11,13 +11,14 @@ RREPLACES_${PN} = "opkg-nogpg"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
+           file://add_uname_support.patch \
 "
 
 S = "${WORKDIR}/trunk"
 
 SRCREV = "625"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
--
cgit 0.9.0.1
0644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -11,13 +11,14 @@ RREPLACES_${PN} = "opkg-nogpg"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://add_vercmp.patch \
+           file://add_uname_support.patch \
 "
 
 S = "${WORKDIR}/trunk"
 
 SRCREV = "625"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 





