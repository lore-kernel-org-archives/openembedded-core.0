Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B18EC1425
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:03:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13413.1772611407661689457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 00:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QCYMRKDt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244p7AO2119217
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 00:03:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Gg+VuHoRsd8d8IB9iFOEN4ufC27dqqxpZUnXNMwk+zQ=; b=QCYMRKDtMUp2
	ZqNDYKmcMcl7HjdGvdP9Gox9c9MqYCET6px6YTCpPuixaFShP0JicN9vgnsEtztE
	CGHziqUrvKyxY7QSy+it2kCzR8g78GQgmQe3zGd+B9g4bbJnBtnwVlxLJgztH/OE
	D+oAL0YxMDowdOhi09oyclCdfc4OCSoJrzRqWkOCPBSNELJrcThe/ibMmW6JCW9t
	EjhLfshXI1vhkqWre6RCvqILqRUyhnN2LA3346idCQumEhkSMEOg/b8QD3jJ1JsG
	Kdsq6H803pQ8PevSjZ2D6rsozm65txZQwXlga41jL2BrmTi9rt3sbclNIC7BI0ev
	qlpIu0Dz7g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh44f0s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 00:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIQz4xn4WumU4ZpFJZEhLerah10+V2tOmhX78O9/sxYC7O4C2nXybtstBu8I/wQ9lumRDNpGXEYUBIxGGhjsIeU06Xbj0vHJjXp6UMdjmNzR91pTgIQN4uKVXoO/wPS+8/o1k6qN8lVgJI6IRIZHNL+0aXu0tv9AZVKUeySeuY9DGvZ2uJbecKuGLZov2lV37OEB77EdKVsiW7C+3b+HZnMY+/CimztgYKrDt145kGUm5VnJRPOetzznDSclRwCaRS0Pph5j9sJUhvcADnTMP4bkTGTJlT1iFgv7MGbKgxDVbSaS7cfTaEvdqZBHJHzV1IJJoDzSraxXlUdT9hjJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg+VuHoRsd8d8IB9iFOEN4ufC27dqqxpZUnXNMwk+zQ=;
 b=NyJ5uMpy0HO2rtBBvqi+EicYyTSfDQyOL4jjjexI1bhmc3qE2U96+lqHKC2J62BvqNTKMTwGoVaX8foVMA4Wcdvk4mVGWdzcYIAtwVFXAYbcAnsn6VFHjzeJOfRGg7/FqlIgNqpYwqpNYWGR15/P/MuJzzX7Wx16ZfHUeo8jSf5VdyzbwATYLDJbUlzbDEZAdw6NYwdeni0Wgwnr+1Yql0Mwer7vTHQsjt4Nunbv06+9wH0lds/gDR593katBskKyDZrKxG5cTNzPrf+nO2bLj7FTVemwXE+txB5XrJAiLmpr4aUMOk4y+H9IP3VaBfkhOHszqxA1W2UgKB0LgHpvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA3PR11MB9325.namprd11.prod.outlook.com (2603:10b6:208:571::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:03:22 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:03:22 +0000
Message-ID: <97bc50b6-a492-4bd8-9d3e-d61b6edd8314@windriver.com>
Date: Wed, 4 Mar 2026 16:03:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 02/19] ncurses: upgrade 6.5 -> 6.6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-2-hongxu.jia@windriver.com>
 <DGTU8O5LFUJI.34TT9V1SM5Z8U@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DGTU8O5LFUJI.34TT9V1SM5Z8U@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0109.apcprd02.prod.outlook.com
 (2603:1096:4:92::25) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA3PR11MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: af522c57-d60e-4052-74dd-08de79c48165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	vv/0Pcz8zMfoFQ8nXsMUOOcAPPD4pmN9FIrrsfo/3rXTR55P5QWV8zrm/IBBviLbOVW2LTYsT1fciHxGnryGFzojUgbe7TL1Nwtq5tPwqUR0zmGz61x2cdrvhZsAW/nFVnddtw9JIk7ueLk/7iY2sKxfidHTF14MKg4IobpaGu+2lAGovlwV3iJkp9E27JJfQtu4wQGA0kYtortIUiax0qZo9wczIcb/AfFJw3PxDh1nAXe8DE3IBDq+GC69GJMnPiwx6KIZ4g0vqloUNU/tm+Jq02YGiTBAd/L8taECMgj2dsDuEgenjQidSbMDPHM2gsoHAd1IgNB9ukObCJdLU6V3aEjEmmSEkKomiDDS5Mv6gTpDZlQY/IGPdlAbXwTevhElwzBx1lWcnHmotjvx/gP77lnNRpYnK3I272yXnBV+EcfcDWt71tT3IYfaOv4VKm44ZA29zPK7oW/Hts/nEFMu+gFJ7+mcSzvSCvL2NLfFR0TX/8JRHMcNEOv0EiFu7LeqEeWWiJSZqxSIIrWh8UM1HmbaxJ0X315wbevbahfthbDe61n3LSEUBm3GSg4X8xRuYjLZoHgJGVMuA4uciNlVSdCl04gIdiQZkqpZ8SFd9tj7uoRtJ4CAWtgRHqxnGktCq3jaR1Ndxl6nlKxNyfmhsbSBLiwNdA9w0Ft/FXw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnAvbVNkRmp6WFNFbUVwb0prVHg3RXF6NXVtK2ZrNWMreDdxcVVCRVRsSWxp?=
 =?utf-8?B?S1RtRGw5UlFiYmpBU3p2dnFQNVFOTXZPbHhsQlUzLzBtZUFFb1pCWUZaOFZs?=
 =?utf-8?B?TWFkRFdMUXpLMFNLMFlQaGIxWW41OHR0WFFZTmVJMVpSSTZyNlFyLzlodnBN?=
 =?utf-8?B?QVl2TkwrYm1tTlpRN3RXbGxGbnJIWlBwWnVmQ0ZlcEFzNWRTajNqQVJwNk5w?=
 =?utf-8?B?ckppeUducWgvdllWdXNtM2lPemJPS2pGM0ZKQXVtLzhkdGtPc1lHbGMzYy9P?=
 =?utf-8?B?b21NMzcxRTBaTkp0czBZNnl3SUxjM0JYdm13QTJsUmdxcDZFMzNsOTRsSEtv?=
 =?utf-8?B?SDhuMzg0RXFXaEh2OFFZc2F6eGNBRDVuTHpyWkRBdjYrQVNqMzQva2Y1SXhV?=
 =?utf-8?B?ODVqWjVEUnA0TzJDRXlOd2ZiemVjUll3OFk5Y1EzYXlEVmlZcEFsZHFuTVpo?=
 =?utf-8?B?Yk9lUU52VUdScTk2aFlkc1M1Q0IzVGVvUnVrT0FrdERSNTh4Y1F6Z1UyeW1p?=
 =?utf-8?B?bngwNm9jOWhDQ2txTi9tMFJDZmdzY3I4T21DYmh5UHZlOTBaMU0xTG1OL2NP?=
 =?utf-8?B?UmVJMG42b3AzSktqTHFieTZuR1N0bjdoMkNBMlJjM3lBSytRREJvSldhUnVh?=
 =?utf-8?B?OVVnNXdQWEgybDU1djl5UlJ4MkpTNHJBbjNZUXBxMXViZkV4RW85d1RQb3Ru?=
 =?utf-8?B?aTBlWUl3M2dxVDVhOG0zTk1ZZ2pMZGltUzcxR3F5MFo5b1VrQXBPZzQ0RUZp?=
 =?utf-8?B?L050a2F6NXVtSEJyb255MEwwWXlTQTJsUU5Za0JLd2FDTS9la0twNVR4dEIv?=
 =?utf-8?B?S1JOTnhzTTBhMEpWazBtK1VLZzRGMHEvdXJFb2NsK1duQ3daTVE0cVZxTTVm?=
 =?utf-8?B?Tzc3ZFVjay9IRlpMWjF6RlZNMGZYRmV2QjNQMUQzckRFVk9YWjdKZU53OCtt?=
 =?utf-8?B?YmpCOVlBQUlqR1laaE1STS9rV1pZZTFuTXBqYTVzTCtrYXk1ZzVHdXZCcTBr?=
 =?utf-8?B?ZHFPM1FnbUk1OUNqT0xPMFhYZm9iTmhDTHd4cGxFL2pqUVVaRGVTcWNoK1h6?=
 =?utf-8?B?R2FoVmJmbWUrQWpMTVFUTm9vZ1dEaXZ1Z2pBQVAvYWMxY01JYmxYclpndVlP?=
 =?utf-8?B?L1QxMXZyWjVBRS9ZMmtyV1RxdkR2NEZralV3endYMzk0TVpJcVY2WHQxV3BP?=
 =?utf-8?B?MndoSEtTc09JRlM4RUltVll4aWhBeEpISTQ2OHN3RENGaE4vS0FtQVBYeGZm?=
 =?utf-8?B?NTd1RVVMRVRVVzRGQy9BOVBXNGVwVnFQRFFEUHhxamM0UzJrOFhiWGIxczZl?=
 =?utf-8?B?Vmx0R0FMUy9ERWF1R2lucjFUdFpSVkpKTW9EdWdaZVQ5bDh3cnY4VmtxRGtR?=
 =?utf-8?B?SjVETG1EdGs2cGtBelpoZ0lDL3B6cXBOYjc2c1RwQkVPK3dWVVE5WGJkcy9N?=
 =?utf-8?B?cXhPWW15Yi9zV0hBM1ZrVHRsL0hDb2hycTljNnZod295NmpxemEwU3NuaUM1?=
 =?utf-8?B?eE1UWmdHb0piTjB6T1p2YU9VbUxSVFF0UzdYamhFMlZtb3phTFVTMTY5dVZz?=
 =?utf-8?B?bTh1YUFmZ2JTbzhaK0s4VnRnR1NIdHp1Q3R1ZWtRWCs3dUsxVnhUL2pRK3Ru?=
 =?utf-8?B?dzhpdVB5cXhOZDlOWnJXRHRJR2RzQ2dZL3paVXpkZVB5TE94ZDMyNVQ5dFEy?=
 =?utf-8?B?c1crWU9TNFE5a0l1VjEraGljTEJHTXdYeDU2RzFCbWdYSnBBNGsraWJNVjBL?=
 =?utf-8?B?VXVWTFI2djhLdzR0WFl1Skw2b3JCTnBYVEdxVlVhZWhOaDZnRldDU3M1QmVU?=
 =?utf-8?B?N1ArRmpYRjV5U2FUVG9tYkpWNEFRTmYySDVGZFF4eC9CR1VZWjAyeXNxSS9T?=
 =?utf-8?B?TFlhT3hFM3NaYjdZNnYrYTRQa2hyNmIyWGU4NlBJUEE2SGMyaXFxWW80UW13?=
 =?utf-8?B?TnhTTVc3WTlRV2N5aW9QaEgzUWdrVS9XT3JvRHV5MStyUk14R1N4bk1jRGxu?=
 =?utf-8?B?VS9jMU5xRDFZRFp5dkZjMGVzaVJjMVFVMFZvQlJwQUFYR0l4UWRuZmhHWWxz?=
 =?utf-8?B?dVBXUnFNd0prUEFJeis2UFV3amhzU21mSXd5MHlTQnlrZG56VXdLNTZKR2NC?=
 =?utf-8?B?aGsrcVRqMDhiRHdJOVEyZkRyVDQ3QjB4SVJnSlpnQTBzK0JKWjNVSFF5MEt1?=
 =?utf-8?B?SWt0OFhOOVp0Q2taVnZuUVhuMS9BNFhZMXRPWXZ5M1dGRkpPT2pzdWF2bkRK?=
 =?utf-8?B?Q1A2cm1xTGxvL1B6dVhhRHhqNnRuOUdBVVBhL09oK3NMd1RtMTB5QjBxdEVo?=
 =?utf-8?B?eWVkYjl3cTlFNUxlQXRyWE9jS2duWDZBN2RIUC84dDVCNHNwbi8wSXBxNWhE?=
 =?utf-8?Q?6Zw+rj8iI2D2mUHk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af522c57-d60e-4052-74dd-08de79c48165
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:03:22.7899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fyp6RCeTMPC7F2ela2TmAuJqM/Fa+mUMxiyIqQcH7ipZ4ZmjsZgZq1IAmzTxi+It3JWpUDsq4ay0YufjSV2qX5SV+Kl+LjZ9VvntbrxPRaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9325
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Au1mazF9_JMe-LOodIi8aXBrpjZZx-m1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2MyBTYWx0ZWRfX48JvixtvonIU
 eVOQ12oAJxKHJMh5QJHTtIbr/Ljq2yzEAbEts3ZSoK1rAhq9K6SgvRthHHdG6nEX02P0eyJLdIZ
 ijIjPCdusH/GcJqoKLKA6Oc+EY5uw4VPfSqiSSyapYEKROVnuL69+Nm3VU2YuGS9XBijtXWuxYB
 rwaLtNm0unB5G8h1BpnncvrQHiJ76xXSHMi0f/t8FTZx3ejwzYa/mRguB0O9X3hyMaOEOGORgT4
 Me4e5r99IFr/aEQRiRzPO4R15aB4DVkdKwwAcqdH6Eml5GqCFh7k0qBPNh/FxLiqS1fq1SYyiMn
 1FHSt7oKb4fkb7sjGhG2AV6IgQnkilr9k6vhUfszpMos2I8wc7gwKn3aMPLRErSc4rYyF8+Tl5R
 sq0bwlLncaOtXIaYjrSh/3YdQA8tVpyab1q6oC/wC6pxQ5XlqfzKods3c6Och9Va10royLMXiFe
 t8E6HG4bNrKmdbAw1Ug==
X-Proofpoint-GUID: xC7fDD71FE8LK8UcnrBjpm7fUaJrQ7xC
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a7e74f cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=mDV3o1hIAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=6DN-eRfbmmAGAQMKt3AA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232353

On 3/4/26 16:00, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Mar 3, 2026 at 7:56 AM CET, hongxu via lists.openembedded.org wrote:
>> License-Update: copyright years updated
>>
>> Delete backport patch
>> - CVE-2025-6141.patch
>>
>> Announcing ncurses 6.6:
>>    https://lists.gnu.org/archive/html/info-gnu/2025-12/msg00010.html
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
> Hi Hongxu,
>
> Thanks for the upgrade.
>
> We have some QA error about installed files:
>
> ERROR: ncurses-6.6-r0 do_package: QA Issue: ncurses: Files/directories were installed but not shipped in any package:
>    /usr/lib
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3269
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3123
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3289
>
> Can you have a look at it?

Copy, I am working on it

//Hongxu

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


