Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D16E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 12:16:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.17147.1736511371387221960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 04:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=enihb3tu;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736511371; x=1768047371;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HTwaUNVlCgHyQqsdsbK53G2feSGSa4eNN4KLP63QYH4=;
  b=enihb3tuNg9Bgi8DSsZuU/p4lq4lyrZMVzCBw3Ct/DWm1Hk7NARNeBpa
   mDx1S9sr/0WEgd8G3er+ZopNfiu8LPk+zqKh7uyTjlGaNDfEiMpw3QAdj
   Zmm2iRLQUUXpqBuHV/4tq9//GjQtt/mp/0kc97IW3i+P8gihrEL/n/mgC
   x10J2R3SJRJK9Ya9VMHG/ZIba7do+1XN7Up/ro+lhXFb40eEPbVs5Mr0j
   0EbG6hxr7xlwR/UusqGcLKndui4X0WYRclfuLqC6sMFo/w7YwrLQt29aI
   iAi4WRsVfjXxNdKYamjwLGM6v4lXCTpu7rytRzMDVtqBDTE6NOllmOkAa
   g==;
X-CSE-ConnectionGUID: 12KwET7tSoGs0YYnMb94oA==
X-CSE-MsgGUID: L9QBoQeDQ+iLUyG2FRJW2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47377586"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47377586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:16:11 -0800
X-CSE-ConnectionGUID: 1i649FA+StSXVfoSwSSDbw==
X-CSE-MsgGUID: xGlhGPeFTxez7PdjHdz+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103663327"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jan 2025 04:16:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 04:16:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 04:16:10 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 04:16:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOnbcoF+ME7Xhsq4G1jQENlTOWo4r+T2oQtHxfx1iXTSlf8asqjXOX5njBnCd6dvm8kzRDq9sk3cZ316aUuTFl/TyOQQbI6XEINnbbgTb7dRg93Fxjju/9Qh8Wky/u/+SWb6dEYGVXrR5IHCKrXQ24vKnkoKv9GPpdQv5mdWLCq69IC8vgko8obtjQzVsDo61C6q2Xwk44IXsdM6JUqy0rwrnPJ7UV16gfCjC6urfCyX2XvqkGc6MOyx3PApqBEVL+aHov1DRa/7TUHFREPPQVGWzOSk/NthvuTxv4SqHv5av8XnkXpt2nRN9tLS5lsjVuZxb3nrIQSoVSjuqjdHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO8Dn9GE1CeOrUJuuipDKnLovf24/bgKeIm3IN+dWZE=;
 b=IM/ItlfjErGPnHjJSH5jx9Yxrq+zcSRgnKYPuGf7cBLq9BcWLsALUZifYX5a4PA/qERftbmv9Wi3ZIi4Z2hi3YntFNOtkKqfUR7BNkk7hZeLdxI230aYPga8NeY9LVEdrTQdGzbUOWIKZN76VOW0GjkePoLnNAYv50UqvBnqNun1IxgZ5vy01gTSJEa5081TfLb6mtQlPdIUg+67uz7Ps4CGXT/hzMNRhmyGh0pUlBQlbwrYAt6+CTKDCmMO4Cml1nolHgExoKyOSw1QWG6q/0h99jrR6usEHNdXibVvn8a8PNKnNW4tU1O7n4FSy1IcklbiWYs/MofH8vtZWq7kXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 12:15:39 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 12:15:39 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.024.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.024.rc1)
Thread-Index: AQHbYuXRO8Vt5bXku0ynM9auh9ldTbMP7H5w
Date: Fri, 10 Jan 2025 12:15:39 +0000
Message-ID: <DM4PR11MB7760589F1CA4247827EAA271A11C2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdb5xR3BHif6-swTPdqFoibSAn4KEtZHSiLd3Xi0T75mxA@mail.gmail.com>
In-Reply-To: <CAOSpxdb5xR3BHif6-swTPdqFoibSAn4KEtZHSiLd3Xi0T75mxA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB6871:EE_
x-ms-office365-filtering-correlation-id: 7d5de009-874b-4ef3-961d-08dd31707f35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rOyd80BtnzpXdDNOITGwymunXoXrzEYajJjy/bCZtWizp66TwwtteiLNTv46?=
 =?us-ascii?Q?R3OutGKWhRpNUdMiZfBRuWaQsaobsum+qJLIcH/LHMStoE2akbVSZJPJRfTk?=
 =?us-ascii?Q?WRcb0X7ugXe0tW4PZP7w/t5TyfRNOyWCeUWobjrci5LYqxaIizTDZC8WSPcr?=
 =?us-ascii?Q?HJ3hM5wxymCGrfpqEvAkO7WTfuOkyTd85XHKntdFdlU+d4p7BQ1KZXxhxi8s?=
 =?us-ascii?Q?dJkc7ePDOjNYjL5cfYi4Ib9P+7zP4v6momh/WsanYjPRy2gIP08nge+G67Iu?=
 =?us-ascii?Q?1FdM9FSTYNdVX5xok/DbvPI7hXuEwgJNnUTwvQ+6JDT/evprSGSWa/1nYZSI?=
 =?us-ascii?Q?bW8pGqWmG02UAzsE6qXau1l9e5aZyUA1It7+uQhJCr3UHv9LHj3szGBiRBR3?=
 =?us-ascii?Q?P+mEAv4+aoBtcv/61Tu9U6pYWKLd6DMZ5XY1T7ET9+dWgpk9Zfl6Fv64dlys?=
 =?us-ascii?Q?wHMDO6UELQVxe2+P5SvrRDZdQ5bsJmpkO2Ou6EgrcFQ3X2DstwhGMTSixhww?=
 =?us-ascii?Q?hOq0BlF+BVdONYZcQtqPX4599uH3YmMg9K7G/mbW6KVktRnYBSU6Gd1mbOnV?=
 =?us-ascii?Q?XsyYqgsbat9os4e4dXSBo3msVq53N4LRtD5mV9yQDm4KgpIWllHfYGXiuJX7?=
 =?us-ascii?Q?/w9064TzW7VITwgIiGTdMDOX/Dh8B2JiPoVEDrpvkMZMGj+ZA0YaGcZZFGUi?=
 =?us-ascii?Q?FmLxsomciNF8yu/fMVlPtr9Rz0I5Txc2jLzMI4fezU6Y0nmBx8xlzEVVFRKO?=
 =?us-ascii?Q?1WTnqdF3+KZ5lWtfkF+iVv9tMa5W3EFtRibhEeBnQOEN+GpH7VY0FzXzbI9c?=
 =?us-ascii?Q?FUAtoSRX/6dnger3/E21+ESNp2q98p4OIxnBTNqfOzkUNJeVYMfVoUKQdYRQ?=
 =?us-ascii?Q?GGU5w/w3PqvfsKjHSCFgt+9kbVkiHbkJoKw9B7adVlcAFjeyNJLD1viqbiMF?=
 =?us-ascii?Q?hzJiWXmkcxjp6cBiuInbypzHppdswLSkVmeSkX+jvAE8nOnLTHOeHVdF4SV4?=
 =?us-ascii?Q?+qmOK+ZiYBGYPxa580LWTe2fkEyqJzdqvBGB5oywmX9JiYcTZjjDspUKFK/U?=
 =?us-ascii?Q?yD56nEk8DBFZO/fOQz+55YXvGWwjevvAGTZzX44gyGaAodPUwrsu7F9WI2XF?=
 =?us-ascii?Q?TshvcKYbHpK8hziwFxpTmmjEkvjgoOQj7tdyHU2K0KQzGMPRxBJkZ6n2KG3w?=
 =?us-ascii?Q?eK4c6uuTbHU7nW1z7AAu9bLUPE7GYKcyZeJRedkuffl64T8N17AvEY2Uvjoa?=
 =?us-ascii?Q?T7FG5VspGWc5ccFxxOj2cJgHCMQWqgJEAnhZ1tltpq8t5GhbRrx9UEZyh3T0?=
 =?us-ascii?Q?uxBMI7BH44s6Gjperf9X9FHqkdcHm6WhFKf0HkeP3fs12UB3vzFBc9sIpuXh?=
 =?us-ascii?Q?DsKgj7zUtKg/hEdojohg9JPkaT7x?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kqmaVvSPO+9QHBadwM1w82HLMzjEV9vkule+1gn9R7U/hsdV9FPXZ/+DjEpb?=
 =?us-ascii?Q?sgD+kG0ZJT+ZwF3yiNtKGnSXJzCKHjJdRu5RjFgYgiE5ORoRJDEcFRQVMJN8?=
 =?us-ascii?Q?EBzwikaw7notXt9DmNd//uCqta0EH6D06QSopNyv2CNXENnl/hWH16Htl4nL?=
 =?us-ascii?Q?eJ+9u4Al7P7UrqK0nbmHDUvMKQN05uFRFJ+FbS+fO73x2OmLWNn43oKl/Ja6?=
 =?us-ascii?Q?mqXHejRz53aOgMJ58ZuK5POLTx7dcvn5D0QP7cUzZE8L8OD5lhz4p6QEd2b6?=
 =?us-ascii?Q?jeJT4NchmQ77odjFGY1tphvZXd7phXbbVeTKKrw1gmWIzmrs9LcNx+cRTSUS?=
 =?us-ascii?Q?samknKp//OKyV36bCQHSTpJh9c0m0VZspX3xO6jtQpI+2sZJ8bKsCXJKvDeG?=
 =?us-ascii?Q?dg8wsO7jRQBzkXe6RHOhj8b0JTdt6C08i/0EuelbvkgI6iiCZA1BF9z6w4Ji?=
 =?us-ascii?Q?Bc2qeCacXUl3x6LWvI8Emc+Rm5dZjo3Ommu1SHsc9zc9s96/zyqUxx7ZTUF3?=
 =?us-ascii?Q?Gd3C5y4kRi3jUJRPkv1PB5UpKyg2DRqUtrSeFgE1sUPeIzUZ2arkpCFSxrvS?=
 =?us-ascii?Q?W2qy1BcCsn3u8uttmctNWU4vImLYL7hYdDGUS3YbFns4M+ugqOJWGloqCspB?=
 =?us-ascii?Q?Dc+Yw+7gm/CTjXKvOi1c7CjRsjyGKX9jKRFJx6ERsLg9Ixlr99RsxUUaLPoh?=
 =?us-ascii?Q?q3FlwRcCWEGcTw5lx3/flgaQn3RJzLT6Ys7NMiSOO+fm8pox/6f0enM/lWTh?=
 =?us-ascii?Q?cqEKp7S62XXiRsHQeZmIOOrvLv+MQXZYeNXEIKBR7YO27nmkAhHz2F3IFwbs?=
 =?us-ascii?Q?GuKLpBbVWNEXgO4+EXehEUK7Un9W84rA7zlaMZCaSR9VGvJeUmYLz49AOVwW?=
 =?us-ascii?Q?StEv5SbMPofVx9U3c7IWaOBE1bh3CL1ZmoXkTIgFeXG/62jT52NupQWdofS6?=
 =?us-ascii?Q?6cV3f0sE4pq8b1W0psyp7dLrPpj8KDO0aKmbEpXyVjCF61VYTB8eVIpvOHsN?=
 =?us-ascii?Q?BfqG64CIz1uf6sjxvvW7i1j1YuNEODei1Styzrk+hGQd80QpmwJGvv3Cp1EX?=
 =?us-ascii?Q?6YjyS5XL877Y9QobK/cUSP9B/CfQGw0cx9wziJ9qzJDP2I0gWsNko2G1enV1?=
 =?us-ascii?Q?BmtDhIYXuWbCULoHVVdX60FfBDNFbLVwbi/xCQKyKLjqBAEjEPJGKwjEbsEZ?=
 =?us-ascii?Q?R/6GKbq5SiE9d8CneOWzkaqx1KqT6OMyr5bzzzOMwoYJdJc/bGni0Xwpd092?=
 =?us-ascii?Q?1enTxb1v2HgSkOoQEMaskMgqPcv7+7bIDMvkIbbhD0wqrYNr4De1Yiqio/J+?=
 =?us-ascii?Q?1RrfaotivR3UOihZyd2Ct4pFHr1Y5lyQlayWCZ9To2ke6yJbhguq7WxekNki?=
 =?us-ascii?Q?UAf4PT/VQ9MqrPpm6NSDnrr1DOkI2R9OARoWdS0XFt+w26b+VnFIclqqbBS/?=
 =?us-ascii?Q?SSYwbwr0sHQ45b53YnaaEOFu1vuJ3NVdP7hUjHaRFJSLB64VqHx9yTNqp5eQ?=
 =?us-ascii?Q?uDil4x4uYdy4RNpZ7yIsOfHAgO8k/zdXxZ+DoS39vm4rek29Kvi82eLsGP4U?=
 =?us-ascii?Q?nTZoH3X6Lrd1ukYROnL8yC4mr6x1bwcD+b0uFdtM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5de009-874b-4ef3-961d-08dd31707f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 12:15:39.6444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8V70343Fn1CzkivOhuNp8kVzFhd6N2hQGrHzSXXkGuvgGzTeYipfE/P09K6pjzdYME4JGsx4hlt8/1y96Db0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 12:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209642

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.024.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion: next Wednesday 15 Jan 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Steve Sakoman
> Sent: Friday, January 10, 2025 6:28 AM
> To: Yocto (yocto@lists.yoctoproject.org) <yocto@lists.yoctoproject.org>
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.024.rc1)
>=20
> A build flagged for QA (yocto-4.024.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.024.rc1
>=20
>=20
> Build URL: https://valkyrie.yoctoproject.org/#/builders/29/builds/778
>=20
> Build hash information:
>=20
> bitbake: 3f88b005244a0afb5d5c7260e54a94a453ec9b3e
> meta-agl: a120153e6d3b7c23075aa0557cfab31dc2887b67
> meta-arm: 936c02ec13661bd86a05f7f90e1b920d5092d670
> meta-aws: b7de336e93c991a51c4df9195c9789e1e5904311
> meta-clang: b33aa9c7f54807c113c44b0f2c15a5c5d88ae5ee
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 31e3dbc89af2b8dcac889f31cc0911018abbf55d
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 7b3fdcdfaab2fc964bbf9eec2cce4e03001fa8cf
> meta-virtualization: a055d7dcafc58855081a5eac9a46b93b9b51012b
> oecore: a270d4c957259761bcc7382fcc54642a02f9fc7d
> poky: f50532593651dff82bc952288d786c55038c2c86
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#496): https://lists.yoctoproject.org/g/qa-build-
> notification/message/496
> Mute This Topic: https://lists.yoctoproject.org/mt/110525906/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


