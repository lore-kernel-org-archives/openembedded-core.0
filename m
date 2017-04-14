Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E894C77E55
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:10:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3E9AGPQ020861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 14 Apr 2017 10:10:17 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cyxFA-0001Ch-Bh; Fri, 14 Apr 2017 10:10:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 10:10:15 +0100
Message-Id: <1492161015-4589-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 14 Apr 2017 10:10:17 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] pseudo: Backport two upstream fixes
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
X-List-Received-Date: Fri, 14 Apr 2017 09:10:19 -0000

Backport fixes from pseudo master for an acl issue and more importantly, a segfault
issue with bash which can be triggered by the recent useradd changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../b6b68db896f9963558334aff7fca61adde4ec10f.patch | 48 +++++++++++
 .../efe0be279901006f939cd357ccee47b651c786da.patch | 99 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  2 +
 3 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch

diff --git a/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch b/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
new file mode 100644
index 0000000..3045a3b
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
@@ -0,0 +1,48 @@
+From b6b68db896f9963558334aff7fca61adde4ec10f Mon Sep 17 00:00:00 2001
+From: Seebs <seebs@seebs.net>
+Date: Thu, 13 Apr 2017 18:12:01 -0500
+Subject: Prevent bash from segfaulting when unloading pseudo
+
+bash's extremely fancy internal awareness of how the environment looks
+means that, if you directly call the underlying libc "unsetenv" on
+a variable, bash can end up trying to access a null pointer. Fixing
+this generically is actually rather hard; you can't really avoid
+writing to environ on fork() or popen(), even if you change all
+execv*() functions to use the execv*e() variants. So for now, instead
+of unsetting the variable, set it to an empty string.
+
+Thanks to Saur in IRC for spotting this and helping debug it.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+Upstream-Status: Backport
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index a2d30e9..8ba1ffa 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,8 @@
++2017-04-13:
++	* (seebs) don't unset LD_PRELOAD or the like, because if you
++	  do that, bash can segfault because it "knows" how many
++	  fields are in environ.
++
+ 2017-02-24:
+ 	* (seebs) import posix_acl_default fix from Anton Gerasimov
+ 	  <anton@advancedtelematic.com>
+diff --git a/pseudo_util.c b/pseudo_util.c
+index 172990b..6a1fac2 100644
+--- a/pseudo_util.c
++++ b/pseudo_util.c
+@@ -844,7 +844,7 @@ void pseudo_dropenv() {
+ 		if (ld_preload && strlen(ld_preload)) {
+ 			SETENV(PRELINK_LIBRARIES, ld_preload, 1);
+ 		} else {
+-			UNSETENV(PRELINK_LIBRARIES);
++			SETENV(PRELINK_LIBRARIES, "", 1);
+ 		}
+ 	}
+ }
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch b/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch
new file mode 100644
index 0000000..64fc58c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch
@@ -0,0 +1,99 @@
+From efe0be279901006f939cd357ccee47b651c786da Mon Sep 17 00:00:00 2001
+From: Seebs <seebs@seebs.net>
+Date: Fri, 24 Feb 2017 12:47:38 -0600
+Subject: Don't try to record 0-length posix_acl_default xattrs
+
+Based on a submission from Anton Gerasimov <anton@advancedtelematic.com>
+
+On some systems, with some kernel configs, "cp -a" apparently tries to
+set an empty ACL list, with a valid header but no contents, which causes
+strange and mysterious behavior later if we actually create such an entry.
+So filter that out, also sanity-check a couple of other things.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+Upstream-Status: Backport
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index ae2a6e9..a2d30e9 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,6 @@
++2017-02-24:
++	* (seebs) import posix_acl_default fix from Anton Gerasimov
++	  <anton@advancedtelematic.com>
+ 2017-02-01:
+    * (seebs) handle xattr deletion slightly more carefully.
+    * (seebs) tag this as 1.8.2
+diff --git a/ports/linux/xattr/pseudo_wrappers.c b/ports/linux/xattr/pseudo_wrappers.c
+index 46bc053..d69d53e 100644
+--- a/ports/linux/xattr/pseudo_wrappers.c
++++ b/ports/linux/xattr/pseudo_wrappers.c
+@@ -62,9 +62,9 @@ static int
+ posix_permissions(const acl_header *header, int entries, int *extra, int *mode) {
+ 	int acl_seen = 0;
+ 	if (le32(header->version) != 2) {
+-		pseudo_diag("Fatal: ACL support no available for header version %d.\n",
++		pseudo_diag("Fatal: ACL support not available for header version %d.\n",
+ 			le32(header->version));
+-		return 1;
++		return -1;
+ 	}
+ 	*mode = 0;
+ 	*extra = 0;
+@@ -140,12 +140,38 @@ static int shared_setxattr(const char *path, int fd, const char *name, const voi
+ 	pseudo_debug(PDBGF_XATTR, "setxattr(%s [fd %d], %s => '%.*s')\n",
+ 		path ? path : "<no path>", fd, name, (int) size, (char *) value);
+ 
++	/* Filter out erroneous sizes for POSIX ACL
++	 *  see posix_acl_xattr_count in include/linux/posix_acl_xattr.h of Linux source code */
++	/* I don't think there's any posix_acl_* values that aren't in this format */
++	if (!strncmp(name, "system.posix_acl_", 17)) {
++		// ACL is corrupt, issue an error
++		if(size < sizeof(acl_header) || (size - sizeof(acl_header)) % sizeof(acl_entry) != 0) {
++			pseudo_debug(PDBGF_XATTR, "invalid data size for %s: %d\n",
++				name, (int) size);
++			errno = EINVAL;
++			return -1;
++		}
++
++		// ACL is empty, do nothing
++		if((size - sizeof(acl_header)) / sizeof(acl_entry) == 0) {
++			/* on some systems, "cp -a" will attempt to clone the
++			 * posix_acl_default entry for a directory (which would specify
++			 * default ACLs for new files in that directory), but if the
++			 * original was empty, we get a header but no entries. With
++			 * real xattr, that ends up being silently discarded, apparently,
++			 * so we discard it too.
++			 */
++			pseudo_debug(PDBGF_XATTR, "0-length ACL entry %s.\n", name);
++			return 0;
++		}
++	}
+ 	/* this may be a plain chmod */
+ 	if (!strcmp(name, "system.posix_acl_access")) {
+ 		int extra;
+ 		int mode;
+ 		int entries = (size - sizeof(acl_header)) / sizeof(acl_entry);
+-		if (!posix_permissions(value, entries, &extra, &mode)) {
++		int res = posix_permissions(value, entries, &extra, &mode);
++		if (res == 0) {
+ 			pseudo_debug(PDBGF_XATTR, "posix_acl_access translated to mode %04o. Remaining attribute(s): %d.\n",
+ 				mode, extra);
+ 			buf.st_mode = mode;
+@@ -164,8 +190,12 @@ static int shared_setxattr(const char *path, int fd, const char *name, const voi
+ 			if (!extra) {
+ 				return 0;
+ 			}
++		} else if (res == -1) {
++			errno = EOPNOTSUPP;
++			return -1;
+ 		}
+ 	}
++
+ 	if (!strcmp(name, "user.pseudo_data")) {
+ 		pseudo_debug(PDBGF_XATTR | PDBGF_XATTRDB, "user.pseudo_data xattribute does not get to go in database.\n");
+ 		return -1;
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
index 9e0213a..b427b9a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
@@ -5,6 +5,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://fallback-passwd \
            file://fallback-group \
            file://moreretries.patch \
+           file://efe0be279901006f939cd357ccee47b651c786da.patch \
+           file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
            "
 
 SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
-- 
2.7.4


