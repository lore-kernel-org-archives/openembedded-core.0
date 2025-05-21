Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CE8C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 10:29:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7924.1747823365171248268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 03:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236ba3e52=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5THKo011938
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 03:29:24 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr96bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 03:29:24 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LATOcs011166;
	Wed, 21 May 2025 03:29:24 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfr96bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 03:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwYDZuK28bJ/9HfGTrS8h0e2keK4Rd6+CJo5l2+cTTrz8nBs6mk9o5KXA9KBxkH53aHEvKu/v/jb+rEJG+jkJVCXuaU9NP5Cefsv3cTBMAFLt79WyobhuawlRWHwIeHtN55Ov6Pg/NX1oMUFiuY4ttyRG2cdwG3PvPnJODglc+G3ebOxnpgC/JgNbinGShRpnjIBygBtO/2t/ZArl3MGdn/5V2znNO1vGYZTTcdY4S1x/FscTVL9avskrVYr9U8yzq84RRtWzXKsU9G1RHsLwwr0JKcWQPHVDW+p+2nCv8DnRuHqxHy+btSJEnehoAmw7XSNhmsuQTCyyZI/bOOSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9r0bWAVhWhS85F/9Nf90zB+TNVesi5zTReXwTuP9SI=;
 b=HeUkB76yocDp8l5w0qpUn6vsgGb/KnXd0IhJfl7UyAMuSh7CzpaT1UEMrxNL05XAaBP+iSfOXy9te4mGIMTx9YxphCwT7X+vERvCDAy6xwyrQmql6evckX40vTrQtvOv+0ZZ6I6ZXAN6dHUdCvx6qpc1EML4Q0xkdvUFjxPEMvwMOPqVh377NdSAa/a9jUfoBhGL3aH3yEapIhBkcf8ep9LAnXmEUeupjfqh3mXL+hVljxuNSacIObUUDp1UvomVyZZGdUTgWyQwE5TO2R9cgD8ZyeBhsVBdoVRN3zgFA0HtN3KKC6z80REYXn3isMEbsGmeIP6jtnk75PId5rObZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 10:29:19 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 10:29:19 +0000
Message-ID: <5e1efec5-8840-42ee-b745-a817a70678df@windriver.com>
Date: Wed, 21 May 2025 15:59:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: AArch64 - Fix strict-align
 cpymem/setmem
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, steve@sakoman.com
References: <20250521090916.974418-1-sundeep.kokkonda@windriver.com>
 <eb760092-3915-4133-8f19-c0b6b7dd6743@gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <eb760092-3915-4133-8f19-c0b6b7dd6743@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|DM4PR11MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 6867d534-1bd2-4ef6-6a06-08dd9852583e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|4022899009|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SUNiMTR0cVArcmtsMkE0R0hNZmNUNzltV3ZaZHYyL1RoaUpwZkZjMVEwNDJH?=
 =?utf-8?B?RmtDTFo4WDdVZlk0bTZKWHFjNjBXeFhDc3lCT1dUMzk0YlZNZmhFMXE5dHFY?=
 =?utf-8?B?eVFTVzNtT05xNjMxMHNkQlBvdWdISW1ubUt4UU1tOWRtT3hNOG9xUC9jQVdC?=
 =?utf-8?B?QU4yNGlCam56QmVqZHcxL3NBcjE1T2pLRXZoSDMwSm5INnl6VlFyRjhEd1VY?=
 =?utf-8?B?RE90TFk4M3BacnFQMlIyeVRRUENWSmZydVNZNG9WbE1aMVdJbUJZT2MyY2xD?=
 =?utf-8?B?MGFrOEp4bnd1TnVEN0E5QzRtTjZKR3NoMElIUXpvSXJYTEVTTXpIU0loMkRs?=
 =?utf-8?B?QVdBVnhYUzNmc0FNa2FuOTdBb1MwbWhXUVNocy9jdXJ3WUlid1BldVhQYmRG?=
 =?utf-8?B?elFrTFFQeUt4bEV4V2RWRnllVFlNVDdQN0xvUFdxS0JjdzhpYjlsMVZXNVNt?=
 =?utf-8?B?RFMzVmxNamF6U212dDZYRTlwMEw1bjdzSGFhSUhreWxENjlGK25FbW03dXhE?=
 =?utf-8?B?SWlndi9lWW9SUEZ4clA1RFllRFFUblVzYmk5dXhXcDNDS29aWGxWQkpuSWlD?=
 =?utf-8?B?dHBhSE9xSUlLQUZta2E4MXF2VUljZ2JKTTAwSFJtRVQweGJMOHhjeUJuVVpR?=
 =?utf-8?B?eWNIK2FKV2IzM3VMNERnZ0VVUnFoVDh1dlA3QndJbFV5Si8xekxyQnBNWkdS?=
 =?utf-8?B?V3ZxWS9ucTNCalBwM1lZS0c5UERGWkZ2NHppNmcxRHN3eUNYYW5HbUF5Z1BR?=
 =?utf-8?B?ZWk4Rk85MUFsSVE2VHE2U3o4U1pORzgyY3BCeUFRZUJ2STUxU0UzT3lZMHE3?=
 =?utf-8?B?aUtTOTF2Q1k4dkVHdTZ0NWhJT1UzSlRiYzhldzdia2lFRFlWOERNelpiU3Ry?=
 =?utf-8?B?WXlJd0QyZGpVQTFFN0F1dlEyK0Z3UUZIa05OTE5MTTQzUUYwMU81YUFDblZo?=
 =?utf-8?B?RzZmSkRjWXpoK2YvTVRkdTR4WjAxdVRkVGtqK0NIZVJkN2ZiSzIvYlB6a1Q3?=
 =?utf-8?B?OTFTRGN5SFJKRHFhblFBZldVVXh1c1hyWlpmTjZRVGdoUUNvbGJxNk1zU0I4?=
 =?utf-8?B?VW4rWTZjR1FwcnpEMmRFcytmc0RuNUdGWVVjbnJjZTFYdUNzWVVmUG81U1FE?=
 =?utf-8?B?Q2g1T0gzUThGQlFzODNTVTE2Z0VVSnFYSmc1dk9jcUtGWHBOL3JMTktxbUVm?=
 =?utf-8?B?QVluM3ZUcFUwR0RiVmtaYm5JUXl0Y1F3WWs5cVpDNVN0VEZyNG96eWQzQUxR?=
 =?utf-8?B?aG5ERU4xUHNUMDVQekE3cmttVlFDNnFGL3ZScDM4aGhNYXM4ZWd5bGMyTktF?=
 =?utf-8?B?NVphWFd5eG1HWXgyYy9mWkF2UjVqMTRYRS9uUnJxbm1wQmcxT1dudW5zMWxR?=
 =?utf-8?B?TmhqVUFLNmNlQVFZLzFxdTVsZ2hpbTRXeDJhRnQ2Y0NZejA4c2MvMDYwMUlR?=
 =?utf-8?B?TGtRR0YyenYzT1pHODBPb251U2g4OXpmWkw3MkMxUUpmNno5WnhPeCtTWFg2?=
 =?utf-8?B?RXNGcm9HMDBSTnNOVGczeTdYTzR3MWFOaUJydUM0blJnYU1QRDBUZE1DRC85?=
 =?utf-8?B?WFg1b21KbXIzdEFzQSs2bjhOZHlPTUo2S0UxY2ZwMDM5dXQzS3dyL2hPQjdZ?=
 =?utf-8?B?ejJ2VHVUdWVvS3ZUdE5UaTgzOGZjcmhTUGNWWkp4K0NoSGFVZzUvSjhreVd5?=
 =?utf-8?B?V1IrK1JkS2hBQUFNdm91UnJ4N0xHYzc2VnJhelJVcFJTMEJQQlU4ckdwejJT?=
 =?utf-8?B?b29XOFo4UWhxVWpLZi9hbnFNalZVcUR3WXpkQ21MR29zb1RPSWxsRUJHSDRi?=
 =?utf-8?B?Qzl3aTZidEM0L1lJZkJzZVhkb09yMWhCVjRjek55NHYxUm5WR2xWRE9GWU02?=
 =?utf-8?Q?Xiq1TS6pULm2E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(4022899009)(10070799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTNsZHRzQ3kzUjJZMWJlWDNYNENaNnBtV1pEWXJYTVBhSCtUazBmckxFRndx?=
 =?utf-8?B?UDMvckZGUjdWUWNRdHFOK3NLVnc1NUo2UXJlM0RSd1JtdFJNN2l4WVJkYlFs?=
 =?utf-8?B?bzVOQzE0QjdZV2xrUXJUL0lDTkt1bDBOZXd6VDUwa05KSXRJazBkVlNpNkth?=
 =?utf-8?B?RmY3anpqbjNKY3hmYVl0ZHUwak5xZHBxY2JUZE9jZ2J2aHBwUERjM1VwVEhv?=
 =?utf-8?B?cU83SE0veGpQSldZc0FWWUR5cWw4OWJ2bVdDU2wzQ2lwQ2hRZFBFMTZxbnpa?=
 =?utf-8?B?cGhVUVhZbmFoK0lwWC9rcW96cTQ5NTYrdGtIaXBnRnRCNVJYVmZMODdpNWg2?=
 =?utf-8?B?RitwWUIySjBGakk5dVVrSDVoQnJIUmxnRTMvU2puWlhpWEVBOVZZS2FORThh?=
 =?utf-8?B?emhpUW5ua3owSmRoc1piNVVXK2MrdFlYaWpzNUJta1IrNTFRdUdNTUdOb2Zi?=
 =?utf-8?B?WWliZ3pJTzZIWlgydHQ5L0JrdVFzTGFqVzNjT1ZoYWtTWlpkeEI3SlFNSm1C?=
 =?utf-8?B?czQ3VSt1TW10Ukd5NnpUNkp1QXY0MFJ4RkNuZGc3VFo2b1IyU3RKcWRLSDc1?=
 =?utf-8?B?YVlrZGN6Nm1DYWFXTkpZbldSTk5Hb2pSbEtiMlNwTDhKcEhBMS9VMmo2UVg4?=
 =?utf-8?B?b08xVmh2Y0lvNjBaWkx3blR2dGE2NmlIeEtsWmlENjVQSUhhY3FJa0sxU3Va?=
 =?utf-8?B?L3crdFNkYVI3Y20yN3dGOXg2eElxeXFMMHJzQWRQcFBTd3luRS9IZ2ZBeUxF?=
 =?utf-8?B?akpSNVBseUF3TFBXTGxFazRjcXl3NWl5WUpHUFZWYzYyelFwT1c5YTErZFVs?=
 =?utf-8?B?czVrWGlZN3o5bmNMQjdrQ1ZjTFJ4TzJKVHlzaDJBVnBWOFU3WDVyRGp1VGFq?=
 =?utf-8?B?M1ZTS2pjNVpDYTFLT2xiUzZ6RDR5cFlJQkRMcldwb0UrT3QzaDladGEvQnhK?=
 =?utf-8?B?VlR0WFB4NnhIbGI3T25rYW9MeXdjZWZPZU9mWkVaaGlMNW9PWUVDb0V4bVh3?=
 =?utf-8?B?bGQ4OUVsMGtKMGxjQmtpNnFiRDdlbytFNXpBRVg0ZEhpQ1dKN2FZQ0I4NDcv?=
 =?utf-8?B?WjlvaERINVBwSXRJUzVIOVlIMDMxdHBkSHNkcFNlK0p2WFVKV2JvZG51Slhl?=
 =?utf-8?B?Q0ppbkcvUDByZnRBSHBjK1lwa0gvNlVncThlV2dHdkpLUnQxRDZyamliei82?=
 =?utf-8?B?bEI5L01WMFUwbnNqVkJtUFJrRXNuUUhtS0RuYXBWNU9NWGtRYXFFNXBWVWZh?=
 =?utf-8?B?R254aVNSUGlncmlDY0lsMkhxTEt5R29lbEd2RkJ1Yk5qblV3N1I0NmlqNnJl?=
 =?utf-8?B?YmRleU9WSnBOTUk0bVk0ZEJFSXJrUXJsSEhXMHcreW16OG1MZW0zSWRPQTVL?=
 =?utf-8?B?MzJFQzBOa2xEVDc3M2VETTNPZ2I2VlJsb2lJV01Cbi81K2VvNmc5c3hOSkta?=
 =?utf-8?B?SzJUQWlTL1hUUHphSTJGUXNwazdQZlhDNTY1QXFTNDV1eHdtR0FqU1pma29C?=
 =?utf-8?B?dEdBTGcwQ1d5TjlheFNWbWpsOUp2ODYzWlFpRXo5ZXloTE5NdmN5a1RxOGk3?=
 =?utf-8?B?TUZFYXpEWHIybFV5bVVub0NFcFR0KzRMbG1hWDlHbE9hQTQ1OGliaVViRlZw?=
 =?utf-8?B?TVpvWllGUUl4YVpSZmNRZWR0NXR1VUtndGxnQ0d0cE5hUERxa1FndmJ0Tksx?=
 =?utf-8?B?VktXdDVWc2w3b29meWdRZ2FzdGJ6NGtMbWx2NWtLa0hGdWxIZ0NKZlZZRnJp?=
 =?utf-8?B?UkRNcU9BaVV3NkUvVzEzRitPdEd3Q2YzZ1B0dDBEeUJEbW1ZMElMSUxNYiti?=
 =?utf-8?B?V3N5d3FpWGpQYUhzdEpmMGNaUzk0eXhvVEFmWEE4QUwrSFJGU0ViakNMRUtH?=
 =?utf-8?B?ci9MZHMvbWQwdWxqMXpMN0tFMi9PRzV2RTN6dGlPU1RFcVR3Y3hyUlpSZm9X?=
 =?utf-8?B?Uk5tdk1JVnp4WjE1YjV5MXh5SFQzaXpRU1V3UlZyMnhkVEZaSndPeHdFK3Nq?=
 =?utf-8?B?cmc4TmJsQUhQRGM1T1NpVmhoNXZMWitFVnNMcTFPOTZVR1lkWkZNcjlVdVcy?=
 =?utf-8?B?OHNRTUxsT3dCWkcvMUU2V2t1SzlzSG9KNld4OHk4U3ZWeWNkdkVPY0pOaUtk?=
 =?utf-8?B?RkRBOW1rMGJIcm1nVDFKWTFHVEw4SDdKMjArOHo0cmlkbzZ5TnIxUWFKQ1NN?=
 =?utf-8?B?NklabVQ4UC8vL3hQNFlldVovRjhpYWlYbGlrUmIvbzYxM001eUlXdnMyMXhy?=
 =?utf-8?B?WXRMZkUrZ2FtajNEcjhuVTZLOTh3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6867d534-1bd2-4ef6-6a06-08dd9852583e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 10:29:19.4963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hm/TgGDpKxV5ssBYx2faB3cB6MNfe28X4Uh+BD3lMw51/+9Pw7U9umQwfaO/L/MZvp3ZJ9tgE6nhVFFwcXWgerj6w8Oi+ABZglkuBNR6xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwMyBTYWx0ZWRfX0hmAyOlzIYZH w1qiCQJPOl+GSUuo4T4L8aFg5vg4rPDAvZ2KvQCLlkoz/UHm6kZuZTrLOI2QIRtEskzGZvwOyU1 8DBIc9PLTegkEFIKWALpthh/qXb63jB57dfKuIoaN0m8Mn/EB5DC6/P01BQb+/Q3vO87c8vBAE1
 LHPMnIf+kcXgbUP1oYskvd+Za/oo6aQpw22YIMubF1mHqgkbSHOPZG65DOWptdc7D/Yjuum+s31 VvK3DV0xdSCR+kMzHiqTrv0nqKYLevrKBgH7o2dfHSnefKsPF0Hx9fuFuOwQUTqCqZC+G0lJrgp /DCr5GVZbR555GfazvvV41FYf5Kzh5N1jrwwgzFBqxN5Xal2koL8ipKxCOFxZyZtQny/LK+d35D
 asWACCINvtLJBpO6q2732VIwahCEEJNEvvXP8wQuYhpDKYDiG6yt6llsCuNdleN+cyNo+nW3
X-Proofpoint-ORIG-GUID: uZC3SVIeaA1y-Xw7-C4-1h3O6stuniq9
X-Proofpoint-GUID: IeWlLULBWHyh2MR9_gpMbMNzhNymB2WQ
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682dab04 cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8 a=A6QZHL7lTe7iegwvWKAA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217018


On 21-May-25 15:23, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 5/21/25 11:09, Sundeep KOKKONDA via lists.openembedded.org wrote:
>> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>
>> The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
>> Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
>> Clean up the condition when to use MOPS. (PR103100)
>>
>> Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
> Is this a partial backport of the commit?
> I wouldn't expect the backported patch to match the original 1-to-1, but
> the original commit also contains some changes of the machine
> description, which is missing from this patch. Is that not required?

The original commit was for gcc-12 and above and the gcc community is 
not going to do downward backport of the patch for gcc-11.

The original patch contains 'alignment part in .c' & .md file changes. 
The changes in machine description files (which are not mandatory as per 
the author) are causing some failures on other modules while building 
the image due to missing RTL instructions (gcc compiles successfully). 
So, I took only the alignment part of the patch. This cherrypicked patch 
& it's output correctness I get it verified with the patch author.


Thanks,

Sundeep K.

>> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
>>   ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
>> index f17ec9da5c..1e8371b2bd 100644
>> --- a/meta/recipes-devtools/gcc/gcc-11.5.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
>> @@ -60,6 +60,7 @@ SRC_URI = "\
>>              file://0029-Fix-install-path-of-linux64.h.patch \
>>              file://0030-rust-recursion-limit.patch \
>>              file://0031-gcc-sanitizers-fix.patch \
>> +           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
>>              file://0001-CVE-2021-42574.patch \
>>              file://0002-CVE-2021-42574.patch \
>>              file://0003-CVE-2021-42574.patch \
>> diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>> new file mode 100644
>> index 0000000000..4c2d827799
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>> @@ -0,0 +1,45 @@
>> +gcc: AArch64 - Fix strict-align cpymem/setmem
>> +
>> +The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
>> +Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
>> +Clean up the condition when to use MOPS.
>> +
>> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
>> +
>> +Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
>> +Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>> +---
>> +--- a/gcc/config/aarch64/aarch64.c   2025-05-08 20:40:10.969865898 -0700
>> ++++ b/gcc/config/aarch64/aarch64.c   2025-05-13 23:11:07.006796627 -0700
>> +@@ -23621,14 +23621,15 @@
>> +   int mode_bits;
>> +   rtx dst = operands[0];
>> +   rtx src = operands[1];
>> ++  unsigned align = UINTVAL (operands[3]);
>> +   rtx base;
>> +   machine_mode cur_mode = BLKmode;
>> +
>> +   /* Only expand fixed-size copies.  */
>> +-  if (!CONST_INT_P (operands[2]))
>> ++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
>> +     return false;
>> +
>> +-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
>> ++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
>> +
>> +   /* Inline up to 256 bytes when optimizing for speed.  */
>> +   unsigned HOST_WIDE_INT max_copy_size = 256;
>> +@@ -23750,11 +23751,12 @@
>> +   unsigned HOST_WIDE_INT len;
>> +   rtx dst = operands[0];
>> +   rtx val = operands[2], src;
>> ++  unsigned align = UINTVAL (operands[3]);
>> +   rtx base;
>> +   machine_mode cur_mode = BLKmode, next_mode;
>> +
>> +   /* We can't do anything smart if the amount to copy is not constant.  */
>> +-  if (!CONST_INT_P (operands[1]))
>> ++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
>> +     return false;
>> +
>> +   bool speed_p = !optimize_function_for_size_p (cfun);
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217009): https://lists.openembedded.org/g/openembedded-core/message/217009
>> Mute This Topic: https://lists.openembedded.org/mt/113226173/6084445
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

