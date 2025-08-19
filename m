Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A6CCA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 07:17:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.8190.1755587866912494362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 00:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FA7EBYm8;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755587867; x=1787123867;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NqrJTMLR8sSBeAANRJEiVNDAqp23foH1fzGjCdJp5z0=;
  b=FA7EBYm8OeyGke/w9/sJuN4hJ114ppRCysPWUNtS0XpqOUDVaZxpByFD
   ZfP5Y0yD2ivDo/to4kiiDJ10bEM/PrqlB4yaLpFGKt/d3XoUtlA5SSLQD
   Q1p6A6HX6PMCdIpG4vYysuEHh1eHqxVkWMAsTvKWO8+k+OYC+h8+rxBBL
   90DyPUopm+xg+tbrWDLlVA+GW/1+DJvo/HusnRmpAfpTGAII0A6o1VzwM
   uGKH9wT6nwvaTlS8Ss5rXgl5ohULqDygB2wxM6F9O2hFlAqxsg2JlpWlo
   GRXrZxDsMCbqaJiFrXmesQQzJUT6Av+D5Oi6M37GkGSZBjLNLHo0KaWIy
   A==;
X-CSE-ConnectionGUID: RUWkPFxuQH2G6NxOLWL9QQ==
X-CSE-MsgGUID: 8Mvn2o83Rte4RzuS4EvcjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75394368"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75394368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 00:17:46 -0700
X-CSE-ConnectionGUID: Db6BVkXjQVeeOsff3DMNBQ==
X-CSE-MsgGUID: NDf0GCRiQ06zC7adHwwN4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="198796049"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 00:17:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 00:17:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 00:17:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.60)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 00:17:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1AA0BwFrHkW3bWOqM1v98AqthahGswOjRK/Xb3dWgsgUTkG3qSFtLDfa2LpKC+NTd34pg9SApUO6ISz2zm876aK1l5UiNQJZTJUNMvc3eFsKLk4yvyL+5k/elteRZe7gi4QHozPME9onlsD/sMlRobc9SvUauJpUFxpldVVrBAB3tvXGzMd63beLh1Ywj+BSnIQDTeI/lwC9r6iryWUZ4Z0yJC9j1anB1/c8Tt/RIWqZM8hJYnPxZSKAcM0/kkMtOx3xo9CednF1FihNUjAtdVj2SrF+lThPwxBZFhp6Ct9xW0m3pwTSyq/OHZvjoWY+RZsx4CjltURdUpMWgRnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09XMQHAWbykWf2aQw6gIk4OmyO3JnIGI4Uj472UOaTM=;
 b=szF/XF1B3hmQkS799is+ueqV4B39QpJ+Nsv7D12Fn9GDcxL+5THBtOd/axQ7UBveGqETXcdIkaBUiiE2MnaRJMsVYdc5mmqJbxeZ8jbUQSciUeh21VEvP35ByQ1YET19Xoi4OnI7cX1GIdN3Ea1MqKIJ1lhaOv4yCLmKOC9ojYHOOSPAkemaMuahLkmnU79ev3/g+/DrDgAjX1i/R7JCUL9LDOt3YT4hnIoX6goNm/43/v1oJEHHEB+PZ3WbV17hFBJD78vDzJXOqdkSbaMHbqRjuC+on8eHrVeDF/urbIvrH4Gtb44sX/gJshw2CZnl+EC1XcIwgHz4/a4gc8iQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Tue, 19 Aug
 2025 07:17:43 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 07:17:43 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.3.rc2)
Thread-Index: AQHcDkpDY1ZEicWvn0a9AsqPjUiv/rRplVkQ
Date: Tue, 19 Aug 2025 07:17:43 +0000
Message-ID: <DM4PR11MB77609439B333EBF7C2354B60A130A@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010198b06b7c42-51779eb9-71a7-412c-b303-16a3ba0a4eb1-000000@us-west-2.amazonses.com>
In-Reply-To: <01010198b06b7c42-51779eb9-71a7-412c-b303-16a3ba0a4eb1-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY5PR11MB6185:EE_
x-ms-office365-filtering-correlation-id: 2b578cb6-4e94-42fe-c7ed-08dddef07d6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016|38070700018|7053199007|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?Ers/B1s+pTP1rAlmmTzErZPYpNZI8tZ0KgfgIVPwhpjoQvc6PgxCkk7jD0X9?=
 =?us-ascii?Q?meKFoZZQKBQkhcnUVVEUdOJ2O0IUmQ/FM4m1Hkop3lx/6l01FpbGhdzqAABe?=
 =?us-ascii?Q?NHdhAETjakMEGMXQ4oAxyqwkvL1SdkmHkWqJEc77szoUkj3AuxVC6mt0ZRoA?=
 =?us-ascii?Q?x97lrtx5Ct1iA7U1HZjynYz+T8Ms/Aur262uNCu9dyIByMftw7C0sXftb6MY?=
 =?us-ascii?Q?vz0si2ZDKkum1xkmZqTfl3hYZid0kduPGO255T3O6JwsthGxEywziSni0lu2?=
 =?us-ascii?Q?eK7faFqe+1MxAbXxcQN4ADDHTRDx6y0ZdkTdpuBgkyG9gzG6u7qnriumyyzq?=
 =?us-ascii?Q?wgu9+2k4EozGVuQ5ikZ4G8nHlKhybKCVA325woaH33P58O9nqc/s93Yj2oCc?=
 =?us-ascii?Q?9fDgSLnqGtGoQgEKMCjK4SQUl7RWp18Axoz5vwPo0CiXHbr8hiTKNsrVOlPs?=
 =?us-ascii?Q?c78oKa4ZdXf2oxWWxztAhY082WFkTo4okVP/zN1tmGpwX7bgRIljtVPAQ/Ls?=
 =?us-ascii?Q?jXnMBCN/Vfw7WYhvQ7eXdhMn1hUFBvOvSLnXIZulvXn/ahmIXnXaYtBQiLgb?=
 =?us-ascii?Q?TfDIKvu1q2QVq3GSfDrvRaBBNSfv0+9LB/n1pV4ldsEw49/7jgyzMTHXJA3w?=
 =?us-ascii?Q?GsQoiS5x0GWLeyLnBxvarauSS3VAYEBtky4Z/IvHMAI5KE80F812ED+Ot/vE?=
 =?us-ascii?Q?F1udiNSDpuzsC3W5J7PcRef1RJphSm1s8GB9Gg13iEVWfSuOyEyxOayfdkTi?=
 =?us-ascii?Q?jl95bWA05t0SBjPfnZY08TD0Y/yBDoAhWv7lxlhgvpWtZyP6ynhGKL3gSqxW?=
 =?us-ascii?Q?mnBlFmXTht1OskDIIgT1KbsDtb2BUjcGTR15aObl5Av+WD5TkK6BZphO7/br?=
 =?us-ascii?Q?YD5maPsB1PQ84HrRmylvmwRYHWfADyYFmekU2haBZr49y4ghvj2ZTuIf3wUp?=
 =?us-ascii?Q?N+nO9rDZ7g3G4GwXLqTLwHncRkt6cCVHY/dVWCOZq8f097YzUbF73LTA6aj+?=
 =?us-ascii?Q?o0f7ocCKavQFw/U2l7OmyGu/5Q/ahV4YbBpLJ3rP801lSeMd+R0Yec2P2o6W?=
 =?us-ascii?Q?iNx5dCGyke5XDc7kIdVA+4bj5wDGs5b6dEpjEqyoFJp6SdBod9XQLYzFvOKI?=
 =?us-ascii?Q?yDrk0uNU2OmOnBaghJFAwc1GPXw9fGEVhet3H3fWuor77AzESlM0JODkEWKg?=
 =?us-ascii?Q?FnRi+I9sR+50feZw/wIPcou0Y6F/4vwYvGft5+BdgldlrLFT/C3zRBuc3Epq?=
 =?us-ascii?Q?+x0fsJPKHEpehKXsusD/jXTzxMy483mQONkalhgiUvV40VXMeMlhfhQoW+wo?=
 =?us-ascii?Q?cV42OHpWu3neTikKMoKi7oQN3X+ilVlTC8eHqmluo92yXfLKp7THblCOaDic?=
 =?us-ascii?Q?OhnmK6tne4B0FYqORsz5t22hX6X9yLrn1QKMIPXp2oGbek3pi8b87m6iLtYQ?=
 =?us-ascii?Q?F1KB5CQqU0Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016)(38070700018)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VTiX7jsJRNT/Qx6NEHW8TXoxEHILgyGbx7w8FewV/I5WVe8OPO3g5jvDPtac?=
 =?us-ascii?Q?MVYF+zScSxw8ITbd3nsgXYIzSVRYUg+XYN0Nuz2iFkI0AJ+ysyitE+Qu2ypD?=
 =?us-ascii?Q?BH5iDVc4+Te5gZSvbufBgNSZ4kx5rGN/3Ae4Sam7db4KlZeU7WIvWR8VGbkH?=
 =?us-ascii?Q?+jt703jQ0Bd6Upe3KWr543DhOXiJjh1vJJ2kLCordgWd27EyEDLH8mAie0Wi?=
 =?us-ascii?Q?/Ps8nTRBGr6lJGi4jerj/ZaZBUy2LZrMjUtVO+VMia5SPAEjkfMJzF0w1CLq?=
 =?us-ascii?Q?yVJFMf+yc5zliEklcv8XlgiKbvBMAF9zBQq9c/9EwL2MQYjEsMtEc8GFuLPv?=
 =?us-ascii?Q?xNjaNmEI62fPGW6HDo4i+jlgPtTTpin3GaO3zaZzuqqsBwmlmZdxBCoVa/cN?=
 =?us-ascii?Q?G08j+21VR7LLySKEepg+DvRVqCGqEy5U5OCJ9G8DYucPhWuse6vr1Xjs5BDX?=
 =?us-ascii?Q?56BeEuHuyop6r88LlQRfAE+l+gCmNUsGD3zF5YK9GGLfxdWzv4y5fzV9iyiC?=
 =?us-ascii?Q?9fZA18B+1Qf5OsT4d52wzy8SF1QSEOHXaH2NhNfQXrfyk5z5cDrnEC8E70eA?=
 =?us-ascii?Q?YvDdBRCUTNAV9o98I5aJQXx8L2JKsaJm73/oH+naTIIfj8Dfz/xFmD8A4mJt?=
 =?us-ascii?Q?CQ5PdW6N/67HlN/BXdMDkG8J1vIhMgzNDsKaC3owxWeh1K+O3AIqJ7kfXZ6l?=
 =?us-ascii?Q?TdmCExLL0VrRKSD2YpJlLPH4zM99E+wDvPdAksYg4STROKe9p4uRb+m0t+aE?=
 =?us-ascii?Q?3I2DpJI9HUXCCx/w2AouQ8Apf74l2K582diM0OPMDxTuq8GHWlMSGvKqg7rF?=
 =?us-ascii?Q?OcZ0OV4r6ZS9X9UaGhq9yzqlTtvJeXuU+KKu0DUCmJd3IFmWn51XqkI95JwG?=
 =?us-ascii?Q?uK4dhN5/V/BjzMAWr80spnshu9fPWAe0EmIDUcZGkncDeXPmgSX9fL9j/670?=
 =?us-ascii?Q?2l9KoZb0V7XMzL9t5AHapH9MPxPWTjuQ6BuJ1JMKA1EknLsjovk2+8GARHtB?=
 =?us-ascii?Q?qEdyVyGet9pdVfjmcdaQ1bqe0++BNlsjUa3ch3dShlX97HVEX8cl0XjUTHMT?=
 =?us-ascii?Q?C6GGkpx5logM6s9Pm8zlG+Ki7prnACE9dpQib7QKa7yG4uRd5BDMSp21eytd?=
 =?us-ascii?Q?GjS+3l87/K/T9FW/K7e0lpr+rWX9eDqWQSjb+u8m9Gl8kr41kK9oyJkdswMl?=
 =?us-ascii?Q?XOIeoyj2TGbZXZ7RhmOmYHJq4vJUXMGNnOq3GJsziFbyoT2s/f4XZdYFHApB?=
 =?us-ascii?Q?hht+35qwLqRuL30Wm3jw7d7lyEOcELjaR1zOHIYvokRVkiphfTg32/0DFqw3?=
 =?us-ascii?Q?uCNzYLEpbutTdfNhZj1O7mub6cHY/2TRfGez3z5MKYM4309fsFKHiOOyl1DY?=
 =?us-ascii?Q?1tApDs3eXxccCsjWn90l1xWY8TEzSbu31ylbxzu80vVHHLSA+J+thGGhT/xM?=
 =?us-ascii?Q?iyTVFkptPgnygOI7ZuErMqrfnJXYruoMMtsz3j5DydUfnCx+m4G54uNKOcpN?=
 =?us-ascii?Q?yYLqZ1zvZL14TbylbN1W0a+DIN/6VhXWtxaF13ALbjvKZ+oHih0jHCy53BBd?=
 =?us-ascii?Q?Z9ILOJab3aZtVtIol2OBEK7phPbun0rWKL4wpmzm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b578cb6-4e94-42fe-c7ed-08dddef07d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 07:17:43.4267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLP3zPf/Dwp3BX13Vn92QSwCi+uZ9r9eGChx4CyrPz1oqADDKeBcE3UFgcdguxS9h7VApl7hrujnXbZXM4S9cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222075

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.2.3.rc=
2. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Alder Lake-S=20
	3. Arrow Lake=20
	4. Meteor Lake-P=20
	5. Amston Lake
	6. Bartlett lake-S
	7. Twin Lake
	8. Beaglebone
	9. BeaglePlay
=20
=20
ETA for completion: Wednesday, 27 Aug 2025.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, August 16, 2025 9:08 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2.3.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.2.3.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.3.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2213
>=20
>     Build hash information:
>=20
>     bitbake: 710f98844ae30416bdf6a01b655df398b49574ec
> meta-agl: 435a9b13b8486cf7d51a86cebaa72ee382202a50
> meta-arm: 2de04c3d31e119d4bedbea24b9c63a8c113a1ce3
> meta-aws: 3cd3b809390120059d89cde45b21615bb8948be2
> meta-clang: 003cba92e982bdd565a6889f28799f8bba14957e
> meta-intel: 5640f6592c984f4832ff5f2ed1a35a607e5d21c5
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: dca497d728792e3cb655c78455c2d649af312ce8
> meta-virtualization: 898239e810acbb7db93299f20deec8afe434f11b
> oecore: 347cb0861dde58613541ce692778f907943a60ea
> poky: db04028d9070f05c3b5dee728473fb234bd24f05
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
> View/Reply Online (#586): https://lists.yoctoproject.org/g/qa-build-
> notification/message/586
> Mute This Topic: https://lists.yoctoproject.org/mt/114728690/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


