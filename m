Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54653E6BF14
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 14:01:30 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10909.1769781680488822002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 06:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=sIDk8KV4;
 spf=pass (domain: siemens.com, ip: 52.101.70.3, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFb617vzIwe9Me2q54DifCUGbjH3L9MOjtS5XESem96cwpunbM9l20oQBMr6gC6luMIhr15Ow/GEIr6DiygaWsACl1RcWqO8w5YA250XGhEIs37kvpIEFbEmJpNlTkLhkRHo3NQ+mdxkrqxOZlN+zGCbYpsM0NLnmolY+JPvWHfUuo6K82WIv5hudQNUZAg126+m4VRYRjExoIWLgNIbO/4ifJxKj83+BTH01gEiiDy6aOroJ6WzLRdPj0AfuJ5qEhPugTvGVJVytjHRTdqGU15KDhzNxgEpGuBLxy4nv0f00lAlFcXxeXC/r8hdgYZ8OjkjVu1zS8wDCltxDTsUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POtDId57msDolkURlFLT9PxCnvRRU03mYx057nF9QE=;
 b=rUwtqImu7yqDwSlELrw4PgpZs3geS29Uo8X2gkcaCNtQnXQVAEqAe1ziylz/jFMKahSZf5OHEIZ3hCJqCNtA5xcHKskusBMzbsDmkGk+lqenzPNeyuauWlX6G1G9TNl9vhCBXHXf+BwaQU4Lqe6WsV7bXi/rYK3Q8iitD5+c9FmBvqYbLu6pi1WtMiQ7wVyOtaa+ZmsUKAxobZgdwnObgXEohnv/QYF8/TIctCJnpp7l71xXx1w1D1rnp3wv4tIjNJHb8v22bvGCV6yMK0Wm1nnjMWLSmk1naHBR/t1joYFBXscBYolGSnaGH3A4Q29H7PyDWGEWVCYZTnFlGoGVSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POtDId57msDolkURlFLT9PxCnvRRU03mYx057nF9QE=;
 b=sIDk8KV45srAOfMWjs2xmdURxjk9CthJttwyNUBwHi24l6+QRn7ZG5rEFnOrIHeyS8raOtB85F27+mzwYyepoOJ3q4Rk83deX3b3WcOe9E/qSSFyzAo1nu4bpqu61EWOP67+L2kX2m/chCGdYLX9ZVNBNOh0VegYrAOQ0o1IKgLM7Z1B85lYY+sb9J2tzBVQv/V3ErxeuU+EXBdzfPx1enY9mGmddbCsUuRNImAwLBkUbnRNZ+rPZYQcxfbXaGCM53Wcra9elqLz1DOgNJkJap4GPlUsm3h1AEkO7EDfAE9LMqTD46HmkCJOphEARJMqgHbI2hyvK02On8LNR4Dnqw==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by VI0PR10MB9379.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 30 Jan
 2026 14:01:16 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 14:01:16 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
Thread-Topic: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
Thread-Index: AQHcjpbERIAJq1C9Mkm8WETHjq7Tw7VkuOIAgAYLvQA=
Date: Fri, 30 Jan 2026 14:01:16 +0000
Message-ID: <379348c1ef6be708178a377349b45fb1d5a10f06.camel@siemens.com>
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
	 <20260126073809.468495-2-adrian.freihofer@siemens.com>
	 <DB5PR02MB102130245609E0C43922FCC69EF93A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102130245609E0C43922FCC69EF93A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|VI0PR10MB9379:EE_
x-ms-office365-filtering-correlation-id: ab8965a8-fb48-4719-6c94-08de60080937
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UmRySHJvcW9oN1AwTXQyNW5NcGpsVFladW5FRC9ud1Zub0JmcFRxTjlGeTkx?=
 =?utf-8?B?Q20zSUJSR0h3RXZLRFh4bWFRSFhrcWVFTEVWNVVEM3kvak96UHp5eWdEbkJQ?=
 =?utf-8?B?d3czYkg1RTI3NHlIcTU4U2tEb01SVWF5YmVEaXZkenYvaHJLeFpEUzFjT1kw?=
 =?utf-8?B?MWxzQldSQlBheldHSkM3V1lkdGJSZFVJMFdvSUlJSjFOeDFrWDRUcnEzVGkx?=
 =?utf-8?B?SUlxaDJaS0NCdnd6TVl4T2JuWS9CZHFCU2ZQQ2M1TVUvR05HNklHeDJFTlll?=
 =?utf-8?B?endRMG5MWXJJeEdWRGkrM3ZmTjJnNnpLSm9xajlJaVpNbUYyZHI4bDFFdDhD?=
 =?utf-8?B?UytJYjVaWDRzQXR0RmhwZGpvZVF1ZktoYW1SdjFvd2FkQXVLSThxOU9pTFpk?=
 =?utf-8?B?RXBnUENwNnkxZG9MU1kzaWlkOVBVUE1CMi9rYkhSZWcwQi9pSGJ3TG5McDdP?=
 =?utf-8?B?dEg0SVU2eXJNRHMwRXFDc3diQXhtY2xnN2o5UGhVTStXUTFNdGZkOUdiTFZZ?=
 =?utf-8?B?eWp5MHF2cS81MzFjL2x0YjFsSjlBZlM4b0x3SzlnYnduc29QY2l1ci81OGpU?=
 =?utf-8?B?SXJOWC83RFd6SDV5d1pSVHBmeldraStoTVBzNGpWaXNHdThvVEZFR3FaSlBI?=
 =?utf-8?B?ditNY1B5TUExY0FpRFhybGs1ay9mTnQ5T0lBWmtMaGdtVkJseEZqSG0yNXpy?=
 =?utf-8?B?ZmFsVDJpZ01TQ2M4NlNPOTEwNFlhOEN4bjZQVGxsTktYbDAycDhjcithY1di?=
 =?utf-8?B?MXl1N0NiYnUxK21nWHZ3WVdBQUdSV0ZaNXgyQ3Z4UmtMVkl0MFpYZVpRamdj?=
 =?utf-8?B?VUh0MGp0L0cyMmZqOFhjTTFHd1BSRkpickhGRE5NalMvVzB1WmNTOExIaVFn?=
 =?utf-8?B?dzRYdzlPMStrQ0VLbFdzRzNNd2JvK3hHRXJzTkE1MjR5cnhiRkRINkFEbVBi?=
 =?utf-8?B?RnhDaE1pZDJkT3EwZ1JFWG01L1ZHTlhZNTRETG1RY3FnR0o1OHZDV2VyQ0lQ?=
 =?utf-8?B?dVZxUnM3T0lYQTV6Znl0ZFRLOXBuZW4ySUxuVWJuQnN3YlFUVWFjS1VERXNC?=
 =?utf-8?B?NW5WQVZHREMvVkdLRDdNMWxWeHFydTRxdmcycmFxTk5HUmEvbklnY3RHL1dT?=
 =?utf-8?B?NGdOTkJlaGVUTXdVeFRnQ01ua1Q1cGNsNURCM3phWDV5THJEM3dFM1BCWERz?=
 =?utf-8?B?Z0ZqQU9uVmZrTHRXRUxxY05nUVdjSDNKaXlzZlcvczY3TC82all1NXNmVjY4?=
 =?utf-8?B?MTJDeEhJZlFxUDRUcW5BcXBtR0NBamNkckloVUF2SEZxMWJ2OVV4YlRKUXk1?=
 =?utf-8?B?UXpOdmFJQUx5ZzRTUWhxdEF3K2IxQ3VrdGhYNmVHU3lkSUJnVk5QN0RiQjNx?=
 =?utf-8?B?eFlGZHA2VElyK0djREFiejdxMTdzNFVsc1FGRW1SeDhkQUJ2K3ZoTTJSWHFI?=
 =?utf-8?B?aXpvWCtIbGhTSVJyM0RWMEp5K0p6SWZQVVN4eWZsN1RuMFM5TGRJSTZtZFFq?=
 =?utf-8?B?b2FPQ2E5UnNyOEEvMUhqQ1NiWkU5ek1JZzEvT1Q1cEpLYUh2ZnM5M3RvQ09p?=
 =?utf-8?B?SjVBUTE5aDA4Vjlkc1cvclhuY3RoSFVWQzJzN1A1OEJXSnhvZzdBRVFOeUVJ?=
 =?utf-8?B?SGdBQkI2Ym5EL2NsVGJIYUZGamd2cm1Sbmp1cUM3bzcwSE92TitoYjQwVHFp?=
 =?utf-8?B?WU4rdVVLcTVQNFcrVGlUODBMd3lUWE9BRXVET0p0bmdIb1RKWWJXcjdsMVVI?=
 =?utf-8?B?Zjlja1pLdXA1bXdRajdkRWgrc3V3ZDRvU2FSVld1N1c4ZEY1bG1iUDlsSlVi?=
 =?utf-8?B?Qk9VVXhIN1NTbG5pZG9PNWJRamJlbEhYZDRjeERTVDU0Y3A5K0VBVUdnR0k5?=
 =?utf-8?B?UWNpY09MbVpycnRxeFFyV3pxNzA3dHVJRmh5Q2toQjh5alZqS1ZFaFZrd1FT?=
 =?utf-8?B?OHJsUkFkUkMyemNPL0VIbVhxN1lkbkhGbzZqdG1FL3V5bG5McjVaM0E4a2NS?=
 =?utf-8?B?UXBEcndEUDF2SkJ0OFJBUS9TemRNWnMrYVMwb0VYWUMrZHFRUXhrVXF6dXF4?=
 =?utf-8?B?elhWUHRLT3dkTFRxM21pVWcxcEc4ZGQrQzZGVGpXb054bFh4enFvRmZFQ3V2?=
 =?utf-8?Q?x1xoKRJVuy9wwuiRnmVC0ef85?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aHNURFVSVUw2VkF2Zkd2azdlVU9KV0ZTR2RGb1luUkRDRWhRbXp4dlY5YTFr?=
 =?utf-8?B?V3J4WnJFZUVLNy9mVi9HNVRiWXhXZHNDVlhRSmU5NW1YNDRJNUJ3MFJIQith?=
 =?utf-8?B?ZDEyb2ZZdUM1UGUrMjBtMnBKK3V3ZDFWQ1AxVGR2WWdVMFY5QnZIL204WndR?=
 =?utf-8?B?eDFiVmVpQktBMVVuU0tlckJra2l4MnRFZXBLaGdEOTZDYmhFTlZ0Zm1rYnd2?=
 =?utf-8?B?UEJyUVNnTDkyUmFFWmxoSU4zbUtLR3ZxYUI0aXlmeE5BUUF4ZWdZR2FJVmVo?=
 =?utf-8?B?TDdkVURZOW1KSGZQYUlKR3ZVSWg5cmR2TGppLzVwekZwUGEvbHN3TGxKdWVH?=
 =?utf-8?B?ZWZMaHFaRlVRWWZ1QUsraFpxVTlZU2p2QzN4bTI5MjcyTFRpeEd0L3Roa0o1?=
 =?utf-8?B?S1ZJeUE4MExlV2R5emhRK1NYMzFmOFJ6L212RXJLM0hMcWpzMkJUUzVnZ25U?=
 =?utf-8?B?TmwrSWtSc09ya0MweG54NUpPZjMyM0phOWRUV0lUcUl4YWI2M0ZZSlNRc1RU?=
 =?utf-8?B?VmplOTZGSTNYdlhTQVVyVGFNcFB6OFN2OGc4Wk00ZWRYTjJram1NclI3WnI4?=
 =?utf-8?B?WTM2OXAwcVU1bi9BcXRrUUx5c1dSS09vRUxnZlJzNmVFdmVSRyt3clJyY1Nj?=
 =?utf-8?B?L3RWejRWQmlOVC9JbWpiNHZNalc5VnJQSVBFS3plN0t1VEMyTjEvdFVjQlpr?=
 =?utf-8?B?WGNyZk9ROUsrdWVTZGFJUTBpZXVmT3NhWUh6d3hiSFNiTUJ6NGU2UTZRME5x?=
 =?utf-8?B?bmpuZVVnWkxoaUNJWVFiTmNZSFBZYWRXMjA2cThlcGc5S0pCRHFyWHFJeGJj?=
 =?utf-8?B?VGVLREt6YlIxQmNWL2RVdFhseWxJbFkzMHdJRnVsanVBaUFFbEZRMFUrNGJR?=
 =?utf-8?B?LzdQeXpuanpZejh0VGY3UHl0TzRHdkxIVjhkWUc0WkdPT3hkS3A1REpBaDY4?=
 =?utf-8?B?MWNmcHUwRmhyR1Fzd3dmbk9CU1NVeVZmSHRZSmlGazRSeDRoM1d4b1NQcUlT?=
 =?utf-8?B?ZENOZStYTHY0akdBZCthUGNsVWs0N3VjQWc2dXZBYWNNanZLOVRRc0QvNmpE?=
 =?utf-8?B?OTU0bW5Id3FrTFZjL045UDNJazFqZ1BsVWNnTldlU0RYaU1MMFFpRE5XOTZV?=
 =?utf-8?B?WUhpcm52ODIwRlFnSUtiTmh3bXQydVpnajcxNUZ2cCt6SlZpOTd6b2cwWlha?=
 =?utf-8?B?bWlUVzNSVytFZ3A1dmhCN3ZSbjNxTk9yRDJvRW9odEl1Y3BlQk5GcCthNE5l?=
 =?utf-8?B?di9sNEd4aXJ2b0VGdW8rbWpCcDVLVUZ4VHRDWi9pZ3RkZG82N3UxM25Edlhm?=
 =?utf-8?B?RFVGRTl3b0RRQzh3ZzYrMmU3YWhNWGs3WlltOU8xelBzQVpmakNnbVhmZGY3?=
 =?utf-8?B?dDBPZmE3anZpRVB5dXBDWkdNQVhnVWZZY0ZjUHA1TXIwTmt6bjZMZEdjMlE2?=
 =?utf-8?B?QWVoTGlxcStwOGJYOTAvcmpFUDJvb2RBWEswYnY4NnU2OC9ZNGs4SDcyOU1H?=
 =?utf-8?B?czFnU0NES01oOWdWQ1ozeEw4VHZYNlRpcHBGWFNvRkh4QmxSdTdMdk05YUdm?=
 =?utf-8?B?UGEvQ3pNdkd4TEpKeUN1K21FSUEyZXNZd2o2QWhuVDd1NGV4Z25SNVQrSzZ1?=
 =?utf-8?B?LzlmU1JwQWNHbEl6a0xaZzVMeXFFTW9RR1NuNm9DZmZQbzNqaTY5YUVOWGps?=
 =?utf-8?B?QmN6Zy9QaUxnY2I4Rkk4OG5vNnpqQWc3WUNsWWlRb3JGemNyR1VFSG1SK2g5?=
 =?utf-8?B?SXEwMlFsamFGanJWNkhRYkpNc1NIMVExbXJXcHgvUTJxak5KUzhubDFZbVRq?=
 =?utf-8?B?ZW1IMDNPZjlHa3UwSkhkcGk5QTEwZXRCMXVjNzJqdlc3Wndla2MzaDcvNW9L?=
 =?utf-8?B?RndGTURNajhBdVEyanBuSG00ZnlnYVJ0M0Zhb2JHNzdYZ1BWSXRMeTlpNEhU?=
 =?utf-8?B?UUFyaHNyMzhENFVMQmdLcExZaGdsdVdpTXVqRms4cENDaXBpZkozTHZrcUdN?=
 =?utf-8?B?QnRYUFVma0sybXJqKzhlZlQrSFJwTXhoY0lHdnhzZll4VTE1cFlpTHl6aHhB?=
 =?utf-8?B?V21HcDQ0cDk5RFJZYlFRK0UyRVdxSDU0YWxuYytzMG5COFdKZDFCeFBvYUpH?=
 =?utf-8?B?SlB2b0V0ODUrV3ZQMmlESnlkS2pmRGVJTklab3NXaFlPZDljaUhycXZ0QVZH?=
 =?utf-8?B?K25HcTBqdHFtZTlPd2d1YUcrelptOVF2c01zNGdhMkpMcmU0RlNvRGJ6L05G?=
 =?utf-8?B?bDE0ZFJVSFAwODNteTE2Y01EUzhrbTkzaGw3U1JIdnpFcVgxMzg2cy9vZHZm?=
 =?utf-8?B?SjhEbkRGWmtSazRaYkNscnpNazlJRU1MaTd3aHo3ejRhaU4wdnRuUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B2ED54012DD894299FCF2EE851E1477@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8965a8-fb48-4719-6c94-08de60080937
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 14:01:16.3374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXrCBQTuF5qN2I3oPr46YPeUJYTGqEj3jTnSA/O51Apg3fgsK7U6aEv3oO9wMEZYv17NjZRHQAeDMXiG1th2cTBJMSR7V+EZlQFf5h3oUQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 14:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230199

VGhhbmsgeW91IGFsbCBmb3IgdGhlIHF1ZXN0aW9ucyBhbmQgc3VnZ2VzdGlvbnMuIEkgaG9wZSB0
aGVyZSBpcyBub3cgYQpwcm9wZXIgc29sdXRpb246Ci0gaHR0cHM6Ly9idWd6aWxsYS55b2N0b3By
b2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNjEzNQotIGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjMwMTg1Ci0gaHR0cHM6Ly9wYXRj
aHdvcmsueW9jdG9wcm9qZWN0Lm9yZy9wcm9qZWN0L29lLWNvcmUvbGlzdC8/c2VyaWVzPTQyODM1
CgpBZHJpYW4K

