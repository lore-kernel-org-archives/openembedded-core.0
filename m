Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383A4E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 05:45:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.57503.1735537526322761112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 21:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3094b843c3=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU5jQwQ004188;
	Sun, 29 Dec 2024 21:45:26 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq137n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Dec 2024 21:45:25 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BU5jPKg004126;
	Sun, 29 Dec 2024 21:45:25 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq137m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Dec 2024 21:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw0RePbZFAh6K2JfSjMPCGHq4/8af66sk0VmmliJH19NJ3v5jniBvvXALN3i8d3acbGMaJcFqF3BgbPx088+iPoIIhRz65+1gH+hu0BDO6JnMTAZVNZqiSkA+gJXXYeL/AKZ3IavxbxofjmID3h5u69ME4nZztb+Q2w7IKGczCPPJUFXcgTqpP2At01p99fLF+wsAYei6RjDHgEVXj8Kt26iGGKXrEbwSiJx0+c7/7RsJ2K3t2lKnunV870YuqYUEeMlrgZleSuDTklwShGIcDYch5UJCRxUttwwBqXdr8U8T32PqnPxUC73wRbaRlJJuAyeC0hSfohDvbr8aUZrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkIqEYv8W1UPGm8JHtVveQdt59f2ggJJkhP5z8P+Y+0=;
 b=Dv13fmGlfCAqT9dl4LQBTwHnjuUO7XEZqf6n4IrrynZ7HdwCs5LMQrRi3nFH3fLDKjpUpXvjWjph56mgsD2DEi3cObVyzMLhjIYKm6W1qQW2KbEDMiJB2zFwUS7HPdsPdt5bYHSNFOjqqaJQ81jkvUn/zVlZwioqRSOaok4XZtjFnEGFiucN0JIMivPxlLZDZhuzZB4JQ4AClQAF2vn4UH6UlmjJK2XP09EQh1j+yhNlVOoBAAP7NB3dIjwk4EpsiC8wSWS7MqX6CzqLvQxLI6wbRLyFAH3Jgg0QYC4i39c354j7UfW94P5PzYNTGCaGRI9/3XhrTAfdBwO6QrX+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 05:45:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8293.020; Mon, 30 Dec 2024
 05:45:15 +0000
Message-ID: <a761c6d9-26d3-424a-8c01-d7e3fc518965@windriver.com>
Date: Mon, 30 Dec 2024 13:45:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ncurses: Fix install conflict when enable
 multilib.
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <1735536183-2876-1-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <1735536183-2876-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: bb44fddb-3a52-46d2-5bbe-08dd289522d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1JPd1ZLTnZIcnRveVlHS1d3a05TWlB4OUdzKzZTd25saFF4R1FyM0RzcjBs?=
 =?utf-8?B?SHNoNFJZdG16NkRpVllma21SdFE3Sko5ZmpoZ2drQ0FsSnVBZ0dWMkgxSWRt?=
 =?utf-8?B?V3hMaytWQys1bExsQnRPbjRXMnJ0NDRCakVySXdCOWx2N2xWdGdTdklja0xV?=
 =?utf-8?B?anNQaklGNVNoa2NOcS95bUVIczZZaTFiWHBJdFZNL3FpL3NMWVBxSTJRNVV3?=
 =?utf-8?B?RHBvNWh5T3ZGelFVamRMaHMwYlFmeHorbktER3RqZWlEam9tSzVIY3VRTWVH?=
 =?utf-8?B?UW9GVGNZTjV3R1M2RUJ2ZE1WNTVzNGJkSmtwQUd2SGhnZW1ONlUwNTk3eThw?=
 =?utf-8?B?c2RrdVVZMU9uWnFZWnZGbTIxME9UQUR2ZWxYd0dRcXNmemxhUEV0azZ3L2d0?=
 =?utf-8?B?U3Nha1o4Znp6bys2K0srNDJOKzdzZi8zOGlha2pEdnpZdjhiL2IyenRwV25O?=
 =?utf-8?B?MEJ4Q09NVW40c0xBUkRhWlMwRVZmRk9RUjB2MFdHM2l3YlZ1RkxGYitralZs?=
 =?utf-8?B?TTNyVG9xY3VMWDNwM3lsZUd4bDFQOStVMnFNRWtrSWZwTzRMRGxRZUFFTVdN?=
 =?utf-8?B?TzBxd25YblUvMzJKall0ZGx0Y0E1V1VBUzEyenQ2QWRPV1VrclhFMHdCMU5C?=
 =?utf-8?B?Rk9QNUp4b3NPQy9pN04xUjg1VGx2MWhia2k0YStiS1JrN2FLd1RKRVN2ZW8y?=
 =?utf-8?B?NTRaemJHSFM0UjUycU1tTTJjWGd1YlljM1hzSTNzL3JJMlorK1ZnOTJEdXAw?=
 =?utf-8?B?NWNUN2IzMXBJN2Y0K1pQMDQ3a25ONzRpdmJWWmJnRFZlUURidFRybjh6cDFo?=
 =?utf-8?B?anZyd3VVNmFBUXZJZ1Y3WUcxQ21yVHltemJCN3BDMnpVK0ZpeDRua3llMXN6?=
 =?utf-8?B?UmJiOFBocERQZ0R5alRkOFM0ODhSM2xCV0Z3N1BPOUw1aDYrdGpWSnlWK3JY?=
 =?utf-8?B?TlUvTlVnQzdheTZyd21kU0NDV3ZVMWJZanF0dEdiTDYyRnhXa3IyUlVHTGJ2?=
 =?utf-8?B?Y2E5K3ZVVW4vU2l1OTZVYnZUMVBkWXRGWEorbVp2cDMzWU44Z1h3ZFdrY3lC?=
 =?utf-8?B?bjFMdENWdVU3eHNaNThaVngwRnh5dDFqZjAwNFoxQm1hc3dVOUFrRWw1Tnc4?=
 =?utf-8?B?ZzBNNGdCcGxiYXEwVFFUVEVSYjBWRmZHTjhHMzJCbVlZK0Y2YUV0ZVM4cDRj?=
 =?utf-8?B?OWxZSjdvRUpMT1BXY2c3WmZIalF4NitpbDNzdmd5TjdFbEdROEtLS0VWVnZU?=
 =?utf-8?B?RHdGbVlabE92OFVnWTFRSDYzYUpHUHJ3TWx1dWZnSFFyVFpPYzB1dTQwZk96?=
 =?utf-8?B?eVZ5U2I5TlpwVmxlMFE2TVlETmoyUjdKZWZ5T1ozZStNd2xxcStoYm5CTWxm?=
 =?utf-8?B?SUh2WmdjeVRuR3U1QW80OVUxS2syMWRyNDVKcXlBY0NQQTVqc0FvZ2hBN0hU?=
 =?utf-8?B?dzRHOEo4WTlUUURWQkROM1c1a1VkMUs5a1dVUlNnRVJqdnp4S1g2amV1Y3Fr?=
 =?utf-8?B?SUtKVXVFVFl1bG83cGZXWGhsaWRHZXRhemU5RWFRNFhHaEYxWDE0WE8yazE4?=
 =?utf-8?B?bmhJbVIzQXhYY1ZzUkNHeFdsUHpaem1hZ1ZoUUJPMk4yWXB4WlZ0cE0rMUNw?=
 =?utf-8?B?aHRUZnNDUWw2VURhTWVVd0VFMjB1RUhuclNCOTVreWxBV1hsMW1tcVY0OGx5?=
 =?utf-8?B?WWUxQjZrcWNSaVlnSlRxV21OL0pQbEdkNjIwUnlMYUNSUVh5ZndYNWhpVjZq?=
 =?utf-8?B?K1VwWnhpb2o0YWRyYXZBMDlYajRTenBCcjZqUGVVTVY3Mzc2bUFQUi9tdSt1?=
 =?utf-8?B?QjdOam5TNEU5Q0RiMDF3QT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0VpY0pwYzZ2azJrRFg4UktiYUhnWXlNa254eXdubjlDR3ZKOGczMG5QTXUw?=
 =?utf-8?B?dlZzdVdQeTJiYjEwY256ekVraDdkWEtESHJrd2d6Q2ZYTUk1YWh2YTNScmtx?=
 =?utf-8?B?blhpSEdxeEMyWlloNm9yeXc1OUR2a1RoTFo4ZGVuZ1ZTMVhyV21WZ1lYSlBC?=
 =?utf-8?B?a3U5ZWRtM0xGUXhuek41UVlqalhQeXlmdUZZMndwTkdSZWl1cDNIZUpCMGsy?=
 =?utf-8?B?cDFyUWNjNXBSemp2Z0s3L24yVzFMRE40TnU5WTJ6WHY2TXlKUzQ2ZnZhbWp3?=
 =?utf-8?B?RUVmVnFQRGdmZjcrRHZYQ3Rtb2paNmF6T29malhRSmhWMTB4RGtLVGVpZ01k?=
 =?utf-8?B?VzhVRHl6YjN0UFBvZUdYeGxIald4T1l3WExwTTZaYnR5T3VlWm44THRrb1ky?=
 =?utf-8?B?R05YTEhtTWhwRlcwb0VRamo0eVM5cUxvcmFBWGd1ZDhBL1hoRS9hR0RScllB?=
 =?utf-8?B?eFcxQW81QXcrSnVNWTVPK0J1T0t4aEVLUGJVTEh4Q2hDY2dhdkdwQ1J0cTR5?=
 =?utf-8?B?dmI2RGJEL05XdlB2VEVGYjBMR3M0MlI4ajVmd3ExM1RHV0k5bWpkamhuZnY0?=
 =?utf-8?B?UklNVzJQbWlWbmxiRHNFWFlDaGNSNUFPY1c5UTVGa2d6aUdLVFMzdWV6ckFY?=
 =?utf-8?B?RVc4R1ZiUkU5WTVBSUh6NTE4dlhLYjBqR0tlb3hYMnQxcVFXd2p2R2xQb0Zi?=
 =?utf-8?B?b3o2QTZ2cXZ5cFg5WnpuODdLS0YrVVU2UUQzdXBSczg2ckJiOGFKTEVnSlhu?=
 =?utf-8?B?RUJsR3pwdk4zSjNRTlhXcDByOW0xb0c1eTJQbC9RcnhvK0lBVndibEpnVFlm?=
 =?utf-8?B?Q2dZOVRFMWJ1YmFvazBwWmpjOXdBMmp0RVNnem9RbUlTckZFRW40UStLNm1h?=
 =?utf-8?B?N1pnM1lzNzF0U3J6WlgvU21tZnFHVEdVMVM4ZGVBMk92ZXczOTZYWUtDYW1p?=
 =?utf-8?B?ZXVPR3F4NEswdlJabUtUMC9lQytUbE1SK3pWU3ZhZkNTNU1wS0NXRkNVTnVy?=
 =?utf-8?B?M3J3YnFxZjJqelFHTDFqWHRnS0J2UWg2YjQvdGM2WWdBUnRGZ2ZiMFhjRFRK?=
 =?utf-8?B?cFhCSDZRT0hnUlJ4WWZQdjZlRjdhSy8zRE5SSHo2cHUvT0Q4dlk5ZmFrSzFr?=
 =?utf-8?B?VlltSnc0ZTJMWnVRc1RSbmhTTjBvNVE0RW51OHRVWi8zNk5GeUJwTTNwcGtP?=
 =?utf-8?B?ejNORWw4NFZmaklsUFZONmZpZmhKaGNpaXBRcldyaXA5djNYTTN2SXhRMlRq?=
 =?utf-8?B?OFdqNTFqZWx4Y01HNUpRbTF5SGI4YldleW8reS85UUlwZU5ZMzM1WmpJcGV5?=
 =?utf-8?B?MGFaRXhvdHZlSnZJeW5VM1JmTzdsSksxZVdVMk1HWEVKSlNIY0xid3kycmVE?=
 =?utf-8?B?K1lwU1hjM3QrY09uQTZta25iRk9CVHlWaVlvZi9lWVhNWUVDK2VaYVd2VHoy?=
 =?utf-8?B?T2tEd25JYzd6Z2MrUzlqSTJrZlhCMmx6emRRZWY4ZHRhVXJPV3FtNG43c3Rh?=
 =?utf-8?B?OXJYWE5ScEtZVkRiNGdWMXFrcytRZXk5QWZVNnhveFZlc3dReE94RnJ6enR0?=
 =?utf-8?B?a1FYRXQ1dFR6SVRRekFiYU8zN2xpSEFvZnJ1RVpFTHkrUnZIQXZzQ01scnBp?=
 =?utf-8?B?cEc3YmVHdFR3ZENpT2tFVUN6NUQzM0tNUi81dGllYzM4bEtNQTJvRHVxV0h2?=
 =?utf-8?B?SS92emxuSk1LaVdFQWVld2FWbWZNbkJ1NlVma2VNd0xhRUZkc21QWDAxa0NG?=
 =?utf-8?B?cGNKVlF1WGZhQXRGOVpqdkNBWnlSQ1pmRGNPYkZMWTF3OWJYRDdpK2ZTREU5?=
 =?utf-8?B?M0hWNndzd2s4Zy9YaFpGeXlqalJZWHU4UkNranh0bzJScjhmVVIrUWFHbjRI?=
 =?utf-8?B?TVZGSTUzdUJKVTFaVUJGS3NrRXNqNDhId1JWT2tQdytYSHVjK0w4aFlYZWpC?=
 =?utf-8?B?VHBHRGRUMDRDWkdzZ0JTWnRldVZWU29BSklmR0l1cWlQMHNaOUtqVDdYSzhw?=
 =?utf-8?B?Z05GRkZtSjZNWm9aSVM2MElYZTRpQlYzZHM4MFU3MXgzZ3BKanJxcDhWTEFP?=
 =?utf-8?B?LzJxWDAwTGU1N0wzWWN4TEdvQUg4cGdOeEtQd1ZsekJqaG92blFvOFR3M2xa?=
 =?utf-8?Q?MD+qcfB8y7P1g1gM0jD+rFDrT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb44fddb-3a52-46d2-5bbe-08dd289522d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 05:45:15.8162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Py8kLCu/9wdgaZ6nVIW/5xyF4jdgY05cIfUI3jaFTZG44GSBKQ1fvVdPw5P97i89H0CtlgbHugrhb6JH3flcQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=67723375 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=HiWkEfo4AAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ufJb0aFW1JSrQWQEB6UA:9 a=QEXdDO2ut3YA:10 a=_QplDg0m8TGAdENQf2wZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: DKDbULI7mdR2K7ZPOdJTb29Q4OEH7eft
X-Proofpoint-ORIG-GUID: pSVmlM4ofwp4QPEPROd1NbZG0EAYTWkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412300046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 05:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209138

Hi Mingyu,

These files look like configuration files and databases. Are you sure 
these files can be safely overridden by their lib64/lib32 variants? If 
so, please add corresponding info in the commit message.

Regards,
Qi

On 12/30/24 13:23, wangmy via lists.openembedded.org wrote:
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc | 74 ++++++++++++++++++++++++++-
>   1 file changed, 73 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index e96ee075bd..11d8fd7c3c 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -10,7 +10,7 @@ DEPENDS:class-native = ""
>   BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
>   	${bindir}/ncurses6-config ${bindir}/ncursesw6-config"
>   
> -inherit autotools binconfig-disabled multilib_header pkgconfig
> +inherit autotools binconfig-disabled multilib_header pkgconfig multilib_script
>   
>   # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
>   SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"
> @@ -321,3 +321,75 @@ RRECOMMENDS:${PN}-libtinfo = "${PN}-terminfo-base"
>   # each recipe specific sysroot. We can live without this, particularly
>   # as many recipes may have native and target copies.
>   SYSROOT_DIRS:remove = "${datadir}"
> +
> +MULTILIB_SCRIPTS = "${PN}-terminfo-base:${sysconfdir}/terminfo/a/alacritty \
> +                    ${PN}-terminfo-base:${sysconfdir}/terminfo/x/xterm-256color \
> +                    ${PN}-terminfo-base:${sysconfdir}/terminfo/x/xterm-color \
> +                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty \
> +                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty+common \
> +                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty-direct \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-16color \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-256color \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-base \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-direct \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-linux \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-vt100 \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-xf3x \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-xf4x \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/kterm \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/kterm-co \
> +                    ${PN}-terminfo:${datadir}/terminfo/k/kterm-color \
> +                    ${PN}-terminfo:${datadir}/terminfo/n/nxterm \
> +                    ${PN}-terminfo:${datadir}/terminfo/r/rio \
> +                    ${PN}-terminfo:${datadir}/terminfo/r/rio-direct \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen-bce.konsole   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen-bce.xterm-new   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen.konsole   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen.konsole-256color   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-256color   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-new   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-r6   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-xfree86   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/scrt   \
> +                    ${PN}-terminfo:${datadir}/terminfo/s/securecrt \
> +                    ${PN}-terminfo:${datadir}/terminfo/v/vs100  \
> +                    ${PN}-terminfo:${datadir}/terminfo/w/wezterm  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xgterm  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xiterm  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm+kbs  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm+nofkeys  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1002  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1003  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1005  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1006  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-24  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-88color  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-8bit  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-basic  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-bold  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct16  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct2  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-hp  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-mono  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-new  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-nic  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-noapp  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-old  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-p370  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-p371  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-pcolor  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-r5 \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-r6 \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-sun  \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-utf8 \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-vt220 \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-vt52 \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-x10mouse \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-x11hilite \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-x11mouse \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterm1 \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterms \
> +                    ${PN}-terminfo:${datadir}/terminfo/x/xterms-sun "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209137): https://lists.openembedded.org/g/openembedded-core/message/209137
> Mute This Topic: https://lists.openembedded.org/mt/110339215/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


