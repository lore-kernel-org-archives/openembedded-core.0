Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAEECDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 17:49:38 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.59])
 by mx.groups.io with SMTP id smtpd.web10.288438.1697651377109360678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 10:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=ejaUxBce;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzEBikV77lpdqyyVbwqJOpdwbVba0s1X3a8QQpstya20SArYQisprirUOFIlXsrmYUSGi7VYB33+Zu6wbYX/2jSLeOh4n7YY0ca/TnJWbdNk6QFOTKkybt9iufY0nMT/SutFmI0LCC9IP0Kh7WQv0bkO19VCT2A8f8Xd6+CZID2DMqo7ntnNr+bHM/V8FrBqcvWhvGtYAxrQHTO7Spg1pMA+O6Ka16pF1K/XVOGWXTwiD6B5zlNjslrBYOMYBFxt3FGiqLFJ8sxSBoffgDFuk4qaUYSfu4hSrvoF6lQYOdVO4sbwWsOc/W3C1jZfOTv1QB2nMnGVsieysgeA5m17wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QFPAFmpHu8C91hGliMaSsKPHSVHsndYFC5gqGDPOCs=;
 b=LBmwrMZCm+L8D5v4vMXHqsRLG0T6+xl3YkSdUNWYl5mEe/PYl1S6evxSn9+Vxfca8o/3vD1ZL9A5NsZz5/oevYconMaZhmzIjCvL0QN54ZKUX3P0oP0HVjbjzD4pG96h0e7/gAXlPfCSHRWa+hxKiAXinRXDMZHRHq5ZbDSx+QGiTPwgegRm5n8pIrzf0OtMUNxjIwxswv9yUxAFeQAjHqt5m5KSvKRFmBWosRHwBsq7REdvM+lO6pXMbdj8rTBg4O0SORdeLlSWrNK08wZ6V9uLYWfDkehEkRq6vvQn4WVVX1HIEb2Ze0Jc6dzc5vpXWvvRpuH+OKPjuNlG9o8iUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0QFPAFmpHu8C91hGliMaSsKPHSVHsndYFC5gqGDPOCs=;
 b=ejaUxBceXXtwjuInfWflWZZai16TUXVeUHn+PqTW/qqtSO7IQKvnh5TJiTopXYjtjY/PKjBbBmWx7N8Rjw5SOogR8ZRL4GgMTAhjCaTnRVL7tL2hTWhdqtUgMbg5yg/Bs+C560+j8O9mMJXc+Uy4BsLa73R0cAOcBGrC8XyAkkcjgPXPg4Dr7mmj7lYu9TiXmyhZkpTjxnN936qu8zn3Sv8/N1i5Drco9Cc7m/MEF4sqhcFMADaNMXAdKwt11pOYVRaD0LdRcVD/v2+gJnJbQtw9U9h7Z3Q3EKbhOUPtKjvQT55VcXdhhotIqF+dP3PjkO6yFR4+e1PuwLh0eR5qXg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 17:49:34 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 17:49:34 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jon.richardson@generac.com" <jon.richardson@generac.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Topic: [OE-core] [PATCH 1/3] kernel-yocto, devtool-source.bbclass: fix
 'devtool modify' for kernels
Thread-Index: AQHZ/UpTh/r6Atc+X0O88ReAbo4V17BP1gEAgAAC6iA=
Date: Wed, 18 Oct 2023 17:49:34 +0000
Message-ID: 
 <DM8PR12MB54301AFB99198C2370B9FF698BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <178D75FBE8F44DE3.14388@lists.openembedded.org>
 <DM8PR12MB5430ECC002146797097B60B58BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM8PR12MB5430ECC002146797097B60B58BD5A@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=8d1204cf-7eea-42a5-9a7c-259dddb18bf9;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-18T17:26:56Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|IA1PR12MB6626:EE_
x-ms-office365-filtering-correlation-id: f1f0f848-ae1d-4373-0e23-08dbd00296f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rhDSs+jkdC+6mK1pCct24DlYo3eYfcvXVtIbQ+qN2ZXql35I52ZBEsCJ3VAQbWLSFEvcnQwA/bEl3aXw/IBLIAGeqZVfWlcXD3sA4WkgTvoBhCmUn+6F2fdEYFKQv1KcsaRGylOd7JWY3GObAzvNBLwxFMlRXH4/4t01sSueO5rdqRUttc+nmprF87LDl7gymE+lD/61c8AHyjTOuvJ4gWeyozIhrhhHvSzRdqT+VFguul3XyGMgf7yq1S70UP60H7emh501Y973mTA09wq21vpCoBZh9pCeXbDkm4AXQj2miLFAdXHgSdoNabOHqUAv8lloet1EpWMbrMznl/7tZeVBDAElWLDSQ0ZKNXCgkBUsuu0sDGczlp93QQPQ8c/W8aJ1BIU65i60Aiyg0eudMzbLyXtfOKTp8GwXeVHKk7RQ2afwW0HchGqHBH4Db9SOs0yqje9ylUBU8g65WiZxiXGV+5VCf6x0CGozHcUDSi2Z5dMcrduLCrNWrjCum9tCd7tOZMVN4HFO5fcSic0pPf55OBk/bGkmaUuaUBrqJ3FPJBOkTS7GnORp0xY/9n8ZhjCULa0mAN//P4ukIc7KAMoLySrQOpo+uI0atYnLtohf3OGkogpY+y3TQTVbE2v/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(9686003)(33656002)(55016003)(66476007)(6916009)(66946007)(66556008)(54906003)(76116006)(66446008)(64756008)(38100700002)(86362001)(38070700005)(122000001)(83380400001)(8936002)(6506007)(26005)(7696005)(71200400001)(2940100002)(4326008)(4744005)(2906002)(478600001)(5660300002)(316002)(8676002)(52536014)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bGgwMzJ4L1p0ZnNsMFpNcXF5NGk1eHVhTjcwZWpqbStqWjdWTzNYV2VHMzVI?=
 =?utf-8?B?dWdMZkF0RFgzYWgxZFp0VGJBcEtYUmh6SENMRlRLdmcwT1VkclpJcS92bnpZ?=
 =?utf-8?B?Rkp4UUZNemxBbmQvRGNjRFJFTlE5YUxoNmlzRWpXc281eFB5THVwNTBDYXhr?=
 =?utf-8?B?c0VOejBweHV5ZmJXTndFTkpGUUxWcGlZU0QyOGRJNzJrZnp6aGp3L1hqWmhX?=
 =?utf-8?B?OFV3N3NSRjNvRG1HcytHU29BbUJJNW1tL0lOcDlDMmY5Y3JtNDIrU0JISUdU?=
 =?utf-8?B?QUVDWVRhMGpaeVNSYXh4M1JwdDBocWZuQnE3cEVpeEJqUlhqSUgyK3d3QXo4?=
 =?utf-8?B?cXF2OXNnbGlOMzNCWjhuaVhDT3U3S0VwcENJaU0wNDJIRDMzaXEzcHVMZHZn?=
 =?utf-8?B?N1Zoc00ydFpzN0ROa1lYNnM1V1JVUjFRSWI0c2g1V2JsTDNLVHp0aks3UWFW?=
 =?utf-8?B?WWhjU01iU2t6aVlPZWxoU05OT2tOZXhCcEJOQ0NTazJnekt4cG4rN3hHN2lC?=
 =?utf-8?B?L0tMUnVaOXJIWjk4YlM0MEZvcHlnTDhrVjZ1eVFXZ0lENDZnNmk5Nm85eXpV?=
 =?utf-8?B?TFFDSmNITkhuZFkraDhSOVF5QVI1NEF0K3pPNWdZMW9RYlJnSGJnUXIyQUJH?=
 =?utf-8?B?SVZLUVl3QkJBVlV4Wm5mZDhPQzczMndxbEoxVzBsN3ZkSUs1QXF6czQycm5E?=
 =?utf-8?B?SXFhNGFZUEJxZFlZWG5CR2ZqdWRpTGhIcytYUThrQ3NVeDBCWjMvN25hY1NX?=
 =?utf-8?B?eGdRbmZiTGR0TFdHbSs1VTVXMmhCZGxNeTZjWnhseEh5RThUSVZaVXNlZ3dK?=
 =?utf-8?B?T0pGWGUrZUdzQWxEVkFzcnplSnY1TDR6Uit4eVEyQkVNcGFYU3FhM3E0ckFS?=
 =?utf-8?B?cnJUZWtHbmJiSEs1dEVENVRuL3lKOWd6ZHVRNm1oSENLbW1uZTliVVlReWRC?=
 =?utf-8?B?SEhSTU1nVnFMZFJCMGNVZnUxNzVXQ2t4SDRxdmdwWGNZdEVTYjVvdURWQjJQ?=
 =?utf-8?B?eFU4M3lUN3N4TFhhMU9QQ09KL2RpdVJyQUUyeDB3cEI0SUdxajlzVDZNNjlN?=
 =?utf-8?B?eURUV0RVNk13T1ZzQTJUNDl4YWI4Vlo1Wkladjh1UTZPSjlUZjNJc2xySTdM?=
 =?utf-8?B?ZmxtOE9DaG5ORDZucllDbitVN00vVUs1ZmI4NFZjdjBFK2dYTGY0YlMzem9m?=
 =?utf-8?B?M1gyUTFWZ1lVK0tQMTBPU3VmNlpWNCt3dmE5ek1jMTB2NkNXVk11ZUJlSE9S?=
 =?utf-8?B?b1VLeHE3UzkxdW9xOVlBNkErbUtqRjNyTnQ4ZEJJMWFaR1RYbFFQaC9XTnBJ?=
 =?utf-8?B?djRtOWhmWFc2M2J6eDdRWjNQQ3ExUkhFd0pxN0xPcEdLd3g1THI2d2RvRVFi?=
 =?utf-8?B?RTU2cEV4MjhmWXdaNGNhVWd1NWsxcDRUeVpVLzQzaG0xcmwwVWxjTkNjeVZN?=
 =?utf-8?B?L3hFU09zZFl1MzRqcURTN01NMFowQWlaM2VLU05rNWpsRCtNQzUyL0F5N0hz?=
 =?utf-8?B?K1ZMOXZjUVlwVWpJck9oY2dWSHVNOVpBZE5RYWRQQ0lPRE51UmI5b295RGtP?=
 =?utf-8?B?TVpZQVBJU3MySnFsUU02MVBsM2tiL1IrRXdxSGIxeTFvODJtck9JL0VuRnhy?=
 =?utf-8?B?NHNvR05FY2RRaEZvQ3lSVDRGKzhQNTJ2NU0weXdSRXRGQVZjSldDU29mejhr?=
 =?utf-8?B?WEU5dkF5Si9kc2lSUHdhRno5UGR1bUFCaTNqU0pUa0xNUmJVYVZzZ2xVWWNu?=
 =?utf-8?B?dHJ2Y3JhRFp5NU9mVzNEeWdXajAwaEpKTVdhZmMwYUQ5MlMzaHFLdVM1dFBy?=
 =?utf-8?B?YmRzajJKckRDU09QSmdPQVpjc1ZrMlRFazZKaHhybGJKL1Y2dTg5bWIzeThq?=
 =?utf-8?B?eE9neEdTSlM3UHZseHhjMDZnMWNnOTg1bjhZUGx3TzZOZDlIUC91dnI4cnFO?=
 =?utf-8?B?bnhJaHE2RHdKSW9ORUNSRDZHMEZaSTZSSllyTDF3OGt3WFl3OFdVeXF1eDB5?=
 =?utf-8?B?dHFVUmp6eGgxQTVyNXlkMUQvOEpLN0hTL2QwNG82SnVnR0h5QkpHMkRtRWVT?=
 =?utf-8?B?cUZiTWFPZVRzOEFRVStIRzdLRkNxN0E4WGpzUXRkQzljQ2NDc3NiNE9xa0Zh?=
 =?utf-8?Q?IoWMBmJTqkCYA/zKi4wEsuJkO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f0f848-ae1d-4373-0e23-08dbd00296f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 17:49:34.3633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rgyR2EnMDHQKj4Gu/Qswcz33CQ8iN3wNauKp8gUjEzdMI/3sPLV1VubCOJBgx/AMEP+4eA/WTd0hsSw1yU0R1713UPt58UssKYxhbfemVkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 17:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189415

PiBVZ2gsIGFjdHVhbGx5IHRoaXMgbmVlZHMgbW9yZSB3b3JrLiBJZiBhIHJlY2lwZSBzZXRzIEtC
VUlMRF9ERUZDT05GSUcgYmFzZWQNCj4gb24gTUFDSElORSBvdmVycmlkZXMsIHRoZW4gdGhlIG5v
LW92ZXJyaWRlIGNhc2Ugd2lsbCBleHBsb2RlIHdoZW4gd2UgY2FsbA0KPiAna2VybmVsX3ByZV9w
YXRjaChsb2NhbGRhdGEpJy4gU2luY2UgaW4gdGhhdCBjYXNlLCBLQlVJTERfREVGQ09ORklHIHdp
bGwgYmUNCj4gdW5zZXQuDQoNCkFjdHVhbGx5LCB0aGlzIGFwcHJvYWNoIGlzIHByb2JsZW1hdGlj
IGluIGdlbmVyYWwgYmVjYXVzZSBjYWxsaW5nIGRvX2tlcm5lbF9tZXRhZGF0YSB3aXRoIHRoZSBv
dmVycmlkZXMgY2hhbmdlZCBpc24ndCBlbm91Z2ggLSB3ZSdkIGFsc28gaGF2ZSB0byBjaGFuZ2Ug
TUFDSElORS4gRS5nLjoNCg0KbWFjaGluZS1hLmNvbmY6DQogICAgS0JVSUxEX0RFRkNPTkZJRzpt
YWNoaW5lLWEgPSAiPGJsYWg+Ig0KDQptYWNoaW5lLWIuY29uZjoNCiAgICBLQlVJTERfREVGQ09O
RklHOm1hY2hpbmUtYiA9ICI8YmxhaCAyPiINCg0Ka2VybmVsLXJlY2lwZS5iYjoNCiAgICBTUkNf
VVJJID0gIjxrZXJuZWwgc3JjPiINCiAgICBTUkNfVVJJOmFwcGVuZDptYWNoaW5lLWEgPSAiICA8
cGF0Y2hlcz4iDQogICAgU1JDX1VSSTphcHBlbmQ6bWFjaGluZS1iID0gIiA8ZGlmZmVyZW50IHBh
dGNoZXM+Ig0KDQoNCkFzc3VtaW5nIE1BQ0hJTkU9bWFjaGluZS1hIGluIGxvY2FsLmNvbmYsIHRo
ZW4gJ2RldnRvb2wgbW9kaWZ5IDxrZXJuZWwtcmVjaXBlPicgd2lsbCBmYWlsIHRvIHNldHVwIGtl
cm5lbCBtZXRhZGF0YSBmb3IgJ21hY2hpbmUtYicuIA0KDQpJcyBzZXR0aW5nIHVwIE1BQ0hJTkUg
dG9vIGludmFzaXZlPyBPciBkbyB3ZSBjb21lIHVwIHdpdGggYSB3YXkgb2Ygb25seSBzZXR0aW5n
IHVwIG92ZXJyaWRlIGJyYW5jaGVzIGZvciBvdmVycmlkZXMgdGhhdCBhcmUgdmFsaWQgZm9yIHRo
ZSBnaXZlbiBsb2NhbC5jb25mPyBJIGxlYW4gdG93YXJkcyB0aGUgbGF0dGVyIGFwcHJvYWNoIGZv
ciBzaW1wbGljaXR5Lg0KDQpUaGFua3MsDQpDaHJpcyANCg==

