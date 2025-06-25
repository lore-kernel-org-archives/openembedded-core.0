Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D239C7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:22:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12017.1750846944259842944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 03:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271d9b6d9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5Yd5g014379
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:22:23 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14v43u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:22:23 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PAMNKM021738;
	Wed, 25 Jun 2025 03:22:23 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14v43s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 03:22:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJVOzgeLZMRbHXTDi71fTJW61tzsWXb+T9HHyTkyctI5g5gEMI7EyidyHxzIBeVJMI0jyXBnUeSEjNoUM/74UDbg5j85Hcv1ggBrZY/pdSfz/FlvZoVkklhgZoVyEK7D4LorPtaA0eBYzEMQiJMvHuRNELFM08YoleFbDpsjLJVnkidQdyNpyQGhm1D1p437WKtwqNZLfdLRUAlwmUPENsgChW+t5VKJa0c5f57//QpMIhbogoxqhoSDGcHpyc0R6fm8aVT85P07MA0277Vx3X+PQng/ycJDRGUQlT4dDbaR+12Be7iG+8f3qX69/VzNg1wNGuoG96o4oDVtExFbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8A9uMMs+mcZTycO0Qxl8ebDBZXfPeBGsmxqRCjftSU=;
 b=aqy2upLrOcWisXXuGaryuzXMsUoAxmLeQ+s9JiniccXFeS99A1R/FKy9yZT5DXJ/PHXVtjzlYw5lzuW3J8s/0lswfSwIAsVVW2/HPQSWWFvZYUdOcAJj8pAwQgetHUlgLAAS7dElHQH2UyLdhEJX4IathsIAKV64OlZKlrwJPwAS1KeOF3Sd+MTZLakZUTPb+YsrmqqdNblBzFCSom179v7zZWQJqdbXKo9bGQ//wqo6pHeNs1hBKPFskYEglo4atyFyW53+dF6WNwnhtHgXy1von0lTmOyEpcVs4QciY1nPG4PR8NP5GQStb73BjU0FBaeFObiRJo3WH7PbZcsWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 10:22:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:22:19 +0000
Message-ID: <515c93ba-5b3d-4007-a4a6-a5dffc1df668@windriver.com>
Date: Wed, 25 Jun 2025 18:22:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 8/8] psmisc: fix runtime version when using git
 shallow tarball
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20250624104155.559827-1-yi.zhao@windriver.com>
 <20250624104155.559827-9-yi.zhao@windriver.com>
 <47b30bbd84054b6ff891f6d7e74d582c9374f7fe.camel@linuxfoundation.org>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <47b30bbd84054b6ff891f6d7e74d582c9374f7fe.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: f11ac81e-ec16-4674-674a-08ddb3d22a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nmxac1JCNWdJdlVmZUFCRTVWdllwVmtpQW8yMGc0bWQyTy9UQ2h2Qml4Z3FF?=
 =?utf-8?B?ZUJiVFZXeXhqL1RPdGQzdlVzSzF4Y1A1SEpZLzliOE9GVWdIS21pQnF0U2R2?=
 =?utf-8?B?MERCTDBFZUFPNnpJNm15eDh3OFk0L1RpdkRUMXA5WE9vOTF3ZW5tWVZIUHlD?=
 =?utf-8?B?K2xVRkdJaWQ3dUNhdDVKNXhTdHpQbUFlWXFDczc1ZWNpclNmN29Yci9KckdP?=
 =?utf-8?B?cXdSZG5PaEpWMzY0TmpRVW1YbnFuQ2dMNUJIYjdVYXp4TVZ2enNFV29STTFR?=
 =?utf-8?B?ZzlFVnovVEgweXZ2OThkSW1iZUJtUjV3NkVBRGo2eDV6Y0N5d01mamI4ZGtn?=
 =?utf-8?B?czlrZURiaEZER2pXQ0dKbUJkZGRQNEw3dHI3SWFrbGpWV1R1aGdwRUhNUkJh?=
 =?utf-8?B?SWppT0FObFhwTUVnMUFVV1JZeVIyTlY1L2VycmFGQm5odDB3RmRaR3BKalNo?=
 =?utf-8?B?RDcxbE1HMTNtMytFWDkza1d0Qk81ZjJMT2FJekJpN2xUTzVkV1dJdHpBQnky?=
 =?utf-8?B?MFJCeUdrMktpYVlQN0hSZnBJMEhqQmV3b01pU0lreElhSVExamJiMDRvYnlK?=
 =?utf-8?B?VllvU3JtU3RFK2VFOVQ2VXBaY1hjb0hQQnhUVmY2NW0vSldodjVIMkpRKy9V?=
 =?utf-8?B?dDAwRHNvc2d1bzZvU0VtcXVqSFR1RVR2cEd4VEhYZDg3cVUvaERKSzVNeXQ4?=
 =?utf-8?B?eElCeHg3aXpGbEpaUmJtemM5bEtVMkhOT1pXcVU3aHR1UU9QcEJaanI1cnQ5?=
 =?utf-8?B?UHc4SlhFOEh3bzBSK3RLMTRMNWp3dkExb3RBVXp6RW9CQ0hsMU9rUnhVa0hp?=
 =?utf-8?B?NSt3dFY0Tk9LU2FYaDM1RHE5UU9Qd1FSY3lyaWRjcmNTdkpxZWxXQVhOTnZk?=
 =?utf-8?B?MVlGdHlCMFZZTUppZ2dwUGV6ZlRMcDQyTkphYTdiV09mU2gvSFhlT0ZkUnR6?=
 =?utf-8?B?VTJwOFk3WnQ0VE5oSzZCK1BkYmhtam9JTldEWEFEL3N0T0pOcnVLVVVEc1FJ?=
 =?utf-8?B?OWtuTnpHZFBlbzZlYmNXZEdQS0YwVWNwekVtV1RRSnQ4OGFnNVF0UzQwNUNQ?=
 =?utf-8?B?SFZtZXArY25PQmpKSHh5WjJjSFc4MTFoaXV1dmVEb3V2bHR5Yks5VFdBNTB1?=
 =?utf-8?B?VGZjQU9xVW5ydGFvc3d1bTdpNTNYaGpCbU4yQ0tQNGdhZW8yZTYyK1Q4TDRx?=
 =?utf-8?B?Y3FqZVBYbjUyTXlucjdtUnVuN0x0NFpyL1ZobEVHMlZJQVQrQktDd1BJY3hZ?=
 =?utf-8?B?VkNPSmw0MUwwZmpscUZvdlAzN04wK3BMcjIrUTBuOVVzcllyYXJIUUFUWnQ4?=
 =?utf-8?B?R1ByUm9KdXB1R0lhS1VyWHYvWUUxaWZueitGL0JxYTIveUJPb0dxeFArNm1n?=
 =?utf-8?B?cjhxdkhtQlA3WWI2M0JITGl4Ym1adFJhTEo1L04rVFlPY0RlRUltTEh3Ukds?=
 =?utf-8?B?WXJmcnRCS2k5VGhvb1NjY1FrcHNTSDZlci8zRC9sNWR3Ty81Y2Y4T2F1QUYz?=
 =?utf-8?B?RzdCMk9VVjY0bUwyYlJNekZZblUxRllQeXVBNW41b004TGNxQ2xid2l3R1JB?=
 =?utf-8?B?Qi9pejRaMWwrZlJYb0x3ZlNrUmV2Ulo2VHd0TnpxOXlWbGNiczliNmFqRGND?=
 =?utf-8?B?T0hUdkR1M1hud1RXKytWUXVRN2ZCRUN6NjNWemI3aHdaTmh1aUF5a01kZGFQ?=
 =?utf-8?B?OUZyclJjNWF4SHVrNTJjRVZpYlVYdW5kTktZcFJSbHYrK2J6NlB4NFRMemdi?=
 =?utf-8?B?eDNJaFZsZlRsRWI0Nm9mK1M0TDZRTks4Qlp6RllCMFJzcUQxYm1yNXMwUUZo?=
 =?utf-8?B?aGxVQUJjbTJHbEd1V0RFOExhN2hjVUdWeW16MUZsMzU3OVhMOE5mUWhSeHhu?=
 =?utf-8?B?ZjAzN0hJZkJhSUU1THY3K0lLYkQzNnIyL3NVQkozbmxqQi9CdlV1bVZvcURv?=
 =?utf-8?Q?swuatwJ/7DU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnpjcmlMLy9SWHBGYlJiRjBjRm5mSHpEMkgrTDNKRWV6K3hBQVZpbUVyNll4?=
 =?utf-8?B?d20vN1JNT0VhOWpVQWFMamtnL1luemQ1SERQc3Z0MC95UW9lOVlnVXkrZGt3?=
 =?utf-8?B?YXRHL2FOdFpaeG0yQmdOdnVmR0ZValh0MVEzTTFoVlhNM2RGQ1pwZUNDbkNQ?=
 =?utf-8?B?Mk53enF1bERUTnNqbGZnUnFxN0lnaVhJVml5UFAxRkxOUWpXdmsrS0t6azhj?=
 =?utf-8?B?S2lLa3NROVBtaCtNRUNGYUtHc0g4bS94UUxEMU83NGtyaFJFd25MemljazBz?=
 =?utf-8?B?Q3RaZXFvQStqaU96WmpINnFDaUN3U3BoMjF6T1NkTVI2K29sQzM4WVhLSUdw?=
 =?utf-8?B?L24rUUQ2UTNUNFg5MTNVRkl5N1l1ZDV6UytPbjV2a1UyeHh4TlJnM01XWm9W?=
 =?utf-8?B?OXRXNG11TUJzVG5QMUlWeFpQQkxIQTNieEtZWjNFenRXU29RbVp5eDgvU0xx?=
 =?utf-8?B?TlN5NGJlcTVxV3BVOGtEYTBFOHJYZXJKSkxKYXB5bk1odUNwQ2NWWUg2Q2ZP?=
 =?utf-8?B?QnZETmRMa0pja2dPSUNHOGpSWTNrNHBRb3NncnFubmVwd0lGQ1NGak1yT284?=
 =?utf-8?B?ZjJnSnZXNlRGMUZtVmorWDJubUpvVVR0M3NTbnFDZ2t6b1prcFBKTnc4ZERu?=
 =?utf-8?B?a01kNitsMVI5RzlhR0dZa1YrNitqM050WHZHQUxqODZwS1Z6cWhja0FBREN2?=
 =?utf-8?B?ODdnRlpySUtxM1BjVnFBaDZKaGZjZFVDd3BlUHJFMXhsU1g5bUhESkZ1UGFL?=
 =?utf-8?B?S3RWSEtqWHFVcllwWmFDV0NNaWRrVUZabXV0bTc2TTczMU9XS1F2T1FtT0FV?=
 =?utf-8?B?ekFabmlFMnJkT1U2M3NOWDVwcW9OR0lnZzgrYWJBN0Q3TVhMV2JId0VxNU1v?=
 =?utf-8?B?eVVwbWhzQTlWcEt5NDlOVnMya09ieVBqb2pFdkJtejRGek5iZmRJOWc1MkFH?=
 =?utf-8?B?SDU3T1JJMlhiMzYwd1M0VWVJVFArYzFld0NvUFFMTklmSEhYT29pYjlib0hv?=
 =?utf-8?B?QzM0VzlwN010NU5tWjM5T0lZNU4zTzQwT1NIamxRdWtscFhvSXN5Qmw0UWU2?=
 =?utf-8?B?THVqeEk5ZXhjRHllWnJ6ZVJEODh3ZVVzelcxcjZxNENrbFZvcUxHczlObWJ5?=
 =?utf-8?B?MCtmQjFpdHMwTGxGVEJLdnNKKzhPamI5Mk1yRFJIOFd4MERHYVdqaXBubWFs?=
 =?utf-8?B?TEVQUUpObHpDTWVLYXdZdksrZUtpeW1WT1hBVW5jV2V1M21kWkdESWZVQ2sv?=
 =?utf-8?B?alo1OHFQMU9vb3R2cmUzT1VueUw4cUlBT0g5cG8wU1lrcHkraTNlWVcxSEFC?=
 =?utf-8?B?dWxwUzV3aDBRV2haUWdxWkRibENoNEJBQkROSlc4TzVqZXQ1R09pcEdrMXRk?=
 =?utf-8?B?aGJVMzc4YmRlOCtxL0d1UnFaeWFFTGVFYS8xdzhob1orUDFLN05iLzNVRVR3?=
 =?utf-8?B?S3JSbW9vWVM0MEJOZE5nYVdsKzQ4cjhyeWI3c25kLzMvUWdidVpsRUdEelZT?=
 =?utf-8?B?UFpVbng1Q0N6WWVMb3BjMzNwdlZrMTlHZmFFS3A0MVlYcDZHc2ZYZW1MZ3Br?=
 =?utf-8?B?Q2lMWkZad2JFeWJDOENQL3NRSXpLV3VycTdjb1hwbU1YOTE5STF4RnBpWGkv?=
 =?utf-8?B?ejJSVFhmcnlyd09wdVZteGxlTWx5YTF4ZW9SSzhnOXJPYlUwY3Uyd3hYRjdG?=
 =?utf-8?B?MkRZYmw1R0xUVSs2V2kwRldheUgrdzVwMXd6bmViajNXM0VjN2tKclRCYk9q?=
 =?utf-8?B?aGxuVjh6L2V3b2xLZ3pqak5aaUwzd0tqU0FSZjNVQmt3UEJXMUd3bVdBYTFG?=
 =?utf-8?B?eWRxK0x2MTFOenUvZFBDS0dyQWs3SXh4d1EwYWpxUmllbVllRTFRZ1JjbTVT?=
 =?utf-8?B?K25SSFVOeEtvSHFsTkp0UFkwTWZOS2pBcTMzUkVSeEUyTk0wTzlld3RlcXQz?=
 =?utf-8?B?Q1pxK1B6MFhDbUtmNHFNUXZjZ3JGbDZwYXhZWVBXbGxaNXR6ejI4clQ2VWda?=
 =?utf-8?B?L2J5cUVHeDFWQkR3MmF2NkxGZDhMZlNRVzdldzd1QmhpSCtPTXoxeGtKeDlq?=
 =?utf-8?B?VEZRQTNHRlAzWG01RWcxUU1VUHZwMGxZNlhmU1EwMEllam14aXdWZ3NIeCs1?=
 =?utf-8?Q?7gQG4X6VylGL8mqOEW2Zgnj1m?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11ac81e-ec16-4674-674a-08ddb3d22a87
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:22:19.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tm6EE8d/e1+HEsiJ6unNhT8uKSS/lpM5QXxI9g06CHq8f3Yf9e09TqZVbTcZ5n19sPB8lCv25NiCKnCT/lyXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
X-Proofpoint-ORIG-GUID: h1M0U7eOwlWeH7dQHL1WimQKOudCGstR
X-Proofpoint-GUID: H_KfKY34-YkScwR1i8YvYSf4028HGWi9
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685bcddf cx=c_pps a=yTUqMNzyhI2g20p/7sZWRw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=J4y1w8RkoLXfHN4ZFuwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NyBTYWx0ZWRfX50nyNK9BJ1Ht T0WLq8m8foTjPDTdalQ97o7cSsn6ODFe/d1lU8KB4/MUmpFo/uMB/q5LZrvwh/WX3MWvvwuq7mY Lil3fe3QuEbu4vToIZfY8WZYlTfcAkwlOBuC1ybfCyr5BXjydm9AxQBiKQmmrCP8mWPg23qxYAC
 +cMTO4FG6R2YsAisxkbN/CFuw4qckYqxCdKCHMxlrqKc7W1Pocmpz0i/tNmXWBKdFzSqNJsJAgM 6D8xRm+FadgHVWv+v2iUV5ukWopy4NvOCoK5i5PXz1gxlFq/WWMUkr/CprGLfi8HUjFstXX0MVW lg2770cmtQ9awppozEsGBoZ5rWn09H/GHwuqFJ2rEfk4zZEyH+OvXqI0VZxXzGm61+Bp/CEZiwS
 shklJle4H+8cj2CBuDajqs1h6N+jva4vDQLshHVfh/6rtFPx2yy9XU8OyLj3UOIjS27hLxK/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55P5Yd5g014379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219312


On 6/25/25 16:19, Richard Purdie wrote:
> On Tue, 2025-06-24 at 18:41 +0800, Yi Zhao via lists.openembedded.org w=
rote:
>> The runtime version of psmisc is generated by 'git describe' command i=
n
>> misc/git-version-gen. But when using git shallow tarball,
>> git-version-gen can not get the correct version due to missing git
>> tag/commit messages. This actually breaks reproducibility, since the
>> generated binaries should be consistent regardless of the source code
>> packaging format.
>>
>> Add a .tarball-version file in source directory. Then get-version-gen
>> can determine the version through this file instead of 'git describe'
>> command.
>>
>> Before the fix:
>> root@intel-x86-64:~# pslog -V
>> pslog (PSmisc) UNKNOWN
>>
>> After the fix:
>> root@intel-x86-64:~# pslog=C2=A0 -V
>> pslog (PSmisc) 23.7
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>  =C2=A0meta/recipes-extended/psmisc/psmisc_23.7.bb | 1 +
>>  =C2=A01 file changed, 1 insertion(+)
> Does adding the tag parameter to the url fix this?

I have tested it. But it doesn't work.


//Yi

>
> That should cause the shallow clones to fetch the tag data.
>
> Cheers,
>
> Richard

