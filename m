Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F42C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 02:31:33 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web08.4607.1637029892064567275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 18:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com
 header.s=selector2-intel-onmicrosoft-com header.b=iEmAwpkn;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="257361683"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="257361683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 18:31:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800";
   d="scan'208";a="535741325"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 15 Nov 2021 18:31:18 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 18:31:17 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Nov 2021 18:31:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 15 Nov 2021 18:31:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 15 Nov 2021 18:31:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chaKsq3lQYxMtu2Onl49KgfBUf3++So058og9Z5XGMDxS/XY/ebHEAPJ4gkuo+3MkhU9XvVxTwvLMe8PLNwxrbyFDhdpNMeZLGZXUyOLkPllrCg6hfv9iZM0wWzwYQiP2XvGBp4gIGcAjxlgNRljNr5gz6H+y0n0xTEq4W7F2w2LqRbj7tEHqCTgZILfh+4BqKPaZsz+Fn+6GGBwUWqsD8JU5PL93ljgJoEDWeVHmwoczN/iiinwohzmgPGVjCFvRwr1PZg1l2FQgtWCeo2RwVSMgtkTnEluxjl7SaIrIWznucYA/vtpUGL5QWZ3NsfsOlb+4U6/rVAbgiJK9KdDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84gcyC3FzeyMYv7YLJwZlSA9dy6x7cJhr4RmOI8jEKM=;
 b=koY3aYQxXq0FHZF3aGPT15ESq0Cj/8oXpD2tV6yKOt1u2AGM0TvJjcPoM4kG/92TqCtipNAfKXiaUg0isoVaq9FXMKIZqExQSyOHaWbVJaKc0G+xfkblYNIsyTUE1R3c/TZW6vqJ1Fujp/ZWSEf12OlEWIHCUkg+SuENj/U2YCpfkZuKnMWX7cJal1hTH7iwD7PO8ZmVP/Tw3U53g8nWQ+5ou9KfdMCuWveN7kfy1tt4H2eYNbRyIv8JRoX0zSWfvTuehT+W9J1hu54S5bB7+sCcgBAFrON2+HnanAprO2ddqdTOZoeQr/pGXVrJymjxRRWBbUKMl3sokQf2BQoWvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84gcyC3FzeyMYv7YLJwZlSA9dy6x7cJhr4RmOI8jEKM=;
 b=iEmAwpknQB+qps2RiyomEtpTVmrzlLJVqdNwcm6VYD9wu2tqciez1ye4rCL41RCXe4Q2ThMeOeNCnSx6pnhh3l0Ed3iUWBDgOM0MboDFrgUfT4gxdrrXo6s/0Y2e+Bj0MBB2MH/RQLvaxFbeOY/+75RYiDWpeGfMo8f8fvuDkWY=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3670.namprd11.prod.outlook.com (2603:10b6:a03:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 02:31:15 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::2c3d:dccb:aa85:53c5%2]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 02:31:15 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pgowda.cve@gmail.com"
	<pgowda.cve@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH
 with TUNE_PKGARCH
Thread-Topic: [OE-core] [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH
 with TUNE_PKGARCH
Thread-Index: AQHX2ipUpeHKpAIubEa9zYWHD0MvcawFb7gA
Date: Tue, 16 Nov 2021 02:31:15 +0000
Message-ID: <fb89e2f93d5bd83bfb745664c83959450721f799.camel@intel.com>
References: <20211115140340.8047-1-pgowda.cve@gmail.com>
In-Reply-To: <20211115140340.8047-1-pgowda.cve@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (3.42.1-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65d8b447-e2d4-401e-8afd-08d9a8a92a1a
x-ms-traffictypediagnostic: BYAPR11MB3670:
x-microsoft-antispam-prvs: 
 <BYAPR11MB3670EDC799E96E5B3AFE3802F8999@BYAPR11MB3670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tzObcAIRbFLqt2OCFxRy+pZIsVNMndoBGKrk2AHxn5A7atDqju6h9ql8eu+6/9ldvdn7KVidfIvJTCR3CRGwL7Hz6/dr/56pcVbIlyB8BhKjyi48pYaYLOdL8u3HXIvXMSnUZeikR3BV7IlLJxEamWemf8BASyn9fHrM9dMgw3x0MlIisjrEKhs4zNlE9MTvci0RIWSFAPw6oijrU6BdphrXfxtuewPyBbtoHi9ogHXvnNqkdbOsL1WjFiU/Miq9C05I0BwlwF96LsCAe38EPyqq1MXOZiA8vv39mKiwGNsahXID+2gItW5SDm8P2yaXut/H23eoBvZwWKWuNSN3sgF1FcPRWSbuYLs8L0pilvSuhO6SffgYNJn/Fn7ENlxEFlDOGAzN14nKP1kc/ZBVD50nvGtF+BhVq0naNkrrl8DJsyPFBcgghT5RjyWhysY9uNrTZlOuheSDKOiDZ39mtHOicpj3AdtaG7zLSkCvKB343H3StYRczjrAQw2zN6IiV4Q1j+P1IP61u3Rwn5lWfBUeAyAw35KEz2kcmQuIhGDlv/3s0PsPe9n1e6r8zPtmJzvAtVFTfKBCpiaeHLIVTBWJCOajmQpEyFIGY8WDGzH94iD6mYkyBIFwJeh4A1JaNG53w8+DCvjf8XXLwiroLQKK+ixBoqlxIjP+Cb6AyDv8s7wjV2MjYca6HKx78akOb6ijLnkVQfuGE4mjvYmJOQKnCrzKiG6xHbSc3qCHPoqwApcYz21wH7QNRfLkqTESIo36uCfshJ4hF1vIuKzQ/z2nVnH8SStbnWfDZj98k13h0SGcFNMm6uMnr7ov8/pFjYiB8bWjXkKybTAC9KOWcQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(110136005)(8936002)(2616005)(38070700005)(186003)(508600001)(38100700002)(82960400001)(6506007)(966005)(26005)(54906003)(316002)(4326008)(5660300002)(122000001)(8676002)(66446008)(64756008)(71200400001)(4001150100001)(83380400001)(66946007)(6486002)(76116006)(86362001)(91956017)(66556008)(66476007)(2906002)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tm5kb09TRS9zR1VKSENsb2tIeXpCWi9XcFNleW02ckdIRkQyZHJCZGd5Zzg1?=
 =?utf-8?B?cEpBV3dobVluUUVTMDczQ1NzaUhEalpSOVJlQkNDdlFJNHFSTkFHUWlhKzEr?=
 =?utf-8?B?S2FMblVTTGg1a0QxRUp4ZElFLzNJc3A0MkZNWld2VzBxOHdlSS8vNmNYR3la?=
 =?utf-8?B?ajF6dHcxQUtOWlNHV2NVV2lxTWNzN1UxekhJTHFERVNCYk9VZ2hMY211eW1Q?=
 =?utf-8?B?QXJRR0pUVVJFWHN2VGRQVGxndWhSWGw5NzU3RXNiM0ducXZJSTAxY3VyeDR2?=
 =?utf-8?B?TkxuZTV6Vm1wcldMSThaZTV3T3dTWHY4QzVpQ3duTVVaSzdpR2NXWStjdFlM?=
 =?utf-8?B?Tm13VmE4cXJsdXZIb1FTa1dJTXpmY2E1eno3ZFVmaHp3NHpvdnc3M0dIa0Fv?=
 =?utf-8?B?NHczZVd3dlRKTzdXQWJUc1ZBNTFRM200Q2NUTk1JQlNvQTVzcVkrcjIxbEhM?=
 =?utf-8?B?bVlLVnFoZEUvT3gvQUtoMGo3eU9Dak1HbzFwazM5USswNWFqQVpRTXRPRmJ5?=
 =?utf-8?B?eXNmL0RHK2xKdFZiYzUxUi9Xa0xsTUdKbTVwMHB0WkczZ2NOSFN5NkxCRWZ0?=
 =?utf-8?B?QWxUbjIrQjJEWkpwNFFEYWlQeTFEZHlmeW1YTnFpclJWcENNV3p0MytaZ0RX?=
 =?utf-8?B?enl1UTlDSzI3WkRud0Z5OS9tY3BiQ3hhS2lMWjA3YWR5YXVub2U5Q1J6eThs?=
 =?utf-8?B?Y3RTQndPNXd6NEdSSkkzSStuTHNjRVdIeXBtSDNLY2pPZTRITTdUSFhZV1Zo?=
 =?utf-8?B?bGFGdDRteENPSSswSmhHWVRDZU5HWUwwUnJvV2Fzd1NrK2FCL2dzRDhMd0xF?=
 =?utf-8?B?cmVTOFJXaDZXRlZwRDAyTzY5ZWVKUkRBZGdBOXUxS0tRR2VXV09DaXpab3po?=
 =?utf-8?B?LzRPeVZHMlNyTERDaG9zODRyVXFLeW5rZzExNXRnemJPRHlyNnc1ODQwV21q?=
 =?utf-8?B?QXU4amd2VUVVcm5YMVltQjRUellvaG5rWCtvZm04bWkxTk4ralY5NjNHV2RB?=
 =?utf-8?B?aGY0dUl6Q2xEQllESExPSGUwNnJJaFA0Qkc3bTdJc0ROcThIWlZNcjg5SFh3?=
 =?utf-8?B?YXJsZm1EQksrckZVZDV5TktBdVZPOXliNHpWeW9KTFowaDlXYnE0WWx6bjZl?=
 =?utf-8?B?Sy9DRWtlNkFoL2NGWkNUTWcvTkFIaktRWlBURGwycU1DUW5jM1Q1eDBlY29l?=
 =?utf-8?B?KzhNK1A2VnJqU0FiUXNsM2ovK1dHdEY5VTRleTdNMTNBNzV0L1o1ODRuL1lX?=
 =?utf-8?B?UDhBb0xYR1J0WDh3aVZjdnRSWDMvODNGeXpoUjFZWlJNRUhIbmRLejJvS0lz?=
 =?utf-8?B?aVNub2U3cy92T0x4UHNDcmtobEdFZGlBeXFITU15SXNoMXFqUnYxNTRtSnoy?=
 =?utf-8?B?U3N2dlFPK0JRdHQyaUx6Nm5YWVE3c3NKMUd5elJhQmJQMXRpbkJrQmpPeEhB?=
 =?utf-8?B?d3Rwc0hFWWtTa29EdG9IMzBiNE4wWmFxS0ZaMW0rekc3VlUxWHZ6UWxWYnRv?=
 =?utf-8?B?NmlET1lyWnUxa1lCOEljSThIVjk1Y29pZ3gyWEJDWlV5THhMZnFWTlZjVlpM?=
 =?utf-8?B?Rkl2d1dHTmhKazVZUkhrbHZMa213MHh4eGJXU3REQ3dNdTlCOUJuN3l6VFBV?=
 =?utf-8?B?ZEJibEFqVGU1eTVGZDdQZFFUQmJ1U0NLQmdzZjMrOTY1dkUya29BeXZYT290?=
 =?utf-8?B?UnZLR2JKaUlvSjAweEUxWStzM1Q1UkV1d096Nnptc0hKT3F1OW4rUisvY2ZI?=
 =?utf-8?B?a1NLZ1FEMnoxZ1RIaEJpR1dqc1l2eEY1UXF2aW9La2I5TnVMZjFveUZwQ1Zr?=
 =?utf-8?B?SndsNGpzbm15ZW00dDlXZ052d1EvWjBwTUlCdEZjVFpFNDhGczhaQmdMZDBy?=
 =?utf-8?B?WFRJVGlTcG1iNkF4djlpc3VERlJDSzN2Mml4SFR2RGxkUlRFL3pOVStxZDN6?=
 =?utf-8?B?bjRsTkhLNTltVndxUkJpTnNockU2dVhrOUlHY3FrZzFiM1c5bXBCdHBtaWZH?=
 =?utf-8?B?UWZNSmUyaTAyS3JFR3V4UU9Oa2t4MVRkOW9YZXZXZFRqY3V0Mms3WXlHdVdn?=
 =?utf-8?B?NHlaNk0zM1lrai9QR0o4THo4a0loWjA3QXVScHRJTkNOMDJJZzJJOXIzK2lM?=
 =?utf-8?B?MnJmc20zUnQvaCtUY0pWcWZTZkt1YUZObGczZ2IrckJ4OFh4bUl1MThyR3kw?=
 =?utf-8?Q?qsAPM4M02h1lXtafjmQOS87yEMImmIpqi6o8uyvOhR7u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2057C2C54143148B3FEF1506DF56094@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65d8b447-e2d4-401e-8afd-08d9a8a92a1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 02:31:15.7713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 E2eoKzDuxhlzD7NmmNbgYzadJU4z4DD8K25hGWcGTp62r9J/HrrRTMLRTF7Qd+zeT3EWUWExuMGc2qdg0ntmMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3670
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 02:31:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158322

VGhpcyBkb2Vzbid0IGxvb2sgaGFyZGtub3R0IHJlbGF0ZWQuIElzIHRoaXMgZm9yIG1hc3Rlcj8N
Cg0KVGhhbmtzLA0KDQpBbnVqDQoNCk9uIE1vbiwgMjAyMS0xMS0xNSBhdCAwNjowMyAtMDgwMCwg
UGdvd2RhIHdyb3RlOg0KPiBydXN0LWNyb3NzLSogaW1wb3J0ZWQgZnJvbSBtZXRhLXJ1c3QgaGFz
IGluY29ycmVjdCBzaWduYXR1cmVzLA0KPiBkZXBlbmRpbmcgb24gTUFDSElORU9WRVJSSURFUyBt
YWtpbmcgaXQgZWZmZWN0aXZlbHkgTUFDSElORV9BUkNIDQo+IGFzIHNob3duIGJ5IHNzdGF0ZS1k
aWZmLW1hY2hpbmVzLnNoOg0KPiANCj4gb3BlbmVtYmVkZGVkLWNvcmUvc2NyaXB0cy9zc3RhdGUt
ZGlmZi1tYWNoaW5lcy5zaCAtLXRtcGRpcj10bXAtZ2xpYmMNCj4gXA0KPiAtLW1hY2hpbmVzPSJx
ZW11YXJtNjQgcWVtdWFybTY0Y29weSIgLS10YXJnZXRzPXJ1c3QtY3Jvc3MtYWFyY2g2NC0NCj4g
Z2xpYmMgXA0KPiAtLWFuYWx5emUNCj4gDQo+IMKgPT09IENvbXBhcmluZyBzaWduYXR1cmVzIGZv
ciB0YXNrIGRvX2NvbmZpZ3VyZS5zaWdkYXRhIGJldHdlZW4NCj4gwqBxZW11YXJtNjQgYW5kIHFl
bXVhcm02NGNvcHkgPT09DQo+IEVSUk9SOiBnY2MtcnVudGltZSBkaWZmZXJlbnQgc2lnbmF0dXJl
IGZvciB0YXNrIGRvX2NvbmZpZ3VyZS5zaWdkYXRhDQo+IGJldHdlZW4gcWVtdWFybTY0IGFuZCBx
ZW11YXJtNjRjb3B5DQo+IE5PVEU6IFN0YXJ0aW5nIGJpdGJha2Ugc2VydmVyLi4uDQo+IEhhc2gg
Zm9yIGRlcGVuZGVudCB0YXNrIGdjYy9nY2MtDQo+IHJ1bnRpbWVfMTEuMi5iYjpkb19wcmVwYXJl
X3JlY2lwZV9zeXNyb290DQo+IGNoYW5nZWQgZnJvbQ0KPiBkYTRlYmYxYjI3MmNiNzMxNTMxNDVh
MGE5NWU2NDM4ZDI5NTVhZTJkMzZmODRkYjEwZjY4ODBiMjc4MWVjMzMxIHRvDQo+IDQ3YTBlYmI3
YTg4YzlmODk2ZmI5ZGJjZTI2OWY1NzVhYjhhNmZhYWJiMmI5ZTYyZDE2NGJlNmU3MWM1ZTRlNDAN
Cj4gVW5hYmxlIHRvIGZpbmQgbWF0Y2hpbmcgc2lnZGF0YSBmb3INCj4gb3BlbmVtYmVkZGVkLWNv
cmUvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtcnVudGltZV8xMS4yLmJiOg0KPiBkb19w
cmVwYXJlX3JlY2lwZV9zeXNyb290IHdpdGggaGFzaGVzDQo+IGRhNGViZjFiMjcyY2I3MzE1MzE0
NWEwYTk1ZTY0MzhkMjk1NWFlMmQzNmY4NGRiMTBmNjg4MGIyNzgxZWMzMzEgb3INCj4gNDdhMGVi
YjdhODhjOWY4OTZmYjlkYmNlMjY5ZjU3NWFiOGE2ZmFhYmIyYjllNjJkMTY0YmU2ZTcxYzVlNGU0
MA0KPiANCj4gVGhlIGZvbGxvd2luZyBwYXRjaCB0YWtlcyBUVU5FX1BLR0FSQ0ggaW50byBjb25z
aWRlcmF0aW9uIGluc3RlYWQNCj4gb2YgVEFSR0VUX0FSQ0ggYW5kIHJlc3VsdHMgaW4gc2lnbmF0
dXJlcyBhcyBleHBlY3RlZC4NCj4gDQo+IFtZT0NUTyAjMTQ2MTNdDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBQZ293ZGEgPHBnb3dkYS5jdmVAZ21haWwuY29tPg0KPiAtLS0NCj4gwqBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVzdC9ydXN0LWNyb3NzLmluYyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LWNyb3NzLmluYw0KPiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3MuaW5jDQo+IGluZGV4IGJiNjI1ZjQyNDAuLmE3N2Y3ZDUx
MjIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3Mu
aW5jDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydXN0L3J1c3QtY3Jvc3MuaW5jDQo+
IEBAIC0zNCw3ICszNCw3IEBAIERFUEVORFMgKz0gInZpcnR1YWwvJHtUQVJHRVRfUFJFRklYfWdj
Yw0KPiB2aXJ0dWFsLyR7VEFSR0VUX1BSRUZJWH1jb21waWxlcmxpYnMgdmlyDQo+IMKgREVQRU5E
UyArPSAicnVzdC1uYXRpdmUiDQo+IMKgDQo+IMKgUFJPVklERVMgPSAidmlydHVhbC8ke1RBUkdF
VF9QUkVGSVh9cnVzdCINCj4gLVBOID0gInJ1c3QtY3Jvc3MtJHtUQVJHRVRfQVJDSH0tJHtUQ0xJ
QkN9Ig0KPiArUE4gPSAicnVzdC1jcm9zcy0ke1RVTkVfUEtHQVJDSH0tJHtUQ0xJQkN9Ig0KPiDC
oA0KPiDCoCMgSW4gdGhlIGNyb3NzIGNvbXBpbGF0aW9uIGNhc2UsIHJ1c3RjIGRvZXNuJ3Qgc2Vl
bSB0byBnZXQgdGhlIHJwYXRoDQo+IHF1aXRlDQo+IMKgIyByaWdodC4gSXQgbWFuYWdlcyB0byBp
bmNsdWRlICcuLi8uLi9saWIvJHtUQVJHRVRfUFJFRklYfScsIGJ1dA0KPiBkb2Vzbid0DQo+IA0K
PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNTgyOTIpOg0K
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzE1ODI5Mg0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC84NzA2OTQ0MS8zNjE2NzAyDQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29y
ZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOg0KPiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWw0KPiBh
bnVqLm1pdHRhbEBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

