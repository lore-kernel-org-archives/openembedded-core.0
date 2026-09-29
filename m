Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2318FCA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:12:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7504.1790687565911080143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=QjJmtmMh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.130.24, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ2kDPuDioA9U6GPsqhovsPOnluXILQwtq22TvCEyH2aHAuD/RndtHbR+5PWxFjeWF+CCIQHDHUz+4G23Ebct+8zC4cztUswmk5mRdcfkp3phsPgCN3ioTXTsfkTkYvsI1etwHDmyRaZLeyxHj7ym45s3dA3l0HmkSe88PYfasTwvp2bybJ1y8lO9bweCMJP1p6fAE96hBCrgKh1/wEyM8EbHzjnjpIBSHsPMjBB/H77mYWbxoQEbKCtC6FEnnEJcLc2+jGOOhSYsC1VoEwOlN8Gz0zx9D8lQOeku4ShWzJFx34SiiAhNmgD/6myxv02EVpil2e5FqEimWkK0CsLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qENOzkWq0jnM/m02mNSLuzQeFvUnN4sOEB2gcFIPsYo=;
 b=ch8bGrDUUScPVtX2/MK7SpcIYaP5RRkV8AqWc+P98P4N0YYNtf9AC+0BWDO9QjeLJVZliYvkgJ8PCvIPRFlM98aMmVsKo/uXbblVh7Je4BiW3SUeUZUYAHJ1mBqgf7xP8TujRBs+cCLngX26VoRzLHDL42VDX57X9lRyeBp9praMLLNYoCOGOEihqQJ6s3AtUZd6xpl2aMPl+oRsZQqbySXi7AUn5b9u4K0X79kLNMHzQUyPzsM49eEyiNfAYo+u8tB4WKF8boeNS7SadL83Ak0Ob6VIAZqQ9D3EOH0Uj8kGKREiLdC1MMK4l56mxUI28Gql5+jV/uT43xA5WCNUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qENOzkWq0jnM/m02mNSLuzQeFvUnN4sOEB2gcFIPsYo=;
 b=QjJmtmMhfnVeo4YWzrFVwWkbIoS+XZKqIwWzhNyBzB7KrhIFD4aul07jRF6HvHG+S8++7GC84BhBLQrZWLd1tcyzDgMwnJ0jcouVi8AaEzQ6HuNFvS8FyYgTu1HBtHjeXiywuhR1tLQ5URbfBhIK3RRdQIB7W00hCcdiU2ByIpSfUpY99PWOBryROidTxop3rg7Zjj6JlsPv+2u42hXmg/m8EaVysfCHHHSpz/wfJiAkvZmJ/JJZXJXNXLNpmNaOmP1AdWiLcj/QBeWccAZkNE423MyV0qAY0sBC8aFL3mWO+aMMXI8zx8gP+ZSflZP0ju0nqLAYdWbpCik3wg+oFA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by AM9PR07MB7219.eurprd07.prod.outlook.com
 (2603:10a6:20b:2d1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:12:44 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:12:44 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH v2 3/5] gnutls: fix CVE-2026-42014
Thread-Topic: [scarthgap][PATCH v2 3/5] gnutls: fix CVE-2026-42014
Thread-Index: AQHdUBQ30mWc8AjsDUOPvfdsaQVsdQ==
Date: Tue, 29 Sep 2026 13:12:44 +0000
Message-ID: <20260929131131.246533-3-jakub.szczudlo@nokia.com>
References: <20260929131131.246533-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260929131131.246533-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|AM9PR07MB7219:EE_
x-ms-office365-filtering-correlation-id: 4fa41189-2406-4d67-65ce-08df1e2b598f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|29003799003|10067099003|11063799006|56012099006|12006099003|25016099003|13003099007|18002099003|22082099003|38070700021|260925021311599003|260925021911599003|260925022911599003;
x-microsoft-antispam-message-info: 
 5D3UNaHSYfN8EtNO6d3pY5K1M9g9/UdsX3HdWaNRq2m4quS8x+NRco2uY2epQoSNwF+NvcQ55UCGCMTEnHgmD10O0ztebi0+o9bkx8jC9kEkFbhRPPi/JheVZKQOxTi3RMY6MeW3XUIpclWrptmCJbEM7GGs3TQbtAnVjXrG4wRZmVtP8as19PUPFTxVQgzMlmV39FsXzsgd/u4A7Rg5184t85tjrxzOV0v/5UlE4BYYomrKAOVjZFf7AZ3kne/c69gMbNdIvmCShAW6MiuSOegoKImOjNrS77rUMg+O5fviwpQpWdObtG+CYNlysgkDp6pFyqpI0kPOGI+hA1dryHqBfZFaUtBkLo/BXlhQWNXfO9p2ukCTNsdyTu0yNpwpZqjgoYQpq6jTmsbXi/zcPZO3rQtl6i95XjjG45Chi3IHiOEoVIyUVvqGObgxKU/L1iIdVNaeVFBysLfz/9eo1PtD4CngkZRkVM8LJFz3pphMcwEZQMKtsuMf8t8k3V2rZoQ/+kVPbJoPjyeyMM4h1swLclLgSkvbaQGZfbk9YFuRc5Uwfbga827WLPscMzrpHpVFUlB+PDFLUDVkG8JjaWV3qduojiQxBU6JTUIFYWWi3CzxGI82bKJlMSrGsjNrBym3NcmFqUCRHrehzT6bCoVSKoHNwN+Qw2eM1NvBnh4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(29003799003)(10067099003)(11063799006)(56012099006)(12006099003)(25016099003)(13003099007)(18002099003)(22082099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3ZYSU5TV3RoWHJTalpXZXZuRm9OQVg1a3ZLNlNEYTNXa29haXBoL09zRHh2?=
 =?utf-8?B?MjBhQWplMzNQeTc5dHdJSFlOMmNrQU9Wemkwc0NmTWVWcUh1bzROT3FVSTJG?=
 =?utf-8?B?b1B5ZUhOZXZyVVd0WWhPR0NQQWtaNTdwYVBYTzNURFVnTE5XWG5TY0lPSFlo?=
 =?utf-8?B?UTdPZm1DMjlwRTVVQUpsdllxdVFXUVJiVzdMWFpwV2c2T2xyY1ZZQVBUYTVV?=
 =?utf-8?B?UjF0RFdpN216QlhPOEozQW1GaldzUVY3VjZ5eTVSS0VCSEk4U2tuMjcrQm9K?=
 =?utf-8?B?R2ltZWErZmxzVXdaUzV0Z0xxUzJPYWNVQUhVNEZrZkJXUS9xd2Y1UTdvUDl1?=
 =?utf-8?B?cjZKM2JoWGJHdjVEdFp4V1ArUXIvT2p6YVdFektCcTBXNE1vdjluUmhrcHpY?=
 =?utf-8?B?d0pMV21aMW5mZ1l1cUJLbWRJSnJ6U3pGdUhQaDdvSzRIVDNheTJRODJQQkI4?=
 =?utf-8?B?dGVVdksvbDdBcTI4dmkyT21GN0x4cnFyUis5Y1dZU0FnZlJQbDQ3VGxKSUJy?=
 =?utf-8?B?T3NnTEJDL25TRllOU3hpY3g5ZjFaZnRwVEc5Yy9yOGZiVWg2ek1sbG1NcXUz?=
 =?utf-8?B?cGluci9YdFEzVHBzVHVRQStLWVlrL253S1pWdTV4OHo2VU1OUzE4WnlBVlJj?=
 =?utf-8?B?UXZRUFR6T25HOC9BMkhxa1VSVXBlUVVUSEg4d0FwY012R2xLV1ZBWlVLa0hM?=
 =?utf-8?B?amJOVGRtb09xRUgxdXNXZXpWYVUvM3ZQOUFWRTJkSG92ellpR2pJQ0puQUFJ?=
 =?utf-8?B?aGFYa1FHanlJVFM3dlNpY3kraFhhOVZHdkN6Qzh3Y1VqSWk0UVArWVNXNC9W?=
 =?utf-8?B?NEQ1VjMvaFNwcXpnYlg0MG1XT3owRlBZRGJSWjZWTFp6bFlvVFBuWFJGKzli?=
 =?utf-8?B?K0pTTGdGeUVxcHN1NmxaQlhWaVZEWGgzS2QyNG1lUmd6N0k2N2Q4aXczeDU4?=
 =?utf-8?B?MmtoQ0xZNlk4S2xUNXFNUTg2dlRya04rcGtTNVBBTXZta0gvTDZPUlNwd2Rt?=
 =?utf-8?B?Sm95VHVFYndQSkhLSCtaZFJnZ1lXYStHdi84OGkyM1AyaG56VThOZythOHI2?=
 =?utf-8?B?UFVmUDFUeDZuRHpXaG9HQ0RCSDFsOHVSanh3K3RsUWRrUFVKcTB1STh5Q3d0?=
 =?utf-8?B?RWI5bE5kMFRoU0puYUU3b0t2anJNNnhpSlFlQnhYWU5BTDRKaUhHbFJwOVJt?=
 =?utf-8?B?S3dack5KanFzbkpHY0pGb29ZSk1sV3Blb2s4eVUvbE9oay9GajZ2aURIT3hP?=
 =?utf-8?B?T1FSRVloeFNnSXg3UmhUaWdVNllTWll2UjhZUUVaaVRZdEp2RjZQNTRXTitm?=
 =?utf-8?B?Um5zOTBURys3UmxmbVgybzhzYlJZZUtVZy9jR3M5dWYxYXJHdVd5OC9EeTlY?=
 =?utf-8?B?cURZMGdpRG9IV3RZaWJqMDd4Qis5aGs2RWMyUlVpOVJQeS96dTU0VTZpV0xW?=
 =?utf-8?B?VUQ3S0JFSFRBcS85WDZzY3dleFM5WndXcEUyemtmdUtWNXBxRVZUOXVPbDNG?=
 =?utf-8?B?TzdlR1BkQTdKVnZFWHZ0UFJOOHNKOUR3RGZvRkh6eHpJYWhUNDArUEhtd3Fh?=
 =?utf-8?B?RW9lcTE1OWJsQkpUWWtvLzlLVDc2T3dTczJQOUxzeWExV1Qzenpmak1uUmRB?=
 =?utf-8?B?WThzdFZIR1F2ZlFJNTJ6ZXdyeUVBYWtSSlQ4WEtvMjdkWXVOY2cwTUk2bzZJ?=
 =?utf-8?B?NDRVdjBmdFY5U21kRkhXMjRTdXpnNlRPcVltcFRDYUNOeEJqZ0tmVG5WRmFi?=
 =?utf-8?B?b2FLcG1mb2RndldBTXhXbC84MXh1ZmxRWHgwTDZXdGRRNUJUZUNnblkvWnBy?=
 =?utf-8?B?SFFyZGhzdll1eFB1R0pRMkZ0SW54ZE5sMlpDaytTZnY1U0srTzU5RWRib2Ev?=
 =?utf-8?B?eHdZeXBSc1gzT0l0SlhNUk9ucG9jbjZzL0dIOEJwQTZWa29TNUIzZHJFemlq?=
 =?utf-8?B?cG9KM3JwWTFVVk9GN3B4NC84RnRIK1ptOUd0WWVDbHFwRlU2L1ZabWFxRDNo?=
 =?utf-8?B?c0l4dS9qYTZQWWh3aXNrZDVIRFdtQXBHc1c3eHpsbjlWL1pycmp1Sm5OUTRa?=
 =?utf-8?B?UXlHcmJ4RWRPd3dVSXBTYmdqNUdVSkNxZE5wZmF3Z2VndGNCTGFpV2UwTFZh?=
 =?utf-8?B?WWlYdlBPdnhwaVJ0L2h2VVIwT2toeW40QnpZRWdtekdCUmZEWU9YMVlEU1M3?=
 =?utf-8?B?MEIyVWc0bHlGSSt1RFpSSTIwRG8yQko0RlVFU0RZSzRCazhIeWtyL3I2N2hC?=
 =?utf-8?B?STh0TUdrR21ZMGlObXdJR3l1UXJ4UUFPUnRGRlY2eFNsMzZCVmIzU29oVndj?=
 =?utf-8?B?dDZnbXptT2tFMWN2TXV1ampMclF0eHFteUpURFdxQjEvcm1OVitHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa41189-2406-4d67-65ce-08df1e2b598f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:12:44.4570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ucq4nqZHdkkJn6KrBgWRAizY8maWeo+ENIln1OOF9hh3Ui6xO21iNHZUNny4wygJb6r7JQf4rwiqd7sxP9yRcs8e4TC5gH6gueKkwoqx0jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246865

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTQyMDE0LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi00MjAxNAoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0LzM5NTdmMTM2ZTJl
ZDIzY2FmMTc2YTU5NGI1NGIzODI3ZjVjZWY3MDEKClRlc3RlZCB3aXRoIHB0ZXN0CgpTaWduZWQt
b2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgotLS0KIC4u
Li9nbnV0bHMvZ251dGxzL0NWRS0yMDI2LTQyMDE0LnBhdGNoICAgICAgICB8IDYwICsrKysrKysr
KysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjQuYmIg
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQ1ZFLTIwMjYtNDIwMTQu
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0NW
RS0yMDI2LTQyMDE0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9D
VkUtMjAyNi00MjAxNC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li43ZmQwYzE2M2Y4Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
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
Yi9saWIvcGtjczExX3dyaXRlLmMKK2luZGV4IDk2MWUxYjkuLjlmZTU3MWUgMTAwNjQ0CistLS0g
YS9saWIvcGtjczExX3dyaXRlLmMKKysrKyBiL2xpYi9wa2NzMTFfd3JpdGUuYworQEAgLTEyNjcs
MTAgKzEyNjcsOSBAQCBpbnQgZ251dGxzX3BrY3MxMV90b2tlbl9zZXRfcGluKGNvbnN0IGNoYXIg
KnRva2VuX3VybCwgY29uc3QgY2hhciAqb2xkcGluLAorIAkJc2VzX2ZsYWdzID0gU0VTU0lPTl9X
UklURSB8IFNFU1NJT05fTE9HSU47CisgCisgCXJldCA9IHBrY3MxMV9vcGVuX3Nlc3Npb24oJnNp
bmZvLCBOVUxMLCBpbmZvLCBzZXNfZmxhZ3MpOworLQlwMTFfa2l0X3VyaV9mcmVlKGluZm8pOwor
LQorIAlpZiAocmV0IDwgMCkgeworIAkJZ251dGxzX2Fzc2VydCgpOworKwkJcDExX2tpdF91cmlf
ZnJlZShpbmZvKTsKKyAJCXJldHVybiByZXQ7CisgCX0KKyAKK0BAIC0xMjkxLDkgKzEyOTAsMTEg
QEAgaW50IGdudXRsc19wa2NzMTFfdG9rZW5fc2V0X3Bpbihjb25zdCBjaGFyICp0b2tlbl91cmws
IGNvbnN0IGNoYXIgKm9sZHBpbiwKKyAJCW9sZHBpbl9zaXplID0gTChvbGRwaW4pOworIAorIAkJ
aWYgKCEoc2luZm8udGluZm8uZmxhZ3MgJiBDS0ZfUFJPVEVDVEVEX0FVVEhFTlRJQ0FUSU9OX1BB
VEgpKSB7CistCQkJaWYgKG5ld3BpbiA9PSBOVUxMKQorLQkJCQlyZXR1cm4gZ251dGxzX2Fzc2Vy
dF92YWwoCisrCQkJaWYgKG5ld3BpbiA9PSBOVUxMKSB7CisrCQkJCXJldCA9IGdudXRsc19hc3Nl
cnRfdmFsKAorIAkJCQkJR05VVExTX0VfSU5WQUxJRF9SRVFVRVNUKTsKKysJCQkJZ290byBmaW5p
c2g7CisrCQkJfQorIAorIAkJCWlmIChvbGRwaW4gPT0gTlVMTCkgeworIAkJCQlzdHJ1Y3QgcGlu
X2luZm9fc3QgcGluX2luZm87CitAQCAtMTMyNSw2ICsxMzI2LDcgQEAgaW50IGdudXRsc19wa2Nz
MTFfdG9rZW5fc2V0X3Bpbihjb25zdCBjaGFyICp0b2tlbl91cmwsIGNvbnN0IGNoYXIgKm9sZHBp
biwKKyAJcmV0ID0gMDsKKyAKKyBmaW5pc2g6CisrCXAxMV9raXRfdXJpX2ZyZWUoaW5mbyk7Cisg
CXBrY3MxMV9jbG9zZV9zZXNzaW9uKCZzaW5mbyk7CisgCXJldHVybiByZXQ7CisgfQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguNC5iYiBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjQuYmIKaW5kZXggZjg1ZmViN2RkMi4u
OGYyNGYwMWZkMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRs
c18zLjguNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC40
LmJiCkBAIC01OCw2ICs1OCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuZ251cGcub3JnL2Z0
cC9nY3J5cHQvZ251dGxzL3Yke1NIUlRfVkVSfS9nbnV0bHMtJHtQVn0udGFyCiAgICAgICAgICAg
IGZpbGU6Ly9DVkUtMjAyNi00MjAxMi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAy
Ni00MjAxMy1wcmUxLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTQyMDEzLnBh
dGNoIFwKKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTQyMDE0LnBhdGNoIFwKICAgICAgICAg
ICAgIgogCiBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmJlYTRlMTU0Nzk0ZjNmMDAxODBmYTJhNWM1
MWZlOGIwMDVhYzdhMzFjZDU4YmQ0NGNkZmE3ZjM2ZWJjM2E5YiIKLS0gCjIuMzQuMQoK

