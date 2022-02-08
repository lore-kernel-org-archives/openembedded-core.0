Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424A6C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 23:31:28 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.49])
 by mx.groups.io with SMTP id smtpd.web11.19294.1644363086866018307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 15:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=mB22fOTY;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.102.49,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc35o8i4OVP+KEB4Z5pWBJIZXiyHapa9Z1Ch4Hk4yiiBfvGyccF5g8SEh1BGaTJI2RfjobgKKnYMq/xrAegzJpZT+dWY0W6nos9tHEw3OqvhATYSI7h9C/m4EwgU3aXO7h0ZiXTxguiBvodv99UZqTvVj1a8aKhFrSzF63SMnYsk/53dtC2DVYBW8Klez3VG1T8rnmeyvOJBtKUHdi+Mnr73UefIE2hi9u7+Deq4bHqSYBX1JtyBuQr7YUfibbW4iEOygofEebXOSU712995wa9L2VWFC9a8/XgzMceazx9+JRH22+lZFqeXlpMugkc/3KcxJ/9SnH25sU/WcLILpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB96QebN/kVury6YE3P7uLqk6RBR9GNa9TYM1zUcbjM=;
 b=VKTu9rRguJgu22f4pHOFvxfmsmpWgwxaVzb6VgXFh+Pzbp7k06YeVHx1OBk1blowaCbhVGV674ESn0DHD7ppx8NL6C2YnQNBcAslMiAG+lLxx2ipzxBJGD3Af22v0EFZ5rkPtKxPMe3H5pMRwCdiyuTadjkO4WNZHh7Qba+Nyje2qocnEwt4hZG6wUhfLIGvA0zNSemM++3hK9jHwIKcMetwFeSXtObKf07OupZnqmQrCNM3sjGyKw+ObnXfBfQnEYF7rxhqkudy5tD9yDZee2UKGgfNfOPZ1z42SXAZJ7N3s/8qNdoD+ylFYh4VI5IK0P/OsjhyLk5or3FXexFP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB96QebN/kVury6YE3P7uLqk6RBR9GNa9TYM1zUcbjM=;
 b=mB22fOTYIXbDGncGVShSifteO+8jaeUiLw6OpFr8AB7/iobIIJous8Gck7xtP7ZcfEQNkhLsnaj53PA7Kosj0ZS1MqH7Wki0QsJs1PJzB3OxTitIFOSTF41X0E/9l1QfDu1FpTAPChdhABqR/2SNrNBWjblzR6IsE0y2FmQZnryuYWnDQyscuDN1joo5BR4KUXV25Zo0j5o9fA6qFjVw91b3L267o4aIwzLkl0O1gtMzQXE3ISnDun0apGVj1TsuCJ8V73obkfovLTeRz0dsnjWuac98Pc+KVqHI+upaQByoaX0FkBkGH+uS72xUP7j99prU4IfdFlz6EKTGdYKUDg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 BN7PR12MB2609.namprd12.prod.outlook.com (2603:10b6:408:28::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.18; Tue, 8 Feb 2022 23:31:24 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::793d:3ccc:f1ee:2762]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::793d:3ccc:f1ee:2762%7]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 23:31:24 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: bitbake-diffsigs with multiconfig is not helpful
Thread-Topic: bitbake-diffsigs with multiconfig is not helpful
Thread-Index: AdgdQ817oD2HSutoSvyFJtQWnjSNUw==
Date: Tue, 8 Feb 2022 23:31:24 +0000
Message-ID: 
 <DM8PR12MB543068FC27B246F502DCDBCB8B2D9@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0737f19a-33ae-4ea4-e154-08d9eb5b1f3c
x-ms-traffictypediagnostic: BN7PR12MB2609:EE_
x-microsoft-antispam-prvs: 
 <BN7PR12MB26094EE63E844D324A894BA78B2D9@BN7PR12MB2609.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GcJZ7YdFNeeZ143sgoU7h6oScuDBV02NchAjcSYB/AZzolszAcxA650PvXRlYxvYrBPzf+/2+bSCFWK3fxrZguGDMVwPSn7w1UVla2kaGW6YPUCGxl2aWBSHvkL2j76MP6OSHvI6Ctb5AE+0Cd91+JGfeBdnLbyQ2/R4WxFYoZanX6qkgR216h3dDWiyzHbhYdObgUEb4EyZ02b65f/uq3jh/RxEfwV2q3xdkE5R3A3wPVg9KAJl4fYBCCnb7BIAb3I00ELWhw7NTBA41ME8rpmi0l4sf497KPyGIMXAxCbDl6uGI3e9T5QJXWF778cUkRyWi72h0SKDaRpo0ne5gveUIKeNMwXlXuL3xwoVPfBAWbR3mIE+G/LeHDbaXfXTg0qjTIb22mnBa6d/qjXi7+vzmg9ZShR7+5DM6d8NmqFCEtl9kEo8oHTBXGtzQDnUz8qQBekZdt0vj2IIO8Jurq+AHDN2ngPjgg7Kh8CXF3Mf6QyR7zv1CrOAjqiJ8LwUJEAQrnPiyjx7TVvNPUzRIkgywrpPukNRK5dRWtgvXmEO2rBJ+jPPSVrgJs2i3tfP+MgGRYRMk0mtU5h+K2duhAuJLWWQ8oNLsfS8f93TGG9Si6+jav7XYBMsD7SYqOO9lEXDUt9dc+RzoOvrZNEmA1w7PN/+JBDWzZ+hJM9k+PQJjL26NEWs7M9DKuXrUtakAO98BStnxXUyU5qu6+krmA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(29502001)(71200400001)(38100700002)(38070700005)(316002)(122000001)(8936002)(6916009)(508600001)(86362001)(52536014)(186003)(26005)(2906002)(76116006)(33656002)(9686003)(6506007)(7696005)(66446008)(66556008)(5660300002)(66946007)(66476007)(64756008)(8676002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WeVs8sYD/RzBjc15YGhm7yh6JbC3K191CwFNL9Y7NG5DbxzY1308Y6aWK/Ii?=
 =?us-ascii?Q?EzoRRmb9EjjrlZLDztQkHf+R7MqfD9yWy08P4xJPsy9XTB4FpEgvUq3rizV9?=
 =?us-ascii?Q?jG0EVZOWwUFmsd93uRnAEfE13eA3U8ivkDSlorV/CoipQGUD+Pnu2WPgpJaK?=
 =?us-ascii?Q?ibGbBI+yfpOY47Z1k3vTypRl96DqZF+mP8rE5XOCrk7pAQnK2daleaV5jdPX?=
 =?us-ascii?Q?2LXGqAqCZgGap759i1m8Xy6SCYlYWyKphTbkJUa9PH95MEQIq9R/buBf5MKS?=
 =?us-ascii?Q?fjymEH7ClcPe/F4lTe4lzs4PoQwnHbt/eir7GV6qLGKkZhEtlcMYCiJ2U3bW?=
 =?us-ascii?Q?Armthafb1fhz1HcrxLWmnZ0e/cteoAfsj8Kue7wHJKIv5gDQv481ypJOi4YO?=
 =?us-ascii?Q?VdfxRydwuDdx+PAPBc/kkypBy32ljSxGsNqXKea4FO93OIsyesryFv2tH89+?=
 =?us-ascii?Q?p1zSjOIt8474pii2C6iPa+sJ1s5Q7u4WYW5hxrNB9VpIMauVgA33ugsD4KQ5?=
 =?us-ascii?Q?8YqXfmd3RsnicJRLHoZfJrycc7zepj7yD9h87V+pPbvbDoScyo0nPKBYdabq?=
 =?us-ascii?Q?0KatI6UkoLs1N1/3dx4OtQkLmqqXtW8JBveGqtKrXdet2NfEIUoIinUAB7YX?=
 =?us-ascii?Q?FFfGKYnVil/VfbKvGTtJXA/ekBE0A5Clq4uwA564VU7/pGolw2Nyu+3/9uj/?=
 =?us-ascii?Q?2nlRY+3ztn3kuBvB3GAUtsXD1nsfYGjX54Ts/I/a/FKulkFR04pKc+fhUX/b?=
 =?us-ascii?Q?vwVccbnABMhcITtSTfjuYYn6+vVMBbgR2CmGkHVt2alnC+HFcli09U5Ebq8D?=
 =?us-ascii?Q?+npFCYUtmZIwa8zRiRFZDcX/Ib0Ls8HOqWNzvsQ6USD2Vikw9WMaRMC32qne?=
 =?us-ascii?Q?s93tW2Tf6nM5HXgWqLCjKOIaFRbpGI1HoEeoLwnZAYnYYUIvG4KTS30RBKAX?=
 =?us-ascii?Q?Yshz2eN/brPx9gb6FYuNY4bJ6vLf6a6zUqxUo73ziIyz1wUqncj3YLr5qqCm?=
 =?us-ascii?Q?JGn+FUGkLUECpS8qJ1hmS1IRDJ+ULXp5S+doLr2lGuO8V/RqW4Qk9Gs4oYQf?=
 =?us-ascii?Q?uIRjCp4TyaR767SmotbZEA9f5+OPOSAUkrWUEdM7K6lwak4uaxfPIIbE8z+G?=
 =?us-ascii?Q?8E6+YpdmLcPdirI7T09ZWIefrDpW9RaO/xfwzZvN9D+VIRvDYBXV8vifieTS?=
 =?us-ascii?Q?paPgrJR2fLREhxj9GQ8XJJaOb8AiKnU7dlnC0gt2pSc/FBAnMJKNqEl1gMgE?=
 =?us-ascii?Q?fDtCo48ABRptu5Gw1zeurRLtVtSPc550a0S44IneqyfVxF8WS+B9O3m+Qzid?=
 =?us-ascii?Q?sPY/RZ6NarH0ALBZKdPETd0vaS32DVykC6DklWB6tWWrnw4NkFavTaXT/pbQ?=
 =?us-ascii?Q?dVlM1kO+mlFUGNaiXtjr7sRNG3uZokJpsddnXQHOMsG2SB7Y1iMH01D92SvA?=
 =?us-ascii?Q?sccaaFIf1PMZ7jirUzCBmGtiH/8YfInaTDt7rebW0QA2PUM2PLWYD06NrzVI?=
 =?us-ascii?Q?Tf8TwtxCJqHUvEDxZKiX3RkCyRjfEfAbHpuLPHUCCKN+yRQwHQRUy3FUItkl?=
 =?us-ascii?Q?vjBghMsIfNMK1Fi0VlNbJArcnvpIMm+5j+8YVlKWfJas9OwFL2+694dB8D3u?=
 =?us-ascii?Q?lWjK4SAkGtl6vA/BHCDkuuxzSHIwwfd8cowtJxtq1f0NDvu7kOPuda6mfwnt?=
 =?us-ascii?Q?VHmESg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0737f19a-33ae-4ea4-e154-08d9eb5b1f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 23:31:24.7177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bUBV9ImXwcY5mPj/bkJXV5DQ3yCOmR+4Rh9iFhdZXTt66VopFi7dvNGBP52GL9I7CjbsBxE+TLtP0ft5Z8VOVXjFJ8ZuJ9zurTLIjQEVAlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2609
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 23:31:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161534

Hi all,

We are using Yocto Zeus (yes, I know...) and I'm trying to track down some =
reproducibility issues. My go-to tool is bitbake-diffsigs, but ever since w=
e started using multiconfig, the tool is pretty much useless with results l=
ike this:

(where mc-one  and mc-two are multiconfigs)

 NOTE: Starting bitbake server...
runtaskdeps changed:
[-libidn/libidn2_2.2.0.bb:do_package:mc:mc-one libidn/libidn2_2.2.0.bb:do_p=
ackagedata:mc:mc-one pseudo/pseudo_git.bb:do_populate_sysroot:virtual:nativ=
e:mc:mc-one rpm/rpm_4.14.2.1.bb:do_populate_sysroot:virtual:native:mc:mc-on=
e, +libidn/libidn2_2.2.0.bb:do_package:mc:mc-two libidn/libidn2_2.2.0.bb:do=
_packagedata:mc:mc-two pseudo/pseudo_git.bb:do_populate_sysroot:virtual:nat=
ive:mc:mc-two rpm/rpm_4.14.2.1.bb:do_populate_sysroot:virtual:native:mc:mc-=
two]
libidn/libidn2_2.2.0.bb:do_package:mc:mc-one with hash 08ce20399ecf48464970=
bb3340b5cd5600661a296e679fc260d2bcac29ab2ce8
 changed to
libidn/libidn2_2.2.0.bb:do_package:mc:mc-two with hash a3a359d58c1cbe494935=
b7689b0a443251ac78666839742a53fd7083969e6e7d
libidn/libidn2_2.2.0.bb:do_packagedata:mc:mc-one with hash 2c5da719673ea0b9=
5c6c8010dad39fae7c6a403d4b72d22786a7caed45606ca3
 changed to
libidn/libidn2_2.2.0.bb:do_packagedata:mc:mc-two with hash 6082ecc1935134fc=
64f318bf998d65c22b5522aaa6c509026512787495b547f3
rpm/rpm_4.14.2.1.bb:do_populate_sysroot:virtual:native:mc:mc-one with hash =
575c6ab8920d8699e291d10ad6211bfae36f4f3b5c682cceb660ef6cfab111e4
 changed to
rpm/rpm_4.14.2.1.bb:do_populate_sysroot:virtual:native:mc:mc-two with hash =
fed841d6093be9faf415bac2b9dd10f4aafdf6b5bb5075f7da45f2e7028d036d
Dependency on task libidn/libidn2_2.2.0.bb:do_package:mc:mc-two was added w=
ith hash a3a359d58c1cbe494935b7689b0a443251ac78666839742a53fd7083969e6e7d
Dependency on task rpm/rpm_4.14.2.1.bb:do_populate_sysroot:virtual:native:m=
c:mc-two was added with hash fed841d6093be9faf415bac2b9dd10f4aafdf6b5bb5075=
f7da45f2e7028d036d
Dependency on task libidn/libidn2_2.2.0.bb:do_packagedata:mc:mc-two was add=
ed with hash 6082ecc1935134fc64f318bf998d65c22b5522aaa6c509026512787495b547=
f3
Dependency on task rpm/rpm_4.14.2.1.bb:do_populate_sysroot:virtual:native:m=
c:mc-one was removed with hash 575c6ab8920d8699e291d10ad6211bfae36f4f3b5c68=
2cceb660ef6cfab111e4
Dependency on task libidn/libidn2_2.2.0.bb:do_packagedata:mc:mc-one was rem=
oved with hash 2c5da719673ea0b95c6c8010dad39fae7c6a403d4b72d22786a7caed4560=
6ca3
Dependency on task libidn/libidn2_2.2.0.bb:do_package:mc:mc-one was removed=
 with hash 08ce20399ecf48464970bb3340b5cd5600661a296e679fc260d2bcac29ab2ce8


The next thing to try is diffsigs on the do_package or the do_populate_sysr=
oot siginfos. But so far in my testing, the rabbit hole never ends (granted=
 I've only gone down 6 or 7 levels before giving up). I'm going to cobble t=
ogether an automated tool to follow the trail for me, but I thought I'd pos=
t this first to see if anyone has any ideas.

I have a few questions:
1. I would that the name of the multiconfig (e.g. mc-one vs mc-two) doesn't=
 factor into the hash calculation. Would I be correct?
2. Is anyone aware of the situation improving in newer versions of Yocto?
3. We are also using hash equivalence. Could this have any effect on what I=
'm seeing?


Thanks,
Chris

