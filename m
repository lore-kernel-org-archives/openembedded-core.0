Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A747C02197
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:52:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web10.113850.1738666355046711823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=SmKAtsKu;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738666355; x=1770202355;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=dLyNeUX3By1utkgkl9KAYx4zm04Pl3ZhxcuNYkGT9Mo=;
  b=SmKAtsKuJF/xvVfRvNFPftN6tmHfwnsnTJ7dNAhoLhEN1IZsT4l3VV2h
   pB+BQcPNXZunfBC4VICDr/JLQCIK0U0QNcnPRdQ+xR0qqcvY4Kp41dXsr
   jBFEhR8g49wOuSArJ0y/Ax6JrFmw9E8EHBSzTcYjLjJzfe0jHwGh34gAG
   853cDuhqkcyHz7QFqT2sLW81DFf9EfUrQ9gIrcnlQqi/8ObzA0lWz3VVa
   6UqCJ4pZKLM2fcQ9/Wvg/G/VzR5/gOhUxpEWpJvtYdzzJQBfioUbmldD1
   LxFJrEYMtvb6vdykOE0HL2pc1mQETulkOzV7IwJyLrpyg92Htctf/3+5M
   w==;
X-CSE-ConnectionGUID: kn27KM4vQleIxyDohcsgfA==
X-CSE-MsgGUID: 5cNuoPlQQ9aGv6kxYm+ltA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56724527"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="56724527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:52:34 -0800
X-CSE-ConnectionGUID: 6RApzsvFQAao3gi+Oy8Qcw==
X-CSE-MsgGUID: F0Q4LTOAQDCT02F2q7nyxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110344034"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 02:52:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 02:52:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 02:52:34 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 02:52:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0w1bt+h9ui2QA8xS1UsX7z1wgbMFZSxGIETboNoWkps5A6hI+hEStC+jF255zkbZCnsW8fxIfmw1VrkzCZdfKAr3gGBi3I/54sm0ZXmyXmS7ge34qI8gIVjGnhL35n7r/m+DQZwJnkDvAHdJ/gSbEAQ6Th2HU22rYk7UuZvdqOTGcZoV6GTbc4xNucM7TLkoGkBGzkEoINvlthrCKWZTafPqgQn4Mw4qMFxQIsJSBXqRLOIVL7bhdN7VirGG+YaHI7yV+df31NHCAw39ANsUG9DSEj97TrOwl6s+MzEDG9HyIbzuWfr1BHXvb3udyAUPxNZT8+WfkRM+ZugKBIdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjxckIn1NPhPZ62ifXGW5rFWp7tpYxHd95VYMpaA1Uk=;
 b=Jzq/oTvmoDO3quhgSC3fYbCCMxol3/iKACN5ZTVP3LoQ94rrpHzTfm8SZQEm+X/o/m6rt/DKDJXgI2UE0ayrys70FPpA3JSQOyEOqZ64P+u+iYMtc1KUrWAyQSWvi3u17lwcBFTIziTtEevafgxsaXLeDRy/aOcATA8ZLGDl/PhLtc4jNsrB4ve7ALMqjRAPiz1SZjFAmJ8IFrN7tF4uzzbEn+DMVjXlOA4nfTavpv0fevjyp/5Aao0IL76lLa1C6PpaQuE3hZ983gPIV9VNGcFy/f5mvR/Y//eRav77mPuQ3NEwEoA4ZIeE1SqR4r3VyD2LdnDW6hZK7JNC14VW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 10:52:24 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 10:52:24 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.7.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.7.rc2)
Thread-Index: AQHbcFtSqXLb+EvkTEKJcY0wk1hRu7M3BI0g
Date: Tue, 4 Feb 2025 10:52:24 +0000
Message-ID: <DM4PR11MB77605434FFF4387A3794EF11A1F42@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010194a5634f05-e6e0d901-d559-4bfc-9eaa-2ed66dbf896e-000000@us-west-2.amazonses.com>
In-Reply-To: <01010194a5634f05-e6e0d901-d559-4bfc-9eaa-2ed66dbf896e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB6006:EE_
x-ms-office365-filtering-correlation-id: 7e41a391-9b05-4fa5-d323-08dd450a020e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?/SYiChORUwCtZA/g4/gm5A6ialQRnJZc6EXoCKIYaBCCckyB4x1SD3+81KUo?=
 =?us-ascii?Q?0QVe8yoeXybUZszHYcUsSDszEOl0twivTj/EUY3wqUNOcUkUn/7dOZB7nyQN?=
 =?us-ascii?Q?2yDq4UoG97KPrfVdeuHLeu8av1aYt69dRrl6OruhlCgO2QTKfIbYCQ+xrw1n?=
 =?us-ascii?Q?QGnKC0zov1rCN+8Cfeo6KMsy23Al6OGGgzoUE4ZpcO5PpvZo5WAsM3E/zbVS?=
 =?us-ascii?Q?bhbEUvn6xsg9xEe1uRHsn/b6hzeEtwCbcP3R1CZ9GtbReEETY81oQepVSiO9?=
 =?us-ascii?Q?Ek5xEttgQYicdv99ucQliTFFVLSjzQNMlgokIk+cZiP6P7+3YpJqfSE3yhil?=
 =?us-ascii?Q?ANTrhbL26434ikno3y5i4E3CRi4B1CCwLk7aG785zhnDLjKHRZKe5UGphYD5?=
 =?us-ascii?Q?rWWRnuYd8zKhv1SPvEDlo+0/imL24pfTJ4dExcRK3hSzyI0dwbcJN6ONkrNh?=
 =?us-ascii?Q?/tMhyauzPZUmu7SAV6UpSA5Coc/VIH7DwxpC6GiBnyy95s9jjx47oe7UGEWY?=
 =?us-ascii?Q?LMEg03/BQN/OWDr/JxttYbMXnbLfYM6bTZqax69vlHveSM6fQtEBaq8HbxMG?=
 =?us-ascii?Q?3ApuiNAbeV2OJ+2Vy+Z0QTNGBrTdPGTrKj2c+xiEoadXBGQvGDZSdqfm1VWd?=
 =?us-ascii?Q?7lNueMc+Fd1jE5OgEHThr+RzkPMnoUoTHr7ke4Cfjg3jBQSSss4UHUvApKQ6?=
 =?us-ascii?Q?7GvqVDJ3PpILOHT2Brs740D38+P6H6KUmjejFNGzt8h7kc4biBavfL+KKdjh?=
 =?us-ascii?Q?8M17A5Ge6SA2JtLa/NyRimoUGzcDfATBnjN8pJ5yeN60nmIpJay7FEQj+KS3?=
 =?us-ascii?Q?RkzbxDlLmjHyNh3dfjd8JL7JnK9NMg4OW0X3aSxcTUbds20lVbnMDH9zfV+f?=
 =?us-ascii?Q?EaqXx60045YXkjyS744XDLnH5GiExPkjhRDVKc6sfgTkpfRajkaU15pVFV3F?=
 =?us-ascii?Q?HgI0reSjF/XLMzwXzdkMFx4zokiMRuVfFp3pfrU1blXiHAq/dmL/iNAAmLqy?=
 =?us-ascii?Q?1KKtZYwR76gfR3WmP11D+kyg99PgWlCjHfSB5zunjOxvmifNhjbI6XUhyPFz?=
 =?us-ascii?Q?osKc5yt6YHPvPurcVtnGTEvWpnrC+slil2ZxOmRUkGYmXJR8AoVtRr2dhv6p?=
 =?us-ascii?Q?iJ+VxZOtt3oifE1jp/EH5inlUJCwET8gyXN2Zu6C3apcQsx69xEos5zyhoYT?=
 =?us-ascii?Q?J4Spe/LGCe0N1fw0NJ/RVw169pql1ZYKv4LV7mjJ8IEKwUmJF7VPgQTKFsWo?=
 =?us-ascii?Q?mjVjME+J65gXC7K8iYhcbO60LtAJ+xkfE38x9W7g1UtjQb2cmuPmsjfA9Fjt?=
 =?us-ascii?Q?uMbAATfgT1KsDGiY9cZQ47GLPsygfHGuZuyRr2B7s5gDNhE7zJxvkjDfXy8q?=
 =?us-ascii?Q?D20DymdyvkDus0O8da5fR/pMWzkA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jPXE8Y9gv9X3JzLGpvCLr7jDQhqAlnWT3Cc/9d3OkT9VpOtt4/ZnwJ8wPb5G?=
 =?us-ascii?Q?S8fovpd58BKzGeyXnHWFvp1QQkaCiCTZVnshvi+x8sUUO2hd3+BKkdbXhCwI?=
 =?us-ascii?Q?jw/sQ2PJXKdOfFeTdob3cDT/Hej1VMLgX7B4Esp9gpKcqDjrslSV5Sk1CK/e?=
 =?us-ascii?Q?F2mZpO9ccVPTXUQ61dfdkc09qVoEkzU75zebmWwYu0YwyqjzVzK7jEGiUzX+?=
 =?us-ascii?Q?hpMoBNjohFkiVtmyU30jiiRDflKEgkbFaR6mhCIZt59+qLMK3ZaH2pcQxyz3?=
 =?us-ascii?Q?VVxjjw3C71sl1SzoJNZ8lmW2TcOUOvP/6YtxafwVTTGEU40wn+Mqs7V6Ct5M?=
 =?us-ascii?Q?krHy8phUxzSjOBbiNW662csMvWQZZ9gpgbPRTijfu63rr3sKOXhVRNmE5ji7?=
 =?us-ascii?Q?GocFiRbCCIxgZ/FazRWFjgu4ljDov2+D/UVAQF2Z/x6xgNtXr8JZAjqd03xa?=
 =?us-ascii?Q?Y8y8RAhqvGnOdKCG+k53ipJdWdZ3d0lOUuvhq5mILCZF+qCozAKU54IfPDIC?=
 =?us-ascii?Q?1acqSGzEW2jIB2yHYO5iTLFqlllGHrGKQ1PNsbWbAmmkrBBqVzC9PusvS6Ac?=
 =?us-ascii?Q?kpiBrFPgtQGK6SB7jkmbHG2zZrMW2P6KWbDDtsTyksT73sA9/4zdMIwK/6tU?=
 =?us-ascii?Q?1mUGLW+U5XDErLZYc1RRsn0OmeIABco+K+lqz/1VukM4RxQF1sKUvPpgAnHx?=
 =?us-ascii?Q?jjSBFNEcFniZWBaAvvf9ETmjgvp42hXEKBLQjEOJdhu9ewdTn+bopesWzhwE?=
 =?us-ascii?Q?WWICZXaR7h01D3ohaL+mBEfn9Lhw9aVSiUtGWBwaEeKgV239DAR/xaOK26zw?=
 =?us-ascii?Q?zRWsqhmUVv8hQXaBcDT7b5ipbh8uusq/6NMvKd9wiDelSuyIzwT0XE8q1/O2?=
 =?us-ascii?Q?XaMXEP0xmcyRogxVwX+1w5oF4rv6ePndkKK2miHxsSai0cQwT81fj/apl97m?=
 =?us-ascii?Q?qOxtS8VhqSbDKRiXgE5ijeo2D4qASZ4YtTnJZXib57l8hKWjDS54ZBKkRR3R?=
 =?us-ascii?Q?/8nTK3lQA6+xu8XKz2txf9ST3iOs20B/f/QBh3XYn8IAZOai22l9sRbXCBOI?=
 =?us-ascii?Q?w5tB+Av56sNH/LWPFeira8cbtPjNSiUYGcqWlcCBYrTypj7J7LFKe/PGBJxj?=
 =?us-ascii?Q?28o1fMTmWbikVXFAd5g6XMnBwH8ciwlEOoms1LfSakt3H9CBnhOzmnw//K1c?=
 =?us-ascii?Q?BapRGWeV1wEFa2lYGDtbJOJAqLPRSPFrJQzLEPpYpE/i1iyczYS/PaxUkWjH?=
 =?us-ascii?Q?gJsa4SusfOCKLKm5/szadQvrfNroFyLsjTI1JCH0I31+cbj8i8GZHdvGkMd4?=
 =?us-ascii?Q?RzMkMNLnJ2Skdo5ByiACr5PzA2r+FGdzHIYNJpxyPm0nPePxLbYBqEJYT3Rs?=
 =?us-ascii?Q?YLubgqx8iWipLDgLxB5WA3wq4XMke6DmvY5TyU19D5+16ZMQEZqxaiL42HVm?=
 =?us-ascii?Q?IxNDuhHNTji9ieZg9QWvSQQM2q507OdD3PXkpScWqwUGUIEAYTza6rxw/aX8?=
 =?us-ascii?Q?NhSmhgqK+4JCUL8q+VQSs/t0P79pdcqc5l7CazzJYAKDz7yfm9djNLBQNprX?=
 =?us-ascii?Q?6f81eCZtU+BUbmspP664zp8pUFVc+P4QyBlFUkZr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e41a391-9b05-4fa5-d323-08dd450a020e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 10:52:24.2972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSsxl0iSGWKcCr5JWHgzsCGi4rFwR21aHCQLbCZRlwHulz803QeFGwok77xSbiraZ6BQ/jl5yN536Gtu9XI9Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210765

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.7.rc=
2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	3. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	4. Meteor Lake-P (14th Generation Intel(r) Core(tm) Processors)
	5. Beaglebone
=20
=20
ETA for completion: Monday, 10 Feb 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Monday, January 27, 2025 9:32 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.7.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.0.7.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.7.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/893
>=20
>     Build hash information:
>=20
>     bitbake: aa0e540fc31a1c26839efd2c7785a751ce24ebfb
> meta-agl: 45428e8d626b06a809686fa0db8a3892498b96a4
> meta-arm: a8fe9d22eaefc294f91096c6a32663e2f4ab3b10
> meta-aws: 4f45b4b2a940577bef4301a69dcafe743af1826b
> meta-clang: 8c77b427408db01b8de4c04bd3d247c13c154f92
> meta-intel: 0be954e82f09d235d2b5e5ea01bb62ffa8d0b5f7
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: dda0d53326017d6758ec6bdfdaf2f484c089d13f
> meta-virtualization: 2ec66285d050ef3cd29a5ea57c71341e6b17b36f
> oecore: 62cb12967391db709315820d48853ffa4c6b4740
> poky: 7dad83c7e5e9637c0ff5d5712409611fd4a14946
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#505): https://lists.yoctoproject.org/g/qa-build-
> notification/message/505
> Mute This Topic: https://lists.yoctoproject.org/mt/110832130/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


