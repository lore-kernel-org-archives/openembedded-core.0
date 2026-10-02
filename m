Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE65CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 11:02:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8916.1790938941428428743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 04:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=Hv0u9ORX;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.65.22, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amNMxPKsuhJ1uQNmuy01Bs7u0Pjyetzs8Mv2NohlXW7M8+LokENvywlebMRYO7UcHQIvfgy+TAWgQscTDQbNWp/kQ5X6UU/NuU2k3ACCWq8z5/xZK+pSRJzA02s0JVnHuk2braCB1prii1HjCu7gfovvTmK8Q9bYsFPpK+GjVbk0LiayyS3yoX8UNVkBeCqgGF0JlYMO2JQc+jImb0fj9LfZqEx1Rnginb9B1I+oiv21dw5ODb2gqMCQyYTWt7H+8zcbp1wawj1kDpZFpGO1JHYtIuyogEF70DISeiJI1bKbuEi7RHXxpU2MLB24y7zKRwzo7LXcI5XIlvPb1cF6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0a6Agzd/i8O5Y84x+R4oAwO/q6Q98ghg5V86Vxg3kfE=;
 b=itI5KlNIpKwYel2tdytn8iyhwjPJGHP8rnVWcx+LwYmieGFqSxh5xw0s2Fucq1qD3H+Ls14cOC6klCBvEppRVgOyOvVC3xISkc61t66/DSIU7o4S5SK2x0vFx3yWjDpzNbY+TVzpC/WiN2HT1r2SSL37wv3zlS8+Rfmt0lc8bXCIGe3mJznPozScKNWqGDxcKyJS/HQDW827jf1syaAWiJ/V6kiBZzK1b4lX44+qx5rWAhsF3TGjsUXZa/957Y8agrGJ4dRHkfYIHL1S4Q8d2A8NkO12J6l3jXuygBBI8la8aVdaCkPJB0SrGzsJS7RUjg5DumEpXaRChyAZiRR07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a6Agzd/i8O5Y84x+R4oAwO/q6Q98ghg5V86Vxg3kfE=;
 b=Hv0u9ORXwHgwjWgt9VP0ecYbblFyZvAkKtASOUsVL16vOjhJkL9lZS5v6x5SLyDau6CGFZ7q1L7NVYm4WgXwVB5YsXVMcZkrUpi8cDQRJf2glWwCNSddcmR81mz/Qa4s19dWKGtqeAdt6qo4fcJDK86bX6GGv93YWhP/jY4BiuJWV4ScU+pHxxREdm/0rvS6F43UXIVFXzUWkF3afyvt9NG9tTYPlaWuDiT+yrV5HvYjmSqPtSQ99hxLEEXfvLRGPBObSLin+1WdDj6n0/tLr3yy3WMmefT4ZPKlkh9Nla9DZ2ib1iEte3QfVq/7iGcxq14dffdFmuy1PZjztQuypQ==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by BESPR07MB196443.eurprd07.prod.outlook.com
 (2603:10a6:b10:130::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 11:02:18 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 11:02:17 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH] libarchive: fix CVE-2026-15028
Thread-Topic: [wrynose][PATCH] libarchive: fix CVE-2026-15028
Thread-Index: AQHdUl19HDOevGxmcka0yDdok1Utuw==
Date: Fri, 2 Oct 2026 11:02:17 +0000
Message-ID: <20261002110211.11669-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|BESPR07MB196443:EE_
x-ms-office365-filtering-correlation-id: b52cc640-9504-4f23-ab76-08df20749fd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|38070700021|11063799006|56012099006|6133799003|12006099003|260925022911599003|10067099003|260925021311599003|260925021911599003;
x-microsoft-antispam-message-info: 
 WzwoCXmjEk4oyKx+xmOIn/tbDgynrVsZ+SmjZDQsw7HzOs5wvH9YEP6QbVqKfo9U6XJ2DRo2BzZmEx1XKc67eCAvobFGo0baA3vryjfxfX518qUUdWv0MikLpXFy5VqqZ+DcK3zzk0lRpFR5+L8u3zxiyVWLJCF1YEwuh4A4b8ESMAew72aFLYzoX1VgPDBTxITCe+IEyZdr6y0+yd5/OIseECHu2ZXR+i31YdxSIDT/rdyZhoudkp7++4H9+rzBnjPTGQDq7KxSFhsf7pQFMdw7q4OlEfHN+P9TZ5Cz/6lKtWPfcxFXHesDgHrnM2ebADzhNuJOFPbe/MhUiF6hL/dYBIYo45RFF8mdiAWf5azZqhz0rMF6yVinco4WbmP/l4c4h0EqY4bxrfYRdsFPN7fjlrdkNklt+kgWeCkge79YrDC8Nr4ptyE7klrYjDhvp0SDyXPc6HDc5/PqVnwVdoKzBTCHQBztXBXnGSbwoYUQrnrLkEtJYalTdC7aDxesURveGDkLa+fSZAdf7cTals3Jnas/gOuKrp39oR6CAvlz6k6BW4fnJAOt/7Mb3sf2F8PxjfxaAYLwzSVVVTRHJoJO6M2k2AdnMkf6NPtK07FmJeBpJGpgKVPRNyag+5sLWytvNocs4ZYGsxLHC3ajOjlpr5hA6PN2nWicBVGQQbY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(38070700021)(11063799006)(56012099006)(6133799003)(12006099003)(260925022911599003)(10067099003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VFhHanhXNmV2Vy9nSFdrTVFJWFhlc0IzM1JiazcyYTlRV1dXTnJucktKdGww?=
 =?utf-8?B?eGlINVpKNzlBcmd5MVhsdDB0S1NycWtHdVBDRjhtemk5NUgvWXZHbzlQWnlN?=
 =?utf-8?B?STlycW1sNVh6QXBZaThhTXU4WktrNE96YjJrcXkyQ0hSTWxsUzQzVWR3L0lY?=
 =?utf-8?B?U3hnY1NLTFRIUm40cGZCWUgvQVN3YXpLT1UxT2FvUkU5U3ppN1J3anM3T2Yx?=
 =?utf-8?B?RUhvS1c2MWZkMy95SEtEOWZ3Tk1QcEltTzhOY0U2ckZBMStWVG9MMzFTK09C?=
 =?utf-8?B?V0IxMDNZMktacFJ6NnZoRzZnNjU4aVpMZm1mNWdpRTBsMFBSWndIZGZ6a1dN?=
 =?utf-8?B?KytXRkdIZHpNNEtxbTYxQVo2TEl0dXVFZGxJaURJMElkZ1BUcXIwNWtVWG1B?=
 =?utf-8?B?VzFNWWJBQlpmNkF4akh3dEpjVkNkMXBEUlF4dm1oVm5sZ0tjY3psR3M0L1JP?=
 =?utf-8?B?VnpxY2pzR1l0c3hZZ0RSeXJJUUJsWWZ5dkZPMndXZ1Jnb0NWWHM5OW0zWjAy?=
 =?utf-8?B?ay9mR3RBbWFGMy83R2RkNjFxbFpqSktJTUh1M2lLNXEvdXNQKys5akRLSCtT?=
 =?utf-8?B?RUg1OVNXaDJrTmkwcm9DdXJVRVlhbXZrUHhGWUpnWFRWdklHSEpsMGZXRHRx?=
 =?utf-8?B?ODdwRGxMakRaUXlzR0xIY0JGTmhieEkwT05uZU41cE9uRkNGK1ByaldhVFJk?=
 =?utf-8?B?RnhGOWhJNGp1emFwVEFLRmJFMi9qQzM3RlFZSjN2SktWQVlOcU1kWnpLaGYz?=
 =?utf-8?B?QkVzVk9ZT1BZK3B1VHBPUWdJc0VuanYxdGJWeUhUczBlZlFrNk52TlRXa3ZE?=
 =?utf-8?B?SWF6ZGc2SkxMa3c2aVQ3b1VjeUxpNkFOakFsdXFVSzQ5MFA5MDV2NjV6ZnU2?=
 =?utf-8?B?eFVjdCszVE5CWVVlVmZOYmRNcWJudGhXV2JDN2syMDQ1c0ZGQjh0UlZDZGFp?=
 =?utf-8?B?a1JWTXdIWUFqb1JSVGxJaUk1c2FkUVlnWi9HZU56N25ZL3Evd0Q3VTlGMGV3?=
 =?utf-8?B?dzYwNElmbUFWTmgyemhhTWV0ZUY0NWE5WUFKd1RTVWVXUStUb1dGSEZvZTZj?=
 =?utf-8?B?anpEOU1yUTl6OElNdmFMaUVIbjJkY1ZCNUVVcVIyaE5aR2p6YmdtUlRqai9L?=
 =?utf-8?B?YVZMTEszWHlzZ3RCWk9JNi9RVDBEazFIWktjZitJNktzYkZTY1VWNlJJUGc1?=
 =?utf-8?B?RkwrMlZTMXBRR2RVMWEzUTgxV092bFk1d0EzRm5qdndwQXJSRjJaOG5aTlhZ?=
 =?utf-8?B?OWU0UGlCS2k0VUhJMWJhdURKYjk1RGw0SVMvR0QrSWRNa1BvMmdqMjdVbHFU?=
 =?utf-8?B?NkR0VzhGWlllSDhBSlJ0UUx6YTBOU0pqelJoc3Z4cW8vaitwVjVOZXIyRXZs?=
 =?utf-8?B?RnhYaVBBQ2MvZXc2c0R4ejVFczhmeGNFVGhCcWxnUWhTR1F2YSt6ZzV4SFg1?=
 =?utf-8?B?M0lOc09qMzlRYmJwdDlVNzMvK0RETjF0U1N0K2xEMWVVVm41eWRmVUVXUWlz?=
 =?utf-8?B?NDk5MzNWTUNxUzRCTjVQWkxQQ1dhaUlKNkc1TkNvbG5RckdPdm92SzdnSGVY?=
 =?utf-8?B?T1BkeGxGZ282elROT05VUHVWdHdOS3B4T0cvNW9KVzU1d04yT3Y1SWdkclJv?=
 =?utf-8?B?czl2K0xXTll0SnE2U1lyZjQzSHh0U3JxcDlROEtpMTJMUFNXdXZYbndFL1pj?=
 =?utf-8?B?ZnZJZWFYYWpnV2l4TFAzMTRteVE2bWNHTm8zd1p4eGJ4WXVHL29IdHBJMTZP?=
 =?utf-8?B?NVhSRVA5TG1OZTRsL0tDRktWZEx5N2FsZ1RPR3d3a2hMQjVQZ2RZdVU4K0Vx?=
 =?utf-8?B?WS82ZHEweVA4TUw1a0lnR045emtSeFBia21CTmtVVzBIQ2NqNmwvWE9qdy9Z?=
 =?utf-8?B?OWVrVmx3a1prV1VDTjk2OCsxMjlOZUQvTGdMc1NDRm9xei9aZmJBWFd4QVZ1?=
 =?utf-8?B?MkVSY3o4Yml5cmxmUlpUWnJLQWlaT0tmdGVBSjkydjZSS2xka3JXeWVqOElB?=
 =?utf-8?B?dDVvVExXOW5LUmNlRWZYS2lBU0VsZ3lRKzVRUlpIeXNEcWx4dHZCaTkrbkdR?=
 =?utf-8?B?ejJOWnF3VHhMZmtnM0p2cURjM1Jjc1VqTUpRS3RJaDRzUThKcGtrRWlvd1hs?=
 =?utf-8?B?TFdaVXAvTDFGanlDVzNTeVIxajBNeEc5Vmo2b3RpRzh3YVJKVm04QXpuZTNp?=
 =?utf-8?B?Mjk5L2pNNWNoZzhzSXNBY1VuZ0lpU1JXTWk1VHVnaklMUnhic1VzQkFIblVJ?=
 =?utf-8?B?dDRaY3VWZlBDK1RsZGRxbTBLWEpwZ3MzaWYvTGZSUUtoL1JNMmUwQ1hrMTB2?=
 =?utf-8?B?ZFhGNHZGWExWZXY0bkdtYzdiMm1ZR2dHRXBDUmRSZ2R4bGlzM1J2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52cc640-9504-4f23-ab76-08df20749fd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 11:02:17.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hrtmac5jxohUjGk62CWLDhqI8FGQLQn91y/x71pYGWLc0yAcPMf0128qhIWHGJnhkst5Mij8AM9Br2dc5xSO0biAo5k1mvs1wt+dTCGXMoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB196443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 11:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247108

QmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDI2LTE1MDI4LgoKUmVmZXJlbmNlczoKICBodHRw
czovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNi0xNTAyOAoKVXBzdHJlYW0gZml4
OgogIGh0dHBzOi8vZ2l0aHViLmNvbS9saWJhcmNoaXZlL2xpYmFyY2hpdmUvY29tbWl0LzQwYjky
ZGUxZGVmMDhlNGZjMzE5ZDU1NzAyNzg1ZjgyY2VkYjdlZjIKClNpZ25lZC1vZmYtYnk6IEpha3Vi
IFN6Y3p1ZGxvIDxqYWt1Yi5zemN6dWRsb0Bub2tpYS5jb20+Ci0tLQogLi4uL2xpYmFyY2hpdmUv
Q1ZFLTIwMjYtMTUwMjgucGF0Y2ggICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKwog
Li4uL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguNy5iYiAgICAgICAgICAgIHwgIDEgKwogMiBm
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
YmFyY2hpdmVfMy44LjcuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2ZS9saWJh
cmNoaXZlXzMuOC43LmJiCmluZGV4IGFmYzA2Zjg1ZDQuLmQ0Y2QwYjViMDEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVfMy44LjcuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUvbGliYXJjaGl2ZV8zLjguNy5iYgpA
QCAtMzEsNiArMzEsNyBAQCBFWFRSQV9PRUNPTkYgKz0gIi0tZW5hYmxlLWxhcmdlZmlsZSAtLXdp
dGhvdXQtaWNvbnYiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9saWJhcmNoaXZlLm9yZy9kb3dubG9h
ZHMvbGliYXJjaGl2ZS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0
IFwKKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDI2LTE1MDI4LnBhdGNoIFwKICAgICAgICAgICAi
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cubGliYXJjaGl2ZS5vcmcvIgogCi0t
IAoyLjM0LjEKCg==

