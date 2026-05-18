Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A968DCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 08:18:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3858.1779092275161826282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 01:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HPuKCCCA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959875a66c=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7rRd7899305
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 08:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=gmtwoemaIti9VpyJm8C1ah
	Vu8C5MpdWNyqfBa+21vvI=; b=HPuKCCCAwWkEhdbNoW8mYNOi50fVL8RTR69V1g
	gTXZqRjFsiJ+HhBUQjbZZh5qDpf0MwAKDNyktfcSMRCe5QdTI1sGvTgSuenV+7zf
	7G7wt8ZX311+D84xIeeQxdUNExu6e58+JMQgTqvl6j2nJgl4VIdU4uKExNfG85XM
	QVGKH9114teFgYQEadJLpoKBU/mR4FChOLtCPZqXelaOYjIbMqYPL5FwL21Ri4o3
	cJJfwhWxR3dLJO8Ho3fjekE2D5Q9iB0+MQLXhPIs104fV1+nDRqj1ghDphP6mm/t
	6crpd4OJ+u4ZrL1bitQ6wjZWEoGwKfDww4+hB17rv6vopQFg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf1tq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:17:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF+nUnTWd1hRcsClRgN7iM8KcXScTjW62W+vhg4lvPcgM5DlzxM1m2hSIlU9+JRwjg9fFPsOi1yhx5UIsIahyQ0x7jjkffWD7ZUaAIFDuWXzDpcDa+0jKPZ7XMoDguCeT8mE+/GHTFtOt6JqmydpxzPAkDhxlmNXNTZr7mYEKnG886+RuZ9RaS6zKjmzMECqY7XCU0mZF9jWTXvMtu2M2lnoZ/x97/HndyhuyIJvoZHBEChNxIMrE0rUuvdPrEbIg0tHPGRMlE9p2A0RTKusbi/o+B6yDk6XyS8ZB2dkV75i3qdReMc3YyQuqT3EJBqhkFqUh55Fc9BfwJBtADdkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmtwoemaIti9VpyJm8C1ahVu8C5MpdWNyqfBa+21vvI=;
 b=Rp3cRWFu2gs4u5EfZzmv+7OJ8jaxkGciIbDj8lm6SYPZM2ArhhD9DTpnbhj57OTyiEsE5M8oforE5LsaGQvs6tzWYpLv5xB6Xkpx47rZB3ZjxVG8x2yugbpGTTpawr9AYgAuN2KM4r0MN7Cxh5FU3gJphg66YZe+dVUkIcAJM5N4cej3Sd7fRIgL5v9h8WOhV0pYVl9dExKGt7g4ion7H3iz1GsD73q5EDdEoqefIFsexQWjCBxlqvKXdJu1rKFBIagRqgz3aoChzdbt/17P4gkHKKoBq0PZb7m0d89TCz2pql5rpmZIzds5EF2KQPthm8kC/8hMJ0UzZ+08ri01Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 08:17:48 +0000
Received: from CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec]) by CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 08:17:48 +0000
Content-Type: multipart/alternative;
 boundary="------------jBDcBTXaShcAw418JutneRPK"
Message-ID: <8b5048c5-f57f-45ca-801c-e31357578015@windriver.com>
Date: Mon, 18 May 2026 16:17:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCHv2] qemu: fix for CVE-2025-11234
To: yoann.congal@smile.fr, hprajapati@mvista.com,
        openembedded-core@lists.openembedded.org
References: <20260220051011.11250-1-hprajapati@mvista.com>
 <DGVZXBTVF9IV.1T2VD5JUSSC1F@smile.fr>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <DGVZXBTVF9IV.1T2VD5JUSSC1F@smile.fr>
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To CY5PR11MB6187.namprd11.prod.outlook.com
 (2603:10b6:930:25::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6187:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: 5039b85f-dcba-41b7-4b05-08deb4b5f259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|42112799006|366016|4022899009|1800799024|13003099007|22082099003|11063799003|18002099003|56012099003|8096899003|12006099003|3023799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	Z5haIJv5LRpiSNt5MWhSHfOOissCddiDKYCjlQsVh87lxGxK+Z89/Sh2dWF/Ei03y/H294rI53wohGo9+raxy/7D6dDqWSBvmPXwhivHQF2No2ft/wFvPfCNgftoTIJAX3KxzbAwTkC2H6td+UaMTdbaurP1lRAVnR4Ge85n2ZgPWApCAi2AwIEyy8cQFLoKIILW2i/wzMYWVL8nuY0UAMsMLNsbIakQj53gEL2zKT3dBh1RmcF29oYBWWDqixz18aqZqxydSi5uCQDPiEfj8tvsCJ73vTae4y1psM5409ulTTiVu4O89tphgYr9Eq50q6immH7XmgVt+VxD6Na/tfZKS3l/0+i2yQpLUmWY72c3LlWc09IEe/NKJnIGE7YsWNaaKDaAWRRawjBC/vWGltrxxhd/q0AjRurnjP2mCZxnHkpuvHcR9StKqQsoJECizs3wHp2DCQTStlOKBB65SUMRkrCQYKe/7skpSp5psRRphVok19GCklMsoMbT5+1+rn6SDjm2BFvX8dQWGvFdRz9T9QrBU1hnDqPXhyQNUNSokpM8o6Lr2se7mWlS/jz/or3LgQYdbcdvFpIMeIY5QPFm22Rxr1uu7Q7/cU3/CdDa0kBFdGLipiVbt7PbghOmPOQkeRk1geyhDljSQ3I80Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(4022899009)(1800799024)(13003099007)(22082099003)(11063799003)(18002099003)(56012099003)(8096899003)(12006099003)(3023799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzBYRWFFc2EzS1hnMFB6RWpoSENkbHNlWHV0anVzNDJjcWw1U3QwNmNRSkpi?=
 =?utf-8?B?ZC92Zk5JZWNHTFQyMEs5dU5BM21LTTRtL3RCSlJERnZkRGh6b3J3N3JYRDdr?=
 =?utf-8?B?V29wUVhmUUc0QnBmcndqVCtTK1Mrc0V1b2Z2bHJwZ1RMU1k3OTA2aGlTNmRF?=
 =?utf-8?B?UWl2TTZwZkM2RGp2cjRnK2YzZ1Z0eW1oeE1qSnQzL0Myd2lidXlUd2k4ZnNL?=
 =?utf-8?B?MHFDd055NmM2ckFQaUVzaWE0YlBObW92aCtIQmdmMFBvUG1FSUZwK3BBamE4?=
 =?utf-8?B?bGlRNllQUUN1WGs2OENaTU9nQkJPZzM0K28xMU9GelhmellYTnlqN2tmajVh?=
 =?utf-8?B?VzVpZ2l1M0JNaHRkWkpvY2tFbk9teklqLytrV1pLTVA2eXRuckNJK0gxaUpS?=
 =?utf-8?B?c1ZvdlpUbGJYVFEvY1hIOTFvRTd2OVE1SDU5UDg1WlBUZndNRzBEbDRBblox?=
 =?utf-8?B?M0ppMTNNMmJ5REpUVGRPenYwK1NscVV5dmpJSHcrUCtjR3lQZ3d1Y1h4VG1J?=
 =?utf-8?B?bUxqYW5qbGIzdE1MaEZyelpURkM2ZG0rME5PVlBHOExqTFd0cTUwdnJzRDBz?=
 =?utf-8?B?RXpBK3k1VVluWklLc2t6cTQxM3pEK0JENHdPOWRGbDJWTTB3ejNDcDl6QnZG?=
 =?utf-8?B?NlVNSmxNWWhmUHl6bmpWdmxhWm03dktDVm1VK0x5UFM0VzFYQVgvL2p6aUhD?=
 =?utf-8?B?ZFI0WENXdGV4VEdlVzNPRXQ2cDlNeGFuTFZzRzljWDhWMEpWeGNxbVFicFpm?=
 =?utf-8?B?SHZPOUVFSUVIcjRiaE1FNmlIY0M2bEV6NEdDSkI4YWs3d0l2TWVQL0RvUUty?=
 =?utf-8?B?bkhreGJ4RUlhWUxLZEFaU1FsTXdqUk9YRG5CMFpOVzl0REpzOHM4Y0hiUTJt?=
 =?utf-8?B?ZEtFY1lNVEljdFM2MzZKbFU5TzBsVTVCSVlnTHN5dm1XRmM1bXFaT3A4bkpT?=
 =?utf-8?B?Ly9KekR1bFZBVFpiL3VCT1R5a3lRNGJEdFNuWTQxS1ZFclBuajZESTIyelUv?=
 =?utf-8?B?QTNEdURGNXhPN3V6K3h4MVJZV0JOTXFJd1k2OHZxVEVMS0NIaG1QeWFtSWRM?=
 =?utf-8?B?UDRTQzdoSU5idlJ5M29hZHRHemRuTXJwUTVpZ01FcXIwc2FRMi9sblNyWTBq?=
 =?utf-8?B?VDVrb242N3hURUg3dnBJWWgwYnZ4Zmt4Qm94blBXdHd0YXR2ajZqZDJSNFY5?=
 =?utf-8?B?RklMVk1iUWd5b0dHVHFPUmw3WHJoY0p5dUIyZDBzT1FDZlE2ejd3dzd6bnVQ?=
 =?utf-8?B?UHlpcTN2d0VlT3NCcWpxdkI1blFjMGRnd1I5c2p4TGFpZ0d5WFA2d0ZRZVdM?=
 =?utf-8?B?MFNaZUpvVm50WGYxTkl4RzBBR2xnTytaK0lyTktxN25VUGZ3cjhzeDJjK1h3?=
 =?utf-8?B?Q2NWeDQ0Qm9PV0owQkcwakF6SURmQW1JUUhtMGlBZUNHd1RYRTc0OGhGNE4z?=
 =?utf-8?B?dHRxUGVhampnaU9HMWRLSnAyUG5jZFJUbjdkOW1OOHBRYkluL3haekQzVDFD?=
 =?utf-8?B?NE5KcUcydjA4c1QvREFURE9oWGMwRUtwVnhYYmFSWlJEQTROQjM5azEzNEF5?=
 =?utf-8?B?bytTcWZOQnQ0TkZqQnc1RUNZRU1FTmJ5ZXlLYWR1NnR6eS9QbzBoYk4xQmpN?=
 =?utf-8?B?Y25ERC9rMzNOZXUzMElaM0R3ZFBvazcrdDZaV0ZxUXp5dGluS1hrcjlQTzN4?=
 =?utf-8?B?OW5La044T25VK3dKdUdTT0JmTHRhRkVQVExEQXBydFZTbU41bkc0d1BKTi9v?=
 =?utf-8?B?NktqM3FMLzBXNTExRzFYUmZIUGtMQWFid3FBYm16czN0TmE5cDJ4Uzk1WHM2?=
 =?utf-8?B?VGNmeVNLbFVIbi9QRjVNUXlicWYyRkI5cGtkK25KUmh5dXlvL3NDSEo4YWpF?=
 =?utf-8?B?TXVPVm9YUFR3UkU4ZzczVkFmQnlHSWs5VmpPY20yd1RGTmpadUs0NkdzVTlh?=
 =?utf-8?B?SzZiNUhiSUNERkg4L0ZiQU94OEk3aWJqVXU1K0tiajlEeGkvWVJvSTIvQndC?=
 =?utf-8?B?VDV4SDQ2M1lPY214Zk5oSlNHbWxBMVBpZEFKbW1nQ2pmY0lyajI0SVVmc2xN?=
 =?utf-8?B?bk0xbXh5NGU2bjMya2Y2bE9QSTQ0WTlwRU44ZEtuaTV4WThMSGlGS0cwMW9C?=
 =?utf-8?B?MFM4bm81RnFhQ1hEU1ZVVnNyVitWVW10Z0oxTzJaMCtiYURLY2VRY1gydHFy?=
 =?utf-8?B?TUgrZnRVRGx5dnNpUGRjdm1LZGNRTWlsbXVWUVZVY3RjWHpUOEJ1US9hejVP?=
 =?utf-8?B?YnEzb1JJU1NzTUNmaVRobGgzYkV1L2tnSmRtQVNUZGhlakw0TC96RGFDa3l4?=
 =?utf-8?B?NURxKzNMU2tsZkZtLy9sWURCTU12aHVTb0xxb0hmNjk4VGNYd0U2Zz09?=
X-Exchange-RoutingPolicyChecked: 
	XY9/CfstvnkSxSsRNeKsTRdTGaMsX4Rh1Yg44H+fUY6TbhsYmjLJY2PZiLSW4dVB6uDwM+t6q699qrlJXbl+7A9spJxpgb3E9tYQEthoXc7nECX8HjhKrLcoxetzgq/AcZUoUrPmJJtbD1C6WYOXkUJXof7f3BsOE+oFyDLLGAAaZ8fZx0UTbc1Iw6PYsnoOSM2ZGfsxtYb7AVIMm9O5jv6S3qJdGXwyLb88mmT+Tx5D828j8JgNPTgSc1l9kyOjY8T7dKxHd7kvh3XrTtte2LT6Tw7E8gwDeivKwyuiWKwXc70CCnrGB+09b+0dTEJcIIBxVeIYlPO9FXs2ZegbQQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5039b85f-dcba-41b7-4b05-08deb4b5f259
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 08:17:48.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrJAuouMyZjJ54S/RxzKtVaPJ8TxArMgucH4so1IvwvXQXpk3XatMFpvWt6UrpCsRl/5xSY+L+mMzTPkiU6zEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: K-dlEQlR76o-bTww6ojFzKJ-pCzBBL6e
X-Proofpoint-GUID: U12eO7Kfggd5ph6LhfEfhL0qsQLq77Xh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OCBTYWx0ZWRfX6YTtj8Xn19hX
 Ra2vKv3RLl/jrbsHiimKoWCu543SXzz1wywgpawBPrAofU9CIw9MCNzb4H1nuJSQ557oJtM045+
 tVQZsBV8SZHiWrFGZHsnkgkUFGfeqS6/BTMGPrDruzt0DukQ75LSNxIYpvIJiX17Sp10irwS/hj
 Av8u/o88N6PF1d+lMHzLYjX45Bpz2IThJyCYa3rfEESkorfLql8XTw87LhtD0kPc8RD5O1EHIon
 SSm0Vg8HnEz0SIW5hkrebme0p3t336t0+S7qwx6p0Ah7Q+968n4mlT9tU5iJJN9KuXV0D82tw1l
 /gu7lRS/yyb8DM+iHD5asKoUJ2PZkSNIv+bmDChKXxRSMSACGk2XPqa8hp9c4xbdlfYxMdoVs0b
 wpQHwsqTYDUGTW7KyQGNu44SG9IOUPFFbAg+t3775sMQJDCvM6vgw8F9N5TyN1thpVNb24le4CH
 VS3/lLg7cgxfiKDlNhw==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0acb31 cx=c_pps
 a=h5F5dVrtafxD4HcxutFXpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=xNf9USuDAAAA:8
 a=ID6ng7r3AAAA:8 a=p0WdMEafAAAA:8 a=Q4-j1AaZAAAA:8 a=fk1lIlRQAAAA:8
 a=20KFwNOVAAAA:8 a=9qUTvQc-AAAA:8 a=t7CeM3EgAAAA:8 a=GFKtk6rIO2oshziFAroA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eRvkQEcHGvm_YDgrDNUA:9
 a=ssRxa-j0DHyhJWIY:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=AkheI1RvQwOzcTXhi5f4:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=U75ogvRika4pmaD_UPO0:22
 a=axOgMmt4Ejcwn1cqzmsR:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 08:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237210

--------------jBDcBTXaShcAw418JutneRPK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64I7rRd7899305

On 3/7/26 04:53, Yoann Congal via lists.openembedded.org wrote:
> On Fri Feb 20, 2026 at 6:10 AM CET, Hitendra Prajapati via lists.openem=
bedded.org wrote:
>> This patch fix use after free in websocket handshake code.
>>
>> Backport patch from debian refer :
>> https://security-tracker.debian.org/tracker/CVE-2025-11234
>>
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc           |   2 +
>>   .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
>>   .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++=
++
>>   3 files changed, 248 insertions(+)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01=
.patch
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02=
.patch
> Hello,
Hi Yoann,
> Thanks for the v2, it looks better. But it still needs a fix for
> whinlatter (the fix is in 10.0.7, whinlatter in 10.0.6, so maybe an
> upgrade?)

May I ask why it didn't be merged to scarthgap, please?

Regards,
Kai

>
> Regards,
>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtoo=
ls/qemu/qemu.inc
>> index 748a32215e..ba21d57010 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -43,6 +43,8 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \=20
>> file://qemu-guest-agent.udev \ file://CVE-2024-8354.patch \=20
>> file://CVE-2025-12464.patch \ + file://CVE-2025-11234-01.patch \ +=20
>> file://CVE-2025-11234-02.patch \ "
>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>  =20
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b=
/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>> new file mode 100644
>> index 0000000000..c3797bc66f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>> @@ -0,0 +1,72 @@
>> +From 911c814c8cc5f836286bd96694843036db83e99f Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D<berrang=
e@redhat.com>
>> +Date: Tue, 30 Sep 2025 11:58:35 +0100
>> +Subject: [PATCH] io: move websock resource release to close method
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The QIOChannelWebsock object releases all its resources in the
>> +finalize callback. This is later than desired, as callers expect
>> +to be able to call qio_channel_close() to fully close a channel
>> +and release resources related to I/O.
>> +
>> +The logic in the finalize method is at most a failsafe to handle
>> +cases where a consumer forgets to call qio_channel_close.
>> +
>> +This adds equivalent logic to the close method to release the
>> +resources, using g_clear_handle_id/g_clear_pointer to be robust
>> +against repeated invocations. The finalize method is tweaked
>> +so that the GSource is removed before releasing the underlying
>> +channel.
>> +
>> +Reviewed-by: Eric Blake<eblake@redhat.com>
>> +Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>> +(cherry picked from commit 322c3c4f3abee616a18b3bfe563ec29dd67eae63)
>> +Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
>> +
>> +CVE: CVE-2025-11234
>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/com=
mit/911c814c8cc5f836286bd96694843036db83e99f]
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + io/channel-websock.c | 11 ++++++++++-
>> + 1 file changed, 10 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>> +index de39f0d18..1aac3c88a 100644
>> +--- a/io/channel-websock.c
>> ++++ b/io/channel-websock.c
>> +@@ -922,13 +922,13 @@ static void qio_channel_websock_finalize(Object=
 *obj)
>> +     buffer_free(&ioc->encinput);
>> +     buffer_free(&ioc->encoutput);
>> +     buffer_free(&ioc->rawinput);
>> +-    object_unref(OBJECT(ioc->master));
>> +     if (ioc->io_tag) {
>> +         g_source_remove(ioc->io_tag);
>> +     }
>> +     if (ioc->io_err) {
>> +         error_free(ioc->io_err);
>> +     }
>> ++    object_unref(OBJECT(ioc->master));
>> + }
>> +
>> +
>> +@@ -1219,6 +1219,15 @@ static int qio_channel_websock_close(QIOChanne=
l *ioc,
>> +     QIOChannelWebsock *wioc =3D QIO_CHANNEL_WEBSOCK(ioc);
>> +
>> +     trace_qio_channel_websock_close(ioc);
>> ++    buffer_free(&wioc->encinput);
>> ++    buffer_free(&wioc->encoutput);
>> ++    buffer_free(&wioc->rawinput);
>> ++    if (wioc->io_tag) {
>> ++        g_clear_handle_id(&wioc->io_tag, g_source_remove);
>> ++    }
>> ++    if (wioc->io_err) {
>> ++        g_clear_pointer(&wioc->io_err, error_free);
>> ++    }
>> +     return qio_channel_close(wioc->master, errp);
>> + }
>> +
>> +--
>> +2.50.1
>> +
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch b=
/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>> new file mode 100644
>> index 0000000000..364d19457d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>> @@ -0,0 +1,174 @@
>> +From cebdbd038e44af56e74272924dc2bf595a51fd8f Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D<berrang=
e@redhat.com>
>> +Date: Tue, 30 Sep 2025 12:03:15 +0100
>> +Subject: [PATCH] io: fix use after free in websocket handshake code
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +If the QIOChannelWebsock object is freed while it is waiting to
>> +complete a handshake, a GSource is leaked. This can lead to the
>> +callback firing later on and triggering a use-after-free in the
>> +use of the channel. This was observed in the VNC server with the
>> +following trace from valgrind:
>> +
>> +=3D=3D2523108=3D=3D Invalid read of size 4
>> +=3D=3D2523108=3D=3D    at 0x4054A24: vnc_disconnect_start (vnc.c:1296=
)
>> +=3D=3D2523108=3D=3D    by 0x4054A24: vnc_client_error (vnc.c:1392)
>> +=3D=3D2523108=3D=3D    by 0x4068A09: vncws_handshake_done (vnc-ws.c:1=
05)
>> +=3D=3D2523108=3D=3D    by 0x44863B4: qio_task_complete (task.c:197)
>> +=3D=3D2523108=3D=3D    by 0x448343D: qio_channel_websock_handshake_io=
 (channel-websock.c:588)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked=
.lto_priv.0 (gmain.c:4249)
>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c=
:4237)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:2=
87)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loo=
p.c:310)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_ma=
in.h:58)
>> +=3D=3D2523108=3D=3D  Address 0x57a6e0dc is 28 bytes inside a block of=
 size 103,608 free'd
>> +=3D=3D2523108=3D=3D    at 0x5F2FE43: free (vg_replace_malloc.c:989)
>> +=3D=3D2523108=3D=3D    by 0x6EDC444: g_free (gmem.c:208)
>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_update_client (vnc.c:1153)
>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_refresh (vnc.c:3225)
>> +=3D=3D2523108=3D=3D    by 0x4042881: dpy_refresh (console.c:880)
>> +=3D=3D2523108=3D=3D    by 0x4042881: gui_update (console.c:90)
>> +=3D=3D2523108=3D=3D    by 0x45EFA1B: timerlist_run_timers.part.0 (qem=
u-timer.c:562)
>> +=3D2523108=3D=3D    by 0x45EC765: main_loop_wait (main-loop.c:600)
>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_ma=
in.h:58)
>> +=3D=3D2523108=3D=3D  Block was alloc'd at
>> +=3D=3D2523108=3D=3D    at 0x5F343F3: calloc (vg_replace_malloc.c:1675=
)
>> +=3D=3D2523108=3D=3D    by 0x6EE2F81: g_malloc0 (gmem.c:133)
>> +=3D=3D2523108=3D=3D    by 0x4057DA3: vnc_connect (vnc.c:3245)
>> +=3D=3D2523108=3D=3D    by 0x448591B: qio_net_listener_channel_func (n=
et-listener.c:54)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked=
.lto_priv.0 (gmain.c:4249)
>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c=
:4237)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:2=
87)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loo=
p.c:310)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_ma=
in.h:58)
>> +=3D=3D2523108=3D=3D
>> +
>> +The above can be reproduced by launching QEMU with
>> +
>> +  $ qemu-system-x86_64 -vnc localhost:0,websocket=3D5700
>> +
>> +and then repeatedly running:
>> +
>> +  for i in {1..100}; do
>> +     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 localhost 570=
0 &
>> +  done
>> +
>> +CVE-2025-11234
>> +Reported-by: Grant Millar | Cylo<rid@cylo.io>
>> +Reviewed-by: Eric Blake<eblake@redhat.com>
>> +Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>> +(cherry picked from commit b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9)
>> +Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
>> +
>> +CVE: CVE-2025-11234
>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/com=
mit/cebdbd038e44af56e74272924dc2bf595a51fd8f]
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + include/io/channel-websock.h |  3 ++-
>> + io/channel-websock.c         | 22 ++++++++++++++++------
>> + 2 files changed, 18 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/include/io/channel-websock.h b/include/io/channel-websoc=
k.h
>> +index e180827c5..6700cf894 100644
>> +--- a/include/io/channel-websock.h
>> ++++ b/include/io/channel-websock.h
>> +@@ -61,7 +61,8 @@ struct QIOChannelWebsock {
>> +     size_t payload_remain;
>> +     size_t pong_remain;
>> +     QIOChannelWebsockMask mask;
>> +-    guint io_tag;
>> ++    guint hs_io_tag; /* tracking handshake task */
>> ++    guint io_tag; /* tracking watch task */
>> +     Error *io_err;
>> +     gboolean io_eof;
>> +     uint8_t opcode;
>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>> +index 1aac3c88a..583ea8618 100644
>> +--- a/io/channel-websock.c
>> ++++ b/io/channel-websock.c
>> +@@ -545,6 +545,7 @@ static gboolean qio_channel_websock_handshake_sen=
d(QIOChannel *ioc,
>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_pret=
ty(err));
>> +         qio_task_set_error(task, err);
>> +         qio_task_complete(task);
>> ++        wioc->hs_io_tag =3D 0;
>> +         return FALSE;
>> +     }
>> +
>> +@@ -560,6 +561,7 @@ static gboolean qio_channel_websock_handshake_sen=
d(QIOChannel *ioc,
>> +             trace_qio_channel_websock_handshake_complete(ioc);
>> +             qio_task_complete(task);
>> +         }
>> ++        wioc->hs_io_tag =3D 0;
>> +         return FALSE;
>> +     }
>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_OUT);
>> +@@ -586,6 +588,7 @@ static gboolean qio_channel_websock_handshake_io(=
QIOChannel *ioc,
>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_pret=
ty(err));
>> +         qio_task_set_error(task, err);
>> +         qio_task_complete(task);
>> ++        wioc->hs_io_tag =3D 0;
>> +         return FALSE;
>> +     }
>> +     if (ret =3D=3D 0) {
>> +@@ -597,7 +600,7 @@ static gboolean qio_channel_websock_handshake_io(=
QIOChannel *ioc,
>> +     error_propagate(&wioc->io_err, err);
>> +
>> +     trace_qio_channel_websock_handshake_reply(ioc);
>> +-    qio_channel_add_watch(
>> ++    wioc->hs_io_tag =3D qio_channel_add_watch(
>> +         wioc->master,
>> +         G_IO_OUT,
>> +         qio_channel_websock_handshake_send,
>> +@@ -907,11 +910,12 @@ void qio_channel_websock_handshake(QIOChannelWe=
bsock *ioc,
>> +
>> +     trace_qio_channel_websock_handshake_start(ioc);
>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_IN);
>> +-    qio_channel_add_watch(ioc->master,
>> +-                          G_IO_IN,
>> +-                          qio_channel_websock_handshake_io,
>> +-                          task,
>> +-                          NULL);
>> ++    ioc->hs_io_tag =3D qio_channel_add_watch(
>> ++        ioc->master,
>> ++        G_IO_IN,
>> ++        qio_channel_websock_handshake_io,
>> ++        task,
>> ++        NULL);
>> + }
>> +
>> +
>> +@@ -922,6 +926,9 @@ static void qio_channel_websock_finalize(Object *=
obj)
>> +     buffer_free(&ioc->encinput);
>> +     buffer_free(&ioc->encoutput);
>> +     buffer_free(&ioc->rawinput);
>> ++    if (ioc->hs_io_tag) {
>> ++        g_source_remove(ioc->hs_io_tag);
>> ++    }
>> +     if (ioc->io_tag) {
>> +         g_source_remove(ioc->io_tag);
>> +     }
>> +@@ -1222,6 +1229,9 @@ static int qio_channel_websock_close(QIOChannel=
 *ioc,
>> +     buffer_free(&wioc->encinput);
>> +     buffer_free(&wioc->encoutput);
>> +     buffer_free(&wioc->rawinput);
>> ++    if (wioc->hs_io_tag) {
>> ++        g_clear_handle_id(&wioc->hs_io_tag, g_source_remove);
>> ++    }
>> +     if (wioc->io_tag) {
>> +         g_clear_handle_id(&wioc->io_tag, g_source_remove);
>> +     }
>> +--
>> +2.50.1
>> +
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232598):https://lists.openembedded.org/g/openembedd=
ed-core/message/232598
> Mute This Topic:https://lists.openembedded.org/mt/117905702/3616933
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [k=
ai.kang@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------jBDcBTXaShcAw418JutneRPK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64I7rRd7899305

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 3/7/26 04:53, Yoann Congal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DGVZXBTVF9IV.1T2VD5JUSSC1F@smil=
e.fr">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Fri Feb 20, 2026 at 6:10 =
AM CET, Hitendra Prajapati via lists.openembedded.org wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">This patch fix use after f=
ree in websocket handshake code.

Backport patch from debian refer :
<a class=3D"moz-txt-link-freetext" href=3D"https://security-tracker.debia=
n.org/tracker/CVE-2025-11234">https://security-tracker.debian.org/tracker=
/CVE-2025-11234</a>

Signed-off-by: Hitendra Prajapati <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
 .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++++
 3 files changed, 248 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.pat=
ch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.pat=
ch
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Hello,
</pre>
    </blockquote>
    Hi&nbsp;<span style=3D"white-space: pre-wrap">Yoann,</span>
    <blockquote type=3D"cite" cite=3D"mid:DGVZXBTVF9IV.1T2VD5JUSSC1F@smil=
e.fr">
      <pre wrap=3D"" class=3D"moz-quote-pre">
Thanks for the v2, it looks better. But it still needs a fix for
whinlatter (the fix is in 10.0.7, whinlatter in 10.0.6, so maybe an
upgrade?)</pre>
    </blockquote>
    <p>May I ask why it didn't be merged to scarthgap, please?</p>
    <p>Regards,<br>
      Kai</p>
    <blockquote type=3D"cite" cite=3D"mid:DGVZXBTVF9IV.1T2VD5JUSSC1F@smil=
e.fr">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Regards,

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">diff --git a/meta/recipes-=
devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 748a32215e..ba21d57010 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,8 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://qemu-guest-agent.ude=
v\file://CVE-2024-8354.patch\file://CVE-2025-12464.patch\+file://CVE-2025=
-11234-01.patch\+file://CVE-2025-11234-02.patch\">&quot;https://download.=
qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.udev \
            file://CVE-2024-8354.patch \
            file://CVE-2025-12464.patch \
+           file://CVE-2025-11234-01.patch \
+           file://CVE-2025-11234-02.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
new file mode 100644
index 0000000000..c3797bc66f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
@@ -0,0 +1,72 @@
+From 911c814c8cc5f836286bd96694843036db83e99f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:berrange@redhat.com">&lt;berrange@=
redhat.com&gt;</a>
+Date: Tue, 30 Sep 2025 11:58:35 +0100
+Subject: [PATCH] io: move websock resource release to close method
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The QIOChannelWebsock object releases all its resources in the
+finalize callback. This is later than desired, as callers expect
+to be able to call qio_channel_close() to fully close a channel
+and release resources related to I/O.
+
+The logic in the finalize method is at most a failsafe to handle
+cases where a consumer forgets to call qio_channel_close.
+
+This adds equivalent logic to the close method to release the
+resources, using g_clear_handle_id/g_clear_pointer to be robust
+against repeated invocations. The finalize method is tweaked
+so that the GSource is removed before releasing the underlying
+channel.
+
+Reviewed-by: Eric Blake <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
+Signed-off-by: Daniel P. Berrang=C3=A9 <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
+(cherry picked from commit 322c3c4f3abee616a18b3bfe563ec29dd67eae63)
+Signed-off-by: Michael Tokarev <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:mjt@tls.msk.ru">&lt;mjt@tls.msk.ru&gt;</a>
+
+CVE: CVE-2025-11234
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gitlab.com/qemu-project/qemu/-/commit/911c814c8cc5f836286bd96694843=
036db83e99f">https://gitlab.com/qemu-project/qemu/-/commit/911c814c8cc5f8=
36286bd96694843036db83e99f</a>]
+Signed-off-by: Hitendra Prajapati <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ io/channel-websock.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/io/channel-websock.c b/io/channel-websock.c
+index de39f0d18..1aac3c88a 100644
+--- a/io/channel-websock.c
++++ b/io/channel-websock.c
+@@ -922,13 +922,13 @@ static void qio_channel_websock_finalize(Object *o=
bj)
+     buffer_free(&amp;ioc-&gt;encinput);
+     buffer_free(&amp;ioc-&gt;encoutput);
+     buffer_free(&amp;ioc-&gt;rawinput);
+-    object_unref(OBJECT(ioc-&gt;master));
+     if (ioc-&gt;io_tag) {
+         g_source_remove(ioc-&gt;io_tag);
+     }
+     if (ioc-&gt;io_err) {
+         error_free(ioc-&gt;io_err);
+     }
++    object_unref(OBJECT(ioc-&gt;master));
+ }
+=20
+=20
+@@ -1219,6 +1219,15 @@ static int qio_channel_websock_close(QIOChannel *=
ioc,
+     QIOChannelWebsock *wioc =3D QIO_CHANNEL_WEBSOCK(ioc);
+=20
+     trace_qio_channel_websock_close(ioc);
++    buffer_free(&amp;wioc-&gt;encinput);
++    buffer_free(&amp;wioc-&gt;encoutput);
++    buffer_free(&amp;wioc-&gt;rawinput);
++    if (wioc-&gt;io_tag) {
++        g_clear_handle_id(&amp;wioc-&gt;io_tag, g_source_remove);
++    }
++    if (wioc-&gt;io_err) {
++        g_clear_pointer(&amp;wioc-&gt;io_err, error_free);
++    }
+     return qio_channel_close(wioc-&gt;master, errp);
+ }
+=20
+--=20
+2.50.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
new file mode 100644
index 0000000000..364d19457d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
@@ -0,0 +1,174 @@
+From cebdbd038e44af56e74272924dc2bf595a51fd8f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:berrange@redhat.com">&lt;berrange@=
redhat.com&gt;</a>
+Date: Tue, 30 Sep 2025 12:03:15 +0100
+Subject: [PATCH] io: fix use after free in websocket handshake code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+If the QIOChannelWebsock object is freed while it is waiting to
+complete a handshake, a GSource is leaked. This can lead to the
+callback firing later on and triggering a use-after-free in the
+use of the channel. This was observed in the VNC server with the
+following trace from valgrind:
+
+=3D=3D2523108=3D=3D Invalid read of size 4
+=3D=3D2523108=3D=3D    at 0x4054A24: vnc_disconnect_start (vnc.c:1296)
+=3D=3D2523108=3D=3D    by 0x4054A24: vnc_client_error (vnc.c:1392)
+=3D=3D2523108=3D=3D    by 0x4068A09: vncws_handshake_done (vnc-ws.c:105)
+=3D=3D2523108=3D=3D    by 0x44863B4: qio_task_complete (task.c:197)
+=3D=3D2523108=3D=3D    by 0x448343D: qio_channel_websock_handshake_io (c=
hannel-websock.c:588)
+=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
+=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked.lt=
o_priv.0 (gmain.c:4249)
+=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:42=
37)
+=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:287)
+=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loop.c=
:310)
+=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
+=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
+=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
+=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_main.=
h:58)
+=3D=3D2523108=3D=3D  Address 0x57a6e0dc is 28 bytes inside a block of si=
ze 103,608 free'd
+=3D=3D2523108=3D=3D    at 0x5F2FE43: free (vg_replace_malloc.c:989)
+=3D=3D2523108=3D=3D    by 0x6EDC444: g_free (gmem.c:208)
+=3D=3D2523108=3D=3D    by 0x4053F23: vnc_update_client (vnc.c:1153)
+=3D=3D2523108=3D=3D    by 0x4053F23: vnc_refresh (vnc.c:3225)
+=3D=3D2523108=3D=3D    by 0x4042881: dpy_refresh (console.c:880)
+=3D=3D2523108=3D=3D    by 0x4042881: gui_update (console.c:90)
+=3D=3D2523108=3D=3D    by 0x45EFA1B: timerlist_run_timers.part.0 (qemu-t=
imer.c:562)
+=3D2523108=3D=3D    by 0x45EC765: main_loop_wait (main-loop.c:600)
+=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
+=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
+=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_main.=
h:58)
+=3D=3D2523108=3D=3D  Block was alloc'd at
+=3D=3D2523108=3D=3D    at 0x5F343F3: calloc (vg_replace_malloc.c:1675)
+=3D=3D2523108=3D=3D    by 0x6EE2F81: g_malloc0 (gmem.c:133)
+=3D=3D2523108=3D=3D    by 0x4057DA3: vnc_connect (vnc.c:3245)
+=3D=3D2523108=3D=3D    by 0x448591B: qio_net_listener_channel_func (net-=
listener.c:54)
+=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
+=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked.lt=
o_priv.0 (gmain.c:4249)
+=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:42=
37)
+=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:287)
+=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loop.c=
:310)
+=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
+=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
+=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
+=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_main.=
h:58)
+=3D=3D2523108=3D=3D
+
+The above can be reproduced by launching QEMU with
+
+  $ qemu-system-x86_64 -vnc localhost:0,websocket=3D5700
+
+and then repeatedly running:
+
+  for i in {1..100}; do
+     (echo -n &quot;GET / HTTP/1.1&quot; &amp;&amp; sleep 0.05) | nc -w =
1 localhost 5700 &amp;
+  done
+
+CVE-2025-11234
+Reported-by: Grant Millar | Cylo <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:rid@cylo.io">&lt;rid@cylo.io&gt;</a>
+Reviewed-by: Eric Blake <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
+Signed-off-by: Daniel P. Berrang=C3=A9 <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
+(cherry picked from commit b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9)
+Signed-off-by: Michael Tokarev <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:mjt@tls.msk.ru">&lt;mjt@tls.msk.ru&gt;</a>
+
+CVE: CVE-2025-11234
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gitlab.com/qemu-project/qemu/-/commit/cebdbd038e44af56e74272924dc2b=
f595a51fd8f">https://gitlab.com/qemu-project/qemu/-/commit/cebdbd038e44af=
56e74272924dc2bf595a51fd8f</a>]
+Signed-off-by: Hitendra Prajapati <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ include/io/channel-websock.h |  3 ++-
+ io/channel-websock.c         | 22 ++++++++++++++++------
+ 2 files changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/include/io/channel-websock.h b/include/io/channel-websock.h
+index e180827c5..6700cf894 100644
+--- a/include/io/channel-websock.h
++++ b/include/io/channel-websock.h
+@@ -61,7 +61,8 @@ struct QIOChannelWebsock {
+     size_t payload_remain;
+     size_t pong_remain;
+     QIOChannelWebsockMask mask;
+-    guint io_tag;
++    guint hs_io_tag; /* tracking handshake task */
++    guint io_tag; /* tracking watch task */
+     Error *io_err;
+     gboolean io_eof;
+     uint8_t opcode;
+diff --git a/io/channel-websock.c b/io/channel-websock.c
+index 1aac3c88a..583ea8618 100644
+--- a/io/channel-websock.c
++++ b/io/channel-websock.c
+@@ -545,6 +545,7 @@ static gboolean qio_channel_websock_handshake_send(Q=
IOChannel *ioc,
+         trace_qio_channel_websock_handshake_fail(ioc, error_get_pretty(=
err));
+         qio_task_set_error(task, err);
+         qio_task_complete(task);
++        wioc-&gt;hs_io_tag =3D 0;
+         return FALSE;
+     }
+=20
+@@ -560,6 +561,7 @@ static gboolean qio_channel_websock_handshake_send(Q=
IOChannel *ioc,
+             trace_qio_channel_websock_handshake_complete(ioc);
+             qio_task_complete(task);
+         }
++        wioc-&gt;hs_io_tag =3D 0;
+         return FALSE;
+     }
+     trace_qio_channel_websock_handshake_pending(ioc, G_IO_OUT);
+@@ -586,6 +588,7 @@ static gboolean qio_channel_websock_handshake_io(QIO=
Channel *ioc,
+         trace_qio_channel_websock_handshake_fail(ioc, error_get_pretty(=
err));
+         qio_task_set_error(task, err);
+         qio_task_complete(task);
++        wioc-&gt;hs_io_tag =3D 0;
+         return FALSE;
+     }
+     if (ret =3D=3D 0) {
+@@ -597,7 +600,7 @@ static gboolean qio_channel_websock_handshake_io(QIO=
Channel *ioc,
+     error_propagate(&amp;wioc-&gt;io_err, err);
+=20
+     trace_qio_channel_websock_handshake_reply(ioc);
+-    qio_channel_add_watch(
++    wioc-&gt;hs_io_tag =3D qio_channel_add_watch(
+         wioc-&gt;master,
+         G_IO_OUT,
+         qio_channel_websock_handshake_send,
+@@ -907,11 +910,12 @@ void qio_channel_websock_handshake(QIOChannelWebso=
ck *ioc,
+=20
+     trace_qio_channel_websock_handshake_start(ioc);
+     trace_qio_channel_websock_handshake_pending(ioc, G_IO_IN);
+-    qio_channel_add_watch(ioc-&gt;master,
+-                          G_IO_IN,
+-                          qio_channel_websock_handshake_io,
+-                          task,
+-                          NULL);
++    ioc-&gt;hs_io_tag =3D qio_channel_add_watch(
++        ioc-&gt;master,
++        G_IO_IN,
++        qio_channel_websock_handshake_io,
++        task,
++        NULL);
+ }
+=20
+=20
+@@ -922,6 +926,9 @@ static void qio_channel_websock_finalize(Object *obj=
)
+     buffer_free(&amp;ioc-&gt;encinput);
+     buffer_free(&amp;ioc-&gt;encoutput);
+     buffer_free(&amp;ioc-&gt;rawinput);
++    if (ioc-&gt;hs_io_tag) {
++        g_source_remove(ioc-&gt;hs_io_tag);
++    }
+     if (ioc-&gt;io_tag) {
+         g_source_remove(ioc-&gt;io_tag);
+     }
+@@ -1222,6 +1229,9 @@ static int qio_channel_websock_close(QIOChannel *i=
oc,
+     buffer_free(&amp;wioc-&gt;encinput);
+     buffer_free(&amp;wioc-&gt;encoutput);
+     buffer_free(&amp;wioc-&gt;rawinput);
++    if (wioc-&gt;hs_io_tag) {
++        g_clear_handle_id(&amp;wioc-&gt;hs_io_tag, g_source_remove);
++    }
+     if (wioc-&gt;io_tag) {
+         g_clear_handle_id(&amp;wioc-&gt;io_tag, g_source_remove);
+     }
+--=20
+2.50.1
+
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#232598): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/232598">https:/=
/lists.openembedded.org/g/openembedded-core/message/232598</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/117905702/3616933">https://lists.openembedded.org/mt=
/117905702/3616933</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------jBDcBTXaShcAw418JutneRPK--

