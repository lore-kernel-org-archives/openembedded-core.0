Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE488C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:49:00 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.30])
 by mx.groups.io with SMTP id smtpd.web10.3187.1742572133370847656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tKMgRoDL;
 spf=pass (domain: siemens.com, ip: 52.101.65.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1i9PFCBhGorPnDWO0f8XJmZf92iKbhOCvTWSekcWGOsSoCd1NW0SKS8Wtw2WfXjAHtk8cNIiPzyNnqTyoR4jxlnrft5W7akBZ/G5CtHXxsNVBpbRAqQoViNMqZxXemH4zQ29Gq8K2xkXBDBYKAiNr9nxsqNaEPGwT//GtDurRQ0DvMQqLdpKqwZ2xVfs6y+TzOEmdsOwWhNsDGhsaGtBOz6CJEacJPAgwwOohP8kWnUvhojjWKUk75h0GKIAJca5fWm2DO609j59dNBnKEJxmBPkTp3sXHhJl+d23Y/Y9ZGjwKtkPpusA1cFigAw4w1z5WDiHog1RuKQJ2dv+UeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNMhEs0aZ+zAv1b49+2Uq65hpzNrL07pIuIACUpc5ws=;
 b=QXVDQxVxCjygjNTgzejFcRaIip2lWulMeeEAFXcLVv+IHLwVEZulpcLuUsCQjsM+1FZL/zofPs/Ad7aKG39ZT+H6TohI1MK4CZokcsBa1Iu9dbzs0mWkBRvSsWvj6ET2eGPXTowu8agd3erfJDoJuZh5OLnuDDTHgdkyQFffFGkTjeVrvr7yLG1aj8ojln6OBMvESE4Y2lciPeHFtmTpF1zL3MmVowS9Rn11N/5bbpAwb+w1avQgBC74tA3b8q+3ZfL7i7hjDbA3A2r1B7OzglA4ch69JCM3L+MwET3Ap0zeZb9Fg0gHapGxzlUH2jkRBYMsyZzdGm082JdQQkOHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNMhEs0aZ+zAv1b49+2Uq65hpzNrL07pIuIACUpc5ws=;
 b=tKMgRoDLySN2aHS/7vygUSUnY2/V4cTYeHelck07J5NxcIYz75Ne5ndvgFkggVoJkGF28eg9rlbLhF/vM9qppy89OmiRaWXcymZEIu3wd81pOu76tDach+aq981V6NMormkmaAd+mXz4wsJRDH36zOrUZBVnACK68xZ5995GipzaUk5j7nOKHf6tymzNx0OjEmGMGFj9DsaocthCfsKraLQfXbhU2mGrhn+P9vqYM+nnlj0nqwuVCpi1GUeAaDc+TnzozLP1DY+maLvNUfu1aDSbNKUl0sT/CiywQ3kthwH+bSm1s7j9N3SqnBTuvH7UAkAkHl9pJVkJOQpGodQtmA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7567.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:401::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 15:48:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:48:50 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/2] oeqa: spdx: Add tar test for SPDX 2.2
Thread-Topic: [OE-core][PATCH 2/2] oeqa: spdx: Add tar test for SPDX 2.2
Thread-Index: AQHbmnPuOe3LZkH1vE+VKLqBYA9fo7N9vFFQ
Date: Fri, 21 Mar 2025 15:48:50 +0000
Message-ID: 
 <AS1PR10MB5697F163432556C158F9264BFDDB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250321151345.484603-1-JPEWhacker@gmail.com>
 <20250321151345.484603-3-JPEWhacker@gmail.com>
In-Reply-To: <20250321151345.484603-3-JPEWhacker@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1aa7dbc4-ee94-4814-b352-266f7c063c88;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-21T15:47:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7567:EE_
x-ms-office365-filtering-correlation-id: c7cc33e0-fbd6-4923-10bb-08dd688fdff6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?N0/lArlfoZ11zHyYD73bnIOLD8VxaLtNzQxseVbNRAqKYj1dz/luS26/Ybps?=
 =?us-ascii?Q?Xvyg2Vma68EfZidDGKvyRpoDYqE630kRwIewuPMIjM7uCBONaL6ogBdw80l/?=
 =?us-ascii?Q?4OwviwbbSBGRGnEu+aTAFz2iJQ7vO2jTXw8v5q78EJJxz/tErVCITVFJAANX?=
 =?us-ascii?Q?JEW5rTCctJ5AoBzWE1OFQtWf2eWZJJqDsM4lnuaJjMrUOQOWIwewNrUPy2N7?=
 =?us-ascii?Q?QyUYMWoi+/jGjxODGAdn7QmJYqXvnE7FWqfWqGEfhZ88vn9XjuUEJZX38i4I?=
 =?us-ascii?Q?2VH8O7pwAQ+7XPYJILJRUYnLzL0hACnQp6BMKxJa9tinsOZSgw/CcMLpXa+K?=
 =?us-ascii?Q?VHbkJeFDSTIqTw0O6p40ncSQC5HgjPbUiK2ZOaHHodVdAX9h+22MgAOsKs7I?=
 =?us-ascii?Q?dBgyas6nvB5G5y5EynCFGsSEEJ8xiMsBn4zdSy2eCpqrd148I3+BvRrvVlPw?=
 =?us-ascii?Q?ituygErfU4jThsnlK0482covI1gu4qBJE0fGk4bbQLZt3RClG/0Y1ebZMFuh?=
 =?us-ascii?Q?J8WTJFnfuFrAhscqCFxQwkRIHGeoKjowzyh0H+X3uq5MYdvsNtXrn863zUs6?=
 =?us-ascii?Q?yeRrMkRr9W6qXw2WEAH+toiO+u8B7TCJ4xsGPlWtqDRy4/7YkNFPFZK6oG0O?=
 =?us-ascii?Q?K6akCGxBD7J4RpEq2nm1/z37derG9VTxtxMwognprCnW01ew015IGcsbWLQl?=
 =?us-ascii?Q?NyfS9uUL4P1EQ9/RdQglb7Lugd05Qvg6n+tCc40uS7ganOcSCDj6Q4PkbmnQ?=
 =?us-ascii?Q?1oT59MmM4L0+SJ0bhaU3KSWeZ4ypqIJZj6q4zXYYM0ts6LRV0WoQBkrkeRm5?=
 =?us-ascii?Q?Fd0C95SyDLNMQIEOLyVZDpaYcIBm1KHZI8h5dhERYkpNmFHmVfQ/ta+deW/y?=
 =?us-ascii?Q?S7Mus7N3aABGQKnyuXv3ZAqS+VKniSfneRW8NREhiRxxO6r6P/qSh46qFEhb?=
 =?us-ascii?Q?mYDvif9kc6TpxF5Is53aw/q7Ct82NCltFxxITk3X/nCT0U+C6y+SR6Nz9ZBU?=
 =?us-ascii?Q?HVlk3X5DonSOBgs/J8pUj1ko+n8xFTER/TS3byXJ7aFMWFMluBlWtgj1Gs9y?=
 =?us-ascii?Q?p4Yn6kXJLgGiuMN6Pd2qyQz3YNg/b5/H4XgyBUd5EXS0eJU1n4YxRea6Nc1V?=
 =?us-ascii?Q?knhR9/kJk7HYW1EtBE1buBbCO4QQZRVV0Y4PsyGVgU6Lf0hBtEy8ohxO9AyV?=
 =?us-ascii?Q?pLc872/AI5DOF0t4DrohP7BCuX3Gu0rTs9Iao15uSMjt2bhrrz49MSbU1sZn?=
 =?us-ascii?Q?kRUNste7bJ6OvtoOC1/E+y2Oaxo6PcHMtE7O1iQcYLAunAdfR/e8BtKejkLV?=
 =?us-ascii?Q?46HZCSKzYwoN0n2CUAq9IDfdjnCHO7ZD1HHPnk9kbZabEuLLs0/SZa3Oz4/V?=
 =?us-ascii?Q?9bUllHK9X6mrIZpGsJBAGnvqIIXVqi+kk+NQ92FYunwY6qMhglKwiY8HKxl1?=
 =?us-ascii?Q?5tnj+pAkIv6aF18sTt4n9YLuN15JP0CT?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CTHXU01N5gosgawgyvBDYQnNM5IoLcMfbqwmIeGz2s1LELEDCUsY5YlP4a77?=
 =?us-ascii?Q?EhgTk3+L+A8PDcVuVUrUbGqTx23KgiPJ+XuKEM+tB5E6YvHnsdV6o7/fCjIf?=
 =?us-ascii?Q?F19kxGHjbqS1/KV9zETdytYCMZOBjWA8ikFxLs70ExJavjfpWWdNsPNKALD5?=
 =?us-ascii?Q?vECzxGX9+JoUlJBtr8kc4ORNk1NHR8rHhV2PWbovjle0PYt5yCTssfidBenK?=
 =?us-ascii?Q?cRP7eBRa9r+8rc1VJp8DNnkOvsokjFfpH97Qi6n59p2YGQLYaEVrRenJsQNv?=
 =?us-ascii?Q?Eja8znyvbTihSEoRqO2WszHCDydID84Vlwee/m4PSAUt1kFIwLhJ1lTjRMvf?=
 =?us-ascii?Q?vZrGgwMCCV2Q5kSeh3Q4FoRtcp86CyYT1ilg5KH+hotPExuyDuOSXho6Psw+?=
 =?us-ascii?Q?ubgpi2AOb1QHquf7u9LgJsbzZtRHTqCCva+jCiwPkECwBk4iuz4JmHk2QH9U?=
 =?us-ascii?Q?aDCFtwhqX6OGnP6lPiJopQaXu8gZVvXbk6C6oZCN9XpsvACudiqXWZsJRTq6?=
 =?us-ascii?Q?jWgbASS1n0JdZlxtQXd3qs8RP+IUfFJfgAsvfv6Oe0Llb1LQg6aTLR0vXW+t?=
 =?us-ascii?Q?LpPVrKRzKTnFxJhyX/oJfFNyT4CxcaxGu2ZWMYUYhfW2OOB67/RAhf3M74Jn?=
 =?us-ascii?Q?PAmLWcwkBHHTm/tBIE7h173o9Y4Tdt5UDdmy9iMx/p0odzKV0ijLzE2QSczK?=
 =?us-ascii?Q?kPMZJPWqdg84lFFElyz1QL+oxPLoxmmm1X6XlzRGKxiPcDIq6k4daAFH+Hb+?=
 =?us-ascii?Q?QvgXhzcpGA5RCT5tdcLV6DI2gxQ1GAj7Xd6LIGr44wDzSr7k+KCguJa/O5G0?=
 =?us-ascii?Q?g15Rg8OCbMShxtQoGyOk3vKif9Vjv+f3qyntedDiQwy1iG0rg6z7v/JN4zCx?=
 =?us-ascii?Q?57X5yte/KV+hT0hrbq4Ox19AOVnl8YIz6Xd1jyal7S+yy0AGbw3fT3iR9sOD?=
 =?us-ascii?Q?nXBflXOjxjo9SmAlK0PmunfdgoN0+Cua8j6ovmVzpiCmga7YQckQteOTeklq?=
 =?us-ascii?Q?AJZcbus9lraSHWWfRWUdbMEssCvndD1hJAt/UzGDw4FMdlddfx7bAERS1nW3?=
 =?us-ascii?Q?mlB/+MAZ4CAwgYbJdsPY8fLIU8HMtYCujAMpS2p9HNDjVEw1QgmWysUYiURb?=
 =?us-ascii?Q?N+dtAamq23SQfOB+LNegMn7AozzkmF6EPIFxkVUPhU4gqUNM1PXHiLNkzP0g?=
 =?us-ascii?Q?Rd+XX5/8qscTM/tTsInptAKolZ8zvEl9FRl+9mR9k70SondYzYH4osr4ql7p?=
 =?us-ascii?Q?QrUeT58lzaLNkKZNDPGqqC3Z1JLKwsvPygYWI7qTKGC934FAnGjLmrKOiwMx?=
 =?us-ascii?Q?v+8SupfbYIi6yfp28BeSpV0Fmd/pn20rlB5mR7CVt5yWvCZe9Nv5R4QRAEop?=
 =?us-ascii?Q?WOszA2dDXaTiHBGmT/MZxtSVG4Y8b2V2uF5xnGYhNLaCgHBtcmP1KgXO3SMv?=
 =?us-ascii?Q?ygywOFioUOAhZKH3/B6ADe3cqMn0oe7WREDmfrU3ubNMuIHMorwQLYko8cGb?=
 =?us-ascii?Q?rLzfdxvFvFDh3MuPFQki/mkqUQfU8EB3x9JQqiQZ7In4lxk0pJ/l65F/cBVv?=
 =?us-ascii?Q?+rTmVDKt/OWnRD9xX8zqnzQ+DRjd8bT2BVt6yC1e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cc33e0-fbd6-4923-10bb-08dd688fdff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 15:48:50.2876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGF/Afa5FI3ucQhZTS7Iae+0ZrnpaFLqgHgd+339uI3WuWZP6VWIm+Scu8ymC1QLpH/YsEtAH3dTgIQQXB00SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7567
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213484

Hello Joshua,

I think the main issue why the code got broken was that there is no image t=
est for spdx 2.2

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Joshua Watt via
> lists.openembedded.org
> Sent: Friday, March 21, 2025 16:13
> To: openembedded-core@lists.openembedded.org
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [OE-core][PATCH 2/2] oeqa: spdx: Add tar test for SPDX 2.2
>=20
> The base-files test for SPDX 2.2 did not give good coverage, since
> base-files doesn't have any dependencies. Add building tar as another
> test which more fully exercises the code
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/spdx.py | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py
> b/meta/lib/oeqa/selftest/cases/spdx.py
> index 2351103433a..6eac5f9911f 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -31,13 +31,13 @@ class SPDX22Check(OESelftestTestCase):
>          self.write_config(config)
>=20
>          deploy_dir =3D get_bb_var("DEPLOY_DIR")
> -        machine_var =3D get_bb_var("MACHINE")
> +        arch_dir =3D get_bb_var("PACKAGE_ARCH", target_name)
>          spdx_version =3D get_bb_var("SPDX_VERSION")
>          # qemux86-64 creates the directory qemux86_64
> -        machine_dir =3D machine_var.replace("-", "_")
> +        #arch_dir =3D arch_var.replace("-", "_")
>=20
>          full_file_path =3D os.path.join(
> -            deploy_dir, "spdx", spdx_version, machine_dir, high_level_di=
r, spdx_file
> +            deploy_dir, "spdx", spdx_version, arch_dir, high_level_dir, =
spdx_file
>          )
>=20
>          try:
> @@ -68,6 +68,9 @@ class SPDX22Check(OESelftestTestCase):
>      def test_spdx_base_files(self):
>          self.check_recipe_spdx("packages", "base-files.spdx.json", "base=
-files")
>=20
> +    def test_spdx_tar(self):
> +        self.check_recipe_spdx("packages", "tar.spdx.json", "tar")
> +
>=20
>  class SPDX3CheckBase(object):
>      """
> --
> 2.47.1


