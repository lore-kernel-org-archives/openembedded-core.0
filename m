Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672D7C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:17:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84478.1749554233546236342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 04:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8256183154=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6vdPA004642;
	Tue, 10 Jun 2025 04:17:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm2ngy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Jun 2025 04:17:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 10 Jun 2025 04:17:04 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 10 Jun 2025 04:17:04 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <ross.burton@arm.com>
Subject: [PATCH v2 1/2] libcheck: Fix do_install error with automake 1.18
Date: Tue, 10 Jun 2025 04:17:02 -0700
Message-ID: <6aedab09a7f412f62c9cd853ba64ecfb6572b07e.1749554012.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749554012.git.liezhi.yang@windriver.com>
References: <cover.1749554012.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aCZDKYHChABjabgsj7gbA0PuSe3HefMZ
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68481435 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=AJu5Q4vYAAAA:8 a=pGLkceISAAAA:8 a=c-a_u_9LjXkPQtd8mooA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=1OHxEZ4uPFp8rhvYjniX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NyBTYWx0ZWRfX5UQnikdQIqRz cccQ07lA/eTpyc6Slz/0GpgZsnIrJtZ+trlVDcSMVEV+V2MZ3dKu0t0vwlseu6E+aVO4t2pfytE X3TnluWajQ/nH0ob7luj6mEkHJn/H5wPzkUW9Uc5XEdr+LjT2SZ3HbgHENeAFruYXUmIKqirLEr
 hmirPxFK91uKIjjhinJFOlSdRMI37WB1jE9oDTXNT6KB7Q2C++W0J6AJSeVXAoUetNo3uWgqrgt XOh8U9RWIyGFpDwwW1Mekv/Ll99JIBX2pwwR3Akwj3hwmH6cJC6INAUk4NegJAeGoecG3Se57Eh lxKHDKASHeUDfBob2hTxp8PTAOGbrpl1Va4ST0o+SyzOUbXqtsQpKG6P6pyVnjQXV+jjhTATddA
 gh6nFSsQmXXleLNOhVjP4UwUg6vC24VFpOFCuid3ML/Y1Z1LpHeztWSot5HJDiLUL1xJJg7g
X-Proofpoint-ORIG-GUID: aCZDKYHChABjabgsj7gbA0PuSe3HefMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218343

From: Robert Yang <liezhi.yang@windriver.com>

Fixed do_install error with automake 1.18
$ makeinfo -I ../../check-0.15.2/doc -o ../../check-0.15.2/doc/check.info \
    ../../check-0.15.2/doc/check.texi
[snip]
check.texi:2329: no matching `@end verbatim'
[snip]

The automake before 1.17's mdate-sh couldn't update libcheck's
doc/version.texi, so the doc/check.info wasn't re-generated, then we couldn't
see the build error.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...0001-Fix-texinfo-errors-and-warnings.patch | 60 +++++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               |  5 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/0001-Fix-texinfo-errors-and-warnings.patch

diff --git a/meta/recipes-support/libcheck/libcheck/0001-Fix-texinfo-errors-and-warnings.patch b/meta/recipes-support/libcheck/libcheck/0001-Fix-texinfo-errors-and-warnings.patch
new file mode 100644
index 0000000000..1edba3f1e1
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/0001-Fix-texinfo-errors-and-warnings.patch
@@ -0,0 +1,60 @@
+From 6cc46c8ac0bfc012fcb6b0fd27e20d8c06c50919 Mon Sep 17 00:00:00 2001
+From: Jerry James <loganjerry@gmail.com>
+Date: Thu, 16 Jan 2025 09:42:41 -0700
+Subject: [PATCH] Fix texinfo errors and warnings
+
+A missing "@end verbatim" is an error with texinfo 7.2.
+The warnings are due to menu and navigation mistakes.
+
+Upstream-Status: Submitted [https://github.com/libcheck/check/pull/361]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ doc/check.texi | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/doc/check.texi b/doc/check.texi
+index f6852bc..b241961 100644
+--- a/doc/check.texi
++++ b/doc/check.texi
+@@ -112,6 +112,11 @@ Test Fixtures
+ * Test Fixture Examples::       
+ * Checked vs Unchecked Fixtures::  
+ 
++Selective Running of Tests
++
++* Selecting Tests by Suite or Test Case::
++* Selecting Tests Based on Arbitrary Tags::
++
+ Test Logging
+ 
+ * XML Logging::                 
+@@ -974,8 +979,6 @@ easier for the developer to write, run, and analyze tests.
+ * Test Fixtures::               
+ * Multiple Suites in one SRunner::  
+ * Selective Running of Tests::
+-* Selecting Tests by Suite or Test Case::
+-* Selecting Tests Based on Arbitrary Tags::
+ * Testing Signal Handling and Exit Values::  
+ * Looping Tests::               
+ * Test Timeouts::               
+@@ -2048,7 +2051,7 @@ If both plain text and XML log files are specified, by any of above methods,
+ then check will log to both files. In other words logging in plain text and XML
+ format simultaneously is supported.
+ 
+-@node TAP Logging,  , Test Logging, Test Logging
++@node TAP Logging,  , XML Logging, Test Logging
+ @subsection TAP Logging
+ 
+ @findex srunner_set_tap
+@@ -2255,6 +2258,7 @@ your CMake build how to find it:
+ 
+ @verbatim
+ cmake -Dcheck_ROOT=${INSTALL_PREFIX}
++@end verbatim
+ 
+ Then use Check in your @file{CMakeLists.txt} like this:
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index 5ab67b8728..ab9684f03c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
            file://automake-output.patch \
-           file://not-echo-compiler-info-to-check_stdint.h.patch"
+           file://not-echo-compiler-info-to-check_stdint.h.patch \
+           file://0001-Fix-texinfo-errors-and-warnings.patch \
+"
+
 SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
 GITHUB_BASE_URI = "https://github.com/libcheck/check/releases/"
 
-- 
2.49.0


