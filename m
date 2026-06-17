Return-Path: <tdarote@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF40CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:13:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9311.1781676800767949302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 23:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eG7JMlpF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: tdarote@qti.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLUKbA149710
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UOuRxECFcCeiA/sDFwqWxbQT
	GsR3bARNhNV2kQznsjE=; b=eG7JMlpFy6HeXireyAVfTbV91agdsJmg+Pp9KiA1
	Luv3VjvIQDIQF7zMXZ0kmzKk/DcZ1lY/Jk552HbCGfy6STOptJKSUD4kZcJmpdTM
	+Wn+X0si8iiRAaHzkgvqAuL6Zgf4U0Yt3Qj56R39vlbdvj/5cR9No+n4G2MlaNfm
	+DeGkwkViTqKHI3EHlZ//tU7vCSlw1ZVadmzTq7iz4NRJ97+EhB90LjvqPWEFyuV
	tMhsXy3ZGycfzfdQqrdUaea881B/ZwgamCeV5rqaSN1UWordC/cLjKDLcvxWp1+6
	B1olQjxu4rnJyi6RB3QFbVvNXXCnCx9XyZEeAiEcvKIthA==
Received: from cy3pr08cu001.outbound.protection.outlook.com (mail-cy3pr08cu00105.outbound.protection.outlook.com [40.93.6.109])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef21n88-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:13:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbKx6ulNoncevVCjNRY5vNJDgiqyLjqRCtDvhetKUN94M1R90UjW/9bN28xTYRb5UIk0Px4mBj0gZSnSxPS9L0tdvXzqG7x2HOaMvfch6zJ5E+gfCAf6QC3aSfsNMtdrOcDneVLakA8XOV/nxeNkjXvB7C3CrCoOR/3HeU2E+wWuokYPdwOa8d/L1bXl1W0/P+sVJVrmPC14uh4Q3M+RYZcgorDrSTn4v0mA5ZgzQa72ml42TKSzdhaXFjI2TljI7gnlRloxYelUQvfabz14/8ekZWizJMncvMLdULMlUE9GT73BbaVxmuO8LDcT2YVnKvKIanmqJolMAD0LOUAkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOuRxECFcCeiA/sDFwqWxbQTGsR3bARNhNV2kQznsjE=;
 b=BE957lYnGXtDo5CPcnpqVpXzRw9EFm/MtOCfMZ8ZDD4jtxk1uidWTNvvbL64vTIEAb3VlFNDbqEyP188xXEqtDQG9Bkrg+SDHKoQAWhCvQhGmpOjwpW+ksere4/emZGNrMlLlwKjduFRwkshaeCbzcSbGzlLBDtiqVJ2R+5ET677vHk+m/fttv9fQfdzuLdTlDm1HTLKwuRdCu6J6OPoIM7YGTccw4eVKs0hhIJwgb2JwYAQdnapatq/7oXwrcXj3VpNS6UdF5MN9mCK1k0uFps6ZAV+ncIsp2QKyaphp5kDRjwthXkFF8YQ07ZYx4UgsERKs9CN5BP9CQTvVifNlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB11317.namprd02.prod.outlook.com (2603:10b6:510:38e::6)
 by MW4PR02MB7394.namprd02.prod.outlook.com (2603:10b6:303:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 06:13:17 +0000
Received: from PH0PR02MB11317.namprd02.prod.outlook.com
 ([fe80::132b:f38f:9b47:86a]) by PH0PR02MB11317.namprd02.prod.outlook.com
 ([fe80::132b:f38f:9b47:86a%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 06:13:17 +0000
From: Tushar Darote <tdarote@qti.qualcomm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in wl_shm
 buffer creation
Thread-Topic: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in
 wl_shm buffer creation
Thread-Index: AQHc90a+W14jWSI8ZU2S4h/hNU78ZrY0oVZFgA2s4Hg=
Date: Wed, 17 Jun 2026 06:13:17 +0000
Message-ID: 
 <PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42@PH0PR02MB11317.namprd02.prod.outlook.com>
References: <20260608125956.3297942-1-tdarote@qti.qualcomm.com>
 <PH0PR02MB113174F1DADB824C840153CD48F1C2@PH0PR02MB11317.namprd02.prod.outlook.com>
In-Reply-To: 
 <PH0PR02MB113174F1DADB824C840153CD48F1C2@PH0PR02MB11317.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB11317:EE_|MW4PR02MB7394:EE_
x-ms-office365-filtering-correlation-id: 68346c71-c9c2-4834-087d-08decc3785ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|4143699003|5023799004|22082099003|18002099003|3023799007|6133799003|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 qCP2h5PNyg4TRjglZ3JuMCxpceTg6+M79XDwe+aZMJfjKZV07oLm/u5QfZQ2duUF3ZaESL/aSAGumw/gCtI50ah4Ws9wdJfbWE9HNG1Y/dytBTr2QhwFU8P7qQWCa+7TUijlx+vLwn/jsNkEd0dl8s+Hxg9gQvwSYB+iDYguhfITLBTc/MuLNoj+LjvoXtFBg1S3Nj8kN3f1LQ4K05v6bMS5rIwY9q+MKgVJL1BQ8tCANk4XxeKvvOHAEyCgJjQD4ozdERPdaubZnw5l/3z60M4w+0s2KlHFGw6nQsGpSBD8fZ+VAoxKcbhw9n4ddvNMBJLqDRAXPa+r4T7kiZTXykXNrbv4GMM6CmG+Z1Ls8pRFe4DGWC/mUXBxImMWmOy9sw9tXYcgUA2kIL3zWoakgqmwt/KahE6YxxPaWrGSqLKqqQjNqjj4Tvh6iQJ+dcmFf0kAFX+zo08aweRP9UOJvgFu664zImPDw5ulazm8vdrERfsMaF7flx8PmLT/SjvNBC9KWQECZ7o+gfh1aH6eybX72MyhVMzGXhg4PRxwWEwsww2Oaox+TFRKCxJolG5AYkRsIeMq7pQgWArgFTTDnxIT6YeJfRCYTiH9ckMPkXYpiWunpUp6XGZgKBeEBcCMke8C3nV0Doddg2YAj6AeAe6WqnnBStiecXCmCW8+i8eDww9vbuQMxnigHX+djLk5ZB4O2AmZCQyy6z6RSJ6FWg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB11317.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003)(3023799007)(6133799003)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Nz9FQjMT42SXheA9obqTBEgmuu0r5/50MvLPheMHvKpKENbqMgO6o0YFCfQS?=
 =?us-ascii?Q?JgNBiuTlajjcE8g2z00/gn2aVLyR9cdMHlItnXjietVthytkgSljGDCIbN4T?=
 =?us-ascii?Q?pBvBWqfUkDbkGznxc5/k8f8V+Y6zRjMIsosKoR0SmDx/YMkmNOjcxgm9YiQc?=
 =?us-ascii?Q?psJY7Fde/a89XzHqQU+A1UgNxn5y762PheiRiMD6Wbnafo+0SpMJib81P1Nz?=
 =?us-ascii?Q?voN23/9JFrCwTsbh3FZDIdce7ySL/1sKO2hnd7Ku8NOtlzfbgjK/5WgmkWri?=
 =?us-ascii?Q?mwSnUH2KwdlThcbUDnzgYyuivWlQWWKL1tkYlUiImsasbP8lZd5XYe+rpt8P?=
 =?us-ascii?Q?AwK0xZl6pS91ulz1QX2fMiFlsHupXNQWtYnB2LFVY0GhF8uO3nE0uzU7e8YV?=
 =?us-ascii?Q?s6xgNoyAyEbWFhxGjMnGD0ptBSwbZBIgSpnYSIhszabLh2hKwUqeYgfL0ksI?=
 =?us-ascii?Q?uLlDmnai0tVcVrEDnKmR5VsTJ8H5T9tYhdTzRu0Y7sSirHAkC4xejdojw9y5?=
 =?us-ascii?Q?hAPr8cSuzI1P3BGAZ9vorfWQXRRO8q8ercmNVZNHpzNUCTVuaZZiWDdF3zjH?=
 =?us-ascii?Q?K9jRUi6xQszcdKWUoCysmJlOzXK5vfIZwJF0EVN0aenFTMVU5P7RSHkCTOzy?=
 =?us-ascii?Q?d+TPNmEBzGZtOmZsBlFlV9dlyyq5YLNGNIeQn8pa2OufkSQviBWimAPal6fX?=
 =?us-ascii?Q?ojay9JCOze2agzDcLms+Z+cJqukLJCq0Sxb3T/TAjHmvgqDDvgjqzh8ce0G3?=
 =?us-ascii?Q?3h0kZNGcuqSJ1GRJTl70bwTpbXfHlWDx8cFzRlFs/9n5rXMpnUq9k5NWejgR?=
 =?us-ascii?Q?arzgKv3Yb+RMdb3tHoccWwPLtiFr9AO8PsYxnEMNu2emuvudT3mXAJK624iX?=
 =?us-ascii?Q?kgHioLsr1/o1daBNEhWfmFSEv+0n1VLf2+vWzulhAxga2PjGtSZhpffFWhO0?=
 =?us-ascii?Q?7P6/Av618mVoZoBKpV3x7OqCDf2zVylhAUNIcTec+Ut82IFx02cvCtu4iXX4?=
 =?us-ascii?Q?7pM6jv54pnHdGhzEW63y/ZFslF4zAJJernLbD2t8DbpT2BLFwg4blT+joVmT?=
 =?us-ascii?Q?tr4zQA74C55A0tXpTjUR7MqzeU+NcTjOc5G1so6FVeW5w+dJcvaUPoCtmOkp?=
 =?us-ascii?Q?jAKvlaytpVB2ssIiW43c2IzEbvvJdvEEG2ci4Lv+6lJcuoNFBcQf4UuEFTxi?=
 =?us-ascii?Q?tzt7H3nVnvxhMauP73jv7abWmFkmR03g+x39jXCJL2RXrLT4qTCzVQtMhmkN?=
 =?us-ascii?Q?XNzmYwqrNQ/Ly67Nx6pZaMGl9WPg15yV7PO80KoA1B2jIE06AVBrtIOrFI74?=
 =?us-ascii?Q?1QWBlPkbYYlTbUqJZjqcYuf5U9hG4OFDalzHlgu+rIt2OwotVvvN4rkV+jZ4?=
 =?us-ascii?Q?uKNNhJl2Q3m6kgJfErcJfBYiZcO/LiTQL6aZAhT3NA4WqQj1/veE8CFR1hCo?=
 =?us-ascii?Q?X4+P678quAKTusSRsRBuahbFObzVqeFugV3wW2UeMFPBNrJSKZLyYtLb7Apr?=
 =?us-ascii?Q?3u4W67hC3g83zA0Eq+bNGn9UTOXeJnkSJkdHJSLOrNMEFRajLeJyjxo0od+S?=
 =?us-ascii?Q?p6V/1tXLHHvJzZQWtEBpfIayqEXRYEW0plvuFKBvIkf/35b6Mf3NddcwYcoH?=
 =?us-ascii?Q?xpcBGdw7p0PhbG1tw298Ix2s1rOFVJ0CgLTgTJTOEpjZYU97jqnNHYuOvlxB?=
 =?us-ascii?Q?VlohfDF/PldQ7AUYEfL19j2K867giWLNvWJqbOUXgFmX3pmeULeSGZmX4xnu?=
 =?us-ascii?Q?Jc5tlPnibQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42PH0PR02MB11317na_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	NKO86iJmJghigGf6b8bF7mkxRFdz6ZEbNXzs9U9eGMTNp1f5AGBzNaIQttym0PBi617QDciF8TIHQnzd5rC6k6eTlH3w3V1Rjwx1xcfTS9kEkw8EkOlSmHUzjfwBLqp2rZrrcuRcOQXQPFdXVrO74UT3GKrniaSQ2BF0RM7KLTqMRAXnaAGlqS9bmU7b6a83jFRIvTTsi2UACtXqWmWBeghd7U6DNTUfM/EEGB+NGAvVJ9THh/s7W6ZEZjHKJCmXAT75MBBuyeuxAhCnGbRxxsmCnVCSzXY/aIWf3C8kia4ZqSH72jX+fTzTEtQuMjbHkMcdp822B9YzTlofp2ypoA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Krllc1lgFdeYPFKJxcQzp8vCPU8n6mc1EQsIPNxpindLjH9VLwj7loDdiH0BLXAzbmA/dV0JKJFXd6S4oBMjiZ4gVzkYF+HSKCazfX7x4EjWS8usxIjRJ9cXYGG5Pbde8XaMjxQXqvue7BgR33TdSzFx9+ZtE9mRQjPeYzYhCD3YObBuZCdr+Z04sbNm941kyGU15voBMBrDCcGbuCUu5P1zWJAHqTXTegYEHHSivYZkrGG26szun+YJkm6LmH7qWHjXLMsJkm0heOBEcpRJ7t3EQb8UMd1u7pJ9z0yWh8z2IFZyaFL/rBAnzm48sM5tfh5AC3RHQRG2OphRgnL+9+gGlokr+2Cjyr8HanAeB3pZTpmIXm4GptFXxXw7qW5vjnNxrrPpNvZaauJdeJuTCUZmMfwTroeruuFPgDxaxtX5jly4u4aTxLQLDJ6TlOmUouUsjvCXLw0nUxRKONGE9mbkiJFv3jZCNMpgKxghm0gwYcnXFcuGCEK8RWY0TibHdENuF0k/XPWMC+U3F0BoGcAMJCnqBc+yvpKPvqy7ILT1YozhKwfP71Vky/LBQl1suMEQuq2J/pyvpkruXsPzL+xat6miROLUzKCwd6oEXjzjgS8RjbuzxObGRlEyu7nT
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB11317.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68346c71-c9c2-4834-087d-08decc3785ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 06:13:17.0785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8/sXV7dkRmMF8OvBrQ22pSXlXtex3pSbNdoUnNA1J3Nk+9ITKEmhJhH7gfCd3Xs6FHN5K29U7/FD4+HC+XmvVWwScV+jzKqxOt5AP/gQaM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7394
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA1NiBTYWx0ZWRfX0XWQrAJmmaXt
 AvAldaNOOwuqXHkzqdI81HRL+2T2uthyTFE9v1tmMIXKseKXvfobdrXAxT2Cu8C2O4PUFM/nCLR
 kIuOUKu3ILXQb80CzJxQnosrbiX8Kh0=
X-Proofpoint-ORIG-GUID: 3XYutzfTzUjm7jZIHkZ1wmEZpfm79eNU
X-Proofpoint-GUID: 3XYutzfTzUjm7jZIHkZ1wmEZpfm79eNU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA1NiBTYWx0ZWRfX+pc4SD8KOU+p
 L4brlJQnaLD5yit+RXQ0G+clpDZEKwi4oKEM2Dm2gpgUR3afJQFa9CQ3LBG3FeNRineRQ5t2u4p
 Hx7Ud7IqKCv5Mo6dnKdT9OHdIpaway5GFCm/CArI8WGtmBTZDL/glJ6XFlu26c5qdZOR2+MxRQr
 d7kpJkO9IV6HQSGh6TNvpuZkh6Es9Gns50v1SFsYD1z/GizPl/Ln76N7tZX8FXDDZ9D5J9fy/vN
 Q6p+GhZpGNjmgoij3mN9QLugTyO3g26fi5DDMg/DmM7TyPtmVjPlMce7NhYy73aVPHnmH4Yn/JP
 nTLqEayY+LAl1Vj28/xPqB9dyHOD8tc/yYLbEim8DvDDZIA/fquq6rP0D2do54UkerQnhGPonn7
 6PJ4wliIEpyhP66iyjJ9bz/GLbqNeCCzJbgDe0mHoZ40weJ4tNTpfyRIWd2ar+BRlSYUGza0ldg
 IyBpeSbQmbeHNwVTRcQ==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a323b00 cx=c_pps
 a=lkbh7UP1KfD7YpE6p/j4Yg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=2ARZYLNAp5jiIBkNmmoA:9 a=CjuIK1q_8ugA:10 a=BqsyOfjGxCjotqy0BNwA:9
 a=Fr4k6LovuCnfNRM1:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 06:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238977

--_000_PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42PH0PR02MB11317na_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
The patch "gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer=
 creation" has been merged into OE-Core master.
gstreamer1.0-plugins-bad: handle padded buffers in wl_shm buffer crea... * =
openembedded/openembedded-core@866915f<https://github.com/openembedded/open=
embedded-core/commit/866915fa7bcbe563849aa1100033c684a805fc24>
This fix addresses incorrect rendering with DMA-backed buffers that include=
 padding or custom strides by correctly handling stride, offset, and buffer=
 size using GstVideoMeta.
Given the relevance of this issue for Wayland-based rendering paths, could =
you please consider backporting this change to the OE-Core wrynose LTS bran=
ch?
If needed, I'd be happy to assist with preparing or validating the backport=
.
Thanks,
Tushar

________________________________
From: Tushar Darote <tdarote@qti.qualcomm.com>
Sent: Monday, June 8, 2026 6:48 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in wl_=
shm buffer creation

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


--_000_PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42PH0PR02MB11317na_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
Hi,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
The patch <b>&quot;gstreamer1.0-plugins-bad: handle padded buffers in wl_sh=
m buffer creation&quot;</b>&nbsp;has been merged into OE-Core master.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
<a href=3D"https://github.com/openembedded/openembedded-core/commit/866915f=
a7bcbe563849aa1100033c684a805fc24" id=3D"OWAb29a70de-59d9-6d48-aeeb-ba37831=
604fd" class=3D"OWAAutoLink">gstreamer1.0-plugins-bad: handle padded buffer=
s in wl_shm buffer crea&#8230; &middot; openembedded/openembedded-core@8669=
15f</a></div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
This fix addresses incorrect rendering with DMA-backed buffers that include=
 padding or custom strides by correctly handling stride, offset, and buffer=
 size using
<code>GstVideoMeta</code>.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
Given the relevance of this issue for Wayland-based rendering paths, could =
you please consider
<b>backporting this change to the OE-Core wrynose LTS branch</b>?</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
If needed, I&#8217;d be happy to assist with preparing or validating the ba=
ckport.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">
Thanks,<br>
Tushar</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tushar Darote &lt;tda=
rote@qti.qualcomm.com&gt;<br>
<b>Sent:</b> Monday, June 8, 2026 6:48 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [PATCH] gstreamer1.0-plugins-bad: handle padded buffers=
 in wl_shm buffer creation</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
This is v2 of the patch addressing the review comments from the</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
previous discussion:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
https://lists.openembedded.org/g/openembedded-core/topic/119139835#msg23769=
8</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Apologies, the updated patch was sent as a new thread instead of a</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
reply to the original discussion.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Changes since v1:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
- Fixed stride handling to correctly support padded buffers</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
- Updated wl_shm buffer size calculation (stride * height)</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
- Improved commit message clarity</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
- Added note about upstream alignment and backport adaptation</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
This is an adapted version of the upstream fix, as there is a</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
significant gap between upstream master and the version used in OE,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
making a direct backport non-trivial.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Please review.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Thanks,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Tushar</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Tushar Darote &lt;t=
darote@qti.qualcomm.com&gt;<br>
<b>Sent:</b> Monday, June 8, 2026 6:29 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Tushar Darote &lt;tdarote@qti.qualcomm.com&gt;<br>
<b>Subject:</b> [PATCH] gstreamer1.0-plugins-bad: handle padded buffers in =
wl_shm buffer creation</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Use GstBuffer metadata when constructing wl_shm =
buffers so stride and size reflect the actual buffer layout.<br>
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
</div>
</body>
</html>

--_000_PH0PR02MB11317F83EBCE38D3ECD196DAF8FE42PH0PR02MB11317na_--

