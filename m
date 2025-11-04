Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3E1CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 10:25:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14549.1762251910731432389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 02:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=omxx7su8;
 spf=pass (domain: siemens.com, ip: 52.101.72.20, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD7slpgtQ8PHmyCW0K/HTqPj0GLrR8EohmtM+W6ePwZq0YPY593jSbMNWeUBbdilV6oQkCg0KXFgFcCXjOFUJcB5G4yV/OQheKXV0e5hAo/6jsqLMD7kqFkwvFwvYFV/sK/ayWxQPTlfeqLFH6uOENWcoJgUB0DnII0v6QoODmEBR77Vyf4RvKhh/uV6c4xxo/53NN9EP9aFRg1c6O55n4vY9yhFXiLqNiFbJeZHWYbudV09ppdcV4UPPoVp7VRE20WXpNMdIxZkCjLPN9qZsxHMX32n3T6ZvGbLjcIlLiGsp8G1PNSUwclE9Cl9M5SI3vFggLyRgOyFpiEPx2LZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLG5sbcmUn0R/QoE4ul5tbCqyXkN0e9xwy2txSDZlQc=;
 b=BxqefwSdI6Jybm5CtC2eM68uj5ZRGpErpf7Fm4A5k8oe6yZEFWMmTJa1mZE2Bqp6w21GiIeX/QKOnqLtZ1ON0Hcn9AvE6RadOVdD4vNsgQBIyY3keR9iOlf9U/dvTSUPmW6+3Hs5XOGsFpOUfQa+RfqYWTX9HtpiLABC0miLXkSOZWecJbv5xn6besIhSsG2VnWqPd/Z3Gc/bcZ4vUJCFr6MxmAwwIU9AIxzYtf+Jn7UXEjaJri+Zhrzg8wa3XdRC4MaBcSlZ7KN3PTIFf5ORcio7IRaG7nin8eq6S/3R6T06Ixbu4YYYpzqNyIGbl00YxpP9adl7PxOCAl5pFjh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLG5sbcmUn0R/QoE4ul5tbCqyXkN0e9xwy2txSDZlQc=;
 b=omxx7su8+vOOYiNVkTVavr03quM4EH5YfETAGchpsuv3aBgdo7La7rNygOO94psWURmWPwiIpgUdSldTHWnrHCMv/4lqkTrK3N6W02eFJmP7XNcdeyBddCCc5XHV5bPfP55yBR1dkt3quPwTuQUbWeDF6ziq+0sUiDJh4rtCeIX/QWLQcW7pvsMdmMLrJPzcqSjLSNGxLXRklH0y41igkXsLnmZPWLGgwN6R4ZX0OfthjSeX6I3Mkb5EfzVyJ4UCx/tgI1BQKg+iYGlPqzCHsDE5J4L0oCzFvGIf4WjqrvaN+T69hAUDeRqwD63/WUnnNV484uQaJaAxB9pkHtc65Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU4PR10MB8481.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 10:25:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 10:25:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: RE: [OE-core][PATCH] yocto-bsp/6.17: correct branch name
Thread-Topic: [OE-core][PATCH] yocto-bsp/6.17: correct branch name
Thread-Index: AQHcTV4DbOeR+bCUsUC52pDPZgNhRLTiTuiAgAAAnjA=
Date: Tue, 4 Nov 2025 10:25:06 +0000
Message-ID: 
 <AS1PR10MB569799E8CCB3D483EC6059CCFDC4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251104073805.8102-1-peter.marko@siemens.com>
 <23b497fd64dc5414580260ac676d7c05d45d953a.camel@pbarker.dev>
In-Reply-To: <23b497fd64dc5414580260ac676d7c05d45d953a.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=98c4b7d1-f9bd-4cdc-9738-9ae5e7b2b103;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-04T10:23:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU4PR10MB8481:EE_
x-ms-office365-filtering-correlation-id: 10b7b2c6-b776-4659-bebf-08de1b8c6ceb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bExFRW56Z1pqWmY4N2tYRG01S3ozcDludEJ2c2xzVHp1YWUzRjlVU1BhQjV0?=
 =?utf-8?B?N0ZxRHZsR29CYXdPYnJhZExrWkdlaXJiT0FYQ2pCTENkTXBDMHJsdGd4R2R5?=
 =?utf-8?B?cnQyYyt2M0RsR1NaU05OY2JzaUkxaU0xU1h2elNaQXdhZEJQcG9YZUVuOTZB?=
 =?utf-8?B?bW9vUFo1dTRRQlBPYTNjc1hNMFdJQnRxUEtISE8xQ2hTcXlZc20yL0xKdmow?=
 =?utf-8?B?V0h6MlB4UTNYczNXVzZLOEZYeGtqbldyUlBWSjBTK2NqM3BpK2RaejhJT3lJ?=
 =?utf-8?B?M1A3TG0xeGtIM2w5NVlrY2J4cVZRc0tvTjFIdVE1ZXNvM1RTd25SSWtud2ps?=
 =?utf-8?B?Y3E2NkNBM0o0L3hKUlgwazVvTmpOd29hZjFMRzRRbVVGL1lWZ1Q1ZTFTaUFT?=
 =?utf-8?B?Vm1KODdRM1ZWcEhYU1lWRCtCR21icEZBR29vVWFyQXVnYm5hNlBmWnpybWVF?=
 =?utf-8?B?TlZBR2NMK0ZxMzF1Um9HaUE5QXFOS3NKdnd6bG9MTkN5UDllLzBLT1ZjZnBl?=
 =?utf-8?B?RWQyZnpSYnZXbUhFejZPeGlXVkIzQkZNR1lpd015S2J5TEdJWEx5dEZYMXpa?=
 =?utf-8?B?ZzRycUlSNTVPNHdMd0ZPQVkyWVRvbHhmbmg1clMzRTVlVXhiNzRaR1FsMVFX?=
 =?utf-8?B?Q3RMQlB4S1dJRVk5L3BDMDhib2V5eWoyRnNpQXRncldnY1NKRkJveHVqMGxw?=
 =?utf-8?B?Rkd1QWNZQnV3VnRYQSswNmhSb25VcXZrVnMrc2d0NHMxRnZPdkNHZFNoeXk4?=
 =?utf-8?B?ZUZmQzZCdVpxQ2FYejRWZ3pWZkE0UHBMeFlLNVZ3UlhEQ3lONWlJVExySysv?=
 =?utf-8?B?ZUpWWERCc1BvMmZ5cGNNcUFFWGJjRkZRcHV5TjZ3Wm53ZURRb094MEtmZTkz?=
 =?utf-8?B?V2szYlBMU1h4K1pCVVVVSVQzYW9odnU1VHUrRHNxMXF5alRXclhiMWI2eXhZ?=
 =?utf-8?B?K2w0STNkMVhjSUFUSmo3NkpJeUZtNTFmNnhBMUhPUThpNTgyQ0c3WlN2N3ZM?=
 =?utf-8?B?d2F1TUFJOXV2YjkzWlk4L3FPbWhiNkV6a1lRNUpKc0R0WnM3Yis3VTFxdlFa?=
 =?utf-8?B?MHZBK09wbERpQWl2cjhMLzJaS0l0VkpCMFpFMEdCczZibUNIL3FNRzkxL01p?=
 =?utf-8?B?SEFucmVjYnErblY2c2pzaVRYRDdId0h4Yi9WVmsxMGY1NzBiL3JiYTE2eHVU?=
 =?utf-8?B?N0RUcG9OTjkvTWlPbDdNUlA2MXo4ZlJVMjl4S1NUR3JUSys1c25WTCsvRzJB?=
 =?utf-8?B?RUt2YVIrWVJ0ejhvcjNQRm5nL3RqcEhGdXlTOFFQZXBFZmtCWkRCYjhMOGNj?=
 =?utf-8?B?S0svK2p6dFdNWnNPMTJ4OUMrZ3lwdEYxeURCdmdWYXVCSi9RNE0yd1doeEZh?=
 =?utf-8?B?cWdxaHZlMjdwMDdMQVpzemw5Qlp5ZjZqcXo3NkRTaVozc3crTy9BbHk2WFdo?=
 =?utf-8?B?OW9BTk50cDNJQ1I0cjJrbFJwNFdUV0lETCttYmdQMXBKWHJCekJZQW5MWnF3?=
 =?utf-8?B?ZzlhanZ0ZU5IejlOeFd2dGFPeHQ0cTh6WWsrc1d0SXYwQTRZeXVTdm9WZFRV?=
 =?utf-8?B?dTFtVDVSa2NxUzFXSG9NYkJIeDREYklqeDlDNjFLQlBGMDVLdWg5U1V4aUs5?=
 =?utf-8?B?N09RUG82d3JTQ0E0SXpOOUJxek5SYXplZWEyMndGU3R0am9MOVhUZEQ2NW5J?=
 =?utf-8?B?NFdBV0hDU2pLZXkzSzlLbGgvQWxENjQ1RVpkOXFhVVVBbDRHUlUvQjFQa2ZH?=
 =?utf-8?B?L3Z0d0IwSTZhT0xCN1lVQUhMcU50dXlidlFNcDNLSG1jS1JBSWc2bFhMYzBs?=
 =?utf-8?B?N0JHZVBDRFM5UEswQlJJaXFzdVl3RmpMZ2FhUlV6YlM3T3lKZkIvbFgzaTVl?=
 =?utf-8?B?RmhSeVNOUmd6WUxCZHBlcGhTK0UyN2ltVXR6YTUvck9OajdITms0eFVxWWha?=
 =?utf-8?B?SEJOejdiakFjUWZuTUZpcyswVDdQSktBUktXTUdEM3l3ZVJqR3VzTDIyQkZW?=
 =?utf-8?B?WG1lcEhlNSt0VDMzbi9uSFFoMkFXK0tKeGtSNEJFV3VrSU5pZEpremJuVFRD?=
 =?utf-8?Q?N06vrL?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2NBSXpmSlh1ak1IVXA5STZtdzF5cXd2cFRDYjQvdHBJajdaY3p3WFJTYmVk?=
 =?utf-8?B?cmo0ODVLVHVxRGRMbUhkbVpxOE05cDAwRk01YVFLN2lJN0cxb1IyWWJUSGFu?=
 =?utf-8?B?R212N0oxYjNBNmMrMkVoWVJDU1AycWtLZlp3dHFnRnVWWDdmWURSR2xySWxm?=
 =?utf-8?B?a21DN3RjTlVGdERaZFd4eGFINFNXeThueDlVclc3SXcvVWMzZE8xZGhmZG9u?=
 =?utf-8?B?dnJBMUpnNHdSM3pnMllMUy9DRTFkcGZMQjdPaE1zSnhzbkVQc28wZUpSNVVO?=
 =?utf-8?B?d1JQSUpOSmM5Q25NT253dSt2VHY2K0lLZ1ptK3pCbXRQV0c2R1l4TUVxVmdz?=
 =?utf-8?B?S25pTDdlYjdqRmRJKzUvaFAvMmFBZXEwNDN1dWZDR1FBVmoxU2hGWm1FZk5B?=
 =?utf-8?B?SVRDT1IrNDduZUVFZkN5SzRhazlEMmgvMVRrSmRyVGU3Q2hPOGxCN3JoZjlF?=
 =?utf-8?B?cFd2TkhNNlhmSUkrN1RuWFRtd0lpd3RHYWJ5c3dPaDlLbFBKYnNNejlXK3F6?=
 =?utf-8?B?RllGTjJRRHpxbVYyL3dzTmRQNmtXcEJDYjZxM0dxQTZ2ZEN4NS9CZXh6VWxj?=
 =?utf-8?B?VzF4STE0b1lzMDJyZnpGdkFwelR2ei9KcmNGTnhlcjdmYXZXMFpBMG5WUXBD?=
 =?utf-8?B?YXlzY2NvaUNBUVYvM1ZqTEhzbEQ2TlJ4bWpBYktRcVdIcE8zVG5EU002RUJV?=
 =?utf-8?B?cFFrRFpvNjhCQ3pxVVhWM1pya0cwcVRtUlptQmFWa1lrZGVva1MvN2RCY0Jh?=
 =?utf-8?B?WEIzTTZzb1BnUzRMWHZJbXhNVG1nYTBhQThCQm1ZVFY1N0hwZjBFSFJ5b09i?=
 =?utf-8?B?d29obklCODNyc1J3UmpRTkNLbzlDazdXdU02UTFYVUdTL3FQQXlLZkxuT0g4?=
 =?utf-8?B?Q01VZXhzMkpLbjNFN3FRMnlYWTRPbFBsd09TeVVRbmhkbDlBUW04TU54R28v?=
 =?utf-8?B?WHc2WWtycjRabjNzbWlLNUo5eGZEdXFXQndOQmdib2pBeHY4Q251NEdSL2Ix?=
 =?utf-8?B?SXU3S0RFSmU1d0VhVUZSb1JNY25WL2hLNmZVWFJaNUEzVVBhNkw2OEhhQ1M2?=
 =?utf-8?B?bkNpZ3NxVXlKVzZ1K2oyZE5WaVhuNDZLZDAwamFydzB4WVN6Z1M3ZUNBN3B0?=
 =?utf-8?B?cUNMaFpoVFBJT09IaW50dFFFZmJEbFBZVitkMTk3RVRiaWlwZDdZUGxIYnk5?=
 =?utf-8?B?Vmh0Si9qakVDYkoxcVhHQ200TCtybGFrREdMRldpQ2V2Z3FhRjlzOVFnZDRD?=
 =?utf-8?B?RlFqcklPSWxqQzZQSG1RZ2E0K3l4aU5lSzZHZ0xkWTdlQVlKbHU4d1kyZFZJ?=
 =?utf-8?B?T1h3TkRrbHBoa0RodXdrcU9Zb3Jqa2ZHR1NCS3VCT3ZVZnhKNlNUZUthblNH?=
 =?utf-8?B?aVMwSVhEWFR0TS8vbjNzc2NBN0JwNmx4SkFrWm5RQzdrZG9xOW9RNWJIWnJ5?=
 =?utf-8?B?czRjdVhkNG9ycEpMdkE0dVZJajhmNG9XRXNjcnpqZkZHYXNXeTJCd1VkdDhG?=
 =?utf-8?B?Y1pjWFllcGg5OVBwVWxoMFJkU0RtTXFCNFVYUEN4c0xUU3UzdTdsWHhoemxz?=
 =?utf-8?B?dWtFdXR6ZFRDaVNzMXo0a2ZmOGxuczFhODJYVytHMWZaQVl0VS9BMEpTbVhV?=
 =?utf-8?B?RWh5STJ4SGpBdXN4RTJqakNNSlRPNk0yTmI1WXBGV3V1SExwdlN5OSszbjha?=
 =?utf-8?B?aG5GZDh1dTZSTkFrZ2R2YnN6cXI4OUZrWmJrZGZaeVR4K0VuaGZpTnhKaks0?=
 =?utf-8?B?dlNsQUlHbGN3QjlTaUhFazF0NnN3bWMzUFpmbnVabjZBLzkrZHlsRXI5ZEph?=
 =?utf-8?B?bVcxeDl6bTBIMUF5bEJYczFoOFc1S2txWDAvR1E2R2R5QSsxUk8rNHArVmgz?=
 =?utf-8?B?S2pxZUVqTVFJZ05zM3FVc2ZIbXpvTDRTaXkvaTN3SFNPS2gwN2d3ZFRnZm9K?=
 =?utf-8?B?ODhNQ0dSMnFMT2pMVmZFWVNIZk9mV29TclB2L1NUYklzWUwvdnN3MHoydkd0?=
 =?utf-8?B?SlFiYS9ONzhoZmtBQ0E0TU4yeklDSHZEUTQzTDQ0blFBbXppa3pjZDVqYk1G?=
 =?utf-8?B?SUF4bENsWGxsUTVGbmFtQklzZW8veFJzTG8vTG1Hd3JXdzdGZWFtZ3dEL1FZ?=
 =?utf-8?Q?SpUuzCGPTF+BVVFAqWjZwC9F5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b7b2c6-b776-4659-bebf-08de1b8c6ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 10:25:06.9571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLz2qIDr2aKKpnAoQR4+LDhf0fFpW9MK79wxEuJEIWdOrKEK+rb/HeOXqcaEJF7Gu4ayIMICaEUJUcADSVDvsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8481
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 10:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225720

VGhhbmtzIGZvciB0aGUgbm90ZSwgSSdsbCByZXNlbmQuDQpJIGd1ZXNzIHRoZXNlIHdyb25nIHN1
Ym1pc3Npb25zIGVuZCB3aGVuIEkgd2lsbCBoYXZlIHRvIHN0b3AgdXNpbmcgcG9reSBjb21iby1s
YXllci4NCg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQ
YXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIg
NCwgMjAyNSAxMToyMg0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRl
ci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gQ2M6IEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHlvY3RvLWJzcC82LjE3OiBjb3JyZWN0
IGJyYW5jaCBuYW1lDQo+IA0KPiBPbiBUdWUsIDIwMjUtMTEtMDQgYXQgMDg6MzggKzAxMDAsIFBl
dGVyIE1hcmtvIHdyb3RlOg0KPiA+IDYuMTYgaW4gYnJhbmNoIG5hbWUgZm9yIDYuMTcga2VybmVs
IGRvZXMgbm90IGxvb2sgY29ycmVjdC4NCj4gPiAkIGdpdCBicmFuY2ggLXIgLS1jb250YWlucyA0
NTlmZGVhOTM5MTRmNGRiMDQwYmQ4ZWJmOGJjZTEzNGE0Y2Q2Mzg4DQo+ID4gICBsaW51eC15b2N0
by92Ni4xNy9zdGFuZGFyZC9nZW5lcmljYXJtNjQNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBl
dGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiBDYzogQnJ1Y2UgQXNoZmll
bGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS15b2N0by1i
c3AvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgteW9jdG9fNi4xNy5iYmFwcGVuZCB8IDIgKy0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS15b2N0by1ic3AvcmVjaXBlcy1rZXJuZWwvbGludXgvbGlu
dXgteW9jdG9fNi4xNy5iYmFwcGVuZA0KPiBiL21ldGEteW9jdG8tYnNwL3JlY2lwZXMta2VybmVs
L2xpbnV4L2xpbnV4LXlvY3RvXzYuMTcuYmJhcHBlbmQNCj4gPiBpbmRleCA1MWI2MWIxNTUyLi42
MDNhOTY3ZjJhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEteW9jdG8tYnNwL3JlY2lwZXMta2VybmVs
L2xpbnV4L2xpbnV4LXlvY3RvXzYuMTcuYmJhcHBlbmQNCj4gPiArKysgYi9tZXRhLXlvY3RvLWJz
cC9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC15b2N0b182LjE3LmJiYXBwZW5kDQo+ID4gQEAg
LTcsNSArNyw1IEBAIEtNQUNISU5FOmJlYWdsZWJvbmUteW9jdG8gPz0gImJlYWdsZWJvbmUiDQo+
ID4gIEtNQUNISU5FOmdlbmVyaWN4ODYgPz0gImNvbW1vbi1wYyINCj4gPiAgS01BQ0hJTkU6Z2Vu
ZXJpY3g4Ni02NCA/PSAiY29tbW9uLXBjLTY0Ig0KPiA+DQo+ID4gLUtCUkFOQ0g6Z2VuZXJpY2Fy
bTY0ID89ICJ2Ni4xNi9zdGFuZGFyZC9nZW5lcmljYXJtNjQiDQo+ID4gK0tCUkFOQ0g6Z2VuZXJp
Y2FybTY0ID89ICJ2Ni4xNy9zdGFuZGFyZC9nZW5lcmljYXJtNjQiDQo+ID4gIFNSQ1JFVl9tYWNo
aW5lOmdlbmVyaWNhcm02NCA/PQ0KPiAiNDU5ZmRlYTkzOTE0ZjRkYjA0MGJkOGViZjhiY2UxMzRh
NGNkNjM4OCINCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQ0KPiANCj4gQXMgdGhpcyBpcyBm
b3IgbWV0YS15b2N0by1ic3AsIGl0IHNob3VsZCBnbyB0byB0aGUgcG9reUBsaXN0cy55b2N0b3By
b2plY3Qub3JnDQo+IGxpc3QuIFNlZSB0aGUgbWV0YS15b2N0by1ic3AgUkVBRE1FIFsxXSBmb3Ig
bW9yZSBpbmZvLg0KPiANCj4gWzFdOiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEt
eW9jdG8vdHJlZS9tZXRhLXlvY3RvLQ0KPiBic3AvUkVBRE1FLmhhcmR3YXJlLm1kDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IA0KPiAtLQ0KPiBQYXVsIEJhcmtlcg0K

