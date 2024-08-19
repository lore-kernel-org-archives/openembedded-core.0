Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52DAC52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 18:30:03 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.123])
 by mx.groups.io with SMTP id smtpd.web11.233.1724092195696379996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 11:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=pFi7Kg83;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.105.123, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksxI2TVhN2AH+6bSCIMNhGh9/mze2PgrLvYqPBDI5Ayi6rlWLeI5WuEwywxVvse2p1NiNDIUuOxTOSvJrRGWQ9CsUWyg97k3zadxsbc37Y/UvQS/q8RM4CXmEWREZWvXC4WZ4S9JqXHrqhGiITKAeHoQ9KB4Y1BYKKPlKR11OvH7QgAI+IXFC5eAMvwgaDFXMJCJ0o3v08yz1j8YwkOVGcYPX3K6KHRvtRmi594Ez7iub9YS1e/tuxeTQTb4OiwArBtbHnlbu2P939BqWf9VfwxbY1gbTlVHxRo6jTMH8FDpJAnHhVBcxoCOF8XHzmSdLaS6X8SVMo18+gHEMjBo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwX5Jv+NKMUdjpHs+XYUL2fBXCgWJuNLG9UnAgqrDxo=;
 b=BA/arJ3D6JSftY7dkrI/O0vBa4pOPqVvlSbwWGnY21DqbtnvqvrOzh43ncebFXKGXi1VJ3Rm1xstPE5MDEKHpUExC+INhuZFswVOHLB34uwOPGnZ2Xnx9HmCO0/ZbPq1c1uCjxMZNnnMuZmHrcy4cbXMdxLdIlQ+pkHnkxlFxlB9Qw3to+773qXV4ufDPP8gKT4fr7ZSvg4IWuLFdy0+Mg+Ogk4dK92fDwXGKgPoCamS3DXW4hTxM0VCnxCkAPh2kljKyeq2qkj2Z1UfNsVsMSw+l+pQTvF+0oTupksgtQa5YGwXeZfi0v8RPB9S7AVPTmQx94YwGc30LjnYgx9hKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwX5Jv+NKMUdjpHs+XYUL2fBXCgWJuNLG9UnAgqrDxo=;
 b=pFi7Kg83yPRcKauq/bRpLC4FqTp/orj1Fegtk7CFsQWJU7uw8bxvGqwoq+5+GJFmadJifkahbVtmUVrH6sju3x/lDGT9fpeD0bP4Arc35qalu1OiqriGf2Rp09hxOIep/SxF2zIAJuHojhMGz3WbIh0+hN+CojuZRrJ87u2xNmFcbxfxCWdTfMxGby2mQY97kH3oZt/A3mX6qrS+7NlxVd5GErok99xAILpPu8JxL1Ymzc+cEgZ2g+lHr0pL+jjSnoVFU3AwqjB2KOsKxTWjubd6gtWuDUkA9NBunffGEyBPjMb8E556PWiLGbBtSqvbgL5Itp+xIOZLZeOKRsqzSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9440.eurprd06.prod.outlook.com (2603:10a6:150:1ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 18:29:52 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 18:29:52 +0000
Message-ID: <c5352955-0ec1-454a-9bc2-2005f82afb95@vaisala.com>
Date: Mon, 19 Aug 2024 21:29:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240819101025.2254095-1-niko.mauno@vaisala.com>
 <DB5PR02MB102139C44977126DE9EC17914EF8C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <DB5PR02MB102139C44977126DE9EC17914EF8C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::13) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: e961ce0a-db23-4aca-f0a6-08dcc07cead1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWFac1YzWmVvaXFPRndxdEIwc0VWclFDV291OTM4eE4yc2duK2xoY2tHekYz?=
 =?utf-8?B?cWQzclJ3SG1LVEhPaEQ2ZUx0empvVnFBQWxoR1hiU2xpcWJQNmtwb2pVL3hm?=
 =?utf-8?B?aFphQ0NodHAwa3psNXpNdm1NbVZEZVUvWUtaaG1MeGFCSDZqaVdXOGcyVFF6?=
 =?utf-8?B?U1FaR0ZMWExpTWlUZFc0dDdsK1plY29hTzJnSzRHY2FlM3o4QUtlMVg0bjg1?=
 =?utf-8?B?b1RtTUNkcVl6S0pyZFpWTmQwZk5XS1VKbVJ5b2lEWWdPeDU3UE9TTlVrSW5z?=
 =?utf-8?B?V1cxZzRlbllxNm9UOVczZ3luRXVnWlNheUhEbVJmdHVHNzJoc3Z4OHd5OHBF?=
 =?utf-8?B?R1dWakd5Y2tvdFlCbTRvU2s5K1lqSFV1eXVBdDF0bERHaGFzWkhkb1o5WHNV?=
 =?utf-8?B?c0pHWjlROU5Cb0U0MllKY3gxR25jVkk5c3dhaUZSZ3BUYTVlTVRTSDJWNzdz?=
 =?utf-8?B?YzBlTkM0aE1KblMrbS9Gc1U5VXNxNUtwNU12SDgrRThFRDVqL01KSWoxR0V5?=
 =?utf-8?B?dGRYVkViemptdmpxOUFxYTRMUHd4bDMrMGg4clVOMGliRDY0eGJTeTFFZDFE?=
 =?utf-8?B?WjhGWG13eHkvVWFqQ0RWK050Y0sydTlnTzhNaHRyM3VveFRFM3lYT3lhVG00?=
 =?utf-8?B?b1lZMGNJLy9ZWW1VaThyMjJSSTRGYk9uNlU4Q0M5d3RkTWxUSEhHeUVsZWpL?=
 =?utf-8?B?MXF3L3lsU3pZWUdnVVFwKzdCRlZnaGoyWWpYVWNSNVQzR2pMSy9hTXVZQTU2?=
 =?utf-8?B?Q2NxVlR4SlVZOWxtdU50U2pIem9sU1FBOWQyMXNJUnl1a0s4N1NmU016ZTdi?=
 =?utf-8?B?dStvejViVy9Tdm1Cd0ZFbXNvWUllbEJCY3F2Y1NFYVpXREhxblpUVlVqdFUx?=
 =?utf-8?B?V2Y2WDFLcmxSRFQ1dWZtZ2RLRWg1Q3p1NEphUHBLZnhmeWpuSHkydE5FY2ww?=
 =?utf-8?B?ZjVYWk1EWThLS096R2pONDBqb3oyOXZlMXlVOXJQcDhzUGJ3VjdNUWZFVnVa?=
 =?utf-8?B?Q3ZJZVZTMlBwVXV5Wm9QUkNQREh5dlFmY2NKMld4SUZiMGNmVktrRGRQSDc4?=
 =?utf-8?B?MnpteU1ka292eHNmQ0YrYTNhK3krMlhZeCtPS1BoTGFwY0NpSXZyVWVDbGg5?=
 =?utf-8?B?U21sTTFxeXBhcmRiZFZZTXZqVzVPK2ZhZWhBVHBRa2QyMHRGeUM5aHF5Q3Y3?=
 =?utf-8?B?VjJZa1AvbGxCTzBjZHpORFdpZTBCQks4ZnNvRFdXc1AyTGUrWmxQUTJTQVor?=
 =?utf-8?B?WEw2Q01sR1crOFp4bHpTZWxuV3VydXd1L0l2Q0hDTVhORmZFbFZwRGNFalQx?=
 =?utf-8?B?WHd3MkszblJYSmJmTlBPU0ZaUTZtbHRlNVAyWkJrUkY5S3JlUWxpM2o4MzJB?=
 =?utf-8?B?Wkt2WUV3RUJkWXNTSndkaXVwRjJOWXBQTlIxWnpubGVVeEU2NlRIajk5bURL?=
 =?utf-8?B?QjFEUFZmRUJFbVI3VXp6c2twanNBbFdPOWFDd0FsZENGdU5jUmpKM3htVUhs?=
 =?utf-8?B?aHV1NnRDNlg3V1BtTDZOMUhnbFlEWGlWbVpwZUxKbEF4RTgwRU8yY3RZaG1t?=
 =?utf-8?B?b0ErM0tETWIxYTFyZnpYaHI0U1I3Wkc1OEk4MWJIcTlUcjJvVjVFWEpka3cw?=
 =?utf-8?B?ckFrYzYrUm5temE2U1VtVnlzdUdqODQ0cmRVYUNxeFpiZnNNRWJZaVV6blJV?=
 =?utf-8?B?L2dGR015M2MxN01KeTIzNkhTZHFKTnlaTFhaYlBqVk54WlVyd0xzOEgxcFFz?=
 =?utf-8?B?Nlg4T0VzZWVhcWsxcTIzZFJqK212eUhDbHBreTNGNDEwOG9CRHFYbFRSZHQx?=
 =?utf-8?B?akdNMHR5MDcxcXFDRGVjZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clNrcWhIVHEvYXFJS0VIQUtPZW9STUNWKzBUS2hqcVFLUkVNNEpVMzcyNGNS?=
 =?utf-8?B?MjE0MDR2K2lWQ2xBejVIMmFvWUNLMTd3UVoyRFlUYm1WOUcwaVB2cU1rOUs0?=
 =?utf-8?B?b3FDQ3lnTkNGZlZ4SXdJRlRkaXBzTS9yVWQzWC9HbDhKN1kzdHBlSExWUWVk?=
 =?utf-8?B?UEk4L2wwaEhPTkZmSGlzZEFsYjFKSlJmenhtaHZaY1lwTFplakE4SkhqaGsy?=
 =?utf-8?B?VmJVMTI4MHZ6ZzkwbTNJMDBwNkZaMHBXVjU5bFpkNmNVVEJqQjl6SVZ0M2lw?=
 =?utf-8?B?TmVSb0NNdUJndS9PWGw5UThYYXFHMEEwT3lMdUZiRWIvVkUyekVuYWowUXhI?=
 =?utf-8?B?ZHNCdEp5UGEwQXluRG1yd0M0RjM5VmkzVEF5MWI1QVY0blFMQlVFRmV1eW1F?=
 =?utf-8?B?UzVUWVJwamUrYVBZKzltcEZZTlBvUUVqT3ZtSCswVzEzUHh1UDNVMUxtV2hT?=
 =?utf-8?B?UnN5d0E4TU5TblpqaGFuWlY5YVhheHpiK09HSTllMEFnTnlQUUdkbmV2aDI0?=
 =?utf-8?B?UFhVbGJjLzFYNWdOb05zZnlqR09EdTVVanpwakNCNzd3c0h1NjVUZWUwWWxr?=
 =?utf-8?B?TmVrWldrTURCdldBeEZ1OWEwcThFbGFxdURldXhuTnBCQklPYXNITTJEL3hv?=
 =?utf-8?B?WkY3dGFkV0N0Nkg0WEoxVmlyZmFSSEQxQ3g4ZzV6ZWxTSS9ZdVNpYzVOcHdu?=
 =?utf-8?B?OUtSSWtkdS9iUTZGUFFLRXBONEY2Y3NLM2psV1RLUTRNcDJCS0NMVXhKeC9E?=
 =?utf-8?B?ZGZRZnZ6dzkxTzdqNVpHWWROdUl3MEFvTFEwSCtHaU9peVU4eGVQVkZiVDFt?=
 =?utf-8?B?RlVydlcxeStnbXUrcEhZOStsTElDNWQzdWppZXJzVWVrc1owYU9VQXdrRDNz?=
 =?utf-8?B?WU5zRm9SSGhGMTJOamZUVkF3cW1GeldUR0NEbUN6VEdBL09BRzZCMVRGdXhz?=
 =?utf-8?B?RmFZNXpqTEhGeGw4QmQxaVh0UkFocDI0SlFscGlHazJHVDl1RVgrWFZjR2xo?=
 =?utf-8?B?WFpMblR5UDVRODZOd2VMdU5hVTV4YXhwYjdKNTVGTjFRL0VuY0l0NlRHM3V5?=
 =?utf-8?B?WnVvMEtjZVFMdnF5QlBGbHFpVDJ4VkpGMXFGWWt1TmcrTm9UQm43ZEJ3VzdF?=
 =?utf-8?B?VkFGSXBUY0llYitPNnVZWUczTnYydkN6U0tiSjdyYmxzS1FUUkhidkRMeDVl?=
 =?utf-8?B?ckxRVFMxdFJZWGxjQ3pLamNzYjJ2QTJRWTgxRTJSN1hGUzI0aEV3djNycUpq?=
 =?utf-8?B?N1JnQmJXaTNvWnc5bFpkYkxyOWN1cGl0Sk1ZRlhRcEZLTytyZUtYOWhhTVpF?=
 =?utf-8?B?eEpWSjFtdnVEV1pMOUgzY0hrQVIyWmt0ai9vb0FiODdmYk9ScXl5T084QVgw?=
 =?utf-8?B?MkpvbEExZTYvNnI4ZVBGQmdoTlNYZUhjV0ppdnBGenRueDEyUnZiTWdYTkF0?=
 =?utf-8?B?YkZMVUcyRWhSeHlsVFdxM2JGNlU2TzhiZVVVVW5tVTkxOHNQTzJLdTNwdlVy?=
 =?utf-8?B?N3hkTmdWa2ZLRHlJN0MvdkpmWHNrM0tnaXk2UXkvNzVoR2dRYzZ6djV0VGZs?=
 =?utf-8?B?L1JIUHlZczBHd1RtOEF2aXNOQ01PaGtwbDNyY3N6WE9oNVY3d0xXTmgzODJE?=
 =?utf-8?B?bkFVcmVuTlZKYmNkdkJZSjRobTk5NVRmTisrZW16SDJIY1A2dDdQRDZES01U?=
 =?utf-8?B?SnVQek13d3VxWUVnZXRmaS84SVJmR3N5aUJ3c3B4YXNsY1JqODZjZllEN0NI?=
 =?utf-8?B?UVBTbzBzSWkvMVF5cTYwN1cydTE5RzZ2ODBRVDBWMEpkTGRCNXJjVU55S3Fw?=
 =?utf-8?B?a1JlTVZjclFtRmR2d1JZcVA4VUw5bk4yZVBtU0Y5QmFiaFpubGFjQTh2QTBM?=
 =?utf-8?B?TjA1UW9aNjAzY2dUVDlnUitlRGV3eE5IWFVCVGR3d2oxMzNiQW1JRVZVRkVM?=
 =?utf-8?B?aGpzNlZxdUZZaWU4aWJQeW5WNitlTzZad0ZzT2NvdWErc2pCcGhiVjJYWW91?=
 =?utf-8?B?UG5OZUUvZjl4WVhGaWxPQmxqQ1FvVEFZM1pUVmpIeXd1Z2gzc0VNTURsVzJN?=
 =?utf-8?B?V1kyYlVFWDdDcXBkMFJkMUt1TU5KN0FZUUJJL3NDT3pLYlNvYzBWZGtCOTVT?=
 =?utf-8?Q?J8r61JAGGTRX7Z7x1EL+4atfC?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e961ce0a-db23-4aca-f0a6-08dcc07cead1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 18:29:52.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McM0H2CZg1z6Scdj/c1xv6vevNsSmoR53WSEIryzq0a1JEa05mYz5ApXj0+T3cleHwe6EBB/vFnjP2/AS5pQVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9440
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 18:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203519



On 8/19/24 18:23, Peter Kjellerstedt wrote:
> Please avoid negative PACKAGECONFIGs. Instead use:
> 
> PACKAGECONFIG[new-mount-api] = "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"
> 
> and add "new-mount-api" to the default for PACKAGECONFIG.
> 
> Also, how long will the "new" in "new-mount-api" be valid, i.e., what
> happens when the next mount API comes along? It might be better to match
> the feature name to the configuration option, e.g.:
> 
> PACKAGECONFIG[libmount-mountfd-support] = "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"

Thanks, updated accordingly to latter in v5.-Niko

