Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DFFCAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:41:51 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.18933.1758638939945989279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 07:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=oNpGn/rG;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=oV/iz2y/;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=2361159963=joshua.watt@garmin.com)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NATZrD027134;
	Tue, 23 Sep 2025 09:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	pps1; bh=j90GpIGezFQda+6EFLP/1JX9pdPKj95UwGMevDRcwKs=; b=oNpGn/r
	GmoWBmLWktor8xU4vjE6cw5vp62yRP44l0AfUamuvLseUpfCePsJEjM8zAtvzoyP
	Y6dTwsTPAqvNG1tj34aAKTUXn0J2HYXjGWXjp9XsicMxq3zGCyrgMDsVui8vO8zz
	xMCfaeXLDmzsHY+hWV7h1upwqK/tkBTjhKs1C5WYyToqc03d0C6UpVFZlpHk18/Q
	Y1zeCyv+flrckrHS5GJDOWpT1Jb931i2Gh2zkxA3VsfWfDx1Yh9AKmT6WQeZ8dYx
	55SnsHCCskcrjmp2WBuJtYlyX1wvNrx1fyd4L8Mt/5US0ftweYCIkKJAHztm7yvx
	s4aR/mJtfeucDfg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020097.outbound.protection.outlook.com [52.101.61.97])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 49bsu9rj22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 09:48:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5gSMfmM3p8k1ZCBBCpv73UVa1GdpCJUXkkmC7BCGo1zZkWAJg/c+aU4XKLACTWMUwU8nI/yAA75/dAYwYEE0VWLedNvDXGIv1VYIWslPX2dXd65TFtrX2tZQ1x32VdtgwGqyUN19HcPnGmnGOlUgVvmGfTN5NUsdxMwqjC3yFzpecX1Xw5CIYgF3Qd55bOCgZWyJOW5BNSlIKp3ds+QD7x/y6PDXDacKN/nMpUyyjG+vdGMoiY26sdu1XBrco6Cxu/omPmrxoRRwCr2P/WsdVNnFUKAdMR4mzw+X2UTX0ehQsft+xXNtKSefQn9yrR2zOhJmd0YM6zTnxpJ/2hOlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j90GpIGezFQda+6EFLP/1JX9pdPKj95UwGMevDRcwKs=;
 b=T4Q8CGyo6S6tzVVgXtNlR6rwpJU2Q1CkCDbX4NNAxsp2wFGWiRIm/2l6sELF3Xgp024LMqxbmhTXbKFAgSvM4/lxYpBJOvHwd5ulEiE+SCogCkJ2sYJn7G75whHs2CfL8U4Qqsg4BGngxhHiooy1mscpcYRJb4ccsA+5S1LXFWHcdCLAY5L1ZB0oV+5TFXernAsFaHn1pNpiqwPZVkEUNB7BPTnUH2QWyWzR/OrM/qKrDNOx8hSTD1dOFJZ+0nrHLfy4ouLIDNW2zVVgF3foW+SMjQOBeB9UVAAVeeM8MmDKUj+7M+3aD0N0ZVCTbuQxiGcjQw0Rlzas+h4xHiPKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garmin.com; dmarc=pass action=none header.from=garmin.com;
 dkim=pass header.d=garmin.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j90GpIGezFQda+6EFLP/1JX9pdPKj95UwGMevDRcwKs=;
 b=oV/iz2y/jB4+B4EQxWu7HzN8xUGuicVLwlcP6DPB7vlfTwAikG3YbEiCqfZpiK37B7cQBdtmzq2sno06grnsedZZl89xwD3tV5XDTyfnJ4slplHUBmDo7rZ3dbpGU9uUr4igUIMs7FCYT5WfRMOc2JO+1GLsckTNhraajvtDlj6AXBeTM2SDXBDJzlXlvy9vZmvhmKOH0VxmxaW+VQKwuaEsTOkz9SstIVGdWz5Q+ewmZv/jOiCj5zdNlgoEYiQ5ph3XCf+v/fpddajHrI4Z8COXI2SBrwVpVaX/kq2Dn1QCsguJ7cuvJdi4HMu156ijmSCCp8t7S3xQkl/1wmPoKg==
Received: from SN7PR04MB8463.namprd04.prod.outlook.com (2603:10b6:806:351::18)
 by BN0PR04MB8110.namprd04.prod.outlook.com (2603:10b6:408:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 14:48:55 +0000
Received: from SN7PR04MB8463.namprd04.prod.outlook.com
 ([fe80::9a08:a1e7:d6f4:4586]) by SN7PR04MB8463.namprd04.prod.outlook.com
 ([fe80::9a08:a1e7:d6f4:4586%5]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 14:48:55 +0000
From: "Joshua Watt" <Joshua.Watt@garmin.com>
To: Yocto TSC <tsc@lists.yoctoproject.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: SPDX 3 Backport Proposal
Thread-Topic: SPDX 3 Backport Proposal
Thread-Index: AQHcLJjD4ab5++0v2UGKUTDHZgLxUw==
Date: Tue, 23 Sep 2025 14:48:55 +0000
Message-ID: 
 <SN7PR04MB846354716C9A3803715C6C6E991DA@SN7PR04MB8463.namprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Enabled=True;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SiteId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_SetDate=2025-09-23T14:48:54.507Z;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Name=Confidential;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_ContentBits=1;MSIP_Label_f3ff6d80-3782-4df6-bf6c-659f84558040_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8463:EE_|BN0PR04MB8110:EE_
x-ms-office365-filtering-correlation-id: 1f8bf0d8-e3ac-4f15-36c0-08ddfab0521f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021|8096899003|3613699012|4053099003|13003099007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?MzAgSXmr7vgoTagVKFCtv667YK0ftGkkB1XDjBx6whD0NcMQcnwIBOBN9N?=
 =?iso-8859-1?Q?OYf91Ie5KqVmyAHq0CXClKmXgLPSbxVUQgLOoeFAg/ZiNI0WbwSCSeRlxT?=
 =?iso-8859-1?Q?LXlZTrEH7hz9DzAP8BK6WU7z+cNNQuv7LalZb2gvAzmLhAq0k/qrir325C?=
 =?iso-8859-1?Q?6ll3avCvXng32KG6TsrjgMP5DD57yuKmbJGbDM+OGzqrTicfC6VVoPJ8UI?=
 =?iso-8859-1?Q?Tdr9zWaFjK+8E8LzfA9YvVt8AzZaGpMzJ06zXm1JMs2KhsH7+biiQfPnCR?=
 =?iso-8859-1?Q?KSvuvh75ob4RurifQByxervxnHVqKuRQSfkUV2ly5MTdbzc2g+zF6X32Zv?=
 =?iso-8859-1?Q?H+vPlpwZiopu2/E8vYFV9t4O5ix6Nf2gT/CUCPKVrKkhlHYltZHOHaewpZ?=
 =?iso-8859-1?Q?7RgYI5UqyBKZ0p9+6OAqixs1Ciz9USJb3LEeIZvSagFrU+KbaxocqcZueO?=
 =?iso-8859-1?Q?5ofBwrewrUbwlk/vwYbq7cAW10Jzk5hzrPDgY15zEgS7f3FyP9L/xYBO6G?=
 =?iso-8859-1?Q?dpmtvnOIJ4OLYefaZfAuo1mPKFiMr6fYU94he+wY/eo1HE/WQqyg6NUIgI?=
 =?iso-8859-1?Q?nqOcn+LqXvG2t3qzPfs3j2y2kcr1tUAPEDNKNWrpp46qBOPB7en3UU+Dbn?=
 =?iso-8859-1?Q?YmrQ8jIRnCGFow4oYwOs+5+w+0Nye28swCOkfTisVdnHzlWhm9z23iy75c?=
 =?iso-8859-1?Q?41kgpvsfivtJfD9LGFjkJA6yLKqg4Smz8b1mns78i+M3Lx87Tc7BUoJo7G?=
 =?iso-8859-1?Q?wwU5FueB5T7vmEN20NPQYGVgZijhCTuktFf+hUmFllrvZ/Gm0HhvjfYWoq?=
 =?iso-8859-1?Q?UzY7cSACtsEl6dHruLlOkMbQbG4g6hC0NuLaEKvtIfg33f0w9vvtpvuy5I?=
 =?iso-8859-1?Q?/63AKUj/auvk7+HZ7vbCtWJAMdPtAyiJkUxUy0jkwSTZi+U05eIpcPrH9z?=
 =?iso-8859-1?Q?hLibZ+GzsEnBQgijQWOfTzdrkVGCSxFl+hKV7liL7eDNw+g/ZQOw2fYRSQ?=
 =?iso-8859-1?Q?NONGCvUA1t/V7wQ4WwpgGW7mYpreREH1RAlLXQQohVWnATwSJKeDCQsv/m?=
 =?iso-8859-1?Q?boLQDntPB2VJU8OhcjwSXDPM1qDXwVOItfgAvhw8QBhYAZ/R3FxoZLmBVh?=
 =?iso-8859-1?Q?te7Ty+4Qm7YdZ54/bQ/d4XS/Jr/Y3Wsy/5dDulrx80fsh5sGzH2SxTT6me?=
 =?iso-8859-1?Q?9o0LPRSsOib1YRdAwuFFDOnlRkZdU5yK8cD7kl8PqfkUqpJK1gp7GkVs4/?=
 =?iso-8859-1?Q?Tk8QQWHFZ/X/Pvn3qAAull/iWYRS+a2AjhGK+oz5okPZpI8ReZaKVKMv+k?=
 =?iso-8859-1?Q?ZOyXYMyUulNRLZ9djbQDq+CuQfXxy39TMfjaOwOgCN0xDWc1A9OorEIw8k?=
 =?iso-8859-1?Q?1/x5CtlAmT81aNhmt8WADb7qH/sE0HwmWgUkFp0i11fme7ZrM/I7GJxpdM?=
 =?iso-8859-1?Q?Dg9iDpTUgNoF9OU38my+heKJjs7yOEyBKO+KQ1jYmhxXAOyZIPEi3xhJvJ?=
 =?iso-8859-1?Q?5xmUabPc8ZFCEXwf9ac4KU6auS5S52MhVCS25H7zy23Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR04MB8463.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021)(8096899003)(3613699012)(4053099003)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Zl3hVSIEE7AgFZhd4Y4uMFP1JtO1aNcu8FI1qyd56OIV8v6wxQkTZGg2f+?=
 =?iso-8859-1?Q?tKfrUhrhDO7g4TlBJc/P0mb8dBDrfw0Jni/GNkPotCOZ07qcfmCENXxUrk?=
 =?iso-8859-1?Q?eQi0naw4jQWFo3P4mcqnRVOf+riJK5/tUZOdkcMTdy8luYU9uBm0PAZZ9A?=
 =?iso-8859-1?Q?ixxPCqmpVCA2BMAmdCHNjBkI6O9WTj6uXxZ7Iy8rThtPQx0WzXmw5ZMrqt?=
 =?iso-8859-1?Q?DtRfiRlQNlCuxEi+4cNr7e6uV738687ckSnxq/vB+xpExJC3bLWtm1L06Q?=
 =?iso-8859-1?Q?bfhcuZCsnrkIDUL44Q0yp4cC8g0y+XFLY6XdKUGXLMyATWsRH6J1cinpSt?=
 =?iso-8859-1?Q?HOoID9388ptthIYOJZcmoziKwrbbcJF1WUTaBXAkytiYn2Blvr7m2L/++G?=
 =?iso-8859-1?Q?m3PuRx4dXJr8+QDDUl/sKDifq/veLHS1rflOWcPNqLQPDePpB4sxZ7SrlK?=
 =?iso-8859-1?Q?AYWLFdRYg/Jkat/kw61n6jtQ0pc57KU0GhkDF2Rs6R4jUynSzgNRO64I1V?=
 =?iso-8859-1?Q?9OYiiGIPyvtt/YpuPBowsldZjMb6QfinB/eLIMFwo3QjMjN88X2P/0z292?=
 =?iso-8859-1?Q?mS0m/3KuLAp/x4WkLnts0FYMux8swj+m7OJcXtv51hS6sZaQtp2WTWwoeI?=
 =?iso-8859-1?Q?qD/cvwOKpck0BQ5rTa6FJ6wFQppqgcHguBw5RmnNZBaLp2DnpYKrbKwuOO?=
 =?iso-8859-1?Q?2PEAG0PkWf9cHdWpYZ9pd3mTwLvhV6E3XieRhnzIeYUA9kDvvBYW6YLSkI?=
 =?iso-8859-1?Q?IeCYYqUxfs4FTzkB0tDVKHigO8M5Eh147JfKibSKqoXdoChdt+cHg7qWKF?=
 =?iso-8859-1?Q?AGKW1uo/rbS81IZeFUwLc/eu1OGzAlZnMhJuJdh95GEqRZKxVFjcxrDWPr?=
 =?iso-8859-1?Q?btcr+/u3PIXl0KE4KWZFM0JaJl5xO3WcDSXH4Refv06qB3qNj6w9Tv1zvu?=
 =?iso-8859-1?Q?OzhEBkrE/9RWE3SJngbFh+BU3ut/VyXKDwKMiyEe7OGYH8ZgpPTiSvYLFE?=
 =?iso-8859-1?Q?wz5ec4joUgokAo17GU6Ksa24YbtsPa2MJDoty7C0wJJjNApVdS1GmlVD6d?=
 =?iso-8859-1?Q?KJupfmcdmDoxPJtsUYMCEgrtEHw6B4kFKUM2Kb0VqeU/Hj645gW3oLP8hA?=
 =?iso-8859-1?Q?pKE8ltcmdeWTKLN1FpzhwaeKxoHnIbGzYhqfgliGz5OQjjxT8DP0rhEkuv?=
 =?iso-8859-1?Q?R+W9JbdGnONjHO1dhfkXH+rxQrJ0ZlNxSCgPUK7yMGrfrzyWSizwMPjy8k?=
 =?iso-8859-1?Q?LG6XsdI9BOwYLPIjT+iZ2LA+7md3p5oNxbeOBDtRrFKaUVTUJZPpWyn/cZ?=
 =?iso-8859-1?Q?jeWcFtddEdscNwP2b14LFxtY5nvhFZEn5rUgL8dMwKaHGB4msx0CaZRekk?=
 =?iso-8859-1?Q?d2h2dj7EqqQOiW02cj+Z60qt1oy7JgKoJ0g9uXz3FT9nvDb4cp0HZxyFy8?=
 =?iso-8859-1?Q?iJP3AuR8sFPIS3VmRS1ODzwzL4qE4KeE24PKpcfvBrNv8/foZGVVErbLYv?=
 =?iso-8859-1?Q?2L63P3jO0HvPBITbPqDH/OWDRfqobPvb1t0R4DIjASZabh+75V6wSifivU?=
 =?iso-8859-1?Q?STZaUoKwyYsFi2VktlLiR+1BZny8hvKnkZfbtzZkChcOMvlOSVYEjvv4qr?=
 =?iso-8859-1?Q?Vh8B/3d7MBEmmtXh/NY/AJz9+C50sUIeJz1DroNJbRTmx/8IA9Z4xnNQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8463.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8bf0d8-e3ac-4f15-36c0-08ddfab0521f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 14:48:55.5184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4wX9kZAhMlwGlnlCDW2rrO3hoCYI7ym3+BKaiiEOtia+PRADQq17uzuv79BRqabS4Ij0F2xXxgE7/CICepQMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8110
X-Authority-Analysis: v=2.4 cv=JuHxrN4C c=1 sm=1 tr=0 ts=68d2b35a cx=c_pps a=67drJv3h0MZitt89ot57dA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=qm69fr9Wx_0A:10 a=wECf3xPYAAAA:8 a=JL-7mqT1AAAA:8 a=vnREMb7VAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=ShHEs4X1yi1iHyZR8ToA:9 a=wPNLvfGTeEIA:10 a=hbv6TpvrLl-CxCOvmioA:9 a=9eO5KnEEd7Eeeuer:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=EI5xJYTRPWIg2nbNUCoA:9 a=jyXla301eCEA:10 a=ccNonjl4-tybilS9-zgM:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDA5NiBTYWx0ZWRfX4jRsfpDZzvE/ tiWcxPCg4UQn1stWaRxQVmkQyQ/NDQMZl7ej8VxXtIKeX2GtXucbpWppvlRZlQrMCd7OAhWEyRJ yVf0LT2QqX0xYSGOSHasiPF/j0e7IPrAc0gG82sxUYkZUNNnJgy7LLtd54YjLu9OGSJ9nBSReD/
 LGWv7u7nnu570+f33SxBK/nq0wOXHZTe55VSmC70JVx3A78fC1rkd44rNKQCXE1TcrB5QwgSA1J L6YE0GiXeZW3GNp2xYu2pyRHqCIiWGBn5WYeoWvZv8yi1rpfu8odNVM/GGDxHGQ76p2dum0ZAfX f3ckyzV1yFFpyO14wYXBBSkifkzRBrDvDdrCAMHTm2cz2vCOlqsuAFf+5qJHEtmlc+J7HV16Al8 67ONkG1j
X-Proofpoint-GUID: y4RHfs2IJpj5BJdWKH4kRLYuFMSLYyhh
X-Proofpoint-ORIG-GUID: y4RHfs2IJpj5BJdWKH4kRLYuFMSLYyhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1011 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2507300000 definitions=main-2509230096
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223896

--_004_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_
Content-Type: multipart/alternative;
	boundary="_000_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_"

--_000_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

The following is the proposal to backport SPDX 3 to Yocto 5.0. It is also a=
ttached as an RST file if you'd prefer (or if outlook makes this unreadable=
).

Proposal to Backport SPDX 3 to Yocto 5.0 (Scarthgap) Release
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This document outlines a proposal to backport the SPDX 3 Software Bill of
Material (SBoM) support currently on master of OpenEmbedded Core to the Yoc=
to
5.0 (scarthgap) release branch. This is a change from the normal stable rel=
ease
branch policy of not backporting major features to stable branches.


Background
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

`SPDX 3.0`_ was released on April 14th, 2024. While Yocto was a very early
adopter and had an implementation of SPDX 3 in development even before the
final release, this timeline was still to tight to fit in for the Yocto 5.0
release window, since it also released in April. As a result, Yocto 5.1
(Styhead) was to first release to have SPDX 3 support.

Practically speaking, this means that there is currently no Yocto Long Term
Support (LTS) release that supports SPDX 3, since Yocto 5.0 is the most rec=
ent
LTS release and will be supported until April 2028. The next scheduled LTS
release is Yocto 6.0 (Wrynose), scheduled for April 2026.

Yocto has supported creating `SPDX 2.2`_ SBoMs since the 3.4 release (Honis=
ter,
October 2021). However, while these SBoMs do provide useful and actionable
information, it was discovered in the course of implementation that this
version of SPDX was incapable of precisely describing some of the more
complicated nuances that occur in Yocto builds, and also was insufficient t=
o
describe the process by which software vulnerabilities were patched in upst=
ream
layers.  As such, the implementation spurred members of the Yocto community=
 to
be more involved in the design of the then upcoming SPDX 3 release. This
interaction was mutually beneficial for both projects; Yocto was able to en=
sure
that SPDX 3 could express the more complicated situations that arise during
builds, and SPDX got advice on concrete examples of the complicated builds,=
 as
well as having a very early adopter of the new standard. Yocto SBoMs are of=
ten
provided as examples of what a SPDX 3.0 document can/should look like.

As of the date of this document, the master branch of OpenEmbedded Core sti=
ll
supports both SPDX 2.2 and SPDX 3.0. However, SPDX 3.0 is considered the be=
tter
implementation, and is the one enabled by default when building. SPDX 2.2
support does still receive bug fixes, but most of the SPDX development effo=
rt
focus on SPDX 3.0.

On 23 October, 2024 the European Union (EU) ratified
`Regulation (EU) 2024/2847`_ (commonly referred to as the Cyber Resilience =
Act
or CRA) with the general goal of improving the cybersecurity posture of
consumer software in the EU. The regulation imposes many requirement on
software suppliers, and goes into full effect in 11 December, 2027 (with so=
me
parts not relevant to this document going into effect sooner in mid 2026).

One of the requirements of the CRA is that manufacturers be able to provide=
 the
EU with an SBoM for any software covered under the regulation. The purpose =
of
this SBoM is to provide information about the software and its dependencies=
, as
well as evaluate the software for exposure to vulnerabilities (e.g. check i=
f
any CVEs affect it).

It is important to keep in mind that as of the time of this writing, the CR=
A
does not have concrete requirements for supplier SBoMs. These are still in =
the
process of being written by the EU, with the expectation that they will be
complete some time in 2026.

Problem Statement
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The Yocto project is in good position to provide `comprehensive SBoMs`_ to =
its
users through the SPDX support implemented in OpenEmbedded Core. These
generated SBoM can go a long way toward helping end users comply with the C=
RA
SBoM requirements.

With the Yocto 5.0 release set to leave support in April 2028, there is a
roughly 5 month overlap between the enforcement of the CRA and the end of
support for Yocto 5.0. Given the typical timing of software life cycles, it=
 is
highly likely that many users will be needing software built with Yocto 5.0=
 to
comply with the CRA SBoM requirements.

However, the SPDX 2.2 support that is currently available in Yocto 5.0 is
lacking in a few key points related to CRA compliance, specifically in rega=
rd
to vulnerability reporting. It is also worth noting that as more concrete
information about the CRA comes out in the next years, the SPDX community w=
ill
likely be willing to make updates and changes to the SPDX 3 specification i=
n
order make compliance easier; it is less likely that they will do the same =
for
the SPDX 2.2 specification.

Proposed Solution
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The proposed solution to this problem is to backport the SPDX 3.0 support
currently on master to the Yocto 5.0 stable branch, bypassing the normal po=
licy
of not backporting major features. This would provide end users with the hi=
gher
quality SBoMs required by the CRA, and would also put the project in a bett=
er
position to implement any other changes required by the CRA, since all
supported version of Yocto would then have SPDX 3.0 support (ignoring the Y=
octo
4.0 "Kirkstone" release which goes out of support April 2026).

The bulk of the work to do this backport has already been `proposed`_ on th=
e
openembeded-core mailing list. A through review of this proposal is still
necessary, but the overall strategy has been reviewed and approved by the
original SPDX 3 author.

This proposal would see SPDX 2.2 remain the default option for generation o=
f
SPDX data on the Yocto 5.0 branch, so as not to break backward compatibilit=
y.
User could then switch from SPDX 2.2 to SPDX 3.0 as desired.

Alternate Solutions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The commonly used alternative solution to backports into stable branches is=
 to
leverage the layering power of bitbake to provide the backport in a separat=
e
layer. This has been done many times, with several examples in the
`meta-lts-mixins`_ repository. However, this approach is not recommended fo=
r
backporting SPDX 3 for a number of reasons:

1. The SPDX 3 code makes several changes to parts of the codebase that cann=
ot
   be easily modified in a separate layer, including python library code an=
d
   bbclass files.
2. Backporting in this method would make it harder to backport any addition=
al
   future changes desired for CRA compliance, or bug fixes. If the change i=
s
   done directly in OpenEmbedded Core, simple backports can be done from ma=
ster
   to the stable branch


Acknowledgments
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Thanks to Kamel Bouhara for putting together the backport patches.

Footnotes
=3D=3D=3D=3D=3D=3D=3D=3D=3D

.. _SPDX 3.0: https://spdx.github.io/spdx-spec/v3.0.1/
.. _SPDX 2.2: https://spdx.github.io/spdx-spec/v2.2.2/
.. _Regulation (EU) 2024/2847: https://eur-lex.europa.eu/eli/reg/2024/2847/=
oj
.. _comprehensive SBoMs: https://www.youtube.com/watch?v=3Dy0N4FnkwTOY
.. _proposed: https://lists.openembedded.org/g/openembedded-core/topic/1150=
86052
.. _meta-lts-mixins: https://git.yoctoproject.org/meta-lts-mixins/

--_000_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
All,</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
The following is the proposal to backport SPDX 3 to Yocto 5.0. It is also a=
ttached as an RST file if you'd prefer (or if outlook makes this unreadable=
).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Proposal to Backport SPDX 3 to Yocto 5.0 (Scarthgap) Release</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This document outlines a proposal to backport the SPDX 3 Software Bill of</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Material (SBoM) support currently on master of OpenEmbedded Core to the Yoc=
to</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
5.0 (scarthgap) release branch. This is a change from the normal stable rel=
ease</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
branch policy of not backporting major features to stable branches.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Background</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
`SPDX 3.0`_ was released on April 14th, 2024. While Yocto was a very early<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
adopter and had an implementation of SPDX 3 in development even before the<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
final release, this timeline was still to tight to fit in for the Yocto 5.0=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
release window, since it also released in April. As a result, Yocto 5.1</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
(Styhead) was to first release to have SPDX 3 support.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Practically speaking, this means that there is currently no Yocto Long Term=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Support (LTS) release that supports SPDX 3, since Yocto 5.0 is the most rec=
ent</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
LTS release and will be supported until April 2028. The next scheduled LTS<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
release is Yocto 6.0 (Wrynose), scheduled for April 2026.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yocto has supported creating `SPDX 2.2`_ SBoMs since the 3.4 release (Honis=
ter,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
October 2021). However, while these SBoMs do provide useful and actionable<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
information, it was discovered in the course of implementation that this</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
version of SPDX was incapable of precisely describing some of the more</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
complicated nuances that occur in Yocto builds, and also was insufficient t=
o</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
describe the process by which software vulnerabilities were patched in upst=
ream</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
layers. &nbsp;As such, the implementation spurred members of the Yocto comm=
unity to</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
be more involved in the design of the then upcoming SPDX 3 release. This</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
interaction was mutually beneficial for both projects; Yocto was able to en=
sure</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
that SPDX 3 could express the more complicated situations that arise during=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
builds, and SPDX got advice on concrete examples of the complicated builds,=
 as</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
well as having a very early adopter of the new standard. Yocto SBoMs are of=
ten</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
provided as examples of what a SPDX 3.0 document can/should look like.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
As of the date of this document, the master branch of OpenEmbedded Core sti=
ll</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
supports both SPDX 2.2 and SPDX 3.0. However, SPDX 3.0 is considered the be=
tter</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
implementation, and is the one enabled by default when building. SPDX 2.2</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
support does still receive bug fixes, but most of the SPDX development effo=
rt</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
focus on SPDX 3.0.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
On 23 October, 2024 the European Union (EU) ratified</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
`Regulation (EU) 2024/2847`_ (commonly referred to as the Cyber Resilience =
Act</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
or CRA) with the general goal of improving the cybersecurity posture of</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
consumer software in the EU. The regulation imposes many requirement on</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
software suppliers, and goes into full effect in 11 December, 2027 (with so=
me</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
parts not relevant to this document going into effect sooner in mid 2026).<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
One of the requirements of the CRA is that manufacturers be able to provide=
 the</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
EU with an SBoM for any software covered under the regulation. The purpose =
of</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
this SBoM is to provide information about the software and its dependencies=
, as</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
well as evaluate the software for exposure to vulnerabilities (e.g. check i=
f</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
any CVEs affect it).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
It is important to keep in mind that as of the time of this writing, the CR=
A</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
does not have concrete requirements for supplier SBoMs. These are still in =
the</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
process of being written by the EU, with the expectation that they will be<=
/div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
complete some time in 2026.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Problem Statement</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The Yocto project is in good position to provide `comprehensive SBoMs`_ to =
its</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
users through the SPDX support implemented in OpenEmbedded Core. These</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
generated SBoM can go a long way toward helping end users comply with the C=
RA</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
SBoM requirements.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
With the Yocto 5.0 release set to leave support in April 2028, there is a</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
roughly 5 month overlap between the enforcement of the CRA and the end of</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
support for Yocto 5.0. Given the typical timing of software life cycles, it=
 is</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
highly likely that many users will be needing software built with Yocto 5.0=
 to</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
comply with the CRA SBoM requirements.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
However, the SPDX 2.2 support that is currently available in Yocto 5.0 is</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
lacking in a few key points related to CRA compliance, specifically in rega=
rd</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
to vulnerability reporting. It is also worth noting that as more concrete</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
information about the CRA comes out in the next years, the SPDX community w=
ill</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
likely be willing to make updates and changes to the SPDX 3 specification i=
n</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
order make compliance easier; it is less likely that they will do the same =
for</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
the SPDX 2.2 specification.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Proposed Solution</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The proposed solution to this problem is to backport the SPDX 3.0 support</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
currently on master to the Yocto 5.0 stable branch, bypassing the normal po=
licy</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
of not backporting major features. This would provide end users with the hi=
gher</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
quality SBoMs required by the CRA, and would also put the project in a bett=
er</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
position to implement any other changes required by the CRA, since all</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
supported version of Yocto would then have SPDX 3.0 support (ignoring the Y=
octo</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
4.0 &quot;Kirkstone&quot; release which goes out of support April 2026).</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The bulk of the work to do this backport has already been `proposed`_ on th=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
openembeded-core mailing list. A through review of this proposal is still</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
necessary, but the overall strategy has been reviewed and approved by the</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
original SPDX 3 author.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This proposal would see SPDX 2.2 remain the default option for generation o=
f</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
SPDX data on the Yocto 5.0 branch, so as not to break backward compatibilit=
y.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
User could then switch from SPDX 2.2 to SPDX 3.0 as desired.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Alternate Solutions</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The commonly used alternative solution to backports into stable branches is=
 to</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
leverage the layering power of bitbake to provide the backport in a separat=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
layer. This has been done many times, with several examples in the</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
`meta-lts-mixins`_ repository. However, this approach is not recommended fo=
r</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
backporting SPDX 3 for a number of reasons:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
1. The SPDX 3 code makes several changes to parts of the codebase that cann=
ot</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;be easily modified in a separate layer, including python libra=
ry code and</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;bbclass files.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
2. Backporting in this method would make it harder to backport any addition=
al</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;future changes desired for CRA compliance, or bug fixes. If th=
e change is</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;done directly in OpenEmbedded Core, simple backports can be do=
ne from master</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;to the stable branch</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Acknowledgments</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks to Kamel Bouhara for putting together the backport patches.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Footnotes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.. _SPDX 3.0: https://spdx.github.io/spdx-spec/v3.0.1/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.. _SPDX 2.2: https://spdx.github.io/spdx-spec/v2.2.2/</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.. _Regulation (EU) 2024/2847: https://eur-lex.europa.eu/eli/reg/2024/2847/=
oj</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.. _comprehensive SBoMs: https://www.youtube.com/watch?v=3Dy0N4FnkwTOY</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.. _proposed: https://lists.openembedded.org/g/openembedded-core/topic/1150=
86052</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.. _meta-lts-mixins: <a id=3D"LPlnk418388" href=3D"https://git.yoctoproject=
.org/meta-lts-mixins/">
https://git.yoctoproject.org/meta-lts-mixins/</a></div>
</body>
</html>

--_000_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_--

--_004_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_
Content-Type: text/x-rst; name="spdx-3-backport.rst"
Content-Description: spdx-3-backport.rst
Content-Disposition: attachment; filename="spdx-3-backport.rst"; size=6942;
	creation-date="Tue, 23 Sep 2025 14:48:36 GMT";
	modification-date="Tue, 23 Sep 2025 14:48:55 GMT"
Content-Transfer-Encoding: base64

UHJvcG9zYWwgdG8gQmFja3BvcnQgU1BEWCAzIHRvIFlvY3RvIDUuMCAoU2NhcnRoZ2FwKSBSZWxl
YXNlCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQoKVGhpcyBkb2N1bWVudCBvdXRsaW5lcyBhIHByb3Bvc2FsIHRvIGJhY2twb3J0IHRo
ZSBTUERYIDMgU29mdHdhcmUgQmlsbCBvZgpNYXRlcmlhbCAoU0JvTSkgc3VwcG9ydCBjdXJyZW50
bHkgb24gbWFzdGVyIG9mIE9wZW5FbWJlZGRlZCBDb3JlIHRvIHRoZSBZb2N0bwo1LjAgKHNjYXJ0
aGdhcCkgcmVsZWFzZSBicmFuY2guIFRoaXMgaXMgYSBjaGFuZ2UgZnJvbSB0aGUgbm9ybWFsIHN0
YWJsZSByZWxlYXNlCmJyYW5jaCBwb2xpY3kgb2Ygbm90IGJhY2twb3J0aW5nIG1ham9yIGZlYXR1
cmVzIHRvIHN0YWJsZSBicmFuY2hlcy4KCgpCYWNrZ3JvdW5kCj09PT09PT09PT0KCmBTUERYIDMu
MGBfIHdhcyByZWxlYXNlZCBvbiBBcHJpbCAxNHRoLCAyMDI0LiBXaGlsZSBZb2N0byB3YXMgYSB2
ZXJ5IGVhcmx5CmFkb3B0ZXIgYW5kIGhhZCBhbiBpbXBsZW1lbnRhdGlvbiBvZiBTUERYIDMgaW4g
ZGV2ZWxvcG1lbnQgZXZlbiBiZWZvcmUgdGhlCmZpbmFsIHJlbGVhc2UsIHRoaXMgdGltZWxpbmUg
d2FzIHN0aWxsIHRvIHRpZ2h0IHRvIGZpdCBpbiBmb3IgdGhlIFlvY3RvIDUuMApyZWxlYXNlIHdp
bmRvdywgc2luY2UgaXQgYWxzbyByZWxlYXNlZCBpbiBBcHJpbC4gQXMgYSByZXN1bHQsIFlvY3Rv
IDUuMQooU3R5aGVhZCkgd2FzIHRvIGZpcnN0IHJlbGVhc2UgdG8gaGF2ZSBTUERYIDMgc3VwcG9y
dC4KClByYWN0aWNhbGx5IHNwZWFraW5nLCB0aGlzIG1lYW5zIHRoYXQgdGhlcmUgaXMgY3VycmVu
dGx5IG5vIFlvY3RvIExvbmcgVGVybQpTdXBwb3J0IChMVFMpIHJlbGVhc2UgdGhhdCBzdXBwb3J0
cyBTUERYIDMsIHNpbmNlIFlvY3RvIDUuMCBpcyB0aGUgbW9zdCByZWNlbnQKTFRTIHJlbGVhc2Ug
YW5kIHdpbGwgYmUgc3VwcG9ydGVkIHVudGlsIEFwcmlsIDIwMjguIFRoZSBuZXh0IHNjaGVkdWxl
ZCBMVFMKcmVsZWFzZSBpcyBZb2N0byA2LjAgKFdyeW5vc2UpLCBzY2hlZHVsZWQgZm9yIEFwcmls
IDIwMjYuCgpZb2N0byBoYXMgc3VwcG9ydGVkIGNyZWF0aW5nIGBTUERYIDIuMmBfIFNCb01zIHNp
bmNlIHRoZSAzLjQgcmVsZWFzZSAoSG9uaXN0ZXIsCk9jdG9iZXIgMjAyMSkuIEhvd2V2ZXIsIHdo
aWxlIHRoZXNlIFNCb01zIGRvIHByb3ZpZGUgdXNlZnVsIGFuZCBhY3Rpb25hYmxlCmluZm9ybWF0
aW9uLCBpdCB3YXMgZGlzY292ZXJlZCBpbiB0aGUgY291cnNlIG9mIGltcGxlbWVudGF0aW9uIHRo
YXQgdGhpcwp2ZXJzaW9uIG9mIFNQRFggd2FzIGluY2FwYWJsZSBvZiBwcmVjaXNlbHkgZGVzY3Jp
YmluZyBzb21lIG9mIHRoZSBtb3JlCmNvbXBsaWNhdGVkIG51YW5jZXMgdGhhdCBvY2N1ciBpbiBZ
b2N0byBidWlsZHMsIGFuZCBhbHNvIHdhcyBpbnN1ZmZpY2llbnQgdG8KZGVzY3JpYmUgdGhlIHBy
b2Nlc3MgYnkgd2hpY2ggc29mdHdhcmUgdnVsbmVyYWJpbGl0aWVzIHdlcmUgcGF0Y2hlZCBpbiB1
cHN0cmVhbQpsYXllcnMuICBBcyBzdWNoLCB0aGUgaW1wbGVtZW50YXRpb24gc3B1cnJlZCBtZW1i
ZXJzIG9mIHRoZSBZb2N0byBjb21tdW5pdHkgdG8KYmUgbW9yZSBpbnZvbHZlZCBpbiB0aGUgZGVz
aWduIG9mIHRoZSB0aGVuIHVwY29taW5nIFNQRFggMyByZWxlYXNlLiBUaGlzCmludGVyYWN0aW9u
IHdhcyBtdXR1YWxseSBiZW5lZmljaWFsIGZvciBib3RoIHByb2plY3RzOyBZb2N0byB3YXMgYWJs
ZSB0byBlbnN1cmUKdGhhdCBTUERYIDMgY291bGQgZXhwcmVzcyB0aGUgbW9yZSBjb21wbGljYXRl
ZCBzaXR1YXRpb25zIHRoYXQgYXJpc2UgZHVyaW5nCmJ1aWxkcywgYW5kIFNQRFggZ290IGFkdmlj
ZSBvbiBjb25jcmV0ZSBleGFtcGxlcyBvZiB0aGUgY29tcGxpY2F0ZWQgYnVpbGRzLCBhcwp3ZWxs
IGFzIGhhdmluZyBhIHZlcnkgZWFybHkgYWRvcHRlciBvZiB0aGUgbmV3IHN0YW5kYXJkLiBZb2N0
byBTQm9NcyBhcmUgb2Z0ZW4KcHJvdmlkZWQgYXMgZXhhbXBsZXMgb2Ygd2hhdCBhIFNQRFggMy4w
IGRvY3VtZW50IGNhbi9zaG91bGQgbG9vayBsaWtlLgoKQXMgb2YgdGhlIGRhdGUgb2YgdGhpcyBk
b2N1bWVudCwgdGhlIG1hc3RlciBicmFuY2ggb2YgT3BlbkVtYmVkZGVkIENvcmUgc3RpbGwKc3Vw
cG9ydHMgYm90aCBTUERYIDIuMiBhbmQgU1BEWCAzLjAuIEhvd2V2ZXIsIFNQRFggMy4wIGlzIGNv
bnNpZGVyZWQgdGhlIGJldHRlcgppbXBsZW1lbnRhdGlvbiwgYW5kIGlzIHRoZSBvbmUgZW5hYmxl
ZCBieSBkZWZhdWx0IHdoZW4gYnVpbGRpbmcuIFNQRFggMi4yCnN1cHBvcnQgZG9lcyBzdGlsbCBy
ZWNlaXZlIGJ1ZyBmaXhlcywgYnV0IG1vc3Qgb2YgdGhlIFNQRFggZGV2ZWxvcG1lbnQgZWZmb3J0
CmZvY3VzIG9uIFNQRFggMy4wLgoKT24gMjMgT2N0b2JlciwgMjAyNCB0aGUgRXVyb3BlYW4gVW5p
b24gKEVVKSByYXRpZmllZApgUmVndWxhdGlvbiAoRVUpIDIwMjQvMjg0N2BfIChjb21tb25seSBy
ZWZlcnJlZCB0byBhcyB0aGUgQ3liZXIgUmVzaWxpZW5jZSBBY3QKb3IgQ1JBKSB3aXRoIHRoZSBn
ZW5lcmFsIGdvYWwgb2YgaW1wcm92aW5nIHRoZSBjeWJlcnNlY3VyaXR5IHBvc3R1cmUgb2YKY29u
c3VtZXIgc29mdHdhcmUgaW4gdGhlIEVVLiBUaGUgcmVndWxhdGlvbiBpbXBvc2VzIG1hbnkgcmVx
dWlyZW1lbnQgb24Kc29mdHdhcmUgc3VwcGxpZXJzLCBhbmQgZ29lcyBpbnRvIGZ1bGwgZWZmZWN0
IGluIDExIERlY2VtYmVyLCAyMDI3ICh3aXRoIHNvbWUKcGFydHMgbm90IHJlbGV2YW50IHRvIHRo
aXMgZG9jdW1lbnQgZ29pbmcgaW50byBlZmZlY3Qgc29vbmVyIGluIG1pZCAyMDI2KS4KCk9uZSBv
ZiB0aGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBDUkEgaXMgdGhhdCBtYW51ZmFjdHVyZXJzIGJlIGFi
bGUgdG8gcHJvdmlkZSB0aGUKRVUgd2l0aCBhbiBTQm9NIGZvciBhbnkgc29mdHdhcmUgY292ZXJl
ZCB1bmRlciB0aGUgcmVndWxhdGlvbi4gVGhlIHB1cnBvc2Ugb2YKdGhpcyBTQm9NIGlzIHRvIHBy
b3ZpZGUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNvZnR3YXJlIGFuZCBpdHMgZGVwZW5kZW5jaWVz
LCBhcwp3ZWxsIGFzIGV2YWx1YXRlIHRoZSBzb2Z0d2FyZSBmb3IgZXhwb3N1cmUgdG8gdnVsbmVy
YWJpbGl0aWVzIChlLmcuIGNoZWNrIGlmCmFueSBDVkVzIGFmZmVjdCBpdCkuCgpJdCBpcyBpbXBv
cnRhbnQgdG8ga2VlcCBpbiBtaW5kIHRoYXQgYXMgb2YgdGhlIHRpbWUgb2YgdGhpcyB3cml0aW5n
LCB0aGUgQ1JBCmRvZXMgbm90IGhhdmUgY29uY3JldGUgcmVxdWlyZW1lbnRzIGZvciBzdXBwbGll
ciBTQm9Ncy4gVGhlc2UgYXJlIHN0aWxsIGluIHRoZQpwcm9jZXNzIG9mIGJlaW5nIHdyaXR0ZW4g
YnkgdGhlIEVVLCB3aXRoIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZXkgd2lsbCBiZQpjb21wbGV0
ZSBzb21lIHRpbWUgaW4gMjAyNi4KClByb2JsZW0gU3RhdGVtZW50Cj09PT09PT09PT09PT09PT09
CgpUaGUgWW9jdG8gcHJvamVjdCBpcyBpbiBnb29kIHBvc2l0aW9uIHRvIHByb3ZpZGUgYGNvbXBy
ZWhlbnNpdmUgU0JvTXNgXyB0byBpdHMKdXNlcnMgdGhyb3VnaCB0aGUgU1BEWCBzdXBwb3J0IGlt
cGxlbWVudGVkIGluIE9wZW5FbWJlZGRlZCBDb3JlLiBUaGVzZQpnZW5lcmF0ZWQgU0JvTSBjYW4g
Z28gYSBsb25nIHdheSB0b3dhcmQgaGVscGluZyBlbmQgdXNlcnMgY29tcGx5IHdpdGggdGhlIENS
QQpTQm9NIHJlcXVpcmVtZW50cy4KCldpdGggdGhlIFlvY3RvIDUuMCByZWxlYXNlIHNldCB0byBs
ZWF2ZSBzdXBwb3J0IGluIEFwcmlsIDIwMjgsIHRoZXJlIGlzIGEKcm91Z2hseSA1IG1vbnRoIG92
ZXJsYXAgYmV0d2VlbiB0aGUgZW5mb3JjZW1lbnQgb2YgdGhlIENSQSBhbmQgdGhlIGVuZCBvZgpz
dXBwb3J0IGZvciBZb2N0byA1LjAuIEdpdmVuIHRoZSB0eXBpY2FsIHRpbWluZyBvZiBzb2Z0d2Fy
ZSBsaWZlIGN5Y2xlcywgaXQgaXMKaGlnaGx5IGxpa2VseSB0aGF0IG1hbnkgdXNlcnMgd2lsbCBi
ZSBuZWVkaW5nIHNvZnR3YXJlIGJ1aWx0IHdpdGggWW9jdG8gNS4wIHRvCmNvbXBseSB3aXRoIHRo
ZSBDUkEgU0JvTSByZXF1aXJlbWVudHMuCgpIb3dldmVyLCB0aGUgU1BEWCAyLjIgc3VwcG9ydCB0
aGF0IGlzIGN1cnJlbnRseSBhdmFpbGFibGUgaW4gWW9jdG8gNS4wIGlzCmxhY2tpbmcgaW4gYSBm
ZXcga2V5IHBvaW50cyByZWxhdGVkIHRvIENSQSBjb21wbGlhbmNlLCBzcGVjaWZpY2FsbHkgaW4g
cmVnYXJkCnRvIHZ1bG5lcmFiaWxpdHkgcmVwb3J0aW5nLiBJdCBpcyBhbHNvIHdvcnRoIG5vdGlu
ZyB0aGF0IGFzIG1vcmUgY29uY3JldGUKaW5mb3JtYXRpb24gYWJvdXQgdGhlIENSQSBjb21lcyBv
dXQgaW4gdGhlIG5leHQgeWVhcnMsIHRoZSBTUERYIGNvbW11bml0eSB3aWxsCmxpa2VseSBiZSB3
aWxsaW5nIHRvIG1ha2UgdXBkYXRlcyBhbmQgY2hhbmdlcyB0byB0aGUgU1BEWCAzIHNwZWNpZmlj
YXRpb24gaW4Kb3JkZXIgbWFrZSBjb21wbGlhbmNlIGVhc2llcjsgaXQgaXMgbGVzcyBsaWtlbHkg
dGhhdCB0aGV5IHdpbGwgZG8gdGhlIHNhbWUgZm9yCnRoZSBTUERYIDIuMiBzcGVjaWZpY2F0aW9u
LgoKUHJvcG9zZWQgU29sdXRpb24KPT09PT09PT09PT09PT09PT0KClRoZSBwcm9wb3NlZCBzb2x1
dGlvbiB0byB0aGlzIHByb2JsZW0gaXMgdG8gYmFja3BvcnQgdGhlIFNQRFggMy4wIHN1cHBvcnQK
Y3VycmVudGx5IG9uIG1hc3RlciB0byB0aGUgWW9jdG8gNS4wIHN0YWJsZSBicmFuY2gsIGJ5cGFz
c2luZyB0aGUgbm9ybWFsIHBvbGljeQpvZiBub3QgYmFja3BvcnRpbmcgbWFqb3IgZmVhdHVyZXMu
IFRoaXMgd291bGQgcHJvdmlkZSBlbmQgdXNlcnMgd2l0aCB0aGUgaGlnaGVyCnF1YWxpdHkgU0Jv
TXMgcmVxdWlyZWQgYnkgdGhlIENSQSwgYW5kIHdvdWxkIGFsc28gcHV0IHRoZSBwcm9qZWN0IGlu
IGEgYmV0dGVyCnBvc2l0aW9uIHRvIGltcGxlbWVudCBhbnkgb3RoZXIgY2hhbmdlcyByZXF1aXJl
ZCBieSB0aGUgQ1JBLCBzaW5jZSBhbGwKc3VwcG9ydGVkIHZlcnNpb24gb2YgWW9jdG8gd291bGQg
dGhlbiBoYXZlIFNQRFggMy4wIHN1cHBvcnQgKGlnbm9yaW5nIHRoZSBZb2N0bwo0LjAgIktpcmtz
dG9uZSIgcmVsZWFzZSB3aGljaCBnb2VzIG91dCBvZiBzdXBwb3J0IEFwcmlsIDIwMjYpLgoKVGhl
IGJ1bGsgb2YgdGhlIHdvcmsgdG8gZG8gdGhpcyBiYWNrcG9ydCBoYXMgYWxyZWFkeSBiZWVuIGBw
cm9wb3NlZGBfIG9uIHRoZQpvcGVuZW1iZWRlZC1jb3JlIG1haWxpbmcgbGlzdC4gQSB0aHJvdWdo
IHJldmlldyBvZiB0aGlzIHByb3Bvc2FsIGlzIHN0aWxsCm5lY2Vzc2FyeSwgYnV0IHRoZSBvdmVy
YWxsIHN0cmF0ZWd5IGhhcyBiZWVuIHJldmlld2VkIGFuZCBhcHByb3ZlZCBieSB0aGUKb3JpZ2lu
YWwgU1BEWCAzIGF1dGhvci4KClRoaXMgcHJvcG9zYWwgd291bGQgc2VlIFNQRFggMi4yIHJlbWFp
biB0aGUgZGVmYXVsdCBvcHRpb24gZm9yIGdlbmVyYXRpb24gb2YKU1BEWCBkYXRhIG9uIHRoZSBZ
b2N0byA1LjAgYnJhbmNoLCBzbyBhcyBub3QgdG8gYnJlYWsgYmFja3dhcmQgY29tcGF0aWJpbGl0
eS4KVXNlciBjb3VsZCB0aGVuIHN3aXRjaCBmcm9tIFNQRFggMi4yIHRvIFNQRFggMy4wIGFzIGRl
c2lyZWQuCgpBbHRlcm5hdGUgU29sdXRpb25zCj09PT09PT09PT09PT09PT09PT0KClRoZSBjb21t
b25seSB1c2VkIGFsdGVybmF0aXZlIHNvbHV0aW9uIHRvIGJhY2twb3J0cyBpbnRvIHN0YWJsZSBi
cmFuY2hlcyBpcyB0bwpsZXZlcmFnZSB0aGUgbGF5ZXJpbmcgcG93ZXIgb2YgYml0YmFrZSB0byBw
cm92aWRlIHRoZSBiYWNrcG9ydCBpbiBhIHNlcGFyYXRlCmxheWVyLiBUaGlzIGhhcyBiZWVuIGRv
bmUgbWFueSB0aW1lcywgd2l0aCBzZXZlcmFsIGV4YW1wbGVzIGluIHRoZQpgbWV0YS1sdHMtbWl4
aW5zYF8gcmVwb3NpdG9yeS4gSG93ZXZlciwgdGhpcyBhcHByb2FjaCBpcyBub3QgcmVjb21tZW5k
ZWQgZm9yCmJhY2twb3J0aW5nIFNQRFggMyBmb3IgYSBudW1iZXIgb2YgcmVhc29uczoKCjEuIFRo
ZSBTUERYIDMgY29kZSBtYWtlcyBzZXZlcmFsIGNoYW5nZXMgdG8gcGFydHMgb2YgdGhlIGNvZGVi
YXNlIHRoYXQgY2Fubm90CiAgIGJlIGVhc2lseSBtb2RpZmllZCBpbiBhIHNlcGFyYXRlIGxheWVy
LCBpbmNsdWRpbmcgcHl0aG9uIGxpYnJhcnkgY29kZSBhbmQKICAgYmJjbGFzcyBmaWxlcy4KMi4g
QmFja3BvcnRpbmcgaW4gdGhpcyBtZXRob2Qgd291bGQgbWFrZSBpdCBoYXJkZXIgdG8gYmFja3Bv
cnQgYW55IGFkZGl0aW9uYWwKICAgZnV0dXJlIGNoYW5nZXMgZGVzaXJlZCBmb3IgQ1JBIGNvbXBs
aWFuY2UsIG9yIGJ1ZyBmaXhlcy4gSWYgdGhlIGNoYW5nZSBpcwogICBkb25lIGRpcmVjdGx5IGlu
IE9wZW5FbWJlZGRlZCBDb3JlLCBzaW1wbGUgYmFja3BvcnRzIGNhbiBiZSBkb25lIGZyb20gbWFz
dGVyCiAgIHRvIHRoZSBzdGFibGUgYnJhbmNoCgoKQWNrbm93bGVkZ21lbnRzCj09PT09PT09PT09
PT09PT0KClRoYW5rcyB0byBLYW1lbCBCb3VoYXJhIGZvciBwdXR0aW5nIHRvZ2V0aGVyIHRoZSBi
YWNrcG9ydCBwYXRjaGVzLgoKRm9vdG5vdGVzCj09PT09PT09PQoKLi4gX1NQRFggMy4wOiBodHRw
czovL3NwZHguZ2l0aHViLmlvL3NwZHgtc3BlYy92My4wLjEvCi4uIF9TUERYIDIuMjogaHR0cHM6
Ly9zcGR4LmdpdGh1Yi5pby9zcGR4LXNwZWMvdjIuMi4yLwouLiBfUmVndWxhdGlvbiAoRVUpIDIw
MjQvMjg0NzogaHR0cHM6Ly9ldXItbGV4LmV1cm9wYS5ldS9lbGkvcmVnLzIwMjQvMjg0Ny9vagou
LiBfY29tcHJlaGVuc2l2ZSBTQm9NczogaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj15
ME40Rm5rd1RPWQouLiBfcHJvcG9zZWQ6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL3RvcGljLzExNTA4NjA1MgouLiBfbWV0YS1sdHMtbWl4aW5zOiBo
dHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtbHRzLW1peGlucy8K

--_004_SN7PR04MB846354716C9A3803715C6C6E991DASN7PR04MB8463namp_--

