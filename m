Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67091C7EE25
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 01:44:39 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.79416.1684115076208215769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 18:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=kurUX/mV;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684115076; x=1715651076;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=BFQX8Apw2AwMR6RW0tFLCHrB1kXJo0p1Cw/dJwBm+WY=;
  b=kurUX/mV7mWR7BZRKfYRqv3zuMoyTZ9tb32wdZxC45Qb8plvsOTYy8oN
   jVp6TPit4pIqkPbjVqKSY0HrhayOZNbm64ES7+76u/8ajK5F6BTloVUS8
   o+42EMsFUgKLkEXCCGluVeARIpZMDGwiy/c8l5CrUJM2lpXL262eOUj9e
   MxWllmRv3479flOHLlQS2EvXv2GtmH6hH2QqL10JkEbdaws4Zlxofttn2
   uCqZ2X3733MN9q6u5fQE7DSp2rcB2LVE5XJj1HF2W/l+6H9k3/eL6ho8W
   b6wtlRYh8ulp+8fo0TulfjijvqgiVmT2O3CzVgX/J2lACTexUsoabpSaX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="437424419"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200"; 
   d="scan'208";a="437424419"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2023 18:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="770424808"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200"; 
   d="scan'208";a="770424808"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga004.fm.intel.com with ESMTP; 14 May 2023 18:44:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 14 May 2023 18:44:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 14 May 2023 18:44:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 14 May 2023 18:44:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 14 May 2023 18:44:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMl5P7DGZE6uBKMQHX/RpBklqy7qAVV3lc55Ia/IPLNcvS1nrg3df7enhn5oCGfyVJpgL5k5QnieRFTm62UdkAOSW7FI55OTqNhuzDlLbwSGLhCaSKvxTGbuIFwUmxAzvQt+jkjd8H6lHuxYdY06HRZ0P3xeJYZm8tKL1lyHoe7vnUsemxiuv/M+S6pXIg9dLVr940ORtjUlhnkdF/TMZwhDTsC4KDYodX817l9nWRYvJQJFLj358GtuoInH9FykUkbx9dWH9QoR0gocOSBBWqcgjcC8Ln90DAdtSUohzAHakoBfUiLSpc1nL/ig4zN/3xWZlLr1Hwre+q8rzE13Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbxzs3ld1/DRx0gnLyl34rCD1DpqZ9gbbeYpcqaqzqk=;
 b=kfonE8HnlgK8CsWffZ9PruQwwGx59jrgNNl9M8FWy3CU0eFAU3XoNJ8uiBbrcy8EizYfMjvXViGy9SmfWtpfJUDjoa3+muSm0tNx+MFT8etjcznv4CM5Hi8yZihQ7QgMBbtlexnIzPc9FDnjtlXg53nqC0+iuVhsw8kBZ/TEBlFfTNwcNmfH/iOnlmRRolm0qrIM5K9IvoNpPqoyxb97LU594m/aswjhSpiIcbGm+ElxNWPh9ZbO6BMhrh+hyI2NI71pqT70eWZ7cD83GT5gAuZdH6A8nz22Felzm0MvuFy7L4bkZeC0G0OJ8nf1vsQHIjKlZY0Y5IK/Un7M6Fb/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.30; Mon, 15 May 2023 01:44:30 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::ab5f:f78b:f603:652d%4]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 01:44:30 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: Pokybuild User <pokybuild@yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.10.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.10.rc1)
Thread-Index: AQHZhSfP84BGA4iNTU6y7HPYqNdsL69akvLg
Date: Mon, 15 May 2023 01:44:30 +0000
Message-ID: <BY5PR11MB4152AA8CA070CD3B28C294F8A1789@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <0101018812405f57-8bc29844-a56c-472f-ab1b-b82329fa2ff2-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018812405f57-8bc29844-a56c-472f-ab1b-b82329fa2ff2-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|DM8PR11MB5653:EE_
x-ms-office365-filtering-correlation-id: 1dedba5c-2716-455c-a3ab-08db54e5ecec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RKOiTrI5Gtwe1CrBIj9bRWKyj9UJDm1iufwVR6hWLbSMJOdnE/xQScQUsURuebuZTnAKqgeOXy9lZbfRQwKQyfqLKNfgvXUYOyMx6x8i4fErJvmWfD+04DOzAjhXD5jyWJG7KD8sxY9/T1MdGA8CbNiVyy49gipjzDKf936IQOugu1bUKQXy1IRUcoRbMjJp6DnvfNQQvqndgNRtK9+vs5d0ZVKTxVjF3wNPbc7oJvio1vpB1vDC7vtZu5Ozwj+7PbdifTp6MEeiByPJGl7gYsE3Z/YBelAjvgCBpf2cBXNi2MDJZWyi5XI9VNRS1RStqdU8ugSQb6CcrerR0NwnQkC98yj/KHffgvzv3zYQHU6LAmc2lPZHFdRhCae8AeEczpkfmhY3EuICguf666lL1JTldvYWSvLyBVhKYkxZRSTShYwBZU5IGPOh89KPOiKeWlqd8uVjfqmZfvd0pgUd7iNSlS9DMye6pAbMRVehQpB88XqEtj66hRj5XEkTCi77iPcx06ughigl8t7X162xeMfR+rtpU4SbM5C2KpGpq/4xKQunV6zeYhYJ5WWrfRanMUyYgMONKWeuug1u2vsRHENq/eGY3kICp4NeIG2Ggfk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(33656002)(86362001)(110136005)(316002)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(966005)(478600001)(7696005)(71200400001)(55016003)(8936002)(8676002)(5660300002)(52536014)(41300700001)(2906002)(15650500001)(38070700005)(82960400001)(122000001)(38100700002)(26005)(186003)(53546011)(9686003)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Mty9ZcNLC+UOTGxkC+mmVF51Mp4qllxd2okmDnf+VFVclwZS5HF7ljY6Yai?=
 =?us-ascii?Q?1t9mqC4XuprcLlizRlfoWw2dQ+eTgEOb3n6yJKq/4hQ5tFUbvKHipsYbF8bV?=
 =?us-ascii?Q?x9/w77K/b8U0iwAt9tNb+iScu75JgzBpdL9U/HIb3UpQv4cII666gUtghQRT?=
 =?us-ascii?Q?fuOeIIt5HPFLvOT8Jq2JlJsSRis2YIgSL193JqI5Thqli4lxTIRz2CZxpoww?=
 =?us-ascii?Q?cFqNeekMN6u7cj9+zvizzyyCWWCWP7vfwxMsw9ONJ7OMVd/68C0l2mXxa5yG?=
 =?us-ascii?Q?sWkuPDkoZyUXenqTlWufd4UFK6hQaau2bfwpyKA8OvZBvjheWCK4eSOlGKL1?=
 =?us-ascii?Q?ovTa/RtFBCRjZ4NNViVoiQY+iMJQZUlTVhy0OYwfEdXTB9Mrwt/7YV3I0stO?=
 =?us-ascii?Q?OhrGgunoN7+gHLfM/I2E/xGF3RFd+Ky1sCBeH7e3nI/WPfMmabh76wQVaqux?=
 =?us-ascii?Q?XiMQn+3atw/Ay3HZoBYeABO8ESDT3jfd0/50A1e7P9H+gVIcCJB8Dn9wmfmu?=
 =?us-ascii?Q?hQueSQxVO5qQ0iuTTx6QRkp5J/oeBNe3WGOLkhkYfOq5xSFlmHHmhef/rV9N?=
 =?us-ascii?Q?UxGKPzgC/3+wK7JJ39nBc0GZL2nBYcvfLRyqHcJhQf3vfvcJ7wC9WZl9hOHI?=
 =?us-ascii?Q?lpRDpKLvIyLwrRPpwc1gorFYF1U0YsR1/yaH8ovVVQFMfwpYrOXS8xCxeXpN?=
 =?us-ascii?Q?ABcEHnBZulWhwboDZ4YnCMqglZQp49dDU/MfgUkSuLiLiwBZ7wUBsIihBxov?=
 =?us-ascii?Q?4Xru+ptFH2wLkQkegIsKuiz8IgXEf/tgsvVWA1Opfy7Ij4r2ESwdVOtY+R4P?=
 =?us-ascii?Q?bFZ4H94VtZJs5AIsq74daUUoHtrWcNKIgEq52A4P3PX79OP/zkhKiycMb8n5?=
 =?us-ascii?Q?y94bseIHz4fvXJ4aGqJKqJ4CKo5uwTo2sYcmuh0SCjIU8N6RBPOl8tS5f1cO?=
 =?us-ascii?Q?AKEW3W+kAh/zRGuSoCAjpO8JI/ddzSaGPNVlsUIzBhgwuWQCjZpl3q3w1Jve?=
 =?us-ascii?Q?ALsVFqDN/dR1bftsIEJiFNlaA9aVGqopjYceMjSdGSGiDJZsLSNc5pO28w0g?=
 =?us-ascii?Q?1DdHzzzgSc1Gs+tKhIt/Lm/BLiTcJiWrG8EBQz+XFeNGmMFQpmlC1PSI/8zj?=
 =?us-ascii?Q?evqDAzX3ki+SMTqjjEF2DZ+X7CGPQiMmJ4i+7xR5YNFUTFLIJvQoNVmR74rt?=
 =?us-ascii?Q?aKVNEzz/rACV6nlOBn+5bLYQAKk+KKMnXO9lhwDT07KaEyOLc2a8G5lYxwOQ?=
 =?us-ascii?Q?kQqJ0Gf5AWwpMsbs8numGx9rc7fZ4cnEWcsP7lF76a3VO9NFK23Nppnr5MSm?=
 =?us-ascii?Q?qnJV4U0jNzp0uEqztIx3oWSaUpuScFi0Y0/11EUJ116ltbtu/SOi+XKBYaoo?=
 =?us-ascii?Q?FRrxvFV+DVYXMqTKwrIdtsMhK9R5MEukC2+tD3NafRLd+JrggdEnPdYfJnPH?=
 =?us-ascii?Q?JtAd3cCLvmXzVwGMAR9ZV87dbw9bqAdfR6igVJGKgBZl+S06qRZZjDat9Yyv?=
 =?us-ascii?Q?DaJxen+bZvQ6tcO3AQhSmPIuygm0GlaqX3wlgwaEWm7vn1lsuKQ/EMbt5VJc?=
 =?us-ascii?Q?Zpg4253c+R3/ZvsHdTP96APa9m3YoC4MdgfRtlpb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dedba5c-2716-455c-a3ab-08db54e5ecec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 01:44:30.2083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VpOp/tT9VvF8DLipIs8g4IVx5qBBa8Uv5kEvAGy+CAHU0oHpmaQcw8O9k0+A3ldwh48f0diWFDDkHDihuTL6+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5653
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 01:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181220

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-4.0.10.r=
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
ETA for completion Thursday, May 18.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: yocto@lists.yoctoproject.org <yocto@lists.yoctoproject.org> On
> Behalf Of Pokybuild User
> Sent: Saturday, May 13, 2023 7:16 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [yocto] QA notification for completed autobuilder build (yocto-
> 4.0.10.rc1)
>=20
>=20
> A build flagged for QA (yocto-4.0.10.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-4.0.10.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: 0c6f86b60cfba67c20733516957c0a654eb2b44c
> meta-agl: 07c3fbfb7716c290bdcf3931f27bea1a36fb6520
> meta-arm: 96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd
> meta-aws: 9eb2b598358cd0e1df29f6d347e3e62ff4161bb6
> meta-gplv2: d2f8b5cdb285b72a4ed93450f6703ca27aa42e8a
> meta-intel: f709b3f2b05e2ac73c6734dc2a213382b5eaf579
> meta-mingw: a90614a6498c3345704e9611f2842eb933dc51c1
> meta-openembedded: df452d9d98659b49888fa8a5428a0a8bd3e3aaec
> meta-virtualization: dde0ff9eaa301ec5bd3daf667c7966cf55404d26
> oecore: d2713785f9cd2d58731df877bc8b7bcc71b6c8e6
> poky: f53ab3a2ff206a130cdc843839dd0ea5ec4ad02f
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20

