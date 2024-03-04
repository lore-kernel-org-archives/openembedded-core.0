Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A72BC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 01:35:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web10.88477.1709516139027813786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 17:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VzHjbmY+;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709516140; x=1741052140;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0MMBIo6tQ+9GNnvmvTTYvVQETD5gpwIekx1oIiuZsLM=;
  b=VzHjbmY+ijnb34g81IJstgXDDHeGISqcxjL7l1OBZNPygcgnwkkpveIY
   0A3JVfgDEcJlJIr24lRLNSFWThtscgSWewvSXn24JiK/tCaXH6N4geRss
   dNvHPaDgnXyQLCGbkgBM44qdVDoHV2L7otI+H86cuqiUM89RMRNOX+8Wc
   CyI0hrrTe+ubGVdsesSpi9ILwLiY3Hmyozv1ulg6esqRfVf/D0vAa4nbL
   geLllAkTJxz2gUkOtro8R2bVyQYGeCBoDFJ9hijn8xYXRdNw8vaF9YPMd
   1b8g1RW8HBXc+ja6BQ5HOjbm5X8kmnuK8MXFaWK3BQ5lKLAuXiQoRVQEG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4115808"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4115808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9015799"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Mar 2024 17:35:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 17:35:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 17:35:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 3 Mar 2024 17:35:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcGVDlZRg/kqALZRJN9CIpAj593B5ALJ/XuJ/10Ou5fO2nDRnUfm5Uyxrg/z28l8rsGT51OTvKPSeE6q0rS9D61HmvExghR4H0qoVpisqwBGAirtSUhW3ngHDDlI/eGvrnWhSMJUE8+sGh+HMnyXaUJaUCR6s6xIixPNrTZ6LcyJdE+0ufi2z44XhbY7Mr4WSNroCCh+zke8DM1Vh1kMCTaqiWvyEsFjIUKLO9a+W4H1X8agyOEcrhihcbjS0pNKcMQqIFqsG6t3mq6I67YolLV+qdrP3uBdcSBVB54vl3WKEF8jHpZuahX3QHf8c4FiXtFXI8DBZO5TUbmL0/YZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7Pgjsv6TWmqwNuOsyZ9jebuhtI+DPWAcPxVR8zjTL0=;
 b=DnH/8Zi6rYMzuzDsARop/MkzBGJVbLwxL8TNLyMx/15gI7qj0970INm4TSNm74JGS/U99RHPCEpFJuIhEfRuCSCDTDrnncJfqwDCLVa4ODHn+m4qwLikjggwwhFmOlOWIcHEojRY/H+gcOCCEX8dxNJMwXuxDKc4+k6YUuujSc5sT8yVMNzhZDCKsSMC1qdErmjuMiGOG6ovFbhTGA7sscq8yev20QtYXH1Ov6UFfTmLalH+YxEVkceej8f/f2gQ5Bubn7j1iOBnx2RQZESpKEe738UnAfjzc9xcKFAuj2MsIp2TZwfgAPIzb0RokZqys4uwn9OfchvKgWBWjXXP9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.13; Mon, 4 Mar
 2024 01:35:33 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::1025:6d41:d45c:948c%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 01:35:33 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.1.32.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.32.rc1)
Thread-Index: AQHabCYtFInFTKZEv0S6lV58EKbk97Emz7UA
Date: Mon, 4 Mar 2024 01:35:33 +0000
Message-ID: <DM4PR11MB7760303AE31F9FBC3EC9118FA1232@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <0101018dfc174a49-a1f49584-e024-4894-9905-cc8c0c222f15-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018dfc174a49-a1f49584-e024-4894-9905-cc8c0c222f15-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA0PR11MB7355:EE_
x-ms-office365-filtering-correlation-id: 59582365-056b-4b12-fd91-08dc3beb6245
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SNTfhoUfTMFb5rgeprtX59Kaa40TKKMKBzVtSCIcQ3OWcUGxUhFsW1EU2dbcmgABNe+VlunOViY3zv7J6GKpDfPTpvFv6/rYki47vgqURyD/PAKDxkSwUs6ORhMeZW0hjzKpQxejGme13rV58UquA5fUoJNuhWXQU4c/khlzdeKHMB/foIgAyGX22OrHlEbKTmuC3ugM2IP+oL3bWtnUhmEfDdDPTfuc56Ve8mLb0slgG3UausLiB4Ac6oJE81K93O9x79xrO/ioY2xE8yajmHcgafNuSFHANnYmIIOlXXudGH2W5/S8ESyzzm/zIivF8IFuqcHiMAFFeyVdmo418eppnnrnTFzdy4MiKtyNtVIqQKfTOL2eCimamhx3ezpfl3YFpf9zL2AYXUk6wv9yK37ux6249TlMhiNyebZaHbf//p+Ww1EKiaUTIodg0cVY7NDwH+fT7XSUqTRZxS1i2SC3I4AfwP+iLiQy5UjBdW89jm85yBTuT4+u3FjQuIJlIn4IfjMgrlVVePcIXI1BKepZ/hxfSrgq3vcM1p0goiapVSCKEAKw7gGl5QSUjhIj2rc+IMllO+PD1sBqO22n8Ysb2A3bywPqbVl4n6TrCM549KURQSuSUfprhGxzUi4GvDJYyKX8WBjlKzVfVSkurPF1rlLVjiY7j7rS8khTbtYDMTEaXRBSuyf2qsnVfVbd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lBkEeS8mCY8tb8MIIu1eTcMWdV2gSePKw2zpFfQ2L1u4grVbYdYTVn0yS0Fd?=
 =?us-ascii?Q?L90V5fEfghdFk8GA8NfiQ9CR3Kwhr26dYFySsVkNQR1mt9VvixtJNA76TE2z?=
 =?us-ascii?Q?3nBz2HzzSmPhkFoXDxEAnNU52geS9Mzr2DDQmEUygqWQNl1nJIiKOVK3sfW7?=
 =?us-ascii?Q?jQoeoBb/o9K38QptkYCdCk+Df7RcKnT5JML+4qHcCq7AOEf+LkvL8Q2repe6?=
 =?us-ascii?Q?Ai/2FOeKIaQLMdM8LPtaR8FxtavEvQA8WkpWcNeGTj481MX8JKD2LpwAh6Se?=
 =?us-ascii?Q?zEIXVX242EvJIxR0Q62sk4lz8uLoPOXM/6UurC6KrMuuvGSjn5ugSyl/Eypl?=
 =?us-ascii?Q?PCU07QWo2eUGe29IriHugakpSuMqkXzL7W+nFjAEcXGq+PVcX3FyncRaSBXf?=
 =?us-ascii?Q?BaPrfcnStfuHQCS5EjSKGYbmywMp5BrUi+57Cd7tcvH+VbyZcw5Fu8/wA8iY?=
 =?us-ascii?Q?39dOafhz7yb//vqVyAs6ac/5XX6Tq9JLwBqB7USb0wUBLYYZgA6m80Tq16O4?=
 =?us-ascii?Q?/BstpLlu7jGzi0ynwN92kbj2YQ7JSYfHiRbEJNhPTamnEUaq0uUM4BK3UB3x?=
 =?us-ascii?Q?bac6ISQ7zH432jN4tiT7mlqi8z25GoOctDaTWSCoEdTDlaeEt9ez11qIWU2+?=
 =?us-ascii?Q?2CChAgF4SFp6gS+TMiYE9vMSITJs4wZT8ZyoNT+NzBA1X8f/z6YldnI8f+R/?=
 =?us-ascii?Q?jn52zJljKH5nSXTmGm+hDkQpeUrk1+AH+H/rOR6bX/Rgg6Zwp7j40t9R4res?=
 =?us-ascii?Q?N9Md5aizKjOvgO9rGB6A6X3gN8hwteoIh3axMAtMINfllAwblSySFks53gjm?=
 =?us-ascii?Q?Q4GlnHDhGTridude/Tn1KcT64emO0Tk2dDH3GFeXe4WX6w+onQVyEmqXJw0t?=
 =?us-ascii?Q?n/ugPm86puo86M2dOcPfmrTG9EbVsI5tzzJUGKw2e60QQNMbBMW/+e+qcJ8C?=
 =?us-ascii?Q?csWIsvBsfc7p1/PRGOrHEpeX13XDEjAwF/zSMT5d+cT3pYAOb+NHOLjQiTvJ?=
 =?us-ascii?Q?Rk/MS0qQfZLfQFxlCo+bk33+zTUcQBIhtbReaRT1zsxnF2w3qOOOCOy+gnfi?=
 =?us-ascii?Q?9U+OPO+9T7Cpt9LDUqTQTFOcT0wbOL7EetNdc2tX/kl2+AoMlxHJipWguUcN?=
 =?us-ascii?Q?C3mX+n88KTdZeeAtSf2TXb5gcy7R+oUGHuEYCL8CdoQNP9V1RETJG4wuWvTy?=
 =?us-ascii?Q?Nya5siLzt1eO7W3EKc+6NefTl2ugF4I57HCO2u9JstN0pQQUAiZ5fgvL9mwQ?=
 =?us-ascii?Q?iUJz5392/CtXa7D5YIYQCqU5zUV4wcNipMSxFMVr1L8Q2oSVkAD2IVG3pMAI?=
 =?us-ascii?Q?HqhC0/+QYSnYGorRl20a4oEjV0xTsFg/g3VmcbGPhYaU/KmCtgkNPxlBBUZD?=
 =?us-ascii?Q?ik205rjXeWSuFYS69+bRzAKmhgdjq3+IRHBBpGJJJ/qX+s0gKPOmaIUCBjYM?=
 =?us-ascii?Q?QEBAc0V4tfcYWv/TSlewKMSQoSG+9z8Uv1HUy5cHZOyJn5QBxsh9bWBAmd1I?=
 =?us-ascii?Q?cmKSWLKk1hucOrt+Fz6nwJNqQIhCxEmIufFpkq57p68ZSZZh5cAFQLEmgr+d?=
 =?us-ascii?Q?Nfq77rb5pcfw0H5LR5hB0WTThCHZmlmudY5Bx+kw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59582365-056b-4b12-fd91-08dc3beb6245
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 01:35:33.1524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: seizRUr6pC7JaxQCc4NbRpTqxZB9yiJbQmyjDpGPH5WRu1pAx64xrp1bvAMvpnFWSMDWT0Ub5zC/dmGqPqMWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 01:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196581

Hi all,
=20
Intel and WR YP QA is planning for QA execution for YP build yocto-3.1.32.r=
c1. We are planning to execute following tests for this cycle:
=20
OEQA-manual tests for following module:
1. OE-Core
2. BSP-hw
=20
Runtime auto test for following platforms:
	1. MinnowBoard Turbot - 32bit
	2. Kaby Lake (7th Generation Intel(r) Core(tm) Processors)
	3. Tiger Lake (11th Generation Intel(r) Core(tm) Processors)
	4. Alder Lake-S (12th Generation Intel(r) Core(tm) Processors)
	5. Raptor Lake-P (13th Generation Intel(r) Core(tm) Processors)
	6. Edgerouter
	7. Beaglebone

=20
ETA for completion Wednesday, 6 March 2024.
=20
Best regards,
Jing Hui


> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Saturday, March 2, 2024 6:17 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuilde=
r
> build (yocto-3.1.32.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.1.32.rc1) was completed on the autobuilde=
r
> and is available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.1.32.rc1
>=20
>=20
> Build URL:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6633
>=20
> Build hash information:
>=20
> bitbake: 7ce4107bf824b3e115b40558336de25f99af31f8
> meta-agl: 6779dc072af75f1f606b0aecafff80fca8bc8419
> meta-arm: b75b8ce1ac10dc3521c0f710a4cf79bc7e985cfd
> meta-aws: 6304ff33b112512b31919a7aaf145ab2ceed67a1
> meta-clang: fc56d6c8014f75fbc5a3f272c62ae201888e65d5
> meta-gplv2: 60b251c25ba87e946a0ca4cdc8d17b1cb09292ac
> meta-intel: e482213f37828216c7a7df68ff353652cc865ec1
> meta-mingw: 7bdc58e6c5d1054b1b6ad5c4e480a95e995ccbae
> meta-openembedded: daa4619fe3fbf8c28f342c4a7163a84a330f7653
> meta-virtualization: 35c723774ee06b3c1831f00a2cbf25cbeae132e1
> oecore: b49b0a3dd74c24f3a011c9c0b5cf8f6530956cfa
> poky: 54d8a1f631543ce01ba513e7cdae756e2a8e1968
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
> View/Reply Online (#388): https://lists.yoctoproject.org/g/qa-build-
> notification/message/388
> Mute This Topic: https://lists.yoctoproject.org/mt/104675615/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/10762429/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


