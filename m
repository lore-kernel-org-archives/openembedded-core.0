Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D289C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 10:43:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17016.1724236988789819307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 03:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8963aeb967=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L4OTSC001709
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 10:43:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6v0v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 10:43:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYAneHNxAqz46Z91uPXJ7plbug0h2Y3ZQkqtezywkCSn9sOu9BlaJltx6IyHfTM0KaTDwVgy1Mcr07Fr9zPaYO9St00vUIfYVzq0359/GkgirwMZNGKuEpJD0RWaEM5PX4hlqnAnA4rbdYjW5XKawJRO8G/0yO8N81BgszHXdOZv8UkgFd52woVMBOgRTmECywVcW7m1yNzOfPsBIx1f2cswd4b6e76Rr4UMzr3+WAZHr1TYiWAOBG+LdexIm+JodwQ/duOMETXinp2LvQKk2qqPD5aPENwGXZMvHzmYt4Zv7PmtRZl/IED7MpbcXWY6m0r6kNkZW3RDIxjZb10odw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL18YGKeih3X10YgdDLyNpn2tj96mtX+sPiDaupOqNk=;
 b=uSgm1XsaylA9su7agpaqe+l6MrpS48hdyG73F/vA/j9Tqyqro6mgDP91VeM2Wy2LYMDfc+AOmUK2ZYSvCsZdJG9oIpSGPcAUq8T3vTeyqD0mRlbes70J2pFysGWadl2pM11MiLmiq8OodNO1nRk0xzRdfayWrjnJ00CBugzmXrtdOAOuZJtQhRcWdMtdeHs0tP9VH1uzxzsUtOzeJLOo8aFxlM0fkI8GlcOS47SJkhqq8JQpuDky7GOUXdrLctX7yqQtrnhP3XtYi/n5eD87nEqiwMBkkc20OHUsOkCd9PkaTAEkuI3LRMlQA0tMoP1VkwWlUbLMZzHSL/a7AAJcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Wed, 21 Aug 2024 10:43:04 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 10:43:03 +0000
Message-ID: <804c2316-a49a-41c9-9ca2-a805473e6d83@windriver.com>
Date: Wed, 21 Aug 2024 16:12:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: Oe-selftest changes for rust v1.78
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20240816155419.213703-1-Yash.Shinde@windriver.com>
 <2a331ae8-3773-4cb3-9dbe-07b2eea418ad@windriver.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <2a331ae8-3773-4cb3-9dbe-07b2eea418ad@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::12) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM4PR11MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b84a070-f393-4fa5-2c01-08dcc1ce08b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VWtrZGdoVjllWVJaM3FXS01RV2xBamE5TE9yejl1eXVlMWlENVp2WURMYXdY?=
 =?utf-8?B?dGpId2x1citySlRBUXdWL01RYmJWRzBMa0tHOGRCZ2l2U3dVRUpocVJqcWNT?=
 =?utf-8?B?bXJwV2dkQXZvV3JyVVg1aWI5MVgrRUMrMnhVSDJZQkVDVEV5dUc5bXlvQjBj?=
 =?utf-8?B?QTd2Q2VSNUM5M2I3bjEvMUcrcml1VzNuanNwV2NzSnRPeHhJaW1aTDBIUGxx?=
 =?utf-8?B?dGRMNlN4bHF6ak94RDBzTXE2Wko3ZVBjbjk0YXJYQTg2L0d3SVVSWDgxQlhY?=
 =?utf-8?B?aWt5VFowQ3UxUlNjYlN5UnVYRm4xTUhGNDJvQWY5STROVVF1QUwzT1N5ZnQw?=
 =?utf-8?B?VTlQY3g1R3BWR0xVbXFHM1QzRDJPN0ZaMzR5VGVUZk92ajdubUhqcjBBWEVs?=
 =?utf-8?B?cVdJR2VnSnZKM04wZG1FRTRTU25hNTJVM1l5eUpqcW45RnVBZnJPVDZtcSt1?=
 =?utf-8?B?NlRPSkVLRlV4UnhTMWdqcEQ1d3BvT2FtWDU1aldHWkhXNUF1ZjBVdjYwejBl?=
 =?utf-8?B?dzI3dHp1bGN5TW1zMW1tYXdpbHIvcWpPbFhzMUlBMUo5a2djZ1lSUUYyam1r?=
 =?utf-8?B?aExpVnhCc3hSbWJyK2w3c253V1NzMGh0NXY4UXpKV0hubzZWa09QMG9GR1Nz?=
 =?utf-8?B?QXB5NEVwbHVGME9XVnd3SUx3SHNPN28wL2dtZU5NTHF3RUhQU3dQQ0Roa05Y?=
 =?utf-8?B?U0F6bW9yM2NacW9FQlUzdlJEbGJWQTkvc1M1b1dTUHl2cUJqVXdUa0QwKzNM?=
 =?utf-8?B?cmhvbnBRb0doemd2eGExeHVWMUxqeUNzTmVRK2x5VDlVV2x2SnpYMVNENXlR?=
 =?utf-8?B?eDdKNlUwam5RSHZxbmQyMGtIRitBcVEzam1LQk56azdHeTFKR3FoZHVZNmRV?=
 =?utf-8?B?enVMV0tNellPN1QrQXJIMnBOMmhDR1hOVENQN1Z0eFp0SWo2amtEbFRZNGdk?=
 =?utf-8?B?OWcydDJvcnA2akNFeVkrS011dDRjUUlkaHNReXVlQ2dpMTRyb3N3TlByR24z?=
 =?utf-8?B?ckRmUEVVaDFFcEIrWUg4UkRMVGlaVnF3STlUQXcyZHZiRlFTN1c3S005NGFZ?=
 =?utf-8?B?Q0ZVT1djYlZwRUtFTGxJY1drTURrWWFYaElxblZUR00wYnlkTWxwVlBibTNQ?=
 =?utf-8?B?Z1RjVnNXMW1Kci9aRVIrWGxPRVoxRlJKcW1sbjlHSU11cmc1R2RFWnN3S1BN?=
 =?utf-8?B?MW5uSjAyQ1kybDVEZGpHQXJqdHp0citOZ0VLSzBheWFUZmJYU1JpNnBWYnpr?=
 =?utf-8?B?TzBTME5udEpXenFFTjQ3Z093Vm9nendsRWtWbmtMVHc1R0lES2N1Q1ltazlj?=
 =?utf-8?B?TzdzSjJsLzZWL1hNUWNSMkY5TE1rZDA5ZWJpU0lLRXdtbnhobmtlak16eTk2?=
 =?utf-8?B?SEE5SFZic3ZkWFVaS3NKZExPYlZCcHVrc2tVM2srb29zRkoyRVB6ZGlLTzZy?=
 =?utf-8?B?K1FxbmJnWGQreDljbFlqNENDdW5Dd1JYdCtOZW80MTRlNVp1ZTF6WVVRRkUx?=
 =?utf-8?B?TTczTnA4NG5mdXJIKzVBbi9qbm5LZmRRaFdsVkNsZWR1c2R5MVdkbkJueWk3?=
 =?utf-8?B?b3JYUUlldHo4Q3hZcHR5RTh6UHpHbUFWVWZlbFJ4Y0RnWXFNR0EvcGhIc1lF?=
 =?utf-8?B?Q3FaMHNPTmFKTmMwcFRGenBjT3A4M3VHaXlyZTlpVkJGLzAzeGRrR3NDVzZC?=
 =?utf-8?B?K295SUE3Q3BXY2JPRzFid1d5SnpEMGlpcnhxL05CZ2xRUmJSamlwL1NlQkx0?=
 =?utf-8?Q?yWPUH7Eh8Bt9ADYLys=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDdldWFCaUJRMktOSGFIZXVmVkp0SHlZVU9NaEJMQWM0MzFmbUZWaFJrbk5Y?=
 =?utf-8?B?VStEUGx5L1RHVVoySCtaeGQ4NFY1cmtmejRsUDBSL0ltWDNRUHdTRzRINnJG?=
 =?utf-8?B?dm1YU3ZzaUNmOUpML0V5a0NsMU5idkhXaFhuQ2JLUmF0V0tDQWlRd3JkSlRR?=
 =?utf-8?B?OFlWb2U2Y3BWOEdVNHpSWitYSnJYdDdOclhtSDBYbDE5allZeWd4RDNQYXdT?=
 =?utf-8?B?eHhWUENYTEVUWUx2YkZNenFCQ3FSSXRLVG5wdWg5bnVPbVVzTzBEd1hseHp2?=
 =?utf-8?B?WXJ3aE9pYWprSDNQZFVBT0J1T3dMaFdsQXV2VC82T3JKa3R4TUc0Z1NBZVhE?=
 =?utf-8?B?WUZXMWVFRGg5YVVjdkdBazQrN3FDOWNuNENkUkZZSHFndWoya0w2alhhcVR4?=
 =?utf-8?B?cC95SFBkZkM2T1lHbisrcHVNODlBMHZMaWJnVVlVV3RCcHp3VER2dXE3MnpC?=
 =?utf-8?B?T0UzMXpoTk5JUXplYWRjeVZ0T2M2eVBMcUp1SGRZQjVEYU0zOVdZenU3a2pP?=
 =?utf-8?B?NGpHeUpRUjZJTEtaMmxpcWpQWWRlOWJxYUhBb0lNaXZVQ0NhVW5rc2RaVG1O?=
 =?utf-8?B?L1crZDFMSG9obWdjamtpNTJ0dERoY2RQb3gvTlNtQVRpTEdwTVRsZjBWVHNQ?=
 =?utf-8?B?YU4xV2lvSUxnekpzT2lVZFBLWURINnROVEphdGNTL08xc1ljak0rK1NtcW1D?=
 =?utf-8?B?MFlVNTNGRElWZHJ3a2FNNHhVajY4L2RQS2E1Nk5hemhtV2ZzQzNCZG1abk1G?=
 =?utf-8?B?YW1YT2pDKzRyNnlpTnBhZmJLRGcwRk5GeXFtMXhuQ1djd2cwc2J4dXQrOHRq?=
 =?utf-8?B?azJmZzRuQ1gvejlqTUFRbmhqSEkzd2tQaDJ1MXpveDgrc2psalAwTUIwQ0dG?=
 =?utf-8?B?eHM0WWRlY2dCbUVtSXFxMHNRL2FscmFaYXgwenkzOCsrOFB5cC83Q3dhNFgv?=
 =?utf-8?B?ajl2ejJpa0VtSXk4ZTVCRFR3WWZ1RmxTZ29rUEdzZ1RSYTM5Yy9pQjlmZGEr?=
 =?utf-8?B?bmE5Tkt5bTdXeXVFMTJkeUFCejh1M25TLzhCVTRZcXlyTm1vWklCZlRoU1FM?=
 =?utf-8?B?MzhyRVBiWjNndWo4ek9PMlJFdDNyYm1RUjdIZU9tNW5nN3ZuSFhKcUEyeFZC?=
 =?utf-8?B?ZmhnMkdPNURWOThhZHowOEtNaExiYzdoc1cyWmZoUXhvNmo4K0k4dG9ENVhq?=
 =?utf-8?B?ajZNYUZZM3hHdVUzSDRpdTVRNUhBY3ZDZkhoTUsvWXFmWjZBcGQ3OFhnSUNp?=
 =?utf-8?B?V0J0REJQNzV0NXNoSERkQlQ1S2I1dnVieG12ZnpRRGYvL2J6dlBZeFpEYTY3?=
 =?utf-8?B?ak9KeXBlT3RvTkZIcllUM3lQbnlaLzJ3YkpLQW14R3JKRllZTUhXK0RGYjM5?=
 =?utf-8?B?enVUeVhtR3doN2h4WW16SzZrNWhkKzZwdkE0NzF6V29Hbyttb3RDQjQ4dkty?=
 =?utf-8?B?RjhvT2FpS0t1TitiMS9QYmcyekFaUFBYRlM2Z1RXWG5lSDA4aVU0VkJBaXRI?=
 =?utf-8?B?bTVNMXhlbXp3SE5ad3VJL21Xd05TL0FYQlI2b202OStaVWxXazcrdEZQc2JY?=
 =?utf-8?B?bTBDQVlIMnFCa1ROTEJ1MlpKMnFwZmNKOGI2dlV4VktJVklPMmw1QzMxWWhQ?=
 =?utf-8?B?dmZ4ejVvSVNpZXdTZzgwNFBnazlsSzJBT3FDQys0ckJoVGtnSEFFZGxMaHNB?=
 =?utf-8?B?WnhCRmUzZXVZT205M3NpODFkQWtxSUxkanlNRFVMSGlnWnBlcUpabjRNeDY0?=
 =?utf-8?B?SGdzUzJCMEhvVWtGVW83cDBkY3JELys0aW1uNllxQjZRbEVYaTBSbTRGbVY4?=
 =?utf-8?B?dnpPaVQrNUl0K25UdmFtckRVMFpJUHZXS0twYzdjSXpRS3ExYjlCeDJBZ1E5?=
 =?utf-8?B?NGdkTEtNKzYyaytZbFpiaERoYlNpeHBBTStUTjRReWRtNG4ydWovblNaUUpB?=
 =?utf-8?B?RlhmZE0xQU5jVE9TTGJFUWdzWGxUZHBTN3M2Qkk3NXdHZDQzR2I5UXpsY1dw?=
 =?utf-8?B?Q0p5YlhGVnNEekpvdy8zNUpkelk1cWRJSVloYkpQMzVYOWhsMktiVk5wOE9V?=
 =?utf-8?B?K0JsaXI2QzQvSGREM1RlS3IrTHEvRTdlZHM0MFRJbUJHMHQvTWlOby9hZVV1?=
 =?utf-8?B?eTBEdllhRzBmVzVWaVg5dTNpTHdXY0wwWDNGRE5MbW1abndobGxkQS9rYktT?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b84a070-f393-4fa5-2c01-08dcc1ce08b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 10:43:03.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8aGAxQ+t86YNlBbnY8o/2I1vZVChARZ5C2gcYAfDA5yro/wkP8mA6HkUIqRF9fgQte4KXyYOKmNVH024XTZPcGeoFhBRqveiX7vhyGpoRNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
X-Proofpoint-ORIG-GUID: VQegw_Zt89s04iWgXAPFuJYmLcqaRHUi
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c5c4bb cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=ei4SEBeUAAAA:8
 a=3h3FPjESVDy56-pv2K8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SZTTNjcl0vgA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-GUID: VQegw_Zt89s04iWgXAPFuJYmLcqaRHUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_08,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408210078
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47L4OTSC001709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 10:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203583


On 21-08-2024 07:13, Randy MacLeod wrote:
> On 2024-08-16 11:54 a.m., Yash.Shinde@windriver.com wrote:
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Add some of the upsupported/failing tests to the exclude list
>> and ignore the failing unit tests.
>>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/rust.py          | 34 +++++++++-
>>   .../rust/files/rust-oe-selftest.patch         | 64 +++++++++++++++++=
+-
>>   2 files changed, 95 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/self=
test/cases/rust.py
>> index 62ca762cd0..aa5814eccf 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -205,7 +205,39 @@ class RustSelfTestSystemEmulated(OESelftestTestCa=
se, OEPTestResultTestCase):
>>                               'library/std/src/sync/rwlock/tests.rs',
>>                               'library/std/src/thread/tests.rs',
>>                               'library/test/src/stats/tests.rs',
>> -                            'tidyselftest'
>> +                            'tidyselftest',
>> +                            'compiler/rustc_span',
>> +                            'compiler/rustc_expand',
>> +                            'tests/ui/array-slice-vec',
>> +                            'tests/ui/associated-consts',
>> +                            'tests/ui/associated-types',
>> +                            'tests/ui/allocator',
>> +                            'tests/ui/abi/extern',
>> +                            'tests/codegen/non-terminate/infinite-loo=
p-1.rs',
>> +                            'tests/codegen/coercions.rs',
>> +                            'tests/codegen/const_scalar_pair.rs',
>> +                            'tests/codegen/cold-call-declare-and-call=
.rs',
>> +                            'tests/codegen/issues',
>> +                            'tests/codegen/bool-cmp.rs',
>> +                            'tests/codegen/ascii-char.rs',
>> +                            'tests/codegen/frame-pointer.rs',
>> +                            'tests/codegen/common_prim_int_ptr.rs',
>> +                            'tests/codegen/default-requires-uwtable.r=
s',
>> +                            'tests/codegen/debug-accessibility/public=
-enum.rs',
>> +                            'tests/codegen/meta-filecheck/filecheck-f=
lags.rs',
>> +                            'tests/codegen/float_math.rs',
>> +                            'tests/codegen/debug-accessibility/tuple-=
fields.rs',
>> +                            'tests/codegen/consts.rs',
>> +                            'tests/codegen/enum/enum-bounds-check.rs'=
,
>> +                            'tests/codegen/debug-alignment.rs',
>> +                            'tests/codegen/export-no-mangle.rs',
>> +                            'tests/codegen/fastcall-inreg.rs',
>> +                            'tests/codegen/debuginfo-inline-callsite-=
location.rs',
>> +                            'tests/codegen/enum/enum-debug-tagged.rs'=
,
>> +                            'tests/codegen/adjustments.rs',
>> +                            'tests/codegen/macos/x86_64-macosx-deploy=
ment-target.rs',
>> +                            'tests/codegen/frame-pointer.rs',
>> +                            'tests/codegen/meta-filecheck/check-prefi=
x.rs'
>>                           ]
>
> Hi Yash,
>
>
> There was a problem with a SDK test failing in 1.78 due to a linkage=20
> problem for rustc in the SDK.
> You replied to the email saying:
> =C2=A0 "This also resolves the "bitbake core-image-sato -c do_testsdk"=20
> error for cargo."
> but I don't see a patch or change that would resolve that problem. Can=20
> you explain briefly what
> the problem was and what you did to fix it for me and anyone who might=20
> be interested, please?
>
The problem was related to the changes in cargo with the following patch:
repro-issue-fix-with-cc-crate-hashmap.patch

The patch was implemented to fix the rust reproducibility issue.
I had successfully implemented and tested the patch to upgrade rust to=20
v1.78 version.
However, the issue was observed after integrating the rust repro issue fi=
x.
The issue seemed to be somehow related to the checksum and json related=20
files.

After encountering the cargo SDK test error, I spent quite a lot of time=20
to debug the error from the logs.
It was observed that the issue was related to the cargo changes in
"vendor/cc-1.0.79/.cargo-checksum.json" file from repro issue fix patch=20
file.

Hence, I implemented the version upgrade to v1.78 from scratch and fixed=20
the issue.

>
> It seems that we now have just over 170 tests that we're skipping! Ugh!
>
> Skipping tests is okay as a temporary work-around but once we have=20
> reached feature freeze next week on Aug 26,
> please start looking at why these tests are failing and try to fix the=20
> root cause so the tests can be re-enable.
>
> $ rg -A 175 "exclude_list =3D " meta/lib/oeqa/selftest/cases/rust.py
>
>
> Where should you start, you might ask? Let's look at this list...
>
> Oh, it's not sorted alphabetically as we agreed it should be!
> Please fix that as a single commit now or as part of the next Rust=20
> update if that makes more sense for you
> given that the feature freeze deadline is less than a week away.
>
>
> BTW, you should be able to do this sorting within your editor (emacs=20
> can do it at least! ;-) ) but let's do it in the shell:
>
> # cut on the ' delimiter:
> $ rg -A 172 "exclude_list =3D " meta/lib/oeqa/selftest/cases/rust.py |=20
> tail -172 | cut -d"'" -f2 | sort > /tmp/after
>
> The 172 was determined manually.
>
> Here's why you want the list sorted:
>
> =E2=9D=AF uniq -c /tmp/after=C2=A0 | grep -v " 1 "
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 compiler/rustc_interface/src/tests.rs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 library/std/src/thread/tests.rs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 library/test/src/stats/tests.rs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/codegen/frame-pointer.rs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/rustdoc-json
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/rustdoc-ui/doc-test-rustdoc-feat=
ure.rs
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 tests/rustdoc-ui/no-run-flag.rs
>
> so there are "only" 165 tests being skipped:
>
> =E2=9D=AF uniq -c /tmp/after=C2=A0 | wc -l
> 165
> I'm most concerned about the compiler and library/std tests but
> we do need to work on understanding and hopefully fixing all the=20
> skipped tests.
>
> Please take a look at say up to 5 tests, hopefully related, and work=20
> on fixing them as a group,
> rather than trying to fix the entire list in one work item and one comm=
it.
>
We have already started to work on clearing the exclude list based on=20
rust v1.77.2.
We have removed around 50 tests from the exclude list and are being=20
successfully tested(including a few from compiler and library/std tests).

Currently, the testing is being performed with v1.78 and will be=20
submitted upstream if there are no issues.
There are plans to improve this process further for v1.80 by removing=20
more tests from the exclude list.

>
> In future commits, please include a summary of the total number of=20
> tests that are being skipped
> and the total number that are being run so we can have a numerical=20
> indicator to track the rust
> quality.
>
>
> Oh, you had exact statistics in this poky commit:
>
> commit c496b1eaf4b72ca979d47c37e73e44cd145fed1c
> Author: Yash Shinde <Yash.Shinde@windriver.com>
> Date:=C2=A0=C2=A0 Sat Jul 29 03:00:21 2023
>
> ...
>
> =C2=A0=C2=A0=C2=A0 * The tests that are passed and skipped are as follo=
ws-
>
> =C2=A0=C2=A0=C2=A0 Target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PASS=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 SKIPPED
>
> =C2=A0=C2=A0=C2=A0 ARM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 155=
07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 428
> =C2=A0=C2=A0=C2=A0 ARM64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15535=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 400
> =C2=A0=C2=A0=C2=A0 MIPS64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15479=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 456
> =C2=A0=C2=A0=C2=A0 X86=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 155=
28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 407
> =C2=A0=C2=A0=C2=A0 X86-64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15643=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 292
>
> so it looks like things have improved. Yay!
>
> Do you know offhand if upstream Rust passes all tests for x86-64 and=20
> arm64 ?
>
>
> I know that running these tests takes quite a long time so perhaps you=20
> can run
> the full testsuite for all targets once per YP release, on the final=20
> Rust update so
> that the results are in a commit log. Given that I've changed=20
> requirements, late in this release,
> if that's a problem then just send the update to 1.80.x in without the=20
> full set of all target statistics.
> Hopefully during the M4 bug fix cycle, you can fix some of the failing=20
> tests and provide statistics
> for all targets,=C2=A0 including riscv64.
>
>
> Please let me know what you think.
>
Thanks Randy. This seems to be a great idea to measure the overall rust=20
quality.
We will provide the summary of test results for set of all target=20
statistics along with the upgrades.

Mips, PPC and Riscv are tier-2 and tier-3 targets for which even rust=20
upstream doesn't do
official tests. So, they may or may not work.

Many of the tests in the exclude lists come from mips and ppc failures.
We are investigating more about the test failures that occurs only for=20
tier-2 and tier-3 targets.
We will prepare a report on the same and share it with you after the=20
analysis.

Please refer tier 2 and tier 3 section from the following rust document:
https://doc.rust-lang.org/nightly/rustc/platform-support.html

Regards,
Yash

> Thanks,
>
> ../Randy
>
>
>


