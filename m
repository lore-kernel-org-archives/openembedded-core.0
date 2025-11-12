Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FD4CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 10:13:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10340.1762942416204970173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 02:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OFfFoRyt;
 spf=pass (domain: axis.com, ip: 40.107.159.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqDuLwcel6oC2L3F5SDQMJ36GHWIAdTVYSE9dhqFDAIzW3N2gkPb8A1r0P+E8ryCTebWv0XBZkFU1F68sIUW06JZjI4AVII3pZgQJZLdI5Xljvwi55KdDT2qdSUvmE3xaJoIL27knBVl6Wsv1nwWvHBazdhq4flvcPkc8NbdNjp/9WubpD65eOv3ENwYjn+Agh6Njt6UJPFYG+5T1ZUxEWy5EQ11BOgd0egwJbJokVckSuM3pTMqNE2cZyRJ8Ay9iyQ+jbMSbkAj4Co7qMhW9ldYZTbB+f/wD9nqapl1koaIvlZVg6FbyWIBLdlpFTKFBK1X09Saqb8CLvcgRa9zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRqJokzajkOGnpOKIFF6418QlC7fTVqjkNk/yOcNg+U=;
 b=iCaZ8iWtHsnOfg5zVrxuiLKJNXGhlcPjqemF4fMuNhXjFk+i9wm+1wVENiiX/sAw2q9ONH0sdQ8qaBT1N58NJCf7Ff3LqBhPYVQTSf92/d9LYtNopgVVfARf/naYr7D4wkF03llDGLL0ocy+XoanRwgHSllfveZu+b6MgfrZ1iBnsqxxIfIcEoiBrsJd1Rlq4+M1Oohci/pf5lPGVpRI0IAFE5t6o5UfIAQFkx4r0yfroso5Ap5CMjHiCt1Gx3RJnf2CUgOFSgs7WqtH1OUq9j7NxTnfL7797mPiA5vhACufuTI4owrF7r/HkLwzaaPvh0qswqbMXFBtmlewwkB6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRqJokzajkOGnpOKIFF6418QlC7fTVqjkNk/yOcNg+U=;
 b=OFfFoRytI1OFdJPSltYUV62wNogKkkTZhNp1xL8QX+dVCde7cIQWjcnkhA0LBuu64HUtf+8GjR3ouTOq5bZpIFo2R1PXdJkjMRGFf8KW7G4/Jg7rPXVnTy9JXL5s+zBwpv/BsvZqJR7Nj69q/ULWd97hZ893zD+hUZaiPVEmvHg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAVPR02MB9498.eurprd02.prod.outlook.com (2603:10a6:102:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 10:13:32 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 10:13:32 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>, Ming Liu
	<liu.ming50@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Topic: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Index: 
 AQHcUZ8YgASIDXTtkEGiA67xOq74a7TsMrGAgADxYYCAACpbgIAADtUAgAABCwCAAXYuQA==
Date: Wed, 12 Nov 2025 10:13:31 +0000
Message-ID: 
 <DB5PR02MB102138544250F88461757114FEFCCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251109173407.1320188-1-liu.ming50@gmail.com>
 <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
 <CALatG=4+sV9MoTfpOPmefjwRKNLdYVeJfgKj8X=qQc7EuJyipg@mail.gmail.com>
 <6EDC1CB7-B6A3-418C-B5A7-3127BA73C754@arm.com>
 <CALatG=6AR5oSJL7GhhCVZAfu4vGecXj3=nh03nPxv4YBHzcNEQ@mail.gmail.com>
 <CD811BB8-6C3E-4423-9202-1F2E0B07CB37@arm.com>
In-Reply-To: <CD811BB8-6C3E-4423-9202-1F2E0B07CB37@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB9498:EE_
x-ms-office365-filtering-correlation-id: b07eea2f-d6dd-490b-4e74-08de21d42200
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cVkzd0M2WGtqaWo0dWdPc0xyNWFHMG1PNy8weTVsdW1ua2FwZVpBVXF2ZHhy?=
 =?utf-8?B?VmgwbDU4ckJ3a2pSOHUvYlRLUS83VVlBNTRIUzNLNERpY1V6S21lbDdXaWJE?=
 =?utf-8?B?dk8yYWpoVWFESENpWUw3Qnc1MUszYkRWZUE0OWxQTlBCak1rUnNaVzl5VC9T?=
 =?utf-8?B?TjMzZUQyRENLbEN5cjhkN2J0cENsMlVWU2ZtQnUzaC9jaTVEWWtoUGYzRHdI?=
 =?utf-8?B?emUwRXFRUDJLVG9XNytmeXgzdTltbDFRL1A0bkhmYktZOGxWUGUwd0xVMWow?=
 =?utf-8?B?YnRHNEYwWTF2Z0JjMVFURGl4eUVhNU51SjJYcW5GRWQrbTdzaE05bmtNOWtl?=
 =?utf-8?B?SU1nVUNsc0g2UXgrUi9xZGdITHZLVUZhYmVia1FjOXdzNzNmVVoxbFB5dXpM?=
 =?utf-8?B?VlYzK0t2dkc3VWYwYW1raTF4YTV1TmhJWWViL2h5RXdZOU96c05yQXYzN2sr?=
 =?utf-8?B?cGFuajJBTVJMV3h2bFVVZU42NW01am9mUHMxcFRWYzAyRUtDS1IwcHpmOEt2?=
 =?utf-8?B?bDJzRFpBRENMa3RnMGMzL1EzMTdWQzNiSGJlRlBlQVoxVTExUm5Yb2tRc3Q2?=
 =?utf-8?B?TVp5bHk5WmJWK2hsNTd0N29KYzBxWG8xWUlnVlRvNkJicGdYTDFVU1NWZ2Y3?=
 =?utf-8?B?aU8vY1dhTFEvdHRNYUpqYythdkdwdzk1NXVHSmpLczRSVEdyTUxhYW9PNk9M?=
 =?utf-8?B?bHpMQkZxR0RyMEpEcVVJakVzY2wvSDhqNGdhSDI4TUtNYnQrRnA0Mlo2VjJj?=
 =?utf-8?B?NzYvVDRDTHEvT3ByTEMrTFdheHh3cWExU0RPL1lFeml2Yy9TWk55QW1sbkU2?=
 =?utf-8?B?Qkc4ZkNyMXFKRGJHemZvOUhNOEFMdUx6MTlwWmU4Qk5KRHVrSGZ6MWJGd3ht?=
 =?utf-8?B?UkdxMjB4U2xyL0dnb3BZMllRbzRCSlo5MEo1ZklYVEI2TjRsRGpXRHY0ZlJz?=
 =?utf-8?B?aitSZ2JkS0NyT2FTK3lTejNwbENlcHhRb3RBcnZ5RjdPZVhkOGl3RVBUVXAx?=
 =?utf-8?B?dEVmRENPUGJUN2tvNnRKV0hiUWVwOEpHTS9nU0g3N0VFU3RBU3IyOGwwMnBz?=
 =?utf-8?B?bDdIdXllYlUydmI5NzZRb2VxbE50ZFAwMW9pL1JiTmxleStTSTFkem1GbTZa?=
 =?utf-8?B?YWMzUEkwalhVYVpPblF4Q2czYjJjWWZZYlJlNVBUTU0yVmhsWDZEVEl1QnlT?=
 =?utf-8?B?akNCSjMrSnFKaGtjdlhyRkFnTC9lQVNlUDNLRHlwamdkWHdoTHFER2hySUpE?=
 =?utf-8?B?QjRxTEsvMHBKZUhPUGs2Y0IzcWxrK2RELzdCb3cxK0xwdXg2bCtGaGRqQ3RE?=
 =?utf-8?B?b0JwcVlyM2pyODhyR09nOFoxSjA5WFo2REd1ZXM0aGxPaGpoOFJOYXVEbXZD?=
 =?utf-8?B?aDZqSEhBUDY4eER4bS9lN3FPR1NpNHVFeGJybDdITTFlVkVPNkJoU254bjVJ?=
 =?utf-8?B?Skg3VzRrMWdyODI0QnZCYXVYNll6YjNGbUhuK3hOSUh6Y3BTNjZNdVh1cW5z?=
 =?utf-8?B?N3RhUGtzODhqdG9UNlIxNGZwMW54eEpRbEpsMG5hU3B6bFBEaGlNb0R3YnY3?=
 =?utf-8?B?YjlmK1EzYUNNSUsxQXV5UmpWMkhLQ2N2Yk9PNkR0MHFBYzNJeTM3WTMrYlV4?=
 =?utf-8?B?RGxONmxIMjZRQkNmZmI1V0pKQXUzeEdOK1ZocHBCOVB2N0VmY2RSNkkrOHFj?=
 =?utf-8?B?ZUhjWlNSVVJGK0hUZ2x4RGJtQlgzZmt4cGpFemFaOVF6VzY0dTkwZGlhc3o1?=
 =?utf-8?B?TjE5L254UnllU0JVSnJFb2tQZ2lqVzdPVnI5cWF5cEg0Z2FFcjhxc21sUWFK?=
 =?utf-8?B?V2w1MmlRVjBOSWFHaER2L2w4ZkhENUR5WU5xTG51YWJ6eGZsQ0ZEcTlkeFVz?=
 =?utf-8?B?MDl4U0JhcHRFWGswTkYzeHUwMi9qdXdCVFJTL3R4bklldGcwMHllVmRHK2JQ?=
 =?utf-8?B?VW1TbDlQNDE4TWoveFMvVGRmckJNbFU4L0dWREt4UkNKWGVzTExKWElKU3ZX?=
 =?utf-8?B?eTMwaEt6OUt2dXU5NlBYaWRlU2lsbGMyN1REbHRnRW1va2V5SUx1dGM3UEpE?=
 =?utf-8?Q?q/QHhW?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aCtNVFp4Nm83bVRTblpaOTF6dHp4R2srYmEzekpXVXFUVDlUcTgzbzVrdm8x?=
 =?utf-8?B?WEU0TENLMmxLNWgxbnV1allCK0U1Rm9UVHFwZ1FkU0xScHlRck1URmJiQUx0?=
 =?utf-8?B?bmYwREFmdm1LVmUzMXc4RjFvMnhtMUF2dHdBUUV2VXJId2swUTRMT2pzT1Z4?=
 =?utf-8?B?S29FWGNybzVFbDVyM2tYVUVwT2VraFkvU0Z6a3BMTURvRnVQL3hRL0R2aEVz?=
 =?utf-8?B?bUVLWDRlbjVUUC94UzFJeGZ0N3ZGQjVvYWZDN0EzL1I5K045ejltL2d1ZkxF?=
 =?utf-8?B?RjhMWXdJSmN5dmlDTGZkb0RvdGJJMkpxajVUUGllbm9QZHVaaGRneFZJNzZa?=
 =?utf-8?B?a0lnOFFhbHBiWkhXWlFZeVZWcFZ2YzJMWm1OVkNXeWxuK0g4aXMraDhOVVFu?=
 =?utf-8?B?MFZwYTNtdVNrM0FDb0FoK1lTV1pCV3NnOE05M2p5NGU4TXlQVWJxanE2ZVdN?=
 =?utf-8?B?T2hsTDVnSUVhVGVXcEZWWmZxRFF2ZTVkYjAwNm9lNHdhQmVpcXc2UWd3OElz?=
 =?utf-8?B?Wjc5UGFPaFIxbWtrZ0V4Y1c4RWpwSFJ1R0pLS2pJNnIvZTRzTVZWSGgrWVRz?=
 =?utf-8?B?MG5SeVlOb3BtVHV2NFFpMnpueGlSbWlqd1JkK3ZxWS8veE9hOGtBa21KeHkx?=
 =?utf-8?B?MTJ3WENLTE5MS09ITVFmSDA1Sm1URFhtRnlhQWswQjY1eEhJczRiYUFWOWp4?=
 =?utf-8?B?SC9sa1YyaHZ2bXFFa242M0R4UWNNUnhvVHV0ZTlNUm9YeXBKMk5hSzRCU2FS?=
 =?utf-8?B?QXd3bHpOQ00wR2p6VWNHcHFaZTNPbTFKbDRTWnFtNlJmVWRWcU8yVzdzc3dz?=
 =?utf-8?B?NFlhbTUzWS9lZjMvblNpL3NyNndJQlJiTTQxUEZzRjFqVTUvbEJyQnFWOFl3?=
 =?utf-8?B?QnR4aWc2SitldDNYKy82NkRoQUdpR1ZhMy94VTM3N2Q3NjY1TGw1QlJnVFFZ?=
 =?utf-8?B?bEVSNUdpcEJvMUVvVjIxRWcxbURZSlAxSzR5c3lVYVlBa0J4dS9rNVhZOG41?=
 =?utf-8?B?STA0YTBhMkRZdHFNcVpVMDJ1WmpjdUxqYkxKWWZpaHcwdUtlNURVSXQraWVz?=
 =?utf-8?B?dVZ3S0czNXVoUldxNytycUtrYTBIeUtQeC8zb3d4VEFaR0lVWVZWQ0tlWHp0?=
 =?utf-8?B?T2NibGJSZFg0dnBKL2dCbytTY2JhY3FVRVNGM05kcUJOeEhIQm5oODdwQy9q?=
 =?utf-8?B?dE9Bb2pzSHJHWlR0Y0h1M2xQdnMyeUphd1dadVpKSElmN0JPS2V5VW5hTlZK?=
 =?utf-8?B?eVBpTzFHSG9pMWUvTkFWd2tad0RTRnZQK2oramtyVE5MaVhYc0lZQzNmTU9Y?=
 =?utf-8?B?K0JIVFNub1VWd3I5bExJVXROMmVLRUxlVFU1NndtNFQxZGp4MmNOV1VJaUEv?=
 =?utf-8?B?b3VRZVF3UER1Q2g0OW85Y3NZMjhkSnAyUVRZTzljNE9iTlJNMHMzR0Jkc25Q?=
 =?utf-8?B?aSs0NGoyZGtSU1lpQ0xGQXVHa09BaC9wV0kybE54Um9yQUUzTDlCalJUb0tH?=
 =?utf-8?B?d2czL1pmb1ZzQ04xS3IyOGkwSWhYUTVJL244L1NCcWJjTjEwSUJhRkR0ZTVL?=
 =?utf-8?B?WjVuUmE5VXQzYXg4S0tCRU5CelhQUDNnWDRsNDRXcXMzZTJqV0luVWd3RnlX?=
 =?utf-8?B?bmNXaXJQSHh3WHkzcm9vOGloYUM2SmVFUmxncVB0WTByMEpxL1E2THN2am5w?=
 =?utf-8?B?TVBkUlJWaXc2ZXF4RWNQSklnVGhveEw0aTVyVW42Wk5NeHQ1eDZBTGV5L292?=
 =?utf-8?B?SStGMGxvTDBWS3ZubFQ4R1F3RlhJbnk1RnJLSk9QNzdiWHRpQWo0aUY4S3g4?=
 =?utf-8?B?RlY4K0VGSjFJVm5OS0ZiZUtGemcySWI0QU9ZNlJpM09WZDRPd1B6TmFuNU5I?=
 =?utf-8?B?cUVHcmViK0Q2VU5JN1BXZDA3Y2ZHMVdOWjlqcHZ0K3huanIzbHRlQ3FLdjRa?=
 =?utf-8?B?K1B5UU4rbjJRNzZDMUZaWVBERHl6S2NuaFN1NlNyVEFLV25STHEzRHlVTkFw?=
 =?utf-8?B?eUNuQ2o5aWp0aTBCcTBSdEh2RlVpM1RiSWdpcVFSZHR2YTVGQWh5UEVFYUUr?=
 =?utf-8?B?amhwWGVSU1lndFNJUEtGQmlWV1FYNlRyNDA0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07eea2f-d6dd-490b-4e74-08de21d42200
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 10:13:32.0263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVeUZxe44Tdebw/knmaehLSCcUwPDuYxOVfrMPi7/ujlrfwYBih05zH4Ln8EmGl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 10:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226203

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJvc3MgQnVydG9uIHZpYQ0KPiBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiAxMSBub3ZlbWJlciAyMDI1IDEyOjQ2DQo+IFRvOiBNaW5n
IExpdSA8bGl1Lm1pbmc1MEBnbWFpbC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIFYyXSBi
YXNoLWNvbXBsZXRpb24uYmJjbGFzczogcHJlcGVuZCBiYXNoLQ0KPiBjb21wbGV0aW9uIHRvIFBB
Q0tBR0VTDQo+IA0KPiBPbiAxMSBOb3YgMjAyNSwgYXQgMTE6NDIsIE1pbmcgTGl1IDxsaXUubWlu
ZzUwQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSwgUm9zczoNCj4gPg0KPiA+IFllcywg
dGhhdCBzaG91bGQgd29yaywgYnV0IEkgaGF2ZSB0byB1c2UgcHJlcGVuZCBhbnkgd2F5LCBJIGFt
IHdvbmRlcmluZyAiUEFDS0FHRVNfQkVGT1JFX1BOOnByZXBlbmQgIiBpcyBiZXR0ZXIgdGhhbiAi
UEFDS0FHRVM6cHJlcGVuZOKAnT8NCj4gDQo+IFBlcnNvbmFsbHkgSSB0aGluayBpdOKAmXMgYmV0
dGVyIGJlY2F1c2Ugd2UgaGF2ZSBhIHZhcmlhYmxlIHRoYXQgaXMgZGVzaWduZWQNCj4gdG8gYmUg
dGhlIHBhY2thZ2VzIHRoYXQgYXJlIGNvbGxlY3RlZCBiZWZvcmUgUE4sIHNvIHdlIHNob3VsZCB1
c2UgaXQuDQo+IA0KPiBSb3NzDQoNClRoZSByZWFzb24gSSBzdWdnZXN0ZWQgdG8gdXNlIFBBQ0tB
R0VTOnByZXBlbmQgcmF0aGVyIHRoYW4gDQpQQUNLQUdFX0JFRk9SRV9QTjpwcmVwZW5kIGlzIHRo
YXQgd2UgZG8gbm90IGtub3cgd2hhdCBpcyBpbiBQQUNLQUdFUyANCmFuZCBpbiB0aGVpciBGSUxF
UyB2YXJpYWJsZXMuIEhvd2V2ZXIsIHdlIGRvIGtub3cgdGhhdCB0aGUgdXNlciB3YW50cyANCnRv
IHBhY2thZ2UgdGhlIGJhc2gtY29tcGxldGlvbiBwYWNrYWdlIGFuZCB0aHVzIGV4cGVjdHMgaXQg
dG8gY2xhaW0gDQppdHMgcGF0aHMgcmVnYXJkbGVzcyBvZiB3aGF0IGVsc2UgaXMgaW4gUEFDS0FH
RVMgYW5kIEZJTEVTLiBJLmUuLCB0byANCnN1cHBvcnQgc29tZW9uZSBkb2luZyBzb21ldGhpbmcg
bGlrZToNCg0KaW5oZXJpdCBiYXNoLWNvbXBsZXRpb24NCg0KUEFDS0FHRVMgPSsgIiR7UE59LWZv
byINCg0KRklMRVM6JHtQTn0tZm9vID0gIiR7c3lzY29uZmRpcn0iDQoNCndlIG5lZWQgdG8gcHJl
cGVuZCB0byBQQUNLQUdFUyByYXRoZXIgdGhhbiBQQUNLQUdFX0JFRk9SRV9QTi4NCg0KLy9QZXRl
cg0KDQo=

