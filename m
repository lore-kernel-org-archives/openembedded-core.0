Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118B3C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 04:51:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.1243.1740459114089921069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 20:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WFzUXH+9;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740459114; x=1771995114;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PfLV4MmbT+qxg6DMtioVPlJTkJxnOIUOB2rRM/jkUsc=;
  b=WFzUXH+9auQLMCdDDxMA0wcKXhdLLqxroH37kyE4NYRiGJNdMSNcA8hc
   8O23AiUiYIK7woXeib77FmIAM+jdvQ3q754QDE8TBDCJFD9Lem9npuq6a
   sENprp0TX84t1DHq2sT7hJW9vkusnYCEcon22SPbmW+isQtagtDVE2Fi6
   weWJFVNdp1RxP4t6ZhyNqFU7vD8Zd0TSBerWnt9rumpFymf0hJiFOZR6V
   wrhrP4cvZ/L0OUo8cil/6cOsGfdeELfykPhHesTfFwP7UE/z+eMmaFWUx
   OWmfsfrPg0FFRmrTj5w0QQzNp5pxQl9Sk288zRh8d5YJcy9qqwh0PWTIx
   w==;
X-CSE-ConnectionGUID: hgqB4n6MS5GUja4+nZ3IXA==
X-CSE-MsgGUID: yobLKKZLSXaiucsE1bfhuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51878496"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="51878496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 20:51:53 -0800
X-CSE-ConnectionGUID: +romamXsSxS7OcmM5FbdRQ==
X-CSE-MsgGUID: YtcXufp7R9+PDtPyBJ54iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116122961"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Feb 2025 20:51:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 20:51:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 20:51:52 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 20:51:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ago9hciSN7ur2NCoN9tugkOBCGOR/5VWSJMgGIpXQHaFhYvuw6BSgt1diwok+LjyAWZURTwLJYBIidhV+oMad4uinCQZSFcfDYu0QNnSTtSqedcw2cS9NiGttWkIXL6nEJrDouhRvdbMO4lroLK5ulB5IMCKfvjxn8pBnBFChA82SA3Thif29i9sdfvhlYplS4mgVwouQb37MayKfbvLMoSjfasnfKwzJwTw0IKEiWAgXfp6x9GOSxJR2RbyfuPhcl5JZ+Qx9jgE6LYmIBhY8Lp7Cjex2k451pwHUKFLQdJo5gVKAIf1oFDjKcbnjzxfUUTlveD9x708h1W0iEuoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTD/XYzsXUQpqKxgDafN7TEDhsUYNPutzAoiIJ1EzYw=;
 b=LwSKCKaEKOSvn3yAU9AvpBbpr4jzhZSXPYrYTdw5IiNEj1BhE2Wug/bkqUpgNgb0aItbpP0kvqchmk0sUw/3HLebU9TkbomZ3+JScPS7IrN1WoxBnVBhbYUKtwPfY1T0z3z+d/i5tYduqj4oQbjqxV74q7LGBqhLuCD9asclo6KUZ8BVV75Bm+eoRWbL4hyb/2thSB6cLLf7x0EPp4gHMcf4RwSBsMOH4A/8DEbyL2KiZs6CViAVfMafKeJmSMeHp88mDvKjoMxeArCIfykTojfKT0qAnAz/NlzfaXE/B3fookzM2GUqAOKKSfhlDBRgaw/r8iLSR/VmWSXsLriiPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 04:51:36 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 04:51:36 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.3.rc3)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.3.rc3)
Thread-Index: AQHbhtspV1YnYOKCik6hPKekcOBZQbNXc7VA
Date: Tue, 25 Feb 2025 04:51:36 +0000
Message-ID: <DM4PR11MB7760BCABECCF1A3739FFEBF0A1C32@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019538d6e616-8b7e7ff9-d683-4a53-b124-ff4ebb179bf8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019538d6e616-8b7e7ff9-d683-4a53-b124-ff4ebb179bf8-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ0PR11MB6574:EE_
x-ms-office365-filtering-correlation-id: 7f29f3fb-4bc9-4812-8a7a-08dd5558159f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?55wn9L2Ch81sNCtjcL9teiwJ/qFoUndKY3bpiQLQM/cBLEZUEOFvvYzuRsIh?=
 =?us-ascii?Q?iWlovmIVqOJVLF5fUhuLlsPyolEO0bQQ+VJd+ZO1Q3quDvq67cYUPu4x588e?=
 =?us-ascii?Q?91sFDkF3lUMB7WxOwZ8olkYxtPNaVluQoc67gBB/pcyrunO0beCVct7O1PZk?=
 =?us-ascii?Q?7zMBKPphI+peF/5hn6MbXTtQibbxTUnFWURZZZNYsHtNlKhzJ1efW53CmtZG?=
 =?us-ascii?Q?fvfGjsEFSnCnwf+pdkl3iv7bKDF1AAOwOFOfGhTqXu3KGS6gHwwCq7U6SGyS?=
 =?us-ascii?Q?Z5gtpQlvuJAa115fw74r7tC6D+Zc8E7gNpaGXaIRJNm60lU5IDj787fRFHh0?=
 =?us-ascii?Q?Xir9tVFYLXny5Zwnmuw7hlNcTlZg30x3uH1M7c5Sxi40PWyFX9j+MH/T9wQi?=
 =?us-ascii?Q?mbgZ2U4hqWqmndAhcU4+5E/ip0uMSllkshKXKMTm8VjQFQ9IPk3ce7SySxjQ?=
 =?us-ascii?Q?OXR+1uwy341jGVlceWHkndhwHwy7V6mOVfV/EpKq9cuMQf/oLL2yA+hk0mU3?=
 =?us-ascii?Q?h4fLHuE5ombNy0sTI6A8JNVxMeYdvP84deWtFVlNs4j4h48rBeBYR6dX093V?=
 =?us-ascii?Q?l+ESWfGst67taReyxHsJkQESaRvqsomgvKjPP/T8HcQoRV8A/OzTvMPF7UiA?=
 =?us-ascii?Q?i+n+LKT9dCdmb5yOvmACY1qVoxg4h/wYQ1kvTPDQAhtV39K3Md2tIXmwwrxN?=
 =?us-ascii?Q?rNwV2tGZywgbY98MnzgZ1i4Q4/nrmlP+AiwAkmC6Wqu5aG/oruF1S8uQZlFS?=
 =?us-ascii?Q?ssFhZd30Y2WJChDZCfjXTFwyfSayg0rGDrE8zXp77YS7kBMl5h4ThINIX8BB?=
 =?us-ascii?Q?udut/LyyJ3iIMM4zGwN2K/8yzqRTnKtlsByzKciJtP1Ecr3Y7FRMBtfgNOSF?=
 =?us-ascii?Q?siNm7vaOBM/ZGH2Go0hPNllUCMCvY+APnVTLViJUL8bxuwT1TCcXjJSN+yFg?=
 =?us-ascii?Q?dEhV1cmcwbHN//DCev7dJx5LX1iSgbo2mcbqghMET3hUD64j6WQkq1+4aCor?=
 =?us-ascii?Q?/PuBJcNCimXw/BFTjmOFcKn29Gd7dk2Qonw5LmA08JBYECZryGPnJF2qcb1Y?=
 =?us-ascii?Q?dZJLqGxoqlk06guLz58urVnHzwDzkQd1bUAg84oSQZNwgDIDkeGl6LgsmCc0?=
 =?us-ascii?Q?hPhiUWxwfl9asCMkvYkOwkn1FKhS1eDrQEafJFXHNaEwFe4zQozhCkaDTZF7?=
 =?us-ascii?Q?nNVmK6Vvk0VKriBxpl9nukqYra6i0ZF1mG2W1gg2zSmXoxKQK99kTnVuL9NX?=
 =?us-ascii?Q?HK6/5ZX14I34wP845ZAM6IGZNpJ3Z1sEufUm+hospbPGrRLz2lztoAyVx+IQ?=
 =?us-ascii?Q?+HRhs6yZnX2XEQO/SJ8cBAPaAwcypWX2kXW43fg8NM7CkqufxujwlblcCjgi?=
 =?us-ascii?Q?aVFg90PlSflLgTm2yvs/OKtFwiUb?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PskJbcXSxVAiPw6lg/z9bWt3T45DHUXmpPgAOglKNQdu9xYsSUjHHp0/TBDT?=
 =?us-ascii?Q?iu30MS0jFtBuEVkjAl9lB3Mdip808NmQIYZs4Jbj7hZymzGDyVYMFkSerhH/?=
 =?us-ascii?Q?CPfiy1Mo/ZQgFa5fjpg0rPkaMLvIh2qZa1xKybxDCJy8QpFoOrKnFkr2IBrY?=
 =?us-ascii?Q?kLYnGdvrJQ9TTCeYCU+J+6IBv+W7YKpq+Wq0ebgWcapHJILUchplJ43FRaWE?=
 =?us-ascii?Q?Ov2kMnlkNtFUrYXk6rllj3xU+X+tfPzEqDe8Z6TrPrgyVpeE/3ziJrM+ZFyS?=
 =?us-ascii?Q?oGijHogbRa8V2Z5USACnsQKY/n38ZPM8wsTx4283a0lKdQzWhISJ+eTS2KUZ?=
 =?us-ascii?Q?oBtgnG31x3WJXfIer7d5KWXpZz0KOMHMdY9DZCuoIQF8/6G4Uf6rWitaa3Aj?=
 =?us-ascii?Q?H9lydI49KizPkP2M5TKN5s6Rwv6Cvp8bxemYg3qI9Vzpy028HX7C9Qx8BpJl?=
 =?us-ascii?Q?GyqxqLWUTev0ntf3IiWI9T7HzQFfDJhuH1yf3/+tDkhgQXuiAL/H593r1uct?=
 =?us-ascii?Q?cW+ti/2UxXLllplwDsFsU2yQ3qfXAzsfTlvyzYVsAxwKTu0ZkIs9W1zd3NrQ?=
 =?us-ascii?Q?O4GdL5+JIDtAF6fYyrE9qst6Q+Vsv6NMFGoZbC+1flKmClj25be2bCscAvGA?=
 =?us-ascii?Q?zJ00CO1DT5xVPL+C6OJu5MZZ1/j+/aXeZHW8oTk10cMB7E4yMSad/EO1nBlg?=
 =?us-ascii?Q?fVe538D0jyLTsgw55TdwBSG2kDwsi6xWYY5ZIh0XsahMmELSOeRReYfZOGG7?=
 =?us-ascii?Q?GQCDg2Ktm89sK+mB4eHrWL+v2rBZlywHil1/p7PCW3y3BUTPXStKeMpagu1f?=
 =?us-ascii?Q?Un5kI7oHtaxgDrAZiJ97NlaJ7lWFbHhtuI1vjlbWZVnuPg/4GlKLOoe7K5bW?=
 =?us-ascii?Q?Upp9p0mxxtQxiLtQgclIw1c4f5L2V4IzbDTFesja5f7pj1zNRmLNwXDJxjLk?=
 =?us-ascii?Q?/YhxmPQgwos540ypN4sHN3I4iGjImK8RfCTpqjISlnj3laSIUP1NL2hg779B?=
 =?us-ascii?Q?MLca2ZjeT4WR2dglEeKF15/Ku2lqeKXvqhhwOEFf1O8ShO7/E/GR5kn4MAIc?=
 =?us-ascii?Q?tat4ayMabO0fh/9TxezKtTKp5uR40I/jZ+38qc/f43zvPSp8Yuqf/cLOP6O1?=
 =?us-ascii?Q?qEl1ay1UC7gRNCxsi43XMpi28Ws3MXCs3zb4i+cASDHXHI1TvGu5WFSRB0mm?=
 =?us-ascii?Q?SVkfPE77b6L/bNxqRmeHU9OqubsEFhZ54WNHgogO9hK+M0jAm/IM+NJDsINw?=
 =?us-ascii?Q?SA8zKyNXgt2jpkGFIgP0PkKobIO4Brjst3hipKyKD7wIH3rkw8O3GG8uslip?=
 =?us-ascii?Q?IopCBB5vXH86XHaAxJTpLDpC518G3kcI5EFQuK0Rd9D6q6hoCy/ad0Xn2+7F?=
 =?us-ascii?Q?xsPMOtGtRIkvxJ9OdpUEKBik4nngE9zz+lG38TJRUJ1A46cPV3I5J6+5gl34?=
 =?us-ascii?Q?gSg2IblFOWZoPYqXnM7Ply4/d6KCeAq/veBl3WAVwAMaAcO8UPd6tcSCv+tB?=
 =?us-ascii?Q?SIO2csxZCzFeKVTYW48XObATvdoz4nPm4zNr2dsiSghZz/A6DBc/2q07746o?=
 =?us-ascii?Q?oFcm1PZBPLJQ9k9PjUwsn1u9DGletF0l02WNgzT4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f29f3fb-4bc9-4812-8a7a-08dd5558159f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 04:51:36.4653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X7MsF5TH3GPBkb3cEhubAaigpKMRf9Vjq+gnUDNyLcCBTwGJAwcfIrW6GGOuaZX/lKw311veKiW5d75cpfW9ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211862

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.1.3.rc=
3. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S=20
	3. Arrow Lake=20
	4. Meteor Lake-P=20
	5. Amston Lake
	6. Beaglebone
=20
=20
ETA for completion: Friday, 28 Feb 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Tuesday, February 25, 2025 12:43 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.1.3.rc3)
>=20
>=20
>     A build flagged for QA (yocto-5.1.3.rc3) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.1.3.rc3
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1072
>=20
>     Build hash information:
>=20
>     bitbake: 58e5c70a0572ff5994dc181694e05cd5d3ddaf66
> meta-agl: 005d2b0a27ebdd21fb2aaa589c8672650474b055
> meta-arm: e56a0cd6fe5e796aa59bd0d4bcbbb585ea626199
> meta-aws: 9a8a5edc0ba8be96273966df0215fb921d8a6e16
> meta-clang: c709a5196f1e8654425b43b478064395386c36d4
> meta-intel: 0ee9e8454cd41dcb0f49df7dcf2182b4d5e7cc96
> meta-mingw: 77fe18d4f8ec34501045c5d92ce7e13b1bd129e9
> meta-openembedded: 6851cbf026088a13b2b45f684838d3dc4d7ccfdd
> meta-virtualization: 247ea9c3880a257003ce2cc566fcdbb307ea4374
> oecore: 35ffa0ed523ba95f069dff5b7df3f819ef031015
> poky: 11a8dec6e29ac0b2fd942c0fc00dd7fc30658841
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
> View/Reply Online (#518): https://lists.yoctoproject.org/g/qa-build-
> notification/message/518
> Mute This Topic: https://lists.yoctoproject.org/mt/111360898/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


