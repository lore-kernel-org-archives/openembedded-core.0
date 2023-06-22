Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DB9EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 14:07:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web11.12298.1687442865935177560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 07:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dJZQrPdp;
 spf=pass (domain: siemens.com, ip: 40.107.8.77, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blCjXKlpC6gP13NhvSvKKJEJ866fQvqBQ1SIWSme6ojz22D1UzvXzLqapqusNjrfxDyA2OBuk9xliZQvgbLYBVaXuQVoVz22if3veHWefqhUrEz65yn+f70iBdKAE9WZOkPZvRcspvv19Oh5R9whj6ZapPAXwyDJz0WwKrArjBEmUwpddaLClMlrp8g5NecRjkKCNJ6rPS1B0FP9BeSkZeYixvIIg5lcAXWy/X/45HXhj23It6zMxvzYwh8gDRmFgpN7fgIWlyNf6+CkEHAefAaYWzgVpkN5SI2vPSAZpKLT5Qreq7nGqYxzhEzKqEBw2/b3YfU0XbxwhN3GJDBRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB3p+SRC3IRhUT0co9HVVavK366jDyUyZhp+YAD6qxY=;
 b=dvIkXI1+WchPB1dvZUMAS2SSJNfgnDxnonQJAwB2hvWlvHL+Q5m20SiTPFuf/YXfzspntVl5p3xHBRZbBk4usk07JqYMjzXemfIChENOBT/AzrpvMN987qRPcAECFDci7L5zvU7kTwu2LehqD82KHv9GX7sUzEAanOpqNWJPmg4ccZGrteisYJ3Df+UeFE90JuA2rHb6ESsBs7BKEGW335VrIZcnwKoSkcKWBGZmM4ZFbjWMyWuqZqsNyr+WKjTHJ4/S9zaGtCDVHG6QGgSszu5i0j1uRnUxPPIEqZdtuXP4j6oiGuXWO1wBUNcX9H9YptmjPIsmzlDsXAUonqsFig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB3p+SRC3IRhUT0co9HVVavK366jDyUyZhp+YAD6qxY=;
 b=dJZQrPdpaYesz2gIfTmBBij0NW9GCcWJJZNGQR0y1Kg8Ql0hTzjalr4dM8DqVtOAHCMPhYMcQxFYWoTLHQ1c7M/QjH/N7fn1r1A158ZANiduLAti9kUWmk+5tIYdIS/rJ4OfwD/uPhmm75/6GBPadrOXt25oWrn2Gij4mQB+vRNKPj/fSdtvqAEJ1iDVqxz18/mLlGbxt0HerbUXKLcBQ46AAks/mpc1FKTOICe+cB+GQCe/N/hU0PLmv64D4czYYWbN5hk5fD7YG2HgLc339za3zIe5xZ1KeiEZLjFsEnGuX1c9cKBvqmL7BXk+BhRJ4OAJTX8OiSJnEy2dt+jP2g==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB5786.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:37d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Thu, 22 Jun
 2023 14:07:42 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 14:07:42 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v7 0/3] CVE-check handling
Thread-Topic: [OE-core][PATCH v7 0/3] CVE-check handling
Thread-Index: AQHZpNceYyjWrUcjEke23TpXEkG/yK+WxEQAgAATEoCAAAFsAIAAAPMAgAACbYA=
Date: Thu, 22 Jun 2023 14:07:41 +0000
Message-ID: <c343089e30ebe6f364567b2c1f164f7f9fb9f612.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230622065914.37448-1-andrej.valek@siemens.com>
	 <20230622144216.18783d4b@booty>
	 <66f1327de2d373002e866e0eb05f0f2e5e6bd05d.camel@siemens.com>
	 <20230622155536.505adb2d@booty>
	 <ca57036152c436519f92e8d64e3e843c330a3d54.camel@siemens.com>
In-Reply-To: <ca57036152c436519f92e8d64e3e843c330a3d54.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DB9PR10MB5786:EE_
x-ms-office365-filtering-correlation-id: 4ffbddfb-681c-4b8e-4be9-08db732a0b3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OqTDfjl15/dZtJLUdFKvCVPjcNu2ZmcWOQbjHyuAtjV16y6kbScpaG+D2R6hSXerOaE5B2oGrY3AIGtmI5GICp+KN0wQLXt/CJlWsYPf+giKTegI6UAMPN/Ud2Lw7IPQxCGjGE/iWPTxMsEZkS6rTXZ2zHXFIV+hItFgHYEzaO4VBrz8KIuyw1YOuNKkBw0/NVbBDjMuUeM/0HK7YqqAuexw9l9hWoDjXYunyku8ygjIaoviFQRl2964SyIxv0j6cwVesRiKIjOtnzyIYomT1mrqbvm/eEMIjGfFrxtYZVAoGtpPvbKE8lOM1a66DSWrJwkXMbSnqGhnb5Rpzxj7+VkX9qt+t9bK5dMJUK6iATKsCCChIhylEF7Gug0//uyg41YyLtr19C+1klIRbs0qGLkHBL5xJOVq9s7r+ics52lS9n4r3eyoWHjDzIthzyfHhLuLKzMMHUQbTU/PIi94uLVNs1qKgAyRhB6vxSSbdT7XI0ussCiy/v37QyJZrUrCQjpUGbB2IwMvminqbaDpRox+7110xSlgGBsTG4RNM7z7e+wP8AvkYURoSEsowSmNjG9v288vSEaLS6vScZDAWyDLLENmv4KiKEay6w2iaWI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(2906002)(966005)(2616005)(6486002)(86362001)(71200400001)(122000001)(38070700005)(26005)(186003)(6512007)(6506007)(8936002)(66446008)(64756008)(66556008)(66476007)(8676002)(76116006)(36756003)(66946007)(5660300002)(91956017)(4326008)(316002)(38100700002)(82960400001)(6916009)(83380400001)(55236004)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SGE1alhnd2RTS0RHL0trcWNIbXJLeldmMzVkTVBSVlB6Z0xybXVmOTJBeE4z?=
 =?utf-8?B?UDM0eE1VNWNmU2NHRFA5ODY3NW9jVXliV1lkbnRTVGFxRjh4dDZ6WU1WVXp2?=
 =?utf-8?B?Wi9UZG1GRHFDSDc5N3N0TjAyQTZpOW9iTGdLMHpPOEo3OEdzeVRFc1QvQzlv?=
 =?utf-8?B?dXRpR1ppV2hTR3V6cXBCOEFRVTNGdXpPeUtFWkFZUlRTeDlBbUphVFdUVkVQ?=
 =?utf-8?B?emw4Rk1zYXJld3NPSjdqTHJtZzVCTzV5UFRPTGU5T2dQek85SENYUUQ3UVhI?=
 =?utf-8?B?R0EvV0pHUHpXMGhycUYrK3kyVHdoWDUxblBCTFdJcDVtOHQwUnJmYzdpV3gv?=
 =?utf-8?B?UjNDSFIrOVlxWVZLbURoeWEzd09CaDdKK1gwaHBqeWQ1aVJKNWFTU1NBMUdS?=
 =?utf-8?B?VGt6WnJlUko2MHNvaHJzdDdrckZTQmxLTStBR1IrZ1IyckVWNnRGejQxMmUz?=
 =?utf-8?B?WXp4WjlHckdMeUdnWndhcnNyQWJKMHJyemZRQmdET2R6NHhSTlhHeU1Oa3dl?=
 =?utf-8?B?WE1XYU9uK0wxVUNzZitLQnRPQ2YxYWUvSTJhSi93Sy94aTMxckt6TDlVR25C?=
 =?utf-8?B?VDEzSnhGb3h2S2NkU3o4L3hPS3hDK3JId080cGRRZjRaUGdrTUUzaERHc1Fw?=
 =?utf-8?B?ZHk5dlNiUklNQ21ERWZlOUQwTStPWXh3RUhJQlk3ajJ5K0xUNlA3cEg3Umg5?=
 =?utf-8?B?RGFnME9DTEdvd2pkUUlicHUzWmo5Nlo0Z3BGUVZCSENDZUlEZUVoaW8vSFlu?=
 =?utf-8?B?SWlSNVEwcGZrejd1TGdiL2ErZlpvR1JZcThpdnE5dUxiQUZHY0VGQ05Qb1F6?=
 =?utf-8?B?UitnaUIvaHp2UllDQVF6WThLTnVmbVZpR2J2R3ZLeFZXRGJRbkU4YmNFOGZj?=
 =?utf-8?B?R0NEUld3bXlGRkRITS92WXVxQndwL051K2dTMkxDOS9vNm5nWkYwbFZHb0p4?=
 =?utf-8?B?ME5hUmhOVXc2djFhVmhnSkpwMDV0Rno3cUp2K1hkN09tNDZrOGpGUFV4OVBH?=
 =?utf-8?B?dU4zZmN6QmNWYlNOSWVWTG5EV0NNeEdIeWRMVWtxYlgyYVRUUUxuY1RjeExH?=
 =?utf-8?B?MWpYT3pEb3M0NWVCMi9HeHFlNzFDTG9hM0FjNjlqbmpiTDNzMTdtYmJBeHhF?=
 =?utf-8?B?ZUpRWFNCRDdHV1hyYUdhSDVITGpvbTlUZkE2NXhEZnE1ejBWY2hQT1NvT1pT?=
 =?utf-8?B?U1AzUFFTRm80OWd4eWdqZjFmNnZSZ3lWUndEYTBOdTNnU0pHaFhmdFk4cnJW?=
 =?utf-8?B?TGxFUjFHelZoR0tQcWt0eDI4Y0VuRGY1Ni9kWE5kVEVhNVhXbEdUaG9JK2Uy?=
 =?utf-8?B?TjFaa0dhaGpuTTRpTnd5Mm9PbUtpRHMvTEpSNE5sbWJ6amFveGRZMlV2V0xT?=
 =?utf-8?B?RkVieU5FZmZKbEJWSjRESFRIVHVsTmlpU2xzbUNCT1c3dkdRaWVBTTE0VXND?=
 =?utf-8?B?dFZyQWowSTdtYmY5M0Q2RE05ZUFQTXNtYWJwUFVnVTBTVmRLZWxUU1VxK2dx?=
 =?utf-8?B?YUN5K2JtSGpWc3JlMzlhQzZWNnhZTitZQ2EyL1dOUkJ0eVZFQmp0ejZSWE80?=
 =?utf-8?B?Uy9OcUJ4a2dnMUV6cEdkQVd0WjhPd011MTZJV3lMV2RmZUJqc2dDL1cxQzJD?=
 =?utf-8?B?TWhIMnRZeDRhVFd5OTBmZGNnSVpXRjFzNXYyRmp4RXVaZE1KNy9qcmlZenly?=
 =?utf-8?B?NnpWNEswdmJIQ1hXSGNkZHpTWm4zeEpYVnhiYlVadHdSTWN0VlNLUmVHczRr?=
 =?utf-8?B?Ti9HS0NrblZqMWlGWmhqK013OXRwSUVoNU9NbE9HaE9DRXU3b3ZWc0JJNHN5?=
 =?utf-8?B?ZUlSbnBHSmJYSVU4QWZJV0pBTER2Y2FVdTc5cGxoUDNvdnk2QUJMKzU1MUwr?=
 =?utf-8?B?U256Um5uM1FGTjZ1QzJoRW9ka3lRcEMwZkZCeUNaZWFSVUlXaEY1VUpreE9J?=
 =?utf-8?B?dlZkNDlzSndoa2JJSGd2YjI4d3V2QzdZcmJFV2hVeGlLUEUzZVRmNmpGcUhh?=
 =?utf-8?B?R1dSaHprR2FaYk9iQWlYKzZNa2FKSTdhazNtTkpwZEtNY1ZqR1lERGhnS2hn?=
 =?utf-8?B?NEJ5bnp6QXJGUDI0ZEVLWE5wUnc4WlliU3UvNHE2dUFWWlJ4Zlg2V0FxdW02?=
 =?utf-8?B?QUNkaFgxaTNlalpVNG56NENibkFLTWZlRmVLTlYvbFo5Ym96aFZ4dlljR1FF?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D574CED5A1E0FB48AC8A9F640ECC29B0@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffbddfb-681c-4b8e-4be9-08db732a0b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 14:07:41.7428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52R3SRNWioMKJTZ42+szn8SDi50zYcNftTUuj/ujlq+l4+7fTuYO5hNNl7qZFTe0S5a6nNgMH44sWvirCPateACCf+3+yZtJzyDMGNq30MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5786
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 14:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183246

T0ssDQoNCk5vdyBJIGtub3cgd2hhdCdzIHRoZSBwcm9ibGVtLiBTUERYIGFyZSBiZWluZyBjcmVh
dGVkIHdpdGhvdXQgaW5oZXJpdGluZyB0aGUNCmN2ZS1jaGVjayBjbGFzcy4NCg0KUmVnYXJkcywN
CkFuZHJlag0KDQpPbiBUaHUsIDIwMjMtMDYtMjIgYXQgMTU6NTkgKzAyMDAsIFZhbGVrIEFuZHJl
aiB3cm90ZToNCj4gSGVsbG8gTHVjYSwNCj4gDQo+IEkgd2FudGVkIHRvIGNoZWNrIHRoZSBsb2dz
LCBidXQgaXQgcmVxdWlyZXMgYSBsb2dpbi9wYXNzd29yZC4gV291bGQgaXQgYmUNCj4gcG9zc2li
bGUgdG8gc2VuZCBhIGxpbmsgd2hlcmUgaXMgbm90IHJlcXVpcmVkPyBNYXliZSBoZXJlDQo+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvwqA/DQo+IA0KPiBS
ZWdhcmRzLA0KPiBBbmRyZWoNCj4gDQo+IE9uIFRodSwgMjAyMy0wNi0yMiBhdCAxNTo1NSArMDIw
MCwgTHVjYSBDZXJlc29saSB3cm90ZToNCj4gPiBIZWxsbyBBbmRyZWosDQo+ID4gDQo+ID4gT24g
VGh1LCAyMiBKdW4gMjAyMyAxMzo1MDozMiArMDAwMA0KPiA+ICJBbmRyZWogVmFsZWsgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmciDQo+ID4gPGFuZHJlai52YWxlaz1zaWVtZW5zLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiANCj4gPiA+IEhlbGxvIEx1Y2EsDQo+ID4g
PiANCj4gPiA+IEhvdyBjYW4gSSByZXByb2R1Y2UgaXQ/IEkndmUgZXhlY3V0ZWQgImJpdGJha2Ug
cWVtdSAtYyBjcmVhdGVfc3BkeCIgYnV0IGl0DQo+ID4gPiBkaWRuJ3QgcHJpbnQgYW55IHdhcm5p
bmcuIFNob3VsZCBJIGJ1aWxkIGFuIGltYWdlPw0KPiA+IA0KPiA+IEkgZG9uJ3Qga25vdyBob3cg
dG8gcmVwcm9kdWNlIF9leGFjdGx5XyB0aGUgYnVpbGQgZW52aXJvbm1lbnQgb2YgdGhlDQo+ID4g
YXV0b2J1aWxkZXJzLCBob3dldmVyIHRoZSBsb2dzIGhhdmUgc29tZSBnb29kIGhpbnRzIChjbGlj
ayB0aGUgInN0ZGlvIg0KPiA+IGxpbmtzIGluIHRoZSBwYWdlIGF0IHRoZSBVUkwgSSBwcm92aWRl
ZCkuIEUuZy4gZm9yIHRoZSBxZW11YXJtNjQNCj4gPiBidWlsZGVyIGl0IHNheXM6DQo+ID4gDQo+
ID4gUnVubmluZyAnLiAuL29lLWluaXQtYnVpbGQtZW52OyBiaXRiYWtlIGNvcmUtaW1hZ2Utc2F0
byBjb3JlLWltYWdlLXNhdG8tc2RrDQo+ID4gY29yZS1pbWFnZS1taW5pbWFsIGNvcmUtaW1hZ2Ut
bWluaW1hbC1kZXYgY29yZS1pbWFnZS1zYXRvOmRvX3BvcHVsYXRlX3NkayAtDQo+ID4gaycNCj4g
PiAuLi4NCj4gPiBNQUNISU5FID0gInFlbXVhcm02NCINCj4gPiBESVNUUk8gPSAicG9reSINCj4g
PiAuLi5hbmQgbW9yZSBzZXR0aW5ncyB5b3UgbWlnaHQgd2FudCB0byBwdXQgaW4geW91ciBsb2Nh
bC5jb25mLi4uDQo+ID4gDQo+ID4gU28geW91IG1heSB0cnkgdGhhdC4NCj4gPiANCj4gPiBMdWNh
DQo+ID4gDQo+IA0KDQo=

