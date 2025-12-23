Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E3BE6F07B
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 09:44:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98053.1766483077211205203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 01:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=njEfX33i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4452ffbab9=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5v9vB3026359
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 01:44:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7YeqwWKL0
	AmLoCbf4AKDlVR0B36wGZNb14qXNbo55qU=; b=njEfX33iHvxpkRvkRyj1l2ff2
	+rRYMWciCsS1Eg5WuXDOT6Y3SSX2U2X3m8HOdnhD31UgYT75g6tTlsD6gA1m/6vz
	zlH6nSNkJH+HdBeW57zvxzaA5ur+uUHiGkYiOYiXrio1gf6pKNcfz0YpBKfPR1lm
	u+tlZuNEoPonTbtD9xp/oEBtWWY6+tPpnGIxhaJR1wmuEiyfIWRtJFcRssCZRbyL
	t70ilq84uxqZK92LhPZW/EilKppMQvfBhD4Ez1vlnuq+u8V+eBlpzc7qHWQ6w6xu
	RUMAjou1DLjS3K08seKio+awTr23pCMJ9ExozSjYScuvsnPkLAutxJy/KkY0g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6hajxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 01:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3ZOiRmbwRPfKphOHdtpHufZ4jKJMpbvY2hd38TvAWYfW76LniMx/0VMBqZVFUUkNbk1oheUI9WCavTdswh+J+KxAk94abF8SbB03ajleGvpKNEpVfMdo/B0I3eGT3krnLIYAE7BkqEkRSpDwhiRb+do+D7Y0TiOJEew1VVN+OEm/knae84wK91kE4x7kDtsgOI1ke0wx4XqktxmLUbvntz1Nt11DwwvysSkKvBV5c6b1kfcKmgVALGACcIa1t7O4lnpPju8k+ib9lRK+nhnYCnSRwEQhMQeeIusZjmOgNAuGxtHwPzbS8KCOGHruE+vAxmwsJY1di4XwLF57w5UhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YeqwWKL0AmLoCbf4AKDlVR0B36wGZNb14qXNbo55qU=;
 b=JFxk9IQ03457JeYxYk6sAcdYBni39t/wYHkffiFb/FeyEJf17vQsPf89nv29YF2NXqILF586JmPf4mx3bCxbT7qdmCN5yrVTE1vRPc2gaodQKX9DpEZyBHVgjp9H8SyQNt4CJetS78g3BMAWasHkZCO+TtZfoKneSrud5KeAX4Ncsw63mRCiRFPL3n+uv4LiLoHdm/r6X9yiAU20k1TM4UD2uWCnLglpfD4aubpAJGDNyMixiGGrbWz2vM4Vq2nKGtG+a95mKqmQgEedG8YXrm+GWxxVVXjNpDf2k6s3Gx4mr1bCIzsUqQj7wVCKDPV49z6qyviqEHEbluwcFpVA2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 23 Dec
 2025 09:44:33 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 09:44:32 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, raj.khem@gmail.com
Subject: [PATCH V2] gdb: Upgrade 16.3 -> 17.1
Date: Tue, 23 Dec 2025 01:44:11 -0800
Message-ID: <20251223094411.2919323-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: d2906fec-b29f-4cc8-ba7d-08de4207e002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cM4CJLFSg6kkLBSKjQjt6iD/VD5ZtOpECexjAhF211ANneXUvTyF0a0Vxdst?=
 =?us-ascii?Q?BahGtgOMSQTEFAXMnMnRC5jhCQR0toBiRP21Y23d8zwUib8OmjooxZRHDqEW?=
 =?us-ascii?Q?gh9Sa/b3kdeB5CbmqJjNzXABbaSIDAwK+2ggwnliLu3ZSknndfGOrdXNPcuE?=
 =?us-ascii?Q?bZbwOdORZ3tI0+jXT8Yz4xpFFsfHMBHA7lZQ/pV5wJPt2REf8kYZXj/cyhed?=
 =?us-ascii?Q?SRUAj3ktM4fCGWFiIAKFASsZXSQucMwcElTJ2LBCv72t8N+dWBbPBWCb6aut?=
 =?us-ascii?Q?jVwR4M+7aIO8C0n5mdTX1YXdKlEIFulQ+ePxI7+VxQvHgF0jHReIX0xpZzzc?=
 =?us-ascii?Q?CHzW6PM5jJaqZRAzKX2K8xYRS8nMhqK4YzxX7ZWaTBotLc5JrORdzoncsUnC?=
 =?us-ascii?Q?4uMyDzeTLGOdPAm664d6Wnd7QXg4oXAdC2Q7rgJEgjW9WzfL6LrwD+XfbffS?=
 =?us-ascii?Q?IxgzHyD8/hCmGIaN1r48xngTSJ/VBe012xTtNiKM2VO/eBgpgZ7Qu6bXvYvI?=
 =?us-ascii?Q?lAikBXYhl7YVG9AEo0xA/nkjoI79pDrJ68HxDrkVnLKmDJwLFPZHAteRfBML?=
 =?us-ascii?Q?OisAFte+gH4R1PSc0RYt1EDqIE/BbPzaaVlOvka9YLpp3gXec+Q4D0HdVVpP?=
 =?us-ascii?Q?iNn42ThTlVnWmy8n3CpOJFPjJetDuFocIjmeeYjf+Zkl9emMmRVeB1/vExqU?=
 =?us-ascii?Q?G8tAC81qwSkmxIqAvU3ZkKYE3ddjgSoN6GDwsmCmtVKwyfw6UK72iC0cuu1a?=
 =?us-ascii?Q?KlnSzdjxmCe6p0I2HWHW+NVnldQIsBtjPyqsvK8sdeash3s5m3oZ6VV2uWLv?=
 =?us-ascii?Q?ReNr5mPBnAvITIXPUjhh8IXJm3egNBAMVifWU0U3Z9TVUBR336VucMA1MMWo?=
 =?us-ascii?Q?zJc1IXoGRFAd2o16jBVCmN7kCSQgsHPFKe2kVCI2eK/Ln/VOyDFYf/cORWsM?=
 =?us-ascii?Q?RnxPnx9jhF3ZWtNjDYP2lYjjKEKXuzD6LVOgXLMeqnUV9MRQMmaJHs2/VGsR?=
 =?us-ascii?Q?Le9zxrQCa+wtrMzuxGfY7Hm6PAoLnoMIVxZwVtYuT2oW4v/O8BNDmtLykeMz?=
 =?us-ascii?Q?IfhA53Gc+7tY9K0BHz9zHAnvcRoWTyClxWqUEOeJTaOulFqSEqyrTYGdn6Bg?=
 =?us-ascii?Q?AX2CGVhcvR9rck9aVxLfquSOXQ4i5THvl0XOq9OyOk1zl2o27sGQhMoBf7YI?=
 =?us-ascii?Q?Td/Q02RuCEtoWSUAN1i0ekoEQwq+wsL9vclROzN0Xrc+pjzcSYKina+OxhjO?=
 =?us-ascii?Q?ImvS31UdJT8pH6SOuKnGat7a9bTGIOhUEqKX4R9d86yFsTDc7yjIOeGAzAVd?=
 =?us-ascii?Q?MDTHgTdojbEOk//56k53ZBz4yCrT1y32nHacwyooyIfWX9qoxwaHIP24nbiK?=
 =?us-ascii?Q?OhrkII6u6fBmk2q7PCyx7s7+fnhNIbDMiH36BOfROiMQRUbrbkvrk4B8doNC?=
 =?us-ascii?Q?o13LQUENRq4ZhEQ72Do6XhA0BjTl7ZxxjIfo9Sw3xr/tgJQGneDAIeyok/Lv?=
 =?us-ascii?Q?tkES+Y+P0WK8mca19VSI2Hj9M9FHTdhjQ7ZN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MiReALhEQbyG51e/6Ovyrj2QYmLFyawt07SnWuta/TRFjrIwmBtwJBdZEK0E?=
 =?us-ascii?Q?FsNocfZEGGeq2jCtf+TfU3m+JA+KeKJQuzBvof3pk1TmOruU/S2psr1b8feZ?=
 =?us-ascii?Q?hyKz1/eH5Yu6LJ7DWFzjfuHyj2OsUY4lv/HVuc/ux1+uAQW2gQ2pWIVE7efh?=
 =?us-ascii?Q?pU2vXYnxHsZnEHTKX0qh5Xm5ouiaocuf8SwLSidFcgUy8tegJt7Wjgf/Lbcc?=
 =?us-ascii?Q?3gFclCXpV7cR23t3DYsF0lYMdQ0nPW5S8lmKhM0/JOOA1SHNy5ArYx5qIWP3?=
 =?us-ascii?Q?5mT50zon+OkyvEZ9/XLdo5GGbhFBxtqxaKgKBn8Cr4FbEJxDy09os1jVsczf?=
 =?us-ascii?Q?7aV71TGk4LHNKNsyayzE6LRQq6GJww+AMlFCboTNWXpP4Y1B/m2TLqz871t+?=
 =?us-ascii?Q?b7Z1S29V5x/q8X7egJwcASWrPsC9cdf1ovk2ge4v7aldtd3yrQ98iZuwr4M2?=
 =?us-ascii?Q?3TE4Rnsr8CQXjcQJZ2CIY8qrZarUM2SGztDbhIzizEgod+aWSGmscmF/zd8H?=
 =?us-ascii?Q?+LauLF640LPqaAtrnb+XrzwtvcEbWTsHThI0hJFaV2P4/vYEXFHCwvRH202b?=
 =?us-ascii?Q?RyZP2gPV/9hxhHk0t+Tp5sqvxadGR5i43bEBONCHVGrewM3I75FzCPUCuKJN?=
 =?us-ascii?Q?J3ImfpocBbo11lAk2eOAt6JpPYKHvdE7HpbItxfeH/NgxzqkkqnCkL2CAxG0?=
 =?us-ascii?Q?Tj+KiGDMAOkcbWtnVD/qUlGKgEXvmtVByACFNPRcoNP4a+qSPGpOa3uAYxJF?=
 =?us-ascii?Q?+5zqGFLqO9qfvM9lO/86CZ2PVNmTo0Z6o/Lyh85qE9r61u+Ez1l8H0VNTSAI?=
 =?us-ascii?Q?YaFtJ0CCwwlkSQPX8tCgyrVqOtamchHVbZZNPSwo0SwsMriq9OZSxQZCVhZk?=
 =?us-ascii?Q?IlIav0MwGSaw5CHtnXwpQSYkth8vjuQzSE49iVBT2rs1okLS+HkcRka0SLX6?=
 =?us-ascii?Q?QXKRV8yNoLrCvpiZ3Gt+mq9esZUh/gMofySDRzAqXH+gGBC6oic3nSJjz+MW?=
 =?us-ascii?Q?pqqkt6AmvLegjm0pEJ0xRj3SeezimTedS3X2W0OuL5DitgzdjiZPcLnLyUNj?=
 =?us-ascii?Q?lZ91uBCPB/bfYcSS0js7xw55i1rQOmQiLK3km0Av2TeloyD1UE+BB84J/GKO?=
 =?us-ascii?Q?dZcdkOPDNpkYunAoHOPncQ7u4rfXKeracv68KKntcrXLJU7DEt44Vfc3/eIg?=
 =?us-ascii?Q?yET2X4OyJbzw9yA4UU6cu7qmBwLsKtOXupQYSVZah6ceWRMd+6KMDAI4wCfo?=
 =?us-ascii?Q?XJt/QvSL8e1snKwpknwqOkMr1yrEveI0vWOhVAQAAXGiu1xbcQxeV3ev49dc?=
 =?us-ascii?Q?YiqA7tFJwTW89cz1dP3vAf9ry/3hD4POV2E7PxHJXzv7CZwn70NlahF/pHXp?=
 =?us-ascii?Q?Cc4iyKyzRybNaypk1r6QfmW0dslSYYWBNrrE+4t5XH7u+BdBNweRSbH2YDaM?=
 =?us-ascii?Q?2gZXsdZrOPsuUFr/eQbzW8fhHyl1XULsbqQtg9oIV5zgYzFYGoT6Xgd0kVSz?=
 =?us-ascii?Q?O86B+kGc6RT64fzNPI0O9DHHVAFj3ciuI4yj3Wi29EIct8+z4/QLBsWlPy9v?=
 =?us-ascii?Q?62PwDYA2fl6mLpE5e+BZpKO4HWmJZysY7ImpvovAfP0uLlAfV3PtycOUA35d?=
 =?us-ascii?Q?jwU5RhKHxjOjdUKbVcb0njiMS/KvZ/nTXv1v/s0l9aFUqNpooCUua1DYmxLh?=
 =?us-ascii?Q?76gqRaoIWrJDkSMhS70W9QQ6sdlPU8IBYi5ughKkaEpV8Ly7xfMLM5XS9eCB?=
 =?us-ascii?Q?y2gr0OnPizk9HgEn+G7RmVWrqrU+AIU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2906fec-b29f-4cc8-ba7d-08de4207e002
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 09:44:32.5495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9F2tUI5+4MoYVJz1f6j38kTiWukOjU163NQ5QBjtd9m25hBv/6KPrfHCO7fSFLw/vd3Kev3u4jBREarDeAUOT0Si1mLfLHNgolG+60aFlpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NyBTYWx0ZWRfX7KS2AZUu91j7
 6+bDze9JMK36RjIa7L8j1vF01ISt1N2xO64Vrn5cIKPLCYCjDOGMfFGBR90EZ9JEXJMC09rwCfl
 /cTJjMbmkzLEmjCDukOVWPes6v9zgG80ILCjQ/y26ywirJ0L+xYuKfcGQRQKvrEsG+NgH6WWwLX
 PivPtL8wipHU81o5RBmoouB7/Bziah3xmWslw1ohkPO1GT8etC9sGdDSW+bh4TA76Ak0kUkGCiz
 Nqa8QXzeT+Q2ke3gYxGpztcf9lFM8QniBq9ljqaVxnfbixNRarL3X4jgPrPQdfDwoXPQkqdLpac
 hA4KLRGqwfEziSWqDTZklyqmEKWoh3MxaZ0t64WB5nK+rf7IDvH6JZF11n7XixEUZFYV3bqMXbv
 gsavV5zqnnq5YGuqeG/1MMnObEVp4+PV0uEIwJ3HKNa6pvQoDoJPXqCV9H4fyD1B/85xxljp10I
 MIXIjeRtaQwuqpUrH4A==
X-Proofpoint-GUID: MLd5JQRyV9zfQEtdZkfmk4s6tCftsTIY
X-Proofpoint-ORIG-GUID: CZoZuCUHWzR1lYJyxckaFoJ3kjqgBYOA
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694a6484 cx=c_pps
 a=2WPJyM168hjBdVADO68ohQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=_Av4LFCC2tL_8mt7_qAA:9 a=iPGtbt74fZXhYC1z:21 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 09:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228461

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

GDB 17.1 includes the following changes and enhancements:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release

 * x86-64 CET shadow stack support
 * Debugging Linux programs that use AArch64 Guarded Control Stacks
 * GDB record feature now supports rv64gc architectures
 * 'info threads' command support for two new options '-stopped' and '-running'
    to limit the list of displayed threads.
 * On Linux and FreeBSD, the addresses shown by the 'info sharedlibrary' command
   are now for the full memory range allocated to the shared library.
 * Linux checkpoints now work with multiple inferiors
 * Improved linker namespace support
 * Warnings and error messages now start with an emoji (warning sign,
   or cross mark) if supported by the host charset. Configurable.
 * Built-in support for TLS on Linux as backup when libthread_db is not
   available. Supported on the x86_64, aarch64, ppc64, s390x, and riscv
   architectures, when compiled with GLIBC or MUSL.
 * New command "set riscv numeric-register-names" to display risc-v
   registers using their numeric names instead of their ABI names.
 * The Alpha target now supports target descriptions.
 * Python API enhancements
 * Support for Python versions older than 3.4 has been removed.

Dropped 0009-Readline-8.3-alpha-release.patch

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   3 +-
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------------
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 5 files changed, 1 insertion(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a36f78fe67..97d50123a4 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,6 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-Readline-8.3-alpha-release.patch \
            "
-SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
+SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
deleted file mode 100644
index 206b4baaf0..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 8807681557d9f30aac819186369ee62f4f8d1d96 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 22 Apr 2024 10:41:37 -0400
-Subject: [PATCH] Readline-8.3-alpha release
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/readline.git/commit/tcap.h?h=readline-8.3-testing&id=69e5c5e4c9778bf86c3d1c6b058ddece70854de8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ...ap-Add-function-parameter-prototypes.patch | 37 ++++++++++
- ...d=cef614441f99b7b6e444ba601d8465a6e88f5a98 | 67 +++++++++++++++++++
- readline/readline/tcap.h                      | 14 ++--
- 3 files changed, 111 insertions(+), 7 deletions(-)
- create mode 100644 readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
- create mode 100644 readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-
-diff --git a/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-new file mode 100644
-index 00000000000..f28e31fd0e0
---- /dev/null
-+++ b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-@@ -0,0 +1,37 @@
-+From 0c16af6ebf0bf81138c973e5e6a7c4ebf71f2489 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Wed, 30 Apr 2025 10:41:12 -0700
-+Subject: [PATCH] tcap: Add function parameter prototypes
-+
-+GCC-15 with C23 dilect defaults expects full function signature
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ readline/readline/tcap.h | 14 ++++++--------
-+ 1 file changed, 6 insertions(+), 8 deletions(-)
-+
-+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-+index 859e6ee..2b22ff7 100644
-+--- a/readline/readline/tcap.h
-++++ b/readline/readline/tcap.h
-+@@ -46,14 +46,12 @@ extern char *UP, *BC;
-+ 
-+ extern short ospeed;
-+ 
-+-extern int tgetent ();
-+-extern int tgetflag ();
-+-extern int tgetnum ();
-+-extern char *tgetstr ();
-+-
-+-extern int tputs ();
-+-
-+-extern char *tgoto ();
-++extern int tgetent(char*, const char*);
-++extern int tgetflag(const char*);
-++extern int tgetnum(const char*);
-++extern char *tgetstr(const char*, char**);
-++extern char *tgoto(const char*, int, int);
-++extern int tputs(const char*, int, int (*)(int));
-+ 
-+ #endif /* HAVE_TERMCAP_H */
-+ 
-diff --git a/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98 b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-new file mode 100644
-index 00000000000..02e665b143b
---- /dev/null
-+++ b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-@@ -0,0 +1,67 @@
-+From cef614441f99b7b6e444ba601d8465a6e88f5a98 Mon Sep 17 00:00:00 2001
-+From: Chet Ramey <chet.ramey@case.edu>
-+Date: Sun, 14 Jan 2024 15:19:37 -0500
-+Subject: Readline-8.2 patch 8: add missing function prototypes
-+
-+---
-+ bind.c     | 4 +---
-+ patchlevel | 2 +-
-+ rltty.c    | 3 +--
-+ text.c     | 3 +--
-+ 4 files changed, 4 insertions(+), 8 deletions(-)
-+
-+diff --git a/bind.c b/bind.c
-+index 971116a..2596006 100644
-+--- a/bind.c
-++++ b/bind.c
-+@@ -1167,9 +1167,7 @@ _rl_init_file_error (va_alist)
-+ /* **************************************************************** */
-+ 
-+ static int
-+-parse_comparison_op (s, indp)
-+-     const char *s;
-+-     int *indp;
-++parse_comparison_op (const char *s, int *indp)
-+ {
-+   int i, peekc, op;
-+ 
-+diff --git a/patchlevel b/patchlevel
-+index e340b58..6c10f12 100644
-+--- a/patchlevel
-++++ b/patchlevel
-+@@ -1,3 +1,3 @@
-+ # Do not edit -- exists only for use by patch
-+ 
-+-7
-++8
-+diff --git a/rltty.c b/rltty.c
-+index 882a3d4..a4863ac 100644
-+--- a/rltty.c
-++++ b/rltty.c
-+@@ -80,8 +80,7 @@ static int ksrflow;
-+ /* Dummy call to force a backgrounded readline to stop before it tries
-+    to get the tty settings. */
-+ static void
-+-set_winsize (tty)
-+-     int tty;
-++set_winsize (int tty)
-+ {
-+ #if defined (TIOCGWINSZ)
-+   struct winsize w;
-+diff --git a/text.c b/text.c
-+index 91c3f33..30fdaa1 100644
-+--- a/text.c
-++++ b/text.c
-+@@ -1764,8 +1764,7 @@ _rl_char_search (int count, int fdir, int bdir)
-+ 
-+ #if defined (READLINE_CALLBACKS)
-+ static int
-+-_rl_char_search_callback (data)
-+-     _rl_callback_generic_arg *data;
-++_rl_char_search_callback (_rl_callback_generic_arg *data)
-+ {
-+   _rl_callback_func = 0;
-+   _rl_want_redisplay = 1;
-+-- 
-+cgit v1.1
-+
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..467ea60e903 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -1,6 +1,6 @@
- /* tcap.h -- termcap library functions and variables. */
- 
--/* Copyright (C) 1996-2015 Free Software Foundation, Inc.
-+/* Copyright (C) 1996-2015,2023 Free Software Foundation, Inc.
- 
-    This file is part of the GNU Readline Library (Readline), a library
-    for reading lines of text with interactive input and history editing.      
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *, const char *);
-+extern int tgetflag (const char *);
-+extern int tgetnum (const char *);
-+extern char *tgetstr (const char *, char **);
- 
--extern int tputs ();
-+extern int tputs (const char *, int, int (*)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *, int, int);
- 
- #endif /* HAVE_TERMCAP_H */
- 
diff --git a/meta/recipes-devtools/gdb/gdb_16.3.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.3.bb
rename to meta/recipes-devtools/gdb/gdb_17.1.bb
-- 
2.49.0


