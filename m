Return-Path: <mark.asselstine@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00DCC76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 23:36:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.889.1680910565701566821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 16:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iiWQchWm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34617237bd=mark.asselstine@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 337NDpq0013120
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Apr 2023 23:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=vJCbobhhMnsesUF4ajei/TI9mez1h7qmM3s6QsFxGlk=;
 b=iiWQchWmG9EYdW10PVEiiUdlpqULGvqgfejeGK6ibg49FJz7RbClvV09TnOSmF9smAcy
 sHr+IT5Cw5p5HmSPOBEd4eEkc9vNwmDddpj9hLJEdSSgTzcSyeZNdBSmOmI8ce1LKcj1
 MmitOh/cWRW5aY6Cv32OpMqbqNXApaZSOcC4nwYcRs+MlxwF0MGghxNdmv0GVOSsrQ0x
 22rlXSCDdtpJz3pQzUtv2/vAS98bZmTLJ/dMYykXhmuE9ljcJSxm+60Iel+qhAZnnH/7
 +NUNatsAXRJcZv2C5ZTKWOuopkOnIn5/JPrMNWPfidQaG0t7jbahuMu7VB6FOFZZI/R8 jA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppbkbqfn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 23:36:04 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 16:36:03 -0700
Received: from YOW-MASSELST-L1.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 16:36:03 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-psutil: fix-up -tests runtime dependencies
Date: Fri, 7 Apr 2023 19:36:01 -0400
Message-ID: <20230407233601.170-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Kw2km9d4HPNU0MftZrJWBqWXx-gS7UM3
X-Proofpoint-ORIG-GUID: Kw2km9d4HPNU0MftZrJWBqWXx-gS7UM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_15,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=913 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 23:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179828

The psutil.tests module makes use of gcc, other tools and a minimal
set of headers and build tools. If these are missing you will see

======================================================================
ERROR: psutil.tests.test_process.TestProcess.test_weird_environ
----------------------------------------------------------------------
Traceback (most recent call last):
 File "./psutil/tests/test_process.py", line 1452, in test_weird_environ
   create_exe(path, c_code=code)
 File "./psutil/tests/__init__.py", line 831, in create_exe
   raise ValueError("gcc is not installed")
ValueError: gcc is not installed

along with other errors related to the missing tools and headers.

Add the missing RDEPENDS for the -tests package such that simply
adding the -tests package to an image will be all that is needed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python3-psutil_5.9.4.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.4.bb b/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
index 54d5784a0d..c0977c74d3 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.4.bb
@@ -24,4 +24,18 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-resource \
 "
 
+RDEPENDS:${PN}-tests += " \
+     ${PN} \
+     ${PYTHON_PN} \
+     coreutils \
+     procps \
+     binutils \
+     gcc \
+     gcc-symlinks \
+     libstdc++ \
+     libstdc++-dev \
+"
+
+INSANE_SKIP:${PN}-tests += "dev-deps"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


