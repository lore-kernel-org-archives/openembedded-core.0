Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DA0FB44BB
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 06:48:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15739.1777013288917154821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 23:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZKv+C3SM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8574518e23=li.wang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O2TtIA1346664
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 06:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0Xugi/q7v
	tvI2CGNbnFiQCj93dlastLe1uK8OEaqc0o=; b=ZKv+C3SMe3UZFoFeUc84NMVUE
	dYasB0q+v+eaeolrUfaj6sw4ko0Laxg4t+LeyRgABZOBJ7UXnaqQxry1s2MDyJlM
	kD6XDGlkYf6PdK7n0ZMsh8ZSU4nFiwZxjZsGAq8sahFcbNCfwI88GDDY+Uedzf2S
	iktbHU+Nqag77VG+wvudWePKUxq3bX/BrBHVJroBg5jJfwx/X8vU8STuM87vPO4q
	2Ca8yd8RqDcap34o4tWu95l40jWUNri0KVsdiHF15VDQwd1rWyMCRXI1YAVyAOVr
	o4f6ZdADrKSQqvWmoGDP2BcOLvkRUQsMonaQ56H/UKgR4s2Gb1ntRUymwFU9g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8u89mrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 06:48:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 23 Apr 2026 23:48:06 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 23 Apr 2026 23:48:05 -0700
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <li.wang@windriver.com>
Subject: [PATCH] perf: disable llvm by default
Date: Fri, 24 Apr 2026 14:48:04 +0800
Message-ID: <20260424064804.3331766-1-li.wang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA2MCBTYWx0ZWRfX2c+KB/cad93K
 BOVFntdxi6aRyREdfvI4ow+7WOkfR5GS3UNA4CTRPc5A//TYlyr8UcgQAdXeWojY90xswXz1dit
 wjz01GIZbOi6q7vSbqzUPTsPMlJfWjv0rSSW2eoJZd9MKPwVedbNvnu3Hy3yU9fP/uJdC7Qksat
 Duw74KHvENfoi0LxH9HkCj4jQ9ns1Z+p3MkFip19NZJZ0XH7/DT8Agd4E/LKdohFt9UmIB1YFDb
 lB7AHl5vlDPptJMfvRdyz65VmLykuuKBI09S2lAyNp+HjHodsimxukBjv0n968yxSbrIwizMksK
 wrbeu+3ATuQRQZ9tFevvQnq937BNxEIMkFZ3yI3pdqZlTxQflm5QsceconQP4zVfnJJpsmSgbNp
 Ae23zINDpS9aGytHybbB0tE8fftPkljkLQ77LU8j0QPqBexSSP1BX/iq8sUBy+KgWK0kul+h5bC
 rGLkHISb75DrtQQf86g==
X-Proofpoint-GUID: aZqxXGMFEkPI0IsJbbgkWZFyfuGfQ02C
X-Authority-Analysis: v=2.4 cv=WLNPmHsR c=1 sm=1 tr=0 ts=69eb1227 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=0queYyUspli9MP_rPrYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aZqxXGMFEkPI0IsJbbgkWZFyfuGfQ02C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 06:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235838

perf.bb does not include any script about llvm. for avoiding to enable
llvm option under uncommon condition, force to disable it.
Maybe a future improvement would be to add llvm function.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 7a58088462..f9e2b9f4ee 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -114,6 +114,7 @@ EXTRA_OEMAKE = '\
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
+    NO_LIBLLVM=1 \
     ${PACKAGECONFIG_CONFARGS} \
     PKG_CONFIG=pkg-config \
     TMPDIR="${B}" \
-- 
2.49.1


