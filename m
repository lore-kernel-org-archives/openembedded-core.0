Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RPBkj-0000Mo-V3
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 12:28:06 +0100
Received: by bkbzs2 with SMTP id zs2so4244880bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=bfYP764QLSoCuclBCrpRzrtyW8G9z92n0CjF/Jtp3qc=;
	b=Ic0W5a0l/4aoipsTDF8QmTvUhfvm/jmm2FWhlvoAYoLfU6+rAdejOSf3pKFy42C/g9
	3CLt3ogOeEbhgm+vYR7Wo7RBbAPYTp20AzKGIxJZaqI/Uzxv0ZVJOm+5mkgazwPdw0xc
	Bp/XLRXCwoBqpdgEW8ee/06EmBoaQciydxa3I=
Received: by 10.204.132.211 with SMTP id c19mr11882401bkt.94.1321096906188;
	Sat, 12 Nov 2011 03:21:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o7sm7424693bkw.16.2011.11.12.03.21.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Nov 2011 03:21:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Nov 2011 12:21:34 +0100
Message-Id: <1321096894-23997-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <20111112111425.GA30296@jama.jama.net>
References: <20111112111425.GA30296@jama.jama.net>
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
X-List-Received-Date: Sat, 12 Nov 2011 11:28:06 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When extracting packages onto the target system in particular, we really
want to ensure the name fields in the tarball are used over and above
the numerical uid/gid values. This patch adds this functionality to opkg
and ensures package upgrades work correctly permission wise

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../opkg/opkg/add_uname_support.patch              |   85 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 2 files changed, 87 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/add_uname_support.patch

diff --git a/meta/recipes-devtools/opkg/opkg/add_uname_support.patch b/meta/recipes-devtools/opkg/opkg/add_uname_support.patch
new file mode 100644
index 0000000..885f75f
--- /dev/null
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
1.7.8.rc1



