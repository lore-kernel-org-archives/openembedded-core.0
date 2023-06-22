Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A445EB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:50:47 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.58])
 by mx.groups.io with SMTP id smtpd.web10.11933.1687441835949605672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 06:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=cN0yIqUp;
 spf=pass (domain: siemens.com, ip: 40.107.13.58, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltknTjUYPd1d3InpzDvLGzOcyi7ZU1aJIaihF3hVnn7n+oV7IlUOcFyPz08PiXwdQ0XMElJLdMe4+vMN5Y1RSRZQNGAmjDdoumZWnBEHCCsTuZCqRwZhQRi2TRWapqgsbI1adkYunfPGQmEtUfwGnixjx6H9tYQRcFAuldItiN4rA5uXe2wkh7B+e0bwmB4RRe/Un8eChPi2RCb7l9PSBiRlDVIFITzJAx7R7/Unf8U0JsYpt8r5GakZOtcxM5zEE4AV/EOFGjiml5ymMoX/tNqJWZ1J+pWBHoRiubEY9NS6dzYfKSFo/V/Ru9Ml+g10Px1wly9QC2rKXhumdKVL2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvHDSiSujmU01xkdgcZU/YOdMp12Xki5XTU2VpvqlsU=;
 b=NDrHnZZuhq/Ns/cXUsByUKIbTGgMxIgk346rcH2YMeEItQxWJySM1GT1yKf6+iMoOx+pjMATwjQ08fcnOfklW6//mbzL7N6mOZFxdzqCRn5CK4iFo4c/03IClrJHS2iivknO+Ev0uzBhgvBIW/5RjU6U7dIGs4LfLAFGoDBViZr2pidqtOzj0rlSAWaqn/m9gfayMBqMAp2RhFm1gKhpHTvVNuRVlqVMVKP8QHTgESkx1y6oEPkaFA4LUzbBOl7aeTGQo7A559DgZs4YTokFfZ8fdK3ex7GE/mDb6WDaWV0teA2R3PkUdwvrqSx755y9IdP5Nn65V5+oJAZ6AJFHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvHDSiSujmU01xkdgcZU/YOdMp12Xki5XTU2VpvqlsU=;
 b=cN0yIqUp5HH/eCysdfiy89Ykt0SOGS23AuCjYbJQfRkI4L4RtsCfda6WJNPexp4k0j8R8CuyNYjTtvJrtTe2YN2SmFXX/elj8tdn704h1NUtc94SzWlggpvTUH9yMCx3o+ubu6foseLfwgzD92n+xNZGb6u/dLkwFSOem115UnWlnJCVCyr08Op3GVo1ltpE5QVnUj9bPI15M9xCAnbLb7uKxMaDH1zMkXAa0tCag16OLl7oT2LPDMRO+pbrmX1VsbOtUj6GOdwIDc+YP0/jsL+jfGeSkJB96XXu49wCqg8UMy5SY0Rlf6AmM/TGGXWLtKK54h9YvQtQ0D+eFJc7Cg==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by PR3PR10MB4016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 13:50:32 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 13:50:32 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
	"andrej.valek=siemens.com@lists.openembedded.org"
	<andrej.valek=siemens.com@lists.openembedded.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v7 0/3] CVE-check handling
Thread-Topic: [OE-core][PATCH v7 0/3] CVE-check handling
Thread-Index: AQHZpNceYyjWrUcjEke23TpXEkG/yK+WxEQAgAATEoA=
Date: Thu, 22 Jun 2023 13:50:32 +0000
Message-ID: <66f1327de2d373002e866e0eb05f0f2e5e6bd05d.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230622065914.37448-1-andrej.valek@siemens.com>
	 <20230622144216.18783d4b@booty>
In-Reply-To: <20230622144216.18783d4b@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|PR3PR10MB4016:EE_
x-ms-office365-filtering-correlation-id: 32cbd2e3-819a-49f9-5b1f-08db7327a5ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TinxVHUSNG4yymNXm7ygUXcGaHgkYBY7UKHEyeIWt8kE8sXlSVK3uhcdZKSJx6r9H0d3PV3k8voip/q3pInMY2F5+L1QMnkczH4bXUfY1CF4q7hDc1K+6gVh0CXYhGH4itpfEEwN6VZEpTINfkKF/HpJ1/HHO9a1K5/Q400macVg8oyO6Gp8cvk2m3YgfSppNl/ZlWCrLSox+EKdj241DQOztB3t6LMA7I2Ws9LEY8cH4gG3nXia9XxhgDEA8D7ShY4tXqw/RjGDuEUs4KMf2eDOmNRkNReN2a+TbJUcwYbNDJbc+nbBM8fCdawm2F8zQy/b/35dd5Er3C4N2Qyr6p+prZLc/znrYeyXlaQYQZ+bW2Bng66ivFe0XjZj1RfKOaJvt5YbcByNaLdJSciyeZ0SvY7+dlhtUVxh9L0pozWJXFfgzB7u9NHe4MIFHDGGtTaCdFe9Pw0uLulMKdB6tL0oIyEeTdCCALaR4yPqevOkYLR+fIZIPSndGxJSlqLbQwYGIPBM5YkOBjrbU5kt9MbU6c3AFKR9caWRP2yTe83lTWflfSxrh6MFjhlnIwPd6CGJoSgXduDhqyM2LdUVOyg2DzBCXcv8JOZEw3UpLTo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199021)(8936002)(41300700001)(8676002)(186003)(6506007)(2906002)(26005)(6512007)(55236004)(38070700005)(110136005)(66556008)(4326008)(86362001)(64756008)(66476007)(316002)(76116006)(91956017)(66946007)(66446008)(6486002)(2616005)(38100700002)(122000001)(71200400001)(82960400001)(478600001)(83380400001)(36756003)(966005)(5660300002)(66899021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bjA3RzJNblVVcnBaTzFycVhoZG51QWFsZlpYazdRc0lWZEZLajVCNzFCK2l0?=
 =?utf-8?B?Z3B4Z0VBb1JSSGhjbFFOU3hIdkt5U2F1ZFZnS0NyUnFIeTJGVTBZeUlFRmZL?=
 =?utf-8?B?T3ZLUEFwNVlDM3N5U1FoaktmUk1SQU1tL2E2K1R6elUxZHgwSGp6ODZ2LzlL?=
 =?utf-8?B?VU4zbko2OTN6TFNGbWViTWFYZnNVaEEvZFFCUXd6blJNaGhKWk1HM1ZqbDM1?=
 =?utf-8?B?MkRBdkRyTHNueUp3cG9PMFpIaHJCNlFWU1V5OCthd2pIc1pmSXM3QTNuUGFn?=
 =?utf-8?B?NzFOZnVIOEhQTTA2WnNHY2lTdjVaa245ODg3eDh5dGJSRUgzS3I2VFlISEFB?=
 =?utf-8?B?aFFNTFFvYnVxeHJ2TUMvMlBTT3dZbnIxeTVtNDlIUk1HTXFIbjU5SCtueTRW?=
 =?utf-8?B?WGRyYU1OcEw4NkJMUE5vVVVhZllSb0NNVVgxWUxNSlAwWk5IMEY5RndObTBE?=
 =?utf-8?B?bE5RNmZoeWJXcVBXbXFuSEp3M0did3ZjZ2dzakgxdXVoQnE1RlBvUUdyenNR?=
 =?utf-8?B?eXBObEhzTll2Y2REU24vS3g2K3NnbCtYRlBYT1M5VHRNd0JKcnpFRjdLc1B1?=
 =?utf-8?B?dTBvbm9EZFZMU3ZwRE1ZQTNsZDFRYjJPeWp4dkp2d2RlYVZsVTJQdGdVeXlJ?=
 =?utf-8?B?bDlVbTREalBYNGw1eUdLaEdwNmZwZ2pma0M5Mks4RCtPcnc0N0hYRUhGbnFw?=
 =?utf-8?B?NFdvVlhGQ25MNDAvdDhvK2I3VWYwOEpwL3IyTDJjK3AzYk80NlBNMUhlTkVl?=
 =?utf-8?B?SHVPNkljNlJrRDVqa0FKL1JSb3c1VzZsYWJPSTJMZkxGT01JcW5uSDlmRk5t?=
 =?utf-8?B?ODRiZHJGMHBVTVlRMmFWUi9LZDV2OFQ1aFQ0OW5BL093ZEZXRm4yUDRrT2V1?=
 =?utf-8?B?RzVuYndPZVBEQ2FjbUU2MElUSTZXVjdGSWxaUE91ZXRyTjFZa2lmV0lGb2Ry?=
 =?utf-8?B?bW1SMUVweWxpWHUxLzV4c3MxTUJ4U3dHQkpyaTZtN21oUWE4UjN6Y05OTXlo?=
 =?utf-8?B?SlhjTHVUYWVkWWZicjRXbjJzU1RlVnZ6U1IvVHV3T2QvQ1IraHZncUlvREsy?=
 =?utf-8?B?K2NzWjB2QStSNVlqMzJBNTdCQVZTYTRpNG1XUHpzMjJicGNGeEVTSUVOeVV1?=
 =?utf-8?B?ajlCZS9Eb0tTdHJneGdNWG9OOEx4Qlk1SHd5elExVThQOGR4cSsrWFYyY2Uw?=
 =?utf-8?B?VzA2d3cycmMrdVNoaTBuaWlUMW9rVVZsaGNWMEYyNnc1aVVaVi9tNVRGUUda?=
 =?utf-8?B?Zkx3d09lbDAwYkxLZm5VYWRDUVUvM2NQTnRIMnVPVXFGMHJTNFdnNy82VVdx?=
 =?utf-8?B?TUk5OEVyWk5mbWNLL2pRc2k3dXRYSWFjaTBORWxQeHY4WWt1MGFoYlJObzdr?=
 =?utf-8?B?MWVtS3NKQW9mcjRpM2JodUpTdXZGR0gwMnQwcmVnOWtwbzh1cVY4RjZQdDJk?=
 =?utf-8?B?eUJaK0pLVFB0a3dTWXJla0hvTER6M3NJQ2ticjNFTFkrTFVvVHBhWXdtdXJX?=
 =?utf-8?B?UDMvT1UrdTZpc29KNzNhajMzZ2xodTRtMWQzZ3pYZ1lTWlJFaldlU2UrVytI?=
 =?utf-8?B?ODAwdU1jSFJISkhUQ2p2VEZMZ0d5L1NEcGcrSU1NRFZmYjlrWjRvN3daN3k3?=
 =?utf-8?B?bDVpVmw3RW5IdWFibEpWWXE2b0tiTk5lZGxkZU1TSFlPZlBCaC9WZWI0SldY?=
 =?utf-8?B?VnNrdFlQc3B1OHlWQjViMWlsVDIyWjNzNWkzRWIyKzVSK1VtL2x4Rmx5RWFP?=
 =?utf-8?B?TzlwRnJseDQ1aklEMW8vZUpSbVYyeFF3aDZzd0UvM2FlTCtmenY0RklUWGtW?=
 =?utf-8?B?WWQ3WDJKRXJwai9MdG12c0RjRjZyWHlPdTF2eHpld0pkaUdkd2hPZk1LZ2dS?=
 =?utf-8?B?dHcrQjR3WFNGaEJxZHk2aHcwQ0RSL2I4MEp4QlBQS3U1UUM1YTlLelkvZlNM?=
 =?utf-8?B?dmhKM3BrTVRuYXBxZXVyMlIyYU10ODREYTBPLys4Y1A4d0Q4Qk9LNkJhTW4r?=
 =?utf-8?B?ZUVhclFKWGNIVXVWVDVvNG1ONEpUNFRlOExTZVE1aGtjalVyS044RFNtb2JM?=
 =?utf-8?B?Y0N4OHo3Q1VmQ0FrQ3d0YXJxd3BNTFVCVkgrYWZTVU9scHhOYWtQczdyTXBs?=
 =?utf-8?B?MjIvOHVHYzFnandoRHFJNHV2VkJwOERxNjVXN2ZyN1B0bmVodk8wZEE3dWxE?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFA4434EE6395645A8B77ECD7FA17891@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cbd2e3-819a-49f9-5b1f-08db7327a5ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 13:50:32.3161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s9jubsTppQbCn0dCHd1F57Sof0X22KSBBnYR9j8hJ0HsTwbKzqELq1efLMdEqr12Bc0xxPcEtVMi582U+Es1jQ5ujeDUgGR+hZ/PAIFA99g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 13:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183242

SGVsbG8gTHVjYSwNCg0KSG93IGNhbiBJIHJlcHJvZHVjZSBpdD8gSSd2ZSBleGVjdXRlZCAiYml0
YmFrZSBxZW11IC1jIGNyZWF0ZV9zcGR4IiBidXQgaXQNCmRpZG4ndCBwcmludCBhbnkgd2Fybmlu
Zy4gU2hvdWxkIEkgYnVpbGQgYW4gaW1hZ2U/DQoNClJlZ2FyZHMsDQpBbmRyZWoNCg0KT24gVGh1
LCAyMDIzLTA2LTIyIGF0IDE0OjQyICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPiBIZWxs
byBBbmRyZWosDQo+IA0KPiBPbiBUaHUsIDIyIEp1biAyMDIzIDA4OjU5OjAyICswMjAwDQo+ICJB
bmRyZWogVmFsZWsgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciDQo+IDxhbmRyZWoudmFsZWs9
c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiA+IEFmdGVy
IGRpc2N1c3Npb24gaW4gYWxsIHBhcmFsbGVsIHRocmVhZHMgd2UgcHJvcG9zZWQgZm9sbG93aW5n
IHZhcmlhbnQgd2hpY2gNCj4gPiBjb3ZlcnMgYm90aCBleHByZXNzZWQgcmVxdWlyZW1lbnRzIHRv
IGhhdmUgdmVyeSBzbWFsbCBudW1iZXIgb2YgZGlmZmVyZW50DQo+ID4gY3ZlDQo+ID4gc3RhdHVz
ZXMgYW5kIGFsc28gdmVyeSBsYXJnZSBudW1iZXIgb2YgdGhlbSBhdCB0aGUgc2FtZSB0aW1lLg0K
PiA+IFRoaXMgaXMgYSBjb21wcm9taXNlIHZlcnNpb24gd2hpY2ggbWF5YmUgaXMgbm90IGlkZWFs
IGJ1dCBkZWFscyB3aXRoDQo+ID4gY29uZmxpY3RpbmcgcmVzcG9uc2VzIHdlIGdvdC4NCj4gPiAN
Cj4gPiBDaGFuZ2VzIGNvbXBhcmUgdG8gdmVyc2lvbiA2Og0KPiA+IMKgLSBhZGRlZCBjb252ZXJz
aW9uIGZyb20gQ1ZFX0NIRUNLX0lHTk9SRSB0byBDVkVfU1RBVFVTDQo+ID4gwqAtIGFkZGVkIGNv
bW1lbnRzIGZvciBhbGwgc3RhdHVzZXMNCj4gPiDCoC0gZHJvcHBlZCAibm90LWFmZmVjdGVkIiBz
dGF0dXMNCj4gPiDCoCAtIGNvbnZlcnNpb24gc2hvd2VkIHRoYXQgaXQgaXMgbm90IHZlcnkgdXNl
ZnVsbA0KPiA+IMKgLSBhZGRlZCAiZGlzcHV0ZWQiIHN0YXR1cw0KPiA+IA0KPiA+IERvY3VtZW50
YXRpb24gd2lsbCBiZSB1cGRhdGVkIGluIHNlcGFyYXRlZCByZXBvc2l0b3J5Lg0KPiANCj4gVGhp
cyBwYXRjaHNldCBnZW5lcmF0ZXMgYSBsb3Qgb2Ygd2FybmluZ3Mgd2hlbiBydW4gb24gdGhlIGF1
dG9idWlsZGVycy4NCj4gSGVyZSBhcmUgYSBmZXc6DQo+IA0KPiBXQVJOSU5HOiBxZW11LTguMC4w
LXIwIGRvX2NyZWF0ZV9zcGR4OiBJbnZhbGlkIGRldGFpbCBjcGUtaW5jb3JyZWN0IGZvcg0KPiBD
VkVfU1RBVFVTW0NWRS0yMDE3LTU5NTddID0gImNwZS1pbmNvcnJlY3Q6IEFwcGxpZXMgYWdhaW5z
dCB2aXJnbHJlbmRlciA8DQo+IDAuNi4wIGFuZCBub3QgcWVtdSBpdHNlbGYiLCBmYWxsYmFjayB0
byBVbnBhdGNoZWQNCj4gV0FSTklORzogcWVtdS04LjAuMC1yMCBkb19jcmVhdGVfc3BkeDogSW52
YWxpZCBkZXRhaWwgbm90LWFwcGxpY2FibGUtY29uZmlnDQo+IGZvciBDVkVfU1RBVFVTW0NWRS0y
MDA3LTA5OThdID0gIm5vdC1hcHBsaWNhYmxlLWNvbmZpZzogVGhlIFZOQyBzZXJ2ZXIgY2FuDQo+
IGV4cG9zZSBob3N0IGZpbGVzIHVkZXIgc29tZSBjaXJjdW1zdGFuY2VzLiBXZSBkb24ndCBlbmFi
bGUgaXQgYnkgZGVmYXVsdC4iLA0KPiBmYWxsYmFjayB0byBVbnBhdGNoZWQNCj4gV0FSTklORzog
cWVtdS04LjAuMC1yMCBkb19jcmVhdGVfc3BkeDogSW52YWxpZCBkZXRhaWwgZGlzcHV0ZWQgZm9y
DQo+IENWRV9TVEFUVVNbQ1ZFLTIwMTgtMTg0MzhdID0gImRpc3B1dGVkOiBUaGUgaXNzdWVzIGlk
ZW50aWZpZWQgYnkgdGhpcyBDVkUgd2VyZQ0KPiBkZXRlcm1pbmVkIHRvIG5vdCBjb25zdGl0dXRl
IGEgdnVsbmVyYWJpbGl0eS4iLCBmYWxsYmFjayB0byBVbnBhdGNoZWQNCj4gTk9URTogcmVjaXBl
IHB5dGhvbjMtY2FsdmVyLTIwMjIuNi4yNi1yMDogdGFzayBkb19jcmVhdGVfcnVudGltZV9zcGR4
Og0KPiBTdWNjZWVkZWQNCj4gV0FSTklORzogcWVtdS04LjAuMC1yMCBkb19jcmVhdGVfc3BkeDog
SW52YWxpZCBkZXRhaWwgbm90LWFwcGxpY2FibGUtcGxhdGZvcm0NCj4gZm9yIENWRV9TVEFUVVNb
Q1ZFLTIwMjMtMDY2NF0gPSAibm90LWFwcGxpY2FibGUtcGxhdGZvcm06IElzc3VlIG9ubHkgYXBw
bGllcw0KPiBvbiBXaW5kb3dzIiwgZmFsbGJhY2sgdG8gVW5wYXRjaGVkDQo+IA0KPiBXQVJOSU5H
OiBjcGlvLTIuMTQtcjAgZG9fY3JlYXRlX3NwZHg6IEludmFsaWQgZGV0YWlsIG5vdC1hcHBsaWNh
YmxlLXBsYXRmb3JtDQo+IGZvciBDVkVfU1RBVFVTW0NWRS0yMDEwLTQyMjZdID0gIm5vdC1hcHBs
aWNhYmxlLXBsYXRmb3JtOiBJc3N1ZSBhcHBsaWVzIHRvIHVzZQ0KPiBvZiBjcGlvIGluIFNVU0Uv
T0JTIiwgZmFsbGJhY2sgdG8gVW5wYXRjaGVkDQo+IA0KPiBXQVJOSU5HOiBibHVlejUtNS42Ni1y
MCBkb19jcmVhdGVfc3BkeDogSW52YWxpZCBkZXRhaWwgY3BlLWluY29ycmVjdCBmb3INCj4gQ1ZF
X1NUQVRVU1tDVkUtMjAyMi0zNTYzXSA9ICJjcGUtaW5jb3JyZWN0OiBUaGlzIGlzc3VlcyBoYXZl
IGtlcm5lbCBmaXhlcw0KPiByYXRoZXIgdGhhbiBibHVleiBmaXhlcyIsIGZhbGxiYWNrIHRvIFVu
cGF0Y2hlZA0KPiBXQVJOSU5HOiBibHVlejUtNS42Ni1yMCBkb19jcmVhdGVfc3BkeDogSW52YWxp
ZCBkZXRhaWwgY3BlLWluY29ycmVjdCBmb3INCj4gQ1ZFX1NUQVRVU1tDVkUtMjAyMi0zNjM3XSA9
ICJjcGUtaW5jb3JyZWN0OiBUaGlzIGlzc3VlcyBoYXZlIGtlcm5lbCBmaXhlcw0KPiByYXRoZXIg
dGhhbiBibHVleiBmaXhlcyIsIGZhbGxiYWNrIHRvIFVucGF0Y2hlZA0KPiANCj4gRm9yIGEgbW9y
ZSBjb21wbGV0ZSBsaXN0IHlvdSBjYW4gbG9vayBhdCB0aGUgYnVpbGQgcGFnZToNCj4gaHR0cHM6
Ly9zd2F0Ym90LnlvY3RvcHJvamVjdC5vcmcvY29sbGVjdGlvbi8xNzI5NC8NCj4gDQo+IEFsbC9t
b3N0IG9mIHRoZSB3YXJuaW5ncyBhcmUgYWJvdXQgQ1ZFcy4NCj4gDQo+IEkgaGF2ZW4ndCBsb29r
ZWQgaW4gZGV0YWlsIGF0IHdoYXQgaXMgdGhlIGludGVuZGVkIGJlaGF2aW9yIG9mIHlvdXINCj4g
cGF0Y2ggc2V0LCBob3dldmVyIEknbSByZW1vdmluZyBpdCBmcm9tIG15IHRlc3RpbmcgYnJhbmNo
IGZvciB0aGUgdGltZQ0KPiBiZWluZy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gTHVjYQ0KPiAN
Cg0K

