Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.2363.1601053536807593589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 10:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08PH5Y84015489
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 25 Sep 2020 10:05:35 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 10:05:34 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id CD81B2004E;
 Fri, 25 Sep 2020 13:05:33 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <seebs@seebs.net>, Matt Cowell <matt.cowell@nokia.com>,
        Sakib Sajal
	<sakib.sajal@windriver.com>
Subject: [PATCH] pseudo: do not expand symlinks in /proc
Date: Fri, 25 Sep 2020 13:05:32 -0400
Message-ID: <20200925170532.19685-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Matt Cowell <matt.cowell@nokia.com>

Some symlinks in /proc, such as those under /proc/[pid]/fd,
/proc/[pid]/cwd, and /proc/[pid]/exe that are not real and should not
have readlink called on them.  These look like symlinks, but behave like
hardlinks.  Readlink does not return actual paths.  Previously
pseudo_fix_path would expand files such as /dev/stdin to paths such as
/proc/6680/fd/pipe:[1270830076] which do not exist.

This issue affects:
- deleted files
- deleted directories
- fifos
- sockets
- anon_inodes (epoll, eventfd, inotify, signalfd, timerfd, etc)

Testing:
timed builds before and after applying patch, without significant
measurable difference.
$ bitbake -c compile <image>; time bitbake <image>

installed pseudo on an image and was unable to reproduce the test
on bug report after applying the patch.

FIXES: Bug 13288

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 pseudo_util.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/pseudo_util.c b/pseudo_util.c
index c867ed6..bce4d1e 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -21,6 +21,8 @@
 #include <sys/time.h>
 #include <unistd.h>
 #include <limits.h>
+#include <sys/vfs.h>
+#include <linux/magic.h>
 
 /* see the comments below about (*real_regcomp)() */
 #include <dlfcn.h>
@@ -29,6 +31,11 @@
 #include "pseudo_ipc.h"
 #include "pseudo_db.h"
 
+/* O_PATH is defined in glibc 2.16 and later only */
+#ifndef O_PATH
+#define O_PATH          010000000
+#endif
+
 struct pseudo_variables {
 	char *key;
 	size_t key_len;
@@ -677,6 +684,26 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
 	 */
 	if (!leave_this && is_dir) {
 		int is_link = S_ISLNK(buf->st_mode);
+
+		/* do not expand symlinks in the proc filesystem, since they may not be real */
+		if (is_link) {
+			struct statfs sfs;
+			int fd;
+
+			/* statfs follows symlinks, so use fstatfs */
+			fd = open(newpath, O_CLOEXEC | O_PATH | O_NOFOLLOW);
+			if (-1 != fd) {
+				if (0 == fstatfs(fd, &sfs) && sfs.f_type == PROC_SUPER_MAGIC) {
+					pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
+						"pae: '%s' is procfs symlink, not expanding\n",
+						newpath);
+					is_link = 0;
+				}
+
+				close(fd);
+			}
+		}
+
 		if (link_recursion >= PSEUDO_MAX_LINK_RECURSION && is_link) {
 			pseudo_diag("link recursion too deep, not expanding path '%s'.\n", newpath);
 			is_link = 0;
-- 
2.27.0

