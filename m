Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C631EDEC02
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 02:28:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9630.1772591268466824817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 18:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZPd0WDce;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6242ECBu3718732
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 02:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=v/gNhLMfcH0gFe9MOInbhA1QvkCRKuuJpgAUqxvZzyo=; b=ZPd0WDcePBOu
	9H6D/YJIkQCMxqz4NNGn5LG3iu5YogRLMkOImWGPiAkiINJ59H+y7kBduq3m/goI
	luzBEXUjB7zIibfdOipa+kBNDJqNOYPO+fOniNKbOgaHw1eQhUeGtciHYHkxXwzq
	pT0y0PrpGon0PTXk1uoLAAXxOLrkQ3F6vJ82AtJCHiUx0GdFmZdbottTJfMbtMco
	PkUz9Ez5Olc+3N9iWmJ+YoCaoxTHvQ2/YLBOLB9S/WMdEJYgaXQhAttaPAWUbnnc
	oHyRymt0LUIamhtXLhwgXzoPFj7TfB3iHDCmOpoIfvJypMMmlyN+z+CQ/PZx60cG
	j/iB/dzJWg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mh16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 02:27:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMaUPkxS4idCK51yzyrehwyF4Oeqwmju54tqGG+zyuHGQHR1MO7S5jdL0bqqQiVyD023Db6KRCr83HHd7x0PFLxsnhcT3hdQZxm+tkAqpAM5xpdAYsVNYytizzEEU3icE8L2mUTpyi1NC/QPZlNHd7/Dp9wUXLNe3x9tcsmaJVUAfJKcPB/2I00cXAKNIielTVZ/FDgyX8Lm9cfjd9FBuVCgwjiSn7YOrpSXTWMeo1M1Gfm1wcMitsIY7KODAWBhhk3qMx6grspYtm0ID5zvBDOgwHWFkUTboOaS2jebwai+Mmc3Z3KLmA245TNFrQxR3wtWc6xxzjXIQ/BePyOVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/gNhLMfcH0gFe9MOInbhA1QvkCRKuuJpgAUqxvZzyo=;
 b=IbqTq6nWT+JRtmeLcjeW5RswtQGJc2ssh6k41VfRxHrNzLmDrR7/4lqaPIH218GzVZtZTCq4ivzG5CL08zRLuNUOvu+PddBdZ88sqWarMKHfS3Xz+AxZvgVDWZKNnU4+UsKBPXypFhPN6A2FkqTgxNXMqwLKesPj2bAzwpJ5Ga+naDJAD2i9vDeBPU2YmKtPHTaq/3fqDhsV0swf6hSR+7BQPo+uhHJWL/W2HeJ7yyy4qV/oDecMA3s2yRqnbKzPbyG7HSIc5wDVQ3wpdz9k5naogVFFgmsGWPExbOwsR2ulthSUKGY4pQz7aJXxwXv4xmg4Eu6mMxlFCX2JmeLtog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:27:44 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:27:44 +0000
Message-ID: <4e50e83b-ac7d-4617-9c44-d163eeca341d@windriver.com>
Date: Wed, 4 Mar 2026 10:27:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 14/19] python3-setuptools: upgrade 80.9.0 ->
 82.0.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-14-hongxu.jia@windriver.com>
 <DGTDVX11DXL7.3SS36BY5FSO6O@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DGTDVX11DXL7.3SS36BY5FSO6O@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::19) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ0PR11MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9af8bf-aad9-49e3-76ff-08de79959e23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	qXOhuo7GlQYFpGmQRMzEJx5hlnL2TsXx6AIWyg93fRzbL/ifbX4P5Y5ZJ9/T5O9kZhgAEmJvT2XreRC4EwtuFVGb882XAxRnYyA8MupGF+Mfirt7Zxc6ynjD0dyQX4LmZYn9yUlCom/OZRyGbRk8/R3Xux35JEsNIyVVeUbG9ceVfGb3vFmJNWt6HH4JbcWA7U4YAtmYXwN4UdpdNDBxHpORnR8TX5i3VWJQdV/Cu2UZRjp5LJV4n2OoVBWz0K7XhGThTXxGuhxPIjxz4iub78kIU8arEx5SXjFHRwyC55ne1miIoivWN+4/xDXCaZY+souYHVwnC0r2peQQLeAsc8rwcMsqakBLJezQ4eld4EYo2zF+DMFiDpGqtEZuTcNSHwpDh1/LLgWcR7VzH9lul6YnHSu0rnrsa87sHYxKmTESBfNo+zJAAXtvduOhevMuQ0+hiU+oxugAL0BAgq6udXAxqDlIqtjPHC4rEQqQCZazptrUaHdMSxXE6XBDKNAXKOEFttuAim0gZnaxN40ff4jEl959fOX349oJGs8/MQuh5sXoPqNp5UbgsnHBpZPJw39NheU/8AI3UpcC/tKIUnwE6DhD8ZOFwkWe5wFLc3g5A2Oeoty4GX2EXnViWmDQZScJdSxiQEsmXrkIME/G2DGLxJdRaSPtLLz/pkFnolTDYe2uPnTHQRy1gI8hZi/z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REpCaU9sMkpPSUM4U2VUUjNhUzlsL0tjR0thK2ZJeVJHNFdjUzRuYkRnQnhB?=
 =?utf-8?B?U0ZPeEdHQ0JlL1lFV2RjVzRSOFRRazBVOFAwb2FCNThZSEJhTHBDM3ZqdnNM?=
 =?utf-8?B?blNIK05LckdVMWRRVkpXT21ZRkZ3Z0p1NW5zOU1naUZHTGpSMVRkWkcxcUpM?=
 =?utf-8?B?WWpwZ3RtUUxGemRiNlFoSTVsb1VmMUp5YXVnZWFBWVFzaldPN255dWlOR00w?=
 =?utf-8?B?WHp5WVduN3pBU2tlWVEzdENZNzVadEU1S0hPRXI3R1poRjd6eG5XNThzNHZV?=
 =?utf-8?B?S09qenp6SldxSmxYR0Z6dCtLMzZwQzRNdUMrdDFLSzBXV211emZ6ay84SHRa?=
 =?utf-8?B?MXNjbmM1c0pTZmh2Z05iVEdnRTJuaVdVTU4yKzVVbG9EYVU4TktFc0s3bXll?=
 =?utf-8?B?a2lKbFN4QmxtYlJHbmNpK1M2dC9XY0ZkVVJSU3FrQXZudDF2RG5sL1ZVdm5T?=
 =?utf-8?B?azV5OU1qdmYxSEYxdlg2Rm5zOXR1bzNyY1lsQ1l1NXFDZjRDdUpUZTdvUnNo?=
 =?utf-8?B?d1FJVXBqbTlWRTlreXBlZmFIN09FYVk2dFdzc2V5UENmK1d0MTJpR25ZNnpZ?=
 =?utf-8?B?WnRzRlJCdXkxbGlSLzZxTVMwMitSRWh2RzFXTUFTa1BEU2JnL2NXNTZMeWxC?=
 =?utf-8?B?RDFmb1F2Yi93STZHb1hCWDA3Z3NaYjlSanE1MHIvbGdaYlVoZmErYkR0Wjhh?=
 =?utf-8?B?RXcweXFCcEtTSzJ6aFpDYTdzTUd3dTlTTk1qK0k4UzFxUlRRSGlBa1N6VG1U?=
 =?utf-8?B?a2EvWHNzSmlFZUE4S3dPYWd2eENSTkVQTmsweHpEY3R1ZEQ2a0w3WUpRYnNw?=
 =?utf-8?B?cmpDY01aWEVTOU9wTGNjTWttUTY0SlR1dXJuYi9sTHlJeHNUSytvQXcxQTVD?=
 =?utf-8?B?ZzFucFFFSlVVYWYrZ1FlNFdld05objZ5YWZ1MEN3UkVYdm1CR1V3d2dyTGEy?=
 =?utf-8?B?THpyT3drVENXMHlvUG9jWjhCdldLTFZER1BObitEelV5SFByZ0VSbkFSWklj?=
 =?utf-8?B?Y2toZzAyenlzK0oraVVzMVYraFVScVc5VzRIdXNnbXE2bWRyNXAyWjEyRjZB?=
 =?utf-8?B?Z1BQejFxTU5XcEJuZFB1RVkwRitxbDJZbEhZbXVIaExmWUFTQzF6L1NGTHph?=
 =?utf-8?B?dDBKYURwK1VrKys5M0s1NWJ6SW9sbEdzZDZ6SXA0aDJhY0dEWVRUbWhXNWV2?=
 =?utf-8?B?WEJtdnFGT25YR1BocXBIWFNqb3RMOW5GS2kwbUdjV0R0QnJEQ1MxRDBiU3U0?=
 =?utf-8?B?ZFZrU2VkTWxhMUE2VkZVbDhPQmgrWTRaRnc5bGRhZUFuRGtCRWRCclVkT290?=
 =?utf-8?B?MVU2ekoydFR4TFVwckhaMEdNYitwNmhrb3ZLVW5ZSzZUNElFa00xQ0NTaENx?=
 =?utf-8?B?TXN3VHlyZ0VXbHY2R2VwSEJzbjVqNytseEY5MHdndjFJcm9meElJdHA5amMw?=
 =?utf-8?B?ZjkxNVFZR3VQL09qY2g0WiswOEdyaU9xZVpNaDNlbjREbW10ZFp1enJOc3FT?=
 =?utf-8?B?eEJQVzZBU3ZVUlppT3Eva1F1MDU0dFZySjNyVkxKcnBKaG1KUC96cEpmWk45?=
 =?utf-8?B?NlZlcEVycFg5RWFiOVhCUFlSN2haYzZyUGFvZXVjMTVnaExya2JyeW9Fcksx?=
 =?utf-8?B?N09idGVMRm1oeXRXOFk4VFI0by90SmJMdUtaQ1R6S1NXMW94TUorUW9VeUxa?=
 =?utf-8?B?citZYUF5clBURnV1OUt6SFhpZFE5UGNNamhGRytJVU43K1JjM2l1Q2RNNVdZ?=
 =?utf-8?B?M3d3Nnc5QVowMCtnNVZqUHFHTnpJbU56QWI1SGpjOFlKVjdTck5yemZydmZO?=
 =?utf-8?B?UFJFZFJMSGxuaDB6QTJsSjhZN0pqckJHY0tQVXNrRkpCbmFrRkVseWxJd3Aw?=
 =?utf-8?B?UGlTN1BVTTdvRjNwY1hib3lvaUtqTkJ3aHZGSjlVbzQ5UnBOUGptb3hRUVIx?=
 =?utf-8?B?cVBUNTRFMldLcUJmNEh4ZHNmTU43MVZNOU1NVUZrdGxrbXhJOHpHWGRqTU43?=
 =?utf-8?B?VURpbGZHbnp5V21VWThXYkVVRTdsNUhHNkdjL2trZFlTWHBibWpvTmpla3BK?=
 =?utf-8?B?MERWS3lqdytmaERrOFFVNEdra05wR0FJVnVwYXQxZk9VZFBXdHptU1RvZjBD?=
 =?utf-8?B?V3dMYWtkUG45NTAyMTRJUFowc25SS2plT1FXNloxMW5wek1nQkp4bWRiUFRs?=
 =?utf-8?B?ZHhELzgwTTdTUmt5VG0zUE5rM2ErcVFrcFBxZWVPYmtkSjJtaWdMNHhIVnNo?=
 =?utf-8?B?VXdSeFNENWdPRitKNExFVU4xYmZtTVRnVVNKSnVLZXZMeTVsWTJNS1I4bUM4?=
 =?utf-8?B?aTlJdUJaa2MxRmlnNHorak1jc1NxWVdxY1lFTkRGTnVkQWZ0eG91UT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9af8bf-aad9-49e3-76ff-08de79959e23
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:27:44.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UztKmYxTqTzul+SxaY7/Bn2hqGPA2P0lq1V3SIjt56JR9zKyUWFGHTScVOGT6qw9+8IySE+VXsiD2EFMZLsjYbMQCJqsEcTnwQgEkqLNCdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a798a3 cx=c_pps
 a=0JRlrhwbVVPmsaj0kffiDg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=dXvAoEkxAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=m_Zu4YEOKhuGDs4l8tMA:9 a=QEXdDO2ut3YA:10
 a=iJ39DRKJB4kz2P1Iyp3E:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sOIT7C83LzyULcN5c6siC9Mog_A2QXgg
X-Proofpoint-ORIG-GUID: KNUVCRaB7c6mXnUoMrJ_MaKbJh6qEJhY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAxOSBTYWx0ZWRfXwcndECF3FfDW
 gGuqbdOcargya3Li19h54lr90eK4/sCFz4qDsaalsE++7iS02T1hoA1eqBBM6WEj0DxkFX+gAff
 5Hqqb0Wyp8hoaWZ2aKIkuYRqw0ELqK1TkPdDiPUn/+bFCElLAoCIGnU9QoIBGz83fnssyQPgNTV
 7QPkmWVKVhFChh3M2xcGIQkAFBWVHiJmiOhxG9FwNdvZJavmB0awzXVp+HnccX+2/9Mfj3yJKpO
 iZIbh6LrtZCXBwDYi4zou1oEdxLsskHguWtEyuyQkVnjKdplZCom2SQsVi96yP/QY81KALh9Ycr
 GjTJBRn0CLu6+1aaMrP01tGn2ZTnK/sSNgrbBWZJIeiCnCbvH8R9sgQmm6VPcENJK4XmlCO5149
 UYpxgajOJYCgCuSDcZk9SPxLZGxj5RrvQSuhiOeDttWWAPFIJHTc/FV2vGRMA/+EJ6GPM/xL/n9
 9JTjI6ohQYiiOUycjOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232341

On 3/4/26 03:11, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Mar 3, 2026 at 7:56 AM CET, hongxu via lists.openembedded.org wrote:
>> History v82.0.0 [1]:
>>
>> Deprecations and Removals
>> - pkg_resources has been removed from Setuptools. Most common uses of pkg_resources have
>>    been superseded by the importlib.resources and importlib.metadata projects. Projects
>>    and environments relying on pkg_resources for namespace packages or other behavior
>>    should depend on older versions of setuptools. (#3085)
>>
>> [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
> Hi Hongxu,
>
> Thanks for the upgrade.
>
> We get some fails on the autobuilder, that are probably related to this
> change. Error message is not always the same, but it refers either to
> setuptools or pkg-resources.
>
> ERROR: buildtools-tarball-1.0-r0 do_populate_sdk: Could not invoke dnf.
> ...
> --> Starting dependency resolution
> --> Finished dependency resolution
> Error:
>   Problem 1: conflicting requests
>    - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-python3-setuptools-82.0.0-r0.x86_64_nativesdk from oe-repo
>   Problem 2: package nativesdk-python3-pip-26.0.1-r0.x86_64_nativesdk from oe-repo requires nativesdk-python3-setuptools, but none of the providers can be installed
>    - conflicting requests
>    - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-python3-setuptools-82.0.0-r0.x86_64_nativesdk from oe-repo
> (try to add '--skip-broken' to skip uninstallable packages)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/3270
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3264
>
> ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf.
> ...
> --> Starting dependency resolution
> --> Finished dependency resolution
> Error:
>   Problem: package nativesdk-packagegroup-sdk-host-1.0-r0.x86_64_nativesdk from oe-repo requires nativesdk-meson, but none of the providers can be installed
>    - conflicting requests
>    - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-meson-1.10.1-r0.x86_64_nativesdk from oe-repo
> (try to add '--skip-broken' to skip uninstallable packages)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3299
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/3314
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3302
>
> Can you have a look at these please?

Copy, I am working on it

//Hongxu

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


