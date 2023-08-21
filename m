Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E47EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 21:46:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.3400.1692654390442683629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 14:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=aFvGIEEB;
 spf=pass (domain: siemens.com, ip: 40.107.7.42, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBUBkIo+xIVsN+ASODHA8IBhE9jGiltRqrcl3QEyyvomcgH5WYxHy6DVnkkFa89qtEnBulMxZnFwU78ww7TWYqnWbLzzNNj5IKT1BTqM116rg/BRWNe9NtY1wbenWOMaEKrYPKqQTfNGDjR2kAoP7/ZEkHeDuAlU1BwqNjYvuLVG/gXZaHbYunudQkuX3PY07reebv8UjFju+DKW1bxM2R44U8F39StjqICOkzhbaDF5sb4Ob8xMQNGspXGgrBI2vUljGgvHc4FvQN8Uf5VqN9M0d9ucM1Zp9efpSRc1W5p35KowsCnaqK09aGi4Q7i7aSBqkbW40PPPZganeF0yKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrzVIRHoSLH7XEbj4fCKKoc8eINheJ688Qx7uZplLwM=;
 b=HVoN32wIOqt+Zj8Y9cQEHtFipPHq9m2oo63MowvzBLfPTFOqelXyLYhHxBBuiyGRziuq8jhcNN280kr8bhM/2uD4WNGHU/Lvpi4XhcFsZjYRnb04ey9QiLMZsu91fuAMVUeLJ+BUmF4NFEwLa3be203RSdjOYzTtKRqpA4m2gZiOwOxYmjG59nthg4Uao9QEk/+Z70RqkcKDlD1qLYEGxinMbLKpoTAoRQw99BcOpiK5N9/6IQ6VkiKTY+xvhgYrbXkxnAhlUgD77s4FFO04hmQiGvADRp7oLZbxn6A1S4WTIYj/z23ggTK4kyj5k/c8QcgmY3AmqtvQdGJ6xtPeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrzVIRHoSLH7XEbj4fCKKoc8eINheJ688Qx7uZplLwM=;
 b=aFvGIEEB+I5R7xri54nka10RgLxR612g8ISl2l37stGWUiGHAzS7uX2xYi3QGW8WcQ1tphfTh72aRARwlcZT7esMszh0MlJUxpkAtP1CNo1WqXme4+sG/o8eQi2AbO8RLu7CmWket0Vj7VjluvR0aDHpE7fSgNDMlmz7UnUgKn32M+9qeSCSKsrkxlj75u/DrV61oPjDdKtM2Isd6kG3Z/fAl+TgaF/DahdjSgLNZcJDj0Zc3EqZT3aabE0wTkkfoXPMMGFeJePIHeRSElIOBBmNxWLg9FL/k4UDPBp2dr692ZL2FQW1Ug3IKyNuI3Ry3KoNtpcn6n7xCmjvk84nkw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB9PR10MB5402.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:335::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 21:46:26 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::77c1:eea3:2260:bd9b%6]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 21:46:26 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 02/14] build: vscode configuration
Thread-Topic: [OE-core] [PATCH 02/14] build: vscode configuration
Thread-Index: AQHZ1EouY1Ky+eS+70C2ieKwsOSzeq/1KpcAgAAesoA=
Date: Mon, 21 Aug 2023 21:46:26 +0000
Message-ID: <a76ad1f4279c33a470050da46395839096c3cf58.camel@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
	 <20230821161120.171956-3-adrian.freihofer@siemens.com>
	 <20230821215634.349b3509@booty>
In-Reply-To: <20230821215634.349b3509@booty>
Accept-Language: de-CH, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB9PR10MB5402:EE_
x-ms-office365-filtering-correlation-id: 680737de-1d28-4dcc-b2ec-08dba29011f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9zg2PjnCd7nNyshnhJ375/LdYWyrZ5jGsm8u4lSeA6xRNDavYx8YKM0x/YBOfFVAJ57R/ToQwkPrtP0AGiAvwqBAcKyN5jHIPNuVSvu4YSMSlzcgUatXQDkeawmymqJaOt3BjFrgf1osx/Tv72u0pvtuqGBvZl6WgrS0VYsfIPtwaJ6s+l71ieazRIzcfHvVOsFOAos+UdsVUT5daIKAtOJFzDD5TIF0IPjFX5Wglyg5cKrqUwTRtDXtOQGNm5vRgivy1iWO5NRWNRBgdCcKARji2vO6Z1pO1Z8UuBqw63KUPMEA8r04rCXeEi8dhxpqbJI7logdW8OBVBguOQBq/KZZ+EmlMPhaG7fBLeM/zzy7tjLuF/8uo0dDPRKJ5UaCYMRtKe1AJGUkRmreFVmwnTqTIMpraiBFttk6ow1KjwxjDabAkt4xGkiOnbKqHEboHU80HYH0hWLgNJpaLHQH3g6W4URM/Fdnd+fLakwBrOr0QXobi0BT6RHQcTuzDEd6PGv3LWHzCAJ63I9zyNEmGs11C1cnPJPWEXb3FfX/bzbzlofMct8ufDw/h26h5kRTFOI4oCD5DoTC4PsjoLlJzlmvb+HJWQu7Xs9d0FG8Rq6H4Hpi0NrTo72K1DSVJsSV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(83380400001)(6486002)(38100700002)(6506007)(38070700005)(5660300002)(86362001)(8676002)(8936002)(2616005)(4326008)(66946007)(316002)(6916009)(6512007)(66446008)(66556008)(76116006)(66476007)(64756008)(91956017)(82960400001)(478600001)(122000001)(71200400001)(41300700001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VUtPUElmNGozRVV3R3F5eHAwMHhTNXllNzR6VDdKVEROWjgyak5taW5sS3pH?=
 =?utf-8?B?b3cyYXlTT21hYmI5MXlIODNHZXJkSFdmNHlwcDlTSllWV1lFNUpaZkRvN3dB?=
 =?utf-8?B?dUUrRm8xOEQ4Um13dG5VV3l5TUtKREUxN3pHN2VZQ0p6bHZoa2lCOEltR2tM?=
 =?utf-8?B?NTBvRUFCKzFKUWluQkllRTNJUmY5S1dMNXg4QWY5MHREZVUvWGo5bHRvYjRY?=
 =?utf-8?B?WFpVODFydWRLOURPWFFmWHk5QVZ1NUlVaVVxNHRUQmJoNEcyTE5iTzJqb2ZB?=
 =?utf-8?B?bDRkWGlGK0JYeFYxV2FEMHMzd254bmdlSjZYdjhicFQwZGtBK0wzUlYrT3hU?=
 =?utf-8?B?R2h1RkY0UGVmbTgxVEhFV243NEZ6R1BxUXpDMENFNVJpSit1c2JTT2NCOFNo?=
 =?utf-8?B?WGZkK0c4S0pKUGNDZDNDMUIvSWUzM201VUthakpCQ2hqalFJNjdLeC9kV29o?=
 =?utf-8?B?OFJZei82d2VwVkpDd0VvOUlQT1FyNkt0YWlYcnB3TDZXRWp2UzFuNGZvYjV6?=
 =?utf-8?B?MzhpZVNGTVhSMGNYQ0F4c1NkeCs4aVBqOGNXbStqN2NQSDhodFM1TGF3MlAz?=
 =?utf-8?B?VEs1aUtYbkJSL1ZWQjI4N0ZDdUZZcG9tNnRoS242bUpzRmhpWUIvRTdpaGUr?=
 =?utf-8?B?WW5XdFhFenBZOWcxTzVwUHdNSkM2S1hzd1ZPZGJOSTEzR3dVUC8raXg0ZWhS?=
 =?utf-8?B?WUlZWW5tdStQL25BQzRIOTdUd3NIb3JXRDJrK3pBL085VllXT3dLVXB6dCt4?=
 =?utf-8?B?bTBTKzY2MW9hU2g2VVRwdDZRWC9PRjc1YUpQWGtjWDNCS1IyWnUxemYxdHZ1?=
 =?utf-8?B?UXRjTzUveTRHVklVWjluUHNGejRka0g2aWt6RW9hNHRnMldreWQ0RDBZdUhB?=
 =?utf-8?B?Tkw5UGttc05TeEVsQ3pQb0QyWmlTSnVnZkhSOVF1WlJ1TXhDQ2p6K3pWT1l2?=
 =?utf-8?B?dDJHSTBPeVVEZFpVZFZmWTQ3bWJoUFphNGhDNWkzaDNtQXQ4WW1NMjVkZWhW?=
 =?utf-8?B?OWRBT2hIRVYvRVpIS0RjUDA1aTNJU2JvbTdVSVVEelF1MmZqcEhkejlGOWR2?=
 =?utf-8?B?a20rTUp5QVMwS0lGcmNOdDBmVEdQRVA1OXg4czJlbnRzUmp6OW44N014OGQv?=
 =?utf-8?B?NDAwSXIrSHNnWWhGbERMMGJCVkdDeGhvc2pOUm5YQTg3dUtMNXlhQ2t6MVVv?=
 =?utf-8?B?Y0pPMnJaMzV3ZzBoNWVyaTNxc1ZRNURDdVpZVm9KelJUTmJqQk1raUdSRTl3?=
 =?utf-8?B?Ui9pR1k5ZTdIMVpVaUMzNDBIcVhRcURKYmljaEtIYitoQ2RxTWRrVEliV05q?=
 =?utf-8?B?M2xiR2N6cDZUQ0k0NlNjN0NSalJXK2pZZGx3Zml2QjN4VjJnWVdKNXdxTDFT?=
 =?utf-8?B?Qmt6bHk1TldqelZjYTRMSU1uZXJzNzEza0VZNysyNURGWlZXSmx6WTJ6WFFN?=
 =?utf-8?B?bTIvQ1pHQjVKSkwveUFqLzcxRHd0K0pUZjJ6MlNZYVFGVVI3TWlMT1pnOWJP?=
 =?utf-8?B?UnVUdzVTR0NHU2xuTDcxbXZ2ODgybEVBWXdrQnJPVzVZWHhrdWNsLzhxSlVN?=
 =?utf-8?B?VHJDOUR5N2pzR1BCaXVvOGVEb2dSTDVPc09SSnRmM2dkMDdici84VWE1d1JJ?=
 =?utf-8?B?Q3VvYklZZ00vYjVxMnByTUFkS2xaczA5UlZNbFpTaWhic3ZTaFg4ZEl2Yzkw?=
 =?utf-8?B?eUxXQzV4OTRSWCtPUHFEVm5nc1h2WXM1ZGduRlIzdTI5a1pLVXVva2o3dmMr?=
 =?utf-8?B?NHo4U2hvL1grVVM0VTYzSXc2aG5KRy9SSUVJUi9wVURjZjJPZTVIZzh6NVRo?=
 =?utf-8?B?MFBVL1RMNDlpMG9UTFZldmk5dVlqSG1PcHdvRXZHRjlGdUpwZ1R4UHZxc1o1?=
 =?utf-8?B?RFd1RjBJaEtkYml6UjlMNHo0d0p2V1liVmRTcmhtWHFmZ3JNZzQrSFdvVjBz?=
 =?utf-8?B?RERMQzQ4Nld1ZDdLRWQ5Z3ZyRGRkZ3poYkZDWng2TVJmTzB2OFlpeWlQSnlt?=
 =?utf-8?B?dWtpS3NRYkJ2a1JGUlROOC81ZE5Wem9oc284RHQ2R1orMjNhM0hDeWdMVmhH?=
 =?utf-8?B?YzJlNHU1bVZwWVdmNVlIYVVzL21jazArUEprbEtXd1VPVkpDN1hVOHZLNlQz?=
 =?utf-8?B?QkJJb2ptOVRXb3F6N0lteC9LSWNwOW1oM29sOEdhVmhuemhVQUdzakt5SW5X?=
 =?utf-8?B?OFR1V0FFa3pleEVlY2psTkc2cjk1aHJPN3MrMStDMzYwVVUrNW1adXdnZlNR?=
 =?utf-8?B?eWU3WmVBUk5CNXR2czh2L3NUODRnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <321132B8CA85ED4982711A58446261E6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 680737de-1d28-4dcc-b2ec-08dba29011f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 21:46:26.2932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dXEO2JHX6ei/AmTx1UhQw1pNI4og4XvUx0SuXEiBUsIUgs2LIn2eboMVgITZ+ZPTm7YdkogX8v+70c0OZynLZUzFzf8lZjztLbGaxKaUIFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 21:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186485

T24gTW9uLCAyMDIzLTA4LTIxIGF0IDIxOjU2ICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0K
PiBIZWxsbyBBZHJpYW4sDQo+IA0KPiBPbiBNb24sIDIxIEF1ZyAyMDIzIDE4OjA3OjA1ICswMjAw
DQo+ICJBZHJpYW4gRnJlaWhvZmVyIiA8YWRyaWFuLmZyZWlob2ZlckBnbWFpbC5jb20+IHdyb3Rl
Og0KPiANCj4gPiBUaGlzIGlzIGp1c3QgbXkgc2V0dXAuIEl0J3Mgbm90IHN1cHBvc2VkIHRvIGJl
IG1lcmdlZCBpbnRvIHBva3kuDQo+IA0KPiBJZiB0aGlzIG5vdCBzdXBwb3NlZCB0byBtZSBtZXJn
ZWQsIGNsYXJpZnlpbmcgdGhhdCBvbiB0aGUgc3ViamVjdA0KPiBsaW5lDQo+IHdvdWxkIGJlIG5p
Y2UgKGUuZy4gYWRkICIqKioqIERPIE5PVCBNRVJHRSAqKioqIinCoCB0byBub3Qgb3Zlcmxvb2sN
Cj4gdGhhdCwNCj4gYXMgd2VsbCBhcyBtb3ZpbmcgdGhpcyBwYXRjaCBhdCB0aGUgZW5kIG9mIHRo
ZSBzZXJpZXMgSU1PLg0KDQoNClRoYW5rIHlvdSBmb3IgdGhlIGhpbnQuIEkgd2lsbCB1cGRhdGUg
aXQgYXMgc29vbiBhcyBJIGdldCBtb3JlDQpmZWVkYmFjay4NCg0KQnV0IHdlIHNob3VsZCBwcm9i
YWJseSBkaXNjdXNzIHRoaXMgYSBiaXQgbW9yZS4gV2hlbiBWU0NvZGUgaXMgdXNlZCB0bw0Kd29y
ayBvbiBhIG1ldGEgbGF5ZXIgKGUuZy4gcG9reSksIHNvbWUgaW5kZXhlciBwbHVnaW5zIHN0YXJ0
IGluZGV4aW5nDQp0aGUgY29kZS4gSW4gdGhlIGNhc2Ugb2YgYSBtZXRhLWxheWVyIHJlcG9zaXRv
cnksIHRoZSBidWlsZCBmb2xkZXIgY2FuDQpiZSB2ZXJ5IGxhcmdlIGFuZCBpdCBpcyB2ZXJ5IGlt
cG9ydGFudCB0byBjb25maWd1cmUgVlNDb2RlIHRvIGlnbm9yZQ0KaXQuIE90aGVyd2lzZSwgdGhl
IHBsdWdpbnMgd2lsbCBydW4gd2l0aCAxMDAlIENQVSBsb2FkIHVudGlsIGFuIE9PTQ0KZXhjZXB0
aW9uIG9jY3Vycy4gSW4gcHJhY3RpY2UsIHRoaXMgbWFrZXMgVlNDb2RlIG1vcmUgb3IgbGVzcyB1
bnVzYWJsZQ0KZm9yIHdvcmtpbmcgd2l0aCBZb2N0byB1bnRpbCBhIGZpbGUgbGlrZSB0aGUgb25l
IGFkZGVkIGJ5IHRoaXMgcGF0Y2ggaXMNCmRlcGxveWVkIGJlZm9yZSBWU0NvZGUgc3RhcnRzLiBB
bmQgZnJvbSB0aGUgdXNlcidzIHBvaW50IG9mIHZpZXcsIGl0IGlzDQpub3Qgb2J2aW91cyB3aHkg
dGhlIHN5c3RlbSBydW5zIGF0IDEwMCUgQ1BVIGxvYWQgYW5kIGV2ZW50dWFsbHkNCmNyYXNoZXMu
IEluIG90aGVyIHdvcmRzOiBJZiB5b3UgZG9uJ3QgaGF2ZSB0aGlzIHBhdGNoLCB5b3Ugd2lsbCBo
YXRlDQpWU0NvZGUgYXMgYSBZb2N0byBkZXZlbG9wZXIuDQoNCkl0IGlzIGV2ZW4gbW9yZSBtaXNs
ZWFkaW5nIHRoYXQgVlNDb2RlIHN0YXJ0cyB0aGUgaW5kZXhlcnMgaW1tZWRpYXRlbHksDQpidXQg
ZG9lcyBub3Qgc3RvcCBvciByZWNvbmZpZ3VyZSB0aGVtIHdoZW4gdGhlIGlnbm9yZSBsaXN0IGlz
IHVwZGF0ZWQuDQpJbiBwcmFjdGljZSwgdGhpcyBtZWFucyB0aGF0IGV2ZXJ5IHRpbWUgdGhlIGln
bm9yZSBsaXN0IGlzIGNoYW5nZWQsDQpWU0NvZGUgaW1tZWRpYXRlbHkgc3RhcnRzIGluZGV4aW5n
IHRoZSBidWlsZCBmb2xkZXIgdW50aWwgdGhlIE9PTQ0KZXhjZXB0aW9uIHN0b3BzIGl0LiBEZXBl
bmRpbmcgb24gdGhlIHN5c3RlbSdzIE9PTSBoYW5kbGVyLCB0aGUgZW50aXJlDQpidWlsZCBtYWNo
aW5lIG1heSBjcmFzaC4NCg0KUGFydGljdWxhcmx5IGFubm95aW5nIGlzIHRoZSBQeXRob24gcGx1
Z2luIHRoYXQgaWdub3JlcyB0aGUgZ2VuZXJhbA0KaWdub3JlIGxpc3QgYW5kIHJlcXVpcmVzIGFu
IGV4dHJhIGlnbm9yZSBzZWN0aW9uLg0KDQpIb3dldmVyLCBwdXR0aW5nIGEgc3RhdGljIGZpbGUg
aW4gcG9reSBkb2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QNCnNvbHV0aW9uLiBEZXBlbmRpbmcgb24g
dGhlIHNldHVwLCB0aGUgY29uZmlndXJhdGlvbiBoZXJlIGlzIG5vdCB2YWxpZC4NCkEgYmV0dGVy
IGFwcHJvYWNoIHdvdWxkIGJlIHRvIGhhbmRsZSB0aGlzIGluIHRoZSBiaXRiYWtlIHBsdWdpbi4g
QnV0DQpldmVuIHRoYXQgbG9va3Mga2luZCBvZiB3cm9uZywgYmVjYXVzZSB3aHkgc2hvdWxkIHRo
ZSBiaXRiYWtlIHBsdWdpbg0KY29uZmlndXJlIG90aGVyIGluZGV4ZXIgcGx1Z2lucz8gT3RoZXIg
aWRlYXMgd291bGQgYmUgdG8gaGF2ZSB0aGUNCmNvbmZpZ3VyYXRpb24gZmlsZSBnZW5lcmF0ZWQg
YnkgdGhlIGxheWVyIHNldHVwIHRvb2wgb3Igc2ltcGx5IGNvdmVyDQp0aGlzIHRvcGljIGluIHRo
ZSBkb2N1bWVudGF0aW9uLg0KDQpSZWdhcmRzLA0KQWRyaWFuDQoNCj4gDQo+IEx1Y2ENCj4gDQoN
Cg==

