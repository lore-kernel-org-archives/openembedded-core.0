Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71619CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:55:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.web10.1311.1758642894038721232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Wm5nbvzE;
 spf=pass (domain: axis.com, ip: 40.107.159.20, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxP5znDhvpeuMdVtfk+frOQZAIJEDBDQCl8eu5tJRk9RYHylnqlXdEoq55PJQUc84fkb+8MH8Qre/kYt/fqdpTMO5yGSP4awFePK4DvKK0zngJiyl6Z46HgCWHNBoqS2L+H2iRdIlh0MLqvQpfpSfRfkjOCXMsfQoknt2F0Zi0RSFFoawlvL388cldnpj+/3BtSeGVKOfHsOmDvTPSKjasho4enaEDpq3oYPDW1e2vig7rsB3qJnvD+lXp9AERPe4jueptcYJsxaO9LrPKHl5r+ewmx114RU6xHJVwuY9i33urkLQYBUax9w5uacECRm0RZ0zTgA9k5Eh/u8/9ltKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq6mJoZ1vchTiLcxrExXdARXOUhC/CXgvS1nOLICRJI=;
 b=V0K70G+HOCcYLzxAdXHQZdoFRHMDdv9Oj5AQuwHiiQzeGjmvWXpg7YS8xwcHweyMI1qIIcGT0smNMsYtkJZ9RO/rGLjy85dsO/NntDjWZNHhOZuc7VyGr2VqTvdkTA6p5ba7pvMq/Pzy1okTsl1izVUtklyCR5nFCnsVEfuJWJScl2je9Yor3u39AZfU2NDeQeP+l2UvM/gOvQmrggQHu8sc5HWi5deRMT9CLCPHB6IvCyqTapVA721jhPj6XuP3U41NVIQo+atI9IoJoBnrh06xgoC2NDoqrrD1j2dAIRPGhX6CzJ1YTZ/tiuvuqllkxFiWYYXc8tn9TGjGYpjjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tq6mJoZ1vchTiLcxrExXdARXOUhC/CXgvS1nOLICRJI=;
 b=Wm5nbvzE/Q+oG1zxC9gcNxqe9c6DbZQrJgCZEvExYMQJ0m+p36viT/Hz19oFd6dbkhHQjHHYCsK81cox5Z1Mxs3kMWaCklz8de5dl7rfG5Tcm72gvvGjc8wygaujrehumh2YGRNsW6jNRm2Dch0dKPBizC5LJZamMS21CmtTdlY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA1PR02MB11235.eurprd02.prod.outlook.com (2603:10a6:102:4ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 15:54:43 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:54:43 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: Daniel Wagenknecht <dwagenknecht@emlix.com>, Adrian Freihofer
	<adrian.freihofer@gmail.com>
Subject: Direct expansion of vars in inline Python expressions (was: RE:
 [PATCH] os-release: do not add empty parentheses to VERSION)
Thread-Topic: Direct expansion of vars in inline Python expressions (was: RE:
 [PATCH] os-release: do not add empty parentheses to VERSION)
Thread-Index: AQHcLKJg4Cs4CvSWgku6swXmmeXDwQ==
Date: Tue, 23 Sep 2025 15:54:43 +0000
Message-ID: 
 <DB5PR02MB102132147F6782893926F08E0EF1DA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250912161917.844344-2-dwagenknecht@emlix.com>
	 <DB5PR02MB10213CC660236ED26287025A1EF0BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <ca7c6bc4f4f80fb260758915c379385fca211419.camel@emlix.com>
In-Reply-To: <ca7c6bc4f4f80fb260758915c379385fca211419.camel@emlix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA1PR02MB11235:EE_
x-ms-office365-filtering-correlation-id: 460a1e48-13e2-4566-ea0d-08ddfab98330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NEhETVlVNUZaZnhCaFMrNDl2RGxzQWY0aWVjeE5EV3FwQURzNEIrbDdWckc4?=
 =?utf-8?B?V091bGlBMXVQZ2gvQk8zaWhCelN0eEh2aG1RY2JmNEIyVVpGR1hoZHhSeXBT?=
 =?utf-8?B?UTlvcHc5QjZDallrOVBIMENPYnIrMHcrL2dTWnFkbGZnK1luTEFKQVNrNjVY?=
 =?utf-8?B?aHBuNnI3UTJidXB1UDBQZEJ0ZUlmZFVCVDN2dUNwaVpmSTU4WXN3ajRhTHFG?=
 =?utf-8?B?MXNKK3dUMERlZ29qZFI4bit2a250Mkt3OWxxM3hvdjNmRkNkV29hVTVaVk9K?=
 =?utf-8?B?Q3NoWUJqN0Zqc0VuV2ZnQWJ6RW4xdnBrYlRUeXQ3MDJkTXRINWIxUVFrWW9Y?=
 =?utf-8?B?RVNuZmd6WTl5RktVZ2ZRZUVTQjR6eFZRa0FrNlhBY1pxQTd2Y0tRL0hhTk1l?=
 =?utf-8?B?ZVhQcGFadTd0UWlNUlJlTW1BR1FCT1JjMTVvRVpzdno0YjNMdllsZlptRmMy?=
 =?utf-8?B?NkNvM0dMeTVaUzVudTNDbksyUHpPRnY2Sk5UYmc4MzM5RnlYTWQva3o1Y0Fr?=
 =?utf-8?B?SW1pVVlhcHh0aDg0RHlGZFhmb0Z2YUc3aE5NMVBjZkw3OTFkTWI3QXphVGYr?=
 =?utf-8?B?L0VHOVNmenU2RTFXT1pXZEZtc1E2MFVodldabmlLc3hZWnN0clhQVjYzdXMw?=
 =?utf-8?B?VEVFUkNXQWl1MHllNkdMaU8xK3FRak90RWNTVmdWSVlCWVA0QnFHNFF3dXZj?=
 =?utf-8?B?VEhjZm1DLy9sRDE3K0puVnk0U09NTjU0S05DVlRSbC9JOEgrNWg0WUMvbmFO?=
 =?utf-8?B?VElVVkFxSVJEMVBVcHRWRXhxTGhjYUdDWlpSOHR3UGVmRjdlOTJwUWdyaWRo?=
 =?utf-8?B?REd0QlFYekN2KzM2Z2FEajVCNmV5cjlLOHE3ZHVmSFIvamtvYkRtS3pmM3BU?=
 =?utf-8?B?R3R1NjcrOE1LSmZwUkZlMmR1ZW1uN0c3YTQ3dmJHdHdqdmpYMm1UdnR5NDJ5?=
 =?utf-8?B?Z2p0NFA0Ri92Wkc4MW1STC91bXVnOWE3MGpSbkxva2U1YW5LcHBEUUR2UDEx?=
 =?utf-8?B?TlhBVnhhKzBFQmhVMUlUZ1JoZHpSZkNGdjdnTGY0L2JOUWtPY3NMTGlsalpp?=
 =?utf-8?B?bWZLaHBwN3k3cXNoaEFBa0swQ0lhK3I3OUpvMTRFeUJnKzB5N0ptSHloc2hF?=
 =?utf-8?B?bkJhMUlVbmhuWE5IcTJkd2dkTXdxTW51U1lzZmcwQlNXenA3OE9QZVRSQkpW?=
 =?utf-8?B?bGpzSE1jTG8vT0hVdlBRSTBjSC9zbWlhaWxYYXY2d2ovRDFoR3BWOUdab2tD?=
 =?utf-8?B?ZERSL0E5OFFUaXdGeHk4TUJmdE5wRml5Zm5CSHM3U2tHMFBvaGlQNVlPNXVw?=
 =?utf-8?B?YlY3V2w4N2F1NkFEYWpCNG1SUklMcU56dXJkS3plMjhtVWorT2RRMjVGYnI0?=
 =?utf-8?B?WVpreXlWUUFQTXZPZFdQU0ZwY1RpVFk2eFpPSm5rL1FlUHdwRG9IVzRZZWYw?=
 =?utf-8?B?L3d2cXMzTWxXRGp6cWpsd0IvdHY2ODlXbDNWQS9sbzJhYzVKS2pxekhDa01S?=
 =?utf-8?B?clhMUmxsRzBsV2tIalcwck9TVVdHV2FLTFhKYVQ5VTBNSE9LVy94MlVFOXdS?=
 =?utf-8?B?S09xdVl3aGdwbW9OaVhlSVoyTmJTMFRIeGc2cXkxZ25Eamg5WlhjNEpFTVFQ?=
 =?utf-8?B?dGtzZWJDRnZwaGh3OTJ5RUpJT1FwQTVjcEJaMzJ5eEZjT00rRVJnWnZ2aWNl?=
 =?utf-8?B?bFZkQ3MxZDJNZGJVTDM4TllMd015QTRFTGxQRlZuQ2ZST1M1NngxN3I2VGov?=
 =?utf-8?B?Y1ZuMEhZcXhYSFN2c1MvMElnY3cwWVZCYzV1SjBkU1p4NldsK0s4QllNdmxG?=
 =?utf-8?B?UkhtelpMTlIzeDZiMXRGYnpZbHowSFdkMk5pckNlU3hxR1FxMkdGay9KWFpy?=
 =?utf-8?B?a2NlZExXYytoOXJOdjd2di9zY0NmZ2JBRU1ieDJpQWlhOHpVUTJZMDFDNVJP?=
 =?utf-8?Q?f4M6iYTmvLo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RXBIbjU0bWw1Vzk3QVpBWHVzaGNxY0gvME9wcDBwTFZZWGs5aHU2ak9FZjAx?=
 =?utf-8?B?eCtQNmtKSnhReHRhUERocjhOU0NWV1lnWUtiRFI1b3FzTHdKRHFuNDFkbWRP?=
 =?utf-8?B?QXdSb1NFOERWbk9XbXlIWFA3cmhnbUdRa3ZYZjczc2VOU1lLZ2Q4bHpFY0NC?=
 =?utf-8?B?Z0RRTjJxOHM2VHFvUk1JQlR1R25SNVcvdVVia0I3Nm9yWCsrQUY1RVFtNW0v?=
 =?utf-8?B?bFp6ellHTlFPNlBCbUtiT3h3em9reXJ0NnpDcnNodDZvYUJYelZydVBEdWln?=
 =?utf-8?B?eE52TXdZbXBPb1BoaHRnTG5LaTN0T0M3YXNLSFBlL2JOWHNKYzdzZU1vZlVy?=
 =?utf-8?B?elNEMTRoSlZzdUs3dDlIQjVidkhaR25sZ0JrMFQ3N3lXL2diS0VCb2M0a2x1?=
 =?utf-8?B?QXRuTnluRlJYTm9ib3RVbStRYk1SNGtCK2tMRTQ5Y05JTzR4OGZYNG1GMkxM?=
 =?utf-8?B?clhtNVowOXBnbHF2eXViYVEza2Q4VFF2ZkUyVXFTMzBhV21sTWQ5bHFaRnJ1?=
 =?utf-8?B?YjY4Skt3RElSdVN6TUswcU9DSzlOVmdFOEh5c0lUcTBnbzhJVkZEUjZtR3lS?=
 =?utf-8?B?Q3QzYTlFUk0zVWxTTkJlSmFlL1krTjM5VjJPOTB6WTlQd0I0RG1lQzBJbmps?=
 =?utf-8?B?bGZiQ3Z4OWtQaUFnSEJRM21aMDJkd25FeXVlTUhPZGFxR0FpZkpiSkxMRFVL?=
 =?utf-8?B?ZGppL2E0TS83ZC8raDJ2YVBmY1RzMThoajFVZU5GVWpYVU9GTkJUNkZ1YXhK?=
 =?utf-8?B?eGx2U2JxYUE3TVI3emRSK2paVE9vUlNtVlVGMHBib1M5V2xGZmZpSHN1eXov?=
 =?utf-8?B?aWdmajZ2TURpWXBFL3M1TmZyQVlUeVZ3NVdSWmJBLzJGbTBWWmE4bllXcGI3?=
 =?utf-8?B?QTFLOGRPL0FxWjI1NTBBTmtieVNBL1JRVTBISE5ZMGlINEh4bktqaTNHaE5q?=
 =?utf-8?B?T0xicTRmTmFQZkhpK2pLMmh6Sy9XTm84dmFwZXEzeGZ3VlE4Zk50Yk5zdGxt?=
 =?utf-8?B?WW1BRldXQlpXT0JNRjVWTm4xbFRoNlhHOGZDSjlqczg2R3NRb085V0hvbkRH?=
 =?utf-8?B?WkZYVmlKeWE4c2RnWFpOekFpOWJUckY4SDNJVjl6R0Rjcm5sWGVMS01Cakdk?=
 =?utf-8?B?TUlIV3J2aEpjTkNUMEVPMUlZeE1BeFNwSXRYV2xJa3plOFpsMWl3ekVSV2tr?=
 =?utf-8?B?L2krSWNjY3BiWmhCUHJQVUZnNmtuYW9RamRmbHRSOUU4Vk1WY1gvNlBIKzVE?=
 =?utf-8?B?bnM4WFhiWFNoWThxMDk0VTh2MzdhenRiUUdJWGJhbXM0aXFvMzhvYW5vK2NW?=
 =?utf-8?B?dDNlOUp2TzZHdmhRWkZodTAwcDQwNkVobmhkN0l3ME1Gdk5vRlRSUW1jc1o2?=
 =?utf-8?B?VzMxNEp6ZjRJTXV0VWR5NDRuSWFxM0lwY3lYejV1L0JiOWk0SUQ3Sk8ycVow?=
 =?utf-8?B?UU93Ulc1TTF5QzRnTVhRaU5sWUhjRllOdmlPcmFRaEFaZVBzVENCeHdNUW1r?=
 =?utf-8?B?dThNNityYVBqbGdFZWx1RjJxYkRMRi9lRUNXQ25zZHlsTmJHSXVSK1ZjM0Ju?=
 =?utf-8?B?MVY4c0V6Rk5qbloySTJiU0RhM2M3eWtUbFFpd0JPUEQrOWdQUVZ3bTcwdE9n?=
 =?utf-8?B?dmRIZForZFI1ZWFNTGlkcUtYSHlkeUtUN2hNQUJIYnNUMTl4aGhBQ2xNMklx?=
 =?utf-8?B?WjJJVGZ2STBvTVV0djRpR1F4MUYvcDBIL3JhZ0oxT2dNM1IyRGJ6S0h2VWx2?=
 =?utf-8?B?Mjkwb3FweFNrN210QzRqZ2Vqb1dLTFU1amQ2RURhQkhKT3g0ZFBYOUg4L0pU?=
 =?utf-8?B?VWp0U0pjb0FtTFBFUktmMklscmUzVEpTYjRTL3NYNC9oRzlQUnplaFdVN2N5?=
 =?utf-8?B?dGphK3crSGhHM0p3azJQOEthTzBYVHJIeis5djRkOHRUYXRjQnFRSC9LbkZi?=
 =?utf-8?B?amoxbTQwKzRHSmRweEgrSGpsdDdxMkhpOWx3K2wvN3JnQ0FONUFMN0xHQ0RY?=
 =?utf-8?B?cGcwSDNJZ0ZVenUvdTNLaTZ5Mi9jVnlqL3N0K1F2S3JnbU1KS3A4SlFwSytG?=
 =?utf-8?B?N1JsNEFsTUM2S0VZQnBuT1ZyM2tLUVBkYldsUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460a1e48-13e2-4566-ea0d-08ddfab98330
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 15:54:43.3230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lf9H6jtntLrNJCN9ydZ1K2n6Unin40841MvVDNruBMGPnLY4kqGHjJB4G7uzdw6z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223902

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgV2FnZW5rbmVjaHQg
PGR3YWdlbmtuZWNodEBlbWxpeC5jb20+DQo+IFNlbnQ6IGRlbiAyMiBzZXB0ZW1iZXIgMjAyNSAx
MDowNg0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5j
b20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBSaWNoYXJkIFB1
cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0hdIG9zLXJlbGVhc2U6IGRvIG5vdCBhZGQgZW1wdHkgcGFyZW50aGVz
ZXMgdG8gVkVSU0lPTg0KPiANCj4gSGVsbG8gUGV0ZXIsDQo+IA0KPiB0aGFua3MgZm9yIHRoZSBS
ZXZpZXchDQo+IA0KPiBPbiBTYXQsIDIwMjUtMDktMTMgYXQgMTA6MjggKzAwMDAsIFBldGVyIEtq
ZWxsZXJzdGVkdCB3cm90ZToNCj4gPg0KPiA+IFZFUlNJT04gPSAiJHtESVNUUk9fVkVSU0lPTn0k
e0AnICglcyknICUgRElTVFJPX0NPREVOQU1FIGlmIChkLmdldFZhcignRElTVFJPX0NPREVOQU1F
Jykgb3IgJycpICE9ICcnIGVsc2UgJyd9Ig0KPiANCj4geW91IGFyZSBjb3JyZWN0LCBJJ2xsIHNl
bmQgYSB2Mi4NCj4gDQo+ID4gT25lIHRoaW5nIEkgZG8gbm90IHVuZGVyc3RhbmQsIGFuZCB0aGlz
IGlzIG1vc3RseSBhIHF1ZXN0aW9uIGZvciBSUCwNCj4gPiBpcyBob3cgdGhlIGZpcnN0IERJU1RS
T19DT0RFTkFNRSBpcyBhY3R1YWxseSBleHBhbmRlZCBpbiB0aGUgYWJvdmUNCj4gPiBkZWZpbml0
aW9uLg0KPiA+IFsuLi5dDQo+ID4gT3IgYXJlIGFsbCB2YXJpYWJsZXMgaW4gZCBzb21laG93IGF2
YWlsYWJsZSBhcyBQeXRob24gdmFyaWFibGVzDQo+ID4gaW5zaWRlICR7QC4uLn0/DQo+IA0KPiBU
aGlzIGlzIGluZGVlZCB2ZXJ5IGludGVyZXN0aW5nLiBJIHRyaWVkIHRvIHRyYWNlIHRoZSB2YXJp
YWJsZQ0KPiBleHBhbnNpb24gY29kZSBpbiBiaXRiYWtlL2xpYi9iYi9kYXRhX3NtYXJ0LnB5IGFu
ZCBmb3VuZCB0aGlzIGNvbW1pdA0KPiBmcm9tIDIwMTA6DQo+IGh0dHBzOi8vZ2l0Lm9wZW5lbWJl
ZGRlZC5vcmcvYml0YmFrZS9jb21taXQvP2lkPTYwNmZhMWZkOTdjYmQ0N2E2YTdlYmRjN2EyZTZh
YTkzYThmNjVjZjUNCj4gDQo+ID4gQWNjZXNzIG1ldGFkYXRhIHZhcnMgYXMgbG9jYWxzIGluIHB5
dGhvbiBzbmlwcGV0cw0KPiA+DQo+ID4gRXhhbXBsZToNCj4gPiBGT08gPSAiYmFyIg0KPiA+IEJB
UiA9ICIke0BGT08gKyAnL2Jheid9Ig0KPiA+DQo+ID4gJHtCQVJ9ID09ICJiYXIvYmF6Ig0KPiAN
Cj4gU28gYCR7QFZBUk5BTUV9YCBleHBhbmRpbmcgdGhlIHZhcnMgaW4gaW5saW5lIHB5dGhvbiBl
eHByZXNzaW9ucyBzZWVtcw0KPiB0byBiZSBpbnRlbmRlZCBidXQgdW5kb2N1bWVudGVkIGFuZCBt
b3N0bHkgdW51c2VkIGJlaGF2aW91ci4NCj4gDQo+IFNpbmNlcmVseQ0KPiBEYW5pZWwgV2FnZW5r
bmVjaHQNCg0KV2UgZGlzY3Vzc2VkIHRoaXMgaW4gdGhlIHRlY2ggbWVldGluZyB0b2RheS4gQmFz
aWNhbGx5IEkgd29uZGVyZWQgd2hldGhlciANCnRoaXMgdXNlIG9mIGRpcmVjdCBhY2Nlc3MgdG8g
dmFyaWFibGVzIGluIGlubGluZSBQeXRob24gZXhwcmVzc2lvbnMgaXMgIA0Kc29tZXRoaW5nIHRo
YXQgaXMgZW5jb3VyYWdlZCBvciBkaXNjb3VyYWdlZC4gUlAgcmVzcG9uZGVkIHRoYXQgdGhpcyBp
cyANCnNvbWV0aGluZyB0aGF0IHdhcyBpbnRlZ3JhdGVkIDE1IHllYXJzIGFnbyBhcyBhbiBleHBl
cmltZW50LCB3aGljaCB3YXMgDQp0aGVuIG1vcmUgb3IgbGVzcyBmb3Jnb3R0ZW4uIFNvbWVvbmUg
c2hvdWxkIGV2YWx1YXRlIHRoZSBwZXJmb3JtYW5jZSANCmltcGxpY2F0aW9ucyBvZiB1c2luZyB0
aGlzIGJlZm9yZSBpdHMgdXNlIGlzIGVuY291cmFnZWQuIEFkcmlhbiBGIGFsc28gDQptZW50aW9u
ZWQgdGhhdCB0aGVyZSBhcmUgc29tZSBwYXRjaGVzIGZvciB1Ym9vdCg/KSB0aGF0IHJlbHkgb24g
dGhpcyBhcyANCmFwcGFyZW50bHkgdGhlIGV2YWx1YXRpb24gb2YgdGhlIHZhcmlhYmxlcyBpcyBk
aWZmZXJlbnQgY29tcGFyZWQgdG8gd2hlbiANCnRoZXkgYXJlIGZldGNoZWQgdXNpbmcgZC5nZXRW
YXIoKS4NCg0KLy9QZXRlcg0KDQo=

