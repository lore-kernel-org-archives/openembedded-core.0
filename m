Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D32C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:00:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5733.1787048012743207593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 03:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ddQZrIHp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BV4Y1061914;
	Tue, 18 Aug 2026 10:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7HXKjREdcsB6ALhvSYFIHo1e
	V3JsDB+BQF2YTklh7Sg=; b=ddQZrIHpJscR8CV60XW5JVdfgv0Nz35b1QYkeRLr
	CAZiTRMO7WQV+jL5mF0pFYyO1jkvrh4RDw5ltvvjG/y6QG/7NiJ0yRVxl5fNipUv
	8h8pDCEzEgYzOk2STSGvxbwVU3/BRvJDDjmL2r7L5WRBT2hulu4enJzCqnlsqx5C
	xjtS/ud755GTEskgh2ayznp6Bj7NNK2Bbnsm6KQ6C3+Ryqp0y9nniLJFoejX7o14
	p9+0A1FJagrwa1LFeIJc06FCkbNn3i7YvtlLwt3Cp2ibElQ0i6NOUmQCw+YoC4U4
	Csxxl4Ha7mPzXY+scIKd+qHHoKkXMeIRzB0Ph9v0ckUffQ==
Received: from ph0pr07cu006.outbound.protection.outlook.com (mail-ph0pr07cu00601.outbound.protection.outlook.com [40.93.23.89])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fvp1eyj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 10:01:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQBDBt/w8ejnkr7O4DL+hEhGAzXDMMOYsHYQvBlLiDNKU3j7N6O0p4z4KsBNxvFrSQagxbXKeZ1r9ey5v0qR7xuBuzUICJ6TYd5AvEVEE4UYD7TtFLE7jQDFmveNphVLQyTatFGplDfhP9hhON5G0e6WRfd7AyPhi4h8C/PUo8khRdUuUvhV2isfq5+qOWfM8cmEazNnh9XCVeZjjWFp+3Z+2xeUFqJgdAd+7qLwOzrNTzauRsghxpxMZpYvUqnSsSxfnxTddV2gLM3rprrhbNe6BSWOEXL21StGNH2Qp9qsN+pXNpNHfE8beEL5JOdO0xPnXGr2pPV+Z06CEK5iMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HXKjREdcsB6ALhvSYFIHo1eV3JsDB+BQF2YTklh7Sg=;
 b=BHoDYBdDqPuXoJ9qXPKfJfAPrio7YhctxTM/kAbBfh7yCzCZmorPQXOd80ubKzq1RVE5qKcdSAuiXKwPf8rBo2wIpDKh8Y0d+kC1pwfbVnuiULezHF3IAqXd+8Nza+8OmFyWAV5/XYKmB/nuyAt8Zy3Zgy1AJL5Q5MD8e/8y3iHQw3LhrwWIctwx4yIHY76JHvLXlstsCt3hDCxBeffK+/JkDCCZVlw5z560H7eXKwPuqx702h2NUBowK/WXV9XfI4IyZtB4DfZETfbojUo9bC+MG8D4TgpBbHRBzJ8BsYYkrky6ocOHdLG8ELNALNtyyP6WSDky3EDf29Jm/Zfe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 LV5PR02MB10803.namprd02.prod.outlook.com (2603:10b6:408:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 10:01:51 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 10:01:51 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: add opt-in root-only udev trigger
Thread-Topic: [PATCH] initramfs-framework: add opt-in root-only udev trigger
Thread-Index: AQHdKj0P4kg1Ev2phEeVhCxHA2UrMbajh8uAgAAN8Og=
Date: Tue, 18 Aug 2026 10:01:51 +0000
Message-ID: 
 <DS0PR02MB919703469B88DE489E8BFC81EAA62@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260812092842.2060157-1-wenwfu@qti.qualcomm.com>
 <501364c2da036830fd46896e7f8997e16d2848d2.camel@pbarker.dev>
In-Reply-To: <501364c2da036830fd46896e7f8997e16d2848d2.camel@pbarker.dev>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|LV5PR02MB10803:EE_
x-ms-office365-filtering-correlation-id: d8cabb5a-0c61-4872-b9a3-08defd0fb989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|56012099006|8096899003|3023799007|38070700021|6133799003|11063799006|5023799004|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 YJ0zH9vzwz8sgKJd8/mSbI1vUdtWFz/KV6sCSLZynrgbXeQKj1IEkRe2TGxzidwGNuht5jA6jPB1jYmRWOBhD00bmO55+5cTz6nIaCS7DIcFmWmS/d5Og6rrV5IFxln6JNdcOXPHfcW4gXG3rrm/MYkD9gkTp/hA6TH7XLwLU8lQBiBsNddHgNTtBvqf0ij++Vs6uoAwGL16m0Y+U/M0NQaYwPMIWCKC66W6A+k8QWfzXtMBJiDU+w61HYXWiOc8fbnBBZS1X7zAkQmHTMKDIW6U3pTjgD5q8q9zmm9+8JxFTLfRUZfCrKnbGr+mr0gSIxPLAWQA9MCw4wraordK7dYxNjiMRaZpJnADm0/HyFQH4mbsaqdZ+zLuUGpyr1zR4VAzZDMjt/zzGCZU+zH5AkDuAZlK49jJkoGg6Nb2+A3KLuUUknvbrpdf+aVgCfu11VW9kTfR7X0fhzR/DfyLw8g+71+NGcfMLx6Ut+wvdXpOJowks2kLp1gjxe7twI6859TZiIhkeo2MO5PsOWSCeKN4k3pco5M/A8Yuk4L8YFYDYf09azPYF27tth5k2UWKLorzYLELdTQWGmpI4nnvWjxYHc5TwxJO9ayAGPQlEQCnED2FZ6hp2kBphfRGJxZA/LKfDhq+djBpW/nq6I7tFVm1fj9BOSSwYHX//iTMyruOzdnlqDSaEucdUfyTc3/jFU0/sLBXw3QBQF2rA0PhRYcjdQ3oNp/zDYSnq05PJE4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099006)(8096899003)(3023799007)(38070700021)(6133799003)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5J5cBizZTvllr1Mu+35ZOZ7q3scwl31Mxf3TrhkFShbl8crqmbOeejbQEL?=
 =?iso-8859-1?Q?9Zx8Q9IS4Vcow/BI9aVGbpAUSGsqO1mpl5ToUQE3wunipm6JCIgk5DZFTn?=
 =?iso-8859-1?Q?e6TiCgxcoCY5Fdm9DnV9RE1cZ8Lo8nuJFHH8rB/zL7WhWXQ0IwBbNRWbrH?=
 =?iso-8859-1?Q?N9O2d/5vsNUZLADZicFuXNuynvXlJ7lLIYhdqJ6xpPEYQVA/iBouQaHWEN?=
 =?iso-8859-1?Q?pnNtQkmxpzDTUpEZu5gjnYZk0vFXNwdgfzumSP0bTSi5OWYv64TdUrxnJb?=
 =?iso-8859-1?Q?4+9wqto6ntGMp5wNqetfeZBTuxmWl3hEqqJM4rXoWpUMv/M+o0/dtE8mTH?=
 =?iso-8859-1?Q?pMCAcCoR2myE7Bia1kMtK05sm3i4h19vZLsDJ5NSECNNTquNwp5NA7khDn?=
 =?iso-8859-1?Q?8BqAoozcKkMy7KAnMT2JWE+vK1+ABNWE2g/D6QT5xYh0hkIYj7KTbMDMJP?=
 =?iso-8859-1?Q?9PngTuAmVulmom8qgsrfSazKqnmJeXecoaMWoNnTMMBSCiea5B6fMkMQRi?=
 =?iso-8859-1?Q?j7ES1pc3nyQXUc3wPISOUwldjZTRI3DBKvwoia/4dP/vgvJPxlPlGfffOe?=
 =?iso-8859-1?Q?N5budWI+EPbIQTdSFwM0ZFkEX391KV1O670zBbK/roBgFQZ2ikoHXn2PIC?=
 =?iso-8859-1?Q?rp6aQa1BfPNvcbAnLpNWW+D8RjHnThDhi81yZ5FRXdNWx66k1t0uvfEVX6?=
 =?iso-8859-1?Q?ayNiRbc4juLdeIOtqSdyUM+K4qnI+zr42fw0Y7+uBetnxBaWFCwIwxgIH8?=
 =?iso-8859-1?Q?T6uiU+uJDIXyQNlRjHgSxFailtoA8/gDktCg115V1yKlK0Ayff6MKGCu4p?=
 =?iso-8859-1?Q?e702NscH1tpFhqrkBWfT6y3LTu9f3foXFGa2969goKyA/EJO2fqemwfOFH?=
 =?iso-8859-1?Q?qCIj2JrcAKBnpo51+cVXr6yzgRxb3FoY7M5S8iYctWsXStEJSbBmkLEVin?=
 =?iso-8859-1?Q?Lv0MuhHgUmZ3rWk3nv4NKTjYMVGJQAQuAQm8eEEpLhim9uozkBdP/i048c?=
 =?iso-8859-1?Q?Mo5wkpKSNlqgMoydYTMhhDXUr7SPH3LBAJjr7fxGG8Je5WBNwJ9vY7YwPL?=
 =?iso-8859-1?Q?j/Pp33u4HToKNFkYkz7W5/xADon08bfvocWDFFFbgsuBlk1o1H2faL3oBt?=
 =?iso-8859-1?Q?rqS76TKCSJBr7drmNx8Pz0yqEEZzwmerhfCE+V8qLuYq10m4Gpk7u1lb8x?=
 =?iso-8859-1?Q?WdWo9YtbHyw4re1aBghBCR9XqBym7S0pedAadwe41HU5TGQ78HBPSp3h25?=
 =?iso-8859-1?Q?E6Rj5dcqQmJuFRz3ZhR1u12N3xhkM8wOz+okTvgXX6yNvpzzObJpwJtnb1?=
 =?iso-8859-1?Q?IhC5UE6y/5a6pLLJHmOomVYJAnp5hxNrh7bjF0s6XrSGC7Jq/wTnGbV1s2?=
 =?iso-8859-1?Q?WrDpjCfmtRVwSQxV9MMqwk/BcwR1ZKHJRXc3vC7cbo30dTDeXHKN4BE1nG?=
 =?iso-8859-1?Q?3PvwEDHnpaQ894/L8uWxkzL7flVC99j323rNno0LPGtQOYgCD7c2d6wwt0?=
 =?iso-8859-1?Q?8r3Ydmf8ZBzSGXtyR/TKCj6FRMIMA2CoCsL2XNgCMrfFqew9JuTQImF6FG?=
 =?iso-8859-1?Q?sVf0b++ahon0S7cYD8SjEp3MfRsc9I8CLWXl0Yo+fjVqJncdMo+ZSQsna7?=
 =?iso-8859-1?Q?65rFqAkEeZu0JQpF34VelL2XSJ+ILXEDz1GcaUkTPd5+k9I/dc07w0GdCv?=
 =?iso-8859-1?Q?c+pWbSbeDtTiFC7mi9EKYiXA0i2/t0+zDKtJX5TbCsN8RVDWot1syrijR7?=
 =?iso-8859-1?Q?qJwoRXM09ONo1ctqMP7LPBuPUqJxj/Mr0NTl+DHm1VGTjyKctIRygo5AyU?=
 =?iso-8859-1?Q?GeBZFpkN6g=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	DF1Vl9mUioWYQJfX6wGvAUf573G3t2IIoCeZBVAle1RPP68PVm/itZftUYFtWsaLCYY7uD+ZRI69HMmgzFj6Cqlg01JprR/Ux2lKG/F9b5ZAgOflJym4RqaVdg7MPh3e1fU6/beu+p/G7prFqD1JY70a0rM2l7ebtufz1j8RDeBS/n9VvhukLxhxSCms4kSVi/PEowuK/TK4QSm5igg6ZONzkeaYZVs8yFuF6kiyQMvuWPLw8l+/zTN4inzisiesz57V6n/wkDlKXGkxYeGZbClbxrATbg3e6AvnGXQDq5WWH5jvG3URmFdCa0KyxXu7xQpl5SyArHWFuSmojVbrWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6Xa8FDSHobe+tjKYnnPR8J71tkH6hEk+xhuhHO1b8SBPRpDwiB2moYehvyY5qCYws2yreZGuiyBaPEeTrkDtF0lIWI7MnXZWhN9n21GFI6QPxjtt4f3oZ15Lf+AIYzXDi5qKyGrmKgRkA2AJsqGqA1BBfAtYa5nUlVQVpqdR0zopoKQh2J8EXT5Yi1ql31BGCpaCWvcp8901hqQguvEiLLiG4X1lVQSv9UAwtPMWWmqIJC0Vob7T+U51NocBXdBA5F/6HU7M6LWLQcV7QfDh1lRbOoLVNUH3XftAcy1eMpmeSWeaSJJwcatUCCU2TitoDDmUR0fJB60A1QPJqvU+gm5grYCro7wqs+SJ3D/X/MekNBy6nCruY2zGpiamj/JSK0KkojWF4SXCyX0x3bHN6OFXcSvlvxMbuGZxb6c+c2VK/dbf6mL+xsscr5vscaH1kP2YO2ZQ5DEcEspMxZG1/NCWveyRMzu1GBiCSZGJQktVAybbMBLoDV2LFLtClsQZq8YtdjnkSOGtq3TlcU435tBVE4VoknW9M09ZLGVZNS6EPqTed6F7uCYQ4mTB2XeGOuRg9CTrnhltRz/m1PLvakXtKgdQUu+dAa8ejdffthjLRfUN1S/OuBzCdg7/EaWd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cabb5a-0c61-4872-b9a3-08defd0fb989
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 10:01:51.1773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hp9jPyGU2xWGx09tp5JYalFVSwnAbceAW+upOImZxHPqMBNB2f2lE96B/KxdIPZjePASctCVLsBh7MVsaXnw+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR02MB10803
X-Proofpoint-ORIG-GUID: cArDKNiNwtsUlppwgnhO0ReEAVjCiK35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXyvzFPdaH6zR0
 oS9m1MovpeXN8Aw+2Ksqz/yZVQzJ9jwYX9tgU0hNRKOv7NsqCckIHLXGDoPmTXfeD6XjevraZR/
 JY3B4kgRB8Pkqq9wExApFDf2jyLDNeqqdXSz4OZVXwYHMAf0hWBxvC5FsSHKkBWX9woGEMqJ6Gz
 pGRfIdAc9EljbiMVX9R09HZEE8DmwKp6nbD7eXw0NEE2ofo3L+TbC5gh8mMxTZUTDtV0FK3lS0U
 uD7wXmlFJOED29BT9C5vhctuRkYgi5EwXyqd33Z5HdD7sYhPOoNqKwV5ZKD+MkGx4ZA/YhH1dxg
 OPz6qRPHqyV8/1+XU4jxr1qhAknHYp7pDUMKiZvHRTmUsKDN5iYBEzTkjnCl06HVf/fWuJk1AtK
 zTdRP0LpSvpqnbUkYosdFNNV4pIPwbxF5temp9gPQUSeTMIDQCcWhHrjZPz588NDp4gwBymFuOA
 Hj7JyW1I6oMt4mgK4PA==
X-Authority-Analysis: v=2.4 cv=K/IS2SWI c=1 sm=1 tr=0 ts=6a842d92 cx=c_pps
 a=qlSCZljh6UFQzBmsf39Opw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=R0lqXup8jhvVlckgF4IA:9 a=wPNLvfGTeEIA:10
 a=RgeG8QG1x03kdad9:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXxhGhwLFnCzCK
 LkRc2anQHvEfBCYsUO/lZ7/sVVIUwjeM4NsLT58xfqCVpgK9FXTjXpE5GLqAgGh2c7JwhOaAZWX
 9dfR0TIkBbygJ5XErcipkkQN+gbKH90=
X-Proofpoint-GUID: cArDKNiNwtsUlppwgnhO0ReEAVjCiK35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180073
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB919703469B88DE489E8BFC81EAA62DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243673

--_000_DS0PR02MB919703469B88DE489E8BFC81EAA62DS0PR02MB9197namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for the review.

The motivation is to reduce initramfs boot latency. On the Qualcomm RB3
Gen 2 Core Kit, the full coldplug initializes unrelated devices, and
udevadm settle waits for their events although only the root partition
is needed.

I measured the following average boot times with this configuration:

Device: Qualcomm RB3 Gen 2 Core Kit
MACHINE: rb3gen2-core-kit
Kernel: Linux 6.18
KAS configuration:
       ci/rb3gen2-core-kit.yml:ci/qcom-distro.yml:ci/performance.yml
Image: initramfs-rootfs-image
Root: PARTLABEL=3Drootfs


Default
full coldplug
With path
root-only enabled
Improvement
udev trigger + settle
981.6 ms
109.8 ms
871.8 ms (88.8%)
/init to rootfs EXT4 mount
1340.2 ms
441.1 ms
899.1 ms (67.1%)


This reduces the udev trigger and settle time by 871.8 ms and the time
to mount the root filesystem by 899.1 ms, corresponding to improvements
of 88.8% and 67.1%, respectively. The measurements cover three boots
with the full trigger and two boots with the root-only trigger.

For the targeted trigger, udev_trigger_root_device() returns the status
of its final udevadm command, so failure already makes the condition
false and executes the full trigger. However, I agree this is not
obvious, so I will make the error handling explicit in v2.

I will also clarify that the optimization is enabled with:

    initramfs.udev-root-only=3D1

I will address these points in v2.

Best regards,
Wenwen

________________________________
From: Paul Barker <paul@pbarker.dev>
Sent: Tuesday, August 18, 2026 16:47
To: Wenwen Fu <wenwfu@qti.qualcomm.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: add opt-in root-only udev trigger

WARNING: This email originated from outside of Qualcomm. Please be wary of =
any links or attachments, and do not enable macros.

Hi,

Thanks for the patch, I have a couple of feedback comments.

On Wed, 2026-08-12 at 17:28 +0800, Wenwen Fu wrote:
> The initramfs udev module replays add events for the complete device tree
> and waits for every resulting event. An initramfs that only mounts a root
> partition does not need to coldplug unrelated devices.
>
> Add an opt-in initramfs.udev-root-only kernel parameter. When root uses
> PARTLABEL or PARTUUID, trigger only the matching block device. For
> PARTLABEL roots, match the PARTNAME property exposed by udev. Keep the
> existing full trigger as the default so current users and other initramfs
> modules retain their existing behaviour.
>
> If the requested root cannot be matched safely, or a targeted trigger
> fails, fall back to the original full coldplug.

This explains the mechanism, but not why we would want the option to
avoid the current behaviour. Does the current behaviour cause problems,
is it too slow, etc?

>
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  .../initrdscripts/initramfs-framework/udev    | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/m=
eta/recipes-core/initrdscripts/initramfs-framework/udev
> index 4898b89246..7fa26ef807 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -35,6 +35,29 @@ udev_enabled() {
>       return 0
>  }
>
> +udev_trigger_root_device() {
> +     case "${bootparam_root:-}" in
> +             PARTLABEL=3D?*)
> +                     root_match=3D"PARTNAME=3D${bootparam_root#PARTLABEL=
=3D}"
> +                     ;;
> +             PARTUUID=3D?*)
> +                     root_match=3D"PARTUUID=3D${bootparam_root#PARTUUID=
=3D}"
> +                     ;;
> +             *)
> +                     return 1
> +                     ;;
> +     esac
> +
> +     root_devices=3D$(udevadm trigger --dry-run --verbose \
> +             --subsystem-match=3Dblock "--property-match=3D$root_match")=
 || return 1
> +
> +     # udevadm succeeds even when no devices match, so check its dry-run=
 output.
> +     [ -n "$root_devices" ] || return 1
> +
> +     udevadm trigger --subsystem-match=3Dblock \
> +             "--property-match=3D$root_match" --action=3Dadd

The commit message says that there is a fallback to the original full
coldplug if the targeted trigger fails, but the return status of this
command is ignored.

> +}
> +
>  udev_run() {
>       add_module_pre_hook "udev_shutdown_hook_handler"
>
> @@ -45,6 +68,11 @@ udev_run() {
>       sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1> /dev/n=
ull; exec 2> /dev/null; }
>
>       $_UDEV_DAEMON --daemon
> -     udevadm trigger --action=3Dadd
> +     if [ "${bootparam_initramfs_udev_root_only:-}" =3D "1" ] &&

I don't think this enabling condition isn't explained clearly in the
commit message.

> +        udev_trigger_root_device; then
> +             debug "Triggered udev for root partition only"
> +     else
> +             udevadm trigger --action=3Dadd
> +     fi
>       udevadm settle
>  }

Best regards,

--
Paul Barker


--_000_DS0PR02MB919703469B88DE489E8BFC81EAA62DS0PR02MB9197namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Paul,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The motivation is to reduce initramfs boot latency. On the Qualcomm RB3</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Gen 2 Core Kit, the full coldplug initializes unrelated devices, and</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
udevadm settle waits for their events although only the root partition</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
is needed.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I measured the following average boot times with this configuration:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Device: Qualcomm RB3 Gen 2 Core Kit</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
MACHINE: rb3gen2-core-kit</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Kernel: Linux 6.18</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
KAS configuration:<br>
&nbsp; &nbsp; &nbsp; &nbsp;ci/rb3gen2-core-kit.yml:ci/qcom-distro.yml:ci/pe=
rformance.yml</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Image: initramfs-rootfs-image</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Root: PARTLABEL=3Drootfs</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<table id=3D"table_0" data-editing-info=3D"{&quot;topBorderColor&quot;:&quo=
t;#000000&quot;,&quot;bottomBorderColor&quot;:&quot;#000000&quot;,&quot;ver=
ticalBorderColor&quot;:&quot;#000000&quot;,&quot;hasHeaderRow&quot;:false,&=
quot;hasFirstColumn&quot;:false,&quot;hasBandedRows&quot;:false,&quot;hasBa=
ndedColumns&quot;:false,&quot;bgColorEven&quot;:null,&quot;bgColorOdd&quot;=
:&quot;#EEEEEE&quot;,&quot;headerRowColor&quot;:&quot;#ABABAB&quot;,&quot;t=
ableBorderFormat&quot;:0,&quot;verticalAlign&quot;:null}" style=3D"margin-b=
ottom: 1px; box-sizing: border-box; border-collapse: collapse; border-spaci=
ng: 0px;">
<tbody>
<tr>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 196.797px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 161.566px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;">
Default</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
full coldplug</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 157.575px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt;">
With path</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
root-only enabled</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 177.594px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Improvement</div>
</td>
</tr>
<tr>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 196.797px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
udev trigger + settle</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 161.566px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
981.6 ms</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 157.575px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
109.8 ms</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 177.594px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
871.8 ms (88.8%)</div>
</td>
</tr>
<tr>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 196.797px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
/init to rootfs EXT4 mount</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 161.566px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1340.2 ms</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 157.575px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
441.1 ms</div>
</td>
<td style=3D"border-width: 1px; border-style: solid; border-color: rgb(0, 0=
, 0); width: 177.594px; height: 22px; min-width: 15px; box-sizing: border-b=
ox;">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
899.1 ms (67.1%)</div>
</td>
</tr>
</tbody>
</table>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This reduces the udev trigger and settle time by 871.8 ms and the time</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
to mount the root filesystem by 899.1 ms, corresponding to improvements</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
of 88.8% and 67.1%, respectively. The measurements cover three boots</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
with the full trigger and two boots with the root-only trigger.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
For the targeted trigger, udev_trigger_root_device() returns the status</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
of its final udevadm command, so failure already makes the condition</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
false and executes the full trigger. However, I agree this is not</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
obvious, so I will make the error handling explicit in v2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I will also clarify that the optimization is enabled with:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; initramfs.udev-root-only=3D1</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I will address these points in v2.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Wenwen</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Paul Barker &lt;paul@pbarker.dev&gt;<br>
<b>Sent:</b> Tuesday, August 18, 2026 16:47<br>
<b>To:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;; openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [PATCH] initramfs-framework: add opt-in root-only udev =
trigger</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">WARNING: This email originated from outside=
 of Qualcomm. Please be wary of any links or attachments, and do not enable=
 macros.<br>
<br>
Hi,<br>
<br>
Thanks for the patch, I have a couple of feedback comments.<br>
<br>
On Wed, 2026-08-12 at 17:28 +0800, Wenwen Fu wrote:<br>
&gt; The initramfs udev module replays add events for the complete device t=
ree<br>
&gt; and waits for every resulting event. An initramfs that only mounts a r=
oot<br>
&gt; partition does not need to coldplug unrelated devices.<br>
&gt;<br>
&gt; Add an opt-in initramfs.udev-root-only kernel parameter. When root use=
s<br>
&gt; PARTLABEL or PARTUUID, trigger only the matching block device. For<br>
&gt; PARTLABEL roots, match the PARTNAME property exposed by udev. Keep the=
<br>
&gt; existing full trigger as the default so current users and other initra=
mfs<br>
&gt; modules retain their existing behaviour.<br>
&gt;<br>
&gt; If the requested root cannot be matched safely, or a targeted trigger<=
br>
&gt; fails, fall back to the original full coldplug.<br>
<br>
This explains the mechanism, but not why we would want the option to<br>
avoid the current behaviour. Does the current behaviour cause problems,<br>
is it too slow, etc?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../initrdscripts/initramfs-framework/udev&nbsp;&nbsp;&nbsp; | 3=
0 ++++++++++++++++++-<br>
&gt;&nbsp; 1 file changed, 29 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev =
b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; index 4898b89246..7fa26ef807 100644<br>
&gt; --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
&gt; @@ -35,6 +35,29 @@ udev_enabled() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; +udev_trigger_root_device() {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; case &quot;${bootparam_root:-}&quot; in<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; PARTLABEL=3D?*)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_match=3D&quot;PART=
NAME=3D${bootparam_root#PARTLABEL=3D}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; PARTUUID=3D?*)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_match=3D&quot;PART=
UUID=3D${bootparam_root#PARTUUID=3D}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; root_devices=3D$(udevadm trigger --dry-run -=
-verbose \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; --subsystem-match=3Dblock &quot;--property-match=3D$root_match&quot;) |=
| return 1<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; # udevadm succeeds even when no devices matc=
h, so check its dry-run output.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; [ -n &quot;$root_devices&quot; ] || return 1=
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; udevadm trigger --subsystem-match=3Dblock \<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;--property-match=3D$root_match&quot; --action=3Dadd<br>
<br>
The commit message says that there is a fallback to the original full<br>
coldplug if the targeted trigger fails, but the return status of this<br>
command is ignored.<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; udev_run() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; add_module_pre_hook &quot;udev_shu=
tdown_hook_handler&quot;<br>
&gt;<br>
&gt; @@ -45,6 +68,11 @@ udev_run() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sh -c &quot;exec 4&lt; /dev/consol=
e&quot; || { exec 0&gt; /dev/null; exec 1&gt; /dev/null; exec 2&gt; /dev/nu=
ll; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $_UDEV_DAEMON --daemon<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; udevadm trigger --action=3Dadd<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${bootparam_initramfs_udev_root_o=
nly:-}&quot; =3D &quot;1&quot; ] &amp;&amp;<br>
<br>
I don't think this enabling condition isn't explained clearly in the<br>
commit message.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udev_trigger_root_device; =
then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; debug &quot;Triggered udev for root partition only&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; udevadm trigger --action=3Dadd<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; udevadm settle<br>
&gt;&nbsp; }<br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</body>
</html>

--_000_DS0PR02MB919703469B88DE489E8BFC81EAA62DS0PR02MB9197namp_--

