Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B4B9104951A
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:38:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16914.1773221900977421005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HF1GNyEo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7530cedf69=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B6kc6c2939305
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:38:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=HyUV6PkOZWgqqlvB2l3h222MDRj4ykp8sq5MmJjCATI=; b=
	HF1GNyEo6/ioj20g+M12M1S0Ae67hLsI+yXN9VVOH/C0NJ+sAdhY/tnkICauIhsH
	HbFGn57q1A92dz+qdkCdfcqKuTtIipz+j2VsPiGaPUa8J2zUD8gfCHzTwBmCuAY7
	JFPpayfwF9lxINd8uY1d7FJTNQ8Q0FOtuiqSz3sDZmwju4ft/6E78K5C/bPgNTrc
	0Rr+uKFffQkxm/URrz8bRCQN+9foCi7xZuMNo6V5HmwnXV7bUgGjgqGZUVOw65MK
	cvGWp0ntKM0nfFjxnQYFTISKqsKBbl8R472YUtGGxnlaQcFPYySxNI3ATMHvsddZ
	U7xuHnaI3BOePZHUP3BKiw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty3j0d7s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 02:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pz5BAO3izy+QQc6VP06khIB0MrkC+xVlVNBlI9nR5QhGMds1bi+OelECK/hmG08HuJLQOQxcPiCFdOB2K5TE7y/0iN1/SWjHD/SHAtlUbRr29xQhp8oRoobVQIWaA2QmUDiWeEE7ZXG0Rvs5w2auuLevV+j0PYjCLJoe+tUwwyqWilZamNFzcXcAuXyW1rd+1mc0tO/vEV9rrJWf9uxNJ+8Y99rCKpd66H1OBT31trmTVLWAQqJrz8uKE0OlNEfFKyoHGOrTxf5hTTuAWFAnegHoY9p58egsgY1FE1rmsyjD3Yk7dbQWqPpQ7Y5tmM2HE+xHGfJLG/KE5bUvF+aR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyUV6PkOZWgqqlvB2l3h222MDRj4ykp8sq5MmJjCATI=;
 b=irOjipFgODDC8urErDhDDzafX396UwWC1fSWq6FQDj5LrF/dXdPr89ayUyuMjTmoGJsBl4JhhwyQwmXhqT9O1d/0CpWwxP5JchyOX6Ttyg2btbigzjXC6cFxKdN5VbqewJLGOEBd4Qi7T1xcBSinXcB/atl002F1oIn9iWVXrAouxhbLKCFkmdSIUH2bb4hhZEEh8JHomln97hOa57HpFuqtsICV8h/q2WFYvOVk98pNIbh8Tm5y1Unj8Z58wzFfO/2OWNbYvqG9F4ttTxf0n+3rIF1h52fcNk2ViAIdw6JRsyu+3+nGyy2rgwppZfNs5A2C/5hdij3yBnqGRWqqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by IA3PR11MB9350.namprd11.prod.outlook.com (2603:10b6:208:574::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 09:38:17 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:38:17 +0000
Message-ID: <62231148-3fb5-4206-a28f-2d255926f077@windriver.com>
Date: Wed, 11 Mar 2026 15:08:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        "Tatrai, Peter" <peter.tatrai.ext@siemens.com>,
        peter.marko@siemens.com
References: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
 <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <c6ab8919113f64c3891f0987246ce4d9a537ac00.camel@linuxfoundation.org>
 <0f19a07e-0499-4520-b0b4-22669fd5a68d@windriver.com>
 <CANNYZj8tiX1SKZDuvGE64JNWvFFjaO9pha1yMhPoTqvfu2xQsA@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj8tiX1SKZDuvGE64JNWvFFjaO9pha1yMhPoTqvfu2xQsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: DS2PEPF0000455F.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50d) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|IA3PR11MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a958c88-8ca7-4046-974f-08de7f51ec7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	YmB5ETEXHAlede3R5w5O3bJmL1Qgfn+rRggTH1SsGyDt162g269Y+rRByvzIBD103gzxXtqQkR94o+wHhKNaODUURkqb4Ttgz8NWuO7JpHLOa0p57Z3n5MPVBJA3guIZeAKo8FP9PsBS0kERb/WWbQhdxFGbsGz6U+NQUbiK4XQ/bkTUa7jD5urGX4DjF7l4MZBapnhtflAV4KfK1zyQhO1aGVpSxf43IAMe9xdWT1KK/zYWyFOSf06KWTB9EJ4u0K2Q1jB7fG2y8HDD/nzuMGHMZdZlvwZSOrZXYhmzvoP0gbnmtqdnwUmAsmmo6RUO9CPHb0TOvEvsnVHyA6z/YMUp8oGaTSMof2CrcdbU+DuxTjhqScMc3hpErNNJBGLwS1tRmnmqihHHUUY2u+/GrWx+EOgdQN+PcumwsPBIptWTYj8DRt+5itFIUfWNH7UrMSrG4w6rJLszawyMgTAGxAuosSf5LDIV9zp2rvRN1DmvJrmHjL2Jq3skx+QkfSquJuz77ydAvEVI6rRhILwK/8larqVVoGnrKSCLbITrYNxur22XqIrkbhyBX12/bLNZIcjyElTt0h9273+os825q3rvnvhEfd1CoTYm/lMGL+m1DsrOWhxNXXXLWq7Iwki0lzk0urbS9AyMlNJjj1tjGd+h3/sjqYGH5Dg82npcixDzhqJvZj/TsT38kMCCqsOmKW3fU7YgoeW0B8C7tRiob2Fb0gij2sYpZCweWj8yk8g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clJiRFFGTDlUM3BmZHdGTWVUcUljbzdSWko3Z0g2a0VVUytwWmRVNHpUMS9r?=
 =?utf-8?B?MWswZnhYMGhmTnFnREdxam1JR1dPMndBRzVROTV6Z3BXSEVBcUpPWWwxMGli?=
 =?utf-8?B?ZG5BTlR3aVc4SjZWUmJGUGc0V1oxdUpNaEoyU1cwR0U0VStFNWgwZ0VvRUY5?=
 =?utf-8?B?UnErdm10Nkk5WHZTeDNnQkQ2Y29CelFTbzVqTDZJMm5VMEwxQjIvekhSRWtZ?=
 =?utf-8?B?U0tBTHdyR3FzZ2RaN0ZVTDRkUGZWdW5BbEVQRXVGY21wWHJnQStiZ2ErOFVO?=
 =?utf-8?B?RUNldVkweHNsYmYvRXFiK2wwbCs2cFlZOXpScmhyaHh1MGQwakd4bVhudmRD?=
 =?utf-8?B?ekVCMEQxR2U3UzEzMzhFR2xQTU1DMDlGNFRTdlRySTQ3WFhWclQ2UUtRMmVL?=
 =?utf-8?B?SWUxcGY0SWFqM3NkZ1hxdlg2TlF5U3NKNmF5Ujd1UzhIY1hwbCtPQWUrK1pH?=
 =?utf-8?B?bVRBQnZ3dXBIV2tZU1ovWGhvTS9qaWlBcW1RcUR0ekllQXJvM1p0M3A3OGhI?=
 =?utf-8?B?SlBEOG82b25LU2sxVEFxbEpBd29OaUpmUXE4cXVkWkZqNjRSTmk5clZlQ1ND?=
 =?utf-8?B?Qlp2cXlsSHNBMnY4bXE5QUhsOWFucmh1dDBqRWRveGpmVkM0OWRCNkFOZnl1?=
 =?utf-8?B?UVNEU0JId0gwRzFBUFpTV0hJMFdONW04emJsdVF6REdXektlbVRzdm1LZHJl?=
 =?utf-8?B?NlFxdVR3aXdPcFZUdXBLN2JKNnQ1LzJwU0MvYkEvNEJPcHEzLzc5MVRPNDZ5?=
 =?utf-8?B?aU5IYTRSVGdPZ2l2Z2VldkFtclRvei9KZjNPRlFqYmpqTEE5ckNOdXFTZE1F?=
 =?utf-8?B?em81bkErZXhYeldud2l3MlpWOEZ3Z2M0QjgzVWlYN1hYU0pBVE5DTEpIeTlh?=
 =?utf-8?B?NDQ3ZGlKamNZZlVYaEFJOWFqVUtmMjd1bUtRVVBJQUZRY28rUTZJYlZlc0E4?=
 =?utf-8?B?eFRkRGNzdVdacnZlbThBM2xWekRoVG5nUzlNcjhXS1NnYU4ybXFqTGlIMjF1?=
 =?utf-8?B?azl0UXpOcFhpTkNmdXJrb3FQRjBOTHMwYVB5MUVQL0NXL0NTY3ZJVGowT0hO?=
 =?utf-8?B?NXNGMW5POHVFRVlIVWU2YkQ3ZVYvVWdpR0Z0RjZYQnAzM3Rybjd0OUdKaExU?=
 =?utf-8?B?bmhnN2ZNK2pyek1aQi83VHdpK3BwcWIyZElpcEltbWROdU03SThqdmtjOC80?=
 =?utf-8?B?UUxDMmczMEs3RVBpQVhsZ0JwV3NieWNXNWg3YjNNWVZOenViKzltRXpPWkZm?=
 =?utf-8?B?VVpnTERuaUVmMXh5d0ZTTWJHVzBKR3dzN2tKODZHMTV5dU1LbFFDN0tnWmpx?=
 =?utf-8?B?QS9TZG83SWFtOFk4SXhSZFJsQjIvUkVwcnJSeDYvUTdIOVhTa1FDRlVlNU00?=
 =?utf-8?B?L3psOXk5MG8zeXZsamlxczAyWXRWT01iWGhLdE5nQWZ3UjFqb0FhbEhIK0Ix?=
 =?utf-8?B?bGprUThacUZkUEsyYXJ4YVZPdnhyYW1rL2prNUlIY0FOYW1NemxNOXJLTUxm?=
 =?utf-8?B?THNVcjE4MXpFbVFPUG95L3Y5NE9ydDMvdnhPV1daOVhOYUsxZjg0cU5mdFlx?=
 =?utf-8?B?WTFnb3RGMlR6RFlNNlE3VEh6QnJKNlliZkE0SUpvVlF4ZGZYRTVMbmZnQnpO?=
 =?utf-8?B?RndoblMrdE5lVjJrSnVWUmtENkdFbWJVTCt4L1cyRTNRZkZtTkNhd3hrZlpx?=
 =?utf-8?B?MEtSTlJzWGJEckdzRTFENUY1bW84elJGaXh6ZTMvdUZ5MUROSXhpSXo2Vlky?=
 =?utf-8?B?UnRJeldSRXkzZGhQMjJyWGV6NmZpNTJqeGFNdy9maFlwZktKREs4bm5Ua0t1?=
 =?utf-8?B?RVJjdmJISTl6bDBja2pvQ2pMaVA2Umlwck8zbWpWQ0xmK0QwVVhIZm5kanAv?=
 =?utf-8?B?Vy9KNDRMMGhwZzY5Q3Q3V3ZUTDM1aCtuTWp1ZWFreDVIclBqTHpEdUViay8y?=
 =?utf-8?B?T1diR2JCSUZlanR6R1ZtWUhDd0E2S25scGZnTzFTSGtWcXpJK0RXdEl4bWpy?=
 =?utf-8?B?dDMwejNJQ0N6a0lLQWZqenBTSmwvY2V5azE3c0phR3d3MFY2bXYwZm43NGJC?=
 =?utf-8?B?Vnl5Z280b3lLUnFlWWhKVWVVajk0TmZISXFsUzdBMzdNT2UrWlBmRE9qcXhY?=
 =?utf-8?B?YW9NZ0phVXBqSnc0eXRpZlgvLzVmOTk4aXMzWGRGazFMS2lLVHVIS1ZFcS9L?=
 =?utf-8?B?TnBDbmFCUmNMT1o0a3BzSi82REt5QjlKRmJSallGYkJsZjZLb1o4ZFlReVJt?=
 =?utf-8?B?TmlLY1k4d1J1WTNRbWpEWUcrSDA4Q00vNCtnSVA3T0FpQUhzaHlHS1g0MGRm?=
 =?utf-8?B?MURWSjU0YTZXSjFHakVobVlsT2R4Z0ZRM2VmMFlzbDhCcHIwMjV2em80N01i?=
 =?utf-8?Q?yzIamUuR+7r6RQ2jHEP2tlxfBVL4KqfijKb3A?=
X-Exchange-RoutingPolicyChecked: 
	O6J0fLaTHFoYC065ktCzaIQ4j4Jx7q3MPfmoepUoqSgY43hKUG6E7CbW3OsPl2reDdvIiwr5GJ3e56deCVzFq7ARiAw9XGANe/wc93itAM0OHkWVBi6hkEBahkuJwe/hgxTDVimZAYl4N3pqmqha2JElqpyAlJTsw/pNNzfhEl1qlxbre8PoiIuwuCn+Eif/O9dmnEAKrPQZ3osI8EDJGX55w/6m61oO4gXVM6eW1v2bXZciB+6tqjl+zI8HatgxlkGhN2Lk6T95grTtp8i/4X7fQFxov5yeNIdUgkhD4tOJjzKror0EjrRGglvkth2BzZEEmcnky6l8K+fYR0AAFQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a958c88-8ca7-4046-974f-08de7f51ec7f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 09:38:17.1686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etQKHh5tt5AMDGQUG/GUDebAKTlPTatXrnk4fpCOq6loKzAA0piXhBZbZFxLYWQaLALzh2IObyVdQFyX96xeIQW+10LLVTi5gKZG+o6cqcuiKmd7JYsOKah91m+vWusw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9350
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 38seuTnJOWvYKaYR_AsJyKPl2xxzz_vL
X-Proofpoint-ORIG-GUID: fQq-QWha_L65cN1iUp_eWn-RYXXnICfl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4MCBTYWx0ZWRfX+5/CYMmRFmpu
 7vmFaFeUsCMpT7T1g1c/Lcb7UvV+HOmrAR8REQyRRa+bAPCvqJuHHhUNm/BF1AzaV/CXDXoDB7i
 wODS3qheBFv3KwEwY4I4Fvqi3UcxnjWYF9LafnsOhF7IOseyAxHV/uTe7Tbm2P5fEwfJXMZ8Aar
 0kIkvx8CWXb1HFeuBKhD3Q3Zu/yjC9Wp/xg4mZ7Qu6ucyWEOj9Q4827tHDFhxsfpxx5C0unx/Lh
 fRBfjMnctH2JFnYyextHC3+aAG4aLz4Hi/dl6vsB3meKG7t7djQp4AuYoXD86MXIAvZcbd0G3fB
 nQhTvjGtVA5YSfQLfmnzSHr0Tt15I3fxUhzuYHPOT5mI6nckDKX5sSCpSJrcIng6ZDu4q4VrJSO
 zL8qOv/OxabRhTJmJA3aA8p55kOLCcA7bxqaC/w6Y14ckWjH1Lr0aiJioV3FdRoBY0h8HDCGZr6
 HhmtUCVWW62Zgm1u1+Q==
X-Authority-Analysis: v=2.4 cv=Qr1THFyd c=1 sm=1 tr=0 ts=69b1380c cx=c_pps
 a=hWS9KTtKglmM4LJ/Q12dcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=LgMrPasnOOwdpJ7eiEEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110080
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62B6kc6c2939305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232853


On 11-03-2026 14:44, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, 11 Mar 2026 at 09:42, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>> There is a bugzilla ticket number in there:
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15625
>>>
>>> and that shows that it did happen on the yocto project autobuilder wh=
en
>>> testing 32 bit PPC. The autobuilder would have been under load and th=
is
>>> happened in 2024 with this fix around a year ago.
>>>
>>> I think Deepesh is right, we should see if upstream would be willing =
to
>>> increase the timeout. Carrying patches like this with no hope of ever
>>> removing them is something we have a natural pressure to try and avoi=
d
>>> it at all possible.
>> Hi Richard,
>>
>> How we should proceed further on this? After our discussion, it stayed
>> in master-next
>> for a few weeks but has now been removed. Would it be okay if I resend
>> the patch
>> after rebasing it to the latest sources?
>>
>> If the mentioned failure shows up again, I can open an upstream ticket=
 and
>> follow up with the community. Please let me know what you suggest.
> Yes, please rebase/resend. I would suggest also to open the upstream
> ticket up front, although upstream might ask for hard evidence that
> the problem is real, and we don't have any recent/actual evidence.
>
> Alex
Hi Alex,

Thanks for the suggestion.

I will rebase the patch onto the latest sources and resend it. Regarding=20
the upstream ticket,
since we don't currently have a recent occurrence of the issue with the=20
latest Rust versions,
it may be difficult to open a meaningful report without concrete=20
evidence or a reproducible
case. Upstream would likely ask for logs or a reproducible setup.

If the issue appears again with the latest Rust, I=E2=80=99ll make sure t=
o=20
collect the necessary
details and open an upstream ticket promptly.

Please let me know if this is fine.

Regards,
Deepesh

