Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EBCC77B7D
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 00:55:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.8752.1684457748172723559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 17:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=GfTVjTy5;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684457748; x=1715993748;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JVG0hVEG6rrSNwD6Ve8IHVlOXBQlQKBWDrAZabiMn6U=;
  b=GfTVjTy5JjMGkYt3Xcy+xk+Ly3YpdGQhwpL7D94n0vY60Ty8fNni+AyL
   /OQZ03T/v8N+KXUGQ8faphhBcdwJJcDPbKR6x/OHOZ+xKrxR2xXQdEsFQ
   NaseycHjBUeC9COwZleba1VFDbH6Ns6DGpRNGGQ6XQ09STi2KdclgNBTn
   Z3DMAJbIH+IO41Qm7eAHpq0LOj71+Ci+W4oSrDfjgdZtX1zqYSxUavqXK
   ML48VbmH5ub9R4RLAQ9lXFvaOJQdGdmDSu9pJ8ep1ieDoC4RQ0u69gCbI
   ANM2gk8ghoHTnogEylxeprNhPq2Pou27kFgytYcw6IuaRRMMUOWUM05Ac
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="380448919"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="380448919"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 17:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876646374"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="876646374"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2023 17:55:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 17:55:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 17:55:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 17:55:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 17:55:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkN5Txrmu8tn6EH/N9uXGXFWxlsdpUqA3w4ww1llHAaUVfmSv32im6q2/yA7QX6jmoo22EBqTcE0OEb/qDwbHQpsGptMZLg6rKyQF91w8qg3Yei/ySwPLsRjbzb33/zgDbo0YNu2PFFVdrgxwezzfBc2zMwZFiu/aMIEJ8KCnJ5EzDVZgz/HVgSPcg6bBd77P3516d/phSzaume9Z9MR7gA9GQBp1SImVDHZjb3Y0Dzq8UgNeb72kMSIySybAgxCX4P13LdFBig3veJ81IXZuoPYL+qBofW693avmzPMCS6dcGgbOqaIJXI4Us0bu4OZmgRR/dXAueOpj6/pR4UhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVG0hVEG6rrSNwD6Ve8IHVlOXBQlQKBWDrAZabiMn6U=;
 b=a7JUsCKaXSMTfYL3sWWvLDBVV+7widk2XD99K+2/aEUtPlwzgPJjf03LwLsZbsp2/RiFW3RSbUQF53daa8KkX6Uu7l+vNlBXyht29WCaqkqmNqiJZKZK48X/WGyVPUWqxJ1HH7lG6bC59jQk1KgVvxydpvAVlLU926wogLum52IsZpQ2e3VdZL2O42iS++19A9DqW+rqrPA226ako/QptWXqMu0JC5srB9zzSY86wF0glRe/5w7Y2m0PCy+3XXuYXOGHxjP1ZhGzcrqJtQzK1tX/8Q9sX9QZk6b8kYFZpX3rQioHE5FLPK2pbPEOUs36PperUqe2/gybw40ai1+nNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 00:55:43 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::d41f:ca52:857c:53a6]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::d41f:ca52:857c:53a6%7]) with mapi id 15.20.6387.033; Fri, 19 May 2023
 00:55:42 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Thread-Topic: [OE-core] [PATCH 5/5] glib-networking: upgrade 2.74.0 -> 2.76.0
Thread-Index: AQHZiYGicDB8NTJZEECJEAyybDF2P69gxkGA
Date: Fri, 19 May 2023 00:55:42 +0000
Message-ID: <90bcfb7f43f346b2f82bbe7af166b7b4f48f7bfa.camel@intel.com>
References: <20230518023118.16406-1-anuj.mittal@intel.com>
	 <20230518023118.16406-5-anuj.mittal@intel.com>
	 <3110A7DF-18F5-45CF-A414-B14F1BC67F34@arm.com>
In-Reply-To: <3110A7DF-18F5-45CF-A414-B14F1BC67F34@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|SA1PR11MB5875:EE_
x-ms-office365-filtering-correlation-id: 98947e42-b356-489b-3106-08db5803c5c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YjMCt/x+seVTVX2U3+Z8juujj9UaCP2u53KdZDaUwidlCLrtV73IQgv3NyJy1146UExQvW5HJZ16N8M6mCVUneAp6eb/7CAujYyVP6WymxyDlVKQdPyckXdZ/BZqWrFhSgVQJ05XbjFCVmkgiub5ZL1FYZKKK/SPRJurpzAtA7ERzj8oxxUb8glAHoeX5FWxg3K1LUyMe4NyEBB9krtNuTaZA9DZo3J4UNMfJD2jwCiGbQNfzwRVK4yHzqwigheOntol+qLQERn5w98QS4gH7ZKKMb8dcegXIb7A8t2tWFtKC27igYPMH875SpTqN62Vz6aIWMAk6e8jDaKO3TQYPJ2izdvrQpPANZfqITwwPP7toqvdvnQC7YtgGRXvLNSR/TSPNR8NzwVytybjoKb/BGYSDapcrQaCgn8vq7jwGpnBFDT+6Z9MOCGhj+3dNYzEc7GWsTnC0d71Sp5Juq3Qib2+70nobJ7I5H43rKKVkcVuYZzfHMlMBeovyvzOL7TBcPfJ+PsGPn7pW4+pM/m2sXvb43it1AmL9JF/SWgBRw9++lT5JscSawjfVY6dhuOigrDUZNQNhMwc3RFREBpjJB6VIDvn+yODCKClED93dyg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(966005)(6916009)(478600001)(66476007)(66556008)(4326008)(66446008)(76116006)(64756008)(66946007)(91956017)(316002)(38070700005)(86362001)(36756003)(83380400001)(6512007)(53546011)(186003)(6506007)(2616005)(26005)(71200400001)(41300700001)(8676002)(2906002)(5660300002)(6486002)(8936002)(4744005)(82960400001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3NIQk5RZDkzdWRHWVNwaWEwR3ljMjRQZWdWQTFvdFlKT29mZG9oNnRyTzBj?=
 =?utf-8?B?ZmF0QkdMTUZoMU1VVlJiNzdPNjlDZlJYc1pEYzdCQ0dQYzAyOVhWbWVFZTdE?=
 =?utf-8?B?Rm45ai9NV0xYb2RiTzhBWTJPZjgvN1ViWG9tanU3QkdyL2w2a01GTFk3QVVi?=
 =?utf-8?B?NVFsWTF0Ky9meERzMEhoNnU4aENZZWloRzZFTml2WWxDSVJSRnFyQStrV21U?=
 =?utf-8?B?dDY1TCt6Z1VDaFJTT05PWTczOFp4WXYrTWVXcXB6M3A0VjUyMUdTNFRwMndE?=
 =?utf-8?B?TVRlaTBmdSsxQnJVYVRIeDR5bStaMVhyVjlPQWI1UExGdENRZ2djM242d21t?=
 =?utf-8?B?R1R2SUZIdzY2V3JTMVpxeTFGUmEyWklUNmNKcWVkZDNJNXhBd3h0Q1diWEVk?=
 =?utf-8?B?V2U0L1dhdmoxNGlvcnBMUXR2OGxjaUsyTmJqR0lWQTk2dFlPaTBMNkU5ODNn?=
 =?utf-8?B?ZkpEM1hqREdvR1F5eHhHV1VxZ1EzbFBOZStRM1hnTlVhMlVOdHBoNmdjQ29k?=
 =?utf-8?B?YlhTMEx5MFQ4eU5rcDBLYnhoZ1JRNzhIZ2t0VzdDdkNHa2phWWZkU2M1NGJW?=
 =?utf-8?B?QzVmdTRRc1VHRE5RaVEzWGRBYTlNMXJHOVp6YWUzRWRuMHFXcjZpb0pzb3JY?=
 =?utf-8?B?d3RKRXNmKzhKWnR0bUNrajlEdmh2SW44SCtyQWNRdmZHZ3hiQ3Nla0d0dWhM?=
 =?utf-8?B?Q2pQZE0yK1E0c3g2WHBMamZoYnJtdlBkQnhmTWtOdFdtTDViU2J1WFUvLzhy?=
 =?utf-8?B?WC82d0MvellqbG9sWW5XeVdMVjlKQ0cxNXhFVmZiVzJFY3p3bHNOQk8xS041?=
 =?utf-8?B?eXRpSUFWM2RuWDlnWG9jd1FPZGs5aG1ySXFRTWRONnQ5dkhET204UXErd2l0?=
 =?utf-8?B?blFSOWtkakZrUkNoY1VrU0draW56Q2IwTzlKbjNJbUJPOUJkTXZCUnBHY2JK?=
 =?utf-8?B?WkFwVnN0UEU3RmlyYk9qOFNScnc4L1plQkw0S1BjRHJxczZ4U3B1Tnl5bjZ0?=
 =?utf-8?B?L2M4TXVuZFVIOXB4V3B1QTR2STBpZkoxVTgyZGRnWU4wV3kzanc4S1pzQlM5?=
 =?utf-8?B?Z3RVTFA5U0ZRYlVHS0JvM3k2a0ZsQW1RZDJuT0FiUG5GZlBVYlB3NU1USlRo?=
 =?utf-8?B?T1AwbUNqUndZcXRjZ1UvaW55SXYxS0lLaWRVZ1JRWHdqSERObVZjc3h3RktF?=
 =?utf-8?B?cFluZVVpSExnZjV5eENXZmxFYU1NbDJraVVVaGxrVEhNdFpKSFpSZUVCQTg5?=
 =?utf-8?B?VGRqN0liejB1cC9jQzA3dDNibXo5N0dlYVcydmlBYyt4Tnp0SlIxZ3dIckpW?=
 =?utf-8?B?VHBuM1dVOTFkT0tHdzRVWVJWaWxjdENNL3p6YXBwcGxWS0I5Y2Y2aXdoV1hP?=
 =?utf-8?B?NjNMNTlGdHRrZ1FGczV0TjVDODRmR21ucHhFKzZFVGtKUWFqVEVWOEc5alRY?=
 =?utf-8?B?Q3pPK2IvTHoyYWcxblpFWmZhYnZpUnEzMTBqYmFlNnU3U3NSaHpDV2RseUpV?=
 =?utf-8?B?WGRmaE8ycmVNaFJDRTFGRERrQ1BPWnJadlpVVGR5WmlXZkJXU2daVDE1Q0pC?=
 =?utf-8?B?WVptbzFqZ09xVzQ1d0NIa044VHVwaThrRGQxNUJ4L0FJWldVSndSbWpCZUNT?=
 =?utf-8?B?UHdPNHFkS0pHQkJkZnlRTG1nZnQ4UFh3M0p0eUhEWnplNUxSL0loTDNXYVlz?=
 =?utf-8?B?NjF3OTdZZnYvVjJGV1Q4bUFIRFU3a1dBRklocjZFM2tCMFkwclVISXljVXBm?=
 =?utf-8?B?V2tieGZWWnpUL3lEbDNmYmJBUGQxMHFJektEdmhCWlp3WVJFT3lya1k4SXVW?=
 =?utf-8?B?YWhWa3BSaVYrdWg2WXFoY1ZMV1IyZ3Z5YUtlM3BkZkV4ZGEvaWxBMkY1ZVFQ?=
 =?utf-8?B?ekNXUjVQMHpkdTc3RjNnK2ZlOFJvMnJYZm1OQzUwQXcwYS82U1dWcnFUL3lB?=
 =?utf-8?B?WjA3K2pSZ1Vlb09VVmZRcWZyUzdWSm03aVY0eUpGUW9qR1VnWWZGeHVYRTNT?=
 =?utf-8?B?RWEyTUJFU0lwcFV1VExBWllEZm42cGRoT01GaUpPdnpNWXFOUkFNQkxTOVFr?=
 =?utf-8?B?eFo2RnZoU0pITENzcEJlVzBmVmEzb0Q1d0hlV1BGMnArYlB6emYrMEVjd1cr?=
 =?utf-8?B?SXNXUnQxRk9tMHpDdVMrNmdURGhFaUJOSnlZUThteXA3eFRCcTk0WFZIdkVZ?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5849959730B6A6409116756762CAAE9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98947e42-b356-489b-3106-08db5803c5c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 00:55:42.8775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9OjE4DX10yFDmqmk94+i0bUz5UK8MG47wgNSbfqxuNVpM/CvgYVMqoNuQfxF2OuXJfd7SRbexYDqH6T+Zr6DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 00:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181530

T24gVGh1LCAyMDIzLTA1LTE4IGF0IDEyOjA5ICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gMTggTWF5IDIwMjMsIGF0IDAzOjMxLCBBbnVqIE1pdHRhbCB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiA8YW51ai5taXR0YWw9aW50ZWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiA+IHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcve2ds
aWItbmV0d29ya2luZ18yLjc0LjAuYmINCj4gPiA9PiBnbGliLW5ldHdvcmtpbmdfMi43Ni4wLmJi
fSAoOTUlKQ0KPiANCj4gcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvZ2xpYi1uZXR3b3Jr
aW5nL2dsaWItbmV0d29ya2luZzoNCj4gRklMRUxJU1Q6IHJlbW92ZWQgIi91c3IvbGliL2dpby9t
b2R1bGVzL2xpYmdpb2Vudmlyb25tZW50cHJveHkuc2/igJ0NCj4gDQo+IFVwc3RyZWFtIGNoYW5n
ZWQgdGhlIGZlYXR1cmVzIHF1aXRlIGRyYW1hdGljYWxseSwgbHVja2lseSBJIGhhdmUgYQ0KPiBz
ZXJpZXMgdG8gaGFuZCB0byBmaXggdGhpcyB0aGF0IEkgY2FuIGZpbmlzaCB0b2RheS4NCj4gDQoN
ClRoYW5rcyBhIGxvdCBSb3NzLiBJIGhhZCBub3RpY2VkIHRoaXMgaW4gYnVpbGRoaXN0b3J5LWRp
ZmYgYW5kIHRob3VnaHQNCnRoYXQgeW91ciBjaGFuZ2VzIGluIG1hc3Rlci1uZXh0IHdvdWxkIGJl
IHN1ZmZpY2llbnQgdG8gcmVzb2x2ZSB0aGlzLg0KDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL3Bva3ktY29udHJpYi9jb21taXQvP2g9YWJlbGxvbmkvbWFzdGVyLW5leHQmaWQ9NTM0NTgw
YzFiMmZmNTE1NGIxMzk4ZTVhODE5ZTEzZTZjYmZlZjdkYw0KDQpEbyB5b3UgaGF2ZSBvdGhlciBj
aGFuZ2VzIGFzIHdlbGw/DQoNClRoYW5rcywNCg0KQW51ag0K

