Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0544BC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 18:20:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20133.1747419642573019620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 11:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7231f67d4d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GIGRe6019926
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:20:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8vhcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:20:40 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54GIGQAT019910
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:20:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8vhcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 18:20:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQds8Vuf8h/mMtOtmgYovyMLtATyxCiUAMudn8VezDqzyjZAzxt6nEhh4ogT7HcF9qRDVEyJNwGJMG71CA5uTt45zc4eGlBCOomMFn1OyW78nIIXf9FIb7XD03ecHNddgh4ouhE6iW5JwItb3p4SBMdjau/rIdUnDwOEDKHrYUcJ7N5LcgbWrX2VBlJvSqtOfLWtrQ+vUxmmt45oYKhX+oQ2YFU3NzGzToR/98gmIGqhbxITLCTeyF0c6NjN3mdklcT5L95qsxLHcSR5/caEaCPzbU51ooiZqLsjY1cxK1LjWAPtMTUwgEQhV9qwcDu5aGX4xLLCaZLfkIhTlCQKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scslETSLbi5Z3jKqltRPq6rXEbXB4Xgyw1G60Tl3Aw4=;
 b=ojyPiP4MdZXD9aTKyS5LkdYeQSRexXN+Nag2GP8/bz2yM7hUbqATHAtky1XWkdDHsFkfAZADYI/O0oaMorH9g/YfKnJVyscYPDNkz+MdDWZBCxO/WOcJXTwkMIFrGXb4wjIp74GrNF8RKrgTrPTcvswE7BqTBd81HAphbtUQL9f80k4mknvbkaRCGR4CzFyTGjPlYJhOXAfcsk4vUFkhA39kBnP0pBD7lG4DttTCnqq/3eIJSYwn6V2Ty53a3+JimwusOoKUYRopmbr/FgBryXQejsOjhgAcgnMdGK+FHUYrx9WaNwjPK7oY/PHeOvV2tkzyOPCVUbJ5u5m2YmBx/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 16 May
 2025 18:20:27 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 18:20:26 +0000
Content-Type: multipart/alternative;
 boundary="------------h070dcpqDqBFshqkG1Cbba4W"
Message-ID: <eb9311ee-93ff-42c3-ba83-c3f2ccf415d1@windriver.com>
Date: Fri, 16 May 2025 14:20:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for single-binary
To: liezhi.yang@windriver.com, "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1747206852.git.liezhi.yang@windriver.com>
 <7d13d6ecafaaf0f06955156bcd9e19b61a92ea80.1747206852.git.liezhi.yang@windriver.com>
 <AS1PR10MB5697052E3C295B1843480375FD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com>
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY5PR11MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b2dfeb-4cf8-4543-4cff-08dd94a654cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eklUOW5aNDNvWmo3MmlFOFNhUHpBcFZFSVk4dDVTVWJ3am1ETG1DZkZSa1ZZ?=
 =?utf-8?B?a3dVL2pqcGxXanNwQmVCcXhHbjdJenpwMVpmdWtCSElENXllOEg4QnlEV1FN?=
 =?utf-8?B?TmZqSEQ5T2tCZmVhQWUxTG4vODdMdURiM1NLSUFqbU1RY2lvcHdBRkVuZmJq?=
 =?utf-8?B?ejdxV0xQSHp3SkJsaTBlVUp1NURDb2NRZU90dmFZYnFkUjQ0SFo1TkRFT2lS?=
 =?utf-8?B?elRBbnVhR3k3T2Urd2NFUHUxV2tqcFZ5d01jUXRTTlByMWF3cWJEYmJKWGtp?=
 =?utf-8?B?YzZHSklMN01UODllRUpMZXpGbUdUazZFM2tRVGROODlNY2lMN1h6NnRXek1Q?=
 =?utf-8?B?dFo3d255YlMyMEFoeE5zWDlSSmw3Q09KMDVuUnFGMHZKMmo4SGpYenNERHNo?=
 =?utf-8?B?SU9YdVNvNkpyWnJueGQxeDJJYzFsRyt5eGRHL2JZUi9VV29ZV1BCWHNLc0hF?=
 =?utf-8?B?elRNdmdJcUlhN1pmMVd5Y09OQ1lBaDFoVVVlSURYTG5hN3lUbXVZeXJCakNr?=
 =?utf-8?B?Z3FyOGYvblJKTWozZ2ZjMlJGSkNodW42VGV5a2dRNmpCYWVHbHJGKzViK0JV?=
 =?utf-8?B?TmZ0MExFN2RNaWhDaUc1UWI5VWdwY2lYTEMyVnVzTFhLRGw5K0E5dWRWdzNx?=
 =?utf-8?B?THVtdHA0N3RFMHQzZDJScTdiVStVRGVtUDgzQml3MDZEb3hKTng2SzRpV3lL?=
 =?utf-8?B?L0c5QTlqT0szQU0rQ05yVnJLeWhtMWJNR1Z4RWRkMHN0Q2lrRXBkVXhrc1Fz?=
 =?utf-8?B?U0EwNUIvOURueFcxZzkxZjZ4dHVwMFJTTGxlMENLQUhYaW80Q1Y3QThEbWkw?=
 =?utf-8?B?bXFqZFA3YnRUNW9lZDc0cXAzUGw1Z3pHQjNjejlMb2oxem5GU0NoMUlXYTEv?=
 =?utf-8?B?bDkzaFBvUVJEK0tSZlI2eFUrZ0ZvU0lrSU5SUkcrcjQ3blZOT05MQVllSGFz?=
 =?utf-8?B?UHpMVFM5cEUwWlVkQ2J2bmJVYm9MdERjeENyclgvcWVockhLOHZvYVRvVDZm?=
 =?utf-8?B?cWt0bVQ4bGYxZERQM0FOa29FYUs2VUx6aHlsSG83Q0Y5R0wrUkxqd2tXQ1FE?=
 =?utf-8?B?cUtIUU1TYWZOdHZ3NlQ0UGJ5Rnk3aCt1bHFRZGxEdnVwZnZ2WS9leVladXlX?=
 =?utf-8?B?M2RWRUdkdEdNUGJjWHdPMjhHSW1UdHlYcTZpSmdrWnhER0NLRVRZMFlMUzMz?=
 =?utf-8?B?aW5UUXFocGVOWmx5OVNqejk2Tk9sV04xSVBmQTI4d1VXalBlVHhURVBzOWpn?=
 =?utf-8?B?R3J3REYyMDJZK1RUallnbGUranpiNU1KT09sUTFBa3NZRmowNTRyd2dBWVJN?=
 =?utf-8?B?d3ZPL21EbzJzTzZpUWFIMXZ0N0tqampKTTYwb3VZOTgrcnJGSlVHRFB3QWMw?=
 =?utf-8?B?dUovRWZwY0tNeS9iamVqTGpNUzAwTnZFeW1qa1B2Qld1RzRqYmdNRlQrNHdt?=
 =?utf-8?B?M2xmSEFHd3hVS2kvakVOalhKSlpsR2hjTlhnT2NsVnZmWU5OVHJHOGZJbzZh?=
 =?utf-8?B?V2NRNVJZUS80WENZUEkrTTN0SGNDbWlNeHppV0NBQmRaMkN3L2xQbjNmUjRr?=
 =?utf-8?B?TjVZNXhER0x6bHBibjF2dDQvSU53b29qZXRNN1RjR3c4bzFGajRaRFRiQWdC?=
 =?utf-8?B?RUp5UmY4UWx0SUZpaUNyVW5hNXZlczlGbnZCVlJqdEt3czErK2JOK3RUZTJQ?=
 =?utf-8?B?cksrZzdVZjQwM1U4aE43b25pbWxiR0xrTkl6aXE2WWJZN2h0MkpGaXlDQ3dR?=
 =?utf-8?B?QWxsRjVCNkNEZVZYMExES2JzK2xYeUNkZytyOFpSMHpNYWlwZndUbUR2d3dn?=
 =?utf-8?B?eGNTRll3eWVCb1o5azF2ZG8zTkJtUFlVTkxjM3pCRmNxL0RLRnZ0bXpkYlll?=
 =?utf-8?Q?DPIGKI4d2kUkp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dU9xUXRvYy9EUUw0aG9PQStvZ3gxemg0RVdnWittam5DZjN4Y2gyVUxqUk9X?=
 =?utf-8?B?WC8rRG1QN2ltckl6QmQrSGJzbDBESncrVXFuV2lDaWQwUkZBU203SndpSzMy?=
 =?utf-8?B?M0pUTUFMaG5UNHIwL0ZMUGRuZmhDT2NoejdyNklaM1NJZU84bnF3c3V0SWdi?=
 =?utf-8?B?U25UQ1ZCRkNSbSthTEo2V3JYN2JXR3V2L1dySXl2N0ZCd2Mwb21QSytxa3dT?=
 =?utf-8?B?aGZYZDVGbW40WHFUWW15TjFNR3FyOGlKbUk4R2tlVUQ4bExNSDV0ZVZHSFBt?=
 =?utf-8?B?cDBHb01vNTRJbG5xUElSOUlwakpqYnFodm9DMlIwa0I4ZUZidTZCOEhITlJQ?=
 =?utf-8?B?aHhxOHRianlXMHJoR0ZzdmhRbEI1eXF2ZjhVRUFQLy96Tm14MlpTdWh1Qjly?=
 =?utf-8?B?TFZNcHEyWWJRRXdkVUtuc3NzaUJoOXVuREh1UmdMbzIyTzVoL1ppcldTTEE0?=
 =?utf-8?B?V2g4K3VTSFBROWVYd3R1VEQ0VVVPdEM0S2dCNTg1aFJRUGthQk5GdFJqbGE0?=
 =?utf-8?B?WS9JQmRMajFidS9VeEtlaThzM2gyaERDdHA4UmNBOWt3dVlXMlBFUHl2Ukg0?=
 =?utf-8?B?aHZPYWJGSTV1eXR6SEpxN2xlcXFjTlNzU21ZV3ZYMTlZNnlSeUJvalhUSjB0?=
 =?utf-8?B?V2NFMUphcy9oVjNUblpiL2dvSUxkWFpDeE1kWUVqNTYyNlBDZ1doUGxWSjZV?=
 =?utf-8?B?a1FOczk5TFZXRjhVeU5QYm1NK21rUkdBZEIzSGVFQmRTS1JBcmw4eEtkTk1m?=
 =?utf-8?B?bFhMZlpBTHpjejEzN0d1bUYzNWNoWEtNaGVEQ1JpZVBPd3hzOERnWC92WlNG?=
 =?utf-8?B?TlJRYjU0c2FzN1pMelF3cWlTUUNXOUgzZkFIc2NiWnZiTUQyNEhDY0ErQ1Bs?=
 =?utf-8?B?ZDVTbGltNDFraTBCVnhUMzdmcHpJTnJINXFwYmdLNldlQkwrK2ovemV0QURq?=
 =?utf-8?B?a2VBOWw3QTlQQnVpWEZBY2NWQVc1aXVBcUppV2dKZ2l0emNLc05IYktrN015?=
 =?utf-8?B?akJxUzRqTTZHYTAwbHdFOXh6YmRBdTdqaTRPMXA0TSs1aUJzekwvdEUvMmZT?=
 =?utf-8?B?UzNXc1ZlSStDSnk2dVlIZjlhazUxa0lHUGsxL2htOTU4b0N4bTZQU1ZVaTZT?=
 =?utf-8?B?WSs2QzMyU2RpTmsyVDZsM292NS9KYjM5MGhZaUQxbFNOOXVQWkhJRFpFbE40?=
 =?utf-8?B?Tk5HNEgwVVdPTDBrK3paLzd0eStMd0xzUzlDei95M1gzTXNqZDQvZC9CS1BQ?=
 =?utf-8?B?VEU3NHRaVFN6Qkp0aGtjN2VxTHV2NDZ4dDJIRGliQk1hNFo5OFZjZFo3SVhQ?=
 =?utf-8?B?YjFSVHdYK2RoY0FhOEo2T2JSVnlJZEVlQ3ZTeDF0TTF2R29paFZONTVQT3Ux?=
 =?utf-8?B?T0wvejJSVFZXVXFoaGY1c3IwMjQvVndhZGVaQnNFaXB6ZUJ3UDliS0pjNFNs?=
 =?utf-8?B?U1BSU1dPSDBRZ1NVNi9sQlprdS9PNVhERmU5TzhZb2EreTBJM0hDTTQ1ZGtK?=
 =?utf-8?B?K0NqdDNqV0hTb01HdWthZzdhVTdwbW1ydjd6dXZsZzBSL2RlV2N3aTZZMDcw?=
 =?utf-8?B?cDNSVmFNdVJpa3lpRmpSU3luQXRqTGFCUHRMbG9tOU10UjR1RGg1dmYxQmtr?=
 =?utf-8?B?UjVjQkFTSEl2RzNYUHNJaEg3Mnc2YkVZT3FRVXc4M2xXRm1vRmU2MDB0WFV5?=
 =?utf-8?B?Z0xMUHZhaFZzay9ZckkvWkYyTnJ5b3h0K3pOYm1waTRoaEF6VUExT241MEkv?=
 =?utf-8?B?VDUxSWRyc2JKUXcvM0dmMWVEL1RiM0V0M0FMRDFBdlk1c2lITmZqdXBjeFQv?=
 =?utf-8?B?NXdIM2tFNlhwVFZzemxidTZETkhOZjRTRk5XMnBlaFppc1B2cWRZZk9DRkZX?=
 =?utf-8?B?SmJQMm1kSi9ObDBxQXpBc1NNZGhVU3FSRlYvdUZ3RGk5Z3JnVlhqV2NTNzdI?=
 =?utf-8?B?bUsxbFNUK1ZMemRrbjdZYTFNSFpKbkVuQTN6ZkNyR2h5dVRwa0crN1hMQ011?=
 =?utf-8?B?MFJuaFd6a0UrVEhzTWttSnhDZ2xIWWl1Y3hYNWpLN2xRTXM3WWoybnY2Y3Np?=
 =?utf-8?B?THVScWErTUFpL2E2RTBEU2I4QzB2SGN0L1IzOFpxNVM2aUNrU3JuZDJsbThP?=
 =?utf-8?B?ZnZuVVlxWlZhTS8rZTRGYUhuMzBuV3Z5ZFZvcXBybk81VzJFbGk1eTZ4R0wx?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b2dfeb-4cf8-4543-4cff-08dd94a654cd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 18:20:26.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWDsO3wbQh9UT2vgKzhZ/AwsvDrxWVNnbeDFqqRhZOq9qqkgikBV4lt0B2DEeqv6mP61M98kelep5kNdrT3nyphY+Mxh8gUEx2R6fiwsWXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6463
X-Proofpoint-GUID: 5zAaQda6MuwyOSOOGZ7M7_0L6RB5u1bx
X-Proofpoint-ORIG-GUID: 3Km6MFihGhK_sY03xcj-UWNOSK0SxN23
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=682781f8 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=iIeT0t4HQF65hBv4vRAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=xXbF4KGp1Lm42_3f4UoA:9 a=Ya6NarqOWBMNEytj:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MCBTYWx0ZWRfX/Qo8to1KvH1t Aqakg6vBuLwggCM7/c9rhC5NlYpTekI0wTqn0aRjp8jRK34uk+l2t/bFwq/o4FSMkZgt0B+crq2 +teKE3doFVPZTV+kaWBzWjxzHivwuLIO2hoJ9XC5EYmZWsHYf1wkazVUbXBLuma9o/11Sz3E6Ke
 6JBCJKSgo66LsGYyRk9b3zJ72AvSFzqCXh0RGKIj3tTOfGO296M6RNbF5ZzhqBNctYhEwXAYP5a f2NZcS8KYZmi2gT0zQxrz1tpS1tISkTr2xjYvMz1z1b8To6cDu81dKGlNMQ3yS933ZU8kDszqnK GiKFjx49x6sfFc0St3b76kuJqn9rtuYNaWhD97A4qqLASF1TMQrzVBIp3+G8O7nft8oWDjZwgQF
 CZsciiGSkA7xMbL6dUa45XvW+8/RcfXRQLfzSNqhS5peRWJ8tXl+r0wlqZRDXUCCpQG5AvDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 18:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216763

--------------h070dcpqDqBFshqkG1Cbba4W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54GIGRe6019926

On 2025-05-14 4:41 a.m., Robert Yang via lists.openembedded.org wrote:
>
>
> On 5/14/25 15:25, Marko, Peter wrote:
>>
>>
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>> core@lists.openembedded.org> On Behalf Of Robert Yang via
>>> lists.openembedded.org
>>> Sent: Wednesday, May 14, 2025 9:17
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: liezhi.yang@windriver.com
>>> Subject: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for=20
>>> single-binary
>>>
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> Fixed:
>>> DISTRO_FEATURES:append =3D " ptest"
>>> PACKAGECONFIG:append:pn-coreutils =3D " single-binary"
>>>
>>> $ bitbake coreutils
>>> ERROR: coreutils-9.6-r0 do_package_qa: QA Issue:=20
>>> /usr/lib/coreutils/ptest/src/yes
>>> contained in package coreutils-ptest requires=20
>>> /path/to//tmp/work/core2-64-poky-
>>> linux/coreutils/9.6/build/src/coreutils, but no providers found in
>>> RDEPENDS:coreutils-ptest? [file-rdeps]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-core/coreutils/coreutils_9.6.bb | 9 ++++++++-
>>> =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb=20
>>> b/meta/recipes-
>>> core/coreutils/coreutils_9.6.bb
>>> index 6e1867f3e4..c9fd3719d5 100644
>>> --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
>>> +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
>>> @@ -211,7 +211,14 @@ do_install_ptest () {
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Tweak test d_type-check to use pytho=
n3 instead of python
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i "1s@.*@#!/usr/bin/python3@"=20
>>> ${D}${PTEST_PATH}/tests/d_type-check
>>> -
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Fix for single-binary
>>> +=C2=A0=C2=A0=C2=A0 for prog in ${D}${PTEST_PATH}/src/*; do
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f $prog ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
ed -i "1s@#!.*/src/coreutils @#!/usr/bin/coreutils @"=20
>>> $prog
>>
>> This should have ${bindir} instead of hardcoded /usr/bin
>
> Yes, you're right, fixed in the PULL:
>
> +=C2=A0=C2=A0=C2=A0 # Fix for single-binary
> +=C2=A0=C2=A0=C2=A0 for prog in ${D}${PTEST_PATH}/src/*; do
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f $prog ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed=
 -i "1s@#!.*/src/coreutils @#!${bindir}/coreutils @"=20
> $prog
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0=C2=A0 done
>
>
>
> https://github.com/robertlinux/yocto rbt/cu
> https://github.com/robertlinux/yocto/tree/rbt/cu
>
> Robert Yang (2):
> =C2=A0 coreutils: Fix file-rdeps for single-binary
> =C2=A0 coreutils: Drop 0001-local.mk-fix-cross-compiling-problem.patch
>
> // Robert



See the thread from Ovidiu:

https://lists.openembedded.org/g/openembedded-core/message/216382

where he took a similar approach and I asked for some comments
and rather than using sed, changing the build-aux/gen-single-binary.sh=20
script

or using coreutils' configure option that can generate symlinks:

 =C2=A0--enable-single-binary=3Dshebangs|symlinks

../Randy


>
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0 done
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # handle multilib
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i s:@libdir@:${libdir}:g ${D}${PT=
EST_PATH}/run-ptest
>>> =C2=A0 }
>>> --=20
>>> 2.49.0
>>
> pLK@tY:ATbOf1"dW
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216487):https://lists.openembedded.org/g/openembedd=
ed-core/message/216487
> Mute This Topic:https://lists.openembedded.org/mt/113104706/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------h070dcpqDqBFshqkG1Cbba4W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-05-14 4:41 a.m., Robert Yang
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com">
      <br>
      <br>
      On 5/14/25 15:25, Marko, Peter wrote:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        <blockquote type="cite">-----Original Message-----
          <br>
          From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          &lt;openembedded-
          <br>
          <a class="moz-txt-link-abbreviated" href="mailto:core@lists.openembedded.org">core@lists.openembedded.org</a>&gt; On Behalf Of Robert Yang via
          <br>
          lists.openembedded.org
          <br>
          Sent: Wednesday, May 14, 2025 9:17
          <br>
          To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
          <br>
          Cc: <a class="moz-txt-link-abbreviated" href="mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>
          <br>
          Subject: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for
          single-binary
          <br>
          <br>
          From: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>
          <br>
          <br>
          Fixed:
          <br>
          DISTRO_FEATURES:append = &quot; ptest&quot;
          <br>
          PACKAGECONFIG:append:pn-coreutils = &quot; single-binary&quot;
          <br>
          <br>
          $ bitbake coreutils
          <br>
          ERROR: coreutils-9.6-r0 do_package_qa: QA Issue:
          /usr/lib/coreutils/ptest/src/yes
          <br>
          contained in package coreutils-ptest requires
          /path/to//tmp/work/core2-64-poky-
          <br>
          linux/coreutils/9.6/build/src/coreutils, but no providers
          found in
          <br>
          RDEPENDS:coreutils-ptest? [file-rdeps]
          <br>
          <br>
          Signed-off-by: Robert Yang <a class="moz-txt-link-rfc2396E" href="mailto:liezhi.yang@windriver.com">&lt;liezhi.yang@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; meta/recipes-core/coreutils/coreutils_9.6.bb | 9 ++++++++-
          <br>
          &nbsp; 1 file changed, 8 insertions(+), 1 deletion(-)
          <br>
          <br>
          diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb
          b/meta/recipes-
          <br>
          core/coreutils/coreutils_9.6.bb
          <br>
          index 6e1867f3e4..c9fd3719d5 100644
          <br>
          --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
          <br>
          +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
          <br>
          @@ -211,7 +211,14 @@ do_install_ptest () {
          <br>
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Tweak test d_type-check to use python3 instead of
          python
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i <a class="moz-txt-link-rfc2396E" href="mailto:1s@.*@#!/usr/bin/python3@">&quot;1s@.*@#!/usr/bin/python3@&quot;</a>
          ${D}${PTEST_PATH}/tests/d_type-check
          <br>
          -
          <br>
          +
          <br>
          +&nbsp;&nbsp;&nbsp; # Fix for single-binary
          <br>
          +&nbsp;&nbsp;&nbsp; for prog in ${D}${PTEST_PATH}/src/*; do
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -f $prog ]; then
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i <a class="moz-txt-link-rfc2396E" href="mailto:1s@#!.*/src/coreutils@#!/usr/bin/coreutils@">&quot;1s@#!.*/src/coreutils
          @#!/usr/bin/coreutils @&quot;</a> $prog
          <br>
        </blockquote>
        <br>
        This should have ${bindir} instead of hardcoded /usr/bin
        <br>
      </blockquote>
      <br>
      Yes, you're right, fixed in the PULL:
      <br>
      <br>
      +&nbsp;&nbsp;&nbsp; # Fix for single-binary
      <br>
      +&nbsp;&nbsp;&nbsp; for prog in ${D}${PTEST_PATH}/src/*; do
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -f $prog ]; then
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i <a class="moz-txt-link-rfc2396E" href="mailto:1s@#!.*/src/coreutils@#!${bindir}/coreutils@">&quot;1s@#!.*/src/coreutils @#!${bindir}/coreutils
      @&quot;</a> $prog
      <br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
      <br>
      +&nbsp;&nbsp;&nbsp; done
      <br>
      <br>
      <br>
      <br>
      &nbsp; <a class="moz-txt-link-freetext" href="https://github.com/robertlinux/yocto">https://github.com/robertlinux/yocto</a> rbt/cu
      <br>
      &nbsp; <a class="moz-txt-link-freetext" href="https://github.com/robertlinux/yocto/tree/rbt/cu">https://github.com/robertlinux/yocto/tree/rbt/cu</a>
      <br>
      <br>
      Robert Yang (2):
      <br>
      &nbsp; coreutils: Fix file-rdeps for single-binary
      <br>
      &nbsp; coreutils: Drop 0001-local.mk-fix-cross-compiling-problem.patch
      <br>
      <br>
      // Robert
      <br>
    </blockquote>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>See the thread from Ovidiu:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/216382">https://lists.openembedded.org/g/openembedded-core/message/216382</a></p>
    <p>where he took a similar approach and I asked for some comments<br>
      and rather than using sed, changing the
      build-aux/gen-single-binary.sh script<br>
    </p>
    <p>or using coreutils' configure option that can generate symlinks:</p>
    <p>&nbsp;--enable-single-binary=shebangs|symlinks</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com">
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi
          <br>
          +&nbsp;&nbsp;&nbsp; done
          <br>
          +
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # handle multilib
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i s:@libdir@:${libdir}:g
          ${D}${PTEST_PATH}/run-ptest
          <br>
          &nbsp; }
          <br>
          --
          <br>
          2.49.0
          <br>
        </blockquote>
        <br>
      </blockquote>
      pLK@tY:ATbOf1&quot;dW
      <br>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#216487): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/216487">https://lists.openembedded.org/g/openembedded-core/message/216487</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113104706/3616765">https://lists.openembedded.org/mt/113104706/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------h070dcpqDqBFshqkG1Cbba4W--

