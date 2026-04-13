Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88119EBFD34
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 10:24:48 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.268679.1776075882885534507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 03:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=TOgBVO0W;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.40, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsIAk2We98WqB1H1ivtHBT5FHhnImL4LXA7khIRoGtQQW8iP1cu5ZPAxJuE6vSo6++k09xhZfuX3Lb/FTmWjVs4ETkV25egVph3pb8YMpfuPuc5TLj9ATJaKR8f+1xvGnnzBqDrnZu/5QMWegmi2vQQh1Ch3/FaRCHeoWUl/wRPNkQ8hBq09ioncv5W0FGpTMjo2ZnW7DvtZb4bOYmRKEZ63pCL/gi5S8cYqeInYoQ5bwVTCUDWBDIC97RKMl4ena+rkE6hv6LB19JyV3Ky52uwtqPAd/7gXYStCgYRziHEB46ZpqgHEsn3Ta/3C89AQBB+JOU7pNXNx6O3SrFRcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ok27nVkpOToCAWuFyAQ7A+nY35MOKzi82muBQzO+oo=;
 b=EwrQ1tcskgcwEBoOxFRfRkoU2F+Yaf7WYFs6D1sa3cLsWa6Ugj7SAO5As5xfOSjU10oLeIOQudNTkfj2AGe4GDUIn6zxwTsU8VDqBwcssUXaddarIEvCv8iPFMSP9DjJ/aoCNsOoKFJqMQxnisFdQJNYb34n4j8++aFB37zNyxRvumSqcMhgM603fEcZZO/1tDaaE1EXcYGGSN+PotfNdotpuAg54BqQxWV/CzVKyCxRmqUKBVLKW/aQQcrpdEhWLQEw7/sF5hILVp0T/dR8kct+StVkYV4/NsTKOoZJycRNWO9IzkiE453wf2CvFQ6uozAM1vaAcei7gwS+adIYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ok27nVkpOToCAWuFyAQ7A+nY35MOKzi82muBQzO+oo=;
 b=TOgBVO0W/xmAcxPpLUdrocgp6oytRypdYc0c69g7fPa98zHDxf6PdOr6b/xtv8OBtkDec8vNd7HkFb0Wgq+26YhYV6I/SBk9libWPyG5psrtP97amJTevlkIbTH7bZJN8lpsI0nzEXYnHkXmtMeoTBsofFm9jJz/z6O3ZaW2TUGdjfsOO+Q2MOWm2WTgWY5ojsOmy3yJErY1S2vNCCU7DDVGLRzrRM7lRhDxy26xnlOqYIbR4+mHk4SJuCug7hkWaW+EluUensbqjZGng/2n9hC1Uf0p1VuVUOSDNXtMqDVh2sQW0+LEwP5c2/ulxlHeJGm9VbnzHYVBvGDa3Yj7Sw==
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9)
 by OS9PR01MB13963.jpnprd01.prod.outlook.com (2603:1096:604:35f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 10:24:38 +0000
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928]) by TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 10:24:38 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
Thread-Topic: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
Thread-Index: 
 AQHcx8HiI3qwdGmfDki1IaVHCIMT77XWrA8AgAFtwlCAA3l0AIABBn+ggAARh4CAACSX4A==
Date: Mon, 13 Apr 2026 10:24:38 +0000
Message-ID: 
 <TYYPR01MB13419E63BE9F9622B267F7040DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
References: <20260409014036.1519-1-wangmy@fujitsu.com>
 <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
 <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com>
 <DHRA8X87GXTM.1KH04ZIZ4R6N1@bootlin.com>
 <TYYPR01MB134193382D763659A25739F43DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
 <DHRVKB1I9SSR.H8CA4RX6216U@bootlin.com>
In-Reply-To: <DHRVKB1I9SSR.H8CA4RX6216U@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9M2RhOTQwYmQtNjZlOC00MGU5LTg4OTgtM2VmYjRlMTg4?=
 =?utf-8?B?N2QyO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDQtMTNUMTA6MjQ6MjRaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13419:EE_|OS9PR01MB13963:EE_
x-ms-office365-filtering-correlation-id: 90a8e230-8974-40d3-3fc2-08de9946dde1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 So4Dp2w5fmy87bea8rGuKRwDgrlBH+on0roz/RRDvQiPDfCOUTkdZxfc/pvFQB/Ihb5bPvk78vI5I+oqzkWwseBZaFDiJoT6M7yzxkJ18i38vqgjQXwpM+6N+TCtABRdYgr4+9rM6M7qEuhBSyKsm+a7fnkNQjtLpJs488Ibe+JLOpuqeH49u7qAMEwLlbOl2PU/wiuKqx6gGjerPAojfgD1xFtNOKG6xDUWJKjRsOf4iztS9Xz9naQouaD5b+GHj3HY78mar35ULMYd73p+ELN6yO8buvHCXTFfA7OSM+KTqxzVnvbkS7l0MBClvwYK3LF5ajyP/Tj0M+oDxn+Co/O3P93k1wiBDBCrEW5O6rChCOb0RSbdYaX6snjWdp7HhFYpIOR50W5AkNmmb3g2Vkms8xNVu+WDD6uGxYtsxPHAl3TbUmtLwjRdDFayk5Qw8KVAtz1nh6YEzzIzJAU8giaae+EvXiWdYswgFKn5uPBnhPqorDFAv2aOhsz6EBUPGZrKmxVJJBX88aQW8KC3nPxFdBl2BCD983aaeCe4K4+FKRJnYlApeZJZ/fnVj4mqvvO1lT2iSzp3al35XHBOQhKA2NZi0Aihaqk8Yf5+/tOzeuinLbDTTlxzzGB5Cvohite0edr2hsc6KBxBN4FNV4MVp68GABuBlk9e02TMgNnOgkgDcBhajq/IoLtEhV/jbtdddTEHWurj/crEkoc8oDUODA6Wj4Ti5d7k0U1mJ2tkVgeLh4+wIHfXe3qmLMz8OQwBsYPc4YxPuz0t4jxGvA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13419.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MVhsTGMzM210SDRzdEE0eDdNSVJwL0VTQ01FMUtITDRpQzhxZ1ZaZVIzV0lm?=
 =?utf-8?B?S0lkZW1Sajc0UENoNWlycnFjYVFlQmxYbGNSV1AzQ1pNU0UxOCtxblpUTC8x?=
 =?utf-8?B?cHoyZURzb2RWNTNLUzBDV2p5QU9zREI1MGVxUVJKYWQrR3EyQlA4UnJ1SlMy?=
 =?utf-8?B?ZjdKUUlMS3pId0cvUDFMVndSUTVmd3RTaDVEUk1sZWw5WTAwL3N6TlJvcS9U?=
 =?utf-8?B?RG9XSUlZVHdKRVNXbHRUODR2RHdNZ2xRdTJxajBBY3hhWDVNNmY4ZitGUnhY?=
 =?utf-8?B?alZzeUJMR0pPWVZCQWxrWHlSeXhPaFlKZFNXeHRWUDlRdVlZaDYzcXBTZnlD?=
 =?utf-8?B?dERSOEFQRW5kczZRbGhGSDNkTEZ4UjJvRUNuV1NuUENwbjlHRkNQUlZiNk13?=
 =?utf-8?B?ZG4wNURlZGVTN0dNamhySWhsZGd1N092SGN3dnhlUjU1eU91WmVrZ3AyeWpm?=
 =?utf-8?B?RkROSXZMVG90cDAyc2d4ZWFLUHRPQ2gxdE80Q1FvL1kzRm1lVVNIam9ITTRW?=
 =?utf-8?B?TUVaeituYmZYZjZ3QVFOUEd3N0FEdEM4b08vanhRSTdiS3FaTERUUXhOTWpD?=
 =?utf-8?B?d2pOUUd0elJRTEtYN21WTmcyQldVekVpTmc1Ni8wRUx0NkRITm1WMGZJMFcv?=
 =?utf-8?B?S1VoM09mWFBOOERjbm5HaFpGbnh5ZDltWEpjSTJwYXorcWlWOGF5dFgzNWFz?=
 =?utf-8?B?L082SEthMnI2S3gzbHhoelk4cFYzeDVnNU1aSTZGaVEzdmRFbDh4NHg5UG9u?=
 =?utf-8?B?WERXc2p4REs1SVU4UzRxR1dWVW1jb3Z6NGlKTHFLOTYrRWQ3bUhGS3JpL1dt?=
 =?utf-8?B?dnlzZFEwTFVjeWF2NXRocFhYMjBrWXVRT1J0QTkyQ25MdVpCc0lRUzVuK0xs?=
 =?utf-8?B?SHN6c3gwdUx4TkRJc0xnWStCVUhFVVFNcW1RZGpmL1hMRktIUklOdlo2OHJI?=
 =?utf-8?B?MlFRT3I4U1hqNmo2U0hjenJnYUw5d0UxVDA0M2ZKd2tlaTFleGdrTEhVRjl4?=
 =?utf-8?B?clRtUHM4TjEzb3VwSzl6aFBEUEV4alZQcE9WNExrYjVmNjlnYkRFcSt0ejlo?=
 =?utf-8?B?NlJ3S3hVMFFsWE56ZDdaVml1ZGhPaUZ6SHRBa09lS0x0SFUvKzV6WjZtR1Zv?=
 =?utf-8?B?RXUzZlpVK2N4aDA0Qy9jVDBIVnFKZVgrdUdGb0E3SUlMYmRRQ2t1WVdWMDVa?=
 =?utf-8?B?OWJjRzgvSnJHS2syeFBISy85dUpiTGh1TmZhNUVxTW5KVC8zS04zdVc5TmFl?=
 =?utf-8?B?Wm9XZXV4cG5uMlJvbkFjbFZEWXFFc2kxUDB6ODIzeVJ2UytjclJPTnJVYk9u?=
 =?utf-8?B?TEZwNDdXM1REd1ZTT29aS3d4UVZ6czQwRkM2NzZISFVjS1VheDAyUDBVUmJq?=
 =?utf-8?B?Z0RSZ2NOeS8xb2txV2JhS3JhUTk1dnR0RlN3MjdHMktMaGswZ0pJTC81bUJG?=
 =?utf-8?B?N2I3REJMcFpqTUpwZ2l4UGM1SUNUZ0ZSVWZDS0FjT29pQ05qTG1DKzlzLzA0?=
 =?utf-8?B?cWVGakVLSzFkTDFZZDhHNDRtdjVJZ0hVYXdYbWIwWnRCT3hKYldxSFBNWk5G?=
 =?utf-8?B?aHVuREZzakNkT1pCaTlSYWpJWXBKRFBtUjQxYWhtY0lwY3Y0bkFCSXp0dU5G?=
 =?utf-8?B?bk5uN0hSeHlKNUpOaUJFSm1MUFQrcWFZc3dGY1JYWkpib2RqZERIemljUzAv?=
 =?utf-8?B?N1BraWgvQ3JjWTlJK1JQU1RDRmRqN3lHcDZxMTEzZmY4U1prMmlUQVV6Qkpp?=
 =?utf-8?B?R2pQc3ZIdmlOVDdYT2xCZUFOM3gwVS9JQnMzRTJMSGxhU3A5Tkx2WUJzOVJG?=
 =?utf-8?B?UnYzL2hxUTdwMjl0dzYraU01QVBWRmJmK0FZV1Uramk4VTk3OWkrYmpWaTBC?=
 =?utf-8?B?RGdaNFdjU05SaXYzMFdReGdWYklaYm5neVBFdFp3YzdkKzU4OWZabTlOZkQ2?=
 =?utf-8?B?dmJEVGhkUXIzRi81Rm4vRlN0Q1ExRklWMjFkNjVoNG1HQnI1azY1T1NYNEU3?=
 =?utf-8?B?US9QODNxU2xBbUZ1ckFZWW8ya3JxbUdDMzJoemtsK2ZDaXVnMlEvcWUxOGNG?=
 =?utf-8?B?VG1DaGlZODViY2dXa0Y0SmxFWmU5ZllLSWdnNVlUYkpZYWViUGtiR1dtc2Zv?=
 =?utf-8?B?Y1d5WU14MFkvUk1YZndyczJnQmw4QzRSMExmZlFSRFUvUU1XYVpJTStTNHJK?=
 =?utf-8?B?OSttYnJOQXlvSXpacWhDZjlIODZ1TElEb2o1VzcwdnpzcnM4ZTYrVDhXUzI1?=
 =?utf-8?B?RVNXb3lIVmk0MUxBQkxmZmdMTCtHOXZMdzlNWG11VkZUWkFqY3NYN015YWNx?=
 =?utf-8?Q?dxoXUKL8wvAaPtTwgW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	su3ViA2mmjnUzi980FbmZbhB0Ifq2yze3WDv5A/WoAOEmML5KDF540o6L1BW9Q9XCTPChX1uyLo+mLUx1Dc15+AwDm0NOFyhZdJCMDHyNdn5XaALtJsu3ofHkfbQHKbh+dG3PxLaRZdGR/4VIrCRjnXH7pRRYhALqwLJu7ijOxVHeUtQQGWfbUbU+LB3cj9CXorxMuGupKwEBkt43RXYzJ4gwDdPlZ8EgCXZuGgdxFZJwnAekkuBtfVVvXAQu9zPb1oL258cKE2mYGpbUL+aM0Uf+cJlNk2EvoeZZ/1wloD9cNLQ4r4dv60dtNnxaKIl+vfYjQMAB3kmD3g4Mb7uJg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13419.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a8e230-8974-40d3-3fc2-08de9946dde1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 10:24:38.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0fB9unbfp2yQShGrcv6q1ojDygmVyultgyVMLC730gvJJKJ77MDHK6SfctVOPWMeBjJyXXWu62eZA0EKtbqfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235095

VW5kZXJzdG9vZC4gQ2FuIEkgYWRkIFBSID0gInIxIiB0byB0aGUgYmIgZmlsZT8gSSB3aWxsIHJl
bW92ZSB0aGlzIGxpbmUgZHVyaW5nIHRoZSBuZXh0IHZlcnNpb24gdXBncmFkZS4NCg0KICAtLQ0K
QmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9H
WSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENo
aW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiAr
ODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5k
dWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDEzLCAyMDI2
IDQ6MTMgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5j
b20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIFtPRS1jb3JlXSBbUEFUQ0ggdjJdIGx0dG5nLXRvb2xzOiB1cGdyYWRl
IDIuMTQuMSAtPiAyLjE1LjANCj4gDQo+IE9uIE1vbiBBcHIgMTMsIDIwMjYgYXQgOToxMyBBTSBD
RVNULCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4gVGhh
bmsgeW91IGZvciBydW5uaW5nIHRoZSB0ZXN0cy4gSG93ZXZlciwgbG9va2luZyBhdCB0aGUgYnVp
bGQgbG9nIGZvciBidWlsZA0KPiAjMzQ3MSwgSSBub3RpY2VkIHRoYXQgdGhlIHNzdGF0ZSBzdW1t
YXJ5IHNob3dzOg0KPiA+DQo+ID4gICBTc3RhdGUgc3VtbWFyeTogV2FudGVkIDUgTG9jYWwgNSBN
aXJyb3JzIDAgTWlzc2VkIDAgQ3VycmVudCA0NDANCj4gPg0KPiA+IFRoaXMgaW5kaWNhdGVzIHRo
YXQgb25seSA1IHRhc2tzIHdlcmUgYWN0dWFsbHkgcmVidWlsdCwgYW5kIGx0dG5nLXVzdCB3YXMg
bW9zdA0KPiBsaWtlbHkgc2VydmVkIGZyb20gdGhlIHNzdGF0ZSBjYWNoZSByYXRoZXIgdGhhbiBy
ZWJ1aWx0IHdpdGggdGhlIHBhdGNoIGFwcGxpZWQuDQo+IFRoZSBmYWlsdXJlIG91dHB1dCBpcyBh
bHNvIGlkZW50aWNhbCB0byBidWlsZCAjMzQ1MCAoYmVmb3JlIHRoZSBwYXRjaCksIHdoaWNoDQo+
IGZ1cnRoZXIgY29uZmlybXMgdGhhdCB0aGUgdXBkYXRlZCBsdHRuZy11c3QgcGFja2FnZSB3YXMg
bm90IHVzZWQgZHVyaW5nDQo+IHRlc3RpbmcuDQo+ID4NCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGlu
dmFsaWRhdGUgdGhlIGx0dG5nLXVzdCBzc3RhdGUgY2FjaGUgYW5kIHRyaWdnZXIgYSBjbGVhbg0K
PiByZWJ1aWxkIGJlZm9yZSByZS1ydW5uaW5nIHRoZSBwdGVzdCBpbWFnZT8gSSBiZWxpZXZlIHRo
ZSBwYXRjaCBpcyBjb3JyZWN0IGFuZCB0aGUNCj4gdGVzdCBzaG91bGQgcGFzcyBvbmNlIGx0dG5n
LXVzdCBpcyByZWJ1aWx0IGZyb20gc2NyYXRjaC4NCj4gPg0KPiA+IFRoZXNlIHB0ZXN0cyBhbGwg
cGFzcyBpbiBteSBxZW11YXJtNjQgYW5kIHFlbXV4ODYtNjQgZW52aXJvbm1lbnRzLg0KPiA+DQo+
ID4gVGhhbmtzLA0KPiA+DQo+IA0KPiBIaSBXYW5nLA0KPiANCj4gTm8gc29ycnksIEkgY2FuJ3Qg
ZG8gdGhhdCBvbiB0aGUgYXV0b2J1aWxkZXIuIElmIHdlIG5lZWQgdG8gaW52YWxpZGF0ZSB0aGUg
Y2FjaGUsDQo+IHdlIHdpbGwgcHJvYmFibHkgaGF2ZSB0byBpbmNyZWFzZSB0aGUgUFIgdmFsdWUg
b2YgdGhlIHJlY2lwZS4NCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4gTWF0
aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

