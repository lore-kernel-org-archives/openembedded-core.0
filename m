Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9634C44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:13:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2644.1784567577738434467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=xlkoe3PR;
 spf=pass (domain: siemens.com, ip: 52.101.65.11, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2+yX+hQeTf4iH85OuloRtD50Mc+BErJ2N13otoplICtGyig297aFmn1Ti92l650MY+BYBlY24r+IupdeIxhylDUeaKywn8hByYG5TCM/YPT3ljwDKNHrL6LAoGfmqXcZ0r9/uC4FaSjJNrUgsLLhdYHDNS+wyEVPjhyWGM7iZdxY6KZmmGlMTWKipDhYXtSQRaqLkwuon4atsW7V9Qrae/x0ddKGPBxD3m7bC0MSMvG4Ezq2TONn9pcpUkFq2dJWlN1JEk56NApoADNR2QtllAbi6HL1ZjEB3jWUVbnfYWmLv2JghG/U/hyAua/n/MKDeiC2/ThuCRSM5RFaqt1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e//aAMtSbJi1T+yN7v/BqibCM01rpz+1P2UM5I9XTwU=;
 b=IqReSrYzLEgyJnn8S+4tBlDrBfWr6XiGQ1oqNgCacTY/YZ8+lzTOHT/Mw08G/gTTYmICi2/g571xkoD1ZPbuASR0o4e91zoQZSISZ59hQJ1eR7Y5qOh1GRre8I17SEtZnO8X3OkBZRWqpjWhDXhhNuCK5U1KElwlNt161HOxB2YhIJjHdpK4D8IrLColSipDBBBSy3h2sXyW0aNvmuVibPY88JU6FxNaQu9pnmN4bbjyE0L0NQZQ3VxUzIHYjymwvxY/gS8XbZXCydUF2RJNmMyk9m/lSlgm2pNx5XmkrOZMDXlNPsXrVQJFb5BISBI/jjPnIcjj1vaLnsWFid/umA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e//aAMtSbJi1T+yN7v/BqibCM01rpz+1P2UM5I9XTwU=;
 b=xlkoe3PRBBHoivJ4+5yQLJjvtc5sC0489mkJ7XwBMVPE2pJuOZika8eI2nCcvfIWpuUy/oGfjIwVDkuo/0iUTw3YGZ53TF9bVVH1fLQjifAwDuHe913RPnoxfQbrveFnso3pVRZroasi+wlWJ5BbuS7oNH6yVvF4QsVsenrpxhP1Ajfl6t6LLDojHwm7A4o5PPTGO5UGOaVBwYUvHurFeMnCpH9WzRwwu3AlJMXKROwqECxlymACAyCPENGoT61MrzroWO7yprifE7L4v2/l9JaUuYpoF8IWy7fH1Nux6rV+ZyDbHR0+mdxEfACMITJGPZYs102HbANnGLW23iP55w==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by PAVPR10MB7379.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 17:12:54 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:12:54 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, Paul Barker
	<paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add KERNEL_DTBVENDORED
 support for FIT_CONF_DEFAULT_DTB
Thread-Topic: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Thread-Index: AQHdFpMIn4L+Bk3djkW8bp/LFE0fvLZ2CMiAgAB/I4CAAARzgIAAHHwA
Date: Mon, 20 Jul 2026 17:12:54 +0000
Message-ID: <d838b53e11601fcf2f174518a782f002480506a6.camel@siemens.com>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
	 <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
	 <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr> <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
In-Reply-To: <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|PAVPR10MB7379:EE_
x-ms-office365-filtering-correlation-id: 41007951-0d5f-4eb3-44d1-08dee682237d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 c8fy3kjygBsJIqKU3Wg8HxVgzSrNOEfoB9/G3fQErmdp8LWyk+/mszonVwd8uupSAU48dhpAT0bg63BcrDvMJYU7o+zzlJlrfmAnzKyzmT6KBjAR/rWUMhmsdu878k7Tt9RG8WhLNtkuIAw19pR1Knkw5Q7edYGLYDXnsY1ANNvmiY7euUOVHAehoUYgsvFaMfLIoCWZ8Ma5iG4Ti5++pTO2QRdDCIlBOXlPRuITumRJad/1mTzDxIevEcWv59xrKrZ8zLvgTllx9hIzRaGQFUVvtU5q4qoJdP8xfERodezjLJKFHg9TYHReVTxqB2h0DkWNa99vnUR/gyPEsO3W77IBTVVFsaVNsVGvitpTjGkn+H7uG3Dvnw18z4XLPjHYiOGnH+klZUKuOFW2QgzBnYtcXJ2emSH+LWChnOTipIS+ce+pE26M8ljLV2b/G9K2F0k6/5Fth21tz2+a1xbiqc/1vctOq7QSZqJfumaLoWEqQumf9CsBBXD9DVQKttoGcigPFLNqDblW0CQaDFV2+k/pL366Lk+3TyLkYcPIhk/f7foSGIY2wqPX8EQDVz2EsEOyUGOiZ6ugMuGTKyETK3ibyOXHUiLFLovfmdzkeAZUh+MTwcRrZqFPFtluu7WMCSlTE5+0lvHkovLlNLLp5KoBsjwXl2VASccbo3mzTTo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UmcydUtYVmZmZWprR2FTQmhHQzh4Z3p5dlplYmRkc1YxVDZKSVF2VDRRL0RP?=
 =?utf-8?B?OXA0WUl2c0E1NWNUeDZWMDU2R0RtdEI5QVNSYUhpcXFLSXIzbVBpVWcvTHRq?=
 =?utf-8?B?WnJuUmV1YnBUUjhOL1VkcnF6dno2NlRkdnhqclNXNmNGR1pzbUtnWm12VzVt?=
 =?utf-8?B?TnZ2RVN3NFg1ZkQveTFhVTNadWJ1elNlektwQlNWampYc09Fa1MwcGVUZStk?=
 =?utf-8?B?WWJsdUJTVWoxcDNOak5xcG9oL1RkbGVIRm1sczVTVHA3ckFnUFkxR3RUTGlF?=
 =?utf-8?B?QVJYdktPWkg0QWNzVDhURnpIYmZpRCtMM1pGa05OZUgycURrVXVpbzkwaG1H?=
 =?utf-8?B?R0dSYjFqczV2VWsrdE5FRUptRjc5dWE5U3kzaHVnZFRZTGlCUEZZdE5YSW9o?=
 =?utf-8?B?SUNQTkdkVXJHSFhubktGWVQ5V3BKNVVsSHVCZzZ4MTJiZlo5WGRzY3A2ZHFt?=
 =?utf-8?B?Ums5MTBiazAxQnhodWdPV3ZUQUxKZGFLM1RxZHNndUZSVEtGNjdoTmZ4Mi9W?=
 =?utf-8?B?QThCNzVTc2kwYWhqM3VVMEowZWFiRXlERWtNVU14SEZzYnUwWmo5WGhGcmpt?=
 =?utf-8?B?RmNId1Qvc1Y4Nm4rKzkyVXI1ZXlKeVkyRVgwSWUzMWV1TlNiN3pkaDF5RS9D?=
 =?utf-8?B?QmZLNmFsTnZjM0QxMDh3ZUdpWC9FMjROK0VNY2t3RWlMQlBscko5MUlHUUdO?=
 =?utf-8?B?SE0rOHhsSzRFL0h2Y3NrZ3plU1ZGTEtOeTVWT0dDd0lHSFZtWVU1RXpJTzE0?=
 =?utf-8?B?cDliYnd6LzJZNzhpYlpwNEJpZTRKRU5uT0F0Y29Udmo5clQ0YkJpYmNrdWRB?=
 =?utf-8?B?N2c1VHphR2g0bWt5eGZaU0Y4Qy9xV2FQYkExSUlUdGlPaTJ5TEtKakxjUjFF?=
 =?utf-8?B?aGRPUDVtVkdGT2pvUmhabERoeStxMlZOWlBnUi9qOVhXenBjRjk0YzkwTFZ5?=
 =?utf-8?B?Tm10Tlh1QUM3YnVEMm1oUEE5L2J2LzdCSVV1b1FpYWpTdGtzNnFWRHpSV2RR?=
 =?utf-8?B?RTkxSm5qT1VuNThuUTFXKzliYVczdk5nbWt3ZkE2cFZZeldMQWRGaEVPY0ZI?=
 =?utf-8?B?Njd5YzdmZXIvZkhleE9pT1hpREpnYmc0eGlnWDY3MCtNRGdZZTVIeTVMam5L?=
 =?utf-8?B?Z3hDOG9GcEtydXlkYkdrMFNkWXVEcXJ3S01QUlA1N3h1NmRKTXVIN2gwajZt?=
 =?utf-8?B?aEc5dVJuZll4cVRmdmc3TUgwTVFuckl4RXIvNm9STVZFdXUwL2xzdGxWdlhB?=
 =?utf-8?B?cStvbjkyK0xGc0l6NloxSEtKdURXUTVCSk44NmVsL1JRYUQ0NUZFaHo3UHJO?=
 =?utf-8?B?WlFPTTA4SHR1VDNRK2dVZXNvZVl6ODlJbE1zZ3pmMzVHbENHUUFsUnhhNjdO?=
 =?utf-8?B?cVN2Qk5nN3p2VDJKTFlVaVJ5QTRGc3VsL0duOUtuOXlXb2xPZTBncERRY1l0?=
 =?utf-8?B?V3gzUWVNZ2xES0dkRzRtV0ZyeG0yNks1M21JLytwN1NpcHVJbVFjUy9tT25n?=
 =?utf-8?B?cG4yZVBLeG1GcTJiTHFXaGVKV3E4K1l3UWZLWmlWeTFMVXpSWXF1K0hoNGJ2?=
 =?utf-8?B?MkVQTmJmczdKTm5nQTdWeEFxNXZOM0xnQ1BLaGdPa2RuaUY1cFN1b1RMdzdz?=
 =?utf-8?B?NVVKb3A0NXVjL3FjY1VDbU1DRTRPbzJkUVFCQzI0L3FWd1hqd3RZazAzS2pN?=
 =?utf-8?B?elJVdUtsTUpSUlU0S292Mm84VGNpSE8yQ2RIWkhOMVJxQWFvbVM0THFXVkFO?=
 =?utf-8?B?bHZiYmNvbkhSUC9ZcktFVXdTc3ROTDVrRVd6Yi9nMUF5eVlQL2ZrQVRKWFZu?=
 =?utf-8?B?eFdNU2R4S3R4cmZ1NVdSVkFRcHhiTzdNbWVvM1dzcWVmbitXdmlxTzl0Lzg4?=
 =?utf-8?B?OHpHUlEyTFBaQ0JMcmtwTFBoYjJ5K0s1YUNONGhXOUc4bkZjdmVoK2hvYW02?=
 =?utf-8?B?b1BLdGM1NFRUdFBVdVJ4RW5UL1NTeHB5NUtPdTVyNU56TWxsRHhJb0ptWEZV?=
 =?utf-8?B?azF2TGttVWtTNysycmZRM25pUUxoTm1RRmdRWU1YcDBHOWtvMWRpT05PeTB5?=
 =?utf-8?B?dkVMb3pMcTc1dzJrU1FCRTFWeUM3blVsc2FZakJtdVgvTkVYWUtweE5oRzdt?=
 =?utf-8?B?dEliUU1MZHI3c1ljNFluSDJNU0ZhRWZOeXgyWitFMkR4b1JpZ2Y5Wkl0T05E?=
 =?utf-8?B?SHYvS0lTSG5sVUVXWnZtTVd4bm9wZkN3T1hsdFptYXdENGQzTGF0S1JiUGMw?=
 =?utf-8?B?eEFhbHRkQndtdWh6UWp1TEFtTmtZdVcyNmZoTVJ0L2k2ZDR5S1NabXI1WjhZ?=
 =?utf-8?B?RFVqWlJ0b1haRkhBOS82Sll6VEdGUVh4TWcwTjZkQjQ0c1A2RE42Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E6F73FAD90B1846A247CE6129F0CAA8@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 41007951-0d5f-4eb3-44d1-08dee682237d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 17:12:54.8432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cm6CEBy9FpL/KeFl2g5qnEPCkX+I65BJbWELRKp4tQwy+5nuxQG6q68h/w2PL949wHggfEQEpYnMa9X7I5VQglzo+uTORt3Y3HhvNh1wo9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241433

CkhpIFlvYW5uCgpKdXN0IGEgY29uZmlybWF0aW9uIGZyb20gbXkgc2lkZTogVGFraW5nIHRoZSA0
IHBhdGNoZXMgaXMgdGhlIGJlc3Qgd2UKY2FuIGRvLiBDb25zaWRlcmluZyB0aGVtIGFzIGEgc2Vy
aWVzIG9mIGJ1ZyBmaXhlcyBpcyByaWdodC4gR2V0dGluZyB0aGUKdGVzdCBiYWNrLXBvcnRlZCBp
cyBvZiBjb3Vyc2UgbmljZSB0byBoYXZlLgoKUmVnYXJkcwpBZHJpYW4KCj4gCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzI0MTQxMyk6Cj4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yNDE0MTMKPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMjAzMjkx
OTkvMzYxNjg1OAo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnCj4gVW5zdWJzY3JpYmU6Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsKPiBhZHJpYW4uZnJlaWhvZmVyQHNp
ZW1lbnMuY29tXQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCg==

