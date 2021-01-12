Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.80])
 by mx.groups.io with SMTP id smtpd.web10.14791.1610480722940790715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 11:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=XE3pwCvL;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.80, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mp5I2Dfs7iEXK4U0tc9dg6X3q5E2ceXSlt4G56Z2uZUrepqnPIkRPby19aLUlGvdTTNtXraVnkMPRwQAtHPtThNlc2NCgAw8bA1fYVGkgLVhb8pp4uhl+M8d9mnL9NjXJFsGOPGF2zovFOFJ+MLJcbdl/Pa2QpYwinZS0J3kK8Q368YF3oocRY+72WHt1/jNo0/A3CINEsTgCuYN8btTwUn4gYjDefxpuXIjuYXPYGPzfC2GYo9yr6BD2A8571/dge4q2H9UiBzf7hZqXYL1M5hRddcrnuZ+WL4e18FQv243XVxmUyVc4Aj2eYxg1Lug0Bsz6heblSP5sKsh+bFqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/qxVJSHzcTJ9bmWiF/HuC8azzMvjP3hPpPlxb8/i9Q=;
 b=EbwbySHUr8WOUafkyLbIgpqYcPeI4sodeYbLUDIHt9ojYvqTSnNcE5XiGFA6aaCRiKezFpEWf0JO4cBUsF9YLp/iOpfxK3IgVeJhOf0pLX5vCHrg+Qz6hbrpkpRwvyfNGKm8TYaS7Z2oTLEhYw0A6rSSq9EPlvB7nMQot/QBDplKgmhJERc7A74AJ1hpxImh3FTYZ8vgklhH5Jd8BxgU1uY88ps64O5YS8kaCmSE/kq+Sqfc0Ws10H8yqS4lRPF5roKI/swAt6PPkwRTjqOJ6WHZUSDzsMcoPn82HyedVuMzwD2bwI7ctsBIjV9XdcRez9eqZcsYQfqDwefwPgFztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/qxVJSHzcTJ9bmWiF/HuC8azzMvjP3hPpPlxb8/i9Q=;
 b=XE3pwCvLNJW+hAcsiCa7YHIeltfIbjwO5Qq8NwKBOkTy0npi3BzJViImpdVw6slMxkcTMvuTy+/aaxQ6FWdhpWeQer4COQZ++SSe7Yacstkxlqwt8WcBGpD+/+44MC83q4D4nFlrvddKhpu5BzLLxFyRo6iMW0eGqzuseX9HjT5bR8m9liPvtnZr6DJSefYP+8muhI4KiQ8Yvdo+69DKwdVZfXe2f4mTN3wxksA6Kg852/azdX8Ee8Kg+Iml144rzr9HcAr87tZ2LI5VgqtqCUx1nrIpmvE58xf1mAtgXBH5NV2k4zWKqS2yv2ab923igyhwocXPMIWou/MkQldQKA==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN6PR12MB4719.namprd12.prod.outlook.com (2603:10b6:805:e9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 19:45:21 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::e531:2157:eb3a:dfe9]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::e531:2157:eb3a:dfe9%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 19:45:21 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jean-marie.lemetayer@savoirfairelinux.com"
	<jean-marie.lemetayer@savoirfairelinux.com>
Subject: Re: [OE-core] [RFC PATCH 1/1] classes/npm: utilize lockfile in do_fetch to avoid multiconfig problems
Thread-Topic: [OE-core] [RFC PATCH 1/1] classes/npm: utilize lockfile in
 do_fetch to avoid multiconfig problems
Thread-Index: AQHW6QOK+t8nq8ZTJkuHGfWSrhL2CKokRIWAgAAAKGCAAAWAgIAAGoBA
Date: Tue, 12 Jan 2021 19:45:21 +0000
Message-ID: 
 <SN1PR12MB24807D3818630383722C0CB48BAA0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20210112165341.3723-1-chris.laplante@agilent.com>
	 <20210112165341.3723-2-chris.laplante@agilent.com>
	 <c283c960deec844c48af3e0be41ff2c05e8a0665.camel@linuxfoundation.org>
	 <SN1PR12MB248003905ECEBAA50AB0A5C78BAA0@SN1PR12MB2480.namprd12.prod.outlook.com>
 <99744b7868cd7a2e79d6e0461a1bb38a7072ac08.camel@linuxfoundation.org>
In-Reply-To: 
 <99744b7868cd7a2e79d6e0461a1bb38a7072ac08.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 647f740c-5b29-4b33-2a2d-08d8b7329910
x-ms-traffictypediagnostic: SN6PR12MB4719:
x-microsoft-antispam-prvs: 
 <SN6PR12MB4719E6FC5207EA42678F69598BAA0@SN6PR12MB4719.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sJBYr6VBH9X95zdmXTpuxY5ygWYA3NbxzWgF99nHyC8l20kIjarJpZ7Sn9ypO89nRkE/N3FP8QPtNA7/rVkEnUXAWzCKUulLnGME9YQfXEQoASqWDcX5x9g4mICaPfDkuw/kioDMGY3YoEwvB6axTrH7q8qJCLjKwr8wUSxurCbX4h0SRBZ0/l1vYB+ByZbVJAhSgdnU6zOaqZSmzUqfUBDJHvywr1F8ke3xO6suRamyf3rcsuGaqzFTaodBCTFOmyYtr8+gyRbxbEOy0LZpO/B2rdeqLsOtW5lycV0OyXJQSd/+vytd1CkIqtzkCzHi+SaHEjvIowR0W7Pu1yH5U/hZYyro0fBFZTf+8zEO22skGrjQcxwwsDb6CLcogQ4sN6fWUtFh2LW5Lk6M+ImSdWaYgcOatYG63ThveLdlD9pn9TQhDqBUqVEqyWwdg9yV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(29502001)(8936002)(9686003)(110136005)(86362001)(7696005)(478600001)(4326008)(2906002)(33656002)(55016002)(8676002)(316002)(186003)(26005)(6506007)(4744005)(71200400001)(66446008)(64756008)(66556008)(5660300002)(83380400001)(66476007)(76116006)(66946007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?Rzg0REdNNWtET1BtOUNacXZmSUtxWnJtN2pURFd4cHJOTGJ6U2I2QXJnMWdD?=
 =?utf-8?B?TG55b1dZN1EvODljTkhaZWdOd1dUNWo2YmltQ2ZRa0RLekI4VmkrYTFIbzZa?=
 =?utf-8?B?WVpHZE9ZcmVoUXI0dm9yNTBNb1FtSFlrcFJ1eGVkQk1melQ0eUYyZkprcWhR?=
 =?utf-8?B?RENsUG1Ea0RyaWMrQ3pZSUUrL1VhRExGbE5lZmtVTThEUXNKZnJKME96SkFt?=
 =?utf-8?B?WmtNektmdVBwUnArRG4xeklHVW9maXNEVHZwd3hkQ3EwL0gzNmJBQnJKWmEx?=
 =?utf-8?B?TzMvTHZIMmtVWkFrbGpKOVRQWGpTZTFWaUJrZ3kvOVVHdXlDZXFtQmZLWDVn?=
 =?utf-8?B?VW5tM0lmMnJBcGNaYzlES1pIUnhYMStsL3VnVWIyV1hTTjJPVHRzZ3FieUNi?=
 =?utf-8?B?eldGN1hjYXJOeHpTZVdjNWt1QWptSGRVUzJCL3E1TWNYMEUrQVNmQjZhUCtF?=
 =?utf-8?B?ZFlzcCtVYmMyVmhZZmtHSnp5M0hPaG5vQVNxU0hFRk5TdWZwYUZTN1JZTzNQ?=
 =?utf-8?B?eGI2ZGhPb0x0MVptMlZGQmQ2Y1lBZkhwTzhzcEZ4UFJ5ejkxS2h6dlE4d0Vp?=
 =?utf-8?B?V2RiemhuQ1UySTVIU01xck41b3o1K2hRUFNIa2NEU1NFTHNqZjMxNFBhZmdJ?=
 =?utf-8?B?NXFmVml2dkhXRXduTVlqR0Q5OUlKZTVHNEU1bkt2SDhBYVpsRWRGT2JxdkpF?=
 =?utf-8?B?NWlGMEs5ZEg1aEY2TWRuMEZ4aW9jaGRpVjd1M3ErRVpkZ3FNcmt5S2kzZGJY?=
 =?utf-8?B?VVhLWXcyVmdDYmk3cDJteFVMSEg5WHFVeGt1OFVQT2hNSENabHBHdndLUVUz?=
 =?utf-8?B?U2E2KzNHL2dWOXRFN3hRUHR3cC9pZmJmaVZWTEdKWXEzUzRTb0tqNmpNeElD?=
 =?utf-8?B?T0hQOFZLVzVpaFFtYjZHd2lleXhjLzY4Q2c0UnBaMmh5T0xGWlQrTzBxcTVR?=
 =?utf-8?B?WXJka0NkSmZ6dzdnZU9Mb0MzcXY0a0dlNVhaeWduMmNDcTBCZ1BTOER6b1Vl?=
 =?utf-8?B?eGFNTW9FS2ZzNFRyVWxUSHZGNkc0cTQyVnNXWk81LzR5dDBxM00xR0RZUmlt?=
 =?utf-8?B?TFhOOEllbzVjZ1pXKy92RmhNYkhWQUJCTWNpYlR1TzN5OERabmtJVi9IcktX?=
 =?utf-8?B?ajJQWXlUcnhmRzViL2NNYmNVQ1BDaGRuS0M3WmlPTUlZSWUxYnVpeDR5TVFl?=
 =?utf-8?B?ZU1NSVJnOE9VcUV4T2NBUVNnTk80bENCU2lHOHVYakg5WDdEM0IxbGhZZC9s?=
 =?utf-8?B?YmVYamMyK3lPL0JWL1IwNnZyd3c1VG9Zdm9heGllZFFBK0p3OXVON2NrcElk?=
 =?utf-8?Q?iYjzKW7pwAzas=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647f740c-5b29-4b33-2a2d-08d8b7329910
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 19:45:21.6386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qb0wuI5ratoml66MaWMTBU/CAjFXKnHEEjc0q6dgUvbfUlquix01uky9Y+3NeBTxf2RJWN3sKelgQBNwnCuZkXDwUZwUbF3PIzq2SkthDlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4719
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IEJ1dCBpdCB3b3VsZCBoYXBwZW4gZXZlbiB3aXRob3V0IG11bHRpY29uZmlnLCBpZiB0aGVy
ZSBpcyBvdmVybGFwIGluDQo+ID4gdGhlIG5vZGUgbW9kdWxlcyB0aGF0IHR3byByZWNpcGVzIHRy
eSB0byBmZXRjaC4gRm9yIHNvbWUgcmVhc29uIHRoZQ0KPiA+IG5wbXN3IGZldGNoZXIgKG9yIHRo
ZSBwcm94eSBmZXRjaGVyIGl0IGlzIHVzaW5nLCBzZWUNCj4gPiBiaXRiYWtlL2xpYi9iYi9mZXRj
aDIvbnBtc3cucHkgYXJvdW5kIGxpbmVzIDE2OC0xODEpIGFyZSBub3QgZ3VhcmRpbmcNCj4gPiBh
Z2FpbnN0IHR3byByZWNpcGVzIHRyeWluZyB0byBkb3dubG9hZCB0aGUgc2FtZSBtb2R1bGUgY29u
Y3VycmVudGx5Lg0KPiANCj4gU29ycnksIHJpZ2h0LiBJZiB0aGlzIGlzbid0IG11bHRpY29uZmln
IHNhZmUsIGl0cyBhbHNvIG5vdCBzYWZlIGFnYWluc3QgY29uY3VycmVudA0KPiBidWlsZHMgYWdh
aW5zdCBETF9ESVIgd2hpY2ggd2UgZG8gc3VwcG9ydCBhbmQgYWxsb3cuDQo+IA0KPiBJdCBkb2Vz
IHNvdW5kIGxpa2UgdGhlcmUgYXJlIGxvY2tzIG1pc3NpbmcgaW4gdGhlIGZldGNoZXIgY29kZSBh
bmQgdGhpcyBpcw0KPiB3b3JraW5nIGFyb3VuZCB0aGF0LiBDb3VsZCB3ZSBhZGQgdGhlIHJpZ2h0
IGxvY2tzIHRvIHRoZSBmZXRjaGVyPw0KDQpZZXMsIEkgd2lsbCB0cnkgdG8gbG9vayBpbnRvIGFk
ZGluZyB0aGUgbG9ja3MuIEkgaGFkIHNlbnQgdGhpcyBwYXRjaCBpbiB0aGUgbWVhbnRpbWUganVz
dCB0byBtYWtlIGV2ZXJ5b25lIGF3YXJlIG9mIHRoZSBwcm9ibGVtIDopDQoNClRoYW5rcywNCkNo
cmlzDQo=
