Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A75C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 02:32:14 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.108])
 by mx.groups.io with SMTP id smtpd.web11.5557.1707964325318000940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 18:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=IN/oWsPX;
 spf=pass (domain: aspeedtech.com, ip: 40.107.255.108, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCHTbaQyoJOyYWuZ3YaKTa/lHMYMNNpRF52W/ID5t32gwiBzBHjTuzhviHbKebJD8jASOMu3Uq4DnPvx1TD1wjXYsUA+5LrYe8xUI3HMi3yRrvnv5dg5xcsV7nH2+ZfTtz2GAhNEQmOHA+D+fc3REyCVrZRdkAlyt8LFJl9JC0//bPM3u1Fl6sArLeJ5EyzC4P3RLBA0N9oqJ4B+myQC1JI5J0L6EU89b01dOfBKlPMEkJjdqKjkWAoVlwFfwE8kqZq1m63CCuzbigJMGz4oxe/SgP9ta3W765f88sTofQ6DNp7rLmxloRFiAPhM/2pzF/iFDktUZ98qLQlSaxjNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9YGJf/f0uIbXFaay3+MYY60JOOU1yjY9jFhlPsYtV4=;
 b=E+mybWNs9ccbUAevTOHbCjE+Rj11jG+n0fOiJSHPhxQzzJoifJ6WbQrydn7Y608nqK87sfF7LLrTVbl2zOW0Pn9u6zf5bTybnjV+t2gE5id+G7IezE4jeXLwb7Qjx9CII2PJDyaGuAE3bSQ0ggRgWVIYikA96rJKWs5F1fZ+StXwICYuemQHyw87/q+nSTuIfCKh1QF/qAUj6Swdg70QqpLDPbZxFedXbQuFG45bFuyxy9uNDksZ5qM+SgAMCteZih3Kly1KIn8iOpL2YSow4X3YuUv+lIIxxXQS8bXT3r7yp5bQ6KVKG6SyZdYTcS/9b0f0uorJ4dbmJy3mIrGJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9YGJf/f0uIbXFaay3+MYY60JOOU1yjY9jFhlPsYtV4=;
 b=IN/oWsPXrdA3nnjxYGfj6zQRFsS6+k4qpesURRyDgntFvMImSSntgG25B1M5DJpQrpzFDf/L7XaYyOObzJYc7pjeIoc9XEy1OFu8nUfzxadpAnmXKjRaST3/u/eyCWVPG+OUI6ObD9jNSfk2zrnVJqD6xkFQN73dp6jIKC+MoS+X9tho4JIqIyYqSEI5cr0+Ft4LZjo8b/CISMwoneEMgaP9vP6dc/8HIiz9VsR+OtBvcx8pF+LIqvfM2rDFGjx5gbOwMTVAM/qa5FWM6UVrHtmCfp+JdktxAK4Ta94JwIxZ0iip33hOGzglIi/OSh5apXVwWyCXYZCmOtp/8SLoxA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SEZPR06MB6530.apcprd06.prod.outlook.com (2603:1096:101:182::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.29; Thu, 15 Feb 2024 02:31:57 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::79a8:927d:1e03:51d0]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::79a8:927d:1e03:51d0%7]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 02:31:57 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Subject: RE: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os and
 TFA images
Thread-Topic: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os
 and TFA images
Thread-Index: AQHaUHnSn8xRov1apkuLt4TyN8Gja7DzoHvQgABQt4CAAMsicIAMFMGAgAn6VhA=
Date: Thu, 15 Feb 2024 02:31:56 +0000
Message-ID: 
 <SI2PR06MB5041F74087677E46F1438834FC4D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
 <20240119061937.1368163-4-jamin_lin@aspeedtech.com>
 <12ffb6f38cba0eacf365bb36806a1bd2f69771d2.camel@linuxfoundation.org>
 <SI2PR06MB50416E075AE969B6C4A9CEC1FC7C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <1c46d3bc00ebe9047e5748e4b4c189cbb91a5ba7.camel@linuxfoundation.org>
 <SI2PR06MB504170D87B4DF9C3B8C2A7DCFC432@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <04A0E909-F115-482B-839F-99547E8CA05F@arm.com>
In-Reply-To: <04A0E909-F115-482B-839F-99547E8CA05F@arm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SEZPR06MB6530:EE_
x-ms-office365-filtering-correlation-id: f7c471a4-be09-49ae-86cb-08dc2dce47bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GYxvd/gmIko7JFhK930eLZwFu72GQGA4NRecSMwaW5VikMa0iK2mSTGBdqTVaTVywJ/OfZEdTeS8UwQMIApXTEHlkMqI1EO0J0lHoyhVPqIilBYyPKzqBJFS/KmbCkNA+StWjbd/BdCwazq6aNh6K1nzE3BYq6cDGosZ88DMzuaFwy4ZmDM2JSv9aishnI0caP6Pi8vkAuHQcVx9+8KPe9GEZkihDHOkoJvhaAVgX6GDPQFF1OS/5G5tc/8bESazsbZjfW7qHIjtN9F+VN65krEiLlRDfneSmBYTs1bSvRjCRIvhv5roP3GtQ86aUxIY47QhSOmpP5LrKokZ3/Fp5l09W/6KOiA9P0lQrnt/oogacVr8tZ7UXR9fOlqbaRWF4WdtlClFb1y8/596t8oyGI8NeGrFwBCZigFyZAQ3gJEUOJpnnN8S4MB+YTlU5f2xtrcu6UZHsNRMnDWlY8d28GklAg6YvE0JyQUmfxm297BIp8nsc8//0+BUlhZi1yV26Q/BtJ5xe9zns+3mkhstH91S72XP6oy3DMtnYm+cLtdXEZvTXSI5D6BKMbJ5KQQ6MfjmCR+EOvLheWC5z3q1IjcNOpQxbv5QfBGT+kflreA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(366004)(396003)(136003)(346002)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(122000001)(5660300002)(33656002)(86362001)(2906002)(52536014)(8936002)(8676002)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(6916009)(4326008)(38100700002)(478600001)(41300700001)(26005)(83380400001)(38070700009)(71200400001)(316002)(54906003)(53546011)(9686003)(7696005)(6506007)(966005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MzBPTTVINW1SbUVwNXlZRy93VUlxdEg2MU1sSWlOVGx6RmJUd1BlVXZka21D?=
 =?utf-8?B?MWVLUW5MUWJrT1JFbDNzYVdmbHdwSnR1bDhEQnBnMVh0b0IvdndqWXNaVHlC?=
 =?utf-8?B?czhkT3hXVk9tRDZYQkVyZW55U0tCbXJTNFdhY2JHSlRXd2U3c2JTMlc0RDU3?=
 =?utf-8?B?eWErank1d1BSK0FvcU9VZEF4YWhWL01TQ3dJeGF6YlZHbWkwR3B5QkpnVE1K?=
 =?utf-8?B?M3pMUVpPajlQSnNtL2hFZDQ2SE5UdURwSXhiNEcwUlRVSGFxNGhGaDlKTVJi?=
 =?utf-8?B?OGp2c2M0Ny9IMXF4Y1lOSkJoQnUzV2NHM2c0ZCs0U05wK2dyc3JiQVM0eHhO?=
 =?utf-8?B?RkNFUmMvQUFxWGkxQWo0aUNnVmZ2djVtR1ltbm5DYXJHa29NdW80SGwrVlpM?=
 =?utf-8?B?UkdJNjA5dVRINFpiZHdwSkVMc25IQVFaQ2hqb3F3bjhzZzk4aUxndUgxa2NQ?=
 =?utf-8?B?RGwwZm1ZWkhmZDIzWldaV0t0NTBPbDR5a2I1bXRtbGJwZkhCODYwL0lPUUlS?=
 =?utf-8?B?bStUb3EwWXhWNnJ3K1RNR08zaU0wRWFZL0g4YjEwWnpoeGhQMHNtN3QwQWlx?=
 =?utf-8?B?QXV2bmxsUEt0cVd2c0d0Z0xoL3FsYXhFZWJTTmF3aEZ0aW5mV2FFYm96eVd5?=
 =?utf-8?B?NTM1VHpVQ093VStCUVlFUkIvZW9qWDAvSWJpaEVZYWYrbGQwWU9hdkRYanVv?=
 =?utf-8?B?UEVsWEdQMXNDNlF2M3VGdi9PSy9jem1zYlhTWHRyMFFTZFRHTVRhWkZMcDdy?=
 =?utf-8?B?UTc0RHZDdWY2cm8rWS9kbndyaEJ1TlJXOEo1NFR5amVYcUdweCtOaHQ3NitJ?=
 =?utf-8?B?Y21qbnBBQW5McjhWRm9JYlhPaGZNbDJkeFhPMGlpaEk0MDFjYy9OSWhib2cr?=
 =?utf-8?B?TnBuNVEwa1ExaUxVbVVtbkNJUTk0Y1lZNXNVQzNubnhwVmNwRzQvbVo5TXpZ?=
 =?utf-8?B?R3Rlcmx3WlZGNFhlYmZyRG9BTmJjdVdtcGROa0JtNlpBNlMxRklPWWFkek0w?=
 =?utf-8?B?Vmt5bFViOWpGcVRnb0Q2UjhkUWVNQTJ4T1BUQklpRVJDWEYxVTZKRXo1YlJT?=
 =?utf-8?B?U2loYkVVbTlVbEcvK3ZTOEhIQzVVbjJ0amhWeDEzRE9nUnNRd1ZQekZrRTVK?=
 =?utf-8?B?YU5zOVc1Sm1IMGJVUXV4NHoveEhTR284WDdNQnZvUXhBY3I3TlI3UFRTVnNY?=
 =?utf-8?B?RHFEbWVpUy9qOHBWNC9jRkhFSW9FaUpHSVlQNzZMcVcxRkF3VWxpT1docjlC?=
 =?utf-8?B?eDIyYytHNlZnVmJqTlBXaHYwd3hwaVJtMldUbk82TkhDNGRpMUg2YXBVaVhZ?=
 =?utf-8?B?Vm82K1JPdkF6V3JXTGVoRSsyOU9RVEVtaXZ6TnVpTXBrSUNKS1prblMwOG9Q?=
 =?utf-8?B?RFRGOHVlVmpwaFhNeFlEb3FzVzV4M05RYjIwaTFDVVZpYm0ySkU0b2tKcmhL?=
 =?utf-8?B?WTVqZjR2a0txSjVRclB4dzM1ZGtoQ2xoQUpRY2cycTZrNnpkdElNVWJ5UjV1?=
 =?utf-8?B?SHQ5NnMvYWo3OC9PNW4vdnZUa05KVzVlbTRyYnZDM0Uvd3R0a0czeEJ5Tm1P?=
 =?utf-8?B?V3pQQUM1YTJwQ1hic3lXdjhWOXp3T2VMTklxMk4xZWZPczFKSXYvemcwTC95?=
 =?utf-8?B?WHpVbWxGRElaRmdpdUxMMitmUlMyeHlESkVWdWxTc2JIcnZpQUFCNGRLZ3RU?=
 =?utf-8?B?NXhzMUM0SEhlVmZKd3E2UEUwWFh4VSs1dDRkV3lybTZOYWQ5a2YyMmhiWmRt?=
 =?utf-8?B?VlpQN2NuSWZmZEZKMW1VdXRnbDA1azBhL3lEWGhZV1ZVQ1Y5emtlK1ZVK1pI?=
 =?utf-8?B?RVBTNFVMdGV3d01DSENjUjd0MC93Y0ljTUp2VEIwVkJpcDFxK0RaRUxmaTUw?=
 =?utf-8?B?TGV6ejBrUmlZVUNRNllCd1Q0ZEpIdStySytnNlI1UXFKVHBvZy9ndldueU5k?=
 =?utf-8?B?WllCQ0QxUXQ4U29ySVJLWC9RWGgzVysyUER3SE0vTEJUWUlDdGZhRWhxdmd3?=
 =?utf-8?B?SFB2Nk5Ia2UvVWUybGZnTzRsUk1vSnl3UEdkeG5jZ0tVT3c1S29pYlIvOUtR?=
 =?utf-8?B?eVZPaUFSWEJwYkFEc08xQTRUVFJCR1ZibHhyb1VXQVIrMUhha3hJTExEMzRZ?=
 =?utf-8?Q?27+t+IpRFXckjphLiIHP9t7aU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c471a4-be09-49ae-86cb-08dc2dce47bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 02:31:56.9365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6lHqUZOr/xN9ooRtgRKd7Kd6hT/x12jzC8kWCzTR5pFQa2/SiM0NDWrb0O4NcUlIxv3cV/whzi+BPbWX/ZdsVvwLgBPQcw/kFLEz3QkpvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6530
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 02:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195503

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSA5LCAyMDI0IDI6MDMgQU0N
Cj4gVG86IEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KPiBDYzogUmljaGFy
ZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ow0KPiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBKb24gTWFzb24NCj4gPEpvbi5NYXNv
bkBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2MiA0LzRdIHVib290
LXNpZ246IHN1cHBvcnQgdG8gbG9hZCBvcHRlZS1vcyBhbmQNCj4gVEZBIGltYWdlcw0KPiANCj4g
T24gMSBGZWIgMjAyNCwgYXQgMDI6MDAsIEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2gu
Y29tPiB3cm90ZToNCj4gPiBJdCBzZWVtcyB0aGF0IEkgY2FuIHJlZmVyL21vZGlmeQ0KPiA+IG9w
ZW5lbWJlZGRlZC1jb3JlL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvZml0aW1hZ2UucHko
b25seSBhZGQgdGVzdA0KPiBjYXNlIHRvIHRlc3QgdS1ib290IGZpdCBpbWFnZSBmb3Igb3B0ZWUt
b3MgYW5kIHRydXN0cmVkLWZpcm13YXJlLWEpIGFuZCBDb3B5DQo+IHRoaXMgZmlsZSBpbnRvIG1l
dGEtYXJtIGxheWVyIGluIHRoaXMgZGlyZWN0b3J5LA0KPiBodHRwczovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL21ldGEtYXJtL3RyZWUvbWV0YS1hcm0vbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvDQo+
IHRlc3RzLg0KPiA+DQo+ID4gUmVnYXJkaW5nIHRoZSB1LWJvb3QgZml0IGltYWdlIGdlbmVyYXRp
b24gZGVwZW5kZW5jeSwgY2FuIEkgYWRkIG9wdGVlLW9zDQo+IGFuZCB0cnVjdHJlZC1maXJtZWFy
ZSBkZXBlbmRlbmN5IGluDQo+IG1ldGEtYXJtL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfJS5i
YmFwcGVuZCBhbmQgdGhlIGNvbnRlbnRzIG9mDQo+IHUtYm9vdF8lLmJiYXBwZW5kIGFzIGZvbGxv
d2luZy4NCj4gPg0KPiA+IGRvX2NvbXBpbGVbZGVwZW5kc10gKz0gIiBcDQo+ID4gICAgJHtAYmIu
dXRpbHMuY29udGFpbnMoJ1VCT09UX0ZJVF9PUFRFRV9PUycsICcxJywgJ29wdGVlLW9zOmRvX2Rl
cGxveScsDQo+ICcnLCBkKX0gXA0KPiA+ICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdVQk9PVF9G
SVRfQVJNX1RSVVNURURfRklSTVdBUkVfQScsICcxJywNCj4gJ3RydXN0ZWQtZmlybXdhcmUtYTpk
b19kZXBsb3knLCAnJywgZCl9IFwNCj4gPiAgICDigJwNCj4gDQo+IEl0IGZlZWxzIHRvIG1lIHRo
YXQgd2XigJlyZSBzbG93bHkgY3JlYXRpbmcgdHdvIHBhcmFsbGVsIGdlbmVyYWxpc2VkIGZpdCBp
bWFnZQ0KPiBjbGFzc2VzLCBvbmUgY2FsbGVkIOKAnHVib290X3NpZ27igJ0gYW5kIHRoZSBvdGhl
ciBjYWxsZWQg4oCca2VybmVsLWZpdGltYWdl4oCdLi4uDQo+IFN1cmVseSB0aGVyZSBzaG91bGQg
YmUganVzdCBfb25lXyBmaXQgaW1hZ2UgY3JlYXRpb24gY2xhc3MgdGhhdCBjYW4gZG8NCj4gZXZl
cnl0aGluZyBpbiBhIGdlbmVyYWxpc2VkIHdheT8NCj4gDQpIaSBSb3NzLA0KDQpJIGFtIG5vdCB0
aGUgbWFpbnRhaW5lciBvZiB1Ym9vdC1zaWduLmJiY2Fsc3MgYW5kIGtlcm5lbC1maXRpbWFnZS5i
YmNsYXNzLg0KSSBkb24ndCBrbm93IHdoZXRoZXIgdGhlIG9ubHkgb25lIC5iYmNsYXNzIGZvciB1
LWJvb3QgYW5kIGtlcm5lbCBmaXQgaW1hZ2UgZ2VuZXJhdGlvbiBpcyBhIGdvb2Qgc29sdXRpb24g
b3Igbm90Lg0KDQpJdCBzZWVtcyB0aGF0IGEgc2luZ2xlIC5iYmNsYXNzIHRvIGNyZWF0ZSB0d28g
Zml0IGltYWdlIGlzIHRvbyBjb21wbGljYXRlLg0KMS4gb25seSB1LWJvb3QgZml0IGltYWdlIGhh
cyBURkENCjIuIG9ubHkga2VybmVsIGZpdCBpbWFnZSBoYXMgcmFtZGlzYw0KVGhhbmtzLUphbWlu
DQoNCj4gUm9zcw0K

