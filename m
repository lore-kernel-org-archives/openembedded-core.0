Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A844CCD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 12:54:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36093.1779800082064631189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 05:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Wl8ew1uA;
 spf=pass (domain: axis.com, ip: 40.107.159.16, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrWcb9zR18p/8G+KqarxqYetdeayVMoMv6eFr81oyguaRoNZyDwdOLkJYNgJSaNPrXgH4rZ5B9RZvcn9kZS6A5oHw3OHYJywZd+/VWtShPBqCpjTV+IO0vm/Qn9p6N99gMEdl7+uJc2FGYcoS24ySpu/s/JRDw3G1Ed7+kubInDgiSw3N79CiIiN0tTulShwhGM3Hinte0mxUe4V02fTgh5KlfXvoX/LQTxMESiZ5EABw1yC/+erV1uvknPiMiyO3pO1XNSJEXdIgMeHOVh0xD6ji8CoEmdKkj0esVo86oVxlaRJXOosthHu++RH2w7Hur2yEgRXdkOwUJGtZElktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4peLJr9jJ/30BXXsw7tehJBtpaInl94SxXhvKb8YT8=;
 b=LsbmL9yR0ym3dzG+PT1p9DbfKrnVoqtt9JFTsGeChvGaqJzPcZgMFcJolbeOogDi87Y1PH+TARYx5P7YcQ6nLliyPcMYhh1taB5BWzCRdsf+6NI/PzH87GIZ4ji0Q8h1QrxS8tHKDjaRBAurxvxXGKLfv2372kJE1A0aCJskf5w1MRnDf6aK//6vRBFG+ELTz1Moutn2bSI+qH8D74Rai07HX7gqo+arRQhidzFZnN6YochXxQ9F0UtFPiRQaz1tkF0/aM+LWX0whrvQsUV5PzrSzKajbBh5e1jARKiun31hCZBsigymYHpUfKFaQEHpBGMPxIHkZqqUsRtSunJwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4peLJr9jJ/30BXXsw7tehJBtpaInl94SxXhvKb8YT8=;
 b=Wl8ew1uAh9TuoqGq3c91Q0+tpU/Y/YvwpwKc5R8WDE0exkvZF46HDAro+Y3Co01PXAayBZVE1KYnxmsDWl5YWGruLe3ys+nWz8utFXi/SP2waS2ArN6mpW2sReEoZU19u4b0ZO2ZTYRVJXQ9WzY2fjvsZkmXQbhjYr8bsK1VlfE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB10996.eurprd02.prod.outlook.com (2603:10a6:800:265::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 12:54:34 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:54:34 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 4/5] useradd_base.bbclass: Emulate the groupmems
 command using usermod
Thread-Topic: [OE-core] [PATCH 4/5] useradd_base.bbclass: Emulate the
 groupmems command using usermod
Thread-Index: AQHc6fcY/LltX9JzOUC4QVXn0fkFq7YgRuRw
Date: Tue, 26 May 2026 12:54:34 +0000
Message-ID: 
 <DB5PR02MB1021350308F4F89BB0B0CEB80EF0B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260512190415.948535-1-pkj@axis.com>
 <20260512190415.948535-5-pkj@axis.com>
 <D12670FD-C09F-4233-A365-2002C29DF595@arm.com>
In-Reply-To: <D12670FD-C09F-4233-A365-2002C29DF595@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB10996:EE_
x-ms-office365-filtering-correlation-id: e40c762f-33ad-4046-3a84-08debb25efd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|4143699003|3023799007|11063799006|18002099003|56012099003|22082099003|20052099010|38070700021;
x-microsoft-antispam-message-info: 
 5BgLknUtqexf1Nv+O3s+Y+HqGNn/ccu9p9JflQEk7NjO6QkqhqZPkTNLZeD8fo8enm29AygYyAu1Ee+wu97bb0ORZAurmQe2qjz2fDzn8sykUUwg8IJ7jPoj7+HSjY9NYPtlHv/T+tPMcq6Li/cqTsri1000T/FEzHX4vlkH8Zy9e/1YNwNIfZ/80Gvbh/+87LQs8p1EPfm8UaHTu5+fftjuCOuMJhHM8C394mLAQeBm2Xpi3bO9zwuZ2vtR0mdWk7FjVpOGXbWUuvTopzDHS1/rJBp10vD1dPscaAG7eO0hRPPkwl+Vn4eVgeauiuQOs+XpJ2oPJ4RcbgWh0iriUc198PsobgWwhWdK76qd4dGB15EyCNzOLfGRzrRa8O2OIBtbMxJFcyvTNTSBsMYiTa4GfKpxMmYqu12cR8h/KjJpaf5hO1cM3witMnaAQ/sEQFPa2161+r7kQtm65tB873eABY4l0a1W18mjoW+/mszzrlIYdib8UdsCMc2N0W/IFccEtFBTm9kkf1OQCcegrJm8+txWxWWASvLmUEVhTDxQQ+CpKijPntAvQJhrh4T17PSq33K66VLRiyakakoJ57HuyKKFKxrWMUi9ZRX7Bs360z7sddl4mMjLHfrG95P/QjtMPOzuhf+TmKLAml9z7XVsdKAI388nPGSbjUXgCpFn5BZn7bYbLwvwXDoBNgCK9WhDtiGSHngF20dGXJZlooHAfIwpNaItkUFKcSghB7g8LWfwy16036h7RSqyma6+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(3023799007)(11063799006)(18002099003)(56012099003)(22082099003)(20052099010)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmVJWkVNSVl3NnUzc3NGRDV4N1AyZVowRG9rN1FUOWJkQnV3SW9xdHJoUDQ4?=
 =?utf-8?B?dHVHVlJteFNvdmlLK0lFbXBXOEV5S0Y2OS8vUnF1bEs0RDVGZUZ5NUlNSFVm?=
 =?utf-8?B?UjAzNkdBVG1pb1dQWXQrVnBwMGQ3aCtrczVvY0dncVl3aDJHOXF6SU8xWUhj?=
 =?utf-8?B?OWtybjNHazJrR3hGZjZ0amJTUy9DcG9JS25keEhBM0I3T2Y4QXdsNzhTWDhV?=
 =?utf-8?B?RHljdHBINVZnTGVnT294RUNtaTlKem4yR29jemVvV0h5VVJDL0xEWkdrWGVz?=
 =?utf-8?B?Z1ZMTVZ2ajJ4dFhrbFR5Zk9uMkQwTDljblFxTTRUSTZXa3FJNjN2eWJFMzVN?=
 =?utf-8?B?bG1QalE0YXdGQlFaU0tPcEFXcXNqUmtRQkdqUUw0Ujk5bWExMm1RcWZsa1Z4?=
 =?utf-8?B?OHg0N2RnL1Azb0VWcml0QXVxR0RxcndBbFc0ZG9qaitIV2xUN1ZUY2U3Nmti?=
 =?utf-8?B?SG85SlM5cERkdlZaLytnOTh5TWpUeEdLWGRLa01rb0k1K1hQbUlxQ0xlRzcw?=
 =?utf-8?B?RFdVcVMvRlVlUmg4QlE2eU9tTjR2TUo1a05aS2pod01YaDNGSXRYWVdJT2V1?=
 =?utf-8?B?dzNYeXhGYjJTK24rL3lqMzIwcG8zZkdmdUpMQUFNOEJSU2ZnRytUM29Iaitq?=
 =?utf-8?B?SFFYQ1RCL0FBZEorN05xVEp1QkYrVExGL2p5Skp4aG4wSVk5MDVnNlc5R21T?=
 =?utf-8?B?M1cyU2JSajhDeE1VNkkrOXpGaS9zQVNwcnpiRGxlUEM4OVJSU0lxSGh1bmJG?=
 =?utf-8?B?REtQS0loNmRQcW9OWmRLVzRWUW9jY0dhcnhma3g2eDZGWWd4YXVFUkwvUnor?=
 =?utf-8?B?algrSWoyNHlUbEQ2ckVPSXpQRFlOaTkzcmMwTy9ONjVPTzdoL2Q3MWttajBS?=
 =?utf-8?B?TE9RZmRUd1ZYT0s5ZHNjelg5N3FFMURHcisrK1lkc3MxSExrVk1hTlJiM0Z6?=
 =?utf-8?B?VUE2ZnErN1hLdExFZzBOcFFWaEY2emZDbWhhRHJOWVFmSHVaSWVpZTNXeTlZ?=
 =?utf-8?B?ejNLU2hiSERjeGVxblZjRXh4SHQyWDNINlZqTDNHb0h3dk1VNFZQYk41WXpw?=
 =?utf-8?B?OVhMbzVIMlJ2RnJrS09QNzc2NDlaYlJ0YVRJQWpQVGZIV3UwcFhuVjA3NUhZ?=
 =?utf-8?B?NTM2cno4UE1kOGoxdVdEWk0wcDFGNTFtZTF0U3J5RHk0WjMrODNJWlkxOXd6?=
 =?utf-8?B?cVZoalpkMmlsT25pR0Y3bHQ5clhGSGFNc25GYVhFN2VKajc0RThRcEQ0WXFa?=
 =?utf-8?B?aFpCN2JEZ1QvZTJxWmdjNUcwekU1ZjVCazhiQUZtUXNMeVphYWNrdTU4R1hz?=
 =?utf-8?B?NlZKYjFZK3Q5cTZIazkweXEwY3JON1BrTFBWRmo5Nk40bUNIdnpqRG54cWxt?=
 =?utf-8?B?a3dHRmVUTGFyTTM0dVYwZU1mNjQzbmZmejUzU0xDcGJKM3JlSEVESUlIWjdL?=
 =?utf-8?B?bjlidTJzSVVEbUEveVBKUlFTa0xUeWEzdDZ3dHE2aVVOaWV1aFAwOXgrSXh4?=
 =?utf-8?B?U3FWUUJuaEN6dC95Rk9aMVNSOEJjSVd3SHQrM3NyU2R5K1VtTWhGdXM0dzJZ?=
 =?utf-8?B?cExIcG5FcnVING03UWlvMCtEYkcyZ1RNTkI0a3BFTzJUVk90b2tUdHNReU9a?=
 =?utf-8?B?MDZzVVNKNmc0QmF4S1BaN1dkYmdDVDlrVUk1T202NmpwN3dqd2VKTllUVi9M?=
 =?utf-8?B?dWEvNE9SUlNyVHZ6aWJkdG1wSmdiMUZadXU0VlZMeXNFRlNDaUtQRFVZa1Fi?=
 =?utf-8?B?MzlKRFl0UHNpL2U4aWN4RzNWTHZiQ2wwM2Jia0h0Z0FWYnphdmt6eFVLTGti?=
 =?utf-8?B?bmlJK1ZIWEtWSWRrNnNWS2dvOHZVLzBjd3YyWHZMOVlLMkRRMnNLeHRJb3RW?=
 =?utf-8?B?N0hvZkNEUWFneWtCTTJoTFZrSDhYb1pUdWhoczZkcTk5Q1ZhUFZDYWJQVkRh?=
 =?utf-8?B?VUpmNnE2MThIS2pJQmt4SCtuUjc0cDVDL3pBLzE5Z3c5Nm1lZ0pRN0tTai9L?=
 =?utf-8?B?cEU1WFo2TmprVGFBdTVQdHdmKzdBRk9NMlJSeEV0QnlxSktNeFVXOFA2NzZw?=
 =?utf-8?B?NXpBSXV2eXpWbmM5V1RrWjQvbTF3ekwzQmt5RHkvVHBDV1Q5cmRaSmlZRi9I?=
 =?utf-8?B?SUw5M1g3OG9TQk5UZUxnYmhSZkRCS3ZPWDBpdm9XaUE0bUxmUE1hODkwcEtn?=
 =?utf-8?B?OUVyVWYwMkZMQ1BXajNLMmtoT1ZySnc4Ulo4MmN5cjBBWm1rV3I3d3VLYkNw?=
 =?utf-8?Q?hgtWRnPNkiHllChDxXvayaRZGrJnxZP6rwOkgmdewk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40c762f-33ad-4046-3a84-08debb25efd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 12:54:34.4841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYC2ldTD0phmvGK3XUY004wZjAE0IrkDxqFCGjEFMiE9SdgBNA21xZK9lgbxWvbr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10996
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237607

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDIyIG1haiAyMDI2IDE2OjI3DQo+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0ggNC81XSB1c2VyYWRkX2Jhc2UuYmJjbGFzczogRW11bGF0ZSB0aGUgZ3JvdXBt
ZW1zIGNvbW1hbmQgdXNpbmcgdXNlcm1vZA0KPiANCj4gT24gMTIgTWF5IDIwMjYsIGF0IDIwOjA0
LCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHBldGVyLmtq
ZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiBU
aGUgZ3JvdXBtZW1zIGNvbW1hbmQgZG9lcyB0byBzdXBwb3J0IHRoZSAtLXByZWZpeCBvcHRpb24s
IHdoaWNoIGlzDQo+ID4gYmVpbmcgdXNlZCBzaW5jZSBjb21taXQgYTdiODQ2YmE3ZDZkNjNhNWU1
OTkzOWQ3NWQ5YzVmZTNlNGNiYjBlOS4NCj4gPiBIb3dldmVyLCB0aGUgZ3JvdXBtZW1zIGNvbW1h
bmQgY2FuIGVhc2lseSBiZSBlbXVsYXRlZCB1c2luZyB0aGUgdXNlcm1vZA0KPiA+IGNvbW1hbmQu
DQo+IA0KPiBUaGlzIGVtdWxhdGlvbiBhc3N1bWVzIHRoYXQgdGhlIG9ubHkgdmFsaWQgR1JPVVBN
RU1TX1BBUkFNIGFyZSBvZiB0aGUgZm9ybQ0KPiAn4oCUYWRkIFt1c2VyXSDigJRncm91cCBbZ3Jv
dXBd4oCZIGFuZCBuZXZlciB1c2VkICfigJRkZWxldGXigJksIGJ1dCBpdCBsb29rcyBsaWtlDQo+
IHRoZSBzaGVsbCBzY3JpcHQgYWN0dWFsbHkgbWFuZGF0ZXMgdGhhdC4gIE1pZ2h0IGJlIHdvcnRo
IGEgbm90ZSB0aGF0DQo+IHdoaWxzdCBpdCBhcHBlYXJzIHRoYXQgR1JPVVBNRU1TX1BBUkFNIHN1
cHBvcnRzIGFyYml0cmFyeSBvcHRpb25zLCBpdA0KPiBhY3R1YWxseSBkb2VzbuKAmXQuDQo+IA0K
PiBSb3NzDQoNCllvdSBhcmUgY29ycmVjdC4gSSBoYXZlIHNlbnQgYW4gdXBkYXRlZCBwYXRjaCBz
ZXJpZXMsIHdoZXJlIEkgaGF2ZSANCnVwZGF0ZWQgdGhlIGZ1bmN0aW9uIHRvIGZhaWwgaWYgdGhl
IHVzZXIgYW5kL29yIHRoZSBncm91cCBhcmUgbm90IA0Kc3BlY2lmaWVkLiBUaGlzIHdvdWxkIGhh
cHBlbiBiZWZvcmUgYXMgd2VsbCwgYnV0IG5vdyBpdCBzaG93cyBhbiANCmFwcHJvcHJpYXRlIGVy
cm9yIG1lc3NhZ2UgcmF0aGVyIHRoYW4gdGhlIGhlbHAgb3V0cHV0IGZyb20gdXNlcm1vZC4NCg0K
Ly9QZXRlcg0KDQo=

