Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770D5C61DF4
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 11:50:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.96830.1700758789548057085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 08:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=gg2OQie/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANEjtt9019611
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=zMOvTGigdILcC2sybCUb7p3dMbhOxC2fo+AAP4wH8AI=;
 b=gg2OQie/ZBLBGlL5Q0bcomEGBWPSsP85fjoiLguDVl/xyco/KDT1c2tUuD0+ClXOAfBW
 KlxemZuGu+i6kxsPCvlKnB5giXPxlvoUg/O+IVzbFZUf3QJctxte9+0w+HXXmItNbv3J
 cprgQ3RHmQ9mCN/ijAKPb/ewpwSprvgoTVBXrnwO0RapT6GFubkQR7fInt4pEgfuxIY9
 e7R9Q8I6ssYa8OGnpec+DGCALP4aXXvcIh6+jkpaZ9d/gz0oXOvmvudgdqXNUFZeQt16
 lVQvFtFOIYKo2L2yYkhn/ddz9jxmTYMcTcRvOowRtjTaXjMztL8AJmgRaahdWkPtegiX kg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhgudbe89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:59:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ANGxmqt006052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:59:48 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 23 Nov 2023 08:59:47 -0800
From: "Viswanath Kraleti" <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] Backport armv7 compilation failure fix.
Date: Thu, 23 Nov 2023 22:29:26 +0530
Message-ID: <20231123165927.1868468-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3Q7ApA9-QS1HPSZ3rlHCDN-1xYRMdqYL
X-Proofpoint-ORIG-GUID: 3Q7ApA9-QS1HPSZ3rlHCDN-1xYRMdqYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=448 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311230125
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 11:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191226

systemd v254-rc1 developed a bug that is causing build failures on armv7. https://github.com/systemd/systemd/issues/29381
Upstream fixed this but OE-Core recipe is yet to catch up. For now, backporting the fix to unblock.

Viswanath Kraleti (1):
  systemd-boot: fix build issues on armv7a-linux

 meta/recipes-core/systemd/systemd.inc         |  4 ++-
 ...n-Pass-all-static-pie-args-to-linker.patch | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch

-- 
2.25.1


