Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC5FC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 06:54:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.13059.1669100042288640112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 22:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=m6o3q7PX;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669100042; x=1700636042;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xD1rLPRIL8bZLRQKnykbNJioVrMmQMrvAZmXY5A0lZs=;
  b=m6o3q7PXtO5EFEXm1llhhxdxWqT2jN2UWiMDYS6iVwW6Cpk4E+TSkfnJ
   ZjY9f0dH58K4TZa8wgW3rLv3GAR0LplN193swNIZRyeKgv37Ywo9mvaoM
   wEnJdP1IjEcDj5E9jCEdyIkL+9pUctqktcfM0JBZEa4ufR+VpiLj9V5Ic
   V2BpA4NCOARXh590Ac0yq+vjCxU3La+5xq/Z5oxdVKY0XJS8/1uIiWDYi
   Jcj8kTtG3tzhy3/IwOQNC3VvB1AvkcN0IWpx6q6tVYQykk0a5+fFsF/c0
   WzJ9uYTHO5p91OeYJJgdLj51avN9tptkBGXVpju7X9C8OtuEAeSg9z6Ya
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="293458301"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="293458301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 22:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="672382654"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="672382654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 21 Nov 2022 22:53:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 22:53:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 22:53:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 22:53:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 22:53:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3QcOUxwU7HQWcot0snv5+3+sl04TC+ZROhysD2Jx98n09osjg+Varhr6RgGVRnCymaUS88OFIN0W0PFZPfbWUq+6fwKpqijVgv547A9Xzoj5T0bEG2S/NDZE87z8ELqcEDpihFBF6BBU1S9RHKR8FyokxzyTbiFA1mcjlo5GGR++rGCd+u/I1jNPKD0VmibSRc/4zUE5kjOP9+SiD9gJk1v3y8z6Ku0i3GbopEwvcUzxUzK/lgjUScJYK1nV6STToDiKzjK8ViP7i/XEedRH8z7N1pGKRZ2j/8wFOH0XscmY+UhQJxB9nhyJMAVczvV/EDw0p1CPzi71XCW7BcI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD1rLPRIL8bZLRQKnykbNJioVrMmQMrvAZmXY5A0lZs=;
 b=JVn4G/iTgYkjGOkDdXkwMoFqk5H8tm7F9I2CxjyeIJ3xFASjA1fxAYbp3PRJOBoEYsQy5qRiT3UHjcDKNRPPWliqDdoM9cn0ytvIJCMIScY/QJhOKn5UOvMPDbsNUsgTDvGwKP/5v1Kr4mWHjiyrAE25N9+uycDBxmJihHqBSSLY8pw7RAH0s8FXQ8BB6E0Qklsa+Rkqcb9VSx+yCljduOTOlHOYzpqytyPiG8cXh+0iz3pzhK23YIIq4+ZCfkswKiyMYAEIhSyliXbsm5i0U5CxN41Ytv9c2RaxD+aS98unqT3Urug4HXwJnvWoBBwrm911CeE+IoXfhZhtPEf5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 06:53:44 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::343b:6071:ac6f:a80d]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::343b:6071:ac6f:a80d%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 06:53:44 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tim Orling <tim.orling@konsulko.com>
Subject: RE: [OE-core] [langdale][PATCH] git: upgrade 2.37.3 -> 2.37.4
Thread-Topic: [OE-core] [langdale][PATCH] git: upgrade 2.37.3 -> 2.37.4
Thread-Index: AQHY5+RyBhy9mm8sQEqeijNq1LPGIK5KrUpg
Date: Tue, 22 Nov 2022 06:53:44 +0000
Message-ID: <DM5PR1101MB23619C0F04FFA9F40EB9D567B90D9@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <20221024200830.3082026-1-tim.orling@konsulko.com>
In-Reply-To: <20221024200830.3082026-1-tim.orling@konsulko.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR1101MB2361:EE_|CY5PR11MB6536:EE_
x-ms-office365-filtering-correlation-id: 775827d3-8eb5-4d0c-82dc-08dacc564c48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jKWF6jQnW8WaW3qZvP5C1q3+CrLoEKcRlL3GbZColPUHiXNzWduh8TNstUx+LeheUeMu/KRjp9qwFCsCUtqOtkeUTpDJmSf4UohYU/0JPXyxveAdGQ3xkyg+mHNgvxMMn1y9702AzfuccS6C27qlHQzLDZnDfW37OHhhFJKmSUyiwSCXn0Up8e48AZrK79E4ZYRZiawX4dm836/iFO9dyn3EbgonD3kJnj7sAYZLemymaXKcYDJYXCBSuDEW7mOB57PC5zecblOPT7keQiepvknhHgnvJf52KETlFvov0HeGHsgvZhzmjmTcqEJ76N/u3rkueaBBTJwa42AldWmX2VozvH2g0M4HuSmHweIxqSrQ7d6wCz5ki+Vw3L+d0yyJJdo6UrONEWU2sYznrHGKlQeByk05jZfsamv6t5pthz59XgGhAiLMPnd7EtxH0lRrHBb+9wzAEjRlbtPcK5ZeTVr/kYLrffZ7mtHug14Tc+UVoZI2/dCf1JAikE2wx95FS93sy0v9OeKSTpkx2WGfijKnWCxWmN843hsEH9wVXiGdHypoX2mdE0Q2etB10qeJiEcQkyMk9Cjku94DwF92jKun3x0sfXl7B0KAKfqNBN20+lr6Dy5o8scr8B6u6Nu/5aa8TiOD1GHC0jF6D6niUQ7kIwWBtx5h7F4kl+LpmWubujV5LFDTRD37J3kTL2TkkEPRXpNNkk421MEmiOQ1meCJJ7aGC1Ucqp9S2KsDH/4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199015)(6506007)(122000001)(38100700002)(82960400001)(38070700005)(86362001)(55016003)(53546011)(7696005)(966005)(6916009)(316002)(71200400001)(5660300002)(8936002)(83380400001)(186003)(2906002)(8676002)(9686003)(4326008)(66556008)(52536014)(33656002)(478600001)(66476007)(41300700001)(76116006)(64756008)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek9vZ2xNcng3dG13UUppMDA1VW1JSTJaWkcvOUJkbnVIVmlDQTc5N0VLS2xq?=
 =?utf-8?B?R3Fmbk5ZYXlCSjV1aHplS0NQeEJHTXBLejFtYkZZZ2lDeTZyMUxlZTZ2UUR0?=
 =?utf-8?B?ODJCVXoxMlRvOTRGemFXcWRoVlFiRnlpZmJmYXpsMlNGQ3NYYmQ4VFMrblB1?=
 =?utf-8?B?OVdtYm5UMTlvV0pxdEdJUDhtZXZXcDNPem1TeGtsTkRQelREZ1JuN04zNk9k?=
 =?utf-8?B?Tlc2aW5OVW5CYVpNNC8zSExldEVoUVVFTkVzVHlGb20zTUFDMzIyM3FSbTZM?=
 =?utf-8?B?Zi85ZG1DQms2azY4blVmaGJ0VytTQitqQkVkVDg0M0Y4OFl4ZENBNnlOVUdE?=
 =?utf-8?B?cTk5M2UydUVMRUJ2YjNuejgrUGQ1eG0rNHBjd1lrYmJrRDN0d2NZWS9xUEJT?=
 =?utf-8?B?Vk1tcmRVY29kck53UUR0NGFkTHl0N3hKZ04xMWEyUUpWR3pRUEluZ2lrWkNJ?=
 =?utf-8?B?UkNCV1Vxam90WEhMOTlFYlBxOUhBMkZ3TzIyeGtMRXIzemVLWXhaVlRBUUR5?=
 =?utf-8?B?alNMMjNHeG83NVBQTzZ6ZWVNUUc0dlpDT0NPSW95WlFOQ0NSRTB3cnJ5VTV4?=
 =?utf-8?B?OG9EbGtoa1hwTWpiNmE3VHFkY1A2dWJVQitGR1AxM3lFOGpWNkQwODZKZG8v?=
 =?utf-8?B?ZzF1Wi9qVFI5Tk81UFJ3WlNrWlFhVjdXeXlPMFJDWDJiM2QybjlCY2t5ekpR?=
 =?utf-8?B?ZEtMV3hLQ05FZk1VM2pDU3JFdGZpdDl0QXBIVUlQRHFXdDVxdXNRaWhxcXox?=
 =?utf-8?B?ZDRBRHhJNUlDWGhqVHl6MHJCdDVqeG1uYlNxdjVvdURzSWpJdktLQ3ArQVRm?=
 =?utf-8?B?NEdRTlpjQXg5R2lsWEtUejJGTU5OWjVVcUdTRnhVUU1jUC9IVHl5NnhsN2Fv?=
 =?utf-8?B?RTB0dHQ4Z25uTjFiMFhIcTV2ZFB6QzZQKzZUam1zWUR5LzlWU0h0em5OZHRZ?=
 =?utf-8?B?Rlp1S1pPOGZyNGhMbFc2dzlSSkd1blJVZ0kxUTgvcW9hYjIxV2M1SHVQbmsy?=
 =?utf-8?B?bGJncEQvUG9yWkFJK2lYZDJmeXBQVDdmK2tVVUhjd1dVTUxlSVdSLzVMeFlI?=
 =?utf-8?B?bk1QTjg4OXF1cXdRY2NXU0F3NytMVEFFZDVDT1ZMZUFIU21jOG93ZVBYejVB?=
 =?utf-8?B?NW03Vmhwc0UwWDAxajVaRWJseFZEZXZQczRhejN1ejdtcjdMUmc2cVhZeFdB?=
 =?utf-8?B?TVFycGhKYWZGbUhObzJMVTgwN1JIaURpb2EwVU5xVjh4RExYczRRQUhBMXN6?=
 =?utf-8?B?ODI0Z2ZtOXMwMVRpRGxzcEpqOXdPL0NraXNnS0NwamMxN2M2VHlXWWIwWDZy?=
 =?utf-8?B?dFZud0k5Sng2K2J4bHdlbWM3RU5EK0lCMTNsekN6dnhHdkFrbndFRURYWnhI?=
 =?utf-8?B?YTNGR1AzTjRaeW9yVnliZ1U2bEg3RkExclA5VmNEc0FZM2hzcE1sVHZSdURo?=
 =?utf-8?B?N2dabVNsY1VUUW1UOXdLVThDSTY0WkZ1WXhObEpKLzE0cDA5aS9KN3JPdUVB?=
 =?utf-8?B?Z2lKb0JhbjJCRWZ1SVBDM1BNZWZ5NmhJZ2FuaFNKZDU0ektZOUprMVM1dG9q?=
 =?utf-8?B?bGQ0dG5Gd080aHl5YmtMSElqZFA3VWdJalVWY01UVk9KT2lRQ3B3MW9vdkZ0?=
 =?utf-8?B?b2c4bHY3Y0xYVFdYNGNHZEJNa0kwNlVQUjBqWEVRRE1tTVYrNk9XU1BKM1dv?=
 =?utf-8?B?enFhSnpiMzEzKy9Pcnp1bXpBUkF2ZmdBbWxzUG9YN3k5aXVTUHU1STFMOVVn?=
 =?utf-8?B?azNDWW9yd3RlcC8xWU9Kdmt2SzVPdU15OGNIOWtETFpxejUxa3Fjc2M3ZXNB?=
 =?utf-8?B?czlEZHV6OVhZejhuZnNoVW1rTGVPeDAvT0xlR3R4Ymh2dFJHdWVxMWFvenZR?=
 =?utf-8?B?UDdLblZtZ2s1N1RBTGVDWGg2YS9NSWdEdnk3b2V5c2gwd1NQRmVaTHBvN1Vv?=
 =?utf-8?B?Uzl0YTRwTlo0a05NQU9CSnl1dmJPMGFYTmNnaEJFKzIwYXljdVR2OCtrNkd4?=
 =?utf-8?B?WWcrZUpXeXZPcXlrWndyeWdoUTBsQXFETWIzNm4zRDlPblJIdjZxRUE2RGV0?=
 =?utf-8?B?aHJRblhUL0N0TVZvMTZUdGUxZTYwb2Z5U2dEekRHT2xOMGwwK2ZUMFdnSHlh?=
 =?utf-8?B?dXpkeHBIZFpUMWx0eXlyaWVjcExyVXZOTDMxL0x5MFVHSklFeGVRdlNNUzdQ?=
 =?utf-8?Q?8sx+xBxozwEEUAiAj1yrk6a7M7fEvDBZuC2yLhSwVaNc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 775827d3-8eb5-4d0c-82dc-08dacc564c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 06:53:44.5108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYhIb2MCrN5y1a8rnDkTSIyNOMXE//PwLWzz0C42DiRKrYytpdbRawVC8XljDuVVusUVPHc3t3cmNzO25yCsLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 06:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173669

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgVGltIE9ybGluZw0KPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDI1LCAyMDIyIDQ6MDkgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vs
a28uY29tPg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW2xhbmdkYWxlXVtQQVRDSF0gZ2l0OiB1cGdy
YWRlIDIuMzcuMyAtPiAyLjM3LjQNCj4gDQo+IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50
LmNvbS9naXQvZ2l0L21hc3Rlci9Eb2N1bWVudGF0aW9uL1JlbE5vdGUNCj4gcy8yLjM3LjQudHh0
DQo+IA0KPiBHaXQgMi4zNy40IFJlbGVhc2UgTm90ZXMNCj4gPT09PT09PT09PT09PT09PT09PT09
PT09DQo+IA0KPiBUaGlzIHByaW1hcmlseSBpcyB0byBiYWNrcG9ydCB2YXJpb3VzIGZpeGVzIGFj
Y3VtdWxhdGVkIG9uIHRoZSAnbWFzdGVyJw0KPiBmcm9udCBzaW5jZSAyLjM3LjMsIGFuZCBhbHNv
IGluY2x1ZGVzIHRoZSBzYW1lIHNlY3VyaXR5IGZpeGVzIGFzIGluIHYyLjMwLjYuDQo+IA0KPiBG
aXhlcyBzaW5jZSB2Mi4zNy4zDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAqIENWRS0y
MDIyLTM5MjUzOg0KPiAgICBXaGVuIHJlbHlpbmcgb24gdGhlIGAtLWxvY2FsYCBjbG9uZSBvcHRp
bWl6YXRpb24sIEdpdCBkZXJlZmVyZW5jZXMNCj4gICAgc3ltYm9saWMgbGlua3MgaW4gdGhlIHNv
dXJjZSByZXBvc2l0b3J5IGJlZm9yZSBjcmVhdGluZyBoYXJkbGlua3MNCj4gICAgKG9yIGNvcGll
cykgb2YgdGhlIGRlcmVmZXJlbmNlZCBsaW5rIGluIHRoZSBkZXN0aW5hdGlvbiByZXBvc2l0b3J5
Lg0KPiAgICBUaGlzIGNhbiBsZWFkIHRvIHN1cnByaXNpbmcgYmVoYXZpb3Igd2hlcmUgYXJiaXRy
YXJ5IGZpbGVzIGFyZQ0KPiAgICBwcmVzZW50IGluIGEgcmVwb3NpdG9yeSdzIGAkR0lUX0RJUmAg
d2hlbiBjbG9uaW5nIGZyb20gYSBtYWxpY2lvdXMNCj4gICAgcmVwb3NpdG9yeS4NCj4gDQo+ICAg
IEdpdCB3aWxsIG5vIGxvbmdlciBkZXJlZmVyZW5jZSBzeW1ib2xpYyBsaW5rcyB2aWEgdGhlIGAt
LWxvY2FsYA0KPiAgICBjbG9uZSBtZWNoYW5pc20sIGFuZCB3aWxsIGluc3RlYWQgcmVmdXNlIHRv
IGNsb25lIHJlcG9zaXRvcmllcyB0aGF0DQo+ICAgIGhhdmUgc3ltYm9saWMgbGlua3MgcHJlc2Vu
dCBpbiB0aGUgYCRHSVRfRElSL29iamVjdHNgIGRpcmVjdG9yeS4NCj4gDQo+ICAgIEFkZGl0aW9u
YWxseSwgdGhlIHZhbHVlIG9mIGBwcm90b2NvbC5maWxlLmFsbG93YCBpcyBjaGFuZ2VkIHRvIGJl
DQo+ICAgICJ1c2VyIiBieSBkZWZhdWx0Lg0KPiANCj4gICAgQ3JlZGl0IGZvciBmaW5kaW5nIENW
RS0yMDIyLTM5MjUzIGdvZXMgdG8gQ29yeSBTbmlkZXIgb2YgTWlyYW50aXMuDQo+ICAgIFRoZSBm
aXggd2FzIGF1dGhvcmVkIGJ5IFRheWxvciBCbGF1LCB3aXRoIGhlbHAgZnJvbSBKb2hhbm5lcw0K
PiAgICBTY2hpbmRlbGluLg0KPiANCj4gICogQ1ZFLTIwMjItMzkyNjA6DQo+ICAgIEFuIG92ZXJs
eS1sb25nIGNvbW1hbmQgc3RyaW5nIGdpdmVuIHRvIGBnaXQgc2hlbGxgIGNhbiByZXN1bHQgaW4N
Cj4gICAgb3ZlcmZsb3cgaW4gYHNwbGl0X2NtZGxpbmUoKWAsIGxlYWRpbmcgdG8gYXJiaXRyYXJ5
IGhlYXAgd3JpdGVzIGFuZA0KPiAgICByZW1vdGUgY29kZSBleGVjdXRpb24gd2hlbiBgZ2l0IHNo
ZWxsYCBpcyBleHBvc2VkIGFuZCB0aGUgZGlyZWN0b3J5DQo+ICAgIGAkSE9NRS9naXQtc2hlbGwt
Y29tbWFuZHNgIGV4aXN0cy4NCj4gDQo+ICAgIGBnaXQgc2hlbGxgIGlzIHRhdWdodCB0byByZWZ1
c2UgaW50ZXJhY3RpdmUgY29tbWFuZHMgdGhhdCBhcmUNCj4gICAgbG9uZ2VyIHRoYW4gNE1pQiBp
biBzaXplLiBgc3BsaXRfY21kbGluZSgpYCBpcyBoYXJkZW5lZCB0byByZWplY3QNCj4gICAgaW5w
dXRzIGxhcmdlciB0aGFuIDJHaUIuDQo+IA0KPiAgICBDcmVkaXQgZm9yIGZpbmRpbmcgQ1ZFLTIw
MjItMzkyNjAgZ29lcyB0byBLZXZpbiBCYWNraG91c2Ugb2YNCj4gICAgR2l0SHViLiBUaGUgZml4
IHdhcyBhdXRob3JlZCBieSBLZXZpbiBCYWNraG91c2UsIEplZmYgS2luZywgYW5kDQo+ICAgIFRh
eWxvciBCbGF1Lg0KPiANCj4gICogQW4gZWFybGllciBvcHRpbWl6YXRpb24gZGlzY2FyZGVkIGEg
dHJlZS1vYmplY3QgYnVmZmVyIHRoYXQgaXMNCj4gICAgc3RpbGwgaW4gdXNlLCB3aGljaCBoYXMg
YmVlbiBjb3JyZWN0ZWQuDQo+IA0KPiAgKiBGaXggZGVhZGxvY2tzIGJldHdlZW4gbWFpbiBHaXQg
cHJvY2VzcyBhbmQgc3VicHJvY2VzcyBzcGF3bmVkIHZpYQ0KPiAgICB0aGUgcGlwZV9jb21tYW5k
KCkgQVBJLCB0aGF0IGNhbiBraWxsICJnaXQgYWRkIC1wIiB0aGF0IHdhcw0KPiAgICByZWltcGxl
bWVudGVkIGluIEMgcmVjZW50bHkuDQo+IA0KPiAgKiB4Y2FsbG9jKCksIGltaXRhdGluZyBjYWxs
b2MoKSwgdGFrZXMgIm51bWJlciBvZiBlbGVtZW50cyBvZiB0aGUNCj4gICAgYXJyYXkiLCBhbmQg
InNpemUgb2YgYSBzaW5nbGUgZWxlbWVudCIsIGluIHRoaXMgb3JkZXIuICBBIGNhbGwgdGhhdA0K
PiAgICBkb2VzIG5vdCBmb2xsb3cgdGhpcyBvcmRlcmluZyBoYXMgYmVlbiBjb3JyZWN0ZWQuDQo+
IA0KPiAgKiBUaGUgcHJlbG9hZC1pbmRleCBjb2RlcGF0aCBtYWRlIGNvcGllcyBvZiBwYXRoc3Bl
YyB0byBnaXZlIHRvDQo+ICAgIG11bHRpcGxlIHRocmVhZHMsIHdoaWNoIHdlcmUgbGVmdCBsZWFr
ZWQuDQo+IA0KPiAgKiBVcGRhdGUgdGhlIHZlcnNpb24gb2YgVWJ1bnR1IHVzZWQgZm9yIEdpdEh1
YiBBY3Rpb25zIENJIGZyb20gMTguMDQNCj4gICAgdG8gMjIuMDQuDQo+IA0KPiAgKiBUaGUgYXV0
by1zdGFzaGVkIGxvY2FsIGNoYW5nZXMgY3JlYXRlZCBieSAiZ2l0IG1lcmdlIC0tYXV0b3N0YXNo
Ig0KPiAgICB3YXMgbWl4ZWQgaW50byBhIGNvbmZsaWN0ZWQgc3RhdGUgbGVmdCBpbiB0aGUgd29y
a2luZyB0cmVlLCB3aGljaA0KPiAgICBoYXMgYmVlbiBjb3JyZWN0ZWQuDQo+IA0KPiBBbHNvIGNv
bnRhaW5zIG90aGVyIG1pbm9yIGRvY3VtZW50YXRpb24gdXBkYXRlcyBhbmQgY29kZSBjbGVhbi11
cHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtv
LmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L3tnaXRfMi4zNy4zLmJi
ID0+IGdpdF8yLjM3LjQuYmJ9IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pICByZW5hbWUgbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy9naXQv
e2dpdF8yLjM3LjMuYmIgPT4gZ2l0XzIuMzcuNC5iYn0gKDk4JSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM3LjMuYmIgYi9tZXRhL3JlY2lwZXMt
DQo+IGRldnRvb2xzL2dpdC9naXRfMi4zNy40LmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggOTglDQo+
IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMy5iYg0KPiBy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zNy40LmJiDQo+IGluZGV4
IDJlZWQ4NWU4MDdmLi4yMjA1YTUwZDE2MCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC9naXRfMi4zNy4zLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
aXQvZ2l0XzIuMzcuNC5iYg0KPiBAQCAtMTY1LDQgKzE2NSw0IEBAIEVYVFJBX09FQ09ORiArPQ0K
PiAiYWNfY3Zfc25wcmludGZfcmV0dXJuc19ib2d1cz1ubyBcDQo+ICAgICAgICAgICAgICAgICAg
ICINCj4gIEVYVFJBX09FTUFLRSArPSAiTk9fR0VUVEVYVD0xIg0KPiANCj4gLVNSQ19VUklbdGFy
YmFsbC5zaGEyNTZzdW1dID0NCj4gIjE4MWY2NTU4NzE1NWVhNDhjNjgyZjYzMTM1Njc4ZWM1MzA1
NWFkZjE1MzI0Mjg3NTI5MTJkMzU2ZTQ2YjY0YTgiDQo+ICtTUkNfVVJJW3RhcmJhbGwuc2hhMjU2
c3VtXSA9DQo+ICJhNjM4YzliZjllNDVlOGQ0ODU5MjA3NjI2NmFkYWE5YjdhYTI3MmE5OWVlMmFl
ZTJlMTY2YTY0OWE5YmE4YTAzIg0KPiAtLQ0KPiAyLjMwLjINCg0K

