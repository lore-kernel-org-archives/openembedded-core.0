Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576DACCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8995.1762348200451292186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Be5AN+7j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5569SC1550520
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 05:10:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NHutw3+nN9HxpXSEj08JpWHkTcYpU1EebqMvH1LZl48=; b=
	Be5AN+7jEwH6o46jGL1Aj8WNpTrKOIo0DVdNPlfonESZCSHogC8CuDKnSaVlj8Sw
	WYcF47pAWxzsM1RElRF91H5st7ABgdhapHH8vrvrLYQu3AcnzmugC8yUk9C1q1Vh
	mjZjXn1rsJcxcRrJnO+MB6QQjvb1hAfm5xrn+vuuT6otUWbkuCRy9yJKQae6XkWY
	16B2/j1Tf4UhXlzzIsyvxeO9Z0rbuZpGhF0e2+aJWH7wo32sp+am57tw6z0NniMb
	gA4Wt880FJcjN2JeUqHybjDZFx/f9FDn/bPCSjy1+ExOdOcOoncjiCU31WRMltmF
	CCDONXg2jaP+CnOjtHPNKA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gg0g-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 05:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mag2YlC3FXh+5/wKFwpykt3pIlaASxwtPDwL1UVvWLBqpoqVL1O/TVpcRWijnj4/7Yk92m1STnt1Htco60AWJtnQPq3ZNSI2qcM0Rq1p0MxSiT83o7BqsRK6O0acdCwTExU/OJU9gJlDNVt72nerbU+dCGpVaWhM1drzVQn495uMVdZoi+kxtAHL5PAGYSjxP3J5z/VbAjleS0dOKNT+9eFJVJd14j/WlBpY3o36RzhlAigd87WNDOOD25IKLBjiNlDMW1JCj2W9eb6EPR+1JvYFkXKz9fvcZ2bxsSb3vdrOweCl8t//DmvZx6jo4lzQQrPZmz90uYia+d8Y7GYtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHutw3+nN9HxpXSEj08JpWHkTcYpU1EebqMvH1LZl48=;
 b=rugxjzvIoLdH0Fg6U0HpW6k84r3iQjgbNuXlKm8C/txGiaM/0eI/4ZWXm/XYJ2P+ya4JdZb4VlbML4F8WhPXjHz9IB5mK50ZC98p2fA2PTC39CxQCHqn3gnUdQa0KZaG84zg4YJo/I9bFBO+eQ32Vjxv/vpLJWL0dXyOGQ7+OSfGOje2KvxP5ejPKj+S9bqCCjskQsiSPyuzKV/lzm+GyO1ntCGd3Gpx1E30Gy8ZVq0ptri+7y+T30gUbWXETW5HI7bP5iTXnjJxTE4JFQ2GIWMkXyZpdhvY4Y0EWwdTSfRfiq06oB3fi7FBpMxcsroT+eA3jNTg/yP8psjb8aC21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 4/8] rust: stage rustlib sources for linux-yocto make rustavailable support
Date: Wed,  5 Nov 2025 05:09:38 -0800
Message-ID: <20251105130942.833204-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1eb0c6-1d52-4dfd-d649-08de1c6c9efd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hW9rN/J9NfZj9POXpMo2vR0uFTLCPrdeksJtrauPivieUcNOIYWbf42TEOg5?=
 =?us-ascii?Q?eA9LPQoTY1XCiJpiIQfVqnBT4aKvQG1lqYdPGlsRwxOHnfOSpW9zU5LqDDcW?=
 =?us-ascii?Q?0NGWJ/Xtw4JKrQkzEWOa4FpdI1X4BfKE/rN7uydMMoCiKWHmAUxNMpVhqu+i?=
 =?us-ascii?Q?cO5vmD6xenEhl0W+WX6PGMEC3cY2sEURVtTlHxl/yQjGGxbBEDuTbKKbPtut?=
 =?us-ascii?Q?qCnltB2rI9QWenkjzgDgRD1QPURCFESxcrsvZ+IuYnJ36JcHdvBUVpHHpPRx?=
 =?us-ascii?Q?4bumSRc4j36yGAbTY8ilA23aC5nj2+9z9U8M+4F8LeXA7E7TRupNrGOw2V8g?=
 =?us-ascii?Q?dIcDyGgtQoYm0gVnvq+mgukziqcu+SQrASMHFLlq8uKS/vYsdQc3KIPpG9VA?=
 =?us-ascii?Q?84Q43yzxpR1klQRqJc3xmNvDMK837F9gRJo385Nyr+NWYofAADGPLhb7SCjK?=
 =?us-ascii?Q?ifRhAK3Hr1WbLjUs5hnYA8zap5007/AyQVSGiAbyWRDiciTqHyuOGyhtRyxE?=
 =?us-ascii?Q?IKQoSdTIX0JLR+8f55mu9TDbLHw4duP08yft0Guekh8XE2ZZN0Xw/oH1wKna?=
 =?us-ascii?Q?dxAPauXqUrI+b0JostPavTEcCfGFI4c2t6QytftD74WMsuEKVxy7XHrOJfMP?=
 =?us-ascii?Q?qsF1m8z7CO+JzMJdnikVYzoX1if7ZBj8jQrzb00zn3moq2FIdawMF/clcE9j?=
 =?us-ascii?Q?4rUm/gW4TrHbA5O8jK7Wvt/OYqXI/AREruClxFBcp9r+VPilR0Whk2glPKRU?=
 =?us-ascii?Q?RvutqenG1p60k1NZs57kgFKz6KI8snJ06RfPHOJRuqI1a/fR5bgGKuNo6qcv?=
 =?us-ascii?Q?dJIEYDX9p2qD8aYngCz+jET+QEzeMfNM2VVngC+BPN+olk2mgVVh5Xvb83CX?=
 =?us-ascii?Q?1nF5PgaAF6kRP9GH0xS+PzNpjL1Y2j6UktrkiAvkHE+vUqKgZ7tdAlay6aIU?=
 =?us-ascii?Q?HEpXzFU4akyxbG5/oy/gJMJVAaUxYqeOhVL8QbKDunvfn86SJvZMbNWec6kc?=
 =?us-ascii?Q?soQNf198xOuEEQkbmwnm2p/aiWK8PtmEQT0VClvByeFyiIzFMI7fntDnIwtS?=
 =?us-ascii?Q?6CRh4meDLH9VFJm0LdYVTdYKnVwQ52xhWoIpYDQ5YfRNZ89dSiO9I3fFEfLi?=
 =?us-ascii?Q?D7Qgi0SiTusmcekZyrDzYcDb2e7NIlDQ/Djxpq6N/aNhQ0hhZ7i2+DW4KuZP?=
 =?us-ascii?Q?lUPt+vmEhdi9L28dKQFY2OzNFua/0zCMtQN4uFKZShdHeZzof8PVrCSQcvTC?=
 =?us-ascii?Q?iGS8mFNERq3LGKR65q1SO8zT7ndbLYYxPWHFZPo1jYM3xJERl5Pb03rnE3/1?=
 =?us-ascii?Q?7XQzido3kl5NQjDIMJQiiPB/6dPW/pzyNstC9IxEQSZL3CvdQbO/vLvOni1o?=
 =?us-ascii?Q?GnWV38RkkEv+CRGc9LNEs1o7FgerEhoQ/jCgK1wtYZauAXvI4f3pjhL1lKyQ?=
 =?us-ascii?Q?ZX1Gd9EV7w8fjTBeOXDyqEQarutMMmv6JByM3lfpLbm2L1TUDO430y96ukVU?=
 =?us-ascii?Q?1yQs7urkSfyCZdklbrBk7VYPg9blgrwwKC41?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WmjI6KJwExv3ZXd2Z8fUNbxekd+ZxPZA9Exb+v+49RrxdExmPFwoJKluIFEF?=
 =?us-ascii?Q?zTUtD0EP+U8Zu6oMozJyL5vXG/fJGm9HF/Nn/pq1DceKFbR4qANKav0EiIGc?=
 =?us-ascii?Q?zq7D2b9SfB7wGkpS2OH+Gyq13Lu6Qf6ODjcNVNoyHRpRKl1FFrSt43S3p6e4?=
 =?us-ascii?Q?YdRsQvdR/Xf1TAYqw9yTlJf12OzUsuVK43nmAYt/bN5dw1sRxr6axHxkQ5/H?=
 =?us-ascii?Q?YSKRTN0Cb9lWiF7rqTNYQT2BwTTdxiNsb3ci9wK0qC8qO0esUSGTJmn8Fv5z?=
 =?us-ascii?Q?efmiB9djBAWBFa6yO10oLdGgN/Ln+9gq+t/ju99/gnhJvpP84B63YrMkT0ZD?=
 =?us-ascii?Q?3MW/1PzBHQT06wse21ru5Sq8fN/PHRHciQ+UyT5Nm3a5diem6CyKqqjpEB5d?=
 =?us-ascii?Q?b6sLI4vmr0LtydruBat4eNMBDHAqxrxtnMwfWWG1R9+tFVjGplRYTb9aorfi?=
 =?us-ascii?Q?hAGPEPYUhYijySSIw2rKbW7NiLc66iF97ljviiTOoygyDJcUr4ryYpkXbUI3?=
 =?us-ascii?Q?jN/olWvYw5Lucw8XZlCvQtaQhtzYLer18z3NK0/MYvGunxGkQ5GBi/L86m8C?=
 =?us-ascii?Q?d4iAnO/NCfE+011LHOhNQRQlTkCR3XJN5pn5nNe2b9zfZnXrO3LeIg6b2EH8?=
 =?us-ascii?Q?3rvIpB2T4dbJ1NB+qMAzZelvOcepOToUiKfr3yB4sd3Wn/z7iZxJPU6E+Ukp?=
 =?us-ascii?Q?G0ZBjFDZc1QyKXePRkUDyPG2+RjaWEvUFoUUILX/lEmcUNNW8SXXnNtOvqrX?=
 =?us-ascii?Q?C62hWrrCKL2Y/iAcX6QjSh3vZag8uHXXRVzr5X6LdKl+noePNb/hjuIqm3l0?=
 =?us-ascii?Q?FF3Xo1VndExbRyuv+c5eZUNs3UCmc/YjPBVQ+XbNZOUwvcsgKx7j4549VNrN?=
 =?us-ascii?Q?OnRa7w8bwNKL1ipgDa28Rz+f5c2dGd3uojkyMOdpqziO8PdbEHvyrpaJulNg?=
 =?us-ascii?Q?g6Tx1N8r1j0X/LZc795B6ySZP4GfYnjKTfzc1JII5/RfA2HUEHg9hM1hz1bL?=
 =?us-ascii?Q?fxQpsysvMLIf7AeHYGg6FbBrmoWmmKHtdDyj4LT1yB6wH4XhIIgbgvdzmyOA?=
 =?us-ascii?Q?kVkHwvCLKPJLSFDJoF2iHGSYtxGSuKrg5o2bdtPTL+jVaU23s2QpXcbUy1gB?=
 =?us-ascii?Q?xDcOTHg4l7PSssTLJeYniHrYWZTMn1XI1dd2QNy0EARHMvB+0E3wWwlEU6Bf?=
 =?us-ascii?Q?6yV+mixPsPQ5AlalJLKrZGZyLgYn00Scv2YWBGmXYNyu4MqlZSPaolv54s7f?=
 =?us-ascii?Q?8kULnXsEpIaSQLXkPHyRpY6371LrUlZC3s1vZbgfGX6nGlBzqo9xANvjkXXy?=
 =?us-ascii?Q?6Q/lfdPnN4PE6XpYNuzNwV0Z0u4w1Y/SIm0XKZmWhVdovCgZIHzEUFh/gA1X?=
 =?us-ascii?Q?02nY5j4wTeVyB5pYGmIhXmxLJn4gpCeKYa3emOmohRXVLP5hvmKBXMtVDnj0?=
 =?us-ascii?Q?ltT4USWfwUrjalzHvWxASCL+8PVcbXM1Jrdo+RKepS/ZXmeUpNxX1zUdXnRi?=
 =?us-ascii?Q?1TE93IEzjeUTr+zNFI7XEKbUXp1QMrXoqpKnE2SsqnMm8k9C/gLzl4ycg1Do?=
 =?us-ascii?Q?EhGcJfTRSYM3peV4zx2D6e6j0ZW5HBolLTLrn8+moXr4Glkgir6TDYVEi4eA?=
 =?us-ascii?Q?MrYC8Bb2gKvNSQkqXYP+eLk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1eb0c6-1d52-4dfd-d649-08de1c6c9efd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:58.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YS0zmk1pjk9Jbs/kF9H2Y/2lngGXigkP4fJCLWqiuxwtTLQyPKCY2Ikrvs/sHGwmY694e3CsccTgEYXbNPMLZcyCVSf0H+XZVb6ivNYIN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: zAJ5hKmHEmdCXv8qA2k4uPpxKuAYi3be
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4ca8 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=FD9bmQR3OwHyGYSGjRsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RCZGKRU8i_C2B3jBHF2uRAMoDdZggZpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX3HAyPQ1dzcDW
 TKY+NObYDC5kTfQOzx4+xE3e366v83is5ZkISkclgbf8/ogIXtMxrezZ2SI0U6Wo/2kmsZPHvVt
 BaZ6RAN1zsjnnstnLXD4RmUxvBPoSVW7RHYvtZGrNjKLdVe7nhQRp0auu+H0a7wvzcevsSUvznd
 VeZAaaxXTQioJhbiKzaMRV1ZGoObBBeNYDU9H3VQMDr4KdfZpbbKhthBlxThULja54JM3lMSxOF
 JW8vzf/GSy/WtlB9TessHWHeH3L28SAO/tddLjBjJ+8OBw8kZEXWr0cbkIOI8CNqvNrhYkKYlN/
 gYZ1hTvuAIvWnNVkoHyUg2WpkwLIfujHGx/WvqIXlj8NwPBRHfwBHioGmoxBufWBOYrFRo46oS/
 Sbqv6Uk6KSyyHEDSfG7RuDIZ/ajKUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225760

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building the Linux kernel with Rust support enabled (e.g., via `make rustavailable`),
 the build system expects the Rust standard library sources to be available under:

 ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index e2ffd96b59..05219d166e 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -71,6 +71,14 @@ do_install:append(){
 		rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
 	fi
 }
+do_patch:append(){
+       if ${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','true','false',d)}; then
+               if [ ! -d ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust ]; then
+                       mkdir -p ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust/
+                       cp -r ${TMPDIR}/work-shared/rust ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/.
+               fi
+        fi
+}
 
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES:append:qemuall = " features/kernel-sample/kernel-sample.scc"
-- 
2.49.0


