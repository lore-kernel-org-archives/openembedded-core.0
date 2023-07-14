Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3471EEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 04:31:41 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.11690.1689309095783252372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 21:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=UqJ6IYFy;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689309095; x=1720845095;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=7MEj7fcIliYJm+RDn6y1LI0qn57lrcNep1BK6sp35q4=;
  b=UqJ6IYFycUuqHCvc0WpoembyYuhC6LVvafi3TOQ/h28IPutJcQhjT/Ok
   N6xgfTDTs1Kc3CkE/YKRMvZzbm5y9ANf1oLrIb+BLHcC0cVREr9fQJoLl
   /R1N+qRzDx1ZyKFf5OpuyVQO6pUmqC9UOunA/IUwcfwyICsI4PNtweALg
   iNMsnzEM0ODDTh9Rrz6CXuAnvGBARFKUTaARK9DWql5/+SwYEYc6WXwL4
   g+sG1gKbLyd51KiKatwsV4CceVTPv8DGcqmWjN4jvTVnoKjcBa9bPp9QR
   AtNDYxwTn5U+vHofJkIAAOAFMfZpd0e6zWHejDkqE3SWlmy5aVP9it+Sh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="364263853"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="364263853"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 21:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="672556089"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="672556089"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 13 Jul 2023 21:31:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 21:31:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 13 Jul 2023 21:31:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 13 Jul 2023 21:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC2yigmvEvbfABKUxGlzW1KC9kB/txxKVRXDPysvLHLpPiSxbnFqp4QKiKVNnewcPPghLyMvnmXOozKDOdrwcRMfNJJcyrsULnVXWdPQfEuvEFZfAIfbLuaY5cOX9AEnLrFd6H55P76uAI7lVi8YhEWcndNt9DxjFEszVyvfXKLhdeXNrQq4IVmkgWkDxzo7+fzefgbW9VC5oqOmbnFGwlMBiGFX9I4DjP9hRHzcPY8K5xQumiK/BSlOplmYrIbTIBfoRsl79YsLaPd/8XpQ+A84gjFOc4XRWC12KSY7dbaCa0A6w8Y2wVOBfxjNvi/JqMlWFM/Wl785HxK83dYyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLTc68j1WvfKyFyLspD4LraE676dAfHcnHk3AsxaEUY=;
 b=GHgQd57BMXLTzuijiXai6OYT69X7GV70U8wC5+rtGM3POJdMXbWbmpj9X0EbUL71mqk5kHlmxOYRAibWVaZP83NdIiNjwncWax735NAYSjO/xfQ8QWdPlNFZ820XXqxixWkT8F9wxLiJc/1xpsmgSmGLYmuaJDwMLV4yUH0LucTSzd7KH8vAwboWJ8xTpkswg6YWVmyrfjmIxijjxZP6NPhw+K3nULCdg0YooiyZSMK8oG82nf7uebiBO3TO+QwiHXxb8LLDrcwe7yABqbvzKQEJB+NZEMXfD/68OurXziSBYfMxMh8k64m0xJ57sKOlgHt6fJwE9JHujvrChX9lmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Fri, 14 Jul
 2023 04:31:32 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::e9de:9e2d:4cc9:9446]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::e9de:9e2d:4cc9:9446%6]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 04:31:31 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.2.rc1)
Thread-Index: AQHZsfaOShZLESmzA02XuI5WaOSIwa+4s+hw
Date: Fri, 14 Jul 2023 04:31:31 +0000
Message-ID: <BY5PR11MB41520257892928A3306BE904A134A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018937e7039c-06f98c3d-58fd-45c2-9032-397dda013bea-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018937e7039c-06f98c3d-58fd-45c2-9032-397dda013bea-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY5PR11MB6317:EE_
x-ms-office365-filtering-correlation-id: b131071d-978e-4059-1c00-08db842332d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d8F/fmNGTbu2p7KO96jfZTgNF+KvTLXzZoEnDxfC5iuAnc8nnNGxzYY9gPcdBTY35hfgpHa5k/uKtHsa17hT4gRDj03MtewJyrCjDrr7S4fxltIPhh6/mQyzqga+W8KzsXw2+XEFmR2Ibgy5mvEYCJMZ60JMrJw8+hzAKrfWt7ZRUB595aRa3cQjE2XfBssS65gu/2gSeeEKCRATLLyEtIPlo3AIjoOcYD63tC4vbMgYdxj3W0ezWQlzU6PSrWRYAyG2oPYTZKUe1WBuzHQhtV1MiOk+VyRq429Go/ktGSU2ddTLVj+ELsqq6kEe0Vb6L2NAGsqPcYtxkxnW0+Bvze7J/4tRmtVpsLz6vdYmPOnywrxrP1ZlgW+k7U/1QEe7XXZ8oi5A1ZcAbRgCFGRbK0myNdz/CLSBEY2NcBueCU/xkoP5UZIlKktyz6KLtHjzIwmn0sFnuCkwmtPeYQCnzoQKjln/rQAGe6O3MHgKFbLtgvGZM/n43C44Riecqe1MzsZ+GjS/XkMQjpSUUqnxT6+R82tMq0s47jnst8jwP5XKmcdD7mOiz1aaIAL7ePmfVGvgCiW33/lK3ez8gO1XKo2C8ZFbhUtmUKvbU1wJ2A4xne8MJ6UjuUABBgZ6KUjp7brqggbTvrfg+kPm4HkpNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(2906002)(66899021)(38070700005)(15650500001)(122000001)(82960400001)(38100700002)(83380400001)(55016003)(64756008)(66946007)(66446008)(76116006)(316002)(71200400001)(6506007)(66476007)(53546011)(66556008)(186003)(41300700001)(33656002)(478600001)(7696005)(966005)(9686003)(110136005)(8676002)(8936002)(52536014)(5660300002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eMgiB4KgCxfyktGQ1XuGHyRtrhuABZ/BJpPmEN5NN5dJcwG6xpLl53FfPxIe?=
 =?us-ascii?Q?c1fgTlss6B2r9etHwE2Y3pHh6pTAl/ZO1F1lffEsyAl9Tsle8ijUJpxYT3Q0?=
 =?us-ascii?Q?KS1kskPk5VRQVUeIqX8HxekqISCTdxLlkw15y5kERhdODvd07Yjs5kXyYUYW?=
 =?us-ascii?Q?9MBHaExSMvhRecRxZGTnEF5CM02XuzVu2n6d3A4oTfkwvL1jXqYdiRurVV8P?=
 =?us-ascii?Q?L0n+q0iNUIfhGHqsc7e6HuecaANeU92HsTfn3T798dOF5UG/8spIv9d0S3oq?=
 =?us-ascii?Q?RGikU/DpKwPFGHTQqLr4Y9deMZxPODob0352vsp0JYwzJy8C5DzA66AMeuix?=
 =?us-ascii?Q?/ruc8UDjq4NmbIlAl/1mTZ/5t0vl0Gkd5Gw9WDqvvIiQRvBc95Jt7TGAS/oZ?=
 =?us-ascii?Q?BDXjfkO6a/VSBsJ9/SGNfys1mldxtsTOqPiwFnSPH3wVP46K54zYFmMh2Bon?=
 =?us-ascii?Q?Qn1ioZM4jZ7XeCPMxfiyN8oJqu+lrFTjHK6fxug87pU5XSkQcE+3KHtHQwU+?=
 =?us-ascii?Q?81y3mllulRTd7iGXQXjDPerQLrPnyA6XWHIjtOz3+NktH4Laaz/zqbJcL0K7?=
 =?us-ascii?Q?QHnwsXRlR3eWy1TfsGYAxEsr7ffZDO6nwuTA298kB3CZAsEIBPCZ+BU9qvey?=
 =?us-ascii?Q?te1igOBzvSkrAdcOYdxUUaqtgg4O12tIOU3gruWXAs9fZYCH1BF1DNyKNwRh?=
 =?us-ascii?Q?2Mxczu3xGxEWMljLEH/KrYpW+rryzaX1nlnaw7LbHEM2hJuNFKh8jFyRcRH9?=
 =?us-ascii?Q?pC1LiECD4kKpUtIwx+3djPZwngwTuPIYz9WduALaChzFXcCmk0nRqM9Nx9hG?=
 =?us-ascii?Q?xfb3fIBdjlonjxtrjxs+ps4OZ2Msax0kQgxBJrdFTBnBF38fVpnh7v4V0cL3?=
 =?us-ascii?Q?7vwyyzBA/F6iyouJPBNdqa9itkL+dFT2IiEdRNdgBswPcDp9Rz3+poq2jwES?=
 =?us-ascii?Q?kE8D4/qQU7/f+qCsBfILwvTUidlWKDl/js5dWwdqrZPJcwne2AVGFj68wxCM?=
 =?us-ascii?Q?15CxgXECoVmv0XrOYNMEMSvJvvOCaDw6EPrHiFwqwSgSPUkbPArujmQAGVTX?=
 =?us-ascii?Q?lKx6meRe3fFnFnon06fu1fjCmkGA5bQRNun2PT0rge4MMMalxIIHZ2ZO8T5/?=
 =?us-ascii?Q?kBigww5K82wDC6fA+AHZU26O6h2+Qs5xpdul5hxnuJh8O9ZGzwkqCV5Cs5rY?=
 =?us-ascii?Q?Ibw4jpgO87JESJns/BYvGoRrqu83vXeucaz3XUoKWkUs33YBHsIRNLJn+YtQ?=
 =?us-ascii?Q?mn8Yc78G7VEWhPqapTfl0iCYNq8mIm6N/kEVd0E2etQekWRhJeVCdBqGkoyl?=
 =?us-ascii?Q?jSF/vjVbPJUf6cIwNWIan67tbi1BuV7yW2mMcpVF7/KMpsFaiqnOCNqdxwot?=
 =?us-ascii?Q?TGOOWRJRqBO3wuZyVFtiRQ2uYsmac4+fQd80rdl74gas03NjRokSIXutTyqz?=
 =?us-ascii?Q?cS5R7Z4hVOmwXxuVUvWEyOtm/DItw4fCb7UeH4kc/Ahyasu6BfK+tmKqtWkU?=
 =?us-ascii?Q?xGp++Q6oXrtOTnNl6OIlM8T2gLN4z8ncKAZYHblpTbsPXc9XYcpF+YsuCwHS?=
 =?us-ascii?Q?gNucBlHwok40/8frCBk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b131071d-978e-4059-1c00-08db842332d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 04:31:31.4309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X26TlUSYBuMOv9cqyJZ3gBIwF47aYdDVzxDC/Jn7kn0ok++wTH1oi+HT6wfG2QV+fP2hDwZEBNekCXjz5ib5Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 04:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184252

Hi All,
=20
QA for yocto- 4.2.2.rc1 is completed. This is the full report for this rele=
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
> Sent: Sunday, July 9, 2023 7:47 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.2.2.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.2.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 08033b63ae442c774bd3fce62844eac23e6882d7
> meta-agl: f1bb0ee68b18a39917e06bfbb08d677bbf8bdf25
> meta-arm: 1a15a5b052d488c9f02ab8279b24003666312c96
> meta-aws: 8fb078b20eac38a7472f5e476114f4283fad3beb
> meta-intel: e31edebd4166a7b58ec11c00f9364d9f5f50484f
> meta-mingw: 4608d0bb7e47c52b8f6e9be259bfb1716fda9fd6
> meta-openembedded: d71a08b3d8fc69d3213c10885af9cc693056a8bd
> meta-virtualization: a19092ce81339a129edce745522eebf577efc744
> oecore: 3ef283e02b0b91daf64c3a589e1f6bb68d4f5aa1
> poky: 6e17b3e644ca15b8b4afd071ccaa6f172a0e681a
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
> View/Reply Online (#275): https://lists.yoctoproject.org/g/qa-build-
> notification/message/275
> Mute This Topic: https://lists.yoctoproject.org/mt/100032563/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


