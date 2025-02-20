Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F239C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 08:56:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.45329.1740041805387982689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 00:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41466d0882=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6A6AM003600
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:56:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00ja4uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:56:44 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51K8uhN8018849;
	Thu, 20 Feb 2025 08:56:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00ja4uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 08:56:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzXF/OEeQhEm7jbcMcwTcf7N9G5vUU+vP86hBuWNEfMzXBuJRJMA56A7OiV/+lvPSanV1B7NvXdiJndHMGmr4LXbNFPUqfxeEU63ZxZi1QOgt72hEnkM3ojJAeoqVia8fI33FOQPnRpc1Lc23E3styIIrt8ghIkpfaV3MRLa9Mh+MfRe5zY+GyR2k9Gb1EX9lb5rr0gr5+r5E3xQseZyYoLtwZ09TNMMtbQzHmPmUbz3q//2aT1lhcVPDrpJtH45z96wzyHThnfIR15OAASiQAOxCTtGheBhHns9jWK3w7Itwv4S2QLrf2FwRh0yK3FcJ87pBA/c5/LL1muExBcGJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RgRMZEjtyL1z81PO340lCFwVxkBoxnxFqtItvtT3SVA=;
 b=b9GNnZe/XGKEPSofegNlR50++hXFKh6LTchWefcO0z0Cw/Wyec0qT3wqrVPZQ/unCdiiSuajCjinvd7rFZAnvQGzHc6Kgnz1EdN9TxtZJJR+X/L3oeEQCI40Z6vSUyQHw/aTkcN0IuuashQ75p+wsEoQcV7hVAZxiC2EA3EZdo6PYIldhWr/UKlDXpUCKWc/sWWyWqpLtgWktBrGoaMf0gVe5l+kXNe764zgd/b0vipCYmmqnp76Nn7gzaTz6CnvhuruzzUo2aJpqbFqU9k7mU80UyiOSzZ+J+8lTctAZp9CQh+E+GH4bpFtjow+OKibnUPwc1r0kgaVmheHu7CzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 08:56:40 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 08:56:40 +0000
Content-Type: multipart/alternative;
 boundary="------------0SFT7lPM35fr6IqpAUZXKMWv"
Message-ID: <a9da630f-524d-49d7-91d6-777324545f87@windriver.com>
Date: Thu, 20 Feb 2025 16:56:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
To: Ross Burton <Ross.Burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1811EBCBC381E647.26783@lists.openembedded.org>
 <0146cc17-13cf-4322-ae18-425b822085ae@windriver.com>
 <D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com>
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc97054-fad3-45ea-6c49-08dd518c7d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?djVtajNRam1CdGpqYTdMREpHaTdGV2QxbFNiT0s5b2JPTUVKTDAyNFFQWWow?=
 =?utf-8?B?Y05Za2FQcVN1dFNZb2pLaFNTR0JwL2RBYXpnOHY3UHVFWFp3d0RLSjVEbjlD?=
 =?utf-8?B?dU9hVzA0S0ViOC81Mlc2eWEzVDd4NDBzWjFUdjVmTFdrMEZ4VTJpTm8yb2xk?=
 =?utf-8?B?am05UlFENFlwOWVKSU1keXFOT1FLMTRkdDlQVTZrQ2VOR2xyZGN5ZE8ybTQv?=
 =?utf-8?B?aUNDRDA1MnQvWWpWZ3RiZWNPa1hrZTJHSE45MW95VVpCZ2FkQnF6aTIwOE93?=
 =?utf-8?B?K2k1cHNpb1JNOW5jQmYwelorZURUR1BJTFdjUEVFS0ZLVDFiVTNkZGVtVkFS?=
 =?utf-8?B?QmJCTXEyclEwdVNOYWkyOXgxNnRzQmJrRGxac1pXLzZUTmlaZzBxWUFJaTNj?=
 =?utf-8?B?UzVCS1RmS0JBcjVtM0t4ckF2djZadHNEYWpRdG1La0w1K2N3MWRHUHZEUThx?=
 =?utf-8?B?UlU1M1BlZ1VmdVZ6eXlPTlQxcjNmYzJKUStRV2p3d2EveHFOdGdGWExDaXNF?=
 =?utf-8?B?dUhFamJrd0tmdGg2YjNsUUFnbkY1NjZJeGVtczBXV28xMkpYT0FqOWx1aDdX?=
 =?utf-8?B?aENVUFQ1SytqakZ1UEtjL1Y0WTRFZEpsakhFUnBOS0xsMngyRHhOVExyN2l2?=
 =?utf-8?B?U3FoK0YrZy93dHU3M3hDNFR5QWtEb0hLcXhGbVd0QW9HTlVmaGNVVndjNVkv?=
 =?utf-8?B?TXp0c0pwZnZkNUhZY3BFcmIrV2Vja0ZFYXErV0pMRFNid0R4Ym9GZ1RsVDNS?=
 =?utf-8?B?RkV3R1RpRVpTc1hXUHhKRGt6cmxBdFFCRWV6WFhQMXBtWVYrM3BYV2NsWmZr?=
 =?utf-8?B?M0VnL3dVbEZpSzEzY0RyOW5yaW5LS2kyUTBkQmRVL0dwTmMwbGt3YnVibmZm?=
 =?utf-8?B?RER0WHZPNXo1TE85cXJHY2Npcmw2T252eVR0YnNJb1pWNW9SRlpWWjRkQzJr?=
 =?utf-8?B?Qm5QWVA1OGJ3V3RlU1YxZDQydkxGaXZ0MjVtcjFHZWZxUTM0a3pLMkZhalp5?=
 =?utf-8?B?MHVWaTZjQlpRZU93TE5weERDb09zakFKd0U3Q1RycUpnR0lwNVZOU3ZwYTVV?=
 =?utf-8?B?SVpyczg4SkVKVU84SmtROVlPa3hqWktFWWtlaUpKdkNiem5oNEFvQ2t5NTNh?=
 =?utf-8?B?NFBmRU1xTmdPdy9saWEvZ2VHdzM5V2hkR3hUaUFNcmo4R25YQzV6b2N3cTl2?=
 =?utf-8?B?UVlYUHI1SnY0ZVdCc2w3OUczTVRLWCszeWhYVC83Vmg5bDh4UkNBL3pQSG51?=
 =?utf-8?B?TGxTdmRROUl1RnN4K21oL1g4RndadURQZTJ0QmN3VGl3WGk0M3dCOEdRUUFo?=
 =?utf-8?B?WEZHMVNxMVpXQkRUSlJxaFA1T3AvcXN2dFVXQ0RTNVM1QlBnY042OE96V0li?=
 =?utf-8?B?NG5ZODQvREF6K0hXTDBIRDZvYXhYQVQzTldzQkFTSUMwUXhRNC8xV1ZHMjlC?=
 =?utf-8?B?L0dFMWRsd0NjU3Y2U3JtVHFMV3doRnZkeGZoNHZOM1pSOS9pM1FWbytLN2JP?=
 =?utf-8?B?cXA4VVdUT1dxc3dsU2h4MlhZR0ptOWVVUzR5NG1UelkyYmdlbnAzVWF5YVc0?=
 =?utf-8?B?elE3Zzd0ZXZIaDF6Q3VsUlk3VXhxOUsxMnZVQzg5RnNMZGl2SFhYS1hkbzNj?=
 =?utf-8?B?ak91STVYcXZ2anQ4R2sybUxMSFRrUldUYUFBWWloWGk4ZHVsSUlXTlJDUkFI?=
 =?utf-8?B?RGYzV1RWWkVRUUtBQUNoSER0OElzRVgvak0xSFc3K1h6UUhKaUJINHo5bWhF?=
 =?utf-8?B?Ky9Ga1drUkd0K0RFdVBXT0xhNERPbW1LZldXR1N1NkdmNE5zcGhtbzk4eEZ2?=
 =?utf-8?B?NVlLZ0dJL1pHS1Y4UVI3UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cE5MeWlpUnlITnA0Yk5ZaUZHTEhuOGVJOC81dzErbE1IZ01wZUVMejgvalcw?=
 =?utf-8?B?T1pJS2Q1elNIa0pta1RMeW5Tc1ltZHJXTWZ0ekc5ZlMvYVdXREhqelArY3hU?=
 =?utf-8?B?c3N4MjB4bEtjdWM4UktINDdFVEU4cTZMTnVVNHY1UWFDOXFtS3hxeVBNU2s5?=
 =?utf-8?B?L0daQnpxRWpOTWZ6UmMremxRZ202VDNNSTZObkd6eHBaelY2TFh6SGtrUzhV?=
 =?utf-8?B?RUlRVTJMNkxYVUdhYU9mRm14MmJBbXlmYzBUZUk3TlYwanBBS3pjM3hVR25G?=
 =?utf-8?B?NEpqSnJjNHVsT1hYVEF5Y3l1YW5NY3BLRHNZeVpZSCs1SU5JcDVaRjlZbmlB?=
 =?utf-8?B?Ny9LY1ltc29mbm1leG82M1AyZnYyTHZ6end4cjd0Z2swZE5RaHpQWUdsMlpi?=
 =?utf-8?B?ZWk2eW1EbWhjanpCL011ekNiYUtqRm0wbzlTQ1JFcjcwRHNVTlYwZ0gwR2Zh?=
 =?utf-8?B?OEVlUGg2VHJRWFpQakhmaWM5c2xaek1VREdheHpzblgwcnlCbFRUdUdJUW9P?=
 =?utf-8?B?UTR3am1pdW5qTHFIUSttcHZxNGxzb3F6R0hpVDY2ZnJCTUpuYXNtWjRZRm10?=
 =?utf-8?B?UVlhKzcwYm5Wa2JiV1ZhMWtvbVhMa3BoY3FEYytEWXVUdWEvMlcvQzhwb0dv?=
 =?utf-8?B?N0UweG10ZE53c2NodkJ2UFBVSjBueWpHVjFKVXo2VzBmNnlMRlU2czRrcWtK?=
 =?utf-8?B?RGI5V2xMNGpTV29yOVlJQVRyRm9nSXVxc251YkZadmZ2VmJlRkNjNThlWlFm?=
 =?utf-8?B?d1V1Qnd5bTBkZFlPR2d1WThvcmNPUzlCcEZJa3RMUTlGSHhlMmU5OUEzZGEr?=
 =?utf-8?B?akN1b1h0NW43c3d1RU83QWJ4R3Jqem5DOVZhajgzbnRYY2s1LzhPcHlkSitr?=
 =?utf-8?B?bWVVMWkrOVZ6M01mVzByQk9NN3BKbjJFZ2t4eEd2WVlrODhHNjVsR0ppQndN?=
 =?utf-8?B?dGVHalFFYVZQZzNJcGdJSmc2UjRldDBOOFhJYWI1QlB3WGc0em8xc09pNWJp?=
 =?utf-8?B?djJIcVhDUzhKKzFuV3JGVk4zNm1OV1pkcEdqWHE5NCtjMm1rQ3Fuc2NUK0RE?=
 =?utf-8?B?MXNUQWtFRmFBc1ZyVEUwckxwRE1mUUxNWUpybElzWERWSWVJV2JORWlPYUNi?=
 =?utf-8?B?bXIzS3cyQ3UzYVRNZjhtSWx6dzd2dm9vSURjZURILzhCQk5GaVVkMXZQNGgw?=
 =?utf-8?B?bUhDRmVCK0lwdWtndU5EUXI0dEJ4ZmU4Sy92bmtkV3RMQ0JWYXdaaFhCeFVp?=
 =?utf-8?B?cmRIU09jeXQvTWZEck55TDRObllJZWE0MkZoMTVtbkUvOXVVRmZSTnlvOGxy?=
 =?utf-8?B?eUlkUjhCUGRhZTIwYzlwaWJMMnNsSFFDTzN3VUxWcGplU2NINW55Zk5BU2dK?=
 =?utf-8?B?L2greEtEc1MzT1ZPUytxdy8yNmhLb3B2TTQxVEhjWVRZOGVkekNEMDFuazdt?=
 =?utf-8?B?c3hnMkxmd0xSTm5tR3c4K05VUHczQzdJTWdlLytNZ0tjZHhDNk1NRnh0dFJh?=
 =?utf-8?B?dldSMWYyTkFxbm16WURjVUNXVGZuMlZySUh5REh2ZVhta2NRdUdCMENubEhy?=
 =?utf-8?B?RVM4TUNCbzhBd3NDcHhoL1NOR0pRUlFjR0FoVUNjSG42eU1CenNFSG9yNlJO?=
 =?utf-8?B?TmM1K0JlZnF6REkwL0ZDTUJzWWJVUTdielg5VCszekdrOGRVWGVlaG9qVVEv?=
 =?utf-8?B?K3FBYWNjQlFwVWtBbFlWdFcyUlNPVVpaVWVxM3k5SHZVSzVhK3AvSC9RVnJy?=
 =?utf-8?B?cWxqSXZIMitnUzdaUkFlUkR5UjdMYnpiSWJ2OFB6SzFjQi9BLzRaT0E1ZzRQ?=
 =?utf-8?B?SE5VcFdpNVlyVzFnMUYrci8xZjdvWThGSTl4YWhpMW85MnRKSVdrWkx4bEhI?=
 =?utf-8?B?ejJUQ2tRcEh1V1FaL1NINnArNG1XWEJCeis2MzRLVG1xM2NRRTI1eDRhQlZI?=
 =?utf-8?B?ckFwaWt0YndCN2s2Y0NTcEZtZzNVQ0RqRE84OFppWHhwb0cxdUFsWjN0Ykw1?=
 =?utf-8?B?VnlCb2tPLzZETjJIL0pDQWUyVWZ0RnhVMmViWWhsWWxadXliMHk1Z05RYS9l?=
 =?utf-8?B?cjFUdWE4Q3hIdHQyVGprd05PdC9iMFQ5dkpBa2psenBjazBtc0UyVjhIZkZG?=
 =?utf-8?B?bC83b0FTUkd5bTBzVzZ5YTQwNEM3MnNDUjFEbHc1UUtwenhDL3VjTXIzK1p0?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc97054-fad3-45ea-6c49-08dd518c7d7c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 08:56:40.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcNHcg74jCqCT0LVdFzQ/vFb6B6Su2nz7dP7vO94Dgwr3I2zujvg+kZ6Rx1qGu9V0M6WwC8sWBqoaVVrwwEQe2tg+m+vn/eAZTpveboNfeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
X-Proofpoint-GUID: nG9PSI-WNHglHww_r2C0ArmLBXJ8b7fe
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b6ee4c cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=j2fNYuM9ddOkmHkhe6sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=52mdeZd8sWgJSgSe30wA:9 a=ISWImC9HsEnd-0AL:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: qss9EzvMvLUC42T_6QylxaIL98eA3q8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 08:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211745

--------------0SFT7lPM35fr6IqpAUZXKMWv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51K6A6AM003600


On 1/8/25 23:16, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I have a series in testing that removes acpaths entirely which solves t=
his problem at the source instead of having to be worked around in every =
recipe.
>
> Ross

Hi, Ross, Richard

I tested with latest code, the problem is not resolved. I think we still=20
need the following patch.

diff --git a/meta/classes-recipe/autotools.bbclass=20
b/meta/classes-recipe/autotools.bbclass
index e33eae7d48..ac86da361e 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -169,10 +169,6 @@ autotools_do_configure() {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ACLOCAL=3D"aclocal=20
--aclocal-path=3D${STAGING_DATADIR}/aclocal/"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if [ x"${acpaths}" =3D xdefault ]; then
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpath=
s=3D
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in `fi=
nd ${AUTOTOOLS_SCRIPT_PATH}=20
-ignore_readdir_race -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 grep -v 'acinclude.m4' | sed -e=20
's,\(.*/\).*$,\1,'|sort -u`; do
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpaths=3D"$acpaths -I $i"
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 else
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpath=
s=3D"${acpaths}"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fi

Since this will influence many recipes,=C2=A0 I want to ask your opinion=20
first, if you agree, then I will send out the patch after all test is=20
passed.

Here is the final aclocal command for libunistring-native:

aclocal=20
--aclocal-path=3D/build/tmp/work/x86_64-linux/libunistring-native/1.3/rec=
ipe-sysroot-native/usr/share/aclocal/*-I=20
/build/tmp/work/x86_64-linux/libunistring-native/1.3/libunistring-1.3/gnu=
lib-m4/=20
-I=20
/build/tmp/work/x86_64-linux/libunistring-native/1.3/libunistring-1.3/m4/=
=20
*--force -I m4 -I gnulib-m4

The bold part is passed by the removed code, actually it is not needed=20
because ACLOCAL_AMFLAGS =3D -I m4 -I gnulib-m4 is set in Makefile.am.

with the bold part,=C2=A0 aclocal will run autom4te *.m4,=C2=A0=C2=A0 "Ar=
gument list=20
too long" error will reported when the * is the long absolute path.


For=C2=A0 autotools.bbclass,=C2=A0 how about don't pass -I $i to acpaths,=
 suppose=20
that upstream configure.ac or Makefile.am have set the correct=20
AC_CONFIG_MACRO_DIRS, ACLOCAL_AUTOMAKE_DIR, or ACLOCAL_AMFLAGS.=C2=A0 if =
the=20
recipe is not correctly set,=C2=A0 the recipe is responsible for set corr=
ect=20
acpaths themselves, or better to=C2=A0 send patch to upstream, set correc=
t=20
macro dirs in configure.ac.

Eg:

for freetype,=C2=A0 according to=20
https://github.com/freetype/freetype/blob/master/autogen.sh#L165, we can=20
set acpaths=3D -I .


I tried to do a world build with poky,=C2=A0 only 3 recipes failed at=20
do_configure,=C2=A0 I plan to test with all layer under meta-openembeded =
later.


Do you have any concern or suggestion about this?


Regards

Changqing





>
>> On 8 Jan 2025, at 08:40, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>
>> ping
>> On 12/17/24 17:09, Changqing Li via lists.openembedded.org wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> man-db uses a lot of m4 files, with acpaths set to absolute path,
>>> and the TMPDIR is long/deep, for example when len(TMPDIR) =3D 350,
>>> do_configure failed with "Argument list too long" error.
>>>
>>> [snip]
>>> aclocal: error: cannot open xxx Argument list too long
>>> autoreconf: aclocal failed with exit status: 1
>>> ERROR: autoreconf execution failed.
>>> [snip]
>>>
>>> Let aclocal use the relative path for the m4 file rather than the
>>> absolute would fix the problem.
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>> meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/rec=
ipes-extended/man-db/man-db_2.13.0.bb
>>> index 2fa18a8f24..553b2d59d2 100644
>>> --- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
>>> +++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
>>> @@ -22,7 +22,7 @@ USE_NLS:libc-musl =3D "no"
>>> inherit gettext pkgconfig autotools systemd
>>>
>>> EXTRA_OECONF =3D "--with-pager=3Dless --with-systemdsystemunitdir=3D$=
{systemd_system_unitdir}"
>>> -EXTRA_AUTORECONF +=3D "-I ${S}/gl/m4"
>>> +acpaths =3D "-I ./m4 -I ./gl/m4"
>>>
>>> PACKAGECONFIG[bzip2] =3D "--with-bzip2=3Dbzip2,ac_cv_prog_have_bzip2=3D=
'',bzip2"
>>> PACKAGECONFIG[gzip] =3D "--with-gzip=3Dgzip,ac_cv_prog_have_gzip=3D''=
,gzip"
>>>
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#209522):https://lists.openembedded.org/g/openembed=
ded-core/message/209522
>> Mute This Topic:https://lists.openembedded.org/mt/110160165/6875888
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------0SFT7lPM35fr6IqpAUZXKMWv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/8/25 23:16, Ross Burton wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

I have a series in testing that removes acpaths entirely which solves this problem at the source instead of having to be worked around in every recipe.

Ross</pre>
    </blockquote>
    <p>Hi, Ross, Richard<br>
    </p>
    <p>I tested with latest code, the problem is not resolved. I think
      we still need the following patch. <br>
    </p>
    <p>diff --git a/meta/classes-recipe/autotools.bbclass
      b/meta/classes-recipe/autotools.bbclass<br>
      index e33eae7d48..ac86da361e 100644<br>
      --- a/meta/classes-recipe/autotools.bbclass<br>
      +++ b/meta/classes-recipe/autotools.bbclass<br>
      @@ -169,10 +169,6 @@ autotools_do_configure() {<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACLOCAL=&quot;aclocal
      --aclocal-path=${STAGING_DATADIR}/aclocal/&quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ x&quot;${acpaths}&quot; = xdefault ]; then<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpaths=<br>
      -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for i in `find ${AUTOTOOLS_SCRIPT_PATH}
      -ignore_readdir_race -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'|
      \<br>
      -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; grep -v 'acinclude.m4' | sed -e
      's,\(.*/\).*$,\1,'|sort -u`; do<br>
      -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpaths=&quot;$acpaths -I $i&quot;<br>
      -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; acpaths=&quot;${acpaths}&quot;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
      <br>
    </p>
    <p>Since this will influence many recipes,&nbsp; I want to ask your
      opinion first, if you agree, then I will send out the patch after
      all test is passed.</p>
    <p>Here is the final aclocal command for libunistring-native:<br>
    </p>
    <p>aclocal
--aclocal-path=/build/tmp/work/x86_64-linux/libunistring-native/1.3/recipe-sysroot-native/usr/share/aclocal/<b>
        -I
/build/tmp/work/x86_64-linux/libunistring-native/1.3/libunistring-1.3/gnulib-m4/
        -I
/build/tmp/work/x86_64-linux/libunistring-native/1.3/libunistring-1.3/m4/
      </b>--force -I m4 -I gnulib-m4</p>
    <p>The bold part is passed by the removed code, actually it is not
      needed because ACLOCAL_AMFLAGS = -I m4 -I gnulib-m4 is set in
      Makefile.am.</p>
    <p>with the bold part,&nbsp; aclocal will run autom4te *.m4,&nbsp;&nbsp; &quot;Argument
      list too long&quot; error will reported when the * is the long absolute
      path.<br>
    </p>
    <p><br>
    </p>
    <p>For&nbsp; autotools.bbclass,&nbsp; how about don't pass -I $i to acpaths,&nbsp;
      suppose that upstream configure.ac or Makefile.am have set the
      correct AC_CONFIG_MACRO_DIRS,
      ACLOCAL_AUTOMAKE_DIR, or ACLOCAL_AMFLAGS.&nbsp; if the recipe is not
      correctly set,&nbsp; the recipe is responsible for set correct acpaths
      themselves, or better to&nbsp; send patch to upstream, set correct
      macro dirs in configure.ac.</p>
    <p>Eg:<br>
    </p>
    <p>for freetype,&nbsp; according to
      <a class="moz-txt-link-freetext" href="https://github.com/freetype/freetype/blob/master/autogen.sh#L165">https://github.com/freetype/freetype/blob/master/autogen.sh#L165</a>,&nbsp;
      we can set acpaths= -I .</p>
    <p><br>
    </p>
    <p>I tried to do a world build with poky,&nbsp; only 3 recipes failed at
      do_configure,&nbsp; I plan to test with all layer under
      meta-openembeded later.<br>
    </p>
    <p><br>
    </p>
    <p>Do you have any concern or suggestion about this?<br>
    </p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing <br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8 Jan 2025, at 08:40, Changqing Li via lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li=windriver.com@lists.openembedded.org">&lt;changqing.li=windriver.com@lists.openembedded.org&gt;</a> wrote:

ping
On 12/17/24 17:09, Changqing Li via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

man-db uses a lot of m4 files, with acpaths set to absolute path,
and the TMPDIR is long/deep, for example when len(TMPDIR) = 350,
do_configure failed with &quot;Argument list too long&quot; error.

[snip]
aclocal: error: cannot open xxx Argument list too long
autoreconf: aclocal failed with exit status: 1
ERROR: autoreconf execution failed.
[snip]

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
meta/recipes-extended/man-db/man-db_2.13.0.bb | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2fa18a8f24..553b2d59d2 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -22,7 +22,7 @@ USE_NLS:libc-musl = &quot;no&quot;
inherit gettext pkgconfig autotools systemd

EXTRA_OECONF = &quot;--with-pager=less --with-systemdsystemunitdir=${systemd_system_unitdir}&quot;
-EXTRA_AUTORECONF += &quot;-I ${S}/gl/m4&quot;
+acpaths = &quot;-I ./m4 -I ./gl/m4&quot;

PACKAGECONFIG[bzip2] = &quot;--with-bzip2=bzip2,ac_cv_prog_have_bzip2='',bzip2&quot;
PACKAGECONFIG[gzip] = &quot;--with-gzip=gzip,ac_cv_prog_have_gzip='',gzip&quot;





</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#209522): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/209522">https://lists.openembedded.org/g/openembedded-core/message/209522</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/110160165/6875888">https://lists.openembedded.org/mt/110160165/6875888</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0SFT7lPM35fr6IqpAUZXKMWv--

