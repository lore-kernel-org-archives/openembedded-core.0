Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A77C369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:59:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web11.79201.1744127958697820403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YJxlhyqG;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744127958; x=1775663958;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=RJLcVgP2gYTI+rSC4RWXavtdEf5SV/xGIbFfMXz+BTo=;
  b=YJxlhyqGKG167oDjSZGg9UtMALwM8nvwTl1DsMixLVXQdpcfd07n1TjI
   imqG0c/qpTp9i3JgwI5zxhBtrgFvf05TCemVr9rTIHtQ+alf77UmjRGPn
   aY2D18J7jbWJx0eWGjmNRpB0RTLnDK6f0zijPtFoc6niJl4uTTN4JKchk
   ilcjBUiNzyipLv/sYE6oHqfQBVdjIiJNH+p/TgeBPOBMF9Kj5snMrH6HF
   LPn37vy6gsDjbczHdA1ATq5ojsuDinyC6sJFjP1Q4mJI/zPtGcv9Hn9ia
   xHRHC07K9PZug7UpeQW6Md65WfeY4WT+DZTHsNwUWDG6b6S1Bdlltq5rj
   g==;
X-CSE-ConnectionGUID: 3/Ic4852RC+MrnhA/Zw+tQ==
X-CSE-MsgGUID: jA19QtfNSPm8/KVTbENzSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45457575"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45457575"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 08:59:10 -0700
X-CSE-ConnectionGUID: uIFy32rxQkO+770HhRpBgw==
X-CSE-MsgGUID: wBxJfg4LSJaZNp199ObtMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="133454457"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 08:59:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 08:59:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 08:59:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 08:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezVjtKko7/6gh372RWi4i259wD2uHyCk4iylTjRMY9y+4KZ4ynQhO4SbWVgVGB7NAKoB7d80xETWyDTLp8BDEmEPLYKNLU2gJWXQIwtjiKm4ds25iThYTf6NlGCh4JvaxIUPw6ukH2rwBQXxZDUwuNGTJgxobIDH1ZF/2uEs6CdMFNDp0L86AaIkPfEhXcu3puVvkqQCsDZ4r5uTD4rkcGsiI2BIfFZDBvzpkminMKKbkCxi2L8QV5Vz4Q6sFkDtuvPjQMmjGPB34Ei70ux3wyVgLGx5cEIxK5qeIvsY/hJrGPgFcF7nMbAdvvPogWcw96CRQK98IrP8Ib5z6je3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9DjhAqS8l7cBeMEQQ2la8ngdsRs09yvUtaN/BqwrkQ=;
 b=ASQJWZCVRhvyrZDG6/K6fXhjxq6damnhGSVpLq1riPLEbenyXSWpNmL0pvVDuKLeICCBgidO2ulAyaOyiNWIrDbVfj6ZvaSVt9E+h+m1KOAVNBdsdY3NGd+qb5B/k0GfJmUOg7A4eeqgdx17YIKB/W2I+3UCB1BjGW6fD5qr3rWexpjqVjPoszufqTq3oS2dXV6Pu1WHCHGbYfKcKEBvr3sGCwU0eIHyld3w9HKcfsEPvFiAItQlRgRmc//L6xrjE5jUIBnhefHKNgHNLrSk87OCfj6nGLEF+QwtO0RyP+iOyOK1EjyWy+lzc36yTHIVtsAHgVL6nPFaz42wFBXWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA2PR11MB4921.namprd11.prod.outlook.com (2603:10b6:806:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 15:59:06 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:59:06 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2.rc1)
Thread-Index: AQHboOC4pOZ9ZIQmrEWBdKubkk1817OZ+AxA
Date: Tue, 8 Apr 2025 15:59:06 +0000
Message-ID: <DM4PR11MB7760BC7D731BCA316E6EEA14A1B52@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <01010195e3602375-1bca3d69-ade5-4ae3-aae9-8c6d381adffa-000000@us-west-2.amazonses.com>
In-Reply-To: <01010195e3602375-1bca3d69-ade5-4ae3-aae9-8c6d381adffa-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA2PR11MB4921:EE_
x-ms-office365-filtering-correlation-id: 7b1569d6-076b-4c4b-0e8f-08dd76b64a99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?JS6zIrgsN5tN8yuBHMSqNX4Pbsq53IV9E5Y6Hjziw0L89fM3XYzo5a+281vb?=
 =?us-ascii?Q?/wteXnXNm+YeQNC1OVK5LV3gxCk/qPeYY8fRbQk8ngOI1cLh+r8Pt90hGBFM?=
 =?us-ascii?Q?Qsm++D2x29ioYS52mZWhRf+2TZKFSYEVCZ42g2ia1wosXwkSUH/3S+zfju0X?=
 =?us-ascii?Q?6RyRAU/IliYlUnAxPPDkVEHEe0vYtzwI8L7bq1c+5NE6gICqobjlbCAlSdLu?=
 =?us-ascii?Q?p2rZU0LyfhT0OSoZGR3ZPSg3xUKtxG1dGYN9hUnQ6+8GdRXRYCGieKCj/2o6?=
 =?us-ascii?Q?o5BkTn4WKND12/sqtSbq6cVjfCzgDEWlGT8dPvM7TZfYsPgOTm8uKTKwK8dq?=
 =?us-ascii?Q?cx0r4LJyNLqgCP5ydVeGUyLKGTEZCCvHlDA849To3hYM2scWy4xIEYDTUEcw?=
 =?us-ascii?Q?S+9wblbrAwekuyIBDi4AUBiLGFcQCdWbmsTJEPuw/f5eNkRGw1aBVwaU218+?=
 =?us-ascii?Q?oJDDKFm7AS0bDpdBFcWesqTnDLrmtn8aWI5ExUXmiHo6JrLkaWOvngwEbJY0?=
 =?us-ascii?Q?VYFTAJzqJtAdayo30HZasDF3p0Gn8QDyJ+KlI17w73JprgQpi9wsDDaM3ZLk?=
 =?us-ascii?Q?qfvHQFYCFKQ2M7v19C22dSPgSt2UYGmE01i57JZW37Hw8zbRGeNF+ZVsjSc2?=
 =?us-ascii?Q?68ss7lYQa3z8ku42AB+k/4UHgwTM0jqW2lK4AaHh5RM2VcggT4WAHFWdF5QU?=
 =?us-ascii?Q?qYRBuAD8ph0GkGCkKXLLhyJHN/nFNe/fU8w9tn7sGelMioSIfQuPG1vCkFJQ?=
 =?us-ascii?Q?R81J+K77fpADiALvTuuP+AUuCH2RPBkIhLXTPvbDjK4sy5RZI5zG4ql8wI+7?=
 =?us-ascii?Q?wwCLbx0jH6rmnC+z/45D9x1/GX0koJQcFQ6Rs8kkmonxYb2PUfQRMruzgW/k?=
 =?us-ascii?Q?Dvk3BqMLAOfCa2NnK3hAb61wVlN/CexeUwYqCe5jqZTokrIdXe5zZC3jnbc2?=
 =?us-ascii?Q?T5lfo5se6z7hHpc10Qhx9PNZhmo3HvrJLWSu3pKnX0WiDGXSG0G6fzzwtyDS?=
 =?us-ascii?Q?RbUmWRYqCa4/CTuaIAedpTDL6Uef3casW1yfz5V/hQK57znmnDbapLNslJw6?=
 =?us-ascii?Q?kEukRSKZZX+6p6iGxza0iakYw2f0ph6rd9RN0v0lKmDFhyf7MKdLqvim9AG7?=
 =?us-ascii?Q?a4W3Jny+3XcL5+b2B4bczaSA0VXjchLbPrBcskWBthh8nH9RBd3mtt9/RlZZ?=
 =?us-ascii?Q?CpapACuCVa+bLAh2yhESWoJzxaPU8bd2Tv0F7GoevyffVq7nCrBU++Mgd6F8?=
 =?us-ascii?Q?SjkBbpnCnvF+J2YvZu8XGk8dD8jXPp9n1xsZay12cz850j9YVXAMqtewb9dC?=
 =?us-ascii?Q?JHqYYGvBxhAz2La8n+qjrePBNLH8Q+hk6sIpu5mM7UkcUUNjzlP4CnPHTyCo?=
 =?us-ascii?Q?9s77ZCMbuwi5+3jH2bbep1HKpOub?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(38070700018)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bkp84xfsVwYrhXVjik1vt/FxZ9i6NlPfhj91KJLy1M//JGgZibrdEiCTCpw4?=
 =?us-ascii?Q?jvTVlui0E0h1jHbwpc/J7zfAVF7UcH+dPeAtLndTQJyiTYhuZoi+dANGTb4Y?=
 =?us-ascii?Q?l9lQ7QptdPMvD5QlXGsx/gAhu2y613YsHHRUvHdFEsOAh6S0+bigC3EIDewp?=
 =?us-ascii?Q?z3irI9i9ImbcS6bLE0OgtzpHVFblXRSv1JORDjixTtSNxFsnrT/Udaz9w2LB?=
 =?us-ascii?Q?Zeg8Zda28PsqFdecGP6PAOFX1TcmOFX0lq2EyemzaHdA1Xah9X5rpldUoMZu?=
 =?us-ascii?Q?grGxlTgvENVhU/X1UtE8tdOrUb+AziVhRWa95HB0CjxDNF6IuofHiIiwqUE9?=
 =?us-ascii?Q?5VA9JUdg/6rasohKBz4ykfzHJxzZzYiMwwU8yP2Ksgpz94uQTrUviXgCl0ll?=
 =?us-ascii?Q?28Dfo329t9Cp5Z0j36uwQ86h3fAZkjz4YfjuBANHnDYotwQQ/xiGHZFIJnaF?=
 =?us-ascii?Q?fcVb1afQCrdBiwL4Bj3LvLrWaPA7OvY5kroCZOFoy1wCvLIEwqO9OMU5ERnc?=
 =?us-ascii?Q?sfTYwn4f1VluVGRKMMMArpdVL3b31JIrjZhurLoviCEtYAwIWjVA0uKPnvRn?=
 =?us-ascii?Q?EZ50rH58uFmvMGsY+T0oJOOcXonW1M5rapSnww299iy3ZYbl3K0RmGruTixw?=
 =?us-ascii?Q?iaMQAFHoGjO+yEPUhXHrApDF9stGy9CoNyqQST8Jt4uZSbE7OVpYKlMZYeoe?=
 =?us-ascii?Q?CqQEJyfsLUJARR35IayRqwPaXgjZozjZuktnnDCJaxEXydz8bwLd+g1jLDq0?=
 =?us-ascii?Q?ySyoaXCmLlGkjxU0NfuEWP7Ehaia+2r3oWIQpVRvMPf6+ZlmyGoMP+KgXSik?=
 =?us-ascii?Q?DEqXUqd8+P2G8/sQgSNUVAhRqIUPQOJ9u7WPrzQvQPBcKTJDCyROqzctxzbf?=
 =?us-ascii?Q?/GuDc0HHoW5RlE2PdoKWrzTqUtFOGcektJDK8druCVJPmIu2ZL0PSjsm7KWf?=
 =?us-ascii?Q?Xq0aUwrebC6WzhihtMcykaOsysVaSkgQS3RoObE5GEk55U08zvwe50FrPsk+?=
 =?us-ascii?Q?AYTBcQ/wIB5XtnNG9eDh8gbKZJFT+tP4WUxh6cJYEJkafdjTxPJVzjJgQhbh?=
 =?us-ascii?Q?cXeWcJUhMlAyU9v1kSFBPRWGdnRSasqvtL8bg9fmPGGJoVk9ojPDEa+SQt5F?=
 =?us-ascii?Q?M446yx4UfO3ygTvv7UxhjImAtwUpXyKLRxAIXeWLaVsQU0EadPleAUMDSDMu?=
 =?us-ascii?Q?48Lgmz/IqevGa5xwSXCdkgUd73tt9Tw6zRKcV+zmu4gFcC3uIL7PNkPG7y43?=
 =?us-ascii?Q?DZywW0YEyyyFHkDLBJbcb2U2/4FjJ4KJRsHrM9ojUX9BrP63JBUWVLbbpnlu?=
 =?us-ascii?Q?L7jrIn8VUEZKZundm1K1wlBiNtO4T4PtQbvm54QxXcE0O3+wQITHiisZIwJn?=
 =?us-ascii?Q?R8eDRNc0oFXR6OzLPizBIc7cjNwdOI/NqBE9pWZtDdubnULTkUaScwAxwGpi?=
 =?us-ascii?Q?iFOOEOPWNGqz2B9XNU2B4PHSqNESFMk0CrSyB7fcp4bUqKXy9gyffJSQnxEB?=
 =?us-ascii?Q?q/stQ8BL0bM15VWenXtzj/ZYVDdGQvzL074AocxLzChrYrdp6D8cFYREuePj?=
 =?us-ascii?Q?JsZhsRxi5pcflOj8s1BBP8+7BxxGRWwGXSH8Krzp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1569d6-076b-4c4b-0e8f-08dd76b64a99
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 15:59:06.4047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIMp1fHyfZXEYkwTMs8Lfab8IKdJUebGthPztJBlMRmdk1bS8kWGE2a7T0tgVWxZoZVj4cMMh+Gjk+jbidpDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4921
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 15:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214546

Hi All,
=20
QA for yocto-5.2.rc1 is completed. This is the full report for this release=
: =20
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?=
h=3Dintel-yocto-testresults
=20

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
Image not booting on Arrowlake target (ARL) - reopened issue https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D15802
All platform image tests failed at opengl.GraphicTest - https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D15825


Thanks,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User via
> lists.yoctoproject.org
> Sent: Sunday, March 30, 2025 3:28 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-5.2.rc1)
>=20
>=20
>     A build flagged for QA (yocto-5.2.rc1) was completed on the autobuild=
er
> and is available at:
>=20
>=20
>         https://valkyrie.yocto.io/pub/releases/yocto-5.2.rc1
>=20
>=20
>     Build URL:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1293
>=20
>     Build hash information:
>=20
>     bitbake: 5b4e20377eea8d428edf1aeb2187c18f82ca6757
> meta-agl: 17fd501fae2361588f2af72c229d56612cdca40f
> meta-arm: 49cad31d10e6a3d4539c171205254e1ced443e33
> meta-aws: 703760eff82035093ccb89b73ac9a6f272b3539a
> meta-clang: 892380133becb17d95ffae95de1df025c9d72088
> meta-intel: 79b1fd3430ece279f14903ebf5d34527fb80b027
> meta-mingw: edce693e1b8fabd84651aa6c0888aafbcf238577
> meta-openembedded: a2a531a61b779fc666cb161be029b8ff801d2c97
> meta-virtualization: a309b738e73860781ee9099de5fc9df7ee22950c
> oecore: dc2ef2cc1183a14cd3a05d388a1d0485a1bc8d20
> poky: e894acce6ede8bedafc1859ea0345ee6d80e9c74
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
> View/Reply Online (#534): https://lists.yoctoproject.org/g/qa-build-
> notification/message/534
> Mute This Topic: https://lists.yoctoproject.org/mt/111976499/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


