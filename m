Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D94C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:36:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web11.24702.1683286612735537490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bM+6EU1q;
 spf=pass (domain: siemens.com, ip: 40.107.22.50, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DothFwNR/yo5dpxG4IcXijT18T5emAJ7EBLu5Zz+01C3i0VH1qpdDrWpdBsowIefKkL0pdWG8IdNiaGhCwYpneopDXri4Sq6l4GViiPoEGRYLw7SP+xrxPuzneztyQSy77c2LRgiuPApLVkUPiuePQG4/hk5DaXT8OqJPS2Wme9qAqD59HyJSO0Sj7xVOkewFGXWW76Zn3h+341bGhWbFjlFyL9UiNCJtoSHeDqh6n8RkIPek+2etHhxXVSlUaU/gwbBGnlVu7nl8vh1IneUAckByIdiUkCiSp9WBZYePJHiLOlzzUxjZqhVudXYBsxcMykb124Fn5E5E726H9xPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w60VeNto0r8UMw4OVmEp4BgBH7qA7Q9ZsilXy8jIJmQ=;
 b=LNenj/dtS3z4A2tBghEd60qLCD2V4p7hQgs3fsDC9Vrq9xGqNPpbT68ke9CJMsSTexr09CT4UmPWvDSV84x9H0l2kCWv+dQfpy4T6HLLwdkikBQgQiwDLZcxHA6IxwKqcltBl1Tcz2oHwBj6+iii6MnZ7YiN3lmKDC2hCTuGfH0KF7Xu81NKDb7fblFl1RzRNRAyPeesIsVW97Bmm4WKVJU7BgCVU31V4kpWVlIyVqsTUvt1BrA70A/aNdZXVFQ1Qh57WtkHI3hO+u29f3NTekoFeTCzR+OgSaLwRwz47egUpdk2tlCsS49IBAAArxnKhbis2bMgdX64FLNbU+0ukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w60VeNto0r8UMw4OVmEp4BgBH7qA7Q9ZsilXy8jIJmQ=;
 b=bM+6EU1q9InZzYTi3wbldegG4EsMtrjLdiDnIUvmbrk2SyrhywbGDaP4YrnmmlUJtAKVREXSQPi0Tiowmzv2fAVeYNkXaDn2xTWhqlDG2f6xlJ6Gfiz6H3e/Cb7OXbnV64JpSBghFmRgFKUWqZKEgBdb6fcgjlyilUHj3OSjhMyzYX8sAkGvlIe9HSyWrC77syWtBX3P3v4FajAN6Dof1rtzLGsD3xQyUWck2+Fp3GZvNcczVKoYER+9UPlXp0DUK9TZQ/1HpRsClGxywpoe8hs0gl60JyRzlSi7ojqLubutbc9BI7ao0z50HpwwS5qoLurmpU0aPf4mL1S0Ezs52g==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DU0PR10MB5654.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:318::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 11:36:50 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a%6]) with mapi id 15.20.6363.025; Fri, 5 May 2023
 11:36:50 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Thread-Topic: [OE-core][PATCH] cve-check: add option to add additional patched
 CVEs
Thread-Index: AQHZf0NTbOPwBWWKQky9POHuG2egc69Li4uAgAABsIA=
Date: Fri, 5 May 2023 11:36:50 +0000
Message-ID: <ac80d7e3b3eb739b86951ceeefe8b337b28144a8.camel@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
In-Reply-To: 
 <6123792e2eee7767b4e6a377c15bdcc6ba266125.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DU0PR10MB5654:EE_
x-ms-office365-filtering-correlation-id: fb3e265d-28ec-45b8-a818-08db4d5d0447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z9MDSQD6B6XYRPcxtoUJ4SaxLUkjPYZ+lHToFxJNnQKFQ4FxHYhjf71+MCTkPWAZs7byazkw/k9u/ZnCa1lfjsNicgbl51mKm9rclEfIYGILuxzN1dHkzQMLZE0iZBjDb/70RyNtF7+TBDZqL7eaqz+tpvR4m7fIVMFYkC9IhjRPd7qu/UFX6cILsav2x0DrF+1kC1jW20twToRy9hGFe1OWSj2hYiTbwY6N1nhcgdlEL/xXlnMTzsGOAtAhx35NdZTwWkndtPnDYZflMF8CjFklXWHvu8jSUWx0P7JjPlxRogSVKfTuuOweLy3/F+7rVUEBdhqIapyb9MHbzIk84iDzRRxEXnwFlUrRwTtKvQWFOY5LWze6fnmTUUaP85SLwMBe4u+xDLwfU/ueAQ9aT3cxO3xYSWenaoGtA2+VLvgrL2RXr2QgXz7/Vq0D9PPXRyaof6f2oSth//sGC5b9QWlceM8RpVwB6uy1CxMum6e6Wmtc1agNq9btbg/0jL8p8rMzq+AXIF8h8J2TKt9ry2JBXvc0+0YW7jdIzj9YSv/9jxhkTRBkUkn/cK/PzBRj4YeJLOx661oDoofV/Zg+/6zmh4/OHI2MaiDN+/wTaZzuAUJEy/DwF1hoPMfUNryx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(76116006)(66446008)(64756008)(66946007)(66556008)(66476007)(6486002)(478600001)(91956017)(316002)(110136005)(86362001)(36756003)(71200400001)(83380400001)(2616005)(26005)(6512007)(6506007)(8936002)(5660300002)(8676002)(2906002)(41300700001)(38070700005)(186003)(122000001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b28rcGM5RitQMHg1ejdXYU83MWd5Q1VXQllEZFBaOVZ4SENROE5ySTQvWXNB?=
 =?utf-8?B?RzZCemtVMGNnNk5OMEUwcm0zSGtmWFF6amhBU0FDZXlGVEdVaHE3cDhTSHBn?=
 =?utf-8?B?SFVWb0dTbU1IbWVTclV2cUNIcDBIRVNod01rVEFta0hucW43SzB0V1RwQWV6?=
 =?utf-8?B?MmNtcG9HQTVYUWFwUDR1bHYvK3hUSGU0MmZFb01nZjhoOE9nMWphVlROS25q?=
 =?utf-8?B?Y1VuMmZLVTBQNFBkd3cvMEZ0WDVXZGQ2enQ4YUttaFlOREVuTmJmYmRPYnpM?=
 =?utf-8?B?VTR3eER2Tk9raXFCYUFEanJrdEZZY2lObFh0K1l4TkhTdFZXN3dpUHhzWjdM?=
 =?utf-8?B?bGtZRkdFY0FtS1lWajdNcHphT3BDM3VrK2hBaFp1T3h3Mk5wcThlUUNXSUt1?=
 =?utf-8?B?WFhJNTBtQU1sM2RvNXRsZ2dRWTFqT011OFIxRDVIREp4Ryt3Um1JRGN2QkFT?=
 =?utf-8?B?V3VUWWptOVNHcUt5cUtqTkN6U1FSZXp6Q00vTlNWanlMTE41S2dZSkNSUjdx?=
 =?utf-8?B?blg3Q0k3VEJtLzh3VUFoVzlGUWZsZ1kydk8rTnpHclFzK05VQUJFNW5xeURl?=
 =?utf-8?B?dGNYaWlwZVVHcjBwQnFqblEvSDU4YzJwZWZYN09PeTE4aVZ5L05LT0FUMUMy?=
 =?utf-8?B?bC9peFVvUWxsWXR0alFPejBtR3JRS0d5cTZCRHdaRzgzclhmN3BzbElodW1G?=
 =?utf-8?B?azI5YUJydHdSOWNCYTZjcmE4VUFtclpHU25wY0EvUTcxSWJ4U0hQMk8yYTJj?=
 =?utf-8?B?Y1JFakVvU0liNlFSM0xIcitjUG9KdFNWOXJ0SzRUYk92MjFtVU9Td08vR205?=
 =?utf-8?B?T2QxSnRwVGp5djRTZmt0bTZKSzVkUm16VTFhZHR6VzgvTHBRdWk0UStWVDFa?=
 =?utf-8?B?aWFVOTBLcGpJTjU5MTBRa2lpRzRjMGc0SDhZVVllM2xYVk92bkRIUjlJaUgy?=
 =?utf-8?B?aUxwUkZIMXkybVNZdFNmOWxocnhveFpadldmSHZTektXREk1NjdXMG1UQ2pN?=
 =?utf-8?B?dm43MGk1TkdyNlFFMk1USnVScE83SzZZb1ZINzZ3WW9XQXpiRzZkay84MmEr?=
 =?utf-8?B?T2ZvVjZGd05BUDRpL3dGSmJNZzdUdm1WWU1JYTBZdGlkNWtGWWVFWENDSXVG?=
 =?utf-8?B?aFMxTmJnbnUrVXlkSWV6RUowMXM0eUdYQnJEcWtjYTQvdnlMV2ZjRHVEV1ZO?=
 =?utf-8?B?WFlqUTgzVVpEVFkwSDdGRlJ2UUNsblR6QzYyUWxRT3JIRk9xOWVoU0kxcXVp?=
 =?utf-8?B?b1RzUTN5UTZhbXc2WWY3RmhDUFZxeGt6aVF3RnVaRUtvdGpqdGVRL1Q3cndv?=
 =?utf-8?B?Q0pDa0FTb2MzSXdLZnl1aWpnS25jbWZXVkpnaTdGWDhIeHl3dnlqZlRQb0Vw?=
 =?utf-8?B?Y0ZDT3JDbTRGbjBCVUpsZC9sdTJhQjNrbk1LVjRxaUVXcWZKcjVZSWpCOFVk?=
 =?utf-8?B?U2tCajVhcHJQYnVFZ3l2cU9Td1BpN1F2WDhyNFM5dDV5YkYyQWlOQ0FnV3lT?=
 =?utf-8?B?TTBQaStzTC9TekZranJ5djNKRzA1b2xDWWxsQk1XY2NYTnhKUVlHY3BrMC9F?=
 =?utf-8?B?dE5oRWNPUTlWaGdhYmpzaGxpTjFXMmt0US9jOCtwdU5IT2dsWGd4QnBzcnZV?=
 =?utf-8?B?T2l4ek1ZTm1zQnU0UHdKZFFwM0ZoWXE1ejdKTCtIWTA3NUVMZlhnUXk2QnhK?=
 =?utf-8?B?eG1pV3hleElaUlAzRHlhUXJLZ0lvMGROR282VkFVSkVVdmY4a3BDeDdyQUNJ?=
 =?utf-8?B?UFNrZ2NJcHBCOWZRUFdESUFtN2haU1lPZ3RZcm85akdYZWV5alAvQ2x4d0Ns?=
 =?utf-8?B?NTJrVXFDUXVWRzBwNWU3SklyRkg2RUJrM2NMbDJTNTZ0ZmJMVlFWYzh5TlUy?=
 =?utf-8?B?c0VVd0xNRUtqbS9iWmlhT3pBUTZwaEdES2JKSFZYUkkxL3FhQyttTnJCWlFm?=
 =?utf-8?B?QlNLWkZHWkRUQldMbkJrUS9rWHUxcHllK2ttNFd4K2Zka2FwTWE0OFJzS1My?=
 =?utf-8?B?Y0laZXlzZDhJNGxFUzN5cG5IUmVCd1lKOVY2Q1ZCK3MxbVlTblhxWlorWEN2?=
 =?utf-8?B?cnhYUWhyQVc5ZW5QQVhCN25HWi9PN0ZmdkUzNjMwby9lRkZ3Y1FnZWViT2lO?=
 =?utf-8?B?aWdsV25xZjFpK2xLMm5KTkF6elA4N3hSUHBVNm90TnZBbWM0TTc0OWkrN29H?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E4A316C145BC947A43B3778F835AF2A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3e265d-28ec-45b8-a818-08db4d5d0447
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 11:36:50.1605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhiBywWlr/dyWcTffrYLX3qwSgeBsltp6yuDxqczU1n51JKvmFiQBCbZ7DukZkhhEf5yYOqkQsbsHIU+QVoeR/FhAa6ALpsJuU42GzrCJws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180913

T24gRnJpLCAyMDIzLTA1LTA1IGF0IDEyOjMwICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDIzLTA1LTA1IGF0IDEzOjE4ICswMjAwLCBBbmRyZWogVmFsZWsgdmlhDQo+
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gQ1ZFX0NIRUNLX1BBVENIRUQgLSBz
aG91bGQgY29udGFpbnMgYW4gYWRkaXRpb25hbCBDVkVzIHdoaWNoIGhhdmUNCj4gPiBiZWVuDQo+
ID4gZml4ZWQgYW5kIHNob3VsZG4ndCBiZSBtYXJrIGFzIHZ1bG5lcmFibGUgbm9yIGlnbm9yZWQu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVqIFZhbGVrIDxhbmRyZWoudmFsZWtAc2ll
bWVucy5jb20+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL2NsYXNzZXMvY3ZlLWNoZWNrLmJiY2xhc3Mg
fCA4ICsrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jdmUtY2hlY2suYmJjbGFzcyBiL21ldGEv
Y2xhc3Nlcy9jdmUtDQo+ID4gY2hlY2suYmJjbGFzcw0KPiA+IGluZGV4IGJkOWU3ZTc0NDVjLi45
NTdlYTAxMzBkYyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NsYXNzZXMvY3ZlLWNoZWNrLmJiY2xh
c3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMvY3ZlLWNoZWNrLmJiY2xhc3MNCj4gPiBAQCAtNzgs
NiArNzgsMTEgQEAgQ1ZFX0NIRUNLX1NLSVBfUkVDSVBFID89ICIiDQo+ID4gwqAjDQo+ID4gwqBD
VkVfQ0hFQ0tfSUdOT1JFID89ICIiDQo+ID4gwqANCj4gPiArIyBVc3VhbGx5IGEgQ1ZFIGdldHMg
dHJlYXRlZCBhcyBwYXRjaGVkIHdoZW4gYSBwYXRjaCB3aXRoIHRoZSBuYW1lDQo+ID4gb2YgdGhl
IENWRQ0KPiA+ICsjIGdldHMgYXBwbGllZC4gQmFzaWNhbGx5IHRoaXMgdmFyaWFibGUgc2hvdWxk
IG5vdCBiZSB1c2VkLiBCdXQgaWYNCj4gPiB0aGVyZSBhcmUNCj4gPiArIyBvdGhlciByZWFzb25z
IHRvIG1hcmsgYSBDVkUgYXMgcGF0Y2hlZCBpdCBjYW4gYmUgYWRkZWQgdG8gdGhpcw0KPiA+IGxp
c3QuDQo+ID4gK0NWRV9DSEVDS19QQVRDSEVEID89ICIiDQo+IA0KPiBXZSdyZSBub3QgYWRkaW5n
IHZhcmlhYmxlcyB3aGljaCBhcmUgZG9jdW1lbnRlZCBhcyAiQmFzaWNhbGx5IHRoaXMNCj4gdmFy
aWFibGUgc2hvdWxkIG5vdCBiZSB1c2VkLiIuIElmIHlvdSBzaG91bGRuJ3QgbmVlZC91c2UgaXQs
IHdlIGRvbid0DQo+IG5lZWQgaXQuDQpPaywgbWF5YmUgSSBzaG91bGQgY2hhbmdlIHRoZSBkZXNj
cmlwdGlvbiBhIGxpdHRsZSBiaXQuIERvIHlvdSBoYXZlDQpzb21lIG90aGVyIHByZWZlcmVuY2U/
DQo+IA0KPiBDYW4ndCB5b3UganVzdCB1c2UgdGhlIGlnbm9yZSB2YXJpYWJsZSBmb3IgdGhlIHNh
bWUgZW5kIHJlc3VsdD8NCk5vcGUuIElmIEkgdXNlIGEgaWdub3JlIGxpc3QsIHRoZSBvdXRwdXQg
aW4gdGhlIFNCT00gd2lsbCBiZSBzZXQgdG8NCiJpZ25vcmVkIiwgd2hpY2ggaXMgd3JvbmcsIGJl
Y2F1c2UgaXQgaGFzIGJlZW4gZml4ZWQuIEFuZCB0aGF0J3MgdGhlDQpyZWFzb24uDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KUmVnYXJkcywNCkFuZHJlag0K

