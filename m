Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69035C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 15:07:22 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.80])
 by mx.groups.io with SMTP id smtpd.web10.11377.1678806431516491514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 08:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dzWMsyek;
 spf=pass (domain: siemens.com, ip: 40.107.6.80, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWgJ/6DdHxXNBB4WxGxQJRCcgIqE1Jqqp5kV1OVRXGgZM+J1cummBTDYcovuOGuCvezQL8cZKZ73j1FkngC7gab63motZoHSneF+j3SVibm+s4+JsOju0uu3niguAzePGDBLETY06yqSCv7Oev9cEAByEVFXL5tdyGX3Q69he1Ytwe5bPn6qYGxyvZklReC6R4l5wVolxflN58AY1npCDdsHndxS8hjSlxb+8zcODVlGNpfn803nxRcny4NH0z0UmEDafE5zsde/6VbnqGDnl3bbH5q26fUc5/26PsiSud0FAyMe39NqxQ6ls4lCJVp/+NJKeDvOuoG7DPMlAq/5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeofxIf7mQsVoZv/FM+Nbdazk2eRZgyOzEwjUnkL1Lc=;
 b=Ut9v/wKATmmq+tndetMLKN99DCsGGZMxREYel4dpiNe8bwBbAYAkJwBkRpRp/c2Jv2migbf3j9nkVlO0xwOdyRrFqJWEkJ4X7zQ+FbACQjtvR/7lv90rsHgV74Gv6jm+kBQbXkQD7twlYkKb1/eTZbCCg1r9QI6ng7nyEnAsvHosjf+BCO2F7SHLIClgN7N/j20x3E5JZ3rqkobCW77NIbUu/pVvtUqr6A3qmB7Cd2QHQuOsnK4pU0EHtEc0Y1WC/906N3GFEqO+qRZB69fUDd0gQYYjpgYdaMmFs0iqzfEH4OgM+oTsTXs8f+CFBKqygvXwe24vlnLlKWBOQ/3MUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeofxIf7mQsVoZv/FM+Nbdazk2eRZgyOzEwjUnkL1Lc=;
 b=dzWMsyekouwxWjiyP4e+Bkn3SxkTECROKn4V90BI7J/86LOjLRYFXQcDIxxmfGrQ69XcsewMfYGkhUgLq22b2PK+b956XTMZHCKkfdQu5vpJweLK6a36PEMSd9CspW775bew9U2eZ+HqLZUjAa9lHMmwDpfoPX4ZcnPMGTSqLjncr3agZzMBD0gl3Uml+zXClKuQziVZZODeZ/rknbA07zptfaJlujc4tRFsm/z1waQ5CPsJonG6gV2f0AB43LXbhFOt1UPuQYGOicy14Yls8GXyTrEAVLZ+JoL4IcwNOFNfL3zKWuF4R1ebkqVcOfjHTpUPXCyT/IKkGos4FfGXQg==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by GV2PR10MB7510.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 15:07:08 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 15:07:08 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
Thread-Topic: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
Thread-Index: AQHZUzZTyJJNuBUW8ECeTugmNOGGZ676Xyg0gAAHtIA=
Date: Tue, 14 Mar 2023 15:07:08 +0000
Message-ID: <5a02a7cfc6b0cf6beb22eaf0e4f4f0e67bbb4458.camel@siemens.com>
References: 
 <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
	 <20230310095402.85948-1-andrej.valek@siemens.com>
	 <20230310095402.85948-2-andrej.valek@siemens.com>
	 <174C4F5C0F6A96A7.18998@lists.openembedded.org>
	 <CAOSpxdb1J=XFjJ+1oxysiGSxMC7ec5TSuHqnokSotQGPZyVftA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdb1J=XFjJ+1oxysiGSxMC7ec5TSuHqnokSotQGPZyVftA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|GV2PR10MB7510:EE_
x-ms-office365-filtering-correlation-id: 895cc01a-d81a-426c-6d50-08db249dc7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +Uxtea2BvE6ZmdFyIlnBR5O57+aCps+PWKUcuFXXVxnhuaaIy8sLrVKZTRAC+68VnJW9AR0O0QnKS5hqXENQBEgP8/HlExIxBBlfM/jXN93HsQsFddQyBzGDG4A/oFVR48orCWcX9WcZodIVGi+9AHaYpUVuKtBZEYnvpN7mcUpnAK7JVqUbNf3seSKzQBbq0/qRS3Me7kvx8S6mUOQ5WvwB5c3Jl8bNZBegCFT4TqDISM7BcnN6jHZ3Mfmirnu35e51p1r5AC057/rD9/pKw/8f4Eg2pGH5bWHabuhVYKQaFlHdhqDpVYdeThQEXgCNU1p0gKrVWdYZgIxIfBhxnQGf+56vwFrgGUwdjzUkZ6rFKV+QpovgobiajLVJK6IcqbKEwp+21xYVWYJTZC1YGo/wN621ihyv4Cn+VZX+nFZbtDlU5LPlH570s5LzZDlD5eJmPEun119vIXxHd+ZfUiCSZYAPRKCk/qSjrh29ZyOAsivpXDS3YPwjCgwt9u4EhZIGvwRePe6UN422fLe2l02XeSN+t/zTTD9V616oiCl0nDCUmsO9YsxCkKPl7W11Oa7oxJMXCxO3YmCBIr7g6KouVjQSh1NRMGqtOHMrWnT7pGSeXl1sgRwvEctALPf039NaYQZ21oQ4l0N6bhJwjj6P8CNGTTOW/fXPBcFU9ylRGksVcFVMKoQu1uu1ZJrLEFuMuQoehuWmBJkUeE/LsjgHMi9nd0YcgUMZ0dB1ZKw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199018)(5660300002)(36756003)(83380400001)(186003)(478600001)(71200400001)(26005)(6512007)(6506007)(2616005)(53546011)(6486002)(966005)(66446008)(66476007)(91956017)(38070700005)(8676002)(66946007)(64756008)(6916009)(41300700001)(66556008)(4326008)(8936002)(76116006)(316002)(86362001)(38100700002)(82960400001)(122000001)(2906002)(66899018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NXhkenlpQ2p5dE03TFR0ekdORkhzVTM4WFpEU0VHSU1iUjc0cHVVc0JvRGh2?=
 =?utf-8?B?RkhObGZKS05kWGcvUWJxN1RRN1I3elNFTm11UGhCM1M4ZGJMT0xvcGpjWmw4?=
 =?utf-8?B?aDN6ZlQ2Y2NSKzhZa1poU3F5REhjSS9BS3k1VXdpK1lPVyswYXM5bDc5aGF1?=
 =?utf-8?B?OUZwNTlLVEl6TlpRVG02SXJLNmVtMERvZ2hPVExEWnNVUUZKejR2WkIxZGpR?=
 =?utf-8?B?WjRkeXlOYTJNUHJSM04yTUJra2hXakgzd1JDS1VUTWRoUFBaR3oraXFUQzl2?=
 =?utf-8?B?dWN6QWUzUVlkT3c0VGR2UHVRanZnMEF0MXJlUmZrbUhtaXdMUUhMa0J6UEVt?=
 =?utf-8?B?cnBiMHB6M0FVSVpBR2lzZDhiWHM3VGtJN3hyRWRCM29sY2h3V3ltZXdkc2RH?=
 =?utf-8?B?U1E4aTJYck9ZSGgzU3JNdmtsMTMxNlQrL2FSeC8ySHFyZ2VqazNjYXMxMStR?=
 =?utf-8?B?alZtVzFQcndQREt4b1lob3p6dHZiY2xnQ0QwUXhwaFFLVm5ITFVzT3Zra3Yy?=
 =?utf-8?B?bkNwTjRzUjFjTnBaVVgwOVIzMXhMdlh4ZVB6OElGSWFFZDVyYkhKNHRNb3hr?=
 =?utf-8?B?MGhMRkwyRWt6Q1ljbDhGSWRMa3E2c21HWkY5RDhMeTRFbG1DSkFuRDh3Uzlr?=
 =?utf-8?B?VlErNE1RdE9YeThWZVdYRFBlN1d4a0h1UG5BS2dmRTF4bnJyZnM1WjRpNWZl?=
 =?utf-8?B?UEgzRHV2N0V4aHpseWpyQS9WUW5SREhlYnVYd2dEcHcyUDlROGl1TWdlZDV3?=
 =?utf-8?B?L082MGVINmNBckNieFhJUVBTLzFHQ1FOY0VpcHVhZGZzRHFnVlNnT0dDZDlF?=
 =?utf-8?B?QlZBMnlCTHBEbnhONE9HaW9HWDF5ZzM2eW9HUzYwQkNYSER1VkpnSkwwbXgy?=
 =?utf-8?B?V0s1NFlyL2xRRHlHcGt2bTBRR1NPc3ZnVVZrTkZkb1l5OXVTZDV1MHVyRDIx?=
 =?utf-8?B?dVFqdXVSNWN5MVNpa3hpR0FCdXZ2ZkxqSkhKTGd5T0o1U0l2aERxbUF0akVC?=
 =?utf-8?B?M000WkdhcWVaVE5kQ2FSQmljazhIR1c2a2RGeUJ4WXVqWjFxQUZPLzZ1YWpP?=
 =?utf-8?B?cWExUjgwV0FRU3hlOGEwU0QyNithNS9sdkFGZ1FyVlpJY2ZRY2tVcUtrTlFD?=
 =?utf-8?B?bk1VZEdLZU40OFpqTzZpeHkvK2lGWnBpdXNDbFpad3lLMlpUaEd5emNQVG5U?=
 =?utf-8?B?T3JwdVpjVEJjWmpvejRoN1RycG9QcDF3dmhrWTMycWJ1a01tS29MYzVaVlN4?=
 =?utf-8?B?Nlhic1RNZHFGR3VmRHVhRHNla1ZxZHhJWEhodDRuZkw0QUdITjNMaW1OaGk2?=
 =?utf-8?B?eDc1ZjV6MEpraVE1UTVWZmd1dzIrdkxNNU5xYTNKaktKMjM4bGgxVzg0ZFFZ?=
 =?utf-8?B?UHRGMnlZdjM2L0poUThpK2pQNUdBVjJsV2FtWkNsNlg4Y0VJaXRMZUFvem5p?=
 =?utf-8?B?a2FiaW1sRHpsU2tCdURJS3A0Tzc1dXcvM2lPVXRNOE1Lend2SCtmY0FuL29j?=
 =?utf-8?B?S3AxRnNBa1BCOWlHNGRWSnAzQjhyaDBjaHQzUmtacU5jaThwL0pNSVhiOFk1?=
 =?utf-8?B?aDBTYm9QUlAxbHVDdjBMdmxmdDVPdDRvVEFPbUZpVlRYZDd0M3B0MVdVWEVU?=
 =?utf-8?B?WlhOQ2hTaU9EVFhvYXBNeTFOVXRKWkc4UHRZYjhtMDhiUCsvc25pdlhoL2lO?=
 =?utf-8?B?cU5Sb1hzVEJxelArNE4zUmVnblRSY2NMa3FjcW01bFNMMFY5YjBiTmZHYldr?=
 =?utf-8?B?QTAvaXBMaWlmYmRkWkhLNkJZZ3ZMaEw5UHNLd3pRWkc5UG9IaFl6LzQrTGgw?=
 =?utf-8?B?YlVaajBnUVdScmxyNTZIdzJJMnUxSDhMQnpFVUw2d21JWHN3blNuWVhNajhh?=
 =?utf-8?B?c2h6NTE1UlRNT1RCemlIcS91MjBScGZxV0tDb2tpbllPTCtpTUsyQWo0YjFD?=
 =?utf-8?B?NnlGa1VzZ09FQ01SMXNmeSsvTVI3bVN2bVlJY2pwMDNnMHQ4a0pQMjJ2eEtu?=
 =?utf-8?B?eFhjS01TbHZZK1V3MnB0QkNYUjVXYzFwSElLb0FRS2toT3o2Mk04bWYzVlB0?=
 =?utf-8?B?VFRvc1h4ZTZYc1FRVEsrdVcwdmVmZXY4QUkzWGJSRHk2MC9SSUY0UzZlcmZZ?=
 =?utf-8?B?RzdXek9jSmdpbldrSis5UVJuWWc4S0dCdjFoS3NVVXQzbVJBdUlxWnUzcDZj?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA3809D94EDDB8449CA9FACD63F0EB5E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 895cc01a-d81a-426c-6d50-08db249dc7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 15:07:08.2199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5IerdBpf6uFuUvtHQ7JqRtJkRFc4EasrnvYEyVjYUcsbnGoiO0wOsJDEJg0g8vMRkgKKfJzohPzeTP1jbcQhW9MPIJ/FQ/bCcKC6QKHBWcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 15:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178498

SGVsbG8gU3RldmUsDQoNCk9rLCBsb29rcyBsaWtlIEkgcmVjZWl2ZWQgYSB3cm9uZyBub3RpZmlj
YXRpb24sIHNvcnJ5LiBTbyB5b3UgY2FuIGtlZXANCnRoZXJlIG9ubHkgdGhlIDQyOTE2Lg0KQmFz
aWNhbGx5IGFsbCB0aGUgSFNUUyBjaGVjayBmZWF0dXJlcyBhcmUgbm90IGltcGxlbWVudGVkIGlu
IHRoZSA3LjY5LjENCnZlcnNpb24uDQoNClJlZ2FyZHMsDQpBbmRyZWoNCg0KT24gVHVlLCAyMDIz
LTAzLTE0IGF0IDA0OjM5IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0KPiBPbiBUdWUsIE1h
ciAxNCwgMjAyMyBhdCA0OjI24oCvQU0gU3RldmUgU2Frb21hbiB2aWENCj4gbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c3RldmU9c2Frb21hbi5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4g
d3JvdGU6DQo+ID4gDQo+ID4gT24gVGh1LCBNYXIgOSwgMjAyMyBhdCAxMTo1NOKAr1BNIEFuZHJl
aiBWYWxlaw0KPiA+IDxhbmRyZWoudmFsZWtAc2llbWVucy5jb20+IHdyb3RlOg0KPiA+ID4gDQo+
ID4gPiBBbGwgbWVudGlvbmVkIENWRXMgYXJlIHJlbGF0ZWQgdG8gSFNUUyBjaGVjayBmZWF0dXJl
LCB3aGljaCBpcw0KPiA+ID4gbm90DQo+ID4gPiBpbXBsZW1lbnRlZCBpbiB2ZXJzaW9uIDcuNjku
MSAuDQo+ID4gDQo+ID4gSXMgdGhpcyBkdWUgdG8gYW4gZXJyb3IgaW4gdGhlIENQRSBkYXRhYmFz
ZT/CoCBJZiBzbywgcGVyaGFwcyB0aGUNCj4gPiBiZXR0ZXIgYXBwcm9hY2ggd291bGQgYmUgdG8g
c2VuZCBhIHZlcnNpb24gY29ycmVjdGlvbiByZXF1ZXN0IHRvDQo+ID4gY3BlX2RpY3Rpb25hcnlA
bmlzdC5nb3YNCj4gDQo+IEhtbW0gLiAuIC4gbG9va2luZyBhdCB0aGUgbW9zdCByZWNlbnQgZHVu
ZmVsbCBDVkUgcmVwb3J0IEkgc2VlIHRoYXQNCj4gb25seSBDVkUtMjAyMi00MjkxNiBpcyBsaXN0
ZWQuDQo+IA0KPiBUaGUgQ1BFIGRhdGFiYXNlIGluZGljYXRlcyB0aGUgaXNzdWUgaXMgcHJlc2Vu
dCBmb3IgdmVyc2lvbnMgNy41Ny4wDQo+IG9ud2FyZHMgdXAgdG8gYnV0IG5vdCBpbmNsdWRpbmcg
Ny44OC4wDQo+IA0KPiBTdGV2ZQ0KPiANCj4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWog
VmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy42OS4xLmJiIHwgMyArKysNCj4gPiA+IMKgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNjkuMS5iYg0KPiA+ID4gYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy42OS4xLmJiDQo+ID4gPiBpbmRleCA4OTlkYWY4ZWFj
Li5lYTM2YzBiZDNkIDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3Vy
bC9jdXJsXzcuNjkuMS5iYg0KPiA+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9j
dXJsXzcuNjkuMS5iYg0KPiA+ID4gQEAgLTU2LDYgKzU2LDkgQEAgQ1ZFX0NIRUNLX1dISVRFTElT
VCA9ICJDVkUtMjAyMS0yMjkyMiBDVkUtMjAyMS0NCj4gPiA+IDIyOTIzIENWRS0yMDIxLTIyOTI2
IENWRS0yMDIxLTIyOQ0KPiA+ID4gwqAjIFRoaXMgQ1ZFIGlzc3VlIGFmZmVjdHMgV2luZG93cyBv
bmx5IEhlbmNlIHdoaXRlbGlzdGluZyB0aGlzDQo+ID4gPiBDVkUNCj4gPiA+IMKgQ1ZFX0NIRUNL
X1dISVRFTElTVCArPSAiQ1ZFLTIwMjEtMjI4OTciDQo+ID4gPiANCj4gPiA+ICsjIEhTVFMgY2hl
Y2sgZmVhdHVyZSBpcyBub3QgaW1wbGVtZW50ZWQNCj4gPiA+ICtDVkVfQ0hFQ0tfV0hJVEVMSVNU
ICs9ICJDVkUtMjAyMi00MjkxNSBDVkUtMjAyMi00MjkxNiBDVkUtMjAyMi0NCj4gPiA+IDQzNTUx
Ig0KPiA+ID4gKw0KPiA+ID4gwqBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgYmluY29uZmln
IG11bHRpbGliX2hlYWRlcg0KPiA+ID4gDQo+ID4gPiDCoFBBQ0tBR0VDT05GSUcgPz89ICIke0Bi
Yi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywNCj4gPiA+IGQpfSBnbnV0
bHMgbGliaWRuIHByb3h5IHRocmVhZGVkLXJlc29sdmVyIHZlcmJvc2UgemxpYiINCj4gPiA+IC0t
DQo+ID4gPiAyLjM5LjINCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IA0KPiA+IA0KPiA+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMxNzg0OTMp
Og0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L21lc3NhZ2UvMTc4NDkzDQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbXQvOTc1MTYzNDkvMzYyMDYwMQ0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6
DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
dW5zdWLCoFsNCj4gPiBzdGV2ZUBzYWtvbWFuLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiA+IA0KDQo=

