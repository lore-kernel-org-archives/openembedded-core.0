Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA8DC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 14:03:51 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.7862.1678284228700298964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 06:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Btzi1h+f;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678284229; x=1709820229;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5Y3IRTVS0rkot6YwrV0ZiK+N43Jt0ax0JEt9Kr7MUyg=;
  b=Btzi1h+fn232bH25fVdtJ5C/83aE6H+uW5GhnmIcZ/sdD827+zDWdqxW
   /1vW4rh5M1rCQDLiLlJqjX0NVQxYKfR3uDhWjhsxwg9gnbUmBnzctcoVn
   gQdI87XOffbb+dmWqdpZ8BRBHdy75GZv6pfj6ecHm++Yp6TMX2lWk75SQ
   siubfkSgnyHK/DiDod/sdId1z53pxPGricYo7OzP98MAy0a/xYh4Yzuou
   zdIVfaiMpHusQ1qAZPc5gbiVDquKwDH6kFSOG4XWAxkgtHZ4oww76cvxG
   t73RCaLuUv0qD+YjSnZxbTnNpKMk9DArvmbv+4BTlN4NzbFISXhOMN5AS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422427847"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="422427847"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800759767"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="800759767"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 08 Mar 2023 06:03:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 06:03:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 06:03:45 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 06:03:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pn03IAbLV3b26bR1LovMVd6I9FKrYB7pKbtfVVpOVNTkJYYHj+eygnvQbsJLUd81K/AYEHi5CgSw0nE0d/hWQTXdzSYQ5KIuwRJt8unSxbR08uLimEPEEJbnCrkuxbcKKyeWVbDg4K3EelV2ujWhug+Ltzo9ZSHP1MRYw0GIgeCI6JqIOmOlUZtOHnC65MCxyEwXTK8Y9JLkwLzQmvzPjOUhmwKPoFyDE3smt0L1SOTNZoUFDqqqDvdOCy4x44hP2VaG8SAXdSZydvg/L54TfBxbXIJV/h2YdRqz3B53mm3AJPvL6q+0vXfOa5Bzi7qH/srtszNVqsOjlu4GLUMvJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xzi2X4/gaEKeuWpDEEUlAND2RqlEhwyLQQ4z9D0KY+0=;
 b=Wxebcg6fJFsJTtz0hTwUQMbxdr9vGTknf6HPNzwHNUgGBCZBDq8MI9wB5G8OcqhcsOSIsmo7s1LwJBKUMI5yz8NNpdBkM8eyImjFV9SA9LUmfsiaFfbTwKdnTaHvq0TUtDHo4/e5WbCFSUNOMdb80e1/yY/Nq4cAtgYy566kRT0aMNbagNzJPq83k/6JPPAkoIIkGRPsBtn8cdB6Xd3LFTE7+E6JJrKXe2KSr3TePpX5ClsLFYfaYWEZ0Hx56bbMyOs3gp2rUkGDJzSTDz+h4uGFK9ab+x504OhFerK3SyCmOUcb6iCZAiT9WsVLjda3FX2lRQjdtC6u+h3ry7BKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 14:03:43 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ee9e:fa18:d293:3931%2]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 14:03:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.1.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.1.3.rc1)
Thread-Index: AQHZUMh/yWTkKEn+2EGZjglD2sNPD67w64YQ
Date: Wed, 8 Mar 2023 14:03:43 +0000
Message-ID: <BY5PR11MB415293DD535383386B18F873A1B49@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010186bb063a56-686e24af-8c58-487a-961e-b7fb780aab15-000000@us-west-2.amazonses.com>
In-Reply-To: <01010186bb063a56-686e24af-8c58-487a-961e-b7fb780aab15-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CO1PR11MB5153:EE_
x-ms-office365-filtering-correlation-id: 4f390746-479e-4150-9382-08db1fdded93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6ssRP2X6tyEnknD2B+kXSwKNpjyxKh2u5ub2nCZy2uu54mPEpZteBPeHRa0EARRJvKpWxIpurg2GySVd1frEuqvV1utMHtJ1RQVtD2NGdhW4Op3vu+CdVJeFnzPIFayN9aTTQX1K53eDINnrdEDKqvQpOH/m/4BP5cjM1qEYiZdl6fBISbaiq6lJsHJ+DojhDGHdw0Yw9U+IOGmnBCIj5yYSBg6s6b081N24yg0LxLNbURzM6M1r5VZ17iCQ3kKTghJOlUghTgK089P7802micYjI66WMvVo/LwlRz2t7WJS3nQY9uxqcubA/PqVHfzShjE88RsJyyMKTMORceieNSxphLTBWPM39kxirNdGgKkdxy5i7imcnAJOP8Ta+QQI3Z73B2N8uGkflX7B2JcIkpOS6JZ29wIPLxazBzfGR8Q56ph1H+oMGD3tsOLCYcQRsvTjo1tSezmAj0a3UfiKU3+KrHdojHAXP0zvzcykAPG7UxY5ueKbbE2+F1n/d18YT8DlDS5Wlrapvxp2AmpfidotDwP6OgGqJDEnZ0aazsJwPrR0r2lAQjCJ5DjR2fUc0QOPCRVKLHRgJ4beFKbnmJOblIEzytCCmsMdxDkGIurAkMqz5A66uARxtJ32rE+mbUA5yfdJnKBeq8BPfT8jTnBNh1q8EAN8P+4DUtPAVIoxzg2HKQEy02+3S+Rx4C+8SD8EfB6lQj++5G3Yup3J4rhSZ+gi8TxgfX0SX/jJ41E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(9686003)(478600001)(186003)(33656002)(53546011)(55016003)(83380400001)(6506007)(26005)(86362001)(5660300002)(966005)(38070700005)(15650500001)(71200400001)(7696005)(2906002)(316002)(41300700001)(64756008)(8676002)(82960400001)(122000001)(66476007)(66556008)(66446008)(66946007)(76116006)(38100700002)(52536014)(110136005)(66899018)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vOIrL3ejGLXwlTSWBKuXXto/6n75AqOkv+Yb1bkxA41EaJpmLSMpWvrQSpUp?=
 =?us-ascii?Q?m2DA11hnsvdrsTgzs2nvavRkOlansaN3jNmhbENrGC6TqGrmJo7ln4dqkBDG?=
 =?us-ascii?Q?T5IFqcULDxUdCfxzXiqeML/rwixWWuT4VWeVj4enYBZM9UDu3mWK6oWTBfLv?=
 =?us-ascii?Q?77oGoraUqBbkOkXfhuE8Gf7uvMsgXeVm6tdG+e/+EbDDWReaetdBrtcmjZwy?=
 =?us-ascii?Q?F19IfwVNpVtTnh690RODxGiFirH4mNnYW8dcXGrAjli6FbpX6MxaHc8+/Efs?=
 =?us-ascii?Q?+zsYDUOkucUoPXG8TseTUqduJzk78YAXQ1pZkDbRyiM5aYX3SlxPo4AHNNqk?=
 =?us-ascii?Q?9KGsid2ebuLSe2Sh02fa6+2P2z5l80bFzTUuw9QTKFMO8Eq2PQeV/yumFcAg?=
 =?us-ascii?Q?qt+nLX0kP5ZZp6o0BGYxIxPZlAKh1XhAYrEzOtDpkUN6xCi+ix9XqHgq2WR9?=
 =?us-ascii?Q?jacyKMqJ3o1ShjKjFevI1fc2UOIdurgZj/dg1YhV+heZ4zdZ72eONI/eqMog?=
 =?us-ascii?Q?Ihvy0g/IklXmIUS1PfeSZ51rnHSBTQ7nW74Sv1C6SLjVDL3kWDtVcYsL5OpX?=
 =?us-ascii?Q?wPQ/Pyd4jYnHKsdne6Rv/2+3ogH9XanUfwPjKdNKyWoWe33rXPftFmFcIsuc?=
 =?us-ascii?Q?8+2BLq8+j2lzee5uGqsz4K80IP+VrRi9CIDyXujYXBUf/HcoGHgXPF5Lymgo?=
 =?us-ascii?Q?gp/HAPMAmUqTcO66TfjjDAnUnFaGnjnTJMldO5m5AbMToOhP70ngQr6XjpVK?=
 =?us-ascii?Q?KmS+dkya/FZF4znH864N3rFTKVHC2G5RGd330ELTnMlzSYYab5Z7HNCaQKlZ?=
 =?us-ascii?Q?4MeZcAnXeLnye5D8dRg0MNTaiEryPXizSeVrJMhq/huwcei7sNG8OTrVvyma?=
 =?us-ascii?Q?lxVvXUuoGcy+GAoiOT5hwEbuMo6+3SnA59MjZ6N263yxmDaDChIAvFN/Jsxs?=
 =?us-ascii?Q?g2EXXx5OBzbu7XpbnNh1GpEb7Opgmyen1w7LiqvrcNVxhMZsXm2E+QnuZjUG?=
 =?us-ascii?Q?DusyqfzkmjFXlenuydX4sq8QRSOfTWHQD8AHhsKoI4DoKyH1KCoxoliyC6Fc?=
 =?us-ascii?Q?xsiBY4l86eMR6Mjba2vbs/aRsKAEVnKMCZsOahP8ZTzkndgpmyZ1zwwRtqGR?=
 =?us-ascii?Q?zzjt6ibi9bGMCwTeAeceCZarN81pMdwmmSoxFgPZtzE5LuQyYOE80ydkL0HG?=
 =?us-ascii?Q?doK50rbJo4auYhEqdJXLhaMN+usv7u33ryh9bO4lYdRf5kqdFP8qI2nnWpY6?=
 =?us-ascii?Q?thQ8GIvKMVU45D5iB9WfDz7mSGmMN45fSBC+Pt4Jb27sLmvidwckuUkHCIJH?=
 =?us-ascii?Q?CNzdh6OJHGRznIdyg1oVQyCVHD0RDclhtXLXcAfZiW0dRk4UhA8TI+HhwfhG?=
 =?us-ascii?Q?/eb8H2VgjLn+lomwdh/uq5GXmeXQTgzLo5gjfHSpSGlzJ5chbFUVb0oTpGGD?=
 =?us-ascii?Q?19lURJVvqesAhqRVOgfCJQ6ILyMUsreSY77rJaukuyNj44xVXdZlCUKjxUzd?=
 =?us-ascii?Q?ifizqStAqioE46Db2CvGqUB3fNLebF+F1oLEHTf081+OsEVltc1dKiC1cjso?=
 =?us-ascii?Q?Vce22PGS/mNC7ME/HJievFXtkrfuorGctc3ENjWi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f390746-479e-4150-9382-08db1fdded93
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 14:03:43.6693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kq1N6H4P23UsMBS66ws/7mnUbiVa923pSIcAw7vpKu9JLDuMtV7umxlHDjp4WuVzMUVoQtpQ+1Ux1+uk86cqhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 14:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178175

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.1.3.rc=
1. We are planning to execute following tests for this cycle:
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
ETA for completion next Monday, March 13.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Tuesday, 7 March, 2023 3:43 PM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r build
> (yocto-4.1.3.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.3.rc1) was completed on the autobuilder=
 and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.3.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 592ee222a1c6da42925fb56801f226884b6724ec
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: 04071ec9f5091ec76da202ce610e256d8d347a60
> meta-aws: 93a2f788e773b36d9813243d2164987c040d6cf4
> meta-intel: de84b34a9596aa96f9cc4c187efebdccc6690d06
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: b5b732876da1885ecbab2aa45f80d7a3086c5262
> meta-virtualization: d1cbc4c9fc44f0c5994a1276e38cdbb7bdb5bbd3
> oecore: b995ea45773211bd7bdd60eabcc9bbffda6beb5c
> poky: 91d0157d6daf4ea61d6b4e090c0b682d3f3ca60f
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
> View/Reply Online (#229): https://lists.yoctoproject.org/g/qa-build-
> notification/message/229
> Mute This Topic: https://lists.yoctoproject.org/mt/97445052/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


