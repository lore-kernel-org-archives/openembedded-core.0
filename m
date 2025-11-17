Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B69BCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 01:23:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6489.1763342583625648098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 17:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VFauqjmD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH0U1j5894351
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 17:23:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Z+xvr2Asydsj7vrXjDl5
	AWyXS1CZqvSm+2mVz7zPUVo=; b=VFauqjmDRUnkEcyHeJGUvUDoTYzlBmVn8clp
	bttB6Hyvl9wvbOTOVmNhVTFtNkB4G9QdZM1BIYILVlFVyT9JoP4A2H6EUog9mWYp
	xuejEkfryAp8SJoAlAlGIz8aQwl4ZDTnehED8Y9upiLPjWgsY2tYSgu7OgVnb2DM
	/sPRn7vCtTeXzXE+ZgFKCY9NGpeO9dOT8W8zS9+zUnRqAFFyy/J6V+Hbn3PRHvRE
	Qw42NrR6K4OkKDjZMV3JuOlt5+u0TMjlfdPqSYHlH6M7Xt9KdgTRIXPhTVcllwTX
	xH4TYcOv1isjZoe7gkN4H7AxJK3PV6wVtHsQzfzCZnBy9bCm4Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2s97e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 17:23:03 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 17:23:02 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 17:23:02 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/1] buildhistory.bbclass: Warn when PRSERV_HOST is not enabled
Date: Sun, 16 Nov 2025 17:23:01 -0800
Message-ID: <cover.1763342137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAwOCBTYWx0ZWRfX5DKpo8Ph3+/s
 jlyaeeJ1tdWR2jx5YgVETYw8jB/PVZ98BVxtEXxj+OW2Lzo/0pum42wTUBknKuk0+6dEORV4gXy
 uP3RGo+diGlmXvVynj6+YNEDv4w5cLCJLCVO2AUBFYuUTgTMu0FOWm3N0pS1QgTjl3KuzE4SM9t
 qvQrMCyY7a1tX0s06ITTV7OPNFmYMOKz6cUkPJWLQp4nhSUnEFsN1ruxcT+OgEFAak3KEno0O0O
 TNVUPC8NP0sCYYPMnYelI+rkjk84YfD2ZktzbWSCDMZylMzn6VKpqnuNSBf7vFiFxAuk3DaNNj9
 7qJvpdookb90qMcmR9Bg4gw+CJjdnkUjPyNt8m4t+Jk3HNFXuij9azX96Z7SPC8G3rmuItcjPaH
 aOMvKE+vRgVoSLtMCz9Nv2L8uwaNFw==
X-Proofpoint-ORIG-GUID: I9sdjsqznum4nXJn4B3ZXRzkSjoVoFt8
X-Proofpoint-GUID: I9sdjsqznum4nXJn4B3ZXRzkSjoVoFt8
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691a78f7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=rHLT89JPf7ryYbrCVA0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 01:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226480

From: Robert Yang <liezhi.yang@windriver.com>

* V2:
  - Only warn when version-going-backwards is enabled as RP suggested.

* V1:
  - Initial version

// Robert

The following changes since commit e7dc42e30c76bf0fbb4d3cc019bbec675bac55fa:

  oe-build-perf-report: relax metadata matching rules (2025-11-16 23:44:30 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/warn
  https://github.com/robertlinux/yocto/tree/rbt/warn

Robert Yang (1):
  buildhistory.bbclass: Warn when PRSERV_HOST is not enabled

 meta/classes/buildhistory.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.49.0


