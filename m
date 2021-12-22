Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B28C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:36:36 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.14579.1640140595146308912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VwPBFvY2;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640140595; x=1671676595;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=cSHKm4NEvS5/hCKUfsJEFRZ21W7Fi4Yb/3skjNsyPjY=;
  b=VwPBFvY226p+ZRNHnayXfuYBX4aHUdKf0QeIBcyXKzhdXSYSQM+Q1BAO
   DnL2jYsGgz/EbcM55lgI2biprcNeCQDAcfUsh+VvbhiHLu1693hXfQF4X
   mAbhgbpyMcXm/IrhPTMVKiOc17x+n3VWrhVMy06DVXqOzrcrqIXddK5K5
   /YlSe9D11tmuh4F/ZNbYc3nIZ14+fsTYAEpQMCwoAXCty4iVreGq8SlaK
   gGBkSb1LJzHsRErqug2thextKzS+HeVXAcBlvzxMNpZJrWD9kaGwZ1f6x
   K7ckNMFig/Iif9A8mjp+C72jH4zWGjhk5p0CaZcPum/PvLpGrzXgN2yND
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="303900970"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600";
   d="scan'208";a="303900970"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 18:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600";
   d="scan'208";a="484610828"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga002.jf.intel.com with ESMTP; 21 Dec 2021 18:36:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 18:36:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 18:36:34 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 18:36:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeimXiZBQBD58ypDHLeNLoZfiPnnmnCFQl8EG7KOPpVNr7ThOnhR1eLShQfBFmYu+yv0gn7fVgXyCDQbZbcgQJA0PIo9tGDOUeJjaAGE3Q8txQILR9qouKoOo6k5U1dsWWTLRpZXQAMGgG2DXgrY8Fuf6Eupr24iKDf945Dc1Jq+hMp5jKVNyW5VwmNLVSjJmOPYwT1o7j9wU1PSyOuCHmB4eMV2n/AzR9c/3KxvGBc+eBKxTOpw2JNsHEf451pia7w+vV0qec44/mIidgwIL9Gr7E/78eQm2P/jCIYZCWdqLFb3p3a4jTxUvc69KYfA9xfJxVrTepqLATyr54z0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSHKm4NEvS5/hCKUfsJEFRZ21W7Fi4Yb/3skjNsyPjY=;
 b=W3+IhznUBm0YZ8dY+Pcsy2ldCzPtNp/Fk/QtG2SsMbSWyqYhYrkpaTcT/MGb3bu/gE5vJBvPOwAz24o7pFIfq9F31WJaMq+GNmFQ8KzGcVGd2uP3gFABvYTvdCHkZxDNeAJIO+ZOmAB3aI2QqYL2FBxrNnWPgm08TpWhUHUJS64jSbVNPpT2AJLMRzEBrDdYg9iD9laOQLISbPySH/LNhcyXuRBG0RUW6LCmXVqzqH45HFVV3q8Mg0IFzWxa8pGkG9Sw6A14534PlhBADI6NgqyrGWczeDGCJsAraUU/6j4Cs2gaYc7F9spOJp4rzYxZCy5lo0XmPZg8XMtghCaAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2630.namprd11.prod.outlook.com (2603:10b6:a02:c2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 22 Dec
 2021 02:36:32 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%5]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 02:36:32 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][hardknott][PATCH 1/3] busybox: Fix for CVE-2021-42374
Thread-Topic: [OE-core][hardknott][PATCH 1/3] busybox: Fix for CVE-2021-42374
Thread-Index: AQHX9tlIKBA9APJ3M0iPVnDLJvK26Kw9y8KA
Date: Wed, 22 Dec 2021 02:36:31 +0000
Message-ID: <50395e355ce40923537e2db7a157dd1448b60c7f.camel@intel.com>
References: <20211222021125.55893-1-Qi.Chen@windriver.com>
In-Reply-To: <20211222021125.55893-1-Qi.Chen@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a44e8edf-1734-41ba-751f-08d9c4f3ddbc
x-ms-traffictypediagnostic: BYAPR11MB2630:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB2630426922AFD828A14094C5F87D9@BYAPR11MB2630.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yeDD2hKyZOXfUk4napjDmcS3bkeQbfczK9CGQtBgv3se+Goov0XKZpscUOxQVSuLEPpFJ5rHz3dDxDkEWbgsNvoS9v4O5SovC6xWIiE2y1VvtGdsNIpoCweazW64R8o49+AQs+hWrVdJXdTR6KNokeZeLyvzQ8jHEE9kOs6ssGmH6j7XCoQSWYdWPNtp7t7uaHNFfdFjusGplDgzwMb/zrHsvHyhxgV2JQC6e0UehszrzwYsj3Joa1XT74G2mkrwivGGOTJp4eAyxqXxFSmdavQzu4DjRg/AmW0gTIIoeaytIWqVevlTqF+RYPEdg4nWnwl/ehjCh3WH9aBVjjxFNLOGtcyFwQT/MVvV3QKE4jA41GvgMqJwrXDQEE7/I50sIfCXIwME2yBCaVFUYKp2kl57wLiCuAYLZ5WgKK1KicwnVRPnovYRe9X7zyd7ANlNt3zHWVcPmh1MzAWwgu/UmrhWRUkMW0iMG6WrljUkZnJoM2HxJqYH0M0e4LVin/NluvUy9HQdMrOYl4smCbYOLtvbkEDx6WjJf6qIx5ILe86eMEnM3FJcieRQZeYzN3N6IHXBJg/t7cynYecyncMrqY/NDA0lsXr5iwFho33N7NWDUxY28pyrx/mK9JHtPwUPUiXRJ/ay7ykzfrQ2bo+MUhvY+qGweXZBrB2zJY5ou7KEAR0BpoJ0M9iE86kfAYHCtBmMUer6bfimnFaH996kM4XaERiTBJCNixsAmJ5lTr+vvcAaYUOjwwMjaoQzbINP0sg163mW1AN70dAHFJeQJYSL4qDCAu2Ug5iH5+u3bGLF5HwuHiSptTE4W9kyRc25zOjietNe79kk2U4izzt1IA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(76116006)(2906002)(4001150100001)(86362001)(83380400001)(38070700005)(8936002)(36756003)(508600001)(38100700002)(966005)(8676002)(26005)(6506007)(5660300002)(71200400001)(66476007)(66556008)(6486002)(82960400001)(64756008)(6512007)(110136005)(316002)(91956017)(186003)(122000001)(2616005)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFQrNGluYkc5YlJCejRreVFVVVVWbEJCZGl4bUVIbFFxRUFWNzBIUXQzWWNt?=
 =?utf-8?B?VEJOSnlNTkJpclpKZzFQamJXNE83OWM4SmNyMGNRRUxkZXVHWFZzSWthQTZ0?=
 =?utf-8?B?V3p1MmxtQ0t4cEFMNWl6d2F0aVgvOU5qYWtvNlBNRncrNjVwL0ovYmtDbzRH?=
 =?utf-8?B?RWkzSXdmU3NuWWdER1lsbXh1dDA0ZlF3WlNoKzU2VEcvalBOY3YvRG9kRWs1?=
 =?utf-8?B?WXlqeG1NS1hyaktUV2EyMlN4TXVCa1pBRzBYK2o2MThEeWcrUjkwNXpvVDMr?=
 =?utf-8?B?V2hSamdyQlJmNkUvb0pZWCtBSlYrRVprd0ZqT0lQbml5S0gzKzhIdE1hdnhk?=
 =?utf-8?B?d2UyZXlOSDlkK1lmd1VYc2VUWjFROTcwSFMwOXNjRGlsUk1neVRIcjl5WkhW?=
 =?utf-8?B?ZjVvNUh1SEtORTJHQXVzT2k2eHFhVTVsT242TU1DYjBOajBEU3BuQkl3WllM?=
 =?utf-8?B?aGZXNEhXcWpQMURmMnJlbzFPVmJDYk1yVmw2YVJ0Slk5T2E1eUhTMHhYZVlP?=
 =?utf-8?B?bzZmd3BIdkRiQ2d5UjMzbXd0N1oyZUZyV2UyNXpuYU05WlZsbXo3SERzelkr?=
 =?utf-8?B?cjhRcTN1cHFhZHJpSGhFaXJqWmluQTBIa0JiUXdIQkgxTmVZTXN1MVFTMXJs?=
 =?utf-8?B?WFRVWWhPRngxalI5a09vZzhKQlhldmZ0TFV3VmxUZEptR1VmMURDQStSaHor?=
 =?utf-8?B?c21LM0Ixd2hiUENSRFJrb1ZnZnZBc1pFdnRpZU4yT2xvREtQbDFzbUtGTEtr?=
 =?utf-8?B?aG5wWW50aFM5N01GNkdlREFOL25rN0RnTmF2NmIxK0hrd2NEVGlVN3JoamtK?=
 =?utf-8?B?aFZXcFZPdWVWUWF0TzFPMmxrMG1JZkE1MVZ2cGg3ZjkwNEhqN3Z4d21qYjI4?=
 =?utf-8?B?aFM5SFdjQys0eHJUMUNTZXZFcnh0bHQwRHQ1K21MNExGTlZRa1hKU3VQNHhD?=
 =?utf-8?B?Y0xjYXVSRHpMR25OMVFiTW5XSU9nL25KQ0VsRXhoSkRJcHcxN2RaSFMvZ0g5?=
 =?utf-8?B?TkFoUi9qMXFmQ3lIeG85UHRoTllPd3BTQ21od3Rib3UyNE9rdzE4cDBIekI1?=
 =?utf-8?B?Q1lQZ09qc2p5ODhsTzNUV3ZuKzFiaXlKc3psamxhcGlDd0JhUDhKZnc2ZlNi?=
 =?utf-8?B?YW5XQ1Bjc3MzbFZzMEN6OFc4bU9YYUpVRlBTbmhoQ3pjaDdjNWVEa25CZ2FZ?=
 =?utf-8?B?ZGg2aHBrM1lqS1dNYmRYSklFNzQyZkhENmJpRHRXKzZBUEhaYzlOQWg1dUc0?=
 =?utf-8?B?cThxTVB3OS95RmlHaHVWV3IxZnNENG9ZMG1Xd0dUaUNncjBFTE5CNUd5WkxI?=
 =?utf-8?B?cTA3TkVUbDhYWWRTcUFNOU9kY0Jxc2xUeDFLOEJ3UFBxV1NjVUx2WHFtSllD?=
 =?utf-8?B?TXJZaXg5c0tVMjNTZjNxZ3B5MnVzYmJqWDYrUmJzYm42dU1lRUljZ3FtOERV?=
 =?utf-8?B?WDRwemtIOGx5TnN4b2pvcU5KWjgrV3dTMmlJY1ZBTHVvMitZaW9YRzQxMURT?=
 =?utf-8?B?cDdoTmVjK0Q5ZDRVa3ZSb1lFWVZlTzk0RlVkb3ViVW90Z3ZiODFYVHFwM2J2?=
 =?utf-8?B?cDlBbUo1bURuYjdPdzBuM3Y1eTBqTUkrdFdOWkpENzF4V3VVVU12ZmdBL3hC?=
 =?utf-8?B?RkNYL21sYzFJSXoxRFpDUk14d00zWE9aWXVnS3lFQjFTWUkrMVdlRmxLclRq?=
 =?utf-8?B?VWxDb3ZIbWFGMVIvbkQ5S21HMTNPbVRKSzFEdHhBYzNJS01QMDhlQTlMQ1lW?=
 =?utf-8?B?VjR2QWFnSldTdjk1S0pFVEZXbHl6WmFTNDBQUnZmRXZRRmljeXhzZi9oSit4?=
 =?utf-8?B?TnZLemUrTTlqd1hlV09zcTN1WTBtYUtxYnliWVBCY0hJT1pyU1RQd3M2Umkz?=
 =?utf-8?B?Mm8rY1RPSkhURmVMVWhiN1gvVlhoQlBWV2hQcTNVdjk2RVpNQUptQU5yelNt?=
 =?utf-8?B?UDk0ekhCemxHdG1sYldzZjN1Q2xLVlZhczZ2Z2hQblBsWXpqVHpCUXZrZUJt?=
 =?utf-8?B?TUFBVVJsZ1NuS241TG90b2NtWnZNN1ZTcG00NXd4elJ2Y2JRc2wwbE5EbUdM?=
 =?utf-8?B?M010cStkbXQzMHBRODlFeEZwclloV0xYVEo1dzlMOTExODlBNWEwSUErU0Nl?=
 =?utf-8?B?VUdzNCs4VldmOGhmV0ZrUU5HVmtPV3RaTlV1Z2J3Wk94TGdDRlprMGh6TXVC?=
 =?utf-8?Q?Cn5bit+QxkUTPBjrNWrWUu9X1IVC8hOAnYZKIZgkkeqh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D02C934245F60489F8D466BB8CC9CD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a44e8edf-1734-41ba-751f-08d9c4f3ddbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 02:36:31.9900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 idLzSH9BKqCQFlQTJDftw8ZlTAhKPHbaOSfVt43IhO1lwLzEGk0CSrftLPDXQgDnd1H+Uw4L2LBnIvNoO1d2Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2630
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 02:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159938

SSB0aGluayB3ZSBjYW4ganVzdCB1cGdyYWRlIHRvIDEuMzMuMiB0aGF0IGhhcyBhbGwgb2YgdGhl
c2UgZXhjZXB0IHRoZQphd2sgY2hhbmdlcy4KCmh0dHBzOi8vZ2l0LmJ1c3lib3gubmV0L2J1c3li
b3gvbG9nLz9oPTFfMzNfc3RhYmxlCgpJIGhhZCBzZW50IGEgcGF0Y2ggZm9yIHRoZSB1cGdyYWRl
LgoKaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS1jb250cmli
L2xvZy8/aD1zdGFibGUvaGFyZGtub3R0LW5leHQKCkNhbiB5b3UgcGxlYXNlIHJlYmFzZSBvbiB0
b3Agb2YgdGhhdD8KClRoYW5rcywKCkFudWoKCk9uIFR1ZSwgMjAyMS0xMi0yMSBhdCAxODoxMSAt
MDgwMCwgQ2hlbiBRaSB3cm90ZToKPiBGcm9tOiBQYXZlbCBaaHVrb3YgPHBhdmVsLnpodWtvdkBo
dWF3ZWkuY29tPgo+IAo+IEFuIG91dC1vZi1ib3VuZHMgaGVhcCByZWFkIGluIHVubHptYSBsZWFk
cyB0byBpbmZvcm1hdGlvbiBsZWFrIGFuZAo+IGRlbmlhbCBvZiBzZXJ2aWNlIHdoZW4gY3JhZnRl
ZCBMWk1BLWNvbXByZXNzZWQgaW5wdXQgaXMgZGVjb21wcmVzc2VkLgo+IFRoaXMgY2FuIGJlIHRy
aWdnZXJlZCBieSBhbnkgYXBwbGV0L2Zvcm1hdCB0aGF0IGludGVybmFsbHkgc3VwcG9ydHMKPiBM
Wk1BIGNvbXByZXNzaW9uLgo+IAo+IFJlZmVyZW5jZToKPiBodHRwczovL3dlYi5udmQubmlzdC5n
b3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjEtNDIzNzQKPiAKPiAoRnJvbSBPRS1D
b3JlIHJldjogMjk3NzE5OTg5ZWJlOGNlN2Q1MGUzOTkxY2JhM2UyNjg5Mzg2OTBjZSkKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQYXZlbCBaaHVrb3YgPHBhdmVsLnpodWtvdkBodWF3ZWkuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
Pgo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KPiAtLS0K
PiDCoC4uLi9idXN5Ym94L2J1c3lib3gvQ1ZFLTIwMjEtNDIzNzQucGF0Y2jCoMKgwqDCoMKgIHwg
NTMKPiArKysrKysrKysrKysrKysrKysrCj4gwqBtZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1
c3lib3hfMS4zMy4xLmJiwqDCoCB8wqAgMSArCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDU0IGluc2Vy
dGlvbnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94
L2J1c3lib3gvQ1ZFLTIwMjEtCj4gNDIzNzQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94L0NWRS0yMDIxLTQyMzc0LnBhdGNoCj4gYi9tZXRh
L3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gvQ1ZFLTIwMjEtNDIzNzQucGF0Y2gKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmFlZjhhM2RiODUKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94L0NWRS0yMDIx
LTQyMzc0LnBhdGNoCj4gQEAgLTAsMCArMSw1MyBAQAo+ICtGcm9tIDA0ZjA1MmM1NmRlZDVhYjZh
OTA0ZTNhMjY0YTczZGMwNDEyYjJlNzggTW9uIFNlcCAxNyAwMDowMDowMAo+IDIwMDEKPiArRnJv
bTogRGVueXMgVmxhc2Vua28gPHZkYS5saW51eEBnb29nbGVtYWlsLmNvbT4KPiArRGF0ZTogVHVl
LCAxNSBKdW4gMjAyMSAxNTowNzo1NyArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIHVubHptYTog
Zml4IGEgY2FzZSB3aGVyZSB3ZSBjb3VsZCByZWFkIGJlZm9yZQo+IGJlZ2lubmluZyBvZgo+ICsg
YnVmZmVyCj4gK0NjOiBwYXZlbEB6aHVrb2ZmLm5ldAo+ICsKPiArVGVzdGNhc2U6Cj4gKwo+ICvC
oCAyMSAwMSAwMSAwMCAwMCAwMCAwMCAwMCBlNyAwMSAwMSAwMSBlZiAwMCBkZiBiNgo+ICvCoCAw
MCAxNyAwMiAxMCAxMSAwZiBmZiAwMCAxNiAwMCAwMAo+ICsKPiArVW5mb3J0dW5hdGVseSwgdGhl
IGJ1ZyBpcyBub3QgcmVsaWFibHkgY2F1c2luZyBhIHNlZ2ZhdWx0LAo+ICt0aGUgYmVoYXZpb3Ig
ZGVwZW5kcyBvbiB3aGF0J3MgaW4gbWVtb3J5IGJlZm9yZSB0aGUgYnVmZmVyLgo+ICsKPiArZnVu
Y3Rpb27CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9sZMKgwqDCoMKgIG5ld8KgwqAK
PiBkZWx0YQo+ICt1bnBhY2tfbHptYV9zdHJlYW3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMjc2MsKgwqDCoAo+IDI3NjjC
oMKgwqDCoMKgICs2Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBEZW55cyBWbGFzZW5rbyA8dmRhLmxp
bnV4QGdvb2dsZW1haWwuY29tPgo+ICsKPiArU2lnbmVkLW9mZi1ieTogUGF2ZWwgWmh1a292IDxw
YXZlbC56aHVrb3ZAaHVhd2VpLmNvbT4KPiArCj4gK0NWRTogQ1ZFLTIwMjEtNDIzNzQKPiArVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydAo+IFtodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idXN5Ym94
L2NvbW1pdC8/aD0xXzMzX3N0YWJsZSZpZD1kMzI2YmUyODUwZQo+IGEyYmQ3OGZlMmMyMmQ2YzQ1
YzNiODYxZDgyOTM3XQo+ICtDb21tZW50OiB0ZXN0ZGF0YSBkcm9wcGVkIGJlY2F1c2Ugb2YgYmlu
YXJ5IGZvcm1hdAo+ICsKPiArLS0tCj4gKyBhcmNoaXZhbC9saWJhcmNoaXZlL2RlY29tcHJlc3Nf
dW5sem1hLmMgfMKgwqAgNSArKysrLQo+ICsgdGVzdHN1aXRlL3VubHptYS50ZXN0c8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDE3ICsrKysrKysrKysrKystLS0tCj4gKyB0
ZXN0c3VpdGUvdW5sem1hX2lzc3VlXzMubHptYcKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgQmluIDAg
LT4gMjcgYnl0ZXMKPiArIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiArIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0c3VpdGUvdW5sem1hX2lzc3VlXzMu
bHptYQo+ICsKPiArZGlmZiAtLWdpdCBhL2FyY2hpdmFsL2xpYmFyY2hpdmUvZGVjb21wcmVzc191
bmx6bWEuYwo+IGIvYXJjaGl2YWwvbGliYXJjaGl2ZS9kZWNvbXByZXNzX3VubHptYS5jCj4gK2lu
ZGV4Cj4gMDc0NGYyMzFhMWQ2NGQ5MjY3NmIwY2FkYTIzNDJmODhmM2IzOWIzMS4uZmI1YWFjOGZl
OWVhMGM1M2UwYzJkN2E3Y2JkCj4gMDVhNzUzZTM5YmM5ZCAxMDA2NDQKPiArLS0tIGEvYXJjaGl2
YWwvbGliYXJjaGl2ZS9kZWNvbXByZXNzX3VubHptYS5jCj4gKysrKyBiL2FyY2hpdmFsL2xpYmFy
Y2hpdmUvZGVjb21wcmVzc191bmx6bWEuYwo+ICtAQCAtMjkwLDggKzI5MCwxMSBAQCB1bnBhY2tf
bHptYV9zdHJlYW0odHJhbnNmb3JtZXJfc3RhdGVfdCAqeHN0YXRlKQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90
IHBvczsKPiArIAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHBvcyA9IGJ1ZmZlcl9wb3MgLSByZXAwOwo+ICstwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKChp
bnQzMl90KXBvcyA8IDApCj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoKGludDMyX3QpcG9zIDwgMCkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBwb3MgKz0gaGVhZGVyLmRpY3Rfc2l6ZTsKPiArK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAoKGludDMyX3QpcG9zIDwgMCkKPiArK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ290byBiYWQ7Cj4gKyvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWF0Y2hfYnl0ZSA9IGJ1ZmZlcltw
b3NdOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGRvIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IGJpdDsKPiArLS0g
Cj4gKzIuMzQuMAo+ICsKPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9i
dXN5Ym94XzEuMzMuMS5iYgo+IGIvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEu
MzMuMS5iYgo+IGluZGV4IDQwMDJkNmE1YzYuLjVmNTc0ZTdmNDkgMTAwNjQ0Cj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEuMzMuMS5iYgo+ICsrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveF8xLjMzLjEuYmIKPiBAQCAtNDgsNiArNDgsNyBAQCBT
UkNfVVJJID0KPiAiaHR0cHM6Ly9idXN5Ym94Lm5ldC9kb3dubG9hZHMvYnVzeWJveC0ke1BWfS50
YXIuYnoyO25hbWU9dGFyYmFsbMKgXAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBmaWxlOi8v
MDAwMS1zeXNjdGwtaWdub3JlLUVJTy1vZi1zdGFibGVfc2VjcmV0LWJlbG93LXByb2Mtc3lzLW5l
LnBhdGNoCj4gwqBcCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IGZpbGU6Ly8wMDAxLWdlbl9i
dWlsZF9maWxlcy1Vc2UtQy1sb2NhbGUtd2hlbi1jYWxsaW5nLXNlZC1vbi1nbG8ucGF0Y2gKPiDC
oFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly8wMDAxLW1rdGVtcC1hZGQtdG1wZGly
LW9wdGlvbi5wYXRjaMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjEt
NDIzNzQucGF0Y2jCoFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIKPiDCoFNSQ19VUklfYXBw
ZW5kX2xpYmMtbXVzbCA9ICIgZmlsZTovL211c2wuY2ZnwqAiCj4gwqAKPiAKPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0
aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgjMTU5OTM0KToKPiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE1OTkzNAo+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzg3ODkwOTk5
LzM2MTY3MDIKPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZwo+IFVuc3Vic2NyaWJlOgo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbCj4gYW51ai5taXR0YWxAaW50ZWwuY29t
XQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCj4gCgo=

