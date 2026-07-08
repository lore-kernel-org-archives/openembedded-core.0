Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96465C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:25:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11359.1783524325040852649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XkVmqeaG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4Yuc4017575
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 15:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=LWPNgh3K49rqBGE7djqIua
	4RxNNxOMjBJcYGcDDujK0=; b=XkVmqeaGY6HG3B/eRnQ+yU1ezABVbNrQx5XEBI
	fdTwuUIVyFP82QTDaYFMNj40oSvrJlKp/UGSXNSwxgVsdjaVW5H8FuGMO8/NWyGn
	p41CZXomHo5wOpoQ/DvlAMu8OxOB6uQyG25aZGiRKEgBXRguFmsmlt4GTPtJFgZG
	2kbjtiLiVTRghqfGse4U0umF5i/JsOFqsh41uLcZPE00e4YjFKX3lQVgH1YNBgtk
	rdWWXyKJQgpvi/AAgd7mWO2UsbMTIb8XYz02wuY6+/ISqA6H0bMesPcnQEbHAOQ4
	RCBZo56oAxjXMNhTs3fMQVBr5L5rQ8dyS9hs8fgVk6s/hMzA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6qcwejpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 15:25:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRMMkO/ni+k2wR6Ha19kvF+5xaAS1Q8lyFZK73CpJltajY2uQJGq32p9kmO/IdSszV/b/FYWCUpv+wKxPM2Q5eifLnFgn7OkY7hU/mkeMb4Zj6Jr4FQLQGnTaJ5qC7XqqUJWuMM9j93LXlNh+X1/bBBkGFajYDOw94lvhMuyOe1+1MIV3gju3joln+EXUAjvJq1cBXzCgKPO2kCC/RHgCakdaufJAB5H2jw7wKCRZNJUa9y8BOYi9KUEmgY4RonhqFACDuAwvlOyAua3o95oG8F7GEz4vXnOcF1nYpURKbYAR2zAb5e/UPU6xjD5KQaqTK68wRsL1yIneLvXeWHfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWPNgh3K49rqBGE7djqIua4RxNNxOMjBJcYGcDDujK0=;
 b=Yn1xmWo3BWa7jXcvy4vf64UEJuRoJBxVz+ipc2NAiwtrTzdUvBBzKmtvGeYAyjQ6ByZpNz0dHPl5H9UHG+YvCEFWp7Vkm7ud4+324R078EcA3eE5q811kPPWia1Ys1KPxbU9n04usILGdcbr51cnypYavTtxg/0Hbs9yrH0VjGTNzScSh1Gj0kItIUSYLqW/x+84wnKImKqcQjoxU6DDi5HUP0Nwnak4OWzDuU5aOI9JYB4ZWyQdwGJLZfsb7MPeR9RB1HCFceFA1+pc/XwFnfo8IMxjSK6RRaNUH68AfyDq9pTyOSCBk69+xaCeD43dwucwzAmAGsaROOXOd1GU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN7PR11MB735815.namprd11.prod.outlook.com (2603:10b6:208:5f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 8 Jul
 2026 15:25:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 15:25:20 +0000
Content-Type: multipart/alternative;
 boundary="------------CK3ll05EUFJYJPmZzdiPbrPf"
Message-ID: <4aac7a1b-322c-4042-b8da-b6b3f0480912@windriver.com>
Date: Wed, 8 Jul 2026 20:55:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/4] kernel-arch: Add clang toolchain support
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
References: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
 <6a4db3a9.bb1272e9.250696.19ba@mx.google.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <6a4db3a9.bb1272e9.250696.19ba@mx.google.com>
X-ClientProxiedBy: MA5PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::8) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN7PR11MB735815:EE_
X-MS-Office365-Filtering-Correlation-Id: e29bf93c-a294-43ee-3714-08dedd051f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|8096899003|11063799006|4143699003|3023799007|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	rP39Nsfc1XcZ6jwRSTipjI59kq3h1T81O+wzclEEEXIKYQyt2GWzYjtTXkj7oxXVf/muNsZapQXGzczQwkTUvix8A55+aDDt3YOTij8cD4b+2HbVVpZ4kMZEXNFUfxulsAnZdl2r6YqAUCySEIJXxO568okbV9I/QAVKSPFrNWIo1RCK54i/rEyjortrl5fnD0JKRWKaSJ2N6EMoBfrSXDddRrTAtwW8dN+/XiRQYztLCo4tiEKOu4EtQttUqOkiOIQRqxRWtvCEcboCifnEw4pWkSohpFB8BU/wPBzrsFWZXZ1H500uzAFAgOn5fuZK5lnl4UEVREbxIrUDIW57eh50exbAlbzQRdzRORfNK7o1IiQTYnnnCiNSIVTsmPAEEcIrGUUDlA64JmMBievybK/9qdFl3Te6ck3WvB5J96dZmFsjvSx9v3dzjyHKrzUqfdJxdAc4hVRXYDmYwUUmrJH3DkQHoQFcFpNf52LK4crE/VVJVzvblXsXBtc44PJIx8S7ZrEodxi9hWk56JapyjmaQPoe50PWxJeDVcey0M4KSvJq5RhgYqtUFsknWMjWXgdiSWOZmc4Cw/WJK3fu16PvG0eh7zMEXGys3zELZtsWUXRj7vezldCC0SAa1Cu3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(8096899003)(11063799006)(4143699003)(3023799007)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3dBTE1GWmhHMUR1aVl2ZlFjeEk2YzY5d1l0eWJPeUxlN1pmblRaaWFDMUZo?=
 =?utf-8?B?MTBkMGF3Q2pVZ0VvNFB1L0gvd3RadDlESnVOa3VSbzVrZVN4NC9aVW9uL1V4?=
 =?utf-8?B?UHhQQzRLKys1QVdwMk5SM2ZLN2dTTlZ0RW5ocWxNQXIxZm9zdGNpM01ySWZX?=
 =?utf-8?B?QU5kMFExNDNnWktkaC9tNXBNOTNib0k2TVNJNDdNSVhrWWtrQVEzbEtjSmhj?=
 =?utf-8?B?SWwwS2RUUU1PeFNzNmJjSFVqSHZpcWFpZm05LzM5RmpHQ3FNTHJPcCs5SXZn?=
 =?utf-8?B?amRBYmtxYVE0R0d2VUJRTFhrcjNnWk9FQnRXY1RBNVlva1hxdmVzT2NGSjdj?=
 =?utf-8?B?aDVoeFh6bXpxSElBSkU4NEhmWCtQcVdxYVhBUkFnRFU5aHJWRldiWmFPanNV?=
 =?utf-8?B?M2VIdUl3Ry84TWJseFBsazIvNklMY3lkbzR6Q3NxUGIxOVBKZ3FwYnNNcUZ3?=
 =?utf-8?B?cm8xVVU5amF1b0E0ZHhaNHJFb3hRdk5DK1NONzZUSnNrWVBHUHI0emI2Yk1N?=
 =?utf-8?B?M3pWVmJhY3NxVjk3MnU3NVN0TWE3U3VBQ3ZONG9jTUxpNFRWK0VoTzFGMWxI?=
 =?utf-8?B?OHorR2dGRWhDT0hYeE96QUloQ2s2QU1WRzJrcVQ2NFRpRTVtSHlJd2xZUzVi?=
 =?utf-8?B?RHByMlJkb3hWR0lnRXNZelZqVmVGTStIV24wRXhJeEhhWjN6d2REUDA1c1JC?=
 =?utf-8?B?VWdUZ3RMbjdsK1prZ2tWdnVwdUJJajZpUkgzZk0remZCOUtaRFIrZkVQajFj?=
 =?utf-8?B?bStMc0pjMlZTdHVpUWFiVnRXK3pqL0xLY0JNNDBETTAwL25PWmR3WFVDUEZu?=
 =?utf-8?B?T04zckpVT2VkS1VLRytPaVhLYzFIYzFYOGUvZ1VzdFJ6VWZhVmppUmMvenlG?=
 =?utf-8?B?dFgwb3NQVVdVOFp6OUVKYUZiYyt1bFJYZ1owMEhsdjR2bXE0MSt6cG9SUnF2?=
 =?utf-8?B?d0s0ZkdTeVJjMHpORkFxc3JsTkdMYkJOQjhhQWsyYTJsWi9LOStvUEpLSWZl?=
 =?utf-8?B?alRzTEFkZE94T1N0c2JhQ2N0T2NmVzRsT3EzQVU2RlJZWlRSTllHaEtMNVha?=
 =?utf-8?B?ZHEvNkxKc2Yrbk5vMFdqVjhmakdNd3dMbXBVSzRST3ROQWpOZ3VVbEE5REQ2?=
 =?utf-8?B?NjBxTGZlWk5mVUtseEgvdzQwaEc3SFMvOHM4QktEOVJ2bmxDakUzTytWNldv?=
 =?utf-8?B?RGNyNVBOQnBpWGNaNlJXQ0F3SXhnL2ZtWnpMT1p4bGE1VmxkU2orQXJ6N2JV?=
 =?utf-8?B?OGNaMElVa0NzVGZ0UlNmaXoxUG9JTDl0Z1pmcU9XcDNIY1ZhN3JBUkhhMW5Z?=
 =?utf-8?B?b2Y5aWo5UW1NYlpxcU5qYVNsdzAvNnNGTzhFNDhUWVZqOHprSjhQZitVME9q?=
 =?utf-8?B?UjQvZ1ROWXJlVHlKQ2txaUQvcFhYUVhHNXZUelRWajJuRUZNY0tCZ3FNdE0v?=
 =?utf-8?B?SWwxZWc2d3NpTVhDOTNNaitFSkVpYlpxZ0V0djhxbDZLeVZBYTJobHRBM0Ey?=
 =?utf-8?B?d3U4d3g5QzBTVncxUE0vdWxBUE82bE1GVXZaODNRd1JpcXo1ZUhyOTdibVNk?=
 =?utf-8?B?UWlabEEvM2xydlBxTUtPMlNldTJaYW5jWDBYUDluSFlHWk9HVWdNWnFYWnow?=
 =?utf-8?B?cFJuOGZuTkRyYktFYXFaOERMV09FeTJTNjJYbXVRN0FDZ3dWR2VsbnFNYlE2?=
 =?utf-8?B?MFF1bjExZDlxOVlFTWMvZ0t3SXc0UDIrQmx6aEVJZi84b1RHWHJ5c2VwVmZY?=
 =?utf-8?B?VTVsVHRLaXAyakNaWDNMK1F5QkpTaVA1REt3d2d0M0xSS3V2d0ZIbTVULytH?=
 =?utf-8?B?MEh3MXFLbXZaUE9ERGhkeTFaWnFid0tBeWtzZjFFTExMQ0hlRko2OVlpMjNW?=
 =?utf-8?B?am9TVjFSeUh4WU5tbFFKVjVsdzZ5c3kwdWwwVTJQN2lqczk2Tk9GNitNczNs?=
 =?utf-8?B?elNWM2M4c3JqZTM2UXNCdXRhZnpXeGZJZUg2UmlKc0dOcjVwZ0JiS2l1OVox?=
 =?utf-8?B?cTNHTUhIbUJZaXBvSmRxSGt6SWo4bVRRMi9YSHgrQ2lWUExNaXpHbzBKV0tP?=
 =?utf-8?B?NjkyY0dIWmVhMmo3cjdLTUVOWlJXT3l5cWdyajJmanZvemNYcVZha2ErN3Bt?=
 =?utf-8?B?c1U0aUg4RGFjWlJuN0FkemM5dHFKRElkaWJXRnZkeVIwc0t6cXZPU3djb2Vp?=
 =?utf-8?B?MkY0T2orRGt1S1l2YWIxY0hRSXhRTEsrQ0w0ZEIrWWhOQTJYbHo1QkNHZkow?=
 =?utf-8?B?eFJuTzZaWWl1czE1S3F6T0dlNG1hRkRCV3RUY0FCTWw2UWVYQUZtZEVkMjR0?=
 =?utf-8?B?c0g3UFN5Z2JYQktRU01rNU1naENIRFNiakEzak1KUGJ0cEhrWDl5WmZ2eWgz?=
 =?utf-8?Q?4yg+wiWNxRNTBirspr8n/7S2ArAVvp5zmEdwmaHN/twKk?=
X-MS-Exchange-AntiSpam-MessageData-1: J6Z7D2ZW51wxit49SC4IG/vrbJIJRT6jWA8=
X-Exchange-RoutingPolicyChecked: 
	g+fsuDm47N3/Zi2DuuVGTbaJvWr/0JLdwGgbFVf7dFbrwESAM0boXllFvOdB6VLm8ih5bUZVJGpTwYyYNeGdM7BH2NxveXTBEYi8E1c5BZ7ILISx08y2XTd3e0jA2Xf3iFn7wXmClBFX3C4i76+D/ptPFGHzaucn1h7zyqA1fEzQE7lW3iUbXiRKcl78wSMlvl69jGe04ZmdoZ9qbtsPwFWe7ZQFCj7nmsS8PrJh+OI7aifPsscZqqD8RkVXisGCB1UN/QSP18p7xcG5CAy4cohzi2V2mXFQtHBySisV6bfUUx8D2MhLekJ8dcXQQzHg1snl2THy71ugVF8mnwkJ4A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29bf93c-a294-43ee-3714-08dedd051f13
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:25:20.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qr5Ppc+8+FIUA/EeeZ/wAq0EAQ3497MpgencheSc+qsqrWCOrwENqGG7Ahb/osHDABIPYIfDTng/c6OTxgUeuP8ATID7jD/M/Cs5fIS+OeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB735815
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a4e6be3 cx=c_pps
 a=k0sZSnccHBAUCD1Alv6C+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=s7tE8cXBdJ9HuaZiCMAA:9 a=QEXdDO2ut3YA:10 a=1XWaLZrsAAAA:8
 a=ikXQCIJ4i3Q-fgcdausA:9 a=NvpouopSCaRAA7XB:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: OoLLwkt3G7de3r38FIgwfWXU33xzY9sl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX1pkNt26RudWk
 9PR61A5+i9aWg9E5jWF/gIj9IcKF5kjw3XZy7EzWjMvjewb0PHdSAnkfqIMED42xQ3jBGNMjAPY
 irGkC/Ma94u8dzIxB7KzwYP5VHXff43WKTtJDhbyPsJcd7PEeGEl
X-Proofpoint-GUID: IqVZxO-gEckgHhxqGr-hVbl2kSncuaYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX79wHl9Cl1qgx
 XylM3W5IiZDgICeTkMMWxqoVJkKlh7KeJboS6vYKiUiHfM00MzXHni7DTWTXz8xNaTvgGQcvdel
 XcZn5zLc/lc91KLdyMRNGiB2CG6tk83aJbOuy56fAAiqEfDaqjyYeoJA4eSqHG3eIm1Vnp3/EVg
 4rMe3TVf+EDzEPYBvh5E8qNeU6YNVeSJnJl2ern7Tidda5/7kFH2ImGX0NXOa4YiIBnvcwxgLFm
 rt670vru2ZuYOfwLngSgmTu3DAeKByrzw2szxuiio6HmlsiaeSkIMbBRs/4pxf0t/V9A5sKw3OI
 /PiMVBwbjniFYTAFhunrW+9TDtyC2cu9MkiSsjyqaEy/y3fJj+B+MspOD0LbDdVqa2iRmoiajdx
 hXyINqv/YtLDfS1lPvS/iXQsMRg94O7p5+8+9jLJhAnrn+5kr1JPi8j0N4PI3lijMx2nM0O0gxG
 ghQ5UHSWuPIw+T80SIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240496

--------------CK3ll05EUFJYJPmZzdiPbrPf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08-07-2026 07:49 am, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, Jul 7, 2026, Harish Sadineni wrote:
>> Convert the existing GCC tool definitions to use the `:toolchain-gcc`
>> override so they only apply when `TOOLCHAIN = "gcc"` (the default).
> I went through the series with a focus on making sure it's a no-op for the
> common gcc / non-riscv64 kernel build, and it checks out:
>
>   - toolchain-gcc lands in OVERRIDES for a default build (base.bbclass does
>     inherit_defer toolchain/${TOOLCHAIN}, gcc.bbclass sets
>     TCOVERRIDE = "toolchain-gcc", and OVERRIDES carries ${TCOVERRIDE}), so
>     KERNEL_CC:toolchain-gcc et al resolve to exactly what the unconditional
>     assignments produced before.
>
>   - The KERNEL_CC:append:{aarch64,nios2,arc} appends in linux-yocto.inc still
>     stack correctly on top of the :toolchain-gcc value, so the arch-specific
>     TOOLCHAIN_OPTIONS aren't lost.
>
>   - Patches 2-4 are gated to riscv64 and/or the rust KERNEL_FEATURE
>     (kernel-yocto-rust.bbclass is only inherited when 'rust' is set), so
>     they're inert everywhere else.
>
> For the whole series:
>
> Acked-by: Bruce Ashfield<bruce.ashfield@gmail.com>
>
> Two things worth noting, neither blocking:
>
>   - One behavioural subtlety from this conversion: a KERNEL_CC:toolchain-gcc
>     assignment now outranks any *unconditional* KERNEL_CC = "..." a downstream
>     BSP might set, where previously it was a plain last-assignment-wins. No
>     in-tree machine/recipe does that today, so there's no regression, but it's
>     a change in precedence worth being aware of if a BSP overrides these.
>
>   - In patch 4, `if 'clang' in toolchain:` will throw if TOOLCHAIN is ever
>     unset (getVar returns None). It's always set for kernel recipes today so
>     it's fine, but `d.getVar('TOOLCHAIN') or ''` would be a touch more robust.
Hi Bruce,

Thanks for the ack. I've sent v3 with your suggested 
d.getVar('TOOLCHAIN') or '' fix
folded into patch 4 (the only change since v2), and carried your 
Acked-by forward on all 
patches.https://lists.openembedded.org/g/openembedded-core/message/240489 
Thanks, Harish
>
> Bruce
--------------CK3ll05EUFJYJPmZzdiPbrPf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-07-2026 07:49 am, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6a4db3a9.bb1272e9.250696.19ba@mx.google.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon, Jul 7, 2026, Harish Sadineni wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Convert the existing GCC tool definitions to use the `:toolchain-gcc`
override so they only apply when `TOOLCHAIN = &quot;gcc&quot;` (the default).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I went through the series with a focus on making sure it's a no-op for the
common gcc / non-riscv64 kernel build, and it checks out:

 - toolchain-gcc lands in OVERRIDES for a default build (base.bbclass does
   inherit_defer toolchain/${TOOLCHAIN}, gcc.bbclass sets
   TCOVERRIDE = &quot;toolchain-gcc&quot;, and OVERRIDES carries ${TCOVERRIDE}), so
   KERNEL_CC:toolchain-gcc et al resolve to exactly what the unconditional
   assignments produced before.

 - The KERNEL_CC:append:{aarch64,nios2,arc} appends in linux-yocto.inc still
   stack correctly on top of the :toolchain-gcc value, so the arch-specific
   TOOLCHAIN_OPTIONS aren't lost.

 - Patches 2-4 are gated to riscv64 and/or the rust KERNEL_FEATURE
   (kernel-yocto-rust.bbclass is only inherited when 'rust' is set), so
   they're inert everywhere else.

For the whole series:

Acked-by: Bruce Ashfield <a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield@gmail.com">&lt;bruce.ashfield@gmail.com&gt;</a>

Two things worth noting, neither blocking:

 - One behavioural subtlety from this conversion: a KERNEL_CC:toolchain-gcc
   assignment now outranks any *unconditional* KERNEL_CC = &quot;...&quot; a downstream
   BSP might set, where previously it was a plain last-assignment-wins. No
   in-tree machine/recipe does that today, so there's no regression, but it's
   a change in precedence worth being aware of if a BSP overrides these.

 - In patch 4, `if 'clang' in toolchain:` will throw if TOOLCHAIN is ever
   unset (getVar returns None). It's always set for kernel recipes today so
   it's fine, but `d.getVar('TOOLCHAIN') or ''` would be a touch more robust.</pre>
    </blockquote>
    Hi Bruce,<br>
    <br>
    Thanks for the ack. I've sent v3 with your suggested
    d.getVar('TOOLCHAIN') or '' fix&nbsp;<br>
    folded into patch 4 (the only change since v2), and carried your
    Acked-by forward on all patches.<span style="white-space: pre-wrap">

<a moz-do-not-send="true" href="https://lists.openembedded.org/g/openembedded-core/message/240489" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/message/240489</a>

Thanks,
Harish</span>
    <blockquote type="cite" cite="mid:6a4db3a9.bb1272e9.250696.19ba@mx.google.com">
      <pre wrap="" class="moz-quote-pre">

Bruce
</pre>
    </blockquote>
  </body>
</html>

--------------CK3ll05EUFJYJPmZzdiPbrPf--

