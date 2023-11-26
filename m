Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCD1C07D59
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 21:24:43 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.76])
 by mx.groups.io with SMTP id smtpd.web10.66446.1701033882177896589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 13:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=TP0IVshR;
 spf=pass (domain: axis.com, ip: 40.107.241.76, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiYbqVl2VnRxh6BbIkyxDd2uOgjZZzoWrmlPmYLFzse/makKlP6ElQyeFEqnbRPfNVT3LON6TydsLd9N3jXyxp8YbXf9dOr27yqiUhdUkQl43ntOEO3VDK9lSWlwPL3k/QHS8LHZqrPv47kmze/83SIgNPRljA/HfveMlEYfBtvoTrNixjZPblxtJ+QpCdvl17/2byMgH+tKPDmAvUiWIvhyn64dsKuvYYhOsKUWRB7Mkw15l2jCzkmgqQTDKZNg95XsW3gZ1J4r/pdSIh6sotZDwo5tXQycgJFmCcn3+iFzqZVHmCrhDjkKovUzZWQTinhJJcRuOUyYGBSx3iymhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHejyO4y9EfF5pJkp02bZq9IYmSpJPeHfmvKaJybkA4=;
 b=CgCZW6BOHTIp7Gr+ZDIaPaQPSuZ8lqME3YSB3c9hYy6e94eq3IEzaRl4AWgNtIuyop3CcJ6d3E9RaXH7XIaskPdsxsDh6DnObdu2aq7VAEMlqZ4fOtu8n/bxdgfvyJkR4t+U1kyQX6WLgAPWcaSlKNyOfuPvAtik7fRm5mBXJTKslKOkCjk/5MLA04LGu9WGOeKzZBiYdFpD8U1nl2r2oKMQ2iqkRjyNqCudpZuY0NJkUEwLSrMowjqd5jMpTNGrnwrAIWHP/pKDUweUekC+iqNm6MzezVKi+DC06FgKEoJPaEDsGzGpSwwT9FJ7W0h20F63sBSWo8k1z6wwPZaB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHejyO4y9EfF5pJkp02bZq9IYmSpJPeHfmvKaJybkA4=;
 b=TP0IVshR38Nr0hhuvkwEhuNWckLd6znLYPeErvDPGW1B9vHOY755/Da2xW/OVhyDVXtt8cjBACDtA7cXORfzI4a3hdbhZumciqTjSf47oVro1W92CxOyw4Uhn2VMiJIbNNGXym1YygXx3oZuZc+TmqDVJld9oWHJo+0EnW1Kmvo=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8347.eurprd02.prod.outlook.com (2603:10a6:10:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 21:24:38 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 21:24:38 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [kirkstone][PATCH 3/4] pseudo: Add PW_SUBDIR
Thread-Topic: [OE-core] [kirkstone][PATCH 3/4] pseudo: Add PW_SUBDIR
Thread-Index: AQHaHuAobgXj3vTS2EuojOSpCAldhLCNGiug
Date: Sun, 26 Nov 2023 21:24:37 +0000
Message-ID: 
 <DB5PR02MB1021306EE31EF0BB7E68B32DEEFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
 <20231124141108.1397342-4-joakim.tjernlund@infinera.com>
In-Reply-To: <20231124141108.1397342-4-joakim.tjernlund@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8347:EE_
x-ms-office365-filtering-correlation-id: e8973bf9-fe72-4c10-7d7d-08dbeec61835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yiO75Ziw2fhie1I3+s4JH0ajpGnalj66/1WnKAVJB9U0Feeejm3t7UaLTph8RNQYddHmM6etXrv9gr8bj4kV+zeMW1kULo52SoAuUjOol2HtKnPH2GR5hYuoV8kSqgYK8aOaeJqTWv0GRYDTp3T9/2SxcWBbgtXo4kmi6JUOkdZLYTD0+F3i2s4A7Y+TKKltM9TDIDBervxaPK3WVZAL5/X8MI1fZWVwtujD1WKJ0daPwDEH3dI1HRzcgje+i6Nfj9zhwcjyfYr+glX0cGWbr44rSwWQmr0LOKL7xQfpBhOC2dR0R3IFckLkjGK5vj6dCS9MlXpCXoTfDcfQlBTSl8G5z9HNe9St4lKy3mgX/vp7WVLw5y/o3zCRZBZYqCYOP5Tt+oS8ZXprrIRzTt5a/enLiolXJA6OFHjXzi6SMVY/24xO5DdVjweTw6kcieSN4+RiSoZUChKto8RjTR5y03n3qum4KEmiUDIR8mSdhtifH6om9XDImWya6usoNj8U7wAQEDFahVGzimtcExrOZm2DCNTRDLj/K+gJseid93yby5VsJj1+BhsuHJKWRLTVBgB6XxFUqE48tQfCQGW/G3hXMV9wOQ78CgxhocQec1Jf1xoCX6ZT2+Cj4Y1VvAgg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(376002)(396003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(38100700002)(122000001)(55016003)(52536014)(9686003)(53546011)(7696005)(6506007)(71200400001)(8936002)(76116006)(66556008)(66946007)(110136005)(316002)(66446008)(64756008)(66476007)(5660300002)(44832011)(8676002)(478600001)(86362001)(41300700001)(2906002)(33656002)(38070700009)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tYbtuLcEQulZ8rGIIzQBLlPohXBM6dK2AiJuPq4j/y26hcCAai+3qVe8PmTm?=
 =?us-ascii?Q?imzfKJhOWlKs6B24Itv0PuJT71dGwXLByRsZIgFrptGVScFvAWsewWcluk1N?=
 =?us-ascii?Q?VWMrWolac3GEhHgyN2jrKi0n7Cl8FM2v8kCur40xtzja54Q9pWnmS1CBHeeU?=
 =?us-ascii?Q?kgeWXpRFo078CnlwD7UwwcwOC+AH4EPDafsPy3NEIKBwpeEMhQn5OIOrEb27?=
 =?us-ascii?Q?yveSXQ0aCjyEGcsGW6b99qySP+cMbVv1XeOpc0YaM0laAzmEX9cfM3G5ALfY?=
 =?us-ascii?Q?F0y8kE5UBKx4PwT5NiA+PkN6dl/pJxuLuNpWsdzeSo/8s41kgjot02nUcXt6?=
 =?us-ascii?Q?2w4pWQhtQ5oTvuyVZh/iMAU3BuA7V8q3mt8yGNR5/XcemUYnaJPL90ECVYy7?=
 =?us-ascii?Q?n8hLifu0oBFt8Pqd9VmwFN8AG5KyBkH8Yx7PeixYS8zVqGTmN3k3hXwz/1jY?=
 =?us-ascii?Q?Ak14eZHnTmV/tpmwLqWCRz8ZG4iaTm9xiVkSHiBznjuyrCOoKyhQSkE+pPL4?=
 =?us-ascii?Q?IIbk6gkaArDb5fYnVtjliz/5kvK9VP7voUU4DTUhoTrVyUDnVnox6nID8/3L?=
 =?us-ascii?Q?46i/mI+f4U2oyrg6GnDNpFcUOIbd+/p4itiJKX02ZK4Rnb/SdLZ0mJ/wAaNA?=
 =?us-ascii?Q?HWr+yh3Z7l9i2ijG8XOYMN7E0imqrn4cQucin3NwYtA8XbHrdBT+pGZqhuCM?=
 =?us-ascii?Q?4OmFnqJC2C1PA8hGQIEyQoeP1vEWpRYTwFjcHhncguQsCkX145dzJKBkLaEH?=
 =?us-ascii?Q?n9bWlIdg2CihDZfAOIpfdQ8nLJ45Kz1GUDsnqHqy2FsSBlm/n3DNlf3C5qGs?=
 =?us-ascii?Q?qoMneTo/rV8n+CJ44lFvywIZ6c4im1D1aob7GAG38N/JC/haLKDvDhUzn06C?=
 =?us-ascii?Q?LpCPFKnBValvIJeHyHFbmN/j5finAOTwVleq1VgfN64JsQOn8ag1udKL14NR?=
 =?us-ascii?Q?PdPaVL+51u24Z/ETK3DB15cgNLI1K+03A8QS78DlLb9JVFO4df7BLXnkJA6e?=
 =?us-ascii?Q?bO/0ZNCLyIxJS+vQmWWDwU7kBfdy0PihYlBMp+O9Gg07AT9tEPnMU/jRzLyH?=
 =?us-ascii?Q?uZJFSVi1cnYqnNckhjR4PwayPtdxaWkv3MklF8Nx3ArhpOjJvZ+C2okHB4T0?=
 =?us-ascii?Q?m7YqtwOYrJRK04THWSjDSpwwwFbw4Z4xKB4adsncYRxs4bLvXxURac8ItRit?=
 =?us-ascii?Q?gY0dMPfoOC//eZGYTmS7Ms1tt5JxVza3TxWbIdfyjgZC8sh0m7oRy3IJjDxI?=
 =?us-ascii?Q?okJmCbNKq+2d8dWMUrkVvqdBUm7QThXpi1u7tFbq7S4OJz+O4mNoV67vyRpU?=
 =?us-ascii?Q?UR1AWLrYBHv1hBSgnwrh3dF5qPZLwKGk3VImeN2LUwJQjFi4bGVchFmEAp58?=
 =?us-ascii?Q?HSgvbCIIdWxIl6Cw+2pYxGc2aZVL/DPmOLGh0RjwgvU1srCbSEQ+Z9Bjl/tu?=
 =?us-ascii?Q?tVhbTSMO4KZl+H5E5Mvph0krHLdaGTZNrmuG0xxje4GfrKS5M9W5n+XaCMEY?=
 =?us-ascii?Q?dRf8Xz7SAKrqeSsrUOqmR84q16QL2BjfTjLrzz0h4q2jI8fVPp8v2pHW9MZd?=
 =?us-ascii?Q?m+LjKu0nhKKYAX3iF+8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8973bf9-fe72-4c10-7d7d-08dbeec61835
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2023 21:24:38.0053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eneht6WPfWSNgzidkRSNuHavSPhHJuQn+3dYgI7OK1bki3b+ipIHcD/gBcwVThlv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Nov 2023 21:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191239

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joakim Tjernlund via lists.openembedded.org
> Sent: den 24 november 2023 15:11
> To: openembedded-core@lists.openembedded.org
> Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Subject: [OE-core] [kirkstone][PATCH 3/4] pseudo: Add PW_SUBDIR
>=20
> Add support for creating passwd files in a /etc subdir
> Set PW_SUBIR to pwdb to get passwd files in /etc/pwdb
>=20
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index 7e09b6d58c..7ba2e2261c 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -10,6 +10,9 @@ SECTION =3D "base"
>  LICENSE =3D "LGPL-2.1-only"
>  DEPENDS =3D "sqlite3 attr"
>=20
> +#Set PW_SUBDIR to pwdb to get passwd files in /etc/pwdb
> +PW_SUBDIR ?=3D ""
> +
>  FILES:${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${lo=
calstatedir}/pseudo ${prefix}/var/pseudo"
>  INSANE_SKIP:${PN} +=3D "libdir"
>  INSANE_SKIP:${PN}-dbg +=3D "libdir"
> @@ -131,10 +134,12 @@ do_install () {
>=20
>  do_install:append:class-native () {
>  	chrpath ${D}${bindir}/pseudo -r `chrpath ${D}${bindir}/pseudo | cut -d =
=3D -f 2 | sed s/XORIGIN/\\$ORIGIN/`
> -	install -d ${D}${sysconfdir}
> +	install -d ${D}${sysconfdir}/${PW_SUBDIR}
>  	# The fallback files should never be modified
> -	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
> -	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
> +	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/${PW_SUBDIR=
}/passwd
> +        [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/passwd ${D}${syscon=
fdir}/passwd

Inconsistent indentation (spaces instead of tab). And here too I=20
recommend to use || instead of &&.

> +	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/${PW_SUBDIR}=
/group
> +        [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/group ${D}${sysconf=
dir}/group

Inconsistent indentation (spaces instead of tab).

>=20
>  	# Two native/nativesdk entries below are the same
>  	# If necessary install for the alternative machine arch.  This is only
> --
> 2.41.0

//Peter


