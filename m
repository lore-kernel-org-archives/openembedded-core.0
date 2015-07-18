Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB9B760EE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:54 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so4895512pab.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=2zi8e/HGzgiW22gqqX1/qICScxDy/PIsdKmXOnNTbYo=;
	b=vkkED6NYDMonq7QI/bTvLCOFsAoGcZ3sUIi03pUTYWUoegWycLPS0Rxv9+aZv6Djgq
	9rHRmYIWjMsQoBEaZcl3logAHmAXU/dgTocqlCiPsbKVhz9O8RwdxIjJm8pL6AwvUwUM
	8ePtAK66jd/pcMcNHqR8rtR6TW7IZKQEgfiNt5R33yClguf1a0jOK9lyrEV0rtUYsOJz
	wruaomlbKzOTx+HQCkSlVuaz7nl0wl4JarM+HdyVDXTs8NMRm8y/IUTRX9NClJoGEhZZ
	Rvv4u7F2vrVHfUlEpRj02NkXx1HLNSTCyrUglKdEEtMsDAOZvU5HkniTUI0p9X4KkVN8
	iABA==
X-Received: by 10.66.231.69 with SMTP id te5mr39880206pac.98.1437232614485;
	Sat, 18 Jul 2015 08:16:54 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	kx14sm14689959pab.0.2015.07.18.08.16.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 83895FC1300; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:31 -0700
Message-Id: <ea84c9f4346d7bc98273b2cc4336d3bb45b4530e.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 24/25] rpm: Fix CVE-2013-6435
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:54 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Backport to fix CVE-2013-6435. Description on [1] and original
patch taken from [2].

[1] https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
[2] https://bugzilla.redhat.com/attachment.cgi?id=956207

[YOCTO #7181]

(From OE-Core rev: 6bf846ed5ccd1a4d01b36630708b2b9aa9e69ed5)

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 86a5fbb..7c67b69 100644
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
1.9.1


