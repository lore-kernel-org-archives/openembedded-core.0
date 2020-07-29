Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5465.1596028194478303656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06TD9CBR029523
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 06:09:43 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Jul 2020
 06:09:17 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 777821FF59;
 Wed, 29 Jul 2020 09:09:16 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] ltp: remove OOM tests from runtest/mm
Date: Wed, 29 Jul 2020 09:09:16 -0400
Message-ID: <20200729130916.38764-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes [YOCTO #13802]

Remove the OOM tests, since they might cause oeqa ssh
connection lost.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 33 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 0000000000..2d8262be78
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -0,0 +1,33 @@
+From 373b21dcf7a2879c27cc3dbeac5d83f5d45d22ae Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index 4701a14bd..2f9888ec6 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -75,12 +75,6 @@ ksm06_2 ksm06 -n 10000
+
+ cpuset01 cpuset01
+
+-oom01 oom01
+-oom02 oom02
+-oom03 oom03
+-oom04 oom04
+-oom05 oom05
+-
+ swapping01 swapping01 -i 5
+
+ thp01 thp01 -I 120
+--
+2.27.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index ece3acf0f9..0c7044d044 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-ptrace01-Fix-missing-format-string.patch \
            file://0001-sigwaitinfo-Do-not-run-invalid-undefined-test-cases.patch \
            file://0001-syscalls-copy_file_range02-Expect-EFBIG-in-subcase-m.patch \
+           file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            "

 S = "${WORKDIR}/git"
--
2.27.0
