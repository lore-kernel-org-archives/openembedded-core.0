Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D3AC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 06:51:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39052.1782888687157299345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 23:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=DJqyy8Sq;
 spf=pass (domain: est.tech, ip: 52.101.65.68, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU8WJDjFnZSj88zvvzfkaHVPuwpBoVhJwYlrpIEnAhqIhL4PHv6w6Wg3t62skevB3sTJS031iGcgCzcONtfrQQmllJE8BFB1zyN0+qVlcZJhaDSbf2DrjHkMNySQtS1jyNldjFmjCiic8VtcX/KVScQbtJL060JRWlzT7J1pbXGz2P4DNuzbTuLVcP66wIWUyq7ZQ6kkDwC5edZE4ZniStfvo41r6ZqCN3FfXGWIPJfKfuLbqwvfYWPuRuyNwW9vNTheVwJATVTT+ZF9z5wAHSvNW5kvVJMFCIMbPof1htsYiN5rZJ8O+NlPJwedbthY2UThoyZ2Ta5xTyVUSWhLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUHUNMz8Zjm2QdGUH9VcpRjVIAA8NrSU1Haysa93nds=;
 b=PqM3wwsdDWXa9W/gAIAps0t+C3FKbDsjwlUGxDse2sMbYsK82m42MajdRk0lzWKxOV2r4/b+pFzGlar1R484acL9m13eV20jVxUW9Dvz+UMa46Itv6BVagIRC6/YPtPJZvN2DgavuTF4ZwpadbPfFlQ6zft52MtDCu+veTUGi1amu0WzNH/YW68n+jMXaEJPRsRuFyaalOsvu033ppwgPICrwsfQf0fASTTboYMUpfSlUwQY34nCRCTK5KJI7DfkgLeau5ilpR0wPJ+SMBUHG77jyDzfjYbxGTq3jlL6dsg5RGfbYPFSxDG021e7WITvUJ5qNg28JSbita7/26Vu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUHUNMz8Zjm2QdGUH9VcpRjVIAA8NrSU1Haysa93nds=;
 b=DJqyy8Sq1nNpj1XGiV1RMxjkz0XbHxKbNrkxyF52Z+ZS0YBfo/qFzjcKgl1fqE2yol3NUQQ52g0G4YfsijqrKE7ZPW0q7gy5pQL5NeXG34+H3NEz7SFQ3zhalB8QgB0qG2A0gN2KPFUOXx7/tdN3E/lJp1nhniEqY2lzPp5F7ZAYtquEBG4ZLUsNABRI5fpIXl5U/6mEfVxeUXkb6NxMVE//zSY8UKNwhcEB2Bjk/aE3JvzdXI+qY1uc/+5bTyGLNFrqdE9XVHwxIb5VnE/HsN7YVXnn1DJYuR7Pr6UKd8pn0mCExTd2vYmfHSg6ey6iO2X/OFzk32wmhrXLh/X9Hw==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AS8P189MB2023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:520::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 1 Jul
 2026 06:51:21 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 06:51:20 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Thread-Topic: [OE-core] [wrynose][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Thread-Index: AQHdCJDr8rNTv+MQxEmcD6lRpUOO0LZXFOkAgAEmAAA=
Date: Wed, 1 Jul 2026 06:51:20 +0000
Message-ID: <b8208b7ba43f8405d351b61b2e35ce40ae7fc979.camel@est.tech>
References: <20260630130358.71091-1-roland.kovacs@est.tech>
	 <20260630130358.71091-2-roland.kovacs@est.tech>
	 <DJMEWS9R1XRF.1VEP9G7EHB1S6@smile.fr>
In-Reply-To: <DJMEWS9R1XRF.1VEP9G7EHB1S6@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|AS8P189MB2023:EE_
x-ms-office365-filtering-correlation-id: 2ab26f64-198e-4913-6946-08ded73d28b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 KHB2V+y+4PU1PXmG3vdCoHdvLMKzq+1z4UhzVfzTuBjVgMiddDcZLoCQVxK3elp291AcBgZE4Gvt9fSP0AFn8SglK3DHqhoOsEnDK/wNveoW+o6nvTwBzZHB2icju23NfQdvtAMYtctaNAYwOnd8fAVn2waXnKgu1/+eBtU4s2m2CqMSh2xmSo2e3LvAFFvcwD9nuO9OdU8OCiLCV1BdmUSf0nqfnNmF1ONysCdd76/J5hG0S+1KD7RCF5LZkduUwJRVOKtesA4dkLQhbdp95xAf93cXH0Qu29On7KDahbz/TE+yOYdUWlTne7ba1CvigZE6evt2TvSZetKbPjFc++eXJWhE5bJtJPSgXSTsDLP9OKTB0/i7U6Mp2+eLExffSlntHtRJ6I3104vV25Vy3oyvPsmzBmzxiaSg5bgRJpieIQCXo5CTDc/R7cmM/CZzbgIEngEi1LMbYs3CoKlgWBlWiHQv8F7DV0vSY/iZBoI1wSEJitBOuDyslV7+57aL3cTzRfS0BoHosRsmA1KvnT5htDj1Y6cf6Umz+G3KN8stTgXYGEGQI7p8jQqquCu73dzOiZNhclxAZZ7EzTw8nP3uiS7OYCa3c05Rf8aJSKrRmQGzOeFS7mD54ectUe9qo5moIcszNCR7YWIipqbSsRQHXg27KFo5j2X//mXNzxI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TkRuM1NFbjlSVHhXVWUzOUJseTRZMVBPcUJ1czd6azlJSUFOM0cxcGhDOURx?=
 =?utf-8?B?Z05UcC9NSkVjeTFWdlVzM1QvbFpnZ1Y0WkxZMUdRN05YSEZKRXlHcjdNTWov?=
 =?utf-8?B?am0xSHIrcXFUU0Zxb1FadEZrUmJORFdaZGRQcVRuTDFJbzlwd1JhQk9jSk5Y?=
 =?utf-8?B?MzFyUHA5NjZIejlmek5zK2pmN24xcWswWm83eXZPc0Yxam5vZUkzcDBJNXBJ?=
 =?utf-8?B?S1hHUEZlVW82UjcxOW5WZ1puSWgzV2l5aFdOZ1dYUlpORWlzUnJZVy9vMlFh?=
 =?utf-8?B?QVJ1Ym1DT1BncTdYb3ZIdXlpUVBrMVc3bWFSaEVFUmFuSFlkZ2VSek40bVV0?=
 =?utf-8?B?Ty9Pa3RVWnZvdDRjMnNPVnJ3ZTdjWlZFV21oNnpid3FVOGV2YVloNHhjV3VO?=
 =?utf-8?B?QnAxaU14RmdIMTMySXFVdW0wdVVienV4YnY1azVjaEFuVzJNOGRDWDR3a21v?=
 =?utf-8?B?V3BiazlTb215bkNPbzhiYWhSY1IxMW12RkQ0a0daSWNoajkrSUVxVGJNRWox?=
 =?utf-8?B?YzFNVUZkWnRPdGVHSEVvQlNINjMycGllODVJbXlKZVprakNPcmRWeVJlSENY?=
 =?utf-8?B?QkU5eUJoQ1kwc0JHOHpmdFB4MkdOM1FFb0w3Skl3T0UwY0hsR0NEZzJnTFdy?=
 =?utf-8?B?Ry9pci8vUjVDV1o2S1JBc2RlWHlqZDBSZmR2Y1NQMEllbU5vQ2tWRkY5K2xR?=
 =?utf-8?B?NEFDR3FIU3B5KzV4RkprVUVFeU1nbDFLRkNDa1YvM2FUR3VQOXN5eTZOdnhx?=
 =?utf-8?B?bFdGWUVRQWlRL3d3UnFpZWdKMmVNRVJjTTBTZkJuSmxZY29WSzYwUnpxV2JM?=
 =?utf-8?B?ZElZeVRSU3hncnMxZWJDUTZUTzMrYjQ0Ri9PbjgzUjNjOVZLMytScytML3Bq?=
 =?utf-8?B?a3NuRUZ0bEd4NDRWcmxZcHU2UEg3bm85bWtnQ2QzSVBTV1hqelhSTFAyalpy?=
 =?utf-8?B?a3MydWhveW9YenNYdWp0b1VTN056WmVIeVZTb3FGV3ZUaU1OOVdyVEdlTXFT?=
 =?utf-8?B?WnRyOE1TczdwaENvZWU4cUtBZlhoTEdXbThzU3VMckJDQ0FpUmMrMXNzTkFJ?=
 =?utf-8?B?NGREMFZoU3k3NTNGM0kycWl6MjhzeGk5aGlRUDVqZkkzamEwK0lVb0Y4U1Iz?=
 =?utf-8?B?TThwVWVmcTRMR2dxdFBGaW96NnliMjBUN0xSUnV3WkVWZFVjbDZBSkhHTmdN?=
 =?utf-8?B?Qnc4Nk5ubzR5enBLM3cxK1Mxc3orTUtjVnd2MEVONW1hOW9ZRHk3RHVsMk5Q?=
 =?utf-8?B?OC9Gbi9ObU84b2ppSWpCaGp0ZnZ3elM1Mk9uMGJ6c29nOGtVQy9ZZk5yUng1?=
 =?utf-8?B?cldmYWhtNm1ieWtkOTlLYWRKU0FIV2tNTXd0MVZWZ0JtU1BhMTBQRURzOGw0?=
 =?utf-8?B?d2ZmUGNjYmRDTVN2enJMdzhVbUQ2b2dsK2FUS1Zxcm1BdGxoRVlQUnNhVE5R?=
 =?utf-8?B?ODA0eUhvcHlQR2lmaTBNYWxDL2NqM1djZFY5T3liZWpPM2ZrUGptei92bi96?=
 =?utf-8?B?Tml4dHBWem5DUTNmTEF2M2ZLMUFQeFc5T1hrNW1ranZRV2NjbU1HSStybk5o?=
 =?utf-8?B?bWMvS05WSXgvVUFLc2IxbXVnN2s2dXV3d1Z2Y1dWUEZNb2k4aUEyZENMWVlC?=
 =?utf-8?B?NW96UFN0ZUFTNTdPeWhEVVFGRWV2MG9oSGI5cDBMRmhrVWwxOFBObU5WY0RT?=
 =?utf-8?B?RzVQVlNwOWJTS1ZkOE9iMVBBenE2OVdOVys0eExJbGpZWEFucFFsT1kzR2hK?=
 =?utf-8?B?RkpQcFczZlRuaUlLSG5QcUhGdnFxbnJtSmY4ajAwaFc5ZVRqd3Y5ejZXdnNN?=
 =?utf-8?B?blBNbEV6V2FRQ09sazJQNU5McXFYN1NLRWo2N0ZSRGN0NFZCUkM0Nkg2ZkF5?=
 =?utf-8?B?eUNiOUNkbG1hQ1hvWS9VNzA5OFdoa3lUUmNCUUZvZWhLanMvNjFNcW9rNk5R?=
 =?utf-8?B?TVhMSjEvVlJLeHlvcG8ybVBseFAyeTJRdEFCN05WU1ZYNTNDR2dpN3RuUnFp?=
 =?utf-8?B?Q1hUSUVDeFdFYmxtajAyWmVMVVF3ZVYwYzlJWkVKdTdCRVgrSndGTXVXMmRI?=
 =?utf-8?B?M1hNRDVSYUllcDZqakVHcEE0U3B0WGozejByVXlxUjVrU2VINkRkbkh4L2sr?=
 =?utf-8?B?RDZEWk1MY2Zld2U4Lzl2MlVqNlJrRGhiVkNUWDUwZWt4eTJjSjI0bGdMSUNB?=
 =?utf-8?B?OWxQMUMvakZETnYwTmVMaTlKMzR5ZkdsQ2ZhdXhTMVBWeDI2bldXclpYcElv?=
 =?utf-8?B?TkkzUjFhaDE5QUZ2YUIyVjVNamN1Y0w4TUJYc2NpbmI1TVUrUWJYMDE0aTJ6?=
 =?utf-8?B?Um1NUXp3d0dYYWluTXk2T0Z1b3VPQXZnQjFLOWd5SjdrSkZOTHNkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6E1354039371B449765D264EECA702C@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab26f64-198e-4913-6946-08ded73d28b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 06:51:20.8506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAFXzFOcktY+BQRsTUFVfPNn/OeSZV8pXtEwprIwHdIZ3/9EKeKXLTEen3XjlpCyoGoFDhZP21X5XbVMPk8Stw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 06:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239945

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDE1OjE5ICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IE9uIFR1ZSBKdW4gMzAsIDIwMjYgYXQgMzowMyBQTSBDRVNULCBSb2xhbmQgS292w6FjcyB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBCdWcgZml4ZXMgaW5jbHVkZWQgaW4g
dGhpcyByZWxlYXNlOg0KPiA+IMKgwqAgLSBncGc6IEZpeCB3cm9uZyBhc3NlcnRpb24gZmFpbHVy
ZSB3aGljaCBjb3VsZCB2ZXJ5IHJhcmVseSBvY2N1cg0KPiA+IMKgwqDCoMKgIGR1cmluZyBrZXkg
c2lnbmF0dXJlIGNoZWNraW5nLsKgIFtyRzY5M2Y1NjQyZjZdDQo+ID4gwqDCoCAtIGdwZzogQ29u
c2lkZXIgY2VydGlmeS1vbmx5IGtleXMgZm9yIHJldm9jYXRpb24gc2lnbmF0dXJlIGNoZWNrLg0K
PiA+IMKgwqDCoMKgIFtUODE5Nl0NCj4gPiDCoMKgIC0gZ3Bnc206IEZpeCBwb3NzaWJsZSBkb3Vi
bGUgZnJlZSBpbiB0aGUgQ01TIHBhcnNlci7CoCBbVDgyNDBdDQo+ID4gwqDCoCAtIGdwZ3NtOiBG
aXggcG9zc2libGUgdG9vIGVhcmx5IHJlbW92YWwgb2YgZXBoZW1lcmFsIGtleXMuwqAgW1Q4MjM2
XQ0KPiA+IMKgwqAgLSBncGdzbTogQXZvaWQgZW1pdHRpbmcgYSBmaW5hbCBGQUlMVVJFIHN0YXR1
cyBsaW5lIGlmIC0tc3RhdHVzLWZkDQo+ID4gwqDCoMKgwqAgaXMgbm90IHVzZWQuwqAgW3JHNjlj
MjdmZTM3N10NCj4gPiDCoMKgIC0gZ3Bnc206IEZpeCBhIHJlZ3Jlc3Npb24gaW4gMi41LjE5IGZv
ciBwYXNzd29yZCBlbmNyeXB0ZWQgR0NNDQo+ID4gwqDCoMKgwqAgZGF0YS7CoCBbckc2MGE4MjNj
OTdiXQ0KPiA+IMKgwqAgLSBhZ2VudDogRml4IG5vdCB1c2luZyBjYWNoZSBmb3IgcGluZW50cnkg
bG9vcGJhY2suwqAgW3JHZDRiNjA4YTMxZl0NCj4gPiDCoMKgIC0gYWdlbnQ6IEZpeCBjb21tYW5k
IFBVVF9TRUNSRVQgYnkgc2F2aW5nIGlucHV0IGxpbmUuwqAgW3JHMTg3NWJjMTg1ZV0NCj4gPiDC
oMKgIC0ga2V5Ym94ZDogTWFyayBrZXlzIHNlYXJjaGVkIGJ1dCBub3QgaW1wb3J0ZWQgdmlhIExE
QVAgY29ycmVjdGx5DQo+ID4gwqDCoMKgwqAgYXMgZXBoZW1lcmFsLsKgIFtUODA0OF0NCj4gPiDC
oMKgIC0gc2NkYWVtb246IEF2b2lkIGJ1ZmZlciBvdmVyZmxvdyB3aXRoIFNDLUhTTSBjYXJkcyBw
cm92aWRpbmcgUlNBDQo+ID4gwqDCoMKgwqAga2V5cyA+IDJrLsKgIFtUODI0NF0NCj4gPiDCoMKg
IC0gZGlybW5ncjogRml4IHVuaW5pdGlhbGl6ZWQgdXNlIG9mIHRoZSBkbnNfYW55IHVuaW9uIGlu
DQo+ID4gwqDCoMKgwqAgZG5zX3JyX2NtcC7CoCBbVDgyNTFdDQo+ID4gwqBSZWxlYXNlLWluZm86
IGh0dHBzOi8vZGV2LmdudXBnLm9yZy9UNzk5Nw0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJv
bGFuZCBLb3ZhY3MgPHJvbGFuZC5rb3ZhY3NAZXN0LnRlY2g+DQo+IA0KPiBTb3JyeSBidXQgdGhh
dCBVUkwgYWxzbyBjb250YWluczoNCj4gPiBOZXcgYW5kIGV4dGVuZGVkIGZlYXR1cmVzOg0KPiA+
IMKgZ3Bnc206IEltcGxlbWVudCBHQ00gZW5jcnlwdGlvbi4gTm90ZSB0aGF0IGRlY3J5cHRpb24g
d29ya3Mgc2luY2UNCj4gPiDCoMKgwqDCoMKgwqDCoCB2ZXJzaW9uIDIuMy4yLiBbVDM5NzldDQo+
ID4gwqBncGdzbTogTmV3IG9wdGlvbiAtLWF0dHJpYnV0ZSBhbmQgc2VydmVyIGNvbW1hbmQgU0VU
QVRUUiB0byBpbmNsdWRlDQo+ID4gwqDCoMKgwqDCoMKgwqAgYXJiaXRyYXJ5IHNpZ25lZCBvciB1
bnNpZ25lZCBhdHRyaWJ1dGVzIGludG8gYSBzaWduYXR1cmUuDQo+ID4gwqDCoMKgwqDCoMKgwqAg
RW5hYmxlZCBvbmx5IHdpdGggbGlia3NiYSAxLjcuMCBvciBsYXRlci4gW1Q0NTM3XQ0KPiA+IMKg
Z3Bnc206IEludHJvZHVjZSBzeXN0ZW0gYXR0cmlidXRlIF9zaWduaW5nQ2VydGlmaWNhdGVWMi4g
W3JHMDMzNWE5Y2IwNF0NCj4gLi4uIHdoaWNoIGFyZSBuZXcgZmVhdHVyZXMsIGFuZCB0aHVzLCB0
aGF0IHVwZ3JhZGUgaXMgbm90IGFjY2VwdGFibGUgZm9yDQo+IHN0YWJsZSBicmFuY2hlcy4NCj4g
DQpVbmRlcnN0b29kLiBKdXN0IGZvciBjbGFyaWZpY2F0aW9uLCBvbmx5IGJ1ZyBmaXggcmVsZWFz
ZSBpcyBhY2NlcHRlZCBmb3Igc3RhYmxlIGJyYW5jaCwgZXZlbiBpZg0KdGhlcmUncyBubyBiYWNr
d2FyZHMgaW5jb21wYXRpYmxlIGNoYW5nZT8NCg0KSSdsbCByZW1vdmUgdGhlIHJlY2lwZSB1cGRh
dGUgYW5kIG9ubHkga2VlcCB0aGUgQ1ZFIGZpeCBpbiBWMi4NCg0KPiA+IC0tLQ0KPiA+IMKgLi4u
L3JlY2lwZXMtc3VwcG9ydC9nbnVwZy97Z251cGdfMi41LjE3LmJiID0+IGdudXBnXzIuNS4yMC5i
Yn0gfCAzICsrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+IMKgcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL3tnbnVwZ18y
LjUuMTcuYmIgPT4gZ251cGdfMi41LjIwLmJifSAoOTUlKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMTcuYmIgYi9tZXRhL3JlY2lw
ZXMtDQo+ID4gc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUuMjAuYmINCj4gPiBzaW1pbGFyaXR5IGlu
ZGV4IDk1JQ0KPiA+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
XzIuNS4xNy5iYg0KPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Z18yLjUuMjAuYmINCj4gPiBpbmRleCBmZDY1ODg3NjljLi5hMWE1MGUyMzg0IDEwMDY0NA0KPiA+
IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4xNy5iYg0KPiA+ICsr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yMC5iYg0KPiA+IEBAIC0x
Niw2ICsxNiw3IEBAIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgdGV4aW5mbyBwa2djb25maWcg
dXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuDQo+ID4gwqByZXF1aXJlIGRyb3AtdW5rbm93bi1zdWZm
aXguaW5jDQo+ID4gwqANCj4gPiDCoFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dudXBn
Lm9yZy9mdHAvZ2NyeXB0L2dudXBnLyINCj4gPiArU1JDUkVWID0gIjM0M2QwY2I4OTEwNDQxYWE0
NGM1NmNlODY3M2E3OGUxMzcwNDBjODciDQo+ID4gwqBTUkNfVVJJID0gIiR7R05VUEdfTUlSUk9S
fS8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci5iejIgXA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZmlsZTovLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNo
wqBcDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMS1Xb3ZlcnJpZGUtaW5p
dC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2jCoFwNCj4gPiBAQCAtMjQsNyArMjUsNyBA
QCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiDQo+ID4gZmlsZTovLzAwMDEtY29uZmln
dXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vcmVsb2Nh
dGUucGF0Y2giDQo+ID4gwqBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6
Ly9yZWxvY2F0ZS5wYXRjaCINCj4gPiDCoA0KPiA+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmMx
ZmJlMjBlMjk1OGZkOGZiNTNjZjM3ZDdjMzhlODRhOTAwZWRjMGQ1NjFhMWM0YWY0YmMzYTEwODg4
Njg1ZCINCj4gPiArU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY0NjEyNjZlOTljMzA4NDE5YTM3OWFi
ZTZjMzU2ZDU0YzIxNDEzNmM0NTg5YmQ2NTk1MTA5MTEzODk4OWZmYzYiDQo+ID4gwqANCj4gPiDC
oEVYVFJBX09FQ09ORiA9ICItLWRpc2FibGUtbGRhcCBcDQo+ID4gwqAJCS0tZGlzYWJsZS1jY2lk
LWRyaXZlciBcDQo+IA0KDQpDaGVlcnMsDQoJUm9sYW5kDQo=

