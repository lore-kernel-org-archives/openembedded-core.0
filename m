Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185BEC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:41:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.97077.1747212071698459607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 01:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72290b1e6d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E6vD5s009311
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:41:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8rsf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:41:10 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54E8fAV0028079;
	Wed, 14 May 2025 08:41:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbc8rsey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 08:41:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twVarLzi9BFdIItT/AtCEgblyGyfE+tDE6Q708CAjHQtVbBTu//OsfTpDC03dKjtyJ3+K4dYLaWicEwmR8Zlx8yddqLpG/zcsZ2gK5zcBafmp0ku7zsrRfZEv1n5z3kM/GnulaN+ft4IeZddKrPJ4TSmvYY2Hx+dte9IUokJM25H2rvZxUPzmY1ZJuThFmc8VlK0QHY5KR39uiTXJ5v6IcR7CmEUqGJPL8l7ScrjUAmyJ6fkv8rcuk5tcvt7eipEa09nDhfChzN1i7ZB1XX758XKCPAx8deF5yCCssgX/CyGfjaJ++h9u/jhrJ/PvotsJv7QKzvz+eYJHuM9bf5FZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZdF4LxuAGOfd5R+pR04mdNrIhyM7UpVWSR8IGBnWps=;
 b=xZP3j4qK5J5V0drB4hVR2Sqe3Zpf5UhqtWWbk87A1xjiyt+4cqtgTA8x/EKR9iHp6rCorwXiagzre82eQhp9tTkWcu9+03fT8SSOMDI2Agea2MxEVwqB64Gn3jhueY44aL+ZmBa2pKHpVzBS4CPgD3DqRbZQSN6ePB44PKpsgqp3MC43FiFgmM0c9D0RJqAP/ek1q/5ODsPW3g9xbgS3kqBuRrw0UvD+12wYo25JtsmkPs2R6LLbby8nq25Lr6+eIx6meHq4rJQCcXWITd4SvwN2jGrIVtWVIG3yNzQcQzjg4+epfrLHv77etn/yWmlHJYb7/snxKKZ5pxsG89tmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Wed, 14 May
 2025 08:41:07 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:41:07 +0000
Message-ID: <d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com>
Date: Wed, 14 May 2025 16:41:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for single-binary
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1747206852.git.liezhi.yang@windriver.com>
 <7d13d6ecafaaf0f06955156bcd9e19b61a92ea80.1747206852.git.liezhi.yang@windriver.com>
 <AS1PR10MB5697052E3C295B1843480375FD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <AS1PR10MB5697052E3C295B1843480375FD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SN7PR11MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: d944d1ff-8c06-41bd-1ede-08dd92c311c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVB5ZWxOR2h0aHV0bS9raVAyZHh6MFFhbjdMSFIyeVYzOXQ3MXFOVWJOK2FX?=
 =?utf-8?B?Qkg1RW1YN1hNK3BzREhHaWhkNkNwcXowaUFvVTNIVzdEQ2FGS2wzNXVMeHVu?=
 =?utf-8?B?RW5WaHI0cXpVVm1wb0JNbU1qa2JyMVhoMG9FV1BjSHhML2UxK25nbk9meFVS?=
 =?utf-8?B?ZGROa0V4MnBVN0l3WTErU0cyWkdRZTZrK1hEbmpIY0V1UnNkNkxURUVLejdQ?=
 =?utf-8?B?QVo4WVRjQkp4T0drSGJDbmNrRGlldUE3ZGM2OEcweEdqajBTL3hMV1RVSXI3?=
 =?utf-8?B?ZlJMSmJBdXc0UzNKR2dPNjBsTVFkQUhyUWN2VzF0bHZYMVdMWlFlZ3ZnUU9W?=
 =?utf-8?B?SmptWEptZFVCOVdQREx3YUE2REdxdmdEL25sNUUvMzIwanFxb3ZORE5CTkdq?=
 =?utf-8?B?WllkY3pwdVFyTmNIWWNGaVgwaWFJWFBzTm41ZzJMcUpQQTdhK0FPZ2kzY1gr?=
 =?utf-8?B?VjM0ZlhzQjNxeDZROTdQUFJuRnowMlJvTVZFWSttakRZaER3SXZRemhObitu?=
 =?utf-8?B?ZTdRLzlRd3FDQlJDRFZuOWxiWlZwN3A2WFVpMysyV1Vsd1BQbXg5cjZSMENa?=
 =?utf-8?B?WUw1WERULzRmSyszMlFRbmQ5aHp5SVd4c3RBa1Nlb3hhcXI4TXVWZDdQN01F?=
 =?utf-8?B?SkJsVmRnd0NGdURaWmZ0LzBEbmw3MHBvKzlGUVpLeDkwMnRJQll4aG9zZ2I5?=
 =?utf-8?B?QW1OOG9peGF1N0E4YU0yM1NCVnRYMnc2Q1VTbUVvQVdzMVd1bCtCVzEyNjFO?=
 =?utf-8?B?Y21GT28zMSt6RWdXcFhKejc3R0ZreUppZUVpR3VJSXR5VTRackd6dlZmRlc4?=
 =?utf-8?B?bU9jUklhQmlEc2U1ZjBjWW1jQVErV2tMa1ZnYW5qN3pCQ2ovQlE4VVc1VDJD?=
 =?utf-8?B?TG5relVSRVJtaTZVY2VDeHhzaWpETUNMQlZvQkRJeXRoQnpscGdKMzZyUVVE?=
 =?utf-8?B?cVlRS2VYd0ZpR001cFRjZTYyZWpkQnlYYld1SmhUVUlIQ3Y4aUtKc3N1a0lz?=
 =?utf-8?B?QytVNWs0QnlnOVVDUkYyc0wvTmxyd0Y0V3hKck4zQit5VEttOEJtZzNmMEVJ?=
 =?utf-8?B?cmpBT0ZTSmx4VGVIeUVBc3Z3N0p6SHhGcWpNQS82WE9VZlVQZHFCaXpTWWZG?=
 =?utf-8?B?OXFEQ0JzNlJLWUYrZFpJdTJ0cElGaVlKQnNXSjFVL2hXUjNnVmF5UUdpb290?=
 =?utf-8?B?aFR4SFVDazA1eEtTb3NaV1RtWHZYK2tnT0EzY1JLSmdQcnZEOTZMZzhVSnZj?=
 =?utf-8?B?SE5raDIwcnBTcExJb3c5YmVpd09YSW1qbkJHVWZra2ViWWpROTlsTXZIQXNF?=
 =?utf-8?B?U1VnUjRIaFloWi8wTEdGaTFNU3V0dkttLzMxdUZRZVRqa0hJZFBLRDdDV2ZH?=
 =?utf-8?B?U0tyd1RMVkFrVXIraHVkdTZMcWF3Z2RtUExXajFwR1hpa1dSdmpMbDJuY0I4?=
 =?utf-8?B?OWgrZnd2THNKNXkvQStLSDIra3BReG5PT09lU0NQelByQ3ZjQVRjT01mWnk3?=
 =?utf-8?B?d1pDT0I4bW5RZFBXWWlPSGtYdWZ5Z1ZXQ3JnZ0FsK0tybmpBdDVRdWkxQk9i?=
 =?utf-8?B?emFRQUJFNW1WWXlhVTdGSzg5VTdBeURuYTlwTjBrVUtYSWExa0xIeHhtOC9x?=
 =?utf-8?B?MmpaZlZwcGk1YXE0ZWpXQ2xtQm90dEY1VEFvTExrMDZPWk9GVjRyaEhBdk5h?=
 =?utf-8?B?aVl0Yld4LzVyRGJnUFF5ZEpjOFAycWpvYjF0M25KUEh5eFdMbmhJS0o2bzBr?=
 =?utf-8?B?TFFwWHRhNVNqMzVnOU85eVYvSld1eGNwMXFZQktTWTF5eEE4ajZoVWFlcVpZ?=
 =?utf-8?Q?9HegK6lRyYeTH15kELY0K1SjMqfxJbj9SbNDc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUVHeXpITndZZTc0Z1JEVkhHL0kxc3JBUUhvZEpudFdjaFNNYTNIbWtFdFE2?=
 =?utf-8?B?MUV0ZzV4Tk83NHlOaFlIbW1heW96MjlFYlR4OGhScUJ0MFYzWTFPajlXZ0N4?=
 =?utf-8?B?QzE5UHNQdDh3aXp4TnFtbkRKeGlhYWVRTDZIenh0QzdPRUM5WnIyKzc4bVRZ?=
 =?utf-8?B?THZjbzVmZVRhUkhOK1lHc1o2ZkFnWjRZV2xLMGFKYnFObEpNVGZPL01STHlV?=
 =?utf-8?B?d3lBWVJUNEUxZlNINFNlZmtWaXlXbzFkV3ltRXo1N3ZrdHB5b3c5MW9YVDZH?=
 =?utf-8?B?dTNXNnN0SHZhK2Q3YjdQQTM5YVd4aXNFMkE5VHFMZ1ZsT0pHV21ZMU95RXVP?=
 =?utf-8?B?ekhFcDZWSUVKcEw1eENxMUE0S09oTGUyaW1CMzdFN0gzL0pQaDdZVCtVOHRr?=
 =?utf-8?B?dGVBT2tESm1nTExFbGRNSWpkQU9xMzlDbStJQjJiZ3ZvSWZHY3pHcFdOQ0x2?=
 =?utf-8?B?S01hQlEzVTVpSVlZU21JZTlSbFh3MnljNHB0QjZ3dmV5Vk55eGNaUHQyVFJX?=
 =?utf-8?B?STFHaUdWa2tlcEtRTStJMUVlUXRkcjd2YXVEZEMrTDR0RENNRS8ya1dyZU5U?=
 =?utf-8?B?d1RyVmNhRWFNbkQ2U0lVb1FlcE42WklyN09RSmxBbVh6dHUwaFcrQWFtc281?=
 =?utf-8?B?NkNGWXlXRXYxQlM5RDNwSmpjQUluSUlWRGNqaHFJcGN3MTFTVlQxUXVhUE5i?=
 =?utf-8?B?ZWlmNFRVNk5HRWt5aWtXRC94bS9xdnV2N2ZGeW5GVis1VjRpSmtnc1grNzJ0?=
 =?utf-8?B?QVBMQVBKa2w3U0U1ZXV4TFRGS3V3MXU1S3Q2TWVvUmh6WUE1RXVFL0ovc2FC?=
 =?utf-8?B?TzRQeEpteXBVZXp3cEJ3Yi9HOG1KN0VyOGVEMWkzMlFIdUgvc3NRZ1pXMnlJ?=
 =?utf-8?B?elU4bEhCYTNqcjdpVCtudnFhOWxhaDdhRTdMdUZ0akRWbWlCenpnKzdBNlpL?=
 =?utf-8?B?S2N5bG13aUxMUU5GZldCeXVOTHoxajJnOEZjbmV0ZEFsZ29TVkZyMlVmSGxm?=
 =?utf-8?B?U2lyR09MM2VTUEM3ZEZjeSs2bFg2TXFmb2ZwY2JLbmRST2ZZZUZwYit5eG51?=
 =?utf-8?B?OTJsdzg2Y09ScTJndjNWTW4rdGUvbUhDQkNBUC9TQzk2RDdqZEJBWUMzeW5v?=
 =?utf-8?B?NHI2Q2dMRXR3aU5vMnNNblMvNmtZRXU1Zmt1bXArZHVZMHB6VmIyNHovYTRv?=
 =?utf-8?B?aEk1TE05VmNPNEwyOEtxZmxVZkpXcytWTmJqZWJqeTV3YlR0OWJqYXhyUEIx?=
 =?utf-8?B?dFY4TVlJVVdmSlcwcVkyQTNYdDhZTER1alZ4MXV0K0pBSGJRbkxjQXhMUjZO?=
 =?utf-8?B?Rlc0MUM1N00wMFFDN0txdHArd1BkT3NZZld6dTR0aTRlT1lsU1poSWc0MU4x?=
 =?utf-8?B?cVpxSlhpZFNPaENveU9MVHZ2UGEzVmJmdzkxUHJhZWtKbXRjMEhnNGs5YUw2?=
 =?utf-8?B?N0p2cTlMSFQyemZCdkFXYlJUdEk4SGZFQWR0bCs0K25XeDNaRkNXd3dhemNY?=
 =?utf-8?B?aUNQYkd5M3FUNi9wTitJZkpTbFBZL1dZMTdhMVZJTVN2cE1ONFIwcWk4Umlv?=
 =?utf-8?B?aThZZ0dnOEw0cHFvZUVFSWZqbmxsRlVzclRSQ2J3VGlCN0U1YzJRK3hWVFIv?=
 =?utf-8?B?Q01ld3hEUlVrUUdSem1BcStCeWx3MzB1ZUNZSUt6YktVMzhVQmpyUjY4QXFW?=
 =?utf-8?B?QVN0RXA0Ry9zekEzWXI4QU9VQXg3YWpyYlM5R0MvTHRTRDNESS8xNy9PaDlS?=
 =?utf-8?B?akZjdmR3SDBaY1V2RW16VTR2c2JKR3NmK0NwSk51alc2L0pQTndrTDFLRjFt?=
 =?utf-8?B?dnZLUDg0N0loNTN2WDdobXFLQm5Yb2NvWWJIdkx5SHRYeHJjbGRjZ0NwZkU4?=
 =?utf-8?B?TFNxbGd0ZVNPcjZmTTI3QTJtVDlFcmd0enVZdlNjY2ZnS05EL2s4b21qVm80?=
 =?utf-8?B?WlF0ZVl1T3FaWW9NbE42Q01pV1RYVEtMUnpoOEVJbVduOHlaK2JuSVlLNE44?=
 =?utf-8?B?czFnS0hiVFFzTis0VnBOV25MQ3RFbkg1blVPdmtPQ3FQMUQxUEFQQk5DeGdK?=
 =?utf-8?B?Mkh6T1hWUGNDbDBHZWVLanBuK0Fnb0dUNExZNklyT1JMN0lHcHVONWcyUGRz?=
 =?utf-8?B?bkpINEtXV3lDd29nRHF1L2YyWThhT09ZWkQ1dWFXR3dJa0ZJbjM4dDZNaDVV?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d944d1ff-8c06-41bd-1ede-08dd92c311c9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:41:07.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMw7gDeNAan148ZKjf0p3Bcw6sYBSAV2DbBlQvc9FAlbnd3iPb9cVHtHuimxcpjylqoW0/JHHkA80AnrJrIODW2nvBPii/PHWShZzUj+Tfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
X-Proofpoint-GUID: LQrn4xTiHv5TSJc4Zlf4JXkOlkh38zYF
X-Proofpoint-ORIG-GUID: -r0ZD6hom5_rN8ZZsumjP5Sa-fZwXBdt
X-Authority-Analysis: v=2.4 cv=IIACChvG c=1 sm=1 tr=0 ts=68245726 cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=q5OqYBDIcOxboOIrZhUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA3MSBTYWx0ZWRfX79kQthAYRwRH /KZRaJnO0jh+kChJS0kYCbvRIqZ1C3CJDkPSQNgeuwZkwd6bzeEIUW/Qch0ITItUhQLqUjK16j8 tMZOLPSO+LdXH4kIQBB8OIJ7reFidh+oCkRBXcEGpEDMgNMJlIjo7OJYATVK3iOH/lnJhZ24d6v
 vAJrhLgv4YWOyafhwBUSrTWEazp58mN0ktZHofH7eUrOVHFmHNq3TdNbzRd3+tGfL0KlpnAkBTg JfUcWO+8VIDO8LpuPQHUfEujeE3yONc953DWLvgqml3nXGZt0W2LuNS2Pu/C+DciL4d93XgvjGd ln4ZSDRVDE33mWLJlp2GRHPruSqy15CTS/GSvXrgpwkv6CTUj9uN2HWcsaLi87CqwGqzpTRKmi2
 HHvRurMjz6bSd7bFIwMUuB7nR1x3lrsxQL0fXWUhMRi7YDQTRlThfoJ1QQeeruicjzU1HAof
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:41:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216487



On 5/14/25 15:25, Marko, Peter wrote:
> 
> 
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Robert Yang via
>> lists.openembedded.org
>> Sent: Wednesday, May 14, 2025 9:17
>> To: openembedded-core@lists.openembedded.org
>> Cc: liezhi.yang@windriver.com
>> Subject: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for single-binary
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Fixed:
>> DISTRO_FEATURES:append = " ptest"
>> PACKAGECONFIG:append:pn-coreutils = " single-binary"
>>
>> $ bitbake coreutils
>> ERROR: coreutils-9.6-r0 do_package_qa: QA Issue: /usr/lib/coreutils/ptest/src/yes
>> contained in package coreutils-ptest requires /path/to//tmp/work/core2-64-poky-
>> linux/coreutils/9.6/build/src/coreutils, but no providers found in
>> RDEPENDS:coreutils-ptest? [file-rdeps]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-core/coreutils/coreutils_9.6.bb | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-
>> core/coreutils/coreutils_9.6.bb
>> index 6e1867f3e4..c9fd3719d5 100644
>> --- a/meta/recipes-core/coreutils/coreutils_9.6.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
>> @@ -211,7 +211,14 @@ do_install_ptest () {
>>
>>       # Tweak test d_type-check to use python3 instead of python
>>       sed -i "1s@.*@#!/usr/bin/python3@" ${D}${PTEST_PATH}/tests/d_type-check
>> -
>> +
>> +    # Fix for single-binary
>> +    for prog in ${D}${PTEST_PATH}/src/*; do
>> +        if [ -f $prog ]; then
>> +            sed -i "1s@#!.*/src/coreutils @#!/usr/bin/coreutils @" $prog
> 
> This should have ${bindir} instead of hardcoded /usr/bin

Yes, you're right, fixed in the PULL:

+    # Fix for single-binary
+    for prog in ${D}${PTEST_PATH}/src/*; do
+        if [ -f $prog ]; then
+            sed -i "1s@#!.*/src/coreutils @#!${bindir}/coreutils @" $prog
+        fi
+    done



   https://github.com/robertlinux/yocto rbt/cu
   https://github.com/robertlinux/yocto/tree/rbt/cu

Robert Yang (2):
   coreutils: Fix file-rdeps for single-binary
   coreutils: Drop 0001-local.mk-fix-cross-compiling-problem.patch

// Robert

> 
>> +        fi
>> +    done
>> +
>>       # handle multilib
>>       sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>>   }
>> --
>> 2.49.0
> 

