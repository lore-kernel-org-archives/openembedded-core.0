Return-Path: <Juhandre.Knoetze@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D485C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:22:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11820.1788452532877935863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LJ4Z5KJ+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3706c886bc=juhandre.knoetze@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G7JTU2720975
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2026 16:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jzB3Hvxc7
	k/PkToBjb6FWasecfXw9jIiFet7ZQiEZ0s=; b=LJ4Z5KJ+vmp/gSRQrO3nm+4GP
	wryPrt9VnY9GFJ+yFX+MHGsE+uq0c4Q1SQYbr8y4nYUOrjmdxD6yxfUmnp99Exyh
	/TKGIITxVp9unjMZtexxH9jeN3vD4TnLLwsdTcu/BT0QC2WH4x9+n/W4uJYLZ92Z
	/0Q4HmSfhL+6ef0y6AKhPLG1cXZq25BBrskI8/LqDSYmuW9ypIDwHev6BZK2GWVR
	Mv/oXCvIx7YpUG9V5Ao0qB6JGG2pyUtqqEHouNw0mB+D3LeCWi4YjM+Z6NChM3JC
	lgX9LOKDPFvmKurUlw9tTX7jlUukDms6ua8qRq3HkVVloGQvQqLFztG9mFjSQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022104.outbound.protection.outlook.com [40.107.200.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5nygrvm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 16:22:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJgS+YG0drijvv+z7wqzZn8Izg1ml9ObXs7KmqePceX3PuxDyNguZEp8LtWzpIgeM6sfUJ+2XabRnlsC70vUWBht3u8kBTy8uUO9x7DM7hvfNbneC/5KtjHRI5nJH11HCN5zeEhEOyR4VKO2PUPd5P47kADhoVBL4Zi/nrF6PPjxmv7Df4LTKSJSfPofcprc5uAkGjPos+1ybzP7q/jFbWen08ylOfBDWtnxWgR68lWgaKgZvudVJxYJgeMGk+4maX340OGADL/M6XshTMQ4zX+hOS7+5G8xM+GgEdvBYvndtO0BLSAlBZaL9dd0TKVzq+ZwxKtcesiQjyKx2JjGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzB3Hvxc7k/PkToBjb6FWasecfXw9jIiFet7ZQiEZ0s=;
 b=c6YR4Gv1Msi59Ev6MsiH9fV9HFZGdNf+wjfsvCip+O7p4xf4Bv5rtxsZ2eHWjXfAlDFyVxy0/Y9PV/OMY+LWlVTvRQxhwRz3HcDhfiDGeGXKDiJ/IQn7+liGbiBzIC/SrTal4f5guHE1NGDwEytFWheYlFpmqdxMj+t4jhm76wUBnVETZV46xizeO8xoql2cCUnRZvrCcNuezRwh5CtRxGCDT7K+uN2GtlNE8O1AuvjAT2XaYZy1A7gPgJgp3FH3Rs+XP+QsbZY7NTPrJQ6uH/M6u5aoCsWt5MpgyLUvBfcIDXDZRaPMAQAC9DyP6smQXCD3lndlsGiReD15xgxX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB3949.namprd11.prod.outlook.com (2603:10b6:208:138::31)
 by CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 16:22:07 +0000
Received: from MN2PR11MB3949.namprd11.prod.outlook.com
 ([fe80::dfbf:4563:6676:e23d]) by MN2PR11MB3949.namprd11.prod.outlook.com
 ([fe80::dfbf:4563:6676:e23d%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:22:07 +0000
From: =?UTF-8?q?Juhandr=C3=A9=20Knoetze?= <juhandre.knoetze@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Juhandr=C3=A9=20Knoetze?= <juhandre.knoetze@windriver.com>
Subject: [OE-core][PATCH] maintainers.inc: Updating maintainer for recipes
Date: Thu,  3 Sep 2026 12:21:37 -0400
Message-ID: <20260903162139.23971-1-juhandre.knoetze@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To MN2PR11MB3949.namprd11.prod.outlook.com
 (2603:10b6:208:138::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3949:EE_|CH3PR11MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0519b7-4692-46f4-0847-08df09d77fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qmmMKlitBV5ePs6CDDGbkJgSurSQza7Z6vMh+Ac/XSnixXht0vgugARNOkG4VJ/TkndvXWbn7TAektdxKID/R4qKwZTZm8zgFqAGaAD/LG5rnflEDJbC2oAIslWWJM4DoG7SESu1KKp3oZKVnwQn3coQPMsr31yP5URc5Nme1fYlhF8WKOmAfpCBrhsAqpvAKAKRA23EeIRrlVZeINjS75Dp9TSHqrPr4g6nuZFNhJPEob67NY3nI22v/9esOrNbCpBeWL2emj0QJbJDfxzHIk2xV/qGxqPV7mrkyFfgAMxndbVWdEWhWhJuZI/uBYzyZdgEU705g11tcXm5Qiwli5YOsg82j0G6jLqbYRsrcHulDAjHWCSu8z1EQdSH82r2Xju/bnKvUEvUlhTxIJ7rjp1p5WwStBSiGyR0zwELubRS/qo6hjhksuJ0Ahb5QU6GFeIBvgJMQSX728M+7r0kAFW7agYrU+6v/V7FMTqngwZU/zpwJ3AQ7029v62JMVsraNifM3OysDOhF5V+SvsddRAUv4M4WWubyZqHpBv3VIM6l0DreEC2GBNNdYs2Ji0V8hAwJfN6KSBPEK5m7a+Ks+zswV3DQOuptQM+EkPnhbWwTkzPGGZECw4CP0im8WyHjWjbq5RWQF29WWuLKf5Ysd/0Ccg7UF3jpfZ7diEs8J2DoBazMJrrqWjGzA65VXKc5KcYD83/XHiuNChTVRJmIYImLztxoxmsvgUM5fbLk84=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3949.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFFrWWtua2w0NHMwSkYzTHlaOUt4M1Frb21hSnZSY2JJTFdTS252VDlnd3Jr?=
 =?utf-8?B?VHB3UDZEZjMwT2JXL0RJNDRSK0hRWWJBbHVydGpsb2dja0diUWN2YjhhZGRG?=
 =?utf-8?B?cVFKVndPQXNjOVFXam9zeC9CZU05eUdRVTl3OVhMVTBnUHRlck9vaFFDOHd3?=
 =?utf-8?B?Znh1VjUwOXA3NlhzanpiY2Yva3VDdWQrUTArZzQrNDBCQm0xNGs0L0VUUzZy?=
 =?utf-8?B?c3dnYkQxRTU1S2FPaXFOZk9qWkhzbzkyOERtL3Y4NGpSOWFhTlNMQlFuTTBu?=
 =?utf-8?B?dmt4Zzg0L3BLckdJVC81WVVKTVppTmdsOS9XZGNSNHBZREdZY1FlLy9BUUFS?=
 =?utf-8?B?U2pDM3ZMdFgwT0VhMUpFQjVEdTlFUTlyQWd4QTUzcWZrU2YwUjkyelMyK01N?=
 =?utf-8?B?NlRtWlNzalBuNGVPZFg3YVB4UkNiUHZ5Rjgyc3htUEdqNnFhRmV3T3ozNmJ2?=
 =?utf-8?B?aU5VYTNQWXB4SG04RjRyUndIQngzK3poSU9sY05VN2JOUzVTRDMzTkFyb2VI?=
 =?utf-8?B?UVU3NG8zb0dRZmFKQTRFWGJqU1RXMnNCZTIwWm1FVncyYnhZd1JjYms3NnE2?=
 =?utf-8?B?dG8ydnB0S3JRbzVHUENsR1U3STkvMGhJckhxa1RSSDg0dlh2NUI5RkR0NlJz?=
 =?utf-8?B?bk1UZmFOV3hEK1RhLzBBcy8weFkwLzJ5L3VkUTJOc2ZqQndmdk0zc0JaLzBM?=
 =?utf-8?B?dlBnQ2ZiZ251c2ovZkFoUWcwMThnSTUvSGU0UUwwQlpLUDErbEk0bkxGaUEw?=
 =?utf-8?B?NDN2Uzl0aHJLK29UUWhiQkJVcC8rTmVORHhBd25NQzlJUHlKTU83dUUySlYx?=
 =?utf-8?B?NVpIMURMTUM1ZCtnb0pzSisvU0lHNVExcWpGSlVLRjY3OUljMUlOVlZpdXJE?=
 =?utf-8?B?dURMT1FnR0FtVlV5M2R2bi9IL2FMdTJyVnQyZ0lJRjQwTWYwc0ZIdWI1Q0hG?=
 =?utf-8?B?WGcxL0FXMisrN0FGcGNCRDlvb3U2SXhSZUpnMHR0MmNpUytWZ2JmQUJjd0V5?=
 =?utf-8?B?ZGh6ZnphMjdFVzQ5U1JuWUJieW1iYTYvRklGaGx6SXJBeTNJTmxwVklWMCts?=
 =?utf-8?B?UkdNZDY2VjRMdVY4aEFyK0p4SG5yL1BBR2ltbnFBNTN4TDZnSG5uSnZTVlQw?=
 =?utf-8?B?anJmdzB1VjhjQldMVnRudDlYMEUxdEtJVlZ4dTRrSWhDbERiclF1eUJDdjRy?=
 =?utf-8?B?RUlHWjd2cy9EMW1sR3ErWWNGUWxaYkovQ0FjZXBJRGo2dTk0aDZNbk5LK0hX?=
 =?utf-8?B?MGFQWkNHYVcvTjRZZ2J3RkdLdWJDSGtSenNiSDd3eGNORFVHanBTWlljL2F4?=
 =?utf-8?B?K0F4RVk4cjFramkvOHJ6UFVmL2tYZEFoVVE2T2RZazdKdytnVENXNHNZZTNK?=
 =?utf-8?B?VzdBcjh6L1VGQ3VRakY0dTJoTVVXMm1FOFArRWcwL0pWVkd2VGNjSVhUKzBM?=
 =?utf-8?B?dE40ZnhqZjR2UVBVOWNBakx1ekt2YmFicXpYSDFVWXdadU1IdktnSmpzTnlh?=
 =?utf-8?B?YzY3R1ViSEhWZUlvc3BiNUZ0RHNLUjdMWVh2OE1teGRWNkJ5TDRydEFXdERU?=
 =?utf-8?B?UEd2U0hwUVBveE5tRkExRzBaeWxHb1VaUmRBeHE0QmEwVnBVSVlLZnBhV3R6?=
 =?utf-8?B?NWdmejd1aWppa0ZlekZCSmtidHR3bGNWWmJHa1oraFpGVFh3Q0hCcW1pcFBs?=
 =?utf-8?B?cWdoWUQ1RnpTZWFTMTJNa1o4Y0JnVVNIU1FnankvbU5lUGl1dDdJVC93UnBx?=
 =?utf-8?B?MVJyU3pSZTVxMzVadWhRV242cFlvbndCNFF4djhPY0xiMWQrbXJSeHhrOVMv?=
 =?utf-8?B?b2txL2VJWnNuZTdpRE1KbjdYU0xqd0JPZ0Y5MU5ZMDdsamdZek14S2E5aldw?=
 =?utf-8?B?ekdqTW5TRzFldEd5NVNEaThGV1ZIUWVHSTJsN3JkbzdXTDBPb2ZsYi9tK0J4?=
 =?utf-8?B?UVNSeUI4Y3ZkTEJtY1NOTjczV1c0ak5CSGxHRENLM25mYm1ValpxYllxbm0y?=
 =?utf-8?B?OHBmbFVnczRRUHhjK00wdXhXV08xUzFGeUVZd3hWY0hZeFg0VnNlczVQcFJG?=
 =?utf-8?B?OWg4VExMRnUwR3ZJL1JrUjc4dWtjMVR3b0k0bHhZNm9teDljUXAyeWZvNlhz?=
 =?utf-8?B?Y1loeVEvU3hlWG1xd2hnUGMxWDlZZzVQUVJ4WGdvWm1WaE56c01SZXJVNEdR?=
 =?utf-8?B?a3R2ZFdiL0hlbjg3K2xwSzBLMWd6Y2JqcXVxMzFDTi9wRDh1ZHVQRUhaVnor?=
 =?utf-8?B?QWJKamJYMStBSTFFUDdMbTU1KzUwUG9aRFlrTTROWGpiWGNSTTZQZkh6UlRT?=
 =?utf-8?B?dXVYc2YyMXNMSmhzWmlobFFrN2N1R1R5TUZxSUZsZ1pZOW91bnZFajRUWXFn?=
 =?utf-8?Q?P1gJqVvZD5/vYGkrm98OkrZx89aI/uwBHhri4?=
X-Exchange-RoutingPolicyChecked: 
	bptCk0BxJehCg5j8i58yQp2PR2uf+zvU/XZZh1rLR2fCpp2zIeQZLXjHmmw1tOaLpuBXne9rCU0JMMnWX1KWmI8qYxVEho2MGeu0RbJiIueBpuyGYQ93C56n8XZ6RVTsCakHFRn/kaP2sYsX0v062nQE3bPCIUWwFMLS/76l93428BMWkqDLRL2/GMAwLBvVXR8M8yjii/Ntl34Hp/GPufTh6JIpAq48MtuexnwHHQsuHSs50Q9yKwvimKiQXaqZ/kER7SQ2PD1wGho2jVVT0uH4xWmNZ8VNu4r2+9XNcOoPnYHKkeR3z9yYGrVv9PncvenB9bGDdBGA1PbZszvkkA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0519b7-4692-46f4-0847-08df09d77fcb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:22:07.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XH8q6pmC3/1NSSZdmO8CgtZUW7DZprqGAPx4/cx/SU7Wg/cfyhl8PN7jNqcPHwphGhk03VLyPc36B43JADiEEO12ps98KRCvWLpk5/xIkvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
X-Proofpoint-ORIG-GUID: 8a-PN-_lo_I_zSkHtIbpwUQKIOGizEO2
X-Authority-Analysis: v=2.4 cv=LvuiDHdc c=1 sm=1 tr=0 ts=6a999eb3 cx=c_pps
 a=Yy30xeOXBChOadhm8XbUsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=r9lhY5OmAAAA:8 a=iGHA9ds3AAAA:8 a=67k8HWImAAAA:8
 a=omOdbC7AAAAA:8 a=8wEic9LhAAAA:8 a=uChsZFC9AAAA:8 a=NOYKa1jccAGav8h_t08A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=lBmE0PM3J_p9GLi-zqlx:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=-Ce2kUORdVUGt2UwD6To:22
 a=M9VCcFR7d36vLOFuqMn8:22 a=ULtXvzFHYWHLyBAuiDia:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0MyBTYWx0ZWRfX5RZrCleguD5S
 bKyqvtPc9d+MLgqBRgMA+N5kqeXHw7FNK78oVKPQY77EUYoRrzjWlBZkVILjmnDl6z4gDtCsiQX
 89PXaIaeAvEM1xa+ripW9aXab8Z7v9RlkKb5XnXYUZw/Q43cfVrclgTO4Lzsqes/skTKPEvucif
 VvFGlNxIblecPeSt9aKOtK07S2gr7sxrutnEi+gnsqtcrJms5LdOXhE7JhKPdQj2XPmuCJe2/qS
 jK5BWJLsHH8TyPB8FyP+r0UO08vJ0hXV13hu8n2g0wuAAXSBdfh9tL37torbDm+gu8bzSdkS+DW
 mHuX2zE4WAaPpGEWQPV4nBu4gYSg1yGP6halHQbuBCNdujhWxgFYIUxXP0ZXHIPmV01lMBZgXig
 RboRJAV0UCFu7e/GZ44GShrzTEqdnMZXNJe0c2WAlqF0KJd+Wtk6AMB7H0jzw1pJ4AKx/a98R2d
 ixgVOrRkvlE6PORh80Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0MyBTYWx0ZWRfX/W9vGyj2PpLR
 1sj2+Hn1nSiHCeIEuWSVDsB4QkAN73SH1YaaSOBC9yvOtonjEv1jlalgMddqFTmMiafVdGxdpbR
 KNuqQr3H7R71rPdFdHmxTn/umyEwh26mNWxWBKkWFyx1dxSM4b/l
X-Proofpoint-GUID: 8a-PN-_lo_I_zSkHtIbpwUQKIOGizEO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030143
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 683G7JTU2720975
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 16:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245035

Replaced the maintainer "Chen Qi" with myself, "Juhandr=C3=A9 Knoetze", f=
or
the following recipes:
    - dbus
    - dbus-glib
    - dbus-wait

Replaced the maintainer "Yi Zhao" with myself for the following recipe:
    - libsdl2

Signed-off-by: Juhandr=C3=A9 Knoetze <juhandre.knoetze@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index dd9d488873..5a7c69ab4e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -142,9 +142,9 @@ RECIPE_MAINTAINER:pn-cryptodev-tests =3D "Robert Yang=
 <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cups =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl =3D "Robert Joslyn <robert.joslyn@redrectangle=
.org>"
 RECIPE_MAINTAINER:pn-db =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-dbus =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-dbus-glib =3D "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-dbus-wait =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-dbus =3D "Juhandr=C3=A9 Knoetze <juhandre.knoetze@w=
indriver.com>"
+RECIPE_MAINTAINER:pn-dbus-glib =3D "Juhandr=C3=A9 Knoetze <juhandre.knoe=
tze@windriver.com>"
+RECIPE_MAINTAINER:pn-dbus-wait =3D "Juhandr=C3=A9 Knoetze <juhandre.knoe=
tze@windriver.com>"
 RECIPE_MAINTAINER:pn-debianutils =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-debugedit =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dejagnu =3D "Nathan Rossi <nathan@nathanrossi.com>"
@@ -391,7 +391,7 @@ RECIPE_MAINTAINER:pn-librepo =3D "Wang Mingyu <wangmy=
@fujitsu.com>"
 RECIPE_MAINTAINER:pn-librsvg =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-libsass =3D "Simone Wei=C3=9F <simone.p.weiss@poste=
o.com>"
-RECIPE_MAINTAINER:pn-libsdl2 =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libsdl2 =3D "Juhandr=C3=A9 Knoetze <juhandre.knoetz=
e@windriver.com>"
 RECIPE_MAINTAINER:pn-libseccomp =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.net>"
 RECIPE_MAINTAINER:pn-libsecret =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libslirp =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
--=20
2.43.0


