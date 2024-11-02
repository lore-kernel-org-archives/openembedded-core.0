Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5380E67810
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 20:43:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web11.24631.1730580173906866060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 13:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=cOwCpG0X;
 spf=pass (domain: axis.com, ip: 40.107.21.72, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agRW1UiWqxwy44C+U/uGhjWRxMVPEDHDspeEWY89fnCq0+uXS0dclaekE6gK8mhnsAd0Zq0QGBfnBjasXhwXK7ipsaSEruh6CUrmYGz5OLSmW9CzrHVPFexLprJyVQVCpkR2vn1c9Hdya2/UOZo+ayBb4h8RsHVJ4K3kfIAtvnWJv+GE90tB6DU30Xf/TPe05ffldUPFQYFrjFCsU38Wq7gbbHYmdSvxiqh7cP2eBpcQbxrrwETpuBE6+l8cS2+WCDsopSqcjIoKloUqXQ8jWIAMmjxfY0EUtvI4r/EJNBpSEYQUdcO8M/OLEQjcCCmZli6eiW3krDBoH3uMR+r2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu2QKbrV5w4ja1wPW7e5lLugOaZ1t2+/5uP8zE4/TgQ=;
 b=I5nwGWDzejQn/qLVkx9/oPap0CfERAK4fBMvpeAIdrB2jWCXci3iZOjzqG6LRlugzl/HZCfD/ZyA1vrGxm3q+TZKxQ95+bqqUPAW497N5wf3+483WHaJ9vDFT2Z91EHCj16SxAW2LkFBL5eYjgqzpjoqFAOKxy+Lb8LTbLfhYP83Nfw+NloJA7/yFD5B2aVuUceY7DLE378FbpNNNteziM8Mtgimw/CyX4BGyP3n/jN5Jy3ko43OKy0m581UlynmR4HExl7OCLmaQhbjEG0yPFm+oiaHalZ/8m1Kjo6eJbCITE2Ex5pYUqoUDMuQGjwNj7R86lVXXsSivpKmWMFkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu2QKbrV5w4ja1wPW7e5lLugOaZ1t2+/5uP8zE4/TgQ=;
 b=cOwCpG0XpvTsj9qeAAOmO22EGAYspOpMqWsrPXmqMTC+Q+H4xk3T+0GapJW//x+lS+gYytp4IKc72kItMWYrlUCKLuB5a/i3ODPwC89fI2P93geSFN4Y/z1iJZmwdhJOA1EtabcPhw6rvPnZZ6jxSw3XQ0CEdmPzv1ql3PhPnrE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6315.eurprd02.prod.outlook.com (2603:10a6:102:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Sat, 2 Nov
 2024 20:42:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8093.025; Sat, 2 Nov 2024
 20:42:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?RW5yaWNvIErDtnJucw==?= <ejo@pengutronix.de>, Andrej Valek
	<andrej.v@skyrain.eu>, Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "yocto@pengutronix.de" <yocto@pengutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 2/9] busybox: disable defconfig options from
 simpler fragments
Thread-Topic: [OE-core] [PATCH v2 2/9] busybox: disable defconfig options from
 simpler fragments
Thread-Index: AQHbKRPaRijNcafrWU2rEjjKzeTrG7Kb306AgAAZ/oCAAfTUgIAAR0GAgAZHF2A=
Date: Sat, 2 Nov 2024 20:42:49 +0000
Message-ID: 
 <DB5PR02MB10213A928BE2606FD8973AD90EF572@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241028082913.418505-1-ejo@pengutronix.de>
	 <20241028082913.418505-3-ejo@pengutronix.de>
	 <824ea7ce-b5d0-4da3-8e3d-5445373e1e9a@skyrain.eu>
	 <6649f86317aa3a1eafdb3d98c7f814b6e4807d94.camel@pengutronix.de>
	 <203632ac-7a95-40db-aaab-54bca3861e52@skyrain.eu>
 <89c6f62a6000f38d58a5bb547c03fa0d18cdc6fa.camel@pengutronix.de>
In-Reply-To: <89c6f62a6000f38d58a5bb547c03fa0d18cdc6fa.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6315:EE_
x-ms-office365-filtering-correlation-id: 04c50842-da9b-4a9a-4bd5-08dcfb7eea3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RG42dVhCNlIwOGVrYklkWWtwM3ErRVdXTlZyU3pka25ITmt3Y0xCMVJyYld3?=
 =?utf-8?B?Z3Zldm45bDUwdjZLb01mYzJyRkwySEk2TnFRUllacXRYTjZ6TG5LN05QS2hB?=
 =?utf-8?B?cVNEbjNkN1FTYlpBWnNFT01SblNlZ2ZDcEJLNTZwR3BYbzVPUk9xVm45emg3?=
 =?utf-8?B?aWhtMHpTK2hhcGFyNkdaS1ROZjZzQUNlTmNDMythdGZTb044T0srdVVjcnZY?=
 =?utf-8?B?bFRoUmtEUWErT1F3NGQ2TnE4RldETVJNSGd0QWpnbTc3UHFWMUx1TC85K2Vu?=
 =?utf-8?B?alp6VHdTUlRBV1RsZTJMQUMvZlJTWkk0RG10OG9lNWpISDRZRDBIbU40aVZY?=
 =?utf-8?B?ZDdxeE56V05RWktzeFJ2ckdpWWx3R2FvQTdVNkR6WXdaUGpUNFhyNFlUTmo2?=
 =?utf-8?B?T0UrK1NRa05zd2dENGovQmJsY05kS09FY3VWdXprLzNyUGlmd2UxbUoxUzRG?=
 =?utf-8?B?OGVKTGlLRVpycE9kbnY4T1FYWlhSbG9MOVR5SnE0VFRxMHY2Q2lJY3VjNmMw?=
 =?utf-8?B?SXAzaGUyenR4SW5zVzFnc1VaUUJIRm9DS2RrdTNNcTgzSVcwT1pkNUcrU1h0?=
 =?utf-8?B?OVBqSDlmOVRSRXR2anFvRmFUQnEvbS85OGd1aFdCd1E1MXJ4dWNYSGhiMzFH?=
 =?utf-8?B?NVdPSDN1dlczbXJ3NkdaNS94eEZ4b3Rwa3V4Q1U4UlJUUS9RZWFqeURMaVRp?=
 =?utf-8?B?eXYxWEVBc1h4YmF4Ri93ZzNDTjRUSXlodEgvYzhNRGhPRS9VMkZyYWlQUFc1?=
 =?utf-8?B?djcraHh3MjlpaVNOcWtpOXpXcGRlajJ0SldSai9xRFZhYjFRdUVQRVVPdkFJ?=
 =?utf-8?B?NVRKSjBrUGxUYVB4YWE4Ym9kWEl4VkhmV1FUeWxkK3Q1SVk4SWV2U1UvR2Zo?=
 =?utf-8?B?YitLWHNWaVJsVElVZ2tyKzRia2p1d1h6N2lLblpLSVNLTjlndks2c3FNL1JI?=
 =?utf-8?B?TnZxSlNzN29nYU43R0liLzVSelM1VXI4em0wcjA3bUM5SWQ3Tk5MS0g2OWht?=
 =?utf-8?B?SUp3Z1JMK3V4TWZ5OEU1enNUWG0zcVdMYzROQmtrLzNEb08vM2JSdjBUQTJS?=
 =?utf-8?B?WHladEdmbnViSU5SbytiZlRZUThQbFhPMXRFSFF1aEI1SG93MlpOcmppWkI3?=
 =?utf-8?B?b1dZOHhNckgxVVJ5SlgrOHNFNWljTUQvNEFqeE8vaXZST1NLVEVHSWVkZTE3?=
 =?utf-8?B?akU1RTRkdlQ5cThxYWYwakFCcS91WVUycUhqTjhuMVlxMVRlR3lmWGdMbjYw?=
 =?utf-8?B?UnBpTjNpRkpmUGhEODJYSVIxTnZhYjh5SmpBdFRoaGhodjIrRzBBNE1BVGpG?=
 =?utf-8?B?R3htNGJybWtrWjdsOTdNaDFBb1o0UkY1OFZ4WUFHTzdVWE9vTGhDQjBtN2Fu?=
 =?utf-8?B?WlptMXVzOVJCdTdtZUxwMk5JYi9NeHBmZkxCS3NiNXVYQ2dNZWNkODF6enRU?=
 =?utf-8?B?NkRKVE05L2dtc3JqU3NpRzRyOFZFL1RZTWc1dVlUVi9vUmN6NFFtODVmRWFS?=
 =?utf-8?B?SldUWTZNNXhENVkvYnEyODRxQjNEMFRnZk93OVl1QWtsclBHZG8rM2lCbkl3?=
 =?utf-8?B?SG1TZlQyc0tCL090eWxJOWJ0ejFOZ05DNW13T1pwNjFBRGZ1WEgyOW1UbG1U?=
 =?utf-8?B?d204NkU5YUFlZEVISDNlbDdWdEZWUEcxRy92aGlDdEFoYXZyOVY4RVBMOTlI?=
 =?utf-8?B?dDdIWEhQOU12OXN2bFFOSGtyMGdQd2tEY1IzZHExbUtOQW5oTnZQOTZzOHBZ?=
 =?utf-8?Q?iYmScATLc6IkwrqunFypq8IRepW9FjkE57s8kQw?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzM1OWRjdzJoOGEyTXY2NVQ3VlRBWU8xYkNVZ2xsN0xZakgya1JOU3o2RkYv?=
 =?utf-8?B?R1Y2dS9rUEE4NnVqK2VOYUNjT3dnVDcxZm9WbzI5NG1EalJFSVc0a0wrVGRx?=
 =?utf-8?B?cEZrRkZSU0txWHJGdG1LejhLcVZNbHVTR3FyN1AvMlJjRE5GVzQ0cFMvQVBp?=
 =?utf-8?B?Slo1dUJvTEZDcnZOMDVEa0RmNWI4Qkx1QVYyNGw2elU1NWxzdFZVWU9BeEsr?=
 =?utf-8?B?VzNWN1lpQlc0T3BpcU0vTk9WUjVOblpFbXpNTG9WM0xwV0xlVTlxU3RJUTNi?=
 =?utf-8?B?UkZ5WW9IaFE1U3FqNEpuNVJCcE1Iem0vMzJXU1U4NXZtSDM4Z1k5WnpKT21U?=
 =?utf-8?B?cWs4Zi9MK1luYnNMTXZIOFA2c1BCZlB3OWltdkZZYWxpMVN1TFMzM1FzTjJK?=
 =?utf-8?B?c294U3g5NEZQTU42WFErZTJwbVdPT1lCblNydVFDaVd6M1VDMnkxRktDbWQr?=
 =?utf-8?B?SVlnUi9oTWk0c0NzL09EM3djbFFmYk5XQTZkUnVGaDhNbWVCQi9lR05HcEFD?=
 =?utf-8?B?Ym13SzhPeGRGa0dXSDgwdDgyQnd3NzE2NGNvVEl0RVpRN3dxVDlaYmh6bUVN?=
 =?utf-8?B?dldmd1ZUQmxRK2ZQeWJsR3ZidDhGZ1FhZzVHaHg2RVdIM2hJQjZ6TzNNYmFX?=
 =?utf-8?B?cG5OVTl5ZmJmNU1GMVFGWmk4VFNqblk3bk9ITm42SVQ5MGsrVmlQZHMzdE5q?=
 =?utf-8?B?NEs5bDU1Rm5OL0FKUm1XaloxQitITmNZRUdQK242ZDZxYTZRcmE5SjhyNHJa?=
 =?utf-8?B?Z1BsYW9aTXlWY3dPTXN4L3ZFbENQVFRaL0dFZ3V3QWtkVjBNdm1TbW5RU1hD?=
 =?utf-8?B?MEhXWTNCQ2dvSHYzcE9YZmcyN1JKRGxtOVpFc2VkVVk4MVdJb0NLaGdFRjVJ?=
 =?utf-8?B?WFFHNVphMUdHUFQ4ckplZHZWcWxaQnBpQUdFVkVXNEpDRUp5UWxOUHRodzNt?=
 =?utf-8?B?SElQYWhPODJNcjNMUlRjYXY5UVdsWWJiQTV6V01ILzR1MmZ4enJmazBzN01y?=
 =?utf-8?B?NjFEd2ZPVEFta3hHNkxPNFZSdk9tZktrZjB0RGpYQ0lvZ1ZJV0RIU09EVDNO?=
 =?utf-8?B?cFF2MGo4L2lRVktPMjVZVGttVm8vY0xDMFVDc2o4SDZWamNkQVlXb0x2Vlhz?=
 =?utf-8?B?NlJzVFJzYmtaT1QzcGlCVlRzT0FJOEhZNVZ5RVhGdUlvV3pqOThBTnFvRHU5?=
 =?utf-8?B?WlIrdGNkaEVCc0lwWlhMRFhUMnRLZnB4cXFHd2hKSnU2eEhaaEswbU9nZCtm?=
 =?utf-8?B?K0NkcjBkcVBVUWR3c3gwUEFQbWthM1lyNDlXQ2pJcjJpZmdsejJSd1dneG1v?=
 =?utf-8?B?MDdldlV6ZmtNb1dqbExUQWpQb0RKZ3VjV29wQ3NhL0pvaCs2N3YrR1RWY0p0?=
 =?utf-8?B?aFg0NUY3YVJ3bVJOUDBaRmhCY1gxdTRzaG00TUVPbWFEaW1HV09ZSEk4bnpt?=
 =?utf-8?B?WU5BdEdGcEdkOFBRdmZjd3Z0NW14ZjRNVzUxczlTVG5xOHNHMWcwL2FNM01I?=
 =?utf-8?B?OExab3BjQjFkKzR4Sml0ZERueDZLOE9rT2FNelQ0L2NWQkduMEQraTNOY0ZW?=
 =?utf-8?B?K1NGUW94MjJ5eXBIeHkrbTYrdCt6NnlEcWJ4Tk9xbytoQldNQUd0Smk3Ymth?=
 =?utf-8?B?Ky9BaVFoc1JFbVNYSWI1RXBaaXp3UDg3OG8wdFJQekpZVGZTM3BZRkUxMXkw?=
 =?utf-8?B?azNXODNlTGYwTUxoNG1VYzRPYkVIQUxLU1lzOVBvcFBSdlpvU21tS0d4WXJT?=
 =?utf-8?B?SnJxUlE5WG1ZMFlkK09HOHRPZWF3MkJGaGJiNlkwZWFid1gzWXo5TitsM3BT?=
 =?utf-8?B?RFZXMFFVNFNNbWh1TFVSaFg4NTJqd0hGS3BkbWM0YmJ0YXJVcE8xUlVnSU56?=
 =?utf-8?B?VnRvcTJkWTJ1UjVGQkU4VnRVdXBrWHZYNFhwV1VWT3dJa3lJK1hoaGtpQTEx?=
 =?utf-8?B?YllJZS9YejFiVFhNcGRWNExrMFJxRVl0MERHZ2RuYURmQThvbzd6RkZWUVM3?=
 =?utf-8?B?SHAyZzlKM0J6cFBXdmIwcld0SWprZS9SK280a0lrclM2N1dKeGU5N1RNRnlw?=
 =?utf-8?B?YUdhQVMwZmtwd2pTeFhFOTZUdTlDdVgvMFZWZ2RqMG9EOE8xZzhucVZHS2ll?=
 =?utf-8?Q?qX6s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c50842-da9b-4a9a-4bd5-08dcfb7eea3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2024 20:42:49.4109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IWNEJvyuWZtsP59yT1e/EwIgUbw+DUxpaRPa9Jv2e+M7QpTAeIfoRdyky46+MMrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6315
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 20:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206656

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgRW5yaWNvIErDtnJucw0KPiBTZW50OiBkZW4gMjkgb2t0b2Jl
ciAyMDI0IDIxOjQ3DQo+IFRvOiBBbmRyZWogVmFsZWsgPGFuZHJlai52QHNreXJhaW4uZXU+OyBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6
IHlvY3RvQHBlbmd1dHJvbml4LmRlOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyIDIvOV0gYnVzeWJveDog
ZGlzYWJsZSBkZWZjb25maWcgb3B0aW9ucyBmcm9tIHNpbXBsZXIgZnJhZ21lbnRzDQo+IA0KPiBI
aSBBbmRyZWosDQo+IA0KPiB0aGFua3MgZm9yIHlvdXIgcmV2aWV3IQ0KPiANCj4gQW0gRGllbnN0
YWcsIGRlbSAyOS4xMC4yMDI0IHVtIDE3OjMyICswMTAwIHNjaHJpZWIgQW5kcmVqIFZhbGVrOg0K
PiA+IEhlbGxvIEVucmljbywNCj4gPg0KPiA+IE9uIDI4LjEwLjIwMjQgMTE6MzksIEVucmljbyBK
w7ZybnMgd3JvdGU6DQo+ID4gPiBIZWogQW5kcmVqLA0KPiA+ID4NCj4gPiA+IEFtIE1vbnRhZywg
ZGVtIDI4LjEwLjIwMjQgdW0gMTA6MDYgKzAxMDAgc2NocmllYiBBbmRyZWogVmFsZWs6DQo+ID4g
PiA+IMKgwqBIZWxsbyBFbnJpY28sDQo+ID4gPiA+DQo+ID4gPiA+IMKgwqBJIHRyaWVkIHRvIGZv
bGxvdyAoYW5kIGFwcGxpZWQpIHlvdXIgcGF0Y2gsIGJ1dCBpdCBsb29rcyBsaXR0bGUNCj4gYml0
IGluY29uc2lzdGVudCB0byBtZS4gSW4NCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGZpcnN0IHJvdW5k
IHlvdSBlbmFibGVkIFNIQXhfSFdBQ0NFTCwgd2hpY2ggaXMgYnJva2VuIG9uIHNvbWUNCj4gYXJj
aGl0ZWN0dXJlcy4gVGhhdCdzIHRoZQ0KPiA+ID4gPiByZWFzb24sDQo+ID4gPiA+IHdoeSBpcyBk
aXNhYmxlZCBieSBkZWZhdWx0LiBPaywgc28gZmlyc3QgYXBwbHkgbG9va3MgbGlrZSB0aGlzOg0K
PiA+ID4gbGV0IG1lIHJlcGhyYXNlIG15IGNvbW1pdCBtZXNzYWdlLg0KPiA+ID4NCj4gPiA+IFRo
ZSBTSEF4X0hXQUNDRUwgaXMgYnJva2VuIG9uIHNvbWUgYXJjaGl0ZWN0dXJlcywgcmlnaHQuDQo+
ID4gPiBIb3dldmVyLCB3aGVuIHlvdSB0YWtlIHRoZSBkZWZjb25maWcsIHdpdGhvdXQgdGhlIGZy
YWdtZW50cywgaXQgd2lsbA0KPiBjdXJyZW50bHkgYmUgZW5hYmxlZC4NCj4gPiA+IFJlZ2FyZGxl
c3Mgb2Ygd2hhdCdzIGluIG15IHBhdGNoLg0KPiA+ID4NCj4gPiA+IFdoeT8gQmVjYXVzZSBDT05G
SUdfU0hBMV9IV0FDQ0VMIGluIEJ1c3lib3gnIGtjb25maWcgaXMgJ2RlZmF1bHQgeScsDQo+IGhh
cyBubyBkZXBlbmRlbmN5IG9uIG90aGVyDQo+ID4gPiBvcHRpb25zIGFuZCBpcyBub3QgbGlzdGVk
IGluIHRoZSAnZGVmY29uZmlnJyBmaWxlIHNvIGZhci4NCj4gPiA+DQo+ID4gPiBUaHVzLCBteSBm
aXJzdCBwYXRjaCBzaG91bGQgbm90IGNoYW5nZSB0aGUgY3VycmVudCBzaXR1YXRpb24uDQo+ID4g
T2ssIEkgc2VlIHRoZSBwb2ludC4gU28gYmFzaWNhbGx5IHlvdSBjYW4gZHJvcCB0aGUgc2hhMXN1
bS5jZmcgYW5kDQo+ID4gc2hhMjU2c3VtLmNmZyBhbmQgbWVyZ2UgaXQgdG8gZGVmY29uZmluZy4g
VGhlIHJlc3VsdCB3aWxsIGJlLCB0aGF0IHRoZQ0KPiA+IGFjY2VsZXJhdGlvbiBpcyBkaXNhYmxl
ZC4NCj4gDQo+IEp1c3QgdG8gZ2V0IGl0IHJpZ2h0OiBEbyB3ZSB0YWxrIGFib3V0IHRoZSBIV0FD
Q0VMIG9ubHkgb3IgYWJvdXQgZW5hYmxpbmcNCj4gU0hBMVNVTSBhbmQgU0hBMjU2U1VNDQo+IHVu
Y29uZGl0aW9uYWxseSBhbmQgZnVsbHkgcmVtb3ZpbmcgdGhlIGZyYWdtZW50cz8NCj4gDQo+IFBl
cnNvbmFsbHksIEknZCBiZSBmaW5lIHdpdGggdGhpcyBzaW5jZSB0aGUgYWxnb3JpdGhtIGFyZSBx
dWl0ZSBlc3NlbnRpYWwNCj4gYW55d2F5Lg0KPiANCj4gSWYgdGhhdCdzIHRoZSBvbmx5IHRoaW5n
IHRvIGNoYW5nZSwgSSdkIHN0YXJ0IG1ha2luZyBhIHYzIGZvciBpdC4NCj4gDQo+ID4gPg0KPiA+
ID4gPiDCoMKgQW55d2F5LCB0aGVyZSB3YXMgb25lIGNvbW1pdCBpbiB0aGUgdXNwdHJlYW0gd2hp
Y2ggd2FzIHRvdWNoaW5nDQo+IHRoZSBhY2NlbGVyYXRpb24uIFNvIEkgaGF2ZQ0KPiA+ID4gPiB0
bw0KPiA+ID4gPiB0cnkgaXQgb24gdGhlIGJyb2tlbiBtYWNoaW5lIGFuZCBzZWUgaWYgaXQncyBz
dGlsbCBicm9rZW4gb3Igbm90Lg0KPiA+ID4gSWYgeW91IHJlZmVyIHRvIG9lLWNvcmUgdXBzdHJl
YW0sIHllcyB0aGVyZSBoYXZlIGJlZW4gY2hhbmdlcy4NCj4gPiA+IFRoaXMgaXMgd2h5IEkgbmVl
ZGVkIHRvIHJlYmFzZSBhbmQgcmV3b3JrIG15IGJyYW5jaC4NCj4gPiA+IE9yIGFyZSB0aGVyZSBv
dGhlciBjaGFuZ2VzIEkgYW0gbm90IGF3YXJlIG9mLCB5ZXQ/DQo+ID4gTm90IHN1cmUgaWYgeW91
IGNhdWdodCB0aGUgcG9pbnQuIEkgbWVhbiwgdGhhdCBJIHdpbGwgdGFrZSBhIGxvb2sgb24gdGhl
DQo+ID4gdXBzdHJlYW0gZml4ZXMgZm9yIGFjY2VsZXJhdGlvbiBhbmQgdGhlbiB3ZSBjYW4gZW5h
YmxlIGl0IGJ5IGRlZmF1bHQuDQo+IA0KPiBPaywgc28geW91IHJlZmVycmVkIHRvICpidXN5Ym94
KiB1cHN0cmVhbSwgbm90IG9lLWNvcmUuIEdvdCBpdC4NCj4gDQo+IEkndmUgZm91bmQNCj4gaHR0
cHM6Ly9naXQuYnVzeWJveC5uZXQvYnVzeWJveC9jb21taXQvP2lkPWJmNTdmNzMyYTViNjg0MmY2
ZmEzZTBmOTAzODVmMDM5ZTVkNmE5MmMNCj4gSXMgdGhpcyB0aGUgZml4IHlvdSByZWZlcnJlZCB0
bz8NCg0KSSBoYXZlIHNlbnQgYSBwYXRjaCB0byBiYWNrcG9ydCB0aGUgYWJvdmUgY29tbWl0LiBJ
IGFsc28gc2VudCB0d28gcGF0Y2hlcyB0byANCnJlbW92ZSB0aGUgbm8gbG9uZ2VyIG5lZWRlZCBz
aGFfYWNjZWwuY2ZnIGZpbGUsIGFuZCB0byBjbGVhbiB1cCB0aGUgc2hhKnN1bS5jZmcgDQpmaWxl
cy4NCg0KPiA+ID4gPiA+IFsuLi5dDQo+ID4gPiA+DQo+ID4gU28gaWYgdGhlIHJlc3VsdCBpcywg
dGhhdCB0aGUgY29uZmlndXJhdGlvbiBoYXNuJ3QgYmVlbiBjaGFuZ2VkIGF0IHRoZQ0KPiA+IGVu
ZCwgSSdtIGZpbmUgd2l0aCB0aGUgY2hhbmdlcyB5b3UgZGlkIDspLg0KPiANCj4gU291bmRzIGdv
b2QhDQo+IA0KPiBSZWdhcmRzLCBFbnJpY28NCj4gDQo+ID4gUmVnYXJkcywNCj4gPiBBbmRyZWoN
Cg0KLy9QZXRlcg0KDQo=

