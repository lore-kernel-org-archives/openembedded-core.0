Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58263C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 15:04:08 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.26])
 by mx.groups.io with SMTP id smtpd.web11.16105.1751036644948987333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 08:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ft+NrBy5;
 spf=pass (domain: cherry.de, ip: 40.107.159.26, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZH2G82FFkdfsgnbLQcyB6IipmcURTW+ZJadCvRZk3hTJET8/vLew4mNoXtIB9nSJYfxRCRPlIRBTIippvpf2P7B4nqFNSSvsD3FzS+vjoxi3dRvr8hgb0jH8MwTFMIWO6ZzZwE6DgGCCB1jE2O3NOXNYCadjyhbeig2d/qUJu23/6mNBvNEg4orVl96n4MHcI4oeVTf6ZTAUycXsZzRld5d/d5aGgBVr8zyMj8I+2cBPFzATDLWS2ksq/q8a6AVnoYalXTE574kllgE18O295TSgzgW3REcyzCrlXbHWQsj5xl+DgrI5PJOVtpaCt/Z/vvbtgiCkVAumejFzyVKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAMnBpnaPk/QRh+qVmGzuRe50OVVl+3Bm5WWZlC8hQs=;
 b=DoRfDKJcyrnnEyog2aGzyboyXeGCtzXlMJa8urhtVmaitwg2lYM/t4lsIr1JAPgpNG+14XezYPqJqqpOfRXsWfmyLb0F8SUcR27ULYGf+kFM5VvrGritpSgH3X4YSsspDxAjxqj8OmuMiEWh2zvOkDTF1gy0K2tU+b0xmwp7PNy/4XcJNS+gXwLeNlNqbQKr+zm+aPKSdP2ZbhVeLbkso7KsRiWSvp4RKD+q15uUmnGkIboKWhEXv7bxQ64J2U92u6Nm350LcqgCzuT5aLAbYXNSbN6h3Wjp01HNNIL0+Cju1wsOIgTPyu+BZm2WPgx942xvAe1XIJ2d3y/qe91TMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAMnBpnaPk/QRh+qVmGzuRe50OVVl+3Bm5WWZlC8hQs=;
 b=Ft+NrBy5V5w61+Huyd+1J0Ne6uJX/hVizN7wT/tHCqpcSBcLDMuUqV4MDqImeygvAxi1mTgyrKoN2w8j0esYE4NVVom8CujxC08qqCFRlUMyIx41fhCTVknvSybFTlO9elqXDkYFPga9Y7M4MkAGXiFSr6LxPpQsQPwLMSM9430=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV2PR04MB11096.eurprd04.prod.outlook.com (2603:10a6:150:27b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 15:03:51 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 15:03:51 +0000
Message-ID: <d745a8e4-884d-4c70-ba74-d282c62a9d40@cherry.de>
Date: Fri, 27 Jun 2025 17:03:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] libcomps: Backport patch to support builds
 with CMake 4+
To: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
References: <20250627120633.4084140-1-Moritz.Haase@bmw.de>
 <20250627120633.4084140-4-Moritz.Haase@bmw.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250627120633.4084140-4-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV2PR04MB11096:EE_
X-MS-Office365-Filtering-Correlation-Id: 02be117f-3df9-4be1-c7a9-08ddb58bd2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0sreVFEU2RDYlhDN0pwQ3NJeS9rUWh3Vzk3SE9WSGZEUmFCWGlnL0lpM2pI?=
 =?utf-8?B?VFU1eWtaL29LTDAvcWExZjFoR3pvMHQ4NjVpZnZ6SmlSZDNqS2ptb2pBV1NM?=
 =?utf-8?B?TW1jSU1hNERDbEhVSFpDMkNXdUZEMWtLTUxvaFhuSVpOMUdKSHk3WVpOaE0y?=
 =?utf-8?B?TTdnUGRHa1ZuR0FiYzZ2TWU1R0JBa0RRU1NtS3RXNmlSWFFzcFMrOVMwUC9n?=
 =?utf-8?B?OEU1VklHb21kZllPeU5HSzhFbzVxNXk3MTR3RUhZeTIweE1PYjl3c2RLaitS?=
 =?utf-8?B?MkpSdmlpV0ZvR1M4cCtPelpObTc0MHFKbDZxbGtCNmlDbi90c3YwOEc2TGRN?=
 =?utf-8?B?UmJpTFdWNHllVHVLYlZoVFlPRXRqL2I2TEVmSTcybkRsam5iVzhLd29mdlh3?=
 =?utf-8?B?ODB1ZGg1ZmtrQVNJOFp3cTVVZDB0aXUzSVp0cmJDSWRTWkFPLzNLaGpuWXM1?=
 =?utf-8?B?MGlRdWZiUmw2ZXVHR2RkZTRkTFhybnVTNVNiZEhsRjFGZk9Sa1RIUUVPZGZz?=
 =?utf-8?B?UnBRS0tTYmFJWHJkVDBxMnQyUHBPaXlHV0UwTzVPR3g5WCtYUVExWGZCNHU3?=
 =?utf-8?B?d1pQcXB1Q0Y3VWtXNTJPYUZzcnNGa3hIV3hKRG11S1hUSUdIcTU3MlAydndE?=
 =?utf-8?B?aGkwa0tJUVYwOTU3YnRZeEJPcmkyT0JnQTFWWG8veGpXSk9JSUJUSENGSWJo?=
 =?utf-8?B?bS96VitHTVpjR3AySFMxaHp1SFlGRlEwSlNRaDlnemI3SG1FUlpjUjhpbUdx?=
 =?utf-8?B?Zm91VTBXUmZ5MHc0TkZ0L2I3eFpDK1dEZzh3SGtERDU1b3NrVmlOUUtzN29y?=
 =?utf-8?B?RXBxNGxHNVpHK3FuN3gwU3luT1dWSmNGYVZtenFoTnJBRVZoU3dHYU54Z3R6?=
 =?utf-8?B?NG1EZ0JDaXFtSDkzeG0zWWFXTmFuaWxEV052VFNLL0dpb0NER0lvWVQwdjR3?=
 =?utf-8?B?ZGdlV29DcThvaDlVVTE2UHNjRm1VUU9VcldnWFVFd0t2Rnk4ZlNiV1hRK3Q1?=
 =?utf-8?B?ek1VdHBwazZ3Yy94bnhzNDlpQ3JPYUF1STJrZ2tySUZoK29ycGgrMUlDc1R5?=
 =?utf-8?B?QS9PamYrdjJKc3NPUGZFRk9yV25FU3psNFZyaWZBSVhHdmxpSmttK0R2Njh2?=
 =?utf-8?B?Rmw0M29iUzBGTHBVNUgwQVJOWG9XTUNOcDFYZFNzdXNiVGVWZGdTaUt3R09T?=
 =?utf-8?B?OXZ0bVhtQ3llUUJwNVlZakk0ZFI4ald5K1N0Z2k2UjhtczR5cjVLa29INEN2?=
 =?utf-8?B?c2RUSHMzV21TN2xxdzZ0OXJneUt3VW5jZWFnYTlOdUFxc3hpY2NJaGtickdt?=
 =?utf-8?B?TVp6Y3AwTlYxRzJIbXNuK1pMNXpRdkY0U1ErcWJxRkV2SWR4dURaMEM4SzZn?=
 =?utf-8?B?RlJsaFFFRDcwS2pKYUhRcW9ZNFQzKzZnSGdJS0hMQkRNeHY5a1NwTk5tK3ZE?=
 =?utf-8?B?UUV6OWZneitoTDZJZ0V1Q1ZmOVFKd3FXZGNYRis0bkxpRStrc3hGUTRBRjZr?=
 =?utf-8?B?SGZ2d25GTEZhTFVjb01mMzNZNkgwMnhmN0lnVVJMbVdzZTFBcXhtUFVmbW9O?=
 =?utf-8?B?YzBZNFltZ3ZvZjgwWi9zcjZMdkkycHVyelhOQW9ibXczNHNGL0tPTVRwNUFt?=
 =?utf-8?B?TXZzNHBKSWw2aUdhbS92aGZONGJNSjV4M3hJQndaYWs1NUVLRnBrallJcHRX?=
 =?utf-8?B?NTRvKy8wWVVoOXZBOFNIYUpRQlk5b2xoako1QzU3WGpNNlRLc3c4T2V0N0lP?=
 =?utf-8?B?cmJncVdJRGplRy9jWVUwZEovdklXNGYvR1ZTcDcxMEdLUTJJZU41bDRzeUVS?=
 =?utf-8?B?U0M0YXZqN3YzTVVkTnhvb20zSW5WRWhqa09yWVJmVGZLME1tNjRDVTN0SzF0?=
 =?utf-8?B?SnUzMTFHR1pmMHNqbU1aOWV4Y0VEeXF5aXhmd2NsTlJCV09Way9UYktoY1RU?=
 =?utf-8?Q?yfkxqOglxhY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUFGTnR6YStXZUttZnYrWXUyQnFxQjVRYlBJRDRkZHpxWXJ3L2hHektSdmEy?=
 =?utf-8?B?WnN5S0x2c1JJbVNaUGRPd1pQYmo1S2lQK25kNWwxaUVBbW5Hc2RPaFdzWnhu?=
 =?utf-8?B?SFkvMnljNUVmTHV2MzFHSXo1dTZWL0xEUTVYSmdLci9nN0RIaStLWGZJUGll?=
 =?utf-8?B?bHk1dk5abVRWbTkrb2pacjZRZHlZeGEwOTZ0c2YrNTdra1A0MUhQQkMwYlFI?=
 =?utf-8?B?eUpXZDJyb2xnMSs0K3JFTk9haXBNZEE1Ykd1WFRGNVl2Z1VPMzFkSktCTDkr?=
 =?utf-8?B?dmpEOWQ4U1RxdnduNm9RYWYrQXpkYXhsSUw0aHhjRG1sMFFhbndTSE1lWDB1?=
 =?utf-8?B?K0VaTGF0Z0ppNWRFbTU5citHZDNvMGErUXZ3WDFoK0VrT3E3SElZUDMwbWVo?=
 =?utf-8?B?RFFnSk9HM2FtZkhTMVJkMEI1MU40VWEvdzB2OGZWZm5nOFZMRXB0YkRyWGZV?=
 =?utf-8?B?UkJuZ2pqN1NNb2tLSGFMNGZNMTNyKy94dHduZ0tBSFJmLzZ6Sm5vTjRITE84?=
 =?utf-8?B?Qmk5a2FyN2xPRTJIdkpRQmVVQ2RTeVp0RVhmUENwdDU2VklVMStiOUZ5dVRz?=
 =?utf-8?B?K1FEUVRaN0MrMEhibHZ1ZWFVbkdRaE5LS0dSY0xTK1huTlFoa0o5WUJPOVl2?=
 =?utf-8?B?VUdPUWtzbTEvandjQk9HdTlLcGtNUUFwSHhWR3dHWG9qNXViS0tPNFJmSVYw?=
 =?utf-8?B?eUtMSWpNODN5dVhZRWNKMnRjc3UxVUlMR1I3NEVZNU9HcVFRSVRBS0dzamJX?=
 =?utf-8?B?MHNoTGRtQzU0Ni85Q1pjVlpaUC9IV09JaVpmTms0UWZTY2xFaG1BOWY2eWY3?=
 =?utf-8?B?SENCb3hjVVlpYm93YnVJQUxPT3NBRmVuYzlTZ1VzckxtS2pBbmJCalcrTzho?=
 =?utf-8?B?eVBTWldJV0N1bmR5dWVrbzhrRHdGbk5JWjlxUm1JeGhZSlgrRlRGQ0NrNFIr?=
 =?utf-8?B?S2xSRWkrQ2x4SHJNYTZ6TEQ4cjJHS2VaOGdVREtyNk5KYVlOdEY2bkdOU1M1?=
 =?utf-8?B?U0V0QkxRMk5vdWtOZklEbHRBV0VaeEduWUZSeEQxZ3dDR0ZEVGlWM09jbXJF?=
 =?utf-8?B?ZUtOZEVwMTZZc1pyQkMrRmM0OVNnVmEyUHJsVlhWODVwYmdublkrd2RXQy9J?=
 =?utf-8?B?VS9SbXJPZ0dzaHAxbENKRDlvMmZiYmx5OUZYdElMUDk2QWlDVnBFeVVSc2w3?=
 =?utf-8?B?ekRPODE3NTFjYUpORkp1dmk3bFpZOXJld3NrZmhIYWpoY3htV0gxTm54OWVN?=
 =?utf-8?B?YnZmNzdjMUJMTU1vL2t3WDVZUnVlTnZtMmlFWHNsd09UNGtxUlEzTVlVUFdy?=
 =?utf-8?B?ZTNqbnd5dDFGOHVTK3lrbXI3OFE3WW9GOUp2aDcvalBSZkw1Z2hTMjVBd09X?=
 =?utf-8?B?Q0RIeTNJNkVha1RXUVp1STZOYXJOb0t0Z0l3MG9sc2psSzZxQnhoeUpFT0d1?=
 =?utf-8?B?SVFwQU9UakcyMGpmUnVuTUZ0ay84NUYyRTAxK0NURm5Sd0NOUkN0MjBpSFZ0?=
 =?utf-8?B?WUY4OGFFczA1NUxadkwzS2FweFZEZ1I3eW45N0R6dk9Ndi9PcjJqQnEwV1Fx?=
 =?utf-8?B?RGMzZXNEVU83U1VmeFBONGdDM3pkU1M3U2N4RXBLYzBuRlUzN3dDVEswNE03?=
 =?utf-8?B?bFdrZFNsZlJWbHBJVU1kbWFBTUcvWEFTQ2R6cnR3N08rRW5UeStZdFZndTkw?=
 =?utf-8?B?Q2VTQk92YU00Sm8rcEkyY0xaMk1UVVJxaGt4UitaQmRVUnZpKzlTdkYxNUov?=
 =?utf-8?B?N0FlTDBoajJoNlovNTZoSlQxd051K1d5TUdOcmprMWJ5OXVtOTZKUGZrc0NO?=
 =?utf-8?B?UDNid1dsM09SK3V6M3d2S0pHVDdSWjQ3WWE4a1BkZ0l4WlNZOWxiR1RTVnAr?=
 =?utf-8?B?NWVSUkFmdlgwWTZ5bk9mNllyZUxTejNUdElCSW0rdWJzWFRBQTJmZlRBM1dC?=
 =?utf-8?B?a1V4M2Y4Vy95UklkSlhkUUxUbnBZS3NoT0U2S1pLM3l5dThMR0FhWkU4cTFU?=
 =?utf-8?B?OEdXcjVvMzYrZUJaWm9lYXBINFJVZUFIbjJZZHVJVndUMTFpZ2djNk1HT1Bj?=
 =?utf-8?B?QUpaOTFDQnpSTXBlWHVtRjN4aktiZzhvbUJBVm9VZlE0Z3JMVWlVd1FFL1FD?=
 =?utf-8?B?QUZFZzRUWW05R3VFdXNLMXF6N0R1MHExalRrd3JaaXlnMkpCbEhkT0NGT1ZH?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 02be117f-3df9-4be1-c7a9-08ddb58bd2c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 15:03:51.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cD/GwwfAsSZVg6QoaTQYGMv14qoHeEesfOpsExkq2QTuu+86IYgyhFEKgksenDhKosYAeHkCfoRjgVatADdkSJI1w1gm5oslpF6kozqi3qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 15:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219425

Hi Moritz,

For this patch and the next one, I believe we should be able to put them 
in git history BEFORE the cmake update to 4.0?

My understanding from reading the patch logs is that CMake 4 won't build 
if advertised minimum Cmake version for a project is below 3.5?

Considering we are at Cmake 3.31.x already, porting this patch first 
shouldn't change anything in current behavior?

Otherwise, the issue is that we update Cmake to 4.0 in commit A but 
break libcomps (and createrepo-c) until commit A+1. Reordering the 
commits should allow to keep bisectability intact?

What do you think?

Cheers,
Quentin

