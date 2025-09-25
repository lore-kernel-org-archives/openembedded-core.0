Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CAFCAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 08:44:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6761.1758789866572680769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 01:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wr/ajtzj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=136376ca7b=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P5HkqZ2967302
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SZpJDGeTls/fQ4KKMi/Z
	ZRxC5cg1VHLp5RTqoM5rxfI=; b=Wr/ajtzj+Qa2OSO2sRH9LDmUmd3N/f3yC0L3
	chbEfGfmsiR0o4uZ3L8ZD2zz1khHKoUbG+owGxQS/TIjCnz9/TbgHk1krjN9ambh
	sNo9phWDakt2EUDvfFuZYYULJO1xXgkWBX8ExSPrvDjGOPPKVw+FJb1mTbK/sKEP
	VCnfowfByta1B0ttnqBPd5R8nLrHw39hkhsjenZwHHXmKoAUmhjPXEA26knd/7CR
	A57fk6rprMWc7QWkSanLyOR7tMbTo37vxi43ujalMN1CwdSoTnG29d3BMfHuCaXB
	/KGRfMqnqzQ9Z+ZaQmksjcV0JBrhk5R3Jr/7kBmElPC0Rl02/g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499k89e08s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:44:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 25 Sep 2025 01:43:44 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 25 Sep 2025 01:43:43 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] unzip: remove invalid UPSTREAM_CHECK_REGEX
Date: Thu, 25 Sep 2025 16:43:42 +0800
Message-ID: <20250925084342.721827-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA4MiBTYWx0ZWRfXwGpILWW8RWfO
 BwWScgc8437TVoiJ1yxyNjliyAtXXMB8asf6H1LPg+EfFu8hDpkBuuq6eINDSijF55L9e1D4eAo
 oevaa/7wOWUt+I4i8Z2/90No4ph4EzZYYg4K5q1VJT1S5cpuvJ/gwNg1dMoLEyXB9/Er34DXCRS
 zV3QLYcMQnMCTOJ63t/v3DORXxykw37c4lJ53qrqiWnn2tJOzAF9SrOmOepqZ6oJDq92LnTzuia
 ZjSZ1A+Z99sNHgcZMJlGRd5OU/20/VIipqEooHK6Tm1bUzUFeShDtOnCM3nGKbSOui23UAbw24e
 oOXubVxF+m3OjtbJGR2UFiuKX8af40wlp9jQtoCvYId6b3MkQNV1OIoycUvKKw=
X-Authority-Analysis: v=2.4 cv=YZS95xRf c=1 sm=1 tr=0 ts=68d500e9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=OIXoLciMPPAE25Qm30IA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: K8sJU4iYtG-DPAjPCKohwJQeCln-gkU5
X-Proofpoint-ORIG-GUID: K8sJU4iYtG-DPAjPCKohwJQeCln-gkU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224006

From: Changqing Li <changqing.li@windriver.com>

After SRC_URI is changed to sourceforge, this UPSTREAM_CHECK_REGEX
become invalid, just remove it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index a07df8c319..1d22855e1c 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -38,9 +38,6 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
-# exclude version 5.5.2 which triggers a false positive
-UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
-
 S = "${UNPACKDIR}/unzip60"
 
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
-- 
2.34.1


