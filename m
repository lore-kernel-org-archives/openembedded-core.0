Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B79C5DF85
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 14:47:42 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.367.1787237259882501533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 07:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=ZZuDVpGP;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 40.107.130.38, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjQ6ObqKTUpTYxM9rXO91nfnoLFVtpfI8MRHCyjXq78qQ5BmExepP+GHM2yDtBL+NTbYTpB8bjFSMvkn3SAgn+vHR/HHt4Zik90UpvFBIolJYajrXzE44hL5EdO/tLbrEuY4ucHJkiN6hzCbBEKPcad/LZjzB3HFDbL0YIa5p0iuCsv4vsAKfyLloV363bAliJptucn8feziEA8ZELIIfGp6UlQgb5WM/oCd0iOz+NeSNqPDlIhF9Cd4q9tjZ0v2Yv0VuLd/v6jLgA3ByWS9DNvaA848sGCBoYT96HsQTYAXYJhAioUMn+wxOljCKgDos4MIGr05YsbmppoutS+OpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/PwfANed5nruknWORT588keftiNRNEpyRC9LN0Z6aQ=;
 b=wc2aTM93VdDJ/0wNCnFs8lVRwTHYww1yQ0mySXo2fO3CRsnBHhF/FCs25Zjm91Nbr6i/KL2eZfXlnP40hWgiczFUSrRSaYP3tkkFS6ohoQZWEycA5w4iwDoMVf2Idh/zRZahzdjVMmsw+Vt89bH4FiupNPt8b/+Oo6xYNgPo80dqmakM/VdmsSDykR8RWmVsbXkzisQgE7Q68wC6twAxjq/t85hjqVSfy3v3d3gvbt/QU+CWwkdchfaWxMvFINBrgbqBAw3JjWzX5+Ss+q1U0u22llYwz/K4HuqUdXX975J/2IxdKR8N8SkFyyNoQBnoDQ2fPC0unB4yitP5h7CSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/PwfANed5nruknWORT588keftiNRNEpyRC9LN0Z6aQ=;
 b=ZZuDVpGPb73cj29bGQc7oD6jfPQ6bz66jUvye2oXXBO0DUHQb0jN+Z8+oHMbblqv30OyWmYBtyNDlwaWzl4ofcc1gvYwkfvq3seeU3QgAKkIatzYvNqyUnXKoYpvFE+TVbAleqCoJZSBPUCxK+QmlcrMOA6XVtXX1llr+kA1z0Uvr6K5Yd1TQegY/oH16m5dG4Jf8wHuGKZM0QyJ0xNrXj1Sq7PV9DqTGDQNCdupL6dft7bnOJ96PcPm2NQboCkjT6Dj89ujPx1P5P1au8HHb/I5R/cmyJ7ZCoFOp1GjYXClmvYq0DFC/OCYwMAZpW44d35J9zE1kplF+qYPE8Hhww==
Received: from FRWPR07MB10660.eurprd07.prod.outlook.com (2603:10a6:d10:183::9)
 by DB5PR07MB9584.eurprd07.prod.outlook.com (2603:10a6:10:4a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 14:47:34 +0000
Received: from FRWPR07MB10660.eurprd07.prod.outlook.com
 ([fe80::9105:401:e0a2:a997]) by FRWPR07MB10660.eurprd07.prod.outlook.com
 ([fe80::9105:401:e0a2:a997%4]) with mapi id 15.21.0360.003; Thu, 20 Aug 2026
 14:47:34 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH] gnutls: fix CVE-2026-42010
Thread-Topic: [wrynose][PATCH] gnutls: fix CVE-2026-42010
Thread-Index: AQHdMLLWwIRaU+Qj8kOnJBUi0XB5FA==
Date: Thu, 20 Aug 2026 14:47:34 +0000
Message-ID: <20260820144727.4893-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRWPR07MB10660:EE_|DB5PR07MB9584:EE_
x-ms-office365-filtering-correlation-id: ece0c15d-7aff-4f2d-6cf7-08defec9f8c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|29003799003|12006099003|25016099003|11063799006|18002099003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 45nQFvZWAzhDvjpkuBARyMOrvVsCcBQDNbakwdD6IPQwHbpzka/9oBtbQZ5wlfuy53HdlbN7Q0bKe7VSNFkMhwhh8Lkm7ReBXCDpqTjjGb7wnJ798IDd2eGsDMFdlzccGKRb5abpW9soTTslJXXsr3AaHgJUosbO/w76k3UzTYtK1kjQY7aF5aI/1SUY/4xc6DVbZ4uMu01vsWj9XoMpe3INa9GCAxyrGuMWecrttbmoof2cDstl5wRVxwkFQmNqj1ntGPOYEbFOleVHIMQfhqfYLt0V4WzmRlQZ24tdZM7HyUHKFiuYMWULFtSNiQqXsts6rGKZgfdubm2c4mNW3H1Ol3/WI8TOAPms+BUiZi18WOrbtXtAPO5/0qW2alHhSDDPDed31TaPcDH7Psjm61Ltrffkhb3Cm6jwSlZZ0sfeYioU8avkeI9OKWDFUf86JDEyoZ93vEfAFfQwULiY5758PBvxqMRLwjK7/cajmihWfwst7DndcSTTnX/AIfywTAROdPxdz7sh39LURFohDymkc925o262d3H+D2gr9BIuUwVFcBZw93RlkACIhk5PkTFcdVQapoMQ7rggl77cyKSRoxKDmv4sTRkx1qeYksNHdE5xcu3au/SgOBnK/ns5nR/LKgi2v1Pwovu/F3/wnJZygL4C4C3lSjQm66cF8iO6cZglW0QpeACCRk/7rZvWWcfKk9CO5T+p3LXWe/8IC3dadViBRbVetwATsiX/AEc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWPR07MB10660.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(29003799003)(12006099003)(25016099003)(11063799006)(18002099003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjJZakUzSE5zSnlUTHEwLzhBT1lTMTR6aUt0TFZsVjRsZ3dVc0Z3KzVsbHox?=
 =?utf-8?B?ZVc0UW1iQlRWTFFzQ0hLbHV2RHk5L2hQdzZzQ0kzOXRZRDhXbkhsUC8vWFFl?=
 =?utf-8?B?WStoQzFRb1JDUi9qV29PSkxabDVWRWNrTXNLSjBKc2NwQnlpdk1Nbi9hODYr?=
 =?utf-8?B?NjNHTm5Ec1FMRjNEc1hybjlKaGVKV256UTMxVEJPTG9hS1hNT0d1UWFaTVcw?=
 =?utf-8?B?Q3ljQnhsTUdydWltaVVwVXZOL3NGU0ZUc0RKd2U1TnE3cTEzM1pNWUJBYU5L?=
 =?utf-8?B?dDY2TGNDVGFtSGh6Uml2S2pOd2pRcnpkbFZidkdneGdwT25COG9OaGlRR3E2?=
 =?utf-8?B?NlRyNCtkRWJ0aXp0S1Q3YTFXVDJ0eWtna2VaVDJLZlZ6MmplT09DQ1dpcWJ6?=
 =?utf-8?B?aThWSC9uQ3cyaVBPTWZDTlJMdEsrWkU5Z3l1SEVld1Z3R1d1QnhObWdGeW5P?=
 =?utf-8?B?cnBnVk9qMTA2T09LdEExL21rSFdSSnRGUXAxWXI5TzBkK1lwM05mYjRuL1A0?=
 =?utf-8?B?d3VtTDJvc2FQdDBlWU15SExlOHloOVVNVkhwdmc4NUt3cE1jZk9FWWkzWmJX?=
 =?utf-8?B?M21qZU5oWkpCcmNXV2dQcFl4UlRaR1Z5NzVYcTN3cnJBbHRZM1JlQkFlam45?=
 =?utf-8?B?Zi8vL2UwWmdsZEFrbEZaRG5ZUW1YMlJqSC9jRXZqMXl0bGdaSzEyNVVpY082?=
 =?utf-8?B?U1FjZHpJS1dLOVVtSVFmWTB3elNJekFzbDJXZHVSVmVZQng1aW5uWHdVUGho?=
 =?utf-8?B?SjNLbVNGNFN0S1VIUm5oL2tOeE9Ia1FlOGlmMnh1SzlFbVVxQ2wwT0duOHFS?=
 =?utf-8?B?bVhXb1ZWUlZTTk9WYW9Ic3lLUWZ0UlpXMDVMbHRnOGE4QzI5RDU2d0tMaVcw?=
 =?utf-8?B?Z1VnTHIzZTRDbEhwRjk1ak54TG5yMGFtZFQ1cXhDczhnSWZNaFBQbHAvaHFK?=
 =?utf-8?B?Z0x3eGh2RjNUZ1RsTTZwZTgybis0dTZPZjhhQ1g5MlZZYTN3YlVJYTludWFF?=
 =?utf-8?B?dEd0Q2pLbndyTi83WUxEVUloZVB1Q2Y2R0VFNnlKaEhTU1NCbG1leG5PWXRM?=
 =?utf-8?B?OXQ3eEhTYzUyWCs0MkhMcGNxejZkKzlJQlUvUG1YVlNXTStETGVlRm95VHpY?=
 =?utf-8?B?YVVzZGJHczdpYmtwQ25mN0dyU0E5NWRkdjFOMENaeVBSTy81UlEwUEtHQnYx?=
 =?utf-8?B?ZUtBcWRaalI5OTl0Y20vMGNTcGhQam9Ub2QvNC9xMWRGRXlGa2FIcWNZTERo?=
 =?utf-8?B?L25yaWpGdW9VSVhEdTc2OU9sN2RRRndBMVFxSEJwT3dsQXdRSnRwVTQ4TXVO?=
 =?utf-8?B?Z3FocTZibEkzZ1dTZjVManBmcUs0aWIzaEhnMWJ4SVhJMkV0UHhkNytZcHNZ?=
 =?utf-8?B?OWtJVGh0WTBuc211MEQwc1FNbTcyaTl4YlJ4OE5ybGNEdTA2U0pGYTJGSVhO?=
 =?utf-8?B?YlR5bG1ENnlMdktuTG5vMmVXVW50M1JLSko2bEQwNFdybmhWN2hqb0ZVMnFl?=
 =?utf-8?B?WFVXNjNSMkM1cnFHWXRKNXJlcHdYY0cxSzBYaUFuZkxKTEhuQzBBczVIb0Mv?=
 =?utf-8?B?dFdCMFNyREwzemhLQWoyQ0FlN1MxQ09YUlRZbWtFcUFyeDJRUmRFcXZVV1VB?=
 =?utf-8?B?N0c5VGhGQ0pscm80bVNsMnM2aWgzUzA4bmVNbHR4ZityS0RFbkpHSzd3Z1Ni?=
 =?utf-8?B?Vmo1Z3E0VlY4aS8zS2poV1h5aUhDWTJyUi9HZkhobHc1d2hTamVuOTV1N1k1?=
 =?utf-8?B?b09RWVcybDNIdkNCN2g3RVVuK3FsV1pLSURPQkowRy9mbkZOamczY2w0Sll0?=
 =?utf-8?B?dGxwd1doNVZ5dm5wRFV4c1hob3cxb2cyaEFGWkhGamgvT3Uxa0x4TjhVVWhF?=
 =?utf-8?B?bVA0UWNDV25YTWJqRGlVbHBrV0MxWitLUHBxR3M3WVA3cFkyUGthZ0psb244?=
 =?utf-8?B?YnhqaDJvbm91aVdkRnRZNXBHZjhXSjVhTUxYVlpzMGk1TUoxUWlFbDQyYTh4?=
 =?utf-8?B?MUNGODhzWUhTZExiTlVhWS9KcXdsL2RxMnVmc0lOSUVYWUN3ckloSE9TU1di?=
 =?utf-8?B?eENtSjBOK09qRTlKMVAxSjBhTUdrRWNGUnBxdjBFcCt5Qk5PK29VbTJOTVl1?=
 =?utf-8?B?VmhjeFFYTHV5K2o5Wm5ubFBqM1YvQzZmUkYyOUZHd3E4NWVaVE9GdW5BbGxu?=
 =?utf-8?B?aHpzTGg4U0VKU0dWYjB0WWUxTHNWTStKNDJwN2kyU2FVajQvWS9OSTdJbWo0?=
 =?utf-8?B?dmVleTdOR2d1aGZFQjJ5c05LNTZSdWN2VVluUlV4NExkbW5xeUpaSmdES3RL?=
 =?utf-8?B?Q1pDTit2MHJMdVA1RFljZzN2enA1N1VnOVlFb1EvNE8xQ0pUT0Y5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRWPR07MB10660.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece0c15d-7aff-4f2d-6cf7-08defec9f8c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 14:47:34.8095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGriGoqSh5zVdcG2wYSQgXRwITfWScxlJdWagPNVCSo4eiy5Miz+xeNZivz3JKp1KSaR3GQJDegqALd009j4KCyOC9P2UD/oZ95XhgMggJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB9584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 14:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243869

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTQyMDEwLgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi00MjAxMAoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV0bHMvZ251dGxzLy0vY29tbWl0L2NiMTgzM2FmZDli
NjMwOTU2MzIxMWIxYzBhN2MyOTFmNTJjYTk4ZDUKClRlc3RlZCB3aXRoIHB0ZXN0CgpTaWduZWQt
b2ZmLWJ5OiBKYWt1YiBTemN6dWRsbyA8amFrdWIuc3pjenVkbG9Abm9raWEuY29tPgotLS0KIC4u
Li9nbnV0bHMvZ251dGxzL0NWRS0yMDI2LTQyMDEwLnBhdGNoICAgICAgICB8IDQxICsrKysrKysr
KysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEyLmJi
ICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHMvQ1ZFLTIwMjYtNDIwMTAu
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzL0NW
RS0yMDI2LTQyMDEwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251dGxzL2dudXRscy9D
VkUtMjAyNi00MjAxMC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li5iOTRhMzJhZmZmCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
dGxzL2dudXRscy9DVkUtMjAyNi00MjAxMC5wYXRjaApAQCAtMCwwICsxLDQxIEBACitGcm9tIGNi
MTgzM2FmZDliNjMwOTU2MzIxMWIxYzBhN2MyOTFmNTJjYTk4ZDUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBBbGV4YW5kZXIgU29zZWRraW4gPGFzb3NlZGtpbkByZWRoYXQuY29tPgor
RGF0ZTogVHVlLCAyMSBBcHIgMjAyNiAxOToyNjoxMCArMDIwMAorU3ViamVjdDogW1BBVENIXSBs
aWIvYXV0aC9yc2FfcHNrOiBmaXggYmluYXJ5IFBTSyBpZGVudGl0eSBsb29rdXAKKworQSBzZXJ2
ZXIgbG9va2luZyB1cCBQU0sgdXNlcm5hbWUgd2l0aCBhIE5VTC1jaGFyYWN0ZXIgaW4gaXQKK3dh
cyB3cm9uZ2Z1bGx5IG1hdGNoaW5nIHVzZXJuYW1lIHRydW5jYXRlZCBhdCBhIE5VTC1jaGFyYWN0
ZXIuCitGaXggdGhlIGNoZWNrIHRvIGNvbXBhcmUgdXAgdG8gdGhlIGZ1bGwgdXNlcm5hbWUgbGVu
Z3RoLgorCitDVkU6IENWRS0yMDI2LTQyMDEwCitVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFto
dHRwczovL2dpdGxhYi5jb20vZ251dGxzL2dudXRscy8tL2NvbW1pdC9jYjE4MzNhZmQ5YjYzMDk1
NjMyMTFiMWMwYTdjMjkxZjUyY2E5OGQ1XQorCitSZXBvcnRlZC1ieTogSm9zaHVhIFJvZ2VycyBv
ZiBBSVNMRSBSZXNlYXJjaCBUZWFtIDxqb3NodWFAam9zaHVhLmh1PgorRml4ZXM6ICMxODUwCitG
aXhlczogQ1ZFLTIwMjYtNDIwMTAKK0ZpeGVzOiBHTlVUTFMtU0EtMjAyNi0wNC0yOS00CitDVlNT
OiA3LjEgSGlnaCBDVlNTOjMuMS9BVjpOL0FDOkwvUFI6TC9VSTpOL1M6VS9DOkgvSTpML0E6Tgor
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFNvc2Vka2luIDxhc29zZWRraW5AcmVkaGF0LmNvbT4K
K1NpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KK1Np
Z25lZC1vZmYtYnk6IEpha3ViIFN6Y3p1ZGxvIDxqYWt1Yi5zemN6dWRsb0Bub2tpYS5jb20+Cist
LS0KKyBsaWIvYXV0aC9yc2FfcHNrLmMgfCAzICstLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMiBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL2xpYi9hdXRoL3JzYV9wc2su
YyBiL2xpYi9hdXRoL3JzYV9wc2suYworaW5kZXggY2M5MmI0YWE5Ni4uMjdjYWYxODc2OSAxMDA2
NDQKKy0tLSBhL2xpYi9hdXRoL3JzYV9wc2suYworKysrIGIvbGliL2F1dGgvcnNhX3Bzay5jCitA
QCAtMzIxLDggKzMyMSw3IEBAIHN0YXRpYyBpbnQgX2dudXRsc19wcm9jX3JzYV9wc2tfY2xpZW50
X2t4KGdudXRsc19zZXNzaW9uX3Qgc2Vzc2lvbiwKKyAJICogZmlsbGVkIGluIGlmIHRoZSBrZXkg
aXMgbm90IGZvdW5kLgorIAkgKi8KKyAJcmV0ID0gX2dudXRsc19wc2tfcHdkX2ZpbmRfZW50cnko
c2Vzc2lvbiwgaW5mby0+dXNlcm5hbWUsCistCQkJCQkgc3RybGVuKGluZm8tPnVzZXJuYW1lKSwg
JnB3ZF9wc2ssCistCQkJCQkgTlVMTCk7CisrCQkJCQkgaW5mby0+dXNlcm5hbWVfbGVuLCAmcHdk
X3BzaywgTlVMTCk7CisgCWlmIChyZXQgPCAwKQorIAkJcmV0dXJuIGdudXRsc19hc3NlcnRfdmFs
KHJldCk7CisgCistLSAKK0dpdExhYgorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnV0bHMvZ251dGxzXzMuOC4xMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9n
bnV0bHNfMy44LjEyLmJiCmluZGV4IDNhZDAxMTc0MmUuLmIzOGE3YmJlODIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEyLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEyLmJiCkBAIC0zNyw2ICszNyw3IEBA
IFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuZ251cGcub3JnL2Z0cC9nY3J5cHQvZ251dGxzL3Yke1NI
UlRfVkVSfS9nbnV0bHMtJHtQVn0udGFyCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAw
OV9wMS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi00MjAwOV9wMi5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9DVkUtMjAyNi0zODMzLnBhdGNoIFwKKyAgICAgICAgICAgZmls
ZTovL0NWRS0yMDI2LTQyMDEwLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYTdiMzQxNDIxYmZkNDU5YWNmN2EzNzRjYTRhZjNiOWUwNjYwOGRjZDdiZDc5MmIy
YmY0NzBiZWEwMTJiOGU1MSIKLS0gCjIuMzQuMQoK

