Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAA0C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 19:41:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4793.1750275659028811134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 12:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8264c2ae8d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5Z9Gk015052
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 19:40:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790284ypw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 19:40:57 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55IJevXI017616;
	Wed, 18 Jun 2025 19:40:57 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4790284ypv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 19:40:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAk3BvDkOGjN1pOQAcxCS99vKc3dRhwo23DfB0EW7IXKDE5m3hCX/wNAET0begCn/jNwra0ip75y+exnGewUuJAl/I7TwOV1qSNaLifb7f3MoAct9NZ/3UTuePJbwg6hzQM3DF6tkfDqM92TZ0EWJ+GCytgfvYS4jaLUZUor2+mZB0GLrYUGfocs6hdgsXy3PFXlVAWc4wHojNg1f+mKmaOK817pliK0ZBCZe1yn57ax8HQ2kfp/jaFALDj86dD3x0FWDRQPhwm/HlQtA2fm7ysM6TnQNPLxx9ajSjnjTo6P2NCzi9cnFglQk4q9sQMeRT4OVdyT+0thjHfT2w4JNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSbVD+gRkpIRnmIi2aOugXXCu6JSImVjFUrfBpRtDks=;
 b=WEfdMorZPpDJTtn98VwTAo9bBBFJbR6a7zuxiRLiEniNcxui+T0Lk9FyU+9Ay/jjylKk3C9G55L767vHKFMzAuMIp93+LOg2r8L8rZsfDhIngAwGkeH/91G/G4rUDhRDZaqRHjYuMGoViyDESupDDKiwQN7KXVrUYX9k2uKfygknoS5loz5Pvqh4AppYXF53SajsWR57okbLbgnE1pgNkKO1ajJdMwbstPTZTuZ8sOoHIjokvNQwsxGZL2j3NRfumWp1vwQnOZpErUhntsaE3xRlQ2hnTQP9BQdlC3pv50qnEfUs8abXByIey+doJSaUHEKSYRvmYgBh6VN63OwT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 19:40:54 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 19:40:48 +0000
Content-Type: multipart/alternative;
 boundary="------------DX1DhEF9yqb2HFDXD3J3T0yT"
Message-ID: <549629c6-7d49-40aa-bae3-0e725534bef4@windriver.com>
Date: Wed, 18 Jun 2025 15:40:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] host_dmesg_logger: dmesg diff on BuildStarted and
 BuildCompleted
To: Christos Gavros <gavrosc@yahoo.com>,
        openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250610153125.4858-1-gavrosc.ref@yahoo.com>
 <20250610153125.4858-1-gavrosc@yahoo.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250610153125.4858-1-gavrosc@yahoo.com>
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS7PR11MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: c905d48f-927d-4c7e-21dc-08ddaea0067b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y25SMGNuL2crUVVtd1dpK005cFBjeCsvNGxobVd5cXF6VUFTL2RsbFVUMzAr?=
 =?utf-8?B?QjdEN1lVaGVQRVJjY0hpUHJ3eklUT09CL2lMR1NDVTBGR1dOSFI4TlRzL054?=
 =?utf-8?B?eStOTExzbEV6L2ZESmc2UU0zUUpMYnRMUGF1dlo1WDJBZXZ6eFl3cWhiWkp3?=
 =?utf-8?B?YzEva2l3K3IzTU8waS9hY3VsS2QyUTBCWUg5SUxvL2tIYUlScE40dzNxNGJV?=
 =?utf-8?B?SjYyOEN0MnpqMExmTkg4K3pQQTY0YkR5TjdaS2dsOXhld0w3aW5LNGhzeWpP?=
 =?utf-8?B?bCtndVgxT1ZMK2RLOC8yUlo0VXZXVlFuTWtrcytEQzE0KzhtWW03dVlHdit4?=
 =?utf-8?B?S3FhOFB1WEVMb2NnK2RDLzVFRitRR0RCWjFvcjRJMXpaRTZtSmFGVHczUGM2?=
 =?utf-8?B?bjVpa1cwMmFNY1FKZTlnWG92cjBiai9JMU5ndm05WkoyWEw5K1cvOE0xZnMw?=
 =?utf-8?B?MDJhVDJld1Y0TzdZeUNoUkNvdVg1L2pyUkRuenZCeFRtcUFHQzJ2bjdrd3h3?=
 =?utf-8?B?ZVpFUmkzR2xvbDh2SEN4WnVwTEQ4cXlyaWdZZTlza3YxUE9iT0Rkb0xFV2pS?=
 =?utf-8?B?a3gzNjhVaWJkeWhGQWJzbVFhY25VSnNnT1psVlhVeUEzWlJTTTNNMUNoSXh3?=
 =?utf-8?B?UkJyUDVMT05mN3huaFNvWDlrUFIwS2xuQ0VCUDhRaVFGdFNucll6NTJQZ2U5?=
 =?utf-8?B?WHpOSTV4TDV4Q3BNcUJtejJyMjBjMlR4QlRueElkV2h1RUE0VUZKRFNLYXIy?=
 =?utf-8?B?b0xrVWJma0ZPOFYzRkNQTHA3cVpYcC9Qc2dzVkkxVnU1SUZ5UE9nWmNpd0ht?=
 =?utf-8?B?bXlSOTZMSHpxYjl2SUFKTUZxelJIN3Y2VjJsdFhxeERMU3JaY0NmTzZWTTB0?=
 =?utf-8?B?ZitjQmQ2VmNuTGxUalJCTFJFR0JaL0xoVHpWWlRhWXQ3dHl5TFdoNjNRYXFW?=
 =?utf-8?B?YjgxWU9UYVpudFlXeUZTd3ZiOFlYQ2EzUGdwaXFvSzFFVE5SclorWm0xYkgx?=
 =?utf-8?B?QlFlQjNUZWhqSjdheGtvVlhYTXlVcExYdVJMWGNkdWgybHVDYmFtTk5LT1l3?=
 =?utf-8?B?clFvOHRUZzBvR0EvYmk5aUZTQW5SQndiaDF4dXdrMmVWK0hVMDNSdnlySlcz?=
 =?utf-8?B?OW1tTThtM2wvUDJaazRSWUpiUmVtNEp2OERiQXNEQVJyL0cvNUtzZEN4TnMr?=
 =?utf-8?B?Um43RDJFdlVXT2VObXBwaFJldFgrR0Rna0ZVQkVJQlAwU0NSVEJxeGRwK01h?=
 =?utf-8?B?WEYvUGxTUUgxYzNNWnhBUWVQQU5KTktSWGovQW9ZOXdLc2JpTnRuY3plRUlC?=
 =?utf-8?B?UjQxZHJyNU9HMmlXQUduOWNvaXhlZkIzQUFXTGx3bWFCMlk3blUzQjJSRE5k?=
 =?utf-8?B?WlhSdGc1ZzMrSEpVSXR4emF6L1pvSzZLd3FnczZuQnBZZ2VBWkN5L2p3dkQ0?=
 =?utf-8?B?MzRUYjgxNWtmZlhSTnJwUWllbkhrTk4vN2FWRWJsRkducWdtTjhEZm16WW9F?=
 =?utf-8?B?ZWpLbm4wS2ZpY0cwb0lyRFFNeXZaOFFWbHJGWU9VZEl1VnJKSUp3dVZoNnM0?=
 =?utf-8?B?TWJMdHErVFdhYnJQSTMzdlhtQjk5ZWFKRVZHQmIwaGFzNUdtWXVzUUpoRkcw?=
 =?utf-8?B?MXc5UUFkOElSSzJCM0FrRzBYYkg5TVdUYVo0TjkrT25sRXcvS1g0WjQzSm92?=
 =?utf-8?B?bDR2SWgraU9iOHc3NXNxa2hJbDNUNU5OdlZOK1JsRkJucWNFbnNnN3dka0M5?=
 =?utf-8?B?N3FIa0lhVVVEbEFMKzVGMkF2NURDbmduMlBGMFlpbU92UERwTm5pZE5RQ0dP?=
 =?utf-8?B?eHlXTmF1ZDhMaEp6azlhQXpIWXpSTW5LRStYKzZkUDJPMGs5ajBYMXNrUFor?=
 =?utf-8?B?cWRuSGo5VDhObmR0VGFaN2JCeVVGd21Sd1RHSDRabGJ3SjNCMytWUHh0eXMx?=
 =?utf-8?Q?5pH2OERt1f4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzhlT0J2MW04ZmRuSE5TL1lOdmxLWEc5Zm4wcFlWTlp0Rks3ZkZRbEx1UlZn?=
 =?utf-8?B?VnJZcXhZK01QQ3ZZQ2hqeHAzZGFYbHpmc0tOK0ZSZ1AzVTVJOXdhaGlPQWtp?=
 =?utf-8?B?WDVGVTdmci9YQWxqZHZMRWJxdWRGRlVSY0FqNUJmMlVmazBwVWxoWU1hOStQ?=
 =?utf-8?B?RDJpS0N5VUdIc0k2VjVjYkp4VW5wTTR6M0FpdkU1VlBLTitQdVIzS1ZzV1h2?=
 =?utf-8?B?R3lXczdyaVBxbDAwdXpSQ2c3UTFMN1AwczNuZzRTei9SM25DZnNiZ0ZRTEUv?=
 =?utf-8?B?dW5SRHRDU2x4OVkrWnc5VzBCWm5FMTI1QWg2VWFvcjJ3Wi9WazhqM0F0VGJj?=
 =?utf-8?B?bHN3d3NrYjFoMldjcGRXR01NRmN1UnYzaVRUMHRhcXJ5K2RJVHpzbHUwVHdQ?=
 =?utf-8?B?a3ZxdjBOY2hJZVZWK3hwMk9rYm9oUTlNNGFra2Zmd0xDSzY4UU8zZXdyay83?=
 =?utf-8?B?VWphamR4aHpSUURlMU5sTE5uTmVKanlxNzZTZzgrbUszQXlMMmowaXRtZHY2?=
 =?utf-8?B?dGZmYUpKbjhFL01nTGIyQWdwaEpZUitpUkxQR0tWeUljdkZaRmZFamNXdkd3?=
 =?utf-8?B?TnZHOU9tY014c2xKaWFsNVlTOVBqUlRCNzVPT2Q3U1hqSVFEYlQ1dm5xRGk2?=
 =?utf-8?B?OUk0RWRueU82cGRZbkdPRXpyYVEvOW5OV05JWmJFVUh1dmU4anhLYWJUWFRK?=
 =?utf-8?B?bXpVM2ZzdDFoZlFUWGZIODBVWERpVjdsMjdlcWhuaHUrT0d2VHhQTENubjRZ?=
 =?utf-8?B?cW9Za3RXU2RoR05yYnVwbVNITTg2QVhhcTZsU21rYkNCNVZQZStkMUJxeUFY?=
 =?utf-8?B?Qk1OV0g1bWRMU093S3JhTVR1WEhsbWJqY2lGbTdmTHkwTHREYUhFUlU0S05E?=
 =?utf-8?B?bUxBUjExY1RzRFFjYkJFN3Q2SWxUZnJtU1BDdWlwZjViQkJKVlVWY3FRZHpC?=
 =?utf-8?B?ZEptYWJnc1cvTDFjYW5jV1E5ck9rTUxxY1hrMjhwa2xTYUdKeXo4YW9ER2Y1?=
 =?utf-8?B?dHpwTWs4MmVSbXQ1dXFaSDBFZ05temlxSDRuM2pkWWtrK044OVErU05COC9K?=
 =?utf-8?B?NGwzcGgzdHJpaitmYWdxRWdqTmdsTDloK25lZ24xNEV1TVJjL1E1dVQ3MHpF?=
 =?utf-8?B?cDVhUjl6VWIvanlWeTQ2MkttbHJYSDlLUW1UZklYZ3VCbHRrTnB2RTE2eFdP?=
 =?utf-8?B?N0UvaGtwanRlMDUyWnJTY0hyYklYMDBsYWI3a1dVWDZtUVFobE5sM0t0blRp?=
 =?utf-8?B?U1hzL0JQRU1XdksveWR2dU9wcERPWG8xQUs3OTNzLzYvN2RKcTdjQW93YmxD?=
 =?utf-8?B?VzFIZzA4VThyRXBya0loc1FtVERkNWtzR2YzcXgybHNSZkplUGNGNzFPa2VM?=
 =?utf-8?B?blZ6R2ZPcFFxMHRRL1dLUDgyeGNrbTNPYWs3aWx4b1dtSWlHd1U2Y2Zndllp?=
 =?utf-8?B?cGhDRUNrSUpVM3NmaG5seUYzbWNhcHJWQ044bDVHWEJHamtmblFGS2s3c2Fr?=
 =?utf-8?B?eGVNN2t5S3BySmJ2SnUwWEFvLzUrZk5lTXlKV2NSQndVSlRDVDkzTGRnV3ov?=
 =?utf-8?B?bk5sK1JZcU5aOWFUa29hWGxTaWRreFFFcnpjTndyRHgvMWhDTzVCdm95Z1VH?=
 =?utf-8?B?cDIyRXViQkJJYXdvd1RzQnNlTTlYTHd3MUh3TVhLeXN4aW5NbXRPakN2RHpQ?=
 =?utf-8?B?NWxzbDl4UU5RY29URnZXcHZFTHk0ODhPRGgzdk9zVllNVVZVZXA4MjZ1bHJU?=
 =?utf-8?B?NUlBU1p2UzE1MzBvWWw3akxvMk5vVFlKWUEybDlhb0dOTjVrc1Jjb0gyZ2hR?=
 =?utf-8?B?VFJTdVE1M09rK2pkZ0ozN1pFT1g0bkFQSE1kSlIvbmd3Q21vTjU0eFMra0ZG?=
 =?utf-8?B?d1NkVVJXemRoR2d6MW1BOVNrL2lKbjlqQjFMbll6WE9sRUhsTEtXdER2eDFv?=
 =?utf-8?B?VkF0S3RSR29Xa2ZweUxKeUV3RS9Pa1pwQnlqam1wM0hxS0ZUYmpFTFhwSEFF?=
 =?utf-8?B?UE1Yby9VK0Fwem9CU2FvNnBsckNDUDFyRGhVNzk3dElKNWJwQUFsN2hPbWVE?=
 =?utf-8?B?RjRTTDRuWHJEOURNZDFvREJRcFNISnB0d0Nvb1pHcE9pa1dScXNjTGRwdnl0?=
 =?utf-8?B?NHRNc2VXOVBGR3ZwaGJLODMwUmRRYnZ4WS9iekp5aHBsV2Z6Q2RpeWo4aE43?=
 =?utf-8?B?RlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c905d48f-927d-4c7e-21dc-08ddaea0067b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:40:48.5996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsjzWx5SDr9P1JfaMHaGpYGWAybe3rNb5N7UJTVmrjU/QrEI7NJIz8DWXE+S3OlmUeudX1Tk3ayzZV8YUkFU8WodQ3yapBoZ0K67pfsFjhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfX12u3PbNVnJnH 8LfFQe1L7mM7qX/Jzymo9RFoplLNHygpKDrwVLGJoQ9L1ESGknJFW/J64voO2jC9mxmYyQ8ZhlU 4RrOydDYM+DFO+jqS+hJPB040A0dj+AJqn6CSVxWL/rgE3Z0y0EMctebc8LX7FCEVveTet7+wuo
 wh8eg8w8mbqICEOnnmfw02xo0J1deilRw4ZL6KTnNSLAH3xGayr84b4wftP52fRCvrTylaHn4V8 wA+4AwcqYoEql5Q2g9r/X7ooOp6+SWbaSl+nq2QE4lSUPX/5UiN5lSemr4wUZSewyEYB6+1lVEN ZAvyPpoPlp3cqkk9tyOtEjRpCaYqr2bFbz8EUU540HgwAbbRfJUviCcRd3sJybu2qAJPb6hTtyu
 34nEC00GuWc+0Bg/vMuaD9Dzo44MkZqhxE3/1Ambf+U4gaY6QPN7Xle2+eoKBkUJrTPytKnp
X-Proofpoint-GUID: 1_bSgs5wzov5dxwPJGK1oHJIe_4h4Egs
X-Authority-Analysis: v=2.4 cv=ar2yCTZV c=1 sm=1 tr=0 ts=68531649 cx=c_pps a=VXqs0nH5bCPAj+PVW1y1NA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=CjxXgO3LAAAA:8 a=W_PtKtuE-7PpeMnTqcEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pDcIw8gGjP70bdpPYcAA:9 a=Mnwz99gzlHxaDsCW:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: mYqmh1zcTDuU1DDcJeMVFBQ2JP6QKT1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 19:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219036

--------------DX1DhEF9yqb2HFDXD3J3T0yT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55I5Z9Gk015052

On 2025-06-10 11:31 a.m., Christos Gavros wrote:
> This class is used to capture the host dmesg output
> when BuildStarted and BuildCompleted. Then computes
> a diff and prints the result.

I'd like to see a few words about when this is expected to be useful
and what the drawbacks are.

In the bug Alex said:

 =C2=A0=C2=A0 For debugging purposes, it would be nice to record the host=
 dmesg at=20
the start of bitbake and the end of the build to be able to do a diff.
 =C2=A0=C2=A0 This would probably uncover interesting failures that are c=
urrently=20
hidden/ignored by the underlying build system.
 =C2=A0=C2=A0 We know there are gcc/ld segfaults and sometime qemu segfau=
lts.

The obvious downside (to most people) is that it will capture unrelated=20
dmesg output should
the build be running on a shared machine and that some distro limit=20
dmesg usage to root/sudo.


Also please mention usage:

To enable dmesg logging add the following to your local.conf:

INHERIT +=3D "host_dmesg_logger"


Now that I type that, it's really a host_dmesg_diff_logger but maybe we=20
don't care.

I didn't actually try it yet ... but LGTM other than the comments above=20
and some whitespace issue
mentioned below.

Thanks for the patch Christos!


../Randy


> Fixes [YOCTO #15557]
>
> CC: Yoann Congal<yoann.congal@smile.fr>
> CC: Randy MacLeod<randy.macleod@windriver.com>
> CC: Alexandre Belloni<alexandre.belloni@bootlin.com>
> Signed-off-by: Christos Gavros<gavrosc@yahoo.com>
> ---
>   meta/classes-global/host_dmesg_logger.bbclass | 86 ++++++++++++++++++=
+
>   1 file changed, 86 insertions(+)
>   create mode 100644 meta/classes-global/host_dmesg_logger.bbclass
>
> diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/class=
es-global/host_dmesg_logger.bbclass
> new file mode 100644
> index 0000000000..0caf5f0612
> --- /dev/null
> +++ b/meta/classes-global/host_dmesg_logger.bbclass
> @@ -0,0 +1,86 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# This class captures the host's dmesg output at the start and complet=
ion of a build.
> +# It stores these outputs in a variable and upon build completion, com=
putes a diff between
> +# the two logs to detect any changes that occurred during the build pr=
ocess. It prints the diff
> +# using bb.warn(). The user needs to have privileges to run dmesg.
> +
> +def append_log(msg, d):
> +    """
> +    Appends a log message to variable '_dmesg_log'
> +    """
> +    current_log =3D d.getVar('_dmesg_log') or ''
> +    current_log +=3D msg + '\n'
> +    d.setVar('_dmesg_log', current_log)
> +
> +def capture_dmesg():
> +    """
> +    Returns the current output of dmesg command
> +    """
> +    import subprocess
> +
> +    try:
> +        result =3D subprocess.run(['dmesg'], capture_output=3DTrue, te=
xt=3DTrue, check=3DFalse)
> +        if result.returncode !=3D 0:
> +            return f"Error running dmesg: {result.stderr.strip()}"
> +        return result.stdout
> +    except Exception as e:
> +        return f"Exception running dmesg: {str(e)}"
> +
> +
> +addhandler hostdmesglogger_eventhandler
> +python hostdmesglogger_eventhandler() {
> +    import difflib
> +
> +    start_marker =3D "=3D=3D=3D BuildStarted dmesg =3D=3D=3D"
> +    end_marker =3D "=3D=3D=3D BuildCompleted dmesg =3D=3D=3D"
> +    diff_marker =3D "=3D=3D=3D dmesg diff =3D=3D=3D"
> +
> +    # execute dmesg when BuildStarted event is fired
> +    if isinstance(e, bb.event.BuildStarted):
> +        dmesg_output =3D capture_dmesg()
> +        if dmesg_output.startswith("Error running dmesg:") or dmesg_ou=
tput.startswith("Exception running dmesg:"):
> +            bb.warn(dmesg_output)
> +        else:
> +            append_log(start_marker, d)
> +            append_log(dmesg_output, d)
> +
> +    # execute dmesg when BuildCompleted event is fired
> +    if isinstance(e, bb.event.BuildCompleted):
> +        dmesg_output =3D capture_dmesg()
> +        if dmesg_output.startswith("Error running dmesg:") or dmesg_ou=
tput.startswith("Exception running dmesg:"):
> +            bb.warn(dmesg_output)
> +        else:
> +            append_log(end_marker, d)
> +            append_log(dmesg_output, d)
> +
> +        content =3D d.getVar('_dmesg_log') or ''
> +        if start_marker in content and end_marker in content:
> +            start_dmesg =3D content.split(start_marker)[1].split(end_m=
arker)[0]
> +            end_dmesg =3D content.split(end_marker)[1]
> +
> +            start_lines =3D start_dmesg.strip().splitlines()
> +            end_lines =3D end_dmesg.strip().splitlines()
> +
> +            # generating diff between BuildStarted and BuildCompleted =
dmesg outputs
> +            diff =3D list(difflib.unified_diff(
> +                start_lines, end_lines,
> +                fromfile=3D'dmesg_start',
> +                tofile=3D'dmesg_end',
> +                lineterm=3D''
Add spaces around "=3D" ?
> +            ))
> +
> +            append_log(diff_marker, d)
> +            if diff:
> +                for line in diff:
> +                    bb.warn(line)
> +            else:
> +                bb.warn("No differences in dmesg output.")
> +        else:
> +            bb.warn("Could not find both dmesg sections for diff.")
> +}
> +hostdmesglogger_eventhandler[eventmask] =3D "bb.event.BuildStarted bb.=
event.BuildCompleted"


--=20
# Randy MacLeod
# Wind River Linux

--------------DX1DhEF9yqb2HFDXD3J3T0yT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-06-10 11:31 a.m., Christos
      Gavros wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250610153125.4858-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">This class is used to capture the host dmesg output
when BuildStarted and BuildCompleted. Then computes
a diff and prints the result.</pre>
    </blockquote>
    <p>I'd like to see a few words about when this is expected to be
      useful<br>
      and what the drawbacks are. <br>
      <br>
      In the bug Alex said:<br>
      <br>
      &nbsp;&nbsp; For debugging purposes, it would be nice to record the host
      dmesg at the start of bitbake and the end of the build to be able
      to do a diff. <br>
      &nbsp;&nbsp; This would probably uncover interesting failures that are
      currently hidden/ignored by the underlying build system. <br>
      &nbsp;&nbsp; We know there are gcc/ld segfaults and sometime qemu segfaults.</p>
    <p>The obvious downside (to most people) is that it will capture
      unrelated dmesg output should <br>
      the build be running on a shared machine and that some distro
      limit dmesg usage to root/sudo.<br>
    </p>
    <p><br>
    </p>
    <p>Also please mention usage:</p>
    To enable dmesg logging add the following to your local.conf:<br>
    <p>INHERIT += &quot;host_dmesg_logger&quot;</p>
    <p><br>
    </p>
    <p>Now that I type that, it's really a host_dmesg_diff_logger but
      maybe we don't care.<br>
      <br>
      I didn't actually try it yet ... but LGTM other than the comments
      above and some whitespace issue <br>
      mentioned below.<br>
    </p>
    <p>Thanks for the patch Christos!<br>
    </p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250610153125.4858-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">
Fixes [YOCTO #15557]

CC: Yoann Congal <a class="moz-txt-link-rfc2396E" href="mailto:yoann.congal@smile.fr">&lt;yoann.congal@smile.fr&gt;</a>
CC: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>
CC: Alexandre Belloni <a class="moz-txt-link-rfc2396E" href="mailto:alexandre.belloni@bootlin.com">&lt;alexandre.belloni@bootlin.com&gt;</a>
Signed-off-by: Christos Gavros <a class="moz-txt-link-rfc2396E" href="mailto:gavrosc@yahoo.com">&lt;gavrosc@yahoo.com&gt;</a>
---
 meta/classes-global/host_dmesg_logger.bbclass | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/classes-global/host_dmesg_logger.bbclass

diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/classes-global/host_dmesg_logger.bbclass
new file mode 100644
index 0000000000..0caf5f0612
--- /dev/null
+++ b/meta/classes-global/host_dmesg_logger.bbclass
@@ -0,0 +1,86 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class captures the host's dmesg output at the start and completion of a build.
+# It stores these outputs in a variable and upon build completion, computes a diff between
+# the two logs to detect any changes that occurred during the build process. It prints the diff
+# using bb.warn(). The user needs to have privileges to run dmesg.
+
+def append_log(msg, d):
+    &quot;&quot;&quot;
+    Appends a log message to variable '_dmesg_log'
+    &quot;&quot;&quot;
+    current_log = d.getVar('_dmesg_log') or ''
+    current_log += msg + '\n'
+    d.setVar('_dmesg_log', current_log)
+
+def capture_dmesg():
+    &quot;&quot;&quot;
+    Returns the current output of dmesg command
+    &quot;&quot;&quot;
+    import subprocess
+
+    try:
+        result = subprocess.run(['dmesg'], capture_output=True, text=True, check=False)
+        if result.returncode != 0:
+            return f&quot;Error running dmesg: {result.stderr.strip()}&quot;
+        return result.stdout
+    except Exception as e:
+        return f&quot;Exception running dmesg: {str(e)}&quot;
+
+
+addhandler hostdmesglogger_eventhandler
+python hostdmesglogger_eventhandler() {
+    import difflib
+
+    start_marker = &quot;=== BuildStarted dmesg ===&quot;
+    end_marker = &quot;=== BuildCompleted dmesg ===&quot;
+    diff_marker = &quot;=== dmesg diff ===&quot;
+
+    # execute dmesg when BuildStarted event is fired
+    if isinstance(e, bb.event.BuildStarted):
+        dmesg_output = capture_dmesg()
+        if dmesg_output.startswith(&quot;Error running dmesg:&quot;) or dmesg_output.startswith(&quot;Exception running dmesg:&quot;):
+            bb.warn(dmesg_output)
+        else:
+            append_log(start_marker, d)
+            append_log(dmesg_output, d)
+
+    # execute dmesg when BuildCompleted event is fired
+    if isinstance(e, bb.event.BuildCompleted):
+        dmesg_output = capture_dmesg()
+        if dmesg_output.startswith(&quot;Error running dmesg:&quot;) or dmesg_output.startswith(&quot;Exception running dmesg:&quot;):
+            bb.warn(dmesg_output)
+        else:
+            append_log(end_marker, d)
+            append_log(dmesg_output, d)
+
+        content = d.getVar('_dmesg_log') or ''
+        if start_marker in content and end_marker in content:
+            start_dmesg = content.split(start_marker)[1].split(end_marker)[0]
+            end_dmesg = content.split(end_marker)[1]
+
+            start_lines = start_dmesg.strip().splitlines()
+            end_lines = end_dmesg.strip().splitlines()
+
+            # generating diff between BuildStarted and BuildCompleted dmesg outputs
+            diff = list(difflib.unified_diff(
+                start_lines, end_lines,
+                fromfile='dmesg_start',
+                tofile='dmesg_end',
+                lineterm=''</pre>
    </blockquote>
    Add spaces around &quot;=&quot; ?<br>
    <blockquote type="cite" cite="mid:20250610153125.4858-1-gavrosc@yahoo.com">
      <pre wrap="" class="moz-quote-pre">
+            ))
+
+            append_log(diff_marker, d)
+            if diff:
+                for line in diff:
+                    bb.warn(line)
+            else:
+                bb.warn(&quot;No differences in dmesg output.&quot;)
+        else:
+            bb.warn(&quot;Could not find both dmesg sections for diff.&quot;)
+}
+hostdmesglogger_eventhandler[eventmask] = &quot;bb.event.BuildStarted bb.event.BuildCompleted&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------DX1DhEF9yqb2HFDXD3J3T0yT--

