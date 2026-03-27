Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE7D10F2847
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:41:11 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75531.1774626068158572067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=VY2pLGbl;
 spf=pass (domain: ericsson.com, ip: 52.101.72.50, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctWTk+tDGDjEt12ITwnf5SdRPoYpff50A515qo68Vt9D93Ut0Z6VreQBklWMP/yboPaV23GReJGEMPeZbTddVG1UwlK+vYH/aGaOuzxqoaXlHyJc8DPRYe7TwoEhdxR5NH07mIZrEcQ3bHEOq5ahRpj7U2Jl8g7sgWzzQJkzdHGTUMh9UHhRZSMGV+KbhrNnnYB55uTzpGJu7lu140CpENBxv9wLAGqmjY5iAreb4bZv2U9cwE1FEZWy+fYas8841BZYv4NDQu4i4PVMZ9Uau+Pr2pA+UP3jD0Tl/WHSgIIYAOf/uTg3QHSAPP787aTfYtg5oZq1jwHt04J6ln7mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucfAyEKLs4i1Bui9VaWTb+JV/oIWCopPPfgPw4emPm0=;
 b=KFyMmAEA85IE08Ru4+w35IlTqvt2PTk/4dadbjUWsdkrmauAKpDJX7tBrDVHY5VZ5455T6iQa5htDS8v1eqo3GiuJpHiX6KecjQfTdbaQR9RHYy8robp5cwoy9xhvOKSsxPS/IZ8AI420eKqdAJj/K22+j9uNR3XcRM4Cyo8t/Y0/3tUBUyMnJhLlIZ4+iFAudfwCt1WxQztK0fQgcfssID3YQeJLO2wjq/viKD87SSfIw05qp1A3f4ZMQbrZsm5W4F5AqJ1ZlqRXKdasljNPvtwXMVmb+37Q3VW+HJWjxPjPwUk0CKmZAjvEn0FdEl7dMPrnSMIjNyMr3RecJB2Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucfAyEKLs4i1Bui9VaWTb+JV/oIWCopPPfgPw4emPm0=;
 b=VY2pLGbls2+Mcxreu45YVxwMPI6EPpZmNPFeYioIS40B0taVJmHSpX8NhSMvwo1pMsz6AxZK7vdkHM0bbSMFQBY2G7T+fZhXRjb3GlC2Th09M4MGmhhF4ITe7MZdCOi54t5xr13oDBvq4laPkq6+831ycKuk4scNLNSesvy4lNhsTcGgl0TBeppcsqDZG4OhpiXaSH8b5L9k69a9ZjAeSojH61Pl52VgBkJEjeCAb2Q388seiYDq9aSLtYZ/tNWph0nWW+4TiIGSmfO8v0DffyofjNuZYUHr6dCzjQkMWhu9mzzdfLkRwvorqP/QatY4ZR1u3yk4S4tqSmvRYFHrwQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS5PR07MB10449.eurprd07.prod.outlook.com (2603:10a6:20b:6c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 15:41:04 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9745.022; Fri, 27 Mar 2026
 15:41:04 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "pratik.farkase@est.tech"
	<pratik.farkase@est.tech>
Subject: RE: [PATCH v2 6/6] oeqa: ltp - add LTP_WORKERS to allow
 parallelization
Thread-Topic: [PATCH v2 6/6] oeqa: ltp - add LTP_WORKERS to allow
 parallelization
Thread-Index: AQHcveU7rIkEy/Vgf0yjNWqGlxF43rXCg2uAgAAAVkA=
Date: Fri, 27 Mar 2026 15:41:04 +0000
Message-ID: 
 <PA3PR07MB10721C3ADC9367E7C0B2B0C568A57A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
	 <20260327122758.1851989-6-daniel.turull@ericsson.com>
 <ed22500800950b87d26983346d7b3106c41257db.camel@linuxfoundation.org>
In-Reply-To: 
 <ed22500800950b87d26983346d7b3106c41257db.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS5PR07MB10449:EE_
x-ms-office365-filtering-correlation-id: f2be3d8c-db9a-40b0-f3e6-08de8c17415d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 5dw3nTCS4+PNjomHy6hsyr0rOZUMVfVFCqSgGNdyUkVQq6jUZg2lhgjGWRV0HbIX/k05kXFZZvzgtsBDcv+K45BZvcvFDbBOgGjtBWwlBN7lrud6YLSKxJuIaZiplDCOs4v4a0jewot87O+zPvvuPievKf0yk/FInKH4H5rCiXUPrWVPkxLngCKL1hw1vV5p+2OxOO51y7VtT2Stkp3ELkY+R1LCWYmV03RTBm4fRLCOcvZvyELtJlE1f/FCXbCY2bdnxFO51zrDs4Nlb9mwAdlNRHPGlO7m/L3xncEn904XBWMn2bW+7e1Z5M+NB5zNaldC9MaCiXsF0ANj8g8wcEQsI+Od4/jlwZWD2aQiMxMPCIui9JNbSxAI7B9BR93EbLOv9h45cTDiOARI9jZhzH6vcREcC6x0n5uV84rE2Xw3tqoy6ASDqBHTjGFh6KBmHO9eSFOecrWdrY1u0GJ8u7PVtPy3RHv8H1+jHvOnEHiScr2bOOZwDXb/yp+7KrtjiLmlJiHrD90Ckp2UPo96iX1tpQGtQbDi8NP9F5NxeKbonXh9LsO7k427Ihl+hIoY2IzVS5Cj9Ki83SOVoB4GZXwKCchk2OBKztxCzPltyu7TJH4SNvt4fu+upjKOZbUMAkmqTStzxtn+D2OgakKxxnk98bG3gXlvchHLyujKJr8AE5bKp4ZxeL2yP+ad7BJkgsvDgFDSM5g+jV/MpYvXMcueFEM1v5xPyAbdDHgh1BcqasSfw6INWtiF78qw9HkfA3LSc66NSG+WZUM5WwDF+6tH/sfcVxEAFgTvlFimKFQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MXhjWVJLZ0FRQ1VHUFdkK3ptVjFWbXZ4M0Z0c1NCWE13RUYwUlpnNXgwVGdz?=
 =?utf-8?B?Z0h0Mk42VXdWRW85amp6S0h6V2I2UE00enQzNlBMc0Z3U0p0cnU5S2laczBX?=
 =?utf-8?B?TUxVNDFCTTh5TzFrekpWUG1RaVowemdjWnJHb3hrTE84Z3VIbHV6dHhEdGFM?=
 =?utf-8?B?S3g5cjFpVXNuNEtPdGthV3pkamVMVFJrbCs5OHR5ZWR4alZ5ZE5CakVVKzhv?=
 =?utf-8?B?eE5pazhaTkMycUUzclB1L3lHdUF3ZkpnSDVSNDY1TXpHNWZIWWJBVm44Q1ow?=
 =?utf-8?B?YUJ1bys5VW9xU2NVOFd2S3Vtd2VySXhTRHVZMzVIUG9UYTh6YzUwMUZlenJT?=
 =?utf-8?B?Yy84aS9GN0ZrQlVQVnR1d05hYzNoS0w5TndXMWtyOVJ0a2JhYUpTVkMrV2Nt?=
 =?utf-8?B?dUJWLzVpVzVKVmlFRVhvekw1WEVzcTRPVXc1SmYwdUxMTHVBTlZFM2JpaDln?=
 =?utf-8?B?NEVJS2dCbjJTYlZ4WFV1TitHQ0pleHg2Qkp1Z2RCUWY5UU16ZThPdGxpUmFV?=
 =?utf-8?B?b25CSFN3dW4wU0c1RWkrM0tvTWkvVm1oU1c0THI1ZXVRNk0rd2htZ3FnelFv?=
 =?utf-8?B?ODhNaURJdHR1OEFxcVBTSFpHVnVIVFNsSzRaQ2JkVm5VRUNYNVFvT3dVRkpK?=
 =?utf-8?B?Y1ArWm1hbGZXK1FZeXRsSWNieFBQdlRaZnpReDJicklLWVJtNGVCdFB1Ukc4?=
 =?utf-8?B?YmZJaHZtSS84cFpBQ0FwNUJtTWV0dENna3pBWHNQcGw2N1U1bUc1ZjNjaE5E?=
 =?utf-8?B?RG5SZXl6dW9Wd0NHd25FUjlzaHowMU5rNzF1OEhwTDdkTStWS21pWUkyYWFD?=
 =?utf-8?B?cDE0c0F0ajNtSHAzRHF0eXM5eU5FbU1ncU1IZXBJMVl5SEQrL0oySS9GcHJm?=
 =?utf-8?B?N0o0b3p5Tm03eDNpMytob0MzQW1VSDgxc1lldkZLTmJMV2h1RTF0b3hHWEVO?=
 =?utf-8?B?RjdCQUUyUUExSk4zUjNDdHVIWWlOMXUyZnF0VWdEYkUrNC9ySmNPZlJLWHdp?=
 =?utf-8?B?QmRCSXlRa1MweG83VEgrS1dySm8rRFRWeVVkZkRRLytNRkhsVW5RcFBwVXFs?=
 =?utf-8?B?V3RpaGlFcndQczdTdERSZ2hUTlhPM08zSnBWSnVMV0hPMllrMDN3UlprdUUx?=
 =?utf-8?B?RG94RjBxRVQvQ1BvUWJEZDFGbmJpTFdJdS9xYzV4UmltYlY2U1NkYnplOVZs?=
 =?utf-8?B?elNhaWxrclk1MFdsbVR5ZTV2ZDdoeWRIZEtrd29GUmNjaEY3bWUvTmpUT211?=
 =?utf-8?B?NGNOUzZ1eHNKbW1JVDdtMy9JVDR6ZU9uaHpENE9VL0dWZ1FTMzBiOHdiRys3?=
 =?utf-8?B?U3NGeG84blgzQmRuYUdaUVZBeEp5WFRMN3dPVDVZd0x0MHVoLzA1aGVZNGUr?=
 =?utf-8?B?R3BMK3VYVythNEVaRHpHRHowQmxQYXVzVzhYdmJWSWtiTGh6NEFaaHdyQkRE?=
 =?utf-8?B?QXpsYmd2OXpJUmdUWWxRRHJMQVpDUkZISmxzM2JnbFVPNDBhYWN2SlpYb1Zk?=
 =?utf-8?B?Q2RRa0Q5SkJ2czJoWHlvWU1WSTY3Y2xTd2IrZnc1RHh1d09qdE84L3Q1TGlF?=
 =?utf-8?B?ejllaXh6WjNPVGxORU1IVERJSHJoZ0kyL0tNM0drUHhZZUY2Y2lRcms5N1hI?=
 =?utf-8?B?TEZ0YlRZOVpZVlRraVl0TGxyUDRlcEIwUnl2UUhycnJYMmdRMXRMRU90NUE0?=
 =?utf-8?B?U1ZLZUd5UHgrcXc3SG42V0p3bk9uZGUzcGt1c2JqZE8zL1hTVFNxTytxWllQ?=
 =?utf-8?B?Vzg5YlcrcGJRYmxmM0h2TFBuWHkyYkMyMWliSTVyb3pIditLbXc5Q1E2cEFr?=
 =?utf-8?B?VkJKL2U4QkdVbGZRdkFOTm8rQmFsUzIyeVE2VDUwdms3bm1KSnk2RkpyZWFD?=
 =?utf-8?B?YUd3dmlLT2crNVJ3b3plRXZ0Y1VjNWtjdWRCN3VXYkJpNjY1dWZVSkZIM2pV?=
 =?utf-8?B?V1RvbkRJY0xuS243MHZDM0RUT1R2c3VLdmlRTFZ3by84WFlGSzNOOVlCUVNl?=
 =?utf-8?B?bDhkRHhad0tmMDVrbnozTXlOOXJucGJCdkQwY1pPSmtndXA0TlZ0M2k5OXhU?=
 =?utf-8?B?dmwvUEtORm1yL3pqall2VFQyWnV2WW1ZQmQ5dUpURDhOU2hqSlZkbEJ3RktB?=
 =?utf-8?B?QjZCcjBlOHgrSkVuY1J1VXhNcU9SOHJXR0orR0hxT1JKcnoybGVtTjZBK2ps?=
 =?utf-8?B?dXdmUWV3MXFNMDcwdWdvL3VCSkRPZFJsSTU1bVFKQVg5M1ROaW00RUZOTEpi?=
 =?utf-8?B?VWNxUnc1c3JUdy9QaytLdlBaQ2NsVllqSC84VXI4cFJhTWFVUXp1U3N5SFkv?=
 =?utf-8?B?SkFzaTJHekRqQjVjdVJhVEdxVUZjM2VGUm5kdStKQ2lod3JrcDhyaXZ6Ymc4?=
 =?utf-8?Q?fOI89+IxqtEcI/Z4nkmKyRH4NKNx+owcpJCmsQtUc1U/C?=
x-ms-exchange-antispam-messagedata-1: tHxY2BYD0faokQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2be3d8c-db9a-40b0-f3e6-08de8c17415d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 15:41:04.1783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxZXIfBsFAvsE4u3WDwdLu7iaHW0s8FeZdy9RiAGh812vIzfCKmSyiUg+uYIiP0fUeR0Tt0IFkgrlIenZXz9g+U7HGPz3qn90nbVFMcI3RY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB10449
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 15:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234093

U3VyZSwgd2UgY2FuIGtlZXAgdGhpcyBmb3IgbGF0ZXIgYWZ0ZXIgdGhlIHJlbGVhc2UuDQpJIGNh
biBoYXZlIGFub3RoZXIgb25lIHdpdGggdGhlIGx0cF9ncm91cHMgdG8gYmUgY29uZmlndXJhYmxl
IGFuZCBub3QgaGFyZCBjb2RlIGluIHRoZSBsdHAucHkNCg0KSSdsbCBzZW5kIGEgbmV3IHNlcmll
cyBmb3IgdGhlIHBhdGNoZXMgdGhhdCBkbyBub3QgbWFrZSBpZiBmb3IgdGhpcyByZWxlYXNlLg0K
DQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogRnJp
ZGF5LCAyNyBNYXJjaCAyMDI2IDE2OjM3DQo+IFRvOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVy
dWxsQGVyaWNzc29uLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IENjOiBicnVjZS5hc2hmaWVsZEBnbWFpbC5jb207IGFsZXgua2FuYXZpbkBnbWFp
bC5jb207DQo+IHByYXRpay5mYXJrYXNlQGVzdC50ZWNoDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgNi82XSBvZXFhOiBsdHAgLSBhZGQgTFRQX1dPUktFUlMgdG8gYWxsb3cgcGFyYWxsZWxpemF0
aW9uDQo+IA0KPiBPbiBGcmksIDIwMjYtMDMtMjcgYXQgMTM6MjcgKzAxMDAsIGRhbmllbC50dXJ1
bGxAZXJpY3Nzb24uY29tIHdyb3RlOg0KPiA+IEZyb206IERhbmllbCBUdXJ1bGwgPGRhbmllbC50
dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiA+DQo+ID4gQWRkIG5ldyBjb25maWd1cmFibGUgdmFyaWFi
bGUgdG8gZXhlY3V0ZSBtdWx0aXBsZSB3b3JrZXJzIGluIHBhcmFsbGVsLg0KPiA+IGtpcmsgYWRk
cyB0aGUgb3B0aW9uIHRoYXQgd2FzIG5vdCBhdmFpbGFibGUgaW4gcnVubHRwLg0KPiA+DQo+ID4g
VGVzdGVkIGluIHFlbXV4ODYtNjQgd2l0aCBjb25maWd1cmF0aW9uOg0KPiA+DQo+ID4gSU1BR0Vf
Q0xBU1NFUyArPSAidGVzdGltYWdlIg0KPiA+IENPUkVfSU1BR0VfRVhUUkFfSU5TVEFMTCArPSAi
bHRwIG9wZW5zc2giDQo+ID4gVEVTVF9TVUlURVMgPSAicGluZyBzc2ggbHRwIg0KPiA+IFFCX01F
TSA9ICIzMjc2OCINCj4gPiBRQl9DUFVfS1ZNID0gIi1jcHUgaG9zdCAtc21wIDE2Ig0KPiA+IFFC
X1NNUCA9ICItc21wIDE2Ig0KPiA+IExUUF9XT1JLRVJTID0gIjE2Ig0KPiA+IElNQUdFX1JPT1RG
U19FWFRSQV9TUEFDRSA9ICIyMDk3MTUyIg0KPiA+DQo+ID4gYml0YmFrZSBjb3JlLWltYWdlLW1p
bmltYWwNCj4gPiBiaXRiYWtlIGNvcmUtaW1hZ2UtbWluaW1hbCAtYyB0ZXN0aW1hZ2UNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24u
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL2x0cC5weSB8
IDQgKysrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KPiANCj4gVGhhbmtzIGZvciBsb29raW5nIGF0IHRoaXMsIGl0IGlzIGludGVyZXN0aW5n
IGl0IG5vdyBoYXMgdGhlIHBhcmFsbGVsaXNtIHN1cHBvcnQuIEknbGwNCj4gcHJvYmFibHkgaG9s
ZCBvZmYgdGhpcyBpbml0aWFsbHkganVzdCBzbyB0aGF0IHdlIGNhbiB0cmFuc2l0aW9uIHN1Y2Nl
c3NmdWxseSBidXQgaXQgdGhlbg0KPiBtYWtlcyBzZW5zZSB0byB0d2VhayB0aGluZ3MuDQo+IA0K
PiBJIGNoZWNrZWQgeW9jdG8tYXV0b2J1aWxkZXItaGVscGVyJ3MgY29uZmlnLmpzb24gZm9yIHRo
ZSBjb25maWcgd2UgdXNlIG9uIHRoZQ0KPiBhdXRvYnVpbGRlciBhbmQgaXQgaXM6DQo+IA0KPiAi
SU1BR0VfSU5TVEFMTDphcHBlbmQgPSAnIGx0cCciLA0KPiAiVEVTVF9TVUlURVMgPSAncGluZyBz
c2ggbHRwIGx0cF9jb21wbGlhbmNlJyIsICJJTUFHRV9PVkVSSEVBRF9GQUNUT1IgPQ0KPiAnMS4w
JyIsICJJTUFHRV9ST09URlNfRVhUUkFfU1BBQ0UgPSAnMTMyNDI4OCciLCAiUUJfTUVNOmZvcmNl
dmFyaWFibGUgPSAnLQ0KPiBtIDEwMjQnIg0KPiANCj4gc28gd2UncmUgcnVubmluZyB3aXRoIGEg
bG90IGxlc3MgbWVtb3J5IHRoYW4geW91IGNvbmZpZ3VyZWQgYnV0IHlvdSBhbHNvIGhhdmUgYQ0K
PiBsb3QgbW9yZSB0aHJlYWRzIQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2VxYS9y
dW50aW1lL2Nhc2VzL2x0cC5weQ0KPiA+IGIvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL2x0
cC5weQ0KPiA+IGluZGV4IGI4NTVlNzY5MDcuLmFlNmEyNzUxMTAgMTAwNjQ0DQo+ID4gLS0tIGEv
bWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL2x0cC5weQ0KPiA+ICsrKyBiL21ldGEvbGliL29l
cWEvcnVudGltZS9jYXNlcy9sdHAucHkNCj4gPiBAQCAtNjgsNyArNjgsOSBAQCBjbGFzcyBMdHBU
ZXN0KEx0cFRlc3RCYXNlKToNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBMVFAgYXBw
ZW5kcyB0byBsb2cgZmlsZXMsIHNvIGVuc3VyZSB3ZSBzdGFydCB3aXRoIGENCj4gPiBjbGVhbiBs
b2cNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi50YXJnZXQuZGVsZXRlRmlsZXMo
Ii9vcHQvbHRwL3Jlc3VsdHMvIiwgIiVzLmpzb24iICUNCj4gPiBsdHBfZ3JvdXApDQo+ID4NCj4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbWQgPSAna2lyayAtLXJ1bi1zdWl0ZSAlcyAtLWpz
b24tcmVwb3J0DQo+ID4gL29wdC9sdHAvcmVzdWx0cy8lcy5qc29uIC1uIC1kIC9vcHQvbHRwIC0t
ZXhlYy10aW1lb3V0IDIwbScgJQ0KPiA+IChsdHBfZ3JvdXAsIGx0cF9ncm91cCkNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAjIExUUF9XT1JLRVJTOiBudW1iZXIgb2YgcGFyYWxsZWwgdGVz
dCB3b3JrZXJzIChkZWZhdWx0Og0KPiA+ICsxKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHdvcmtlcnMgPSBzZWxmLnRkLmdldCgnTFRQX1dPUktFUlMnLCAnMScpDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY21kID0gJ2tpcmsgLS1ydW4tc3VpdGUgJXMgLS1qc29uLXJlcG9ydA0K
PiA+ICsvb3B0L2x0cC9yZXN1bHRzLyVzLmpzb24gLW4gLWQgL29wdC9sdHAgLS1leGVjLXRpbWVv
dXQgMjBtIC0td29ya2Vycw0KPiA+ICslcycgJSAobHRwX2dyb3VwLCBsdHBfZ3JvdXAsIHdvcmtl
cnMpDQo+IA0KPiBXZSBwcm9iYWJseSBuZWVkIHRvIG5hbWVzcGFjZSB0aGUgdmFyaWFibGUgYSBs
aXR0bGUgbW9yZSwgc3VjaCBhcw0KPiBPRVFBX0xUUF9XT1JLRVJTIHNvIHRoYXQgcGVvcGxlIGhh
dmUgYSBoaW50IG9uIHdoZXJlIGl0IGlzIHVzZWQuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNo
YXJkDQoNCg==

