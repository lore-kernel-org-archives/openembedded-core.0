Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F66C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 16:49:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.64577.1749487751312178143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 09:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8255ad8ce7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5595I84a025157
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 09:49:10 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq41vdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:49:10 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 559GnAAc029975;
	Mon, 9 Jun 2025 09:49:10 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq41vdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 09:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ki8P6cnXYJ5w6QTnYeyAxLxMMRiaxrjlPLlgwshreKyWRqC89bG3X4XyQGN+bn/kyVdI0VQ1tZdY779BfuMg0Hqntk7/UtOzS40SkuSrF4bha+ylINy1/PiuqvhR3KxYSgOU8h6PsQjZPhgj45cvEwRW+Twg8C0GnDUMZx0BW1PkicyN6fXb3feiDzxYwrAbqs4LozfZWnBpWNxiqJQmgpPIcHLAlU9+29gE6XKldgn4wmrc8LqzyTblxI1CzoAN/cbQlX2Eo1WNYUxl0aPVEf2n55T49AUCSk4grCfQNcOWB8sB96zUqc/QbtcGCtkg4oKDesjazwQPjT6L/Oqckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4NbV4hpSu1MEck1ll5kBiGSukgi94mIrzXfZd26HwE=;
 b=nfAYFy+MP/knPrKF4VWAEqFnicLAH7GYHIgs/Embsbze4ut0/Fe3+PE4SxYqmKkoUnC+NT+gG0dAu3blqQCNPoK6jzCWwo1AMllZHEjYGYS2tt9VYCg8/Ne0uK9pcFEfOXUWoeyZ1vnNGG4AUP0vbxFLLru4q2d4yJhI7A7U6WnVAN/xcqnMsbsIZymvvM+uX6sWsxoyQxdBMac1cp0SKIGSoHYZhEQsPe5QetQe9S4po4t0gyCCc+J62/WWuQed1hEfL/9zyyV3CMDoJ9GiNGP2IeZtwKNs/8bUFbFxMABQ/fxRiQfwYBeimMNUuwx6+gePPsN7mmNNTjtMtUww0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 16:49:06 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 16:49:05 +0000
Message-ID: <287678d0-13af-438b-acd4-b48ef2f7060d@windriver.com>
Date: Tue, 10 Jun 2025 00:48:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] automake: 1.17 -> 1.18
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org,
        Ross Burton <ross.burton@arm.com>
References: <cover.1749092509.git.liezhi.yang@windriver.com>
 <186484bc29ea5b9bbefd86532a9a403050f46a50.1749092509.git.liezhi.yang@windriver.com>
 <f8d9f38f2dec2c1db8376fecef756627abba1fb4.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <f8d9f38f2dec2c1db8376fecef756627abba1fb4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: OS0P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MW5PR11MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: c5303089-0d28-4f75-ed1f-08dda7758bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z3hKWkltVlJlTjhKczRpMjZBUXUybWlzS0N6K2tXb2l3dXF5QjlTNGJhVjhF?=
 =?utf-8?B?czBMZHNibkRDRmlmMnloRGlFYlJhdEFWMGQ1THp2MjNHUHoydzRwVi9IZnFD?=
 =?utf-8?B?ZFF5amdvTVJoeWNlNlE4M2VDKzF0Vm9tYWl2K3lDVGYxWGlEb0E2V28yWXV6?=
 =?utf-8?B?MCtOMHlIdFF5ZCt1QjJuSTdmNlVvQ1ZvUnFVV2c1N3A0eU9mekNubmJQQUNT?=
 =?utf-8?B?L2lkczVwWnJpTEJycEt0UTBGeERzM1JMWno5dVcrQTNXbUJPSDF4Mi82SUNE?=
 =?utf-8?B?WTNPdHNSck5wcCtxOEQvUHU4MmdaRjcxbjlJaDZhNFZaZ29mWlpHQ0loUmNs?=
 =?utf-8?B?WjRkZVZqZnBxQlFLWmhVK1U4bm9kUVdRRnMvbGRxQ1ZNTUk4NG9PNDAyWExp?=
 =?utf-8?B?NUc0cXlNaXlnUXllbURWMk9VcDdlU2J2UGRBN2ozVXNFUGhCYkk1VlEvUDBE?=
 =?utf-8?B?RnhHZDJ1dWxwN3UyWE5yR05RYzJOVTNyUXNpZGhaVG1OYi8vV0hObGp4MnR2?=
 =?utf-8?B?L0svSUI1R0RhRW1TZXRqN0M0M0srRHh6cjdJeC9sVHJoRmdCVE9mVHFrNytl?=
 =?utf-8?B?UVE4VHR6cW04bmJKbWFnMUJ2MEwvNlhLQTQxUFJTMzVyR2Q2Q1N2YnN5eFdW?=
 =?utf-8?B?OHRsKzA5bkN6eVF4U3cxL053ODI1djVTTTI4bVBqb011OXdnNmVJNlp6TzBm?=
 =?utf-8?B?dlZFOElHN2g5RThjanNsYkxaMTRHV0MzenYrdXFCeDZpMWtxVXM3WGtlSXBF?=
 =?utf-8?B?YmpVNE9CSFhxc1c3eUVMb2hoWWRUaW9YaUJOSUE1eHp0Nit0VTBuRHpCOXdX?=
 =?utf-8?B?d2lVRWlDZmNYa2RkODlpK3dnOUMxc3VOdHJlZjBGMWUvZSt1Tk5ZdmVwS3Rk?=
 =?utf-8?B?VnMvMkJ6N3VZeVVHR3d5cHRYUm1DcHR1UUZ4dzZNZ043WXM5TW5aTGhKUDQw?=
 =?utf-8?B?dGtNWXE0Rk5XZFNLNEhVV3BkYlltdFVQZThka1RQTElzNHVuZ2E0VkE3UFM0?=
 =?utf-8?B?L3RXcW9GK0pjcHRkaE5ZUkYwWjBnUmo3VkNrR3NJTnVTdU1VUmRBcVA3QVhM?=
 =?utf-8?B?Qk85N3RaUVJIWTl1UmlBSUo5dG1qdUxGUVgwYjlUdzFpZU9wQ0ptcENhbFZz?=
 =?utf-8?B?Rituc3ptOGxBd3hmaDRWRXduYVowM0dqMmFMWFJlQlhZTjd2U2M1cnVPY3g3?=
 =?utf-8?B?Y0dOUXVUbVZxbW4rUXF4dk1XcERUNUFGN3d3dFQ2MG51UUVta0YxV0xvdllG?=
 =?utf-8?B?d0k1cHRRcnFhWnVaTE5HeTBWUEZURkdPbXdQdmZOVW0wSGlQbEFXZFVXaXQ1?=
 =?utf-8?B?ZUZLcWEwV1doNEV3VmNDNWF5SmhjZm9kdUFRclgwT3hpdEVSeXBoNlYwN0Zs?=
 =?utf-8?B?R0QvR3ZZcnpOVGtSOFN4VlZhUFBDa0xmb0FpeFRPNksvV3Y4ZjUyWUsrYVR2?=
 =?utf-8?B?WlBBVTBMQUtlWDNhbWVuZkROMjZpOUFSeFp6ZWZ6dkhvNllsWEloZU9oQ1Fo?=
 =?utf-8?B?SFJVR2J0d3JwbVk5T09JMkVXTlpyK2JQRDZxaFQ0RjlFVVZPUXVUSEdMS08w?=
 =?utf-8?B?NmhCbWFUNnJZWnlIRnRGRHEzMGRNa3Uwd2VMU2lkTEkxVnp3YzlwWWoyeXo3?=
 =?utf-8?B?ZVNWeXNHR2MveHkxNXJGZlI0cHVZeU5nZmduTlptdlRYOWh2ajY4VXpTbnR4?=
 =?utf-8?B?ZzZGR1VTSG54OWREZWdKaDdmWE5scnVQalIrNFRBNmdlaWpqSnQ4NFpPTERW?=
 =?utf-8?B?WkRnSVRNaHd5Y3JFZnZTMmJad3hkZ3ozd2RjN2RDalBqbG1FRnhwS0IzZzlj?=
 =?utf-8?Q?RReXHTkqm1UzcCql5enGT4155/FZOwz3Ji3vM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnpDZ2hOdlhGTW1ZWTd5UGltcDNGbFBUUGZYQlYyTDJjclQzVDFNL0VqQitC?=
 =?utf-8?B?UUJSYjlHcTJ2WlpSKzhPVURUMXBKb2k3SmxPcVd1NUtQS294SlFlU0xISHgx?=
 =?utf-8?B?S2lYV1AxdmdiNm1KNVhkT2dLcFFyRDBHSnRPUjBVeTVKOUE2S3lnT05TdmNV?=
 =?utf-8?B?VXNXT2QzY1F3RGJEYWhNVzBtcWRhVzg1bmtmMWVVV2wzcnpOU2g3Y2JUMHh0?=
 =?utf-8?B?cjVtemQxaGZjK3k1cnFYbzdXRkFpWWYxNFpLdkpleStsbmxLQXlWKzNLNlVj?=
 =?utf-8?B?MkRKdjFXTExiaFJpTHk4djl2bThvbjMzYWVJbDVpOHIxR0VHdFI4b0kxV0Z5?=
 =?utf-8?B?VmQvWisxeVJHaVRpYXk2bFoyOUhWZkxIdFJhUVJvenhrQldzSEpyaEREVDJY?=
 =?utf-8?B?NDRvMlZsK3hZQW92MmFNS1RKTWdPMjl2NUdKRjNLYkV4bE11cU5Oa3hZdk15?=
 =?utf-8?B?SEU4c1l3MVFjUnc0R3JGVlUycTdiK0NPQ2tCazNobCs1dnI2ZUJsQmlwbEF3?=
 =?utf-8?B?NzZLeHJJZFhleG9CaHBuNnlKTmpYeVhqc2J4b05yKzNaQUZSMk9LNU4zSFlw?=
 =?utf-8?B?bzMyYW05bm84VnZPcTB1K3ljTnkwWTZGWFVnZVpOenRhZnVkZC8wQ0hXejYx?=
 =?utf-8?B?U3M4Tk9IQzVKYndaMGY0ckxnTlVJNFVzN3ZrdW5FTXZzL0paeHYvZ05kaXBl?=
 =?utf-8?B?M1RGNlkzbVAvOWE3b2tRVnBGSHl1ZmdZRllWWDhpMElNUWgveGc0eks4Lzd4?=
 =?utf-8?B?RE1uc2VPL0V2TmtCOXpxZEdEMkhXdnJ1NElEdmxmdXpYT3hqSXhLZ0ZYTE95?=
 =?utf-8?B?TDlxNUwweDRkSk00WW1JRnFrQnVRT29xcGJLaTFjSEtadW9USnY0OS9vd1pY?=
 =?utf-8?B?cmY2VEttT1lsd280L2NUTmMxSkd5RGVvRSticGJXTmR1ckNrbW9DMWZhc0hE?=
 =?utf-8?B?ckljU1JGTkdMSUdYUVJ4d0J1UVQvMEVWZFA2R0tVRS9Kc0FEUEsrenpVcGIy?=
 =?utf-8?B?Umd1YmdkaUdhTk83bEpoQXlRL1lkcW1aSmlGT2FqSXVtUGFxVzRDeDlrQUNy?=
 =?utf-8?B?bzYrVGVzYnl6YUFUWHlXMkRLc3VhMHRUVDE0OWRUSDN5eitmN3pJM1ZKR2FE?=
 =?utf-8?B?aDMvVjdYMVZtbk9YVGZYUGt4enNuZXh1MlNEblFTS1o3T2xaSUJLSmxLaUJ6?=
 =?utf-8?B?cTN1cUJXakRya1FYY3V3SVB4czJ1VEl3Z2kyYWpKVkxkaE9lMkQrWURDT3By?=
 =?utf-8?B?MjZDZDNPOFg2UXVzSkdLVDlyYWJaUnJhYW9kOTB4OXZIc1grOUNoTEp6QzRx?=
 =?utf-8?B?Y00yQkZzNlQ0dWZRRngvWFpGcnRYT0V2YUJJSDU1RC9nMVgyVjVJamxiOUVh?=
 =?utf-8?B?SXh4N3pyNVRwNTlyRHA4ZHFWckljM3ErY25VUXk5dVUyVGlZbCtCbEJrZ2tv?=
 =?utf-8?B?c1VCZXpzUVpya21nMmk5N2tSM1FCN3BSa1h2OUVaWCtZVTJ5eUpJSkpUeko2?=
 =?utf-8?B?UGhEODhmQUJrYnZlYzlyeVhveXdjVERJR1I1dnorMXIrSFRzcjV5ZFl4VUdR?=
 =?utf-8?B?di91ZmU4czVhMzlYOU13SzJZaFBhY1VldDZ1ZDA2Tk5XYVpLb1B5djV6akZs?=
 =?utf-8?B?Z3hrVDFWVU5mUEtXbGZWVlNXRmVJVXpKdVgxWmY4VnVpMVd0YlUrU215OW52?=
 =?utf-8?B?bHdSbFRtNDdFS1g0SGV4Zk5kV0NYbWNJUGlya0l1dFQvbW82MDJVOFgvWmMr?=
 =?utf-8?B?MWROdHNMVlBTdGtwbHZNODVjVWdJUGdFZWUxYlNXNEY5YnVGRXhyWHR6TjlM?=
 =?utf-8?B?NHhLZVQ3QWlIMjNsZGtJM2x6SFFzSnU5dmZJN3oxSHVLY3RnTXZCdE01ekxs?=
 =?utf-8?B?SEg2RDRGWjJxZU5hd3ZENDM2enlPeWRPZlpNVjdXbGpPT280V1FJN3Z3SCti?=
 =?utf-8?B?ZzB4TWluallMWTBtMTJEdmd5MC9yeUI1U2djTkRmYmVueEl5cFlubGNpcFJV?=
 =?utf-8?B?V1RWMXZDdmVPZlBKczVlaVpucWJSOE5RVkxBS0w4K2NLMC9aTGszeHcvN3Jy?=
 =?utf-8?B?TEhWdS9IT2E4aVN2cHQzekZuT2MyVVJaRVFKeXpLVnVMQWd2ZHd3Q2lUMG1S?=
 =?utf-8?B?MDFxSmZobUpWbG1pQk45bEEwQUpKbU5iQWZyRHIycW9RbnZGNzFDbHlYa2tq?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5303089-0d28-4f75-ed1f-08dda7758bfc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:49:05.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cb0IdcML+pnvA2J/Cg9sRW8W72KdtY/KQCBvGTqCg+p2nBO3Keo9KkkLYQpPaJxzjE/KdWZtadL3+q/cR8PVp/n3Qyv9WPGhkx5uO2Qp4yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=68471086 cx=c_pps a=dee+0M1Q1T+dQojop58TQw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=AJu5Q4vYAAAA:8 a=URpGEo3zLx16c12pmnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=1OHxEZ4uPFp8rhvYjniX:22
X-Proofpoint-GUID: lKIF5tOkVjVKbA0Edb0jvJAleV_CVavP
X-Proofpoint-ORIG-GUID: nccGPc7wDeXZuXQA5BoJw6Ij8rZHIWXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyNSBTYWx0ZWRfX+48zFrqFYIRg ia4YWLogT/o4tAjpzlplVJWlWABbO/zBqpCMnbRjYB2okhbEs7dnZ7A+mOrwrjaDY5Bny0QO+cb Lq/Dz2W3mdt68jGQ0ZbElm4xcbYEXiqq9X8Pc07WCtjbq4z5aolPmLmb2iwQ2tAe99EMBU2eyuO
 18ttHCmxXdr3sXBxWq7XdqB4MfRc356S8GpXFBj+3nIAYxLQiniKNOuomGhZcYcpqHZV8wYvxRT f717DXzC+BulrNlm9iEUFZiISzcTM4oVgIIWoLhpodG2J9AA0bY9jb7p802qCnfQYW/0zwAYE4Z EHZt8cGVP8BVi2o10WxKuxpnjtvNzCpO9i1+D3inEQzUigx1KtQscffu8SEG2qTW+z+8lxW+RTl
 0dzy8vZRyERSHt9HWrlHHoblSzNt31lhcIwG8KarkEWdp/0ytv+K0zBPD0c+C0sRO+3sNqJ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506090125
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5595I84a025157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218300



On 6/6/25 18:03, Richard Purdie wrote:
> On Wed, 2025-06-04 at 20:02 -0700, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * Rebased 0001-configure-don-t-report-error-when-the-path-of-Perl-c.pa=
tch
>>  =C2=A0 The previous patch added a ':' before the line to make it not =
run, but now
>>  =C2=A0 there are multiple lines, so just remove them.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0...report-error-when-the-path-of-Perl-c.patch | 27 +++++++++++-=
-------
>>  =C2=A0.../{automake_1.17.bb =3D> automake_1.18.bb}=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 +-
>>  =C2=A02 files changed, 17 insertions(+), 12 deletions(-)
>>  =C2=A0rename meta/recipes-devtools/automake/{automake_1.17.bb =3D> au=
tomake_1.18.bb} (92%)
>>
>> diff --git a/meta/recipes-devtools/automake/automake/0001-configure-do=
n-t-report-error-when-the-path-of-Perl-c.patch b/meta/recipes-devtools/au=
tomake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c=
.patch
>> index 5a38feb16c..fd6d8affaa 100644
>> --- a/meta/recipes-devtools/automake/automake/0001-configure-don-t-rep=
ort-error-when-the-path-of-Perl-c.patch
>> +++ b/meta/recipes-devtools/automake/automake/0001-configure-don-t-rep=
ort-error-when-the-path-of-Perl-c.patch
>> @@ -13,22 +13,27 @@ Upstream-Status: Inappropriate [ oe-specific ]
>>  =20
>>  =C2=A0Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>  =C2=A0---
>> - configure | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> + configure |=C2=A0=C2=A0 10 ----------
>> + 1 file changed, 10 deletions(-)
>>  =20
>>  =C2=A0diff --git a/configure b/configure
>> -index 45bf85a..68d3c7d 100755
>> +index 64b61eb..786aefd 100755
>>  =C2=A0--- a/configure
>>  =C2=A0+++ b/configure
>> -@@ -3514,7 +3514,7 @@ case $PERL in
>> +@@ -3776,16 +3776,6 @@ case $PERL in
>>  =C2=A0=C2=A0=C2=A0=C2=A0 as_fn_error $? "perl not found" "$LINENO" 5
>>  =C2=A0=C2=A0=C2=A0=C2=A0 ;;
>>  =C2=A0=C2=A0 *' '* | *'	'*)
>> --=C2=A0 as_fn_error $? "The path to your Perl contains spaces or tabs.
>> -+=C2=A0 : as_fn_error $? "The path to your Perl contains spaces or ta=
bs.
>> - This would cause build failures later or unusable programs.
>> - Please use a path without spaces and try again." "$LINENO" 5
>> +-=C2=A0 { printf "%s\n" "$as_me:${as_lineno-$LINENO}: WARNING: The pa=
th to your Perl contains spaces or tabs.
>> +-This will likely cause build failures later or unusable programs.
>> +-Unless you're specifying a full string for a #! line,
>> +-as in \"/usr/bin/env perl\",
>> +-please use a path without spaces and try again." >&5
>> +-printf "%s\n" "$as_me: WARNING: The path to your Perl contains space=
s or tabs.
>> +-This will likely cause build failures later or unusable programs.
>> +-Unless you're specifying a full string for a #! line,
>> +-as in \"/usr/bin/env perl\",
>> +-please use a path without spaces and try again." >&2;}
>>  =C2=A0=C2=A0=C2=A0 ;;
>> ---
>> -2.25.1
>> -
>> + esac
>> +
>> diff --git a/meta/recipes-devtools/automake/automake_1.17.bb b/meta/re=
cipes-devtools/automake/automake_1.18.bb
>> similarity index 92%
>> rename from meta/recipes-devtools/automake/automake_1.17.bb
>> rename to meta/recipes-devtools/automake/automake_1.18.bb
>> index 4cda04e47b..9179268c7a 100644
>> --- a/meta/recipes-devtools/automake/automake_1.17.bb
>> +++ b/meta/recipes-devtools/automake/automake_1.18.bb
>> @@ -25,7 +25,7 @@ SRC_URI +=3D "\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi=
le://0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch=C2=A0=
\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>  =20
>> -SRC_URI[sha256sum] =3D "397767d4db3018dd4440825b60c64258b636eaf6bf99a=
c8b0897f06c89310acd"
>> +SRC_URI[sha256sum] =3D "af6043a5d4b3beef0c48161f4a6936259321cd101a34c=
1ab0768328515626c8a"
>>  =20
>>  =C2=A0PERL =3D "${USRBINPATH}/perl"
>>  =C2=A0PERL:class-native =3D "${USRBINPATH}/env perl"
>=20
> I think, but am not 100% sure, this resulted in:

Sorry, it is broken by the automake upgrading patch when:

DISTRO_FEATURES:append =3D " api-documentation"

I have figured out the root cause and sent a pull request to upstream to =
fix it:

https://github.com/libcheck/check/pull/363

The automake before 1.17's mdate-sh couldn't update libcheck's
doc/version.texi, so the doc/check.info wasn't re-generated, then we coul=
dn't
see the build error before.

I think this can also address Ross' question about rebuild libcheck faile=
d
with automake 1.18, it is because doc/check.info wasn't re-generated
with automake 1.17, then we couldn't see the error.

And for other recipes' rebuild, I've done the testing with:
$ bitbake world
Edit autotools.bbclass to triger rebuild
$ bitbake world

All of them worked well.

I will send a V2 for it.

// Robert

>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1630
>=20
> That build has documentation in DISTRO_FEATURES.
>=20
> Cheers,
>=20
> Richard

