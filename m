Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62106C001B1
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 09:44:44 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web11.38533.1687513475209337687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 02:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=WKcsPwfO;
 spf=pass (domain: navimatix.de, ip: 40.107.249.65, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iClZTbQuVxkz2lk4RgNdvgHtnASZiMivMpN3jPChW/i7Koyjxe2Dx+GSmGerpitno7TZ9DoY+xSebt5Oaghx2igpK5a6LmxMrw1AMV05Nw2N5Hpe/pssya7bb47xd0pc1UMHaqNWtunujliV7xRDwKjiLbTXOwNiLt7hkKVg5i/gEIvbwMaT49mrFgpMFbsY2PTXXeGnAMv85zjnrVnyqDocz1Kh4jSZQhmgjwFpmQkopkTn06Ad029iiNc4I9wMHvw+mUgq5UE47NYm8cA7V5FYdIkPXi2s/MP+kpN8FyAm5GvNUIBzI78aSEmffOUc8mEDO7KM1+K9ruwu9q6TDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDYk78maO8hwu5AJ7KijHriUcoOrzBF8dRH0yVhFgt4=;
 b=NjaDw1+FNpHzXpO9tp6HktdlZQtmLBKqUh0p+2zlsYQWQR2yPpPO3lNe3cwJ/fDXLDfgsVgInUj7lAn3EmDkR251HxiHP4fnWAQzOX2s2xf5QzlP8Tg5wRapBVK9zUxkgAO6lIiujRc5R3NcpKRs4AQ+ORnQluB8c81nSH9MZjl06u/ea5D4Vi0+ncaLs1uKNAMWWqYsHz389OmJ/ChJ/4CQ7IpDTl8aiXATEd3uCR3of6KNRU1Umtria0p2AeYrcVYcilAr8ffcYT8ZG+mmiOp0Rl7GprPcbeYS6UV7lkFGvCl0rMb0a9sWajscDwdH2TeSntm1BMztsxtQAQx+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDYk78maO8hwu5AJ7KijHriUcoOrzBF8dRH0yVhFgt4=;
 b=WKcsPwfOlss9n7a1oeVV1sYrT4gFnrk9hltlMga1uLSg5Vgp8Y07Ya7lh6dgtYGNYdDIQBSRjbsSez2FDNMzIam5UCj+hEQUWYRSQJcOP9jJAhnHWLtMxmXEobKT7Tkz0UgmZEG7AL25dQ3AOMwyJEScKB0JCmnr9f1AJddFnlc=
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS8PR01MB7702.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2af::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 09:44:31 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::c7e1:753a:b31b:9135]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::c7e1:753a:b31b:9135%5]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 09:44:31 +0000
From: =?utf-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
CC: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH 4/9] runqemu-ifup: remove only our taps
Thread-Topic: [OE-core] [PATCH 4/9] runqemu-ifup: remove only our taps
Thread-Index: AQHZpSyR9ghP+mVwa0uZGVgjv6L8wK+YIrsM
Date: Fri, 23 Jun 2023 09:44:31 +0000
Message-ID: 
 <VI1PR0102MB3136D294CB80AED2FACE668BFC23A@VI1PR0102MB3136.eurprd01.prod.exchangelabs.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
 <20230622170946.10082-5-adrian.freihofer@siemens.com>
In-Reply-To: <20230622170946.10082-5-adrian.freihofer@siemens.com>
Accept-Language: en-DE, de-DE, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR0102MB3136:EE_|AS8PR01MB7702:EE_
x-ms-office365-filtering-correlation-id: 9290a7db-a1d3-4a68-db7b-08db73ce71ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HiVzcVXrxpgqcJZyDrSEKfNVsj79+IiOMRAhxQbS4D61weI0z4OCQXLS5Ong/GZpg1o8aasuMP7yN+ux/bjH3S2xa2qghwNw4U78BE3ATJamaDu8WsGdz1LVb8PQ7R62eF/GOcV5SQdNT/RNnBJZHGiohRZgT1yjwX72IqzJme+HUih863vCzjdgmRzw2KxEGXkLZ3QQjcLix3d2ebrlfuplcE7YGvPXmKEECqPila8/NN9n9JB+fTdHUXapqS+zg6c1VZYFBocJAhn8i69tmM53FhsB/ZY9opTTT78ZHC6egI0XK/XWMKN8b1hzrzhyiJg7l/VEeE9eqpZEkPf9rDBIYOP/GfJhxPkEa0ONuVPdCt3/ESinrV+aYm/htfVajDIA+YnHJDyCD6vsXUMqo2oYAWWtJw5SKvWg/h18w32xd8L1+yJGA0VgxsNjcwLfCI+SKKsI7mcs+GUu0c/jfEY6b3zFEQmgUQfukE6h+yjFeB+ego6IEQXhqVXOJcex3XGE1CZvOu+r6SOfeuxJSWRVQ/kbvyxvHw7YklIV+nWH/lP3Vcpqyt4PUZSY3rZlJQznF1m8fhqk95VuRkxj+ThsmEr2DhuKmqSgXSvTqKM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39840400004)(136003)(366004)(451199021)(316002)(4326008)(8936002)(2906002)(41300700001)(8676002)(19627405001)(5660300002)(52536014)(66476007)(66946007)(64756008)(66446008)(66556008)(91956017)(76116006)(508600001)(110136005)(38070700005)(86362001)(7696005)(38100700002)(33656002)(71200400001)(53546011)(83380400001)(55016003)(122000001)(186003)(26005)(66574015)(85202003)(85182001)(9686003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N0VLQjZZVC9SUUhmaXJleGtsVTBUNU5CVkdNVUpCNkg0OGhtZjJGajVlbTJw?=
 =?utf-8?B?QUNmNW56VXduTHpDUWNrMDh2WkVKejZYV1A1NGF2SlVDY01SQUVIOG52NEcv?=
 =?utf-8?B?YUlGUHhqWWFETUdIU21vUU9jVkNWT09KMGVWbzd6bzVGaXJsK0dMMHAxaEZo?=
 =?utf-8?B?NjE4YWxNU3RSRzFEclY1aVdmdTRJT0cwYXgxaFE3R1hoQWJwOW1VbTZJUGJt?=
 =?utf-8?B?TnhGUXdRZ1JXR2JpNjd3bjMzS1Bka2RTOUllczJraVB6OFVxUFpTTFp5c1VW?=
 =?utf-8?B?V3N6QndMMmZ6NUVycEpYK3V3bXZra1h5OVlRUmxhSWdRWmFMaEZhM1FzM1Jt?=
 =?utf-8?B?cnhnZHZoWjN4MFptZXNHVHdaNytZS0MwYzMyTjlRenlpRVVBQWgyMmtaK3g2?=
 =?utf-8?B?emw1czJtZ21zNStRcW9GNUVRYktNNTluQ3VmYmJSbS85SmdkNThMQ2d4Qmtp?=
 =?utf-8?B?Q3djOW1Za05hRGticEdxYy84SU05SDBYZjdHSUZnUTZTaHNpd3ZPWXNDbFBD?=
 =?utf-8?B?L0FpcXpFRmlRTEE3MjZ0MVJ5d09oRDdtMFBXSkorTUNPajZ3YUptR1R4MUtM?=
 =?utf-8?B?dnpiUVFvTi80bGRKZmsrQXNUUFFVZnZTcjFPOG5UOVdmQkwwVlFtS3hLVkV3?=
 =?utf-8?B?bUJneHdyd2VEWWpyMjBjbGc1ZWlRWEdGcS95aTlQcWhBUHM0TldvN1VWTVFJ?=
 =?utf-8?B?RHdBeGpUazVQK0xFTjJqOE4xdDdFOTJtNm9CUGx6d3J3dmdzQ24rWU5Hcmxw?=
 =?utf-8?B?ZVd2dlpRbXJzWmZLUlpuSzBWQkJzQzRzVitKUlZoN29hcnNPcVZxZHl5OTdL?=
 =?utf-8?B?MzZmYjhjS1ZHWVM5YW55eXRaN0RmZjFPZldPOFFnNXBveVJFUFJxN1Uyd0do?=
 =?utf-8?B?cGQyZGFqV2xYR0kzR3VvY2FQSTJqN2ZYSXpRZCs1S0pDc0hJazF6RWdVM0cx?=
 =?utf-8?B?RDkxbDZVbnh4TE5RQzRqdnh1ZVIxWDE0WHk3Y2NlNU1NeWp2SjB4WkpJdkpq?=
 =?utf-8?B?RHpZY01sMVBnM1lLK0ZNcWxyK3hGMWdpMWxwR09EZGFuY3FaenJqbDV0VU5D?=
 =?utf-8?B?aEFkVzBRZ2w3Rm1hSXdtTjZRZjNDY0NFSCtBMkJ5ZW5pdXhtSys4czhQTmVw?=
 =?utf-8?B?ZmR6bGxqQVdRZVRVWWd4dlFOK04wS3F2cWE5QlNtdzJXb3YyeERnYjBjd3dP?=
 =?utf-8?B?NVJLUU1xdkNDaHJ1Q2N3MVRpeEtLcWhIYXpnQklDTi9mSXhPb3FLNW9VL2I3?=
 =?utf-8?B?TXNkSk5JY0k1dTZpZVBkUXk4Nks5Y1VocWgwengwSmVmYVZoajN4YXRFSVJs?=
 =?utf-8?B?MlFzT3FzQk83OHdwUFkrc0JtWkFjTFp2ZXZmR0Y0RFRqb2xFb3NoZmpDNGRI?=
 =?utf-8?B?b242V1dvaFpiYlhIMUd2bHMvWFZqS3BCSko3T0hoM0hGVDhPM05IdVhsL1Vv?=
 =?utf-8?B?TEF2L3NmdmoxNGtGelpwc0pyZmpBdHFqemxEQ3lKYmFEb0IzSTVRRWZ0ek44?=
 =?utf-8?B?eTJIRHRLbkczVG91b0liSWViQlo5RHlGNjZGWlhJZzN4cEF2L2ZVMC85OS9J?=
 =?utf-8?B?cXRISTFtWi94UHgzWWxyZE01VFdMbFBCL25oV1BzNmQ2VjNTSzBpL0dLNmt3?=
 =?utf-8?B?dTVTVHMvTkRXclFuU2o4OUxoZ2ZrV0lyNkRlcWJFR2hVc0NtZ1pZVk1qUUNL?=
 =?utf-8?B?VEIvMk9Dd2tCUHJUUlZ0S2JlYUlFZXhNMjltRHhkU2hoKzA2eWhEdHA2WFZk?=
 =?utf-8?B?SmM4VXVaN1F6cVhPa0hJbWpkNHBldHNCTnZvQWUyNmdLcG1SeWVFTVI3enNx?=
 =?utf-8?B?aWhnM0ZEQktEc09EWmJYQUMyQy92NEpxTEdKZlQ5TWxUcnFlWm9UcDVpUjUv?=
 =?utf-8?B?SW5hcU5wN3U4YlN5ZmJrUFpJUkJ3ZjY2UnhwZVFDblNRUlVXUHRTUVl5UHJw?=
 =?utf-8?B?aVhtak82QVpwODJOSlBpWi9HN24zRGhJVnJlaFM1eEFId0swZDlzY0hkNWo3?=
 =?utf-8?B?UytTd1FMMmo4UmR3a3BBN1RFSFo4bCt2dmQ0WklENEF6YTlKWmZPZzlKSTRq?=
 =?utf-8?B?U2gyRW9pQUI1RkhLSEY5Q0xXYmJ6eWZIbTFBYkFJcENIRU9kWi9kd0N6MkNI?=
 =?utf-8?Q?FGLAH5vqXG/exdojAaIdnFnuN?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0102MB3136D294CB80AED2FACE668BFC23AVI1PR0102MB3136_"
MIME-Version: 1.0
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9290a7db-a1d3-4a68-db7b-08db73ce71ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 09:44:31.0572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rj0LAPbun22plWrkrXmb/MDQWpfNiXDNX08PSd779DGmP9auMya1sJy5ThDWlrzggaG9MMwplT3u8dsV7+22vJWYk9U1qAu7mQkhzTGYV18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7702
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 09:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183315

--_000_VI1PR0102MB3136D294CB80AED2FACE668BFC23AVI1PR0102MB3136_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMjIgSnVuZSAyMDIzIDE5OjAxLCBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHdyb3RlOg0KPiBJZiB0aGVyZSBhcmUgb3RoZXIgdGFwIGludGVyZmFjZXMgdGhhbiB0
aGUgaW50ZXJmYWNlcyBjcmVhdGVkIGJ5IHRoZQ0KPiBydW5xZW11LSogc2NyaXB0cywgdGhlc2Ug
aW50ZXJmYWNlcyBhcmUgbm90IGlnbm9yZWQuIFRoaXMgaXMgbm93IGZpeGVkDQo+IGJ5IGZpbHRl
cmluZyB0aGUgaW50ZXJmYWNlcyBmb3IgYSBzcGVjaWZpYyBwcmVmaXggaW4gdGhlIGludGVyZmFj
ZSBuYW1lLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gRnJlaWhvZmVyIDxhZHJpYW4uZnJl
aWhvZmVyQHNpZW1lbnMuY29tPg0KPiAtLS0NCj4gIHNjcmlwdHMvcnVucWVtdS1pZnVwIHwgMiAr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+
IGRpZmYgLS1naXQgYS9zY3JpcHRzL3J1bnFlbXUtaWZ1cCBiL3NjcmlwdHMvcnVucWVtdS1pZnVw
DQo+IGluZGV4IGZlNDQ5MmU3OGI3Li5jNjVjZWFmMWM4MyAxMDA3NTUNCj4gLS0tIGEvc2NyaXB0
cy9ydW5xZW11LWlmdXANCj4gKysrIGIvc2NyaXB0cy9ydW5xZW11LWlmdXANCj4gQEAgLTQ1LDcg
KzQ1LDcgQEAgaWYgWyAteiAiJE9FX1RBUF9OQU1FIiBdOyB0aGVuDQo+ICBmaQ0KPg0KPiAgaWYg
dGFwcz0kKGlwIHR1bnRhcCBsaXN0IDI+L2Rldi9udWxsKTsgdGhlbg0KPiAtICAgICAgIHRhcF9u
b19sYXN0PSQoZWNobyAiJHRhcHMiIHxjdXQgLWYgMSAtZCAiOiIgfHNlZCAicy8kT0VfVEFQX05B
TUUvL2ciIHwgc29ydCAtcm4gfCBoZWFkIC1uIDEpDQo+ICsgICAgICAgdGFwX25vX2xhc3Q9JChl
Y2hvICIkdGFwcyIgfGN1dCAtZiAxIC1kICI6IiB8Z3JlcCAtRSAiXiRPRV9UQVBfTkFNRS4qIiB8
c2VkICJzLyRPRV9UQVBfTkFNRS8vZyIgfCBzb3J0IC1ybiB8IGhlYWQgLW4gMSkNCg0KWW91IGNh
biBjb21iaW5lIHRoZSBjdXQrZ3JlcCtzZWQgdG8gYHNlZCAiL14kT0VfVEFQX05BTUUvIWQ7IHMv
Ly87IHMvOi4qLy8iYA0KDQoNClJlZ2FyZHMsDQoNCkrDtnJnIFNvbW1lcg0KDQpTb2Z0d2FyZSBE
ZXZlbG9wZXIgLyBQcm9ncmFtbWllcmVyDQotLQ0KDQpOYXZpbWF0aXggR21iSA0KDQpUYXR6ZW5k
cHJvbWVuYWRlIDINCg0KMDc3NDUgSmVuYQ0K4oCC4oCC4oCC4oCC4oCC4oCCDQoNClQ6IDAzNjQx
IC0gMzI3IDk5IDANCg0KRjogMDM2NDEgLSA1MjYgMzA2DQoNCk06IGpvZXJnLnNvbW1lckBuYXZp
bWF0aXguZGUNCg0Kd3d3Lm5hdmltYXRpeC5kZQ0K4oCC4oCC4oCC4oCC4oCC4oCCDQoNCg0KDQpH
ZXNjaMOkZnRzZsO8aHJlcjogU3RlZmZlbiBTcMOkdGhlLCBKYW4gUm9tbWVsZXkNCg0KUmVnaXN0
ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBKZW5hLCBIUkIgNTAxNDgwDQoNCg0K

--_000_VI1PR0102MB3136D294CB80AED2FACE668BFC23AVI1PR0102MB3136_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCk9uIDIyIEp1bmUgMjAyMyAxOTowMSwgb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCjxkaXY+Jmd0OyBJ
ZiB0aGVyZSBhcmUgb3RoZXIgdGFwIGludGVyZmFjZXMgdGhhbiB0aGUgaW50ZXJmYWNlcyBjcmVh
dGVkIGJ5IHRoZTwvZGl2Pg0KPGRpdj4mZ3Q7IHJ1bnFlbXUtKiBzY3JpcHRzLCB0aGVzZSBpbnRl
cmZhY2VzIGFyZSBub3QgaWdub3JlZC4gVGhpcyBpcyBub3cgZml4ZWQ8L2Rpdj4NCjxkaXY+Jmd0
OyBieSBmaWx0ZXJpbmcgdGhlIGludGVyZmFjZXMgZm9yIGEgc3BlY2lmaWMgcHJlZml4IGluIHRo
ZSBpbnRlcmZhY2UgbmFtZS48L2Rpdj4NCjxkaXY+Jmd0OyA8L2Rpdj4NCjxkaXY+Jmd0OyBTaWdu
ZWQtb2ZmLWJ5OiBBZHJpYW4gRnJlaWhvZmVyICZsdDthZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMu
Y29tJmd0OzwvZGl2Pg0KPGRpdj4mZ3Q7IC0tLTwvZGl2Pg0KPGRpdj4mZ3Q7ICZuYnNwO3Njcmlw
dHMvcnVucWVtdS1pZnVwIHwgMiArLTwvZGl2Pg0KPGRpdj4mZ3Q7ICZuYnNwOzEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKTwvZGl2Pg0KPGRpdj4mZ3Q7IDwvZGl2
Pg0KPGRpdj4mZ3Q7IGRpZmYgLS1naXQgYS9zY3JpcHRzL3J1bnFlbXUtaWZ1cCBiL3NjcmlwdHMv
cnVucWVtdS1pZnVwPC9kaXY+DQo8ZGl2PiZndDsgaW5kZXggZmU0NDkyZTc4YjcuLmM2NWNlYWYx
YzgzIDEwMDc1NTwvZGl2Pg0KPGRpdj4mZ3Q7IC0tLSBhL3NjcmlwdHMvcnVucWVtdS1pZnVwPC9k
aXY+DQo8ZGl2PiZndDsgKysrIGIvc2NyaXB0cy9ydW5xZW11LWlmdXA8L2Rpdj4NCjxkaXY+Jmd0
OyBAQCAtNDUsNyArNDUsNyBAQCBpZiBbIC16ICZxdW90OyRPRV9UQVBfTkFNRSZxdW90OyBdOyB0
aGVuPC9kaXY+DQo8ZGl2PiZndDsgJm5ic3A7Zmk8L2Rpdj4NCjxkaXY+Jmd0OyAmbmJzcDs8L2Rp
dj4NCjxkaXY+Jmd0OyAmbmJzcDtpZiB0YXBzPSQoaXAgdHVudGFwIGxpc3QgMiZndDsvZGV2L251
bGwpOyB0aGVuPC9kaXY+DQo8ZGl2PiZndDsgLSAmbmJzcDsgJm5ic3A7ICZuYnNwOyB0YXBfbm9f
bGFzdD0kKGVjaG8gJnF1b3Q7JHRhcHMmcXVvdDsgfGN1dCAtZiAxIC1kICZxdW90OzomcXVvdDsg
fHNlZCAmcXVvdDtzLyRPRV9UQVBfTkFNRS8vZyZxdW90OyB8IHNvcnQgLXJuIHwgaGVhZCAtbiAx
KTwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPiZndDsgKyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyB0YXBfbm9fbGFzdD0kKGVjaG8gJnF1b3Q7JHRhcHMmcXVvdDsgfGN1dCAtZiAxIC1k
ICZxdW90OzomcXVvdDsgfGdyZXAgLUUgJnF1b3Q7XiRPRV9UQVBfTkFNRS4qJnF1b3Q7IHxzZWQg
JnF1b3Q7cy8kT0VfVEFQX05BTUUvL2cmcXVvdDsgfCBzb3J0IC1ybiB8IGhlYWQgLW4gMSk8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj48YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2Yg
Q29udGVudFBhc3RlZDEiPg0KWW91IGNhbiBjb21iaW5lIHRoZSBjdXQrZ3JlcCtzZWQgdG8gYHNl
ZCAmcXVvdDsvXiRPRV9UQVBfTkFNRS8hZDsgcy8vLzsgcy86LiovLyZxdW90O2A8YnI+DQo8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGli
cmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6
IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9v
ZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2
Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJy
aSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+DQpSZWdhcmRzLDwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJv
b2YiIHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj5Kw7ZyZyBTb21tZXI8L2Rpdj4NCjxkaXY+
PGJyPg0KPC9kaXY+DQo8ZGl2PlNvZnR3YXJlIERldmVsb3BlciAvIFByb2dyYW1taWVyZXI8L2Rp
dj4NCjxkaXY+LS0gPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5OYXZpbWF0aXggR21i
SDwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+VGF0emVuZHByb21lbmFkZSAyPC9kaXY+
DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj4wNzc0NSBKZW5hICZuYnNwOzwvZGl2Pg0KPGRpdj7i
gILigILigILigILigILigII8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PlQ6IDAzNjQx
IC0gMzI3IDk5IDA8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkY6IDAzNjQxIC0gNTI2
IDMwNjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+TTogam9lcmcuc29tbWVyQG5hdmlt
YXRpeC5kZTwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+d3d3Lm5hdmltYXRpeC5kZTwv
ZGl2Pg0KPGRpdj7igILigILigILigILigILigII8L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8
ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+R2VzY2jDpGZ0c2bDvGhy
ZXI6IFN0ZWZmZW4gU3DDpHRoZSwgSmFuIFJvbW1lbGV5PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2
Pg0KPGRpdj5SZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IEplbmEsIEhSQiA1MDE0ODA8L2Rp
dj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_VI1PR0102MB3136D294CB80AED2FACE668BFC23AVI1PR0102MB3136_--

