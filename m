Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F297FC7EE2F
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 02:39:23 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.4802.1686623961825621590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 19:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=EDgNG4CS;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686623961; x=1718159961;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=M91p/NAQgjO5QtCpmNQHxASZs9dR8uHGqfn3RvJrSrk=;
  b=EDgNG4CS5nTkXzZa0AQTT+0BhzKuuGvK3dOIhai+Jv6oMoerAyhQNls0
   roUCf0xOQ0kPvwzBoaKdx5VGBwkIiJhlPsOclJKsmOmUl/6bE4Q7Ug30X
   w1a0TPqVTna7kqQ4U6U/gZeA6GLDVDR2AQQG2LgqTH8tj4dVNLYoMGqg7
   Bb5NpBo9ds2k9IviK+wCdeI4hMIQRNwsGpB5OIDvwpWZaNc9Av7YrcXOo
   6tAxs0SmRmKppDxZDG2kERZqIe7/lLRoZ0LQS00CpA91G+66jv6QsjQSe
   0lGCd2vlLe9ru9vpIOyoQ7oXZU395zAlLuA+Bpky1pMhU6JSrKr4Yby6L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="360692603"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="360692603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 19:39:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688850058"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="688850058"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 12 Jun 2023 19:39:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 19:39:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 19:39:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 19:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQc3nA3Ky85cRpubNkKJ+uIxIrCJyucZbpMqhbTKtiV+VKGBIboEvxkGy53x+Pn4vlzf6cFY7TKApuU1EIo/jxk9POzCDsWLc4HXaeBA1Lqi8Ke5XqtQn2691fLZ9sltXJlISIXzrBAZ2WPx3rbVPJCldNxOXVqybpTgzISzBPTfmTBTQHe4y8jBulhBz4nOnEjwLhNiEtNoBiCwSCWWU4R8oM3Y83xSPA5pwoY78WTA8xCIilaMwZS6+dDQTDOiEdmTvfsCNMeh2R3flfHE4f/ysJe6iTr02ul6tDdn7mpLOdf7TGG1NFn6UBFJzM34gAae346VHwNy8wHgJZrwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Huir5yBHjk2U963fbr9BNlv/ofMYlswg/b2EuneRNwg=;
 b=CWXt4odLwmPihzavwn3IFE9NSeob7LR8oPutHnAfYAd/HlzwSsREog1bkPicxch8xhj7UHDaUYstu7hA0R9QinpkQ5/9W27wxtZ8JtY6lt90qWRgRqG9mc7B/JljxldhzTY1nzXRdqo7zgiAhFMCkqEG4H37jPz8skSQyqHJUtf0m9EeLjoDAIlyfjlrc74QX6YaPlyKh+0wnoRS22xpGs1ai8IisDzW+r4bjs5A6LJamImZKPnT9ouBjFl7qTrEaLmpgyN9gTYuC2u0zrCmBxWxehgzN5NgXhtvteHau9gW3HY4bLYaYLVtG3sx/0pwnNJdUDJTjdosCwjylF2RRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 02:39:18 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f%7]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 02:39:18 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M1.rc1)
Thread-Index: AQHZmbrSAC7VGMDzeUqI5grm6/56A6+IDMAw
Date: Tue, 13 Jun 2023 02:39:18 +0000
Message-ID: <BY5PR11MB4152CF024BED203C534C3F31A155A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018899164df1-9305f1d8-3a77-42f7-a537-7b3189848fc7-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018899164df1-9305f1d8-3a77-42f7-a537-7b3189848fc7-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB4932:EE_
x-ms-office365-filtering-correlation-id: 9cbf6260-d210-4b5d-93fd-08db6bb762d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Ly0zveU9JxMgQuso7iDXQkh4wLDVvdXlc+oQqrsG7df3Qp6QpYh9FMd0VAb6Rsnl//rRM2/0FdHxiY21fG1mdy23qFGS4I2XFqK0YsaZOJs0aOC60eErtuLiXrDHonLEAilIvEJv8YRlCEEZSNQDFf2IqOHgWWTTp3wdu41Ph6Oq7CWxiJreppRPZXqH6pREIoakOQzgvYFifWEdiWc06l+G5tqcgG3G8m3jZOfBS4pjRVvAc1Gd96c64/BPFmN+4e8vV80MLr7RcEsDc2SK6IGkf7FW1f5KAp9OmYPj04jaeFXmtei8W3lvXBhUf1JHsRca9c96I4j9VR/9v6t+th7mLvXOYVuyfgELK1qxzIpxYziiTJNArucqIlRgwEOmkxXU4ERCbsMdeMC1PMi7Jo6tyr5eYLqZ8edDHWSOLF8VvzUW7QM8tnnpUEIYF1fWtTLpx22LZ9cH8zbEGLRUlvNHs9LhyzkqLZo4W2mDKThKMZQO3nm4qDIZLDGTkHr7pwg3YviUfLRy0j0GCn55EUNxavxopcmFkAahskKOTx5dEcxYsgMRSYguQGFwhEkF74CWnOnE2v8JpIwXitGS195FrTrY8lY/jEkS+sCHafvcejCXYMj+XZaC02caNWmYNkFlT8+dL90B8VVPTWKrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(110136005)(5660300002)(66946007)(66556008)(8936002)(316002)(52536014)(8676002)(41300700001)(186003)(2906002)(66446008)(15650500001)(71200400001)(64756008)(478600001)(76116006)(66899021)(66476007)(966005)(7696005)(53546011)(9686003)(33656002)(122000001)(6506007)(55016003)(26005)(83380400001)(38070700005)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OocrYdls/ognSh76nqcFgbR5uFEV8yrsWEoMX/63hRvQbElfwKwEZE9RvwB3?=
 =?us-ascii?Q?IaUx5rqa5KFX6iBfubyStM91mxnzO1b+FdNvSjkv/dtUFMrEHzoolqnpmxV/?=
 =?us-ascii?Q?k+zIPy9CK9U5GWnFr8WR6qpQcSJPsHF7WVHneTJ0nbi1e2AwBkGM0IkhEh8G?=
 =?us-ascii?Q?kuQ3eL+4Se1C2dJDfXStl23pJpjSBmqlgE2TR2CHfqlP0CX5YsAo9VbAlqcr?=
 =?us-ascii?Q?XIuNJxSeWsA2X2bd4dATEcDVr7yFD0VUuQRp4jSlT66TWY67/GAyjbqYxhcp?=
 =?us-ascii?Q?hD5rbYnoVJ/IqER8avYdP13m5ohkVmAxQeeo6nKwsvZPwhTEb58ZMCgYdLE/?=
 =?us-ascii?Q?x25/iO1LwXtza4LdfPeoXgYjs5kSF0tsKsXnjJ2EyCMYTUGLXVGleiZV+cMz?=
 =?us-ascii?Q?FUHMPDlkfkF3zEDhIHti9UCtJnqo8v2cN17IZZLzVy+AXOR3sAkyHbzDeish?=
 =?us-ascii?Q?v/n51SKJwQ6lAwH/b3N6EpTYHo0R1QzTI8DhM7l2qwwMXQCLewv0o5y5hMqV?=
 =?us-ascii?Q?wYKYIapGA/Kag5J18fl5WfrVZ3YFFzkMRPh8o22j0EeJ0xrtYnCtw8oG+EdS?=
 =?us-ascii?Q?tjfUO3byrfcZ7yyMjtBNz8BjtKBcwCwd8Qq03Spyz4ieMDNIjNQA+H0YG1Td?=
 =?us-ascii?Q?/kYxuzkk40+37Q+9MWrSvY7CKFkyF+6XpsvKsR1oM1pPakPwpQeJgGT0vokO?=
 =?us-ascii?Q?9c9OHDijyf0nwkRSuk3fufDj4PcUSgleKjdGMc4ArBMxr8ToZt4emAcO/Dko?=
 =?us-ascii?Q?siQBE7WrQxPlBlcQMwrObozypVyLGqSvxyb7ZV8UZ0xIsDVvyuxBY0+hiwRM?=
 =?us-ascii?Q?tnQGtnRAIu5/JOxCxhuM89j2fa/CKa0FWI2D6FThWJfJ19+7gMT6APChxWGP?=
 =?us-ascii?Q?Qv0oEkID2mpFcQuBNAr/F/rg5vIULWAqUjfJiW7hVDcRCklukR1azPiOJxTE?=
 =?us-ascii?Q?GmnR1/6udD3ZLAVk5NdU5ySj9uNvvm+sFiLIrt3Db8LudOK6Q1/dAC1xCYBL?=
 =?us-ascii?Q?tDls+h9dMSAFRfNE+TpNuWRdrzzfqannNjvNZokCTated8NHkymTnenqIa9R?=
 =?us-ascii?Q?VDj1Lxd+OTRvRkig7Sd6PkAMvIjJqC3G8MMrUtiN9yIhjNvyEmw9tv9X0vL5?=
 =?us-ascii?Q?nI5eGiNlt/XqFLfBw2/ZHnPwXO1phThzK/HONDcvm4+NPdFq0DJnPQ4kLDzE?=
 =?us-ascii?Q?x0n8CeQtFDokM31i15GKubYasJqitw1HEdYI+v5gTDA66/3TuHcvKejPr3ZZ?=
 =?us-ascii?Q?ByxMTMlrvjxo5qFcjZhh1I1HV7+6rOpQCGaU93uXHoafbFtQ7zs8vSteOWRF?=
 =?us-ascii?Q?9L4z4lgRojjYNXgiKb0YalMJ5BPH0bSkOFrAK49aohNluMt7K605JURlsfOp?=
 =?us-ascii?Q?iVetRpWIhWYgGK5crAF7FXVL5qBRGkPp94v33vIKUVCbqh/r76v6IJNVvTM9?=
 =?us-ascii?Q?DjCSUwe3jhvpnMsPM2bg3ar3lFCdSlMtKMe1l1Rgv6OlhG3S00dDMnEmlBe3?=
 =?us-ascii?Q?lXEkz55BVgm1lCQr+/qnFadrrlQxAJNtjp28+i2mFdiYR6fsq2ETbWW9S4NT?=
 =?us-ascii?Q?CxDSoAcbP0BqhU2xNizzmtqS7XMa9NEyaTw6kkfx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbf6260-d210-4b5d-93fd-08db6bb762d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 02:39:18.4178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qjn28n/LpV3/y+WVqxsN6xchbvSSY/awNet0YifdahW7glDvOaA7e+tIjb75iw1kwOCMQSG1016xVRW4kFr3/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 02:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182690

Hi All,
=20
QA for yocto-4.3_M1.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20
=20
Thanks,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, June 8, 2023 11:39 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M1.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M1.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M1.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 6abdc81dec06a362bfbcc06d69b90b96bd9bef01
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: c1a7dd5eda419109b179af6cbf93cb0dac2f7ae3
> meta-aws: 03dbd44a850b13c581f4335254f915ce50bc13c3
> meta-intel: eb696e99ff8c5be4f9b181da9f134499d96760e4
> meta-mingw: 6badedaa3e4df5b00b5aa992c5c174e315b09972
> meta-openembedded: 1955d0f140a9610346021d42fa45cb186eb6f042
> meta-virtualization: d9dc99282fa4a7dfce861f64e792b1a8307a4a8c
> oecore: f7ed7ae854e49276750d1895593e0a2033714235
> poky: cc97d775cb402df0d4122bf54eab1a5198c98471
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
> View/Reply Online (#263): https://lists.yoctoproject.org/g/qa-build-
> notification/message/263
> Mute This Topic: https://lists.yoctoproject.org/mt/99399916/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


