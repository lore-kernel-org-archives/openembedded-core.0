Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8211104892C
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 02:37:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.112429.1772246248873389255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 18:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EemSWhz8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6519fc1318=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S2QSXF2397059
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 02:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ISbAKSP+CGDu0u7j3YAwiN9DNL6fQcb414ZzU8p1riE=; b=EemSWhz8v43j
	mFuFDoMXN997uIQ242IW1jn+eC5fzVy0+hPRy5Y4Jvog9mpVX5AcARdTFHeHLcWa
	KqWqAUv9AFwAeKjr3GQEwMyPodMSn2jQ6ZcOMeyCnXd5eQ1xyFNW8Bb+i9qaqh4F
	CCQvEX/WlUmkemNqV52/y1pvY+hkP06RyQ+ZoXc7LcXspI24wUT/rLIMAu6HX3wI
	y4l5vuexf3ytEJa2R5jnyVf/hmPC9oQsFzptKnaFi0RL/FQZNGUsoD4cT4207tHG
	9hUZ7XWWSymfhZExktlBP4SMUm6rB29+eswABwDlOn+z8GpEcSx4OXMusUhlk4Pu
	HEllDpulhA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4g0jc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 02:37:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQd2lNgEQS9JliibUddyfXj4kP6qXbdguWnykbcAYCUMfTJkLTUi4tG6bbYi7Co+FZcLKwxa3xaPtg7B10m+6VnKqkYnmHSm/noQ3ZCgWWC7UOQ+HO2vBc8URR7+LxSpXNxpyHVIZHUYvOE5lP/9zloEbC7UWkFXncagI97/1nn4fKeea0MMUQeZC0ENo1UVZdraybq73V1NsBC7Mfam3Wlp7t5bY3gCVvzPnWHp0JCBLfBmO1skGrZO+rSwl1xnLceBkGwQHQk0ZSeojQNcn67MJ4PIjO0C8el+b5x3tAcq2hd1AlK0khNvPDSX3R14PleXCPIKHqo6mY4I87hUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISbAKSP+CGDu0u7j3YAwiN9DNL6fQcb414ZzU8p1riE=;
 b=y43lowGHl1NRgaeasmSvS1hlQgjFyGKAnH48f5A1Ci4iSRDS3b45SC/J8isrkgTePsQGwRBgcWO10lTbiAbxvdErSpYr4qhxtTc3/glAGOxTzuelTdpiopJOUS5wmFRFbCX3uGmNaz4ND6+KvLiF28LZs04Y25vPmcZl9PHsf4RuvSks3O7Wq3Ru5bUGEySbDgWSnPgXsOIyvI2nHi2w0VQUyw30Sf8mUov0E6nVJdvGh1NYIfy9wZu7uXsSzDLdJ9gFvfL3QMl5j2wzhyGx9e/Hf6IBVJoYR3+EZc1Ap0WpSdu4K66d+6T219nVEswXMEKDxhveAQ+zimx646dXqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB8889.namprd11.prod.outlook.com (2603:10b6:208:565::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Sat, 28 Feb
 2026 02:37:25 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 02:37:24 +0000
Message-ID: <6e5595a9-2af4-43b7-8e7e-b7a2a1db6a90@windriver.com>
Date: Sat, 28 Feb 2026 10:37:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] ruby: upgrade from 3.4.7 to 4.0.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
 <20260227100707.2369309-1-changqing.li@windriver.com>
 <DGPSBPSI3YPW.2ZPUXHEVQ16P6@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DGPSBPSI3YPW.2ZPUXHEVQ16P6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SEWP216CA0114.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: f761b22e-86a4-4447-5056-08de76724e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	UcuyPi3U+VGRxx5IjZiHVACYcog416sEysn1angevhzI1V66DF6XOWq6VzalUZatSwtGoPX7kRZmasTYWsHaoOwVgiHz+ZSHWk6PCvEfBOriMAh3eeS2OHcry12rLcw4IyLL0O3IsWU388JQ1KG8anIgdjCY49Yx60bJ19FBcwIoGwYFrA1ck9RBoBVGTZIdolxtzDRzdVhM684tEAmyZN4Qymxr8DeUb7emCw+imvTF6ontKC1SzWptz5UsEWaL0GeN2gnLcXpmt+BlEQ+vYBm/u87gEx0ou7Sylvcu5NsCybFtiv5C1VHr5PFRc0VO31c2EMrPlkA1aVuI96zNCclK+3ojCr823Fk3KPOlQJ1ECDF84BgqQu0/H7spy0whT2gcmMhTHm2PlpB24LHFlEXKoDPcxcBztHp5JbA+c6CKzil3uzwPCNJFhTQWwBBj/4SacOoTApnZa+X49ZXowyKKZerAFi5orELBQTNx7gQwoXkKv73RgfyT0vSfpGkWfm4+xqHJwelKg53DfbNjFWQ8jfomTif+8Lmgu1i8Oq7ACrCA/JYZyncWdgSgKee4et6Bh/uHNFnrFrrYsw+ZRB3IU+Vs3KaalK+kilcqXk3wJM7qS1tpBcWoT+HDVnNqZuSm5VoMUdEd6guCfiAksJ9vYXN3GpQIal1Tiv0uWp6nWo93dAALl0ya78bBkxPC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QThZcTcxRjBrWEhvTGVRNVNWMWdtRE5CM2p6WWw0VUw4SjdQdGVTSi9yMnlj?=
 =?utf-8?B?QmxCWnU4ektRTWpCRlJzNGtYd3NvTXVQTFVTa0FXdlpFUFk4VnBvK3FFRytP?=
 =?utf-8?B?eDFTdXdPZnFYTHNiU1lkTHpVb1FHTWRMdTJjUU9BV3lsN0JpYmFmU2M2cFht?=
 =?utf-8?B?VUlnb1VQRVpnQmVETyt0WnJDUmZmSWxQeFJCWkFTYitSOTRaazk5NGZGcFZG?=
 =?utf-8?B?ZFRnM21IaHlvcGxMUStTWDFCTjZYdmZnREhweEtHZHZvdkVuRmdVZDNzdFBB?=
 =?utf-8?B?Nms1dmtva0tSY0tjNWxSSkVNYi9SN2pudlE5TTg4YXRVaXNvM0NIZmxycjZv?=
 =?utf-8?B?OEMxTTdQV0p6VnFnVkRyZXBhcXZ3SVNRVlJvRno3Z3FVTHdaOUdBaGNpNk5R?=
 =?utf-8?B?bStUdjBoM3R4NEp5ZTdHQjgwQ3VyeHRiZEZydDgzTlRWUjVyYUlFbDk1TVlw?=
 =?utf-8?B?dU11a3h5TXdiQmtxSTcvTkpZZGN1bkRwN0FhUzg1NHVBSFRVbkNQaEFMcWkx?=
 =?utf-8?B?dE1OQXNjeEkydHRyaFRqRXJNZFUyWjUwb1lSOE15VXNzOXF4NlNXYStQMnNO?=
 =?utf-8?B?SDZ3aFh0SDNLdXUzdHBaRVNIME4vQ2VuOTNLdmQzWmpWOVhmdkRIb1FQcUQ2?=
 =?utf-8?B?WDlRajZmZHR0SnhsMkJTWXdyVUVrWHJFVGRNZVo5OUd5RnlMMEhib3IyVmtW?=
 =?utf-8?B?ZGswVDNNSlJKRjN3WjFhci9PUnRac1krVFhmK2x2dnpxa0JQVGN1NkJlQkRN?=
 =?utf-8?B?Uml4cHBqdDJCTFRjWHJKbFNoWVdqbHhFdklOZ3VJT054Wk9tMmRFT2hyODJx?=
 =?utf-8?B?aUN5VERMYWVIMmsybGJvVnhwdklIb2tyYlJQVHczZkJOU0E2WHpiK0QwMFZC?=
 =?utf-8?B?ekxmOUh3VlVVYTZpdGlJWHN3ZVR0aXVKVUtFSzVVZUdoSXhnL1d4MUdkZUZZ?=
 =?utf-8?B?dkxSRkRXa1MxYmhpc2paR2pjMzlQOSt2R2xFYXhrR2M3NktPdHAzMnNQTDV0?=
 =?utf-8?B?T1duVW1zT04zRTFZVEp1Wjkvbi96bFpSTFFLSkNyOWVScUdGSEs5a0dLek84?=
 =?utf-8?B?VmtWRVExUWNzRmVZaGR2WmlkcXhkUnBtS1diai82QnhqRUx3bEpvUWtDS3Nq?=
 =?utf-8?B?Z3RlbC9aeXEza1Q0QjcyT1FYNVRuSHdJUThtK2s5V2RvRVJRK2FnRUhScTBT?=
 =?utf-8?B?S1NvdzZ0eTlSbnA5WnRIUDRwZnpkL1VIYzNrWjlXWFJkc0JTc09NcjdOV1o3?=
 =?utf-8?B?MEZlSCsvVW56R3VkbmZ2ZVQxd0tPUFMrTTBadTJZbng4U3RNYWlWSzE4SEp1?=
 =?utf-8?B?UUI3VmVKb1FQTGc3QkJjUW9VcnorbDcxYktGRDRnb1VkQTJSYWdqVVVPRUpv?=
 =?utf-8?B?b3VQRXlveSsrSHlqZ1YzcHhyUW5CckdhSWRVMHBhdWNMdmZnMzZCemRlYzgw?=
 =?utf-8?B?VFlrbndoQnZVVFFWU3VVWi9yNTFtTXRGQUZxUVVpdGJOUzVOZnROZG93U1Zz?=
 =?utf-8?B?NHFvWWprSTZQMW9obWNNdStoaVhEZEUwbjR2ZExkWVBWUXZGWUhIckRZNHl6?=
 =?utf-8?B?L3BhNDJHR2h5NXluUnZRL21zVlV0T0t3Sk1vVG0rVEJyeDE2OXhTdGc3ZlY0?=
 =?utf-8?B?Q1kzS2s4VEhNRG5SV0lTT21MR0NUS0kvL2hCd00vWHRTdFNYdlRwNkhIVkIv?=
 =?utf-8?B?YVFLcGhxL0JvUm5wWkV4QlhZTnIwblNJQTh4c1MxSm5VMXNDbTQ0NlhYNitM?=
 =?utf-8?B?Qk16V0h2ejA2TEVMMS8yV2g5SmZILzNFMUswVkJKbVZxa3gvd083bnV1R2Ny?=
 =?utf-8?B?MVNQYXZmekkrbGtyaC9USGdod1JpV3J2Q2M5akVkWGFuT3BMU3VHV3p1RXdj?=
 =?utf-8?B?TkNrK0pha1l1VVBxVDR1NkE4TmRHcUxmeTdDZUlRdFlrN0t6T3lRZEZHWXRC?=
 =?utf-8?B?QXpRMVd0VllyQjNVTldLQ2w2VDBWZXNWWWhIZWk4cFFQOVluSFhrM09Ba0hW?=
 =?utf-8?B?bDlnSENpZkdUdkFMUDVTUnF3TU1wUHNEdGRuUVptVUExQkRlU1I1VFowT2Jo?=
 =?utf-8?B?QlZsWU5PdU1Jd2o5QnRRNnJTT2lXQzRQaDNSaEE0dTlqWGpndGY0dmZrTmdH?=
 =?utf-8?B?djY4RVRCODRQZTRlKzFaMFJ4WWRER2F3TWtydDZRVTBkWU5HNWFZSndUUy8y?=
 =?utf-8?B?QUl6UWhCY3RKcnB4NFBUMzNQM3VaQ3FmQXZIa3hKUjM4VVlUS05uUFlhQnVB?=
 =?utf-8?B?cWExRnpZR3kycm9DOVQ2VVF0VlFpblg1NWVLKy9ZVjNOc0hqWlY4NEhhbjhv?=
 =?utf-8?B?NUpKQ0xpL0U4YlFROHNPS2N4a2NpbzkwakFKNG82eGVUV2FtRWtvVmFrUHlV?=
 =?utf-8?Q?8nLzh7PGWu5ynwUA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f761b22e-86a4-4447-5056-08de76724e49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:37:24.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qxosv+zZivLv092mZFYf2rmr1TdDKdxmQypv2dijAVxzCuBC0sgJFx7YKs0Rx7esIKcBvJiEmQvdEVrloB9x2ieuHkOLjIXuRp+iLr3AsYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8889
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a254e7 cx=c_pps
 a=VYnc1ZjkwFV8r4Zgssgzxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=P5jYqHkvxgwUFZux70UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LpjTPtUHD8fqwP6NwIzWE_ycIM3UYq4x
X-Proofpoint-ORIG-GUID: JnxKFnX3dJ5aX-DZEILsksZAEHhSGdAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAyMiBTYWx0ZWRfXxkAw/yai6kv4
 JxgwOKx5F04qDVwYByzH1loOu3QifSTC8KkeqBMMh+0/W2y0ymeurLGY4rbRvIpupMyfoPyIcG6
 4xz7xSbm8WFT3KLOL5jTSUvAZzfIdx9MRIklyyTyke1DkQZgB7aSyU3MaQF5wBDQL/3TSeZwhSb
 0ZklKiIo8bHltHGSIT7yvjGQcEPZqCdQAm1yrNkNAJ9hvETvFAV//FAXvYoZ5fdJ44LgxLN8Py+
 YNYJ83kj9nIu5Cpj0i/HOvtz+mQwkHte9h1R++k84oew2NFnSYDAa1Mj4MtBhXnDI6YJZVBgxcB
 nDTdn+2qiFAVdIAUM/NUba8HAdO2gIWuiVssBvo9lxQPqV7N3XrN+pPxW/YaYjiAlmehLRjkIGo
 BjrPUthgIKKLDHTk3JzCJAkaweEDLt2eZIUDbLtXouzUmKolGllKvl7VpRPMQpKiBpkWE6qUdg2
 gOZfGtwviAEVaUB5HnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61S2QSXF2397059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 02:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232122


On 2/27/26 21:39, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri Feb 27, 2026 at 11:07 AM CET, Changqing Li via lists.openembedde=
d.org wrote:
>> License-Update: Add license BSL-1.0 and Apache-2.0
>>
>> COPYING - Add Cross-links between Japanese and English pages
>> LEGAL - Update LEGAL for JSON vendored sources
>>
>> * Patch 0001-Don-t-save-the-original-name-and-timestamp.patch is added
>> for fixing possible reproducible issue. Package ruby-doc is not
>> reproducible, sometimes, "last modified: xxx" is added to the file typ=
e.
>> autobuilder reproduces this, but I can not reproduce this locally. Jus=
t
>> pass '-n' option to workaround it.
>>
>> Refer:
>> [1] https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de08273=
49bf03f16d
>> [2] https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad9=
76c69bea73
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
> Hi Changqing,
>
> Sorry, the v1 was merged in the mean time. Your v2 still looks good, an=
d
> I will take it into my branch for testing, but do you mind rebasing on
> top of master and changing the commit subject accordingly?

OK.=C2=A0 I will rebase=C2=A0 on the top of master and send another patch=
 later.

//Changqing

> Thanks,
> Mathieu
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

