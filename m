Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E316FCD4F3E
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 12:18:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7373.1763295530868859818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 04:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LiKga4/Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341579856b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGCIo7A3171004;
	Sun, 16 Nov 2025 04:18:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5MRXD9l6C1l0tgyC7D93
	fk1JlexXSgdpEHIacLLMD8g=; b=LiKga4/YawN2DKbOVasfVAWGeOSvyB+JrRLQ
	lz+TwAZISoVBpAgPV9HH5B+OeUoaWL2JNNx+ciP/TOFrBi36Tn8iuno2b1mWsc4d
	i5rWbNsZJITndsTFRorNbjP2oaTVk5k+6IDthTE/b8wca96Pw/4xaWPlHqpQUUX0
	oOK/ATw53Crk0u6BCMcqbI55jPNXndxGnh0giOWP2OZhusCgZeR/+YOc63J+iNNR
	KvPdMmfIB3bRmEZ1gSi3HlOcjJUPONfN51GEAlxxvN1RRJAfP+J7XPA5u853wfmh
	tZL+VQJgVpVWaF7eIv5F+6jQ+wSJHyohrRLVmBlTLliMT0hqoQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj8t0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 04:18:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 04:18:49 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 04:18:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] buildhistory.bbclass: Warn when PRSERV_HOST is not enabled
Date: Sun, 16 Nov 2025 04:18:48 -0800
Message-ID: <cover.1763295498.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=6919c12a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VRglFjIKULn3Jcv-Mn8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: C_XmljazHuhPB1fnsOymhQxOOp6j3ZKZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEwMSBTYWx0ZWRfX2pKTPijzwPeC
 iEkCeDQEI9qpC+DaSGpqXs7ZDEoLoWvtyH7wKSxsXiGsDfWcQCU7wZSKKNxZ0xnCCuZWMC2t5cQ
 cin7JPKfrlxFaNliTf7Prxjd8+3z+tTaoo7/o/rNwYjS/uuLuByZckD8jSK2lB/c+cJKCicxXrO
 +4EDVRfg+TmkPOAFcIZMWzQ6fT3d8k52JtUal+dZAsgzIjGhr1oYYx/aCtzbs2oHGdmujepxxYw
 sOxjysPQ6WXsmuTQTObm8xNiTQ1V+RDSNeqPwjMaI9DbnBqjCf803DU7Fi19vsZEZag6HIOxrtS
 6JMwWfmJ1hH6CWwRsyhaVB4N2kux/6EVfrbALanAUT28R+F4ShklacO5qtIcErZHpHXSrhfpgnq
 lm+CYxBNk4X53pUf5Af/9SNhvcgzlg==
X-Proofpoint-ORIG-GUID: C_XmljazHuhPB1fnsOymhQxOOp6j3ZKZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 12:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226473

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit e556df28f47e754b53e1f46c97dde2b19fd8fad1:

  tcp-wrappers: Remove support (2025-11-10 17:56:48 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/warn
  https://github.com/robertlinux/yocto/tree/rbt/warn

Robert Yang (1):
  buildhistory.bbclass: Warn when PRSERV_HOST is not enabled

 meta/classes/buildhistory.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.49.0


