Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53345CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 12:07:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44016.1791288416339339893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 05:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=QkR7F49f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47390850c1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BRUgs461918
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Oct 2026 05:06:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Upd2nn+CGxml52TfD/2BAI5UPUwErNNiBHDGBFAL+TE=; b=
	QkR7F49flzTClYTcCzJ8qlM5LHkbi9oMh2u5mCx+MCeDlLgIZ6XmDZEdYb6NbvWm
	PFaHL2uLRwxVS5Ski6m2Pqegrbd/XvnKh1h1Q6xP73JS39VoKsOj+5n0glnykE6X
	/fEUO4odSXL0amTkmLaMjmwbyCITRlThzaNYexNqbXhRD3jXUii4VchGeH1J5m0i
	L4DlBosnSKy471PJn1cSynOqnP84rEl0VeeaTtkOl0QveBpdgvn/JNkJej78hK6u
	AV1jvstNDSH0sSU2N458tnkxm71JsqkD6mJgNY0Xs5gL9RAcBPpzPyr0Qg9r1wA1
	mP74xRr/4k6NIAfTy05Uxg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020089.outbound.protection.outlook.com [40.93.198.89])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h2w013s13-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 05:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS2hkiYkmVC9MoKaKCFVRVMzQydq4RUoDfIELfPJT8Q4h6q54Wdco0QTIGVYJYj+/bd8BxIZmK0J0uzSGLBBSNzg7EM9NBYsKqI5pOXtDMSKmfk+qfzYPvpqRdhCJi1H4libctAu80UqpQzKLgFG2UHru6VNo5m4Q5RRiemh0iHs/aUVdEpwoH+/qqOgps/0PyewExliidPdj0cwmJIJpBhwefp3+AfrwWPHEWXBinl1XhBnPJqujoZHBB0L+37ETNf43EGctvKXGxiuwtpNHuziqGZB1KMe6BYhXqysxRkk1R2R6DxahiXyMlYQ5mU7GzezyOvBggRG831mM8GcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Upd2nn+CGxml52TfD/2BAI5UPUwErNNiBHDGBFAL+TE=;
 b=EXIGKzcy4/rx692PJ8fIVWgCGJz1WfBz2A61xoO2oNwMSOlrPwtm/M6Ux6YuIFSqdR9EZofDVPmfNOFqYBh9iAzycnHfNa3Vhi7j8Kyp/eJPfU/CKJ7FeQH6agfjy7PisDw5eulfrscqWEX5QcvzUJSvZ1xbgkqoqmZ3gzYmNYM/GnqWXzdHW9etV6bnN8HeK2S0rHYQmsP0Hrh7d4u46LLy/ylRsNijTaINyRvRq5ziAoJznG8uF5mKTqHuYYd4fD1xf6mYqZEmEB1T2koXcx4G2GzqzgqhBd4QPM9w475Aka/MAbpd2Q2txwhdPnSPN2lZmvU222/VuuIwyAp4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SA1PR11MB9659.namprd11.prod.outlook.com (2603:10b6:806:4df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 12:06:52 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:06:52 +0000
Message-ID: <7df2b29f-efa3-4717-9c87-8b6ddd94771d@windriver.com>
Date: Tue, 6 Oct 2026 17:36:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.98.1 -> 1.99.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20261005095200.3309867-1-Hemanth.KumarMD@windriver.com>
 <baff8d8df699d2a0b282ce80ccc0147061ee2f33.camel@linuxfoundation.org>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <baff8d8df699d2a0b282ce80ccc0147061ee2f33.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS9P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SA1PR11MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a994e3-f829-4119-3194-08df23a24eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|3023799007|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	y6rsU3u3Z3LjG22qvyza09L7M9rfdC0cTF1InY4QkhlTdv8BWURI2ut8WvdgGYV6phednnW9g3pZMyaVomuz/FqFiKcGRqgUpQaWCPRhYnOiNtXxhWarji0eIieQiP4XWIYhC56fy4Sk17dXn4qtUcKgp4mcFve24lDapMMzAJaT2R3LBZ4vkBxfRjmfrXaHtvl1TWVIuuE9fc+jVqMLHbO72jiQWsna0/TZjvCrSHVlbh1+BXNxU8vMDQu9GNvyi8HzzVGBfJxNYyNxJ7lKX0CZCUWtk92VhUno+idaRGWI9Z8mJwGkgAf34If7hj/sDHTQwYOMDOG86/O3v90k0UhLDKW13WtVbolG6ehBuCc3nwR6lwXPRJI4ISE1AOY3ZGK14bZnx19Ooc5aqLLY552sqskmRRUE2Kx+BnPoecWKR/J3jsFU1+opeDz4mcPMZ/Vff96teIFU6weYsX9Wh+j3+5YAxWufTeHNqcf1mcWwC5n1q+YMZpW54YHGKgFH5rlHZSsmzIhnDDT49ZyKK4IkycR2/CCa/O/AID4uWgpQJkZ/l4Co6cj3Fjpc92eHvYG7rTeDiya+AXuGTuFBsI0FUflYVMwISZDIues/o6w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SE1hR0Jxb3dnOFJxbXdCa0pkY0pkMUo0YkphSjVjTkVndVlKWUdHSHdlMDdB?=
 =?utf-8?B?Rm1PU1pwMTVTTHZpM0FDN3dvSytvQ0gza2NvRWdPVk1tMlE2UWNxVjhmbkVr?=
 =?utf-8?B?b29NMmdoZngvNXNyYTNXeHhCUnVpc0pKMCtxKzJub1J2VlZxSDB5Z2NJQ1Bh?=
 =?utf-8?B?cy8xR2ZpUCt4SEV4b01QU0JiRzVXM1pQSzZNY1RMRy9Ba25mb3pBZ0VkNnlX?=
 =?utf-8?B?SFlZNjJOT0xiWVYzTTczTVBnNWFoK2dwMytpTWl2a25pKzBua1dNV1VBWThN?=
 =?utf-8?B?RzJFUWtudkdOVDJaMkgybnFxekJFdVk2SkVlUVBlWmZUQlJIdWxwd1FtOEdD?=
 =?utf-8?B?VWk1WENqSEg4UGQvQkZIQmJnMGhhdEV0OVkzOVYxejRCRVA1VjYvMkNhM2p0?=
 =?utf-8?B?YW1aUUxGbkt0YkpjbC9tRWNQTlZtM0JZVkNJNFNFVFZONElYU0xOdW0zdXFv?=
 =?utf-8?B?a2s4ZEVLcnRYSEJQSzFpSSt4OTExb2xDNHEvMlpGWmhCZ1ZxaitSYjZuUzNw?=
 =?utf-8?B?bnJiQ2UxcW81RnlqWmI1ajhzcU5TR0dYNDFPTjZGdmxZY1NDZFdMaXJReitP?=
 =?utf-8?B?eHpJWjRIakZCbC9LQTZpSGZOZzhROVlWR2JNcVcvWHRJenk3QnVSbTFHc2o1?=
 =?utf-8?B?K2s5ZkRrcjhSYzQ1NmNrcXdkQnJrWUJRRjNjZTc5WXZvK05EaXlwc1ZsYit2?=
 =?utf-8?B?OG1Ec0RpcEZzVnpuc1gvaGQ5bWpBK0RSR0lGOFFRTG1qdjh0OWhiemNJVUl3?=
 =?utf-8?B?QW8rUGIrUWkwSHFnNllIRjlrdzRySU50VCtwOHpDampEM0NvQnhpNkEvWEFr?=
 =?utf-8?B?bXpXcTF4cEM3Y0trLy93WEpoL2hVVEhpYVlzT2FhRnQ1T0NsT2Q0R3BSWHFJ?=
 =?utf-8?B?YVB2OVhRWGpJaURKZ2lwaUw3Q2xRT0Q0UkY0Qmx1QXdNNkVpSGx1NXR1aVpM?=
 =?utf-8?B?a1hseEtCcWU5a2hwN05LbTJ6WGJMRVEvem9JSGZIcG5QSlk4L01RRk5odmgz?=
 =?utf-8?B?d3pGZ1RldjI3VTl0TTk2T3FDVTErNG04UUwzdUtrRDAxUnRKYjErRmlGZndk?=
 =?utf-8?B?MzI5ZFZQRytNUllKNlV4bjF2bU5MRzA3d21KT2p5RG9MTWltVytEN0ZTR2Nr?=
 =?utf-8?B?czhGcjdKMi9jdTRTa2twcVlKVExpOVFhM2hPaVNVMmV6dFRZcDd4M2V4VXdt?=
 =?utf-8?B?eDBWS21vMUpIL3pGeUI0VklHZkQvVXBnSlNrSGRObWFkdStMeUo2L1FtREN2?=
 =?utf-8?B?VXF6VXdZTVB5SHd1T05BbkhMdlpMTjBiUmlmSkxESDhKN3VvbGpqVTcrNVh0?=
 =?utf-8?B?a0Y0Mjh3WUozMVNlc29BbFhBMUx0VFBsRE5VVm83L1RuM3ZWRm1TUmhOaldJ?=
 =?utf-8?B?YXZGaDNZWDlMV1o1UHhzZ2VvL2U1dDZTMk0yNUc5K01nd2loS01GZDVSTTRl?=
 =?utf-8?B?cXY0aHNSYUh0VW9QeUR4bENqM0xXeUE0M2FYc0pQYW5xcEhVVUZONDRSWkNn?=
 =?utf-8?B?VmIzN2p0MWM5cWVFZ1NDdUM1K25kNUtvdHB5Q0MwY0R5REMyejViOUlrNzlW?=
 =?utf-8?B?bS9tS044TkpQcmNpcXBpN1NwQTVaWTlQc0RsdVI1UnVRU1RxeVZUUWs4UEVI?=
 =?utf-8?B?RXUweG15Y2txQXVhbkg3V3dTY3lQL3gzZFgrUUp3ZmNBZFU2L2lldnlpWCtQ?=
 =?utf-8?B?VVNLRHpIRzVkRFg3UkxhYlhYSmhXV05hWFA3L3hDVzI3SlVtMzlGeU13NnZz?=
 =?utf-8?B?L25QN0ZTOGh2dFFMZzdIMDlsNG1HSGMvMzdPQUtZUmtOa3dTdXZwMEZlbVJY?=
 =?utf-8?B?Y09MMDl4OFBnelBoMGtjek5odDIvano2aFBaWFRhWmRWZXluejUxL2JvdzFC?=
 =?utf-8?B?YlJiWUtDNHNOMmZVTXpnZ3h1TlRoazYzYzJRZ2ZuSWwrTXQrRWJCb1dqVWVn?=
 =?utf-8?B?OVV6S3pVdGl1a0MxWVE4UkEzM3ZMRTRubVR5MFYrc2NXeGNGdTdaM3BGcWNn?=
 =?utf-8?B?TFljVE9GM3dIem1iM3JvTDI3VjBzdE9DenBQTEwxNit4eDB0c0Zib01CU3lw?=
 =?utf-8?B?VjRSaVEyc3pQbkRRS1NYK09YTUtxaUJzek0vWEFuRDRQeFArMFFnQk5VY21l?=
 =?utf-8?B?NHpXVkhVZE9PaWp4TVdOVUkxTmtSVUl2MS9VSFZhMmhjVmR3VmNYOWFYR1ZB?=
 =?utf-8?B?THZvYVc0V1ErcU9QMDBQWWFKS3NYQlZCanRDcEo5SVRQcHpwdjJRb3BHcG0x?=
 =?utf-8?B?UEtQbEIxaUYvRWREa0hiZ2EzekExTFRCaUdObUZzOC81Z2NmTTc0bXFncVpq?=
 =?utf-8?B?aUdySlZNVnd1Sk1iekNPZTJTOG0zNjNEMmlWQmsrRHp5SmQrR0ZoV2FaWkhO?=
 =?utf-8?Q?ST7BK01qLUgBcKI0=3D?=
X-Exchange-RoutingPolicyChecked: 
	VbP/AEduvYqQITf/+wQIwYz/yQR60oC2oaeZgXLBvrlDbjjAHxN0dVxRy8+HGqH0lB5I6RlKdyoWMakiAFlbPEoeRubWKq/2MiSJZGra7CNv4CUI2tEpn4EqKxLS58d/D32hOW/rqsjOLIL3N5vXWH1bYXbfx/Z124aFQaF0fAjO8N6x12Z3fl1LYeT76Do/L2YG4/id579AJZm8CBsLdOhKRHN9SYldZLW5iCTJpJWQ2Df3gMeAtwuU3XG6d7yaeydIoMDa7Cex0wZUJSDsIfut5empUti9atQ5N75Cc+8MVAjMEUSAsznpygy9jWIDMjiFY6ueho4gsRzbSkjwUw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a994e3-f829-4119-3194-08df23a24eba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:06:52.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9BJN1EqF6XBQR6VZIXgMrpOWGyxvZNkqZfqzRbaZKulBopFpbKYb7sSaHuLfGNTznTPjj5JEDkr/jjkAGr/NpSGeZgd7MI4XCHF+90MXPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9659
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0OCBTYWx0ZWRfXyxQRS1lY4+ad
 XHMuq1HWoJyFZJ0NcBltdIFcYpyEqn9eGDCae1LxJybEAA9Idg/gShQfPRZlYnfhsSOvD2htm6F
 ycKeccHVUPIkh1EUIDClFaHOGwj+aml/tq+6B+HFkOJInjmT0IZZ
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac4e45f cx=c_pps
 a=Im6zT5tXWloa+1LbjvLQdw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=j57RdskLAAAA:20 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=e7XP1DP_oxZzs2596vYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0OCBTYWx0ZWRfX+Nszzzh95/8j
 S9RRYyIFJxxJt1imgxHtTywr2AcT4AWcux3/dSrtKMLokvCht3UrIuynxqsnQK3CZxzE3QO+5hJ
 IHeaEkxSyvV3ItmCRoKSD/6K9MCp2bLMl64p9Qsw7ruZO4hyhRhe3+c6g+u+tBSa8V7V6uPp4wx
 325eKm8AkrZoMLe4eCaAQ6T+WQAkD4Ycuw+buQcWvW7nNoTL16WM2NijA2RX3G8VX4BWKgWZ9yc
 LJGe5zhhWER82UkG48soNbE5GxRjeoWrogYJL2uk58/bf0jZXB95G5H0WSGxrFse2Ob9Y33jWhf
 ljJQvQfWNcYuyrFnmmb/bRL98Pd7eQaUJgsOa+obflI7zg7nDHSutUJ7tLpX2QOlzB9UlRE3C6c
 vqvTi0FprSXWDYtljtiNN9zsNw0hR14pM9ZhtriyVKS7bGyYyx06v7JW3SvHWZjS+NCSkocVXeG
 xnQ5UZ4C4LhD063ghHg==
X-Proofpoint-ORIG-GUID: nA8sLOzqDgFLXnzmls8Wl08zIKNY4uJE
X-Proofpoint-GUID: 3AdDvJmn7RXtm3L0u-Ibq-EHrZT8ao3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 696BRUgs461918
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 12:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247286


On 05-10-2026 08:06 pm, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon, 2026-10-05 at 02:51 -0700, Hemanth Kumar M D via lists.openembe=
dded.org wrote:
>> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>>
>> Rust Changes:
>> https://github.com/rust-lang/rust/releases/tag/1.99.0
>>
>> Cargo Changes:
>> https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html
>>
>> Update local patches:
>> 0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
>> 0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
>> rust-oe-selftest.patch
>>
>> Drop merged patches:
>> 0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
>> 0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch
>> 0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
>>
>> rust_1.99.0.bb: drop "rust.use-lld" and "rust.lld" options.
>>    "rust.use-lld" was renamed to "rust.bootstrap-override-lld" and its
>>    alias removed this release, so bootstrap now rejects it and do_inst=
all
>>    fails. The new option keeps the previous default, so dropping these
>>    lines is sufficient. See [1] and [2].
>>
>> [1] https://github.com/rust-lang/rust/pull/147046
>> [2] https://github.com/rust-lang/rust/pull/160142
>>
>> rust v1.99.0 (from autobuilder)
>> +-------------+---------+---------+
>>> Machine     | Passed  | Skipped |
>> +-------------+---------+---------+
>>> qemux86-64  |=C2=A0 23690  |=C2=A0 1022   |
>>> qemux86     |=C2=A0 23427  |=C2=A0 1285   |
>>> qemuarm     |=C2=A0 23407  |=C2=A0 1305   |
>>> qemuarm64   |=C2=A0 23521  |=C2=A0 1191   |
>>> qemuriscv64 |=C2=A0 23463  |=C2=A0 1249   |
>> +-------------+---------+---------+
>>
>> Test results difference (1.99.0 - 1.98.1):
>>
>> +-------------+--------+---------+
>>> Machine     | Passed | Skipped |
>> +-------------+--------+---------+
>>> qemux86-64  |=C2=A0 +520  |=C2=A0 +214   |
>>> qemux86     |=C2=A0 +512  |=C2=A0 +222   |
>>> qemuarm     |=C2=A0 +512  |=C2=A0 +222   |
>>> qemuarm64   |=C2=A0 +520  |=C2=A0 +214   |
>>> qemuriscv64 |=C2=A0 +519  |=C2=A0 +215   |
>> +-------------+--------+---------+
>>
>> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> The autobuilder showed one issue so far:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/4613
Hi Richard ,
Thanks for the review and testing.
I have sent a fix for this failure:=20
https://lists.openembedded.org/g/openembedded-core/topic/patch_rust_targe=
t_config/121608206=20

> Cheers,
>
> Richard

--=20
Regards,
Hemanth Kumar M D


