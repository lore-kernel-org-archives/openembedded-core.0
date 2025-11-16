Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE86FCEBF61
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 11:54:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7107.1763294063082799064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 03:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lQ1rRK+8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=341579856b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGBaq4x342296
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 11:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cKo4gQEksWi61BpBoMtx
	RzBWUBVHjTSfBFOP/UUFed0=; b=lQ1rRK+80qvTMiLcwPt3OOHM6vXDjW+29Flc
	PO5MRj6qP0EpF7mJIpfC8INb9f+gs22Ot6wRMN4Q40dV2wsLSFTr52BWXzWRm77M
	YAQOXx6WP9u16i4EoXmg4MmTP5eU2F++NDFSJWzBsW/ZgymJpQOgB29VwaHNpUi4
	/kwSCqDuGNHIPPxpZJgJJuznnBzbQZ3fWNiIEwAwcZpjosK4OGsaLKOFp0hQHQ1u
	Na+DWaS86g33uRq1RF26MlyPDkWacPdjxxjtX5mZ0zFNyjUCZqs1NN+SF2cV0ZUo
	69b3khByiTS5ijvTXgMToKzMuXTtR+enNwMbZoP3xTseTPXi3Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aegg89045-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 11:54:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 03:54:20 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 03:54:20 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] package.bbclass: Fix base_ver for AUTOINC
Date: Sun, 16 Nov 2025 03:54:19 -0800
Message-ID: <cover.1763293945.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDA5OSBTYWx0ZWRfX+aroJ4ESGkYL
 aQZTH0cWq4dIHLNwcjYZnJ5+f8Wf/p5cRgbcNy7nFXW2AuFtyQXcI8SMTI0gkcwSxjIx6nbWegA
 qQxqnm30B6v/68j3j6VCWm9h+/EX0MLKJTCqpiSJXSzqHB2ec4B11rvivxEP3u1a0CArGB4gKAG
 OjXaUmVpzbAQw0hVOkuZxBrEoYdnQM1o8mlTuNKZLC7Wc0TYxzfSKlQXfY6RfAZzEE+JcUGMPw2
 qk++UNSNfViWFkm/8scYelB1OSeZOiuVYYGCuMOq0yZ4KA8MASuyfbH2cYohsXssP5p1aerWpDJ
 cnzhB7yIZOPVt+apJVqAMo8OajIu8Gj6T94yXZaGwiEGtbYR7IHhpDxzu9zdgLr8GLnbiXOCefO
 hfYB7xKQoVTkmkkF0Oq25TLX5sS/Kg==
X-Authority-Analysis: v=2.4 cv=U+CfzOru c=1 sm=1 tr=0 ts=6919bb6d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=VRglFjIKULn3Jcv-Mn8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8rpb2VaUnr5ZpM1-p9m9puSMlxvURXnI
X-Proofpoint-GUID: 8rpb2VaUnr5ZpM1-p9m9puSMlxvURXnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511160099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 11:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226471

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit e556df28f47e754b53e1f46c97dde2b19fd8fad1:

  tcp-wrappers: Remove support (2025-11-10 17:56:48 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/autoinc
  https://github.com/robertlinux/yocto/tree/rbt/autoinc

Robert Yang (1):
  package.bbclass: Fix base_ver for AUTOINC

 meta/classes-global/package.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.49.0


