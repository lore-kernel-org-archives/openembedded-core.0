Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16763C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 10:18:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9327.1787739486034987391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 03:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A1iM2nYt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698308293=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHtDG3517561
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 03:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=v5Y8Byl8NGkBQfUoxj84
	EGet3U6R0w9yVtjlmOkpKBg=; b=A1iM2nYtt0cdCOv1XnyA602+13+JM4/z00zA
	iXhNBB7wu3h2BxPEiQMX6qepApu6lKeDVZRCmzFnKFplR4bnsZMDRKIWK9HyQr5N
	ikg+runjv4d/hRKY4eORn4WfsJb/sGuu3BJbO9jfty6u6XnWtxGBjMBCYf+Y5FeU
	KE8QBQseC9THtg6+F/aA607psH4+yZhrT8RBhKvKnqaZarPeQPaj+DXFbYXQF+EX
	J3cGRb+t675W/+CPS1FuV7iGFr/f6Nva9Ie9bM8EuJx5wts/Mc7B9ShigzzyMwCK
	OXH0pSKZZQ/2FOeNZ+fWHNkaduZBRdkWpP0dYrU8G9DxahQsxQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022094.outbound.protection.outlook.com [52.101.43.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721pdrf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 03:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibJ+3I+B6xOtBOMlqzMs10prcN3ZL3G28Mh0D2j4WKM2/O7BJOItfPmfcJbhQsO5CPIgjVa9amjQEq3/9zr/TJPqxbKjNWDXjs7DFtuI5zPAwU7SRsxXlcpR1lrsWUW1TxDiiwzyzQgLdmgmW0vOp9a7OXq8hJYQPsTyKJeGrM5r/5+wFXD5F4f1Jh6xHOG6x2jOKYXUGE6kqKXd3zQevUbktMyVVY0pT8qriGH2+L+DaV4TBfQKahuZXvJ0W6cL9p4XvlfYcx3U/nels05U1/AZMBPwqRyvQU1SR9XTcX+l56ABuhaMZsWVGe/ygRZCe15yLh16sssB51Y/Y9qirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5Y8Byl8NGkBQfUoxj84EGet3U6R0w9yVtjlmOkpKBg=;
 b=KISKOd935RSXQc9cLDve9tJ2f+itvlDkZH5lvP29T109gVivV+0Dx9XVVGfOy81D2J6FakPcmqxYTJV3HBcGjOWOcRvUNg+nKCESn41QyHp7CUVaEu94QoEDu9k/buG+OezDT/m5Y5kQG+BDrIpRsKRGNZoDct3qnCDRgElGU6IS1CVSU4bw6DAA02fvSU/iugK3gu/wy3ywSv05OD3tOk5WQemXTUEWzuzFqgE14kbEKJ/tV8kcAfdNb0s35lcgrNPF0V4Ct//g4QOUFOm+rNzlFArWSis7J7cU2uyPHUZFP1TqcXoj9JeZeEeIBzDboHidsgJF26y+4P1hfvKL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by IA3PR11MB163182.namprd11.prod.outlook.com
 (2603:10b6:208:54b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 10:18:02 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d%8]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 10:18:02 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][wrynose] gnutls: upgrade 3.8.12 -> 3.8.13
Date: Wed, 26 Aug 2026 15:47:29 +0530
Message-Id: <20260826101729.731747-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0046.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::8) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|IA3PR11MB163182:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cdd45a-d2df-4758-94e1-08df035b4f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|56012099006|10067099003|6133799003|29003799003|3023799007|18002099003|25016099003|5023799004|11063799006|12006099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wXQIVr5/8sVhass/CWGiNLS0Bk7BOy2Ry6Ry07+YKrxKaTfrdhWusUrQB/Rb1PKEbOYb4kDWh6KrZtROeIaGXBkMJTj78gEYcERJUoftzO5FLDynz7j3UiSQ1RlcGXdoHoiODocj8MYxG9tfv7sePJs/0jx3kB80XhPhuXcv1v/MJuKc/UemHDTQl7ICj9VzSOnaxQwQ5Wdi+9Zv0gpOd1pH/8yYsBlsq+bNpabTDwNaI+AXWS8ZVG60L2Di2cZhk7/bm3p4p4/exN9TF5ETG8N6YqKsV+nhJkANHeWDVUytkeQh+LWHp7S/tzLWIETFqv6yekiVjAFgplZfFJ1uBwPT3FyxsZ3bt3ugg3urwX60GawDLj5uUI58L+Y7XtbAa2SF3aFpomG9AR0JHI6BOLygKgxgPWRDG/7LlYhx4ar9ehNpdmpWL9ThB/Qc9YLeXJTdBA7jmQRBaJlfHRRlZxc4A893J9WiwRvrud1S7SF5QhrXcZRwBCeJ01BS8u5bb+iUGE5Qtbz+C+TgzguaoVaSHOTlpi64EZrqR/Fpp4nbFCiKQapV9Wcu8cV9y/MnPVHWpSn2BmgRa1Q1dpbZHDH/SgXieQD1HK9oTIOEtwvHClrX/m2abtrE57z2oHFhpYwMX7vE7a1uCMVe2/XI7M66E/Zxu7nxz+Vkwt+uK48upEJ37pgia8ILIri8g8aOb4jIQ12CiNLYqDS06pH11pA4hD/F3xrURQxgxWU7IHc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(56012099006)(10067099003)(6133799003)(29003799003)(3023799007)(18002099003)(25016099003)(5023799004)(11063799006)(12006099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d9dxKyLDcgFmVxqi3eCXmC4qjj3E2Xm9EzsG0E0DCbjGMObKj6rgyQj/d1e5?=
 =?us-ascii?Q?THhsLDWS+taFDYL825iATYw2xLCZfcGyiUjRsoK8tANDPiWx4jlZTHuCWM13?=
 =?us-ascii?Q?c6Q1526xAZxZSS36NXqBHkPCc0iqxR03tuwmuRXzUKvKcp+eCGZEMKlwoRla?=
 =?us-ascii?Q?YFEH9ZPSECQ2idNaVL358xwuAG/5ei8dgwJ51VmMkPfUV7cUD1PtKZnwYOKW?=
 =?us-ascii?Q?C/LC8/PynVrpWnnZxQ9u2nK1aH9U+8v2X9e5BSjR10kLXG/bI1Tft9Wc85VY?=
 =?us-ascii?Q?qFGwj9ObuWwYWFrwSiPktXmSC9KqejTQG0xknKLAvqK/ZMEq0jrHT4d58ixC?=
 =?us-ascii?Q?apZbzclVLt9epJGgg0Xj7N6UcF8LszS5YPRBJmYiccSN2O1gjbKFe2yqOGdz?=
 =?us-ascii?Q?nPBIbQIKfg17uIcxo8GNv/KoznF14N//RgPX2Vnkmw7TcveSGvGLQbncO1Ft?=
 =?us-ascii?Q?VnwRUBEOYo+z072P3xHaKb1tgrTV1qQg6v8f3OW9XWC5BoJce5FLnTLDI6C5?=
 =?us-ascii?Q?BrQmOdh4QDhsZfbs1CpxsmoIsjT9it+T+MsKY/DJXbgFYzWhqqw8ZPmKWz/u?=
 =?us-ascii?Q?4W3cX6kRH3vVy+rm/nOZrs5iWxERzEnKpjTsVmoVcLqe1DPZfI/XP7Qm1g3s?=
 =?us-ascii?Q?Sk1Tgg4RwPKwVWowAeKcEeGIZZpb09wtYA0GMtBHKn+u/sb43YEMiZrKR3lN?=
 =?us-ascii?Q?xYT5n6XgFrQdmlLwCQ0JCb/FA/kf0tGYcIzMCpw81MTzO13eR92fsgllxjBK?=
 =?us-ascii?Q?2ea6yAlIorYbYjDa2vDDlETgZaXXoHceJooSWCx9VXX1GoDMXI/tgPEvfnRF?=
 =?us-ascii?Q?7CA5u2szOlSCypUXAeEBCWEMFk4uay7Puy+Y5Q8kb5qvnCCND7r8okQmBcgh?=
 =?us-ascii?Q?j0d/+0OfFzBR2qBI0MHqmmoTGncVnO8PVp2cFX9Aqb8EyxLKg/brHwMFEaOF?=
 =?us-ascii?Q?ZYfkZSnTXu3gnxPL+YV/T2psSerkEuuPE9Fb6/HUhmKrLTPV9RE+NTF/NK+4?=
 =?us-ascii?Q?bVfk5xl1HzNs+XZ0ZC1STXaVY8/TyoQG7h3DrM2NK+THkxvcNmoI/FE3CdT3?=
 =?us-ascii?Q?Npnmi/+oDCVS3pgjamFdchEyep9jen06fSTXe8edcpDg6qgQBZo/yAbSp6MF?=
 =?us-ascii?Q?0p28eO82/s+50wsmnXJUx2346kDwu/YWm/MQKwWEkQbbSIccnkZijTefKUce?=
 =?us-ascii?Q?bKXSvmJy5nclA/Cojh79/0btk/Je57Bwa4T1J4jX4J54E5xFmJXQOo7iX+Xe?=
 =?us-ascii?Q?qCQivBIGYY+JjHvIF3tOJV/7cMX6NH52l2UiOazSrHbPnyRYHrtIgEbhPXPj?=
 =?us-ascii?Q?bqoYJqLwdMvQto3UILfW1sXEUWSffMAQ9y0NHCERbSO0uHEnqTrUCWNcIu2P?=
 =?us-ascii?Q?Z+ceI9/LTkgb0IulXgtmfCy90OwLeFFUvOCzQErN7EDOicuAd1z2fzOuy7+S?=
 =?us-ascii?Q?z/B9izpr8HGN2i3bHI452xjRaOJEMQPDW7ilEnMto+GcfGmrkZN8ntLpwUw/?=
 =?us-ascii?Q?Rm1cSUTg64ldT2k7M1TUjt1iuZ57NPRUlkRorxwiXUL3jJVuF/+XCqit8i5L?=
 =?us-ascii?Q?eQDUh45juBmB+93t5YCMktd+lOUzaaWIoLJcd/qWsf+T3PrDcy8zByEB4JhZ?=
 =?us-ascii?Q?x1cLGVDm3R7Y8eFfva2vDvYk8x5sAZYDqvwMs9x479seVDQj6C3Jwtvr+Gc6?=
 =?us-ascii?Q?5I12S8Eiwj2NZ0VSJsnuJDFaNxw/cD8rO5uHPKtIhHoVtK+wYWPbHghMZ9PV?=
 =?us-ascii?Q?XGFBrIHEZUZs5p9tkgc2kxqgS7dwol8=3D?=
X-Exchange-RoutingPolicyChecked: 
	bZe7B5hFsQYI3KwcpNXv29hgj16DniSqfv8Jc+UNPvM5+IwCex3wdgdSeDH7MPYUd6JyVGxEwApdD6emskygdRJ5KDIwova35mEphHrz8ve+34nYjko7cKpDEuf0Q6wpmimyT7vXIwCkJHkWLyCpBJMnTc/N1WBZfpJVeWOI/yyLpRt1pIo+QaOiEIvvfwPQehY5c2oA+YnHHkc7SPvehYEZ7RvYkQh9vnnFzwpzuTBYmPajulLY+FoaMIYKFChsK6almHaMx6Z2BRtu8hPUE0YOfcjZqzytvUYma2ss9PoaW8UyrH80JBO+gGZ2CuVYRXFeDiGlOBSwaZ4q4FzIUw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cdd45a-d2df-4758-94e1-08df035b4f65
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:18:02.3758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8VJMZkcESpayEJBPf61WjhPC75nZ//mdz74I5b9zlvYzNt17lvXBrbkmru0LN5F4yqE+RlEmtAcasmj4v5jOnpaWGPoPpTQdsuAsoo+Nw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB163182
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8ebd5d cx=c_pps
 a=13WRnYNq68uQF2pe1ZmaJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=-qf0PAJrAAAA:20
 a=p0WdMEafAAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=GwUem0DFAAAA:8
 a=a_U1oVfrAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=zXjPRAMDAAAA:8 a=AUd_NHdVAAAA:8 a=7CQSdrXTAAAA:8
 a=dXUd8J6aCUEZXQPeSTkA:9 a=QuCWooRsIZstVQAL:21 a=O8hF6Hzn-FEA:10
 a=r0dl5i_q2XGqDZkti5dn:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=K25av0bC_gCdl_G_d3s9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: o3MJLm0HFcuh72Zmn5eu92sL-j1XSKwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NSBTYWx0ZWRfXzINLeTj40C0W
 zWSkT1fqrlDSG9EEpx4c0jzjNoqPLW53kBm5MRum4rNVuZh2oexQTvuNvAFV2CmjQaALAGcW95C
 QdTxJGv1uzWhOswbnd8+c85cXkjm1U28SaT0he3deuecvZy4MFazY9YtnPRCCUP83f38enZC5dE
 lRhPsCJeZt6Gxn7mxKnMaV5Zww9ZARkegvf5XvVyc23XAlb0uggEa6BGMYxD4yKqPUi2Ojgab+g
 tbFZYb1JjVyF2Sn+O4YBGZfqO+NMY5uh56K3CsvXLiVpsgkw9l5TRNu2n7r02HacW69BI7KBIbp
 oRExxy4WOWMlnmAS0YfvoRR1fSEctrJpTexHbBcLyS2/0VSz/6TsSeCkTuGWEMvlz6+Rx3R867S
 qwsfIJrgjo1Ro72TE8zkuneg6yLG9MzLycGFJBgaykRqhDJrbzaGUKBCmI++55bXtG5ENS4mYWW
 hs6JwcfknlYtiW1YbhA==
X-Proofpoint-GUID: o3MJLm0HFcuh72Zmn5eu92sL-j1XSKwz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NSBTYWx0ZWRfXxHFtLAE4eTxj
 4euvQC4/kGygONKozQP6k3dpReLyOZ2IaC8dMyUSwROLROfloFPpxs/FZ/jGaBAxvfNspyA1eNX
 zyvzRbT8e0Um4ui4QxjSbJkq0m4C4KeyB5fSA3qBnTrft3fxqVtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 10:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244393

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
CVE-2026-5419.

Release notes: [1]

Rebase patches and drop patch included in this release.
Add patches to fix linking with musl libc.
Increase memory needed to successfully run test key-openssl.
Drop code for previous release tarball problem.

[1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 meta/recipes-core/images/core-image-ptest.bb  |   2 +
 ...fragments-implement-a-basic-DTLS-tes.patch | 258 ------------------
 ...s-mini-dtls-framents-link-to-gnulib.patch} |  12 +-
 ...ust-list-fault-fix-issues-in-linking.patch |  31 +++
 ...merge_handshake_packet-using-recv_bu.patch |  96 -------
 ...s-add-more-checks-to-DTLS-reassembly.patch |  65 -----
 ...fragments-extend-with-a-1816-reprodu.patch | 159 -----------
 ...fragments-extend-with-fragmenting-Cl.patch | 149 ----------
 ...ch-DTLS-datagrams-by-sequence-number.patch |  42 ---
 ...fragments-1839-mismatching-message_s.patch | 104 -------
 .../gnutls/gnutls/Add-ptest-support.patch     |   4 +-
 .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ----
 .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 --------
 .../gnutls/gnutls/CVE-2026-3833.patch         |  90 ------
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     |  62 -----
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     |  48 ----
 meta/recipes-support/gnutls/gnutls/c99.patch  |  41 ---
 .../{gnutls_3.8.12.bb => gnutls_3.8.13.bb}    |  22 +-
 18 files changed, 43 insertions(+), 1308 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
 rename meta/recipes-support/gnutls/gnutls/{0008-tests-mini-dtls-framents-link-to-gnulib.patch => 0001-tests-mini-dtls-framents-link-to-gnulib.patch} (68%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
 rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb => gnutls_3.8.13.bb} (78%)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index c08561296f..eac93045d3 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -39,6 +39,8 @@ QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
+QB_MEM:virtclass-mcextend-go = "-m 4096"
+QB_MEM:virtclass-mcextend-gnutls = "-m 1536"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
deleted file mode 100644
index 8519bb2d2d..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 9dce4b38fd94997c0fb2b3e33e997d1c33256e0e Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Fri, 20 Mar 2026 16:09:40 +0100
-Subject: [PATCH 1/8] tests/mini-dtls-fragments: implement a basic DTLS test
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0752e7e0daf43b9]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- tests/Makefile.am           |   7 +-
- tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
- 2 files changed, 214 insertions(+), 1 deletion(-)
- create mode 100644 tests/mini-dtls-fragments.c
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index db5aa4e3a..ee95198ff 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -241,7 +241,8 @@ ctests += mini-record-2 simple gnutls_hmac_fast set_pkcs12_cred cert certuniquei
- 	 x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name \
- 	 x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-double-free \
- 	 fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
--	 psk-importer privkey-derive dh-compute2 ecdh-compute2
-+	 psk-importer privkey-derive dh-compute2 ecdh-compute2 \
-+	 mini-dtls-fragments
- 
- ctests += tls-channel-binding
- 
-@@ -505,6 +506,10 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
- 	-I$(top_srcdir)/gl	\
- 	-I$(top_builddir)/gl
- 
-+mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
-+	-I$(top_srcdir)/gl	\
-+	-I$(top_builddir)/gl
-+
- if ENABLE_PKCS11
- if !WINDOWS
- ctests += tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11-no-key \
-diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
-new file mode 100644
-index 000000000..ee75feeb6
---- /dev/null
-+++ b/tests/mini-dtls-fragments.c
-@@ -0,0 +1,208 @@
-+/*
-+ * Copyright (C) 2026 Red Hat, Inc.
-+ *
-+ * Author: Alexander Sosedkin
-+ *
-+ * This file is part of GnuTLS.
-+ *
-+ * GnuTLS is free software; you can redistribute it and/or modify it
-+ * under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 3 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * GnuTLS is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with this program.  If not, see <https://www.gnu.org/licenses/>
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
-+#include <stdio.h>
-+#include <stdlib.h>
-+
-+#if defined(_WIN32)
-+
-+int main(void)
-+{
-+	exit(77);
-+}
-+
-+#else
-+
-+#include <assert.h>
-+#include <errno.h>
-+#include <stdbool.h>
-+#include <stdint.h>
-+#include <string.h>
-+#include <gnutls/gnutls.h>
-+#include <gnutls/dtls.h>
-+#include "cert-common.h"
-+#include "utils.h"
-+
-+#include "attribute.h"
-+
-+static void server_log_func(int level, const char *str)
-+{
-+	fprintf(stderr, "server|<%d>| %s", level, str);
-+}
-+
-+static void client_log_func(int level, const char *str)
-+{
-+	fprintf(stderr, "client|<%d>| %s", level, str);
-+}
-+
-+#define QUEUE_SIZE 1024
-+#define PACKET_SIZE 2048
-+
-+typedef struct {
-+	uint8_t buf[PACKET_SIZE];
-+	size_t len;
-+} packet_t;
-+typedef struct {
-+	packet_t packets[QUEUE_SIZE];
-+	size_t head;
-+	size_t tail;
-+} queue_t;
-+
-+static queue_t c2s, s2c;
-+
-+static int queue_put(queue_t *q, const void *buf, size_t len)
-+{
-+	assert(len <= PACKET_SIZE);
-+	memcpy(q->packets[q->tail].buf, buf, len);
-+	q->packets[q->tail].len = len;
-+	q->tail++;
-+	q->tail %= QUEUE_SIZE;
-+	assert(q->tail != q->head);
-+	return len;
-+}
-+
-+static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, size_t len)
-+{
-+	if (q->head == q->tail) {
-+		gnutls_transport_set_errno(s, EAGAIN);
-+		return -1;
-+	}
-+	size_t n = q->packets[q->head].len;
-+	memcpy(buf, q->packets[q->head].buf, n);
-+	q->head++;
-+	q->head %= QUEUE_SIZE;
-+	return n;
-+}
-+
-+static void queue_reset(queue_t *q)
-+{
-+	q->head = q->tail = 0;
-+}
-+
-+static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
-+{
-+	return 1;
-+}
-+
-+static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
-+{
-+	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
-+}
-+
-+static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
-+{
-+	return queue_get(&s2c, (gnutls_session_t)tr, b, l);
-+}
-+
-+static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, size_t l)
-+{
-+	return queue_put(&s2c, b, l);
-+}
-+
-+static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
-+				  size_t l)
-+{
-+	return queue_put(&c2s, b, l);
-+}
-+
-+static void test(gnutls_push_func client_push)
-+{
-+	gnutls_session_t client, server;
-+	gnutls_certificate_credentials_t ccred, scred;
-+	int cr = 0, sr = 0;
-+	bool cdone = false, sdone = false;
-+
-+	if (debug)
-+		gnutls_global_set_log_level(4711);
-+
-+	gnutls_certificate_allocate_credentials(&scred);
-+	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
-+					    GNUTLS_X509_FMT_PEM);
-+	gnutls_certificate_allocate_credentials(&ccred);
-+
-+	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
-+	gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
-+
-+	gnutls_priority_set_direct(server, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
-+				   NULL);
-+	gnutls_priority_set_direct(client, "NORMAL:-VERS-ALL:+VERS-DTLS1.2",
-+				   NULL);
-+
-+	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
-+	gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
-+
-+	gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
-+				 get_timeout());
-+	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
-+				 get_timeout());
-+
-+	gnutls_transport_set_ptr(client, client);
-+	gnutls_transport_set_push_function(client, client_push);
-+	gnutls_transport_set_pull_function(client, client_pull);
-+	gnutls_transport_set_pull_timeout_function(client, pull_timeout);
-+
-+	gnutls_transport_set_ptr(server, server);
-+	gnutls_transport_set_push_function(server, server_push);
-+	gnutls_transport_set_pull_function(server, server_pull);
-+	gnutls_transport_set_pull_timeout_function(server, pull_timeout);
-+
-+	while (!cdone || !sdone) {
-+		gnutls_global_set_log_function(client_log_func);
-+		if (!cdone)
-+			cr = gnutls_handshake(client);
-+		if (!cr || gnutls_error_is_fatal(cr))
-+			cdone = true;
-+
-+		gnutls_global_set_log_function(server_log_func);
-+		if (!sdone)
-+			sr = gnutls_handshake(server);
-+		if (!sr || gnutls_error_is_fatal(sr))
-+			sdone = true;
-+	}
-+
-+	if (cr)
-+		fail("client: %s\n", gnutls_strerror(cr));
-+	if (sr)
-+		fail("server: %s\n", gnutls_strerror(sr));
-+
-+	success("OK\n");
-+
-+	queue_reset(&c2s);
-+	queue_reset(&s2c);
-+
-+	gnutls_deinit(client);
-+	gnutls_deinit(server);
-+	gnutls_certificate_free_credentials(ccred);
-+	gnutls_certificate_free_credentials(scred);
-+}
-+
-+void doit(void)
-+{
-+	global_init();
-+	test(client_push_normal);
-+	gnutls_global_deinit();
-+}
-+
-+#endif /* _WIN32 */
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
similarity index 68%
rename from meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch
rename to meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
index 9c4cfa8a94..7f999c4b22 100644
--- a/meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
@@ -1,20 +1,21 @@
-From ed40056cdcfdf9ff815f4e2df93f0a263769a563 Mon Sep 17 00:00:00 2001
+From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
 From: Alexander Sosedkin <asosedkin@redhat.com>
 Date: Thu, 30 Apr 2026 13:08:01 +0200
-Subject: [PATCH 8/8] tests/mini-dtls-framents: link to gnulib
+Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
 
 Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
 
 Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2fb63c8df61d1480121a859f8c955f4910c01]
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
  tests/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f8797964d..1b27df751 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -509,6 +509,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
+@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS = $(AM_CPPFLAGS) \
  mini_dtls_fragments_CPPFLAGS = $(AM_CPPFLAGS) \
  	-I$(top_srcdir)/gl	\
  	-I$(top_builddir)/gl
@@ -22,6 +23,3 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
  
  if ENABLE_PKCS11
  if !WINDOWS
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
new file mode 100644
index 0000000000..b15a05d5b6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
@@ -0,0 +1,31 @@
+From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Thu, 7 May 2026 09:42:09 +0900
+Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
+
+This fixes the use of automake variables and also adds the linked mock
+library in .gitignore.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tests/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1b27df751..f6a60a32b 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_os_locking_ok_LDADD = $(LDADD) $(LIBDL)
+ pkcs11_long_label_DEPENDENCIES = libpkcs11mock4.la libutils.la
+ pkcs11_long_label_LDADD = $(LDADD) $(LIBDL)
+-pkcs11_trust_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
+-pkcs11_trust_fault_LDADD = $(LDADD) $(LIBDL)
++pkcs11_trust_list_fault_DEPENDENCIES = libpkcs11mock5.la libutils.la
++pkcs11_trust_list_fault_LDADD = $(LDADD) $(LIBDL)
+ endif
+ endif
+ 
diff --git a/meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch b/meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
deleted file mode 100644
index aaf51992c2..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 3ff7f6be9bb08463dd06765ab501430c4965ee05 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Fri, 17 Apr 2026 17:49:31 +0200
-Subject: [PATCH 2/8] buffers: shorten merge_handshake_packet using recv_buf
-
-I had vague concerns about thread-safety of this,
-but then this pattern already exists within the file.
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- lib/buffers.c | 52 +++++++++++++++++----------------------------------
- 1 file changed, 17 insertions(+), 35 deletions(-)
-
-diff --git a/lib/buffers.c b/lib/buffers.c
-index 672380b05..d54c77022 100644
---- a/lib/buffers.c
-+++ b/lib/buffers.c
-@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t session,
- 	int exists = 0, i, pos = 0;
- 	int ret;
- 
-+	handshake_buffer_st *recv_buf =
-+		session->internals.handshake_recv_buffer;
-+
- 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
--		if (session->internals.handshake_recv_buffer[i].htype ==
--		    hsk->htype) {
-+		if (recv_buf[i].htype == hsk->htype) {
- 			exists = 1;
- 			pos = i;
- 			break;
-@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session_t session,
- 		_gnutls_write_uint24(0, &hsk->header[6]);
- 		_gnutls_write_uint24(hsk->length, &hsk->header[9]);
- 
--		_gnutls_handshake_buffer_move(
--			&session->internals.handshake_recv_buffer[pos], hsk);
-+		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
- 
- 	} else {
--		if (hsk->start_offset <
--			    session->internals.handshake_recv_buffer[pos]
--				    .start_offset &&
--		    hsk->end_offset + 1 >=
--			    session->internals.handshake_recv_buffer[pos]
--				    .start_offset) {
--			memcpy(&session->internals.handshake_recv_buffer[pos]
--					.data.data[hsk->start_offset],
-+		if (hsk->start_offset < recv_buf[pos].start_offset &&
-+		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
-+			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
- 			       hsk->data.data, hsk->data.length);
--			session->internals.handshake_recv_buffer[pos]
--				.start_offset = hsk->start_offset;
--			session->internals.handshake_recv_buffer[pos]
--				.end_offset = MIN(
--				hsk->end_offset,
--				session->internals.handshake_recv_buffer[pos]
--					.end_offset);
--		} else if (hsk->end_offset >
--				   session->internals.handshake_recv_buffer[pos]
--					   .end_offset &&
--			   hsk->start_offset <=
--				   session->internals.handshake_recv_buffer[pos]
--						   .end_offset +
--					   1) {
--			memcpy(&session->internals.handshake_recv_buffer[pos]
--					.data.data[hsk->start_offset],
-+			recv_buf[pos].start_offset = hsk->start_offset;
-+			recv_buf[pos].end_offset =
-+				MIN(hsk->end_offset, recv_buf[pos].end_offset);
-+		} else if (hsk->end_offset > recv_buf[pos].end_offset &&
-+			   hsk->start_offset <= recv_buf[pos].end_offset + 1) {
-+			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
- 			       hsk->data.data, hsk->data.length);
- 
--			session->internals.handshake_recv_buffer[pos]
--				.end_offset = hsk->end_offset;
--			session->internals.handshake_recv_buffer[pos]
--				.start_offset = MIN(
--				hsk->start_offset,
--				session->internals.handshake_recv_buffer[pos]
--					.start_offset);
-+			recv_buf[pos].end_offset = hsk->end_offset;
-+			recv_buf[pos].start_offset = MIN(
-+				hsk->start_offset, recv_buf[pos].start_offset);
- 		}
- 		_gnutls_handshake_buffer_clear(hsk);
- 	}
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch b/meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
deleted file mode 100644
index d9c3c0d3c6..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From dcd891a02e11dc13417800042d5272777fca0e97 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Fri, 17 Apr 2026 18:21:36 +0200
-Subject: [PATCH 3/8] buffers: add more checks to DTLS reassembly
-
-Previously, gnutls didn't check that DTLS fragments claimed
-a consistent message_length value.
-Additionally, a crucial array size check was missing,
-enabling an attacker to cause a heap overwrite.
-The updated version rejects fragments with mismatching length
-and adds a missing boundary check.
-
-Reported-by: Haruto Kimura (Stella)
-Reported-by: Oscar Reparaz
-Reported-by: Zou Dikai
-Fixes: #1816
-Fixes: #1838
-Fixes: #1839
-Fixes: CVE-2026-33846
-Fixes: GNUTLS-SA-2026-04-29-1
-CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
-CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- lib/buffers.c | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/lib/buffers.c b/lib/buffers.c
-index d54c77022..5d4d16276 100644
---- a/lib/buffers.c
-+++ b/lib/buffers.c
-@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_t session,
- 		_gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
- 
- 	} else {
-+		if (hsk->length != recv_buf[pos].length) {
-+			/* inconsistent across fragments */
-+			_gnutls_handshake_buffer_clear(hsk);
-+			return gnutls_assert_val(
-+				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
-+		}
-+		/* start_offset + data.length <= hsk->length <= max_length */
-+		if (hsk->length < hsk->start_offset + hsk->data.length) {
-+			/* impossible claims, overflow requested */
-+			_gnutls_handshake_buffer_clear(hsk);
-+			return gnutls_assert_val(
-+				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
-+		}
-+		if (hsk->length > recv_buf[pos].data.max_length) {
-+			/* we don't have this much allocated, overflow guard */
-+			_gnutls_handshake_buffer_clear(hsk);
-+			return gnutls_assert_val(
-+				GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
-+		}
-+
- 		if (hsk->start_offset < recv_buf[pos].start_offset &&
- 		    hsk->end_offset + 1 >= recv_buf[pos].start_offset) {
- 			memcpy(&recv_buf[pos].data.data[hsk->start_offset],
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch b/meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
deleted file mode 100644
index 9b4760450f..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
+++ /dev/null
@@ -1,159 +0,0 @@
-From 2fa72585f927d340827eccdf91bb69cf60ac169e Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Wed, 1 Apr 2026 19:51:45 +0200
-Subject: [PATCH 4/8] tests/mini-dtls-fragments: extend with a #1816 reproducer
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb101fb058565d87]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
- 1 file changed, 120 insertions(+)
-
-diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
-index ee75feeb6..8d5a18acd 100644
---- a/tests/mini-dtls-fragments.c
-+++ b/tests/mini-dtls-fragments.c
-@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
- 	return 1;
- }
- 
-+static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned ms)
-+{
-+	return c2s.head != c2s.tail ? 1 : 0;
-+}
-+
- static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l)
- {
- 	return queue_get(&c2s, (gnutls_session_t)tr, b, l);
-@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
- 	gnutls_certificate_free_credentials(scred);
- }
- 
-+static void test_malicious1816(void)
-+{
-+	/* dgram1: msg_len=50, frag_offset=25, frag_len=25 */
-+	static const uint8_t dgram1_hdr[] = {
-+		0x16, /* type: handshake */
-+		0xfe, 0xfd, /* version: DTLS 1.2 */
-+		0x00, 0x00, /* epoch: 0 */
-+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
-+		0x00, 0x25, /* record_length: 37 */
-+		0x01, /* msg_type: ClientHello */
-+		0x00, 0x00, 0x32, /* msg_length: 50 */
-+		0x00, 0x00, /* msg_seq: 0 */
-+		0x00, 0x00, 0x19, /* frag_offset: 25 */
-+		0x00, 0x00, 0x19, /* frag_length: 25 */
-+	};
-+	/* dgram2: msg_len=3000, frag_offset=0, frag_len=48 */
-+	static const uint8_t dgram2_hdr[] = {
-+		0x16, /* type: handshake */
-+		0xfe, 0xfd, /* version: DTLS 1.2 */
-+		0x00, 0x00, /* epoch: 0 */
-+		0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
-+		0x00, 0x3c, /* record_length: 60 */
-+		0x01, /* msg_type: ClientHello */
-+		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
-+		0x00, 0x00, /* msg_seq: 0 */
-+		0x00, 0x00, 0x00, /* frag_offset: 0 */
-+		0x00, 0x00, 0x30, /* frag_length: 48 */
-+	};
-+	/* dgram3: msg_len=3000, frag_offset=40, frag_len=1475 */
-+	static const uint8_t dgram3_hdr[] = {
-+		0x16, /* type: handshake */
-+		0xfe, 0xfd, /* version: DTLS 1.2 */
-+		0x00, 0x00, /* epoch: 0 */
-+		0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
-+		0x05, 0xcf, /* record_length: 1487 */
-+		0x01, /* msg_type: ClientHello */
-+		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
-+		0x00, 0x00, /* msg_seq: 0 */
-+		0x00, 0x00, 0x28, /* frag_offset: 40 */
-+		0x00, 0x05, 0xc3, /* frag_length: 1475 */
-+	};
-+	/* dgram4: msg_len=3000, frag_offset=1500, frag_len=1475 */
-+	static const uint8_t dgram4_hdr[] = {
-+		0x16, /* type: handshake */
-+		0xfe, 0xfd, /* version: DTLS 1.2 */
-+		0x00, 0x00, /* epoch: 0 */
-+		0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
-+		0x05, 0xcf, /* record_length: 1487 */
-+		0x01, /* msg_type: ClientHello */
-+		0x00, 0x0b, 0xb8, /* msg_length: 3000 */
-+		0x00, 0x00, /* msg_seq: 0 */
-+		0x00, 0x05, 0xdc, /* frag_offset: 1500 */
-+		0x00, 0x05, 0xc3, /* frag_length: 1475 */
-+	};
-+	gnutls_session_t server;
-+	gnutls_certificate_credentials_t scred;
-+	uint8_t dgram[1500];
-+	int sr;
-+
-+	if (debug)
-+		gnutls_global_set_log_level(4711);
-+
-+	gnutls_certificate_allocate_credentials(&scred);
-+	gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_key,
-+					    GNUTLS_X509_FMT_PEM);
-+
-+	gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
-+	gnutls_priority_set_direct(server, "NORMAL:+VERS-DTLS1.2", NULL);
-+	gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
-+
-+	gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
-+				 get_timeout());
-+
-+	gnutls_transport_set_ptr(server, server);
-+	gnutls_transport_set_push_function(server, server_push);
-+	gnutls_transport_set_pull_function(server, server_pull);
-+	gnutls_transport_set_pull_timeout_function(server,
-+						   c2s_pull_timeout_once);
-+
-+	memset(dgram, 0, sizeof(dgram));
-+	memcpy(dgram, dgram1_hdr, 25);
-+	queue_put(&c2s, dgram, 25 + 25);
-+
-+	memset(dgram, 0, sizeof(dgram));
-+	memcpy(dgram, dgram2_hdr, 25);
-+	queue_put(&c2s, dgram, 25 + 48);
-+
-+	memset(dgram, 0, sizeof(dgram));
-+	memcpy(dgram, dgram3_hdr, 25);
-+	queue_put(&c2s, dgram, 25 + 1475);
-+
-+	memset(dgram, 0, sizeof(dgram));
-+	memcpy(dgram, dgram4_hdr, 25);
-+	queue_put(&c2s, dgram, 25 + 1475);
-+
-+	gnutls_global_set_log_function(server_log_func);
-+	do {
-+		sr = gnutls_handshake(server); /* invalid write if vulnerable */
-+	} while (c2s.head != c2s.tail && !gnutls_error_is_fatal(sr));
-+	if (sr != GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
-+		fail("server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, "
-+		     "got: %s\n",
-+		     gnutls_strerror(sr));
-+
-+	success("OK\n");
-+
-+	queue_reset(&c2s);
-+	queue_reset(&s2c);
-+
-+	gnutls_deinit(server);
-+	gnutls_certificate_free_credentials(scred);
-+}
-+
- void doit(void)
- {
- 	global_init();
- 	test(client_push_normal);
-+	success("malicious reassembly bug exploitation (#1816):\n");
-+	test_malicious1816();
- 	gnutls_global_deinit();
- }
- 
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch b/meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
deleted file mode 100644
index 83c201926d..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From cee203d6ba4d49332a49e46a7d59e9ef7b33a741 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Mon, 20 Apr 2026 16:08:11 +0200
-Subject: [PATCH 5/8] tests/mini-dtls-fragments: extend with fragmenting
- ClientHello
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8511e873f762743]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
- 1 file changed, 107 insertions(+)
-
-diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
-index 8d5a18acd..93490bac2 100644
---- a/tests/mini-dtls-fragments.c
-+++ b/tests/mini-dtls-fragments.c
-@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void *b,
- 	return queue_put(&c2s, b, l);
- }
- 
-+static void write_u16(uint8_t *p, uint16_t val)
-+{
-+	p[0] = val >> 8;
-+	p[1] = val & 0xff;
-+}
-+
-+static void write_u24(uint8_t *p, uint32_t val)
-+{
-+	p[0] = (val >> 16) & 0xff;
-+	p[1] = (val >> 8) & 0xff;
-+	p[2] = val & 0xff;
-+}
-+
-+static void write_u48(uint8_t *p, uint64_t seq)
-+{
-+	int i;
-+	for (i = 5; i >= 0; i--) {
-+		p[i] = seq & 0xff;
-+		seq >>= 8;
-+	}
-+}
-+
-+static uint64_t read_u48(const uint8_t *p)
-+{
-+	uint64_t seq = 0;
-+	int i;
-+	for (i = 5; i >= 0; i--) {
-+		seq <<= 8;
-+		seq |= p[i];
-+	}
-+	return seq;
-+}
-+
- static void test(gnutls_push_func client_push)
- {
- 	gnutls_session_t client, server;
-@@ -316,12 +349,86 @@ static void test_malicious1816(void)
- 	gnutls_certificate_free_credentials(scred);
- }
- 
-+static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, size_t l,
-+				    int delta_n)
-+{
-+	if (delta_n == 0 || l < 13 || data[3] != 0 || data[4] != 0)
-+		return queue_put(&c2s, data, l);
-+
-+	uint8_t *p = malloc(l);
-+	assert(p);
-+	memcpy(p, data, l);
-+	write_u48(p + 5, read_u48(p + 5) + delta_n);
-+	ssize_t ret = queue_put(q, p, l);
-+	free(p);
-+	return ret;
-+}
-+
-+static void split_client_hello(const uint8_t *data, size_t len, uint8_t **frag1,
-+			       size_t *frag1_len, uint8_t **frag2,
-+			       size_t *frag2_len)
-+{
-+	size_t body_size = len - 25;
-+	*frag1_len = 13 + 12 + 1;
-+	*frag2_len = 13 + 12 + (body_size - 1);
-+
-+	*frag1 = malloc(13 + 12 + 1);
-+	assert(*frag1);
-+	*frag2 = malloc(13 + 12 + body_size - 1);
-+	assert(*frag2);
-+
-+	/* first fragment: record header + handshake header + first body byte */
-+	memcpy(*frag1, data, 13); /* record header */
-+	write_u16(*frag1 + 11, 12 + 1); /* record length */
-+	memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
-+	write_u24(*frag1 + 19, 0); /* fragment_offset = 0 */
-+	write_u24(*frag1 + 22, 1); /* fragment_length = 1 */
-+	(*frag1)[25] = data[25]; /* first body byte */
-+
-+	/* second fragment: record header + handshake header + remaining body */
-+	memcpy(*frag2, data, 13); /* record header */
-+	write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
-+	write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number */
-+	memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
-+	write_u24(*frag2 + 19, 1); /* fragment_offset = 1 */
-+	write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length */
-+	memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
-+}
-+
-+static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
-+				       size_t l)
-+{
-+	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
-+
-+	const uint8_t *data = (const uint8_t *)b;
-+	uint8_t *frag1, *frag2;
-+	size_t frag1_len, frag2_len;
-+
-+	/* Pass through anything that isn't an epoch0 ClientHello with body */
-+	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
-+	    data[0] != 22 || /* not a handshake record */
-+	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
-+	    data[13] != 1) /* not ClientHello */
-+		return queue_put_renumbered(&c2s, b, l, seq_offset);
-+
-+	/* epoch0 Client Hello: special treatment of splitting into fragments */
-+	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
-+	queue_put(&c2s, frag1, frag1_len);
-+	queue_put(&c2s, frag2, frag2_len);
-+	free(frag1);
-+	free(frag2);
-+	seq_offset++;
-+	return l;
-+}
-+
- void doit(void)
- {
- 	global_init();
- 	test(client_push_normal);
- 	success("malicious reassembly bug exploitation (#1816):\n");
- 	test_malicious1816();
-+	success("split client hello smoke-test\n");
-+	test(client_push_split_hello);
- 	gnutls_global_deinit();
- }
- 
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch b/meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
deleted file mode 100644
index 1627291512..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From bd8f76ce12a57962a62ce2818a6263fb04304c3f Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Mon, 20 Apr 2026 16:32:02 +0200
-Subject: [PATCH 6/8] buffers: match DTLS datagrams by sequence number
-
-DTLS handshake fragment reassembly previously matched incoming fragments
-by handshake type only, without checking the sequence number.
-This allowed fragments from different handshake messages
-to be merged into the same reassembly buffer.
-
-Now sequence number is accounted for during reassembly,
-ensuring fragments are only merged when they belong
-to the same handshake message.
-
-Reported-by: Zou Dikai
-Fixes: #1839
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84d801ac49a09f78]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- lib/buffers.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/buffers.c b/lib/buffers.c
-index 5d4d16276..62f140ed3 100644
---- a/lib/buffers.c
-+++ b/lib/buffers.c
-@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t session,
- 		session->internals.handshake_recv_buffer;
- 
- 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
--		if (recv_buf[i].htype == hsk->htype) {
-+		if (recv_buf[i].htype == hsk->htype &&
-+		    recv_buf[i].sequence == hsk->sequence) {
- 			exists = 1;
- 			pos = i;
- 			break;
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch b/meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
deleted file mode 100644
index 34bae2f57b..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From f7a5e7f3a7d05c7d558abd2f56f86e4c201be48b Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Mon, 20 Apr 2026 16:36:08 +0200
-Subject: [PATCH 7/8] tests/mini-dtls-fragments: #1839 mismatching message_seq
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf54958da91a656550e]
-CVE: CVE-2026-33846
-Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
----
- tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
- 1 file changed, 47 insertions(+), 7 deletions(-)
-
-diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
-index 93490bac2..499a92a92 100644
---- a/tests/mini-dtls-fragments.c
-+++ b/tests/mini-dtls-fragments.c
-@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
- 	return seq;
- }
- 
--static void test(gnutls_push_func client_push)
-+static void test(gnutls_push_func client_push, bool expect_success)
- {
- 	gnutls_session_t client, server;
- 	gnutls_certificate_credentials_t ccred, scred;
-@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
- 			sr = gnutls_handshake(server);
- 		if (!sr || gnutls_error_is_fatal(sr))
- 			sdone = true;
-+
-+		if (c2s.head == c2s.tail && s2c.head == s2c.tail)
-+			break; /* speed the test up */
- 	}
- 
--	if (cr)
--		fail("client: %s\n", gnutls_strerror(cr));
--	if (sr)
--		fail("server: %s\n", gnutls_strerror(sr));
-+	if (expect_success) {
-+		if (cr)
-+			fail("client: %s\n", gnutls_strerror(cr));
-+		if (sr)
-+			fail("server: %s\n", gnutls_strerror(sr));
-+
-+	} else {
-+		if (cr == 0 && sr == 0)
-+			fail("handshake unexpectedly succeeded: %s / %s\n",
-+			     gnutls_strerror(cr), gnutls_strerror(sr));
-+	}
- 
- 	success("OK\n");
- 
-@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const void *b,
- 	return l;
- }
- 
-+static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t tr,
-+					       const void *b, size_t l)
-+{
-+	/* gnutls wasn't matching on message_seq on merging, see #1839 */
-+	static int seq_offset = 0; /* for renumbering follow-up epoch0 ones */
-+
-+	const uint8_t *data = (const uint8_t *)b;
-+	uint8_t *frag1, *frag2;
-+	size_t frag1_len, frag2_len;
-+
-+	/* Pass through anything that isn't an epoch0 ClientHello with body */
-+	if (l < 13 + 12 + 1 || /* too short for DTLS record header */
-+	    data[0] != 22 || /* not a handshake record */
-+	    data[3] != 0 || data[4] != 0 || /* not epoch 0 */
-+	    data[13] != 1) /* not ClientHello */
-+		return queue_put_renumbered(&c2s, b, l, seq_offset);
-+
-+	/* epoch0 Client Hello: special treatment of splitting into fragments */
-+	split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len);
-+	queue_put(&c2s, frag1, frag1_len);
-+	frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839 */
-+	queue_put(&c2s, frag2, frag2_len);
-+	free(frag1);
-+	free(frag2);
-+	seq_offset++;
-+	return l;
-+}
-+
- void doit(void)
- {
- 	global_init();
--	test(client_push_normal);
-+	test(client_push_normal, true);
- 	success("malicious reassembly bug exploitation (#1816):\n");
- 	test_malicious1816();
- 	success("split client hello smoke-test\n");
--	test(client_push_split_hello);
-+	test(client_push_split_hello, true);
-+	success("split client hello smoke-test and mangle sequence number\n");
-+	test(client_push_split_hello_bad_seq, false);
- 	gnutls_global_deinit();
- }
- 
--- 
-2.53.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 398c0464e0..8c867a5a40 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -721,6 +721,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -745,6 +745,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
deleted file mode 100644
index 344a1d241a..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 141c9b6015fc56cd05db3a853f08d03fcbd9b0f4 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Thu, 12 Mar 2026 09:48:57 +0100
-Subject: [PATCH] cert-session: fix multi-entry OCSP revocation bypass
-
-In check_ocsp_response(), the code first searched
-for the SingleResponse that matches the certificate being validated.
-But later, the status was retrieved from entry 0 unconditionally,
-rather than from the matched resp_indx.
-As a result, if entry 0 corresponded to a different certificate and was good,
-while the matched entry for the peer certificate is revoked,
-the revocation check could've mistakenly accept the certificate.
-
-Reported-by: Oleh Konko (1seal) <security@1seal.org>
-Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
-Fixes: #1801
-Fixes: #1812
-Fixes: CVE-2026-3832
-Fixes: GNUTLS-SA-2026-04-29-12
-CVSS: 3.7 Low CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:N/A:N
-Introduced-in: ae404fe8488dee424876b5963c00d7e041672415 3.8.9
-
-CVE: CVE-2026-3832
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e48670c2]
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-(cherry picked from commit 731861b9de8dccaf7d3b0c1446833051e48670c2)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- lib/cert-session.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/lib/cert-session.c b/lib/cert-session.c
-index 963f797ee..f48c7a1fb 100644
---- a/lib/cert-session.c
-+++ b/lib/cert-session.c
-@@ -343,9 +343,9 @@ static int check_ocsp_response(gnutls_session_t session, gnutls_x509_crt_t cert,
- 		goto cleanup;
- 	}
- 
--	ret = gnutls_ocsp_resp_get_single(resp, 0, NULL, NULL, NULL, NULL,
--					  &cert_status, &vtime, &ntime, &rtime,
--					  NULL);
-+	ret = gnutls_ocsp_resp_get_single(resp, resp_indx, NULL, NULL, NULL,
-+					  NULL, &cert_status, &vtime, &ntime,
-+					  &rtime, NULL);
- 	if (ret < 0) {
- 		_gnutls_audit_log(
- 			session,
--- 
-2.51.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
deleted file mode 100644
index 4b8288ae54..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From ac357f76abeaf59429bc15b8764ad01920df0ef1 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Thu, 12 Mar 2026 15:25:24 +0100
-Subject: [PATCH] tests/ocsp-tests/ocsp-must-staple-connection: test
- CVE-2026-3832
-
-CVE: CVE-2026-3832
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e]
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-(cherry picked from commit d52d5f4f383e8c5d8e9a03334f2421ff35d37d2e)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- .../ocsp-tests/ocsp-must-staple-connection.sh | 70 +++++++++++++++++++
- 1 file changed, 70 insertions(+)
-
-diff --git a/tests/ocsp-tests/ocsp-must-staple-connection.sh b/tests/ocsp-tests/ocsp-must-staple-connection.sh
-index 94d41ce24..5e100b9d9 100755
---- a/tests/ocsp-tests/ocsp-must-staple-connection.sh
-+++ b/tests/ocsp-tests/ocsp-must-staple-connection.sh
-@@ -85,6 +85,7 @@ OCSP_RESPONSE_FILE="$testdir/ms-resp.tmp"
- OCSP_REQ_FILE="$testdir/ms-req.tmp"
- INDEXFILE="$testdir/ocsp_index.txt"
- ATTRFILE="${INDEXFILE}.attr"
-+SERVER_CERT_BAD_FILE="$testdir/ms-cert-bad.pem.tmp"
- 
- stop_servers ()
- {
-@@ -118,6 +119,20 @@ ${CERTTOOL} \
- 	--load-privkey "${srcdir}/ocsp-tests/certs/server_good.key" \
- 	--template "${TEMPLATE_FILE}" --outfile "${SERVER_CERT_FILE}" 2>/dev/null
- 
-+echo "=== Generating bad server certificate ==="
-+
-+rm -f "$TEMPLATE_FILE"
-+cp "${srcdir}/ocsp-tests/certs/server_bad.template" "$TEMPLATE_FILE"
-+chmod u+w "$TEMPLATE_FILE"
-+echo "ocsp_uri=http://localhost:${OCSP_PORT}/ocsp/" >>"$TEMPLATE_FILE"
-+
-+${CERTTOOL} \
-+	--attime "${CERTDATE}" \
-+	--generate-certificate --load-ca-privkey "${srcdir}/ocsp-tests/certs/ca.key" \
-+	--load-ca-certificate "${srcdir}/ocsp-tests/certs/ca.pem" \
-+	--load-privkey "${srcdir}/ocsp-tests/certs/server_bad.key" \
-+	--template "${TEMPLATE_FILE}" --outfile "${SERVER_CERT_BAD_FILE}" 2>/dev/null
-+
- echo "=== Bringing OCSP server up ==="
- 
- cp "${srcdir}/ocsp-tests/certs/ocsp_index.txt" ${INDEXFILE}
-@@ -486,6 +501,61 @@ kill "${TLS_SERVER_PID}"
- wait "${TLS_SERVER_PID}"
- unset TLS_SERVER_PID
- 
-+echo "=== Test 10: Server with revoked certificate - CVE-2026-3832 ==="
-+
-+# The revocation status was always mistakenly checked for the first cert.
-+# Check a pair of responses: (irrelevant good unrevoked, relevant bad revoked).
-+
-+rm -f "${OCSP_RESPONSE_FILE}"
-+
-+"$FAKETIME" "${TESTDATE}" \
-+    ${OPENSSL} ocsp -index "${INDEXFILE}" \
-+    -issuer "${srcdir}/ocsp-tests/certs/ca.pem" \
-+    -CA "${srcdir}/ocsp-tests/certs/ca.pem" \
-+    -rsigner "${srcdir}/ocsp-tests/certs/ocsp-server.pem" \
-+    -rkey "${srcdir}/ocsp-tests/certs/ocsp-server.key" \
-+    -cert "${SERVER_CERT_FILE}" \
-+    -cert "${SERVER_CERT_BAD_FILE}" \
-+    -respout "${OCSP_RESPONSE_FILE}"
-+
-+eval "${GETPORT}"
-+# Port for gnutls-serv
-+TLS_SERVER_PORT=$PORT
-+PORT=${TLS_SERVER_PORT}
-+launch_bare_server \
-+    "${SERV}" --attime "${TESTDATE}" --echo --disable-client-cert \
-+    --x509keyfile="${srcdir}/ocsp-tests/certs/server_bad.key" \
-+    --x509certfile="${SERVER_CERT_BAD_FILE}" \
-+    --port="${TLS_SERVER_PORT}" \
-+    --ocsp-response="${OCSP_RESPONSE_FILE}" --ignore-ocsp-response-errors
-+TLS_SERVER_PID="${!}"
-+wait_server $TLS_SERVER_PID
-+
-+wait_for_port "${TLS_SERVER_PORT}"
-+
-+out=$(
-+    echo "test 123456" | \
-+        "${CLI}" -d1 --attime "${TESTDATE}" --ocsp \
-+        --x509cafile "${srcdir}/ocsp-tests/certs/ca.pem" \
-+        --port "${TLS_SERVER_PORT}" localhost \
-+        2>&1
-+    rc=$?
-+)
-+printf '%s\n' "$out"
-+
-+if test "${rc}" = "0"; then
-+    echo 'ERROR: client accepted a revoked leaf (CVE-2026-3832)'
-+    exit 1
-+fi
-+if ! echo "${out}" | grep "The certificate was revoked via OCSP" >/dev/null
-+then
-+    echo '"The certificate was revoked via OCSP" not found in output'
-+    exit 1
-+fi
-+
-+kill "${TLS_SERVER_PID}"
-+wait "${TLS_SERVER_PID}"
-+unset TLS_SERVER_PID
- 
- kill ${OCSP_PID}
- wait ${OCSP_PID}
--- 
-2.51.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
deleted file mode 100644
index 25ba126054..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 0af3e60734ade8e89e6bec6c2687164e273fcbf2 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Mon, 16 Mar 2026 15:29:40 +0100
-Subject: [PATCH] x509/name-constraints: compare domain names case-insensitive
-
-RFC 5280 7.2:
-> When comparing DNS names for equality, conforming implementations
-> MUST perform a case-insensitive exact match on the entire DNS name.
-> When evaluating name constraints, conforming implementations MUST
-> perform a case-insensitive exact match on a label-by-label basis.
-
-Domain name comparison during name constraints processing
-was case-sensitive. For excluded name constraints, this could lead to
-incorrectly accepting domain names that should've been rejected.
-The code for comparing domain names and domain name parts of emails
-has been modified to perform case-insensitive comparison instead.
-
-Reported-by: Oleh Konko <security@1seal.org>
-Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
-Fixes: #1223
-Fixes: #1803
-Fixes: #1852
-Fixes: CVE-2026-3833
-Fixes: GNUTLS-SA-2026-04-29-5
-CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-
-CVE: CVE-2026-3833
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7ca6d962c5]
-
-Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
----
- lib/x509/name_constraints.c | 23 ++++++++++++++++++++---
- 1 file changed, 20 insertions(+), 3 deletions(-)
-
-diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
-index 04722bdf4..dee045d25 100644
---- a/lib/x509/name_constraints.c
-+++ b/lib/x509/name_constraints.c
-@@ -35,6 +35,7 @@
- #include "x509_int.h"
- #include "x509_ext_int.h"
- #include <libtasn1.h>
-+#include "c-strcase.h"
- 
- #include "ip.h"
- #include "ip-in-cidr.h"
-@@ -80,7 +81,7 @@ enum name_constraint_relation {
- 	NC_SORTS_AFTER = 2 /* unrelated constraints */
- };
- 
--/* A helper to compare just a pair of strings with this rich comparison */
-+/* Helpers to compare just a pair of strings with this rich comparison */
- static enum name_constraint_relation
- compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
- {
-@@ -96,6 +97,22 @@ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
- 	return NC_EQUAL;
- }
- 
-+static enum name_constraint_relation
-+compare_strings_case_insensitive(const void *n1, size_t n1_len, const void *n2,
-+				 size_t n2_len)
-+{
-+	int r = c_strncasecmp(n1, n2, MIN(n1_len, n2_len));
-+	if (r < 0)
-+		return NC_SORTS_BEFORE;
-+	if (r > 0)
-+		return NC_SORTS_AFTER;
-+	if (n1_len < n2_len)
-+		return NC_SORTS_BEFORE;
-+	if (n1_len > n2_len)
-+		return NC_SORTS_AFTER;
-+	return NC_EQUAL;
-+}
-+
- /* Rich-compare DNS names. Example order/relationships:
-  * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE y.b */
- static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
-@@ -121,8 +138,8 @@ static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
- 		while (j && n2->data[j - 1] != '.')
- 			j--;
- 
--		rel = compare_strings(&n1->data[i], i_end - i, &n2->data[j],
--				      j_end - j);
-+		rel = compare_strings_case_insensitive(&n1->data[i], i_end - i,
-+						       &n2->data[j], j_end - j);
- 		if (rel == NC_SORTS_BEFORE) /* x.a BEFORE y.a */
- 			return NC_SORTS_BEFORE;
- 		if (rel == NC_SORTS_AFTER) /* y.a AFTER x.a */
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
deleted file mode 100644
index e01fcc19ac..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From d1191b910e63149a10647a089995d3cd85e16400 Mon Sep 17 00:00:00 2001
-From: Alexander Sosedkin <asosedkin@redhat.com>
-Date: Tue, 21 Apr 2026 16:52:48 +0200
-Subject: [PATCH] lib/buffers: ensure packets have differing sequence
- numbers
-
-There should normally be no packets with same sequence number and
-differing handshake type, unless an adversary crafts them.
-Discarding them allows to get rid of packets
-with duplicate sequence ID in the buffer,
-relieving us from the question of how to sort them later.
-
-Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
-Fixes: #1848
-Fixes: CVE-2026-42009
-Fixes: GNUTLS-SA-2026-04-29-2
-CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
-
-CVE: CVE-2026-42009
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f01e21441e29052a6f0963840794c41d3b3ee66d]
-
-Backport Changes:
-- Rebased on top of the Wrynose CVE-2026-33846 backport stack, which
-  already includes the recv_buf helper and sequence-number matching
-  prerequisite patches.
-
-Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
-(cherry picked from commit f01e21441e29052a6f0963840794c41d3b3ee66d)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- lib/buffers.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/lib/buffers.c b/lib/buffers.c
-index 62f140ed3..e7f08b5625 100644
---- a/lib/buffers.c
-+++ b/lib/buffers.c
-@@ -971,8 +971,20 @@ static int merge_handshake_packet(gnutls_session_t session,
- 		session->internals.handshake_recv_buffer;
- 
- 	for (i = 0; i < session->internals.handshake_recv_buffer_size; i++) {
--		if (recv_buf[i].htype == hsk->htype &&
--		    recv_buf[i].sequence == hsk->sequence) {
-+		if (recv_buf[i].sequence == hsk->sequence) {
-+			if (recv_buf[i].htype != hsk->htype) {
-+				_gnutls_audit_log(
-+					session,
-+					"Discarded unexpected handshake packet "
-+					"with duplicate sequence %d, but "
-+					"mismatched type %s (previously %s)\n",
-+					hsk->sequence,
-+					_gnutls_handshake2str(hsk->htype),
-+					_gnutls_handshake2str(
-+						recv_buf[i].htype));
-+				_gnutls_handshake_buffer_clear(hsk);
-+				return 0;
-+			}
- 			exists = 1;
- 			pos = i;
- 			break;
--- 
-2.51.0
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
deleted file mode 100644
index d834d3da20..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 5374a6d584b8598511f7880b4e64ee52ee1f0cc5 Mon Sep 17 00:00:00 2001
-From: Joshua Rogers <joshua@joshua.hu>
-Date: Tue, 21 Apr 2026 18:11:39 +0200
-Subject: [PATCH] buffers: fix handshake_compare when sequence numbers
- match
-
-The comparator function used for ordering DTLS packets
-by sequence numbers did not follow qsort comparator contracts
-in case of packets with duplicate sequence numbers,
-which could lead to unstable ordering or undefined behaviour.
-Returning 0 in such cases makes the sorting stable.
-
-Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
-Fixes: #1848
-Fixes: CVE-2026-42009
-Fixes: GNUTLS-SA-2026-04-29-2
-CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
-
-CVE: CVE-2026-42009
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/f341441fad91142897d83b44a175ffc8f925b76f]
-
-Signed-off-by: Joshua Rogers <joshua@joshua.hu>
-(cherry picked from commit f341441fad91142897d83b44a175ffc8f925b76f)
-Signed-off-by: Deepak Rathore <deeratho@cisco.com>
----
- lib/buffers.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/lib/buffers.c b/lib/buffers.c
-index e7f08b5625..1ac27e4e96 100644
---- a/lib/buffers.c
-+++ b/lib/buffers.c
-@@ -844,11 +844,7 @@ static int handshake_compare(const void *_e1, const void *_e2)
- {
- 	const handshake_buffer_st *e1 = _e1;
- 	const handshake_buffer_st *e2 = _e2;
--
--	if (e1->sequence <= e2->sequence)
--		return 1;
--	else
--		return -1;
-+	return (e1->sequence < e2->sequence) - (e1->sequence > e2->sequence);
- }
- 
- #define SSL2_HEADERS 1
--- 
-2.51.0
-
diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-support/gnutls/gnutls/c99.patch
deleted file mode 100644
index 3f41241deb..0000000000
--- a/meta/recipes-support/gnutls/gnutls/c99.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 5 Mar 2026 11:33:57 +0000
-Subject: [PATCH] configure: make the C99 detection more resiliant
-
-autoconf 2.73 will default to C23 by default, which means that the >C99
-detection logic in configure.ac will fail because it only handles c11
-and c99.
-
-Instead of adding c23 to the list and then breaking again in the future,
-flip the logic around (as suggested by Zack Weinberg) and check
-explicitly for just c89.
-
-Closes #1806.
-
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/2081]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 740fb6339..c708d8f5e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
- # Require C99 support
- #
- AS_CASE([$ac_prog_cc_stdc],
--  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])],
--  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])]
--)
-+  [c89],
-+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to compile the project.]])],
-+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
- 
- AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = yes)
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
similarity index 78%
rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
index 3ad011742e..943864d4ba 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
@@ -23,23 +23,11 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            file://run-ptest \
            file://Add-ptest-support.patch \
-           file://c99.patch \
-           file://0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch \
-           file://0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch \
-           file://0003-buffers-add-more-checks-to-DTLS-reassembly.patch \
-           file://0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch \
-           file://0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch \
-           file://0006-buffers-match-DTLS-datagrams-by-sequence-number.patch \
-           file://0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch \
-           file://0008-tests-mini-dtls-framents-link-to-gnulib.patch \
-           file://CVE-2026-3832_p1.patch \
-           file://CVE-2026-3832_p2.patch \
-           file://CVE-2026-42009_p1.patch \
-           file://CVE-2026-42009_p2.patch \
-           file://CVE-2026-3833.patch \
+           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch \
+           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
            "
 
-SRC_URI[sha256sum] = "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51"
+SRC_URI[sha256sum] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -76,10 +64,6 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
-
-	# remove on next upgrade when release tarball gets fixed
-	# https://gitlab.com/gnutls/gnutls/-/issues/1797
-	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
 }
 
 do_compile_ptest() {
-- 
2.40.0


