Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB496E77188
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 03:36:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9683.1736739409232813488
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 19:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31087dc864=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3EJjT009603
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 19:36:48 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt7175t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 19:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x10hvmSyqGWLSeJwNwUsd3m8bv6BTdhrXLin5oL7jUb7Ks44/4AsaB3m5bKYhny0PR68Rq0umeJcl0LwzbF3NRBMwsRMkz9OV+0hTRR8QQfu9dKt8lvTCCQdyigNbW/PmLz1jZr7gECcWaujyiHOLaPob2M5M2HA8EXLKAvckbsXn5VqfkDwafoCGnJ+ssWz6CMdJIEXhfvvagOR6gDoaQJqmEzk1js0M2j8rnvG5Hpg5FOo9pr+f5VEp6XeSTlmIzpkbqs6bi22poAUN0EFoEiKBhPu5PRRE4ME+ZNg7OObeRHZXsQ1Zbgs4uYANDB9Al1Lo+EBysSODq3zt2yriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvSuoQ7XgL+qoxYJIqG7tBGD/b+UjpE/SHNgVTMlM68=;
 b=llu7GL/M8bM9TMxUe0XZ5Da2688f35/xWVaqgOhr4n4+FIGQwUcTBuACNEKmxZfdZ20W/K/py37aVmPFPJbu71wCFZXB++s4+kowoLD0OdJyHvpBgT3uklBquIdk/JpTgVLmriiiJjHVvTu7ushqOYn6gXKC5JXCMm4qo9x+EADVixZxyGZ03VMZLgQOj5/srEk7foZI7O3q6x80A51ni/YDdoNRUwJd6FCbu5M9KdiRH1ZsEW++fSdCMgmOOiP6MSd4WHh4+Wg633ByAme0dso2MlEWu2QPvUwBHaaRawwh3c8Tdm2Q8CAzwuwR7OSPx6bhA3u4gEdbSnH6q8oakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 03:36:43 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%2]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 03:36:43 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Li, Changqing" <Changqing.Li@windriver.com>
Subject: RE: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error
Thread-Topic: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error
Thread-Index: AQHbXY5W2nKiPMhdiESqUfJGtEoq4LMUHRfw
Date: Mon, 13 Jan 2025 03:36:42 +0000
Message-ID: 
 <PH8PR11MB692814CBFE4AA3DA53E554A4B81F2@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <18171087FD41F9DB.21892@lists.openembedded.org>
In-Reply-To: <18171087FD41F9DB.21892@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|DS7PR11MB7689:EE_
x-ms-office365-filtering-correlation-id: 8cde52bd-5139-4686-9a0d-08dd33837f89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?eRGy/VpWBvmyuG3JVT1pWq0LBY0ePcGTa9b/RA3RXioYTIbiOOWOZQuWTBBy?=
 =?us-ascii?Q?YX6FPleyBIHUvJsSCJXwSOKmiO3WF1dFIZdOM10eYhPXdHoCFpaqFf52ssiq?=
 =?us-ascii?Q?g55q/frmrxJP1G//mJlDnOLgburrG705QxOn3MKZR6kasP5vOw13G1Q7k7/X?=
 =?us-ascii?Q?nb6CODeKwBeMAs+C8n+/VpS5RIrdgXdKuLwULtxUzdZguhWPKyivfMICcKWy?=
 =?us-ascii?Q?O6agglvWNdnEX1cSYacIZRtmG4VOQGQ1v1eOUF9nTP12zgwZ6eVScJIBTEh5?=
 =?us-ascii?Q?5wl/c11OyrArK9t32Ca9g8y3Bkz97MqIX2+QePfOYHnlIza4S/sRDCWKviMB?=
 =?us-ascii?Q?0jQFQwttSGkRTiPoNqIVLlaenNOUsvpR9WHPRozJt4lRpD7PyIKvHiuJ9bb1?=
 =?us-ascii?Q?fvm+TZAWph3E36Da1trN9zaXoWkTsr16t9KUOwJB8uUVi2JYJqGv7kjcDeK8?=
 =?us-ascii?Q?32BNBtQ0ZJXp9m7HvT7BINNVuZN9SLKqsywHm/j7TuPvztsvTelTroJZIgc8?=
 =?us-ascii?Q?z+rgQq2TpMxun0PebQTN+RMmw/4k60DJaDBkPQmyx2is13wxFVQJuNQLU4wJ?=
 =?us-ascii?Q?n5f9+JXaOdcz7oMSzLgz64e/3Ikjxi95k7k0c8pB3xnx3IwS+p6meqXoZGLE?=
 =?us-ascii?Q?S+GhN2cpHWSYx3GYkAceDYkoqeGeoIwsD8MeZPC0qpy4hpmD5Fn3coBleq6n?=
 =?us-ascii?Q?871XgAdOQr4HU987ZaNoevcf6strwZpBsbrrQWOBZIwbPo5RHMQfKbAmukFO?=
 =?us-ascii?Q?hgRFuXGqSBzghvmC7ImCqT+AprefQ3pGKdM8HyizPsKZRwzcFDCQvIprnqAe?=
 =?us-ascii?Q?o5U/Oa1KdKWCP3gWyNwgWUrdQGoD3YoOB96+nqwzNT23ein9tRap0nvwTgZj?=
 =?us-ascii?Q?6RkKU/GLrw2Jna5YIeG7DIS44ASyvW9WofPk/fjBshL3FgG4FpcuSh3IPqDj?=
 =?us-ascii?Q?iPIQib99+DGPgeaejnteYTiq+SDtHHERY/OTnGQXARAeEvoZFFd1SAyhhn91?=
 =?us-ascii?Q?Zn0kbv7/WlFdkWNZipeuSRCFoOIkOfROXwljcMKdKamgO5znCn3ut4BH4ofI?=
 =?us-ascii?Q?awkKoUGT2KWHKEQc3BunzC+G0puiQPXszOHIOCUeyoKlFq+/9ac3+qF4W3eT?=
 =?us-ascii?Q?nF9TMNujK+m4fHJCMzc/fGEEJz4ctVdu7VQ+Hx2Mzw3GGs5zvumXPQ37JxiI?=
 =?us-ascii?Q?/kqndh1GWkeuarewg0jub1SxxMfpZwy88wvizppy94e1293nATLhygHcd1aq?=
 =?us-ascii?Q?ZobymmzJX1whPflU18vz1vEMysmhvn5iIonsjizUUgK01Hu83kqWlwfAhq84?=
 =?us-ascii?Q?y474tbVUcjrlIPcrvB2F9KLmOp/TD2/05K51YcGCxbe8xwCgBhKjuXtFSxHt?=
 =?us-ascii?Q?pATuvJrV0DeAOdQx8xH7HjSARC5HUFGAjO0uEtYlgI9k/oOdsQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hKaPC/HomFoARYhxxjOysnWcezk+EKxZu7CzMTnRQXK6eEeO+6vuhYTXn2Bh?=
 =?us-ascii?Q?vXP1jxHMOl/H8/SJZTp8zwZfXLovvDqVbltNDl4tvOaIoMqxJ/H7kASp4eRi?=
 =?us-ascii?Q?BKPjFgqbZY47zCNeYJQSNiIyjV2S4f87qUxyqDNad0Wba8E2BlqD+uX1+i4i?=
 =?us-ascii?Q?GH1l4XsW8zzonrTl4WF2AqQPwFXLExiFBlMoSJ/1FhyL50Bs1XCFFxMzxBa0?=
 =?us-ascii?Q?x5z1YltV62NRsIo5KJ+4u6RU+Ad699PhRuTnLQrD4YyCRTipLDii8USyZ4xr?=
 =?us-ascii?Q?Yl9t2UL36pO51rKMyBBU/llw7fB30AsxPdLMOAsFik3caWYbyQBLcl55VrAn?=
 =?us-ascii?Q?Mz/xTor3IXUDsYX1rx/Ra7ZlfN0Xylkd2to05QeU1nrHwM0VbsIhH31yEuVK?=
 =?us-ascii?Q?X+xYpzbhpMR0Beh7x7jbufFqKsoKOCwVEAyqgZBUj3iLcsYMvFN4twQEifIr?=
 =?us-ascii?Q?a6EhMwLI4c4SXvGnGiaHzXdngwbmB9QIaOXNHVRC9p3rrpTebFVNoVup6lvJ?=
 =?us-ascii?Q?Yf+Yn4Wi9yOJ3PSQMgZluaR7qlElN2hs+ZaHCtTPVdUI6SRJ3meuUIJruIef?=
 =?us-ascii?Q?eKB1FcdkOUfz6lzWnm6pNkfbBtOeaUuPxMUgqkBmuj96ffGg9AjHB6MgZZIn?=
 =?us-ascii?Q?hf7kpaTnbY71EVzM9Jx0cTCe3e3eU/HeJuo6BzkSPXLUyYeINF/6AQAG0ptN?=
 =?us-ascii?Q?0QYlvIf5G0J/C/UFyMpOq1cvmu6nuUWUH+t6am5RV2b6oAXB/Yvq5YZR4loi?=
 =?us-ascii?Q?FoYvYngWXqB8zt4RU7j6N8MrzCBAzPqEKzgKeN0Osf8CDLcNErllKh0SDuuS?=
 =?us-ascii?Q?ASgT5i28YiqyTyP7D/DpTVIot7orjVbv3zFaMPVHHnAn0/gHdJJDAnZ/N/zC?=
 =?us-ascii?Q?cbyKA2+ScOD/77bJIAct2oKpUVFSa6Cn5lwwhtEbBDgXB5PfWnEbWrn1jlOA?=
 =?us-ascii?Q?mEg7ZsU9EJ5Qld3BMlaTiQlsRkB6bKw7GoLjGea0AW1yYUyGjfVQ0eqU4H3V?=
 =?us-ascii?Q?GDbMhOkzsrl5gG1IropPWer8XtZON1Q7fji7kEzKOAB07EDI+w/TkheSfnTb?=
 =?us-ascii?Q?ajk4bPPQycyJhDmJbmNhxiKe36SEowc55TD6SgApvbUKhrsQlw4m5h27lt37?=
 =?us-ascii?Q?eCVRwTkJV9j/LBzqm/4DTghDmkXr7D0VDAtUlxiosqQdt0YzbtD0OOzhPd2S?=
 =?us-ascii?Q?XDJrDJoNfLh9eu9+rXVk4fW0GMy+ASgLEaobQJoT2VH8+UVApcV5g9F4no1D?=
 =?us-ascii?Q?oYRBolkIFQrd7GNppvo1KhfER6JX2Ik0yE9zOsqgazw2f3r6xpVaJfd2TTB9?=
 =?us-ascii?Q?kx701dq4FJ2bJN3R8MPoTe33eWLXgx3xgNDcNMnNq28D7xM/mNNTl4h93x7B?=
 =?us-ascii?Q?hb6IgLDT5LbuplWcC9YLO5X8MjQ0YVQ80uYXiqyMq7B9K0YaZTkf2TsE3GrF?=
 =?us-ascii?Q?fZgguQTVuqzOKxrYJUSt+f1ASi4BU2GJTbRUyXpbGG8ZwQyu5EnCW00BeVxm?=
 =?us-ascii?Q?2DZFi8klPlQTsjBbTufeURJldfvjAtmhM14RhnH/SSMzs6PQnevrYQ24SK80?=
 =?us-ascii?Q?jYA52xIILYDMf4D82LoEFV2XR1ZHNW09sdAMBkzGzBepEyfCW9rVVVVgWSNL?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cde52bd-5139-4686-9a0d-08dd33837f89
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 03:36:42.9453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 67Acm/YZUnipOaejfM3R3J2zAQiwXApoYVowTbTCAvIuJ2yoH/di0ozKVV98b4FiHt1NAn9MqQM3Ybpsgfyy3RaUZylPVk+MQJPZX4oYfyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
X-Proofpoint-ORIG-GUID: 70Oht8Uryc363vY-Tu4rAentbZSupztg
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=67848a50 cx=c_pps a=6L7f6dt9FWfToKUQdDsCmg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=ovJmrJClAAAA:8 a=gvic6WYWAAAA:8 a=AIPdC31oAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=bLZqKDXHAAAA:8 a=qGZC1g6ORkK1xQXCNfoA:9 a=CjuIK1q_8ugA:10 a=brTEhlvMp4NY0_u118I2:22 a=PupUpSa0FqD61Tkl4dNl:22 a=5478VIVnyzLWgM9zoUhq:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=SM0NOtVXJcAQk9PFKD3C:22
X-Proofpoint-GUID: 70Oht8Uryc363vY-Tu4rAentbZSupztg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_01,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501130029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 03:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209700

Kindly ping for scarthgap branch

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Friday, January 3, 2025 11:19 AM
To: openembedded-core@lists.openembedded.org
Cc: Li, Changqing <Changqing.Li@windriver.com>
Subject: [OE-core] [scarthgap][PATCH v2] boost: fix do_fetch error

From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.84.0-r0 do_fetch: Checksum failure encountered with=
 download of https://boostorg.jfrog.io/artifactory/main/release/1.84.0/sour=
ce/boost_1_84_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
---
 meta/recipes-support/boost/boost-1.84.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.84.0.inc b/meta/recipes-sup=
port/boost/boost-1.84.0.inc
index 5bbea2ba5b..be1ad20f47 100644
--- a/meta/recipes-support/boost/boost-1.84.0.inc
+++ b/meta/recipes-support/boost/boost-1.84.0.inc
@@ -11,7 +11,7 @@ BOOST_VER =3D "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P =3D "boost_${BOOST_VER}"
=20
-SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}/sour=
ce/${BOOST_P}.tar.bz2"
+SRC_URI =3D "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar=
.bz2"
 SRC_URI[sha256sum] =3D "cc4b893acf645c9d4b698e9a0f08ca8846aa5d6c68275c14c3=
e7949c24109454"
=20
 UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
--=20
2.25.1


