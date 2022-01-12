Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B5CC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 02:17:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.18047.1641953850974128193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 18:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=m7E6iNDo;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641953851; x=1673489851;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gU+RNvg+GFtk5rAy+ZcI7ngixHFGZJAIPBj9SsZmTWw=;
  b=m7E6iNDoeRysDucfZ4xCIn8kyvZ+1M0jcui6+bG2r7dTWWtsuKVQUech
   qGsoQRHTT3JB1DEmYMD6IB+GdTmcScgXiBJdKM9aO5HUyTsGz1vt9sU7z
   jrik3WEiEb2+xxpNaXpCOra7Bx7irBQI21zZG4h6Gy6aMh0Lafo9VN0RC
   4fks51ttNTzkSHUCLwRwT5EgdnvT6BQuf5w3J3chkZK97LIIi68sXfY6e
   DzQw4wGiCXfSBpPCY04/TRiCMHF3ztxLJq0xeHpHNMm3KWeb6EYIPPc1F
   hvSnaIwet3iaQ8vphVH352VnAmlJr72jorrmoHTuKbhDln19hBixKlTzS
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="223624161"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600";
   d="scan'208";a="223624161"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 18:17:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600";
   d="scan'208";a="613418420"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2022 18:17:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 18:17:29 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 11 Jan 2022 18:17:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 11 Jan 2022 18:17:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 11 Jan 2022 18:17:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYhtYutSTp3sfs8ydauc2k03QCmS+KIPL2fi9ljWV479u/B2TSEemoqi9Ms+2m/OdsnXZqB6WX2Sv7dwsTQpMILC4H/YmvGvLDbu+EL6ewE+ddqM0hj4q/Mu598ZjHAsFlBeZ2f5q3RZ1mNKwrkCliww7Ka+H70tqazGaeCtFrYxwPrf+a9lb1oawn3EyMdkD9Lx9WbAGy9lua/8wBNCFAfqZm9W1KHZ070ATTGST+L5kVPB5QMjpG4MSn9k5IZvGMTO7Exbycj35CS9+gUmpxE3cTVrgVa6aW4H36wUT2/KTd+moLYlVt3ftEaD3l+H/K8iyWJT0jsaBwQPwdnNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gU+RNvg+GFtk5rAy+ZcI7ngixHFGZJAIPBj9SsZmTWw=;
 b=TgSRANz0GH3M2b/+htJu2C5QyMHf87lltK7eH/ig6KMnAhlv8LnjQoNQ0HTAEcJ2/wQaf/lPWaXO3I08Zi5P5uErQXTplvXawOZjBMaE/GbbhQaInrh1SOHEXJQeIYtnP9bvZzV16yWw2ohKkMXY3cm8n6sJfTCmMRhyXNgpgrbgeuG3bI0rYyWueFOefTCjc3zlCmXEPk+CELbOz9dVo2yHxATXAvWimNfg5/Asa8r4K8931vPAJZujzNUV/vLhwyAPcPCZ1yMNA/eP62QgYXbt/KRnaMC5CrcWp52Y5mptHVJJmppkGnuEXiL3B7sAwdfnU2P0mDaHGOWPgHuzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2534.namprd11.prod.outlook.com (2603:10b6:a02:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 02:17:27 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::a8ab:1ed:c383:c477%7]) with mapi id 15.20.4867.011; Wed, 12 Jan 2022
 02:17:27 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "chuckwolber@gmail.com" <chuckwolber@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [hardknott][PATCH 9/9] python3-pyelftools: fix the
 override syntax
Thread-Topic: [OE-core] [hardknott][PATCH 9/9] python3-pyelftools: fix the
 override syntax
Thread-Index: AQHYBvfh2w6QPf+QAkGzXZaYuYe8n6xd9iKAgACxAwA=
Date: Wed, 12 Jan 2022 02:17:27 +0000
Message-ID: <46bedfb5032723e8a852d0e6e075ebdba4ceaba7.camel@intel.com>
References: <cover.1641911316.git.anuj.mittal@intel.com>
	 <7e569186820163d731cbb14f8c25ce6a2cc45dc9.1641911316.git.anuj.mittal@intel.com>
	 <CAB=6tBT+drKV-5k=9WLx9HHhZux6Siv72ZxirGmiV6EeJzkYpw@mail.gmail.com>
In-Reply-To: 
 <CAB=6tBT+drKV-5k=9WLx9HHhZux6Siv72ZxirGmiV6EeJzkYpw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.2 (3.42.2-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6c3ed40-d428-41a2-0dc0-08d9d571adee
x-ms-traffictypediagnostic: BYAPR11MB2534:EE_
x-microsoft-antispam-prvs: 
 <BYAPR11MB253413F390923C10F5ACB486F8529@BYAPR11MB2534.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5ffGewNFd4qJya1TDu4N7fmES1NjcrIt9GTpXtAY4wup5rH9XvUZ0lxSEng1aj6iKrWvAjovsg7wzbRrIa7qnTen4XXaUtwuscoHjd0b4Zafx9WRfd/3jTYxPHJPAeI1Ac9W0z/FlXHCp91efDZxa5EqrzBzbXywNlhieRD0srjIq8ezv7L3A/IQg/p1L5+cstE5CA/OlkyDVUd4okpzrsO6x+OtGhEMAC5KiD702ZcOi97bE1mkk2w7K8i6kyvVleEeYrpSVBymIAFq5C8rBgYSAyUIjHTPbVoty5MrdgQfDr+yrIQD/7zDrOSxfmYMmzX7lWGaoEb8uo5wd2I1IYkJ55no36+CjW+5MkuE8YeYJLXr73LbHdlzrWJxMoOPyjMUothXDO70QuYSWel4MV5kA3xf/mEcNrTF2VvTh1lUJ4dV2VuezMhzbbp6o2pw/h0BuW6k1Dma4p04ACJd4SrumNHNROgsxauNfpsFJTt9gpfdTlkaQ/fZugDMtm+ZTTovNL4ZHaIK9uCKuk7/z4RWlEOZ0fwAwGQsRr2XmSa5C0V8hpiDXfKRYAH9dM9hkIDE10TuOqEaNxpQTTZIft258tfTXGuX6KLiSgssDXubLDYYaCYveVC++obKUV82Ad+Na6icN46gXzJHnTUTGojd1U8E/8b+6cgKJL3HhYL9C00t/nKluwUUq5kliZ5Xu6c0KNu+5YkY7/9aZweo3A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(8676002)(8936002)(6486002)(66446008)(53546011)(6506007)(6512007)(82960400001)(76116006)(6916009)(508600001)(2616005)(83380400001)(122000001)(4744005)(38100700002)(5660300002)(2906002)(26005)(66476007)(38070700005)(36756003)(186003)(316002)(4326008)(66556008)(66946007)(86362001)(64756008)(91956017);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aU5TZkw0SEg4TGd2RlovZXdNYUd4ekNHYWMvdWFQam04Q0tibGlyRk9CNVYx?=
 =?utf-8?B?eHp2M0VERlFnVkNWb0tkTVR2TWhxYXFQTkY1bW5FMVhadFRISW5kdmo5UkdD?=
 =?utf-8?B?SFR3Zlp3YStFckxEQmwyWSt3TURWU1JWUWhuZWNRaWxRSGViTkkzNkUxSXNk?=
 =?utf-8?B?SUozTnZVTmRPdHQrd3k1NnE2akhYSXVkU2l1MENsa1NBREw3MnliOVZjaVgz?=
 =?utf-8?B?aXQ4cXVGdWZHSDFZbVRjeTRHR0ZmTzdua20yU215cTJxcnhuUlJTSVovYjUw?=
 =?utf-8?B?dURUbFlTVXI2T1VJaWlhYjJqMzd4SHFNcnN2c1l1RzQ0OGxDTXkxTEEvZWpr?=
 =?utf-8?B?eW02anFjQnNFaldBRVRxaE52cU1icHdKN3IrV1Q3SmVsR3FRQkYvK3ZxakYr?=
 =?utf-8?B?RFZXQ3lTMmVKYmdRZVVsbUx5UnBLR012TlhDOXJLQlpycWdVUFVhQW9tVWxw?=
 =?utf-8?B?N0tieW5zWjhtSW1ZdUUwR3ExWUxDTUtuNlhqRVMyNWNPSFM2WERRTkVPb0c5?=
 =?utf-8?B?OG5zK3dVbkhsOUg4OHhpczg1MThyaTYwNWxuVjdxOE56eVBwQnJqRVpwVVFX?=
 =?utf-8?B?TFZCRm9sM0JJemRoa283S3Y0UGdLT0Iyc1JiTkNLd0pBSkVUL2YyK24rY1E0?=
 =?utf-8?B?bFdrUzNweVd3RlNuMzR1VDJPKytuQVpNYXNYaEowK0hiVTdjK0hGTFd3dlph?=
 =?utf-8?B?ZkxaL09jZG1IaTB2dWQwRkVaclYrclVjVnBpNjE3RTFRb0pZL01aM2FzanZz?=
 =?utf-8?B?RHVsT1p5OG5VQnRLQXJwd0xaU2huanQxK3RqN0I2bzNMVVJtWjhjdUJjcVdt?=
 =?utf-8?B?QklQcWhSK2xXR29adTcvUFdiZ2ExTkpnMEh2WGJVcXYxekgwWnRZS0JKVU91?=
 =?utf-8?B?ZStWaGxMdUpsKzdpOXVZdDNiMDVhcjk4WnAvYzNSL2xHTWxTNENxc0ZIYXkz?=
 =?utf-8?B?MHM5YjA4UTBDUnpLdE41SGFRTFNBalJQbU1KSUtaQmhVZGNWeEFzQ3ZDdzJv?=
 =?utf-8?B?bkZ6QWhEY3M0c2Jxdld2a2NTRXpyeEQyWWhTS2NXblFrRUpBL1dFS1dvU1Uz?=
 =?utf-8?B?eU5KaW9IaTN4OGI3VE96d2lkRUhyY3dxL215cytxYXNFOC9nVmhJYmtLZ0Jr?=
 =?utf-8?B?RTlvcW91RmxjR29IaVZoQURCRmxSK3B3RmY4a2F0aW1nT25qd01JYUZ2R2JR?=
 =?utf-8?B?cHF0YzhZNFZybWViWmxPbTd3NEo3dU1XSW1wWDlJc043aHBGcjdUM0trcENS?=
 =?utf-8?B?RE9JcU5NZEVDcXgxQlRIREpvdi9pTEhjVEs2QjRPZzJuNEZaTzRLejdpSEs5?=
 =?utf-8?B?QmN6Sk9WT2oxTzBCN2xBajNLOHpFalpsVjNZU0NPTVRURmJzRUdGWUdUTHRP?=
 =?utf-8?B?MXZRNFRZVlpDOGhSQm9rVWFzaTVMWnY1ZnBpbnhvRE5DRC8ya0ZKZmVYdllV?=
 =?utf-8?B?RmJxQmNPR3NIdWVKeGdoMmRieEw0RmZyVnpUVHNCY3I4WnBsQkhucllvT0gx?=
 =?utf-8?B?VWQwTllocHNCS0ZNQVJtdkJNRmJpdjZmcmduMHZMSHdMb1U1T0xYOUZCZDUw?=
 =?utf-8?B?c3Q3OGFGd2JadWUxemxGQ0Jackp0KzdXTDBlZTN3dzZwK1VWODlCMkJObmxI?=
 =?utf-8?B?N2ZESWVDaW9aS1FvZnZrMGkzSytZaGhaV2taZzhRNUJsWW1qbDdJVzFiQThP?=
 =?utf-8?B?ZzRhRmJVdkt1cDROTXdEYlJTZll4UnBlbWdzWGdrZitwRmxFTzFkNTRiWDFw?=
 =?utf-8?B?MnpnRk5ONXRUZVVUVGFEYzlNSDNDL0tyYi9JLy9QL2JsNlNGSC81cTc4blF0?=
 =?utf-8?B?VTZJVHRIVXN1MmlkZkRuYWl1dnc2VGE5QVJLV0swdU5lYnp4azg5MWJCak5O?=
 =?utf-8?B?UmFibzFrTVM2SnBYVGJmTnpWQWtReGNDN2lDeEVST29sZnZtMHBlcG9vTTNI?=
 =?utf-8?B?ZDU4MTJDREc2NGJrZHJSL0JrOWhac2RETVBIK1c3Zm4zZFZMcW9PdjNRbDRV?=
 =?utf-8?B?bU5WRzNKNXFCRG1JaHF5d1ZXb1o1dEVYL3NPNm5kcmlBcHpmYTB4WURoY0Y4?=
 =?utf-8?B?N2NBVXp3MWkyNkJKQUhIajJQb0txUU9TSXhSME9QcWk0bFZaaGsyb3R4c21D?=
 =?utf-8?B?U2pPYjlvODIzOXViR0RudS84UnUvcWJzMHAraHJkVUU5VFM3ejNwc3ZMRTZD?=
 =?utf-8?Q?rVIywI4xcswDw6YxTP1Rns9TqISp6/MAr/1rfgmjXsV0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C843F5A093A83E49B9329C0B54640E15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a6c3ed40-d428-41a2-0dc0-08d9d571adee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 02:17:27.4310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 EIm4o8qLXKz5YeIXsg+KB3WdDDrVsjI/S6aeRYD6jvY7sfMNScFdO5JBWRqc8Wa6Hx1Ms0QeR2YU4EFA6iQ07A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2534
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 02:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160476

T24gVHVlLCAyMDIyLTAxLTExIGF0IDA3OjQzIC0wODAwLCBDaHVjayBXb2xiZXIgd3JvdGU6DQo+
IE9uIFR1ZSwgSmFuIDExLCAyMDIyIGF0IDA2OjMzIEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBp
bnRlbC5jb20+DQo+IHdyb3RlOg0KPiA+IEFuIGVhcmxpZXIgcGF0Y2ggY2hlcnJ5LXBpY2tlZCBm
cm9tIG1hc3RlciB1c2VkIDogZm9yIG92ZXJyaWRlLg0KPiA+IENoYW5nZQ0KPiA+IGl0IHRvIHVz
ZSBfIGZvciBoYXJka25vdHQuDQo+ID4gDQo+IA0KPiANCj4gSSBoYXZlIGJlZW4gdXNpbmcgdGhl
IOKAnDrigJ0gZm9yIG92ZXJyaWRlIGluIEhhcmRrbm90dCBmb3Igc29tZSB0aW1lDQo+IG5vdy4g
V2h5IGlzIHRoaXMgYmVpbmcgcmV2ZXJ0ZWQ/DQo+IA0KDQpZb3UgY2FuIHVzZSBib3RoIGlmIHlv
dSBoYXZlIGJpdGJha2UgdXBkYXRlZCB0byB1c2UgbGF0ZXN0DQpoYXJka25vdHQvMS41MC4gSGFy
ZGtub3R0IHVzZWQgXyBhdCB0aGUgdGltZSBvZiByZWxlYXNlIGFuZCB1c2luZyA6DQp3b3VsZCBn
aXZlIGFuIGVycm9yIHdoZW4gdXNpbmcgYW4gb2xkZXIgYml0YmFrZSBvbiBoYXJka25vdHQgdGhh
dA0KZGlkbid0IHJlY29nbml6ZSA6Lg0KDQpUaGFua3MsDQoNCkFudWoNCg0K

