Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2624B771AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 06:58:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u366wl11028738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 23:58:47 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 23:58:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 23:58:40 -0700
Message-ID: <f5f60e69230ea54f8c9b00256418cc02de09d14a.1459925867.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459925867.git.liezhi.yang@windriver.com>
References: <cover.1459925867.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] rpm: remove two unused patch
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
X-List-Received-Date: Wed, 06 Apr 2016 06:58:49 -0000
Content-Type: text/plain

They are already in the source:
rpm-CVE-2013-6435.patch
rpm-CVE-2014-8118.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rpm/rpm/rpm-CVE-2013-6435.patch                | 110 ---------------------
 .../rpm/rpm/rpm-CVE-2014-8118.patch                |  44 ---------
 2 files changed, 154 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
deleted file mode 100644
index a2691f6..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 08105acda1da63d32fbb18596a3d6c3e0aa106d1 Mon Sep 17 00:00:00 2001
-From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
-Date: Wed, 10 Jun 2015 14:36:56 +0000
-Subject: [PATCH 2/2] rpm: CVE-2013-6435
-
-Upstream-Status: Backport
-CVE: CVE-2013-6435
-
-Reference:
-https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
-
-Description:
-It was found that RPM wrote file contents to the target installation
-directory under a temporary name, and verified its cryptographic signature
-only after the temporary file has been written completely. Under certain
-conditions, the system interprets the unverified temporary file contents
-and extracts commands from it. This could allow an attacker to modify
-signed RPM files in such a way that they would execute code chosen
-by the attacker during package installation.
-
-Original Patch:
-https://bugzilla.redhat.com/attachment.cgi?id=956207
-
-Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
----
- lib/fsm.c     |  2 +-
- rpmio/rpmio.c | 18 ++++++++++++++----
- 2 files changed, 15 insertions(+), 5 deletions(-)
-
-diff --git a/lib/fsm.c b/lib/fsm.c
-index 1ee7e67..094eb1d 100644
---- a/lib/fsm.c
-+++ b/lib/fsm.c
-@@ -726,7 +726,7 @@ static int expandRegular(FSM_t fsm, rpmpsm psm, rpmcpio_t archive, int nodigest)
- {
-     FD_t wfd = NULL;
-     const struct stat * st = &fsm->sb;
--    rpm_loff_t left = st->st_size;
-+    rpm_loff_t left = rpmfiFSizeIndex(fsmGetFi(fsm), fsm->ix);
-     const unsigned char * fidigest = NULL;
-     pgpHashAlgo digestalgo = 0;
-     int rc = 0;
-diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
-index cd223e8..0b12e31 100644
---- a/rpmio/rpmio.c
-+++ b/rpmio/rpmio.c
-@@ -1309,15 +1309,19 @@ int Fclose(FD_t fd)
-  * - bzopen:	[1-9] is block size (modulo 100K)
-  * - bzopen:	's' is smallmode
-  * - HACK:	'.' terminates, rest is type of I/O
-+ * -            'U' sets *mode to zero (no permissions) instead of 0666
-  */
- static void cvtfmode (const char *m,
- 				char *stdio, size_t nstdio,
- 				char *other, size_t nother,
--				const char **end, int * f)
-+				const char **end, int *f, mode_t *mode)
- {
-     int flags = 0;
-     char c;
- 
-+    if (mode)
-+    *mode = 0666;
-+
-     switch (*m) {
-     case 'a':
- 	flags |= O_WRONLY | O_CREAT | O_APPEND;
-@@ -1357,6 +1361,10 @@ static void cvtfmode (const char *m,
- 	    if (--nstdio > 0) *stdio++ = c;
- 	    continue;
- 	    break;
-+	case 'U':
-+	    if (mode)
-+		*mode = 0;
-+	    break;
- 	default:
- 	    if (--nother > 0) *other++ = c;
- 	    continue;
-@@ -1385,7 +1393,8 @@ fprintf(stderr, "*** Fdopen(%p,%s) %s\n", fd, fmode, fdbg(fd));
-     if (fd == NULL || fmode == NULL)
- 	return NULL;
- 
--    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, NULL);
-+    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, NULL,
-+        NULL);
-     if (stdio[0] == '\0')
- 	return NULL;
-     zstdio[0] = '\0';
-@@ -1436,7 +1445,7 @@ FD_t Fopen(const char *path, const char *fmode)
- {
-     char stdio[20], other[20];
-     const char *end = NULL;
--    mode_t perms = 0666;
-+    mode_t perms;
-     int flags = 0;
-     FD_t fd;
- 
-@@ -1444,7 +1453,8 @@ FD_t Fopen(const char *path, const char *fmode)
- 	return NULL;
- 
-     stdio[0] = '\0';
--    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, &flags);
-+    cvtfmode(fmode, stdio, sizeof(stdio), other, sizeof(other), &end, &flags,
-+        &perms);
-     if (stdio[0] == '\0')
- 	return NULL;
- 
--- 
-1.8.4.5
-
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch b/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
deleted file mode 100644
index 985f150..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 71c812edf1431a9967bd99ba6ffa6ab89eb7ec7c Mon Sep 17 00:00:00 2001
-From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
-Date: Wed, 10 Jun 2015 12:56:55 +0000
-Subject: [PATCH 1/2] rpm: CVE-2014-8118
-
-Upstream-Status: Backport
-CVE: CVE-2014-8118
-
-Reference:
-https://bugzilla.redhat.com/show_bug.cgi?id=1168715
-
-Description:
-It was found that RPM could encounter an integer overflow,
-leading to a stack-based overflow, while parsing a crafted
-CPIO header in the payload section of an RPM file.  This could
-allow an attacker to modify signed RPM files in such a way that
-they would execute code chosen by the attacker during package
-installation.
-
-Original Patch:
-https://bugzilla.redhat.com/attachment.cgi?id=962159
-
-Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
----
- lib/cpio.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/cpio.c b/lib/cpio.c
-index 382eeb6..74ddd9c 100644
---- a/lib/cpio.c
-+++ b/lib/cpio.c
-@@ -296,6 +296,9 @@ int rpmcpioHeaderRead(rpmcpio_t cpio, char ** path, struct stat * st)
-     st->st_rdev = makedev(major, minor);
- 
-     GET_NUM_FIELD(hdr.namesize, nameSize);
-+    if (nameSize <= 0 || nameSize > 4096) {
-+        return CPIOERR_BAD_HEADER;
-+    }
- 
-     *path = xmalloc(nameSize + 1);
-     read = Fread(*path, nameSize, 1, cpio->fd);
--- 
-1.8.4.5
-
-- 
2.8.0


