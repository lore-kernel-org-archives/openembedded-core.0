Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F7BC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 18:03:17 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.558.1635184996051332922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 19PI3E5i011382
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:03:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 19PI39Ng014350
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:03:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Oct 2021 11:03:08 -0700
Received: from localhost.localdomain (128.224.72.221) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Oct 2021 11:03:08 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [pseudo] pseudo_fix_path: do not expand symlinks in /proc
Date: Mon, 25 Oct 2021 14:03:07 -0400
Message-ID: <20211025180307.24635-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 18:03:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157354

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
- run_tests: all tests passed. Checked the test output to make
             sure the new codepath gets executed.
- perftest: measured time before and after applying the patch
            had insignificant differences (roughly ~1%)
- world build: completed without warning/errors

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 pseudo_util.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/pseudo_util.c b/pseudo_util.c
index b6980c2..b35a34e 100644
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
@@ -678,6 +685,26 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
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
2.25.1


