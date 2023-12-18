Return-Path: <venkata.pyla@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97464C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 04:12:52 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw.securemx.jp [210.130.202.158])
 by mx.groups.io with SMTP id smtpd.web11.35499.1702872771428729827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 20:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: toshiba-tsip.com, ip: 210.130.202.158, mailfrom: venkata.pyla@toshiba-tsip.com)
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 3BI4Ckkp1287274; Mon, 18 Dec 2023 13:12:46 +0900
X-Iguazu-Qid: 2rWgTXl34AdrrHTE6N
X-Iguazu-QSIG: v=2; s=0; t=1702872766; q=2rWgTXl34AdrrHTE6N; m=kihcsxNvwPo/TRp9RYjfafrp9ZWMgAn54ujjW3Ftsl0=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1123) id 3BI4Cj3o1021600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Dec 2023 13:12:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYPJqQWTzOMNfzjgmmgnzzH92l7kETnP1JYyP0w9YAjvqzV2saPK62G5REp569+i8aCTSGEZ/je7nE9MLWSl+cZNk3TuJXvQSw+sz+5M3/L4PgfPBzz9v8bAtDRDa7R16xHlD1dEGkQL8Rd/ptykoxZ1YMuKm0LvC8CuAfpJBRlCDCyRnDCoTjpZdxhnnWKBv/aixNeW9MLeJ/uYCGJP6MluZXasUUB7hv+EIk8msKoB7sJ5gDQOXXkXw92Ow51Ad2V2BEIOpcrTujxm278Vqwuvyo74OmPpqf8kKg5GmhNxuh0Bbmu/gI8paAYmrhMTLlHdwZ3wt/78Eb6aUZ5H4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LJcIXrW7qtRVdf5qw+XP+g9c/t9uixaCOYF1oKQRME=;
 b=KbTfY4i9xSA3xDeqpHA6ghf/bBLwd9bIrEABgrFuWlcgrluxN0lCAJ/39bXFxS9jhOafhbI1dYAqSdK5CIT+L1zuwaBXmAm+pt083uy0j/DFnNoNOzrfRZUNJWAPtrdwuuYLwaVGNULzpkHiA6l1qWFKL3A2DD/kH0oHyWAjHFXgcI79aoKkanG3XJcN42kOHjUgx+lq3eSAGfVRh7TMOQKim0EsEjeK/WtgesnkYYsooiIOJCDTiTNL9uGtv88xUk/A7KPFZ1+xTx1axzitYzmVDPHQt9lGnhJJgjk01p7wQVLMJKB8Zwq9bQroyVtdApoSLSarFq9491lNXkoa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba-tsip.com; dmarc=pass action=none
 header.from=toshiba-tsip.com; dkim=pass header.d=toshiba-tsip.com; arc=none
From: <Venkata.Pyla@toshiba-tsip.com>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <venkatapyla4@gmail.com>,
        <dinesh.kumar@toshiba-tsip.com>
Subject: RE: [OE-core] [PATCH] wic: use E2FSPROGS_FAKE_TIME and hash_seed to
 generate reproducible ext4 images
Thread-Topic: [OE-core] [PATCH] wic: use E2FSPROGS_FAKE_TIME and hash_seed to
 generate reproducible ext4 images
Thread-Index: AQHaLQMCrFe3D58f4U+w6jFpMkJQwLCrAIkAgAN1ywA=
Date: Mon, 18 Dec 2023 04:12:41 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OS3PR01MB6856B0D58CC6A11B828FE122A490A@OS3PR01MB6856.jpnprd01.prod.outlook.com>
References: <20231212135628.9595-1-venkata.pyla@toshiba-tsip.com>
 <CAMKF1spHz3zSOnop326y65A_1MPGqeZJJ2AnvTj=87VqFKbh=Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spHz3zSOnop326y65A_1MPGqeZJJ2AnvTj=87VqFKbh=Q@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba-tsip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6856:EE_|TYCPR01MB5904:EE_
x-ms-office365-filtering-correlation-id: 97a223fa-e4de-49a3-a88b-08dbff7f94c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yLSHOSHPztikP68luM5Pens08CLkmVYp5OJHVR5399qv3MAgxDEqdjh3KVp6iMrFjV36hlWMdHYyWRg9SP6ecYT0QaXG6P1QarFQ0dj2lryNZcSNI8gNb8x86u3VTT99ycovdp7Kctt56EJFqC+gAIboe4BXpIqsWQ/529/LhdFWw0d2EiKIyHS3vxC1dI9SWFvSqLY9/zQyRSvxRpwe7dlgjh4lgwlAGDPVsxTBliJBMsAo7wygrs1jn5RqLH1p8UMbI33RTVZVvom1FzuhijaZkqYyOff4Qo9u80Zvt5zT3pw7cvobFHAkjFFnnp2fqij/XhbQNHSL884qNwMmXNdESwzm7M3R0sHUZWn3Xfm+vpC4uFN0gvvaTxRasMiG9S4GZ67bIynNWB+faZTJY+ALiF2r9n2qb597SlpP0ub8dCdSUphgqQUkJV5PPXUscoZqtWNQgq0Jn55y0cuO5b6QWxwA/XyRzWtWcwoKvxcK8hKYOkMk09bNmBaFL3os+EEaElBSlRbERhybjgKeAxuwYUJqub9Dw8URlb9wCgs9jMlMDsO/yazrd7GRQCnph62DZJmN2ODv6MaQMPfujEjANU8ZZrr1NSSQQBqDuKI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6856.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(8676002)(4326008)(8936002)(5660300002)(122000001)(2906002)(52536014)(9686003)(53546011)(7696005)(71200400001)(66556008)(6916009)(83380400001)(316002)(66446008)(64756008)(54906003)(66946007)(66476007)(76116006)(55016003)(41300700001)(33656002)(6506007)(966005)(478600001)(107886003)(38100700002)(26005)(86362001)(38070700009)(66899024)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXJFZlhwZmwyVUUwNUZmdFlLQ3ZON1BXa1RXSUZUdlFDTDJyNStTU1dVRUZI?=
 =?utf-8?B?NUhqV2ZGdzZaSTYrbW5KdjZ0cGtXWnJ1ZCtXVEtrT0hVdSthbkpQLzZUMGlt?=
 =?utf-8?B?d0JmSFJydndNVkpVWVd4eC96amRaQU5EcTVUK3l0M3d4RWV1UE1kcXg4U2RB?=
 =?utf-8?B?V1JQSW51MGViaFR4Zm9FM3Z3MUlqREsxYm9HUnRFNW96cFcraURPSllzV2VD?=
 =?utf-8?B?a3FocE83REoxS0YwUFNPZzNtQXM4YXJTNW84ZEJRSkJmYjJLVWVTbDZLWDFu?=
 =?utf-8?B?cU9zVjAwclFyaUlpeWZtM3VKdThvWEQxcE9oQWZLK2tLaXVqUm1DcFcvdjVR?=
 =?utf-8?B?QWdFNXZHdXRMdEFKS3o0VU9KcTBlUGdnVVU4QWRLQTRUbUpjT3R4dWZ0U0d3?=
 =?utf-8?B?L2k5VzM0Q1pjL09BTkxic0ZSQU5NRjY1SG1sZ1E1MWNOZVBGZHd1QVkzN2oy?=
 =?utf-8?B?VGNwWkF0NWtkcmhyU2tJcmhXZHZvcnk3Ylllem9FM0RtaDQ5cW9ZM2s2U2FN?=
 =?utf-8?B?TExScjVKc0xWSzA4eGJMc3pBbnVkSDd4NnFpVHBIa1JXUVhUYXNKSnRhZklt?=
 =?utf-8?B?ODBKVTNxSTEzWTJKMFk0OGdJWHE4OXNWbUVZa3ZqMjZzNEt0dmpuekxDN3cw?=
 =?utf-8?B?S29FUjd3YkxjMElnTTdXN3FCUllZaVEzRVBFc0ZicjBqRDNnbXFLQ2Y2TGp0?=
 =?utf-8?B?eGtwd0N6cjkwQjBEWnFIRzViamQrcmVnRll1MmQvY2ZvUzAwcHNFSSt5WDFn?=
 =?utf-8?B?WlRNZGthMzJlQ2lrTEJsL28wOGd4ZmMyWmlQcUl3KzgrYUJSVkJ4YmNXL0lZ?=
 =?utf-8?B?R3BhR1lyaW9BbTlFKy9SSU9xOWttRmwvbXNKdmhaeHVBMEplUU1iM0pWRklY?=
 =?utf-8?B?cm9SSXRxa1hwRTcrdkhXTnl4TXkvdGMxOTk1STIvaEtIeVdSbEZQK2NxQ3Rh?=
 =?utf-8?B?WUtSSENRc0xFK3ZSNUFIZUNFSGRWNi9YWi9sd2hHWVhhUnVsQXRKaEthUnVE?=
 =?utf-8?B?cWsrMG55ZG9xTDRFQnRGSE9QOGtlRzM2MmN2QThKUFBaOE5DY010MHJiek9I?=
 =?utf-8?B?bGtidmlxcDBUVis2ZzZvZG4zNXpnRWVQenN3RmJ2aHZHellLTEJwbkIvSnFT?=
 =?utf-8?B?aHlSamVNbHhWNWNhdVVRdFhqT0FGM2wwVkY3WlRmcTl1T3dpcFZSOTZEZjlp?=
 =?utf-8?B?bmFMN2phSG9MQ2pxTjd1SHhEWmRsTEMrMFFYNmYzMWM2RjJYU2JuRFpSdHJo?=
 =?utf-8?B?cVlZYStNRXo4QVFucGIyRVp2TGZyWWZzc0VTKzJrQ1JaS25RR3RKLzBvN0Jm?=
 =?utf-8?B?TC9EamU1NFN3RG0vM0RITGpPN1lveWd2ajJPdzVyb1FsQkc0dS81eThUcTFS?=
 =?utf-8?B?dzFYOWNEVUx1dW5DamlEQWZyVVJJQk9pdzNyOHdCVFRRbTB2NC9xdUdKQ2lB?=
 =?utf-8?B?Ulk0bHdTRkFSVTBvVDI3MGYwMTFuQmw1eHlXeXpEQk1CVGFidG15TkFHSE1x?=
 =?utf-8?B?NWJtL3pOTWhOT2tWTGhpOVVHdlBVYkEvTW9QNkp3NTYwQ2dyRk9vV0lUNE0y?=
 =?utf-8?B?RmtzYS83NnZkVUpIR3ljcTVhMC9UUEY2NFRDQ3Q4VXZCZEkzSTJXckZZU0N1?=
 =?utf-8?B?b2xHTFVIOVRRc05uYkxIZ29EbytYZFowZWY1bnE0MmgwTXpMOU9xUldoZ1M1?=
 =?utf-8?B?OXZmU0V3ZHc2NkZERU9RRE54Y2dwK2RibEY3S3VlR0RQVVp4eURGZmNCQ09u?=
 =?utf-8?B?Z0hHR3huWDZ6T0NmMmNWeENJMG5JL3I5aVpncUVhV3JacU52Q3ljaU1ROWpJ?=
 =?utf-8?B?c0NIMmRkYmJOb04zQVBkNXo2dkRuZ25LWTJORjlFOHlta1RRMTE5bklsTE9Y?=
 =?utf-8?B?bXBpTU5pNkZyVGFCSUlteWIzMHdTRHJNVUJ1YVJEanZJY2FqdURVNGhNdm9E?=
 =?utf-8?B?QVJJYjNxV0NrNlluckc5ZThkV0F2eHJHQjhTd2VVR1l3NUk4K2U2QnlsbXZz?=
 =?utf-8?B?V1dRUi9rZkF1cHNIQmFLSCszSU1DNDRaOEVVQlNTQk4ybGcwQUl2U21MVWpU?=
 =?utf-8?B?b1dON2pWekJlR3VtWEg5T25MTjZseVVKb0pLZEZHSm1PWjNZYVhEem9oNXYw?=
 =?utf-8?B?SmVicTV2VlFnQzVaeTZmWmQ4K2VMcDNldnVmVWpmWTZtZHdIRWNtTTdkeHdm?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toshiba-tsip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6856.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a223fa-e4de-49a3-a88b-08dbff7f94c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 04:12:42.4900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOh80yAT5qUW+9nfxevNCDvr+qh/lmZvD7ykQByVjazao1cyR0GJi9Kv81/zFRMxNgas4ZVglzZF4KTpQwP3dWeS2qW3MxuZj5S/f8aWDws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192597

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIERlY2VtYmVyIDE2LCAyMDIzIDQ6NTAg
QU0NCj4gVG86IHB5bGEgdmVua2F0YSjvvLTvvLPvvKnvvLAgVE1JRUMgT0RHIFBvcnRpbmcpIDxW
ZW5rYXRhLlB5bGFAdG9zaGliYS0NCj4gdHNpcC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSB3aWM6IHVzZSBFMkZTUFJPR1NfRkFLRV9USU1FIGFuZCBoYXNoX3NlZWQNCj4gdG8gZ2VuZXJh
dGUgcmVwcm9kdWNpYmxlIGV4dDQgaW1hZ2VzDQo+IA0KPiBJIHRoaW5rIGEgc3BhY2UgaXMgbmVl
ZGVkIGF0IHRoZSBlbmQgb2YgdGhlIHN0cmluZy4gV2UgZ2V0IGludG8gc3RyaW5nIGNvbmNhdGVu
YXRpb24NCj4gZm9ybmluZyBkaWZmZXJlbnQgZWxlbWVudA0KDQpUaGFuayB5b3UgZm9yIHBvaW50
aW5nIHRoaXMgb3V0LCBJIHdpbGwgc2VuZCB2MiBwYXRjaCB3aXRoIGNvcnJlY3RlZA0KDQo+IA0K
PiB8IEVSUk9SOiBfZXhlY19jbWQ6IGV4cG9ydA0KPiBQQVRIPS9tbnQvYi95b2UvbWFzdGVyL2J1
aWxkL3RtcC93b3JrL2lteDhxbV92YXJfc29tLXlvZS1saW51eC95b2UtDQo+IGtpb3NrLWltYWdl
LzEuMC9yZWNpcGUtc3lzcm9vdC0NCj4gbmF0aXZlL3NiaW46L21udC9iL3lvZS9tYXN0ZXIvYnVp
bGQvdG1wL3dvcmsvaW14OHFtX3Zhcl9zb20teW9lLQ0KPiBsaW51eC95b2Uta2lvc2staW1hZ2Uv
MS4wL3JlY2lwZS1zeXNyb290LQ0KPiBuYXRpdmUvdXNyL3NiaW46L21udC9iL3lvZS9tYXN0ZXIv
YnVpbGQvdG1wL3dvcmsvaW14OHFtX3Zhcl9zb20teW9lLQ0KPiBsaW51eC95b2Uta2lvc2staW1h
Z2UvMS4wL3JlY2lwZS1zeXNyb290LQ0KPiBuYXRpdmUvdXNyL2JpbjovbW50L2IveW9lL21hc3Rl
ci9idWlsZC90bXAvd29yay9pbXg4cW1fdmFyX3NvbS15b2UtDQo+IGxpbnV4L3lvZS1raW9zay1p
bWFnZS8xLjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYWFyY2g2NC15b2UtDQo+IGxp
bnV4Oi9tbnQvYi95b2UvbWFzdGVyL2J1aWxkL3RtcC93b3JrL2lteDhxbV92YXJfc29tLXlvZS1s
aW51eC95b2UtDQo+IGtpb3NrLWltYWdlLzEuMC9yZWNpcGUtc3lzcm9vdC0NCj4gbmF0aXZlL2Jp
bjovbW50L2IveW9lL21hc3Rlci9idWlsZC90bXAvaG9zdHRvb2xzOiRQQVRIO2V4cG9ydA0KPiBF
MkZTUFJPR1NfRkFLRV9USU1FPTEzMDIwNDQ0MDA7Tm9uZW1rZnMuZXh0NCAtRiAtaSA4MTkyIC1F
DQo+IGhhc2hfc2VlZD1hOTc4MTRiYy1hODU4LTUwZTEtYmIxOS1kZGNmOTkwYzlkNmUNCj4gL21u
dC9iL3lvZS9tYXN0ZXIvYnVpbGQvdG1wL3dvcmsvaW14OHFtX3Zhcl9zb20teW9lLWxpbnV4L3lv
ZS1raW9zay0NCj4gaW1hZ2UvMS4wL3RtcC13aWMvcm9vdGZzX2Jvb3QuMi5leHQ0DQo+IC1MIGJv
b3QgLVUgZmM1MThmMzQtNWQ5My00MDg4LTk4YTQtMGVjMGJmZjcwMzM1IC1kDQo+IC9tbnQvYi95
b2UvbWFzdGVyL2J1aWxkL3RtcC93b3JrL2lteDhxbV92YXJfc29tLXlvZS1saW51eC95b2Uta2lv
c2stDQo+IGltYWdlLzEuMC90bXAtd2ljL2Jvb3QuMg0KPiByZXR1cm5lZCAnMTI3JyBpbnN0ZWFk
IG9mIDANCj4gfCBvdXRwdXQ6IC9iaW4vc2g6IGxpbmUgMTogTm9uZW1rZnMuZXh0NDogY29tbWFu
ZCBub3QgZm91bmQNCj4gDQo+IA0KPiBPbiBUdWUsIERlYyAxMiwgMjAyMyBhdCA1OjU24oCvQU0g
VmVua2F0YSBQeWxhIDx2ZW5rYXRhLnB5bGFAdG9zaGliYS10c2lwLmNvbT4NCj4gd3JvdGU6DQo+
ID4NCj4gPiBGcm9tOiB2ZW5rYXRhIHB5bGEgPHZlbmthdGEucHlsYUB0b3NoaWJhLXRzaXAuY29t
Pg0KPiA+DQo+ID4gRTJGU1BST0dTX0ZBS0VfVElNRTogc2V0cyBmaXhlZCB0aW1lcyBmb3IgdGhl
IGlub2RlcyBpbiB0aGUgZmlsZSBzeXN0ZW0uDQo+ID4gaGFzaF9zZWVkOiBjcmVhdGVzIHJlcHJv
ZHVjaWJsZSBkaXJlY3RvcnkgaW5kZXhlcyBpbiB0aGUgZmlsZSBzeXN0ZW0uDQo+ID4NCj4gPiBS
ZWZlcmVuY2UgY29tbWl0IGluIGUyZnNwcm9nczoNCj4gPiBlMWY3MTAwNjQzYTQ2NDU2YmUxMDdi
MzMwOThmNjAzNGIwODM1ZTZkDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiB2ZW5rYXRhIHB5bGEg
PHZlbmthdGEucHlsYUB0b3NoaWJhLXRzaXAuY29tPg0KPiA+IC0tLQ0KPiA+ICBzY3JpcHRzL2xp
Yi93aWMvcGFydGl0aW9uLnB5IHwgMTEgKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2xpYi93aWMv
cGFydGl0aW9uLnB5DQo+ID4gYi9zY3JpcHRzL2xpYi93aWMvcGFydGl0aW9uLnB5IGluZGV4IGIx
YTIzMDZkZDEuLjhlMjI3M2NhMmYgMTAwNjQ0DQo+ID4gLS0tIGEvc2NyaXB0cy9saWIvd2ljL3Bh
cnRpdGlvbi5weQ0KPiA+ICsrKyBiL3NjcmlwdHMvbGliL3dpYy9wYXJ0aXRpb24ucHkNCj4gPiBA
QCAtMjg0LDYgKzI4NCwxNyBAQCBjbGFzcyBQYXJ0aXRpb24oKToNCj4gPg0KPiA+ICAgICAgICAg
IGV4dHJhb3B0cyA9IHNlbGYubWtmc19leHRyYW9wdHMgb3IgIi1GIC1pIDgxOTIiDQo+ID4NCj4g
PiArICAgICAgICBpZiBvcy5nZXRlbnYoJ1NPVVJDRV9EQVRFX0VQT0NIJyk6DQo+ID4gKyAgICAg
ICAgICAgIHNkZV90aW1lID0gaW50KG9zLmdldGVudignU09VUkNFX0RBVEVfRVBPQ0gnKSkNCj4g
PiArICAgICAgICAgICAgcHNldWRvID0gImV4cG9ydCBFMkZTUFJPR1NfRkFLRV9USU1FPSVzOyVz
IiAlIChzZGVfdGltZSwNCj4gPiArIHBzZXVkbykNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICMg
U2V0IGhhc2hfc2VlZCB0byBnZW5lcmF0ZSBkZXRlcm1pbmlzdGljIGRpcmVjdG9yeSBpbmRleGVz
DQo+ID4gKyAgICAgICAgICAgIG5hbWVzcGFjZSA9IHV1aWQuVVVJRCgiZTc0Mjk4NzctZTdiMy00
YTY4LWE1YzktMmYyZmRmMzNkNDYwIikNCj4gPiArICAgICAgICAgICAgaWYgc2VsZi5mc3V1aWQ6
DQo+ID4gKyAgICAgICAgICAgICAgICBuYW1lc3BhY2UgPSB1dWlkLlVVSUQoc2VsZi5mc3V1aWQp
DQo+ID4gKyAgICAgICAgICAgIGhhc2hfc2VlZCA9IHN0cih1dWlkLnV1aWQ1KG5hbWVzcGFjZSwg
c3RyKHNkZV90aW1lKSkpDQo+ID4gKyAgICAgICAgICAgIGV4dHJhb3B0cyArPSAiIC1FIGhhc2hf
c2VlZD0lcyIgJSBoYXNoX3NlZWQNCj4gPiArDQo+ID4gICAgICAgICAgbGFiZWxfc3RyID0gIiIN
Cj4gPiAgICAgICAgICBpZiBzZWxmLmxhYmVsOg0KPiA+ICAgICAgICAgICAgICBsYWJlbF9zdHIg
PSAiLUwgJXMiICUgc2VsZi5sYWJlbA0KPiA+IC0tDQo+ID4gMi4yMC4xDQo+ID4NCj4gPg0KPiA+
DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE5
MjE5Mik6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8xOTIxOTINCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMDMxMjk2ODQvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJz
Y3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L3Vuc3ViDQo+ID4gW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiA+DQo=


