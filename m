Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFACC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 15:19:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.133])
 by mx.groups.io with SMTP id smtpd.web11.15930.1714749591244218612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 08:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=1WzjvKnl;
 dkim=fail reason="dkim: body hash did not verify" header.i=@seco.com header.s=selector1 header.b=Ey9iAzxE;
 spf=pass (domain: seco.com, ip: 40.107.21.133, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I7AukaTK02K5vuP5y3kFQ97NueQ/XhEsci3UKTehtgMDvT3sdFF9wp1sUbbvFXNvfuFHkN9/Io1td1Mk0DEhYLfKJi2t/NyHy2OkReQXJg+kn3bmDu05oJrZlXOG93eSZoEFN8GomZeJuyTNguyRsQx7dweCbAQdVEx1gzSKwKASUuMQKMJpNvWBXPQSKgIzZTw+Z22mT0D1FMcA64SUiPa6T25R0hu5J3vme491hfmj9mYxyZSxxnkkJq1pCWW8aiAYFjUGXSMtV97WtTpHX11lP/kH5f6onqNijhxefLKoN05T/yvcfLBWPGmXjY0nik4cgxk3snFohllF3vkkcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyCVketaVJBauHAG/SwRW0xvnFoDZHu+Uac0bWmPe7w=;
 b=A5f1LWgS58jBbmlSjAp/YyhWB1JOvgOYC4bB71vbbu8OZhMnBMAJCNdY1f0LAmBfH+bpx6kk3wbtE+ZXfesQsPm7eDC6+asNZ0IMHkuTYbOkodcEbRyTIfBbmh8BAG7L/Ztqb2U5rgHCqfZJERKl++YFtHCgialI2wjTrtzl7SpGPZLbY4X9g0FVyuY+TBFGi2snbbpBr8F2x/nc095cxOAgjn4IiqChryU1R5/lF5+l1EG7/RZ17+hz3xnQGEImGzkgaMQxvLYzyCdke+G4p2qKMDWlu+TaQZA99PffKRD7bWIeN+RLbiLFSXmepDisZ5BNhbjNPMg6T9TwgAUm9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.84) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=seco.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=seco.com;
 dkim=pass (signature was verified) header.d=seco.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyCVketaVJBauHAG/SwRW0xvnFoDZHu+Uac0bWmPe7w=;
 b=1WzjvKnly71RdX3yyNwTUjtloZuGj9jtJi7VOpEwUSmJzfsjoKzSZI/xDlwMIZzzWqM5R6Y/hgdyZ/MKJP+a3tOMcJDquERE5mdgQY8bg1t8F+AkPWRpgxJ0/cd/fBAfmKmoVlmWwENt5i60zA+PPalNV9IaUs0y18o+c1UjNj9zqLSvnv+pv0XDgEp2RuoB5rNM0R864nLG3DUTMFzqicySVczce9+kBR+ASaNpw+u315ndpGFkn+zlv390VkcGqYF5xuHvRAUhJfWcmU6GxhNVHgATI1j11CaNJMdUWHthdLFnGXJWlgJ96R4QfN/b9uSOvvDcfOBTEVY/cRkrBQ==
Received: from DB7PR05CA0041.eurprd05.prod.outlook.com (2603:10a6:10:2e::18)
 by AS2PR03MB10111.eurprd03.prod.outlook.com (2603:10a6:20b:579::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 15:19:46 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::13) by DB7PR05CA0041.outlook.office365.com
 (2603:10a6:10:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30 via Frontend
 Transport; Fri, 3 May 2024 15:19:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18 via
 Frontend Transport; Fri, 3 May 2024 15:19:45 +0000
Received: from outmta (unknown [192.168.82.132])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id A9E172009538D;
	Fri,  3 May 2024 15:19:44 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown [104.47.12.50])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 84CB62008006F;
	Fri,  3 May 2024 15:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDch5qad2QXXzfeQ92/zycL8EMsMuTJY5FniYQ5pQ7hRjvKrGx7hUcuFvHgfPbly+YqepWLNFYnPoTypWVU4xTBSXCW5ixJcFPUa7kXqCZbILUACSmTrRd1hozhI+GCWppEVR9cl+1UKkTTj2iJkz/h1db2475V3Yn0ofaQi3ZwGRBlbAFlCSPipXIhq4MjyH62xaz8+Omi79ARVi0Pf0wy2A9pRf+Dc51yxhJJ9C7GDEvryaujYZbopnAzcXI9mMh+7PaISU7vQEcVsj9rYeLxZVfg/OTXbP1zTXgW2RxhGNViObMWBFOuyiWjn8uE4INYkS2a90dyWXsn9Sj0zvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5+G370Vi1AbHxgf35EyGf1kWpGaK7RtCfmGvLGLKaE=;
 b=PRmTLHvfonkFeIDv0QQP/Qe0zHG20n2UbJhwA5eE/dpMZTnEagPuujWJPaRGkvfUFIpxw0N25c8nDqFPbFZWUi1WJdWuMFRkQF+rE969oROCgHm1BYFgn2yBsx/qoyLL/MyFWA8OZPXbZHj4kLkdNTnvAbEBVUR0qMC2kizhbCWz1OP+NKWtcgfP8KfeDomSjSFNrvwtHcfgGcuDG7O/ZeNh7cyVRwnAQ2P23QtouurVqaJPdoNEwJPjfevB9DK5P2bEc2b7uRQui2CSqIUD8iQhRQ3qMfLMS1cdUVG1CjmChFxOE/Lgha7AGzVydFIk97I/Rw4MZx6VRlc24GWGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5+G370Vi1AbHxgf35EyGf1kWpGaK7RtCfmGvLGLKaE=;
 b=Ey9iAzxE19gvp0Px3aETMm0Ui1jwLhontpw7z5VCTrWSNxoWlFWTCWDleRetorJgUlEbw9MwJ2zZ0FjFxOPZSsKj2JmW0Y97iwKeNvAXg7Ry1Iu5wrLQD5R7s5CLLZ1/pFDtbMkrMSiOdEtnQuT1YPiYOQHFX++SqiOc3A4ydSdfFQefcWLe5VkmAdFfxzaN12iXqiGgxZaS0B4lEDck1YlVRTdKpET15pTDkOgkzCIFyHoJfRaZLrEJYlHEDwNYyLt8RRh19a8LU8tL0LGBcWZtqMoNFd55f7a1eQYzhspMNBKbqprOhP0hI5mqA/XkroWgIqinHuzY5iMWw6wnCg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by GVXPR03MB8354.eurprd03.prod.outlook.com (2603:10a6:150:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.21; Fri, 3 May
 2024 15:19:39 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::84d0:c817:1e20:5554]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::84d0:c817:1e20:5554%7]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 15:19:38 +0000
Message-ID: <1f1c6187-b14b-4d43-ae0d-befc50038c53@seco.com>
Date: Fri, 3 May 2024 11:19:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] uboot-sign: fix loop in do_uboot_assemble_fitimage
To: Ralph Siemsen <ralph.siemsen@linaro.org>,
 openembedded-core@lists.openembedded.org
Cc: jamin_lin@aspeedtech.com
References: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20240503151827.1387077-1-ralph.siemsen@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::14) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	DB9PR03MB8847:EE_|GVXPR03MB8354:EE_|DU2PEPF0001E9C0:EE_|AS2PR03MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c2f0f1-cdc0-4d35-35af-08dc6b8476ad
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WC9IMExZWUg1b0dPVGdXQlJ1WUdtWFpuSmdZYTFHM291ZEVOVERiaFRkQ3NC?=
 =?utf-8?B?SUpOOGpmU2kzaW5SeEdaQmlWYWFhZktCZ0J4SEwyTXZpbTdUdmRZbWtwZE45?=
 =?utf-8?B?UjNWNTlpZS9xU0U0RDFkRjI2UUU2S1dJeXk1WVJSK05JVWIvam5VZ3Fub05V?=
 =?utf-8?B?cDJ6Q05UOS9EUW5kaTkzN29ueWt1blVReEk2NjFxSklNZkJTVnhKOHVmZ1Zh?=
 =?utf-8?B?SHRJbWc4M09kaVNjckFCcHZCWExOY0VmaUJib2pic2xMTHBJNC9hbWcrd3ha?=
 =?utf-8?B?dC9Ubm9nU2RQQ2s1dURhS2FqRE5EMFVob0Zsb0swclVaVVFOMTYwUlEySFBo?=
 =?utf-8?B?ZGJEWnNtNVBzYllLZXhsYzdXUjNDYy9lRE1rQlpGcXdvVTNDdVV4eThtbnhF?=
 =?utf-8?B?NUJ1M1pHRlhsUGNXK1AzQTJtcGdFcW5Mc1FickdlcSs5eHZXSEpqRWJ1dXU5?=
 =?utf-8?B?bk12TnJyWXhZMzI3V29oa2tETVVCVlhnd3IvVE42aEdRRUIwSG9UY2ZwTGtt?=
 =?utf-8?B?SmZXVUhaWUJQdzlXRHZ2RDZYTVZXT0NRV254ajJMbm9Va2dxVWtWT051cUpr?=
 =?utf-8?B?WnJhRnkweitWOWJBL2w3NEZZcDRBNkFtTGs4cXg3UEhueWJxSngydndkWUZX?=
 =?utf-8?B?SkJ3UTM1OFVsV3BLcExNdlhNeGFVaWFsNlB4WXIyKy9DZGVocUM4eTRFRVdC?=
 =?utf-8?B?ZTlDTFk2V2ZVNWxGaXhPcTF0d001WGtmY2kzWXIzb3ZJa3M1c3BaRERQQmR4?=
 =?utf-8?B?T1VtUUJqNjc5elZyQ0diWG9Ra2dja2xNTGZTclNJczFtRmxzNG8yb0hqempE?=
 =?utf-8?B?NHNLZWtYcFEwd2xaWFFoSEJhMTU0RlpQTEtoVWJRcUxsSzl3MnhLc3VtUWxa?=
 =?utf-8?B?aDhxa3JvdWFRaHVKalErSWlQa2lzWnlxcmY1R2YvNnYrK2JSaVN6dVVISW94?=
 =?utf-8?B?T0xKRHlkejg5MGI4c054STNnRlA4TnRtTnVMcngvQ0N4YlM4TnZvUlRjbXhm?=
 =?utf-8?B?dTZBcTRuMDRnS0RGdjM4NWtueXBmbGNCRzNkSmo4QVYzUDVDVGRBdlpRUzJO?=
 =?utf-8?B?dVdqNFFrZGNwVW9jSGtQSFlMNlN3Ky84QTBEVFliM3N0T041M2o1aVpRcDls?=
 =?utf-8?B?cUVadFB3c0lhZ2Jtd29QejlhdkU3bmJTZUNvZ0hqdi82REpaQ3VSM3hmL1h1?=
 =?utf-8?B?dzFEbDVWRlRQK3ZKNVVoNURHK0Z5eDRPbk9IcXkvVEpLSERGdTJjQytPQ3Zm?=
 =?utf-8?B?YUFVT3NJWTJGM3VHY3hRd0J6KzJwWTZSMVBCc2NaSGtKMXVieFU2Z1Bub3lV?=
 =?utf-8?B?ZU8yVzBuWlJEbCtQL0ZGWkgxK0hHRlJObnRkOXBSaitaa290QzQvcWlVMEJV?=
 =?utf-8?B?SjRzYzhCUk82c2QxNWwvREREaG5IcWw2UXNIdWJLMVd4VjcxNnZhNmlKQ2F6?=
 =?utf-8?B?ZmRkL0NvMFhBYWovNmtNR3J5WTdqNXhKMGNJSGoyemh4em1ZTkhManlqc3ZR?=
 =?utf-8?B?bnhqOGNMMzV1Q3VKOE8vZEYyTTRKRUFjRFJhYk5yWFM1Z29pQkErZnI0d3Ru?=
 =?utf-8?B?ZnYvSWR0UDB1ZkpHR1hpQmticUdHK0xTMDNpNnlrc2MyY09HeXRueHROaTds?=
 =?utf-8?B?d2N4KzVCK24rZTVqMmtESmRkNHVuZXAzWTBENlpkNlByZCs4Yjc2QmF3MGI0?=
 =?utf-8?B?UUlVZG5weGYwclMvb1piaHlGaWdvSHBkK3JSUzB4ZVVNcDVORnFCcDZDWUJa?=
 =?utf-8?B?UzNKaXltcFlVTUJLeEViV2o0azJoWmY4TE8xMzN5T1FIZ0xhcXpIeURBczJJ?=
 =?utf-8?B?K2xaM3lYekNrRVUzcXhtdz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8354
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	779e3c9d-26c1-4ffc-b266-08dc6b8472d8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|35042699013|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0o2N0JVVXZsbTA0bmxDU2pYbnF4SjdGOUtXR05HcDA5NmlJK09QSHpQNjB0?=
 =?utf-8?B?WVpURWZFakV1T2hMTVZxNzFOR0NpdG1yQkd3REdYSFR1UU5mbTgyTlFvelg3?=
 =?utf-8?B?cjM3cUxMWU03N3NFWW9lVkNoRFlGY0R5Y1BoSHNiMGtjRmtueTBheDhLUU1V?=
 =?utf-8?B?OE50VkNSTFBLL000Zk42RUdWcjk3TUVURUtFT1dYM2Z3Mmk4Nnl6RFNvRTdU?=
 =?utf-8?B?K28wZlErTUVvRldXaCt0YSt3bzVOenozT0xJTlo5VjlXaXZkdDlvalE1VEtJ?=
 =?utf-8?B?SW9HcE5DNGUzSmE4ZElrR3BnWDdmUGFRQjJzTFhubytMSzNKckc5OTFFZEY3?=
 =?utf-8?B?Qjd3MTJmSFVwRi9rcUJYZHdmKy9iUmlzTm1CUEJUSXJDWFNYUS9XMHFvTnFN?=
 =?utf-8?B?SE9KSjhSZ3VEWEZGVC9Na2xWU0dScUtaN0xubFk5YjdhTnBCUllyNDVyTzRw?=
 =?utf-8?B?YU9CYitsc2tFNGs4aEY2NXlzblVkaTRSZzM2bDdmNlhHNllrRFA4b3RpM21P?=
 =?utf-8?B?VS9BVmlNRDlwcHpvUDY5bGhFekRpMzZSa04rS3BqVldsM1Nudkk1V2hoQUJJ?=
 =?utf-8?B?dGNSVU1nTGMvRVFJWXJSV0VrMEM0Z3I4Q1J3TE96aU9rTDQ2SjhqTTM0VkNP?=
 =?utf-8?B?c04zbklTZkpkY1grSFNxdTB6RDdSUVl6aXJsQjJ4YmJxSGkzekxEVUFmbjBZ?=
 =?utf-8?B?UVB1MW4wdmhLbTRXd0xVQk5QeHlzYktoUkE4R204bzFjMzFaZ2JSSFcvSUdh?=
 =?utf-8?B?c2pxYXV0TldBN1NoZnZmamJUUnRHU1RSbGhGeUxVUFhBVTBocXlJR2Y4dGNh?=
 =?utf-8?B?MFBoaVVubXpzNlpPQ29sb2loTkYyK1hzL2xKL0pvQW5MV245TWF6NjdYUzVM?=
 =?utf-8?B?K2dFYVkvbWtYWHRtdVd0RlJGUGNsenhEZmF1ajhaQ1FFWVNheCtzMXlhcWl4?=
 =?utf-8?B?ZkZheUNKOHE2SXAxbE1ieUlLMStrS0hoU0dLdG5XY3ArSGZIRGIvekRXZXZk?=
 =?utf-8?B?UjZRZ3FIZWdrMmlCZ1k5d1BuWi92QkN5T1JndmRCbGhXOC90YktRWVNQZWtw?=
 =?utf-8?B?VFF5US83Ylp0dFdnOUpUTmxEMkd2WDR4czJJSURLTm1wUFV2dzI0eVp6R0w2?=
 =?utf-8?B?OGtQWmRaMEVicm1icFZ0Q09FS0c1UFJYblc2cU1uOVlZTnJNcSttOC9iMnpH?=
 =?utf-8?B?VXBKZkRRWVo0WUtPYWgrQmxIN21EM1V3YnhtWjlTOEVLdkdKRGNuc3UyNTlO?=
 =?utf-8?B?Y2RuYXkvVTY5SU5WanBwWVlvT09vY1NoR3k1bCt4Sm8xMHJWOFBFcHNFbzJm?=
 =?utf-8?B?T0QwNFF3Mkt2LzAxTXF2K1c4VGcyVDhsbFNxTis3dFNGK2NPcU1xYjhvUVhi?=
 =?utf-8?B?cERpTEY5NVF6TjlSdlpWTWhqVVJIdmRCVmY1WmlEQVA2RktscHgzZVc2TWhJ?=
 =?utf-8?B?MjgxblZWa2NEOVJyYUxqaHRqa3ZERkdXdWs0V0VlYVZ0clJTb0lQd1VPNDlk?=
 =?utf-8?B?clVoaVVSV1FrdWplNk5heU5XK3F0bm4vSlRJQnNBT2JHSTI1OCtqTDVSSExN?=
 =?utf-8?B?Q2lyUWZRVVoxcDgxRGg3eUQ5ZmkyUDY3aUFNbjVBUjJuMStSQTRRRFVVclpX?=
 =?utf-8?B?aDBzRFV1WjRJajdtMGNJUGRpZEtadURHa09nc2dtYkc5WnpISXg3ZTZaMlZj?=
 =?utf-8?B?M2F3TmZlaUh6OEo2TnJPVFBDWWhmY1IrYWRSQmppa3RrK3kzV0d1eU4vQ2dR?=
 =?utf-8?B?cXUxQmN3dHlpWU5rYnNuc2xHSlB5QXdFV2tmRFl2UWhSejBTa1pzV2F3eVZJ?=
 =?utf-8?Q?3Op3K5sfneTMAetUCMb/I7SaefPnAd4b8sQAE=3D?=
X-Forefront-Antispam-Report: 
	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(35042699013)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 15:19:45.0060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c2f0f1-cdc0-4d35-35af-08dc6b8476ad
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB10111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 15:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199005

On 5/3/24 11:18, Ralph Siemsen wrote:
> When using multiple u-boot configurations in UBOOT_CONFIG, the helper
> function uboot_assemble_fitimage_helper() was not called with all
> combinations of type & binary, due to a copy-n-paste indexing error.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>  meta/classes-recipe/uboot-sign.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 7a0b8047e4..c8e097f2f2 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -367,7 +367,7 @@ do_uboot_assemble_fitimage() {
>                       done
>
>                       for binary in ${UBOOT_BINARIES}; do
> -                             k=3D$(expr $j + 1);
> +                             k=3D$(expr $k + 1);
>                               if [ $k -eq $i ]; then
>                                       break;
>                               fi

Reviewed-by: Sean Anderson <sean.anderson@seco.com>
[Clea Astarte Google Cloud, SECO SpA]<https://clea.ai/astarte-on-google-clo=
ud>

