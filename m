Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DE1CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 13:55:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42931.1781877322363625429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 06:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VeyEhaYP;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781877322; x=1813413322;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lcDtwchBimpUg4YxzN/ykXKjXVdaZYo8JXYjXeNfHxM=;
  b=VeyEhaYPdx+olxHs2RzzeeER4uK8K8tsTu/UD4/O4aOI/LwNwTzm2xmG
   50F2qOLAqyIGEX3GoOm0lZ6LxN/t/Gmc13Tonrs5S4emRFLFlB/4wneJc
   kNb68Ejgz2TP68c0d82O/w4IxuFPIE0Vip+8MGqpI2VJ9SYm2PvMhMXaZ
   u7dni4oTzb0QZqL8Ozg1dvz4TrExsD1Zm4F/MmDLMxg1Qpdp9mJaiEpYH
   BxUkvj6/KW8MtbCHHkBb81QzjJEiqGYq4hyum+lWA+CvQeLTcJBWVT5oC
   6RlkyRGKq2Ff82JdUkCVgRGBpJ5LBHPx3q2SAGXHo6521Au40BWwA7Ga0
   A==;
X-CSE-ConnectionGUID: f07MDmKSR86sbIJduPtAyg==
X-CSE-MsgGUID: UQnvlJzRRaO81o99BT31wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="108269368"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="108269368"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 06:55:22 -0700
X-CSE-ConnectionGUID: KJ1NwZZNQNW+krkI4/Fb0Q==
X-CSE-MsgGUID: dg+BzgynRsybwNQcnihPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="250554936"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 06:55:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 06:55:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 06:55:21 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 06:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h1QBxnL62fby33sOCkNfZVzLfCVkyLPkuH/+jfTD/UPsF/bB1oGvR0kFD8FfTmoe4P9WPfXNn0Yl+2wJ5FLbu2pyEh5tLJNppqkDvMWkgJYTgKdtYpxItLasj1FkL9Hr/HI5LNCs2JuPwKWop65HVA5fsMLa9kNMAHYi/2FB4c5v56Yzwb9D5kymrZcSKv18wgCVlXIwpqqkDsBiuI65RCrs676LXxkigfvdP1kPNkuZTjgmk4IsctZGgdT7wLvMvUApnIaapKiQhOPmIuxQE4RP2hfeD2knBGU0ZXlSyPFSv0l3CMgLwKOYH3AbfCr6LHmtlX3KbS9bLkTRmB/Nvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcDtwchBimpUg4YxzN/ykXKjXVdaZYo8JXYjXeNfHxM=;
 b=xZY/kkCzI6G7sqpJd/YUCYjtNIis2pe6RzgVh59z2uH5OjSL6bhIsUdD8gXcMQVHITEUuAjJjB/TS0CatXvIqGe1B8RvXtdfCfIadaMTxtPspPyPpbFJ0BW9ADtexbCiO8XoVFu4h4exbMPM5qGlEE3MgLtda9ZhtQ96UL6Dhj5eh4ea3U1jAG2Hyt9o4VVH8BgO9THNrqmFWpKIYFDKvMgyLnHU2tQFV0RpGsF3OYR5ycEpwpnckxQ3yA8CaJMul1o22pNWK6YcEydlMIMaSPUJnW+jvBx3g795n9QwxxQw+sWZIWo4td4APKKDgewo/zaH0KK+SsQ8368EjiGRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 13:55:17 +0000
Received: from PH8PR11MB7022.namprd11.prod.outlook.com
 ([fe80::e550:3c98:b65a:2e04]) by PH8PR11MB7022.namprd11.prod.outlook.com
 ([fe80::e550:3c98:b65a:2e04%3]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 13:55:17 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-6.1_M1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-6.1_M1.rc1)
Thread-Index: AQHc+kxx9I11spArqkmIaiWQ+oiT17Y/PvkggAayh+A=
Date: Fri, 19 Jun 2026 13:55:17 +0000
Message-ID: <PH8PR11MB702205497B9E526CB0969F8DF4E22@PH8PR11MB7022.namprd11.prod.outlook.com>
References: <0101019eb3c283d7-332c2687-00f5-49b4-84f6-7ea02f2b99eb-000000@us-west-2.amazonses.com>
 <0978cb5c5c2086ed0d5ffdcf8f4465b581769d00.camel@linuxfoundation.org>
 <18B931698ABB7E61.312216@lists.yoctoproject.org>
In-Reply-To: <18B931698ABB7E61.312216@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7022:EE_|PH7PR11MB7662:EE_
x-ms-office365-filtering-correlation-id: c88c3186-7325-4c6c-0c64-08dece0a6525
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|4022899009|376014|38070700021|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003;
x-microsoft-antispam-message-info: ILkscPGQhaU5q9F7LlVjKlbs/4AYA4mKWYQCjNqBoi3RAKmP1PABrrsxwpRw9AZkjCczKTYf3QChkYJVSOVrB2QptPQg44PnDRFVVZtcljg3qAKuubMxKYR+UPqX4oXdDVsw5gQuJnjEWJmi0IOs+rJrX5yZ/iT9+IBBevOa31okgVXcM0y4xh7fhmYvL0HKKHJYJMAmXreSdRnisItFSzYXZVzg74zNu3eIXW6L3Lm1hMP2bLzyNTIIBhvRaGm9/MWkHjO4Mz4GyzXO4tdrtl6dHkm/iVXhqh/2xm8g/MZM7G3xicRtutty1umianwIWj0/0cgxBCDZMIzMT5n6HN21n/lVTKqFKhARIPtCH2hpqqk6Q9FY78iShPUVThrBIVl30QOWJlZF+3aUildJUBQFkQGUfYUI2Kjp22ZUL0XjWiGcNwD4rjLOFxJ6+x9TvcOielXxan+8FyFjPu+TpwhnWmK4dXJXjxZA4eVJvYPS4tPpQ1VxFOTmBt3h+XSZDiPF+MQPsapekDNRP4LVvKTCKvHJC9ITtyLHwT3XOUSH0Y7dQHKgrYtCAqiiP2gz1ZqKRVb0xZ73cUaGcfSOe6TsSFdTt1z4//RrWtuEknuwiEslpOVKZDoezDGxcLGdf20j/2a7tbAO1+fZ7YNDBjr+TDj8paLJ+oYzj3ZAzz4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7022.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(4022899009)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckVtalkyYWlRakJ2a254VHF0UkhVUGRJUXlBQzluWVkzWWY4eGpDR3RYMldH?=
 =?utf-8?B?M3YyOVZXWXFSQ1ZKbkpOMUVjNGF0bnNHVUdHSEFCbDc5VVVudnFvS0lERlg5?=
 =?utf-8?B?MlRqMkp0elpPYWRxcitDSC9pemtYWk85dUpoWG9iTmlyakJlcGY4aUlNY2g4?=
 =?utf-8?B?UlJTTi8xUUVxaWg1WTdEeEtOZS9LdHhiWWlGdkkxUzZtYU4xc01Hd3dkTWk1?=
 =?utf-8?B?dnR0QmwxVkIxTER2YU8yZkVkVmRyU0ZrMnNPQ1o4bkVKYndNbVhkQUZJTEEx?=
 =?utf-8?B?YzNRYUc4NS95MUR6SmcxUCtYaW50TjdTK1g2b3NQdEQxRk5WK3lLUEI0Zk1h?=
 =?utf-8?B?aGQ4SlZ5Q1pkdzNHWTJpZW4vRndOWkVLWThzL1lZMnFJV2t3K1M5NGJyd0Ji?=
 =?utf-8?B?K1l6endUZHNaMkR4eXZ3VWE3cmxjUmo2SEE2KzAvTDc5UG9HU2k0VWpxbTFW?=
 =?utf-8?B?YWdHRThxVEFLVnh2MW5POHFyQkVQVVlzcFhZYjFhdml2ZDBNVmQ4YzBKZVBR?=
 =?utf-8?B?WjU5NFY5TmVnc2xhMWFBQkptV0hYRzRaY0Npc3NCUVU5Q3A5RU02N2twQnY0?=
 =?utf-8?B?WnZvT2dPUDBCWDlYRHhYcmFiaUxZRjF4LzNnUmE5NHY0cjJvODFIYVk3TzA2?=
 =?utf-8?B?M3R4c3FxWTN2QlRTVW0rbytDVk1PZHJuTTVKQUpoMTVUTjhzNmdMakhuYTAr?=
 =?utf-8?B?QWlLdUZjaUowNVhNbnlleFBqMHV3emk0MUwvZG1aQTY1N3FsTCs3YWlIQVJ4?=
 =?utf-8?B?cUJJeUEzcXBQTnBRQ3Z3UHFQZTFkQ01wcHJPcjUvRHU2R0NxQnRNYTRVWm9U?=
 =?utf-8?B?MlFDZ0xMRHFnY1JTZzZtaVBKQkx2V3R4VGFpdE1URkN6anVwZnRSbWdEWUgv?=
 =?utf-8?B?dlphQXhrUlVhbm96UHo4Y3FBY2VYMWJYTlhINkZVU3ZhMmFYMWNpbm1lWVIr?=
 =?utf-8?B?U3lEODRIVVQ4Y1ZGSWJyNFJvOEd4N2UvYzA3c0NxRzFxbXBaTG9PT05tY0lO?=
 =?utf-8?B?d3h5VGhoY3JwVUFoSGFmWXV2b3VVWjlJVUtOR0NLdFpuckhzd3dkeW45WEh3?=
 =?utf-8?B?cTN4UGl4ZEs2NDZaWnpLc3VwajdOalBkTzk5U2dyUXptdWorb0kvVWhLSndh?=
 =?utf-8?B?QWFpdEVXeTY5RnBmWkZRWHVISmhjS2kwazh2Um5Ea1BlbGxDOHYvV0J2Y0ZG?=
 =?utf-8?B?QXpicUVZYWFsZ090WFk1Q1JmdFJzeWdJa3FGcnREZi9ndFNhcDB4d0FpQVRq?=
 =?utf-8?B?b0p0WXY4MHV2Ti9qejU2ZzZWMWFIa0MwYTVrYmF1Qkp0Z1pQR0c0M3pEckdo?=
 =?utf-8?B?VkdsbnFHVk9OWmhINGE1a3BOYTBZdjlIMFZ3QkIzZmp5T1hMbHdLVUlpU084?=
 =?utf-8?B?bjNMZ1hOcFgvS1JHNjVLd3VxZTZ1bDhtZWJwT2ZtK1FxUmFjNndkQ0NPdFNX?=
 =?utf-8?B?QUc1TWNPaTNvZm5ZVnNVVmpQcnhWVXJONG10OTlhdHpwS0tBVWJpcVNZLzdM?=
 =?utf-8?B?WlpGQ1QvVUVrTkJDTWp2b1BvWWpZditEaExPNWRGQkN4aTJhMGNCRTQ3T1pq?=
 =?utf-8?B?akowUWlpczh1am0zZ2hMbmtLbVhQTUtTNEtaK3RKbU5YK1VpVVBTdWU0K1dM?=
 =?utf-8?B?MThET245clpWSmhkRS9zelg5TjF1TFBQL3p6N1NrTUFVazg3QkpHWHVmWk9L?=
 =?utf-8?B?WGVGNCttaytGdEpzUkRialIxQkllN1pEd09BcXhhOWJuNnhBSUNDakU4RERI?=
 =?utf-8?B?NUZjc0lyUGIxWEp0eW9pZUY4V0JwU2pZZnFhdzdXRENYZ0xvMkc3L1cxNWo1?=
 =?utf-8?B?dUNVQ0NNL1VsTzBqZmdCODlwVm5MeXY2VGNrVGZVcXZrdkVTMmZ1K0dTaUxG?=
 =?utf-8?B?MkhsOGkzVFFFMGM4TXYwRVpYTWZnWCt3S3VxemtOQTEyRTBTYzNPa3hyd1BE?=
 =?utf-8?B?Ly9KVEJRNmtnNmJRT2Y4ZEw0MFpqZVo2eGZqMW96eXU0ejYzN29JWnBVdnJK?=
 =?utf-8?B?N0FQMnJjTWxqVjZGYTc1SVVZc0VoV3ZmTk5yVHhZSEdmVERyalh4d3ZWZUVm?=
 =?utf-8?B?S3Q1M3cwbjQ1OENiSk9zTnpjZUsvVVNWYmpaZGFMeDVBZVYvS1hyWHNpZTBv?=
 =?utf-8?B?Ykk4REdQaEZmblUxNXdOZjU1UjgwL1dXNFh0enpmRkFhRElVQ09HZkZmSitw?=
 =?utf-8?B?aTVnbVpmRXJGQnZ0YTBvQXlZbXN2MVFBS3ludWpxOWYzWk9lbDZIM2JTZGUz?=
 =?utf-8?B?T1B5WVNFQTdNWHJjMzN0bkxiaTFNRHJCRmE0Q0RoR2hCekN5UVpYS3RGSmNU?=
 =?utf-8?B?cyswUXlickk3RzZlbEswK3FPd3UyVHRsMm1mSjE0OTg5NE5UZUVTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UQQeUaqvHOkfeLJBDN0jy20JuTm2JYWqRh0Fl6Avz9/fhhazo4GSBmRWisi3liBGpU8/pqlhcEaquRzBIUcr+FWDAvMw0MPDyr7BfGBaTCbu0SR+f1nxpYgpsGNU3XWW4kxMJg/+GKt/JGB3q27JRu1TMUBYPs54o1GCDpzOzmIQ1rYBHgEpnpuo+Cuf6J8MTDIeWgMBt/FU5pcPqWB/4tJdBi8tfUQtkQAsyLw32Rgm5TfrUXow7YwwG58ir+O2u+TILhgaQ7LM+AAJAP+K9R1EueHvntbv2kHpKpyLdS9vLR6PXs2rJkJNnl/OISK2tj3SKjs5xsZnKC8kjQXcXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7022.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88c3186-7325-4c6c-0c64-08dece0a6525
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 13:55:17.4689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBMiRR1rNvm8Y0XK/2xFTpAmgFD4G3KrljAjWIaww26w/8sPdi2sSKrPAcN+tD0ZSOxauoDFApsEnRr9A10wzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 13:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239171

SGkgQWxsLA0KDQpRQSBmb3IgeW9jdG8tNi4xX00xLnJjMSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9q
ZWN0Lm9yZy95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9aW50ZWwteW9jdG8tdGVz
dHJlc3VsdHMNCg0KPT09PT09PSBTdW1tYXJ5ID09PT09PT09DQpObyBoaWdoIG1pbGVzdG9uZSBk
ZWZlY3RzLg0KDQpObyBuZXcgaXNzdWUgZm91bmQuDQoNClRoYW5rcywNCkRlYmFsIEdob3NoDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBHaG9zaCwgRGViYWwgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcNClNlbnQ6IDE1IEp1bmUgMjAyNiAxMzoxNA0KVG86IHFhLWJ1aWxkLW5vdGlmaWNh
dGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBZb2N0by1tYWlsaW5nLWxpc3QgPHlvY3RvQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+OyBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFBva3lidWlsZCBVc2VyIDxwb2t5YnVpbGRAeW9j
dG9wcm9qZWN0Lm9yZz4NClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBu
b3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNi4xX00x
LnJjMSkNCg0KSGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFB
IGV4ZWN1dGlvbiBmb3IgWVAgYnVpbGQgeW9jdG8tNi4xX00xLnJjMS4gV2UgYXJlIHBsYW5uaW5n
IHRvIGV4ZWN1dGUgdGhlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCg0KT0VRQS1t
YW51YWwgdGVzdHMgZm9yIGZvbGxvd2luZyBtb2R1bGU6DQoNCk9FLUNvcmUNCkJTUC1odw0KDQoN
ClJ1bnRpbWUgYXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQpBbGRlciBMYWtl
DQpQYW50aGVyIExha2UNCkFycm93IGxha2UNCkJhcnRsZXR0IGxha2UtUw0KQW1zdG9uIGxha2UN
ClR3aW4gbGFrZQ0KQmVhZ2xlYm9uZQ0KQmVhZ2xlUGxheQ0KDQoNCkVUQSBmb3IgY29tcGxldGlv
bjogMTgvMDYvMjAyNi4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpEZWJhbCBHaG9zaA0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcgPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcNClNlbnQ6IDEyIEp1bmUgMjAyNiAxNDo0OA0KVG86IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBs
aXN0cy55b2N0b3Byb2plY3Qub3JnOyB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQpTdWJq
ZWN0OiBSZTogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21w
bGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTYuMV9NMS5yYzEpDQoNCk9uIFdlZCwgMjAy
Ni0wNi0xMCBhdCAyMjo1OCArMDAwMCwgUG9reWJ1aWxkIFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgd3JvdGU6DQo+IA0KPiDCoMKgwqAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9j
dG8tNi4xX00xLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kIGlzIGF2
YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiDCoMKgwqDCoMKgwqDCoCBodHRwczovL3ZhbGt5cmllLnlv
Y3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by02LjFfTTEucmMxDQo+IA0KPiANCj4gwqDCoMKgIEJ1
aWxkIFVSTDogDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJp
ZS8jL2J1aWxkZXJzLzI5L2J1aWxkcy8zOTYNCj4gMQ0KPiANCj4gwqDCoMKgIEJ1aWxkIGhhc2gg
aW5mb3JtYXRpb246IA0KPiANCj4gwqDCoMKgIGJpdGJha2U6IGM2ODdkNDJiODFiMTdlN2EyMzk5
MDk5Y2FiMGYxYTZhYWZjZjY1MjANCj4gbWV0YS1hZ2w6IDNjNTViNDViZjkyMGJlYzkzOTM4YWYw
MmYyNDUyY2Q2OThkM2JhY2MNCj4gbWV0YS1hcm06IDAyZDM2MWI0MzU5ZmRlOWI2NjQ2MTI5OTgw
ZjE0ODRmN2FhNWIwOWUNCj4gbWV0YS1hd3M6IDVlN2NjOTVmN2Q1NWEwYmEwYWU2YTdlNmU0M2U2
MzIzODExYTE0MGENCj4gbWV0YS1jbGFuZzogNGIxOGY1MzFhOGQxMDQ3ZjQ5ZGQzMDk3ZGRkMDBi
ZTg3MGMwZWQxZQ0KPiBtZXRhLWludGVsOiA1NWUwZmYyNzhmNzA0MGRmZjVlNDUzYzUwOTM1Nzgy
MGU4Y2U0YzliDQo+IG1ldGEtbWluZ3c6IGE0YmE2NzRkNmEwYTE3ZTRjMGJjNGMxMWJiYjlkMGVh
OWRlMmIzMTUNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDUzY2JjYWJhM2YwOWNiNTBiNzJiOTFjMmIz
M2JkYmQ0NzlkYTVmMTkNCj4gbWV0YS1xY29tOiBiYzJkZjU4ZGE1OTlkMGVjMGE2ODI2NzM2ZDJh
N2EyZTE4NjNjYTVjDQo+IG1ldGEtdmlydHVhbGl6YXRpb246IDAyMmY0MzU2ZDRhOWIzODlmNTE0
NzJkNDBhOTMzMGFhNTlmNmJiOWENCj4gbWV0YS15b2N0bzogNTljNDEyNDVhZDIzMWY1MzIwZGVm
Y2IyNzU0NzdlM2QyNWEyMjAzZQ0KPiBvZWNvcmU6IGI1YzI0ZTE0OTFkY2I5YWIwZjc4MmRmNmJl
NjU4MmZiZDIxNTE3MjQNCj4geW9jdG8tZG9jczogYmU0MjRiZjUyY2QzYWM5YzgzYTQ2MTdkMGIw
NmFmZThjZGUwNTViZQ0KDQpUaGVyZSB3YXMgb25lIGZhaWx1cmUgaW4gdGhpcyBidWlsZCwgYSBr
bm93biBpbnRlcm1pdHRlbnQgcWVtdWFybTY0IGhhbmcuIFdlIGNhbiBwcm9jZWVkIHdpdGggUUEs
IHRoYW5rcyENCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0KDQoNCg0KDQoNCi09LT0tPS09LT0t
PS09LT0tPS09LT0tDQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NClZpZXcvUmVwbHkgT25saW5lICgjNzE5KTogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvcWEtYnVpbGQtbm90aWZpY2F0aW9uL21lc3NhZ2UvNzE5DQpNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMTk3NDg4NzAvOTk3NjEy
Nw0KR3JvdXAgT3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3By
b2plY3Qub3JnDQpVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cv
cWEtYnVpbGQtbm90aWZpY2F0aW9uL2xlYXZlLzE0NDI2OTk5Lzk5NzYxMjcvNDQwMzM0NTUveHl6
enkgW2RlYmFsLmdob3NoQGludGVsLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

