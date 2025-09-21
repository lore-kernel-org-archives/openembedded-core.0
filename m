Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE76CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 15:19:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30673.1758467969458797789
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 08:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gcl6cv6X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1359713421=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58LEs4eK2562044
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 15:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/Mr2f+gg4Sif4xR7FwB4ydmyD4Xaned02dKMZ4pvXaw=; b=
	Gcl6cv6Xrb0O5aVDk4CTEmU72MvnKvT7xgDhqGsA8wn86OhtuenRMF2IwaJ9view
	3/KtUOm6Px46r4h/8CkFq3JJc29uSDv0HijOqMU44ssReK5PPQJV5uAlUF7ghQBo
	7XmkNfst0O3VBdrpSVNRKMdCSCJoQH6lsKi88RbX4o+PUKoI6n0e4xW+stRwx86r
	ueylhLrYTHkzLwWLEpwBr/raNDu3PT/Z9qf/MJHeu97gBs6IR5J4U3H3jA0fiwmF
	Cwy6UkIkC6c0BXiPXGTMO9hyyXT09J3AcoLkxIOkVAe90PZq1zb4X/yHRC8PKeDb
	172+Ew56Ic2pbVvqVG1hjA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1h1w4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Sep 2025 15:19:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whk5/cVikdYt48pysiTxlBn/ZpmFZxBPyqphw1xv7FOwD5lnSWIEQn6FvyoTGlhQit8DsFgRoQUDnQ32Vuu0P1lcWL0+CBEx5Jf9kWgUoFwsOfZG+elGCGoidMcKmHCq5deMTq+E4wz0N7M32VsGTxmh46H9WfBxAREZQm00ITSCHph8JxMaabZyEHrm5BhoqgSiZH46uMWaBCViIsWday/cNODYDT9J3oh+5B04xNnmqfmmOHALOBALsQ3KFGMDcF2DptPk0cz2UNBevcKmSTea6amjVh5RCA/dqQho4f6SJWGvDZno+kYE7QhFxuWJzTOMyW3esQ78HPTlqIsKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Mr2f+gg4Sif4xR7FwB4ydmyD4Xaned02dKMZ4pvXaw=;
 b=asLawzuoyNuPyrQAmWYCG1r7c7RcBqKJewo7FKtmRazoTVpBfmFT8MmuSYCZ5RwWyAGKm+7yGFMz+D+mkJ+19o1d3n9gLX+Vn93kHqcExT4SgpmSMAAJK3PO0mlLdxGFG7U0RcuPKY3oDWPJ7ZiEo3Bflm9YqhhF19/ys+4rQR/+rWLjWiKp0tXEryL4YESS23Qk5ndM0Ny5FHQCki5N6C5fnZC1v7N/tD06LDwVu2yLyQDZsQox0T/aXeyYx+bf328NKUZFLdlumuf6Ly6fOFAbi4ObzVuHTRgM+mMd99Kqx9wDPcKb3SR/fwWykNy0OnoE1n4fBls2pWj24szV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Sun, 21 Sep
 2025 15:19:24 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9137.018; Sun, 21 Sep 2025
 15:19:24 +0000
Message-ID: <859a5fd7-7293-406c-a1e5-a4b0737914cb@windriver.com>
Date: Sun, 21 Sep 2025 23:19:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
 <DB5PR02MB10213D9AC1AC7D4603BD982E4EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DB5PR02MB10213D9AC1AC7D4603BD982E4EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e068b8-7940-49c2-8d03-08ddf9223f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHMwS2lFZzVTM3k4alBpdlgybW5ZbkRFL1AxckJsUTZhanlCZytZUjFNY2FS?=
 =?utf-8?B?cE1mSkpYaUZyRzFHK1N4SmYzYThJMFFPWVA3U0RuaTd0RkdXMEwyTFBhZENw?=
 =?utf-8?B?TTh0eHhLV2RXRy9NRWtVeGE2SFBpanpUUlRJSS8yNW1EdXhkN0dHZWxpNjY5?=
 =?utf-8?B?SGxhZ1JHTElIc3UzTDNpa3VqUXdBbGpoYVRoZmdpb0ZOYVRCVTloWHExT1Bt?=
 =?utf-8?B?US9zeDNGc2ZpcDBRS09LV1JCMjMxT1R6NjNIa2V0ZUhGamtieGR2RkZjYmxO?=
 =?utf-8?B?Qmx6TjdtVGc1N3NoWE1jd1BsRTBFcmZjUERUSklVTXVGUi9qdGRRK1dscGFJ?=
 =?utf-8?B?bFBDWXc5dHQwR1FwRXI2OWNNdnRieW5odDNyQzdpTDVNTnpyYTkrVGI2a3Qr?=
 =?utf-8?B?Vmg2UHJTc214MS90YXRkMVJwd1o5bEEzWVUzN0lDMmtmb0pGcGs1aFZxbmUw?=
 =?utf-8?B?cDB1MVdEdGRhNkhwYmJodVd0UHV4KzRZU1l1Z1pSdHRkTCt4L1dsVEhSYzk3?=
 =?utf-8?B?Y0JJRVN1WXpjMFZFK1hLUHY2bTZBZEVEdEtyQTJ0bktlQXVyVC9sWU5HMUcx?=
 =?utf-8?B?bEhpSHpnWlRsUVdleXowcVIyZmc3UExaUmxxQ0dIVk42VFVrR2FyU2R5K2pz?=
 =?utf-8?B?djlhVmRFVHF5RFlwbW9OZUlBaGltT2J2cG1pSEluWDA0TkxuSlNvdWVPN3ZV?=
 =?utf-8?B?aXBDVCtlUjEyZlNQeFdtb2w2eE1nc1EwKzFEZjhXL3I4U0x5TCtOVVFOcG5X?=
 =?utf-8?B?eU0xcVpFSkRMdEh2Z1FneHl3OURKQnFGWE5MUzRKcmR4ZUxGaWlaZHBCYmdn?=
 =?utf-8?B?UU9ZeEdMN1lCVU55ZVEyUG9rdnBTVVF1NG5WS1djdFJIeGhKWFpFOEQ4WUx6?=
 =?utf-8?B?eU9wZkVSN3M0VGtBK2U4WWpocm00cVc1WWZrL2hTeVBVVGlydU9ZeWpYaHNY?=
 =?utf-8?B?RitQTFJKbm05YmJFZlpDZlJQOWpCMVY0eVN3ZmRKS3Rub0Fwb0RtaTZva0RB?=
 =?utf-8?B?aTM5VWkwZElyWG9DMDhtYTBmU3JZdWJTaU1ockV1TXkxZmw2dW5jRWNncDlH?=
 =?utf-8?B?R1Jad25NY0VFN2VCNlVGb2RRYVR0NXRna0haNGhsVlhQb2hyeU5mdDVlc09R?=
 =?utf-8?B?WDk4OUxCZ3FHakZOeVhLVUF2Nm9hRTR4TWZJQURXbDErVCtka2c5NVhYMm1T?=
 =?utf-8?B?VU1mdjhDbGp0OUxUQ1BiKzhWajRHaE11cFVpRS81a3JoR2dmSWNEaWs0Q3Qz?=
 =?utf-8?B?eFloU2dCcDhhcWJPWUFyWXdVTHJLOStQVlJWUEhKTU9ham8yajJVVVNRdkVP?=
 =?utf-8?B?elFkbWlVcE43N3BRN2pDSHFzTkJWUTFXd2h2UEw1R0FxUzVOcmdZanYyQWFl?=
 =?utf-8?B?bnR6VkFWYTJ0OEFPUVc0cmpxZTRGWUJrcGlHVXlNRkRudHZVZ1Q2YnJtNU02?=
 =?utf-8?B?OUp5eG40Y0luZFFZakk1bU1jVVlURis2ajV5MndLMU5GUzFtUHR0ZmVjWGUy?=
 =?utf-8?B?bTRCSUlIcWlDNm1wdzkwZXE1dGJyc1BUZVUyN1Jvc2M1M3VHRDhQdVdDV29K?=
 =?utf-8?B?M3pRZkFDVGwyTW5tZEhuRlhWTW5iNlVPM2hUS0JkZlQ0M2FVT3cvUUs1TDRJ?=
 =?utf-8?B?UkFvTlJhWWRwK2RkUHN2ekptMGpyR0t6TURSbHh3MU8yV2hiMjRxOE5mZ24x?=
 =?utf-8?B?YzhCdDdvNm9WS1pBWExscVZrZXN5dEVZRDcxRGVkQkVCYVpIRzNscVpObmRD?=
 =?utf-8?B?cHRRSkxzSHk5S3dmZW12UUlpcy96bnFMV1hqZExWV0V2T3VlRHNKOEFJYXlp?=
 =?utf-8?B?WXZjaVFEL00zNTc5bWV4LzYycEdzSHdtVHp1T0lnaGQxamZFYmtJT0RGays0?=
 =?utf-8?B?UEJCMzYzRGlCZUJSblVibXEwMVRuaTYyNlI5RGVKZDdpYWVjQWp5bSs3Zjdh?=
 =?utf-8?Q?4+IYOvV1bnA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WENkbTFFT21XNE9wdjFMVWJxQnkzZytmN05WdHpYOEkyOGJqVFIvMUJjUkhN?=
 =?utf-8?B?c09zOEhWUmYxa2hBK3ZKOERBM0ZJWDhhZ2FQSFJ0Q0F6RW16QnpERHc0bmZq?=
 =?utf-8?B?MS96QjJEMU93RTM3Vy9MaVpzOXNCeU5TNHVJSUJtRnkxU29kOHY0TlB3bGpD?=
 =?utf-8?B?SC8rd2ZncGcvdmlsRm1tbW1BWFJEVVFOS0dObE9zellnaFJobjdxQldRZXZX?=
 =?utf-8?B?U1FlemMyRExkbjF4RG9pNll6VEg0OGcrMFZzdVhVeG9DTVVoVGMyNG81SjlT?=
 =?utf-8?B?cncyamk0UFkrSGdKajlTZUcvemllWFo0ZmJmY1g2b010aGhadFdaQjlJMTBX?=
 =?utf-8?B?cFBIU3lpYXhvUkpNZGIvRTYwYUZidTBhNk1aazNsRmkxUDlKSTdDc0swUWFs?=
 =?utf-8?B?dzZhQ1pmVE1wWGljK3R1UWw5bTBicCtKOHVPb1VsRHdJKzkyU014U3NTZjRY?=
 =?utf-8?B?Sm5iOExIYjd4QWFKS0MvZ1dTVHZKUk9qTzcxRlV4MzA1dUN0bW1ZSnZoeXM1?=
 =?utf-8?B?WGtiZC9MbVJ3REZUMXFSeEhmWFQ5Zzg5YVFTbGxPcW9uL2VGb0tRYjZvckNE?=
 =?utf-8?B?WmNlNHc2MkhBay9FRkN5Z2lITEVlR0J1Qk9aSGlZVnAzTlRYdDhZREZsTjJJ?=
 =?utf-8?B?aEJKL2xNcTlTZ1NUWkw3ZmdGSEhhd3dQbnlidm9jMmRZQi84dlJ4WjFTMnJu?=
 =?utf-8?B?dUxNVHgwME5XbnNiWHZmUEE5OEI2elBDZmRUT1ViVkNoR09mN0ZnZi82Nnoy?=
 =?utf-8?B?bUUxZFFSVGcyR0hkcm5vODUwcEErSk9jbGRjVHlxbmVHWWU5K2pRWkFJMU5V?=
 =?utf-8?B?TDU0WFN1SzJkOVBkbzJpdmhqWHE1MnpuU2R6QXR0a0lhS1Yza2Q3aVltRUVH?=
 =?utf-8?B?bXh2U3pjSmJBV1AvdlFKR3JsVUpEZVU5ZVQ0WWN2dE5aYXM3d3YzbTlmZkFk?=
 =?utf-8?B?N1BlM1hSVGc5WWFVLzB2Y0RKZTdmMFcxTDljV25uK21ONmJUVEJhM01KTHpi?=
 =?utf-8?B?SzF1aXNuNjIwSGNtVXA4b2RsM1N5aVYxRmZTOSt2eVMzM0tzNTdMZWgrakJJ?=
 =?utf-8?B?Y2s0NHZNTFhBZWJ4TkljeVFDMXpsVGIwNFB1bUI5U0dlUDVGKzl5UFhQWUF3?=
 =?utf-8?B?MDA3NDA4dlhwdEJTYjhPYzkyT3JtR3Q1a2thM1dVN0txTkZnemp0bGIyVUkz?=
 =?utf-8?B?eGVPOFZ2QmNLZkpuN0pSdWNqK0wwR2pxZmt4OW9mYVIxRGUyREU3ak9JRlJX?=
 =?utf-8?B?VUxqODhnTm9jY0hFWUphM2F3K0w2em5FMGRlbUFkcjlSR1U4RUhMcXZTNERT?=
 =?utf-8?B?bURRWWkzLytaN3BaSUVudit0eVRSeDhiMmlVVDY1clhSdVloTFd0T2Y4RzVN?=
 =?utf-8?B?cWZ1ZTRoMlJqU1MwbnBraDJTaE9rMVVmaDVnditpSldSZE8yWjhLQWcwTzRL?=
 =?utf-8?B?SEMydHk0TjBHcmdCbk1ObWM3UU5ZSlJIb3BOWG5DcG5OdzBjNjl5L0xQYmVO?=
 =?utf-8?B?MWplcExVWWtxS1FpbjBMYXIvVjUvZXhJVzYvbnlvVktJaXUrcER4RUVxcXRO?=
 =?utf-8?B?YUZkMDVQTXZkYU8wUWk0Uk14TUgyT2JnVHdnZzFIa04zcTk4RVNhaGVGWjY0?=
 =?utf-8?B?eVZxUnJtcFhCYlFWWVBsbmpEVkhXclU3ckw3VVFOMjl2a254alY3czV5SEVS?=
 =?utf-8?B?bEVZSU9ma2M3dFBqcTU1RngzRWxQTGZUTDZ0NXhDeE0zMEdtKzRkSVRvYzFS?=
 =?utf-8?B?a2pxUTVicU56VjViNGhjaU1adUt5MXhVMTUrVEZhL3lpZWtKN1JnL0FzUDNu?=
 =?utf-8?B?TGlvemJzVXUvY3VISVBXeFpicmo2SUFzQkw1V0ZjcVUvZmNaT0RTVEFrV2U3?=
 =?utf-8?B?QW4wRU5VRWlHV3p3WHBQR2RtWlZMUCs5bjdHMnNWcXFaZmozTDQ1WXBJZWhq?=
 =?utf-8?B?YTdQYmxybXdNQ1dZSERkWXI3RGxOOUVmdVAyTUtHMWhOZXVrMHJWQWovTnpx?=
 =?utf-8?B?Y1hjQVQzRmtCRUlRMWdSOEp2SFkyWUhvb0pERWZNRDIyQ3d3QjAxVFZoeWd6?=
 =?utf-8?B?bkE4UjBtVzlrTlc5RnVuZUFoQlZIS2VFOGpoMjN2Ni8yM29QdVpPcW1Uemlh?=
 =?utf-8?B?VThXaXF6NEJYbmx2Um1NUldIZ084K245OU01cFpSaGYrWHRkNnhrN0JWU2tG?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e068b8-7940-49c2-8d03-08ddf9223f00
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2025 15:19:23.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KP7lxrUsyqYoiqelPmUEzVgDc+51QpnJ/CJJme66DKJ/MJw75bFIa5SDUvyQPSlcKW+2NqYNvdUJYpk1mJE3OdCuYouuJOr2JfYKkdcBsZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: FXsEmZqEed4gtPoDes9HmQSjv1Jsywg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIxMDE1OCBTYWx0ZWRfXwU0JBCq6dgT2
 j2TuuVPG+RnpAyVUFPfmK63sLm/KXX7FjfQ90p2JuMCTgqOgxjM/4Axva84u2PwteFJ2vZ7vRCW
 JWzc9upI4uEHx/zt9kJzEFPokWwrOdj629JUVqOL1Q+azWLj906tU8BbAGgMVBGgM/XMO910dXc
 tRLStzb/d5mKvL84lyKUP9bmmn/znMB9miLJ+NBTMc98Ehp9k8TPozXxrUF47DbXZa7QaAHtCxP
 Ih/8qLzuB/doIKnbLJDDwUIA1A6KqptnWhksdNwV8kk+0dLFBiajp6LMIvEMNkxNx3bOgAfGXle
 H/H8Ggfwwmj1rLpIfBB5FZDUAxBNKEsmSa9Umk3K5wZXaB75EuoCqh4Lwillmg=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d0177f cx=c_pps
 a=q3M5bEXgJc9IxHNyMLvWsA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=hPo9J5dZO8s5Hxgm7nsA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nCrHRO09rL05azxYQpvH4nZLfEOWphVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 15:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223801



On 9/19/25 22:00, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.org
>> Sent: den 19 september 2025 12:21
>> To: liezhi.yang@windriver.com
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
>>
>> On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.org <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, which can
>>> save the maintenance time in the long run.
>>
>> Yes, and it also add new features, breaking the promise the project
>> makes to its users.
>>
>> This update cannot be done without TSC approval. You need to get that
>> first.
>>
>> Alex
> 
> Also, this proposal was for Walnascar, which will be EoL after the
> next release (or two). Thus updating OpenSSL to a new minor version
> now makes no sense.
 > > If it had been suggested for Scarthgap and the meta-lts-mixins layer,
> then I would have more understood it.

I haven't tested it for Scarthgap, I think we need do it firstly for Walnascar,
then Scarthgap if it works.

// Robert

> 
> //Peter
> 


