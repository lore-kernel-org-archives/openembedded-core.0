Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC9AC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 08:58:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7366.1785229096743093792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 01:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=NGZ2tWsh;
 spf=pass (domain: ericsson.com, ip: 52.101.66.29, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5lK9ERS2KuNeTZRGjUj3U6MDpY6dmuEFw+MTRHzEVFANkaZb5J8yf6X6ar4vHI2riig/YbLi8QeOC9o7B9Zk8KNi558Rdd3K2kZQ2pEZkgbsSJC51BJKj6DEhrfkvu4/bfyrHrBlLwn56/cVlWOWeO5DMKNurXHh+K4bCSWOC8sHF73I895EnhoGThYki6zJgnjMS4SpQwdHLYm3vgDiLVvcVaItJkrI8Gnq6QNjWGZIuiUOdKN8VT5CLjyn5px4pCDcz2oAzNVEGEnmKHk5LqPsz5a/yz7FoX3Lhmk3jcELv3s056lJ83sf3fgiJhuE6Mfs3yU4cVMP/OdjB1Ogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9/S3GyOVgKV5gNHMCzRJbYuK49j3chJBCohEdED/Gg=;
 b=aaqF3/lnJ3Zu/RNZ5v2KFRk/vF6KKm4smWyHMEKLzpnZ3iWsDtUAnYpTDDGHU/g+3jnxcXeHeaGvhROpEIr9uyAJpYjDI5TjgGF6/iI/3KahCMaaPzyhpGKYIWs6Bk9Pd48WZPT2L4tfYg6IR38tMbDQhXcoUVGjdtNLaqggG22qWL23bh+yf9oGTGQAHz+1O1BrZKw/olAKe5AtzJZD8CP0VkdB4QVyZsznyHKKyyXOPiAa18ljDLBkklfoLMShyZs/1LaqcVBuX4pOFHt8Ry1yZ/ZIkNSIFKiY6+4aW1pvsMrVw+GyTzCMKVbIibKC13xDRQzcHzAbiBj540DFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9/S3GyOVgKV5gNHMCzRJbYuK49j3chJBCohEdED/Gg=;
 b=NGZ2tWshG3esTMWBlKL+ktL/n8aq88s7b78j2nq22bNRTbzvzmUcSDSdRv4BI1MElxjKnWlU1oOuus/H3QplQUx3ggZ6+soBzwx478ERXszFt8v/qL17TIxHUzgF4Qt6momZ6jJn0+1E68W1AAE7GUA7kT8wkMcRMjoAVQQNhDMN18t2naa26ohBIEjn2LZXeFFErysrRilD3DyNauK0oXpvshi8DSj8qVNZz+Za98zt4SooygfmU71yi5QfH+CZaY05EVF1inn9sjcf7qZdDW3U1sCzfcPqXNUL9Al4g+2J96ou7UCG+u8ith7JRSEYMy38rfV4aw0y3J8SYEfWAQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GV2PR07MB12355.eurprd07.prod.outlook.com (2603:10a6:150:341::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 08:58:11 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 08:58:11 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "benjamin.robin@bootlin.com"
	<benjamin.robin@bootlin.com>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"jpewhacker@gmail.com" <jpewhacker@gmail.com>, "antonin.godard@bootlin.com"
	<antonin.godard@bootlin.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH RFC 0/3] spdx_common: improve get_patched_src()
Thread-Topic: [PATCH RFC 0/3] spdx_common: improve get_patched_src()
Thread-Index: AQHdHaLIWkvD2VTOHEmlnCO16bJ9JraCoycA
Date: Tue, 28 Jul 2026 08:58:11 +0000
Message-ID: <d8aacd57b82e1ea3782fb9f40b9845379a1803c8.camel@ericsson.com>
References: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com>
In-Reply-To: <20260727-fix-get-patched-src-v1-0-f5054ca10e14@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GV2PR07MB12355:EE_
x-ms-office365-filtering-correlation-id: 05c7090d-ed05-4f67-4509-08deec865a51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|3023799007|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info: 
 4wZdlMghM7BaJioNJvvnwmXA1usqOFIbPVluTSB1PrdSIPz6InEk17IfboIv6+i6AwXO4AGFl6Ps67KC0AwfWjCXohx6IBPr4fquTlWeQuWHk1s8TRNByPt5pNy76ANj82/dnxDX+11hJNt9R0ioR+lt9jcI7MK5VWrhAj17SchjqgnnQ9uCDyuoGxucKk2th5xxvxsIyq0Qrrmi2x6pj0xJ6HWrLW0GK8FN2euQwNv95OLCAKOp8XIcENtDcIJev8fuT8PjXGakE514bLlGjG3AkURm0UmSB2R8Sxufo3BCZ0wCXkq2XBqCQA955JG4Mf4uzkyTsiLVMmbkpvymX+8ei/8VuPujKsl9RwZ2eisUYOzQpERupXmJhF/tiPDGulCjI617KPC5rzDChAdaFN1dwzMzdPN10hGdWeMsgFhIEmRoXJnyUJlzapZyWgbnYIMzbST0uYlMrUVyLq3KCrAXzxRuswkddA90gGwRbn/uwkMdZSdN8c7YfbjTW6f2KRSA88Q/u+Z7TiYsuiv3eX1PduW8ddiKeH1Dsx23CHEEbke1wsibp6HVrb9d62F1g2pSdeZF+agOc+WnzOVi3KLujDbVY1GzwZll8QmN80tspXzry7r0bcjkfNa/tFJFJEpLpYgqjWMkPPP++5NxVyRKnBFaoY4J6fdILwzRtZt7BxZ4txoB06hZrNnGvxvyh60rjDZBHzIOlCpLKGJQLicMlFJtg54/dIhQhg/j64U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WlVPVFA2QW5rZkNPWk9LYmpraWFkb3lvZDdlZWpZQTh2dzQyeE1JTGRtUi95?=
 =?utf-8?B?ZjdJMzdRVGRhb09mUUo1RWhpWU1yVkZ0T0N4VFpkS1p2dUZsYThMb1Nnd2FV?=
 =?utf-8?B?Q1lUYWswdDc1RDZVNTV6K1ZoMWhtK2ZkZVY2Z0ZBL3ZlTVNjZnNaS3dVYk9p?=
 =?utf-8?B?RVhXOXl4TjhpQWlGc1hDS2xnRS9hTkYySHpIU0ZRVlcyUVAzYUpVaVp4c3dH?=
 =?utf-8?B?SGx6QmFxdGdpODFNOXdINE1WUVZXOTFZRFZsNmtBdE9EU3c5QVlEc1pUc2NT?=
 =?utf-8?B?bUlJQlIxYmVkaXZNQ0szTUJmdjV2a0ZXaFJ2UnVNZHBvQmYvTnJvZEdReXQ5?=
 =?utf-8?B?bHZQWER4djl4dHNqZGxPNUtOYnNZelRBYTJyWjVnNkwzR2h3TlJQUVZZQzZE?=
 =?utf-8?B?WER3ai9BRzVqekttbFhrN3JjYXhqZldsK2tZaUJjNEpoVVN1MC9ISUd2c1Jh?=
 =?utf-8?B?bjM4MVlIZkhraE81aDdQcmJrZXI1WFVBVnY4NEFpV1lvNGtscUNDdnRONzRX?=
 =?utf-8?B?M1NXOXF0L2tHRG1xU0FvZWsvRGZWYlF3Sm1DSzN0dkpxR0pIdVhyOVBkdnZ0?=
 =?utf-8?B?WmFYaElnbHVHRVRNQUtqYWRkWFVZbmh2ZG9KNkQ1aGlTdEluQ0U2eHhEdEdx?=
 =?utf-8?B?VVN0Y0ZOV0xJcFVPblpmY3I4MzdBcVFuUW1PUDN6Y0p3VHFaZnJOdnJmckJQ?=
 =?utf-8?B?TGNsS0tLNHdOb0o3dUtyckkyQXU2WElnQXdpSStFZmVPbVZCTVZ1VzhNZXF6?=
 =?utf-8?B?SU9lcXJRalRUQW5qemFRUDlHTXBBa1dCak5GSTROV3kwTWV4VXhrZ01LbCtO?=
 =?utf-8?B?WUMxQWMyWGFzOUJNNmM2QjNCQktKeTJiZGo4YmdscUhWeDVvYmk3TDlsajRo?=
 =?utf-8?B?aEROdWN4aG1IaG5CUDZBMFdpNldtdDVZY3RGUkhPTU4zcVFSNHNyYjB5RGxw?=
 =?utf-8?B?cktWQkE5N0I5WkRjVGZpbXlHRzRJZWp1QVR6ZE1WSVNIOTVFaVhEUDhmOUpZ?=
 =?utf-8?B?NDZzczRoT2hEQ0xCU3k0WEV5amZ1VElIRFRWTlRBK1l3SEp5djZMK1l1SnNO?=
 =?utf-8?B?ZmFxMm5TSjRBb2wvNXBhNHlHazc3eWh1WUl1eE53RGlFQWpXR3YySTFvSnh2?=
 =?utf-8?B?OTZYNHIybkVyV1djTlpiVURYTHUyNjZZMnJmNDNkODlSUnR5cC8rb3QzT281?=
 =?utf-8?B?aHlKYTdwK3o0S0xOZSsvVUhmeVAwNnV5bC9qTXNHL1k2VVErOEU0UVU1cU9D?=
 =?utf-8?B?MW9JOElXakdTNjZ2ME5MY1pMdS9sNzJWeFI2RWV4c1NUSkNqejNpMHM2U1Jj?=
 =?utf-8?B?SnNMbGFpb1dCS0l5YmpqWUo0V0FRdkc5VTNGQjJmNDN3bWxmaTAvaUl5RE1K?=
 =?utf-8?B?VFkxd3hoYitJUUplYVBjQlB6TFIxVHplUUJhYUhwa1ptWmo1MVhweFZDWU5h?=
 =?utf-8?B?Z1NaNCtpb0xIRVNlekxtVXVvc1doRy9iNDVtSE9tVGtaeDlRclZlQjV4Y094?=
 =?utf-8?B?UFhHSlpXaU95cjVLM096azA4ZGlNbUQwVjRSWENSbVpyYTRmVmc5cE1mWEhT?=
 =?utf-8?B?OEZVOXIwUkZSaTJNUUxNL28vNEoxcEEwTS9DbmdYTGw1YUZvSVRTMlBHdktu?=
 =?utf-8?B?b3BDWjN6aWoyMHRmaWZCbGV4N1d4bFFBMWlOYlRPSldCL0NqcjhuL2dER1FB?=
 =?utf-8?B?SjlaZG5YdVRZcWducm5PKytaaXY2ajZ1WWxiWmloUElib01IY3lDY0pnUXFU?=
 =?utf-8?B?R29zYkZ4WnVJVGdnSHV4eGMzTFkyVDYvdlVLU21qdmY0dHZ1L1VVQkFXNkdT?=
 =?utf-8?B?WFlFTnlQWmpOUjk5ZmM4bWwzVFNIdTRRME5sa2tHY09Eb1YzVFZ0WjliV2wr?=
 =?utf-8?B?Y0RGY3NSL3BwcUEybTdZdjBWcVA1MUFOb0xzYklka2VvbVowaUxoZDlLODF4?=
 =?utf-8?B?UWNwMFJjUmEyTndSTFVEQkhuZDJjZGJmZGVnZEh3aVdwM1N0SEFEbFo1cDhw?=
 =?utf-8?B?WGJlQXNlUzM2WHZKb2FtaTEwb28wK3BqbmF3VWlOaHh2YTAzSzRSRnZzZHFl?=
 =?utf-8?B?VkhMa1UxWEFBMXh2WVpFdVdLZzVJMldKRTRHSG4vQUlVZ3FkaWpxU2NBdXBy?=
 =?utf-8?B?c0U4NlRFOWowSTgycU8xcVFsQjltSmFCVjZ3L0YyMWI5aGVqTXpSSW9neFNX?=
 =?utf-8?B?VUNBb0tsUzdZNzBxTEJMNzZocUpFTWdrSkR5dG81STRFYzdNNzNTUTlVTjdO?=
 =?utf-8?B?UUE2bWNib056MXVILzkybm94ZnhGdHhuTjRJejdieWVaZ1JEWU44ckJuNVRT?=
 =?utf-8?B?N3UwaC9iaElJVnJlZC9wRlJNaXVIRFhURkpjOTk1QUdLekJDa1VhNkt1clJv?=
 =?utf-8?Q?EUSv3k31iw6uLcE4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <483244AFB249D94B8348917EDDB2974C@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c7090d-ed05-4f67-4509-08deec865a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 08:58:11.7738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chPbz+j2gVP4w0HrfEuonovv6tb/n1AhmGVTwy8WDXarm5jn8FHCkR+W5TJaSRZw75S+00rxKTp2XYTQo46BgTA11SVdJVAioXkF1mVuN1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB12355
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 08:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242172

T24gTW9uLCAyMDI2LTA3LTI3IGF0IDEwOjM0ICswMjAwLCBCZW5qYW1pbiBSb2JpbiB3cm90ZToN
Cj4gVGhlIG92ZXJhbGwgZ29hbCBvZiB0aGlzIHNlcmllcyBpcyB0byBmaXggU1BEWCBTQm9NIGdl
bmVyYXRpb24gaW4gc3VjaCBhIHdheQ0KPiB0aGF0IGl0IGNvcnJlY3RseSBpbmNsdWRlcyB0aGUg
a2VybmVsIGNvbXBpbGVkIHNvdXJjZXMgZm9yIGFsbCBjYXNlcy4NCj4gDQo+IEN1cnJlbnRseSB0
aGUgU1BEWCBpcyBvbmx5IGdlbmVyYXRlZCBwcm9wZXJseSBmb3IgdGhlIGZvbGxvd2luZyBjYXNl
OiBBIGtlcm5lbA0KPiByZWNpcGUgdXNpbmcgZ2l0IHNvdXJjZXMgd2l0aCBrZXJuZWwteW9jdG8g
Y2xhc3MuDQo+IFdpdGggdGhpcyBzZXJpZXMsIGlmIGEga2VybmVsIHJlY2lwZSBvbmx5IGluaGVy
aXQgdGhlIGtlcm5lbCBjbGFzcyBhbmQgdXNlIGENCj4gdGFyIGZpbGUgZm9yIHRoZSBrZXJuZWwg
c291cmNlcywgdGhlIFNQRFggZmlsZSBub3cgY29udGFpbnMgdGhlIHByb3BlciBsaXN0DQo+IG9m
IGNvbXBpbGVkIGZpbGVzLg0KPiANCj4gQnV0IHdoaWxlIHRlc3RpbmcgdGhpcyBzZXJpZXMsIEkg
Zm91bmQgb3V0IHRoYXQgU1BEWF9JTkNMVURFX0NPTVBJTEVEX1NPVVJDRVMNCj4gZm9yIHNvbWV0
aGluZyBlbHNlIHRoYXQgYSBrZXJuZWwgcmVjaXBlIGlzIGJyb2tlbiAoYW5kIG5ldmVyIHdvcmtl
ZD8pLg0KDQpJIHRoaW5rIGl0IHdvcmtlZCB3aXRoIGJ1c3lib3ggYW5kIHNwZHgyLiBCdXQgc2lu
Y2UgdGhlIGtlcm5lbCB3YXMgdGhlIG9ubHkgcHJvamVjdCBhdCB0aGF0IHRpbWUNCnRoYXQgaGFk
IENWRSBpbmZvcm1hdGlvbiBhdCB0aGUgZmlsZSBsZXZlbCBJIGRpZCBub3QgZm9sbG93IHVwLg0K
DQo+IA0KPiBJbiBzYXZlX2RlYnVnc291cmNlc19pbmZvKCkgdGhpcyBgc3JjLnJlcGxhY2UoZiJ7
ZGVidWdzcmNkaXJ9L3twbn0vIiwgIiIpYA0KPiBpcyBuZXZlciBleGVjdXRlZCBzaW5jZSBgS0VS
TkVMX1NSQ19QQVRIYCBpcyBhbHdheXMgZGVmaW5lZCBnbG9iYWxseS4NCj4gQnV0IGV2ZW4gaWYg
dGhpcyBwYXJ0IGlzIGdvaW5nIHRvIGJlIGV4ZWN1dGVkLCB0aGlzIGlzIHN0aWxsIG5vdCBnb2lu
ZyB0byB3b3JrLg0KPiANCj4gQW0gSSBtaXNzaW5nIHNvbWV0aGluZyBoZXJlPw0KDQpwcm9iYWJs
eSBub3QuIG15IGZvY3VzIHdhcyBvbiB0aGUga2VybmVsDQoNCj4gDQo+IEkgYWxzbyBmb3VuZCBv
dXQgdGhhdCBpZiBQQUNLQUdFX0RFQlVHX1NUQVRJQ19TUExJVCBpcyBkZWZpbmVkICh3aGljaCBp
cyBub3QNCj4gZG9jdW1lbnRlZCwgaW50cm9kdWNlZCBpbiBjb21taXQgMTdmYTY2YzgxOTlkNzNm
MGI1OWIyYjNlNjA5MDc1OTMzYmYxZTc0YikNCj4gdGhlbiB0aGUgYHJlc3VsdHNgIHZhcmlhYmxl
IGlzIG92ZXJyaWRkZW4gaW5zdGVhZCBvZiBiZWluZyBleHRlbmRlZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEJlbmphbWluIFJvYmluIDxiZW5qYW1pbi5yb2JpbkBib290bGluLmNvbT4NCj4gLS0t
DQo+IEJlbmphbWluIFJvYmluICgzKToNCj4gwqDCoMKgwqDCoCBzcGR4X2NvbW1vbjogc2ltcGxp
ZnkgZ2V0X3BhdGNoZWRfc3JjKCkgaW1wbGVtZW50YXRpb24NCj4gwqDCoMKgwqDCoCBzcGR4X2Nv
bW1vbjogbW9kaWZ5IFVOUEFDS0RJUiBpbnN0ZWFkIG9mIFdPUktESVIgaW4gZ2V0X3BhdGNoZWRf
c3JjKCkNCj4gwqDCoMKgwqDCoCBzcGR4X2NvbW1vbjogSW4gZ2V0X3BhdGNoZWRfc3JjKCkgZW5z
dXJlIGtlcm5lbCBkaXIgbmFtZSB0byBiZSAke0JQfQ0KPiANCj4gwqBtZXRhL2xpYi9vZS9zcGR4
MzBfdGFza3MucHkgfMKgIDEgLQ0KPiDCoG1ldGEvbGliL29lL3NwZHhfY29tbW9uLnB5wqAgfCA4
MyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gwqAyIGZp
bGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4g
YmFzZS1jb21taXQ6IDlhMjViM2U3MjA1MWEzMDc5NGUxNDc1NjQwMjg0ODdhNTk4Y2U4MmQNCj4g
Y2hhbmdlLWlkOiAyMDI2MDcyNi1maXgtZ2V0LXBhdGNoZWQtc3JjLTk4OTY5NWMxNTQxZA0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiAtLcKgIA0KPiBCZW5qYW1pbiBSb2JpbiA8YmVuamFtaW4ucm9i
aW5AYm9vdGxpbi5jb20+DQoNCkNoZWVycywNCkRhbmllbA0K

