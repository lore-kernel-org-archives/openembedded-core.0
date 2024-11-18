Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E551D43FEE
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:20:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.36532.1731918020294334894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 00:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105223d229=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI6oECF008448
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 00:20:20 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq1700-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 00:20:19 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AI8KIhY013753;
	Mon, 18 Nov 2024 00:20:18 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq16yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 00:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGGfwUNkIVCRzPc+ivFj7Ze73jjrR//AUp5VUMBwxqEWpnoF3iZqBwF/hQwY+oAwWPPOTOAcZEW2PsLksB9Y//cQvzGDBVASd32Umrza744AQK645kT/+w4ZdhD5sNZ2wvjtb0PGR1TpHirpD2Aww4+eqxcQBQyDo9BqENN3Xe9jwpUZdJjls992vFAhalGXcvCaDL7pVAUEMh3rwdCH4HsTMb7b3hwcSQ9xJSQFBBXQ4FxuGG/7/6/EW4jZPQ+DFzRlD15wARlieDIdQ7P9o6N94TkNjuxNg+o7AyNpCeiy2HmtqMN6LGsX7akZUnO985aLsJin9aIGawFM8HwGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4zCmqbcrVaLh4FbOu3F0tIKQbNglBJFopb8qzGqIts=;
 b=bg4P+ylP8STo+/A7FHwkZgZ+OwS9GfrYUH8op/S/oI4iYxrAOw23HTwfFe4jcAHvfXpw2UR5fP0xNLfx7ASic9F58/1zBvvMyjCKwVmoaa0T5F3LyaW4gNx/80h5n8ZNhp375pqM6jPEBQNhpElToUlS++vmNDSEN5tViIF8VRwRYHKTkZhkqX3s1RzAjYpgEKvJG3CEapfXue74EnnQmBrtvV0gk96Ehri5V0Ls7xTpSQkrE1sYS6ECJi2jsLyqFLtr1P5veMyDHzK4b96gR0gJz59PvkJ/3nZzMI/mORnBEE+F2vx/141+fZScHTjGf1KVH3PWsPQ45f7zULc+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 18 Nov
 2024 08:20:16 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 08:20:15 +0000
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        Steve Sakoman <steve@sakoman.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: Re: [scarthgap][PATCH] binutils: stable 2.42 branch update
Thread-Topic: [scarthgap][PATCH] binutils: stable 2.42 branch update
Thread-Index: AQHbOY/d7B/JaEYywUGp/7iSsaZfOrK8sanE
Date: Mon, 18 Nov 2024 08:20:15 +0000
Message-ID: 
 <LV3PR11MB86028FDA769516293301ABF08D272@LV3PR11MB8602.namprd11.prod.outlook.com>
References: <20241118075944.1914998-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20241118075944.1914998-1-Deepthi.Hemraj@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8602:EE_|SN7PR11MB6899:EE_
x-ms-office365-filtering-correlation-id: 491e8406-cb17-4a8b-aa4c-08dd07a9d4d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?9CMbCXyH1p1UEaLQ0G6DbHPuGxD8TOThQmp/1VVOSOrO73mU5LlBaD+vKqK3?=
 =?us-ascii?Q?HR+ExHFR6fnOSHp6n0NhM+AsphiccwBT7v1E4d1MESA+Wtt3KF6mRU9hTThC?=
 =?us-ascii?Q?2xIqeKFuXxcD3Pyx0untXu04vU7YgRvyq1gvjHFWNc3IdbLQC6Mc9RyaOAHo?=
 =?us-ascii?Q?lATxOnmN5+25QZLGGk3B5sxyqc3c2Nh8u0uf0jnMGxfoQXLj+v8l/IrEvlqq?=
 =?us-ascii?Q?S2zbNlLhNvlOOqLslqRganNVxWXr8GlpbXVsrJdHLTFx7fpQMT65mJhd9avy?=
 =?us-ascii?Q?00Ozyv+dtM7phEPcIcBwz3YD/ioTdEF8Hnmwr5i4GN8azDoDSupPncUiE9JB?=
 =?us-ascii?Q?ob1aERMcBcQpFxOwDFhXbeyd3z7DyGPFLD9TacxXjMLMvR7PZKVxD/Y5KaVQ?=
 =?us-ascii?Q?QU0utjOqmw5sBlfoVYCZfUeO34ePhYIfwqVf6F5COObcgftxa+T4u5kH6tMU?=
 =?us-ascii?Q?XFvjxAmb3UvLMXlRbqJYEtsvYOY/pbEzIy/a52HTt/tLDApeIdv0cu9ILgPb?=
 =?us-ascii?Q?kNyNYr35cUB7uLL/vxBvg42RzTaPx6HQpS/X9RdFx1XKG+DQDVh0hKrYUA7a?=
 =?us-ascii?Q?WMb+aIBw7Y56KVUkztnhZIMxmXW3TenK+R6vprsajbw4HCCVVwjwTSQ6Ygrl?=
 =?us-ascii?Q?RJBUcsTUhKoH5RekOccrzhFjg11vxbMwEiQJcIt8NIjEuF7RfKWwy+fvxw11?=
 =?us-ascii?Q?ifld4OgxO0xT5VQu0ZIzhHuegAS0ceCYb4YkviBVlpCEGVo94sjuFpvVM15Q?=
 =?us-ascii?Q?cGQqSLAWDjM/uGP6EJvmJED5WU78LivuTcChc4cUJUCTcpyjcVQETqqgQoXt?=
 =?us-ascii?Q?l5Jxbj47dm5O5G+8bJt0Mj6Y9AyyeepNWtrhCJhUCI375565hSs2bDyQ1Zlx?=
 =?us-ascii?Q?El1tvW9AKmhNQEU12vLPUSnildncIlSYJBIgMr3FmEsRHbofQKcwJdyQrQim?=
 =?us-ascii?Q?BOfaZfH3RpveaQAi9Y9k0ZhVCYdfzWwktHK8FB9489/kXS3pbC1yvvvYVcBv?=
 =?us-ascii?Q?LlnlyuCepMVnPKB5c07ZhSBYDHAvUrNmVoIt7sN4nMxki46Q7oKMChnMyAwt?=
 =?us-ascii?Q?xQ8g+SQv0SG9lUal2wkzWqh6F3PgZnB50Rc1aSqKkUPokcllRqBIVhEym3KZ?=
 =?us-ascii?Q?wkTsPx04Tq2KEsNs1nlwukVt6vfKQ4zAwQvlI86nTtcuDzzPYy/TZ4OK2i7q?=
 =?us-ascii?Q?ycMkXciELZwqVAY2fjsNcEjHFYl2vlHJ86UTfE4EkVba23fZKBSRGeQpNie8?=
 =?us-ascii?Q?cykipq1SWjb4T5q4L1UuG+/KD4PjVKoYs2lWre18h3OdUGLVDsPK4PgMUj/8?=
 =?us-ascii?Q?da4cX7ueEDv58+ngM7obOnTQ+OiNpB6SdkpHXlGrl95f26Bn3JGjS1+IjWmZ?=
 =?us-ascii?Q?AaDNh/k=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?K5++ooIGY/OqvQSdeAsUJk6MLmzI/CZ672RZv4mbrN8V/g/uAhkQNnWaFfjX?=
 =?us-ascii?Q?Df4p7ZD/6pYCsYairAmWYkPC6iy0A6/3NNW1ear8HJGZw1tjPJh2EnyWTPPI?=
 =?us-ascii?Q?D+LtxcyR1f9/WHW86EiJ+iFd0bovncYTst+y2hHBlzkzc4tJ7eGffYpYJxB/?=
 =?us-ascii?Q?ko0LBRWALPE83jJOoS7wGeKwyttKm2RZkkCyfrfmBm7EggIbXHHispFsNtdU?=
 =?us-ascii?Q?tUGestiE/ywHKC5Aq67v+sL6tHedC987PbwUTmYQbx1q730Lm6e+QEn1IGXo?=
 =?us-ascii?Q?LKF8hJx/sJMj9nV2WsFqYkX8SwqD6gKIjY02BGb1B4WiFid+wYZW4nZKfInh?=
 =?us-ascii?Q?IdToTcArSYQhZhD53OGSyKwLjirADiR90YVoZrVw7SNPQAFDGhiIj4m4p8hr?=
 =?us-ascii?Q?J6v2juNJv1Ku1Rwo1TnBdSq/SiU6o8lk87QEYAZqzmDIBbzhnzslTJShQyvn?=
 =?us-ascii?Q?5RlE+Rspwj+2BhTjApmfkVB2ayGQF92JmCMy84hHCFwbX1a9NYelE1FDno8+?=
 =?us-ascii?Q?5Cqd4KZJC2ct4dwNY9xYdmRLr9sBucRbUzKmZ5oSILWM4bH7G0WS9g0sMXid?=
 =?us-ascii?Q?hXAqJJmfslvDk0DVCQ6M4I6mzjkBfEt2dKy3XpVHchHv9pi7V4ina3t7LI79?=
 =?us-ascii?Q?DuaQOau5tnbKmz8V856dQlYttkWUGEqn+6ytfiMm4t5JMflhGDc8xjZozkLO?=
 =?us-ascii?Q?n5wi83D9SKLspUhddtW19Ci6M/SUixZhgBAEnefcNZL3AiDHVXKOI2tBv9In?=
 =?us-ascii?Q?o13mrz6Ca+g8o2dD+Dd6w1iA6RBEbGlOyTWDAqBuen9AghSX8bRjwGHuQ9XE?=
 =?us-ascii?Q?anwU7be7qKsE2R82OVFKJ2Lkyat1nXI2xreOTbMGmrC6YwKUyM2/UiE2neny?=
 =?us-ascii?Q?5NCX0SuKex7FbZjKgh4DqtXJLuxUp6LQsaCFVKh7DilOuuSK8ZtJy2AeevPF?=
 =?us-ascii?Q?TnLMwrEDaQfDednOEgkzuQAOuDOJVUBJFVxXMigzcYBy3g/BKH/5hLpmctVM?=
 =?us-ascii?Q?Xq9D+mzAiq2ZBvarKzfOnxZeaN+ekxSWkm27M9bjCWVmfXK5Hop2fVLPVWfw?=
 =?us-ascii?Q?9zK4g/eK8RpxB071qN3oSrbSXbiH4gBVFOP+QYn0jZKvmbms3I6ossGEIUaC?=
 =?us-ascii?Q?P9HFdAKTbmPus2y429QCYP/ZYYVUW1dRvrcKJc4oM42sezWQuzzfUYnHOOqL?=
 =?us-ascii?Q?Td86OPOrmvhtVUdC3wcKjY4FxxsZSshcDvSUjsPTx1rXvsKDdu3p65ZHuJvw?=
 =?us-ascii?Q?/VPr86w8dpNWuoGRhwETBO8TjvlJ5OlVSDpV4CbwJ2IFP/ULmLPIL5vkOtr4?=
 =?us-ascii?Q?M68KJoBZ4lOY1UJQ+DNl2gfVMUDsUQvZznRc9M1kHhV98ZAD3we1CY9u0n3o?=
 =?us-ascii?Q?8VKdp1DpffKraqh+6xuOR6RoUjorchylFLW1CX3vk+cgJs6qZQbySxEJ+5Ur?=
 =?us-ascii?Q?eHkdtBlHPlnXnkYAFdhoyLuJ4UiMqzdQKQRjeL/KYICg0RtETQG9P8d5beVZ?=
 =?us-ascii?Q?sZF5Vm7hggVUc8fchUN9ltSc0qWHccadLiQPeHNg8XWSFuNS4FXhIEpDtdMD?=
 =?us-ascii?Q?n+e/zsaQe4Txk7TTlbO+ZuVxoyWXEl5JfkWYz+4X?=
Content-Type: multipart/alternative;
	boundary="_000_LV3PR11MB86028FDA769516293301ABF08D272LV3PR11MB8602namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491e8406-cb17-4a8b-aa4c-08dd07a9d4d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 08:20:15.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqXuIXk6E1mDZTxNAeDRA9qDNIo5fU3Xd3ot3FCIvPpsW51Qf+CuvssXfJiub2ieDZ6knhEguF+k0QcplmOYbUprj6IdURWXGyLwTLh5atk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
X-Proofpoint-GUID: WWnhAe5AVuvhR0mvQ5zTjgRFnZuq5y3M
X-Proofpoint-ORIG-GUID: QjM1XhUfyHUUroPfG-uGK1lbKK4kYoIC
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673af8c3 cx=c_pps a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=FfhRzsGo9bqwED9LteIA:9 a=CjuIK1q_8ugA:10 a=j-m57Y5iGOMaksL7:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-18_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207210

--_000_LV3PR11MB86028FDA769516293301ABF08D272LV3PR11MB8602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Hemraj, Deepthi
Sent: Sunday, November 17, 2024 11:59 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Gowda, Naveen <Naveen.Gow=
da@windriver.com>; Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: [scarthgap][PATCH] binutils: stable 2.42 branch update

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on binutils-2.42 stable branch are updated.
09ba78f0513 LoongArch: ld:Report an error when seeing an unrecognized reloc=
ation
00abcf39930 s390: Add arch15 instructions
caf72067a77 s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt operand co=
nstraints
543a22c7ee3 s390: Simplify (dis)assembly of insn operands with const bits
7c94c87d463 s390: Align opcodes to lower-case
fffb4fae823 s390: Flag conditional branch relative insns as condjump
2d238ecbe50 s390: Use proper string lengths when parsing opcode table flags
10d0dd2ba2b s390: Whitespace fixes in conditional branch flavor description=
s
10a143e273c LoongArch: Add elfNN_loongarch_mkobject to initialize LoongArch=
 tdata
9055fbe5ffb LoongArch: The symbol got type can only be obtained after initi=
alization

Tested on qemux86_64.
There were no additional PASS or FAIL after the update

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 5d5ba3d6dc..bff97b50c3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d=
_?)*)"

 CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version 2.=
40 and earlier"

-SRCREV ?=3D "8a6764d35e5c15d78de8aef8f27af3eefd9d7544"
+SRCREV ?=3D "09ba78f051319e8f8861b26fb9340e21ca973c70"
 BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=3D=
${SRCBRANCH};protocol=3Dhttps"
 SRC_URI =3D "\
      ${BINUTILS_GIT_URI} \
--
2.43.0


--_000_LV3PR11MB86028FDA769516293301ABF08D272LV3PR11MB8602namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hemraj, Deepthi<br>
<b>Sent:</b> Sunday, November 17, 2024 11:59 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Gowda, Navee=
n &lt;Naveen.Gowda@windriver.com&gt;; Kokkonda, Sundeep &lt;Sundeep.Kokkond=
a@windriver.com&gt;<br>
<b>Subject:</b> [scarthgap][PATCH] binutils: stable 2.42 branch update</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Deepthi Hemraj &lt;Deepthi.Hemraj@windriver.=
com&gt;<br>
<br>
Below commits on binutils-2.42 stable branch are updated.<br>
09ba78f0513 LoongArch: ld:Report an error when seeing an unrecognized reloc=
ation<br>
00abcf39930 s390: Add arch15 instructions<br>
caf72067a77 s390: Relax risbg[n]z, risb{h|l}gz, {rns|ros|rxs}bgt operand co=
nstraints<br>
543a22c7ee3 s390: Simplify (dis)assembly of insn operands with const bits<b=
r>
7c94c87d463 s390: Align opcodes to lower-case<br>
fffb4fae823 s390: Flag conditional branch relative insns as condjump<br>
2d238ecbe50 s390: Use proper string lengths when parsing opcode table flags=
<br>
10d0dd2ba2b s390: Whitespace fixes in conditional branch flavor description=
s<br>
10a143e273c LoongArch: Add elfNN_loongarch_mkobject to initialize LoongArch=
 tdata<br>
9055fbe5ffb LoongArch: The symbol got type can only be obtained after initi=
alization<br>
<br>
Tested on qemux86_64.<br>
There were no additional PASS or FAIL after the update<br>
<br>
Signed-off-by: Deepthi Hemraj &lt;Deepthi.Hemraj@windriver.com&gt;<br>
---<br>
&nbsp;meta/recipes-devtools/binutils/binutils-2.42.inc | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc<br>
index 5d5ba3d6dc..bff97b50c3 100644<br>
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver=
&gt;\d+_(\d_?)*)&quot;<br>
&nbsp;<br>
&nbsp;CVE_STATUS[CVE-2023-25584] =3D &quot;cpe-incorrect: Applies only for =
version 2.40 and earlier&quot;<br>
&nbsp;<br>
-SRCREV ?=3D &quot;8a6764d35e5c15d78de8aef8f27af3eefd9d7544&quot;<br>
+SRCREV ?=3D &quot;09ba78f051319e8f8861b26fb9340e21ca973c70&quot;<br>
&nbsp;BINUTILS_GIT_URI ?=3D &quot;git://sourceware.org/git/binutils-gdb.git=
;branch=3D${SRCBRANCH};protocol=3Dhttps&quot;<br>
&nbsp;SRC_URI =3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${BINUTILS_GIT_URI} \<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_LV3PR11MB86028FDA769516293301ABF08D272LV3PR11MB8602namp_--

