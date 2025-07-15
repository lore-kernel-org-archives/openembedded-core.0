Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F7EC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 02:26:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web11.5358.1752546375271774614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 19:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Wq6Qvyrj;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752546375; x=1784082375;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=54Qts9eDGY4w5wy3M91cjzbKuBeO3S0KsYJE43QV6eE=;
  b=Wq6QvyrjZ58+kkgt/ykARcZSkNWb7L8FRgvKc1ITf//oK9fNx+PLIcGA
   w5KVuwr+GKKUH8ov7abAg/YuH1+lgyZ15qrsQDsOALt6m0ElCmcW5km71
   XQD79CttyQXI4MRrOJV+DPcqPFMsmn9CB3SLRKa2R5NsH6AyAGngRW7eL
   owoqRZSNJFxvTPas4Pgtc4saBPr3C5gGjjwXdFn3nQOB1Vq+eI/dsc4q2
   TC5VZdk6I0y0AFVGg9AGYPV2uheyS9ewWp9Yl7KjWmbxLRkMVorJmMUkZ
   P/Au+URL6bh/MLB9vOpPE1woZIS5ETv/w9+Yw5YkX4+b2qFoLVTNq0JcT
   w==;
X-CSE-ConnectionGUID: WNqIaHzPTQmPKxWjQMZVDQ==
X-CSE-MsgGUID: mGf3BOKwS5SOg+CFdQec5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65820815"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="65820815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 19:26:12 -0700
X-CSE-ConnectionGUID: YFbDz4VHSjKd6cndKm67xg==
X-CSE-MsgGUID: B1RNgZcSSJCzDB8zRDrV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="156509405"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 19:26:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 19:26:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 19:26:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 19:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9/5SZ/gCsN72N1INs2M+HAlDx1wwpyzHB4frXCQDmXESWzDcUDfPmRf4tPFIGvmj8x9j8SaWoyVYO0Ibyne3AtZqf186KfxymSWa9Wx8JXDKYam8LbtBnC54EZ+hXWWB50g2S3xIZEbYXPAhlx6ZkfWWhuG8TUQ2DYEaIi4mQ6disvn0tuCQO+ZjtWpGIH0X8UWeAiegELYZdwq8uJkhwUwPQjfPibpSehqi9KRIsSSSusz56FYvN2OzY8AP6ODorjw6VnZAhyA7MLQRqaYer5smmj+ri03qlkYC8cmBKzp59CbYfDVu+GMEd6ahhOn7CCFFW8MAy2FhFAiejqjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEixC4QhXK6IW/7orak4pSyuVc6BK51Xrd1DICGDk0U=;
 b=OMpzwjZnhe8O1QRJ2maR2E2NgIy6IFbNqzt0qNoA/NvtxourqsxsBCOw/VwwuUmpIUnZ0BBjoWBJ5OvL7STOqDR8KC8EQPDMEoKgWVNmqpXe1HJi+V/sFfDfWASM41yQjPpPiXwBFklMVyzUjiVbAkypL1ur8NWpS6bVC6uERpk1nNIknzbdCMxKQk8JjW3JE5b9XMmmuQ+YldElPQrdafxs+4h836mllYtgiq+HCmyPpna5uJHZBc+R2vxxR3D9gIMwXQnCuH8byka1mwE7pRShHeq73zJr33LXkbf7NI39iMNGQS3Nxr+Q9y3mKBp+J8RF5ffocFXxal0f39syBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 02:26:09 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 02:26:09 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.2.rc2)
Thread-Index: AQHb7SBP7IijA97F2kCg8BSGDOK5orQyhEnw
Date: Tue, 15 Jul 2025 02:26:08 +0000
Message-ID: <DM4PR11MB77600CC67B5F9E04FE00922EA157A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197d713ba6f-e2642c15-ef64-4874-b369-deb0cd1af702-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197d713ba6f-e2642c15-ef64-4874-b369-deb0cd1af702-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|LV3PR11MB8695:EE_
x-ms-office365-filtering-correlation-id: e5f9ff79-ceef-46aa-a174-08ddc346f574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ndU76qU156Sr+4yUMG8KScf6/uLom0CbhBJUoQmaXzu6eKZAEy98Q8qLydtM?=
 =?us-ascii?Q?rReZWcSQEEPUCjFznWIQeZkZf7oMGFAuf3ZyKXyIGhW4k8PGg6fUd5HRmuq6?=
 =?us-ascii?Q?ljTmDwfyU5tdcDBiP2gUXaaJSigeCVGN7ySHivFybzowKc3faFcZcyNh5PiB?=
 =?us-ascii?Q?vKA258ZrUgHBQ/W8esf98SBVnzrQ13bZ0vPl5knYWYCJblFESov/d4hLyle6?=
 =?us-ascii?Q?ZAuU1BvgyS4lPpOSPP3AYJgT/yDKPlyn1uHts1z2+OjC7lPPOWf1rrxI8xWl?=
 =?us-ascii?Q?8XM108XQPbnziAfuqsW0ufPHSwow6w7VPnZYZWrWpGsFzSrsopk5O+LQdLmk?=
 =?us-ascii?Q?DTFPxTzgVPIQ+cTRB/ggvliMOauRpD7dXjR7NqSzWEHFHjH7HwUDi3b39/A8?=
 =?us-ascii?Q?bN+/zKrNOam2rKYgxWid3uVV4erf7JHfQltU2ZPmPd5xdMqqlQ1pSYr38n79?=
 =?us-ascii?Q?g3EQ+aHs09KLhoHIX2CfmZSDkllD2ejsMRS+UDXDXQLPLT+1Q4hQcyD5YIFi?=
 =?us-ascii?Q?jgvp3GI8Qw+RWv8SBxphxMFc79PqXK5grLZat4kFiF8P3aYK3PyKbFSdyz5n?=
 =?us-ascii?Q?I2rHPnLI2mQRwOVmtsZ49sp+LIUuAn8vR0oSt6EXYRgub2uLXAjHDwWBqDx0?=
 =?us-ascii?Q?QHDyjSb3+Aj1eH9f/EJAY6ZygBdY0+OGp+kFlISpAuEtRrtSpLsEljjPhzzy?=
 =?us-ascii?Q?9wLMk9sjyT91pw9MyDylcvoOM8NmXD/vTk9WJMQfWPXPS7QSmXoFzuLJWdBk?=
 =?us-ascii?Q?5h9XRAN8hPBfaXSIQGG50n75OKjcG6RHNRINF7RjtvYM2lDslJqqmtuQTLqx?=
 =?us-ascii?Q?eImhwDRLq+7n0HW2/yZzbx1TvTFexlM3bILsUxtDecXCVO6hBq4AHoLHmpHo?=
 =?us-ascii?Q?VHKil3gJoqPCx0GHxq9V0YFW0YwCcRdUJZ2mCBRi/B0hYgpoUb2q0iYsIW3S?=
 =?us-ascii?Q?GFMwzN1vy1VLCRYB1BPKvlcc1VJKzjhgMED0MhUX7+1mdBTjvx+JWCjfx8z5?=
 =?us-ascii?Q?UatFgGeDzvYNePOMKnyii7olgGb77moQv7gaJ2cX0a583nFh4yyX1sx8gNiO?=
 =?us-ascii?Q?4I+txx2dFiGA/LogWlTNABmdhHP+3uGnXXzMOXOcn3a8VN+IthMnITVs/STh?=
 =?us-ascii?Q?16LnB6kXykej8fo+HAchiCFlu/qOLaqKNEl5qmu145Ybr7oomqxQ2yOoZEH3?=
 =?us-ascii?Q?RrvDs2GtpDspBwclzPubb4Dvb0QiPNLAH71hmeRGJrLvGvIGQrT/+AjTCQ0s?=
 =?us-ascii?Q?t7cyjeHGmiFDfH5Lnu1vDrlEJgqFevfaLaCpwQenHBpAWq2plrG1JZhLK2Pm?=
 =?us-ascii?Q?09SKBFH6576/ZZTV+h7CmI2c3A5YyXKZDYJwsTPwuJ5a0AyOF5yrboxQ9DOZ?=
 =?us-ascii?Q?PmHA6684n0TiDqAwm/ZhjynyzGvzDyp+GPveY3AbJN3LP6PNi/unBgS3zooq?=
 =?us-ascii?Q?hOkCJg6sBcE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A8rVHr6F9mLc3GGtG0JeATX9CDQ4lXKfrVUY0clfPVfexNXywntKUhi/4Fzs?=
 =?us-ascii?Q?q6OfOiUzqvgpT0bXLnN31/7IdpHdbCO/h5svKhd29+uxOe9gB3iy5ANsdRpm?=
 =?us-ascii?Q?Txdp4HVklk09wI+iUo898BNZbNPuFL6oY8K8Pcd+gJeUwDB2+KnBDp0pYBgX?=
 =?us-ascii?Q?rtaFndipGdUDgrk0zA4j7x8DrwMiauB6HqOk/bM4aVgnT1rikTk+Xuuapi+a?=
 =?us-ascii?Q?ZJRlJCCKP48qvEfL9jnOTBe4Fp80H/lMb+fr0BwQd+NWWmpQKp40O9LrEOHr?=
 =?us-ascii?Q?rBNV1VfPg4Egu4crFMr2oN7RHOiGrmDG5Js0/IsWoSswhhduRwgUZ8BVvjTG?=
 =?us-ascii?Q?HqHFKaTqBOi+il8ldqNvMFFplYAns3QqlA544dW7Bda5KoU3ZvS3Jz0mkuVw?=
 =?us-ascii?Q?SpAyLoKjcj5cA/jOIzKg5Bw+7Vme3Vz0PY/otu7yDCk81augo/8PnNBXUctG?=
 =?us-ascii?Q?+SSyG3MSo/IbexIxWlXunNOuMZsMGC+T+MP+ZCFCZyS3WzdK8a0NURISiTsw?=
 =?us-ascii?Q?fuy+InglPaIaw3o5CwaktkaCZvoLyf+0yZzNBipbQ1JGHaahBRXp5RrjIJMJ?=
 =?us-ascii?Q?iK4xU0MkAMxWb42w0StqYusi2JEFPkWTV+OeCBc/Xcn/Atq6NorzvIIrfGzz?=
 =?us-ascii?Q?bbyH6HOBpNzgIfddshbboy5NtivkUYmlmdghzbOkOhCWtwJ/z9LWiW2xkbwR?=
 =?us-ascii?Q?DFdqfLDvXttlRxLqVraj82E4qgAo3VIA5YJlFGcdVy2hboIBkTc5BBo5DhkF?=
 =?us-ascii?Q?IM+WjzcKQEYA+TdNo8HMnQpig6RBNE1DEs8LX1Gv8OJyGMhnZpDHuhLuaUY6?=
 =?us-ascii?Q?j+eQ5y9AQkrDkQObhBFWxnqlcrZmNp0isUwtF3hvMO7thAem2M4S+VVeN4uc?=
 =?us-ascii?Q?EHGqae14K1v7Nq6c5P3udxcxmIZ+tHaLOKj/nqSqQKCDFNF7MiXlvXwJBoQw?=
 =?us-ascii?Q?cshjY7aUSdxcpxLK+wgZfdJriDJ4ADnJumxxW3ntWfeaTeKZYCvQ7WlxkB6G?=
 =?us-ascii?Q?1JyTMYlknDI6p1PrS2XSWd0EcXA0t7STl999GmA8dIKwUC8a5dkMAhhHrop3?=
 =?us-ascii?Q?SQI1v1UBMMEtq7uAgUbRrXzv4kZ3uVDI3sWZEvxGA3Xzfv74QeppvrhnRbjY?=
 =?us-ascii?Q?MJOfHGyrhMmvJU7jMlct4IhSdB2noWfyBKy0gLusmX6mZG1nQAgZuKOABiEU?=
 =?us-ascii?Q?x4aO9Ipyo/adFNng8AIkllHq/Q6r9RssEzobSycqten/ekZBz9xFRjVOh9tI?=
 =?us-ascii?Q?8yayIJmlkY98mcMnbwS01jpTEzCqmTB5CC4hyQInTVOxzV+zx4U2oV4d8cxe?=
 =?us-ascii?Q?Sqpfcz4Da19cAZJFzpT2Zujj9e+ZO0ntdUJh/FKQIJJit5y2vBIHZ8OFY15v?=
 =?us-ascii?Q?7/HqlX1ufa2S9p3v1mw9pPM79soodYXv4oL8upskQISswgjdR4SHU3fBWAZe?=
 =?us-ascii?Q?DK6sqP4nvrDoFbGOszCJ4yV88fy7Ew0qd9hdiuCvHaDc7KRuMh5SFeFWNYz3?=
 =?us-ascii?Q?p8Y3fuPsh5TtsALVGdC1PDsrJuGfQICsYLAeuDEiBhIezXMLM3z/P9mPZBU4?=
 =?us-ascii?Q?kp21aEDKClWJRo6X06zyyAdNunBAQvH/ohRN9Uoi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f9ff79-ceef-46aa-a174-08ddc346f574
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 02:26:08.9479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9tjKBGgCnu9gqKCYK/C1iQxuJ5HgxSM7H/AxfkLaz9QMZ2WQlkMegv4tO5y0UD3lQUI4Sme1JVhCivspi9oJxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8695
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 02:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220263

Hi All,

QA for yocto-5.2.2.rc2 is completed. This is the full report for this relea=
se: =20
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, July 5, 2025 4:15 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-5.2.2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.2.2.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.2.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1955
>=20
>     Build hash information:
>=20
>     bitbake: 74c28e14a9b5e2ff908a03f93c189efa6f56b0ca
> meta-agl: a6202084bbc77708ff599060a0e2f6afb3c15498
> meta-arm: c63ce2117ed9ad720c61a1e2df5d381ca1ac54a2
> meta-aws: 77bbf7b16d5982d711b3188ada49deea391352c4
> meta-clang: b3e5449f0156884d18c17efff99654cde8251411
> meta-intel: 5640f6592c984f4832ff5f2ed1a35a607e5d21c5
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 3c6844219a69d9ca8cb0f1579114efe9a9e2a646
> meta-virtualization: d20e589758ac40a846a8cd22f3b646ef48d02647
> oecore: c855be07828c9cff3aa7ddfa04eb0c4df28658e4
> poky: 41038342a471b4a8884548568ad147a1704253a3
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
> View/Reply Online (#567): https://lists.yoctoproject.org/g/qa-build-
> notification/message/567
> Mute This Topic: https://lists.yoctoproject.org/mt/113989219/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


