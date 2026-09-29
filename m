Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07DFCA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:06:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7395.1790687199042747810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=IqRAx3BR;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.69.17, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECOkxaJUn0pOAsnd0LxkHe+QD28ZgInbQOO5QURHeS9BBYxA5Rq7ONLzeyyBFjIU39PFSYyi90luM21dPUiVxx9JDKNsCp0LajPgSey12LY8gI/29wtN22t/a5d3zcztDenoCWL4LzACFodNVjcHR8kAeyqSGatnI4DgRxye5Ivcg2AKyOM/XJI489px5L36cj2BT2ZASGfM2boc3dkmj0fQo9oQYCevwxP5a6VjIgbF1d9g/t6mizkg1OnUcgXxFWYpFJyFlHORxgkAF6ZdNkp2qvu5Ja8DUxj/74qS6+9gOGmzCyro3QiW2QVONNmgP3FSJ2A4FflKTLqJsfFTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HC8NpQczFPPGyy7a/OusyLwpnqIl3PVpjVKZ5dGV4Xk=;
 b=lP3lE33/2cDLDSMq3sbRle+En0e4c8mn7plEHXSOEMsRkbIrlcKaThiELG/VwdT+XShjh+IqDgoHzdOnwbo60R6SPauH0QSX0LybnfVgu2yvsl1NOSRCkVw4BIOXv2D/7sMb9ZEpdn388CTwrVmlBlhvLD+rf3grFJM8ibMc0OC9MptM7dQu/gSJTyE2TQpM73vT25zWtVRZ5HrqTC+Zk4R5anmrvq+vHA9jXj6fmh8ddd4tZOggTo1UAxP7TwtpFJ71UkgUkWPHkps29hPY7SQLVmjn167vnW86I8OzFbrGv/RzZuyKzL5byDQdwhnrHdVwFII2V7K3BhYJHeGdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HC8NpQczFPPGyy7a/OusyLwpnqIl3PVpjVKZ5dGV4Xk=;
 b=IqRAx3BRubN4A8LoNdGWA1RJ0dmf95t1bwa1tt2tKoeyI9hShMXsUN3kf1iZYcVrUHYRocYmZKgeTi0F/ZawgsJy8kXyCEYIe7X9kH1xSab36ZC/8/AcS932d8DIWLc3W8omgdEXfVZcMeKYryc3lMBMy6O9Eyr+vxRyJEcJW/hPysrPocj+Uxxo1BK5OoLlEepI9FYXbgkoLtUO/eQTa4YHl2OBsy8eQeZadeEw5CpGrRBbC47rJjBWWAqeAWkXR2lrwRjptfa/dxseOMjMoRjxvgX6fi6sh0jTvweUdzqAwuKKn43Tx08hCkKFdhWY4BNMbIa9NuGAkdR/OBwjeg==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by AM9PR07MB7219.eurprd07.prod.outlook.com
 (2603:10a6:20b:2d1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:06:36 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:06:36 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH v2 3/5] gnutls: fix CVE-2026-42014
Thread-Topic: [wrynose][PATCH v2 3/5] gnutls: fix CVE-2026-42014
Thread-Index: AQHdUBNbHOc49H6TaE6F1Zb2LnvJUQ==
Date: Tue, 29 Sep 2026 13:06:36 +0000
Message-ID: <20260929130622.246144-3-jakub.szczudlo@nokia.com>
References: <20260929130622.246144-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260929130622.246144-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|AM9PR07MB7219:EE_
x-ms-office365-filtering-correlation-id: 9c66b089-ade8-4e66-6197-08df1e2a7e5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|29003799003|10067099003|11063799006|56012099006|12006099003|25016099003|13003099007|18002099003|22082099003|38070700021|260925021311599003|260925021911599003|260925022911599003;
x-microsoft-antispam-message-info: 
 P+M4wjor+2RnnGYdv9xj3vOy/7X9qcHPTdT0qsS2DxM8R1b61bR1wUZo+sRcxafcm6LDTFjQKvA3xambm7Oa37B4D6NU0xUhxNrMZU0z8CMi8Fxjr1QkgFZ8k0U1cQa9CAjaaSp/Bj4xMuq+uTSmioyJAo05tsDpDFnTAkoA6OK9n/Tt6xw32aPrjo4kAbFU3EEqyL94S78ujxLorMavw0oMjXCDiu7MKiwxEG644b3FuRHrkHHVBFQWRrRVvmyojK/Lwu74ueZojWGkMbR+enkQkV2jDAD8URAwFwVnLqBxfnaJEH56jnE0XTGbuQw4hfE7RI/ovUocibRcaFKgP7iOLpx4GVpaMc+AaTGfpySOD1Kupg9vHS9Shj835qnoMy74x3nT25BNobhmpHnxdH3Bm7SfOAS+z7MCBpwmZD0im1ggzC2AZcLZ88I3DuDnh16kFtv2EXqaunGyp474lseMGWwa0pNFbHbP5oLRadq8lKRDBnG6baqcBvMfJEcnrnKu6a8J3giV9HKO6iW35ZL1gDx4XoJtRxxl/GShz6ytXSdjVOaFomqFa2uqO+DDFW5Rizre+aAHkt+0s9nJnfWDHk4Sk7QzgZifdY3y6WWQzODVfctD8/WiB1yKJme7UU7REn2WA5VlHmqC5e66rM9KsuZD4vb5XfLLOiJ8ThA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(29003799003)(10067099003)(11063799006)(56012099006)(12006099003)(25016099003)(13003099007)(18002099003)(22082099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFFIeWVGaDBTY2c0dXNaZnd0ZXVWTnkwMGgrYkRiNEwzZ01heG0wRC9VK080?=
 =?utf-8?B?VzdGbkF3SElvbEUyd1lWNlBpMTBPK3FlaGtKV2NGQzlESzlzT0VmVlhGRFZV?=
 =?utf-8?B?QWdmVzg4MHJqREVBdlI1L1AzLzZpY2huVG53eXFmaWxmRTlIbWFlNklVUDIx?=
 =?utf-8?B?K0IvZHZ1bkdjMjZCNGxsLzJvckxJaElqYXJ0Uk56N0JrNVkvblFmTlRjWlFZ?=
 =?utf-8?B?WFQ2Wk1sTXhhaTQ5QXIwQ0U4cXRHditXL0ZvVXl3YzlkL0lLWjBPWEpNRlFo?=
 =?utf-8?B?dUErbTEvWk4yL05CKzNxSTJYZ2VwRTBWTnpLS0d5UjNEcUdyTHpCWmMyR3Z2?=
 =?utf-8?B?Q1Z2S1FZS1k3U0NCbWVBNjl3bnVjeG4yQmRPS3J1Q0FFTVQ0ZlFCb3IyT3Js?=
 =?utf-8?B?WjFNMUd2bGR5OExqZWZpd25oUWJWZ2F4THBWblhrNHpzc2RlQjZvMjR6eDlv?=
 =?utf-8?B?WGRicUJ3UVkxMHE4amcvME9PNWdQeFFybS9MMHZEMWVFaGxGMUM4MkZXZVI0?=
 =?utf-8?B?UE5EUzZndCtSWER6emRCRlpPZDdhcHp3b3poVWo1ZDRBbkdLQi8rTDdSSkdQ?=
 =?utf-8?B?TDVuYXAwbTVBWHJ1NU5JQnUxSmcvbHN6RHhybHNOMUJHYlBFUXVZQWFUbEor?=
 =?utf-8?B?NUp4a0dKeDZLb3owZXRjVzZQNndncERLd0Q5NGR1cVpxRDhidy9ZcDRLNllC?=
 =?utf-8?B?dVJ3Y09Rd0hCU0xYelFtdFNrbkJRdEZQdGRza2gyUHRsaHh0azNIL0RlZCtv?=
 =?utf-8?B?bE5jcm9PU0dBYmR3eTl4blBVcWpoOHJvSnpyNktGZVREbWVRR2FXT1hRTC9U?=
 =?utf-8?B?RzcvRnNGSG1jNzJZTURxejZwckNGeDhGNFNCREpWczJZUk9ZMjZjbURRSXlQ?=
 =?utf-8?B?TDg0WVh1T1JuS1llSzRKZG1aTkxmNnNVMmlxZmFaeHpnMFcraE1tNVp1dUJa?=
 =?utf-8?B?c2kxUk1UbmZ4WWNiTUFYOU8yamJDU2d3UVJ3RWY4UUVCa3ZFTzJLR1lnNHNl?=
 =?utf-8?B?ZDliSlBzRVBrUS9ySG8waTJJRHRFejkzcVFHOFdqUXE4bE9NZ0VqS2xPQXow?=
 =?utf-8?B?OFV3elJjUkwwQ3hpckxOSXMrSmFYMkI4MUgzKy93VGhxOUp5Ylp0NitRQzBP?=
 =?utf-8?B?V09WYXptZE1xejAwOU1USlJnUFpPK1JpMDlrcEM0ZHJlZnlkelFhMmRLQTc3?=
 =?utf-8?B?d1lEZk5jRUpCSU5mZEpGSVQ3YmFMYXo2b0puc0c3TXc0RWpYOWI2MEJCZ0NB?=
 =?utf-8?B?REZtWEw2SzJzSzBKWDBPMkRiMnA1cUk1bWVFOURtMlYrT3hkYnBENHFmbWVk?=
 =?utf-8?B?YTQrVHpDd01sYnMyc1VMYzRKY1ZmZmVNL1dRelZzWC9EUkpIVlZzQTgzRnZI?=
 =?utf-8?B?eTgrMjVrTWQrL3pXWFFUNDVSNlhLT3NpaFowcnpMZ05rbXc3NzZpbDNOWmhx?=
 =?utf-8?B?Y2ZGMnJhV25kRXlFOVRsUElJbnF6UWF0QU1VVldYNUxEWXM2M2VvVnlvVmFI?=
 =?utf-8?B?eFdsZE5wVFFRczF1dm54U21iZ1lhR24xeDFsYTd6bER1L0xvc0VHd3hMNFEw?=
 =?utf-8?B?TkZaYWo4SG9ET05Ib2lxbGVoRUdlemV1czYyZHhyR1h4RWhkRjAyaUlwM2li?=
 =?utf-8?B?S2o3dm1ENC9yUXVYZnYzSGs3Wi9pMVJVSUlQWXg2citNdkhsZUkyQUF4THhB?=
 =?utf-8?B?R3BjdXA0djlUMUZJNjFXMGloL3loRUQ0KzRva2E3dkt6OCtUcEgrSGxIVDBy?=
 =?utf-8?B?SXFEUzhSU1RjTXp0UkxpMTlVbGQ0eDB1SmZ5bWZMS093d0o3RnpvL0tEKzJT?=
 =?utf-8?B?M200aWlseitqcGg3Tk84ZTRIVXNNbS9xT3FMdjJmRGZ4cmR6ekJKVWZoMVJF?=
 =?utf-8?B?bEJaM0FJWWpwYmlUd0dicmMrcXlzVm9EbjdoQ3dhN3JSbGpneTErU2w5Njk3?=
 =?utf-8?B?UkJEWXlQbEQvVFNzSFRGanNjZzRBa0w0MS9qcWgrUS9KNlZaSWtBbnJuTGhn?=
 =?utf-8?B?WkpOOHh0QUZyanEvRlJmaGsxMW1DTTc5ZUtrZ3ZOYzEyQkVPSGRXZzI2TGxE?=
 =?utf-8?B?K3Y4YnJ0cEpueW1YZjdFUWtibnpxM05QNUF1c0w4T1gvRVFxQWFlMlZtZGcz?=
 =?utf-8?B?NjhSNkVxc1RLRGhYVzFOWHJIbXZDbHhRRjUvTHptYTRnVk4xcElBT0doUUhj?=
 =?utf-8?B?dko5VHdEL1RSRXZ4QWMyZDNVSkRPTUJId0tPOU1DUkFFS2hmU3JFeGRuTi9n?=
 =?utf-8?B?WUsvN0ZQSjIvQmtaMUROK01DcHlBV0NRM2xIOHBHbWpNejczK1luclFMYXVS?=
 =?utf-8?B?SzVSUVBVUEZ4cWdJUVc1NnVwK016eSt2ZFBPWG9UekhObXgyazJHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c66b089-ade8-4e66-6197-08df1e2a7e5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:06:36.6878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+I6tjxRMvF76BcJJuIoT+wuJO0xIUjZRqzPBtQIVKsX+x+ugs2F3dk8NI8prmoXfGcBdFwA1bgT7r9pRyjSCi36078CxbW/AfnkUi58+9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246860

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTQyMDE0LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi00MjAxNAoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0LzM5NTdmMTM2ZTJl
ZDIzY2FmMTc2YTU5NGI1NGIzODI3ZjVjZWY3MDEKClRlc3RlZCB3aXRoIHB0ZXN0CgpTaWduZWQt
b2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgotLS0KIC4u
Li9nbnV0bHMvZ251dGxzL0NWRS0yMDI2LTQyMDE0LnBhdGNoICAgICAgICB8IDYwICsrKysrKysr
KysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEyLmJi
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQ1ZFLTIwMjYtNDIwMTQu
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0NW
RS0yMDI2LTQyMDE0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9D
VkUtMjAyNi00MjAxNC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li43NzY3MzM4MjlhCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
dGxzL2dudXRscy9DVkUtMjAyNi00MjAxNC5wYXRjaApAQCAtMCwwICsxLDYwIEBACitGcm9tIDM5
NTdmMTM2ZTJlZDIzY2FmMTc2YTU5NGI1NGIzODI3ZjVjZWY3MDEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBBbGV4YW5kZXIgU29zZWRraW4gPGFzb3NlZGtpbkByZWRoYXQuY29tPgor
RGF0ZTogV2VkLCAxOCBNYXIgMjAyNiAxODoxOTowNiArMDEwMAorU3ViamVjdDogW1BBVENIXSBw
a2NzMTFfd3JpdGU6IGZpeCBVQUYgYW5kIGxlYWsgaW4gZ251dGxzX3BrY3MxMV90b2tlbl9zZXRf
cGluCisKK0NoYW5naW5nIFNlY3VyaXR5IE9mZmljZXIgUElOIHdpdGggZ251dGxzX3BrY3MxMV90
b2tlbl9zZXRfcGluKCkgd2l0aAorb2xkcGluID09IE5VTEwgZm9yIGEgdG9rZW4gdGhhdCBsYWNr
cyBhIHByb3RlY3RlZCBhdXRoZW50aWNhdGlvbiBwYXRoCitsZWQgdG8gYSB1c2UtYWZ0ZXItZnJl
ZS4KKworUmVwb3J0ZWQtYnk6IEx1aWdpbm8gQ2FtYXN0cmEgYW5kIEpvc2h1YSBSb2dlcnMgb2Yg
QUlTTEUgUmVzZWFyY2ggVGVhbQorRml4ZXM6ICMxNzY2CitGaXhlczogIzE4MDkKK0ZpeGVzOiBD
VkUtMjAyNi00MjAxNAorRml4ZXM6IEdOVVRMUy1TQS0yMDI2LTA0LTI5LTkKK0NWU1M6IDQuMCBN
ZWRpdW0gQ1ZTUzozLjEvQVY6TC9BQzpML1BSOk4vVUk6Ti9TOlUvQzpOL0k6Ti9BOkwKK1NpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRlciBTb3NlZGtpbiA8YXNvc2Vka2luQHJlZGhhdC5jb20+CisKK0NW
RTogQ1ZFLTIwMjYtNDIwMTQKK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0
bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0LzM5NTdmMTM2ZTJlZDIzY2FmMTc2YTU5NGI1
NGIzODI3ZjVjZWY3MDFdCisKK1NpZ25lZC1vZmYtYnk6IEpha3ViIFN6Y3p1ZGxvIDxqYWt1Yi5z
emN6dWRsb0Bub2tpYS5jb20+CistLS0KK2RpZmYgLS1naXQgYS9saWIvcGtjczExX3dyaXRlLmMg
Yi9saWIvcGtjczExX3dyaXRlLmMKK2luZGV4IDY0Yjg1YTIuLjFkZmY1NzggMTAwNjQ0CistLS0g
YS9saWIvcGtjczExX3dyaXRlLmMKKysrKyBiL2xpYi9wa2NzMTFfd3JpdGUuYworQEAgLTEyNjYs
MTAgKzEyNjYsOSBAQCBpbnQgZ251dGxzX3BrY3MxMV90b2tlbl9zZXRfcGluKGNvbnN0IGNoYXIg
KnRva2VuX3VybCwgY29uc3QgY2hhciAqb2xkcGluLAorIAkJc2VzX2ZsYWdzID0gU0VTU0lPTl9X
UklURSB8IFNFU1NJT05fTE9HSU47CisgCisgCXJldCA9IHBrY3MxMV9vcGVuX3Nlc3Npb24oJnNp
bmZvLCBOVUxMLCBpbmZvLCBzZXNfZmxhZ3MpOworLQlwMTFfa2l0X3VyaV9mcmVlKGluZm8pOwor
LQorIAlpZiAocmV0IDwgMCkgeworIAkJZ251dGxzX2Fzc2VydCgpOworKwkJcDExX2tpdF91cmlf
ZnJlZShpbmZvKTsKKyAJCXJldHVybiByZXQ7CisgCX0KKyAKK0BAIC0xMjkwLDkgKzEyODksMTEg
QEAgaW50IGdudXRsc19wa2NzMTFfdG9rZW5fc2V0X3Bpbihjb25zdCBjaGFyICp0b2tlbl91cmws
IGNvbnN0IGNoYXIgKm9sZHBpbiwKKyAJCW9sZHBpbl9zaXplID0gTChvbGRwaW4pOworIAorIAkJ
aWYgKCEoc2luZm8udGluZm8uZmxhZ3MgJiBDS0ZfUFJPVEVDVEVEX0FVVEhFTlRJQ0FUSU9OX1BB
VEgpKSB7CistCQkJaWYgKG5ld3BpbiA9PSBOVUxMKQorLQkJCQlyZXR1cm4gZ251dGxzX2Fzc2Vy
dF92YWwoCisrCQkJaWYgKG5ld3BpbiA9PSBOVUxMKSB7CisrCQkJCXJldCA9IGdudXRsc19hc3Nl
cnRfdmFsKAorIAkJCQkJR05VVExTX0VfSU5WQUxJRF9SRVFVRVNUKTsKKysJCQkJZ290byBmaW5p
c2g7CisrCQkJfQorIAorIAkJCWlmIChvbGRwaW4gPT0gTlVMTCkgeworIAkJCQlzdHJ1Y3QgcGlu
X2luZm9fc3QgcGluX2luZm87CitAQCAtMTMyNCw2ICsxMzI1LDcgQEAgaW50IGdudXRsc19wa2Nz
MTFfdG9rZW5fc2V0X3Bpbihjb25zdCBjaGFyICp0b2tlbl91cmwsIGNvbnN0IGNoYXIgKm9sZHBp
biwKKyAJcmV0ID0gMDsKKyAKKyBmaW5pc2g6CisrCXAxMV9raXRfdXJpX2ZyZWUoaW5mbyk7Cisg
CXBrY3MxMV9jbG9zZV9zZXNzaW9uKCZzaW5mbyk7CisgCXJldHVybiByZXQ7CisgfQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguMTIuYmIgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC4xMi5iYgppbmRleCBiYjMzMjhiNTVl
Li5mMDY5NmU1MDBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251
dGxzXzMuOC4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMu
OC4xMi5iYgpAQCAtNDcsNiArNDcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmdudXBnLm9y
Zy9mdHAvZ2NyeXB0L2dudXRscy92JHtTSFJUX1ZFUn0vZ251dGxzLSR7UFZ9LnRhcgogICAgICAg
ICAgICBmaWxlOi8vQ1ZFLTIwMjYtNDIwMTIucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZF
LTIwMjYtNDIwMTMtcHJlMS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAx
My5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAxNC5wYXRjaCBcCiAgICAg
ICAgICAgICIKIAogU1JDX1VSSVtzaGEyNTZzdW1dID0gImE3YjM0MTQyMWJmZDQ1OWFjZjdhMzc0
Y2E0YWYzYjllMDY2MDhkY2Q3YmQ3OTJiMmJmNDcwYmVhMDEyYjhlNTEiCi0tIAoyLjM0LjEKCg==

