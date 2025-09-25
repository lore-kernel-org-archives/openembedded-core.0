Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41703CAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 02:07:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web11.1837.1758766068785786975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 19:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XierABXv;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758766068; x=1790302068;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lKlEV6Ye+CTC1aHv8wnyOcTmSJXO/UGqXYtaMsle6So=;
  b=XierABXvj2jlJhC7j7VNtIYXv96/jJksJEUiXYw5vjcEZnL5nrYkqU17
   FHx0OeK1rNgcwFkZV78kBARYkPSjtFIiyDkKL5zBPd4zKqHTlHpY8NrqQ
   wIQIftGW6az4we2BVfKRH+V2hJZ+/7gWkUxEIs+MurUof33ueWcHiUdJe
   GUwIzGPUsiJENIpMUvCjnZFfWGysYCecMUa5AJntCnaJM/CJdB5ASsNAv
   6Ljq5YqEKmMrDDLVc9XNgOcT7oaHqpYgUrXpS5CHkRSrcr0MI/zOZUV6A
   K3Z56G5oCmp5QuliHfPBQl3//3iVaOFRYPzHzLqV7gVq0IMgmHB0relkI
   Q==;
X-CSE-ConnectionGUID: w1TsvuviSiOhR9qWt7CstA==
X-CSE-MsgGUID: aUL8cQOFSKe1MA9J6DXNfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="72503818"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="72503818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 19:07:41 -0700
X-CSE-ConnectionGUID: QSKKUBDdRVykFVPsoW1/cQ==
X-CSE-MsgGUID: ueUuWKIDSR27kYuwwioOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="207944447"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 19:07:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 19:07:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 19:07:41 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 19:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEd7DLJDHezB0xmlJcz+yXniCONtqu6zE1JAiqJa98/ikRMKOIn7TTlqvVnsuFD0xQ7MJyX9KpnCUlJMLXi44apD+yQyDIhpNHLQoXMftwzUjwZuJxXJGd07uhDFYCfFVZMpjJDvwL7MeTSQrNMRVO4MwBTc54eqhBQzyLIlqlLAO8duHTSuK65ufdiNYLzSyGQPtYLwnqjSh3zFdIK3yYz8cSHKNZxcFeqBwWNLoGMBz6MG8DA2cE+7QY2ZV/8P0Rh7Yu+26eISu8rcawLPxpvwLQO1Aa00ukpu0dScVjIs7N7tcR8Po75Nu7Q7hSlLFbNIgXHOPXVHacs+c88ksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qzjsa+B7QZtmaQm4BUd5wQ6m0v/PqPeiD2VOmug2MP8=;
 b=GfM0K2OFoo5ucfQxvUjiquKygSFIenPumaAobAXhpYAFsZCWuxQEg1TRwYerYez7yavbUPez5N2actz0bOCdo4rviTGVVXbPz9k9F7XSJsrSC/zN6BGHG0O4YJ/gE9tvtx4XwMYzXXxApzszwGeateVVY6BCN6iWnWNdYJMbX/Woov1hwzE+j0Hn3JRKxUTC05iW7uBYZnILD5pAP6CKvj94sGZ3TF+Psc7HuKd+tWdIQS0j88CzEzSvTUm3qtCvaW9XiFSrIVyyavsiJi5dSiAzM7ckLEVf2IKyn1IoKilau7tst3Yab40Q+Ll2G5MLmUDH/OGd5hWHJD3vTiWgtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Thu, 25 Sep
 2025 02:07:38 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 02:07:38 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.30.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.30.rc2)
Thread-Index: AQHcKdGV5tujwCUw206WcvfC+kYRxLSjLPJA
Date: Thu, 25 Sep 2025 02:07:38 +0000
Message-ID: <DM4PR11MB7760500260C56BC7C3C02B37A11FA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101019964d4d762-b79f194a-8ed1-4579-9c27-90439b076fb2-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019964d4d762-b79f194a-8ed1-4579-9c27-90439b076fb2-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA3PR11MB7610:EE_
x-ms-office365-filtering-correlation-id: c68ee488-0a19-4908-efb5-08ddfbd84d62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?gR9gvB1XY9o3iKA8EE7bnx04Ob8GwQXjERFLVfuk1h7IjELG8zkFi+yNg5Py?=
 =?us-ascii?Q?PxjW427Yerem6UYBrLSIvZKrAikwgaRnvqn+iZg7fdEIrrDCThaviXgQRG+y?=
 =?us-ascii?Q?rnjkZTOHvIzimgmG67ydtUmxO+4u5r8aQU4jbVKtI+vsVG4jt/sB9beCxcga?=
 =?us-ascii?Q?XzbzDKzk+FdTm+E4EAj6faU5LBb7iaBvoJ7IzAkIqGNcoS8X0Y9bU1MAfPuB?=
 =?us-ascii?Q?7PALS0pcdkefQ9X5XP594WkdaFikF9GoqipReh6DQwdQR5JY89dZV4zsEOmF?=
 =?us-ascii?Q?bq9b5ZItv3kJEG9B19XU477Oyb00FKAEJskoRxTnC6+WEiBGYz4duavZJKhY?=
 =?us-ascii?Q?9kiPaWuWd3nCq/ADoFDY2jf/Zd+0NT4kkTHTR7VoAVggo/ODCAmG99eYaw/3?=
 =?us-ascii?Q?/zBSWazEpNelSyLcL+sDphG6NnoL0elvafRhmXcYXtWcKQTeqqgb1ZrfBrAf?=
 =?us-ascii?Q?SpP+qEhS511g2+neL7bXpLBz577y8FAUwewtCxP3wJbZGMhtjjtbeHAx6ZAY?=
 =?us-ascii?Q?xwKEqMaoy49+BRvn14kZGXZsQRMkvRvN49oB6/ksMWyhR+POyGWRHf5DTmhi?=
 =?us-ascii?Q?hjcaZM0oeRlw97T21UfHhlO7hCa6lTN843C4GweVD+C9u/gPPIfpxnAiiC5l?=
 =?us-ascii?Q?4UJoU0LIZwxh5JyoCEwSMQU+Ozbv8Wmii0CABAtha4k6t5PP2HjDPCd40OXq?=
 =?us-ascii?Q?uxgnsf5kUn5MS0u0xi26fCnyDSnut3Te4HUYIXffse39AplM6fv4X0wm0Rjn?=
 =?us-ascii?Q?7jtlHtImVMdQL1SWlOEiQXAgYhRgFCTSwtyYpU30nc/Q6ziM16kpepF+c6su?=
 =?us-ascii?Q?mI+4v4VdDGE/z+fipxMkSxW1/ezWQ3c5au2uyZ9BbyzptIyAS/zbT8+mE52M?=
 =?us-ascii?Q?xPGYAXQSvvDUVbBM/MqYDuNcOM3d0ujEsrWc6LNOU6WtWtAJ4zfQf1MSkh21?=
 =?us-ascii?Q?Y4klNXZRRMyA7OSum3LpGqZJTi+sJgIlecYZLdKHgYcSwr6vi11dvIs6ESUh?=
 =?us-ascii?Q?S3185f2TDhbAuH7HaggBngR1RasrkUPBI7IAvj7cOIfIxcTlavMeqnk1nDNa?=
 =?us-ascii?Q?YBcaMuZ6Ey7JVr13YO8n5ucZKkp/OilH1nUzybDzJ3JcqXFQlNlzaQ2tOxWg?=
 =?us-ascii?Q?uCd9Soj+rvW/oJepf9sDrzfy/wDBOPSeRk+kgV3K4i3psGiSow5GvvIBZwsI?=
 =?us-ascii?Q?Fk1BrRUQJl4dnC5LYKSt89QBbjezORYjV8ERWQeVGVC4luwXgY4xjEgLO0IC?=
 =?us-ascii?Q?hwnYp0gQUwrQ78W0HQ+JdQQBq9tmvN6SR1IlQuSeCsZUActq0lpQddUP+vfa?=
 =?us-ascii?Q?kLUurnimQOv+WslDwsys9bh4vmYFF4rdC2eour2+KfVNmZ5J3YHE1YXeWtv1?=
 =?us-ascii?Q?LdFOBE+p5rn1q985Xn8QwoPxJPDSq1FEOwbPm5UOuDazaASEVcLNkhMZS8SB?=
 =?us-ascii?Q?QbLwcI//WP8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(7053199007)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kFbIxyw2kAGaqN27zqikv7LfDfbuNcy1etV6VtZIUsuwptYQTX85cUQOp40H?=
 =?us-ascii?Q?NhZBFQlgZ5Z2kw8bAwZI0eRoYSIP5BZhhLLcEo1aSKTkKVL2t6THp3589p45?=
 =?us-ascii?Q?4eDTN5Vy9e2p/SKjdT4jxozKCkF6Fu6dqda2D2qQ+Rp9iirWAlVP94UrCcl5?=
 =?us-ascii?Q?JcIuEpoMluBUmOcYjDxfquo1n6dYw1gjPVg1UdBle6ETP+5X8oaRkMoeiwfi?=
 =?us-ascii?Q?Jzh2sVnczVCT9fpMx+Ty/Rv2TY2O1dw5YXJJj2io5uVxuy+rAe6Y9WgTCjZA?=
 =?us-ascii?Q?ZzpqY37I+qXHP3Q1uIBnKwXAWPDGI+tswakZgJflfBW0e2Jtou+x8fuuBSj1?=
 =?us-ascii?Q?ypBoFe5OmdTh3AhGQtF/kw+droRWPkNVkv5AUixS97SZOMP6Ry3w7NWMk2Kk?=
 =?us-ascii?Q?6b6rc+A2zFrPCi/Xk5cu3KY3UPOpVCKmwY2Nn+lPs81U7UgoAXTi2xJOIGVA?=
 =?us-ascii?Q?fuOA3veF7ulxpKF5aTFdjaEwT+H9lH1rpwX29vJLhMnBkXg34PoHoZ35xPrP?=
 =?us-ascii?Q?oxUt4nPSWBHCvASCGe6QTK6yEVcL5OxtRUDs1pPpz5HLqKOtYbKi9Mhe/ZF2?=
 =?us-ascii?Q?3+7HAxgc8NO59GqSYiQ3Nolc1cG4WMqVK/k9N62xGQ4UkYOoFv8hCGhpVXEi?=
 =?us-ascii?Q?s94We/fCK4YNiw4dhWJwZG2uhbemq3YcCyXmwW8nR9WJ6uJBSGLE1h1uIXKw?=
 =?us-ascii?Q?qWjLf6icWnusSAJZK0Vj3JAM7RfJy0MjUI3pIvPMDHzwtYmN2jLFvdF62LrP?=
 =?us-ascii?Q?lw/d8VOTO7GgudOKFvb8Vk94nlLxqK0SZNX+K7Qk1MjW8zzuMRNeccQa3geA?=
 =?us-ascii?Q?XxuufsXdyMvzRM0+ujqp1FfbxAB61AqLnNF0lrXyTxI3hUfQtZOT3ySpiUyT?=
 =?us-ascii?Q?XMVdtEXccKHsiZFU1jrDabJWGQe90yRNJNfjgGBOxAN9PfdHeZj0fKU/7zjh?=
 =?us-ascii?Q?tyxtmIaMueJdoCkZG5W8Y+4mW7x6q5rTfbbQIjD+zD8zgfnS6f8lAoL/WWM6?=
 =?us-ascii?Q?vBoZM1TJC/NcyzhQPURJvWK3MRGH2ofzKBPWbyKZs2AeDG8z2OsaoD/Lnyat?=
 =?us-ascii?Q?K2kKn4RKmUm1gQGMOQChPFDn+I1+mjs2GnK72r5JqGx65K/tBZ0c/XsB13lj?=
 =?us-ascii?Q?zMH1ZXcAgEeOYxbiXfXw0/xqp53GI1INAO1JYnR8GDrhF3nJuWz/Y94Usz0v?=
 =?us-ascii?Q?Xmn8Fo4j0XWI+Z2ZNYrwL1jnN9pnQ5ls9+xPnygAkbuPLmZEeCSas0nJo5kc?=
 =?us-ascii?Q?15S3J1QnsNshtIEc5eGeEhgfoIsWqGKHDLkP+037snKAI4Pw5fVwBijKwjSt?=
 =?us-ascii?Q?rsH45fAuvCc1CZCOEk8eb4eLFKPRBl7UtaMFuzfVUIhtC8EZswWQQVsTCf5u?=
 =?us-ascii?Q?271++BSSzcgBbYjhXMducVCqtGno+LSau2otO2NqQH43XN7fp6BLYX1HAuD3?=
 =?us-ascii?Q?vlw3vDK3Az4lA3khHXQ7b2bV6zFeYoBaQnSyPmcnnnKOqbJbh7bpwMK4pPtr?=
 =?us-ascii?Q?LqJa6g7k/bLibBDj1hGENwybtlvpDB0dh9NsNdr23yvqXIT5jeZ9ayDHmG8A?=
 =?us-ascii?Q?8UNFIkaGNxqr3jqt7MdBCRvZSfp0H0CLn72nrLNp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68ee488-0a19-4908-efb5-08ddfbd84d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 02:07:38.6244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qF1etc1lQIu2lIJNFfMU3q5CHq9ZTXo0qx+K4sT5/5gqmkarc6ALbSKUoL4FpoZbjhDvh1pk1OnLi4LW6odRZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 02:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223995

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.30.r=
c2. We are planning to execute following tests for this cycle:
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
ETA for completion: Friday, 26th September 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, September 20, 2025 9:55 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.30.rc2)
>=20
>=20
> A build flagged for QA (yocto-4.0.30.rc2) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://valkyrie.yocto.io/pub/releases/yocto-4.0.30.rc2
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2410
>=20
> Build hash information:
>=20
> bitbake: 8e2d1f8de055549b2101614d85454fcd1d0f94b2
> meta-agl: 8ea88240e6ff89b006da04923171736fa07bb84e
> meta-arm: 10c27f061b22af78e17a23cf540b69501afc7160
> meta-aws: 66cc5b4b07a1d4aaab5eea0fbfe1e311ec674fbe
> meta-clang: 26de1c560ef3caf3cf641cd54ed0b7cbdc219ed9
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 82eb2406e04a89d6ed0650a99ba13224e43e4f0d
> meta-mingw: 87c22abb1f11be430caf4372e6b833dc7d77564e
> meta-openembedded: 5c138125018fef4b240e62b664a809d19f4b26a5
> meta-virtualization: 5429fc0f5c2ebd7187e54913220f579417fcbaed
> oecore: d381eeb5e70bd0ce9e78032c909e4a23564f4dd7
> poky: 51dc9c464de0703bfbc6f1ee71ac9bea20933a45
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
> View/Reply Online (#596): https://lists.yoctoproject.org/g/qa-build-
> notification/message/596
> Mute This Topic: https://lists.yoctoproject.org/mt/115338850/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


