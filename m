Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE1FC001B0
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 01:39:29 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.24526.1687743560397937679
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 18:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=c14v029F;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687743560; x=1719279560;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cCqyrrXbkI+AaVAafdhPR/jfYKocE8TihXhXf0YUwfw=;
  b=c14v029FxqdkOEd9yFs8et/Q8V01cSjwY3RYOdh26YL86F1GpCZNskjd
   uASMC3jXdEQYhx9/4LDImgX+tniUqcCRYAoZjG1JU1JJ4LQlRJR/qS20s
   jub7SslKtG+0rnqTPRjZ56niHVz5QXpvvPL9Y9UqOy8PTWg894XuGUOVA
   jDDnHe3KzePMPeSXfK45FCEMm7VBqeAHG5cZAH6bIsDXmsxyF8ae8BLK0
   53BDgqRQFSK4wEyJH5UegGiIQmT7R9pxsOpWNdwdeQXvi3BbQKub2+szl
   9RtWRSATvp/JWjFBpiEODbzujSB8t8AdJ6hDY4kVzgHkWs0tpa+mjhDbM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="391355567"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="391355567"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 18:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="805833941"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="805833941"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2023 18:39:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 25 Jun 2023 18:39:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 18:39:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 25 Jun 2023 18:39:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 25 Jun 2023 18:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXvpvo8bRbmWg/YqDtgpmWVuQVFBrew+bDp/+x+X/iZJFifLeOcbqCnKY+eDnnQnR+NYeay06lHwDAvTqpHHehF+8H+69rDXC4zFa8Rv7VUdhLYmx0DaRyb3MJ1PlGI6XCWh7haGSwbrbHDOUMgWNhkrU5eKrWT5PCujkFeCRDIKoCQAzQYtzsJmXK7ZtFPAoYP/eXM3pG2KjuRNavQh6vBxL5xj0547kRj4xbBrj3eoc2NzNZwXAMgGwnHRWIJ0YYA/7gQompYmG+unTnd5FRzpAQ2Ot/DuCCofxRQ8DSIUxGKEcy7ayg3cVKu9vC0qn0LJ7S0rUeu1YV6J10mEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FESbXMx4845DgbtruuXA62c39OfXOxVZnb1Yke17dU0=;
 b=iht4KJiUxb4aXA+dYUB3aq3lrBqNRj77eRYI/7017QkyQgFae9vZBQ6sbS+EtqH6TJhhapcRH7A3AyyNtHPkr5WSo7PetUn6GurHUizu47pYtYBgqegSnlzSkaMLfxmh5GzJyZSiv/8aht/cRP1KBD28cX8mBBQnMHyTWlDvXw7PGJdt6nVNpdw/ym3bYaHUXWIYiTvuKWFC205U2uM9DUM00gUER4VXLvPotPr2ysrXrmJHiXZ1CTFH0bhfXqdEB1VLcmHNNRqryj22SXLcEO3aduWTSwmcjxNDinTOjn2uKbx2gd5Kbkjvyr0i14Qy8tJgtxqLQiALJjvtUbbf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 01:39:15 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 01:39:14 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.11.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.11.rc1)
Thread-Index: AQHZpgYhgREPUh7gYkepCXqj4yuVga+cUU1w
Date: Mon, 26 Jun 2023 01:39:14 +0000
Message-ID: <BY5PR11MB415208FE829A719A7902D2A5A126A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010188e9a85af3-ef64f2f8-a9ee-4dcf-8070-b9af7ad4da0d-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188e9a85af3-ef64f2f8-a9ee-4dcf-8070-b9af7ad4da0d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SJ2PR11MB7715:EE_
x-ms-office365-filtering-correlation-id: 5cc1910c-491f-41fc-1981-08db75e62621
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XSG1FYltLVGBwzHnRh1+/lVIfPX+uSG2GaVFAuc/Q6zjZuPkog07eFKSu7YWDzLXm51cTE+fbouUMyyD2jtbTKD96V/qXAlDgOngjyPy5lZhKMFF2JlYmsOhygb0ggCEaE7TJtKicW/gdWMTVcwI8j24xD/NtPtbgic9u9rvqgulY/wBb7JvA+YFqnTUyLx1aikPQ2VHYzPkGGgxB+xeJKrl3RxZvCmvthJfz6bxw/fN0lOMfXDomKoQA1cv+x0nHvCOZYMoqFJyl0qwgzNb2PscAi9MdY+REqolgH8GrGQ1p8oDiJNg7hEMMW/mK3yAQ2cbWZ5ujUvCi0ma9liGCs4INCtLXCvPutCaEw0kLUU1Z5nyNI0tnwhTYFv4tsO68nnBTmXNjHQISQezvnHw6znVp8meYlnJPm5weztozazeSJqUTqQbMw/Qcw3cu+oAcz8atjNme1lhzTRyEgwnrHokw81MRBN/MjOvMcH9Zt9pY21f7oqtz4WSoy4ODQ2Zf4GwRUVET5TYpH38I7+tJbTQ/CuoGL5ouRqzThOFV4XW+9p7wTAJhVF10fuIXczKgAFa6cL2wyYU4One4MLFRoIMoH6yxkgUtulUQeIFqK0a6enY5jdT9Oke5rotvuZNef1kERmcBb2c2n6Zy0i82g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199021)(66899021)(7696005)(966005)(110136005)(478600001)(83380400001)(55016003)(38070700005)(82960400001)(86362001)(15650500001)(66476007)(66446008)(64756008)(33656002)(53546011)(186003)(26005)(6506007)(2906002)(71200400001)(9686003)(122000001)(76116006)(316002)(66556008)(66946007)(5660300002)(38100700002)(8936002)(52536014)(8676002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ijJ/uqPwf4d1DJWvmKGonM/siM3K6qjBQ9BOUbVhM6guQM/Z7CDPCV1dPd7j?=
 =?us-ascii?Q?gyrEFwnolfBDDOTo9AXK5VWb1QoWq1bsGYZteGqmflfN27miSFrwqhh9nX6e?=
 =?us-ascii?Q?xr3FtiyDmM8egAE0jonSIkjs7+/YN7qOFjMQtHSgal9QBzRsmi+jab9wvQh+?=
 =?us-ascii?Q?2axTZmXW6bVZpPJDOJC8JHrUbMVKJrESDkjIF3To6vmByj/QY/PqpPLqGy2Y?=
 =?us-ascii?Q?azKhPx2y3LwTOwU1KrGWu4uuiZDph8xitY/ZMZXHxVWBJaf7noH/OnilcJ45?=
 =?us-ascii?Q?/+aEfUDJhwgtjJKYh06QutAbqSorVaAAFZvpu+bDBoqmrdgyRMnyFA9Az62S?=
 =?us-ascii?Q?8HXMMY20cTXas9JC+qhpkyB2eE5bmaEc/8y7EAE4OZdNzqKz37jqFof9rcFs?=
 =?us-ascii?Q?bL4yxd83Uyv2zw1GYXK9htbUn/aTx+VUrdJgvPsOULLDpzmsqmTfmMnUx1tR?=
 =?us-ascii?Q?3UymXLWJnw3WJ7nemN6bD5pxIvzXmMnNkpHkZaT4oIw+dYrbYJW05shRblvC?=
 =?us-ascii?Q?b35v5Hh5TN1obpBAy1rn94doxLT/HY6TtaYndxpagd5l/9meVu2fCnfJrZoA?=
 =?us-ascii?Q?ZXq9nFKg87TBrDnKpCu3lO6kEiQRS/2YD8/xNZijEcCk4le8f9mV/pWxlRj4?=
 =?us-ascii?Q?+F90oVisl+J9mV2DmXZ0eYhLRqpvZqaVSAh/1tZOkkv0kqMrQ5cT1x4ayqTZ?=
 =?us-ascii?Q?mUK3CpEnSYNO9ocKFErqpvyeqz3mHtM7Tvh4jX1fDUS7hDeDxOuxh2zY7MUe?=
 =?us-ascii?Q?d1RWloXKJqvfT7BY9A3pZFBE8JPqRQsKOGByGKWIG8vyCG99OLfx1/0tzAk/?=
 =?us-ascii?Q?jY9Bw+SPNlCuKjqdPVE4mU9qz2WzWPdVxMmCNabyEQDlbVRDvnqK2qrlRQhz?=
 =?us-ascii?Q?9cELIwsDhTyqJajgIHuBejUTD2am6pUNNdwMVLPFVTjCkj0Cw2zgUKR4BhzK?=
 =?us-ascii?Q?qjApEsW2Ao9OAr6g0te5i5OuNvD/KkbC+UIHlOlomoEUhkf7SEnSv27q5LPG?=
 =?us-ascii?Q?6UBfQBuW9SV0LOzZzMcvgPFfFHJm422738VXXgPBoXPBQU00+IfIp2JIwbLw?=
 =?us-ascii?Q?oXKQqO+PuhXnJKdmFrWgZur0s9ChJmrC4xCP9w+X3ueZw2iWSz4CQzLYZLgp?=
 =?us-ascii?Q?fUY5hw3Dv7RZw1pzPTyhGd27RWGRwSdbaEWRufTD8xGYHfxOoeDR7nOUe4fY?=
 =?us-ascii?Q?AQupQ4nMCzxLXeeSF4x2IZKbHXMvHAL/O0Ox57tHcz0BrwZYLnGg2QH7ZbwX?=
 =?us-ascii?Q?M8Xb3QlgwaKaXBR6SABh3e7NBhVFt7QexOWcAVPkY5mPWU8X3R1fiCNY5Uqk?=
 =?us-ascii?Q?8Os/TKT3EirtwFFuW/cKrElmH5XDHZd9ou9wJrQHFClkPlGRsHJUMn9CS3tJ?=
 =?us-ascii?Q?7pFd0dx0cRziAfnFx4OR25uu8C2I8FmsEwEwHRP5rDDGd1dhlKjRSnkgAyTD?=
 =?us-ascii?Q?HaxR0/RrGG7IAiw8yRyeo1eXapKf89Twh59NAIk3j/imJ6ngfGRjCCl4XkgI?=
 =?us-ascii?Q?WFX9QoSvY9e7SYbQDHxV+TkrHuJ+IBwphbdBc29LzXCls1Z9Vvk8cm5PgSQh?=
 =?us-ascii?Q?mDeJCu/clwUxobkAiA8ZFu0JUBDIMNHnLWGbJk4Y?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc1910c-491f-41fc-1981-08db75e62621
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 01:39:14.5547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BKj4khSCpZD+Ufg+3CCCnLQyAivctW0veU0tVGClK1gF6N98yGrng8FbhzAvE7HQBHkalbLv/Derlq+Zi9ReYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 01:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183400

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.11.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion Friday, 30 June 2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, June 24, 2023 3:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.11.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.11.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.11.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0c6f86b60cfba67c20733516957c0a654eb2b44c
> meta-agl: 1b0cad77090b75fc040f9de5db06374203fe34c5
> meta-arm: 96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd
> meta-aws: 7c498bc8f0d51b9c2546b8f7e3347cc6e61d74ec
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 7fab6b8f1a3030bc6d2f1cf48789599af3dc3e78
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d
> meta-virtualization: b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d
> oecore: 7949e786cf8e50f716ff1f1c4797136637205e0c
> poky: fc697fe87412b9b179ae3a68d266ace85bb1fcc6
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
> View/Reply Online (#271): https://lists.yoctoproject.org/g/qa-build-
> notification/message/271
> Mute This Topic: https://lists.yoctoproject.org/mt/99724928/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


