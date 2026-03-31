Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8936010F9306
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 22:05:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2857.1774994735376060755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 15:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mUNUX9NN;
 spf=pass (domain: siemens.com, ip: 52.101.66.49, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKgBBY7Nsh0wGrG5rxTkGyRrw0NDna98smynHQBznA3jGsvXLHPzKLzmmzrdg/2T/dESFGGzc1lImTELiXt9J3SCL8gg/Fh4UtJZvLx+USUiHCPSS4Z3cnZmAr6DjOvQbTB2bsnQcVhnpEUWLjNc9j4ZApz5SKLerVZBZjRxqbqzs7nAh1IhPxeWQKKVq3sqPw30LB+mX82ZCnAVCOBKkT2VVKwdtaeIAV7TtJ33Uy/FARa8wlRuw0zMOETMwFhedoTs68jSgx1SXcadjJ0WVRIQ1j07n7mDHwJOyMQLn4En+EeHWQBVpcvZRSajAr/kflptQArnV0TkCZyP+RWDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZePAVe+XqGPh8HV7F22RLftRVBvQ5HYcsN+WVKRwWI=;
 b=gF/VU6zh7L9gSS58kOBvwjlZDLFtQIJ+PxcEwsTk/BZXSBleoLeo7qnLJbRmK6fMR6+99qGaH3RASLKOhhqVRfh9xVJjaNi/h+uoPe+v/U61oOBLHVTmbb9sdolEAZDaT9HvO5LtD4uqHp04Dc+PK4oDv0yJQh25zsvd9iTnBQ1ksEjECGa1MJGlTNov1CfWDFkDpHtAwrPEneE4KrxXzYHYlEyizQZsQUnrG6mPAegb2AjU+FGrxOInvOm5S/UE5Gmp9OP+02G5FSkp4J2k2P+QKuwvWERmm4hthENJfG0NQkUeYvjT4tGCvoC779B1tvBmpqPno8yb1aJCt99oVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZePAVe+XqGPh8HV7F22RLftRVBvQ5HYcsN+WVKRwWI=;
 b=mUNUX9NNsZTO7OX0NtHUiSyEmXhQs3eWFzQifOZbLUJyupTefPmYwPIQWNL8t6lGSfecD6bBiik2QJIHCi6LkSex5bCSjyD7aJHU2XL81VUOzwPfRzmqqk+atDXC8YwDSFxTH65oAefn5zvJlpvNaHQLnzE2D7ojeAPVN/1CijOD3rIES7ZNE5pDyiufLkOazh3npbKpSwdDWynRlc6Y/BLDJP1KPsadNt0VcpczZt+t0eifEdXOnQ48F4jxvurii7LtPthoJdKOy0PgpSypEmR5H8i80Rd3jeZgdjfOdqykCTgGABij4kh96emEoUoSEq9pjgMUm34j9D1L4T3mtA==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by AMBPR10MB9375.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 22:05:32 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 22:05:32 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "stondo@gmail.com" <stondo@gmail.com>, "Tondo, Stefano"
	<stefano.tondo.ext@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>, Joshua Watt <jpewhacker@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "marta.rybczynska@syslinbit.com"
	<marta.rybczynska@syslinbit.com>, "benjamin.robin@bootlin.com"
	<benjamin.robin@bootlin.com>, "Marko, Peter" <Peter.Marko@siemens.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document
 generation
Thread-Topic: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document
 generation
Thread-Index: AQHcwRl/zTKOOMHWOU2EjFR+QiyMH7XIsb0AgAALSACAAHXCgA==
Date: Tue, 31 Mar 2026 22:05:31 +0000
Message-ID: <e37fc3654ebe48350a6f35a51792ac1be5d4c307.camel@siemens.com>
References: <20260331141956.608976-1-stondo@gmail.com>
	 <dc8346baa9db2434b2296c22550e40ac7389201e.camel@linuxfoundation.org>
	 <CAJdd5GazcRuxPSdgXEb170f+E5uA2oP=C2eKLqCNnLC8Y_fB6g@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GazcRuxPSdgXEb170f+E5uA2oP=C2eKLqCNnLC8Y_fB6g@mail.gmail.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|AMBPR10MB9375:EE_
x-ms-office365-filtering-correlation-id: e4bdd794-ba5f-4996-7d68-08de8f71a079
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 SHtY4RqgtjZ32OHs6dv6+PydRyfFYmJeSjbUqw8ZDFac+jZJCITvisrkz7aHydyG3i6CJ3k3EBgdf0m8/G77yW1ReuUWs3DdeXSK6JGhwQTKwFGNMKjE0kZZXNeHB1OPekjMJMhWQHpBPps0Wb0rZ4H+xlWn7msvM+Dq3GoLuEaVSZpKjDCb6dupWlIneIZElhGzon5aGV92JAxrhYAORkXQw7YVVxCi8FRUdkkUy+oYDaP9FFzJBFvahy/vkke8Vw1+pMo8SHak1cq1QVQ+ZE8+w6TZvOForoibS8ZyRaPQGfTGfyl0S1uzmUox75drZrPZmUygYVw6TsVfB1oJ9ISbcbkJWwMChxrDD6RytbKDse5YNHmPbXi04OiFvGs1R7EwtCDN76srRWQbBvvHgqu6ivTia1lvNprxMXhGmFLquyfch+hvVGBP7Ivkb/reKrL1B1wyLama4bgckzdUpM1hpirqZwuLTUhtjYIoDnP8IQxpUrIRdi72pBI2NzJh2WssfiCQ8CpebKzGMtLsBUizzcydpm5BOiY63tRTpmxvIrjFVeKjm7szdYm8Vq+IpOE0TqD/Nt8yDnA3zf93JZzvc27IiD0V1XnHLUA3t4pV+2rYdjwGKwwvVEMbGE4a7Yh2yICwFmQ38MbtGTXJd35P61mvFFW0DNh7hVLpbVG3Q5CKYfXvPIMwXZwUXDwVldYy9m+IuTlS6uEriMjIvbw3aymqvv8BVI03Ucy5cMiyBKYdXYymIf49NhxXacXCqMG8iFgxW6in2SKhU4TdbO6NFiAeUoXbLVinXbvt62o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NEsvU1JEQXRHTGZENmtDUzFxcWlqMm03QnB5U0RtZGdSUnJxS2V3REtVcDN0?=
 =?utf-8?B?b053aDhzYUpwTHRSVzJUa3VwcFJnSHRuUDFTOFN2Q0hCajJNSHRuNWlEcWhk?=
 =?utf-8?B?bXFZWk1nNlRVb2dpdENFMHgyYVRFd2djSVJvVlVPcmZ2VENDZmxrNzNBWFBK?=
 =?utf-8?B?NDBKd3l4WmRubXg1bHpBR3oxTjk0dlVaOUhOWVpVNGZhRjE1Z2FJR0dZcWNs?=
 =?utf-8?B?bWZuUkI5NDNDdnpUblVCSnRaVHFlbGlGQlpWeTY4TDJtd2VHREQ2d1ZrM3kz?=
 =?utf-8?B?NUU3Sk5CWVNvOTB3S0RqWnY0M2s1d1pnZjJiN3F2RXc2bm9mb1NtNHNKVGFH?=
 =?utf-8?B?Z0h5TFRyNVVyODBXQnptYVBoSGJDdUpUSVkxaHhKMDBoeUV3NHBZeWVKN1BU?=
 =?utf-8?B?MmxFenR1dG44S2kwVG1qdm9oSnhvam84SUJpZkVtMGEzZlpaMjJJUGpJQ0tD?=
 =?utf-8?B?WmVRL0E2YmJJTGdVMFVycnVucGtWTHhWRHpqRm5kQzAvY1dYTkk2ZUhxY0dy?=
 =?utf-8?B?cFVyaVpPVytQNGhIaFl0c1lkRlRHNXhNajFpcjRyYnBOT0syUDN1Z3pWd2o1?=
 =?utf-8?B?cW1FQS94WG92TUJMWFAwQnRhSEFSWmxNSHN5UHVqeGxWdlZpeFZMZjVnOGRs?=
 =?utf-8?B?Z3A0MUJBQWZ4R1BkcmtWZVV0WlFRZ3c5Mmw5SUVyQy82OWUxelQ1V1d2SDM1?=
 =?utf-8?B?K3BkZVdzL1pnQ0pBbHVXakhFZFMyUGRSSnFpZUVaU1hWb1h6aWNPMmFkTi8y?=
 =?utf-8?B?ckdGZ21YQmN4UFF4QjJzSjZOWDEyc3ZSVzFzMUExbXVZa1BHbFBFZjE3TjlX?=
 =?utf-8?B?Z21nNFRhSzZCR3lwUG41MmdFaHpQZWRsRDFISzRsT0Fab01abkU5eWVCNFYv?=
 =?utf-8?B?SE5rU2J2TFlTdWpFK1VQNTlIbVNXbXRxc3JlTURZRVVtbnBJbGNZNnRSQjRE?=
 =?utf-8?B?N3hWb2d1SXFiTVg2QTBxWEtDZk1CVnpYL0tLb3FiR084Zk9veTdtU0xvUGlD?=
 =?utf-8?B?bHZXdEt4MXdnZGNaTEx1dkUyUG9lYUwrRFBwM3E5U2dQWHF4M21KMU8rbEQr?=
 =?utf-8?B?UmZVNithL1lGdlFIRHQ2RkpLbG1uWVZ4VS90NUJJUW85MlFUZ00vQmwwN2tw?=
 =?utf-8?B?RDQxV0M3bzBhUTJTUTJWanFSNStTS0MxOU5mUENTM0RYaTlkb1JxY29MSjlu?=
 =?utf-8?B?UVdkTHc3eUQzblNib0JNbGRlU2d0UFh1TllXSHlOK0d2Ri9LT1VJZDRpaUhw?=
 =?utf-8?B?OC9RSm44Rk5BK004V3ZiTVV2V2RwZW9JYXBXQkJkcWRjQ0FwekFIUjAzTVRu?=
 =?utf-8?B?VDUyZk9DK0EwRzJVOXpmMXQyanhmdURsUE5weDhiL1NKUnFHUThQdW1yQUNI?=
 =?utf-8?B?U3FTU3E1bTJ5NldMc2Z1MUgva1h1WG8xYmJQMjRzSEFVQ0xObEJYOVlDSy80?=
 =?utf-8?B?VmxTNDlPeDN5WS9UMEs0YUE1OHp5YTJRckdxbFF2b2hkQ3YyWlJ3QTZQWXpM?=
 =?utf-8?B?QTd5MWM0YjhZYkpTYkIxZjhpYU5yLzhTUlAyNTZrVjVFYnRJa3NiVWNNWnVK?=
 =?utf-8?B?NHEzdDlsQWdWcGEzdEFlVHduWHZqc3JTR2w5Nk9PZ2FWTHJrS3FUa1hBdjg3?=
 =?utf-8?B?V1ZvSkRVemU2dUtBcjYwNW9SZ0RRUmFpTXRCRW03Y1dYWTd0Q2xVRkJMaXNQ?=
 =?utf-8?B?RUZ4NExiTzBJcGZLWDh4eHpZai8zeDdzckJaZzZCSmRYNE4vM1FYMzhzUWRa?=
 =?utf-8?B?eXhqVCswc0ExaHBPeUd6ZEdZSFdXb0ZDM29KaFFJY05BQ0UyaGhzS21uVFVn?=
 =?utf-8?B?NU9nSnpxYXVLZjJBRnd0RTVLL1FJU0h4eld6NkRPcnhFK2Z5T3lpd0sySk1Q?=
 =?utf-8?B?YWh4c2UySVdrK2VRTGUzVXhIajRNQlRNckhWYTN1OEkraG5LU0NiTWJXcUgw?=
 =?utf-8?B?YS8yUkZqeGpGdmZTcUxaQ0Jhb2VGOGk1ZHdaK0JGLzVkTDZFNTZUa0RONC9h?=
 =?utf-8?B?SjYwSk80WCtwY3Fnd0ZFZlNxQ3diNlZGTUppTk9zYmNBSWh3NllRYjMrTGhF?=
 =?utf-8?B?dk44L2dSR1NDbzk0SThoODZtWEZqMlh5RnlrZjd6UHFydzlGcVdpWDFMU2JS?=
 =?utf-8?B?SXNudHBqOUd4cE9JanBVOVJQRkJuK0gyeWVPb2o5TTR1VUVMQWNJU2VUdm1h?=
 =?utf-8?B?dnI3K1hwT3NFRDVrdXB3Z0Y5MWQ0MjhqZWk2Uy9GcUhSeXQrVVVqSUtEUThs?=
 =?utf-8?B?Nm9md0U3VWNlSDZCbHhPQSs0Y3htMTNaYlBoUFNQSnc3a1lWbUt0MUxFT0Mw?=
 =?utf-8?B?bGxZQzdDUjNzWHhEdytwblFaSWM4dGRkZGhQZWNYMXRFbWZmQ1pjQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <797703D6A9555444954C112E6CB067B5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bdd794-ba5f-4996-7d68-08de8f71a079
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 22:05:31.9550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zawDA4/SwvmCyWXOIRvYZ3R4WRVNh+bx9mXUGx4f48gpAJn14/49hlEG3pptSagVZ2Nwj+w2UKwbVo2JzXXBQcCvse3dvgFYZyoThRYdGnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9375
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 22:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234318

T24gVHVlLCAyMDI2LTAzLTMxIGF0IDA5OjA0IC0wNjAwLCBKb3NodWEgV2F0dCB3cm90ZToKPiBP
biBUdWUsIE1hciAzMSwgMjAyNiBhdCA4OjIz4oCvQU0gUmljaGFyZCBQdXJkaWUKPiA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IE9uIFR1ZSwgMjAy
Ni0wMy0zMSBhdCAxNjoxOSArMDIwMCwgc3RvbmRvQGdtYWlsLmNvbcKgd3JvdGU6Cj4gPiA+IEJh
Y2sgYXQgdGhlIGVuZCBvZiBEZWNlbWJlciAyMDI1LCBJIGhhZCBhIGNvbnZlcnNhdGlvbiB3aXRo
Cj4gPiA+IEFkcmlhbgo+ID4gPiByZWdhcmRpbmcgT3BlblZFWC4gRm9sbG93aW5nIG15IFNQRFgg
My4wIGVuaGFuY2VtZW50IHNlcmllcyB0aGF0Cj4gPiA+IHdhcwo+ID4gPiBtZXJnZWQgcmVjZW50
bHkgWzFdLCBJIHdvdWxkIGxpa2UgdG8gcHJvcG9zZSBhZGRpbmcgT3BlblZFWCBbMl0KPiA+ID4g
c3RhbmRhbG9uZSBkb2N1bWVudCBnZW5lcmF0aW9uIHRvIHRoZSBTUERYIDMuMCB3b3JrZmxvdy4K
PiA+ID4gCj4gPiA+IAo+ID4gPiBDb250ZXh0OiBjdXJyZW50IFZFWCBsYW5kc2NhcGUgaW4gb2Ut
Y29yZQo+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
PiAKPiA+ID4gWW9jdG8gY3VycmVudGx5IGhhcyB0aHJlZSBWRVgtcmVsYXRlZCBtZWNoYW5pc21z
Ogo+ID4gPiAKPiA+ID4gMS4gU1BEWCBlbWJlZGRlZCBWRVggKEpvc2h1YSdzIHJlY2lwZS1sZXZl
bCBhcmNoaXRlY3R1cmUgaW4KPiA+ID4gwqDCoCBjcmVhdGUtc3BkeC0zLjApOiBWRVggYXNzZXNz
bWVudCByZWxhdGlvbnNoaXBzIGVtYmVkZGVkIGluc2lkZQo+ID4gPiBTUERYCj4gPiA+IMKgwqAg
My4wIGRvY3VtZW50cywgY29udHJvbGxlZCBieSBTUERYX0lOQ0xVREVfVkVYLiBUaGlzIGlzIHRo
ZQo+ID4gPiByaWNoZXN0Cj4gPiA+IMKgwqAgVkVYIGRhdGEgc291cmNlLCBub3cgYXQgcmVjaXBl
IGxldmVsIGFmdGVyIHRoZSBwYWNrYWdlIFZFWAo+ID4gPiDCoMKgIHJlbW92YWwgWzNdLgo+ID4g
PiAKPiA+ID4gMi4gdmV4LmJiY2xhc3MgKE1hcnRhIFJ5YmN6eW5za2EpOiBBIHN0YW5kYWxvbmUg
ZG9fZ2VuZXJhdGVfdmV4Cj4gPiA+IHRhc2sKPiA+ID4gwqDCoCB0aGF0IHByb2R1Y2VzIHBlci1y
ZWNpcGUgSlNPTiBmaWxlcyBhbmQgYSByb290ZnMgbWFuaWZlc3QgaW4gYQo+ID4gPiBjdXN0b20K
PiA+ID4gwqDCoCBZb2N0byBKU09OIGZvcm1hdC4gVXNlZCBmb3IgQ1ZFIHJlcG9ydGluZyBhbmQg
Y29uc3VtZWQgYnkKPiA+ID4gZXh0ZXJuYWwKPiA+ID4gwqDCoCBhbmFseXNpcyB0b29scy4KPiA+
ID4gCj4gPiA+IDMuIHNib20tY3ZlLWNoZWNrIChCZW5qYW1pbiBSb2JpbiwgdW5kZXIgcmV2aWV3
IFs0XSk6IFBvc3QtYnVpbGQKPiA+ID4gQ1ZFCj4gPiA+IMKgwqAgYW5hbHlzaXMgdXNpbmcgYW4g
ZXh0ZXJuYWwgdG9vbCB0aGF0IHJlYWRzIFNQRFggU0JPTXMgKwo+ID4gPiB2ZXguYmJjbGFzcwo+
ID4gPiDCoMKgIG1hbmlmZXN0cywgdGhlbiByZS1leHBvcnRzIGVucmljaGVkIFNQRFggMyBkYXRh
Lgo+ID4gPiAKPiA+ID4gV2hhdCBpcyBjdXJyZW50bHkgbWlzc2luZyBpcyBvdXRwdXQgaW4gdGhl
IE9wZW5WRVggZm9ybWF0Cj4gPiA+IChvcGVudmV4LmRldiksCj4gPiA+IHdoaWNoIGlzIGEgbGln
aHR3ZWlnaHQsIGludGVyb3BlcmFibGUgSlNPTiBmb3JtYXQgYWRvcHRlZCBieSBhbgo+ID4gPiBp
bmNyZWFzaW5nIG51bWJlciBvZiB2dWxuZXJhYmlsaXR5IG1hbmFnZW1lbnQgdG9vbHMuCj4gPiAK
PiA+IHZleC5iYmNsYXNzIGlzIGFib3V0IHRvIGJlIHJlbW92ZWQsIHdoaWNoIHNpbXBsaWZpZXMg
dGhpbmdzIGEgYml0Lgo+ID4gCj4gPiBJcyB0aGVyZSBhbnkgcmVhc29uIHdlIGNhbid0IGhhdmUg
YW4gZXh0ZXJuYWwgc2NyaXB0IHdoaWNoIGV4dHJhY3RzCj4gPiB0aGUKPiA+IHZleCBkYXRhIGZy
b20gdGhlIHNwZHg/Cj4gPiAKPiA+IE15IHBlcnNvbmFsIHZpZXcgaXMgdGhhdCBpdCBtaWdodCBi
ZXR0ZXIgdG8gc3VwcG9ydCB2YXJpb3VzCj4gPiBjb252ZXJzaW9uL2V4dHJhY3Rpb24gdG9vbHMg
cmF0aGVyIHRoYW4gdHJ5aW5nIHRvIG91dHB1dCBhbGwgdGhlCj4gPiBmb3JtYXRzIHNvbWVvbmUg
bWlnaHQgd2FudCBkaXJlY3RseS4uLgo+IAo+IEFncmVlZC4gSSBhbHJlYWR5IHByb3RvdHlwZWQg
dGhpcyBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9KUEVXZGV2L3NwZHgzdG9vcGVudmV4Cj4g
wqBmZWVsIGZyZWUgdG8gdXNlIGl0IGFzIGEKPiByZWZlcmVuY2UgZm9yIGhvdyB0byBkbyB0aGUg
Y29udmVyc2lvbiBmcm9tIFNQRFggMyAtPiBPcGVuVkVYCj4gCgpJIGFncmVlIHRoYXQgZ2VuZXJh
dGluZyB0aGUgU0JPTSBhbmQgdGhlbiBwcm9jZXNzaW5nIGl0IHdpdGgKaW5kZXBlbmRlbnQsIHNw
ZWNpYWxpemVkIHRvb2xzIGlzIHRoZSByaWdodCBhcHByb2FjaCDigJQgYW5kIEkgYmVsaWV2ZQp0
aGF0IHdhcyBhbHNvIHdoYXQgSSBwcm9wb3NlZCwgYmFzZWQgb24gUm9zcydzIHBvc3QgaW4gdGhh
dCBlYXJsaWVyCmRpc2N1c3Npb24uCgpUYWtpbmcgdGhpcyBmdXJ0aGVyLCB0aG91Z2gsIHJhaXNl
cyBhbiBpbnRlcmVzdGluZyBxdWVzdGlvbjogaG93IGNvdWxkCkNWRXMgZGlzY292ZXJlZCBhZnRl
ciB0aGUgU0JPTS9WRVggd2FzIGJ1aWx0IHdpdGggQml0YmFrZSBiZSBoYW5kbGVkIGluCmEgbW9y
ZSBhdXRvbWF0ZWQgd2F5PwoKQSB0b29sIHdpdGggYWNjZXNzIHRvIHRoZSBsYXRlc3QgQ1ZFIGRh
dGFiYXNlLCBhbiBYTCBTQk9NLCBhbmQgdGhlCmNvcnJlc3BvbmRpbmcgc291cmNlIGFuZCBkZWJ1
ZyBwYWNrYWdlcyBjb3VsZCBsaWtlbHkgbWFyayBtYW55IENWRXMgYXMKbm90X2FmZmVjdGVkIGF1
dG9tYXRpY2FsbHkg4oCUIGZvciBpbnN0YW5jZSwgYmVjYXVzZSBjZXJ0YWluIHNvdXJjZSBmaWxl
cwphcmUgbm90IGNvbXBpbGVkLCBvciBhIHJlbGV2YW50ICNpZmRlZiBpcyBkaXNhYmxlZC4KCldv
dWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZXh0ZW5kIHNib20tY3ZlLWNoZWNrIHRvIHN1cHBvcnQgZXhw
b3J0aW5nIGFuCk9wZW5WRVggZG9jdW1lbnQgY292ZXJpbmcgYWxsIENWRXMgYXQgdGhlIHRpbWUg
b2YgZXhlY3V0aW9uPyBTdWNoIGEKdG9vbCB3b3VsZCBuZWVkIHRvOgoKICogRG93bmxvYWQgdGhl
IENWRSBkYXRhYmFzZQogKiBFeHRyYWN0IHN0YXRpYyBDVkUgc3RhdHVzIGluZm9ybWF0aW9uIGZy
b20gdGhlIFNQRFggZG9jdW1lbnQKICogQXR0ZW1wdCB0byBhdXRvbWF0aWNhbGx5IGV2YWx1YXRl
IHRoZSBzdGF0dXMgb2YgQ1ZFcyBmb3VuZCBpbiB0aGUKICAgZGF0YWJhc2UgYnV0IG5vdCBtZW50
aW9uZWQgaW4gdGhlIHN0YXRpYyBTUERYCgpUaGlzIGVzc2VudGlhbGx5IGRlc2NyaWJlcyBtZXJn
aW5nIEpvc2h1YSdzIHRvb2wgd2l0aCBCZW5qYW1pbidzIHNib20tCmN2ZS1jaGVjayBpbnRvIGEg
dW5pZmllZCB0b29sIHRoYXQgY2FuIGluZ2VzdCBTUERYIGRhdGEsIE5JU1QKaW5mb3JtYXRpb24s
IHNvdXJjZSBmaWxlcywgYW5kIG1vcmUg4oCUIGFuZCBwcm9kdWNlIHZhcmlvdXMgb3V0cHV0cyBz
dWNoCmFzIENWRSBjaGVjayBncmFwaHMsIHN1bW1hcnkgdGFibGVzLCBhbmQgVkVYIGRvY3VtZW50
cyBpbiBtdWx0aXBsZQp2YXJpYW50cy4KCkl0J3MgYWxzbyB3b3J0aCBhc2tpbmcgaG93IFlvY3Rv
LXNwZWNpZmljIHN1Y2ggYSB0b29sIHdvdWxkIGFjdHVhbGx5Cm5lZWQgdG8gYmUuIEl0IGNvdWxk
IHBvdGVudGlhbGx5IGJlIGdlbmVyaWMgZW5vdWdoIHRvIHN1cHBvcnQgdmFyaW91cwpMaW51eCBk
aXN0cmlidXRpb25zIOKAlCB3aGljaCBsZWFkcyB0byB0aGUgcXVlc3Rpb246IGRvZXMgc29tZXRo
aW5nIGxpa2UKdGhpcyBhbHJlYWR5IGV4aXN0PwoKUmVnYXJkcywKQWRyaWFuCgo+IAo+ID4gCj4g
PiBDaGVlcnMsCj4gPiAKPiA+IFJpY2hhcmQKPiA+IAo=

