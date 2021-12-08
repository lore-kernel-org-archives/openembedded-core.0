Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2A6C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 09:03:07 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9736.1638954177835005200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 01:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B892uCs032178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 8 Dec 2021 01:02:56 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Dec 2021 01:02:56 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 8 Dec 2021 01:02:55 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libpam: check whether files exist
Date: Wed, 8 Dec 2021 16:59:44 +0800
Message-ID: <20211208085944.30957-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 09:03:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159348

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to check whether files exist.

Before the patch:
 # ./run-xtests.sh . tst-pam_access1
 mv: cannot stat '/etc/security/opasswd': No such file or directory
 PASS: tst-pam_access1
 mv: cannot stat '/etc/security/opasswd-pam-xtests': No such file or directory
 ==================
 1 tests passed
 0 tests not run
 ==================

After the patch:
 # ./run-xtests.sh . tst-pam_access1
 PASS: tst-pam_access1
 ==================
 1 tests passed
 0 tests not run
 ==================

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-xtests.sh-check-whether-files-exist.patch | 65 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-run-xtests.sh-check-whether-files-exist.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-run-xtests.sh-check-whether-files-exist.patch b/meta/recipes-extended/pam/libpam/0001-run-xtests.sh-check-whether-files-exist.patch
new file mode 100644
index 0000000000..40040a873a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-run-xtests.sh-check-whether-files-exist.patch
@@ -0,0 +1,65 @@
+From e8e8ccfd57e0274b431bc5717bf37c488285b07b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 27 Oct 2021 10:30:46 +0800
+Subject: [PATCH] run-xtests.sh: check whether files exist
+
+Fixes:
+ # ./run-xtests.sh . tst-pam_access1
+ mv: cannot stat '/etc/security/opasswd': No such file or directory
+ PASS: tst-pam_access1
+ mv: cannot stat '/etc/security/opasswd-pam-xtests': No such file or directory
+ ==================
+ 1 tests passed
+ 0 tests not run
+ ==================
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/e8e8ccfd57e0274b431bc5717bf37c488285b07b]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ xtests/run-xtests.sh | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/xtests/run-xtests.sh b/xtests/run-xtests.sh
+index 14f585d9..ff9a4dc1 100755
+--- a/xtests/run-xtests.sh
++++ b/xtests/run-xtests.sh
+@@ -18,10 +18,12 @@ all=0
+ 
+ mkdir -p /etc/security
+ for config in access.conf group.conf time.conf limits.conf ; do
+-	cp /etc/security/$config /etc/security/$config-pam-xtests
++	[ -f "/etc/security/$config" ] &&
++		mv /etc/security/$config /etc/security/$config-pam-xtests
+ 	install -m 644 "${SRCDIR}"/$config /etc/security/$config
+ done
+-mv /etc/security/opasswd /etc/security/opasswd-pam-xtests
++[ -f /etc/security/opasswd ] &&
++	mv /etc/security/opasswd /etc/security/opasswd-pam-xtests
+ 
+ for testname in $XTESTS ; do
+ 	  for cfg in "${SRCDIR}"/$testname*.pamd ; do
+@@ -47,11 +49,15 @@ for testname in $XTESTS ; do
+ 	  all=`expr $all + 1`
+ 	  rm -f /etc/pam.d/$testname*
+ done
+-mv /etc/security/access.conf-pam-xtests /etc/security/access.conf
+-mv /etc/security/group.conf-pam-xtests /etc/security/group.conf
+-mv /etc/security/time.conf-pam-xtests /etc/security/time.conf
+-mv /etc/security/limits.conf-pam-xtests /etc/security/limits.conf
+-mv /etc/security/opasswd-pam-xtests /etc/security/opasswd
++
++for config in access.conf group.conf time.conf limits.conf opasswd ; do
++	if [ -f "/etc/security/$config-pam-xtests" ]; then
++		mv /etc/security/$config-pam-xtests /etc/security/$config
++	else
++		rm -f /etc/security/$config
++	fi
++done
++
+ if test "$failed" -ne 0; then
+ 	  echo "==================="
+ 	  echo "$failed of $all tests failed"
+-- 
+2.32.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index ee3a84a3b6..28ede8ff90 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
            file://libpam-xtests.patch \
+           file://0001-run-xtests.sh-check-whether-files-exist.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
            "
-- 
2.32.0


