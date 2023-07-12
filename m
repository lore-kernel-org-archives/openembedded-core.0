Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34471EB64DC
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 01:06:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.2989.1689123973849750926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 18:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=bQ9ekgiw;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689123973; x=1720659973;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SqVdq6oU1Lebfen2/zKf5rm99vYatJQXPX+YNfY6to8=;
  b=bQ9ekgiwneLUeuO1EOXYzT7k6Mg2iu1rQiHiESzzWsAvvKTEOdX1s29c
   KLZVBk9JBlyOlNVE/991eKBbzXQt46kRkN0LCuOD9MsTpXc8ffzY4D+lX
   cCTYnX6WM0wVY1cl5fR1Djsf4KBSDHTm0OoUNUFTmj/j8WuNTSxRB5Nhu
   zHcePDVei4rgFyGaS9g+zzjEbZJG2jdmom83DKNxvuPZjO55iwdH6r/4a
   XIxvqxna2cNOmA7UcqQQICqauHkti+AdTMaHh5iFe93HfiLGE5h58JOO9
   Wh0pmSF3wMWTMr74uKB2hipBTdTUygXm2sr1oSW8XjrtrbFjEep6yYgX8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="451137089"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="451137089"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 18:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="845463831"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="845463831"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 11 Jul 2023 18:06:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 18:06:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 18:06:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 18:06:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 18:06:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2CiK5H1yj/PTECFwMaONXeTl04FIMeHrUUI/FZxxqgPsZAJT+1LXmyhQNKmn3rkoPzZg1b6pCzoSE8efmnFjLzT33rxdXkZBUpn7X4ezh6sK53N7TIekLJAJwtArqPJpecn6oNnz/aF0AxGASuGbq5pE9Xl3vMLlpCwq7OziJIzZILjWdufUAPZVB0FzEoiU3bKUW7wB2kOnxoyU2RQVKxoBiHg8B2PwoEiRS1ZgaDoL8rr3Ce63P617Bd4QWJeSA02fUWZ1aJq/raAwAX3VIU55HJgHMwsd9b4yWRBxnkQwCQiCTGUTc8ut2UOxUBeWBpTOlHMrWu92ljnJCG93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCykKV6RpL7TlKArRjOgeligqOxR9a+59YqnFKp8zck=;
 b=g+ZDrIKEXWCJajIA+ATCeYi+j8zawBZDTAqK+W5yUYX+nfQGjttIieLSmUbkHha9L+9r+xGLiPVXoDVxGzDtEXdO6Gm63yqnEBozBwTMNueLsWTzG5iLN9Gxw3EugJfQ2QQDmxtba7YkkdoCx28daFtHJPRXOCHsqMxMfrJOnvAPLSMfp5iAwZa8Ddt+clafoR9pCZXc+cefZbBoZ8rpG8YcGO2BPTXRUjWbOG8jZObEhKIjphkiu9U/q+fccS7Fsgo71BS79NtS590E/hNk8D1+mBmlBZD+7ntgFwDDqp0Idki3SaMfrA+UXoUGz2615k3vvU6cVC4aFco0AMSUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 01:06:07 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::e9de:9e2d:4cc9:9446]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::e9de:9e2d:4cc9:9446%6]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 01:06:06 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.2.rc1)
Thread-Index: AQHZsfaOShZLESmzA02XuI5WaOSIwa+1VZ+Q
Date: Wed, 12 Jul 2023 01:06:06 +0000
Message-ID: <BY5PR11MB4152EF513CE35E07C2668008A136A@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018937e7039c-06f98c3d-58fd-45c2-9032-397dda013bea-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018937e7039c-06f98c3d-58fd-45c2-9032-397dda013bea-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB6406:EE_
x-ms-office365-filtering-correlation-id: 73736bf5-cc3c-4111-d18a-08db82742bf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ucXNNEWBsCl75JpcKMXwsuYkNBCepKSgqCTYxK+s7HOxtQHkOYyWDDAhcnfesY/1+lytVORw6Pa3q4L9GCSREeZNdNQN8zojLAsyURNYygPrGwald2amBPc/8X56KXv+netvWU6uv7z9a72KFS0XCt3ebSYy+kMrInjQKKyp+FTlu3/AipCQmrYRMrPMYyhkT3xPm4puSvpXqffujai4xbjDaAwoFA64Wk88laYuvewWfHxiwTlLox5P0isEyXmVEjrsEncKYScR/tHw934I/V8vpr+qEV55Q51eFvwvQQ2QkegzDljRFKN3IMBWF8ivUk5U7Ojh5cqQXH8X+0E0Yuopdk+UgB/gnm48Fp8xTT2cnkfD3AuNDwWN9BaSLBpV5BymWtMt8pvSSPchTQfZmyzkuSEPXsLpEHBI7lkdM/WNr31wolF04zD7mItqJLJp6mknMjcowpr84utUahD2m8ltX4y0W7ExlZ15Wfc5c/XVKtnFjx5lZsAWDJrZrix7eStoOIGMpT2cnGlnIB0uvC48TcLjHGykYmzuS+qUca/rTB2ZLP5ZiRNy34wk20YANJ3dM/bwUjhEydgJe9zUhwT5tvOQ6p6f6qSSiIWMDh2i9Z+AviXeOyb3UFCmMhqjIrAWbsNX5Wg5Yuc2Dw+cJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(8936002)(52536014)(5660300002)(316002)(64756008)(8676002)(66476007)(66556008)(66946007)(66446008)(15650500001)(76116006)(41300700001)(66899021)(478600001)(38070700005)(2906002)(55016003)(9686003)(966005)(33656002)(7696005)(110136005)(53546011)(186003)(26005)(86362001)(6506007)(82960400001)(71200400001)(122000001)(38100700002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u9OUt/Rr98iIil9l5u97W/V3pNstbj+I6dzboFxi4x3Gl1xs3XctqSj551+R?=
 =?us-ascii?Q?AUsH7JWXGfaQGbM88aPQ3qI7sLk382BIZDjihLzRg04IU77dtYlpErxLDpCE?=
 =?us-ascii?Q?vO9lKrJcxhiXqdcCvjLde+odgw+Pvq1A3FHoRdZpTGvyDLL/ijqqwpjc5OwA?=
 =?us-ascii?Q?iv3h/hyAYAqHBK5QHTfhwVRKL9T/P8qVdqQlSSmtMG2+3f8T2gusMeGwv3UR?=
 =?us-ascii?Q?Lmhl/Jt8os/7yRWyAC8XF1xpXlfSBNmNis773u4rlQOdAj+X8Uf6SkAMmdpK?=
 =?us-ascii?Q?oXbBZpeiO+4aVHTtwowgvb+AjlgEhHxN2dwv42INylxpBhdXKffniixwT/9T?=
 =?us-ascii?Q?RsvtyFoxYQkINekEnZ/LVCtmeP5PRDSHkY/C37fr/3RCFZhCjhuz2vFG/pY8?=
 =?us-ascii?Q?9nrJ+fykvso+NU0QMYkp9nq+UBPgcUiO+Rc4ex4uILnjmaEfmZZbB/CkzqNH?=
 =?us-ascii?Q?759lDHxsu5XGzHXUlDPsjrqlXN0sMECD95gs7vtrye7V9qeTfqm/uPfbyQr9?=
 =?us-ascii?Q?9S2TouwxMM7Bz1l33n19/bpO2PMwoqeCSWYY0/65IUl3NcVZVpgc9N75b9Yy?=
 =?us-ascii?Q?YRky0i/YRUwxDu7CsY/YznQ+GBouvhImNORweFp6fdgV87DY9j9GcKdZjiCm?=
 =?us-ascii?Q?qFobDmb59lItyEpEFZnqaIF4XWFyAI9mM3ZR//UDHl5gsQTFzAjPlctpVrzt?=
 =?us-ascii?Q?rzafK6BJCntoM5mx0qeEt+qNbtgKfntAsHdYVEVVlToZQRnq9vv9CMFTTGJy?=
 =?us-ascii?Q?9DeMwwNNCfJE3GGNX7PrqIPt9O+o3UzFebPXU2cs8z8bAEjJAyBNynsX/TKE?=
 =?us-ascii?Q?e248tb6xFLNaI7YmqSEG6B8kiNHywI0o6xRT8LTjmyFxiIluZqoCXIVNZ0Ue?=
 =?us-ascii?Q?GNEYx7sgwFniPyqRoxBrflCPs7iD4WxSLJcK1nS8FNG7U6Reo8Z6gmSBPLIL?=
 =?us-ascii?Q?LVL6c4RQD/fLAg8nlotyg2WfkoqEd9VLwp86xKKevjlgG4RUp9UtCwDNNxoa?=
 =?us-ascii?Q?GaTh8zKhC/+QIL2lQMND8ddl5dUyVrw/cRArIwnEum7x5nk/qWZlfRB/HOL7?=
 =?us-ascii?Q?a01M+EOz06fuuYOHOQpQgYwzIPxRveo9hlxJuT5zxqLSzOm+7dEHzCzD5jBA?=
 =?us-ascii?Q?JzApH+ZkYyYTuiTafjGiGl+N1dtEXp9I1Vo1MSZyrwwmZvuR2aQQp5EyVcqK?=
 =?us-ascii?Q?vRQhwzZynspp2wN1snYTdu2yuGiUcfVkGUJzr0a0hCjUa0YXi/3BYmhNMwgJ?=
 =?us-ascii?Q?0ZlGF40jW4M6TxmdMxpQBsQK7Dxh/TQhuuPZG2T/D9FaUPqVH/gFreWVA0cS?=
 =?us-ascii?Q?sD388ZpR8FDAXQ3yG2m/YKgt9/F2M70MabY0shQmFxoJQlYC18kFAhyNN+RQ?=
 =?us-ascii?Q?v0HfIN2JQSiAWYyC+AklnN3qWknxwmjZsm77+votHDitXxK6N3GljwFXkqfQ?=
 =?us-ascii?Q?5NY9Vmm9w+Eo4cFGIw+jm7uDI3ULKANF6HpCJ7S8tyTYaEW8NWxoY2Wujeqh?=
 =?us-ascii?Q?KYKf6oPoWIGfSyu1IhdaOs09WeUeHHf3YgvrcRcXv3xmAxcZTLmEIUp7fMLY?=
 =?us-ascii?Q?19oB+HKr+S/71XZul2lyEpkfw9NwyhNW8rMmZiZg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73736bf5-cc3c-4111-d18a-08db82742bf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 01:06:06.7496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRmucYFnAdjzKluNPvAsmkVoUu9JAyXaKwXQUOtsKa2M68OkjxVtcHNYqBUeGfUGit/+EVfK6k2eAcGJ41u5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 01:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184166

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.2.2.rc=
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
ETA for completion Friday, 14 July 2023.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Sunday, July 9, 2023 7:47 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.2.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.2.2.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.2.rc1
>=20
>=20
>     Build hash information:
>=20
>     bitbake: 08033b63ae442c774bd3fce62844eac23e6882d7
> meta-agl: f1bb0ee68b18a39917e06bfbb08d677bbf8bdf25
> meta-arm: 1a15a5b052d488c9f02ab8279b24003666312c96
> meta-aws: 8fb078b20eac38a7472f5e476114f4283fad3beb
> meta-intel: e31edebd4166a7b58ec11c00f9364d9f5f50484f
> meta-mingw: 4608d0bb7e47c52b8f6e9be259bfb1716fda9fd6
> meta-openembedded: d71a08b3d8fc69d3213c10885af9cc693056a8bd
> meta-virtualization: a19092ce81339a129edce745522eebf577efc744
> oecore: 3ef283e02b0b91daf64c3a589e1f6bb68d4f5aa1
> poky: 6e17b3e644ca15b8b4afd071ccaa6f172a0e681a
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
> View/Reply Online (#275): https://lists.yoctoproject.org/g/qa-build-
> notification/message/275
> Mute This Topic: https://lists.yoctoproject.org/mt/100032563/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


