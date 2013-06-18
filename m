Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66DA26023F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 02:28:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5I2Sqv3016915
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 19:28:52 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 19:28:52 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 22:28:50 -0400
Message-ID: <176634b76377a84f9d2df61ae35abfd248dc141f.1371522167.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371522167.git.wenzong.fan@windriver.com>
References: <cover.1371522167.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] logrotate: fix for CVE-2011-1548
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
X-List-Received-Date: Tue, 18 Jun 2013 02:28:51 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If a logfile is a symlink, it may be read when being compressed, being
copied (copy, copytruncate) or mailed. Secure data (eg. password files)
may be exposed.

Portback nofollow.patch from:
http://logrotate.sourcearchive.com/downloads/3.8.1-5/logrotate_3.8.1-5.debian.tar.gz

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../logrotate-3.8.1/logrotate-CVE-2011-1548.patch  |   43 ++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.8.1.bb |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch

diff --git a/meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch b/meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch
new file mode 100644
index 0000000..ed2750e
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport
+
+logrotate: fix for CVE-2011-1548
+
+If a logfile is a symlink, it may be read when being compressed, being
+copied (copy, copytruncate) or mailed. Secure data (eg. password files)
+may be exposed.
+
+Portback nofollow.patch from:
+http://logrotate.sourcearchive.com/downloads/3.8.1-5/logrotate_3.8.1-5.debian.tar.gz
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+---
+--- a/logrotate.c	2012-09-06 13:25:08.000000000 +0800
++++ b/logrotate.c	2012-09-06 13:35:57.000000000 +0800
+@@ -390,7 +390,7 @@
+     compressedName = alloca(strlen(name) + strlen(log->compress_ext) + 2);
+     sprintf(compressedName, "%s%s", name, log->compress_ext);
+ 
+-    if ((inFile = open(name, O_RDWR)) < 0) {
++    if ((inFile = open(name, O_RDWR | O_NOFOLLOW)) < 0) {
+ 	message(MESS_ERROR, "unable to open %s for compression\n", name);
+ 	return 1;
+     }
+@@ -470,7 +470,7 @@
+     char *mailArgv[] = { mailCommand, "-s", subject, address, NULL };
+     int rc = 0;
+ 
+-    if ((mailInput = open(logFile, O_RDONLY)) < 0) {
++    if ((mailInput = open(logFile, O_RDONLY | O_NOFOLLOW)) < 0) {
+ 	message(MESS_ERROR, "failed to open %s for mailing: %s\n", logFile,
+ 		strerror(errno));
+ 	return 1;
+@@ -561,7 +561,7 @@
+     message(MESS_DEBUG, "copying %s to %s\n", currLog, saveLog);
+ 
+     if (!debug) {
+-	if ((fdcurr = open(currLog, (flags & LOG_FLAG_COPY) ? O_RDONLY : O_RDWR)) < 0) {
++	if ((fdcurr = open(currLog, ((flags & LOG_FLAG_COPY) ? O_RDONLY : O_RDWR) | O_NOFOLLOW)) < 0) {
+ 	    message(MESS_ERROR, "error opening %s: %s\n", currLog,
+ 		    strerror(errno));
+ 	    return 1;
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
index 5a8156b..2b6dc93 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
            file://act-as-mv-when-rotate.patch \
            file://disable-check-different-filesystems.patch \
            file://update-the-manual.patch \
+           file://logrotate-CVE-2011-1548.patch \
             "
 
 SRC_URI[md5sum] = "bd2e20d8dc644291b08f9215397d28a5"
-- 
1.7.9.5


