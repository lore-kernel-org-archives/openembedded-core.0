Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2F0C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 01:57:03 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.113])
 by mx.groups.io with SMTP id smtpd.web11.4989.1707962222365477796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 17:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=X0y4npRr;
 spf=pass (domain: aspeedtech.com, ip: 40.107.117.113, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G74l1UlKaOgnzY8ivRzsybwVciovH0us6OUkIBUd5bcgyHtw7qJ1ISgjJt8SRz6G9WHZAjSyN4qlB7lJp2FnC83CfxE/8mtq05KVoo95UHvQXGTKoWWtiW9VUCi21q7U8tDwwjUhG57/FyPf0dGGAZxQNKTr/A1Ayb09ttbKOdzmVusmoLfIBsZiRmbaemVyvx8J/X3xielMy4QH0C8q9SOstiGvg1u03k6Pz51ht8bf3HhuX4rptUpxzbhnpFa9PpKA2ZxB5op8XPCnhgswEDNLJX8P/GXz2pq5nMcX1fJ9FHw/mwoqij02t7gB2zHOPY85hpG7KpizJQ4uyLtAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDSCEvppTlYlID8dHt/ZwDmML0u/awM8it2WYvqz+V4=;
 b=EHmy/Vqfx+EX5vW24s4XY/Y6xxCrzUFKEtYZ0+u4hn2GoB86l+ZBUdI/txyk1mGHmo5mpp6Kpm1InKOaJBGMJkuaNyyXtcWUw4m0YZ9HzyBfBOwLw5PJ8RYr1zsu4tJ9xQh9Sy+RfG+9kSeleLz41pgyjUTPKeFF4g4HVmrBIOgtEY4ddh/cdlSjF5jgYdXxCZ3IDrzpM0WP4uMnTyV6gsrKV7Q4WQb/XF5ZcNzLztcwdRG9auVzNfbMVezsiDUivLjQ5c1Jv1/lUTn3Y+xCkl3LwtF6Pnc/qpjPvB342pzD9zw+UmObAMKxENdR0ryYlcKjvbzHyOZF7kvB/aM1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDSCEvppTlYlID8dHt/ZwDmML0u/awM8it2WYvqz+V4=;
 b=X0y4npRr5dOBocsWqOjH6RuaRxnRTrmgMI/oHBaGagVa/oTqAjw1CcQbG+oys8vTOmYOllaMjJzkS28V59u0AYyeKcyYCRcZoSuLwbiBEIuODK8cNaQPhIGFHRq3OCsBlIIYk+H0NrtfMfJ4DGEvH4l2rVEgdi6/0DcsKCGgPw9p43ke288Zc1SMLbVSK3tKNFUAGG+Z1W7ph2//k8CReydl+/m5DVuUT6RixzIZf81HWyiHVrOlpOHwo6AJiyRIxc4+gHqa4u0gkHvDG/MprYkWEBqa94d+UmWJp11+gudvvXQaQJHi88rRoGYAEXcKR6d1Pbc4A61e97FO1xoFJQ==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TYZPR06MB3933.apcprd06.prod.outlook.com (2603:1096:400:29::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.26; Thu, 15 Feb 2024 01:56:55 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::79a8:927d:1e03:51d0]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::79a8:927d:1e03:51d0%7]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 01:56:55 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Thread-Topic: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Thread-Index: AQHaSD6d4zRiFb9ZQkqtV4y7H/Si3rDcEewAgC3VyYCAAOwo4A==
Date: Thu, 15 Feb 2024 01:56:55 +0000
Message-ID: 
 <SI2PR06MB5041D8083A7AACA999D2E005FC4D2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240115075416.393025-1-jamin_lin@aspeedtech.com>
	 <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
 <dff1bbe651fa6733fb6034c9505aa200e7377df8.camel@siemens.com>
In-Reply-To: <dff1bbe651fa6733fb6034c9505aa200e7377df8.camel@siemens.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TYZPR06MB3933:EE_
x-ms-office365-filtering-correlation-id: ff590cd6-d454-48bd-4849-08dc2dc96321
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Pizj9TEM5JIJrD1LWHq1s1G/KUKHK1+CRRssCh/7J4PgZMk2lo83lHxoK6u7BbTTyh1lxvRCutXClW5UyMMCxmyK/e6BoHpwcKoIljllytoSDGRGtsiAGx5D3XIJt1G9JvPGH+zfLNLQdLmITNq0GKWReVXpePAphzwBot2lNrvTO7tCVy8KxPIJo2+T6FKFgtx7irLyBksgqL+ox+tXpcU4/jYzrQIlSkTSXUJ0i3ACU25USfSker+2BwMz3rVap5lXB3UFuStOo25wtwVsSnlzLHsTjMWu1WAxTlgghLrBNQ2yyB8P7IRPFJ1dfB1YNH+hizlwJGIy0YwA17gOrGecd9DODtq2myuMfJRBdvocD6jh7CTyKIEwfqv16ggSak/nDiQVd8p1jhOrQueV7bBTsjUmeE/zY1EFIenkrHrFGyGPaqRPMAOX3IeUSKiMUnlJIC/ADHPdSvlh4Mw4KuNkQvER5sGeoAti39IPXMO6dw6jRCAEvzGM1ezIM0baDtnmnqOT/WKVWG5ai92+Ou2zdO1YpbnljTO6IQagOvgPe+ETC0KvlYKDyvJQL8G6vsiQ+YN32YQpJa8jwBOjimNh+VrxZsQ66wVZSjQoQuo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39830400003)(376002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(55016003)(71200400001)(966005)(478600001)(9686003)(41300700001)(52536014)(8676002)(8936002)(2906002)(5660300002)(7696005)(38070700009)(64756008)(6506007)(53546011)(66476007)(66556008)(110136005)(66946007)(76116006)(66446008)(316002)(83380400001)(86362001)(15974865002)(122000001)(38100700002)(33656002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dE1FK3lxZjh5S1dER01YRndQQkpONVZzMjFBa09LVUFrUE9JRkZXUnEyWVIv?=
 =?utf-8?B?OEdxNVFiY09LQnlFWjF6WitrU1l5RDI0VlllL1V6N3dxb3pMR3c3SGhmY05E?=
 =?utf-8?B?MEt5UGdQMm11R2JsMHB0RGUvVTZrL3gvM1VhQTd1ODR6RDFDUXBNOTQwNytK?=
 =?utf-8?B?dmpWRlNQME1zL2o0bFN3MUFpaFF5L0FrckNZWVhXem9JcFJWLzIzbjdNS1BS?=
 =?utf-8?B?TVZTWTA3QjlyYnJLWjZrcTJQTmhTM05tR0ViVEFLVWQwV2U1dkorSll0cTZ5?=
 =?utf-8?B?UU4rdE43S3orS0tpcWRScUZsUEZpbG9YbVBuNjlFVTJCMlg5VmJqbkFrOGMr?=
 =?utf-8?B?U1VHVlJsWHFydHBYajQ4QTBnVmlDYnlmQXVnMDZldS82dzIzSGNNYWpWaitW?=
 =?utf-8?B?eFlSS0JYZmFIY1JQR1pMRlVQU3VWM2RIS0F1akFEL1ZYb3dBUXF3dm9LbmYv?=
 =?utf-8?B?REFmdjlvWjl4RjJ4TUFYWGlacHR2WHRNc29qNEVyejBPRUx0ZnRyVXFMOUM1?=
 =?utf-8?B?TkNRUkdFSWs0WUZnUEdlV0xIWEtkOCtqR0JvazNSWWtxRVhyR2RwR3VLWkp2?=
 =?utf-8?B?T1dXTE9qbGloNFI2TDhmNUdwV0V1RGlpem4wTnhEWG1OcENUd3V3bDlSZ2Zw?=
 =?utf-8?B?ZTcwSXBDbW1Dc1VSd1BTZkhZVnNVcmRHUVNoUEtTaGZDd0FBQzdoOHpHZTJw?=
 =?utf-8?B?bkZ6YlBYejRwbnZaUVJlUVA4bjltVlg2KzVlOXB2VitpRkNWVHc1UWNHSVRJ?=
 =?utf-8?B?V1MwajA5Sk5mSGxwYjAyQktTRnRrek1XeCtSdkFnZWxHUkYveW5IWXM1MUR5?=
 =?utf-8?B?ZDVkcnpveW1oUWhDc1N1TWJRd0hPenZnSmJUcXByWlF3YytrU1FDaW83UmRZ?=
 =?utf-8?B?b0VJWGlhMEZXTWI5MHBpQzNWK0VqVm5VY3dGTUR2SDczUTdhazFIT2tmdXhq?=
 =?utf-8?B?TDc4UWFrSkoxTU9xb3ZjSDJjWlNwSm5oRDdSODZQMTIvRUlNTDJxM1k3V2hk?=
 =?utf-8?B?d2F3TStzNHVLcGwybUZJYnh4cld2WGhFME1Pb0cvTU8rcVZVMzRudDFnWUdz?=
 =?utf-8?B?SHc2a3VsV3J5SHd6eDllNU1DOW5xR3FkVkFPK3BuQmcrc2tJeTFEcmY1UnEw?=
 =?utf-8?B?MFZ1L3dVTERYZlBLWFh5RFB6SGsyeHVvVW9PcFdnWnhTWnRtZkI4b0FNZnBV?=
 =?utf-8?B?TVRCUVJFVUFPNTZGemJsTGFuRWthL1dxTUY1bUF4dVNZUmZDLzVLeDBZdG5L?=
 =?utf-8?B?dHAyaWpMVTRWOEFvd1kxc2V0N2tMNWNFd29UOGF6bzJYZnhUakE3cGtnL0pi?=
 =?utf-8?B?YzdOVkw5OGpGeU1HYmNJeFczQ29ZbDRqMjFTRnNwVUhMRVdDU2ZiYzhEYm1T?=
 =?utf-8?B?aUl3OFNnc2M4OUVXajhBNDFvaXQ2TlhJY2ZoemJ0QndRbmFtbTFEQWRLSE1i?=
 =?utf-8?B?VS9hRlRVS2xDWGplM0lXTFhJK2FJVnRoWElJSmF3aC80Sm1Dd0ZsQU14Z3dz?=
 =?utf-8?B?Uk50eGVVUmFKblJJWmREUDd3V0RNQS8xZ2hhT0kzRnZxVW9XMVEzWHkxTnNp?=
 =?utf-8?B?dzlKQzRvQk5tckc0a1pZVG14SUpENTRLNkFURHpuMk9qaFA1Yk9lSzYwZzJH?=
 =?utf-8?B?ekZnY05WNnMvVnpTYnNTcndaaXd1R3FNSGdsT0loWnZmcmhxQWxZQllrMWRM?=
 =?utf-8?B?eUNuTkh3N2c4SEdQZzNpUU1ncE5WU0FCQWVzdmYvSzlJdmUrZFAxSXVIVU9T?=
 =?utf-8?B?SGRyYTZMb0dLNlJWRDFqNVNIZGxCejJPT0tVcE9JcFo5ZDRPdXladmhzWGpV?=
 =?utf-8?B?UDNHcUtRRWxXdytYd3pJanNBM2ZMQjUxNHJSQTY5d1V0RmhoSExNMUpzcEN4?=
 =?utf-8?B?emVLY1k1UFRpQkxVK0t5enZLSXBHWlNaSjdGKzl1bHlhVnJwYktHNUZ0M0dX?=
 =?utf-8?B?NEw2c25NMFJCSE4zdkVQQks2VkMvdDVGNUFtZDZON0pXR0hIQm5UQ3ZrdjRM?=
 =?utf-8?B?Z1pLK1FiODhlSkovR29xcFhBcWVoMmlaUTBJZ0Z1TVA4bGZ3ZDdTQ0ZtM2hW?=
 =?utf-8?B?aTVOTWRTQnN5dFVpNVdScTNIcDVUN2VjMUlLRC9CYllhRHNzSzBaenZEdmhs?=
 =?utf-8?Q?IDJlxeCXRB1eG+q4NxpZFTDVy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff590cd6-d454-48bd-4849-08dc2dc96321
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 01:56:55.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pRMIRKsZ2T4mvNCKMUCt4OYC5XONYHSBSjf0u6QSObNFMVqOFGrLQryCfP23bE1HJa3MXpGV+LfPEYKBrmPpo4SIgWLLPCR874iJwfIEQJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 01:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195502

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdmVyZGxpbiwgQWxleGFuZGVy
IDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVi
cnVhcnkgMTQsIDIwMjQgNzo1OCBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZzsgSmFtaW4gTGluDQo+IDxqYW1pbl9saW5AYXNwZWVkdGVjaC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSB1Ym9vdC1zaWduOiBzdXBwb3J0IHRvIGxv
YWQgb3B0ZWUtb3MgYW5kIFRGQQ0KPiBpbWFnZXMNCj4gDQo+IEhlbGxvIEphbWluLA0KPiANCj4g
T24gVHVlLCAyMDI0LTAxLTE2IGF0IDA4OjU0ICswMTAwLCBBbGV4YW5kZXIgU3ZlcmRsaW4gd3Jv
dGU6DQo+ID4gT24gTW9uLCAyMDI0LTAxLTE1IGF0IDE1OjU0ICswODAwLCBKYW1pbiBMaW4gdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4gPiBDdXJyZW50bHksIHUtYm9v
dCBGSVQgaW1hZ2Ugb25seSBzdXBwb3J0IHRvIGxvYWQgdS1ib290IGltYWdlLg0KPiA+ID4gVG8g
c3VwcG9ydCBvcHRlZS1vcyBhbmQgdHJ1c3RlZC1maXJtd2FyZS1hLCB1cGRhdGUgSVRTIGZpbGUN
Cj4gPiA+IGdlbmVyYXRpb24gc2NyaXB0cywgc28gdXNlcnMgYXJlIGFibGUgdG8gdXNlIHUtYm9v
dCBGSVQgaW1hZ2UgdG8NCj4gPiA+IGxvYWQgdS1ib290LCBvcHRlZS1vcyBhbmQgdHJldXN0cmVk
LWZpcm13YXJlLWEgaW1hZ2VzDQo+ID4gPg0KPiA+ID4gQWRkIGEgdmFyaWFibGUgIlVCT09UX0ZJ
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9BIiB0byBlbmFibGUNCj4gPiA+IHRydXN0ZWQtZmlybXdh
cmUtYSBpbWFnZSBhbmQgaXQgaXMgZGlzYWJsZSBieSBkZWZhdWx0Lg0KPiA+ID4NCj4gPiA+IEFk
ZCBhIHZhcmlhYmxlICJVQk9PVF9GSVRfT1BURUVfT1MiIHRvIGVuYWJsZSBvcHRlZS1vcyBpbWFn
ZSBhbmQgaXQNCj4gPiA+IGlzIGRpc2FibGUgYnkgZGVmYXVsdC4NCj4gPg0KPiA+IEhhdmUgeW91
IGNvbnNpZGVyZWQgbGV2ZXJhZ2luZyB0aGUgZXhpc3RpbmcgYmlubWFuIGluZnJhc3RydWN0dXJl
IGluDQo+ID4gdGhlIHJlY2VudCBVLUJvb3QgZm9yIFRGLUEgYW5kIE9QVEVFPw0KPiANCj4gQlRX
LCB0aGVyZSBoYXMgYmVlbiBhIHJlY2VudCBGT1NERU0gdGFsayBvbiAiU3RhbmRhcmRpemluZyB0
aGUgZ2VuZXJhdGlvbg0KPiBhbmQgc2lnbmluZyBvZiBib290IGltYWdlcyI6DQo+IA0KVGhhbmtz
IGZvciBub3RpZmljYXRpb24uDQpKYW1pbg0KPiBodHRwczovL2Zvc2RlbS5vcmcvMjAyNC9zY2hl
ZHVsZS9ldmVudC9mb3NkZW0tMjAyNC0zMDY3LXN0YW5kYXJkaXppbmctdGhlDQo+IC1nZW5lcmF0
aW9uLWFuZC1zaWduaW5nLW9mLWJvb3QtaW1hZ2VzLw0KPiANCj4gPiBXaGljaCBwbGF0Zm9ybSBh
cmUgeW91IHRlc3Rpbmcgb24/DQo+ID4NCj4gPiBUaGVyZSBpcyBUSSBLMyBkb2N1bWVudGF0aW9u
IGFscmVhZHkgWzFdLCBidXQgbWFueSBwYXJ0cyBvZiB0aGUgbmV3DQo+ID4gaW5mcmFzdHJ1Y3R1
cmUgYXJlIG5vdCBUSSBzcGVjaWZpYyBhcyBJIHVuZGVyc3RhbmQuLi4NCj4gPg0KPiA+ID4gVGhl
IElUUyBmaWxlIGNyZWF0aW9uIGxvb3MgbGlrZSBhcyBmb2xsb3dpbmcuDQo+ID4NCj4gPiBbXQ0K
PiA+DQo+ID4gWzFdIExpbms6DQo+ID4gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1i
b290Ly0vYmxvYi9tYXN0ZXIvZG9jL2JvYXJkL3RpL2szLnJzdA0KPiA+ID9yZWZfdHlwZT1oZWFk
cyZwbGFpbj0xDQo+IA0KPiAtLQ0KPiBBbGV4YW5kZXIgU3ZlcmRsaW4NCj4gU2llbWVucyBBRw0K
PiB3d3cuc2llbWVucy5jb20NCg==

