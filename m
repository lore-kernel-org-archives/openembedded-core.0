Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2706C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:12:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17703.1739952719432153680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6rkx0009216
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:11:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgq0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:11:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHcPOaLrZ2nGGnzoV2Ob9yMOhZ/Yo92Ckq3kUW7/f0CEV3ZCWWOdYdRmNLmeq7R9c2yunA+8kD8b1rrZ3DUezVSku9jIooJgvypSrbVoKQiw8lK5TB/4K0cVL/edFDiVu6vM7b76gFvT1u+sdir5wF3Q84IwhJRaqG5YXM7ni9rT4VgtFB6MKbHwThmdeTaDV2N29gjESegDB+o/X0fLF5ar7xv7YQy9CwUWSfvO5ZHjvCPHzlkStmdvIuwBbnJo55uiVZPYexfaXokjjNLBADxDFc4mdkYrrvsmzDgeBQV+25M2revMTXINjhRZH/LXbk4d/xb/5lcBRlhawh9CTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72EIOfS02L8YFqoWhkLsG3MnAGZkvALqPCECuXYxS9E=;
 b=IP+vvD/cMtAoz+IgVkQqRf7Otf4lprMnHLOuYZcLo++RlW9Er0ZiwXaM8iya86jiQfEmyv7/p6ZCr2yJUyXXqd/w3eqhXXKOV6gOo21TKcAFLYsMO2lzJyQuj9DqkOjExd1VI+MNB0nDrHQnG9d0mSzORshMDj8NNnafrKUVq0v2/mNZS5lMs3d6F6+9UhMU5wNxImO6UkqMA/k+XD8OhVRNnN2aVe8ARE6CUxS/cTUn718v4grJJIXtvLM0gju2UwVEBFVDXCNEAw4DzP1luDb/mgQCRRrnrdiZGLhHVu3ZGRwE0w0wn4gbIGNwpPLdJk8HNxBUj9AU6kXbUgcmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 08:11:49 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 08:11:49 +0000
Message-ID: <ca285ee1-73d2-414f-967e-e4b916951306@windriver.com>
Date: Wed, 19 Feb 2025 16:11:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 1/6] u-boot: fix CVE-2024-57254
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <18258D786B3B703A.4848@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18258D786B3B703A.4848@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::12) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS7PR11MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ecec3b-ff1d-43b3-b5be-08dd50bd0f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YnZweFJPUHBkemh2NGhGRUlZc2p2Zm1kb3JGSk5TU3J4b0tmTVVsM2hwaGN0?=
 =?utf-8?B?ZTVWeTlmYmExRnhOc1NIUndwSG1NemFTcDBhU0tMY2o0YTNSY1JncnAwdmVQ?=
 =?utf-8?B?akcyYzY3OUNvS1ZzaFB5UE9pQVI3NElUSGYvNGIrRHlTMmFOWWU2bXNKeEtr?=
 =?utf-8?B?NHNZbFUwcS9RSEhCTitNL1hEVWNzMGxqamVRREtvNDREbC81cGpKU2VmRkx1?=
 =?utf-8?B?UUlUM3I1aXArRGNiQkVXdG5lajlnWkJUT0x1TDNlbjUrWFB3SFJyVm50dHZB?=
 =?utf-8?B?Q3FBaGg0S0pXaFpZWmhkWDk2Y3BJWGZKUEFKYm1YbE9lREh4dlBiMU90NVBY?=
 =?utf-8?B?THdMSEFyTEViM2grVVljajZDbzAvenhadHIrQkhINkxjbzVXQUhyK1dVQzN6?=
 =?utf-8?B?S2VNYXNTQ012L0h2M2hZSk85RHRKMmMvYlYyTmtuS1FBUGg3bFZ1OHVZMnZ0?=
 =?utf-8?B?eDRDQkVVYWRiSGMwbUNUKzY5cmswQ0R6SXk0ZDhhOVdEbXJTU3NEOTlVSGFt?=
 =?utf-8?B?OGdnaXlnOTNnMHJ3UFZRelYzaDlpYjJYcExwY29idmplMnlDNGJhRWlvL01r?=
 =?utf-8?B?bWg5VHFvZ0NUbkhteklPb2w0U1FkbkFPYXllRFRXbWtobStTV2JoU0xzSTdq?=
 =?utf-8?B?UHBNZ2NzL09hRWlWRE5uaDVOVmtiUjYySUFzdWxlSTN4WjFZSW1iWWFSL01o?=
 =?utf-8?B?dk9FTVZkQS9PRVAxSzJTRWc5Y1dqeEpLK1JrbGZGVmh4c2JOYWk3SEdGdG9L?=
 =?utf-8?B?MTY5MnhLKzhBUXU2aHlJMXRQVXE3MEJHOGNieExoMmMvWnFiS2NIMndtZ0Jq?=
 =?utf-8?B?MUszeVZad2VsQ3VkUkJDTFRGMDIyaU5Fc1ZVQWxOTWdkaUptdW42R1QvcDVL?=
 =?utf-8?B?MnlWdmdhTnBmZkJLaThuRm0wSk1YVDJXdFVBTG5KNUJ2TjhDZzRYYVB5Rkc4?=
 =?utf-8?B?TTMwZ1BtQVUvaStPWEhENlRxYXlieGV5RXdwVElFN1JsTy9TU0t4RDA3RTBm?=
 =?utf-8?B?T2hXQ2lFUzJCSmlDN1NGT0xWUVpXUXB0WXBRZnNkek0ybEZvL1A4RlY4TVdr?=
 =?utf-8?B?Q1Avb2pKVjE4MThaZ1NBY1VtSUk2SVFsUU5XQmhNaTZlZ3hvSXVkVzh3Z0Rx?=
 =?utf-8?B?aC9XMXdCTEFkeTE0OXRJME00ZVJNYm1YTlk4NU42elZxSCtOTVRQSnhjejR0?=
 =?utf-8?B?cXE1WW5KRng4TGp6U28zNjV1T3dHcEF5bkIxY0M0Q2l4QVBzMEFwem0zcUVz?=
 =?utf-8?B?Um40cmJpVWxvcTVKY1h5cEdWWWwrd2UrRDgvWXh1UFpxVDBRR1VxMTdKdDhZ?=
 =?utf-8?B?T3ZzTUdRNUNUc21UL3FuT3ZDcmlpc3BJUkRjbmtnVmJxY3dnRFNPcUQ3MHlj?=
 =?utf-8?B?RjlITENYcG9lNDFRcm1NcGhUeGlPVnR3bCs5ZWJmK1p6dUtxVlg2WS9VR1My?=
 =?utf-8?B?RU13c2poU2JHVDFoWS9tZjVOaGZYVVROaEFMb1lTUHFDR1pZdWVLa2tvcFpm?=
 =?utf-8?B?MVg1R2hJMWowVFJBaWtBTUxZQlZwdHczaEV0TUQ1alRYcFBZQmVVWTZWN3A2?=
 =?utf-8?B?Y2luck5NcEVkNzR3KzlLMTd4Z0xiUU0yK2swU1hBUVUvUTlnNXR5RStXLzNG?=
 =?utf-8?B?Q0cwcHc0a1BKTkJOakJQRkVKWFBXUjFtMENjTXpVVk5keWZYektzRjAxNEM5?=
 =?utf-8?B?WWU5WnpmZUtoOSt3OTRNMHF6Y1RzcFNUVmFQVHpYV2pGbFltcVJMOXJndG5H?=
 =?utf-8?B?cHlLRk12Vm9ZSE4va2ZPMXhXS0U1S09DWDhiL1hZMUZ2SFNqdzdEL0tLK1Yx?=
 =?utf-8?B?cUNkdktuUVFRU2ovRXJGUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDNJc2JPdnZpTG8xaSs4V0VxWS85cm14UE9pVktlOFZHbWNmRlR1bmpGYjJr?=
 =?utf-8?B?bnVhVHcxT2lsY0ZnMXV2TWR5RGNTdHRvdk0xU3oyVjhJaTNHTlNXZEJ3L0o2?=
 =?utf-8?B?RTJzVHJUZUpib3YxZ09sbnpzV1BQMXQrcGlmUlRqeEp0VlUxN0hrcVBKZnVC?=
 =?utf-8?B?ckFBVTVyZVVZRXYvd2VoK0gzejhTd05zM0xoVktPQWVVWWd4eE1xVnNBNitV?=
 =?utf-8?B?M01WbzNOellLeDdVRXZ5WXE0Q0wyU3ZvdTZQaE80VU01VWQ2eVZYQnUxeFNY?=
 =?utf-8?B?NzFsOVEzUmVJUWlvcVo1WFhvWDZCWUxPLzVicEFUREtGcDBGVmQ0TkVUVGRt?=
 =?utf-8?B?TnprUjhObUVadWNKZEhaZXdyMUhLczJZN0xBaDYwQWllb3M0eHloY1FmOUQ3?=
 =?utf-8?B?M1huRjZJdlk0ZW5SeFRDNG5UeGNoTVBGZS90SzVtVGw1ZGpXV0ZrNmFiNlJl?=
 =?utf-8?B?NGlXZWZnWnZYRm1rVE1mbjdFcGpMR0wyNFVjcGVBd001RitzQmJaNVRHa1l2?=
 =?utf-8?B?N00rclpSK3ZodWU5eUpXcTZUSlFRbU5nM2dkVDVPeXZQdzdWOVNSYTFtSHhB?=
 =?utf-8?B?WVZNRjdpeGNWblh1aUYrYmVIOU0rS0M1NXdHTjNQcWcvNU52NXNUeWoyMDd1?=
 =?utf-8?B?aXFOQjBISWhJZDcweTZWbEdXbzQ5MVpSTmFLUXpIeUV0WGlSc0RnZWdpM3Fp?=
 =?utf-8?B?Z214aDYyRXVPUkNmNllETjNYcHlScW9jSXpWUmFCS1QyVEFoM3RnTWNQalh4?=
 =?utf-8?B?TnozOFlyZ0hJOHd5QjAzQmQ2OU1KUzFZYWlhTTNWb2RPMUVwcit0dXU4dEty?=
 =?utf-8?B?NnR3dHRsUHg1dmduWnk0b1JJOFNJU1dqdTdxTzF5WEZycWlzNVUwNkhsdjVR?=
 =?utf-8?B?SWtTc1dOMzA4M3BzaXVDUEZ4Sm5WNFQrV1ZaU3grVS9uRklEY2JoSTNOcDlX?=
 =?utf-8?B?RGw0Q09aa0FueFl2ZFpBd3d5UEpsSVVCZGE0V0JSc0VLbVI5bVBiTml2SW5p?=
 =?utf-8?B?MFVOVGhJSEJVa1A1RHFzZ0paUmdzS0Z2TlZocFNxSy9LNTVEcUFMaE1PV3pE?=
 =?utf-8?B?ZFp4NExGV2kxOHB1b3F2Q2dBUGpveUxacXYwYW4wUjJtUldIaXlzZnlSa2Q5?=
 =?utf-8?B?UUdqV3plZTJZd2pmLzNIbXUyNWxDRlVTTmdPamhDbDdLVHVhSUNmakhLa25K?=
 =?utf-8?B?bEhqN2FvbHM2V2hmOVBOaFo2NzdKbnVkRWljcUZmQkoxZFlmblJ5akRZUkNT?=
 =?utf-8?B?NnpWMG5tdXN0ZW45TFVtUHB5cWNBcXFCSldXV1J3NDc1cWUxaU1uemNmSkFY?=
 =?utf-8?B?RFpBOUJhOTJZdDZVOGF1QWNESnh2R1NmeGVPS1ZiMXh5UXpPRURUTmFnSVNF?=
 =?utf-8?B?TkRiVmljdUJDQ1ZOZDBma1JkT01QTlFzanQvZXJPcG4zMVQ5U2taWjhqMVVo?=
 =?utf-8?B?UGNtWmdVUTVaSzVPamQvSmxLbEprVEtqaUNPVXFJcDNUUGh6NkhYazBxNG5v?=
 =?utf-8?B?U3d3ZGdOWmNWQ09jQnh5VVRxMmNiWXRSYlYrYTdqSGZuNHJYYWFyY050cGtB?=
 =?utf-8?B?TW9kMlF5b0RHV0hhVHZDd0hGS3NaWWxXZDY5b1NzS0J5aGNFM3dtOTlVbmpn?=
 =?utf-8?B?VTV6OFVPSjd2VHh5SkxCOGJoNHJDekJFay8yTUowU2JLU1VaRlE3Qmg2L09o?=
 =?utf-8?B?UG1jbVlDbGJqeklkdWROMnVZQzBUMjh1VWQyYWttUlNlREQzbmtwTlA2Y2xk?=
 =?utf-8?B?UGZFWTBIR3ZYQStwbVo4b0pqbmR4SFNyMEFUUU5zWS9MYmhBM0JIa0RxTXAz?=
 =?utf-8?B?bnZ4bzlJSis2M05KSEZ1MVV6Nk5xa004VVY1c2kwTHcvc1FqeXdEbnFta1JE?=
 =?utf-8?B?YXhheU51NVR1d2p6bWF3aFJLdndZNm1ia2hzcUZzZFEyOHJQYmIzMWUzelRl?=
 =?utf-8?B?WHlIdGxaajhraVZqT1FnM21waFIrbW5WUmFTekQxc2FiQktnZE1tZ2RSdDVh?=
 =?utf-8?B?YldzNUxqTjI2R1AzWi9WY0o2Nm9IZHFrSDZkallZank0UkFIWkljQ0NITlFn?=
 =?utf-8?B?Z2hJSHNmdDUwdHFTbWk0ckFtQ09NcGh6aGg2UVI4OVZ0eUR2VHIweml0OENL?=
 =?utf-8?B?aXJ0Tnh2RkZrOTRDQ1pGZmlUUXlZTHh4M011clEwRmxHbUpNZmNsYS9WTE9N?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ecec3b-ff1d-43b3-b5be-08dd50bd0f43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 08:11:49.3984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9DjmzzhBy4ALXkcqQ6o25kkrXeQ5ub6ywzDE4A57OlQhMLu+Zi8uh8igQpk1h3/ME/H3+/w/QhbULFQ8nmL+ShVDNqSUiCleTnMNisnuZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6064
X-Proofpoint-GUID: FkNfsEC4wOmypLvYt4y2sJwpbiaaAeH6
X-Proofpoint-ORIG-GUID: FkNfsEC4wOmypLvYt4y2sJwpbiaaAeH6
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b5924e cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=uDifomgq4XmizTexxXgA:9 a=QEXdDO2ut3YA:10 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211679

Please ignore these series 1/6 ~ 6/6, I lost other two CVE fixes, v2 
incoming

//Hongxu

On 2/19/25 16:06, hongxu via lists.openembedded.org wrote:
> An integer overflow in sqfs_inode_size in Das U-Boot before
> 2025.01-rc1 occurs in the symlink size calculation via a
> crafted squashfs filesystem.
>
> https://nvd.nist.gov/vuln/detail/CVE-2024-57254
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../u-boot/files/CVE-2024-57254.patch         | 47 +++++++++++++++++++
>   meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
>   2 files changed, 48 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
> new file mode 100644
> index 0000000000..be00121224
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
> @@ -0,0 +1,47 @@
> +From 3f9deb424ecd6ecd50f165b42f0b0290d83853f5 Mon Sep 17 00:00:00 2001
> +From: Richard Weinberger <richard@nod.at>
> +Date: Fri, 2 Aug 2024 18:36:45 +0200
> +Subject: [PATCH 1/8] squashfs: Fix integer overflow in sqfs_inode_size()
> +
> +A carefully crafted squashfs filesystem can exhibit an extremly large
> +inode size and overflow the calculation in sqfs_inode_size().
> +As a consequence, the squashfs driver will read from wrong locations.
> +
> +Fix by using __builtin_add_overflow() to detect the overflow.
> +
> +Signed-off-by: Richard Weinberger <richard@nod.at>
> +Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +CVE: CVE-2024-57254
> +Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/c8e929e5758999933f9e905049ef2bf3fe6b140d]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + fs/squashfs/sqfs_inode.c | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/fs/squashfs/sqfs_inode.c b/fs/squashfs/sqfs_inode.c
> +index d25cfb53..bb3ccd37 100644
> +--- a/fs/squashfs/sqfs_inode.c
> ++++ b/fs/squashfs/sqfs_inode.c
> +@@ -78,11 +78,16 @@ int sqfs_inode_size(struct squashfs_base_inode *inode, u32 blk_size)
> +
> + 	case SQFS_SYMLINK_TYPE:
> + 	case SQFS_LSYMLINK_TYPE: {
> ++		int size;
> ++
> + 		struct squashfs_symlink_inode *symlink =
> + 			(struct squashfs_symlink_inode *)inode;
> +
> +-		return sizeof(*symlink) +
> +-			get_unaligned_le32(&symlink->symlink_size);
> ++		if (__builtin_add_overflow(sizeof(*symlink),
> ++		    get_unaligned_le32(&symlink->symlink_size), &size))
> ++			return -EINVAL;
> ++
> ++		return size;
> + 	}
> +
> + 	case SQFS_BLKDEV_TYPE:
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> index 62ebe40cb6..d9c6fcb993 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> @@ -11,6 +11,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
>                      file://CVE-2022-30790.patch \
>                      file://CVE-2022-2347_1.patch \
>                      file://CVE-2022-2347_2.patch \
> +                   file://CVE-2024-57254.patch \
>                    "
>   
>   DEPENDS += "bc-native dtc-native python3-setuptools-native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211673): https://lists.openembedded.org/g/openembedded-core/message/211673
> Mute This Topic: https://lists.openembedded.org/mt/111266327/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


