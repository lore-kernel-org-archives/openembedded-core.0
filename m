Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9ABC4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 16:59:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.116])
 by mx.groups.io with SMTP id smtpd.web10.68275.1707152340101069623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 08:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=L9rdtkAK;
 spf=pass (domain: axis.com, ip: 40.107.22.116, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3EZ0yJLsnPLIhTHacjAEV22w3LSwQcj9mZIKceSf20iLM6Paah0u/36ulSOngWLPF1Aoakbjc1M2wp5ZP1TGWSrfXL+l+JFwYpTK4sY9ZPPIio5eJ3hMdWNBwxiL0BgEZilP+VuCOXJhTdQubgqI/pd6nUi5+yVu5yTfwHGNEX8WAGIs+M35EFuwQaSh6OZliaOpLBBdzo9aaPd4Kp1/OMy13CR8b6yVk9hrlxQSTTjMk/vR+Ruxdac/2di5DqNlr50KL40GB5OxkyhWEzTQK5ZDIsW/uY9vQcBGcZ0l2TYS5FuPzCF1zrnualS3+/Bek4P5dm84dTgrWw/GNvQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/6/YVurX0q6HVmN37MhW8XHb+uk5Y52n+/RvSfjG7o=;
 b=XGMFJflmxjXzgVcw+iWesxWChKZ5lWIH88JogHzImunVNqTCggnZah+cIaq2yA17M9ysiCVcrAnElQ3WavsY9JKQXkRP0Z+AfusxajWKMdlcGgrtK9IMAOKJAEKDvefSSVG4YqITM/4eDj8Q3khGsYGRbbnWEDSCXYXK8R7h7U/9Dcx/p1KRvd0tnqnO4B/V9l6XbZWDXDHG27WI9Way7UaC9K8Zojtev58m6WjhwEMFw5v0YCgIprkSSAdEfHlmy6V9rS3+omV5Jv5VztiKYJiDZOHaDCri7lPex9kqaicMx3GRoBSDnqmUuQM1vLKO5u8ypAQ5PgiFOD0HGiRE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/6/YVurX0q6HVmN37MhW8XHb+uk5Y52n+/RvSfjG7o=;
 b=L9rdtkAKCPRU7gJSBcqe6rAZuyPGDdyovspNt1FHgJHlUnpeCJTOTdhA/DnxbL2YWVMDahcaCeQ30LAY1UVyRTHJ9qmcO0wtG+KkR+7wE7qet5WyTselkGhHN+d43y8h57yp4UuJF6OYU5z2tozpmh4t45YWVxS5WYzesU1UrvI=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9666.eurprd02.prod.outlook.com (2603:10a6:20b:5ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 16:58:56 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Mon, 5 Feb 2024
 16:58:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] bitbake-diffsigs: Support tasks with
 dependencies correctly again
Thread-Topic: [OE-core] [PATCH] bitbake-diffsigs: Support tasks with
 dependencies correctly again
Thread-Index: AQHaWFLkzPgl6KO5rk2lR++ndjc6brD7+E0A
Date: Mon, 5 Feb 2024 16:58:55 +0000
Message-ID: 
 <DB5PR02MB102136FD6FFDF926ED5026B4AEF472@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17B10553E4A3C84A.8798@lists.openembedded.org>
In-Reply-To: <17B10553E4A3C84A.8798@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9666:EE_
x-ms-office365-filtering-correlation-id: ac098e01-19f1-4bde-4abb-08dc266bbd5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LcT7GaXkj2bMOThXmVESEywQYjTo9/cPcFgQaL/9nQvxNch/nWwG7SDkSG2OxI2qArcFVvmrmUG1k+5DscYTjZrU/uK+E8Z8Gcx2ePT325x9dqW4cbJPBRMi79ibmubnxgG7zsRw5uszkprL4Ug7XNc67ph2MAkwi2iZu5WmaJgjxqyB5NJLG4OiLCy25547wJikxJ7Afc57hX2qVhqMIw3WQ1b29wcm+mpjdGeVYtBgjKLEv25SJbrYAidzaKl+7BaNiggXZiuemQExvwfESgqw0umj5NqQWY+MV0Wtw7IWqVD23DPTgcots5yxcckczqTWa0MNA1OGGgnv2wZPSJNceN3j4KWBdWneX3hjqXqtORvGcwx96A3JtveiC9cqXNl4v6dPulfQczjryQXohCpVn49EbirTbiHHpzntFgPmFNIjOi3RiLDmavnA8MuNeiv3QAOG5LCbLuwdJckSpPnng/j+RnRCmlacjoMk5Si9OgLcSYz6FTKbQtMgNmY7f7D5tZyYCR47HAJCplkGfLS1UvYQ4ZrB5xhC7hOAH+B7L/HzK075fhIYqXsTpjSZ2iVOvdKiqM7DRRpih5DCgGmWVMHt7ZHgzu4Nk9ON+z08t+alPHFGctmZq6KP0BOm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(41300700001)(66476007)(66946007)(5660300002)(2906002)(52536014)(33656002)(38100700002)(44832011)(66556008)(66446008)(55016003)(83380400001)(8936002)(8676002)(26005)(64756008)(110136005)(316002)(76116006)(9686003)(38070700009)(53546011)(7696005)(6506007)(122000001)(86362001)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?O0DrVuJD3LXtVTww2CA59wvofERtjpY5JVaYDrBDh8L75XvJE6v4xakYetTB?=
 =?us-ascii?Q?wUEGnrokiYPsJjiOBFNSijpEJ4RJFoMUtysvmLfJziIJtYHaNNuT/7Q3+9/o?=
 =?us-ascii?Q?XGoy3mhX6zN9yMST0Ep4gSzckh6+iJB3+DpHGNTQvAwTCjgIPlwVBgyZnVjz?=
 =?us-ascii?Q?PZ628oupLEVMgkEr6L19lewFfMnmrC8hy+P/vbNkUeH6f0JsKpdgYIFGX4Z+?=
 =?us-ascii?Q?7nUThB9o58b2cDwaPtBaKZeSaAobPZ3C1itsvM4JnFEo575QzDgeGrRdaJ8g?=
 =?us-ascii?Q?0Lrc2povwHgfHlBYGmh2kd5NX62a69tyf/8aCYEHjto1kFeS1x+Hz02TczoD?=
 =?us-ascii?Q?a7LO2Dn4/6GsfXFt84UUVgvyD1npzXahaUSSvqqk//oVEhgLungTvcXCo2eA?=
 =?us-ascii?Q?NA3Zh88gePmddXiIdm+UbCxk7mPYcwOr4m3x1Ad6eVFW1tkl4RHEYlzNXU43?=
 =?us-ascii?Q?bwvTnZ6R2k/y5f1ISInZb8h32Ku0LaeHSwLpUvHL4A+tg5B1I8pmqF5i958v?=
 =?us-ascii?Q?/T9JzcEwlFgrYPerdp6b9cZhxPEokXwnEn0GzQStC6kV+WxXqyptnqBGUF6q?=
 =?us-ascii?Q?OgYFbiSviLnG6/4BOPsEXjUhGF4hBclCo9pJxsgANxxUulfPGvByx5+r9inQ?=
 =?us-ascii?Q?DItJgPB+1zaC/iT38hP+ZxUBgWMWCS7i/cN8z0mBscXojzz5IZVpxsg+/R2T?=
 =?us-ascii?Q?tjQ7+98nq91319OCPspLjwJ7Ntfhy3GkqtK+qLwOLQ4TFLFGgeXdrgvfAY11?=
 =?us-ascii?Q?N7jNln+rCZaIkKDU0p4ZT6iANxVyHWr10xwsddx7NMXuawXGFZLS37FpFTi9?=
 =?us-ascii?Q?PwsUM/PWdyjF2OfNzEnSduF0YqKS8SGkNW/LP+DI+gXwdzlMq1Ik6E6i3mAp?=
 =?us-ascii?Q?jp6uAosPfs1tbPgDbSGy4gD7fcGfDlMi2uQOsperdHpQlpql50H86U9m6bB0?=
 =?us-ascii?Q?daM+PtGeDGR48XU33MF8444kkPEtbiMmL8s8nW7bktqnHNRMisz5jeGJV0ME?=
 =?us-ascii?Q?lJLt7S0U6TdJjUv6Xoru9j4rhmnXH3hxrOr0zZuPU8Rk2flB2YLU6vJ6jv6D?=
 =?us-ascii?Q?MGFWgjTZ767fTu1qQAD+fFuVjBs0OXtwvClTQpLPvF6ltTX51Z29eFfhgSGc?=
 =?us-ascii?Q?gZVivuHJjBEiNhxe+CLyGmsOqCZkAUyKYmCPNDLx4944m5D3sGJ845rW1sVp?=
 =?us-ascii?Q?7L8oJ4myIlVPFGQD+CIbeLdX4sD8pvMmIlLykvFhhW2e4ein7tS9Ns4m4yYc?=
 =?us-ascii?Q?VVU2043y32WTXgChKowthKOEQ1MHCKIg8eD0D8jJ3Mik4ZHyFppDeFeg6YuR?=
 =?us-ascii?Q?fFYfzrCxtCuU9ol2z7/DnZI81qH39C2eZ8aiZSMLTPK6Q15OZkfJtrgnxVwO?=
 =?us-ascii?Q?QaxhslREDl4waCnFgvRGkg8tPk3Z51rkuDKwvFHaplZL1p3HEhTWhZXAXKvh?=
 =?us-ascii?Q?ABVaI/Yi4SOk8n+MNILcL+tb3/aGEkN9C7dY775fTzp17TiGuQt1reePKsWR?=
 =?us-ascii?Q?KU2x3sqW5yqMFB/WZTo6dxCSjlHeHK1/TALwTxeY109mSwmPhxXsnP6wiGEQ?=
 =?us-ascii?Q?BLrtVbm3TqdaoJgyOdI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac098e01-19f1-4bde-4abb-08dc266bbd5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 16:58:55.9966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zvE3T7SBaRUR43VPMwuPpFmb4/yrXyg4oNs4O+hvJBms2Cl8v6tUU+aiQQgSWuOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9666
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 16:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194956

Ignore this. Sent it to the wrong list, and it seems JaMa beat me=20
to it on the bitbake list.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 5 februari 2024 17:46
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] bitbake-diffsigs: Support tasks with
> dependencies correctly again
>=20
> This was missed in commit 5439aca056c84ab4410aaf24bdb68e896191d8e1 that
> adapted the code to the changes made to find_siginfo(), which now
> returns a dict for each file rather than just the filename.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  bitbake/bin/bitbake-diffsigs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/bitbake/bin/bitbake-diffsigs b/bitbake/bin/bitbake-diffsigs
> index a8f49191b0..8202c78623 100755
> --- a/bitbake/bin/bitbake-diffsigs
> +++ b/bitbake/bin/bitbake-diffsigs
> @@ -99,7 +99,7 @@ def recursecb(key, hash1, hash2):
>      elif hash2 not in hashfiles:
>          recout.append("Unable to find matching sigdata for %s with hash
> %s" % (key, hash2))
>      else:
> -        out2 =3D bb.siggen.compare_sigfiles(hashfiles[hash1],
> hashfiles[hash2], recursecb, color=3Dcolor)
> +        out2 =3D bb.siggen.compare_sigfiles(hashfiles[hash1]['path'],
> hashfiles[hash2]['path'], recursecb, color=3Dcolor)
>          for change in out2:
>              for line in change.splitlines():
>                  recout.append('    ' + line)

