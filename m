Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFABEB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 07:48:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.3499.1693986526715356090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 00:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TT4N29nA;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693986526; x=1725522526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m0ne7D1t8Vv/rhy65hXaa+dAlAPyIRRGDsu4Uek3Xw0=;
  b=TT4N29nA+b/VODx++acvxK6YvbMtDk+ERk7nXYyv2qn8fN7UBO9h3LoD
   9GTSGCEwnloElkg7srwpF6PFsYD5HOZ9andQFycqi+BWQUpnpt7Ou4TuN
   ZgSOiNb5j8as2576T7U3VOrCnIicRMw9em4/2s07byXpH1zxG15ZTETOv
   8W5Xgfpo9g8gAveJnUyp3zmC3+J9s5OWqfql2f9Y44LsGMGt0HPyXkAnv
   +VNP9zmHoy36YEjGhPfKrI5MF/nhGG3cOZSt8QWVtrN1JGdw41wUBJ7cc
   U00QPL1utLFD7gGJrPUyaimlOG85cQRraQsdP6phPsJXyG0c1PQtdAMaE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="362025697"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="362025697"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 00:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="691210704"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="691210704"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Sep 2023 00:48:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 00:48:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 00:48:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 00:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcBDVxtclAO+J7SCgeAv6uFfjg9D46n+PAWUvqUXUlkbDjL+OePcrAQjPeOkEluU3C29A+z3w3bXigNplbW255cWsyydkYjPfYY1FWTK2rHsmREw33H4w/QY6MnFRU2ZPT1gVqZWQ4uohUalTiCy6n+lwY19H5SGzFKBFMHNXLQMs9usy6VzuRdrOsngfwMfeNlZYeERxRcp3fZc1rn17NiCFNzjIbDS4sJrBXucz5WQNK4WkciJOiWqJ6F9dffaPdVOcSij9+vf6DkZJKTCGPRq6gtIBvDoE9fcfxwrMtH6IO4PepEDXuTJmAqxg/9IC5AUBzDtgTg2WN6dgPwQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0ne7D1t8Vv/rhy65hXaa+dAlAPyIRRGDsu4Uek3Xw0=;
 b=Koc0ELTZmMA63OQ81TGa8PSOrufP16nzP4yzS7hJFuLi3F2TYOqTehqWvFuUaDIX55xffJ664U/aFj/MMvegKdlYRxHeoM01Cqv4k95FNIB1iPh1NiaHy7qACnGNu2BOuxfj9GguyY9HHjGaj9sabg4Q+Wl7tW51qeG2cOXkM8GPEV9lvP3ZrtHzPTKpnRFiay8IdxJWf07d1SeGslnyWO6EQiWqVErYI6whdauFwivqwM22PXNTu8asAPD7CSXJ7CzAUDKFyIkTmcK5KLrcQXBn2XfdofnPknj3l8QJrAcqsye+4VnRkT7bNHq6wQqktINfKTMn4iBiQ/g7mElGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 07:48:15 +0000
Received: from CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::2245:151d:2cf4:c5f9]) by CH3PR11MB8093.namprd11.prod.outlook.com
 ([fe80::2245:151d:2cf4:c5f9%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 07:48:15 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "Deepthi.Hemraj@windriver.com" <Deepthi.Hemraj@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>,
	"Umesh.Kalappa@windriver.com" <Umesh.Kalappa@windriver.com>,
	"Naveen.Gowda@windriver.com" <Naveen.Gowda@windriver.com>,
	"Shivaprasad.Moodalappa@windriver.com"
	<Shivaprasad.Moodalappa@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2022-47008
Thread-Topic: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2022-47008
Thread-Index: AQHZ4JS/EFYqydkWrk2qyEJmDgsNF7ANaqpQ
Date: Wed, 6 Sep 2023 07:48:15 +0000
Message-ID: <CH3PR11MB8093D7EE35C56F96C8EBBE6CB9EFA@CH3PR11MB8093.namprd11.prod.outlook.com>
References: <20230906073202.480705-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20230906073202.480705-1-Deepthi.Hemraj@windriver.com>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8093:EE_|CY8PR11MB6865:EE_
x-ms-office365-filtering-correlation-id: b53987ae-e42f-4a8a-f36f-08dbaeada0c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CHHVwwqm9WZ/o+QFYR1Xw6iSDgz0l/49+jGdQ03K8f/wXbVR4LNqolNmk89gMxsFCJpUEe/yJ0C0pF0HKDj8968/jRs4D2Ch50tUHcV5Ni/ojt2JSFy6dN/Qhox6MtodvcNW7Y0kLV9+bo4J5L3OPcNuBzA4ZKl4dMcKPLj6HO1VLCIVVLTXExX4hmeJHVUpG8IFkMdo5OtM/MBUU9rtxcm5uICRO6kwzgTmPgPjx7lAW+BuzIRPxTBSCi8gGS7Yy8q2ZdFthu7AwZQlgcLbA/ewH5U5a3Lkor4v2YiN53SSRkp/CdKWXKmh/QCSm+vJqwUyf/mgTH9/EUmC73EVeoSd5j4Ov+Hfl9Oxb4iQaOq41Fuf1GkH/Ez6Ol2to7jrgUwvijLSyD94ILfQzkzXaG578JryXnFmO8vLC94HfanisBxQ3CxG6AOgN7TPaAqJjSmbmvWGKH4wyGoIIwx5lIjNchEbcR6gOWV+KHW7EjV160HbmPlU+iVfL+lLijYH9gfJ0PEbcWshcrZpAX3+LB+iIk7ScX7bqyjbCNVv3TrZHRBhs7u5YSww1dEVG6lw7Z5yjsRaBkmht7EmSFXeLIrC2mUNvs4n1Jm1bzsCgrdE3hXLlA1X4l0mN2fH3VuU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8093.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199024)(186009)(1800799009)(83380400001)(26005)(33656002)(71200400001)(52536014)(5660300002)(9686003)(4326008)(53546011)(86362001)(6506007)(8936002)(8676002)(7696005)(41300700001)(76116006)(55016003)(82960400001)(478600001)(110136005)(64756008)(66446008)(66556008)(54906003)(66476007)(316002)(38070700005)(2906002)(66946007)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1hsVUx0ZVZqTzEyRXdnR25TU2RFampwWDBVT3RKd2QydEdMc2ZMdnl5MS9Y?=
 =?utf-8?B?VlFMY3pkMjE5MzVJeVJkMnJFUnpyclZBWi9IQU45a3drVkp0aTY4aTBKa1FH?=
 =?utf-8?B?ckFNaW5kMGFqTGtLQVdZVnM3YkduM1lsU1FXbkI4TVZZNEIrcTdjZ1R2NkJG?=
 =?utf-8?B?UzYyZC9FaXcxOU9nVFZ3YnZoaWFzUE1XSDMrdllKbXJseVhvYWtJM2N3blBT?=
 =?utf-8?B?dTZRMlhSWmZlR2tqeTh0bmtpdXhMRXNKVDI3K2NOS0M4K0ttL3BZYU5JZlRT?=
 =?utf-8?B?ZHlpdDNMYzF2K1E2SFM5NTlJMTNHN3N0Wjk0RHNmWkZYT1VEVU1tcWEzbzIz?=
 =?utf-8?B?VmNya3RmYkUvZnJZcmp0TlBURTVHbmRJK0xsNlVsQmVVRE9EdXJjSHJ1RzNo?=
 =?utf-8?B?dHlLL2VYdExIZTVIZW5qcUIxcDk4cGtSYXRjcXNScTRlaUlVRUNZNUs3Y3NH?=
 =?utf-8?B?S3huc2trZ1NzUTNYSitJaUFvM090czZqYlJQUmh1azBhN3h6d0g5elhVMVBx?=
 =?utf-8?B?dlRQTnE3U3VqQ3M3VFcwdUtrOWNSdmxmZG5BZUVEN1pYdFBPWGZuYk8yVmxE?=
 =?utf-8?B?WjZHTWZVRzMxSjV6NmFOVHhOZkQwbzNobk92TkRPWE9tdmZxelc0VTNlTzZx?=
 =?utf-8?B?YlVKY2pNczNGSDJGMlFVOFRxT3A2RzI4Z09WTWx3djlzVnBpQnNJYkZ5Smt1?=
 =?utf-8?B?YW1RQlphcG5UcVZXd01xZFFQbUhEYm96QWk1R2twWUlVSU5KVmJjSDV1S2J1?=
 =?utf-8?B?UnhwdWdFbjVYSit1a3VJK0llc2REWnpVd09ydkRxdkwzcURzVUJjK1Z1SW1k?=
 =?utf-8?B?WU9WUU5YL2JUVTZOUzVzSEhkdkg3SDk5aFFFSm5MMTJiSHF3WkJCK3kxTVlV?=
 =?utf-8?B?ZHMvb0pmZWlDYnBtR2lMdnphRHFqRjdRdTBQNTc1ZG1KWE1tbEhpd2NtNk91?=
 =?utf-8?B?emlnUFR4OS9CV1NyTThMc3V4eTJnZkg3ZXd5dElaRGNJeTUwOC9NMHdGdU54?=
 =?utf-8?B?N0dzR1pkVkE5djd2T3VXby9BQ0hZbytrVTZya09KaW5POU9wd2xvcmNqakxC?=
 =?utf-8?B?R0pRQUpQakRqL1hwQUNiOGs5Y0htME9nQTVUVnFZekEwVTRKZzVBRzNuTU43?=
 =?utf-8?B?WUdpT3l2Njh5Q2RWTWloUHdUeXVCK2xxRzJJV21FOTh6bTViNDVxNU1xalcr?=
 =?utf-8?B?MGV0N3ZwNnpyUzFSeDRFWTd2SDZaNXNwc0I4aUcwckNqOGdML0RwbzcxSk93?=
 =?utf-8?B?ZEhYY0c5THhoZzBBOStNSDd2eXNuVHJrekNJaGpicTlFTktUUEs1L3hhVDIy?=
 =?utf-8?B?NitCTFJWek1iaTdCbGUxYXBWOWJNZEc2d2luMDFuMnhrRGZqN1FhT2twM3Zw?=
 =?utf-8?B?cmJqbXRucUlwbWYzc2lUOENRcUl2TFpWRmIrTml6cXprYzR3N1VrUjMyTWlU?=
 =?utf-8?B?TnRyQS9DYjh0RG9aMTNxWDdaR0FXa3VsVDRxZUdFRmk0K3hneGplWExQWDRB?=
 =?utf-8?B?bllFbS9RYmc3TlpDb21ZUTZzNVNHYk4zZ2F4T2RWN2o1TlJiT0d1S0pUenVM?=
 =?utf-8?B?MWgyVjdTRWg2eXBHUTV4ZWRxZ1B5bEY1R0ovVVB2WjZ0aG5YejdWU3FNbFBE?=
 =?utf-8?B?T3JGVFRUaStXbHg5bUVIRU50cHI3Z1Fldm5rTVMvNytEQjBOcG5hdUlEUHkr?=
 =?utf-8?B?em0xb25mRUdZQ3h1dVo1ZlZlRHFsSG5EU0FKWDl0NjMwVzlPN3FRbVZGOTVo?=
 =?utf-8?B?SkFrRHJIdm5vTU9raDNKZ1AzVUdaTTdpaFhqTVRWYjBSL1A4UHBrai95T2Vl?=
 =?utf-8?B?SUJVVWppbE5RT3hMcnhSb3hVMkNXSUo4L3dSWGFJYm1hYkdiaUlqUHRZNUxv?=
 =?utf-8?B?dTRmZWYvUE5ULzVLK01xeWZrQytqbTA5UWZyVlBYVkNBak9KcklEN2t5ODBo?=
 =?utf-8?B?aDk1NkFERENYbGp1N09HMmk0d2lZTjZyRnIwZFBZSTRQbys0SklZd1JoZ0M0?=
 =?utf-8?B?cVNRbkhXVFNrY2ptTEl5UUp5Vjk1ZEhYTmpvR2lHT3g5Y1FYelJpL3dtQUcv?=
 =?utf-8?B?SDJ3OFZYeWRqc1oxTmxCSXJoQy9wZ3BQSGt2MkVERERVWWh4S2did3liL0Jv?=
 =?utf-8?Q?5xBIecqrzKxNJtXtyD6otVzK9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53987ae-e42f-4a8a-f36f-08dbaeada0c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 07:48:15.2758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gv6RzMhgbPZKufhrXrJSgCxYIf/SNYWy6ZALKamjDkouDG0W2kxc6jnlhZB9m3Dh7/Dx2PXtBfuVMOBU1MnS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 07:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187282

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgSGVtcmFqLCBEZWVwdGhpIHZpYQ0KPiBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDYsIDIwMjMgMzoz
MiBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBD
YzogUmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tOyBVbWVzaC5LYWxhcHBhQHdpbmRyaXZlci5j
b207DQo+IE5hdmVlbi5Hb3dkYUB3aW5kcml2ZXIuY29tOyBTaGl2YXByYXNhZC5Nb29kYWxhcHBh
QHdpbmRyaXZlci5jb207DQo+IFN1bmRlZXAuS29ra29uZGFAd2luZHJpdmVyLmNvbQ0KPiBTdWJq
ZWN0OiBbT0UtY29yZV0gW2tpcmtzdG9uZV1bUEFUQ0hdIGJpbnV0aWxzOiBGaXggQ1ZFLTIwMjIt
NDcwMDgNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERlZXB0aGkgSGVtcmFqIDxEZWVwdGhpLkhlbXJh
akB3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGls
cy9iaW51dGlscy0yLjM4LmluYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2Jp
bnV0aWxzLTIuMzguaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy9iaW51dGlscy9iaW51
dGlscy0yLjM4LmluYw0KPiBpbmRleCA1YzNmZjNkOTNhLi45YmNmN2FkNGY1IDEwMDY0NA0KPiAt
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYmludXRpbHMvYmludXRpbHMtMi4zOC5pbmMNCj4g
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzLTIuMzguaW5jDQo+
IEBAIC01Niw1ICs1Niw2IEBAIFNSQ19VUkkgPSAiXA0KPiAgICAgICBmaWxlOi8vMDAyMy1DVkUt
MjAyMy0yNTU4NS5wYXRjaCBcDQo+ICAgICAgIGZpbGU6Ly8wMDI2LUNWRS0yMDIzLTE5NzIucGF0
Y2ggXA0KPiAgICAgICBmaWxlOi8vMDAyNS1DVkUtMjAyMy0yNTU4OC5wYXRjaCBcDQo+ICsgICAg
IGZpbGU6Ly8wMDI3LUNWRS0yMDIyLTQ3MDA4LnBhdGNoIFxbXSANCg0KbWlzc2luZyBwYXRjaCBm
aWxlID8NCg0KQ2hlZSBZYW5nDQoNCg0K

