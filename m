Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662AFC67871
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 01:55:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.186802.1673920549664113542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 17:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Im2/hEUd;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673920549; x=1705456549;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qIKwMBheO2Hf7gQ2J8AnmdxojHW5MM4xpNfEMy4OqjU=;
  b=Im2/hEUduPNBAfIKanifCyKb1W2iqyotcYeIwXhAbSKhCpTrhKNAb+Fv
   +VLBdIfU+YOvM++N/GeAAmX2r7ci0oxkXmMuJQh9rz6E+iXvoPwPwK2Z7
   pXAIaxioop6B1jq8CqxSLNL0F13tIvXv1KJOnZl+4V/cqdVRltqVrM+eH
   5TEmZYQN6UhEGIneDryeeAcoiqBeeTgmlLjBrRmUay4nUU+4WhdvJSGeq
   NKkb4mxVnCwVdkWfRufr4l0seHtbxbac1/eqK0HEql+3GmP5+/BKKdbWh
   4wQsNaPnnEd8VFgygnZgdswhdUglZfwBHjTgQMUALIdBP+qCKC/lrgofl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="323284372"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="323284372"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 17:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="691437720"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="691437720"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 16 Jan 2023 17:55:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 17:55:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 17:55:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 16 Jan 2023 17:55:47 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 16 Jan 2023 17:55:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g19Sk0KrPkbdvjILqioBGeB96L4Pa1NCFMriwgJ3FOH/cMSBqk8qhzz8NVVFjJLq1h7SPkxbGnEsGi3zTnifjyVWKu1gLXzBSgDnwjNxS3TDZUFMHQhPnYTdyU/hykeIKF+EaAnS40TzW5klACN5sn2DP6W0gvDTmoIIFYXYBNTt19C7H103xWuj69qhxYIIeatNBwrY0Zk2rmZMFZAyqbZaVKNTjsxPl76ViIpQ5oqnwDrIsG+2ZD6vc3ivVUDACwYp58oIDD97KQ6EFJYwDZev5QkJsZQjoT7IBnUUkPvdN1ebZ4AwJSlyllyA5SuKzgJzumOQgflsxWL51Tb3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT1vniNppboZpm3reyKbjQHZkjQOA2wG47BPK1EAuVI=;
 b=R/tKx6AUhtJo6irOlrRIJfM4J1MaiuRfxowMl9Fi1S5JKWMd9fkwC0rIY0C4BW2nAkELpinFSWOMcW4Q6ll5ukLWUa3/SGazOHjHuu68cheHMvyAISBTxkRZ3aOlk7w5J5esQtmBs+PXi3VTGoE5W5jFU5ZW0GNrx/rZzq+xLqtifDOipjUiAxCldV/sAhd4vhbjG6K5Sb3rxsvCPxSTrzf9mcd66mzEP/1YU/v8nUGkXVSQpgupfK/FVOZALZnI5oaaRRN5gTefZZqlN+iHZOQ45JWF0XgKRSfpNaBeX/DIChWYMBzn7jS7VA4rdjwixdh3ZpQNbgBvYfnWqtQRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 01:55:42 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::9e48:366c:b777:950f%3]) with mapi id 15.20.5986.021; Tue, 17 Jan 2023
 01:55:42 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.22.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.22.rc1)
Thread-Index: AQHZJ71ruTUydx4wDke4vca1CdgPC66h3XKQ
Date: Tue, 17 Jan 2023 01:55:42 +0000
Message-ID: <BY5PR11MB41529827900259DE0DF0BAF4A1C69@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010185ae0afe37-bd223560-9c64-4364-a9ab-e4708f92af83-000000@us-west-2.amazonses.com>
In-Reply-To: <01010185ae0afe37-bd223560-9c64-4364-a9ab-e4708f92af83-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|MN2PR11MB4584:EE_
x-ms-office365-filtering-correlation-id: 5c334833-e2a9-4c8a-acfc-08daf82df0ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9APhPpv1B39u0uAZS2ZBDhcyJUCiaEAdp5eM5xiIW4/Uya3R2iHOThcVDvGdfVx2jNSIwtUkelpwtXDpkkAfOnsBHCWm9MHWG5obW0/KAlSUvXosh9GbfRrnPdpbHiegoiAQB0VcV9jd+xmOEG9zccgA3udVv8JWji39vdmCOl3PHSRExMgC3btnEtDUJ8TJeB5qohuXjMmUp0DusMpaJy6z/Ypn78kKzY7xNaQW+HmwztJo9lx05essVdiFYDZosnvVSsIDv/qdGk9BVNue/jr1VQhVs1mi+GtiZA+N0Gy7c7gtVVInQxVrEixzWj9oEI6Jhc8YsnqZqzAnv4enAi1nHxq2NhZ0dalxbJBzoqx9f2b1icpqv+Gi33m6mZOj4Mhb9of4OvLkuD66wflkeUDbMCSkwyMa9+g5ZCa4pliV1uzN/ZgO3vOBoA/6CYHhwMz5v1DI9WuGL2q13UKL9VLlCxjevMEk93VFCo8IM9H7NG4uAMNVbRKXJ6BhLBfvVDEboymerJ/yX+n9+OWN+gOfbv/wWZd4I2YXHDAzORbHfUm3EwKwyfNmd95hjdOrLfsDfP+fcGfA55iqgG9zQtpY2JpfPdEPyKpBgXi956L2D8gjvwH2Fi8NplsR7a2620KTlasrbYJN1i5kA9Lw+1o99BrxKd+HAHe3+pPzcr3sPZ2pJ6T50k03WFuWRF2GQQp6KEFGhTK3Jw4kc50H68ZauI+QnWy5lb+jxTqOfB3rv3DbO9r1XxDw7i4PtP37Zm1uH4e7x0nI4/sy7k4kzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199015)(7696005)(9686003)(26005)(71200400001)(186003)(66899015)(966005)(478600001)(316002)(66556008)(66476007)(66446008)(53546011)(110136005)(76116006)(66946007)(8676002)(6506007)(64756008)(33656002)(55016003)(38100700002)(83380400001)(8936002)(5660300002)(52536014)(41300700001)(82960400001)(86362001)(122000001)(2906002)(15650500001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xinqYwL0xdazJasPHN07ONS3BGD69kMtJf/8rPSTJGAybQ+rOJprPzZ/DV8g?=
 =?us-ascii?Q?xbyJ2ZE2jt+X7je6uuIWAUe0Zj3IUsIJMPTqYz4eJ4PxTtl7QxsJyGD+f3AN?=
 =?us-ascii?Q?oPZsAqkPfk+qVZ0FXPz5lmqxub+apJk/M6TaTNnb5AoI5NHeQOm/NyMPz1/h?=
 =?us-ascii?Q?yrO9xz/xmcNNO6Rt/fU86MHZFUfgnhqUa8tADWLmIUKexV7rJS40KELFy6EN?=
 =?us-ascii?Q?yXoPQxe1xlYeu0IzSKq4NjKXzs6IMxrGHP0oFXkTNNJryOqKKuC1dayZW+Dc?=
 =?us-ascii?Q?nAVRj5L02pqp/JYsD1VMpJsaY9uKpEt1TwmiR64fggplHyyv07+3ciMSnS5g?=
 =?us-ascii?Q?wRU13y1WV/FiJvXNgmK2dmnRYUdD7Si6WOdm+pXiiU/B9LrM7MBMitQLCHxm?=
 =?us-ascii?Q?HpllJRTvSLYVN3UOGHH3mM5MG2ijNb01GVaSaDs7aAll756QW7Sudp0RNg3r?=
 =?us-ascii?Q?X0oWFC0wBSJ8otR97tOm/EO5BTI6V5/mZgfzM6oS+MxZq4t9EvAUh47yheH6?=
 =?us-ascii?Q?LtgNE3oquo5wNEyeO10GDlw8e1A1e7JcdyudoFtXDh96NPV1irL1gPc5Uijb?=
 =?us-ascii?Q?KKcaWvBEiXWZlgJcExRIVYHA6ow4o5b4BT0BkePWeKfiR0srNo6Cr7rxOYvy?=
 =?us-ascii?Q?3Uwz0XG+MwAoS0+dyKiWzAzvEEDYJrgdVFOImfRP5FSwHe6gK4BVZCTnUppz?=
 =?us-ascii?Q?18PoADrrFaSLSyJllBJLT7WABT2BwH2aQGLgE3SAabchjfvlcKvdXn7/zvkP?=
 =?us-ascii?Q?Z6vFOziGHbUrbX0yYowJf9T0L620LNbRS1FFMoMwHmJ9jkHNb3giYQFEFWph?=
 =?us-ascii?Q?zGAF/WDhgxuuJGCZnPkfuNHfShV2WVN2HWiFPS+ahCS4GqvmqNpQ732BbTwh?=
 =?us-ascii?Q?w4Xr0/rqaRNfDxxD8strPhAYdZdrzYUnL+XSmtHwwp0cTu9t0S2f+90cDOHK?=
 =?us-ascii?Q?y7uZXCqaNNW7RMvxCPR6Q9IxTYJZxxqJYKK/iqisY5jz3qm7SVnGf2o/fS4R?=
 =?us-ascii?Q?VWTFx0TQ0HdcZ2UVAc+Gseese9+59j8Ic7C+HfKJtDRBieA+/J3PQ3CzxUZ3?=
 =?us-ascii?Q?5V2xrNOqf5QXMXAyH6ILZalAqGQwHclJKNERnWEKhDc0eQBCiIGr+xiL7yKD?=
 =?us-ascii?Q?dfJIyOLy+ZzAqzhCRw7owZMUcwOQMT9Ibwsoo+VHgO5F8iAZPNV7bEo2MW/b?=
 =?us-ascii?Q?jeG+SWKX4Y9tEWid3pFgDEfuGWk2Ju9k8ObLifZHoJrEEKeP2eLVLywZ+psX?=
 =?us-ascii?Q?SK2WTy1PIIWXtStRCzFzWXQSqGGNLHqMlsXlis8rV6lyqCzUvlVNOpZ2qurB?=
 =?us-ascii?Q?xsgyIUNcq4aechddxeWZZQDjrBDbP1igcuK3HI8o8F7Ozhrd91/hkLgRIz0Y?=
 =?us-ascii?Q?vWkRwKmMlauquBPNB4rRQN8b/Lgj/Vf4F7ykDeabsNU0pqJcCJY7rxFT2Q2u?=
 =?us-ascii?Q?dRxR+ZoskcSPbYvD7vAi0c4GUhTpm6HUYhDg4ueyQ5hKjjnzEB31M3nkEkiw?=
 =?us-ascii?Q?4XocPoAKaFbpjzwLqWXrdZUOIK/MO9qUeChpAlLw56IeU/ERDrzHT1D6sNOh?=
 =?us-ascii?Q?m6VsQiHcaI7zr3m4e6KX+LQC9LzE1YPZfuPmPc9A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c334833-e2a9-4c8a-acfc-08daf82df0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 01:55:42.2752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BN7fcQgznPqmZK9kWYuKkR0+TdeHuZ+Z0a5TORBjIHTvMLpXw0Zqk9bSUyPBlfBETczX/R9dPuSWM+L+ohBc4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 01:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176018

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.22.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. ADL
4. TGL NUC 11
5. Edgerouter
6. Beaglebone
=20
ETA for completion this Thursday, 19/1/2023.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, 14 January, 2023 10:11 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.22.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.22.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.22.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e3db9c2e9eded3c5cb6040714a6054b44f6b3880
> meta-agl: ae982d798a979ee5690bee00ca90a2855bab4802
> meta-arm: d13be36099aff7ea2975a1a197564e2e801707a3
> meta-aws: c013258cecbf99528291e55005e1db360d7eb40b
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: 6c202291925bb179d2d08b5bde80192f9b032b88
> meta-mingw: 524de686205b5d6736661d4532f5f98fee8589b7
> meta-openembedded: 7952135f650b4a754e2255f5aa03973a32344123
> meta-virtualization: beea119eb529b4a11f266004aee8b548427aea39
> oecore: db81e3c7e7f1d4d9eba52ac35ac97627d0240b63
> poky: 6b8a307b7843af23d189d7ffcecf32c05afac850
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
> View/Reply Online (#211): https://lists.yoctoproject.org/g/qa-build-
> notification/message/211
> Mute This Topic: https://lists.yoctoproject.org/mt/96260839/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


