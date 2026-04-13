Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA04EBFD08
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:13:49 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266739.1776064418710260247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 00:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=jbcn8LSJ;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.65, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn/5R/tQ/jFmoDB246fiovZtY3lBpCgKXxzsLzqfdkwHLq4kRoMO4lxt5HO50NELHWxQjiryernCSuKlxV2z6yrcSsFHEcye78Mz5E/CgA3+oulkP5UnLkqwwZ2c4e+n+NhKeVL2wYJ4DFhuH4hm8YyFeVWpbL8DOS3n4X8dmrVuPoUpPM9BIJCeeC4vYCjYb3fWkXCTLuAXQF6qeBsBgKPLFxcwvInxzckDrdHIMbR6/4gBRpfXWBJb80I2uNc3UhoewpCC1/AFi0SbXeI1/EAzh16cqV8iaq+FQ+5H91lgBeMrkSxEjYh8PrN5z++Zf73fDru9uG6A5xhtvb3S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBojHrhG8UgCWoDNOsuyVPN+Uz/zMJHAEdcHKUN/HL0=;
 b=VrxcsKifgBoGx34Avp6061XUTzzp4AkUz1X9pZabyRA+2bWcLmsX5vq16F8TRXWPaKzdpebVG7eEhRHcO6SBYhVNwkOu+EBsUkRfewl4dOp9feYf/j095q6P4Rf8TP6Vu/rFbMQ4tu2sx62zEsM0grCY05YwQuTCJAapEbOOMA9d6x4y6o4Nk6q/Wvf6UMQ8wOImCwuLtsubtfrG0HDbOMScZg9Anj6/dG9qdi1DKVVYWtBmdofRvwVMQqQbXJqxmcLj7mExOQRerm3InwH5AGgpe/uv9aP5+jwEYRi98/N/TAcuvry4+hAYE3eiqfGbYm44zXLRp1cBalQR7bFXKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBojHrhG8UgCWoDNOsuyVPN+Uz/zMJHAEdcHKUN/HL0=;
 b=jbcn8LSJOfEz2d8eeCC45QuwpywNCE+FGlOYxgWpcK3QZzIqlyep9I8sNJb2FdpnzQvD+p/OTkl8KHTIrGOaB+MdlfPJyrZlrfkP/Aq263DKp2noqauuw/05+edmBwIFQylrDl8gSVhB26HvywqJX3CD7nFX9xJn38I37kAJJ+tDZq5vBaTx31M8QEiE6wsULMtYMe20qUOwy4GjOGD6Y1UU8iAT2pLj3diZJYTD877n+6aXqM5QZjq8jX7u+6jlIxSMULPf+w2yGigOKDgZd9jqOHQQeeISTRGRigbn7/ChXshgMfHTISsxxxUZY4pkurrhNlJcEuVc18RV5NIrpA==
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9)
 by TYWPR01MB10424.jpnprd01.prod.outlook.com (2603:1096:400:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 07:13:34 +0000
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928]) by TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 07:13:34 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
Thread-Topic: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
Thread-Index: AQHcx8HiI3qwdGmfDki1IaVHCIMT77XWrA8AgAFtwlCAA3l0AIABBn+g
Date: Mon, 13 Apr 2026 07:13:33 +0000
Message-ID: 
 <TYYPR01MB134193382D763659A25739F43DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
References: <20260409014036.1519-1-wangmy@fujitsu.com>
 <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
 <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com>
 <DHRA8X87GXTM.1KH04ZIZ4R6N1@bootlin.com>
In-Reply-To: <DHRA8X87GXTM.1KH04ZIZ4R6N1@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=54e55372-1199-45d6-a1a8-01600a2d41d2;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-04-13T07:10:42Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13419:EE_|TYWPR01MB10424:EE_
x-ms-office365-filtering-correlation-id: 21415a7c-4289-46b9-0ef2-08de992c2c52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003|1580799027;
x-microsoft-antispam-message-info: 
 NyDMkuONtPOiAMDpF025K4KFESS3eNSjWv3CaQB9gO5RdcHOYT/KC+Z1SX2156QvnBg1oe8iymAHQU7lCiSdivuHHuG/+lz8p6qy5RZyjcJdb9o2SQBR43BzcOQd4DZc6b7gH4/F8gDSGV+DmtRhikU8eOi/ZP2FSbf3MSxy2RYz4vLyPi++DJYnekyeAmGABNvEiOyiQ7y0I7eTvDdVuXJwC4/4hMzeaEf8iU0Xb9Dmf/d0rPEF16nGPMa9U0AsE5WD/XvPSTtPRqAZ1kfFLl94zHzVhHqiPT8N5pLAM1IAu3m7d42bvYwP15LeeFIn6BNTh+d3kqWGoYsGAUq7ZcOdT73roQepowPUwoc//NwDrjxrTQpcool2hAftnqb48qlxaDOcQTFzQR2q2lbTliOt57YLE4xFFpqhWf51MHfvfDWdJlaE09aEArJaxb9Sl26pFvJANHLUw4mMtSTfNIo3xmRHEb6bCe7uYHNkUfNJsVDgjrcnzL/M7xCFtzP4rzGHutlJ2pQVe0+yontZvonnePR+hK5vvBN4MWMcfaSojCuIbiYHq4iq1McukNeFQo0YeDlBVu81JgQvhP/IXpmn38lAd2V2I9za+VGmekO81aHh//2KcSVpbCzQvsKRek+uzBRSx+hoWhHgdLoelyysrXpR8FLfmCggxuD6F41vHe0C3XW3MfM8+JKwZ1yq0nYfltstliTevjGNXO1qXK+NI8y7gPWL/9vBKiENcCAPrypvYl3Jhd6KSgTh6s/Hwtkr2WIMWtO2jZbfyj7ahA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13419.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?VWNtOGZEaDNGWGNUVkswb2cxbmxNWTN5c3E1Vlh4S1FmbDRqSnhQN05EdlYr?=
 =?gb2312?B?L28ybnNuNllZMFEvdkljdWZRUmhWU3hkS1BxeW40MzViemloWHBLeDIxaURX?=
 =?gb2312?B?dGt3UjR0VXQ0SlE0Tkl4ZE9iNXNWd0JXaGFQZHZTUjBEc2ZaVlJmRVFnNTRZ?=
 =?gb2312?B?aURFdGozWHh5R0FnME1QQjRCdHYxSUN2aEQ3bXd5VTN5dC9wM3N6TCtrV1FR?=
 =?gb2312?B?K1JVYVJPRlV0T2dUUHR2cHJSZ2JLYVJKZE9RYlBoazUyMlVYQVZqMi9oOUNZ?=
 =?gb2312?B?c08wZzJvclZOREpoZVVlOVZLbS8vTmFIQVBDTWtkTGRBNUVTUEQyc2FUaldO?=
 =?gb2312?B?aXV6UDErYzNzRGlJQTlvUWU1SkVBa2Y3eThYanFWTjNRblhDQVRkOC9TRG9z?=
 =?gb2312?B?SEVEWTFnVTUzRmhuUlFqYnd1cGtWYjBoS2NGclloMjdibVhMbXRyTjJrUE1T?=
 =?gb2312?B?bFZReHdxMmdHQW8yNHJDblZuM3FzK0tlZjgzdDNQR25tMG5zdDUxSzhjU3lR?=
 =?gb2312?B?VXkwa0xxM1JxTDRuYkdDd0VvWXQ1M2VUbVovQmR4TWV2Qldrdkg4YzEvWkRJ?=
 =?gb2312?B?OHJDaUpFb1MvcVNQcTBCdGREd1JxNGl4MldCZTBxY2l5eldBOWhva0pteG9E?=
 =?gb2312?B?SWhadlJkbXVCWnVpQ0pRWEdQVjRNM2krZEh1a25lRjZNVHBwVFNiVS8vSFlx?=
 =?gb2312?B?eVlqdlUwOHJyZWhHcUtaeDA3V2djcFloNzBVQ1lrbWxTS1NuV2RIT050Rys3?=
 =?gb2312?B?Z3VmTE9zU1ZRejRmU3M5OGhPa21MYjh1UExXSXZsKzU5R1lPSEppaCswT2Fa?=
 =?gb2312?B?LzdJZkZwY1dmYkdTdkNKMjFiVkxKTWs0RVpPZUxTdEhzaDBJSDNYbVJQSHdh?=
 =?gb2312?B?ZEY1ejFyU3U1SngxYzVUckZGZG93U2xMTmQ0UW5yVXUzL01JSHlTK1NvSHJ3?=
 =?gb2312?B?SU80YzYzN2NMTzFOd2VObU14cFBoRXZZWGliTjNLZ0wyVmM5YWc3RStKOFlo?=
 =?gb2312?B?TzVZWkNIcFF6VXh4TlI4QU8reDVwRERYZ2xhbjV1OTJGb2diMTlFbjVlby9l?=
 =?gb2312?B?SzBTcEVMaEpuM3BOQXZyQzNZNGZrVS9YTlp0OUJwcHg0NGhYQzdjMjRFWS94?=
 =?gb2312?B?aWpXdFo1M2RoandvbXF1enEwVi9iS05mcEVMYmpkS2hSYmZhV0FtL3hzN2JF?=
 =?gb2312?B?WVFiS0NpOXZZemZPSnFmU1lJRXppTXBtZVNPOHZEWmJJbXJEaFpxYkIzOGRP?=
 =?gb2312?B?WkpMTFVzb1Jwd2dwQ2NrR1B2aGd1L0tlTjdyeGphZlplaUR4RzRGRGY1cnQr?=
 =?gb2312?B?SUJwY00rdys3M2xmZ3Y4UWh4NEdmMStGV3VBTytNY3k1WlNORTlkTHhWQ0t6?=
 =?gb2312?B?R3N1VkgyZlF3S29aMmU3NGxEdkFrSmZWR1pZVk1nZWxRZndpSEVvZHd2WjNn?=
 =?gb2312?B?V0ZJYkJkRHQ1aC9QcFlKQlVsRG1CWXgxLzJEVzZiWE1aTCtJSC9LNWRlTlRT?=
 =?gb2312?B?cDJ4VUF3ZHIveXMyeTRxL3RKQjl5T3hsY0NuMkFUQXRUMTRERnFIVUh4QlFr?=
 =?gb2312?B?cUNzV0tjVysrem4zSHRlSDl4eE5XQm45Ti9ZZklVVVo0aThmRjBaenFtNGFZ?=
 =?gb2312?B?RW00WnZ6djlWdS8yY1VnOFFqVXAxTjZCc0JJNHdza0FybU9yb3VaSWllZ1RJ?=
 =?gb2312?B?L0RwS1JCYUNLVWx5U3lPUEJtWURzT3BGVDBRdUhlWVh4b0paSXJuL1dkRWth?=
 =?gb2312?B?OVBTazJra1BybUxoUmEySzhWUUZLMlNaTGRucFp6S1VSVW5WMkdXbmRXTS9Y?=
 =?gb2312?B?cmZKQXNhUlFpeXg3blRlcGxCWkwrSUFaOUdYSVVUc3p1TnB2RVVwSzJhNENw?=
 =?gb2312?B?WU9kOXJYL0hOQzZDTnFvRHV1VW0wblJuRkl3Q1o4a0ZMZXpUaVNQYnQwTktN?=
 =?gb2312?B?YkVZbWEyOEFaUWdWMHhUTXlKc3VEaE1VMkF6SUZteWE2Si9kZnM4c0tCcE5k?=
 =?gb2312?B?dkh0Z1YyMnUwdk52MldFcERybEpzUCtjOGtvdVpDVitwSi9NTXNrM3dGeVlu?=
 =?gb2312?B?NGo4MGFKUW4vV0FiUzM0UzZpa1FiK1BYSkNTa1JxS3N0OVhjT0szNU96YWlX?=
 =?gb2312?B?ZWJ2RXE1Z25qdHMvWXNGeVVjMExacXQweDNYaE51cnltM2M2em9mTzJnUExT?=
 =?gb2312?B?NUxRMklJcHlGU2dqSnBCZldSM2FCdit4djUrdDVlMEVOdXBSNmkrOTg5RjZl?=
 =?gb2312?B?NTA1V0NkUjRwODRsQVRtSFBzakVoTnVGR1pzWTNKaDhBSW5ONVVOcGl4eWZF?=
 =?gb2312?Q?HqoduFpSBusTOsNzmJ?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	MbnIdtVCktsTIDj4pGhTwgwFjHIE6bgZkgHFF9kLp0n8jgDb8+USKEpmzmdbwHcP68SMMDlxDKyarITEFRZW/5DA1Fdx68DtgaPnsKJXbxdZrjzZvNhhZGmDOBGh9Edu/qx23NP7g5gSZHReBYnb4DJ4y8dUxj7gF2k/GspnsnFG9yA5wiBqBDMoDe0QSUwph3zwF/mhZulgnRHhxHWkzpeU5bOpFVXYm4yCy112lsyIxZ8gfl2v6QnSCnk5Zfq/VQ/DI0BKJcDCreUxDooCnOThUeZlE1IId5/PIi3bd+epfLGw9+gg8Z81YJK3NSMJJntR0cJeRZL1JfqLfTovpg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13419.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21415a7c-4289-46b9-0ef2-08de992c2c52
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 07:13:33.3971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lF0/dA+mjX7s+5WwuOf1U0RJ/rx5FlVGUXe9REa8HbhlG5lKxs/oQ5i+job9m0i2FYfS17VlI5an8JMb2Y3wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235088

VGhhbmsgeW91IGZvciBydW5uaW5nIHRoZSB0ZXN0cy4gSG93ZXZlciwgbG9va2luZyBhdCB0aGUg
YnVpbGQgbG9nIGZvciBidWlsZCAjMzQ3MSwgSSBub3RpY2VkIHRoYXQgdGhlIHNzdGF0ZSBzdW1t
YXJ5IHNob3dzOg0KDQogIFNzdGF0ZSBzdW1tYXJ5OiBXYW50ZWQgNSBMb2NhbCA1IE1pcnJvcnMg
MCBNaXNzZWQgMCBDdXJyZW50IDQ0MA0KDQpUaGlzIGluZGljYXRlcyB0aGF0IG9ubHkgNSB0YXNr
cyB3ZXJlIGFjdHVhbGx5IHJlYnVpbHQsIGFuZCBsdHRuZy11c3Qgd2FzIG1vc3QgbGlrZWx5IHNl
cnZlZCBmcm9tIHRoZSBzc3RhdGUgY2FjaGUgcmF0aGVyIHRoYW4gcmVidWlsdCB3aXRoIHRoZSBw
YXRjaCBhcHBsaWVkLiBUaGUgZmFpbHVyZSBvdXRwdXQgaXMgYWxzbyBpZGVudGljYWwgdG8gYnVp
bGQgIzM0NTAgKGJlZm9yZSB0aGUgcGF0Y2gpLCB3aGljaCBmdXJ0aGVyIGNvbmZpcm1zIHRoYXQg
dGhlIHVwZGF0ZWQgbHR0bmctdXN0IHBhY2thZ2Ugd2FzIG5vdCB1c2VkIGR1cmluZyB0ZXN0aW5n
Lg0KDQpDb3VsZCB5b3UgcGxlYXNlIGludmFsaWRhdGUgdGhlIGx0dG5nLXVzdCBzc3RhdGUgY2Fj
aGUgYW5kIHRyaWdnZXIgYSBjbGVhbiByZWJ1aWxkIGJlZm9yZSByZS1ydW5uaW5nIHRoZSBwdGVz
dCBpbWFnZT8gSSBiZWxpZXZlIHRoZSBwYXRjaCBpcyBjb3JyZWN0IGFuZCB0aGUgdGVzdCBzaG91
bGQgcGFzcyBvbmNlIGx0dG5nLXVzdCBpcyByZWJ1aWx0IGZyb20gc2NyYXRjaC4NCg0KVGhlc2Ug
cHRlc3RzIGFsbCBwYXNzIGluIG15IHFlbXVhcm02NCBhbmQgcWVtdXg4Ni02NCBlbnZpcm9ubWVu
dHMuDQoNClRoYW5rcywNCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5B
TkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBS
b2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUyjuis4NisyNS04NjYzMDU2Ni0tODU2OA0K
Q09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0
c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBE
dWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6
IFN1bmRheSwgQXByaWwgMTIsIDIwMjYgMTE6MzEgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/N9SDD
+eikIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtPRS1jb3JlXSBbUEFUQ0ggdjJd
IGx0dG5nLXRvb2xzOiB1cGdyYWRlIDIuMTQuMSAtPiAyLjE1LjANCj4gDQo+IE9uIEZyaSBBcHIg
MTAsIDIwMjYgYXQgMTI6MjggUE0gQ0VTVCwgTWluZ3l1IFdhbmcgKEZ1aml0c3UpIHdyb3RlOg0K
PiA+IEkgaGF2ZSBzZW50IGEgdjIgcGF0Y2ggb2YgbHR0bmctdXN0IHRvIGZpeCB0aGlzIHB0ZXN0
IGVycm9yLg0KPiANCj4gVGhhbmtzLCBidXQgSSBiZWxpZXZlIHRoZSBlcnJvcnMgYXJlIHN0aWxs
IHByZXNlbnQ6DQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFs
a3lyaWUvIy9idWlsZGVycy82MS9idWlsZHMvMzQ3MQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy83My9idWlsZHMvMzQ5NA0KPiANCj4g
QWxzbywgd2UgZ290IHNvbWUgcmVwcm9kdWNpYmlsaXR5IGVycm9yOg0KPiANCj4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzcvYnVpbGRz
LzM4MTMNCj4gaHR0cHM6Ly92YWxreXJpZS55b2N0by5pby9wdWIvcmVwcm8tZmFpbC9vZS1yZXBy
b2R1Y2libGUtMjAyNjA0MTItcWp1aW9sNjcvcGFjaw0KPiBhZ2VzL2RpZmYtaHRtbC8NCj4gDQo+
IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBC
b290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6
Ly9ib290bGluLmNvbQ0KDQo=

