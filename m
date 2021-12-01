Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D82C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:37:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.88559.1638344264530505853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=mFy2y2n1;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236633923"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236633923"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="540720341"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga001.jf.intel.com with ESMTP; 30 Nov 2021 23:37:43 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 23:37:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 30 Nov 2021 23:37:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 30 Nov 2021 23:37:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxXY/akjLdWA9XpQqPLMLOovPAC8PvbuL0iTillLGp6GwImDOisJ5LlTMmbeOLiDhUxMWkw2MihXLAFggvFbDIhj9pUDvDuGxVOu9QvQW/hv7KhaVLizyx/Q2e03p3OaYEa4vkl4P1VBM+WqIGVTnOrMoKzTeQslP/Axm0pIOrDVHnPiqXq7TgLeEW1zfh1xaerNJDWaH6L8FW8NaUNWYaTWd1IS05odnrsRsoutr4w1ooYsuaXld3Hovbdh8rT9yEL/Ua+RukQHYvuJvxuq8x+ULi8rth7CJbWKBr0Hd7oMF2fcGR8NQFamug+pKhpfTvSfcLIS6lDRJE0vmfcNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wO6uHwGY0j3MS8x67HNNnTSdu+uVvjgiCkox3MYeREU=;
 b=IBAu8mk1M844mmVXgMc/iIAdM/OEwJX9SrM/VcitjoERsjdhFmHLDSDM+I54DxeYsQsboEJTRx9XpqBfTRSBhg6YCIxeXZZQakre2LrGtcuwE1rzUihpzvPydve6QD/fGc6M4uQAIJ0xfyCDIUufqrPVZSlGFU+GJz5Stcdg38MUIW7F1uL5M5YhZfiJgET7skYF19qjFoCF6NER1mjn6RrkLzHkz2S39ZzcSRLNCRPBenphxmEKrr5baT2qVCt9qt1SrYzURCveWoYdlTmw715o+x6KpDXdhNDT9fOoecHTX0BC5xM87WYxjgNtDBM34zjsTRPMVwMda/FacoYS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wO6uHwGY0j3MS8x67HNNnTSdu+uVvjgiCkox3MYeREU=;
 b=mFy2y2n1AzKwO5KNMw9Hvhwmc9BHBePR0Xg3utDTA8j4jJXDOitsWLAv/kIUgCfOK/zFVLLwXbSPbrpMW8WwQyQo1J/ncnVINwMhJuHysHmmDXS6VyldmqXjmfkF7D9LrvxhqNF1z00OxcrMq0Udo1dtnw/0yVV78tbhBOaREbc=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM4PR11MB5551.namprd11.prod.outlook.com (13.101.57.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Wed, 1 Dec 2021 07:37:42 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::7484:1a58:7360:5dc8]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::7484:1a58:7360:5dc8%3]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:37:41 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.4.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4.1.rc1)
Thread-Index: AQHX5h1q1sKGeY/kJUCylQgdbWdc2awdP6Dg
Date: Wed, 1 Dec 2021 07:37:41 +0000
Message-ID: 
 <DM5PR1101MB2348F5488131C39A4F51590FBB689@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <55af67fe8a78b8e76a4610819dc83263e00c18cb.camel@linuxfoundation.org>
In-Reply-To: 
 <55af67fe8a78b8e76a4610819dc83263e00c18cb.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d45844a0-bfcb-4dfd-3767-08d9b49d7544
x-ms-traffictypediagnostic: DM4PR11MB5551:
x-microsoft-antispam-prvs: 
 <DM4PR11MB5551E07CA33BCCCB0DCB2AC1BB689@DM4PR11MB5551.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9B6+/ibhCqO40vzEMdaVLHnB3f4K2NuyXPcb5bj0bgmReep3YU8k3gCWEPNPM5+rVzNnZ5jvKCZ55DaYbKEgIuOzc0O5ErqNbCfFX7i3FgfaTevvnic/MpUlQja/ddO05g8UuZQ43mgtxpKc4D7KcsA7cDu+JIwg/7rO7QMlm0r9Lf5Es5QLdACKV84fb8XpmzK7liiIPdz99Goopfd31eZ0WVuKP0S5ffvZJAFjOaqipN5Dko4eat5saF/vH6C6SlpKOuVDF3flD5LF9puplYdPTXHzzr4GdDw0i+gEXcnubevj25vUt2TQZfCzh8SAGepY/3W+/+6pMxbr+qhEmJG/++76wrnSkJe6mEJGv6+UK8iId3jTBknErxeJ7BiFKsiy7gjaJywikClZ1oxgvilVVqyvwBqw0TwQtLq9e1Q0FwW7DXDCS7SspXTMEqQ17wa6ek3da8h+BxJT59Eu9cSYmbDGsXRwvtJPhzm0O3LPZIjDA9+mr5SlJX1wgH/P1ZcGD02PTQsWju58m6xPl/d19x9Htc5+tqjntyFKA+8X4qSZx6/sqqO/uSzqRQoXs8589QwN0dk06eWAa81u/825ApGQ35OhL9lac3XZmzmhQ+KV+S0RsWx7mLT9WeszcrbtoRefspVn8JyOtyPQoa1Q1UHjApgjZ5sayoxmZRu9heFxtFRlGQLV7DfFD/h5vLtd/hGOWX8evw2++AtMouodkM68koO4yom269eQ9VhwyUa3yTWNHkce5YIb3hRMzEf4lrJ09RICsYHLB0Pih2X+Yw4CUGKcH5cRAtt3OwKoeX6k66smnm176xQSt6r1LKRXK4gZI68NKjfO8DkIciwpUq/JWyMquOkZ1nfDXvI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(122000001)(38100700002)(52536014)(316002)(8936002)(66446008)(966005)(8676002)(5660300002)(38070700005)(86362001)(508600001)(7696005)(33656002)(9686003)(2906002)(83380400001)(66946007)(26005)(15650500001)(6506007)(66556008)(64756008)(66476007)(76116006)(82960400001)(110136005)(186003)(55016003)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QitxaXAyajF6anE4SEdzRkpYckxoRDRnU0UxY3QzZXNLeGRuODF3Z3VaclFQ?=
 =?utf-8?B?Q2lnTGxHQVRWOU9nWVEyeS9BU052aExRZklMS09hb3pQb1pKUnZaZVVha3Vy?=
 =?utf-8?B?MkF3NVBqWDFuU0F5SllLNVFLMmRHdllYVWJCKy9id0RGYkl3cjBqbFdQTUxH?=
 =?utf-8?B?VVhSVklMQXFkNDJ5ZHZzZ1dyQS9Jd3doQWppM1pIWjljME1Va2UvVXAzamdj?=
 =?utf-8?B?Nk9WaEt6eldGQWE3MDhTVXpjaCtENExTZWRZVXpOZzRvOThmbWVXbXNIU01N?=
 =?utf-8?B?S0ZmZC9hdCtnQzRuZ1hyT3FrNHVaNjhQNnNZV0RjNUpYWDlUZGtJQW85cGda?=
 =?utf-8?B?QzMrZXdKQ3c1UXVnVk9iWkpaNDhnRnkvYXhCVGtkRy9XVEMzYjJkdTI4Vmhq?=
 =?utf-8?B?NGNBVGR5OEsrV3VnVk5hYWRob3I5bDJxcTRlZXFCV3ViVWo1OWVDUlBWSmpT?=
 =?utf-8?B?NjEyV2RFYXAwSUQxa2NNSlNoWkNINUNQakdabEdrd3JzVXJ0R09CeS9PSkRw?=
 =?utf-8?B?b21Pa1JEd2l6cjkwZVdxN3RLbnBMSjVBNjV1V0hlTG0zUVMreEVKOUl3S0RU?=
 =?utf-8?B?bXlZRFRBcWN1cmV0cnhYNUtEZGdndXg2eGZFUVdpQlNFSzVuWWpRcGJwRXcz?=
 =?utf-8?B?SzdGYVYveG5Qak1SSWNIcDN5MGpVR1lJdzVUbjBzd0wyT0Nvam9jUmF3U21M?=
 =?utf-8?B?TmR3M1VPOEpqMTFWaVhVRU1YVHpER0FWVzdyUnpUOXpObFJrVFk5dEhOUThy?=
 =?utf-8?B?SmIwWGp4aCthM1h5cjJGeGhTd0NIcTZzVC96M21kYTBOdWhjSEdnUURoVlNP?=
 =?utf-8?B?ZkFYUFV1bkVHU0hBV2UvbjJVT3lJaWViYjR1Y2c0NWZMVEgydlk1N2srTk0y?=
 =?utf-8?B?TFl3T3hmRDJaRGpOTVRDT0NhZkwrUU85bVFOd3hMYlRsbmRpVVJjWXZHTmN5?=
 =?utf-8?B?ZTRGWWlSNElmUzUxSWpZUEhhTzRtUEpoam1Hdmh6djdaanhxOS9JU3p6ZXBh?=
 =?utf-8?B?TXVhc3dHUHl5OGQ0K2JmR2xJa28zSUNubm13VFl5Sml4VVY1WDhDakc3K1NQ?=
 =?utf-8?B?TXFhbE5IK05URVpoUll3aTN3Qkdjdnd0RE1NbnYxNEFPa0tDc3pHMkhuNk55?=
 =?utf-8?B?ckVMUkhzRTR3QzVzcW1ZMTFlMXRSRjBoV2Z2YStoUkRwN0VXWm8vOTlrQTJG?=
 =?utf-8?B?Z1ZMZVVId2k5b09PbVRUSG5ackRhQ2lRaUhIb1RZelR1RFpSMllCTTl0c2Vi?=
 =?utf-8?B?RzZGb09FZkwvM0FaSGl6bFpyL09IeFZLR1ZaaGxLVDN5Wmh4QWFhMXgzdXhH?=
 =?utf-8?B?Uk9NTVlmVUpoaEltNTAxM09hNzU0R0pGOUtZK3lGVGYvcHBFck1RWER5Qkt5?=
 =?utf-8?B?aHF3d0xWT0UwQk9JVmRvQjlBOGhnWDcxK0hVOEt3NWFNRFhWWnZqTktQelB2?=
 =?utf-8?B?RVV1YTYyUzAwaXU5NkhPbGtTSklLWUk3S0s0cW5UcGlUbDlMOG96bG9TRnBu?=
 =?utf-8?B?OG9Vbm5OQjhScVlIZGFJckRDL01KRlFSQmZOeklqd056ZTlXVnRKVDdyTGdI?=
 =?utf-8?B?L1pEUXQ4NHpiNTVlK05CcVhKUkRTQXdSQnQ1RW9OSitDL05UWU9VRnJ5UXR3?=
 =?utf-8?B?MENHYWdPaGZIVGNiNXZzZnBCSDcrYjdkdjZVRnNvZlNkWDBuWDFDNGpDYlFU?=
 =?utf-8?B?K1QvaTd5QmM4dnRvVGhKWkt4NUVBQTh0TEJES0MzK3ZGV3VaeUNDR3hiZUgr?=
 =?utf-8?B?UnZsQmt5RThES3ZTUGQxUXdBZ2lqUTE4Q3huSTZZcS9GMjdQc3h1T3lWSkRl?=
 =?utf-8?B?NUVZTjBNLyt5VEtIS1liNlp4NVRCc1ZZTzFyMnVpWWZ5V1NXT1BTVGhaSVVD?=
 =?utf-8?B?c1dTYjU3dWluVVpRVGVSTGNTMEJrM3VOc1c1di9oWStYdmlMdVhPSzYzMGg1?=
 =?utf-8?B?WkNSYW1FRURXV3dObXhzWDJMT2xqeXA2QlFsSFZSSW5oeHZwbWpGVmZ6THcz?=
 =?utf-8?B?MGJpaTk3RU9pVnIrdVp2UFJKL20yMDJDOE5MNGRJSzRuTTJNaHFwazNidzRZ?=
 =?utf-8?B?WmRMcVVWL2R4QS8rd3FickdVOUdLbGE2aTFVRy9tTEZ5ZmxrSytLRWZKaFEy?=
 =?utf-8?B?VC9wdzB3SGJDMExHckU1VitBNldZbythRUIwMnBDK1hNMC9vbkg2NS9iY2dq?=
 =?utf-8?Q?V5HNjVnyOM/Vx6VFP1uxg2A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d45844a0-bfcb-4dfd-3767-08d9b49d7544
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 07:37:41.7656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 iEzf7hKCEY2G9WSufphi9ylIh8Qf6DAFFi9t3tYoFevFae6UIPAeEJm/FDwhD2BTwB+O4NEK3CkUB6Jt7wyfjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5551
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159018

SGkgZXZlcnlvbmUsDQoNCkludGVsIGFuZCBXUiBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhl
Y3V0aW9uIGZvciBZUCBidWlsZCB5b2N0by0zLjQuMS5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBl
eGVjdXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCg0KT0VRQS1tYW51YWwgdGVz
dHMgZm9yIGZvbGxvd2luZyBtb2R1bGU6DQoxLiBPRS1Db3JlDQoyLiBCU1AtaHcNCg0KUnVudGlt
ZSBhdXRvIHRlc3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQoxLiBNaW5ub3dUdXJib3QgMzIt
Yml0DQoyLiBDb2ZmZWUgTGFrZQ0KMy4gTlVDIDcNCjQuIE5VQyA2DQo1LiBFZGdlcm91dGVyDQo2
LiBCZWFnbGVib25lDQoNCkVUQSBmb3IgY29tcGxldGlvbiBuZXh0IE1vbmRheSwgRGVjIDYuDQoN
ClRoYW5rcywNCkpheQ0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBxYS1i
dWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtDQo+bm90
aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1
cmRpZQ0KPlNlbnQ6IFdlZG5lc2RheSwgMSBEZWNlbWJlciwgMjAyMSAzOjA2IEFNDQo+VG86IDx5
b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zz4NCj5DYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4NCj5TdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBR
QSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZA0KPih5b2N0by0z
LjQuMS5yYzEpDQo+DQo+QSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tMy40LjEucmMxKSB3
YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlciBhbmQgaXMNCj5hdmFpbGFibGUgYXQ6DQo+
DQo+DQo+ICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3Rv
LTMuNC4xLnJjMQ0KPg0KPg0KPkJ1aWxkIGhhc2ggaW5mb3JtYXRpb246DQo+DQo+Yml0YmFrZTog
NDRhODNiMzczZTFmYzM0YzkzY2Q0YTZjNmNmOGI3M2IyMzBjMTUyMA0KPm1ldGEtYWdsOiA4M2M1
NzY0YTM4OTAyYzZkMTdmMTA2ZWE1NDU1MzMxOTJlYmQ0NmZlDQo+bWV0YS1hcm06IDU1YWUwZWIx
YTZjMjEwZTZlODdmNWE1NTNhMWViYmI3ZGNjN2E3MjUNCj5tZXRhLWF3czogYzkyMzQ0OTM4YWI0
ZDM3ZGU4YmQ4Yjc5OTE4NmRiYmUzMDE5YTA2OQ0KPm1ldGEtZ3BsdjI6IGYwNGU0MzY5YmY5ZGQz
Mzg1MTY1MjgxYjlmYTJlZDEwNDNiMGU0MDANCj5tZXRhLWludGVsOiBkMGYxYzFlYmZkOWI3ZmU4
ZDIyYzZhNjIyMDhmNzhiY2NjNmYzYmY2DQo+bWV0YS1taW5ndzogZjVkNzYxY2JkNWM5NTdlNDQw
NWM1ZDQwYjBjMjM2ZDI2M2M5MTZhOA0KPm1ldGEtb3BlbmVtYmVkZGVkOiBmMzFiOTg1NGIxM2U0
NmNiNzQ1Njk1MzhhMzNjMzY3MzBjMDBjNjk1DQo+b2Vjb3JlOiA3MDM4NGRkOTU4YzU3ZDFkYTky
NGE2NmNmZmEzNWY4MGViNjBkNGIwDQo+cG9reTogYjUzMjMwYzA4ZDlmMDJlY2FmMzViNGYwYjcw
NTEyYWJiZjEwYWUxMQ0KPg0KPg0KPg0KPlRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJv
bSB0aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPkdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+RW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmcNCj4NCj4NCj4NCj4NCj4NCj4tPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PkxpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPlZp
ZXcvUmVwbHkgT25saW5lICgjNzcpOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9x
YS1idWlsZC0NCj5ub3RpZmljYXRpb24vbWVzc2FnZS83Nw0KPk11dGUgVGhpcyBUb3BpYzogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210Lzg3NDEwMjYzLzQ4OTk0NjMNCj5Hcm91cCBP
d25lcjogcWEtYnVpbGQtbm90aWZpY2F0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcN
Cj5VbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQt
DQo+bm90aWZpY2F0aW9uL2xlYXZlLzEwNDA2ODA1LzQ4OTk0NjMvNzE1Mzg5OTk1L3h5enp5DQo+
W2pheS5zaGVuLnRlb2hAaW50ZWwuY29tXQ0KPi09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+DQoN
Cg==

