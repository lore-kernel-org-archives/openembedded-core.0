Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A05EC0487
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:01:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14822.1772532087157897794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=krysDWWz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234jXSi3714068
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 10:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=csFzsnooa2mgghCBbofdXD
	3GLrlGhwA9JRf43MBN/5U=; b=krysDWWzfpE3Z/lc6xaiqLx8WIlDmevnb+G7yU
	qb/tKXSW1vH146a+oy+I5Pyg219xHXsWsgk2Zlr7DPvvNm+H0N5kTpRQNAPs9f2Z
	BuDCaltuotCXDF605Hizw7iKqJPGFfPQekV3t+kMubJkkbNen36gYzNtA/rV8ueO
	u+46TB3OCWM+QJZEd+bOteUdkOV9KOgys0QGV8b71AIZgFe/vaW+V6YurNAxJuqH
	//yMgse3WTFIP4pn62rbD18dT64lmRlR1+9V6N/FqRIefg7zbEd730h7phEp54ti
	hF1Ibp/7f36CJSN/RtStrpYOuWS+e4MOpfbw4cfQ2u2lE9mA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011018.outbound.protection.outlook.com [52.101.52.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvkkaf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 10:01:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k19LUsWcYiDtCdqc1leK3868aFIYRtwTuoC+kxmjzslYFxDKIgphwYm0QYjQnxTxAq810jG4W08jfSiFcoQ05QGu/KXR4c5/uAHPRgo1huMZrFZ+feBkqh0twTN+y0amzxK74QNfPJvCNY8ORYnWq8oyWs3D6WIkOaGQYxOF7wY2ZPrjocKNhPE6csohhSRCMZw+jlwHgzgwPLvEAijTNRhtpXEHO3hMmCLP7hA4jzNURCg87Uta/Qr3uZPi80V5H3Vv6K4wVbEXFJOiMVfuswJTnq8UHmmhpbQlOUUXrxyrlDxv54XywKY7iX8oFBix0QV2O5B3uDFELG4umnUmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csFzsnooa2mgghCBbofdXD3GLrlGhwA9JRf43MBN/5U=;
 b=I3dJNJKIF3+363kAWL1XfV4F/OcWFLySURVDSZKcqB4G7susyFKsGVDJZyIaO1h46a7hcS0r4VmZInVKzIaTPSeiKWuw3fwwTfi1L1EFojNqcaKuRIp55Quo3UmFKRcOz3E2FfjwvuAEtxFKZaTPZ1md8xa5sj6Li4zOSD99YJgvF8Ep71uGxuW2snlSLalambwnYgphuLnwNUyJcDvvsj8ZopogjK+itag6sbP768NREKI/INtJPvc9u8PIi0sx+s4JthaWOzc0IXQfGHrlzJMv75DOB7DdRnNAqj6ji/lJRUlBH0T1wof7y4GtUcA8MeQmrhCM0TtmWyc7DUTqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DM4PR11MB6042.namprd11.prod.outlook.com (2603:10b6:8:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:01:20 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:01:20 +0000
Content-Type: multipart/alternative;
 boundary="------------llcvh6IJ7aXtLAIBHHNHnZq6"
Message-ID: <6f7e8f9d-dcf2-4129-84bb-101a7d0d98f5@windriver.com>
Date: Tue, 3 Mar 2026 18:01:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>,
        Randy MacLeod <randy.macleod@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        "Li, Changqing" <changqing.li@windriver.com>,
        "Chen, Qi" <qi.chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com>
 <TYWPR01MB118611CAA2AAC1BEC4086414ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <afd3d79d-4201-4fa7-ae3e-174702e692a3@windriver.com>
 <TYWPR01MB118617E05B1321306A4EBAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <bf03027d-1e5e-491e-8f01-6ba833ea00ec@windriver.com>
 <4976379c-144e-4863-8922-3962c4daeb21@windriver.com>
 <TYWPR01MB11861C1210F5A249BE0721E51DC7FA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <TYWPR01MB11861C1210F5A249BE0721E51DC7FA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: TYCP286CA0359.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::13) To DS0PR11MB7621.namprd11.prod.outlook.com
 (2603:10b6:8:143::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DM4PR11MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 73be819c-f615-4e7b-a9e0-08de790bd07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|14052099004|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	shk4aeUO+qf5ScrF1cATulKt5A3//sULoqyDYsesYhrWTuwyzeXwWLFkngNZgL2rvVEBNOIS7HEEelkRyhYPkn+uXpgNJyEH3UsWAYQzKOEHvXTHwJ0+QV+RAq1Et3qVRGvzcRThmaNPxRH+/Ic8odamQbI3s9aoMXLLxHoZP23bWHzlvUZSNor3is/2pjC6Fpz+bmbXELtiGqlQ7NrGiuCciQ5xRAlAl/i+d743u0qeKsZBwUX2uv2SSBpnayfmInBqXEcHcHQGK/P/4e+PhZ1yGvsIXa4DwGpk0urNi+D9N9x1RI9/chJrkeYxEeSWTl+np/wfQqCQi1W8rYNr3AsigI59N7uack9byMVKT8QEN3W1aD/mU1U2lbyetvB8eiDsSuZjwLXSob8heQvR1RAXJqPn9gjBL/Wjn3Z3/NEMaf9++m/Mh8XoUI7PMmGtpOn1AdllSgKaHHQh/6nMoUNeFJ8iqslDfFv64l1Mmj9wQ1GIZ3PtiJRSUnw5bZja2KoLe9TI905JhbP2gprmRhMu9g01qdxYr+4DG56gOxgdtaRB3BagaUOqObUwCpRdy3rKePHHqJW3jA06JpQQKpkKvo4yxNgVhb60CGTsY+AknNVVN10MCD0uqQSrWM4VDu/snq09DJjovK4yq7KnKtYL1P83OF7LPeZC8R7QVU1eg3dYe9zSyW09nCl4gDJ6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(14052099004)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SU0vY2lOd1J6QTJ1ajZKODBwTHc3RTZDTk45eXZmdlB1RjJGb2dQUEdVbHNB?=
 =?utf-8?B?VjA4Ynh3STFNd3ZBK3cxWUhadGFFQ2VXM1pzeHhkcTdUc0FKaUVxNHA5QWtq?=
 =?utf-8?B?QkZVQ0pWcEVTSHNTYVZkNXdGZlZNdXQ2cnR1RTEvOGxqZFQxcHlGNDlaWlRE?=
 =?utf-8?B?dnhqczl1SktWMVAzTStJRFNYd2svRXBhdU1WM3NUUkg4K3BtaVJsREUyMDFh?=
 =?utf-8?B?eXRid0xHL3B2MHNxeitLcW1XeWRtQ2Q2ZDNEc3YvWWNiR2YvYVV1MHhYbUFp?=
 =?utf-8?B?VXl3S1UrcTlmUjgzZVFyZXdKVHNrcDZ5bkNxaGV3ekJKQUQvSlkybTA5Kyt1?=
 =?utf-8?B?ZkZFSnFTWG9kZUJlTVBuL1E0b1NGaldtb1pObXRsMkJ6TTJZNVV2dDc5VTVk?=
 =?utf-8?B?cmVSdEx4Rk1tN1ZrQThnMVdQRWJDc1UrcXowYTEwa1NmUE01ZmgreTFYM1ZW?=
 =?utf-8?B?VXZDM1o4dXMxbGlGVUFaMTJURHhsNVdxYWlLVGRIWFY4VmVvdHN4QU9kK1Rn?=
 =?utf-8?B?VEJ0akFRU3IzS0VVY1J6ZTBLU282dldiamhPL2x3SDh6UFdyUHhYc01WblhU?=
 =?utf-8?B?OGJxeTlkSlVkVjlzelAwVXYwVEhDZVI0SGxmN1U5dmVGNDgwS2JiL05qMjZW?=
 =?utf-8?B?QVJDUm5CU1VjaTlORTN3QVhUTWwycTJnM0orMkU5RjYzUVZNcW00OC9zaklo?=
 =?utf-8?B?NTZWdzdCV1ZyM2gxYVp1VU5LL2VaTkVlYUtqS2xnNUIwTnJEWCtRSGFkT0tB?=
 =?utf-8?B?ZzNxRjVOZzlFWHdobG9rQjFlNnppL1BXUkduZkFreG9JV0NEZjhhMTQ1bk5y?=
 =?utf-8?B?bEZnV0pOV1hqakwvS28raFpNTURQc29rTk5IcGxrWEhFQ3dDYXg4Z0ZhRmE2?=
 =?utf-8?B?dzY3QWlDcVk2cTVtTC84YTBNaFVJVXJUak9KZGcrSWlKdW1majhCNE90Mlo4?=
 =?utf-8?B?dng3clhMTGxzdFptVW9kM0JOS3pFUEpnakdYUTlSN0ZNek8vWEJtZTFQWTV6?=
 =?utf-8?B?L3F0OU9PRklvZGZ5UDBjWEt4TXlPM3ZEK09kcWpqTm5tZnhGNUROUVhKUExj?=
 =?utf-8?B?dnB0aDhHdnJVRTR3U21td2dGZTFOajd1Ynl0TWNuMGdnOGpSMFgyaFdyWVkx?=
 =?utf-8?B?Qk41dEt0YWUwMkx2QWVMNW1hQi9UMWtTbktTVUlBRnEvZ3ZoZmVHQkgwMnJl?=
 =?utf-8?B?Zk45SVRPb3B2NldFUzNNQU54Wks1RWFuMWhxS1pBYkxMaWJGODdsQW54QUlR?=
 =?utf-8?B?M0ozOG9iVGoveHZsTUZFVUx6bm94d201QlFyMEZGYVBiR1ZPSVUvdU4xZkU0?=
 =?utf-8?B?K0VoTTlpTlpOU1FRNmM0WkhsdW11K1FUWFlITEZidG9COTd5eTlGWDRrNmtw?=
 =?utf-8?B?ODdLc2dqbVZ1aXJDaUo2bTJIa3FBZWJUOW5ZV3FkMVQyQzhWenlYbTQ0enNG?=
 =?utf-8?B?Z0J4Qmt6Q05taEhjYTIxVzVhNEhuODk5clc2bHlyTTZBdUUzU1JVNFQwYnZI?=
 =?utf-8?B?ekFDOHpJeWlPSVNVRWhLZ2FpSVUyTDM2VDFUSkZSdjZUL0JOK25qZG5rczRQ?=
 =?utf-8?B?N1BDUDcxZ2t0SldXTTVqZm5malRwallIVzhBWmtsVU9KTmw4d1N1UW5oY0Ra?=
 =?utf-8?B?bVpUM0ZqM0Vwa1hlUXRKajVxYStLYnRjUlUva244ZDBWZ3JvOFJkUkV3cjlU?=
 =?utf-8?B?Wi9xbTlWdTdhSTJKVWQxbUE4am96OFU5NTRKY0pQKzBiTUIzQjJpQUMyZ2Na?=
 =?utf-8?B?NXZkZXRkNWZsVWFkeTNUcVhvWURDWUxJSVorbFA0L0lEdkFyNm1EK3VSQ1RC?=
 =?utf-8?B?SEwwM1J3YVVSbldVRTBTd3UxeUpPMkhRaG10MzhCZ09KQ29FK2tUS1BMcmVU?=
 =?utf-8?B?WjZiaEJNcWtueGdMRUp3R3VRQUFodW1vajRuaEdyN3NkZjNWMm8rWDJIVnZ1?=
 =?utf-8?B?L0xYTEl1TGIyWjcydk1uN0RjbTIzSjhreFB6S29ySHdJc3ZhMHJyMkdPWE0x?=
 =?utf-8?B?N2RLbjNUdk1rOFFsREpNaCtSUlh5UHNGVHd2b1NlNzI1L0J3bXYyODFvWWRt?=
 =?utf-8?B?Z1c2YVk5N2czNWJySG5XRU9GNHpueS9HZi96WHhNL0M1bENSZitRMVg0TWlL?=
 =?utf-8?B?QmRFWXk1MXNQeFhReW16Y3ZWN21FdnQxbFlQMXFBY2YvZUZxelNxNVdjVHNm?=
 =?utf-8?B?ZjZPY0V3bGd0aUJET0wxWWVBN0laN3RXazQvbVNUVDdSUUFtWDZTTUxvVW84?=
 =?utf-8?B?ZEVyYmlqVm1nQ05nTC9VZ2JDcWFLaEl4NmwvZzlUMDg3WlNIbDErb08rbUlB?=
 =?utf-8?B?bVV6TWFqa0NjWjQ0d2tuRWFwaUlLNEZPT0hxcU9ES2czMnVkNG0vZz09?=
X-Exchange-RoutingPolicyChecked: 
	mrmn7mttcs61Xq6MBIwwtYa6Fy76f1pvAMuzZOLWdqne6RYiI9Yf0OCsf7o/ninC6QQ+yjIrXX/LlpVxAEuKC3RgfYtg9hd8aJtBg1thxIM0Pu6lU3Kc21IX0pDoXrEg6gAJhW/xZixddLj1KZxNPPcdaDc7jPCCIPejAvx4+JEmjyEOPpdk++UVdBvnwkIBb6ECSO/+F92sT087tN8sYyC71IYEgY32qJXcBBilrpngVwqUhHbYL6+X1itw9WSlyCM5cvF1ZIYvCqqIOBOiOi0MgrYqBxj9Jp+4yiBatzaVOnij+tMfGINaY4zPNEXpOQjcj9mYmtmWf+4dzp3qjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73be819c-f615-4e7b-a9e0-08de790bd07c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7621.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:01:19.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WA9P3hzOOPAKgLKOqToxtl9NcG/T8TKEGKe/xDWfjeKNWc0Y4ljdh4xhTIZbfTdqEv2YxhsbjkPDRdDEyp3UGRyX8pqzi6qsPhTqVWjNfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6042
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2jMvW4p8q8PdQsLeLInEDCwK5xWBMpZq
X-Proofpoint-ORIG-GUID: iNNMCAE8YVK2Czdqz9AM-0z1SGVLisqt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NiBTYWx0ZWRfX2ST/Po/IZ9oD
 PT0YGye0OqIu2LRAaURME7sWFB2Zpn5q4v9IKu8KeMnXZREmiZTJxy9mq8E2ZiejCHe4V7ZPzpo
 UA9Q2puUQwRsLB7O5qJN0Jgvb9k5OmJb6w5gRNDKvykeHskk6IZZT7QHZFCMF+1/oq4e6ooK55i
 zVm64fFNsSK4SHF3TlIp48GYc7WJWsMHwHChIa5v7/PsRsCIGndnRU1qye4LNUqPYp7A/FqJ4jA
 VG4UflGxnJpx03QsDD6q//kQvJXahbNCv92A68Jkg9SB1bWfaQ+jiKJ7Vgg4n7mA1C0EfyWJdAb
 I32Bw81//FGNQqTM+CjZ/WYU29Y3s37GYDHD5Wq6s5c46sRYEzUHrV2/F3Zn63l3wpcsjjmCvwQ
 EV+frZUFtJt1R9QaAt6Ej6Labmp5qZfjith0/GUTs+2Fue0KTTQce+tfbNxLGNh1X2YwTQBIPkY
 ED/WnJ8rFE1yZp9R7Pg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a6b175 cx=c_pps
 a=gE6CMw9pMCRGQsgsFAL45Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=omOdbC7AAAAA:8
 a=VwQbUJbxAAAA:8 a=B8ibFTVmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=0zhiEtMHAAAA:8 a=NEAV23lmAAAA:8
 a=3ViNv_p-1h_zH1-9N0EA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=hAJevWc4HUFfkotkajkA:9
 a=J7vACx2hTwxid-7R:21 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=_W_S_7VecoQA:10
 a=xvSgdcfEVHFitugM1GHH:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=v7CeC1Rd8Ef7gCqLsajQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232274

--------------llcvh6IJ7aXtLAIBHHNHnZq6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6234jXSi3714068

For 31-55, there are 25 recipes,

1. I've upgraded 18 of them and sent patches for review,

2. 6 recipes has already been upgraded by other contributors,

- zlib
- python3-wcwidth
- python3-rdflib
- python3-poetry-core
- python3-maturin
- glib-2.0

3. Drop openssl upgrade, 3.6.1 is not LTS release and 3.5.5 is already=20
newest LTS

- openssl: upgrade 3.5.5 -> 3.6.1

//Hongxu


On 3/3/26 17:42, Mingyu Wang (Fujitsu) wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
> The following two have already been submitted for upgrade by other=20
> contributors.:
>
> rpm-sequoia
>
> wireless-regdb
>
> The following three are still under investigation due to build errors.:
>
> Librsvg
>
> Libadwaita
>
> gtk4
>
> The following two are temporarily held back from upgrading because=20
> they need to be upgraded together, and the upstream of=20
> gstreamer1.0-vaapi has not yet been updated to the latest version.:
>
> gstreamer1.0-vaapi
>
> gstreamer1.0
>
> The others are upgraded to latest version and submitted.
>
> --
>
> Best Regards
>
> ---------------------------------------------------
>
> Wang Mingyu
>
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
> No.6 Wenzhu Road, Nanjing, 210012, China
>
> TEL=EF=BC=9A+86+25-86630566--8568
>
> COINS: 79988548
>
> FAX: +86+25-83317685
>
> MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>
> *From:*Hongxu Jia <hongxu.jia@windriver.com>
> *Sent:* Monday, March 2, 2026 2:56 PM
> *To:* Randy MacLeod <randy.macleod@windriver.com>; Wang,=20
> Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.com>; Alexander Kanav=
in=20
> <alex.kanavin@gmail.com>; Li, Changqing <changqing.li@windriver.com>;=20
> Chen, Qi <qi.chen@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0=20
> SUCCEEDED
>
> On 2/27/26 21:57, Randy MacLeod wrote:
>
>     On 2026-02-26 8:53 p.m., Mingyu Wang (Fujitsu) wrote:
>
>         =EF=82=B7=C2=A0 Should we prioritize upgrading the successful o=
nes first
>         and deal with the failed ones later?
>
>     Changqing, Qi and I are doing most of the AUH FAILED recipes.
>     If you'd like to do some as well, just say so.
>
>         If so, there are about 60 in total. Should I take the first 30
>
>     Sure, first 30 is fine. (1)
>
>     Hongxu, Qi, Changqing,
>     Will you review and do 31-55 ?
>
> Sure, I am working on 31-55 and will send patches before March 6
>
> //Hongxu
>
>         =C2=A0or the last 30?
>
>         =EF=82=B7=C2=A0 What is the deadline?
>
>     The 6.0-M3 build date (2) is Monday, March 9 so the deadline for
>     major updates is next week (March 2-6),
>
>     earlier the better.
>
>     Note that openssl will remain at v 3.5.x since that's an openssl
>     LTS release.
>
>     Thanks,
>
>     ../Randy
>
>     1)
>
>     from:
>     https://lore.kernel.org/openembedded-core/?q=3Ds%3AAUH+AND+s%3ASUCC=
EEDED+AND+d%3A2026-02-18
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/?q=3Ds*3AAUH*AND*s*3ASUCCEEDED*AND*d*3A2026-02-18__;JSsrJSsrJQ!!AjveY=
dw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgon=
MpKdM3HMbC3y8Tsjt8$>
>
>     1. *[AUH] vulkan-samples: upgrading to
>     3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efc92-2a644a4d-6491-4e40-8256-d47ae154c19a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC39KhrOHe$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [93%]
>
>     2. *[AUH] xorgproto: upgrading to 2025.1 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efd45-87be0bf6-c07c-45fd-918c-46213772c1a9-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC31pAebEq$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [85%]
>
>     3. *[AUH] libtraceevent: upgrading to 1.9.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efd67-f015fd77-3e1c-440a-8e5f-3fa1adcc6db8-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3yCbbHAc$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [71%]
>
>     4. *[AUH] librsvg: upgrading to 2.61.4 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ef9c0-c37255a9-2afe-4bfe-92cf-d0cf08eabeb8-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC32-aK22n$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [23%]
>
>     5. *[AUH] gstreamer1.0: upgrading to 1.28.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f0596-80b51276-f911-432e-aca5-2a096f3b683b-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC33ZtkEol$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [21%]
>
>     6. *[AUH] libadwaita: upgrading to 1.8.4 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efa26-30b70cf6-eadc-4bd7-aff2-fbde8c08bd45-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC36M4TdxS$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [6%]
>
>     7. *[AUH] wireless-regdb: upgrading to 2026.02.04 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efefb-70cdcf59-5cfe-4743-9d80-3dd85045bd1a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3-tkZGNn$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [88%]
>
>     8. *[AUH] hwdata: upgrading to 0.404 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f07cf-6767e43b-a52b-4d18-98ee-40d76d5fecea-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3zQl39Pv$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [86%]
>
>     9. *[AUH] sbc: upgrading to 2.2 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f057e-b288e732-e0b1-4740-8a59-bb2c4721cc3a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC35iuMGnt$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [78%]
>
>     10. *[AUH] libpng: upgrading to 1.6.55 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f049d-80a54c02-68dd-42cd-9d2d-79794522e22e-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3_UMBzlv$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [74%]
>
>     11. *[AUH] spirv-llvm-translator: upgrading to 21.1.4 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efc92-79e79fb7-4425-41ff-8ac6-4cadd283268a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3yTXqvUm$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [73%]
>
>     12. *[AUH] p11-kit: upgrading to 0.26.2 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f0d63-15862410-e834-4522-9f92-27b1b7061aee-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3_zoaGyX$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [36%]
>
>     13. *[AUH] gstreamer1.0-vaapi: upgrading to 1.26.10 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f05ca-7c385378-8f46-4e71-a768-f1d79c5a2b96-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34ObR3iP$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [10%]
>
>     14. *[AUH] diffoscope: upgrading to 312 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f076c-b5fb3143-993f-4eac-9026-84108f2d417c-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3xPqp649$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [81%]
>
>     15. *[AUH] enchant2: upgrading to 2.8.15 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f076a-186fde78-b3a0-45cd-8146-01a7031d4eb0-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3zHnF4lX$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [77%]
>
>     16. *[AUH] libxmlb: upgrading to 0.3.25 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ef9f3-9dc752f6-8d21-4281-8c8f-a327e92979a2-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC33wRXtIw$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [73%]
>
>     17. *[AUH] taglib: upgrading to 2.2 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f0e87-1584c681-c112-4ccc-9210-f93ebc34d917-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC31yW_8X5$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [45%]
>
>     18. *[AUH] libgpg-error: upgrading to 1.59 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f09da-8ad9c535-9164-44c7-8a11-f850c20d6433-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC36AbXxrG$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [42%]
>
>     19. *[AUH] libsoup: upgrading to 3.6.6 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720f0cef-41fcba72-3f31-406a-a0aa-efad029519bc-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC30FgInb8$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [39%]
>
>     20. *[AUH] gtk4: upgrading to 4.20.3 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720efb38-0e0ae483-959f-4e4a-962f-1a4f9094cacc-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3z7KlL4V$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [3%]
>
>     21. *[AUH] rpm-sequoia-crypto-policy: upgrading to
>     f3f5fa454345b03039ee3d904964fc14829637ce SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee8c4-1326c100-1227-44cf-aa45-b611809bcaf8-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3xDlg8mh$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [99%]
>
>     22. *[AUH] rpm-sequoia: upgrading to 1.10.1 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720eec05-fafadaa6-b5b2-4f6e-a03d-f32a637ce76a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC375sc9Re$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [13%]
>
>     23. *[AUH] fastfloat: upgrading to 8.2.3 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed3a7-50032806-5070-42f5-b052-81c743a6e20a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC31oOtUTD$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [86%]
>
>     24. *[AUH] ttyrun: upgrading to 2.41.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ecf1b-045c38a9-72cb-43e0-992c-0f95c4a363b8-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC31jAZidB$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [84%]
>
>     25. *[AUH] ed: upgrading to 1.22.5 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720eefb6-5503fe20-6e22-4ca3-92d3-61e465568822-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3-VEMGy7$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [84%]
>
>     26. *[AUH] libuv: upgrading to 1.52.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec780-9a3b8a18-6b4d-489e-afbb-1fe42d50ea1b-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3zx3JAGh$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [81%]
>
>     27. *[AUH] less: upgrading to 692 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720eef19-1f0dbf2e-85ca-4a23-b82b-6386cf40820a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34HOKgDC$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [73%]
>
>     28. *[AUH] ccache: upgrading to 4.12.3 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed245-3ba8458b-7064-49f5-a6bb-edb8295f35ae-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC36qLrls-$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [67%]
>
>     29. *[AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.1,0.9.1
>     SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec5f6-8ae46777-3b7e-46c5-8ba3-c82106bd8312-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC37UOnPIc$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [55%]
>
>     30. *[AUH] libx11,libfontenc: upgrading to 1.8.13,1.1.9 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec568-78714733-d55b-4bab-a2ec-abbcd8f4b599-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC31uU3uo5$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [47%]
>
>     -------------------------------------------------------------------=
---------------------------
>
>     31. *[AUH] ell: upgrading to 0.82 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ecf45-43f50ef5-8b79-4cbd-9089-7d80b9631d72-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC39fmAYkm$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [15%]
>
>     32. *[AUH] font-alias: upgrading to 1.0.6 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec439-848d68dc-4c90-4645-9999-2e97cd69ae30-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC36CGiQ6s$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [86%]
>
>     33. *[AUH] python3-markdown: upgrading to 3.10.2 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed968-18664721-e3f0-46cf-ad90-20360651118b-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3_G4A9UR$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [78%]
>
>     34. *[AUH] gn: upgrading to
>     9d19a7870add65151ff91bcc26252bb7521065cf SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed760-810dfe91-0557-4084-a56c-85eae3d063ed-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34iqQqeU$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [55%]
>
>     35. *[AUH] python3-cryptography-vectors,python3-cryptography:
>     upgrading to 46.0.5,46.0.5 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec412-e2eaf0f8-882b-48c9-8903-0d11c7b57e89-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC39ldogCn$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [44%]
>
>     36. *[AUH] ncurses: upgrading to 6.6 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ecf0b-976a5a4a-4399-4b36-ac4c-e46263c3d9d4-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC33umb8Or$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [33%]
>
>     37. *[AUH] btrfs-tools: upgrading to 6.19 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed1a2-4fde9b9f-9c8d-4c4c-afa1-073bfc465527-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3w4jDxIn$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [16%]
>
>     38. *[AUH] openssl: upgrading to 3.6.1 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ecad9-289adab8-0384-4f80-84c3-984eb261e560-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3yxYs5YE$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [9%]
>
>     39. *[AUH] zlib: upgrading to 1.3.2 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed212-3bcc8dde-0640-4d2d-8054-e8e60ecbf04d-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3x5Mf2pi$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [9%]
>
>     40. *[AUH] connman: upgrading to 2.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec958-2397828f-7c04-4eb4-ac3e-ef4cd75579b1-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC38NwxpHB$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [5%]
>
>     41. *[AUH] xauth: upgrading to 1.1.5 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ec3d9-fbc6621a-a0d5-4800-94df-bb6a03cf2443-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC37tAKPuL$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [83%]
>
>     42. *[AUH] python3-testtools: upgrading to 2.8.3 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee3c2-d28e1975-179b-4b55-860c-e09ad43167f8-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC346OFYP9$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [77%]
>
>     43. *[AUH] python3-xmltodict: upgrading to 1.0.3 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee886-e523bc47-c9dc-4dc0-9a5a-f2d61344fd24-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3xR9OFEN$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [76%]
>
>     44. *[AUH] python3-pyproject-metadata: upgrading to 0.11.0
>     SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720edd35-9236884d-27e6-45a0-ba5e-e34afa46938f-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC32xBJjLe$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [73%]
>
>     45. *[AUH] python3-hypothesis: upgrading to 6.151.9 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ed94c-2009b040-525b-4ab2-9613-40999971f57a-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC340ReldE$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [69%]
>
>     46. *[AUH] python3-wcwidth: upgrading to 0.6.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee68b-95243140-644b-462f-8dd3-df2ef0d5f97b-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC38I6sx48$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [66%]
>
>     47. *[AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3xzROzZ4$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [60%]
>
>     48. *[AUH] python3-trove-classifiers: upgrading to 2026.1.14.14
>     SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee4f4-beb714ed-883c-433e-a890-db8952300533-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3-1M9bRs$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [58%]
>
>     49. *[AUH] python3-pycparser: upgrading to 3.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720edd0d-c84824a7-f959-4f88-ba0f-6ee99b384e06-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34UsH8kx$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [52%]
>
>     50. *[AUH] python3-pip: upgrading to 26.0.1 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720edbdf-8b775dee-95ce-4959-b25d-0036f159e806-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34MAERRG$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [27%]
>
>     51. *[AUH] python3-poetry-core: upgrading to 2.3.1 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ede90-4a44d733-8ffb-40a2-876c-a9f925ab73e9-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3y-6zsOo$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [18%]
>
>     52. *[AUH] python3-uv-build: upgrading to 0.10.4 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee748-45965cc5-3c70-4c94-adbe-01a1c9e65852-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC38cQfdpR$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [13%]
>
>     53. *[AUH] python3-maturin: upgrading to 1.12.2 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ede9c-79777fa3-222b-491b-b353-f1dffbdc4e95-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3zZ1bB6N$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [10%]
>
>     54. *[AUH] python3-setuptools: upgrading to 82.0.0 SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ee6c6-e45fb965-bd06-42ab-8623-4f7aa90bb139-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC39STQ3xV$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [8%]
>
>     55. *[AUH] glib-2.0-initial,glib-2.0: upgrading to 2.86.4,2.86.4
>     SUCCEEDED*
>     <https://urldefense.com/v3/__https://lore.kernel.org/openembedded-c=
ore/0101019c720ead92-1bd0d0ba-9fff-4d9f-8682-fd339a3c6cfb-000000@us-west-=
2.amazonses.com/__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ul=
aAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34ApwRYm$>
>
>     =C2=A0=C2=A0=C2=A0 - by auh @ 2026-02-18 18:41 UTC [15%]
>
>     2)
>
>     From the Yocto Status email:
>
>     - YP 6.0 M3 Build Date 2026-03-09
>
>     - YP 6.0 M3 Release Date 2026-03-20
>
>     - YP 6.0 M4 Build Date 2026-03-30
>
>     - YP 6.0 M4 Release Date 2026-04-26
>
>         =C2=A0--
>
>         Best Regards
>
>         ---------------------------------------------------
>
>         Wang Mingyu
>
>         FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
>         No.6 Wenzhu Road, Nanjing, 210012, China
>
>         TEL=EF=BC=9A+86+25-86630566--8568
>
>         COINS: 79988548
>
>         FAX: +86+25-83317685
>
>         MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>
>         *From:*Randy MacLeod <randy.macleod@windriver.com>
>         <mailto:randy.macleod@windriver.com>
>         *Sent:* Thursday, February 26, 2026 10:26 PM
>         *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujitsu.c=
om>
>         <mailto:wangmy@fujitsu.com>; Alexander Kanavin
>         <alex.kanavin@gmail.com> <mailto:alex.kanavin@gmail.com>
>         *Cc:* openembedded-core@lists.openembedded.org
>         <mailto:openembedded-core@lists.openembedded.org>; Jia, Hongxu
>         <Hongxu.Jia@windriver.com> <mailto:Hongxu.Jia@windriver.com>
>         *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading to
>         7.6.0 SUCCEEDED
>
>         On 2026-02-25 10:14 p.m., Mingyu Wang (Fujitsu) wrote:
>
>             I've also been on vacation since 2.18 and just returned to
>             work. I'll handle the python3-rdflib upgrade.
>
>         Thanks Wangmy and I hope you had a good vacation.
>
>         The bigger question is the > 50 packages that AUH managed to
>         upgrade.
>
>         Will you also do most of them or would you like to split this
>         list with Hongxu/Qi/ etc?
>         If you want to split it, please reply with the packages you
>         will do.
>
>         Thanks,
>
>         ../Randy
>
>             =C2=A0--
>
>             Best Regards
>
>             ---------------------------------------------------
>
>             Wang Mingyu
>
>             FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
>
>             No.6 Wenzhu Road, Nanjing, 210012, China
>
>             TEL=EF=BC=9A+86+25-86630566--8568
>
>             COINS: 79988548
>
>             FAX: +86+25-83317685
>
>             MAIL: wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>
>
>             *From:*Randy MacLeod <randy.macleod@windriver.com>
>             <mailto:randy.macleod@windriver.com>
>             *Sent:* Wednesday, February 25, 2026 12:42 AM
>             *To:* Wang, Mingyu/=E7=8E=8B=E9=B8=A3=E7=91=9C<wangmy@fujit=
su.com>
>             <mailto:wangmy@fujitsu.com>; Alexander Kanavin
>             <alex.kanavin@gmail.com> <mailto:alex.kanavin@gmail.com>
>             *Cc:* openembedded-core@lists.openembedded.org
>             <mailto:openembedded-core@lists.openembedded.org>; Jia,
>             Hongxu <Hongxu.Jia@windriver.com>
>             <mailto:Hongxu.Jia@windriver.com>
>             *Subject:* Re: [OE-core] [AUH] python3-rdflib: upgrading
>             to 7.6.0 SUCCEEDED
>
>             Hello Wang, and everyone,
>
>             Alex mentioned in the YP tech call today that he's on
>             vacation starting tomorrow, iirc.
>
>             Alex,
>             =C2=A0 =C2=A0 I assume that you won't be sending a patch se=
ries for
>             the succeeding AUH upgrades.
>
>             Wang,
>             =C2=A0 =C2=A0Have you or do you plan to work on that?
>
>             If not, Hongxu and maybe others at WR will work on that.
>             I'm going to focus on the failed AUH upgrade set of recipes.
>
>             ../Randy
>
>             On 2026-02-18 1:41 p.m., Auto Upgrade Helper via
>             lists.openembedded.org
>             <https://urldefense.com/v3/__http:/lists.openembedded.org__=
;!!AjveYdw8EvQ!cC2WyezAalR6UZOZ07BsaBry1ZouLbKpeZ9nmC_s0Z9sWMH3AU12RFCRUC=
7BKKlhQzHFJRMeHgUCGuPSquz_VA$>
>             wrote:
>
>                 Hello,
>
>                 this email is a notification from the Auto Upgrade Help=
er
>
>                 that the automatic attempt to upgrade the recipe(s)
>                 *python3-rdflib* to *7.6.0* has Succeeded.
>
>                 Next steps:
>
>                 =C2=A0=C2=A0=C2=A0 - apply the patch: git am
>                 0001-python3-rdflib-upgrade-7.5.0-7.6.0.patch
>
>                 =C2=A0=C2=A0=C2=A0 - check the changes to upstream patc=
hes and
>                 summarize them in the commit message,
>
>                 =C2=A0=C2=A0=C2=A0 - compile an image that contains the=
 package
>
>                 =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
>
>                 =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: g=
it commit -s
>                 --reset-author --amend
>
>                 =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing=
 list
>
>                 Alternatively, if you believe the recipe should not be
>                 upgraded at this time,
>
>                 you can fill RECIPE_NO_UPDATE_REASON in respective
>                 recipe file so that
>
>                 automatic upgrades would no longer be attempted.
>
>                 Please review the attached files for further
>                 information and build/update failures.
>
>                 Any problem please file a bug at
>                 https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler
>                 <https://urldefense.com/v3/__https://bugzilla.yoctoproj=
ect.org/enter_bug.cgi?product=3DAutomated*20Update*20Handler__;JSU!!AjveY=
dw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgon=
MpKdM3HMbC37MoPwkk$>
>
>                 Regards,
>
>                 The Upgrade Helper
>
>                 -- >8 --
>
>                 From 6a230684782cbe47a4f0e5fe6c2268da57091fea Mon Sep
>                 17 00:00:00 2001
>
>                 From: Upgrade Helper <auh@yoctoproject.org>
>                 <mailto:auh@yoctoproject.org>
>
>                 Date: Wed, 18 Feb 2026 13:46:27 +0000
>
>                 Subject: [PATCH] python3-rdflib: upgrade 7.5.0 -> 7.6.0
>
>                 ---
>
>                 ...dflib_7.5.0.bb
>                 <https://urldefense.com/v3/__http://dflib_7.5.0.bb__;!!=
AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEi=
WEgonMpKdM3HMbC3xlObILc$>
>                 =3D> python3-rdflib_7.6.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.6.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC38HynWeo$>}
>                 | 25 +++++++++++++++++--
>
>                 1 file changed, 23 insertions(+), 2 deletions(-)
>
>                 rename
>                 meta/recipes-devtools/python/{python3-rdflib_7.5.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.5.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC358ngJMk$>
>                 =3D> python3-rdflib_7.6.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.6.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC38HynWeo$>}
>                 (34%)
>
>                 diff --git
>                 a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.5.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC358ngJMk$>
>                 b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.6.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC38HynWeo$>
>
>                 similarity index 34%
>
>                 rename from
>                 meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.5.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC358ngJMk$>
>
>                 rename to
>                 meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.6.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC38HynWeo$>
>
>                 index e421aa2bac..1b830e8aa9 100644
>
>                 ---
>                 a/meta/recipes-devtools/python/python3-rdflib_7.5.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.5.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC358ngJMk$>
>
>                 +++
>                 b/meta/recipes-devtools/python/python3-rdflib_7.6.0.bb
>                 <https://urldefense.com/v3/__http://python3-rdflib_7.6.=
0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZK=
RR9CZLTEiWEgonMpKdM3HMbC38HynWeo$>
>
>                 @@ -1,10 +1,31 @@
>
>                 +# FIXME: the LIC_FILES_CHKSUM values have been
>                 updated by 'devtool upgrade'.
>
>                 +# The following is the difference between the old and
>                 the new license text.
>
>                 +# Please update the LICENSE value if needed, and
>                 summarize the changes in
>
>                 +# the commit message via 'License-Update:' tag.
>
>                 +# (example: 'License-Update: copyright years updated.'=
)
>
>                 +#
>
>                 +# The changes:
>
>                 +#
>
>                 +# --- LICENSE
>
>                 +# +++ LICENSE
>
>                 +# @@ -1,6 +1,6 @@
>
>                 +#=C2=A0 BSD 3-Clause License
>
>                 +#
>
>                 +# -Copyright (c) 2002-2025, RDFLib Team
>
>                 +# +Copyright (c) 2002-2026, RDFLib Team
>
>                 +#=C2=A0 All rights reserved.
>
>                 +#
>
>                 +#=C2=A0 Redistribution and use in source and binary fo=
rms,
>                 with or without
>
>                 +#
>
>                 +#
>
>                 +
>
>                 SUMMARY =3D "RDFLib is a pure Python package for workin=
g
>                 with RDF"
>
>                 HOMEPAGE =3D "https://github.com/RDFLib/rdflib"
>                 <https://urldefense.com/v3/__https://github.com/RDFLib/=
rdflib__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2Toc=
ZKRR9CZLTEiWEgonMpKdM3HMbC33M9iwZP$>
>
>                 SECTION =3D "devel/python"
>
>                 LICENSE =3D "BSD-3-Clause"
>
>                 -LIC_FILES_CHKSUM =3D
>                 "file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c"
>                 <file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c>
>
>                 +LIC_FILES_CHKSUM =3D
>                 "file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e"
>                 <file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e>
>
>                 -SRC_URI[sha256sum] =3D
>                 "663083443908b1830e567350d72e74d9948b310f827966358d76ee=
bdc92bf592"
>
>                 +SRC_URI[sha256sum] =3D
>                 "6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c06455d00d=
6d0ea379df"
>
>                 =C2=A0inherit pypi python_poetry_core
>
>
>
>
>
>                 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>                 Links: You receive all messages sent to this group.
>
>                 View/Reply Online (#231360):
>                 https://lists.openembedded.org/g/openembedded-core/mess=
age/231360
>                 <https://urldefense.com/v3/__https://lists.openembedded=
.org/g/openembedded-core/message/231360__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaD=
o46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3w81LnA3$>
>
>                 Mute This Topic:
>                 https://lists.openembedded.org/mt/117879875/3616765
>                 <https://urldefense.com/v3/__https://lists.openembedded=
.org/mt/117879875/3616765__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4=
U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC35_WRQpX$>
>
>                 Group Owner:
>                 openembedded-core+owner@lists.openembedded.org
>
>                 Unsubscribe:
>                 https://lists.openembedded.org/g/openembedded-core/unsu=
b
>                 <https://urldefense.com/v3/__https://lists.openembedded=
.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbi=
wZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34088K_9$>
>                 [randy.macleod@windriver.com]
>
>                 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>             --=20
>
>             # Randy MacLeod
>
>             # Wind River Linux
>
>         --=20
>
>         # Randy MacLeod
>
>         # Wind River Linux
>
>     --=20
>
>     # Randy MacLeod
>
>     # Wind River Linux
>

--------------llcvh6IJ7aXtLAIBHHNHnZq6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6234jXSi3714068

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">For 31-55, there are 25 recipes,<br>
      <br>
      1. I've upgraded 18 of them and sent patches for review,<br>
      <br>
      2. 6 recipes has already been upgraded by other contributors, <br>
      <br>
      - zlib<br>
      - python3-wcwidth<br>
      - python3-rdflib<br>
      - python3-poetry-core<br>
      - python3-maturin<br>
      - glib-2.0<br>
      <br>
      3. Drop openssl upgrade, 3.6.1 is not LTS release and 3.5.5 is
      already newest LTS<br>
      <br>
      - openssl: upgrade 3.5.5 -&gt; 3.6.1<br>
      <br>
      //Hongxu<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 3/3/26 17:42, Mingyu Wang (Fujitsu)
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:TYWPR01MB11861C1210F5A249BE0721=
E51DC7FA@TYWPR01MB11861.jpnprd01.prod.outlook.com">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered med=
ium)">
      <style>@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"\@MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F =E5=AD=97=E7=AC=
=A6";
	margin:0cm;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}span.HTML
	{mso-style-name:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F =E5=AD=97=E7=AC=
=A6";
	mso-style-priority:99;
	mso-style-link:"HTML =E9=A2=84=E8=AE=BE=E6=A0=BC=E5=BC=8F";
	font-family:"Courier New";}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:=E7=AD=89=E7=BA=BF;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}div.WordSection1
	{page:WordSection1;}</style>
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div class=3D"WordSection1">
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">The following two
              have already been submitted for upgrade by other
              contributors.:<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">rpm-sequoia<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">wireless-regdb<o:p></o:p></span></=
p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">The following
              three are still under investigation due to build errors.:<o=
:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">Librsvg<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">Libadwaita<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">gtk4<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">The following two
              are temporarily held back from upgrading because they need
              to be upgraded together, and the upstream of
              gstreamer1.0-vaapi has not yet been updated to the latest
              version.:<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">gstreamer1.0-vaapi<o:p></o:p></spa=
n></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">gstreamer1.0<o:p></o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF">The others are
              upgraded to latest version and submitted.<o:p></o:p></span>=
</p>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <div>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">--<o:p></o:=
p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Best
                Regards<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">-----------=
----------------------------------------<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Wang
                Mingyu<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FUJITSU
                NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<o:p></o:p></=
span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">No.6
                Wenzhu Road, Nanjing, 210012, China<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">TEL</span><=
span style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-liga=
tures:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-86630566--=
8568<o:p></o:p></span></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">COINS:
                79988548<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FAX:
                +86+25-83317685<o:p></o:p></span></p>
            <p class=3D"MsoNormal" style=3D"text-align:justify;text-justi=
fy:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">MAIL:
              </span><span lang=3D"EN-US"><a href=3D"mailto:wangmy@fujits=
u.com" moz-do-not-send=3D"true"><span style=3D"font-size:10.5pt;font-fami=
ly:&quot;MS Mincho&quot;;color:#0563C1;mso-ligatures:standardcontextual">=
wangmy@fujitsu.com</span></a></span><span lang=3D"EN-US" style=3D"font-si=
ze:10.5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontext=
ual"><o:p></o:p></span></p>
          </div>
          <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:=
10.5pt;font-family:=E7=AD=89=E7=BA=BF"><o:p>&nbsp;</o:p></span></p>
          <div style=3D"border:none;border-left:solid blue 1.5pt;padding:=
0cm 0cm 0cm 4.0pt">
            <div>
              <div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;pa=
dding:3.0pt 0cm 0cm 0cm">
                <p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"f=
ont-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span><=
/b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calib=
ri&quot;,sans-serif">
                    Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
                    <br>
                    <b>Sent:</b> Monday, March 2, 2026 2:56 PM<br>
                    <b>To:</b> Randy MacLeod
                    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ran=
dy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>; Wang, =
Mingyu/</span><span style=3D"font-size:11.0pt">=E7=8E=8B</span><span styl=
e=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                  </span><span style=3D"font-size:11.0pt">=E9=B8=A3=E7=91=
=9C</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif">
                    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:wan=
gmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>; Alexander Kanavin
                    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ale=
x.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>; Li, Changqing
                    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>; Chen, Qi
                    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:qi.=
chen@windriver.com">&lt;qi.chen@windriver.com&gt;</a><br>
                    <b>Cc:</b> <a class=3D"moz-txt-link-abbreviated" href=
=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-core@li=
sts.openembedded.org</a><br>
                    <b>Subject:</b> Re: [OE-core] [AUH] python3-rdflib:
                    upgrading to 7.6.0 SUCCEEDED<o:p></o:p></span></p>
              </div>
            </div>
            <p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p>=
</span></p>
            <div>
              <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2/27/26 21:5=
7,
                  Randy MacLeod wrote:<o:p></o:p></span></p>
            </div>
            <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
              <div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US">On 2026-02-26
                    8:53 p.m., Mingyu Wang (Fujitsu) wrote:<o:p></o:p></s=
pan></p>
              </div>
              <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
                <p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;fo=
nt-family:=E7=AD=89=E7=BA=BF">=EF=82=B7<span lang=3D"EN-US">&nbsp; Should=
 we prioritize upgrading the
                      successful ones first and deal with the failed
                      ones later?&nbsp;</span></span><span lang=3D"EN-US"=
><o:p></o:p></span></p>
              </blockquote>
              <p class=3D"MsoNormal"><span lang=3D"EN-US">Changqing, Qi a=
nd
                  I are doing most of the AUH FAILED recipes.<br>
                  If you'd like to do some as well, just say so. <o:p></o=
:p></span></p>
              <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
                <p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span=
 lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF"=
>If
                    so, there are about 60 in total. Should I take the
                    first 30</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
              </blockquote>
              <p><span lang=3D"EN-US">Sure, first 30 is fine. (1)<o:p></o=
:p></span></p>
              <p style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">Hong=
xu,
                  Qi, Changqing,&nbsp;<br>
                  Will you review and do 31-55 ?<o:p></o:p></span></p>
            </blockquote>
            <p><span lang=3D"EN-US">Sure, I am working on 31-55 and will
                send patches before March 6<o:p></o:p></span></p>
            <p><span lang=3D"EN-US">//Hongxu<o:p></o:p></span></p>
            <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
              <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
                <p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span=
 lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF"=
>&nbsp;or
                    the last 30?
                  </span><span lang=3D"EN-US"><o:p></o:p></span></p>
                <p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;fo=
nt-family:=E7=AD=89=E7=BA=BF">=EF=82=B7<span lang=3D"EN-US">&nbsp; What i=
s the deadline?</span></span><span lang=3D"EN-US"><o:p></o:p></span></p>
              </blockquote>
              <p class=3D"MsoNormal"><span lang=3D"EN-US">The 6.0-M3 buil=
d
                  date (2) is Monday, March 9 so the deadline for major
                  updates is next week (March 2-6),<o:p></o:p></span></p>
              <p><span lang=3D"EN-US">earlier the better.<br>
                  <br>
                  Note that openssl will remain at v 3.5.x since that's
                  an openssl LTS release.<o:p></o:p></span></p>
              <p><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
              <p><span lang=3D"EN-US">../Randy<o:p></o:p></span></p>
              <p><span lang=3D"EN-US">1)<o:p></o:p></span></p>
              <p><span lang=3D"EN-US">from: <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/?q=3Ds*3AAUH*AND*s*3A=
SUCCEEDED*AND*d*3A2026-02-18__;JSsrJSsrJQ!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo=
46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3y8Tsjt8$" moz-=
do-not-send=3D"true">
https://lore.kernel.org/openembedded-core/?q=3Ds%3AAUH+AND+s%3ASUCCEEDED+=
AND+d%3A2026-02-18</a><o:p></o:p></span></p>
              <pre><span lang=3D"EN-US"> 1. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efc92-2a64=
4a4d-6491-4e40-8256-d47ae154c19a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC39KhrOHe$" moz-do-not-send=3D"true"><b>[AUH] vulkan-samples: u=
pgrading to 3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad SUCCEEDED</b></a><o:=
p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [93%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 2. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efd45-87be=
0bf6-c07c-45fd-918c-46213772c1a9-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC31pAebEq$" moz-do-not-send=3D"true"><b>[AUH] xorgproto: upgrad=
ing to 2025.1 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [85%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 3. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efd67-f015=
fd77-3e1c-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3yCbbHAc$" moz-do-not-send=3D"true"><b>[AUH] libtraceevent: up=
grading to 1.9.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [71%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 4. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ef9c0-c372=
55a9-2afe-4bfe-92cf-d0cf08eabeb8-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC32-aK22n$" moz-do-not-send=3D"true"><b>[AUH] librsvg: upgradin=
g to 2.61.4 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [23%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 5. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f0596-80b5=
1276-f911-432e-aca5-2a096f3b683b-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC33ZtkEol$" moz-do-not-send=3D"true"><b>[AUH] gstreamer1.0: upg=
rading to 1.28.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [21%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 6. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efa26-30b7=
0cf6-eadc-4bd7-aff2-fbde8c08bd45-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC36M4TdxS$" moz-do-not-send=3D"true"><b>[AUH] libadwaita: upgra=
ding to 1.8.4 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [6%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 7. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efefb-70cd=
cf59-5cfe-4743-9d80-3dd85045bd1a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3-tkZGNn$" moz-do-not-send=3D"true"><b>[AUH] wireless-regdb: u=
pgrading to 2026.02.04 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [88%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 8. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f07cf-6767=
e43b-a52b-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3zQl39Pv$" moz-do-not-send=3D"true"><b>[AUH] hwdata: upgrading=
 to 0.404 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [86%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US"> 9. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f057e-b288=
e732-e0b1-4740-8a59-bb2c4721cc3a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC35iuMGnt$" moz-do-not-send=3D"true"><b>[AUH] sbc: upgrading to=
 2.2 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [78%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">10. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f049d-80a5=
4c02-68dd-42cd-9d2d-79794522e22e-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3_UMBzlv$" moz-do-not-send=3D"true"><b>[AUH] libpng: upgrading=
 to 1.6.55 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [74%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">11. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efc92-79e7=
9fb7-4425-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3yTXqvUm$" moz-do-not-send=3D"true"><b>[AUH] spirv-llvm-transl=
ator: upgrading to 21.1.4 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [73%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">12. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f0d63-1586=
2410-e834-4522-9f92-27b1b7061aee-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3_zoaGyX$" moz-do-not-send=3D"true"><b>[AUH] p11-kit: upgradin=
g to 0.26.2 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [36%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">13. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f05ca-7c38=
5378-8f46-4e71-a768-f1d79c5a2b96-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC34ObR3iP$" moz-do-not-send=3D"true"><b>[AUH] gstreamer1.0-vaap=
i: upgrading to 1.26.10 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [10%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">14. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f076c-b5fb=
3143-993f-4eac-9026-84108f2d417c-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3xPqp649$" moz-do-not-send=3D"true"><b>[AUH] diffoscope: upgra=
ding to 312 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [81%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">15. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f076a-186f=
de78-b3a0-45cd-8146-01a7031d4eb0-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3zHnF4lX$" moz-do-not-send=3D"true"><b>[AUH] enchant2: upgradi=
ng to 2.8.15 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [77%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">16. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ef9f3-9dc7=
52f6-8d21-4281-8c8f-a327e92979a2-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC33wRXtIw$" moz-do-not-send=3D"true"><b>[AUH] libxmlb: upgradin=
g to 0.3.25 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [73%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">17. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f0e87-1584=
c681-c112-4ccc-9210-f93ebc34d917-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC31yW_8X5$" moz-do-not-send=3D"true"><b>[AUH] taglib: upgrading=
 to 2.2 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [45%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">18. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f09da-8ad9=
c535-9164-44c7-8a11-f850c20d6433-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC36AbXxrG$" moz-do-not-send=3D"true"><b>[AUH] libgpg-error: upg=
rading to 1.59 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [42%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">19. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720f0cef-41fc=
ba72-3f31-406a-a0aa-efad029519bc-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC30FgInb8$" moz-do-not-send=3D"true"><b>[AUH] libsoup: upgradin=
g to 3.6.6 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [39%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">20. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720efb38-0e0a=
e483-959f-4e4a-962f-1a4f9094cacc-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3z7KlL4V$" moz-do-not-send=3D"true"><b>[AUH] gtk4: upgrading t=
o 4.20.3 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [3%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">21. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee8c4-1326=
c100-1227-44cf-aa45-b611809bcaf8-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3xDlg8mh$" moz-do-not-send=3D"true"><b>[AUH] rpm-sequoia-crypt=
o-policy: upgrading to f3f5fa454345b03039ee3d904964fc14829637ce SUCCEEDED=
</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [99%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">22. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720eec05-fafa=
daa6-b5b2-4f6e-a03d-f32a637ce76a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC375sc9Re$" moz-do-not-send=3D"true"><b>[AUH] rpm-sequoia: upgr=
ading to 1.10.1 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [13%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">23. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed3a7-5003=
2806-5070-42f5-b052-81c743a6e20a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC31oOtUTD$" moz-do-not-send=3D"true"><b>[AUH] fastfloat: upgrad=
ing to 8.2.3 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [86%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">24. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ecf1b-045c=
38a9-72cb-43e0-992c-0f95c4a363b8-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC31jAZidB$" moz-do-not-send=3D"true"><b>[AUH] ttyrun: upgrading=
 to 2.41.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [84%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">25. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720eefb6-5503=
fe20-6e22-4ca3-92d3-61e465568822-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3-VEMGy7$" moz-do-not-send=3D"true"><b>[AUH] ed: upgrading to =
1.22.5 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [84%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">26. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec780-9a3b=
8a18-6b4d-489e-afbb-1fe42d50ea1b-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3zx3JAGh$" moz-do-not-send=3D"true"><b>[AUH] libuv: upgrading =
to 1.52.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [81%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">27. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720eef19-1f0d=
bf2e-85ca-4a23-b82b-6386cf40820a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC34HOKgDC$" moz-do-not-send=3D"true"><b>[AUH] less: upgrading t=
o 692 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [73%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">28. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed245-3ba8=
458b-7064-49f5-a6bb-edb8295f35ae-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC36qLrls-$" moz-do-not-send=3D"true"><b>[AUH] ccache: upgrading=
 to 4.12.3 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [67%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">29. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec5f6-8ae4=
6777-3b7e-46c5-8ba3-c82106bd8312-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC37UOnPIc$" moz-do-not-send=3D"true"><b>[AUH] libcap-ng-python,=
libcap-ng: upgrading to 0.9.1,0.9.1 SUCCEEDED</b></a><o:p></o:p></span></=
pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [55%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">30. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec568-7871=
4733-d55b-4bab-a2ec-abbcd8f4b599-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC31uU3uo5$" moz-do-not-send=3D"true"><b>[AUH] libx11,libfontenc=
: upgrading to 1.8.13,1.1.9 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [47%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">---------------------------------=
-------------------------------------------------------------<o:p></o:p><=
/span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">31. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ecf45-43f5=
0ef5-8b79-4cbd-9089-7d80b9631d72-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC39fmAYkm$" moz-do-not-send=3D"true"><b>[AUH] ell: upgrading to=
 0.82 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [15%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">32. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec439-848d=
68dc-4c90-4645-9999-2e97cd69ae30-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC36CGiQ6s$" moz-do-not-send=3D"true"><b>[AUH] font-alias: upgra=
ding to 1.0.6 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [86%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">33. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed968-1866=
4721-e3f0-46cf-ad90-20360651118b-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3_G4A9UR$" moz-do-not-send=3D"true"><b>[AUH] python3-markdown:=
 upgrading to 3.10.2 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [78%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">34. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed760-810d=
fe91-0557-4084-a56c-85eae3d063ed-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC34iqQqeU$" moz-do-not-send=3D"true"><b>[AUH] gn: upgrading to =
9d19a7870add65151ff91bcc26252bb7521065cf SUCCEEDED</b></a><o:p></o:p></sp=
an></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [55%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">35. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec412-e2ea=
f0f8-882b-48c9-8903-0d11c7b57e89-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC39ldogCn$" moz-do-not-send=3D"true"><b>[AUH] python3-cryptogra=
phy-vectors,python3-cryptography: upgrading to 46.0.5,46.0.5 SUCCEEDED</b=
></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [44%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">36. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ecf0b-976a=
5a4a-4399-4b36-ac4c-e46263c3d9d4-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC33umb8Or$" moz-do-not-send=3D"true"><b>[AUH] ncurses: upgradin=
g to 6.6 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [33%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">37. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed1a2-4fde=
9b9f-9c8d-4c4c-afa1-073bfc465527-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3w4jDxIn$" moz-do-not-send=3D"true"><b>[AUH] btrfs-tools: upgr=
ading to 6.19 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [16%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">38. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ecad9-289a=
dab8-0384-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3yxYs5YE$" moz-do-not-send=3D"true"><b>[AUH] openssl: upgradin=
g to 3.6.1 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [9%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">39. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed212-3bcc=
8dde-0640-4d2d-8054-e8e60ecbf04d-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3x5Mf2pi$" moz-do-not-send=3D"true"><b>[AUH] zlib: upgrading t=
o 1.3.2 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [9%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">40. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec958-2397=
828f-7c04-4eb4-ac3e-ef4cd75579b1-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC38NwxpHB$" moz-do-not-send=3D"true"><b>[AUH] connman: upgradin=
g to 2.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [5%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">41. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ec3d9-fbc6=
621a-a0d5-4800-94df-bb6a03cf2443-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC37tAKPuL$" moz-do-not-send=3D"true"><b>[AUH] xauth: upgrading =
to 1.1.5 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [83%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">42. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee3c2-d28e=
1975-179b-4b55-860c-e09ad43167f8-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC346OFYP9$" moz-do-not-send=3D"true"><b>[AUH] python3-testtools=
: upgrading to 2.8.3 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [77%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">43. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee886-e523=
bc47-c9dc-4dc0-9a5a-f2d61344fd24-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3xR9OFEN$" moz-do-not-send=3D"true"><b>[AUH] python3-xmltodict=
: upgrading to 1.0.3 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [76%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">44. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720edd35-9236=
884d-27e6-45a0-ba5e-e34afa46938f-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC32xBJjLe$" moz-do-not-send=3D"true"><b>[AUH] python3-pyproject=
-metadata: upgrading to 0.11.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [73%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">45. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ed94c-2009=
b040-525b-4ab2-9613-40999971f57a-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC340ReldE$" moz-do-not-send=3D"true"><b>[AUH] python3-hypothesi=
s: upgrading to 6.151.9 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [69%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">46. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee68b-9524=
3140-644b-462f-8dd3-df2ef0d5f97b-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC38I6sx48$" moz-do-not-send=3D"true"><b>[AUH] python3-wcwidth: =
upgrading to 0.6.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [66%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">47. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee382-b27e=
2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3xzROzZ4$" moz-do-not-send=3D"true"><b>[AUH] python3-rdflib: u=
pgrading to 7.6.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [60%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">48. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee4f4-beb7=
14ed-883c-433e-a890-db8952300533-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3-1M9bRs$" moz-do-not-send=3D"true"><b>[AUH] python3-trove-cla=
ssifiers: upgrading to 2026.1.14.14 SUCCEEDED</b></a><o:p></o:p></span></=
pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [58%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">49. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720edd0d-c848=
24a7-f959-4f88-ba0f-6ee99b384e06-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC34UsH8kx$" moz-do-not-send=3D"true"><b>[AUH] python3-pycparser=
: upgrading to 3.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [52%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">50. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720edbdf-8b77=
5dee-95ce-4959-b25d-0036f159e806-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC34MAERRG$" moz-do-not-send=3D"true"><b>[AUH] python3-pip: upgr=
ading to 26.0.1 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [27%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">51. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ede90-4a44=
d733-8ffb-40a2-876c-a9f925ab73e9-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3y-6zsOo$" moz-do-not-send=3D"true"><b>[AUH] python3-poetry-co=
re: upgrading to 2.3.1 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [18%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">52. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee748-4596=
5cc5-3c70-4c94-adbe-01a1c9e65852-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC38cQfdpR$" moz-do-not-send=3D"true"><b>[AUH] python3-uv-build:=
 upgrading to 0.10.4 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [13%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">53. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ede9c-7977=
7fa3-222b-491b-b353-f1dffbdc4e95-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC3zZ1bB6N$" moz-do-not-send=3D"true"><b>[AUH] python3-maturin: =
upgrading to 1.12.2 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [10%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">54. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ee6c6-e45f=
b965-bd06-42ab-8623-4f7aa90bb139-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC39STQ3xV$" moz-do-not-send=3D"true"><b>[AUH] python3-setuptool=
s: upgrading to 82.0.0 SUCCEEDED</b></a><o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [8%]<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
              <pre><span lang=3D"EN-US">55. <a href=3D"https://urldefense=
.com/v3/__https://lore.kernel.org/openembedded-core/0101019c720ead92-1bd0=
d0ba-9fff-4d9f-8682-fd339a3c6cfb-000000@us-west-2.amazonses.com/__;!!Ajve=
Ydw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgo=
nMpKdM3HMbC34ApwRYm$" moz-do-not-send=3D"true"><b>[AUH] glib-2.0-initial,=
glib-2.0: upgrading to 2.86.4,2.86.4 SUCCEEDED</b></a><o:p></o:p></span><=
/pre>
              <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - by auh @ 202=
6-02-18 18:41 UTC [15%]<o:p></o:p></span></pre>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <p><span lang=3D"EN-US">2)<o:p></o:p></span></p>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <p><span lang=3D"EN-US">From the Yocto Status email:<o:p></=
o:p></span></p>
              <pre><span lang=3D"EN-US">- YP 6.0 M3 Build Date 2026-03-09=
<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">- YP 6.0 M3 Release Date 2026-03-=
20<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">- YP 6.0 M4 Build Date 2026-03-30=
<o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US">- YP 6.0 M4 Release Date 2026-04-=
26<o:p></o:p></span></pre>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
                <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font=
-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"E=
N-US"><o:p></o:p></span></p>
                <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font=
-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"E=
N-US"><o:p></o:p></span></p>
                <div>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">&nbsp=
;--</span><span lang=3D"EN-US"><o:p></o:p></span></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Best
                      Regards</span><span lang=3D"EN-US"><o:p></o:p></spa=
n></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">-----=
----------------------------------------------</span><span lang=3D"EN-US"=
><o:p></o:p></span></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">Wang
                      Mingyu</span><span lang=3D"EN-US"><o:p></o:p></span=
></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FUJIT=
SU
                      NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)</span>=
<span lang=3D"EN-US"><o:p></o:p></span></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">No.6
                      Wenzhu Road, Nanjing, 210012, China</span><span lan=
g=3D"EN-US"><o:p></o:p></span></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">TEL</=
span><span style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;ms=
o-ligatures:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-8663=
0566--8568</span></span><span lang=3D"EN-US"><o:p></o:p></span></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">COINS=
:
                      79988548</span><span lang=3D"EN-US"><o:p></o:p></sp=
an></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">FAX:
                      +86+25-83317685</span><span lang=3D"EN-US"><o:p></o=
:p></span></p>
                  <p class=3D"MsoNormal" style=3D"text-align:justify;text=
-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">MAIL:
                    </span><span lang=3D"EN-US"><a href=3D"mailto:wangmy@=
fujitsu.com" moz-do-not-send=3D"true"><span style=3D"font-size:10.5pt;fon=
t-family:&quot;MS Mincho&quot;;color:#0563C1;mso-ligatures:standardcontex=
tual">wangmy@fujitsu.com</span></a><o:p></o:p></span></p>
                </div>
                <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font=
-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D"E=
N-US"><o:p></o:p></span></p>
                <div style=3D"border:none;border-left:solid blue 1.5pt;pa=
dding:0cm 0cm 0cm 4.0pt">
                  <div>
                    <div style=3D"border:none;border-top:solid #E1E1E1 1.=
0pt;padding:3.0pt 0cm 0cm 0cm">
                      <p class=3D"MsoNormal"><b><span lang=3D"EN-US" styl=
e=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</=
span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">
                          Randy MacLeod
                        </span><span lang=3D"EN-US"><a href=3D"mailto:ran=
dy.macleod@windriver.com" moz-do-not-send=3D"true"><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;randy.macleod@w=
indriver.com&gt;</span></a></span><span lang=3D"EN-US" style=3D"font-size=
:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                          <br>
                          <b>Sent:</b> Thursday, February 26, 2026 10:26
                          PM<br>
                          <b>To:</b> Wang, Mingyu/</span><span style=3D"f=
ont-size:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Calibri&quot;,sans-serif">
                        </span><span style=3D"font-size:11.0pt">=E9=B8=A3=
=E7=91=9C</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri=
&quot;,sans-serif">
                        </span><span lang=3D"EN-US"><a href=3D"mailto:wan=
gmy@fujitsu.com" moz-do-not-send=3D"true"><span style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif">&lt;wangmy@fujitsu.com&gt;</=
span></a></span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-famil=
y:&quot;Calibri&quot;,sans-serif">;
                          Alexander Kanavin
                        </span><span lang=3D"EN-US"><a href=3D"mailto:ale=
x.kanavin@gmail.com" moz-do-not-send=3D"true"><span style=3D"font-size:11=
.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;alex.kanavin@gmail.c=
om&gt;</span></a></span><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif"><br>
                          <b>Cc:</b> </span><span lang=3D"EN-US"><a href=3D=
"mailto:openembedded-core@lists.openembedded.org" moz-do-not-send=3D"true=
"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-se=
rif">openembedded-core@lists.openembedded.org</span></a></span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif">;
                          Jia, Hongxu </span><span lang=3D"EN-US"><a href=
=3D"mailto:Hongxu.Jia@windriver.com" moz-do-not-send=3D"true"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;Hong=
xu.Jia@windriver.com&gt;</span></a></span><span lang=3D"EN-US" style=3D"f=
ont-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
                          <b>Subject:</b> Re: [OE-core] [AUH]
                          python3-rdflib: upgrading to 7.6.0 SUCCEEDED</s=
pan><span lang=3D"EN-US"><o:p></o:p></span></p>
                    </div>
                  </div>
                  <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p>=
</o:p></span></p>
                  <div>
                    <p class=3D"MsoNormal"><span lang=3D"EN-US">On
                        2026-02-25 10:14 p.m., Mingyu Wang (Fujitsu)
                        wrote:<o:p></o:p></span></p>
                  </div>
                  <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0=
pt">
                    <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">I've
                        also been on vacation since 2.18 and just
                        returned to work. I'll handle the python3-rdflib
                        upgrade.</span><span lang=3D"EN-US"><o:p></o:p></=
span></p>
                  </blockquote>
                  <p><span lang=3D"EN-US">Thanks Wangmy and I hope you ha=
d
                      a good vacation.<o:p></o:p></span></p>
                  <p style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
The
                      bigger question is the &gt; 50 packages that AUH
                      managed to upgrade.<br>
                      <br>
                      Will you also do most of them or would you like to
                      split this list with Hongxu/Qi/ etc?<br>
                      If you want to split it, please reply with the
                      packages you will do.<o:p></o:p></span></p>
                  <p><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
                  <p><span lang=3D"EN-US">../Randy<o:p></o:p></span></p>
                  <blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0=
pt">
                    <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
                    <div>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">&=
nbsp;--</span><span lang=3D"EN-US"><o:p></o:p></span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">B=
est
                          Regards</span><span lang=3D"EN-US"><o:p></o:p><=
/span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">-=
--------------------------------------------------</span><span lang=3D"EN=
-US"><o:p></o:p></span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">W=
ang
                          Mingyu</span><span lang=3D"EN-US"><o:p></o:p></=
span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">F=
UJITSU
                          NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)</s=
pan><span lang=3D"EN-US"><o:p></o:p></span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">N=
o.6
                          Wenzhu Road, Nanjing, 210012, China</span><span=
 lang=3D"EN-US"><o:p></o:p></span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">T=
EL</span><span style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot=
;;mso-ligatures:standardcontextual">=EF=BC=9A<span lang=3D"EN-US">+86+25-=
86630566--8568</span></span><span lang=3D"EN-US"><o:p></o:p></span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">C=
OINS:
                          79988548</span><span lang=3D"EN-US"><o:p></o:p>=
</span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">F=
AX:
                          +86+25-83317685</span><span lang=3D"EN-US"><o:p=
></o:p></span></p>
                      <p class=3D"MsoNormal" style=3D"text-align:justify;=
text-justify:inter-ideograph"><span lang=3D"EN-US" style=3D"font-size:10.=
5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontextual">M=
AIL:
                        </span><span lang=3D"EN-US"><a href=3D"mailto:wan=
gmy@fujitsu.com" moz-do-not-send=3D"true"><span style=3D"font-size:10.5pt=
;font-family:&quot;MS Mincho&quot;;color:#0563C1;mso-ligatures:standardco=
ntextual">wangmy@fujitsu.com</span></a><o:p></o:p></span></p>
                    </div>
                    <p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"=
font-size:10.5pt;font-family:=E7=AD=89=E7=BA=BF">&nbsp;</span><span lang=3D=
"EN-US"><o:p></o:p></span></p>
                    <div style=3D"border:none;border-left:solid blue 1.5p=
t;padding:0cm 0cm 0cm 4.0pt">
                      <div>
                        <div style=3D"border:none;border-top:solid #E1E1E=
1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
                          <p class=3D"MsoNormal"><b><span lang=3D"EN-US" =
style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">Fro=
m:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&=
quot;Calibri&quot;,sans-serif">
                              Randy MacLeod
                            </span><span lang=3D"EN-US"><a href=3D"mailto=
:randy.macleod@windriver.com" moz-do-not-send=3D"true"><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;randy.macle=
od@windriver.com&gt;</span></a></span><span lang=3D"EN-US" style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
                              <br>
                              <b>Sent:</b> Wednesday, February 25, 2026
                              12:42 AM<br>
                              <b>To:</b> Wang, Mingyu/</span><span style=3D=
"font-size:11.0pt">=E7=8E=8B</span><span style=3D"font-size:11.0pt;font-f=
amily:&quot;Calibri&quot;,sans-serif">
                            </span><span style=3D"font-size:11.0pt">=E9=B8=
=A3=E7=91=9C</span><span style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif">
                            </span><span lang=3D"EN-US"><a href=3D"mailto=
:wangmy@fujitsu.com" moz-do-not-send=3D"true"><span style=3D"font-size:11=
.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;wangmy@fujitsu.com&g=
t;</span></a></span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-f=
amily:&quot;Calibri&quot;,sans-serif">;
                              Alexander Kanavin
                            </span><span lang=3D"EN-US"><a href=3D"mailto=
:alex.kanavin@gmail.com" moz-do-not-send=3D"true"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;alex.kanavin@gma=
il.com&gt;</span></a></span><span lang=3D"EN-US" style=3D"font-size:11.0p=
t;font-family:&quot;Calibri&quot;,sans-serif"><br>
                              <b>Cc:</b> </span><span lang=3D"EN-US"><a h=
ref=3D"mailto:openembedded-core@lists.openembedded.org" moz-do-not-send=3D=
"true"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sa=
ns-serif">openembedded-core@lists.openembedded.org</span></a></span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;=
,sans-serif">;
                              Jia, Hongxu </span><span lang=3D"EN-US"><a =
href=3D"mailto:Hongxu.Jia@windriver.com" moz-do-not-send=3D"true"><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&lt;=
Hongxu.Jia@windriver.com&gt;</span></a></span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><br>
                              <b>Subject:</b> Re: [OE-core] [AUH]
                              python3-rdflib: upgrading to 7.6.0
                              SUCCEEDED</span><span lang=3D"EN-US"><o:p><=
/o:p></span></p>
                        </div>
                      </div>
                      <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<=
o:p></o:p></span></p>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">Hello
                            Wang, and everyone,<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp=
;<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex
                            mentioned in the YP tech call today that
                            he's on vacation starting tomorrow, iirc.<o:p=
></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp=
;<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">Alex,=
&nbsp;<br>
                            &nbsp; &nbsp; I assume that you won't be send=
ing a
                            patch series for the succeeding AUH
                            upgrades.<br>
                            <br>
                            Wang,&nbsp;<br>
                            &nbsp; &nbsp;Have you or do you plan to work =
on that?<br>
                            <br>
                            If not, Hongxu and maybe others at WR will
                            work on that.<br>
                            I'm going to focus on the failed AUH upgrade
                            set of recipes.<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp=
;<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">../Ra=
ndy<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp=
;<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp=
;<o:p></o:p></span></p>
                      </div>
                      <div>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US">On
                            2026-02-18 1:41 p.m., Auto Upgrade Helper
                            via
                            <a href=3D"https://urldefense.com/v3/__http:/=
lists.openembedded.org__;!!AjveYdw8EvQ!cC2WyezAalR6UZOZ07BsaBry1ZouLbKpeZ=
9nmC_s0Z9sWMH3AU12RFCRUC7BKKlhQzHFJRMeHgUCGuPSquz_VA$" moz-do-not-send=3D=
"true">
                              lists.openembedded.org</a> wrote:<o:p></o:p=
></span></p>
                      </div>
                      <blockquote style=3D"margin-top:5.0pt;margin-bottom=
:5.0pt">
                        <pre><span lang=3D"EN-US">Hello,<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">this email is a notific=
ation from the Auto Upgrade Helper<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">that the automatic atte=
mpt to upgrade the recipe(s) *python3-rdflib* to *7.6.0* has Succeeded.<o=
:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">Next steps:<o:p></o:p><=
/span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - ap=
ply the patch: git am 0001-python3-rdflib-upgrade-7.5.0-7.6.0.patch<o:p><=
/o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - ch=
eck the changes to upstream patches and summarize them in the commit mess=
age,<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - co=
mpile an image that contains the package<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - pe=
rform some basic sanity tests<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - am=
end the patch and sign it off: git commit -s --reset-author --amend<o:p><=
/o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; - se=
nd it to the appropriate mailing list<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">Alternatively, if you b=
elieve the recipe should not be upgraded at this time,<o:p></o:p></span><=
/pre>
                        <pre><span lang=3D"EN-US">you can fill RECIPE_NO_=
UPDATE_REASON in respective recipe file so that<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">automatic upgrades woul=
d no longer be attempted.<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">Please review the attac=
hed files for further information and build/update failures.<o:p></o:p></=
span></pre>
                        <pre><span lang=3D"EN-US">Any problem please file=
 a bug at <a href=3D"https://urldefense.com/v3/__https://bugzilla.yoctopr=
oject.org/enter_bug.cgi?product=3DAutomated*20Update*20Handler__;JSU!!Ajv=
eYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEg=
onMpKdM3HMbC37MoPwkk$" moz-do-not-send=3D"true">https://bugzilla.yoctopro=
ject.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler</a><o:p></o=
:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">Regards,<o:p></o:p></sp=
an></pre>
                        <pre><span lang=3D"EN-US">The Upgrade Helper<o:p>=
</o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">-- &gt;8 --<o:p></o:p><=
/span></pre>
                        <pre><span lang=3D"EN-US">From 6a230684782cbe47a4=
f0e5fe6c2268da57091fea Mon Sep 17 00:00:00 2001<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">From: Upgrade Helper <a=
 href=3D"mailto:auh@yoctoproject.org" moz-do-not-send=3D"true">&lt;auh@yo=
ctoproject.org&gt;</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">Date: Wed, 18 Feb 2026 =
13:46:27 +0000<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">Subject: [PATCH] python=
3-rdflib: upgrade 7.5.0 -&gt; 7.6.0<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">---<o:p></o:p></span></=
pre>
                        <pre><span lang=3D"EN-US"> ...<a href=3D"https://=
urldefense.com/v3/__http://dflib_7.5.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpa=
aDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3xlObILc$" m=
oz-do-not-send=3D"true">dflib_7.5.0.bb</a> =3D&gt; <a href=3D"https://url=
defense.com/v3/__http://python3-rdflib_7.6.0.bb__;!!AjveYdw8EvQ!bamR0eNBw=
KwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC38HynW=
eo$" moz-do-not-send=3D"true">python3-rdflib_7.6.0.bb</a>} | 25 +++++++++=
++++++++--<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> 1 file changed, 23 ins=
ertions(+), 2 deletions(-)<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> rename meta/recipes-de=
vtools/python/{<a href=3D"https://urldefense.com/v3/__http://python3-rdfl=
ib_7.5.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJR=
S2TocZKRR9CZLTEiWEgonMpKdM3HMbC358ngJMk$" moz-do-not-send=3D"true">python=
3-rdflib_7.5.0.bb</a> =3D&gt; <a href=3D"https://urldefense.com/v3/__http=
://python3-rdflib_7.6.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp=
4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC38HynWeo$" moz-do-not-send=3D=
"true">python3-rdflib_7.6.0.bb</a>} (34%)<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                        <pre><span lang=3D"EN-US">diff --git a/meta/recip=
es-devtools/python/<a href=3D"https://urldefense.com/v3/__http://python3-=
rdflib_7.5.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ula=
AEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC358ngJMk$" moz-do-not-send=3D"true">py=
thon3-rdflib_7.5.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"https=
://urldefense.com/v3/__http://python3-rdflib_7.6.0.bb__;!!AjveYdw8EvQ!bam=
R0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC=
38HynWeo$" moz-do-not-send=3D"true">python3-rdflib_7.6.0.bb</a><o:p></o:p=
></span></pre>
                        <pre><span lang=3D"EN-US">similarity index 34%<o:=
p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">rename from meta/recipe=
s-devtools/python/<a href=3D"https://urldefense.com/v3/__http://python3-r=
dflib_7.5.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaA=
EJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC358ngJMk$" moz-do-not-send=3D"true">pyt=
hon3-rdflib_7.5.0.bb</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">rename to meta/recipes-=
devtools/python/<a href=3D"https://urldefense.com/v3/__http://python3-rdf=
lib_7.6.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJ=
RS2TocZKRR9CZLTEiWEgonMpKdM3HMbC38HynWeo$" moz-do-not-send=3D"true">pytho=
n3-rdflib_7.6.0.bb</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">index e421aa2bac..1b830=
e8aa9 100644<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">--- a/meta/recipes-devt=
ools/python/<a href=3D"https://urldefense.com/v3/__http://python3-rdflib_=
7.5.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2T=
ocZKRR9CZLTEiWEgonMpKdM3HMbC358ngJMk$" moz-do-not-send=3D"true">python3-r=
dflib_7.5.0.bb</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+++ b/meta/recipes-devt=
ools/python/<a href=3D"https://urldefense.com/v3/__http://python3-rdflib_=
7.6.0.bb__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2T=
ocZKRR9CZLTEiWEgonMpKdM3HMbC38HynWeo$" moz-do-not-send=3D"true">python3-r=
dflib_7.6.0.bb</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">@@ -1,10 +1,31 @@<o:p><=
/o:p></span></pre>
                        <pre><span lang=3D"EN-US">+# FIXME: the LIC_FILES=
_CHKSUM values have been updated by 'devtool upgrade'.<o:p></o:p></span><=
/pre>
                        <pre><span lang=3D"EN-US">+# The following is the=
 difference between the old and the new license text.<o:p></o:p></span></=
pre>
                        <pre><span lang=3D"EN-US">+# Please update the LI=
CENSE value if needed, and summarize the changes in<o:p></o:p></span></pr=
e>
                        <pre><span lang=3D"EN-US">+# the commit message v=
ia 'License-Update:' tag.<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+# (example: 'License-U=
pdate: copyright years updated.')<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+#<o:p></o:p></span></p=
re>
                        <pre><span lang=3D"EN-US">+# The changes:<o:p></o=
:p></span></pre>
                        <pre><span lang=3D"EN-US">+#<o:p></o:p></span></p=
re>
                        <pre><span lang=3D"EN-US">+# --- LICENSE<o:p></o:=
p></span></pre>
                        <pre><span lang=3D"EN-US">+# +++ LICENSE<o:p></o:=
p></span></pre>
                        <pre><span lang=3D"EN-US">+# @@ -1,6 +1,6 @@<o:p>=
</o:p></span></pre>
                        <pre><span lang=3D"EN-US">+#&nbsp; BSD 3-Clause L=
icense<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+#&nbsp; <o:p></o:p></s=
pan></pre>
                        <pre><span lang=3D"EN-US">+# -Copyright (c) 2002-=
2025, RDFLib Team<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+# +Copyright (c) 2002-=
2026, RDFLib Team<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+#&nbsp; All rights res=
erved.<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+#&nbsp; <o:p></o:p></s=
pan></pre>
                        <pre><span lang=3D"EN-US">+#&nbsp; Redistribution=
 and use in source and binary forms, with or without<o:p></o:p></span></p=
re>
                        <pre><span lang=3D"EN-US">+# <o:p></o:p></span></=
pre>
                        <pre><span lang=3D"EN-US">+#<o:p></o:p></span></p=
re>
                        <pre><span lang=3D"EN-US">+<o:p></o:p></span></pr=
e>
                        <pre><span lang=3D"EN-US"> SUMMARY =3D &quot;RDFL=
ib is a pure Python package for working with RDF&quot;<o:p></o:p></span><=
/pre>
                        <pre><span lang=3D"EN-US"> HOMEPAGE =3D <a href=3D=
"https://urldefense.com/v3/__https://github.com/RDFLib/rdflib__;!!AjveYdw=
8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMp=
KdM3HMbC33M9iwZP$" moz-do-not-send=3D"true">&quot;https://github.com/RDFL=
ib/rdflib&quot;</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> SECTION =3D &quot;deve=
l/python&quot;<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> LICENSE =3D &quot;BSD-=
3-Clause&quot;<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">-LIC_FILES_CHKSUM =3D <=
a href=3D"file://LICENSE;md5=3D7006e973486c4700556f6d58cba0ab6c" moz-do-n=
ot-send=3D"true">&quot;file://LICENSE;md5=3D7006e973486c4700556f6d58cba0a=
b6c&quot;</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+LIC_FILES_CHKSUM =3D <=
a href=3D"file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53a3e" moz-do-n=
ot-send=3D"true">&quot;file://LICENSE;md5=3D0ac0171cee5250c44d7d49847ae53=
a3e&quot;</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> <o:p></o:p></span></pr=
e>
                        <pre><span lang=3D"EN-US">-SRC_URI[sha256sum] =3D=
 &quot;663083443908b1830e567350d72e74d9948b310f827966358d76eebdc92bf592&q=
uot;<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">+SRC_URI[sha256sum] =3D=
 &quot;6c831288d5e4a5a7ece85d0ccde9877d512a3d0f02d7c06455d00d6d0ea379df&q=
uot;<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> <o:p></o:p></span></pr=
e>
                        <pre><span lang=3D"EN-US">&nbsp;inherit pypi pyth=
on_poetry_core<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US"> <o:p></o:p></span></pr=
e>
                        <p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
                            <br>
                            <br>
                            <br>
                            <o:p></o:p></span></p>
                        <pre><span lang=3D"EN-US">-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">Links: You receive all =
messages sent to this group.<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">View/Reply Online (#231=
360): <a href=3D"https://urldefense.com/v3/__https://lists.openembedded.o=
rg/g/openembedded-core/message/231360__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo4=
6INzdbiwZjp4U6gZqm6ulaAEJRS2TocZKRR9CZLTEiWEgonMpKdM3HMbC3w81LnA3$" moz-d=
o-not-send=3D"true">https://lists.openembedded.org/g/openembedded-core/me=
ssage/231360</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">Mute This Topic: <a hre=
f=3D"https://urldefense.com/v3/__https://lists.openembedded.org/mt/117879=
875/3616765__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJR=
S2TocZKRR9CZLTEiWEgonMpKdM3HMbC35_WRQpX$" moz-do-not-send=3D"true">https:=
//lists.openembedded.org/mt/117879875/3616765</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">Group Owner: <a href=3D=
"mailto:openembedded-core+owner@lists.openembedded.org" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">openembedded-core+owner@lists.open=
embedded.org</a><o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">Unsubscribe: <a href=3D=
"https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedde=
d-core/unsub__;!!AjveYdw8EvQ!bamR0eNBwKwrEpaaDo46INzdbiwZjp4U6gZqm6ulaAEJ=
RS2TocZKRR9CZLTEiWEgonMpKdM3HMbC34088K_9$" moz-do-not-send=3D"true">https=
://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailt=
o:randy.macleod@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">randy.macleod@windriver.com</a>]<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-<o:p></o:p></span></pre>
                        <pre><span lang=3D"EN-US">&nbsp;<o:p></o:p></span=
></pre>
                      </blockquote>
                      <p><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p=
>
                      <pre><span lang=3D"EN-US">-- <o:p></o:p></span></pr=
e>
                      <pre><span lang=3D"EN-US"># Randy MacLeod<o:p></o:p=
></span></pre>
                      <pre><span lang=3D"EN-US"># Wind River Linux<o:p></=
o:p></span></pre>
                    </div>
                  </blockquote>
                  <p><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
                  <pre><span lang=3D"EN-US">-- <o:p></o:p></span></pre>
                  <pre><span lang=3D"EN-US"># Randy MacLeod<o:p></o:p></s=
pan></pre>
                  <pre><span lang=3D"EN-US"># Wind River Linux<o:p></o:p>=
</span></pre>
                </div>
              </blockquote>
              <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
              <pre><span lang=3D"EN-US">-- <o:p></o:p></span></pre>
              <pre><span lang=3D"EN-US"># Randy MacLeod<o:p></o:p></span>=
</pre>
              <pre><span lang=3D"EN-US"># Wind River Linux<o:p></o:p></sp=
an></pre>
            </blockquote>
            <p><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------llcvh6IJ7aXtLAIBHHNHnZq6--

