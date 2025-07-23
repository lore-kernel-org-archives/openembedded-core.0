Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C19C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 02:13:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4915.1753236819408495164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 19:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299900d39=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N1jQoO1418584
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 19:13:39 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1kht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 19:13:39 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56N2DcUN1464629;
	Tue, 22 Jul 2025 19:13:38 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1khs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 19:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXBYMt8pY5tpojlH+LU7NoVH6zoitnKGLvutbZamU8zh9Hl3IiLhM29H1d6Fbiqs9MicvP3x6KIlvkq+6utibgiC0fXoC3sbzWc41dcnSuZuuMSikeZFTQZYeRFWGWXqoMbOg5DxczFB0W0/MiVdcHKdYqAC0BK2vMHCDkXQ8dkndrJBvMIRFisVohQ2sbcrovxlSXqjv0zMcx0xEZt7Spy7B3RDOvihm2lP8Lzxp5QghPAUEEIkzITFHGPOo/70ju3Oub3GSznleGy9h7UMDX1ATXQvi+2nDOKOWJF+2ma8HkHzSoNX1SvZ/idO/18vHq7d5hl2W1lv+5SsXUCuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJb/DBo0WBdVlDuvhLuuOsK/5cNpefzMr120hOVifNc=;
 b=Dm2vwXnARX+cKu3qMqQE/1EAMe/uWdu0p2A1BBg0bhLphFTeWwCjCukcBC8X7tslX7ZZhWWWf2xac9QlwAIbv0QvmAvz1MbH73WF7Qv21ZYvzmwaI1GoBViLY4mRXBpc0THIIQbKabUfW+NY65AFc4rAn6tJ6tC5bRl8UNY1j2PAmC5YMz5OnIeDr2ci0oTOKDn1iGRmS6QX5je/4nupLWKrUfD7hFEIvORj7rp3JYGiJOEEJKGM8qNrxJmXzzTAF2FSlTsbA8GEPY1iVosSyZxC/te61yD+x+t7lbIAm7ldigL8JbJhqjL4UsUi57El7KYswofd05gZy4BSfsUr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS4PPF2EEA5C68E.namprd11.prod.outlook.com (2603:10b6:f:fc02::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 02:13:36 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7%4]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 02:13:36 +0000
Message-ID: <8ad50cbc-ca25-4253-ad02-411db0f8f234@windriver.com>
Date: Wed, 23 Jul 2025 10:13:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 4/4] lttng-tools: Remove the scope resolution
 operator with musl
To: Alexander Kanavin <alex.kanavin@gmail.com>, mingli.yu@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-4-mingli.yu@eng.windriver.com>
 <CANNYZj9f__cZUjYT38jyYPiVTFtwiP1bWCwNt1H4mWXBwUMh+A@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj9f__cZUjYT38jyYPiVTFtwiP1bWCwNt1H4mWXBwUMh+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c1::9) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS4PPF2EEA5C68E:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe7c6ba-0248-4803-f7e1-08ddc98e87fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZzB6QklralV2aThVV3lZZStwLzJkKzduSGZXQ3daR0pZaFJPRmZzOVlsV3Nq?=
 =?utf-8?B?cWVlTytaVW9lZWRrRUN4RjZrc2ZYOXpLa2NTSDNTYnJTVnh0K01rT0xLVDdH?=
 =?utf-8?B?NWxwTWliYkFuQUF1NE02VkxxUjdxb3duaXpLQWt2KzJpWUpYWWJSeUZFbmU2?=
 =?utf-8?B?L3ZTMW1qYXlxOG1jdWRvZi9iYkQvd3hVb2J5dFZaSjlXQWUxeG5qMjl3V0s4?=
 =?utf-8?B?aGg1enRsZHhmV1FUdzhVY3NyOW8zV29sdHJSaXJhaG50bllwQ3Y1LzF3RENB?=
 =?utf-8?B?OEhpZmU1U3BSOGRydVZRUmdJeGFzUG1xY3B0ellnTnEzRE1yUFRpWVdSVnFi?=
 =?utf-8?B?MTcraTZLQjl3VCtCMjFXNnFvWUVaVUJZQkdVUjhWVUJFUDl1MzFlbUFaZGp4?=
 =?utf-8?B?a3VhVXhqZEM2SU04YVU5d09HNGFVbVpMZjExYXRQWldGT25xM1laS1RvTUpE?=
 =?utf-8?B?bHBzVDZxdVl4SnZTREpjVy83VHZJSGF5VVJXbmR0b2JzbG9uaTIzeXZaRGl4?=
 =?utf-8?B?MTBvcVR5UGdkanZrNms2S1BwdWpkeDc1a0FFdTA0RnRNM3Zqb25RTUpRRW83?=
 =?utf-8?B?VGloM202cXZEOTZzZXRDZGFyZVVDMEpyMlJlaTlETXQ4ckkyQkZ6b2VpQ1Yz?=
 =?utf-8?B?V015Q3ErTUVoWml2NjVGenZ4NWtuT2UvQlFXSGgwUDY0QnNSb3dJOHkyYzZn?=
 =?utf-8?B?d3ZONGJFbFA1KytHS3ZHWFRtWWFnaGp0QXEvMWNFMlpVcitDK3AzL0x6RCtm?=
 =?utf-8?B?aXI5blZyRm4rVWZEc24vdmttSXRhdlpnYjRJYXMrNVMyWU1nOUZITy9lam5H?=
 =?utf-8?B?OFMyVXpmYUg4K0lEaTlkNjlhWUpMOFRMN1RvNXNiaGlnS1FQUEkzUFc2Y3F6?=
 =?utf-8?B?U0d0ZlVnSHF3dXZvNy9ldm1mNkRpYVg2WU5rMElmaFJUdTZIK2kyY25WSUFR?=
 =?utf-8?B?cWhYZHdTaTA2RWtKd2Z6MUdNajBwYzFxUlRadFBMS0lNU1FWOHV2Wml2cWNH?=
 =?utf-8?B?b3VNZ0x4ZktXQXVjUzQ3azgwNEN6UXJ2TmpvZ09EK0t3NGlXd1pTMytRTmpx?=
 =?utf-8?B?MGlWUlBqR01hRk1pV21XRm9ZQXFDNE0weG5QTitqYkV3cnlIbnpmdTZhYnM0?=
 =?utf-8?B?RUtuQnNza0M1QXdCZStyNDloRmZHMGg1OW9GQkhnMndFdmdTTk94WU45SzRF?=
 =?utf-8?B?ZkFObzVmVEd0bVh0V1FoT3MzZkxVZzRtcjUzN0lhM0dUM3dCU2M4QUdRWTRR?=
 =?utf-8?B?OHFPYzdlREMweWlQSVZJd0FNeDZkTzN1SnA0c3RzTTFYekp4YzBlYVkybDBW?=
 =?utf-8?B?VTJxd2ZjYytYYkJGZVpmYmJjS285SXZNU0gvYWpiUUI3QWtWbE4rSVZiSWhD?=
 =?utf-8?B?SUc1YlNEQzZLZG5QUndhMzVZNkRiWTZ5RHZ2RDI5WTVHSkk2Q0hQMlBTSTBX?=
 =?utf-8?B?d3JZcVdPbE53VHRCQUI1Z0xZb0EyWVBRcFFwZVpDcVJOdDNrVit0V0wwTkll?=
 =?utf-8?B?dHBoOUJENG9pMzJtbktGallNNzMrZVBKZGVDT1BhY1FnWmxkQjVxUXZWdmlI?=
 =?utf-8?B?b1d6dFd3bGJ0emxLTTR4TGFiZDloalBsSkJ6YzY2UDltMnBhZDBzNjJXZ0dD?=
 =?utf-8?B?bFZmdzU2ZWwzMEhVQk9XMmM2NTlNemFOK3JwcUZFWERabjF3OUFacFpLYnFa?=
 =?utf-8?B?bXdJMUdESHFzN0VYb0Z5VDJUQ1daKzM0OUlNWkF2Z1ZpRG1DNVpPVnYzZVlP?=
 =?utf-8?B?Z05KQ0NoOFFuTnlhbTBJM1Y2R2NFcEdyc2U3S09iRDZoaDZ2VUdHdUFvM0p1?=
 =?utf-8?Q?+Euhlgxv+qGfAN0zaI2BtmWAfylMh1V9NrsgA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1ZGdEx4d3JwRHNleWRra29uNzdGaTRBMHpUeDJidWV6R1RLTVdoZDFWa2xB?=
 =?utf-8?B?QTdZRDZZWUdGb0JEcGtVeXoxYTQzbnIyd2NWem9SSm1TdlN5RXpjYUl3Zk9h?=
 =?utf-8?B?K0lGRVVvNW9BK2VHblJ2dURZRGVEZWF0UHZkdWIrS0VRRkRQeExtL3YwRGEw?=
 =?utf-8?B?R2daRXk3MDlKbGtIVDUxM0VlSzdxUVNmSlRPRXRhYi9neWU0bGdscTdnOHBJ?=
 =?utf-8?B?RlYwckZXUEM1VWRZRlNKQjF2RmgxNGVMOGppVUlISVoraFRzUUNlazg4SVNY?=
 =?utf-8?B?d1UwVkQwYzJJWU94WFZtZ0x0a1NVVSt4VHVXcURJVDRUcEdVc2l4UzI5d1I3?=
 =?utf-8?B?TWc5V0NxeWJpcFQ5b1BOTHJESWd1U3h2Q0FTaThiWWhNRFd0Q3AyMkJLZUJv?=
 =?utf-8?B?TGJjZHhEbnExQmIxanQxUitxMlYwR2xmbWVmUmN2TElpZzdGTFpITms4S0lw?=
 =?utf-8?B?aHlma1AyRFNBUjZxdWNRaWpCaERLQmMvcVdxOU9WeWNtN2lUbUFWNHV0YlpN?=
 =?utf-8?B?SEljQTN3V3NpSXBjc3FuWDdoOUNGK05xWFpHQUtXdklJY2hCaGpCcXhpY2ZJ?=
 =?utf-8?B?VHh4VmxFdGFRSnBWaUZzSmI3Wlkyc0t3azFobUZGQm9iNUV1WGkzbU51blQr?=
 =?utf-8?B?UlpLOVFvSUtCS2pZWmlCbHVDZDFSSGlTc0pHcHVsMkljRUdFc2QrVncxd3VR?=
 =?utf-8?B?cUFvcWZvVmFlUEV2aDJVMW56N093TmxEK0hjRWtXNG1oRnFhTm9nMENxS1NS?=
 =?utf-8?B?NEV4aHZCQThGQmUvMXRZNnJPeW4vZ2hnYlBJc1AyT1NVOWpEdnlzWTBHbG5S?=
 =?utf-8?B?ZUc1UU9WYm96Tm1SN3ZFOUhJaE5UMnBtaEhvUnZtc0ZLY2F4bjN2K2Q3eG1k?=
 =?utf-8?B?ZzFnbXVGVy9HbTE1aEZYK3NBQUdGN1FzSXhVOGR6c2t6cGlYVHNKSUtEOVRu?=
 =?utf-8?B?STQxMzk3R1J5Rk53cDJ3Sk9DVlErTWM5WllrcnBJZzhGZCtVblhORkZsck95?=
 =?utf-8?B?TGNJMUs4VWlFTmN2NkM3RW1kVVpndzdOdEU5cTcrQjFpWS96clQra2IzbHZm?=
 =?utf-8?B?ejRhUE15SjVDTWloQXgwSFR2RU5OakJjMG9TbTQrOEdoY2tnL1ZXY2lRRnd3?=
 =?utf-8?B?bzFuOUp0R2ZVSWQzdjdCTUtTTUcva1hMTkViR21SUjdkc2E1YWUyNDYxVHZm?=
 =?utf-8?B?MXZlQlhEekhpaG1ya3J0NVBleDFNMUc0cVBYd0VLZFprTXllcjZaQTNJY0Vt?=
 =?utf-8?B?QU1WV0drMEdDR2c1bDZpekcvRitwQnZXZlhRNGVSQTVaVnVLVWp1OWxHQmMx?=
 =?utf-8?B?WXNJRnptdTNtM3VLN2g5VjYvYWFUWXZkTWd4RXYwMllrdldPR0o0WmRmZE9p?=
 =?utf-8?B?aWZ6R3hPUTROOGIzTW5xbVhKTlpzMktXUTFxRm83TTRYL0lCajJ1dXRYUnJy?=
 =?utf-8?B?eHJkdzVHN3VKdldqUWkzYTFUTmJVTEIyekpleXFKWExiSDkvVWVNeWJSMmt6?=
 =?utf-8?B?MytIR2Q3K29TdEhNRXhlZHdQK1VTQmlLLzZkODlXbms1UlV5elQ2Q0Q1Qk1w?=
 =?utf-8?B?aXNhUmVPTnZ1UWk1SGNmVlF3NWZ0YzEvYytHZ3M0K3I5WUg4czNYSkVGSnVv?=
 =?utf-8?B?SVZ5aG1PaTgraGdQQkcvU0NxN1NRM2crWkgwekRsODY2SU1kTkZSdlM3ZDc4?=
 =?utf-8?B?Q3RCbDVTR0tBeUZ6eTFObGRKY1VBS3RLcTJJNkZCdm1yVVFXK2xXSzRlbmU1?=
 =?utf-8?B?NG1DYkkwSVdIL3dxZGp3V09PekNvdkdnTlZNbDBYWmo2S3VJSERsRi96dTc1?=
 =?utf-8?B?cldBSjgvSy96SXI0d290Q2VLMXVEc2Q4aldwbldCU3hIM1VVK21BRURCUDJm?=
 =?utf-8?B?UlZRL2tVQlQ3c0VIR0N5NWk2OXBFaE9tVjNoQVUxRXl1WkZGWktKam9ydDEy?=
 =?utf-8?B?Mkorak5NVm5jTEVMNDVnRXVWMVJQdnBoYlA3cjhFbEhrMENKYmFUUGlZc3N5?=
 =?utf-8?B?RDVoNkZkdjFaRHNpRlg1eWw4WnhSQ3JrMmh3NktyNjZCK3p5cmFhNVFseHZj?=
 =?utf-8?B?NXkva2FnYkxhblI0bXZjaGJqaXRpaFRNNDhwMjdENHpMWFVHT3JJS2w3OHgr?=
 =?utf-8?B?RGFRdkY2bWtFZ09wdWRBVDhEakdHUERZdS94bmdOaXZtekZvWWlXbVVvRlls?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe7c6ba-0248-4803-f7e1-08ddc98e87fb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 02:13:36.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQpAz1qAah7yWHYzEmnQhLIGI11gkenk7EnbHNkofvPqP4A8tDBT08kEceWK+VCr4F9NsZChSRLbdBVwpO01aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2EEA5C68E
X-Proofpoint-ORIG-GUID: wQIjBe9-EGsH2fjsHXXo-r2UL5S9b95Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxNyBTYWx0ZWRfX/4jdufLTfmsH
 0JvCdDSrkLuxGYDRqfy/ZA3Rzsdf6yj1BUgdiDuFVdiMFOwvtkzPgbPY0Fcth/4Rm4y5sgcLm2j
 Q1fLc1B7KunDk6B2brqthCYSoeNGgMlSWZfEXf8I7IR+eQzrxSQF+OldpQU/bxJVcWtrCZYAczR
 6BoCERPCEwfQR7EbCQqZO9zEKW4a1rshuU0rgZdFClf8lOs+Zbesa291+9rjeTdJLKy3FDpEAcV
 0ZY4pQNKkVTXabxFaYOEIsu5NDUcexH8qpqt1plANQ9k4WthWoYedMC3Y9jokcSERAAKecP0it3
 y1VNZER1SQdvajC1iXyjIf95KgkRO7v0/YRtaJGMkjMeNwHYhulhJxEA/J+eHqSQOcUKhx5NH8j
 nJAc3JqL
X-Proofpoint-GUID: F4rmN1F0UfDpL9pXfxCO5g5kRyLy2SPp
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=68804553 cx=c_pps
 a=B1juiKOSPdvfexZtvkw8XQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=a5LkSv8FAAAA:8 a=Q4-j1AaZAAAA:8 a=B3tshTXhnTx89bcv204A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=E2cWBXyb0kjxxB1PlMdk:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 02:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220776



On 7/21/25 17:39, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Sun, 20 Jul 2025 at 11:00, Yu, Mingli via lists.openembedded.org
> <mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
>>
>> +Upstream-Status: Pending
> 
> Please no Pending patches without a clear reason. Submit upstream
> first, or at least report the issue.
> 
>> +SRC_URI:append:libc-musl = " file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch"
> 
> Why is it conditional to musl? This will cause complications on future
> version updates.

The build failure seems only occur on musl.

I will report the issue to upstream once my account on 
https://bugs.lttng.org/projects/lttng-tools is activated.

Thanks,
Mingli

> 
> Alex

