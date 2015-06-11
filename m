Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5D0757C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 15:49:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 11 Jun 2015 08:49:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709295933"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 08:49:43 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 07:45:47 +0000
Message-Id: <68ceb6a2a3fb8bf230e99107b8990c5138fabd74.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] rpm: Fix CVE-2013-6435
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
X-List-Received-Date: Thu, 11 Jun 2015 15:49:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Backport to fix CVE-2013-6435. Description on [1] and original
patch taken from [2].

[1] https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
[2] https://bugzilla.redhat.com/attachment.cgi?id=956207

[YOCTO #7181]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../rpm/rpm/rpm-CVE-2013-6435.patch                | 109 +++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
new file mode 100644
index 0000000..b107e8f
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
@@ -0,0 +1,109 @@
+From 08105acda1da63d32fbb18596a3d6c3e0aa106d1 Mon Sep 17 00:00:00 2001
+From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+Date: Wed, 10 Jun 2015 14:36:56 +0000
+Subject: [PATCH 2/2] rpm: CVE-2013-6435
+
+Upstream-Status: Backport
+
+Reference:
+https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
+
+Description:
+It was found that RPM wrote file contents to the target installation
+directory under a temporary name, and verified its cryptographic signature
+only after the temporary file has been written completely. Under certain
+conditions, the system interprets the unverified temporary file contents
+and extracts commands from it. This could allow an attacker to modify
+signed RPM files in such a way that they would execute code chosen
+by the attacker during package installation.
+
+Original Patch:
+https://bugzilla.redhat.com/attachment.cgi?id=956207
+
+Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+---
+ lib/fsm.c     |  2 +-
+ rpmio/rpmio.c | 18 ++++++++++++++----
+ 2 files changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/lib/fsm.c b/lib/fsm.c
+index 1ee7e67..094eb1d 100644
+--- a/lib/fsm.c
++++ b/lib/fsm.c
+@@ -726,7 +726,7 @@ static int expandRegular(FSM_t fsm, rpmpsm psm, rpmcpio_t archive, int nodigest)
+ {
+     FD_t wfd = NULL;
+     const struct stat * st = &fsm->sb;
+-    rpm_loff_t left = st->st_size;
++    rpm_loff_t left = rpmfiFSizeIndex(fsmGetFi(fsm), fsm->ix);
+     const unsigned char * fidigest = NULL;
+     pgpHashAlgo digestalgo = 0;
+     int rc = 0;
+diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
+index cd223e8..0b12e31 100644
+--- a/rpmio/rpmio.c
++++ b/rpmio/rpmio.c
+@@ -1309,15 +1309,19 @@ int Fclose(FD_t fd)
+  * - bzopen:	[1-9] is block size (modulo 100K)
+  * - bzopen:	's' is smallmode
+  * - HACK:	'.' terminates, rest is type of I/O
++ * -            'U' sets *mode to zero (no permissions) instead of 0666
+  */
+ static void cvtfmode (const char *m,
+ 				char *stdio, size_t nstdio,
+ 				char *other, size_t nother,
+-				const char **end, int * f)
++				const char **end, int *f, mode_t *mode)
+ {
+     int flags = 0;
+     char c;
+ 
++    if (mode)
++    *mode = 0666;
++
+     switch (*m) {
+     case 'a':
+ 	flags |= O_WRONLY | O_CREAT | O_APPEND;
+@@ -1357,6 +1361,10 @@ static void cvtfmode (const char *m,
+ 	    if (--nstdio > 0) *stdio++ = c;
+ 	    continue;
+ 	    break;
++	case 'U':
++	    if (mode)
++		*mode = 0;
++	    break;
+ 	default:
+ 	    if (--nother > 0) *other++ = c;
+ 	    continue;
+@@ -1385,7 +1393,8 @@ fprintf(stderr, "*** Fdopen(%p,%s) %s\n", fd, fmode, fdbg(fd));
+     if (fd == NULL || fmode == NULL)
+ 	return NULL;
+ 
+-    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, NULL);
++    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, NULL,
++        NULL);
+     if (stdio[0] == '\0')
+ 	return NULL;
+     zstdio[0] = '\0';
+@@ -1436,7 +1445,7 @@ FD_t Fopen(const char *path, const char *fmode)
+ {
+     char stdio[20], other[20];
+     const char *end = NULL;
+-    mode_t perms = 0666;
++    mode_t perms;
+     int flags = 0;
+     FD_t fd;
+ 
+@@ -1444,7 +1453,8 @@ FD_t Fopen(const char *path, const char *fmode)
+ 	return NULL;
+ 
+     stdio[0] = '\0';
+-    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, &flags);
++    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, &flags,
++        &perms);
+     if (stdio[0] == '\0')
+ 	return NULL;
+ 
+-- 
+1.8.4.5
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index 7c402b6..df9aafb 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://rpm.org/releases/rpm-4.11.x/${BP}.tar.bz2 \
             file://rpm-scriptetexechelp.patch \
             file://pythondeps.sh \
             file://rpm-CVE-2014-8118.patch \
+            file://rpm-CVE-2013-6435.patch \
            "
 
 SRC_URI[md5sum] = "876ac9948a88367054f8ddb5c0e87173"
-- 
1.8.4.5


