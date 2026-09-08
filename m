Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E076C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:40:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8102.1788875994139239945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 06:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PqSh+OtK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ClBlw3574213
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 13:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2mMO4uMqavvl/NVvjPz7JwN
	rwHxkig8Jk2n+bIvtnU=; b=PqSh+OtKfxk000nLeowhNVEOY4K+mpc3CeMEvJPI
	pW/4gusS5JvStX1on6PoLPeb8YukjylpLXAulmgK5ezKNEz/Y0tMQ8GycR0dJCmR
	j4s2+Oy0dFtx6q4nzJ+5xqgbHGwJzi1oFcU77p5XZwJDEO+bIcnXVoI8sSR1hA1q
	3URnoYYJO4mz9BUYQobVAxqDuhwjf+9MMnlvcBWVqurU9xBITTXnBs5dZZP/tBSz
	VmMcrQ5rgCctAQStWNtRe0OidKzOx5G30nSV68HMD5cFfBrKuvQZZ6TYqB7jotBx
	ruC6mkePYi+SIJ1OMr+zZoXmdUixKdhXszRFR4qcaEwEIQ==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.74])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp491qc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 13:59:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyQc6YlknTTtg0TOJoyxzSFmnROteYCZQ27SFvG1jpjAi2YLxPlw9SyzwZZCX5D9zEIU2fRPNVJsjFDqhDWOFs68CYnqN25P2CyfEtI55+R6EfRKG62/ncs7Kbm9NIVvxStgK14ba5t5ihD/3toRjFpxHaod9xp17jPCwDNMpOM/RtMc8YxkDCzMMd2ShPYoPbHyENh/aGFh/yn1/j4pX+5kvK9Zop1LGu6bZ3gH6GwMXvJXDVVnx0Gg6XGZnT9aCCebE3xR308ETQVI1PlmruuG5VIR2Kc33Lq2q95LS/b2DV4+Qje1pBhOKnfcv1VGRouszVAbPgI3Qz1uO7VORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2mMO4uMqavvl/NVvjPz7JwNrwHxkig8Jk2n+bIvtnU=;
 b=YJiGV12kqhDRUEvuClNn7PAG82wu3VYcso04P0WLFv2e7GtxmGpIjCzUidB4jFJYNx1VOxcNC1ryacPAnklSpYYZsVkaj/3bJ3GAUYzRyQLrYgw2m9tfCMSUTJdbDZanJWVaywqJofiAP2WLmCVGwhf7yv2vxXGDH9+UQZpQTmWYsdHvN0EeKwH41hSZZAP3vrwVvnl6FLjGf1Dqf7Kv1doPIbLck5qALJNaNl+Tfnbffgm0kIgiaxDaOkbZv9TR832vhrKVsnOhPTauKcWyQYAGQkfQyqvdbWaST+7ana0EXNHOBXUP3/5zJpHs9WrLB5QzmZZaPiJbD9RRh8Os8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 SJ0PR02MB7503.namprd02.prod.outlook.com (2603:10b6:a03:299::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 13:59:23 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 13:59:23 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] initramfs-framework: support LABEL with root-only udev trigger
Thread-Topic: [OE-core] [PATCH v3] initramfs-framework: support LABEL with
 root-only udev trigger
Thread-Index: AQHdNvikgVzyYzTxtkKHUA/UUKqfCrbEld0AgAAuyF8=
Date: Tue, 8 Sep 2026 13:59:23 +0000
Message-ID: 
 <DS0PR02MB919798F1F504658B787A200EEAB12@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260828142121.84508-1-wenwfu@qti.qualcomm.com>
 <FD9EE9E8-BD86-423B-92E6-2CF074B387E2@arm.com>
In-Reply-To: <FD9EE9E8-BD86-423B-92E6-2CF074B387E2@arm.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|SJ0PR02MB7503:EE_
x-ms-office365-filtering-correlation-id: fda82d77-daca-4c30-2db5-08df0db16336
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|8096899003|10067099003;
x-microsoft-antispam-message-info: 
 HKrJtvolDODPJ3KN4PuHYTXoQm6Mj/O1Lo2azyHH8XPeFD84a3pIykb+ujMZ6BZ5JRlFAGoIf9MJeuxB7Re62moiVvDlUQD8NjOzebGEoHs0SGpDOf1cx57YzZrJnCC2ZzqYDKFRSU7bxDIFffd3ZmgFy8Pq5Oa5olLZH9Kf697TLexIOhL9MdydqqC6tY6FThcL7zvwiJPmfmW6/cgrGCNBgT9lmUtKvtw3vUBKFPBVFTtbnIjlaC+CGP5tv8LpP4/QL3UYm5VqafKOy7K4nZ/lYRA9nqQJz016PkTWF8kt5HkPJFy0xrHT5dW86l3PYQBaICpVh/vjDhgVJJ4F60iDNj3oosnCmmyL+Pm75Dh0z1/0ZGEqyYNUjJMKXv9Vv2WqwpmhIheIimT06CY4yYqAnd1Ne/sXBgOBSMnnGWUNLwEr/MAzRGZ2JfIJCtuSfpEQivfJWSwmk56JSV5AxQaPZlTHWDTL+V4yNBFWrKN3qx+llfV5D61CQ2irl9k1HqQVWOhpWot5vrhi0HVzHemt01qTZqWAlw5ocK+4JQ/Uwv6eGKt4ncTv5ApS4Cg52rpYrNeM5uUvE2aKELjXPPQ6dJtaB1jt8IUO+7LCxAMhLNtfoBnSNmzWF4qIHHkQO1FT2WlUmUUhG4q15u0kuhibwwZ2v/bvx8qYfVUkGLWZroBRxx5TX1kG16raAQR5wEgM3WAuNbXEpusuboKARNLDFoqPgF0jvGArc/2rm1Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(8096899003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?yKEqJPTDbA6felD6Tm71sqMAbk00uamjfMGRrH34tQEHbRoRvdkT/Bvl?=
 =?Windows-1252?Q?yvOUM+XvhMkHqDuVqM0Pw2emrYsmybBz2V+fX7fDGuNaZzwpkHb69DG/?=
 =?Windows-1252?Q?sSYxMeUqQIJn6FCnHICG4hZuIZKfU4JDkWKKzUgc7rVfmzA2sLwYAUpQ?=
 =?Windows-1252?Q?9yNwsVnfbyQoBA49WyhuqQ7JZPiimQuUsERIp4KjX+2xv4aZhGVZtLW3?=
 =?Windows-1252?Q?xB2wHotDC8HwVlNv29ILFJW7s4dtQN4BUVBRrVpKv1lOXBVqtK83NVsz?=
 =?Windows-1252?Q?qWLXRIULr+pBV17elBPmcfDRcDFzSqwkfkHlXBnpsL0H+kOiTwBceWeI?=
 =?Windows-1252?Q?cqo+QEz5gwHP0cidsjmUZ2Jtu9M49JHDVGuiuJ5SmsnifSAoUoz9U18S?=
 =?Windows-1252?Q?4MgRORZP/gAm7vEAN+pSHERmCLLgFt7/4MZZ8U3e5ry3DrQ4e7CZVr2k?=
 =?Windows-1252?Q?MJL18l+M31r+Lit2BxrU/n/xCHhEEAN+ymPob1K48SathLulQWm21jZx?=
 =?Windows-1252?Q?UZ6AGjYkmnGi6y3kwR5uLnYuKGzcvtyBieuyRlO3kaaI0jHUkbPnJDtg?=
 =?Windows-1252?Q?U2UnWtuRnSUb/TYlJk+gCabn7EB8ajSzLB/hMycuHFOLCh6jx6irS+5n?=
 =?Windows-1252?Q?zR0WEdxP7CLtgrZ4S6L8G7XMHgyPudv2rMjCaIglLINaLxVsUcXTsoDu?=
 =?Windows-1252?Q?bpuGmh78QKheV4J8Ch5R5Lxo2bGxtsHU0T2QiNxFY/hDQyNSkMi0zw2N?=
 =?Windows-1252?Q?/qbGAsCbLIqQuAgsVYv++FaF0h1ZvANW26/grj2SJiG3Ud4SyyG0GMks?=
 =?Windows-1252?Q?KR+x2qgEzVuqOVea6mIeRp/LdADc+XK2QZ/obFlr2EenOsecivSh1OYr?=
 =?Windows-1252?Q?vGoQfS1r0tzXYK2gwtZxcz8KbrFWUWgTjYPpTJy/FcQSzP9GkYBi421n?=
 =?Windows-1252?Q?YhjqsYiWDpWlnKgzjXliNWNOvt9NAUuaRjbqJRY7MypfnNfLPb/7WG5l?=
 =?Windows-1252?Q?99Q0zuyTzX7+d4YCWU06ZHYxzC985lZFNFIU04JRhEZzd/uZfRwaXYUA?=
 =?Windows-1252?Q?rDNYBC79yxZ9lJPGJtEV8rTPO4gfIexD3+gCbGSdazxm/RJhg58uw3XH?=
 =?Windows-1252?Q?czgSeYdWEnaEIqqlp13g4PhFBLZvIdHrFDMhPM+Zdss8LzsT+UFt882M?=
 =?Windows-1252?Q?+0vIlzg467TDT6XN/Rwg6oX+SrLIE4WsaK1MlClvEChf+ZRmhycQmbT2?=
 =?Windows-1252?Q?Mr9TUgaiLb6QNsKmi1q5Y2VVzY6bTFaJOn5HtvoAp64qQIWGzbwTgaFI?=
 =?Windows-1252?Q?4k1IJxDmGnTbwPduHQOpI+YMnmRcRMdQfRPA2Mn2oiE3/VRpkaIzPVYV?=
 =?Windows-1252?Q?z6YeYVkgT0fixzWnr+ptveIOYSjdw90OyJpo5EplWAGG/XyvImaWZM6y?=
 =?Windows-1252?Q?nsrooeyj8KMNSbrd5Gk8oah53cZsa5r8Jb9tua84q0hllPhuFGX7RmX5?=
 =?Windows-1252?Q?UJOkWX8kF4jBXDsvd3DzCtZiYvCrPqW2mivM+0q41rBJqa7vjIU1r0o3?=
 =?Windows-1252?Q?M654P4kuWoZ/Jn4nIzTL8y94/fg1hjWXnLcDEmWCr6VA9YTQIhQcQreY?=
 =?Windows-1252?Q?J6ow4lGsEx1WRxcFL3B2TPPKwK1TR5ULF2NVIVlLlRfmrGmRGR8PIFnY?=
 =?Windows-1252?Q?E2CaqwrUpXBNLCFzUKz9lNcakBktO4dKrRl7rn9dQqAngIQ/PyLMtRU7?=
 =?Windows-1252?Q?HSlDoghgV5AS82G4z/v/xGSJv2A3jQQosHI1SiQGOrTMViU9GXoVmU12?=
 =?Windows-1252?Q?e7eHaGyaXBuZEqjLHXKfln6lQxizGNZBCAc4xLYa346SlE0OY558DcGJ?=
 =?Windows-1252?Q?3EjOcuRmS6mp5g=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	w6I1+yLSLKQKKI0ancR06tZle0ZP9pZR0mxzdVuW7jhENsbDeboBgccKPXblp60X23f9NEcJn0s6t5k53RqNlLcnbHPQYGaAVUug7Y6wyTRSrK26NoYAoT5TKBOuJsVxcLhfNwOtoHtyYUW8A73H0mp4YioPSi6onWLbLpjjY+VKvV1oj9z2iQPh8S+X4xJNQcS2xu+0Pi2jhS/OEj+XAFUaBz5k1sOY282MWDzteOaMHU9l338MxkrsiL4BALCVTmB+YFuZt2vlp1Vbo86LvbZwA8Jp6i3LIVlKbZ0qpwRPe0tuMC55FRvOZDek3yNf6nSOM9TrfpvskGFIqp5uBw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cEZamGy3H/58HchPX+W7SC/DCa7F8HekoBnU1M0i9mwDJuBxSXsd+vn/TEEienKYSQXUnvG7xdFHDezCAefVnBySU3McAcOz7RFy2JxW31hPpyrkqEW907GJjTnbx59TlhHmqNWeoeoQfGRA+U8ZvqzhGkKI9c1sIDlSzLmVC8qA3LrqVkAtVdxHb+haHHFhJNNbA7JvK2fYBmgScTMShP4nP28AcLI8O18HnBkaHgvkZXtvWxwx985FkHjrIYHC55Mt6wAvmbmL3BjN0iIAZ+YCUMT3nfFP3V/gav/RIaUbR1ZKDEU2To9v79aEGGz/C0AzuT6si+Pjzop8elgJAQoQckXbqYtMS7fY0wBhqytfmYtjGQFckSDT4eYvnC6ODcnyKL+3ykA81xAHmNPkhyysQGv5VvhtUw+G7zqA2HvWGqrVYQTj4J8ygd/NK6Bjfe/xLFHnaS8o88D1qxGnpVnmdvYv60FRoP8H7sulkRrhqxRAuztPJzO6EcY/5ufxGcquMSbnYvj23aMZj5+9Bygsw2oV5XzggB2T2yvbGz08U4bzEI1JvnlyDExoB/m95wTWHeHUahGP3jMqwHUhPjYHqgwcxpuXguTWjrx3yLA2msgVb/y481ETZ/c4Y+eO
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda82d77-daca-4c30-2db5-08df0db16336
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 13:59:23.4446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w5/csvhG43d+3a5iKlE5BQ0mW4cInT5eGnIfWEmEpna66uK/oTIxbCbyAeNP04mbisjfTkfhe9/oaa3OAeReUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7503
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa014d8 cx=c_pps
 a=1w3Rox83O5gulhrCDwffwQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=wqpFU2cotyTpk2kAJP4A:9
 a=pILNOxqGKmIA:10 a=9aiI34h1YM8OaWvL:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: bAsfnAZkpkDxPQSfq0k8FFQgIOR5TgCH
X-Proofpoint-GUID: bAsfnAZkpkDxPQSfq0k8FFQgIOR5TgCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MCBTYWx0ZWRfX68ok4o3KKAbZ
 S5ztED0hPRCWprDRhr/XDvVwmN7YrFFrtb8SL209fYXnCbHoY3siyS0+wt4tArDTW1NAaUL6Vif
 xY2f1ZrL3P4QYZgTFaAmiz7pP/pzrnNKDTmw5kL2w+gvASC5ODutki6IUkZ85NaM7qYJTztyMNL
 FIFRpA+13Tt7uyyYLL4yIygnma1pVrbxk80lGBOQJdWURybo6bP3XgUGc3nQtrhqFgctPBaGs22
 +TZXo7iCUM4RxR3DAdmFKOTpw80CHR2/R6UKJVKEXgd3ssEu7oObt4SHWpWXjRYDZhOhRZRD4Ck
 5/vkwLuHH0aVTn9VpiPu8v8acv6nki96UDKFofS1qmhbxPQ6Gckei6H++/J4JoExKZhzGTEX1Tp
 vflZHyAYV7cTpdltSk4/IwYd/qYrgm//QdPqDLln8qurEzVCC/JuKUN+4Uil4Q7C8/b4r+I7yrp
 4otsxTxvAQkQJtQgsSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MCBTYWx0ZWRfX34DYZkvkE1R9
 I3PwpNF8CwgFde17zP09EA6ZkYCm0saAbE4tO9UuF+AwdeSeBpnZFvtt2sgpOyk3PVGJLZEEzwl
 cKKAsa3h930wDJN3srN5y63ZQnM0vFU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080150
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB919798F1F504658B787A200EEAB12DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245371

--_000_DS0PR02MB919798F1F504658B787A200EEAB12DS0PR02MB9197namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Ross,


Yes, I have already tested the v1 implementation with BusyBox findfs,
and it works correctly for root=3DLABEL=3D with the root-only udev trigger

The v1 implementation also provides better boot performance in my
testing. The root-only trigger is the main source of the improvement,
while using BusyBox findfs avoids the additional util-linux dependency.
The BusyBox binary size increase is only 464 bytes.

So, I agree that enabling CONFIG_FINDFS in BusyBox and switching
initramfs back to the BusyBox implementation is preferable. I will send
a follow-up patch to make that change.

  Thanks,
  Wenwen

________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Tuesday, September 8, 2026 19:05
To: Wenwen Fu <wenwfu@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH v3] initramfs-framework: support LABEL with r=
oot-only udev trigger

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi.

> On 28 Aug 2026, at 15:21, Wenwen Fu via lists.openembedded.org <wenwfu=3D=
qti.qualcomm.com@lists.openembedded.org> wrote:
> Keeping findfs out of the BusyBox defconfig avoids increasing BusyBox for=
 unrelated users.

We=92ve merged this patch but can you confirm that the v1 you sent which us=
es busybox works just as well as the util-linux version?

I=92ve done a build with findfs enabled in busybox and the increase in bina=
ry size is negligible, going from 71176 bytes to 71640, an increase of just=
 464 bytes.  I think we should enable this and switch the initramfs back to=
 busybox by default.

Ross

--_000_DS0PR02MB919798F1F504658B787A200EEAB12DS0PR02MB9197namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Ross,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<pre class=3D"elementToProof"><div class=3D"elementToProof" style=3D"font-f=
amily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, =
sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Yes, I have already test=
ed the v1 implementation with BusyBox findfs,</div><div class=3D"elementToP=
roof" style=3D"white-space: normal; font-family: Aptos, Aptos_EmbeddedFont,=
 Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; colo=
r: rgb(0, 0, 0);">and it works correctly for root=3DLABEL=3D with the root-=
only udev trigger</div><div class=3D"elementToProof" style=3D"white-space: =
normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibr=
i, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><br></div>=
<div class=3D"elementToProof" style=3D"white-space: normal; font-family: Ap=
tos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-seri=
f; font-size: 12pt; color: rgb(0, 0, 0);">The v1 implementation also provid=
es better boot performance in my</div><div class=3D"elementToProof" style=
=3D"white-space: normal; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFo=
ntService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);">testing. The root-only trigger is the main source of the improvement=
,</div><div class=3D"elementToProof" style=3D"white-space: normal; font-fam=
ily: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sa=
ns-serif; font-size: 12pt; color: rgb(0, 0, 0);">while using BusyBox findfs=
 avoids the additional util-linux dependency.</div><div class=3D"elementToP=
roof" style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">The=
 BusyBox binary size increase is only 464 bytes.</div><div class=3D"element=
ToProof" style=3D"white-space: normal; font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);"><br></div><div class=3D"elementToProof" style=3D"font-=
family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica,=
 sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">So, I agree that enabli=
ng CONFIG_FINDFS in BusyBox and switching&nbsp;</div><div class=3D"elementT=
oProof" style=3D"white-space: normal; font-family: Aptos, Aptos_EmbeddedFon=
t, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">initramfs back to the BusyBox implementation is prefera=
ble. I will send</div><div class=3D"elementToProof" style=3D"white-space: p=
re; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">a follow-up pa=
tch to make that change.&nbsp;</div></pre>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; Wenwen&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Tuesday, September 8, 2026 19:05<br>
<b>To:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v3] initramfs-framework: support LABEL=
 with root-only udev trigger</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">WARNING: This email originated from outside of Qua=
lcomm. Please be wary of any links or attachments, and do not enable macros=
.<br>
<br>
Hi.<br>
<br>
&gt; On 28 Aug 2026, at 15:21, Wenwen Fu via lists.openembedded.org &lt;wen=
wfu=3Dqti.qualcomm.com@lists.openembedded.org&gt; wrote:<br>
&gt; Keeping findfs out of the BusyBox defconfig avoids increasing BusyBox =
for unrelated users.<br>
<br>
We=92ve merged this patch but can you confirm that the v1 you sent which us=
es busybox works just as well as the util-linux version?<br>
<br>
I=92ve done a build with findfs enabled in busybox and the increase in bina=
ry size is negligible, going from 71176 bytes to 71640, an increase of just=
 464 bytes.&nbsp; I think we should enable this and switch the initramfs ba=
ck to busybox by default.<br>
<br>
Ross<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR02MB919798F1F504658B787A200EEAB12DS0PR02MB9197namp_--

