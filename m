Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8845C87FCE
	for <webhook@archiver.kernel.org>; Sun, 27 Jul 2025 15:31:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.46])
 by mx.groups.io with SMTP id smtpd.web10.61958.1753630308488584479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 08:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=R+xyJNJq;
 spf=pass (domain: siemens.com, ip: 40.107.130.46, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjLaHNYiF319nyyBvVJMIHPpGStTUk1+N+1u3R9dOO5GMudkzrmojTWdqdeuAdgOpMrWeOFvKTouplweZNy+96ih7h6/4I3F6e7NRLItj+DyutYls+aygsV+2W8gZEf/70RylSOwhYUQTgUjYTbOJxIMR8ikjziozwYfB8+GllVG4nWztbZDBXQlw/ETC2/qW0Bz5Lx/gdGKVINlyf7T6IN1qQGJ0sPd0guR3aGzscbopbIxrblUra5L3wvYIltKaSZXtFd9s5lgKtcbDbsZPw1J7E79lojbwJk4c0U2ZjVElZVGQIg2oo4eglLY562w44KlbaucRygEoaDtjpoFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U718m/3iVraUzhxHn5zW6NOz/NTGaQJ5SPKKmm+PVEw=;
 b=Q8sDt1mi1W0JT3WEnXHPZXGefTb7+sYj8ScAZ5FV9bXowLVGRsPcojNdySyM3mue56/qAYX8UJrgbQMCWNxEkxCOXdnTYmSTOFwm7/ra353gIg1tQHuejEU6kY0Tt85j/vDwN4iM2GfFDO9WwBxUWGzVwN42yZpdLrdmJdvl9uwO+rVeIWOub9z2JMaag/0er0wc9f8AECM2hVHFS/UTH5ThPhZkhVSGkQG60xEDXavNfl4ucjQa3Z+AJLqBNznRiWty8RLgtywbVBdbZPlZxiUookGQXG9l2PfkyGx04qs12In4sTXRGoeeGBvkEzsp+apFdTmdeubvhT24AFcbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U718m/3iVraUzhxHn5zW6NOz/NTGaQJ5SPKKmm+PVEw=;
 b=R+xyJNJqZOhDAS8xCI9qmpELlpijMeAdPZV4k5wUR/1+qmyzTaImrtJDE6ZGiqsnPnBSGWu+0FgsdgCzCboV5zFDwOX3G8EWu9CuGoA+7/9f2jHNrBt+swOCvhX3qNRyo4IzFC2DFWIT2qe4LJkP2InY8uuGAjpD9XypXOuMBfr3byXuOEdgP3cW3lqZDn3nFfr0taLR689CSzSDoRXPm5YRsHPDHRY+18R0H1n16V4wogjb+EXeFjVpGhwDtSmKt7KhXtnj1sczJbTQu//cm8MIHnt4lIzK7i1sJFVde5CnN2T53Sl5re+ZDkWpo9HH5Jo8YVO4C4z6g21dA+YD6g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB6838.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:329::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sun, 27 Jul
 2025 15:29:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8964.024; Sun, 27 Jul 2025
 15:29:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH 1/6] gnutls: patch CVE-2025-32989
Thread-Topic: [OE-core][scarthgap][PATCH 1/6] gnutls: patch CVE-2025-32989
Thread-Index: AQHb/wsCRFuMwP0nmUeeC+ooMD6ycLRGGCHA
Date: Sun, 27 Jul 2025 15:29:28 +0000
Message-ID: 
 <AS1PR10MB5697D019FE1B1C9061E175AAFD5BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250727152658.3852964-1-peter.marko@siemens.com>
In-Reply-To: <20250727152658.3852964-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=48493721-6173-421c-963f-46fb38dac554;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-27T15:28:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB6838:EE_
x-ms-office365-filtering-correlation-id: 112c2272-6034-4024-c52b-08ddcd226021
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ZR4qYQAIzysXe+jjFa4NLgOV+KoxWqEgISwI/dDwsodbyGALUgK9i2IzA6Ld?=
 =?us-ascii?Q?5fc8iKZ53VvdlObBWlCjD6F5txHMQ9aYWKsexjGg4ZwXnKAhu0dNMk0G+8O3?=
 =?us-ascii?Q?+FmPofPNCWEGqWQ9jtYzzeROdF5wUZyRHLgs2NKuegGakhifCeGUop9h+Xzq?=
 =?us-ascii?Q?PfrgmnqnAP+MwMT46DpcZZqTgEFduVspQDGBFjS6YuEEOP06uJo8Hl9PG/Uf?=
 =?us-ascii?Q?f2ajL66h4iuuxoFYsS3nZJqN2Q5yMZK/1edDX+wO78lfTFiberdE3wlmmdc3?=
 =?us-ascii?Q?U1KEAjoKcDGgH391KzNweUOIrPRoTp+L4HvNBxufqTWkAFwc1aOUYvskj8A0?=
 =?us-ascii?Q?8zTDKjLFcWCGWTTRxco8qso9QFl4OzLR6rmMNXXntvRNR7JAXTsraQac1+E4?=
 =?us-ascii?Q?3FH7okVnES83e9MZ9TRj8gq1SIPOPv/jEb6YD68aaiQFboTfX4Nj/P1K3UxS?=
 =?us-ascii?Q?y8LIOaIti6kt5rQCbY3MUOu1qy9KAqAJAp2T367C7m7z0xfk9E/+60aWgyR8?=
 =?us-ascii?Q?DUWUWumqavjAD4MvpoykFW/W/AZXEmxOBcHs7UbGBAfGXbqtkt23T5Wt4VxM?=
 =?us-ascii?Q?xQw1whpnC0Hk0viB697b3B7/GLiSPsNL5gTqRjGpwWDBvjh+yvvx6fI22Jpj?=
 =?us-ascii?Q?vF2zb9uDB+5UHpclnJs0J+AObNG+9HW/YosA0iTEO40b95A7wCZEAvFB7eJ8?=
 =?us-ascii?Q?3EyzffBZ0BmfD2ct6sNX68aygPZWk633tSvRfwNHYKg2iaF0+mcsDr8G4GPd?=
 =?us-ascii?Q?JUB3Jry3xJmXrORm0y6P4RLh3v/MTfuhH139s4XTNxBL8+FSqVWZGDbLSHbG?=
 =?us-ascii?Q?NgNzSw2R+wniTYazwLONf9v71YCFPVrZ7H8CkQEPzp91zKcip1gksUORrJhx?=
 =?us-ascii?Q?njhVoe0BkRHrvJmCvCFCQgrtd28H4HgLms+HPmeUxQtao2WDHqlHgY6sagX/?=
 =?us-ascii?Q?kJ5MAYinY12V5RQTfqVChdfX6iOm994a2b0rLzPRgvGeZT8WaewXZkNL+cpM?=
 =?us-ascii?Q?TxLUzKcT9wJGmzMnSo1hy4mAP+oIvP9UQyVSGKRl7EFiEGXif7KUxwVFQLZC?=
 =?us-ascii?Q?O9CV8i6AWubjLB8D3iyDktdWdHqOZ5OY87KLAGhmRp0VC8hpNQ7opT37kQNX?=
 =?us-ascii?Q?VRa04sPFEyND9rAZe0sLRjgmPsRfa0CmmnP92ptkF+BrYXOgSrofXUrpTafW?=
 =?us-ascii?Q?9a6tejMG2T1pvIacz7P4vaqFE/6VVJ+gEL5H/ibe/QnfvXu99KOzsC7SSazb?=
 =?us-ascii?Q?PTOeqn6Gk1qNiZqvYY167RiDvTqovmoTAeVlgmjZHEo3YEvvWRnIVw8Lx9fL?=
 =?us-ascii?Q?Vl6Yeo0PkYZyAtY37TbNgS/hiTD066qdvAuBw65BuutfEz5/fpZIjZkh5FvN?=
 =?us-ascii?Q?o/Z986Bw0JyqSirAIszdgWENjPzDZLSmRA5o692ude/Vx0wvmVkbWt+z66Q2?=
 =?us-ascii?Q?hnjcv93CKIE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?53Yz4rwxuSPUoJAPZwZMJ4apBADnJvCDtzVsw2NuEVPneENhrzS7Lxt6CwPV?=
 =?us-ascii?Q?GwZRLadOBd9ptqaj75cEfSCFgiGPQoyDSEW+g5wD4L7LgTl7OMEbrP52Laag?=
 =?us-ascii?Q?1VRrpDryABlS9ZVPIrEFw9IHTufVWZjMnu99+bfqNygNXK0nHwHT6HUkfiLm?=
 =?us-ascii?Q?Y5eIWNStM/cE3idOOic2fjAIMrM1hhhxH6J05nI9cAoeqw9xDdWUrRtkCAUg?=
 =?us-ascii?Q?JDAcMROTyze90BScQvUmYdGNYBnN+Ma9GolEWlfNjY6dEMvPNceIgmFX7QgX?=
 =?us-ascii?Q?zrLAXSr9sqZ4WxaeB3k7mb3JIkW/42MGhKgLMDP3itJ+0n53Pvw9QMSjfL9T?=
 =?us-ascii?Q?bM4BXqqig8cpSpG32OFCSU7yZMIKV0D3wBcjBngeMsNsnepe1f8QkhyCvFi/?=
 =?us-ascii?Q?sBh0JA7WTa69IboNhuDBOhIXRmW11AWsale4OpvOTB7t1VkaNd4fxSYLw6Z0?=
 =?us-ascii?Q?YvWrUY3mQyEMSt4JzscWIDHjSACOIDuLBVmcu7SaqZ6d8cUtqabGMd45AlTX?=
 =?us-ascii?Q?6OFEf+HDWeBZH/eu85VDwnJbQ/A+18Anz08c74Th0nB+PetzEEDDyQxGwiut?=
 =?us-ascii?Q?9q8IXZ6XnVUJHbu8nepRHSPLlmL2dDiqctx0vihVomiBep9bFv5+cMhpJoj7?=
 =?us-ascii?Q?/uAlQD3ETTZpqO6P6W1OfzG9cXqEpeL8zW7+GoW8ZRtIm9mIdwl6Ymp2gcPV?=
 =?us-ascii?Q?QTj1vJMslRni72B/2yiq5havVG0WdUn0ejMbcK2Benb5fzP8qBTGT2hx3PTF?=
 =?us-ascii?Q?RUkrNmp5NKLz3O7Vq2AEgqcrZeNIjycz2haC52da4D4oT59MaLjjV9+IMKLE?=
 =?us-ascii?Q?21KW6YxwWjECYSHojsIAj2JOYDIe153rXD3lB3Cfx142kvd09q3wiJdkWt4x?=
 =?us-ascii?Q?mHa5b0mYQh4RvzpgibTG5XNYvypr8XUOCM6kIHmchn8B5aAngJ14yMX3zBEH?=
 =?us-ascii?Q?GslfE5dRxLY6KYnK/dYvpTaSk7UV/MXZNtAAUU3HSc+mnIDqNyelT6Yiwc6g?=
 =?us-ascii?Q?Lqr2EqTZ2E5VA8kcBgK/Tx5ZmQV10AtYVIJpOkTnV/aKLfrqInSuC60gvwi2?=
 =?us-ascii?Q?W/jMTyL8zvEMdXLel+IkWxlyg1/ta0qAL2KLfWa52+5JjX7CSD2jYiplMroF?=
 =?us-ascii?Q?cINgsGh+0ZRbLwUllYpYUBLBNNeRx8d2FPkGms/K1fu6sRMp52BBroV5uKB7?=
 =?us-ascii?Q?62lQft8/yHTUKz3cdItqR25x6KaW3Rc7u9IORhEzCWQXFCVRbQ0si+vlNEGV?=
 =?us-ascii?Q?tjMhsnT7iVWq7JLeKG/umv7E3uZk8duJ15bIFyJfWm+qfKlEtJmO61TaT1GI?=
 =?us-ascii?Q?TALpZoDuMRBKMWDs8c9p4J3ua06QTs/YjvjrkjWe2ztwRunsjqex+guNpzI0?=
 =?us-ascii?Q?aeXFZRdRJTsykuHSKpI51vHTkvGi0rIRl9kKisCjyFnJkDPMRrNxNGLZqjNM?=
 =?us-ascii?Q?IjRlcZKRjLUnlEV7ogLkJgTD2rlIzb7+P0QVZ59FarJBN6Zrcl7mW/NV0i0R?=
 =?us-ascii?Q?WxuQQsNI7VRPvE42Hy+AImfDNZB6p38gILnViIPcp7lZwNgixhZfzQVAc/vP?=
 =?us-ascii?Q?A9NwD8TLtm4thgBcsUyc27W8SL3sXhS0ymVpEfK6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 112c2272-6034-4024-c52b-08ddcd226021
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2025 15:29:28.1792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1iP4fZrciCm680mUe/p3vPHhKhEPOpnGoszVIYAjHB5kjo0NLsxIh29Yiex2PnZ6OU5sTAOhowvETCcQDyDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6838
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 15:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220953

Since the patched contain binary data, ip may be problematic to apply the p=
atch from email.
I have pushed it also to github so it can be picked from there.
https://github.com/petermarko/poky/commits/fix/gnutls-3-8-10-cves/

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, July 27, 2025 17:27
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][scarthgap][PATCH 1/6] gnutls: patch CVE-2025-32989
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick relevant commit from 3.8.10 release MR [1].
>=20
> Binary test file was added as separate file as binary diffs are not
> supported.
>=20
> [1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../04939b75417cc95b7372c6f208c4bda4579bdc34  | Bin 0 -> 1782 bytes
>  .../gnutls/gnutls/CVE-2025-32989.patch        |  50 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   6 +++
>  3 files changed, 56 insertions(+)
>  create mode 100644 meta/recipes-
> support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.pat=
ch
>=20
> diff --git a/meta/recipes-
> support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
> b/meta/recipes-
> support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..ffcfe23e99d4b353f07192729a86ff
> b5a249bbde
> GIT binary patch
> literal 1782
> zcmZuxX;c$e6rPz(Mj*t1i7X-}tO`naVX?-wfC|xQltmHTVh9i+5R(WIl_e^&NWep}
> zD54ZCAQh_~g}4Maq$t4!MNo08fC~uXmV&6A<Wx$}>HL^^_r34k?|$FhbAb|j2b9DI
> zB?JUU5VJW;c%PqjT-
> %jX(0{fg$Ep*MF=3DN;CfOH)hhDk&SB(q4s7$bzB7!?T#V%Y*4
> zePBYR1#J@Z<K#jC!!KSciI?)_qWCx#9oXuRNmPsB<6!AVnVhj$C{K)+#<1Lhn;t-*
> zIu8T<V)-%|!;=3Dvt6l|0V@sBh?C}sHhFx(jaUSNVHnKc!#Jf;D|6NZOu;Nby0JiXc8
> z>@bj)F`_`f#ViUg04Fdq#X8hkU8iflZ;Tq=3Dm;zi45=3D<Ss(vEbM{*J#Vb*QU4i!?4>
> zSp_doZ|~Zl`D$-o=3DZ>SDxoXyEU}{igO5_B;+E&4`29^c^re=3DaTp<*I4P9Db;#EY4N
> zIG}{>N4f_SA%YU7K=3D{51qJ&}S_|}R9@ALjfQ_aJjD!ASaJq47MVA7>q1ABO8^fa&
> V
> zeQGMfRGo1sU2>#aEw?mw*}!>YpKT-Z?_OFeCJw6Y-
> )iiKNYC3U8REMB$Zby^=3D7i2z
> zbU=3DG?14n1q^uw*5DW@XcqW8C~UUjUtUal-HxXRvrV(j+&_5OEvI*=3DC-
> O%$0JD<S1p
> z5O4Ms)#Hd4!WE0wU5dTWwltd7=3D;|ijov-6Alc{|2<4>Po>=3DvsKWql}}ey_rdTjt|P
> zgR71cLntkI9ffwOse6rot}gGA2ut7B35r$(>OuyO#31<(95f5Q_U1hbld76$J*4z2
> zetPzz_;t~9ZW*lDVgHsux`Gg32tK4FtN}_wxS@}1%~2W{qcm74A8Dn&<7}xY0w6
> G2
> zzofwMHxwlx#1g>Q#|$(Kgo0%l7L{g-cQN1s2h3<P1`~;+5ZJ;pS}vE!rn|dGFlC#>
> zf_3^I<SvlNfYUGt0oJDf3zJItV6vWqjyeK+z$lqeGCqBrJ|Uh@CL56u4+PR!L&MuT
> zp%#GlJvjj$ULk<4&*gwx0gF`Hnzc9ic_B}>`_Z!2x}N-)^uf=3Dn4=3Dn!<hGBFe;NTbj
> z5dz?J>VJ77^g@91FaQ}@*o<MNhQj1{+kL`Ja8FS9-
> X;V^P$k@jDxp8&r%(d)sM~gO
> z5}8-V$WE(Di<TraRmE`2%8Z;@=3D5<ZgJ+)d0f&<fgsv95(B|!dQ9>NGDC?;f*iZ-D6
> zwYoQ!iYuD1X%hE8KHM9hKX1HmnPx0v2erA1YPPg^%EN;>A=3D=3D2JH55Dg<An6
> M%-f>%
> zD#W#Z2<JU~#yIbkRVZ!eIcljkN@6n8yAU0)d7^%v*fctW+-
> ?TB7<ga(%NtO`ZSNWQ
> z+H%=3D<&P3N`KYr`p>l?+4ddeAyO<C}0IW`ODJ*>WKk#SMfs3a!_7-
> <p+H=3DP^CEUqej
> z^4!TUDIZfdLWxlHr^3JJ5z5->yL!(|vgHnKSh^}I|L)w|CQ(Pv@pzx>zJ1g4)?g3<
> z0&vCiAv;LBertJa8J950qS9wkd9=3D$#dgM4v(3dbKO0+~{!<&Z_pIhFOf{3~N%Jw(j
> zWO8`qPTt_*L-
> W)`x2v=3DpB2gd%+6eV7)YNRevG(jUUlIMcX9pq=3DQIgjjm$q$#>NaO4
> zReZUwGZ?ML4cF6xxd?-|g}iiSneM{ZlElIcQSg+TtxLU}4w^e+ooB^8x!7lf;qkKi
> z?D6Kem$HkEm*=3DtuTiTr8iF=3DJ^WO5XPMY`?-
> Q%4RVe1zje2!^a2K*3CApS9nM?QU&-
> z@R{84+CfF(vCr&nJA}=3DTrxkx1;~Y`-`b)}^eP7vkA74779r_r4bp7f<r@#VN-uxR?
> z``QM#Q2V0alO6=3DLo{0ao=3D6(|Ml<|cN2c}H!sTXi6*s8{&HHl506kq1$WlaaI+1Aja
> z=3D9r7gclJ+xOKA{Wy`=3D26(P>VVJ2qeYLZ6emDr;4J&OX-3U#ti2+}|9^ygF-6TG=3DbH
> zb|$}L(|J`uP<Pi(c6QqZX{Bm?<80BR&{|zivB=3DKH<9Zya*KL0DmUC);wmEIbO<ng%
> sRX@4icF)r*F}&W({g%z$6wZ*`OQvm|@J`UT#3Q7#!ShY-jG5+t1Dd6#hX4Qo
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
> new file mode 100644
> index 0000000000..d8724c0d68
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
> @@ -0,0 +1,50 @@
> +From 8e5ca951257202089246fa37e93a99d210ee5ca2 Mon Sep 17 00:00:00 2001
> +From: Andrew Hamilton <adhamilt@gmail.com>
> +Date: Mon, 7 Jul 2025 10:23:59 +0900
> +Subject: [PATCH] x509: fix read buffer overrun in SCT timestamps
> +
> +Prevent reading beyond heap buffer in call to _gnutls_parse_ct_sct
> +when processing x509 Signed Certificate Timestamps with certain
> +malformed data. Spotted by oss-fuzz at:
> +https://issues.oss-fuzz.com/issues/42530513
> +
> +Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +
> +CVE:CVE-2025-6395
> +Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-
> /commit/8e5ca951257202089246fa37e93a99d210ee5ca2]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + NEWS                                             |   5 +++++
> + lib/x509/x509_ext.c                              |   2 +-
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/NEWS b/NEWS
> +index 85efb5680..025e05148 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -5,6 +5,11 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
> + Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
> + See the end for copying conditions.
> +
> ++** libgnutls: Fix heap read buffer overrun in parsing X.509 SCTS timest=
amps
> ++   Spotted by oss-fuzz and reported by OpenAI Security Research Team,
> ++   and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
> ++   CVSS: medium] [CVE-2025-32989]
> ++
> + * Version 3.8.4 (released 2024-03-18)
> +
> + ** libgnutls: RSA-OAEP encryption scheme is now supported
> +diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
> +index 064ca8357..05336a0c2 100644
> +--- a/lib/x509/x509_ext.c
> ++++ b/lib/x509/x509_ext.c
> +@@ -3757,7 +3757,7 @@ int gnutls_x509_ext_ct_import_scts(const
> gnutls_datum_t *ext,
> + 	}
> +
> + 	length =3D _gnutls_read_uint16(scts_content.data);
> +-	if (length < 4) {
> ++	if (length < 4 || length > scts_content.size) {
> + 		gnutls_free(scts_content.data);
> + 		return GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE;
> + 	}
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-
> support/gnutls/gnutls_3.8.4.bb
> index e77960724b..367872d47e 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> @@ -24,6 +24,8 @@ SRC_URI =3D
> "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://run-ptest \
>             file://Add-ptest-support.patch \
>             file://CVE-2024-12243.patch \
> +           file://CVE-2025-32989.patch \
> +           file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
>             "
>=20
>  SRC_URI[sha256sum] =3D
> "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
> @@ -62,6 +64,10 @@ do_configure:prepend() {
>  	for dir in . lib; do
>  		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
>  	done
> +
> +    # binary files cannot be delivered as diff
> +    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
> +    cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34
> ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
>  }
>=20
>  do_compile_ptest() {

