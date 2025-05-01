Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82C9C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 13:14:22 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.84])
 by mx.groups.io with SMTP id smtpd.web11.11726.1746105257219043488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 06:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qsacHx7G;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qsacHx7G;
 spf=pass (domain: arm.com, ip: 40.107.104.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d2/PoAB08VrDc2lYZWE+1bQEt/2ojUgz4uNbD7ckTNli5ePWThJwKuQzcyzR6mBpIeIDGbApevShg7KO6hA3a7Q3tsLyRIl5DyPNW1rbR9w2ZuSKUjp/NZKbdhUEQsMe4d6uVdzn9611aEANgjf4X7zPr/wiB7WigtV09yL1TIM1AmuV0AAs2hbv2LEALXHfglavkuhSjpSYkmQPSJq5GCMEnoy9nPT1S0b1ojqLjo1H9V4FkYkwlhPnfp2DlocRwkDje1sBDLW5YWyYgvwt3KMQayJYXHtzwqe3KrYgYhLvbqK1fzASKzktpD8JxViSMKa+suTaVi+/hekGOiQxqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qedlXA1XUEAZT3snvrvH8+GpUxb+e2QbcgfcXbaBuwE=;
 b=Sb9fTlQojIHDz7GkyxLFYrKJjy1aVwqxmL1+HYkdrS1KjO5RnEwjwJGTOp2xJV3EfTgVK+sE5OZccSTMoEaCMBZLnYd3EM7WFvkNoHvZpSjcdaQciagW3mPSlwvB0AMsrUum70qPbAgzbc1S8rWztN4tGf0J58Z48/KlR5QjWv2U8HRTbJw5OqXrMghP1zCekbBRbDrAQdbX5dXmwicfkQ8V2d7dXDMhaTL+PtMR4t8uSHtkeUkyTJfzeeELjcQ/8R+r8kJzHrfED+WcK7LIrAa9PwoHsiXVKGvEWiU7tncFAsnyI/X0oEjJxT7D3dQ3H+PkRSOXrDErmQZd68wqIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qedlXA1XUEAZT3snvrvH8+GpUxb+e2QbcgfcXbaBuwE=;
 b=qsacHx7GjRKVoC+xtO+0djfGeYlhK1y9M1w7urfX7iZlV5qK8pwybC6ds9n82ZAaUjUN4H/lXz2vo4ETTb6q5ExKxN6aaiDyitJift93YNqb3H6uwmtDRgSO18IA7mJTiJSbgIcjqRQYMLClfMiUuZtErc3xY5lIBb5sZBkf3KY=
Received: from DU2PR04CA0263.eurprd04.prod.outlook.com (2603:10a6:10:28e::28)
 by GV2PR08MB8004.eurprd08.prod.outlook.com (2603:10a6:150:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 1 May
 2025 13:14:13 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::da) by DU2PR04CA0263.outlook.office365.com
 (2603:10a6:10:28e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Thu,
 1 May 2025 13:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Thu, 1 May 2025 13:14:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6h9Iwoz/LH3lkcy2nOjaH/0O9kbo+AMFuMufnBiXkK77ESSFL5fNltwfp6ePIVa/mnh+N1KLH/oPzSs2SpuwdMnIWsbr/hPFdUGl6OGhTmNEdUsSTMnvWNBQH6YcRsMrncjukIYzReEjkCaEg/a1RB/aB9fHiZ2GG3oBKI2OAPtdIkdus3h0SNfrVjaVZceuRBxB+cnUJFCmWb+6p4JCzSjQdXe4aKCl3M65eVEWrUIrQmSUK1Q4X7FjXV0Y/sCk9PBtXaxUyRxejiEVLeq2Cs+LK+gCO/S2PszmmS2t1sAG1YlfulYlfSBj6vWt4Tl1Avbv94+isX2T0ItRXCj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qedlXA1XUEAZT3snvrvH8+GpUxb+e2QbcgfcXbaBuwE=;
 b=MjOztfsqnrnbhZXZhGjetB/GyFQlPAJAUBrJHUN2jM6Gb9dsVREdWvechpuKOIlbDcBKoLt0Zoc1RDZhRS9f4OBDPgqnFKSpxGOOov7UFoG89uB1XnTSReg9NerkMciSqxOMKN/B7Bv6gKtRCNbrRxZmlVK8hoGd+dsWJZ5woiYffYmTMPqhBu20u6799q4fXq1mSo9ezdh+BYSxCTxKo9ZVhGtw+jS8Cv1FUnt2WydfmZM4Gc4pjN9rhq+7JdhDuXV+4kVHekTCTNeA+zTtwrVkIydEoFw/415IP/9ISL3L/xxA+yPTvkWHzBEBSxLUsctsH0NEEd8jUIQiuGN/UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qedlXA1XUEAZT3snvrvH8+GpUxb+e2QbcgfcXbaBuwE=;
 b=qsacHx7GjRKVoC+xtO+0djfGeYlhK1y9M1w7urfX7iZlV5qK8pwybC6ds9n82ZAaUjUN4H/lXz2vo4ETTb6q5ExKxN6aaiDyitJift93YNqb3H6uwmtDRgSO18IA7mJTiJSbgIcjqRQYMLClfMiUuZtErc3xY5lIBb5sZBkf3KY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9309.eurprd08.prod.outlook.com (2603:10a6:10:3f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 13:13:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 13:13:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] util-linux: ignore mkfds BPF related ptests
Thread-Topic: [OE-core] [PATCH v2] util-linux: ignore mkfds BPF related ptests
Thread-Index: AQHbulwJGjHHY3L3J029ycr7xWpUDrO9wPCA
Date: Thu, 1 May 2025 13:13:39 +0000
Message-ID: <95D57B65-8829-4CEA-9AC1-817CD298F4DB@arm.com>
References: <20250501054339.3770986-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250501054339.3770986-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9309:EE_|DU2PEPF00028CFC:EE_|GV2PR08MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ebd40ec-5421-4694-55ee-08dd88b210b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eVJacGtlNEY1SnJBeURxLy9oZlI2d1NJeVRZeHRWU2ZkbFBNL2RtSzlhenJq?=
 =?utf-8?B?cXVsbnFLVU50RGRwREZWRW9qZFhpSXpLb3ZHblY3UmMreGJTVkVwRWV1eUla?=
 =?utf-8?B?VGY1VzRzYXBaOWtORWFldEk3WUJhL00yRnhMbmc2TEl3VjkxdTN1MWU0dTd1?=
 =?utf-8?B?REpzSXBZb1B3SUljUmpyTkdZamdEaGM5eWd2Y3Y0WEJqblJSbzg2QzJteEVJ?=
 =?utf-8?B?cnJadVBxdHNWRGJWL1dudnhrTUJRLzkyb3FvOWIxMGRwaDRlcERleEhiYmgr?=
 =?utf-8?B?SjNheTFMd3UzZkM2S1ZtUXFhQklXWDdpQWVxWFgvbEs3NjV6KzByMXM5dnI3?=
 =?utf-8?B?YllueG9DanFCNzNMSUtsQ3JlaGc0cjB6d21KWk1iMmtOcUlISWFqU3hxOVRJ?=
 =?utf-8?B?cmw2R1BNVEo0NlkxTGlxMGd1UUp1dmFPbnZZOWhxRWM1WUlqa3d5RGlUTUJT?=
 =?utf-8?B?WURxZGtJaTArdmRzL3JVVW1CR2E5MWt0WDBITmI4TjBDbjV2bUJlNUl4cEFF?=
 =?utf-8?B?ODVRNk53MXd1R0k1U0ZPZ2kxRWVDUWpmU3RBK052aVZHVEFlbHFXUjRaQVhi?=
 =?utf-8?B?Ky9oVHVYb1RFQWNaa1NpcnYzcVkwaHIyOVhOVDlZeEx1amRxdVpVeFJybS9o?=
 =?utf-8?B?Y0ZVRHRIMzNTdUE4MzdTQ0luYVRtcHpTMktkeUhTcWpXbTZocXVNQWxKRjg4?=
 =?utf-8?B?dlRGeGVCOFZHZkpOeWdkcG0yOXJYcW5ia0VxRHZuTTJHSWxBVVZwSmFWT0NB?=
 =?utf-8?B?SzJhVHp1NXhQWVFIakhpSmFuZW9NSHdTTDhBSVRMbTJlVHVSZnNBUS9kLzRQ?=
 =?utf-8?B?UElNd3NNV09QbHB0VGVKaXE4Qm5LbERvTnJDVHNXd0F6d3BONkR6VjMrWlhn?=
 =?utf-8?B?V24ydjN2NDFZOU9FYm0rbEpzQkpFSCtJZi9EU0NsQnRWVElKVGFwcTNhOW04?=
 =?utf-8?B?QTdIbDhITjJIZERMM0hDRjYvMlpCck94dUMzZ1A4Z0p1RTlqZWV2dzZ6N0d5?=
 =?utf-8?B?Nk5iN0pUSkhYamkvdDgrZDNhSElmTUlaVkFqWEF4UVF3VXp6eFkvVE9MU3dk?=
 =?utf-8?B?U3NSenBOVWloYlFCK2I2T3BrNnBzZHVodEJUc1dReEtycXF4WGE1REdEVXpt?=
 =?utf-8?B?b1g4ZkFxVmFRR1BaSmNISVZNZE1kanIrSE1OSzY1WVNKU01VaWJuYk90dUFu?=
 =?utf-8?B?RGNHdm1SdmV3OFcwYkhocC9ORy9vZUR4b0dsVVpnNUZhSDRVbEg3M2NTekph?=
 =?utf-8?B?S2dKU3FQWU5hSENHQmp4dVdMRGExK1NPMklMY3JQUVhXZy9qMVgyeHdrc3FS?=
 =?utf-8?B?bGhQem9HQnRUU2dxUkNsakh4RE01VmROdEozT2VqQk04Q3dVTVh5NHc0cEVz?=
 =?utf-8?B?UWg4L0o2cHhoSHhNcmdaWUFXby9XcjlEd0kyK1BneEtLd1YzbmJiUTNhc0Fa?=
 =?utf-8?B?Z293eDU4RWZsM3hMSUFmUGxVOHhRa3hqbWpXc0w3L01KRHQrcUFsYm84YjBz?=
 =?utf-8?B?MWlNZWU3RHZ6cnovai9EMDNWb3RBMStQcXZTcUdjUmJTNW1ySDVQenNRR09K?=
 =?utf-8?B?RkRKZ0dncU4vTXB4UExYUFI5VUdUMWF4R0prbVkrZEx6d1haYitjVzYzTjdZ?=
 =?utf-8?B?OHhZM1I3Z0I0NE5oRUd1M2M1V29JMS9penh1VWVHS3Rocjd4aVZ2Y3NKWitx?=
 =?utf-8?B?MlNZY2JwcE1rTGtjMG5zYXhueUJ3WXFncEtEdnNiQXYrZ2pVUWlmSXgvTzUw?=
 =?utf-8?B?aFdnYmRBWUNZdHZTWmpIUkEvYW9PaGxzNG4yTFBsNWVHcjRRNzdMMWxRNmRG?=
 =?utf-8?B?ZUhXd1N2N3BpQjhBV2lnMi84Rm50NW5XNFU5M0xqL1RNYnY4TmRmWVpUK0wy?=
 =?utf-8?B?MnZQMmFuSjFjd1REaThIaUFpTHBqRjFSZ3pqVFUvWDQyQVk1UCs3eXBmaGh0?=
 =?utf-8?B?S0dBQlVYTlludm56bERLazljenNTZkNPZ3M5ZC9FS3hnSkJhaGVvc0tMY0Vi?=
 =?utf-8?Q?52duJdrI0yGgyMCTAKos4+dy7c4S/s=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <05CCCAC28957B444B545179E0FF98F8E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9309
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	69e1c760-c883-434d-7aef-08dd88b1fd27
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|14060799003|1800799024|35042699022|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkhKS0NZM3YwaGlDSVNSc2IvSW1ET1dsSE9RZGs3S0RIYkttYVdmcDVRdnBG?=
 =?utf-8?B?aEt1cENScGFjOE84SWFuOHQ5THdwVXIrZll4dlRIKzZWODZOSjZnM2dGV1JU?=
 =?utf-8?B?RWs1Vkg2eFNDaE5KaC8zZzVyM0xQREoyTkZ1T3pYZGwrRlBFWnBjQmJhdTNi?=
 =?utf-8?B?Q2JNdWR6ajVhYjAwa050Mld3b0NweUZoUk91cE9zOW5aK3lpV0x2UjIwS3hl?=
 =?utf-8?B?cVpBTS9JTVVxVWFqZlhNeFczTG5Cell2QkRTQ3RySHl6VHBsQUhRNXByUjMw?=
 =?utf-8?B?bmhHbXNLZ1hYTjY3eVc0MVo1UlFVRU1RdmdaMDV1RUJHYUlaQldrcS9MQU9F?=
 =?utf-8?B?L2ZreVZlaDlEbFI1Vktxc2oxcmFsS1A2bVc5ck9oNGZQSjVWU2hiMUxobXh1?=
 =?utf-8?B?Smx2dXhUelZKZDhCVVNZZitDWmx4MnJ6WjBMR2MyVkZPd1ZyZGNWcnFQYjhm?=
 =?utf-8?B?TlRJNDBSeENqL0R5akJSSldMdnZYbVRLc0s5Z1c5aW9MVFNCN1pqeDkyU2Rl?=
 =?utf-8?B?bVBad01icUpzWjVGaWIzR2JUcllLSHhZdUloV3lHZ0tzMkU4aHVINHo3dHlU?=
 =?utf-8?B?bEp0eEE0ZTRMS0NBcE5sT3l4UXNBSWVJeVVXWUV5WUVhc0QxaTdzVUlya1pa?=
 =?utf-8?B?blhTc3BtSndYczVqZ3psRkMrU2xCRWttenVjcVdGcldaenVQNCsxTDJCTGM3?=
 =?utf-8?B?dnFUbm5wemtGRk5kdFRvYlJGZzVPb0FtS1pmQ2lVcW1iQ091ZHEybnlzN3du?=
 =?utf-8?B?WklOb0xkSExSTDdmTzRGT2VyWnNzbE1ZcFcvYUdWdko1MjdJYW5YRGxVVC91?=
 =?utf-8?B?ZTVEb2FVb3Y4cWUyYitwVEUyWUZHWVlpUjZLZ1NzaGJIZWRuREoycG1BVFVv?=
 =?utf-8?B?cytIWExKcXlxdngxVzR6K1BNV2xDUWxjaHpvK0I5M2JHMXcwL0NTTWlLcnlu?=
 =?utf-8?B?VTgydHBiZ0Y4elBKaWpvTmVDbW0wVFh3ZytBVW13UnZveG1tWHFkOGhGVFRI?=
 =?utf-8?B?SC93OThPODE3TmtSUENDNUhhWk5jN3c4WXpSRmlFU01DcnI0YlRHZERORUxP?=
 =?utf-8?B?L2M5eFBucUhCSEJVYXp4N0NrWnN2VkIwREI4K0VpY0hiTlVlbVJWU2lnSXYw?=
 =?utf-8?B?L1VVUUFzNjVnaUJZblRGSDFKZllnTldIWjBXdVpQT1FTS09RNmVnTWZWdjAy?=
 =?utf-8?B?ZWhDcWZTZHJvYmdQN1lLeG9xQ0k5QUZDWnMxOERaa3pRVnNQRFNSYzkxNHFt?=
 =?utf-8?B?RVo5eFpXemJRK24ra0J5dngzemlaVXdjalNWYVlTc1UwTHI4VWVmblRBRE8r?=
 =?utf-8?B?K0FRNTJtM0kwejBxMEpyL1NVcHgxRzlkREd5SmQyK2czbUFmZmYzUDhHOHBT?=
 =?utf-8?B?UkQwRmpvVXBpeEl0THZORUk5OWNqQWk5TnRMZnZ4czFLdFJ3aFVSbmRzalov?=
 =?utf-8?B?dEdVZStUaXBNcXFzVGlsbGNGSTBDWHdrQ2lxUGtpUGx3TFJWU2dwSS9sdDdL?=
 =?utf-8?B?SjV0UFFlNkR0cjNtTGJ1YnFqaENSa1V5WEx6bUNURFdaak1ubzZjN3lSYU5w?=
 =?utf-8?B?TlhFY3ZMYURXQkFQNklXWkp0eHkxNHZIS2diZURrbllQV0cwaks2UFZrcUN4?=
 =?utf-8?B?SE1SdGhoc0ZPdmRoVmU1MU9BcWpTNHh4U2haT3llSGRrSmRPUlAyU01RRUFu?=
 =?utf-8?B?NjNGNWhMOE05Uk9vYzZZLzNvbEllTkwxbWFucWNjckdLVmhPTUV4T2tlanBz?=
 =?utf-8?B?bzN6RUhnS0NkWWd3TXRTQSt4cG42aUJUR3JoNGJiRXpwYVBTdmpZM1hDQWVB?=
 =?utf-8?B?YnBhYURpTmRYak9sQUpHSFh5ZnhSK25RZUgvbVhEeUZQZXhVL0FPb3Q0eHE4?=
 =?utf-8?B?TjBJWVZDelZYRzcwL1dkd2JEeHhEOVgyOWlCR1RJWlVIbzhQdDBDQnlKbFRt?=
 =?utf-8?B?YitrSFJwQ2Z4OW56ZXhBZDJoT3ZwNEdzY0hFREhpZkxtb0EyM1ZJMTRzTEJH?=
 =?utf-8?B?QnBGdm5RalluOW9ocURhYWJ0TjVEUUFuZHdVbWk4eVY5dnIvUTZyOEF5WUZh?=
 =?utf-8?B?Y2M0dmFvbHJIeCsybEhNQk41Yy9qbkZERzh0UT09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(14060799003)(1800799024)(35042699022)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 13:14:12.1457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebd40ec-5421-4694-55ee-08dd88b210b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 13:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215770

T24gMSBNYXkgMjAyNSwgYXQgMDY6NDMsIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiAjIGxzZmQvb3B0aW9uLWluZXQgaGFzIHJhY2VzIGluIHRo
ZSB0ZXN0IHNjcmlwdDoNCj4gIyBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxp
bnV4L2lzc3Vlcy8yMzk5DQo+IC0uL3Rlc3RzL3J1bi5zaCAtLXVzZS1zeXN0ZW0tY29tbWFuZHMg
LS1wYXJzYWJsZSAtLXNob3ctZGlmZiAtLWV4Y2x1ZGU9bHNmZC9vcHRpb24taW5ldCB8IHNlZCAt
dSAnew0KPiArLi90ZXN0cy9ydW4uc2ggLS11c2Utc3lzdGVtLWNvbW1hbmRzIC0tcGFyc2FibGUg
LS1zaG93LWRpZmYgLS1leGNsdWRlPSdsc2ZkL29wdGlvbi1pbmV0IGxzZmQvbWtmZHMtYnBmLW1h
cCBsc2ZkL21rZmRzLWJwZi0NCg0KSeKAmWQgbGlrZSB0byBzZWUgYSBjb21tZW50IGluIHRoZSBy
ZWNpcGUgbGlrZSB0aGUgbHNmZCB0ZXN0cyBnaXZpbmcgc29tZSBjb250ZXh0IHRvIHRoZSBza2lw
cyB0byBhdm9pZCBoYXZpbmcgdG8gZGlnIGludG8gZ2l0IGhpc3RvcnksIGVzcGVjaWFsbHkgYXMg
dGhlIGludGVudGlvbiB0aGF0IHRoZXNlIGFyZSBiZWluZyBza2lwcGVkIHRlbXBvcmFyaWx5Lg0K
DQpGb3IgcmVmZXJlbmNlLCBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4
L3B1bGwvMzM0MyBpcyB0aGUgdXBzdHJlYW0gUFIgdG8gdXNlIEdDQyAxNSBpbiB0aGVpciBDSSB3
aGljaCBfcHJlc3VtYWJseV8gc2VlcyB0aGUgc2FtZSBwcm9ibGVtLg0KDQpSb3Nz

