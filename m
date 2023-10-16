Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B706CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 05:45:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web11.111576.1697435146915189505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 22:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=cyyqdJRY;
 spf=pass (domain: welotec.com, ip: 40.107.7.79, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJJpHOPj1B4ET61YXCAC8XZUnH4uMvhUQMk7HkRgY1XzG7hnUJmzrxc3f7/pUlfNjy6LIyGLGcgWDCWLodUIALiC13M8yOUebzyTFyKBO5f4pSlt2FfRsU0UvZC0H7zKzGkZm2cFctv2YfUl6HmNw6r0IkWB/BVmtz6tHyw3zvltsVyjszpnYCnl5F0dRiGhE75SSPCwKzXtuYyxdyuHhJUKk62uZK/KpPfd4MZIZRuqx5gqGJ/ppvstH+JfsVQ9bYIdvDTSYVMUa+e/T3I/Wys+F3ZQBlzc7GQajnMDbtyB8UrVfWQQWt7y2rK2E530D/KRK+vtObcpXb6bpbQvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtyeoYw2IarjndeGp4TCqt7niIIn4k4F7F8Q7yLl/+0=;
 b=NiRrXV1Z5wvfMi4QKpzS9WIIrDnhxNZdQVDrbvNmxciolEneWTWaoqhlyIt2oLIj+DnvkgMlgovU7cxkC0wlS03KQXkhWvgNiDCzMn2x5eTowlfGIRq15TLQc7jaLDMMqH0SLWedpy3HBHI0AtAjded9FnIG+IS/n7jLVrbs1s4E0BZ3XaxIAjjISbSH1+3yoAj5bDdg2Z8LKAJ6SaEckRRmXZQd8ONz4WB93QfNMyiBPhUiYDQ2cBM+9BGVmDswFguetm3dlNuMztkCbvk9xF2a7z/C4lIllSpc/6zk6eLw4IqvVG7ot7oBDDAtD+xV/UWfurPhOJIy8rnmxb+W1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtyeoYw2IarjndeGp4TCqt7niIIn4k4F7F8Q7yLl/+0=;
 b=cyyqdJRYmwn44WGFsNwyuAYyJDcJTxcGbOWYtgHCIyJoCmowDPOpCvX09pD0LDixmOmVlC8b7JXvTAKaUfvKt4hPOh67U8d28KffMEjZemvaxXQmFpUPXawhj3cxprb2zTF1F8tJi+HsFxvdBm5cUNvy9Gp5HHB4shm2fij3S41CX/Cj+21oU8zVGxUsbGYGd7CcauFxMDG252HOg49qtn+EzlpieQ/9GLWDuhT2maVNksvsgPqowLeSwknC3gR5Kydte3b4sqhMxT9Ge/MAA5WdCiNbyeSOFRgj/JVgCCMIDrh+wdVE2EbE8w00TFjJ/zCJRMKpqgbGJYoCItT7FQ==
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DBAPR04MB7239.eurprd04.prod.outlook.com (2603:10a6:10:1a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 05:45:42 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 05:45:41 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
Thread-Topic: [OE-Core][PATCH v14 03/11] sstate.bbclass: override tar with
 tar-native
Thread-Index: AQHZ/3gR441rZw67AEy2jVPMY0zZfrBLK2KAgAC9qwA=
Date: Mon, 16 Oct 2023 05:45:41 +0000
Message-ID: <2299932.ElGaqSPkdT@latitude>
References: <20231015145749.69995-1-p.lobacz@welotec.com>
 <20231015145749.69995-3-p.lobacz@welotec.com>
 <3bf4d3c6ef38532d316ec3eefc9d670aad5ba21d.camel@linuxfoundation.org>
In-Reply-To: 
 <3bf4d3c6ef38532d316ec3eefc9d670aad5ba21d.camel@linuxfoundation.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DBAPR04MB7239:EE_
x-ms-office365-filtering-correlation-id: fbe14877-9cea-4cc4-500a-08dbce0b2224
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m2sV8um2l8rFyCQt6PIUc3UN1EKXuJhwrTxnWMQ2+40c3IR+qlzk7NG/R7rk2Z9T1Lt/k4byX8d98bTeIxHqtxtdkjgk/kQ7erhqeTBWpWJ7H9UrQa93+Av7WvN1CwnPRKKeUhMZOA6DdE15sIt0doWrXN74/W8Zvdg7AVz6GlCztde/qeNR2kkwCLd2U5z5jdbyuLf3Pr2V325bWzIhKb8JrybOMKMH+gQ8QtZ33wAM3gzgA//rmN3PIev+MVxgw7mnOG/NKnjAKEj2SM5HH+XJR7Dm//oSofJvoItlju4ZPH8OFkA9XSS3pHlFsuW7AoneAaRU6wZN+oGX13DFGFiP55PmmOM9bqC+SqFl/i/YlfKRBbFDvbHil1TiCSUc5Z6MU0O8ilBEhN1PoQ3t2+6U7+FI4oQh1TTJneZID68YBGqKUCrx7RjI0PsyiCECZTTwN0+AD2tkurIS8MEC5D/ti1i7zrPYm+EfKCBWEbmegIcPX73jWaKHsF7hkkUut6wx4FgV1RM+ZkPUwCdyX1VBBzvxCI90eE2DS8Pe0BVn3LbtjY937WHEquq4ofKcVFUds0vtk1eisZuHRPEbwUXhwMfAmegdzKAOK98st2g+5mNAt7UlRzJfxhWiRjqS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39830400003)(346002)(136003)(396003)(376002)(366004)(64100799003)(1800799009)(186009)(451199024)(4001150100001)(110136005)(2906002)(41300700001)(86362001)(966005)(6486002)(478600001)(66446008)(66476007)(66556008)(64756008)(91956017)(9686003)(66946007)(76116006)(45080400002)(85182001)(6512007)(6506007)(316002)(38070700005)(8676002)(8936002)(66574015)(26005)(83380400001)(122000001)(66899024)(85202003)(71200400001)(33716001)(5660300002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?amhXMmcxWG9jZysxRGhQM1J1eFZzTlRpWGl5V2M5Y0tXWXJJL2dXVk41ZC9n?=
 =?utf-8?B?dVQveVlRR3g1RTU0QU5uNEs3aGxsY1RabEI4dkZqRXVuMlBHeDZzYWlHTHIy?=
 =?utf-8?B?V2FVU2xKRnZ0MEJ5NkhyeEZiWjg3emloZzJNNXBDc1NrVFpUWHdrL1RpSktV?=
 =?utf-8?B?cEJQWnRvYUZLS0MvSm5JUDd5Y3MxRVlzV3FkaEc0NDI4VGRaeHRCK2xueUxt?=
 =?utf-8?B?Q0hBZ0NyaWlJMTk3ZTNSeGx6SnlwZEptNUtRR3VqM0hBMXE3Ulg0N0QyMlZE?=
 =?utf-8?B?WktKbTgzbUYvaTVRbklMU1dRNit4N29lZ29jZHZ4U0VQNlpoVFRGdHJleFhq?=
 =?utf-8?B?QW4zVk9FM1ZnMWFpYTRIQUovN0d0N2F5NUxRRmU1ZEdvYXBJcmRCQ0NjOTIr?=
 =?utf-8?B?V2ptL0U4VnlBNmlvRDJvdy84MWdtREpBTDdTKzBWWGFCclZWZUxMKy9rZ1pu?=
 =?utf-8?B?ck9TNUdwYWNIRklsUE1ZeU9pckszNW1hY1hpTmYyQXRQbytqNHh0Z2RkS3Vm?=
 =?utf-8?B?VEpmcm5CaTF2blV3OHRqdFBIZklyclVGSXBGdlF3UW1TZThpVktMY2pnVHhI?=
 =?utf-8?B?ZmxNVCtYRm14NkJ2Y2tGUFRTVVk4U1lQMUMyNXR0YkFDWXB2Rm5MeWxIbEFO?=
 =?utf-8?B?c0ZzT0tkNVk4TURZK0VLckdvVmtDZ0dtSFExMHRqb0JXTnI0RWU0dXNQSlZT?=
 =?utf-8?B?emppV0l5bjF0UWM0Yzd0V0wwMzNMN1B6Ny9aaHVIWklrSVR1VHJPaWNtbFBX?=
 =?utf-8?B?azVPUXN0Nm92ZEpYbE1CWGFjVTNIMHF6OUkyMEdHWmRjL0RLRHpVS1FFeVZM?=
 =?utf-8?B?Rms1aDVaeWE2SElTN0sxMHhHRmZmVnpIV29PcFh4d2dHWFlrbkJ3MkMwTDN4?=
 =?utf-8?B?M0grSFhQN25Nc3JkYitUdHNPelVzakVHc3dvMHMrbSt1bEIvQ0gvU3I2VHVW?=
 =?utf-8?B?NEhVUldvb1dzcmxGYkVZZEZjWU1aNjFwditaZEZQUExZY25LNmtNb2plaFRr?=
 =?utf-8?B?aWdGSnZmT2lwaWR0bnlPcnVzckZpZ0wvbStXR2M1dzFqYXoyb1ZJdmxzRjF0?=
 =?utf-8?B?bTk5dk5NZytLRkJKejF5eEZkNHdmQXdMcnNadGhYSnZETHJTMER6NkNnM1NH?=
 =?utf-8?B?dnBhWm9Rd3FwZzNrbVVWVVpuREl1Q2c1T0pQRThZYlh3MnMzMWRDT2pXemM5?=
 =?utf-8?B?VkE5dWUxcWluQTZWT0hCTWFiTWQ0Y1c1eG50bXg0bnVnTkJQalE3SlRVK3gy?=
 =?utf-8?B?MHlUM1NCR2RkSDJUeFhUbHJRK0QyV00vYVAvQlcvZW4zY1hQRGxsSXBRdEJx?=
 =?utf-8?B?Um1NaCt4QXV0Vm9vUmJ0cjF4WU1VUExhQXU0R3ZuTC93STNPZnRFSjYxdnk1?=
 =?utf-8?B?Nklwc1d5aG1iMkJZWlJlU2ZrM2lhc0lFSWpvaGZyWXRMSWRDRExjYlV1Mml4?=
 =?utf-8?B?RDZXWGhDNWVoSXNNc21ZQ2hUdEc5VnV1S3VCMis5TDMyKzd4dGdic0VjKzNV?=
 =?utf-8?B?TEdlQTMwWGVheHJuUE5iM2J2Rm8zemFXR3ZTNGJOb2NzRWljT1c2RHY2N0F4?=
 =?utf-8?B?L0xLSnY0dVoxcG5OU2ViS2hCR1l3T0hxajFqMTRWZ0ZmT2Q0QnFyWWMvZXp1?=
 =?utf-8?B?VlJHYjFYUHY5b290NlY5NDdwemgrejE4QUx0dDZnSVJFa3hRUC90UXZFV0hy?=
 =?utf-8?B?cXVJWHZFb3JTVjJnNUFtYlk5YkxuRkhIOE1sV0hmY01OS0hwaEI0RmZXSmQ4?=
 =?utf-8?B?czhMZ3MzTWRVNDgxRWc2TzVYM01RejZrdTMyUGh6UGlNamN1R3Vrc25iTFFO?=
 =?utf-8?B?ZGFJWGJaZWJzVkFPVmFiL1JBVTg2UnJkaU9ZbTVqZkNqL3kwNFVPNzlnTnM2?=
 =?utf-8?B?UHY0SU9jcFlIL1ZjUUQ1Y0xKSnVvQ2kvblU3ODFHalhaUno0VlJnc1JEdVB4?=
 =?utf-8?B?OUdyM1JyY2dRcTlUL3VQeUNvRVhLSDNlWmhBZkdseDRBbC9nYkJnOHc3eXIr?=
 =?utf-8?B?MUl5blQxT3dFc1ZnR2J0VS9lcTVObHpJRlFvNHgwa0xhS3o3OU1CY3IxNVFX?=
 =?utf-8?B?TmxkKzZobHJwZ0hYUi9uUFpOOHFFVlJvM2hyTWYrdW53aklRTWRkN3RVKzBF?=
 =?utf-8?B?UDkrcDNmK2lGN3RwNEV6aWVTZlRBM05PR2JZQURLaXFhbDlkUzU2ZVZ4TmZI?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AED26418EEC3E46A03B66D3F42289D3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe14877-9cea-4cc4-500a-08dbce0b2224
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 05:45:41.5253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQ6ZvqWRBC1vFexaEf7Y4zmzrzaHcJXaWG7EuckhDtepn/M/1nxlUBdmkAJgXqZIpKjH8Sz5Bjbz1d3Ld40OBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 05:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189255

RG5pYSBuaWVkemllbGEsIDE1IHBhxbpkemllcm5pa2EgMjAyMyAyMDoyNjo0OSBDRVNUIFJpY2hh
cmQgUHVyZGllIHBpc3plOgo+IE9uIFN1biwgMjAyMy0xMC0xNSBhdCAxNjo1NyArMDIwMCwgUGlv
dHIgxYFvYmFjeiB3cm90ZToKPiA+IER1ZSB0byB0aGUgYnVncwo+ID4gaHR0cHM6Ly9ldXIwNC5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGc2F2YW5u
YQo+ID4gaC5nbnUub3JnJTJGYnVncyUyRiUzRjYxOTM0JmRhdGE9MDUlN0MwMSU3Q3AubG9iYWN6
JTQwd2Vsb3RlYy5jb20lN0MyMDg0M2MKPiA+IGQ0MDlmZjQ3MWFkNTNiMDhkYmNkYWM0ZDU1JTdD
MjUxMTFhN2YxZDVhNGM1MWE0Y2E3ZjhlNDQwMTFiMzklN0MwJTdDMCU3QzYzCj4gPiA4MzI5OTEy
MTQ0MDIwNDg3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENK
UUlqb2lWMmx1TQo+ID4geklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3
QyU3QyU3QyZzZGF0YT1VOCUyRm1tMDJNUjVwczVidFIKPiA+IEpuRTFFbnlTTms0TkpWNDk4a1JY
NjZqamVlUSUzRCZyZXNlcnZlZD0wIGFuZAo+ID4gaHR0cHM6Ly9ldXIwNC5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGc2F2YW5uYQo+ID4gaC5nbnUu
b3JnJTJGYnVncyUyRiUzRjU5MTg0JmRhdGE9MDUlN0MwMSU3Q3AubG9iYWN6JTQwd2Vsb3RlYy5j
b20lN0MyMDg0M2MKPiA+IGQ0MDlmZjQ3MWFkNTNiMDhkYmNkYWM0ZDU1JTdDMjUxMTFhN2YxZDVh
NGM1MWE0Y2E3ZjhlNDQwMTFiMzklN0MwJTdDMCU3QzYzCj4gPiA4MzI5OTEyMTQ0MDIwNDg3JTdD
VW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TQo+
ID4geklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0
YT1KM2N3V1dBUTZCSFAxYUdWZVAKPiA+IDF5UklHbkd5RzFmcVZ2UGFWSlk2a2pLV2MlM0QmcmVz
ZXJ2ZWQ9MCwgd2hpY2ggYXJlIGZpeGVkIGluIHRhciB2ZXJzaW9uCj4gPiAxLjM1LCB3ZSBuZWVk
IHRvIGZvcmNlIHlvY3RvIHRvIHVzZSBpdCBpbnN0ZWFkCj4gPiBvZiB0aGUgb25lIHByb3ZpZGVk
IGJ5IHRoZSBob3N0IG1hY2hpbmUuCj4gPiAKPiA+IHNzdGF0ZV9jcmVhdGVfcGFja2FnZSBhbmQg
c3N0YXRlX3VucGFja19wYWNrYWdlIGZ1bmN0aW9ucywKPiA+IHdpbGwgdXNlIHRoZSB0YXIgcHJv
dmlkZWQgYnkgdGFyIHJlY2lwZSwgd2hpY2ggaXMgYWxyZWFkeQo+ID4gaW4gcHJvcGVyIHZlcnNp
b24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIMWBb2JhY3ogPHAubG9iYWN6QHdlbG90
ZWMuY29tPgo+ID4gLS0tCj4gPiAKPiA+ICBtZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0ZS5iYmNs
YXNzIHwgNiArKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0
ZS5iYmNsYXNzCj4gPiBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJiY2xhc3MgaW5kZXgg
MjY3NmYxOGUwYS4uNWFlNmY1MTVmMiAxMDA2NDQKPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy1nbG9i
YWwvc3N0YXRlLmJiY2xhc3MKPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJi
Y2xhc3MKPiA+IEBAIC0xNTIsNyArMTUyLDkgQEAgcHl0aG9uICgpIHsKPiA+IAo+ID4gICAgICBl
bHNlOgo+ID4gICAgICAgICAgZC5zZXRWYXIoJ1NTVEFURV9NQU5NQUNIJywgZC5leHBhbmQoIiR7
UEFDS0FHRV9BUkNIfSIpKQo+ID4gCj4gPiAtICAgIGlmIGJiLmRhdGEuaW5oZXJpdHNfY2xhc3Mo
J25hdGl2ZScsIGQpIG9yCj4gPiBiYi5kYXRhLmluaGVyaXRzX2NsYXNzKCdjcm9zc3NkaycsIGQp
IG9yIGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoJ2Nyb3NzJywKPiA+IGQpOiArICAgIGlzX25hdGl2
ZSA9IGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoJ25hdGl2ZScsIGQpIG9yCj4gPiBiYi5kYXRhLmlu
aGVyaXRzX2NsYXNzKCdjcm9zc3NkaycsIGQpIG9yIGJiLmRhdGEuaW5oZXJpdHNfY2xhc3MoJ2Ny
b3NzJywKPiA+IGQpICsKPiA+IAo+ID4gKyAgICBpZiBpc19uYXRpdmU6Cj4gPiAgICAgICAgICBk
LnNldFZhcignU1NUQVRFX0VYVFJBUEFUSCcsICIke05BVElWRUxTQlNUUklOR30vIikKPiA+ICAg
ICAgICAgIGQuc2V0VmFyKCdCQl9IQVNIRklMRU5BTUUnLCAiVHJ1ZSAke1NTVEFURV9QS0dTUEVD
fQo+ID4gICAgICAgICAgJHtTU1RBVEVfU1dTUEVDfSIpCj4gPiAgICAgICAgICBkLnNldFZhcign
U1NUQVRFX0VYVFJBUEFUSFdJTERDQVJEJywgIiR7TkFUSVZFTFNCU1RSSU5HfS8iKQo+ID4gCj4g
PiBAQCAtMTY0LDYgKzE2Niw4IEBAIHB5dGhvbiAoKSB7Cj4gPiAKPiA+ICAgICAgICAgIGQuYXBw
ZW5kVmFyRmxhZyh0YXNrLCAncG9zdGZ1bmNzJywgIiBzc3RhdGVfdGFza19wb3N0ZnVuYyIpCj4g
PiAgICAgICAgICBkLnNldFZhckZsYWcodGFzaywgJ25ldHdvcmsnLCAnMScpCj4gPiAgICAgICAg
ICBkLnNldFZhckZsYWcodGFzayArICJfc2V0c2NlbmUiLCAnbmV0d29yaycsICcxJykKPiA+IAo+
ID4gKyAgICAgICAgaWYgbm90IGlzX25hdGl2ZToKPiA+ICsgICAgICAgICAgICBkLmFwcGVuZFZh
ckZsYWcodGFzaywgJ2RlcHRhc2snLCAnCj4gPiB0YXItcmVwbGFjZW1lbnQtbmF0aXZlOmRvX3Bv
cHVsYXRlX3N5c3Jvb3QnKT4gCj4gPiAgfQo+IAo+ID4gIGRlZiBzc3RhdGVfaW5pdCh0YXNrLCBk
KToKPiBJIGRvbid0IHRoaW5rIHRoaXMgZGVwZW5kZW5jeSBpcyBlbm91Z2ggdG8gZW5zdXJlIHRo
YXQgdGhlIHNldHNjZW5lCj4gdGFzayBmb3Igb25lIG9mIHRoZXNlIHRhc2tzIGhhcyB0YXItbmF0
aXZlIHByZXNlbnQgd2hlbiB0aGUgc3N0YXRlCj4gcGFja2FnZSBpcyBleHRyYWN0ZWQgZnJvbSBz
c3RhdGU/Cj4gCj4gQ2hlZXJzLAo+IAo+IFJpY2hhcmQKCkhpIFJpY2hhcmQsIHByb3Bvc2FscyBh
cmUgd2VsY29tZSA6LSkKCkJSClBpb3RyCg==

