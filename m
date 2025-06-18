Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C249C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 02:23:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37033.1750213430772466009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 19:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82646e00fe=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I25eN6002107
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 19:23:50 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkkr2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 19:23:50 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55I2Nntm028252
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 19:23:49 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkkr2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 19:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/2t3lJWu6ISCYhwIebW2urqqYwMEZiL1/LPYar7TKPwvnbpThwrAM+0H9oO63BqgY0+CjVZpzgzMOSOh6DjRCT50QhU+unqfs6VhMTaea9+ZfvB446ZW6q/OiXAOPDjP1ruUZTFk29SilaufcBCiphlR1QePvIK1NSkS4khVDq8DBse28KcAd7DQCrcBqThrxPCS6bkTIzI/f0ijhZXSTTVa19i6bFslThJOnxABXR57JbEjvfIDNtP8o6Nv/WlW1T33H7BfdDF5ZyWfUJfCvAJ8ZZgiTAhPa5tsA+m11YX5Gq0F7Vy5w6zFi78oKzO9Y8gBInWAUlQfT2lruVq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ESlj8dOnpnehNJDZJV89h8ipjG3ZPBbuU5umG0AgXs=;
 b=we1hBl1WIXTPsQ7+lPij0BgbHWBpcr6w0IhXKMAvjfxizuIqgSUDij9GFHSu1gC1CIrqZBdsXztG8Smn9bWHqVzgZRIfQKa/BseDaM1roBQkL+fC580Byw3kBKTNrJOiu7+fx971EGCaT4Zkq55SMJEs3xGgmxroFVmtq58YBLPuHtt6NAX7Rl8tDv+7mR89Jg6pYoKDF6zblmeKoP6qpZFbY+d4xrbUmJ/iUqp8sqEXbOrwEKisxF9flk/3TFVrV083NRXKO8p1ojXWznHHUhbkY8/QTfYD1iu1kklMlYYg5vU7f8yfxIjHePVa3w06sFyPJu7F5TZJsULc17t6cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 02:23:47 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8835.018; Wed, 18 Jun 2025
 02:23:47 +0000
Message-ID: <c37c69eb-c3c9-4c87-a0ee-04f7762adba8@windriver.com>
Date: Wed, 18 Jun 2025 10:23:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] image-live.bbclass: support to
 enable/disable isohybrid
To: openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <ef04783f-b3b2-432f-acf3-d3c826395264@gmail.com>
 <18473EB2BAA3DDE3.11623@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18473EB2BAA3DDE3.11623@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU2P306CA0069.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::19) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA0PR11MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 9415f1ff-1032-4af7-c7f7-08ddae0f27f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UG5JZGZWRVNIS0lGcVgxc0VyTVN0VXBVUThBVzhXQkZybkh5TVV1TVdySDBm?=
 =?utf-8?B?TGtOa2VJN2ErRmRGbTZuZGV0S0ZsbVJINmFPenl6YTdWWjlueThsNHNFTHhU?=
 =?utf-8?B?RXJkdXFYVzRpRVRBVDlJOGo4NWNrNyticTNPRWw0Q3NnYmFOUHJyTXNTeUhz?=
 =?utf-8?B?ZTlsOTd1ck82VXFycUNhNlRma0xzdHpKZHlhREZYY3liV3pCWkkrenBRV3hk?=
 =?utf-8?B?S2xVWG5BSzhMWkpHUHQxZjVCZTEzYlFOUUZ1UDBuNEsyOFpzdkljTDl5eVZR?=
 =?utf-8?B?emJySE5ET1pISGQ3TFA1ZS9SWjlzTEsvQWpwdVNIdDJGNW03WU1zZDhpeURL?=
 =?utf-8?B?MG1MSUliUGE3NXp3SE1ESkpqM2pGb3EvWFBoWWh2VGlTUFd3amZpY2R6dkFq?=
 =?utf-8?B?aTFEazVmVTgreWF6a3RsZCsyK2dNL3VYSk8yMDRpaHQ3YXVTakp4RjlFdEtj?=
 =?utf-8?B?dlFTN2lxU0NTaXhtSDBnaWNvcXJtUWpjVGdObVY5RUQvOXJMVWVIeFJHVFBt?=
 =?utf-8?B?YTEzdzRSQStuenRmUXI5bWNIZGk1U1QrSWF5N1RFRVRKeHVablRTR2RTaFhM?=
 =?utf-8?B?ank5aUFKTTVVd2Mwd3BBbS8ycVdBN1hlWitCUDRQUWdydmJsSXA3NGw2aFV3?=
 =?utf-8?B?c05RQXEzczZ1aVBDVmFDeGNNc2Y3ZW81TUp4MHJSajEwS0tOZ3hEbDZFU1B5?=
 =?utf-8?B?MXFBTW1BY1VBcVlVNGxnQ2l3ZjVmM1o5d3FtMFJPYlA3QytrSzQwaktFdEhS?=
 =?utf-8?B?ZTd4TWpTWWlpVjYzVnNDbStWRWFESjhhQnI3ejY1cXUwTUVZRk9CSDc0amtr?=
 =?utf-8?B?RXdCQ2NpYzAyNjBZcmVZbHJ6R3dRWk9Pa1JGYTFsVHd6ZnJqWG4zZXZzSVRW?=
 =?utf-8?B?UHlQSXJtNUlqMzA1MUtIcCt3NDhYWmJkYkhLeTNFcFh1WElTZE5pTGlya0w1?=
 =?utf-8?B?UlJiZTVocFl6WElmVkxJTjhJRWkrVFJxTHFXZnZQYkdjNVcyZmZNZjNNWndU?=
 =?utf-8?B?dVMrMDJnRU9mVDRhZEZTOVhDNVAvUHRnNVhnWHEzSWcxMEh3WG8wNVhXSkpa?=
 =?utf-8?B?N1U2Y0NEZ0tYTWdlVC9sRnlGTHVsTXB0clRObWVRRXZLSjYxdU9EYm9Obnl6?=
 =?utf-8?B?VzlnVUlwU1dSdTFlSDFNbXFkWkpjYi91Z1lBbTR4dVUvVDFXa3RqSlo5ajBM?=
 =?utf-8?B?UTFZQVJPUTZ2cGxlZ1N6SXpUTlI1bFdObUV1Q3pjNDl5U2FicmVIOHAzRFFn?=
 =?utf-8?B?bVBqT1NkYkk0VVVqL2lrM1ZyMlR3dVMybVhrdERVWDdqcTdNbUczRFh5UklV?=
 =?utf-8?B?Uk5SZGdmbHBzQW8ycHdhdUs3d1dZQUZUejM1Q1NGZGhPMU53MWFsditnVjBT?=
 =?utf-8?B?ZDBSKzNTdjF4bzZVcUlaQm5PU1Z6T2NUbVBVSzkrUHJ5V09KOUs2dTNhUlpz?=
 =?utf-8?B?N0traTV1THdKMk5rSVdBbVUzNE1hZ09nemxZVTdIMUhvTlNnTFpYVGsxeFQ2?=
 =?utf-8?B?dkx6WjZvRWhFL3V0d1ViVHhsYU0zMW0wNlJWMTNtNUsyT2l3NnhQRjZ2QU43?=
 =?utf-8?B?NnUrQWJkYjd5VDg3c09vN3kzdUJpVVozUWsvMVE2Z1JyaFdjZ3lsTjFDQ2Fq?=
 =?utf-8?B?b25KS2JsSU1iZWVLRFVRQVNlenZBWVFIbkxCdkhHNEJnWk01RGdXOGN0NURU?=
 =?utf-8?B?OUdsUUo3THRrR09QWkZVNndrMjdEZkhTdVZFT3dZOXk0UWdPdkVKaUdZTmNP?=
 =?utf-8?B?bFNPdmlQNitEbGJIci9RQ1IxV3dUNzlEa1JGbW1rajV4dWZrYnpsTnZoWXJC?=
 =?utf-8?B?YVBsRmozV0laaHl2NGFMQWZqNXdVYUFhRjhLZ2wrcmR6VWZZeTJPZDFFeDdh?=
 =?utf-8?B?S2FxckpTSTNTU0Z5aERZQzlXdGNpS2JSVHlhL3BCYW80c0FnUjhBbXd6V28y?=
 =?utf-8?Q?056Q9s06uH0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Nk5pZWdkTFVZRDZXbkdaUkkyMEdwdSswRjY2NVNrS2VDTFJqUnlqemE2NUl2?=
 =?utf-8?B?WE9wQUc5cTh1cHZLR0hxY2NnT1VKajlsRitNVEVieitqWVlvQVZ2ekVycU5O?=
 =?utf-8?B?cGY3Ky94dXRvTkxjOXVSbzBSUmJQZE1rYUIvazkxMzN0a1FGMWVxeXlNUTl4?=
 =?utf-8?B?eHJvK1p3SzZUNDZ5RTFVb2JVdlBuZExVQkllZTNIUmdUb1k4QzdHSFY0LzIz?=
 =?utf-8?B?V294aFVkektEZmh1SitOSVN0UThYc2FyR3d6aHdYQ3hyWmxPVmhMaDQ5Z0FZ?=
 =?utf-8?B?SXlxNHhPemp5RmhuRmlHd2ZkTDI2ck5NVi9VZnMwUm9tcmpJMnppR0VnRHZy?=
 =?utf-8?B?S1dXSndKYmFHZVJxVnl5dFFXMDl3TUFsdUVKNTUvSmRLQlZWajAyNDg2S0xH?=
 =?utf-8?B?aDNmSFVsZGkxWjZ0UEN3eU9MZXV6aGdsZDc3YllLc2VwMUc0Vm5mRVpQQ216?=
 =?utf-8?B?OXUwRHNzWXU1MnBwVCtid0YvdStMK1BHM3U4NlRPUkpRKzJVbVlqcmlyRHIx?=
 =?utf-8?B?UUJKa0NjY3E0RzNkcHRWdTdLbThFWFd6K00reFc4UndaVmNNOXZzVUV5Q2h3?=
 =?utf-8?B?Ukd3ZThJQnpnUkFuUkltYWdXVWZwNUtsRG1xMU5DaE4zUUFHWitYWkNWY2k2?=
 =?utf-8?B?QVFOR1FVdkJReFFmUDlVd0YyejBXL1Zoc20vZitOWWxJU1p5eXNKY21PUmVF?=
 =?utf-8?B?Z2x5ZlFWL056a2pQbnZPQm4vNy80M2JremE2NmRoTWtjaEZ4QjF1T29NLzha?=
 =?utf-8?B?Y3FLYlVmaVJmM0VOZjNKQXZNUTllV3ZCeVhTQXVxaEtTTm9uNWVxOEtsMUYw?=
 =?utf-8?B?VmpMbEd6MFhTNHlIekx2L1pJdXNLNXVGOXJzRkkrREZhTGthMUgvWFA2cFkz?=
 =?utf-8?B?L2xvQ0tsc2Y3V2l0RVI0aForUHRtOHQxYXFLdXNJbzhhQ2Z6L05WRHJYbzBy?=
 =?utf-8?B?ZzVyUE9OQjhNd2lIc2dSU1YzOHNLV1QzandwbStnMWpOTldUVlpmaFNpclZC?=
 =?utf-8?B?aUg5SVZSWEtLSTF5eXRJVWIwSkdPRzh2TFlhaHgvTHN4aHJ3enEvSTFQQUE5?=
 =?utf-8?B?eWU5aXRlZ1FtTXdBQ1Zhek43WGk5QWpmWS9UUS9kRXVURXRObG8vc1BqaGZl?=
 =?utf-8?B?Ylh1Z1hCRzRucXZSazZxRVdZaUNtR3VKMGRhWXV3ZDhqQ2I0UzYyTmVmNlpv?=
 =?utf-8?B?aEJ0VnBnUVp2dkJ4ZVZKa1dLOHVYZXd5VlhFR2tuNm9yQk9CRmtTZnFnc3BF?=
 =?utf-8?B?T2ROS25rVWFuQzFObWlGNmUvejlPK0lqWWN1YktIb1BBYTRld2pFcWtJcTVE?=
 =?utf-8?B?RmpBcUNnT29BZ1NoS21UNzNrSWRGakhJTzV5RXRDc0hkbDBHTXFrL2lIUE1R?=
 =?utf-8?B?Mzh6R0hqRjlTcGx0UkNVdWdwTkttWEp6MWdDVVBVNENzMjVuZUYzWFkzUzJa?=
 =?utf-8?B?MndqUkRscG1zc2VxU25YVGF5Yys0TUtOWHBvSCtMakNtL2QrYkpZQ3A4SlVB?=
 =?utf-8?B?MVRqNVB6ZFhGR2NrYnMrVWN1a3lpL0YzZEV0YWRFZnVIOVZ5VEthd3Jybzlv?=
 =?utf-8?B?UXNFSzM3S2VPTGoxMUNjSU1TcjRtUVNhQVRzWGR2SUxKZitGaWExd1lTbW1E?=
 =?utf-8?B?dktBQVZCY0Fic0h4V1l0VVNDS0ZsNFN4RmN1bXkzZWJvc0dnUUZvMlFzay9M?=
 =?utf-8?B?QTR2MGdOVmk5YzhOU2Z2NEVSd0lLL3hqV2ZDaVpOWWZBWDhDSGF5OFozaFNo?=
 =?utf-8?B?TzNad25sd0YwVlBXSit1MTQwMDlhaC85V3ZVN3QvL1FpeG9HZjA3WXRjYWRp?=
 =?utf-8?B?SjcrOFlEVWh1WGdjdk92N2xiUEZJNU1mWkZVb21xcmR2ZWlkeXJJbk9EK2dZ?=
 =?utf-8?B?cnRJYTFtVGJSM1hUdDdBa01DMU1jR0syUEZvR1VIYW4vcE9oeDhqaXU5emFO?=
 =?utf-8?B?TlpXbUZLZGVlbElCTWlJYStlTkx0R3JDSzdFS3V5TFdMUkhxb2FBTzQwZVBt?=
 =?utf-8?B?N0lVM0JuRGR6VkoxUnF5d3ErVkZYVHdOeGViOExEWWVvTlBRRzdGM01mRlR1?=
 =?utf-8?B?WjI5Qi9TOXBncFJUamNpL0M4dm9SUUxqRkk3TVRwSE1XcXFYWkQ3bHVjdDFK?=
 =?utf-8?B?czFZMmFCTVZ1aXFld2N5OGZWY1N0TktTTjlJRWdMWkt5ZWdNd0tkcmh2aWJu?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9415f1ff-1032-4af7-c7f7-08ddae0f27f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 02:23:47.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/6K4J0pwkGNlZYNLhc2PjIAmb9gNUuHDleVvFSWn4eKaWFd1bOE2xPCiScgr646iWJuMHfj3Zi0uCwPqdO0PQNIM4MyN/8/hjrGiAQsdvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
X-Proofpoint-GUID: XWWYuVC9mSvzFJ7OeTrd_wafiiVG22ou
X-Proofpoint-ORIG-GUID: rHU5BFU2FZUx_eCW0ZcC-lE_Nnu9Roxr
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=68522336 cx=c_pps a=M73KnBbWnWmIkrHh8bhXvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=kly1vLX7r9s_UE9_HLYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAxOCBTYWx0ZWRfX5hTG4M2UE4y+ jGWqBvDFGPjYytFRq75TiMTNMP+LrAOiSg4gtmsEKTj0bFrs3ohv/T5jIQjKMgNbZy151uwf6He OLIQKbRPaSOpISmG8GboaE5/ol80mg56jOXWtPQ0ynZXDK/nOHRkdamKL2gC8bwVCmaz94eTZb4
 uoufJjAokwa+MdsUP09a1/RiRu4eiLMweu89jw6D9x7pw3z0H3v+7UgVkzZd37IYPwpPKfAvG7H 44IzYd1+WYjZxpAW4wgZJwjXEDyF/cGoDkM37tdrrRPG1HvSVPiEt6ilU+7F8lTI4+e4Lu+gkrU 5vUKwurdX3RR8Ghhyd/A3wo9DBmC0++9njnjBWp3+vaRddVGD6SyOAd2hCVRIcwN3+GWscCvpCh
 PblH19uCgal93MBUNYBZaSBzP0qphCbmRJTJ5/NBXjBHcKnYqSzXGC2hLvjrz9l557YiIbH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=785 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 02:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218955

Ping

//Hongxu
On 6/9/25 10:25, hongxu via lists.openembedded.org wrote:
> While NO PCBIOS and EFI only for ISO 9660 image, burn the image
> to SandDisk USB stick, plug it into laptop, then boot laptop and
> enter UEFI mode, there are two boot options in UEFI system.
>
> Here is the steps:
>
> $ echo 'MACHINE = "genericx86-64"' >> conf/local.conf
> $ echo 'MACHINE_FEATURES:remove = "pcbios"' >> conf/local.conf
> $ echo 'IMAGE_FSTYPES:pn-core-image-minimal = " live"' >> conf/local.conf
> $ bitbake core-image-minimal
> $ sudo dd if=tmp/deploy/images/genericx86-64/core-image-minimal-genericx86-64.rootfs.iso of=/dev/sda
>
> Boot laptop and entery UEFI mode
> ...
> Boot mode is set to: UEFI
>
> UEFI BOOT:
>      UEFI: SanDisk
>      UEFI: SanDisk 2
> ...
>
> In this case, PCBIOS is not used, calling isohybrid for ISO 9660 image
> is not necessary, and do not call isohybrid for ISO 9660 image could
> remove duplicated boot option in UEFI mode.
>
> Add var-ENABLE_ISOHYBRID to disable or enable isohybrid, but still enable
> isohybrid by default as usual. User could set ENABLE_ISOHYBRID = "0" in
> local.conf to disable it
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes-recipe/image-live.bbclass | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
> index d2e95ef51c3..cf8efb2c9b2 100644
> --- a/meta/classes-recipe/image-live.bbclass
> +++ b/meta/classes-recipe/image-live.bbclass
> @@ -63,6 +63,8 @@ ISODIR = "${S}/iso"
>   EFIIMGDIR = "${S}/efi_img"
>   COMPACT_ISODIR = "${S}/iso.z"
>   
> +
> +ENABLE_ISOHYBRID ??= "1"
>   ISOLINUXDIR ?= "/isolinux"
>   ISO_BOOTIMG = "isolinux/isolinux.bin"
>   ISO_BOOTCAT = "isolinux/boot.cat"
> @@ -147,7 +149,9 @@ build_iso() {
>   		isohybrid_args="-u"
>   	fi
>   
> -	isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
> +	if [ "${ENABLE_ISOHYBRID}" = "1" ]; then
> +		isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
> +	fi
>   }
>   
>   build_fat_img() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218238): https://lists.openembedded.org/g/openembedded-core/message/218238
> Mute This Topic: https://lists.openembedded.org/mt/113544470/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


