Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD74DD0BB4B
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 00:40:53 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.96])
 by mx.groups.io with SMTP id smtpd.web11.3616.1729730452074794866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 17:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=iySWVBdV;
 spf=pass (domain: aspeedtech.com, ip: 40.107.215.96, mailfrom: vince_chang@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVeBj5MMBioZCdgu5iQLq5HwcIwFsaINdvKiKKs72Lz0Zd/tiu0GR3UUhyKLjpbSWoqbmpbMC2wvwv/1+F0693BYZaemCG+DE35YoW5S4w8gJ8hTN0FE6gi08I8KinzXtMssfv15EXoLWnVo4wuJ60DHoRaYoR8RRhiJzmfIPmWjCYbpWQUXICQT4Ftm+IyNfxroIG/v/AoI3cNsZVy1/heTvSwZ1uCswVAjScJsfe52BNhqL7CzvBhSJCSWulXaFgFmxcid+NEumRyMVrhNYglfbVtAMQxHkQnf3SmHN/a16IqpMuJ0L4l98AkSETn4iiuqVH2cI+46vSUkUfQdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sRzgD3B02Owsan074NU3b3PQ19H3cRbPKIjHFFu8iw=;
 b=QLPpUDfYyVifmT6djZFh6TAnz4EC1mBZCsu8D76T2k0EVkRufuxLnFwzetcTEuj4dU1Srg5N3wQhzgWu6I4oWLQhEWUWjj+f7K9JtNgPaLTxljeLnFeuGWdmYZAxvhUepIsnCQuTENpJnHv9XYqBut/xJ9JoXSFNfBbxBAIXtsp+jRmDCvJAela/IoTLS62BIxWUoIsn+0lopt+ivRrirgWdgw6UFBAE2slosi4wituryUUSI7FH1DmYUfnLYEwspzvV7MrLSV8EdwUy4mjAiIZnHL3MYhRwnYsPwrFvGfkkI9tmSLGTini08tLJDTAaiSoBbDfj5LZv8/vY5Gajbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sRzgD3B02Owsan074NU3b3PQ19H3cRbPKIjHFFu8iw=;
 b=iySWVBdVTWOCQcgQVXvzwQJBS7pyRYtr8ZBcDQ0v6qGd18H1oxPD14V2N0m47dncYTjCMRyL8DBIP6SCH4Zs2ML77htpISzuEwb6EZPkTkPL2UipkAe81MtzbK6h3p4k8kiJ6N8GpKAcyPEXeVScPXu277gAIJB34f+k390F6aa5z7Ni7er5/hyUjPyPHc9q/kROCmMhfvcGmPhk47oKTmK0BMhRfiXa8Fv3LEyle8R/Bry6RgRFGFDZeYKKn2jkhapMgRHEthPW3Ei6LpLN4Z9mnpvxmPbBiRHP/C2SVOva1z2y0iODO+PpgdMsjJPXwtT5XHdVQhE8FEshresH4Q==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by SEZPR06MB6741.apcprd06.prod.outlook.com (2603:1096:101:188::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 00:40:42 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b%4]) with mapi id 15.20.8093.013; Thu, 24 Oct 2024
 00:40:42 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jamin Lin
	<jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v1 1/2] wic: add WIC_SECTOR_SIZE variable
Thread-Topic: [OE-core] [PATCH v1 1/2] wic: add WIC_SECTOR_SIZE variable
Thread-Index: AQHbJJIdrn9ou0AU4UGLUAoPrVUD9rKVD6jQ
Date: Thu, 24 Oct 2024 00:40:42 +0000
Message-ID: 
 <TY0PR06MB5707703BFF7DF67271C25D87E24E2@TY0PR06MB5707.apcprd06.prod.outlook.com>
References: <20241017084002.4093919-1-vince_chang@aspeedtech.com>
 <20241017084002.4093919-2-vince_chang@aspeedtech.com>
 <8BA4BD78-9830-43B2-B805-70677AB52FC5@arm.com>
In-Reply-To: <8BA4BD78-9830-43B2-B805-70677AB52FC5@arm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|SEZPR06MB6741:EE_
x-ms-office365-filtering-correlation-id: 63522c2a-e4ba-4561-dca5-08dcf3c47d75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aWRmK1dwcXgvV2hGWGI2U3F4RFJwK0tGcmk0SGpxR3pBVnQ3SjZsc0ZDakk5?=
 =?utf-8?B?Ykltb0lZbzlqQUZ0bFlsVEJlNUhxZmMyRDBYaTZsSGJXdTRUc3gzYWIwY0Jj?=
 =?utf-8?B?b2V5OEFJM1o0QTdOSUFtMmxXR09QekZTeFdodVFSUUtQZnRnSlJ4VnY5S0Yx?=
 =?utf-8?B?blltN1RZMTNRMDQrSkJZYmFwS05CaDZqQUx0RjdWZ3JVTnZGN210SUxXeHdF?=
 =?utf-8?B?NVVMT3dua0tXOWdKMjIya3BHRVpxTDlzbm5JVUNEVEg5UEpsR25pQ1BWaThQ?=
 =?utf-8?B?NGY1cjhlc2JEMzJFRk91Sm45MUtuOGxVcFloRE94YWI3ZE43UktlZEtMT1lE?=
 =?utf-8?B?WS9IbmRUZVVSL0pINGRRY2tYQTgvUCt5eDJBa3A0WlRMNnNvb3V5UHZId05O?=
 =?utf-8?B?SU1yVjJ5b1JlQXdxT2xpU1FURUwycElqelFxekxSQTJZWFZma3R1bmhWYzdh?=
 =?utf-8?B?aGpBNFBEamJXS011c2NYV0xhcmpsUEpoU2dHMnIrTlZsWXVqVE1mcjlqVHZL?=
 =?utf-8?B?ZmtzVmNnZ3hyeFUrV1hvVmRjV05VWno4M2VKbmhQeEc4dnVUNkl3aHRmWGtB?=
 =?utf-8?B?ZUQrZlRFMjAySERVM05BNWhkYlVhNlFXUkY0ZW9yTXZOV21teXh0d2RxNnpa?=
 =?utf-8?B?RWw0K2VQTisyMTZ2L2Q2NVc0NFZ5RGxYYnRkSmNUcldmbGhTdzFKY1RLa1Vm?=
 =?utf-8?B?blU5STgvRzJUcVVaSHBrQ0ZHdTYra25TcFA3SUJLNy9LWUEzSmtPdFFRNXEw?=
 =?utf-8?B?aTVkOUVNaEhmV2NwalhMOHNQNXNkaHFqNDFpN1pOZEplUzZkTVdBd3lyT0Ix?=
 =?utf-8?B?SnczS21KSlV2dUM1NnZQTGNFN3FNczE3SnBUNUE3WGhkRThzM1hlVE1HeTFM?=
 =?utf-8?B?SnFlb3R2bjI1dlV4bHA4RTVZbTc0OGlEd2ZORGtXTXZncFBvS1pndXBwV1hX?=
 =?utf-8?B?Mi9MNW94WWZXN01qeXN6Zi82YmtvVnJZQTdwVFNZakVrRWc4eENVcDFKNDVP?=
 =?utf-8?B?VlNYK3lJdzIwZXZ0U3A2d1VyamR1aWlIQ3NjZW9sV3pjSzAzUVBVUWVEdkZr?=
 =?utf-8?B?aHlyaUlVRGtYWC9jNjlZTzFnZG9pNnpIOHFiUENUSWFDV1BtUzVVSkh6YWxl?=
 =?utf-8?B?M0xyWHpqaysybytibDV2RTR3U3UrL09rR0FlTzFJQU5GTEZmZythMGxHalVX?=
 =?utf-8?B?SSt2STRXWW1yVVl3OWtGRi9WUmhNdWM4V1NjdGI4TnpjcENaMWRDQ0JqNDAw?=
 =?utf-8?B?OWFhWXpNalNpcXRnUXpBeXo5Z01raG1SQmFjaCtkVXJUTFBLeUVWdGp3UHY5?=
 =?utf-8?B?UU81Ri9hYW5FWmYxMkZ5SjliU01lWGY5aG12cmdLa3BTSlRTcDFralhKUExK?=
 =?utf-8?B?ajhSbndmM242V1BXK3NmVllUSXM0M3FDOUFFRk10Q2NkYWw4QVE4UE5tWGNa?=
 =?utf-8?B?SG5FK2E5a3I4aHBDVnZtWnEyeFowYlZFamNQbUVQL2pmS1IzSTZqbzBJMXJZ?=
 =?utf-8?B?TzNwMC81a0R2ZGMzUGU2MmM2NEdhMXRLSU8ySFRWTExRM1lVODNvNHJHTndu?=
 =?utf-8?B?a2ZiSTQ1WnBzdGE3aFVlcG9yN0U3STdkK2RpNVpwS0ZIbnIxaGFQbS9oR043?=
 =?utf-8?B?aXBaUjBya1JrUTlmRG5CRVNFL0FIK2JWbndheUVpdkYvdXZYVHFCQkFocFpt?=
 =?utf-8?B?cFgvSU5janp0VkZ0NGs0cTlHZXlWUlhpRzhhVHhhUnFxbnk2dGtWNmR2aDFz?=
 =?utf-8?B?bU82VEtLWkFNc0VldUdzUWd0OCs2dkg2YUJSM2tRZDJWT3BlalFrcTU5ekZE?=
 =?utf-8?Q?k7MUKnxtoJ88xRWnjh5XoGf+O9+f8dqZKN2Cc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cnhUUFhoMlA0RGpleXFCKzFhNjhwZHpOdmlqenNtRkVvOSt4VjN0WjM2VnV1?=
 =?utf-8?B?Q05JQ3hsVGMrR25hZjEvenp2NDVHRlJ2MHJlcDNZQkV0My81UERJOEw4cEFK?=
 =?utf-8?B?YVhYOTRlNGVPcFNJM2tVMWw0MmpSdndyd1RiODEvQUcrMml5Y2NtZzlTQm1N?=
 =?utf-8?B?aG9LcXNCYTRDNHNlYVZTQXc3MjlPOVFiZEJuMmdtSW9nZDBpMUN3SVZET3pU?=
 =?utf-8?B?MEJCcTByRU1LWjY0MFJoTStKc2pRKzd3VHV1aVNoWFZoZkJkSi9TTDNZMFA1?=
 =?utf-8?B?eWEwMHhJanpUaDl2Sy9Sb0lndnFEUnBtT2xHaWVxREFDWVRyU2djcGh3Yy9H?=
 =?utf-8?B?OUQ4Z28yK20xYVJrLzdoU3JwWnlldVZzQWt4Z2tJclprMEpGMTB1K0VjTEhn?=
 =?utf-8?B?ZklsOW9PNDd0R1JzdUltNWdUbjVBRXNZZWpvMmlyVkFGN3Nxbk1tck9UMCtp?=
 =?utf-8?B?bGJKU3IxREhmSEFuZFlxRFNyVnk1bVY2TFpTZitORW5KUFBicFNkV3BpT2Zk?=
 =?utf-8?B?WjJseE1IaUN5d0ZLVndjU21IYVpTKzUzZGNhZmx1ZEJPdzBWcTNvQkJsQXlk?=
 =?utf-8?B?L3VlMkxKakFpeDBEZmFVa0dWbmdnZ21OSXFZSzdMcDBFTTNmYzZoTVI0SFZO?=
 =?utf-8?B?bWI4QjFPUmpzVmdjZUFqNWZiejhHcS9UR0xKN1lOUk83b3FlNHlZaDg3WmFy?=
 =?utf-8?B?ajV1MVp2RDBsMjU0TmdnNGhqbnVWVHI2V1ZFNGRhcUVnQUhaL3JjZERHdUps?=
 =?utf-8?B?R0Z3enp1WjkzQ3YvbVdJN3d0dG9uaG9VZmtEbi9IdGMzRzF5TXpES1Jtb09M?=
 =?utf-8?B?Z3FmZWFGdVI5L3M0bU5jZ0lUMFNpd25IT1RmdGNuREtSdW01S3F6VmlGWk1p?=
 =?utf-8?B?RG9kUW9EcXRuZEdKTDNueFY0L0dxZkt6RVFraFNwZ0FWd1A1Vmdzdi9FZEtC?=
 =?utf-8?B?aHdRckl1WWthemwwc2VjWDY4WmhJNlRmbUVtUm5ZOUtVNEJHVUI1NnVscHBM?=
 =?utf-8?B?bW8xelBib0JRK1pCWEc1UzY2VEQyOUhxR2RsNzd5TGhEYng4WUFCdUlLZDlk?=
 =?utf-8?B?SUlOK2pLaWJmVG9xV05iQ1Q4RWRHRlFmRjl6amg1bk95K3gybzl6YXdyWE44?=
 =?utf-8?B?UlVPcU5NMTFPZE55Q1JVNDZOOGw2M0FCT1U3eGpCRFh3T0N2dGJCWmRvS2RO?=
 =?utf-8?B?TVhrTkdxbktQSVQ2NW9ZRzhlZ3hOdjZRMEorT3o2UGlQWVlrTDVBOEkrVlln?=
 =?utf-8?B?Q3RSeHJHSlUyZjhDTGxCL1FVcUpzR1FoNTR6THdXZHBhSW43b1oxM29SN0Rw?=
 =?utf-8?B?d29VT0U0ZlowbUQ2bUN2NHhqUVZqazlWRUdnYUFrbld2UjcwbTVjSnF5WTdQ?=
 =?utf-8?B?eXpNMmxhZkl2VDNsekorQVlXcUNpRUVnVUVjT1dVL254TFViSUpBUVRMcTFV?=
 =?utf-8?B?S0U5clNmbWc5ZWJMTUN3QjVTMThRY081RXlqaW4zWWVmMU9rdnZiTVVKdEJ3?=
 =?utf-8?B?RDRHUy9WYkV5dUlzSkZNbU9ZQjBoaE9hWlNUYVRDTC9zS0pKNXRabHdiSXdp?=
 =?utf-8?B?eTNsWWxRQXdjeUNmZHNjaWc4emJWbTZXdzF4T3lyY3o1WkdaaXBodldYU0Z3?=
 =?utf-8?B?ZE84MHN2dDFwUWhvYjdVd0JlWXZTcEpMU1VvZTVON2NGSWRlOHczZWF3QjFk?=
 =?utf-8?B?ME1nWFgxUEFVV29hN0ZQeXJkcGlMK1U4ZGhSVFBMdzduSVg1cTRCYWQ2dzFy?=
 =?utf-8?B?d2NoZzBvdVp6UjNIRGlOaXVsNVBvREVZc0YwOGdrK3FEOWNLMERDd0lMV1ZY?=
 =?utf-8?B?TUtNNlZqR2hncFdyRHBIZXY2Ynk5V2t4MnlwMi80OVptTEdHaHkyTHZkakxq?=
 =?utf-8?B?RWUvVEV4eHBtVm9wRnZsekFFUlF6Yy9qNUFOY1lESjlNMGo3ZTFucDVWeXFz?=
 =?utf-8?B?d2dwK2FFRjAxdm9Ha1htYjQwb2QrdVdyM29mdmVxandpVUdqV3hnTU1lS1h6?=
 =?utf-8?B?YzRkSmlQSFhaU013clQ4aVgzSFc4Ti9LY0FhVlJvR0ZMTTIzdTc0MEdoNGZr?=
 =?utf-8?B?Q2crQndBZVpmTlFKUWg5cjlzYnlScEoyZG4wMXArWXBURklEbkQ2K3FyVjlR?=
 =?utf-8?B?d2hIelhQVFN0K2VYMmRGK0pjdUJUK0NqMnBCbWZIRDZjQ2pORC90QWplelAx?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63522c2a-e4ba-4561-dca5-08dcf3c47d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 00:40:42.3757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1DJ4jtCQ1NiIueJl1vlwIWx69tCvuoO8xBGJXwV4nt4EPYs1r9bk2yLxS8PKwr0Tvh3W/nK172kHtWUVZyuh4Di7twz4EoOcuo0qAi3qmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6741
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 00:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206273

SGkgUm9zcywNCg0KPiBPbiBUdWVzZGF5LCBPY3RvYmVyIDIyLCAyMDI0IDEwOjUzIFBNLCBSb3Nz
IEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+DQo+IFRvIGVuc3VyZSBpdCBk
b2VzbuKAmXQgcmVncmVzcyBpbiB0aGUgZnV0dXJlLCBjYW4geW91IGFsc28gYWRkIGEgcXVpY2sg
dGVzdCB0bw0KPiBvZS1zZWxmdGVzdCB0byB2ZXJpZnkgdGhhdCBpZiB5b3UgYnVpbGQgYSBzbWFs
bCBpbWFnZSB3aXRoIGEgZGlmZmVyZW50IHNlY3RvciBzaXplLA0KPiB0aGUgb3V0cHV0IGFjdHVh
bGx5IGhhcyB1c2VkIHRoYXQgc2l6ZT8NCg0KSSB3aWxsIGFkZCBhIHRlc3QgY2FzZSB0byBvZS1z
ZWxmdGVzdCBhbmQgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHBhdGNoLg0KDQpUaGFua3MsDQpWaW5j
ZQ0K

