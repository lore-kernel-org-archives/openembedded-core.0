Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB0B7605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 21:47:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4JLlOJE021890
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 14:47:24 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 19 May 2014 14:47:23 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 16:51:41 -0500
Message-ID: <3e32cfa9c91fb088c91cf3ef9db200d848a4ed07.1400277127.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1400277127.git.peter.seebach@windriver.com>
References: <cover.1400277127.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo: handle fchmodat better, mask out unwanted write bits
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
X-List-Received-Date: Mon, 19 May 2014 21:47:23 -0000
Content-Type: text/plain

It turns out that pseudo's decision not to report errors from
the host system's fchmodat() can break GNU tar in a very strange
way, resulting in directories being mode 0700 instead of whatever
they should have been.

Additionally, it turns out that if you make directories in your
rootfs mode 777, that results in the local copies being mode 777,
which could allow a hypothetical attacker with access to the
machine to add files to your rootfs image. We should mask out
the 022 bits when making actual mode changes in the rootfs.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../pseudo/files/pseudo-fchmodat-permissions.patch |   98 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    3 +-
 2 files changed, 100 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch

diff --git a/meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch b/meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
new file mode 100644
index 0000000..74a409c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
@@ -0,0 +1,98 @@
+commit 5a6f2896ed44029ced2a33ac64c962737c5171a0
+Author: Peter Seebach <peter.seebach@windriver.com>
+Date:   Fri May 16 15:53:06 2014 -0500
+
+    permissions updates: improve fchmodat, mask out write bits
+    
+    Backport from pseudo 1.6 of improvements to fchmodat (handle
+    AT_SYMLINK_NOFOLLOW by rejecting it if the host system does,
+    to make GNU tar happier), also mask out write bits from filesystem
+    modes to avoid security problems.
+
+diff --git a/ChangeLog.txt b/ChangeLog.txt
+index 113f675..fab1033 100644
+--- a/ChangeLog.txt
++++ b/ChangeLog.txt
+@@ -1,3 +1,14 @@
++2014-05-16:
++	* (seebs) fchmodat: don't drop flags, report failures, to improve
++	  compatibility/consistency. Cache the knowledge that
++	  AT_SYMLINK_NOFOLLOW gets ENOTSUP.
++	* (seebs) mask out group/other write bits in real filesystem to
++	  reduce risks when assembling a rootfs including world-writeable
++	  directories.
++
++2014-05-15:
++	* (seebs) drop flags when calling fchmodat() to appease GNU tar.
++
+ 2013-02-27:
+ 	* (seebs) Oh, hey, what if I took out my debug messages?
+ 	* (seebs) update docs a bit to reduce bitrot
+diff --git a/ports/unix/guts/fchmodat.c b/ports/unix/guts/fchmodat.c
+index 59a92ce..69a953c 100644
+--- a/ports/unix/guts/fchmodat.c
++++ b/ports/unix/guts/fchmodat.c
+@@ -8,6 +8,7 @@
+  */
+ 	PSEUDO_STATBUF buf;
+ 	int save_errno = errno;
++	static int picky_fchmodat = 0;
+ 
+ #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+ 	if (dirfd != AT_FDCWD) {
+@@ -15,6 +16,16 @@
+ 		return -1;
+ 	}
+ 	if (flags & AT_SYMLINK_NOFOLLOW) {
++		/* Linux, as of this writing, will always reject this.
++		 * GNU tar relies on getting the rejection. To cut down
++		 * on traffic, we check for the failure, and if we saw
++		 * a failure previously, we reject it right away and tell
++		 * the caller to retry.
++		 */
++		if (picky_fchmodat) {
++			errno = ENOTSUP;
++			return -1;
++		}
+ 		rc = base_lstat(path, &buf);
+ 	} else {
+ 		rc = base_stat(path, &buf);
+@@ -50,13 +61,22 @@
+ 
+ 	/* user bits added so "root" can always access files. */
+ #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+-	/* note:  if path was a symlink, and AT_NOFOLLOW_SYMLINKS was
++	/* note:  if path was a symlink, and AT_SYMLINK_NOFOLLOW was
+ 	 * specified, we already bailed previously. */
+ 	real_chmod(path, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)));
+ #else
+-	real_fchmodat(dirfd, path, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)), flags);
++	rc = real_fchmodat(dirfd, path, PSEUDO_FS_MODE(mode, S_ISDIR(buf.st_mode)), flags);
++	/* AT_SYMLINK_NOFOLLOW isn't supported by fchmodat. GNU tar
++	 * tries to use it anyway, figuring it can just retry if that
++	 * fails. So we want to report that *particular* failure instead
++	 * of doing the fallback.
++	 */
++	if (rc == -1 && errno == ENOTSUP && (flags & AT_SYMLINK_NOFOLLOW)) {
++		picky_fchmodat = 1;
++		return -1;
++	}
+ #endif
+-	/* we ignore a failure from underlying fchmod, because pseudo
++	/* we otherwise ignore failures from underlying fchmod, because pseudo
+ 	 * may believe you are permitted to change modes that the filesystem
+ 	 * doesn't. Note that we also don't need to know whether the
+          * file might be a (pseudo) block device or some such; pseudo
+diff --git a/pseudo_client.h b/pseudo_client.h
+index f36a772..ecb13a6 100644
+--- a/pseudo_client.h
++++ b/pseudo_client.h
+@@ -85,6 +85,6 @@ extern int pseudo_nosymlinkexp;
+  * None of this will behave very sensibly if umask has 0700 bits in it;
+  * this is a known limitation.
+  */
+-#define PSEUDO_FS_MODE(mode, isdir) ((mode) | S_IRUSR | S_IWUSR | ((isdir) ? S_IXUSR : 0))
+-#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0700) | ((user_mode & 0700)))
++#define PSEUDO_FS_MODE(mode, isdir) ((((mode) | S_IRUSR | S_IWUSR | ((isdir) ? S_IXUSR : 0)) & ~(S_IWGRP | S_IWOTH)) & ~(S_IWOTH | S_IWGRP))
++#define PSEUDO_DB_MODE(fs_mode, user_mode) (((fs_mode) & ~0722) | ((user_mode & 0722)))
+ 
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index 215cdb8..47291fd 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -1,12 +1,13 @@
 require pseudo.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-pseudo_has_unload-add-function.patch \
     file://shutdownping.patch \
     file://pseudo-1.5.1-install-directory-mode.patch \
+    file://pseudo-fchmodat-permissions.patch \
 "
 
 SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
-- 
1.7.1


