Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD16C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 09:08:55 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.9])
 by mx.groups.io with SMTP id smtpd.web11.2880.1750237729732947957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 02:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=SNXaeQ2+;
 spf=pass (domain: cherry.de, ip: 40.107.159.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaCbUtqAWJCI+8caGmL78b7xjmD9FQp+otNe4so8+EDsHwCq8z26JLtuUSrHJDMe6ua9nsTiJczPsFDThSyOFMufL7V64tmigZr2sLw7kuvfeA3uFOF6HSf8i4IzvWBQLbWVQcSsDw2npwgFWoom55gVjKSOYwDFoKpO8V1su8D5SNHiLJwPcAkLLRPj0WuC4s+itCAGY/3/X3MMNIZyTHr46SN0rLFG7rV4fnx2jx6bMeMuvbGTTJi1oo1o3DB1IhMdhuugyq34xid5JV1bR8hRm2HmyvQ/2pjtr6TepaSgMJHUL4q7KXj2LaV325+3KRvt8bXeBmMKkSUDfTkisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPMHZSt34mL8LWnvHAwYD2WgiNmRg1Axb/G8rPtbLo0=;
 b=vuDEn6tQlPowEEuOCqUAd6k+FvKlqvzd/UuDD2XjyyqfDJ2qnSbfqI6FKkkzkQ5jlp12emkU5J7LbthM2eeWPsdZcA9T1D79PB7JJVO7AqXeDl2kwRDLxJ91BBFWANWJOZN2lAW+roKNf/VZ+mls4y66gN/Ez7TqKFAenwrkW4hCvLAeowXwMb1fBFZFtT149FNq/R/YE3b4HBwPpRwxVkvWVMoC3FWE/Wxmt5BxUFKG0IjlxdyWHVQZ1lMxBZIh/ZjWqQNezbTk0eLJqVNdY416pkIMYNRCCXgA0UyCTVX7icgL9fF2YDo1rpvEsi44SWlofJrAoN1QJ/i+hb4+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPMHZSt34mL8LWnvHAwYD2WgiNmRg1Axb/G8rPtbLo0=;
 b=SNXaeQ2+eOkCtUA/glz2+EB4cEy3k5ahTNkCo6anjBAH05aFeQWl3pXwPhawu6PNrRLNsT/7TNWONwE1mRyMmWaQRlWN5tKJ1u2tSjSYEOyD6B8qcTXRjzHveDVnUDd85gC0dE3BUZBcPjEtnL5ifEZ81iRBQP5AWjNb9DsUjBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10162.eurprd04.prod.outlook.com (2603:10a6:800:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 09:08:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 09:08:40 +0000
Message-ID: <13fbdf85-4909-42be-8cf7-9b1161a6020e@cherry.de>
Date: Wed, 18 Jun 2025 11:08:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oe-selftest: fitimage: fix new parser
 compatibility
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
References: <20250615191601.1261775-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250615191601.1261775-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10162:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd790c1-620c-455a-66d6-08ddae47b7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFdMbm1EajlnbXNRL0ZxVEY5TGJMcGV4Y3lxVnE0NldUQmtXdmRjaUdwU3RT?=
 =?utf-8?B?dFBpZzZkdkMwTTgrbFZia1YvcEYvOHFONWdGQy9HU1NPWU8xblozeVI2WWQ1?=
 =?utf-8?B?SDNmM1JMVGV2QjJORjNaNXU2djhDZXBXR2pjaHFIbUh4WWR5N29jOVVuMXlm?=
 =?utf-8?B?WlQ3TVM5eWdCaGFaY3pKWWFNVkluWTEzZnJjNFhjYW4rZ2FDcko4bWdad05n?=
 =?utf-8?B?M0VkWVlHWUxJRU9qZXdNakYwZlZubitUVlowelo2Mkxwa3UvSzRpNDIwV2d2?=
 =?utf-8?B?Rm1rL0d1RlFNUDRvRldlc1JkMzl5cVZ3STR0UFI5UWwrM1BSLzFyL2x2RGJu?=
 =?utf-8?B?MVJoRDFrZkIvOFh6alVPVkxtRlNlTHRPdVN1KzMrTklMRllzMTFjaU0rVlZl?=
 =?utf-8?B?ajZSKzh5Ri9mWWRjZzlYYzVsdlhWdWhZSVdHNTZUMVpKbWU0M3ZpY2tnc1VK?=
 =?utf-8?B?ZmhOYzExTE9YeHVIRk9NeTVFbFp6MDgxRndpR0RWTDMzQ3lsWEF1OG9wa0l4?=
 =?utf-8?B?R1RSMVl4MVFxSEQxVDE3aDlyc2FOV3FmUEFlSWpFZ0JFZzZNdG1KUWxzYUlY?=
 =?utf-8?B?elpjSnkrYzR6NEV0dG5KbGdMazFmV3RNajR0VGRCY2VnanNTa2YweDArVHlx?=
 =?utf-8?B?UFYyWDM3aTZ2WTNIQkFiZFBKWG80bStORGhUV21WWjFLZ2d1ait2dHpQRHYz?=
 =?utf-8?B?aTJ3cTgzQ0N2MGJtaFRpMVNtRkYyNkV4bHpSV2g5MFQ2Z2lQNXgvUGhjd1Z0?=
 =?utf-8?B?ZC9FYVFUTkpCRjV2N1VoelNpT0w3QUZZd1N5dDBiOFFlMERyN1pnS1dvM29Y?=
 =?utf-8?B?RVRmZDZPVjJZY2FwVUNFVTZOa0dYTHJyOEs5aGlHaGdNRi81emdzMXNHVHJH?=
 =?utf-8?B?eFZxWXVmNlFDaTMvUGd2UDdxSEtYOGthd0RBcEJ1d3dMRlhBd0ljdktuR3U0?=
 =?utf-8?B?U0ovelZMNFAxOEtlL05CUDR4TGRqUEo1bVBXQkVTenA2aEpQdWVVVHVvaWRz?=
 =?utf-8?B?MVFlNUt1ZzlSalREVDA3a1JzSjVoa0MrSzhITDY0YzRLUUJPNHVsYUxnZzJa?=
 =?utf-8?B?YjY0eVR5dE5PaGpPQ3Q3OURwaDkwK3VWRFJsd1J4MXJzZTkyQ2ZsZFd1bUdm?=
 =?utf-8?B?M01wdjhPSjZhNnJTVlh2OFEzaTJtdWp1RE5Yc1BGN09VOXR6cWUzZ2k5WWc3?=
 =?utf-8?B?dG1Hb0xWNWlpSlk2Z1BYak9mMExpWHRJUTdRZFBCeWV3QmZOb2NtSmhza0JM?=
 =?utf-8?B?c3lsQVVKNVg3ZzBzM1V3eWVJVEpLMWFKQ0FyRWNZdzFhbjhiZjlwQlpMSzdq?=
 =?utf-8?B?b2pqMXRHME9RckovRXJqMFlIUU9EMXBmVTkrdE82Z3ZVUjMwV0dGUW92a2p1?=
 =?utf-8?B?NlFRWmhmdlljVlJTM0VZaWtWZFpxbHkyeVFYRDJlY2huQ1N2cEdoUzB6YXZR?=
 =?utf-8?B?aDhWckl5U3FPSCtUTFROdW12TTRMRFZNMnRWanNkS1lRYkRZNERiaXhDUU9C?=
 =?utf-8?B?ZUxjd2VhaitWVnV3V1Qxejh6SUlpeTNGV0N6L3ZPLytXMDAvUFZlaGNobGxo?=
 =?utf-8?B?bHVNbE50bmJPWUFWVlc0ODExUzlWaEVXbkNlS2pRM0pFamRnMCtNajhCWHRG?=
 =?utf-8?B?WU9YQnZSSzMwOENiSDIzTmFkeUVVdzlXU1RPTDdjL3AxOXJmNklEQ2JTU25s?=
 =?utf-8?B?Z3l1NE9RLzNtNmNUMnNsc3Zmb1pObnBIUWJKWXF0RkVwdloxRmRkMWdLM1Jv?=
 =?utf-8?B?TnFyWWhBeGRTbS9vSUZxc3phR2JUa0UweFczUVZLb3hMWFRDMldUdDdYNTVx?=
 =?utf-8?B?ZDBkSGN5MUxTQkwwd0svM1VqMExGZFU3NU9QcXJMZDZhc2NCNjYrV0xseVNK?=
 =?utf-8?B?WkJRUi8vTzZTZU9UMGFzT0RwZDhNTXpEdmFRWTYrR1R4K3p4SE8vbjNiQ25m?=
 =?utf-8?Q?f/Fha4Ow924=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TVRtbG4yWmtDWHFTUDRXa21aUGljbXFlUFRMVGtHSzAvUzhJQXVvZ3A5eXRF?=
 =?utf-8?B?R1NrbXdoTWRNRklsYnhsT3NSeERvSnBDcTU5SVJJdFhGb1hmV01mMnpZdHU0?=
 =?utf-8?B?NEk3Mk9qWXRvakhOTENYcnRRcnZSZlNxcFl1dGtwNkZRM3gxSXc5dm9mUlFJ?=
 =?utf-8?B?WUpOVHB6cVlLdElxNUNJS1BQR2VpKzdham1OK3YyaUJnNlo1aDNoekxCRkZK?=
 =?utf-8?B?bk5wMU5UUExVczlRVlhMNW9IN0sxajVtSzdKN0dFZW1mMnZjdndvVDVpMUZY?=
 =?utf-8?B?L0ZqM0sxcHI1eDJUYXJKTG91aC9rN1hFc3RzWUZjZURIdkFMbklOWTNoQjFL?=
 =?utf-8?B?RENGaE52Q1FOZ050VnM5S0lydzFlVXl4Ti9KbHlVbmpYalJkLzV6VEdmRGR5?=
 =?utf-8?B?SzNwSFEyeVlXdUh5WjRDMzZlb2NCR3FocmZkMUdsVFA2SGJXdHR2cE1zMHVq?=
 =?utf-8?B?MW52SStKYUszNC81dlFhdEZYYnJmQnJHcUJPZmhpQ3M3V2xKUWVtb0VVcjZs?=
 =?utf-8?B?QWQxc1dmRlM1eVNDN3RCOEJvNEQ0enFoQnVKRWVJem9YTHBpRXp6a29aM3Yy?=
 =?utf-8?B?VTJMd2lXTTJSR2RIUnRDZnl4TzdFZGh4YzJJTE5qMUJIZHEvaTk0dnJKaCtS?=
 =?utf-8?B?SHNGSkRDTWFJMHd5WWlHME5ZVTlVTHpaKzdYWVNTTFF2L2dBVFp0Y1hWODlm?=
 =?utf-8?B?QWpDdjhqOXJ4Nlc2dEdXYmo5UzQ0QlVhbFc0QW9sUHJxNER0M3J3eE9HU3Jh?=
 =?utf-8?B?Nlp0bFVZMk1YZkw1dnhMeWZHT3ZnT0pVZ1JxWHZYcEU2K2lkMEhnL1JaYW1l?=
 =?utf-8?B?c0I3a3pncjF5SGFjaFhhakc5bTdkU0tpWkY5ME15VW1mdG1walFIRjhhTXM4?=
 =?utf-8?B?YjFnTjdvTUdySFlXN1Rickl3UkFKeHlpZllXSUdIWCtSVHcrV21WeVN5N0c3?=
 =?utf-8?B?a0QzQ0NScmd2Vm13UlFWcVJZa0dQeWtIMk9rNHkreTBudVN3QjRJWXU1WlZj?=
 =?utf-8?B?V2pnR2Mzak9IRlUvNUIxTUdYSnRxN2JXL1hCQUI5Nm9SdXJydC9GSEtTdmQy?=
 =?utf-8?B?ekczQk5OekpOckVQUWhGMncwdjVhOW5EclNrZEJuem5oS0xlaFpNektzU0Ey?=
 =?utf-8?B?ejdyUGpNK2hHcFBIdzJ5K01GMThQejY1NzZaM29mMFZYYnBVYkRtVmhKVHJt?=
 =?utf-8?B?NFFLOGJOdEZMaXlpTzJTWGtndCtJRTJhZTVlSzMwQkJGTmZQRjNqMzdkMGhI?=
 =?utf-8?B?NkgwL2R5ZmhnUkpuZHFCZ09LWjF5QVRqeFZvVCs5Y2d4KzRjNXdERmtoMDlw?=
 =?utf-8?B?SU1mcU5nVklyR1Riem1LVTVyRlByRnN6bEJJcHBkaWpZdGVjSmI3WUxDeThW?=
 =?utf-8?B?VUZha1o3bzhNc01qM1JMTnN6QnpkZFhwck5WbEh2cjVJUkVlTnEzelpBbFha?=
 =?utf-8?B?bnhCODU4R21WR3B3M2lqMzhpeGIzb3plNm9GRzZPTmF4U3JzWDlQZnl3T2Vv?=
 =?utf-8?B?Q1dVbk9PbEJrTDNYYjFRcVY0U2Z3Z29ZekVjYlhlclUzd1pMZjJpSHJiTW5Z?=
 =?utf-8?B?dGFoUXc5VG8yVUpkOUVURU1TNTFSQlA0VHBTMC93QVRxUTkyWVNjQzhBcEJR?=
 =?utf-8?B?SXBoeVdvbUNkRUdPdmJZREpJK2JBSDUzbW1WSXRZK0ZaMVAya2dCVFJTWHNm?=
 =?utf-8?B?RWtJN0hQTzFrdDVqbEQrZDFCRTRVT3pjY1NGVHhJSDhTR3hxdkkzMUEzbnRH?=
 =?utf-8?B?VEdBSVR1bFZ1TTkrRzFkcnVaWHYvcWFkaWZ5cVNjNDhOdHhxNHd0eWprS0tk?=
 =?utf-8?B?SXBhbWRaZHFKSTZTRldCV09JNWJhZGxiRmpHRFdyZSttSlZLdmw2eEdNR3ZH?=
 =?utf-8?B?cExLN0hnSmxNZFZIVmo0K2hCZG1wSUg0dDhmYzJoN1FUTytob2pEWW9BNmdL?=
 =?utf-8?B?MC9DQjFOZlprN1A1SFNlYWttNmpqOHprNlhjNytia0g4ZC9oREpEY3licnRt?=
 =?utf-8?B?VUVweDBDcXdRQ0xBNHNoT3EwN0x4aUM2anB1UHVmdWZHNXdacWk4NEdOTXgy?=
 =?utf-8?B?Q1lMUnEvK3hNY0xka1BUUHRNK3M2M2hQdGxVVVBzek9yZTVlVG9IdER2Sm5S?=
 =?utf-8?B?UFM1Snh1dGhra1RTbFBLYmF0TlNtbnRWNitVeWdQWWFjTUo0ejRmdnBlQ3hQ?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd790c1-620c-455a-66d6-08ddae47b7c4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:08:40.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGooZDxKExnG54ehx0y50TsQhBiEcWXd+qruBiiEt8nF5sQDqlEMSc6yUL4p3+n11JEhuaoiPHXwnFN8vYMz8Nn1D73AZJGvqQEseSaZeHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 09:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218984

Hi Adrian,

On 6/15/25 9:16 PM, Adrian Freihofer via lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> Recent parser changes throw a warning if there is no space around the
> = operator.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

