Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDEEC38A04
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.4129.1650429887402094175
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 21:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RF1f4WEY;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650429887; x=1681965887;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OsGKTxRTbloCCaERGRMK5Aq3D1x7AZ+gd++Uz4+8ZtQ=;
  b=RF1f4WEYqnt9uQ5qopL7Yr5ghytokpndj3wyA+uLjdQN5s01uR7jmwml
   IWik3d6d2XfOWvVzu4t2ccth3eqpNzvlapp/vvHT3wvfMppzN1xg6lqik
   woS9LOwAehO57lDX4mMX5UBMnJ8qBbToa5wh8+4Xqra1bgSGiaqu1+wOw
   HFfwAGG8ZOTS9hNpAICtVTpa/ANnSGZtBobNYqROEechUOCbCXC0XQibD
   6ntzdnxIqk/DmM8SBUgBvIPiq958d1gx1ynnxgUMqjHn2NeWqjbJVY64m
   L/QNNaAG2wnY/pkgRJOwsVooHgwSjcNpr+lOzYs5gkkxP0S+uQhrld+p0
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="289040710"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="289040710"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 21:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="804911391"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2022 21:44:46 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 21:44:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 19 Apr 2022 21:44:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 19 Apr 2022 21:44:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 19 Apr 2022 21:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwif0hjeGDw4WKDL+x2HlyiTJoR4tc0x3Z5/qRq4ipXx5gYk0Sa0c8Xk9lp5kmv4yd5hqgkMhrU4fUEAzFxnZ+gFXBQMdUCndS0nAzBfEUP2+7dfrFAosMmM4k1pVBm/BUUhZP2TXq+OGk27ZBtH2n+hmKL2lldaqERN6RSWwEPB9Hxe8pS0J9/2h0Pn8MHMMgzgPUQbSDgp+bjAFwbP33Fnqt+5/RQMmsDdfwmsoGZ1H73cUyrJtiAEth6SwDiGfMCQYDn9zDC4Bma45lvgm32Yw8+aahezx77iKnEbnnZP8juN8RkYsn6PAKeCH6t26t9D8fbqE+7ob6WZYpwjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsGKTxRTbloCCaERGRMK5Aq3D1x7AZ+gd++Uz4+8ZtQ=;
 b=WPjdBUeSzi0Kg2RnnE/JdH2bYMOIfPwy+lVtkwbXAMk9Z67lulmTN/Re9tKoZq5g/pVp0Sy7JXhKL59DM+ceJ83o9QiEf7zWh+8kBvwrfxWF8P1cJeAldNxfUVWxvbo4/X8U2LRJ6jsYz8H4LGaGMtZu2TK/UX5759h2Ll7fXgZ+VBXvTe5Q4VSbfkOnmhZS0cOmURGgVCqOButxtCNIb9iWT+cshOsbIZ27yhPYlzFRVd27wEfdHDm8daoaXubzoLubyidEbTtR8J/GdVBvGT0fQqLlhYDAGXlxgBufB44Jiug07LD0xm7NW/ISqFNxRyIG4bcZzth18uPxN/vBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3831.namprd11.prod.outlook.com (2603:10b6:a03:b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 04:44:43 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::3d10:f50f:7260:c4f8]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::3d10:f50f:7260:c4f8%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 04:44:43 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Jon.Mason@arm.com"
	<Jon.Mason@arm.com>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"bernhard.rosenkraenzer.ext@huawei.com"
	<bernhard.rosenkraenzer.ext@huawei.com>
Subject: Re: [OE-core] [RFT][PATCH v3] gcc: upgrade 11.2 -> current gcc-12
 snapshot
Thread-Topic: [OE-core] [RFT][PATCH v3] gcc: upgrade 11.2 -> current gcc-12
 snapshot
Thread-Index: AQHYUO+sFH5+ZzLolUWh1E2ZANg3LqzyMECAgAFeRYCABK1zgIAABNqA
Date: Wed, 20 Apr 2022 04:44:43 +0000
Message-ID: <c058bb729bf7ab0a5ecb415635f745b9be70e327.camel@intel.com>
References: <20220415173821.3079322-1-raj.khem@gmail.com>
	 <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
	 <CAMKF1soDEVXec8DXSYJHJ3+4coj-hc95NfQ2r+sA+F7Mg0dYnw@mail.gmail.com>
	 <CAMKF1spSa+gi6zbbxjybD+Gx7p-rPUZcqJ7o0CGFm0gi5W0_mQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spSa+gi6zbbxjybD+Gx7p-rPUZcqJ7o0CGFm0gi5W0_mQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db70b690-b5af-4efb-c459-08da22887cc9
x-ms-traffictypediagnostic: BYAPR11MB3831:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB3831A2D8C54D8E34535BD1E0F8F59@BYAPR11MB3831.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kB3Ocg73q1nnZlL0ljfaGMX2yO2MoHYAa00jVflST4AI6ajjRm/xylgiigpcL0Id0GjpZLRf74KtkoGjvAzTmzxI4ZZrMOQTKv2yycVHAbiGbhJkoq/DBVs9FB5d8/iux9ClvRu9BcD47ue7tT6e55yNbTYlh+2o6g0i9o/9gxBi7xtU0uW8FAN9Slkr7Ly1oRGZl6n1LAaHCLLIwSb6XX/cUSBRjWd69rAxxpMBePvru+LmUpmSb8UqACQdYahp4dcyOPBOwSjpqioWVaPREDETyTo2JCfN9rKbesqxuFbbZjq3c8qES8hhQE4L1lIS3793UOJB4hiVglevEB00zR7jUsEynPO3lleIygtv+sDgNKe7BBIkiiRJrkadL478tY0rmjYFBVfomSDGyqhr/+vt6ojTK8kmg/x3f0a1XDY7WLWRuET8L4PBf7KQ+RvLlW7z2S/xX0m5dDIxH8e5a64EMYCQUQCeDvkb4rp3QgbNPIjhJLMtFs/V4zdM62zw2Ou4RwmOXqBYYgJDwGTjS84XSvEwvmREcMDrZMOv4j2J7AELi+PVjGl3Q3o7D08oDthm6xzdKd77l4v0W8IMCMmwgZxG9HKJlqYNIC56aodMhH3Vza3yp3BGV7d5fM8ay5SwiVTgGgz83Ul9lBtJMKkhzasW1t50baUWcixOiYroWcMD3uJx2GMKe7BQuWTWq5PiJyPAFJp+stxpspEEaYY854BwC2FdU4j2CoIJm+9YkB6OxPhEi5L9hi5RcFCCIpFD8nxFflElXKJOnTGOcf6TPRiGBM+doJTjM9ULdWEIPj9c6WZssqfSpVGRgfG/jGNTCsYLPrcarZDA6+lSDw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(66574015)(122000001)(2906002)(2616005)(36756003)(83380400001)(8936002)(71200400001)(66946007)(76116006)(966005)(6486002)(508600001)(38070700005)(5660300002)(38100700002)(54906003)(110136005)(316002)(66556008)(82960400001)(4326008)(8676002)(26005)(86362001)(64756008)(53546011)(6512007)(66476007)(66446008)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UnU1Q3lsWnR4RHh4dndVWjJSWkozcHlTMUlpdUJYcEYwa0JuUmFCNURxNlFw?=
 =?utf-8?B?VlM2M1ErTWFEUHBiY1lUNWJUeGw2SWRHUWVkSHR2OFNXaHZMRjdHZ3ZuRkxU?=
 =?utf-8?B?QWNrTklvTXlOMHNGTlMvZzRKUjlKdEl4STlTdVBUNUdoYmM4NVJFUkM4UEx0?=
 =?utf-8?B?VGpQWVpYeC9VQStoWTY2OC8yU05YRDRGUVNLczVHUFNxRmZ6cmIzTGpUek5a?=
 =?utf-8?B?NWp4NVI2bGE3cEx5eXlEaTI5RG1LMXlvdWwyMjhLRWpVdFE1VE5HNWZ2eTV0?=
 =?utf-8?B?QmpLRjAyVjV5QU1md3dKU1FaT0pjeXMvakNRaHNJNUlIeVcyYlA0MUNVcWhk?=
 =?utf-8?B?QVNiMXNDOEhHaDZlU1VrcVlKdjhZRVRxNjRReEI4MzF6OTl5WmVaeldIUVVw?=
 =?utf-8?B?Rmk2QlhadUU3YlBsSGY0enpqYllMYklLWGFoRmlWem5NZ1d3N05OZk9sclh4?=
 =?utf-8?B?dnU5d2h1RUcyZEFpKy8yZkVINW9LQVdSZHlBa2x0dERwenYvdjI1Y0NmUkkv?=
 =?utf-8?B?Vm96eU5YRHdsVXhSL01HdTRGazNGNUlIcU9LWVlJbmJEaGhZV2FjYWlLRGw0?=
 =?utf-8?B?di9DVytHRlNZamtoYXJQcS9EYWk3YXJqY0lUR2dtWEwwbkdNYmVpcU51WFFS?=
 =?utf-8?B?MU4zU2h6Zmd6cW03UWhLRnZEMG9qNlpUQkJiNURScmNMUGJCK210VkNVSzZQ?=
 =?utf-8?B?bHhXQlpweVRPSGdkT2RKQ01Md2twN1pMOVZydUZNM1ExT2dOOVBvSjF3VzVM?=
 =?utf-8?B?cVhkbmUxWE02YkZRM0h4MHJ2Z085c2UxRjBacE9GZ1VJRVFsQy9hcENNaUlj?=
 =?utf-8?B?UDBsSTFBUEJOaVg2V1BCcDg0RWRCeWZFNER5N0k5V01Yd2ZjU3NMQ1NQU1FG?=
 =?utf-8?B?eHJvOXAxZnE3aVl1ZjFtd0lrZnhaV2tIdERvYndDK2RTSDNTRUJyZWRTYUMx?=
 =?utf-8?B?NzVrVHB5OXI1T3RucDBlalllcE5Vd0VRSnJML0dqOVpCcmxjQVl4UWFmOGd4?=
 =?utf-8?B?L3lwVFZ0VzZJUTAzMWVFN2U1MEQvb1RFa1hhYWtDKzVsTUZHNkFvSjh5NmR5?=
 =?utf-8?B?Y3pNcmRBdDlrOWVtZktPdDFveHhPUmJGYVVON3o3dXI4ZVFUd1psNkZlMVMz?=
 =?utf-8?B?S1ZpcDZ3aC9NRUdNVzNiYlZHZGFQQnNNZzB1TWtFSE0zMWN2R1dEN2tnN3hQ?=
 =?utf-8?B?VFIxRG5MZGIyMUFZYjd2NUR3S3lnS0RycUk2ZE8rY0VsYWVEZVdmTGEwcHl0?=
 =?utf-8?B?c0RKbWdMR01tc2tuUURUMTRuenBKVS95QTFQNlkxdkNKa21xa1h3R1QxMWla?=
 =?utf-8?B?N1Rsalg4VWk1Vk00NWR2YVRiMWpSeGFOQTRqdXcwTWhMeVo4KzVxQXQ5aEZn?=
 =?utf-8?B?OVZhSjByT2JzK295QTdlalhjQXN5Y2c3S1ZOSjkrWFNZc0FnNEh5YVlrWi9m?=
 =?utf-8?B?VGJxRmpidVE2TVpMQUV2ZUV0ZlVyd3NCaWZ3ZGxOcy90RVh0amtlS0RwK01J?=
 =?utf-8?B?dkJxdkVUbW9PbjJFVUozUnFEQlJZYTRtU0RaV3dKYlV0SVMwaHJ3ZStNaEpG?=
 =?utf-8?B?NFgvNzFHZnR6WjBwc05yVnZLK1g1dDhDQVAxU3pvMk9xOGhDU3JxcU44Sm1B?=
 =?utf-8?B?NGY5ZCtmSUpFanpCTkFNZjN1Zi9vUTd6a1JPOGdXeHE1bjBQSGZ2cnM0ZjNH?=
 =?utf-8?B?aXZXTzIrK2F0emJZWVJoWEF1aXpBUkRYbitkOEw2NHV6d2hJWnQxa3dGQXlx?=
 =?utf-8?B?TlBMS0I3TU5scXEyVWdXS0Z4YXgyajJYbkEwVXFLSWlkRndjK3NtcEgwWXYz?=
 =?utf-8?B?eUJIQ20xWXZFRXRzaHRqTmZ6bHh3SVpBdUtiTDJROHI3RmtNeGdyN2hzSTRK?=
 =?utf-8?B?aUoyREp5M0J3ZlV5MzNVRU0xRG1OVzJQQTBXc3JmdjY2a3VCQS9tdzRHaGtU?=
 =?utf-8?B?RE8raDdiSWQxZ1E4ZlpGdCtnTXRkdG84bWh4ek1tTGp0ZEN2dENDTE9aLzdI?=
 =?utf-8?B?VllhRjVDYTBvVVNseFFjc2FPUERKUk5jendtZzhnK3dYVG9KbTR5V1lLSU5o?=
 =?utf-8?B?cmw4NFViRnhEU3JXOWhoamdjbmI2VUEzMzRwK08wNUdXZWR5VFQ0NlhML21L?=
 =?utf-8?B?VWtabVE3TU5Iem1XTDJoeVdXdVFOTVJkRTFZbTEvVzc3alhaYXdxUUlVY2pJ?=
 =?utf-8?B?cmp0S29WbFAybDRpYTRmODh6UDIyZ3Z1d2tEajRFVCtkMllld2VFbWhKTmdE?=
 =?utf-8?B?WHBhMGVyTWVnamY3VjhuZzgxYUcxQUhoUG1tR3JxK3h6UUljZEFaNHh5WWxn?=
 =?utf-8?B?QUNKZTV5YmZGNG1ORmVZQjRhMmtZbitrYTUrckRUT3M1RlFLL0gwbFF3WWpR?=
 =?utf-8?Q?qKQZV9rEyJwCx+sQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <843CE9F4B7463A4591C1E58E7B02EFE6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db70b690-b5af-4efb-c459-08da22887cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 04:44:43.0528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 xxXmdX0dZXCnH1UshynsvoDwHMB/6WHjoBxmLvFChvGEa5K7ddalMr2JelaohRBVABTDW9OrnSgJ4wQ2oqda2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3831
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164657

T24gVHVlLCAyMDIyLTA0LTE5IGF0IDIxOjI3IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
U2F0LCBBcHIgMTYsIDIwMjIgYXQgMTA6MDEgUE0gS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4gDQo+ID4gT24gU2F0LCBBcHIgMTYsIDIwMjIgYXQgMTowNyBBTSBSaWNo
YXJkIFB1cmRpZQ0KPiA+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90
ZToNCj4gPiA+IA0KPiA+ID4gT24gRnJpLCAyMDIyLTA0LTE1IGF0IDEwOjM4IC0wNzAwLCBLaGVt
IFJhaiB3cm90ZToNCj4gPiA+ID4gRnJvbTogQmVybmhhcmQgUm9zZW5rcsOkbnplcg0KPiA+ID4g
PiA8YmVybmhhcmQucm9zZW5rcmFlbnplci5leHRAaHVhd2VpLmNvbT4NCj4gPiA+ID4gDQo+ID4g
PiA+IC0gZ2NjIDEyIGlzIGluIFJDIHN0YWdlcy4NCj4gPiA+ID4gLSBBZGQgcGF0Y2ggdG8gcmUt
c2h1ZmZsZSBpbmNsdWRlIG9mIHNjaGVkLmggdG8gZml4IGJ1aWxkIG9uDQo+ID4gPiA+IG11c2wN
Cj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIN
Cj4gPiA+ID4gPGJlcm5oYXJkLnJvc2Vua3JhZW56ZXIuZXh0QGh1YXdlaS5jb20+DQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ID4gPiA+IC0t
LQ0KPiA+ID4gPiB2Mw0KPiA+ID4gPiAtIFN3aXRjaCB0byBvd24gc25hcHNob3QgZm9yIHF1aWNr
IHR1cm5hcm91bmRzIHRoYW4gd2FpdGluZyBmb3INCj4gPiA+ID4gYQ0KPiA+ID4gPiDCoCB3ZWVr
bHkgc25hcHNob3QNCj4gPiA+ID4gLSBBZGQgYSBmaXggZm9yIGdjYyB0YXJnZXQgYnVpbGQgb24g
bXVzbA0KPiA+ID4gPiAtIEZpeGVkIGdjYyBmb3Iga2VybmVsIGJ1aWxkIGZhaWx1cmVzIG9uIGFy
bS94ODZfNjQNCj4gPiA+ID4gLSBGaXhlZCBnY2MgZm9yIGNjYWNoZSBidWlsZCBmYWlsdXJlDQo+
ID4gPiANCj4gPiA+IEkgcmFuIHRoaXMgdGhyb3VnaCB0aGUgYXV0b2J1aWxkZXIgYXMgcmVxdWVz
dGVkIGFzIGl0IG1lYW5zIHdlDQo+ID4gPiBoYXZlIGEgY2hhbmNlIHRvDQo+ID4gPiBnZXQgdGhp
bmdzIGZpeGVkIHVwc3RyZWFtIGJlZm9yZSBnY2MgMTIgaXMgcmVsZWFzZWQ6DQo+ID4gPiANCj4g
PiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRl
cnMvODMvYnVpbGRzLzM1MzUNCj4gPiA+IA0KPiA+ID4gV2Ugc2VlIGZhaWx1cmVzIGluOg0KPiA+
ID4gDQo+ID4gPiBlZGdlcm91dGVyL2VkZ2Vyb3V0ZXItYWx0IGluIGxpbnV4LXlvY3RvIDUuMTUv
NS4xMDoNCj4gPiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29u
LyMvYnVpbGRlcnMvNjIvYnVpbGRzLzUwNzgNCj4gPiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9j
dG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvMTExL2J1aWxkcy8yOTY1DQo+ID4gPiAN
Cj4gPiANCj4gPiB0aGVzZSBhcmUgZml4ZWQgd2l0aA0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9jb21taXQvYTQzMWRiYmM1NDA1MzJiNzQ2NWVhZTRmYzhiNTZhODVhOWZj
N2QxNw0KPiA+IGFuZCBJIHNlZSBpdHMgYWxyZWFkeSBiYWNrcG9ydGVkIHRvIDUuMTUgYnJhbmNo
LiBzbyB3aGVuZXZlciBCcnVjZQ0KPiA+IGJ1bXBzIHRvIGxhdGVzdCB0aXAgb2YgbGludXgtNS4x
NSB3ZSBzaG91bGQgYmUNCj4gPiBnZXR0aW5nIHRoaXMgZml4ZWQuDQo+ID4gDQo+ID4gPiBtZXRh
LWFybSBpbiBsaW51eC15b2N0byA1LjE1Og0KPiA+ID4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8xMTMvYnVpbGRzLzIzMDcNCj4gPiA+IA0K
PiA+IA0KPiA+IHRoaXMgY2FuIGJlIGFkZHJlc3NlZCBieSBkaXNhYmxpbmcgLVdlcnJvcj1zdHJp
bmdvcC1vdmVycmVhZCBidXQNCj4gPiBwZXJoYXBzIGJldHRlciB0byBjaGFuZ2UgY29kZSB0byBm
aXggaXQuDQo+ID4gDQo+ID4gPiBtZXRhLWludGVsIGluIGludGVsLW1lZGlhLWRyaXZlcjoNCj4g
PiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRl
cnMvMTAwL2J1aWxkcy8yNzcwDQo+ID4gPiANCj4gPiANCj4gPiDCoGVycm9yOiB0aGUgYWRkcmVz
cyBvZiAnX0NPREVDX1ZQOF9QSUNfUEFSQU1TOjp1Y012VXBkYXRlUHJvYicgd2lsbA0KPiA+IG5l
dmVyIGJlIE5VTEwgWy1XZXJyb3I9YWRkcmVzc10NCj4gPiA+IMKgIDIzOCB8wqDCoMKgwqAgaWYg
KGNvZGVjUGljUGFyYW1zLT51Y012VXBkYXRlUHJvYlswXSAmJiBwaWNQYXJhbS0NCj4gPiA+ID5t
dl9wcm9ic1swXSkNCj4gPiANCj4gDQo+IHRoaXMgaGFzIGJlZW4gZml4ZWQgdXBzdHJlYW0NCj4g
aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL21lZGlhLWRyaXZlci9jb21taXQvYzg0NTc1NDBhZWQx
YWI5NDI0NjYxMDg3Mjc2ZmI3ODhjMGUzYWFiYg0KPiANCj4gd2hpY2ggc2hvdWxkIGJlIGluIGlu
dGVsLW1lZGlhLTIyLjQuMCByZWxlYXNlIHdlIGFyZSBvbiAyMi4wMSBpbg0KPiBtYXN0ZXIuIFNv
IHBlcmhhcHMgYSBidW1wIGluIHRoaXMNCj4gcmVjaXBlIHdpbGwgZml4IGl0Lg0KDQpJIGhhZCBi
YWNrcG9ydGVkIHRoZSBwYXRjaCB0byBmaXggdGhpcyBpbiBtZXRhLWludGVsIHllc3RlcmRheSBz
byB3ZQ0Kc2hvdWxkbid0IGJlIGdldHRpbmcgdGhpcyBub3cuDQoNClRoYW5rcywNCg0KQW51ag0K
DQo=

