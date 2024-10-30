Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61302D74968
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 05:07:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7929.1730264868614586544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 22:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10330b2ea0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U57Ja0019350;
	Wed, 30 Oct 2024 05:07:47 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gnn0vkgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Oct 2024 05:07:46 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 22:07:45 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 22:07:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>
Subject: [RR V3][0/7] Support SPDX include source for work-share directory 
Date: Tue, 29 Oct 2024 22:07:39 -0700
Message-ID: <20241030050745.3702603-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZIuFmm7b c=1 sm=1 tr=0 ts=6721bf22 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=24AZYWMyAAAA:8 a=_m_OQ7XaKNAgo1gC_v8A:9 a=bG88sKzkDEFeXWNnvthB:22
X-Proofpoint-GUID: 7Lr40u0OemoDmaWC9Qrkq6HZgMij2Xsb
X-Proofpoint-ORIG-GUID: 7Lr40u0OemoDmaWC9Qrkq6HZgMij2Xsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_02,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=918
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410300038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 05:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206537

Summary: Support SPDX include source for work-share directory

====== Testing ======
* Commands

1. For SPDX 3.0 

$ echo 'MACHINE = "qemux86-64"' >> conf/local.conf
$ echo 'SPDX_INCLUDE_SOURCES = "1"' >> conf/local.conf
$ bitbake gcc-source-14.2.0 gcc libgcc gcc-runtime gcc-cross-x86_64 nativesdk-gcc -ccleansstate
$ bitbake gcc-source-14.2.0 gcc libgcc gcc-runtime gcc-cross-x86_64 nativesdk-gcc
$ oe-selftest -r spdx.SPDX30Check.test_gcc_include_source
...
2024-10-26 01:33:38,475 - oe-selftest - INFO - The spdxId of gcc-14.2.0/README in gcc.spdx.json is http://spdx.org/spdxdocs/gcc-f2eaeb0d-b54b-53ba-899a-8c36c21139bf/88d5068ffd41e5ea6b4e0dd390b23bf499bb2b6674a41e09eaf2a887eced16c8/sourcefile/42
2024-10-26 01:33:40,794 - oe-selftest - INFO -  ... ok
2024-10-26 01:33:47,890 - oe-selftest - INFO - ----------------------------------------------------------------------
2024-10-26 01:33:47,891 - oe-selftest - INFO - Ran 1 test in 261.233s
2024-10-26 01:33:47,891 - oe-selftest - INFO - OK
2024-10-26 01:33:59,913 - oe-selftest - INFO - RESULTS:
2024-10-26 01:33:59,914 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check.test_gcc_include_source: PASSED (253.93s)
2024-10-26 01:34:00,304 - oe-selftest - INFO - SUMMARY:
2024-10-26 01:34:00,304 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 261.234s
2024-10-26 01:34:00,304 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

2. For SPDX 2.2 
echo 'INHERIT:remove = "create-spdx"' >> conf/local.conf
echo 'INHERIT += "create-spdx-2.2"' >> conf/local.conf
$ bitbake gcc-source-14.2.0 gcc libgcc gcc-runtime gcc-cross-x86_64 nativesdk-gcc -ccleansstate
$ bitbake gcc-source-14.2.0 gcc libgcc gcc-runtime gcc-cross-x86_64 nativesdk-gcc

* Expected Results

All builds are successfully


