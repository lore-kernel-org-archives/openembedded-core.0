Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482BCCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:03:19 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2545.1778659393838923376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=U6oOEhAQ;
 spf=pass (domain: axis.com, ip: 52.101.69.27, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUYLwyqgDJVfbux9KsQlR/yu5vJLY15LI1X2QLHG6Yl3guLe+P/BSmEDnr+kvpBGmRsHFqTDK929C689u5z9BYhTYtCDIYGWHnzysGc67pwHLFvfvm+tkKcq1IgBFvDeTXBVAyBLHEDY+XDhWv8G69QpMmOZkP3geqRBugxV+XrzdY1HvNpuqsoJyTHh7j0dyel6XHy1M58uBHtsQSzsUefsrnRT59aHdWXe5XFidOKhh45WbRXDFUXBISt+bibE8A9N/erZOW2AtKA2lnH6GX6EiSgbfWev1ELVRR9fA9l3yCuxiWlU3cwYIiKjSV83Ed0o4yF+TvnrrzyFLTL5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apliSci4Pxs/ptrKBNGI7uDRY978qGTuoyDH2efFfuQ=;
 b=TTE8AQUUYLHFg80Tf6S5l8BWuRwPLT3wVCFxEJPpuh+9kI2CjZxQJxYkvALstg2rOenNjBEDu9WpOO/ZIHGYmA1CcMQThS05becwBn0+Ec/DXwM4Vp3yT2CUiuVD74hrKhXTXQuXtLUMgzwS1tWtjvYjsvVTgav40qpepIS9nDYoaWSJwnlUrLFwnr0z7mMoKBOmZWNRUR7Hz+/vGWel9mGQliuk8ir/ZIj+HmfmAddDHkH92bsiPIlNmmewKa6aMnYdsxpG8s3F2SkHAuwrJcCKhRAG41x0CYYDhEQjeMPArRZE/7fDrYDNpfrMguMNEo1fsLEz9dCjRe44x3cmaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apliSci4Pxs/ptrKBNGI7uDRY978qGTuoyDH2efFfuQ=;
 b=U6oOEhAQ+TBGbhbiJi3RxIu3D9GyNPwTdovVPW+9TxGkxDm/+YlOnpl6pgaHpH/FZPrzASfKkEkX2kulE1upQ8P0iQTwMgWaZa0DlG53vcCq/KL+17/rwXH64VLwBUUOS4K+sR8BU9V/p8ZmLOF40kl+hEzvFyqPzKnK6rb4Ffk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB11896.eurprd02.prod.outlook.com (2603:10a6:800:33e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:03:07 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:03:06 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "jeremie.dautheribes@bootlin.com" <jeremie.dautheribes@bootlin.com>,
	Joshua Watt <jpewhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>, "benjamin.robin@bootlin.com"
	<benjamin.robin@bootlin.com>
Subject: RE: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
Thread-Topic: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
Thread-Index: AQHc4jEzp2WkUReSqkKR/VVxlm4JprYK+KiAgACcVYCAAAOYgA==
Date: Wed, 13 May 2026 08:02:59 +0000
Message-ID: 
 <DB5PR02MB1021353EB29A39EA1A2F8B857EF062@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
 <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
 <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
 <238b271a-30c9-4070-993c-3749375fe5a0@bootlin.com>
In-Reply-To: <238b271a-30c9-4070-993c-3749375fe5a0@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB11896:EE_
x-ms-office365-filtering-correlation-id: 4f7be6cf-f425-455a-afa4-08deb0c6110d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|38070700021|11063799003;
x-microsoft-antispam-message-info: 
 DPRIMPyuMHS99tdHQedS49krdfKJri2rTugDCXpx+jEfFpEuZu1BIPX8tBuIaGV0Vbe3FGP4dJRXeNhN6XIZmgGBszgWy9ZqkGb2Z9aproJCOrQDc6KgV5KF2IQFWUZPYCxIxpBRs6mVKCyZq7ecI39hSb4/egF9M3Vd08hQqb/dzB7CxwVjK0Xtzafgkp3ToFpnaV+Fxopz/9CrP1jM/Lfcu9uwy1I9UeySNN2TH/qM/ho8QLylJxEz557GNnep77/2fHQXyXhGluUmN5FKBI1k4E1d31/2ChvMgM3bFdKyAOgDdxOBG8GOan0rwJIF6sdeMGj72yQ605lIAX6pd4jwtoXTfwqiH0E/4W4wsL89zg1htKOoVYcnzI8pvuU7vFkSdcaWgX2/y81a1uB+OArePLL527MPnvu3F1nZDvQ7nAaV+x1MhlgP3BUcASyEc9V9TBZ/G9OIk+/2wAouzdI0jF+CmDH/Ooi4vXGeATI352R8l18QgS1PzDLcXhEtG8sMvr8Bt5ghA4zDMr8y07Nglasw2BHR4LUzF7cE+wwuOrEQUt2qVcU+daD8HzbaJQgsAmfHsdc+/c0ZI0bJLYQgHK1es4RzPAPKDvljMVpiUl/56O7H7PbR5Wqh3bp72HZaWksWSyO3FOJS2ilhnM27RXDIgS4NCLt1KVcVUMsgZdgLJoxRamj0STd3ADKl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?akh5RHFFcDV6NlcrMEE0TnVKdHlZUVdLZ09vVUxFbk5rd1JCNU1NbU04R3U1?=
 =?utf-8?B?UVlrbFIreHE2Y3A5SmUrbDlIT3Q4Wmc1S1RDYlFzdzNVVDBSditZRHB5R3N5?=
 =?utf-8?B?dStVMlFrR3UzWGV0NFJGQWU3SDBjRzVubmdXVk5TdHlrN0t4Nm1sNTkvamkx?=
 =?utf-8?B?K09sdEp1cnpQZnk4QmNKWVlqZU5IRk56cTg4ZUZpdE16TzBPTDI1ZzI3QU5n?=
 =?utf-8?B?YjJWbm0xN2pZREY5REhFSU5pV3pWdWRnbXFReDh2akVGVllWMmZOOUlQRlpB?=
 =?utf-8?B?Ums2clBNQ3A0WkFkbWhNSWl6QmJzcHZnYldhclFpUmtDK1YzeExJcHEwSzV6?=
 =?utf-8?B?NjRuT0h0NWYxMDF0RXhYVnh5WHlFcVRhek80QTJzcmhBUG9mNE1xdm1FeFc1?=
 =?utf-8?B?RVBIMTJJdEJqTUhSa1dVWUZabkRGZTUzcWZYZ21mQk5UNENFOW5Ya0xDU3FV?=
 =?utf-8?B?ZmVIQldITGVsbitYd3BIaGNNSVJVN3o1aHdKdFNzSE9ZYUJDZ3U0aUsyeGho?=
 =?utf-8?B?TEJVRytVQXR2cUtsQ3hOTC96YWZEbHJDd1dYU0txWXdsV1BEUTJ5andZcVMv?=
 =?utf-8?B?UUdoaTJqR2thaWdOUm1QRittN1pCY2RjMWV3TEdqWXFOUEVhQ1pJYmpQQzBO?=
 =?utf-8?B?ZHRNeVE4RE5BWHdhM1hvaXI0eVNVV1VOWFpCam1ydld4dHZsdjJuWkZvdi9U?=
 =?utf-8?B?eWwyZjIwUi9PaVNlaXEzcDBLa2JrUEJFd0p2S3RZUFpZbVJHSGVnUC94YU9x?=
 =?utf-8?B?UGxhK2Y3T1MvNlpsSm1Bblozd28yTkRkcnR5b1U4cFFTemZ0N1BjK0tWR0d4?=
 =?utf-8?B?dldSK2laNTcrZWRmam5hZ2ZjZVk5TzZ6eE9IZnR0VE5Dakc0T2ZwV2lOMWlZ?=
 =?utf-8?B?cDNuSmRqbXhnZUFvRk5lZG1lT2JoUUkvQVUxVld2RzRnSkljSUV4NmhRV2lm?=
 =?utf-8?B?bEcyYk9LN0pJVmpVcGtHaWtmdFBWQk5MazJOSllPMnA4eXA5MGpwOC9sMm5Y?=
 =?utf-8?B?b1ZYTmR3N3ZQOU5mRUg5L3BIT2RqY3ZHUjgxOHN6RURydDVvMTBrSDhRRGxS?=
 =?utf-8?B?SnArQVpuZlhNbTgxYjAxczZYUmNSQUNhZitMVDc3MFkzY2lUUmtDUE9ScHJ5?=
 =?utf-8?B?VU5yOXBDNlhtdkhSbVZUWUF3Qy95clBzYzl0Z241MjllQklxVWo2QWtNMnVG?=
 =?utf-8?B?ZHpUVVVNdnpVWDdSKzUxWC9RK0k0TlA0UlQ3c3RIbVZqSzY4aDBqS2JOVEpH?=
 =?utf-8?B?d0xBYlBsbVk4ZnNmdFRYZHpucVErL04wQXFCTm9LNnE2Y0I3UERtZjdGQ2VH?=
 =?utf-8?B?M2JJdVIyUCt4QW85dndpUEZDRlQ4eS9qT3NPQUhVSlNxMFg3d0dBbVNDaFVr?=
 =?utf-8?B?QnUwR1JRUnZBZUxnVFA3R1JqbWFjMEZDYURYcFo2QlB5WEp6YUlzSDZBQTcx?=
 =?utf-8?B?MmVzRHhJMmVVenk3S21NMkh4eE5VZWdYdXZ6U3BlcEVUWjVTMTErOE1rRjJz?=
 =?utf-8?B?Y2dmZzBSL2hobzBGQjZVVlI3WTltMlBuZ0FZTU4rL0RDSzJoSUFhNldxa0tH?=
 =?utf-8?B?SHRPNCtvMnhNOE0vUFgxUVFNOU80TUJzNzdaSWhvelQyUmtrZXhGRUhJMTJP?=
 =?utf-8?B?SnhBMWplL0tXYWVLamE2MGdmOVQxTU52ajJlOU1zTVpKaWh2OEhNakRwTUVu?=
 =?utf-8?B?NStta0NDdlp6c3l5MjJrR2M4a2R4OWM4S0EycUlFNEFWQ1pEMWpNU0pWWlZq?=
 =?utf-8?B?Z25tcmZuaGlBSDd1WHJVZzA2M3lZclFFWGR6SGt4Y21OVmFpWmRJa0s4TS9r?=
 =?utf-8?B?dk1LN2NVdHRxamIyc21kMUo2RGtEZXlXWTRLNEExZXgwMmVGSFlicURjdndS?=
 =?utf-8?B?aWZLTnE4Y05kWTRTV0pRY0tFTU41N3piaFVEWjhZSEFSdk8zVjAwaHRuWE5u?=
 =?utf-8?B?OFJVQjVCMGhqejV2NXg4S3ZBdkV2dFhyZis2aVIvWUxCdDZqbG0yZno3dUw4?=
 =?utf-8?B?UjRPaUM1aEJuUWU3c0YrNXdLZlRRdk5XTk11UTM3Mk44WWRkQWhLQVFORERz?=
 =?utf-8?B?aWhNSUo0YnBiNUY2aDFCaFZnUzB6czY3ZzhNZktrNGNiYVRuQ1d2cnI5ak5o?=
 =?utf-8?B?c0prelhRQ3NzMm44eGRmeGJtWkZwenJlZThKTHhDc3V4UjhWMkpmK3htWEFG?=
 =?utf-8?B?bk5JY1k3WXk4cGE3MUxiVXVvcmkzTkhzRUVXUHQxN1RDN1VnUlljR2VqZ1pX?=
 =?utf-8?Q?8QHCV+Lw69jQkFXrsjLM0J1XVt20jQ+qA9OkVopqIo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7be6cf-f425-455a-afa4-08deb0c6110d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 08:03:06.9167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9dZPnAxcLB7kzTYWKYnfug2wlZqNoelQb0rj7cyilcElHg74Ev6+vzbOUH5pSsL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11896
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236940

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgSsOpcsOpbWllIERhdXRoZXJpYmVzIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiAxMyBtYWogMjAyNiAwOTo0Nw0KPiBUbzogSm9zaHVh
IFdhdHQgPGpwZXdoYWNrZXJAZ21haWwuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgbWlxdWVsLnJheW5hbEBib290bGluLmNvbTsgdGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbTsgYmVuamFtaW4ucm9iaW5AYm9vdGxpbi5jb20NCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXVtQQVRDSCAyLzJdIHNwZHgzOiBzdXBwb3J0IFNCT00gY29tcHJlc3Np
b24gYmFzZWQgb24gU1BEWF9TQk9NX0VYVA0KPiANCj4gSGVsbG8gSm9zaHVhLA0KPiANCj4gT24g
MTMvMDUvMjAyNiAwMDoyNywgSm9zaHVhIFdhdHQgd3JvdGU6DQo+ID4gT24gVHVlLCBNYXkgMTIs
IDIwMjYgYXQgMTE6MDLigK9BTSBKw6lyw6ltaWUgRGF1dGhlcmliZXMgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGplcmVtaWUuZGF1dGhlcmliZXM9Ym9vdGxpbi5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4+DQo+ID4+IEFkZCBzdXBwb3J0IGZvciBvcHRpb25hbCB6
c3RkIGNvbXByZXNzaW9uIGZvciBhbGwgdHlwZXMgb2YgU0JPTXMsDQo+ID4+IGluY2x1ZGluZzoN
Cj4gPj4gICAgLSBpbWFnZSBTQk9NDQo+ID4+ICAgIC0gcmVjaXBlIFNCT00NCj4gPj4gICAgLSBT
REsgU0JPTQ0KPiA+Pg0KPiA+PiBac3RkIGNvbXByZXNzaW9uIGlzIGFwcGxpZWQgaWYgU1BEWF9T
Qk9NX0VYVCBlbmRzIHdpdGggIi56c3QiLg0KPiA+Pg0KPiA+PiBDby1hdXRob3JlZC1ieTogQmVu
amFtaW4gUm9iaW4gKFNjaG5laWRlciBFbGVjdHJpYykgPGJlbmphbWluLnJvYmluQGJvb3RsaW4u
Y29tPg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKw6lyw6ltaWUgRGF1dGhlcmliZXMgKFNjaG5laWRl
ciBFbGVjdHJpYykgPGplcmVtaWUuZGF1dGhlcmliZXNAYm9vdGxpbi5jb20+DQo+ID4+IC0tLQ0K
PiA+PiAgIG1ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0zLjAuYmJjbGFzcyB8ICAzICsrLQ0KPiA+
PiAgIG1ldGEvbGliL29lL3Nib20zMC5weSAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKy0t
DQo+ID4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2NyZWF0ZS1zcGR4LTMuMC5i
YmNsYXNzIGIvbWV0YS9jbGFzc2VzL2NyZWF0ZS1zcGR4LTMuMC5iYmNsYXNzDQo+ID4+IGluZGV4
IDc4NWVkYjk4NjUuLjZjZjhmYTQ2ODggMTAwNjQ0DQo+ID4+IC0tLSBhL21ldGEvY2xhc3Nlcy9j
cmVhdGUtc3BkeC0zLjAuYmJjbGFzcw0KPiA+PiArKysgYi9tZXRhL2NsYXNzZXMvY3JlYXRlLXNw
ZHgtMy4wLmJiY2xhc3MNCj4gPj4gQEAgLTc1LDcgKzc1LDggQEAgU1BEWF9JTVBPUlRTW2RvY10g
PSAiU1BEWF9JTVBPUlRTIGlzIHRoZSBiYXNlIHZhcmlhYmxlIHRoYXQgZGVzY3JpYmVzIGhvdyB0
byBcDQo+ID4+ICAgICAgICAgICAgICAgU1BEWCAzIHNwZWMuIE9wdGlvbmFsIGJ1dCByZWNvbW1l
bmRlZCINCj4gPj4NCj4gPj4gICBTUERYX1NCT01fRVhUID8/PSAiLnNwZHguanNvbiINCj4gPj4g
LVNQRFhfU0JPTV9FWFRbZG9jXSA9ICJTQk9NIGZpbGUgZXh0ZW5zaW9uIG5hbWUuIg0KPiA+PiAr
U1BEWF9TQk9NX0VYVFtkb2NdID0gIlNCT00gZmlsZSBleHRlbnNpb24gbmFtZS5cDQo+ID4+ICsg
ICAgSWYgaXQgZW5kcyB3aXRoICcuenN0JywgU0JPTXMgYXJlIGF1dG9tYXRpY2FsbHkgY29tcHJl
c3NlZCB1c2luZyBac3RkLiINCj4gPj4NCj4gPj4gICAjIEFnZW50cw0KPiA+PiAgICMgICBCaXRi
YWtlIHZhcmlhYmxlcyBjYW4gYmUgdXNlZCB0byBkZXNjcmliZSBhbiBTUERYIEFnZW50IHRoYXQg
bWF5IGJlIHVzZWQNCj4gPj4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lL3Nib20zMC5weSBiL21l
dGEvbGliL29lL3Nib20zMC5weQ0KPiA+PiBpbmRleCAwZjFmOTI4MWFkLi4yMTg0YzFhMDdmIDEw
MDY0NA0KPiA+PiAtLS0gYS9tZXRhL2xpYi9vZS9zYm9tMzAucHkNCj4gPj4gKysrIGIvbWV0YS9s
aWIvb2Uvc2JvbTMwLnB5DQo+ID4+IEBAIC0xMDM2LDggKzEwMzYsMTUgQEAgZGVmIHdyaXRlX2pz
b25sZF9kb2MoZCwgb2Jqc2V0LCBkZXN0KToNCj4gPj4gICAgICAgICAgIHNlcmlhbGl6ZXIgPSBv
ZS5zcGR4MzAuSlNPTkxESW5saW5lU2VyaWFsaXplcigpDQo+ID4+DQo+ID4+ICAgICAgIG9ianNl
dC5vYmplY3RzLmFkZChvYmpzZXQuZG9jKQ0KPiA+PiAtICAgIHdpdGggZGVzdC5vcGVuKCJ3YiIp
IGFzIGY6DQo+ID4+IC0gICAgICAgIHNlcmlhbGl6ZXIud3JpdGUob2Jqc2V0LCBmLCBmb3JjZV9h
dF9ncmFwaD1UcnVlKQ0KPiA+PiArDQo+ID4+ICsgICAgaWYgZGVzdC5uYW1lLmVuZHN3aXRoKCIu
enN0Iik6DQo+ID4NCj4gPiBJJ20gbm90IHN1cmUgSSBsaWtlIHRoaXMgZGV0ZWN0aW9uIG1lY2hh
bmlzbTsgSSB0aGluayB3ZSB1c3VhbGx5IGRvDQo+ID4gc29tZXRoaW5nIG1vcmUgZXhwbGljaXQg
Zm9yIGNvbXByZXNzaW9uIHJhdGhlciB0aGFuIHJlbHlpbmcgb24gdGhlDQo+ID4gc3VmZml4IGlu
IG90aGVyIHBsYWNlcz8NCj4gDQo+IE1heWJlIHdlIHNob3VsZCB0aGVuIGludHJvZHVjZSBhIFNQ
RFhfQ09NUFJFU1NFRF9TQk9NIGJvb2xlYW4gdmFyaWFibGUsDQo+IHdoaWNoIHdvdWxkIGJlIHVz
ZWQgYnkgU1BEWF9TQk9NX0VYVF9TVUZGSVggdG8gZGV0ZXJtaW5lIHdoZXRoZXIgIi56c3QiDQo+
IGlzIGFwcGVuZGVkIHRvIHRoZSBTQk9NIGZpbGUgbmFtZSBvciBub3QuIFRoZW4sIHdlIGNvdWxk
IGNoZWNrIGluIHRoZQ0KPiBgd3JpdGVfanNvbmxkX2RvY2AgZnVuY3Rpb24gd2hldGhlciBjb21w
cmVzc2lvbiBpcyBlbmFibGVkIGJhc2VkIG9uIHRoaXMNCj4gU1BEWF9DT01QUkVTU0VEX1NCT00g
dmFyaWFibGUuDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluaz8gRG8geW91IGhhdmUgYW55IG90aGVy
IHN1Z2dlc3Rpb25zPw0KDQpJZiB5b3UgdXNlIHNvbWV0aGluZyBsaWtlOg0KDQpTUERYX0NPTVBS
RVNTSU9OID0gInpzdGQiDQoNCnRoZW4geW91IG1ha2UgaXQgbW9yZSBmdXR1cmUgcHJvb2YgaWYg
c29tZW9uZSB3YW50cyB0byBhZGQgc3VwcG9ydCBmb3IgDQpzb21lIG90aGVyIGNvbXByZXNzaW9u
IGZvcm1hdC4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBKw6lyw6ltaWUgRGF1dGhl
cmliZXMsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0K
PiBodHRwczovL2Jvb3RsaW4uY29tDQoNCi8vUGV0ZXINCg0K

