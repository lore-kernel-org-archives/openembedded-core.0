Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C05C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 00:38:28 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.56])
 by mx.groups.io with SMTP id smtpd.web11.11779.1716856702549773315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 17:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Eend81As;
 spf=pass (domain: axis.com, ip: 40.107.249.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yte+EELFIcxPh6i9wz2Vj+unlsVxyvgXmKMV34OWJl/sXYZSqTbHmA1rFCnd41wEMuMSv1FO4BaC9WZ6JfLz4l9uwP87Vy+cFYgUJWNQmzgjdfAMKvRbRUZ+xZjbF5xTRlZnT2Mhv7TyCEDX1alecjHKS3aWIhfB9StYsRYVMGElmlfnST4IQN9xhDH7POKbaK3ZQl9igoq3ju1rwitQifddD4X9+Tb03tHbBHFuFq/vT9tZWky/ITIMAwDrZQVziD2f5HHUTfAkMHNLMBkCMrtirONWJB6Mkq/l4Kx9xeclh/o79ce55pk3GfDHxT+Yar6dB+0vGpVmiCz0xF2FoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCLLX2UBoc/AYEWqJELiCODHtR1UXu9HSq15xKEGX/g=;
 b=h/kf580QVYEuPGcCfrQjLrgXvafEdgPdkKcNXsDeTZcQzWP/yeXjgYz8HaLzY3eSjdChtbjQEDElbIpM7JAM59R0IZkciqxEcD/qb+AJp6gNSvJSZzyMJIVtbrtmxB/sKyScnSoUMRXYPr4wlj1YQW+tioyUHtPvfOCOwM9PnRE1zhJ1RtCT27Ba4T1ZzerXK/AqJnzxoJ+sRhousbIwCKqzQ4qPVj+JZAmkntFySw3aIpoA3319j22ne2p/EKA1lHdzVSH2uJW4WS/a1NReMNB2rm0FcDsiu3cpMzZR1mNz1DmZ02tFv9Xs22YdoozYkVyxN69gI++2JqQdWsJW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCLLX2UBoc/AYEWqJELiCODHtR1UXu9HSq15xKEGX/g=;
 b=Eend81AschimeCBkaDcv9qkx7d/Po967d3gLA8pf6eaneM9yKrU5AK9+z8uZDsRQBuE8dv5U+UgJ+c+mrYqMXe7JnqNlgcvIjJX4BUJgsQrhPzIdkZJm0W4dPwoxsGnLfHhavdFNx8FgHTKDo92fhM1Ejvtz/hPgxhZ9dyxqz+w=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV2PR02MB9566.eurprd02.prod.outlook.com (2603:10a6:150:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 28 May
 2024 00:38:17 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 00:38:17 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, =?utf-8?B?7J207J6s6rec?=
	<jkbestfamily@gmail.com>
CC: "jaekyu.lee@lge.com" <jaekyu.lee@lge.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core][scarthgap] rust: remove unnecessary git
 signature
Thread-Topic: [PATCH] [OE-core][scarthgap] rust: remove unnecessary git
 signature
Thread-Index: AQHasEHFd1v6YpD7OUa1XIJKDo0IRbGrJySAgAAhroCAAAFlgIAAf9cA
Date: Tue, 28 May 2024 00:38:17 +0000
Message-ID: 
 <DB5PR02MB10213897B03B6DA5EA6746FA0EFF12@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240527134416.10699-1-jaekyu.lee@lge.com>
 <CANNYZj9yFM1zNjVum=sPaHXE4ZGbvB4ubkMnmt1gEPpHwz=X2w@mail.gmail.com>
 <CABVd4mGAV0HHg8ky9o=S5i0AnpOGyYVCo9torP+PGDmp55w5UA@mail.gmail.com>
 <CANNYZj8CVupvrkzcYXxLA1N5V8ZY5HqRRt+NrLYwYJ5Hto8QqA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8CVupvrkzcYXxLA1N5V8ZY5HqRRt+NrLYwYJ5Hto8QqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV2PR02MB9566:EE_
x-ms-office365-filtering-correlation-id: d7a62632-32c3-4a5f-5602-08dc7eae7791
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dzVFUTdQQ1BOS2xjQWpzRFk4c21VUW9uQncwdzRLcHpDRlpUcnZMRTNDYkJo?=
 =?utf-8?B?cEVQOE5CV1dHenEvUVR0Qm4rd3JvMG9sMFVXMTE3WHFra0RKTjJtQTVZaFlo?=
 =?utf-8?B?bjJxWlZkQUtoNXlCdlA0WmdDd1RISGY5VWtZWTRRYVN2YUswbmxmdnFFN05o?=
 =?utf-8?B?Y0NoeHA4WEJYell2bmhnL0N4UERWZlZIRCs4TmZUdnFjSEZZYUZ6Vk1UdGJN?=
 =?utf-8?B?UW53K205N21qRC9LR0l1SEtnbDkyTHc1ZXV1Q1N5RStYd1phZWpzSnIrcTJ4?=
 =?utf-8?B?NWdtekY1Wjc3TmVXUVpYckNoeGQ4RzFDajkwT0dqNnpmekdaNnVBYWNkR3ZI?=
 =?utf-8?B?ZjBpQ3Z5S21udmtUbEVMSWhUalZqdU9CTnRHaytSL2lUTWxjak1IVW8vM0sx?=
 =?utf-8?B?bEM0TlhuYzFMMjFPUEgwbG1aN2VOb3hHTzJ5M1E1OHlMZk9vQ3hEcUlhbFJF?=
 =?utf-8?B?WmZDd1hxL1FubkNoak1LMklCbjRyRFU3cGxRTjFiakY4dmVWS1RzKzR5UFg0?=
 =?utf-8?B?RklYNWEycWgwSk56aEZtS3h1d1liNnl5M0h5WjF2aVpOM2w3QzA4QS9UOVBU?=
 =?utf-8?B?SmY5S2F0eXBvek9CSlVNWXNvOU1uZlJoU2EzczcwMjE0ckpTTkNXY2lmU0wv?=
 =?utf-8?B?a3YxbzVnZEVZbnFadE8zWnFRUUNpVlhkTGVYSm94SnhJT3VQVnNSU3VqVVZm?=
 =?utf-8?B?NEdDWGxrL2R0MkxiQjZNOXlHT3pDRkQ1R1E2cWU1ZC83TWVpMUFUaFVKNkpt?=
 =?utf-8?B?V3ZDQjJSYTNKZ0dRUVlSc0puTVpQREQyRkRuRWJsSmdNSzl5YksvWUZzZTJM?=
 =?utf-8?B?S04yNzMvbys3WEFNSE9VZzNtRUNMQW9EdUhxU2VOVkw0S2k5Ykg2VFZqTVcv?=
 =?utf-8?B?eVdWclhIbjl3T3picmV2T0U3MDRWa2lmK2lBOXVMMVBINXA0cGNMMmlnZE5W?=
 =?utf-8?B?ejUrTVJUTlRUM0kwQ3BmSHpXVGN5QVVqV2RXeTlDMlpXRlVQZElXc3lHOHZV?=
 =?utf-8?B?WWFlRmltTDlKR0xqL1RSWkUxM1VYd1Z4NmE2M1NJSHh3UXdMaVZJRUFLTDQy?=
 =?utf-8?B?SGROaTdFdkd5cFFyUnpha0MwTnRaU2xaWE12bXdYSlJKKzlkejlPVDFvTXZY?=
 =?utf-8?B?ZSt6dk8reHBOd0RYMk5YOHd1NGloTzBLajFqNnBBb3JwYWo4ZXM2T3Y5WXJp?=
 =?utf-8?B?Y2FlcXlPVXIrVUFQQ2RrODRUY0JoNEdaanZ5blBLK0NmdHA2ME9SdDhYM0NO?=
 =?utf-8?B?aFlkTmNpVW5RZ2tyb1FOSEJTWXJGNkpWcmpSV205OWlwOHNZZjFqNGNHb3VH?=
 =?utf-8?B?a0IrYUNncFVHQU5GZlZ2eUVjL2l6cDd6UFA3aUQxZFpGWFZkYWRlbmpKMlR2?=
 =?utf-8?B?YUozbDhvcXlpZllHUFhEUzVaNTI3WXBuMEFscStIcVQ3SHhDNGlGUGF2OFFo?=
 =?utf-8?B?a2V3S1BydDBhcEd1VkRodjJka0NvREt6ZmVqbFpDOTBJQ2pjVUxnTmhqTEVL?=
 =?utf-8?B?cTlzZ1VkczV2RDQ5MjZLcFNkZFdiWUVnUWRsNlZ1Vm5aNjZzQXAycXlucGp3?=
 =?utf-8?B?QlRVK3dBc0NzcGhiZ25sWXVVV2lReEQvTU5vSDlJTSs5UWFqbTlRUmN5QWN4?=
 =?utf-8?B?dHJ2c0cwcGJLTG8yLy9PMmw0Ti9GM1NGb0dudFA5OXdxRVpYcDN0QnZqdkFy?=
 =?utf-8?B?Z2RPWFVSUEJsSHVsQzVCVWg3ZUk3ZHJzZG1vODFsampIakxodnozejhrdVlr?=
 =?utf-8?B?bVVtUzB6aXdramg0YWJTUzUvdU5UTlZiYTNZM0hNU1BVOHhMWDJvZ0labjQ5?=
 =?utf-8?B?eFdlUTF0bkl1U0JXNm9xdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YjE0Qys5cjlqWEVicnl3QlJiVTJDSTBIQ3A4WmdSRy9VSms3cGg4UFBIUUxC?=
 =?utf-8?B?Z2JsVWFmQWRSckpXWDF3TEUyaTFoMmk3cUY2WWN2aE9TWWN2WGdxZmlJdnow?=
 =?utf-8?B?dHl0SnZCZ2NySUxjWStMdDJYZVFSR0Fpbm9NMmVQa0o0VEt3SEp5RC96Nmpa?=
 =?utf-8?B?OWsrbjRlU1NsVGJrdmw5eENXdmpTL2VZZWs3YkplWEtqVGRjeHdkd3o3RGth?=
 =?utf-8?B?N2VncGJkMGJmK2RBNjVyRkFvaFBkZDJTYWlSaUhBRXFvMFNIb1lzcHdRMXNF?=
 =?utf-8?B?TElUcnJMU3hCQlhXMzZKV1daM0Y2R2Nva1cvaE9Vd0crc1RQTWdRR2tvaXBS?=
 =?utf-8?B?SDZrOFo1RXlncTN2dEdML1J1UVIzYzV4bm5tTFROZGlodzROOVg2N0JjUWlP?=
 =?utf-8?B?MDFETFhmOWJBWFRHdko1OHFNWUlUQVhVMHlWSzYwZzBka21nMXoyR3dmY20x?=
 =?utf-8?B?YldkODY5S0Z5elhvVkRVWi9KY2NneTloUE1EWlV5ZHAxZEswamxZb1VEMUZB?=
 =?utf-8?B?SnFOKzd2UjNSOXprWThxOHpnRUFhQ1RKMG0veXFVK3UyNW5UN1QxU2d2K1Fx?=
 =?utf-8?B?U2FDMTE3QkN0Zk1ZRHBQeXFaQmNBOVpENytGY2pZdk5ScG1lVXN5M1pzd3ln?=
 =?utf-8?B?aTFsZFlCZUg4U3VqeFJxeVdnVWt0SDNLd1NYUFJIdkhJR0hPdjdhck1UNngr?=
 =?utf-8?B?RE9pVEQvSmZsTjBFWXJYQU5wdUVtUkRkZW9iOVBMTjJaVzRyQWFmMFhwVFg4?=
 =?utf-8?B?Skt5eHhCTUphdGtpK0F4a1dWM2JoV1FCcTJwdDNkUlVhNXNpVXBZaVJmdU9p?=
 =?utf-8?B?aFZJSWVnZkljVkowUXJlRjJ1cXdFcWUzM0M2ODBDWnFzb1hGbE9tVEk5WkM5?=
 =?utf-8?B?L25NVkp6UVh1dFVTbFVLT3RSMEh2cWpuUzJaWUpoN3FxcHNULzV1ZVlrZnJG?=
 =?utf-8?B?TVlrSFh1TlFYVjM5SXdjcUdXRnFUZnQwSThndFZkWXhuTG5NS0lseWxPV1VB?=
 =?utf-8?B?Sjd4RFQ3TlRqUU1RR0hIWFlzRkNsdWdUYUZ0QWE5MVNnTHcrNzZUcWJscHg4?=
 =?utf-8?B?QUwxZENnU0ROOTZLeEFUcmxFbmJVcnlGM2wxS0Frak9jUEVVYlc3a1M2b1ZO?=
 =?utf-8?B?MEowL1VvTEwxMjNVS3pEN2VLOU1IRXlxU2JEcGxRL2tNUzhzUW1QLzQ1RlNy?=
 =?utf-8?B?T0RzWlBTaGdBNi9XNk1ZbVljOVVEVzFxTlQyZ3JKN3owSXNuVkVIalBVVHUy?=
 =?utf-8?B?eTMzaGZ4MEJwQmx0bHJxTFRpT3VTVEJxa0RKK3pTYUpoNXFUdHJGcW5uSllJ?=
 =?utf-8?B?dWNvYmR2eHZEeFUrQVNrTVErTlZWR2NMRTAvMlpWcXR2R2lkVFJuSUVTY3VP?=
 =?utf-8?B?YXZiRllhOWl4bExJUHlPZU9KbEhDdVVUQUNzT3QxL0xQU3QxaDJ1YjZDeWdQ?=
 =?utf-8?B?aytBa1phYjdFdU1aVlpZeGtSSXE3NVJHcVZCeDJiZUJkYlArRmphNEErN0hy?=
 =?utf-8?B?TmtTemo2c2NQK2YrZEc3eVRCTkNZWkZqSzJ5NS9ub1NoYXBEOGV0MG9lOEZF?=
 =?utf-8?B?ZnQ5cnc4SmJNK2crRFllaG1tSHdXc0dWUnFkZHpwelQ0NzBwTERNQm9YOHBP?=
 =?utf-8?B?TmxKYS9udHNDODM3Z2g1Q1pEUjdSMmZjcHo1RzhCdU1ieGdBYnl6SUZhNlND?=
 =?utf-8?B?ZTlGZmJGWkM0WmJPUWJkTFpENEJtK25WVmM2RHpqL29jQldWUEhyM0NuN0R2?=
 =?utf-8?B?WWcydkhzSW9RZW1TQ3JJbExxdXkxNHQ0R0orWXh3NFBkK0plKzEzMGU2R0k5?=
 =?utf-8?B?U3JCTTQwRm1vNXNuSGlCSVJiRnVJaTdGN0loU0FGRkh1QTg1dXV4SXU2ZXlp?=
 =?utf-8?B?MHdqZ3oxQXpWczA1RHBQUVNncEdWL2pGdWVyaHZGZzZpNGZZYUluZjhFVkhn?=
 =?utf-8?B?L0dIK3FFbWNBR2hFakJCcksvSFc3Z1ErajNUUEo1aGdlaVcwMmpxdXFqOENT?=
 =?utf-8?B?dXFnMHh3RDVvM1JlU0NhbWp5SVRGWFFZSzZmbFNieVFTZ01aNlFvMGJNaExC?=
 =?utf-8?B?M2p3S0xQdUJFOVdTR1RpL25uMnBaeW1POWpkL0F1aGQzS2dPYjk5VFRGbUd5?=
 =?utf-8?Q?Vh1E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a62632-32c3-4a5f-5602-08dc7eae7791
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 00:38:17.4622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYwji5S/kaj0VwzdP7QMc+5V+KZhcDT0U8KR4ks7XYKwCp25rjsebX6S57jpUzF4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9566
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 00:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199949

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluDQo+IFNlbnQ6IGRlbiAy
NyBtYWogMjAyNCAxODo0Ng0KPiBUbzog7J207J6s6recIDxqa2Jlc3RmYW1pbHlAZ21haWwuY29t
Pg0KPiBDYzogamFla3l1LmxlZUBsZ2UuY29tOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtPRS1jb3JlXVtzY2FydGhnYXBd
IHJ1c3Q6IHJlbW92ZSB1bm5lY2Vzc2FyeSBnaXQNCj4gc2lnbmF0dXJlDQo+IA0KPiBPbiBNb24s
IDI3IE1heSAyMDI0IGF0IDE4OjQxLCDsnbTsnqzqt5wgPGprYmVzdGZhbWlseUBnbWFpbC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciByZXBseS4NCj4gPg0KPiA+IEkgZG9uJ3Qg
dGhpbmsgd2UgbmVlZCB0byByZW1vdmUgaXQgc3BlY2lmaWNhbGx5IGZvciB0aGlzIHBhdGNoLg0K
PiA+IElmIHBvc3NpYmxlLCBJIHdpbGwgdXBkYXRlIHBhdGNoIHRvIHJlbW92ZSBpdCBmcm9tIGFs
bCBwYXRjaGVzLiBEbyB5b3UNCj4gPiBhZ3JlZSB0aGF0IGluZm9ybWF0aW9uICggZ2l0IHZlcnNp
b24gaW5mb3JtYXRpb24pIGlzIHVubmVjZXNzYXJ5Pw0KPiANCj4gSXQgbWlnaHQgYmUgdW5uZWNl
c3NhcnksIGJ1dCBJIGRvIG5vdCB0aGluayB0aGVyZSBpcyBhIG5lZWQgdG8gcmVtb3ZlDQo+IGl0
LiBJZiAnZ2l0IGZvcm1hdC1wYXRjaCcgYWRkcyB0aGF0IHdoZW4gaXQgd3JpdGVzIGEgcGF0Y2gg
ZmlsZSB0bw0KPiBkaXNrLCB0aGVuIHdlIHNob3VsZG4ndCBmaWdodCB3aXRoIHRoYXQ6IHBlb3Bs
ZSB3aWxsIGtlZXAgc2VuZGluZw0KPiBwYXRjaCBmaWxlcyB0aGF0IGhhdmUgaXQuDQo+IA0KPiBB
bGV4DQoNCkZvciB0aGUgcmVjb3JkLCBwYXRjaGVzIGdlbmVyYXRlZC91cGRhdGVkIGJ5IGRldnRv
b2wgd2lsbCBiZSBjcmVhdGVkIHdpdGggDQpgZ2l0IGZvcm1hdC1wYXRjaCAtLW5vLXNpZ25hdHVy
ZSAtLW5vLW51bWJlcmVkIC4uLmAgYW5kIHRodXMgbGFjayB0aGUgZ2l0IA0KdmVyc2lvbiBhdCB0
aGUgZW5kLg0KDQpQZXJzb25hbGx5LCBJIGhhdmUgdGhlIGZvbGxvd2luZyBpbiBteSAuZ2l0Y29u
ZmlnIHRvIGF2b2lkIGhhdmluZyANCmBnaXQgZm9ybWF0LW5hbWUgLi4uYCBnZW5lcmF0ZSB0aGUg
c2lnbmF0dXJlOg0KDQpbZm9ybWF0XQ0KICAgICAgICBzaWduYXR1cmUgPQ0KDQpCdXQgYXMgQWxl
eCBzYXlzLCBzb21lIHdpbGwgZ2VuZXJhdGUgcGF0Y2hlcyB3aXRoIHRoZSBHaXQgc2lnbmF0dXJl
LCBhbmQgDQpzb21lIHdpbGwgZ2VuZXJhdGUgdGhlbSB3aXRob3V0IGl0LiBTbyB1bmxlc3Mgc29t
ZW9uZSBhZGRzIHNvbWUgY2hlY2sgZm9yIA0KdGhlaXIgbm9uLWV4aXN0ZW5jZSwgZS5nLiwgdG8g
cGF0Y2hjaGVjaywgdGhleSB3aWxsIGNvbWUgYW5kIGdvIGRlcGVuZGluZyANCm9uIHdobyBnZW5l
cmF0ZXMgdGhlIHBhdGNoZXMuDQoNCi8vUGV0ZXINCg0K

