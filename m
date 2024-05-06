Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C635C10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 09:43:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web11.16556.1714988621479632166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 02:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ghG/QoSi;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714988622; x=1746524622;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QO4fuh48X2QjChA1l26HBcMTyShpRLr0504+hd5woCs=;
  b=ghG/QoSiVD6GD1R6Rjl/OvL+II7hcJqqZJ+ALYpWknSvBkWDiwa7MKDZ
   /HN2v822FHOwn1hOclC318Lu+Za+amXjfYWKTwte91/DOzn9Fi4Ybs7vn
   L517vts5EYCzF/CchOYMI5Onu3fiVBUssr+T5QiMCh2OQ0GcVa7GVAL+D
   tcgc/VPeeNIoTXFB6nLfbgQ2ZD05yIGuZyU+zRkZwmVj+GndhyhZt+6wv
   RAmiZwo3XWKYM+Ldgidc7wpAqjL9INkdaRHdWpVfSgkJtstkb8m0X2R65
   AyMbRzzePriy0v+SQoWBq+kI4WrnLa6sBp4JKFxMg5z2pcmh1zvEd2NG/
   g==;
X-CSE-ConnectionGUID: HbYpyYbCTrK4GMI0VgJLGA==
X-CSE-MsgGUID: BZf8WaWqQfWmBPucLqV3qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14541560"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="14541560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:43:41 -0700
X-CSE-ConnectionGUID: KoXj2lRXQ3yZkp+0JUhVkg==
X-CSE-MsgGUID: K1VnybjxTIiYwvEHQhafTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="51303251"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 02:43:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 02:43:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 02:43:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 02:43:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 02:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNcbmeSauf33eOygYBZpqDTm/dx6hEnpJmZX06ea7YYd8Ns6I45//Yfzd5E2b7eW9J4DqZTDSwidLssag5UOHmXgwGIA3xbggKHiafeF/AxpbK6GrhcHPRUwI2I/dpHpA5Q0QreFpwcn9sisb7kyc4xmJSfDfwGIXYeN7fUvPBWhd7vhc2RjA6ur6y20MuEIgBWJXq/hPuk2p7HJUAzXFdAnkrgu2fTXz//7XfU8gHGyo/+E3KGOQbspn9SkMQJBw7KejVorh15F2pdMW1+dgA0y1mli5Oufmp/82HngV2M1BXpnT/nIyreVnvbC+FlZxUfUS+HfqwnarPJNhFecRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOnU6YIo5mqY6Uxvv84wWsG+GtEU6ndikEy1KoMT2E4=;
 b=W15gHgIZntOlOle8Lme2FT3IopT++eYNd3pjn3ofvvwh68vb4K/nbL77oQup87i47LDniZCNNL0H08DdDkbQ9Gt/3yn/kF5DQKxPTlZx+9UjM0JIOcMzSdyc99Sk6WjNZlJLDNB0EnQFVoRVHeWiNbgDcijo0WfvNI+YkOGPfz/tfEiYaaYfn3KELqaF10TMqOb8+AW7QYF9iGs8mtX2FGTLcQUogGz2X4Gdn7cfW2fsx9kjEfUvlOk1uzWnVR9I5coifOMwdwpLTKln/2PmiMBnkfCMx+ThjAbbsNAAUNJw16kFBd1b8pV9dMpTqJqhNaUNfmr0+KkgzrMpB9iIuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 09:43:38 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 09:43:38 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.18.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.18.rc1)
Thread-Index: AQHalUOquyArFi+J7UyXn5Y0oMkSebGKCKFQ
Date: Mon, 6 May 2024 09:43:37 +0000
Message-ID: <DM4PR11MB7760AEB45C3B1CB6147380CBA11C2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018f098b350c-3212b9cb-2849-4dc2-9fc4-670ce7e4fd08-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018f098b350c-3212b9cb-2849-4dc2-9fc4-670ce7e4fd08-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA1PR11MB7343:EE_
x-ms-office365-filtering-correlation-id: 36b3e20d-6abd-4ac2-6d17-08dc6db1015f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?GaIzE3sVwEyk2jz58KZfUE5D0nZ5GUc+tMR7xSIDxBPNHku/YN+b161DL1Uh?=
 =?us-ascii?Q?ETFbudzFoG4YsU7G2LWjotejY54MxprBWabxFJNLY1MbsVd4QBQPnMxOzF9l?=
 =?us-ascii?Q?74WjgQJ0Uuoq79e3+2D2QU77SctjrhYA6OP8pXtxN696IAECGep49pb79oRJ?=
 =?us-ascii?Q?/XGSqqRfTcWb4Zc840K2bcqxDFolea6NGj4ZXlhyOEcSial8bvarntwUlWwq?=
 =?us-ascii?Q?LJ4b6xBpyk6F3SRRa1Vkhf+QA4nyGGwGEKjoISKb//BFXyUrbe2ScnlqSTWD?=
 =?us-ascii?Q?+rA1ff3YRALstg7n7Sq/FuloVmAzeLPFRA7oaQBaqqt1KsxcU9WSL0I6pnsm?=
 =?us-ascii?Q?ikh8qWo+/6CE53Mff0Pw11m+wPyKmMOWZa1PBkSyxak3CbJqiBxGZ2j2vFCd?=
 =?us-ascii?Q?EftAs6/6aN2wJnfw4FrxCJRFc7vLG5kAXTMnS1DRdee8AEf0J9xqMMlpGAXZ?=
 =?us-ascii?Q?D4BN1/PVVy9gsBb3YkV4B2q7FcA3feks9dVcXGv6bTZe6q1G2BDizIZ4J+48?=
 =?us-ascii?Q?7tAcA5W88DLPd+gJ3EYbK4qBUm8fdwgJ2kw3gllhT14Qa0wLVowYI8kTSBp+?=
 =?us-ascii?Q?/H0GvRsvBzXKALXpQStkhcKS5GyMbXCqNaZdMSQlOL2FGa9NQEN0GETKBz6w?=
 =?us-ascii?Q?Z4eQda1G+oVDPhCDWUf+8V1J2hdE34W1iMi/bAD8MUOsQhoZOCD0xtDu+xb3?=
 =?us-ascii?Q?1ZzEof4Wr37DuXFfuPmrV72RGd1/Mamr1Kp7ZZVNSkHfdknuNNl1MdMIcSuv?=
 =?us-ascii?Q?2d5Fv9dzAHo7xJ06tkzmvVug+bQq33LfpS1rrhy9YIZtP7V6up3Bb2Bcjnfg?=
 =?us-ascii?Q?3/L+x8raAwJIVvrfXwvTxWbLPYRwtJkcgyGHjVZm03Ow+YmuRHPisK8Pd3PJ?=
 =?us-ascii?Q?MFwFg2JOTFrNgSkikAhrFGQHzx+KtRIRrXhe7vZeUNNsg/nOKJvh3Slo3ooU?=
 =?us-ascii?Q?rMTiYRD0tKr44nnuEn5mVgWHf7G3lH0yfD8LCLBeXTNxKzPHLNjtvtW4gNv6?=
 =?us-ascii?Q?PiRLgTDD50Xz7OSowz7iq0UJMbqmc4cilc7K3vrtxP/sr7j+7PyE5uvTLpvX?=
 =?us-ascii?Q?ptF0z1Nv/B4Bo6Bta5z1hsfXQNwsINUgE8WZtOML1rGU2qWt4GIE7BsGcUVX?=
 =?us-ascii?Q?sdnY3mDltwSHaSUehNeyYbUZqRGaHdFNFhSsvsKLgXCxg1m+5qeWveRimhOY?=
 =?us-ascii?Q?Rc+C5D0ZrmVRtxmVMg0Rms9Jl8e+E4mEgky0NPASJiDruPeFJOwcYe57/Hlk?=
 =?us-ascii?Q?AFOA8mPgM4upFkADYsHx8rvWWx6/oWOBEY28tXqpLw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+jb6BeLbII5joqwo7r0gMZzQQTdYSae37gmv2QoQL1lSjZE+kcmrMECNFU1A?=
 =?us-ascii?Q?H9bg+Rasia/J+2XUpr3NPF3kDNQrNOu9vJe017qMHixkSZKwrN4Njxa5Zipq?=
 =?us-ascii?Q?+FxpQE04wVbg3FcF5tkrKbFGZRqzJFUTmWhbPUD/p4E6pyBC75sU22HoUt33?=
 =?us-ascii?Q?9rIFMtAcdUJLZZcjEEEksWCMlUbZDPXA7WwB3jPFUibtPPeAPEc1Y3VEy5gw?=
 =?us-ascii?Q?aqlU9lEaM0N8fPCBYNlWv0MtnT5BAfhwxDrkZ3HmNFZQnT8e2H8hgEGFbYs8?=
 =?us-ascii?Q?ElGInhthAULflI3eRImuivI+2UC8ut9Z86jicgqNnlMaP+LyG737DMj9rhw4?=
 =?us-ascii?Q?cev9xpV7QEJ/akTa+Xy8FwJRL+EfG98VFL/fQb6J3Bt4H3AYWt95nHJOrc4J?=
 =?us-ascii?Q?HPGhlz1zYRhS+DKwGZNk++KKVVYliEi/p3b8U5+deFXpJ1NQsTRA3qSygA/x?=
 =?us-ascii?Q?FLjXsK+Eec27M0DuFv5SNoKuNmqHOvSPxTrQDaLUJqQVKk1HTt21xq3n+2ph?=
 =?us-ascii?Q?NpF/PlCtjTNrwJzYfAf7crd2oIy17AnM01MhG64+WrTOSGCcVEzWzT8Yic2N?=
 =?us-ascii?Q?mtyC1GJDE7Z7YNTPbzV7ClZ3RIFfTvx3r2ZhNw2RxD4357QlSBMLB7lsdzJo?=
 =?us-ascii?Q?8cDuttC79LDMcBakj30DNUO/wDTjNksFQPqRFZLTmbIQ1ZPeE6GZ1DLcnaQz?=
 =?us-ascii?Q?XdgBRSl8LhJhrB8CvTW9eYFq9eft6atavjp985gtv2BWOflUSz4h813atfsb?=
 =?us-ascii?Q?kMkOIP6V09ekqE0UuE4uyN/xNN2mNc5JlnAlm1qLN62ovamsqjy1yzalqrYC?=
 =?us-ascii?Q?k72bdlEDQvSzwToV/Ikj9pa7XWBIMNmh11xRmDaDoRNlkchjuxsPfDXpOIdc?=
 =?us-ascii?Q?ks5SkrAjR4hmfA1QHtkrDUPFOC55+2xkl2FgImFylFf8z68KoyaHyTHJZiJ9?=
 =?us-ascii?Q?GAqv/FvxDz7I3+Tjh6h5wS6lzHAU31xsPpGMq2TpMEZ8DQYrog2zdALBHxWn?=
 =?us-ascii?Q?fDbwnypyytGYuf24ObBvYJthKFbtrTS7aMuKakEktFoeqfYqJx4T9PICtiUF?=
 =?us-ascii?Q?XLvgnhkED+u3B6IKx5xsKQkhy5uWQmiFdymGizkWvwX4IWrdq+wCCfJp6n1k?=
 =?us-ascii?Q?zJW0x59LSZKqWGH6K+4qcMa6nEbWemNWBXtfCwPkrQ9iU/cyv+i2dfuhl9SH?=
 =?us-ascii?Q?CxfGuspEV4S95UTxZ61aYU2yIJHkAYwNXvfiydSVJKHUQEcPO41jPbCeH2G3?=
 =?us-ascii?Q?bLkmwe30xBknvSuoOS5Xw8oM74w1NM+DpzpG1Ozavg0YfdB5z6i09n7ySrhn?=
 =?us-ascii?Q?Pvsvo7qvjUiXYjN25aRMcN8aJpEH2FZ6VvktlTIr1uz1DpG0PGN3IXEXoVZo?=
 =?us-ascii?Q?XyBQIc3EBXAKIxf0RwMcHK65pjd7XfKdo/obKr4APZZ3rvk9P3GgNY4PXWu1?=
 =?us-ascii?Q?rJMRp2//pqFJGtUVOoCCSCpfdY0gAtslOtH9oza3bFmdiiFsXEueLyp9utyT?=
 =?us-ascii?Q?SDZAnxWvYbu118+uokfMlsTH9lPmg1Jh3bhJAaF+ffsF+3X5cYRkjEXwa6QY?=
 =?us-ascii?Q?ORNhBquLEBLMkKMkh2Tlv+u4FDKOu/bQMYKah9vg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b3e20d-6abd-4ac2-6d17-08dc6db1015f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 09:43:37.9421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRRF8RXGhXvPZYlA2gijUChKPSMB+2Y9fG87g0b3KWT8adUzPp0DUgY7NHB4GLhKYWvkiCUa+IJDnlprtwrYiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7343
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 09:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199037

Hi All,=20


QA for yocto-4.0.18.rc1 is completed. This is the full report for this rele=
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
> Sent: Tuesday, April 23, 2024 2:01 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.18.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.18.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.18.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6839
>=20
> Build hash information:
>=20
> bitbake: 40fd5f4eef7460ca67f32cfce8e229e67e1ff607
> meta-agl: 735f7aaf747129b0475bbb9d28404972ef2bb498
> meta-arm: d7b7b6fb6c7c5545e718e44f38853d1718ce5446
> meta-aws: fbf3b9a72b9178c305b4f73e5870f99d544c8051
> meta-clang: 989ff6a4e7db59f01d511727135610006124ead2
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: c1eb7440d499ce1516f5f39c9684737072b15321
> meta-mingw: f6b38ce3c90e1600d41c2ebb41e152936a0357d7
> meta-openembedded: 8bb16533532b6abc2eded7d9961ab2a108fd7a5b
> meta-virtualization: cb2bc17e96552cdfc141d27bd9f4dbd95a872846
> oecore: b7182571242dc4e23e5250a449d90348e62a6abc
> poky: 31751bba1c789f15f574773a659b8017d7bcf440
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
> View/Reply Online (#423): https://lists.yoctoproject.org/g/qa-build-
> notification/message/423
> Mute This Topic: https://lists.yoctoproject.org/mt/105685313/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


