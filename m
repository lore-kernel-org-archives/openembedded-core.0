Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8587C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:37:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1464.1750232217275891733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ca7d46=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I64HCj029352
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:36:56 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkkyt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:36:56 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55I7XwPo032033
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 00:36:56 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkkyt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 00:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hheHmUtdu5/i4Rgi8ozAyu2K1+wnHXWgTgofCosg6li7cJCUsNpAJPBeAGIuwW74ZN+MULWFWeH8uIRCfMTQIZacKPIanlsZhIqPobQwVsPJRZMh/KDvaUUyzad8K4MdMHpWZaMkr6vPJ/IuZNffZBXQZIQQyJL7OIREOX9nmKohIT6UMQzmenHj3ogGAD5sPwLHJMGt2QCNLWFzebf+Z1M7QG1jWGPFznnRJbCRYVaJCxjcitzanwqbG79q/wtkollANVKxHc6Fyuw3czFg8prsaNtYqC6HqpWuoJbekrYQSR1rFoAyFtgdvwHDAzPokmuK8kfMOlsD9d2aHbv2Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le1EFSXBiFFMS/6LyQOh2ocMBI3RiWrYQv8wKc8eCx0=;
 b=O0hfu2RURQt+QKUtDpJZ/l54tcvQKMnzoIbK4SPM6lMD1gfnFMNdTWgK15tVi0MtoVxHA9yqhYglqfjm9bXxfqE7zClirND8hsCHPsgNbpkgdEUQtlQZ6xZZioJ2+U9aG5qbFePGTW0pe9Bbo3gae7QecjUFUcd6Mu2UiYp33QxfxVgfF587zkbooGnia8N3f6oTDMwYGm5wBiCKAnvcvp7J9qkXTaqdtAUMyYszfEFB9eOEXanmIE43saMNCnJsThrGM9lRb9OtWz0JKjl4GZxcHy2EwaiSBq+7MFEV5eWl9xjcxiTnBlNdvI4uBj2vV1F7xxFM7fqz5jIzQ2UiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6711.namprd11.prod.outlook.com (2603:10b6:806:25b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.18; Wed, 18 Jun
 2025 07:36:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:36:53 +0000
Message-ID: <af5e4d92-5144-4c26-ac56-423c2fa5286f@windriver.com>
Date: Wed, 18 Jun 2025 15:36:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to
 systemd_255.21
To: Gyorgy Sarvari <skandigraun@gmail.com>, steve@sakoman.com,
        openembedded-core@lists.openembedded.org
References: <cover.1750176125.git.steve@sakoman.com>
 <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
 <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com>
 <582ab22a-f015-4611-b1d5-3c2c624585a1@windriver.com>
 <9470af8d-87e5-40bc-a79d-cddbf58c92ca@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <9470af8d-87e5-40bc-a79d-cddbf58c92ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ead406-dac0-47bd-9f05-08ddae3ae4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dlgyZFErcTJ1RXg5V29HL2FhWUFRMThWdXJyK2ZlRno2RkgydkU0dEo1MDFj?=
 =?utf-8?B?bGJNZ3I2bWRYNnN0RTJ6S29uZWp5NHpaTmMzTzlqNmFqMHJWbElTTlFRT3dt?=
 =?utf-8?B?Vnh2OXpQaURtNFJjd2Q4WEZxWUZjQXVuYkF3RkE1MVZPUXJzbXcyMDMyTERB?=
 =?utf-8?B?UjlOOFNsQ3BUNTZ6Y2FrUzFvbDUrUUZrL2VwKzZQQ1R0OWN5SnRsTzRucDNh?=
 =?utf-8?B?KzBqQ25CTE1VbFcyNkloNW9DczZ5OFB6bzFjZGdWTDdoTGtuWnlOWGRUaTR6?=
 =?utf-8?B?b05pTzdjM2hyK3Y3cU5Xa2I3RkxPQzJSQ2hDbDh3Y1RzNTdTVk5Gd2ZkOWdR?=
 =?utf-8?B?U0ZsT2xHTElPK3VGV0hjYVczdGFsWTA5ZHBPRmJEMDNPUG9va0dsQ1kveUEv?=
 =?utf-8?B?d1kvNnpRcEt5ZmJ6QmlGayt4UlZLTTRHLzBHUm0rL3gzdWVRRmQ5N3c4RmtJ?=
 =?utf-8?B?N2QzRnZzOFF4OFBlTVhlTUVVOTV1aS9LNFgxM2R3MmI5S2tISGRZdGJaNEpz?=
 =?utf-8?B?UzVQNWRjRi9uMlRqbkRjek9hSmI4cmZlR3V1dE5IMy9rb01sOXBlYzlicW1l?=
 =?utf-8?B?RDRWZEJUajVEMTNaRGxZR1NmZUVjOXhEWnk3NktoM3htNFlhMmZsUi9vSmZw?=
 =?utf-8?B?Um1RK21YU0NmVnEzZG4rVUN1cHduWkVLNE5meCt1WTN0K3ZidXpEdVhxZ044?=
 =?utf-8?B?VzN4SHdybGNYa005bmJxV3BEUWdHTWFYYmU5aU5Kd2lzK0YxSlBkbnFQMCt1?=
 =?utf-8?B?aWIrY3ZBeG5WWFlIWVluSnZ1SDZVcnJRT2tLSmYwMmthelovU1puQmN0UmVL?=
 =?utf-8?B?T0NhM1U2Vjl6cGVLUzhRcVYwR2FwS3RCV08xTTE5YXlwQ201Nm8wL2hlc1RV?=
 =?utf-8?B?NHhWSWhhd3VTMmltYWpNdm5raE0ydEJydHVBSmtQaDJwZlFHREw4Nnl2V1BI?=
 =?utf-8?B?YlY2N2dUazkrZ3czTysvUVBveDVBaVVvOFJTMEZVTVdwUDk3Y3lEMWlha2sv?=
 =?utf-8?B?b1JKZXBsbCtqWVhYRGRrSFVaaDJxa09aRU55ZmttVkYvTTRoTmhGVHdlNTdP?=
 =?utf-8?B?cUpYVXRldVgwNXNIUlRBZFNJZ05XWEFrSWI3VjN0TmhLTGVpMXY2WWtYQllr?=
 =?utf-8?B?cS95a0dnbGJSVnBSUlpSSDNUN3V1OW4yV2JxOGRZQWpVOW54RVY0TTNnYVZl?=
 =?utf-8?B?eC9rWGkyeEM3WlU4NU9jZ2xvOFEyaUpuTTVJOUZScGdLbnF2bCtqVy8wM0Ur?=
 =?utf-8?B?aGlLR1JidDZDMUo3TGZISGlhVGt6T1NBRFMxOFA1U1VlTFBSU21lVUF6MC9x?=
 =?utf-8?B?YnlkcUZLZzMyY21FN2t3ZzhldWg1YlZpZkxEOXN1WUpNYmhsUThRKzZrL0h5?=
 =?utf-8?B?WmZpWlJLQ3JuZzJkSWQ3Unc1ZkV6TDNaTzBxejBtb21LMmh2dFI0dkk5UUtz?=
 =?utf-8?B?QmY0VVhDVWlCemRoR21Iei8raytnRTBFa0pwNzVaUUhaZFJoV1dDYUJzdk1z?=
 =?utf-8?B?ZXJlZFArTTYxVVAvejF0RFpIYkJVaTNML3BnNnRwVjZxWkNmWElsZnFBZnIw?=
 =?utf-8?B?R0Vrd25HT1ZHalI0MXZHQlZnRCtMQWV6eDhvQ2VkdUlqdDB2RlJORlYrQytv?=
 =?utf-8?B?dzg0TWp5OURreWNYRnBqeU55cFRhWkhwSkxXZDk3ZS9RbTMvNDZQQit5RWpq?=
 =?utf-8?B?UVg0RGZBdGZFUFlpZ2J4bjRoN3FUUUk2VTgxL3QwbXUrUHNTUERTR210cE9q?=
 =?utf-8?B?cE5zNHlIckpqWExCRHQwYy9oRzQ4RU00OG41MVJZSU56UVlwbDRSWklLTFFa?=
 =?utf-8?B?d01QUkUvbFFWaG12REM5UGdXVDlHL0FXaG1Qa1lCajZueVJxODZJSktndDNN?=
 =?utf-8?Q?B4/o063Ei9hht?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTE1OWh6MXJNSHhuSmtpUmN3QUZTbGNSVmZlRHZMVVN5SmI5aU9IdUFJbEZH?=
 =?utf-8?B?V1VTRFlMTWpYSDdTSEpBeW56ZzlmVmFvZXpoODJGQU9oQnFPblhyRy9IRXB1?=
 =?utf-8?B?OTIxbWlHT3JiWU81YlZLLzJNRXB5UjY4ZjJGbnkxYnBtM2wwOHBzNVZoSSsz?=
 =?utf-8?B?RDdEUmJDT3BvWFh2SmtyMUd6M3poWWxNUnJMRnl4QVZEaGE4azNTMmt0UWdM?=
 =?utf-8?B?YTRHMkJmQkZJaUVjakF5UHVsakZDYURPcjl1dERROEpES0djZ3BqMXJQbENH?=
 =?utf-8?B?bmxKdVFwNysyeHMyRzJHb25kUVNTcG5xeWcwYWtPUTlyTmp5Q21MTWNFc2hI?=
 =?utf-8?B?NDVRQUVhRm9hb0FmS1BYOFRHL3JHclFmT1NZMUxKRkxobDNjRnpFRmpYcTkv?=
 =?utf-8?B?SXRmVnRMRXFTT2o4QjR6a01nc2ExUTI2U3ZST3EzUnJySkFKeTk2S2p1WC9Q?=
 =?utf-8?B?R01ZWnNtWTBWbmVBemRGZUE0SHppMHR4WXNXbERDZ2puU2xTYzZKa0ZyTUU3?=
 =?utf-8?B?ZXBYd0JUY3orWDRmOFVEOU9FMkZQNkhPQ0xzSS9YVjVmRzJHeXp0N1ZZTlh3?=
 =?utf-8?B?TGNFYTg2a2hieE1lTVFoR1QyNm40d3BLTURPcisvSmwwb1FlQzJyQmJ0TDhB?=
 =?utf-8?B?TVRaOFhrTC9LeG1ObnVKY1VTWE1zdmxGVE1aKysvVFp4bzRMTkRndEx6eXc1?=
 =?utf-8?B?akR3b0ExbDNFN0YwSkJiM0NlMlY0U0p5WmRtNmxQNHZ2OU1mUU5hQys3VFRF?=
 =?utf-8?B?Q0I4SXBoR2N5ZTU1NUlWZnNyeExSZUVWM0pqOVZUVnFkKy9ESWovaEFlYzd6?=
 =?utf-8?B?bDg1MDZncU5MdVMvNGkwMytrS3lzdTc5TzMrdlN5d1ZhaFpzMjlzRjFMakhH?=
 =?utf-8?B?MzltZ3NoSW5oTWVNMXRsclBvR3lla0RhZWtoSEg5SGhHSnN5V2ptM043dG4v?=
 =?utf-8?B?blZSRWt4OTVjWjVnbHFwWVdXb3NleDh3RitCYTFRSFhlMTF4S1dQUXNwb0xJ?=
 =?utf-8?B?ekZ5d0d2M0NCV2dnUWh1U0FvMWo2Y3hKWmN2ZGRTOE9lTTNNTnBYUWpIKzdr?=
 =?utf-8?B?a0RaSmhoWkdEZ2d1NEFZTU84d2NyLzN4MDlLVmZIOUMxVUdnNVNpcWM2SUZ5?=
 =?utf-8?B?OENlNlhwNnlVanVxL2ZQWWp4d0dhdkpvRG5IZjdQeFlWNmoxam9LVlBXSUZj?=
 =?utf-8?B?VVh0d1UxS29ZbzVINW5sTnlOWEdUSlA0aEsrcGlYNFU4anBiUDhXZ2h1TWdS?=
 =?utf-8?B?eHRoUnNjWGpNclh1dTlKVzZwMWxnMkFTYUZua0RWQXNodHZMY0dTMjdJUHcy?=
 =?utf-8?B?TTNsUDVsTUJwenFxUXpJcFdISzhhUnU2RkU1aHJFdDlsS3VDTE13SlJDQ2tj?=
 =?utf-8?B?b0pkWVcrbjRXQXhOYVo5M2R3UzRob2E3T3YxRy9RM3JaSzFYTzBKbURoNVBH?=
 =?utf-8?B?VzFaaTdvcUU1dXduc1hjQ1VESUFUNldpNmxHVWxtUEM5bUpWeEJ6c1U5NHYw?=
 =?utf-8?B?VmFKVGZEOTh3cnN6cmR2akhkK3pQdHYzTzArM3NGeWV4eDhRUlNPeWt3bU9S?=
 =?utf-8?B?SXBneEg1d0ZGd1Vvb3pRQ2Jvc3RKcjYxWEhlQVRSckFTUnd5MHlTL0Z1NzZm?=
 =?utf-8?B?WTR1U0NHbmlDeEZiRUcrTzA1d3Y2VlI0a09FRjRlVkxBS01nSmFLQkdkVVRF?=
 =?utf-8?B?K01OOWZYZUFmS3RNMTRaOEJrSWpsdVJtYTJIY2V6L1BiWjd4eFI5UGZDTEYw?=
 =?utf-8?B?bXFsNW1qQ1IybmRvMXp4VHBsb2lHbDk3QklmS1ZPdGd3Q1liQi80bTF5S054?=
 =?utf-8?B?bkQvSWNrdTdITkQ3dDlNT1R0YzNDTlNWZlhxMkxGVEw4R3lPejhwZUdGQWNC?=
 =?utf-8?B?ZmYwQ0hHRlphdGRoZ1JER0sxSUxWZmdkTU5FTE10cThOZjAwMWROMDVaNENh?=
 =?utf-8?B?SUNBelJpdDN4ZHlwUi93U1Q2ZkxmM1RnWnIwRlVBbXEwMzg0bmx0eHlEWlVv?=
 =?utf-8?B?RGh2QW8zY2pWVjhLRDZzYStpbC9sQTk2K0J2WThVL3hEWVoxcXB0SU9GbTJw?=
 =?utf-8?B?RWJGSUZDajJUMTEvVXdXMWsrdTc5TUdvRXhLTG02VUZhdG5LSUJLK3haV2U2?=
 =?utf-8?Q?1480Pan23Zp4H95JfTSs5Ua3P?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ead406-dac0-47bd-9f05-08ddae3ae4d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:36:52.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bh6xbAhg4dlE23fjdoVKjlunheA1GAMRYVKdUxVZMucTItglaPQDOYP+xj7SNX/qCiJrYNWatjkiqvcCRCtupA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6711
X-Proofpoint-GUID: nqJiEiXvcy7EEDiphlpYFDZilN8iezrN
X-Proofpoint-ORIG-GUID: zypExqwI2IbySCIURQgTSgaCR6LE0YGZ
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=68526c98 cx=c_pps a=8S/DJttheiBikGf6adc0sA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=_enOPnqeAAAA:8 a=t7CeM3EgAAAA:8 a=pzLhWafms7BO4eySDAAA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=XAbD3I9PDrnSMThV5XoS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2NCBTYWx0ZWRfXwa0KMXNThqfb Wx/lQh5Ni7/9wbgMyHRXDNdXBFkgiG8zogejcgy6noXo1vZEr58DNYSgeY63x3Jh553c1NyiXnh Ibd/FE2F+d+pyWkRrVxaHQFNizeE74ZhF0tPW+qpmrHglaTcLiHkybYtu6WLi4YfGbPsvFlYyG1
 mb2nZ+tBjTq0q8Fu1/cH4HLcBMr/GORhx24fAfJP8wryDASwvhqND6/kKPh0TxaK8qMYJ6eCiIC RWcJvW45A6FnYX5lvs2zs9GiRu34/f5vwplOS6wG8lg4lzBAWz1+TN4tsj9mIHpNB5q2gT+7Uv3 4Atxe4e/EGDTDUyY/ZfvtGSZx9zzSGNfQDNdVdWnbMI4AI/4+eEA2YNWvJzluKFK5avxBH14ure
 9gH0vGQvPuNvDoLRcZIaSdkoG60nPby1sGRsFS26DrjTF/IWOS7tFlC1gfQzqn5KzkRvCNlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=928 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218974

On 6/18/25 15:29, Gyorgy Sarvari wrote:
> On 6/18/25 09:24, ChenQi wrote:
>> The author's V1 patch bumped PE.
>> I replied to that patch, asking the author to not bump PE.
>> My reason is that we'll need to bump PE in later releases too
>> (walnascar, master) if we bump PE in scarthgap.
> My main question would be if bumping PE is worse than breaking this
> recipe in this release. Maybe it is - I just didn't see much discussions
> over this.

Luckily, the commit that introduced this issue was not released yet.

poky [2][0] $ git describe --contains 417cecf76b
fatal: cannot describe '417cecf76b91f58a61e8cc9e4bc57ddda87aac58'

poky [2][0] $ git log --oneline scarthgap-5.0.10..417cecf76b | wc -l
31

Regards,
Qi

>
>> Regards,
>> Qi
>>
>> On 6/18/25 15:08, Gyorgy Sarvari via lists.openembedded.org wrote:
>>> On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
>>>> From: Savvas Etairidis <setairidis@gmail.com>
>>>>
>>>> The recipe was accidentally renamed with a 'v'
>>>> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>>>>
>>>> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>> ---
>>>>    .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
>>>>    1 file changed, 0 insertions(+), 0 deletions(-)
>>>>    rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)
>>>>
>>> Personally I'm not affected by this issue, and have no problem with this
>>> patch, but a few weeks ago there were people who were unhappy when a
>>> similar issue popped up in Walnascar with autoconf (though it was caught
>>> before merging), which makes me wonder if this is the way to go.
>>>
>>> Systemd already has a PE[1], exactly because of the same situation: "v"
>>> was removed from the start of ${PV} - maybe it's time to bump.
>>>
>>> Anyway, as this patch does no harm to me, this is not a complaint
>>> against it, but I thought it would be worth to mention it at least.
>>>
>>> [1]:
>>> https://git.yoctoproject.org/poky/commit/?id=f95bbe35b2aab929e50471db8ba50781d5027a01
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#218970): https://lists.openembedded.org/g/openembedded-core/message/218970
>>> Mute This Topic: https://lists.openembedded.org/mt/113692551/7304865
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


