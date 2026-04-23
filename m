Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C03F99342
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:18:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14309.1776928726379948646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573dc5874=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N2AH0G841382
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:18:45 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8qc09tp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Apr 2026 07:18:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktnv1KMVaG5Y4J99dafTAhahDl/Cp4tJMJWxJ+JrSyGlc4OwMzc3Nzywr2llpjQlTPlRLV14oJ8Olmu8FFFuc6NhMOGC6B3ok7LOmLleq4ZYGvSatRpLDWtwbvqrver0xHnJ8B+VvQOIDnwB746e0CJ6T58DzW6ikdkDwFincqMCtT2/HoaQ77R4E79xzc043schAw/itzIgWqZIi2YQiTQHTwlO3QTS1Tnuoda9WzmLpMxoNxmlXCcEuz57ta5al3P6+PZMyODqUILJBaldAD9ZgSMhbHEWEjFxXTXtywJRZjexR9lNUWc+XjZM06I6BMMoftjGmNJXl5Go9Kx3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tTiFbbk7OE8I0sCvWXdei/HJRjw+tAtU06bcxb3MhE=;
 b=KKWQ0wnUL1WC36kOcvGNAw//chnbkL4lg0NyzBa+QLj88KCkRlQYei1FrKlnDRLXKsN8U4HV1cAD8yfFVdJFC+zSKOV2yLgtATzwYqpjYWg0ouFcROMwggEpl+0F0GGLdlOGmHcX4TpqgLOXFor9UzYkN3/SYR/O1T7UloM82kqpvT+1iB1QLQxiVW0/06k/XIK6juECd2sHSpmcX9cCLCa1L4mNwceQGystAmo7T8BK+RpgoUEMYYYcDtYdfMghfzaTuwaQmR6pHCwseXEp4tKLF4qt0Ydn2G95gE/yOMI8TRhcL+gl4Sfi6xx62T3R/PjLtN10dMU+OtwUDzw3vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 07:18:42 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9818.017; Thu, 23 Apr 2026
 07:18:41 +0000
Message-ID: <88dd3787-7e07-4016-8bd2-529772791df8@eng.windriver.com>
Date: Thu, 23 Apr 2026 15:18:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] grub: update search parameter
To: yoann.congal@smile.fr, xiangyu.chen@eng.windriver.com,
        openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Barker <paul@pbarker.dev>, arindam.nath@amd.com
References: <20260226081937.671793-1-xiangyu.chen@eng.windriver.com>
 <2c704d3b5aa8852a3d4e24143fdedb8f530517ae.camel@pbarker.dev>
 <20fd5dc4-ef85-49d6-931b-7a8ea3f94c04@windriver.com>
 <95988640-2fa5-4e41-a980-2173af637eca@eng.windriver.com>
 <DI0BSP6LTXLQ.3H9BKWL7KE1YY@smile.fr>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <DI0BSP6LTXLQ.3H9BKWL7KE1YY@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR04CA0209.apcprd04.prod.outlook.com
 (2603:1096:4:187::12) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3bfdf3-db2f-4008-80e5-08dea1088c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	1+PocEdbTTSdaFQC/f0qFdTUbGOyMtwDMPvJIbZkowglFoE8PNG/Ggn7IKzF76PNwepPIrqBaPQrPo/CsgbsF40GwYw5zh8ZHbdAimuirhykT/8tBFIXR7cfrLBLMEDtShwS1F1pU99p+2+8roUJx7xcp41geCNGnI2lj4d3K/93x8w57LIHuVr/kFo7sOjz72qObtIHyYqD/MVnVxb3fzQ17vlOdxo0hiUkvom6laSyeYmya56ToyRnXZCk9Cix3rEYA5xOca9X/tC2ZgKTHMwrZ1TQm5aZX7OCU4QebmnJxG9BY9yennI+2f+3T8+BNubchD+QBXwV6IIwB7FnfLZyO6PFW7baonOVFXURela2iE3TmBkEcOdzEqi4RUx3LhjLSEwToZku9+R/4SNpUJQve2XslM/vcGW/SCofvhA3EUntlSr4+2oeh5yIwoSwtQdIz3RGdRDLfZmoDA41X4zs+xwtEkt9zvzFWm958dotUjqsfIQKf1aWeYGBu9W3CQNBxLZrqDo/mrkgew9WycKmtcuus5Eyfo39dMRJKhL17tIS/pQvrfiDl1HAEPwkHhGOB4FRKreic0FB019VH3ZHRUfH77H5nWACbNPdJZjGFJ4yw6mZlQfjYQIGkvgsTBsZH3TDg8qtRCaEnZwOZq/vddoRtU1k3JyBw3dHqvD4WLsTXDmaXFY7LNDPn2hl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVNFazdNUzY3c3Z0WFlQODIvbXphYUdWbnlrUlV1T0VSb3h5MXJjVFUxV2pw?=
 =?utf-8?B?Uzgxb3VZaVJkV0p2UkYwOFM1c1NNOG5wTi9mNEFsUWl6NXZBUCtwRXJ2WU9x?=
 =?utf-8?B?ZzlKdVJONmJ0clpGSStPOXZiQjJHcWdqb3FBL2wrZ205SThOTjgvRCtLUHRW?=
 =?utf-8?B?TXU3cUhnMmI5NkcwblRsd3czRG9teU0ySFIweHZLUVE3eXhWNmVJZHRJN2dY?=
 =?utf-8?B?UzkzdmhFREtiMXZxZ1NjTWtPdmJLbjFmQWdweHNkSUQvWjlLNDREN3c1VlFI?=
 =?utf-8?B?b3JBVEkvWGpvY3hhc04wU2gwTkozSG5ZTmZJTWtPVnk3RGJzdVpoRW9uSTl3?=
 =?utf-8?B?TEE2NnJIWXBPMU5yZGl1TmhMVXc4OHdjMTdjRDFlZTdQY2lDY2U4djhRYVBP?=
 =?utf-8?B?cnlaQW95ZUVyVnloWWpHSlR2VWh0c2YvL3Bjc3dlMGozajVReUVLVFNBOTZ4?=
 =?utf-8?B?Q2ppVll6QmV0bzNjNFkzUThJMGF1QzA3TCsrbFlFY2FMdTZYN2J2ZmV2MTVi?=
 =?utf-8?B?WmtDa0daUXdRZXZXclN2OThQbnVpenBWQjlodjg3UjRkN0NhVzNKQ2dhcGJB?=
 =?utf-8?B?T1pETlRlNEpxMlVycGFlVWxUamVyMlcxM2o5QzJpMFJlQms3SGk3eEtVWlda?=
 =?utf-8?B?RDlHcGpFQitlbzl1MURNZk1xQ0gyNXdTTXlVMW56VERvN3ZGSjRyRFZLQllt?=
 =?utf-8?B?d2JsNk56NFBGTVd6NTRJVFJpVmVXOE9xU0ZseU1uZ0tJaS9zblc3SEdkMGlj?=
 =?utf-8?B?eTYxNnhFdm9FMW9sZUJja09hQ3hFVG9kQS9lRGV3ajBXTnd0TzRxVjd1STJI?=
 =?utf-8?B?TFcvRzl0MEMrZkp4NSszekw3RWxmNmVSSElzYUtPRGVRSHRmRU92NXl1OFQ3?=
 =?utf-8?B?UHNNZ0lZczNCUXFBN29RY0IwWkQ0NnRIc1ZvU0dVdHU0anZCTDVaZ2lBMFBB?=
 =?utf-8?B?cUFnR3RsL21DbDNRNFBCNjNDYk5uM2JCTytWQUdCNDc1cjRBMU9qNjFiRy9m?=
 =?utf-8?B?YUVwT1dtQmpVUk9KQys0Q0pLKzdDTUpnK0FzQTY4Vmk2Wmovdk5DMEROWFVs?=
 =?utf-8?B?V2QyaTk3dFN3TTZFRVdPYTZOSUxqbVdrZHJxMEZFbUpVaUtBeVVNRTJHSDgr?=
 =?utf-8?B?cVF5RkFDMGVIanRaLzJHWjBDZEU5b3VjNVI5bmY5UHJtcmdYa1M4YmVoVmto?=
 =?utf-8?B?cStXTEFBUDgzTkJIa1hyeDJyT0pPN2VWRmV6cjNLUklBS1dUcGVJd3UyM0ZJ?=
 =?utf-8?B?WkhxOXhFVHBrVTZDcVdwOGxqODVUeEpqTmFLK3FxdDVQWHJSVjU1akl1dndz?=
 =?utf-8?B?YkwzV3FRaVVjL1N4YVNRR2Y2MDJTc0ZmR3M1OVArZHlXdEtCOWN0V1JLU1pZ?=
 =?utf-8?B?YS9CU05ZelA1YWxnUXRCQ0NTdnUvanR5cGxESWQyN2ZTMGhRai9HT1owZGZl?=
 =?utf-8?B?dWRBUGFLQndmbU9hdnh5YitKeVdXOGhKRFFYSkI3b0gvMjlraklFWVpMaWVU?=
 =?utf-8?B?ZGQ5QzhOQ3J0UE03dVk4QzljMlVQS2diN1lqY3JXN1ZGbVJjaGROaDNxTHpE?=
 =?utf-8?B?UDhRK251VkNjVXZUbzlITjZVWkdXTDZQd1RpQ0Nma2h6L1krMjJQRm9RMXRM?=
 =?utf-8?B?dzFNai9TdFFOQk9ZTUl5VTlEZkx2Z3FGVmtRSVJmTEwxa2pETnY1V1lBelFM?=
 =?utf-8?B?VjRMeVVCMVI3TWpkUlA5VmtSSDRVdTFZcTBsTUMvYjdUQ21WZVBvbWo2Q0Iz?=
 =?utf-8?B?K0NhODVLazB5ZTFGeEQ3anBVMVJYMjJYVFE0aGJIS2NEakpXMUFEL3RoVjAr?=
 =?utf-8?B?cWk2YmoybnphSkFvVUVHNmpnWEY4QzNRekFWdmJVaTFCVlVTNzdmMjRVTHlS?=
 =?utf-8?B?ZFNwMHNwdXdnc0NwMVd4K1FYN3gwazBjRmExMWcvTnB6dFZnSDRXZndaeExC?=
 =?utf-8?B?RWZsU2dhUi9BT2phOUVqeVVmanQ0SDA1dExUNG9XR295Wk5SVTAxSHVKcFFo?=
 =?utf-8?B?ZU1CWmtSKzZKaFI5eXBtZ2thMVIyMDJmVS9palFxayt2UmJza2pKckVWUUVa?=
 =?utf-8?B?QjR5SDg3T1c2QWFaWkp0dkJOQk5tSFlPWlB2U2tRQkZsWXN2R0o0R1ZCVzVK?=
 =?utf-8?B?TXVtclpvcjhqNktnRXE0R0l1aEk0ZVR1bFRzWE55RmJwby9BK0E1VFFJeEdT?=
 =?utf-8?B?aUg2MzhUMFhXeGNUUHovOStaM0FIcGE2bmU3K1RSaG9LZUFHcXZuSUZTSitv?=
 =?utf-8?B?K2tWZjY0ejhIV2JWQjREaVhOV2xtUFI0N0U0L0VsY0pUUERzTE1DS3AyM2g5?=
 =?utf-8?B?cGJNRXJmUS83TzVTb2VHdXZDSmQxWWtZdi9RMzVlUzMyUFdsK2ZJWnUvSEhJ?=
 =?utf-8?Q?uzABDx4bi8NKsKgA=3D?=
X-Exchange-RoutingPolicyChecked: 
	VGsRwZ48htu6KsOtX7JQAvKKFm1vUuoDTVTo7Ci5LQxrE0jtLpPfUpit7cr8YT8ungQ/nnf8NMh1GJYw76YW6B4d53h2AanGnjTwclirTkL15DEXj3s9NKV7k60LVRalrYglu3MLF00PIwqe2CKkV5AgBZNX/pnl7Fj6voHUSNGLzcmGfBA1TJ7WkCWEZh5tMTp3qg3NAO9hsNBAU+M0pjeORw/gXkCmkOE7KE7XQiqdHkEjGMA6QWfC3DImz8uHoWGS4mXxioUPVivofSkFeWukbKyJvm2nkkgVOl4NxVqXvfwBiBmH1PN5KuDuLwCbfmv8OE0oinEkB4AInwiv1g==
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d3bfdf3-db2f-4008-80e5-08dea1088c10
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 07:18:41.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUoI5A9xZtk/gf2v8DxlLqz2BapUV6RMRQaXB/z8zzbhHM5z54MHDkFeF0RpU2Yvfoj9B4frkrpne6aKlnMUCqmO23/D5EZ0L8eW7W2XoTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ieXFzmkBG_ODSHg4AnT_rwbat_MZN0yG
X-Proofpoint-ORIG-GUID: IpkEUx0gSxDzPFRa10998mW1FdpezIBm
X-Authority-Analysis: v=2.4 cv=EY74hvmC c=1 sm=1 tr=0 ts=69e9c7d5 cx=c_pps
 a=cLTib2BoJD1e+Gs0wkBYAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=aoQ84enrGRFTlqjaUCoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2NiBTYWx0ZWRfXy3mkCmAM4O8h
 /0jinUkwec3wa/lWyyZjw8zPb10rK3qtFE+7a8nOCBq3wTHblOfaPIEcj9DXdpO1Sp9PyunLItH
 mSgNOlnncWIeG1dn9VCBQmIHkq2Tj15fcoFAbZ1h7aifnUUlRsLKYOiHduKG7/P/zQja23vMp3N
 3fqCSrcxSMiLK0+G+/VKzFBobHRZqrsCk/6CsVKJqI8fnJu5j4iOIvUYTh6/iGyxlvpGRnhIp5A
 MTHtBA9gPv6axlpukrukVwcX4+jxXvxX/X496rmuS3Or5yzoA1C7+Mnf1W7qRZsLWJDPhVopT2a
 aTzPVJymltq/71PYraA/wkic/yx/0o1kv2oHT6DWhH1B9nTEsFEtxciRkcu8CpkfNnU7G4ol4JA
 eFTfeKPJm6nfbu7aRd1plbPoY+2MuJXwqDXQhnaMj4oGe3zbYnD6omRqvKhvnTO/nIFEEsUC4Ds
 e74x0g6J0cROeKB411Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63N2AH0G841382
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235745


=E5=9C=A8 2026/4/23 14:38, Yoann Congal via lists.openembedded.org =E5=86=
=99=E9=81=93:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu Apr 23, 2026 at 8:04 AM CEST, Xiangyu Chen via lists.openembedde=
d.org wrote:
>> Hi Richard,
>>
>>
>> Since the behavior was found in OE scarthgap branch, could you please
>> help to cherry-pick this
>>
>> commit: 42b530581f72 ("grub: update search parameter") to whinlatter a=
nd
>> scarthgap branch?
> Hello,
>
> For whinlatter, that will be too late (the last build has already left =
for
> QA).
>
> For scarthgap, I would need to look into it (change does not look
> trivial). Can you send a rebased patch targeting scarthgap?
>
> Thanks!

Thanks for your info, a rebased patch will be sent later.


Br,

Xiangyu

>
>>
>> Thanks.
>>
>>
>> Br,
>>
>> Xiangyu
>>
>> =E5=9C=A8 2026/3/31 10:57, Xiangyu Chen =E5=86=99=E9=81=93:
>>> Hi Paul,
>>>
>>>
>>> On 3/5/26 19:49, Paul Barker wrote:
>>>> I'm not sure that this can work for all use cases. The grub
>>>> documentatation for hints says "First try the device HINT" (i.e. it'=
s
>>>> explicitly a device), whereas the documentation for cmdpath says tha=
t it
>>>> is "an absolute directory name".
>>> While the documentation defines $cmdpath as a directory and hints as
>>> devices, grub=E2=80=99s internal implementation of
>>> grub_disk_open (grub-core/kern/disk.c [1]) is designed to handle this
>>> exact "device+path" format.
>>>
>>> When a hint like (hd0,gpt1)/EFI/BOOT/ is passed, grub_disk_open calls
>>> find_part_sep to locate the partition/path delimiter.
>>> It then uses grub_memcpy to extract only the device part (e.g., (hd0)
>>> into the raw buffer for the disk driver.
>>>
>>> The remaining string (gpt1)/EFI/BOOT/) is passed to
>>> grub_partition_probe, which identifies the partition and gracefully
>>> ignores the trailing directory path.
>>>
>>> The current syntax ($cmdpath) results in double parentheses ((hd0...)=
)
>>> if the variable is already populated.
>>> In grub_disk_open, this extracts a malformed device name ((hd0 which
>>> no driver can open, triggering a hard no such device error.
>>>
>>>
>>> Ref:
>>>
>>> [1]
>>> https://elixir.bootlin.com/grub/grub-2.14/source/grub-core/kern/disk.=
c#L192
>>>
>>>
>>> Br,
>>>
>>> Xiangyu
>>>
>
> --
> Yoann Congal
> Smile ECS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235740): https://lists.openembedded.org/g/openembed=
ded-core/message/235740
> Mute This Topic: https://lists.openembedded.org/mt/118009422/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

