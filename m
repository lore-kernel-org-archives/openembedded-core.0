Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018C3D58E49
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 02:15:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151744.1772417741663826615
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 18:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BUFvgzwY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7521b89b40=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6221jTa81161991
	for <openembedded-core@lists.openembedded.org>; Sun, 1 Mar 2026 18:15:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=73bUk6hznpGEOTocx1/zps
	hcuN5pg3kkMDXr6SRQNGg=; b=BUFvgzwYH9Y9zLFh95xjGiij0Uof0PH/NyjpfD
	aT4hM/iPqCouWnidB+6sI8bUYaynmVb8L3ZK/mf6D4om2rwHmO3cxuusIdChYfza
	yvvdZqkZTF+UQdPk/rmf79Eg1eHoGDKlKCybZFluvrHZMTz7YjTl2NhNfbtqInKc
	jK/vndR96mpzmaX14TDbLFLfH49sTyBxiPGwrpsrBy7sGOt+NQOko4YSN6jDFb62
	x1flf2siWTdVLWlZJ8qnHhDQZiHZhqW6tir13e1lHAtzHG0SlXoJ37ve5Cbfr3+B
	nXS4QxSPTmcX5RH2YWyW0RT2OtfTOUpRXu3q9ee1SzCzz5fQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rghbj6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 18:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3slWxks5ThRZAJ8HNZHGTa7Rp4sg0eyPWy+XDzWzw9EgleFILRpyWAad1m+PqVL/Xfh9wEWuaoOkHD+VQJ9u9TgSQQskOq/KmWhVI7HrWHFQwuQHAdVcxYqcJr2N11IFoLTLAgRHvbcWa6dM1YMldf40QSsLHp7TY12nkOgHxSUJSHDuP+zgswKAZSzfrmseciXrb5ncjufV/IhswKcM8C9gLmC6ebuFwULYHC6DJ1iGumtLG5GsExa31LDHINz8W1gGjGyv2KOf8pGOIaESX9jWM3CoRZ2ROOzaAo4K3SEAo3gMlZ36z8MHBn/U+iglF7z97mQua5Mz9iBtci6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73bUk6hznpGEOTocx1/zpshcuN5pg3kkMDXr6SRQNGg=;
 b=aqqWvMX5oOYAjF3Y/BNQR9FrAhW0/ZHGT9uIkFq2PwUfWuP943TP5loo0UbCoidDJXjlu5o4KC0LAJ6gM3iIDOmbAdqxPpvn8Ks2hjQmBiiHkBNobq1klSzF3yjP+ZwfPv3Qz0KZVwEYZDtp+VDOuuDu9Jbz+aPjs0Cmid7wc0J5VqkKDoCpsqXBio7Pq6WZIj748rp7H2NQZUVvfc1RNyAiXgDRs9/S4JK3M54bJzhSPxL13KTKlgncap7k0fTN/ie1fkmd1ekbbNNxurH/9lcSpi3Eb+gCosgxPsqwPbVKwOKNjvFC4WEFYhzy3ofnG710atQzArH/4FwKL6UDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH3PPF3DE9570BE.namprd11.prod.outlook.com (2603:10b6:518:1::d18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 02:15:38 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 02:15:38 +0000
Content-Type: multipart/alternative;
 boundary="------------GtYpu01a7QXkW7mIOTtY1uA7"
Message-ID: <989fa4ba-3165-4b44-b380-017e535d228f@windriver.com>
Date: Mon, 2 Mar 2026 10:15:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/yocto-check-layer: allow to explicitly
 skip check_network_flag in recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260227072110.2807435-1-hongxu.jia@windriver.com>
 <CANPvuRkDSpvyioZvO7iVLhPBtUQQytYRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com>
 <7c4ae514-f95e-43b6-8e3c-c5fbe4ad3048@windriver.com>
 <c60d35e74e13c5d4c93eaac67dcb726c25e61f76.camel@linuxfoundation.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <c60d35e74e13c5d4c93eaac67dcb726c25e61f76.camel@linuxfoundation.org>
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH3PPF3DE9570BE:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fad6bf-3f82-4f8e-53c8-08de78019859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	nnap7IvueukelpoC8I+5M5mYyN8WCYVGCoD8P2QmbIf9/MPdpw6X2D4yAvdX6U7HnWoThjyxh9P6/9e9PhBDFGdaLakoqwrnwcOW6Y7yIS1m0h4dMLH35vfoURNjedbk3uLTpF8NjvaxqmbIUDk2m01I6i5ToSqeiUCyP7Y1jdFBaP9m+zd0qZLFhYHM1t+hqPraTiF1pAMgtz7vchqCwWMsPkyIoXzynpBbdj29eXBFgfac6YCNpmf1OhU7v1aZsVx7ha4yIx+vstdCQjZ9AXk4o72jPNQecojJdJah4zlkbCb7x1NK809wEbGetdC3JciSEYumGewLOe8aBnQwVBYvqypVEbY0R4MfQe0s1VA9ELcagF5cGQp170PIVjqIEuyjhko4N/hfN5XjgdeZM/DrR9Sm9vJXxCN2xin8XrkC+3UOgRlt65gnFb+t4T/RnuUAwzfa/aelTCHFGFghVDuJUaGNpnVYv6TuaLyeo9YtGQ0aLEV0jM3J4n84mWEHWUyPah5DNWM1DyFnTlfaAEU28QP5J9JYfpbfvI77+qbovHe6maThSXmNprRXAqbHniRINfKwylgc36gKnxJpjQE+PExw5Wd300L+995pfm9C9i9UCV+WkeR7kE0WSyuUCbl0XlahorfigBIH1nDcjKo90A5xHgTjM4IOnucy6RemRXb+I5ecxHtCStNUt4f5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWNhL3VpVXVFakpNdFJFeXB5aEtaODJtNGtXMEFuVktibGlscXFwa1pqbmF1?=
 =?utf-8?B?N0piRjZEbUpyK2FsTlExZTJ4NkNyZEdpb01IamlIcFBYUXpOdnVPdm1ITEU3?=
 =?utf-8?B?TUZTbVl2ZEl6TTdnYnlNaXA5ckJ6SjdyUXZYTUlIVUtPN1MyMmU5dDdjVnlo?=
 =?utf-8?B?VVFVOUErMlN2NWhSYlZObWQrRjdCYXBIckVtTm9HOHY3dlh4WEZnemFtTENZ?=
 =?utf-8?B?WTJScnBxR2VXZ1g1S0d0WVZlaXJoYzRiNXdXbHQ2Tm10cGNmWHVwRFBwWlYr?=
 =?utf-8?B?emFack5obU5vMEJlSzRuL3pad2l0d0QvOU96ckF2NWtZa3p3QUo3YUtYNXVq?=
 =?utf-8?B?Ni9BVTJRU1NSYmRzb2dGd25RUjRZQ3hWNTAzcXkwUWFCTDBWQVNOTmM5SXdM?=
 =?utf-8?B?Q1Y4bXRJSmRrb0RtbnA5ZmpoNzVFNkdST2Y2UU16b0NHVzJLdTFVRGhJVkJK?=
 =?utf-8?B?bkpMb3d2MEF0V2s1VkVXYURmQWVjdGphYUs5OVorZ1B1ZHZsM3c1cFY1T292?=
 =?utf-8?B?NnVZL2pyUDF1MW13OGV2Z21UV0ZrMk1Ua0RXM1RtMXlvZmNIZjBWWEI0aENk?=
 =?utf-8?B?NUhoM1lFYzNiMHpxRmMwZ0FsL2tZRTQ4emw1bXRja0g4SzlPM1hwN2NNelpm?=
 =?utf-8?B?UTJKcGU0TFFkbVQwTCtGM3gxc1FtNmpFenRONzRZQmZpc0VUTnI3TTRKSTZH?=
 =?utf-8?B?by94RjE1M05xcFV1NlBQbXF4M3lHNGNlc3ZNR2IycXFnM1lYUFpZOEdvSWxD?=
 =?utf-8?B?TFRUWmtvMmZmdWl4cmxUU0FaZS9OZlQ1dmZlalNJY1dFOVdnZkhRcXNLYjZ5?=
 =?utf-8?B?WjI5UDJPM3k1RWhwSTNxL3IyQWpldlpFcngwM2Fua0V1R1dUK1gwbTM1b0lp?=
 =?utf-8?B?UGdtdGlKSGhlRWxMNGVqODBBMStzT21OdCt5ZmlNNkUvbFNYallmZVFBeUVm?=
 =?utf-8?B?ZWs1Q3JSeGl1eW92MTNCUFV2aHNLNXkwWVp3T2FZd016WE1LcHBnTTMxei9x?=
 =?utf-8?B?UmxxTENGaStlTGxpT0s2czExenpUNlRscHBxRHEzS3gwZnZyelgwaDlrdXZ0?=
 =?utf-8?B?RkE3ajJhWi8xTy9EODhUZnJoOXdGMmE1eTVoc2hIWGlpK1F6NjIxYlI2TEwx?=
 =?utf-8?B?M1VQOFlWcmxLYnE0VHFNQ25uVFRrTDlRUEhUZjB6ZlJ0QS9YeGZZZkxlUk5L?=
 =?utf-8?B?R0c3VGthQ21mSGN6a3h2Vkx1cm9EcG5NR3ptMzlzV1JiTm1VMkYrZy96OVRG?=
 =?utf-8?B?Z3VvRitpYUg0R0creVBtR0xrd21HL1BidEg5TjlpcktTUUhYSnF2RGFEQnpz?=
 =?utf-8?B?YU1lRkhpQ3dEVU9EalFzU3QxaDI4V3RGZ0puc1dEU2Z6TytKNXBHLzFpZlZy?=
 =?utf-8?B?ZU5SL3BycmFIdVJ5WEdPeE9XSk5tRkFQRGpyZnhmNXJDZ3pKRU8xNUJKenJV?=
 =?utf-8?B?SFdZUU5FUzBDaTFYNEhOZ1VCYWp6NnpNdTZEQW1SVnhYaGNHY0d2L3VETUFP?=
 =?utf-8?B?Wjg0WGhyTVhBUld5a00ya3Z2YUh4TXFyd2Q2YWw0a1VoS2VUaDI3bnBQR0Fz?=
 =?utf-8?B?RlZjMkV5NkJnQm9reXkweGJlSHROUVdPYm92WEIwdXZndThGY1h0ZnZaYlVo?=
 =?utf-8?B?SE9ZVEJaTGs2QUdXMDFrU1N1VE53WmtBMldUV2FtTG1zRmlSd1ZMUTFYTlZu?=
 =?utf-8?B?TERMSktVN1REcVZPWkd2QTJzb1RyTFRZQzRLTnRCV3doOXhOYUtGN05VYVUz?=
 =?utf-8?B?QVo5Q0pqSnVRbzlmd1l0N1RHQWxnRFFEa0VqazhuMzhBRllIbkVVS3lsK3dE?=
 =?utf-8?B?eVM0bzIyRXN2VnpsZUNwNGpyUTcyS1BsM0Y4Zkg5aUp6U1BJS1ZhTktWbEJR?=
 =?utf-8?B?TlBKcmNIRFl3aDhnVVRrdWpmWmVvbzBxbi9yM3A1Y2NEeDhBNmQwWXlUVVk5?=
 =?utf-8?B?VzRnY2JKb1dhbFJJREU2VmIydk1DVlNTMC8vRlFsUm5sRW1oMEJPaEJ3Z01G?=
 =?utf-8?B?ZHdxck5VWlk4VnkzUVE5a0M3VzZaZlZiaG54M1c4M0h0RkY3UnRHQ3J4dDEz?=
 =?utf-8?B?UlNxdSs5WUh2MG1ldVRTM09NYXZVdnFRalk1YVB4YXlTOG50RUJqRUNUbVVv?=
 =?utf-8?B?eE45Qm5IK3JJS1I5a1lIZzdCUUcreWJkUENjSTN2NzFYQ3RZOFVSYWx5VXNv?=
 =?utf-8?B?OStwVGY0VlZhcEZqKzVrVDRGUkcxU3lVZEE4cDV1WFZVL09VbUZLdTVuT2l0?=
 =?utf-8?B?MktXdXZaNGVERWpac3d3enA5UUhkaW5HNHVCWU1WRnZhYTE1ZE96M3Yva2Zk?=
 =?utf-8?B?OWdGN1N2M0NFRkpVTWpMcDFOcDU3UmNhVVo3aTdxOEdVZWFZaUpkUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fad6bf-3f82-4f8e-53c8-08de78019859
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 02:15:38.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFKgDKtsi7zLunsFjlZyNr/MXgIGYY6rhHkOcJZWrzZyPYkJOKxdqNIY1fh69+g6ppFY+v+5jP0uqy9Ukq7RmK64SliANf3F6XPqMPUs6Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: C9QeZQqny-pqKA4tcc2yFX7m4BKnkUNR
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a4f2cd cx=c_pps
 a=5tz+rB/kfTqQMEo17N6B4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=GY2MJkrjPZmIjqngsk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=W7mCLQjgXW2KEu_VNPIA:9
 a=POtVW-7wt0vPr_wh:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: 0hzT21JCLqe0E0r1xMfNm5jqHlHyBpEP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAxOCBTYWx0ZWRfX7Q98p0lKe9mL
 KtiLOPEATOCghe15M+3SR3Am/ZbYpTMZmkdmHorZCaZ6Q40U5m9aJB1rJh/aT+dw95vzuVkAor2
 G1qy7wvUBD7xPDklLKpPx52WwRTdHAptJF/XZilmMFKCyKR8ZvGlnn+LztqgPirlZ08IneUvx5z
 D4ei9wu2iMCm9PMsj76uKq2NJHKs6P+gr/xL8VaXYUp24b0b3kpez3pMfsdqwPLlZhV0hseNZmA
 f2mWH5DPN/ktQyDCSIKQfYNTAvvQ0JVWEKojMjFyeULnvoIJTBkX8omEhj9AuuphwCN8TXj//aA
 HS2wXqoN2GdVaaX/1R/iXipE+3pYK8ovZ/n+DF0xwlAM2eJOWiA5tIgZMO+ivLLUkFfeMOZKldI
 e7fTtJiFXVkuRuhup4fxyOB/mvDxRdQftkbcMFWcFI357TYXjjlbY+f8cHKGH8KF2yEHXcfQ3lF
 KoErDQXTwvXUXiy9FkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 02:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232159

--------------GtYpu01a7QXkW7mIOTtY1uA7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6221jTa81161991

On 2/28/26 18:50, Richard Purdie wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> On Sat, 2026-02-28 at 11:27 +0800, hongxu via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!dv8OxyPCat01rw2zoB7PGs6RXntA8xaWqSRCY2_LQQIUia0jkGnmYKY3FxwT17lz3ILBl=
zW_b3fF2-zvT4HgUW0LVF-LshmGK-lhyg$>=20
> wrote:
>> On 2/27/26 17:39, Jose Quaresma wrote:
>> hongxu via lists.openembedded.org=20
>> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw=
8EvQ!aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvB=
eU26B0ju3x5wCHfoAWuj9pQ$>=20
>> <hongxu.jia=3Dwindriver.com@lists.openembedded.org> escreveu (sexta,=20
>> 27/02/2026 =C3=A0(s) 07:21):
>>>>
>>>> +# Format: "BPN1:task1 BPN2:task2", separate by space
>>>> +# build-appliance-image uses pip at image time
>>>> +SKIP_CHECK_NETWORK_FLAG =3D "build-appliance-image:do_image"
>>>> +
>>>> =C2=A0# Check that no tasks (with rare exceptions) between do_fetch =
and=20
>>>> do_build
>>>> =C2=A0# use the network.
>>>> =C2=A0def check_network_flag(d):
>>>> =C2=A0 =C2=A0 =C2=A0# BPN:task names that are allowed to reach the n=
etwork, using=20
>>>> fnmatch to compare.
>>>> =C2=A0 =C2=A0 =C2=A0allowed =3D []
>>>> -=C2=A0 =C2=A0 # build-appliance-image uses pip at image time
>>>> -=C2=A0 =C2=A0 allowed +=3D ["build-appliance-image:do_image"]
>>>> +=C2=A0 =C2=A0 allowed +=3D (d.getVar('SKIP_CHECK_NETWORK_FLAG') or =
'').split()
>>>>
>>>
>>> This could introduce severe reproducibility problems for someone who=20
>>> claims to have a Yocto compatible layer.
>>>
>> The meta-tensorflow, who use bazel build system to build, it requires=20
>> network access at do_compile if download mirror is not available.
>>
>> The bazel is similar bitbake, has fetch, configure, compile, but it=20
>> combined as one command and invoked at bitbake's do_compile
>>
>> In order to support offline build, I've apply a local patch to bazel=20
>> to save download tarball as download mirror [1]
>>
>> [1]https://git.yoctoproject.org/meta-tensorflow/commit/?id=3D88ca1af37=
68e5a01e6ba8b2f09d6cf2a0bfb621e
>>
>> If dowload mirror is available, the build will reuse it and network=20
>> is not required, the reproducibility problems should be detected by=20
>> binary comparison from two builds, we have oe-selftest case in=20
>> oe-core by the way
>>
> If the fetching happens outside of do_fetch, it means meta-tensorflow=20
> cannot be marked as Yocto Project Compatible.
>
> The point of the standard and this test is to move people towards=20
> reproducbile builds with full manifests of the contents. If you bypass=20
> the fetcher, we don't have any of these guarantees.
>
> Our plan was to work out a way to remove the fetching from=20
> build-appliance too but we didn't want to hold off the implementation=20
> of that on the rest of the standard. The fact we've not done that yet=20
> is frustrating to me but it doesn't change what the intent of this=20
> plan is. We don't want to add a way to bypass it unless there is=20
> really good reason. Good reasons might be 'publishing tasks' where=20
> we're writing data out to a remote, or we're running tests. I'd likely=20
> suggests these be in specific well defined tasks similar to fetch with=20
> known properties though.
>
Copy, understood

//Hongxu

> Cheers,
>
> Richard
>
>
>
>
>

--------------GtYpu01a7QXkW7mIOTtY1uA7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6221jTa81161991

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/28/26 18:50, Richard Purdie wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:c60d35e74e13c5d4c93eaac67dcb726=
c25e61f76.camel@linuxfoundation.org">
     =20
      <style>pre,code,address {
  margin: 0px;
}h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}</style>
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
        <div>On Sat, 2026-02-28 at 11:27 +0800, hongxu via <a href=3D"htt=
ps://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!dv=
8OxyPCat01rw2zoB7PGs6RXntA8xaWqSRCY2_LQQIUia0jkGnmYKY3FxwT17lz3ILBlzW_b3f=
F2-zvT4HgUW0LVF-LshmGK-lhyg$" moz-do-not-send=3D"true">
            lists.openembedded.org</a> wrote:</div>
        <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex">
          <div class=3D"moz-cite-prefix">On 2/27/26 17:39, Jose Quaresma
            wrote:</div>
        </blockquote>
        <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex">
          <div class=3D"moz-cite-prefix">hongxu via <a href=3D"https://ur=
ldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!aBhDhydW4=
sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B0ju3x5wCH=
foAWuj9pQ$" moz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mail=
to:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
            escreveu (sexta, 27/02/2026 =C3=A0(s) 07:21):</div>
          <blockquote type=3D"cite" cite=3D"mid:CANPvuRkDSpvyioZvO7iVLhPB=
tUQQytYRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex">
            <div>
              <div dir=3D"ltr">
                <div class=3D"gmail_quote gmail_quote_container">
                  <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; b=
order-left:2px #729fcf solid;padding-left:1ex">
                    <div><br>
                      +# Format: &quot;BPN1:task1 BPN2:task2&quot;, separ=
ate by
                      space<br>
                      +# build-appliance-image uses pip at image time<br>
                      +SKIP_CHECK_NETWORK_FLAG =3D
                      &quot;build-appliance-image:do_image&quot;<br>
                      +<br>
                      &nbsp;# Check that no tasks (with rare exceptions)
                      between do_fetch and do_build<br>
                      &nbsp;# use the network.<br>
                      &nbsp;def check_network_flag(d):<br>
                      &nbsp; &nbsp; &nbsp;# BPN:task names that are allow=
ed to reach
                      the network, using fnmatch to compare.<br>
                      &nbsp; &nbsp; &nbsp;allowed =3D []<br>
                      -&nbsp; &nbsp; # build-appliance-image uses pip at =
image
                      time<br>
                      -&nbsp; &nbsp; allowed +=3D [&quot;build-appliance-=
image:do_image&quot;]<br>
                      +&nbsp; &nbsp; allowed +=3D
                      (d.getVar('SKIP_CHECK_NETWORK_FLAG') or
                      '').split()<br>
                    </div>
                    <br>
                  </blockquote>
                  <div><br>
                  </div>
                  <div>This could introduce severe reproducibility
                    problems for someone who claims to have a Yocto
                    compatible layer.</div>
                  <div><br>
                  </div>
                </div>
              </div>
            </div>
          </blockquote>
          <p>The meta-tensorflow, who use bazel build system to build,
            it requires network access at do_compile if download mirror
            is not available.<br>
          </p>
          <p>The bazel is similar bitbake, has fetch, configure,
            compile, but it combined as one command and invoked at
            bitbake's do_compile
            <br>
          </p>
          <p>In order to support offline build, I've apply a local patch
            to bazel to save download tarball as download mirror [1]<br>
          </p>
          <p>[1]<a class=3D"moz-txt-link-freetext" href=3D"https://urldef=
ense.com/v3/__https://git.yoctoproject.org/meta-tensorflow/commit/?id=3D8=
8ca1af3768e5a01e6ba8b2f09d6cf2a0bfb621e__;!!AjveYdw8EvQ!dv8OxyPCat01rw2zo=
B7PGs6RXntA8xaWqSRCY2_LQQIUia0jkGnmYKY3FxwT17lz3ILBlzW_b3fF2-zvT4HgUW0LVF=
-LshmY5UMQLg$" moz-do-not-send=3D"true">https://git.yoctoproject.org/meta=
-tensorflow/commit/?id=3D88ca1af3768e5a01e6ba8b2f09d6cf2a0bfb621e</a></p>
          <p>If dowload mirror is available, the build will reuse it and
            network is not required, the reproducibility problems should
            be detected by binary comparison from two builds, we have
            oe-selftest case in oe-core by the way<br>
          </p>
        </blockquote>
        <div>If the fetching happens outside of do_fetch, it means
          meta-tensorflow cannot be marked as Yocto Project Compatible.</=
div>
        <div><br>
        </div>
        <div>The point of the standard and this test is to move people
          towards reproducbile builds with full manifests of the
          contents. If you bypass the fetcher, we don't have any of
          these guarantees.</div>
        <div><br>
        </div>
        <div>Our plan was to work out a way to remove the fetching from
          build-appliance too but we didn't want to hold off the
          implementation of that on the rest of the standard. The fact
          we've not done that yet is frustrating to me but it doesn't
          change what the intent of this plan is. We don't want to add a
          way to bypass it unless there is really good reason. Good
          reasons might be 'publishing tasks' where we're writing data
          out to a remote, or we're running tests. I'd likely suggests
          these be in specific well defined tasks similar to fetch with
          known properties though.</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>Copy, understood</p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:c60d35e74e13c5d4c93eaac67dcb726=
c25e61f76.camel@linuxfoundation.org">
      <div>
        <div>
        </div>
        <div>Cheers,</div>
        <div><br>
        </div>
        <div>Richard</div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
        <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex">
        </blockquote>
        <div><br>
        </div>
        <div><span></span></div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------GtYpu01a7QXkW7mIOTtY1uA7--

