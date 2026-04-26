Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C23DFF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 19:22:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25768.1777231337026055903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 12:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=hLtcona3;
 spf=pass (domain: siemens.com, ip: 52.101.65.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHzHbhS4CwthbGidmynKhQUvBYA7/0NxY9FmIMogqRa0UdU3QuUv195YyQZcZReRb2hfA0yl7zHQII4+3f+NL9qejEV/0D2zzKTclPw+FVP+dxHDtxbKgE9qFeNbgnOM7cIftb4iwM6BW6PwlyKEB522ujkcw6c6p5wMlIl8nyC6YRezKWteJmJUDfzeVUhEJibSbPyvFK4wRVayIYzicJzIMUsaN+0y+DdnTAo8/sDroQOuZb7vvkffAero27ulIyTlCYGyFHVmmP/WanuC1Wc4Y5O5B1XQa47q0fe9G2sOBaxWX6Sn+jdpaQVxnaGnsdvMhFeMLPtoBq/XoLAJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZPNXFVzsowmeG/fyWmltMw950kK7ETNha4lR8iRId4=;
 b=pzezVib69YvKffm6qUm1vTkb+zB3i6TEs37XtPnUT8OHWf3qEBOJapWfhS7vCVJIfFDkJlK3cK1TGTucaZMl5XfmQNZ7zWJQ22FXHOp9me6j77U7x85TmHSd+tFHOWxNn1WzRAPrBneC3HrRw/8GePu/qvWQhEJOl9eZRzVwzJB+ianq9w6RUscODiirMTc+ZquIbmtumGm1EE0ByCBeHNFZB/mImQUODqOYDhlmLTA5CER7x6NWFbHUkhhMloLaAgeG3ye2garYCBI1kQgJd/SoiYtgl8769Ye0JJQR/l9zuCgeNzX6NCmVWVAqRhpA862Dv0nfYuc3GruzfIivAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZPNXFVzsowmeG/fyWmltMw950kK7ETNha4lR8iRId4=;
 b=hLtcona3RQrSX/P59gbEWFW4rNMMTfQrqQKaNHernS5MY/phWjR40UsV+uo8RZ5rKcgUo4gTIYKsj2lW3dYwcxtmhJGtax05Sr3WtOq+kbghc25m9jiTagB4/AZwFz+ZgmBvOWMA6Zfl8rSooHnVlndg74A1lwuEaD133w1zH+x8kU9UvYVfAuUoUY60Fan/OcT3/yNhFHz9L/Z1HUYyUDnRzTA5tgXzMfUBeZRm2YI/SZIYE3h+VGkOuqtw2TazHhHd0itMiyGI4eav+tVKTCBVAIV4eMnguzidaP9BN+KN4RzXMbKaPdiTqBgmAmarx9jnp0ry1+NeIaZkLm2E6g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA2PR10MB8876.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:422::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 26 Apr
 2026 19:22:13 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Sun, 26 Apr 2026
 19:22:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"ross.burton@arm.com" <ross.burton@arm.com>, "jpewhacker@gmail.com"
	<jpewhacker@gmail.com>, "olivier.benjamin@bootlin.com"
	<olivier.benjamin@bootlin.com>, "antonin.godard@bootlin.com"
	<antonin.godard@bootlin.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>
Subject: RE: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
Thread-Topic: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
Thread-Index: AQHc0m0aF6++EJCIRkeUpb2SZcX6drXxviZQ
Date: Sun, 26 Apr 2026 19:22:13 +0000
Message-ID: 
 <AS1PR10MB5697161BED467E81C606A1D7FD292@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
 <20260422-update-sbom-cve-check-and-depends-v1-1-4646f840ce48@bootlin.com>
In-Reply-To: 
 <20260422-update-sbom-cve-check-and-depends-v1-1-4646f840ce48@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ef62b4a8-1a08-4ff2-9910-ea68f32a19e5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-26T19:18:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA2PR10MB8876:EE_
x-ms-office365-filtering-correlation-id: ae63b769-5992-413a-f461-08dea3c91eb4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|55112099003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 vn1c7/43wEqVP5PKW5M/m7qaOX3C1w6LMVl1+h04ZUH2slqEpjhimzEQxLiJMxrl3CrTlIH7NtO1JsCrNq4mUosFfpGpjk2bBDMJ6Azz2h+xW+7uEkQzMQRr4ceR6LDo3DzP0RnW8tfCcPBXS4ISpECWBZMNubEZ+xjeIJkGyrl9POy6YHFii/EQBMXj6seNwdEIYl8DUmgMaO1XpOR66IIgFvXrQqLHAFeOygFhZNcxHUmNxwmit0QC4pGV+hc2NfTIJdwQvWXrji6ho61MCZs4EdIaqSfp73CW4xlhjMsLuZSxD1LdIXO9gElrV7l99IwwXlqWidxRVK7B0IIcJyQnR/BL72JYyB+csxAAJK4/ZB7F1hoZoq+fMwbXsiM2FjpkPJ7NHgZILbnNEE3CGO7IJ6Wo56cuN195mH19emD5CUU0xKk1rD2N/+1Nq5A752pf1FSCvoDx1TILQAI+DL5YMaeZ58zDaPZh9aqKV6rLRFK2Fppk3WD/ZGBqp9/qxPYcPOqcG/yEtsfP5GAr/nduun2bKtSmWbMTUisHmzXT7ZoMpH78+ZxoDG8G+g6ZMn0WvfRlHtubamoD8YqRxVCTpq28jOHa05eFvkqt6fBLJpbzPtTFMpGwC6b/8+FkMGgyFGxXbrVc45NSP0g6RlLK8LpIX40iEEYxrPcJMq7Go6cka4sdUJStl4aQJpy5nrAGLaJtelnVXbEUngZVLM8VIOyZGMcbVy4f4kriPA1TW+3f+tGg3H6SoyqMCDwmm7o+VSY+ImTtlJ16NWdWx7rUEJLZGQ5SkBDj6etPFf0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(55112099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVE0TG1KS21Qd1RrUmxsMGw1QW90QUEyNm5GT1M5NHRwZmVldUNwVWZTUVFF?=
 =?utf-8?B?dlJNSzJod3gvNmlYVnd2UmhBZDBxYmNPNDFIK3daVU1jSjdpYnd4SVJZMjQ5?=
 =?utf-8?B?WUQ4V3YxZ1NQZ1ZIZVNqZ09YVGgxVlJNc0hSM0YrQ2poWkV4aGtVWVpZSDRz?=
 =?utf-8?B?RS9vODFNdkZwTy81a28rMHBJbmdPQXpXR1FjcUhyR1FyTG8yNWdUWVZuazZH?=
 =?utf-8?B?ZUcxQlhaYzNjRDJDZVZZcHdVajluMitDWFpmTEZHMFFKOGo0VGV0azg4S3lC?=
 =?utf-8?B?dnhVTmNLeUV5ZG1VSURXOUVwWTFUNGRTeElQMTlIS1NLam1MUHFxZ2Z3dzZE?=
 =?utf-8?B?eDNWbUlEcDhVa2lqSWhYVHRTWEFoelVnanZGQTF1WjFMRENqcmcySjZoQjFs?=
 =?utf-8?B?NUFoTDVpSVpzaEFEZitSNFhmMy9wNVdiU1ZNSFBXT1cxdWJ3Y1JjdGo4Y24z?=
 =?utf-8?B?eStsdXA3NGVyeVpKdW5YQTVxNFA0SWViK3V3U0R4R2p3czhtMnpRVjhwK3Nm?=
 =?utf-8?B?cnRQd0FEeGpLcHQ0RVpVa3c4Wkg2OWY1ZGZqN3dTaG1razRkRVVFbllZV2M1?=
 =?utf-8?B?ZkhVckd3ZWdiNkh0MXZGaWMwR3Z2VTRSRDVHZjBId2UvZm1EakRJQklYSm04?=
 =?utf-8?B?SEEwNEE5dGViU3hZM3NrMERpdFRlMmVnQWNuaUpKU0FCUnBpcXg4aXY4TFM1?=
 =?utf-8?B?SzJJWERrSWlERFpOL1RYU1Z2RS9pZWhyamJ6TkhqSG9ISnpFeDZMdG1KQUlS?=
 =?utf-8?B?U3NWUmoyYWFPTWQ0ZmZkRnY4amN5azN5V2ZHTzJhWUFHQUtoajNXblR5cktH?=
 =?utf-8?B?dVVheFRvUHlEdFA1K21tK0JOeFhGeFM0RDFhUUZZN0NscjVjVDV3MDNKTy9R?=
 =?utf-8?B?ckl0TlFHdTBUcTVQVWFySUVxTnl5TWtCQldHSGpjRUl0NEZtTjduM0o3V1BV?=
 =?utf-8?B?bnh4K0xpVHlLVi81d2wzeTA1cnBRU0ZBMnlUdDJIWlVOY0ZtdHFUN1RLQytx?=
 =?utf-8?B?aEpNb1hsS29oT3kvKzFlTUlJcTVrU2FtSFNlRWVIZnlObVpqQnQ5b3hiQ1Bt?=
 =?utf-8?B?OVMvUG02M00yRlpVMVQyRXZEVS9xc1I5c1NRR1FsZG02OVRGUXhvejk5TnUz?=
 =?utf-8?B?S2NwTXlPVkozMHdvYnZ5a1BrbFc3MzFRV005UlF4Yk82dlpqL3lCMnFJRnc0?=
 =?utf-8?B?bjR0ZUFGS051N1ZoNFRLVWRjYys2a05RYU4yYzlNL1M1QnRDbVZCZmtGWUlH?=
 =?utf-8?B?OWlzc2FaS1FGOHNPbjVtNEFKZ1BDcTlRai9UeElBRWJBcndnVmgxUE5iN0Q2?=
 =?utf-8?B?V05DNGR6UGJ1UWcwMWdSMXh0MEhyUkREWmh2MlB2WitpeHRHSEpPMHAwTmRG?=
 =?utf-8?B?ZG9aS1VTaEtDNWJGYW9WYWtsOGdHR2EwVDFkaWpOQ1VQMWhuZTkwN2RrQTRR?=
 =?utf-8?B?UUJXN0JJVVZVaFZxbXhCUEFvSmlyRERlVmRGaG9uTDdSalZCQnZiNVpiWGJQ?=
 =?utf-8?B?V040ZDkvSVdHU0c0aFovT09teVZBa204N0NmMWtXNTlkNnF1VmhycTFqaFA1?=
 =?utf-8?B?Z2NqRGZ2M0ZsYnI2YVRuNGo5eUk1WHRFM1k1N09sWkVUakE4OWJGeXh4L2lC?=
 =?utf-8?B?aXNDdU10RXM2UnNSeVZqL2hCcW0wZW1pU2Z6eVZ3QmhibU1zUVNZaHpNdnl0?=
 =?utf-8?B?cjBVNFJ2Q2N5b0kwbzBJSk1UUW4xb1k0c2o0NFVPZ0d0K0FudzVpVjV2blpO?=
 =?utf-8?B?V1B6QUErV1VFOU1FWlpmOWxCM0YxdkFWNFJLQW1rZ2lrZGNLaTRxUGFwSkgy?=
 =?utf-8?B?V29mQkpidkZSZDdESmttdWtGdDI3amRhTWh5WjA4YzdvZUNFSW9Vek1kNmhG?=
 =?utf-8?B?ZFNmamRhQlUrZjJZdUdHajBvSU5YS1lhSGNzNTRFeHkxc08yVG90eWhRRFlW?=
 =?utf-8?B?K0tJTDI4ODlOK2I4MzBRY3FLWm91bDlqMExWS29UUjIyeFE4N3V4N1BCOHBx?=
 =?utf-8?B?YjZiUUx3MTdab2hURy9CcHl5RkhUTHlBU1FISVd0R3VpUVJvKys1TnRxenZk?=
 =?utf-8?B?a0c0TzRXeHEzWUN6T0w1ZDBTZzRoZGx6TkorcTVXNUh1OElxZ3BJVW4vSGlV?=
 =?utf-8?B?RTJCM2lmT003Z1FMMHBna1AvTVFTTlJxcU9YWXliNWcxVENHZ2czT1pMTkJy?=
 =?utf-8?B?STVBQkpiSUt5QktSeWRSejNpRVAwblFNb3JmbDY1UkNHVTM1OFVTT1J6TnA3?=
 =?utf-8?B?cTBUR3dHVnVqU2NyRUUzWU84NUplelRTU1ZEV0FjM00rWjZhTzlwdTFVUGhD?=
 =?utf-8?B?dkttaGVLS1VoeVhSMGhYZFFWT3VGcXpDL1J6aVBYbnlqVGMvWHhtUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ae63b769-5992-413a-f461-08dea3c91eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2026 19:22:13.1639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEzdGCFSHtBjfYU3cOABrwWpVY4yzQ+EOjXoOJ3vpkBKri0pZfl3ZrYyig6iGwTd7fJqW+2cbZkTskXo4FEdmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 19:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235969

SSBoYXZlIHNlbnQgdG9uIG9mIG5ldyBmYWxzZS1wb3NpdGl2ZSBjbGVhbnVwIGNvbW1pdHMgdGhp
cyB3ZWVrZW5kLg0KRm9yIG1hbnkgSSBjb3VsZG4ndCBmaW5kIGFueSBleHBsYW5hdGlvbiB3aHkg
dGhleSByZWFwcGVhcmVkLg0KU2luY2UgdGhlcmUgd2VyZSBhbHNvIG5ldyB0cnVlIHBvc2l0aXZl
cyBJIHRoaW5rIHRoaXMgaXMgZmluZS4NCg0KQnV0IHRoZXJlIHNob3VsZCBiZSBhIGZvbGxvdy11
cCBpbnZlc3RpZ2F0aW9uIGZvciBtb3N0IG9mIG15IGNvbW1pdHMgdG8gaWRlbnRpZnkgd2h5IHRo
b3NlIGZhbHNlLXBvc2l0aXZlcyBhcHBlYXJlZCBhbmQgaWYgdGhlIHRvb2xpbmcgY2FuIGJlIGZp
eGVkLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJl
bmphbWluIFJvYmluIDxiZW5qYW1pbi5yb2JpbkBib290bGluLmNvbT4NCj4gU2VudDogV2VkbmVz
ZGF5LCBBcHJpbCAyMiwgMjAyNiA1OjMxIFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnOyBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkNCj4gPFBldGVyLk1hcmtvQHNpZW1l
bnMuY29tPjsgcm9zcy5idXJ0b25AYXJtLmNvbTsganBld2hhY2tlckBnbWFpbC5jb207DQo+IG9s
aXZpZXIuYmVuamFtaW5AYm9vdGxpbi5jb207IGFudG9uaW4uZ29kYXJkQGJvb3RsaW4uY29tOyBt
YXRoaWV1LmR1Ym9pcy0NCj4gYnJpYW5kQGJvb3RsaW4uY29tOyB0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tOyBCZW5qYW1pbiBSb2Jpbg0KPiA8YmVuamFtaW4ucm9iaW5AYm9vdGxpbi5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCAxLzNdIHB5dGhvbjMtc2hhY2wyY29kZTogVXBkYXRlIHRvIHZl
cnNpb24gMS4wLjENCj4gDQo+IHNib20tY3ZlLWNoZWNrIHZlcnNpb24gMS4zLjAgbm93IHJlcXVp
cmVzIHNwZHgtcHl0aG9uLW1vZGVsIDAuMC41DQo+IHdoaWNoIGlzIGJ1aWx0IHVzaW5nIHNoYWNs
MmNvZGUgMS4wLjEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBSb2JpbiA8YmVuamFt
aW4ucm9iaW5AYm9vdGxpbi5jb20+DQo+IC0tLQ0KPiAgLi4uL3tweXRob24zLXNoYWNsMmNvZGVf
MC4wLjI0LmJiID0+IHB5dGhvbjMtc2hhY2wyY29kZV8xLjAuMS5iYn0gICAgICAgfCAyICstDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29k
ZV8wLjAuMjQuYmINCj4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hh
Y2wyY29kZV8xLjAuMS5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDgxJQ0KPiByZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8wLjAuMjQuYmIN
Cj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zaGFjbDJj
b2RlXzEuMC4xLmJiDQo+IGluZGV4IDkzZWQ5YTI1MzA0MC4uOTA0OTQwOTI2ZmVlIDEwMDY0NA0K
PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2hhY2wyY29kZV8w
LjAuMjQuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNo
YWNsMmNvZGVfMS4wLjEuYmINCj4gQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIg0KPiAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDU4MmYzNTg2MjhmMjk5ZjI5
YzIzYmY1ZmIyZjczYzkiDQo+IA0KPiAgUFlQSV9QQUNLQUdFID0gInNoYWNsMmNvZGUiDQo+IC1T
UkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZDhiNTExMDU0Y2E1NjRiNDUxNGI5MTg2ZWNlN2Y1ZWI4
MDQ4Y2ZjNWRhYTY2MjVkZWYxYTNhZGJhMTNjNGY2NiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9
DQo+ICJjODU2ODIyYjQwYzMzMDQ1MmI4YjMxZTk0YTY1OGFkNDU5NWE1ZWYwM2NkYjc1ZWE0MzJl
YTljNzNkMGNmN2Q5Ig0KPiANCj4gIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nDQo+IA0K
PiANCj4gLS0NCj4gMi41My4wDQoNCg==

