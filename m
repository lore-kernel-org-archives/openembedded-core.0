Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8935E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 08:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by mx.groups.io with SMTP id smtpd.web11.59503.1735547599331836544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 00:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Bh+Lr9JH;
 spf=pass (domain: intel.com, ip: 198.175.65.18, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735547604; x=1767083604;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=kQDRw2XgkHqJrjfJE2Qk+3tUatBP23DY3dawqIF10Io=;
  b=Bh+Lr9JHeXuq/UiZBDq5FK3i9zwsZBnsm5brtrVFhB93vJs882OGX0U0
   1wQebWoK+cxJNlYb9kPcG4l00EbNa0Mfd2e7OhvoA/6S+hwcRv2t0bTbm
   jDDYJ4jkYlUlIImBVqeTPnAPdeW87Eezc5rYH1A5AD0wcXVAi7nseCNrz
   5iIXh5ofCQqjxjXnq1FGfCHq8RBY5Qz9/gqgqF28fdRN3/w/R5nFmUEwO
   xprpYwgozFr//G+XablUtTnsYC/rSmxMJCORnx1Mml+QlGS+tCAyU85ad
   ABB0EDU0qvhG1cwu10gBY5dpw6LodZWfTV8HUiZaWBWEtKYA91sHD3jXO
   A==;
X-CSE-ConnectionGUID: xST14NPrTeGHaLxYm5YVag==
X-CSE-MsgGUID: ryEWaxeHQLK46LKgta2Sag==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35945709"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="35945709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 00:33:24 -0800
X-CSE-ConnectionGUID: PjOP3cVlSwyrg8HLYosTdA==
X-CSE-MsgGUID: BHK74WDXT5G7mIs89fxrfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104798916"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Dec 2024 00:33:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 30 Dec 2024 00:33:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 30 Dec 2024 00:33:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 30 Dec 2024 00:33:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZwF7wiSL7BegFgdS9O22YNoAQ6YVb4A7Tt4H0bO6gQ/rU0k2wM0aQvRkdG3hVlYoCuQS1pum40S9vaooC23NffQTbjfFS0A2Wu4dqFWT1t9oss/eLP+WyCoZESKL3Hr4IzAuqRvi7pF0OqXD5aqLknZa89ecwaZ8AYu0kfvALOY25Igfq5m1dI5ayYBt7+6E2H2bSCuh7XOomKKMV6Z4IFhLX61KawSayWlPeOmZThuSsj1COEYDI2kgrkp9q1D86FyfZY0RE5rV5Y0gd/qevoa237K1UFGyvFiBOPUsek1OAOj002xikDsPPwZKFKFtrSN+jnGh6hFoPqkQVpSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQDRw2XgkHqJrjfJE2Qk+3tUatBP23DY3dawqIF10Io=;
 b=KSUTg5faS99tH/5LfPtBvx3GIPiWbm/U+3EQk5z9dgXxbqcJqO5/mAijQWqSGn/cnj60qX+Ingei4yYaEO96QIZcrxOWj3/i5OQ6aTGgT1thj3bYVDebqVAw6Ou8csnAECqQJSINoc9QXIclIqoMuzmwkZG4wIqtO7C1bgsyHnJiEmwC251gAarX4ebQXKTLFVN+q0SSEoiBs9qo1rt+MmM78BpIltxAMVJOKMTdUjnecYQSgE/DhgVklMJXY5WjlNwPJ2rPQDYVdJeLQv8ZyvVUmmEmdf8mfCCuoKUuRBBYwfNJ/1AvUa3qZ/qdjvyj5UxeuYGdmvM8NYMEwczO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 08:33:17 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 08:33:17 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M1.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M1.rc2)
Thread-Index: AQHbT0NtbQ5xLneIS0uQEydZyKHQMLL+ioCQ
Date: Mon, 30 Dec 2024 08:33:17 +0000
Message-ID: <DM4PR11MB776009E6944CBE53C0A21CC9A1092@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
In-Reply-To: <2157aff053df3e53717993042e587b20e256f87b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ2PR11MB8472:EE_
x-ms-office365-filtering-correlation-id: 5ef1f357-9567-402d-1d90-08dd28ac9bd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SVA2c0NranhXdElUblBWb1ltTVlLN3M5VzFSOVp1ZEJFZUhLYTVkNUVBUnow?=
 =?utf-8?B?SXVYdGo0by9xdndpVTJXUHZPTTNSd2UvMVk1bTBETU1pTHZSbVVndm5WblBp?=
 =?utf-8?B?cjhWSHNwcHREeU9SMDNrcXRpWXFMaVllcHNwRU5tYjVPVzFNOW9Cci93TkdQ?=
 =?utf-8?B?QXJrVWtMNW8wT1FOY3lIUFZ0ZVpYTDJZSDFiN1QxQkoyUEdYOVNBanYxQ1hj?=
 =?utf-8?B?VFRQR3FOSTlZeHgybVl1VHRac2ZkQkJkRHdYOHR0MFJ0WEpNM3lDUzhWZUZX?=
 =?utf-8?B?VHFBU3FZWnNxZVF5Sk9KcXVYNTNwbzZONHJpajBKbVgzbFB3WHp6cGxUdGU4?=
 =?utf-8?B?eXF6ZEVTekFwbGdqcjYyNjduTXh5VW9oZVlZUHZkcnJMNEJTM3hoSHdrYXE3?=
 =?utf-8?B?eFBpVW0wWUs1SE9XeEtNeVBPZUF6bFlzRmplRlgwSHowRC92Y0JNR1o4VlVT?=
 =?utf-8?B?KzlhdlUzVWtOOHZMczZwR1AyMzRDTU1mWllETFZWS3JJbVFUREtBRXZVRkVw?=
 =?utf-8?B?aUhQWFFicDNtbHVGaVBrTnMyNENDMVhCNnBTaDVpL2Q3WUpiVjhZMzBMTE9Z?=
 =?utf-8?B?dktLdEwyV3ZQMVY3b0Y1OXY5ZnFDRVd0ZEUzbXQ4WGkvbURJYVNHZVdNUmJX?=
 =?utf-8?B?TDA0VjJyY2JibXVtdU9BZStRbUpWUTMzZXRqQm9vZXNOeWJ5RTRnaVhKV012?=
 =?utf-8?B?VXZVc09yN1NJZnZRbzg4dDhZS1cyRTExMkU0SndUalBvYVpJN3Z6QWtTOUhy?=
 =?utf-8?B?MFZqbzk2ZUZoV0VGZFpUS1JLdU44YnNidWNVMjdUdldRRFZRd2cyYWc3ZWtp?=
 =?utf-8?B?YXVpMUs5NG5memJCSXVSSkRueFRqSHZWTWZVZis2bHEweWFieWwvaC9IQjB0?=
 =?utf-8?B?Q05uNE8ySVovbDExcjNSSGE3YTdoZGh0ajA2bVZUN2M1UkUvNXJkd1I0WHpO?=
 =?utf-8?B?TEpFcEhYZEN1Z2VoSG5hWlgrM2hLV0xsOFFwTVdWYmdZYlVZMTVxYk9UWWRW?=
 =?utf-8?B?ZDE4cXgvN2Jza1VOamZ3blZyalJwcE4yM3pwanVQQmVBSVAxSjVVZWNYbklQ?=
 =?utf-8?B?MjRKL216a3hZWDBEVWhUaDh2NVY5ZFZ5R3BSblUwbjNQUkJPelJIZG1iYTRr?=
 =?utf-8?B?UldaeVQvQXN0Nmlsb1E2MU02Z3JNaFJoRlJOclpPazl6aWI4MDZ0VmF1WVh6?=
 =?utf-8?B?L2ZYUEpjVStMMko3SGRZdnBjaUVXV05naXlHWFRwWlhTWWpVcXJHTGd1cXFX?=
 =?utf-8?B?NGVGYU5rUjJOZWR5R2tOV3F2b1djeHQ0VzJrbVBFZ3dXRG9RNDBpSGlIangy?=
 =?utf-8?B?a3cxSmxySGtnT1NicmhPRnBOU1dXdkdnb3pBc0tNQjhEckJuMmFkbkUzTk9l?=
 =?utf-8?B?ekZJYWlkWGJycHh4TUxmUFVUZnp0YVpXNndNN05wOUp1SWoxT2NKRjk5V3VE?=
 =?utf-8?B?dENJUFdCT0kxNFZRbWdEbDhwSzhSZFQvaUt4YTRoMkc2MnpYY3VTMC93dkto?=
 =?utf-8?B?TXl6ZzRIYUZBR0s2U2F3SGM3QWVmRGxaT2M4THZpcjlwYWwvWGdnR052emNa?=
 =?utf-8?B?SW5mbVZkWFVPQmNCa1NQb0xFZnZMZUQwZWFWbi8wZjZrSTZEQjJxaGE2UkFz?=
 =?utf-8?B?dnhybDNsc0xBNllidWpEdnFLN05uZUZjTHgrNEVXb3hYWGpLSHljYUhZckJP?=
 =?utf-8?B?Umdna3BHUGdMMTgzYU45Q1JqK21ncGlob2tua2VlaE1BRnE5UzRFRzhWblQ1?=
 =?utf-8?B?UHprbEgzL25Eb2tNWjBYRERRWklSZG5Za2c1NWFjUXZHNlZCR09PYjZFVlQv?=
 =?utf-8?B?VnFYVGs3V3hYU285c2w3T1BsM1hzcEJiOTJ6WjFLdzVjZmJSZGJKRk9NbHoz?=
 =?utf-8?B?ZUhrUDRDR1NibXh2dzlEN0hOMm9mNVZNb1Y0c20zV1ZqalE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm9nb2VWdnIrd2NNSFRKQmVUQmFuQkVwc1AzL2IxM2o1WXVvcFBnSUhUZmxE?=
 =?utf-8?B?ai9BRGdXUkhNOVEvcHRscy90ay8yV3pxZFJPb1VLa0krWERmRGFyMWJOd2Zh?=
 =?utf-8?B?TVJGeXR3YVlIZk1INlV1MGVncmx4NG9lckxUM0x6NjhxcGRIVVgzM01xbVFa?=
 =?utf-8?B?NWJIMXgrV1JpQXhjb3Naa3NoT3dCUkhjTm9KbXhtYU1ERDB4bEJKc0o2bWE0?=
 =?utf-8?B?NG1HRk5tK1kzd1RKa1NrZjJYQzBNY0JjdStYS0JUOEJheXBqYXd1bGJSeStH?=
 =?utf-8?B?dmhmVXhjS0tnR0hGZ212c01iU3QyUzNwUnZ5Snk5ZER1RDRncS9xMlV0aWpq?=
 =?utf-8?B?bURzNmVBNnhUajJSdmVjS2FKOHo0bDNpMVZTeVFLR0tPQ29YRFNTVVZCdU52?=
 =?utf-8?B?ZWRvT3lHaDh6d0VVVDh3UmhtL2g4ZTdPcE1aUER3TUlxNGRuc0E0RVp0bUQx?=
 =?utf-8?B?UjRHM1gydU11WGFtRjZYNDk5bzU5VTc2Z2pibXUweUhpN05IY0pabjRrZDRF?=
 =?utf-8?B?allvSVJZd05mRW5MUUFxZUN6SjJ5Z2F5NTdvclhTMlBUZTFHMGRWVk8yaFM3?=
 =?utf-8?B?VllqY3hteTdubGZsOWJKZ01WRG9wTWN5Q2JTclZJaUgyZGZkekh5ekxlaTVW?=
 =?utf-8?B?QWRZMThxcFV0cnFYT2xzLzhpN2RlWXQ2UzN5OTU1cGxORmd6a1ZBb1RwcWZW?=
 =?utf-8?B?dndSV2lFY0p4cDJHeitONmVKOXFRcXlXdG9BVnBoR1NYOFpzVWtDeXgxaHJl?=
 =?utf-8?B?dlp2QTNKTTZaZ2dBaDMvRHB3TkVVTnZiWG1iUWtYb2VKdS9mNmVJQnA5Tk13?=
 =?utf-8?B?Tk9hd09oSkFQRlRSSVRmdFJOTlRuZnJxWnpiRzNzbVNjMHFmSXJsMU5ScVZj?=
 =?utf-8?B?OXY0bTQxbnpmWk80RDZyalI1YUhKbjFTTDRveVVxUzRuWmJUYnZEV3owOVNv?=
 =?utf-8?B?Z1ZrOG9aaFZCNVpzckJiYjF5Z2tpK1c4ZGZVdkpaNG1qamN3c05hS0FwNEor?=
 =?utf-8?B?QTJVRXNiL25Mc3hEYmo1eU1RSTFtV1o4ODZKYldBTnBEYW1jbWp6RjBaTlli?=
 =?utf-8?B?Rk5NYWQ0dE8zUHkxQjF0TG5NWktvRVN2dkVCeVJXbVE2SUdvNis4UFdOTDJ2?=
 =?utf-8?B?V01qUkxGZklRcUFjajFVWDY1cHRHV0hBRzA3TGd2UEx4WVJlWGdyMFZYOXBn?=
 =?utf-8?B?d002MkhTSVJLakJQaWpoSFBJOXlLaWdKd2dPcDAzSmVuTUxkRGZZekt0RDB3?=
 =?utf-8?B?REVyTHgrK2hjWUtnZy9lSHVDTTd2KzRzS253NjM2WTVKaG1JM0FqQkN4dnhV?=
 =?utf-8?B?WCtCNlFxRXNocXQ5NmF0Sm9ZTUFwNDVXeFZOWDdpNjYxVUpqNWl3b1BHY2M5?=
 =?utf-8?B?a1FKNTgvTkZGUXJMWkt2dUpEQmU1MHdmc0ZaeVd2L0wzQlRVMVU0MUVNakdM?=
 =?utf-8?B?TkFzbU9Fb21GRTYyR0E4c25oRXFleTVtaEt1eWx3a2w4cnFGYnZVeEQzSFo3?=
 =?utf-8?B?Rys4eGtSVnExOGRKZklCUE5qTFZTVXA3UmZFU1dXNmJnZWxiMDV5V0ZycmhG?=
 =?utf-8?B?WWxyZXNYb0xLUElXTmJpeFZPUjFqemhSNEplRkdPaGlPaGU5NDJBcFpTWThm?=
 =?utf-8?B?dFlGZzhXR0t4ZUNQcHlnUk1nY0dOQXUxNjdpM0FINkFzcVUxZW1nVVFkU2NY?=
 =?utf-8?B?WFpKeFNmSDBJUXFsdlErN2ZicFQyRGhmT0E5bTNtUXZIVUtlVXdHT2lNQVhk?=
 =?utf-8?B?SW5uTWNhS0p6bjZWU3ZUSFhrNTQ0WmYyMWdLdmNTWXdSQitrL0YyMkp5cDZU?=
 =?utf-8?B?RjQ3M1JpT0NWOC81Ti9vci9tSWVDR3Z5dTdpc1R2eHBNNUlsSCtBVEZVOXhK?=
 =?utf-8?B?ZDkrWGZQS0dVeTlpZ0F6MVZSZW8vUHNCSDBHaFBrTTQ5KzB3WlRSNVZHaXRn?=
 =?utf-8?B?Y2hldlBaNHhlN0dyYldVaDJwamNVY2lxelp2bzFjcmorZi90MkdrSGFvMEFL?=
 =?utf-8?B?OHU3UTFWS1hqeVV4YnQ5RnRNL3MxNmdFVVFoMml2VzFycGNqYXZkNURON253?=
 =?utf-8?B?OU1yaWU4WGZjYVpQMnhHeTZ0T1QyRlREVWxIUm13bHdvVGI5S055cTEwbkRQ?=
 =?utf-8?Q?kPBa5dZbuGN4xlzUjG7I2mY3m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef1f357-9567-402d-1d90-08dd28ac9bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 08:33:17.0317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5n/TdEoncw1TPnt38wX4LszDyWuYowMsu1YQEO+G7mg58SJHb240lczbtG/YBlTci9bjkgLZDjDkFyT++xtMiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 08:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209153

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTUuMl9NMS5yYzIgaXMgY29tcGxldGVkLiBUaGlzIGlz
IHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tNS4yX00xLnJjMjogIA0KaHR0cHM6Ly9naXQueW9j
dG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3RyZXN1bHRzLWNvbnRyaWIvdHJl
ZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQoNCj09PT09PT0gU3VtbWFyeSA9PT09PT09
PQ0KRm9yIEJlYWdsZWJvbmUsIHRoZXJlIGlzIGEgbmV3IGJ1ZyBmb3VuZDogQnVnIDE1NzAzIC0g
WzUuMiBNMSBSQzJdIEZhaWwgdG8gc3RhcnQgbWF0Y2hib3gtZGVza3RvcCBvbiBiZWFnbGVib25l
OiANCmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTU3
MDMNClNpbmNlIHRoZXJlIGlzIG5vIGdyYXBoaWMgZGVza3RvcCwgYWxsIGdyYXBoaWNzLXJlbGF0
ZWQgdGVzdCBjYXNlcyBhcmUgc2tpcHBlZC4NCg0KRm9yIHRoZSBuZXcgQlNQIEJlYWdsZVBsYXks
IHRoZSB0ZXN0IGZvciBnZW5lcmljYXJtNjQgaW1hZ2UgY291bGQgbm90IGJlIGNvbXBsZXRlZCBk
dWUgdG8gYnVnIDE1NzA0LiBTbyB0aGVyZSBhcmUgb25seSB0ZXN0IHJlc3VsdHMgZm9yIGdlbmVy
aWNhcm02NC1hbHQgaW1hZ2UgdGhpcyB0aW1lLg0KQnVnIDE1NzA0IC0gWzUuMiBNMSBSQzJdIEJl
YWdsZVBsYXk6IFN5c3RlbSBoYW5ncyByYW5kb21seSBhbmQga2VybmVsIGNhbGwgdHJhY2Ugd2l0
aCA2LjEyOiANCmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTU3MDQNCg0KDQpUaGFua3MsDQpKaW5nIEh1aQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcgPHFhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4g
T24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
DQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTYsIDIwMjQgNjo0OCBBTQ0KPiBUbzogPHlvY3Rv
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0K
PiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEg
bm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXINCj4gYnVpbGQgKHlvY3RvLTUu
Ml9NMS5yYzIpDQo+IA0KPiAgICAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4yX00x
LnJjMikgd2FzIGNvbXBsZXRlZCBvbiB0aGUNCj4gYXV0b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJs
ZSBhdDoNCj4gDQo+IA0KPiAgICAgICAgIGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3Jl
bGVhc2VzL3lvY3RvLTUuMl9NMS5yYzINCj4gDQo+IA0KPiAgICAgQnVpbGQgVVJMOg0KPiBodHRw
czovL3ZhbGt5cmllLnlvY3RvcHJvamVjdC5vcmcvIy9idWlsZGVycy8yOS9idWlsZHMvNjQ3DQo+
IA0KPiAgICAgQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+ICAgICBiaXRiYWtlOiBiYTkw
ZmU2NzNhYTg3Y2IwY2RhOWIyZTQ2NWViZTIwNjM1NTFmNTI3DQo+IG1ldGEtYWdsOiBjMDM2YWE3
YjAyZjhjZGYwZjkxOTAzNThiYjhkODEyOGM0N2M2ODliDQo+IG1ldGEtYXJtOiBiMmM0M2RiZjli
NGU3YzIyMDM4YmRkNWQwMTYzMzk2MmFmZThmMThmDQo+IG1ldGEtYXdzOiA3NGRjN2JjMjFhODFj
ODJmYTk2NDA5OTdkYTIwNmVlMDk3NzA0MzQxDQo+IG1ldGEtY2xhbmc6IDE0NzM0OWI3MzM0Yjhh
MjViOTZiYjA4YzIzNjFhZTBhZTk1ZTdlYjYNCj4gbWV0YS1pbnRlbDogZDAxNTA5NjRjYTdjNmE4
M2QzOGJhNTRjZGEzZTE5YjM0ZDI3NGY4MA0KPiBtZXRhLW1pbmd3OiAyMjBhOGFkNjA1ZDYwMjQ3
ZGYyN2QzYTY2ZmFjYzg5YzE4NTRlZDEwDQo+IG1ldGEtb3BlbmVtYmVkZGVkOiBkYTUxMDk2YmNm
MjU3NzIzYTkyOWM3OTliYzY5MzQ4NzdkZTgxZmE1DQo+IG1ldGEtdmlydHVhbGl6YXRpb246IGMx
ZjY2OGMzMzdhNTY0NTdhY2FjYmJlZmU0ZDFmMTk4OTIwMmJhOTUNCj4gb2Vjb3JlOiBlMzQ1YjM0
NzAzZDRmYTVlMGJjOWE4MmFjMzNiN2MxZmQ4NGY5OWZlDQo+IHBva3k6IGZhZmQxZGIzODJjYzI0
YzUzYzE3MTcwZGY4Mjc4MGY5ZDU5M2NhMWYNCj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRv
bWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDog
Z2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiBy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+IA0KPiANCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjNDg4KTogaHR0cHM6Ly9saXN0cy55b2N0
b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9tZXNzYWdlLzQ4OA0KPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMTAxMzU5
NjgvNjQyNDA0NA0KPiBHcm91cCBPd25lcjogcWEtYnVpbGQtbm90aWZpY2F0aW9uK293bmVyQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb24vbGVhdmUvMTM1ODE4MDIvNjQy
NDA0NC8xNzQ2ODEzODk3L3h5enp5DQo+IFtqaW5nLmh1aS50aGFtQGludGVsLmNvbV0NCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

