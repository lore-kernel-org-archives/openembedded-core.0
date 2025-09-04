Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3070FCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:25:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by mx.groups.io with SMTP id smtpd.web11.1071.1756999541874677836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QjeQmHV/;
 spf=pass (domain: intel.com, ip: 198.175.65.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756999542; x=1788535542;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=kH22CnipInFHutBqsfdowwuVsu8PUdOOQbeJaeZJzlo=;
  b=QjeQmHV/IS/XZKnWWRZpdxf+nI6bElZZ208gVhiVoWQR466yC+G9P/1f
   yF3gNlA6CK9ub082A5mRK4bgdyBhFrF8Tbogo1F2T172CsqqRaQsPcgNs
   bH01/DeS8C3sx5xi0XAOhJyNMfcHj2Sdb6DOJKLC2KVoH1alWy4Is9qP4
   GzjtISfz1LdrlhFV2hI4VKMs8Iyj0nYC1jG31WxfrQ7knC3pHcCmElUko
   Yt0qj98CqTYDPVem3m+vaDBoe7DjaJNEJtImZqDdAwcXsZPTp1V0zHa7J
   ENG0VDNar/veZM2bTX5tfT/mePoeHZt03jOFZb+YDOzr75XMgpPyxjigG
   Q==;
X-CSE-ConnectionGUID: CNnsYCcJQ92COuEL8O+xhQ==
X-CSE-MsgGUID: zV022kZOQMu/DgS6TWH3gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="62982750"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="62982750"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:25:42 -0700
X-CSE-ConnectionGUID: ZAurjw1eQGu4OQGKnTdUiA==
X-CSE-MsgGUID: O5FRs8TxSJ6m/Mnz2nTAJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="171474939"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 08:25:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 08:25:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 08:25:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.78)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 08:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aq5b0ipTNiWWEB4fISiDZGLNQlReCoUguturFAscB/qNznzYSlqIUUxnnmsNn0pHt25TWUXdQ/Os6IZ408QNXd2r/+ek0i5o2THh/FWxg4Z6q9B6bGht41vXge5oayxOFpvc/rSBz3H187FuxH4PdNJVgNfXJevWgZEVwVSXW7RLZD1FCxjVcyyAv3sg9aBqpy4HEycnbshxnu6p2OJfbLjDZQTl8NkBWa/yGbM04i7OqgQodefvliLro+Lpd8mBJB+BrUBrGp+r1cXx/2RHuk+zfE1zXvBaXSRlJE0OtdAutR7FZvJ0eyA/bU4SIDJY2ChN/2e6Os6O+ZH1NY27NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUA5ZaMi32YXbDnA5/JjEnk3D7Smaf+U2zenJ/nSOfM=;
 b=R0Mom0729f1Zkcqb2y2w1x+GGgsuJBY9kstqHizZ158eeGG/mHyQyKn7BROlvuEvwBeUu7AM/tZ5xtmew07exh7/uP16eiXMlIPiRrOG0B2un/8zs8eBXYiQZG1oaAXkgGBbqtgFJaJESo/bjINZC/LC8uVxcjFGbL5TgCSqeXm1RrDfc8AaGocSEGNLqB7cE3dUoNDi72chFSItmiQnWARyb0yZMikHRTNtctCB2C6oDOtqm3KrtqwBm5s3WCb0eauZIwd5gVmbwBJlNCO41H1Xc9ZEFnZdd90ci1s6hOJCg7QL8SXSqZ0lMY0oQY4SA9jRJ4KZuZiYAQx0kUgy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 15:25:37 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 15:25:37 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.12.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.12.rc1)
Thread-Index: AQHcE4TiKXYqaHQUjEmO0YVOu/9Di7SDOP1Q
Date: Thu, 4 Sep 2025 15:25:37 +0000
Message-ID: <DM4PR11MB776035F6D7ADF6BA97DF47A0A100A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010198d2b032d4-b6a1e13b-b204-4fee-bded-d398501a60f5-000000@us-west-2.amazonses.com>
In-Reply-To: <01010198d2b032d4-b6a1e13b-b204-4fee-bded-d398501a60f5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH8PR11MB6659:EE_
x-ms-office365-filtering-correlation-id: edafff5d-9494-4b78-57de-08ddebc74c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?NeJJ1gqo/3woyRrLMz55w+9y7fBo+F5/TtVYaXCAIZZHSJ/KovHmTX7PmFOn?=
 =?us-ascii?Q?Ht29Zo23ZThZMqLZXRR8nlmSVGfKdMbzOBwqDZxhvyUwZIJYndmxCcn7EXuj?=
 =?us-ascii?Q?QYsz5jM15jlKgaK9u3rwbSjwMRlj6tAbqgCSV+71BTlbmd3R4tKIKvEaG0hh?=
 =?us-ascii?Q?zxiyLVzSojI2QZaW9PNXqUAaFCUDPR3DUa33l1m4A7rOiUYYfgwAulzpJwmH?=
 =?us-ascii?Q?N8byAn1nbweZkChjoGUHdUCXA0/5fUcHPtqRmLPZflrU+4razZuq+ptz70G0?=
 =?us-ascii?Q?y5OyD4SN6+g4gHBuCfv/R1qJ+3zLHjNrdE3Z1YXEtGiUoYWDzd7kKNTiEoJC?=
 =?us-ascii?Q?iyHL6glj35nr82XtuuJ+Svl3MgPSz1f+UH4EUxJJ+XgOzlfZm5/INuQEehQd?=
 =?us-ascii?Q?Wr1gm1HFbs1Q5vZEZsPEXazRGTqWkxaisPRRsK+DEsR58q+BcngsECs21din?=
 =?us-ascii?Q?DnJZUnOvEfEzA99DYXi3eXlnnvREvMjr9k8KMctvCFsxM6ok6LMz7AYDYo3N?=
 =?us-ascii?Q?GruSI0NEbGG/vBnbRb7a6Z7BdeXRK1/fjeSHjXXfZSj/NfUT9Dn+S75svRPW?=
 =?us-ascii?Q?1CJ7FUb8kOyVIIBl9tYnoG0b1bH2y64LRHe3WiO07IFDCN4Z2ABdL6CSXp1G?=
 =?us-ascii?Q?lAZi6Tm/4Sg5hUqmnm7Oy/l20Ms8YI5ZbnxVrv7DzrIE/m0lW/s98Eeb1Ext?=
 =?us-ascii?Q?ZVE/rlS4KcZUir1CGQmiSK+1g0ZW0+ghzBz+gYJmcmGPgBHgeaiUKMJlA3mU?=
 =?us-ascii?Q?jbeqnynOSPGT1O2RY0w8ErQkt22u+kivAXn6E2QdHM6JamsJ/su1hr1rcqhY?=
 =?us-ascii?Q?UTWi+KKcYbQAJY0C3ehvFVWg83vaTXrWE+mSoVCRflI5/gLCdVE00o2wyuMi?=
 =?us-ascii?Q?YdIavYj0egSPFmJE7uLbno/9QqiLAfbvaaTTdlZXMFEnNZf4ZVqbIZmGBSsp?=
 =?us-ascii?Q?4XaciUhrOM/Rjlpq9fOX4F32zRmt1wuUmJsxe/Pgl6hH+ZGIrnh6/o+r5w1B?=
 =?us-ascii?Q?hFsqFtP26cEWRA/uPM6hsEqIyciPW84YKDl0AtlkMFZMH6JcQcbiQOsrrUUg?=
 =?us-ascii?Q?9bQMNefalHeCzJvKXwgw5bc5RPo3nBMpj7uUd6xwuz50G6mRvoUTplR3e4if?=
 =?us-ascii?Q?lw5iCU9NgbYJVERsWwJ4tR+AsNnVXCqufjNCmMLadqEgft+DkvZZaEFAUHwh?=
 =?us-ascii?Q?oPLsv/WRzvPCn09fVUZ6+IczNYEA8EDgGJLS+r/Vm/ATxhq0myMkD5G3Dn75?=
 =?us-ascii?Q?2NArUKtNfksgBwG4wZpzzD7U+UU5stLrS8pM4zw0TAicJdHNw/SGbdtczk6r?=
 =?us-ascii?Q?qpJTnvw07Cs1OhfkxKdbbw8xmb8+iGS/+rq9b1bD3ntbqR6tCZuFci60SNQz?=
 =?us-ascii?Q?jtXjP84vYPHQL/GH5nS9XuKqtJedhA1DvY7xNDfuEHEN6J5DgF1MLQaIknwI?=
 =?us-ascii?Q?GXYQzNppQXY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6ernmYmCY40I9Eiz+DbP2baPiIHoqINvVSshjvTYSmlUPdcchYZHoDY6AcU0?=
 =?us-ascii?Q?x7g+dZeutVgsWR60CERm9o0FyDNobnDxVLiecAqWcKU11UG0QleaQXJlZjp4?=
 =?us-ascii?Q?kmSzGQXPuO73umDhr18o5U4X9lzP3dSbo+IJLZDWIW/5kJhO/kxq4pkg2/Kj?=
 =?us-ascii?Q?wPm+IIWoMle7ZLCRnGMk/2J9+8U04hzq1q1guboguV2PnMl+n92fGSkCdPcF?=
 =?us-ascii?Q?YZHsC9G1ZEyYORpxYHqT4gNsuMiArwNTWFQCRy6Q36l/TXw4fLEdFxl+PKn7?=
 =?us-ascii?Q?K6tMpgkAom0OeulHHLqTMb8RSl4FxNvoJB4v68oe5aBkoW+K4mWaifjFLDE5?=
 =?us-ascii?Q?5w2pf09SjEwFDSxDxahnVpU6YlNSdBOGO9XViEf1DAg0ouV7khxT/Kt2mUbE?=
 =?us-ascii?Q?4D04nKiHA/GoqmCjAmeNYlHvs+XuNZO3A/9mFx9mnkDFnFtRf1gwk4VpLLGM?=
 =?us-ascii?Q?pmsl+rQYoXYGD1SXIs8Nd47JdsZlAg6F4GmZrPBsLCoUfgBg/ze+DAtk8eX+?=
 =?us-ascii?Q?/e4PFcnSSJwGr2CoirkwAPVhNsTR1xCxu6Bpp+YsjESCF8VMALPtz7FIcfEc?=
 =?us-ascii?Q?rRzk4jDnML2ADFjEIp0D3Ngr6O3jqyiSk3uJh4sdRkT3VKCuW3isjLILOeWH?=
 =?us-ascii?Q?BJVA9uvdvXZLntIirMCOevfLkViF4c2y5QlXhZRDAo4mhpoeA2LF0K5nvUWo?=
 =?us-ascii?Q?DSFWvZuUsvCipXFYrXnBL0YEl3xpcSsfl1xlckDtNf6npbVex3rHhFoAG8Kc?=
 =?us-ascii?Q?I+J28g2upuCvSUS2ZWptIeXQGeXyiYdJt/Pxw8v5yHyMBsGWyma/Gbgwz2FN?=
 =?us-ascii?Q?iQJj56D4M/ASeN2eOOFWYh/Rbc5yxxrdQIHWT3vjb34T8MgTL7u299BPsGvj?=
 =?us-ascii?Q?I8wKty6gEwX1z6i1QOmxZndWKY0AFgz/Wyz89qzrFM6VQuYce12q/J6YK2rv?=
 =?us-ascii?Q?ybdehAO5LWIK/k9ymcfDruyjXITxBSwtNdzvkhpUEFC9SD9mOvxwVRhPa8YJ?=
 =?us-ascii?Q?NOehQ3YxLAd1nak6P/bqfNxjibz3Ow6Ne++StqiboyLNzqlsAv/S6b55hcNO?=
 =?us-ascii?Q?Ki14a4pCftpg02jbUFbIYOHtkLJF89H2nn8mFqmaglvhrveWzTtDKCyUBMcG?=
 =?us-ascii?Q?cA1tUyHNt/JVQvaS9v3qx7SppRMQViwU4Bg5NtiijO9K83sPIBSgxyOj//8t?=
 =?us-ascii?Q?TQ9Z0Sv+hp9/jceEHCTR38UVN3sI4bvc5D54Uk4fZMjXctKNyvNivw6V3UBs?=
 =?us-ascii?Q?Watm1jPIMOzsJRJOc9s9CpEL+VRnAk06oAj0sO4rhiKQ41kHBfxSYFkexDfI?=
 =?us-ascii?Q?8yizUWhwzYFt59Ub81/vCZGwLNE/ZTbt8JGE4Qj3/GIWv9zo24X/+iOVGBDo?=
 =?us-ascii?Q?8iVxIgmvq/MobTajq86Nqe6BskWgniZLatSIc/ka2QKpvngRFykJhAZbPWLy?=
 =?us-ascii?Q?4FTG9puvtOL2N+SZIZKYaJhgZxs5eS+sKSr+zw8jrrVT0r9o16CfwxbjlQKb?=
 =?us-ascii?Q?7D6lYLggTTlogoWXT9b4cWVRN44JalY3myffJFcDqy9Uj0D6smCLQHvD7OhX?=
 =?us-ascii?Q?CAn0+S6wIjxVp+FYAEqVNTRFCb1DnuLBe9/jx5BH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edafff5d-9494-4b78-57de-08ddebc74c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 15:25:37.1767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZMKYIv3vmuRB1sAFTsbmBOTzG5+F4+TuYNcR0FkympYhnxdX1bj6xfNjQpRUh2UAr80Gen5WWDO5piYXUY05Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222961

Hi All,
=20
QA for yocto-5.0.12.rc1 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, August 23, 2025 12:50 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.12.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.12.rc1) was completed on the autobu=
ilder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.0.12.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2255
>=20
>     Build hash information:
>=20
>     bitbake: 982645110a19ebb94d519926a4e14c8a2a205cfd
> meta-agl: 435a9b13b8486cf7d51a86cebaa72ee382202a50
> meta-arm: 8e0f8af90fefb03f08cd2228cde7a89902a6b37c
> meta-aws: ee15a57cea8899e436c2c70ab8d2f18d07ad00b2
> meta-clang: f915bbfc71f7b58c38607b8407718bd8b5cefa44
> meta-intel: b065676a83371b34559f2077d9b2f6a6ac5652f7
> meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
> meta-openembedded: c29a18fa39ede952f3f6108ec007c1906e2d9a0d
> meta-virtualization: 02f72c96bf9acd0bd3ae0463f482bce8feabe749
> oecore: 93c7489d843a0e46fe4fc685b356d0ae885300d7
> poky: ec220ae083dba35c279192b2249ad03fe238446e
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
> View/Reply Online (#589): https://lists.yoctoproject.org/g/qa-build-
> notification/message/589
> Mute This Topic: https://lists.yoctoproject.org/mt/114838825/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


