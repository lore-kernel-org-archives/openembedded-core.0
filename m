Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA4BCA1017
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 03:40:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31185.1756957233087516612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 20:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r6R1Ikn2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134255f852=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5843eMxE2248631;
	Thu, 4 Sep 2025 03:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OIGEj0GbkmUBnOt7VtRnRlpEe0Y37w2JnxujtSOhR20=; b=
	r6R1Ikn2ZD8djM0B79Z8tY3CufbegBuygfEzG9W5Q8khMP6f6NTGlCpqKfsxaZa3
	MiJRdFaDyM9Hqr16YM7pfm8MR0LUNeeKWVCPnYB0gwUe+09/iv8Kh1rodLmGQoRV
	vqEgjxMGxi5pLHjFFX7pXB0OZhnW54qW32AHVo5MPRVHn/jWZzQXxcjiq4jd304p
	e/vl5clAzhGFp2lnvJXtKFhS7p3F6LW2wB6Gdo6z2k0Tl/Lu3oEZd31BUoJvp0zh
	N7iyJH/cKlpe8Y7eiY3NTErupiRBSzmmpDzm38VSPZKR9EAKlZr7PUF4dEdquFJZ
	0uYnb+SvNCf1lgsTiqfVRg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y0ygr2ux-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Sep 2025 03:40:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 3 Sep 2025 20:38:49 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 3 Sep 2025 20:38:49 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH v3 2/2] libcheck: Fix do_install error with automake 1.18.1
Date: Wed, 3 Sep 2025 20:40:39 -0700
Message-ID: <ee51f1e7cd7a1f7505be79c2e24684786907dfdf.1756957117.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756957117.git.liezhi.yang@windriver.com>
References: <cover.1756957117.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDAzNCBTYWx0ZWRfX6vxXisHM5Ifv
 wfye17RnPzQjJJRx3jqRGX7LsvqX03gH4ymQ25kThvlN4xlrj8tT+v1+Z/x1HTKJdt0xC24V/0T
 sKL3GBPBixHdC/vOVqSgRAzCy/FgOHmZHvOUgoA/VWq2wwvual/RUsLJvJ3eSXcYgfjg+1CrbNV
 BUsUlxToB5tFDCgp7K19wYaXN7oXWbUJsr7/f7JMpKszy7MTSjlgPlnFbNgwE+hvnAuXUaK33n/
 HHtYARDTnHpI7sMe3Z7VPq+EM1WG402UCqeC897ABzZOwSDdZ8r3P3gnOKH9FMF3rDKT9wwkgq1
 4TO9VGEDoAWbVKYEsaZQSEsGTY7S0oy0G2wczQWZhix8TYzm6wR91qsVesMNQQ=
X-Authority-Analysis: v=2.4 cv=T86MT+KQ c=1 sm=1 tr=0 ts=68b90a2f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=AJu5Q4vYAAAA:8
 a=pGLkceISAAAA:8 a=c-a_u_9LjXkPQtd8mooA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=1OHxEZ4uPFp8rhvYjniX:22
X-Proofpoint-ORIG-GUID: fZCmBobXzjLm5ch2N_TWVgaubEodDmoT
X-Proofpoint-GUID: fZCmBobXzjLm5ch2N_TWVgaubEodDmoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222892

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
index 33f8f54888..adf95f5040 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
            file://automake-output.patch \
-           file://subunit.patch"
+           file://subunit.patch \
+           file://0001-Fix-texinfo-errors-and-warnings.patch \
+"
+
 SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
 GITHUB_BASE_URI = "https://github.com/libcheck/check/releases/"
 
-- 
2.49.0


