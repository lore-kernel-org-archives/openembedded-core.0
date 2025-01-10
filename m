Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E17E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 12:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.17077.1736511280388941212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 04:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Hs/Boe3j;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736511280; x=1768047280;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LrFrNbXC7sz5UIxMFQWJ3t5Gs3NqvXmDdx6PMENx+3Q=;
  b=Hs/Boe3j7q7S5Pa+cWcHKYs46SFmgD+OxmZJzjdxky90c7q0UiWLlB+J
   h0HogWxuNo7kdq71B10DD8ICJMOm823EKtXJbVug11d/tzAY7wrxB9tVO
   uvzZ43c/8NXK9L0qHDkW1xpUhnTAUqAPYq1eqFU+ns4yFSumuv2dtNaki
   FQQee2WzB60Mo6EAt9Z/WcQlI9j5yjTpVO+3eMAVrCo747V0YH3Bup7i2
   5ce++ubPNcRNEZtwYKIy3yzmdjGl6nohPXOYgbeItv+fLvfUHzgKnJ+k3
   sTNlvn2iwdGGBaLYH2sUWT34pJMarZHlnQ2jK0UlDjbV6L//M9Ot0kZMB
   w==;
X-CSE-ConnectionGUID: u7Bj5z7WSdC12EuzKKt7iw==
X-CSE-MsgGUID: a7z20RSBSUW21y2/wh4OLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47377446"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47377446"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:14:39 -0800
X-CSE-ConnectionGUID: y0rt9Ca3S1SyKCWyj4dqUA==
X-CSE-MsgGUID: wSU5YD/JR+aU/ITR217Qjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103662960"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jan 2025 04:14:39 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 04:14:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 04:14:38 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 04:14:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN7WsUxQhbYzLpSVHbWenyvmsVimMplZxmduW29clVbsPu7iqgzP0lIIrBqPjtxT366UVeeBlixlRinaRRRmlyGqDclQbaJdx/KdJFZomejMiBwsptbnqDrsPbjjg5mHzEd4dkI8VB/kp9i9yo6miafuatQzaJAynCts4s6qX8/Avj63o62aBLej0S3Ha5sLhhpQvk++X9Pcasw7UUJAzrhvB9+un9pvHYdxbCI0sEgP4Z7ptYZN+7bVUcoOHjNUGoNAkT2g5VkywnI2bBZ/oRhrHHVPMu6yIYKvk0PmVF7FuoDDNjx49DUOFmypreuzd95vllQhiuY4vjbGNsU28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oVW+3ba8yu71TZ8+GrGU4Aa/+LxNFL8zR5V1Ci6vT4=;
 b=S9sYJZIR8qvx0eh6AEp18/0qBn6ShtgfJopfGWfbikrOsTJgjlRf4OlMvBlp9sd7OGzOppX9p9ETKeBCNGQGj206JKLyFXlX6WYbTmTHI+zKYyqbyOg1is13wBk+zsx8CBOjXk44okuA0kPGWvMqmKiN7O2NkSH7uJA+KnGEixJmlxTNBxgihVRm7JoBcI32BjJs5PpICNaP+O0oVuifd2ATkVNb0QHPpY7z+GgiNeZOOnfaiByddUfi4AYe1TT2xRTEOZArSfGUm4EfEh3nerJfp3MeNOJ1ZXZc1nKzXMcDIUsjiuG+RUQn+veS7KEbkldauiFnld/porkmmykczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 12:14:05 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 12:14:05 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
CC: "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<Ross.Burton@arm.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, "Bill
 Mills" <bill.mills@linaro.org>
Subject: RE: [OE-core] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Topic: [OE-core] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Index: AQHbT0NtbQ5xLneIS0uQEydZyKHQMLL+ioCQgBAZXYCAAW6XEA==
Date: Fri, 10 Jan 2025 12:14:05 +0000
Message-ID: <DM4PR11MB77608E86DAC23EF51613C83DA11C2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
 <DM4PR11MB776009E6944CBE53C0A21CC9A1092@DM4PR11MB7760.namprd11.prod.outlook.com>
 <Z3_acS6aXwp6chf5@nuoska>
In-Reply-To: <Z3_acS6aXwp6chf5@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA1PR11MB6871:EE_
x-ms-office365-filtering-correlation-id: 96ca2fef-0817-4cbc-d634-08dd317046d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xXThQHmsBMWep+/CdEBKUJj/iqvQF/KWP3ioDacSaQmYy65iYRcoYAkx0ybt?=
 =?us-ascii?Q?OhRlKq2wX8ea4C6wqgB0xLemO4xVXpWOW18uZDtKQyS7YqfJr9Ufi+8yXiT7?=
 =?us-ascii?Q?IIi5J9ATrGsLnM437O+PvGsPgE9k+GZKoDQAQ2YsRKGI3I6cxZv4TNLuAVrG?=
 =?us-ascii?Q?Bc3NWIiS8/ME0noj8QAlvJdxfB11N8AM899Tflq9xt04eW+NjIkqeI7bHNOy?=
 =?us-ascii?Q?lbIldo25fAZ3x9cFsdMN3GtRwn7lqEkfi7GvAshHNIxnmmDMX661Tff9DR3U?=
 =?us-ascii?Q?KsKUPDkmsYhnIvntuwEK5Rr3Y5GId/1N0PIzTeb+RtWw6rcQZTqOtoaKzEC9?=
 =?us-ascii?Q?e7oXQQK0qqf97rAbdcTUaDVSg1arRmaQN8TNlpYAfOPNBtihLHBWCCFjoG48?=
 =?us-ascii?Q?NPWgiaYIDE73yMh22KxJXC3jgv9WA+3h5SvMKlti2FI5ZwfpiOC6cDg1JUsv?=
 =?us-ascii?Q?DLa5QNippiY8VDEPPeJOH5adbrtKC5Faw8ZRTAjH9rzysPa27bB1SxBOQTY+?=
 =?us-ascii?Q?zmwaj7hg0EtVPCjbIem66LSWuP49VaQKJHOu8wCQNXd58xipqW94J0r/ZBDd?=
 =?us-ascii?Q?7qDv8kQuvuglDvl9vocLTsmInprOBEa5+nOCEV3KWP0RwTc7h5hSDa6aALhf?=
 =?us-ascii?Q?Z5cYjm/6pYeOAZKXL2hWJSNAfLbvTZ3ipkaLQ8Wqas5Tq6GwQdEGoUXoGfsF?=
 =?us-ascii?Q?iCf2r9csMxYLeENTRfOWmgymetCqlivlZFQULB6x/Tdvp4gB8dfrUfy5iM+P?=
 =?us-ascii?Q?JAcpPt3aP2BOPTk/puyWHbMdRpl40WrONpj/mOKfDyOd1mfjIzE1jaeZNZtP?=
 =?us-ascii?Q?cXc03PLImeV13n/JzzKPFilJkBQM1FPo1eTOuo40x7PpNDCb+k2UFq29iptw?=
 =?us-ascii?Q?ysmpgq5iCkaY50vywlb42eIbUaWRbuo+b5ss50oq1OR9T73Wqkl+JIUTgN2f?=
 =?us-ascii?Q?UGNGV+sFxWml7QZQlwyMBtyxEllMJi4kXVXYZRZIlLyzpTjmFIHpYi+5VbPo?=
 =?us-ascii?Q?ZS6RL73e+p+1vn2+vaDrNXOreP24DMvnwNCtoDo0p+V1VxqKL0QezNOR21ab?=
 =?us-ascii?Q?N8AY1Cl7CXdPAaudKGaiwGKEMBvlo2+mCSpjt89nw2lV+60g2CGGd4rbQyob?=
 =?us-ascii?Q?4sC4WwbYqYbemg3+BNBxg1qGqC2m9ovOzi+OB4bW9W8kNFta8AHPQEc7icUw?=
 =?us-ascii?Q?S6xRr0OEjqImjqM9ERwH2Jk97Gsj+yB27+caljX48LMAGJPxMcjgGBZmZc/3?=
 =?us-ascii?Q?LCwkRJ995q3nV4DSvGUKMphkzSjnId1x8ZFkASLp/9m5kFNdgehjPzACXuNd?=
 =?us-ascii?Q?H0cVs6DdGr1pQJ8gpkfcZiWpSKRZrvJni+70Ji0Iq5VcgRNdNk/lHK0LFFJ4?=
 =?us-ascii?Q?zQrNt2MDKyGpy2B9e0g6uszjJZFeYzIAePWhvKjxkb9ej39UBw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gXqI5CusJQdCvcJirVj8mM99Ke551SvIQJPoPnLo6ZgBVzT54LID8mzcATR5?=
 =?us-ascii?Q?EHF3cMu6hn/qkktRyQFhnomiYj8k+9DMdrxX+Bg26fmbYQwDiJj2pWJsuM3a?=
 =?us-ascii?Q?6+nupStejtWMnT3RIPsNsassfWR+XwWgitm1e94L19129CTxJsYbVVBUDX6C?=
 =?us-ascii?Q?PqROb4GKLj2onK8CnC18H7nIv+iMGDB5B0HkzSNxmOqhivkGAMgjDA2ef/mW?=
 =?us-ascii?Q?rDWGnPYtvtL3lQU8pIRyy2trQ8LLu+abwC/kbvKPbTOrZE6D0PrRt7jRi6T4?=
 =?us-ascii?Q?gftArGiJ6jpFaGwxySDmhbJ1hHs9lcypBHGDzKD6H2FARNoTT1Ndd7hAr5u5?=
 =?us-ascii?Q?cn5hwVUifeFoXVpnrnRzkPeFdIibJK5a5dWSeiGox56lS8Fl9dbx4dU18ulj?=
 =?us-ascii?Q?RyYm/dd2kmIxYFjf3+rQuS6CLgCxmWkUxA2776eI0ZKnO01A1/GxJUg8rSmH?=
 =?us-ascii?Q?cX8bn0BJC+iD6rkkFI99OVOjYorQYcTYexHIH89kMIEz8tIU/5SSZynaOYF0?=
 =?us-ascii?Q?nyMJZwahpYewQ5NQe298Qt5IoW4qlGaOgZpq7BYsf/yRZKbgwE2NHxtoe4Mb?=
 =?us-ascii?Q?Dg3xi33zF/BfMYHdFKonZHIdDmWwahrkCHIZigS1XwxM4UXOfxQ0V4iMT/RW?=
 =?us-ascii?Q?LqZNCiDb1EEhJo/Te/dUkVAAOUAb8o3YrmFzBIyJg6OOn9k08gu4EpsYfVA0?=
 =?us-ascii?Q?KrINkZcqITMsFC7xxKLgfNMDMaqWR1DEIHBgaUnHEiUSTUz5tw6y/QoXTVAe?=
 =?us-ascii?Q?2wjfYRllwxQVia7767+GkrS3k5lN5zJve0oVdxj4A73l14xymAl8FsWe7346?=
 =?us-ascii?Q?7++Kz45Q0yBop72JLHHw9U7hy7x5+kOz9ApS5CCRvY7gcZbxTnkXeDKngzst?=
 =?us-ascii?Q?Rfrz28dM0rlzdSX4chIG7ceNWP6ZZluq0WgZ+AOVzeyf9NJ61rGM0Qv0eNuA?=
 =?us-ascii?Q?q08iQZoSlVjS+/V05KVvCwdxkNe2/UH7AtIIjVCAvFu/wlf2bmNcWjijF/Zx?=
 =?us-ascii?Q?5+gvK8R+xkRBvMu3rB+NJhte9J4nBWp8yOOJULbEoRUy3ehXZURipe22xyEt?=
 =?us-ascii?Q?0wnGcDOxl8I+uIqWHNDr5YoPkDZ/lYjj8oApNfaQHO8sN4dj3r7wg9WKcBFg?=
 =?us-ascii?Q?6NzLOyA2hLOHFhAO7r54j+fYvFBPTKrmfUjBP9epPbAYsSlMSf94VPEUg7wt?=
 =?us-ascii?Q?tstaaopOr3A4Xht0aQAuv6VaH22BHh1t4cgc7rqi9cBTHS+r2vMc/+YYWXEA?=
 =?us-ascii?Q?tgKH3DZgDCrzHNstmQA4rtyXSUWUQR8gfqyDUijw2Nd4KJsQGfo8Ixb0hNMT?=
 =?us-ascii?Q?QYdO22euO+jBrlwQ43+P24ET3iq3t4CFDTXB5g5JuoursnVgK4sRNbtWdkcC?=
 =?us-ascii?Q?du8QfpYhb1bxGrR74m9yB7r5luic7fRhUCzOyvWHHtmj7DamOCDxxzF5RitA?=
 =?us-ascii?Q?Lj1LiNRwKQwgKM56AkMHisB28WkYmw9EPwbozC/TnMPAJh6NOpI7rl0llTpy?=
 =?us-ascii?Q?XRFGNPyCWsV2Ts55O3tjrj2yFE2lbl+VoepR9rmEnLA7IyTFGqEAa5YBrTHC?=
 =?us-ascii?Q?ZdpsA97Y9WztsO97zQFwVKc9bgIJTm8K3RP4CrB1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ca2fef-0817-4cbc-d634-08dd317046d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 12:14:05.0995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFjus9jNo5Hx8c0sfiNlpjwe7QvRJSNOVsaevPpwz4cs6onrOVYFE+8nZdzakWywSF77LLqFxi2h3i9C0i39Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 12:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209641

Hi,=20

You may refer to the wiki page for tests on HW. : https://wiki.yoctoproject=
.org/wiki/BSP_Test_Plan=20

For single testresults.json file, you can use below command to merge both t=
estresults to single testresult file.=20
$ resulttool merge  <testA.json> <testB.json> =20




Regards,
Jing Hui

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Mikko Rapeli via
> lists.yoctoproject.org
> Sent: Thursday, January 9, 2025 10:17 PM
> To: Tham, Jing Hui <jing.hui.tham@intel.com>
> Cc: qa-build-notification@lists.yoctoproject.org;
> <yocto@lists.yoctoproject.org> <yocto@lists.yoctoproject.org>;
> openembedded-core@lists.openembedded.org; Ross Burton
> <Ross.Burton@arm.com>; Ilias Apalodimas <ilias.apalodimas@linaro.org>; Bi=
ll
> Mills <bill.mills@linaro.org>
> Subject: Re: [OE-core] [qa-build-notification] QA notification for comple=
ted
> autobuilder build (yocto-5.2_M1.rc2)
>=20
> Hi
>=20
> On Mon, Dec 30, 2024 at 08:33:17AM +0000, Jing Hui Tham via
> lists.openembedded.org wrote:
> > QA for yocto-5.2_M1.rc2 is completed. This is the full report for yocto=
-
> 5.2_M1.rc2:
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/t
> > ree/?h=3Dintel-yocto-testresults
>=20
> How are these results generated for each HW?
>=20
> Do you run a build for the machine with some special config on a build
> machine which has the test target connected?
>=20
> Specificially, I'm wondering how to run the manual tests and oeqa runtime
> tests at the same time to produce a single testresults.json file which ha=
s both.
>=20
> The result json files show which images get tested.
>=20
> How did you select these for each HW?
>=20
> Default oeqa runtime tests from TEST_SUITES variable for images without S=
SH
> server don't really work so core-image-base and core-image-minimal testin=
g
> doesn't find anything.
> Only core-image-sato, core-image-weston etc have SSH server and real test=
s
> find something.
> I wonder if some other tests should be done for these images without SSH
> over serial console.
>=20
> > =3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
> > For Beaglebone, there is a new bug found: Bug 15703 - [5.2 M1 RC2] Fail=
 to
> start matchbox-desktop on beaglebone:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15703
> > Since there is no graphic desktop, all graphics-related test cases are =
skipped.
> >
> > For the new BSP BeaglePlay, the test for genericarm64 image could not b=
e
> completed due to bug 15704. So there are only test results for genericarm=
64-
> alt image this time.
> > Bug 15704 - [5.2 M1 RC2] BeaglePlay: System hangs randomly and kernel
> call trace with 6.12:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15704
>=20
> I've done some testing of genericarm64 machine builds on AMD KV260 which
> I could also contribute to yocto-testresults-contrib repo, as well as som=
e
> fixes/changes to oe-core/poky and/or bug reports/feature requests:
>=20
>  * testing done in Linaro Lava lab with AMD KV260 devices running Linaro
> Truste Substrate u-boot
>    based firmware with secure boot disabled
> ( https://gitlab.com/Linaro/trustedsubstrate/meta-ts ).
>    HW has been slightly modified to enable flashing firmware and SW
> automatically.
>=20
>  * default poky distro build images don't work for testing because serial
> console getty
>    setup is broken. Thus serial login prompt fails which our Lava testing=
 uses to
> detect
>    a fully booted system. Fix is to add KV260 serial console to genericar=
m64 or
> to fix
>    serial console detection with udev also on sysvinit. systemd images wi=
th
> udev work
>    correctly. Example:
>=20
> https://ledge.validation.linaro.org/scheduler/job/99486
>=20
> INIT: Id "S0" respawning too fast: disabled for 5 minutes
> INIT: Id "S1" respawning too fast: disabled for 5 minutes
> INIT: Id "S2" respawning too fast: disabled for 5 minutes
> INIT: Id "S0" respawning too fast: disabled for 5 minutes
> INIT: Id "S1" respawning too fast: disabled for 5 minutes
> INIT: Id "S2" respawning too fast: disabled for 5 minutes
>=20
>  * testexport.bbclass not enabled so testing outside of build environment=
 is
> hard.
>    Using exported tests works well in Linaro Lava so I've enable them in =
the test
> build
>    and modified the output files to contain full image name to easily mat=
ch
>    image with image specific test export file. Draft patch:
>=20
> --- a/meta/classes-recipe/testexport.bbclass
> +++ b/meta/classes-recipe/testexport.bbclass
> @@ -139,7 +139,7 @@ def copy_needed_files(d, tc):
>                  shutil.rmtree(os.path.join(subdir, dir))
>=20
>      # Create tar file for common parts of testexport
> -    testexport_create_tarball(d, "testexport.tar.gz",
> d.getVar("TEST_EXPORT_DIR"))
> +    testexport_create_tarball(d, "testexport_" +
> + d.getVar('IMAGE_LINK_NAME') + ".tar.gz", d.getVar("TEST_EXPORT_DIR"))
>=20
>      # Copy packages needed for runtime testing
>      package_extraction(d, tc.suites)
>=20
>    Enabled in local.conf with:
>=20
> IMAGE_CLASSES +=3D "testexport testimage"
>=20
>  * Since serial console works correctly with systemd init, testing poky-a=
ltcfg
> distro
>    instead of poky, but that downgrades kernel from 6.12 to 6.6 which is =
not
> that interesting
>    for us. Thus updated kernel to 6.12 with draft poky change:
>=20
> --- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> +++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
> @@ -2,7 +2,7 @@
>  DISTRO_FEATURES:append =3D " pam usrmerge"
>=20
>  # Use our alternate kernel version
> -PREFERRED_VERSION_linux-yocto =3D "6.6%"
> +#PREFERRED_VERSION_linux-yocto =3D "6.6%"
>=20
>  # Ensure the kernel nfs server is enabled  KERNEL_FEATURES:append:pn-lin=
ux-
> yocto =3D " features/nfsd/nfsd-enable.scc"
>=20
>  * core-image-base boots to serial console login and reboot succeeds. Fur=
ther
> testing
>    with oeqa runtime does not work since SSH server not installed.
>=20
>    https://ledge.validation.linaro.org/scheduler/job/99485
>=20
>  * core-image-minimal boots to serial console login and reboot succeeds.
> Further testing
>    with oeqa runtime does not work since no SSH server installed.
>=20
>    https://ledge.validation.linaro.org/scheduler/job/99484
>=20
>  * core-image-sato boots to serial console login and reboot succeeds. Sin=
ce
> SSH server is
>    on image oeqa runtime tests run and results are:
>=20
>    https://ledge.validation.linaro.org/scheduler/job/99483
>=20
> 2025-01-09 08:08:13,221 - runtime - INFO - Ran 73 tests in 186.726s
> 2025-01-09 08:08:13,222 - runtime - INFO - FAILED
> 2025-01-09 08:08:13,222 - runtime - INFO -  (failures=3D4, skipped=3D49)
> 2025-01-09 08:08:13,239 - runtime - INFO - RESULTS:
> 2025-01-09 08:08:13,239 - runtime - INFO - RESULTS -
> connman.ConnmanTest.test_connmand_help: PASSED (0.75s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> connman.ConnmanTest.test_connmand_running: PASSED (0.70s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> date.DateTest.test_date: PASSED (9.10s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS - df.DfTest.test_df:
> PASSED (0.74s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTest.test_syslog_running: PASSED (0.72s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (2.28s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (1.31s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> pam.PamBasicTest.test_pam: PASSED (2.88s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
> 2025-01-09 08:08:13,240 - runtime - INFO - RESULTS -
> ping.PingTest.test_ping: PASSED (0.01s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> python.PythonTest.test_python3: PASSED (1.25s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> scp.ScpTest.test_scp_file: PASSED (2.81s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS - ssh.SSHTest.test_ssh=
:
> PASSED (0.72s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.71s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdBasicTests.test_systemd_list: PASSED (3.07s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.89s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdJournalTests.test_systemd_journal: PASSED (1.12s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_disable_enable: PASSED (7.29s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_status: PASSED (0.76s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_stop_start: PASSED (2.78s)
> 2025-01-09 08:08:13,241 - runtime - INFO - RESULTS -
> apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> buildcpio.BuildCpioTest.test_cpio: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> buildlzip.BuildLzipTest.test_lzip: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_help: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_history: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_info: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_search: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_version: SKIPPED (0.00s)
> 2025-01-09 08:08:13,242 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_exclude: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install_dependency: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install_from_disk: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install_from_http: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_installroot: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_installroot_usrmerge: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_makecache: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_reinstall: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_repoinfo: SKIPPED (0.00s)
> 2025-01-09 08:08:13,243 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_gcc_compile: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_gpp2_compile: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_gpp_compile: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_make: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> gi.GObjectIntrospectionTest.test_python: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> go.GoHelloworldTest.test_gohelloworld: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS - ldd.LddTest.test_ldd=
:
> SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> logrotate.LogrotateTest.test_logrotate_newlog: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> logrotate.LogrotateTest.test_logrotate_wtmp: SKIPPED (0.00s)
> 2025-01-09 08:08:13,244 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> perl.PerlTest.test_perl_works: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rpm.RpmBasicTest.test_rpm_help: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rpm.RpmBasicTest.test_rpm_query: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rpm.RpmBasicTest.test_rpm_query_nonroot: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size:
> SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rpm.RpmInstallRemoveTest.test_rpm_install: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rust.RustCLibExampleTest.test_rust_c_lib_example: SKIPPED (0.00s)
> 2025-01-09 08:08:13,245 - runtime - INFO - RESULTS -
> rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> stap.StapTest.test_stap: SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo:
> SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPPED
> (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> weston.WestonTest.test_wayland_info: SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> weston.WestonTest.test_weston_can_initialize_new_wayland_compositor:
> SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> weston.WestonTest.test_weston_running: SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> weston.WestonTest.test_weston_supports_xwayland: SKIPPED (0.00s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> opkg.OpkgRepoTest.test_opkg_install_from_repo: FAILED (135.86s)
> 2025-01-09 08:08:13,246 - runtime - INFO - RESULTS -
> parselogs.ParseLogsTest.test_parselogs: FAILED (4.76s)
> 2025-01-09 08:08:13,247 - runtime - INFO - RESULTS -
> systemd.SystemdBasicTests.test_systemd_failed: FAILED (2.19s)
> 2025-01-09 08:08:13,247 - runtime - INFO - RESULTS -
> xorg.XorgTest.test_xorg_running: FAILED (1.27s)
> 2025-01-09 08:08:13,250 - runtime - INFO - SUMMARY:
> 2025-01-09 08:08:13,250 - runtime - INFO - runtime () - Ran 73 tests in
> 186.734s
> 2025-01-09 08:08:13,250 - runtime - INFO - runtime - FAIL - Required test=
s
> failed (successes=3D20, skipped=3D49, failures=3D4, errors=3D0)
>=20
>    opkg.OpkgRepoTest.test_opkg_install_from_repo failure is a test setup =
issue
> since
>    package repo from build environment is not exported to test environmen=
t.
>=20
>    parselogs.ParseLogsTest.test_parselogs fails since firmware and kernel=
 trigger
> some new
>    non-fatal warnings to dmesg. Needs detailed investigation to either su=
press
> warnings or
>    to fix root causes.
>=20
>    systemd.SystemdBasicTests.test_systemd_failed fails since xserver-
> nodm.service fails
>    start. X11 graphics support on AMD KV260 is not enabled or working yet=
 on
> genericarm64
>    machine.
>=20
>    xorg.XorgTest.test_xorg_running fails since xorg startup fails.
>=20
>  * core-image-weston boots to serial console login and reboot succeeds. S=
SH
> server is installed
>    so oeqa runtime tests run and results are:
>=20
>    https://ledge.validation.linaro.org/scheduler/job/99486
>=20
> 2025-01-09 08:55:34,919 - runtime - INFO - ------------------------------=
---------
> -------------------------------
> 2025-01-09 08:55:34,919 - runtime - INFO - Ran 73 tests in 192.950s
> 2025-01-09 08:55:34,920 - runtime - INFO - FAILED
> 2025-01-09 08:55:34,920 - runtime - INFO -  (failures=3D6, skipped=3D49)
> 2025-01-09 08:55:34,937 - runtime - INFO - RESULTS:
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> date.DateTest.test_date: PASSED (9.06s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS - df.DfTest.test_df:
> PASSED (0.73s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTest.test_syslog_running: PASSED (0.71s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (2.29s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (1.29s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> pam.PamBasicTest.test_pam: PASSED (2.89s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> ping.PingTest.test_ping: PASSED (0.01s)
> 2025-01-09 08:55:34,938 - runtime - INFO - RESULTS -
> scp.ScpTest.test_scp_file: PASSED (2.78s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS - ssh.SSHTest.test_ssh=
:
> PASSED (0.74s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.69s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdBasicTests.test_systemd_list: PASSED (3.10s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.91s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdJournalTests.test_systemd_journal: PASSED (1.11s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_disable_enable: PASSED (7.28s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_status: PASSED (0.76s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_stop_start: PASSED (2.75s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> weston.WestonTest.test_wayland_info: PASSED (7.56s)
> 2025-01-09 08:55:34,939 - runtime - INFO - RESULTS -
> apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> buildcpio.BuildCpioTest.test_cpio: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> buildlzip.BuildLzipTest.test_lzip: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> connman.ConnmanTest.test_connmand_help: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> connman.ConnmanTest.test_connmand_running: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_help: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_history: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_info: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_search: SKIPPED (0.00s)
> 2025-01-09 08:55:34,940 - runtime - INFO - RESULTS -
> dnf.DnfBasicTest.test_dnf_version: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_exclude: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install_dependency: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install_from_disk: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_install_from_http: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_installroot: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_installroot_usrmerge: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_makecache: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_reinstall: SKIPPED (0.00s)
> 2025-01-09 08:55:34,941 - runtime - INFO - RESULTS -
> dnf.DnfRepoTest.test_dnf_repoinfo: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_gcc_compile: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_gpp2_compile: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_gpp_compile: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> gcc.GccCompileTest.test_make: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> gi.GObjectIntrospectionTest.test_python: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> go.GoHelloworldTest.test_gohelloworld: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> kernelmodule.KernelModuleTest.test_kernel_module: SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS - ldd.LddTest.test_ldd=
:
> SKIPPED (0.00s)
> 2025-01-09 08:55:34,942 - runtime - INFO - RESULTS -
> logrotate.LogrotateTest.test_logrotate_newlog: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> logrotate.LogrotateTest.test_logrotate_wtmp: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> oe_syslog.SyslogTestConfig.test_syslog_startup_config: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> perl.PerlTest.test_perl_works: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> ptest.PtestRunnerTest.test_ptestrunner_expectfail: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> python.PythonTest.test_python3: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> rpm.RpmBasicTest.test_rpm_help: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> rpm.RpmBasicTest.test_rpm_query: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> rpm.RpmBasicTest.test_rpm_query_nonroot: SKIPPED (0.00s)
> 2025-01-09 08:55:34,943 - runtime - INFO - RESULTS -
> rpm.RpmInstallRemoveTest.test_check_rpm_install_removal_log_file_size:
> SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> rpm.RpmInstallRemoveTest.test_rpm_install: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> rpm.RpmInstallRemoveTest.test_rpm_remove: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> rust.RustCLibExampleTest.test_rust_c_lib_example: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> rust.RustCompileTest.test_cargo_compile: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> rust.RustCompileTest.test_rust_compile: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> stap.StapTest.test_stap: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_coredump_minidebuginfo:
> SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> systemd.SystemdServiceTests.test_systemd_disable_enable_ro: SKIPPED
> (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> xorg.XorgTest.test_xorg_running: SKIPPED (0.00s)
> 2025-01-09 08:55:34,944 - runtime - INFO - RESULTS -
> opkg.OpkgRepoTest.test_opkg_install_from_repo: FAILED (136.68s)
> 2025-01-09 08:55:34,945 - runtime - INFO - RESULTS -
> parselogs.ParseLogsTest.test_parselogs: FAILED (4.11s)
> 2025-01-09 08:55:34,945 - runtime - INFO - RESULTS -
> systemd.SystemdBasicTests.test_systemd_failed: FAILED (2.21s)
> 2025-01-09 08:55:34,945 - runtime - INFO - RESULTS -
> weston.WestonTest.test_weston_can_initialize_new_wayland_compositor:
> FAILED (0.54s)
> 2025-01-09 08:55:34,945 - runtime - INFO - RESULTS -
> weston.WestonTest.test_weston_running: FAILED (1.27s)
> 2025-01-09 08:55:34,945 - runtime - INFO - RESULTS -
> weston.WestonTest.test_weston_supports_xwayland: FAILED (0.73s)
> 2025-01-09 08:55:34,948 - runtime - INFO - SUMMARY:
> 2025-01-09 08:55:34,948 - runtime - INFO - runtime () - Ran 73 tests in
> 192.962s
> 2025-01-09 08:55:34,948 - runtime - INFO - runtime - FAIL - Required test=
s
> failed (successes=3D18, skipped=3D49, failures=3D6, errors=3D0)
>=20
>    opkg.OpkgRepoTest.test_opkg_install_from_repo fails like on core-image=
-
> sato with same root cause,
>    missing package repo in test environment.
>=20
>    parselogs.ParseLogsTest.test_parselogs fails like on core-image-sato.
>=20
>    systemd.SystemdBasicTests.test_systemd_failed fails since weston.servi=
ce
> fails
>    to start. Details need to be investigated and likely related to graphi=
cs stack
>    not setup yet on genericarm64 for AMD KV260.
>=20
>    weston.WestonTest.test_weston_can_initialize_new_wayland_compositor
> fails since
>    weston.service startup fails.
>=20
>    weston.WestonTest.test_weston_running fails since weston.service start=
up
> fails.
>=20
>    weston.WestonTest.test_weston_supports_xwayland fails since
> weston.service startup
>    fails.
>=20
> I could upload testresult.json files from these test runs to yocto-testre=
sults-
> contrib.
> Which branch name should I use? Any reviews needed for the changes? I
> could also report the test failures to bugzilla, if that makes sense. I w=
ill try get
> these fixed and also improve the tests, for example the small images with=
out
> SSH could be checked a bit more over serial console.
>=20
> Any feedback to this first test run is welcome.
>=20
> Cheers,
>=20
> -Mikko
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#495): https://lists.yoctoproject.org/g/qa-build-
> notification/message/495
> Mute This Topic: https://lists.yoctoproject.org/mt/110516091/6424044
> Group Owner: qa-build-notification+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/qa-build-
> notification/leave/13581802/6424044/1746813897/xyzzy
> [jing.hui.tham@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


