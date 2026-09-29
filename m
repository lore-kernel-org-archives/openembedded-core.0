Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CE0CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:12:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7510.1790687570266231899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=slF8V2Am;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.159.46, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nc5u+4JNruTN7RhXG7E/x5gC9s7+V0MXIBPYa26iJRyE+hbY3Hzh49FnjKfJRrc5PUWuKsmoPjucMdcTnPi6aqpBm7J6Wnv6YC4JeQk+qcga9uLQa6pxRCtiOjcww+lGmKJ1WzOJZj5TWhYASM6BYk6+Y8/fnz8n/cK79RB3VLh9zyrngEicKLomuObeATMTjLQEqGdcfMhmwlw7ZmicPCqCuPvwTQhl+zlgCind1nCnb9ccAeWlrOm6w3gSgVG9Z+wGgKHRsUTM/H6duxMFbAQ2LS+PnYNB55BfhvIbgqAFDt+rdRt+ZJYxL2qO49soQt/v0Ua6U+Gp7dDXTwpuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBjcSM33TakQKf3fhYP3EVHfGO6/l/1GKmn1FDZdfTA=;
 b=T0FGsOB3NzZJnRY8lFu2ILXhw6oMGi9Cpc9BpJaz9cGjEEfiOItkXu06Ta2QrBcnYx4b0Wry9hzrewQE9VQ0Eq3qx3OP+fs5YtzXbGrWW6EOSJdc9elQf8AK8RgxXuvcV1XER6b95gkXEJT0cTTz3xEfZY3sqM59a7J7EonPsODXL94CigTnpe01gSGHCH21xomLeiX0QGrooFkHozCvlwTPfgFBtAyoHEJusxNlQ+m9QG/eBa4qOC46c/JguVlamQM51IHofQDUkLvrUMniQT2gjAHQPjP3CEotWjA8DDnl5JH2Asd2mQEJF7rGwGdVO3sNYRq/3uxS6d1cjPLFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBjcSM33TakQKf3fhYP3EVHfGO6/l/1GKmn1FDZdfTA=;
 b=slF8V2Amsd2X8PfbdF9SEA7Dpj6o/yvIaV8Z+ix4mcWDAaTeMtom6bcQLPcmUYGagDPs9rHQNeQLsOsDbprorBwGDTXC0Lnz/oEP7kQhL4XHK2jnFgM+OmvTL7aRYLb4DzblGNfr3MTw+qhiWrXpacXez/EkMKk/j2IlkIedaa8Crefu5JCAA86xVMUF8P3OeUZKfbGX8uqmjQngWQAjhjXNGfAgA+NBAhAFZE9fketOY0YPvtZ7IhHkSw3GtUtCai6XGLN/9jNrvRFvX5CcQDhXOC19ksS6HzrZfMmn1ho48XyVUIU0qhBniz2JH9ASryZt8XflcbOgFJArJBWqOA==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by AM9PR07MB7219.eurprd07.prod.outlook.com
 (2603:10a6:20b:2d1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:12:47 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:12:47 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [scarthgap][PATCH v2 4/5] gnutls: fix CVE-2026-42015
Thread-Topic: [scarthgap][PATCH v2 4/5] gnutls: fix CVE-2026-42015
Thread-Index: AQHdUBQ4lETm4L2vMUOXF39/MjPELw==
Date: Tue, 29 Sep 2026 13:12:47 +0000
Message-ID: <20260929131131.246533-4-jakub.szczudlo@nokia.com>
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
x-ms-office365-filtering-correlation-id: 687147d8-7e56-415f-d4c7-08df1e2b5b2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|12006099003|13003099007|18002099003|22082099003|38070700021|260925021311599003|260925021911599003|260925022911599003;
x-microsoft-antispam-message-info: 
 5JILGKZFyXLKcNIV/DVvyAk6zQsSSUzstxicfyayKrh4uxdv+6BEr7zCeVbJ03C4Ht3/ncWr6Kh/9r9xBJLt/NGK1ilYp7MzclvmVAOjQ+xhEOCQvGSlyLEojSsJWmVpRHMa/kx0dSvPNLEor9Xw9Fqy5KqskZTnLzKBDKa98Cb+HgG+zyXI8IMJeXNAfqyfwEGtiGKsuQ13dSCKpM0LHmVqvUdgGGmStd777xPgI3TMwk6t5R4ALrVcVPHqa5PiYAhRr2fEO1rRZaK7jlwjCnqjRZ3+x9Tzt1LxBWsldOURyxW+eMhVKhT/tE3ZNOFDXtBaszcRSJ+z9CKbGDA8tMafzT64DvfslBH3eIux4pT2by1PvVoaAIFVsZFn7TK9qCJNKg5yIMX9DX0qmnoA0IVE5tiVIiwEMdew/ROkZz6GoQgeWVUhkZXblbR4Lc/ha29eMJ9jnc1+FC9WTGMDDqu89Mx6f4ZSo3X6w1vDSe+40fY0QFQ8LVpH5GfFNdKHp3+Bnr4h443FvWxcelsU5nR92dnUBYBldiKADqHWpOd07pfo2K+g8VIuTGlYrY0ctYSt8ST/YjIufnCu4oEBc3ggIvKkaHPW5qyeoQrTsvw+iyDtnDWsK+AZi6vUFWLFpdZ2GPrxZpVXcHo6tMn362PBUt1XX5E+ACFzPv6Z8P0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(12006099003)(13003099007)(18002099003)(22082099003)(38070700021)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWpJUGcyRjc4RzdKS2RVVDRUL1R5OGNnSG8vUFZXRnV3aW1pVktHQlBJTTFr?=
 =?utf-8?B?blVCNElrcVFWMkFuSHJnSmc3bzRBOU9OeENHMC9DYkRHekVqMXFKdEtESEp4?=
 =?utf-8?B?NmFaYm9yS0pYa3plRHpjTlEzbmFiZXl3UEQ2U01yNll0djNkN3dkTFVmRFc3?=
 =?utf-8?B?aEcybFRWMGZzNXF3R21DRnlwVWZTelA4N1FiRjJTRDAzcDBOakFJU28zaTF0?=
 =?utf-8?B?eW5LdzJUcXd0dlpZT2IvaFVqWGRpcWZkaXRVWHlNRTVxYkY4bDBwYTZabXI1?=
 =?utf-8?B?akxiNVRyd3QyMXFwM3VEenRqTXpCaHVvSkVwemQyQ3BFQ0hLSUZEbmNyTGlT?=
 =?utf-8?B?VWI0RjRSR2pPSGtiYUduTXFCVEZSQkprNy9seS85M0FML3NsUitGZUVucUVj?=
 =?utf-8?B?eENNOC82bFc3Q1ZMVDJrYXdmRzJiSGR6dk1sM2QyWEVmaVZhbWhjYkJhSzFS?=
 =?utf-8?B?OWZJeHE5eTJ5bFFPS21IaWJRTG5IT1BVQmtUMUdLdW9EeGdOYnRQRzVCNjJZ?=
 =?utf-8?B?eGlrVnRtLzQ2VHBwcFlFcXJmUmRWUEJ2WDM5Zjh1TmNXRTdRUjJXTmF1U2Jp?=
 =?utf-8?B?M3RIRDlvMDNyWXZzbXVjQUFyQXQwYW5hbkIxV0FpcFE2dVVYbXE5c3JINXQy?=
 =?utf-8?B?S3M1Y2cvV1pvbjVGZmZMbGY2eXdXY3lUWU1XTVRYWENiRDhhK1lQbmVTZkhv?=
 =?utf-8?B?alBZSGJxUjJIZVhDWnlzemRkcTh6VXcvTUJ4dmFTSFFucGR5WXYvYjFVNkdx?=
 =?utf-8?B?d0Q3N3pIMnJUVGNqbmpSSnc0S3V0TEN6TTAyNE5sU1NPTEZTVnh1MGFrdi9q?=
 =?utf-8?B?VUpCRHJZd3plNWxUallnTXNFTW80SCtvK0x6UlFNL21oYUZ0UWNvZEkxbnR1?=
 =?utf-8?B?ODZuMFRKQzMvYWZuQ1NrdExFMnY0bFlNMkUyY3ZjTzRlUXV2WXZxM3hyOHVH?=
 =?utf-8?B?WFNYK2h0NjA3OWZnZnhSYnlIZUVhVTNoaHRkaEZZMllqZGE5K01wTU1zMkdU?=
 =?utf-8?B?MlIzeUd0T0pKdlBHZGovZGRVUzRuNFVHN1p3OFBtOW9oR0NUcFdsM2R0NFdV?=
 =?utf-8?B?dFBibHJ4MXlGTDc0cTA4VFJGalhqUUdWcm52RDhtQ3VwcWV3eUN2VE9YMmYy?=
 =?utf-8?B?S2VDdnpsa2RzYVRBMzNBTjkyb3YvY0puOWQwcWo1V0hadFMrSk4xeU0wcmNR?=
 =?utf-8?B?NGIvR2tKandqeXNvYlAvTU1ocXJXZ29aVGpsZ3Y0bW16ZE1UK2ZMQS9FUXNw?=
 =?utf-8?B?SXlrOHBXUVhDMnRkQkpVaWEza2t4RGRpL3N0eTNpSGxuUFAybWpBK2MyQUkr?=
 =?utf-8?B?Nm4wZFBrWmlYZUJ4c2tWRTZTNTNHVTJXby9mVVRVL1BpV0Z6YUptN0o5UlVp?=
 =?utf-8?B?L0pleUl3K1NEOTZxRmFKTFlGUE5Iay9uRFRjaTY3WFlTayt6LzYzVVFaeVJ4?=
 =?utf-8?B?c3JJTDBCK04vUFlseW5qalVwTHBaZGN0UlpDTWhKQU1Sc1RlRVhIMkRNSnla?=
 =?utf-8?B?TjVEclFxUHVCdGFyTzJHb2lTYjdDSVZDeDFwc1lBTHBkS0JJM3M5QnRhM1Fw?=
 =?utf-8?B?UVZ2c2kyTWZXZC9SUHFOMGszK2FCa0dwYSsyamZJRnZxNkVmdUxPU0VKVjFl?=
 =?utf-8?B?ellIUUhqR3hFbHJhVDJJaTVKRnZwVWVJZVlsOERBWlVWckpVR2ZTL1pSR2ts?=
 =?utf-8?B?QW9CdUlsaDRtTjB6RStnWE9mWFhkR3Iza3BMOFVGL01VTUZ5ZEtJQklLSnZJ?=
 =?utf-8?B?c29RTHNWZzN2QzNvSTh2MXRxU0ZQY1VpZjlOdGl4Wmlkd3N2b2FORDNlVlFu?=
 =?utf-8?B?UFo0Q0tNVkF5cldhOCtmRDlCQ0xrdDdNVm9vMnhYSlM5ZGgvY2p3SWVvN0RP?=
 =?utf-8?B?OEtkZUNtZ1RUdlhoUFZKRHdhR25kK0FzRUtiMlAxcjUvNEtWV1dlYytSRXZK?=
 =?utf-8?B?NjFxckRDMWFwYk5pemsxYjhldEJwYXVFV2IzSXl5ejV6b0N2UHE5QU1sWk1O?=
 =?utf-8?B?UTZlRk5KeXBTQ21JdVRBMXdSR3RkVGdZWTlzSFVtRGdOcWZXYWNqc0dhU0Np?=
 =?utf-8?B?THc5MHhuVEMrMnBRdlcwMHpnWTRJUld0Z0pBTzhUQUZ4cFJmMzhQSENDUWMy?=
 =?utf-8?B?RjNCWW9nRWw3dGNrUVpRNEFTRGxOZ1NyQTh0V29uMEZmbWJGQ1FrZXRPc2pR?=
 =?utf-8?B?QXpvcjhtK0ZYZzNOa0dzcjlnUmJEWFpCODFFWTZ2dEh0amkxSkRiVjNxek1D?=
 =?utf-8?B?U052Z3JyUGdaUUpFRm94azJaWHRnQnBCbFd5TUV1ZWh1ejM5R0V2ZzVFUTdD?=
 =?utf-8?B?UGUyckdzWisrVGtVRVY0VWgrN00zWC8zM2NGV0djVXExVHJBV0pyQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687147d8-7e56-415f-d4c7-08df1e2b5b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:12:47.1493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Ury447Bx2XbN5lLerLfwH+hsHJEtbG+EzP0hZC2t9lnF+fii7MnBpTRZByzlRNyxIC/dSbaw/GEwNRT/uDEt7ZXa62WxyfbOYTLGvFaU6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246866

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTQyMDE1LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi00MjAxNQoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0L2EzZTdjNTBkM2Ux
NzYxZTVlZjFkNGIyMjU1MDdjYWI4ZjJiMmMzY2EKClRlc3RlZCB3aXRoIHB0ZXN0CgpTaWduZWQt
b2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgotLS0KIC4u
Li9nbnV0bHMvZ251dGxzL0NWRS0yMDI2LTQyMDE1LnBhdGNoICAgICAgICB8IDQzICsrKysrKysr
KysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjQuYmIg
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQ1ZFLTIwMjYtNDIwMTUu
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0NW
RS0yMDI2LTQyMDE1LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9D
VkUtMjAyNi00MjAxNS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4xYTIwNjUzNzFkCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
dGxzL2dudXRscy9DVkUtMjAyNi00MjAxNS5wYXRjaApAQCAtMCwwICsxLDQzIEBACitGcm9tIGEz
ZTdjNTBkM2UxNzYxZTVlZjFkNGIyMjU1MDdjYWI4ZjJiMmMzY2EgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBBbGV4YW5kZXIgU29zZWRraW4gPGFzb3NlZGtpbkByZWRoYXQuY29tPgor
RGF0ZTogTW9uLCAyMCBBcHIgMjAyNiAyMjo0MjoyMCArMDIwMAorU3ViamVjdDogW1BBVENIXSB4
NTA5L3BrY3MxMl9iYWc6IGZpeCBvZmYtYnktb25lIGluIGJhZyBlbGVtZW50IGJvdW5kcyBjaGVj
aworCitBcHBlbmRpbmcgZWxlbWVudHMgdG8gYSBQS0NTIzEyIGJhZyBoYWQgYSBib3VuZHMgY2hl
Y2sgdGhhdAorcHJldmVudGVkIGFkZGluZyB0aGUgMzJuZCBlbGVtZW50LgorT24gdGhlIG90aGVy
IGhhbmQsIGl0IGlzIHBvc3NpYmxlIHRvIGltcG9ydCBvbmUgdGhhdCBhbHJlYWR5IGhhcyAzMi4K
K1N1YnNlcXVlbnQgYXBwZW5kaW5nIHRoZW4gbGVkIHRvIHdyaXRpbmcgcGFzdCB0aGUgMzItZWxl
bWVudCBhcnJheSwKK3NtYXNoaW5nIGl0cyBsZW5ndGguCisKK1RpZ2h0ZW4gdGhlIGNoZWNrIHRv
IHJlamVjdCBhbnkgYmFnIHdpdGggMzIgb3IgbW9yZSBlbGVtZW50cy4KKworV2UnbGwgdHJlYXQg
dGhpcyB2dWxuZXJhYmlsaXR5IGFzIGEgTG93IGR1ZSB0byBob3cgY29udHJpdmVkCit0aGUgcmVx
dWlyZW1lbnRzIGFyZTogZm9yIHRoZSBjb2RlIHRvIGJlIHZ1bG5lcmFibGUsCitpdCBuZWVkcyB0
byBhcHBlbmQgdG8gYW4gaW1wb3J0ZWQgdW50cnVzdGVkIHVuZW5jcnlwdGVkIFBLQ1MjMTIgc3Ry
dWN0dXJlLgorCitSZXBvcnRlZC1ieTogWm91IERpa2FpCitGaXhlczogIzE4NDAKK0ZpeGVzOiBD
VkUtMjAyNi00MjAxNQorRml4ZXM6IEdOVVRMUy1TQS0yMDI2LTA0LTI5LTExCitDVlNTOiA2LjEg
TWVkaXVtIENWU1M6My4xL0FWOkwvQUM6TC9QUjpOL1VJOlIvUzpVL0M6Ti9JOkwvQTpICitTZXZl
cml0eTogTG93CitTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU29zZWRraW4gPGFzb3NlZGtpbkBy
ZWRoYXQuY29tPgorCitDVkU6IENWRS0yMDI2LTQyMDE1CitVcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0IFtodHRwczovL2dpdGxhYi5jb20vZ251dGxzL2dudXRscy8tL2NvbW1pdC9hM2U3YzUwZDNl
MTc2MWU1ZWYxZDRiMjI1NTA3Y2FiOGYyYjJjM2NhXQorCitTaWduZWQtb2ZmLWJ5OiBKYWt1YiBT
emN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgorLS0tCitkaWZmIC0tZ2l0IGEvbGli
L3g1MDkvcGtjczEyX2JhZy5jIGIvbGliL3g1MDkvcGtjczEyX2JhZy5jCitpbmRleCA5MTFhZWZm
Li4zODIyODYxIDEwMDY0NAorLS0tIGEvbGliL3g1MDkvcGtjczEyX2JhZy5jCisrKysgYi9saWIv
eDUwOS9wa2NzMTJfYmFnLmMKK0BAIC0zNzUsNyArMzc1LDcgQEAgaW50IGdudXRsc19wa2NzMTJf
YmFnX3NldF9kYXRhKGdudXRsc19wa2NzMTJfYmFnX3QgYmFnLAorIAkJcmV0dXJuIEdOVVRMU19F
X0lOVkFMSURfUkVRVUVTVDsKKyAJfQorIAorLQlpZiAoYmFnLT5iYWdfZWxlbWVudHMgPT0gTUFY
X0JBR19FTEVNRU5UUyAtIDEpIHsKKysJaWYgKGJhZy0+YmFnX2VsZW1lbnRzID49IE1BWF9CQUdf
RUxFTUVOVFMgLSAxKSB7CisgCQlnbnV0bHNfYXNzZXJ0KCk7CisgCQkvKiBiYWcgaXMgZnVsbCAq
LworIAkJcmV0dXJuIEdOVVRMU19FX01FTU9SWV9FUlJPUjsKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnV0bHMvZ251dGxzXzMuOC40LmJiCmluZGV4IDhmMjRmMDFmZDMuLmJiOWJjMGFmMDUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjQuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRsc18zLjguNC5iYgpAQCAtNTksNiAr
NTksNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmdudXBnLm9yZy9mdHAvZ2NyeXB0L2dudXRs
cy92JHtTSFJUX1ZFUn0vZ251dGxzLSR7UFZ9LnRhcgogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIw
MjYtNDIwMTMtcHJlMS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAxMy5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAxNC5wYXRjaCBcCisgICAgICAg
ICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAxNS5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjJiZWE0ZTE1NDc5NGYzZjAwMTgwZmEyYTVjNTFmZThiMDA1YWM3YTMx
Y2Q1OGJkNDRjZGZhN2YzNmViYzNhOWIiCi0tIAoyLjM0LjEKCg==

