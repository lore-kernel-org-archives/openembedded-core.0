Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB3BCAC587
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 02:03:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5314.1757642575696055979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 19:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a3ZmjvPE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13502c760a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C1tKhc181024
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 02:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MN/bfDVmKHFTQuFOR0Y5rsWENo06H4r00LTzi1cYVYo=; b=a3ZmjvPEqohM
	xdGWro8qpYwMgxsty7NlUYMpopjkvQtQaoLYu9tMMt7x2dE3F6kJ0Dm/ZNzC8WNr
	estVqYeRchxN3Jz0XX3YnVFkUr87gWkMXz1gbJZZDKFAHHF7VNP3WWhyjrqZMcxY
	fDMyUvgTibs4QL/7BRbBmI8TllKBENg1q2DrLQ8iBvsAhdpa0HrbB17nnzDG3xCl
	CWNCsv3mNixVCazdQNoJcz9cgjNKFdUEFlSY3fbMKXkUUsd+OZcBI90gatWbwHeU
	v8oR+JP/MO6bsJ/pN8q+G8gzRE6UpuJ8hAuoDfc9+v6vcmaxspOz0TWr13mxGsr8
	t7OKWxHN9A==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve359k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 02:02:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAH+LSmOr9wNT94pWOyal+rBPDL46x5n835jPU8gZ3cbyeVMuG3vbq87DbqL+blUnCO5/Q5emIVHPSgDytZeoWslvqnLnCmibnFVhYiaFw5lZf/XNweAAAmVDNMGImW8vO6B5GRPQPNa1gHNKpiDxhZv1PmRTcAiwG9bd5vSpb5LrUy+YH972MvD8AxNN7JSQYQDeHWcOw4rvwld9PYI4Yj5qlx1XdabpIp0RFsbP0P0+OLSAJO8/F33qJTcDNfQBuoN6OiCapXxXwHMGyjmPe9hPf4Y/YvvgoE8SdmTnb3bhLDYNwWLXUgApjEQZwI6F0JcbDOiGN5f2ubvZ5sisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN/bfDVmKHFTQuFOR0Y5rsWENo06H4r00LTzi1cYVYo=;
 b=NcSMImfV2G2FXWhZw0P0kxRwfFXyFOXAIT/FJmfvSGt/jZQWeEDjznI7ML8XKeLxy8XgnSCsWPBE1dNbkon2C1Q9YxchQju+A5HW6vVfWNTyzv9Ttgd2TxUIbU4xavtVmVRvVM/yrGs7Izc3u8P2gBrnU+QS0uht9FXVPvJoTijLhCFOtFKzU6ay7Fv6p+4V33UMksXBPQ4f0x4PMLm2S5x2UShL3oQ511csIC52ekbqlInXzxjnPadh+oYXMaoGk68hYJaR+y6+RPbY3iYI0veP/Bqy1nP+bdWlHrWpjODgmSkuP0xx+DafjcbRQ23ZxAiyUAGtVaKExzStDIheFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH8PR11MB9458.namprd11.prod.outlook.com (2603:10b6:610:2bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 02:02:52 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 02:02:51 +0000
Message-ID: <f5d6ad4e-ea2b-4774-b84a-4b69a09c9198@windriver.com>
Date: Fri, 12 Sep 2025 10:02:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250905123421.3940634-1-haixiao.yan.cn@windriver.com>
 <DCOC0GHAATJU.2COUF7546LC27@bootlin.com>
 <c7039f90-656f-4076-a726-e931365091b9@windriver.com>
 <328cdeca6f32532f49f8b1a704f60cb06f76eb97.camel@gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <328cdeca6f32532f49f8b1a704f60cb06f76eb97.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH8PR11MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 46623d09-7dab-4fd4-8977-08ddf1a07af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zkh3cVhIdE5WZ3JFbjdjaG90TGhnQlVEbC9YMkVtcjVObnFkeUpGQkRkTkgw?=
 =?utf-8?B?ZjVPcFBDdGJkcVEzVUE5emYwaU1QRDNTNkRqY0NIekhZb3Q3QTJmVVgzbFlU?=
 =?utf-8?B?WXBTYzFKbVpsand6UURxcDJmSHQrNVRNSFlseEhPeVpJMzZOY205eEZsU1JT?=
 =?utf-8?B?MEpKWHg5Ym1lcjRNa09RYW9lWlgzMGdYWmtSTGtnbVdHb0ZJQ2llMXZyZXdR?=
 =?utf-8?B?ek5WT0FxbDRTYmN3SzRESXF2bnI2dU9UdWFzSkY3T1FtVHhOSDhaUy96L1Vk?=
 =?utf-8?B?cmVlL3JCb016b2RTa3FiRklEU0krN2NxTldGdjdRRUs4T2tSQXh0ZlF2U3hE?=
 =?utf-8?B?cENGVGJ2ZUpMRUhQbWYzY0hIZFBwZzREYW12WFIzSEo5OHp6ZU1PWWY0L0Jk?=
 =?utf-8?B?czNpczIyeUV4c1NsdlBGaTFHUjN3anNra0FTclg4UHhaeFQ5a3dRbVFZM2Ft?=
 =?utf-8?B?Q0dyaWY5RlVtMkRmWnVLazhySkJSNXdSOVRKOHFvdytJazU0RnVJNlFWenl5?=
 =?utf-8?B?ZnNvVXJGRzM3bjlKekh0TTQvRmtqTXE4UmZCOGRBWWZqRHVmRVVnWUNzNk9l?=
 =?utf-8?B?OWg2MFRVV25wUTdtREhXWkhPUE9oRGJCamxSSWRoNVVublJJWUZtUnNmWENi?=
 =?utf-8?B?bU9PZFdiaU4yYzl3VjhnaGdqK2h1Vm5qUkVCL3ZIalBNOFRoUE03YndtbDNw?=
 =?utf-8?B?bmc4VkwwUmluZ3g2UktJYXBvaUs2WmkrM2NNdjRMRHJsdXJISXp3MmpCVGNu?=
 =?utf-8?B?Z0Q5b0pFOFVwTUdGRTduRGpoL0hsNFZ2SGk5cytEeVJRdmsxbDlhSEpEYVVO?=
 =?utf-8?B?ZEc5TXJoWjlzMlY4VnVid1RBcm0zZTViYU5yNGhkbW81anRPMnNBenExM0Zz?=
 =?utf-8?B?c2cwcFN5UElFeWdxR2xLY25OYWlwbzVjY09MNFVBcUtrOEd3TWdFQTBWV1FV?=
 =?utf-8?B?NTdWZmxtbHRCNXhJTWRCbXY3dFVwY3lqQi9LYWJLTENJbDIrNWdKdlc2cjNo?=
 =?utf-8?B?V29vUVYxb0lZUk13a0tJa1Z6L1hhV3R6RWJZcW9DcW8vWVdPM0YxUHJRMm1J?=
 =?utf-8?B?V0hkNWxjaDljanlEc1dZa3R2WjBrSmJtOTR1US9HN2JzeTFDSW5iVXNBT1hl?=
 =?utf-8?B?R3hrWGcrcndDeWtUWk1kaTRNeWNBWW1kdmx0Zm04eXIyM05GTXZhaU5oeEl0?=
 =?utf-8?B?MC9QWVRSc1o3cUJRVWFmZTU2WkhpbzBNbUlTTDJ4bnAvU01UV0FDUThvOG9P?=
 =?utf-8?B?cmZ4Kzd3TmR6UFJqRGlrdDlUSUQ4UElNWGxBM2FLSFgrMytFWnNDWE0wYWtB?=
 =?utf-8?B?cmRQK0k2clpVWkliaVFlNWlaTWMrYmdZTktML1B0TmhodldHcy9xYXlaOVpW?=
 =?utf-8?B?K1h5cXZYZXlBNCtOWlNHZUgrT1B0Y0VpeTNQRUlub292b1E5OXh1L1owMGZT?=
 =?utf-8?B?U1ZmcmU0Wkk0MForemdxZjl0U2RiODRxYkpEUkcwd21pcEdGNUUvYnlHaS8x?=
 =?utf-8?B?cDU2STdCbkVNRmoxQnI5R1BBOHRRdGIyeGpLRGVhaGsxK0NuV3Q1OHd2MU02?=
 =?utf-8?B?UW1NcnZJNFFiNnQrMG5EWWREVmNJUWVoMSt2Y215c3ZlSEgvNGhOc1JxRC9T?=
 =?utf-8?B?dStrWTRFQ3d3c0J3UjFvZEgzZHI4UDVaUFFCRTViejU0QS9uY1NNOUN3alVG?=
 =?utf-8?B?RnRjTmhFL3RFMVphM1FEbmUvRHJ6NHZQeXNsbDdGV3loMVc2TFdSTEFTTFZ4?=
 =?utf-8?B?OVhpVitqQ3kxSlhtYWk2SVR2THhtZEJJU1hLUEhCbjZUZ1lmNTh1aS9FMlJs?=
 =?utf-8?B?Y2lQUDVKUFFjMDFzUlpvOHlPV2JoSUMvZVBMRFphL2tobTd4aWgvRWh0MW9m?=
 =?utf-8?Q?SbG9mf1HexHJh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THNGT3lTT2dUTzRQVDJiOHFHRGE4d1hsQ0ZtU0RLeHhPM3NhZXA5NE1RVXFI?=
 =?utf-8?B?OTRZOTdTM3laRWJoMjhiYVZxT0NGYWxkQW03ZGlGOWFlUVgxSkZJU0tjRDFm?=
 =?utf-8?B?UEx5c0pKZVo5T1NpKzcyUmQxT1RtNXNYVVY2MnZrZUNqY2V1dnZHL2pxUlJL?=
 =?utf-8?B?VUl0YnVJUXlFMlpSYllZUzltZTlqUEZ2cjFsMjM0c2lQL2NONWxTUUFXVXRJ?=
 =?utf-8?B?NDRBb0tjbWhBOXRobWN6S3krcnNqemZGYmdZY0s1bmxNZTkrMnlNSFBOVldN?=
 =?utf-8?B?NmY5djd1UFZHNE5VREUyNytkQkVvV0xFc3l3ZHZBSFg0b0Z5L3J3SFBTY3Rr?=
 =?utf-8?B?bkNvYlUrZ2FmRzIyaWpYcDZqckJ1UFNSNnJML3p1ZHhRMmd3VEVkODg2WU1r?=
 =?utf-8?B?Zk9UWW9jaXVmVmNlVDk5Vzdza1BNTENRZ0ZsSW5DZE1kU01ibTNYeHdYb3Y1?=
 =?utf-8?B?ay9MRWNVSHFKZFJHRnBjb2ZYYU56WHZwL0gvWm80bUFMa1c5VzV6OWhNMGhY?=
 =?utf-8?B?dE9QdjRpdmlpVFZ4aUR3dTVRSmIzbkFydWRyaDQyUVh4ODBzejVFNkRQNnVE?=
 =?utf-8?B?R0lULzkwcmR0L3FrQitoekZ2OTVRd21xU1JlU0tWcWh2eEJxV1U2cExBSlht?=
 =?utf-8?B?QnhDVmdvd3lCRHl1d1BSNDc3eWRLdTVpT1Joa2IzTXlHbUVMUEEvODVIMzdw?=
 =?utf-8?B?TkRKS1FtZGFQa2wvclJZVitrRm4yRFNnWTBjc3RreS8vaXlhSGZ2dEpZNVJh?=
 =?utf-8?B?bXdmNWdPTFhMVmhXTUxjYUpoSGF1M0NGS0cxM2hhRUE1cjEvMG52RTZySE51?=
 =?utf-8?B?NHVvenlES1h6aFZOb0REU0h4Q0YyOXpsUHc2d0JXUHpyTkJyVENybHV1WFhV?=
 =?utf-8?B?WmNpRnI1cjJIeUxvL3ZOdHVkOHp6RkNIdUUvd2dHK0RNdkVoMkZZcE9lOUF5?=
 =?utf-8?B?cnRCNlJvakdJZTk1Tk8yWmpNMTFIVWozWm51S3FlMy9KMURTUFBLL1A0bmY1?=
 =?utf-8?B?bE9pMkd0M3FzS0RvblZyZmlSUlNkSHFZcmRaMGh3M0FIanpKQXAvc21YQVUv?=
 =?utf-8?B?amU0T0xHWDgvNTFMSWdxVzRNaDJkK1JiNTZzaGpDNGtqRmI4TlA4UDlSbkJ4?=
 =?utf-8?B?Y1oyMkpsOXRWcVQzdjdBTWl1MWFHVk83THdkYXlDRC9xRElWT3JpMUxaM1Jv?=
 =?utf-8?B?WmFSRXAzelpyL3RoOEdHaktOYlBhT0JUS2ZtSFRaRkdZRGxrZWJ5TkZzWmFl?=
 =?utf-8?B?VCtNUVVRb3dZL2FRdnNPTGpyQTNSR2ZaQkNFVEhyVlAwS3FSSmdJTFg2RG8y?=
 =?utf-8?B?RDkrbG1SbStEa3JsVmw2eGVWWmI2dzBhdGQ4STFPdTQycklXSDUrZFZVK3pN?=
 =?utf-8?B?c1FlZ2RQYTZ0bGhhSklNZldMODZUVXFRSVlDUEN4YWJKMHJOZ2RFancxa1NP?=
 =?utf-8?B?RStSSWZlbGtxSGErUGhkZHpHRlgyN3FJRTdheFRnbTQ2Vlh2dFIwdG14Qmd0?=
 =?utf-8?B?RnJ6N09yUktxV0FEQmpYRCtqZkJNMlNONk9rZG1DSlozaWtKenhBOWhzSXJV?=
 =?utf-8?B?YlVGYkFPWEJTcmgzY3I0Ui96eVR1MEZYem8zUnkrcXVqcTR1V1NpWUpjRUVJ?=
 =?utf-8?B?S0szN0Nsc2xiSUNWd3pSdmNUVDRTZlFjTEJ2NmVNSXdpRnAzQzVxbTNsdTdD?=
 =?utf-8?B?ZjlKQVlWUSsyWnBPL2I3UEluK0tCa0VnOENQeHV2dEloRWY1NzRRUXpDRnRP?=
 =?utf-8?B?VlByekw3TjJTWTl1a0lPS3RJdmhhV1VnR3ZYcmdQOFhCTmxJNm5EendYVXFR?=
 =?utf-8?B?QmhiWlQxV3dWZmJCVEZhM290aElZSk5rbHNnREJMQ1ZwaWF4cTdleVFGd0gx?=
 =?utf-8?B?b0FaUVEzQkYydFFtQUZaN1Nibk1jSmFza1VMQ0xLdXlidThmajlta1RUaFdT?=
 =?utf-8?B?REYzQjRFcWcxdm9zMUcwMnRyUEpEVVkyd0pVM0xtN1RYZ3dHbEFNeVNXVWgy?=
 =?utf-8?B?aWpOZFgzdjVWVkQ1M0RReDRRVHl2TW9PWFZtVFNGUFRHVzYwditZN0xQcllI?=
 =?utf-8?B?eS9kQzNKMHlNaU5yY1VyNWJIc2RaaE42dnpaQWFLZFljUVBXWlhra0YrdkNk?=
 =?utf-8?B?aTloQmVRNlBMUUdKa1F6ZUFETlo2MFI5bEhHejhhRTNoczR4THM1enVlaWNX?=
 =?utf-8?B?WlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46623d09-7dab-4fd4-8977-08ddf1a07af1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 02:02:51.9317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RE1XBwXh8WDkdBm+ZAy+a36fbqSQBJXW1ms+GN5/aE8gqgWHeoF+dPl07OF5/JkdCgPHnkRqj5PEbbj4wiZ/qzD3mF2eTjJjfV9G80ophmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9458
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: _4C81Zjsz1I02QyYVxm7AU1uRheJcxUu
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c37f4e cx=c_pps
 a=JKAiqZGTwmSlyYxnjvGMyw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=eQoU3LqtvDwkE6Vr_DQA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: y3Bao9GOfE4k_0i5uiQoQmGPJf-swr0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDAxNyBTYWx0ZWRfX29Rw2GGXLuSg
 VoXzX/93xXqkwvMdUVLZ/ER2Mshbva0aQztfy3wiE3sFQp5FTnKAoMY3zxFnUduhGAoL+GGrs57
 BSTH5cN2LEr0+X3CceKKnoZgH+PZAc3sMJJNLGB+Az93ef8Vlw3q3jCaaKh/45NQpby97nRZA/B
 qiaFW7r9h5SfVheIaAglWq5gAmC6mUXXrXoc/vHMDZ1bBQOWig4Nr5y7tVe8gGcJWkW2t9K/htX
 eqXeHyRf3OcNEy5aen3z/ZcHJIyvgSt4Qv0V0RQs0TMD5Hbq4R/PKH7sE5Ial3xdRH/RrW2UYUo
 +aZ1RVOZzfQV5IepluWiRzW9kSr3nMF2cJoZkEVENXzby0p6RUxsjirwAtwKa8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 02:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223299


On 9/11/2025 9:28 PM, Andreas Helbech Kleist wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Haixiao,
>
> On Wed, 2025-09-10 at 16:52 +0800, Yan, Haixiao (CN) via
> lists.openembedded.org wrote:
>> On 2025/9/9 22:16, Mathieu Dubois-Briand wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the
>>> sender and know the content is safe.
>>>
>>> On Fri Sep 5, 2025 at 2:34 PM CEST, Haixiao (CN) via
>>> lists.openembedded.org Yan wrote:
>>>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>>>
>>>> When Bash runs with 'set -u' (nounset), accessing an unset
>>>> variable
>>>> directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound
>>>> variable"
>>>> error. As a result, the fallback logic to set
>>>> SSL_CERT_FILE/SSL_CERT_DIR
>>>> is never triggered and the script aborts.
>>>>
>>>> The current code assumes these variables may be unset or empty,
>>>> but does
>>>> not guard against 'set -u'. This breaks builds in stricter shell
>>>> environments or when users explicitly enable 'set -u'.
> Thank you for working on this. We just ran into this issue after a
> small upgrade in the scarthgap branch, so I'm hoping this will also be
> backported to scarthgap.
Yes, I will handle this.
>>>> Fix this by using parameter expansion with a default value, e.g.
>>>> "${SSL_CERT_FILE:-}", so that unset variables are treated as
>>>> empty
>>>> strings. This preserves the intended logic (respect host env
>>>> first, then
>>>> CAFILE/CAPATH, then buildtools defaults) and makes the script
>>>> robust
>>>> under 'set -u'.
>>>>
>>>> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
>>>> and environment.d-git.sh have the same issue and should be fixed
>>>> similarly.
> The patch title doesn't mention these changes.
>
> I don't know if changing the title or splitting the patches would be
> the preferred approach?
>
Change the title and sent v4.

Thanks,

Haixiao

>>>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>>> ---
>>> Hi Haixiao,
>>>
>>> Thanks for your patch.
>>>
>>> It looks like this is leading to failed SDK installations in some
>>> cases,
>>> as some other variables are undefined:
>>>
>>> ERROR: core-image-sato-1.0-r0 do_testsdkext: Couldn't install the
>>> extensible SDK:
>>> Poky (Yocto Project Reference Distro) Extensible SDK installer
>>> version 5.2.99+snapshot
>>> ===================================================================
>>> ===================
>>> You are about to install the SDK to "/srv/pokybuild/yocto-
>>> worker/qemuarm64-armhost/build/build/tmp/work/qemuarm64-poky-
>>> linux/core-image-sato/1.0/testsdkext". Proceed [Y/n]? Y
>>> Extracting SDK................................................done
>>> Setting it up...
>>> Extracting buildtools...
>>> Preparing build system...
>>>
>>>
>>> Contents of preparing_build_system.log:
>>> sh: 17: /srv/pokybuild/yocto-worker/qemuarm64-
>>> armhost/build/build/tmp/work/qemuarm64-poky-linux/core-image-
>>> sato/1.0/testsdkext/layers/build/oe-init-build-env: BASH_SOURCE:
>>> parameter not set
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/2375
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2346
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2197
>>>
>>>
>>> SDK testing environment: x86_64-pokysdk-linux
>>> Traceback (most recent call last):
>>>     File "/srv/pokybuild/yocto-
>>> worker/buildtools/build/meta/lib/oeqa/buildtools/cases/build.py",
>>> line 21, in test_libc
>>>       self._run('. %s/oe-init-build-env %s' % (corebase, testdir))
>>>     File "/srv/pokybuild/yocto-
>>> worker/buildtools/build/meta/lib/oeqa/sdk/case.py", line 17, in
>>> _run
>>>       return subprocess.check_output(". %s > /dev/null; %s;" % \
>>>     File "/usr/lib64/python3.9/subprocess.py", line 424, in
>>> check_output
>>>       return run(*popenargs, stdout=PIPE, timeout=timeout,
>>> check=True,
>>>     File "/usr/lib64/python3.9/subprocess.py", line 528, in run
>>>       raise CalledProcessError(retcode, process.args,
>>> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '.
>>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-
>>> nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-
>>> sdk/environment-setup-x86_64-pokysdk-linux > /dev/null; .
>>> /srv/pokybuild/yocto-worker/buildtools/build/oe-init-build-env
>>> /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-
>>> nativesdk-pokysdk-linux/buildtools-tarball/1.0/testimage-
>>> sdk/bitbake-build-vbmlrryg;' returned non-zero exit status 1.
>>> Standard Output: /srv/pokybuild/yocto-worker/buildtools/build/oe-
>>> init-build-env: line 29: BBSERVER: unbound variable
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2371
>>>
>>>
>>> Can you fix these failures please?
>> Remove 'set -eu' to avoid propagating strict mode to other
>> environment.d
>> scripts.
> Instead of using 'set -eu' in each script, which as can be seen above
> doesn't work, I'd suggest adding a test case that sources the
> environment-setup-* from a shell with 'set -eu' called.
>
>
>> Sent v3.
>>
>> Thanks,
>>
>> Haixiao
>>
>>> Thanks,
>>> Mathieu
>>>
>>> --
>>> Mathieu Dubois-Briand, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223151):
>> https://lists.openembedded.org/g/openembedded-core/message/223151
>> Mute This Topic: https://lists.openembedded.org/mt/115081014/7501392
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub [
>> andreaskleist@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

