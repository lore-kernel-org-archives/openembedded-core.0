Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3419FC56204
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 14:35:23 +0000 (UTC)
Received: from mx-relay141-hz1-if1.hornetsecurity.com (mx-relay141-hz1-if1.hornetsecurity.com [94.100.128.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40179.1771598113263063587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 06:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Ps0N4LId;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.151, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate141-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.162.104, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=pa4pr04cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=GAsvGJgPXcR8l4bCdEUssKCt4BynULCIuEKkGPxI2OA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1771598110;
 b=NbziGErofuDvZrg3F5UTFCyioHe8VvLETO6246Lwb+PAo1ZvxDxDRE2BwnHSHvRCb/1mZ1XY
 4LZa8kWvcyt/DtZ3c/9VIj2VMzR9kH4UWrKlTzPleNd3yHZ88/z/2aiMi7gcU527YQkSNhVxWYg
 k/rUiSFAJ7/AThsDjEbHP4lcg/BYu8lu3QLA/j8qz7YQZfRlVIuVqkDauYVYfqpbwvh/dGwMGrH
 f240mhcQwpWHOf0QGWhJKVyzxt3H60u2EMe5GCpoCvjFZIDqhEublxdDxBp6wJLAqXPWhx/I5Q6
 To5o4V7UNUumrTmah5wN2YyB5w+f+P1oaLNbRLNM3BBfQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1771598110;
 b=a1s4eMD+ukcCDaKgE1L4VyxxyPp1qe6yQXI6a0b8lYHfNl3kGTRoO6gtXoQWD/lCcRlBPTT3
 +ncGnLJg2e4pc01w9Q1jl1MO1J9xk90AlEpUrx2/HZRPsLvk7kmu4GVymsQXVjgQvMW0pssV5zG
 9mhfLwkV5Gxfu8kAc2H0q7QiTBL+rRa0gZEXHqPXiOi14913SksmNbIw8CBXUAL2ViMvdNseWAh
 xONL7DymhqWPRLllmh41GqkMLL6fAVN0R9jiviFvh25TxO6IRHl+q/CQBZTjXnJmplkGVTRn/I0
 d2wGhYxHqM/Fq+i53CpiNC/I5Cp0xMRN2Y0E3NXqVvVcw==
Received: from mail-francecentralazon11023104.outbound.protection.outlook.com ([40.107.162.104]) by mx-relay141-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:35:10 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1KlSJj4xrGMpZ+E/iHci8rtIdCWbJN8KrMLpcTMxgVI0CD4TbMw+//L3b4EnuBwcvDdcvSjh6A2BdXjTU9YI2xpFKbHqny4B4jHoedmrFsP+7wzMIchX/znwfSx6izXKBjX+aLQilvLLuQ8HEdfL83olFuCv8xfJCgqf3tQTbWSAPXpSgk6tu0sbI630OXIdJIpGSRUg3aha7BjL16zt1zTpryU7moxb7zCDdebrOlXhi4GnpBrGyHNir8liWFocvwjPmxYU4D2bhiJD3osd5HYAzrxTUaq00zz8ZPxQYWGfB/PBScUzQN1q9OG43/N8hp8E7OliQtsPsjDsAP9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAsvGJgPXcR8l4bCdEUssKCt4BynULCIuEKkGPxI2OA=;
 b=xD+m+PkttUthhFgN4QQZmfwO6CUqCsJj1OGgBd8VSMGVZNz5Hb4p1No4izNym8V4opDrIAlo9e1RO6wtivLYum9y842q72/6B81Sz6QXmSfVFPtV5FHe61BDGgE2oUGDo9mOhZGEaZlWZx6fYfTXtFGBuYbc74FRCTtSP12/g/dmEYm7d14LdapbfC97h87dag7X85hmlqOp4/zE76DzYT3lWDnxe80hgpQzOLorV5+PJALTgGGnYJJOVcCBkhzd509T52KXah++IJTKFj8zTEONDBX6Tgg8d7OZFumMVVcbhhDk2+F8yKPorzL+wsUDKduur+eE3hwLAlv7SwPVRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAsvGJgPXcR8l4bCdEUssKCt4BynULCIuEKkGPxI2OA=;
 b=Ps0N4LIdSwFFc620gzvhOsBBEjW4oSOu7sjdadwFvRWtdOaBnB4qEUmSeptgh5bm7v0tRe5urjymkubBcY0KOstSHYEdCcRvIxQRur9wYUHI9uy9+EO9LBScvLHIRs67F7FyWAuIUHdlZEVfCFaykjt+DeEZIuC2qSTeb+Q5sv0RY5uz4Qf4t5gh7v8eqQTzlgBKbmt7+MAdCb4GRy+KWBtVYjXCnjlJ1hgN+Yxn3lfdM+4fkzmloLVdTA3oiR6SoXvJqVCV55zRYu2DfC04qrf82lANL9rfh+bua3Wzqih+PdX90ujjTkvBfdq1t/ajiRNK34hN6+hq2QJzGK1GQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB9P192MB1441.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:331::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Fri, 20 Feb 2026 14:35:02 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:35:02 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][whinlatter][PATCH] harfbuzz: Fix CVE-2026-22693
Date: Fri, 20 Feb 2026 15:34:49 +0100
Message-ID: <20260220143449.888520-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0042.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::13) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB9P192MB1441:EE_
X-MS-Office365-Filtering-Correlation-Id: 86940df1-7698-4381-7733-08de708d3bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NXUZc7wiV7IkO+4cuR6Kt4ts8KdnYq8eEJM91xRyaHWnszKkTpMyaVEFqWEa?=
 =?us-ascii?Q?U2GyLiSKQ+VPygesqUfedFCA4WEHQs/FiRslVdyGd8rB4WJeu0whcyH1NoOD?=
 =?us-ascii?Q?4BoFsbpt91/VTEbWgW9VyQLID0OXBuJp8Fg4RkW7WaQnxsZcLjbabMSeuq3S?=
 =?us-ascii?Q?pUmvp+aw4uRqz1jvD1RmVRtdcE0Cz/yqJz+dFXWR1GaOTIpcOQ/60o/bFWZT?=
 =?us-ascii?Q?sAXktQ52Glx6NsN1RzppfJ9fTzWCT0YpcChBhBvEaPncNPzwoWeNO4p9q7BZ?=
 =?us-ascii?Q?F5FfWvuAhlay+nHa+m9vqqnAnqftvM2gZD35WYCNvQuIAQwZtnSpo0B0Q+Nt?=
 =?us-ascii?Q?84HbsN82+wl9lS/5NG/3r8gU0wZfSuc8jMK6JBfcSr5NKg8FM/EbdCpj6XHr?=
 =?us-ascii?Q?Iuo6NERQuirxUqsaqTrr3RRhjPa6ecXUZ+hPD5cEA8uNq5iFuyCKHtGEMfWx?=
 =?us-ascii?Q?L2RbJUxSDbEgWr0fUy9g14ofEGpXFNjU6D3qhGeMQpySM+ZJjne/Hd13QCi7?=
 =?us-ascii?Q?7a4WO7NcpLnGrqO4nwLFyTx9aLofa+uRGPocfS8ZhLBvxItpjXGKclsypNOK?=
 =?us-ascii?Q?JpoxWn1NDwdJ9NNO5NScTI/XDX+8674wGzO59Cv7NZhd0t1dyKpR3uhqIvlL?=
 =?us-ascii?Q?YRjbvjdOjgnMdfPmQMebkpOloamOUGOonYJID07pjU9jVV/JSbRrXYzXNILp?=
 =?us-ascii?Q?upmTVTorOO5c2MoRhLjXZGXs69ZUnqd0k9wyECf9h/5Z+kmclK3KNqYC78BY?=
 =?us-ascii?Q?ikYxkgoxs9+IWQrUsBeqgEdYnP2iSNoLOGmPTnlPfcoevDeoFNXr36EBDFXi?=
 =?us-ascii?Q?btnlYI86R2EYsHHI85ivcocvY61T2RsMfD84yZ3aCznSIo79YDYIPTPw12r/?=
 =?us-ascii?Q?XJE/1wL5Wq1R5y5FwPmt4VAsZDURM7eIivfYFR0wT8xpMVNN+holxVDR/VTi?=
 =?us-ascii?Q?e6Ply38/QpApVVpMsycDJsMDkJDaRIJUvxE868PyE02KdZ49qhXZfDlFas7p?=
 =?us-ascii?Q?q/iLrRcacoAUHoT+U4i2XGpB/WHSFiTFXm14HhWbjv5m/daIPt8GekzBQYW2?=
 =?us-ascii?Q?nsAPz/jEnqYNCqsAALTTbkQZhUkRzIjoEdYNc7dYR6eSYTs+Z2eu55iHIpvV?=
 =?us-ascii?Q?RJy/7DG/Bmf2djVyz9ha//Xqbwj0mdEvKG+1ZrakkT6f5xKA1hR9PG2ktc+c?=
 =?us-ascii?Q?o3GdiCq770GD5sWqRIZB9xLOshkCHxPNC7tWS6/8gGmnNC1pC0OGI7r6RAEP?=
 =?us-ascii?Q?VSY+n9X3xU70w74dVx59NssN3R/B2DP+LcHcPw63c4Is7tSd2FIlbZWqHQY3?=
 =?us-ascii?Q?HF5ye9ShyGnLlF8oyqKLDWpfPWocDM6y2ikSJcp+X20aMFNxDiw2kK7A54jW?=
 =?us-ascii?Q?FavtgSLMR7vdWAH1+uUTwzyYaAiEIxgMghrxMbTVSeHa8vVm3XkSgRMg/51M?=
 =?us-ascii?Q?rLHDgHqwW7EApDbnVVV3XKF+J22zWiGDH2AZToQKYV+5LE+xF/qAhNTIH+jU?=
 =?us-ascii?Q?L5wQkFkLSSjGx1QJL09QB7nzVIe+U8La0CSyHGshEZFRItafuJXJxdch3Lx+?=
 =?us-ascii?Q?fwVTGcHdYXLe3RN9d1U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(10070799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hik/PXjiqEJRB7PFNSgMjXYag2cqGuhBe4Excea5hku0qSdkEJylwjG/u0IU?=
 =?us-ascii?Q?pI0XbDE38QiCsIMqXL6in1uYaSGNLLRG0zaCLLecvQ1wrkH69hp6UDnIUULp?=
 =?us-ascii?Q?YDlUqgELAViaK+ecTgYtUzJqQ2vcgXMaifPfMhzK3eTG0fp2CuRjrKVPArzb?=
 =?us-ascii?Q?QF8ixDTjIKi/Yxm4LOd89f3XB+hB+Y2NcEIYGqrgAebTIIb5Yv1fTX++nD+A?=
 =?us-ascii?Q?pgCUiMj+tBJsJDFnYGBg+s3l4P4kymww1YVAvtBB2ikwf7RxT8gBs/WjCIWU?=
 =?us-ascii?Q?kpt6F+rmaavuWC3gLf3AO5iP1+s9ER6uI/E/3/WMEyzthNrAI24/1FWdDKOo?=
 =?us-ascii?Q?TRBRtHhJ7KRo8jnNrxvBhr96cvFeGr3wUYFBcoJSzPff1g/xw3dGuP1/anmB?=
 =?us-ascii?Q?tM21tSne9PLMeLLef/C5Bwfg8rVgTJ4E9uc9bC1GYp3jFBYDUl1oKuRuTPmF?=
 =?us-ascii?Q?xP8kgXX4pl5HALk1xjVUh/EFw8YyAdNt3m3IXDGxebr1cU1YLAduLsbjFwNz?=
 =?us-ascii?Q?Vn0sZyOrDNHjIOF1tfHHHwdkW9/SpA+pL8Ro4n0naPQO34CPRCkN6u6+HA6K?=
 =?us-ascii?Q?lVtPxGxpMS1Cifwv6viCXa6kHXrnWvepYNH3ZyBw84rYM4CtBO1Pmkkl5DD/?=
 =?us-ascii?Q?lwaxFdj9MfnKx7W29FPjRoQ5ZSYzT9SS/KdpQzpXG9WYz+dggvwVuIr+IQqg?=
 =?us-ascii?Q?s7PvdfwOjiX54MBwHsr28FklydHcK7gmn08eiEaf8PrNfuaoLg8RHoH5U2nL?=
 =?us-ascii?Q?FqbqtqRdxJ3Dd0btm1tQ9y70ZazWPIbrWDr83zevknrnoQGpetErbN2WmTkx?=
 =?us-ascii?Q?pozW8R0De9z5YDwCOj1fg/jhaouUDFPsze/N9J9suDDpiZQb0ZkYHd/xtUbr?=
 =?us-ascii?Q?H4hgj6DKUAjJ3R71V+y3x/y/ixFUpbe5jfQpO+8UeJ10/8SxX85QXqbM7fNE?=
 =?us-ascii?Q?2N+kCVRmbgrp8jSJRmkIz+yzNmkEK8QIGzbTnbuWhJDshkAkFp54cMnQ/eMU?=
 =?us-ascii?Q?lj23TdGPwQN/QuD966e4w3yv2hOPAfjoylVaqw2DbtI0S0uPrvR0JQz+pjg5?=
 =?us-ascii?Q?xuYIxrdVHG+shFfuTD6tmScrvHQ+pyJ1flHlu+noXaxrkXSNZWnqcli8fLXh?=
 =?us-ascii?Q?aDwDlSWWDjb/WuZF5BP4BytxINW2m0GDYsDsWo44KII3Y4mid7e1oFIrDRzd?=
 =?us-ascii?Q?wCteqeHl3N9jEbDOh8wPvF+RXWsCTw0UCPlrwGbDECmzAtiz9anCYTO7hAxC?=
 =?us-ascii?Q?F+1rWLy7tkydG5F8vDEWYwOmoN0LjRhQFQM1rqxR8mkhka+q2m7X3P4+TroL?=
 =?us-ascii?Q?mkc49u9Jm/9/x1MjxPts0aHy4zUIMkXcaAvaRzI3YbCc/1egm8j/f2W5RDCI?=
 =?us-ascii?Q?7/oMJYfd86Z9AcKqliE0swZkGQoONP2LUnkA1/lV9497qalO5U5sPpkrvnSX?=
 =?us-ascii?Q?kqXanPkCOAPDCYqQs+Pf7SsR7aKd7aGkjQsr9mf8VG03XARU2etOnzQuut/F?=
 =?us-ascii?Q?n10E1ZL7rR0v8+bH3CF0h3CqLk3Ts3DKb4bFmKnn78e5LaurOb+T0LZLU/nf?=
 =?us-ascii?Q?GSy0nXTKk8LMDeLx9od47VE1kAvjgWpQPi5LQ5+G3NIm898OzTFSKEhEOddt?=
 =?us-ascii?Q?ZY7eG3naym6Mw7i/SUvqc5wAMZ9aatAcK/7XDQOJA1kwunEkVECq/dPSGD5P?=
 =?us-ascii?Q?v7o6NTfQ2BinApyfIGgOCBTJYkcrU8BNhDMwT3dhJZsi2zi0gpQV88bhM8w0?=
 =?us-ascii?Q?2uv+XJlYJl29nlD+SSrbLzCwv7fmg42tXNViErsgFZOKNHI1xS7alecMjt9W?=
X-MS-Exchange-AntiSpam-MessageData-1: 7CUKzvMTY11vPg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	swNiVxq9npvzbdPnrgbguwFDUGlWBr4/HmX5YHG0FM304NhtHSHzGJ0bt3CK71KSGHhj7LZrni4NPAU23QwNAiRwEpBIk01ugrmospy+X1GtnFFTdfLxb0m/NcVH71SjWIcWbYtpYYI9ilirw3GoZzgPqPfelvWhJFS/CZ1mX+Gzlev8sxNO0zwS2pa7s8P+idhJFAaM241nrBR4eG0HZVhntTNJ/T3sb3f4AGUHMQcDemWp+VXqGBvhsKMsNdLw0Rbq713i7jup/5Wkw3tjxASpXt4ZHkQ6TxEAzMc3Tu1rvg1uEKGdQrPx7UAJBBu3e3hcaXZgRr2C0jlZ7twL9/uRxqKeK9kVZhIyPVanPhCq4AZsGAfvvw6Vgu5QYam5ZZl3La2O6L+Vt2FBtrz3aHs5YRg6U5tfcypTLcDHlznFR5OyrEF+2hLv7hLvoP5hITT8KCQEZmMq+xKl/dmDGrKTXYO32dOombGJsLCdV3y+vpaWcAPiKZuKkgumogLpO/C4LN1O/s5ArWSoYv7NBLpphAuu7W64o0Me+3fggD3JTu5JN/JhIpRHQITkBL9qzv47GnROkGBQZERfQc+Uh9FrjBc2F1YlI09kWNhzC3HZiFTr419Ru+ALZJzlK3fP
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86940df1-7698-4381-7733-08de708d3bb2
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:35:02.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkpTrhnuFCAse+SJL5hAeQ6SVutDr2FwU195PMRKVKiWLjGTaM3jkdTlSYbO0+4LCuRtcUGd58WLFkewbOPu1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB1441
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay141-hz1.antispameurope.com with 4fHXpJ4PRsz7tYq
X-cloud-security-connect: mail-francecentralazon11023104.outbound.protection.outlook.com[40.107.162.104], TLS=1, IP=40.107.162.104
X-cloud-security-Digest: 62b047c15006162a80af17463de9ec26
X-cloud-security: scantime:1.822
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231517

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
 .../harfbuzz/harfbuzz_11.4.5.bb               |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch

diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
new file mode 100644
index 0000000000..bf821bb63a
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
@@ -0,0 +1,33 @@
+From 21c880d1154a5bcef2ef68c1687d286820a274ee Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 9 Jan 2026 04:54:42 -0700
+Subject: [PATCH] [cmap] malloc fail test (#5710)
+
+Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr-f2r9-c7ww
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae]
+CVE: CVE-2026-22693
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/hb-ot-cmap-table.hh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
+index 294b2b60d..95a436b54 100644
+--- a/src/hb-ot-cmap-table.hh
++++ b/src/hb-ot-cmap-table.hh
+@@ -1679,6 +1679,10 @@ struct SubtableUnicodesCache {
+   {
+     SubtableUnicodesCache* cache =
+         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCache));
++
++    if (unlikely (!cache))
++      return nullptr;
++
+     new (cache) SubtableUnicodesCache (source_table);
+     return cache;
+   }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index 9e0e42b717..2364dd7efd 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-22693.patch \
+           "
 SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
 
 DEPENDS += "glib-2.0-native"
-- 
2.43.0


