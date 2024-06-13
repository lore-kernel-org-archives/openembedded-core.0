Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A303DC41513
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 15:22:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web10.11250.1718292143036617948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 08:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=fNEydwuP;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718292143; x=1749828143;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9bJk0F+nwA7UuqLmrfRT08jy/jYZxKLLeOR7q3zhhBY=;
  b=fNEydwuPFdL1zOOimZC5OcjfBeOjUHi/OG9lCM9ChCdHH4fQXP7Fa/KW
   38F9d9hO9UI/yQPyIL8eq+N6gChWVcMCMYM4R4yJ31qG3EWHow0/YDQwd
   DWllcPngW12JwM+/Q7S1/n5ILG8vOCaqC+HXlkWWcCr5wTveXcd0Sz+zo
   xE+p1yqL1E+porriw9ShfrNHsX/3ZThry1KeRVMVhQ3alZ7qlZ9D7+EBs
   BOdX/ryUfLS5mClsRQWDF/WtXojEPnCg3PL3Cm1gG1ce6sMd2B6nj+he+
   hwzrYrXPY3dbICd8IqKkqeHR4mfGoj2hGezNIRyGe0ChBEKns4KcYVz//
   g==;
X-CSE-ConnectionGUID: f7+S+QBoQ3CVFTttgNvDoQ==
X-CSE-MsgGUID: lgQvO+NjQsa+puc0AhBvdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15348964"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="15348964"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:22:22 -0700
X-CSE-ConnectionGUID: Wj41tcvBR1ud0rOsQ2hA2w==
X-CSE-MsgGUID: 7lg6qKDFTD+mrG0Lo005/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40135396"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 08:22:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 08:22:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 08:22:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 08:22:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 08:22:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjzjDvUwGufo0/P2+KamziY9JukfVWxU+vJxL3gsLT83ycPS4LpGupGcu5sqqvFLso26G5R+dUvnKZU8rOUqPN41faFFiJj4L5l8WiufDXe62VICi/Zu0y8DUYqMMHLvGKy+CTcxXWPPRu05HeedBJx/2z/1MaOWTS/VIKbjs2+xCd3qhqgzpxZZhsKt6/pzEVxVtjCfEIxXRPSdBs/WGCuWTjXieASMCDQ0+RmDPZZALOJOfOXOKxEWSg9SMvO6SafEItxL4ZtbgBnA0N84yH7IT/MWeqNtCoNETVCkqySzG5hbnBORv9mOOjx7CFpWRtcL0Tl2aCMq4qMvmX/Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrXGS5xixMuRZJBnpZG2vhNoqGNh8OMFRKfhm0XrDlk=;
 b=jQ/sIRaqfkwPwGlr4IWqhyb270euMfKUdKyd9ppEYFNEJDJqC7Rj3Fj8523mSYNY4em0Qe+LxkKnp3huUITy0O5948VJHsT19saZoeGQWUsCnCdaTXOoKFmHK3GYeuyuFz2kD+JkU8jZnLg03kEFQDJCJ7dTrHUQ4QR2aTDfZQTxztOULcPkvZcjz1VlTim9qUfB8RctgcGmVUgakljmMMXUTYMLVITkcHUE2qAqP4TdKKZppbcFLFE306TvxFJvpsfwKdIgPfWfcC8GwQCeHh1Ct+8eNiO7qYLwberUm5S88p4ofnFSOkjF0ZryhoYRg87sCNZBObhcCzMTuKdF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 15:22:06 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 15:22:06 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M1.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M1.rc2)
Thread-Index: AQHatyIajZ+qAABiXEi9GZgB9f2Gc7HF3ABg
Date: Thu, 13 Jun 2024 15:22:05 +0000
Message-ID: <DM4PR11MB7760A232673DADA826041F9FA1C12@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018fe7819c42-92849e6f-1a80-409e-9100-713586c8ea4a-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fe7819c42-92849e6f-1a80-409e-9100-713586c8ea4a-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH7PR11MB7551:EE_
x-ms-office365-filtering-correlation-id: 769f187e-c791-4391-ced5-08dc8bbc959b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|1800799019|366011|376009|38070700013;
x-microsoft-antispam-message-info: =?us-ascii?Q?K8lbSkt4FdNT3aVag5Whfayd+aHk8N3krHCTusZ8BAHy5TfOZPF9Cv3MzB50?=
 =?us-ascii?Q?IaZvuxulRaLUcDufQlnsqy7cw82Z8CWdr+uQYoKP/ZUeDG0IwwQyk/sykjd4?=
 =?us-ascii?Q?zgSLc8Co/kRAkAyb9ZiizMQoOTci0ngKCr+0EdscWET+y+ZSyWr0kbINbPXw?=
 =?us-ascii?Q?raQtKmeuMONojQVZjhspvAv+4X+GDPEeTkqYAHO6pY6GBvXWXLq6774n/cGz?=
 =?us-ascii?Q?QPzzIhu/FWjwRGEjrZyp+1LX9K7GPBRyaeqn+WNPs3hjtO8lyoPSXPvazNsg?=
 =?us-ascii?Q?ZwGnpFMJbGtMQqbvewLIdAZQr1xT4Ad3mYioZzWQoH/Z3Lx4vsZqA9rEW99N?=
 =?us-ascii?Q?rCyC6NkMysFchgKTEl8tB7lWK9qGcQc+b3+CQibZqjlOH+MA2jw7k88vjy+W?=
 =?us-ascii?Q?E0XC7Azat74+ogHN7M+BxYp53/No/eqbCX5rOljF5vYnvWOlMjl7RgMRaTmy?=
 =?us-ascii?Q?iqXmlDcXcqLMR+NKWieQl4dhZbI5xLZDVfoNnbOOopT7rwfM6kxAVh3IUdcB?=
 =?us-ascii?Q?sAiWtjY5ALQvDfhXbNd6WjyIgJPp4j9v4/lvg4fzWJuAYnwIT1t3sfKqcPEL?=
 =?us-ascii?Q?oJmAWGwi8hLCwSZzFCdFgmtILorUJPx+Y5g4UXNFBM3eO4IRByBw2O6pTrs1?=
 =?us-ascii?Q?Pzj4NlQE2Yaaxnehypoz2fHjoBn0ax//0iA4yhEnLkbjMVSI9I1qSE9jfKus?=
 =?us-ascii?Q?vaBhBnWGxTffsVU0EXr9nqwdUvE1JO5Sn/4GmL85Xx+XmmPkQv2YbDJTvUIw?=
 =?us-ascii?Q?ywyU2nNNTdmet/tgaxLGD2aEW1Gtmi1IhXJxxjt8Yp5L8+NsLF2GmPBvq5Ii?=
 =?us-ascii?Q?aRWxUp7yqdIogaWDT92FevTQERmq8AnAU+t8s+FoQA9MPOXD6fHMI4GKR9hn?=
 =?us-ascii?Q?EnKxJ5ccC7mwO9SGICYu6oUSvTYA9LyuarInilMbCmMYztZRT834nVdDbJc9?=
 =?us-ascii?Q?pLahgwHmv85pVq1j57OJpanOEhbiGFI7a1U99xlE18nQlfJckgX2Zd3ILqUj?=
 =?us-ascii?Q?RAOi1cFueLqKR3IFVKW3SWsoNUunTUsJ8p0qak78UARwUcdyu76EAN9uQ19G?=
 =?us-ascii?Q?MDJJyg85Oxi8N9Bm89xzgKbbwzxWASTm/9kCi2ixIwHjBVnhWiIf6ZhjQHFY?=
 =?us-ascii?Q?wKUvPR2zjMev+Vc9YP6/G+mrsxOJKBtolVLWOXXLsqyTj8qk6clQjG7kMfQm?=
 =?us-ascii?Q?3S6tYNwvE1mvgvcuhnB1Ad91CV1jVaVBU5lOOx+qgxrmFoswVW9cZS2Y0ORp?=
 =?us-ascii?Q?uCC/rAAC3p3WRhcYkleJqgI+Jg/l04flIhVIZnGnRFwF1DWWBAzB7lNw/cMx?=
 =?us-ascii?Q?JxwyhPDaXvnOIBBhEYrsD16d?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ka+M/TFbtAXGvz0fIPIzFpmoXnlTwdNSzIacqPf12HD5BnBSFbINmYoo2THz?=
 =?us-ascii?Q?CTzOIj2c2cSIB7N6lc8kWycQY+HAYB0wHuPu54agJDg+gA7aglU79dpPrfMf?=
 =?us-ascii?Q?UXED3R1/uqOhXFWb0lldSZupx8ydnQ2Vnw5ksbWPJRY3N9TOLOyU3hVNHZoW?=
 =?us-ascii?Q?DwpxgrGUvFGzOU8FBBtdv3XlQvIyGSublLkvS8KRdirzXWOLzHQuaKLnJEpq?=
 =?us-ascii?Q?18dv7UfxEMO3oy1zyRX2pF8+c/LMYu0bYqHE2pKrekWIuLb6dy6aoCwBZHEw?=
 =?us-ascii?Q?mFT/C6NxXz3Q1Er+knGlPvVUIrYCABOimrILWTEPSh7dzhKJ3++xf1fcEioE?=
 =?us-ascii?Q?NsbWgUeMLwvmAzurwU8uM9SxsyEN1aXcR4H13msoNGkX42WjoaQpxjICNTd2?=
 =?us-ascii?Q?kS8+o/yJf/jNF0eBOIPqI5A0Ax5Djegd0e9xk/FEI6mLt0cDMfcImzOP897N?=
 =?us-ascii?Q?LfxTt7Y8H/kb9Jel5vb3t0otwj3twyojOzj5S5Yifk1o+GwRkdykjQClEu8A?=
 =?us-ascii?Q?xrt0RySDpkP/JrUMGelmY1L/OyS72YLVV6KqZnPtBfEWrserkDRwODozNolJ?=
 =?us-ascii?Q?3KxKNJOaU2OsO3DYE+PgV6Z/LIyDqfJNmF15hcwmlZFMe0z0M3u7+3Kob6zw?=
 =?us-ascii?Q?BbNdhi7y1sGqF4btmSroPqtl8X/es8NW+eDLAS2uan9dTkKeYRg0YbZNwadT?=
 =?us-ascii?Q?H2dvgq6FKOSJ2/+o/1rwxpAqIf2xfHnUzcqzUD43QxkpRQHd6TgO8MS6ccGJ?=
 =?us-ascii?Q?sGDG/+qKiG/dfVrjCac+AlcKdXNA2FIbJwrKXLWcLuM0cAY6uM7Jc75yLwpj?=
 =?us-ascii?Q?y42etuGGwBGGpgjtdWKyNPhcDnxIrFjU08qf4aOEb3zgCVaInx693A0gc+Tf?=
 =?us-ascii?Q?X75immh4gOEF3k+Nq31qWg3ISwMjXnV83E37DYN9py5sYHQJtndbfRZI2E5T?=
 =?us-ascii?Q?nDhtxMZDJTlCwvHpaIJlASNvnnd1s7XmcznKzKNIGAh5FlfEnMa0/mfU5CJi?=
 =?us-ascii?Q?zNkC0GcMaOAngGpwDyak+v0/mFTu4i07omeyRtcZ/kihkZsSc8qiTKyXvp/I?=
 =?us-ascii?Q?AQj1t9x+D5Wv2vuOenjoVZxQW9UiyF7L3uU1boNa+io9aFVI+FKs478lUcL+?=
 =?us-ascii?Q?lSrJrnOZgPT1+YEtAjFOfSUDQ/r1CX15EjLT8DZdGjBdgOTFV+Vz1b3kU6q2?=
 =?us-ascii?Q?bmzDZqSS+jGI8sk4aYQQEEcU2NppzZxm2hTkPcyOIvARlvs5pYtHAgtTrVSf?=
 =?us-ascii?Q?KMG4G7czO0/scwTANwyYAFh0dKz/siHwgvj4PTyV5nf91nCs8X8RIJiSq+jA?=
 =?us-ascii?Q?GCJuT+lhjRZgUOBWkMT0/7pOkEkaRD3wWak/+iEXVXBzdASSiPq2JCLMMRD9?=
 =?us-ascii?Q?rs0EScKkgMaM97FSqk+Zomq3e5DBr06ElS5aUUqOl3SgCu3r8omoeEux7VxG?=
 =?us-ascii?Q?mDJY33zhogNUK9qfBXL7ksUHUI/gI846b5DEn+NXzd5P1ASiT671TxgLVw1Y?=
 =?us-ascii?Q?/dsabgtb/zROi9XvLSQBRI20+UqzeeAMXssgjpODJPmet5JJqs4y8DEsYnyy?=
 =?us-ascii?Q?Pa0XxD+4VK7sVa1wz55Wd9dBzoOuKAaTyQoodOws?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769f187e-c791-4391-ced5-08dc8bbc959b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 15:22:05.9738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /qy5S/sdQlQfe40jZMNt7U9mARgdciXGD+MIcQXThihfLMfWhzNtIxV5Yh87ytH794H0aQUCzpXtSvXkPupDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7551
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 15:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200633

Hi All,
=20
QA for yocto-5.1_M1.rc2 is completed. This is the full report for this rele=
ase: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.=20
=20
Thanks,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, June 5, 2024 4:26 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.1_M1.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.1_M1.rc2) was completed on the
> autobuilder and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.1_M1.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7008
>=20
>     Build hash information:
>=20
>     bitbake: 23681775e5941e54ebead469addf708fca1e6beb
> meta-agl: f65060f370e8834de0229c6074c6e4326bdd04a6
> meta-arm: f5ebb36c59b6eb847f45713a1f9b08a88f9978e1
> meta-aws: 15bb71aff6bcdcbeeaa21a0e7ec915e0e90fae39
> meta-clang: ce7d354da7a498f90ba260c006d29a4d23e3b4f7
> meta-intel: 4f4e6d763cf2e7d04eaa8db65c0bd3e8c3b689a4
> meta-mingw: e4d377d5ddb62b265536bd33dbccfbb0904f8701
> meta-openembedded: 446560ab41de5e29ef5dfb556de1149e76a80367
> meta-virtualization: e96da98e4038f5388596b4294ac3d8425b2dacb2
> oecore: e068ba7d6b91237f9dabc2050c9473bed311690c
> poky: 5fc59beaec099cd4a78b38fb0686f377bbe7dadd
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

