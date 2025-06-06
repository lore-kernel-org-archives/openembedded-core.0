Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC1CC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27995.1749192631002547307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5566VDJN023069
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 23:50:30 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw2s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 23:50:30 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5566oTEb019233;
	Thu, 5 Jun 2025 23:50:29 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw2s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 23:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHl1R6UBxPeowEqwRVkAepjJZ4Pqo1DHhBXd0lrA5AN46hpNT3/E3rvORcGllmle1yg0jWDouWFjelHVvfCZZ6cimT898k1MhNkRTx+PiNcZx5txTqDikSU0jv8ilwjfgsWIhBY4U6C7qVFigM2oU2s0KcAl2ElKNMnO4PqM9q4vDKh7OyWmnbH0g7ygZ5Gbs4UAgm7wqFoHu1KdPbiPiDDEWGYc1O1kQ7jjVDF5rYX+FN7JRTcQkV+vAutZLLTwYzfM8rR4O+RFTLozkifa7KPUePbDCAGkBtvrkvHIKhDlrxOQv8Gl1fe9MXMzOIvZ0j5+dr4RSHbjARWMhpOZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dkq7po8FLa2p/UaiDKa7LpMqbZJ+uk14SRPzCqh84G4=;
 b=rmHNBQAbTjs/fMQcdTM9IjvOSlm7yru1IeX33kE28y+P0oyttaOBFTjLpdtatH58IWARJLW3S99++jpnOj6sgvfXjKed3ik7tZXUadtDR4F9q6QxEnnoWZaSUEpXdGtiBzcloHWIEbjeiLV1DoybT3BBBZgdaYhxHqjlTQIoFE/wXw3Sjh0muV3RSDbWx1Z8IGES7CV+z0o6LO6Tbqv/NG5dtVGgVBD3KEFiBzQJ+vNlOP5hLGUhaBwoZQOpIdtVAI4jhkgrHzDJ39HdWeEaCnhBSHS4+LPUpIdGqrvylVjJbn6ur6viceaKSkNMXPIO2FgNL4zOXw5cTXVct1sgYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV1PR11MB8851.namprd11.prod.outlook.com (2603:10b6:408:2b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Fri, 6 Jun
 2025 06:50:11 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 06:50:11 +0000
Content-Type: multipart/alternative;
 boundary="------------jMEyiuyPnjxkxzj9S0sBB2OK"
Message-ID: <5877eefc-007a-49c2-aadb-257536889df4@windriver.com>
Date: Fri, 6 Jun 2025 14:50:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2 00/14] fix several CVE for
 libsoup/libsoup-2.4
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250604113426.464818-1-changqing.li@windriver.com>
 <CAOSpxdaHeb0Etg6w4A8ZuYJo9u4TNA-rVSSpk45g7x1+EVb41w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAOSpxdaHeb0Etg6w4A8ZuYJo9u4TNA-rVSSpk45g7x1+EVb41w@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV1PR11MB8851:EE_
X-MS-Office365-Filtering-Correlation-Id: afa1242d-c507-45b7-b23a-08dda4c66237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WFNpc2hhUllxY1hxOFhhdWl2RW1GSVVWMjVXMGJsM3NMQkR4OTh2WVI2Ylgx?=
 =?utf-8?B?bVlXUFFNajA3cGpVS2dxTkdEdlJTT0tLWlZMTDI5RmJ5cHQxZk8vL2pKOTJx?=
 =?utf-8?B?U25HaWk0UmRLbHFwQTlNM3NWNGpXcXFYM1I4eEtaQ05wMXBLZEUwQ3EvdmlJ?=
 =?utf-8?B?QXd2SHVrQklEczNEOXFybTllalVZMGhWczhnTFdBUTRRYVJ3bmJaLzRVc0dF?=
 =?utf-8?B?Wmg4WTVQbXNlSGY4VEhMekdwcEp5a2NqUTNyd1NsNUxIaHFRb3V3Z2tqZlZK?=
 =?utf-8?B?NVhxUUN0L3ZMRDA2bzZHdGdheEFHNDJhekQvajAyd3ZmVDZNdTFpWkYrT25Z?=
 =?utf-8?B?TGJabkVFLzhsUFphK3lNdkc1Zmc5Z3IxYXFKNytJaFB6TSs1elg4eGd5RFpG?=
 =?utf-8?B?ZmZCUlBqWUp2UG5oRTVlaVkzUWtqTDFYZnFOQ016SlFod3VoMi92QUs4Y2hH?=
 =?utf-8?B?d3VGemxmNTVjYlNXc0dmbXFtQVlrT3pvWlQ0OG1kWHMrWCtHLzVsM1dEVDdN?=
 =?utf-8?B?cEdjanhDcDc5TGJhb3lSRXlvWXdKVFIzbDZJMWVYci9vQTJBQjNiSzNEZkt2?=
 =?utf-8?B?Zkk2dzRVWktnNG55aGt5VElMRUVkUVovUmlaL20rdDd4MXRCYTVhcGorQmhu?=
 =?utf-8?B?Wlh2NmdEVkEwRjV4WWJYVG1QamhKc2g4dEZSTGRLMHVjRVRPK2hrMWJUZDBT?=
 =?utf-8?B?OVN5VWtqamkzbEFCdjlJaFBBNitBeE9RdlppQjF6MHU0WmF6ajkvcjlNUDFt?=
 =?utf-8?B?RWx3QVpjQUZwOVhhTmdZRy9EVXJYOEUrQnpTaWtCQmtZeFZRMVBrTUdWbXFt?=
 =?utf-8?B?Q1k2djl3NXRUNDl0dm5wQW5FenVmWkdvRFZKM0pVYjN1S0wrcFZyTFNiVW1u?=
 =?utf-8?B?QjMreVpjbklmY0xjd3BOU2poRHgyQjJkcGZ3eUZ3SEpNZVlFNnR3L0loSnVZ?=
 =?utf-8?B?WkZIajNRUHMzZFZwWFg1NC9YUi9iQlZ6aVhhWXNzQVo4SDZWNzdUVmw1dExC?=
 =?utf-8?B?MGtKL0JEL1RCMWg3ZEFvbERaNW9STjB1eHBheFFHWkMzNzc5ZzYwSHJxUm9Z?=
 =?utf-8?B?U0lTN0VodDRLQlpRZ254UWVxdmQ0a1k5MFA0VFRKR0FkbmNsSWZ1Nk5WTVRm?=
 =?utf-8?B?Q3hoOVpJWEhtTWliKzlxcU5wMlBvc1BHZm9jVnRJU2J6dGdYenc2em1BSksz?=
 =?utf-8?B?ZjA2RkdkbTR2L01jK0pkbm1mQmZQMzJmN1VNZHNOLzBIaktqampTbXYrR0Ry?=
 =?utf-8?B?Z1FFSnNHWmZaYkh4UFBtMU9tekVQNHVTcFRRSlhRalR1TnUrMmI5UnZHc2tn?=
 =?utf-8?B?Q0syR1VqNWRSNFo5Rkp0cE9Nclg5bmlmVFVnS1RaSEdwcG95ME8zQ3ZjSVBt?=
 =?utf-8?B?eEhYSDRCMFdlMkJKcEhWU0prRzBtVkdydHYxVjdOMEY2UitNU3pnQ3pyMk82?=
 =?utf-8?B?bTFxNDl6dVlscTJwdXg5NWhvT05KcTdveU1KVm9XNEhNSHpSYXc1RUFxTlNj?=
 =?utf-8?B?eTlNdStGOUFkcUZkRkpvSkNSbzJ6OFd4YWgybjhjZjlPNVZhZE9qcHBXRFZY?=
 =?utf-8?B?V2RDbW4wcjVRQ0hYYmE2YjZ6dHFqOG9wNVVPSzlpWW1odjRHMHpSbXFzdkEr?=
 =?utf-8?B?MmxVa0dBWFIxeC9TMzl1NXpNWDd6RlQ1YzdLNlp3d0l2c1dtQmp3QlVpbFpJ?=
 =?utf-8?B?eU5YdTVlSXFyaXA2WmltVXgxRmo4WVJpeTA5Q2NFZFd0ang2L1ZNbHBRVnR6?=
 =?utf-8?B?aXJkSHdWMVU0bFprcGRRdDJhRmorNGplVVExMHREV3dIcEFQWFg3aUU4cFNB?=
 =?utf-8?B?UGJzNncxRnBNYTlXbksvbFVJYnB4SkFVcmI5c2owQ2NsZWY1NEwvZE5uSThU?=
 =?utf-8?Q?UUdkaNNBjUYKj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZUdwYXFGZ2t2Q285cDdheW5VQUErR1hiYlJwdVhZSkZmOUFPa2t6c2hPSGpo?=
 =?utf-8?B?NG9WY3EyaDJVK1g1QmJBVEVKQVJzVFMvMS9iNUdkK2JSSnFEOUNidXJlTkZY?=
 =?utf-8?B?a2YvVGVGZFY1elF1ZFhBSC9FTC96Qmo2WGxjYndWWW5QRnBVbEJ2Q0VNQ3hQ?=
 =?utf-8?B?QjVRUW90azJsZ3I5YkFRQUlZUlc0Y3ZzOFI3ZldmUmY0aXA5Z21yR1BIVk9W?=
 =?utf-8?B?ZFJEbDZ2NC9VaFVuMU56Zk1VemlYTFZOc3IxcEJuaWwrdis4VWdTdWZEU0Vp?=
 =?utf-8?B?MlZJOG9seGdNNEhITlVGUHQvMzlUUk9udTBLT3E2cHVNL0p5ZWNzaUtpaDRK?=
 =?utf-8?B?M1ZtR2Zpck5BSkdQWGdTdFFBcnMyYStFWk5sL1FzTTViZkZjMFZ0SEd3M1Bp?=
 =?utf-8?B?ZUNTbmU4RkdXbWwyNVlzaVhsY0tpaVZWbVNkSVI1V0xjTjRhdy9jLzVGWmF4?=
 =?utf-8?B?WjJxYmlQMmJibEFWVWo3ZE10UGdOZ1dXb25PT2VJdm14c2gvWmJIQ0dBWnR1?=
 =?utf-8?B?WFNVNUtaM1BaZHRFUENSZ1VIWUF0VzdaaTd1czFNV2dNOC9JQm1rKzZueThE?=
 =?utf-8?B?cWVuSFdDbXF6WDFlYnMweVpJaDN5WlU1aHE4SUVJc2FOMHFXUWtaUE1ZTGNR?=
 =?utf-8?B?YnRhd0trekJxd1FKaTlzUUxVK1dHTTNIZjlKMnJmc0x4RmdzU2tlSDQxSFNr?=
 =?utf-8?B?MDRwNmdRazBlNFZUN1lxV2JmeWxEdE9LVkwrUW1HNTVOQllUVm1zQlJHbXNZ?=
 =?utf-8?B?Ym5zcGFXdzBWWW9mT3AxRXV2OTI3UXhsQXpOMmkvRUMyM0Fram1malhKNlZp?=
 =?utf-8?B?b1dTVHgzNVRUWGF2eWRSVkpYQ1B3aE95T0lkc2R0TG9TNlJERCtER3ZjZnpQ?=
 =?utf-8?B?alUvdnBmdGVjUmVvUnRlc2RWZERPVlJCKzI0cHhhUEZkZURld09rQUl4dDVM?=
 =?utf-8?B?a1VFTjBCRUlvcE1FbG4vU0ZIV09xMHFxSUpkTnZ2c1FRa1BjMkhGODZEdVpz?=
 =?utf-8?B?S1dVT2VqTldNK3h3amJaRU5JSzdOU0pSbkp3SWtXUnc2ZEY5RDJhN1FmVGY1?=
 =?utf-8?B?elM1ODZFZVFUMU4rYjZwNTJrVk1SRGZkNnY4dmVBQmRCQys0bXprbkg2QlBa?=
 =?utf-8?B?Wnp2ekkzb3NCZlVHUnBWNlpzUERUbjJDUzlGQytRUzV0Z0k1cTc2S21BU2NS?=
 =?utf-8?B?aTNPdEdOS3hpejBVdUpUYkQrMGF0dk95dWhsTlNNVlp5YTdJdU5RVjdXMzN2?=
 =?utf-8?B?VXpvdUZuVU5mWDc0TWJYdjFIU1phVmxMK1BpZ0o4dHpDbDN1TE5LZHhGM01Q?=
 =?utf-8?B?T1Y0UzNwWFZ2alBZd0pVMVoyL1RmL1NTRmZyd29EVHV5RWJ6cjY0R3B5Wkxu?=
 =?utf-8?B?SWFiTUN1bVZWY0F1RW5wWXR1bllBNlJtMHMwb1RZVDZMU1pWOEhqVUlzVTZO?=
 =?utf-8?B?bmNhQUM2bkEra3hoS2lrN1FEWHN6UzBKdjFnamg0eVhzcUVWTmFRWHlvZVFx?=
 =?utf-8?B?Zmg4L29PdmUybXdxSnRUUzhRYkhzN1BkakdSLzlNYlEvSDlqMHpDSFpqQi9W?=
 =?utf-8?B?TTdEM1BvTkZQRXEzekdrQUV0Q3RnRGh2MEU0S24zSEY4eWhyclV0dk9hZXdI?=
 =?utf-8?B?RXRXeWViV0Z5QnpKc1huWHV1MENNR2lscUhqU3h6dlNJZlVWTmc5WjJTazlU?=
 =?utf-8?B?U2tqcWtQck5XVnpPZWRCb1lHYTdSZzFYSjJpT2tMZzdkSmhsVHhlWDdKWitE?=
 =?utf-8?B?am5QNjl5TVVhL1Q0SXRPYkF3RURBZGlJdCtvbDY2bU10V3RXT3l0aUtvb2lh?=
 =?utf-8?B?cjEyMnd1WmRwakNxRmhDOVg1UHg5U2pUVkJHMGFEb3p0OGc5VDNidnRGazhH?=
 =?utf-8?B?aGVaOVN3RERLbURVeWJmOVBIRFJiYktMMmdGQmR3S1pXTXNpVEp5aDJna3l3?=
 =?utf-8?B?RkVkR1FVUmtvVVNuSGRSb1EvSnRQZG5qcXNpdEdPY0NPSU9SVFIyeGNla0NG?=
 =?utf-8?B?VzZyUXppNkNYaHRBWHFHbmRqZTllaUo2MXV5NjFud2lMM0VGUlZwT3hSYVJ3?=
 =?utf-8?B?QzlNVlJDV2x0TUFBT29nVXJyTklNUFg1WHRjMCtTNU13bkc5dzN6dGRXRXIy?=
 =?utf-8?B?akVsMVZsc0NWdGRJTlhuVVl6TFRYemtHTndxL0xUSUkvWW12dE9Md2hkWHQ2?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa1242d-c507-45b7-b23a-08dda4c66237
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 06:50:11.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gccv6MZeN3aryrj47k9j+ZUXLtgcFMHU32NqF/BTpeN7kgMIZxbMtLwT1d/wi+qg/kf7QzP0tAWfiNALTovVRFAw0g1GqODSJFYBZsNeLhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8851
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MiBTYWx0ZWRfX9QupVJPLRohO KTq+Xtax0dviEQtjOHDmCw6kF1o4tTLtyWdoBqTdd0rducZzeaDKNG6/uLNYfkqblJa5B++1UIV gSS8vZxwJfVcmZ/Adi/soWV17jxLjdNGGASPBM8+1RIqQOWgSWgq5jHnWzYfxBn6loccMfaom5+
 UDwgM1KFo0LtOxc403Zl1/ZguUI4FJd8f/p6YLBNTLK9/dyTyp573d8bItBbpXOwMCF65gvZayZ B9XIqAW64Fex3BfCvuPT9GbukdBUc3tt1KmWjB3xrIsM9ONef5hgZsoqBNot72QVMUeeFJwhZWG HvT1wSdpAPTsCVHe2Cc+lCS6TJEr5ipzxzERbsdxcjdf8M2/Q69TD/PLDanQQZ/LerFa/q/K4pj
 xSQJjo2sNsBsS4YnL/GvSPTBpD6bWTuEjUiYah+rdgTIV17ru6ux1iVIgYnoQtU+tgQIqFYb
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68428fb6 cx=c_pps a=e8Cz9bg+q8QfYChdgU8rgw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=u2TqyMcsXqcZVvt-du4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=52mdeZd8sWgJSgSe30wA:9 a=6Pj2htFkvtSV03jJ:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: vDlKRjpCkBP41KDZ-HhL6fNOZlii0GTp
X-Proofpoint-ORIG-GUID: srfb4f63x0J_w9N4FP_1Tzjlah6ePhie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=931 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218109

--------------jMEyiuyPnjxkxzj9S0sBB2OK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5566VDJN023069


On 6/6/25 00:15, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This series doesn't apply in full, it seems to fall apart at
> "libsoup-2.4: fix CVE-2025-4969":
>
> Applying: libsoup-2.4: fix CVE-2025-32052
> Using index info to reconstruct a base tree...
> M meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> .git/rebase-apply/patch:34: space before tab in indent.
>    guint index_pattern =3D 0;
> .git/rebase-apply/patch:35: space before tab in indent.
>    gboolean skip_row =3D FALSE;
> .git/rebase-apply/patch:36: trailing whitespace.
>
> .git/rebase-apply/patch:39: space before tab in indent.
>           (index_pattern <=3D type_row->pattern_length)) {
> .git/rebase-apply/patch:40: space before tab in indent.
>    /* Skip insignificant white space ("WS" in the spec) */
> warning: squelched 3 whitespace errors
> warning: 8 lines add whitespace errors.
> Falling back to patching base and 3-way merge...
> Auto-merging meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> Applying: libsoup: fix CVE-2025-32052
> Applying: libsoup: fix CVE-2025-32051
> Applying: libsoup-2.4: fix CVE-2025-32050
> Applying: libsoup: fix CVE-2025-32050
> Applying: libsoup-2.4: fix CVE-2025-46421
> Applying: libsoup: fix CVE-2025-46421
> Applying: libsoup-2.4: fix CVE-2025-4948
> Applying: libsoup: fix CVE-2025-4948
> Applying: libsoup-2.4: fix CVE-2025-4969
> error: sha1 information is lacking or useless
> (meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb).
> error: could not build fake ancestor
> Patch failed at 0010 libsoup-2.4: fix CVE-2025-4969
>
> Perhaps send a V3 that will apply cleanly to the stable/scarthgap-nut
> branch in poky-contrib

Hi,

V3 send based on poky-contrib stable/scarthgap-nut.

Regards

Changqing

>
> Thanks!
>
> Steve
>
> On Wed, Jun 4, 2025 at 4:34=E2=80=AFAM Changqing Li via lists.openembed=
ded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Changqing Li (14):
>>    libsoup-2.4: fix CVE-2025-32052
>>    libsoup: fix CVE-2025-32052
>>    libsoup: fix CVE-2025-32051
>>    libsoup-2.4: fix CVE-2025-32050
>>    libsoup: fix CVE-2025-32050
>>    libsoup-2.4: fix CVE-2025-46421
>>    libsoup: fix CVE-2025-46421
>>    libsoup-2.4: fix CVE-2025-4948
>>    libsoup: fix CVE-2025-4948
>>    libsoup-2.4: fix CVE-2025-4969
>>    libsoup: fix CVE-2025-4969
>>    libsoup-2.4: fix CVE-2025-4476
>>    libsoup-2.4: fix CVE-2025-2784
>>    libsoup: fix CVE-2025-2784
>>
>>   .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
>>   .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
>>   .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
>>   .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
>>   .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  48 ++++++
>>   .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
>>   .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 +++++
>>   .../libsoup/libsoup-2.4_2.74.3.bb             |   7 +
>>   .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 ++++++++++++++++=
+
>>   .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
>>   .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
>>   .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
>>   .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
>>   .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++=
++
>>   .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 ++++++++++++
>>   .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch |  78 ++++++++++
>>   meta/recipes-support/libsoup/libsoup_3.4.4.bb |   8 +
>>   17 files changed, 890 insertions(+)
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-2784.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-32050.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-32052.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-4476.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-46421.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-4948.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025=
-4969.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-2784.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32050.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32051-1.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32051-2.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32052.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-46421.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-4948.patch
>>   create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-4969.patch
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217926):https://lists.openembedded.org/g/openembed=
ded-core/message/217926
>> Mute This Topic:https://lists.openembedded.org/mt/113464301/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------jMEyiuyPnjxkxzj9S0sBB2OK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5566VDJN023069

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 6/6/25 00:15, Steve Sakoman wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaHeb0Etg6w4A8ZuYJo9u4TNA=
-rVSSpk45g7x1+EVb41w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

This series doesn't apply in full, it seems to fall apart at
&quot;libsoup-2.4: fix CVE-2025-4969&quot;:

Applying: libsoup-2.4: fix CVE-2025-32052
Using index info to reconstruct a base tree...
M meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
.git/rebase-apply/patch:34: space before tab in indent.
  guint index_pattern =3D 0;
.git/rebase-apply/patch:35: space before tab in indent.
  gboolean skip_row =3D FALSE;
.git/rebase-apply/patch:36: trailing whitespace.

.git/rebase-apply/patch:39: space before tab in indent.
         (index_pattern &lt;=3D type_row-&gt;pattern_length)) {
.git/rebase-apply/patch:40: space before tab in indent.
  /* Skip insignificant white space (&quot;WS&quot; in the spec) */
warning: squelched 3 whitespace errors
warning: 8 lines add whitespace errors.
Falling back to patching base and 3-way merge...
Auto-merging meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
Applying: libsoup: fix CVE-2025-32052
Applying: libsoup: fix CVE-2025-32051
Applying: libsoup-2.4: fix CVE-2025-32050
Applying: libsoup: fix CVE-2025-32050
Applying: libsoup-2.4: fix CVE-2025-46421
Applying: libsoup: fix CVE-2025-46421
Applying: libsoup-2.4: fix CVE-2025-4948
Applying: libsoup: fix CVE-2025-4948
Applying: libsoup-2.4: fix CVE-2025-4969
error: sha1 information is lacking or useless
(meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb).
error: could not build fake ancestor
Patch failed at 0010 libsoup-2.4: fix CVE-2025-4969

Perhaps send a V3 that will apply cleanly to the stable/scarthgap-nut
branch in poky-contrib</pre>
    </blockquote>
    <p>Hi, <br>
    </p>
    <p>V3 send based on <span style=3D"white-space: pre-wrap">poky-contri=
b  </span><span style=3D"white-space: pre-wrap">stable/scarthgap-nut.</sp=
an></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaHeb0Etg6w4A8ZuYJo9u4TNA=
-rVSSpk45g7x1+EVb41w@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Thanks!

Steve

On Wed, Jun 4, 2025 at 4:34=E2=80=AFAM Changqing Li via lists.openembedde=
d.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Changqing Li (14):
  libsoup-2.4: fix CVE-2025-32052
  libsoup: fix CVE-2025-32052
  libsoup: fix CVE-2025-32051
  libsoup-2.4: fix CVE-2025-32050
  libsoup: fix CVE-2025-32050
  libsoup-2.4: fix CVE-2025-46421
  libsoup: fix CVE-2025-46421
  libsoup-2.4: fix CVE-2025-4948
  libsoup: fix CVE-2025-4948
  libsoup-2.4: fix CVE-2025-4969
  libsoup: fix CVE-2025-4969
  libsoup-2.4: fix CVE-2025-4476
  libsoup-2.4: fix CVE-2025-2784
  libsoup: fix CVE-2025-2784

 .../libsoup/libsoup-2.4/CVE-2025-2784.patch   |  56 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  |  29 ++++
 .../libsoup/libsoup-2.4/CVE-2025-32052.patch  |  32 ++++
 .../libsoup/libsoup-2.4/CVE-2025-4476.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-46421.patch  |  48 ++++++
 .../libsoup/libsoup-2.4/CVE-2025-4948.patch   |  38 +++++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  37 +++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   7 +
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 +++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32050.patch        |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      |  29 ++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      |  57 +++++++
 .../libsoup-3.4.4/CVE-2025-32052.patch        |  31 ++++
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch |  97 ++++++++++++
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch |  78 ++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   8 +
 17 files changed, 890 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-278=
4.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
50.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-320=
52.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-447=
6.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-464=
21.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-494=
8.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-496=
9.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2=
784.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2050.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2051-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-3=
2052.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4=
6421.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4=
948.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4=
969.patch

--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#217926): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/217926">https:/=
/lists.openembedded.org/g/openembedded-core/message/217926</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/113464301/3620601">https://lists.openembedded.org/mt=
/113464301/3620601</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------jMEyiuyPnjxkxzj9S0sBB2OK--

