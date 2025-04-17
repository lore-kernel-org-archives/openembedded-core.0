Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F95CC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:20:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.34])
 by mx.groups.io with SMTP id smtpd.web11.3892.1744878020239809662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=EejkW9yY;
 spf=pass (domain: siemens.com, ip: 40.107.159.34, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc8mGgjpgX6//2VnOJUvxvuOMsY+i+guidaUw/Rvu7UgyXZf6I3irEW3fhC5/E8ZGCjdwXL3wEKGR7HWb7zjbDzhm1RQZFMYg9eT3EhcigVAno0p8sIn3abEBRpkMKYH4OYwhq0VTW26XKk2mQKAlsFLN/1gEPJbVMGjU5Q0k7imPAWXVDmKKad/0KfF8ItOPOg1AF1jckzp8XYgRD30763UAd+h6ZVAPTvaSxqXuexdW4sTehxGA3U/PpqrSR9Y11aksHQtbbApZkgZP+YIwIu1WVYtJh8gQlZdKXTWbg+J7wdispdqzcsHUcwWW22aCGuqlDg0FAWLtnrB/p9T8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry/hV+wDfuPL/s83noZR7Dw3yQ0zJ0wAIvcsb0/S69w=;
 b=qEcIM5hNyaJ7bddGuEwkeo9k8lywbeBFxPdDpMYrE/wPQHMTgijl9U38R9BqSq7HMoDkZe03lWjrx3ko49Yr2Wf/gogm9A2SpWh1GDApmlk28EYorHm1B95ETFG8xfhLpUU9TRYOAIRqB5OXnsAxZ1fOoNySlxo/9KD1SQacweYnJXKjFpRAAZWln7Bm4AyUOc9znVr4Hh7Klsy+81jazlqC83Wu3eR8Nxbxif0LgE2l9mYbSiBz3yinHxxQA1aBvtHo6sG7y9g48ZrVi+qwHDorG+Ph5u0lf2hUs527t3vm5LACZZ/dZWB4Rce4pT5tv/bsvDdYv/n0Ikf8hokJkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry/hV+wDfuPL/s83noZR7Dw3yQ0zJ0wAIvcsb0/S69w=;
 b=EejkW9yY/2vNPGoVrK8m0JINBVQ24cogcjtfqF+ONmqscIc6v3w43q+9oWaNpj2F8DBemmlVQ+mtjYrn82pyoFk4pRScf5bbxcUBFL3W7N4BPJXGB3SP27xThXDP2WfvvEztV2YBNHYwQWDfZojkko7o7zq3gmdRF1FgsxKo/R+NXv8qc5bPfDI5XN8pCtDl6xDguqL5TOBm7+nbM7TVG7lZasDN7plnjzafK6QmX0k6s6Nsa/EbKy5YTWm2Y5HmSJUlfGnIcah3y9s86VTCBrACtvdcDsgOXq3vXHfhWibCp3uu7VZqGl9giCF+jqe+LnnoSX+ToI/hmZ7DJFDASQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3499.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 08:20:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 08:20:16 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [PATCH 1/2] linux-vulns: fetch kernel.org CNA info
Thread-Topic: [PATCH 1/2] linux-vulns: fetch kernel.org CNA info
Thread-Index: AQHbrtvx96l9x/C7zk2ckIiliglTqbOnguYw
Date: Thu, 17 Apr 2025 08:20:15 +0000
Message-ID: 
 <AS1PR10MB5697D4A4094FABD080D8543EFDBC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
 <20250416142859.909037-2-daniel.turull@ericsson.com>
In-Reply-To: <20250416142859.909037-2-daniel.turull@ericsson.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=832947d7-9ed7-45b7-9962-557510413fae;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-17T08:11:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3499:EE_
x-ms-office365-filtering-correlation-id: 6994429f-6ab0-4501-7c36-08dd7d88aef5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?UEkXIO+gq9uI9cNzcEOKQQoqyusS36d66WID4gC2AroQVRpmYhzwurK+Ijbf?=
 =?us-ascii?Q?g59nghaV31mFL6JUFXG67BQ7o6B512/dKU/eCwgly/+iG+YeydE+So8tq2YH?=
 =?us-ascii?Q?NCOlDyLc/r34ikPWvb2OS50jtuD0zJmM/sg8BZby5JmVxrF0+GVO+TJHBdWV?=
 =?us-ascii?Q?4iTxOk4bgYiBcLRTENzm9Fyw5kq8CsAIRCPb4/Sdi1XEK4SXvw75OR1VDQeW?=
 =?us-ascii?Q?xWUgpKQfXXm2tGJ+EXOtLalqhyTl9q8PYeVjToPQf40Rrf0BAHOwDSii9Xk4?=
 =?us-ascii?Q?7LdEIuvVbs5YvsI5OP0a0rQY0hqV0fWnraOIbQ4YuxsB/buGWDXsVIGcaJWg?=
 =?us-ascii?Q?GqguGP6Icy8VgzP/HrUR+DfgfYcv4eMXaGqVV/xrGkwySP6KCwoXuWgNjGK8?=
 =?us-ascii?Q?HAh5a+HOATVY4eSQB4UYBzCxvDYCS1rmD3ilhqPBq4L9cZb2fGQ+VVoKvlFz?=
 =?us-ascii?Q?vwWKLNMqCDhQnKVahsTc65QGvd3mMCkxkGwY+n9jvGCIWQsDD3VjvLrNWsVM?=
 =?us-ascii?Q?q6tjfmnMDiXOanF6alUh6qkLJwqubC+RMh7xfsJr4j75qSUqJuZZc29bU1mY?=
 =?us-ascii?Q?DOhLU8lBCsP1DXOeYukq84cETq3QoVGwOPB0/+Sos71DdATGAcInjn7fKYbt?=
 =?us-ascii?Q?15Mk3JiWnGt5dSE8KfEtp7e56fg7qtWLfCABiJpIw5kOfLqzM+PUd77C5May?=
 =?us-ascii?Q?3tvyEMSQJuFI43zFExa7IZwEapxrNkel7FTx4OsEsY6h7BfyeJyeBaZDNEHV?=
 =?us-ascii?Q?gCl+kEqQbb5ZMBr6Qgl47R/ihA0nmFkrn7/FxPISyrbkmVsC0wGLwa9xTlr9?=
 =?us-ascii?Q?JM/Y808uFgna/eYOE2aN8Xp7C6I6XStGyDl7U6d4Fac0ZA5lz2a8sRYCPYKK?=
 =?us-ascii?Q?Bp86Er6z1GvizTFHcnMWs9NX5JL6U6+ApemU44rRDXCc+GVlZ8IERBkTKOOT?=
 =?us-ascii?Q?/0XlJem3R0PvAwXpEwx2z+KL/OWCAFBsB5j1pH1qt8KKzP1PMA2IUkhRboNs?=
 =?us-ascii?Q?uS8hVES4croOrTZv0wFLhZelanFc3uD0v3yjzIEFdsok15SzF9RzQ1QLFlwl?=
 =?us-ascii?Q?ZRG2xmJUJ8jRk9SfhqTLv2iI8fyCbfNEAezDiFjBoU27SPfHWHQ2ubZZ1KXs?=
 =?us-ascii?Q?MmyWyWxdJqt/3m2JUzeTq2P4ocbi7BcNOLwA5ZBevfebNV8Lcu9/hVrqcfd/?=
 =?us-ascii?Q?5jA3xlxaxCP8DLbueb/FIS4CqXebxV+14hSB4sNj5wSfZ/xydNxgU5+1smxd?=
 =?us-ascii?Q?//ZA5myS8I9q/nRBoJJZU01fCbrlA0kZz/kINw5FZVO/a6MRGu2Rva5KOboS?=
 =?us-ascii?Q?s9K+jXmo7lEhqhjLwMogLLWiPXbcM6gKyd6Qjq2aY5tq1iQUmFR1psSWTWUG?=
 =?us-ascii?Q?1vN0rGWlHQl/wO5deZw0vXfrZF2YbsfDH1aZbz0rcV+Q+yKAHNB7Zqfcmkwm?=
 =?us-ascii?Q?YQUoSyIsmIP3vO/3Y0o0UeA7zeZq6rlIXrBk0XKr9y/F+9B4z5oO1HNfv8+f?=
 =?us-ascii?Q?inKTUWBVKt0KufQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gp/x8EV6xwGwI0hVhLbVH2Q2jivtDJNF/02AOHvXCXsXmEXe3Nt7M9qIJUoG?=
 =?us-ascii?Q?5noyxKZZ71zlgmP3zZC4BA1aRVMpi7U71qChTufYHHQdRPsgYchk38GTiHOf?=
 =?us-ascii?Q?bPe4co4OD8UvIeTrTjhkSy57aKnpF56b3CTOQaTaf/nS6j7oveIgfCOrAUa8?=
 =?us-ascii?Q?5UNHYlVmJgzhiiQwtIqvTGTrN2/JiaA54JXpTK3m8fOX2dmf0+1LCDitvhSU?=
 =?us-ascii?Q?7eu6lzn6peyYZ4u2AlMwBuDEVSfNRr6OdxCFL78QDI9jg/mKnQ9VgrJS0joe?=
 =?us-ascii?Q?S21FmWSr9wsk8V5x18EC+Pj8upCpWaCCPyRZnsdws4EO7nMD+QZR1SBJMMPW?=
 =?us-ascii?Q?Fn3sIh5I7q8/bvnOlrmTA8CL2KJkqlEJL9nojDchppEarujkrQkHhsywbA5v?=
 =?us-ascii?Q?9oxgCMe3neShCpGA0Mc89dRea+M5J7Gm5QZ82Jg+5au2e0nRy7atvJ7xvUBy?=
 =?us-ascii?Q?yuCumilprQ1EdhkYCmNwBAd8efPt+dRr90yrWV9jvPc7fVjhVFZjpWOSwTAn?=
 =?us-ascii?Q?XdUWVxl7iN+yBYcVCr/Q2if18ZiAfPL7dWX1wediofzo8mG0MCYkz5HxSW3r?=
 =?us-ascii?Q?hobTHk2n6Z6k1LzKpPMXRz0m0bTgK7BMBEDE8F4uUfLt2vvOgakJQhpTSY/i?=
 =?us-ascii?Q?RzKaR9TABSkJ8ks60uEZnmroAlY6oDQ+y7eJ0xiNP89ERNcTFoYpJ87qUzQ8?=
 =?us-ascii?Q?rt3mNdmHab4SX/bnc49HuqutQXFj6h9qdnWDEiUvYGcSeuA5L0h6vVN5nHBC?=
 =?us-ascii?Q?szXR0Ssj2irg+EbnUcwwAdZks2h1hnYf4DUbmC89EXuldHLdUk4FQAvMOKcW?=
 =?us-ascii?Q?sfsR7RGRKjaER7qij8gbMd9JLkD1nkCmXKLP1fiUpn9cXeS19R0Y29BPVxju?=
 =?us-ascii?Q?94p/H9JEnIeR88TWzmWT9cy2RTGqCgFVE8Nzjahezz8eoNrrFNidwPp4wehQ?=
 =?us-ascii?Q?zeb5WEC8iwSxSIXSl1S2jrcNZjSGD3qOJNPD9ZyrBE5eFHsiMmjTOx41JD4y?=
 =?us-ascii?Q?H2L8ezZW73OrXOfBhQvBRwtePMtYKSKZFRiVILG0lK+IHJPMiCaoa5B+QYCV?=
 =?us-ascii?Q?t3i868BqlFKWWvCF04U9nQ87RiJDT0HGu8/4tFPDHGH3K9rsY9hQxgfSWrUn?=
 =?us-ascii?Q?ftAgidZgUkd+KtNawqbW4u7btrkFCRlBngRIq9yZZusd9IAIUp4AyKLA27Bi?=
 =?us-ascii?Q?JzaOzx5vUqcHGsBJ8DZkR2xqCzk2Mo7DCs+61ZSv4Tk14SKJ3KTWZfumgXrz?=
 =?us-ascii?Q?w2WU2YHiLmfvUV9SqrE20ZZDBE3I/aJM7fKe8Q22/h3cRxILflF7qLift8pO?=
 =?us-ascii?Q?eKHFMZu51T1iDNwIMVGv2CB19hF+ZfBpwQ+4GVGuwPQuefr47mYQaQdgzFHo?=
 =?us-ascii?Q?TFmzQzpkCOTtwIZ5o53GRvzkAQIHRdSaAgG3FF45cIyQcc/X0DqoCG17aI5c?=
 =?us-ascii?Q?itC/BUu41NB0r4hJ4IirkHiMepnisLnIemqjxnyM6seXSufRZXyyTMsCOIFT?=
 =?us-ascii?Q?g5Bz7fjqLSY6DSler0zF8L0gP9YN0R+YzDgHGXF3q/EcdUkRFXxAyM6fkT9C?=
 =?us-ascii?Q?AUntoyq2TZTofl3HmaeT4FEe2Y5vNfGAqoJXO0J6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6994429f-6ab0-4501-7c36-08dd7d88aef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 08:20:16.0305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Bn1N2G0rBIrPjSoT6ZphwmDH58VkXkH6YKfJ6mgOTVzROVFCox5vAYBi0hW0EsRRdCnQymWYImuF4Wj4uRWzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215041

Hello,

this approach will not work.
DL_DIR can be shared across all (parallel) builds (also to multiple machine=
s via NFS) so the symlinks would be overwriting each other.
Also AUTOREV is not suitable for recipes in core as it makes bitbake to acc=
ess network on each recipe parsing (so even when the class is not active).

Ideally this should have format like NVD/FKIE feeds where update timestamp =
is used to determine if update is needed or not.
The data needs to be copied to folder within the build.

Peter

> -----Original Message-----
> From: daniel.turull@ericsson.com <daniel.turull@ericsson.com>
> Sent: Wednesday, April 16, 2025 16:29
> To: openembedded-core@lists.openembedded.org
> Cc: rybczynska@gmail.com; steve@sakoman.com; Marko, Peter (FT D EU SK
> BFS1) <Peter.Marko@siemens.com>; richard.purdie@linuxfoundation.org;
> ross.burton@arm.com; Daniel Turull <daniel.turull@ericsson.com>
> Subject: [PATCH 1/2] linux-vulns: fetch kernel.org CNA info
>=20
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Add CVE data source for kernel.org.
>=20
> It includes more information than the one provided by NVD.
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/conf/distro/include/maintainers.inc  |  1 +
>  meta/recipes-core/meta/linux-vulns_git.bb | 42 +++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 8065287c17..ec427fe6a4 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -468,6 +468,7 @@ RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned
> <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned
> <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-firmware =3D "Otavio Salvador
> <otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER:pn-linux-libc-headers =3D "Bruce Ashfield
> <bruce.ashfield@gmail.com>"
> +RECIPE_MAINTAINER:pn-linux-vulns =3D "Unassigned
> <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield
> <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield
> <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield
> <bruce.ashfield@gmail.com>"
> diff --git a/meta/recipes-core/meta/linux-vulns_git.bb b/meta/recipes-
> core/meta/linux-vulns_git.bb
> new file mode 100644
> index 0000000000..158790f082
> --- /dev/null
> +++ b/meta/recipes-core/meta/linux-vulns_git.bb
> @@ -0,0 +1,42 @@
> +SUMMARY =3D "CVE information from kernel.org"
> +DESCRIPTION =3D "Repo for tracking and maintaining the CVE identifiers r=
eserved
> \
> +and assigned to the Linux kernel project."
> +HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/security/vulns.git/ab=
out/"
> +LICENSE =3D "GPL-2.0-only & cve-tou"
> +LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0-
> only.txt;md5=3Dc89d4ad08368966d8df5a90ea96bebe4\
> +                    file://LICENSES/cve-
> tou.txt;md5=3D0d1f8ff7666c210e0b0404fd9d7e6703"
> +SECTION =3D "base"
> +
> +SRC_URI =3D
> "git://git.kernel.org/pub/scm/linux/security/vulns;branch=3Dmaster;protoc=
ol=3Dhttps"
> +inherit native
> +
> +SRCREV=3D"${AUTOREV}"
> +PV =3D "1.0-git-${SRCREV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +KERNEL_CNA_REPO ??=3D "${DL_DIR}/CVE_CHECK/vulns"
> +
> +python do_unpack:append(){
> +    # Make symbolic link so it is easy to find
> +    import os
> +    source_path =3D d.getVar("S")
> +    link_path =3D d.getVar("KERNEL_CNA_REPO")
> +    if os.path.exists(link_path):
> +         os.remove(link_path)
> +    bb.utils.mkdirhier(os.path.dirname(link_path))
> +    os.symlink(source_path, link_path)
> +}
> +
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_install
> +deltask do_cve_check
> +deltask do_populate_sysroot
> +deltask do_runtime_spdx
> +deltask do_create_spdx
> +deltask do_populate_lic
> +do_fetch[nostamp] =3D "1"
> +
> +EXCLUDE_FROM_WORLD =3D "1"

