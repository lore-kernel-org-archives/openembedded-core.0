Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F234C83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 09:48:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4784.1752140914480998687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 02:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92867733c1=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A6lG9t004020
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 02:48:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn4y0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 02:48:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 10 Jul 2025 02:48:03 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 10 Jul 2025 02:48:02 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [PATCH v2] ruby-ptest : some ptest fixes
Date: Thu, 10 Jul 2025 17:48:31 +0800
Message-ID: <20250710094831.3148214-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: a5iJ5YhtPwytI_xXmFxz1JB4YZge_-Nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX9ucsDBs+w8KP hqnZhbpWnmzMd1J8+Zs2kJ8RxV/JYVUMqI/LVq8mL9wCqSTQwH6jwQcIv8y71pOesrqUGjMBWxs uG7bq1TPrDjtpotawA+Z/5ZK16hMBzIvRbDHoi7h+H9IU9C3V52TMzoZVGiro3pbPsRqzdf4RbP
 XuS/CS7AgBmmN/Qjf9rjnKV1rKWp4/VRcfKwS+b/4/WV9GrM8bfP7GflcR6O5c6qQL6cY+OSFdH lTgirPQlR4/Db+PKfKBgjIF7jMJ5LuIonBfXMu7u1OgI9W2Ge0qZI0MgypxTurL3niLHbSJxqy3 gdPjHhsRfRprxrgLm1Nn8cRsRT6pa35ocdQQXWMGwqExxKt8HuW9KrKupkuM6wWhn5cBoZ1RrcC qSJ7HYFQ
X-Proofpoint-ORIG-GUID: a5iJ5YhtPwytI_xXmFxz1JB4YZge_-Nf
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686f8c71 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=_DOG5VusZh96CSHd3rEA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 09:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220116

From: Jiaying Song <jiaying.song.cn@windriver.com>

- Skip the test_rm_r_no_permissions test under the root user, as
  deletion always succeeds.
- Filter out tests under the -ext- directory in run-ptest. Due to the
  commit [1],the packaging of .so test files under the .ext directory
  was removed. As a result, adjust the test filtering rules to avoid
  test failures caused by missing files.
- Add installation of rdoc.rb and did_you_mean.rb files in
  do_install_ptest to ensure complete test dependencies.

[1]
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/ruby?id=4d4485442830bb52b152f0419f4ff9f1d581d46a

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ..._rm_r_no_permissions-test-under-root.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby/run-ptest     |  2 +-
 meta/recipes-devtools/ruby/ruby_3.4.4.bb      |  3 ++
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
new file mode 100644
index 0000000000..e3574f1a81
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -0,0 +1,32 @@
+From 9c4748aae4f69390a36875aa27d70c3c632ae944 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Mon, 7 Jul 2025 15:05:57 +0800
+Subject: [PATCH] Skip test_rm_r_no_permissions test under root
+
+Skip test_rm_r_no_permissions test under root user and Windows environments since deletion always succeeds.
+
+Upstream-Status: Submitted [https://github.com/ruby/ruby/pull/13828/commits/c510b5ac475e6d3eef935725d21910861816b7a9]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ test/fileutils/test_fileutils.rb | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/fileutils/test_fileutils.rb b/test/fileutils/test_fileutils.rb
+index d2096a0..80e3368 100644
+--- a/test/fileutils/test_fileutils.rb
++++ b/test/fileutils/test_fileutils.rb
+@@ -768,8 +768,8 @@ class TestFileUtils < Test::Unit::TestCase
+ 
+   def test_rm_r_no_permissions
+     check_singleton :rm_rf
+-
+-    return if /mswin|mingw/ =~ RUBY_PLATFORM
++    
++    return if Process.uid == 0 || /mswin|mingw/ =~ RUBY_PLATFORM
+ 
+     mkdir 'tmpdatadir'
+     touch 'tmpdatadir/tmpdata'
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/run-ptest b/meta/recipes-devtools/ruby/ruby/run-ptest
index de7c415aba..17404e3509 100644
--- a/meta/recipes-devtools/ruby/ruby/run-ptest
+++ b/meta/recipes-devtools/ruby/ruby/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-test_fullname=`find test -name test_*.rb` 
+test_fullname=$(find test -name test_*.rb | grep -v '/-ext-/')
  
 for i in ${test_fullname}; do 
 	ruby ./test/runner.rb ${i}  2>&1 > /dev/null
diff --git a/meta/recipes-devtools/ruby/ruby_3.4.4.bb b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
index 39e86fdd28..c532403339 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
@@ -104,6 +105,8 @@ do_install_ptest () {
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
     cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/rdoc.rb ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/lib    
 
     # install test-binaries
     # These .so files have sporadic reproducibility fails as seen here:
-- 
2.34.1


