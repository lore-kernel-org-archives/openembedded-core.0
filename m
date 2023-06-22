Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19FFEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:59:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.81])
 by mx.groups.io with SMTP id smtpd.web11.12083.1687442343588466110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 06:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=wKel5RV/;
 spf=pass (domain: siemens.com, ip: 40.107.104.81, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAcC8b2yWvePwRLHMUOdX9cGJBlkdDZikt/DLlugbI5d7vh+TQAdksCQKHLHTTQ0sSYTy/5zysrdOxuCEKHp6bfjs9V5Bixkx/2Tv3mw6VMW5JR5+HHebxiiWM0LwupMnZKI5B5mFsr+ZFNF83buAttAUja+PNLRyIQ9D6d3nlUjMq39ElzRBQtUMSiqfppFZbW6bwgfqRkqgE3UYbtiof3SuBysDbbMEfl+VgGbRck+A+gUXCyYBOxkDE3pBzEWCPtG6bewdpw4EJ+XdJThqFV3awRODp8WoTZcFYe4jWwQtj0fa5p8BqbQLoEXN1IvlMh1CVUl6eoDqd0CZde5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FgsrUN+7sV69MXn5dpMTaGWWZaDyq+cDXvej7CrmiM=;
 b=U0q3HuPdr8cNT52uEHq/qoi85sUNmpLNhemECITBkhZE37YYKUoQNqV9hWW8mAG0+yUT0egK627HuL2fq/QcbY4io3sKoo7+hPo3MwFKRbwyynPVvuiOU0Ke8f8FREil9tOt7Dyou+gb3rQ9MWWJuDsvauF1haKQLTK9z1IMllZISzUpb2cOW+MbrPppRs1C5hR5SkQXmYm0nluCzRiKlzlsVMHqw/pj3iSeNYMR0edb8Gf6nmIV/3IBfJp4sHsECkKKkrOubeJ7avfD0rp5ADvcyQyvV4aIhRhzpLUIztYPCgd3S41jbwgDqnkmyiEhiDVaZTQkQTaucHc0+jaNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FgsrUN+7sV69MXn5dpMTaGWWZaDyq+cDXvej7CrmiM=;
 b=wKel5RV/U/izBqVoDrgr5+MpAlsGbv/2l3SS++flu4ehuW3fIKY9ej4iupf2ieJBysivj2yCbc1vPiOmLYBh0Y1L/RwG5WGdEol/mi6B4Ki+Y9yrTdc6SUCCE8W+ahODxM2SieiuiUWDd2gHMqy14a6xosRolc7bR2DjnFhFKGj3zIbdYUSomSyL47+6lXwWEdRGvik+LoCRqKX/26MlePq1R366D8deMVBYeO5ZsCPNTyE8vdIpdm5qfrD9g1JGCVbyeUyIkGdN5idTnlXoH/MCD0o8BhJLElX5QR3uQNFbCHXSYja86DdAY04wb/5YRca5TXZ11XcuyzmSFL1HPg==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by AS2PR10MB6895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Thu, 22 Jun
 2023 13:59:01 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e%3]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 13:59:01 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v7 0/3] CVE-check handling
Thread-Topic: [OE-core][PATCH v7 0/3] CVE-check handling
Thread-Index: AQHZpNceYyjWrUcjEke23TpXEkG/yK+WxEQAgAATEoCAAAFsAIAAAPMA
Date: Thu, 22 Jun 2023 13:59:00 +0000
Message-ID: <ca57036152c436519f92e8d64e3e843c330a3d54.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230622065914.37448-1-andrej.valek@siemens.com>
	 <20230622144216.18783d4b@booty>
	 <66f1327de2d373002e866e0eb05f0f2e5e6bd05d.camel@siemens.com>
	 <20230622155536.505adb2d@booty>
In-Reply-To: <20230622155536.505adb2d@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|AS2PR10MB6895:EE_
x-ms-office365-filtering-correlation-id: a66033c7-f217-4fc2-5675-08db7328d4db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 w4FaJUE992lZUre50b+lG/Bt1fObIP1qosugFNskikcZJCpBgirHWw0U3BZdLIMhG0XEZ1P9OcjuZbEDFwITSvmnFH4Y2BIrOpVHRAYsWUBPr7Lctj9SSGwQDe6vPIbLUlLTNgdzQrodQAZGm3Leiei7rfWeUIyFHMd/6Fwe715YobQlA9sVPiJqRUHqchzvBZvno1ccGLtiY+GJPv01Ycb7qTvMP6nGuPwJGo/2rBbYBBxCJPAFV2A8M+Hvkta8svQBV8uwb9zsOPxDuOsIrY12GxP3CAg8U82qOSOKV3Uq6JTg7CeYqx6EQtjntQwdHgLKyPTTR4y/zs3eqk3JQGGitrsw+yRjj0aB6KM88M4opTaYrx00obzPPy3SH0UD9NaTM9TFDIs3flXVoQxbRaYlU3253QRCjgsjh45GXXx+uarUmqkuClCHx+5OYi+dF1hZVeLbd0Wj7ryw1Rc8RB4zgGJScwXVCR1ZYch/hibsh1W0ci9hy2A0VnRTVuYIZp3jqx4/VSSeIJbNcd9oDm5wZRBXO3K4eJ1HpoMornqo4oi0FxSMzWx6dDyas2QLuBz8yNMtXi3RWf2CmWdbjcTW1rctCBBP/o/AlJibX70=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199021)(6512007)(55236004)(36756003)(5660300002)(38070700005)(66476007)(64756008)(8676002)(41300700001)(66446008)(82960400001)(122000001)(38100700002)(86362001)(6916009)(8936002)(66556008)(4326008)(91956017)(316002)(76116006)(66946007)(966005)(6506007)(6486002)(2906002)(26005)(186003)(71200400001)(478600001)(2616005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WjZhbzdIUTdzQlQ3S2VVZGpoc2lVaDh6azlPRXJIMSsrTEtIU3NNTFNQK0Rn?=
 =?utf-8?B?dHBZZVFHb1Q3V25lS29WUmJvNCt6Rmp5dno4Z014UTM5RE90dE9YYXpTMFJ6?=
 =?utf-8?B?NlpMMDlXckFxQUtpRlJheXh0Z1N6ZTB2Ny9TZTBmUjQ5dmR4ZEIvZVQ0SlRt?=
 =?utf-8?B?WmNUL0c2cEkyR0V1WUhOOURmc1FiWGtmM3VwOHExYVB0SWNsbXVTT3QvcWxq?=
 =?utf-8?B?U0Vma292d2NBUHI5ODhrQ2t4a2dWN1NyUUFwN09jVy9ZdkdxQ01vcllGa2k3?=
 =?utf-8?B?OVdybFVQZ2ttWk8rSERQTWxrWEFDeGNvSDNpbVkzclBTblI3MUlySVY1MHVR?=
 =?utf-8?B?QWNGd25mV0JCVUdwK0FteXJFZ1lib1UwOW8wL2Izck9TYWlVTGhlZEk2VWV0?=
 =?utf-8?B?Q0U3Tm1ZelV3Z2hLZUpiV1NUeXYzb0JpZE9UUEQ4NTV5MFhUd3gyVDBRRklX?=
 =?utf-8?B?VGlaRkZYYTFXMFVsTTlTcTFQTjJOTjIvWE00U2dnbTFRUzBHY3R4dG1mSnZ4?=
 =?utf-8?B?QnlHZjRNdFArS2lEK0hMQk9JT1ZXbWVhVUdPdGt4V3hmY1lwQzZ0c2E2T0NX?=
 =?utf-8?B?RTk3NFROWWVGc3kvcFZTWW45RERwdURvUE5TWW9TL3RoblMyRDJGZy9kRVBR?=
 =?utf-8?B?MEJQRWVuUSsyUkRhQlAxK0RUMTFVU20wMWNkQm0vdTdNYlhhTUoyTEl5dVU2?=
 =?utf-8?B?VWtmaTFxakdYWXkzQUFCbm0veDZUMVBVcWltVWhlMk5SWHhBV3dIQUVpU3pR?=
 =?utf-8?B?ZEtWZCsxT0ljOUFqbVV0NFJjSGhiOHFVczhNeGY2SVFzK2VqS051aFh4dXRx?=
 =?utf-8?B?dHp1OGVuLy95eEF3L1JNTTlBb3BwWUpxTEUwOW1icHgzaVcybEk5K2ZOMHps?=
 =?utf-8?B?SjlPekd3YUIyTlFCT1lqMlNuZ0lmdENhS3l1VDlpVzJRaG1rWXBpRmZtRDRK?=
 =?utf-8?B?UjJsL1ducHNTRmNpNHJpYjE5alRUc2FCNXNSMmFKUnFpTkRocGtzRXRxYW1V?=
 =?utf-8?B?ZHdsN0daaFgyUDFUMkN6US9tMk9vdUFYQ2JxZzNQZXB2VVRCcTdubW15S2ow?=
 =?utf-8?B?VForTWorbnp0cWVKUjRtOW96RzZSc1gxNjNxSzFKc0oyWmhTVHFqeWQzVzRP?=
 =?utf-8?B?YmlrbVNkamt4U2JYY09NVEZkalV6MFVtZVoxTFk1RTFkWFRpS0lkQyt2WFlB?=
 =?utf-8?B?STdHdktPNnJTSERoVFFRbVY2V2taMjFMYnV0aHp1MW1VSERnUFNSZjJ6NHBK?=
 =?utf-8?B?Z0tzTDJ5NHBkNTMxdVNFZFBFVGZweHVmU2hod2w2aGxvUTJCWVhsRmZ2Y1N5?=
 =?utf-8?B?SEZuOWRFc1NORlpDaFJnOWl0cHNxeStEMzJ2NUxpQWZ1SDFiYnZ5eDEydzBX?=
 =?utf-8?B?YXV1aWtKbG9zYWxpUzIzNFdzYVBkQUVsM1BMU0gzWEc3ZmxnSmtxdWJobnpG?=
 =?utf-8?B?VXNHektUditsY20yeWUxcnBiTk5LWFJuQnhCZFhCRFpoSVl0NDhvK0dkdXh3?=
 =?utf-8?B?NWlXTWlkSTdKekJwYkFFUnBEeHZibHVCZ2VWc3JMb3NINFdEKzFNZTEwY1Ix?=
 =?utf-8?B?eEFORmNSRHcxWUdmeXZYdlBMV0R5QlE1RzZvUmNEa1ZTK3B0Y01xQjBlZmEz?=
 =?utf-8?B?cnhIdVBWNmpwd3YyVy9Sb0o4a29seGVJUDQ3K2Q0aDRkR0tYOUljRFVROGlk?=
 =?utf-8?B?MzFYVlhQcXUyb2hlY0NQSDBrY3ZMWU8rRmZQTzlTTjM5emNvSGhvMzE0N1I4?=
 =?utf-8?B?UEJocjdIVXd4N3d2WXR4TC9aNnpwbXJ5YzZ6b3B3VkdjSVlKdXlKODhCV2E2?=
 =?utf-8?B?V2xCYy9qaE5lem5NZHdHMDd2WHg5eisxUFVCN0xwdkdmZncvYjNxY0Z6cEY3?=
 =?utf-8?B?aWNTa1RyMElRZGlubmJEeGZ2bUV2VThoS0M5dld0VEM2NVVvNW9JbG1QTWlh?=
 =?utf-8?B?YVdmaTJRNTFJODdNUVNYdlpMc1ozTzljVm5KWnJxdmRONzV0YUN4YWpYbXZS?=
 =?utf-8?B?Vm1FK2FjdHczbUhPdGVNVy9oZ05DK05QN3pzUW5jOEJEdlUvS3dzc2ZTTk5M?=
 =?utf-8?B?QWNUcWd5WFVZRVkwMjg4WTFUeHRVVmdNUmlqeVduRzE2cGt2Q01meEplQm9o?=
 =?utf-8?B?MGVPTmpsRkJoUVRUUXp2dG1ZVjlLK3gzYTJRNUhRMmlraDQzTFZJdHlrSnZh?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2754BE0A17D6224AA3128A09CC3CB1E9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a66033c7-f217-4fc2-5675-08db7328d4db
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 13:59:00.9966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wlbzSdupfxP1aXwvj7ZB5xhTCDCobighNX09/YQB+zVJOB/f1rIgvOE+d0u6fxUGynlG7Ha0OMw8PEtNuPemDABlyLjuAJRYeg7SYIwV/6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6895
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 13:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183244

SGVsbG8gTHVjYSwNCg0KSSB3YW50ZWQgdG8gY2hlY2sgdGhlIGxvZ3MsIGJ1dCBpdCByZXF1aXJl
cyBhIGxvZ2luL3Bhc3N3b3JkLiBXb3VsZCBpdCBiZQ0KcG9zc2libGUgdG8gc2VuZCBhIGxpbmsg
d2hlcmUgaXMgbm90IHJlcXVpcmVkPyBNYXliZSBoZXJlDQpodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jLyA/DQoNClJlZ2FyZHMsDQpBbmRyZWoNCg0KT24gVGh1
LCAyMDIzLTA2LTIyIGF0IDE1OjU1ICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPiBIZWxs
byBBbmRyZWosDQo+IA0KPiBPbiBUaHUsIDIyIEp1biAyMDIzIDEzOjUwOjMyICswMDAwDQo+ICJB
bmRyZWogVmFsZWsgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciDQo+IDxhbmRyZWoudmFsZWs9
c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiA+IEhlbGxv
IEx1Y2EsDQo+ID4gDQo+ID4gSG93IGNhbiBJIHJlcHJvZHVjZSBpdD8gSSd2ZSBleGVjdXRlZCAi
Yml0YmFrZSBxZW11IC1jIGNyZWF0ZV9zcGR4IiBidXQgaXQNCj4gPiBkaWRuJ3QgcHJpbnQgYW55
IHdhcm5pbmcuIFNob3VsZCBJIGJ1aWxkIGFuIGltYWdlPw0KPiANCj4gSSBkb24ndCBrbm93IGhv
dyB0byByZXByb2R1Y2UgX2V4YWN0bHlfIHRoZSBidWlsZCBlbnZpcm9ubWVudCBvZiB0aGUNCj4g
YXV0b2J1aWxkZXJzLCBob3dldmVyIHRoZSBsb2dzIGhhdmUgc29tZSBnb29kIGhpbnRzIChjbGlj
ayB0aGUgInN0ZGlvIg0KPiBsaW5rcyBpbiB0aGUgcGFnZSBhdCB0aGUgVVJMIEkgcHJvdmlkZWQp
LiBFLmcuIGZvciB0aGUgcWVtdWFybTY0DQo+IGJ1aWxkZXIgaXQgc2F5czoNCj4gDQo+IFJ1bm5p
bmcgJy4gLi9vZS1pbml0LWJ1aWxkLWVudjsgYml0YmFrZSBjb3JlLWltYWdlLXNhdG8gY29yZS1p
bWFnZS1zYXRvLXNkaw0KPiBjb3JlLWltYWdlLW1pbmltYWwgY29yZS1pbWFnZS1taW5pbWFsLWRl
diBjb3JlLWltYWdlLXNhdG86ZG9fcG9wdWxhdGVfc2RrIC1rJw0KPiAuLi4NCj4gTUFDSElORSA9
ICJxZW11YXJtNjQiDQo+IERJU1RSTyA9ICJwb2t5Ig0KPiAuLi5hbmQgbW9yZSBzZXR0aW5ncyB5
b3UgbWlnaHQgd2FudCB0byBwdXQgaW4geW91ciBsb2NhbC5jb25mLi4uDQo+IA0KPiBTbyB5b3Ug
bWF5IHRyeSB0aGF0Lg0KPiANCj4gTHVjYQ0KPiANCg0K

