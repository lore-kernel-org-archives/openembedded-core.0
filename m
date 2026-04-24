Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31A4FE51F2
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:21:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17440.1777022454682702380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rBHraFBX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8574518e23=li.wang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O3uQZi3966594
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 02:20:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=SXIsaeRzi
	H85Q+7as5Q2vuR0HMh2sxMH+ci/hVLzvPY=; b=rBHraFBXyVCfiJ4Zh+2DHwDED
	LIp1OfTygSK4kPB5rk+u525dIZkd76yVwqUHE8pq2o3Y5Q2y4Oxq2s6WOtPpiSsA
	+zqnl/vY0413gFYK2UYFO05/LnlPPHqg/B0GbjrnZ+xXEWIOllVUJWiVTK+FKORV
	F96YX3xaSvh1lFbXF0ABTzOPpdhP2fol8h+a3RAuScGRqRdS0ZEvS+wCl/o3nwTW
	71lUIjiKNPlQnKqk762eRkxGgtYk9IOkd21dwUfyt7f/0dsULnoBlJsledhdJPzB
	JKtlsx5CIfwTR3gAyz3Clh7ACoxuxYvzd/7s4A7txJD8Ac76MVaC+QqVTTfww==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8rcstes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 02:20:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 24 Apr 2026 02:20:53 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 24 Apr 2026 02:20:52 -0700
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <li.wang@windriver.com>
Subject: [PATCH V2] perf: add PACKAGECONFIG for llvm
Date: Fri, 24 Apr 2026 17:20:51 +0800
Message-ID: <20260424092052.1485864-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: axZ_Uyi4XSV-ljNfNpsBflSTROTw6QIC
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69eb35f6 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=JXP8E5rqUi0behDgYIQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: axZ_Uyi4XSV-ljNfNpsBflSTROTw6QIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NSBTYWx0ZWRfX4ZdAFTeKUMgl
 MlFLfyX6WLJn9Skti8XyCi6VRI/b3OzMiI+c/i60oUPPRFLcDjaYWu7DAQkz7avkxM2Iv4GWbpe
 618V9FRLau/xMejj2v714GlA9CVrf/L88KX0hjS6RK+kYmZupV58kCQUibXDG7lJr19+u+AXRux
 A6/FVbCZG5tC7IDErmwCM34eYOEMkTW5A986y15+r+6SqeltAs9e8QvforLSd1eqvvJN0u9c+3E
 Om177VsSeUYgfM9BmBz7D+mHBwrAZ7aETDbeEEW36E23XfYxjX0/uu6dQ0AOHqcIkt8hrrpjU/E
 jmEG8tri4KRcw33Vnif8IcInJY/UnGgPI2G99m/pVQDzMCto3kZQoipT8ApPLUqkdA1wreL/rHv
 12xC7VqSiLj3wQsW9RhKiFlSU2GQ+gdEbQa0UHqEmpxrFsExfpAoUqkBRu/P99ypDbaHTk8WlgN
 s0jAhi1+qB4Uqaet8zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 09:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235849

for avoiding to enable llvm option under uncommon condition,
make llvm controll under PACKAGECONFIG.

error log:
ERROR: perf-1.0-r2 do_package_qa: QA Issue: /usr/bin/trace contained in package perf requires libLLVM.so.2x.x(LLVM_2x.x)(64bit), but no providers found in RDEPENDS:perf? [file-rdeps]

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 7a58088462..f24b44954e 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -39,6 +39,7 @@ PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 PACKAGECONFIG[pfm4] = ",NO_LIBPFM4=1,libpfm4"
 PACKAGECONFIG[babeltrace] = ",NO_LIBBABELTRACE=1,babeltrace"
 PACKAGECONFIG[zstd] = ",NO_LIBZSTD=1,zstd"
+PACKAGECONFIG[llvm] = ",NO_LIBLLVM=1,llvm"
 
 # libunwind is not yet ported for some architectures
 PACKAGECONFIG:remove:arc = "libunwind"
-- 
2.49.1


