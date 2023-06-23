Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84C5EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 11:22:44 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.74])
 by mx.groups.io with SMTP id smtpd.web10.39588.1687519359349726820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=L6Ho+hz/;
 spf=pass (domain: siemens.com, ip: 40.107.247.74, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J24gtsv5TjzgJuAw1RNWkhw9duhd4KYpzPHEMEVy8Z6FIubHjUdvLpzJCz3Hy3p+q0xl8AYFpGWuBzXQSTfKAFYad8ETD/h6pvMSK7HEWWzZJch5b3jNxSSNqQU/4T5Xd7/vnNzuql5WImmmL5Y52Im8rvAkf5ypcxf17h6nCSt6R89bLVo1W+Z9rRBfpvSecXVL1rRV/VySCoaj7O/atjy7DTpRLCEjwxaP/qig4VFO5MkZjXVnKHPywWoVx3fft3wEW5ilqN+yHzwklJo5Z7dRvuhFkb8FjV8LDcTmYcHcTS9v2Q0ariXqdurzQ4MPXjUHYnpyjpy27/RTWxHWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/UFob2M/rESgYWzZLclwoENws6ZTXmEhGxg+M0MqX8=;
 b=LQrT4P45zOePyWIFZo+X5bRdFHaXoFieFgAehCUFTuOa+BRj+GwtPieJMH94gvb6daq17JSpcLHJFM9wVg1j2q+eveMQUab702jPRPgIpIhrJpGvv39DU/KDS4WsEBdwDzBtplaGTeQfVGXyRT93Yv1uaE5BuNYlrzOakaywogeZPwdj8CuEdt4KrYgc0aXQKXsRZPl5xp/l/hFr2VMOzLJEc3Ui/QezXrAAe49gAhC+ZOCPP+GzwSy3dlV9RqseYy6bapmGSYu5RYV8xv4m/iviCwRY4IG4y6Ju9Ap8fhtLdp9Q9zXggA6kYrJdnQd4UlDudx/oX9gbE1DfYncXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/UFob2M/rESgYWzZLclwoENws6ZTXmEhGxg+M0MqX8=;
 b=L6Ho+hz/H/oUuJzRT316lRJ+OC53g9Z2LN9TTOtg/HXDmle86ZHAmEhx8c6FIMEM0ycr72ouwD7zZEoqJZtkbPqYWNRx3Tt2mXLaqHZrAKj8zJ3el9RlPDZ6BrIQuxQviyBhzz8jjE4E43eZAUTIzUWEtebOkelNjLQQdhDIZ4hA1q4mjhiKqDZeaThK3dz4J8oiLuBOtwx41Enp8IeYE2OFAqeKCKl0LXTJVi17vEjDMu4RErGbUeq16q1plbLXcq8JpriDulIkvVOYm0erXr8XybPcpyYWYMM11uguJkWGpUh85T1q6K/ctb0OHGDZvwdpGOONp2Wrf2Tf/vTRwQ==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DU0PR10MB7310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 11:22:36 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e%3]) with mapi id 15.20.6521.023; Fri, 23 Jun 2023
 11:22:36 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>
Subject: Re: [OE-core][PATCH v8 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Topic: [OE-core][PATCH v8 1/3] cve-check: add option to add additional
 patched CVEs
Thread-Index: AQHZpQEl7hbe4ybymkicdzs3W62G4K+YKbiAgAAWSoA=
Date: Fri, 23 Jun 2023 11:22:36 +0000
Message-ID: <9c35212b5c3f21e95b246bca90188ca595ab2b40.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230622120009.28939-2-andrej.valek@siemens.com>
	 <94754800-87B8-4051-89B2-B10546BCF342@arm.com>
In-Reply-To: <94754800-87B8-4051-89B2-B10546BCF342@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DU0PR10MB7310:EE_
x-ms-office365-filtering-correlation-id: 40a79003-7ff4-4aed-b99b-08db73dc2581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XZpqT2bvYbJzZDE1JIOY8YERorQ97kNc3qY4rYRFxLx9s4H9vGKR4OPmoHTdyk8U2m6gyhXZPs36bzohtRh4fXRLCEl6X5r4/czVenStORbSNPtstNSTkQpIfY9o9JME6ut7UppMPLlF2UKxWBahvnQXYtoT4IdruXh6pvW+p+YAfPMfBGwNENDCS+tPafoJrWV1dVAMlPe/DElk6LT1NkmolbJMziND/JFFHHICNic8sEjGo+93l17TH/EfG5lh8dKGKa0wygcJAiBoRpxzOyqorEw0ePAiyh7gm4EUH/zUu6PX1xEwdIH3iAw/+xcTWsBVFQWT/Gt85OOMgP3AlqrQE5W0a2YKMoghkun3/BCGmNyz8oWcplWIMqi2GXBngf80LUPrxJ8KKZKKpAw2qqyF4FCYMM1rsEX8QVQSc/b+hnOZ5ZsewXgSikaBtoqs2XcFweZs7LSM+HFpESDif93WpODG4XQrtFauQFKTEOM3QkqPlPD+HY+V1I1DhJcx+9XXQS2QQlloIWR7tqjH21J3QHacroSxzoEsT+D3SJ4hj2jBAn8xgzC1qazTQ8OgXh6XfxqxZECdex0SC6fZMHw+rs152mR7+4t4uzin3QcW5a0PnCeG/HmO2QvhKQgc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199021)(54906003)(6486002)(478600001)(2616005)(83380400001)(82960400001)(38070700005)(86362001)(53546011)(2906002)(66446008)(107886003)(186003)(71200400001)(26005)(6512007)(6506007)(64756008)(122000001)(36756003)(5660300002)(4326008)(6916009)(66476007)(91956017)(66556008)(76116006)(66946007)(8676002)(316002)(38100700002)(41300700001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TUpMOFlTVkZkZ2ZSZUl0dGh6YzBFbHhQRVJ3WjIvUWxDZFJsWHluY0s0bDE2?=
 =?utf-8?B?K0d1QUJuVktDM280RUtKYjZvK0JIYXVkZ1M4MC9yaUxXcEVSVlhKOWllMXAz?=
 =?utf-8?B?MzNyOEo0ejE4NktSaHVuOFBxd2RwYkR3WEJkcUwwVGg0Sjc0NFExd3MrbmZL?=
 =?utf-8?B?dzZMQ08yUGRxYjNHYXhkZUhFV1pTNm1ibmFaM1JkUEZCZ2dTMlcyTjFJczNp?=
 =?utf-8?B?WGtoREUvVXFxckNteXNpWEdRR3NGR3crZTV6VU1wQW1mRWUvbnpwNUxCWlYv?=
 =?utf-8?B?aVlHbmFtVDR0UXNsRWh6cWhMbFprRW5reU5mNUlIUTFzZ1p4eVAweWg0bE5k?=
 =?utf-8?B?SkhDY0JNem93aEc0b3U4VW1xSHJRVTNWN2dzM3E1ejA0NnNvaE9WeXpFa3VN?=
 =?utf-8?B?aGtYcUczNHBwTTJJR2Y2djZra014Wjl4SzlrNGY1dzhUaEJma3FuY1k3UWZ3?=
 =?utf-8?B?RnBOUEcrV0gwQTczYUdjME1VV21CYmwzNWlIYisxUEFIaFFnQ2lWcDNqMjBN?=
 =?utf-8?B?T0dETmx0QkNNVkR4OS9QQ1JVWWNodXRKSXdzWEpmamZKN2RGNDVpNnZRTDNk?=
 =?utf-8?B?SldrYnhVMXYyaWQ0RFZVbERobWtHa1lIVkRWZXpGbGdQVTFWTkMycnRxUExV?=
 =?utf-8?B?d2VzWGcrSVpnaVJLUlhOV1dEbUMySnBodTFRRVlMV05EMXdtbGx0Y3VaRjBp?=
 =?utf-8?B?NHozOFR5VVNSVElVdXhOb0pXMEFnTVJlY2RzZTJzb2tBZnRVR3daSnF2Rlc4?=
 =?utf-8?B?bVdwVXVnMkwwWWVrdWJ3T1IwY3lqVFNBTllNT1lEdDZCZDZMOC9KT2MxNWJM?=
 =?utf-8?B?dGJyaDlZTk9KZlBLbmlzV3ZaSUxxeHFNRVFNUFlGb1dhMDY5V29HR0xlWkdI?=
 =?utf-8?B?MFRBZUZwb1NFN2F2VjJqbEFXdXhlZHcyL0RNL04vZ3RoUnJUaEJYWWR2Ky9W?=
 =?utf-8?B?UWkvNm9MUEVPdTU1emg0N0VkK1d2V21OL2xocytUTmhvaWtZMUVvYUtUNnZS?=
 =?utf-8?B?cjZ0T1dTWlFaV2cwdkR1cHAwMVBNRnVvZWpZY0tUK2hWOWNkWUZLWEdOakxW?=
 =?utf-8?B?MUJXeExFWnVPaDVNOHJ5cUFHVktGUmxSaGlLNFRnMUxwZEIrajhONENYVnRr?=
 =?utf-8?B?SVdpS2VJWXhuVTJ5YzNEaUh1MVdtV1FWNk52M2wrcE4xcy9WaVRFSFNjR1pz?=
 =?utf-8?B?NERadm04RVhBNzJ5Z09wNndnaUtiNlVpTDJyRnM0ZXRZY3VOVWpjczFIQWht?=
 =?utf-8?B?UWZ1cm1YKzFuWXdzU01Sa01yWTJvclE2aUljaHY0SEFDRDFwS3ZWRmJmYXlF?=
 =?utf-8?B?bWNpYTZodlJoc2RVUWxZSzlYNlNmbUdSaFE2dlRPU3RwYjlzdkFkVm1BL2l5?=
 =?utf-8?B?WXAvNlUrcGc2UDVIajJkUDV0blpZMkpKaDl3SDhwWmN1NHJybnFCNHNhaUdL?=
 =?utf-8?B?aE5GMWs0TXExQjFkc1BrcjdrVE5Pb0RoTTJlbHNjRlBYcHdITG1QcjZDVjhR?=
 =?utf-8?B?RHZoWHBnSUwvdUNHT3Z5R2ozY1ljT0g1Vk1oUG5TZDBHTjRHNno1T040V2NW?=
 =?utf-8?B?TTZoTWpSWDRVOERsVUExdklRSk85OElLQUlZc240andiRHEwR213SlQ5Y3dt?=
 =?utf-8?B?RzhJYlV6dVY3dDhZMTh1YVhnR0tUTDVmaEE5MUp6dE50amVWNllZNFQ0K01S?=
 =?utf-8?B?dDgxWVJmWDNSZUlkajV5Y1dWc3o4ZjJEMGJxK0huaWRnMW5ZZXNRMzNJVnQ1?=
 =?utf-8?B?UVNqRTNxMXNoWEZvY1lnVXA5MnZ0MzBuY0UwbUd6NGN3eHFXZXJ5M1dST0tC?=
 =?utf-8?B?YXVqa0lJWlMycDJqTlRkZzc3VWhVZmU1dzZFTUE2Y0RWeU9MK2YvZlRvM2hm?=
 =?utf-8?B?Yk4xQWRLRVlIVDhQRlFaSlhGTk1RalRCbWFESWl0M0hCYitGeXJaVzJpOUlK?=
 =?utf-8?B?WEhsNkcxZjFrUWtqVEQveXJHTFZCckFvRkd5cHVSem1sZEpadEtlb2RoZEJk?=
 =?utf-8?B?czYwY2cwSXRmUjZkb1ZnY1E0YUJOb1hzMFRSSndwQ1VmM292dmovVmc3YWJE?=
 =?utf-8?B?STVmY1QwK3NpQkxhTHBnV1hpcjF6MkFYT2ovV3h0OHpYRWRDNnRkallNelIy?=
 =?utf-8?B?eFV3Q0FQUXJ5aWtSN2VReG5MMEtadGtBQVR5eTdsUUxEa0Y0dXhqdUZadVRN?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC1BC9BCC8023A49951BF74FC8869C48@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a79003-7ff4-4aed-b99b-08db73dc2581
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 11:22:36.1819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +vUwHoG3m5hUz3qMwyleM0kg5bguXgStGMb+lKr6+XMG4fuqi/IIEknmZ1XCyAMTZcRh28FDr4mClE2lGOQ4AIKTI2JgxKpkikOY3Zk5dq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7310
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 11:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183325

T24gRnJpLCAyMDIzLTA2LTIzIGF0IDEwOjAyICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gMjIgSnVuIDIwMjMsIGF0IDEzOjAwLCBBbmRyZWogVmFsZWsgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPGFuZHJlai52YWxlaz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gPiAtIFJlcGxhY2UgQ1ZFX0NIRUNLX0lHTk9SRSB3aXRoIENWRV9TVEFU
VVMgdG8gYmUgbW9yZSBmbGV4aWJsZS4NCj4gPiBUaGUgQ1ZFX1NUQVRVUyBzaG91bGQgY29udGFp
biBhbiBpbmZvcm1hdGlvbiBhYm91dCBzdGF0dXMgd2ljaA0KPiA+IGlzIGRlY29kZWQgaW4gMyBp
dGVtczoNCj4gPiAtIGdlbmVyaWMgc3RhdHVzOiAiSWdub3JlZCIsICJQYXRjaGVkIiBvciAiVW5w
YXRjaGVkIg0KPiA+IC0gbW9yZSBkZXRhaWxlZCBzdGF0dXMgZW51bQ0KPiA+IC0gZGVzY3JpcHRp
b246IGZyZWUgdGV4dCBkZXNjcmliaW5nIHJlYXNvbiBmb3Igc3RhdHVzDQo+IA0KPiBJIHRoaW5r
IHRoaXMgbmVlZHMgdG8gYmUgY2xlYXJlciBhYm91dCB3aGF0IHRoZSBpbnRlbmRlZCB1c2Ugb2Yg
dGhlIGtleXdvcmRzDQo+IGFyZS4NCj4gDQo+IElzIHRoZSBjYW5vbmljYWwgZGF0YSB0aGUgQ1ZF
X1NUQVRVU1tDVkUtMTIzNC01Njc4XSBhdHRyaWJ1dGUsIGFuZCB0aGUgbWFwcGluZw0KPiBmcm9t
IHRoZSBzdGF0dXMgdGhlcmUgdmlhIENWRV9DSEVDS19TVEFUVVNNQVAgc2ltcGx5IGZvciBiYWNr
d2FyZHMNCj4gY29tcGF0aWJpbGl0eSB3aXRoIHRoZSBleGlzdGluZyBmaWxlIGZvcm1hdD8gSXMg
dGhpcyBkZXByZWNhdGluZyB0aGUgc3RhdHVzDQo+IGZpZWxkcyBpbiB0aG9zZSBmaWxlcyBvciBp
cyBpdCBqdXN0IGEgaGlnaC1sZXZlbCBzdW1tYXJ5PyBFaXRoZXIgd2F5LCB0aGF0DQo+IHNob3Vs
ZCBiZSBtYWRlIGNsZWFyLg0KPiANClllcywgaXQncyBmb3IgYmFja3BvcnQgY29tcGF0aWJpbGl0
eSwgYW5kIGV4dGVuZGluZyB0aGUgZXhpc3RpbmcgIklnbm9yZWQiLA0KIlBhdGNoZWQiIHN0YXR1
c2VzIHdpdGggcmVhc29ucy4NCg0KPiA+ICsjIFBvc3NpYmxlIG9wdGlvbnMgZm9yIENWRSBzdGF0
dXNlcw0KPiA+ICsNCj4gPiArIyB1c2VkIGJ5IHRoaXMgY2xhc3MgaW50ZXJuYWxseSB3aGVuIGZp
eCBpcyBkZXRlY3RlZCAoTlZEIERCIHZlcnNpb24gY2hlY2sNCj4gPiBvciBDVkUgcGF0Y2ggZmls
ZSkNCj4gPiArQ1ZFX0NIRUNLX1NUQVRVU01BUFtwYXRjaGVkXSA9ICJQYXRjaGVkIg0KPiA+ICsj
IHVzZSB3aGVuIHRoaXMgY2xhc3MgZG9lcyBub3QgZGV0ZWN0IGJhY2twb3J0ZWQgcGF0Y2ggKGUu
Zy4gdmVuZG9yIGtlcm5lbA0KPiA+IHJlcG8gd2l0aCBjaGVycnktcGlja2VkIENWRSBwYXRjaCkN
Cj4gPiArQ1ZFX0NIRUNLX1NUQVRVU01BUFtiYWNrcG9ydGVkLXBhdGNoXSA9ICJQYXRjaGVkIg0K
PiA+ICsjIHVzZSB3aGVuIE5WRCBEQiBkb2VzIG5vdCBtZW50aW9uIHBhdGNoZWQgdmVyc2lvbnMg
b2Ygc3RhYmxlL0xUUyBicmFuY2hlcw0KPiA+IHdoaWNoIGhhdmUgdXBzdHJlYW0gQ1ZFIGJhY2tw
b3J0cw0KPiA+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW2NwZS1zdGFibGUtYmFja3BvcnRdID0gIlBh
dGNoZWQiDQo+ID4gKyMgdXNlIHdoZW4gTlZEIERCIGRvZXMgbm90IG1lbnRpb24gY29ycmVjdCB2
ZXJzaW9uIG9yIGRvZXMgbm90IG1lbnRpb24gYW55DQo+ID4gdmVyaW9uIGF0IGFsbA0KPiA+ICtD
VkVfQ0hFQ0tfU1RBVFVTTUFQW2ZpeGVkLXZlcnNpb25dID0gIlBhdGNoZWQiDQo+IA0KPiBJdCBi
b3RoZXJzIG1lIHRoYXQgc29tZSBvZiB0aGVzZSBzdGF0dXMgZmxhZ3MgYXJlIHdvcmtpbmcgYXJv
dW5kIHRoZSBmYWN0IHRoYXQNCj4gdGhlIENQRSBpcyBpbmNvcnJlY3QsIHdoZW4gdGhhdCBDUEUg
ZGF0YSBjYW4gYmUgZml4ZWQuwqAgSW5zdGVhZCBvZiBzZXR0aW5nDQo+IGZpeGVkLXZlcnNpb24s
IHdlIGNhbiBqdXN0IG1haWwgTklTVCBhbmQgZml4IHRoZSBDUEUuDQo+IA0KWWVzLCBidXQgd2hp
bGUgeW91J3JlIHNlbmRpbmcgaXQsIHRoZSBjdXJyZW50IHN0YXR1cyBoYXMgdG8gYmUgY292ZXJl
ZC4gQW5kIHlvdQ0KZG9uJ3Qga25vdywgaWYgdGhlIENQRSB3aWxsIGJlIGZpeGVkIG9yIG5vdC4N
Cj4gPiArIyB1c2VkIGludGVybmFsbHkgYnkgdGhpcyBjbGFzcyBpZiBDVkUgdnVsbmVyYWJpbGl0
eSBpcyBkZXRlY3RlZCB3aGljaCBpcw0KPiA+IG5vdCBtYXJrZWQgYXMgZml4ZWQgb3IgaWdub3Jl
ZA0KPiA+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW3VucGF0Y2hlZF0gPSAiVW5wYXRjaGVkIg0KPiA+
ICsjIHVzZSB3aGVuIENWRSBpcyBjb25maXJtZWQgYnkgdXBzdHJlYW0gYnV0IGZpeCBpcyBzdGls
bCBub3QgYXZhaWxhYmxlDQo+ID4gK0NWRV9DSEVDS19TVEFUVVNNQVBbdnVsbmVyYWJsZS1pbnZl
c3RpZ2F0aW5nXSA9ICJVbnBhdGNoZWQiDQo+ID4gKw0KPiA+ICsjIHVzZWQgZm9yIG1pZ3JhdGlv
biBmcm9tIG9sZCBjb25jZXB0LCBkbyBub3QgdXNlIGZvciBuZXcgdnVsbmVyYWJpbGl0aWVzDQo+
ID4gK0NWRV9DSEVDS19TVEFUVVNNQVBbaWdub3JlZF0gPSAiSWdub3JlZCINCj4gPiArIyB1c2Ug
d2hlbiBOVkQgREIgd3JvbmdseSBpbmRpY2F0ZXMgdnVsbmVyYWJpbGl0eSB3aGljaCBpcyBhY3R1
YWxseSBmb3IgYQ0KPiA+IGRpZmZlcmVudCBjb21wb25lbnQNCj4gPiArQ1ZFX0NIRUNLX1NUQVRV
U01BUFtjcGUtaW5jb3JyZWN0XSA9ICJJZ25vcmVkIg0KPiA+ICsjIHVzZSB3aGVuIHVwc3RyZWFt
IGRvZXMgbm90IGFjY2VwdCB0aGUgcmVwb3J0IGFzIGEgdnVsbmVyYWJpbGl0eSAoZS5nLg0KPiA+
IHdvcmtzIGFzIGRlc2lnbmVkKQ0KPiA+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW2Rpc3B1dGVkXSA9
ICJJZ25vcmVkIg0KPiA+ICsjIHVzZSB3aGVuIHZ1bG5lcmFiaWxpdHkgZGVwZW5kcyBvbiBidWls
ZCBvciBydW50aW1lIGNvbmZpZ3VyYXRpb24gd2hpY2ggaXMNCj4gPiBub3QgdXNlZA0KPiA+ICtD
VkVfQ0hFQ0tfU1RBVFVTTUFQW25vdC1hcHBsaWNhYmxlLWNvbmZpZ10gPSAiSWdub3JlZCINCj4g
PiArIyB1c2Ugd2hlbiB2dWxuZXJhYmlsaXR5IGFmZmVjdHMgb3RoZXIgcGxhdGZvcm0gKGUuZy4g
V2luZG93cyBvciBEZWJpYW4pDQo+ID4gK0NWRV9DSEVDS19TVEFUVVNNQVBbbm90LWFwcGxpY2Fi
bGUtcGxhdGZvcm1dID0gIklnbm9yZWQiDQo+IA0KPiA+ICsjIHVzZSB3aGVuIHVwc3RyZWFtIGFj
a25vd2xlZGdlZCB0aGUgdnVsbmVyYWJpbGl0eSBidXQgZG9lcyBub3QgcGxhbiB0byBmaXgNCj4g
PiBpdA0KPiA+ICtDVkVfQ0hFQ0tfU1RBVFVTTUFQW3Vwc3RyZWFtLXdvbnRmaXhdID0gIklnbm9y
ZWQiDQo+IA0KPiBJcyB0aGlzIGFueSBkaWZmZXJlbnQgdG8g4oCYZGlzcHV0ZWTigJk/DQo+IA0K
T2YgY291cnNlLiBJbiB0aGUgInVwc3RyZWFtLXdvbnRmaXgiIHN0YXR1cywgd2Uga25vdywgdGhh
dCBpdCB3b24ndCBiZSBmaXhlZC4NCkJ1dCBmb3IgImRpc3B1dGVkIiB5b3UgZG9uJ3Qga25vdywg
aWYgaXQncyBhIGJ1ZyBvciBub3QuDQoNCj4gRG8gd2UgZXhwZWN0IHRvIGFkZCBhIGxvdCBtb3Jl
IHN0YXR1c2VzIHRvIHRoaXMgdGFibGUsIG9yIGZvciB1c2VycyB0byBhZGQNCj4gdGhlaXIgb3du
IHZhbHVlcz8gSXQgZmVlbHMgbGlrZSBtYXliZSB0aGlzIHNob3VsZCBiZSBhIGRpY3QgaW4NCj4g
bGliL29lL2N2ZV9jaGVjay5weSBpbnN0ZWFkIG9mIGV4cG9zZWQgaW4gdGhlIGRhdGEgc3RvcmUu
DQo+IA0KRXhhY3RseSwga25vdyBJIG1vdmVkIGl0IHNlcGFyYXRlZCBmaWxlLCB3aGVyZSB1c2Vy
cyBjb3VsZCBleHRlbmQgdGhlaXIgb3duDQpzdGF0dXNlcy4gVGhlIGN1cnJlbnQgdmVyc2lvbiBp
cyBqdXN0IGEgImJhc2VtZW50IiBvZiBzdXBwb3J0ZWQgb25lLg0KDQo+ID4gK8KgwqDCoCAjIFBy
b2Nlc3MgQ1ZFX1NUQVRVU19HUk9VUFMgdG8gc2V0IG11bHRpcGxlIHN0YXR1c2VzIGFuZCBvcHRp
b25hbA0KPiA+IGRldGFpbCBvciBkZXNjcmlwdGlvbiBhdCBvbmNlDQo+ID4gK8KgwqDCoCBmb3Ig
Y3ZlX3N0YXR1c19ncm91cCBpbiAoZC5nZXRWYXIoIkNWRV9TVEFUVVNfR1JPVVBTIikgb3IgIiIp
LnNwbGl0KCk6DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGN2ZV9ncm91cCA9IGQuZ2V0VmFyKGN2ZV9z
dGF0dXNfZ3JvdXApDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmIGN2ZV9ncm91cCBpcyBub3QgTm9u
ZToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgY3ZlIGluIGN2ZV9ncm91cC5zcGxp
dCgpOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZC5zZXRWYXJGbGFnKCJD
VkVfU1RBVFVTIiwgY3ZlLA0KPiA+IGQuZ2V0VmFyRmxhZyhjdmVfc3RhdHVzX2dyb3VwLCAic3Rh
dHVzIikpDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGVsc2U6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYmIud2FybigiQ1ZFX1NUQVRVU19HUk9VUFMgY29udGFpbnMgdW5kZWZpbmVkIHZhcmlh
YmxlICVzIiAlDQo+ID4gY3ZlX3N0YXR1c19ncm91cCkNCj4gPiArfQ0KPiANCj4gQ1ZFX1NUQVRV
U19HUk9VUFMgaXNu4oCZdCBkb2N1bWVudGVkIGluIHRoZSBjbGFzcyBvciB0aGUgY29tbWl0IG1l
c3NhZ2UuDQo+IA0KQWRkZWQgYSBkZXNjcmlwdGlvbiBkaXJlY3RseSBpbnRvIGNsYXNzLg0KPiAN
Cg0KUmVnYXJkcywNCkFuZHJlag0KDQo=

