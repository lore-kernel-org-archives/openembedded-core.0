Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A697CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 08:53:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12794.1757494404758318501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 01:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rCQQewBH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1348602c59=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58A3m0g43527069
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 01:53:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Ehyw5u1QxByEJ/nEJ1wJWEi6pvecjase6lXoqa6qvsg=; b=rCQQewBHOjXn
	1N5b/gmD8athQtbzbkB1NeaWX4i2/RAeNhIrJDUZh5wPnwHJMRj3ntKGSL3VKWp2
	YvTBHmHFb6iIb/+cIRR4e8hoLBCW1LT2GLDwF47kfBayRTpey8UjlYMHq9fgpCJU
	Wm3vn8fNmEVMfE+SYf8Klzy9JuYC0lrxlGTfQGPIiJqB2VTyJvfDByV1qc1BsIs4
	mUNDCCDh26QNdetO1vcsMacNim19RKUvW+dRB4oEgCuXnEsrvzV2SzzzjSznQXhC
	VMbeczW15jJRvQ6y/MbNkoYvCMPRKWkNc7naHNeL2bjsAP4DpHbhKGPZm+QTSpxq
	aPc9RErzYg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg3uth-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 01:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGiIwT22hdHPj1XKfQWjXYoASxgjIUXgdgXt0CZGFwkFBrwT/2fck4nz3+WtxMEAqG0JkLhxhgeR4P1EvGZj30QltUXT8vvFGP3YUcLsegIrimCk5/2czqPeB8uCXxPmvhZUIBxRhYcwpUao6PSSyAPU7z3cG/poQG5V5UDHVRYSqutAURBDgXEsjtpHt5ZlEKgfP6eb5UpkxIbEOqOQ1wM91pQ/WFwCfl2QsMQG//yafBs/cwTlOjUoRwWUYYwQ2Oegw/BxYgG+1nJPiDyxHEmTaI+v+x9yQqV+uK9mEKoWNUc8bTK58vpQwM2rxbUUnrvmu0DBqRhN+HBjaOaY9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ehyw5u1QxByEJ/nEJ1wJWEi6pvecjase6lXoqa6qvsg=;
 b=Onh0XFSsamGE0gnOCug2x1LPGnO0SjrplTyHBbr81vVEKGZ7xGs9LSbt2pUTF/s3lUblGRPCpDjxgkkj5fckRn9ix/YjQ/f6JSCikzhUCZpDtshDimX9YztY8PypxJ9fRtJ6Cnx3lt3lrgjZJK8s+yFS1NQBIu/qGTKkh4TwHMQgIfUNIAzJt8MBAxDYC1t3Roz1NNZ7q8MAE2eR6B9HBuHmV0dWorwg+gIk2IoMWE8HAst4tIlPrwtRVqF4GcpXlbw/vr5T27pj3WlT2KC+TMm6Bh/FqFoTZ4xLRnAOErjwYwSpIliEHLkl7hEJiNvB+dYF9IihFCZUy5BJOS24Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 08:53:21 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:53:21 +0000
Message-ID: <c7039f90-656f-4076-a726-e931365091b9@windriver.com>
Date: Wed, 10 Sep 2025 16:52:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250905123421.3940634-1-haixiao.yan.cn@windriver.com>
 <DCOC0GHAATJU.2COUF7546LC27@bootlin.com>
Content-Language: en-US
From: Haixiao Yan <haixiao.yan.cn@windriver.com>
In-Reply-To: <DCOC0GHAATJU.2COUF7546LC27@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ba71e7-71ff-4650-8680-08ddf0477ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NDl6RVFBQS8yKzB4R1l6WmZzamZPbnZGc0EzeWJxSDdXMWc2MnMrY3VIUVZB?=
 =?utf-8?B?bE5SdUQrWm5zb1o5WVY2Qy9rN3FuR0ovQThDREYyVkVrcUp2ZWtxMnJHdFRl?=
 =?utf-8?B?T0M0RnRmLzkySmxRTC9wRnJmbzdoUjIzMTFhOXV5WHRVWE9SMVo0anc0TzRz?=
 =?utf-8?B?bUNXSjcrR1pUampDb0plUjd1cDZwY2s4OUFIZlVrMzFyVGJEdmptWng2Ujhy?=
 =?utf-8?B?WGc3bGl5VFNQTWx4N0RjbDB0STFoZ3B6MVk2ai9wMGt2RWFBbTNHVjlkSmdj?=
 =?utf-8?B?U3lzRW5zclpiaXhwa1ZnUC9JUlY0OXFDbDNjSEloV3doN09zUmhtMFc2MUVV?=
 =?utf-8?B?dXNGcUczcW9FUUEwZFBuUlY4bHJubjhzS2h2YUJSOW90czc4dEN3NkVFY2NZ?=
 =?utf-8?B?VkZDS1NVQWlxRmt3eStQWHVTdHpwcWZuTThRUDcwb3ZVRWJhWm9acWJXZlRY?=
 =?utf-8?B?WHBVaTI4SGpPVGdHVTl5aFplTkFuMDMrcEgvQ0pRdHd0RUR1V1d0aHhsUEli?=
 =?utf-8?B?UG9DdmllQ0F0UDE5cFhjZTZiRURidWdIdW5LMVFUUytHNkVSc3FIUGYrK1ZC?=
 =?utf-8?B?VFJSbWhwNzMvcHNmeEh0UDB0UENUVkdOUjVlMzBGN2lWUFhxYWt4aEs2azIz?=
 =?utf-8?B?MzlqSm5wZjR4WHMvdXVkT1VYdlc5Mnp0NmplenR1TzBKekxZQ3JqMTVlQ2lv?=
 =?utf-8?B?WVpEaDFOU0RsR1h3QnNaQXVSTWJHSGpCOWE4aVF3MUd3S0dZaXlCQWJDV3B1?=
 =?utf-8?B?OCt4M3J3eFpXc1FlTE8zTndYdHZycDhDZGd2ZlNoNzU3b0x2OFZaVXlKOEdR?=
 =?utf-8?B?Qm9PaG0vcjRIU3FQNnZON2JIaU1PQjAwWml6Ull3RXZ2U1VGVHFUdzJrbmVs?=
 =?utf-8?B?WDJlSG5QSEZ2QStFTzlYVlZQdjhhS0czRkp5b3N0eVFibUxEaHdOTTlycUdX?=
 =?utf-8?B?ZlNBZzF4YVlBRkJmZnlUQ0ptK2VZaWFIU2dsYWpSS1RIMVh1NlRERTY5YWoz?=
 =?utf-8?B?cElQZDNiVVFMK25EaXN1TEZHSFdoMjdvOVJFbHVsZE1DeTcwRDQxZzIya290?=
 =?utf-8?B?cmhlSUw2WDdhSzJSYktwbVFZUk9BZXRhMEtOTTlHRUxZQlFEOVhDZ3NRaTRK?=
 =?utf-8?B?MlZTbEp6UXNoVTNiVW9QazBhS0FESkxqRGRNN1ZQWVl2aUlma25ubHBGazRF?=
 =?utf-8?B?Z3VCeHYzOWIwTnZRS1kycndWOXRwdHZOMjc5UEZJTEcyR3NJQW81OG9aL3lT?=
 =?utf-8?B?MzRncitPY000R0ZhS0wxaDF6T0o2aTNwdnpLVWNrbmdQT01SSE1PdkxMRlZL?=
 =?utf-8?B?THlrVjJXRDgyRk1FYjEzRDNFenNVRjlMM0EzTzBXOTV2ekJaYmpQR3B4QURa?=
 =?utf-8?B?YmJRZFBtNEUyWU5mSE1zcXFXWXVhVjZzeVcySTFPL083dVd0K01KWjUwTkdD?=
 =?utf-8?B?NVpvMXNkMDdhZVEyQ0N4cWpJQWx2N3d6QmJMdHNCUEt0blFxRTgwSGRuaW52?=
 =?utf-8?B?VFk1S0lGdllzVUJTOG5tTHlkN3kvN3YxVnJZVkJJaldoQTlaRnJ2NWFvMTJm?=
 =?utf-8?B?SjExQXROSUJXQlhtVjlEWDFsUzIrclRZQVdPQTM4c2NLWEVxWVFSWXRPMU56?=
 =?utf-8?B?c0tQR0dJR0pkZnk2TTFSNzJSK2RGaUZyT2RQSzk2MEg2YnVtYW91eDdIalRK?=
 =?utf-8?B?Y0YvSUcrV1d4RzVuNEZkRzloUXE4dmY1UWZiODBENEtmbzUvSDNkUzlhVTJp?=
 =?utf-8?B?VVBGZVNONEVTanQrRi9ORE1TNDVxOWJ3a2tRZ3RieDVwUXdyWFh4UlBsbzRS?=
 =?utf-8?Q?MQFjono87I0pWSlObrOMaynd51MZmGjc/sqFc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clIyUTJKYklsMTJJN2FVYTFONnFJNDlzSHdXTFdMZjc2SVdUdXdVQk1IdllG?=
 =?utf-8?B?STAzTUxueVVBL1JDSzVFUHBWN3dDbUJBRVNNYjdnTzdsaCtyR1F2aDVkVVh3?=
 =?utf-8?B?am43Z09YaSt0SXhJOWlSTEtWblozVkRrOEc5Y09Ibk9iTE1jejVYc2U4ZGNM?=
 =?utf-8?B?TFJhOWlrdU1OSFBidDFRanp1dUVUOUV3dmM0RlBnVk5QYTlTeCtSSDVSbHI2?=
 =?utf-8?B?K1JOZmNxZmlwT2YvRHZmRFAwMlBVaXNNdTI4RlJUUEdrOEp4L0lpTFdCV0pS?=
 =?utf-8?B?VjgvRUN2UElSODBxaGd5UE5payszL1h1NXd6a0xKamZDaFNzV3plVkdkYUto?=
 =?utf-8?B?THRLM2U2YUVBM3hJN0ZtNEljbWtsaEdvNGJDQzNwSTIvVUxVendhd1ZvNzll?=
 =?utf-8?B?cndMZUlDSk9BUVNOVWNRTHhnRlEvZk1VRjJMZW10bXNaZHJ0V3k5aUJUdCtq?=
 =?utf-8?B?bWtxc0ZESDJYck5TK3V0WlhvUGFMaERmZXpzRVFScnE2SmpZOE9nUytWNlZn?=
 =?utf-8?B?em13L2xEenJOdElIVnhLcVVvbXhncW1GditXYldHVHBWOFFlb3dhS0ljc1pS?=
 =?utf-8?B?dkQvUVR2YUFwaTRHdjRjWTlrbVZKaDhtaXRINUNQam12dEVHL1JTN20yN2wz?=
 =?utf-8?B?KzRIVUtMcmM5Ung1Sy9seWp1VkxRUXpYVFdGemJFUjdGQ0JXNDVXVGZzRWh3?=
 =?utf-8?B?ZzJZcDBWVEJZdUdvbkZNK1Vyc2VNNzNJNGVZQ3kxSXNzRUVzVUNadWpuczc1?=
 =?utf-8?B?SDZaN2IxL1BXL29vRkI1N2JDZHVjNjFQWHp6VXVrOENSNUZKclRTWnZxUzNv?=
 =?utf-8?B?N1FsalZySmIrRXFWYVFYT21YOXZBWjZoVEpMYUVyVThQZi9tZ0s0ZEdsTnF0?=
 =?utf-8?B?RW1LR05jd2ZZRFN2TDVINGpEMk1NeUhtZDY3YmQzRWVLT2N1NlR4OXE4ZmUv?=
 =?utf-8?B?ZU8xVjNuL1dMVVI2aVhjSi9vVWpoWmFSa2EzenFpRXFmTmJiVit4V1paQ2hH?=
 =?utf-8?B?MGlQRjRXK0V4alVqMXMzNTMwcDRWa0ZIdjIzL2d2SFd2MFR4YmRlalg2NE9j?=
 =?utf-8?B?T0F4VlJpYUdlaUMwWmQ1aTFkYlJoVkNqUWRoemlUc0FDZGU4aUgzNWNyU2N4?=
 =?utf-8?B?WHFXTXJtaEZCZ2h4dEVsaFVyektqVms1U0JyTjdZd3BrRHZEWTFFcllqbEZt?=
 =?utf-8?B?SktpaDZiNmtKeGVIUmNnRlp3ZW9uR1lLbGRHY05VaXRmV2RFM2hIYmtrQlQ3?=
 =?utf-8?B?S2tjcWFmRXdZU2dTK2x5QjQ4Z25vZ2hlQkZlTFNvd0dIZXA5WG0yTjNQbU9p?=
 =?utf-8?B?b3YycHhTR05OT0RrT2Y2cjM3RXQwNERONkZlUXpWMTJQNkdkUnVVdHQzOTVW?=
 =?utf-8?B?ZDA4eG5KRmFVWjkwdUpqTDVwZUxhNlFsSVhrdUw5aGw1aUNVOUw2TzlqMGI0?=
 =?utf-8?B?a2c3RU4vQ1hSeGQrR0VwemZuZjhxYjk0bEVCaGxLTlFWTlBHNG5SQlNrOUNS?=
 =?utf-8?B?WkVWTTRYeUtCWm1adTRyRW1aejA3Q3RTckV4d1NzdXc0M2RrT1FWOEdUK2Iy?=
 =?utf-8?B?S1J3VXRwNm13b25CWjYxQVdtREQrdkxLMWFUc0xxOHZSamdqTE1rQW1GbE1D?=
 =?utf-8?B?UHFHZGdqdGtsQ1BsdHVOZ3o2VnJRd083akFnVTUyZkVOUWxEZU9YTkZNVGVh?=
 =?utf-8?B?WVErRnNJU0krTzFqUWgrUWVwQ3FVNGtaWVRCNThkZlJHZmFOVFJUZTdrNHo1?=
 =?utf-8?B?SmdjUjliSUFOd2xOd2NXMTVlNFdJUXZaY0xJY2ZUakxIbG00Nks4cVlDeitD?=
 =?utf-8?B?V0JvWWUrbnp6UHN2WHZ5dTJucVF1bndOcjhMOGEzamh6S1BhSzkyalBTR0Rp?=
 =?utf-8?B?alczaWlhWDZ6RWdEV2tvbVdtQ1dXUjZackJZd2lqS0RUUG5DNVZaTUtWTm9h?=
 =?utf-8?B?cXA3Zy94MHRtSmo0TW5GbHB2RkNHL1R2Sy9ZemhudG9zQ003d0JnRmFkY0lM?=
 =?utf-8?B?Y2plM09CZ2FvKy9tMDJaQWl4YWY2cmVhejVvMW5PeUZvZkE3RmVpVFVSY3Fw?=
 =?utf-8?B?UXZrNlFaM0t4YVE1OWpLQllTcDFrcXpLN2JXRjhqRy9FdkwxbEoyVFJHZmdu?=
 =?utf-8?B?MWlvVFBnRGdPVEV1bG5CL1l5YmUvZXhwT1VQampiandSYnNUMjhYNlNhUENs?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ba71e7-71ff-4650-8680-08ddf0477ea4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 08:53:21.7703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us9IR8jx9Q2USneaE/ZEagFll4N+PhehxxofMW3PU0q6pYPDUHCBvX/WWrZgkbr9xwkvHMOIdcPRXWc9os8P6n22IdlEKXRzsr9gmEn6N1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kP0Y-qhFKP6eof6_z8nywxZE5LWJyQla
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68c13c84 cx=c_pps
 a=ry3IMkS3Xyrd+17OzgfrlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Wyu-lmk0HpA8AmpHPz8A:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA3OSBTYWx0ZWRfXxLpnC+PiXdbZ
 mIXeORb6oeMpqrcdMXNWQFpweP4FeYWj9we/2/ymzBbftUmjOzhxzgDyMFAg87vXYGUbuObtHMN
 shDHhi1MbxXTal84bPFbHTvC3I0pEvuv7ufZj6/HCKbN/JQoVTLNJ7AXFaCOR/S38EF3YYV0IYG
 2R6DOf7NnQ/816ELox2MT0xCfSqGmZAw1pViLop5ep7kp1wl4v9eweXsAPn5ImnYd9j/jIudQ62
 BjeX5oQzQpHp87NEiHaeFjtPeK4T9Bq8O7OCItmwe54V0qggU/kgLUV5/iG2rq1PdWSMJzYRmAm
 CMyklW53m48hTS9uAc9AmJmb6Q2pCbmtPwBwV4EoUbnsAcWLHOkkenCAOEeNL4=
X-Proofpoint-ORIG-GUID: DzVyGLwXyhITxXIQp7-hPcWdQws3GZt-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 08:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223151


On 2025/9/9 22:16, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Sep 5, 2025 at 2:34 PM CEST, Haixiao (CN) via lists.openembedded.org Yan wrote:
>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>
>> When Bash runs with 'set -u' (nounset), accessing an unset variable
>> directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
>> error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
>> is never triggered and the script aborts.
>>
>> The current code assumes these variables may be unset or empty, but does
>> not guard against 'set -u'. This breaks builds in stricter shell
>> environments or when users explicitly enable 'set -u'.
>>
>> Fix this by using parameter expansion with a default value, e.g.
>> "${SSL_CERT_FILE:-}", so that unset variables are treated as empty
>> strings. This preserves the intended logic (respect host env first, then
>> CAFILE/CAPATH, then buildtools defaults) and makes the script robust
>> under 'set -u'.
>>
>> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
>> and environment.d-git.sh have the same issue and should be fixed
>> similarly.
>>
>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> ---
> Hi Haixiao,
>
> Thanks for your patch.
>
> It looks like this is leading to failed SDK installations in some cases,
> as some other variables are undefined:
>
> ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the extensible SDK:
> Poky (Yocto Project Reference Distro) Extensible SDK installer version 5.2.99+snapshot
> ======================================================================================
> You are about to install the SDK to "/srv/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0/testsdkext". Proceed [Y/n]? Y
> Extracting SDK................................................done
> Setting it up...
> Extracting buildtools...
> Preparing build system...
>
>
> Contents of preparing_build_system.log:
> sh: 17: /srv/pokybuild/yocto-worker/qemuarm64-armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-sato/1.0/testsdkext/layers/build/oe-init-build-env: BASH_SOURCE: parameter not set
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/2375
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2346
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2197
>
>
> SDK testing environment: x86_64-pokysdk-linux
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/buildtools/build/meta/lib/oeqa/buildtools/cases/build.py", line 21, in test_libc
>      self._run('. %s/oe-init-build-env %s' % (corebase, testdir))
>    File "/srv/pokybuild/yocto-worker/buildtools/build/meta/lib/oeqa/sdk/case.py", line 17, in _run
>      return subprocess.check_output(". %s > /dev/null; %s;" % \
>    File "/usr/lib64/python3.9/subprocess.py", line 424, in check_output
>      return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
>    File "/usr/lib64/python3.9/subprocess.py", line 528, in run
>      raise CalledProcessError(retcode, process.args,
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-sdk/environment-setup-x86_64-pokysdk-linux > /dev/null; . /srv/pokybuild/yocto-worker/buildtools/build/oe-init-build-env /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-sdk/bitbake-build-vbmlrryg;' returned non-zero exit status 1.
> Standard Output: /srv/pokybuild/yocto-worker/buildtools/build/oe-init-build-env: line 29: BBSERVER: unbound variable
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2371
>
>
> Can you fix these failures please?

Remove 'set -eu' to avoid propagating strict mode to other environment.d 
scripts.

Sent v3.

Thanks,

Haixiao

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

