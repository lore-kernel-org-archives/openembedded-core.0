Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45476FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 11:53:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37269.1777981982510586550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 04:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=m70gfwoG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9585136d0c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456SuAo2225359
	for <openembedded-core@lists.openembedded.org>; Tue, 5 May 2026 04:53:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AkcSVKXzIuS0mjZVV+HvPPp6JqT/BV5vYwGcdl3vhjI=; b=
	m70gfwoGonPhpmBTQnI41I05bKh/cCXtDxdKe8fGo77UvoGLgOUbCC1e85wdEklX
	HiMkdkhHwlXXMVO2SjMsakZs27JBg/ICPu+04g5qAWErl+xrGMBwh7jL3CnmCuZf
	gyh3GMgiTUF/3X+Lk7txY7sNwKJb0/0czPiPfwykVD+ijNi5Yij4+11BhAPPwwAn
	j7o4y7t1l+Ra0Kvpwi+AXvezyz429/o4lz+eeihz+jjSfPn7Y+TXiCxCIAEC7i0m
	tjAZaYsVU1V0FwzhmyjanKy4FAYFcfGl92MJLOr2ekYdwSU790lKwyGuG958WVg4
	FF0ySV+sGhC3jfJbQaGXVQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyu55t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 04:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1avnPEJOpw7kstITdfEuXfzCdXOf0IWgoVxVVflNm/abhSbb+5IEyt7vwTzjgtisOSPZbFP9AcDUlh87zFXgNPXX2H6O2xVPkB/ys+eR/MnLLr49vOcvdVSbPG+V4nX7N6c+4whVO/4ZFf+vGAztrfZfCa+MEXdragdqrdhSR3FcfVZHN28/h6RAxro/jJxqsm1Pn10qjVcoFfXPeP0AVnSVet8HNoa1aXqKXFFBDbNqKmyoiwHThMjwX3rX42wM687CYPmQsz9XbzNdF4SfJMp/7U3z+exphATTaSqzPCQJ87JH3+QTIfwOlIVCaHzKva/JF+Uv69ft9EIxlzSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkcSVKXzIuS0mjZVV+HvPPp6JqT/BV5vYwGcdl3vhjI=;
 b=PEKCF0MQOiXYiajncXZ+7vNai+sUSGajOxw7mu6ETKsrgANGA0SFByUqAFfYcMNStiMh7Pey9uunsy3WYt5G4ruX0o2sjLK47MviOwCXhNFnKxdah3HqG6VNy7t4VltFlVOwCpQWTyGMg9dhhPZLQGs1I9eIRvYz2iwgeLVdrlnb9pnGgsej/PThAuZau/jErKrVL0Gjr+WzW217E5yS+RQ7LRd889xC7jB/btlrNr9OKhwtu3882gCNjRxwwhBDFwvYZpZ7Its3K6b8wyJV7jlExrWGznvOvdfo/ihRV4/HA1aIybTBdRA9NSYvVC2FQXEU9sTF9sf27ay9CkFudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:52:57 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 11:52:57 +0000
Message-ID: <47f61809-d153-4073-b697-82a700d06620@windriver.com>
Date: Tue, 5 May 2026 17:22:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 5/5 v5] rust: Fix rust build failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
 <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
 <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
 <16853c1f-d823-4b87-b81a-ed9607e9aa5c@windriver.com>
 <535902c12a1567ab2d551fa72713685e537566e3.camel@linuxfoundation.org>
 <728dc8cc-eed1-47c0-b07d-0d255a4966c4@windriver.com>
 <9912ca030e57c91d018ccce24a33474c9f297e65.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <9912ca030e57c91d018ccce24a33474c9f297e65.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::8) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM4PR11MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae7e52c-8339-4771-77f0-08deaa9cd992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	/+sSJuObqTIr4mtdeg6/lg8Cjx7dTFwdhCLNHJzSNQgQj+VAkv7fepJ5CThpaYNi+IFJFsmqkaMSvWX+Yo/0yNbIVE4tcCYiVv7jYLWdTMdUMVJBSJDV3nHM5xfmcm25CFzHnSUFA/cugYGZ7/hOJuhKhKOw5T34zgxg5LMZH0GU4vZWFDu8Xsmp+QV0dII3zApdHpwNYC+BXz/vwwOIF/pwIINxyPOJsyPxQ/xm/l2RsBU5BXjQPtILKEW6vua0RcLXCyqE7GlxBagr7tSuJxyTW47dsCgfstSxBLX1/ngIq0PwezGdXUB4UkLRTAArRce1uNyIstT57v+waesvmJhMn4vBqfihHImUu7EBrgrX6Km+eKw1FhOUeARu8Pu1Ms+CR7V7oETJGbYnbFVxPiFR9cH8zFIge3fJDRru/kxcWtaj2F4pFwE3RlILpYRiJpuh6ZiIgipi4l9qyPvwK6XT7I+tk4iS4v/SgLutZxcpc9CO9WffkG7mJirBbZOrITuH3U6U4nvQOs75zQoRLnR0BhEOGRT6EPXTvmpwOael/ACHFjgRChhj6CxwhMxQj3Vy50YU6tncxNCuLEXRu9vyHRYk1tacgCnr3KKYsqrBCNvnnys3lrAmdOEcQQIqY9rAeui3/1fHtH9BRpQdgD5aUjGG/21ItOo+6qkrk4JMJw4T8uejpvplNTcKp5EU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RG5vQjdzRGlIRmcyU2hnczZHUUJxQi8weGJZdWRnL2t1SGc1Q0J5N3o3Q2FL?=
 =?utf-8?B?MEVpT1VreW80UGJ3UWlTZndrTDJuZHowNU5UV0pmM2trYm5RYThmTzY1Zm9p?=
 =?utf-8?B?MnA4MHAreFFSb3UrcDAxMks0aDh5SjdYbkticTRWSTRmaWtzNytWeHM1Z1ZP?=
 =?utf-8?B?VzVTTUVLRG1xVU1nYUlJV3ZnUDMwTnd6Tk5MS09TSmt5TEw4VXd1NllpYnUr?=
 =?utf-8?B?eGQyeWZUdFByRlozL21xdXp1Z0VuSTlOWjh5YjJ5OURTWXdrK0EyNER2K0Ft?=
 =?utf-8?B?dGE4aml1OU04WEFDaFhYZUV3anNqTTZjbkp6SU15dnNRSGY0N1F0VTV2OEEy?=
 =?utf-8?B?Zzd2N0hrZ3J0dG40djQyZTQwS0ZzTmttWE44S3M3eVZZQnFJVU5NbWMwbW03?=
 =?utf-8?B?clMyUzZ2MjNjNnllc2xTNVA5RGtnZ3BhK0lsaUNadmdaMGN2KzNHU3liRlRm?=
 =?utf-8?B?UUJ4Vmo2T25JOFdYNy9hTDQ2UjlaZEcraWVkd0lBTTljWkRucmhVZkRqd0Ja?=
 =?utf-8?B?eVl4UWl4anljTVl6UWN1SXEzMlpFMGd1ejI0d0pqVkZScW84Q2NsbkJCeTAw?=
 =?utf-8?B?MXRmekdvcE5WcnhZVGpUVi9jdHM0VE1UVVZPTThxRXlGK2pwWmw3emtCWkN3?=
 =?utf-8?B?TkpuWHdrQ3pyc0dPWExQSmRVdW05YWtZZzF6cGNsMkY5TC8zVk83dEE2R1lC?=
 =?utf-8?B?K21ENjVmakpOZXdnMjBvN3NNUnJCbXJsbFkwVVRuUkhmdDNjdE5xaktLNEJG?=
 =?utf-8?B?VVFZbUFUWitJN0dFejlBNWVjMDBsdjJRSEdQeER2d3hVeHlzbFJVOGNmeFZv?=
 =?utf-8?B?WXJCU05NTWF1WnhUdjIrYkMvQjkwbW1NSW8vdkdOZzdrelhlZ09oTTVhUFlJ?=
 =?utf-8?B?eGhUcG9pcElTMm15ZHFHR0QwY1o4K2dPcDJBVDBUeTNmdGpPcXZBMWRLeUo4?=
 =?utf-8?B?RWRUVEJCWjl2TXRDN2VZYmF0dldqSkRSL0lHa3NvMFZHOFhydjljOXQ2RU1w?=
 =?utf-8?B?MGdiT3NWNjBWRHNMTlBGckcwV09rditPT3JMMnlhRUJkOWVBZmVjNjBiOEpN?=
 =?utf-8?B?SU9CV3BaV2E2RVMrZUQyK3FIcEhyZnpYK01KMHVBbXZIbkcrRWY3MEZKYkt2?=
 =?utf-8?B?c3RsSUV6eGtWbUpaTGJ1VVJwSWpiNzZlbmhnQ0RwM3FKbW5xU0Y1c0tXamc4?=
 =?utf-8?B?OGt2RExmY0ZGeGZpL2xCekp1bXorQUdVcm53c1dGMzZrTkxNMmFLNXVNYVhG?=
 =?utf-8?B?bGFsNGNDQnZxSFFPVFA3K29rVXZHODhWanJrT2ZJa1Y0aVJ5ZjBCZlhZUkNE?=
 =?utf-8?B?c0JpRXhBMXlYUjRGeS8rNVNybnB1VjJKR3BPMHh1OUU2dFZFL3lhR1UyQW1B?=
 =?utf-8?B?bEJ2dklaVmxCWnVJbTZ3K2xIT04wMllDZW50Y0FjRzV0TER1T3hBU3ZObkFN?=
 =?utf-8?B?ME5ZM0M2aWI5d3FrY1F6cnFCQlQ0enJFVENTbDhJUmt5bUFmdjM4OEF4QWw0?=
 =?utf-8?B?L3V1ZFZwdGVlVTdlai9DeVJiTE8rSUl2RkRZN0ZUVUY0VmVtSklGak1ZSkdO?=
 =?utf-8?B?MkZQbHJqR1ZRVmxHS3dtTFR4dGdIMXBVOGxnZjJsUWZuRzBrK08wZ3NPakRi?=
 =?utf-8?B?SzIxOENqdmV5VHIrWHFVYVlUeWNwMzJtVkNkbFc0b21hTHFyVFczczE5Rjhr?=
 =?utf-8?B?cklFcm9yWm1PRzdGSmp5V05HTDhzcncyQUZRbWxLd01Jd1JNK0JaVHBWb0tD?=
 =?utf-8?B?dklVWHI2MG9CeTRhcHVnaVhFbjZHQ3ZPcDdhemVLOTVlYk1PUXM5R3E3dGZr?=
 =?utf-8?B?SitDTXF3cnI2NkxUTU0rSXBRUVVSY284N09pSnplaUdocS9IMDhTbWkxTDVP?=
 =?utf-8?B?c3QrRXM4NjVLODhhNFphTjhxTisxZ0RwUERnWldTUFJMZURXNXE0RFQ5RVVq?=
 =?utf-8?B?aGJBbWUwOXUxbUJWcWJhOEJuN1FQZi9DQWMyZjlBb01haTNFVGhCK2ZodVda?=
 =?utf-8?B?NytCZENCUCtMS1VRQ1k3TDJZelNTRFJlNW8rQmlmTnZGN1d0OHRTMldzbnBJ?=
 =?utf-8?B?UDB3ZXFQSjV2aGVtWTkxN1BCQ1VoSG0xN1VlNURxVDhTNUVjUFg4NGgzRng2?=
 =?utf-8?B?VVdUY0NjUWVXY2YzUzZNcGtHWmJNOFVtdjFpZElQMGVaelNUTVNjNUlWTWo3?=
 =?utf-8?B?RWFJVjdMWDBqUWFJM3cvZ1JIT0dNc0hPUytTeGQ3dHczRGpUM2ZNMmhkTGRs?=
 =?utf-8?B?ZjhZUk8ybkl2dllMVm1Ba1h1L3RxZitTODhsRGIyVzB3MUdHMGZ3QnczSmpv?=
 =?utf-8?B?OXl2RndzU0o2dHhock1MWnk0VWI4d2NHbE5SYXVMNlN0dHB6UzRnT0RpajJx?=
 =?utf-8?Q?/JTm77ws7L1HyTe+faV+Qo3g6U1d9+0v+N3Gt?=
X-Exchange-RoutingPolicyChecked: 
	drFv0LiHCRYii+nUca1W2mR6P64/+Kzo8nqWSbClPqmQj8y+bxsi5+KBO10CuoCbFj7KvPw7yG8IsYlo2AjHkJz/1MhnrFkBzNGk1ycWBhTumbshJ9EQwstG+03QilQJFUq9OSVXjwb44d9dzxz4hBXrIiwztjjM27tXDHVgfkLuudz6e1MQtie7jM35fPxlc+Ccoq6LnJwx6o5iCBNtgn45OfT0AB8PPGkP+0loB6B/ip2M77OZjtVfFSqqROl7cfvNgjUh5REO1U3t7px2SUedGxOv46sKCxIT+8wH8/cDDrHaCcXMWHPRigWtosyVrl66+bq9rO0bt4BEjaz9mA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae7e52c-8339-4771-77f0-08deaa9cd992
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:52:57.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pAhmopyDqy49v55/5c9Ao3EHdxUMAGQYztWw2/ju1HD7feNqNH2OLviG8DMBYrGb6R6HMTxkySVTNicM5WcbKWmtdwhyMR39Ce1nvzc1b/Gqdqvr01eWWE5I7WDj/Cr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7757
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExMiBTYWx0ZWRfX4HfJ98tfR3CJ
 Y5uRW8sTIrNrr7sS6ajtklmah5WYPBDxo5kWrBtPGuy4Ebd1sh6te4MZdRkuRrSYoaSKiCc2hr4
 oQ7sDVdMWbQfclX6ZazBsyoBKwlh5kMflTQLPCniTz8/IvddtiVyY7wpP7OjCz3oRbC1/bABLUu
 iW3vtoJWGcENUF46scoPmEzlX8VWrIvHHCiYty8ynrx2vPZzFG6xohwos5vrFWMbwEuzM9nqAv8
 IXL0jbRYK6xiDnWa2ijt+3kvKlzRAhYaKaYdJPLjz+MAGk5H3XVqXhfi19bRYGnfjVHYRLNpkMl
 C8gvtmFMT9RXTk2kEbSThSt/hqIcsqJb9TqCRcJ2qAg0HlAX5Gcq94O693H5OFohvyRrIHjcdMB
 cRj5RpOQHZkZa+3Az8tH3Yb5ZEufBr9glxylnakXfAu4tqyaauUVmQQIma8qoTc5zU5umds6cGd
 ThhijxkFVBeuI2oPdwA==
X-Proofpoint-ORIG-GUID: Y_6pHjBQzTzR1MnDMtZ7X5th9I5qXYhP
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f9da1d cx=c_pps
 a=jJ4xAez9KAo77aFOr1Lg9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=f_zlysY-9U4COIw4HOwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: i45qBS1uSX7L1wLDdzLF6Np1Fy9AbhRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6456SuAo2225359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 11:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236486


On 05-05-2026 17:02, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2026-05-05 at 16:29 +0530, Deepesh Varatharajan wrote:
>> On 05-05-2026 15:36, Richard Purdie wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Tue, 2026-05-05 at 15:26 +0530, Varatharajan, Deepesh via lists.op=
enembedded.org wrote:
>>>> On 05-05-2026 15:06, Richard Purdie wrote:
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der and know the content is safe.
>>>>>
>>>>> On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.=
openembedded.org wrote:
>>>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>>>
>>>>>> Target LLVM tools are installed in the sysroot because they are ne=
eded
>>>>>> for llvm-lit to run tests. However, this leads Rust to pick up a t=
arget
>>>>>> llvm-config that cannot run on the host. Overwrite it with the nat=
ive
>>>>>> llvm-config so Rust can execute it correctly.
>>>>>>
>>>>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windrive=
r.com>
>>>>>> ---
>>>>>>     meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
>>>>>>     1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/reci=
pes-devtools/rust/rust_1.94.1.bb
>>>>>> index 3eb2a36406..e4a9f20e27 100644
>>>>>> --- a/meta/recipes-devtools/rust/rust_1.94.1.bb
>>>>>> +++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
>>>>>> @@ -238,9 +238,10 @@ rust_runx () {
>>>>>>
>>>>>>         # Copy the natively built llvm-config into the target so w=
e can run it. Horrible,
>>>>>>         # but works!
>>>>>> -    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_=
EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
>>>>>> +    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUST_ALTERNATE_=
EXE_PATH} ]; then
>>>>>>             mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>>>>>> -        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE=
_PATH}
>>>>>> +        rm -f ${RUST_ALTERNATE_EXE_PATH}
>>>>>> +        cp -f ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_=
EXE_PATH}
>>>>>>             patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>>>>>>         fi
>>>>> This appears to be a consequence of the new install in "clang: Enab=
le
>>>>> cmake flags for llvm, clang, lld tests". Perhaps we should just not
>>>>> install llvm-config there if it is going to cause problems and need=
 to
>>>>> be overwritten?
>>>> Yes, this is due to the new installations. We now need the target
>>>> llvm-config to run the Clang
>>>> family test suite inside QEMU for the target. Previously, we didn=E2=
=80=99t
>>>> install LLVM target tools,
>>>> but running the Clang test suite for the target requires these tools=
 to
>>>> be present in bin so
>>>> that llvm-lit can use them.
>>>>
>>>> Also, the existing check is somewhat odd. Even if llvm-config exists=
 in
>>>> ${RUST_ALTERNATE_EXE_PATH},
>>>> it can=E2=80=99t be used for building Rust because that version is b=
uilt for the
>>>> target. Therefore,
>>>> overriding it with the native llvm-config makes sense.
>>> We simply can't mix target and native binaries like this.
>>>
>>> Think about what happens if you take target sstate built on x86-64 an=
d
>>> reuse it on an aarch64 host system.
>>>
>>>
>> Yes, I see your point about mixing native and target binaries and the
>> potential impact on sstate reuse.
>>
>> However, this behavior already existed before this change. We were
>> copying the native llvm-config into
>> the target sysroot when the paths differed. The only difference here i=
s
>> that we now always overwrite it
>> instead of skipping when a file already exists.
>>
>> With the recent Clang changes, a target llvm-config is now installed,
>> which causes the previous conditional
>> check to skip the copy. That leads to Rust picking up a target-built
>> llvm-config, which is not usable for
>> building Rust.
>>
>> So this change doesn=E2=80=99t introduce new mixing. It ensures we con=
sistently
>> use the native llvm-config, which
>> is what the original logic intended. Did I misunderstood something ?
> Looking at the code, it is in rust_runx and that code us used during
> compile/install so it only affects things locally, it doesn't change
> the sstate objects. I was thinking this was changing installed files,
> sorry.
>
> The check for files existing is probably there due to the fact the
> function can be called multiple times and we want to copy the first
> time only.
True
>
> I still have to wonder why we are installing something which we then
> have to overwrite though. If we have to overwrite it, we shouldn't be
> installing it in the first place?
The target llvm-config is required for running the Clang test suite,=20
since those tests depend on LLVM and are
executed under QEMU, where a target binary is needed.

As part of that, we install the target llvm-config into the sysroot.=20
However, Rust also depends on LLVM, and
during its build it picks up llvm-config from that same location. In=20
this case, using the target llvm-config
doesn=E2=80=99t work, because Rust needs a native binary for the host bui=
ld.

So the situation is a bit split:

For Clang tests, we need the target llvm-config available in the sysroot=20
so it can run under QEMU.
For building Rust, we need the native llvm-config, not the target one.

The overwrite ensures that Rust consistently uses the native=20
llvm-config, while still allowing the
target one to be installed for Clang test purposes. This doesn=E2=80=99t =
change=20
the intended behavior, but
resolves the conflict between the two use cases.
>
> Does the llvm test suite actually use the llvm-config target binary?
Yes it does.
>
> Cheers,
>
> Richard

