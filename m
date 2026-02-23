Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED62EC110E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:54:57 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40018.1771865689387849582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 08:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=s/soFZdH;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=nJ5+kvNV;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=75145000c1=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFLSMB731228
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 10:54:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=0OLf3y7QHYE1QEhdYSckHLO592x
	CBgKg6/6jgEqKO+s=; b=s/soFZdHo3dtYx7cxkDSerXG17Mgvk21twhZx9N/V7r
	VsfQ1fxA7CWmMcXHxgrpSZrfh5HaEDq5YbSSS72JUFqyYkcndaA/8fGK2sIdafMa
	7OH1zCDJniqJ59+yGiEpi/8dmgKuoPaVPeh5lK4HwSSesJRS1OapYmGvN+Pq0dFQ
	2uAloRo8g0HavfOx7/OeXS7OXHybuc9x8AB3lu4Oxyqp/S28+Nd1MhFVetEzrSjy
	bZ3mxPQ7KcdEBf5jQYWKjdMdM+20GZj2uzr6E4AgeRsSP4MktA7PrJj6vsaN0RZB
	7dijbeDO+tPesfmBCq4rdEWhNluMvWAlvxoxwxmCqrQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021130.outbound.protection.outlook.com [52.101.62.130])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4cf81tmkv7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 10:54:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCNB+Vh6F2g5+AGRjzE8IPEqwynbTGZ8otiXhHESiexooz4CvLQOu9nWOEiXpbA6vmKhmtLNVsOPTI8KletHS7/rtnO3s3mGn1L97XhfnR7gc5xFQMABF40EgrqZYrWYEt0nz3ETfMraJ/rGqTIgekxaLVqqY12dG8KQLYvLoNpjNs5rEEX7lHbhqIPBQoWmpfs4JOfNJpj7IohQUQRTmxtfyyh3ntQTELBECHxQnRaoe9mK27swWTX/tWTz2Qe4nT9/TgWDCt/nT+3On9F0BfC2fM3tKQrFYKghMeEZD2YFXox49IkXbSg17ydLK959iLXkHAOdrQGUNrumwSSjdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OLf3y7QHYE1QEhdYSckHLO592xCBgKg6/6jgEqKO+s=;
 b=khd11POwSK8GOR8b4qSMUoc/WOezj7ZcpQo557mszlQzFYlUgBVA6hswyCE6ITQ/NL3S4qiHdgbf4QNsGyc2QWMqgq7yQBOZNQKe85qAyQ5DOY/R9rnvb3vecta62QFuuoJPdJZSwuB5eHGbrdk/irRNt3bQIxP7PZv38bATQX5rf46kzs85FZqwo5U1zlzNtXw6l2o30/J9jdVQgbRNXCTq6d0cHgMm6U0tifsJTQ5oHCifj2yxtdAIAA9TLiP17+n2W1KGNE3F2MmBJNNNMZpSlZvu8rpsWNWCek2Vw2XKL0sOuZLBJ7YGJCBSZ4RKf/dW0zvqkLmR/fAeuobOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OLf3y7QHYE1QEhdYSckHLO592xCBgKg6/6jgEqKO+s=;
 b=nJ5+kvNVsw/vQ4veINpGvuv43vFxUk/LLheYdkiKFRtYB6IcSsFlVkdi27M07uchFQIgI438I5/ZcQ3DfFR4j2OkhDctTto6O4yKxnGNDbV3R0cm/7zeddgEJYonyPrgfGj/wn7cXuS3+Kll8PMrl1DGg8onDmpiQeQJfOxbYDM7g/oiZsqdQGQ/i0JGH73taImEv1GtAVwFWHkS0ZAbt6mmtQC9BJ1QwbieO/+n8PU9TV9ks/Ded2s97PYU1TJZQgoLVv/gFP7DLBOM6qFaPTmXN1dvfbN7XPmzw5F+Fb9Fdf6Ypvk6wsBYxT0DTIgKYFivUrIMkRuMP50+rHXtIw==
Received: from SN7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::32)
 by DM6PR04MB6828.namprd04.prod.outlook.com (2603:10b6:5:22a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:54:46 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::7a) by SN7P220CA0027.outlook.office365.com
 (2603:10b6:806:123::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 16:54:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 16:54:38 +0000
Received: from KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) by cv1wpa-edge1
 (10.60.4.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 10:54:25 -0600
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Mon, 23 Feb 2026 08:54:28 -0800
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 23 Feb 2026 10:54:27 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.72) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Mon, 23 Feb 2026 10:54:27 -0600
From: Colin Pinnell McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [kirkstone][PATCH] ffmpeg: ignore CVE-2025-25469
Date: Mon, 23 Feb 2026 10:54:03 -0600
Message-ID: <20260223165403.799551-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM6PR04MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 27af8263-e8e4-488c-7f5c-08de72fc3b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8pFw8IMVB+ri3xYUN7+c5PK3Pp2/L06Yj1YSWnMOPXpEov1xmRYOAONHb7k8?=
 =?us-ascii?Q?riosHhMcmOx+qY73AST83xxUMHNIC6rm+lpZUvY8C69yVOmWKbrr7Mz5QmJf?=
 =?us-ascii?Q?PnYKrqCQkZndp8ncs0UGndAcrp+GmbvkhlJRstAZX3iUk4NS0s9O7H0pIsHA?=
 =?us-ascii?Q?fFHGfbrUrhWoBHzDcJtSauXIx0YDVGP62oLNLn6OSi0X/M6ZVdrg/p9gAKsf?=
 =?us-ascii?Q?cY93HO8QZt+LdcWpa5xIYPTtw8L7bQQ5t2tWmlJuEpw2MWkKr0+qPcpV5dqD?=
 =?us-ascii?Q?Dbd76HzgTsc2/okGVorzAU/f2jIMUJPtUkWzJlHUBj3ckZfXEUC7dvXx2g+a?=
 =?us-ascii?Q?jJr+h5R3E0QfPk1Dnw++ghhEfEwFL6BmfKdZLDhxZCwutlehWXOAF+N9m5Ro?=
 =?us-ascii?Q?nxudqVDav8bnijYXfRh7VY3/Cetthlo1cfRkyTS9MJybXW44eqleWj11aExS?=
 =?us-ascii?Q?EK96lQbMYNIMFraXIm8amnxvBqY8umQpKAFlMV+NwdqUcxgTh4U70sw2kQ6b?=
 =?us-ascii?Q?Q719Egd1pVRx0GfD99CZVVlLqQaZV+z2L9AKwREjsvOVQwizG0hnp0XFDl4N?=
 =?us-ascii?Q?ZAxDNPXqRKgtkzkji9xd9pU1CxamuyvGk8cVW8UZ/YSVeTY60zVaunMWoCyP?=
 =?us-ascii?Q?aBlyzROx7RucHXG8aYzMgEUEM2st9o/f0O1ZOKmwZNemiE7axFsG/VIZpzmv?=
 =?us-ascii?Q?rrXyWsNIWeF0/mQNC/+K78x6rKox0imsg2Zf8PAAb7sZ2Ujy8ZjL+FdRsuCh?=
 =?us-ascii?Q?33Dbo5Sh0FUj3pKEgEiQBr61UWbZ9j66qX+fH5AvisLcD5eLrWH/PueShcaN?=
 =?us-ascii?Q?tFRqVmUx6X0ex7SPaEdFXxdVgprZPisrHD8CoV+MRjCSklSWFmOjQZAKs58z?=
 =?us-ascii?Q?I0eDtj1Nbu4/SWdmaKoTreFSR1dveYYRy6/n8slWMBVUmPdcxM5OdLn9tL+v?=
 =?us-ascii?Q?EXkSWqnbfoDrShx5CDiayI8hE6xhG183Dbrpp0SfTYizcpuc7QG6EhQ/ZsgC?=
 =?us-ascii?Q?jt/F5X0gLw1C4AuEucoanRHA1GMRPEjtDOq26RIRWCbHx3E+u+pZWrXazgrm?=
 =?us-ascii?Q?QFZ+H8bq63QTO57tJVyhAmq5WLl56vmdPRr9MpV5uI8WvjYJu2Kf1vwqOuB+?=
 =?us-ascii?Q?UQ38FgAl+KB7hyuc8opcKVcjtY2uBf5pMa/R2RXQyTjrq6RZsR8eFFOS+Oxb?=
 =?us-ascii?Q?KKcdAZueXoDpTZEmqrwhO/3wCfarBe5oQw9XDiXO7MAt40SUcARkvGz3uEWX?=
 =?us-ascii?Q?1esTIWZ6CXJ/xLm+MXewXuGwB2LM5d1XbZmzJKjm77z92rxWzFtmiSdRP36d?=
 =?us-ascii?Q?O9LxUE2BqJtRuahHg2H/wS+J19lHyQIV0TKLS87RgOp++bWP2k9nf9WNhP4l?=
 =?us-ascii?Q?2zFJGKvOELJivIe2rUxhjW7F7IuVMnVmd+YWt5SAYSmKZnf13EZadjTjK1Bp?=
 =?us-ascii?Q?89A9/3NeK5/5/zKCjUYkuLECIi7moc2Fzb03OQo/2VKoCE8k9LGwlHXJQJFa?=
 =?us-ascii?Q?+3gejvlCeTvB5nF6jLQ8uUA77+16AAkKN2dAqtRxUwCvYJK8Upq0hOvLyWnM?=
 =?us-ascii?Q?V6VElYAur3F/CEp0kx69fGCHYmaNSV1W98FjQvgYMVJp0f8r14QXYe66ZClA?=
 =?us-ascii?Q?xw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u5HdMuUFwAHnTjc+wEDRy7rJrpkYlL3Wk4cmERTF/U23wHIPlnLFi2RK2IynRlteBCo1AZlbJ+YS/CYhyeK5z3cEVgggVhgRHGGzAx4aAvvhXmAJylTNzRmJq7C8R97KFRIOHLICUKlsi23ziuAMPmKPpgwV0RYNrkntDvvkr4f4dCOKRGg/6OLnXkMsi765UX890VTD1GWvIDvf7lqATsuiolNLD7w4khpwZ5wSA80XaBRW4uMS1MbIPZjPhhNMb3KSrcM44y8LSIqQJ5uSMpnwGXgz2c3QMf3IbDwdFvSduKfAHNBV1ev1KHfikrzXCuEEOpWWE7DsgQUcmRhJQMJ01C6Vwm42b0SgVC3vovLrj71npYA1INYBeeY2zaG2PAEc4F/N4Mt/jINIy+LxQeUQN05bJsO0BGjw06Fdl+n+38CRPMp5RJ3uqQ79GECV
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:54:38.1890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27af8263-e8e4-488c-7f5c-08de72fc3b27
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6828
X-Proofpoint-GUID: VdM_aeShhP49wypwimEvOFZVD49Qp99C
X-Proofpoint-ORIG-GUID: VdM_aeShhP49wypwimEvOFZVD49Qp99C
X-Authority-Analysis: v=2.4 cv=AIVl8Rsx c=1 sm=1 tr=0 ts=699c8658 cx=c_pps
 a=7kgNGXaSmB15KJ6u7rEBag==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=qm69fr9Wx_0A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=emhf11hzAAAA:8 a=iGHA9ds3AAAA:8 a=NbHB2C0EAAAA:8
 a=9vYKFdbn_Dj7vmk6n58A:9 a=HLUCug_QN4oeKp6PugZw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 cc=ntf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0NSBTYWx0ZWRfX79YpYaV27sYu
 hIn+VmweNpS+2IfSMno4nLtoh9cE3noY+AvqxdtNUlpXeeu7383sOTT6I+n9UEdVaZF0guW3ZUC
 v/eWGoBW9ZCSs8vArEeOG5I6PEipRWqylND5DYM4VPdmnYcLCN/tYQoLHq7JRhDcciLp/L10gxo
 LIJnf4Cs+bp88JPyK2RflPPPwS7m8cxjnxa1peD626EJ5RXk7dnE1HF4EstWZe8RLZqoqcca4eP
 z1YIIGw6R+iqwO13oVBS44iC+AnWZcEbEfeDedTqrvaZcf+sV3ALYuL3kuv2guudWGwFmV4FQ9z
 pvwSSEAK9Slbs2MOu46hX9bGhZ26zBgs4xTyWltqgy4ft8OC/90mBwJ9hUba2m3yASufLCFeZem
 6J1KCLz4vmXwB8cfXRrPHYclv5woBiPQJUWs9DSCzAeQNn0+jnpytOkvG9vEykvvRlDbDTzE3B/
 KFukuA44EDQV0LUY+Br8CLkOwh31HOQoavrqCJtE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602230145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 16:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231682

Missing free introduced by commit d38fc25 and fixed by commit d5873be.
The first version tag that contains both commits is in n8.0, so no
ffmpeg release is vulnerable.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Change-Id: I91f0aaad8ddcfaa2acac541470aebc9abe88b0d4
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index d64b97e787..eb21cde89a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -105,6 +105,11 @@ CVE_CHECK_IGNORE += "CVE-2022-3341"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3
 CVE_CHECK_IGNORE += "CVE-2023-6603"
 
+# Vulnerable code not present in any release
+# introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
+CVE_CHECK_IGNORE += "CVE-2025-25469"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
-- 
2.53.0


