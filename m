Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F65C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:05:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web11.3954.1708481122310317619
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=GUEVrSKI;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708481122; x=1740017122;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=B+G8inlEzNiffJBIEwEGUwf3aFlaPw1jpB0Y8JnFv+4=;
  b=GUEVrSKIG5EzCk0BijA1iPqvh9fYtHM33jb5/VA+BYZ8PF8J69+NMoWc
   CYdvhtnV1XcLLbuju0AZPR9ZysNz/0dWXLJFSsHMhv7Dv9HMS0kSLqwjo
   VdEKrTtvNNI5kDNRBSnQ7dOtK5OqA9wP3s4VElNZNFOk/ga01NGHA6kBg
   Vbzt7YE7R9jhMEG+oKVaOURIP74ZMBr+rSA1r/XrKKCjnlpDpOz4Y/+FB
   mRfk5Q2b6clE4srwGoqfJyrjIpPkru8IhvmW7wd+s65qemsvlxEuouigW
   OyELZlp4X5uuDIlLAVj9gRXHWfZ6KopT5MiwQpubSrRxtZrac7rbDHpmQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2733387"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2733387"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 18:05:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913198137"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="913198137"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2024 18:05:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 18:05:21 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 18:05:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 18:05:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX5cMMRo4nuUUpj4foN5JZuTlY8y+2GLuzdVb7IOphc5rev3YgJevn4HBWfJcWKdv0KFF9VU1k2hqY+oMxQnG544MEBTXDu2wTztZNqXpXWYX4DRJNep+2uJiQVjnoqFgldONsUv9eY9X7FZtreEeYiwt68ZCTO0XJT5fd4RH96ojmcipB6gTs3KUqt59UHirTBOxbQk93tapOJIrGLUzpzXZbxDADO0dCiU0AydT8xczVRoSP+uOnpljTPYCXSfB+9wdsPmsCVo1u+Mikt43Lj873IUY/30TYV90o4T/3vLibqDhdbmhehPp+sLFxho0RGmiQzYj9BjoJbcd1bdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIf8X36oWMO4c8yiMNM5khOSpXV6jzQcIoZGXn+wJqA=;
 b=RphYjivaT2sAHci++l290fkfEyzRGlTC/+nomwD9klG1Kcd7mOeVyrbyOXI+hDFFzTVhqU8js4sKq+5LyAc5qSU58T21xJVXpULNEx5aHlJwvGewLYecXc/jnwBS3jVOsaV74WDnj4le91B0Mk32PwzaIAECDz81IbOJosqfxW4Mar6zVwt2pG0s66MWNKss+ZDgXYMPHm+/byV58rzJp9EMQbnP3Rui/3WYvEWhrb/sc2jQmRWfHbUAZ5pHTM6AjxFGj0vBEmZDkrqwauRlbY5UnZ9Q+L9jk3L7uX7kAuelzU1y8AR8V3Rfd1eKN2QduHESG3ghSHQigyQwrUq6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 02:05:18 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c%7]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 02:05:18 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.3.3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.3.3.rc1)
Thread-Index: AQHaW8XhdmR1+XWAm0WqpxGkHnsR17EUHJ+Q
Date: Wed, 21 Feb 2024 02:05:18 +0000
Message-ID: <DM4PR11MB77608A38B6235E4EFD8D954BA1572@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018d90c4ca55-6841b832-b832-45c0-9d4b-dc21e42261c5-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018d90c4ca55-6841b832-b832-45c0-9d4b-dc21e42261c5-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|LV3PR11MB8766:EE_
x-ms-office365-filtering-correlation-id: a4ca271b-81c0-496f-e468-08dc32818d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jFygdykcUaqfossMd2lmJ3RromdBOasDHJ8EKYBXv4vpaJsDzsjhUOTrcPnXn/mwibLUqpcBsYt1q8KfqI8QYb18WKEEQpLOvu+wvhhFD7qX3LX9Ke0mfoyg5IiN2j8gkGHAGHZIxFA/a9t6/ZxgpbrhL32TwRaLFxyFtWZPFNLDTrhWejyaYLVPNwlF6Wcx3YhuY6eXk97DCAEIP34XFNonSR6hI5s+grJdSpbFa0q/sAzSXmWXSAjhYurRzQfSqqpTvLhnOKMa2W7wZ9ofz9WbsoZPC8RIsM71BVg+rrmdzwQYYxPDUzROjVA1EzZB7gRg2NEQO12v+ras61W2cD4+J13T/SEbvtoWtnGJv6vjrhesueO3NEwvhkxXR55FQ5ctPj5kH40L6jUrDDEuG0VtxMBVyHlS0piZlE6Zy3m56Kmayvr2Z6ri8K+HruBGt6P2WkDWJtRueRIY2zZxO4dnMbtNaZR+1PYXMKHYkqzOvLNTBfEEBOOpVNh1f3VB4JeJ6OYdCrZhSPfCEMibypk8CntoMoQ+Fl1S86wGZzxU1d3WOVVekm034kfKUPA6A357gXfr4rAMuBj1nYh6TECrCIdiU+6WqF45EEgpYqa1kRFDIZotXDF7Iizki5LcieYMXlg0DtXqQrAh42t5lw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LjXCeETeUstRssFAu3lGXWRfXTr4y0YATHDZUVBoRTBYOnLOeO7YI/laLFqI?=
 =?us-ascii?Q?aVCIhXLbp0SZti4P7se5xNYxSOKAy3aDtHnFuJ2nnG6HrCNgOJK8gVaCxoag?=
 =?us-ascii?Q?RQbkJHCnncMEndk7/nHAeRY2s0H2KRLDSUevvrm+8YvfRFBdCniwToxE08Gh?=
 =?us-ascii?Q?RYS5jX8dcTqeMFVOycbbUGDzX6Do6xgO5FIBOKZbw5ZtXXrrDRxQqoJMlszW?=
 =?us-ascii?Q?Gq/3UHLeQDIyfwLIVJCWdh4qrSzQnsGqxnwwUWxRb00iNB3i1kZ+94ywB5Yv?=
 =?us-ascii?Q?SAMPc59QXpfEnYn5KLHpKPhacbOKhCK3f3/7ad3ahcn0dMDwild6J1wQAwM9?=
 =?us-ascii?Q?ltxvgiS8vSXMxjO/MQbv0g2Oi48P5nNTbRixSi38JnrDv47bkCLyMl9/YVm6?=
 =?us-ascii?Q?ssNTjWXs0udmMcDCJ6JmeH2YdrtWSwZ+UsE7miUjy6l+lSpkhq17J0ir0fNT?=
 =?us-ascii?Q?k8tOD17FwabaK/E6BrftsM2YZiGodGxqdRl3ZCuNoAC+Ja+Pywn06D9+vfno?=
 =?us-ascii?Q?egKn8vT5FdUxQaHvQ8Vovbge/WdXI+hdsBHUlR6Yu2eysOz1rZIBcHhugmTL?=
 =?us-ascii?Q?6GMZ4ug24itXqwZOfdLLxwrc98mBZYZmgo+6F3dxSF302hEKOxu6hyj41iFJ?=
 =?us-ascii?Q?aabEw2n68ylue4JaPhBGEfdREYEfwcsqL9cfaHCa7PihhHLtpFfeaNw1nHm1?=
 =?us-ascii?Q?IhDV/qYwceeIb8lNthM8UfwfQ56ANh4WOWeWANQe1lhFUxGhQnfb+U+FclsG?=
 =?us-ascii?Q?obUc/BxWRcDNn4jKuy6A8IPYFnr3dGTlrV/QUuTMCT8j/oVEHkZrRMv4v3v/?=
 =?us-ascii?Q?GDKbLFAHiWyFwk1zLQXqfKJAO4cA8kErsblqoDlQIlYHzS12/iQ/+vBVM+tS?=
 =?us-ascii?Q?6Ii27SUhfZPNaIdlCJDgxlvqbgqeEPNA3BjpUQmQYULq3Cry5Z9BZI5DXk4g?=
 =?us-ascii?Q?LRgLWLkoqCI5svgSH/Zo3Gu0KU7IYPHtcncmBtGHXQBVTO23KVbPWBbGBm+h?=
 =?us-ascii?Q?t/+3SS/R24CxDaqVFm/2d9xpkovkRXoxospC+Ovvkfl7RYuw09rY8tB8spH8?=
 =?us-ascii?Q?7P5COU7/SZhRC4EJyqVs5l5BCj3/xjh7Og3hoiP5892ZsmAQI9ohn4v/vh/J?=
 =?us-ascii?Q?Xtkrst0lGms7ID+YUy6duuMPh4g/e60vo8awScdagLx8vftsXXOuqI8UPDb8?=
 =?us-ascii?Q?SFemg1GwxQVXDl5L/ViMtcdscI+O4rX287EtTYiwrLgpfrCIA/18ylNmfMsF?=
 =?us-ascii?Q?vAS+86TlQ/ZQvd8AiT3LcdFF1GU+CfLu+qVEMaM8v2Qgt/QOFyzoL4JTgmnR?=
 =?us-ascii?Q?aH1Su07HdYRDvhBB8P/0TxaldqprqRbxpGO7AZmIQf439A0GfiZHTPh4t7kc?=
 =?us-ascii?Q?05KDpCMnf8bV8AT761j9cjpr2QS3R4IqPh+dev6mCRAMxFP1mJoUyLrjC/zv?=
 =?us-ascii?Q?GocHx2titAxbq0ecPWvm0lyi8dRHUVXrjlIVfKxZnnq/z1LKn5sX05KqPe/h?=
 =?us-ascii?Q?sS8IoAgDkeWUZ6Z1/cT6U5cgb5QnRjCm49a/98gkzN519LP8IPU8SsSYpvBu?=
 =?us-ascii?Q?9Jc896/4SQCOtdm1xq094pa7h3G1D/H0KF3f9esz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ca271b-81c0-496f-e468-08dc32818d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 02:05:18.7187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KY7QkCAqKyas/7QFB9pcByOS0s25xfKVlUtNaod54XIHI1SjwTdUF0mqon2T/ciUDNdcAV86eQVcFNcVJ57aug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195933

Hi All,
=20
QA for yocto-4.3.3.rc1 is completed. This is the full report for this relea=
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
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, February 10, 2024 10:07 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-4.3.3.rc1)
>=20
>=20
>     A build flagged for QA (yocto-4.3.3.rc1) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://autobuilder.yocto.io/pub/releases/yocto-4.3.3.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6552
>=20
>     Build hash information:
>=20
>     bitbake: 380a9ac97de5774378ded5e37d40b79b96761a0c
> meta-agl: 54333533f293cae29cf00948862ae86c8c814197
> meta-arm: 6bfd024269c3888dffef7540b0618b04ee3308ea
> meta-aws: af73d3c35933988ce286c49696827ffe63e5785b
> meta-intel: 8d633bd01e20e31c0dae58cf3cd41eddb2f712c7
> meta-mingw: 49617a253e09baabbf0355bc736122e9549c8ab2
> meta-openembedded: da9063bdfbe130f424ba487f167da68e0ce90e7d
> meta-virtualization: ac125d881f34ff356390e19e02964f8980d4ec38
> oecore: 0584d01f623e1f9b0fef4dfa95dd66de6cbfb7b3
> poky: d3b27346c3a4a7ef7ec517e9d339d22bda74349d
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
> View/Reply Online (#384): https://lists.yoctoproject.org/g/qa-build-
> notification/message/384
> Mute This Topic: https://lists.yoctoproject.org/mt/104272169/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


