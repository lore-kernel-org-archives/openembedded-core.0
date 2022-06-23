Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3849AC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 00:38:55 +0000 (UTC)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com
 [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web09.2026.1655944728293783939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 17:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=XVdCKP0j;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.88,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1655944728; x=1687480728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C0m/PimeWW1SZXgBeKqAO3/13OZT+sWvERydx/amQHk=;
  b=XVdCKP0jtAuUWIHJeKXpQP002i+OrA6bDWImVWHeCJPclIhN+A1nHWok
   6almzkE1gKpZSwTZ8JZEA50OJbz9BYJCQYouMuJsajI0wv13H4lO4iVGq
   qB+VzZuM00l0cLzc4Rx+ZoHGFEsGpYY15rCm++n9P2syZBIpI/zgWdZkY
   nKjTottexGYr6yBgyoHdKYFP4tdE2QNmOSC0X7jHgqE1lVPKHJlVOGFA4
   UJLSczh59sdQhUz1UQIzFEL4g1/VOpb4lVGyshZPX4xSBpRMAFnT1/3HX
   fCA/GQ9uPUD6f5caMzpQNynhL/7dknW19HvfCBbxbg3UG2ZGO+CMWLhZS
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="58730525"
X-IronPort-AV: E=Sophos;i="5.92,215,1650898800";
   d="scan'208";a="58730525"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 09:38:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kru30nTZ96j/8iCacytwfIVYTeV3YjatFZqOG60CW7q2IEjs5ySmNP9QhHL8X0dID+zdoyz554ST7J4uZUZKFUxt0gH42fGQIRUXDgzfx+5ecyD/0KN7Tj9SDmqSiHXKUCgvBPmzfuLU6EGRbAV8jT1uugQllgyPfYXOqWLwsyeuXuYtZ0v+PfoUtL/uNK3KU9exm3O20qkIEMIfwrWaZRhaOgRokqPZZKzbF0+wW2WZZ79Y6vcSZHf5NueXlvkvB15dl7eRjsD+096zLV0zo5N6IdroOS0cxnChbj67sx6h1uGLs71oyPFel/CRp59dGTZ+Chn9psF+wp9v6YXtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0m/PimeWW1SZXgBeKqAO3/13OZT+sWvERydx/amQHk=;
 b=Ggvn+1u5t7npdHRymQArPuQ/vrGoozlbnswRelNyQpPSy+1R8pV2vSmTwtd9R4hwk/g8tYFdUPrYoRlu9hjzzL64S2Iv+ORwAVB+fZ9qD94nyAHQjn/aKHpL6F6EQcpr8GBx/KJMma07+EPIYVW45HNWOqXV3tbeiiyS/28bB3/AC1S92dEsxZ8M6GBi5cxiEGHJwV8stQIswEKuhwQdvg4i+TxEtEO8itDJyUZMOhGaAojkckjuxMfRdkZNYVQlF/CV0Ifi/Bk440b1ia3NQ0sEgvhgeUfPcJxMjF9+Le1gLYvt/DQ3q675hQt71sGNmZrrYw0adYF0PYexrBXJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0m/PimeWW1SZXgBeKqAO3/13OZT+sWvERydx/amQHk=;
 b=d0wZQMwBw7+zPLke47Olpd7oTB7GojZW8w4TFWOKyp76bx0dYB+NE03QtQvaBi+jQicjiy3QyKkPlSAiQUIrBLdef38+UPFutowEGDx5DCjEDbHnKvB6GxJ2jfA7uDF+Nj5e3o+oXo3qPU/RKUMyFcNROulyctBKcengTzMLvOI=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by TY2PR01MB2666.jpnprd01.prod.outlook.com (2603:1096:404:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Thu, 23 Jun
 2022 00:38:42 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::5c8:28f3:16a6:a3e8]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::5c8:28f3:16a6:a3e8%7]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 00:38:42 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] xcb-proto: upgrade 1.15 -> 1.15.2
Thread-Topic: [OE-core] [PATCH] xcb-proto: upgrade 1.15 -> 1.15.2
Thread-Index: AQHYhgypmrOCCemT6UmIff9v5qCi+q1bczSAgACzXWA=
Date: Thu, 23 Jun 2022 00:38:42 +0000
Message-ID: 
 <OSBPR01MB1845596F7D989F2D3BBEC0DFDCB59@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
	<1655884130-22843-5-git-send-email-wangmy@fujitsu.com>
 <20220622155455.47ed5d6f@booty>
In-Reply-To: <20220622155455.47ed5d6f@booty>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7919f4f8-117c-4320-62db-08da54b0b924
x-ms-traffictypediagnostic: TY2PR01MB2666:EE_
x-microsoft-antispam-prvs: 
 <TY2PR01MB2666F2DC5C7C173354C7B365DCB59@TY2PR01MB2666.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7CzB1EBUFzd1MVS2hE8f86q503prNgSEAcSn4hXVsdRCs9SALhuomJ8UFesXhldlg7Y2IlIg811Kyv6xHUKpJTtX45Wyg/R2zrplBIdsExMzwEA23SYFsUgl5cHS/rCpErhLuHt26IvzZvkURJdePVDuIAQq5o5SMfYc+KZwnFMcGCtG2qXWvEluAjcx8t/3vjpoA5l69W3hL1hdIORi+fGIA0m0M1fr7DEQSEPZQ5P+24o57/cBXx82OhJ/ZZeu+Qju4VtGgTmzFx0WWbKfqit9cfoGHzuNKdDe2JpwXVWzBROXnTufFp+0xeIfUdnBldOxUJAtIcnnoUW/RaViu5kaLQ4F900kr/kyUN9PY5Iep9Xa/DNo1UjWxHMJwbxj6zxQ4oTReMnbTX0uMzx0yi3MXQlFROgDrX65fNtMEr+YNopdBjsNjLCWFQFgyysQ97parvxQyFfyWNgq369Dgwc19j5pTzcJyGziUzrG4oHdK1l7iVrmtoIaAs4IZouZEBGZUVAyt/ZuQ9EsNvNaynATFqfbsz3OivHSQLO/gqteUaEFieEu9bHAiD+h0Raz/sEjR2zLDU5nVJA8Ta9QJ3UhyTnbbVpF8BWRqUV+N+Jbva8rPanPJrtAOPLAlogYie3OHG4A2zXwAMp2vnNAfDoA6KZHts8N21k2trbFmPYbzgWQsjCndf5+MphlYHk1XZ7OV2KGXELGfJKlCtSdj5QBLAPocDL4vmlVFk4Mx3Xb0x9CoFS5UzjwieqgfXvA2sfOf0Z1drvR7ACi2L1Mc7qqTVlXPMaIFfnOC3bbMug=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(66556008)(6506007)(316002)(83380400001)(5660300002)(86362001)(41300700001)(53546011)(82960400001)(6916009)(8936002)(26005)(478600001)(64756008)(7696005)(4326008)(66946007)(9686003)(186003)(76116006)(8676002)(66476007)(966005)(38070700005)(66446008)(85182001)(71200400001)(55016003)(2906002)(52536014)(33656002)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SmIvRERseXh5czR0Q0lWalpyc2x5NkI4OFpnMWpZQTh0dkMvK2tUT0c2aXgw?=
 =?utf-8?B?YkNZZTFESDZTY3NwRWU3Uno5SUgrSmpHUnU5V2Y2eGdveG9zYWxoRlJ2UE1P?=
 =?utf-8?B?TUY1eEd4dVpsaVYzaHdIL1dPcmFpaUplYnNZRUw5Y29US0p1dUphZk9XVmp4?=
 =?utf-8?B?dWtqYUthOXo0WDdMS1NKM2RyNHFydHdVeG1KekdIMmc3SVA5U3dQaDFGS1hL?=
 =?utf-8?B?TDRrLzdWWFZxSnozVmc1bENjTkFlOEdYMGY0eDZZOGVnRFFtcGtMc2xNUDEv?=
 =?utf-8?B?YldqOUZNanZnbXJTVnVHdmpQR1pEUlpBS0h6V2JvVHJ5YU9Xc1JGNEl5VGYx?=
 =?utf-8?B?OHNBOWwxdEFGd1dpdWhnUnJlYWlNcXdHOHZTWGk1eEFkRm11ZDNEY0hqS2xJ?=
 =?utf-8?B?STZxSHVjUFZhaXlTUThPNGhjSVZSeTFjdWpzNXpFdkFuNmc3ZUkvc09xeUsv?=
 =?utf-8?B?Q1BVSHdOdks2RXFaaFhySzg5ZXlsM3I2YjROT0h6cmI1ZGtPcW9NUHNNZ1p6?=
 =?utf-8?B?eVJuK2gyMGlJalFhMFNMWGNTUTc0bUJrUzB1dDdzQm43Sm5RbGVTMGFUUWJJ?=
 =?utf-8?B?TVRUcXlOS2FuM0dDWVlZTFBRSjlVdm1kdUhkcUg5eW9iendoNmpzcE5YM3dX?=
 =?utf-8?B?ai8xYzZTV3Q5amtMRVNCMTloaDZEbXlxenhKdFFvalpTWHpUZUpaaGdNNUxu?=
 =?utf-8?B?Ly9vV1VKY1dwbkIwTlQxOVYxQ3daVUpVbTJkUlZaWGVwcjdPcy8zanRmT1pU?=
 =?utf-8?B?TnhBeGFrdys4NlB2Z0M2MXBmd0xNdWg5Vno0VnJqdDhpZXNMTEdxWlpIMDRv?=
 =?utf-8?B?UHllcVp0RmZxdHNYbUdKT3duYW1vRWdzeDRRL3h4VEd6bS8vMWEvRWNJNVcr?=
 =?utf-8?B?TW0yUUZZdWRRNjR1VE9HMFVRSmJxQWNzUHBFZ292ZVAzZ0VWOThlL2svWDBh?=
 =?utf-8?B?NjNSOUFRTGZQL1EvdGtoRTAvN0h4VnpJTmxlN2h4NmZaWWlXNmVFRVNSV3Bi?=
 =?utf-8?B?cmVNUmNCaDF6c0FTeGF6Z0RFYjhXTkgwdFoveUNNdmgwTHZoTmZ1d2doZ21w?=
 =?utf-8?B?NHlnWXFkYXFWaEtvbFlHNi81SDRCbnd3dlYwaCtnWkdhWDY5ZWxwVm9CQ3Jr?=
 =?utf-8?B?MWZ0ZDJwdWpNa2hjWkVGVzdRa1RCMEM5bDhGWVBDUWpVOHFsbDR1Ris4RTMw?=
 =?utf-8?B?WXFwaGdOMGh6MEovLysrMm5FVXd1dTZyaFc3YWJ2VU0wWkp0NzVhcFV4TkhX?=
 =?utf-8?B?ZkE0ZXI3aVhSQkxzNVFVc2hYdmVLN3loMFN6aDBHeEdqVm5vdnlKMjlpdEw2?=
 =?utf-8?B?dzdUNE0zeUJTSE1FcEllbXc0WEdLdFA5NGlSdWY5UFBCcGZoMHRBWEhxZ012?=
 =?utf-8?B?MVgrWXZHSi9IU0pzWjhkUCtKZkNDd1ZGc3FoaEViTmlaWjc0WlpoMGR3MG53?=
 =?utf-8?B?TDNhZ29yajdCRklmZ1pGUU5XNG03bFVzaitGRHVtRGZnWTFnSlJucHdFNVpq?=
 =?utf-8?B?SlF4NWwrVjQzN0Y1bkIwdk9nNEp6Y1BGd0NtN09oTm51U3VaWTk2dkF4Q3Vr?=
 =?utf-8?B?M1g0SUhJa0ZnVUFiUlhFdU5QTnBDUnV3OEh4Ri8xaThqVllYYjJocVdLRW5v?=
 =?utf-8?B?NHdieElMR0ttOGZPd0taSlJiWWlqTkNTZDUvdkk2M2F4VTlUd2VmeGkzdUVu?=
 =?utf-8?B?NjRkcTJTZVIvZjBlMURLRU5Zd1hTNTJ0UUZ6N3l3UHlpVDJqVkYxcWNYWnhz?=
 =?utf-8?B?cDVFT1U0RjFlTFUrbEQ2MjNabUJFZEthTTVBNzJDbk84eW1xcHRxVC9ka0pW?=
 =?utf-8?B?dTJ5aTdzUnBsNUxLNjUvNkduOFVPU0c3a3lnMXBLcEJvL2IwK2JKMWNpTFI0?=
 =?utf-8?B?RmNGKzZZU1pyVkRVVDhNR3cyN1RJWjBrMHlvS2UrSktTRTN0NmVGWEo4NWNz?=
 =?utf-8?B?cHdVdXN6ZjUrR2RFcXg0SXZqZGhEb1JzVWRzWFdFdEt2bDVqcENRVlZhKzBO?=
 =?utf-8?B?UytpU093cFVyenF0SmN6dUVBdk82UDlMcmt1RlpyVjdKN3VHb0pRRnkvdDA0?=
 =?utf-8?B?Z21SOVFhaWp4cEZyTzRuR1E1WUlMT0NRR29FVDNiem9SbWNaNHNuUnFnVWdH?=
 =?utf-8?Q?w/ZM2o4uAasIMgzNmI/X60Wh8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7919f4f8-117c-4320-62db-08da54b0b924
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 00:38:42.3024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 el+yEJrH5ArDKQdhnucz8njZO0XMetvEKRUnHjvB01YooYTZTCEVrd0Eh4mLYKe3AavAbWXxrH92znJw9hZ3fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2666
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 00:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167259

U29ycnksIHRoaXMgcGF0Y2ggZmFpbGVkIHRoZSB0ZXN0IGFuZCBJIGZvcmdvdCB0byBoYW5kbGUg
aXQgYmVmb3JlIHNlbmRpbmcuIFBsZWFzZSBpZ25vcmUgdGhpcyBwYXRjaC4NCg0KwqAgLS0NCkJl
c3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBSb2FkLCBO
YW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpDT0lOUzog
Nzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20N
Cmh0dHA6Ly93d3cuZnVqaXRzdS5jb20vY24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYg
T2YgTHVjYSBDZXJlc29saSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBX
ZWRuZXNkYXksIEp1bmUgMjIsIDIwMjIgOTo1NSBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDp
uKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHhjYi1w
cm90bzogdXBncmFkZSAxLjE1IC0+IDEuMTUuMg0KPiANCj4gSGVsbG8gd2FuZ215LA0KPiANCj4g
T24gV2VkLCAyMiBKdW4gMjAyMiAxNTo0ODo1MCArMDgwMA0KPiAid2FuZ215IiA8d2FuZ215QGZ1
aml0c3UuY29tPiB3cm90ZToNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdh
bmdteUBmdWppdHN1LmNvbT4NCj4gDQo+IFRoaXMgcGF0Y2ggdHJpZ2dlcnMgYXV0b2J1aWxkZXIg
ZmFpbHVyZXMgaW4gbGlieGNiLW5hdGl2ZSBkb19jb25maWd1cmU6DQo+IA0KPiB8IGNoZWNraW5n
IGZvciBjaGVjayA+PSAwLjkuNi4uLiBubw0KPiB8IGNoZWNraW5nIGZvciB4Y2ItcHJvdG8gPj0g
MS4xNC4uLiBubw0KPiB8IGNvbmZpZ3VyZTogZXJyb3I6IFBhY2thZ2UgcmVxdWlyZW1lbnRzICh4
Y2ItcHJvdG8gPj0gMS4xNCkgd2VyZSBub3QgbWV0Og0KPiB8DQo+IHwgVmFyaWFibGUgJ2xpYmRp
cicgbm90IGRlZmluZWQgaW4NCj4gJy9ob21lL3Bva3lidWlsZC95b2N0by13b3JrZXIvcG9reS10
aW55L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9saQ0KPiBieGNiLW5hdGl2ZS8x
LjE1LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Ivc2hhcmUvcGtnY29uZmlnL3hjYi1wcm90
by5wYycNCj4gDQo+IFNvbWUgbG9nczoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9w
cm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvMTUvYnVpbGRzLzU2NzUvc3RlcHMvMQ0KPiAx
L2xvZ3Mvc3RkaW8NCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhv
b24vIy9idWlsZGVycy81MC9idWlsZHMvNTQxOS9zdGVwcy8xDQo+IDEvbG9ncy9zdGRpbw0KPiBo
dHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzc1
L2J1aWxkcy81Mzg0L3N0ZXBzLzENCj4gMS9sb2dzL3N0ZGlvDQo+IA0KPiAtLQ0KPiBMdWNhIENl
cmVzb2xpLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcN
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQ0K

