Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E32C77B7D
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 02:55:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.99102.1683514535877780684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 19:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=haDjIml/;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683514536; x=1715050536;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=9s6rvtNgdN7GE6eN6JhovpOk4nGHQWqusHMUTv9R1Gc=;
  b=haDjIml/j28W/4Yy2p8UXKj/MGeVJXzsGiYQkkdP10Tr+rOM0t0k3/Om
   WO1hvKANNePtAq4uU7IkpWEGoFVCGbqhnnNaaWJI2g0ltZ86THU4JS9tC
   Q9s/bNTa/syiuR8sweW6C8gn6Vz5ORHadv8gDrTsJ4v+fw8NEnt/sD/qE
   twD+eoH3+r/egk40fZJVUHch/F+j7xLfuNwcUOAV66O02MWnxrvWEY0iO
   GX+IJln9Ni6mQ5pQvzHmTr/nm+txZDarsK0fHEwnSNTBUVeE82z6asEI2
   uayo23sE58mjnYdSJ6IfZxLWMGNRDSE1j76cEE5+ZDA5vEFqMg0UA0kyP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415098774"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415098774"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 19:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="787937059"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="787937059"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 07 May 2023 19:55:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 19:55:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 19:55:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 19:55:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 19:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr82z442dbVMe21g90JrlDe6MQQdoMrYppgmxCAv8FPjf8HrPs6wXZt5tsZo+Y6bkNhwGyxClwoVy7g2I57aNJBsvgm66x+IJBvA2R5GzzcevY5tEDoWHUVyVdQfb0//Ab0sFbi5PH7vZbfJjUmdUoGd1uUBjUEgNSf6h6X6KpVQCyzHOnoUAZ5E8CFvoSazB6KvhTLt6XgBu3a5q0HXaVrG6UTHaj41G3yjmghPQA7IrdCbnAmCa8GZfdYio9LUlrhpByRbp9e9u146tRFetCiic/j8qwuaIy4gKLElbOB1Pv16N/G5M9nv/OuBIjoI9B4zHVL87WU4YIjGiXhpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWjtKPqk+bPU65ZRNNkbq5udUGkRjClO8L/HQMpJDOs=;
 b=PuwZph4pJm5AsPalMpQnpGejoYqs9lSMUicCQoCBp+P9fYwzdTwEPFZ2rfwUjdfkJZv5xAyBq11FTJ7/8MRt7G/Rgk/wTY14KcrigRC33iJkFlpmXt8JdjAVHanNgUvYypodjeyrI9nkT6BlJXHBWd954K0MLVvcHosh2PmfWvOpY+MABgGatp2bSdIHyIA+fU2RNup0gqsJrqVNjQ7y84BhPVeWuFplQSfn+kajyAInC8ys95WjirNDX1HsGm7aQqSsY2VR/mv06Dv8PKuk2NH1mp113yYfX7rTfdOdG8pZAMjUd5fq82x97agK3JqWzRYHMNUN4oGUOAwNZ4wE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by PH0PR11MB4968.namprd11.prod.outlook.com (2603:10b6:510:39::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 02:55:27 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4%3]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 02:55:27 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.1.4.rc1)
Thread-Index: AQHZetCt6qvEXUQ20UeZrgfNADvrb69PuyHg
Date: Mon, 8 May 2023 02:55:26 +0000
Message-ID: <BY5PR11MB4152D2BB7102679D32A5D638A1719@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187ce7c37c5-f4e60d10-4dab-47e5-be4e-3e4e6d4cf058-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187ce7c37c5-f4e60d10-4dab-47e5-be4e-3e4e6d4cf058-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|PH0PR11MB4968:EE_
x-ms-office365-filtering-correlation-id: 516c8888-6ded-498a-2400-08db4f6fad48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ewJY6q6QaVysPUNSj/hof+exPxiphQfCTXVoVIu/Lp1GlyaLNBML7WGcXiOuuUzyhssvN3zISwPnAdrUuAmmMBUNKYvAKXqRJW57dJ4PNNMSO9J23gt2MzwhkUbKP8flTy7Z4EUTGVz5TAszQTxiPopoDKhguGA99cofalv4j6hGcTzPdnl739BUIcHeXLvYcnEE/ykwHdjspo1buH1pm74Dy8f6+OvD2OqWViUnJ9pDnVU+ZkwN75RYFaJvgoHz6AsafsZ8BikLj7p6vKO1RRN1eA9xdcoGifHya55lApsTPDoWJv/FpvJqdydmLs2UzuiurMMZz8dv+97j0skZOwHki9OTtGgkRlucCoUaFdH+BA5sL7R2GUOA+H2yhgGwEWEFZBU8Nv0RaKjYKNrfJM53zIKq/H0QHBaI3soc9+DS8lRUg5LwZYyyK3FVRKPUHlSLQ9iBenFFJQdToXV0KUMScoCqlhno+cZwbEK1wvWxvv6KN64jFk3tUYQvnfI3NvnaxIsXi+IgG3EixSEfiLmL9rymaRMK9w+GFx70FmeVvmzecGN/9/QJnoCjNPci36eUju+d/iL3o6FF/ypn5JyzCQBEJfOzMh459VYSpSvkhx9c8HGDA++ivkzEosWIbAjqa5FS90TvgicsnssDpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(110136005)(76116006)(64756008)(5660300002)(66446008)(478600001)(8936002)(8676002)(66476007)(66946007)(2906002)(66556008)(71200400001)(316002)(41300700001)(52536014)(15650500001)(7696005)(966005)(26005)(9686003)(6506007)(53546011)(186003)(82960400001)(55016003)(83380400001)(38070700005)(33656002)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0IxqwIZ4cieXpIVIv3f7X1eSMy7e6GvXHkirSIpTACplTRASPd75ywZHQ8Jh?=
 =?us-ascii?Q?wXzchxatxKVJIOEeBnbyxB1aoxQbtqSFz+glGbb9XmCZJwiWDZsdIzBrc6uR?=
 =?us-ascii?Q?51rlFj+MdsbT5DxBMdG1wzAeerFc/sKGaXA0CeoH77hCp+SrN4jIpCh5HzlV?=
 =?us-ascii?Q?Gm/Z3PZPkJaGXh0Qns650CSGrV5zAeDUTo3cjwA0Fmy4HJUP3NsSEUvVwalX?=
 =?us-ascii?Q?7wCQF1puwVgcLiGDdNvDY1CV698R3hJU24knWNLAWOVcvLsuymwRG/dxxrCV?=
 =?us-ascii?Q?e5+WJjmVHCAScwjyk4rhcyyDgXB2ELJQoOxcnVIpHI646HDtI+1qW1NAWa2Q?=
 =?us-ascii?Q?FZP3fQhnoC0IN+oj5VIXsVwzroc2sgJ3sJOmGIrfm3ZrXccIPP3zJACuZ6Yt?=
 =?us-ascii?Q?TD+shll5dPszRGKMU/O1XiyHRpJOCpokZmfVhpG9gG5REFCMhjvr8amWx6Jt?=
 =?us-ascii?Q?tx4vU2XKulvAcA8fHXFHCFu7JeWmDc9YtF7wur6Kyv0u+7u/9ozc2HE9JrC9?=
 =?us-ascii?Q?IX8hTHlRIeoe3F/KwOI8fAplxsg6oNX2qC5ubwFCzBO81ZmSM2zRRNd6rPx7?=
 =?us-ascii?Q?WCTyOIOTfJweXrFKQZ/cYxWGooO++YIa3d45PygQOz2ONm7IG4RiQG4s69DV?=
 =?us-ascii?Q?Rv6V2mkvGJXF6MBo5x6eLFkm72j68NspYiELOQ2sFfn8guq1ycJefoNlMYVo?=
 =?us-ascii?Q?rOo5r5ujaYvW4B+1TfyYTRkx8P6yTry2woKSvi+Pq7yGKK/iXNxbFQkzxio1?=
 =?us-ascii?Q?9ClHektLf5iofZNZRtz50oSFurLjZSHydtYnBBIbfKZDistmb0rFdeFRtz+f?=
 =?us-ascii?Q?2JpeY9/VcxPW635sJ1w5DpulGnb0EKQJXz6bD/XKHqTXhprlabyfK24DGgjE?=
 =?us-ascii?Q?RPiECHuOLfq0nbcqZ/jIN0+9bM1WaTYTIBoWopSJPBI3QMnO6D6dDkKiNf4/?=
 =?us-ascii?Q?vHWnkKZ+XI5XlrYLQ//heH/kSfLqjNc81FoiJQ0edwkOVxdiUaZGm3qLGm++?=
 =?us-ascii?Q?dE+1sl2ZyEcVlXjTWxEu3G2nTnKamb7sW4pmtxu8CwXltFE9aMXoM9LI5tdF?=
 =?us-ascii?Q?vEkET6I5Arp1JZ7IxbPgC6klZLY8KYaPyh06gx8OoDw5PPIXud4eaE1Bd7pe?=
 =?us-ascii?Q?X+pXa3G8jesYAJAkMju1ZWJ4fvqekbh5lOHaD5Ut18VuGDnTY9r9iT1xRB8D?=
 =?us-ascii?Q?WnvJu9/bT01Fkq3BhGZ7v0KVmFmmLlGc2HZ8COETN8muRdDzdgEQKPCCSN/T?=
 =?us-ascii?Q?zdyCI3wqGJzCIeTlSuyoYzcHd/P9fAgYvkIq2C2lTnaH4podncrJh7gmp1gm?=
 =?us-ascii?Q?Q4pIVExD/JCIC/uHN7ExX0bHQiKIubtsmwCdkbpbJ30E4Vxu6rrbi4qbx+kX?=
 =?us-ascii?Q?uD08rJFHUkmCQXOUfdH+NiFNNObOoab5p0uQ8WEy82qwZ2jkkHjf1bx8IwqS?=
 =?us-ascii?Q?yhDB/wDeBwAHSVU1+V9n6OVZkh5S5Y2E4cXa4829srUigXKLdDtVL3397mk8?=
 =?us-ascii?Q?y4uiVlgXzKUtv9x35qrCy3awiGKPeuEfHo3OOxMrbKAEHNvFY7Q9QjOc1xnE?=
 =?us-ascii?Q?dBRYiqtz/1hKbwCOyeAWm9pMApvC9Xo5Y8LAz7vG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516c8888-6ded-498a-2400-08db4f6fad48
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 02:55:26.9794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkZNwKU4OWKIoM9Y+99eEszAZb1VrSr5j+hGwCn7CBSMb9DXXbZjdNqWhaWdsMo+j8J+FDP2BI17p2qL5NJ0LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4968
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 02:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181015

Hi All,
=20
QA for yocto-4.1.4.rc1 is completed. This is the full report for this relea=
se: =20
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
> Sent: Sunday, April 30, 2023 3:28 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.1.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.1.4.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.1.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 5b105e76dd7de3b9a25b17b397f2c12c80048894
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: eb41589aa198c5b1967c7bbbbfe0305aad3989fc
> meta-aws: 096818eabfe600aa332518e99cb097450ed42614
> meta-intel: 13a03c109aecfe275e7539b74c1ab94db9688d9b
> meta-mingw: b0067202db8573df3d23d199f82987cebe1bee2c
> meta-openembedded: 3d1ec70ed319c1b7f561fcda7b8cd0c2e0b2c262
> meta-virtualization: d1cbc4c9fc44f0c5994a1276e38cdbb7bdb5bbd3
> oecore: 78211cda40eb018a3aa535c75b61e87337236628
> poky: 3e95f268ce04b49ba6731fd4bbc53b1693c21963
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

