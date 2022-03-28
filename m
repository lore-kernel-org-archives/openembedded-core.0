Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E246C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 16:14:39 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web09.13206.1648484078297714761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 09:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=Ors1O2cY;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=1086da13eb=chaitanya.vadrevu@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22S816b6019923
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=PPS11062020;
 bh=5+bjM0ApPKDaK6irqroO0OahmRNBuOdfjgDxDpC2yE8=;
 b=Ors1O2cYUzydzKJysrKjI1Q/QJp1/sZjCulGbFZoha1PuBrnVaazGA6SFUPZ4/nfrbXn
 rz81Cz+cPONPtcjtENNgTLaNOBzMCfShp5BiKq1IRrCsWU07WoOE8npUedjY+ftxyXde
 WEIChtnRa30ziL36h/XDm+gMN4jXRpNEZChDlORlbzsLavFCQvgrzFIytL+DcWZDH7Yj
 Ns+OLr5h4pgCGcG+0RPFNeQzEAMnjol1LawWzB//SjodCGbnCQfJogm/wH74rdXvNtKL
 4dYUFljQb3VPbw6Lo0RI2naJEdhXtgux+HzSTmv+8l1A1peh6hE8TPUDc4D/nw+EvVaw zQ==
Received: from ni.com ([130.164.80.24])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3f1xwckv3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:14:36 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
 (us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.1.2/8.16.1.2) with ESMTPS id
 22SGEZb3005576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 11:14:35 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
 us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 28 Mar 2022 11:14:35 -0500
Received: from cvadrevu-linux.amer.corp.natinst.com (172.18.68.32) by
 us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP Server
 id 15.0.1497.28 via Frontend Transport; Mon, 28 Mar 2022 11:14:35 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [PATCH] pseudo_util: Fix handling of absolute links
Date: Mon, 28 Mar 2022 11:13:48 -0500
Message-ID: <20220328161348.32725-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: QgeU0FsBg_rBJgL_34Szj6NKBMsJMThb
X-Proofpoint-ORIG-GUID: QgeU0FsBg_rBJgL_34Szj6NKBMsJMThb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_07,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Reason: orgsafe
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 16:14:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163716

Absolute links should be evaluated starting from the chroot path but the
existing implementation drops the whole base path (which includes the
chroot path) when it encounters an absolute link.

Encountered the issue during root image creation process in an OE build
where ldconfig was deleting some absolute links as stat64 calls failed
and the symlinks were deemed dead.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 pseudo_util.c               |  6 ++----
 test/test-chroot-symlink.c  | 28 ++++++++++++++++++++++++++++
 test/test-chroot-symlink.sh | 19 +++++++++++++++++++
 3 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 test/test-chroot-symlink.c
 create mode 100755 test/test-chroot-symlink.sh

diff --git a/pseudo_util.c b/pseudo_util.c
index 5f8ff19..f150a1b 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -694,9 +694,9 @@ pseudo_append_element(char *newpath, char *root, size_t allocated, char **pcurre
 			}
 			/* null-terminate buffer */
 			linkbuf[linklen] = '\0';
-			/* absolute symlink means start over! */
+			/* absolute symlink means go back to root */
 			if (*linkbuf == '/') {
-				current = newpath;
+				current = root;
 			} else {
 				/* point back at the end of the previous path... */
 				current -= (elen + 1);
@@ -794,8 +794,6 @@ static int pathbuf = 0;
  * path of baselen characters, presumed not to end in a /.  path is
  * the new path to be canonicalized.  The tricky part is that path may
  * contain symlinks, which must be resolved.
- * if "path" starts with a /, then it is an absolute path, and
- * we ignore base.
  */
 char *
 pseudo_fix_path(const char *base, const char *path, size_t rootlen, size_t baselen, size_t *lenp, int leave_last) {
diff --git a/test/test-chroot-symlink.c b/test/test-chroot-symlink.c
new file mode 100644
index 0000000..469cb49
--- /dev/null
+++ b/test/test-chroot-symlink.c
@@ -0,0 +1,28 @@
+/*
+ * Test that stat'ing absolute/relative symlinks in a chroot environment works
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ */
+#define _GNU_SOURCE
+
+#include <unistd.h>
+#include <sys/stat.h>
+#include <stdio.h>
+
+int main(int argc, char *argv[]) {
+    struct stat buf;
+
+    if (argc != 2) {
+        perror("args");
+	return 2;
+    }
+    if (chroot(argv[1]) == -1) {
+        perror("chroot");
+        return 1;
+    }
+    if (stat("symlink", &buf) == -1) {
+        perror("stat symlink");
+        return 1;
+    }
+    return 0;
+}
diff --git a/test/test-chroot-symlink.sh b/test/test-chroot-symlink.sh
new file mode 100755
index 0000000..91092c1
--- /dev/null
+++ b/test/test-chroot-symlink.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+#
+# Test that stat'ing absolute/relative symlinks in a chroot environment works
+# SPDX-License-Identifier: LGPL-2.1-only
+#
+
+set -e
+
+touch symlink_target
+trap "rm -f symlink_target symlink" 0
+
+# Absolute symlink
+ln -s /symlink_target symlink
+./test/test-chroot-symlink `pwd`
+rm symlink
+
+# Relative symlink
+ln -s symlink_target symlink
+./test/test-chroot-symlink `pwd`
-- 
2.17.1


