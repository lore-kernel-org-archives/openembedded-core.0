Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00E0C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:11:57 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.8580.1636625516276018053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1ABABsRa013734
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:11:55 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 02:11:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 02:11:50 -0800
Received: from localhost.localdomain (128.224.72.50) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 11 Nov 2021 02:11:47 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [pseudo] pseudo_fix_path: do not expand symlinks in /proc
Date: Thu, 11 Nov 2021 05:11:43 -0500
Message-ID: <20211111101143.145750-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:11:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158154

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
- run_tests: all tests passed (3 tests check the new code path).
             Checked test output to make sure the new codepath gets executed.
- perftest: measured time before and after applying the patch
            had insignificant differences (roughly ~1%)
- world build: completed without warning/errors

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 pseudo_util.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/pseudo_util.c b/pseudo_util.c
index b6980c2..b9de81e 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -29,6 +29,11 @@
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
@@ -678,6 +683,18 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
 	 */
 	if (!leave_this && is_dir) {
 		int is_link = S_ISLNK(buf->st_mode);
+
+		/* do not expand symlinks in the proc filesystem, since they may not be real
+		 * check if newpath starts with "/proc/"
+		 * strlen of "/proc/" = 6
+		 */
+		if (is_link && (strncmp("/proc/", newpath, 6) == 0)) {
+			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE,
+				"pae: '%s' is procfs symlink, not expanding\n",
+				newpath);
+			is_link = 0;
+		}
+
 		if (link_recursion >= PSEUDO_MAX_LINK_RECURSION && is_link) {
 			pseudo_diag("link recursion too deep, not expanding path '%s'.\n", newpath);
 			is_link = 0;
-- 
2.25.1


