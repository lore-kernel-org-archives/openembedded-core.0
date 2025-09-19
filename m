Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3025CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:58:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.10989.1758268821359100392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 01:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kU1rFmr5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IMiuT2031000
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lt6zaJJUCybzXfjwsaebl2okgs6U3I/nz0DrV9Yr6yk=; b=kU1rFmr5LkzKOuu/
	NxlMI4ZJTBYGmzX5j2X5MtPb4w0L5+EzUhcnUzdZGxdCJh45TzP7CcfDc+1wb+tC
	XOvYdoC4qsT1pEjauZNNVc5dnCoHbG9F5yz/Lu6NE1DQ1CkMgoIpuYlhCi76wWFS
	5ArcPBIQriTMiWLIsfvhx9G2mhIqgKavib7nEaqwfiMXHNN3gPPbR8VdCUrNjsOA
	U3p9xlxad9Z5IN6UpFlKHCx0GB8CSpJviEX2jefCohMbUi+IPtMY9FiZwqDb2Obi
	XI7eMtfPgjBZQyte53wbFhvWCHGqnFMnTzFLGnHFBrRfNlW4M6OWmlMbudrpME8Z
	YqFtYQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy11dqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:34:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58J7YC1k002382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 07:34:12 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 19 Sep 2025 00:34:10 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH 2/2] image-fitimage.conf: introduce CUSTOM_ITS_FILE variable
Date: Fri, 19 Sep 2025 13:03:35 +0530
Message-ID: <20250919073335.2069114-3-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919073335.2069114-1-kavinaya@qti.qualcomm.com>
References: <20250919073335.2069114-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gcjtyx-8k12OsHDN83pueA2IxNRCkpzy
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd0774 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MW15-2SMWwTvPjGnB3cA:9
X-Proofpoint-GUID: gcjtyx-8k12OsHDN83pueA2IxNRCkpzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/6asUgRAdH0B
 1uSDzQJKTEr/MhcDaoNvOd2ciHMP+iSI/cRf1UkK0blD6X0A5Iu6qOnNsVJbzz//Iu+OfH/hsPn
 0iRSqoer/9pioLhE7HNvP0JaIYlF80kDapCkvXPmVanoZhM5aGTV/tKXUKce4DkIMy6iBDh1sql
 CCT9dJ+2DodgOarSkmVLjIDAkHOLXgLgX+4LkFMp0VSiam4WdLL/zKB6+7BZM8Vx3i3ztWz2ScN
 XUJTPnG0aL9BMhUqCYzaWPM87DOqQsDuJNqeyp41zVbPjrk2/FmeQX4q6JiZekLC95GV6nUZi1c
 fWYzLc+g690obArcP/7b1fKi2fdGtzBN8X2FxEKaEe6F5tjtEOsMittbkQpOIMaXUumoyvbVmm0
 T+apmQbe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223767

Add an optional variable CUSTOM_ITS_FILE to allow specifying a custom
ITS file for FIT image generation. If unset, the ITS file will be
generated dynamically.

Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
---
 meta/conf/image-fitimage.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.conf
index 090ee148f4..619e70a670 100644
--- a/meta/conf/image-fitimage.conf
+++ b/meta/conf/image-fitimage.conf
@@ -44,6 +44,12 @@ FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst
 # DTBs are provided separately in a FIT image.
 FIT_LINUX_BIN ?= "linux.bin"
 
+# Optional variable to specify a custom ITS file for kernel FIT image generation.
+# If left unset, the build system will generate the ITS file dynamically.
+# If set, the specified ITS file must be placed in ${DEPLOY_DIR_IMAGE} before the
+# do_compile task runs.
+CUSTOM_ITS_FILE ?= ""
+
 # Allow user to select the default DTB for FIT image when multiple dtb's exists.
 FIT_CONF_DEFAULT_DTB ?= ""
 
-- 
2.34.1


