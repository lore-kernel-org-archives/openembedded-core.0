Return-Path: <sven.kalmbach@loewensteinmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323A7C021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:54:28 +0000 (UTC)
Received: from mx08-00640e01.pphosted.com (mx08-00640e01.pphosted.com [143.55.148.42])
 by mx.groups.io with SMTP id smtpd.web10.19323.1739375663770354564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@loewensteinmedical.com header.s=pplm042024 header.b=1FOUUFop;
 spf=pass (domain: loewensteinmedical.com, ip: 143.55.148.42, mailfrom: sven.kalmbach@loewensteinmedical.com)
Received: from pps.filterd (m0376841.ppops.net [127.0.0.1])
	by mx08-00640e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CFUiYg022565
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:54:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	loewensteinmedical.com; h=cc:content-transfer-encoding
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pplm042024; bh=4nRA4rPTkFfMiEx041oW+vNdYobM03pKuEhuH07dsxA=; b=1
	FOUUFop4S/xXQ2e1ExrDhae8GT6Av/TKC6vZbquXO6w6Ivj2dSto6Et6T41YXjo+
	qm552dBHFqIfclI7RoYzmetqezO8qv1LBsivbowT82IkHhcy5CL+Q1SAZigNH1Uq
	HZi65lchfWyqpZFYZX7wSSMq8l8PgOcpkvIQLIMBSjlkcPYJDYY/DPabl7OJp2jQ
	9V/NCUeb01nSJ/xZn9AznoD1Pc9dnVkXTHNOS+w1sQrsYjX4ijvVQTq3LeWbwTVm
	xBqCgr1ZeiQ8m+Q0lUft1JXcGYA7o1Naw8yMMiYKkkQHAf3+7CKea8Jj+b0bFYW/
	nZkjPMKRlidCbVoF00tiA==
Received: from outlook.salvia-medical.de ([91.26.250.91])
	by mx08-00640e01.pphosted.com (PPS) with ESMTPS id 44qx14s82w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:54:20 +0100 (CET)
Received: from LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) by
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 12 Feb 2025 16:54:19 +0100
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (104.47.30.106)
 by LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 12 Feb 2025 16:54:19 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yv7/9ouGm4EzU49M0bP1eULiRnUDfQPAJkQwbbIKqQ+iBPBGcIp0hvichgqwBaOL50jjEHbpci4dqNJ2qGXvzHDqern4Npuv3Mhm/5jD5yKc8nK58uecPhoOFKe59O89ZC41+6e9rrOgAjXQInAeDi6hmXp5RrXgJJ39uUkAt/YOScib51HCOw1INf2IAv6owHRP0LfbU8ykfjuj3gZoCit1TfrWSin8a3ORzE1JMELDZCs5ApS39QftODlbhZN+P0jmG4QKTQ7PqB8Yw9E1RMt6U6JVq9aaSUmsWQM9xeD3oTzvzLyyzvE3ShlvpQXbCcJRGVureIgt3MIFxWAt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nRA4rPTkFfMiEx041oW+vNdYobM03pKuEhuH07dsxA=;
 b=NJGzkEqVhPCQGkBSlgF2+Ryr3vx6/FOA4jDj0dBqRabwMoL4gudSGAu4NpbGWKbxXTeZgnyCVBEovzxt/Wgx3D5rKDO3L4EhGDn6L66flvVa8qZAaUj56+mvg5isg8UR1Ix7CuiE4elEDgYBArX/CDiZyGH5f33QhpWHRzUUeEkWVaiCwIajW50xfidxzY+SDaceHZkabEdLdWSeAdpaA4Bl4pCI3QcK7ZzIrntPDdmTqgJxrntKVfvUOsQ2uQtzVdIr+JgFC672sMqyNua3OUUJgwxEUEEDGDFrVLpaCu314WArGa9VLQc4++GShhlcxtKkzZbEWCbgNRQ6pzdx7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=loewensteinmedical.com; dmarc=pass action=none
 header.from=loewensteinmedical.com; dkim=pass
 header.d=loewensteinmedical.com; arc=none
Received: from PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c8::11) by PAXPR01MB8335.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:21a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 15:54:18 +0000
Received: from PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 ([fe80::3120:42a:d1fb:90e3]) by PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 ([fe80::3120:42a:d1fb:90e3%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 15:54:18 +0000
From: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
Subject: [PATCH] Fixes [YOCTO 15731]
Date: Wed, 12 Feb 2025 16:54:04 +0100
Message-ID: <20250212155404.76504-1-Sven.Kalmbach@loewensteinmedical.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::18) To PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR01MB7568:EE_|PAXPR01MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f46ac7-b95a-4991-b136-08dd4b7d822f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HJptYnawslw4hn3uA0c0m9mN5imjXwG8yua4LlcHFZ8cr5DBa4gjLoKFZ7zp?=
 =?us-ascii?Q?thqWVMu92vXa/nZ7/uSapxkH3DTnjn0sKIw1ZuejpG69a6bfhClWk+wnXPmo?=
 =?us-ascii?Q?nKZcGlHxp5NX1/jS7mo5MShOZIvR2RDlE5KArr4Avx13uMwyZL/EyiyckapO?=
 =?us-ascii?Q?aFHZ6UFO5BhpVL9Je/BklIl5aPhz1Lp7LVPjN52LPhGWPLDJn0FtGBGyWhIs?=
 =?us-ascii?Q?ORYTSKXU7ViKH3mZKD3KeHZ4y3RHERdU3xIhC4Y81q4ecp/3nDDUmnRa8+6+?=
 =?us-ascii?Q?5LiMrA7JcyPr4mP3pTQEDI9mj6477PT620bn+1ZlxfFqrEtcGVKXcAeChR4d?=
 =?us-ascii?Q?St7r1fgm19LtL5mvg79a7XLOLIhmQb9oY6ch1A1RHXsYap7ryTOEht2LnLwH?=
 =?us-ascii?Q?fXc821eZ2EiOjedjM6mPSdS3EIiNN78mPwVfVqI+IP6zPKGJuyXeusd+Qpi0?=
 =?us-ascii?Q?vvNN314dLqsHUmt2ZBjeqsciC8xo1wnI+QysbECUS/pz4xyDiHWexO7yke8+?=
 =?us-ascii?Q?UVgBaAgyzPdNjTM6Yx4MwcEILuXdxVNKsidFo+CK3bejAWHmOq/ZmLyk+Um3?=
 =?us-ascii?Q?WbsSihf90bt4sm3DfmjxCPbznMSZoMbStmhEd2gFVo+W80/KBd1X8Ha9Ijz3?=
 =?us-ascii?Q?apanCZBd2+ToxJMxmq7SFY5SOORXjgFX4KverhN1ka8j/YmqUPemfCU1+Gvp?=
 =?us-ascii?Q?bkmqjSDCXKRHUMMVDA+I5nF5WHa+gZnh9GTQMrHBfdoFPcNsXeaSZRsklnll?=
 =?us-ascii?Q?8jmkvrusGYaqv+SXnsRZvM2EwlzxmwO9FN7qzqtjwDgRAeaNsmOMxoV22euD?=
 =?us-ascii?Q?hUkchjrtni8PnkYMguyUjoMhFlTkPSTNQg+pw/u3vSun+WbAk3JFBCuYhXEe?=
 =?us-ascii?Q?Ovx3lLp+bYEjjva67ZWGonq5XgWzsL6jXbu7aD60EeP4y1FFCFaNMxzY0Gi2?=
 =?us-ascii?Q?6x4U032HCXrpYBeDkQSdtA1LPpTL+IXvHkflarzEL3RnjcnhhKDGitCBP0W5?=
 =?us-ascii?Q?5jW8BktN+7ovZtqp1Sitk8LNZYMVXto6HD2mv9uH2UfAhEpToZlQEoyHkK7j?=
 =?us-ascii?Q?Ba3rFTXf2jpcqAow52KSWwYVO2gorH3zpEAIpIFmke1anCcut26vHhki/5Cr?=
 =?us-ascii?Q?U27Ehi1hH/jBuzsQkCDD9C5c1LUBDxksEN86ao64Q/UYkt1JhYtO7nI2nNB7?=
 =?us-ascii?Q?O/IPRMZEtcnoPggZ+3vd9f5IfhLY6Y863XdrHfIxKTwFywWAj611wLdBYDxr?=
 =?us-ascii?Q?uvVyVpe3hKQpLwR7Rjycde8Wav7/LN601eALYkE/teTDOjiN2Sx6XKWfYdRC?=
 =?us-ascii?Q?AZ0hyR2YsiSbnbT96wVXuT3yBxG4XUeeO0qaqwXgWVDaH22zPJ3xj4A49wMF?=
 =?us-ascii?Q?jX4DiKB2pdPp+h81xIfgg1ejjPAe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7568.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dsXRi+WgrZS0+oGZSIZzcitIfiXnxims/sgoRcnfyr8OiHDpQUMEKvwyJEd?=
 =?us-ascii?Q?Dz9JT1hw6mkIzUMfY85lNw3HnW8M+mjWtdfthf7tcQ2C3KxFCyjTnw2+N4O4?=
 =?us-ascii?Q?rGU7oOcH+CVCTfVNj+O0jHvTJxeBCiv4NsH9miVmG29CR/IpOXufcnWMaGcd?=
 =?us-ascii?Q?HwFf4KSFOpaF7u9WoaOgcnDD7bBXuMG81xVa7FxF5QGi6P+n+pYebhAdxTvb?=
 =?us-ascii?Q?LiGbGPHE903urclQjpdV0meELT3DB6KTw2dludLjX/zVUzQZyAVpVE0MMQXy?=
 =?us-ascii?Q?Ni/gCz2qwdBT0gVqx2hoJECiNxkER2uWybitMt7eJIDagx+nRJRmV208iMpy?=
 =?us-ascii?Q?94sd/7/drWdCMpbNSLcZgN5I6ePkkeKhxaC/cokBwmlmucpdoJmdJBpKs9f0?=
 =?us-ascii?Q?oNqKP4Ib39S4z60Dxb83WfLWz74idyv0PkXnBFo8noaGKu5MKdBVEj/qdi4j?=
 =?us-ascii?Q?3pIJ/Qqpi6HB2dNaWIQossht7FQGjb7jwkLSaHbK/Jtw6vsVVd0rs8QQw5KG?=
 =?us-ascii?Q?zGfC5OtydSSFea3EhtZ+mZ3pxNQQ5FksbEiSDjIqvKf2gY2BjnkcL/4rGGO2?=
 =?us-ascii?Q?pYl+s74TZhWrIxFwpIihKV2H5Abgau4Y7wobUaX6+t7ywzG7h3Bv++6/Ta2p?=
 =?us-ascii?Q?Rann9U8unZqHhuTnFC7/L2/N83PagM0v7Mv1opEhK4W83+8JPYFAJQeVPIwR?=
 =?us-ascii?Q?qMOFGyDTncKyW1hH8sFjw7xkSoVMGu5WsV71QZYdHoWNCjFhaVy3wLcsunXN?=
 =?us-ascii?Q?qO6SDFt1uBbVzZ7C03KY4M+lDhxHBRmHlDcZaxXQRU5kwRhwu5MTRrAiCsjr?=
 =?us-ascii?Q?ZrWMhbm6NPHAsNI9SfucnyHkHNuah8ZrSb1rrHv+Q+yBtVeUTBoXe2ERIG/r?=
 =?us-ascii?Q?/ddSeNDaQNBO7UdvH2fz+GwQFL4xnn8QiZ/ziWkfkU/nMwk+13av0ZhZiowv?=
 =?us-ascii?Q?vA/32zSrxyAvBVK6kTbeOpUBGS7bwd85D69ra1i08PvfsBjyTj9k5ZJp8In7?=
 =?us-ascii?Q?/+SLqZqnvDswCoiCZaJeHDhl39s5utDU6e7UfSKEHREQ6PgmpvVOlwMaVgak?=
 =?us-ascii?Q?qlvsLmTKiHcYulY89Zhdkpi+MriBs5XdzZnnTzqR6EgXcDwq2usDC4CvQUFA?=
 =?us-ascii?Q?9dO2s+NKq2c6EsRvJjmHnnF6PCVYu8aD3g3ONc77NMKk58GoM6nUbzfWcd7W?=
 =?us-ascii?Q?ze34SLFZ0zo6/gWng97b8TlmIHsOUo9EcpUJTufCi9ArOp1DkDAcdToWP0cz?=
 =?us-ascii?Q?PvgQVFIRSKG7818iw1ggDEBEttqu9ZnvvS7OgqZcAbhFMdUFVaps5YMH0edp?=
 =?us-ascii?Q?FUDKJ1c8zQfgDrVn0XElEHnmmilwQjy5aiQEcAZRvJKzy/jgbEgDfz3kpU9l?=
 =?us-ascii?Q?kW5w3yWFwL4nVKCDRkET9/TUhH97PPM0jpJIV5SDFP/oBgrORKXGETtUMh62?=
 =?us-ascii?Q?rig9VqrgjifDPpCrF35xWlo7beT4Rgpgrk/NHZye529Uw/AGJWHfLchdQIt/?=
 =?us-ascii?Q?ySL7MW2/MlOK+3kq1lIWaBNgB8tPTrTHnDW8phGf0lQncJMW0T5cOEpoQzIO?=
 =?us-ascii?Q?81gSOfuNff6JUdlo1Dl9rqRkjtLo0xb+KnZPN5HknBxfSoNsCs+VrVI1/u10?=
 =?us-ascii?Q?VzlGauQyiqk7pK99B8gWaq8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wtaMjoz1nLqMsA3j9E/JziIHFjmM5CAtuDcZsyWdm7Q74UDws7GLnSItercT86+K7UMnni89E3ubd/VJSWe5rtzdDm87ofTixmajaSsJovIO6pxGVbJkSGqkA3liPsbEE8NCQOrAAc9f0FdfjxMIf+F/t69eBE2Yp98kn3SIcXNKp44fZtFyUsiwasG9u+oeoL6M3vZ/htThB+56pxBuF1aF2pDXwhGIFi8B4ZPNViXRKwSyH8F/JhxvosCq1E29UUXho+ZnEFKOh7lERhpr1NccvqpWklTYQ48RNguKqvqscBEYf7VvHDMunWoJoIiJHK2UX1U3LNZqCeqTb8Y/CvtTATkQZPDaoomAlIp+WZICRkskJvV9C1AdFjhpMJZf5bqBsyhRneN77l+0SpfNBV/yOziyyj3Wq0e0djFCb3UQnhoz93jNqEZMxTTp6VEyRwhh2FOEMNJeoCCc3EIWuUTGBlu6WQIToxbarcBxxA0ze2gtNLoMYmXAfK55R67Xc3Ab0xR/tIAAJYb5OIbtWd1eRy9r0MoYNiuW5Y0X488R9bxmZrvKDD//MwGU9jZxabLiEU6WPr+XPK+BaTYOpFgToE8/nngK1bbAq0Yhtzr0Tp+dVeCXysKx76vYLrVX
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f46ac7-b95a-4991-b136-08dd4b7d822f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7568.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 15:54:18.4649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4620751a-8ca3-4df9-92a7-6fb9b06279d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t3Mxn8dWdbL9d1ldFQVEZI4s7jZo4S3OQB5qH2PfkOTQHKyHEfEKwjG15P9J9LgoJoXWc5zz8qrZO28MCb1f3QqRRhBicRrliwWCsVAJ9oz9zDRe0ShdPaZZAjkm0P+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8335
X-Proofpoint-GUID: gme0F0GZUs3JBoT6Rp5iGZUw16ieyqKD
X-Authority-Analysis: v=2.4 cv=ZfnnNtVA c=1 sm=1 tr=0 ts=67acc42c cx=c_pps a=FEALSKi4AvoWtY0syLDQ7w==:117 a=FEALSKi4AvoWtY0syLDQ7w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=pnnnEMm-AAAA:8
 a=HmD6kAHYlZBo5eqVHlMA:9 a=L1VgJ4hi7dtVfwbEAIjz:22
X-Proofpoint-ORIG-GUID: gme0F0GZUs3JBoT6Rp5iGZUw16ieyqKD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211252

Remove incorrectly escaped exit value, which causes error
handling logic not to run.

Signed-off-by: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
---
 meta/classes-recipe/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
index 0bf171a668..d18b008aec 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -58,7 +58,7 @@ python do_menuconfig() {
     # ensure that environment variables are overwritten with this tasks 'd' values
     d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")

-    oe_terminal("sh -c 'make %s; if [ \\$? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
+    oe_terminal("sh -c 'make %s; if [ $? -ne 0 ]; then echo \"Command failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)

     try:

