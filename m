Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B1BCA0FF0
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:22:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5909.1756261343730567159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oT83d4Rp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03344c73e5=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57R0olYR3045222
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dg28LNrWD+LuTLHKfVqO
	nB1BUbbMRltUt71apXZgPX4=; b=oT83d4RpGhODiJWMgDjzIvYPrnNmSjyZLoPu
	dzkP+5J3v8bWBitvLq2HySFKb/hSjqMVPBBFbOIQ90SY4iF5gXeSAHq2Ej++1x8K
	XONYj0mDiMsW5qLg+PsZW+AFkyuCmU6KL5Ri8v5vq7e6PMLF+g7a/QgjbAaqnkS/
	MDMS+igGyB93Fn6NyR1jzZhtsxpbehgs7XzLi0jnrClXUOKRP05+HvtDO3m9KafG
	HgXmTrY+U6GoeOnEMD3/gsmeYaGAZuArilz8qhxuiq4fKf+rI+Tz4838PYQqgbVE
	GTHVuAMMtwYLGP364ifExvviSahoyNAezOdyV+VSyEZ28eMqlg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1c2ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:22:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 19:22:20 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 26 Aug 2025 19:22:20 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] ruby-ptest : some ptest fixes
Date: Wed, 27 Aug 2025 10:22:19 +0800
Message-ID: <20250827022219.316255-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -Wb4YWKVFmA8R5QUS0GeHDWb2LWKCh5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDAxNyBTYWx0ZWRfX+t0zF9Lt4uaK
 CivdDlSCuySv67ApEvsXQx1I0V4Q0nCLxD9MzVYLR5IK9n2ykgCltUda7jQDBbElcmUF0oisvtA
 9cSboDe9emy0YyYtZxsZ/xOC3g22BM/G6Mli54YHe4e9SrKo58q8HCoqMa1FJgkNnatSLXXqCY5
 J8Rp6riXOBlzGbt9Y6/pzRM7WgxeWhMYB9803UCOwKrzbRWVW0p8qxiOp0cSP8e+gyhuwo/rffz
 c9Vm6QVNqy8LFPklcU7lHfMSzAwN7VLx7T6133AIuvd0aaT0aTMaLoEPjl3nJwTnq2cHiVKMss8
 vJlX5Fz8KNc0rP17L18wCi7clBpnwgo2s3AtZ4Oi3+u5FWarRwA1Jg6GM7wjtA=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ae6bde cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8
 a=VRnACs4msGeOSm0uVMcA:9 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -Wb4YWKVFmA8R5QUS0GeHDWb2LWKCh5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 02:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222479

From: Jiaying Song <jiaying.song.cn@windriver.com>

- Skip the test_rm_r_no_permissions test under the root user, as
  deletion always succeeds.
- Filter out tests under the -ext- directory in run-ptest. Due to the
  commit [1],the packaging of .so test files under the .ext directory
  was removed. As a result, adjust the test filtering rules to avoid
  test failures caused by missing files.
- Add installation of rdoc.rb and did_you_mean.rb files in
  do_install_ptest to ensure complete test dependencies.
- Add init.rb file to PTEST installation path.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ..._rm_r_no_permissions-test-under-root.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby/run-ptest     |  2 +-
 meta/recipes-devtools/ruby/ruby_3.3.5.bb      |  7 +++--
 3 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
new file mode 100644
index 0000000000..93ef3668f2
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -0,0 +1,31 @@
+From cc5e563f0fa5212e4a624b954fbc97cc6d8900d4 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Mon, 25 Aug 2025 16:31:18 +0800
+Subject: [PATCH] Skip test_rm_r_no_permissions test under root
+
+Skip the test_rm_r_no_permissions test under the root user, as deletion always succeeds.
+
+Upstream-Status: Submitted
+[https://github.com/ruby/fileutils/pull/133/commits/3c831389c5e1523af5869d025f573ff043486b99]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ test/fileutils/test_fileutils.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/fileutils/test_fileutils.rb b/test/fileutils/test_fileutils.rb
+index 481f913..a2ed414 100644
+--- a/test/fileutils/test_fileutils.rb
++++ b/test/fileutils/test_fileutils.rb
+@@ -757,7 +757,7 @@ class TestFileUtils < Test::Unit::TestCase
+   def test_rm_r_no_permissions
+     check_singleton :rm_rf
+ 
+-    return if /mswin|mingw/ =~ RUBY_PLATFORM
++    return if /mswin|mingw/ =~ RUBY_PLATFORM || root_in_posix?
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
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
index b37f0d03e7..8b45946f6b 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -30,7 +30,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
-           "
+           file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
+          "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
 inherit autotools ptest pkgconfig
@@ -102,11 +103,13 @@ do_install:append:class-target () {
 
 do_install_ptest () {
     cp -rf ${S}/test ${D}${PTEST_PATH}/
-
+    install -D ${S}/tool/test/init.rb ${D}${PTEST_PATH}/tool/test/init.rb
     install -D ${S}/tool/test/runner.rb ${D}${PTEST_PATH}/tool/test/runner.rb
     cp -r ${S}/tool/lib ${D}${PTEST_PATH}/tool/
     mkdir -p ${D}${PTEST_PATH}/lib
     cp -r ${S}/lib/did_you_mean ${S}/lib/rdoc ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/rdoc.rb ${D}${PTEST_PATH}/lib
+    cp ${D}${libdir}/ruby/${SHRT_VER}.0/did_you_mean.rb ${D}${PTEST_PATH}/lib
 
     # install test-binaries
     # These .so files have sporadic reproducibility fails as seen here:
-- 
2.34.1


