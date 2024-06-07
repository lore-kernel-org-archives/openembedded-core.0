Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273B7C27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:02:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web11.38194.1717754535724875022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kouV9sIY;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717754536; x=1749290536;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qLEYcN+rjCaAGT5czirt08d1p8JXBmdct5TX6+CCWmE=;
  b=kouV9sIYmoWzj8k3Eov1nRy8NWokAr0V9OAAaDH7RJwiVLw7eHcJl/JV
   Yb15eB5DoO9Srh+xz7zIhAYSM2usF8OrJuI+fQJSw17N4l/yU+o8FuveL
   bI4Dx8iUPOWa7PY+fBpiEVx2ky77qhVv1QZEHqzAAR0LwmqUBkN3/AD/r
   6AJogl/GY3waSLWA1LdYzTX27+g7Ipnv7N2EcU/ahZWUPA67+wsilkF2+
   0NcQ5v+zr+WB3uAR0dkm4iWpKcCeEAZ1HzExWth23XvpxygpJAYmfLe33
   w3gTWW2AZ+W5sVyW/1+L6jDNyR0BUwEZnc0cI8lTiMHRaYnrslqaQ/EiD
   A==;
X-CSE-ConnectionGUID: fEnGm6o6Roe2STp6o+YftQ==
X-CSE-MsgGUID: LdJRHs+uTcmSRNClod4N3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14350334"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14350334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 03:02:16 -0700
X-CSE-ConnectionGUID: IgeS/SMtRca3B92UU/pOfQ==
X-CSE-MsgGUID: 5XIOyMW/TpiHigKTPhMzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38401492"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 03:02:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 03:02:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 03:02:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 03:02:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2c6ctpdu7e7+k1GWpRahhvxNEIOlT1ngW/7PCYELYUbaHTqstTWP/JWTfKRlOvH4X+VY5JXGE6FU2JU7Fqr9Jx26FjvSQPr3nxQvvSITJzQKEYbmQ93CB1C4oaNKr+eusK3/QO+tOrj5gZuciFHK4BlQQCRsyGj+Uq7/3AXxSTZlN9Pf1md9QPKPhOwoy1yz8wWA/MP8ykAXXuTlmy2Yh7yj2OzwU9NrlRiWbkhg63F2Z7KhS76U3giZlC7jdSaX5aEJ5pwp3K7iqehhnDOCIkwOMIGtuwnrnSf1oI7ac1z2kqbHGf6wj8uG0SoIvmGXAnTKm8w7SUowJbW4niZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiXoTxQc/v84x2MTkdlp2RKvPI13Wav9sF/NsjzOr8Y=;
 b=AsevuZcPTbiog8mt+Atbl2kmTGTrgpvsvBlUxyKtL0xEWFfyJeCW6VXvWXZIyfDX0P7wYOZFPU/YgysxGdSQCIa4FCke+UqWuHlJtctThhoStruK1mrFljiXAMh5wc+3GOEdb1GyXvDjwoP0x0lDes01xbLpgzO4CTrn3tZcf5IB1r155yG8Ib4x/c14LnzV1rgvhGWF/aTwAW6kuZdWv/xvc6SQHmhl8/sPNYCsfOU1AK3ebi4F1+YChXUAxIqrIjYlr/gFJztb+/qtE/9eXTxZ6CPVsZOUA1b4Oe0OucLa2S7MtJVP910hH9AivvRxvT81QwcbprI5qun8LhKMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 10:02:11 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 10:02:11 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M1.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.1_M1.rc2)
Thread-Index: AQHatyIajZ+qAABiXEi9GZgB9f2Gc7G8FKJQ
Date: Fri, 7 Jun 2024 10:02:11 +0000
Message-ID: <IA1PR11MB7753AF0953590F19CD7C6053A1FB2@IA1PR11MB7753.namprd11.prod.outlook.com>
References: <0101018fe7819c42-92849e6f-1a80-409e-9100-713586c8ea4a-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fe7819c42-92849e6f-1a80-409e-9100-713586c8ea4a-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7753:EE_|IA0PR11MB7862:EE_
x-ms-office365-filtering-correlation-id: 6ee3ab73-8531-44c8-21c8-08dc86d8e684
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?IkhL4B3zrGZ2mtP3JUFlAtNZQoepL6aDonLAXFdh/PLfRq4d8FNwV7X8b+rC?=
 =?us-ascii?Q?Vk+vB9DNFlPeyFB5WsuwqB/5AT4EFDdkwdFi3lirixaNQ+6tq+g2pk6eTEVa?=
 =?us-ascii?Q?7txbLiS7ACzpTMCrhwxJgmHMPdt6zjcGLrXvBl02goC6BM89XZq8I4iLCw2T?=
 =?us-ascii?Q?aOmiUuHFXi9YaCK+E8j82lnprBRjbC0bhzQEPJM5Qo4tI8QwlVquKbLzIixU?=
 =?us-ascii?Q?PnUGdIyNx+7m12a7ujW9d8GWDCOBzkcLo+RP9Hr+L/40qBaoN4aiDnO7o5yR?=
 =?us-ascii?Q?deOzt/lIAGmKcpNIlr8qsh2VXQcY7w/lemuCx5ggg68MUBgku0k2Jm/7KT7L?=
 =?us-ascii?Q?9enAEcLre+xofb2ZUTlO1q20DCnA+ww6FpCHa+V8/dgdgu9i8u6PwgN1ILTW?=
 =?us-ascii?Q?L7rMcRyhZ1h21EKAIiMMAHKGuDoQxTLnxb2lEa2tza2dBTx/3XQuj9otG5Mn?=
 =?us-ascii?Q?1fdTi/te5O8eXYOTCPV8s/LqixYFXxD5a/8L2RSLYYaszu5VnKDOvHJ804fC?=
 =?us-ascii?Q?7unJ71RHU2Pi95MpVopg2EYgaqcIYINzIr6FppyjSy6DYwDQVvC4K1CcLiNN?=
 =?us-ascii?Q?GEJdGCshZwxrUM3r9Kfb+vreFofaKmdFgl45MAHp+EofzXuYCfYpjYpdAJGh?=
 =?us-ascii?Q?vMhGGA23b+3n5n74cwCWwjtoKC6T6eiT/GP8y2SfDZPddZB41zNBHR7O7hhU?=
 =?us-ascii?Q?RcgA12SGL5p2M820u0glAz7D8sHFlhn96LfmqLSVfSay4itxtzyOR3EEIE6r?=
 =?us-ascii?Q?H53PvXUbE3VgZRimvNgWd8xjC3VlB6Cee7csP/F+DIjn4ZFLlGZO22VGvmoH?=
 =?us-ascii?Q?Q+1zbA9j+d2DQLuoyt7JWv0Cvbx3lDXfrIQAQ5o40u6xVnuwKwsDbPUf37O5?=
 =?us-ascii?Q?rqJf8Pp2bKFWzse92bORr++yZlx54xakSxSHS8zarYurLxhM4Ca615fhXPe+?=
 =?us-ascii?Q?ye5/4ZWjNfgIU0bMbFgMiC/4dR4rTyk/02o92WzindbO3t//j4u1033ScTZI?=
 =?us-ascii?Q?Qbu6sC2jkSXyG/XXaXeM0o7vmoIbbsxmHis99HdmeZX/RupfY4Lr4CYwFrSH?=
 =?us-ascii?Q?5Ww3Ug5zpD3SN6Em17ZCb66c5p6kMvVTJGK7VYwU25YuLqHSWOTlRoz9WSMk?=
 =?us-ascii?Q?xjLSZjJU+gsgx2l13eYQBP7PwOyWQ1z+Hdmz7l4u1tq9CLsZxZi8JrFWv4lg?=
 =?us-ascii?Q?4j6ClWADrsMFSYa5vWxg3LEb6mpdO+Th7mwhNptClqN8UNlyN2vi9ulmPlB4?=
 =?us-ascii?Q?k1NNfvMdi02iNbjjlUQQXnBI9pGGZjHDIjh4bYFcihZQKqVM7qHNUUApkhBa?=
 =?us-ascii?Q?BMwVwMEJXZUdqHW5T71Q4Swb?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yNcFimKK0y31VnH8SPVDurp563UGP+Z2s2QQAzr73iMP+gmeQYBuXU/aIkZx?=
 =?us-ascii?Q?ghy+9dR3YQUeX/PjF/VYTx84o73t1KKeashkFSgfQhbncveu+AVS7+po74SQ?=
 =?us-ascii?Q?wsSuMVZ+4YF0PuF4U4gbNxdP7lxOnUw9OlJ491C9keA9R8cDmyb+7soqX2cQ?=
 =?us-ascii?Q?M8MsbKvdiJc3Zabooc3rVVMueoicyBnBvmqc4pMQbF4LKTgUqTOmFuvK9pbW?=
 =?us-ascii?Q?vClbbUkLPte3jMSgtTyl/4vJterqEEbhx57MhS7FKp0cagAjT0HOFSbQmqbe?=
 =?us-ascii?Q?fS/PS0E+kotAtjZUx3JMXl78squbI+9SfbpsGjwewBjBVl+y3bJi616HvE4U?=
 =?us-ascii?Q?DKHOBd/izrBeqdfCXn3LyoEOXEEYgA5Ff4VjdmQ5Trs4LEnxNJrDYI6F1QGB?=
 =?us-ascii?Q?FY+Xj7zzrrqXSRUJh/s1DU+PlY3lxdh8G4v1JXJrFu35RLHqdjbffB+1I5Fn?=
 =?us-ascii?Q?19wwS4gfimlROJzs/l+jSbseFKUJ0sawF7WVq8eSrWj7owvxFVew+aii09m7?=
 =?us-ascii?Q?9PsYjk0M5tgsHgDvipSYi2Rik2adEp7riH71U10+o/P+OcO9pvqYhQArD0K5?=
 =?us-ascii?Q?60kMvmvn1ecBshaENdU/ksq3BUoRDBKONz1fpStJrPyGLkq5gRoskYGdv2lY?=
 =?us-ascii?Q?9iUca/cr7k53xiaEtXRSUhec8i9xzmGM396oeCYZvz3NVE4dMWqKeCw8LNx0?=
 =?us-ascii?Q?Oqdn4Ri+dy/YhZ5NM6Rz5+NhMunVsEV000cx1X2f+Tx9YFBNHD6TvtpoR7C9?=
 =?us-ascii?Q?HnildJ+fIklCxXhLASZfajmG6egaKvppGyY/cw0KKL2aIGJ/z8zCkgknCyNJ?=
 =?us-ascii?Q?lM2Uhzqnt4nDQDa6XOXwdBKJMMNpbwBU76d6rk1nNt8/rOWZmZ40FHsc6OdU?=
 =?us-ascii?Q?U2nz+sFjJhviurk/WJsDBYNCYnNLIMAgj08JpBLcG5N46OiUKt90aM4MCXim?=
 =?us-ascii?Q?hRlcjWAPf8bliMTd2bXwkVc/nU8Za9Oi/NMpRAaViG0WvYyGeNWDQGrMDSDz?=
 =?us-ascii?Q?l6si6udIZlAIHsDZQEd9g3WQOCOB+4QEOEt3a54AoCH4Pvj9MmoZ6peKZhUq?=
 =?us-ascii?Q?f9BItHsC64vx2JVI3waKp0rydvdVreh1FCRtueu2B4buiEoeOCFA8buqD/Sp?=
 =?us-ascii?Q?JMt4ZfyehUje9H5sJDD4eaffd4p4EpExQxRLcHeRFbU5JUDhEZccQYXT+OIg?=
 =?us-ascii?Q?fBAurqWbSPrlAOgngr4XXt6QB+GXKRzvLEFzet8K6XjoG02GaAawjocsJr5K?=
 =?us-ascii?Q?n1Hahy8m665q30yhSA6xr+PZHvDOjgGzeJd6lbq7C1HPdHiK1j6R1YwRZQKr?=
 =?us-ascii?Q?RQRhtOzW3PDysIqTzV65SMP3N75zRGV4j7dMKMknKsnIiWGK+TBQjMuTVEu9?=
 =?us-ascii?Q?SSrHXaITVlroB+P/OoyRa9r4WAxBiZX26xtTsgB2j2U6LW5qOuuhaCZTKeCY?=
 =?us-ascii?Q?RXu4zWSXRxjwZG6/SqsnV92N7U+j8FR/OLfUfTJMq85LKyU4VBe5DcR4nt+3?=
 =?us-ascii?Q?uTGQZp2dGmPlmyFRrJQMgY4r2pGULFpP4mVV4tW29JQeWszpAUbvcAejBiLI?=
 =?us-ascii?Q?/FLk0Pqi4sOhOZbZtO/MoX9AZFIicmF3UP8aCCyE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee3ab73-8531-44c8-21c8-08dc86d8e684
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 10:02:11.8130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hi8L8swSl5dMDNl5ikeYIa5G1MjEdNi09jevRPzUwmNjW3moCz+KGVAkm3FEiS8ECai8zXNT5tXakiGc+9P5cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200427

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1_M1.r=
c2. We are planning to execute following tests for this cycle:
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
ETA for completion Thursday, 13 June 2024.
=20
Best regards,
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

