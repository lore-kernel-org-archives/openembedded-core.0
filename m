Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43FAC48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 16:53:29 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.134])
 by mx.groups.io with SMTP id smtpd.web11.42206.1707065599718120181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 08:53:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=XR4LhOH9;
 spf=pass (domain: axis.com, ip: 40.107.105.134, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIgn0R4Py0IYPumG1WGVYqt47ATbKGEVH+muhgR0R3nYWwaeCOv1qo37MpwhhNjreIeVMIAL5dZpY3QslF4sBhlATxuTOhW8f4ZQaSKSPRQj9xr758il5V+Qwb5hZkujWDwHEBmjpcMJcqD/fmjENzch6Y5hyC+yOyUfDEBQfxYqD0KbauA53n8rysO1FAjI+GQoGEFSm8cPp6I+BgjMc8nFnWEoJ6stEtOKNFhM5ryLZdiociA999YNX8W/aFe40bztre6zZJ+T93wfFa5lAVzQrjZBe6oyJ9S2uuNRYTNrCnIWTeiYZlq+WXhQWOAWiTCWc0+MKv2taQ2z7sef8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQCRdE7MAxa+XL7Heobjeklx7xdYFh+xd3tlMyJrrb8=;
 b=aP/sJile04jf5VXw8GM179j/bsjmA5ctK1b6ossZLOuQsO5F/QC+QM/yWADL+1MMSot4JGa+uZM6Mibbll639mYqzN+ZIUuDbkIhbl6zLSrz92xbkdv05U/4mZ+zTiVz51EvOjexTygArATttJbP3Y+YeKAJrUp0RvpVKQLChYN6JFbe/Rdbc+AG9jtyxR9Mveh2Y2HYE/LjPFS4H/QwDHipAUHqQwSlOaBgPkQ8NYYV+fVG0HLvLkMOIpSxH0CWyb7x2jEi2m2BXiF0GzwyZKWM/A0MUUS58w536ZC/v4rdDl8UVWAOwf3eZ7afr3Rb0sMieo3HWaj4g8p1O5Tfgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQCRdE7MAxa+XL7Heobjeklx7xdYFh+xd3tlMyJrrb8=;
 b=XR4LhOH9szYwL/uKAbOq9DGZSr6h1BfjTFemq/Km9GaaAPjQ11inRZdm0T3tZxcdVI3se9sCgyUwvwHPSV7jbC+5xYPogx6aaQ/LnlUjqJ7QzXOq5pb1f8dnSkbwUAt5PqbvoQo6R60/XnVR2VXjCY3DwZLw0BQ94yOTtWT1a/g=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9116.eurprd02.prod.outlook.com (2603:10a6:20b:5b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Sun, 4 Feb
 2024 16:53:16 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Sun, 4 Feb 2024
 16:53:16 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Mingli"
	<mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] xmlto: Remove the explicit PV setting
Thread-Topic: [OE-core] [PATCH 1/3] xmlto: Remove the explicit PV setting
Thread-Index: AQHaVzpWJQUCTMww6U6b5gWParJMvLD578IAgAB0OmA=
Date: Sun, 4 Feb 2024 16:53:16 +0000
Message-ID: 
 <DB5PR02MB1021376DEBE95E6F325257550EF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <17ABBC6806A4667E.11393@lists.openembedded.org>
 <e1c33511-a475-4cef-8454-09de1986fd33@windriver.com>
 <CANNYZj9TwXqe+HNTRgnzwWsgEoyMPSTo7sWEymCm4CEXrqcybQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9TwXqe+HNTRgnzwWsgEoyMPSTo7sWEymCm4CEXrqcybQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9116:EE_
x-ms-office365-filtering-correlation-id: f481d15d-030f-4504-e713-08dc25a1c85f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x6m0rwHRMIjBx6LYStIBUpioeyrXCVMi+T5lMMM7qIh//iGmItkhtsuShCWnElfrEWySvxgLz2pp/nttrBUuMExuhumpc0BfLTXWd5qUbxJNJ7z0Y7aTI1jXf194XH+lRJuxKSqrlOdz66lsT5SX+/c7suDVXM+wdukPBE9Peud4z2ReR4fkEU8m41ua85V74RA2aHfeNjbcioakQXIX6Bv72ykzg6L2oXS8yfJLnhW2irQt0WGZEt64mznLsJf9MF/ORsa/3r7MnSFQi/io/1QjDEh4IdpeItJedetoTzuNnHh6eHoVD+GIK4+bHG5kBHkV178wXSqMDlJ3+Ll408LG6ZQ3tdgvyctoIGXNLj4C023HJlpQoQlUIl99490Qx7c8RuuFey8dCMy4nXPzY86H9YfHtHCqK+vZIkR9l3Zp1kJMefkRBPNbbqM7J0lFyd2+ax0e3065e3XaQR2Rz9DL2yY3rTyt8OKUUxFbewCU4EG5OyOhx65QlIwtJgFS1UT1zR2nMiF+C6OGyPHk0yu5JtbMZT//24SgiapxHM/Z+V/gV+st5FdVLMTrIYVNM6twtTsvOjJPHX+LaBO+7v06DeFCKx5k+xRTP+1CGvU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39850400004)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(55016003)(41300700001)(966005)(122000001)(53546011)(83380400001)(6506007)(38070700009)(9686003)(478600001)(38100700002)(71200400001)(316002)(8936002)(86362001)(66446008)(7696005)(52536014)(110136005)(66556008)(76116006)(64756008)(5660300002)(8676002)(4326008)(33656002)(44832011)(2906002)(66476007)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXNteVNzZkRYZHBSQVg2K0poejNONHg3SDlRYVROejR4Q2R0dUE0WFp6M1RF?=
 =?utf-8?B?Q3liajIyZ0gxYXZRWXF0SHR2b0NJOTlpL0ZnbndnQlM1YkNJajkzMTlTbVpr?=
 =?utf-8?B?TVk3UjdRNEkyd054eTdwNGtPTzd4SVZyUlRRTnMzdTNicE5qVlU0QjE1QWdn?=
 =?utf-8?B?YVdENDQweWlIemJQemNiVHA4b0RJY0w2VE1JWVlYNXROSzBjWFphdE5UUC9t?=
 =?utf-8?B?TWNSNnR3SmJBdUVOczE1djZNVnNZYnUzRHl2Z2dEbG9ONm5iQ3hxTUFQbVAx?=
 =?utf-8?B?UkY3U3NRTTMvUDhlTFFuQjVOdnJQODdJWWptTElvek1iNlRwb21mbGhDbFNv?=
 =?utf-8?B?aTJGUHFLZ0ZsM2JCcE54dmpRbHVsNzZwQm5kZWhOQnFLSE9FV0p1QS83TnAr?=
 =?utf-8?B?YzRwWlNnL0JCVkhGYU82RHRTYURvOTlyakVrRVgzOGpjSWZqTkxrVFB1S2Vr?=
 =?utf-8?B?cUsvcy9hQ2IyOThLZDNHWE90TEVyU2h5TzdZN3NFM3BIWWNKTTIrY1U4cHFV?=
 =?utf-8?B?RGpLam5WZ2ZsRUJFWHh0YUx4dWNlc1Q0S3FRREVLYjRWWFU2VHhvWk1RZ00x?=
 =?utf-8?B?ZnRsUGhVcFlpcjdtZWtBTjB3ZVlsVnVoM1lkRUQ2dUlFM281Nnp1N251VU5X?=
 =?utf-8?B?ZTNMNkRtWnNFVEJYbDV4MTU5VHAyNlkySzhKVnhPUVZEcTNJcHh3Y25QUWxQ?=
 =?utf-8?B?RW1mdUlaYlF5RjRkQUNYN25NY0NlTUtSZjU2TWIrMDhjcWl3cEx1OWpaa0RU?=
 =?utf-8?B?VmVsd3dRY0VrOWdlSk85Z2NmaDlGQk9HQUtjVDlGbW1rNWJQVERQL1VPQ0Jm?=
 =?utf-8?B?cXdibkMvM2hybXVxc3l5aGo4c0lLYUFTdEJ2NVliam1ScUdkcjdvVjRTamxR?=
 =?utf-8?B?STR3M1VQZC9jWjI4NHh5SWlhUi9KRzhKRGx1bi83UTdpSG55SGtrclcyK2Ns?=
 =?utf-8?B?NWhXUk9wSzVFeE9CR2tnZ1dmeTQxKzlBaTdHcWVvWmZ6NDQ1ZVQ1NXFjeUN2?=
 =?utf-8?B?OWhJSVQ0UTRCRHV1dExGVmY2MVlDY0wwUzh3R2hpK2FmM24rYnlWelBGTlBH?=
 =?utf-8?B?NlRqZ01XN2pvNDV0UDhvWndvQkE3RnQvMjFFbm9PM3ozS0xESkRpYkgyVUdy?=
 =?utf-8?B?Z21oNFRQdlRrZ2xhbGlMQ002NUpsRkoxL2s2SkhrRkZiazQxemcwOHdJNWRk?=
 =?utf-8?B?UTd4eGc5SnRYQmliQ1QrTUpubEJhMm9oT3VSR2RpOXp1dE9FbXBMUlZWdm8w?=
 =?utf-8?B?eFFqekhkV04zNDFIc2t0Qk5yOVFySW5QQURSbEZjeEZYOGs4U2tnVlBwaGNU?=
 =?utf-8?B?Z1o3MTZmcGd2WGZLZmsxN1dHWGtKS0xCek4xMjdYRXc1Y2FQTlBGamtSQ05U?=
 =?utf-8?B?ZGEyRFBpVC9oNlh1azRQeTRLVEVWSStIekc0ZGVDUzFTanVqamdVMm5VaU1a?=
 =?utf-8?B?cTdud0hiV0ZIUU8wMTNmM2Nmc1YrL20yTVNzQ2dieU9lTU9PR2t4SURZZ3Jq?=
 =?utf-8?B?L3hjc2JSNjRId2x0ZUZEcW1GWTZJeVh4NFBrMm04Q2hNSU0wZVdDREgxSEd0?=
 =?utf-8?B?R2VKSktlaTd0bGZNK21MS1BXVUVTU0huc09mY2kyelpBUXk5b2MxQnlYTk01?=
 =?utf-8?B?UkwwdldEbURYeHV6TjZqK2dTcTc5WCt6Um1HUTNwVTJZODJ3bFVyMU1TNWls?=
 =?utf-8?B?WmJEZkh4alZISEhkZmZsTVdidWR0N215SHFPeUdwc1lGTzB5dHZXMVRBT2Zy?=
 =?utf-8?B?a3M1RmVBVkVSWGdOL1Vpb2lMNTZrY3c1aE5pSC9CcE90b0JBU1FiSExFZXc0?=
 =?utf-8?B?M0RFcTcxSDBPQWtGUFVWWnJqRnhiWndjWUlsb2dSbzlZTEJhU1o5UGpvbUpV?=
 =?utf-8?B?NzNaZURGZzJzK3gvSHozTFpWS0w0WXo5NWxaNW5xTWhpQjJlazRWL3dqUCtB?=
 =?utf-8?B?dkEycmVUdUVid0VCV0Z2Y1UwdTlCQ3I0ZWlDcGlFYTZXbHVpelNCQVBLS0Nn?=
 =?utf-8?B?ZVZKMTB4UmxXcmlQaU5WMzBhYk9oNTJueE1mbld3L21KSzJ5ZG5LR01QMUNU?=
 =?utf-8?B?SW5vSTdlR0FTdWN3cFgxZHA5di9lZGQ4Wkg3cnNQSFNleDFQRWNHUGpaZUVQ?=
 =?utf-8?Q?4iGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f481d15d-030f-4504-e713-08dc25a1c85f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 16:53:16.0955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzIzsxMDtwfwn9wbCeusbtDZ3dgsErRw1++1sqqtB7Psdj44BVv7fM814Q/Gsvlh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 16:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194898

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluDQo+IFNlbnQ6IGRlbiA0
IGZlYnJ1YXJpIDIwMjQgMTA6NDcNCj4gVG86IFl1LCBNaW5nbGkgPG1pbmdsaS55dUBlbmcud2lu
ZHJpdmVyLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8zXSB4bWx0bzogUmVtb3ZlIHRo
ZSBleHBsaWNpdCBQViBzZXR0aW5nDQo+IA0KPiBEb2Vzbid0IHRoaXMgY2F1c2UgJ3ZlcnNpb24g
Z29pbmcgYmFja3dhcmRzJyBlcnJvcnM/DQoNCkkgd291bGQgYXNzdW1lIHNvLiBJIGFsc28gZG8g
bm90IHRoaW5rIGl0IGlzIGNvcnJlY3QgdG8gY2hhbmdlIHRoZSBQViBpbiANCnRoZSBmaXJzdCBw
bGFjZS4gVGhlIGxhdGVzdCByZWxlYXNlIGlzIDAuMC4yOCwgYW5kIHRoYXQgaXMgd2hhdCBpcyBp
biB0aGUgDQpmaWxlIG5hbWUuIEhvd2V2ZXIsIHRoZSB1c2VkIFNSQ1JFViBkb2VzIG5vdCBtYXRj
aCB0aGUgMC4wLjI4IHJlbGVhc2UsIGJ1dCANCmlzIHJhdGhlciBhIG51bWJlciBvZiBjb21taXRz
IGxhdGVyLiBUaHVzIHRoZSAiK2dpdCIgcGFydCIgaXMgbmVlZGVkLiBUaGUgDQoiKzAuMC4yOSIg
aXMgbm90IHJlYWxseSBtZWFuaW5nZnVsIGFzIHdlIGhhdmUgbm8gaWRlYSB3aGF0IHRoZSBuZXh0
IHJlbGVhc2UgDQp3aWxsIGJlICAoaWYgYW55KSwgYnV0IHJlbW92aW5nIGl0IG5vdyBhZnRlciBh
bGwgdGhpcyB0aW1lIGZpbGxzIG5vIHJlYWwgDQpwdXJwb3NlLg0KDQovL1BldGVyDQoNCj4gDQo+
IEFsZXgNCj4gDQo+IE9uIFN1biwgNCBGZWIgMjAyNCBhdCAwODoxOCwgWXUsIE1pbmdsaSA8bWlu
Z2xpLnl1QGVuZy53aW5kcml2ZXIuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFBpbmcuDQo+ID4N
Cj4gPiBUaGFua3MsDQo+ID4NCj4gPiBPbiAxLzE5LzI0IDE5OjMzLCBZdSwgTWluZ2xpIHdyb3Rl
Og0KPiA+ID4gRnJvbTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4NCj4gPiA+
DQo+ID4gPiBUaGUgbGF0ZXN0IHJlbGVhc2UgZm9yIHhtbHRvIGlzIDAuMC4yOCBbMV0sIGJ1dCB0
aGUgUFYgaXMgc2V0DQo+ID4gPiBpbmRpdmlkdWFsbHkgWzJdIGluIHRlcm1zIG9mIGJhY2twb3J0
IHNldmVyYWwgcGF0Y2hlcyB0byBmaXgNCj4gPiA+IGJ1aWxkcyB3aXRoIG5ld2VyIGNvbXBpbGVy
cyBhZnRlciAwLjAuMjggd2FzIHJlbGVhc2VzIGluIDIwMTUuDQo+ID4gPg0KPiA+ID4gWzFdIGh0
dHBzOi8vcmVsZWFzZXMucGFndXJlLm9yZy94bWx0by8NCj4gPiA+IFsyXSBodHRwczovL2dpdC5v
cGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9MjdhNTAwMDcyNGU0
ZjRkZjI3NDI3OWJjZDgwMWQxZGMyODMwMjA4ZQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3htbHRvL3htbHRvXzAuMC4yOC5iYiB8IDIgLS0NCj4gPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy94bWx0by94bWx0b18wLjAuMjguYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMveG1sdG8veG1sdG9fMC4wLjI4LmJiDQo+ID4gPiBpbmRleCBkNWEwZTY5
ODQ5Li42OWY5ODlmNWI4IDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3htbHRvL3htbHRvXzAuMC4yOC5iYg0KPiA+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3htbHRvL3htbHRvXzAuMC4yOC5iYg0KPiA+ID4gQEAgLTExLDggKzExLDYgQEAgVVBTVFJFQU1f
Q0hFQ0tfQ09NTUlUUyA9ICIxIg0KPiA+ID4gICBTUkNfVVJJID0gImdpdDovL3BhZ3VyZS5pby94
bWx0by5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciINCj4gPiA+ICAgUyA9ICIke1dP
UktESVJ9L2dpdCINCj4gPiA+DQo+ID4gPiAtUFYgLj0gIiswLjAuMjkrZ2l0Ig0KPiA+ID4gLQ0K
PiA+ID4gICBpbmhlcml0IGF1dG90b29scw0KPiA+ID4NCj4gPiA+ICAgQ0xFQU5CUk9LRU4gPSAi
MSINCg0KDQo=

