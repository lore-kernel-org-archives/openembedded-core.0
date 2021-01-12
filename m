Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.84])
 by mx.groups.io with SMTP id smtpd.web11.13085.1610474030789344770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 09:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=RtUOuD9i;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.84, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGmkHYu3t/SnRQs6iQL2l4Pig/93zV2smVoL55FVqJ/BgCsD6wJNoOZUogHQY2/LEbvNMwyfllswRtZLY3djCEOj4OtM6600aeA4ZRhYftqZhg0igsXNQGnUA7Uuwhmcs3Ra1e0zisBXmWJAvuo1fBdsgx29sjxLTaYXds7S0Pzo1Tu/I9L+foz5P1TQmCRrvQ5D92sAgVjg4azDwrDL6W/35N+rNIj019hUUu1WMfj2ojDoow/1t5CFStkwwNl5FflIs9X5tgnRkvZw3m5gyiffQnfpxWdcg5sbfKW1MYq0NFtLQ023ukxGIxCUPBACcWNwKJkWHt5l1UeRa+r+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k0V479sBwa1d3gxNDpnoeWeoq6ZS4Yh31xuADZDNUE=;
 b=br9KtlZcskLU8yEEPrIj7I2J7ZYSO7lgHhmT7Jgwl4W7F6iugS0oGqFaxDrgofIh/K6qUIoze2YxZajkUHyCIfGeinzLXyrFZmftt/RMJl0vJm/0hGnbfIxnm7rbb0J2fVYIb+z2kKlIdvgFXeH9wdMceLZ1PiqDL1NfrKiN/1rVpvGUOngQUQdNYGC+PJnHILHI70B4uTE8/HlZC6iPAhr7cOXI+5Drh2aRe5Ta/kZdpx8DgyjzIzNwlyd9MCV2sagUisf8aI8oMXzYhuBmgefG8fhB1kxnbEsOHssI4ZcE0y3LfmUyV7YG83QqGkb3orUyH5bRHMaFog77TXMaFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k0V479sBwa1d3gxNDpnoeWeoq6ZS4Yh31xuADZDNUE=;
 b=RtUOuD9iIEgSXCMQwlzMTTwFqADd8xtesmiivdAXFK9dPKBtCGY6e8IiZKwyqz86PPgpcsjRASnlpfWjHwJqE83EAwyMX7tB8RJrKqP8GPHs9vPw7ILW4qhJT8wp8g7G0ZCPXAGkMtUyAoCGMpPVlagJJS4ddqL6QUPkIBJiJYtfdbkaO8LB4j03xDC7BrHh+PdisTUfKedRX648tvhoag/kEW7ucXn+1w9fkSzENcIMUfUSFe/qoaipHjJvIa3uyXzs/oeZa55uyHYdTDRj++TFtsQGk8ZnHgif+QHHJ8U3Y+AYHhni0HBh0JnC+AyGORkqWxfWaiyiXedVAr8hkw==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 17:53:49 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::e531:2157:eb3a:dfe9]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::e531:2157:eb3a:dfe9%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 17:53:49 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jean-marie.lemetayer@savoirfairelinux.com"
	<jean-marie.lemetayer@savoirfairelinux.com>
Subject: Re: [OE-core] [RFC PATCH 1/1] classes/npm: utilize lockfile in do_fetch to avoid multiconfig problems
Thread-Topic: [OE-core] [RFC PATCH 1/1] classes/npm: utilize lockfile in
 do_fetch to avoid multiconfig problems
Thread-Index: AQHW6QOK+t8nq8ZTJkuHGfWSrhL2CKokRIWAgAAAKGA=
Date: Tue, 12 Jan 2021 17:53:49 +0000
Message-ID: 
 <SN1PR12MB248003905ECEBAA50AB0A5C78BAA0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20210112165341.3723-1-chris.laplante@agilent.com>
	 <20210112165341.3723-2-chris.laplante@agilent.com>
 <c283c960deec844c48af3e0be41ff2c05e8a0665.camel@linuxfoundation.org>
In-Reply-To: 
 <c283c960deec844c48af3e0be41ff2c05e8a0665.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce65db88-79a2-4e52-f0ca-08d8b7230440
x-ms-traffictypediagnostic: SA0PR12MB4447:
x-microsoft-antispam-prvs: 
 <SA0PR12MB4447574F4576CC0C9385DCF98BAA0@SA0PR12MB4447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 E/hl8liBp+k5vYMYOLGvhU6cMnw1bjsMCfzSTZzs2plQyXoIzFgxwwP/aenwnHMPQRGoxt4S4S8BmSvRaWXrjzUCYQQl3yLBl8A3HDbNGfnvA1T+lNLhdh0HNmL9qZ77yOG/oSTDdbw6zs8LPJxSt2vBp6Jq1goTkRk4dvtyw61IqPDX6O4bLMHuZylFTBGhUle0t8kdDvGoiM1QK8YinlK2J/nJuQzMQtdMtEkcDBdtnXqg6mJKduaC6UWERNC8eW9ios5gGOlPc0YP7gFj+10qQkaAc8nP5+rjAIR/Zn+dsbEJQE1gPo/7eEPViYznhHjX6IYfoKAVvikqAd8FZzRRfkPN/MEkyrrUzotpgLCuTsfG+uMtdSVAGi6RXw9K6ZqQiApvLlqULPG1+vmYuCzrxV89ASZghZ/wNkMwwzVPOJkYPYeNFuBTIfXOl0Gw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(29502001)(66946007)(66446008)(64756008)(71200400001)(316002)(66476007)(66556008)(110136005)(8936002)(2906002)(4744005)(76116006)(86362001)(186003)(83380400001)(26005)(8676002)(52536014)(4326008)(5660300002)(33656002)(6506007)(478600001)(55016002)(7696005)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?WHdRSGZ5bno3SDg3TnBPQWRkRWZRVlBidTZnNXlZelpqV3U1Tk8yWmQrN2Ni?=
 =?utf-8?B?SythRkFzWHZucUozYVZJTzVZbnJTTmpvWmE3Q2RKMEVBSEF5N0E4OUIzSVp5?=
 =?utf-8?B?Q3ZPbHlKbnlydnRRVjFDOVhOeU9ueWNSUTJJR3IxSTRlQWU5ZGFGejBiTkY5?=
 =?utf-8?B?eWUyaE1mR3l1SmFkTVFMa1BmTDJMbUd0dThSRldneEkyT1VOUkZ0Umlxb1I3?=
 =?utf-8?B?MnRqZUVjOThxbjFYK1Y0Nlh0Y0V6SHdOb2pwcXAzSWtFSWhhQ0gxMDNBZUQ2?=
 =?utf-8?B?V25oSUdkZzlGa2ppOHRYNnN6Q1oxbDlIRnFIbmRGZmlqWStGYXB2b0QxYlJa?=
 =?utf-8?B?ZmN5enRRQ1h3dzhqSzJ1aU52WFM2Y2FJVndtS3ZlMDFvUDlXYlhwM0NiT0pk?=
 =?utf-8?B?TjBKdnRaZlJKZ2Z6KzhoNGRRLzQzOE03SmMrRitlL2kvNjJsWmszdUh4VzdI?=
 =?utf-8?B?MjZHOEVHZDhNcW5yeS9ucy9RVXl3SzdqS05GRkJIMGFzeWhBbERkbi9oeWRY?=
 =?utf-8?B?YXhJSXB6MURla2tmQXhZd3ZMeDFZcmYySU5oK3dKdGxPNWllZFZVcmYwc2pF?=
 =?utf-8?B?aVlRWENBWHdZVTEvcnNuZFBTbmdjaFBlcGV6Z3lZWUJnS3BpN0I0K2lzY051?=
 =?utf-8?B?QW1jclhMZ1FYb2xvMWVEdk1ZZ1F1ZG51cXNDbzhjQlJkbzVlajV6Nk1XYmhH?=
 =?utf-8?B?YUd3YS9JZ0FOTEwwWmhNTWo1VE1mUEtNa1lEWWhHd01LMGs0c0NYLzBwZnA2?=
 =?utf-8?B?cTNMcnpPMk1TR2NrVnVsTm8wNHJWYUpoUG1YT0UzaWtNRUFDaUJFY2lDS0NG?=
 =?utf-8?B?OS9iblk0VkF4Q05RSU9XQTY1Q0R5dzIybHZzYVBQL0tJMHV0SHNhZGVBK3gz?=
 =?utf-8?B?UmpIY3M1TTBvcUlROWpYVWMyVFZkT0tvVmZOVU90L0xObVVKam9rZ1VoUzBI?=
 =?utf-8?B?VFplaGkxSEhKcFc0eXFHeGdldEVoSDRyYVFwN2NCQmV5YXA3ajd1cDV5YXB5?=
 =?utf-8?B?czN1UTJSc291QVhnSFBkRER3ZzV6cnh1STRDN3R6YXNORi8rMktVcHAzeTZS?=
 =?utf-8?B?V2JJdXh4RUc1aFpqdnBKSlIrUWh4WE1vNDlOLzU0R3ZMM3FOTWRJZU5zekE5?=
 =?utf-8?B?R25FQ0YzRk80WVFWakE3dGdITFowOVUvdmFKWVVnQTYvdmhBYnNOMHJZUHY5?=
 =?utf-8?B?UmRXUU5XOGQyMWI1bFg5WjlCMGdiL1JHRk1CSTgveDRQNTBVdXdFeGovdWlI?=
 =?utf-8?B?VFhjSnMyazFGd0F2bVZ5L2psOERyNHIxak05YUw4Q282NXNRbkx2TktoTk9G?=
 =?utf-8?Q?QjAguKCpuKrVc=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce65db88-79a2-4e52-f0ca-08d8b7230440
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 17:53:49.5388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9L+p6U/prsWJIWG84ptgnAcscWQKiGpzVgYhGKRpnTjYnURwoVDh2fdkjBGQKUOKTCipGioGa2Ns+fjRB4IjQsotBytGnjpyn4v68C5vjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiA+DQo+ID4gK2RvX2ZldGNoW2xvY2tmaWxlc10gKz0gIiR7RExfRElS
fS9ucG0yX2ZldGNoLmxvY2siDQo+ID4gKw0KPiA+ICBkZWYgbnBtX2dsb2JhbF9jb25maWdzKGQp
Og0KPiA+ICAgICAgIiIiR2V0IHRoZSBucG0gZ2xvYmFsIGNvbmZpZ3VyYXRpb24iIiINCj4gPiAg
ICAgIGNvbmZpZ3MgPSBbXQ0KPiANCj4gSWYgaXRzIGp1c3QgbXVsdGlsaWIsIHlvdSBjb3VsZCBw
dXQgYSAke0JQTn0gaW4gdGhlIGxvY2sgbmFtZT8gb3IgaXMgaXQgY29uZmxpY3RpbmcNCj4gZ2Vu
ZXJhbCByZWNpcGVzPw0KDQptdWx0aWNvbmZpZywgbm90IG11bHRpbGliLg0KDQpCdXQgaXQgd291
bGQgaGFwcGVuIGV2ZW4gd2l0aG91dCBtdWx0aWNvbmZpZywgaWYgdGhlcmUgaXMgb3ZlcmxhcCBp
biB0aGUgbm9kZSBtb2R1bGVzIHRoYXQgdHdvIHJlY2lwZXMgdHJ5IHRvIGZldGNoLiBGb3Igc29t
ZSByZWFzb24gdGhlIG5wbXN3IGZldGNoZXIgKG9yIHRoZSBwcm94eSBmZXRjaGVyIGl0IGlzIHVz
aW5nLCBzZWUgYml0YmFrZS9saWIvYmIvZmV0Y2gyL25wbXN3LnB5IGFyb3VuZCBsaW5lcyAxNjgt
MTgxKSBhcmUgbm90IGd1YXJkaW5nIGFnYWluc3QgdHdvIHJlY2lwZXMgdHJ5aW5nIHRvIGRvd25s
b2FkIHRoZSBzYW1lIG1vZHVsZSBjb25jdXJyZW50bHkuDQoNClRoYW5rcywNCkNocmlzDQo=
