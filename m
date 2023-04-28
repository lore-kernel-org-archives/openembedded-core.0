Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78505C77B7C
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 14:24:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.21156.1682691861334764635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 07:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=e3Gh23g+;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682691861; x=1714227861;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=bTMqT3O39YOfNITYRXD8xZINCd4Xf8H9pInycR70u+0=;
  b=e3Gh23g+5JdbePz1GuBirFSQRQPfVj8ZvZRyRMNY9hBaTsIeNLWIsEWK
   hEYkl7qaGeEVKMKUyFng54alDiW49oVIrHp7rVIyaXeEWbGApLIGLpk4K
   NwEjb5+RjPJbzshyMfFnNtHqk6eCb+2UaC3oWNcLInAukCBMTiFPySTWg
   Vg+klfTbBaZPaONchHMbwaTkL4dTZsmjUJAimq2+oAJdSyqv6b2KssKmG
   2I9bCknjuzjqPwIUlh09k4dhq5Yn4lCNR/vyhP8Flu/QljGCiFZg0BONY
   s8SC0pByp2cU2Z74FuSwhTkQLFETR7njQzQlZeIdlz+wIHe1wvVGajAga
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="327383569"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="327383569"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 07:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869213937"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="869213937"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 07:24:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 07:24:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 07:24:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 07:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbXJTTq1BT4mK67oi8usNbXssexTAezgbv2UueuzEXhhRTJDzShIQjRzdq9soxpijKN4foyOtWlnbkOatHBvDMDsrfiY3ptkeOYGhZ4S4FkelEMoMubX01nwLOKh0w8iiXk/UijYSF6kt/EKZR/GZexfwlEPaKkZGKY/zVb2zDQV/waVPnfWerDWLLYsX7QkN7xJtHS/dhCoJ/hlur85qjGFEcCaaYBXsSaNd1nQZDvzhdAvhR5M7DUKRUI0GfFINCtO8opMSVpM+4Ll2Pa0BsLRSzWX2m/STAWI9ARuP/dY7lJwy9QP2qqjv0S66QjV7mJBWgmu1VJaMv4aGYz4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v32qdRC+eMVLuTHz59DCcqFMH804RBl7XFIzO30Fg0U=;
 b=nZkzkgRnElt2SXJim9IsYzZc/7daKlnfErWI8YSaS4Im1kjNX9x+anT63+S789xuybdhpll02sm6v9ZCXqIFM0gqdwwiGoIwgbC6eSlv1ziOZms+cJFbDBN84Y39a9c7uZnPyft4PL4apBnaNsKxKhTYFSTUMijKCEfV6MxvIUhjdmMNpYj2kKoSKBpNdrKzAEhA3O50DCBk5YpDhwEuGaVZPu1UpbzGprd3HQSh+YQmDsgLeo/0jmJWgQaHAtZ2zx3AisJ9um8AhgwN0fHZbzJHvYjVT3vzB/eXkKEzuf6+vi3ZOwGrJ9ML/+PNg+xbwUSVFnIpq/+hDwpnFWY4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 by CY8PR11MB6937.namprd11.prod.outlook.com (2603:10b6:930:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 14:24:13 +0000
Received: from BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4]) by BY5PR11MB4152.namprd11.prod.outlook.com
 ([fe80::cd9a:3c52:72e3:bcd4%3]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 14:24:13 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc3)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.2.rc3)
Thread-Index: AQHZdT+DRJMyzdAcpUG4EwcENOj9ZK9Az28Q
Date: Fri, 28 Apr 2023 14:24:13 +0000
Message-ID: <BY5PR11MB41527D68601E56DBC43FBD20A16B9@BY5PR11MB4152.namprd11.prod.outlook.com>
References: <01010187aa002f65-f0534f17-03ad-4a95-8eaf-8222db417800-000000@us-west-2.amazonses.com>
In-Reply-To: <01010187aa002f65-f0534f17-03ad-4a95-8eaf-8222db417800-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_|CY8PR11MB6937:EE_
x-ms-office365-filtering-correlation-id: 3569839e-bbf6-43f9-0bb7-08db47f43da6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fisA+a+x0F37koyZPPOamcmX1GWK4eEgDMSbeab6zR+aZ6P2gdjwBg5kU/vErh2j1vfUaXImGfa8gQLrs4SUxCZDMRpZ9Raxwb4ZGYFpiLgQtWn2Gcv7eKqmuneey1CyusMdwesVVibMnxq7bn95OSEs2TCbcs1H2/k9h+rg4QyvVyMZBL2L3H1O6DWoeY3rOOamfa5GizM+MwqyyPj7ojtAydDE2ySAaMQQc/JA2iQc+vAwdTTUNXgHGfDoiFxx8r3LPiBlXyy44WzZ2KFVFFCMn6a1srPGPEGGf1sWmib40mVwsiq+wz/52e1hWfrIgntlven0rTLTm7v4t/DKBRd6i+D4Kuu+2vmAHsAYPKc3A8RbK1AlsfEw5lH/ZGhhTPttHrM1gWsS6mjv+euLFnlEUC/XuzsTX8OZDjT6Xq6JuxN8M7Q1AZUHB6ASARkqdyPQj9UBX0958L56OJEbm0z6eT+tMgxu83OPAMNGqPgxlh6G87guSIicK8Fvt5WI2Cgss1F3/Zt3oP7tTV6ODhViAubDvGFtfGTXpLMhHGTL7bEbgseexBJGM5i2U5Nj/zSu2w4ACoR+AKkCfUedXZuJcnitegk3CEUGo6i7smc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4152.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(38100700002)(71200400001)(82960400001)(83380400001)(478600001)(110136005)(186003)(7696005)(66946007)(76116006)(66556008)(64756008)(66476007)(316002)(66446008)(41300700001)(26005)(6506007)(9686003)(86362001)(53546011)(38070700005)(8936002)(8676002)(33656002)(122000001)(55016003)(2906002)(966005)(52536014)(5660300002)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?14GsZYNW9bMOjDhfKG21dCeN247nkR1eol7F+Q3BMGzHzfp5F+oy+OXEi4Z/?=
 =?us-ascii?Q?HY8R+vDq9QWE4yIBXdwpdLzofM4n6S65ZrzcMYdoxovJ53DRVZAZ8VWCRLNo?=
 =?us-ascii?Q?BODbla5WNcC86em23KedHABgbzgqQGgHOyHEtyjI2dqbvNE9dJDUdSWC6euT?=
 =?us-ascii?Q?UGvmX0Fl4i7fzR4wIqSsAhqgiuJg/Tbdf2PQwuOjM8dZWou47K0j+uLDJNeo?=
 =?us-ascii?Q?DYsN/eGphmX9x+eNm5Vcl5Ae0uzZiSxMV0UEO/y6KZelEs1Bk4qz2o2h7M6N?=
 =?us-ascii?Q?kjzwAwP8mjvDwmtvzIvwenaKRt6Y69R0U9u5ht1gKWRuVdeCEap4lXYf6wD2?=
 =?us-ascii?Q?yDycHE3BHkQdCZVsiiht+Wb8AwH0dnlq+VgqX/4G6+eQDu/1NVzW3nfBgsIg?=
 =?us-ascii?Q?tqxA3cSGydR53D7QjSaVb0zmSbh7CMUutipv/cBrMubb/0G7VpW1eU5Sg7ON?=
 =?us-ascii?Q?7mQMnzyiMRjZ3PmXbtgFzqp6wppDnkxq+s+OJk3K5f3nsrT4n8pYU3HqnEsJ?=
 =?us-ascii?Q?Q5RFrr2WCSTvNUxLvOgI7s+mnjCDVPVtvfLtcSb2KrK6RtvFF/2aqVJVMscx?=
 =?us-ascii?Q?+Aeud7i5Pa+eeElGAOodx8PKR2UwxJyet6sJk6IWxbLwk9iIKk2ce5c2UCmF?=
 =?us-ascii?Q?ZdnnIu83HXPhkNjfaDSCehpXx5HLlBL5v4tuIxWvluzRzERatfqsm+MLWGQV?=
 =?us-ascii?Q?3IIG3yK98STSEVAcDuBLj/d4y8VC3b1bHpf7yNNVFdRv54EYrrqTYI2z6Fca?=
 =?us-ascii?Q?rG9624op+N5zd2MbaOX4lqp9oPaPa69EKilaMz25K9kmw3MGSrtLQ46MR5Mo?=
 =?us-ascii?Q?mKCy7F9KQPuVwBK7g+59UaF7n4CstwpKFrzPVWKOLtkU4swX1qlvS0y1HE9o?=
 =?us-ascii?Q?fPglBNoUvI8OUb6ucJ4jnN5NV+D+kZ3nxpA0l2bdjVjZQ5nGkRtqk4KbW1jr?=
 =?us-ascii?Q?cZ9aYhwPRSM8GtmqdTnlrcRo7T/s4VyJ94zIXM9K/BjAZFoWNBoO6H2T86bm?=
 =?us-ascii?Q?dqRf+DxJXQL7cWZG0pmAXRfoK6krgzES+3ejJqkeR2C/TEjZnMwOaoXmqLny?=
 =?us-ascii?Q?Fl7AZnoxBSlmd0oyHVr0bKtZ9a8VvocIEH+wLmYEe3IwHk+HHn6uI7f9zjDY?=
 =?us-ascii?Q?TdueDrikE0U/qSIuC8i0hTSk/WpUlL+07g59KTTwOlXSdvkPtSWhHkWH9rxU?=
 =?us-ascii?Q?uDW9AO+eNEGCXrXYltS7R5SyVb3hcFn8BkN67oUFBR6ZUrfsCnt9+22wGXtp?=
 =?us-ascii?Q?d+6pCmzaHVLYm6zKQl4OnisgUuWQerikxObcpkw1I5dBB2kt+YemBNF+BEBd?=
 =?us-ascii?Q?Kx15UoCq1KrHP1uhlQj+ZFJF/bGNjKZ6PvX2f7S396t31YjcOCJPrzvCJiGa?=
 =?us-ascii?Q?qq6ewGZF2fq84WDt8oxIKwmvqOqU1M3VsHQiDVhxFbeJsv4Vn+M9sncCiE9n?=
 =?us-ascii?Q?QhyG3r3SE7FBS9ieIxmc+3gfApWQL8TP0VCeSgADLxa+PIKO7OCdEoRPgfEO?=
 =?us-ascii?Q?YPBraND4qnaPvmd+Y1S39fzTu39BYrvR98M6FXrrKicmJRLizDPNvHzIivrs?=
 =?us-ascii?Q?z2a2NXsT8M9IB4p+bzgN0K2K2yqIluQB5G13+bW4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4152.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3569839e-bbf6-43f9-0bb7-08db47f43da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 14:24:13.4414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUoGPMpQzjclLic7K7zAJlnJjtcbKzvwoae1nuBrwMqt3O4JNjTpSYq1B1hTWsLI9px2umjQyhwoudWRKvmjnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6937
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 14:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180530

Hi All,
=20
QA for yocto-4.2.rc3 is completed. This is the full report for this release=
: =20
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

