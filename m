Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B10AC79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 04:42:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6534.1789015369063690441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 21:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TdH1kleT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3713762c97=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A42wV72329033
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Sep 2026 21:42:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=nhjMKtSYi07PLZEv0Yat86
	Joo2DyT1+2AB/r+MLhASY=; b=TdH1kleTUc2y1iV9qxMgqCWQ0144jiEGe/VIqB
	wMC7sL0GURmwi2GQlACMHHM/DDh8v/RzR6guXBcDR7j9cey21gqQe4azbwADWDx/
	K4oX2LS2X0cky4erfY/LEB6QjcStWBels+W8lZCnm/RAoJBJnTGj4PLonLjs0zmk
	xcDiSVeBjRd2S5PH1hRrdNQ/pZsusfdbEPBqC8knL6bHuV5KWBkOgdTLoQfWu4hu
	XIokKHIcidaq93++8aVOuPb3wLBySz161F5KtYH62eIiZOj7cFCGuUAVn0+T3JgW
	4evyArvGl416FDeYgRy1TAOuYZTFuKcp+N6AduyoOy+YAzyQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022083.outbound.protection.outlook.com [52.101.43.83])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcypguvg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMLVmKzDIaCjqcCmt8UJh2D6U4aN6DTdG6t/cAwNS/kLuLIOKn8o8aTHHY3NIDUxLVTTYpch1wUgQNnK7/QNMWyiKzegLzKhpJgREQKRLNuqZaudgXirmcmgZ9hMEVTEiUyj+wcJ5Fsw3nsWd54+7WCCPgWPJ82BfdnkrJJ4UXz8ilFnHousODPmVNaEVk63wmWXpiEkNngI2qocGVhTqoQNDKFgtzSrUZ3zYuClmXApRNHyHi/LQ2N4hL0BANUtF933UY5HEmqxd5nahoLVjrqEAmp4xodpnfG5p0igGwsr85yNYOUU9UDYKy3j2kOE3VnMtw97dSfcYLFxfTCzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhjMKtSYi07PLZEv0Yat86Joo2DyT1+2AB/r+MLhASY=;
 b=htuC8zpZfo0bpZmdHr03Qtarejl9V/fDQ5vGsim2GRoPQFQbncFjGlvUHOLDQ/L/0fbs9cIcbX9pYWkuzkzJSluFlOEY3Ppi1nAi88/8SFEwYOqPpX1ylpHCkz7xIJRuTUxDUwCe3T8vQhkdQRVDKvWjBciZM602moGvNhgEN3z4kXpUhUjBx+CAn48/1UWJuawsc9685qb6xrJgEH61ITx5qwfwNYdY7QLPz2yQor8q90uiGAYUksXjzo2vs+7d5G5+C/AZjBAL6k0pNJk7tlmU0arD5J/BQXwX2Lcf0f5Ij7Qk9wlh/sCfcE3PV/D62vWwzwYxhuwJDdgx+Tvayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV2PR11MB556157.namprd11.prod.outlook.com (2603:10b6:408:410::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 04:42:45 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 04:42:44 +0000
Content-Type: multipart/alternative;
 boundary="------------QcaNqbojmXV9Dwa03c0CaDjl"
Message-ID: <e17b296b-ad39-4059-be9b-7f551b822933@windriver.com>
Date: Thu, 10 Sep 2026 10:12:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose 21/38] glibc: fix CVE-2026-19542
To: openembedded-core@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
 <11fef7c21845e03c044305ba57e289831e7518c9.1788938909.git.yoann.congal@smile.fr>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <11fef7c21845e03c044305ba57e289831e7518c9.1788938909.git.yoann.congal@smile.fr>
X-ClientProxiedBy: PN3PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::10) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV2PR11MB556157:EE_
X-MS-Office365-Filtering-Correlation-Id: 16966dc1-5587-45f2-1b6a-08df0ef5f4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4022899009|10067099003|4143699003|8096899003|22082099003|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	2JlfBVn2BJi7Ofv0YPF7U+YiHhQT8I9qM1tR8cufZnzPqOIFOeCKXr5pF3MmgJSBi2HKPItgGojjHJyMkR3Q+TlV57TcyZ1VM6kX6hVG/RuNyhj52y36OMM2DCm7+4tjDk/wHFBktsmpyAGyAiElBw2HZa7jfJGqZlpS5mi0/Y7B2oxWCOG1nJuTUHR+usTpMBDv6wDecdwO0IbcFxBUUPie+uZMVq/EPDpnlYu2FRl0xZ7G/JunUh1N0jFOlFKjV2pmeGCi5JChXUBL6LWfYO5g0snI6kpxeDCqIGwfy91T1qoDZ1zNdOC4Kem9zQLOce+hc84868xCo02V/xk0i3kVDUYWHSL8Yx16/L+GDFlfNtx1qK3h+bd80Owtk2Bka7NNTz60Y5NkBAgOilcd5tLhZaCpEDYNvp26XWoI4L+yE2qZhuCTuzNA6x/J4EAJqXFit1Wggwp7cIxSPVpf2hXFbpyfmTBefhYM92mSzrG3RthxiYw/eL4R67zlK4mYhrgzOIPm2mwZFKrOd3qfk9BzcAvunl8wvR4avX1LSss3ZuxNW4EM9sntWEr2W79rNjMWsh7l01ozHHQyBUp8p8C7BBD8eMTi+JK5hAbo2RZ4XMkQ3zKJoslb5JmS7aL+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4022899009)(10067099003)(4143699003)(8096899003)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWJ4M3lTN010K0x6YUdZckRZK3BFNldZaU5tcUM5RmFGUnBTWjcrcjQ2a0Fl?=
 =?utf-8?B?Mml2OXE1VXZSaEIvak5nWlZHU3g2WWQzQUtKYkNFcDhhU1hXNnh5QWJ4SXZR?=
 =?utf-8?B?c3ZBS1lySUViZTh3ekFQQ1dkRk5qZ3NoakJrWjFWdmVXM1RhdGRyRlgvc214?=
 =?utf-8?B?MkpnR081WnBOeCtyYW1BQTNpL0dIZTRKRUVUTklJOUZWTWMwSzBRdWFWbGt5?=
 =?utf-8?B?bCtyQmxFY0JEc0REbzRZZnBJM001d2tCMlp2THFBZmN2SDJncFI2aWVZa0hF?=
 =?utf-8?B?VkJxb0FINWVWMjdoajR0dW9BTkQ4SksyYVA0MURZczNQNXhCb0FDZElJNmF2?=
 =?utf-8?B?N3hjSlVzbUk2U2pYVGJsUmJuem5TZ0ZybE9Pd24zOE1lVEFIRTZIOHJ4YmJ6?=
 =?utf-8?B?ZWJpVk9CWG5IMUY0eWpBVlBKZGJoSGJ0MWgyYnNxSUVWakFTaWNVSzA2WTNK?=
 =?utf-8?B?WTlJSzJ6YUhaSE5KVHZFamdOWFVUTGkrUjhrWmx4NjRTWE8zUTVMeVNvU1hQ?=
 =?utf-8?B?cWpKWEliKy85QzhveVRHQWZsQ1dNNW5wc0NFQ3UrTm1XNnI3ZTVWYURIWEtn?=
 =?utf-8?B?R1JTOEtDa1VnbGY5REpBSEJ4QmlYZmdWczc5SVZFVEZXMk1hb2RjbUVJc1VU?=
 =?utf-8?B?N3lmK3l0aEp0ajA4YnYzUTZmcUUrcVphN2UwWm9PK005WkJucnBOQUY2a0VH?=
 =?utf-8?B?YVhxUVhFK1hsY05Nc0kvYXlEOUtrRURoSjlXS21ORmFTY0VIdFRoa1oxQ2Nr?=
 =?utf-8?B?L1E4NHliNHdWa3c0ZjZ1a1BpaFVxVjNPREVNN1lPejZLVzFWakY0N3pIM1du?=
 =?utf-8?B?Tm4rQUFrTVR4dE5jRDlwc2doaDhCcWRFVnhWN0NZcGpsdmwyY3EydWM2T1Bh?=
 =?utf-8?B?T2NZRXBocWNaMjQ3MGo4VGFsdi80MFhFeGVnM0NhUzloSnhqNjhudjhFdWZt?=
 =?utf-8?B?UXhRS2tnbkcvZ093bEFJa0xIM0Q0bzRCNVVWZU1yUm85dTFYc1NyelFaRFhu?=
 =?utf-8?B?M3BBd3VIOTZYMlJXSlJMckJuaFdPcUozd0FmZ2Y4dHZWT010NGJ4cmUvRmZs?=
 =?utf-8?B?alZMSUcvV0pnSmk4OXBNaS9sVlBnQVo5Y2EzUDQ4aXE2aHVwdThOSFdqcS9I?=
 =?utf-8?B?eUphU2NtUkNQYUlLUlVNK25Lbk9XK2liWkVDREd4YU1BZDM2WTdpMU42eEcx?=
 =?utf-8?B?L2h0RFpueVRJV1dJcG1kT2JXY3pkaFFkSzRFTytmaFVMM1M4MTM4dkdCMWsw?=
 =?utf-8?B?a3BEeEIrMnQvWDQ5Q3hPbFNvR1lHbExna3lLNGl0NVNOdXEvWTdkSDdCbXJ5?=
 =?utf-8?B?N05QZFZ3WjRwZSs1STZ2UWhMa0VMRWNzWW9TVnBUNWdLM3FQMXMwSm11cldH?=
 =?utf-8?B?ODlDaU9xOE44ZytnNkFxN001OGFYTFJ0N1QyMEpybWxKZFRsZVA2dTVtMVpP?=
 =?utf-8?B?ZWRnUGowSy9nRlpMcXVHcWlFTUludHlpdUNMcnBNTjZjUGVxRzI3elA0VzEz?=
 =?utf-8?B?bkdrc0Q0QUl6QzlwNGxlNGtQczJvZGdQTGFCMGZMZkY2cE9XaTRaZ3U3cTB5?=
 =?utf-8?B?dGN2aGZhenYyNzNpQk1QWmhPdjFWTUlOblJ6VGRmQW9SYkpjbU56R1EzV1d2?=
 =?utf-8?B?TDhlWUtxL2l4eFZVSE5FblZvVElyZlNYV3lUUGJ1cVM0MVJVNjhXOThZZk1L?=
 =?utf-8?B?MEVkcDZtQ29JeElHRG02YnhCVU5WbElOUkp0V2xGZ0ZKcEdPUVgydzVIbWta?=
 =?utf-8?B?NDlMdTJTWEdyUFo3bFFnQmxZemRMVzArMWpYVGlMSGxISnlJWHRXRmhnMVpE?=
 =?utf-8?B?cUtNR1FHZ1BDcWFXMFRqUWhPOWVhZlQ4cjJpR3I1R0Y0TTJDZE1QK1grNW5h?=
 =?utf-8?B?Y21SN2x4Qm5ZV2pMcXBYRklqdXIrRGgrWHRwNXNONTJ6N2lSelhNWTErNjRD?=
 =?utf-8?B?a3YvRUlIek5OOTJyTjlMT3B0cE94L3JMa04xc0NwWVVESitLbmNJUWY2eVJD?=
 =?utf-8?B?SnNEejBld0tHOENDWlg1M2pWUnBUMkdtVXRvQ3M3Rlc4Rmp0OG0rU0FvTGh6?=
 =?utf-8?B?ZnN1Q2FEQlJ0TldIMldxekFnRFBLdVU5ZHVaMlZnU2lwQWNqRXA3QXY1T1pj?=
 =?utf-8?B?dzNuU2REa1NiaWJwdGFzQnRvWG5IZDBZZ2J6L0VuMlFGejB3UXZBK0d6RkFw?=
 =?utf-8?B?TGg3aFpkUUJXUUlIWjZLdG5qcFRpNzRQSWJlOGVXL1RpaEw5ZDJCUUNvK21Y?=
 =?utf-8?B?clBjd09QLzg4VWRFQlFmODlVcFNkOUQ1UjVqWDdna0JLS0NHNTlhekNtRUhS?=
 =?utf-8?B?dGUwSHNjdVROQnNEUHMrelk1NUNQdm1wZmxiaWR6M1VneGhISnFicmJsWUVB?=
 =?utf-8?Q?/DSrjLahoinmg/YE=3D?=
X-Exchange-RoutingPolicyChecked: 
	JlPmCOW7D3RjVG4ePktTEjzfGivkKp+Xdui3tqyzaIgxNbu9EtLTuqCQMkHacTQmvMswPUmp+lJMlcLutgRpVAOb4RjaBCQufuecSe5nOT067SNtYRNzk3TK1pMh4vFIKRFM+T0ulR6EgZcUEx0IqjumbxtAnDQXT4eQPgJEogSxWYshxO4nY6zyzEXCKNoeEbHRJ2hzJZ9YvWQdt6ubmTSNQ512jLj+Syn6zFKTDWWusnWvQRmLZDPhyGm9tLi5OBBYzWxTqPeSkMd9rGT2729CGW00jtEf6E7FDrJA85YULeABqtmuujXQsCroKuOqAVlE78EMKM7z8euRvJdvpQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16966dc1-5587-45f2-1b6a-08df0ef5f4a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 04:42:44.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLS6VObM9u+/kyCrcHNlkgiVmYUpnI8u8ggOGMr9UYpvn1b1W66TTcjetzSbYIpCjpnYDQlS/ZrRmMnJcQf/LXvX7kW/HnHw9f0lnXm1QFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB556157
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA0OCBTYWx0ZWRfX7+SwMnwuWSdj
 2dubNjv6ATnvxeEYW6zt4NGw2PmXwdidP2NBNK6slAOGjJrFRCzky59rlVyAAQ06iAFApovCpKS
 ax4htWrGbHYxX98XN1tYaBjL3QC+3UwrH1fQk5ANVsza7VVSDgpUKH7KK0XKfWNwrUDF3v9B/TI
 Mk5fBRi+H3NjepKX7jiGXUFk5gJFiAqEXZsllFN/iXzm5BKTE30oGl+0iw6fYCbbxiBFY6Mn6PV
 mDdG1umknAnxxKMODVY+NGNZO4ob3anuo0g/I7J4j4pOjJIHa6oARmriTl2db24hHjkIVii4mv8
 AywsOYoOuzKj3mh6+HipNHxE8SKdAdQ4mmQpoiAP+M6bvjaWxwHEiiVNhQ0guj58VvZxbAmUEnp
 jqSb8/sXj5/9ccHnUIaLWzOqi11jrEYBRGR7Cjh0i3/1/deO5gnrgvZMR4soRDp3oS0r9Fc7sMi
 YJXHU5gkLbO9Qhxr8tQ==
X-Proofpoint-ORIG-GUID: Eh9NK4IcWLq-sw_m5SuIeRy5jQJuVHjV
X-Proofpoint-GUID: 4dfVkOvyMCPoB-Nls60HuhF6ResM5PpF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA0OCBTYWx0ZWRfXzcSdo5GUZZgd
 aBDfOUpSvAG/dJA9mWTsRNGgW+28g++7FxF/mvc43H6BOFDKrjdzEI2tQ2A4Y/xHAqQwXB8V/w2
 JKYfbDXIPZxQGhG6aNGRQbIBYK0TN3jVddfZJ9WEqSPIdGR0qOCl
X-Authority-Analysis: v=2.4 cv=II+XmQvG c=1 sm=1 tr=0 ts=6aa23548 cx=c_pps
 a=z4sgpIVFmn7gf/JJ24wZvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=CCpqsmhAAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=KKAkSRfTAAAA:8 a=qO58wOtuGLZjxOho26QA:9 a=QEXdDO2ut3YA:10
 a=TGWRFvGZnzJx6LKCTUUA:9 a=g-0Z09uUVgBb7zww:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 04:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245522

--------------QcaNqbojmXV9Dwa03c0CaDjl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yoann,

This CVE patch will come with the glibc 2.43 stable branch updates:
https://lists.openembedded.org/g/openembedded-core/message/245453 
<https://lists.openembedded.org/g/openembedded-core/message/245453>

Please drop this patch.

On 09-09-2026 12:59 pm, Yoann Congal via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> Allocate the maximum array sizes directly, instead of resizing
> the arrays as needed.  This eliminates alloca usage from the
> function, and fixes the out-of-bounds accesses.  The asserts
> guard against the bug coming back if the balancing of the tree
> turns out not to work correctly.
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
> CVE: CVE-2026-19542
>
> Reference:
> [1]https://security-tracker.debian.org/tracker/CVE-2026-19542
> [2]https://sourceware.org/bugzilla/show_bug.cgi?id=34506
> [3]https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3
>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> Signed-off-by: Yoann Congal<yoann.congal@smile.fr>
> [YC: fixed CVE: tag in patch]
> ---
>   .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
>   2 files changed, 99 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
> new file mode 100644
> index 00000000000..094a50919dc
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
> @@ -0,0 +1,98 @@
> +From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer<fweimer@redhat.com>
> +Date: Fri, 14 Aug 2026 13:41:16 +0200
> +Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
> +
> +Allocate the maximum array sizes directly, instead of resizing
> +the arrays as needed.  This eliminates alloca usage from the
> +function, and fixes the out-of-bounds accesses.  The asserts
> +guard against the bug coming back if the balancing of the tree
> +turns out not to work correctly.
> +
> +CVE: CVE-2026-19542
> +Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
> +
> +Reviewed-by: Adhemerval Zanella<adhemerval.zanella@linaro.org>
> +Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> +---
> + misc/tsearch.c | 31 +++++++++++--------------------
> + 1 file changed, 11 insertions(+), 20 deletions(-)
> +
> +diff --git a/misc/tsearch.c b/misc/tsearch.c
> +index 9b2eb34b25..e517dfa712 100644
> +--- a/misc/tsearch.c
> ++++ b/misc/tsearch.c
> +@@ -85,6 +85,7 @@
> + #include <assert.h>
> + #include <stdalign.h>
> + #include <stddef.h>
> ++#include <stdint.h>
> + #include <stdlib.h>
> + #include <string.h>
> + #include <search.h>
> +@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +   int cmp;
> +   node *rootp = (node *) vrootp;
> +   node root, unchained;
> +-  /* Stack of nodes so we remember the parents without recursion.  It's
> +-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
> +-     would need to have around 250.000 nodes.  */
> +-  int stacksize = 40;
> ++  /* Stack of nodes so we remember the parents without recursion.  The
> ++     stack size is a conservative approximation of the maximum height
> ++     of a red-black tree, based on size of the address space.
> ++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
> ++  enum { stacksize = 2 * UINTPTR_WIDTH };
> +   int sp = 0;
> +-  node **nodestack = alloca (sizeof (node *) * stacksize);
> ++  node *nodestack[stacksize];
> +
> +   if (rootp == NULL)
> +     return NULL;
> +@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +   root = DEREFNODEPTR(rootp);
> +   while ((cmp = (*compar) (key, root->key)) != 0)
> +     {
> +-      if (sp == stacksize)
> +-      {
> +-        node **newstack;
> +-        stacksize += 20;
> +-        newstack = alloca (sizeof (node *) * stacksize);
> +-        nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
> +-      }
> +-
> ++      assert (sp < stacksize);
> +       nodestack[sp++] = rootp;
> +       p = DEREFNODEPTR(rootp);
> +       if (cmp < 0)
> +@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +       node upn;
> +       for (;;)
> +       {
> +-        if (sp == stacksize)
> +-          {
> +-            node **newstack;
> +-            stacksize += 20;
> +-            newstack = alloca (sizeof (node *) * stacksize);
> +-            nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
> +-          }
> ++        assert (sp < stacksize);
> +         nodestack[sp++] = parentp;
> +         parentp = up;
> +         upn = DEREFNODEPTR(up);
> +@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +                 SETNODEPTR(pp,q);
> +                 /* Make sure pp is right if the case below tries to use
> +                    it.  */
> ++                assert (sp < stacksize);
> +                 nodestack[sp++] = pp = LEFTPTR(q);
> +                 q = RIGHT(p);
> +               }
> +@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
> +                 SETLEFT(p,RIGHT(q));
> +                 SETRIGHT(q,p);
> +                 SETNODEPTR(pp,q);
> ++                assert (sp < stacksize);
> +                 nodestack[sp++] = pp = RIGHTPTR(q);
> +                 q = LEFT(p);
> +               }
> diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
> index 9f3a3814d0a..3ef2301191d 100644
> --- a/meta/recipes-core/glibc/glibc_2.43.bb
> +++ b/meta/recipes-core/glibc/glibc_2.43.bb
> @@ -55,6 +55,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>              file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
>              file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
> +file://0023-CVE-2026-19542.patch \
>   "
>   B = "${WORKDIR}/build-${TARGET_SYS}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245430):https://lists.openembedded.org/g/openembedded-core/message/245430
> Mute This Topic:https://lists.openembedded.org/mt/121158859/10244482
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [Hemanth.KumarMD@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-

-- 
Regards,
Hemanth Kumar M D

--------------QcaNqbojmXV9Dwa03c0CaDjl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span>Hi Yoann,</span></p>
    <p class="isSelectedEnd"><span>This CVE patch will come with the
        glibc 2.43 stable branch updates:</span><br>
      <a href="https://lists.openembedded.org/g/openembedded-core/message/245453" data-rich-text-autolink=""><span>https://lists.openembedded.org/g/openembedded-core/message/245453</span></a></p>
    <p><span>Please drop this patch.</span></p>
    <div class="moz-cite-prefix">On 09-09-2026 12:59 pm, Yoann Congal
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:11fef7c21845e03c044305ba57e289831e7518c9.1788938909.git.yoann.congal@smile.fr">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Allocate the maximum array sizes directly, instead of resizing
the arrays as needed.  This eliminates alloca usage from the
function, and fixes the out-of-bounds accesses.  The asserts
guard against the bug coming back if the balancing of the tree
turns out not to work correctly.

Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3">https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3</a>]
CVE: CVE-2026-19542

Reference:
[1]<a class="moz-txt-link-freetext" href="https://security-tracker.debian.org/tracker/CVE-2026-19542">https://security-tracker.debian.org/tracker/CVE-2026-19542</a>
[2]<a class="moz-txt-link-freetext" href="https://sourceware.org/bugzilla/show_bug.cgi?id=34506">https://sourceware.org/bugzilla/show_bug.cgi?id=34506</a>
[3]<a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3">https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3</a>

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
Signed-off-by: Yoann Congal <a class="moz-txt-link-rfc2396E" href="mailto:yoann.congal@smile.fr">&lt;yoann.congal@smile.fr&gt;</a>
[YC: fixed CVE: tag in patch]
---
 .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
new file mode 100644
index 00000000000..094a50919dc
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
@@ -0,0 +1,98 @@
+From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <a class="moz-txt-link-rfc2396E" href="mailto:fweimer@redhat.com">&lt;fweimer@redhat.com&gt;</a>
+Date: Fri, 14 Aug 2026 13:41:16 +0200
+Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
+
+Allocate the maximum array sizes directly, instead of resizing
+the arrays as needed.  This eliminates alloca usage from the
+function, and fixes the out-of-bounds accesses.  The asserts
+guard against the bug coming back if the balancing of the tree
+turns out not to work correctly.
+
+CVE: CVE-2026-19542
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3">https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3</a>]
+
+Reviewed-by: Adhemerval Zanella <a class="moz-txt-link-rfc2396E" href="mailto:adhemerval.zanella@linaro.org">&lt;adhemerval.zanella@linaro.org&gt;</a>
+Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
+---
+ misc/tsearch.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/misc/tsearch.c b/misc/tsearch.c
+index 9b2eb34b25..e517dfa712 100644
+--- a/misc/tsearch.c
++++ b/misc/tsearch.c
+@@ -85,6 +85,7 @@
+ #include &lt;assert.h&gt;
+ #include &lt;stdalign.h&gt;
+ #include &lt;stddef.h&gt;
++#include &lt;stdint.h&gt;
+ #include &lt;stdlib.h&gt;
+ #include &lt;string.h&gt;
+ #include &lt;search.h&gt;
+@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   int cmp;
+   node *rootp = (node *) vrootp;
+   node root, unchained;
+-  /* Stack of nodes so we remember the parents without recursion.  It's
+-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
+-     would need to have around 250.000 nodes.  */
+-  int stacksize = 40;
++  /* Stack of nodes so we remember the parents without recursion.  The
++     stack size is a conservative approximation of the maximum height
++     of a red-black tree, based on size of the address space.
++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
++  enum { stacksize = 2 * UINTPTR_WIDTH };
+   int sp = 0;
+-  node **nodestack = alloca (sizeof (node *) * stacksize);
++  node *nodestack[stacksize];
+
+   if (rootp == NULL)
+     return NULL;
+@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   root = DEREFNODEPTR(rootp);
+   while ((cmp = (*compar) (key, root-&gt;key)) != 0)
+     {
+-      if (sp == stacksize)
+-      {
+-        node **newstack;
+-        stacksize += 20;
+-        newstack = alloca (sizeof (node *) * stacksize);
+-        nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-      }
+-
++      assert (sp &lt; stacksize);
+       nodestack[sp++] = rootp;
+       p = DEREFNODEPTR(rootp);
+       if (cmp &lt; 0)
+@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+       node upn;
+       for (;;)
+       {
+-        if (sp == stacksize)
+-          {
+-            node **newstack;
+-            stacksize += 20;
+-            newstack = alloca (sizeof (node *) * stacksize);
+-            nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-          }
++        assert (sp &lt; stacksize);
+         nodestack[sp++] = parentp;
+         parentp = up;
+         upn = DEREFNODEPTR(up);
+@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+                 SETNODEPTR(pp,q);
+                 /* Make sure pp is right if the case below tries to use
+                    it.  */
++                assert (sp &lt; stacksize);
+                 nodestack[sp++] = pp = LEFTPTR(q);
+                 q = RIGHT(p);
+               }
+@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+                 SETLEFT(p,RIGHT(q));
+                 SETRIGHT(q,p);
+                 SETNODEPTR(pp,q);
++                assert (sp &lt; stacksize);
+                 nodestack[sp++] = pp = RIGHTPTR(q);
+                 q = LEFT(p);
+               }
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0a..3ef2301191d 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -55,6 +55,7 @@ SRC_URI =  &quot;${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            <a class="moz-txt-link-freetext" href="file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch">file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch">file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch">file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0023-CVE-2026-19542.patch">file://0023-CVE-2026-19542.patch</a> \
 &quot;
 B = &quot;${WORKDIR}/build-${TARGET_SYS}&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#245430): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/245430">https://lists.openembedded.org/g/openembedded-core/message/245430</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/121158859/10244482">https://lists.openembedded.org/mt/121158859/10244482</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Hemanth.KumarMD@windriver.com">Hemanth.KumarMD@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------QcaNqbojmXV9Dwa03c0CaDjl--

