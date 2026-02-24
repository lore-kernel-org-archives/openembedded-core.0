Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66C3EEC2BB
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:42:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11028.1771897339752153049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PmalcET9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O16U8f2832028
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:42:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QMhh60W4bSsZiD2TQOja
	vezVonGRLc9PHZYbI1UoE5c=; b=PmalcET9HeMFxA9puX0Wm1KPVuE53NGs8cVZ
	jgLf1FEqSRcRKwllP4bxU9ME5UCPFoNhkP+xMnlTFD9Q5yrZ4gfA//FNou4ekvtn
	XpUKbTdfFwXOycQemQZk0G/4gFOEk0XBLDbu+FB81zWMXuTNr+tr7Sr2URkTVeG8
	yR3x1zu4RKgZXeqDJHHBfkyFEyti5/tSGUXco+vBAHdTiF2iy2wvt/frMojAxSYM
	bJ2khh2ub6TF1fno7j6Y3DDADKYqwkXkEVJBrjhE9Y4WsSdu+f/cBYCLaB+6NqHK
	+tbEJX3ovt0afKzuF1/JPG//HTK40dm2WhIoADu4MkK5rrwwPw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v42dfd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YI3kgfbBmQ2qVOXncmg57yZ6vcfpx8TgdqJJ4/sI91GKWrHzPzF3KBB2NZpBhVHl/9/8vTgyZ6Tc+7BdZ2G1ytILfDx/eqRcnK0xTjbvJRYl0DCP/kLRQ7spnR8gCwPO7f940KWN7tmQmu9tXvV3NN/OTstoG/w5tByfjmAdy/HNDFCzjHjwBLbwzLyNhSiEfMQuPo+JfKBijEKgKI7ZCIrW5sBIQh7iPBTuOQKIVKeWbt9C9g99l87o/wae1q3c5J4WZ1yw6A4pAxYaUTNwBcHUJtF9ym5iDmxIGQ/Mk973VsgS9AMB+SgTLWroqN0rIoYh6w/hTeaQ+FmYeQCUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMhh60W4bSsZiD2TQOjavezVonGRLc9PHZYbI1UoE5c=;
 b=JY200tR+xsuFf1zEQxYxh3MF+nDmD6zytvI9ycCRC9bBHNmo/Fb7z58XYtwUd4iRBgSpAeaprIlwSK10u0hXESJNSCtDR4FWR6a/JT+0FnI5Zefr64ygzh9aSyPOmEbSxhGzeS7a6FCrCsrHBl0yU0thR/9wXrfUvpwdvEkLjyqTWB31VRRs5Md58XE8mpD5uFc5FNVnao3YFaifWMpOyQmQWcbVvwNCYtZEomfj4eUhsBKKBvSYvh3PUFD0InypEMPbUn7wBo7t7R3GCp3zgGuUHbL5TbxcAJCJRgOb+JUvag1Jd1UXCcBGor7tFupdcLPjBo36Oy65BehLf83fgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:42:14 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:42:13 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libfyaml: init add
Date: Tue, 24 Feb 2026 09:41:47 +0800
Message-Id: <20260224014148.3328393-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KU1PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:802:18::34) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 980696de-b900-4b84-a92f-08de7345ef43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lWOqMxcARdm6Xr4K2s2YohyP5TpNrS9K5IC95l77sC7levt2hwSjZiX6SFrl?=
 =?us-ascii?Q?sBaQ3nwDPQHexVyjss5wes36l0+RUCcEtjwtP67tpZqpy2Xn0VH8RcQENvxf?=
 =?us-ascii?Q?toZP8UwI9B9C9aOaLw5U6PlOqmYVyINX8H9SFbs7JP0Yp+A0RYkzmTo0qltt?=
 =?us-ascii?Q?hlx6t0Mmi8/myjHp6JCEIbMB1V+8thuYCCYIfEjk6gPnGv4SjFizg3S8jxfg?=
 =?us-ascii?Q?GAM+gFG6oZ0Oon6K4UwugS7987KJUP6lqkiysDKKgrfF+lkAFw3RNXHHToZB?=
 =?us-ascii?Q?3X/+6WrCCecTpZrNuAgkWqhGy1klxzeEeB3ffdK606/AVWnID9zF9KU1uRb1?=
 =?us-ascii?Q?Zh69/3I84saFLSKpplFa/EF+Bsk/9QprtYENd46mnTlTIhYi9zqXjcAfg3L1?=
 =?us-ascii?Q?QB301nQHPnoiX4UH8RuK0EqEpDFruaglHfxp6qYsZMheBWp+zr9HLYSKzKwc?=
 =?us-ascii?Q?HK2ICtFTTa12MJiIgXrzFpGvlqYzHUz4cXVIWGXGNhI3Eyv6TLWcrNcakaNo?=
 =?us-ascii?Q?Z6BCs3HQ7SAXtCysZGd4IhhtZBv8ItQWZlVHeg5HPRNkM+elwIqSd+bjaZMu?=
 =?us-ascii?Q?MDZTdoOLaImeV4jfN0qteBWx4j3ID4G9fdrKEU+dahdk4qAyYvD35b6EIUgj?=
 =?us-ascii?Q?0IMiw9BIxT3hJuPOjHW9d1YvRj3ME/0DYLOrG8U5M7J0R6ngZIGQmhNv3M5r?=
 =?us-ascii?Q?T35pgFq5qBzNvcb1CBKcp60EuEn/xv4kPvhppsTAhVFe37Bhd8GZ0pHFMknl?=
 =?us-ascii?Q?FXIqcmH1UrDBgx8cpGg3pCnX9+Ft6HqWb5ekO8cZc6UBQmEYVK7gIgPlxdfv?=
 =?us-ascii?Q?HweLecQcrFiBU2IXyZXlrHIsD4WdSs24ASOwWEsYVnbl4Zsi3EO2rZr7XQp7?=
 =?us-ascii?Q?BAvTBffL/0W2buWCxD7MZpMWxqicDvgLAszUVoOehTb88hGlSgqMyPqc34uE?=
 =?us-ascii?Q?NhsLONjp3Jd3ugDiOQIaKZrg0aqYE0KobM+HY7Fd3BH4H+HMEW2jBMqGyjF2?=
 =?us-ascii?Q?cSTJr3Za5LKQYSQ47Ox5xHZT+A/Sbr51l3IrryX+BaawMUCUbXHF03RR1Yl/?=
 =?us-ascii?Q?HZ34ipqSNJVYal08ngynbA6OvvQSceHR177y/Hj/dQ46rqvy1SHvygBEJHfo?=
 =?us-ascii?Q?Dkhr2rG5rY57gULOy/npkMv1swAYc99N8XXg8IIJH9Obo2SWJE1C/HOQfcMR?=
 =?us-ascii?Q?3031/Dzi0T/NzPMmerCCfF/Cui6my7BBq1kIIpXHOC5eTwUKTGhRtpokv5lI?=
 =?us-ascii?Q?M5BHnU/CJ0JvEKZ3yudhcXEpHyhOyP5Wvtjjc0FTfOpqu+PKNsgEKB2DbzE2?=
 =?us-ascii?Q?G7h6VrH8ucgs8U7Go2wYC333dtmrzTa4lqX0VDrWMVRNBAJNSCGJ6q2tPCuT?=
 =?us-ascii?Q?Lr0qJlSQmN4Fk7VIlB1k4d49Iw/e+TTrWeH/3wYFFz3z/d1n9bTJrHQQAwn+?=
 =?us-ascii?Q?6xJ/HVQ5G7C2GFG4OuXhJTsjxf9ZXTqejozdMWzay1mNdmR+/3a7mrhqM8ij?=
 =?us-ascii?Q?jTH4tqiYxmd8KPX5JQvQz2dAiTMIXX4+9gSA0qIKlobG9rVnjipObd1babDO?=
 =?us-ascii?Q?4/GBrG4voPuJl9fja62KarH+vk0YfsVBzgvD0b1gXQbR+AxjrwMcTpJ5vNCQ?=
 =?us-ascii?Q?9avC4Vbe1Jgk6ood/DrGeDEf/on0LJT/sUQ03NZduFKM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sweL87hhPgLA4+MYXhQn3zZ9dGGuag4LmkNylJXyx7J2IRj0JBcyoiMfeA0V?=
 =?us-ascii?Q?XAbDATvFrNPisvOIvLMF4QZMYsX1uEJP/mgb7tmTio8wR8Jfxe5cuWbjHem6?=
 =?us-ascii?Q?5khxQr3gVUd2Et93gF1AnJhIb4apqtNLabdY443JzY2FrA1cuK6sPigux+Xm?=
 =?us-ascii?Q?1TfO+lOQ+rDT7HEdtZh2wnxpxDCY536V8dteCK/wB1lgSA8FxL2Ql6UMG1bV?=
 =?us-ascii?Q?I/MHNw4L6J1bJ32K5Ask0NykaRi5Ephbj1NM/ONavFNRBa67cW0MW3crznXW?=
 =?us-ascii?Q?esv56xKdRxS4+/NVlmUd+KKqFOpFOKoGg+8Q1T+uh2XTWOGTW6uDQkq2YVih?=
 =?us-ascii?Q?wS7gckQsMYlWky35YGkNi1vQr43W9s7h9y7VXi+oBddU8jpOp4OAJK2OIkSM?=
 =?us-ascii?Q?mH3nqiQCAbmBkfYokC7peQ4ZLkq6/we0WVmDSbCVarBBwpr/KX5l46gnNRrK?=
 =?us-ascii?Q?wl3s++QfX1vYuEga55gQepDuOaOd7fA7Pw9/1t/aPMeMlC/a/+EJZ5rGNnww?=
 =?us-ascii?Q?012nx6KjMOtMi/TguxEQTmj6CklTgzxP9CN7U1ouLu3+DlLenjlWFkKMEVRm?=
 =?us-ascii?Q?lBKv+LqPwGE8o7tTLEeZdjScbPtsdVoq4EYHRutWGNmX/Xkgo8U81wgk0Rdu?=
 =?us-ascii?Q?Iwp/FfBV3bGoGdFVT+ANeWDdPwdxHkVUH5Yp7sQcLZIoQaO77WZ7GG8xD5NI?=
 =?us-ascii?Q?44j+37F9jkZKQqEqcWN+CsD1wuR+GNXWwBFFmzAU3VoHcjd5NZ2Fe6jaOrDp?=
 =?us-ascii?Q?IPr7j7UyMTBv0FK6tRyvnEJ4rvKpnSSWrlowN1wOr8A5WxHwFJLqWKn2AFC+?=
 =?us-ascii?Q?PUPcBMJaTP/cH2n7lQUUOOP31Cp/iLMyG/f3WUNipLY67L43Ff8xrlEJzqu/?=
 =?us-ascii?Q?UJqxmcA/Ueb959NO6zZOAoRn3BFDaLWTdqTMc42U4MUAsqp4KUOh1yVo5SbT?=
 =?us-ascii?Q?vf/xn0vhQlo8dnoCS5YenSdlXKmYQrDrl+soiRJ51tyof7XuggXlcW206UGK?=
 =?us-ascii?Q?CXSKZuhg8ZQmpTPKN+IGlB+zZrHWanqW31kLYslfvS1fLDvwHmktXNlZerQ1?=
 =?us-ascii?Q?gED4JtNDNvNT7qq/E/sC5dtIUP3kz42WtoCIvSGTlz2+tGJyay+Ewz/9EtKV?=
 =?us-ascii?Q?hY/fdsbiXuf757o1xNA5fqhcXluXrfjBkWOlbiu0A0VJ/Rp6CLPJbGZrqT6S?=
 =?us-ascii?Q?IFdCyxYkikNFQrjfghBO1ylp7CWMBUSqx0nswM0YERpAHt1jjuw46LZZn2cE?=
 =?us-ascii?Q?ilL33QYyjWDvs+JGjmuXlmMswWU1ay8NVvOrzXNDB1cCHUIKbW0UhKMQtXUo?=
 =?us-ascii?Q?BS3zW/SBtyP6thgp/YlMzOfJeqqnpf3j84dbdKwUcup2GWufptqyd3lymZlY?=
 =?us-ascii?Q?EabdfoLrfvIkox0SfM55vR5OO4qED6/mU4ataFP0mmFTv1mBhEK5Ll4nXj33?=
 =?us-ascii?Q?xlvuPLoyFYL1ZwzxL+U1brYZd50I/kJmWyYplhR7carO5GFOhaYD7Kg+xKIa?=
 =?us-ascii?Q?ECGJeIsbdTnk/ZPt33/nmLB5znx08fbBkbn/Speh9k23iokzLKI7J736+XvC?=
 =?us-ascii?Q?WzGv5+cdyiAKwoGiizQqlXP4KgIYutrOMNSVfiWoueTpHIfE1NxqjRa9T4GQ?=
 =?us-ascii?Q?t4cPACWz74osuXvm/resV0nG3xCL+g7MNB9vOvp5XBWaXtGWF6MQlhyu1Rvt?=
 =?us-ascii?Q?yE8w71/Ufz81BhJrwrrt/XFDrz3jGZ2RIk8k9XCN2t11C27ClnqUOfnSGzYt?=
 =?us-ascii?Q?TE5Jj4cWAWkwKpQ0Myv/R5uHwkx5Ej8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980696de-b900-4b84-a92f-08de7345ef43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:42:13.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny5kwf9ZXUccpU8tyaZbgm02eG9vdg+t2DwQXCm3txNj2T3oNHvwY2slotT1IWsLEAK5ulIDMTS3xlIflyu1vqjqzfR0BUstcUVeS/uD2K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxMyBTYWx0ZWRfX3TpRaJ6u7ao7
 ua6qGX20q+cs2ifDRXGE/5fWy7fK7roHnHsUgEDTg2pN7GDOR5PKMcLncVu2injEFCbuMr8nz7U
 uiA6ch+pkIfeq9UhNqee2ggbbxeo0XflEEuGeR6EZ4akA4xpZ33JsDXlUfjciZ40y9i3nklmwrv
 ERI9zTA7CfFIxEnjgc/oMqLBg3Bx35ioJaexHG37YWF4Nfd9XyuP0VKvPoag5/LJqi2jRomqJRg
 zkSY+Bvv0V9fZZWE9bpGogDgakZ98FeXzKnnBJbMvCkp0NwElSVYDnhu78CtbLwF9aYx6QsHY59
 catfo6jPOvP30zO3hu374EGmqKyk67yJ8Fbm9dIgyd2/XFXxCmiJNQzLwHYtiKJMEqyNk02VM2Z
 UKg8eSoAFEnz9/Nd3VT279FrAg3OuGyMsrwgsbGAlVNbfQejON9OpSZah+yqJeTZrfvG+pCqYSI
 nn9z5GyvdSnD7CVa/nw==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=699d01f8 cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=XqvWOv5SAAAA:20 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=m7EnfL9Jx6ZUa0O7sp4A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 7th2GDjG0KRD_sXpb4yPdGFV1bhflm8p
X-Proofpoint-GUID: 7th2GDjG0KRD_sXpb4yPdGFV1bhflm8p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231721

Depended by recipe appstream

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 meta/recipes-support/libfyaml/libfyaml_0.9.4.bb | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-support/libfyaml/libfyaml_0.9.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b231daf485..bd16d6f650 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -349,6 +349,7 @@ RECIPE_MAINTAINER:pn-libffi = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfm-extra = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libfontenc = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libfyaml = "Changqing Li <changqing.li@windriver.com>"
 RECIPE_MAINTAINER:pn-libgcc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgcc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgcrypt = "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
new file mode 100644
index 0000000000..c5f2ef30e2
--- /dev/null
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A fully-featured YAML 1.2 and JSON parser/writer with zero-copy operation and no artificial limits"
+HOMEPAGE = "https://github.com/pantoniou/libfyaml"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6399094fbc639a289cfca2d660c010aa"
+
+SRC_URI = "https://github.com/pantoniou/libfyaml/releases/download/v${PV}/libfyaml-${PV}.tar.gz"
+SRC_URI[sha256sum] = "dac2b0af7b757b32a4fa7c6493d85d0f7dea6effd20ae4352570b6a450b9e5fb"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


