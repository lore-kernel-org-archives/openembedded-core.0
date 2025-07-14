Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C073C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:16:22 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.76607.1752495374950910906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=DZy2Fe7+;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=COozdOm/;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752495374; x=1784031374;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+ykNtHLAgRrIgVIRBtFDYo/t3Wov7HDejmximcUA2Lg=;
  b=DZy2Fe7+8TZd/uF6GkuP2r++bSDZftpu+HD7SI9SFbTuZiFYDpcmpTpY
   Ep+KkKjLlHaFYst2jshaJjJi+2+YrIWz1TL3NCpN89rxI+jUdPg/EluDm
   6YTi7l0TNQi4SIFpHORFtgY1ruXEsJ5Pvhk4TqmyADCrLIyJ7jZyIM6mp
   k=;
X-CSE-ConnectionGUID: bqzrxrerQXKN/Dq3uPZ1Bw==
X-CSE-MsgGUID: +XRb2I2FT067O9izE/GpgA==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 14:16:12 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
 14 Jul 2025 14:16:12 +0200
Received: from smucmp09a.bmwgroup.net (HELO smucmp09a.europe.bmw.corp) ([10.30.13.75])
 by esabb1.muc with ESMTP/TLS; 14 Jul 2025 14:16:12 +0200
Received: from smucmp18a.europe.bmw.corp (2a03:1e80:a15:58f::1:50) by
 smucmp09a.europe.bmw.corp (2a03:1e80:a15:58f::2029) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 14:16:11 +0200
Received: from SMUCDZMP06.europe.bmw.corp (192.109.190.52) by
 smucmp18a.europe.bmw.corp (10.30.13.159) with Microsoft SMTP Server
 (version=TLS; Mon, 14 Jul 2025 14:16:11 +0200
Received: from AS8PR03CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.52) with Microsoft SMTP Server
 (version=TLS; Mon, 14 Jul 2025 14:16:11 +0200
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com (2603:10a6:10:d7::16) by
 DB4PR09MB6623.eurprd09.prod.outlook.com (2603:10a6:10:3f9::15) with
 Microsoft SMTP Server (version=TLS; Mon, 14 Jul 2025 12:16:09 +0000
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459]) by DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459%7]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 12:16:09 +0000
X-CSE-ConnectionGUID: BP33P3B+TYCRYBqbUa7kKA==
X-CSE-MsgGUID: 7kkLBkdBTpKoCF3C3vLQMA==
X-CSE-ConnectionGUID: UQ+U1oEOTUe0BrePAOfFRw==
X-CSE-MsgGUID: LLlhSDzqTXSbatqWnW8y3Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQt5o6me/EeUY/dgyNmjxe5mHS66GXPgsUCkVXjfbT5oH1gbJPGgP7s5BewniRkRWlIqzdwXpZwT5xPmqKlmF8MIegqs4WuRFpVYBwmI/vF3+UnvT5E2AaOywm6aHHAAeHwLc+a6qFhGy2nh+ew9mnxfzTG29U/cIBXmyhvDjpg2EsjLV1ujj15PvQmqz0TTyqwvqhuxaHBKRxWzgV7Wg1DwjmPB4Vfkt0k7OySOtGZiFEUgalFjg3z+tkihNjCku2gtz3PyDRfrlBo+vu+WzlCuK5fOMKKAZhyWeOpHHx5N4addn0km1Y7fRt2++mmNkTS7nCzbkJgQEUPHYjDg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ykNtHLAgRrIgVIRBtFDYo/t3Wov7HDejmximcUA2Lg=;
 b=Vf5YkIEgb/j2kx6F4cWht6WIMi2Er0JHK8vBT19l6CwKDitAQoqBR++J9X61LxZkeu4ischlk9a9lVVVUe/oige+RCAxykJMPgex+YmvybIGhn7yDsqznVPFAj8moy2wnQXReMrw/48dWx4DM1voGXz5QtFKk2GhorYwbcd63rLJEvlJQz/MUnvJBs6vR/pZV1UsXh7y1AXtZDL1XB9h76FLw+K2SRMmL4gjnfUYeebqDLD2AijI6PT70eNUvNm3cvrFSn2+wkaVHRHKnginD66uNTCX7hQwZIPVVyE7ni+Xub03BLVMTeGwm7hQGNptrFUWf9SODwYY5E88vXjB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ykNtHLAgRrIgVIRBtFDYo/t3Wov7HDejmximcUA2Lg=;
 b=COozdOm/T4a655qa9Kk13ch5wAeummHDwmY/3yoJPYaJwoymTFblCMOnmJcpvd+QRsFHfv2+Jr6RwFHcyzew9+qKciRMC43Q8z9XsUSrYmL1VALsySy/HhT5o9+hYlPQ9fkvLrT4/xTcKDSTbnuOjmp2GROqiEjLhxdWX8U3RMeB42uxWhrR8xUq1YJNcTxWC30PEDg1YtUYcTHeK1BwOqyzofvrntZ4PrAhCUMdX02vY7aCvyikQKPN9BfbQUx+QyAQgXBZoOdJOUWic+vCHY3urdWG7oiWpRqcOfE+SwbhNoWhwSHK8b74DI7Keh6HeIeK1T7Q9JTW3pO2/G1JvA==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Khem Raj <raj.khem@gmail.com>
CC: Alper Ak <alperyasinak1@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Topic: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
Thread-Index: AQHb7B5CjI6NXM094ECHIurQrbECvLQm5xCAgADTGm6AAIG1gIACr0YbgADAFICAABk0gIAAdSmAgACJpNaAAfbqgIAA4CoAgAGGVgCAAHlIgA==
Date: Mon, 14 Jul 2025 12:16:09 +0000
Message-ID: <aa543b30-5c8d-4acf-9104-1620fc7a669a@bmw.de>
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org>
 <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
 <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
 <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
 <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1soMZMsFrKyW5TYNY1Eu+0XUHmRDyPQyTWjGEncpUxXs+g@mail.gmail.com>
 <CAMKF1soTRpUT5L=ocSpfwz91L+dhhTeH5WvzFeDUm1UGcaB4Bw@mail.gmail.com>
 <CAMKF1sqT=soDHr3sv2tcLf4q9kief68vMs3dF_tEymB7_2zn+w@mail.gmail.com>
In-Reply-To: <CAMKF1sqT=soDHr3sv2tcLf4q9kief68vMs3dF_tEymB7_2zn+w@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR09MB3143:EE_|DB4PR09MB6623:EE_
x-ms-office365-filtering-correlation-id: b45791ce-142a-4976-0df9-08ddc2d0379f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZVhuRnJzamFUSUhGM21RK1ZTYzhWQ3JjWE1YNW1keUo0cE9EaVo2aGgxdFor?=
 =?utf-8?B?bDhEalhOZ3Ria0M2a3lROTR3eW1tQThGbDc3ZnBXTmpJb1BKbWJ4SmpnVGhU?=
 =?utf-8?B?dmVyaDFuallUUGUyM2JKQlEzSEx3QzIxaHFBRU1kd0xLUWh5WGlhaS9rYlpp?=
 =?utf-8?B?enFaTk4zYm9YZWFMeTQzdmNOWE9KZTZqbk1MZFI5RVhHM0FMTEQ4cTVBNkEr?=
 =?utf-8?B?VXIwWUF1NEYrVHEvOVp1NGpCUjJBaGhUbkphdGRWazlzaHJ5Y0dFL2o5eURn?=
 =?utf-8?B?WkQzY2dpbDdicWFrT2JHaSs0V0hVRmtKbkJ5QUh0NS8yNGtmQlJ1TmdHWTdk?=
 =?utf-8?B?Y3I5Yy9iZHpwekFZMHR3VWorNWhEZTFSNzJsWWdGVDl1dWY2QXpBZGhySXJH?=
 =?utf-8?B?cWx4R1Z6RnBlV2VMQ3crSUVlVmY5ZnVKQzFiUU1VL2ZkcmVVczIxbGdDbzZN?=
 =?utf-8?B?NTg4Y3d2VWFOc1dLUlNTYnhCT0YrTUZHNHZIY3JuTDg1QStXN3UxUGc0dG5t?=
 =?utf-8?B?STBVR1JuUmNMYS9iYTdOMGxaVU5neTR2K2wrYXBTQy9EWUlxQ3ZwRThBZGlh?=
 =?utf-8?B?cGRKQVI0ZUFjSFR1T29hdXRPKyt0bDVJRmJoMDJpQ29ReitOamM0UmRZR3Qy?=
 =?utf-8?B?MTZ4RHdQTys0WnpJMUhZMzFUYmJScGFwZ053VS9qalMxSGF0Mi9jdVlvYmZq?=
 =?utf-8?B?enlodVlsWlVzZXljQ0J0d05vTXg0S21yUENBTFp2ZFJPRHkyeHBtK21MV1pl?=
 =?utf-8?B?RXVKRmRRNFh1SGgyWktIcUJtZm5ZL2R1SzdZTmlsT1VDWDZ5elFwT2htN1NW?=
 =?utf-8?B?UHgxV2NTeDRNUFI5Wi92RDdHZEhSU1Q0RmtuYWFKenN4QXFPSHZZYlQvcVFt?=
 =?utf-8?B?WXJEdDJESTJSRHdnOWplclk5cjNXSWM2cGVQUHFkTE03SzJ2elZGMlRSdjAr?=
 =?utf-8?B?RFc3V0UwQnZBWFA1Z3pvSS9PcVdqcGRtUHNLS2IvQXowdEVybHRleDIvcVdN?=
 =?utf-8?B?aDhQcUdYOTF3bk5WRzl6TGNxZjRzQUQ3V211dlNhWDJwUVQxYXc1NE8wMm1r?=
 =?utf-8?B?ZDJwTjVGZlY2UkUxNVZRSW5xRi92enZ1b3h6Wkg1UGFkWkVKMVlmMTRLNkdP?=
 =?utf-8?B?Y01md25ycWNPSEFZdklFcnlUeHRyK1dxQXlNYnZPajVJYVd5cUQ2WHk2THkw?=
 =?utf-8?B?c1RPNFA2bjlQRmcyQzhpTWdxdWtpZVorL1pzSjQrUHFweW9aMldWc0Jzd3ZW?=
 =?utf-8?B?NFNVWngvTElRSWJsSkJ4TFZyU25IVm5JaVNZVmg1WVFkc1NSZDV6VjdoeHFz?=
 =?utf-8?B?RUdWS2VsTk1ac1JBZVF3R2xkYkI0eEYybFN3RVBwZHNMcUtwS3g4ODRKRG54?=
 =?utf-8?B?ek9veEhIVGc4RzBFYjBZeDBjbEtQSUlkSXlyNjJtcUFHc1JTN2ZodlJwdWcw?=
 =?utf-8?B?UDdVS1YyUFBJcC80MFFKT2k0R2FqMFkyekhKZTd5RWlTbU9jUEIvajZSV1lI?=
 =?utf-8?B?T3dkdzI2OHF4U0JkbVBwdkNYR2phczlQS0dpNnYyYk1aU1ZmM3FYM2IrWUtU?=
 =?utf-8?B?S3ZLTG96NUpPeksyUzFRM3J5c2tITWRuMnBrNGpvUEZZRitpUFBVVmxwOFNM?=
 =?utf-8?B?L0pmSlluSkh0STZDOCtRa0h2c2FCbzZLeUdSZUtqU1RBS3VncTBodTZ6cFo2?=
 =?utf-8?B?cVhoZW9wRWlzemhreGlMbW5TTmYyK0lvWW4vdm5aRGxMdkNXN1BSZElqb1da?=
 =?utf-8?B?R3EwTlMxSnUxK2FEdTNaaWo1clRheGFBbnNoMEdvMWF2RUIvTUR0NHRkejRk?=
 =?utf-8?B?cUpFRzBjU3ZFN3NsalFWbjVKUDNQemswVWxkRzJ6UElHWHJrL1U4UnFKSjVv?=
 =?utf-8?B?NGFpcDdmaE1rcmpjSk45aE1MOVVFc2R6cVcranM1ekd0V3UyNEhYRXdkVFNi?=
 =?utf-8?B?ZzBodlRnbElHeFBSa01oUFJ5Zm1oRGNTRzVJUDNMcmZaTXIvS2x6QzhDSWV3?=
 =?utf-8?B?T2NRUkJuSlFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR09MB3143.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlBiOXkzMjZFMm9BR2pXZEs3Y21lZ3puK1NHRlh2NDNmaHFuSVJqWjhHRUFh?=
 =?utf-8?B?Vy9wUjh2TWYrTDRFVUtVQjlRa2s3TlRoZmExSWxMQlhjTE1BaHRQeEZ6VkY2?=
 =?utf-8?B?M3J4TmwxbzM3LzdmTFlHcmE4TDNKc0NDdzlueENEUjdzYWVzVTlnbUNlOHB5?=
 =?utf-8?B?RVBHbjhxSTUrTEVCc21vRE9LZ2xNMzhBVXR3K0NrMTNhaFhsT1RZYkNCTURj?=
 =?utf-8?B?YjFpV0ZKNGZsN0tyb0hJWDcrY0E1Sm1wTDRVRVpnSHdTaVNhTVdXWnVGMEJS?=
 =?utf-8?B?UHlSdndtMTRqQTNlYU5BRU9US2MxQ0hTbEIwSWcwUVU1NzQyWFpRVllQK2Iw?=
 =?utf-8?B?VC9YTlBUdks4Sy8rK3RUNnpPMHQ4VXNBUG51NmYvWXZZY0VmYm4wWk81dmNW?=
 =?utf-8?B?MkVrd2wxSzcxRXhaQ3NOa0RnVU0zdi9OUUN6bEdScHNsSmxIL3VOVjMxbWVm?=
 =?utf-8?B?dzE4VjVueGo0UmFEV0xna2NoZG9oeE54bGdQZU9uVTVsQml4VTE1bW5EbXh4?=
 =?utf-8?B?NWU5QUszbnoxUEpybkdVS0hGcXdPM2Fpb1FmVTlqTWpSdlZYaW52b3lnWmIr?=
 =?utf-8?B?NzVWZ0FKb09zU3pTazdlTkljdHhLRUxEWUlyYWhNeHlPeUFJV2VLUUUyRE1O?=
 =?utf-8?B?UFpKTzc3NWRveU83MU9MbThQM1lzMWFKWEtGQTF6QThIRjhDUXdVTXJsa3Rp?=
 =?utf-8?B?dkdraTVRVkZHU2hNaXd2WURLbExpbHB6ZUlqRm1zVVNvcy83UDlPSHNQb21r?=
 =?utf-8?B?RXp2ZmwzcUJHNVlMYnRLTG0rQXJmaFBKdzRacVNaN05tTm1XVm5mRHgybXZv?=
 =?utf-8?B?S0V1K1ZUZUpBNzFkai8vdldMalJsRmNPNFJrWURJVDFxd2I3RjZQQjFtbzhU?=
 =?utf-8?B?UUdtazM4MGtNYjNhR3hIVDd1czk5MCtvMjZ6Y0RWVkRpT2NzUXRGd2JIMUFY?=
 =?utf-8?B?b3pKelhJS25nbDE4d3FjMkNzdkg0Uk9Rejc5WjNvTGZMQ3V5YlVtSmVTNDk1?=
 =?utf-8?B?OXp5R2R3Z3p0UUdaVXM0TmorakhJTzlCbVBaVW1vRndNRWZXR1dYdEhMZWZT?=
 =?utf-8?B?TnBKeFloUkZvbStHeEJhM0VLNHVQVjY3SlkzNnNRS2FJSFVQSFljNDFZSVYw?=
 =?utf-8?B?cXJoN3c2K3Y2TCt2S240T2w5cFNvWjdCMkkrV1NTY0xBRWJuQVRNZFJ0SFBp?=
 =?utf-8?B?WC9wU2pwU2RsKys0dEYyKzR1QjcwUjA1dnVoUE9zMGpOTURXQm1CeThRbW5X?=
 =?utf-8?B?cmFlQXR0T2lsK1haczhoS3lQTWtGbFlJRFlMODRUc0k3eU1MUUdlV0F3MlVp?=
 =?utf-8?B?ZWJReGtmU0xTdUYwQzRobTc5Q01RWTZEL3Iwa2JzTEdPdVB4OXBhTTI1N2RI?=
 =?utf-8?B?MTlBMVIweTZxbDBTTmRLNFFMdmoxR2hldTQ1RHdmRExvYWNZWWVieHJ5bUNP?=
 =?utf-8?B?RUM3SDNUczFxUkF2dDRQM0VFZmxxL0plN1BnQS9QOXUyRUc0VFFJUmdBc2Va?=
 =?utf-8?B?Tkk4alY0WmtFdExRck9CNTFZRnVBTVcyY1pHekM0RWFCc1lvd1M5QlJSWU42?=
 =?utf-8?B?aU1MY3FPWENlVEZra0EzZzJ4YUF2cUloYVkyc3hkdjhwcU5YRzdIOFFNcWkv?=
 =?utf-8?B?RW05U09FOSttdmlFU3BNbnUwbnRlMkQ5QllJN0hhZUFUSm56bWtsUDVpWHZh?=
 =?utf-8?B?UFlYeFRKaURRTW5LSHg5aUpiUFBueE1ZaUhieDJoYmRaNUFwL1lGNlg1MVN6?=
 =?utf-8?B?bXczdzFtNXVlT0FCTWNMQXRLc3JHRDB1MHl6L0d3dHhpM2NKVEoza2xSaHZq?=
 =?utf-8?B?bytpMU1LMVVLWHJ6TlRrSVBXSGFxN0doTDVFV0ozWmpPZWRRNFZzbGFMbHhq?=
 =?utf-8?B?MzcvZG1rSkcyVkFwTWc0ZWFyVEpGUVpNd2xaNkJlMEhnVVZDdEVDRDRuamlM?=
 =?utf-8?B?RUp4SVBOeUQ0d3RsZHMwL20yOXdiT3dWUERYcWp0bjhNelJUOXJWYlB5U3lp?=
 =?utf-8?B?ZElVdWEyeWdMRDF4Z0hUNzE3ZjRwdzRHNU1rMlozK0M2Ujk4MkFqMWhsZkRp?=
 =?utf-8?B?WFFPVnVMMmRjbTczcHlXcFdiSmNvdHdWOTdNY2ZGNythTm50bExUN2xPY0pF?=
 =?utf-8?Q?kpgEwIaQ6iW+HpYTX82kpJG2u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7E3ECC73158F64EB12DF27C2A0BA7ED@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR09MB3143.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45791ce-142a-4976-0df9-08ddc2d0379f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 12:16:09.8364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zAPfOwNEFdhEOvF79P6+dNheKCCh4kKABOfNLVhK/LCRV8WG8NT+7L/znxe648hvbls3/CaIRYAZiX9fV5G0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR09MB6623
X-OriginatorOrg: bmw.de
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 12:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220227

SGksDQoNCkkgc2VudCBhbm90aGVyIDExIHBhdGNoZXMuIFNvIGhvcGVmdWxseSB0aGUgb25seSBv
bmUgbWlzc2luZyBpcyANCm9wZW53c21hbiwgd2hpY2gNCkkgY2FuJ3QgYnVpbGQgbG9jYWxseS4N
Cg0KRm9yIHN5c2RpZywgSSB0cmllZCB0byB1cGRhdGUgdG8gdGhlIGxhdGVzdCByZWxlYXNlICgw
LjQwLjEpLCBidXQgDQpjb3VsZG4ndCBnZXQNCnRoZSBidWlsZCB0byBwYXNzIGR1ZSB0byBtYW55
IG5ldyBkZXBlbmRlbmNpZXMsIHNvIEkgb3B0ZWQgZm9yIHRoZSBwb2xpY3kNCm92ZXJyaWRlLiBJ
ZiBhbnlib2R5IGlzIGludGVyZXN0ZWQgaW4gdHJ5aW5nIHRvIGZpbmlzaCB0aGUgdXBkYXRlLCBJ
IGNhbiANCnNoYXJlDQp3aGF0IEkgaGF2ZS4NCg0KTW9yaXR6DQoNCg==

