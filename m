Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2A51048926
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 01:18:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.111454.1772241492267488873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 17:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=TvqTGeoK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6519fd1130=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S1AxXY2269071
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 01:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=H0KTShJOT4kz8zJHzur75/
	fQjnOCUuH/DhSDyNvLPKw=; b=TvqTGeoKtBsly/+zZgwy06F0WcbKK78/mAPsfK
	40GkentEs8EnCTmEXBC6TEfkAZAmh/P5tk8x6/bQCexryDXojfpG56JzOdLAbWeu
	g2msj3xFtNFYAfzdIboix8TKpiK4pQfoMbKGR9m4IX2t3AWwSb10LZdWTKlO7NSv
	1hE1JMuqeSYDh71kySIVGBd0J6WquLpBw3V7Uw3Irh2GatcE47z1Ckxkf2VDP30b
	2b7Fs5F5402o20mIrN9M/lwfAdBbfVz3/RH/xDNTsrlWSusW0uRgexuXvBCtTOVq
	wM+rCZhJinE1D5s7F6r2ct4Jec9siuF5BmoogZkQJUjjiKrQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdtqpk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 01:18:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU5AoEDX9aN5++d7+/6cilkPgjddvVjvH6U+qCj7vZ/lk+4a8T21jDuADZQEO8xo44MCZbBAgYbgCeZ3l25t6CBgYwKkpa1Rint4gAgRnDUDp4XQrXry9OovlGFayjfwOsmIShvhdF+RwzulwPD6mXrt8iT5uNiI5CShqu3QBLRPKZJJAbn6cicf881V7Xpd6rEUtd92kduk6GsFJ+aWTAyazahaXLuhBvTWfYzHi0C2S3KDwS6rBg9yVtj7s2/SpUR4L+tFqM+HQwNqShhSpcr2WCcdTQ9C/Lvnc9dfU3KA4qkeSBcQGeURJOCV2K0veIbFSvkV+ix68r1rJCUxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0KTShJOT4kz8zJHzur75/fQjnOCUuH/DhSDyNvLPKw=;
 b=RiBvWhMbprm8ywP0fdzp4QMCAPmG/qTzJAzYTgfh4AOFuiVFuYY+MXXNfYulzgrFAOCUQcepJ5ThH6RRsPNAfqNZXOJiEeJK52OB0BGtsyIuhbWhmxYBCd4yb9nEzHOfSb2qUAdkSSbf7zrU5VXFErebnjJrv24Uo97fMbIaI56X7AuKypPCFIHgrJFpuaQIYQ2bWoJagxvlLneVjevY9usZ1RO+UpAJlMTMTow9NKaNh7oIMWRP+esI6PxvcgHiLr/UbMb+yLNMnSNrKxOSnQ7mnDoopmYOOqjR88bNj9fJ+lvAreiSH1wskN6qe4DRswtXSgYAcK5whS1widAZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sat, 28 Feb
 2026 01:18:08 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 01:18:08 +0000
Content-Type: multipart/alternative;
 boundary="------------JJ1jd6sJK2ndH1myzM4h3FOF"
Message-ID: <f87377df-9259-4c79-8035-f864246e5c5f@windriver.com>
Date: Fri, 27 Feb 2026 20:18:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] nettle: upgrading to 4.0 FAILED -> FYI blocked by
 gnutls
From: Randy MacLeod <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com>
 <f22d7183-760a-41e5-8713-8a68b24918dd@windriver.com>
Content-Language: en-CA
In-Reply-To: <f22d7183-760a-41e5-8713-8a68b24918dd@windriver.com>
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB4855:EE_
X-MS-Office365-Filtering-Correlation-Id: e4333edf-fbe2-4610-3b66-08de76673b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	weZaA00Vlxa4l2K+2IdAcJTnknXD4djMSjsEHtwKbe4Xu+wsQ9a4OdcRbxxY1foQrII5cAmaX9ER/Uf5l26/R8mHVZ5DCTpz9S3UbbT/O6B+mCsloH9hJZRh7htm1ITB1C/LoYD4tuSPC2jCuPeo9KP5eBkrTD9M0/UZ8+bmw17IX9WVxJw2EYlftpMG72PvHMj6H0/LqN6o9eL0j5IqujVF8HNa078FrYu6dTRNmKVkCeeCn4OcAKfyKqkoZMzLkMUejUHdT4+raD8kI2t45n043uCzBA/sqJ72g+RtwDq5ki/bgLNACz04YI28DRwQV0nmoQrQL2Syjw+fX/Bk5OS+S3xtK9rWi8Ty14Umh6zf4rBk4CAEzGdrvP8Vc3npTQ1hhN7QoG0HG+Fm4H82QRTQZ4xHr5OuKY6bHN6/v8vqpP93lzU93OZYywBWjIPH6pU5U5SG7DTp9CeFFwELPGbW8kLXkgilgDeTVrpuYtLHJoj+HSIvih+2QxwfRQty3PTrEANqb9bFjMxT3HLoy9re6iP4FjcTz5txdlE0Sk2uxqgetjAcE2clEG3R0oolhVp+Hk+g7ont6+U6Z46peHYsSRTBuWXOZAInlSC3JGQrxIXbk29Q2J+pMP6/FEnkopoQxWCALt8fhxpsviE1w6UAjJzwFe4vM/JkSGKkZZng30MmSozUPabDq7cAtOWq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TkJXa1VNTDl0eWZLSERRTEMvbDFiMnZPZjZocmZrMGdvT0lKVEY4Q3R2Y1ZW?=
 =?utf-8?B?N0p1Y3F2T253dDlPMkJFZ0pRUzgrczRHRHVVTXNPZkxIM1pzS0pjdFJFUFB6?=
 =?utf-8?B?djN6VlZhS3FLYW5sVFM2WFNMRE14NHFLeFFVY2xIQStvZHVpTmRDVXI3MEVu?=
 =?utf-8?B?MWhsY1JyOHJyY1hvSU83dERxUlorTzIxVDR2UTArbGNKOE5XOXFDakt2cm92?=
 =?utf-8?B?ZFZiM1pWekpnZjVTcXBDa3BFdjQxM3plblRUK2VPLzcvUnFhdHB2eVhuenNz?=
 =?utf-8?B?MUpxQThTMWdIVWVtWXpkOEI5WTI5Y3hEcDU2eG51OFpsRG8rNFgrTjRITnBh?=
 =?utf-8?B?RnJibVU2VDlYWnZEWGQzSDdUOW5yR2c4bnFrWTY5RmVOZjM5Y05zNHk3dGdW?=
 =?utf-8?B?ZnpBdUY5TnJkby9OU2hISGNZRUNJeXgrVjJIWkdVUEdpYVRkZlNRaUF4YzBW?=
 =?utf-8?B?SitHNHJQTVBYTmdaWlBZcGx3NnVTSWFqZlBGZGhVN2NuTnZFOVErbFl6M01C?=
 =?utf-8?B?NGZLeVI2NHhnbEd0aXE2VnhBaC9nRzFEdWRoRjdiaWtQZE9sMFJMZW51Y0tV?=
 =?utf-8?B?TlNGYngzMlI5R0wzeHpTMHdBdWNicE0xZ3hJWE1uNlpFL1JPSHdTdzd2anVP?=
 =?utf-8?B?ZjgvK3RIYlVudjlHOUc3cTd1T0hGSEVENXJTZGlQcUlqUGxDWlBOQXdma2hG?=
 =?utf-8?B?Qk5ITnRMTDM3TUJoeHBIZEVUeUY1QzdXZnBQWHo0L1RoWE02WlM4SHZ6K1U0?=
 =?utf-8?B?M3JlNlo4ZzM4RU9SNkxwVU13cDNTSFo3ZWcvcHlmZm82Y09pSmprc3ZlejJ6?=
 =?utf-8?B?UklxOEk4OTh1ZGVCV3VwenNFbHdlNm92UW1FM3VWTEhsYTYvVjRDVWR6bVd2?=
 =?utf-8?B?REQ5QXFxN1dUNGtDZnFiMCtuV1NnWENWZTFvNm5qRlZ2NC9BUVM5RFRBOUVT?=
 =?utf-8?B?M1ZoMWhNSkRmT2RONzZKa0ttZlZMM28xd1puRXg5STI1RDNrNjFPYWVqNC9I?=
 =?utf-8?B?Q0V4QnBFdS9oMjhaQzhRVGhRQ3JYZTJBTXNLNXNpVFNHYWVxeXNmT1lQb3Bu?=
 =?utf-8?B?YjJVb0x6UjlZZnlzQVVBREV2TzhCUFp1S1F2SjVSeFUzNnJmcmxWZnJ1aHdr?=
 =?utf-8?B?ZmRBYlZwVm13NU1lRGlJRS9HQW8rZ045bGRUaUJpaDZsSlhOMEJPNklLWUJi?=
 =?utf-8?B?LysvQVZLencyRERZdm5rakMzOVRuNkg0dHp5TDlmbXZiSXc4N09kQkg0d1Zw?=
 =?utf-8?B?UUVQb3V0T3ExYUxrTEFwVzdqbXBsVmc3c1dJcHF6UThEdW9oa0dkRXNsdFAw?=
 =?utf-8?B?WVJ3aldBeVNxbTJJVW9BWWZ1SVNJSHk0K0VIVmUyeGVhV0U4d2JVSVRsVnhR?=
 =?utf-8?B?Wmw3VVBVV01mTjR0a29lb0lHOXR2S3Jaam9KKzV4b0lpUjEybVZYSytlakhm?=
 =?utf-8?B?UXZPQnYxeFpoYldHSTZETTVTR2hPTmpJdmRycHBYNE5rYW1IREVxSS9kRmdG?=
 =?utf-8?B?cUVLK1QxbWFNL2dCdDJCNURobk16UkZlVHRxVllGeWIrMml1NmU3aVdyV2hB?=
 =?utf-8?B?RkxudHJtTUlpZnF4VzJiRExPL2thdVROVzI4UHZGUTFVZ2pKUUpJNGFEcFAy?=
 =?utf-8?B?bW1RYVY2bk83ejFQQThxcElSOTVZeTVqWThNdGVXb0FRTmY4V2VJYzhBckpE?=
 =?utf-8?B?WXlWU1FIZlJqNmgvY0ZxbUtoZjFsQmMzSzQzV1ZzT05NOEpTOHF6MXh0eGoy?=
 =?utf-8?B?ZlhZQmkzNThsUVJNVGxLRWM0SXZncjRGTlhNZnZzdFVBcDZwQkRkMUJ5MDNj?=
 =?utf-8?B?YzRiN3RoUlFNeE1lYkVoc2k2VjNCcVhQYVluYnNCZVMxbVNFSGlDU3pmNGx3?=
 =?utf-8?B?MWdhVzRTTDhFZTR4L0dJcDQxM2JWaHBlN2NIV1BOYm41OGcrb3VZeWZ5M3U3?=
 =?utf-8?B?UEhLc2d5blNIcWZQZkcyS0h1MG9nVkd6N21ZK1lmMFZGTWtzcklKZ3ExbUdj?=
 =?utf-8?B?S0diQzRzdGV1L0JqdHpwTWgxMmcxVEFsY1V3TnFWWGtmWnVmVWpxc1l1OEIr?=
 =?utf-8?B?ZnFOSlVyczM0bmw0Z0kxV3NSdGFGZUZyK2JSZ1d4NmxCQ3FpRmZKQklWanlj?=
 =?utf-8?B?VTNkcTVLNFRWY1BmRlg0d2Q1UnBCTTRCU3h6NXIyUzk4amF3YmQvaXdYd01Z?=
 =?utf-8?B?aGlMVTVkeC9OZ0pKWXhKd2NHbzNzb3Bab3V1Wm1VaURLdlVSQUMxSE1BaG9r?=
 =?utf-8?B?alVKajBlT0o0cHpaWVNpQWMrQm5GSnZNWHZ4bEgwSDY3SE1ReUVOVFBUbkFH?=
 =?utf-8?B?T1M0OWpVUFRZd3NEaFhteFJhODNjZDM3QWpCSDUybWxzUHNNZ29NNVlJUUFQ?=
 =?utf-8?Q?iawKcoFwTwpRa9WY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4333edf-fbe2-4610-3b66-08de76673b24
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 01:18:08.0493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdS47c6vQkqYtuQfJnbcozFD2GXWZeM/cXwBxrdCB/ueAfYVCyDf0aBsF/dvLpw+TCw8ugiZoG/Pr6tx5fUoGbhWSknvds1N5RWaxKpyViM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAxMCBTYWx0ZWRfX0R7Q46V5uxqN
 y3PeEQeeLRv3BIxzGscpjQ5NxFG9Xz2+DydtSPX8wMKSgULoVV0OktGE/zK3sklcmRM6yZyfOd/
 uUX1ikHRkM+CM7kUqy7SqoQ41c0WOC1edPw/iPVfSyS/UjwqN6JcnojITM7TDL+cidMVdIwRHR/
 QAdytPpI/l8jzEdRhPmHy61BvZGjbljYSdNLhRG4sz5sI9KdRFx9HekNyhH/Ziumc3VbOomjAK3
 2I3Q3wR6jg/BcsE3Sy6YcJWT9dOVD9F/5pkkd4r+Mlb2vBliID3hX6JC3PmK6LZSoDkvRl4WWMq
 DntZwxl8HmKPwSGD/AN7vkK4byQKF3R1JoUkxydJuS+kx30C5qGF+YF6TyeoMDFWJV3IdBKH6UJ
 BLcp0d8bhG6QCk+NfQVgb04guIOxYG/QJH+/z7mPQfe2r6WPgisHsiP74Dd2S7Q2EE84w/1Qmuj
 J0/dwx1gb6k8WR151jA==
X-Proofpoint-GUID: sO1uXG_yXT09g6ENytnhZddf271rnLMN
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a24253 cx=c_pps
 a=+4AL93Ollhzyglb1kYk7Zw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=p0WdMEafAAAA:8
 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fzNgmPRQkRE5VHkAzhgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=B8ibFTVmAAAA:8 a=g00zPOr8beS1eM9NBCYA:9
 a=GrGRbjO6AwC05WYK:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=xvSgdcfEVHFitugM1GHH:22
X-Proofpoint-ORIG-GUID: sO1uXG_yXT09g6ENytnhZddf271rnLMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 01:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232121

--------------JJ1jd6sJK2ndH1myzM4h3FOF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61S1AxXY2269071

On 2026-02-24 4:38 p.m., Randy MacLeod wrote:
> On 2026-02-18 1:41 p.m., Auto Upgrade Helper via=20
> lists.openembedded.org wrote:
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe(s) *nettle* to *4.0* =
has Failed(do_compile).
>>
>> Detailed error information:
>>
>> do_compile failed
> In case anyone else starts to look at this the upgrade,
> I think it's blocked by a sha.h dependency in gnutls-3.8.12 (latest),=C2=
=A0 (1)
>
> There's a 3 week old bug to track the problem:
>
> https://gitlab.com/gnutls/gnutls/-/issues?sort=3Dcreated_date&state=3Do=
pened&search=3Dnettle&first_page_size=3D20&show=3DeyJpaWQiOiIxNzkxIiwiZnV=
sbF9wYXRoIjoiZ251dGxzL2dudXRscyIsImlkIjoxODIwODgwMjB9
>
>
> so the nettle-4.0 upgrade (2) may have to wait for the next YP dev cycl=
e.
>

Apparently nettle-4.0 with the gnutls patch is=C2=A0 working now:

https://gitlab.com/gnutls/gnutls/-/merge_requests/2075

If you try it, please reply here.

Welcome to le weekend!

../Randy


>
> ../Randy
>
> 1)
>
> | libtool: compile:=C2=A0 gcc -DHAVE_CONFIG_H -I.=20
> -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86 -I../../..=20
> -DGNUTLS_BUILDING_LIB=3D1=20
> -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../../gl=20
> -I./../../../gl=20
> -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../includes=20
> -I./../../includes=20
> -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../=20
> -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../=20
> -isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-nati=
ve/3.8.12/recipe-sysroot-native/usr/include=20
> -I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8=
.12/recipe-sysroot-native/usr/include=20
> -Wtype-limits -fanalyzer -Wall -Wbad-function-cast -Wcast-align=3Dstric=
t=20
> -Wdate-time -Wdisabled-optimization -Wdouble-promotion=20
> -Wduplicated-branches -Wduplicated-cond -Wextra -Winit-self=20
> -Winvalid-pch -Wlogical-op -Wmissing-declarations=20
> -Wmissing-include-dirs -Wmissing-prototypes -Wnested-externs=20
> -Wnull-dereference -Wold-style-definition -Wopenmp-simd -Wpacked=20
> -Wpointer-arith -Wshadow -Wstrict-prototypes -Wsuggest-attribute=3Dcold=
=20
> -Wsuggest-attribute=3Dformat -Wsuggest-attribute=3Dmalloc=20
> -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand=20
> -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunused-macros=20
> -Wvariadic-macros -Wvector-operation-performance -Wwrite-strings=20
> -Warray-bounds=3D2 -Wattribute-alias=3D2 -Wformat-overflow=3D2 -Wformat=
=3D2=20
> -Wformat-truncation=3D2 -Wimplicit-fallthrough=3D5 -Wshift-overflow=3D2=
=20
> -Wunused-const-variable=3D2 -Wvla-larger-than=3D4031=20
> -Wno-analyzer-malloc-leak -Wno-missing-field-initializers=20
> -Wno-unused-parameter -Wno-format-truncation -Wimplicit-fallthrough=3D2=
=20
> -Wabi=3D11 -fdiagnostics-show-option -fno-builtin-strcmp=20
> -I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8=
.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
> -I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8=
.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
> -I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8=
.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include=20
> -DASM_X86_64 -DASM_X86=20
> -isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-nati=
ve/3.8.12/recipe-sysroot-native/usr/include=20
> -O2 -pipe -c=20
> ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-xts-x86-aesni=
.c=20
> -fPIC -DPIC -o .libs/aes-xts-x86-aesni.o
> | libtool: compile:=C2=A0 gcc=20
> -isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-nati=
ve/3.8.12/recipe-sysroot-native/usr/include=20
> -O2 -pipe -c=20
> ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/elf/sha256-ssse3-=
x86_64.s=20
> -fPIC -DPIC -o elf/.libs/sha256-ssse3-x86_64.o
> | In file included from=20
> ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-cbc-x86-ssse3=
.c:34:
> |=20
> ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86.h:4:10:=20
> fatal error: nettle/sha.h: No such file or directory
> |=C2=A0 =C2=A0 =C2=A04 | #include <nettle/sha.h>
> |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~=
~~~~~~~
> | compilation terminated.
> |=20
> ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86-ssse3.c:2=
8:10:=20
> fatal error: nettle/sha.h: No such file or directory
> |=C2=A0 =C2=A0 28 | #include <nettle/sha.h>
> |=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~=
~~~~~~~
>
>
> 2)
>
> nettle patch in progress is an easy update:
>
>
> From 9ceab42c2ff568c2f770817cef6b7192e245a2e3 Mon Sep 17 00:00:00 2001
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
> Date: Tue, 24 Feb 2026 16:06:22 -0500
> Subject: [PATCH] nettle: upgrade 3.10.2 -> 4.0
>
> Release notes:
> https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00002.html
>
> license change whitespace and http -> https
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
> =C2=A0.../nettle/{nettle_3.10.2.bb =3D> nettle_4.0.bb} =C2=A0 | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-support/nettle/{nettle_3.10.2.bb =3D>=20
> nettle_4.0.bb} (93%)
>
> diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb=20
> b/meta/recipes-support/nettle/nettle_4.0.bb
> similarity index 93%
> rename from meta/recipes-support/nettle/nettle_3.10.2.bb
> rename to meta/recipes-support/nettle/nettle_4.0.bb
> index e651f68cb9..2156a10c00 100644
> --- a/meta/recipes-support/nettle/nettle_3.10.2.bb
> +++ b/meta/recipes-support/nettle/nettle_4.0.bb
> @@ -7,7 +7,7 @@ context-independent set of cryptographic algorithms"
> =C2=A0SECTION =3D "libs"
> =C2=A0LICENSE =3D "LGPL-3.0-or-later | GPL-2.0-or-later"
>
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING.LESSERv3;md5=3D3000208d539ec061b899bce1d9ce9404 \
> file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> file://serpent-decrypt.c;beginline=3D14;endline=3D36;md5=3Dca0d220bc413=
e1842ecc507690ce416e=20
> \
> file://serpent-set-key.c;beginline=3D14;endline=3D36;md5=3Dca0d220bc413=
e1842ecc507690ce416e"
> @@ -20,7 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
> file://check-header-files-of-openssl-only-if-enable_.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> -SRC_URI[sha256sum] =3D=20
> "fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5"
> +SRC_URI[sha256sum] =3D=20
> "3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094"
>
> =C2=A0UPSTREAM_CHECK_REGEX =3D "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
>
> --=20
> 2.34.1
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------JJ1jd6sJK2ndH1myzM4h3FOF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-02-24 4:38 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f22d7183-760a-41e5-8713-8a68b24918dd@windriver.com">
      
      <div class="moz-cite-prefix">On 2026-02-18 1:41 p.m., Auto Upgrade
        Helper via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com">
        <pre wrap="" class="moz-quote-pre">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nettle* to *4.0* has Failed(do_compile).

Detailed error information:

do_compile failed</pre>
      </blockquote>
      In case anyone else starts to look at this the upgrade,&nbsp;<br>
      I think it's blocked by a sha.h dependency in gnutls-3.8.12
      (latest),&nbsp; (1)<br>
      <br>
      There's a 3 week old bug to track the problem:<br>
      <p><a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/issues?sort=created_date&amp;state=opened&amp;search=nettle&amp;first_page_size=20&amp;show=eyJpaWQiOiIxNzkxIiwiZnVsbF9wYXRoIjoiZ251dGxzL2dudXRscyIsImlkIjoxODIwODgwMjB9" moz-do-not-send="true">https://gitlab.com/gnutls/gnutls/-/issues?sort=created_date&amp;state=opened&amp;search=nettle&amp;first_page_size=20&amp;show=eyJpaWQiOiIxNzkxIiwiZnVsbF9wYXRoIjoiZ251dGxzL2dudXRscyIsImlkIjoxODIwODgwMjB9</a></p>
      <p><br>
      </p>
      <p>so the nettle-4.0 upgrade (2) may have to wait for the next YP
        dev cycle.</p>
    </blockquote>
    <p><br>
    </p>
    <p>Apparently nettle-4.0 with the gnutls patch is&nbsp; working now:<br>
      <br>
      <a class="moz-txt-link-freetext" href="https://gitlab.com/gnutls/gnutls/-/merge_requests/2075">https://gitlab.com/gnutls/gnutls/-/merge_requests/2075</a><br>
      <br>
      If you try it, please reply here.</p>
    <p>Welcome to le weekend!</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:f22d7183-760a-41e5-8713-8a68b24918dd@windriver.com">
      <p><br>
      </p>
      <p>../Randy</p>
      <p>1)</p>
      <p>| libtool: compile:&nbsp; gcc -DHAVE_CONFIG_H -I.
        -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86
        -I../../.. -DGNUTLS_BUILDING_LIB=1
        -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../../gl
        -I./../../../gl
        -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../includes
        -I./../../includes
        -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../../
        -I../../../../sources/gnutls-3.8.12/lib/accelerated/x86/../
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
        -Wtype-limits -fanalyzer -Wall -Wbad-function-cast
        -Wcast-align=strict -Wdate-time -Wdisabled-optimization
        -Wdouble-promotion -Wduplicated-branches -Wduplicated-cond
        -Wextra -Winit-self -Winvalid-pch -Wlogical-op
        -Wmissing-declarations -Wmissing-include-dirs
        -Wmissing-prototypes -Wnested-externs -Wnull-dereference
        -Wold-style-definition -Wopenmp-simd -Wpacked -Wpointer-arith
        -Wshadow -Wstrict-prototypes -Wsuggest-attribute=cold
        -Wsuggest-attribute=format -Wsuggest-attribute=malloc
        -Wsuggest-final-methods -Wsuggest-final-types -Wsync-nand
        -Wtrampolines -Wuninitialized -Wunknown-pragmas -Wunused-macros
        -Wvariadic-macros -Wvector-operation-performance -Wwrite-strings
        -Warray-bounds=2 -Wattribute-alias=2 -Wformat-overflow=2
        -Wformat=2 -Wformat-truncation=2 -Wimplicit-fallthrough=5
        -Wshift-overflow=2 -Wunused-const-variable=2
        -Wvla-larger-than=4031 -Wno-analyzer-malloc-leak
        -Wno-missing-field-initializers -Wno-unused-parameter
        -Wno-format-truncation -Wimplicit-fallthrough=2 -Wabi=11
        -fdiagnostics-show-option -fno-builtin-strcmp
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
-I/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
        -DASM_X86_64 -DASM_X86
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
        -O2 -pipe -c
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-xts-x86-aesni.c&nbsp;
        -fPIC -DPIC -o .libs/aes-xts-x86-aesni.o<br>
        | libtool: compile:&nbsp; gcc
-isystem/home/rmacleod/yocto/upgrades/tmp/work/x86_64-linux/gnutls-native/3.8.12/recipe-sysroot-native/usr/include
        -O2 -pipe -c
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/elf/sha256-ssse3-x86_64.s&nbsp;
        -fPIC -DPIC -o elf/.libs/sha256-ssse3-x86_64.o<br>
        | In file included from
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/aes-cbc-x86-ssse3.c:34:<br>
        |
        ../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86.h:4:10:
        fatal error: nettle/sha.h: No such file or directory<br>
        |&nbsp; &nbsp; &nbsp;4 | #include &lt;nettle/sha.h&gt;<br>
        |&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~~~~~~~<br>
        | compilation terminated.<br>
        |
../../../../sources/gnutls-3.8.12/lib/accelerated/x86/sha-x86-ssse3.c:28:10:
        fatal error: nettle/sha.h: No such file or directory<br>
        |&nbsp; &nbsp; 28 | #include &lt;nettle/sha.h&gt;<br>
        |&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~~~~~~~<br>
        <br>
      </p>
      <p><br>
      </p>
      <p>2)</p>
      <p>nettle patch in progress is an easy update:</p>
      <p><br>
      </p>
      <p>From 9ceab42c2ff568c2f770817cef6b7192e245a2e3 Mon Sep 17
        00:00:00 2001<br>
        From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com" moz-do-not-send="true">&lt;Randy.MacLeod@windriver.com&gt;</a><br>
        Date: Tue, 24 Feb 2026 16:06:22 -0500<br>
        Subject: [PATCH] nettle: upgrade 3.10.2 -&gt; 4.0<br>
        <br>
        Release notes:<br>
        &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00002.html" moz-do-not-send="true">https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00002.html</a><br>
        <br>
        license change whitespace and http -&gt; https<br>
        <br>
        Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com" moz-do-not-send="true">&lt;Randy.MacLeod@windriver.com&gt;</a><br>
        ---<br>
        &nbsp;.../nettle/{nettle_3.10.2.bb =&gt; nettle_4.0.bb}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; | 4 ++--<br>
        &nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
        &nbsp;rename meta/recipes-support/nettle/{nettle_3.10.2.bb =&gt;
        nettle_4.0.bb} (93%)<br>
        <br>
        diff --git a/meta/recipes-support/nettle/nettle_3.10.2.bb
        b/meta/recipes-support/nettle/nettle_4.0.bb<br>
        similarity index 93%<br>
        rename from meta/recipes-support/nettle/nettle_3.10.2.bb<br>
        rename to meta/recipes-support/nettle/nettle_4.0.bb<br>
        index e651f68cb9..2156a10c00 100644<br>
        --- a/meta/recipes-support/nettle/nettle_3.10.2.bb<br>
        +++ b/meta/recipes-support/nettle/nettle_4.0.bb<br>
        @@ -7,7 +7,7 @@ context-independent set of cryptographic
        algorithms&quot;<br>
        &nbsp;SECTION = &quot;libs&quot;<br>
        &nbsp;LICENSE = &quot;LGPL-3.0-or-later | GPL-2.0-or-later&quot;<br>
        &nbsp;<br>
        -LIC_FILES_CHKSUM = &quot;<a class="moz-txt-link-freetext" href="file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6" moz-do-not-send="true">file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6</a>
        \<br>
        +LIC_FILES_CHKSUM = &quot;<a class="moz-txt-link-freetext" href="file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404" moz-do-not-send="true">file://COPYING.LESSERv3;md5=3000208d539ec061b899bce1d9ce9404</a>
        \<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263" moz-do-not-send="true">file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263</a>
        \<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;<a class="moz-txt-link-freetext" href="file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e" moz-do-not-send="true">file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e</a>
        \<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;<a class="moz-txt-link-freetext" href="file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e" moz-do-not-send="true">file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e</a>&quot;<br>
        @@ -20,7 +20,7 @@ SRC_URI = &quot;${GNU_MIRROR}/${BPN}/${BP}.tar.gz \<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://check-header-files-of-openssl-only-if-enable_.patch" moz-do-not-send="true">file://check-header-files-of-openssl-only-if-enable_.patch</a>
        \<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
        &nbsp;<br>
        -SRC_URI[sha256sum] =
        &quot;fe9ff51cb1f2abb5e65a6b8c10a92da0ab5ab6eaf26e7fc2b675c45f1fb519b5&quot;<br>
        +SRC_URI[sha256sum] =
        &quot;3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094&quot;<br>
        &nbsp;<br>
        &nbsp;UPSTREAM_CHECK_REGEX =
        &quot;nettle-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;<br>
        &nbsp;<br>
        --&nbsp;<br>
        2.34.1<br>
        <br>
      </p>
      <blockquote type="cite" cite="mid:0101019c720f0fa8-77ada6f7-2fd8-4dac-8882-d071da0437da-000000@us-west-2.amazonses.com">
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------JJ1jd6sJK2ndH1myzM4h3FOF--

