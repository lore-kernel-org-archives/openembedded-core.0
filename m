Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EEEEFCE57
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 01:12:13 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34014.1772673124898848391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 17:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=fKpi7jMG;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.51, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmoC09zpHxgJfdIKESNURmNep+cyjvkEIQwNYa2iq/3Ue9kXG7Ry0QKwuc/7iBIheFdFg5Lqd/1DLiyLP2xKBZnU8jBtApP7kZzcu0WVQyRdvaElu79b+zmXvVFESbo26K9d9vTAAIpkKcfLvkofB2KdK/X5J/ycIUNIo2FYP/pQ7LuMxqUC9h+tbNYKTu7cz1bWXZXU1EzFYdHgyhP+8p06NRoArs2QRk076ZG2ZQISC41+o1LtYIDYYa7Fp0Da7Fvet+kWK+0otaRBolxPQOfLlzyKqUa6FKdXvHHFXjjr5o2QHZDNiXJmhBKqRY4siIJxXpfAEgDlanRVLROmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+xOJikQYfksUunUyUnOaAmg+yh/fX/9GXGVqHWWnKU=;
 b=GBin3waA3wRnaPi38o5SHlqMzJNmGeo+l8PxszPkpobQSIfl4Rgi6SSG0pgyU+voXBikbx6iiUJvxDqTb/LQgiQxx5tuNNSOc4Tqy/fKGkvX+ulWt872sKpF0EJIQu383/zk7N+pDiKQEi9yo8Tgv+l2CSu1KzSK90GkDJ4VxHcAwvMc5Y6/mKjCf/BBgEl0f6KAtCTxZ9WCP6KkjUWEIklJtcHBJS16Wd82CmX5ikIbFEn5diNekqDcn9kLZ2OPVYMumT186ri1wbfDDWJQG9//aHsvC5o5GasBHfsgv2Wma8IJ181kgWyX79ffc7wwoO6Cc0J2UN3TZLKP4Z5Hxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+xOJikQYfksUunUyUnOaAmg+yh/fX/9GXGVqHWWnKU=;
 b=fKpi7jMGiFhEIzNnnQweUVIPBY57JXA13sTAmEu9rAGkvy/HRIGeqIuRVDA13MQl5q0qfbDAktEFpuqEO1kqZkN4Qa5IjlLzHuPKrp2MZ8BSXyIiVu9cvtRHTxZdRP1nlN7kgu05YepmIh87BGON8EVZ+nBcL+fDxi03D/T6UuULEH43eypdYMCZ78TqNyImnCCIArFQmbEz7NgOnuLvucKNgVvusOcZiIVHaVbm0T3HlyLQfJbjWs5nd2wcAEMwb2i0k5PuceAN2p2x5o30s3tF9ud2AI8gAUEnFnRmF4v1SE65yAXTsJTKC18P/QIuNtIKk32z5TVNcmNZlMMCew==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY7PR01MB13706.jpnprd01.prod.outlook.com
 (2603:1096:405:1ed::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 01:11:59 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8%3]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 01:11:59 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
Thread-Topic: [OE-core] [PATCH 01/10] gst-devtools: upgrade 1.26.9 -> 1.28.0
Thread-Index: AQHcq8IyCOQldprK90agVs2dMwW6MrWepMGAgAAfLQCAAF0D8A==
Date: Thu, 5 Mar 2026 01:11:59 +0000
Message-ID: 
 <TYWPR01MB118615B4D94453B7B4D2F74FEDC7DA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
 <DGU6LGIXFAH7.3NWXCBMVFRKMC@bootlin.com>
 <CANNYZj--kiqDdV+_-qWC1DVegq98nPbkGVTdf5hP8U6yrX6jbA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj--kiqDdV+_-qWC1DVegq98nPbkGVTdf5hP8U6yrX6jbA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NDU2MGZmZTAtZDUzYS00YmNjLWIwYTEtNGZkYjZkMWUx?=
 =?utf-8?B?NzZlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI2LTAzLTA1VDAxOjExOjU1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY7PR01MB13706:EE_
x-ms-office365-filtering-correlation-id: 9860595f-74b8-49e6-229a-08de7a5433c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|1580799027|14052099004|38070700021;
x-microsoft-antispam-message-info: 
 OgiiTQ1q2cZOo/L4tx3MeKGRka7lmA06ooIH5VkPvh4Xf+fkZZT3yCsZZg5TtILKYllSYRedocNIxRlKTLr+7mzTerzP/AHeg9R58S5gxhmSgOw/PbVm3yUbihbrNvQt7dL10hkB6r30AIJ2WDXOvC/X6uFF2I0OdWr6XeD7gMVeIbX+m4XR0e0Z4T+ezSsTTIb87tzfc+eBF1GQsGGU1fbIwZj5Aw931QYpXd7Yl2f+C9invQ3ZRSu+vb0B4ZRNyEHUvaIF0ijInm3zsHWeTNtvGSNoWyfHxCwZN8SU1lf5Gk/O8gVjaIsy5Xalz7jCVHEwfcY2/t2ZJGo86QJpnDzUF8Jl+mZWsndf8QjbzzsXHaToIkQ+gp1zqwolSWplFThDx1v577uBGYro1iPpo+37N/7w2Mg9DuMBwbP1SqkyoESonlNyJa7tYpilwGoDdbPGqG4pEI6++IlIzaVOspgyPfOiBzorOnNiOLDjcWKvi6zKXFqueXxrxxNbmypKKBJdzCth7zNSG0OlzbxUkCo6x00JaCdj/imAnutYlklGQlhm3ICY/bK4QxapqwWzy5GV0/bgwKsXrI8QQWtkLjTZmsrG3erL71NR/wbgoZWggQVfwPVwnfVWSSY4jioWStZWvosfl2tEMhYC/jam/4UyivZqFmaOLrpI91GMcdL4DJoCxR1FxDaJZgDhWaUGTe8omQ83RtBJ7aPdKoq1eFA5XVoScv8xo/IAmChJsj7e018RG9FcJRq6IolapX6i4idMn9vOLxk6IvJ1N0Ay2Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(1580799027)(14052099004)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q3VrbzhDUTdTLzIyUlJ2VmI5YWNPNmFPWk9Fb3pzaGh1MS9vTlRoUG9ZWXQ2?=
 =?utf-8?B?V0N1S0NGRVlSMHdQRi8rSGNYc2dyaS9VS1A2M1NWRjNncE4zV2xOaGtUeEJW?=
 =?utf-8?B?bUx5REdLMUMrZmJwY1MxazNpbE9mekROM21ITWdsS1E4NDRTY1p2VXErYWxR?=
 =?utf-8?B?NnBWME52WlFTSEgydDRrRjZZYnZPUHJ3d3pRcVBHZHRwTUFnZ3U2WDhGZVAy?=
 =?utf-8?B?NmNjZ1JpTlRXNXc5THFjVm91bGtyazN6SmJGS0N1d3JyMmlPTUhEbmw5T0JO?=
 =?utf-8?B?eW44QjNNNU1wRFBMRU5MVHZjM1V6d2F0aGgyYW51OEU5b3ZQdm1iSjhkOVhO?=
 =?utf-8?B?K2NiTk5CSFBPMi8zMkh5QTA1RGlya2V1WXlaRk1DVW1EZ2xBM0E4UjRYR21w?=
 =?utf-8?B?bkFxWTdRYWhab3FndHMvVEFMTjVuTnNmMG1sTXFCbjMzNkJXUWFaNVE2dy8r?=
 =?utf-8?B?RXRsT0ZURWZVUWp0MUhKV1BxVlhaZm9GTzhTR2dlYzdwZ0NWcFpOQkJyZ09r?=
 =?utf-8?B?V3BTcnVCQ3E3dzByRmtnZmhNcVU4a0xSSS8xZ3BGQi9Ua3dsUEs5ZERiT1ZL?=
 =?utf-8?B?dHRwU2k5SHAvV01Ic203a3Frdk9uVTl4aDNudFJqb2xRSG8xd0tZTVdxdGoz?=
 =?utf-8?B?R01EWEJDZ2xXaC9qbytkdlRjSU5oRGJrM1NDQ0JSbXgwL0VQS0g2L2p4ZmhM?=
 =?utf-8?B?SURPWlUwdVJQcS9XbHVPQVNYeDZDcXVvZ0xSaDNSYlE1YUpaMnBSWng1SlFp?=
 =?utf-8?B?UGoyRXRyZENkZ2MrWjd2cmU1czZROFBGZXphZjVXYVo1dXdKemJUcnJRcGJG?=
 =?utf-8?B?eTE2NEY1K3ZhZDljb0R3YkYwZFplZFdOODBCZkVaeU1acWJ0LzNuZWV5RUdP?=
 =?utf-8?B?TmdLZ3pUL082NkZjN1JMdnlTaDFRVVVyNXJqREtYa0JCOE1OV056RzNaYm1T?=
 =?utf-8?B?c1RLekNZZEhycVNDeHlzeTU3U3NQM2tWeEJWbnJRQS8rb25PbGN4dmM0UlJ5?=
 =?utf-8?B?NFJ4bVlIVEtpQThGbExPS2N6UFdyZ3RaZnZ1UTRFcGJaQWhMeFhET3pIdFdJ?=
 =?utf-8?B?TGZ6R0N1bDhNWVQvSU53cE1LYWZ2VGtyQm1xVnUwUVp0dGM1dW1lemZhY3No?=
 =?utf-8?B?RG9ydmZRMVlPSVdLZ3Nuc281MHRVVTN4Q1c0Y3FHbzEybURweTBkcURkWDdu?=
 =?utf-8?B?SU93elp4OXBZN2crSE9EUWN4TEVzV0E3QjFKaFg4MCtFdTJUdDZvc0QwcTJ5?=
 =?utf-8?B?OC9BdTBXdFdkRnhlek0vbW5XSWlESkNidE1vK0tHL1FRa1NzT2VCNVpUN1pu?=
 =?utf-8?B?K2hxbW9iQmJKam5jcTNSa044RERSK3Q0ZVp4eFl4cHBXOFFOdlZFL1JHWTMz?=
 =?utf-8?B?cFpkSkhYUlNEMHM0ME5VK3dXT2F5NWNwUEJWcFJ4OWVxSUM0ZGErdmtrKzgv?=
 =?utf-8?B?QlVuSHJvTGErSFlIK2h2c3Y1NlBhSjFYb3ZPOE93bXNxQW4rSHlqNGovUm9r?=
 =?utf-8?B?K21PL2lEL3V6RkM3QkN6RG05bStEM0hKOEMxYWl3VzdkWGRPNkM2ZjBJK3ZZ?=
 =?utf-8?B?OXd6c2tQZFJSdUgrVjh5cmtsY2dUbnVFaGFuRERNODl6THc1QjdUMjhZYmtV?=
 =?utf-8?B?dFcxUG8ydFpNNEdpRXk4dGFWSlZBVWhuM0FoMXNUMS9HaXhEWXlxaGlpU2pO?=
 =?utf-8?B?eHlEUkFjQS9Xakc1NUFreG0wWUx2UHVOZ1lZYUR4MnRNa3FENjN3ZWhwNFI0?=
 =?utf-8?B?SFM5bU5BcGJwK2JaN1JGQXlZQVpTbHZ6WWE1VDRwaHcxWFVrR1VzcnJVV1FZ?=
 =?utf-8?B?Q2lGWWpld0FTU3plTytRemUyRUJvcGpQdFdJSGNRUkswT2RvODY4TTg0akhF?=
 =?utf-8?B?OGphUDVGZlBidU5kT3BOTmI1QTBndFVVQkUyMmdiWmRHMDdGNWZmTmNCU0k3?=
 =?utf-8?B?ZnF0OFBjYkVUaWJkRmFSbGNFeXVzUjcrQTEwSXV1K0Z0SDZNQ1E4MWZEQjUz?=
 =?utf-8?B?SDRJWUZlcS8xRmhpYmsrOGgwakdBWWJ6a3BiMUY3akU5K2hPKytXcVNrc0VI?=
 =?utf-8?B?UGxaaUtiZHBFanpPUFdUNnlrTDFqdUtITTdKUG1LUUVpM21qekxQZDhxMjBm?=
 =?utf-8?B?N2g5QjhyN3VFUVNqZ2pzQzMxR3ZiRlRBV1hyekRDWEdhTGRNKzhKVVhzMlBz?=
 =?utf-8?B?K2RDbjZQMW8wYlB1WFFqZ3JjY2cyMlpvTkRkbnlVRmtkMzJ0elZSdUF5YUlT?=
 =?utf-8?B?Z2gxSjgzUVd2cVNNL2xuSC9aM0I0K2xZNlF0dUFydFNPZWczUEkyN2pwTWdU?=
 =?utf-8?Q?aiOeydO9gaTH0uVkTX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	X+p5GQi03X/WLJEd4YeAZ3aE/zbLlWMVBMU57gwY8j1waspbp0zySxPE4l1N5aNtYmXALaMhai+DtCQK35BSf6HRZT0zhyVhu4IipYa/O/cc5YR6Xh02KOlVy1OxRempl5Rgyn6+drrHRL5+LQfYhthK4DZ6thKaglvmM/iQXr+8S5v18BtsnP+TZ06Tehl6pBkOePGgTGKm3ezzE7XNkagA+ULp9tNXeAkaNkZR2E6Q9QxMU0OMQZM3zKAD7aLZEjkC1SHFz3mYx98cyPoA1YuDrESsWShQ8fTTY8wH7uJkKN8Z6QP7G/MZ4ArjZZFkXQErsMM2rMETaONLCJgYmQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9860595f-74b8-49e6-229a-08de7a5433c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 01:11:59.7429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aM/ZPt2ST4T2Unn74ZzHomB6hNR/QNGRnSlxTVOeIgvnGul/c898xjktaN1roZnvLZA2BhpQ2NfSRm+2hJczQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13706
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 01:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232444

Z3N0cmVhbWVyMS4wLXZhYXBpIGhhcyBiZWVuIHJlbW92ZWQgdXBzdHJlYW0sIGFuZCB0aGVyZSBp
cyBubyBjb21wYXRpYmxlIHZlcnNpb24gZm9yIDEuMjguIEFkZGl0aW9uYWxseSwgSSBoYXZlbid0
IGZvdW5kIGFueSByZWNpcGVzIHRoYXQgc3RpbGwgZGVwZW5kIG9uIGl0Lg0KU2hvdWxkIEkgcHJv
Y2VlZCB3aXRoIHJlbW92aW5nIHRoZSBnc3RyZWFtZXIxLjAtdmFhcGkgcmVjaXBlPw0KDQogIC0t
DQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9M
T0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwg
Q2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6
ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCA1LCAyMDI2IDM6MzMgQU0NCj4g
VG86IG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbQ0KPiBDYzogV2FuZywgTWluZ3l1
L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMDEv
MTBdIGdzdC1kZXZ0b29sczogdXBncmFkZSAxLjI2LjkgLT4gMS4yOC4wDQo+IA0KPiBPbiBXZWQs
IDQgTWFyIDIwMjYgYXQgMTg6NDEsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB2aWENCj4gbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA8bWF0aGlldS5kdWJvaXMtYnJpYW5kPWJvb3RsaW4uY29tQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IEl0IGxvb2tzIGxpa2Ugd2UgaGF2ZSBz
b21lIGJ1aWxkIGlzc3VlcyB3aXRoIHRoZSBuZXcgdmVyc2lvbjoNCj4gPg0KPiA+IEVSUk9SOiBs
aWIzMi1nc3RyZWFtZXIxLjAtdmFhcGktMS4yNi45LXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBv
Zg0KPiA+DQo+ICcvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4Ni13b3JsZC9idWls
ZC9idWlsZC90bXAvd29yay94ODYtcG9reW1sDQo+IGxpYjMyLWxpbnV4L2xpYjMyLWdzdHJlYW1l
cjEuMC12YWFwaS8xLjI2LjkvdGVtcC9ydW4uZG9fY29tcGlsZS4yMDYxNDYyJw0KPiBmYWlsZWQg
d2l0aCBleGl0IGNvZGUgMSAuLi4NCj4gPiB8DQo+IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtl
ci9xZW11eDg2LXdvcmxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Ni1wb2t5bWxsDQo+IGliMzIt
bGludXgvbGliMzItZ3N0cmVhbWVyMS4wLXZhYXBpLzEuMjYuOS9saWIzMi1yZWNpcGUtc3lzcm9v
dC91c3IvaW5jbHVkZS9nc3QNCj4gcmVhbWVyLTEuMC9nc3QvdmlkZW8vZ3N0dmlkZW9kbWFidWZw
b29sLmg6NTM6MjQ6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZQ0KPiAnR3N0VmlkZW9CdWZmZXJQ
b29sQ2xhc3MnOyBkaWQgeW91IG1lYW4gJ0dzdEJ1ZmZlclBvb2xDbGFzcyc/DQo+ID4gZXJyb3I6
IHVua25vd24gdHlwZSBuYW1lICdHc3RWaWRlb0J1ZmZlclBvb2xDbGFzcyc7IGRpZCB5b3UgbWVh
bg0KPiAnR3N0QnVmZmVyUG9vbENsYXNzJz8NCj4gPiB8ICAgIDUzIHwgICAgIFZJREVPX0RNQUJV
Rl9QT09MLCBHc3RWaWRlb0J1ZmZlclBvb2wpDQo+ID4gfCAgICAgICB8DQo+ID4gLi4uDQo+ID4N
Cj4gPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWls
ZGVycy81OS9idWlsZHMvMzI5DQo+ID4gNQ0KPiA+DQo+ID4gQ2FuIHlvdSBoYXZlIGEgbG9vayBh
dCB0aGUgaXNzdWU/DQo+IA0KPiBJIGd1ZXNzIHRoZSBjb3JyZWN0IGZpeCBpcyB0byByZW1vdmUg
dGhlIGdzdHJlYW1lcjEuMC12YWFwaSByZWNpcGUsIGFzIHRoZSBjb2RlDQo+IGhhcyBiZWVuIHJl
bW92ZWQgdXBzdHJlYW0sIGFuZCB0aGVyZSdzIG5vIDEuMjggY29tcGF0aWJsZSB2ZXJzaW9uIGZv
ciBpdC4NCj4gDQo+IEFsZXgNCg==

