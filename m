Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF13107527B
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 08:54:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6568.1773910478620094402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 01:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=S7nJCr4m;
 spf=pass (domain: siemens.com, ip: 52.101.66.18, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laQns2roIOfnTTKhfMIla0XBywjqn5jaTFHTGIM2xMxZjvjj0HnrE5p19K0TfPiKciHI7jbDbi2DxCyqyTA9eDeXIntYZQtZ/JR5mcqCedSkZ6VOTwbzA9fWwWC3E2aOIQNwEWLxrKK5NZkobO/nD7T/JSQQNRyXGWBu0lMc+3hKgySRpYrxRhJfSt9OZmPhh0pjSwnKJnrNSNzeL94GPdRp9IJRJdEUNXUUXK+Jt6F2s7PkJJIfcJnm5UqEDMRwr9pn71slsgkmo3wjfZmKf6XItZIuX2B8d6C6N1SVdRc8sESTMVkF/zb6SXpl5IFfI5mR2N79be5bafrSl7Wn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWsqkh5oJZ+xQo0yWT57ToZMIZqET0PXgWG+tkcfvzM=;
 b=kJBFSFA3/fw7EMoLdnVqLXLWHZupCciXXDxRy83pQoNzhKFE0uaHndyu7DQtEBRv/Ajw+RszBNP5cyOPd7cZuPG0jXOZBEjVsEGzrSMtTIwGPoD8rsFiq87e6lN316NIznD/dHggEWjhPGwiWrKOTTjCCmyldcNFZFRDj9a/3v+PQpPgB/1uHLgdXft2BkDSif01NgS7T0iJ53P81UbHk6vMPjh28tdhp2IKeArSIe0Q4u9ODfR54sUoqE0noUqwl38Z/SnfkuVYSuHeLkTQTHQvwqndc+AFVkvOcBTONw8pB5duMbJXfOxI5K5o+AgQ5u87mGBd1EHjFc+JY8Yf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWsqkh5oJZ+xQo0yWT57ToZMIZqET0PXgWG+tkcfvzM=;
 b=S7nJCr4mWkmgXICsFKz2/lXVTmKeoeueMZc7Sf1KMEcxT1Xu/eH4dcg4JULGpjlHzxwP2YRm8nnit5J8NaPzjvJbntp+5CciiFr4CxEWi6e7e5UmF7Wc5V7S39JevxWkWjys6KOUsT7NYW8APXLxv19UV1UoMf8wP0mgwqmbg6knJD9WtiRfsfwYVMrXszHjgJms8wUDo13K4B+x59xJtb2FVm5ybSGsGEh2OhFYYcBWIWUp6zEk5Pt61KmcC7VuTKec0jX0UnDGR+Sn6sJbmuug/KJrzjEa/3Gt80Cpr/dEsS3SkLvgT5b4whG7MiCloShTaXAlrUHn/0L2j7vLpA==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by DU4PR10MB9637.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:644::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:54:35 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:54:35 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Francesco Valla <francesco@valla.it>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Francesco Castagnotto <fcastagnotto@linux.com>
Subject: Re: [PATCH RFC 1/4] bootconfig: add recipe
Thread-Topic: [PATCH RFC 1/4] bootconfig: add recipe
Thread-Index: AQHcty9QLMPZExEHIESRAr7JRmZ3H7W1jaUA
Date: Thu, 19 Mar 2026 08:54:35 +0000
Message-ID: <4ba9dee07620ce57643a005f6578fbd32efd9e8f.camel@siemens.com>
References: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
	 <20260319-bootconfig-v1-1-a4d467c3f0ba@valla.it>
In-Reply-To: <20260319-bootconfig-v1-1-a4d467c3f0ba@valla.it>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|DU4PR10MB9637:EE_
x-ms-office365-filtering-correlation-id: 636a0dc9-3d6c-47c3-40f9-08de85952518
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|55112099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 JGudTMGGOVtL8Ct4wKvkZMmwueLvjdMcHqwDZvl1aQw+zWVR1WywhjPlj4xK6UBOdfE/RHHV4j2dufwTA3F1VJIBSnH75s6Dx3WUl2REF+orJHn14UIVDA0dfiw1RLlQrQWcqkWi4X8sMIK67e4Nlx5NUaE99UhYL8aaWVlaDGQVQ0sHB0rbQBcQKsy1Hjniuk1a6ZYTER5v6MsVxIwOACwjZpwhUyLHt8AX00Bd5zGj5IzGUMMav6ucZGEjkasKaLoHxW0CDffSPFbSdLoOkZJxCZtm83XXPSG/4axLEH9kiGLVuxr5PXqGJRDH0YTIP3wZ1NOM41KGFxt53RS7o+DaOMm4krAU+mpMx1oL66wP+vzeSQ+BROH0Q6A5P1bHRxfS6ddUfjpJCKCHEziiXEKj3dIl7BIx0Z95569KicH9zdboNR/nkD9btZMb2oGisvSfs232iw+nNra0Kj3RZXb+kLXcgGTS4qqijxw8FZ3TBkuNMu41y4vztQJJ5kZaJVEsx1gzthkxiETtN3G3kBn2fJbwAF48QzbGzV+In2xXx7UOyO2rSzuLAF3e5uDQP6D1vi+IvMICKjvPPbkOCrlkuSaUS8bZgHQj2gNXHA3pv9Xvam+SFt5c0zJbVt4hGx087EbzcprVEZdzVxWqPXZFKMBcj/5rSCYK3KCtdbIjld9D63phNhUnTku16X92rsIpA4ClKxITJu3Wy0DBti5nR3TkGcDPFm+H9XQ75RJKF3PSS2XvJLD8esmhEopA7KeFzEe9rQlQMVaWYq8YP3qCUzcjjaHzwEmRkE+tHKQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(55112099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U1dFcjdYeFVCSnoxUDZRdnNjMHRuZVRKNXJoVFpLYVoyMHgvL09FMHBEMFBT?=
 =?utf-8?B?YmZDQjVUdU03SUdGTlgwUlF3L1l4cy9qZ1pUT01QajhvTk1ub2JpcTVSWUdL?=
 =?utf-8?B?L1RsNjlnN2E1a0krTUd1YmtTcXVZaHBpc2lGd0tPNjJRdGxsUUppcmNaYVhZ?=
 =?utf-8?B?ZEpieFIxYjk0Tmg2WE5xVDk3ZjJaTE5mZE5oajYrTmtMNDh1b1A0UTlVSnVP?=
 =?utf-8?B?MlR3K2RaOFFENTZUWjJickpZUzdpcG1CNldzaUtKeHBDa3pNQ2Urc2NjQXdH?=
 =?utf-8?B?RXZ0ZTNQV3BXMjlaYXR5a1FsejlBdmI5a3FvbEtIakw2Y1lGakhlcVRWZzdy?=
 =?utf-8?B?QmNac3l3WUhVeEtWVGlFN1F4VlBmL3RoUHVrQ3dQcVFHdTBCSEtMWjlEOGRi?=
 =?utf-8?B?c0dQd0tlYi9KWmNMVVdXQlZpSGZEY3B2TkxiZlIrN1NYbU0rTVBGVFM2WGpF?=
 =?utf-8?B?NU9PSnZDQ1NWZEEraUdjOE5XRkNtWXhyVHY4VVFSeFZXSUxyTHYyNTZOYzNK?=
 =?utf-8?B?NUlqVmtaRlFwRVJxRTd0SVMzMk93YU1tOXV5VnVKNWdyOUp1aHArbmJDTEty?=
 =?utf-8?B?WGw3Nk9BNmVOTVArczJuRmNZdFcrS1FXbTJnYkhKTHRzVDhSTDZsN1hoNE55?=
 =?utf-8?B?KzA0NkhRL2Z1ckpqZms1cUwyKzJBQm9HZlpMcnA1cWR1ZmhuQkNpM280ajBy?=
 =?utf-8?B?cEhob1hUTnhPVXhqWlJsT09PNENrelAxN3N4cndtU2hRRkI0bTRNblRnNmRH?=
 =?utf-8?B?UXFINXF2c3B4dEFVdTc1ZkNoSE5LYTJSQndSc3pnNmRFSVRsOWNJbno4c3ph?=
 =?utf-8?B?VXIzc2hJS29jeHViKzByc1doeVFWMUxodUxhcHVaazhqUGRwdHZWVEJPeWlL?=
 =?utf-8?B?VUo3SGtYa0sxTHNGWXdMWklZcUp5ZGJlS2QweG1OQVl5YXBYVkM5WktRaU1m?=
 =?utf-8?B?QWRwb3BTVzRESVl6Y3E0d1BEMm1vQ3hKSERTOWpRRXRjTTRtNG5sNXVJM2hV?=
 =?utf-8?B?Z0hkeU12VS9iWDNPMGNzN3M2NEcvZ3RQejhJTzNPNVhyb1VvUWFBZjBkbHRI?=
 =?utf-8?B?YzdWSXdNdS8xdGRXSnM5eEtVSzk4R1BDd3IycWZZRkt6OGRZUFl1U1d1ZVNr?=
 =?utf-8?B?WkU1VTFTNEhGeXVxbnpqRUJwdkhwaW0xNE9Ec2xoQ0N0TlJYa2h1eG8xMWV4?=
 =?utf-8?B?NlZVVFM2VUNCdm4zbDlvSHlhdHh3VldRSkQzaXpUWEYxUnUySkFQQUZqNStw?=
 =?utf-8?B?RUNOdjlSWFJLa1JFam5CbFliNlF2emxLbiswUW9KcG9seFViait6U2ZISEty?=
 =?utf-8?B?dk5QNElvWjZuckhMMlFKQjg0eHZTV2xhczlXSFQwa0VDUTQ1YWlISVpVVzJw?=
 =?utf-8?B?SWEvWGc4RlRRM0VRQ0JwWkFqTnMrcEVCS3dNOXB0Wm5KSnB2L3dlWlNvWExu?=
 =?utf-8?B?ZS9lNjgxYjRURS93b3dKZHVPUllyQVBWYzd5LzB0VWlUazBVZHdud2N0d3Bh?=
 =?utf-8?B?TXVaT05BUTZ5NnZXRC9SYVdXRkJ1V1RTZEVNRzlRWG5JUWpGVFlhcjhiV0E1?=
 =?utf-8?B?YUVoUHF1SWYwZDlrVmpjZVRmejhuSU8zRGpIa25hODZDcEtCZktsQ0hOQ25t?=
 =?utf-8?B?eUJLdnp0MXd2UUgwOE03Nlc4dVA4TWlyT2hvZWZwNWxWQ0xyOWxBWFlMTzdl?=
 =?utf-8?B?MGhJZGFkOXJQN0Vhek42TjNaKy9OQWUyVkQwVkNmQVhER3VYdm5wb3NOV3FP?=
 =?utf-8?B?N0dCT1dDMUJuTHZCY1ZvcjI4SW9XYzNCT1UwY0VNUEkvNDBuM2U4RzArb3FJ?=
 =?utf-8?B?TVA5RHJIaGR0VytDSkQ4RWFoREhuRURsVFM3ZnhpUTVWUFRwcDlSdUxJbitJ?=
 =?utf-8?B?Z1YyemNTdFNMYmwxMDQrak43dHN5K3h4cnE3VTRkbncydm1OeGQ2L0ZSRkFh?=
 =?utf-8?B?d1lKT2FTZUdYcyttY1B6NEdmbncwaThwaWh1bktaaWdlaGVwVnhLRWVXVnVS?=
 =?utf-8?B?azdoaCtlaWFrTVNCM040cXFTTm1MSGJ6S0NQQjl4dzB2Q1FjRmJwbTcrK3dz?=
 =?utf-8?B?SG5OWGdjWVNsdWVWR3lneG1LdGRlOThzeXJUWFY4akhGZFQrOThPbnk5YnFs?=
 =?utf-8?B?aGhOaUxzbmhUTW5yb0RlV3lUUyswT3g1MndIU1FtbEVmWEszV1MwYkhGekFh?=
 =?utf-8?B?cUF2ZVY3dW54bFU4V0NiVXNhZXN5VVhlanlCVUd3WnJLaTV3NDk2OEg3Sk9O?=
 =?utf-8?B?VTNzMk5EZzIxRGQ5Sm9oM3RUU3BmM085ajRaYmQ3TWxQcFA3VW9uRXdYOGlh?=
 =?utf-8?B?cU1xeWpEUlRMNkNPajBTWTdpUUM3QU5OczF1TkEra3pmTmlRMkFNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AF190112E59504382B751466D00D758@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 636a0dc9-3d6c-47c3-40f9-08de85952518
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 08:54:35.1963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8LkctUMQtOnoZgGsgc0MHpLamiPSlR02TQ9NJulPyJPg50z3slFt7oWkEujhq0048BfcBWoa49YY6iB++SSealrc84tBdGvgFrknfSeSZgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 08:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233468

SGkgRnJhbmNlc28KClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoZXMuCgpPbiBUaHUsIDIwMjYtMDMt
MTkgYXQgMDA6MzAgKzAxMDAsIEZyYW5jZXNjbyBWYWxsYSB3cm90ZToKPiBBZGQgYSBuZXcgcmVj
aXBlIGZvciB0aGUgYm9vdGNvbmZpZyB0b29sLCB3aXRoIHNvdXJjZSBjb21pbmcgZGlyZWN0bHkK
PiBmcm9tIHRoZSBrZXJuZWwgc2hhcmVkIHdvcmtkaXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmNlc2NvIFZhbGxhIDxmcmFuY2VzY29AdmFsbGEuaXQ+Cj4gLS0tCj4gwqBtZXRhL3JlY2lwZXMt
a2VybmVsL2Jvb3Rjb25maWcvYm9vdGNvbmZpZy5iYiB8IDQ0Cj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9ib290Y29uZmlnL2Jvb3Rjb25maWcuYmIKPiBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvYm9vdGNvbmZpZy9ib290Y29uZmlnLmJiCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleAo+IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAuLjc3ZWU3MGRkMTgzOWVmOTBhMjkyY2Y4MjlmNAo+IGYzYTQzNTNmODVjMjgKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9ib290Y29uZmlnL2Jvb3Rjb25m
aWcuYmIKPiBAQCAtMCwwICsxLDQ0IEBACj4gK1NVTU1BUlkgPSAiQXBwbHksIGRlbGV0ZSBvciBz
aG93IGJvb3QgY29uZmlnIgo+ICtERVNDUklQVElPTiA9ICJib290Y29uZmlnIGlzIGEgdG9vbCB0
aGF0IGNhbiBiZSB1c2VkIHRvIGFkZCBhIGJvb3QKPiBjb25maWcgYmxvY2sgXAo+ICthdCB0aGUg
ZW5kIG9mIGEga2VybmVsIGluaXRyYW1mcywgYXMgd2VsbCBhcyByZW1vdmUgaXQgb3Igc2hvdyBp
dHMKPiBjb250ZW50LiIKPiArTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiCj4gKwo+ICtpbmhlcml0
IGtlcm5lbHNyYyBrZXJuZWwtYXJjaAo+ICsKPiArZG9fcG9wdWxhdGVfbGljW2RlcGVuZHNdICs9
ICJ2aXJ0dWFsL2tlcm5lbDpkb19zaGFyZWRfd29ya2RpciIKPiArZG9fY29uZmlndXJlW2RlcGVu
ZHNdICs9ICJ2aXJ0dWFsL2tlcm5lbDpkb19zaGFyZWRfd29ya2RpciIKPiArCj4gK0VYVFJBX09F
TUFLRSA9ICJcCj4gK8KgwqDCoCAtQyAke1N9L3Rvb2xzL2Jvb3Rjb25maWcgXAo+ICvCoMKgwqAg
Tz0ke0J9IFwKPiArwqDCoMKgIENST1NTPSR7VEFSR0VUX1BSRUZJWH0gXAo+ICvCoMKgwqAgQ0M9
IiR7Q0N9ICR7REVCVUdfUFJFRklYX01BUH0gLWZmaWxlLXByZWZpeC0KPiBtYXA9JHtTVEFHSU5H
X0tFUk5FTF9ESVJ9PSR7S0VSTkVMX1NSQ19QQVRIfSAke0NGTEFHU30iIFwKPiArwqDCoMKgIEhP
U1RDQz0iJHtCVUlMRF9DQ30gJHtCVUlMRF9DRkxBR1N9IiBcCj4gK8KgwqDCoCBMRD0iJHtMRH0i
IFwKPiArwqDCoMKgIEFSPSR7QVJ9IFwKPiArwqDCoMKgIEFSQ0g9JHtBUkNIfSBcCj4gK8KgwqDC
oCBWPTEgXAo+ICvCoMKgwqAgJ0RFU1RESVI9JHtEfScgXAo+ICvCoMKgwqAgJ3ByZWZpeD0ke3By
ZWZpeH0nIFwKPiArwqDCoMKgICdiaW5kaXI9JHtiaW5kaXJ9JyBcCj4gKyIKPiArCj4gK2RvX2Nv
bXBpbGUoKSB7Cj4gKwlvZV9ydW5tYWtlICR7Qn0vYm9vdGNvbmZpZwo+ICt9Cj4gKwo+ICtkb19p
bnN0YWxsKCkgewo+ICsJaW5zdGFsbCAtZCAke0R9JHtiaW5kaXJ9Cj4gKwlvZV9ydW5tYWtlIGlu
c3RhbGwKPiArfQo+ICsKPiArCj4gK1BBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iCgpU
aGlzIGlzIG5vdCB1bmRlcnN0YW5kYWJsZSB0byBtZS4gRnJvbSB0aGUgZGVzY3JpcHRpb24gSSB3
b3VsZCBhc3N1bWUgCnRoaXMgdG9vbCBydW5zIG9uIHRoZSBob3N0IG1hY2hpbmUuCgo+ICsKPiAr
cHl0aG9uIGRvX3BhY2thZ2U6cHJlcGVuZCgpIHsKPiArwqDCoMKgIGQuc2V0VmFyKCdQS0dWJywg
ZC5nZXRWYXIoIktFUk5FTF9WRVJTSU9OIikuc3BsaXQoIi0iKVswXSkKPiArfQo+ICsKPiArQiA9
ICIke1dPUktESVJ9LyR7QlBOfS0ke1BWfSIKPiArCj4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZl
IG5hdGl2ZXNkayIKCklmIHRoZSB0b29sIHJ1bnMgb24gdGhlIGhvc3QgbWFjaGluZSwgc2hvdWxk
IHRoaXMgbm90IGJlIGEgcHVyZSAtbmF0aXZlCnJlY2lwZSB3aXRob3V0IHRoaXMgbGluZSBlLmcu
IG5hbWVkIGJvb3Rjb25maWctbmF0aXZlLmJiCgpJcyBib290Y29uZmlnIGEgZ29vZCBuYW1lIGZv
ciBhIHJlY2lwZT8gT3Igc2hvdWxkIGl0IGJlIGUuZy4gbGludXgtCmJvb3Rjb25maWctbmF0aXZl
LmJiPwoKClNpZGUgbm90ZTogV2UgbmVlZCB0byBiZSBjYXJlZnVsIG5vdCB0byBjcmVhdGUgYSBk
ZXBlbmRlbmN5IG9mIHRoZQppbml0cmFtZnMgb24gdGhlIGtlcm5lbCBidWlsZCBkaXJlY3Rvcnku
IFN1Y2ggYSBkZXBlbmRlbmN5IHdvdWxkCmVzc2VudGlhbGx5IGludmFsaWRhdGUgdGhlIHNzdGF0
ZS1jYWNoZSBmb3IgdGhlIGtlcm5lbCwgd2hpY2ggd2Ugd2FudAp0byBhdm9pZC4KClJlZ2FyZHMs
CkFkcmlhbgo=

