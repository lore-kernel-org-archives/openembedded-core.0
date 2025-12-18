Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44ABDD6ACE7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 11:12:14 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39540.1766056325204121592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 03:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=m7+v8c1t;
 spf=pass (domain: siemens.com, ip: 52.101.65.8, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUASoBRXh75PlcpTVTj0ee7/oFdVJkCHJEdknaSEXgtEq9IbtHHyOOUzNDe35QvgFHmcC036IT0eN+Xv+RY3cJb2ONYqOTw8FjG8TvMNqKdpDvxBn2Y681/U2b6MsJRuGLLSAVWrLbUtrV6YZBvCmVa/BxsVf2k0b0yfK+gnIgsWAuK9euZIiZinZz2k3rWZtiplJxupg/iS/cLXSbAq59+JdS+6X6X56G3obHda7dQ+o7EwpZEaquakDOzK09a8jBZCUdZgn2gWoUMP9NzyH7uDaqJ3FjjF/olYfx9I+gPUZ4BBmNyzjiXm9EngafiRTvKhIhOK7XS6gS8G3w5Aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWHddlXDB+2kSYsRwxyREiNdeV+LfBSpQ7eq8VO4bYc=;
 b=WU1krPmVbMNSoBGERBtpiHJwX8Ql1SbeRRV198U8EQS/bCYyGmMwLl6e8k3CYIL8EuW4HUDbvhzEd604I93eHOgezAVTJW7IjDeL2/GAy4JlLgLxcsW2lsybj+aZa6a2iUj8Z18GtRRdfBSzRCEK3rLhVH4Pfi5qNE4msoXjiX38jYyovSLbH24vAmGhaz6sPDH8qyuXFFSjWLmM2JT4m3UOi0vbwkBTwJw0d4btMKTb5pNsCU/7uM7AxAhB7fiWs7k9liz+67C7oS2Pf0x4ySNQ6HcI2LKvY+l8mKFOJPle1gsk3ZAjy0jMV/ULJB3+siguj5mhPe7SmhDE9ZIdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWHddlXDB+2kSYsRwxyREiNdeV+LfBSpQ7eq8VO4bYc=;
 b=m7+v8c1twyN1+c+vaPvVlb94dwPgjhjhwer8Ciy2LPPj69onTozRdxb7x6wajGM071VjhrFX1YPz+0sPPixqtx6a2+ZzhaiMK4gF32TBjfU1NM4V4vEWPgo41qsjInpYeL2pCgyFe2Fj8k+MGHnQw/RbiteJrbJn/UfflN0BQOIN0t9ch5UqqZQ3SWEOjtTshBZsY39H70MHys8kfsjlbT6vhH5i/+N5mZ/FhZjfG6X7eaAowVkU/YkkGEMuVawtl1J/HVi7p7pvXOwJpSwvYQ1Tskqt+DSwQ2lKEugORRS2EC9IbKxnA4CloLQDi7GU7UvA22oybdLKS1a9LvPebg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:12:01 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:12:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
Subject: RE: [OE-core][PATCH] libpng: upgrade 1.6.51 -> 1.6.52
Thread-Topic: [OE-core][PATCH] libpng: upgrade 1.6.51 -> 1.6.52
Thread-Index: AQHcZvGtgPsDEFeGQ0C1NP5z2GgjeLUnUEEA
Date: Thu, 18 Dec 2025 11:12:00 +0000
Message-ID: 
 <AS1PR10MB569724860A7B6F02E44BBD3EFDA8A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251206204824.65370-1-peter.marko@siemens.com>
In-Reply-To: <20251206204824.65370-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7337dc41-f916-4916-a3d8-409e9f883f84;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-18T11:11:34Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6002:EE_
x-ms-office365-filtering-correlation-id: 67a7ab7c-fb4e-4a35-e474-08de3e2643f4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cOHL0bArIIHTVXB5jbE/FYACRHRmt9zclvNiF4hxMjjKysCN2EMqLqpoBjIO?=
 =?us-ascii?Q?MPkF36r2/Ajfb9uOTScF8Am7kTXOxnChSsIDz2u/XRy1ZbuMRMGkauRDsDnj?=
 =?us-ascii?Q?QwAw9R8F8LUMnmBPNGP8TZuruRBKGXz3leigYFRu7jCmwXZ7A8enPfnnJP0L?=
 =?us-ascii?Q?FQbnODPWwV09R0ipBDCpNQ0irfLZlHj0U2RbtzNAtAbFbb25eJ9QAIXZsPb8?=
 =?us-ascii?Q?gbTRiu5XnARpXTchcNyFzqUTIW0k5iAvV4PfEdiaWRx6yHZwdAgbFzev6GqS?=
 =?us-ascii?Q?yaIoqTADDIdTsuI8Y5ey12OjuLjdvg+JwJctxVp4yUtAXjs4Cc3btj0OoXLs?=
 =?us-ascii?Q?/yUkQTUY/E6jpISnJOyXeiRQ8l+44s4O8h0mhB2WFiXhV9AkEn2KVUw/CkUn?=
 =?us-ascii?Q?ZhUgwubSIsn+WQjGksETLxDePCOOoCji9RTonZcL2YF8rZLzQu6l4Zo07YIz?=
 =?us-ascii?Q?YtzJK4K8+HF9Dqa6/Hx2+7W1FYACwuZjGsHgcIyNMCb06AwrRF/IqHNgo48F?=
 =?us-ascii?Q?y83OglcAZ8OLCIOVXcLQVz9Krec2GPRPRjtqKEudlPl+Pf3yTi6F6uXRhz2p?=
 =?us-ascii?Q?BDpi/Uv92qkw/39wcLRQpD6mhzXPwsxtinO02+ZTM7l36BKRtlNDylATX6i5?=
 =?us-ascii?Q?nlxkW40cwhYFAB3pW2o1HRTAN+mV5+cQG2trqlz0iEbdwskumtSawisggnXU?=
 =?us-ascii?Q?MsgnEGeCi5fO31cNCMyfBeUUPaY8/lT2iDMpcLuASi2tWZ9nsEFbUxgaCGOt?=
 =?us-ascii?Q?8GiTKw36urQxEtBdpL13dHOQrYtOVh3Fn86gf9paYIF/o5zaZ94h1jdkNxOz?=
 =?us-ascii?Q?PNrquQGqfBu24UOjj/zY6kMFcTPMwvTgg+HLXvx1iu4YYHUggkBj8SRyZhXs?=
 =?us-ascii?Q?sFf5f2G8cv/a2i21sunuc9LdF59roUDcmoaqex2lrSeN4xEUaefQwMdsOcF2?=
 =?us-ascii?Q?Dw46NRtoqUP3xDGzhYfJartHiZcWTrgnRNfjWnyBtu31hytGHYrjCGhiY/v/?=
 =?us-ascii?Q?TV47UiuYoQ4diwcWZSDHg4wSQcCPbZT8yzwIyP2EcWSLjZF6sqhqbZou+7qP?=
 =?us-ascii?Q?Qwve7g6mcyAhMMwFH1+qwuc8k1zVueujTPTwOEC7tuFerb5fbiRQztZy7nQo?=
 =?us-ascii?Q?7Sgs9BExj/m2snA4muSWip4m8I2C2gMPLfS2tUs4dQqafilZxJs2aBO+koK4?=
 =?us-ascii?Q?nUT7QQ6EXpgXngnmFIwJWT9FNPs9vlsKcMwAz12Plye0tf7qL77M9MDG1ZR+?=
 =?us-ascii?Q?kjCk5XEwI02G14+YpNgDpndAPPJM8gHqfpBBkkaXqi5mpvYxONSWMbNDKTVz?=
 =?us-ascii?Q?8REnBAreWdzdpxy/XuLV46SWQQJMWhsXP81zjz6j7a8hegjlINxptcOQd7jB?=
 =?us-ascii?Q?7fhA3QOL0NwDXtO9+ledQbeSqIcwEVkfWYy6qQ364eC7K//VXfaElEz0oX2Y?=
 =?us-ascii?Q?QnzqQxdn1a44Wx3UOJbdJmF+Rb8TnVsfAFZ5RVoGd2HpmAZRMipUcHhBl5I5?=
 =?us-ascii?Q?oOPCJcPTJqjBoYbwnKUO4C44e59R4VoCtEV/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oOTQ4EUimcaH3Dn3oZn5KBPbj1vE726cVgeY11igod9wDajHqY8ECddfMPc4?=
 =?us-ascii?Q?bPyAipvuCrEK+wF4y+uVD6QW7OxT3EjhMUJFTTawaGJt2PMmOlADmn2cweCo?=
 =?us-ascii?Q?H/ZynXvCyegW/3mJi+meFfR1QGvHaihhJm9lpt7jK/oBvm0e97OLJTQkic/f?=
 =?us-ascii?Q?JLAeR0gR9IWb4P+MGxXqpot1sEFedNKhYC37GvWV7sLAB23rxvRsVAPWIt08?=
 =?us-ascii?Q?Zgck286qRkO4fpytPGxUP+gOuqRkUtFWDTEBu31rGYxm1YNRibifmWWIIwJb?=
 =?us-ascii?Q?tQKTdCBkzdS+IAGYwUaH8++LxCRSceIuE9S/GeBxkGnUGfypKPtHo6rmGCfM?=
 =?us-ascii?Q?Skm3ISO9Zjstj4hdH8c2g2Y1ktuDNqOZsyqryWtxFPCLeY7+jixRWlBiBoSK?=
 =?us-ascii?Q?CQ4tX2TiuGMYnG/rHDue67MaGebxRLeJE37ZDtEIDrDYSywQnjVMpBzHihGX?=
 =?us-ascii?Q?7unBj603qcsSEdvkspM5qAAORz/x03GwxnLnDdS6vUDeoMOtcg5YI/BNO6Gg?=
 =?us-ascii?Q?48O3FmUcNpxsu0jjY0n5V2lvxPyD/TzWIl6r6UGOQDEGLbztmcNoca5FCCLl?=
 =?us-ascii?Q?Opv7DV03VPIaizy/sR4jClGXajm+3mKMidX5GZaIlxcD2H/W3X5b1gAlv4Xo?=
 =?us-ascii?Q?Z4u5S44W0Z02+AvH1XbZgFo3pCCJyHyY04vaOeaHcKYqj9PLCK10AGdj4ypg?=
 =?us-ascii?Q?U2gGPChPahdKSRfWPsR09TEtkoQEo1hjyI/NTzQy2gFbtwijqLxvbj7vJqXu?=
 =?us-ascii?Q?lBhOSIC/SiDFiCW4VJus2gHfhawFtxUBv9+IOo2MrOzZAz0/tvD34zj63XNb?=
 =?us-ascii?Q?5Komi/sx8Ypu5ggCeXOMN51S2pNOWMfnGl3bPVi0wrF1UpPP7CEdxBWmJMJX?=
 =?us-ascii?Q?mIBCE3OTqJcruSBuVYEYAWtJHq5rGopq6rnREfgU1rlMLK2tkdlmF0RSTXDG?=
 =?us-ascii?Q?AHkXU6CLL6sEnmmTSFQtgpN3o5MuNsfeh5zFLiRYsvfD4xftMNEETIxlhi+H?=
 =?us-ascii?Q?0MLjqpkcOHpwqjoJQhFxaY6E4NsCuxeMQSxdCNjBicod+beMIkhENy8/JcyL?=
 =?us-ascii?Q?9quoS00Y2sDTokyvqwk8UTMN4DJQaHTnyxe5JMF56CchmTtNzWtTBFL1j33D?=
 =?us-ascii?Q?KrLouzBXdrjjmLXc5vvPXZcUSgYDkH5UrvBHaIOuX1VGG/6MJl/4/Ap9LW47?=
 =?us-ascii?Q?eZYaVY6utoUIpW8BV/E+ZQhtet0YhkMbFrAUluG6HsyprnavGpTsh7UuauSP?=
 =?us-ascii?Q?KcEBIKic49NssDB+LZUnsLLQNIcNdsZvy+4ELDn8muqH2lIn0s8Xww9wYwZV?=
 =?us-ascii?Q?vY9+Xdhw7FGzeKhhAoF64AmH8rd2edPp9vep5obDsadnO+3DGA13b31vnZtI?=
 =?us-ascii?Q?ytkhrMHFQk0Kuvh86GATJ2HbQMU5GuRWU30RAMjSE8scoTZsA+w0v9eNLvmh?=
 =?us-ascii?Q?okYSJqO+d9i0FKgywCLVoxhc6/ijWVn8guvDwHyocKMY3CUzGdtRnn9tUyTm?=
 =?us-ascii?Q?yD30o4Nrz5rO4uomGB8YolG/BO4ykz1PGpsPyLAgFZWzbDvBMnVtbZozq4vD?=
 =?us-ascii?Q?uWK4Hcxykgvd5t8GP2hezoR1jKG7+Hdx2V+D8PX7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a7ab7c-fb4e-4a35-e474-08de3e2643f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 11:12:00.2557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tgLgEhkR3bXMnYFVc8pvvuWLvVg4iTUYxL/UIat9Xcu2SQckYZEwgQOeLNwPaHSuoVMsgi3MJaaKQis33eh8Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 11:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228111

gentle ping

-----Original Message-----
From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Saturday, December 6, 2025 21:48
To: openembedded-core@lists.openembedded.org
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [OE-core][PATCH] libpng: upgrade 1.6.51 -> 1.6.52

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-66293

From Release Notes [1]:
  Fixed CVE-2025-66293 (high severity):
    Out-of-bounds read in `png_image_read_composite`.
    (Reported by flyfish101 <flyfish101@users.noreply.github.com>.)
  Fixed the Paeth filter handling in the RISC-V RVV implementation.
    (Reported by Filip Wasil; fixed by Liang Junzhao.)
  Improved the performance of the RISC-V RVV implementation.
    (Contributed by Liang Junzhao.)
  Added allocation failure fuzzing to oss-fuzz.
    (Contributed by Philippe Antoine.)

[1] https://github.com/pnggroup/libpng/blob/v1.6.52/CHANGES#L6307-L6316

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.51.bb =3D> libpng_1.6.52.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.51.bb =3D> libpng_1.6.52=
.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb b/meta/recipes=
-multimedia/libpng/libpng_1.6.52.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.51.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.52.bb
index e499f61ff4..fba6e77b1c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/$=
{BP}.tar.xz \
            file://run-ptest \
 "
=20
-SRC_URI[sha256sum] =3D "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a9=
0b8aded192bed2"
+SRC_URI[sha256sum] =3D "36bd726228ec93a3b6c22fdb49e94a67b16f2fe9b39b78b7cb=
65772966661ccc"
=20
 MIRRORS +=3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCE=
FORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
=20

