Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBE3EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 05:53:22 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.14383.1690264399496090482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 22:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NAAHuta0;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690264399; x=1721800399;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=4nRLPEhvLTKOhB/JAB2P683VWC2r9kUlNQhQ53KKguc=;
  b=NAAHuta0hS3zG9c6vsBjWCTxM3hJtZJ0gOX54aI9c3Sync4OWRKRURBH
   VSA+4B9+5eIgdqGLbKw75l7cAnWzD/mZcIDDLFyje0W42eyq1HhtlnHUe
   AKwtlJbKBCccKPX6sgiubNekbS3cjY4AJzXJy1weEz0Nsafd4a//Pdalc
   admJTA8Sfm4rIUfoCPgn8749fP6b1rsfDHwmz/eX+6j/ylrcv6Yev5rPI
   NVPZDocDByU8mZNPOTdTZ5pHJkc1U6gZWux3omQ99mCWuyS7UCi/xZmdU
   dXa5WGrM8pfRXttdXPhJhlo2b2mYSj29zUn0Rsl3IageEUC+jhy+EsoEF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="370294571"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="370294571"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 22:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791242462"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="791242462"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2023 22:53:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:53:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:53:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 22:53:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 22:53:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtHYZggexrRFG+yHQDWwamhVIzqe+5jgseLpAWAadwcm340q7Ylgxmif3tFnt5edObSx7Xj3xlJhXq/gz+ZpM8FoUKOoPV4h6t72kT9CaTWHIS4SA2LTvZcTYTKBrD5Kq1ZDhkwhmF1UeeDKyn/FREAa1e/Df7u83hglsuo/g+3nanB69tRgd++Kb2POMy+N3IFV1C1KE3L53bGLOWLa1mVs50S1gW38c/85Hj31+RuIqRlZMBiKgiyRb+vaaajmYKTl1+Mj9uoOUEfCI7n7ziLBEUyTa7di9t2QfuM2eiRT7te9gOADjMEbCRkKsuLMJaoM0yWJlRi30wu6ao2chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gg4CqzlMnVJ/FrJ0DlPMxZkKrM2XPi7p1GXU/v/Aem4=;
 b=CWEIJuhwNcfgL2Kcq1eQ5gIKYAR2rZAYrn4z3MzwwSAVOz7dxCD3l5xf1l4JkocEdy9YmYJreFo0upQ0FJ9swq96y3rbM2EHCcyQORPIie/p+WYIdKvJ1ZkJS0yFdVeQ+iHBtA8pyY8PGgutbHLi0JD016dZPP1dzGwAANQEO+3RBF0Abd35Rp2oLCWdI/Wuy3Y/ecvXBFqoSnXqMHvRMRWaMba4jZUNpHyNpdF4G1MTgRvs3vkt8QEntXYINEwfPgTte6f97i/YQA4R4w6lwxkjT9xHNFYmW5zL71o1l/QmdXAbZDLrv249yBKPMa+TMYarPteXVN0QuXl08L3NIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB5392.namprd11.prod.outlook.com (2603:10b6:5:397::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 05:53:16 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ff43:1c5b:4873:5b2]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ff43:1c5b:4873:5b2%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 05:53:16 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3_M2.rc1)
Thread-Index: AQHZuviTSN81SNj3uUqS1VHMKqq2Pa/J7x3Q
Date: Tue, 25 Jul 2023 05:53:15 +0000
Message-ID: <BY5PR11MB415236B238C49B4BDC9B2E81A103A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018972ef9bb6-13d574f0-6c64-42aa-9666-4166acbb6a36-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018972ef9bb6-13d574f0-6c64-42aa-9666-4166acbb6a36-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB5392:EE_
x-ms-office365-filtering-correlation-id: 6f35bebb-17bc-45f1-f566-08db8cd370ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2rJijIbbzKeltx3NeqEszRom7hr8Y9vw2kkMAqTEzsSOPUNPtH5Cl4QtFpAbML682eADbOgyaPnakZW9mcEDPcrjt41OeiQ9kJeMQ1KKnshBivXh9EWWswy1t3lh1XXr93sszRSaZ1IlhuB/9NLVzckKcCGT+d4Rax4yDVJ+b+hgKzTlLctW0z+XUHtH3MoeDHjWglSixbu6WYKJUJwhY1l+Ycy4h4PNCOTgu1c8ocH7GeL17WrbrMZAxhSErx9WxC1aM1Qi2oSsJHCFsExj9nQTrhXiczbmYOk2hTIA+FP7NQbnjbMFgxyiQGB2ZEChGRieWVzTzv6eGPPE69pKdgodzOr1hvwLVqjX7XokX10wtuxPBpy1zxoJxUKqoEH+T1/LEPJ3u/N6RuMAVaUwy8Ku2NS99B3BYnoWAzYyHyBuFaTv5TU5AzdKyh6mJ7S6Ev+JYkzm7gCmSuJrnjawP5ZcKphaltJXxx21WtkLFgspSpESnnWsZnoLKL99yJwTyNgtDbO/OULxuw9CtsA3DZjADSv+hrXogVCxWABuf/oAJo6/MklOl7uakGcEJdNBGgBxappaHRT11gqxjSbNDaRgimkEuGmTNeEg29TdIh4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199021)(66899021)(110136005)(478600001)(186003)(55016003)(71200400001)(7696005)(53546011)(52536014)(5660300002)(8936002)(6506007)(38070700005)(33656002)(966005)(9686003)(26005)(2906002)(15650500001)(83380400001)(64756008)(76116006)(122000001)(66446008)(82960400001)(66476007)(38100700002)(41300700001)(8676002)(86362001)(316002)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UCx/+mrEZajO49fRX+bEim9KLzEZx2ir5QYhC/FuwyJhU5+TJwhJrn2mvKs2?=
 =?us-ascii?Q?DdCdiLwT+HwlvfO6+9L2a2YDiq+r18VoAZt6UUdRgrnLqFmrVeQyYydSbFBs?=
 =?us-ascii?Q?GifalYxa1OTJxJW5WJSS07hAYUbrvhxNMTj933L72sHvtb81Wu2DRoupj6OS?=
 =?us-ascii?Q?KF4qvEOa5A4PNOibcr4wZDNZS3W6iKUnFb0l+QgS+08s2UoMs9V5QEMQpZl2?=
 =?us-ascii?Q?MqXyhDYl3NYec+IAmQDHNh+hAnJofE0gsNlPpCfwXlwa/FM+ORcGQZ+/yKya?=
 =?us-ascii?Q?VXFSCpQ6zgnvsGi48/geNommugm3wzdfelsM4NVY/Ay+t6W8S4N9eHgEu0+B?=
 =?us-ascii?Q?ztC27AJs1l27cvs5RFP1DhBcNQb21AKOQpVvzP/JrpDdH9BE2Cp6C256RVYi?=
 =?us-ascii?Q?UBk3DZ1EEklIwVgF8+h55N44zKXC6KW25DIQh+l1j4v6tglU6ApFNC0Xpcjx?=
 =?us-ascii?Q?JGrq+tPT/+THnzkkjbh6Ssp4AEltdrmNR3vDW+NIg81NnUi0TFfBEmC7KyPo?=
 =?us-ascii?Q?Vy895RfKQQDB0t5gPE5zjLg8YLS/hKdpE5g191+XEgiy5oFipNIc1jLHCIRV?=
 =?us-ascii?Q?Aiq8/7culEupw6mVRKnFcW9p+5QE5MOCJpMg/XhYincBAe5EEBJkSBU3MX+V?=
 =?us-ascii?Q?KWcNlEKK7Y8iek2E6eU/XH/AEOxsyy4LjVHuXFfE8tlnUPhvNwXGq3R5KXor?=
 =?us-ascii?Q?/Kq2yerJqURRpNZafjWPxlFqyUdSaNM7/hQ5hGPiCr01xMSnPO2cAnBIQ6iM?=
 =?us-ascii?Q?oP4Scr5mM/B7nU+xArZiW4YqXQJgHD68lAwd2UbZDNz8gWO8vvQWeeCxp2ey?=
 =?us-ascii?Q?mdUxZWH5/kt8JHPKsjONOttyErn+fZ1+x6oy1MbMNj+/ZUi/TohXmQzFPAA4?=
 =?us-ascii?Q?WtLXyMMTtKnafeIjDq/CSYWYtrO24bqxq0Vay55EC+gAsLyRh7z4J7I5lxJB?=
 =?us-ascii?Q?SXOPEMlVtL56f7Y1cEYAVRfUe0IGzkvau6O5JCKExhiqNkSfdn1bp/iWdbov?=
 =?us-ascii?Q?UTpCGD+mS1m9QRnGMwibpW1ieDpeeRhvoH2UsevVPyhKVJdhu5ndNwZpIvWW?=
 =?us-ascii?Q?/BozRvesHgJFKiPOCkLPrJQioSnSlVVKKLqG5dgvIF5CmFGZYXSGWsQxzBPE?=
 =?us-ascii?Q?bErTlyvtF1xddYyM8a6BLkwQit0BbeoxvVPP1AkZnWt+nR70aNxIJTI03cc/?=
 =?us-ascii?Q?uhO72VFlJwFI0yqceLUfDAVUmP9LuJzb4N2j7E/Zx90KyJDmHiGiBt1arna7?=
 =?us-ascii?Q?vlBpSgbIxJdhygZZ41Au92+7b3wGAzwr9+tv/zLmnVZ1cLAwKEtQ984q2zwv?=
 =?us-ascii?Q?VPq0x70H9GaOwX9MklAbStR8skCu1R38qla5bstR6LQby+n2vKoOrpuVUCXP?=
 =?us-ascii?Q?L2gLQUGBHsfRodVADd99e91V7LlPwRA737Wyy8PLKIaB6qolMddDufdgtZLb?=
 =?us-ascii?Q?pMhsWUXm3RwQXJoTyUE/bWLXAj9n+ltcqizl+22wdLvMHB8rWAr3h8DUr8qH?=
 =?us-ascii?Q?/z52n+BkRaSAm2T2pixrpfRe84hxU048KJDTa9RFwU/4WU43eRZrwAWrWmoE?=
 =?us-ascii?Q?MOawOnx1Oofw2f8dEIwoUk3MWxAZx4ocWKVI+p/T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f35bebb-17bc-45f1-f566-08db8cd370ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 05:53:15.9218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwmdAwAjlHMixDEK1QHv3ND9X7D0Q1xV5eo9ZKSVjPX1a4kyYPMxMZ9JhxD9vFxXKTpNKQTUIt2mInNZRPLKOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5392
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 05:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184821

Hi All,
=20
QA for yocto-4.3_M2.rc1 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

One issue observed in this release:

Bug 15170 - [4.3 M2 RC1] segfault for createrepo_c on beaglebone and qemuar=
m

=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15170=20



Thanks,
Jing Hui



> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Thursday, July 20, 2023 6:54 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3_M2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3_M2.rc1) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3_M2.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 64bc00a46d1aacc23fe7e8d9a46a126f3a4bc318
> meta-agl: f1bb0ee68b18a39917e06bfbb08d677bbf8bdf25
> meta-arm: e67d9c4dbc892ef688ff960d68e02627fc99bb53
> meta-aws: 2b834db25df1dd90e2b05f89cf1ddf3790bfc220
> meta-intel: f96c815a14dab58abce5d4ce69e8fa76c9f6de3a
> meta-mingw: 4608d0bb7e47c52b8f6e9be259bfb1716fda9fd6
> meta-openembedded: d57c4655623a7271dc93cfb741ffdbf1b511a5c2
> meta-virtualization: 680f56d9e432c0cb7de41fe50610f218bf53ba1f
> oecore: 8bb047ad3bd93fcf655eeec53e6d1de1e7747140
> poky: f73ae292bc0b92df3cb76c6e8b220f18630f6bc7
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
> View/Reply Online (#279): https://lists.yoctoproject.org/g/qa-build-
> notification/message/279
> Mute This Topic: https://lists.yoctoproject.org/mt/100253237/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


