Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2CEC88E59
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 14:01:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7029.1789220699719191639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 06:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WkfBrAhs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdxoV1708061;
	Sat, 12 Sep 2026 12:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eHMcHVhZ0Ml+VEsR33x/EcaI
	CdP8ObIMsG4RoWCtCTI=; b=WkfBrAhsOrrvPJxWgKNgdFfGKajBafpLme3eABLy
	TXOODtcfgZ0mTx2k+tThIGIBrWX6E7Tm58DFOwTWvEF1gVouxoKEJBbgEbk3h0JR
	Q98+8GmUtjIHt9hc4Nxf8KVyDG3bDx24X05miGzo3TPSlr/oUH/EC2EbiylvWkE1
	Furn267P8sBMO0OgX2Jo86AYCtJC4gKj/X1NOCm+OL2scRwaqy4tQqdWZUZSntWX
	H956UlcDA66dvZMgcKt1zecQ8/Y7+g0Qszz5PRRV0L2GXvScrZPKBdhR3RfY5sge
	usfKdmad5rE4TAzyfr3zOD1OSLMefCvR6atGT9miKo/qhA==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00302.outbound.protection.outlook.com [40.93.1.106])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh0vgh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 12:55:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9kR/z8vLza4gkovTWEwZkGeYzOqoztfokuiE8UTkVJ1ieiQCZKBP8dGghU1C9d2Av/HHgHeT6rRthJ4xTAs0hEAmLhszGqo/vE/3OePDX3qbabWFSBIjDW5hJg/Lv0kkmjRJIyKI+I9sTGXV7CAQrOspQHhR5VkV5XVppbuUPHou+EsmIUaSdqe0Gpjr+WiTqvldoqDEeqeEV+yft2VE6rLWl3jnPjf0B1j3dTMss5E9oZSKjQOMdFLnQNb5zF7iUZEmLDvr0PqGEq5ebe6jJJJvZCLmpnGiX/zZxzGvjtNY/butNnvkm4FfXACtl6uCHM8TW0JmuuMGBIC4X100g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHMcHVhZ0Ml+VEsR33x/EcaICdP8ObIMsG4RoWCtCTI=;
 b=pvp0IFmh+9atLIPg56cnXM8K/IH+KSd3RGJ+7Ls6KVVmoPmt2UlM+BTDTkaEeZeLWQGjaLi6esaaoLZXqtvSJc7GALGTdnz0qInyU7Y1w63QsqnskOijW7b0RsqVjSimORW1s9lyAzq+DjufCJePoriaOI002U3SaXvn9OzIwh5ZgDuLLxohcXRygymVFGbhnADNLZPFGgoV8RB59OPLhoTZBxH+pd1bz2k7xk5At1dM1a2KplRrCFx90R6T6aSQfp5C+sdFBtCLDM8BM9e0aFVlMQ3OgL9NQZHA3bFX6rVqingAaKDBlDeqOTM9GGtBQdfkgCeCbhXmLff9m1kEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 DM8PR02MB8007.namprd02.prod.outlook.com (2603:10b6:8:18::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Sat, 12 Sep 2026 12:55:14 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 12:55:14 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] initramfs-framework: avoid processes when parsing cmdline
Thread-Topic: [OE-core] [PATCH] initramfs-framework: avoid processes when
 parsing cmdline
Thread-Index: AQHdQgA7+Z1IkEOjU0CQ1tzfBu/b77bJupuAgAEsm8M=
Date: Sat, 12 Sep 2026 12:55:13 +0000
Message-ID: 
 <DS0PR02MB91976FA8F50BB0E0568B0248EABD2@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260911151416.1946900-1-wenwfu@qti.qualcomm.com>
 <DLCPT6JMUAFL.3O5FRF4W086BP@smile.fr>
In-Reply-To: <DLCPT6JMUAFL.3O5FRF4W086BP@smile.fr>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|DM8PR02MB8007:EE_
x-ms-office365-filtering-correlation-id: 45568e01-d590-4dcd-54f6-08df10cd1661
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|3023799007|10067099003|18002099003|56012099006|11063799006|4143699003|22082099003|8096899003;
x-microsoft-antispam-message-info: 
 ZzpscV+OGlf4XYT+QvJH2wJ5+83O8FeJVKl1bQrx+dghZG1b67vKh3QbT2mvUEJse3/lxJGlwT/nm8aHobF+YZ8lSpYf8e+E3Yx8zDP8K2yTw/Cmg1kyWb8sCVoXPv8VptIPuwqtdw/biKz7CQLMYglqn44Q6JwbJY+/kM1xCMhurFGGBFD/j/Rarng4TvFZ+N/4+qdkigEqEbcfosBUH7dFuZVLYSpN8VnCb1UHTcUud/h1YKe7QP1445gniArnHCCLhuQGViq5COh2+Bq9yXriF+vmCy7NSVKotn8jboB+w13WhP8nXsBm7dPhaQ9irzCVjWLImO8mpFoZt80wPLjKo/dmdLLarWZ6+VvpcD9RWE4rjCI1v+J2DouMTyM6gQ56zEsOcHUexMOvjIDVTH8BoqP8WscVB83fz0ZaftwrwdQCXzw2Fl+HUo3rgATbD2JKbLEPBNZqduGPsipyrkdIVy+zE0K44r6bTqkk4gxLA6OjV5JhbnN2kkEa74G7cB8Q7BrIKX5LbwTcyjDmpf6ySG5ll53JqxcXbTYG0diuNOD/50LsWuwfpbLObtmBvoNC9jKa3n9vWSNX6dv06CPQsUfTta9Lz1uGkgOTwaEGWbjPITGUsmHQco8HF7oH2onwotdr9T2rJmnBgWrKNIb/4Tj5Gz//FUT+PjzOy5QN4iPIkJ/pZmzwiXAetnd7MX+TwfqVFOOV7OvTXq7Ft17Hp6+25NHnSNPa4QFewRo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uJQb166EEcLM5DX2XuPhDTxJ5OC8RwGaC61AW3iN8nQpDJ6lHxVbMVNyLbqy?=
 =?us-ascii?Q?VJRaXgZ43mKkNrz22iH2C3B+ZZ+SoTThxTinqYb/lw41bHyAxKiVPF8G7yZr?=
 =?us-ascii?Q?H4VmXQILuFzDDwts7imOpsik2bEfytBPlivwYnLR9u5/N4hwIuNfNpfvGdZ0?=
 =?us-ascii?Q?5flhS4SjMbgoo/fLCEMq54ojcsCst1n+MqCaJxVo9+vIm/5/zjq+ETAv8X8Z?=
 =?us-ascii?Q?myzs3Pz7FeEdE73w9SoDG9u7XlqFiFIvsEVwpQthZQRasSMrttMn1wcnMw0a?=
 =?us-ascii?Q?clDXcDZVhP/t1+X52QAh2HCzTrHHm7dFdz2vkRBLwiKAegk5sLhGJb74vOOx?=
 =?us-ascii?Q?pkMpNeJuJweeAlRlC6Yvpj4BI0WqCtMpY6wOuciL3uX1lVlO+OGkvGtRThio?=
 =?us-ascii?Q?/anQoDweZVMvVFmh55frXMoZvwZQIMyLc3YOVqH/xQMeN6qhQunEPhzXozj3?=
 =?us-ascii?Q?AjDtWK4A3kM1Xhezs9g3OGN/tXCbatfI/LzjNkkdE3vr/hP8NFpq66WYI7oo?=
 =?us-ascii?Q?q910Qckbp2tU9F5nwyh2nnF8ktTgBPmaqb+gGlRgJIyL2FHobWPqtraIzT/H?=
 =?us-ascii?Q?l/99Zg9JQYuJuHsCUYVU5SVxY0WVP8Zstv/TZHTWEwuIMzdHPq0X4jds+UjV?=
 =?us-ascii?Q?i6MAYVob29h89UVevo65xob9Ksav0shWvSCEwIY6FmcXm2RhL7MhKIJ3uAkB?=
 =?us-ascii?Q?AjHbfBtF6YGYyYub/XK3pyrAuQL6uBpIXIMoyFmjc3QPXiiHAwrPcxNE3YAZ?=
 =?us-ascii?Q?QOuzaiFy61se7gncjHTguFjvc3dBXAGBgzePsdlWqMyMAgJNgwJr8XsrlXok?=
 =?us-ascii?Q?cATE1af9riI8azIbt3SK5v2RA11qEqLrn5HVzJ1n6+oz9Kqgd4sKSqQyXh2p?=
 =?us-ascii?Q?ADSNvBkBUYdFBVkf0BirG+zAI0Y/StuaPxDsX1OJQv+0dlKH11hZYi4R2B5z?=
 =?us-ascii?Q?4RhttukzDlTfnDt9rG8ap2x1JKNIdg7yK/cw3Kh+uancja8jlmHJ+VnigVSp?=
 =?us-ascii?Q?AuEWXP75IUGmn/nF9U4D79g16SSE6XFF5c8mOE2ElStQER0gzjRo3YY8jVJi?=
 =?us-ascii?Q?eqE2Rwk+ER9F77Jrieahd2MQrzRb9gj/m1LDSKpOZA6Rqg/ebzAIwxk9d+j2?=
 =?us-ascii?Q?AWM2UvUs0njuyuZEyBNPQZnbM9kmojUAoUSq+SWapQcCp1nFTVwrO1g1BE68?=
 =?us-ascii?Q?+FFnMfqFZMA1cCDoER8x/9P47ipjmTwYLV87WKnU9HpCWYSTv6ecGNIy802K?=
 =?us-ascii?Q?LOG6aHO0qKExmG6vIXUCnlsv3fJlGhsJWkAQipJfe+mh8n4VHJyhBcDPfxMY?=
 =?us-ascii?Q?+lJ34hl+2TCvlfwgs4l1l76S+3O1NUOaisob27SPM+GGFDBsnmQDsT8DHJlr?=
 =?us-ascii?Q?FTXUcRaZHE/1/uwCH0GcKzzZNtn2xmNXoR3BQr+9t5RbB9Vu/nC7WfXRhL/P?=
 =?us-ascii?Q?HNfSNSPulo53/ILQZSEwFLpqHUIfBkuNXS9BvetysBf2os9CAiNZvuiTFX5Q?=
 =?us-ascii?Q?qsxu3UIhxCnSZSc/eB7Mwx0zEPGxfEIPs+hWjpFBzCQTObjJeZr/7Hq030Sn?=
 =?us-ascii?Q?YGZzZJ8l5LSFjE0nC/IvPY7elXayuFZ4mp2gnQux7moGRAW82C+jVbWXqBsL?=
 =?us-ascii?Q?0icRMyK2MDLUbtRz94A4MgcHyzzF0+w7dn6xYe8qx2enHT2JoiSlJb64/giR?=
 =?us-ascii?Q?aMmSZNsPZ3fNZyOYcOwvMyo0qOnYujfhAYzBadL4/gbiSUjjrSBIRzS5B620?=
 =?us-ascii?Q?btoIO7RIuw=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	yjK39QWW78LGUbYkRKFfxyX9xeGhEYHcwqS/b0lbfc/MkCevLHW3+CoJGQ05THZhGeyIEALRM88qIR8GbC+T9uculH6beREJ4dCDTTLLTh7UURUKvM0HIyzY7UsOTXKFIfNYq8jAk+mfNzhSPjz4bT7QqCFhiK7LXRSJvcR8yIkcm/zAoIULVGUhJYc3ggmECDc92LtsGopwSdJW/3cIKFiIfMSp/6Uz1QnGU7HC6Cpl2JWwQKTfGQQzOATaaVfOxOY50hvyq06lVMNu0pGqnCTSfzatl3hVrQlRitpF8T/9M7g72D6cADpKEM1p32J1TeCA8hBapiiPwBQqHTQ2Rg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Dj7IagbKRd026zxLiHh5HcZGnhqKl8uKTbH0ZD05u+zt30sqtbpvqJ4YTwUPtN58Wjblh6+mDQCsHrIevfqnDW9uHaemH+7+Xms6oKms+PFO7m/C/nYdNugLi7dHYrnCxJ+2EU2Pb0FPlp/K0WKkeVHoSJQJOm2rMz6on6BSHAOTgSkvOCqV8GeaisXi9YGRxcW4t3Ci3SdOguC4uyxMgAknhwCYEiNy00P2dyfnHyaVCLMfqPArrgpqUZVPSMWpuhkKkZaex3IlQGS+6RaJPmACqrtomtGeDVu3/dmTz1cCtJo/6gh0ASYezaK6R33mPY3S8Ve5m8odVpYJ6lBWapYzIZwHRx8a7sOIA8QxCKimnIBIpGf02a8/ALuC/MiAaVnKw0BHw5lTDh7jwDhMRuumCy+U9zx81spdtaSiA5lpWnN0bFgNQ00Qu8/mTWEGTA3c4rETV4Z+pzLC+O6ZeaEt/z04oqTrzfhi5AOwXN9QPdBFej981bVkrSaXcGSaxwvERZ6HZqnYopIGmsodvRYUzzIItk3JbbrEvc2/5M4ep2H+LDALukWq5faJAtDewyXto8bc5XhFUjoGt6UZS0M/zbRzGy2mY+iiQfHSk2qnrdQ3P03cWpQliVtsaYLL
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45568e01-d590-4dcd-54f6-08df10cd1661
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 12:55:13.9656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7jQSt4UtXX7A3/WuFtZx5HKhwWArhtZvJKzs0jzF7l05si9Z3jmGOY9WQwpjHlSAAQ8bo8DcS98+nmCyJg8nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8007
X-Proofpoint-GUID: w5bhncI4756rp9tDVf8YRY49nYwYe9wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NiBTYWx0ZWRfX+IU1KEciBm1V
 GzKGjSu5ntYq/QUPQ+s+gYQdzzl41pUkCr5jVEuU4ulloVi8dqyHLcQxxr/yoimhVBL2MvUa5TO
 OYf5LDps0yxMHqokiycj1U8jt+jJffnKABaYQyW87rKbfKiMJtx1oN3JwWI8hmcxqR/x1Q8Vjzg
 GZpWXfOqNpT5esv/i7aFwIqTiDiwaTljzBG3KQLcBHUC9TjNg6aEzFY8rHyStUbHLSc9eaLoyuA
 6mK/ULGPszmCXBD34HlVa2IFMz1660HMHejwuxfBChR5NnhyWTfreX5nCcEaAopDK07fVSrVSVs
 Okr4MamnS4ITM+pQhHz5wa3cjzkoW5+6xiGbyxRrwkNW9jERI/hTrK56oS1RxxumADAx82ONxRS
 UKSy4WYMnSmRlemlmu9wN8xy3UwmBVPNk1jeTul1XYWE38olOzBSd9pE352NJdMnSjhNd97LyYH
 YgwtODCyb7RBZ6Sy8KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NiBTYWx0ZWRfX9Em41lidORTg
 UX0UjSzCv+kAShugn1grKABw0PZvIvxRa59kX6Dd5MzmanCB0dktrpy60Itg2kaRpDN8nt8KRSb
 BB6iv/u0kkwvEVhP2OVYzuFYK90Rw1I=
X-Proofpoint-ORIG-GUID: w5bhncI4756rp9tDVf8YRY49nYwYe9wd
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa54bb4 cx=c_pps
 a=3CRHu18DflYqj82tS/m+pw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=-Vs_vnAgWPAzHEljbMoA:9 a=CjuIK1q_8ugA:10
 a=imtL2w1T9PQdu27p:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120186
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB91976FA8F50BB0E0568B0248EABD2DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245702

--_000_DS0PR02MB91976FA8F50BB0E0568B0248EABD2DS0PR02MB9197namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

Thanks for pointing this out. You are right.
The ${var//pattern/replacement} syntax is provided by BusyBox ash only
when CONFIG_ASH_BASH_COMPAT is enabled, so the current patch is not
compatible with minimal BusyBox configurations.
I will rework the character replacement using POSIX-compatible shell
parameter expansion and send a v2 patch. I will also test it with
CONFIG_ASH_BASH_COMPAT disabled.

Regards,
Wenwen

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Saturday, September 12, 2026 2:56
To: Wenwen Fu <wenwfu@qti.qualcomm.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] initramfs-framework: avoid processes when pa=
rsing cmdline

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

On Fri Sep 11, 2026 at 5:14 PM CEST, Wenwen Fu via lists.openembedded.org w=
rote:
> Use shell parameter expansion rather than external cut and sed commands
> while parsing kernel command-line parameters in the initramfs.
>
> On the target initramfs, 100 command-line parser runs took 13.48 s
> before this change and 0.51 s afterwards. This reduces the per-run
> cost from 134.8 ms to 5.1 ms.
>
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/init | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/m=
eta/recipes-core/initrdscripts/initramfs-framework/init
> index 67590ad765..62d8ccfd0c 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> @@ -104,13 +104,14 @@ for p in `cat /proc/cmdline`; do
>               continue
>       fi
>
> -     opt=3D`echo $p | cut -d'=3D' -f1`
> -     opt=3D`echo $opt | sed -e 'y/.-/__/'`
> -     if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
> +     key=3D${p%%=3D*}
> +     opt=3D${key//./_}

Hello,

Isn't this only available in busybox if and only if it was compiled
with CONFIG_ASH_BASH_COMPAT? Can you check if that works with more
minimal busybox?

> +     opt=3D${opt//-/_}
> +     if [ "$key" =3D "$p" ]; then
>               # opt parameter
>               eval "bootparam_${opt}=3Dtrue"
>       else
> -             value=3D"`echo $p | cut -d'=3D' -f2-`"      # Option value
> +             value=3D${p#*=3D}   # Option value
>               value_lstripped=3D${value#\"}
>               value_rstripped=3D${value%\"}
>

Regards,
--
Yoann Congal
Smile ECS


--_000_DS0PR02MB91976FA8F50BB0E0568B0248EABD2DS0PR02MB9197namp_
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
<pre class=3D"elementToProof"><div class=3D"elementToProof" style=3D"font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Hello Yoann,</div><div c=
lass=3D"elementToProof" style=3D"white-space: normal; font-family: Aptos, A=
ptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0);"><br></div><div class=3D"elementToProof"=
 style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Cali=
bri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Thanks f=
or pointing this out. You are right.</div><div class=3D"elementToProof" sty=
le=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri,=
 Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">The ${var//p=
attern/replacement} syntax is provided by BusyBox ash only</div><div class=
=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_=
MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(=
0, 0, 0);">when CONFIG_ASH_BASH_COMPAT is enabled, so the current patch is =
not</div><div class=3D"elementToProof" style=3D"white-space: normal; font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">compatible with minimal =
BusyBox configurations.&nbsp;</div><div class=3D"elementToProof" style=3D"f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">I will rework the c=
haracter replacement using POSIX-compatible shell</div><div class=3D"elemen=
tToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServ=
ice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"=
>parameter expansion and send a v2 patch. I will also test it with</div><di=
v class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);">CONFIG_ASH_BASH_COMPAT disabled.&nbsp;</div><div class=3D=
"elementToProof" style=3D"white-space: normal; font-family: Aptos, Aptos_Em=
beddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);"><br></div><div class=3D"elementToProof" style=
=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Regards,</div>=
<div class=3D"elementToProof" style=3D"white-space: pre; font-family: Aptos=
, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0);">Wenwen&nbsp;</div></pre>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Saturday, September 12, 2026 2:56<br>
<b>To:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] initramfs-framework: avoid processes =
when parsing cmdline</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">WARNING: This email originated from outside of Qua=
lcomm. Please be wary of any links or attachments, and do not enable macros=
.<br>
<br>
On Fri Sep 11, 2026 at 5:14 PM CEST, Wenwen Fu via lists.openembedded.org w=
rote:<br>
&gt; Use shell parameter expansion rather than external cut and sed command=
s<br>
&gt; while parsing kernel command-line parameters in the initramfs.<br>
&gt;<br>
&gt; On the target initramfs, 100 command-line parser runs took 13.48 s<br>
&gt; before this change and 0.51 s afterwards. This reduces the per-run<br>
&gt; cost from 134.8 ms to 5.1 ms.<br>
&gt;<br>
&gt; Signed-off-by: Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/initrdscripts/initramfs-framework/init | 9 +++=
++----<br>
&gt;&nbsp; 1 file changed, 5 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init =
b/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
&gt; index 67590ad765..62d8ccfd0c 100755<br>
&gt; --- a/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
&gt; +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
&gt; @@ -104,13 +104,14 @@ for p in `cat /proc/cmdline`; do<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; continue<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; opt=3D`echo $p | cut -d'=3D' -f1`<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; opt=3D`echo $opt | sed -e 'y/.-/__/'`<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;`echo $p | cut -d'=3D' -f1`&quot;=
 =3D &quot;$p&quot; ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; key=3D${p%%=3D*}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; opt=3D${key//./_}<br>
<br>
Hello,<br>
<br>
Isn't this only available in busybox if and only if it was compiled<br>
with CONFIG_ASH_BASH_COMPAT? Can you check if that works with more<br>
minimal busybox?<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; opt=3D${opt//-/_}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;$key&quot; =3D &quot;$p&quot; ]; =
then<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; # opt parameter<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; eval &quot;bootparam_${opt}=3Dtrue&quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; value=3D&quot;`echo $p | cut -d'=3D' -f2-`&quot;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; # Option value<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; value=3D${p#*=3D}&nbsp;&nbsp; # Option value<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; value_lstripped=3D${value#\&quot;}<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; value_rstripped=3D${value%\&quot;}<br>
&gt;<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR02MB91976FA8F50BB0E0568B0248EABD2DS0PR02MB9197namp_--

