Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6635DC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 15:42:27 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.55811.1658331739199542748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 08:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jkgUaYl/;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658331739; x=1689867739;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hhFEruKfmtPj9OLB3aAh0nYUhJ4S4UboAtrKrqMwd5g=;
  b=jkgUaYl/XjrybtG/MHHoKqTA/oVVCGOAfIau47ZJVwgrkTTFB7waBBGZ
   jzNbi/IK9oRLnqZFccZrbczX8UGobYiQtypEgzeFeT0eWaNP07jFr0orw
   PxsQhycQRNi53ktDwyIrDzSHPJlC46tXsh4EgO7xqXPHmx281x4jAtvLe
   1PuR5MEDmHc6FyCtVyRQjqZU06E+t0V9uU3WW1iQcYJLFlGUUePMt7iG3
   BvnA65z5I631jLYuD6WkJj0vRg3cmml+b/GhCtHnitS+CJ0NtSgDdZzIZ
   +TQyjeEAKyk42bSe82wUt/moOg2oGvgD56uM3fchI57UvA3jQhFOd4p8m
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="284369203"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400";
   d="scan'208";a="284369203"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 08:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400";
   d="scan'208";a="656324050"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2022 08:41:58 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 08:41:54 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 08:41:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 20 Jul 2022 08:41:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Jul 2022 08:41:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPojEgsnBZGgwGpOaWY8DFgZ6m3H8XsE2HulDTPN8mVMO/rZ4Ar54C58MHMB474kq/H+RFReVvj7EPCp41uxkZyefxPpoC2vjLl1XNvB2MlELqoEAN1Ns4FWUZfuAKzh0WJXyZKiLsAE1JTwXU63z+WmujzFPzaH/PIOl7yunjt27ZhzOplFL3EQC9fAh5aS3tXJGktoDm16L3bAMSEPRnRW+bO+J14BD56YpLx3urbNy5qwNEj2xhEIEsMAojxYG6H+gPgr2CPGhug96Sr9AqFLayQZJ8UfaWG6uZJ/0AwsZJ0MHHbz4s6RnSinHCeZ59EYSyfm7M9MQVaXtA8ivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhFEruKfmtPj9OLB3aAh0nYUhJ4S4UboAtrKrqMwd5g=;
 b=PpWWD1r9mgRf7uGrzvByr/ze2nS186UFwTku+rnVXFliaybLZ8m6d8KqqiMfqR/yL5cW5xJUV5UPxxCJFcUPLnVzlehY7fQoJlVu0cnPTRoF2//OmnFKo5U/W/43+FsyoO+KpVqFsk6nuQOhgAMxbdcAIdsb9/PMhC/beDR6IVwGqON6qTJI39NxGCebYvpfHMhTCCSlFmOwRG3/RF4ANWlTPKztgBG8hXGlPhJuAGLeihtd+7hZyAz399qGHSd55m/fSPd+eRFiW6BCpm9552wd9oppiZMurYrM+oqRt8umMtmUHegaJz1ttu9E/IPbrXjjqi18geaQ9eo3Tgt43Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by DM5PR1101MB2155.namprd11.prod.outlook.com (2603:10b6:4:5b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 20 Jul
 2022 15:41:53 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::9e6:6e79:2ab9:1415]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::9e6:6e79:2ab9:1415%8]) with mapi id 15.20.5438.024; Wed, 20 Jul 2022
 15:41:52 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "Ross.Burton@arm.com"
	<Ross.Burton@arm.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
Thread-Topic: [Openembedded-architecture] Let's drop x86-x32 (was Re:
 [OE-core] [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
Thread-Index: AQHYnBW86wkPKGon4UCFSJjoKTaXKK2G/I6AgAABVACAAAY6gIAAAkYAgABf6IA=
Date: Wed, 20 Jul 2022 15:41:52 +0000
Message-ID: <7092d96e020932ff7c32a78b7862502bb0faddcc.camel@intel.com>
References: <20220720084442.2940187-1-alex@linutronix.de>
	 <17037D268C38CE83.21682@lists.openembedded.org>
	 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
	 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
	 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
	 <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
	 <CANNYZj_kuU9GQMYwQyPjvqv47PYq=o8LXNbHzAVWdOwN7DFeNQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_kuU9GQMYwQyPjvqv47PYq=o8LXNbHzAVWdOwN7DFeNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e767d369-cf3d-4cbf-a5fd-08da6a665e5f
x-ms-traffictypediagnostic: DM5PR1101MB2155:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 McikJ5dgu2I3kwySyZyzr7xf85MbrduqhfHdDjg3BznuAW5VCp08uzGk004y3dckQArlj3e7mY2adKJmzpGIrN5nRh5PsTEY4+rsys73DQqwDQn/+B0x5GRcqKaajrGmo0KV9nFCQASPWarj+oBg9/ccMJO+g66hPSaWHrs7arKaJj34Ot4ZMQIFwOoR4I1Omkjfq4pjH2IS47/ttqTgSec4r7qTA+qRRfgbOMvC6d1HtCy3lZzK2KkvTPCHrA05J/YZY7rJ1G5eCwIGnoTpOfCK7N+YUTmAl2j9uOhoV2aZ6aN4IvtVqU8/l/HmjQHk8WKPyrE8yKnyZQIys1TqDruwJyKEl+mDoHYpD0HE7QGXvomYb4HOK95o5tTuPsSAyzWsfcesFgOJdFzPw8bkdIxga28jKma8AG6cnME6/EqxqaWfynaNTDc0L8yZckm2/IG322ueoSLvln8A/m6aLB8anUt0QZO7xrkY1eQdLKV1DzFWZLYnsYWSnUH4jE9blNlovqDd6mQXMwv0gR58GTDnMIvaxhx87SFjPOHy5LC0I9H7LmeKx6oLnEAJsSGM01fmTefEs8r1s0iYKxoqndz/Z69SzEcoATbdqtQG+86Fo7+Woe1ttjsFhGUU4goGjuKw8jJOFMHLY55dq53qGtaAb8nO7K1I+C/TOTyR/BM+kdFo2+jiDOnjjH3oXPkcF0Jn87lkuxX1fSi04EGK5w2Had4EpuEuTMEIwLLNVcE69+ZDD7UUH5a2PtoPz9cqkdYLuKfxRcLrXVsfjjrADBHJyjXmmkRL4lh6zt25poM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(4326008)(8936002)(86362001)(8676002)(66446008)(66556008)(5660300002)(66476007)(64756008)(316002)(38100700002)(76116006)(91956017)(15650500001)(38070700005)(36756003)(54906003)(82960400001)(66946007)(41300700001)(6506007)(26005)(186003)(2616005)(110136005)(478600001)(122000001)(4744005)(2906002)(83380400001)(6512007)(71200400001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S0djZEJydjRsOWF3WFZtSVEwRW04S1NpUU16Rk1wN3U2YS9XMmx5RHVEMW0v?=
 =?utf-8?B?YmtMOHpoUDRybnhLTDgwZUJMMHQ3d0dHNmg2YXlJZFh4MkRkSksyUkI5ZENW?=
 =?utf-8?B?QUFBcEkvT0F6eXVFNHBnd1dKMEFNK1lnVXpRMDlMY21qTHBlZXoxdU05bUU3?=
 =?utf-8?B?eWQza1laZURwaTBTakdZdmhXNExldEJqVi9SK2M0eUdvemE1cVFKOGw0bzBD?=
 =?utf-8?B?dkRScUdRZVlDSDVEcGo4YlMxcEd6QWFobVU3ak8rU21MT2l4ZHhKbnlOR3RV?=
 =?utf-8?B?UTREQmtqVmthVlR0UExBYjVUVzdhTFVhTk4wTmp4c2hMbVZTOGxiODhMVjZz?=
 =?utf-8?B?MWhIT3l6aFBvTUFtN0sxaUNKaUdCM010UW5XbWN6WDVndmJrV3BuMm1Bc0hj?=
 =?utf-8?B?T2FkVk96Z203S2Njb3BKZXE1VHBOYzh4ZDA4cklQNWFCUFBmb3IwN0w0eDZp?=
 =?utf-8?B?dzRXdmN5UzFBaitxKzc4OTZaa2pNTWpWVlhwOFBuZTVHZmQzb0trV3lKM0FE?=
 =?utf-8?B?dEFGeXZpTnlTN0c5aTZqWlJoc0Z5a01tNlUzZzFZM3pHYTNER3Q5dlpsemsr?=
 =?utf-8?B?b3hNNWl4WExJSWlEZVora3dFdHM0eVMzWm5kSXlyK3BwT0twMHY3S0VqOWlF?=
 =?utf-8?B?MFYwblpJSmFleUkxTDlDU3ZwQkFnQnRUeTlJaEc2dlJ0clRJWnBFOXA5NVFO?=
 =?utf-8?B?WDQ1cERCWE4yL3ZGRlBjZ3JYMit2VjJaeDdGekhaZEl0SUZ2L01xTEdQcjFC?=
 =?utf-8?B?UWEveEh6QnZ2Q2lJOHpoK2RjZ1NRUVArc1RnSlcyazZwTGRHOEVpdHlRaW5x?=
 =?utf-8?B?M1JOR1ZncGN6TW5LWlNRT1duQVhqS1NpalFGNXhqSjZxUVlocXNzb3JTR0lY?=
 =?utf-8?B?WEY1NDdPeW5DR0NqL3QyL051UU84L0N6SDFXTkJPMVRtRjNteXIrMFJxckww?=
 =?utf-8?B?dFY5aWhDRHk2aG5GOWo0ZWF0QlJVcUc5WnljUmtSN0wveUw1RzhFTlNYZmtL?=
 =?utf-8?B?UEFtclQ5V0RTZUxWTHlnQVhIRStqVy9QM1U0N2JSNXZRb09ZSU1yZmxCZEFu?=
 =?utf-8?B?bHJhaC92MDUwS2QwUDc5OGNtS3BZb2p0L284ellsL3JDUE1yYXBmckxWVVNU?=
 =?utf-8?B?ZCtMR3Q3cW1EWEtYRzVQM3ZlOSsyVGlRbEJzR0loNndFZ1BMM3UwVk0xdGM1?=
 =?utf-8?B?R3o1Y0xXWk8zc0N0eGliNk9lM1BUSjU0WncyRFovS0YrSTJBK1hGUGtjd3ZB?=
 =?utf-8?B?QUlySm8zOE84S0pxWnhON2cwKytsZTZrekh0am5HbUk5RFg2ZUovRm0xdmVE?=
 =?utf-8?B?MHJrV1lLVU5DSEg5Nm5udGFvaDRrZnVYYmMrWVdrTk92RWFCNG5Bd2Rxczcw?=
 =?utf-8?B?ZzlMN1BWd3hxdkUvSHJ0eU8xZW9wc291cDRKSHdxbXNIU3g4Y3FFVGpIS0ow?=
 =?utf-8?B?bm1aUDVhZzNJZVhCbFJiUWpQSjVYZlNsTEVwL3ZFcG55WWEvTW5OM1IxMGt6?=
 =?utf-8?B?eWNBNm9OQWRKU3FYTlJkWUpMOWxuSzZ2bzI3U3MwcTg5dGo1dURHYU9WSWV2?=
 =?utf-8?B?bVRPLzRUTWRMZEhEYXlVMkJsS1Q5TnZrYlJ5NElqKzJQUHJ0Rnc1MHh4N0w0?=
 =?utf-8?B?YjVjUTVsaFlyTnFGSU1XNldrcEEyQTV2YTRCZVhFbUJyMVpKaVp6cWNUVlp6?=
 =?utf-8?B?c0h5OXRJSk1kdzZabVhoTUNYa0R1Y1RwK0NVbXdaWThuRG02Q2tMbDZGV1JB?=
 =?utf-8?B?UTJ6QXNtNUVUcFR4U0ZBSkZ1bFZ4TXNLVkExY21RSEh1SmJ1YUE4RGNTck9N?=
 =?utf-8?B?elM3Slk2cExJWTR4R0N1UDhxUWZyVWZpblgxM09rTjZCNVp1cUt0RHl0MDZu?=
 =?utf-8?B?cFlTNTZTek9iQmlZejdRK2taNm1pZUtFT0ZjdWVnOGkydmxIeGJiVzVhOGFk?=
 =?utf-8?B?S0hZWXgxVnorT2tHQkZDYjdQOHEzby9Jb3FxeEVxYzJOakdpV1lHWUR5Y1Zk?=
 =?utf-8?B?Ujd1WWh6elA3WjlMN0hWeFo3TzdBclZVUFBYR0ltZlU2VFNwL2dBSnYyZEdF?=
 =?utf-8?B?UWc2TWNEbjNpak9sMXRNMnJ6OXYrcGNQY0JlWEFiYVJncnhkZ3NlZ2RaK21j?=
 =?utf-8?B?OEJPTXR2SEVwb0VoQjZicmdudmx6YmNmRHRuT2hPTW5KcnNoc3RORm9pUk5i?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D515D40032EDEB4FA9C39273A9B511BF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e767d369-cf3d-4cbf-a5fd-08da6a665e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 15:41:52.8725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ojLCH4KW/0XLU1NLTlgcJ14AE+EYgBU1eOT5vEFWmko+4n4mcMce4EzUZdQq8cGgkItvmBv3bvFwnaiWo83ONQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2155
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 15:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168366

T24gV2VkLCAyMDIyLTA3LTIwIGF0IDExOjU4ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gV2VkLCAyMCBKdWwgMjAyMiBhdCAxMTo1MCwgUm9zcyBCdXJ0b24gPFJvc3MuQnVy
dG9uQGFybS5jb20+DQo+IHdyb3RlOg0KPiA+IEFsc28sIEludGVsIHNob3VsZCBnZXQgdG8gaGF2
ZSBhbiBvcGluaW9uIG9uIHRoaXMuwqAgSWYgdGhleQ0KPiA+IGFjdHVhbGx5IGNhcmUgYWJvdXQg
eDMyIHRoZW4gdGhleSBjYW4gaGVscCBmaXggdGhlIGlzc3VlcywgaWYgdGhleQ0KPiA+IGRvbuKA
mXQgdGhlbiB3ZSBjYW4gZWFzaWx5IHN3aXRjaCB0byBhIHBsYXRmb3JtIHRoYXQgaGFzIHN1cHBv
cnQuDQo+IA0KPiBPaywgbGV0J3MgYXNrIEludGVsLCBzcGVjaWZpY2FsbHkgQW51aiA6LSkNCj4g
DQo+IEFudWosIGRvZXMgSW50ZWwgc3RpbGwgY2FyZSBhYm91dCB4MzIsIGFuZCB3b3VsZCBhbnlv
bmUgbm90aWNlIGlmDQo+IHlvY3RvIGRyb3BzIHgzMiBzdXBwb3J0IGZyb20gbWFzdGVyIGJyYW5j
aD8NCj4gDQoNCkkgZG9uJ3Qga25vdyBpZiB0aGVyZSBhcmUgYW55IFlvY3RvIHVzZXJzIG9mIGl0
IHdobyBtaWdodCBub3RpY2UuDQoNCkluc3RlYWQgb2YgZHJvcHBpbmcgdGhlIHRlc3RpbmcgY29t
cGxldGVseSwgbWF5IGJlIHdlIHNob3VsZCBzd2l0Y2ggdG8NCmJ1aWxkaW5nL3Rlc3RpbmcganVz
dCB0aGUgY29yZS1pbWFnZS1taW5pbWFsIGltYWdlIG9uIGF1dG9idWlsZGVyIGFuZA0Ka2VlcCBh
dCBsZWFzdCBzb21lIG1pbmltYWwgc3VwcG9ydCBmb3Igbm93Lg0KDQpUaGFua3MsDQoNCkFudWoN
Cg==

