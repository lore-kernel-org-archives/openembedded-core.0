Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42863C83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 06:16:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.53153.1751869011312839379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 23:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=FnJYx582;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751869011; x=1783405011;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=uC6uE8/VJwChLRaoxnNO4+ZOym0aZ3BhDf3PNzZU0wY=;
  b=FnJYx582GT/z2GuR0eO3f0GlDQuAe+iwR9VGN2sN3Hn4KRR4rr15KzbK
   EKCa9FKGGP16r8MqjXSNqavggMu8VgTtAzOdg96rF048Iww+66/Tkvf8z
   mwKVWt9ihGOEcy0ReS/TUGn/wrDrSr4xPQWQGDbhLeM7K/dnx7W5m8B4z
   YRKd6Y60His6iJxidRXQ00IObBhVw84oCj0USFftJgRh2141xF87G3AON
   bheQmIwCPVsZD8aoo69Kgqqi9RtZtm/F7vAb7ZU3RMvXvdhK3OMdRJbIS
   b7o2lt/ALNSzuyysM1oCHAJLJ//GtUE4uXeJ40ilYdBMCCuVIyXbXwh1u
   A==;
X-CSE-ConnectionGUID: A4M2QKglQWOkGICbQ2J6Tw==
X-CSE-MsgGUID: oJ8cL5qTTsCWPIqmfUtaPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="71516136"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="71516136"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 23:16:51 -0700
X-CSE-ConnectionGUID: WastjvRrQOSFD37mnsj6Yg==
X-CSE-MsgGUID: FoKwW+/QRaevXtFUaOPDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155487917"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 23:16:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 23:16:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 23:16:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 23:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmoHeLQhI8g/sQe/zXMiEykytjDiseEVPWaW0r+bctLPoPgKXjkWOERCWZ26jwN1CHOZhHXkKXa8mcCQmbz/njNLRsR/+LYtDkfv3s1+vH6gxar0DJrK5xyZyE7sxhEDn8zeTVpTd7LN0V6wNRL7TdnPCCNINHXEZeiRVF6oCLLuabywjN6E7ogy+F4ou+pnWcBeKWHGI4AoWO9FSfr4uE+Dy2O7UaOE8jos57p0FM7yoniCl5p39bR3+oMsycpI+T027Gsi41GjZC7yZ15lil09hfsDnNb0QvgBpctrkktXqvNcScl6q1/x4IL89MF8smTYAZoaKPMayTaZ6EQcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=296tLOErD1V2Op/dUc2LkbhV6wKYoZH1Icfnp3BRJ0Y=;
 b=NtJyNwnVVBxirfm5Ur8WMJtismHu/WRwRvQCeEkDcCesnIRY9R4qcS9C9RbhEtY3D1DET8A72+v6qjkEuAp8S3nSh/z7HBQ4ibETWGtZQicXCSD5mw1evqVYc2ogfEzNRvtHR9qpj2p/OHvvIOQpZa7+9K8mdFB56ppTNGIs06QWmaadnK4+0jkzYaHtr7U3NV4vH53alUcI2qV1F+Vltz9VnNYCyERWXUamLVGI6WvfMxUJqBfc1E+0Zf5NAxiFx0PfagFt4bk+A1r1pIqfsg31Z9+SdBMuj96PKhD4JnoN8BH5qXgYt7KrDR0wDKmoGAQE3l71g87Es9zF//dUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 7 Jul
 2025 06:16:46 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%3]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 06:16:46 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.2.rc2)
Thread-Index: AQHb7SBP7IijA97F2kCg8BSGDOK5orQmMH1g
Date: Mon, 7 Jul 2025 06:16:46 +0000
Message-ID: <DM4PR11MB7760A0E6ADA26BF4EEAB1534A14FA@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010197d713ba6f-e2642c15-ef64-4874-b369-deb0cd1af702-000000@us-west-2.amazonses.com>
In-Reply-To: <01010197d713ba6f-e2642c15-ef64-4874-b369-deb0cd1af702-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|CY8PR11MB7196:EE_
x-ms-office365-filtering-correlation-id: 9fbc5eb5-99f1-4b9d-4606-08ddbd1dd9c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|13003099007|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?KEx/Stzhzyh+6l6PwcTNHy5UpGywPZlFqaoNzUV0nmIpvzmu4l3M1yFjZqiZ?=
 =?us-ascii?Q?joHaJ/k8sEZQ1H4KP8aoSBwfJ1XUrv13lcZ5RDMTeSpqCL1X0TTLQHJXiOtr?=
 =?us-ascii?Q?uKNuTm+J4ZvXG2nkwEggnBpIttJIi+FNENg6OWv0jbTxvSL0lcTYT/zhUqsV?=
 =?us-ascii?Q?gmM6SYOZZ1D1oAcOC796Qy6s1e2uhqIRTlgBezMVreG7oDoCItZ9bg+ios4x?=
 =?us-ascii?Q?p7rluQLkJNqfU7FIk5b6meXtlw64QySC7mJ/3UfP7yr+xskPfRAFhsmEV6vO?=
 =?us-ascii?Q?MyXPae+pbTO/A3Ijdu0/jw1N0tt3qml6yymUKyLGUmcc7O/X+pqh9rmjgYsP?=
 =?us-ascii?Q?OHYL7cxWaGOCUx0bsjdhCR9zuEZ2QGqmNEXYDExSfRFDem+jxqjJ9pgKGL0b?=
 =?us-ascii?Q?RxQJDAUgjVSMZ3ytuRfFrofyivurzxBuw3ifUql1NC9lsrSkEwRatamQt6fA?=
 =?us-ascii?Q?TpX6kKIZj99/GOAJo30lDHuOiEQRZSBwnTtBWHfUfRkLLV5gJaUB/neGF2Yg?=
 =?us-ascii?Q?mYmCAgtI/IFCxkrLTOVlLKNTkLjEdX3VkSviJKC7hkUrotOUGkn31at6TRA1?=
 =?us-ascii?Q?XEzEwAqR0mXRW3NWJEV20+ItH/vPy5R7qESJb4QHccV3gw3bZDLe9tbP4esY?=
 =?us-ascii?Q?Zo+jOQNLN58dBdLKEOo6+i2QyiLsBwvR57vnYsBZSHfF7tv5KTaegYKquzqB?=
 =?us-ascii?Q?ZoH8L4F0Dgqvs036P4gyaL/ouaMfUlvJJcJZ0rT3MfiueHw4h0LcyKV1OcOJ?=
 =?us-ascii?Q?F1NuKQ04xf8xaeIpt0aI0DvhqZ1NqnryU8B7GKnM2AWp9X/+YyFncF0alPqT?=
 =?us-ascii?Q?HQ9puBideKks9n/gqd4srg2UaKO6a5ji8t1mlk7KCZymptO9KyXrfTgKV0ad?=
 =?us-ascii?Q?lN+5gPJWjlyBVxbYucjAa/LAfEIXROSevYEp0xgbGFnC6C07xxNXWJd7J11S?=
 =?us-ascii?Q?THwLOOHD4CNI+sNqOQXRQArGGpMNzjTGo//3NYHjAON3n6oEBpJ6VPgEe2d+?=
 =?us-ascii?Q?S7joDpGRMhwGUOSsmLHjAfS1f0M3OTN9GIbVf5VeOcSLUYSfPK15L51GzrqK?=
 =?us-ascii?Q?KNzeMkS3QYRDnq3LV5JNjB25MPY2w6XQhfg/ucWTpfxV25c03WOpwkLECnyh?=
 =?us-ascii?Q?5H+mhG+3j93fH7ok2QZoyZUj4y+wwTNSaPmuQEcbcxz3cdpiG8ahs6JJtaKt?=
 =?us-ascii?Q?Xl9CIhPReaewKR0ljohoNxi/FLxqIycLYgNxeOLAvbPtKsKWYErQ/+OlyvBa?=
 =?us-ascii?Q?Nq+M09Zl83HHvyk69tq5beMkgH8awspWicYvzSYgobdAa7y1ovXtfKqb29/K?=
 =?us-ascii?Q?2S17aTRDVEX4fKDnTj/CFSGZ8HAljoaXRm8Y6fYZWgfMTXEwwuV2wRbTNHOl?=
 =?us-ascii?Q?1jp7FPcijtcSEbl8KRj4JvHG5/R0Nz/eP7dl98cB3lKUnpauot3dmobBTJ8y?=
 =?us-ascii?Q?CmCmt5p4b60=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(13003099007)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0UlVbku+/QqzJPt3FRMQ1ycDsj8uwg8nJgN7SEvt0luJEq6HaWwRq2A5YKZL?=
 =?us-ascii?Q?vBJBErvhd/yQHJSChXEe6n539DA6x+7TxzAFbOF3SkhyX8hnOWzppm1Fm0bE?=
 =?us-ascii?Q?C2XX0/BZXJDlZTFCtK7DLBuSy809HhaY/enz8HEU9I16fjOgKGPkde4LXvv8?=
 =?us-ascii?Q?oBtAW+KU1roVolmCOXsFL6/Z/G+4TUQbmR0n/gVoJTH2jZo1DqhXDmQQ4eqU?=
 =?us-ascii?Q?ESZFlzQF8FBUB0UV3QqtAtfFDd5dJE4Wcjf4zJtUQgT+yGWIC2VH1JIrod/d?=
 =?us-ascii?Q?H9o1bl8Smjm2eU855jVf3VvPjD9gxnPMfKbuXfSDwS+Sqj1lH8jnZtdikPVV?=
 =?us-ascii?Q?zYPBUyc5DhWfIawMBBMoqFykW54NWg9YotFr491mOl7Il6DFIXQfXSYJ9hqM?=
 =?us-ascii?Q?S1PIAeF/skUCHaP4d6a9jeH1Xx2nMNMNUgbdYvnrkI+cZaj0CTcFxVPgM1VT?=
 =?us-ascii?Q?voMUfOzcBUrSN91wHpmxpX5pfp04wKE13yUHzNTYJ4bq4HkXnqRz9S7viWxO?=
 =?us-ascii?Q?89kLl8oPldgjP0uMwjBkkHNa6w8Ya3zHzlnerAUPyOe7350gv6zNEK/d9ppn?=
 =?us-ascii?Q?GNODmNuYlw1uk4KryUUiV4zxF6vcNoCddef/CjOH22O89JDsfA2EM14t10rB?=
 =?us-ascii?Q?fL7H7gWWdkoMT1Tt36NPpGzAbQ00uzlagyXOHdvLLT+OJ6gj9vZDfLCDMVLP?=
 =?us-ascii?Q?GmvS2QESJ/Y+0Y0b+wG9LWtjdI3aeq/JMtNfNgfx0i8p4mQ3y74Qvsg8qRo5?=
 =?us-ascii?Q?aoY1Pue2LTAdX3V7LfRZPIpItL8ponwJDGqRVby/SRnzTGnZjJCAfqRhaUwY?=
 =?us-ascii?Q?gnnwbA4Q+nkZnB6QS+e0EB9ptlK5/ciMKAi50oLbCG8Lyb/OLCpwGyZyR5sb?=
 =?us-ascii?Q?j9E4I6T/UzedPnh3812uiWJtm2h2T4nx+O7kSiJPHug1IVmfw3f3746H84w7?=
 =?us-ascii?Q?FxohFjX3nuKm2NawXrcF1tM+3xHjoFpVxlT0356HTYTaT2XpLU1urmd/enCt?=
 =?us-ascii?Q?gYc7Zjw+OBT4voh2Chh7+C1kSjNW0FaVawPvXalZBXbl9/tqSK9/KGuiEHU7?=
 =?us-ascii?Q?bWfwYBOP/epgCIojDV27G9wm80KugSWNcbRA+U7abBXncAMn+WV04iXiuU8P?=
 =?us-ascii?Q?pPeB0Mw0B49PZUf8AFuqkGHhG+5n2uHFe1rMYqyDyb97qv8acRDcq3DJ56az?=
 =?us-ascii?Q?iEB7rTAA8pMXjUk+5p/0HGlwJJKagjPVisIlxzaxHGwLS+hjE56XkAP7vmC9?=
 =?us-ascii?Q?sxX3VWOAEI75NfBtdzfrqLP2DdEOHbizA9ZhpIl0uscVOk2aMElYyRW01clq?=
 =?us-ascii?Q?egSwOJVVyfA/C9bQHx/GEzXzdhmvSs615P/MiXZxCfCLoOKpiDPp01ikxiD2?=
 =?us-ascii?Q?a2f2KjlVIpov94RdUnuxMnGhxjAZ/iu6Kq6hR9A+usHZazbWbqpc4a1ft59O?=
 =?us-ascii?Q?atirtGueyq/ZEIzPj70+N2utcnE0T6mC1bHpXmcc2uyxdPkUWVr/EUuzkVFr?=
 =?us-ascii?Q?htFdzHWZPG8O+ey74yBWWTiykmQvsLvRGBxxupWM4uS+HYoFFPTlY7S7yzzg?=
 =?us-ascii?Q?/NOFNpisNBANxlZpj+hf2w5cYU0IzqyVMWiEmEwO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbc5eb5-99f1-4b9d-4606-08ddbd1dd9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 06:16:46.0762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rsxrwnF6wunFOoF2f8TF7uyGo4Vx73w/dE030dFEHO3KYCHIXACORQgEJLIBAeD1XG+xHTAuE4fouE8krLo9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 06:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219974

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-5.2.2.rc=
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
	7. Beaglebone
	8. BeaglePlay
=20
=20
ETA for completion: Thursday, 10 July 2025.
=20
Best regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Saturday, July 5, 2025 4:15 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2.2.rc2)
>=20
>=20
>     A build flagged for QA (yocto-5.2.2.rc2) was completed on the autobui=
lder
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.2.rc2
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1955
>=20
>     Build hash information:
>=20
>     bitbake: 74c28e14a9b5e2ff908a03f93c189efa6f56b0ca
> meta-agl: a6202084bbc77708ff599060a0e2f6afb3c15498
> meta-arm: c63ce2117ed9ad720c61a1e2df5d381ca1ac54a2
> meta-aws: 77bbf7b16d5982d711b3188ada49deea391352c4
> meta-clang: b3e5449f0156884d18c17efff99654cde8251411
> meta-intel: 5640f6592c984f4832ff5f2ed1a35a607e5d21c5
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: 3c6844219a69d9ca8cb0f1579114efe9a9e2a646
> meta-virtualization: d20e589758ac40a846a8cd22f3b646ef48d02647
> oecore: c855be07828c9cff3aa7ddfa04eb0c4df28658e4
> poky: 41038342a471b4a8884548568ad147a1704253a3
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
> View/Reply Online (#567): https://lists.yoctoproject.org/g/qa-build-
> notification/message/567
> Mute This Topic: https://lists.yoctoproject.org/mt/113989219/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


