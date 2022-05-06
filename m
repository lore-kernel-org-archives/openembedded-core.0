Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F8FC433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 01:36:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.4701.1651800971462032181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 18:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IG8x25dx;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651800971; x=1683336971;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WnSBKIrBW8r+HyjEAgS/z8PQ2ivc+dOjSa4XekNxS5o=;
  b=IG8x25dxhGF1Ld6Y6XKlPdtvjdKgWN7e9E2sA6RbNLPaxeiqW2UQT2CS
   3uuYP2WfFcOYhPTK0+AWQihyWphnuOf5R+30cj81qDzW0E0v4tMwukybZ
   ypkBubQU9W39cvcHLwCGC2dMs1eOHRSX4/7nEQFI8FjHSzKLC9xkPlHVq
   QUtHLSrVBNXSq+/07z8C9f4w2rKaoHIQ4BeGkrDoX5xdkMIT4HvqcndiF
   DerGmPysvQTp7WykM01zjImx3nfTNdOMJoSSa/uPJz+zMofx3Ki5bCJvb
   QFH4XrdVu+0hTFB1RsvV/kQqzJc7VB5Eizu3qugLBsYO+Y5OpfQjYNojO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248219632"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600";
   d="scan'208";a="248219632"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 18:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600";
   d="scan'208";a="549630541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 05 May 2022 18:36:05 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 18:36:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 5 May 2022 18:36:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 5 May 2022 18:36:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTE9fMNVBs+84hW24rXA+YCNi+nltE7D0PQQgwQOqV46rqLA9JLvjmXGoJotzphCk9sDwGmrzMH1hWWn7e+cH6mEMDq0q86GwAGRWTYX3SXCsOPAoZHDL4ytOt6Z5VSWNaOiad0E/DNtDcML2QDgmCxGY8amqQCGWlffn25L/gBjk2EOpFbDC1L59nxFPOt1GYq++JIcEeCmVVy0ziWTmHFRP7KHEHQ+8PopkdIbiHglnNSa9NQeFpTFVpVk8/KJ5dQMhF6blkeE3mDUzVPg8BtbBOsYtzV261JM/0JSqKVvP3w/reYjSBJZjWJxhyeJRUohGlq0mKF2B/ZR86J20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnZgrSoorvmdvXSz4I329IIyZ1ab4lfE9PCY1o9VrQk=;
 b=FEMDwR03L2UAWqKXYfo1+BDrNeBgK+NoR8w74Qs3gF4joLPWoTj0mM/j8fE9lv0YpTu7FFPmYoyHZWla4gml7HhSqaffJ3sBDU1GQAABj4yKM95A+od52MtzG/UyxsyiC+UaJ1kqm7HLFlYtRb8jOrZVpPMlUTBc+Du7wL7yI3YLbFlU/CL59KaPXHfYI5ZJ4CP8jccuO3vMyTM2Pnj//u2SK3eExpO7Xt2j6iYiQTkSRMod84yc3QTgjAbecr1gKCeq35vttTSnt5ao520lzpOVza7pDIktgqK+X+mpG4wh2saNlgvcOU/FmG2/icmOKfUkuXO5/+vHHaKsUil9OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 01:36:04 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::e536:e531:b15f:6076]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::e536:e531:b15f:6076%6]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 01:36:03 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.4.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.4.4.rc1)
Thread-Index: AQHYX18zt7Y0tlm8VEuJFd6fXX7uGK0RFBIg
Date: Fri, 6 May 2022 01:36:03 +0000
Message-ID: 
 <DM5PR1101MB23483F838405F3A006D16D03BBC59@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <010101808ce91651-962b6832-98c0-412d-b766-0b6f9cfbf3e0-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101808ce91651-962b6832-98c0-412d-b766-0b6f9cfbf3e0-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8793ac5-9288-4a1a-5c21-08da2f00c8ae
x-ms-traffictypediagnostic: PH0PR11MB4950:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB495088B675B0425C33D78FF7BBC59@PH0PR11MB4950.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OvA3joR3LG3RzFKiG4XZYCNgLFjeDaPFBelshbo/oA9Y5z6ZkhOGQS6bK2JjUeDTJope/BXVFNpIAs8Apfz1yDUXAQ74m4YZFpwxOI792aDslfFfEHaHPCc3/xirOwXkqGlYj4JIrxYoU+NGBolr3/iRI35jNL11vZYXtuFWSYrbQb2gVxwXPrcJhN+EJES6rJS7MqAVG8jy+RLdDy/v/IOFKFjApDCaovgovQwBOSIFtLSrrWAY8QcVUPhRgnIY/eJG8tFf0tKwd7/AVzO0Xo8nCJENpKnwgPDeVEUYXEsrD5Cq7HBK5b6k3GF6poDPvY12yLw+5pawFAnLiVHb2HhMkvod5jCOWD/8xbh0s1Ez8A93G+uchTj0t91ArAPhCmqxFRUT0dK2Isu7tBJ9R/B/K+yzSjQK+o19OCzefsPHI0GvpOwDWWW/ZQMQ1qAplB/EvsdrbhZ7+UW7hphZRhIyqccJwXpbTz+Y3C6fT9IFzn8Wfga80lBNdf53/8SK9xVqBtr4mvHKA1QpiykSQi/8Xa+O+t5rsxrp69uGuXh2OLHS02yZsXMPuARCRTL8e+NzaSUNQDZRgLUo8B5/nrKvq5nnX+mS77+4e2GrewAeJ+kiRsNeR+iZU0JlxzkcAcp/AKnnk1f/BIX0ladzZjGKU4GoyDfuwsg3uB9cc3vm6azm5n/Cr2czFi8KDTW/UCmlDGgBzmXlJojH22ENYt0pxPfeuSQXGOrlozdeI0KjVp1OGgsI+m77VXdqyg9q5IxeonXfTFnnr16bZkwKODcIQ6uVciu+w1G/CX3tkaQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(55016003)(55236004)(53546011)(6506007)(9686003)(2906002)(15650500001)(86362001)(26005)(38070700005)(122000001)(38100700002)(508600001)(8936002)(52536014)(71200400001)(82960400001)(7696005)(5660300002)(8676002)(4326008)(76116006)(66446008)(64756008)(66946007)(66556008)(66476007)(83380400001)(33656002)(316002)(186003)(110136005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3XtkjGCChovWWfsXT7AhPJrPZnarQ77BGmnAdbzG6oWWolQa4X4Ti5tWDlvS?=
 =?us-ascii?Q?ebn/Hr0GtiSjVhwyWjzBBqBUhFHdcUuVAzhpQ93Vfae+eCcobzmiD0M/xKqX?=
 =?us-ascii?Q?pY7OjqZ6SN7Misv08KYaE87lPMRocwYxcyUDHCDb61DKKZzuUx7r1n03RFvi?=
 =?us-ascii?Q?Yi7KYs93MsfA4q3WHo8iJPQ8aBpQ8wn/VHLJsJKgj0PNbfxSiJPJIRpVKqzE?=
 =?us-ascii?Q?PtlDjhxKifNqkt3KQgAwg2eLz2IBZrNPOWzrgNR/tLbhfH3qywI0o0BRrAqA?=
 =?us-ascii?Q?zA3sMPipNaiZETDctColPyi6uLOdlFCGZSy19Q4QofDj++RbMyHgCltFKAVk?=
 =?us-ascii?Q?nMbe8UvU8a8L1O1eAQMBqlZopqpOGf7MCAPldAi5NQ80a3oTk/+D7A6aZz43?=
 =?us-ascii?Q?voerziXRVUH8mT2N6JfwvwCMwnmG7GgGVTHbzeBSCbw0HLl9r+U8Kd+tVyWW?=
 =?us-ascii?Q?83H7lv0IAtoPBwWMu9CsyYkLg3qEEhNYT9Tfdm8jK8p8Wt1x06iuVCPqHdMo?=
 =?us-ascii?Q?ef33pSw2tOqGM3CFvA2BMCGiCsMtnfhDRd4T5VkyXcxhx+OD7Vxi6XERUZS9?=
 =?us-ascii?Q?8mMlhT8p8Wf8qloLI7yRjhicve/MzXJvM1kNqUd8fQuD5u5REK8t+kEZxzNX?=
 =?us-ascii?Q?TGI6pxJvsci1/teGaA7fuGAkbsj+g2k0XPenbl4q3eD3FohPdSQJVAR5rdPI?=
 =?us-ascii?Q?lua6fkNlnHixIQyWEIFxE6oh1VElsxTyaRKfoQ2UTCVCU93WTlyfIOAjA6EE?=
 =?us-ascii?Q?ttPtkOKbwfvZGQas0A/EUsUPOS2HEJ3nAbfsVkcS49QNkywLD+spgIOu+llZ?=
 =?us-ascii?Q?iPYsJWdAeAquW2vxDPAbph/gSqmEIpf15yliRyLb10orEjSL6aelSm9n3DSk?=
 =?us-ascii?Q?fPksb1XEX2Hr29yzrI+0ldzHfBzArhvUiA/jZ4tXyk+HizvVOh4OPJ+AfkRm?=
 =?us-ascii?Q?LIa2a9IC5Jq4nzbr+5T6DRzInOHSbzyv1evqLsGPy2xzuoDBdfvwYXhN1lVd?=
 =?us-ascii?Q?5TNPwY1Cpl+TLi1GfRj8eQwZAgDZHFEL22qcRkqofyOpIuBpFLFtO9iOb4Sq?=
 =?us-ascii?Q?yTrnM7HEqQ2kbcUTIk05pmCCAmXdmt/oyfAp2e3neWsTIjAwg4q1jmYQCdWt?=
 =?us-ascii?Q?wDwemX6TbNrwf7nxAizUBj218b6HsBOazKjrtBC/xlVzVA6mGn98u5disxZf?=
 =?us-ascii?Q?b4fIiJ8ryze3fVals9tqG4tq0FGgDQP7tTWGtGlwvc87RJNLmQQJQ3cxdKwm?=
 =?us-ascii?Q?ssTkp0flecRNXHKBtcb6Il81KUJlcfQK3J/cB3P7uGBE1LhtxZ6c+lV5qVMt?=
 =?us-ascii?Q?Y/7Np6jcUKavou/zHBqspWyL64v1QrpSrqWls/sQRP0ykiWXNm6CA8OOvUXh?=
 =?us-ascii?Q?7jbaNH30z3H43+XrPdiJu4aSHOUiwgVzqZQ1Dn7qfAFFNNFZ9a5Vl19lvv3K?=
 =?us-ascii?Q?MPSXWQUoNAcI/t9eT0iMCtTYXMflgDkuvuPgprlbj27XBn1DGxkusW/yQ72Z?=
 =?us-ascii?Q?xc9oFpqyKkisXKSRJch664Fc+wDcbeWTpxnmGlFrlx991TKiwhbYhCmq5l9z?=
 =?us-ascii?Q?LYiL/2s1BP3oGILx56k+TAPvyddXc5rMjQaOWs3gmLcNWuZgOvU8D90J7h6Y?=
 =?us-ascii?Q?h7wmx05GD3UpdKU+Xdk8Ift7qgEsUK+AzxmciwETWDN9BGvHrxbjxw13LtmS?=
 =?us-ascii?Q?SxpJ7uGtssoqeETGyATjanZT/g1g3Um0gvwhVZ4oC1W0LvAwgIaB67Xr880Q?=
 =?us-ascii?Q?0ayd/o0aOQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8793ac5-9288-4a1a-5c21-08da2f00c8ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 01:36:03.9565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 4yKAExkJCGpfBV1fkzNUD5NPR3oYn9ZfJ1QGxPg0fHtuLl7+wD6da2mC6kwCr7GfpUL88vPCEQAfN9bRNPOpgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 01:36:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165314

Hi all,

Intel and WR YP QA is planning for QA execution for YP build yocto-3.4.4.rc=
1. We are planning to execute following tests for this cycle:

OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw

Runtime auto test for following platforms:
1. MinnowTurbot 32-bit
2. NUC 7
3. NUC 6
4. Edgerouter
5. Beaglebone

ETA for completion next Tuesday, May 10.

Thanks,
Jay

> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On Beha=
lf
> Of Pokybuild User
> Sent: Wednesday, 4 May, 2022 10:32 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 3.4.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.4.4.rc1) was completed on the autobuilder
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.4.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: c2d8f9b2137bd4a98eb0f51519493131773e7517
> meta-agl: 8543843eeb47fa9b45786d3e09bf497fcd5f95e0
> meta-arm: 2623e69db362b357db45c343e6d504909552c2d5
> meta-aws: c92344938ab4d37de8bd8b799186dbbe3019a069
> meta-gplv2: f04e4369bf9dd3385165281b9fa2ed1043b0e400
> meta-intel: daf5c125a744d45d8fa395b576147edd5a714f5c
> meta-mingw: f5d761cbd5c957e4405c5d40b0c236d263c916a8
> meta-openembedded: 9a0caf5b09e14a28a54c3f8524d97530aeb8152c
> meta-virtualization: bd7511c53b921c9ce4ba2fdb42778ca194ebc3e8
> oecore: 1a6f5e27249afb6fb4d47c523b62b5dd2482a69d
> poky: 780eeec8851950ee6ac07a2a398ba937206bd2e4
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

