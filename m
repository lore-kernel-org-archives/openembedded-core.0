Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5804ECD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 03:02:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5357.1778295750889708550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 20:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ODMMaBSG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9589ca456d=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492KAVZ2038372
	for <openembedded-core@lists.openembedded.org>; Sat, 9 May 2026 03:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6fGXOIKRS2sj93TTSmfups
	lcrGpyThmlHwPMRxB1WRU=; b=ODMMaBSG3qhx7tNUN4CjvGkBVJXpmb9cZiUaKw
	NuCRgeZ5q7FNJxk7uNDfn/ZKx5YMiqoA21IOhycCkpCh6y2yRiKma0MUFoQzQPT5
	8gL75dcP/yYKvZ6ZGoDxRArxU0VKfboy7KMHTaOW8CESG5ReNl9/Rc9wze2VCAsZ
	p2Dd7ml4L0V043CQ7st6PVpDnhVX3uIL120EPNSsTBwri7gI2U3gP0nD9jMr1hsi
	0ZrPJRL2ykNQ20k+A967xPiqbmRQGQovfqmPNGKJSLjguH40KKYTCntZ/XNkBPz1
	ytD8jUxzc4bBF+yfd1Xcu2bQgaGCdbQxngbTKM+UkB2fdStQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6g139-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 09 May 2026 03:02:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ohzib2oMM1xe+EPyOpVD5wtpL9ZPfphTZmPGdHvr0wXnCdswJNc6r+/j50Fhvfqy/uobctBFZzUYwHkdQCm7N+C+zLaEyQFR3Cv9C/kY5raSrFCgTG8DHLDRBA9r/sJLyqsZ8db+68SrBy3YgNo0yWUG4BDYmMtcCmw258XzBILXRN8KCKXELX937IHyAnETfJVI8htuuyZvgLhqgzWDjM1WdFmyWGQh7Ka/LjXiw9mjSZfzMXWVIXsQTbLFVmTQhLugGrPNiaYpb77inKUYn3SyLZZL+T9DjGEM5xfJ+3FmyJm7LvGgdXGwwR50zOrPXxhEv5qqO4jUGTW60k4Czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fGXOIKRS2sj93TTSmfupslcrGpyThmlHwPMRxB1WRU=;
 b=EkD/JugU5yvkpwROaC9QhzX5SqFO3xUHaWBDqe2rtNLkPa6ViQQJnA7nGMt1moxvl55u6ev/XLrPxA6mOU2eX4OBfZICerShCAhhmG6wQT9/c4vQHLc3qOEUAodyCUc4+aMJxdnRIRkxJNi5o6+KDnDf80V6Gu9IhUp2IPlQBMY+NMqoZmofb/kJXE9DeDqt6HUZFwOR2ddCXsQhXc1azz1KXoCTnn7XUQX204aahj7/XWIWdLj+hiGWcf/87Lqwx0eUrYTGR5bosoLharjCDt/MECEql1WK0EDX1p5TCjIxVN01UK5pHcCVWAKrEpYvBjMVimTlKuC89DGHUwRy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sat, 9 May
 2026 03:02:26 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 03:02:25 +0000
Content-Type: multipart/alternative;
 boundary="------------RBqKWMbiP1Lf28mtH10gEhCQ"
Message-ID: <e262815d-029f-441d-86ac-b4a1270b2506@windriver.com>
Date: Sat, 9 May 2026 11:02:19 +0800
User-Agent: Mozilla Thunderbird
From: Changqing Li <changqing.li@windriver.com>
Subject: Re: [OE-core] [V2][PATCH] gstreamer1.0-plugins-bad: disble vulkan
 when x11/wayland not enabled
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260508022311.3112415-1-changqing.li@windriver.com>
 <CANPvuRkujxfc8M9v1Ye+tB4wzQgoC-FSpRsTpQLuXOiLNidtQA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANPvuRkujxfc8M9v1Ye+tB4wzQgoC-FSpRsTpQLuXOiLNidtQA@mail.gmail.com>
X-ClientProxiedBy: SE2P216CA0025.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::19) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: ed43f8dd-7598-42d1-d717-08dead7765f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|8096899003|56012099003|22082099003|18002099003|13003099007|4133799003;
X-Microsoft-Antispam-Message-Info: 
	btlrNzoH7X7XoehCnzyjiADUWztI3uME/0VxnxgQYuqEkSYzov9VBsfcaZv5wyNkG4zmRKfZ0mlL2hhFIr8pRj6cyBX3NRzS1sAc1yobSzp0/yVOBf06QHv9JYFhljIDVJrt7Mnt8ENiec8nlsoBQYkR4m3pM49Ot/z8UZA6efOdeClalGDlML5Eb2SayTxnfJtEdurMhLyk8n9qbPExEQzCKQPWSTc8XAAu4L9cOE8Kni0tYZJBA9cM/IV8sMXkHNb+/gWZKdaklDFCXDp0au1MSHAdghYY5hiSbzCyS+dAET26XJe0eaSkoG6QCPr1lhz4dlV8tyQousJZcfwymbcmcj/SG/KKeOZ0y1eTJmAtGnJHBOkkF7qpBGC8L45mPXYD/kW2o9wq6RPQrKo+Zy6x/oUJunchqLmcsujpfKp4AtRp/N1alxaxMEnzwqXuycJT6NG2/rJUuKuQ3a+9P2f8Q/N9DtAAiMiKXDpzSfiGqjwZWplle8txi8wqASsYI8thri/FxEX+ZEEEpSUpG3+q0FOyyxgrXmR9jEHE8mWX6lWxWtvMYuwazV2AKSGFqXAm2oGGRzffayfshBd8wyxNaUjMFAAWz7jbi6Ul5cPVpnkwEltNb7dYh3vHZ5LibD/1oGHeSLYrnzyCeL8gSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(8096899003)(56012099003)(22082099003)(18002099003)(13003099007)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHJCZ1NCK1VKZ1ZQL21YdTl0a1JIeG5kdEV1U2FKZGVOYWtUTDFMN095eERK?=
 =?utf-8?B?Qm1VOHVScGNmWGNFMHNpYmloZkJPK1BjRHpiVmtTRWV2UVp1ejd0bDdkaDVa?=
 =?utf-8?B?aXdvT3A3dFh6NXlyV20vdnZLSTl2SXVSRk4wQVUrNkp0OVZsak8rY21kN0Ir?=
 =?utf-8?B?bzg5dXc0aW9ZSzY4SDVSOHZLeDNyckZFU3NubWlKRTR2SXpURDY3VkF0TGJW?=
 =?utf-8?B?ei9DNUpFRkJPMEtSTzlPVXQ4YmJWSzNoRGpYczlYS0NPZC9qQmZKUk1BcTg1?=
 =?utf-8?B?akl2RCt6YTNBMzhDZ2FDUlY1RW5qbFllYm82M2hYcER1N2JGSUxPTmRlQk1s?=
 =?utf-8?B?L2ZydW9GMU8yNDBrUm9IR01BOHlGOFo3MUwwejgwSjFtZWVONEYvMWdVbkVm?=
 =?utf-8?B?ekJyKzB3QmZmUXRGQzJZd2U4QlpWRkx0ams2OUtEUGlWVUxEMWtHWHZBeFVH?=
 =?utf-8?B?YlZkVnZWVEZCcGQydmRvNXVjd1dGWEVoL2hXR0kzOTM3OWxBTEo5Q3Y1WGpo?=
 =?utf-8?B?Z2FOcDhvV0lOUzFTRUVYTEhqUlBqVjkwVHRYUDlFQUVIalFndFg1akFiT0NN?=
 =?utf-8?B?VENNWHFtbEFkZXR4bDJFV2VUQXBKeVRVekI2TlhicnZLU21JaUtxbTI3enEz?=
 =?utf-8?B?bDVoMmIvUEtLcklxY0doL1BBV2dpRFdQQ1F3b29zMUxOUnhKaUxiY2JIbVcy?=
 =?utf-8?B?Z094ZVp5OXd6Mmo4RWZVaCtlSFNLSGdxSVE5YWl1cWZVQVAySHMvMERaZGNi?=
 =?utf-8?B?ZEkwM1NmbHBPRVB6enJpd1oxOVZXSkRiT3A1MGJqajVudWJoK3h2SHZ2MWcw?=
 =?utf-8?B?RTFVWjRqS0JOK2ljajNzWlpZYXpVR1BtZWs3UnQ1UHBXcUtMMW1CWG9tS056?=
 =?utf-8?B?Ri9BbjhrdUcybFJrZnQ1M3Z1eE9UMndzS09XQi9ONU4yNXV6MjRXb2RFellh?=
 =?utf-8?B?VnppL0M5UVpsbEswdXFNTzJSNmhoZDNCdmpjempncEk5YUZyMkhldkYzb0o5?=
 =?utf-8?B?ekp0Y0JlcEFGbXJOS0txZ2tnQ21jZEdmM1h6RXhSVldQNmtUbU9zMzNEd0Vp?=
 =?utf-8?B?RFUzOGlrK0prRXQxYlRRS0VEZEpMOEJjOEJhR3ZiSjlFdGQ0M1ZMUjh4dEhR?=
 =?utf-8?B?SitLanJadDR1OTJGV0c2TnpxZUM1QjFJc0t0SE5vRXJEdmw0MXNremJrdGRT?=
 =?utf-8?B?bzF3dW5ac3ZmNHYwMFpkeml6djN4c0pjWGg2SWJJaXFyckdMRWpYeHFZemVX?=
 =?utf-8?B?ZE5RdVh2cHV1VXR2a0lIakRRNndURXQ3bStDYVluVTlESVJDYW9QNDZlaS85?=
 =?utf-8?B?bDNDNkE4bTI4TzR0RHdIUWFhL3ZkZlJaQUthTWV5d1pYU3BiSG5ERDFuYmtI?=
 =?utf-8?B?RkZ5TFZibWh6QlovWExiM1RDditkQXVINkFISk1WSGFCZnlSNmRDSmNWSUF3?=
 =?utf-8?B?VWFHNGNLQ29UdlY5MmtzR2MzNVZVS2FETU95dk9MaEZ1WDlWUjI3M0dpWnl4?=
 =?utf-8?B?SjZUUjlyU1dGRzFWRStZQTA4RkpIWXVHdVJOVGtFOXp3Z0JnS2R2MEErb3hW?=
 =?utf-8?B?VElURWUxVTdwM25hOUo5dnpKUWl3d0VmTUdVOVNLU0ZJWWhqaFk3N2RTTXpv?=
 =?utf-8?B?MCtCYk9FUlFmL0lpZnhuME0xdnF1Y0x4eUpNUG9zdUdYTW1iL1NHaGRXSmxZ?=
 =?utf-8?B?UHBLUi8zdEZIRjU2Q25YLzFzeUk3OUxpNEc1S1V4NzMxNFQ5cGplbG5VazVy?=
 =?utf-8?B?VTZTZzlZYWRpWERrcW5INlRmZCtTU2V2UHdmTXJOaWg1cWVOdi9zVGlBdE5x?=
 =?utf-8?B?dEVYMyttenhmblJZb0IwOGNGQjBvWGV1ZHFEYW1tb09UcWNWcmVtZDUralh3?=
 =?utf-8?B?RUl5VGxUTlNOTmdpZHh2SGZ3R3ZVQnpVUk1MZGg3MTA2WjREeTNML0dxTkRp?=
 =?utf-8?B?bUg5ZEMwWFRHbm9iRnJrM09RQVp0eThaZkhKbGRId2ZQWkRuSTlqUm8wR01O?=
 =?utf-8?B?NitwR2U4blZQc2pkaTJPMVlDWlhKMjVlUFpsZzJHY2JXbkhwcTd2aCtRQ2hs?=
 =?utf-8?B?ckkvTW5nQXdUVGU2VWQxY1A1Umc0U1ZIeHFlb0I4SkhCZ1l5RVorYzlqaVBw?=
 =?utf-8?B?b2RoTDk4SndmSEpvYVpuY0Q1YmljbDV5Y3JtMjMxOTVwMTBUZmJubHFWbnMv?=
 =?utf-8?B?bFJFTlRNQ29YdXFraklXRGM5dTB0dW81WE9IaXpkdEhKenNJVXBhVE56ZTh6?=
 =?utf-8?B?U3NBR3pNYXk1ejFvcS9NUDJBRUR6Z3JPR3pQMm1nWlJkU0NNWDZBcENZdFNX?=
 =?utf-8?B?VUhKZzN2UzhmYWtRWW9PTUpsVWlzQTBvL2NwMTRWVU9CUkgrQ1VQZG9Zb1p0?=
 =?utf-8?Q?9o7Dbu95M1Mmz/B4=3D?=
X-Exchange-RoutingPolicyChecked: 
	wr0dmd2R1h7O7HB+fBdiEnEZh1cGQm00sLf4pRpfep5XhrK4lY5ZxVJIYu1TK/0io1gb4hPgLX0HRgKZ8t/DiZB9PdJCluLxqli795+r7MmfEa5wgNYVBpi+CmFokXH+7A4vMQyqHOxlXj5RIqnpniCGOYQJ8azEmfluE5y2cpG7tEsQL3W+nXTpXFTZi9GPfxjKfv1SDZ8wCm+uG/BMVmspovmrsBwlFsb6cRUr1/EHrQRnpQu5y92b+6x9PuwBlJZx9Ap4g1jr/vtzhjK/Aaj/UoFqQBCXxYqgXrLjPLerjg2AokxaympFjykmJsfKnnEivK/eq8bBOKHOPM9Xqg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed43f8dd-7598-42d1-d717-08dead7765f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 03:02:25.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKX0V16Q9d8a8RR5To5ujQ8gvy7eBFaKihwOpoA3SNunY+uG/jxak1tbDWH6rcifyCiOBoJKtfnPvNkX4eVX13EdA8sUr8SY3fGMubxWQrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyOCBTYWx0ZWRfX5i5SG0dqz1dX
 QETmo683Qx0iCZgMSXSXRsL0TTv5iiVA0BXBdXkIg7XSz0JqyynLPQ+l4uCvH2qwoxaG5N2wPR+
 Myv7bg8uyEAIXWwxW1lwxXB5B2r1rEf0N+rMnNk8VDWKfv6/wM/euaTgu1tIDkLRfLluvHysLls
 BsUBSVs9BBZBFVOCp7d/iQxcBbDnIWwoo6FmvmMFkqn2rXrqDV722MEmUOh9dXUBGhwYmtKNNgz
 jb/fXvQFDyRCv+eBGxIRffm36bpk9gEVxenPFVMDOUrBW66+Dl1rMV8xhai/PHUfiJ/9Z+Nzmbj
 A8W0UQGkVuNVeR5D2s2IqILnVi/J/ckhBXNjf66jz5MPaAfJKexFtj1LOci/0aTmhLmOD2jn26A
 fMY5QrxyICQMFUrUi5ELc8ryxDDMTSAmzRal0dWpIbcD8v4U10LcXB7Qmx76a40G6zP7XkaC4Jh
 rB7KNW8lye5OCAAfHxw==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=69fea3c5 cx=c_pps
 a=pHgAWWeLuDyFdJvI4ceQVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=ySjF6f4xAAAA:8 a=AziMl8wuAAAA:8 a=ygfikJQSAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=06OBSygWHAl3K44ehTkA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJhkz4i9SoaArn5b5dsA:9 a=tdmcXug1hlwWatit:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SVe2G6S_LxxHVpu7-jkk:22
 a=QKHmAbfgFgo_a26yQnRY:22 a=rfsfOhzgo-V0TFs3tIRs:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pygU-GrsXZGANy5S5Bd2cNXj1X2G3IBN
X-Proofpoint-ORIG-GUID: qXoNFUPZsSyyGwMOrwoCHq3LklOWZqqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 03:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236751

--------------RBqKWMbiP1Lf28mtH10gEhCQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6492KAVZ2038372


On 5/8/26 22:40, Jose Quaresma wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hi Changqing,
>
> Changqing Li via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kL=
OSSX994Ry4PXOaXF1QVVTf7$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!YccBDN=
YEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4=
PXOaXF_bL7xxg$>=3Dwindriver.com@lists.openembedded.org>=20
> escreveu (sexta, 8/05/2026 =C3=A0(s) 03:23):
>
>     When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
>     do_configure will failed with error:
>     gst-libs/gst/vulkan/meson.build
>     <https://urldefense.com/v3/__http://meson.build__;!!AjveYdw8EvQ!Ycc=
BDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994=
Ry4PXOaXF42PxkLg$>:311:4:
>     ERROR: Problem encountered: No Windowing system found. vulkansink
>     will not work
>
>     disable vulkan from PACKAGECONFIG when x11 and wayland is not enabl=
ed
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0.../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5c=
X8_yJyXzKOahC1kLOSSX994Ry4PXOaXF-7hh1lL$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++++-
>     =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
>
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5c=
X8_yJyXzKOahC1kLOSSX994Ry4PXOaXF-7hh1lL$>
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5c=
X8_yJyXzKOahC1kLOSSX994Ry4PXOaXF-7hh1lL$>
>     index cdf3a20dff..c7f081e25b 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5c=
X8_yJyXzKOahC1kLOSSX994Ry4PXOaXF-7hh1lL$>
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
>     <https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2=
.bb__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5c=
X8_yJyXzKOahC1kLOSSX994Ry4PXOaXF-7hh1lL$>
>     @@ -21,10 +21,13 @@ DEPENDS +=3D "gstreamer1.0-plugins-base"
>
>     =C2=A0inherit gobject-introspection
>
>     +PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.filter('DISTRO_FEATURES',
>     'vulkan', d)}"
>     +
>     =C2=A0PACKAGECONFIG ??=3D " \
>     =C2=A0 =C2=A0 =C2=A0${GSTREAMER_ORC} \
>     +=C2=A0 =C2=A0 ${@'${PACKAGECONFIG_VULKAN}' if
>     (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) !=3D '') else
>     ''} \
>
>
> that is a little more difficult to understand than usual, why don't we=20
> just use the bb.utils.contains?
>
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland',=20
> '${PACKAGECONFIG_VULKAN}', '', d)
>
> It seems to me that this would work.
>
> Or even the following, dropping=C2=A0the PACKAGECONFIG_VULKAN=C2=A0but =
then it=20
> loses some readability again.
>
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland',=20
> '${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}', '', d)

I don't use bb.utils.contains because we need any of x11, wayland, not=20
all of them.

I changed to use contains_any to make things more simple in V3

Thanks

//changqing

>
> Jose
>
>     =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DISTRO_FEATURES', 'blueto=
oth', 'bluez',
>     '', d)} \
>     -=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulk=
an x11',
>     d)} \
>     +=C2=A0 =C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11'=
, d)} \
>     =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DISTRO_FEATURES', 'waylan=
d', 'wayland',
>     '', d)} \
>     =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains('DISTRO_FEATURES', 'opengl=
', 'gl', '', d)} \
>     =C2=A0 =C2=A0 =C2=A0bz2 closedcaption curl dash dtls hls openssl sb=
c
>     smoothstreaming \
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#236630):
>     https://lists.openembedded.org/g/openembedded-core/message/236630
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/236630__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3J=
FmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4PXOaXF7cjX7gU$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/119208574/5052612
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1192=
08574/5052612__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHb=
lIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4PXOaXF9IH9URn$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg=
61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4PXOaXF3LviIFg$>
>     [quaresma.jose@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma
--------------RBqKWMbiP1Lf28mtH10gEhCQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6492KAVZ2038372

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/8/26 22:40, Jose Quaresma wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRkujxfc8M9v1Ye+tB4wzQgoC-=
FSpRsTpQLuXOiLNidtQA@mail.gmail.com">
     =20
      <strong> </strong>
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
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div>Hi&nbsp;<span style=3D"color:rgb(0,0,0)">Changqing,</spa=
n></div>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">Changqing Li via <a h=
ref=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOah=
C1kLOSSX994Ry4PXOaXF1QVVTf7$" target=3D"_blank" moz-do-not-send=3D"true">
                  lists.openembedded.org</a> &lt;<a href=3D"https://urlde=
fense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS7=
2DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4PXOaXF_bL7xxg$" =
target=3D"_blank" moz-do-not-send=3D"true">changqing.li</a>=3D<a href=3D"=
mailto:windriver.com@lists.openembedded.org" target=3D"_blank" moz-do-not=
-send=3D"true" class=3D"moz-txt-link-freetext">windriver.com@lists.openem=
bedded.org</a>&gt;
                escreveu (sexta, 8/05/2026 =C3=A0(s) 03:23):<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                When vulkan is enabled in DISTRO_FEATURES without x11 or
                wayland,<br>
                do_configure will failed with error:<br>
                gst-libs/gst/vulkan/<a href=3D"https://urldefense.com/v3/=
__http://meson.build__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEF=
pg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4PXOaXF42PxkLg$" moz-do-not-sen=
d=3D"true">meson.build</a>:311:4: ERROR:
                Problem encountered: No Windowing system found.
                vulkansink will not work<br>
                <br>
                disable vulkan from PACKAGECONFIG when x11 and wayland
                is not enabled<br>
                <br>
                Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqi=
ng.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
                ---<br>
                &nbsp;.../gstreamer/<a href=3D"https://urldefense.com/v3/=
__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8EvQ!YccBDNYEXpz_M=
PACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4PXOaXF-=
7hh1lL$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gs=
treamer1.0-plugins-bad_1.28.2.bb</a>&nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 5 ++++-<br>
                &nbsp;1 file changed, 4 insertions(+), 1 deletion(-)<br>
                <br>
                diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D=
"https://urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;=
!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJy=
XzKOahC1kLOSSX994Ry4PXOaXF-7hh1lL$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a>
                b/meta/recipes-multimedia/gstreamer/<a href=3D"https://ur=
ldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveYdw8E=
vQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLO=
SSX994Ry4PXOaXF-7hh1lL$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
                index cdf3a20dff..c7f081e25b 100644<br>
                --- a/meta/recipes-multimedia/gstreamer/<a href=3D"https:=
//urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveY=
dw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC=
1kLOSSX994Ry4PXOaXF-7hh1lL$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
                +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"https:=
//urldefense.com/v3/__http://gstreamer1.0-plugins-bad_1.28.2.bb__;!!AjveY=
dw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC=
1kLOSSX994Ry4PXOaXF-7hh1lL$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
                @@ -21,10 +21,13 @@ DEPENDS +=3D
                &quot;gstreamer1.0-plugins-base&quot;<br>
                <br>
                &nbsp;inherit gobject-introspection<br>
                <br>
                +PACKAGECONFIG_VULKAN ?=3D <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:${@bb.utils.filter('DISTRO_FEATURES','vulkan',d)}">&q=
uot;${@bb.utils.filter('DISTRO_FEATURES',
                  'vulkan', d)}&quot;</a><br>
                +<br>
                &nbsp;PACKAGECONFIG ??=3D &quot; \<br>
                &nbsp; &nbsp; &nbsp;${GSTREAMER_ORC} \<br>
                +&nbsp; &nbsp; ${@'${PACKAGECONFIG_VULKAN}' if
                (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) !=3D
                '') else ''} \<br>
              </blockquote>
              <div><br>
              </div>
              <div>that is a little more difficult to understand than
                usual, why don't we just use the bb.utils.contains?</div>
              <div><br>
              </div>
              <div>${@bb.utils.contains('DISTRO_FEATURES', 'x11
                wayland', '${<span style=3D"color:rgb(34,34,34)">PACKAGEC=
ONFIG_VULKAN}</span>',
                '', d)&nbsp;</div>
              <div><br>
              </div>
              <div>It seems to me that this would work.</div>
              <div><br>
              </div>
              <div>Or even the following, dropping&nbsp;the
                PACKAGECONFIG_VULKAN&nbsp;but then it loses some readabil=
ity
                again.</div>
              <div><br>
              </div>
              <div>
                <div>${@bb.utils.contains('DISTRO_FEATURES', 'x11
                  wayland', '${@bb.utils.filter('DISTRO_FEATURES',
                  'vulkan', d)}', '', d)&nbsp;</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>I don't use bb.utils.contains because we need any of x11,
      wayland, not all of them.</p>
    <p>I changed to use contains_any to make things more simple in V3</p>
    <p>Thanks</p>
    <p>//changqing</p>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRkujxfc8M9v1Ye+tB4wzQgoC-=
FSpRsTpQLuXOiLNidtQA@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_quote">
              <div>
                <div><br>
                </div>
              </div>
              <div>Jose</div>
              <div>&nbsp;</div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                &nbsp; &nbsp; &nbsp;${@bb.utils.contains('DISTRO_FEATURES=
',
                'bluetooth', 'bluez', '', d)} \<br>
                -&nbsp; &nbsp; ${@bb.utils.filter('DISTRO_FEATURES', 'dir=
ectfb
                vulkan x11', d)} \<br>
                +&nbsp; &nbsp; ${@bb.utils.filter('DISTRO_FEATURES', 'dir=
ectfb
                x11', d)} \<br>
                &nbsp; &nbsp; &nbsp;${@bb.utils.contains('DISTRO_FEATURES=
', 'wayland',
                'wayland', '', d)} \<br>
                &nbsp; &nbsp; &nbsp;${@bb.utils.contains('DISTRO_FEATURES=
', 'opengl',
                'gl', '', d)} \<br>
                &nbsp; &nbsp; &nbsp;bz2 closedcaption curl dash dtls hls =
openssl sbc
                smoothstreaming \<br>
                -- <br>
                2.34.1<br>
                <br>
                <br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#236630): <a href=3D"https://urldefens=
e.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/236=
630__;!!AjveYdw8EvQ!YccBDNYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5c=
X8_yJyXzKOahC1kLOSSX994Ry4PXOaXF7cjX7gU$" rel=3D"noreferrer" target=3D"_b=
lank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/236630</a><br>
                Mute This Topic: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.openembedded.org/mt/119208574/5052612__;!!AjveYdw8EvQ!YccBDN=
YEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry4=
PXOaXF9IH9URn$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">
                  https://lists.openembedded.org/mt/119208574/5052612</a>=
<br>
                Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@=
lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                  openembedded-core+owner@lists.openembedded.org</a><br>
                Unsubscribe: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!YccBD=
NYEXpz_MPACKZrYS72DaMJ3JFmzaPEFpg61gHblIUtXPjN5cX8_yJyXzKOahC1kLOSSX994Ry=
4PXOaXF3LviIFg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank" moz-do-not-send=3D"true=
" class=3D"moz-txt-link-freetext">quaresma.jose@gmail.com</a>]<br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                <br>
              </blockquote>
            </div>
            <div><br clear=3D"all">
            </div>
            <div><br>
            </div>
            <span class=3D"gmail_signature_prefix">-- </span><br>
            <div dir=3D"ltr" class=3D"gmail_signature">
              <div dir=3D"ltr">Best regards,
                <div><br>
                  Jos=C3=A9 Quaresma</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------RBqKWMbiP1Lf28mtH10gEhCQ--

