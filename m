Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.1400.1596081398418725003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 20:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mzeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06U3ubNJ018910
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 20:56:37 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Jul 2020
 20:56:36 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21151)	id 2FF032000C;
 Wed, 29 Jul 2020 23:56:36 -0400 (EDT)
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3] ltp: remove OOM tests from runtest/mm
Date: Wed, 29 Jul 2020 23:56:36 -0400
Message-ID: <20200730035636.1830-1-matthew.zeng@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

[YOCTO #13802]

Remove the OOM tests, since they might cause oeqa ssh
connection lost.

Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
---
 ...001-Remove-OOM-tests-from-runtest-mm.patch | 34 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20200515.bb     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
new file mode 100644
index 0000000000..529065d979
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -0,0 +1,34 @@
+From 13ef88cdccfe3f58c53d57806866b91e310eb272 Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
+Date: Wed, 29 Jul 2020 08:47:09 -0400
+Subject: [PATCH] Remove OOM tests from runtest/mm
+
+Disable OOM tests, as they might cause oeqa ssh connection lost
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
+
+---
+ runtest/mm | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/runtest/mm b/runtest/mm
+index a09f39c1e..76fa82754 100644
+--- a/runtest/mm
++++ b/runtest/mm
+@@ -73,12 +73,6 @@ ksm06 ksm06
+ ksm06_1 ksm06 -n 10
+ ksm06_2 ksm06 -n 10000
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
