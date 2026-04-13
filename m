Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC69EBFD06
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:01:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265949.1776063692550740905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 00:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XzLkjgTV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8563df3492=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6b3Zn2089644
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 00:01:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=sRebbS8TxcVDLhzgbHXbZcfgmsrjuhnJEDviHufZonY=; b=XzLkjgTVUhBU
	ygS1cZwjA51s7dr17Ab/hKsePognx4bScAMpJbccMZy+RcfNtjD91DN1uC/sYhF+
	CDgpIaLOoMYxhNgZ+sU7UT7xyWdRxPxPku6MFG01aPQl2XLw7KnjYGGDoZEWQVsH
	mjtiorecw76fH+vJvaekz01VLpzKOtuSmcJtPmDScTnhzgkpufd8tI417UT5XD8W
	7/T4fI0sdRPIATVyl9wb+my7szAy7LF1qmLpbJDwO2hrSiofDKkLxD1Je2My2VkC
	GUedqyJx6udtLe2LeWQ9kTuvwPGUyWXjWgX/5WU85sfQu7t4XXQpJ7UpFoEJ52Oy
	I1ywC/OSwg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfntds6ag-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 00:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPkkZiQhCqiQiTfp4Rg7YUxSl6FjtxJVfgZeMRsHB7XROkyBP9y/H1HTfNlseDtwnSTEPBrWloVuPfBKEGtqGHLeNvy2EVk0gggypqu/8EQPinwHKsosTuGbXOWAGRFu/y2j7QJwEDirTyTamRuhCiuJi1DKKC+f8yhc93O5XzAmqUdt0RWxSKo6mWiMje60w53c47E4E5iM2JHiAuwCZkEEi3q+hoyeJXWFgf+Bji1p7GiQU13kuJY4OcbHIe10axl+CFHUy1HVFRc5PmfPQXpqDChaGPWW2j7aBpPZrC83FcUnpLAFqMkEMoIVDsbj1wg2LMkZk4cEDvonsJa/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRebbS8TxcVDLhzgbHXbZcfgmsrjuhnJEDviHufZonY=;
 b=hfQXYkj4pMGfMK4Kmnbuqk77+iO77C7O1oHEr5u4Wc/KZz4lUxEG2hB/HoHH+MDzbImAhVn/e33IoaFcvcGwMVUocH0KEe5rA12oHvaKsHilYrRMmu1jK1bYh7H6lqWpqFhfFhKrQJN5Yh74CMjXDgzKlPXzGew4Xw9M05iuM/FO9of9hwkWjgCSeCJ/MzZsqLW7sfqFWISXMz0RzwqwWYI6EgfpJvE15tiMWJNUh88Dx0clljzMuyOyjfQQvmi0YipEd647UzUkIOHSrE7cy7IHF8E6Bz5JANPUpDAd4/ifr0uB77NDrUgaH7Io9OxbC9Q832CzYhiS96WRZzoyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Mon, 13 Apr
 2026 07:01:28 +0000
Received: from SJ0PR11MB5184.namprd11.prod.outlook.com
 ([fe80::7a3b:1182:1ac6:1afd]) by SJ0PR11MB5184.namprd11.prod.outlook.com
 ([fe80::7a3b:1182:1ac6:1afd%5]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 07:01:28 +0000
Message-ID: <25af5a31-83c3-45b5-8cf9-22a4c8e39613@windriver.com>
Date: Mon, 13 Apr 2026 15:01:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/7] sbom-cve-check-update-db: Fix unpack
 removing other databases
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260407210226.2375631-1-ross.burton@arm.com>
 <20260407210226.2375631-2-ross.burton@arm.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20260407210226.2375631-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::10) To SJ0PR11MB5184.namprd11.prod.outlook.com
 (2603:10b6:a03:2d5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5184:EE_|CY5PR11MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d3f9e5-4161-46b4-2fda-08de992a7c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	NO5c5WR6M2FiruxDp0y7W1Sgw1rWYepUWUPsIwYT0A7DWWkVf1eK6yBqbmQCOwOaiL70l+juVC4QVXDj+3+c6/jMWumSORizH1YfbeBT7+yZWdS1EXuN+Qi2GQQb2+gcmFnSroCjHH+UDo7hgsOOXH1s7bGbWQyznR8wRQ16mOhpJTj9nvDA07YkKwkml05OGfeBRVyrsAZ5KSsKWoItf5l07VUDnYED1sHZl/7h/uDd6zLsAEsCkyXFyewyQ73wkND1mPhZPXhPAd03973zixhs+58mTt0BIPrSXKAqUCmpAjlDk1AvunsWX09htkXuk1qPddwiJengblhw0YFveiR7afXcKL6fl/iscl78ntmakj6lH+vy1meP9BvyPcLpXn7NWwq7sYBUv8w66Py8MKpAxk8NVH1atMDHm47lbisCB1nBk79wFSpKx8FbI95FjZbrmYSfkRsXFcDXJ+CMK117h/wC6tDlADKyU2dSEQJcI84MIET3OY3aIlqLAoCpugv5k5RhSB7lrSe+x9jwDMDnQf+NnAoRVJeXgaGJlPlTasH7i8HcDHpoI0bJZ/CFeKFNgWoWsb37LLkrymHr+8vpPVc56SjBZ3wBudDkVbw8y9BCkS72R7QAtJGTW2npBfn7QjS7KrsbpowV5QuHd5E7YVTP41TEoAEE/UzYv/WTtTo68+RIV2EUSxFXc+0/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5184.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEgwS01jK1RVK3ZsblBtbVhRMVAzYitrK0dCcXl2Mk94SVVIbDg3aS92cmd5?=
 =?utf-8?B?clZwU2U5V0FSWCtlTnJTNUpaQmtQdTJSVGYyM1JVNWsvcjR5dk92MjYvMTNs?=
 =?utf-8?B?anU3N1oxZU9GL3FOeHdRV3NxUHJmM1NXSGRIcmxIRkVlZTk4WjRtdE5zeklG?=
 =?utf-8?B?QU9mZjZ3VEx3WWdGdG92SWlNVGNnam1KdUlxc3dVcE5rajZUdVZLUzU2a1Nm?=
 =?utf-8?B?d1JlNXBheHpBc3kybDlkWittZFZZbTVKL1JJSjVwOWlGamNldEdUQXdvVnFO?=
 =?utf-8?B?bDdtUGh0QlJVaWRmWGpEY01qOWV1cnBHTXE3bmdPQWZNVUd5MnlESmdBWTdk?=
 =?utf-8?B?U2JodlNxT0tPR1R3TmRPUkx1ZCtuem9CVnN0TldBS3lzMGp4VFEvY0hzaXhq?=
 =?utf-8?B?NnJ5QzZlNXJvRjN0SGRQdUxycGhRTklWZVI2MlRlTXphZ253TjlvSnR5N3Zs?=
 =?utf-8?B?c2NYS3RJZFZtTWc3K2NsUm42Wi9ONE9ObG1CMi9CWC95Qk1MUE9LQkw4YVk1?=
 =?utf-8?B?RUhKcHlBK01oVkZrZjVDOGRLcERpY2plZnRsaHVHaWwybVA5SCttK0gzSHE3?=
 =?utf-8?B?dkVPU3phUVpKSVpOZlhnZENrUWN5emxPVS9hMGtvYTMvNXkyVGJuOVY1SmJa?=
 =?utf-8?B?cnhTbWtEZWZoSDJkZ3ZOYUN5ZmhiVHpOTHFRYnM1RWxEZ3VDbW9WcjFNc0pF?=
 =?utf-8?B?OVp1VlZZMXgrS2FpRTg4QU5PdVN6elIyV2hmRjJldytwZ1Rjc1J6ZHZlb0p0?=
 =?utf-8?B?MldvNDJXWXJJRHVPQmFvYktWU0luN3ZqSVlaRjBkSmlqVTQ4cTB1VHJQSXpo?=
 =?utf-8?B?YS9rSDZSRDZFV3pYUGlGamxKekpHc0U5R0lrVUNUcWwzN1RLOENObmVCdlNV?=
 =?utf-8?B?aFZWem1uRlczT2ZidDdnR0lHamkwc25DSjNnTmo4Vy9qaENlMGdhL0ZXZWVp?=
 =?utf-8?B?cldkWFhuWWZ1KytZYlZqSTVqTXBuZU5aaFplYW4zWnRjL0RKSCtyc1R4K29v?=
 =?utf-8?B?ZDBEUEdmWko3eFRGNk56R096T2VvdDkrZjBKaUd1K2ZZNzNhTTR0dE5nbVJ5?=
 =?utf-8?B?THplMldSeURSMmI2NW4wR05uSkFnWW5OellOVWtMT2RrRm1DOHVoMnBEcElB?=
 =?utf-8?B?NW5YU1AvNzA1WFNpTUJWLzVYVXRsdXRmaElHNkxuZ2g0TGxMOWNJbm92Lzhr?=
 =?utf-8?B?bzY4YVNEbjF2TUgyTEEyTEgxem14eUgxUGxMc3NqTXhZaHV0VWNMM21va1B6?=
 =?utf-8?B?enNjek9vanlUeXprSFozQVFVQnVmaW1SOEM0ZlA1NVRlK1RCakdiMUd2OEZl?=
 =?utf-8?B?MytJVWdTTnNxaWJQa1pFQlBhQ01vSCtvSTExaVJmQ29mdHZJV2Y3dklhUzFM?=
 =?utf-8?B?eFNOVEhoS3hzUHIwWkZ2WXFMbGdZSHR5bmhCL3NPMTZmOGJLQTdTemRJVmtK?=
 =?utf-8?B?NmR1NFpCbXFWalFGU3V3WkV0NEgzL29vT3ZoZ2hVcWhTS0k0QUw5cm0vTHh3?=
 =?utf-8?B?ZERGWHZudDhrcVZNMnFCWjVTV2UyV3RvaDRGQ1FGRngycHoyZ25xcmlENVc5?=
 =?utf-8?B?SVJicng5K0QvYTdVREI0dTBINFhRdWI1QVlGa0hKYVQvRTZZaDg4Z2U5RG83?=
 =?utf-8?B?dVg2cHlmR0ZyN1lTampJYTdTdldwMlRINUQ2dTMzSHhtZzBVMlAxTHc2Nk15?=
 =?utf-8?B?RmdRZU9LWGNYRVJwRjdVekR4UWdmVlEyN1haSGJldHBSdW11Q2IxR3FEWVVt?=
 =?utf-8?B?QklzVUU1S2kxRytFYUwyRnltRHlkaVBHV2ZMbkJUc2FQSVpWd2VZQzVWUUZI?=
 =?utf-8?B?d3lQQ2xWT1I5V2E5QzRldTFmaTJsYmtCemNQOEc4MmN4T0ljWTRtdElCdVUy?=
 =?utf-8?B?YjFkOXlOcWNEYVVmRk1VdE84emNNQVV1MmxHSkxuS3RvYWcwSDViWjZ0NDk0?=
 =?utf-8?B?L2h3Qjd6N1B5cFBZMXAyalE1eVZxUk9mdjE3ZFNRR01ISjZIaW1xR0M4bWdI?=
 =?utf-8?B?Um1icmMxUkI3UDhvMktHdmRqSEJhV3h3MjN6ckJXQ1dMM2N2NGQ3ZE9pRWRn?=
 =?utf-8?B?SGErMTlqdXpmbjhZRkVzMUpaZlNSWEhxai9Db01NeFJIeUltYVhhTW9ycVJP?=
 =?utf-8?B?VWpmQk55aHFYMURDZUlDL0NZVnRjdDlFMk1pQlFJeEZFYUx5dkx2RjhxSXhy?=
 =?utf-8?B?RERJTU11TzRmMFdxUEZJemI1aTZrL3dkWmtJWmdMOGJzRHdtcDBYUkdlVHkv?=
 =?utf-8?B?SzZrUitHckp6aGxxbGZLK2VCOFBsVG8rSGFOZWJ5MHJGb21ERjlJb2xCSVZy?=
 =?utf-8?B?bGNpQ01FZXVaL2J0NXBScHJObUx6WEVxLzdmQTNBZXhQTFNmZ0g0Zz09?=
X-Exchange-RoutingPolicyChecked: 
	AhmT2yx1HuMrNueflJm83a2oVRVOGnfBsxpnxH+vV++vIjhPERGF2TsXCJqWzHYFVRD+oc2ZRe5Qc0rZJLF+bTE0GwARUYWwP7GWrM9ChitQ/ZVdLTrca3E4xxYgegHnpHtbyUapPSf180OIOFEunxT4BqNDv2LHgBt5NcDJXcYRV2wU6sgbB9cGBn0fQJqmLkScMeCBWeI5xhZxiTZHKLhvF7uyLLA2g1HOl6fF/VPHNhbbGukjLTm5awzT3MtOkqMHH++PPOJg58S8fY2vf6XFLD5BP9zUmPNJ40sOLFSxzwjjzOpsAx8udh3OHefzXD9Mg8X1WdiuQf3gG/DKxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d3f9e5-4161-46b4-2fda-08de992a7c2c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 07:01:28.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gTk8HJYTxABnlNDBqx5FDM2dsbgsXR7b+mhRD11tkGexiMvOrMOiYgafuhd5DPpB7FQ6i21ybFPfUWHU86KMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 6a62BCmVaHjZNm2VWqk48qyMzVe_KXdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2NiBTYWx0ZWRfXz0lnpRjAT/d3
 gfOMXoiVscjH49fUlfxdFdkOtNKK6vplT7z/+LfPJAp+bdHGkxN91Rpykn6OA4E4Dhwmm73p+0J
 jHe/xDda7/g+0w6BJnP3A4f/AYGHnaK2YIc0GKN+rwlZa1VfStM896DXQgSao2TNxFXq+f7SQuL
 hJGLrfySkeM/kmgyIykeyX1yidP+Hv2SI+G+iKWFFDEa3MpN9Ul6xmj7bqnmIgACNX/avIfqEK+
 fKeWf207H5ksT7UPu0Aptshe3cHcxe89GbiPbaBD6eJvXUCEvvKmIzluh8TzMggtAarf+9vE7Qw
 vvPiT+/latmsPQP0deBwix8TuNZVw1TtxCVvMlqqMnhsqclE4thy+xgJ/B6sEzaLwN0J5J9MK5A
 ODmF67/QeqxAbUJ60Cp10V2uEOIIgs0w0hEtWiwUsCNZdudg8CY3nGf/Ez3XdQuLLsZVUnu7x3V
 85r3keInuRaOpe9uR7w==
X-Authority-Analysis: v=2.4 cv=S6/pBosP c=1 sm=1 tr=0 ts=69dc94cc cx=c_pps
 a=XslAgrSL5Auaid5C2fKBmA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=klBjCJ-M86FRvycJo6sA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: i9fqZUzKtBBTlF4Y9P4Re83-xUhYKN5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:01:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235085

Hi,

Have encountered below error when execute "bitbake -cfetch 
sbom-cve-check-update-cvelist-native",  could you help to take a look?
ERROR: sbom-cve-check-update-cvelist-native-1.0-r0 do_fetch: Bitbake 
Fetcher Error: 
MalformedUrl('git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix')

Thanks,


On 4/8/26 05:02, Ross Burton via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> From: Benjamin Robin <benjamin.robin@bootlin.com>
> 
> Previously, `UNPACKDIR` was set to `${SBOM_CVE_CHECK_DEPLOY_DB_DIR}`,
> which points to the `./databases/` directory and may contain multiple
> databases. Since `do_unpack` cleans the `${UNPACKDIR}` directory,
> `UNPACKDIR` must only contain a single database.
> 
> To address this, set `UNPACKDIR` to
> `${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}` and
> configure `destsuffix` to an empty string. However, it is currently not
> possible to set `BB_GIT_DEFAULT_DESTSUFFIX` to an empty string, so
> `destsuffix` is configured through the SRC_URI instead.
> 
> Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
> Tested-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb    | 2 +-
>   .../sbom-cve-check/sbom-cve-check-update-db.inc               | 3 +--
>   .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb        | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
> index ce204db6c5..3387122165 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> 
>   HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
> -SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https"
> +SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
>   SBOM_CVE_CHECK_DB_NAME = "cvelist"
> 
>   # 2026-03-19_baseline
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
> index a318e2c40e..7ada67363d 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
> @@ -15,6 +15,5 @@ deltask do_install
>   deltask do_populate_sysroot
> 
>   # Directly unpack the fetched CVE database to the deploy directory.
> -UNPACKDIR = "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}"
> +UNPACKDIR = "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
>   S = "${UNPACKDIR}"
> -BB_GIT_DEFAULT_DESTSUFFIX = "${SBOM_CVE_CHECK_DB_NAME}"
> diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
> index 30c7868b2a..c868ba09c1 100644
> --- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
> +++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "Updates the NVD CVE database"
>   LICENSE = "cve-tou"
> -LIC_FILES_CHKSUM = "file://${SBOM_CVE_CHECK_DB_NAME}/LICENSES/cve-tou.md;md5=bc5bbf146f01e20ece63d83c8916d8fb"
> +LIC_FILES_CHKSUM = "file://LICENSES/cve-tou.md;md5=bc5bbf146f01e20ece63d83c8916d8fb"
> 
>   HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
> -SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https"
> +SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
>   SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
> 
>   # v2026.03.19-010002
> --
> 2.43.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234781): https://lists.openembedded.org/g/openembedded-core/message/234781
> Mute This Topic: https://lists.openembedded.org/mt/118715629/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


