Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92083C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:20:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.272.1790698842797045881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sbjBxLqW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47326640da=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE9biG758586
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:20:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=VrDqxEzdqQJiXA8/1pklsg
	lmmPO9r9iXO5EBUNIE2Ro=; b=sbjBxLqWgmD2BR+9/quz0HnEGydvkT1ulUIwME
	2x1hYJY4sP/w3j+AbjNed0Y5apI5NYSGwP5AIdBrOhvy52RRc8JZOhr/7DSM+VYH
	wnPUXT2bDNaUdogFWxyF0dDwjjQ9A56YpHNE5eliY+Nni3RJUw0KGMRlvrLQcAfO
	tiEsFbDGLqIpUxo/4qwQOdsGTOw//nP0PWGidj5O7waDqUrRqnvqZ6VpfswjiKe/
	IAN54musrtuBXL0rlXpNe6EbLhm1ANATZXx5oZUYVIsZoztlnWyEIthLTJTNUfih
	xxfEF+N9RzCcXeE96AqjuTDQ71CbHzMnjlxHmnSx4fs9PinA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021084.outbound.protection.outlook.com [40.107.208.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38wcyd5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:20:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r79XpC9s+7X1KRy1JbHpBtVLCUnVXVVtKsN/N0hxcJ9xRuAIlRfyuvyWFsfmJ2lWfqkk27Egmg9wqA++8S8bg6MPPUNq7CjDi+uvYO6I9FZyBUeREyJhkWK1x75En2paIZ2mvybQKZq0KQzGNIZxUHgmt4COPcaL3Ub2oZjlIOaTJ45x1cPkV5ErfU4Q2Ro05H5dMANK+67z76Z684qz6To+t17GJaYGyu3zNgX1QGy+Fs1cqCYGGFBa43amgb4mEzjk8W+g69Z6jWyI6B4rNpvRNeso0YyYlleu3+/CCUMAa7z3r8GS+eYkAo2QXDiszQ1azxPja/wp4293/Gu17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrDqxEzdqQJiXA8/1pklsglmmPO9r9iXO5EBUNIE2Ro=;
 b=DKVurvf6+2YRa0Am5fIUcV9+ZGS5TGiyEOjZol63buHw3CTUvpT69vSn+w5MRCUTHf0Kl9FsBAHwKUjO3lsuityzJEEsFrioklOCCC4lwqrb0fo2JHJXIk6Dk+7WMJuQrLSr1ajF1o94wzHStpS1eM3S9V1o7ldZCIqG8vx36lDjeEM1JLVOGnpSKmMSzHQS4SLGyUgShAEUu/Fl7Guyvu3j45PFG7WRADXqcivtoKp8EXsPxx9QsrZa5irgUATt+spyVF2qGcZu2eYCyq5o+1VCurJ1Tv76TtljNob4U/7dnxYkEd3vuPaRhUigDH8vSTJknwPhtae3OV/Yt/B2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by EAYPR11MB019434.namprd11.prod.outlook.com (2603:10b6:303:2fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 16:20:38 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 16:20:38 +0000
Content-Type: multipart/alternative;
 boundary="------------FNE7YxqyABFqTiSIjuhHAWNw"
Message-ID: <9a6b6928-0db6-4f88-954d-870ff32f8348@windriver.com>
Date: Tue, 29 Sep 2026 12:20:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] less: upgrade 704 -> 710
To: Sumanth Gavini <sumanth.gavini@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
X-ClientProxiedBy: YT4PR01CA0377.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::26) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|EAYPR11MB019434:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6d1a55-b8d0-49cd-8e7a-08df1e459914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|260925021911599003|260925022911599003|260925021311599003|12006099003|8096899003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	GgHvfCrPZG0HO3Ac5B70UFUb19tovkbhawIXJMy9CKKw2aJs4g4IBq6ZDJpEGyjWVLdkRQ3V9Xeg39yaj4qNjJL3qpfMM0Agdg2tOPd6/s1ub2BYa0x4EuNpGtJmWv/0sKkCa/p0e+J/+eMNbFfod74QSmz/0ly8v3S1ZIASm36r69HarS+PX93wgIHqMUJmvuaJPvwW8aodU7o/nZjohDczeSUuSx/JglixcRbtjX8tKKrp5vD+HOrBC8z9lIV4x2Zmc6PDoGM71zh7PVHjzSdEO6a3wZBEA0Qh5Dhn8yMlMS9K3log+KEFcZN+AEWz3SmsHP3dz0nRIrgBefO0NU95Qr+RNmQ+VuqEv+XEWsQ4wSUeyADksYg/31+jJamtGtYfsFlJpx3Lb1n5cBUFZ746sh/LU1bamx02NHDyAZUQuu/G+KcpOOzPu+jdSJfv9CTXSvFXjvwjsjuoitQ0WUF5/+2wHSinSdXwVuXHwE8QWFWPK7mjzm4okG5X3So4x7lsK2GUDPVbIDHMRsRUVZkg6PhYmu+nuwOaLAeKwB4/q+X0bUGKoUHFLyzYJ3yBPVuFEKELH8qPyDBNNDblM3P00/g1x4Qx+LxOKMp9L07W2v2eE8Z7yI7harrxEgG3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(12006099003)(8096899003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlBQNFhjYmxRM0krc1A0Z3BBazRSNzhxTWhuRitub3Y2QWQ3cGI1YWNaWkJM?=
 =?utf-8?B?c1M4Q05oZEZLcGFBZ2VqazFFdk1mblRtdlN4eGJyQXJjaVdqeVdoSWFjL3JN?=
 =?utf-8?B?aEN2aEVzbCsrZ2EwL0NVdmhwbVZ0Vm43ODJaZHhBVDJOa09TZi9YNHV1SVVT?=
 =?utf-8?B?a0R3dDNtRlNoNXJaZGpKSk0yeU1NZWZvS0RmWlFhTklZUldFdkNiby9LQWx5?=
 =?utf-8?B?SGFGRTQxUUVkNTVSa0JBalcyL0NiUjRrSWI0NUxCbTZ0c2lkY3hIYlJKRThV?=
 =?utf-8?B?a3JyclNrdllwQUp5SThteEZKa0NwWXY1L1RsM2FYd1FnVDlldDl5NE5vY2NQ?=
 =?utf-8?B?ZGw5elgwUUZGNWtUZExZMTdPclVrZzVTSm43elR3TTYyd0NyMzNqMHpQdU5h?=
 =?utf-8?B?MVoxVjhmYzJTazd0WklUNnZaYk1jK0VpOHhlSjNXKzErclVKNDY1RDVEUUtm?=
 =?utf-8?B?YlhnVFBYYWYvT2FwMXV3WVpNS2ltb09wUTdvcU1qcG93ZnMrOHcyMEhxb2RO?=
 =?utf-8?B?VCs3eEtrNURpalNzZ1MveTR2VmpnL0VkYVRtTnFnWDZMQThQbHlqSTVhNm03?=
 =?utf-8?B?dWlydUV5UDQ0dlhySGlFa2pXbVVRcWJwQ3ZwdWZ3SjV0WDdEdmlYN3ozZ2xP?=
 =?utf-8?B?SUtTb3pvZE5KU0Evdk5rWVBTTVdjemJ1VUhxdzE4NFRrL0RIdkxCYkxyL05n?=
 =?utf-8?B?VlU3SXNWSGFsTVNaVjRzc3liS29BSnVrVU9EclI1eHpZK2YyK3h3c3QyMHZI?=
 =?utf-8?B?b0JpaVdIVktzbjNGMEYyYXY4bGNybzVUU0JUMWZNU2NKNkFoVTZ3ck5NcHRY?=
 =?utf-8?B?Tlh5U3F2NW1adkxrMkZ4alM5TFNkU1k0a0c0RXBOVUVvYk53cjk5Y3ZjblFi?=
 =?utf-8?B?djhIQUhNU0I4NVhzVGZubHp4Q2xvRnpISlRIYm5kZmV5UmZ4R1F1N2NCYWJI?=
 =?utf-8?B?U3EyZWpVYU9HZi9tSkxjMTM0TW5LTGZWRGxvU2ExbnVxSkgrQ0d2c1N2N24r?=
 =?utf-8?B?Ym5BUThpUS9OdXRMS08yZWh3UEZ0eDV0dDFKQXU0YXk1bm1GblpkWm1TOHJE?=
 =?utf-8?B?WTZieTdVZDVCaXBsYUxtMGZSMERkaXJDeVlEamtqaUtnNk9KQnkxaEJwRUNq?=
 =?utf-8?B?RUl6MVVuSVFXUUVNK1FnOXU4cFlLeWNqSWdnU3hXbkZsRDRYbkJNZGJjZnI3?=
 =?utf-8?B?ekZhTmtPNU9aWkRYS3U1Q2VpSEkzTVlQbTNYcWZuWVo3TzJUUjlaU0dxVjVY?=
 =?utf-8?B?WTFZS2haQ1ZTWElLYVZuTkk1UXBSN1hWbnlXSityNHQvazVCL00wbVpVN3RN?=
 =?utf-8?B?dDVLK0w1cDJaL2NONlhEY0tkUys2My9vQWQ1YnQxZ2JaWGdCZjJnSFdycTBT?=
 =?utf-8?B?dGNoeGR5UU1DZWZqVzJIaVpESGZ3Yi9KUUU2NzZ3ZjZNKzhKa2tCNnBFNHVw?=
 =?utf-8?B?TkNJaDQ5UjdFZStmcmo1c1BVMzlCWGJMWm1iZHBDRkFLRjdxMlR5SXp0WmJD?=
 =?utf-8?B?alBXckhhZk96NS9TdVBVOC81Lzcrc21Pdlg1MFZCZlFoYzlKMHRsNXhCT0to?=
 =?utf-8?B?UEI1SlZhdUpGS1JyQmlvL0tjekJYVXFIaGdhRkNneEo1VFc5d0IydFFTZHJR?=
 =?utf-8?B?TVQzeW5sRGYyVXFZeWZocitTWlRYZWhvMGhFS3htR1BRL2Fwa29oTytFc2h2?=
 =?utf-8?B?YXhaRTR0eUhva01yTWNoRnJCa0ltUDcxNjkxWW5iMjYyYXczamsrdHU2enc4?=
 =?utf-8?B?UjV3NmtZY1pnUGFEaWhtYm84ZnpBWEVpd3ZUNW85OThqVEttVkxBOTREaFpp?=
 =?utf-8?B?b0FoQkhxc0FZTUUxTU5HSVdkam1XNjlsUzdyZzNxRlZoSW4vTDFnd1pBckZE?=
 =?utf-8?B?QXR0OGJBZ2NkKzJKbm1iVlJjN0ZQRmZOd2xIS3pOM3VWVXh2QkdxNGY5Y01C?=
 =?utf-8?B?TzI5UEJlejg4Kzd1Vm1XUEJGN2JUN0k5MW5lSEZZbHpxaFNwT0haMTllTmQ5?=
 =?utf-8?B?QlZiTU50N040bXl6QTJsOXR5ckRXZksyMWhvQ25lc0I4TGtJZlI3SVUyRWtX?=
 =?utf-8?B?Mmlaalk4ZUFXMDNwNTRmY1E2M1NxUktUdnMrcU9jVkpLWEduVWtvUmNWbVIr?=
 =?utf-8?B?aThDTW85cXAvM2hWbEY3bG1hczB2R1p5MEFUanVzMk0zelhKY1liOTZpRUdk?=
 =?utf-8?B?a1RITWRRWDV1NjdvZThRbDZmSHBna1dkVS9sMVE1c3JZY0Q0ajNNVGFSOWsy?=
 =?utf-8?B?K0ZXT2tNSEk1T3QzQUYvSmtlMjFnZHVxbXNlblFjeWZTOWp1NXRXNm1GSnJR?=
 =?utf-8?B?SzNTQTZHVTA5L21LRHVVcDdhM3U1RFpTUkRab2JocFE0RDg4cXRSMzNaOXFq?=
 =?utf-8?Q?IV+5Le8dx9KEybWE=3D?=
X-Exchange-RoutingPolicyChecked: 
	iBoVPkgED/8wN4GXqgh1wBgAcIPPaqaDUTMz598BD4D8dcUFoY31cEUlQ3iyQ3R3+tj+dtMZvkUTtZjjLVppNbhalu+LgyHH89lhIMtt/gDBoFq+pmA7+vR9Benr0ra7ja5mAdtgE8fuUf5noKefvOBySTc3jJ4R0MCEWL+hLXJLAW+3eZcoV0UkqIlWSLx4ldb4agxAZTJS7/msORatPQFECZzS2g07BsaLza0rfd+Z7xOzFaycvQn9CMv3YuyZpwZYm3GmO2g8Z8CV8aify00gDstgMdo2UIlQD2rtdY/I8lzDv8VRZPMCPixKlWsO7tkeNlPs7qOEXinvrG+vwQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6d1a55-b8d0-49cd-8e7a-08df1e459914
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:20:38.1486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srgZhAQMsTx9RqYFPYe6onnt42GmVqE69rFePDFUL57g1VlqvEuEzeMQcEbggeFYU0jS/+md3JLzoWuxKMEtMxgsWspATnt4bACNO57G1fI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB019434
X-Proofpoint-GUID: N-08XDuCg5jMb8VRf0EV6PUtTtch_Zv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfXxNNYwLNESMaI
 Xgu5QYkcIxH6bCPZ1EcL+8cS6AVbYnMP2rFm5B+0ggqgfqC02zFxk7liRXi4VM7f3TgZzcR71vE
 iMIy2BWk8TjEYuqBFHup42EC5c9GrABzAfQeT5TDSC0e0GwvyCajowS/ctc0QOgq2wZ0w+aBHAW
 2a/xYnTJeDh+480VWHMlHfb5x4hsngsZOU3b0e5SVXQVmuJSYoFh9akx/cRP/iOacZEDS5+FjwN
 cZMgA4jS80f7LMpiAqUS6DaKQhEofp+nkBzSCPUgotFGMY4OqkIEAcZMsMJnz26Lxeg6f/6IJti
 abRhpzrixWl0wFhBihRCJ1qbRtEFwBhSD4BQCqLe1ljjuLvnuhHi9glo9cd+CZCBEZt/B/PKrhp
 5Gsh+XWFHIPmFc2H9sCjrB1Mr4CV2gtD5KB2wRb/wsW3zQrObRgz9TR8Q06oxCHYXfgfisgPPUj
 o87Kh7W4cJZL+gmbgpQ==
X-Proofpoint-ORIG-GUID: N-08XDuCg5jMb8VRf0EV6PUtTtch_Zv_
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6abbe559 cx=c_pps
 a=0iCLHuH1wF6tAjvkAzcOzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=4avBbA3pAAAA:8
 a=t7CeM3EgAAAA:8 a=MiBS6K9hdb_Sk3-haOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=JGDjpw39xLsTZ_NIg5wA:9 a=l4cfY_ix31afxGBb:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FNuvnhAvCZ4ZEIA-sn9Q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NCBTYWx0ZWRfXzOsm1Xu03j/3
 7HZU9GY4T/QXKml1R5NmsGdN5yK3fHad7L9G2s0ICUI2ihgyjDGSlyjIananlfktzTgb0yNQd1v
 BwI9AikPxhRg0O2TZB5BdwHyAcWMX47eJ4Jp+A5A3MDGXP14ibbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246879

--------------FNE7YxqyABFqTiSIjuhHAWNw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68TE9biG758586

On 2026-09-29 12:01, Sumanth Gavini wrote:
> Changelog is here:
>
> *https://greenwoodsoftware.com/less/news.710.html
Recently, we prefer that the release notes/changelog content be=20
duplicated in the commit log
so that it's available should the page disappear from the internet.

The AUH report had that:

 =C2=A0 =C2=A0[OE-core] [AUH] less: upgrading to 710 SUCCEEDED

Otherwise, this seems fine.

../Randy

>
> Signed-off-by: Sumanth Gavini<sumanth.gavini@windriver.com>
> ---
>   meta/recipes-extended/less/{less_704.bb =3D> less_710.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-extended/less/{less_704.bb =3D> less_710.bb} (94%=
)
>
> diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-exte=
nded/less/less_710.bb
> similarity index 94%
> rename from meta/recipes-extended/less/less_704.bb
> rename to meta/recipes-extended/less/less_710.bb
> index dc841a9ae6..f3f5ebd6a1 100644
> --- a/meta/recipes-extended/less/less_704.bb
> +++ b/meta/recipes-extended/less/less_710.bb
> @@ -29,7 +29,7 @@ SRC_URI =3D"http://www.greenwoodsoftware.com/${BPN}/$=
{BPN}-${PV}.tar.gz \=20
> file://run-ptest \ "
>  =20
> -SRC_URI[sha256sum] =3D "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209=
af7020743547bfe9fb"
> +SRC_URI[sha256sum] =3D "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8=
018548e021d975ec7a"
>  =20
>   UPSTREAM_CHECK_URI =3D"http://www.greenwoodsoftware.com/less/download=
.html"
>  =20


--=20
# Randy MacLeod
# Wind River Linux

--------------FNE7YxqyABFqTiSIjuhHAWNw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-09-29 12:01, Sumanth Gavini
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260929160148.1379655-1-sumanth.gavini@windriver.com">
      <pre wrap="" class="moz-quote-pre">Changelog is here:

* <a class="moz-txt-link-freetext" href="https://greenwoodsoftware.com/less/news.710.html">https://greenwoodsoftware.com/less/news.710.html</a></pre>
    </blockquote>
    Recently, we prefer that the release notes/changelog content be
    duplicated in the commit log<br>
    so that it's available should the page disappear from the internet.<br>
    <br>
    The AUH report had that:&nbsp;<br>
    <p>&nbsp; &nbsp;[OE-core] [AUH] less: upgrading to 710 SUCCEEDED<br>
      <br>
      Otherwise, this seems fine.<br>
      <br>
      ../Randy</p>
    <blockquote type="cite" cite="mid:20260929160148.1379655-1-sumanth.gavini@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Sumanth Gavini <a class="moz-txt-link-rfc2396E" href="mailto:sumanth.gavini@windriver.com">&lt;sumanth.gavini@windriver.com&gt;</a>
---
 meta/recipes-extended/less/{less_704.bb =&gt; less_710.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_704.bb =&gt; less_710.bb} (94%)

diff --git a/meta/recipes-extended/less/less_704.bb b/meta/recipes-extended/less/less_710.bb
similarity index 94%
rename from meta/recipes-extended/less/less_704.bb
rename to meta/recipes-extended/less/less_710.bb
index dc841a9ae6..f3f5ebd6a1 100644
--- a/meta/recipes-extended/less/less_704.bb
+++ b/meta/recipes-extended/less/less_710.bb
@@ -29,7 +29,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz\file://run-ptest\">&quot;http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            &quot;</a>
 
-SRC_URI[sha256sum] = &quot;20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb&quot;
+SRC_URI[sha256sum] = &quot;d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="http://www.greenwoodsoftware.com/less/download.html">&quot;http://www.greenwoodsoftware.com/less/download.html&quot;</a>
 
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------FNE7YxqyABFqTiSIjuhHAWNw--

