Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8113F73D41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sMgn021389
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:13 -0700
Message-ID: <4a9f0c955d4dc0220feebd128247c0a8e9529b1c.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] logrotate: remove logrotate-CVE-2011-1548.patch
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:23 -0000
Content-Type: text/plain

It is a backport patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../logrotate/logrotate-CVE-2011-1548.patch        |   43 --------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch

diff --git a/meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch b/meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch
deleted file mode 100644
index ed2750e..0000000
--- a/meta/recipes-extended/logrotate/logrotate/logrotate-CVE-2011-1548.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Backport
-
-logrotate: fix for CVE-2011-1548
-
-If a logfile is a symlink, it may be read when being compressed, being
-copied (copy, copytruncate) or mailed. Secure data (eg. password files)
-may be exposed.
-
-Portback nofollow.patch from:
-http://logrotate.sourcearchive.com/downloads/3.8.1-5/logrotate_3.8.1-5.debian.tar.gz
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
----
---- a/logrotate.c	2012-09-06 13:25:08.000000000 +0800
-+++ b/logrotate.c	2012-09-06 13:35:57.000000000 +0800
-@@ -390,7 +390,7 @@
-     compressedName = alloca(strlen(name) + strlen(log->compress_ext) + 2);
-     sprintf(compressedName, "%s%s", name, log->compress_ext);
- 
--    if ((inFile = open(name, O_RDWR)) < 0) {
-+    if ((inFile = open(name, O_RDWR | O_NOFOLLOW)) < 0) {
- 	message(MESS_ERROR, "unable to open %s for compression\n", name);
- 	return 1;
-     }
-@@ -470,7 +470,7 @@
-     char *mailArgv[] = { mailCommand, "-s", subject, address, NULL };
-     int rc = 0;
- 
--    if ((mailInput = open(logFile, O_RDONLY)) < 0) {
-+    if ((mailInput = open(logFile, O_RDONLY | O_NOFOLLOW)) < 0) {
- 	message(MESS_ERROR, "failed to open %s for mailing: %s\n", logFile,
- 		strerror(errno));
- 	return 1;
-@@ -561,7 +561,7 @@
-     message(MESS_DEBUG, "copying %s to %s\n", currLog, saveLog);
- 
-     if (!debug) {
--	if ((fdcurr = open(currLog, (flags & LOG_FLAG_COPY) ? O_RDONLY : O_RDWR)) < 0) {
-+	if ((fdcurr = open(currLog, ((flags & LOG_FLAG_COPY) ? O_RDONLY : O_RDWR) | O_NOFOLLOW)) < 0) {
- 	    message(MESS_ERROR, "error opening %s: %s\n", currLog,
- 		    strerror(errno));
- 	    return 1;
-- 
1.7.9.5


