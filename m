Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EB6C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:33:02 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.44])
 by mx.groups.io with SMTP id smtpd.web10.12180.1745602376796910177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=raNNCsWB;
 spf=pass (domain: siemens.com, ip: 52.101.67.44, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNo8BenTcIMBhAZkmrrrHEfUZfmS/D+MJEEwb+q5fKS8u+2Ayo1uWSsSIdBeX0EIGIKWmw0Dj0R3u371X0Z56DFc7SsNzPGWNCVTkwGrFTR6Jk/ZQArNfvUrD/zg/FL+syEcF2jvy2m6BmtUpQA80pSN+NUA5yD3O+0kRFQUm29IL85oAYvb4PWZUrP1ujm0MuPHRDRGySHMV7KJ1ptqN0ezKVm3Vt4+Mq8Lxty3h3myASDo/I9ncpgKe+6DRL8WvhV/ZEKEpBRySZjX1JnRzfl1NZTCBuObWcLbV6wluxNhlCw2n/5149y1LnBpFmsmtdA/COxVDVfbm1VoLfa63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GelxLjz8y2SDkEW3efs48ECUOjUf0oE+WXWm7Ca01z0=;
 b=ik+FhG/gRGApTEpEy4SaKoxJgxBG6vJ0dl96EMorg80hNWAW8JxwDDp26ioFc3iXxLtfdcE6JAaMIzT4603X6gQvyOe2FDtkvx6kKRwfsdH3yOXByfawo3Qukh/0pEBgMyQPucnMBkbCri0vhnmIysfy/mOz5ZzfcM3ldDnJWBGYSIYPj5ITX1/oUVeKqalZJPR6YlqApqzEx1F6HNevYzl5PL68JRyTR3DU6ogXaq9dkg8i9FQAFVNbQs27T6UNRcXiAbxsX4wR5pVJx9cDK1hiPMmjr7ylSBMhqzU8aMwgylbgjHEoKmFO7E5QA+GNPlsd1qHzW8eGGREfTD4jFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GelxLjz8y2SDkEW3efs48ECUOjUf0oE+WXWm7Ca01z0=;
 b=raNNCsWBgEc7a/+4S+L9cy8JIOf1EyZG9a3RPeu9wryxd9+Ce/xgEQomqxc9e/EkLAT6LFBM0p+4FuQS6XBcsd8Mm98oEtcgnYb8+qnAoez8YGiCY8ntC0lcMbCRzAIOpEti81EEvQuUj4L7cKqbTlr/n0ERxkFVbZnt3d30peaVlFWLoAjKir1fCUPuMZ7UKrNy6uie7PVXJZAcE2/0dLA/XA67xC0XI+Qmtn2BcYsvtLJ2HnKjUl+IsXXDIaLHDyxCr9WO3wTF5AO8mRsRDT1VqNL4LLmutzOm/kULEEdqTl6aGaqyUEi1GrDSCQWB34V9M6+gJFmj5DWq0GIpQQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB8983.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:239::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 17:32:53 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 17:32:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs from
 linuxkernelcve
Thread-Topic: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs from
 linuxkernelcve
Thread-Index: AQHbqf3qc5uZxMA+N02nJNJl8EMaAbO0uxRA
Date: Fri, 25 Apr 2025 17:32:52 +0000
Message-ID: 
 <AS1PR10MB5697D593B86BB2D24CCC620CFD842@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250410094837.897013-1-daniel.turull@ericsson.com>
 <20250410094837.897013-2-daniel.turull@ericsson.com>
In-Reply-To: <20250410094837.897013-2-daniel.turull@ericsson.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0e4b2243-1b84-48d6-b399-4b698f03e3a2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-25T17:29:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB8983:EE_
x-ms-office365-filtering-correlation-id: 34a81bdf-3dab-422a-533e-08dd841f351a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?4xkm9OZc+4EdYVBIGAYANqbYBKxqiX231qu4+Kk4AIsoI2JY2fkBsvA1plby?=
 =?us-ascii?Q?nCN4g694bUUSphdsBPbbKZH0RamzWyKEBwxCbvtCreu9Qd/OcjLboH31tp//?=
 =?us-ascii?Q?Ry3BumQ+HabfbeeiNhpM4dD8+UOwMx7pxcxD0Kka20qqfAZ0IjKfQUbSX7Ob?=
 =?us-ascii?Q?nRFVG6iQ+2eqDsSJfRe50ylqSqzEUxDgi1vSPSLNaqju5d7AL+ET2xnUz7mV?=
 =?us-ascii?Q?eCxkRkKnXKjGm7UuxKfcE+qhzp52HORgAdahQMAmFR6FjJTwdVRn2q17Q05Z?=
 =?us-ascii?Q?/CeQO9tgYM0tKxOnNP5TgAE7m6L1qPxvC4h8U1ncpUfkMGngVkAOZ3W6ODDj?=
 =?us-ascii?Q?O7VaMSRpj2f+XwLTgInxZa38qCT7YUqXwjSKL2ZFqVVhLOwudE5zhm+7STNp?=
 =?us-ascii?Q?ALlqebLVlRlEMQvRUbk/R+mxZW96gTOst4qIWp5yaoJ35oTkCfyh8XMI8OCh?=
 =?us-ascii?Q?ECOM7XBFyr9STY6xPLIYoEVA+3ddY3oZaeDGkNa9ADD2wEgDfW4HXz6eP2KU?=
 =?us-ascii?Q?SDYz0Rpl3m2MWmG2R5ZG9j58cIEuLTJ7cGoD6xBDumiy6hiA/MGnY0z8HP23?=
 =?us-ascii?Q?QiZcCOQORawtIWmNpkrvwvhBptLrP5O0hor7x2YbV3wawqtR4TzyehO80CDK?=
 =?us-ascii?Q?Otmmwoz4WLNyD8sZku6VHo6WXdH+HFAwBX4Qfs0xRIjgiTTnHuEmgqSMDO/4?=
 =?us-ascii?Q?Sul7dH01uQG/1dBIxFJhYuqk31yZuCaE2/z7TiVynMY2hDOpU6FQvXIxZRBT?=
 =?us-ascii?Q?erkTYDCY2Zgv9oFKYkXjofzEOXzFzN/Kj5+VGaEXSdNFGRikh8L8l1Bv/tkA?=
 =?us-ascii?Q?iRr2YUxoehMlJLNvQvq4aDTNYWBphdtVPoifdJ7bA3IMhNSoDBrBhPNDttOj?=
 =?us-ascii?Q?tfogH8LfJYqvwnXtanR6o8T2eIAtQYhpvg+vtMZLDZUGbLEGHPVN9PrA2x++?=
 =?us-ascii?Q?Pr09pAiD5KVCnUO6dxybT6Qw8+lS2PdjKez/6bebmroprrtc8npEMd8nmAIi?=
 =?us-ascii?Q?KUuGR//JPDSmiEiCkmRtXrgJb7UUxqhjCIrjtIf2e3uvAWI95Nz+VKxpCnut?=
 =?us-ascii?Q?U4jn4g50QqShq3icfoZ5TCEopCmYwwFVJoKjHhjHP0hZn7UIaC+CDxeIsAwl?=
 =?us-ascii?Q?0oR5HCvn/iHhUCTNZvPpSPEGkO/GvboJ8pcAly8iRGzv2H04oSZChonXuUrr?=
 =?us-ascii?Q?ZEc1GGUa7lnmJmVL7Hc5FDqM9JGiS6x2AImROsxMgRLLJWRMHx3MgiBIIYWP?=
 =?us-ascii?Q?3q96PQ81TE7/QMTMCl71gf59On9FTNAHrDM+vIr379zbDwMANgYDeVtscrFL?=
 =?us-ascii?Q?wghO18xW/OJzb7N4/KLRQ229HNYLlFBvyvKbXl9OHAuSDu0WbQhzeUBOv11Z?=
 =?us-ascii?Q?epbMSooHlX9r27EHCgMTV9JBL+ve7hzyxhWNhJxdt5BuG+S5LGd8rHFtf0Kt?=
 =?us-ascii?Q?AAz05+gqFUkNFkTzCS+uHDFhwJWkfhijrm/RA6KdhLhlUDjOxQpwwKVBODhz?=
 =?us-ascii?Q?GkxfADcRrJmNBu8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZGUaKm1XHx9waNDe8sdr4GRmLequlqCi65qU7zGf4f7U1l5bX32L8NYTp5fW?=
 =?us-ascii?Q?x98uZPVWUUd23YTeTFNjz3jVefFSH1X4uzn+kr/qo6zyGJX1TITHgMJg1U9c?=
 =?us-ascii?Q?vL5Ug0K652Xd0ToSoE5QArbKvh6vMG7Bp0pe+5lCdSpKtyYJeTb24ILW5Q//?=
 =?us-ascii?Q?00cJ/nAvuo9ky/ogUo55+EOA1OldQ1OLFicR0iC3Xy761pRsMh4d+5T6A+Uh?=
 =?us-ascii?Q?cx/FWnbosTeZFIYZawqFDWV/8qMhvGKjpkZx6wof6ugvQuZmLetwKjNSAzHi?=
 =?us-ascii?Q?lckDS7ZD4xwsL3tSf184Ff6PQgb89nEG86Q1biIzh7cl2ElP8L3gwzEgfcdC?=
 =?us-ascii?Q?mWuWYB7IprnmGCMYjFSKS20Yz4Wd3s/DWWKYknPxpdu/6bgEE//HJipz0MQu?=
 =?us-ascii?Q?aGrlEZ4h6nUdP/Va6n5ienSTG5DlLHo+3sPrwPmpG+0RiSziV3hcuVz/f9EY?=
 =?us-ascii?Q?MxfTgVSSJ6oIaRPmX1kms8scOJGL8OaHh9dgeN0A5lmcL6RrETeQIOrk4DDq?=
 =?us-ascii?Q?BJ4sjN5DFzFxbMwl+zYycwFAx1WVtfAjZoWdN0Y+GT+McXVVSv/DkrInFB/+?=
 =?us-ascii?Q?3Ylz+IPrBZxMGy6t2i8WC8ewfYRyYFg2a0q32UzeYxJxBM9qGI7P4uLM/ynO?=
 =?us-ascii?Q?x/70RjgbETZFZ2JLylHJsQ4i/hV1WGebWkX8I16MXwhvG3MLOd+O06a5csyP?=
 =?us-ascii?Q?oPU7GjFIaPUYLHj0jWuYdsd+voHl8I1xRbA9i2Qllyr/b1nczoP5XLq9oNaq?=
 =?us-ascii?Q?ullgyZ7aWYm2Bmo/vco57PZ1R5os/7D0WGseG+IgmhrlZJ3LE2NuB/nfXiOW?=
 =?us-ascii?Q?0NgxSqE4LEY7Ek7CDx+RH3IGU9BmxG9uD0Quom9kgtR68OrN+xhHVkMUnffn?=
 =?us-ascii?Q?mnlwtZszBh8LP3DVQyNPWWECSo6VZ7SSIJBto6N5eYJ3cjHR7TvBIMFfiLug?=
 =?us-ascii?Q?ha7LDv5H0thvy+BZs7RxoRhhlwHxZh0WX38DpwCST/pSYyB/9Iz/6IpvdKQc?=
 =?us-ascii?Q?5Wz5wYJFkPPiwOx/NKzzsqPAds/SkAYMC4ay0Xqe6nDAgnoRR6HIs46voKbp?=
 =?us-ascii?Q?s4VXoA7f8Y41dp9dRPNbV3Ly4iLYUwfRvFVJnwq1vLqbvGReHDRhaqAWjxip?=
 =?us-ascii?Q?ULeHGPkKK8R0tsIEQOJXFuLjgs8rnTqIXtYkrcnx/WYJcjx3R506s1CNvQqG?=
 =?us-ascii?Q?ZnE9i+P2E+IDxnoX7I32lW9yX05rs5PMtmwbskQXADQg5ohVQL4NjGWtHGSF?=
 =?us-ascii?Q?3bcQ02J8y/R/mIDcgjVP54Pfy4XhwVFK1ok6f08deNJxFC74glYfGefGxgF5?=
 =?us-ascii?Q?Q8q7dV5N7l8oUIoNDVE+S1TVrfPg1W/ipbi8r4WtmIJhhXGOp/6kXhPvip57?=
 =?us-ascii?Q?5rNBHkHCFNN67epVSkY8RzQyApy+rUyvYtBr+C44SZMoxX22h8e1JLFcJDyN?=
 =?us-ascii?Q?gtVFUxZFI9CL5fup3gS9IlCvy/wOSMu/KnZLblLOju66Tznju2U+/KHc4NT9?=
 =?us-ascii?Q?J3nTymRCGmcBV5Cguq1NLNeDB689Waw+FSGk3OgTRCh6qlDFvNweJhERjBIR?=
 =?us-ascii?Q?WhufajJdXgMZPQ28Kss+MjXya6GlbGlOeBxngxW/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a81bdf-3dab-422a-533e-08dd841f351a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2025 17:32:52.5793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAqIEzf6G+0Y7/q+zTo17RawY/fT8Vt1sixDsd6ZDOqhFrdNvMJGrrjSucIOxitBB/WEnuGcte5Rr2K8cTBJcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215489



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Daniel Turull via
> lists.openembedded.org
> Sent: Thursday, April 10, 2025 11:49
> To: openembedded-core@lists.openembedded.org; bruce.ashfield@gmail.com
> Cc: Daniel Turull <daniel.turull@ericsson.com>
> Subject: [OE-core] [PATCH 2/2] cve-exclusions: update with all CVEs from
> linuxkernelcve
>=20
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Execute new script generate-cve-exclusions.py
> ./generate-cve-exclusions.py ~/cvelistV5/ 6.12.19 > cve-exclusion_6.12.in=
c
>=20
> After using the database from CVEproject, some old
> CVEs did not have correct metadata, therefore moving missing ones
> from old cve-exclusions_6.12.inc into cve-exclusion.inc
>=20
> Comparing output from cve_check before and after, two CVEs are removed:
> CVE-2023-52904 and CVE-2024-38381
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/recipes-kernel/linux/cve-exclusion.inc   |  118 +
>  .../linux/cve-exclusion_6.12.inc              | 9194 +++++++++++------
>  2 files changed, 5980 insertions(+), 3332 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-
> kernel/linux/cve-exclusion.inc
> index 7857633943..5f96a81bdd 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion.inc
> @@ -32,3 +32,121 @@ CVE_STATUS[CVE-2020-11935] =3D "not-applicable-
> config: Issue only affects aufs, wh
>  CVE_STATUS[CVE-2023-23005] =3D "disputed: There are no realistic cases \
>  in which a user can cause the alloc_memory_type error case to be reached=
. \
>  See: https://bugzilla.suse.com/show_bug.cgi?id=3D1208844#c2"
> +
> +# Old CVES taken before using new data from kernel CNA
> +
> +CVE_STATUS[CVE-2014-8171] =3D "fixed-version: Fixed from version 3.12rc1=
"
> +
> +CVE_STATUS[CVE-2017-1000255] =3D "fixed-version: Fixed from version 4.14=
rc5"
> +
> +CVE_STATUS[CVE-2018-10840] =3D "fixed-version: Fixed from version 4.18rc=
1"
> +
> +CVE_STATUS[CVE-2018-10876] =3D "fixed-version: Fixed from version 4.18rc=
4"
> +
> +CVE_STATUS[CVE-2018-10882] =3D "fixed-version: Fixed from version 4.18rc=
4"
> +
> +CVE_STATUS[CVE-2018-10902] =3D "fixed-version: Fixed from version 4.18rc=
6"
> +
> +CVE_STATUS[CVE-2018-14625] =3D "fixed-version: Fixed from version 4.20rc=
6"
> +
> +CVE_STATUS[CVE-2019-3016] =3D "fixed-version: Fixed from version 5.6rc1"
> +
> +CVE_STATUS[CVE-2019-3819] =3D "fixed-version: Fixed from version 5.0rc6"
> +
> +CVE_STATUS[CVE-2019-3887] =3D "fixed-version: Fixed from version 5.1rc4"
> +
> +CVE_STATUS[CVE-2020-10742] =3D "fixed-version: Fixed from version 3.16rc=
1"
> +
> +CVE_STATUS[CVE-2020-16119] =3D "fixed-version: Fixed from version 5.15rc=
2"
> +
> +CVE_STATUS[CVE-2020-1749] =3D "fixed-version: Fixed from version 5.5rc1"
> +
> +CVE_STATUS[CVE-2020-25672] =3D "fixed-version: Fixed from version 5.12rc=
7"
> +
> +CVE_STATUS[CVE-2020-27815] =3D "fixed-version: Fixed from version 5.11rc=
1"
> +
> +CVE_STATUS[CVE-2020-8834] =3D "fixed-version: Fixed from version 4.18rc1=
"
> +
> +CVE_STATUS[CVE-2021-20194] =3D "fixed-version: Fixed from version 5.10rc=
1"
> +
> +CVE_STATUS[CVE-2021-20265] =3D "fixed-version: Fixed from version 4.5rc3=
"
> +
> +CVE_STATUS[CVE-2021-3564] =3D "fixed-version: Fixed from version 5.13rc5=
"
> +
> +CVE_STATUS[CVE-2021-3669] =3D "fixed-version: Fixed from version 5.15rc1=
"
> +
> +CVE_STATUS[CVE-2021-3759] =3D "fixed-version: Fixed from version 5.15rc1=
"
> +
> +CVE_STATUS[CVE-2021-4218] =3D "fixed-version: Fixed from version 5.8rc1"
> +
> +CVE_STATUS[CVE-2022-0286] =3D "fixed-version: Fixed from version 5.14rc2=
"
> +
> +CVE_STATUS[CVE-2022-1462] =3D "fixed-version: Fixed from version 5.19rc7=
"
> +
> +CVE_STATUS[CVE-2022-2308] =3D "fixed-version: Fixed from version 6.0"
> +
> +CVE_STATUS[CVE-2022-2327] =3D "fixed-version: Fixed from version 5.12rc1=
"
> +
> +CVE_STATUS[CVE-2022-2663] =3D "fixed-version: Fixed from version 6.0rc5"
> +
> +CVE_STATUS[CVE-2022-2785] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3435] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3523] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3534] =3D "fixed-version: Fixed from version 6.2rc1"
> +
> +CVE_STATUS[CVE-2022-3566] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3567] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3619] =3D "fixed-version: Fixed from version 6.1rc4"
> +
> +CVE_STATUS[CVE-2022-3621] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-3624] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3629] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3630] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3633] =3D "fixed-version: Fixed from version 6.0rc1"
> +
> +CVE_STATUS[CVE-2022-3636] =3D "fixed-version: Fixed from version 5.19rc1=
"
> +
> +CVE_STATUS[CVE-2022-36402] =3D "fixed-version: Fixed from version 6.5"
> +
> +CVE_STATUS[CVE-2022-3646] =3D "fixed-version: Fixed from version 6.1rc1"
> +
> +CVE_STATUS[CVE-2022-42895] =3D "fixed-version: Fixed from version 6.1rc4=
"
> +
> +CVE_STATUS[CVE-2022-4382] =3D "fixed-version: Fixed from version 6.2rc5"
> +
> +CVE_STATUS[CVE-2023-1073] =3D "fixed-version: Fixed from version 6.2rc5"
> +
> +CVE_STATUS[CVE-2023-1074] =3D "fixed-version: Fixed from version 6.2rc6"
> +
> +CVE_STATUS[CVE-2023-1075] =3D "fixed-version: Fixed from version 6.2rc7"
> +
> +CVE_STATUS[CVE-2023-1076] =3D "fixed-version: Fixed from version 6.3rc1"
> +
> +CVE_STATUS[CVE-2023-2898] =3D "fixed-version: Fixed from version 6.5rc1"
> +
> +CVE_STATUS[CVE-2023-3772] =3D "fixed-version: Fixed from version 6.5rc7"
> +
> +CVE_STATUS[CVE-2023-3773] =3D "fixed-version: Fixed from version 6.5rc7"
> +
> +CVE_STATUS[CVE-2023-4155] =3D "fixed-version: Fixed from version 6.5rc6"
> +
> +CVE_STATUS[CVE-2023-6176] =3D "fixed-version: Fixed from version 6.6rc2"
> +
> +CVE_STATUS[CVE-2023-6270] =3D "cpe-stable-backport: Backported in 6.6.23=
"
> +
> +CVE_STATUS[CVE-2023-6610] =3D "cpe-stable-backport: Backported in 6.6.13=
"
> +
> +CVE_STATUS[CVE-2023-6679] =3D "fixed-version: only affects 6.7rc1 onward=
s"
> +
> +CVE_STATUS[CVE-2023-7042] =3D "cpe-stable-backport: Backported in 6.6.23=
"
> +
> +CVE_STATUS[CVE-2024-0193] =3D "cpe-stable-backport: Backported in 6.6.10=
"

The last 5 entries here are wrong.
CVEs in kernel 6.12 cannot be ignored based on statement about 6.6.x branch=
.

Peter

