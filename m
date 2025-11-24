Return-Path: <piotr.l.lewicki@hitachienergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A4DCFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 11:08:57 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14455.1763982527706679068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 03:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hitachienergy.com header.s=selector1 header.b=VhFvO7Gu;
 spf=pass (domain: hitachienergy.com, ip: 40.107.159.63, mailfrom: piotr.l.lewicki@hitachienergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMz53LIqc454FRR4BAJ3HYnpRFgmVB3O89I9t5lcuQsMUoxWCIZfzZ54jZXEMH9J3xqsfwvq70DJLkXlA1taWuS+HvhXH871flJgIRb9A6dQge+mQfTVTQdCEL/MiNMWFE9GoYAxL8frIqBMO8r01/AMZYogBBv94SCeur67CshUeVDBtnTUsi6gp9o+yQvEX5/ihuCBOce537S2K6pKdVFfUh74z34MihGarjoVgqASBF7YkmimlQnHkJxf0XG0RiViPDH33fO4sO0cPf4wJOsBxxPWPppLmRe8u4jLvkaTKiQQKUPhWG9Mhwg5+DKJHuWHG5pm8Y+dMXK7miiP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKOrl5DGimKEskIqbArzSwkYw6YMeKoTuLPrk7gvfc0=;
 b=chIq+eN0KtSDt3aB75LsBMTAZs2E3hAYMpHPFC2Z96x3j2umWDgj7yaxtzhcFYOsAJyhtt4FX5bGd4hr/pN27gGLpjkLQn1/xhcN0or0QtaK17nAJUIKvDdCiQYKiYFVXirA9DGFWM+sFIZ9d87a9Q5zPXgSImophXkXDSezdsXc8iOW32Ac1a8uTUWUSjVrojCkOM18B/71ecANmFLgRngbzwePZjQwnAbEsTSGRkq3KfLfz5bgzF2am1j6Jjj8P4ziRvG3+VYn8mVmruriPmJglNkyhZtnYT3Z8S7ByvdzldP3bNsnSjkildttDXFURaKiQDvX1JBYyenMhIYj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKOrl5DGimKEskIqbArzSwkYw6YMeKoTuLPrk7gvfc0=;
 b=VhFvO7GuiG0wduHkFUf1/7HhiwNo4dWSBjUA0vXg0RxOKsvo/UWttfqJrC8fUrlPc/cfYWzkQ5qzVHbUhPFDU3sIO00fML8Zgcfy511WIRbQxK8cyVslWPQtrXA43dUmwIkXYfYodeTP8XEqVUszJ4DtLLgs85hKeWY+Y6EyyvPBp2arOm0pPQtKEuK+4g5SsadMDUx7aoyLmWTCMU+vYXIwfp+3887H6pWJADnzFaMxS914uenV3KPAmZCFUV8Xb0LqG9g2HVrEe4O9nneMsUr05UtZhcawcNjQXMq+s1wEgG0JMRcperIQKgz8RwtB86LdiIgu+E7hHBCQInn2Ng==
Received: from PA1PR06MB9252.eurprd06.prod.outlook.com (2603:10a6:102:456::13)
 by AS8PR06MB7432.eurprd06.prod.outlook.com (2603:10a6:20b:319::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:08:43 +0000
Received: from PA1PR06MB9252.eurprd06.prod.outlook.com
 ([fe80::3ef2:9208:5d49:e8c2]) by PA1PR06MB9252.eurprd06.prod.outlook.com
 ([fe80::3ef2:9208:5d49:e8c2%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 11:08:43 +0000
From: Piotr L Lewicki <piotr.l.lewicki@hitachienergy.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Peter Marko
	<peter.marko@siemens.com>
Subject: Re: [OE-core] Is there a plan to update OpenSSL to LTS on Yocto LTS
 release?
Thread-Topic: [OE-core] Is there a plan to update OpenSSL to LTS on Yocto LTS
 release?
Thread-Index: AQHcXS+Il1vvbKtalEiQ6TQMdeEBoLUBqMaAgAAAV+s=
Date: Mon, 24 Nov 2025 11:08:43 +0000
Message-ID: 
 <PA1PR06MB9252C052D789F65BC2A47B9EABD0A@PA1PR06MB9252.eurprd06.prod.outlook.com>
References: 
 <PA1PR06MB92523E3FDDFC687727432ACBABD0A@PA1PR06MB9252.eurprd06.prod.outlook.com>
 <CANNYZj91CUJjTouA+tbLOCVz8Xw-R82mHEor3ZD0YJqp6mcoHA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj91CUJjTouA+tbLOCVz8Xw-R82mHEor3ZD0YJqp6mcoHA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA1PR06MB9252:EE_|AS8PR06MB7432:EE_
x-ms-office365-filtering-correlation-id: 23638539-b62f-4f8f-1590-08de2b49d4d0
x-abb-o365-disclaimer: PLPGS
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NmVDUnpvSFN5dW1lNGMrSExlakxDVjlMSWZZTC9rSTM4RzlJa3NCUTFsbWhw?=
 =?utf-8?B?VU9KRFNBU2QvbTJLMXR0QWNwWlBRTnZWcGxLWHYyT3hPTkVuOXNNZ0FaeVAv?=
 =?utf-8?B?OEpxZ3lOait0M3JSRitodmNtZFc0RDhvdCtVNFRMVURYSHFjdUtTaUw2a1M0?=
 =?utf-8?B?SDJUMUJFTXNuUlZBY3Z1OSsxUzFMd3ZGNW9LczJnRTB4b2ZUV1JReEFZV05y?=
 =?utf-8?B?dWdNbWVrNmJUR1ZEdU1DNVVSZENGaDZaR014ZU1LTkZSZi8xNzAvQ2d6SUE1?=
 =?utf-8?B?T3pwM1UxN1FjdXdiT3ZtSmJ1SlVxVXpKRjFIcEJ6bm15NUkyZUJZcUdZMngy?=
 =?utf-8?B?MDVqZm91c0U5OTZKcVdUWGNNTVNYallhUEVoalkrTU9JcHhQSXhUaXFTT013?=
 =?utf-8?B?K1lrdEpZcE51dkd5Qm11WHBac3ZGWWQvRXI1YWt3RkZINFBCZkt4ZE85a3RK?=
 =?utf-8?B?dUxJbzRpRmdpSUt3UkRoQ3VCRUNhVkRYRGpaM1RoZUZkOHE2R2prYmxTVnNa?=
 =?utf-8?B?bjhkQW94N29GdEN6VjVWd0h4Z3VPb000V0g0SnM1VEdnQXVZMEVRcjZFWXZu?=
 =?utf-8?B?bEVXTmJuTzZZamNMdlpmNEMwaVNvanh4ZTJDUkxjV0tJV0pPUmxWVmNMWldw?=
 =?utf-8?B?Q0ZPUDhTbkZ5dGI0RG9xQ0plZHRCU3FuOWJmSkh6ZjI3d0RGNmYvL0FoTFJ4?=
 =?utf-8?B?R3hrdXJPYldIZFpEV0x6Q3k0aEdRODFURzRNK1VUTUZJdDF5Q1o5VTl5Z014?=
 =?utf-8?B?TGNGRzFycGQ4OFVoVXNWaW9CTDdBWVVmVXVwNTg2OG9oMW12UGRQRTNRVm8y?=
 =?utf-8?B?QTdhYVBKQ2NoYmpja29VU3hyUHc4TTdPMnlhdFFUVDZVMUkzSUFZOWRYWmxL?=
 =?utf-8?B?SUtEQTdaNzZyWGR6YXU4ZWthcWxudCttMGkybzNVT3hBZHBaT1ZzUFpjcVhV?=
 =?utf-8?B?OWc0OFBhNTg4NFRvVVR6MXo0S2Exakt0anpWN3MzYUFlNDZFcXVjTE9ZcDlr?=
 =?utf-8?B?ams5OWNSNUtQdTVPTGYyMCtTQWwvRjNzNThHb1I2WCsvVjVwdnZ4elRYb2RU?=
 =?utf-8?B?RHVjaDFJTkQ5TEgwNUFiVXdwc1c3VngvR0xoV1FXNVdvNGZUOFhVMC9veFhO?=
 =?utf-8?B?aDI4K3BLQis2S0xGNmRndGdUVnBCN0I1c3MzQzdwTmx1b3MxbnpPYzNFSk1L?=
 =?utf-8?B?a05tMGtHcUVzSWljcEloK1I3dXlnbml0b05KbVZkbkZPemx6MzN6RkQyTHlW?=
 =?utf-8?B?MU9MSHFRNmVlVDVidlFkZWJmczFNN0VnbXQxKy9IUXhlemdWeHdSRjhJL1Q3?=
 =?utf-8?B?dDBxUVBmUXRnSWRtelBoNDIxRFByZ1NOWG5HNU1rOUtjS0ZIdHVENHd0aGtZ?=
 =?utf-8?B?L1JhYUZOWjVCSWczYlhYTmcxUytheFJKdmZIWkM1ckJ3SVpWOElNWXNKUnph?=
 =?utf-8?B?L1lDK25yOEpGSExrRFIwQnkwczdreC9DaXcvQlg0MUJKV2pTU0ZGQ1pITTBF?=
 =?utf-8?B?RnpHUXBWUWxYQ0xvdjErT25HeEg0cStzS2pKVUFjaytkUWZRcndIbGtja0JX?=
 =?utf-8?B?VHNyS2o0L2xsamprTlExUXhXbGF5dGdiNEJZK2xMLzI0NENNa0RwbWJYek41?=
 =?utf-8?B?L0tjRHVMaFJtNngvUXpCZm9tVTg0WEp1c2hVdDhCemJaMU9FOXB5MkhDeC9B?=
 =?utf-8?B?WHc2TGQrWDc0RmhSRFRkMzdzb2h4eHAwd0E5RlEvUkdEbktraW1hTVJUekNs?=
 =?utf-8?B?UzdDWmRxbGtZNmNpczRJTTdYdmZCYTlzTThBRkN2QTd4U3plZFIzTXZ6Vlc0?=
 =?utf-8?B?QVFCbTgwVjYxU1RSeTlaM0FpSVV5SVE1cDZkSUlEZjFKTlY0V3kwbGhFRXV1?=
 =?utf-8?B?NDlJamE0dXBrNlAwT1BaTjhYS1hySGI0VlpyMk9XRFoxWkN1U05tQzJlMWFv?=
 =?utf-8?B?MDJ5Q0JJUEFqV2lqanl4UVYzZlRBNnhXV3dhbE9TN1F5Sll4VmxwcGZCY3lS?=
 =?utf-8?B?M1NGMlAwMGxRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA1PR06MB9252.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXdtWUlpTGl0UGltRTgrckpyYi91SXVpUDlNdjZXMitISWxlaG1XVjVibjBU?=
 =?utf-8?B?bzlqRDk3NVhxa0ZBdEJyY3pRN0U5c2xld2E5K2YzSFRXNFJGUFdNczFXQmF1?=
 =?utf-8?B?MDN3NnVZN0cwY3cyQ2Q5eUxpcXNaRldUK25HN1duS21WRmRhNksrMHpONWhR?=
 =?utf-8?B?TkkyNnlUZ2taOXQwTDZHNkhBdVVCUi91Vk5HVFFqYllUV2lpVGNrTWhJd3h0?=
 =?utf-8?B?K1pQRzRvcDZUUERwSit3UmRHZVdGOWtUb09yOTFhUTJpMVlRWEo2VjlMU0Q1?=
 =?utf-8?B?Tk9sQ0txQUFOdmNMcHc0R2VWb1FhNjgxbmM0K0lxK2Y4SnB6UlFqSXNRdm1x?=
 =?utf-8?B?TmYyaWRjMDREVE9vQjBObzlaVmI2R1pZUllKYkZwUXNwYm9tNlFRdHNtcHNG?=
 =?utf-8?B?UTMzR0xQUmpsVGF0SitKcE5GNXJ3dkdPbnJkeUErL3lHNnpDUnFaQWhFRFJl?=
 =?utf-8?B?MGc0K2p3UXJIMUJwTm1XSFZFS1haeDFqcHRWTTlNdmdQV0NIQk9IZzdnNjV6?=
 =?utf-8?B?Ylg2NTFNRW5LaVM3eitZeTk0TVZmWnAxYnp4bmlYK0s5UUdmZzV2N2U4aUI4?=
 =?utf-8?B?MnpKVUhzeUltYU43d08rQkhHdDlqK1Q0NmRGZlBJY3hDczN1c1RtTk5seHNV?=
 =?utf-8?B?UWZ6UTBrK3dXMkhNT3U4bkZyQWxOUVRpcFE2a2lzZ3ZZVEZtNDFDSGVBejFT?=
 =?utf-8?B?ZTVLZndUaTZweG5TK0pwZVNSWlJYYm8xb3gxenNuUnA0UEwzbTJ6WTZSRXUz?=
 =?utf-8?B?WFpkUkFLSld2WUtSUnN1cnZYYmFFbnRUZDNrcFIrWkVpNmdnRUlZL0ZqeHh0?=
 =?utf-8?B?cUxqRkg5OHl5dTlYcGlNeDFZVmRFdUhqTFc1SUhHam9OeHptaXc5QXA4UzVq?=
 =?utf-8?B?eURRZzkyNnhZVVRFV3hyS2VlTzBaYmlvT3VqRm5McE1zOExqWloxZ2FMVm43?=
 =?utf-8?B?Z3lzL1kxSEc5WFpTaEFWZjZzUk1sRG9nNitxS0lkYlBQdG1TcnNIUTdYUkRs?=
 =?utf-8?B?cEgwMnM5TFdaS2lIQTRtMnBiWGZ4WW9WZldTM0hqSlhVQjJXb1hLVmp6RWd3?=
 =?utf-8?B?UERTTXNnRkltTEFHY3ppVEVzTkZjcTFYb2RiUzJ1VVIrT0dVY2ZKU3h2V1gz?=
 =?utf-8?B?UW5sSXRZdmkxcE1WOHdiRTdVOWZMY3hZZUwvR3NXc05TK3ZQUGlReXRXdUV5?=
 =?utf-8?B?WXVueFN6dy84YVZ3RHU0bE1vd1ZVdU5YSmx1V2ZGdXloOVhYVU1haTBTakhx?=
 =?utf-8?B?Y2ZPZ1lHN05CTTd3V2lDOVArUFVoOE9rK3h4M0syWnVLVm00c0J1SFZUZlYw?=
 =?utf-8?B?QnlFTVFTZFY1MUh5TTNGZHd2SmhtU1JlblY0dWlyYzc3aDR0RDRUcktTbHcw?=
 =?utf-8?B?MXQxbFhNNW1CWW12Nmc3N01tVkJmTzl0U0xuSjJOQUhGM2VGckQrODcwYVFr?=
 =?utf-8?B?ZDA0M1hXTUs0enQrVWNjZDNYdGl1REkxemJNVTBKU0k0SmVDYWNFaVVJR3U4?=
 =?utf-8?B?RjNoNW4wTUwyWHB6YUIzY2EzVnlyVm83U1FCYjRuMk1iTlEvZzdaY3JVZmdD?=
 =?utf-8?B?bkhubjlpVlNUZ1ZpMnllZEpOL1l4NGVIV2tLSFBleFlnV1hWTS8ySnZwOVpu?=
 =?utf-8?B?blkvTjFRSmdrQ0FJRmlmMXN0Y0I1UmNoMThPb0VMTkVkc3RuNm85WjhwV1Js?=
 =?utf-8?B?TWpFUFVtYUoyTVI2Rm5LNE05eHMzMCt4UDNwRnpBNHlPYWJJM25RMEtpZk90?=
 =?utf-8?B?Vkx3R29zakhUQWZ1STJIa3FDSlhYakFoQk9paXp3c044NkpvVDgrVklhdmc2?=
 =?utf-8?B?U1hCOWhZL1FCOG5JTEVZWGg3dHpYeldacDJYYzNHYnJJV0N2SmdXSXUvbDFU?=
 =?utf-8?B?TmJaRlZkVTFOWk9Za3RjTFRUK3RFRkwvRERKN3QvZXZRdjR6L3R2ZC93ald2?=
 =?utf-8?B?SFd2RmNhL1lMcHV0UWE5L3FTTTdNVUoxcXU2N1VyUklkcXoxK1R1VWJuSTRi?=
 =?utf-8?B?Q1BWY3kxTmRKWURUWmFmOGxtVUtGdkdDRHhYMHFXK3E4VDhCd1cwU1JmSHQx?=
 =?utf-8?B?djFUUHA1eFROc2cvakRIdWsyTEZ4Si9zek9pWW02UURYUmZXRi82SlF1SlA0?=
 =?utf-8?B?UFZtb2N0U3VkZFRFNTNxbEhLclNvQThhdGRORmlWOUhQM3dvTkVCb09xOVNi?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA1PR06MB9252.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23638539-b62f-4f8f-1590-08de2b49d4d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 11:08:43.5659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYzITIioYB3+0rTltDMNEwD3ug9luNEFOg1FC+dMZgJ732b1Sbg1cVByZIqbnK+PaGkuuXUQjLGVDK4R96VIZy/v8RAhSg6ZdoB258XV1QjXVqRGioZD9b9JAzLf96Ks
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 11:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226743

VGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uDQoNCklmIG15IG9yZ2FuaXNhdGlvbiBhZ3JlZXMg
LSBJIHdpbGwgdHJ5IHRvIGZpbmQgb3V0IC0gdW5sZXNzIHNvbWVib2R5IGRvZXMgdGhhdCBxdWlj
a2VyLg0KDQpCZXN0LA0KUGlvdHIgTGV3aWNraQ0KDQpFLW1haWw6IHBpb3RyLmwubGV3aWNraUBo
aXRhY2hpZW5lcmd5LmNvbQ0KDQp3d3cuaGl0YWNoaWVuZXJneS5jb20NCg0KDQoNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gb24gYmVoYWxmIG9mIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+DQpTZW50OiBNb25kYXksIE5vdmVtYmVyIDI0LCAyMDI1IDEyOjAwDQpUbzogUGlvdHIgTCBM
ZXdpY2tpIDxwaW90ci5sLmxld2lja2lAaGl0YWNoaWVuZXJneS5jb20+DQpDYzogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz47IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4N
ClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gSXMgdGhlcmUgYSBwbGFuIHRvIHVwZGF0ZSBPcGVuU1NM
IHRvIExUUyBvbiBZb2N0byBMVFMgcmVsZWFzZT8NCg0KDQpPbiBNb24sIDI0IE5vdiAyMDI1IGF0
IDExOjUyLCBQaW90ciBMIExld2lja2kgdmlhDQoNCmxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCg0K
PHBpb3RyLmwubGV3aWNraT1oaXRhY2hpZW5lcmd5LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCg0KPiBJIGp1c3Qgbm90aWNlZCB0aGF0IHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRo
IE9wZW5TU0wgdmVyc2lvbiBvbiBTY2FydGhnYXAuDQoNCj4gV2Ugc3RpbGwgaGF2ZSBPcGVuU1NM
IHZlcnNpb24gMy4yLjYgb24gU2NhcnRoZ2FwIGJ1dCBTY2FydGhnYXAgaXMgTFRTIHVudGlsIEFw
cmlsIDIwMjgsIGJ1dCBPcGVuU1NMIDMuMiAid2lsbCBiZSBzdXBwb3J0ZWQgdW50aWwgMjAyNS0x
MS0yMyIgd2hpY2ggaXMgeWVzdGVyZGF5Lg0KDQo+DQoNCj4gUHJvcGVyIHNvbHV0aW9uIHdvdWxk
IGJlIHRvIHVwZGF0ZSBTY2FydGhnYXAgdG8gT3BlblNTTCAiVmVyc2lvbiAzLjUgd2lsbCBiZSBz
dXBwb3J0ZWQgdW50aWwgMjAzMC0wNC0wOCAoTFRTKSIuDQoNCj4gSXMgdGhhdCBmb3Jlc2Vlbj8g
SXMgdGhhdCBhY2NlcHRhYmxlIHRvIHVwZGF0ZSBmcm9tIDMuMi42IHRvIGUuZy4gMy41LjQgKGF2
YWlsYWJsZSBvbiBtYXN0ZXIgbm93KSBmb3IgdGhlIFlvY3RvIExUUyBicmFuY2g/DQoNCj4NCg0K
PiBQbGVhc2UgbGV0IG1lIGtub3cgd2hhdCBpcyB0aGUgcGxhbiBvciBpZiB0aGVyZSBpcyBvbmUg
YW5kIHdoZXRoZXIgdXBkYXRpbmcgdG8gMy41IHdvdWxkIGJlIGFjY2VwdGVkIGF0IGFsbC4NCg0K
DQoNClRoaXMgaGFzIGJlZW4gZGlzY3Vzc2VkIGJlZm9yZS4gWW91IG5lZWQgdG8gcmVzZWFyY2gg
dGhlIGltcGFjdCBhbmQNCg0KcHJvcG9zZSBhIHBsYW4gdG8gdGhlIFRTQy4gVGhlcmUgaXMgYSBu
ZWVkIHRvIGJlIHNlY3VyZSwgZXF1YWxseSB0aGVyZQ0KDQppcyBhIG5lZWQgdG8gYXZvaWQgaW50
cm9kdWNpbmcgcG90ZW50aWFsbHkgYnJlYWtpbmcgY2hhbmdlcyBpbnRvIExUUw0KDQp3aXRob3V0
IExUUyB1c2VycycgY29uc2VudC4gU28gc29tZW9uZSBuZWVkcyB0byBzaXQgZG93biBhbmQNCg0K
aW52ZXN0aWdhdGUgdGhlICdwb3RlbnRpYWxseSBicmVha2luZycgcGFydCwgYW5kIHByZXBhcmUg
dGhlIHBhdGNoZXMNCg0KYW5kIGJ1aWxkIHRoZSB3b3JsZCAoaW5jbHVkaW5nIG1ldGEtb3BlbmVt
YmVkZGVkKSB3aXRoIGl0LiBPciB5b3UganVzdA0KDQphZGQgdGhlIG5ldyBvcGVuc3NsIGludG8g
bWV0YS1sdHMtbWl4aW5zICh3aGljaCBpcyB0aGUgb3B0aW9uIEkNCg0KcGVyc29uYWxseSBmYXZv
dXIpLg0KDQoNCg0KQWxleA0KDQoNCg0KLS0tLS0tLS0tLS0tLS0gVVdBR0E6IE5pbmllanN6YSB3
aWFkb21vxZvEhyBqZXN0IHByemV6bmFjem9uYSB3ecWCxIVjem5pZSBkbGEgd3NrYXphbmVnbyB3
IG5pZWogb2RiaW9yY3kgaSBtb8W8ZSB6YXdpZXJhxIcgaW5mb3JtYWNqZSBwb3VmbmUuIEplxbxl
bGkgb3RyenltYWxpIFBhxYRzdHdvIHTEmSB3aWFkb21vxZvEhyBvbXnFgmtvd28gbHViIG5pZSBq
ZXN0ZcWbY2llIFBhxYRzdHdvIGplaiBhZHJlc2F0ZW0sIG5pbmllanN6eW0gaW5mb3JtdWplbXks
IMW8ZSBwcnplZ2zEhWRhbmllLCBrb3Bpb3dhbmllIGx1YiByb3pwb3dzemVjaG5pYW5pZSB0ZWog
aW5mb3JtYWNqaSBqZXN0IHphYnJvbmlvbmUuIFByb3NpbXkgbyBuaWV6d8WCb2N6bmUgcG9pbmZv
cm1vd2FuaWUgbmFkYXdjeSBvIG9tecWCa293eW0gb3RyenltYW5pdSB0ZWogd2lhZG9tb8WbY2kg
b3JheiBvIGplaiB1c3VuacSZY2llIHdyYXogeiBld2VudHVhbG55bWkgemHFgsSFY3puaWthbWku
IER6acSZa3VqZW15Lg0KSW5mb3JtdWplbXksIMW8ZSBwcmF3YSB3xYJhc25vxZtjaSBpbnRlbGVr
dHVhbG5laiBkbyBuaW5pZWpzemVqIHdpYWRvbW/Fm2NpIHdyYXogeiB6YcWCxIVjem5pa2FtaSBt
b2fEhSBuYWxlxbxlxIcgZG8gSGl0YWNoaSBFbmVyZ3kuIE5pZWF1dG9yeXpvd2FuZSB1xbx5Y2ll
LCB1amF3bmllbmllIGx1YiByZXByb2R1a2NqYSBzxIUgemFicm9uaW9uZS4NCkFUVEVOVElPTjog
VGhpcyBlLW1haWwgbWVzc2FnZSBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgbmFtZWQgcmVjaXBp
ZW50KHMpIGFib3ZlIGFuZCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElm
IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBpbiBlcnJvciwgb3IgYXJlIG5vdCB0aGUg
bmFtZWQgcmVjaXBpZW50KHMpLCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFueSByZXZp
ZXcsIGNvcHlpbmcgb3IgZGlzdHJpYnV0aW9uIG9mIHRoaXMgdHJhbnNtaXR0YWwgaXMgcHJvaGli
aXRlZC4gUGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgdGhp
cyBlLW1haWwgbWVzc2FnZSBmcm9tIHlvdXIgY29tcHV0ZXIuIFRoYW5rIHlvdS4NClBsZWFzZSBu
b3RlIHRoYXQgSGl0YWNoaSBFbmVyZ3kgbWF5IG93biB0aGUgaW50ZWxsZWN0dWFsIHByb3BlcnR5
IHJpZ2h0cyB0byB0aGlzIGUtbWFpbCBtZXNzYWdlIGFuZCBpdHMgZW5jbG9zdXJlcy4gVW5hdXRo
b3Jpc2VkIHVzZSwgZGlzY2xvc3VyZSwgb3IgcmVwcm9kdWN0aW9uIGlzIHByb2hpYml0ZWQuDQot
LS0tLS0tLS0tLS0tLS0tLQ0K

