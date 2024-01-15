Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749B3C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:50:06 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.55])
 by mx.groups.io with SMTP id smtpd.web11.79944.1705326604530628940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=3hJK9tLO;
 spf=pass (domain: iris-sensing.com, ip: 40.107.127.55, mailfrom: jasper.orschulko@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkMA+UHAvcJyFq2fFP50WuTKxzj/QrL4umezBmfQQhvwu9CPPIsmthJcJPC0OZkDM4TcyhCmGBH8Pu4iANIN8lN9vqE+VUhNuzfVvlnS364NEX3GErOhLfAkL1POGyFkyCfGLQ+gqV+Sz2Xc7nw3z4+ERHw0RZcbyo70MdEaUEg/R/1O56Xsd9Y0v72r72NlNiOS1prUgKKQCDJ1qqrwOutnNwRuheIW8OUtfHSXFqLeGI89Xl2ah50u/N9KakKfyg0fiThYwKaumHqKv11c4mSeWf5BXP7D1BU11rBE6ROtJ4h0p677VA/wwPkTInENoDXtjRtfzq/A1gX4/PXwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEe+l0X8lipxw8DuEYHhWTfbGdv9m/MhfCedfSyExI4=;
 b=IDZw08HJAQhrHw89w0I/14NwmClZkEdR5JuuC227+dqwYjQ0cKB/5TZaANhAAKgExU96UnEgcZixXEE3sAbP+rHM2Xa+3zCPYouMcs1m2WlCIqhDAmwcEbf93uO48LeI1Li0zybvh5d0X4tRv5/jTWa3S9ApB7MtnD6r9T1CIefTKFwcKPaSRb6FHQwq1CB4O3yzONAeIycXha00IciklqwlV6tk0/f91Vus47GwA9gSJ1YtEyOznRgBeHrqb4nZhb3aUhYlx7Wc+og75QRVsrFgk6JVuAISZcwktP7t9hP6K/FC4ZvWXawiiX+ktmRFKETMppSoaxlBrrufgHj4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEe+l0X8lipxw8DuEYHhWTfbGdv9m/MhfCedfSyExI4=;
 b=3hJK9tLOuVpWyqQWjPd8KiR3m2yC8GK61p1rDVbpodZvQX99O01An1zFou4IOC0dd2C0uwjIsGMw7/VSnYa8W0XKyC+pZEKHkN6pjTvNDWwzH0VclHM0AGuu83foCLU1P5xfcdC9TmE1gbq9jSHzxpGJf0mp4pxanrx7fM5EShIqxxvwRFEurd6ije7sFfodyYnP7OqN9MhnQtz3RdHPQxt2qhleskd7DIOrDbhW7uwtoo7ylZWyvy6eilMfsoBeoaLizqppZ21lskc3lXCK13OXXD7A8zy1AtwB0O6pJeV8h+N+c1FtOHl+fRDTnloKReER0QPar8gCWFzUKtQrAA==
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:3d::14)
 by FR0P281MB2351.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:22::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 15 Jan
 2024 13:50:00 +0000
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a]) by FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 13:50:00 +0000
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Topic: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Index: AQHaR01toZjDsnahoEKeitp4QsxNjbDabEdvgAB4k4A=
Date: Mon, 15 Jan 2024 13:50:00 +0000
Message-ID: <af6662addc22623e6b10e24a62b7a0c39c749ed7.camel@iris-sensing.com>
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
	 <17AA7149AA53F0BC.13033@lists.openembedded.org>
	 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1963:EE_|FR0P281MB2351:EE_
x-ms-office365-filtering-correlation-id: 74b517e3-7115-46eb-6323-08dc15d0ddfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Esx2Xv4yHsC19cTFIXt9zjFykTLjHzD6W9CDPxMuz4g9MghD+VhC44Af95y5ToxGd7RBrbAPYVjcnKoCNDszHBlHgxZe38B27hi7DsXJAeciH46JXycHuyHWcDx6BJYdj/5YBGuqSM1IkwNgrnVS9C6qtIWG6EgrNy405HV/E1pNkQk9DzdhOpDNG2fWzfrv5TTiVZujpaOcngKSxTHVAmO1VVYptGlfUGyWjhqaqfvS1mKvTeW+sLlI1NL2vX9RdRxjnYS1MdmBOSZjrhpOpV9+TNmECS6LthJzPq9BHTmd/oLXxO7MNcafhGiMRF0OurgoQ53PI37Vfq4TiKZGlPITozguR6016+ZGWQp6RqpfJQaUtg2p1tSTjUNzPPdCNZ6vi/pCrLcaKyBvlOdBy9t1s4dwpEM8l76hVJjnsKJ1onzbt/WLCLHdJhLnHZvBqRA7DDxTyq60jYBVldjXrK7f1Gz+s7yk+2d9mj/PofHMzL9+jGfpLMnGIMtCiWu6UHftNxJB1LNrP9XZRaOZZQnTJaYamX8uiTbA75l+CD1LlZ/VC83vHJ56bUFH2ayXxsvZTSjpK8SDMyy0LsnihxgvEhcWHjcmoFKs9maqCaTyD4UxGgTXFKuOkoNJf0Ze
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66899024)(83380400001)(41300700001)(76116006)(36756003)(86362001)(38070700009)(91956017)(38100700002)(122000001)(26005)(2616005)(6512007)(55236004)(6486002)(478600001)(66476007)(2906002)(6506007)(66946007)(8936002)(66446008)(64756008)(6916009)(316002)(71200400001)(66556008)(5660300002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVRQRng4azdyZTgvcXhnSU1vRTBuMGp6Y1B0eDE3OU8xMlZmYTVyNUk4SUdo?=
 =?utf-8?B?ZEpqOGJma01wemdxL0h3YTk2T0NXOHlMMml3NHhpa0c3WmY3VFpUZ3Vqa25h?=
 =?utf-8?B?eWxQb1hXaTY5RDJlRmhDNUg0akorNm91MkJJbDdmSXpJOGxvblRnZklsTTYy?=
 =?utf-8?B?YWdhWDVLNTM3RlJ0U0ZxUGUyNVpIc1JUVklKRndnSFIwallvbDdwZUtPcHI4?=
 =?utf-8?B?aUZvNTVrYUdZMlV1L3NrNUs0VTlVWnR0VWM3V3JabGJPbXlJcFJBYXAvUEVw?=
 =?utf-8?B?cFFjelFDU1VnQkNmcllZeVNQdENqc2tzOEdmODZUMkxOb1l3b3UreFFtWDZu?=
 =?utf-8?B?eW4vMTFWK25MdFlNV0pZZDM1OXZYT1JaTHhaNTgzRWV0VGM0MTRDdHR5bm4r?=
 =?utf-8?B?RTlDUVZqV1hwSkc0YjJKZ3VnZE1PalpVZHBrZngySW1hM3VMcWQyNlR2RjRs?=
 =?utf-8?B?c1FlRWp1NnZZNEVTUHkzUXVUZ0x6cTdYdm9yVmhYZGorTDdodmdtZDRlV0Ey?=
 =?utf-8?B?Unp0dmhudTlTc002NlVmUndVbm9MUnlaeFc4alVUYm9tNlVON2VVVHAxTmlZ?=
 =?utf-8?B?d2VBUnhEWG5XUDJ6WDloVHZReklZUDZBTzFnNUxQMlNuaGhXMERxMzRERHlC?=
 =?utf-8?B?SGE0SE5OazJCdVZGNzdVbkJEeTc4azBtOXRobjlIOGl3TU04Z2U5OEQwelNT?=
 =?utf-8?B?NHdYUkdCbHFFU2orYlhPTENHVVd1YW5scGhXR3FJRjZibEFIVHJWOWdYNUth?=
 =?utf-8?B?Sldsc3crRFE5ZCsrRlp3Nm0wcFNLQnR4VlI3N05CT3MrMWQ5aU01bWJvQkZq?=
 =?utf-8?B?SDJUWDVBVFFZbGwxQVpyMDBoRkptTWVoMmNOakxkN3JFZWw4S2JhcUlaMzdJ?=
 =?utf-8?B?MnlocUdiL1l6QjlHZHdWL2ZZR2FiYkxGTnlHT0ZlcHgyS255TGc0SGg5Z0w1?=
 =?utf-8?B?TGlDM1Q1U0tCOWNjRFdhRkhPMkJkTEZqdzUrVk9OTVJWb1VDZG9wQ3U4cW54?=
 =?utf-8?B?bVR0bjU4VmV1TmxCSXZrNEljRnBKdC8wdVdiOGZsNC8vbS93NW5tbEFrYTBJ?=
 =?utf-8?B?S1RyenJHMzhLS05vMW9UMHo2SmFDdnlDU0xnM293QUc2MXdjNDl6Wm5zanVi?=
 =?utf-8?B?YkcvektENlZTQnN2eWdyQTZvQkZyRExUdlo2UzAwd3hzbXhWaGdjUXdzSEhz?=
 =?utf-8?B?YnBlZVNUMmFVSnVxK1pIR2dxaENqQTgvbHFrQVJ2aFBVWlBueTNZZDZQNWhP?=
 =?utf-8?B?bTFLamZXS1JoMnpzYmVFNmRvOHl0K0dJbjl0Nzg4Qi9OTzBnS1hXK2pXKzI5?=
 =?utf-8?B?ZEJCMHJDanpzNmExWE1UVCthUDRaTTJXNzdybkhWdWVadG4wTmk2WnhJL081?=
 =?utf-8?B?elNwZDhFL1JKNjlnSHpBbzNXUVpkNFhVNTBQMDdCVnBsMHU1V2NNNHFBZk9O?=
 =?utf-8?B?Rk5GU1d4TExzR3ZrZXJxNGMzd0R5cVVBZVZVK0Q3SHl2dVVzdmx2WlFOZFQy?=
 =?utf-8?B?ZHZoVnhybTZVUHBMZklDNFNyRUw3a3NTcGtLRmw3M2lGL28yR25kYkRqSTUy?=
 =?utf-8?B?OFFjZzJWYU40ZDVCU1lmYm5IWk0wRHIwdmlkaHNDYmRxdEFFMis5ZFUyTlg3?=
 =?utf-8?B?K01FZmhRa0d1b1NXeTBCaS8zVjBtZEh5aDdmd05sTU91WG04VDREbmM2N2Zw?=
 =?utf-8?B?KzRqWmxpbUwya0dsWFBqV0dXVjhKNitnVytCbG81RmFkVG5yNmNia3lMK0wy?=
 =?utf-8?B?SmdxenYrUDYzeUd2WHM2TEVIYVlPYWlCbHBpQTdVdXQvUStVcDlVRnJGU0d4?=
 =?utf-8?B?NWpyOXNMMUxmYjlXejUrSmZTTVlPd3Y3Z2d6dFJQWi8xQ1VyYjJ1cW5VTTFH?=
 =?utf-8?B?bVF6OEs3N2xZTmxHaWVyQXFRdzhvVitndjV5TlE3cENveXpXTmlBWW5mdUpi?=
 =?utf-8?B?cllHZy9PZE50MmhIWUxvenljY3FCT2w5QkR6UCtvR3UzU2p1MndrLzR4ZkFx?=
 =?utf-8?B?a2J1QXdHVUQzUlRPWkU0MElmN0N3bG9nUWN6MFkreFE4U0xqdExqQ0ZYRndJ?=
 =?utf-8?B?VHRQU2J1ekhBTTI3ZFFZUlpFY0RITFM1RUpXSTBaQXBCNm5pUXpvRDViMzJR?=
 =?utf-8?B?b2oxaUh5Wm5UR3RnQmMwWVdxM2RtUE9tTDJIQTdLc3p3RVpTOGZOeENxT2Vi?=
 =?utf-8?Q?Bq2dz/7ZU0w+GJ2FXKCTdQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4F2D5C2E7BE8A4A9E0CC15F39A1FFEF@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b517e3-7115-46eb-6323-08dc15d0ddfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 13:50:00.0871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HsPUUjcNHZ02K4mWd6NCe4RNAjX6z2byDyS7eSKG5uJmRW1y4Bp1e5H634FD3TRlILFei0j8Cfgl+XleAmZdgpSaVDPxbJayxDIybRfYCBdYKUmDMCgPIbhdrqyZG9P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193674

SGkgQWxleCwNCg0KPiBPa2F5LCBJJ3ZlIHJlYWQgdGhlIFJFQURNRSBmaWxlIGluIHRoYXQgcmVw
bywgYW5kIGlmIGkgdW5kZXJzdG9vZCBpdA0KPiByaWdodCwgdGhlIHByb2Nlc3MgaXM6DQo+IC0g
cnVuIGZvc3NvbG9neQ0KPiAtIGhhdmUgYSBodW1hbiBpbnNwZWN0IHRoZSBvdXRwdXQsIGFuZCBj
b3JyZWN0IGl0IG9uIGEgZmlsZSBieSBmaWxlDQo+IGJhc2lzICh0cmVtZW5kb3VzIHdhc3RlIG9m
IHRpbWUgYW5kIGxpbWl0ZWQgZGV2ZWxvcGVyIHJlc291cmNlcyBldmVuDQo+IHdoZW4gZG9uZSB0
aGUgJ29wZW4gc291cmNlIHdheScgaWYgeW91IGFzayBtZSBidXQgd2hhdGV2cykNCj4gLSBwbGFj
ZSB0aGUgY29ycmVjdGVkIG91dHB1dCBpbnRvIHRoZSBhYm92ZSByZXBvc2l0b3J5DQoNCkNvcnJl
Y3QuDQoNCj4gRG8geW91IHJlYWxseSByZWFsbHkgbmVlZCB0aGUgJ2h1bWFuIGNvcnJlY3RlZCcg
cGFydCBvZiBhbGwgdGhpcz8NCg0KVW5mb3J0dW5hdGVseSB3ZSBkbyBuZWVkIHRoZSAiaHVtYW4g
Y29ycmVjdGVkIiBwYXJ0IChJIHdpc2ggd2UNCndvdWxkbid0KS4gV2UgaGF2ZSBpbmR1c3RyeSBj
dXN0b21lcnMgKGFuZCBpbiB0dXJuIG91ciBsZWdhbA0KZGVwYXJ0bWVudCkgdGhhdCBkZW1hbmQg
YSBsaWNlbnNlIGNvbXBsaWFuY2UgcmVwb3J0IGFuZCBjbGVhcmluZyBvbiBhDQoicGVyLWZpbGUi
IGJhc2lzLiBDdXJyZW50bHkgYXZhaWxhYmxlIHNjYW5uaW5nIHRvb2xzIGFyZSB1bmZvcnR1bmF0
ZWx5DQp3YXkgdG8gdW5yZWxpYWJsZSBmb3IgdXNhZ2Ugd2l0aG91dCBhbnkgaHVtYW4gaW50ZXJh
Y3Rpb24gKGJlbGlldmUgbWUsDQp3ZSB0cmllZCkuDQoNCldpbGwgdGhpcyBiZSBzdHVwaWQgYW1v
dW50IG9mIHdvcms/IFllcy4gSXMgdGhpcyBjb21wbGlhbmNlIG9ibGlnYXRpb25zDQpnb25lIG1h
ZD8gSU1PLCBhYnNvbHV0ZWx5IHllcy4NCg0KQnV0IHVuZm9ydHVuYXRlbHkgdGhpcyBzZWVtcyB0
byBiZSB0aGUgd2F5IHRoZSBpbmR1c3RyeSBpcyBoZWFkaW5nLiBXZQ0KYXMgYSBzdXBwbGllciBj
b21wYW55IGFyZSBnZXR0aW5nIG1vcmUgYW5kIG1vcmUgcmVxdWVzdHMgb2YgdGhpcyBzb3J0DQpm
cm9tIG91ciBjbGllbnRzIChiaWcgcGxheWVycyBpbiB0aGUgcHVibGljIHRyYW5zcG9ydCBhbmQg
YXV0b21vdGl2ZQ0KaW5kdXN0cnkpIHdobyB3b24ndCAicGxheSIgd2l0aCB1cyB1bmxlc3MgdGhl
c2Ugb2JsaWdhdGlvbnMgYXJlDQpmdWxmaWxsZWQuIEkndmUgYWxzbyBoZWFyZWQgc2ltaWxhciBz
dG9yaWVzIGZyb20gb3RoZXIgY29tcGFuaWVzLg0KKFRoYXQncyB3aGF0IHlvdSBnZXQgd2hlbiB5
b3UgbGV0IGNvbXBhbnkgbGF3eWVycyBnbyB3aWxkIPCfmInvuI8pDQoNClNvIEknbSBub3QgaGFw
cHkgd2l0aCB0aGUgc2l0dWF0aW9uIGJ1dCBkb2luZyB0aGUgYmVzdCBJIGNhbiwgZ2l2ZW4gdGhl
DQpyZXF1aXJlbWVudHMuIEluIG91ciBjYXNlIHRoYXQgbWVhbnMgc2hhcmluZyBvdXIgbGljZW5z
ZSBjbGVhcmluZ3MNCih3aGljaCB3ZSBoYXZlIHRvIGRvIGluIGFueSBjYXNlKSB3aXRoIHRoZSBv
cGVuIHNvdXJjZSBjb21tdW5pdHksIGluDQp0aGUgaG9wZSB0aGF0IG90aGVyIGNvbXBhbmllcyBo
YXZlIHNpbWlsYXIgY2hhbGxlbmdlcyBhbmQgdGhhdCB3ZSBjYW4NCmdldCBzb21lIGNyb3dkLXNv
dXJjaW5nIGdvaW5nLg0KDQo+IEl0IHdpbGwgbmV2ZXIgcG9zc2libHkgY292ZXIgYWxsIG9mIHRo
ZSBwYWNrYWdlcyB5b3UgbmVlZCB0byBzaGlwIGFuZA0KPiBtYXRjaCBhbGwgdGhlaXIgdmVyc2lv
bnMuDQoNClNvIHdoYXQgd2UgYXJlIGN1cnJlbnRseSBzdHJpdmluZyBmb3IgaXMgY292ZXJpbmcg
YWxsIHRhcmdldCByZWxldmFudA0KcGFja2FnZXMgKGFrYSB3aXRob3V0IGFueSBzcGVjaWFsIHN1
ZmZpeGVzKSBvZiBhICJiYXNpYyBsaW51eCBidWlsZCINCihha2EgaW1hZ2UtY29yZS1taW5pbWFs
KSBmb3IgTFRTIHJlbGVhc2VzIChzdGFydGluZyB3aXRoIGtpcmtzdG9uZSkuDQpBZGRpdGlvbmFs
bHksIG1ldGEtb3Nzc2Vsb3Qgd2lsbCBoYXZlIGxvZ2ljIGZvciByZS11c2Ugb2Ygb3RoZXIgcGFj
a2FnZQ0KdmVyc2lvbnMgKHNvIGRvZXMgb3NzZWxvdCBhcyBhIHdob2xlKSwgbGltaXRpbmcgY3Vy
YXRpb24gdG8gdGhlIGRpZmYuDQpJIGFsc28gaGF2ZSBzb21lIGlkZWFzIG9uIGRlYWxpbmcgd2l0
aCBvcGVuZW1iZWRkZWQgcGF0Y2hlcyBhZGRlZCB0bw0KcG9pbnQgcmVsZWFzZXMgKGN1cnJlbnRs
eSBhbm90aGVyIHBhaW4gcG9pbnQpLg0KDQpCZXN0LA0KSmFzcGVyDQo=

