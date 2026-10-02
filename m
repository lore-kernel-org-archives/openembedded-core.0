Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEDBCA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:02:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8889.1790938926273402694
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=q9tytJqm;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.43, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoqc97ywnhxO1h0H/ZK36hF8Tgs2Zc5HHwbjXBYmo8S3yGn8di74VsNa75mXz4CccshKapiFQv5G53I66zFDklhzMHsW+31ssD21XrzdTXKPM4BnuZStFrim2yt90QiH2IPXGIgVWg7+nZ7g0nrJ3yFcVjKWJymGs4A2rkKa6ptFD53ll8GSWqdx1Ry+ahQT0f8LAhE6YQdzZBZdMLB5Y+NlgEzEu7u4lbsDc5VdHjModhYav8l2739Z5CJ3CtcK2bNat+qaGS2lpx0t6LDFcWQnepj3EVR50QLCEgTsLDnWnsUlF+w+OeREFONhtEF8Fd5Mhr/E8ju313jAkgNnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKWOiCNeW/GLtB6aD7cuMRzyWgvX8AdhUosOFWJYsAM=;
 b=cYRoh3HkZta6J8MISiKTaWNCTvuWmC1hpu+ZmDYNJJfXp3viQwyaoF1JdzVqcRn+2+hFqNerl/H+MSLMvoD1jqX2ph2i1c6Y3o7Lingx3PflrayHuub74KSoAjNtvrC965ewMT/e5hXdz82+8+05eBgoSlj0etoGZAS2K/VVQyhk35mF+5f/KeQ82dx9h/ZnjI/PNI2ucuMfqTnHHwNCn+tBi1LPoUGxstiKlChMHFIJ0+VxwySAKarZQcBO2yPjdXQJqJWkCzj3903ETpaDu8B/AGObsrrTo2+3XIVHmve0IKkAp9ALpOpnQa7Offtp+U28HMtA//xB/ey29MJYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKWOiCNeW/GLtB6aD7cuMRzyWgvX8AdhUosOFWJYsAM=;
 b=q9tytJqmBNk0T7mixAGkIvt84otXn8dsC3mqYh/DLfaO4LLUIhRgqfHKKxEsF1Am0ozNzMVYVehe5+aucuqKu5eJs38amKFuhqG8LZCC397J5IDxTaBk2qDWxuBfzjZdna7iGohALdX9GgJNJfiZ1LL9gdbf2bmwSKKJU6TEaoZ7bH93aNNlGNr0XB8tL3XSGlLnhD5n5icmltB1JirvnhJaV8vUnVj3NRaYiKkm6aW/mI/ZOoFemPOQPWB5RyDaCQHe6c/al6SR8/Iwk8CBu87FW0D/ZcSthS3x/zEKQqqALlPYpzm2bAFhb9wlSmU7r+iJ/ZU+TQr4v1jESmO/fQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by BESPR07MB196443.eurprd07.prod.outlook.com
 (2603:10a6:b10:130::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 11:02:02 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 11:02:02 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH] libarchive: fix CVE-2026-15028
Thread-Topic: [scarthgap][PATCH] libarchive: fix CVE-2026-15028
Thread-Index: AQHdUl10roHPRWpju0iL+5O6fHHnFw==
Date: Fri, 2 Oct 2026 11:02:02 +0000
Message-ID: <20261002110134.11564-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|BESPR07MB196443:EE_
x-ms-office365-filtering-correlation-id: 3ceba4ef-b6e9-45c2-9294-08df207496a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|38070700021|11063799006|56012099006|6133799003|12006099003|260925022911599003|10067099003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info: 
 VcsR/fmFJP70euGT8zufxRsPh2Exo4Tjo2Ufr1hW9f1SLYKn4Hqgx9eMZ02sRR573fVt/oBLdrFxp5up2TU5YE4QNKtrfgFmLEfUO7b/PsUC34bnXTmaxP6XDSvHoIrZPqdWcXArH7dyz/17ofM0sKo5zcfqJ/JmQ9qUW6MqcvE3cvDmAevrjmXKWuN8KkEWB9DJ/lQJ7E5Ds6+eeIZ02Y9tMXjrDrOu2eeoPAMb6dIFzpjh2Sfe/5FD4LVZjYKMMNzMvh5A+1XBa8z5k/oNL8ZvimhEL+M7k0OCb90ZEzWtVjEHhVkGXueD7wPY4qkMll6cNWU9XfXdkv5d4jtnWqtOZQVvej/E1pFuMNDmTCZA8q1mjd9e3MU4B7EA0k5g1/I35b7gyoYM55QBH/cCximsw7rUPx1pZTwn2nglhNMszSIO102Y4OoSIDFSa7WxSRQC22keg6Tf45gN8VjbW4wWJ0wHs2f1AGl7vL+YURp9jdpdYMUwIc3Ew5ncg6CASbYXTDfYpiXv5ZhZSaXlO6XgQrWNd0BThXAvWjsSNB+pYvILfDBmWvfx2ldEcXiHXSYGIKg+HPXnFe/7HwnECFu+jTj+AhX6WeVG8G0Bf+1+SVrjWLt2IQegxRerBf+TTvb9fwRnwTGe/LhW2C1AHJWHR3Pu8EEgOmCyuqWiCoA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(38070700021)(11063799006)(56012099006)(6133799003)(12006099003)(260925022911599003)(10067099003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d2hGSUZOQVFweG9KSUM5TmFkSlZRdXd5bXgwN3NKL0cvQzBNdjMvT3p3ZFZ2?=
 =?utf-8?B?N2pwTGhsSEswVXh2eUJjdzR3amc5WFl6SnN1VzQwc29vRUxGK0hYVTVEaGZv?=
 =?utf-8?B?TnB1NTZCd1NZZERKTy9aVGwyM0ZhNDRXYSswdC9tYVBwWEZVUWRWdDFBK2c3?=
 =?utf-8?B?c1Vpb3JUYVhVZWVrR2NKVGxpTjNMQS9CRCtxb1BOZEMvQWlXOWlTVmtCdU9Y?=
 =?utf-8?B?STBiT2N6SE1hbXRZOVJBSitPYWZ4L2VnYUo0Ny9xdGU3TFNLZFlBVTM0RTlq?=
 =?utf-8?B?UVBHUmZ6Tk5YanU0a1dXbTF6WDFrWFRkSmxFUFN5WDhKYUtYZkVlRndaWHY1?=
 =?utf-8?B?U3dubndpUy9XMDNWbGpaczZYZHJOKy9iN2M1aTBscS9GakhER2R1aFFyTWtD?=
 =?utf-8?B?ZDNVbkp0enF1NHpxN3M0NGtpVW9PL3Uvcjd1RDdISmlGVnU2VFZjN3dPbklV?=
 =?utf-8?B?K1Mxc2NFUHh0ZnF4RzEyVGlZSy9RWGxZcVNaV2UzSVhaZ1Q2YXE5azJmcXJB?=
 =?utf-8?B?RFBUWVpwY3k0NTRmREh0STFXdVNhVllJb3FLQjE4RkQxOHdmMytZdU4rbWV2?=
 =?utf-8?B?SjA4QVVYbnltZ1FLUWd6RTR2c2R2U3VoaERiMWd5OXE0Y3NWVGRTSm1tU09K?=
 =?utf-8?B?cWRsbTcwV0VaNit2RnFmR2ViS0VPMWJPTFZYazlDTjhGZzUySWthck9ad0li?=
 =?utf-8?B?REJGU3M2N1NXNTJCektpT2F1bGpkYVdIbFhpS1Vzc1oxck8yUGxDc3gzRGFm?=
 =?utf-8?B?S0ovNk1wZko5MzNtNFVOMDBZb05YbGkyYi9jUUtkWkxaZnEzMWh6SDhnVWNX?=
 =?utf-8?B?UU1JZUtBWG1IdDhvN2N3Rms0Yk16Zm5UeVlORDFQb2E0ejRCaEhYNzNwMm5y?=
 =?utf-8?B?TE9WRGFPb3RPdlovWFUvSmw4b3JzVnV1RUVHOUkyTVRLblNyajZkNjFKRTFh?=
 =?utf-8?B?ai9BOGxYMG44bms5VDNxak11ODFqUG9nc0tVa29BK1FybjgwWGI5NFRIRHlZ?=
 =?utf-8?B?cGoySHEyeU4xYW5heVFxa3BSZUJnZ3h5TXF4ZCtzRnFXbDBZQm1OZ29nakFF?=
 =?utf-8?B?YVVENWFReldvU25uZ2grWURxdFRrM1RFYXVPLzhNQmZFcEV3VzRMbkthOEVl?=
 =?utf-8?B?eGVQVWIycXRlNVU4ODJVa2l0U24xRTRMZjBEOC92cnEwZGVBb1Y0WWQyWUZK?=
 =?utf-8?B?cTBuRExZT2ZGQWlIcVMwcEpESHB4TW5JcVFDNE9ubk9uT1FMN1BIY1h6VHRu?=
 =?utf-8?B?U0w4UmpleWFKU0ovV0NPUlJIWHJ2U0MxcWs4UlRxV3FKVDhKalhhMkw2ejJO?=
 =?utf-8?B?Q0QyRmEwcEFOcUxQdFhjRXRiUk5UMXdYdlBEd29nSGVjV09wR25aZW53UWhz?=
 =?utf-8?B?SkJlVjkwUFg3K3JVdTlSODJIdzN1NWVzS2NwbXh2WGVaUEd1RnhwV2Y1THUx?=
 =?utf-8?B?MFRFaFp5VHN4cXhoTng1emlYMEVmZmtNUzllUWkxZFdjZkRNU2M1bVMzYWhQ?=
 =?utf-8?B?M1dFTC9xdGt4U2FGSjNOUjlyNWsyMW5nQVBiU2hsQjNtMDNTWEdRRnNpNnpR?=
 =?utf-8?B?OGlsanJpa2xhaFVjWmUyanFjbGlGeXNTM3hSZmdOb2FTS29vbmhLSXJCV0Qy?=
 =?utf-8?B?KzhpaDNMTGNEcXdOcGpnbFZydTJjY1VnWnFQTlIyUEZSN20za0piU1FJa0lD?=
 =?utf-8?B?blZDSFZTU1Q5NEY5dnlRK2tIOUIxY3pQQmJNaHEwc2d1R2ltdzJxQm0wd3JM?=
 =?utf-8?B?VU5GdlUySUxTcWtLeXZzN1Zmbmd0dmh5VXRTbXNWazgvTFc3MjVJbEFNV3JI?=
 =?utf-8?B?STFZckFGK0xFY3ViRVVUTE9sbFgrR0dvSnBmL0dkZWptajY4bzR6UHEwR09G?=
 =?utf-8?B?NHNGeE1jZVZLTkN1V21wa1l6M0t4OTZaWjZ3eUtDVHBoS2QxTjQ5ZXlRMTlT?=
 =?utf-8?B?OFZmYTUwbnJGekdpMml3WDA2Z1k0R3IxV2lpa2FNQXJoZFVvOEszaE00SG5s?=
 =?utf-8?B?UlJteHc4a0o2R0ZQTWpJU1ZEQ0wrQVRVRmFlOGFDbDNzUjc2ZXJtRDJlRklV?=
 =?utf-8?B?TVp1TzdKMFVvMFVtQll6VnR5WjNQWjkxRlNQZHExWUhMZ1p0RmZMOUh2Mndx?=
 =?utf-8?B?NFNLNWpnZXVYRHp5MjNWVjJkS2hwcWpaY3Y0UzdpcENYSTN5Uzh5cHMrbzJK?=
 =?utf-8?B?QkVhakdaWDNkUFJpalFPOE1Jb3Z4QWFqOHlzZnNJYXlkZTIveTNOYVp0WkRK?=
 =?utf-8?B?c2NxK1hpdjhidjhKTS9GS1hlNzZkNEhKV2ZVdGk0VmYrWnNObEwvYmVidnFz?=
 =?utf-8?B?OUhaSFJQeVIweFg4ZDd6cGRSTWtJbXZSejZBZXpMaXpzeFQ4dlNUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ceba4ef-b6e9-45c2-9294-08df207496a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 11:02:02.4726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khb7mlGGGKSyvp4GXTJEx2FN1+DNJzoKm4JT1xSHHOtt5by4o8MLqoHQcHd/Z3p7k7953tFBQrIjJblLaotJjMalbE4Pb0vdDUDKvnGw3OA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB196443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247107

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTE1MDI4LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi0xNTAyOAoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0LzQwYjky
ZGUxZGVmMDhlNGZjMzE5ZDU1NzAyNzg1ZjgyY2VkYjdlZjIKClNpZ25lZC1vZmYtYnk6IEpha3Vi
IFN6Y3p1ZGxvIDxqYWt1Yi5zemN6dWRsb0Bub2tpYS5jb20+Ci0tLQogLi4uL2xpYmFyY2hpdmUv
Q1ZFLTIwMjYtMTUwMjgucGF0Y2ggICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKwog
Li4uL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuOS5iYiAgICAgICAgICAgIHwgIDEgKwogMiBm
aWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZS9DVkUtMjAyNi0xNTAyOC5wYXRj
aAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hp
dmUvQ1ZFLTIwMjYtMTUwMjgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2
ZS9saWJhcmNoaXZlL0NWRS0yMDI2LTE1MDI4LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmM2M2ZjZjIyZjIKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJhcmNoaXZlL0NWRS0yMDI2LTE1MDI4LnBhdGNoCkBA
IC0wLDAgKzEsNDEgQEAKK0Zyb20gNDBiOTJkZTFkZWYwOGU0ZmMzMTlkNTU3MDI3ODVmODJjZWRi
N2VmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IGRhdGF1d3UgPGRhdGF1d3VAdXNl
cnMubm9yZXBseS5naXRodWIuY29tPgorRGF0ZTogTW9uLCA2IEp1bCAyMDI2IDIxOjUxOjE1ICsw
ODAwCitTdWJqZWN0OiBbUEFUQ0hdIHRhcjogZml4IDEtYnl0ZSBPT0IgcmVhZCBpbiBTVU4uaG9s
ZXNkYXRhIHBhcnNpbmcKKworaGVhZGVyX3BheF9leHRlbnNpb24oKSBwYXNzZXMgUEFYIGF0dHJp
YnV0ZSB2YWx1ZXMgd2l0aG91dCB0aGUgdHJhaWxpbmcKK25ld2xpbmUgdG8gcGF4X2F0dHJpYnV0
ZSgpLiBUaGUgU1VOLmhvbGVzZGF0YSBwYXJzZXIgcmVhZCBvbmUgYnl0ZSBwYXN0Cit0aGUgc3Vw
cGxpZWQgdmFsdWUgd2hlbiB0aGUgbGFzdCBudW1lcmljIGZpZWxkIGVuZGVkIGF0IHRoZSB2YWx1
ZQorYm91bmRhcnkuCisKK0hhbmRsZSBsZW5ndGggPT0gMCBiZWZvcmUgY2hlY2tpbmcgKmUuCisK
K0NWRTogQ1ZFLTIwMjYtMTUwMjgKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8v
Z2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0LzQwYjkyZGUxZGVmMDhlNGZj
MzE5ZDU1NzAyNzg1ZjgyY2VkYjdlZjJdCitTaWduZWQtb2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8
amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgorLS0tCisgbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRf
c3VwcG9ydF9mb3JtYXRfdGFyLmMgfCAxMSArKysrLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9saWJhcmNoaXZl
L2FyY2hpdmVfcmVhZF9zdXBwb3J0X2Zvcm1hdF90YXIuYyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9y
ZWFkX3N1cHBvcnRfZm9ybWF0X3Rhci5jCitpbmRleCBlMDdjZmRiNjNiLi4xYzA0NDFkYjZjIDEw
MDY0NAorLS0tIGEvbGliYXJjaGl2ZS9hcmNoaXZlX3JlYWRfc3VwcG9ydF9mb3JtYXRfdGFyLmMK
KysrKyBiL2xpYmFyY2hpdmUvYXJjaGl2ZV9yZWFkX3N1cHBvcnRfZm9ybWF0X3Rhci5jCitAQCAt
MzQ0OCwxMyArMzQ0OCwxMCBAQCBwYXhfYXR0cmlidXRlX1NVTl9ob2xlc2RhdGEoc3RydWN0IGFy
Y2hpdmVfcmVhZCAqYSwgc3RydWN0IHRhciAqdGFyLAorIAkJCQlyZXR1cm4gKEFSQ0hJVkVfRkFU
QUwpOworIAkJCXRhci0+c3BhcnNlX2xhc3QtPmhvbGUgPSBob2xlOworIAkJfQorLQkJaWYgKGxl
bmd0aCA9PSAwIHx8ICplID09ICdcbicpIHsKKy0JCQlpZiAobGVuZ3RoID09IDAgJiYgKmUgPT0g
J1xuJykgeworLQkJCQlyZXR1cm4gKEFSQ0hJVkVfT0spOworLQkJCX0gZWxzZSB7CistCQkJCXJl
dHVybiAoQVJDSElWRV9XQVJOKTsKKy0JCQl9CistCQl9CisrCQlpZiAobGVuZ3RoID09IDApCisr
CQkJcmV0dXJuIChBUkNISVZFX09LKTsKKysJCWlmICgqZSA9PSAnXG4nKQorKwkJCXJldHVybiAo
QVJDSElWRV9XQVJOKTsKKyAJCXAgPSBlICsgMTsKKyAJCWxlbmd0aC0tOworIAkJaG9sZSA9IGhv
bGUgPT0gMDsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xp
YmFyY2hpdmVfMy43LjkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJh
cmNoaXZlXzMuNy45LmJiCmluZGV4IDJlYjIyZTJkNjEuLjM3MTk5NjVlZWQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy43LjkuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjcuOS5iYgpA
QCAtNTEsNiArNTEsNyBAQCBTUkNfVVJJID0gImh0dHA6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9h
ZHMvbGliYXJjaGl2ZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYt
NDQyNC0yLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTUxMjEtMDIucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjYtNTc0NS5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly9DVkUtMjAyNi0xNTAyOC5wYXRjaCBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNL
X1VSSSA9ICJodHRwOi8vbGliYXJjaGl2ZS5vcmcvIgogCi0tIAoyLjM0LjEKCg==

