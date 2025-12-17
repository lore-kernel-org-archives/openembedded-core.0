Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD4ED65C51
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:32:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14236.1765977359162184548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:15:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Pvl7nlDX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444635b17a=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH535iq1076109
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 05:15:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=h+omDmAq+5It3HvS+z+af1
	eDJ040QTPTmtJTiP72jNY=; b=Pvl7nlDXewLr7Fb+qf/WNVzZ7bYYuYylY/k31h
	PbH10uTnhJIJLqQdBHNhvcO6hzMVHd5Eal+UcyiVaRy0BcPbT5OBW0/UseyC+Yvt
	ecyHUyKteL6pYgnJMhqRxCzKHLKTlIfJyMQaAcR9MwyAxOCvbI9lDaLrd0lDwpcS
	DhT3bY2acbMhg6VSsgxZhvb9lRt/S+9K/z/Lpf5egEeM/sNdpS3OepoXm00V0TJq
	X+PEIYtPq5OGX2OMVw5xjG7zTKDSlCtEB1am7HE4wvj5Ng3egFiPOjsQ+5tjpKgI
	W+/Uh6Itqd+Q5Famtcl7ion8zbIp/9+9kG/04XEjPDQlWHaw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j0k5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 05:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2cOH9nQiVp8X/UMPIp6lVfLW+fyV0EgOpBv1Vkm7tKQLEHbL+N+PPVW7eWeM7lsC6VUjBw69aq95D/qthicn/KnqVdeAe+CnbrzePl2o+/mpi04KgGny//7K7bKkP2FgQcZlHlYIgCKgc2aKvo6XyIVo9KVl8dUieG3p1Lm5wv9+9ZYMSrBC5AS928eVwlbRxT1PCa3VX2x5iSDvoq18jI6WPzae+EGWCRUUgxv4IYvfWTrJ1RL3fj3whw5PMT6T9KniXBuvMrqcYXPHH96lCsfNNsl9lwAYT5JQyU09rx+SNbwAnOnnTdqLfg2HxCieVHOJXJuo14yGSyu4BP61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+omDmAq+5It3HvS+z+af1eDJ040QTPTmtJTiP72jNY=;
 b=gQi9xwU0iDoTC13hGL1Wb9Mo2GMQkmYdG51sAXs0v0ULKaOD6zgxwCKlz0HpUOBeJ3fQ7MCQLVVygH74Xik1nG8MFSi7p3lipZwAsXIxYX3aTd78NFCE9X7k8zbfR3AyieEekiIopVbNEysf/XejJ/XopwVveESbDfBDVkGgWbf4Yt2GR0OMc+m6Hj+h30I3h0vXJVoiYt1TdS/eRjSlAAs71reg37rO3O6f6GnQT9ecBwZDt9DqJFjx3FDiaNW6Xsn5lGDkOHkJbO2pWIwSl3HwuTNQ6P4970IhBQ+o7Rj+p73TRCPW3IURyQMFTVAsnFrapLn4xNHpW7+LZjcu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 13:15:54 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%2]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 13:15:54 +0000
Message-ID: <4067abbf-57bf-43de-ab80-df09e509f39b@windriver.com>
Date: Wed, 17 Dec 2025 15:15:47 +0200
User-Agent: Mozilla Thunderbird
From: "Dragomir, Daniel" <daniel.dragomir@windriver.com>
Subject: Re: [OE-core][PATCH] wic/engine: fix copying directories into wic image with ext* partition
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Kexin.Hao@windriver.com, mathieu.dubois-briand@bootlin.com
References: <20251003203130.23843-1-daniel.dragomir@windriver.com>
 <D8277C29-A859-491A-85B8-C518E37EB988@arm.com>
In-Reply-To: <D8277C29-A859-491A-85B8-C518E37EB988@arm.com>
X-ClientProxiedBy: VI1PR0902CA0038.eurprd09.prod.outlook.com
 (2603:10a6:802:1::27) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 7297b279-f5e4-48c1-ea4b-08de3d6e6851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0RRci9YT21jUmFvVDlEckl5Y3VZR1l1SFpEWWZEWUM4VER0QkhYNzRuUkNu?=
 =?utf-8?B?VElBN0gvQk1tYzI1YzUzSlBVYWRYQkVxSkE5QWV4dGRQTWh5QnNqVzB2aVhh?=
 =?utf-8?B?UW1sVm5RcEFBa2xaQ3lqWDZCYi9NdjFFbmZpV0dKV0R4TW02Zk1tVkNqVGQ0?=
 =?utf-8?B?OWllN1UyalZDZUhjazJ3SVhPQ0F3OTd6UEhrVG00WllXMnliWGdHcUdiNHVn?=
 =?utf-8?B?MkdjRzFQUnVUY0hzeGVQbFlLamhrVE4zSGd2bStwWXBFdlpCSnR4UGRuVnM2?=
 =?utf-8?B?aDdaT0JMUTRIbmhteDB4V0UrZnA3VzFiZCtjeEEvR2dPaHhLZ2VmVWVzWXBX?=
 =?utf-8?B?L0d6bmJnSS9TTFZ6Zzd2QnZjTUpQaU1qZnZhZElFNlNYYUJEQ3p6S1lnMmwx?=
 =?utf-8?B?ZEhBSGw5VkQwVjh6S2JhSmIwRDR5ZXRPSERrckU2OWxpRXo3cHl0d1dVemdX?=
 =?utf-8?B?MzhtSFlFVE5kMklvRHVPU2tUMWpJRDRJaFVoK2JDcGZ5UGdZakJMOWNUZGw4?=
 =?utf-8?B?enMvRkxxcmNxQ1JiMEZ3aDlPdVJvUmF3VFpocE55dlhCNmhWVkEyZkVRSkgx?=
 =?utf-8?B?RnRuYlJQYXAyRFRZUmlDR0xMekM0ZnRXbVpqOWNQZXl4a3ozR2l3Rk13MVV1?=
 =?utf-8?B?amNNTm5DWjE4MVNNQi9yV2xXS0NDWG14Q0R6OVN3ME9YaWlvbG5Ea3U4NVBh?=
 =?utf-8?B?aDJKb3Z3MUtVUXliU3duQU5vUENhY3pGNmlnRGlGMXIxK0RDK1pGNTFpQTZx?=
 =?utf-8?B?UFlQMXN4WVJERnRxQTFZdWtkVEJIbExFMmdqL3U5RFRkMEFWYmNpNVFnWjNv?=
 =?utf-8?B?bzY0V2pGd2NoektYUUNhM3orTGw4MHdodDNVZWtTa1VRU2ZlcFFKTHRpeDhB?=
 =?utf-8?B?MG12TmJHdS85MFNIeGNqV3dPQ3BYT3laU2JPNHZiNmZBVU4rSmY1SjJ4a0FG?=
 =?utf-8?B?VVdYK2ZZVDAwWEp0a2FUQk00NXBYRllSSktFY1ZiMU10ZEQvblVpV0UyMWdJ?=
 =?utf-8?B?YmtwdEo5dEtTbzU5SEdaeEpmc3JzUXl4VTRqOWg5VzA1b281cVVNbTFvSFFL?=
 =?utf-8?B?azhTTXJxdGZCUnppZVc1WGxHNjBzOXNrb09QOG01RGFQSGVwRWU2ZS93Z1BN?=
 =?utf-8?B?MFArdllIYm5RVTc2WEZGU21ITjQ1Vlg4dG9NaGd1RCtvQnNTYmlyQ0lNUDlS?=
 =?utf-8?B?UXJOL3ZpSlNWOFlkdTh6RW8wNVV2TGYxakF4cmZQM0p3cjJydWNPcis1UkNx?=
 =?utf-8?B?UjlGUmNZekhSMllJZU9zc0RTakhtREV4Q1BTSFFRS1RTcEdOYXdva3dlYStE?=
 =?utf-8?B?RFU5R25wRzk4eHdPZkRHMng3UHRRUGZsVU1IQzlzbW83QWRUUGR6aTE0NGF5?=
 =?utf-8?B?N0I5dGUzYmlONS9BdnFaWVhzMG1YS09sM2dkYVdxWEtEUFNmMzhCVmdyY3FS?=
 =?utf-8?B?Z2xRSmRyWGFmdjViTzVmSyswV3Y3VGU4eU9heU5sV1I5ajUvVTNyWXhYeEpx?=
 =?utf-8?B?bkRWUDhpZitZVWFmdlRPc29EUU11ZDlYNEx5Sm8wN20xNExaTUlRZEVKUE14?=
 =?utf-8?B?TEM4UXIwMkZxKzQxSWw1TE9CdjJPRldWU3ZaSnFiU2pwOTNKUUlzakN3UmtU?=
 =?utf-8?B?RGhxTytHbDMxSWU5NWhyS3poYTY2Q0RpcVFJZkJGREdIN29kL21DR0owejJz?=
 =?utf-8?B?VjdJQ0wvTXMxMHUvT2pRZlE0SVpoSXUvWjM1YUtrUldxbEtyTUJoc1JrMEk5?=
 =?utf-8?B?WEp6MWUrdXFjTFpod1dVUGJ0R0dKTktGQjJ4RnBuSXAzNlRHbG9Dem50N05N?=
 =?utf-8?B?V1FFZFZiYjI1Z0VPY20rMjFwUERVcjRIVTlIUVpUVStLMTMrWGZUVjVSbWhR?=
 =?utf-8?B?LzhtMDZSZGNnekM5UkI5bzExSmFIZWI5aDl0WVBkM3NTMlJvVWJWejRQbjhM?=
 =?utf-8?Q?hlxhOcY6SuSQX3sVqKt72Lwh7UlmR8SK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YklFb1B2dVRQRk43QnFFVEVJcmozd1JJVmdlMCtiMjJ4UnovSjVuTGRwd2Jo?=
 =?utf-8?B?eEQ0czNOWGJZcitBK0xPV25FVTR6ZUV0MHM0QlZBSGZ5N0lDSHFXK05od0Nr?=
 =?utf-8?B?dUU3MjZHbGFUcmZ4WEljaUlWNmZsaSt2VS90bUtVbzg0U01xbWpkZmVNeng0?=
 =?utf-8?B?OFUyOU5oTVFrc3JTWFI4TkNKMVFGSWtkdWdLV1kzajJNaFlsV2VxUjNOaUR6?=
 =?utf-8?B?eUdzbFJOeER1cURTLzRaVnVFRERrMi9KRzhhQjhmWXJSRVZ5ZWFYclIySVIy?=
 =?utf-8?B?VWo3UUFqcXdGSjNiMGZQdWY0UHlCbmxvci96Q2pmRlNsNHpzdlpwTkFldWRv?=
 =?utf-8?B?K2J4RzlXZTQyN1Y0L2JjdEI1M3Z4SUNtcDF6SVU5bUg3TWNHem40ZGhYcnRy?=
 =?utf-8?B?VllnV2EwOVpZbEF2all6dkdpY2Q4TUQ5cDlULzdIWjgxSENRQ3FZNHptSktl?=
 =?utf-8?B?TkhjYUFvam8vS3JoK25wVkpFS2xHSUppT1c5MEYrMms0SHJYWDMwMWFCZnNr?=
 =?utf-8?B?dUZSZC9IQm1xdXBVa3N1RGtlZTVJK0dqYUJJTjNRSUR2QXlsT1pmaWVrSVVX?=
 =?utf-8?B?d1VKQVQ3aGZKbnRHeGp3V01HTjI5U2d5emFOenNnNFBaVi9WOExRQmtNUWsz?=
 =?utf-8?B?UWoxMlNoZ0phN2RneVo4U3VJeXZUL2hyb1NjR3dVUzYvaGdjZzBpWTlxQjcw?=
 =?utf-8?B?aVdjczFaVUxqaGVIWUNseW9ldkpnYXloRmZXVVp2K3pyMkxMTVZDczAwVk9n?=
 =?utf-8?B?d1NSNXVJZVhKQXhLSmRiaEZhcHJIY3I1WXcwWXdTZXlBWGRmU1hjQzRZYVZV?=
 =?utf-8?B?czVJT0ZBeXJ5amVxQzhsYWpwNnFpWVFRSUdJV1hTa3EyRjlYZm1ZU2pMV3BX?=
 =?utf-8?B?emUvenNzRjY2LzhKTWhWVnVHNTZXNnpCbm5zQXc5VHVXTmtPcjRvc3ZldXkw?=
 =?utf-8?B?YTVsYzhhemNQc3U5NlhUTWxLcUdUdVIwZUx0QjduNldwUG5ZL3dZYVhVZVhQ?=
 =?utf-8?B?aXJ4TkdLaG44bEJzL3FudmNlVmJ3TWU2ZWdTb2h4clBHOVJjangxdU9KV3lv?=
 =?utf-8?B?QnFsUjg1T2duVDRpOXJmY0JHL01xcDl6eVI5V3BuUkN6Mlhqck9SK0M0eW5q?=
 =?utf-8?B?YVhXZlJJTjdZUmdsZ1R3Q0ZvNTVNbmZELzBGMThISytodDVhbkpndFBOTUVw?=
 =?utf-8?B?a1YwekZJeDRLRmxmb08wT2Erc0tIN3poRW9CMEhWbmZjVWZJWGc3eURxYWRp?=
 =?utf-8?B?QUxZdGxoS0NtRC84UWJlcTFaUGNoOVR4ZnF0OWgwZkprbE9BczlrR3FWUVFk?=
 =?utf-8?B?a2ZDUGdnMTdITSs0eUswK1ZIdnFkNzByVHVJU0ltcmMyVDZTek9xSlVHd0tX?=
 =?utf-8?B?eXovTFhKbEs5TEduMEY2NnRaVWN5bk9oTGVhSXluZWN1NTVUVVRzc3lFV2lB?=
 =?utf-8?B?b1Z5dnY1OGdWMmIwWFliYXN5YjYrSUhrcUlTMi9KUEFCcTVZSjNPVVRrNTRt?=
 =?utf-8?B?VlJpZVZWV3VlQ3JicHFwK3RwZnI3cnVhZ0g3RDN1K042R05ZUno1cUtsam9P?=
 =?utf-8?B?a295SS95d25wQVYxVmM0WE9samZKa0tRUzRNc0R2bkMxRXZxdmc4NUtDN3N4?=
 =?utf-8?B?VVVFZ0pEVFgrMzRMVXoybmtzS2dxWmpYd2tNR0poUTk4UGk5cnUvQ2NObFZL?=
 =?utf-8?B?M3J0ZkJTOUFhWWZSRGtsMWhmVUxwQ1VpdEoyanZHeUttV0Y4WllhSmE0VFNF?=
 =?utf-8?B?WWNzVmJrblZhUEloZTlVZ3NhQmdzSW1nWGNkR3BmSzRJeXR2ZU9Xa2RJV1Fy?=
 =?utf-8?B?QWc3ZWF0YVBYSlZQK1RobyswWXhQeXVSWEEzLys4T3p3MDF3T3B3M2FiYitQ?=
 =?utf-8?B?elhTQnpmQVU1Q1JnTnhnMUlHYnBlNjIxU0x6Z0xRUzV6VUw3ZCtoZFIxa3o3?=
 =?utf-8?B?TjNQUzg3eWdmUjMyN0FCZlJlV1NRU2ZrdXdmUGFQTXNRMU1NZzZCSC81ZTNP?=
 =?utf-8?B?emlSODBKWnVOdWtMc1pPUmJua2lzSVRMdDQ5SHVKNzZ6Z3Q2bzl5UXk2cC9l?=
 =?utf-8?B?N2xaSExGVjFwUkJXVjFjVzkxc3BSV3Noc3NURnNYeTROQk8xZ2pnOWVua3E5?=
 =?utf-8?B?d2ZZamg3RWx1aHRlc3Fzd0NpOEI4dEVUWkRaTVhBM2o4WHZhZEN3OXFhampw?=
 =?utf-8?B?NVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7297b279-f5e4-48c1-ea4b-08de3d6e6851
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 13:15:54.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDiVBuaX3rXairo9OI9jTP89BparykdoqW3emiv/jXzjMwhRHLzwFtyS4WqQf2pJ+D7lqNNiNS5CAUsx4KDBJF0e2dlRbf5eXCH9GNYez1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=6942ad0e cx=c_pps
 a=23BBZRleo/1KOgyGqX6yRw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Mc-j2tg_6zhrbejeuowA:9
 a=yXtbLYCiTTtTT2qJ:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: ESN7qvmd1PNNXOQBmh0q1d4OwWH3Mgy1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMiBTYWx0ZWRfX/C2+eMCxtev6
 OjZsWFVQTm9iK/UPdWCcEXPOP/7EeNFBINspdXnaYt0ejsGIQa+brBYJsG4YldYUuv/8xmbb7hP
 KL5sudpQCtMeo8wmFvgeAfVVt1veDALdcLbYFiojnmMJ1OjFQ40QdQrBCk0Sl8qtw3GbPKMbqyp
 f14bSfK9LdWYMaVfXRfiY+r9TuQIICAE/GetT18N7Gs2JdsX6NkCI/j4ptZTlV5WcNoJ4yXqYlA
 wtnwysf/ZGMQnF5Wfaa5gzo9PYHydL3oZNSf3WDjbk0KJYw1T8Lpnlmg2BvZpl11JNcpOZVyKMV
 z5oIDAd8nExX3OWti1GhRtEqFLAQUhk0qQ7lhl2nVi5y7wxSHtA2rM7/QxhvgawxbvwfJj/laTY
 nrkNWTngy/w25OTYs/DA6J/LaOUeMA==
X-Proofpoint-ORIG-GUID: crR_ruO8uzNKyCjq2MwO3DDA8C7lHYnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170102
Content-Type: multipart/alternative;
 boundary="------------0pb0KSKTUn06wezAWeb2pSy2"
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228042

--------------0pb0KSKTUn06wezAWeb2pSy2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BH535iq1076109

Sorry for the late response... I=E2=80=99m working this week on a selftes=
t for=20
the case fixed by this patch.

Meanwhile, I was focused on another aspect related to this patch. Our=20
client reported different behavior when copying complex directory=20
structures onto a WIC image using different servers.

It appears that the issue is related to the debugfs=C2=A0version=20
(e2fsprogs=C2=A0package).
On Ubuntu 24.04 with e2fsprogs 4.17, all files are copied correctly,=20
while on Ubuntu 20.04 with e2fsprogs 1.45, the copy operation fails to=20
copy all files and does not create all directories. This failure is=20
silent, with no error reported by debugfs.

I tried several approaches to solve this (splitting the command list in=20
max 100 instances and calling debugfs 1.45 multiple times), but without=20
success.
For our client, we decided to add a debugfs=C2=A0version check in wic cod=
e=20
and to add a warning if the version is < 1.47.
On those specific servers, they will use wic=C2=A0with the=20
-n/--native-sysroot=C2=A0option, pointing to a scarthgap SDK that contain=
s=20
1.47 version of the e2fsprogs=C2=A0package.

How should we handle this exception? This was fixed in newer debugfs=20
version, but should we add a debugfs=C2=A0version warning when broken ver=
sion=20
of debugfs is used on host?

Regards,
Daniel
------------------------------------------------------------------------
*From:* Ross Burton <Ross.Burton@arm.com>
*Sent:* Monday, October 6, 2025 11:08 PM
*To:* Dragomir, Daniel <Daniel.Dragomir@windriver.com>
*Cc:* openembedded-core@lists.openembedded.org=20
<openembedded-core@lists.openembedded.org>
*Subject:* Re: [OE-core][PATCH] wic/engine: fix copying directories into=20
wic image with ext* partition
CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender=20
and know the content is safe.

On 3 Oct 2025, at 21:31, Dragomir, Daniel via lists.openembedded.org=20
<daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
 >
 > wic uses debugfs to write on ext* partitions, but debugfs can only
 > write to the current working directory and it cannot copy complete
 > directory trees. Running 'wic ls' on a copied directory show this:
 >=C2=A0=C2=A0=C2=A0 -l: Ext2 inode is not a directory
 >
 > Fix this by creating a command list for debugfs (-f parameter) when
 > recursive parsing the host directory in order to create a similar
 > directory structure (mkdir) and copy files (write) on each level
 > into the destination directory from the wic's ext* partition.

This is great, but could you please add a test case to the wic selftests=20
to exercise this and ensure it doesn=E2=80=99t break in the future?

Thanks,
Ross

--------------0pb0KSKTUn06wezAWeb2pSy2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BH535iq1076109

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
    <style type=3D"text/css" style=3D"display:none;">P {margin-top:0;marg=
in-bottom:0;}</style>
  </head>
  <body dir=3D"ltr">
    <div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&qu=
ot;, &quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">Sorry
      for the late response... I=E2=80=99m working this week on a selftes=
t for
      the case fixed by this patch.
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        <br>
      </div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        Meanwhile, I was focused on another aspect related to this
        patch. Our client reported different behavior when copying
        complex directory structures onto a WIC image using different
        servers.</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        <br>
      </div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        It appears that the issue is related to the debugfs&nbsp;version
        (e2fsprogs&nbsp;package).&nbsp;</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">On Ubuntu 24.04 wi=
th e2fsprogs 4.17, all
        files are copied correctly, while on Ubuntu 20.04 with e2fsprogs
        1.45, the copy operation fails to copy all files and does not
        create all directories. This failure is silent, with no error
        reported by debugfs.</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        <br>
      </div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        I tried several approaches to solve this (splitting the command
        list in max 100 instances and calling debugfs 1.45 multiple
        times), but without success.&nbsp;</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">For our client, we=
 decided to add a
        debugfs&nbsp;version check in wic code and to add a warning if th=
e
        version is &lt; 1.47.&nbsp;</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">On those specific =
servers, they will use
        wic&nbsp;with the -n/--native-sysroot&nbsp;option, pointing to a =
scarthgap
        SDK that contains 1.47 version of the e2fsprogs&nbsp;package.</di=
v>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof"><br>
      </div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">How should we hand=
le this exception? This
        was fixed in newer debugfs version, but should we add a
        debugfs&nbsp;version warning when broken version of debugfs is us=
ed
        on host?</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        <br>
      </div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
        Regards,</div>
      <div style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
        Daniel</div>
    </div>
    <hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
    <div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" =
face=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Ross
        Burton <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Ross.Bur=
ton@arm.com">&lt;Ross.Burton@arm.com&gt;</a><br>
        <b>Sent:</b> Monday, October 6, 2025 11:08 PM<br>
        <b>To:</b> Dragomir, Daniel
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Daniel.Dragomir=
@windriver.com">&lt;Daniel.Dragomir@windriver.com&gt;</a><br>
        <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:o=
penembedded-core@lists.openembedded.org">openembedded-core@lists.openembe=
dded.org</a>
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openembedded-co=
re@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&g=
t;</a><br>
        <b>Subject:</b> Re: [OE-core][PATCH] wic/engine: fix copying
        directories into wic image with ext* partition</font>
      <div>&nbsp;</div>
    </div>
    <div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size=
:11pt;">
          <div class=3D"PlainText">CAUTION: This email comes from a non
            Wind River email account!<br>
            Do not click links or open attachments unless you recognize
            the sender and know the content is safe.<br>
            <br>
            On 3 Oct 2025, at 21:31, Dragomir, Daniel via
            lists.openembedded.org
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:daniel.drag=
omir=3Dwindriver.com@lists.openembedded.org">&lt;daniel.dragomir=3Dwindri=
ver.com@lists.openembedded.org&gt;</a>
            wrote:<br>
            &gt;<br>
            &gt; wic uses debugfs to write on ext* partitions, but
            debugfs can only<br>
            &gt; write to the current working directory and it cannot
            copy complete<br>
            &gt; directory trees. Running 'wic ls' on a copied directory
            show this:<br>
            &gt;&nbsp;&nbsp;&nbsp; -l: Ext2 inode is not a directory<br>
            &gt;<br>
            &gt; Fix this by creating a command list for debugfs (-f
            parameter) when<br>
            &gt; recursive parsing the host directory in order to create
            a similar<br>
            &gt; directory structure (mkdir) and copy files (write) on
            each level<br>
            &gt; into the destination directory from the wic's ext*
            partition.<br>
            <br>
            This is great, but could you please add a test case to the
            wic selftests to exercise this and ensure it doesn=E2=80=99t =
break
            in the future?<br>
            <br>
            Thanks,<br>
            Ross<br>
          </div>
        </span></font></div>
  </body>
</html>

--------------0pb0KSKTUn06wezAWeb2pSy2--

