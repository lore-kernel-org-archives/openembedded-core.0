Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612BBC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 03:42:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35555.1749094951505556533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 20:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82516f1040=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5553e7jX025717
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 03:42:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3eef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:42:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyVa1UdoYKgNx2VKCIUUSF5pdVPlla9Ln1/eWAn4mmhYnuE5ToRi/7B+oRm1yKvI/ONLDp+zBg0rwyp0U0YUzSDu/A/PRJRgiZS2ouEfwE08lE9kDJsBl1FI42iL9bMGh497G00GOhpe4eobwVCYNMQvVYoX8s0YHeLwLrO1I019fDktKMErpoq9E0ZXEcl7md8Ccx4l8Cbgg0bkqfUxUhU97niDY1HmFZ3gH799b/42tqNTV3VZLXDhAV2pJeUfGrIyLg+ErTphrHQcPnBbVwKYrzCXoP9eqv0f70hf/37OEVkbPZm5z4Jzx8O/MOyqSmnkF2Vko/nmBuHN27X0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQjjqXjLojJwOEXWhDGcLNtqQhNnZL/w/p76feVj6Wo=;
 b=h4fO2IKf6FnwWiXZai8LUfP9299OkXbjpM5/m2If8hv+vDSHb92qlRYpTzESw/2OaIXNs2dl6aQ+bMfiLwTI8kWyNASLGpoVZ3IRGmFqBbLjKLX5nAvo6Ec52L8klg9KS155B+FDNEEeSNwCSBf+Z/aNIe2DArPc76+TynOvEMY/Qtc0eyA1GJf9aFAs7m5PPTlLqjw5brI6z8EBPB4ohIFFgKiXfgZ1XP3QMNLX5u4+30eTC8ZQd05X9y+66xCZ04FJ6Y3+BwudGu2xJcYKNePCGJNtVfym9wdX1eRxPYjxVj+S4Ke68W4dttTMBf3f5MVRuLCT3RQMtOLaqjQS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB6898.namprd11.prod.outlook.com (2603:10b6:806:2a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 5 Jun
 2025 03:42:27 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%3]) with mapi id 15.20.8813.021; Thu, 5 Jun 2025
 03:42:27 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] util-linux: fix ptest failure for musl
Date: Thu,  5 Jun 2025 11:42:10 +0800
Message-Id: <20250605034210.3125187-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: e201350e-ad42-4b03-0fc7-08dda3e2fdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QTFoR3J0YzhYeHJaUlorMlFYb3lETFExUEVHekV0MWx1R2lCVFh0UWdDM1By?=
 =?utf-8?B?TUY5TmZ6NDM0aFlWWmVCTWIyNWtTUWp3eUVRL0ZJMFJsc2tqa0Z0aGdkSGhu?=
 =?utf-8?B?SjNNQjBPdnl4aXMrQ2Q0bFkwRlpJUjd5VnpDQVdValcvWjU1WWFGRE91aXd3?=
 =?utf-8?B?WnVCTWZORnVRWmhCVkp5WVNIV1VnNGhhaXgxUklyWWpUdmQ1VWtxZzY5cFBR?=
 =?utf-8?B?SG5mTkhiQ0JpRnhZL1kyZHkwMnpnU0FJOUxEczI0UmUwSlVkSGhVcU9lcjV6?=
 =?utf-8?B?eWk5UDgzOERnS2o3cUNoT25HVnVqT0ZuQW9HaU0xVlVKUXNBK3U2a09tb0F4?=
 =?utf-8?B?Zmo2WmNxVExTYSt1YnFCT3M4NFJrcXVVcTVtRXRlWkM5TVNURk5GNFFDbS9T?=
 =?utf-8?B?ZDFWbm5UTGk2MnJVcHlwVlQ4bkhVL2hMSVM3M2ZVNlY1bjZQaTV2MnZpNkhO?=
 =?utf-8?B?aG8zd1EyL3ZpbnNWSjlXbmJUeWtSZmlEUUhoU2R0eklybFVUUXNxd2ZZRnpo?=
 =?utf-8?B?MnBBallvdUFpblJDbmVYQWIzRURtUVdaOW05R3NLQlZDZytIZEs3Q2lUMk13?=
 =?utf-8?B?Z0RHeHFrcVJ0OHp3V2QwSFBjckZTRG5uQUhnZFp3QVFocmtrbi82c0R2ZmJj?=
 =?utf-8?B?aWEzY1VvVnhoMGpocWVVVE5nT2ZsWTdON1JNNTQ0ZjFwNFNGZGVzN0laRnoz?=
 =?utf-8?B?WGUwZVdTd0IrcDdKVXpET3NZaVk5Rit1c050NStkMTlxR1lIS2lTdUphNFlT?=
 =?utf-8?B?ODR4cGVuUVQxaENWUGk2YlhDcTN6NC8rT3FSSzllcE9FNlAxNnJpTEhFeUVk?=
 =?utf-8?B?aGg4elBwbjhwR2RGK2xOcksxcGIydjlQb1BnKzZCNnZ3UzQwVTBLRFFOSWRY?=
 =?utf-8?B?OWQvSU5NSzd2QlVIMm44bmZmQzNDN0EvRXRaWTAyYW1Rd0ZYYXozdTJDMHpY?=
 =?utf-8?B?YnE0U3N1K2VDV0dBN2hlMUNHUFJaN3llWkgxZnVOUmJYdHNPbXIwQllSRzRR?=
 =?utf-8?B?aFZzTU42OFA2bFJ2ellRY0ZMQThJMzg5SmpqTk56U2ZTTUtFYUtmZlJDNnQ0?=
 =?utf-8?B?bW9WaTdDZERhdWdnV3p1K1NBZ0NFUlhzTS9MZnRmN3BNa1psclVuWFYvbU11?=
 =?utf-8?B?TjFUMFJBeVdFd052bUFBTXNOdUZsVFBYV21kL1FsM2ZYS3YwL1Vnb3ZXblE5?=
 =?utf-8?B?RjY5R3hqdllYK0dxWGxqVjlTOS9aS05tNFlpSVZkcGt6dlR2bVllZ3J6cXBr?=
 =?utf-8?B?TDlxR3lIZDd3ZFZaVXJ6NmczWHRUVFVGZDRLa1BqN2s1ekR2TGRuQWhBYUdZ?=
 =?utf-8?B?azhoN3FmZmR2cDVnb2J5Y2tQTWpnYkNVNFJvV2dDVWQ3MHV2ZnRxbkJteWJn?=
 =?utf-8?B?NWtRSEg2NUgvUzA0Ynp3TVJZamZYeXlEUDZtZWp3djl0ZjZMUGZwcmdoVVhh?=
 =?utf-8?B?V1hXK1A2SHFjZ0ZFeDZ4SmJ5NHA2QTllYnI2NTVkcXlVUG53bzZuSkhwK2J6?=
 =?utf-8?B?K1MvMi9aYU5GTkd1MzVyNE5pejZvYnB4ZjdWUGRkRGRJZXppQ0ozRnlUZ1dF?=
 =?utf-8?B?Ujc0bmZDVkVEaXl0ZWVMbytqcTFqOTA1dkpwRGNndk9STUlpdlNEa044RUZx?=
 =?utf-8?B?MmsvaERYT0NZcTJpZkUwRXlIb2gyOHdyVXhGYXlrcld4a1E1aGU4dktUcUlJ?=
 =?utf-8?B?aGNGMWJVVTdKRHh1eUg5c25ETmp4TzkzVWd3NHZUdlFvdVkxL3ZBbXYzeFBs?=
 =?utf-8?B?QTBHd0VCbS9zOFZVNGRSRzhPalBQTzhnbTJiekE0bG5oR0hTdWFXUTR6cm5S?=
 =?utf-8?B?TS9hVTY1dlNQUldWcW9Ybkk1emJPSkpUY0t1Y1YyWmk4aXpYUVovUUlVWW9s?=
 =?utf-8?B?Szg0OFVtbWZDN3dJeUdoVUpoMkRlUG9jYTByYlNDV0lIWVJrRnhFaWlvNjNU?=
 =?utf-8?Q?GXhqWbYReIVgWq8qb8WprcSw1eKn1Lwn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFF2c25pZFlVSk9jZUM0am1McHNUZWhpd0RCdFprdnBOZEdkWGg3dW5uc2xw?=
 =?utf-8?B?bGw3bGtMaEhZS0pNa21BeXFDY3NzODgyc0didUtIUTBxbmhpa1NCRzB4aWg2?=
 =?utf-8?B?N1pQbDk0QXppY25JK0R0UnJWeDdnVzdBNXVxOVYycm9OaUY1ak9tYXZNdHE5?=
 =?utf-8?B?SEFEYTExRVM4bkJFaUM3NjBaWE5mL3JzRHA0cnV1WnhkbFp2YXdHakpYVnIz?=
 =?utf-8?B?dnJTR0p3U2srcVVqR25BQW9XaTZBM0lkd3NITk02WWZSYzhKZGFuUCs4eVdY?=
 =?utf-8?B?bGc4SnltM1I1SmptcW9Fbm1tWmszWnlNV053THVLblJmdHRiMGRzY1N6ZFF2?=
 =?utf-8?B?cVJCY1UxRlhQRGdsTjgrWWxjT1FJeFhJb0JpR214aTA2M2pxbmkxNjhDRlhn?=
 =?utf-8?B?ZUN3UlVzRGc5NWtZQkZCb0JYYXcyVWFmNVl3dW9IMndKNDR4QUU3RmNmZ2dC?=
 =?utf-8?B?eUYrMmR4S3hLWFN0b3ptOVJZQVJLemlyS1Q4UUY5TkpVNlhneTFkdzJKOEtR?=
 =?utf-8?B?dEsrbUNWZGhhNUk5eVI3Z0M4aktnRUZvRHp5UWxqN3FkWUVOb1ZlUnRrb2dp?=
 =?utf-8?B?WE9TT0oxb3o5Qll4eG0wMWVpOWxxb0NxbUZ4MHc5bVY5UVdxaHRMRUFTWER6?=
 =?utf-8?B?My91aE11a0Z5ZVJQT2pUWlJUK0gzOEZHaTNlem44ZzFPVDhoYUlmdFRTc3lC?=
 =?utf-8?B?dG1mRmw3RWg2MXpsRmdIZjNVejc5eDRwSEU3ZUVZR3VNSWdWeVEvblV4RGh4?=
 =?utf-8?B?MWtVTEJ2RXozYkhKbzdGV25tcis3THpCN1M3Si9HKzhNVG1QVGZ0TUQ5NktT?=
 =?utf-8?B?SlBMSE5HWFFvSDlpODRpT3llbjNGSXdiZFQrMzVUT3piMysxRzVDSlFUbUQ3?=
 =?utf-8?B?YS84bVV2UjhPcS9KcUlsdnpVaTBDM3JhMjBWM1VEVmx3Q2dlN2EwNnFNZlJk?=
 =?utf-8?B?VFYyVENvN0RQOC96ejJ5Uk0zWXRrVEtSU1A4SXdNMG5pd3ZWTWEyWHgrMlRX?=
 =?utf-8?B?bFJTYVR3YmZTajdHTk1obFAzUGdpYnhXdjNnSE16b2UxWi9JdXFZU09CdnZv?=
 =?utf-8?B?RHkzNXVQcThtMkR5NkxxOGVKWmRLM2t5WHUrZTNhb1crcFhMVzA4THZFdlli?=
 =?utf-8?B?WWp2a3Bid3YxbGlRbDBaZzY5ZlEvWXZtMmFhekRJRGlSMGQ5anhpOFBzSHV0?=
 =?utf-8?B?SGMzV0pCMExSMmgyK2pzRWtEbWFxMTc2dWp2UDgxN0twTEt5RFo5T0I3c2Yy?=
 =?utf-8?B?dUt3am5JTG1sdW5Va3J5RTFMQk11QjBxSTdKQWo3eks5LzdKaHdFcGJBRjV2?=
 =?utf-8?B?T1dVUnVoY3VNWWJiWGNJZE1FeTA5VjdEZ3ZZdnN1aG9tNVp2d285aFFDaExB?=
 =?utf-8?B?YWUwR0QxcThlVUxqbC9XQ0NHWm5JSG1NekFuRmNWZ3EraWtPNDNMYXQ2RVhS?=
 =?utf-8?B?TEpaSFVWUkJ6YXoyM2dSUnF2TmdKaDIveVJGVkdpNVFsSWNlcjlyWGNrNU1s?=
 =?utf-8?B?NGJvWDhlcnpIQ1JkQ3FGR1R2a2NMRHNQNExCcWltM0Z0bWdUM05BaytPU2NW?=
 =?utf-8?B?TTlRTHNTUi81alVTMytDSjhVNWdOeVN6MGFkNGVaU0JHSWFaU245VHppWkdB?=
 =?utf-8?B?NUxCQU0rZ0dXYS9SWkQ5MXhpRW1yajJ0OVFUdk1qNndvZGtFU3oxWmlIRDh0?=
 =?utf-8?B?R3B3bjRhRnBtcFZZQmFBOG94TVFXeWt6aEtNWkJ4Zk5oNk9VYU8yRndDaHg5?=
 =?utf-8?B?WkdKNkdGUWQvZEhhSyt0OUR6SDFhSkhpRTduYkY4YUs4Uy96SnF2azBoV0VL?=
 =?utf-8?B?QWdBeEdxSjRyTHFFZVBKeXo3ZVRlRVNIWEVmb012OHhyYzlpRjE3SUJURmRk?=
 =?utf-8?B?b01MNkhFQU84UFF3c3ZjZVFGbWZOdk1sVzU3eHhFcW03SDhhTHB1WTQ5anpt?=
 =?utf-8?B?QTE4T0VvaS9rZ1ZvUWNjcmpteXllOSszTndWckdybnFxMTdpd3NvRkNDT2FV?=
 =?utf-8?B?NGxFc1c1dzZrc3BSdEd3c0FhNndSTGVvRlFHY0l6Vi9YOUhMNVZqVWs4ZU5m?=
 =?utf-8?B?UWRlTldSM3BST1p0TC9PRGtsUVNOSjU0ZklkK2U5TWZNV3NId2k1NlpFK2dm?=
 =?utf-8?Q?r3qeYVKm2zjc2OXO4fbIHpXTt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e201350e-ad42-4b03-0fc7-08dda3e2fdaa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 03:42:27.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WVuxhTW+h0sR4Bw2rMwZp5Oz7FDOIL9Ybgo9L+HRUp1kasFUrTqHtP3aTmOKWYRGeE9VJ61s2z1UsSD5JeKKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6898
X-Proofpoint-GUID: J-kLARh3Ix7_YtHJOJcnI4DWoH0CXcJL
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=68411226 cx=c_pps a=1L1dmzis/U4K9L4O9iUGyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=5KEJ3k9QAAAA:8 a=t7CeM3EgAAAA:8 a=smEWCA-UKiuXHGhkMJ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=olg2BfGzmf2haRflzj8J:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAyOCBTYWx0ZWRfX9Rq6bSWdW+6q WMW4v5bMeQQlbGO4xfmLsKlYL4EMcVXNXzbqXnNvPRW2UAx+GaiTM9mWAopIppiNe5NULgP+jpL x1ZSl2ZP/Ci/PXuesahZ+KQ7yfj7aFbpTl1sFIfsxG4HmkhD8ku3Zq0YgqhyKCtBJz7GbZxiSAe
 Ztf+xzsEDSBZ2okMrFaNWSiRDGWMs9OW38cg68Lqe7cQX2IqyNOHN0FAxXVKZYgnwcQdlzjgD7N sowuIHQqyLgw89dRzXid6vGS53stdCF0ZsEQVYCoDU0N6/eyWaBVOSU+XK0n4eKm9gaIx3Nu+YW 04EH5Wc3cwD538WTwrcNSMb374+ZBdJktdPhiYsVOfIY/GkWGCvTYV1Uthcd0u+Op2NP4LG5DPc
 PWgAHk/jduW/kHytWRsZEwk4EyaHTncawEcVSX82YfmTEq069xuK0dXRK5Bb57qfNjQa6q41
X-Proofpoint-ORIG-GUID: J-kLARh3Ix7_YtHJOJcnI4DWoH0CXcJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5553e7jX025717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217977

From: Chen Qi <Qi.Chen@windriver.com>

The kill/decode test case fails for musl. The root cause is the test
case only considers glibc and uses 34 as SIGRTMIN while musl uses 35.
Add patches to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 +
 ...01-test_sysinfo.c-print-out-SIGRTMIN.patch | 50 +++++++++++++++++
 ...se-SIGRTMIN-from-test_sysinfo-instea.patch | 56 +++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-test_sys=
info.c-print-out-SIGRTMIN.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0002-ts-kill-=
decode-use-SIGRTMIN-from-test_sysinfo-instea.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index b0f2a9d497..fc5add37ac 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -42,6 +42,8 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-k=
ill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock=
_di.patch \
+           file://0001-test_sysinfo.c-print-out-SIGRTMIN.patch \
+           file://0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-ins=
tea.patch \
            "
=20
 SRC_URI[sha256sum] =3D "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b6=
86b3fe475ddca4c6"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-test_sysinfo.c-=
print-out-SIGRTMIN.patch b/meta/recipes-core/util-linux/util-linux/0001-t=
est_sysinfo.c-print-out-SIGRTMIN.patch
new file mode 100644
index 0000000000..ee9f220842
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-test_sysinfo.c-print-o=
ut-SIGRTMIN.patch
@@ -0,0 +1,50 @@
+From 50774e34fee0cd528b195a863bcd4e3a04fbfc4b Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 4 Jun 2025 10:52:18 +0800
+Subject: [PATCH 1/2] test_sysinfo.c: print out SIGRTMIN
+
+This will be used by ts/kill/decode.
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/3605]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/helpers/test_sysinfo.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/tests/helpers/test_sysinfo.c b/tests/helpers/test_sysinfo.c
+index 1559d471f..3a791e7f1 100644
+--- a/tests/helpers/test_sysinfo.c
++++ b/tests/helpers/test_sysinfo.c
+@@ -27,6 +27,7 @@
+ #include <errno.h>
+ #include <time.h>
+ #include <sys/ioctl.h>
++#include <signal.h>
+=20
+ #include "c.h"
+=20
+@@ -116,6 +117,12 @@ static int hlp_ulong_max32(void)
+ 	return 0;
+ }
+=20
++static int hlp_sigrtmin(void)
++{
++	printf("%d\n", SIGRTMIN);
++	return 0;
++}
++
+ static int hlp_wcsspn_ok(void)
+ {
+ 	printf("%d\n", wcsspn(L"FOO", L"F") =3D=3D 1);
+@@ -229,6 +236,7 @@ static const mntHlpfnc hlps[] =3D
+ 	{ "ULONG_MAX",  hlp_ulong_max	},
+ 	{ "ULONG_MAX32",hlp_ulong_max32	},
+ 	{ "UINT64_MAX", hlp_u64_max     },
++	{ "SIGRTMIN",   hlp_sigrtmin    },
+ 	{ "byte-order", hlp_endianness  },
+ 	{ "wcsspn-ok",  hlp_wcsspn_ok   },
+ 	{ "enotty-ok",  hlp_enotty_ok   },
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/0002-ts-kill-decode-=
use-SIGRTMIN-from-test_sysinfo-instea.patch b/meta/recipes-core/util-linu=
x/util-linux/0002-ts-kill-decode-use-SIGRTMIN-from-test_sysinfo-instea.pa=
tch
new file mode 100644
index 0000000000..5a00c9037a
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0002-ts-kill-decode-use-SIG=
RTMIN-from-test_sysinfo-instea.patch
@@ -0,0 +1,56 @@
+From 9848b0d8c90d9a24275bf402f6d76e97f62b3ba4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 4 Jun 2025 16:27:19 +0800
+Subject: [PATCH 2/2] ts/kill/decode: use SIGRTMIN from test_sysinfo inst=
ead of
+ hardcoding 34
+
+glibc uses 34 as the value of SIGRTMIN:
+https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsignal/allocrtsig=
.c;h=3D8ed8e37dd6c41f94be6eef042ce9db1af1153228;hb=3DHEAD#l27 """
+static int current_rtmin =3D __SIGRTMIN + RESERVED_SIGRT; """
+
+musl uses 35 as the value of SIGRTMIN:
+https://git.musl-libc.org/cgit/musl/tree/src/signal/sigrtmin.c
+
+With the hardcoded 34, test case fails with the following difference:
+
+-Ignored: HUP QUIT TRAP PIPE ALRM
++Ignored: HUP QUIT TRAP PIPE ALRM 34
+
+Use SIGRTMIN got from test_sysinfo to fix this issue.
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/3605]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/ts/kill/decode | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
+index 03bc25ff6..dd34aacef 100755
+--- a/tests/ts/kill/decode
++++ b/tests/ts/kill/decode
+@@ -48,14 +48,19 @@ ACK=3D
+ 	    # Sending one more USR1 is for making the signal pending state.
+ 	    "$TS_CMD_KILL" -USR1 "$PID"
+ 	    "$TS_CMD_KILL" -d "$PID" | {
+-		if [[ $("$TS_CMD_KILL" --list=3D34) =3D=3D RT0 ]]; then
++		SIGRTMIN=3D$($TS_HELPER_SYSINFO SIGRTMIN)
++		if [[ $("$TS_CMD_KILL" --list=3D$SIGRTMIN) =3D=3D RT0 ]]; then
+ 		    # See man signal(7).
+ 		    #   The  Linux  kernel  supports a range of 33 different real-tim=
e signals,
+ 		    #   numbered 32 to 64.  However, the glibc POSIX threads implemen=
tation in=E2=80=90
+ 		    #   ternally uses two (for NPTL) or three (for LinuxThreads) real=
-time sig=E2=80=90
+ 		    #   nals (see pthreads(7)), and adjusts the value of SIGRTMIN sui=
tably  (to
+ 		    #   34 or 35).
+-		    sed -e s/' 32 33'// -e s/' 34'//
++		    sed_cmd=3D"sed"
++		    for ((i=3D32; i<=3DSIGRTMIN; i++)); do
++			sed_cmd+=3D" -e s/' $i'//"
++		    done
++		    eval $sed_cmd
+ 		else
+ 		    cat
+ 		fi
+--=20
+2.34.1
+
--=20
2.34.1


