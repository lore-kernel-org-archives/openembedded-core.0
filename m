Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B192EC3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 01:18:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by mx.groups.io with SMTP id smtpd.web10.14395.1719364694188097054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 18:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hhd9zZDE;
 spf=pass (domain: intel.com, ip: 192.198.163.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719364694; x=1750900694;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o/L3dxMVZIrDysc2f9PVM8ntS9+9xA61xhSOAwOWNo4=;
  b=hhd9zZDEGxr2Nvf/f685ZqmG2GC52zc1vcG1Mr0T6hMsg8iGyHcALaiB
   Ccta0UplJMPY2Wn86vKjJ2a0qqoVYnJZR1C3yYv5a02uJzpS3Qk2kZe9K
   J2J+HAPDeQ+6qleAaJfXQjP8Myhfb0LqB7rnn5WYmuUT9+L52281Vgx+d
   MNcwcwriZv7Ngj3YFDOfL8ISOfR5oGI9EXdRTt8BS7x9Cumz+8tqKv8jL
   S+KKMvnxypgIY5BFXwwytf+V1WX+3kbXcm1kssl17ZjrMjjF3ONLU/8wQ
   pcnuzgA3nGgYXy5qJKVxpVO57EllKlmi4fYDv7r64m+TjORRpd5UJKgfw
   A==;
X-CSE-ConnectionGUID: GwDoPyFtTRqAFB74ZP0jcg==
X-CSE-MsgGUID: I9Vj+uZgRpWW4j4OSko1ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20296276"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="20296276"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 18:18:14 -0700
X-CSE-ConnectionGUID: gsrXxRpbQ9aDFDS/BY6ehw==
X-CSE-MsgGUID: ASs6Q7AzRTCaDczUIHh4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="75049410"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jun 2024 18:18:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 18:18:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 18:18:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 18:18:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvIskfKofwxFGLSCp2ukT37wNHQx5LkcX3twHM+j/ou3nNsjSUmsvaWgqmPdJvVNYogDKqx6a50F0oTCudFtwgfTnNU6BIp5fRCf32FkQlvzWUOPEdODIrDA4qwEOaOZk5R9o19CkqVvEa32RP61/W2FcqBQJTfFgenYyQvSbiZAIRey9/5xCQmOUw2wJA0E4pW5Gw1LnO82AfPQZe+22lXr9U//Ynuu2Pavv8GPEw+MrlywIUc5RxGWapY7tCloBY7TLuS6jFo404Pjjw+8fC28Mv9XVrJiEJr/zRsnE1ji/8fF7i7zHCyX/4OCRACMr4r51HgxN13BxLDiqEfoSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h2wsFXPjn1r1B4+fH49+ePeScmnF4HNDiUfNeRkFjM=;
 b=JDCSf+ep1uUWgLX4hieMgAb+Tx1TuabINwAbFwWA/Os/Ge8OH2K/GlX1Q4jAMqpJ1cbhIBvHMaVX+YqWsE1TMMI57j+MiO0VHGYQnT/s9WtmUMNh12a669wKpucUK4dOMlgwbjY3/sM2n/hIOLqy8CYfWjf02Q3MEfhfder/3593LWqUzKVfhNcgxNGAP6XcQBEPkLl1HWNIl0Ux4AVjfOs3BId8OUUP/gJ2yfLu2rch3Avv8GJ5TMiEyTjznaTMNWVlYaE7alVA20dbT886QfMosnllGst8BxCKOrzQPhgcz2sNftIl4UlNjONNKXS2dpEADfsE5FHGOK2wYmtjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 01:18:11 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 01:18:11 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.2.rc1)
Thread-Index: AQHaxtb2+J04oyLUQkeiuWKBC3BQdbHYhk3w
Date: Wed, 26 Jun 2024 01:18:11 +0000
Message-ID: <DM4PR11MB7760C6D1818311DE471137F9A1D62@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <010101904e70e071-638d333c-a229-48ce-96b2-86cc080208a9-000000@us-west-2.amazonses.com>
In-Reply-To: <010101904e70e071-638d333c-a229-48ce-96b2-86cc080208a9-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: 1b28b7c3-9783-491f-2051-08dc957dd85b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|376012|4022899007|1800799022|38070700016;
x-microsoft-antispam-message-info: =?us-ascii?Q?du8OzpDb/7P069YW3zNkEv83ywm6TlGX4qb2VJqgoPgn+HqWILD0iPoXlR2e?=
 =?us-ascii?Q?ssEBLvn7uuw49s//E9lr+mK6TRe3/xiy7bmC3H0Hosawcf2NHm4X4up9GA9x?=
 =?us-ascii?Q?/tVJw05bDtOX4IwsfY5UVLO0RbtLDuyQ3R6tHmUByy4Xme1xK8t9M2WbrhVM?=
 =?us-ascii?Q?Mezjq4MNJ++bAtfksuQZUhQevdCc3Juc70oiFV/SwGYNALLZg2VJWCQiTI11?=
 =?us-ascii?Q?CtLbeHBSEvey4GKdQjhLubxLLrKOvcUgtlfX0E4CDcpsuJsN0k0Ufd9s0n1Z?=
 =?us-ascii?Q?4/vUd5J45wJS8m5RHVQCn71ojME9LUnyqxPtBtTTbn4rQyNcchu8u0u9YPhM?=
 =?us-ascii?Q?Hj5SZFN6RJvYngge4BV6rrT31DkU/25HauR+6ejbPc/Dp6XWPIAX8NkJE5iJ?=
 =?us-ascii?Q?i7zqj001F6qD2Z3nErk6BaGhkBjOABKuIsmOw24fFBFc9Ft11rTS3sni4MEu?=
 =?us-ascii?Q?N8J6HVLM4c0bZho3uokOC71QttsvhR0DwEk7X5AU05iwQu+3jbLoMUM06nY6?=
 =?us-ascii?Q?GJ674x66+TYrLrPxdM4xWl6bYb+x4S1PMkjCInT/zqI+CQWFticIQ0OAX2vL?=
 =?us-ascii?Q?WkbI/xf0yLdok7mj5lv8VuGsernoghrdw2/uZDuuaCHEP8VoibvAgEPT7xAq?=
 =?us-ascii?Q?3zQiKF04tcBz3JoImljJ5Lf1SCmDEu0J7xjT1h3/dQ0nSrjU9gxkN2wTG5bM?=
 =?us-ascii?Q?OsMGqZoIotIe0jicqmOYlo/EGrG8MEdo/mkiBNyqAy0hglRHNf8xgYyAPqtw?=
 =?us-ascii?Q?qFDcs5Djy5majrOfTGLP+cdQcTcc+efvhATkDTuLzxKoRAkj8N/qbSJ6kzOn?=
 =?us-ascii?Q?++diGHCR/A0Y2JBfks7gd2GXNYNvm0OdcUr9Z2XTh9TFz0CNLQYFHIvpGs8j?=
 =?us-ascii?Q?0rEZYPzleSGkn5xCSV0cGw8YfbSfLWutLmkCJBV1p4marTXnLcCh7BQgRxDp?=
 =?us-ascii?Q?WBnZGnhygEpufK9twYdBUDexRKRHn5d0kjwsF5w6PeRjU1hag5zbxDdIXjJ8?=
 =?us-ascii?Q?e1CPgCEILq2YwtAFy2UTGCqIanRMU8MHQ2z4XUrJNUUYIX9Bz4nIXoqVUhaD?=
 =?us-ascii?Q?vL6FUDEYCQ/Mr9ZZCekIkNHUp87lx4he9sm2fyxvs/4ZRxJk80SxG+jyEG/p?=
 =?us-ascii?Q?d4wXq76GCclBV9c2C7+bD0K+HKCmOuBklBhpbUqoTXocaH0kRQo8dnpTr+iz?=
 =?us-ascii?Q?+JRdgdizeAHNdIxzW7wJxScvxeaBqBcj8kWn42vsAlCbjRPxl+bKlCmOZBL1?=
 =?us-ascii?Q?e+wqe1SVKQ647jMhhMTiRu1HB/PHCiNW48CrO7s8+L9qcFEbm4P7fesyg1x4?=
 =?us-ascii?Q?Dqt68So3Yg8bl4fmcT+c/wdiSd4tTx4Aq9jYNLK0eEw4AOam0O8Oa7HadGXr?=
 =?us-ascii?Q?Ip7nYww=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(4022899007)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZwqyHhTNf7PyP3LD2qKSPNEnxQovKtolVhzV6VBsKFUt33oKh/VfEjU+wTjT?=
 =?us-ascii?Q?cyJO6mTVcyadpNkGUUMHFCNQcv5EYfUp4FN97s0EM3KHNJasj31f9Fk6YYpV?=
 =?us-ascii?Q?DaK+ZaHJ4M0xQ7Nios8Kdrgwj4oREyTflfOL9rLL/+OXdK6BLn4fbslz+FnG?=
 =?us-ascii?Q?+X2qQ1YQVusNsz6KfFi6fb2IG6xQgRaAeVajx5/jRl+S97NP7RuBq5LG9gWG?=
 =?us-ascii?Q?H3Yz6H7LV1aKzmIq2RE4pU560SruCT17jSNL6cxC3XQKGMcOrpnru1VHNsGj?=
 =?us-ascii?Q?Yx21vTp719ue+JiZwlJzndurDAmRHhFolXOoGVBmxIw3qwZkVmfLC4NM89zc?=
 =?us-ascii?Q?oWRqIjI0RU4xd6Z+l1JoJatWB9XrUKBWWQPL4EW3Cl3qiamQaVYV3pvqPKfV?=
 =?us-ascii?Q?5hu8GmBY8vLg8jrFMeQvpqvGs/AZVQwewMt8hxvFCyZcQK7N5FTNjlTTdYMZ?=
 =?us-ascii?Q?Db5UivJ3PxoIyBZa5hA0pQdIYKpPPMcGYfIKfX4bRhWg0L5M4eNF47izoVBL?=
 =?us-ascii?Q?cMyNn4owI7/96FSOXv00UfbaQhqd/B5MLLJTVoDWrXPDyLRo0Eop9amamh5W?=
 =?us-ascii?Q?PA7N5kM1um+dj6aUjtddW77+tXe0MLrb/ueNK0gF5e5kAw/bdLeF3JJtxVah?=
 =?us-ascii?Q?+hAczAAxMBrpyqWgRD0CShx+yQzK2E/PsxnMwZlbxWBMkhr2bIxUmsEcHGQx?=
 =?us-ascii?Q?RZUBPWzqZpEcswdqEiUl1oFEd1RXBqjqn4EhOUnm8FlOH2Qs019A3RDYwPkS?=
 =?us-ascii?Q?KwIGRPhJn161nKI+WTiV0MhiQnHTTCmjqqwKSxUXGUBkJxNIAqo7AUNyS4U3?=
 =?us-ascii?Q?Mqkd2npJEu5LretOhZD7EFLLXbsRSdJ0S/gtBFVxMl5DFxwiBtvWnKXOJd9z?=
 =?us-ascii?Q?Db85O+C4a5Ond3uOJjPEQs4FqiXqwWMJT8/oZxB+W9mIq651ubpB2h9KP/9L?=
 =?us-ascii?Q?gTMG+Wj2jW6xQUjXM9a8aRGs1zJyOk3ws5T7R3/Y0TUrUgClOXZ01O+NHkJb?=
 =?us-ascii?Q?7SHXyiDjsBT7A6qOAYVXpYztJtf+igcZ43YzcHGD4oO4efC0DVcp1nXzd7np?=
 =?us-ascii?Q?r4Dqv59OUzIDjDluHEMUujYaA5hCrUjlmEOcU1EZ+4pTJPWqAcvSNcjEMMmR?=
 =?us-ascii?Q?GKldVz6avEjsOYjliixJ0ujOCL6txhoPr0sozYB3rm3UDmC6HtyexLv1gn25?=
 =?us-ascii?Q?GjAyzIo90uh1YdPXX6+579WT8NvnxUlpWadWkzbmRaPd4M1R6STtkmQAlq1i?=
 =?us-ascii?Q?k8n5l6sR/Hd4D9t45nKq39z0afP1Qn9Z3N1ZAHWkG5ZiWyFyKrUbVr73Dwp3?=
 =?us-ascii?Q?9YtiHPPoQGpNydYxySq2Bzay7uKUraxbBFJ2gOz70s5el59Rs+AbWo2Qm2Tq?=
 =?us-ascii?Q?S+wjH709Ukx4PrYdJpz9z0DHYq+IJbVlkSAENsqJWxwQ73KmaT9GgjhPKd65?=
 =?us-ascii?Q?AEh1ba3u+jrZj5luEb8hu4WlPkCFZ10B5FevJ6AAjzHc0UH9vJg+ZQK9YS08?=
 =?us-ascii?Q?t6e7XYCXZETE6xaO4XF3KWklFGVwaUdAiEL3jbLlXNGTTm2Sz7LtedupzYxk?=
 =?us-ascii?Q?94QTPWT1W1k8baa8Gw+jTI2kMqM/fJCJziWm8C96?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b28b7c3-9783-491f-2051-08dc957dd85b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 01:18:11.2512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: foXpgG2uEVAccwwvGfsFQBQSEgOlcVMVhhEIHJLLATn/xXEdqbrvrYT60CR8DjN+FaQxrPGIdaNpxmfKtfHZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 01:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201148

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.2.rc=
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
ETA for completion Monday, 1st of July 2024.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, June 25, 2024 4:09 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.0.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.0.2.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-5.0.2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7076
>=20
>     Build hash information:
>=20
>     bitbake: 8714a02e13477a9d97858b3642e05f28247454b5
> meta-agl: e1a0adc8cfdc3b306537fc64f8b29c3c53f744ca
> meta-arm: 29799b787d57d623dce140012a87568f314f3460
> meta-aws: e3e4c876830c76aa1112b51ace6bb6fe35d5f0f4
> meta-clang: 83e93bcda1654477802ed18b5f440fba7a733caf
> meta-intel: d172a00f487a8ea4391b96e0f6cef5279c5a07d7
> meta-mingw: acbba477893ef87388effc4679b7f40ee49fc852
> meta-openembedded: 4a7bb77f7ebe0ac8be5bab5103d8bd993e17e18d
> meta-virtualization: 37c06acf58f9020bccfc61954eeefe160642d5f3
> oecore: 803cc32e72b4fc2fc28d92090e61f5dd288a10cb
> poky: f7def85be9f99dcb4ba488bead201f670304379b
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
> View/Reply Online (#443): https://lists.yoctoproject.org/g/qa-build-
> notification/message/443
> Mute This Topic: https://lists.yoctoproject.org/mt/106866039/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


