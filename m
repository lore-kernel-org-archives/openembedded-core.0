Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDAEC77B75
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 21:34:41 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.9340.1683322479648998992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 14:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=H1KdCpry;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683322480;
  x=1714858480;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CgJI0V78yAiCBZSUDLLBRlB/MbUn0BaVjK9PHeQYNAg=;
  b=H1KdCpryIkKV566lG05YHu84cNaZkwikTMyVeWIF+p5JOo5D1TLiz/KQ
   5iBcwjqJF5hJwWAkoO0lL1Vq7m+ZDTaeFFERuNvjubgR39xOwvplfZbfv
   futvngg9w4qvqRs9O2YztPQYxqQWE7K22GwsXId3GETXGg/sgJlNTMLGR
   nP5X5JBuvr+rJr2qd1UNhgtOOqR8REhhtDPMyYk1hxeQ8GtlFIv8ZKzbz
   uNmNQeabKYtmTOLLBWQMs+2Tl+HM3YkIS5xb8qGWy0jwiT1BGCbRr3l2j
   o3gDanG+CxtEffqd3YnpPNLtNxblvM2kix+MjoKlxnLqbc4i4w3b5Z6ha
   w==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYqfjdBuZ6NIXs4V/c6ZTnWDaDABdVcRjhbhmGL3QlJ8mWa6mG6VBq1SddDVm75Nx3oaryk8H93I+3/jrBwrhBPdvwnmDNvr/YckKdK0ecJ6bRZn7c9kiDLZ6BGQsIqyOXsR4oFNAwfMd/uIfH7Z7OfvgppVlCw2PBh85ebknG5LxxoJrtrwsqqWzjVHi1LS+bcuQ7ng2JpLX4Cten0UXOrWIOjp92O0MG36aNhs0PT5iGmxN+r6kn/VAwpE9LrtEW3cvcq0ZxhmcBDCZgxQnnHUNTEnLw/bSUCBEEwCuYqctaYD9ewkLs0HOjN389LQcoR2RHWYu75wAjKeglrLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgJI0V78yAiCBZSUDLLBRlB/MbUn0BaVjK9PHeQYNAg=;
 b=eOqFcjlUKXYH/U4TS/MVPVlQGQepFoNVxK8eVZzORB8KFIX5lJMGXoWpDBrCeUzHKMxsHX28Je080jxLL8S7YbW5/zQFHpAZPNh40b4W7BMz6APQ8bymPtx6Z3PriYaCSKIAiBg2Q6w31t+8Kq2190d4AAsQwJ5D32liigd9xC4EmEAqjacYhpniEKyCPpYeaMTD0gEAPKQdy9yPxTXGQ2NauHnmOgxmueNUsGlVP2wtKl1LgP3IkgtzUf5PU+QxfJYQQQ1OBx8uhrU0dh1nEClIKnGGiqQzwITpGvvVNuuNiuyPgo/vQr9oM+Ypo4VOtdkOMak6G2GSnic90D/ypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgJI0V78yAiCBZSUDLLBRlB/MbUn0BaVjK9PHeQYNAg=;
 b=P4Ak3okBqePnFGxrpKiZNgrQDItpMrsQLGj0eCA1Yd6fnH++2iizCSQhMtQsfH5OdVuleK5FWWzOLHggWprpZXAWta6gxDtD2xPItZyPFnSvFpMiM/nyRuVDaaoH14mQyNxHOcbF18vkhLdB5jXmi+oIIMBFgDPUj0jrk4rLILQ=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v3] python3-calver: Add recipe
Thread-Topic: [OE-core][PATCH v3] python3-calver: Add recipe
Thread-Index: AQHZfR3pOPzfo/j5AUeP9yzDg2rwrq9HkAaggAR7DoCAACykMA==
Date: Fri, 5 May 2023 21:34:33 +0000
Message-ID: <DB5PR02MB10213E33CF4B67B1A05B5D179EF729@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230502174529.2262518-1-tgamblin@baylibre.com>
 <DB5PR02MB10213E17AFAED21E8AEC49827EF6F9@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <a3d9dff7-5005-d82a-ae37-9efbf6408adf@baylibre.com>
In-Reply-To: <a3d9dff7-5005-d82a-ae37-9efbf6408adf@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9657:EE_
x-ms-office365-filtering-correlation-id: d921d52b-1ce5-4cae-9e34-08db4db08477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +NxFHEUEw73iQNFV+IVhCA4zpQP8icscq3CPP02F2bwhwuxmwg4lIRCtBykCJwPU3YVZ6GFidO7Jdkvt5QWXpAT3Cg8UHkQWlBF0f9sPyAhpRkYWVzwNPXYUB6p0ig02sciyhlcAhsEiWkmXDzEPaV+y7bKh7G1+qR2I6GMsswF7+D8F9aJJ/8FnwFpIZepIWANVWfTzB7+TrfFDS+Tg77pPbi9nF2QGh0qRN1EahtacfNKI0rFkr79ODsS8VA8W8RFVLUYM2cgTtj5pSdshdGjV29/w/3PJHl3CdKz2WtFGpRPLiHgPEp+HZ3+gET76INXQuYMhMljiQp/KL+UbncGnDJ6anYWXmjX5Oy325waodBoIsnoCc3BPxgPoymy5NRDuaYiVcpaaZZbJNju3nTEch9Dhw7u3bJ9EvfwNmrcyzVfaJdvU9S9yGqnvUl9AXKQ7f0TdXwzG9xbqEXs43B/KuMHZUre6OIqcfaayiSu8dtWec1Zpm5dF2KuA5TjXvQ6L7IXg2sI+lSq6TulOad+IPGaoUkD8fATPagwEd68U3HZ5HXTiM4Vzc3+N0fVwedc7Nda9lssxCZHFB+xc8yz+OQ0mzepcAvTIsmtJuPo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(33656002)(122000001)(5660300002)(38100700002)(52536014)(2906002)(44832011)(8936002)(316002)(8676002)(55016003)(86362001)(4326008)(66556008)(41300700001)(66946007)(6916009)(64756008)(66446008)(38070700005)(66476007)(83380400001)(76116006)(53546011)(6506007)(9686003)(7696005)(478600001)(186003)(26005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm1HUEZSOCtDcHdPZzN5MTB5emQwcEsrL2VROGd0Z2FIL3RrK1hvaHhtbmlX?=
 =?utf-8?B?WVFjQlZneDZYWWI0NDhvTWVuTDQ5ei9FT1MrSW1mTGk3djlFdzBRQ1dOa2g5?=
 =?utf-8?B?ay9zSFgxRzdSSXA1aXNRRDdzSSt2dmRXRFN4Y3J5cXdNZll0ekE4akVpUy9F?=
 =?utf-8?B?REFQdjI2UnNYOGxLcXZSaWxNNDhQeWlGazJkZGFWSFcyK0xnWStXQ0Z6TzhR?=
 =?utf-8?B?YlhJa0I2dVBYbnYvVER6aUJ0YkVpYVVjR1RJMytpMGtBVzcyZjNPMEovSVZz?=
 =?utf-8?B?S3UzT0t6SmkxUHdMYzZpUm56OFRza1FnVEk5YTZCZ2w5VTJGUmdqK1dOSjNy?=
 =?utf-8?B?ZkkrVGo0cVFjOW9hZzE4UGgyVWh5c1JjZHhIaG9PTXRybHo4TXpDZERNZDcr?=
 =?utf-8?B?WUJFVEsrTytXamkxNXJFckJTVVNieWx5UjlmRzduck9ka09iK0NyUUlVdmh2?=
 =?utf-8?B?c3FOdEtLVlU1WVRqdzg4NVJBWG5MK0hIbVNUbmcyMTRhZ2ErdWtGRXZ5RmJ5?=
 =?utf-8?B?Y0ZZYkR5dUJTRS9pSzNMSW9iU0pQTUtrMjFoWTI0ZGpBSkQ4Tndlb0wzWGFv?=
 =?utf-8?B?VU5mcnZndFB4eUFkclFScGRQUVBQRnRRRllCZDNORHJXM2lmWk9nTWRMVGEz?=
 =?utf-8?B?RmtKSFBCUHRXQjBISWpBUVdjRkpwaWpTOVNxR3hnV2ZhUWpoU2MvbmsyNnJa?=
 =?utf-8?B?am15b2FnU0FrWUtYUTJVMXRXVUFtdkFmZkZJYVY3QVpGZDZFTFF4YVZKd1hm?=
 =?utf-8?B?N3dQTjhGUHZvK2NFQ0lZVTJ2L2JyUUM2b1A1RWlqN2NVV0JkZzArcldjdnV1?=
 =?utf-8?B?OGM4L3hmS2ppcEE3UXl1MFNUMHdJVDBFRHhaR056czNSVXRxbzQwcEZkNDdo?=
 =?utf-8?B?ZDBwQVViUFJOUFYrQmdQUUZxRkVlVWMrRE9KTVUxN2Y2Y3BwY2gyOUpGQjdG?=
 =?utf-8?B?VWdlWDVweWEyS1ppV3E5WWVjbEVPOSsreTV4YTdhVjNRekRENm5wd0JvaTQx?=
 =?utf-8?B?cHltZjdDWlk5eWhaRU5qZmk1VEdreWFiejNZK3dvdUYyZVVOdXZrVW5aR1Zw?=
 =?utf-8?B?YzQ1NWNoTTllbXdPRDg2NURucENhWXpMdnhCcXEwUnFkZ3RpbEFnYUhjZmU1?=
 =?utf-8?B?SXVMS1RGQktScHJ5UXBnbUJiTnNGUDJBc3hGUGp2VmhDOGRlc0gxK09KUngx?=
 =?utf-8?B?UFEzWGlKTGdZR1BGUEhEQ0VCRitsSHVhSmtPMTBkU1lzRm1FUTFOeU1iYW9L?=
 =?utf-8?B?Y2hLb2ZYZGFmZ3FwaDBraFViVHJpWjhaWExMczU4ZjV0ZTk5Y2ZKYU9OMUo4?=
 =?utf-8?B?bFJiY2FzenFoRC9lS1dveTl6bzJQSFUvZUpGN0JVWnRhWEYyRWVMY0FCWSta?=
 =?utf-8?B?K2o4bUlVTENjK1BQVGx4UTIwMGFFZnhiOURJRkM4Zk03QTUrSm5PNFhMRFVo?=
 =?utf-8?B?QzdiUWZNcXNrYlVmL3ZJaHc0WEl2VXpKTi92WWlKdExBbkhYemRsT2RWMUcw?=
 =?utf-8?B?VExQaW8ybGowOEluMUZrMFIrT1l3MzdTdGlhT3lCMWlPc0Y3eW5FRzZRTGJ5?=
 =?utf-8?B?RmhucFlqQ3BlcVBjU201TGtqYWN6d0RRTTY1OG9NRTRjbWN6b0NldlhiR3Bi?=
 =?utf-8?B?dUN4dzhKdmNsSkRvd2tCR2tHWjkybFRwRU5HNk92KzF4eElnUkprRENCWTJs?=
 =?utf-8?B?dnlFL2p6emJmZXpCY2tHWTZ3MTNibHhkYlFjSmlodjZOY2VrcVRPUituaFQ1?=
 =?utf-8?B?ZVE2MWFkSm5jQW9IdzJ3NVpPN1ZWY1NmeWx5SmxvenF4dVJFRFJ3dDhEL29N?=
 =?utf-8?B?M0s1QnVJVFdWSTdCaUVERTFub05Wd2M0V3VaQlFIYTF0T0hWb2o1bWIrNk9K?=
 =?utf-8?B?QjJsOWwwKy9wUWM3U1E5ejJSRDVCMG9ya2NsWlNMTncxaDljRTUwNGhOVFhX?=
 =?utf-8?B?MEpoc1cyQm5zK0t5UWJMSnB6OHVFN1VIcWtxeGlXY3VxTTRIbDQ1bVJnSnFD?=
 =?utf-8?B?ZitWMlNuRHBPMFlKK2twUmtHSU9KTHEyTEdRRkVscEhJT3ViV2F5Rm8vQ1N4?=
 =?utf-8?B?RjVVUDdYOVJGZTl3S2NYa2JEVDJaNGdNY2hiU09qRHNVdzJoNTBIdGU4Ukp6?=
 =?utf-8?Q?lFjQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d921d52b-1ce5-4cae-9e34-08db4db08477
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 21:34:33.4827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qc2GCXjka1o++XknERymKALl/pfbN3C++CSe+BbZt13ydvfJ1Bn9T2kVENK2/n37
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 21:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180979

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUcmV2b3IgR2FtYmxpbiA8dGdh
bWJsaW5AYmF5bGlicmUuY29tPg0KPiBTZW50OiBkZW4gNSBtYWogMjAyMyAyMDo1Mg0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29y
ZV1bUEFUQ0ggdjNdIHB5dGhvbjMtY2FsdmVyOiBBZGQgcmVjaXBlDQo+IA0KPiBPbiAyMDIzLTA1
LTAyIDE4OjQwLCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJl
aGFsZiBPZiBUcmV2b3IgR2FtYmxpbg0KPiA+PiBTZW50OiBkZW4gMiBtYWogMjAyMyAxOTo0NQ0K
PiA+PiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiBT
dWJqZWN0OiBbT0UtY29yZV1bUEFUQ0ggdjNdIHB5dGhvbjMtY2FsdmVyOiBBZGQgcmVjaXBlDQo+
ID4+DQo+ID4+IGNhbHZlciBpcyAiYSBzZXR1cHRvb2xzIGV4dGVuc2lvbiBmb3IgYXV0b21hdGlj
YWxseSBkZWZpbmluZyB5b3VyIFB5dGhvbg0KPiA+PiBwYWNrYWdlIHZlcnNpb24gYXMgYSBjYWxl
bmRhciB2ZXJzaW9uLiIgSXQgaXMgcmVxdWlyZWQgZm9yDQo+ID4+IHB5dGhvbjMtdHJvdmUtY2xh
c3NpZmllcnMgKGFub3RoZXIgbmV3IHJlY2lwZSksIHdoaWNoIGluIHR1cm4gaXMNCj4gPj4gcmVx
dWlyZWQgZm9yIHRoZSB1cGdyYWRlIG9mIHB5dGhvbjMtaGF0Y2hsaW5nIGZyb20gMS4xMy4wIHRv
IHdvcmsuDQo+ID4+DQo+ID4+IHYzIGNsYXJpZmllcyB0aGF0IHRoZSByZWNpcGUgbm93IGluY2x1
ZGVzIHB0ZXN0cywgd2hlcmUgdjIgZGlkbid0IG1ha2UNCj4gPj4gdGhpcyBjbGVhciBhbmQgdjEg
ZGlkbid0IGhhdmUgdGhlbSBhdCBhbGwuDQo+ID4gQ29tbWVudHMgcmVsYXRlZCB0byB0aGUgcGF0
Y2ggdmVyc2lvbnMgc2hvdWxkIGdvIGFmdGVyIHRoZSAiLS0tIiBiZWxvdw0KPiA+IGFzIHRoZXkg
d2lsbCBvdGhlcndpc2UgYmVjb21lIHBhcnQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLCB3aGVyZSB0
aGV5DQo+ID4gdHlwaWNhbGx5IGRvIG5vdCBtYWtlIGFueSBzZW5zZS4NCj4gDQo+IFNvcnJ5LCBt
aXNzZWQgdGhpcyBlYXJsaWVyLiBJJ3ZlIHJlc2VudCB3aXRoIHRoZSByZXZpc2lvbiBub3RlcyBt
b3ZlZC4NCg0KSSBhbHNvIHRoaW5rIHlvdSBtaXNzZWQgdGhlIGNvbW1lbnRzIGJlbG93IGFzIHRo
ZXkgd2VyZSBub3QgYWRkcmVzc2VkIA0KaW4gdjUuIDspDQoNCj4gDQo+IC1UcmV2b3INCj4gDQo+
ID4NCj4gPj4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJl
LmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgLi4uL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2Vs
aXN0cy5pbmMgICAgIHwgIDEgKw0KPiA+PiAgIC4uLi9weXRob24vcHl0aG9uMy1jYWx2ZXJfMjAy
Mi42LjI2LmJiICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysNCj4gPj4gICAyIGZpbGVz
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDIyLjYuMjYuYmINCj4g
Pj4NCj4gPj4gZGlmZiAtLWdpdCBhL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9wdGVzdC1wYWNr
YWdlbGlzdHMuaW5jIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0
cy5pbmMNCj4gPj4gaW5kZXggMmY4MzEzMmFlYi4uYmQ5NWExM2ZmNiAxMDA2NDQNCj4gPj4gLS0t
IGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMNCj4gPj4g
KysrIGIvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMNCj4g
Pj4gQEAgLTU2LDYgKzU2LDcgQEAgUFRFU1RTX0ZBU1QgPSAiXA0KPiA+PiAgICAgICBwb3B0IFwN
Cj4gPj4gICAgICAgcHl0aG9uMy1hdG9taWN3cml0ZXMgXA0KPiA+PiAgICAgICBweXRob24zLWJj
cnlwdCBcDQo+ID4+ICsgICAgcHl0aG9uMy1jYWx2ZXIgXA0KPiA+PiAgICAgICBweXRob24zLWh5
cG90aGVzaXMgXA0KPiA+PiAgICAgICBweXRob24zLWppbmphMiBcDQo+ID4+ICAgICAgIHB5dGhv
bjMtanNvbnBvaW50ZXIgXA0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNhbHZlcl8yMDIyLjYuMjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY2FsdmVyXzIwMjIuNi4yNi5iYg0KPiA+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwLi4zMmI2Y2ZiZDQyDQo+ID4+IC0tLSAvZGV2
L251bGwNCj4gPj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNh
bHZlcl8yMDIyLjYuMjYuYmINCj4gPj4gQEAgLTAsMCArMSwyOCBAQA0KPiA+PiArU1VNTUFSWSA9
ICJTZXR1cHRvb2xzIGV4dGVuc2lvbiBmb3IgQ2FsVmVyIHBhY2thZ2UgdmVyc2lvbnMiDQo+ID4+
ICtIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vZGkvY2FsdmVyIg0KPiA+PiArTElDRU5T
RSA9ICJBcGFjaGUtMi4wIg0KPiA+PiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciDQo+ID4+ICsNCj4gPj4gK1NS
Q19VUkkgPSAiIFwNCj4gPj4gKyAgICBnaXQ6Ly9naXRodWIuY29tL2RpL2NhbHZlcjticmFuY2g9
bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwNCj4gPj4gKyAgICBmaWxlOi8vcnVuLXB0ZXN0IFwNCj4g
Pj4gKyINCj4gPj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMDU0OTNhM2IxNzUxN2VmMTc0OGZi
ZTYxMGRhMTFmMTA0ODVmYWE3YzQxNmI5ZDMzZmQ0YTUyZDc0ODk0ZjhiIg0KPiA+DQo+ID4gVGhp
cyByZWNpcGUgdXNlcyBHaXQsIGFuZCB0aHVzIHNob3VsZCBub3QgbmVlZCBhIFNIQS0yNTYgY2hl
Y2tzdW0uDQo+ID4NCj4gPj4gK1NSQ1JFViA/PSAiMzI2OGQ4YWNmMmMzNDVmMzJhMWM1ZjA4YmEy
NWRjNjdmNzZjY2E4MSINCj4gPg0KPiA+IENoYW5nZSBgPz1gIHRvIGA9YC4NCj4gPg0KPiA+PiAr
DQo+ID4+ICtpbmhlcml0IHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QNCj4gPj4g
Kw0KPiA+PiArUyA9ICIke1dPUktESVJ9L2dpdCINCj4gPj4gKw0KPiA+PiArUkRFUEVORFM6JHtQ
Tn0tcHRlc3QgKz0gIiBcDQo+ID4+ICsgICAgJHtQWVRIT05fUE59LXByZXRlbmQgXA0KPiA+PiAr
ICAgICR7UFlUSE9OX1BOfS1weXRlc3QgXA0KPiA+PiArICAgICR7UFlUSE9OX1BOfS11bml0dGVz
dC1hdXRvbWFrZS1vdXRwdXQgXA0KPiA+PiArIg0KPiA+PiArDQo+ID4+ICtkb19pbnN0YWxsX3B0
ZXN0KCkgew0KPiA+PiArICAgIGluc3RhbGwgLWQgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMNCj4g
Pj4gKyAgICBjcCAtcmYgJHtTfS90ZXN0cyAke0R9JHtQVEVTVF9QQVRIfS8NCj4gPg0KPiA+IFNo
ZWxsIGNvZGUgaW4gT0UtQ29yZSBpcyBleHBlY3RlZCB0byBiZSB0YWItaW5kZW50ZWQuDQo+ID4N
Cj4gPj4gK30NCj4gPj4gKw0KPiA+PiArQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2Rr
Ig0KPiA+PiAtLQ0KPiA+PiAyLjQwLjANCj4gPg0KPiA+IC8vUGV0ZXINCg0KLy9QZXRlcg0KDQo=

