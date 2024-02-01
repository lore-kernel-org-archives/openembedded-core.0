Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F164C47258
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 02:00:48 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.125])
 by mx.groups.io with SMTP id smtpd.web10.6094.1706752847266837800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 18:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=FwH+0Xok;
 spf=pass (domain: aspeedtech.com, ip: 40.107.117.125, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=is4jzIUMp9Mrh1jd5b9CmyfaR7kwFA64mWJ2FVdxZFuyEGH2jvT+09xQQbvNAVXv72K+UnhNb+rKI6hj6RfzX18v7LygWZgmm//nYcB8+Yy4Ezk/r5NSixg/PTQGXgA8k739fs/4E70sRiMhluouvdO9RSZo3b+2ssRKXA8Km8Rf0/Yz1Qk8PQPRfXyFcukgizlQMYNNwJI5UzI+tnPyYzVJ3NaEjygS0Em4B3eKs4PUzIYQGuB5HfBCMbQaqtQ562uT2vb46q9LFw8t7i7fBaHtu85Iw/56+wvYaHJhDnfM5Aq9/kQcQ5cx9J0FEx1KDne1/oMEW6qtur2olLTMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRaTDJ8zGWf63Kj+PVAxN39UmkzTxF6FWUI9WL3Cs3Q=;
 b=adn41A19rJQ8DRqrQUqTPiWm2xItn2++hwFrL4StL3FO9T/KAZGKC4wgV3mOQqwNDqvnrCAThYlgrDJv6b9cV3Lxm9HV7NXYd6kLr+SkRdN4SMbZ9UDiBBHB6NagzoL7kgKoRtuKG9Ra7R/mpvkponYCGOw2iZxd2QpxQ4VfZxi6qgy7DL9SyrZ/RJL4J2wTu+O47gwzYDPte4pOI0GLlrmfbl6AHrkOtc8ehb9EvOawTdVYhFGOmUfsJKzY252u7wLMyazLR7gp6Pit9fQNKw4ZuVoctz477dfDd2OLuQYasvpcvfPHZ5xvQbhyWYg8/6ymTS24Jg/YUp8h8X0jNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oRaTDJ8zGWf63Kj+PVAxN39UmkzTxF6FWUI9WL3Cs3Q=;
 b=FwH+0XokmhDBuI88vEyNUuPCO3adExuItAgyRoIv28R0NriJJOOXgiOtqt0TCqe11fVDSH+hoIYn2aV1ImcUdmrLwde1UgZ4FtPspiHoxFSzlpHDtIthNuLSKw8yoScxWmqOKhLO6x4bNIWW2fyNcceh3xI3iRP/RKRXzMAhG0HPL6+uFKKKMNdFugdXWwKTbQj9eA0MheZ/z90oja+VaoLBstlVo4/6wGc0iuAxW3WyjMMfZdAy5890tyrhbKElF+aoL9fhfPGM9pbucE9rQqW/hVhRNX9MxuGQ1HqGdi+i/vCQitEcHBQB33UyEdAZCuR8aUXCAtjNE+Ax94rYhA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 PSAPR06MB4168.apcprd06.prod.outlook.com (2603:1096:301:35::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.26; Thu, 1 Feb 2024 02:00:41 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::9c95:79fe:96a0:cf91]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::9c95:79fe:96a0:cf91%6]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 02:00:41 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Subject: RE: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os and
 TFA images
Thread-Topic: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os
 and TFA images
Thread-Index: AQHaUHnSn8xRov1apkuLt4TyN8Gja7DzoHvQgABQt4CAAMsicA==
Date: Thu, 1 Feb 2024 02:00:41 +0000
Message-ID: 
 <SI2PR06MB504170D87B4DF9C3B8C2A7DCFC432@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
	 <20240119061937.1368163-4-jamin_lin@aspeedtech.com>
	 <12ffb6f38cba0eacf365bb36806a1bd2f69771d2.camel@linuxfoundation.org>
	 <SI2PR06MB50416E075AE969B6C4A9CEC1FC7C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <1c46d3bc00ebe9047e5748e4b4c189cbb91a5ba7.camel@linuxfoundation.org>
In-Reply-To: 
 <1c46d3bc00ebe9047e5748e4b4c189cbb91a5ba7.camel@linuxfoundation.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|PSAPR06MB4168:EE_
x-ms-office365-filtering-correlation-id: d5c0f56f-a86d-4ab6-0d1b-08dc22c997f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KPdimMbrFIrN/Vx1p8mR+HiCtapZFGElK/MB91XJaZSwQXW8SBdnYShPIyozWpJTTdYUl4S04bIqI2PZsgsXthwOQATI5q0ZX1ojb1qXXiFItTXtPu1W6s23CmAtHMh0oecASMuMzZrj+lcemeIpPb5mT7a1qTeZ+Qc5JXphSB29DjCtNxEX1MWTp0rnBmuRveuBKKCf3rfYBWN4POlDUdM1biqFWi1yzd+O4rNpNeeJuAB3SMwNc4jenJeyX4+YqPVuTD4sdQALcVCp4QiGGM37n65Pa9fU2H/P9jP/CcjIciJgHtTKAbVqUSZ3rmD5fBPYdqaHfw7Wu0WhgqOuaAszHIqMHffzO7Enj7Yg/NSpQr8jrTj9J3QzvTMA9Pw+wjVRauRhULgKxQ7zOb/GIGz4GZoqeF3Bl7BKAzQEdddv0cKRgSKCFrOO0cEFqWF1HBuAnLcqIP2EMeg6HLBBgAolM+6apKx+lNpi3RHwC85YAVvnZra6LSTc73LdNw61W4nz7u+NrDQMLvE8APvnVsORqFaTISmcmYRX9izDb43QOU4hKej6JepSFuljqUAlcF6YqjijyQr1jmss0bhvExzHZpdGW0dmMfgj22Uh1qw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39840400004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(55016003)(66899024)(26005)(41300700001)(966005)(38070700009)(66446008)(64756008)(66476007)(54906003)(316002)(9686003)(71200400001)(478600001)(6506007)(7696005)(83380400001)(38100700002)(66556008)(122000001)(66946007)(110136005)(5660300002)(33656002)(2906002)(76116006)(86362001)(4326008)(8676002)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d0k2Z1Rrb21CbjAzRHZjcCt1U2NFamVRZXdnUEJvTGxpL2VJMXV6bStXTGQy?=
 =?utf-8?B?MFE3RHpyWVdqYmhoYjNqU0UwNE5NNGxteldLV2FQS3RXQjhRTWc2UTBnSk5Q?=
 =?utf-8?B?bFRsWWVkcGl0MFU1WlNPYWhwbnJLWGZYTkVlSWxuQWRXbEtjc1FsOWlwL3Z2?=
 =?utf-8?B?VHczVE9uNUVmNWp2Y3FSMGJYRzE3SVZCd0tUbnU5eDlEbUZzdVhPVlF2cFUv?=
 =?utf-8?B?MWd3eWUyaGI4TzlWbVdQMnJVbkgxYWVvWkNORlNDdFQxRkFubmQ3b1d4ZTFq?=
 =?utf-8?B?T2FyaDhERWw3SjlxeDREQTQrNGFCWitqRXVObVhLanFkdjV6TlZaRUh6NWs2?=
 =?utf-8?B?eVlteVBlU012bDZYY2VoU0xxRXB1bTBNT1JwSW5oU3VUNTh3Ynd3L2ErRGRq?=
 =?utf-8?B?dHJDU0xYSnVIQVN3N0NQYW9uVjNsMnc4R0EwR2NvL3JpQkdGTTlTQ3cxYVo5?=
 =?utf-8?B?RHRSckRqT25POHlya0RRZEFVc0Z4RmF3b2kvNVMxS0VtQ3RJbmZuelY3UTc2?=
 =?utf-8?B?eXJyS09uUS92bFpWcnFnUHY2UWJKTTVvT1Z6UmVwbkZYWm5HK1RVTkcvTUFY?=
 =?utf-8?B?YWptdllOOVRlMHpSVkJmbExCNTkrZkNnYWpQdzNVb2lXbU9Xb1FWZFVtak1p?=
 =?utf-8?B?TXp3MHViVWJzNEF4b1hpYTZiZ3lvemxnTktkazV5bG42STJubXpTbk1KKy9t?=
 =?utf-8?B?bmg2MFJ2MGRLUXBwcGpkdzZiTnNXdmRKYzJIbTRqNTZaZEdUd0psM2VETVNS?=
 =?utf-8?B?TkNEOEFwL05NVlUrL21lcEdQcG5NUWZPWHZ6T0d2Y2Mrc085bis0OWwyV0pE?=
 =?utf-8?B?amNCU3UxOHNtRExHMmI5SVJ1M0hMK2ZxZUVoRTlGTFVTRE9LemV2SjdtdU5B?=
 =?utf-8?B?ekRNWXlzV0dhbTJiazNpdHhyeHRacS9sTENvTHdMai9kQ3lNZHRaa0RyN2xk?=
 =?utf-8?B?OTl3UzUvZUp6RG9YVDJyTUZZam9uVGs1b3JGbTVyUnBBQWgrTUxwWlR0WGF1?=
 =?utf-8?B?RTdIdnZVc21QTEcrR2k0OFNVZW5oZ0hpNjFlaThRbUhNSCtJTkJDNERqRExP?=
 =?utf-8?B?N1hVVlM2Y2F0a2RtR0FwUGJaUUJHZXdwRkFnTmVmb3c5eWhkUldUeWRLR2Jq?=
 =?utf-8?B?WGFLenFEMVVXdUFvNnBTUXB2OEx4YUZic1RSN2lNWUg3S0FqanhOMGxiZTAv?=
 =?utf-8?B?ekxwa0xMaVRRcFBzMHVxQmNQZCsxR2xqMjRXVGwvWWZiVzRBUVBMdnk5MDdI?=
 =?utf-8?B?enl3ZFlwYnRyenJZSVhLdlkyTEJEb2dvcFdoUXYvS242RlNxUkhWVUE1QmhR?=
 =?utf-8?B?cGFLa2FhY0ZtWURHdGIzV3F5TGg1UEU2eVEyc0NjQ3JSTS8yUXZtVWNYQkhk?=
 =?utf-8?B?T0t4aE5Rc3NrSGZGZUdQVzk2YmtlQmNHTStrTFJmM3FMRjllcE81RnE4Ujdm?=
 =?utf-8?B?OTVPZno4RGYxZG1qaVdOdTAvY1dSa3ZZUHhjV1RGV0x1bjdsTWk1akM2clhr?=
 =?utf-8?B?dkM3OHprNVNhYTZaVDJaV1cydWFDeDVYWnFia0NsdmR5TlpDZ2JhSi82YTBP?=
 =?utf-8?B?WU5pbGpqRFM2SFdMSlczWU5BVjV2NGZzRlNCZkpGWksrYitNOHBoNnAxamVH?=
 =?utf-8?B?ZnVEcnB3VndlVmtoMS9mbWVCOTQyZk1OL0hvSlcrRTBVMlYxai9lUzZOTko3?=
 =?utf-8?B?YUVnQ012ZHgyb1B5QVBKUFpJdlNpcVN0cnVWL1psMy8xeVlUTGY4ZW12aGt5?=
 =?utf-8?B?OWVYOWVJVXdzVUtQb3FtUHhCcDRpV0pCUmxqT1MvdWc5aW1EZWptcXdYV0xD?=
 =?utf-8?B?VXFDb1pYZmUvZklmOFZhZFNYbStPaDhLaEpTZm1UWmw5c2RGbWdyL0Myc0J2?=
 =?utf-8?B?czhDcVhRbDdHNFNONmV5djlmWVQ1MzQwaVJIWWtzaHdNWW0xVGFXVUV1L0lJ?=
 =?utf-8?B?cTRvazFFV3l3TnVmQk12NlJNQ21MYmlTTGpTdTUxZnVsSmJNdFA3WmxSdUxV?=
 =?utf-8?B?L0tyallYZEtyQ1pqR1J0VS80ZjlDcEdoMkRhMVliSGNaNStrUEp2RnZJbWZn?=
 =?utf-8?B?WHZTcDNPYmdiOFJHaTlrSEZrM1dpQUNiWmEvejhJWDAzNVU0L2M4bVZXOU5S?=
 =?utf-8?Q?uVoMm8+ZY/K1HHMygviTEiSR2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c0f56f-a86d-4ab6-0d1b-08dc22c997f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 02:00:41.2819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MfI65mGtDnaPqzBC1hr1CAORP9pSxQpE2JSNFqNsOGu3m/C2d2lL8RkoVj3DNPfpL/+3wbtB1OvYKFqlUCCpYqF7zOX18ZFHDTntqznx9Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 02:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194544

PiBPbiBXZWQsIDIwMjQtMDEtMzEgYXQgMDg6NTQgKzAwMDAsIEphbWluIExpbiB3cm90ZToNCj4g
Pg0KPiA+IFRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5kIHNvcnJ5IHJlcGx5IHlvdSBsYXRlLg0K
PiA+DQo+ID4gRGlkIHlvdSBtZWFuIEkgc2hvdWxkIGNyZWF0ZSBhIG5ldyBwYXRjaCB0byBhZGQg
dGVzdCBjYXNlIGZvciBmaXRpbWFnZSBvZg0KPiBvZS1zZWxmdGVzdCBpbiB0aGlzIHNlcmllcyBw
YXRjaD8NCj4gDQo+IElkZWFsbHksIHllcyBwbGVhc2UsIHdlIHNob3VsZCByZWFsbHkgaGF2ZSB0
ZXN0IGNvdmVyYWdlIGZvciBuZXcgdGhpbmdzIHdlJ3JlDQo+IGFkZGluZy4NCj4gDQo+ID4gQWZ0
ZXIgSSByZWFkIHRoaXMgZG9jdW1lbnQNCj4gPiBodHRwczovL2RvY3MueW9jdG9wcm9qZWN0Lm9y
Zy90ZXN0LW1hbnVhbC9pbmRleC5odG1sLCBpdCBzZWVtcw0KPiA+IG9lLXNlbGZ0ZXN0IHN1cHBv
cnQgdG8gdGVzdCB0aGUgZ2VuZXJhdGVkIHUtYm9vdCBGSVQgaW1hZ2UgYW5kIHRoZQ0KPiA+IGdl
bmVyYXRlZCB1LWJvb3QuaXRzIGhlcmUsIG1ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvZml0
aW1hZ2UucHkNCj4gPg0KPiA+IERvIEkgbmVlZCB0byBhZGQgbW9yZSB0ZXN0IGNhc2UgdG8gdGVz
dCB1LWJvb3QuaXRzIGFuZCB1LWJvb3QgRklUIGltYWdlIGZvcg0KPiBteSBtb2RpZmljYXRpb25z
IHN1Y2ggYXMgb3B0ZWUtb3MgYW5kIHRydXN0ZWQtZmlybXdhcmUtYSBzdXBwb3J0ZWQgRklUDQo+
IGltYWdlPw0KPiA+IEFjY29yZGluZyB0byB0aGUgZGVzaWduIG9mIG9wdGVlLW9zIGFuZCB0cnVz
dGVkLWZpcm13YXJlLWEsIGJvdGgNCj4gPiByZWNpcGVzIHdlcmUgcGxhY2VkIGluIG1ldGEtYXJt
IG1ldGEgbGF5ZXIsDQo+ID4gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLWFybS90
cmVlDQo+ID4gQ2FuIEkgYWRkIGRlcGVuZGVuY2llcyBpbiBib3RoIG1ldGEvY2xhc3Nlcy1yZWNp
cGUvdWJvb3Qtc2lnbi5iYmNsYXNzIGFuZA0KPiBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2Vz
L2ZpdGltYWdlLnB5Lg0KPiANCj4gRm9yIHRoaXMgSSdtIHdvbmRlcmluZyBpZiBtZXRhLWFybSB3
b3VsZCBhY2NlcHQgdGhlIHRlc3QgY2FzZSBhbmQgYmUgYWJsZSB0bw0KPiBydW4gaXQgdGhlcmU/
IEkndmUgY29waWVkIFJvc3MvSm9uIHdobyBtaWdodCBiZSBhYmxlIHRvIGhlbHAgd2l0aCBpZGVh
cyBvbiB0aGF0Lg0KPiANClJpY2hhcmQsIFJvc3MgYW5kIEpvbiwNCg0KSXQgc2VlbXMgdGhhdCBJ
IGNhbiByZWZlci9tb2RpZnkgb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9saWIvb2VxYS9zZWxmdGVz
dC9jYXNlcy9maXRpbWFnZS5weShvbmx5IGFkZCB0ZXN0IGNhc2UgdG8gdGVzdCB1LWJvb3QgZml0
IGltYWdlIGZvciBvcHRlZS1vcyBhbmQgdHJ1c3RyZWQtZmlybXdhcmUtYSkgYW5kDQpDb3B5IHRo
aXMgZmlsZSBpbnRvIG1ldGEtYXJtIGxheWVyIGluIHRoaXMgZGlyZWN0b3J5LCBodHRwczovL2dp
dC55b2N0b3Byb2plY3Qub3JnL21ldGEtYXJtL3RyZWUvbWV0YS1hcm0vbGliL29lcWEvc2VsZnRl
c3QvY2FzZXMvdGVzdHMuDQoNClJlZ2FyZGluZyB0aGUgdS1ib290IGZpdCBpbWFnZSBnZW5lcmF0
aW9uIGRlcGVuZGVuY3ksIGNhbiBJIGFkZCBvcHRlZS1vcyBhbmQgdHJ1Y3RyZWQtZmlybWVhcmUg
ZGVwZW5kZW5jeSBpbiBtZXRhLWFybS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XyUuYmJhcHBl
bmQgYW5kIHRoZSBjb250ZW50cyBvZiB1LWJvb3RfJS5iYmFwcGVuZCBhcyBmb2xsb3dpbmcuDQoN
CmRvX2NvbXBpbGVbZGVwZW5kc10gKz0gIiBcDQogICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1VC
T09UX0ZJVF9PUFRFRV9PUycsICcxJywgJ29wdGVlLW9zOmRvX2RlcGxveScsICcnLCBkKX0gXA0K
ICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdVQk9PVF9GSVRfQVJNX1RSVVNURURfRklSTVdBUkVf
QScsICcxJywgJ3RydXN0ZWQtZmlybXdhcmUtYTpkb19kZXBsb3knLCAnJywgZCl9IFwNCiAgICAi
DQoNCkFueSBzdWdnZXN0aW9uIHdpbGwgYmUgYXBwcmVjaWF0ZWQuDQoNCj4gPg0KPiA+IE9uZSBt
b3JlIHF1ZXN0aW9uLCAiIFRoZXJlIGFyZSBhbHNvIG5vIGRvY3VtZW50YXRpb24gcGF0Y2hlcz8i
LCBEaWQgeW91DQo+IG1lYW4gdG8gdXBkYXRlIFlvY3RvIGRvY3VtZW50Pw0KPiA+IElmIHllcywg
Y291bGQgeW91IHBsZWFzZSB0ZWxsIG1lIHdoaWNoIGRvY3VtZW50IEkgbmVlZCB0byB1cGRhdGU/
DQo+ID4NCj4gDQo+IFdoZXJlIHlvdSBhZGQgbmV3IHZhcmlhYmxlcyB3ZSBuZWVkIHRvIGRlZmlu
ZSB0aGVtIGluIHRoZSBtYW51YWw6DQo+IA0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3Jn
L3lvY3RvLWRvY3MvdHJlZS9kb2N1bWVudGF0aW9uL3JlZi1tYW51YWwvdmFyaWFibA0KPiBlcy5y
c3QNCj4gDQo+IEFsc28sIHRoZSBjbGFzc2VzIGFyZSBkb2N1bWVudGVkOg0KPiANCj4gaHR0cHM6
Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1kb2NzL3RyZWUvZG9jdW1lbnRhdGlvbi9yZWYt
bWFudWFsL2NsYXNzZXMNCj4gLnJzdA0KPiANCj4gc28gaWYgdGhlIHZhcmlhYmxlcyBhcmUgY2xh
c3Mgc3BlY2lmaWMsIHRoZXkgc2hvdWxkIHByb2JhYmx5IGJlIHJlZmVyZW5jZWQgZnJvbQ0KPiB0
aGUgY2xhc3MgZG9jdW1lbnRhdGlvbiBpdHNlbGYuDQo+DQpXaWxsIHVwZGF0ZSBZb2N0byByZWYt
bWFudWFsLg0KDQpUaGFua3MtSmFtaW4NCiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K

