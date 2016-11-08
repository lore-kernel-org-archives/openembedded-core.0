Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 71EC16FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:07:28 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3]
	helo=mango) by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1c47zj-0007Ar-VI; Tue, 08 Nov 2016 16:07:27 +0100
Received: from ejo by mango with local (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1c47zj-0003lt-7N; Tue, 08 Nov 2016 16:07:27 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 16:07:11 +0100
Message-Id: <1478617631-14177-1-git-send-email-ejo@pengutronix.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4b9e1364-53da-c237-276e-e2e011e13505@gmail.com>
References: <4b9e1364-53da-c237-276e-e2e011e13505@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH v2][krogoth] nss: fix compilation with glibc-2.24
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
X-List-Received-Date: Tue, 08 Nov 2016 15:07:28 -0000

`readdir_r` is deprecated as of glibc-2.24 and leads to a compilation
error:

| In file included from sysrand.c:16:0:
| unix_rand.c: In function 'ReadOneFile':
| unix_rand.c:1090:6: error: 'readdir_r' is deprecated [-Werror=deprecated-declarations]
|       error = readdir_r(fd, &entry_dir, &result);
|       ^~~~~
| In file included from unix_rand.c:1032:0,
|                  from sysrand.c:16:
| /usr/include/dirent.h:183:12: note: declared here
|  extern int readdir_r (DIR *__restrict __dirp,
|             ^~~~~~~~~
| cc1: all warnings being treated as errors

The issue is reported in nss bug tracker
(https://bugzilla.mozilla.org/show_bug.cgi?id=1254334) and fixed in nss
mainline.
The fixing patch is extracted from the nss source code repository.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---

Added missing upstream status.

 .../nss/nss/use-readdir-instead-of-readdir_r.patch | 97 ++++++++++++++++++++++
 meta/recipes-support/nss/nss_3.21.bb               |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/use-readdir-instead-of-readdir_r.patch

diff --git a/meta/recipes-support/nss/nss/use-readdir-instead-of-readdir_r.patch b/meta/recipes-support/nss/nss/use-readdir-instead-of-readdir_r.patch
new file mode 100644
index 0000000..226e57d
--- /dev/null
+++ b/meta/recipes-support/nss/nss/use-readdir-instead-of-readdir_r.patch
@@ -0,0 +1,97 @@
+# HG changeset patch
+# User Martin Thomson <martin.thomson@gmail.com>
+# Date 1457600884 -39600
+#      Thu Mar 10 20:08:04 2016 +1100
+# Node ID 7309fcbce2eceae1e4e3c687348e540905ae286a
+# Parent  e7b6fca4f01427cafb4328f6e279af62290a2f34
+Bug 1254334 - Use readdir instead of readdir_r, r=emaldona, sr=rrelyea
+
+Upstream-Status: Backport
+
+diff -r e7b6fca4f014 -r 7309fcbce2ec lib/freebl/unix_rand.c
+--- a/nss/lib/freebl/unix_rand.c	Wed Apr 20 15:22:46 2016 +0200
++++ b/nss/lib/freebl/unix_rand.c	Thu Mar 10 20:08:04 2016 +1100
+@@ -1054,26 +1054,16 @@
+  *
+  * return 1 if it's time to reset the fileToRead (no more files to read).
+  */
+-int ReadOneFile(int fileToRead)
++static int
++ReadOneFile(int fileToRead)
+ {
+     char *dir = "/etc";
+     DIR *fd = opendir(dir);
+     int resetCount = 0;
+-#ifdef SOLARIS
+-     /* grumble, Solaris does not define struct dirent to be the full length */
+-    typedef union {
+-	unsigned char space[sizeof(struct dirent) + MAXNAMELEN];
+-	struct dirent dir;
+-    } dirent_hack;
+-    dirent_hack entry, firstEntry;
+-
+-#define entry_dir entry.dir
+-#else
+-    struct dirent entry, firstEntry;
+-#define entry_dir entry
+-#endif
+-
+-    int i, error = -1;
++    struct dirent *entry;
++    char firstName[NAME_MAX + 1];
++    const char *name = NULL;
++    int i;
+ 
+     if (fd == NULL) {
+ 	dir = PR_GetEnvSecure("HOME");
+@@ -1085,33 +1075,34 @@
+ 	return 1;
+     }
+ 
++    firstName[0] = '\0';
+     for (i=0; i <= fileToRead; i++) {
+-	struct dirent *result = NULL;
+ 	do {
+-	    error = readdir_r(fd, &entry_dir, &result);
+-	} while (error == 0 && result != NULL  &&
+-					!ReadFileOK(dir,&result->d_name[0]));
+-	if (error != 0 || result == NULL)  {
++            /* readdir() isn't guaranteed to be thread safe on every platform;
++             * this code assumes the same directory isn't read concurrently.
++             * This usage is confirmed safe on Linux, see bug 1254334. */
++	    entry = readdir(fd);
++	} while (entry != NULL && !ReadFileOK(dir, &entry->d_name[0]));
++	if (entry == NULL)  {
+ 	    resetCount = 1; /* read to the end, start again at the beginning */
+-	    if (i != 0) {
++	    if (firstName[0]) {
+ 		/* ran out of entries in the directory, use the first one */
+-	 	entry = firstEntry;
+-	 	error = 0;
+-	 	break;
++	 	name = firstName;
+ 	    }
+-	    /* if i== 0, there were no readable entries in the directory */
+ 	    break;
+ 	}
+-	if (i==0) {
+-	    /* save the first entry in case we run out of entries */
+-	    firstEntry = entry;
++        name = entry->d_name;
++	if (i == 0) {
++	    /* copy the name of the first in case we run out of entries */
++            PORT_Assert(PORT_Strlen(name) <= NAME_MAX);
++            PORT_Strncpy(firstName, name, NAME_MAX);
++            firstName[NAME_MAX] = '\0';
+ 	}
+     }
+ 
+-    if (error == 0) {
++    if (name) {
+ 	char filename[PATH_MAX];
+-	int count = snprintf(filename, sizeof filename, 
+-				"%s/%s",dir, &entry_dir.d_name[0]);
++	int count = snprintf(filename, sizeof(filename), "%s/%s",dir, name);
+ 	if (count >= 1) {
+ 	    ReadSingleFile(filename);
+ 	}
diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-support/nss/nss_3.21.bb
index 05d81c2..39b0994 100644
--- a/meta/recipes-support/nss/nss_3.21.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://nss-fix-incorrect-shebang-of-perl.patch \
     file://nss-fix-nsinstall-build.patch \
     file://0001-Fix-build-failure-on-opensuse-13.1.patch \
+    file://use-readdir-instead-of-readdir_r.patch \
     file://nss-gcc6-fix.patch \
     file://nss.pc.in \
     file://signlibs.sh \
-- 
2.1.4


