Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4C8C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 04:11:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.9470.1632802304799745185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 21:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=wFkaGnEn;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="288275274"
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200";
   d="scan'208";a="288275274"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 21:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200";
   d="scan'208";a="706508216"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2021 21:11:43 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 27 Sep 2021 21:11:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 27 Sep 2021 21:11:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 27 Sep 2021 21:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGIkKe2YEy5/3fEinJ8xpT7bVXaEEk4lBeIpIc7a5TfNHLaIymDfD0vg9c9GIKQLKbA+u2wGZpHAxz02WxeSOmqClVK+zOq1w6dmWhapjY/TvTqYXDjm9t5Asp0qnclbT8yVe0FwgcEe+S5RfUyH6UL99/a1KrYknniIJYWTY7XvgG2n3iA8EaMu8o9DR4TxYPkRTtlckl4A7ckX8M9YUiynIj9upeg5j5cDxk65mRDGbhN6x5p00yx9mWx1Q1zf81xS+vjGLi5ezwzbcAfNj0KYhluTkGjM2ODJjWF1OWUKV0j+fnar2wuxlnJd5Q579hwq6nJ70XkXcsNaH/aY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ynkxgqZVh4aYazVRGmyT1nmyi7/q5PCqRN0QJuzuxfI=;
 b=XE9dnyr0W+y3+hZHVzjRtiyiK7o92jqTwY0Oc2o3ZkMKS4VaOVe+ahuLA15ss06suHN2Bg0S6YqxH1VRfPecHTvApjetscYojjpMiQE/wVvFHFuZQQ/gv06Z+Ihdvn3tKNShMU2AcJsA4f6aIgFRDz8AGjN5567JEAurBK+Bu0uv54l86HVZU7Ok1ktedO+kthJ8b/ThfxTtCaP9p3Koh4KfrYMSFnNfoO6FT5lB904m7VHQnUGm0mirnMe/GTPfN4LF/4z1COPl+7yoiVsNKsTjVx+ucpHMZjtYv91vt55p2WXZLSvlqkSUUASLkWHq2RKLOCSD/VPdvljKWD0tOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynkxgqZVh4aYazVRGmyT1nmyi7/q5PCqRN0QJuzuxfI=;
 b=wFkaGnEnrCETKvgUsRxhqT4dNBzNb5nt2+ZemQgncZvVA3nkVQv1g/+IPzMG7FsctS2cpBTMo3ThZrhnAQnmfQGaanSxoy7SDHLIg+QjvqryLE04EAnzilrRVfzSvPfCNPKId7i02PZtIloVHhV4OIkiNeuezicL+fgTO8t9ryI=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3622.namprd11.prod.outlook.com (2603:10b6:a03:fe::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 04:11:40 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4544.021; Tue, 28 Sep 2021
 04:11:40 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sakib.sajal@windriver.com"
	<sakib.sajal@windriver.com>
Subject: Re: [OE-core] [Dunfell][PATCH 4/4] qemu: fix CVE-2021-3682
Thread-Topic: [OE-core] [Dunfell][PATCH 4/4] qemu: fix CVE-2021-3682
Thread-Index: AQHXqo5zC6WwlGX1X0+VVbr6YvtvMau4RTsAgACjhQA=
Date: Tue, 28 Sep 2021 04:11:40 +0000
Message-ID: <d5704cc68209bd702b1cda6d43f3edfb37a47891.camel@intel.com>
References: <20210916000419.1812968-4-akuster808@gmail.com>
	 <11562.1632767182950323181@lists.openembedded.org>
In-Reply-To: <11562.1632767182950323181@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c1a70b3-59f5-45d4-700a-08d9823612dc
x-ms-traffictypediagnostic: BYAPR11MB3622:
x-microsoft-antispam-prvs: 
 <BYAPR11MB3622ECB23D5BDBAEE9C6766CF8A89@BYAPR11MB3622.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m9oSj7O4S7lvdpksQ+2B5bRHZMSm/HuBddoruftMP/Nj62FoM5xfZPCZu5rPV3kWI1bZ8v55Yhacf23KVrvOeOYqOR/Y6+DPq3Npb/xc3uHLIDzacTY5SzYdTDAS2pns9M36Ak4Sur1n80nHh15NnQODGpIm/fTBNC695PH1wfBdwTOEigHCEynqXU6DxPToIHRJnOYmKwC2X/mwmVsldB3ncAQCrMQmw0QHW5Pi2OZgwPiFXgTMjd3hm/yriED0DnYF8SGtQE1gepzjBBgePt5SHnjsAyWezg8PCmQ6akqYr5O+g0y7TEoETvvpPjf9G7rW5xFMcwsgZDnPrf+6hMq2BmZPwkmW7jARlg6YU3/C5k22Ulgq5DYc+o6cLwvm1y7Wa8HMLrcdGOsX/dxRRsJ/bGCoflX+OXAlxtYJQgZQWKZs8kSyc5u5AVpyuKcZ8G8byuABBtBmxn/a5Hnxcg79FPMW6orp+dY7RtN+GgD5w2Tz5az6Z5gsNI0FyIkA2f8qOsFTLWcrjD3Mo0UXOK/jc9Vv1yvk/J5QSWcW/0dZf2UydsjJF9TTyx96jCpCqg1EpQN8gJWTKI0sU0fwAfRzjZl6rAzNRv52vXbM/KxyvHMwu4jmVAq1/8u1Q2O0qmh/jFwxxlBXaZ+RJWQviG7YnC5fG1yKKkR+VM9b7QOlRIw8XLsy+E0AsMHYR42cuiz72h9yHhz+BxDkXNVu2aq7g6ugytd7fZDh3/eh7Zhpx28tiqiQeNVQJp5SrEwDVdRD7jK57rI5fhcjdWJN4fLHwWaQOc2AN07otKOXzNM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(110136005)(71200400001)(36756003)(66946007)(86362001)(316002)(508600001)(6486002)(91956017)(2616005)(8936002)(8676002)(2906002)(26005)(4744005)(6506007)(186003)(966005)(66446008)(83380400001)(5660300002)(38070700005)(38100700002)(122000001)(6512007)(64756008)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c1RWVmZLSGsvWmswNWNlOEljSndCdmFXand5VHZYVXhNMzFOQkFGWkFOdzd5?=
 =?utf-8?B?QktobWZWVWxsaEJOMU44NzM0VnpLckNZaEhvbjZ4ZUFLT0IvV3FzdmpBV3pL?=
 =?utf-8?B?L0pDYWFjUDBCS1hnaWh5SGNrNWFGOHVxU2d6anBlYlhvY3ZDbUNrVmZUQkh3?=
 =?utf-8?B?S0JaR1U2U2hiMGpJTXl4ZDNqa2FOMmR6TFV4c0J2UHFkVm9ub3NaZnRmeWdn?=
 =?utf-8?B?SFRnNEdQem1tS3F4by9Dc1haVWN2OFVaaHZORGpkRVJZQnE3VUhacGxhNjBn?=
 =?utf-8?B?NlFPQnY4Wk95VkRjbHZoMkZGS0c3SHZUeE8zTTZuUy9RaUU5V3BYVUt5YUg1?=
 =?utf-8?B?bDlBSldBdGZ3RHR4R01RQU85dlBvMzVNMXcraTdFQWJEV01jVXZRUnA1VU51?=
 =?utf-8?B?T1NqeTR4L3pCSG5nT3pNTkIzZ2lVQlJNRmErbzI5ek4xdVZtZFh0a056ME9K?=
 =?utf-8?B?TEcwdjEzTmJONTZaenVmTzZwbHp1Tzl4RmJWdnVNNVhGZEFuSGI3OGxlM3hH?=
 =?utf-8?B?R1RTU3hySTlKVmpEcnE4SUpUWFVmQkNHNk5JMys3bGpha3U2RFhYQ1hoUm55?=
 =?utf-8?B?NmNEanAveGpUZ003U3MrTFpDS2hNWkZnQVhjT0pnSURFM0s0bEpwZUxrUGxB?=
 =?utf-8?B?ZjFKWGxrZEVxZHJUM1BTYm1XRURJSzhpbnM0ZEtDOE90NGFlU1V4a3laVEpO?=
 =?utf-8?B?RTF5UVlObG5iaFVJdTJKTDJGWGZkQU5hbkZQN3hlL0NIMnA1clE0eTBCRE1i?=
 =?utf-8?B?SkxTT0Rob0hveTZCNUNoS3ptd09BTmxXWFhsem8xWFJNK3BMWnduc3IyZG9o?=
 =?utf-8?B?UUo5ZGMwci9PTUZOeWhWTUVQanBzWFd6MmphMG1KTVl2cktab04vQkZoMkFD?=
 =?utf-8?B?UDd0WHdkbDlvTU5lN01WSjJzWUpSSUNnQ3pFcm9sa2hmblBqby9XMEdINHJj?=
 =?utf-8?B?V0VtZUhVaTAydHF2bkN5UEtqaVFEKzJucmxtUS9BV0pVTE0vSDF1MkI3VmFu?=
 =?utf-8?B?ZHFJZTJRSkl6VVJBdWN4ckVQTk9YR0loQ3E5ZUdvV1ZxcDd4a3VyVkEwcmY4?=
 =?utf-8?B?OTFURGQweWwvajF6M3g5RXVqdEJIUzI1R0JRc0paM29BRFlrSndkYlR4S1dr?=
 =?utf-8?B?NUVYSnhySURWSndHUU5xMnUwV3RPcHBjTEx1Y2dqWC9mVDIwVWFnVFd6dSs5?=
 =?utf-8?B?ZHZxMHFwOXl6U2hUYm9pZzdudzhQZWRMcUZJWXl1WjNFaHhLRFY4L20wTUlp?=
 =?utf-8?B?WUxnVHJGVzl5YW1pMTN0Yk1xcURmRkh6aGhRa0xwUkJlOTRQc2xyMHRjZk1h?=
 =?utf-8?B?TGRqV2xXTFNFL2NFOGd1YjRYV0IvamF4T2M1NDExaStGcExDaWg3RXpUTlR3?=
 =?utf-8?B?VkNRY3VlN3Q1TzRxUjNHRHJpaVNkN0M5WVpaWkZJUUV2Yi9sQkthYXVZKys0?=
 =?utf-8?B?cFRUeXIyZnpMWFRVbTZWd0xlWjU2czBwank4dDhnS1NvdmdGQXNkckdFTmc4?=
 =?utf-8?B?Q3BHcjlSaVlWWFQvUitvNzVFbENTNkpOK0I1OHpkTC9uL0xqQm0vajBVdU9o?=
 =?utf-8?B?UDU4aU5vNmR1WG50ZlR3bXkrVmxuYjJyeFE1VGlqVStRb2JTTnpzV05lRTQ1?=
 =?utf-8?B?cE5PU2FoQTRwSlVZRXFxdm9tampHS2ZXeURZTWZBZjhZRDJnOHlRNDgvMUFQ?=
 =?utf-8?B?eW53bUlTRzAzbmozWjZTYkUvKy9KSUhud016bkdSU1lBQ0xGT3BtOXlQTnpK?=
 =?utf-8?B?cjI5WjRucG1jdSt4alA3anF6NVhNSTJLc3hVL0JzTjdTdlNaSnJTMEFBUXRS?=
 =?utf-8?B?MWZURllmdGJMZHgvZjNsQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <280AE6F54D5F9245B7AF2257757E6D14@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c1a70b3-59f5-45d4-700a-08d9823612dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 04:11:40.4612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 2SKPILbWBh02ZNl1ckzaDx+2cLjTU01dnNCrnTr3lR6JI5hLGjdtXBFhl6brebq5VTo0znWiVub2C+mOmKItdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3622
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 04:11:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156406

T24gTW9uLCAyMDIxLTA5LTI3IGF0IDExOjI2IC0wNzAwLCBTYWtpYiBTYWphbCB3cm90ZToNCj4g
V2lsbCB0aGlzIGZpeCBiZSBjaGVycnktcGlja2VkIGZvciB0aGUgaGFyZGtub3R0IGJyYW5jaD8g
SSBzZW50IGENCj4gYmFja3BvcnQgZm9yIHRoZSBoYXJka25vdHQgYnJhbmNoIGJ1dCBpdCBkb2Vz
bid0IHNlZW0gbGlrZSBpdCB3YXMNCj4gbWVyZ2VkLiBNYXliZSBiZWNhdXNlIHRoZSBtZXNzYWdl
IFsxXSB3YXMgZW1wdHk/IA0KPiBbMV0NCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNTQ4NjM/cD0lMkMlMkMlMkMyMCUyQzAlMkMw
JTJDMCUzQSUzQWNyZWF0ZWQlMkMwJTJDQ1ZFLTIwMjEtMzY4MiUyQzIwJTJDMiUyQzAlMkM4NDk0
MDAzNw0KDQpJIHNvbWVob3cgbWlzc2VkIHRoaXMuIENhbiB5b3UgcGxlYXNlIHJlYmFzZSB0aGlz
IGFuZCBzZW5kIGl0IGFnYWluPyBJDQp3aWxsIGluY2x1ZGUgaXQgaW4gbXkgcXVldWUuDQoNClRo
YW5rcywNCg0KQW51ag0K

