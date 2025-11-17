Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806C2CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:01:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12839.1763395264548200716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 08:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D3BwapJ7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH6F2Ik719851
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 08:01:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0kbJEHoFuGYDswFKCdcFeAYOzEKfjGYMNdkYW2vOdCA=; b=D3BwapJ776SP
	kW6zvWhyerIzKVQa45Zz3hKmp3a6H6746Iwzk8Ms0Y8E9FYoK2bbnP9frk3Ln3Jw
	bP1EGtNCP3yEU7To27y051iGto7XwZJg5WE5SWPIzevHHfVlrDuP1H9mYMPRT8M+
	w7hr5S1+nVUpg1pLhCwZbZLnYesAM+pbr2hJnxLDiqhIkcmzcxuSjQZ2jszKpngc
	vWG+2HG1gydebQTYtH2VhpwarV22ktVS2oxlHjol/RzEEUelfkjevieFyqwHxwhd
	TUnFVifMqRGQ9kN/rSXimw7ftUOfWZGMQC5nuMYeB7tqWLsB6OgyZp0Kt5Zpg/Rg
	cFTg7hZPPw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj9ts8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 08:01:04 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Nov 2025 08:01:03 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 17 Nov 2025 08:01:03 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] strace: 6.16 -> 6.17
Date: Mon, 17 Nov 2025 08:01:03 -0800
Message-ID: <44688dfc21de1913a5303fc8ed15efb2a5b87e06.1763395229.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763395229.git.liezhi.yang@windriver.com>
References: <cover.1763395229.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691b46c0 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=fk1lIlRQAAAA:8 a=Sv4y0yS6AAAA:8 a=QyXUC8HyAAAA:8
 a=ag1SF4gXAAAA:8 a=7CQSdrXTAAAA:8 a=zMjeY55z_wrD-EACQkkA:9
 a=5jj6Z5E1gPFHsPOh:21 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22
 a=I7ze7AG8jwQKfjVvUIqj:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: pGFM3WuoHrSv07KusGMtKuYre6Ix-Jeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEzNiBTYWx0ZWRfXyBM+1oOadIC3
 2Sh5rhE+hz2f6Bd3asVkzbRrQif7NiyaxSF76LNU+Gi578wZdCsK/dvH+p4rK0n3XART2xjhRa/
 OUs5CKUuWpt6GaE/T7z0MQRCCknhdzz95e7CttYz+tUTEFG15CCHjNXeGCvkU0vpHgW/bIHNIHO
 cmHwM1CYQCtkPcwG2TMbMPqTaUVjPpht2nrrpQLYrc6nUeMyOzWH8uxNYCgEiNiWc4eCP9/3SCM
 uKOCcJAQdAwhhuokQu687ImkpwnT3emUIcbhuP2oRJsVJxSiP2SyY3T/mZhX9gHy2AzYXTCzVOF
 ldynxIjTpZT6VSYWUzTvXMiOWst2ERse/jEb7bRm+baDI+YOW0oVuN4U3d1jSzlJWpxvngEFnKt
 nRFfLz7K81bStMX2kTmOeldDYGz9Dw==
X-Proofpoint-ORIG-GUID: pGFM3WuoHrSv07KusGMtKuYre6Ix-Jeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226500

From: Robert Yang <liezhi.yang@windriver.com>

* Remove backported patch 0001-tests-fix-uio.test-with-musl-libc.patch
* Refresh other patches.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...01-tests-fix-uio.test-with-musl-libc.patch | 30 -------------------
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 ++--
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             | 13 ++++----
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.16.bb => strace_6.17.bb} |  3 +-
 9 files changed, 14 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
 rename meta/recipes-devtools/strace/{strace_6.16.bb => strace_6.17.bb} (94%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 46894cd9d0..1750f34518 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 267989559370a9f34646bf8a02001755bf64fb25 Mon Sep 17 00:00:00 2001
+From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index ee379688bf..c633531f44 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 59077f39cce499d11de5b0a9c23c9ded67ddb22e Mon Sep 17 00:00:00 2001
+From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
deleted file mode 100644
index a879ca50ca..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7fadf6947761cc5248aa4a376bb9517481dbaa52 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Tue, 12 Aug 2025 20:02:31 +0200
-Subject: [PATCH] tests: fix uio.test with musl-libc
-
-musl-libc handles the pwrite calls differently than glibc, making
-the uio test fail.  Using glibc, there are separated pwrite and pwritev
-calls, however musl uses only pwritev2 for both pwrite and pwritev.
-
-To account to this difference, modify the expected matching regexp
-to also match the musl output (append it with an OR).
-
-Upstream-Status: Backport [https://github.com/strace/strace/pull/347]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/uio.expected | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/uio.expected b/tests/uio.expected
-index 98d5c06..2a712a1 100644
---- a/tests/uio.expected
-+++ b/tests/uio.expected
-@@ -1,4 +1,4 @@
- pread(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
- preadv\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
--pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
--pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
-+pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
-+pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index ca909d573d..093cedc233 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 69083e93e92437e8d9d4225fca71a053906a4af0 Mon Sep 17 00:00:00 2001
+From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 212eea8618..60562ae7d9 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 9d40d293ff73dea734f1353c354f51e51992a813 Mon Sep 17 00:00:00 2001
+From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 6e942b1..7a707d7 100644
+index d76b5c6..d4fc206 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 6e942b1..7a707d7 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -937,3 +938,22 @@ BUILT_SOURCES = ksysent.h
+@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 661ed2c7bb..3e66b15850 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 8bd827339ae72eab99dc9ad6a68b0ae98e5bbb49 Mon Sep 17 00:00:00 2001
+From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 34948fd2ba..20535fe005 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 46eceefb3bd184354cdaf0fd3dff6f2ad979aad9 Mon Sep 17 00:00:00 2001
+From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
@@ -17,7 +17,7 @@ Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
  4 files changed, 4 insertions(+)
 
 diff --git a/tests/clock_nanosleep.gen.test b/tests/clock_nanosleep.gen.test
-index 7a6025bbd..f0e6dbb73 100755
+index 7a6025b..f0e6dbb 100755
 --- a/tests/clock_nanosleep.gen.test
 +++ b/tests/clock_nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -27,7 +27,7 @@ index 7a6025bbd..f0e6dbb73 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -e trace=clock_nanosleep,clock_gettime
 diff --git a/tests/delay.test b/tests/delay.test
-index f74e27f1e..1510c7647 100755
+index f74e27f..1510c76 100755
 --- a/tests/delay.test
 +++ b/tests/delay.test
 @@ -9,6 +9,7 @@
@@ -39,7 +39,7 @@ index f74e27f1e..1510c7647 100755
  	[ -n "$denter" ] || continue
  
 diff --git a/tests/nanosleep.gen.test b/tests/nanosleep.gen.test
-index 41928ded8..f8a87cb8e 100755
+index 41928de..f8a87cb 100755
 --- a/tests/nanosleep.gen.test
 +++ b/tests/nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -49,7 +49,7 @@ index 41928ded8..f8a87cb8e 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -a20 
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 829973753..e89423485 100755
+index 8299737..e894234 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
 @@ -9,6 +9,7 @@
@@ -60,6 +60,3 @@ index 829973753..e89423485 100755
  r_opt="${1:--r}"
  
  run_prog ../sleep 0
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 193a4819ef..bf4a8cd123 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From c11380609788ff9c802d6527adc6b2c756d5f715 Mon Sep 17 00:00:00 2001
+From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.16.bb b/meta/recipes-devtools/strace/strace_6.17.bb
similarity index 94%
rename from meta/recipes-devtools/strace/strace_6.16.bb
rename to meta/recipes-devtools/strace/strace_6.17.bb
index 0552caa2b6..b6fda2b8ce 100644
--- a/meta/recipes-devtools/strace/strace_6.16.bb
+++ b/meta/recipes-devtools/strace/strace_6.17.bb
@@ -14,12 +14,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://0001-tests-fix-uio.test-with-musl-libc.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
+SRC_URI[sha256sum] = "0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0"
 
 inherit autotools github-releases ptest
 
-- 
2.49.0


