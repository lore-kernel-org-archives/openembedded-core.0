Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C631125825
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 14:03:04 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21740.1773237779298897802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 07:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XYZE9Mk6;
 spf=pass (domain: siemens.com, ip: 40.107.159.37, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2zbrX7Vi9d2Jv3rlHWURV3vQogEI6jEMIJOgiK+Tv1hMKPRdm0XadOU3xMjSlH2kHLSnS/TIhEEQ/BCkYJav1ajo05Ly0lURqUHtJtAxr0QKg/Evy9TLl1J2QVMV8g6CSWIBRZZQnU18TxdLTHr62nw2dEvGJOdr477q1FhvX8WN4hRYGmwhE1tJqrUBv7z0V2Hh5yJuUKogdCFNKeh3BJSHqf6o52omcpBlls/RiJtkUOjzRJFzN4MQoiVBocX4PoDcj9FKb8kYKNGtUnfoVvnCf2eFt+QLyCQ8RJeeFEUtpow2PlQ1QXXfwOvAuZKsG8BDtw40L4rzh3jNRWuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8mm/LbLtFO3nkYse0nCjUoXdwd4dN0EtAT9RxfM+cs=;
 b=Gn3exBcSx9cVG6jVHmUwNoZYLn3l+HryRoxWVz9KUFmCGIFJVYQaCJ1eS6a8cyAqkKoF2QkeRKHFr4OehMQa2kYf9LL0GdF6QVmvWAFZ75/EV7qAiXagDJMINX1lLcpqcBKYu0cP96Xu/+KuayMX1MHsBwqFTZ5Ufs0IMSDE8I2hLOIKM+27AohPbfM4J30cqWu+zHb5sr6A5g1HZQwfmBE33sukqL3TYLFxCHD5+u+xC4+oLLS9PrAJKrn/5TeDIHYUVJW97AeqtEorXGNEQ+9idwepR9hjsRq8sXhoXF9XviuHVz7r6ybbys9EDA09WscPMhSQ0jKw2wCSKgs5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8mm/LbLtFO3nkYse0nCjUoXdwd4dN0EtAT9RxfM+cs=;
 b=XYZE9Mk6iOVzuDE1M+UHpmIwGUNeHZORzjPoKOVExRFJWV/BqrQqZuP2gjXE9BW0Cfid3JZppHJWOkM0yrHZ71pt6xmPh854l/qPTVssUlqoU0rNKw+BYrzqvMN8Ku2sZtHaF6NIrJqfc0VpHgG3YLCU3sQNTWHcInj1ctnLZxKLFVanMs5moSntDgofnIDkdsSa7cbTvswIOpRdiVAFwBmnB8vvCOUW1/p6a0F2IvgHsH9JDaJBqMtPTpQbsbg5mwXW0dWDoQZWZB5zLZCT9MAZO5ymzzQdvkP6PN/hzPpUhl0JUsWb6PMugjgPujNxvQ5E8bdIWfevA4YT/h7zJQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3481.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.13; Wed, 11 Mar
 2026 14:02:54 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 14:02:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
Thread-Topic: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
Thread-Index: AQHcsVK5X2TpsUomhEOtITNyffU12rWpRWBQgAAJWgCAAAdjQIAAASaAgAAFVaA=
Date: Wed, 11 Mar 2026 14:02:54 +0000
Message-ID: 
 <AS1PR10MB5697D86B88010E0EE7666332FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260311122922.4160133-1-zboszor@gmail.com>
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <8be68784-e846-4ddb-9127-e4e6082347aa@gmail.com>
 <AS1PR10MB56979EB1C738893C31052E3EFD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <f2f689b6-1600-40dc-94d4-6de8906b2490@gmail.com>
In-Reply-To: <f2f689b6-1600-40dc-94d4-6de8906b2490@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c1785414-3dd2-4375-84b6-6d581fa71011;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-11T14:01:56Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3481:EE_
x-ms-office365-filtering-correlation-id: a37e5793-107e-4e0e-7ea3-08de7f76e3ff
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 O5wZpbXbXmE4OIKcO9lzBXNXMYr+mkCO8rg4+u+esU61GyNY2vVc+dkY5HuP7DMzQz/1EFwCc4fkVgXJB1ulFuP/CDswqCwEu+8sK3bfRiTto4d6vWruTtG5ukc1Fqg3b3m8hUP6E9BchzA00jFaufFi0e4l7VeKtPm6C0I9p2AOnILsGHGjA6VWk2ZbKVekyuVew00ksylgCjE2w8ngGzT2EFt02UY75HXBRtRYUclvqot0dTv7cTSQRV0AXj+jyrB57ORSRQwew4MH5IoNbHX4TcXsNQ7gOWYxVcMcTFgU+uiCbq7t6uqw7VDG+eWnmtGF45OQ86VJ2GM58RIjC1hXq3V1HUJRTEdNG58fMPrrKoczDKB2tLPsg33EDFB98GZ8YYGTdUgFOvK0MNYlWZDeDNztH60bXah+q0h7x2Tgo0r8wJvX8JAb0PV+R/LsTCHsE+ANYBWqSGAU1NdjtI96sKDheKAGtlf0lfWuMQl2OE72fx5cRmN2rnWRBSoowQ0KqQ/HBbnlmC8UQKkwJyIDtyPInX/xL9hv193wYoesEWTKfoUtiqcqfZeMYfuZFF1JI571/tj/neRrD4i1eLyJOf68gRHS3E7JD5H9dsxZhuO640uf0KZTMrV+EpEGW1L2vsO0sEM2bEYBbOURCaBDqkOEIVQs/c1IrwhFXA5guwOPGQCKbIWd4hV5aU8MFWh23Z2FlumXRCefEXJyb2Lvp6N9ZU+g6CdrfnHC1s8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VURYR1FNUDNOOWFqdGhsbk92cy92YUpGSVc2NTdHWmgrWW1hdngzMXhuelA4?=
 =?utf-8?B?N2dZZ2luWDdOb1VXdlRoS3VPbnZOTTNqTFZjOG1pWEFPSENZT1pTcGJDWEwx?=
 =?utf-8?B?OSt1MlVZTE9OOEltZWFqQnFlcVA0VTBIeTVVM3EwQ3VKR3ZjUFcyQk4wOEJI?=
 =?utf-8?B?YVZFL282eDhBZ0hHZ2t0bDl2elhPUFRtOVdnM2lnZTdHZEpOa1dWZTY2TGNt?=
 =?utf-8?B?b2tXbkJTcmIvc0RWbjF2cDBlTHhDbzNSSmdjenZFTytObW9OeE01RWcrOUR5?=
 =?utf-8?B?L1RmRklENG1Ld2tGem95VEtYTnRNSUxnZEtwNTZRVjM1OUlkWDFPeTZxQWk0?=
 =?utf-8?B?ZmFrTUF1M2RENmJwVkg0U1ZCbWdlc00wR05jRGxOQ0F6b2NOQy9sOWJVN1BN?=
 =?utf-8?B?MmpUN3lEYmJRWEl1QVFUT013V3FpUm9HRHV6QWRVTktNZWx4QjFwY3pROU5W?=
 =?utf-8?B?MU91UkJYTFJwMEF1bFNJWTRjcktSTXFuOUMwVXZuQVBaZUdhSk1zbWpMVENo?=
 =?utf-8?B?K3hkb2hDNDJpbVhnR1hSUTdxb1pTUVBjVUtmdFR2dTY0VmtGcFY4UXk2cHAr?=
 =?utf-8?B?elkvKzI1NXFJeGw3T0I0M3BXb1MzeVVuaUFaUGpqZktCTkhRNnFUMFQvd0wv?=
 =?utf-8?B?ZlZtTERMVzhKWW5oYTJicWJXRjJzMTN4OHFiWEpuMVoxY3dYTllJUTZxdjIx?=
 =?utf-8?B?SUloRGhMclY5cVBZdHFxZzdvenVOYzl2NUt0NEovdmJ4dlBQT2Y1dmR5TUFi?=
 =?utf-8?B?bWJCbTZaZ0xtaGpIK3RrSjZNbEp2UDhzM09tVWY1dmdrZUc5L1BwYkZJU1Bz?=
 =?utf-8?B?eHBRaU9RUWVhMFRNT2V0OFRsdXQwdTZtVkRLNFNCQ3ZZYVQ0bUgxUlFtNFpm?=
 =?utf-8?B?Mno0dnU2VW1GY0VnSzJXN0NlMGJuYnZMcGtGd3pEcHVzNFVSTkZjR2dkSCtG?=
 =?utf-8?B?d2s2WllObW9FenBYNGZMbHkvWmJyYVVHaUxoNUgraG5vMk1EcHhvaWFuYnVP?=
 =?utf-8?B?MU5mZitFRC9SUGxUWjNCamczVDFCdkgvQUdzOHlRQVhkOGhaM09sOTU4eUJr?=
 =?utf-8?B?QVdGcnhaM1dqOTliYnBDN3p1alNiT2VjeXF4ZmZHMVBIVkIydjhrb1pBMnp5?=
 =?utf-8?B?S0Zkd2traTBWQnV1MWh1cjk4eFg3Szhpakx2Tm1DNXZDUldpM1B3MG5wcFA1?=
 =?utf-8?B?UFA4MTdXTnVNcnJ2VUlWUVpSQnczdVFkZ21ieURxaUZNemZRY21mK3hYTjcy?=
 =?utf-8?B?cjQ3VWExdXNENklhdkh6MlZ3QndCckdyYjBBdmp3QzdNQXF0RjFFcGFqMXB3?=
 =?utf-8?B?WUhrWEZVN3VsQU9kUEZSNFAyT2xjY2hDZzc1Ymk3QXNkM3grRDdsRjc3OVlJ?=
 =?utf-8?B?UjkzVVZrandDcTNUbWtvSHNsd3V5T0c2dlpNRkZ4dHNGQ05ZZjg0THo3RWRH?=
 =?utf-8?B?Mm1vSXB4eXJ6NnNJS1VCdFdqclk3MkRQTnlqc1JtY01Ocy9hbHFkaVh3NmVZ?=
 =?utf-8?B?SFhRN0s1OHZsbGh3ZUY0cXkvZ1crOXB2bU85Tm9EYktZNmU0ejlVR2JrbVRl?=
 =?utf-8?B?d3dXR0JsV09vS1BNWW4xUGp6Y0xRelU4ZlBZSWo3S2pIcXZpNm90aGZsVGNU?=
 =?utf-8?B?Uko4bW9FUkdDN2dsN2JNTWw0Tk5qMDgzUktCVUJlSG5TclJaTEJtNXBEeCtO?=
 =?utf-8?B?QkZaWFZFckZCT0dldmx5Y1NrbUVPZEJBM2IxTTVlWkFLK0Z5Rlh0ODJMZkZD?=
 =?utf-8?B?b0YwaVJQMVBMVHREdW5Tc0JVRWZjN09ndFJxNjZVcDltOFljbUJrM0FENlht?=
 =?utf-8?B?SWZyNGhDQXU4K3ZueHJFMFVvRXZEVHhFeW53czA4bm9YMGIwcERKa2NsN1VG?=
 =?utf-8?B?SHcweE1iY1ZXdzF3SFh3VHViVmlOT2tESlh5SkE3NUtIMTVUUHAzYVVDZEd6?=
 =?utf-8?B?Tm9vQkJKOG14VXRudFJpZW9ydlhzSWNtU050dXBhTktONFkzeWNRcEc3UmJ1?=
 =?utf-8?B?RlhRZzhJWERCZ3lqdzhEL0RzTklTZWdzcTJBV2dwUENQclplTFViZHRlSFky?=
 =?utf-8?B?L0xWNE5WVzlWS0hnYVUrY1lYU1EyVTk5d0VWbkl3aUxvWVQrbVVCUUFJa0xi?=
 =?utf-8?B?Nm5STzZNMXlIQUlBSmE5TmF4WlRvVTc5ZGhiakZGRTd6L2I5OWRueGMwRjM5?=
 =?utf-8?B?dE9IZzJYRnJhTTJEc2xVZ0Y4NWl4anZDeHZoNmVPOHkxZ0dCYmdib0kySUtt?=
 =?utf-8?B?NzNJZEdyd1dHV1FEZmQ4cVFITkE0MkZjeTFPWm1kakk4dHBreGxEdy84TmlJ?=
 =?utf-8?B?YW9pUzlreWo5MCtzcEVTTUhNZnVkY3B2bXptY3dYbHpSZlE5Uy9CZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a37e5793-107e-4e0e-7ea3-08de7f76e3ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 14:02:54.0913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WRdQpDs48LNr6IPlghmzvroGUlCvNRdSc3B9k5G+RSKEQJnRccZSd0wGvRrJQbjhNwzMzqbeD7HXvHAo1qb3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3481
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 14:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232888

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQsO2c3rDtnJtw6lueWkg
Wm9sdMOhbiA8emJvc3pvckBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTEs
IDIwMjYgMTQ6NDMNCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvNF0gYmFzaDogQWRkIElO
U0FORV9TS0lQPWJ1aWxkLWRlcHMgdG8gcHRlc3QNCj4gc3VicGFja2FnZQ0KPiANCj4gMjAyNi4g
MDMuIDExLiAxNDo0MCBrZWx0ZXrDqXNzZWwsIE1hcmtvLCBQZXRlciDDrXJ0YToNCj4gPg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBCw7ZzesO2cm3DqW55aSBa
b2x0w6FuIDx6Ym9zem9yQGdtYWlsLmNvbT4NCj4gPj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAx
MSwgMjAyNiAxNDoxMg0KPiA+PiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQ
ZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+ID4+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS80XSBi
YXNoOiBBZGQgSU5TQU5FX1NLSVA9YnVpbGQtZGVwcyB0bw0KPiBwdGVzdA0KPiA+PiBzdWJwYWNr
YWdlDQo+ID4+DQo+ID4+IDIwMjYuIDAzLiAxMS4gMTM6NDQga2VsdGV6w6lzc2VsLCBNYXJrbywg
UGV0ZXIgw61ydGE6DQo+ID4+PiBUaGVzZSBJTlNBTkVfU0tJUCBhc3NpZ25tZW50cyBhcmUgd3Jv
bmcuDQo+ID4+PiBVc2UgR0xJQkNfR0VORVJBVEVfTE9DQUxFUyA9ICJhbGwiIChvciBzZWxlY3Qg
anVzdCB0aG9zZSB5b3UgbmVlZCkgaW4NCj4geW91cg0KPiA+PiBkaXN0cm8uDQo+ID4+DQo+ID4+
IEl0IGRvZXNuJ3QgaGVscC4NCj4gPiBJJ20gbm90IHN1cmUgd2h5IGl0IGRvd24ndCB3b3JrIGZv
ciB5b3UsIHNpbmNlIGl0IHdvcmtzIGZvciBtZSBhbmQgZm9yIFlvY3RvIEFCLg0KPiA+IERpZCB5
b3UgYWRkZWQgaXQgdG8geW91ciBkaXN0cm8gc2V0dGluZ3MgYW5kIG5vdCBqdXN0IHRvIGEgcmVj
aXBlPw0KPiA+IFRoZSBleHBsYW5hdGlvbiBhYm91dCB0aGlzIGlzIGF0OiBodHRwczovL2dpdC55
b2N0b3Byb2plY3Qub3JnL21ldGEtDQo+IHlvY3RvL3RyZWUvbWV0YS1wb2t5L2NvbmYvdGVtcGxh
dGVzL2RlZmF1bHQvbG9jYWwuY29uZi5zYW1wbGUuZXh0ZW5kZWQjbjYxDQo+IA0KPiBJIGFkZGVk
IGl0IHRvIG15IGRpc3RybyBpbmNsdWRlIGZpbGUuDQoNCkhhdmUgeW91IHZlcmlmaWVkIHRoZSBm
aW5hbCB2YWx1ZSB2aWEgYml0YmFrZS1nZXR2YXI/DQpZb3UgYXJlIG92ZXJyaWRpbmcgdGhlIGRl
ZmF1bHQgKG90aGVyd2lzZSB5b3Ugd291bGQgbm90IHNlZSB0aGUgd2FybmluZ3MpLA0KU28gcG9z
c2libHkgeW91IGFkZGVkIGl0IHRvIGEgcGxhY2Ugd2hlcmUgaXQgYW55d2F5IG92ZXJ3cml0dGVu
IGxhdGVyLg0KDQpQZXRlcg0KDQo+IA0KPiA+DQo+ID4gUGV0ZXINCj4gPg0KPiA+Pj4gUGV0ZXIN
Cj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+
ID4+Pj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgWm9sdGFuIEJv
c3pvcm1lbnlpIHZpYQ0KPiA+Pj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4+PiBTZW50
OiBXZWRuZXNkYXksIE1hcmNoIDExLCAyMDI2IDEzOjI5DQo+ID4+Pj4gVG86IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4+PiBDYzogWm9sdMOhbiBCw7ZzesO2
cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+DQo+ID4+Pj4gU3ViamVjdDogW09FLWNvcmVdIFtQ
QVRDSCAxLzRdIGJhc2g6IEFkZCBJTlNBTkVfU0tJUD1idWlsZC1kZXBzIHRvDQo+IHB0ZXN0DQo+
ID4+Pj4gc3VicGFja2FnZQ0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBmaXhlcyBhIFFBIGVycm9yOg0K
PiA+Pj4+DQo+ID4+Pj4gRVJST1I6IFFBIElzc3VlOiBiYXNoLXB0ZXN0IHJkZXBlbmRzIG9uIGxv
Y2FsZS1iYXNlLWZyLWZyLmlzby04NTU5LTEsDQo+ID4+Pj4gYnV0IGl0IGlzbid0IGEgYnVpbGQg
ZGVwZW5kZW5jeT8gW2J1aWxkLWRlcHNdDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBa
b2x0w6FuIELDtnN6w7ZybcOpbnlpIDx6Ym9zem9yQGdtYWlsLmNvbT4NCj4gPj4+PiAtLS0NCj4g
Pj4+PiAgICBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoLmluYyB8IDEgKw0KPiA+Pj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2guaW5jIGIvbWV0YS9yZWNpcGVz
LQ0KPiA+Pj4+IGV4dGVuZGVkL2Jhc2gvYmFzaC5pbmMNCj4gPj4+PiBpbmRleCA2MzQyMDljOTEx
Li5iNDNiMWNiZjg5IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL2Jhc2guaW5jDQo+ID4+Pj4gKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFz
aC5pbmMNCj4gPj4+PiBAQCAtMzIsNiArMzIsNyBAQCBBTFRFUk5BVElWRV9QUklPUklUWSA9ICIx
MDAiDQo+ID4+Pj4gICAgUkRFUEVORFM6JHtQTn0gKz0gImJhc2UtZmlsZXMiDQo+ID4+Pj4gICAg
UkRFUEVORFM6JHtQTn06Y2xhc3MtbmF0aXZlc2RrID0gIiINCj4gPj4+PiAgICBSREVQRU5EUzok
e1BOfS1wdGVzdCArPSAibWFrZSBjb3JldXRpbHMgcGVybCBzZWQgc2hhZG93IHV0aWwtbGludXgt
DQo+IHNldHByaXYiDQo+ID4+Pj4gK0lOU0FORV9TS0lQOiR7UE59LXB0ZXN0ID0gImJ1aWxkLWRl
cHMiDQo+ID4+Pj4NCj4gPj4+PiAgICBSREVQRU5EUzoke1BOfS1wdGVzdDphcHBlbmQ6bGliYy1n
bGliYyA9ICIgXA0KPiA+Pj4+ICAgIAlnbGliYy1nY29udi1iaWc1aGtzY3MgXA0KPiA+Pj4+IC0t
DQo+ID4+Pj4gMi41My4wDQoNCg==

