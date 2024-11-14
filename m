Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ECAD65C56
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 07:25:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.32553.1731569099253890884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 23:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=k1W6uFtP;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731569099; x=1763105099;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=b9WOuLx/iucEaB7/o9wXi2EMMGQTJ0b6zO3MkFxde5U=;
  b=k1W6uFtP+6q3UXKM1jqaIK1+rY5EyIGNt7zSkAwerYTG98cuf9qYuGE+
   5+EQx3BijQqnzMMJsDJ42T82Rm8rn93Jl6GU40FTWidK2M84dnb9eQHGv
   zVzMnuF9bwVPyFoBg6vJSJYTeUo9aRQik/IRniOYLbYL3jXWCzulAajHX
   +BwFzI68Y535hOVKMONPNfbEcu0CVZejComULb+38qRlFkW9pCtxDQ2in
   P26IWjC8TmfJkgdebDNvCnD7Q2YlzW9ZYhsQUg8iwk1uuT9HzhPZwO3SN
   HB9wTkPssFyBn6WyAQ29lCCGYaQKFrSs5PEITPYZlhmihheEgSh99OLkX
   A==;
X-CSE-ConnectionGUID: 8uP+muYoQRy2UGC9pDsoyw==
X-CSE-MsgGUID: 4F960YW9Td+9LK9GxkWuXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42117951"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42117951"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 23:24:54 -0800
X-CSE-ConnectionGUID: i9RcHjD7Tk+ByD9AzCU6gw==
X-CSE-MsgGUID: BCdmHw65Rta/6Fy97Hylgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88508873"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 23:24:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 23:24:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 23:24:53 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 23:24:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMvjWS0Wr+EMK5jJqhbghvUJ2137QXRl9r00w7fT4eX73AlPncjNI9UXXpq+eWsKRebp7S/kss/iHK09kb367SzB4+QHMVgPL1AeDybJ+hgmXsunL8uNGauoXPWKQnm05KjDvOYlagBYIfBMYReMSgIRTt6eHT3Pmh3Kdb8NzOwvNVTkeHPgybTz+46hpKkCV+btPV/GkubkQN97fQFE5Z2he3cp6Eixr/pKymlspJpr06MGwtQf+pOqKmPQj7CYsJx02RPa8Qbql5sY84TsykvI9v7DiZ+1G+03FVn4URey7sHFj6tVPuA+8MXnf2ZzT8OxfveGve7qpLgZDfgyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9WOuLx/iucEaB7/o9wXi2EMMGQTJ0b6zO3MkFxde5U=;
 b=SdHCazChFouyxNS1mabHkQ/XFOfWnFHpkGmd72bzl/kLd97w36l7pH1cHDbXzEj1RHqkIGb196xAYPWsFo3pFMD090OmZh3hoBJ/xqP4pe4VzCeOiOm+D/6VByt52zjg9n5rQjfZifw5I0DM9U4jme3vvLaVvrYbTjQ4Ow81/UjGggvcvXvlbsifpJYIMey6Szxc8NvRAGMCErnRTA48oW/xnl7FhMjMYsWYoi6E5t5+qhi/hSdLMFyTtnMzHpJCUlr0md67ntYUP0hj4wDLKlAcOINNJlHdmS88XlCzP0am8j+98PYcbe0iwDRU8QKXhXTMdYsIP5xd4Kv7diD++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Thu, 14 Nov
 2024 07:24:50 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 07:24:50 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.5.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-5.0.5.rc1)
Thread-Index: AQHbMwBrLX3vkgBix0O8hOZJx4Bx7bK2Zhbw
Date: Thu, 14 Nov 2024 07:24:50 +0000
Message-ID: <DM4PR11MB7760176081CAE1873CA5A77AA15B2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdb36OYVZ=GYOAoXbEodDSgWfPHJjnJfA+DJR-jJWE-67w@mail.gmail.com>
In-Reply-To: <CAOSpxdb36OYVZ=GYOAoXbEodDSgWfPHJjnJfA+DJR-jJWE-67w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|MW5PR11MB5908:EE_
x-ms-office365-filtering-correlation-id: 4bb5836a-a12c-4029-5219-08dd047d6cf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cWhoSTg4TUN2NytIdnZKNWQvcmRzQ0RPTDNKKzFNZ1ZDYmpLNm85dzJ4MWY5?=
 =?utf-8?B?enh2ZWI0NUczT0RvRWEyVWhjMmVxcnZBRGFXSHlmK0pTY3E4b29lQUVxT0FJ?=
 =?utf-8?B?anlKcVU0YjZIWEdMMHBHdFNtbEtuenpWWEpxeC9YeklUemo3bzN3L3c3OUxS?=
 =?utf-8?B?WHdiWEFnMTczY0pIdEZseTRGNWNjUWpBVjRKM1ZmeCtLMXhhalMxVGE4U0M2?=
 =?utf-8?B?SmQrSTVLY2FzZ2NmVDJyZGtBaE41YXdDV0w0Sk9jNTZCQmF0MDhYUjZQWFRS?=
 =?utf-8?B?RkJvTzdjbkJKNFVGQXZqUzNTK0I4WStWNVJTYy84R3BkOXlZN3picFp4OEFF?=
 =?utf-8?B?Wm05V005Z0NVZWZ0aGpaR0dmV291Q0ROa0s2cEdFU1loZDJXZldpclkrUDdN?=
 =?utf-8?B?N3NVTDZyMDVVMUduamtyOElBUnhTU1B2L3g2VWdSRkhKMWRRcFhrZ2tmd2NY?=
 =?utf-8?B?NVBEUlZodTN5dm0zTEQrcmZBcmZhaGJncXV4dXN6dnNlbHlNWXJzVjBuRzZV?=
 =?utf-8?B?eCswazFDSHBhbWIwR0R0TW5mQ1J5ekxlSmg5Zm54a1E5WG0yTG13bHdocVlr?=
 =?utf-8?B?K0ZxbGN5UDFiTmRPem1SQzZieHEwTjRhcy9oUWVLdnEzdnZ3a0w1d0hkZTZi?=
 =?utf-8?B?bXlFY0RhT3ROLzVaZnI3eE80SEpHS3piOTlveVpFUFYwN3MyS3VTcEQ3Z2Ft?=
 =?utf-8?B?aGVZVVlpUWQyMnFkejNVNE5yRVRtdFBtN1N2QlhXYXlGa0pxY0xnSUY4Q0Np?=
 =?utf-8?B?S0pDaG9GSDdrQWNvNFViTzVhQTJCUXBTT2ptMUpMazAxai9ZNXFkYUMrSFVx?=
 =?utf-8?B?Y0QveTRqcHM4MXpKTTdrQUMrSlFvOGJWOTR0M3R4YWhFQ3ZMb3hUVTNzbU9n?=
 =?utf-8?B?RG02M2pqU2c0bExadFZYcUxvTkJneG9xVWJiSWwxRmNqK3pTd21vemJ2N0Fa?=
 =?utf-8?B?eG9VWFd3cjJUSHJlRDQ0Ny9GOTVtWHVlcEZRYmI5bmxhenJITXVzRU5iMFEx?=
 =?utf-8?B?K0ZDTTMzVm42akdSOVZpRCs0VU5EWUVoZGNXbTZOWDl2OFVtdldUTFJ3YVZn?=
 =?utf-8?B?KzVIUnhtTUlNS1Q4WFNIV2JWczhBSHhKYk9DMFR3ZXU1MXN2NlpyM2dFaERk?=
 =?utf-8?B?K2twQVpZY3AvcXlHcnZYb0paa2FwbnVtbjIrUHVGTXdOQUl0KzNqQ1NyZkxP?=
 =?utf-8?B?QnMwNmVwRzUrdWtXQzhWNE83VmJrdk8xc0ttTXlLQU9sMmR2SWZCNE90LzRV?=
 =?utf-8?B?MmhvSmFGWXo1SUpoQlIyb3pYWXhyM1p0KzdVeGtqZFVXeC9MSkQ5cE5SUkVQ?=
 =?utf-8?B?NGkzY0s2OW5oSWF0d1FtUVlmeVA5UzhzWVIxck5tNWw2ekc2eGdVdGhDTEY3?=
 =?utf-8?B?WkFvZTBKNjgrYzVOV0dpdkdWY09hbTFlS1Q1OUxUTUxKQXd5V3F2WDdBcmZL?=
 =?utf-8?B?YUREcnRzOGxMRXMyWm1yVW5icTBDNEtoSm9hTFNKVkdLR2NMYmtjWDY0MUJT?=
 =?utf-8?B?WkFjVTR3WXdoY05TSjZTUVUrc0lCOVlzb2dNa3daWHBabU55U1pVbktvNGx2?=
 =?utf-8?B?QnhVeVdVb0M2ci9IQ2oya3kvT2xYa21LWDF5blRVd3htSzdaTUY1WlZscDdm?=
 =?utf-8?B?b1A1WmJWYnZMZXczbGlqanFqRmhaVy9jbmlSZmE5ZXFHTHAvbWZJa1VFL0Fx?=
 =?utf-8?B?MDlLWE1UZjAxQW04T2x4WUJzSzZvVDhqUHRla0RGQXVZSTJ0OTFPMFNKL2du?=
 =?utf-8?Q?KRLPIKnbF9YIfxD18JUfmTdTbGE5NuQ7K8PRYlt?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDJFRm5LNXZLOHFmM0drTys5OHVLUWp6cU4rNmdyWnkxLzE2NG5oZ3VjY2sw?=
 =?utf-8?B?MHlrMlE4M2h5Z3Z5ckFQOWpYWjJqd1NYbDQ1bWJOUmMxaVA1bTF6NVJhSTli?=
 =?utf-8?B?bGlDNlJKaFI3QnNQNjhoNko5OTR5OVIyUDUyb2greFR3cHpNSzF2UTdHUXVh?=
 =?utf-8?B?MjlLcUMvcDJxcThyb2N4YXZXSGQ0M1h1elpOUEtadSt1Z1hYVVJKeDNrR0Qz?=
 =?utf-8?B?QW1CNmtObEprU2JRSGRLM3pmZnQ3cGdoRTJ6U2ZsWkxDQlJGY1FsQW90MHZt?=
 =?utf-8?B?bm5JbHRYTktNdEhjY0xKazNWMXlPeVdOamxtcVZYcU5VdlF0cXNUWUF6cVZs?=
 =?utf-8?B?bU5xZEhkSmRnYWMxRGthVHB1dHFQTWFCTURWS3dEWmpIUXpvS2EyazlLUEZ6?=
 =?utf-8?B?VWlySVNQS3pwb0lHZ3ZMNVlIUFZyUjlPTGt2RDFHV0s5cnkwN0xaQzFqRGlm?=
 =?utf-8?B?NTBjMWplcWErNWtDSXRuUnNDdlpjY1Q4V3ZsRTBXeFNqVHdJQjlTdVRjTnNU?=
 =?utf-8?B?eFFvUnhOVHQ5UjJVc3ZvZGZ4eFVJRGhHT1BIWjlKZXVwUG5XUEF2S09hMHcr?=
 =?utf-8?B?S0ZGZzJ2L3J4Y0RaYmlJOXZ3QUFmcEpmd0diaHZKNFlMa0pCNTIwejQvMUlJ?=
 =?utf-8?B?Ui9LRnRSZWs2YXdhQThsajIwai9waUhaSTJyWUtjbEhlR1BFQldCYVN2M2Z2?=
 =?utf-8?B?SlJmQmdQTUNRaWhMWjFBS1VYMDNZOTJCWFlCYysrRll6aDBPOXVLL0dpUXFx?=
 =?utf-8?B?QVJLSnhmWUVZekpvQ0ppS1dMbEhZbGhBbnhUdVhUVWZIUWM4dWZlTktLTkR5?=
 =?utf-8?B?eTVqN0VSaGNJMjJZanJYS2FxNE1qNUZxUitWOU5aVTlYdEN1OXhuYk00MzF2?=
 =?utf-8?B?R3J2N2REblpmN0VzMTlzZmRWQUhHVnZjL0czb3Q5d01WU2lQTitaNWVrS2I2?=
 =?utf-8?B?K25SUkxRalBSaDR6S2owdDh6QnMrR29BR2pjUmd3QmNGVjQ3NnZDRURKNFhS?=
 =?utf-8?B?N1QwOUw2RisvNFNNcy9aalpPTDhSUGhYck96cjJVMHJweDNLMkZzSnQ2QzYr?=
 =?utf-8?B?WnA4bC9IdkYxSWJ6MTZRUWMzS3A2aS85dzBiVllqN3JhNG53UEthTW9LelVX?=
 =?utf-8?B?TGhHZlJDWlNKM2hiUjduc1pCSFB3UFlxcngzbG54bGtDSzBjUWNrem5iU0lk?=
 =?utf-8?B?VkhMRVpqMVpPa3JuRmFYSEtBWnlreDJGS1RaaTNEUHo0VXJHT2RUWXFRWENl?=
 =?utf-8?B?VG55NkhlTTNncFhsSmZEZE9MUElBdW4rMjBoNXkvT0REL1NJc2M0dWt1TFhr?=
 =?utf-8?B?Zm1LdXVSRGZHdDdtTHl2dHp3aGpWdThRcTZ1UllJUWQzdlFpZ3N5OFhZOHpM?=
 =?utf-8?B?b0FOUGE1aW5MdnM2UGp2bm9nWEJsSXZGSXBQNjRQbEdiZE40UTRJY3pMWERI?=
 =?utf-8?B?UnYrK1BUMWZmRUxRZHVwZytTaG9QMVpBNUVhTExRdlhDMitNdlI3dEIzZFVh?=
 =?utf-8?B?dUtHQnpycERYMHBOcVFvN2s4ME5xVnpjVEVhTzJHTGNPbm1UZlZSNG83eWdS?=
 =?utf-8?B?eFlPS1A2WEFZUkd5RWhCalArOVhQNFJ2dXNlcGRwZGpXbzFQZmFVbzZ2TStu?=
 =?utf-8?B?YVNYME1jUVFrbTdzSG1QWThCcXZZa2M1eVBrNDgzbnhqNUJLNi9FR0htSWtw?=
 =?utf-8?B?ODQzT3dCSjBSNnNiRHpoOGYvZ0J1dUMwNW40Y1ZZVGMzSitON2VoVHZWaWRW?=
 =?utf-8?B?c0RBTTcxOHJGRTBWaWxpWTRrd1Z2bFc5TlhIdkJyV3YxYTNxNEpTZWozSnBC?=
 =?utf-8?B?N2poOHkrYk01TDRWcWo4SXI3MXVObWVlOVZMRGIxYStuK2RnbEdOSGQ3S3d2?=
 =?utf-8?B?WG9lYS8xbUJ3WUtSSnZ2elFzL0pwT2laRG5EakoxOWVIWUU0K3Q3Y3hZZnY0?=
 =?utf-8?B?LzhLd05tbmt4NDZSRWMxOEdoY0pEQ2lZN01OL1l3eG1aZE96V1JUWCtWRXd2?=
 =?utf-8?B?UG91WHJVZWxEbVloeXNFMFRzY2toUzB4cFByd3FiLzUvS3ErTG1ZODBOZFF6?=
 =?utf-8?B?WnArYmN1MHV4aEtEMERSQWRFVkdySlNOUVRab1FsdmdVL1huWTNJMndyZ0I1?=
 =?utf-8?Q?++pYnYsVkwpq/JgT72VqB6p2L?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb5836a-a12c-4029-5219-08dd047d6cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 07:24:50.1380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btQ7W4fbwFfWZba2+V5Mb7eLvuN0lNXbtV+IyV4ZmVeOmA9oJaq3abKaFB+xcbaD6FWeQRFKi7IbaYW93Z59Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 07:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207142

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTUuMC41LnJjMSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6ICANCmh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvY2dpdC9jZ2l0LmNnaS95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9
aW50ZWwteW9jdG8tdGVzdHJlc3VsdHMNCiANCj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8g
aGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4NCiANCk5vIG5ldyBpc3N1ZSBmb3VuZC4gDQogDQpUaGFu
a3MsDQpKaW5nIEh1aQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zz4gT24gQmVoYWxmDQo+IE9mIFN0ZXZlIFNha29tYW4NCj4gU2VudDogU3VuZGF5LCBOb3ZlbWJl
ciAxMCwgMjAyNCA3OjM3IEFNDQo+IFRvOiBZb2N0byAoeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZykgPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBbeW9jdG9dIFFBIG5v
dGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyIGJ1aWxkICh5b2N0by0NCj4gNS4w
LjUucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4wLjUucmMxKSB3
YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlcg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0Og0K
PiANCj4gDQo+ICAgICAgICAgaHR0cHM6Ly92YWxreXJpZS55b2N0by5pby9wdWIvcmVsZWFzZXMv
eW9jdG8tNS4wLjUucmMxDQo+IA0KPiANCj4gQnVpbGQgVVJMOiBodHRwczovL3ZhbGt5cmllLnlv
Y3RvcHJvamVjdC5vcmcvIy9idWlsZGVycy8yOS9idWlsZHMvNDE0DQo+IA0KPiBCdWlsZCBoYXNo
IGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogMzc3ZWJhMjM2MTg1MGFkZmI4Y2U3ZTc2MWVm
OWM3NmJlMjg3Zjg4Yw0KPiBtZXRhLWFnbDogOTY2MmVmNjA0Y2QwYzEwMzM2YzJlYjIwZTU3ZDg4
NjI3ZWMzMDgxMQ0KPiBtZXRhLWFybTogNzA4ODI3OWMwYWIwMGM3ZGFiZWZkZDQ1NDQ5NTFiNDc0
NmI0ODQ3Ng0KPiBtZXRhLWF3czogNjcxMzgyZWE4M2UyZGIwMzhiZTUwZDYyOGI2ODljNjQ2MDVk
OGJlOA0KPiBtZXRhLWNsYW5nOiA5ZmJmYTlkYjMzMTMxYWJkZjM4NzBhOTRmMDAxOTllYjUzZTI3
NmU1DQo+IG1ldGEtaW50ZWw6IGRiNGY0NDYyODY0MjI0NGM5ODgwNzcxZDI5ZmUwY2U2NTMxYTQw
NmYNCj4gbWV0YS1taW5ndzogYWNiYmE0Nzc4OTNlZjg3Mzg4ZWZmYzQ2NzliN2Y0MGVlNDlmYzg1
Mg0KPiBtZXRhLW9wZW5lbWJlZGRlZDogMmUzMTI2YzljMTZiYjNkZjA1NjBmNmIzODk2ZDAxNTM5
YTNiZmFkNw0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiBlZTI3OTk5YWExZTBmODYzZjE0MGQwNzlj
MjY1OWVhMTVjODk1Y2Q1DQo+IG9lY29yZTogYTA1MWEwNjZkYTI4NzRiOTU2ODBkMDM1M2RmYTE4
YzFkNTZiMjY3MA0KPiBwb2t5OiBkY2U0MTYzZDQyZjcwMzZlYTIxNmI1MmI5MTM1OTY4ZDUxYmVj
NGMxDQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUg
WW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZw0K

