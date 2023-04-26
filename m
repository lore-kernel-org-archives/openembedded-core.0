Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142CFC77B61
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 01:33:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.98194.1682472817101827359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 18:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=Bn1/TYLM;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682472817; x=1714008817;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DGtn75P8gP0T4CpN0SqYEXolIiAKzkKsJDJhElF6mQU=;
  b=Bn1/TYLM6fLtSgv2xGoz8z5fclMW/ZEA93Hz9WZEd2HGRzYIXBeIEB+Q
   CS0KxDNHrNpQIe8IneDLuN+lX0zs3ViAk4t2aZCsqtbxx6uVedzkcUbte
   Tj09en+V/XclRBk+zRzooTYoezEzBv1Ub/43IyUQvsw0Jgfnh/r0nS9Ec
   z/2i3ujk12VWUlc8VGIYWOe+PkrnKeJI1nvXBfJotkiM3NWP4JguKL2b4
   ZOvzJpokpGsBfgWU0GgsFuRqzePm5xsw4tbcFbBJxdrm9T68ATZADKwXJ
   uq5TQwXMFp0glnqGcwDBePQDCPHhpgTUlSp9WycbgAliNpmBIZ0RrIBB2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="433233317"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="433233317"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 18:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="758395139"
X-IronPort-AV: E=Sophos;i="5.99,227,1677571200"; 
   d="scan'208";a="758395139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 18:33:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 18:33:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 18:33:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 18:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdL5BrbFQWzC5fCKQZPEzNk/d4IB3y2Jv23VWc4O3+JOsb/taXqazyljOCORbfIdRakHs1tot06maYOYYjLqxe+i0WmXTnxArKFW2T2qXKMHrE0z5djCApJw/EpCN4YQs0IEo5ZPpFm710BP+zw8o54ZypP+WGSu/OFNgpLqUYmA1ObNwezEYYjvoNjKM4X3vY6njmvc0GrPbno8D6wfs+fbijzDOuwRAArRyTJl/pDnREsxsqvHlAq75rjArfELZuI/XmkLcmYfUJE/GS3yfW2SH3feRaS93oTzSaArif5ZhDukhZXYVQfP0vFpVnrZB5FnX3/IMxGS0B6MH4H2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEQqE0X2WcuIYzDWxATEtELBl6vCUZ/Z0UEWM9PHN9s=;
 b=FQa1ykOqIfOVwXP87QelvYxzKKh9I/BmtDZAuBolwrCzIAnsE/2LqzGYxQ8gT/yhL4jeDljjlzuqJqrdmFNoa04mx+dn99ENs8YLy/VKI8i+U5kUZZ6HCMB/A0qKrQrWPDayW8cXHRuTVmpeQCjWq50hZ88r5Uni2JL1+Yo307ys++THKPd/pu9RpNDJQAG1mXSf31+j9XsGeysmvmVLQyMH3h9QgBTToLGbOOFfJnCtsV7DD6MW2FztKUnuB9Nlas/3lXdH6HTWlJi6NRILEMMuX8Kr+hpnK8N6oaHnYUjkCFQjfMJcU5DyKG50uJ/w/kKvDri4gt+9e+znh7WVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 01:33:31 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::5f31:3301:4918:ca67%5]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 01:33:31 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc3)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc3)
Thread-Index: AQHZdT+DRJMyzdAcpUG4EwcENOj9ZK880xLw
Date: Wed, 26 Apr 2023 01:33:30 +0000
Message-ID: <BY5PR11MB41522E4D8D45F322AD2EB29EA1659@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187aa002f65-f0534f17-03ad-4a95-8eaf-8222db417800-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187aa002f65-f0534f17-03ad-4a95-8eaf-8222db417800-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|SA1PR11MB5946:EE_
x-ms-office365-filtering-correlation-id: 48b1c203-6f57-49e1-6437-08db45f63e29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4IRxHXFNVEoP1YRh0rR1GSZ50skJSUHxorgOAJpU9lm196pMxLOb9is3CTsF6kvuvRe41/aAUvwHh8EeeHUsCa3yInod6PsJymMzdOR1wrUpdxm00mqptExoP3HLyZGZ8oziGZmFBmHmqQ22u4O+8IzHfoSqYkFi555kA1xNAspfZJqcKZKbxQ0lhiEduIXrjtP80xhqcvpc+2nIOMz9yrydfFn5sO+wT9LyeV4s76FPOXcCcoqR7lahUmGDw7IqnPWW5/DPgy/V6rRzgqlGG7J7mZHSEFIHej3A/U/EVjG13dogAUjZzzjsxIPm2fIQjtVrAcGSYeZ1RDDrGRVWebNkrqQ3IyggLFrkcZj0XQfWiyZjhiW1O5fXwvrwuH4MOOFLokFdUwapR0pwo+TiP0cTomn1oh7MRXuScoGIQdfS3xM4eS0SdQ9YbbqyihAxk2ajrJZVLODW2MKoE1lK2p1mIwlH8wiq35qlcHU71Wsi2x4J4jKGuF0sMcCDcdlDaEgpdWiso2Sr4SmJWJH+TjYaKeIvHemJMWC/0diTZqaBQu2fxb28xPMKJ6csgF3+hxegC/IqnvhuC1LkXXvfmLcCYpt5a4nQHYoz02DtnY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(82960400001)(316002)(66446008)(64756008)(15650500001)(38100700002)(41300700001)(122000001)(5660300002)(52536014)(8936002)(8676002)(33656002)(86362001)(38070700005)(2906002)(66476007)(55016003)(66556008)(966005)(7696005)(71200400001)(53546011)(26005)(9686003)(6506007)(478600001)(83380400001)(186003)(76116006)(110136005)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gomlaGlv2AMthf51kFcNfFJ7LVVOKkf7rfLvRP/K5fwPnWP9NUnGSzQGxlOv?=
 =?us-ascii?Q?Ki3SwyhILvWEimrJRPH/LmibB43NbwDkH/HjzQYjO0SrVhZ160CEaGnFZijv?=
 =?us-ascii?Q?GXGzVkd9q3cLFrWJ+NVjXXSmn0sq1qV2Tn8nXyM3rurrqerMBH+Bw4gpSr8V?=
 =?us-ascii?Q?7/658p4v9mKaOl3MMaVI/9xvZorE4ihw0HkSGZDUmnY6KGP0j9ImllBGQzZj?=
 =?us-ascii?Q?yYE6iOkcxpFtMbPjt6xWJHmBrk7WH58/osOshbU2zZk4ddfpFohUoPAjqcP4?=
 =?us-ascii?Q?M0oDpwwu/zbYI5Op/2I0MlZPYv36Hmbm50owwdxw4Qx/lJsww9wm4tijPg10?=
 =?us-ascii?Q?qroSDuYFhCa+TrR3GW+f3mBtdEqYukwVQpJK+L7ypj1vhlys5fezq69P9Ccn?=
 =?us-ascii?Q?mWDUaHoGgHMSvyYxbxebfcl7SsTnKFLvOYOS7l8/8b91xU8NMRBywGKHzfSY?=
 =?us-ascii?Q?/yMZkq6pE1UKo7OZ5Fu4SaqC5QBBMW0CLhs+AjIJac7AJO5QOfL1i/Q3YJlJ?=
 =?us-ascii?Q?/VJ2Qxr+nUCKyk8hzRz1sA60bvGvU6uKMS5rHmx7D3D9zrN5Z+nw9bC6X3F5?=
 =?us-ascii?Q?RkZ1RslqlXNjPd2/PHGRLIQiUAiHKAHotyC91xcFS3fkiK5iM8Rzah6StT0T?=
 =?us-ascii?Q?9gHbvnY4gavcTvoHT3useXmkg4z0+BLBCTIlVk1b/o4Gc1xWjC+JOzJFLJCx?=
 =?us-ascii?Q?byJr8kHhrjKraMd/LHCByIza4vhz+FMfuLE8p9aiJUR95z7dtMMg8YkkpitZ?=
 =?us-ascii?Q?F8zEiz+rq6LoiORpAZ3dE0y8FwEppYuZDM1kJEfzVx8bmfWsTF5VeI/fPSWL?=
 =?us-ascii?Q?yrB6QBWDyX5z6Ww+b4gS+Guo7sWBi8d1m+zXo16nW2jYZS+EoKQtvIK+qi10?=
 =?us-ascii?Q?Ek1h4HI+jMDzuxZIlJ3aTM60oTVZiHZ0Lxg7sG1CF2SpNJxNB2YCpQLcuon+?=
 =?us-ascii?Q?pLL7j6w7NYZUFKnqqYBAkZvdrcvmn15Zipl8qLSMTNP9rcgt/9tE4mGTCUKg?=
 =?us-ascii?Q?jysqC+c937iBRFgZ0vH9o8cbajLphCefxOH3Y229l4IMM8y5pNqbawy8lXJY?=
 =?us-ascii?Q?mj222c29zomO8hZE7D4COMoWW66yfyPsLCDJMYioklV3gtRFZzcVHUnx1lD9?=
 =?us-ascii?Q?zq7q6Cb871WAXtI/eWFrhmwP6E9FEk93chgGXdZEnLA7xXx9+tV/iPxTUkt4?=
 =?us-ascii?Q?C01riT6Pf91YXIE8IUVWRoLOWZP5iRszOHOk3YpkXOk/j9olTYu7/wJP4FXw?=
 =?us-ascii?Q?/LUUkn20GJnkaarPuz02KF8VTMS5EZdgWnCFghkcLri4WN7JbXJIuxU1+zIl?=
 =?us-ascii?Q?VTqp8tS+iLF58dakaZgYCOMwk5KwHC5cnxvTNNsfIN1gacM2YfQ/0TWXtPxn?=
 =?us-ascii?Q?RBV42vQYrV/3Th4/cwYhJYNZSyK5Zk38k0z4Li5mzryltTFW0K13L+ILxv46?=
 =?us-ascii?Q?xf1zwt49RGctT8zAyXjahpHkThw7npi9D8wrm0xTmr58KdKNAnpa4F1GOqEk?=
 =?us-ascii?Q?4q5CBeBHmEt9vP/WlpAeqsF12wx+tcXYjc4aeyHcIjK+5RsN1+2IK035YPyy?=
 =?us-ascii?Q?WXJCFE87Mo6BacPOnngrJzLkkNik17R0R2ha5p9L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b1c203-6f57-49e1-6437-08db45f63e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 01:33:30.9966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCL1FjoZsPRtjYNnOrGwEqQdCztfaUU1OP44YiUCYELQPvMZufyVeqHLkIWOsS3064rqojbRBpNJCk27e8rgqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 01:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180403

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto- yocto-4=
.2.rc3. We are planning to execute following tests for this cycle:
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
ETA for completion next Monday, 1st of May.
=20
Best regards,
Jing Hui




> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Sunday, April 23, 2023 1:26 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.2.rc3)
>=20
>=20
>     A build flagged for QA (yocto-4.2.rc3) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.2.rc3
>=20
>=20
>     Build hash information:
>=20
>     bitbake: d97d62e2cbe4bae17f0886f3b4759e8f9ba6d38c
> meta-agl: 09135164a21a216c6e3e75d7decce896b92962f0
> meta-arm: ea407ce849f7f181f5b43a2495436a720a32cbef
> meta-aws: cad4b8aabc9d2cde9fb3009ae902faa32bc8f1db
> meta-intel: 48ddf2b0e6fa5450e63878e1fc31dfc91cf3fd94
> meta-mingw: 250617ffa524c082b848487359b9d045703d59c2
> meta-openembedded: afbc2234898088311c38d78997f63992e38aa08a
> meta-virtualization: 50ceb5ad53ac721a25bbbce22eb1d881cc947764
> oecore: c57d1a561db563ed2f521bbac5fc12d4ac8e11a7
> poky: 21790e71d55f417f27cd51fae9dd47549758d4a0
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

