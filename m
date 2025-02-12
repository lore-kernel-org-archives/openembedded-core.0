Return-Path: <sven.kalmbach@loewensteinmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF73EC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:53:27 +0000 (UTC)
Received: from mx08-00640e01.pphosted.com (mx08-00640e01.pphosted.com [143.55.148.42])
 by mx.groups.io with SMTP id smtpd.web10.17655.1739371996785269101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@loewensteinmedical.com header.s=pplm042024 header.b=MGSpXyni;
 spf=pass (domain: loewensteinmedical.com, ip: 143.55.148.42, mailfrom: sven.kalmbach@loewensteinmedical.com)
Received: from pps.filterd (m0376841.ppops.net [127.0.0.1])
	by mx08-00640e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C4oGaK010472
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:53:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	loewensteinmedical.com; h=content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to; s=pplm042024; bh=
	MrHZ8HJFc4LIhPbNGHNT6p0lE+fkvE9ChQJ+VcsBvrU=; b=MGSpXyniSGHYHKcv
	ML5yJD+AZzkBz+1ptqXtTuIq0WsOlHW3mia/3LIMVU9nZMlendTVzy6vkGoZF0fm
	PargiEEtPdYfmHQGC3oppyoC/I24EvoAe8Z/f3S/B+uyAjkfklth8NtGqSKZVb0/
	iGQNKysibBI08yfq8gH4x/VtdOllh1iFQyNvGC4WgKY+esTvxY1HkZHDYMnZmXYR
	p+KFDtWVoMnZtuvyqDVsoWgm0exXVDZjwAqkvgfvuLS/F/FSqus2IwGKMSOMKf0t
	zW+1thAEJlvLSUNRl6Hn42tscrlB9NPuthMkbBVkBcKvWmA9zn2CZa3C2A98oy5i
	9kfIXg==
Received: from outlook.salvia-medical.de ([91.26.250.91])
	by mx08-00640e01.pphosted.com (PPS) with ESMTPS id 44qx14s6u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:53:14 +0100 (CET)
Received: from LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) by
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 12 Feb 2025 15:53:14 +0100
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.21) by
 LMI-EX02.Salvia-Lifetec.inh (192.168.202.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 12 Feb 2025 15:53:14 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICFtfjZa2YGFoY7FCf5wX9LYZ0/0F4xnV/skV/06brDIN9pnNOPt2wPVt4MyExzbWxifiD4OnDEMttk0xuDPbAMqTj6HM0Fwz6dwlaLcUBDx/fcGd6OXGbB2WvkNN8A4MzH9AHpli01W4cONj5wsG49y7Sl8vII+NJr4K+jCJR7y7PVTdIQqGFb1Cilsyb4/a9CZF97a2kKkwMq9S+e1VaJrnIhe7gfLw3QKhOTVObMSCWDAo3obE7uyA2mh2m1jUBm1hPFXBFpoCJ4dFIkAhVLjBenv8uA9S99EScjmRb1TnskB7lIuN/QBZxhOZyFpxPSr/H0lFdzM4LL8N53dmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrHZ8HJFc4LIhPbNGHNT6p0lE+fkvE9ChQJ+VcsBvrU=;
 b=Zn1JLOKB6GL1EYIrjxQSngWZz0+Oz8uJgn0TcEvddf3gszWjqrxp/sWn6ysN2bDy2jnUO8inF9x0w0Rxa+B6US3+wXAjPgHn1oW3Hl7BkuV0txNlFKvbjTZAKxBW4Lq5wLMirfOB+BfmLeA6fI/WpQ6JwFqxrA3hzztL9Z+5bTcbhNMa8828O4dMiODRsXdP7PX9j6h53DVEJpXaLNolUKOGQ1iX+6BjlgbvCzixSYzJK5o5YYn240bChEL9q7/hSFkaJfeD9C69Yo5lD0+yrH+q9lPx3WBjbSJH7r/D+md6UFE24HhSXiGkVgN0hAysNcgzUlEG4R6tgkz3BfXVcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=loewensteinmedical.com; dmarc=pass action=none
 header.from=loewensteinmedical.com; dkim=pass
 header.d=loewensteinmedical.com; arc=none
Received: from PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:c8::11) by VI1PR01MB6590.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:18b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 14:53:10 +0000
Received: from PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 ([fe80::3120:42a:d1fb:90e3]) by PA4PR01MB7568.eurprd01.prod.exchangelabs.com
 ([fe80::3120:42a:d1fb:90e3%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 14:53:10 +0000
From: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] Fixes [YOCTO 15731]
Thread-Topic: [PATCH] Fixes [YOCTO 15731]
Thread-Index: AQHbfV1PaDW2xcdraEue4U5qvp7pkQ==
Date: Wed, 12 Feb 2025 14:53:10 +0000
Message-ID: <PA4PR01MB7568995480429852AF9AF6B782FC2@PA4PR01MB7568.eurprd01.prod.exchangelabs.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR01MB7568:EE_|VI1PR01MB6590:EE_
x-ms-office365-filtering-correlation-id: 3004bb94-f300-4334-47be-08dd4b74f82b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?YPwVdfzPUUp3mu54ueqDFuk0ZFqz0UFM2iTm6PJC+wXOAqK7P9cSc23VK1?=
 =?iso-8859-1?Q?v7KvzMMeOL+6V0hPCuKUiUFZ3YMkNNQfgn3x714r7yGePNGoQfCqf+ZcRl?=
 =?iso-8859-1?Q?mp6TiSnuLLMkt3ZpP6t+GFaKhrlF5c+tciUGfsE4lvoCLlB5xkb4mRf7rG?=
 =?iso-8859-1?Q?LVI19BFUjEJDMKQSsFKLEDO12g39ecC9WrTBxdLSBGzLz8CjS5BRvPaqwQ?=
 =?iso-8859-1?Q?i3kRJUcpXlJLQye06Xu40F1UHMxrNHgpg5h2TIklvXE81Nm3yLn4W+oxrM?=
 =?iso-8859-1?Q?5LHshnJ3abMWB05jVxJBCa4iOEPjSW+1ByNOc3pT3EIXfvQoT2sEMVCGy6?=
 =?iso-8859-1?Q?RgQ5CH9MX10WqiQwyLM3F9bC/qhspKBIUL6muSFoPHy1F6e71SE7rwi4oP?=
 =?iso-8859-1?Q?CWBnVQDJnb+QEiVwzn4LVAzUJbofH4Q8qW0JV66WmGDbxEf4KwmcgxxRVp?=
 =?iso-8859-1?Q?J80Ayl8rXthNdL67WYhckZaRbR81lG1gJIUHqu2NVGAE2pI8MGKwHIDFyK?=
 =?iso-8859-1?Q?nd2LoxVxG4dNim3HiVzr4HoPoRQ7ni/a8Dsm3yp0H6CiQUaOPpvapXrIhe?=
 =?iso-8859-1?Q?4VnzFTlj7T88mH8a15C+OVjb9plpJNemxl6ASIQFTJLZ0m6IybkOqzUrQx?=
 =?iso-8859-1?Q?2+r44Wo6n6twNxCmLnE2ssotcMloQk44711EeW3emqt8QgqYplabAa3FYJ?=
 =?iso-8859-1?Q?0q07UANYzDzMVGvY6nqed+zD6zfGt6lq3PspPybFQO7JFkSYe65uFXZMLX?=
 =?iso-8859-1?Q?2bMD8jmSljc9wpB7Xo49fseXh4+r1sTQkvuEjdvHuonuvUUgCTxuUwv9sB?=
 =?iso-8859-1?Q?kycxMLeZzt0Kv63pPOnXuQMvEXOQ93ThSSdQSsbQCn6ufjCC/dT0NEGIRB?=
 =?iso-8859-1?Q?DpoFwlxDPDI+Z0leyF7HZprKas+MnIyBVbeySRigIE18ShwHsppuPYzglz?=
 =?iso-8859-1?Q?nG8Fm3kDSqY0b/ougKfWo/hzlbu/CQJdBCZd03XytFIV5NdlLWRlhN+38d?=
 =?iso-8859-1?Q?nZiIRUJIHUa04ZRvwu4i8wHUIu+lMaHkDLJDL7pro1zJxbQSZ2OA2UaDpV?=
 =?iso-8859-1?Q?m0+lg4CGbPb1gyuk7CPzytzy2ztFb4ML0w5gx705hr+HL2NiUnvAZXX4Bx?=
 =?iso-8859-1?Q?pOL7ckP4NuRVv3Uu7LruVJNYfsqyfoCIt4H5l+Rnkc3jRJoX6V8T+U91d4?=
 =?iso-8859-1?Q?cRz9S73GH8P79CrJ/do5l3kG37VdDmlKxRiaibo/CnyKQtluEG6qWpDxse?=
 =?iso-8859-1?Q?Un0XqASRDOo+K1nfgO5GKReAB1Kd7TZF5H5QZMxRw3e4m1FY32pCTj/b7H?=
 =?iso-8859-1?Q?fBPHzjXwQEfEbkcQ4e7OyIvnlDLZE0tMGRO1S9r47UgarYmi0Chga1OIfO?=
 =?iso-8859-1?Q?miSCrh6ipSZY6BvS0ZtDiNWELYQdveu8eybOpAIhhdh6ced3EZIbsEvyvr?=
 =?iso-8859-1?Q?04z/fr6cVroQkcmLqh1lRP4lstdzjzNAoWgkFokusYn8y5JGlggqRNd2H2?=
 =?iso-8859-1?Q?sXCoa9l/7dZTvqOxuOsAng?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR01MB7568.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PeoEHpeyAXwk3KZejY2E7buaBTwqT15s/zS7RRxsUs4YQiQjffv8RTUh3a?=
 =?iso-8859-1?Q?feifE1KGt2VlKx+JTI1avYh+Qr20QT+UHGGi8EFH50OAyijn1/V5KIIx9t?=
 =?iso-8859-1?Q?To6zQNcZ/fQ+5dhZezAgFov7tbD+KkciRSwPBauQA5pTM0GwjVd8pzwd/x?=
 =?iso-8859-1?Q?TUCEnvLhgDIsh0Cvk3GRbZrgGa7TNB1GEgOXfCno4hCkcTy1j8tMV1O3GI?=
 =?iso-8859-1?Q?572U8AYS+8UWeZFKegCEtK2eer6FI9gXl2BTTP4dypb8xPRVi/+cXo0Emh?=
 =?iso-8859-1?Q?PxtTpWyX+V9NLy1LWA3vjaO2HgOIo6LK9GiSkQqeQBUanTbWd8AC5m3V/5?=
 =?iso-8859-1?Q?Okec2TgnPOut5UEhbaErQrDOUrb2WkRzxAtBzDNWfhY54CiV1NZcKQW9/C?=
 =?iso-8859-1?Q?In73W61BO5ShrrVtszDRrJ9f371D6WseTal6KREGQc+eKraxDJp8jp5mC6?=
 =?iso-8859-1?Q?kI/6NJ3KnkWVFrUbphWZKhlNLeelwIqB/VvupJnvBLMtBdtQewfbKm3/gA?=
 =?iso-8859-1?Q?BoxS2bCHC5dnOqmVV6VoXiwr77yslBHJUBlRent2iSzM1XpWxTFVw8zl+r?=
 =?iso-8859-1?Q?9F4U+9Ky1NK6pkuwIo+nRGCLx8UgticDQCPeztfqYwW/9OxOnOaWs/dRCZ?=
 =?iso-8859-1?Q?HW2gUtqFCp+UBGxeoAAuQWBmZc9elwzzTJJUV2r4PIB6WtqrBDr7vB5FTE?=
 =?iso-8859-1?Q?qZIt5QeKMgbusdhIpLRQActvW1xR6VjImyfcqRNtZvXDHbWZdcHwuy0XKE?=
 =?iso-8859-1?Q?hf2ewyEUdhc28oYkJBLQG7hV+esukifNpK3KKPrk1OLHZsKaxQdtePis3+?=
 =?iso-8859-1?Q?keKfz6VZZ+Llq+JMh1+GP3pcpzDzIQFCTN4Onu8/vw8ndDVpoPfKYDy0vk?=
 =?iso-8859-1?Q?1VWH5ROoeT1p+/IY9VNWTTnoHFr6L/8VAVpbSU5TxDa5vhXXSHIsg8Gn20?=
 =?iso-8859-1?Q?fwMn5lH5FZRfi89Gn5tQvVMig2HZuPyHPnf3YMFEK1AL67NLPRuk2M1hKe?=
 =?iso-8859-1?Q?zo0L7sn7YThuxOxDkYtfu6x5H3Bdh/MGuEcCMpnpPh3q2jPCtVx25k2m4W?=
 =?iso-8859-1?Q?SqRqW0xqkxfL/TcMycexmqYQBtJW+L4JI5bLyruIDRGbVcLJoA7kdatHgS?=
 =?iso-8859-1?Q?5kFpMrLQxw5luE+qifPTcps13kEKhKJUhshAvLr98vmHWBrmyBGAhU/iWj?=
 =?iso-8859-1?Q?QYdK2vl36XbhzaYTHOA2B1Z9CEhEWdUd3r3/HcExSDNNFhxGsMbjS3h4pE?=
 =?iso-8859-1?Q?umomUUZ5PQu6/BkOODWBWk4ndYcZXgqafR4Yd9I7tKOirrwfIvOwZiLVtW?=
 =?iso-8859-1?Q?oPWPS7uDQiVy1w48KfpUaN6yrM00UZ6yBp/dwpe9Cnfs5u16KiOksYifKc?=
 =?iso-8859-1?Q?DhF2wa498HcKCr1PzVxgPkqCd/qCyLuN96rwTunqhkK7AcmVgpBhiY/Xa/?=
 =?iso-8859-1?Q?zB4uLUu8tnxIgseZYde9joDtbuu/0mVW17QchO2VLxYmqGuaI7mS1+txZL?=
 =?iso-8859-1?Q?YiVQG0dJGmLlUBjuuJVw54vQ8hexi00pBhAlII4jusM2y9O5jyDVAguhRB?=
 =?iso-8859-1?Q?cphargGBzj2aODD3Hr1qMTnREesqpUHM/7Ka1C9ZUwv+gTNiztAtaOK6ol?=
 =?iso-8859-1?Q?XIno7xgWOt1lbto9/kBfrYSX5dltzpjK80BIZ7DtDgwZMO+CZTeT/adw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sM0YVIxrpRJOBLpB7uVP+pF+P/ks8qVfxIWGqQgQlWg0pc+L0q3Hmzok+DBl8pmh9woU28T8SKco2mjbAFSKe/KDwF4LnOKxpVR+kKw/R7zFsJrQVamE669Bv7LRuWJOs8a0n4iLJbCrWVgrOPgFv0YVpFR4KcxGi+msKqYHpNZD4jPg8a5HZwE9mUSV/c6pgvCvwsRwpuKFlAH2sE3nRkkczHOyH2MJM6jQSOtuLki05dHb7y9EIPWL3MpLgcI/p3BmChUYEJiZNar2bApp91idJem+sOUx9TydvWjV047XUO7nLg5MNtNtOdDOrIP5I2Hgl4I7AmuL4KIlIRkgNd3GYBbGeFGKEsONW7ZrhjZqA7UPOQ9byQv6wRopShpTcHUZPiH3oiJX83Yjynzjt/cRv5GMguyikvZuU1u1g5Xz5NC9EVjvFgVtiuC93M2q6et+Zaei15hwk2qr5fxEfy8rvWvEFnYYGZBWy/g2R4N5D9AmFtYatnKDkYmuuUiAdp798WFkXjkVsyhxq2LT33CV81Zxs6IewC5uv8o1vrHh6+jdnlDB5Cm3tNypWX3YaRzsDyJ1q60oArlX3SBRHGEzJOfVhgXdWizQ/1GM9GGMF4phlTrz/yLZmiS0YUAR
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR01MB7568.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3004bb94-f300-4334-47be-08dd4b74f82b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 14:53:10.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4620751a-8ca3-4df9-92a7-6fb9b06279d3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYS7B2nfOZGWZ4OWhdC1Dz82UhowQNkYqFSwGi7Fhlvfc2MBY9tO8CG5mg2ByVacd/Yq54apEHP9UD5Z1qlW9Ci/gE2uiSVej6djP0Do0tMwR9wfCCWGF9IHyTjDc7p4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6590
X-Proofpoint-GUID: eyLw8iz9ZQNVzEyYk32cWdm2Qcs1HzNu
X-Authority-Analysis: v=2.4 cv=ZfnnNtVA c=1 sm=1 tr=0 ts=67acb5da cx=c_pps a=FEALSKi4AvoWtY0syLDQ7w==:117 a=FEALSKi4AvoWtY0syLDQ7w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=T2h4t0Lz3GQA:10 a=pnnnEMm-AAAA:8 a=_507QEmVszEgESBbCqIA:9 a=wPNLvfGTeEIA:10 a=71_3R1wvw0rBZWdj5NaC:22 a=L1VgJ4hi7dtVfwbEAIjz:22
X-Proofpoint-ORIG-GUID: eyLw8iz9ZQNVzEyYk32cWdm2Qcs1HzNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502120113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211245

From aa2176cbd1438b72f22129421edd8f7979330a56 Mon Sep 17 00:00:00 2001=0A=
From: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>=0A=
Date: Wed, 5 Feb 2025 16:11:33 +0100=0A=
Subject: [PATCH] Fixes [YOCTO 15731]=0A=
=0A=
Remove incorrectly escaped exit value, which causes error=0A=
handling logic not to run.=0A=
=0A=
Signed-off-by: Sven Kalmbach <Sven.Kalmbach@loewensteinmedical.com>=0A=
---=0A=
=A0meta/classes-recipe/cml1.bbclass | 2 +-=0A=
=A01 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bb=
class=0A=
index 0bf171a668..d18b008aec 100644=0A=
--- a/meta/classes-recipe/cml1.bbclass=0A=
+++ b/meta/classes-recipe/cml1.bbclass=0A=
@@ -58,7 +58,7 @@ python do_menuconfig() {=0A=
=A0 =A0 =A0# ensure that environment variables are overwritten with this ta=
sks 'd' values=0A=
=A0 =A0 =A0d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_P=
ATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")=0A=
=0A=
- =A0 =A0oe_terminal("sh -c 'make %s; if [ \\$? -ne 0 ]; then echo \"Comman=
d failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.get=
Var('KCONFIG_CONFIG_COMMAND'),=0A=
+ =A0 =A0oe_terminal("sh -c 'make %s; if [ $? -ne 0 ]; then echo \"Command =
failed.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVa=
r('KCONFIG_CONFIG_COMMAND'),=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0d.getVar('PN') + ' Configuration', d)=0A=
=0A=
=A0 =A0 =A0try:=0A=

