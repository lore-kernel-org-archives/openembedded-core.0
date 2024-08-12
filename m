Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CDFC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 02:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web11.37238.1723428267418706258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 19:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=jbTWxpWl;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723428267; x=1754964267;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gaQTJRxkfLdDoFnYhlkuQAeiTXxieT9ZHrUIkuuPhRo=;
  b=jbTWxpWlTH/e9WiHHJc6MEfD77qg0WReRl972ywvfdxcfp4VK1N68VyD
   mxyuNpWZQD+uHY3ygvG3wKz9NGGElzckA5jJM+f6uP/WtIIyuySqL/u07
   D4wAO5yNw4gvPAHHjbj9C5WzLM8jxFYgTgqz9XDJTVNIXy/A322N5B8b/
   Ngi5X7q/MIO9PODA5x0Aai09BJhvs9feB7LwFf3N1LxLvJuVg61CPWieA
   DE+MwA5Tlt84MkOblnxG4XkeUambFGcF7bJR1EGmnikKLEHXFUSL/kzDy
   PPvrYSdhwD7I2e8bvJNoF7uWvIF40edQROmKOkfd46LQVTfBI9vvsSaFk
   w==;
X-CSE-ConnectionGUID: +jzD0OwpTa+q+lpGYoMvUA==
X-CSE-MsgGUID: ewI4ZIpPTZu3mm3p5LaEvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="25289647"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="25289647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 19:04:26 -0700
X-CSE-ConnectionGUID: +NMs4wkNR9OFH2IHiRmDBg==
X-CSE-MsgGUID: L2uYzlxSTc2GfpAaZoA6+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58014647"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Aug 2024 19:04:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 19:04:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 19:04:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 19:04:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 19:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hr3ish//D2r5rUgNjhlK+v5AL4SVx5ZjItLnU+JLFRYrPNR5TOgVZrZ9c81A9oYHoeHUCVBNaKwKcNonqKh5lG62PUuzbJOWW+vJSiuYxxYQDj/U2O1uU0up0z7ZC6cpfOTWso6cmZvSRERVEsyXukiImKsZLQ7u/eOKCrAWM9eeLGUipt7kzxak5CP+Qpie0Jx7VACspZdIo40WxuO9xYkhPAhuWHMW9OxvTHCv4q1G3Oe8ZAJF0/YvvOuF53AQqmOZ4ML74qNYxBQIJhlf/tSTGevEIrAJlTJqIp1WGShRf+ZAsKQqUxZOCoErNE9wXkjflHqBQG7G2zguPj2g+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hiHq+1sfKaOIPKKc/Efx8T0ndCFHAoyrR+qYXoWLW0=;
 b=APkE/UmeympWaAG5o/HSia+AwZlHtIg+Az2fMwaTme65bzEboCo4al/QDYlesFUBx3zIdp5Tde+Qw//fFCAVS/Jxs/hcxSlRRFRa+BaX+3C5RWd4SF+2t66DEoKGzl+gewF72VKBdiTk2CSBapOEt7CRoeh+lU07fkHZuuKyvo/mYObJX1z3IqMkfbsNah7JkXEwFWUa7WpRi8R4BlxMITzv4z68RXlpcTTXOZ3/Sya/4NjwIcMwRGDwMBsOHdwJa+5SbH07PWPrNhChzfIwN7fBwBEOM2qKRmQp0/CjPWrC992e1DqfrpDuHRXcOV3XNOH+ouMmQP9QSoM3Lbm+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ0PR11MB4973.namprd11.prod.outlook.com (2603:10b6:a03:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 02:04:23 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 02:04:23 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"pokybuild@yoctoproject.org" <pokybuild@yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.3.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.3.rc1)
Thread-Index: AQHa62M9WTkfVU5VZUuI09QzcRCJo7Ii4Jxg
Date: Mon, 12 Aug 2024 02:04:23 +0000
Message-ID: <DM4PR11MB776088492B358F78AC5A2565A1852@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101913df63521-cd4206a2-d62e-4e3d-b569-433d8de9d111-000000@us-west-2.amazonses.com>
In-Reply-To: <010101913df63521-cd4206a2-d62e-4e3d-b569-433d8de9d111-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ0PR11MB4973:EE_
x-ms-office365-filtering-correlation-id: 8d8c9b37-0331-4bc1-6c14-08dcba731605
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?F+0Cuva/F1wq4qIG0p/Wpk2HqHf2FSQwj+4gzROpgFSp5LtYxJebjNIOeeVA?=
 =?us-ascii?Q?N/ZTtoqPxAikeu5wFg/gxjqPB//3mz/6jPBMGW8SET9gdWdf80xYezhBNY4d?=
 =?us-ascii?Q?flnD3shQG/C4YZGhit+UadZ/DztvGXNNyi19xkL1MRd1MFmBc18hhqxuYpow?=
 =?us-ascii?Q?/kK5w+hKUsvmYHrTnAKPZ7oJEcAQ90fuq3dVo3g/1heX/sJmh7eUBb/ZvSxD?=
 =?us-ascii?Q?UogjbIonX6MCBeCslP/UoSXGigtNxs7rLvPjofB4gQhfh4LQhWLlNVHSqFxM?=
 =?us-ascii?Q?posGgNXUQpBocsiTFjhayjW2a7dvVnc5BK2ZNErBP2BUWiDEHAo7gvJxQydy?=
 =?us-ascii?Q?T0gqrJ/lhDGF0moVWMA3mHg+nTIC4+2gB0HcjulH5QsxuMamlbgc2o2gGrMr?=
 =?us-ascii?Q?FSZhHKkBrLyxtnH4wTBy5SmXucNRNpMbWrqpO/1uB1IQS6Q2Z1aXDU79Mvsc?=
 =?us-ascii?Q?AiiAcy8zfheqjC+3paADg93ieugyVHWeT7OARqehVA18XEY8bgITUUCiJ/h3?=
 =?us-ascii?Q?dXAzawBLt99VxSxUaScDUFoOC/5OQ/ma0vHXPpa4KYpMd97M6W4SdkolKdgm?=
 =?us-ascii?Q?RgPdcu41HVb9C3CasCPZn9ll1saMA+mYKjDUiZehaadd+1/sC8kUIc9G9DXt?=
 =?us-ascii?Q?GSsRKzqhG6X95mmPlT0nrpxhshoG3WjUed0TUVtRKxXKtXlkiSQWPOETiKFx?=
 =?us-ascii?Q?++xu7NCocp2bdd6gsb6UiM9rBYLTopiKhzVAzoAACpMkIQ4upInnMxG/k5n7?=
 =?us-ascii?Q?/XINoDiDOTIHU0CVz8lmafafgyDfyTaEBeamUjNi2oNI1oeKHzTnKWiolNd3?=
 =?us-ascii?Q?kKEwVPVbG8mTkYt3Y9vIjHW8BkrI6rNeiS2KH9HMfu+5cj+OR/pj3f4Zm7A2?=
 =?us-ascii?Q?GI+BA6oQsYBFw5g5Cb2nIshLoK6pSLytslBM0bYjNRkEOjKCl0OmPQx/4e/M?=
 =?us-ascii?Q?rC9VAqhqGZDGVFYOEl1HyvYhPFi7yvtPSOrdtPhjvpPHhSW5Tm5rOlO4f3wp?=
 =?us-ascii?Q?eFqsZ1p2ALuoixSdmjHkIknI6N+jKvsatqiZrWvFzuBdOHpgE7e4jvHX8QBD?=
 =?us-ascii?Q?bnrO/RnMjLGROhycbw8iWQuDDjeq1Nr8Hi37GNq+HSkfnfmuCKK8gUcPpBh/?=
 =?us-ascii?Q?E4aPZUswtvIquot4vR6yQWhlmRa4WrKHWhXcptdW6JGrSyn946OrSwKUHz6m?=
 =?us-ascii?Q?8wdCCHSh67NRztcTc0mvG9YRHTht+Mm9KKkeoaDg28qiu2NW/x56XQcvpDEY?=
 =?us-ascii?Q?TDDCXPQiUxSSfNunXOlQfK9bRyo6Tt7xkbZKcb5R2rB2eH87PItYlZZZjzVq?=
 =?us-ascii?Q?x1vYnkwM8U8tNrZ7jd9/YWzG3YVbF4s3w3p/O0dQfMjYGcdLX6H9Ulj/6HnI?=
 =?us-ascii?Q?cI7siZc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iieyQ+YXgXEJMgs3nsCdQ9ZXiY54J0PfROYwO68eGajjOs+m1xx9X9Wsec0d?=
 =?us-ascii?Q?gDTrWuP1ux0xgaAAa/x1GXjwWH11zwVznR0QlcG8VI5tY6t1np6I7yONndki?=
 =?us-ascii?Q?MlRDZiH6VJDK6wsVjJHSzz747xxciLRJkhWTk3dKJRWJPn9N2GU5wQPXQR4B?=
 =?us-ascii?Q?BPB3keW1TpyiIqaL97P4E4uKBftLIyVWZuv/5vpxNGivI+A9bjZmluimSmBJ?=
 =?us-ascii?Q?3MAzq7XYKMIadoRQlJnpy2tJ2uyFu5CaciQOFD3ypKgnjTVAKlq98hVxEt8J?=
 =?us-ascii?Q?xlJ7+O+nRiJKhUra0ROQZegKygnSqaGl5ZDr/mcUF8P5CvRj7AKmOzPZzCKg?=
 =?us-ascii?Q?jLpFAoaskTyoZaQ+3M8Gdf9xBz4YVyEPTL9y9ZcK7krLuxKKYzX8O+R6R9nI?=
 =?us-ascii?Q?nIADyaBZdqY/Nv9lxFXSwh0F9i5SqgtyuhMw1MlFnzewJD2mDpsc1jagelsm?=
 =?us-ascii?Q?Ks+lnNPsID5U5WfIcsAGs1SYak8jitX4G+L4qfXJrNaSD4ylqWgVh0WTl/B5?=
 =?us-ascii?Q?ocFkKXNLJcG978AJh1akRr0/xSj4w7fFy/EIXz3UxelY7SBBcp/D3lmiAbeF?=
 =?us-ascii?Q?9u4sbz/RkNlhNAEmcWxCDIycAJv6dTnW7FjsgIEB7TpgvyXLgkdST1QoHn6x?=
 =?us-ascii?Q?IdXyiZHG9DqoQ8oc7+UrNkXJYkoMtZVHvlOKc4ZaLI/BZHf8DaY8WmZcfBel?=
 =?us-ascii?Q?OOGXLqo9siQ88iT4fVHTZbrAkPyyTuCGvhZnoVeCZ/VVE5AHW2/3I4aHtBXw?=
 =?us-ascii?Q?giUt04WR1J2am//caP/HG5K7A8ioHY0DPBEWdcyMbTv36ENTEP1sthUPtnPY?=
 =?us-ascii?Q?q/ID+gJJ+B9gLCBKgLlJE2YgZeObK+ctbXmp4xAuByS7EH/7iLmfDCwWypvL?=
 =?us-ascii?Q?ze6G8Fw0UFYkzeZaG15J+K7sqBQiDYR+m6UqyJCP1Xis5zmsaj8zkMcwSjj4?=
 =?us-ascii?Q?E4P6E7qD2hSNcYkEz138+xYkVJyh5sGqG1cP0j57G6iuYR1ybtfb5cmIOlGx?=
 =?us-ascii?Q?ENa5m+IeJS+ZiwpLY+cGHlPloGJITcJ6xwaj2/HSzC7SY429yop2m5Vvqift?=
 =?us-ascii?Q?AbQtZNI33VXPMx+L7Ay/kSLoHmgmKB5G/dV6SrFKk7x8ESgNCxZxyzNJl8z9?=
 =?us-ascii?Q?i5e3HvaD5NjxDXpBrt1bKKGEfERlebCKSlaiAPXCTbDPPs7nq0UOnudEhy4M?=
 =?us-ascii?Q?aMnDqf16bN1Aj5uYFrlmPiteLT7vyEA2GZ8CR4ReFO/A7LMZ0JJQel9Eg0bF?=
 =?us-ascii?Q?QQ+dqULUptkL+3JcmlQ/gzyJAPnA2QuNHR4dKyOtGeZNWm9PXQNXu0o543BT?=
 =?us-ascii?Q?rY3v/9u4Y6LzTCqS8RsJMRCaH8JZH6hjb8O7YRgUoueGRCQJ5p/3AsMldTFM?=
 =?us-ascii?Q?MQSPOxITRiLNsgrNfLHTrNuJWhmR/V7b+L6fnFvRt4drh6RAu9T3OovlvB9a?=
 =?us-ascii?Q?hnSV0BmeRjypOoXrcR5c6OuuWP18y+Bkl9+GAddEam+glzDVdbQr3KT405wC?=
 =?us-ascii?Q?JEe1kopcqNYopjTTMUemiRuWaoqpbqTK2muYAkCFkVseho1MgoRGt9bYWGN0?=
 =?us-ascii?Q?RGtmAmurSBWTxqCq+kaxXcxROFPn/l87xBnJw6cy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8c9b37-0331-4bc1-6c14-08dcba731605
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 02:04:23.3108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVMs8WhrvrLoEQAAN8qfXyX87ulBkuXHUSUCMDcsTKiqJY2op9KjBZC5KFGlH/dpWHLEOjqfDb2/OW2JqEiE9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4973
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 02:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203193

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.3.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion Thursday, 15 Aug 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Sunday, August 11, 2024 4:24 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 5.0.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.3.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7230
>=20
>     Build hash information:
>=20
>     bitbake: 11d83170922a2c6b9db1f6e8c23e533526984b2c
> meta-agl: 2505bfc2876271663216a95e87cf01cab6585019
> meta-arm: 38bce82e42ea093333a53c4a10e51d1b26cbc989
> meta-aws: b5eedbddb3f75f04d49ca7851d9569f5147e5e3e
> meta-clang: fe561f41aef0cff9e6f96730ab59f28dca2eb682
> meta-intel: d172a00f487a8ea4391b96e0f6cef5279c5a07d7
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 2338409efc51cf2022ff5610a9fb689251706e2b
> meta-virtualization: 54b806b1985f3989722ee308e1073530fe3328c1
> oecore: 236ac1b43308df722a78d3aa20aef065dfae5b2b
> poky: 0b37512fb4b231cc106768e2a7328431009b3b70
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

