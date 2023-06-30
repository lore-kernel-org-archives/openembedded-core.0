Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8ECEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 11:59:47 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.10036.1688126377570029614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 04:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=RzI4wSE+;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688126377; x=1719662377;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=M00Lzkhhw0+va0iX9J3jNbxnZ71CPSFEI9BoDls+NbI=;
  b=RzI4wSE+XgZtcwSC9Wfye/Iy76cu5l2gtw6DJ/Hb+dgNnBRh3FJEdP16
   Il+l+/KAGhd0RJp6Il3vicYF171RW5eQN1F+5+zo5Jj19zHfKD5bn6aBM
   5dK3x/GWvfUErTaTfRWilIhXce8Jh1yi/7tLSeKQdUbJdlsysVrwLD9HR
   MDwVluAZ+oowFboDt7QcmZaCPZrzRBVUoUqHv/ePp3TBie3qha3sMDQnA
   sG5AP0v5MpCpOYcChVJ1ngVFrfv04i75XB4ImtuqMDyqXFufJ4bic66GP
   80DQjpVU5Jo0qJST4+MY/nX0a4tmcSBxZcty0KYW1AviI5M9x51o6TTyp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="365860419"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="365860419"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752974021"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="752974021"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga001.jf.intel.com with ESMTP; 30 Jun 2023 04:59:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 04:59:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 04:59:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 04:59:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 04:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXf2jo4hn76njVOyrsaNZo+K7QwPcY/JnzAAS6dNvuMa0GsvykA3CJK5zXisbQL/7uA1wkgsfPfrMctSlr9rypuXLQ0fGUCbcAfmcSrmxv2roKpwaVJo83dhzpRSoewB6uqEgqWcwRUaD8ghT3G/kG/Dx5wF1DyC1I3U1IF2RN/HsWMOD5ZsIXFbwTn9akQFsAv1MW/xncI7k3OR+D6SQTegvrWU3AxJ5Bl1+2S/5WzWk8T9Pz0y7BQEmZiF8nSgKiPrDO7Kq5qiVn+/oSq9Bbh259BJDvSNI2BGk4mTcVonVSuO4WJ+JPmNDtRAoHHfekjp6nqAeUvlLl9jJi0dYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsmNndOo5GhGB7arQ0VR/cC43DHbbQO3BgcURSZYFbE=;
 b=XQFcY2GaOIH2iKQN21hYZFb52yakosEh6dH8BCuyAqF31Z6MgEuZHq3DdLsG6/CeVqao25bp6uFa4QVHCC9BV11UByx6XqeunJS403UXF1YNh0NdnGse9FTLLKPJAd94dP9fW8778adPkvFpyDZUapDx5DItaQ6mm14n9SnOvgWBlJXcMHyHk9qq0iAq2cDIfS9/jfZ1MqfAfMQx2F5q5BbZAQC8kwCesbYIH/yRIg1vgPMCohs6kYTtkUUq/f6VDKASDnXYslX9jw8UMyrNvC+F5NNzVNQm+lqSj0WAxue1dpnhXnbnWGHfb6wkFIwIk09SLL8VAfBGpArVNSw+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 11:59:31 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::4db0:1447:10d4:125f%7]) with mapi id 15.20.6544.012; Fri, 30 Jun 2023
 11:59:31 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.11.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.11.rc1)
Thread-Index: AQHZpgYhgREPUh7gYkepCXqj4yuVga+jSEYQ
Date: Fri, 30 Jun 2023 11:59:31 +0000
Message-ID: <BY5PR11MB41526C41EAF02AAD1B31CAEAA12AA@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010188e9a85af3-ef64f2f8-a9ee-4dcf-8070-b9af7ad4da0d-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188e9a85af3-ef64f2f8-a9ee-4dcf-8070-b9af7ad4da0d-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM4PR11MB6430:EE_
x-ms-office365-filtering-correlation-id: fbae5de3-02ab-4d36-8e56-08db796176b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0SQQcpJBRMrtlbcbb2DwyW+Dj+Pcq/vhwitRdnbfBqomGwbVczN3IgpI+FVTM+/vn/Z8mlnGWt1ptz58Bb7OC6v1wXZrdX5ubz9vCT0R1oH/sYcJ2e5zjD0W4KinzMY1dHDAluTqw6ApcTT9GD0rrhS/d7DhSU8zdkOK9rPC7xgT13ufbP+2a5dhxGhxKEiMU57M0DE/okxtBb90S4+/IsyvjniCUiQ+Q4QkcuL+IS0V9asXu5+xtwqvDdqpJvT6/LQJKTghwLx/4W1oU4xvO/OPZJFuEQlSH+FLkv9GwMOiRlVul7tJ+e3Ku86Sb9XW5vPwAmKbZl+zblnlAisBemL/X8ylDkmHzuagMac/3VaLEAcCm68yYo3sHzH3klDXLnLnYpO4YcCBpb0WNj7y4S8jACL4w85M0aMEnGCSjGMWmSMBXP2RQpoKUhnKu9h5BaOqCIttpuNlyLfmDeZ3P3eNK5IRTcnDDLwgn7bYDy9onyq09a67fTj/DTfrHEGI0jore5Azgwgeu1/a5pkvzLoKCAQDzZh6r/UPjDz9AFZCCmeSI0aDWTaL3rca9Td1ArO0IrdH/Rq0OlKknRA/kO0SeVvl2hR0sEUPIm5wQdz1hCcrEZw2eR1/Lv8baNiHAS7HGYujSqcqMVkIzIirzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(66899021)(66946007)(76116006)(110136005)(66556008)(66476007)(66446008)(122000001)(2906002)(15650500001)(8936002)(316002)(38100700002)(41300700001)(64756008)(478600001)(83380400001)(966005)(7696005)(82960400001)(71200400001)(5660300002)(86362001)(38070700005)(52536014)(8676002)(33656002)(6506007)(26005)(186003)(9686003)(53546011)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OlIedOPUQ8rHE0iK5Vr/qguODhfnkKT6VB+W1FwgDjetAGXx7YRfrD15iT9C?=
 =?us-ascii?Q?nbZ27VQsMosB9lFLBxfp3xlsb1z8u5iydvIU9RWWB9wGt0Xfd4gTH2H7yRyM?=
 =?us-ascii?Q?A9g39vm7fi/+J0pc9GjBhhcWp1v9BacNkl+kxdrK2XGtLuIVOMoLEa9zJIcF?=
 =?us-ascii?Q?sMeg7x74Novj2rp1BX0yJnI5zaG6+LW+xgq418ak/Qt2dlY30SadpwInV5hH?=
 =?us-ascii?Q?FK/imbndhv5QH8Z0twUDs7DwJN2IBcTVm8nGKXlTER5MYWSsCSzL8N8KRGZR?=
 =?us-ascii?Q?6OAByGdD5N3J/gSNuIA+4s/wgjrE+q6M6zaqnDhBa9jwdgvYucpBlLeBdyYE?=
 =?us-ascii?Q?tJj3OW5IWihSI4rL1TAoRyEhNP9GEez+TJEzkb29IKGytntT4cZBa2w1OB0R?=
 =?us-ascii?Q?MfGMs8PMZck10jiYd55puYoOBroSp6RHjzU8O/twWbOnB/Bmnmhi6Ho6l/In?=
 =?us-ascii?Q?6PUK/jHF9HfKAJtSiP2pAdU4U6FCLjNN0btEoDZ+ntlTIb6JdY2WNXj3wZ5A?=
 =?us-ascii?Q?K3BEBeXRP7mPVg1z9LUgBgmLolvcEyCeO4Tv2LTFHnIXc8448j4XQxy2ZIPw?=
 =?us-ascii?Q?5v5XaA3QcMZs4P3PZ8slge/Iaz2sSab68FL8VWpNOwJH7JMkqt1W1QnLr9sH?=
 =?us-ascii?Q?FmIUK2oLEYvUnzwZXZZ86ufJGMOxlMBy/4ZdxoTbfgvSwj0Of0yiN1QgXJhO?=
 =?us-ascii?Q?xu1OL8JyX5NzCrC1Q+mWrGRKx1zTlIbgjbptSRNt9NSQs8P/Eou6lkBRYixX?=
 =?us-ascii?Q?KRKN8erCP0WKMliMiaYZD7aOg23omxvMgBk0UNRA6bCHca4AvdNaYsI3nFbA?=
 =?us-ascii?Q?re8/FrHKxQ+957FmlGqshgCyu/HaL4VNj5XJ44LmCHx9ITX/SVz3KQrB3O7c?=
 =?us-ascii?Q?wWIGRDXjmygHMDujO0MA2UyaBzaW8y42lYmEncUbJtAa9EIkzbNTL5ym1381?=
 =?us-ascii?Q?qVIPL+VrqCzb2yGSadAdXb+VaxXezYfrwBEsE/fjTwDNgqe5M19BR+DUaNmj?=
 =?us-ascii?Q?o8OttjIpG9e8NZVFQ+1RAf594mjAD/um9bEMKyyWEQFPFr0DLy4SUlDpZ+2z?=
 =?us-ascii?Q?syDKpeD9f3QkzBXHhJ0EbTvpLDUe80Zkj9GXpZMAWASukovdBs/kYXjOhr3P?=
 =?us-ascii?Q?JeEMG1mWjXpi8j6mCEOi1CYXzes67gt7sHeJV7EVmIuBR5AWZ9cS0IVwu9qZ?=
 =?us-ascii?Q?sI7ZAOU4xLjoXpxYQv6cPmyuZ6UBM/J5TaBMPsC1jfnEPGOlM/0UPBrlfZ8L?=
 =?us-ascii?Q?26eBbhrGRHPdLAa1NcQ70lyhbUeZ3EyFus04tgvRD/GD3vsZnPUHrHhsDcXe?=
 =?us-ascii?Q?WaX2fFEeZYyEHVxz7a0DFiHHqtm1vTYPrY+pqu1FkE3KDeQ7DXp5+qv6KmF1?=
 =?us-ascii?Q?64IkolTKiWPvoeyoO45FUzKkrBMlWJfe2S5mUmvjAuj5EwxMElhfGyTcnYhz?=
 =?us-ascii?Q?H8fPxKm7xRNX+yzZUhV/DfJ1t7nyuuLbgcS+e5iuRGDyLIHXjxn4Z6SWRypY?=
 =?us-ascii?Q?q/1B7bFqsDd2fE1QfyU+VjVUPYR1Y5+X9Yi418bnfnGNwJYNPpBz/8GOuR4q?=
 =?us-ascii?Q?cD9b5ICKiCh+upBAgnpdTqbLVmCL7ctPiwzoQJvB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbae5de3-02ab-4d36-8e56-08db796176b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 11:59:31.2763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8uoyIvg14TST++SGD/vuki0f1R9XbClzmwawRlUzquG8x63phnXsy7NDngZv4XZ73wVEAalQuXNLFz8yoabDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 11:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183693

Hi All,
=20
QA for yocto-4.0.11.rc1 is completed. This is the full report for this rele=
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
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, June 24, 2023 3:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.0.11.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.11.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.11.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0c6f86b60cfba67c20733516957c0a654eb2b44c
> meta-agl: 1b0cad77090b75fc040f9de5db06374203fe34c5
> meta-arm: 96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd
> meta-aws: 7c498bc8f0d51b9c2546b8f7e3347cc6e61d74ec
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: 7fab6b8f1a3030bc6d2f1cf48789599af3dc3e78
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: a82d92c8a6525da01524bf8f4a60bf6b35dcbb3d
> meta-virtualization: b3b3dbc67504e8cd498d6db202ddcf5a9dd26a9d
> oecore: 7949e786cf8e50f716ff1f1c4797136637205e0c
> poky: fc697fe87412b9b179ae3a68d266ace85bb1fcc6
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
> View/Reply Online (#271): https://lists.yoctoproject.org/g/qa-build-
> notification/message/271
> Mute This Topic: https://lists.yoctoproject.org/mt/99724928/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


