Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0B0E95A91
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:02:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64569.1767103320233714845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YsHxmIxK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDAUnP3613429
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:02:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zhLNl2NSGvJNCOW6F/zLd57C6NnLEpqpxLX8nnx0XvY=; b=
	YsHxmIxKmHIL4g5Gq2N+nAXNl80TpeSO0k5Id5HPBtpTNsK9ehCSEGIxgHvzzskZ
	dZ0yG+SPc0QTWCA4EXnPIoc3s+RGk9+GbmsZuUsG7Yh0gVKf3cqVXeeVaz7FWcSg
	GMtHIuAOl+ZodVGlDMyVsciTlS1kdEGuAMuIVWXUmREeUpK9OgdHTDwqY2xKrB/F
	O9CPkV+bI37RxphIB8MmyJOaHIHZKzvvQDZeBQMVx5NDMqLFiPEe+PaGX2UAJEFz
	Qzldb4UIWNH7gyZnZccDtv0qGvGIalCtWVcvkkh3Rt5T/RVSz7UxlZfnVKhGCdjo
	cWnFdWw6EvW1sugpY/V0Vg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukam2t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raexdSg0pw7KfrvsB5PKKwUCWeFYLzMt07fcVs5W6HBRdrZbeEZQ0wRcftYvsEGhRmtHLPTD+60GcPRB2JjE92W6WA6vw8hoa0hnTZ4ZQ1OUQzpyo3aNPV1Cv1fDHOjH8qHpMUHj5K0YyMIgyQC5KT5JkAqXHuqqFl//NKcIeUQG5sXSzIi17+gmFZzi0y7O31gFvWp1C41rmaL8qP97fXqa7Rz8dMUdx2+hAaPt2dtVkIC0mz09qvl79m/oeRGO+y458yvReHC8vb1OCJ+/jK3U0eRVCoL/7OVqFMtLDNFdtMq4xpOp1hKwEPt6qeoovXohyukKBVb4p7gNAVvSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhLNl2NSGvJNCOW6F/zLd57C6NnLEpqpxLX8nnx0XvY=;
 b=foM5aE81tiwVzJ3F8QDO6DkElzM/e8AzAtMIaQtVTZaXtqiHPmWs895ggxlgo+0DZwHyY+t8b0r9qLVxoUjn6kxWuGtf7RedtxN4LYk9NZQzr+bWQAF7SR8dwuXkPc12d1mDt/Mc/CHOk2GqTIO/74w9St1/pePTItqXPaReKvXXN2+3fAxPl9X8jS4QeW4KEiJTXizQxA3lRC2gFe40X1L8yX+F2GAknbVoEhl8QAYOoYz6FhPVF541EVcQECh8nRAiOz6acNxZO6moKT4uCC0tNwznZJRyEA9UB9CC9GeyBsuWJ5++STt2gxavDBJNslKOmaYAoj2knUMk/+1L3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:01:58 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:01:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 04/15] bitbake.conf: Include "rust-kernel" in native/nativesdk feature filters
Date: Tue, 30 Dec 2025 05:57:23 -0800
Message-ID: <20251230135734.1973083-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
References: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 192cce4c-bed1-4a66-766f-08de47abff0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p1qN6QSMAAGCltD6BYHzy3Zz7vpElngq+NvAzDecdV3hHgYR4XUdp1sDcYHr?=
 =?us-ascii?Q?5ntktR5Jj5niQbuMf3TApsUXQ4ljkfvVbn7Ky4PhzNpw8Q4doDZEHPMPmHeB?=
 =?us-ascii?Q?ZB2m8gV0I2G7G0d6s9X45XyxEU1DYQ7YF25mDyju4KMZJe5l6fb73JqN4z0A?=
 =?us-ascii?Q?Hb5j6UzvrEkXiTBlKRwmBn9hIfJ3uEN4QRhsMp9aD6FJBJolhCEmrPrMXXlj?=
 =?us-ascii?Q?RPiyjAXYMVrZatYFScWBQBpRV9vvWTeqNq+h/DbHZAYE/venWSV46Q3W7CPu?=
 =?us-ascii?Q?vuV8J4BDtXBTPI7nsyzi5xY0CeIQU55nj0DeEo86CvHhkWbLBPJ9KfyreRoS?=
 =?us-ascii?Q?iyJpj5NS3qUEEpKqrMHbRp0b9FNtikNO/5sa90XiagBzxJaBhXC7IHJA7Tyy?=
 =?us-ascii?Q?QpMM6oYd1i1JtM4oIK5VYL7YRNh8uDH+OJufFv0vN7Ql0YJzzrBU6HvpbUIg?=
 =?us-ascii?Q?lxCfNBDXc7q8DPcdHB0eHpt16M2u4nFtec/zVkWAS8rBlvLxbEXHpX5odcPk?=
 =?us-ascii?Q?xTker92WUDmum+2rB44Sl7Juyu3R4Os0etVmM1oymwPW8fDFR8dS4OgqBBVE?=
 =?us-ascii?Q?U2B9rdTp21re0YdSy2DikHRFUZrxKfiKYHFo+fGCgrkapNgexdPh/UG/nLKM?=
 =?us-ascii?Q?YLfIPzNn7iXytkLLo9x5OOsdunMA+PWj2yjeDxRJhaCLsDQVaIG9Ms80Pe37?=
 =?us-ascii?Q?1ZKUbZ1N9eJjc0VnfZO5HLxJvALdTwhwBQvtIpsPuVIT6fpwPSGC1NpHPO9w?=
 =?us-ascii?Q?FloK+myrLccU/5O9zN3J1Wa/thAOnTZani/2DuBZl4W50s5DQ2peCM21Rm7u?=
 =?us-ascii?Q?qyAdiCT2wrD3Q9pPQENSiWhPdQsRB4aFSbQcUnJLJb3815xqeE6+eDZyB/58?=
 =?us-ascii?Q?HxlfI/TcknmMVTUa0PALuxGlDkpGEN+QguAJctnfaKe9lbL9+KXnVK27KSGP?=
 =?us-ascii?Q?SR01QGtcY4w5cTjNT45gVPw6o3iMW7t+xoFXgUy3RYf5yTwQFTadul5Y9Uci?=
 =?us-ascii?Q?pg0mUPMyxNCnS7o/iQeZF7vMvUi7uE8TbAM3AIq+KD5zxbddw8LBxrLrfz3G?=
 =?us-ascii?Q?6niU5OwpLtZHnaOR8I63xyK4sjtLtTWc04BLJqSpu0jCw6+l1k0pubpU2mbN?=
 =?us-ascii?Q?EwuVZ1azuH+Uq92ET9JVCBXxrnm+mX+r6e8OefQ9GBwcR1VhbR3KMnV9TRoC?=
 =?us-ascii?Q?VvQLSrtu/J8lLnACb5PEAjRKzcTvbdjDFcCIr2RtLkr5l02aH0lrdu1Ntm0n?=
 =?us-ascii?Q?QzBlNXACNz59ofnuaYzLJvBs3fxIwCG7Lgy/3VLQfqe9xznEfBbrUf0SBpbG?=
 =?us-ascii?Q?4dqrEBU8dvg7Avv5ewzW9wopH6guE1YH7uZ0aNsMBpWLhctsOZg9Im273RJD?=
 =?us-ascii?Q?gR+ts81HMbPuM0GexWRvYi8zBfs3X/6D1iQrswPndjuPSjRwXi1FUEzsVRqZ?=
 =?us-ascii?Q?/Ytdqo6I6Pv8/GBGajo7XNC4c7326OocuJuEVwUYeeGAfoeMvwNXHCEV20M9?=
 =?us-ascii?Q?kYTk6/6UHehrDM7JRC6P/t+jktyNfIT/g+i3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fjdp5sxfUJcEuJDClpkuJ340xVQVCYmExlo6l3oo9bmymBeTFyC1as2/cPkl?=
 =?us-ascii?Q?TexJKYnKTu3jOubnyPL70E27DeOJYK9MKvFLN6wMY2uyGerSjqENfb3k/LDZ?=
 =?us-ascii?Q?TTZZ8Jmp3IUJueep11GBWa4L/CHasVFlNmA533q3ePB1sqsQTpeYkDYx30iM?=
 =?us-ascii?Q?LgNgzFaL1J3ZgVUncLlvCzYZLxCpG0/CPbixjXKgOq8kAyLmO9s+8kKMJo43?=
 =?us-ascii?Q?AGBcm/75uwE/4ZBV1LDqoT5Da0NwbswU76N0jlXOT3O/m8k6ah4Rwd2/+pym?=
 =?us-ascii?Q?9RPhXdTc9K+Jk7NP59su2/ElKg0CLxM8cx6gkWKiAlzo1/I0ITa3TuvD9r1n?=
 =?us-ascii?Q?1oF0wpGcHKg4ClebDL4GUo51iWaY+JBIghqIMTO6bZsKrf10qy97rC7lJwjG?=
 =?us-ascii?Q?0/Tgxpyb5FckpippQ636rSKmswupVIlsDA7VMRAMzofIY5CFnBGeKRsWHlzQ?=
 =?us-ascii?Q?96WrLpuG0zxE60ZiwphT0ddypFbqQxPvHcpYc3WuLGHZ7O3VSVrg86t7CBpz?=
 =?us-ascii?Q?JzvkFCmGNGhYFctksQlbP1B1vIwrHUz7XTy/u5BOaeg3z4Y+Brggp4oV2tia?=
 =?us-ascii?Q?0PeaK++hFckcI0VKV5Z/gKOvbDEgMViK59AXFRfAuIr1IFDwIVtBQYCbewas?=
 =?us-ascii?Q?Vzts/NhJ39WeR97s/dzZYj5Z8vDLPhfIvV4LilWKapjaKWDWKwtoFC8XL5df?=
 =?us-ascii?Q?wcc9J28hpkPxqeR5HeVLx8usGtXA65aBdtoprgDnXrvwQt8RX0A6TdOeAL3i?=
 =?us-ascii?Q?c0JbsSEfVlY6ggf2qr4C+d/lnJkc54tpE+CErwH8aY/YEbG8aSEUjcbvkyPO?=
 =?us-ascii?Q?i+KiOi4HWgU/0iuEnANVvLdNlCARUQcDXcPtZ6ON6h1EZgQWNYPDNEXg9I52?=
 =?us-ascii?Q?dRsgrYHa2VpabL217Lf5SoYmcwbNsYg3qALIrcO2WexD9E6zzlKoG7gf/Key?=
 =?us-ascii?Q?g9apHkQnT0lExvLoTmOtUrwA6iezGQBG56h+PjIR8ngdKiJ9INOwCfa3bwtz?=
 =?us-ascii?Q?YlUuFJDaZvC7EWajvj5t/tq0B78aKoOH4W4+8+0Uz8EDUMRKcpGYLeBBPCtO?=
 =?us-ascii?Q?X/kf0FY2yDoJLlKhGKwGfC3eDlGksNoSzB6WUubSBKNSJwQJ+fiDvjPWz+5k?=
 =?us-ascii?Q?k+UAo5QliSaeBo0WYAa7wKJJEv7YtzjGkLwlpyhs8ZXWNaJqvyA3Zepv0VOY?=
 =?us-ascii?Q?Q1NIX8ZoZFUHjdNYAKwDhbdtpvZOg26NQ0BDSaklc46ZS6zyh/P6xPBJS10e?=
 =?us-ascii?Q?zmqgVAtq4oTIIZIooRjNy1sP5vt0jpB7kkMWJ2qLwKvnwLhqpuhKm7J8nXbR?=
 =?us-ascii?Q?rhTx1s8w57nZotRUgm/gkl/iq+dfc8b1LyBqDmvh9pFF4YCeJ7NGwfADOS8u?=
 =?us-ascii?Q?E6koUQxjBBxihoG4/RlnSBCQ1pDJQGzmgpNKZSdGJPwQegInytxGx9dQwBMR?=
 =?us-ascii?Q?mfcpIMD6IGgo8Tj2ZFhqMfAZt135xt7UTAuxmBopsOxGzKAQRfnUJaSUiFHh?=
 =?us-ascii?Q?Keh0f8uGBwn3mWFuYc8/vVkBmhRDP+wfncFahGoniOpRbu6zuv9WYqXDA8OB?=
 =?us-ascii?Q?mvwJaxwc+o0lUBlE/zS4WDRvckKF79RozKBckbzgb/XbkD8HFvTvfYbWsh8X?=
 =?us-ascii?Q?bjDZ+wClq8vTSYtxcOwUZAAAVgWqYUysXM3Z0qiOqEVbTLX0inPY2H9IZxDY?=
 =?us-ascii?Q?bW4Esmxhs7WyWjPJjDgR6P8MeFwILnrY5Y14KESNtM7CXwYVHDiPGLQafev+?=
 =?us-ascii?Q?n/hb/UuGD1JwxbtwSiZdG+gjYpmQZT8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192cce4c-bed1-4a66-766f-08de47abff0d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:01:57.8735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBwljnhmTWSyYdidtqjxvOmoKalz2ra8yX2UE5q5P8kVOR6qDxL4RUuez26RWR2mjiIY5TawSgWgc+ERtdyJxAmKh5+yl15+/UXeKjoQecg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6953db57 cx=c_pps
 a=IDmSThB3jRGgE2uwFnJQpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xWBQjpzubWhZ7YZo0B4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9MHiC0B0BalzWJ9ERHTm5gh5XGYMgNkh
X-Proofpoint-ORIG-GUID: v3gkcoX_EiGQ1Q0XHKxgkf2c9txwWUSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyNiBTYWx0ZWRfX5FQyD376pyz3
 Ekx3IkGEWuiMeOGk6fWvbtwVADQmu5oKBVWnrUFMM2YoPpLtP4/DkYUaXgWS7peDKZaskcGokuD
 FWMEgqAnSHkg2sZPxg5S9j/AaBn3/AaYvvveTFoqMLOvyWvVpRn/lfkSPTl/YruwN1oASD0J8IK
 IE4ScpVY5Hiv7oSRk+xpewszX7HneP3ai8rdV/Y3q5D1DqwtFCBDP6gI+DlMiVsZRLHrMfI0w1b
 AzmtByC3bqaXq3prZvlxW+GqlLBYAeMM3k00jPbNpYT++HTM1YVwJ8WxZjXjDsGYU79dW0jIc6g
 V6akMW320xKxP1qJM0ADJDnxI6Cbj0d0qEkHeq1PDm6YwAj0ceFhouCW8g1M4J8SRjmy3uVtv2p
 yhjR7vhPrlmh4KmlZyr7rFTjH5/R3Pv4UP1w3JnOQqOahX1mcAuvHaRQ/1nx3PoIau0Rv0fmUMZ
 icMvHDtkYMMnYQ+xUAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228664

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When enabling Rust in kernel, native and nativesdk variants of rust need
to conditionally install Rust standard library sources to support 'make rustavailable'
in the kernel build system.

By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
propagates from target DISTRO_FEATURES to native/nativesdk builds

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 88f4d0df69..c0bebc3ceb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -917,8 +917,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl rust-kernel wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.49.0


