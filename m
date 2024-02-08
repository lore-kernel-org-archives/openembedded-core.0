Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85616C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 19:07:37 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.96])
 by mx.groups.io with SMTP id smtpd.web10.4095.1707419246881044227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 11:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=TtdEK/Gp;
 spf=pass (domain: nedap.com, ip: 40.107.104.96, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYYzgUeAT+CWcvWntAOwDGiV+sUyq1j0ZJ0t2D6PWY2caJQ8ZKmVeBrk8Rf8CsGzYddC3c2OOtLKwI3apJpMQyHuKH8i30Gx9uP/r+gqTnyzJjJzgMHKCD8wI9WZs527bEUMadP8FWyqN/HuUwVl9kFtXA7tFZcOKVspqwEQ22hKEyBHC5W5YNCDw3YhBhGBy1nCXlJT0grffITmu9xhdU2Isk2s4fvfoAzNk1M2npYrirU5ubIkyvjozXcVq66tZ5kD5MOYV5i+o1wh1JrSAgyZqNXMYuoTyLwGq8LrlzuhIoHUcOZNcMmySNo5rmULpaQRvcMm3CgUqZdr5j5EyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRfo4rdqKEaUZtbJ4rCEuuN8iifnekYyTteFEVDCnVY=;
 b=KuvTTRpfGq5cUKBrsCmGQge33auyi2Skk0eYfd/R7UHLvDM0yUGJBe13jFK0M9Vtnfh+52scAGYGZOPCZbIn6Yhn2e+lcYI0DZz5x7m6aQTueA4ozUzqTCxYKSaaFVtIkd4bzTM4EiL4EMnI8c7oc/LypK7h++hOpMetupBOpCCAAnfcGsGYnrv64mhbtM0H4CCMV35DDS6gzSMUjv4Yt2/5rjrD545h/3oPau/zms9H16nZDujDHstWdSazSF8VPMAHQjSq8tDTxsts72xTw7fZkswxxPFoOeRnr7gESh9XR11zyq15Gz76a4Be+HoJLv6N5l01BCMrMbHbbZPgWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRfo4rdqKEaUZtbJ4rCEuuN8iifnekYyTteFEVDCnVY=;
 b=TtdEK/GpHEGlbb+X76ukFVaYaXuIEPSQZ+fXQuWJv2vJhSyr9505U8Y/ZNUkZO4hz4/yAEHf9QuuyN6KbF5jwcjPFE1u/n8T9/yDoE7vZfK8NzWS0smIg+U2s2Kqh1RJlIpt6pu1ZK1It5nCKFOzQWU7tpRryP+v0bamYjkSKgI=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by PAWPR10MB6782.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:336::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 19:07:23 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2%4]) with mapi id 15.20.7270.024; Thu, 8 Feb 2024
 19:07:22 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 5/5] oe-setup-build: add a tool for discovering
 config templates and setting up builds
Thread-Topic: [OE-core] [PATCH 5/5] oe-setup-build: add a tool for discovering
 config templates and setting up builds
Thread-Index: AQHaWqcVIKS+PzXX+kmITLe5mnJ8ErEAzNvQ
Date: Thu, 8 Feb 2024 19:07:22 +0000
Message-ID: 
 <VI1PR10MB318275D919AF336CAEA9DF2EF7442@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20240131123908.1098544-5-alex@linutronix.de>
 <28123.1707399641733383554@lists.openembedded.org>
 <CANNYZj9qhPgj_ApCfX0KDfgsYPps=0s=2HC1903--ZsQ4MrhtA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9qhPgj_ApCfX0KDfgsYPps=0s=2HC1903--ZsQ4MrhtA@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|PAWPR10MB6782:EE_
x-ms-office365-filtering-correlation-id: 126b51de-d947-4323-7869-08dc28d92e2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6hrKRL7fFj1I3KwjqNZcvzJBQVGNEGKjivwAiGIxIlj0tF1tBWDqjkwfxLFp0cLo7FAWW3i5SgpBfMZ2IhUNBvv5g6lJBUUevGEUVVZ3Hcic3COUpyWjtRiQGxO1K1epvJOba/cgdLz3qXfT5yerTmw1uhLFfAXdMqAFbs0Ha112I6iQM95m4uRWWGAfClxWBtA1Nujzn2U7qO8+rf7l8/CR7qcarv47WpW/e4oTli8Dw7Ey1YJZ55FK6679xr1JmdpUDt++o6o5N6AKKcTBw7pnOtRUj+9qY7r+xBaBfPin+74253w0pDnDL48R3RPVggL8daEdHNlqo8yNaIt6jdoAmvOFNJ9zO+GIPKmFtv584OauOBD4+yKIV3hlKNbQFb3YFhxl1Ksd/CKWbWZ0q8RuvvQ5x9qizlsJTXBaeCcBeXhjHA012gVToG5M+Scu8a9GniV4KGW8QSn/Gq4lIk6bsEe/K4rDxriINh7ZJtE9alMRXRVUqzcaJpZfDViZxw0BPOgMcL6ywGVIGTdSZaAFUwVlPs8BOYXHCFK1YhfM62x6cDORDYXOwUmxOc003BrOg5b3VMHWXEac++WM5rnBrrI28CEgHArRgkyPH9jmj1855hpwvhXPN0pfiymj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(346002)(376002)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(33656002)(55016003)(6506007)(122000001)(83380400001)(7696005)(86362001)(41300700001)(9686003)(26005)(8676002)(4326008)(52536014)(8936002)(71200400001)(5660300002)(478600001)(2906002)(4744005)(66556008)(44832011)(64756008)(66476007)(66946007)(66446008)(6916009)(76116006)(316002)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RlV6UUpYZEhSWEhoUjJUYkhpbTEwSVF6ZEhNVXdBNjNTS29UYmxhSWZpNGk1?=
 =?utf-8?B?UEVtam4zWG5HV01mc0V0TUdxUXlpenluUE11SHFFMXRhNHVrYUE3NDNoL2ds?=
 =?utf-8?B?TVNFQXdXb29idjdnbTQ5bkpBM3Y1QXNQeWsxY1RMM3FsL09veGlPZUUxSEtk?=
 =?utf-8?B?N0VKQ1p0aXF2SjY5RWo0WU9wcmdiU2ZrWmZEeSs0bGhCUG9NY0JtcTh6bE15?=
 =?utf-8?B?YTFCbUlsTjdDbzFQVDRkWTd3TU1yR1pud3NFWnV1RTlZL1ZVNm1QWEZ1S09Y?=
 =?utf-8?B?L2VLajd4MWxya1ZwN3pITkRwR1FrVlR5dnZvYTl1VFJRYTJrNWZVT0FDUHM5?=
 =?utf-8?B?SHo3MHJTeXRFQ0N4VUFkNDN4Y3VsVlBsUzVLb3phQjE3Rkl0YlVSa3hPaG5Q?=
 =?utf-8?B?MW9tMWl2TGt6ZlZndy9USEpYU3hUeVFvZU9laFRFZXkrK0RBYjQ2K252dXZv?=
 =?utf-8?B?dVVGektDS0R2NVlpYURiQnphTzkvTHM1eTZUZHVpZ08vQlZ4SDZ6elhYRjJR?=
 =?utf-8?B?aVFKNmlnOURtZ0FsZmxSSExKczhCU2Y3SWt4UlVhVUQxU3JTdlV6RlBmS1Ir?=
 =?utf-8?B?dEZCWDNqTCtxWFJGWlZBSXQzUDI0bTdlSDdFOHY1cTNxdmV6aWJaalBEWHFv?=
 =?utf-8?B?Wi95c21WL2llME1SNWtRQTVrMjlNMzdDVEtQOGk3M1UwcmFaOVRZcFRxL2FB?=
 =?utf-8?B?RzNOWUkyblg4UVQySGErS3hyVFVnV21xcERnYU5mdlFRQ3dvS1VZeFEzWFo1?=
 =?utf-8?B?V1U5SUM0UStQVlBSRXBCRGp3a2cvcFNHbVYrRUw0YVpzaERMeTAzcXZneDJz?=
 =?utf-8?B?cEkyd053ek1Dbjk0cmh4b2lyYi9ydWZnMmNyaWk1UzdvUEtIdVhPNnZmYmNG?=
 =?utf-8?B?bGp0SGZUWlp5dGkzc0I1VEEzVXVjb2JCbUdoZzA5Nmw4cVl4ajlmYTJtSTVL?=
 =?utf-8?B?QzF6b0g3TVBOb0FtVGsvMkVkZ2VMbEdUTStuV3RMTHJSdU8zdnFTTXdqYVNy?=
 =?utf-8?B?cEhreXd6L3AybzgzMDQrbGtIRFhzVFIrSFIyVERrZlVCMkN5dHRVNUVvTDla?=
 =?utf-8?B?a29ocENjajJkNUZWTXNMSVltcTJxZDRaQllDTEVYemF5SW8rNWwxOFJpU0Uv?=
 =?utf-8?B?d1dvSDdyMmp0emZ0alpIaUtkUUJqL2pialZpWVc3dlZtaHNKaWtMNG5teWZp?=
 =?utf-8?B?QXFsNnUyL1g2dS9tNllQRkpaQVRVMW5TV1A2eTBYUy95R1pRK2xlNGliaEVk?=
 =?utf-8?B?NjA1RTkzTkQxRWIydHRLMzg5TERQUHN5MXNnZ3pLTUI0K2F5dHJhcWlXK0NR?=
 =?utf-8?B?TU5TQmY2M1VLSk9KTUVCN25Ybjk5LzVUOU1Yb2JiZFVjZWFNUmtkZUFhamFs?=
 =?utf-8?B?cWRnUmZncytlUytpNnF1cWl6eVRjQlRrSmhabkNNWE9ubDZ0TjRON1d3d0Zh?=
 =?utf-8?B?UnJiZXlVUTlJbVNuMmRQaUJVSUsxNU5sR0YrWGFMYk0xZmFoM1lJbk53S0xm?=
 =?utf-8?B?b000S0U0anlmMzk2MlVYTnM3NllwYWdTeWNIaDJvZWx5bmNvVk4wMUtXWjJY?=
 =?utf-8?B?WERSckhiYzQzL3NTMlZsaE5jVTFHSmJxdFI1NWVoc1NiYVlLMjd5ZkRDanl2?=
 =?utf-8?B?YlNiNWZoaEczd2xyTTFLNHF5ZnVZcXgyOU9xOGN3OEo1dFVWNWtvMG5scUt2?=
 =?utf-8?B?Q3Z6ZnpsNDE5RkljMGJrUGQwaElWRlovclZDMHE5aFBnbitHUnBSZlQvbWxT?=
 =?utf-8?B?M1VGQkJEUG9xQVpicHk5VjNObUpSUUJuQjc0K3ZUTHFFZEZQVVI5SnpYR2dZ?=
 =?utf-8?B?MUVUS0FDdjFxZzdjbGVFaXpXM0JvMjl4NlQvQUQ4dVJQTUM2djk4MzdoRCtU?=
 =?utf-8?B?RUtFWk5hLzM2Vk5GMUJ6cHZvQy9PU3JpN0p6c1dYWVhZbklzVFJablEyMVNF?=
 =?utf-8?B?amlLQVBiQzZJUC9OZkdLY2xzWngrT1QrNlNmNWxKdVYydzZBdG5WTkIxR3dX?=
 =?utf-8?B?d2d0MmNRUEU3NlovcDhhY0pxZDZ2Z2xUenZHRzkzVXYrYzhRbzUrQzcrd2Rz?=
 =?utf-8?B?dTdkVFAxMjZCamsvUlQ4eitzQzB4RHdRUnk5T3dzVXlYajEwakdwMUVaQnZE?=
 =?utf-8?Q?ewim1Y+KaAI+K36ZoJGsDwc8S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 126b51de-d947-4323-7869-08dc28d92e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2024 19:07:22.7270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjJptjFXCf6Iqw1SOqGw9BMFwTa5FRnqAVS7n0+03Yngf06MTLrnZeJ7DgIgDnOjXKfBegkTOBLlYeWipzx447kV5F7cFVGH1QawCS1jtB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 19:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195174

PiBZZXMsIHRoZSB0ZXN0IGlzIHBva3ktc3BlY2lmaWMgYW5kIHdhcyBiZWZvcmUgdGhlIGNoYW5n
ZSB0b28uDQo+IFNvbWV0aGluZyB0byBhZGRyZXNzIGxhdGVyIG9uLg0KDQpBbHJpZ2h0DQoNCj4g
SSByYW4gdGhpcyBvbiB0d28gZGlmZmVyZW50IGNvbXB1dGVycyBub3cgdG8gbWFrZSBzdXJlIHNv
bWV0aGluZw0KPiBkaWRuJ3QgcmVncmVzcywgYW5kIGl0IHBhc3NlZCBvbiBib3RoLiBDYW4geW91
IHRyeSB3aXRoIGEgcGxhaW4gcG9reQ0KPiBjaGVja291dD8NCg0KU28gSSBkaWQgYSBjb3VwbGUg
b2YgcnVucywgbW9zdGx5IGZhaWx1cmVzIHVudGlsIEkgY2hhbmdlZCBteSBkZWZhdWx0IFNIRUxM
DQpWYXJpYWJsZSB0byAnL2Jpbi9iYXNoJywgaS5lLjoNCg0Kb2Utc2VsZnRlc3QgLSBGQUlMDQoN
CmJ1aWxkZXJAYnVpbGRob3N0On4kIGVjaG8gJFNIRUxMDQovYmluL3NoDQpidWlsZGVyQGJ1aWxk
aG9zdDp+JCBleHBvcnQgU0hFTEw9L2Jpbi9iYXNoDQpidWlsZGVyQGJ1aWxkaG9zdDp+JCBlY2hv
ICRTSEVMTA0KL2Jpbi9iYXNoDQpidWlsZGVyQGJ1aWxkaG9zdDp+JCBjZCB3b3JrZGlyDQpidWls
ZGVyQGJ1aWxkaG9zdDp+L3dvcmtkaXIkIC4gcG9reS9vZS1pbml0LWJ1aWxkLWVudg0KDQpvZS1z
ZWxmdGVzdCAtIE9LDQoNCkkndmUgbmV2ZXIgaGFkIGFueSBpc3N1ZXMgd2l0aCB0aGlzIGJlZm9y
ZSwgYW5kIEknbSBub3QgYXdhcmUgb2YgYmFzaCBiZWluZyByZXF1aXJlZCwNCkJ1dCBJIG1pZ2h0
IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBhbnl3YXkgaG9wZSB0aGlzIGhlbHBzLg0KDQpTaW5jZXJl
bHksDQoNCkplcm1haW4gSG9yc21hbg0K

