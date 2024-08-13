Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EF7C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 06:19:30 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.78])
 by mx.groups.io with SMTP id smtpd.web11.65977.1723529968877313021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 23:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=FtCvdFSE;
 spf=pass (domain: siemens.com, ip: 40.107.105.78, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+9Aru9Y6ytoAA1ISlZmQTZqs/Xyb/HQYgiR08IA/wRBMs1TmyCYF5wzP6bL4BRMCFrFavWN5zNO97dHyjkj8HGbbl190gV42f2qBkKiuNmVLZSYygC6Em/Inz5Ko9lNQdgXCFDKApMO5obCGjesUsLbvQjQ9s5rkvanTOsWKMc+XXmk0uD7EU00uE+9R9VAVeouWNTTr0ONR/f+JL7OV17CK+uRhQ3Q3r6yGgdFabsEH5rxWgovOBztMJj9oKmdfdwdzy6FR5uN8kgNGxZb/36gfU8HAXZIP2IlTKhBZDXhJ0UlnM91oUJ507g7iPUZZ9QEZNFO6e6H0uXAypBIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pchfi7K8UWwRvMmWrWy7bxyr2WC4fwYkKrBAbJ8ErQ0=;
 b=iBR/iXornyhvwBV+7ohdZrUOVxKV6wcP0XQ5BczLnRurYDKM5bfwpyc1WkL0VNhv3uzjPHNu8lfJwsMegZh/e64G++P06cLQaDosjS3g0TgWbgM0iZni2/zjVF5jMI50HFr9J5B4DwTRpjmJOXzGObW+feTUDEPfpXuEVTVZKhRVjstcuzzV3WdrR3BxTia6VWVFeO7d/K3IsAOY66KzDxreLUjAe0cGAI0o3ZKUEI4eGReF0GRe5z1QmdjVr2vGnUvin19ShQ4q1bKQBL/YZnJa6MrjJvIFtxEcltp/T7H1wdoDbKrWjFrMG5tQH+LQEnOZ5UJTpJBN7ihDYJdGPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pchfi7K8UWwRvMmWrWy7bxyr2WC4fwYkKrBAbJ8ErQ0=;
 b=FtCvdFSElkxb8GjWm22YBxhTcDSzTJi0n7qn+NyK69s1LvFBScjFF84mr7jj7o5pMrF03QcYVIQAVStohFTIin31iGOr1WvszeHtBVIQ9foDBxHuYn+YCbhgBH3X7DghPo92X12F22E0KVtLAa9sC0p4eA4yWLKQbHlhAiKKaAC7sSV+cAHdBlhSNkUeWJiy6lPvfoXaKNwNOGjHrtXm9AeS0s/0ByO7qJnXnaukXQeGPeC77iFBgrLf4r94FPmstO1MiYhdqj/gUCmlG2mabRs4iANLSTPtEXc6eSgOGG0YYTrGguNsrX9kVD/zTsPx+J8f1tGuWlz+heItcYLbsw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DBAPR10MB4140.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 06:19:25 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 06:19:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "t.fuchs@thofu.net" <t.fuchs@thofu.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
Thread-Topic: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
Thread-Index: AQHa7UdLJcdzO+tOGUuv2A/CuUsIuLIktfTw
Date: Tue, 13 Aug 2024 06:19:25 +0000
Message-ID: 
 <AS1PR10MB5697D30873B0F3ADDA280459FD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240813060844.5036-1-t.fuchs@thofu.net>
In-Reply-To: <20240813060844.5036-1-t.fuchs@thofu.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=73f03839-a240-4813-9dd5-31656f8bdd85;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-13T06:15:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DBAPR10MB4140:EE_
x-ms-office365-filtering-correlation-id: 091c3b40-7236-4e3d-26a7-08dcbb5fe12b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8YtHHzok2LwBJ2EflRjsfp1Lz1bpx28BLm4D5A9ia/JhjKlBMJ5+JyjqH/2h?=
 =?us-ascii?Q?glcMC0tiDVe+lvECzXkcFtOx0AYl5V9v3dxEZRShC/BxsaMaPwcSiilqiGYT?=
 =?us-ascii?Q?SNmWOCzTC7SFD2o+xOUx/IF8XasXvoMVZ5T1dTyaZO6gUSLJiF6tRJgyKn8y?=
 =?us-ascii?Q?9gOx4OPAJTnZ/17UJJnfS+EGs73sGRpWRdB11pGGLa947S+gvWI1svoGrx+R?=
 =?us-ascii?Q?DziY6yqN8R9h/inoDb95WXxEa9elSfqYpezOt4RMsUCI41zQnT5zgYidnzDr?=
 =?us-ascii?Q?DJYN6Kxz0xchaw/DTopj3Wws7ZJiIGXLjMhPyIx5yxmovGwunbUvfoQPaqZd?=
 =?us-ascii?Q?u3ssxQPN8ghg/W5cM7xVQ5TOfEUa9hXz5m3CsRTq/GbkrRcRe2yDJCk9gOHM?=
 =?us-ascii?Q?z3y3EzEkpG4K/87hw0TOeFLysAKc1oAJo49rj8Vl29w7GHm01BEwuLvdvhsU?=
 =?us-ascii?Q?UjnRRYIF75XTwG5ETyoBjBwF3gtxyelKzhWhE4fnSQERzd292X8+MeSDTg2e?=
 =?us-ascii?Q?0Uf+PDWVCtb3OC4CrM6EhQ8B2QiRNwmYnzSbDgpwvwwFAbkCLNHkt+xcxu/N?=
 =?us-ascii?Q?8NYVF8FFffGdjcrI36VRSSTIbum8t34eva/uaRdEz57coMxcP6rqfRXsEqRV?=
 =?us-ascii?Q?lMvCWA+xqv5i9z6Efomr7gVonYDaSn8JinIf01mmxyfEcGIUUCFFM1baKT5C?=
 =?us-ascii?Q?0cq7PFDAr4HKV0EHY9WDlGnEgXBby7C+Z4DWTXa+UTas/fzEDsC3aTqCvR+b?=
 =?us-ascii?Q?JKn0Xs5vnUu0vwGJAu7hccuQtX46jj14rq2KQyzjZTsGOK3K0gUQ1WggNbqf?=
 =?us-ascii?Q?djHKLjaJLsrA/tLmdvj4rNBTnFdcNxfKorstpu2/I53ACcJG0zbNixRhHQI7?=
 =?us-ascii?Q?M/p5MFQqkFsivseQb7Wsbd/4F6Ht6JczQvWt0SmAzSUIatcsgED71r1Qy9eF?=
 =?us-ascii?Q?KK76qSSgHu8++J9gpTqfveYUHw7Hd2puOe9p+fI8BidM6qLb0i0TnTc7/NLv?=
 =?us-ascii?Q?Dusocl8gJkgb5F0kl9S3lXfkTuuq1KY+jqJwB/OqrQhvaxMhGYBQDx16So0i?=
 =?us-ascii?Q?vK7CyUo8Rl8UjneDHuq9/4ICd5FeSiOVIY5KRZZqdIDb7zE2BfAjgSjPX4OI?=
 =?us-ascii?Q?hbBt6jROR1j/CE87cXlylAA6D0A0h7xkyHll7UXVUe8Srb5Vp4qdF6lgIs/R?=
 =?us-ascii?Q?iqnmu3rZa+H0DG25HEJCFtbFTyEMWua4z8uL0jCog3iO0vUFRz735mUH2Eo8?=
 =?us-ascii?Q?2az7S3+I0LN12KAXBvHk3j2aAcZ3069RMEGXhlrOqNWTdMVCdPlw/F/ONfIc?=
 =?us-ascii?Q?VV3WOf0vjxNz+aIitH5+37dvCR6DgPXgQ4OFNSWsR4inafi8lvrcEqzFxEg9?=
 =?us-ascii?Q?684WXa0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KbiAEg0VwQ2vBLUvKQ+TNFqHQg8Je5MCCziUv6wcRHcVSBgG6eTEh28cccT2?=
 =?us-ascii?Q?CEJm5VTYosLACUYisIxMQ+B9rN1faE79BIInCkEoCwCEPsFswMzJSwLGFwTh?=
 =?us-ascii?Q?spRnyL/bwkb8iMjnrqsOaVrPO+Fb1rfsK7HtoTlgswL7Bg5YqDJOsmXFLJ4Y?=
 =?us-ascii?Q?uVsWp0ac3xGzJBj+oAv77g0oGbwfosNiEqvEQ4e2QKB/QQ8/dxv/Uk8xbqDI?=
 =?us-ascii?Q?CEci6aX6WdU/58/8Gw60quyAwxQfKyQFBlf8Fenff8+kIAOMU4USQae5LOF8?=
 =?us-ascii?Q?bjUPZh9YMEDC5xmaMTT9/hAMj4QxirTcnQsXBJ0YaYqXYepYboYVVOfFubBP?=
 =?us-ascii?Q?yGQBL/FwzDJJV8hLx7lFTGL+vOgy1nfFZT/iKhXxeU/03d2uKFZ6fyInaqF2?=
 =?us-ascii?Q?UGKOTwdNzchQVH+3CxTypzbIpvoxzH8scFaO4pZ7QB2MFlMuj3saI+Xdqo4t?=
 =?us-ascii?Q?6zKZs7kFVVFpKIm/u40ddtlKJ8YvEm+MDwT1/0uVgKBxNXr2j85BOFOe2vjq?=
 =?us-ascii?Q?45yuO5fDaD1k9yYw6W76+9pepTz7OAd0tgAeWctVlIuTUx5uHwRJF9dX//3Z?=
 =?us-ascii?Q?YFCLaphZNDkbclExaOFvg8tB3Y/ARbrVjSNYPf2S/x/i/FH0d5DlW2ATE9gV?=
 =?us-ascii?Q?qmFUZkdlT462+xs7wFoUM+zUcrUQUap26ZIsgvrdUHqDMj/Pmm+8pTxYOwgu?=
 =?us-ascii?Q?18tkTFQDnFCLn3WaRGhL64pPP0hJLQvtXiZdY9JtU8iqjmKSpBGLa55aC2sj?=
 =?us-ascii?Q?bDvbA1pnBOEJi9GW1NbX5eoJre0jWIBD6uEeZWEU6Rk79h2zxbc9BDWKWyG6?=
 =?us-ascii?Q?OCfjHhpgy/hxM5MKetuRE4HCwU2PwBc0i4utGSVduZBOTAF19ZDyXWQ05Gtb?=
 =?us-ascii?Q?1YSG7FoFyqSZaoelEeP4Gj7ah/AtsTXOhiNrDD57RsYIqyeTQS3a+lGV6I/a?=
 =?us-ascii?Q?cWTfKd1jdWBxOyr9MZPvzgxo1Ept0Gp6fd9TUp3F3vCofpvRr7PYSdFE4Ho6?=
 =?us-ascii?Q?DhxFSXBUDnsqp91b0Vyf2qVRJX/63oZFx60ZMXFaak4BENESgerr+NczqIi2?=
 =?us-ascii?Q?EzSleXbiE2e1T7LkgeLTZLoGaxfqtYE0lBwghYYB8psqleefXFJD4KBNC+Nh?=
 =?us-ascii?Q?g9qLaW9X8lZ1MEPFDlQxsVZ1Dmu1T9avfNMy6q5f3ctb2QYYASIdbXggL2VV?=
 =?us-ascii?Q?YMYAeuA9pFgYC7wNdYXwbhXDKATL/Y6gxj286EmglqZIN99Kk8QOMNKxVAsX?=
 =?us-ascii?Q?DN0f32LJbMIDI/h+qkvxwjGUtDEbzlbG8+izwMpTI8jsYA+G4Y760Qyli1oE?=
 =?us-ascii?Q?oNaW2UjTOZbxznjm5XrdlU+h4GWsPSUWb3L7J/vKKWSwtHhILCRX2D49VBbN?=
 =?us-ascii?Q?ohtRvakuqbFIb1LB+bKMkUwfpR6kxAJFqYelZYSI9vKYS1T0S8uNPhUVHuUO?=
 =?us-ascii?Q?2FE25lldSDgToNIpQmsqgOv286Bl0SGH3mJwc0Nt64GgkyE/gW853R9QF1xZ?=
 =?us-ascii?Q?hlf6eIkONrDPYhykqZML+YA3YKqxkInpr1LDLMiTUvPNLkj7RKVcnerPBUtU?=
 =?us-ascii?Q?TDfcFdbHFYv+jWJSieGwO4LudMcX8GrSFdG8BNen?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 091c3b40-7236-4e3d-26a7-08dcbb5fe12b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 06:19:25.3258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCS+uXdKHjMOKRIi5e31ikw69ANem01ngXjVPTjV2Uv0x/E6MPG1ZT+YlWsqLuqiq070UfKpO8pjAYG2rQ3tRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 06:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203252

The CVE_STATUS needs to stay (forever), as r118 > 1.x.y so it would reappea=
r in CVE reports.
Also, you're not fixing this CVE with this upgrade, so commit message shoul=
d not have "CVE: " flag.

Additionally upstream-status flag is missing in your patch, move it there f=
rom commit message.

Cheers,
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Thorsten Fuchs via
> lists.openembedded.org
> Sent: Tuesday, August 13, 2024 8:09
> To: openembedded-core@lists.openembedded.org
> Cc: Thorsten Fuchs <t.fuchs@thofu.net>
> Subject: [OE-core] [PATCH] lz4: upgrade 1.9.4 -> 1.10.0
>=20
> * Add a patch to rename LIBDIR variable in Makefiles
> * Remove CVE_STATUS for CVE-2014-4715 that was fixed in r118.
>=20
> Signed-off-by: Thorsten Fuchs <t.fuchs@thofu.net>
>=20
> Upstream-Status: Inappropriate [oe specific]
>=20
> CVE: CVE-2014-4715
> ---
>  ...1-Fix-Makefile-variable-name-overlap.patch | 211 ++++++++++++++++++
>  .../lz4/{lz4_1.9.4.bb =3D> lz4_1.10.0.bb}       |  26 +--
>  2 files changed, 223 insertions(+), 14 deletions(-)
>  create mode 100644 meta/recipes-support/lz4/files/0001-Fix-Makefile-
> variable-name-overlap.patch
>  rename meta/recipes-support/lz4/{lz4_1.9.4.bb =3D> lz4_1.10.0.bb} (59%)
>=20
> diff --git a/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable-na=
me-
> overlap.patch b/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable=
-
> name-overlap.patch
> new file mode 100644
> index 0000000000..f69d6bd71b
> --- /dev/null
> +++ b/meta/recipes-support/lz4/files/0001-Fix-Makefile-variable-name-
> overlap.patch
> @@ -0,0 +1,211 @@
> +From ec631bc59a5ae9a38b688e999a9044fef9211d98 Mon Sep 17
> 00:00:00 2001
> +From: Thorsten Fuchs <thorsten.fuchs@abaut.de>
> +Date: Mon, 12 Aug 2024 12:20:21 +0000
> +Subject: [PATCH] Fix Makefile variable name overlap.
> +
> +Upstream renamed LZ4DIR to LIBDIR inside Makefiles which collides with
> +the OpenEmbedded builds.
> +
> +Signed-off-by: Thorsten Fuchs <thorsten.fuchs@abaut.de>
> +---
> + examples/Makefile | 10 +++++-----
> + programs/Makefile | 16 ++++++++--------
> + tests/Makefile    | 28 ++++++++++++++--------------
> + 3 files changed, 27 insertions(+), 27 deletions(-)
> +
> +diff --git a/examples/Makefile b/examples/Makefile
> +index 91a4f484..26fdf6d7 100644
> +--- a/examples/Makefile
> ++++ b/examples/Makefile
> +@@ -27,22 +27,22 @@
> + # kindly provided by Takayuki Matsuoka
> + #
> ###################################################################
> #######
> +
> +-LIBDIR    :=3D ../lib
> ++LZ4DIR    :=3D ../lib
> +
> +-CPPFLAGS  +=3D -I$(LIBDIR)
> ++CPPFLAGS  +=3D -I$(LZ4DIR)
> + USERCFLAGS:=3D $(CFLAGS)
> + WFLAGS     =3D -std=3Dgnu99 -Wall -Wextra -Wundef -Wshadow -Wcast-align=
 -
> Wstrict-prototypes -Wc++-compat
> + CFLAGS     =3D $(WFLAGS) -O2 $(USERCFLAGS)
> +
> + TESTFILE   =3D Makefile
> +-SLIBLZ4   :=3D $(LIBDIR)/liblz4.a
> ++SLIBLZ4   :=3D $(LZ4DIR)/liblz4.a
> + LZ4DIR     =3D ../programs
> + LZ4        =3D $(LZ4DIR)/lz4
> +
> + default: all
> +
> +-$(SLIBLZ4): $(LIBDIR)/lz4.c $(LIBDIR)/lz4hc.c $(LIBDIR)/lz4frame.c
> $(LIBDIR)/lz4.h $(LIBDIR)/lz4hc.h $(LIBDIR)/lz4frame.h
> $(LIBDIR)/lz4frame_static.h
> +-	$(MAKE) -j -C $(LIBDIR) liblz4.a
> ++$(SLIBLZ4): $(LZ4DIR)/lz4.c $(LZ4DIR)/lz4hc.c $(LZ4DIR)/lz4frame.c
> $(LZ4DIR)/lz4.h $(LZ4DIR)/lz4hc.h $(LZ4DIR)/lz4frame.h
> $(LZ4DIR)/lz4frame_static.h
> ++	$(MAKE) -j -C $(LZ4DIR) liblz4.a
> +
> + ALL =3D print_version \
> + 	  simple_buffer \
> +diff --git a/programs/Makefile b/programs/Makefile
> +index 643ce14f..d9975b26 100644
> +--- a/programs/Makefile
> ++++ b/programs/Makefile
> +@@ -31,8 +31,8 @@
> + SED ?=3D sed
> +
> + # Version numbers
> +-LIBDIR   :=3D ../lib
> +-LIBVER_SRC :=3D $(LIBDIR)/lz4.h
> ++LZ4DIR   :=3D ../lib
> ++LIBVER_SRC :=3D $(LZ4DIR)/lz4.h
> + LIBVER_MAJOR_SCRIPT:=3D`$(SED) -n
> '/define[[:blank:]][[:blank:]]*LZ4_VERSION_MAJOR/s/.*[[:blank:]]\([0-9][0=
-
> 9]*\).*/\1/p' < $(LIBVER_SRC)`
> + LIBVER_MINOR_SCRIPT:=3D`$(SED) -n
> '/define[[:blank:]][[:blank:]]*LZ4_VERSION_MINOR/s/.*[[:blank:]]\([0-9][0=
-
> 9]*\).*/\1/p' < $(LIBVER_SRC)`
> + LIBVER_PATCH_SCRIPT:=3D`$(SED) -n
> '/define[[:blank:]][[:blank:]]*LZ4_VERSION_RELEASE/s/.*[[:blank:]]\([0-9]=
[0-
> 9]*\).*/\1/p' < $(LIBVER_SRC)`
> +@@ -42,7 +42,7 @@ LIBVER_MINOR :=3D $(shell echo
> $(LIBVER_MINOR_SCRIPT))
> + LIBVER_PATCH :=3D $(shell echo $(LIBVER_PATCH_SCRIPT))
> + LIBVER   :=3D $(shell echo $(LIBVER_SCRIPT))
> +
> +-LIBFILES  =3D $(wildcard $(LIBDIR)/*.c)
> ++LIBFILES  =3D $(wildcard $(LZ4DIR)/*.c)
> + SRCFILES  =3D $(sort $(LIBFILES) $(wildcard *.c))
> + OBJFILES  =3D $(SRCFILES:.c=3D.o)
> +
> +@@ -51,7 +51,7 @@ DEBUGFLAGS=3D -Wall -Wextra -Wundef -Wcast-qual -
> Wcast-align -Wshadow \
> +             -Wpointer-arith -Wstrict-aliasing=3D1
> + USERCFLAGS:=3D -O3 $(CFLAGS) # -O3 can be overruled by user-provided -O=
x
> level
> + CFLAGS    =3D $(DEBUGFLAGS) $(USERCFLAGS)
> +-CPPFLAGS +=3D -I$(LIBDIR) -DXXH_NAMESPACE=3DLZ4_
> ++CPPFLAGS +=3D -I$(LZ4DIR) -DXXH_NAMESPACE=3DLZ4_
> +
> + include ../Makefile.inc
> +
> +@@ -132,8 +132,8 @@ lz4-nomt: $(SRCFILES)
> +
> + CLEAN +=3D lz4-wlib
> + lz4-wlib: LIBFILES =3D
> +-lz4-wlib: SRCFILES+=3D $(LIBDIR)/xxhash.c  # benchmark unit needs XXH64=
()
> +-lz4-wlib: LDFLAGS +=3D -L $(LIBDIR)
> ++lz4-wlib: SRCFILES+=3D $(LZ4DIR)/xxhash.c  # benchmark unit needs XXH64=
()
> ++lz4-wlib: LDFLAGS +=3D -L $(LZ4DIR)
> + lz4-wlib: LDLIBS   =3D -llz4
> + lz4-wlib: liblz4 $(OBJFILES)
> + 	@echo WARNING: $@ must link to an extended variant of the
> dynamic library which also exposes unstable symbols
> +@@ -141,7 +141,7 @@ lz4-wlib: liblz4 $(OBJFILES)
> +
> + .PHONY:liblz4
> + liblz4:
> +-	CPPFLAGS=3D"-DLZ4F_PUBLISH_STATIC_FUNCTIONS -
> DLZ4_PUBLISH_STATIC_FUNCTIONS" $(MAKE) -C $(LIBDIR) liblz4
> ++	CPPFLAGS=3D"-DLZ4F_PUBLISH_STATIC_FUNCTIONS -
> DLZ4_PUBLISH_STATIC_FUNCTIONS" $(MAKE) -C $(LZ4DIR) liblz4
> +
> + CLEAN +=3D lz4c
> + lz4c: lz4
> +@@ -179,7 +179,7 @@ clean:
> + ifeq ($(WINBASED),yes)
> + 	$(RM) *.rc
> + endif
> +-	$(MAKE) -C $(LIBDIR) $@ > $(VOID)
> ++	$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
> + 	$(RM) $(CLEAN) *.o tmp* *.test core
> + 	@echo Cleaning completed
> +
> +diff --git a/tests/Makefile b/tests/Makefile
> +index 47e2774d..7adfdfcc 100644
> +--- a/tests/Makefile
> ++++ b/tests/Makefile
> +@@ -28,7 +28,7 @@
> + # datagen : generates synthetic data samples for tests & benchmarks
> + #
> ###################################################################
> #######
> +
> +-LIBDIR  :=3D ../lib
> ++LZ4DIR  :=3D ../lib
> + PRGDIR  :=3D ../programs
> + TESTDIR :=3D versionsTest
> + PYTHON  ?=3D python3
> +@@ -40,7 +40,7 @@ WFLAGS    =3D -Wall -Wextra -Wundef -Wcast-qual -
> Wcast-align -Wshadow \
> +             -Wswitch-enum -Wdeclaration-after-statement -Wstrict-protot=
ypes \
> +             -Wpointer-arith -Wstrict-aliasing=3D1
> + CFLAGS    =3D $(WFLAGS) $(DEBUGFLAGS) $(USERCFLAGS)
> +-CPPFLAGS +=3D -I$(LIBDIR) -I$(PRGDIR) -DXXH_NAMESPACE=3DLZ4_
> ++CPPFLAGS +=3D -I$(LZ4DIR) -I$(PRGDIR) -DXXH_NAMESPACE=3DLZ4_
> + ALLFLAGS  =3D $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)
> +
> + include ../Makefile.inc
> +@@ -69,7 +69,7 @@ lz4:
> +
> + .PHONY: lib liblz4.pc
> + lib liblz4.pc:
> +-	$(MAKE) -C $(LIBDIR) $@ CFLAGS=3D"$(CFLAGS)"
> ++	$(MAKE) -C $(LZ4DIR) $@ CFLAGS=3D"$(CFLAGS)"
> +
> + lz4c unlz4 lz4cat: lz4
> + 	$(LN_SF) $(LZ4) $(PRGDIR)/$@
> +@@ -79,7 +79,7 @@ lz4c32:  # create a 32-bits version for 32/64 interop
> tests
> + 	$(MAKE) -C $(PRGDIR) $@ CFLAGS=3D"-m32 $(CFLAGS)"
> +
> + # *.o objects are from library
> +-%.o : $(LIBDIR)/%.c $(LIBDIR)/%.h
> ++%.o : $(LZ4DIR)/%.c $(LZ4DIR)/%.h
> + 	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
> +
> + CLEAN +=3D fullbench
> +@@ -88,14 +88,14 @@ fullbench : CPPFLAGS +=3D -DNDEBUG
> + fullbench : lz4.o lz4hc.o lz4frame.o xxhash.o fullbench.c
> + 	$(CC) $(ALLFLAGS) $^ -o $@$(EXT)
> +
> +-.PHONY: $(LIBDIR)/liblz4.a
> +-$(LIBDIR)/liblz4.a:
> +-	$(MAKE) -C $(LIBDIR) liblz4.a
> ++.PHONY: $(LZ4DIR)/liblz4.a
> ++$(LZ4DIR)/liblz4.a:
> ++	$(MAKE) -C $(LZ4DIR) liblz4.a
> +
> + CLEAN +=3D fullbench-lib
> + fullbench-lib : DEBUGLEVEL=3D0
> + fullbench-lib : CPPFLAGS +=3D -DNDEBUG
> +-fullbench-lib: fullbench.c $(LIBDIR)/liblz4.a
> ++fullbench-lib: fullbench.c $(LZ4DIR)/liblz4.a
> + 	$(CC) $(ALLFLAGS) $^ -o $@$(EXT)
> +
> + # Note: Windows only
> +@@ -103,9 +103,9 @@ ifeq ($(WINBASED),yes)
> + CLEAN +=3D fullbench-dll
> + fullbench-dll : DEBUGLEVEL=3D0
> + fullbench-dll : CPPFLAGS +=3D -DNDEBUG
> +-fullbench-dll: fullbench.c $(LIBDIR)/xxhash.c
> +-	$(MAKE) -C $(LIBDIR) liblz4
> +-	$(CC) $(ALLFLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=3D1
> $(LIBDIR)/dll/$(LIBLZ4).dll
> ++fullbench-dll: fullbench.c $(LZ4DIR)/xxhash.c
> ++	$(MAKE) -C $(LZ4DIR) liblz4
> ++	$(CC) $(ALLFLAGS) $^ -o $@$(EXT) -DLZ4_DLL_IMPORT=3D1
> $(LZ4DIR)/dll/$(LIBLZ4).dll
> + endif
> +
> + # test LZ4_USER_MEMORY_FUNCTIONS
> +@@ -143,7 +143,7 @@ decompress-partial-usingDict: lz4.o decompress-
> partial-usingDict.c
> +
> + .PHONY: clean
> + clean:
> +-	@$(MAKE) -C $(LIBDIR) $@ > $(VOID)
> ++	@$(MAKE) -C $(LZ4DIR) $@ > $(VOID)
> + 	@$(MAKE) -C $(PRGDIR) $@ > $(VOID)
> + 	@$(RM) $(CLEAN) core *.o *.test tmp*
> + 	@$(RM) -r $(TESTDIR)
> +@@ -166,7 +166,7 @@ abiTests:
> + 	$(PYTHON) test-lz4-abi.py
> +
> + CLEAN +=3D checkTag
> +-checkTag: checkTag.c $(LIBDIR)/lz4.h
> ++checkTag: checkTag.c $(LZ4DIR)/lz4.h
> + 	$(CC) $(ALLFLAGS) $< -o $@$(EXT)
> +
> + #----------------------------------------------------------------------=
-------
> +@@ -204,7 +204,7 @@ test32: test
> + test-amalgamation: lz4_all.o
> +
> + CLEAN +=3D lz4_all.c
> +-lz4_all.c: $(LIBDIR)/lz4.c $(LIBDIR)/lz4hc.c $(LIBDIR)/lz4frame.c
> ++lz4_all.c: $(LZ4DIR)/lz4.c $(LZ4DIR)/lz4hc.c $(LZ4DIR)/lz4frame.c
> + 	$(CAT) $^ > $@
> +
> + test-install: lz4 lib liblz4.pc
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-
> support/lz4/lz4_1.10.0.bb
> similarity index 59%
> rename from meta/recipes-support/lz4/lz4_1.9.4.bb
> rename to meta/recipes-support/lz4/lz4_1.10.0.bb
> index 51a854d44a..778a5b6e72 100644
> --- a/meta/recipes-support/lz4/lz4_1.9.4.bb
> +++ b/meta/recipes-support/lz4/lz4_1.10.0.bb
> @@ -2,45 +2,43 @@ SUMMARY =3D "Extremely Fast Compression algorithm"
>  DESCRIPTION =3D "LZ4 is a very fast lossless compression algorithm, prov=
iding
> compression speed at 400 MB/s per core, scalable with multi-cores CPU. It
> also features an extremely fast decoder, with speed in multiple GB/s per =
core,
> typically reaching RAM speed limits on multi-core systems."
>  HOMEPAGE =3D "https://github.com/lz4/lz4"
>=20
> -LICENSE =3D "BSD-2-Clause | GPL-2.0-only"
> +LICENSE =3D "BSD-2-Clause | GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D
> "file://lib/LICENSE;md5=3D5cd5f851b52ec832b10eedb3f01f885a \
> -
> file://programs/COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://LICENSE;md5=3Dc5cc3cd6f9274b4d32988096df9c3ec=
3 \
> +
> file://programs/COPYING;md5=3D492daf447d6db0e5eb344a7922e7ec25 \
> +                    file://LICENSE;md5=3Dc111c47e301c2ffe8776729b40b4447=
7 \
>                      "
>=20
>  PE =3D "1"
>=20
> -SRCREV =3D "5ff839680134437dbf4678f3d0c7b371d84f4964"
> +SRCREV =3D "ebb370ca83af193212df4dcbadcc5d87bc0de2f0"
>=20
>  SRC_URI =3D "git://github.com/lz4/lz4.git;branch=3Drelease;protocol=3Dht=
tps \
> -	   file://run-ptest \
> -	   "
> +           file://0001-Fix-Makefile-variable-name-overlap.patch \
> +           file://run-ptest \
> +           "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>=20
>  S =3D "${WORKDIR}/git"
>=20
>  inherit ptest
>=20
> -CVE_STATUS[CVE-2014-4715] =3D "fixed-version: Fixed in r118, which is la=
rger
> than the current version."
> -
>  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS}'
> DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATIC=
=3Dno"
>=20
>  do_install() {
> -	oe_runmake install
> +        oe_runmake install
>  }
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> -RDEPENDS:${PN}-ptest +=3D "bash"
> +RDEPENDS_${PN}-ptest +=3D "bash"
>=20
>  do_compile_ptest() {
>          oe_runmake -C ${B}/tests/
>  }
>=20
>  do_install_ptest() {
> -	install -d ${D}${PTEST_PATH}/tests/
> -	install --mode=3D755 ${B}/tests/frametest ${D}${PTEST_PATH}/tests/
> -	sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g"
> ${D}${PTEST_PATH}/run-ptest
> -
> +        install -d ${D}${PTEST_PATH}/tests/
> +        install --mode=3D755 ${B}/tests/frametest ${D}${PTEST_PATH}/test=
s/
> +        sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-
> ptest
>  }
>=20
> --
> 2.34.1


