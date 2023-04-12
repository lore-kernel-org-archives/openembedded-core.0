Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF79C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 06:49:26 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.36742.1681282163305449881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 23:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=WJxL9VMY;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681282163; x=1712818163;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YkrXOspqmpk7cJW0kNpXCjQTFuPaNQke9q4qSF0xwRU=;
  b=WJxL9VMYf+gM7bVbZUQs2qx1msLSr7vFMvdcOM9Ybij5DVWhVDscEdu9
   oRNgIWuIB8+7f+qIyBPPv5Gm7Kp9l/2eCBOlC7F2tMeq8+scp+WqXN8GK
   NpZr+MGlDU0GWMUoxaaJ80Mh/d0+XLHjGFu/6GeSnTAIEvO44DmTWZq9o
   cpHrg4QNlg5DoMQRfih5fABMEmsjbSbQUsgAysgkOsMS+3gok4P071710
   dTXV9gqUsQr1YBiQGVodp5ysAQSPdOXYeJpxRP9G4c1UFBnC0NUEwZG4d
   rfAkO4heqUSGJv+NMwyCDkEsr9ztriBZcDsb924ETddY0B+ZQM9ZUXkkt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="371669158"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="371669158"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 23:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682384475"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="682384475"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2023 23:49:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 23:49:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 23:49:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 11 Apr 2023 23:49:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTJI6l3AWqLkoliQwKY0nTNUAsnxQHoX3td8tJ/n03rTKkuFwwvr4LbVLhitEC18ef3CtoJXArfZvANBbZEBebr/ldSmeClfAk6YBzgyfzdK+ernd57gJGf/+2FBZDwT43Kg19iCb6/1/3ES8hGEUwqOfHkvGoOMww3AWfzbTnSMj57otxjor0+uQSWNj7YEn/+XqARr3P3qJSTfUVlG1abHUNxz3CO7J2WAF4gNUU5bNqm4C6okH1Dq01sC5sSyo3mg4Lh8ks2KqGqZHCCTiSH8eUp2TE9b0Bau7ZLlLAQUL1EMB5W4NffM1HtPsMOnLfW+x5YcHE91ttUv1F6tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bSvGmLwEy+IcRMQgTfk0fVbiAG3QZ17odLMZL5xWpQ=;
 b=LraxNGq59M0XTEARqcCEAc3uDBSn676obw7kxlrnyNbUCgTIJ2vBFFD39g7zmY1QDhN57t4O0lqBWDtvt5qdY/85CG0zJz1uNojNRInwMUkNn7HCCIXOSFHbddmDiQmN80olSXBk4Urat35+8U/URTZ9tGWYNYJzy+CEcilIwbPj7lE5VuCVLwy4gM8VZX7PiMiTur4/Ysb5eAVzKwu9C+aIqlhPsuLXtxZQWzsIzCPKkLKzv9CQJMwrwZpkyCZ1iGBzSwLvy08q9pcm8bUKKoMGcuJV4n14ljt+ks+dLKdMCyDu9iYK7uMEItBOfaYV+DGYVHX6dqTetHSjQx8OQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA2PR11MB4970.namprd11.prod.outlook.com (2603:10b6:806:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 06:49:20 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67%5]) with mapi id 15.20.6277.035; Wed, 12 Apr 2023
 06:49:20 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc2)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc2)
Thread-Index: AQHZaLP6h44AMbFFeUGWZJ+RW4Ih0a8nRBBQ
Date: Wed, 12 Apr 2023 06:49:20 +0000
Message-ID: <BY5PR11MB41525518709F3865733AB8C5A19B9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018757c8b227-79cf1abe-7919-4afa-9634-ca4415075597-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018757c8b227-79cf1abe-7919-4afa-9634-ca4415075597-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA2PR11MB4970:EE_
x-ms-office365-filtering-correlation-id: 1eafae8a-f094-4b0e-ce13-08db3b220b14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k7cbqiEzgpz4RgBjrRdRc1kSVBLN3fgWATyT4RdDb6EorU/XNszga6bs3FXj+qtsz8AZf/ZyLuFrTBIGyvtMPoZEDDJ2f9yrgxp3+HxrUMTpfqAJOKmDRCi2fCcKi3dVNU71uKifmNDKSeBZAsGF2KHF5fBfbHP4wJMmgEpl4a2/3UEx3kJyx6z+pMRNN/YzbWgnJ3zdVNyHSUAP7JJcB01tFDVMPmTIo4wAuf2RKvvTyAsR4k8ilDbpqz29Yxa2lXdLlWRbvCvnjDIvqNLfZP6TWfqtBdRD8EnfqJTYJ8bLmHnDUxJffuNpFQef/u8fjkYRy7UNv/gYvetPm6hOI57CIckUfu3118SwaxHBYzXaolKdHK0/j7DAdGOLbZb+chnCbSyTuqG9frcH3jGNNHOPwni9y5gUHI0MFFKFTYNu5fuC/78E5ppORmXlYA1pgY5+43UgrRyV98mPFmkezzXavG55HKHua0Qx+2S+bJJWILCNyZgQc3nOBsHvMNhG5EIpGsSE4N+eKYBejQvP2mUGvMsg0OMejZfI6eg23P8K80jPrD5ZIE1M2WkXSpB0/nmzGD1eqbBakRMB7ghSI0/BA+G88ZPH9eTAh9iyZfmSynS/MhKlvK2B0oc+pxZyZkrIc2oDJOkNE739eWgZ9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199021)(316002)(41300700001)(6506007)(53546011)(9686003)(26005)(122000001)(38100700002)(966005)(71200400001)(7696005)(38070700005)(86362001)(186003)(83380400001)(82960400001)(66446008)(66476007)(66556008)(64756008)(66946007)(110136005)(55016003)(33656002)(478600001)(76116006)(8676002)(8936002)(5660300002)(2906002)(15650500001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OIkAwD9DKJWBsYWMH0QhwIMi57a87iKmfmAPkHawl98kluOsiiHn5hFDwQ6U?=
 =?us-ascii?Q?5ivwxZHv0M0vMWBV72u5iWhIW0FDsNjHtYXTfS+FGSxwP/6ChNQdGtOGQvzm?=
 =?us-ascii?Q?4rLDkxwtyY7+w7RSXYanvTmFvE03BU4F8aSEQDN+aOWRNSTJfZ7oPMfQbrA/?=
 =?us-ascii?Q?14r3Vcpf1exHCgxbStzuQ0pJI7gfChtvIry9Z5SQWk8eQHXfHLjEynfoaG1R?=
 =?us-ascii?Q?jDhiORP97oT+3B7ysh6GxrQJXdPyv96w2aQXOJv4TE84pA3sWxBhGQ8lOeOz?=
 =?us-ascii?Q?9Agw8vuSDdLl85F4iTWPymgcYJa4A29EWAgORxPawmOBVZkwcSyIwYt47ZrF?=
 =?us-ascii?Q?H0cPnnSqp9oEaEh6oZO4dphRStpo/sAhyMw20L2V/qOHDdlpI7nGDXcmqq4w?=
 =?us-ascii?Q?n+z4bzfcECTJHH/4V/ffArrBNpEouUyjsPNBdeWsjmBtP9o7wrqo0zdKZDs5?=
 =?us-ascii?Q?ehLgaR006+fmbe+sxRBTP752OegJOniZjmO2v3vB7ZQagSO2FrQfv8u49rIH?=
 =?us-ascii?Q?xZYEJ5tBUpbWiJknPjLB46vffduUrqIilcXiJKbODranhS5si+Ah21Hd0RU6?=
 =?us-ascii?Q?RW84T6S8n9aTQKhiZ5C9BZ0N93DfOFVz805gIKjA7AOgnc1qQXhwtiVYwfZM?=
 =?us-ascii?Q?3HArVgQfdJcsobN7RDZiIpgLjJABzXQdM07ZyTxna7GcVjdOgsCQ1TpWlUM2?=
 =?us-ascii?Q?CzzodjoEL/tedsKmIcQmfa60hjo6HGqJUEb+3n6+wakj07xM3GuhIpLIuv6l?=
 =?us-ascii?Q?jD/61RMD0ICzZOz2XJ/4ldxvNbbky4U2A4Kf4WvwBhQeswpTGsrnbuoxLZFl?=
 =?us-ascii?Q?7DZfLoWQAZ0MyGp1HvtSsCASddHoqwziSZ7L9X3K3mkUCHcFhfcCEY8u8+B9?=
 =?us-ascii?Q?/9mfGF7NysZdGhOVtOP5l3SzBcBm8vEec3OFYZHyqoYREf6ySbWgCUYccb7+?=
 =?us-ascii?Q?S3WeDbvr1d/IJkvh5pGooE1ietQcJy74lEwWITuIQZgf5Oc3KycdvcytwyXs?=
 =?us-ascii?Q?XFr0yl7USkSLdLEnXgwnQMAVY6OhEBXbPvjrV4afDvmLV+96rQxknxUReRFY?=
 =?us-ascii?Q?e+YKg7LQGtLKPLEE4P+1B8YHpbALgFFNoGXoRDYH4vMqxP2f99ArXq3zigAx?=
 =?us-ascii?Q?tH15B6wa6EItvIYML0DQMUN4ulAx+2rcDj4PcBtCgTQ59jlLY9BQUnhtIvZi?=
 =?us-ascii?Q?gLLHl04bX0SwiOHodec4bE9v8mptM2OxYQMYXsgHjqqvSxAkSvVJWxjCOUqH?=
 =?us-ascii?Q?trwxOnTVu4rYF0Wmpm74wz7jQ7eb4DtNiVqCN07kZIoUnH+4jAu9xj7VjYle?=
 =?us-ascii?Q?1A03vExdGBw9ovJSDYfBqpIdBaR1MUVNkWkLvoIbcjJAYS/ebLv3ttiU4ouO?=
 =?us-ascii?Q?bsLPnZ3ByJ6khdD7Z4XJ1XrPXsj1J3kh0xUfnzFZc9AjUOhM7jMKf/87d9SN?=
 =?us-ascii?Q?ovzGIRL8cwXgPm7PN5Fi8rh/7OAqAz+wwDODXvkPE6E66ox+T/5jdE7kBA1t?=
 =?us-ascii?Q?7PHu6ThRSPhfxBBKRdeo2oBht3KsoYLX7t+qAa0JpnPoNDpNp/YQad6a5vfL?=
 =?us-ascii?Q?/JgN7mfr3YtxyWgsZwQu65eSPuoLcJK812cvDRQ8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eafae8a-f094-4b0e-ce13-08db3b220b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 06:49:20.3485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2s0xZMzwanB5YrZt/lEN1d1nCGI7ECXmoIvNp77Y+JDBxBkx76cObPJSxtYy6lt3DZBz6YeP3NFUgeWTHSvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4970
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 06:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179939

Hi All,
=20
QA for yocto-4.2.rc2 is completed. This is the full report for this release=
: =20
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
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Friday, April 7, 2023 2:16 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-4.2.rc2) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.rc2
>=20
>=20
>     Build hash information:
>=20
>     bitbake: ae2efb05196f9e29ef56ad9a84e2eae5fbdd8030
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: 8acd61c427bc13024df59cdf3d8217e6e2bd2ce4
> meta-aws: d243fc1ad45dde57b4caa182a92b685540475cb2
> meta-intel: ec3147abdd0727fedc707330d58593097357f944
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: 2e0a581bee7fc15a78f6e19ba1e596930edee414
> meta-virtualization: 48c07a48a0e7d56266f20a01bb0c8ebc1085453b
> oecore: 2bcb015b6fe72aa4c928741285c49d3d9ec55e85
> poky: 09bdad16f3a835eaa5b6158a2f8bfb180aa4cde0
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

