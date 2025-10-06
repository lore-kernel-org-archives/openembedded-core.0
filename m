Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669EBCCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:25:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web10.33714.1759757103275866592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hHAM7jbE;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759757103; x=1791293103;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hSxVApACeSp89mhhAvi27d3gtn6DOLGo/uwxVq0euPw=;
  b=hHAM7jbEwKUvJwr5r0KM8V5iKCT7AdNY5AP7nqlnn7Dv0QnDT19YYeoU
   PnIPxkdm/R7IA520+GUryvrWVWFcvj/n8YrhYXPm8nbveC90Hf41G6hor
   JYOPOqUobUiufsSsnBssEBP7/NzetXJG1g2zywVT0eHHNKk3bVvibPG/j
   ZVwAdBOAUmpWi31jBTZGStpcUH2nyMkFrwFz2pqrcjHrtZ/o7YqxGVDpA
   /JKuLK/ygpv8+o90T66DvNJkOlpepcJfCQZYBAeufEJ3c2d2tTQ4cd1nz
   y/EWRUvFHUHukKLeJO8r4vEyi3Eo/kYnGWL3RrsklPgBvf+PWMiD3Y8dE
   g==;
X-CSE-ConnectionGUID: BusZOf+pQdiZi5epd9JTrw==
X-CSE-MsgGUID: 28vyrULqRL2BtE0BaL5qcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65759490"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65759490"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 06:25:02 -0700
X-CSE-ConnectionGUID: 6W1KXUHYTCKPF6z2INiKuA==
X-CSE-MsgGUID: Zw89E+jATQ+by4uWZHQmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="183903634"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 06:25:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:25:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:25:02 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:25:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM74qrR4HGVEuy02A1vOYsG2a99dUk1TZB+wJ7ZllY636nLR1wb/d2+lIrqbSlO4Ji9ULNgk7jLszf51MlIS8WwbOxbu0XGAWxr5krY+eA5Z3gMkwhqNKPwv6pWCBZBgUoN1YotWaizPxuD/fxIJ0v2nBJH1Xj6k/0hDiQeiHiZbBujLFAbsp8yU0+n3hguKMfPbdNwvFU/L6sujtTWjximN6voW2GzQ5lumPz/jnjStQD773eNL4vYSCIyA41Ujq5ZYxGa9je9MyQ4KsueE+rjPRduC1shnIlwlZrhGYIouGueiGsqAS+E/vgwm7KQvFP7oHa+Op+PJNbUNvgGixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1I8uPwCSnCm2OIWM+a2WnZOhLP93p1aeTmyQWya4Sk=;
 b=kp54Pt4JBnvWq7vga8UzrAJ0UKb+lqyj+1C1IS49WhQc5cXNwPY3pGbgFCLT0iy88swKYs6TysRrdGwZGDZJizGwnUq62csOCLBRVjfc2uESy9F8zGXSEVWzId3p3Ko+dy44uwMnJYGVN/hOUNyTVEbvWu+vkr/IQ+JCxFvM8omlLLpCNaycgiLa/nmrxfFw6XzuiRTDJoHPSY64EbGkplapbDuTvBTooVXVKr14lgFmtxNt0YD8C9CKW+7YjuxohVP7eRbSk/5ASuXK01DH5wvVeBffCQOnprwbdAFLcjGgFBmT1t9pOeeLsSBxj+v3QXPkRYEEv7ia16hO+ZX8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 13:24:54 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:24:54 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.4.rc1)
Thread-Index: AQHcLm0mzT4IV5h7e0mLGbLzDLOvZbS1KvRg
Date: Mon, 6 Oct 2025 13:24:54 +0000
Message-ID: <DM4PR11MB776015A95E171B6278566CF5A1E3A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010199830727cd-45a08af7-e323-4a81-99d2-eae1a97a1a6f-000000@us-west-2.amazonses.com>
In-Reply-To: <01010199830727cd-45a08af7-e323-4a81-99d2-eae1a97a1a6f-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM4PR11MB6237:EE_
x-ms-office365-filtering-correlation-id: 80be7f8d-3e71-4d1d-9676-08de04dbbced
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?HWWQyR5ULdXMhoY3n5rUb4Yy0IWfVxRwNtSpu/vGTjj7iAZuwK9YoDXDqHoT?=
 =?us-ascii?Q?nxqOCD5xtM1V3LwH/V1UVuCcBKye4kAdFiKlxCLV8ol5Go68pWLF5c+FGYt1?=
 =?us-ascii?Q?Ei8Jl8wTNeJ8XQM/mNBxxuOec9sgzpIAkHx8IrHb9skO5trVEBSjo/M+u6j1?=
 =?us-ascii?Q?JeX/55uoV9jid88Z8mYcKk55osAdJowFOY/JmBFFjfO4cztELq8zx+05btWX?=
 =?us-ascii?Q?QZC5zEqbhUNdYXvEhi8ZF1VX0drHQlaWIVvG3OPm5KRy/c4+AxCeIkgKvS/e?=
 =?us-ascii?Q?btbEFtkcJHF+CrD1ZVLU34sZ6nBleFg8DI4ml6CpuHKhpMszg76ZLvNv+LtV?=
 =?us-ascii?Q?uNKUjdS7aDGlVnzNJVeOlJGRnbb+JDREV2Ccw1JIK+igUw4XOeIRZ+CC7ttT?=
 =?us-ascii?Q?Cov/UUSIEGT3uO1FbPsTnDnZpbfpkUIhBmg80uZ+c9EnUOoOPuKqFkPiR/dG?=
 =?us-ascii?Q?Qex2W4lcpe03imffRJNRx5DM/WiFz/IXZ12GVzt1nU0LgGLpXVJSX3zraW01?=
 =?us-ascii?Q?wwhxEDmOzRVmh8mL673W3pOcH6imIrlESOdMXVy3zV7TQf3+4pYNNmW/utvm?=
 =?us-ascii?Q?Qvr3Ic23XqqSrhvmzOzmviIMTAaoB5TUWCk7tX48LtKruLWmC7+mMJLcu4RJ?=
 =?us-ascii?Q?Max/nVBZqIUw9fq7/tNnx3rnAW7g07OHiVXcmrDYMLwM+xl9CDYggwygH6kL?=
 =?us-ascii?Q?Pcq5atAp1qgq64gkAQ6c7a+3H9EyFygCDSseHGJwFFYP2V9peuFaGp+ZRBUa?=
 =?us-ascii?Q?ZXmgH7rIsqq8KX4qIyEgGDNHrCrnVnQ3gycnm8AoQQmd+/+I5zpi6m/VOpWA?=
 =?us-ascii?Q?qrvy3IP2PKje8QB+S5gQuFY/HSz8lF3NhTHnl/oGucCgJ2DoDqV4T2zdiGfP?=
 =?us-ascii?Q?zhii+L8zYBSuV/+v+j4m7/vwK5kYK94qoOu913gpedRl/1M3fFvvurdz2QGx?=
 =?us-ascii?Q?RfjeWowJcRudibjczuT7mWH6YH1VmK59BR8hTNJR5chlqlq3w5bMFGZzixm9?=
 =?us-ascii?Q?IoGueyV4tA6kQPFYE3AkV/71tUjNNO9yVRN+SqTLJzWfYeRjZA55PEjjrVOF?=
 =?us-ascii?Q?x5J0UPHLihquZWC/h8o6fhrlxpe4znm0Pkc1avDQPYjJ/J9FsUj2UOltwZX/?=
 =?us-ascii?Q?EhB59PqE7RmuZadXnq4JfT3KvfqJ2x0UcSD4INsvVvoJ68QIFcnbnOyHoQmj?=
 =?us-ascii?Q?OFR0RmVd7CjPkdeqeF93Hl48mqH9sQSbMYDLaDgtvjzrwKXtofTQRkNjN1Hb?=
 =?us-ascii?Q?qa64WYNqNpCOILkYp8pcyYsD5a33USBTAzYO0V9ByY4XTA8bueNbQpFUwPJn?=
 =?us-ascii?Q?Xn3mmiXNWu4RiObkVZvycU8sbckNRD+KhrfoJ5QMOHhpg/Ub5igrXQ1GVwhq?=
 =?us-ascii?Q?KKgeqk6zhWy99DwmtuSekW9hzN/TQ43xZK9mSJl+BQ/dN1IrH7+JV/G1uO6r?=
 =?us-ascii?Q?cVxv762XX/lnL2atZa9+k2orMkjtg4d6Rirnv/bb+HdjNLOSnB5BUA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7OOIvS06d7qKxWKAFM9CRRZHE/BuuKq8n2MxupCX3yS3PIvm9oeohlEkQOGW?=
 =?us-ascii?Q?QvaqKDCa2aM8qLAFpJuZARU5I/MCjwwCMbwt61b6C5UNVkavFMLS8dHdHUD7?=
 =?us-ascii?Q?nWlvzK6/2oXmKF1QoK+LHhRJSp2O/tRGTXLARZmyMQcxLVvsaBr2RY7VUYBP?=
 =?us-ascii?Q?5V9A7X21NRAjDMhZIiElmnMTwYhFu4SCdVfdx9UHrZTfcDdOhqoo5cNHSONi?=
 =?us-ascii?Q?WeulrxWNBvYwgj/uN7iJdAoN4r48Yq2SZ5szYg3ZQ3ZMCES3aZHtGRg9DE9R?=
 =?us-ascii?Q?C52xMG2lGXaNWV+CDsQSqvsYBA+JtX+AJwcjnr+Mbyn73mR5bgv1o9ZhBYCm?=
 =?us-ascii?Q?DVVEThz6sFScHFd56Cl0CLrl0OxURAeJyAuFEPZbauTrEoRSOTDD5h6WnB1j?=
 =?us-ascii?Q?2jiYoIVAH1gu8Nv+cRvO2ZwWTEgfShQYgNO4OyFnHJ1QWaRjtKExWgCAyh0w?=
 =?us-ascii?Q?21h69PcHBNXSoYWiB3FWxQljxp/6Rv4qqvVPI5tYhFsHtSDI+CoE8x8y+NEj?=
 =?us-ascii?Q?ABKC7xLAZQ1JKxaYZtA0QDJocyD0jCd29/WGscZ8kN921P996JskqSAfAbXv?=
 =?us-ascii?Q?1Eha9EpcAgIFLBAD8EnCVpIYM/ljbxkbZcxmm+cobJlqwNVrk2Ij++AP8iav?=
 =?us-ascii?Q?m6Pwk/U2HRm5Y773Y5IjzUfBJaqYyybCINoDwdpvKUb7bFqT0Swt17x0R2KK?=
 =?us-ascii?Q?Dhd4pyf3s4KsDcXPHDviRhzEzySzTIxWzbKmeHHOvgH1VsSWzxiKSaQ8mIJa?=
 =?us-ascii?Q?m9RJF0dM6+qtw1B3oEPUfzmru2npoMZBqaCHLg/xfi7nROtGWZ/0/YMg9H16?=
 =?us-ascii?Q?sNnaE2+igB/5rn9qPqaXLwrXSA5pDktK0rH7+aHXeyEHARLWgWwOVhhgyf7i?=
 =?us-ascii?Q?yHTIT5kgB0Vuk1ozDkOu1ZQl3EEVE+SghUeZMhedWDz8rviRnWiALVV5bPG8?=
 =?us-ascii?Q?ptR84eTboi7Rj0Je2Lan8eTiq22I6WQP8CPT7P2l6w5xfks7yRfBY0/niQQL?=
 =?us-ascii?Q?IsXyfOWkLdfYbYYP36kPw58afw3jKqp/u5NjUrD8ZpmpytjP96wnYo9qcGpa?=
 =?us-ascii?Q?4EK0OyAUwu0tQoNNJRz1rttjJme2Hcu43ztinQyiUmT/2eZgFyl0tPNuR2W5?=
 =?us-ascii?Q?j9mGm+S6J9xO/AS7EMvosuk4LIEwTpHlCNAIy0UQNOSz801BJe2Uo+5MKjq5?=
 =?us-ascii?Q?apzjT6crE4ziaF/WKHGH37t0FUn25Ar/kzh0xKc1dA5dNoewo7+nwVZymYNp?=
 =?us-ascii?Q?+08bxqG8NEOayqMY/YqHztFisJ7rumPOS9eurmXujnD9MXC8rIO8LRF28UgO?=
 =?us-ascii?Q?JVfRTVvhs5Loi7R4omLlXpsERy27zbuYJP82hT4S0J7ozgu+thQ/yNcnbyw7?=
 =?us-ascii?Q?/9kCZ4uAPos+5feNn6gsKDtHG8eDToGlDs0DBpmzIvcrweYraIF8DGFsj0X7?=
 =?us-ascii?Q?Rf4SYuyoiB0hRh+WMOM8DYKUS3a0K46ASfB4mbFFOvD26QM5jXXWRGLgEp+6?=
 =?us-ascii?Q?OOgm4EIsifRTBPnSroivDW3o4YX9jdJhwywzPYorBkaLniaCiwGz7DG32ul5?=
 =?us-ascii?Q?efzFzsJ52BLkh5XNFzsepyhOKMnSVnEcg8A2K68+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80be7f8d-3e71-4d1d-9676-08de04dbbced
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 13:24:54.4914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKN6CgNy24j/U/2CMm2cC6Vh47BQyAbe+o6xufhxo3FrLOA3T6kheC0CpoLtWOX2EsSSusERSe8+KUPeeY68ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224486

Hi All,


QA for yocto-5.2.4.rc1 is completed. This is the full report for this relea=
se: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20
=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.
=20
No new issue found.=20


Thanks,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Friday, September 26, 2025 6:38 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2.4.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2.4.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.4.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2442
>=20
>     Build hash information:
>=20
>     bitbake: ac097300921590ed6a814f2c3fa08a59f4ded92d
> meta-agl: cc6c5d45fc4b637c3efe4b8d1c7c76935607cea9
> meta-arm: 21894cc2ea3197e6bfc1a56d889f757a09dc8b31
> meta-aws: 69902e35f283195a87a3746f91177f0a361f6746
> meta-clang: 003cba92e982bdd565a6889f28799f8bba14957e
> meta-intel: a75e59bdba66fa6dcab8f2208e73fbf2fc576457
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 80ab58cc404959ae2f0e8b2e68935b3bfd8e8cfe
> meta-virtualization: 898239e810acbb7db93299f20deec8afe434f11b
> oecore: ff1c54df4e7b15df2e2c9fced59d9ad3e92ed565
> poky: d0b46a6624ec9c61c47270745dd0b2d5abbe6ac1
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
> View/Reply Online (#599): https://lists.yoctoproject.org/g/qa-build-
> notification/message/599
> Mute This Topic: https://lists.yoctoproject.org/mt/115439656/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


