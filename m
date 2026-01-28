Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E742D35686
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 06:46:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7561.1769582797276053462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 22:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=NKW21whw;
 spf=pass (domain: siemens.com, ip: 40.107.162.13, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6dlm0rrinnvdN2GNBpVTOLgew560/yV5woTyFe9yi3Itm0YfCLTd5CWdH7OZF5Hnb2OjQU5hJeHH5uqoxODeVzVNKS329nap/xA4VzMSbBH7fONyUL6nBHQzLq4iPKqMo/ILG73Moysk7b4DSNPNCw89eiplEaly7l4awgRbeFu4wk/I9PnRqPCFkh5dIWNEIh1mWkC7amLBw+YnS+JAq+F9m3QO46Xqr+0BYaN7XQsll+eotUlS+j03Okpw7Fq+Qo1bSQkmMlaTzuwdeCz9lP9kVIJmb+jqL/PK3mGtyPIP0ofPFW5nYhSCYFCs+IXlxGO5n4CAbFGfynHfYpbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0a0/SsT/dmjUYFfq1w7Nq1CKcQDeRfBW8S4HsMxE6E=;
 b=YJ6TB+itcLxH3tH9aQ/MKNX448WFRDMRuanqkZZb/dTmgfBMkh4D0MbAEzp3+bB3+s0nbd4l0Jlco1fcIVQXns8tj6s+fG/a6Ui1Yp9SXqHrf4+7FLi5ZH6fmofPleBJidCh7722G41d6eMn8KS3TIEj7YBKt50rvMA6Ev7HJz4MxIk1im4oxuTmOqsSMc5vaeABrWlq/9zxqQk1U1ORzljhJK2CjneyVO/50MJzFP3g1afNumrxeXtUMfSa3r6c7n7F8OdBNgQr/MiBTkSLvuoIsYkVwFFLV2CjEK3J+psZ8vtKbidraOvK6Da0OtmbMkcpy5eLtleeCOXrv2G4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0a0/SsT/dmjUYFfq1w7Nq1CKcQDeRfBW8S4HsMxE6E=;
 b=NKW21whwczHblnSbYq4tsf7k4wil8XgqlMRPpGqcUJ2Lx1f84+T/NblNS8Xp6t6T+TkuyNsx7Q8ikkgAeLRoisTrMLMDqIC4DsYy7mV2cJam0p614SJdnTzQfDgiq1qXaMhr+lT1ujHi5n6KWJTwF8ikVmxYbeceuBMyhTFXDsjXyudIcAJ73niWouIkrWTcetlj3/fUCkF0jjdXNaO2AChC3CRyCWyJiEcUFEdigUdJwDQ+0jeO6bCF1CQaVcWPT8NkKlZ7m0U2yDrgVvz9dujvypryW/7kuQFu9X84hfPfVFO1zXhwamhOk9qX6IQHL8SfxB2oUi9UBQhIPyiuPQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB7131.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 06:46:31 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 06:46:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libxml2: Fix CVE-2026-0989
Thread-Topic: [OE-core] [PATCH] libxml2: Fix CVE-2026-0989
Thread-Index: AQHckBrWxjqS5wipiEKUVRTIPEfHuLVnI0uA
Date: Wed, 28 Jan 2026 06:46:31 +0000
Message-ID: 
 <AS1PR10MB5697DCD9D47DB0926A0354DBFD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260128055616.3324710-1-mingli.yu@windriver.com>
In-Reply-To: <20260128055616.3324710-1-mingli.yu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=16bb2460-c66a-4ddc-b8f9-d76f96712879;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-28T06:45:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB7131:EE_
x-ms-office365-filtering-correlation-id: 677d7c61-5f52-4bd8-6fe8-08de5e38f87b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?A8aSMphGdKUfBJxZqTCDwhepiKl3GaDp0ygXwqLZqHbLNCwKNDzZqPys6iTZ?=
 =?us-ascii?Q?4FUXr0WRy5JbbeM4UcrpAFi/R7z8D9omTXpRrvJeTqDyrBZ6RNwbF8VwYE6V?=
 =?us-ascii?Q?F0HORPNNLeQhWaGCp7kGOlSO3fzsfEYGYzrnHrlLp6U7RkqhskT2f1XOIRN6?=
 =?us-ascii?Q?Qt0rPrjXQaFb4shHQSN13KT6RH5cId+mDw1WPmarnOS9vztK34Yh20JKI8NW?=
 =?us-ascii?Q?/H5m975blZ8JzHQLkaNHFZARJkhOTP/21sm6PtxY1PBkRSL/LxqJjv8Rhl58?=
 =?us-ascii?Q?tp0fd58JsGLLaWuSA0Pr5PmB25L/0gQvH+KqB5AjQ0mT25jEHb+CdvmFdHWA?=
 =?us-ascii?Q?ki67ZadBfe+6dEq9A/5Nawy+TJJ/MVKbqDIGrg7IT0yYJxLCksOcvrwrHRwR?=
 =?us-ascii?Q?V1U17mydUzeNc2VtTFW/zp0Z0g2jeBlb8yPS4+s0wr/gHWZwudRQpY0ug9En?=
 =?us-ascii?Q?qt3p6rfTx8bCKRJSZSnAagyHJS0z3/R7gwQkVJzk9HzK7ItB0Hy361sjVTyH?=
 =?us-ascii?Q?GzelX3ADw/YbaUjZ9SgqqIZLwkOdwsvfcEJ7zCfnDWbLsDYeFaAAMj+iEzn3?=
 =?us-ascii?Q?xONTSRip8aJ1W1gd7yJbidJ25dY9mNZkM1SADwV0SMNbmNu1g5OY8FxuSLPd?=
 =?us-ascii?Q?grDjCm9gce6AjWIdT9XG220aHSYQxheD/pCtmE5HhS2qPEpbeiyTV3CL3ffD?=
 =?us-ascii?Q?qisvh14aWNRlDZ1hen8viIdvoD/QjqzVbDr65p+uG5qeoxGHvHcxvzS/vGrT?=
 =?us-ascii?Q?IGYnhANf+bu9WZPkVheclFfS8H8RJAqFbogNGDF7z2JE8iqFn14ZiONsBokT?=
 =?us-ascii?Q?7Pe2k7NtSZ1XMB54uiCXtq0Db+52/jwqAjAjG3msWOY0cPBQTT2AYPTF7+wK?=
 =?us-ascii?Q?Y+n8FQoxNLiSjaEsE2fEPg/Q5GfZ1t6tYtM24lvlZwf6nI0fTHTM3ntHFWgP?=
 =?us-ascii?Q?i6XVQxMXoVj0oBR8N2SK1ucKg7H+67X5cMmH89hBMDDAD+KZM63nx0zTHF2g?=
 =?us-ascii?Q?MZ6kdd7QkEo8YsGM21XqUZ+hKukRZhem85pJXrBJoDHyBumOTSJFl8/dzasu?=
 =?us-ascii?Q?sYEqIuga42Q8aCU3wh4+KEU1PQ8Rsy+dVX6G7RBdrUtlkmdamKbo/jmZHxx8?=
 =?us-ascii?Q?pRZv8++do1DN6dBJOjHNuuQgqk5FvogWDCqQFvzPvt7Lb6Fxo+QyoHaTs1AG?=
 =?us-ascii?Q?Pd3pJBI9s00FFDFKXUzHkB60fiu1rdAnEeKMvGB186yOXJi0wURGOsCfKvW9?=
 =?us-ascii?Q?brqLq34IB46umDWS1IxEDCknWTsuJw6dWUTfTqLNo2EiHkz5ix57TiuDi5Tp?=
 =?us-ascii?Q?6W+GJXVuHqtPiV+2d4JYMZDBHd+BcXPPyY6VPNa23GhYSrpKCdFwHSEyllxW?=
 =?us-ascii?Q?99Byn+EA81UH+0dvB4iy/elxKLXAl0z8eKA22GCduoytmdEFs677XYZoVV4o?=
 =?us-ascii?Q?zuirrO2aERKPMxnMHs+vE/ZwnxXnSLlenW1l+t2xxC3ynZ3DkGTKFsD+Fh7e?=
 =?us-ascii?Q?25fbA0zZ4ZdUX2JMVHOg2umul3dDDGC8hMrkVwdyskOtUU3UEYXQrWehKPkj?=
 =?us-ascii?Q?EHuTN6Hve1QY3FGolovJbsJ6+Xhbs/PnaCyYTmIjHeZ4czw3x9Yy05p88KlW?=
 =?us-ascii?Q?JoMS1W2jh1RhXuIDLSv9IVY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wgViM0wBqUfzZwWl8DJON/gYNYw4TVETsaOhDxl4RWFHitR1kVNU/ZDHP42c?=
 =?us-ascii?Q?wyBqEBHCVsKa/ZtXYLBeUIi2Ez/pb2n4ZAAJN0v3GoH6dIVQXMQr9yeQ6AxI?=
 =?us-ascii?Q?HwpO/eZw/D758CV1cELVNV/GE1RwECg4z4BqnrXrLJTr9tFu251RUVNNn+sx?=
 =?us-ascii?Q?YeEuoN30yhjgwQ5flYA06f9txQFZ4O8Z1O+3EHQzRjCpj+pz9Gk7EU7efv+1?=
 =?us-ascii?Q?y+wRWdSjW+R2Jx9MVN7dZNzI0LMAKqUZAz5dgrshTKI3LN6M0tPd4aYUMLk+?=
 =?us-ascii?Q?57rxAbCD6GgjUS74D9pO1UUflQzpDkNqlExP+pXe2Dg5lLIRqz7sff7IW7FS?=
 =?us-ascii?Q?481+zir5GcvMYctvQYFM7DeQHpPSYncG44Ab2EWm8qOWAf/oh9FTpGQzkkFl?=
 =?us-ascii?Q?h1x3At6wtUw4HNNSTxvjrvY4qCSAwYSAeZZj3La65qYyhcfSV8Q7Jo9q43e7?=
 =?us-ascii?Q?wLr6ZopO0ZBgjLFWWUl+44rR9WzQtmzuon0SjehNzYeKlhMTGSDddGrdLQeV?=
 =?us-ascii?Q?Ptvpk3EZ2N6eyq39PV4/uO3ata/EMQI9+p13TYjzyXzKg5CBmvTVJWdxgKYh?=
 =?us-ascii?Q?6/hsRhZlw1mo4nGCSbaKHCQigH408v7CF9pxuMNcwvT8nOX0IZsF2ahQbLDW?=
 =?us-ascii?Q?FUetPsp+xNkwP48S+dDuhKmUJ0t5Pheg3aAlLf1OkbvdtwG8T8OrbCV3Ux+g?=
 =?us-ascii?Q?HGku3mdpA3BGLCks5HyW+Y42njFkpOInTll3PWegW0Q/hWyw6mT/BfBtLZyw?=
 =?us-ascii?Q?n6XeDjuESHboWz8hjh5oK3oIfMaaCgCSGIEfs24LOcllW4ZVDCqS11wdK1W5?=
 =?us-ascii?Q?nlvhEyPu8105IIX08DMsMCjunvED8TKGrUSxZeCFdc7TP4ccRzqFrfBzDgFq?=
 =?us-ascii?Q?2mfYyGBFhTDwMxEi8pBo1Sg9zl4ftp/TQDlROkQFhtIbX5lDrJ+xF0oqZBQP?=
 =?us-ascii?Q?6QRamEvLFspp6U0iMgHh5WjKgVPKPEsYqHHi0lqeNLz3iSjEZowJ0gQwjbBa?=
 =?us-ascii?Q?S27ZgKZMs8UzjiPLgQFjn2OntBnSPNfE6oYfwY6Hj3oiCn0BTqvhm99b2Hm/?=
 =?us-ascii?Q?OolAnCmBaVB6J1bwtTSvYEWZonquA+yFRxw3ulXkBvoCCzGRo/+g40XKcPu7?=
 =?us-ascii?Q?DfKlOThL0Agqmmh8ZIQeQskeMIpH5ngy6/TQWzIcaIQB+QEbduk8sxPUaJbw?=
 =?us-ascii?Q?OeV7YOub+TCTILiFeHRfv8M1PMh9Y/NpqOOoGUuWszKdKrgM08/V41F/LONV?=
 =?us-ascii?Q?pMu5hrnjzt+RNuxcILiVDi+FVLPWpVneEgvoUPbAfYpR5IpZPDiCrQO7Ym8S?=
 =?us-ascii?Q?K5bm+7xVIjYZ8nLdcTpiFdxFs66Iw98U4hoz//2vG1GEZgwQgWJh7LLmWowH?=
 =?us-ascii?Q?+XcsbcyFBlhUPfKY5ohCCvm/J8WGSCDfjAmb2JNeax/KrVZ0z3y2pqDZA/Pe?=
 =?us-ascii?Q?Hj3xxEFLkPQGWtmAkMZ+7IVNw++P8S/8zVtaS9Go8Ndum95fjIpmO309ve1k?=
 =?us-ascii?Q?1JPWtAgtvi1y6mS5lYgDkE0a79VBKw66d3mzxYvq1vzd6LnDHv6k92dxH9Vg?=
 =?us-ascii?Q?g5aYHBHdP1iNPBfZcBuit9sWhB90mvg/hf6dLmUGIKXVcVs6Zl43LFH7ymhx?=
 =?us-ascii?Q?5OIGZjdc5LAjcvEF5x07/Srw0ZGjh3Vj+pDlm8oD1dkxidfem5ZnWMjPfWvK?=
 =?us-ascii?Q?4mMUYfbD5LCmJoKGFzJGOGH2d6NxV4WQJkXn6oEumkGPxKlMeJoXpY6rkIb1?=
 =?us-ascii?Q?aMbh4PIt6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 677d7c61-5f52-4bd8-6fe8-08de5e38f87b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 06:46:31.2776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7K/KjkJ6ct7coKTPdKr59s3Sx2Be4QlUmNG76DE6UrxznCyJtHjw+D3pBJyBBwssShSOUG2wp2zyiuy58hVAvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230079

Patch for this CVE has been already submitted under https://lists.openembed=
ded.org/g/openembedded-core/message/229940
Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Yu, Mingli via
> lists.openembedded.org
> Sent: Wednesday, January 28, 2026 6:56
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] libxml2: Fix CVE-2026-0989
>=20
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> Backport a patch [1] to fix CVE-2026-0989.
>=20
> [1] https://gitlab.gnome.org/GNOME/libxml2/-
> /commit/19549c61590c1873468c53e0026a2fbffae428ef
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../libxml/libxml2/CVE-2026-0989.patch        | 314 ++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.15.1.bb    |   1 +
>  2 files changed, 315 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
>=20
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch b/meta/=
recipes-
> core/libxml/libxml2/CVE-2026-0989.patch
> new file mode 100644
> index 0000000000..800c8cf845
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
> @@ -0,0 +1,314 @@
> +From 19549c61590c1873468c53e0026a2fbffae428ef Mon Sep 17 00:00:00 2001
> +From: Daniel Garcia Moreno <daniel.garcia@suse.com>
> +Date: Fri, 10 Oct 2025 09:38:31 +0200
> +Subject: [PATCH] Add RelaxNG include limit
> +
> +This patch adds a default xmlRelaxNGIncludeLimit of 1.000, and that
> +limit can be modified at runtime with the env variable
> +RNG_INCLUDE_LIMIT.
> +
> +Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/998
> +
> +CVE: CVE-2026-0989
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-
> /commit/19549c61590c1873468c53e0026a2fbffae428ef]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + include/libxml/relaxng.h                 |  4 ++
> + relaxng.c                                | 63 ++++++++++++++++++++--
> + runtest.c                                | 67 ++++++++++++++++++++++++
> + test/relaxng/include/include-limit.rng   |  4 ++
> + test/relaxng/include/include-limit_1.rng |  4 ++
> + test/relaxng/include/include-limit_2.rng |  4 ++
> + test/relaxng/include/include-limit_3.rng |  8 +++
> + 7 files changed, 150 insertions(+), 4 deletions(-)
> + create mode 100644 test/relaxng/include/include-limit.rng
> + create mode 100644 test/relaxng/include/include-limit_1.rng
> + create mode 100644 test/relaxng/include/include-limit_2.rng
> + create mode 100644 test/relaxng/include/include-limit_3.rng
> +
> +diff --git a/include/libxml/relaxng.h b/include/libxml/relaxng.h
> +index eafc6604..099dacd8 100644
> +--- a/include/libxml/relaxng.h
> ++++ b/include/libxml/relaxng.h
> +@@ -136,6 +136,10 @@ XMLPUBFUN int
> + 		    xmlRelaxParserSetFlag	(xmlRelaxNGParserCtxt *ctxt,
> + 						 int flag);
> +
> ++XMLPUBFUN int
> ++		    xmlRelaxParserSetIncLImit	(xmlRelaxNGParserCtxt *ctxt,
> ++						 int limit);
> ++
> + XMLPUBFUN void
> + 		    xmlRelaxNGFreeParserCtxt	(xmlRelaxNGParserCtxt *ctxt);
> + XMLPUBFUN void
> +diff --git a/relaxng.c b/relaxng.c
> +index 1d74ba9f..c0e94a3c 100644
> +--- a/relaxng.c
> ++++ b/relaxng.c
> +@@ -18,6 +18,8 @@
> +
> + #ifdef LIBXML_RELAXNG_ENABLED
> +
> ++#include <errno.h>
> ++#include <stdlib.h>
> + #include <string.h>
> + #include <stdio.h>
> + #include <stddef.h>
> +@@ -44,6 +46,12 @@
> + static const xmlChar *xmlRelaxNGNs =3D (const xmlChar *)
> +     "http://relaxng.org/ns/structure/1.0";
> +
> ++/*
> ++ * Default include limit, this can be override with RNG_INCLUDE_LIMIT
> ++ * env variable
> ++ */
> ++static const int _xmlRelaxNGIncludeLimit =3D 1000;
> ++
> + #define IS_RELAXNG(node, typ)						\
> +    ((node !=3D NULL) && (node->ns !=3D NULL) &&				\
> +     (node->type =3D=3D XML_ELEMENT_NODE) &&
> 	\
> +@@ -218,6 +226,7 @@ struct _xmlRelaxNGParserCtxt {
> +     int incNr;                  /* Depth of the include parsing stack *=
/
> +     int incMax;                 /* Max depth of the parsing stack */
> +     xmlRelaxNGIncludePtr *incTab;       /* array of incs */
> ++    int incLimit;               /* Include limit, to avoid stack-overfl=
ow on parse */
> +
> +     int idref;                  /* requires idref checking */
> +
> +@@ -1342,6 +1351,23 @@ xmlRelaxParserSetFlag(xmlRelaxNGParserCtxt *ctxt,
> int flags)
> +     return(0);
> + }
> +
> ++/**
> ++ * Semi private function used to set the include recursion limit to a
> ++ * parser context. Set to 0 to use the default value.
> ++ *
> ++ * @param ctxt  a RelaxNG parser context
> ++ * @param limit the new include depth limit
> ++ * @returns 0 if success and -1 in case of error
> ++ */
> ++int
> ++xmlRelaxParserSetIncLImit(xmlRelaxNGParserCtxt *ctxt, int limit)
> ++{
> ++    if (ctxt =3D=3D NULL) return(-1);
> ++    if (limit < 0) return(-1);
> ++    ctxt->incLimit =3D limit;
> ++    return(0);
> ++}
> ++
> + /**********************************************************************=
**
> +  *									*
> +  *			Document functions				*
> +@@ -1397,7 +1423,7 @@ xmlRelaxReadMemory(xmlRelaxNGParserCtxtPtr ctxt,
> const char *buf, int size) {
> +  *
> +  * @param ctxt  the parser context
> +  * @param value  the element doc
> +- * @returns 0 in case of error, the index in the stack otherwise
> ++ * @returns -1 in case of error, the index in the stack otherwise
> +  */
> + static int
> + xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr ctxt,
> +@@ -1411,9 +1437,15 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr
> ctxt,
> +                                                sizeof(ctxt->incTab[0]))=
;
> +         if (ctxt->incTab =3D=3D NULL) {
> +             xmlRngPErrMemory(ctxt);
> +-            return (0);
> ++            return (-1);
> +         }
> +     }
> ++    if (ctxt->incNr >=3D ctxt->incLimit) {
> ++        xmlRngPErr(ctxt, (xmlNodePtr)value->doc, XML_RNGP_PARSE_ERROR,
> ++                   "xmlRelaxNG: inclusion recursion limit reached\n", N=
ULL, NULL);
> ++        return(-1);
> ++    }
> ++
> +     if (ctxt->incNr >=3D ctxt->incMax) {
> +         ctxt->incMax *=3D 2;
> +         ctxt->incTab =3D
> +@@ -1422,7 +1454,7 @@ xmlRelaxNGIncludePush(xmlRelaxNGParserCtxtPtr
> ctxt,
> +                                                 sizeof(ctxt->incTab[0])=
);
> +         if (ctxt->incTab =3D=3D NULL) {
> +             xmlRngPErrMemory(ctxt);
> +-            return (0);
> ++            return (-1);
> +         }
> +     }
> +     ctxt->incTab[ctxt->incNr] =3D value;
> +@@ -1586,7 +1618,9 @@ xmlRelaxNGLoadInclude(xmlRelaxNGParserCtxtPtr
> ctxt, const xmlChar * URL,
> +     /*
> +      * push it on the stack
> +      */
> +-    xmlRelaxNGIncludePush(ctxt, ret);
> ++    if (xmlRelaxNGIncludePush(ctxt, ret) < 0) {
> ++        return (NULL);
> ++    }
> +
> +     /*
> +      * Some preprocessing of the document content, this include recursi=
ng
> +@@ -7261,11 +7295,32 @@ xmlRelaxNGParse(xmlRelaxNGParserCtxt *ctxt)
> +     xmlDocPtr doc;
> +     xmlNodePtr root;
> +
> ++    const char *include_limit_env =3D getenv("RNG_INCLUDE_LIMIT");
> ++
> +     xmlRelaxNGInitTypes();
> +
> +     if (ctxt =3D=3D NULL)
> +         return (NULL);
> +
> ++    if (ctxt->incLimit =3D=3D 0) {
> ++        ctxt->incLimit =3D _xmlRelaxNGIncludeLimit;
> ++        if (include_limit_env !=3D NULL) {
> ++            char *strEnd;
> ++            unsigned long val =3D 0;
> ++            errno =3D 0;
> ++            val =3D strtoul(include_limit_env, &strEnd, 10);
> ++            if (errno !=3D 0 || *strEnd !=3D 0 || val > INT_MAX) {
> ++                xmlRngPErr(ctxt, NULL, XML_RNGP_PARSE_ERROR,
> ++                           "xmlRelaxNGParse: invalid RNG_INCLUDE_LIMIT =
%s\n",
> ++                           (const xmlChar*)include_limit_env,
> ++                           NULL);
> ++                return(NULL);
> ++            }
> ++            if (val)
> ++                ctxt->incLimit =3D val;
> ++        }
> ++    }
> ++
> +     /*
> +      * First step is to parse the input document into an DOM/Infoset
> +      */
> +diff --git a/runtest.c b/runtest.c
> +index 49519aef..45109f0a 100644
> +--- a/runtest.c
> ++++ b/runtest.c
> +@@ -3741,6 +3741,70 @@ rngTest(const char *filename,
> +     return(ret);
> + }
> +
> ++/**
> ++ * Parse an RNG schemas with a custom RNG_INCLUDE_LIMIT
> ++ *
> ++ * @param filename  the schemas file
> ++ * @param result  the file with expected result
> ++ * @param err  the file with error messages
> ++ * @returns 0 in case of success, an error code otherwise
> ++ */
> ++static int
> ++rngIncludeTest(const char *filename,
> ++               const char *resul ATTRIBUTE_UNUSED,
> ++               const char *errr ATTRIBUTE_UNUSED,
> ++               int options ATTRIBUTE_UNUSED) {
> ++    xmlRelaxNGParserCtxtPtr ctxt;
> ++    xmlRelaxNGPtr schemas;
> ++    int ret =3D 0;
> ++
> ++    /* first compile the schemas if possible */
> ++    ctxt =3D xmlRelaxNGNewParserCtxt(filename);
> ++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandle=
r,
> ++                                        NULL);
> ++
> ++    /* Should work */
> ++    schemas =3D xmlRelaxNGParse(ctxt);
> ++    if (schemas =3D=3D NULL) {
> ++        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n"=
,
> ++                         filename);
> ++        ret =3D -1;
> ++        goto done;
> ++    }
> ++    xmlRelaxNGFree(schemas);
> ++    xmlRelaxNGFreeParserCtxt(ctxt);
> ++
> ++    ctxt =3D xmlRelaxNGNewParserCtxt(filename);
> ++    /* Should fail */
> ++    xmlRelaxParserSetIncLImit(ctxt, 2);
> ++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandle=
r,
> ++                                        NULL);
> ++    schemas =3D xmlRelaxNGParse(ctxt);
> ++    if (schemas !=3D NULL) {
> ++        ret =3D -1;
> ++        xmlRelaxNGFree(schemas);
> ++    }
> ++    xmlRelaxNGFreeParserCtxt(ctxt);
> ++
> ++    ctxt =3D xmlRelaxNGNewParserCtxt(filename);
> ++    /* Should work */
> ++    xmlRelaxParserSetIncLImit(ctxt, 3);
> ++    xmlRelaxNGSetParserStructuredErrors(ctxt, testStructuredErrorHandle=
r,
> ++                                        NULL);
> ++    schemas =3D xmlRelaxNGParse(ctxt);
> ++    if (schemas =3D=3D NULL) {
> ++        testErrorHandler(NULL, "Relax-NG schema %s failed to compile\n"=
,
> ++                         filename);
> ++        ret =3D -1;
> ++        goto done;
> ++    }
> ++    xmlRelaxNGFree(schemas);
> ++
> ++done:
> ++    xmlRelaxNGFreeParserCtxt(ctxt);
> ++    return(ret);
> ++}
> ++
> + #ifdef LIBXML_READER_ENABLED
> + /**
> +  * Parse a set of files with streaming, applying an RNG schemas
> +@@ -5202,6 +5266,9 @@ testDesc testDescriptions[] =3D {
> +     { "Relax-NG regression tests" ,
> +       rngTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
> +       XML_PARSE_DTDATTR | XML_PARSE_NOENT },
> ++    { "Relax-NG include limit tests" ,
> ++      rngIncludeTest, "./test/relaxng/include/include-limit.rng", NULL,=
 NULL, NULL,
> ++      0 },
> + #ifdef LIBXML_READER_ENABLED
> +     { "Relax-NG streaming regression tests" ,
> +       rngStreamTest, "./test/relaxng/*.rng", NULL, NULL, NULL,
> +diff --git a/test/relaxng/include/include-limit.rng b/test/relaxng/inclu=
de/include-
> limit.rng
> +new file mode 100644
> +index 00000000..51f03942
> +--- /dev/null
> ++++ b/test/relaxng/include/include-limit.rng
> +@@ -0,0 +1,4 @@
> ++<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> ++<grammar xmlns=3D"http://relaxng.org/ns/structure/1.0">
> ++    <include href=3D"include-limit_1.rng"/>
> ++</grammar>
> +diff --git a/test/relaxng/include/include-limit_1.rng b/test/relaxng/inc=
lude/include-
> limit_1.rng
> +new file mode 100644
> +index 00000000..4672da38
> +--- /dev/null
> ++++ b/test/relaxng/include/include-limit_1.rng
> +@@ -0,0 +1,4 @@
> ++<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> ++<grammar xmlns=3D"http://relaxng.org/ns/structure/1.0">
> ++    <include href=3D"include-limit_2.rng"/>
> ++</grammar>
> +diff --git a/test/relaxng/include/include-limit_2.rng b/test/relaxng/inc=
lude/include-
> limit_2.rng
> +new file mode 100644
> +index 00000000..b35ecaa8
> +--- /dev/null
> ++++ b/test/relaxng/include/include-limit_2.rng
> +@@ -0,0 +1,4 @@
> ++<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> ++<grammar xmlns=3D"http://relaxng.org/ns/structure/1.0">
> ++    <include href=3D"include-limit_3.rng"/>
> ++</grammar>
> +diff --git a/test/relaxng/include/include-limit_3.rng b/test/relaxng/inc=
lude/include-
> limit_3.rng
> +new file mode 100644
> +index 00000000..86213c62
> +--- /dev/null
> ++++ b/test/relaxng/include/include-limit_3.rng
> +@@ -0,0 +1,8 @@
> ++<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> ++<grammar xmlns=3D"http://relaxng.org/ns/structure/1.0">
> ++    <start>
> ++        <element name=3D"root">
> ++            <empty/>
> ++        </element>
> ++    </start>
> ++</grammar>
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-
> core/libxml/libxml2_2.15.1.bb
> index a64ed8098e..26fe27e933 100644
> --- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
> @@ -17,6 +17,7 @@ inherit gnomebase
>  SRC_URI +=3D
> "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtestt=
ar \
>             file://CVE-2026-0990.patch \
>             file://CVE-2026-0992.patch \
> +           file://CVE-2026-0989.patch \
>             file://run-ptest \
>             file://install-tests.patch \
>             file://0001-Revert-cmake-Fix-installation-directories-in-libx=
ml2.patch \
> --
> 2.34.1


