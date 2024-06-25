Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B9EC2BD09
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 03:02:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.161608.1719284558577029121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 20:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69061e5699=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P2dWSe029663
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 03:02:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwtb6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 03:02:37 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45P2ww7t023301
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 03:02:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywktwtb6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 03:02:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrCeipEypSqKzy/kEKuASmQVvC3uOXSOZwP9zksKzUL/d/2bJLkgPq9pPAUAJLK5/H9E5Mr2x+YeUliZiGCE8Hmw72kaFQQZI1j5PrDesk1kNIdOhF4MngfEADvrHo5xt2hiS71OFZkr+TlvJNE0xQwX4TVx+lP9HWBTwJUPJ6xbd36VmBR9IXXOGXKiYauxgkxMa53ZEs2N2nKnwU7p52B0YUu2dpgVty+AwUtAjdk5cu3aqw5K4Fm786BjIN+mh1jGpIkE6HoLUQUsCS3jzgetTFo1HOClURf6Pcrz1JSeOf1zr4HUpKaZmiCaucQsCw3m8uAbU0uVKYvEI+9iSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMJgWTFkgb78t2rj6DekY/r/b6yuU50CTuUH0GzJrXk=;
 b=Lq768PDHdUjiofc7J7opX274x7UE26n0FZjdfW0KQDkJVLSChXgxDGYb04Hw89zi3NyfqwID5js6dZq+QsVDkYY+I/WY7zRfiGMwSzGKQCsxoledDt4PevLa1NDeJgrZ+JTIvVftaieaj03eHWB8GV1t/3VVWG42KlRolCJNfbSx0Dhb2Y1fXSNhW18oEJLJE7tB/sINfRC+MCiEfGXkIOa4leJtLfbPstF4pOGBVe6lHUma26cm5iMBoRiFASrMilFaZOJ6mVCaqUP2zW9XmFpYmoQCI8emm8WUpF6a3NB1n7EoYdWUFGmW4gK+SRAuug7w5+DiwhHfRuY3VJjysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Tue, 25 Jun
 2024 03:02:34 +0000
Received: from DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa]) by DM3PR11MB8683.namprd11.prod.outlook.com
 ([fe80::5769:9201:88f6:35fa%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 03:02:33 +0000
Content-Type: multipart/alternative;
 boundary="------------nzDgeEFDng2dfZ6BkrAeb7Fx"
Message-ID: <6d0399e6-14a9-4746-b88c-c6c8db59818d@windriver.com>
Date: Tue, 25 Jun 2024 08:32:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Rust reproducibility issue summary
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
 <2056.1719220048661049006@lists.openembedded.org>
 <17DBE5C236FF6606.28936@lists.openembedded.org>
 <CANNYZj_A5UX7vt6cnS981HMOkSh-0BOs0z1sfk6M8odsbjkCuQ@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj_A5UX7vt6cnS981HMOkSh-0BOs0z1sfk6M8odsbjkCuQ@mail.gmail.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To DM3PR11MB8683.namprd11.prod.outlook.com
 (2603:10b6:8:1ac::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8683:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 2962a9ae-f169-4467-78aa-08dc94c3428a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|366013|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHpXWHB0allLYXZXTWQ0WVZETnoxL1hLNmtmVWlIQjJ6UU5ZYjdIaDRFYjZB?=
 =?utf-8?B?NWhVU21wbG1lMjNrZWwydTloVVlNQmZoZDlLZE9WQnJVcjRmZmJQMHV2cmVR?=
 =?utf-8?B?SHhoY0tzdGVWVmRnQmNvV0svM2VxbjA0Z05jZUd5RWhBWmdiN3lCbVF1MDdp?=
 =?utf-8?B?TjFDUmxjRStZZ1hVVVk0VzZCbEg5VEhKMkpieTFiNkk0SG4rZGhyTnZua1V3?=
 =?utf-8?B?ZEo5VWVjem91NUxFc1NVZ1dzd1lzeWdwRUludUpwV20vTzJrOUxpNUNnK281?=
 =?utf-8?B?Q1Iwc1VDbm9YYUtFZU1SUUVnMEJLYWZjUU1sZ2VuTGlkNkdWdlVFeW5zYmNq?=
 =?utf-8?B?dlJpQXBKa0pUTkV3czkyUVdybFA3eXlOM2x3Zkt2dDdseEhGeUNQeEoxK242?=
 =?utf-8?B?b0t5a0xyRGZZNWZHQUpTWmpTVFdNZThwcEdreEtlOGNCay9DODVDRXhnTjNC?=
 =?utf-8?B?N2VLN3Q2OVA4TE1zaERBL0ZmUXdad3A1ZmV0bm5XODhGWVRSQk5EQU1YVk9u?=
 =?utf-8?B?aWEvUmp1R0JRT0R5YnBXdUx1UFVGMjRjTDgrbTVOZFl4dG43NTA4MngrQmc2?=
 =?utf-8?B?NDZBRjRNVVIyck9PZkdONkNZTm5hZmN3Y3JlUnVseExjUGE4bXBhMWtLS1RQ?=
 =?utf-8?B?dWlaRW5XNXRYWjl6VlRERTV3WXNSbEhTdlp3cGVUUWZMVVZibnJyb1c1bjJm?=
 =?utf-8?B?MWVCcEtGdkFSNmxuSTdvQU9FRFFmYXB5S3FJNVpvNmhKQklMTm9RZUVnWVNo?=
 =?utf-8?B?bWNVZERhL3pyM3hRVnVZSkovNzdxb21Wd0ZMY2FZN3U0MEpub1JSbVdSMU4x?=
 =?utf-8?B?QmpUNDJWcU96ZHR3RkdGMk5wZDZpT0RWRk1tWnpkQ1VXVkpEc2ZaWXU3OTg1?=
 =?utf-8?B?V2NlVkZiNXY1SkI3Mm1OT2pnQWoxZVkrb1MyQXdSQ28wSVl3c2U5ZVZ5Wnlx?=
 =?utf-8?B?Nk5IcExzTVQ1QmZ5T2dnQkUvbDhSd3Vrd1ZkU0o1M2FxTGV5NnBjdmpqN3Rx?=
 =?utf-8?B?VHB5czdHcUFpUFYwcVZwWmx2bVMxNDJ2S09xTGRkekt2NDYzRjRhUmpvL3Q0?=
 =?utf-8?B?TEVqbUxHOE5QMHZKY3ZWQjVRakZBamsrK2NnbmFzbHo3Vnowa1l1dW43V0NE?=
 =?utf-8?B?cUtQRGE1ckJHMnVCZ3lCaitPRGRrWjhSdmNVdHQwcjNDd0FzNHE0RXllMmYz?=
 =?utf-8?B?cUljWTlKK1JVRDlrK2NwYXltRE1hTUIwZWVUbG80bVdJZXY2c3pNcEtoT3FJ?=
 =?utf-8?B?d2F1MmVQcTVIN01WQ1M3VGpxNDRWTDc3ZUNIVFRoaVE0ZjBYRWlYUmRFVUJJ?=
 =?utf-8?B?Q25rWDJCazU0cGRMUS9BcFVWQ2lMbWZVcEl0RzYreCtGaXljeS9LSThwaFRL?=
 =?utf-8?B?S2t3a00vRldzbnJPVTJ1WCtWZnhlb3NLa0xRSGV5L1UrSGg1RFdCWTB1NDBv?=
 =?utf-8?B?T0xmWE9tTnlKOFYvZjMxVmVXTG44bjREclNCSDdna0F5Z2duZVM5eWZrSThk?=
 =?utf-8?B?TFBKRyszRnc3N2huSFppNEpKM2hxZFF6YmVTUitvdWZSYTMyY2tKNkw2OWRN?=
 =?utf-8?B?dkpDaEszNjhDQ0N5dU1yeDNhWnFpcEZ4TnQxSjVNOERLRUEyWFdKbktrNjB0?=
 =?utf-8?B?VUV0dzdVKzB3L292dmYzVDYvdURQNWlnZGQ5bUFuVFdSRytWblVFbzhoZFdW?=
 =?utf-8?B?Vk5mTWxlUmZ4OUc0QXJEbW9ERUNLTnJuRDkwWXZabW9KVnBIQzJmQ1hKOGNx?=
 =?utf-8?Q?j2pbRa6myGcpEs1liWFoD1jfI33DM4jbvnoz7tO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8683.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RS9zdEdsNTkyYVdVWmVTWmpMeXQ0SU1uUFoveVdPMU9YV0tsV2xidE03OWh0?=
 =?utf-8?B?NjQrMHNIbVhoL3kyK1lZcldPNW5BTGlob2xTUjRYelYvb2dvRHFld2E1c1g4?=
 =?utf-8?B?UmNCM2p1NDhVMUNqaVdIOEVzaGRzRlZzdUcyYURRenB2YnRFM1VzdlVCeFBX?=
 =?utf-8?B?c01Fa3hyRDZvOUR3TzZueEY2dTZ4K2xEWmJVS28wSndYQ084a0ducWtkcnJV?=
 =?utf-8?B?ZGZjQjhjTDIrbnUxVU9PNGs1d294WjhacWVNU3Z6eWw2d1k2anpxSUJwQUFs?=
 =?utf-8?B?MHdHbWNGbmNReG8wQXFOeWtiTUxXSWhnNjg0eXZpcGVSVmhGK2daVEJhKzZI?=
 =?utf-8?B?TWxPL0RMeEEzVmJzcUd3VEdxWEFCSzVkR05QZG0wMER0V2Q4WUNXemRGLzFk?=
 =?utf-8?B?cTNXTkRIaG9Qc25yZ3pTMlNGZnVEblVTMnJ3WkFQL3pETm01UWh3UFc4Rlhk?=
 =?utf-8?B?eUkvWUlVd2dtdEFKM0FURjduRXo5b2xFeG1XS2tQcFVQbjhxQ1lnR0xrQXhT?=
 =?utf-8?B?OWpFYmRDdEU5T2wxcU45L3U0TGFoSjUzNTlrbkpXdWZxY2xWK2ZITmRxOEp4?=
 =?utf-8?B?VWFuaDRiZnN6ZGtyR1l0ZCtnNlpsSXg0U1A4TU94MHd4LzQrK3JTU0pVQXFV?=
 =?utf-8?B?MWtwRi9IazlzalJlVUV1UmYzME42M2V3OWNjVWk0MDBDd2tLb3ptYkRseGor?=
 =?utf-8?B?ZnNMdFAyY0NscGk2dlRoL0ZYMWJldkNUSisxWk5jcGhnSXFLREsrb3l6VmlK?=
 =?utf-8?B?ZmNJZ09zNTl2ZW9iaWVuem1QSVZvaDRUaFNuZXZEakI1SERubjA0dUlCNm9a?=
 =?utf-8?B?VE9RTTBac282WmpsOFQvUEd5MmREMWNjNUtLVHo5ODU4L3JXbFAxclNNaVdX?=
 =?utf-8?B?SEVEeTFlZW9xMHJFOXYxNXgvVmthUmUwOEpDOWhaT0ZGL3NiSFpEditVVnQv?=
 =?utf-8?B?bVp2d292OFFIcFR0Tm44TldyNUNiWjNad3kwbkZLNDlreElZMzNrTERGRzUx?=
 =?utf-8?B?MkRzK3FrUm9NdEtTeUNHeXZiZEQxTW5WcE5ydlpJWnIyUnFtMndUUURoNDNx?=
 =?utf-8?B?UWNhMWJPZWROR20rWVI5alRVMURmOFljUGcxOHZrbE9WZmFxMnE3emdTTlhh?=
 =?utf-8?B?ckpCaGZZUWFWOHhKK042K0RHM3NnazJVQkk5RXR4RnJ4UjBqT3NoT0tiS3cz?=
 =?utf-8?B?N25FeUIrWG9mOWtqU2RmUlZWbHZIVlQ0RDdKRGxxU1AxS3JOR01DbmhaZWZ0?=
 =?utf-8?B?Vm9BbFZpV1lwYWVya0IxYWFkTCtzdzVtekxQV0s5U0NJd2ZkenNRK2dHWXJx?=
 =?utf-8?B?Q2NvbCtHZmpSQzJVakl5M0pVNzJHanJsOXhhM2MwS1N4QmdQSVkwKzJLcWVv?=
 =?utf-8?B?bjJqOU5VZkV6NlRPTDVXeUZZQjNqWTF2N3lsZlhObTljamUxbFg2d1g2d1F1?=
 =?utf-8?B?ZDFZVHk1dS9yR0E2MnV1TVdkeXVOaFBsWVFmVGF2Q1A0bUI3VC9PSnh0N2ll?=
 =?utf-8?B?bGQrb3RiL3k1ZWlrdGdFUEg4cFBtcUNIbkxQZytGeGZiZkEreXNzdERtbSto?=
 =?utf-8?B?aEE2NDFoNlRrWnh2L3hIUzVXNXVJNmJBMDlNOGoyelU3YmdsdG0rV29BR09X?=
 =?utf-8?B?eGJxOGJjQXBnWDRpVCtzS0c4ZzhaUTFXaUUyVGdRWEhRRzVyZDZLUjc0U1hU?=
 =?utf-8?B?TXIzOUp2WEw0RUllb0ZZWmdPWkNPYUFQdEVueVI2WUkwNG15T3B5SHhCdURX?=
 =?utf-8?B?SzhjSlh4YlhZMzY5RndrZHRJRWYrNjZYcU9jb0RIYTNrTkd0RnNKMld0RnZV?=
 =?utf-8?B?Qzl0QmY0d3JZc0Z5c2dxT3dMajFDOFMvS2p2bVhmaFZ0dlRpUzJoYnorOTc2?=
 =?utf-8?B?VEJuV3RXZGoxQUd3KzZCb1hqRGI3amFiWmJ0cHg2c1ppbW9xeUE3VlpYc3FX?=
 =?utf-8?B?NXQ3OGZBV3VpUjBncmNwdVMrNnNDdlNrcU02dDRTSTVYNFpZaG5jRmpKbkov?=
 =?utf-8?B?NXp4OE9CY0xVTThCS0ZwRmJWaEt0c2hZc2VCdGEyN0VoK0YwSWRFdnJoMG9u?=
 =?utf-8?B?VHB2NHZPUWtpSXMrYUxDcGpIemZscmRzMXRnUFRFdllFeENrVnFPWllvNjh1?=
 =?utf-8?B?cWpQNWhFV3l5TTBSaWFudmp2UzI1UTdyME1PNUlrYmJ1b3hUSlBiemc2YVhN?=
 =?utf-8?Q?rCQS3OBfD0wAOpx5/3damr8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2962a9ae-f169-4467-78aa-08dc94c3428a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 03:02:33.7074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKQJQ5galZYJWbpAoTFbedMQS+xzmcTa4WrntQNAspo90bwDxZSf3qZ0W/otOZ7dugUR3P0LpMvP78kluCprv4lVmnD+XuxrLn9cwUMgvvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
X-Proofpoint-ORIG-GUID: AeVzZr15fFGlvH43exvKWqeZ_dohBbo6
X-Proofpoint-GUID: p18ksXNowvKYrjCW1NonqGhuTEsE8_W7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_22,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406250022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 03:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201119

--------------nzDgeEFDng2dfZ6BkrAeb7Fx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24-Jun-24 17:52, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 24 Jun 2024 at 11:11, Alexander Kanavin via
> lists.openembedded.org<alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> I can share the two different build directories for your further
>> inspection perhaps? Let me upload the tarballs somewhere public.
> They're here:
> https://drive.google.com/file/d/1kKhHoC3oMFPFjvuLvM4glQzKX8JeXNue/view?usp=drive_link
> https://drive.google.com/file/d/1RCoZipt6i9wWG3j-j2rilWCNW_NMNCk9/view?usp=drive_link
>
> Please let me know when you have downloaded them because I'm nearly
> out of space there, and need to delete them ASAP.

Hi Alex,

Copied. Thnx.

I tried again with latest poky, still the /rustdoc /generated identical :(

>
> Alex
--------------nzDgeEFDng2dfZ6BkrAeb7Fx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-Jun-24 17:52, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_A5UX7vt6cnS981HMOkSh-0BOs0z1sfk6M8odsbjkCuQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 24 Jun 2024 at 11:11, Alexander Kanavin via
lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin=gmail.com@lists.openembedded.org">&lt;alex.kanavin=gmail.com@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I can share the two different build directories for your further
inspection perhaps? Let me upload the tarballs somewhere public.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
They're here:
<a class="moz-txt-link-freetext" href="https://drive.google.com/file/d/1kKhHoC3oMFPFjvuLvM4glQzKX8JeXNue/view?usp=drive_link">https://drive.google.com/file/d/1kKhHoC3oMFPFjvuLvM4glQzKX8JeXNue/view?usp=drive_link</a>
<a class="moz-txt-link-freetext" href="https://drive.google.com/file/d/1RCoZipt6i9wWG3j-j2rilWCNW_NMNCk9/view?usp=drive_link">https://drive.google.com/file/d/1RCoZipt6i9wWG3j-j2rilWCNW_NMNCk9/view?usp=drive_link</a>

Please let me know when you have downloaded them because I'm nearly
out of space there, and need to delete them ASAP.</pre>
    </blockquote>
    <p>Hi Alex,</p>
    <p>Copied. Thnx.<br>
    </p>
    <p>I tried again with latest poky, still the <i>rustdoc </i>generated
      identical :(<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj_A5UX7vt6cnS981HMOkSh-0BOs0z1sfk6M8odsbjkCuQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------nzDgeEFDng2dfZ6BkrAeb7Fx--

