Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D16CF6BE1
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 16:34:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10309.1767803681441300606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 08:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gfG5mip0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5467e3187f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607ADdOd1575524
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 08:34:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=d0NM1cvW0/yZBtAMW0hyA7qWSwN8JCzNfAfdjbgpcYQ=; b=
	gfG5mip0KXwx1qmeGnSmikpaxIBIeFUVgOzd0a5IXWFodTqcT5qQQX88g7YXwkcR
	KVr3KssFaUoJiY10wnGGPn0SdlmFV3NvsDCaH0QC/zBdvv3r7JGPqE3NF09zZYg7
	rQkPsTLYOPyWZ1FpnauBUqHcXjz/3ZBURNzELAQiXXp1oS7ql+s3Hc0/gBKImBEn
	zGW9xAeX6e96TH4T8xLff2Pr2PUtMllYhxWj0REIcmdfetcTY4jnVlliMt3wLhqq
	yTXoJoUaIm38E/sKLvAa0Z7+j9irtG5NVC1z/dD3Dgby9B6b+ZFeOrKv/HVCfPqT
	ZOKTh+/DcIp0Ohr7C34wXA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bey9245hj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 08:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqIErDmz/pNk7oy26punmKvOK0bAE4USXGYrlnIOD3bztwzzl8lTi86Z9GGVKeDyjmznBTvlWWtKQmAjZRxYvCANYiU1EFcEMsds1VFKdjmLXOJrNc6sHmrUUEPo6UeNdVYNYA0hz16LtZSVdCOqJeRqg7IYR9RsGSsxIulYqf3bYULPagGW9r6SfV22+wmJi7V2Z2Ch/rWWj4Gz446gcB7ruvEXao3YRz8xXr6RvbEiepaHTuYBtjFlEohoiy7gcrGOJxG8SfCBmYZkZ+AXGPYXDfzmE+Mzh+UHtO2Qn3rz4/Vo3BW3inOpybtURQPOZjUf6mho04xBNOxPLD+gbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0NM1cvW0/yZBtAMW0hyA7qWSwN8JCzNfAfdjbgpcYQ=;
 b=LbARDu879XUosAH5E9yTMuC84vsS3NlEBtv64pAxJ7uDrhPakH4QrLkdPgyvooQtzL9n2326blxPKOWq0VU4B29DX3pLHMq/g6sxd68dIxT08/eD8GPbHy7GdyHbc5BNVQ0QuBrs7Bg0T0ZeKhnoXquSifYDnhwmjAqkFVE2PT9B8h5qcx+Y9ltRJkMv72W7320nMOykfx2GLgjvsPQVW/px28UQT7MUtyxaXSMroY83RGTBEk8NcmbQ8wSrkkAlssAdyPKOuQEQrRb+QJZ2jW8tWmQB2zsMxpf8PdV5Wdu/D9auQgjU+m5XIYgjdzL47Uho5JHJZ/6uXc7lB45CtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 16:34:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 16:34:37 +0000
Message-ID: <663fe060-072a-43a4-b0f9-20e172007c47@windriver.com>
Date: Wed, 7 Jan 2026 22:04:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources for
 'make rustavailable' support
To: Randy MacLeod <randy.macleod@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr,
        openembedded-core@lists.openembedded.org
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
 <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
 <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
 <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SN7PR11MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 0812c0f9-b94c-44aa-c1ec-08de4e0aa58b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bmU5YnViYkh5RTFqck5kcEVJazB1dGJBWktZTHFTZytjSGNVK2R0ZDlSR3M2?=
 =?utf-8?B?cWovRytPTndKcXlYUlE4S2k2L0hLdS9vQ1lRVjh5LzZqQWlCYXh5VUdsczRw?=
 =?utf-8?B?b0hQZ3hudGlRbHJocmRtRnpBOGUyZ3k2emNiVkRCUW5LRG1rUWx2RzJrZFBh?=
 =?utf-8?B?Q0JyQ3NjZFJVUXBrdUJtSFJZaUlsNGZ4c3VzMWFORXpoSGxsblVhTnJjRUJm?=
 =?utf-8?B?dEx2Um93bUFodVV3TU1wZllwcW4yV3NsaWVBY0w1SGZTcHB4cE1RYjVwSXJj?=
 =?utf-8?B?OTA1VzdlaTd0SkwxSVk0RDk1ckpMaUNqOUF2TlhJUkNqb3lSWXp6clZhQXE2?=
 =?utf-8?B?UVhKdEhNNVlSd29tK2puU2FWVG1qUUZpcXJoMWdkQzFQbmdRTU9MTmltR3pz?=
 =?utf-8?B?ZHBxbmNYc09WbVo0dWlmak9lQlFSM0lQWVJrcTNMRFdOd1VaQzNTZ3BHc0V6?=
 =?utf-8?B?WlJvSEJxanFJODFLYUdLQ2JEeGlGU2tYSjdjdTRJblpZeEpVNmNSemNTWTJ2?=
 =?utf-8?B?TkwvaE5jTFJsejBTdHB3U0RZTmY4UFExZEt2K3BxMERBWFNocHY3bkJKaWgx?=
 =?utf-8?B?OStwMkhIZHlJMmI3YUNaWkhnaC8zQ01mR1ZqTWVoWGZGdWVlTWJLd25HQVBW?=
 =?utf-8?B?TURJclU0VDN2ZmFGQ0lwVlladnBubng2dGgrRU9MSlBYRGdKOGhVc2gxcm9G?=
 =?utf-8?B?WnJJMU9ZUE9kNnhNNFkvWDYvaGc3V2tCUThYT3RhODZCZUJKT2F0ZCtVRUMv?=
 =?utf-8?B?SVFrMlRFNG0vMmhMUDdveWF5WEg2U1E0MkxyY0xkNHFUdm41eUYrZzgzTXFh?=
 =?utf-8?B?V3gzdUdBQmJBazUraGFPV05aK1JWZmdOWTNnUFNBYmZ1aHpVM3FsZDRqZGIw?=
 =?utf-8?B?dEtPdXVRUVZZMUhOU1BKNXhDM0NERkpUdk9KVjNkV2hnaFZ0YXRGazZTRFpj?=
 =?utf-8?B?VVhlVWFlSzdTbk5xTEhJUnN0SmJMOVBTZkMxaXBmWjdnUXNTbmp4UUxaN0tQ?=
 =?utf-8?B?a2Nwb2ZhSG44NCtFaW5Vcjd0eVFiUVFTcUROd1NIUllQdzRKSnh6ZDkraGN3?=
 =?utf-8?B?d2ZFOUNrZStoUndkM1NZcit2UHN0Z1NLZ0VycUpQM2lJamxHc2h6ZmZtZGdy?=
 =?utf-8?B?aDZNY2FWRDByVEJOSkdzL3k3MjQ4TVQ3OUJ3czBhbmJ6ZUc1Y1lZQlJYV2dl?=
 =?utf-8?B?cXJKZGRnM0MxdXkrMFFIaThJWURHVThPQkg4ZnY2cnpGUUJpV3BKNzFDUWdl?=
 =?utf-8?B?TkdIZ0VKUzNUUWttWWJKeDhwRzVOQ3FCakNTMWNmV0crNEo5V1BCSXJjQ1lQ?=
 =?utf-8?B?WlZlWDJSMXNHNzZhZFNZbWpCRDZVQXFnSU9lak5CQXlqRTVwcHY4LzdjY04x?=
 =?utf-8?B?S0FJZkZwdTVsRnBUYlBSakFzVnlTODhGNWpVa0I1WHhtU2Rqcnd6S3dqdm5Z?=
 =?utf-8?B?T1pHcWZNM1VSRzdaYVp4VVlPQ0VSZExHN04rYzVJOHA0S001bHhobDRNOWpI?=
 =?utf-8?B?cllVRzlURzRIYVgxcVRZWFBVWDRROG5UZGMxMTlKUzZjOHRsbUdtQlNocG1J?=
 =?utf-8?B?eW9hY28wYWxaYy8zbXN2VzgweGFROFJtVzJ3ZEQ4NkpNVmMvK2lYU2VsVEtw?=
 =?utf-8?B?MjNiSUw4VDh6N3dnZU9mRm44SXZoaXlaRzdhZTRhUXBTRUVsK3QyZy9uSEho?=
 =?utf-8?B?bkdLOU5FeGVnRStvTGZiTU54QU1NMWVVOVZ6cnFxSlp1RTF4TWlxbkh6VkRh?=
 =?utf-8?B?VE5NOEtVWjIwUVVoOU9GaDUyYStCbkEwRmtiWitiNnBOejBYenN4bXh3Ykxh?=
 =?utf-8?B?bWtBMTR0dEJ2RjRDbkI5UzZTUUtsZTNKQnVsdnNQQzlJcW5qcUxmVzJsclN6?=
 =?utf-8?B?cHpFcE1ORWEvOEZKdm4ra0dJREhHY3BQWTdqbGxEZjQzSGppUndzRkRPd0px?=
 =?utf-8?B?NkpMdEhOZXBkeCtreHpMNHo4U0F5dUN5WkZybkNNMi9zaEwvNWxBMmVPbmRE?=
 =?utf-8?B?S2ZIQ2p4VVZQWXVBc0lxaXlIV256Rit3U3BjWFRqeHdiRVFjTmhybHVtdmZQ?=
 =?utf-8?Q?+gicE4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aCs4VEdRYzd4bHFsYURCSmxEbjZsckNudTBpQVlkNVd5TzI3Wkp2TXZ6czNI?=
 =?utf-8?B?b3lzamtYS0NYcmtUTW83Q01WWC9hdDNERFBDMWsrSHg5ZHp1bnc4bjZjZW9P?=
 =?utf-8?B?cVdJNFR3V2UzcFl1WWg1cnduZ0VuU042R3h5b21hdUVHaXIwZ00xUWZuM2Zm?=
 =?utf-8?B?bHBIQ09SSmwxRHpWbi9GZTZIeml3bkVvL3ExUjM3TkoyNFBrc0FRUXJpTlg1?=
 =?utf-8?B?dDNTb216c3QxcjVlVG9wZUdacWYzd3NOMnBmRGVjdjVDRG5xT2piZlpMWnEw?=
 =?utf-8?B?RlZHSUpiL2dUdHhYLzRUbkZ0UFNvNERXeGxyazVzKzd6S0Z0WTlKL0VjVEZK?=
 =?utf-8?B?cXE1ajF4azR3MVJPZGNwNkd2aHhKOWpTYjJnd0F4T2R0enVhZWZVRnMzanpn?=
 =?utf-8?B?SVlicWZ1MSsxREtLamsxWmhJWGxRWE94bXlGcURGQmwzcEJFd2UvcGF5U01k?=
 =?utf-8?B?dC9tZnFGb2dXeWpYUzJEcGVDQjNXQjhLOE1xSFovM0cwWWNPT2tTM01JNUV3?=
 =?utf-8?B?bTRKMlByWDdFUWFLVGRodkt4ZG4rU1NwU1ltSGF1bHl3TElGOVlOakpYLzFW?=
 =?utf-8?B?VW5EODdudnlGWXAzelhQUXNaQm84eWNkMWc4STI3WnAvL3hVMWZ3QnNlUjdE?=
 =?utf-8?B?KzFLSFR0eGtYci9IZDRnVmJhQ1JSQzVrTzZKS1Bvdy96TjFWY2lNMTdqYm1j?=
 =?utf-8?B?VzR5REViZTJ5ZlFsdHZXU0NlUU9kVjdXQXlXcEpzVC9lVDR4cmJyL1M5R0h1?=
 =?utf-8?B?VXN3V05PWllRUzVKZUFzREoxNlUzeEhNeW5ydmZUMDk2UVdJNjU3NksyVnN4?=
 =?utf-8?B?TldvZFBtZzFzME45aVFqR1Y2cXBOR0xld0VuMjlGaTRzc2FVUFFIN1JDNXpm?=
 =?utf-8?B?ZndRMlQxOTFVZzY1UjZ6NWdpeHhEblBFSll0VmtkdzM2MndjSWlnZjdVSldn?=
 =?utf-8?B?QXI5enREQnZaTDhVNk9waW5ITkJHSDJRaDJwZEo0aU51MzYvUlRiYmFCOTVO?=
 =?utf-8?B?SzNVS2hkdmhpSk9FSkpSOVlzTW1iaXgwbG40OHlLeXRtYjU5b28xT09acWMy?=
 =?utf-8?B?UTVUQ1lETVJLbkt2WlRGTTg5WkdqcDBhRDRjdXlwVDB1RHIxdmxwS080Ykg2?=
 =?utf-8?B?WHI3R1hpQW0xT2pxUGJLcjVXekdyZkNyYmFra2lST0lPT3JBcnNxTFp5K2V2?=
 =?utf-8?B?UVRjSTdDYWFxWEl6TzhxUWtjNEhSQXFLQ3p6V3J2UmtzNHRmYU1MT3Zva2I3?=
 =?utf-8?B?K3IzSGJiTTU5czV2a2lySUNNdE1CUFBvRTZPTXFxenJoRXZkdHhVb0x0M2dG?=
 =?utf-8?B?dmxONFpZbnIvNm0wNVdzcjg4cmVJSzVHNGhvWjZYNFczSytOOGdyR01tQUtU?=
 =?utf-8?B?bWgrbEhhbG1sU0FCSjdEQk4zV0IvZzl0THZlVUhMcFMwQ1oyeUEzQk9ZTHJG?=
 =?utf-8?B?U016NHNNSDNOOFJkR2ZWMDdyVmlCWTVpdUErbzEyMFpmc0dzZzcvTXlTMTdm?=
 =?utf-8?B?S3cvbGxwVUpMMnRlNzlIMENnNWZROHBUM1BPK1RRUzBpRTlEdUVGOWNVamNj?=
 =?utf-8?B?RS9PWmdmSkREdUd3R2ZtQWJKM3NSUGNSU3AyZlpXcW9UazNmOUtrNVgvSXRs?=
 =?utf-8?B?WlV1TE9kTEJLM28zUm9kVmhCWXFSSUxjYTZZQUVlYWRsL1Z0YmFybW9vNGZ3?=
 =?utf-8?B?cTlYR3VqZkFLUmtpZXBHV1RDNlRYSkJIb29qcEF3N3RvMEEyNWszdkhXUGNv?=
 =?utf-8?B?eTNxcHdFM2lVRkxBcFNYWW9aZmVmVXFhL21acmRGMnlVN1N2Z3ZRdmJOdTRB?=
 =?utf-8?B?UzlPNlhOOEJ0cDFzK0QrNFA2YXYyL25mZ1IwYTVFd1p2ditlSDVEbFNDMEgz?=
 =?utf-8?B?UHZPdXlUemloZExEcHFKUldWVTAyQkdOeUtZclJVYUhCbkRJVkZkRGx2RzR4?=
 =?utf-8?B?S2RESTQ2TjdXS3VacnY1UFY0S2gyZEVPb1BpN3R0aWg2SXg3V052MkdqNHBN?=
 =?utf-8?B?VFY0SHdHbkl1bUorWXViakx0V1h2Vlh5bERWZGxNeXVvTXlaTytWQVVyRFR6?=
 =?utf-8?B?RGtzWFo5c1k0dllHaS8wM1NvMHFGTURGdUZnQXlVNWxaZERQYUhXSzdzZzRx?=
 =?utf-8?B?RWlRaGhtd3JiY2tRbmlsSGlXR2pWODVYV3pNRERiaEVGNWEyaWg1eVcvTUZk?=
 =?utf-8?B?S3M4MjRrQkxoQ0l1Q2UrZ3FKaEZkYkJhUjk1akx6K3ViLzBMTFE5aUpKVUU4?=
 =?utf-8?B?eElBZUhDcGNkVWJLTjlSWTZLY1ZpMW9tV01YcThhOHdxSkkwVXZKRk9WSmYr?=
 =?utf-8?B?OU00R1d4azJ5Y1J2SVllT0FIcXAzNXlydGQ4YW9DbEUxWUpLbkQ3M01TaXNu?=
 =?utf-8?Q?Wxjn3QPoXPwdTruU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0812c0f9-b94c-44aa-c1ec-08de4e0aa58b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 16:34:36.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbGvm4KfGBmV2hsZ9Y+UM2Abt30GRZi9FSETArsaRaZC0fIS85XzBEcDXj4jkphXSbSfDRPiTFTa5tJ4RuNHErg8H1ilzaAA5J/jUScotPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: zPXUDGfaU6pkNeN3s1p6cm-R-kHCJL7M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEzMCBTYWx0ZWRfX/klv8B4Y7Mua
 k7fEDikB0ICmQ4f282K2QsS+cocpgZHYxDPk+wxwPwwcCQdNStm5+Ow0IQ9uqF8M5QX2+/0uJHs
 DYeUWYd5Va7II4FAtLK2Ff4FPvA+rlF798kXeLe2ka7ixn6lZX1U0nBNTuWTGSCL1UZNsQBt6Ub
 K5vBM4twx75oige6xMpHqW+taP+Jrr0D0Q5AMp8zb5rcQvTHgHa8hzkBKKpzJ1N/1Dye3eO5uYp
 Tqa55SxPWPm+Avs6YZeb940ojm0rwoz/lIz9keBrHOWY0/RDPak183omCYOIrc/VGiWDVEifNxx
 u5J16PjJrBB5VIIgOu0mJjuscCQgEYmEt3SlOP9XYIzDCq65EzXFEh27ti4y/CYESJZArXn+vu+
 gR8S3bxh9MCe3UYxC+zSKql99YAMNOVDdJ/9gXn6r+u/sAteREf6/HfVQ2ZvbYBkcdlWk8IJSmp
 +7EvV6K6wS/FVi5H8ng==
X-Authority-Analysis: v=2.4 cv=HtZ72kTS c=1 sm=1 tr=0 ts=695e8b20 cx=c_pps
 a=ERW18fiFji9WgYXv9zI75g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Ii64LkiutSXuzmU5jAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XHuQCGD4GnbKbu3_ZqE_5fuz34DsPkPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 607ADdOd1575524
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 16:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229013


On 1/7/2026 12:29 AM, Randy MacLeod wrote:
> On 2026-01-05 11:24 a.m., Harish Sadineni wrote:
>>
>> On 12/30/2025 9:28 PM, Richard Purdie wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the=20
>>> sender and know the content is safe.
>>>
>>> On Tue, 2025-12-30 at 06:15 -0800, Sadineni, Harish via=20
>>> lists.openembedded.org wrote:
>>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>
>>>> The `make rustavailable` process (1) expects the Rust standard=20
>>>> library source files (e.g., `lib.rs`)
>>>> to be present in the `library/` directory under `rustlib/src/rust/`.
>>>>
>>>> This patch ensures the required sources are available by:
>>>> - Copying the `library/` directory from the Rust source tree into=20
>>>> `${TMPDIR}/work-shared/rust`
>>>> =C2=A0=C2=A0 during the snapshot setup.
>>>> - Installing the `library/` directory into=20
>>>> `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
>>>> =C2=A0=C2=A0 `nativesdk` class, making them available in them availa=
ble in sdk
>>>>
>>>> 1) See the kernel tree for Documentation/rust/quick-start.rst in=20
>>>> the section: Requirements: Building
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/rust/quick-start.rst#n145=20
>>>>
>>>>
>>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>> ---
>>>> =C2=A0 meta/recipes-devtools/rust/rust_1.91.1.bb | 17 ++++++++++++++=
+++
>>>> =C2=A0 1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb=20
>>>> b/meta/recipes-devtools/rust/rust_1.91.1.bb
>>>> index a25f65f674..7644ecf2d2 100644
>>>> --- a/meta/recipes-devtools/rust/rust_1.91.1.bb
>>>> +++ b/meta/recipes-devtools/rust/rust_1.91.1.bb
>>>> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> =C2=A0 }
>>>> +
>>>> +do_rust_setup_snapshot:append:class-native () {
>>>> +=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kerne=
l',=20
>>>> 'true', 'false', d)}; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ ! -d "${TMPDI=
R}/work-shared/rust" ]; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${TMPDIR}/work-shared/rust
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust=
/.
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0=C2=A0 fi
>>>> +}
>>>> +
>>>> =C2=A0 addtask rust_setup_snapshot after do_unpack before do_configu=
re
>>>> =C2=A0 addtask do_test_compile after do_configure do_rust_gen_target=
s
>>>> =C2=A0 do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
>>>> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export=20
>>>> CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=3D"\$OECORE_NATIVE_SYSROOT/l=
ib/${SDKLOADER}"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export CC_$RUST_HOST_CC=3D"${CC=
ACHE}${HOST_PREFIX}gcc"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOF
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'rust=
-kernel',=20
>>>> 'true', 'false', d)}; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ !=
 -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust=20
>>>> ]; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mkdir -p=20
>>>> ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cp -r --no-preserve=3Downership=C2=A0 ${S}/library=20
>>>> ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>> =C2=A0 }
>>>>
>>>> =C2=A0 FILES:${PN} +=3D "${base_prefix}/environment-setup.d"
>>> The commit message should mention the size of these files.
>> Ok sure, I will add file size in v3.
>>> Does this make sense as a distro feature or should we just do this=20
>>> all the time?
>> This is suggestion from Bruce that we take it as distro feature.
>> https://lists.openembedded.org/g/openembedded-core/message/225256
>
>
> Richard mentioned this thread in today's tech call when I asked for=20
> commentson the rust-kernel PR.
>
> Yes, the high level requirement is to have a DISTRO_FEATURE but=20
> common, infrastructure parts
> such as this code that just copies a hopefully small number of files=20
> around,
> and is part of the rust recipe, could and likely be done regardless of=20
> the rust-kernel DISTRO_FEATURE.
>

Ok sure, We will remove the dependency on DISTRO_FEATURE=C2=A0 for copyin=
g=20
the library directory from rust recipe.
>
>
> We don't want the rust recipe to change based on a kernel config=20
> unless we *really* have to
> since that essentially doubles the testing that should be done or=20
> leaves a gap in testing of the
> rust builds. If you do that for the kernel first, then another recipe=20
> later, soon you have a maintenance mess.
>
> Also if the kernel needs these files, then it's likely that other=20
> software will need it as well.
> You should analyze why the kernel needs these files and why other=20
> recipes do not. Perhaps any
> kernel-like image will have the same requirement. Is there a baremetal=20
> image=C2=A0 using rust anywhere
> that you can use to check on that? I looked but all I found was:
> https://github.com/ahcbb6/baremetal-helloqemu-rust
> Anyway, let's focus on the linux kernel's requirements for now.
>
>
> So, how many files are needed and how much FS space do they use?
>

The file size of the library directory is around 50MB.
>
>
> What are other build systems (gentoo for example) doing with their=20
> Rust builds to satisfy the kernel's rust requirements?
>

I will check and update on this.
>
>
>>
>> In future when rust is default in kernel we can change this, But till=20
>> then it is good to have it as a distro feature.
>>> Do the nativesdk components get packaged separately? If they were, we
>>> could then make that an SDK feature instead.
>> No, We are not packaging it separately.
>
>
> The questions seems to be whether we should create a separate=20
> packaging rule.
>

Now by default it is getting packaged with nativesdk-rust, Do we need a=20
separate packaging for libraries/files that being installed for rust in=20
kernel support?
>
>
>>> What happens for on target kernel module development? Shouldn't=20
>>> there be a target package too?
>> Yes, I have made the necessary changes to include Rust library for=20
>> target as well and have tested Rust-based kernel module development=20
>> on the target.
>> I will send updated patches with v3.
>
>
> Before you spend time on polishing v3 please explain what your=20
> workflow is, step by step,
> so we can be sure that things makes sense from a high level.
>
We will update the rust recipe to copy the required libs to target image=20
and then the below steps to be followed :
- Build the image by adding the required tools via IMAGE_INSTALL:append=20
( e.g kernel-devsrc, gcc, rust, cargo, bindgen-cli etc..).
- In /usr/src/kernel, run "make rustavailable" to verify Rust support=20
(This step will check all supporting tools are available for rust=20
support in kernel).
- Run "make menuconfig" and enable "CONFIG_RUST".
- Run "make scripts" and "make prepare".
- Write a kernel module in Rust & build the module using "make", which=20
generates the "module_name.ko" file.
- Load the module using "insmod module_name.ko".

Thanks,
Harish

> ../Randy
>
>
>>
>> Thanks,
>> Harish
>>> Cheers,
>>>
>>> Richard
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

