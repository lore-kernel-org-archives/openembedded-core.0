Return-Path: <tdarote@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1B2CD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 13:18:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54319.1780924703658347927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 06:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WTFxDh6O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9j6l2919978
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jun 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MraJOB8AEq+uCUnJRL/eoaVk
	Lq7vN9bVfLlT0nd8zXo=; b=WTFxDh6OSAbadaDD6ueanNuPk0qAVd+JLCqcoyTZ
	8Hzttw+xvsGJQ7TGVPZbIvkl7SftbMer2YdVDjzwwNceQMj1xggqhtGGsqQZCFSM
	f9yUjFCL0n3VKX89AZvcPbpTIcihU+mdA+9UJQ6FVZAmC4S+CikoYcV2UUxIVntK
	RNyeEMI2KnIKmdQyBrVtDgmVw6LZ8VA66me59351rC+i3Ajqp577fj6kzFrmP9ZV
	72Dav+Hj0qmLG4idbL6ZnS1a1iJR3I9XdDoPFDIv9WchLBxbyugio4m0Cm4k3bu8
	4eNHK1Iwv2UYW0hpPPIhE8UW7cEr6+IDdaePt1+wMtD4mw==
Received: from bn1pr07cu003.outbound.protection.outlook.com (mail-bn1pr07cu00307.outbound.protection.outlook.com [40.93.12.7])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgyrxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 13:18:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhhkK2IUcR5R42hOmK123IYobifDviLxCfWwWlbC2aD7E1I1yUnErKaWOmW/29/OmvGHHPN7lvMurJ+zFeupIujnlGPSBkJXpq2tVtrDL6+S7Ac6gD5W3lFBN8UKbVFkb/yk4zvo3i3G8k9ON2Oi3kbmnfC2A5lj3mn/hp0ULZR3pVl+K3NrmdDGIZYuIP8EJRnTKs5W89lPkXs50Mz4B8aICZdUnrKGPQ/54o2Wj7OkfyFZ5ypfKF4meazgBa9n5o+Vox9bsIm2weGHTlEjm2cpbNcPDFc79jFQ+3Gj1fcV4vF8aH5pDlTbzm05wvbnsJvMyvhFbZF+s03SH/lFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MraJOB8AEq+uCUnJRL/eoaVkLq7vN9bVfLlT0nd8zXo=;
 b=zRCTvCmRmORIr+Efc8syAS9DWpKhBxveR2TE98oPM06UThSYBWkuaHzUmK2zioppH+tUc8DaVi2arwnvJDZ9jY4r0NvmagEBFQeAs/13nAvPb2JzX4iqCJXqAxGBV3SdKq+A1plgUvPCCxM34+Zhg9OJcKvWjFoHceam2O4msJQLZ7c36WvouTCUW4jsnkqpit30mUQYCNu6WL3+4Ibs28etiYA0tIXkLbTwUZPOVq1dW5VHPbpKNyWp7xNg3jstSPbteXZ4vqycwRCsDWToetfp8W02PnXM9LkpgFMHlTRFpcCeTbN7g0AOxC3RlJkGyV3WH43rxfI8WRTnhmOQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB11317.namprd02.prod.outlook.com (2603:10b6:510:38e::6)
 by BY5PR02MB6706.namprd02.prod.outlook.com (2603:10b6:a03:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 8 Jun 2026
 13:18:19 +0000
Received: from PH0PR02MB11317.namprd02.prod.outlook.com
 ([fe80::132b:f38f:9b47:86a]) by PH0PR02MB11317.namprd02.prod.outlook.com
 ([fe80::132b:f38f:9b47:86a%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 13:18:19 +0000
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in wl_shm
 buffer creation
Thread-Topic: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in
 wl_shm buffer creation
Thread-Index: AQHc90a+W14jWSI8ZU2S4h/hNU78ZrY0oVZF
Date: Mon, 8 Jun 2026 13:18:19 +0000
Message-ID: 
 <PH0PR02MB113174F1DADB824C840153CD48F1C2@PH0PR02MB11317.namprd02.prod.outlook.com>
References: <20260608125956.3297942-1-tdarote@qti.qualcomm.com>
In-Reply-To: <20260608125956.3297942-1-tdarote@qti.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB11317:EE_|BY5PR02MB6706:EE_
x-ms-office365-filtering-correlation-id: 0a5cae36-9a8b-43f7-18dc-08dec5606852
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|18002099003|22082099003|13003099007|38070700021|3023799007|11063799006|5023799004|6133799003|56012099006;
x-microsoft-antispam-message-info: 
 ZgMsk6pRL0epfYK6c4uQAaOgBl+oxWBKUxPrbud7XGcDx5nZ6jVi4VSgZVjme8DJU38FIuVJVZUWdNzeoAftfELXCLMqBtVRRUlPcoMq9HgwImMWuciRU9Ypbvsaujotj//sbwiPa4jnXmVjY7QBM0Jb0I5GCRJhkHEhYig2E4OhP/6Dj7ZwAt6s9KsqATsGo4SBn3GUFB91CD0eFh1fLGpuOFpjNDDfNiCqb4UwcEuNNhoGdR596RzMR42wm9XgobNSR1oBQjYz8EpEABLb+AUFDW/BlbIkMMIjdszGRWX2eOKXKrx3OhIrUnB/Cv5gXA3VV8k64s4g2raPhrIecCegXB8aNqAvEH7HdUqz9ghPYp4vOo0m6d1w/m56/7U3P9F+Cdhh2Y4hoO8YndI0MZOwqtiGnevgRxpk8dDKmErFffdfOOaxjYqHw3xSS+b+vHyR/qPemjHHdrarCFyncu8dcU1lHHcJ5dpjcLLH/m1hXjcr06L7JR0m0ighZf3YL3UCskYeip1OBXN0E3Yyzb62YqkkDM//6fyxt1MKgXC2YsgzASadb/lhkB3MMpY+7rXp+VchYjZsScpnETxJoczqbNdy1BE1XVRp4N7D9oXTnAvemCfRLqw/1AEHpI4S+7XUnmXfmZtVH+K+U1XdQ1CZHkDh5AM6vh+OUgysn3Ibb34p9BbqVwE+7NwSUTHl2ZG4oy5pU8u72w+wSlk0Gw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB11317.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(18002099003)(22082099003)(13003099007)(38070700021)(3023799007)(11063799006)(5023799004)(6133799003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?PzjHrOxF79B0KZs5ksre3a9MB1xFvtO2YG7zj126igT8A7t/zy6+dLffjkMZ?=
 =?us-ascii?Q?Rf6tv4bicO/O0AqbjzzZ1BQNM4/msaH50uNN6RtBAeobUWtEOgL1DU9EZJjY?=
 =?us-ascii?Q?l0o2j2G+bHBAO1wjUIP4J0lDTBiAWJSKPdH3Nnz8jEFYtnOqbaKo+7PYrlQO?=
 =?us-ascii?Q?v7kTC8SWFnUpk+LzwS26Q7pAzyOKoV6kR8dAr5nkhUXh/hMRzWza+NItkKc9?=
 =?us-ascii?Q?+gYXANZMitaBqJbAzDK5wNiOuIsaHppj5VNYBzv0GIZrNQ7m+RcJT7DOuwu5?=
 =?us-ascii?Q?Y0m1l6ov32Xkd4SmhupKx3h9NAGAQs7EhDkKHKr6WwZb3b/hoKBix3TKsq+9?=
 =?us-ascii?Q?hgEhIenlR9Fm4yca6M/8H5KYKlSmT7k0iT14Okc4trjNPM/6VUSYZC1MyCSu?=
 =?us-ascii?Q?FFWIbAb6SycSQ+6+zRTVM7+AMFW8UIqBJrQWUmPlsk590XxHa19L/2lrZpts?=
 =?us-ascii?Q?tGolBrlQfH4/rTNHf11ZU1yMc0RxDuWSJNZjibqTlupemLuFqjiAG3vvPJUM?=
 =?us-ascii?Q?B9g6yJ9f62f0VV2Qw7h4zeDZJAz/MCyS2mV8HIFkCBTKKzT+62vBTzfVSE5m?=
 =?us-ascii?Q?E9IVmv7Ggv4VqLsiMr7qJHxVpjPNlRllQGvBaKAYFNPLTXxvK45mkvowUeJq?=
 =?us-ascii?Q?KMyFBgNKelAS25oaFbq3gNsSTMZoJv2tbsWuFbIlsmNO81ok8MjrZ6akycMy?=
 =?us-ascii?Q?firl9h5Duk8Z2rKwBGwc4tXeF8uHxpIYqQmMRBu3xKSS4Oal5b5WQFIZEKQz?=
 =?us-ascii?Q?WEXVbqZZXM4G11OsRHLMlN5L3Ln8HO69aIjBMupe5kc7xStZPaRwo2u8uW9a?=
 =?us-ascii?Q?uqGf+O9pXwLtY6VeMiYifCjyGFuV7bpk4myhsDiIjflleP5wXssdXduPS/7e?=
 =?us-ascii?Q?/XaMgoix0n2PYWPxvN/MdObu3S5HpnQ6InSB3rLYcD3PMMFGITIvOnsFox+g?=
 =?us-ascii?Q?64o3n/+0ITji2C3LZvjTzcRa56JLdF3wPefeHo13SBAejqtkdQxcdVoFE3M/?=
 =?us-ascii?Q?y94FG4ioXGlxAV/yPrvKU4oaCJbyotKUBoiHLQrn5AxqRR8bs9iCc9A3gb6C?=
 =?us-ascii?Q?I21BbYIaMktxAI1FJLkLw41GMWQTn9xrQlrqkmgozfrahfweGoh0C94RRyt+?=
 =?us-ascii?Q?z9c7akyglMXFzgHkxsf+DlCy9DZdEazJxZFqTgYF9yoSpaNJ4lD6oj07bFgD?=
 =?us-ascii?Q?jpwhfl4KjNRLuW63UFWUpLRWFUdVTHVWgzHweSufbIZow/k/ljUIoIJt1jZr?=
 =?us-ascii?Q?eBp39Sm3h671GBxXFPleWKJY9uEPd8v0JQ5MCqtcZby1xC7vYN0nubIjZTq/?=
 =?us-ascii?Q?o1jFthqFNElhx4aQSoDR0Vh6r1t5MizEGAT7H1pRA6Cmv4LROaxr9w/xcmXP?=
 =?us-ascii?Q?3S+cQNE8rFnAGg9u+phHC1nMprQd2J35uXby4PclG9BG+pzMZQzL3UR4XrrR?=
 =?us-ascii?Q?REXQIrE3XLTIoneUpg9SR5BDt4lfkae8W33GakaTRCBsfaoB4pufmwk/qKzY?=
 =?us-ascii?Q?tujELEWS2ifzJBLFTMs/LZm1hSzD4IJI/chagPoNio37mKQ0Qo94iZQIiYUg?=
 =?us-ascii?Q?JlaxiflRXoLxpdJq76gieRWK1mi8Ui6xCTg0Pdjp5wRh8kde1p7nLiWWqWAw?=
 =?us-ascii?Q?mQ0/38z+GyHNRPmTw2Uv6OtDw8bq5ASNdaQG4KxXxM2/Bv48/uH3hotLFZSY?=
 =?us-ascii?Q?wb0fO9jXyovwx+EvErJqyriknEcPHhKy+yT4gYPR0UZXmyeE7tYCYbioBVHI?=
 =?us-ascii?Q?VFZqzpC2uA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB113174F1DADB824C840153CD48F1C2PH0PR02MB11317na_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	cYAPEXu/2j8+/+1pJjmRszF7vVnUNtA2w5pVs4OkyYio5jaRQuFwCe2Cdh+OP22ptsUaliSIuYnmY+s0nRcU24CoI2pJIE1vZ5zr8dpzfqt1qb7VMfyG8hXcVYxd0c4s5UEfBIfCvrdOq+PocqmY8wiBnWTD4U66xQ1leBmMtznKCz9gCd9q9IkDZBizWVsoVkwUeAAH4TLcg5dzm9vlhp1lPxDZF6aQN0TtutRxURdg29rJDeWZj3rszutSRGeCHKFg1CTrfLr1WwxdWKxVPQwzPdpSKi+Y013xNab3AAyCHHBKMEH03oLT+WO6zx6FD9xpO1kAT7ZjCv+sXd02zQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ysb03GiX3jcc/wXdzcgw2GUEJU9Jo+ebCrXqjA73jrFcouu2momjSxCmLl7yqUc/vm9TlnZ1wUNUApwSEvQnLjRQhYyNdvFq+enVVVWNpz0bVIKIJmgm3kdnHKvQa5ToaIDZVL3Lt/SNQTZArNbmvNxlEU3rqpNyOVewZs2HQbivJDe9CVLWS4ZgOm+5/Fexe9TQ27repmn3S68ClbJjU5HZFuqNKwwNGlcM9sNYG27tYhzyMvWhMvkt27u2AUNzKLDFlHDjJH6NrMVs77AC9ItWYh3kaJ/FoSG++PcnAbaY9MUpgxXm0HhEfIErZJzdfsCV4fgHeDno5fY/Cbdogaq5dYLMHe0rF+Q68vviN4qM16KQTDuZnD1R5ISyP4lFMwte2QAa13i+zS/g48Uv5s95urjrcG+5V4Zef+h9e1KtaHsKqHDl91774sIIrdS9YFQtOrvvDAEQgY/2ef0frmYcyLtdLCRcb1crs/Pkwemn1b5eXrhur+YruSyOs0y7gbhd7JorTMkSG6ztC9a/abLLkoI8OqxXa+xwbeK1yQT1vr55QXJvLSByWptr/ZPgAuR7XnxQgYeFvL2dAtDPCvVcrETOy7L/udaZ82AOZEIGMhCQCGf+5bORN2fdGQnO
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB11317.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5cae36-9a8b-43f7-18dc-08dec5606852
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 13:18:19.0688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8sINa+SocSscUlWmfyCHkhPmSz6+bwnCGMJT2uqi1pvz8YSjrRRl89tZ+5WfMNc/RRP2ZXkFHhrr+xdmFWnb7JfyTEwv1VJ/QDVYHv3Q6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6706
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26c11e cx=c_pps
 a=EaDl3aPh6j9cByxWTcQcVQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=mCKddFNG-Cso-RGAgoUA:9
 a=CjuIK1q_8ugA:10 a=8OTczK1dJMi-tPAFupAA:9 a=TLa1I-F5m3PRUl3U:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: XERnlOhdZQ_z6xq6B1tw7Jd9jrPGoL1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX6UOsNs2nw5E4
 vkmPN9ZMQeTmHB0kDbTVB7EX0eoJo8A5CP9ghd/EOzoH3wwIVMIFgiwUMw1VM2zC5FTAm/y7QoE
 Ub8YnF4WwH6wlLs5uI4DTA+SUVaZkn8A7VnF+RgFDa/BkVu0xCqjXMwspbcHciqSwwz7hIa5tFz
 ArBZNBdk2J7uSCgMZXm2CLhF02/5ObCfgshx3ahjI8/BojipuuJMKP4dUGIrJ4TNxvwMVBjsE2P
 Y1g3VHYx6FRErwvffTRmpV5CFs7Ukzf2bjUI3gRlgPKwt0HkWxmvHVwprs8w3da58fKZ0ItBUaN
 x61s09NKLC98NEeBERTP93GKV3Rk3DOmouTBqtzfC4BKwZGd/CkTfIHLk9t0caDiz9gypofBC9B
 7wrnZ5Ie9qXCXD7/+No/epY5Y01DQcur+kaZ4VZp6/67tDcAOoGiSAMqDNJKk4p8LgcdIN2p+R5
 cv+PYl8qr9tkI0mgE1g==
X-Proofpoint-ORIG-GUID: XERnlOhdZQ_z6xq6B1tw7Jd9jrPGoL1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 13:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238235

--_000_PH0PR02MB113174F1DADB824C840153CD48F1C2PH0PR02MB11317na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

This is v2 of the patch addressing the review comments from the
previous discussion:
https://lists.openembedded.org/g/openembedded-core/topic/119139835#msg23769=
8

Apologies, the updated patch was sent as a new thread instead of a
reply to the original discussion.

Changes since v1:
- Fixed stride handling to correctly support padded buffers
- Updated wl_shm buffer size calculation (stride * height)
- Improved commit message clarity
- Added note about upstream alignment and backport adaptation

This is an adapted version of the upstream fix, as there is a
significant gap between upstream master and the version used in OE,
making a direct backport non-trivial.

Please review.

Thanks,
Tushar


________________________________
From: Tushar Darote <tdarote@qti.qualcomm.com>
Sent: Monday, June 8, 2026 6:29 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Tushar Darote <tdarote@qti.qualcomm.com>
Subject: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in wl_shm =
buffer creation

Use GstBuffer metadata when constructing wl_shm buffers so stride and size =
reflect the actual buffer layout.
This fixes incorrect rendering with DMA-backed buffers that include padding=
 or custom strides.

Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
---
 ...added-buffers-in-wl_shm-buffer-creat.patch | 238 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.28.2.bb        |   1 +
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
5-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-b=
uffers-in-wl_shm-buffer-creat.patch
new file mode 100644
index 0000000000..2bb00e2b1d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayla=
nd-handle-padded-buffers-in-wl_shm-buffer-creat.patch
@@ -0,0 +1,238 @@
+From 2af4bc8562f970207e3b1f6fc0b377ecf116a69c Mon Sep 17 00:00:00 2001
+From: Tushar Darote <tdarote@qti.qualcomm.com>
+Date: Mon, 8 Jun 2026 18:05:51 +0530
+Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation
+
+Use GstBuffer metadata when constructing wl_shm buffers so stride and
+size reflect the actual buffer layout. This fixes incorrect rendering
+with DMA-backed buffers that include padding or custom strides.
+
+gst_wl_shm_memory_construct_wl_buffer() now takes a GstBuffer instead of
+a GstMemory. It derives the video layout from the buffer's GstVideoMeta
+when present (width, height, stride and offset), falling back to the
+caps-derived GstVideoInfo otherwise, and computes the real memory
+footprint (plane_offset + stride * height) rather than the unpadded
+GstVideoInfo size. The single-memory and fd-memory checks that used to
+live in the callers are now performed inside the function.
+
+All callers in gstwlwindow, waylandsink and gtkwaylandsink are updated
+accordingly.
+
+Upstream-Status: Backport [adapted from https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-/merge_requests/11370 due to API differences]
+
+Signed-off-by: Tushar Darote <tdarote@qti.qualcomm.com>
+---
+ ext/gtk/gstgtkwaylandsink.c              | 11 ++---
+ ext/wayland/gstwaylandsink.c             | 11 ++---
+ gst-libs/gst/wayland/gstwlshmallocator.c | 59 ++++++++++++++++++------
+ gst-libs/gst/wayland/gstwlshmallocator.h |  2 +-
+ gst-libs/gst/wayland/gstwlwindow.c       |  4 +-
+ 5 files changed, 52 insertions(+), 35 deletions(-)
+
+diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c
+index 0660b30..81bcd7f 100644
+--- a/ext/gtk/gstgtkwaylandsink.c
++++ b/ext/gtk/gstgtkwaylandsink.c
+@@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)
+       gst_gtk_wayland_sink_get_instance_private (self);
+   GstBuffer *to_render;
+   GstWlBuffer *wlbuffer;
+-  GstMemory *mem;
+   struct wl_buffer *wbuf =3D NULL;
+
+   GstFlowReturn ret =3D GST_FLOW_OK;
+@@ -1240,8 +1239,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)
+   }
+
+   /* update video info from video meta */
+-  mem =3D gst_buffer_peek_memory (buffer, 0);
+-
+   GST_LOG_OBJECT (self,
+       "buffer %" GST_PTR_FORMAT " does not have a wl_buffer from our "
+       "display, creating it", buffer);
+@@ -1301,9 +1298,8 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)
+ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (priv->display,
+           &priv->render_info)) {
+-    if (gst_buffer_n_memory (buffer) =3D=3D 1 && gst_is_fd_memory (mem))
+-      wbuf =3D gst_wl_shm_memory_construct_wl_buffer (mem, priv->display,
+-          &priv->render_info);
++    wbuf =3D gst_wl_shm_memory_construct_wl_buffer (buffer, priv->display=
,
++        &priv->render_info);
+
+     /* If nothing worked, copy into our internal pool */
+     if (!wbuf) {
+@@ -1328,8 +1324,7 @@ handle_shm:
+
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+-        mem =3D gst_buffer_peek_memory (to_render, 0);
+-        wbuf =3D gst_wl_shm_memory_construct_wl_buffer (mem, priv->displa=
y,
++        wbuf =3D gst_wl_shm_memory_construct_wl_buffer (to_render, priv->=
display,
+             &priv->render_info);
+
+         if (G_UNLIKELY (!wbuf))
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c
+index 443db24..60aa11d 100644
+--- a/ext/wayland/gstwaylandsink.c
++++ b/ext/wayland/gstwaylandsink.c
+@@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)
+   GstWaylandSink *self =3D GST_WAYLAND_SINK (vsink);
+   GstBuffer *to_render;
+   GstWlBuffer *wlbuffer;
+-  GstMemory *mem;
+   struct wl_buffer *wbuf =3D NULL;
+
+   GstFlowReturn ret =3D GST_FLOW_OK;
+@@ -1086,8 +1085,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)
+   }
+
+   /* update video info from video meta */
+-  mem =3D gst_buffer_peek_memory (buffer, 0);
+-
+   GST_LOG_OBJECT (self,
+       "buffer %" GST_PTR_FORMAT " does not have a wl_buffer from our "
+       "display, creating it", buffer);
+@@ -1147,9 +1144,8 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)
+ handle_shm:
+   if (!wbuf && gst_wl_display_check_format_for_shm (self->display,
+           &self->render_info)) {
+-    if (gst_buffer_n_memory (buffer) =3D=3D 1 && gst_is_fd_memory (mem))
+-      wbuf =3D gst_wl_shm_memory_construct_wl_buffer (mem, self->display,
+-          &self->video_info);
++    wbuf =3D gst_wl_shm_memory_construct_wl_buffer (buffer, self->display=
,
++        &self->video_info);
+
+     /* If nothing worked, copy into our internal pool */
+     if (!wbuf) {
+@@ -1173,8 +1169,7 @@ handle_shm:
+
+       /* attach a wl_buffer if there isn't one yet */
+       if (G_UNLIKELY (!wlbuffer)) {
+-        mem =3D gst_buffer_peek_memory (to_render, 0);
+-        wbuf =3D gst_wl_shm_memory_construct_wl_buffer (mem, self->displa=
y,
++        wbuf =3D gst_wl_shm_memory_construct_wl_buffer (to_render, self->=
display,
+             &self->video_info);
+
+         if (G_UNLIKELY (!wbuf))
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayla=
nd/gstwlshmallocator.c
+index 671f2b7..11fb22c 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.c
++++ b/gst-libs/gst/wayland/gstwlshmallocator.c
+@@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * v=
info)
+ }
+
+ struct wl_buffer *
+-gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * di=
splay,
+-    const GstVideoInfo * info)
++gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf,
++    GstWlDisplay * display, const GstVideoInfo * info)
+ {
++  GstMemory *mem;
++  GstVideoMeta *vmeta;
++  GstVideoInfo vinfo;
+   gint width, height, stride;
+-  gsize offset, size, memsize, maxsize;
++  gsize plane_offset =3D 0;
++  gsize mem_offset =3D 0;
++  gsize size, memsize, maxsize;
+   enum wl_shm_format format;
+   struct wl_shm_pool *wl_pool;
+   struct wl_buffer *wbuffer;
+
+-  if (!gst_wl_shm_validate_video_info (info)) {
++  /* Ensure the buffer has exactly one memory block */
++  if (gst_buffer_n_memory (buf) !=3D 1)
++    return NULL;
++
++  /* Retrieve the memory and ensure it is FD backed */
++  mem =3D gst_buffer_peek_memory (buf, 0);
++  if (!gst_is_fd_memory (mem))
++    return NULL;
++
++  /* Start from caps-derived video info */
++  vinfo =3D *info;
++
++  /* Override layout using GstVideoMeta if present */
++  vmeta =3D gst_buffer_get_video_meta (buf);
++  if (vmeta) {
++    vinfo.width =3D vmeta->width;
++    vinfo.height =3D vmeta->height;
++    vinfo.stride[0] =3D vmeta->stride[0];
++    vinfo.offset[0] =3D vmeta->offset[0];
++  }
++
++  /* Validate the final video layout */
++  if (!gst_wl_shm_validate_video_info (&vinfo)) {
+     GST_DEBUG_OBJECT (display, "Unsupported strides and offsets.");
+     return NULL;
+   }
+
+-  width =3D GST_VIDEO_INFO_WIDTH (info);
+-  height =3D GST_VIDEO_INFO_HEIGHT (info);
+-  stride =3D GST_VIDEO_INFO_PLANE_STRIDE (info, 0);
+-  size =3D GST_VIDEO_INFO_SIZE (info);
+-  format =3D gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (in=
fo));
++  width =3D GST_VIDEO_INFO_WIDTH (&vinfo);
++  height =3D GST_VIDEO_INFO_HEIGHT (&vinfo);
++  stride =3D GST_VIDEO_INFO_PLANE_STRIDE (&vinfo, 0);
++  plane_offset =3D GST_VIDEO_INFO_PLANE_OFFSET (&vinfo, 0);
++
++  /* wl_shm requires the actual memory footprint of the buffer */
++  size =3D plane_offset + (stride * height);
++  format =3D gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMAT (&v=
info));
+
+-  memsize =3D gst_memory_get_sizes (mem, &offset, &maxsize);
+-  offset +=3D GST_VIDEO_INFO_PLANE_OFFSET (info, 0);
++  memsize =3D gst_memory_get_sizes (mem, &mem_offset, &maxsize);
+
+-  g_return_val_if_fail (gst_is_fd_memory (mem), NULL);
+   g_return_val_if_fail (size <=3D memsize, NULL);
+-  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, inf=
o),
++  g_return_val_if_fail (gst_wl_display_check_format_for_shm (display, &vi=
nfo),
+       NULL);
+
+   GST_DEBUG_OBJECT (display, "Creating wl_buffer from SHM of size %"
+@@ -110,8 +138,9 @@ gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem=
, GstWlDisplay * display,
+
+   wl_pool =3D wl_shm_create_pool (gst_wl_display_get_shm (display),
+       gst_fd_memory_get_fd (mem), memsize);
+-  wbuffer =3D wl_shm_pool_create_buffer (wl_pool, offset, width, height, =
stride,
+-      format);
++  wbuffer =3D
++      wl_shm_pool_create_buffer (wl_pool, mem_offset + plane_offset, widt=
h,
++      height, stride, format);
+   wl_shm_pool_destroy (wl_pool);
+
+   return wbuffer;
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayla=
nd/gstwlshmallocator.h
+index 4309bd7..38f3ba5 100644
+--- a/gst-libs/gst/wayland/gstwlshmallocator.h
++++ b/gst-libs/gst/wayland/gstwlshmallocator.h
+@@ -33,7 +33,7 @@ GST_WL_API
+ void gst_wl_shm_init_once (void);
+
+ GST_WL_API
+-struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem=
,
++struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf=
,
+     GstWlDisplay * display, const GstVideoInfo * info);
+
+ G_END_DECLS
+diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gst=
wlwindow.c
+index 3c5c3cc..cd9c964 100644
+--- a/gst-libs/gst/wayland/gstwlwindow.c
++++ b/gst-libs/gst/wayland/gstwlwindow.c
+@@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)
+     buf =3D gst_buffer_new_allocate (alloc, info.size, NULL);
+     gst_buffer_memset (buf, 0, 0, info.size);
+
+-    wlbuf =3D
+-        gst_wl_shm_memory_construct_wl_buffer (gst_buffer_peek_memory (bu=
f, 0),
+-        priv->display, &info);
++    wlbuf =3D gst_wl_shm_memory_construct_wl_buffer (buf, priv->display, =
&info);
+
+     g_object_unref (alloc);
+   }
+--
+2.34.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.=
bb
index d5ca397129..337b9f5d77 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -9,6 +9,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plug=
ins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-wit=
h.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-bui=
l.patch \
+           file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-crea=
t.patch \
            "
 SRC_URI[sha256sum] =3D "6467e3964828f4d7d08bfe1fbb4d76287a1c8fa76674e59e10=
1a149c020fefd7"

--
2.34.1


--_000_PH0PR02MB113174F1DADB824C840153CD48F1C2PH0PR02MB11317na_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This is v2 of the patch addressing the review comments from the</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
previous discussion:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
https://lists.openembedded.org/g/openembedded-core/topic/119139835#msg23769=
8</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Apologies, the updated patch was sent as a new thread instead of a</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
reply to the original discussion.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Changes since v1:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- Fixed stride handling to correctly support padded buffers</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- Updated wl_shm buffer size calculation (stride * height)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- Improved commit message clarity</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
- Added note about upstream alignment and backport adaptation</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This is an adapted version of the upstream fix, as there is a</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
significant gap between upstream master and the version used in OE,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
making a direct backport non-trivial.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please review.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Tushar</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tushar Darote &lt;tda=
rote@qti.qualcomm.com&gt;<br>
<b>Sent:</b> Monday, June 8, 2026 6:29 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Tushar Darote &lt;tdarote@qti.qualcomm.com&gt;<br>
<b>Subject:</b> [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in =
wl_shm buffer creation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Use GstBuffer metadata when constructing wl_shm bu=
ffers so stride and size reflect the actual buffer layout.<br>
This fixes incorrect rendering with DMA-backed buffers that include padding=
 or custom strides.<br>
<br>
Signed-off-by: Tushar Darote &lt;tdarote@qti.qualcomm.com&gt;<br>
---<br>
&nbsp;...added-buffers-in-wl_shm-buffer-creat.patch | 238 +++++++++++++++++=
+<br>
&nbsp;.../gstreamer1.0-plugins-bad_1.28.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 239 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plu=
gins-bad/0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch<br=
>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/000=
5-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayland-handle-padded-b=
uffers-in-wl_shm-buffer-creat.patch<br>
new file mode 100644<br>
index 0000000000..2bb00e2b1d<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-wayla=
nd-handle-padded-buffers-in-wl_shm-buffer-creat.patch<br>
@@ -0,0 +1,238 @@<br>
+From 2af4bc8562f970207e3b1f6fc0b377ecf116a69c Mon Sep 17 00:00:00 2001<br>
+From: Tushar Darote &lt;tdarote@qti.qualcomm.com&gt;<br>
+Date: Mon, 8 Jun 2026 18:05:51 +0530<br>
+Subject: [PATCH] wayland: handle padded buffers in wl_shm buffer creation<=
br>
+<br>
+Use GstBuffer metadata when constructing wl_shm buffers so stride and<br>
+size reflect the actual buffer layout. This fixes incorrect rendering<br>
+with DMA-backed buffers that include padding or custom strides.<br>
+<br>
+gst_wl_shm_memory_construct_wl_buffer() now takes a GstBuffer instead of<b=
r>
+a GstMemory. It derives the video layout from the buffer's GstVideoMeta<br=
>
+when present (width, height, stride and offset), falling back to the<br>
+caps-derived GstVideoInfo otherwise, and computes the real memory<br>
+footprint (plane_offset + stride * height) rather than the unpadded<br>
+GstVideoInfo size. The single-memory and fd-memory checks that used to<br>
+live in the callers are now performed inside the function.<br>
+<br>
+All callers in gstwlwindow, waylandsink and gtkwaylandsink are updated<br>
+accordingly.<br>
+<br>
+Upstream-Status: Backport [adapted from <a href=3D"https://gitlab.freedesk=
top.org/gstreamer/gstreamer/-/merge_requests/11370">
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/11370</=
a> due to API differences]<br>
+<br>
+Signed-off-by: Tushar Darote &lt;tdarote@qti.qualcomm.com&gt;<br>
+---<br>
+ ext/gtk/gstgtkwaylandsink.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 ++---<br>
+ ext/wayland/gstwaylandsink.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 ++---<br>
+ gst-libs/gst/wayland/gstwlshmallocator.c | 59 ++++++++++++++++++------<br=
>
+ gst-libs/gst/wayland/gstwlshmallocator.h |&nbsp; 2 +-<br>
+ gst-libs/gst/wayland/gstwlwindow.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&=
nbsp; 4 +-<br>
+ 5 files changed, 52 insertions(+), 35 deletions(-)<br>
+<br>
+diff --git a/ext/gtk/gstgtkwaylandsink.c b/ext/gtk/gstgtkwaylandsink.c<br>
+index 0660b30..81bcd7f 100644<br>
+--- a/ext/gtk/gstgtkwaylandsink.c<br>
++++ b/ext/gtk/gstgtkwaylandsink.c<br>
+@@ -1179,7 +1179,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gst_gtk_wayland_sink_get_instance_pri=
vate (self);<br>
+&nbsp;&nbsp; GstBuffer *to_render;<br>
+&nbsp;&nbsp; GstWlBuffer *wlbuffer;<br>
+-&nbsp; GstMemory *mem;<br>
+&nbsp;&nbsp; struct wl_buffer *wbuf =3D NULL;<br>
+ <br>
+&nbsp;&nbsp; GstFlowReturn ret =3D GST_FLOW_OK;<br>
+@@ -1240,8 +1239,6 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)<br>
+&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp; /* update video info from video meta */<br>
+-&nbsp; mem =3D gst_buffer_peek_memory (buffer, 0);<br>
+-<br>
+&nbsp;&nbsp; GST_LOG_OBJECT (self,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;buffer %&quot; GST_PTR_FORMAT &=
quot; does not have a wl_buffer from our &quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;display, creating it&quot;, buf=
fer);<br>
+@@ -1301,9 +1298,8 @@ gst_gtk_wayland_sink_show_frame (GstVideoSink * vsin=
k, GstBuffer * buffer)<br>
+ handle_shm:<br>
+&nbsp;&nbsp; if (!wbuf &amp;&amp; gst_wl_display_check_format_for_shm (pri=
v-&gt;display,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;priv-&gt=
;render_info)) {<br>
+-&nbsp;&nbsp;&nbsp; if (gst_buffer_n_memory (buffer) =3D=3D 1 &amp;&amp; g=
st_is_fd_memory (mem))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_construct_wl_bu=
ffer (mem, priv-&gt;display,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;priv-&gt;rend=
er_info);<br>
++&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_construct_wl_buffer (buffer=
, priv-&gt;display,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;priv-&gt;render_info);<br=
>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* If nothing worked, copy into our internal pool=
 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (!wbuf) {<br>
+@@ -1328,8 +1324,7 @@ handle_shm:<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* attach a wl_buffer if there isn't =
one yet */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (G_UNLIKELY (!wlbuffer)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mem =3D gst_buffer_peek_memory=
 (to_render, 0);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_con=
struct_wl_buffer (mem, priv-&gt;display,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_con=
struct_wl_buffer (to_render, priv-&gt;display,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
amp;priv-&gt;render_info);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (G_UNLIKELY (!wbuf))<b=
r>
+diff --git a/ext/wayland/gstwaylandsink.c b/ext/wayland/gstwaylandsink.c<b=
r>
+index 443db24..60aa11d 100644<br>
+--- a/ext/wayland/gstwaylandsink.c<br>
++++ b/ext/wayland/gstwaylandsink.c<br>
+@@ -1011,7 +1011,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)<br>
+&nbsp;&nbsp; GstWaylandSink *self =3D GST_WAYLAND_SINK (vsink);<br>
+&nbsp;&nbsp; GstBuffer *to_render;<br>
+&nbsp;&nbsp; GstWlBuffer *wlbuffer;<br>
+-&nbsp; GstMemory *mem;<br>
+&nbsp;&nbsp; struct wl_buffer *wbuf =3D NULL;<br>
+ <br>
+&nbsp;&nbsp; GstFlowReturn ret =3D GST_FLOW_OK;<br>
+@@ -1086,8 +1085,6 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)<br>
+&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp; /* update video info from video meta */<br>
+-&nbsp; mem =3D gst_buffer_peek_memory (buffer, 0);<br>
+-<br>
+&nbsp;&nbsp; GST_LOG_OBJECT (self,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;buffer %&quot; GST_PTR_FORMAT &=
quot; does not have a wl_buffer from our &quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;display, creating it&quot;, buf=
fer);<br>
+@@ -1147,9 +1144,8 @@ gst_wayland_sink_show_frame (GstVideoSink * vsink, G=
stBuffer * buffer)<br>
+ handle_shm:<br>
+&nbsp;&nbsp; if (!wbuf &amp;&amp; gst_wl_display_check_format_for_shm (sel=
f-&gt;display,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;self-&gt=
;render_info)) {<br>
+-&nbsp;&nbsp;&nbsp; if (gst_buffer_n_memory (buffer) =3D=3D 1 &amp;&amp; g=
st_is_fd_memory (mem))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_construct_wl_bu=
ffer (mem, self-&gt;display,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;self-&gt;vide=
o_info);<br>
++&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_construct_wl_buffer (buffer=
, self-&gt;display,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;self-&gt;video_info);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* If nothing worked, copy into our internal pool=
 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (!wbuf) {<br>
+@@ -1173,8 +1169,7 @@ handle_shm:<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* attach a wl_buffer if there isn't =
one yet */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (G_UNLIKELY (!wlbuffer)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mem =3D gst_buffer_peek_memory=
 (to_render, 0);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_con=
struct_wl_buffer (mem, self-&gt;display,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wbuf =3D gst_wl_shm_memory_con=
struct_wl_buffer (to_render, self-&gt;display,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
amp;self-&gt;video_info);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (G_UNLIKELY (!wbuf))<b=
r>
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.c b/gst-libs/gst/wayla=
nd/gstwlshmallocator.c<br>
+index 671f2b7..11fb22c 100644<br>
+--- a/gst-libs/gst/wayland/gstwlshmallocator.c<br>
++++ b/gst-libs/gst/wayland/gstwlshmallocator.c<br>
+@@ -76,32 +76,60 @@ gst_wl_shm_validate_video_info (const GstVideoInfo * v=
info)<br>
+ }<br>
+ <br>
+ struct wl_buffer *<br>
+-gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem, GstWlDisplay * di=
splay,<br>
+-&nbsp;&nbsp;&nbsp; const GstVideoInfo * info)<br>
++gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf,<br>
++&nbsp;&nbsp;&nbsp; GstWlDisplay * display, const GstVideoInfo * info)<br>
+ {<br>
++&nbsp; GstMemory *mem;<br>
++&nbsp; GstVideoMeta *vmeta;<br>
++&nbsp; GstVideoInfo vinfo;<br>
+&nbsp;&nbsp; gint width, height, stride;<br>
+-&nbsp; gsize offset, size, memsize, maxsize;<br>
++&nbsp; gsize plane_offset =3D 0;<br>
++&nbsp; gsize mem_offset =3D 0;<br>
++&nbsp; gsize size, memsize, maxsize;<br>
+&nbsp;&nbsp; enum wl_shm_format format;<br>
+&nbsp;&nbsp; struct wl_shm_pool *wl_pool;<br>
+&nbsp;&nbsp; struct wl_buffer *wbuffer;<br>
+ <br>
+-&nbsp; if (!gst_wl_shm_validate_video_info (info)) {<br>
++&nbsp; /* Ensure the buffer has exactly one memory block */<br>
++&nbsp; if (gst_buffer_n_memory (buf) !=3D 1)<br>
++&nbsp;&nbsp;&nbsp; return NULL;<br>
++<br>
++&nbsp; /* Retrieve the memory and ensure it is FD backed */<br>
++&nbsp; mem =3D gst_buffer_peek_memory (buf, 0);<br>
++&nbsp; if (!gst_is_fd_memory (mem))<br>
++&nbsp;&nbsp;&nbsp; return NULL;<br>
++<br>
++&nbsp; /* Start from caps-derived video info */<br>
++&nbsp; vinfo =3D *info;<br>
++<br>
++&nbsp; /* Override layout using GstVideoMeta if present */<br>
++&nbsp; vmeta =3D gst_buffer_get_video_meta (buf);<br>
++&nbsp; if (vmeta) {<br>
++&nbsp;&nbsp;&nbsp; vinfo.width =3D vmeta-&gt;width;<br>
++&nbsp;&nbsp;&nbsp; vinfo.height =3D vmeta-&gt;height;<br>
++&nbsp;&nbsp;&nbsp; vinfo.stride[0] =3D vmeta-&gt;stride[0];<br>
++&nbsp;&nbsp;&nbsp; vinfo.offset[0] =3D vmeta-&gt;offset[0];<br>
++&nbsp; }<br>
++<br>
++&nbsp; /* Validate the final video layout */<br>
++&nbsp; if (!gst_wl_shm_validate_video_info (&amp;vinfo)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; GST_DEBUG_OBJECT (display, &quot;Unsupported stri=
des and offsets.&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
+&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp; width =3D GST_VIDEO_INFO_WIDTH (info);<br>
+-&nbsp; height =3D GST_VIDEO_INFO_HEIGHT (info);<br>
+-&nbsp; stride =3D GST_VIDEO_INFO_PLANE_STRIDE (info, 0);<br>
+-&nbsp; size =3D GST_VIDEO_INFO_SIZE (info);<br>
+-&nbsp; format =3D gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMA=
T (info));<br>
++&nbsp; width =3D GST_VIDEO_INFO_WIDTH (&amp;vinfo);<br>
++&nbsp; height =3D GST_VIDEO_INFO_HEIGHT (&amp;vinfo);<br>
++&nbsp; stride =3D GST_VIDEO_INFO_PLANE_STRIDE (&amp;vinfo, 0);<br>
++&nbsp; plane_offset =3D GST_VIDEO_INFO_PLANE_OFFSET (&amp;vinfo, 0);<br>
++<br>
++&nbsp; /* wl_shm requires the actual memory footprint of the buffer */<br=
>
++&nbsp; size =3D plane_offset + (stride * height);<br>
++&nbsp; format =3D gst_video_format_to_wl_shm_format (GST_VIDEO_INFO_FORMA=
T (&amp;vinfo));<br>
+ <br>
+-&nbsp; memsize =3D gst_memory_get_sizes (mem, &amp;offset, &amp;maxsize);=
<br>
+-&nbsp; offset +=3D GST_VIDEO_INFO_PLANE_OFFSET (info, 0);<br>
++&nbsp; memsize =3D gst_memory_get_sizes (mem, &amp;mem_offset, &amp;maxsi=
ze);<br>
+ <br>
+-&nbsp; g_return_val_if_fail (gst_is_fd_memory (mem), NULL);<br>
+&nbsp;&nbsp; g_return_val_if_fail (size &lt;=3D memsize, NULL);<br>
+-&nbsp; g_return_val_if_fail (gst_wl_display_check_format_for_shm (display=
, info),<br>
++&nbsp; g_return_val_if_fail (gst_wl_display_check_format_for_shm (display=
, &amp;vinfo),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL);<br>
+ <br>
+&nbsp;&nbsp; GST_DEBUG_OBJECT (display, &quot;Creating wl_buffer from SHM =
of size %&quot;<br>
+@@ -110,8 +138,9 @@ gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem=
, GstWlDisplay * display,<br>
+ <br>
+&nbsp;&nbsp; wl_pool =3D wl_shm_create_pool (gst_wl_display_get_shm (displ=
ay),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gst_fd_memory_get_fd (mem), memsize);=
<br>
+-&nbsp; wbuffer =3D wl_shm_pool_create_buffer (wl_pool, offset, width, hei=
ght, stride,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format);<br>
++&nbsp; wbuffer =3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wl_shm_pool_create_buffer (wl_pool, mem_of=
fset + plane_offset, width,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; height, stride, format);<br>
+&nbsp;&nbsp; wl_shm_pool_destroy (wl_pool);<br>
+ <br>
+&nbsp;&nbsp; return wbuffer;<br>
+diff --git a/gst-libs/gst/wayland/gstwlshmallocator.h b/gst-libs/gst/wayla=
nd/gstwlshmallocator.h<br>
+index 4309bd7..38f3ba5 100644<br>
+--- a/gst-libs/gst/wayland/gstwlshmallocator.h<br>
++++ b/gst-libs/gst/wayland/gstwlshmallocator.h<br>
+@@ -33,7 +33,7 @@ GST_WL_API<br>
+ void gst_wl_shm_init_once (void);<br>
+ <br>
+ GST_WL_API<br>
+-struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstMemory * mem=
,<br>
++struct wl_buffer * gst_wl_shm_memory_construct_wl_buffer (GstBuffer * buf=
,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; GstWlDisplay * display, const GstVideoInfo * info=
);<br>
+ <br>
+ G_END_DECLS<br>
+diff --git a/gst-libs/gst/wayland/gstwlwindow.c b/gst-libs/gst/wayland/gst=
wlwindow.c<br>
+index 3c5c3cc..cd9c964 100644<br>
+--- a/gst-libs/gst/wayland/gstwlwindow.c<br>
++++ b/gst-libs/gst/wayland/gstwlwindow.c<br>
+@@ -985,9 +985,7 @@ gst_wl_window_update_borders (GstWlWindow * self)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; buf =3D gst_buffer_new_allocate (alloc, info.size=
, NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; gst_buffer_memset (buf, 0, 0, info.size);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp; wlbuf =3D<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gst_wl_shm_memory_construct_wl=
_buffer (gst_buffer_peek_memory (buf, 0),<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; priv-&gt;display, &amp;info);<=
br>
++&nbsp;&nbsp;&nbsp; wlbuf =3D gst_wl_shm_memory_construct_wl_buffer (buf, =
priv-&gt;display, &amp;info);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; g_object_unref (alloc);<br>
+&nbsp;&nbsp; }<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.=
bb<br>
index d5ca397129..337b9f5d77 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb<=
br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb<=
br>
@@ -9,6 +9,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://gstreamer.freede=
sktop.org/src/gst-plugins-bad/gst-plugins-bad<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch"=
>
file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-avoid-including-sys-poll.h-directly.patch">file://0002-avoi=
d-including-sys-poll.h-directly.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch"=
>
file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch">
file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;6467e3964828f4d7d08bfe1fbb4d76287a1c8fa7=
6674e59e101a149c020fefd7&quot;<br>
&nbsp;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR02MB113174F1DADB824C840153CD48F1C2PH0PR02MB11317na_--

