Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DAFE6B26F
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 02:43:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.93940.1766457783169953102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 18:43:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Oq9wmPlH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452e63bdb=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN1U3C21448849
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 02:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=PUlxFSv3rV31xI4+Yaqfa9
	OmnI/zjktCPeaVHDN0W9w=; b=Oq9wmPlHjSV3TZdkUM+6KzA+qre3IE4wSYnFFt
	a0M1XG264aeT1lXmaE0xaIKY41tST3/AWNYbJuM+OFccv9sMSr49vB8WNzqLW77I
	x2YIXIDyhHIc+S3n/0i2jdVJR5Uk68ntfqO59oPAdbNKcw/d41LrATejqmSzKFwV
	9HluKReERJBYphRR1GXmRD2fMtjLmUcbQ+diDaL1mx8MT1WQuLz6n9eHZ08GdITc
	G8kxfscCBrRq8CwrdwthK6cNsKy4W/e85lxUHvbO3ElAW7XHYtsKbzzvuLDeG4ji
	tYspDiExSWLUBOFiiaonPF3IHV6aVjm2/V0QW35AII+gslsg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjmkw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 02:43:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVG3sZB2F6flntBZICPottuDU1cRR9VLJgkeoyVuz+UFrgVHW8AxGDiUMopKCOBNdcoaHNRqFIbU6n9fu8PmT6936n0qCxbMuxukGXNZtCzjWj+TK0Rw0gRngDhZ/SrEW4F2M4a9ZQzFG2IHJvb5W87uY9Oz6oPHnwV6IZJfKJjKEQBEnlItyFAcZ1G8M/pncxAemzqoiAfennmTxrkuM8f+UOtgQjHhOqR7twhlW42qATn8UM72bbBbPs2KwjKd+S0qwnSdJ6kjhChP7KkgemOzE+NKlOSROcR+VXeKRmEGDeH8t/eNOc+ufYA5zg9VUx6/83UWtkbI13l7a+2Reg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUlxFSv3rV31xI4+Yaqfa9OmnI/zjktCPeaVHDN0W9w=;
 b=iLwDHElXFLpM8VNpS0jhNe3T4P50ObxER5WekdGfmEpHz4hG16l45tAVsiQnVoxgWYs18p7V2dKMlMDTK853twBhj73sJ++q9BLmxgW+22cNvXaBUkMBMV8eym+SWIMrmD1C0yjD9a+eoRUuQEvZ3P9J07eNjjs5+ET/hRv0TN/83dValwS1Mxk5vO4M6EdESUqm8h7BDwaBai2xh7d36V5RzmILh9LY/NEf1xfTvgziA3gkBgxU6FEYKkor1vlako8vkMHjUfTA5abKfiBEPnLyRTtCA6QAe5C7MuJZbry8raGtnrg84kefrQd/ruYQEOpIMto8NEr/nHb50ZYMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 02:42:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 02:42:59 +0000
Content-Type: multipart/alternative;
 boundary="------------0qmiyUfrsXqvmdwmHOlv2OzJ"
Message-ID: <387c47b2-141e-46f1-812c-97e498e22ec0@windriver.com>
Date: Tue, 23 Dec 2025 10:42:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemu-system-native: disable libkeyutils
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251222091356.1093337-1-changqing.li@windriver.com>
 <CANNYZj-BHgRk3yja0hr3AabwZXwB0biFXMQQ73mxua=yAufH1w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-BHgRk3yja0hr3AabwZXwB0biFXMQQ73mxua=yAufH1w@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:3:17::33) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d75437-a8f9-48ff-a953-08de41ccfbca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cG52OXIyNk4zTyszME0vUzlSTmVlb2VUL0llbVRJSmkwUG1kVW8zVFN1d3Va?=
 =?utf-8?B?QzdpM2hjRGo0VnpwbmxDcW5HelhhQ2EzNXEyOE9Zd0hUS1dmUzhleUMvb21M?=
 =?utf-8?B?NzJqeXpwTVdJZG5rNy92SG1XV1dqV0VtQ2pDelhLdW9YdFVRODNKclZSeDJP?=
 =?utf-8?B?bFB0emVvVlp3TWgxTmhkaFEyWVlPSG1BYXNIV3d6RjdQczcvSnVwRE01RXVP?=
 =?utf-8?B?ZXdlSnkyZXBOaUdkQk94TVRIbTZlTy9tQThNRjZXNWViN0tpZTFNRENRM2VW?=
 =?utf-8?B?VCt4eXhiTHFUSGtsS0g1NnRUQVBuVkxFTE5CY1QwWEdyT2M1Tnp6YitXbHVi?=
 =?utf-8?B?ZmtUWlZHelBkL3FhSnhrUk9JdGlNZTdJK1F4MGdHZmhUUW9JbzY5R2NSQzNY?=
 =?utf-8?B?ZkFNU0ZxZDB0R0huRmlQdVZqTzZsM1d3K29RM1F3czRLanVhZ3hYcXNJelEv?=
 =?utf-8?B?MXl6dUJhOTVqWEc0UTRxMXJ3eWlNR01waHk2WmJ3T0Q2Y2NEN09QckFHZzRr?=
 =?utf-8?B?RU5JNk5wdVhyOVpMMURnVnEvVWdZUGJGY3RJNXEzWmVWSjdmR3FGajFWMlVo?=
 =?utf-8?B?dnhVTC9LK0Vjc3ROWjJkUVN1MFNYVzE0WUc4TlJrWVU5b1c0Ukx4M1pBelFG?=
 =?utf-8?B?YmpRUmJLeEFZZGJWUFJCRWZJQ21nR243S3FvTEswSG1YL1dmdnc3elg1Y0Vz?=
 =?utf-8?B?QjY4dnQ4KzZxdjBwUEc0dXRyMTg5eXJiSDZYVzBhd3Vnb2JKbFlHaWYyb1FF?=
 =?utf-8?B?bVZFR2RNbHJNSk5tZldUM2ZnTkR3RWN6UXRVbWw0cnRkYlZxWDE2M0l3QVZh?=
 =?utf-8?B?Wm9uWlpiblRPQ01pWWlaTzZLbTBPOUJmRHE2REQ0aXQrMEFTbGhLS1ZndEFU?=
 =?utf-8?B?ajd5VjF5T3pQdzIwSitXTVRNcU40b2JML1N4NE1IU0FTTnNBVTB2aHdhRHdJ?=
 =?utf-8?B?Q3Q2eEFvV1J0dmUzRnVKSko1eUhJNzJrQmhUWXhEZ21TNTl5Wi93Y3ZBWDNG?=
 =?utf-8?B?eE1odFVLR2dMdTVKR3dTcUo4V2Y4ZkwraUlraGZLL1NIbDNpVTlkL3VKZlRX?=
 =?utf-8?B?WEZnTFgrNWZpNEhBYXJsMHIveElNaWlTQUl4Tng3MytVaUtUbjBVOXRhTWx0?=
 =?utf-8?B?VXVINTlad2lUcGtRR0pBVDJQYk1PajhTSi9yS0VSR0dEY1gxK1JLcmZ5U1JT?=
 =?utf-8?B?Rm5PRTBFaG80eDdCWURCdExLMDdZN3BnNGczNkFWclRRNzNGL2xlM2Y2QWNN?=
 =?utf-8?B?R0VVa29wR003T3NSWWYxTWF2ZWdkdmMydVhFaVgzbFdYQWdXNFlDU01PUjBo?=
 =?utf-8?B?Z2w1eEE5SXlCK2RQNmpJVzVqUGtPUE1hektyek9YVVcyckhYamlNMUtoSjdq?=
 =?utf-8?B?OTVwWlpmQktValZHbzRIdWRDTWRnREgyRk9MWmhrNUExMmhSWGUyU0JMSkhz?=
 =?utf-8?B?dFAzNGZ2VnczVEN4UXhmVTBzOXBmYVRXU0ZiRXYyQ1daRXMvQ1BIWXltZlRa?=
 =?utf-8?B?NFZPVFpjc0JuTUhzOFlFWUpLNW5kRmhsaDN3S3JVNDJxVUZTZFJ6UFpkQ1ll?=
 =?utf-8?B?OXZKOERGMnQ4S08wNVNaa1FyZndYM211cDZNb3piV2IrUVBIeE84TGNBRlBM?=
 =?utf-8?B?YlhBeTVMMDV6a3dYUmpGNkhzcHFCWFpVYktmTVRRWk1jYXoya29ReVJuUW4z?=
 =?utf-8?B?VllxSDk2MmhKOER5eXcwMXplR0VobEJjNWtSUWVWek8zeENoQzcyTUlIczdj?=
 =?utf-8?B?ZnFVdkY0OXJDemxKK1JoTlpmZ2s0SUlub3dTOURUWWNoOW9wa2hwaWlJODIy?=
 =?utf-8?B?OVQ1NzhGcjl5Z0oycDRtQ0xxbFVDN2hyOEY4akJnUXdycVh5Q1ZUc0JuSFBr?=
 =?utf-8?B?S2MvMFh0MS9SZHl6QkE4eTZPckl0MGJCNWhlSzhWck5XWHNkamNXdGZTRDNV?=
 =?utf-8?Q?5eEl9TPCYQ6d7k03sbrZNiNY2AqqD+N2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elg3S1F1emtQOFVIRDd6Y0hZV3VUbzdEK3BPeCs3YUxSRU9GSjBxM05Tb1Iz?=
 =?utf-8?B?SXRLRFV1bXc5anFCNjdVVU5pOFR4dTRBa2ZnT3ZzeU0rdDJlUGdRbzUzaHlt?=
 =?utf-8?B?VE9uNDd2MlRoTHhtNThva3hyRThJbTR1ZmlPaXdhWmJsTGswZE1QMStXRmRu?=
 =?utf-8?B?bllpREhEa0htRjFISmlFZVVDb2FWZURTZ1hHNzlHbEhKcGRjdmdHQ1NCa3dy?=
 =?utf-8?B?ZnprRmNoK1dQeDYzYitDRjVlL0FNV0kvb2l4S3UxSXZNL1lrOEhFSUJKenhI?=
 =?utf-8?B?MlViRUdUVDEwR013RCsrYW8yRjBtRWIrOGxxYUFnRm5hQVBCdHVYS2xmVlVr?=
 =?utf-8?B?Z1ZORlkrbTNVcDBmOHNaWjB2dDV2MVAva3gzbE5jc1N5Nitxa3NDNWpQWVlj?=
 =?utf-8?B?cUtDemwrbzBOdGcvTUlQNFpuMTBNREttUmNWcGFtazhZaVRhK0VGTUFQUGp3?=
 =?utf-8?B?azZiTU1hNG9kMnJiRXJkUzJKWERhRkxjRFIvdHFVN1Yza3FvK2lqMDExVUpr?=
 =?utf-8?B?UlpnaGhtYkhwL1l5MlJyd0FCTmt4QzdYaDd5ZWNkeTZkNzJVV01xanJ1WXVD?=
 =?utf-8?B?ZzY0WGlCeTBnNjVPTmdQaFUyb1p6dHd3YXdjK2Y5Zk4ra2xHaTdiWXQ3UGww?=
 =?utf-8?B?WWhhWjdYVVRpNk5qZ29YNzZBd2tVSXdtR1g0bWtwbWkybnZ3enhiQ0NrTzBJ?=
 =?utf-8?B?eE9LVUJxRXRwQVY3eFA0TndJbUNCQUpXZEtIc0liZzJ1SDdkbGtlSmc5aTYy?=
 =?utf-8?B?MTN4OGdiSjlycUErV1cvdVNzcFkvaEwxV2RCYURxQTZhME5HWEpjUHNyOTVL?=
 =?utf-8?B?Znpkc3BKTkJNZmgwaFdxNFRNNk9YOWx2dUZuYldWNU4zL05NYS93SStybytt?=
 =?utf-8?B?NmcyZXVPOXFRbHFsMk0zR3B1a1R4VWM4YjA2OENDYVU5K2RhWU5NNjU3U3gz?=
 =?utf-8?B?UENCZi93VVV6eTl5dkF3Y0NDenFVSGticWk2dDlZeWQwM1BMbS8zbTNrM2Vl?=
 =?utf-8?B?L2dhZVI4T2JpeXZybmo1TFI5TWpFdHQ5VGl0VklxRWNCSlYvNm1uRnp2QUNu?=
 =?utf-8?B?WGRYbmt2MnJTUEU1TGJQZGgvK09KNWxrWTJDazAxNGo1V1dNay9vdVl3eTR5?=
 =?utf-8?B?NWVZbEZMSG02eXJpc05BWXhldkRoU3BHVmhKcXdNNmtFRXl1ZW5melVoNHlP?=
 =?utf-8?B?bVNLUE9jZnNmbmJMOFlOU1RUUCtIcU1IK2tYUnNpU2tQTDJUTkh6VG42UXd5?=
 =?utf-8?B?NU1PRW1oT0gvUGt4SGxVMERjanpQOVVmOUgrbXhocWxkWThtbjgwTitWbm9D?=
 =?utf-8?B?RDRPNWhzL2h2aGFXc1hrNnFSdnZLdDYvVS9BREJXRm1oREE3WW9sWEMyNnZF?=
 =?utf-8?B?c1ZpeXBic3kvOHZwZkdPbDlPaldndWdZNG5EaVJUanIzSDd2cUtQbndsNVVl?=
 =?utf-8?B?R2ZLV3FhTGxGMW0wSU9uQU15bnliNjB3ZnkzWC9hNENGeHY4VW9QL1pGMjRk?=
 =?utf-8?B?WGlxUFRVZFNrSzM0WGNQN005SVFGaGM5b0hTS0x4NG5nRjE4LzcwRVVwRTdj?=
 =?utf-8?B?YU5iQ042ZWxXS3NmTDRMWXZoQVl5d1dTSHkyWnIra3RxTElEejF1RDQ0QzFk?=
 =?utf-8?B?YXROUzhTRlQwdGhYY2o1YnY2bnR5dnFtOVJEdVAxT0s3TStMSUZmZHJhZFp3?=
 =?utf-8?B?UGhJTHB3SXF1YjFaOVBkU2pFa2RWMXJGblRtVmsyeUZuTVpRK1ZYVjROSms2?=
 =?utf-8?B?RE10c0FrdHlqOEQ2bjlWYitNZXZYMTI2OG5iSkljN3RnTlMwd0RCKzdseVUx?=
 =?utf-8?B?ZWEyckozNzR3WWxhZDBLc1RpZ0VHZnVrbEV5RmdjWVN2N25Zby9Pd25uTHBP?=
 =?utf-8?B?T0Fsc0ovWjhXSTFOQWpabVpIQS9aQW5BL0g3Nmd3NTBhQVZXQXZ3WVFXTjU0?=
 =?utf-8?B?NzYxcWpLckhjQ3gvTjFFNEI2cXdPc2xPV1VzemQwQ3Q1MEVQNXQ5ZlhGblAy?=
 =?utf-8?B?N2JZbkMwRjcxS1NGT0ZNSVNhU2xBdno1UTcxQmFRQjZWcmI5SGc5ZnZwMUlj?=
 =?utf-8?B?QmU3Qnh3Y3JSMDdFVCttWHBWVFNjb00rbVpBZ0t4WTlyZHpleHNic0Z6RytR?=
 =?utf-8?B?M0Q3anZ1cEttQjBrdExMM0Nxb1NsQm0xeHpFenkwdms2SjlmR1RoTFJaRkUy?=
 =?utf-8?B?ZTRDZnR0Y2pnb3pqRFAxMUI1eko0R0huVzFoWS8xTG0yTUF0eWFib0VwOXVF?=
 =?utf-8?B?YUsxMWdMZlJmM0EwajMvZW5QNU5GdlQzQlJHS3JwcUhzVEtLZm9KK0N0Ynpy?=
 =?utf-8?B?dHlpTnBjRnNqT2NRR2tLcmpiU1ViRTdlMUxHU2FJM1NCdWgvendrOGFmUzRE?=
 =?utf-8?Q?9bbeGOaN2wQc5aKk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d75437-a8f9-48ff-a953-08de41ccfbca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 02:42:58.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwctjUVX4LiVoxot97+fAP3pm4L8/qO+aUlHxd0jvyhVue5MClnY4jI3QeCbdJhDLwHoxSj0EpceY0U6+hA6hUs497H4UBeXjx199a2KqsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: M2ehlTTGNbp6YRyscbXuK2-OqeY664od
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a01b5 cx=c_pps
 a=R3Nq4yRH+PcKhTCrdXTq7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=5ouzDhL-SiSY_EleI1EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=pGLkceISAAAA:8 a=7jG-k4zFRd-JszDQmDAA:9
 a=oLkoCQ1s-VlLQJWD:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: FZJGfhZXHnLkAH6N6QAcrMUWc08St-0r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAyMCBTYWx0ZWRfX24ARqz1knvxI
 1WDmwEr3LvP7e9BIGMgFyPtAWXgPJdmMPaPPuu1LSyYmYZ568hsyHDx+q001FoXa2IdeFOeIvHy
 KIHGKYpiisYWKJYcTgtg+rolMxLDLBudCvGDdSpYAPG/y8KCWYQ+xdxxnFlfFzCjQkqJNZoz3Uk
 SOW2UUMKvT54kFpLBnHhQEnbRQrs4+76X3PoSfDqHUVngz6JZ+oSmLZqNCZ3BDI/XofdcVw55vW
 HACOg6YJRkLvqUSZMWgFBkRjkwKVDtE4UQ0loKtrn3HbilGAlDOQxKAeS3+jfYtJqltQY3LocxJ
 NFoLiKyTJbQkNBdoSE+CNN0hyIUDFWBuMdRhuqe74ZlwHa/prkFpww6gEfi0W6SeTH1JS4RPglL
 JSMYw8kuLyZML/5ZmdTSm62aobx4LpJXdiuaEALKNhfwbeyeiHX3DohOGA7mEDX/NYNkIOtq+G+
 sXycTSvP3BGOdPHKQ5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 02:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228444

--------------0qmiyUfrsXqvmdwmHOlv2OzJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BN1U3C21448849


On 12/22/25 19:09, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 22 Dec 2025 at 10:14, Changqing Li via lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>> -EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_system_target_l=
ist(d)}"
>> +EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_system_target_l=
ist(d)} --disable-libkeyutils"
>>
>>   PACKAGECONFIG ??=3D "fdt alsa kvm pie slirp png pixman sdl \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer=
 epoxy', '', d)} \
> It's better to add a PACKAGECONFIG for this. It will be disabled by
> default then.

Thanks,=C2=A0 it should be better,=C2=A0 I will send a V2.=C2=A0 My origi=
nal idea is=20
only disable libkeyutils for qemu-system-native and keep

original behavior for other recipes.

//Changqing

> Alex
--------------0qmiyUfrsXqvmdwmHOlv2OzJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/22/25 19:09, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-BHgRk3yja0hr3AabwZXwB0biFXMQQ73mxua=yAufH1w@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, 22 Dec 2025 at 10:14, Changqing Li via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-EXTRA_OECONF:append = &quot; --target-list=${@get_qemu_system_target_list(d)}&quot;
+EXTRA_OECONF:append = &quot; --target-list=${@get_qemu_system_target_list(d)} --disable-libkeyutils&quot;

 PACKAGECONFIG ??= &quot;fdt alsa kvm pie slirp png pixman sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It's better to add a PACKAGECONFIG for this. It will be disabled by
default then.
</pre>
    </blockquote>
    <p>Thanks,&nbsp; it should be better,&nbsp; I will send a V2.&nbsp; My original
      idea is only disable <span style="white-space: pre-wrap">libkeyutils for qemu-system-native and keep</span></p>
    <p><span style="white-space: pre-wrap">original behavior for other recipes.</span></p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <blockquote type="cite" cite="mid:CANNYZj-BHgRk3yja0hr3AabwZXwB0biFXMQQ73mxua=yAufH1w@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
  </body>
</html>

--------------0qmiyUfrsXqvmdwmHOlv2OzJ--

