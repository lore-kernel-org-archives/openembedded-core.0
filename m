Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A88AC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:54:16 +0000 (UTC)
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (DEU01-FR2-obe.outbound.protection.outlook.com [40.107.135.71])
 by mx.groups.io with SMTP id smtpd.web11.80080.1705326849559187450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=e+rBXNKo;
 spf=pass (domain: iris-sensing.com, ip: 40.107.135.71, mailfrom: jasper.orschulko@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfAKAtAoOiNtOQteNehXvFRdFU2drNgDVs/cyacejC3qYj6M5dW0tuQlG45x/xuXCXVBvXyGfyU3rUouvYR8/Xkbs6KxSibgZdVP4SN4nqD1PICZpWC/w6BzsEqlVoohfLXqr95JKRjWY4IprJMdpKbseSdciCqMw6FNrEMaeWdRnk7FTDgXC9JPPExBHGmBpSna9BuwtWz039y6w3qhIUCTNPAVOpbOR9Zyu+CN9crjn5noVKQaNKjzQN/xkVgQq+kJsHzHNfs/EeWMM+r1RQwB42ARpHxS+0hXOpvzSxDUex6wDZoB1rZMYmCJTw+bivC7Dxge1iLWsjSelyq/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krpf1UT9DH2z0YhG0XnVWK7vZLLD75xiMNghQrke888=;
 b=UV3TPIEocHNwkGt6yOTLo8g3bhc8aiSUjZ1ieZ523yjl5yZGlcTeXkqEgmBQtBCgRyrMVvIovCn6vYdk26YAR3TnPt05FW+1skJFi2724gVs9Fr+v73z2DLJZgk9X0GeV2PKd8rLAWQlfAYk6k3Mnv5lBISzQQRal++AStBkuIp2ni6/mcowFY7nXAStEVMBZgN67b/2q+4FBuomzC+WRIXyAy7sgoxmdvFWSoaAMkgDGkETuCsoXEU8QvkQ1s9iLJXsn3g6Y9J70OP6C940oMieCZ5c9gSI3EcsNH+eaIjG0Psld7h0RhsDXqthqzvPFtpQi2ytYwQKnCCfgNK8ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krpf1UT9DH2z0YhG0XnVWK7vZLLD75xiMNghQrke888=;
 b=e+rBXNKoTZ9HsCQo0axzGSv3KUDkR9hHnIl/mwHLU1H+IX7APD8MMOWPJfTWGobMakOm1oa6viOm2NnFHfMOcnbA+aIXJ7Bs+zaOQP1WS37akh7XnVlZaAL6IHKBaOVI+shBVzOTNiLfHq3YYGmYsy+QP8cJ003d9g6pmMM9rkcFFNxdobw470F8SuioLSfnCD43njEkqohlVc8aQTVOlp2H7hrBHKpcvN7/9DSB4tSkKF0ZrDwArXs1xinscyUIHpFt5RXlJxlUeY07sPUj3hETO5nKw4R/ms1HzpBm4vT8zGlPgGK52BwJ0TotBzs56ldcsTa4hD87yjK1ovU0sg==
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:3d::14)
 by BEZP281MB2966.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:29::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 13:54:05 +0000
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a]) by FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 13:54:05 +0000
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "ecordonnier@snap.com" <ecordonnier@snap.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Topic: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Index: AQHaR01toZjDsnahoEKeitp4QsxNjbDabEdvgAArzoCAAE3pAA==
Date: Mon, 15 Jan 2024 13:54:05 +0000
Message-ID: <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
	 <17AA7149AA53F0BC.13033@lists.openembedded.org>
	 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
	 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
In-Reply-To: 
 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1963:EE_|BEZP281MB2966:EE_
x-ms-office365-filtering-correlation-id: 51facfb4-878f-47c8-513f-08dc15d16ffa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T/FYTWd3DmejWrwIBy5J3wp9Le+VaK+3bTc3ZRE7Ki+x/6uGJcn2z8tHLcGSRS33HQCJLHWAOG86IkREp+pe9llxZigDzU83hLcwwXHygWclNms97cBxZowssI71TgMSVaQHnkyMZqdDNIMbIJhMFzsP+LTehfA9yL60RFF9vJu4BwsUfdL0HvcvsX/E2+ypkSrSTxcPxf303igQlawZQ8GqUQmjuPpvJj2LixkemdXYTsHNbXiQmcS9W7bxT9mI4wQVSYgBGfT4o5IiU9snpKiZRy4ZGnNi4007LeV4CWdWmyzqY1bIU/fdfPZejX9a/cFEXELmBv4fnOo7v+oi+I1hmWgw0J5syJMTTp2EWYPOFITFl8R2G7d1oen/XYDDvpV7NQlgQVPeiGgux+him8Vzxw7eteTNNoO+Gegr88wcH7aeR9xJqp6Moj0WMwIkW1HJJakg7sfu7R62IxeRWeGxax4oNKEaZGKZByyO/fqKlCFUUuHw0tM86RNW2i01rIo1l1A3QMWo9lDbJfhEcmVuNeVfMZwGN3ha77Aiu1KHosawKAJMsQQm1dzCJMBaiFtS2AjucDqMbCVBnN0/clN9XGo4DhdUgKd0KEuCoQ4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66899024)(83380400001)(41300700001)(76116006)(36756003)(86362001)(38070700009)(91956017)(38100700002)(122000001)(26005)(2616005)(6512007)(55236004)(966005)(6486002)(478600001)(66476007)(2906002)(6506007)(66946007)(8936002)(66446008)(64756008)(110136005)(316002)(53546011)(71200400001)(66556008)(5660300002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cEM4YVk3dHdzdSs0eGQwcVE1UFgxaEZmZEVCQUdlWi8rTm0yL3ZoQ21YeE5M?=
 =?utf-8?B?UURnNkg2L1VPZXgrM0hGaW8zZkdLTThYTkhHa1JJMHBteUE1Z3JaT0dIZ3M3?=
 =?utf-8?B?eGRTOUhzcHk2SVZPTzAybUJDMzBVYWRYUXRKWTZmOG4yS3dhdGNjdHpuenlK?=
 =?utf-8?B?WjBQekUvRHhrYnZBU3ZTcmM4STRXcmtsVmNpMFp1bGNsYXRvYlhtUW1WeWJh?=
 =?utf-8?B?SDFIcDAzTHJQNzVSNU41K2Zvb2hobWpHazJncXkvNlhmaXJyVm1xV0RMV056?=
 =?utf-8?B?U09XS0tGTlcyQzhLTW1COHNwMUlnMWtSam1NWGpINTZIUWEzU1lxMDVFU1lh?=
 =?utf-8?B?MWdMVTdaWVFnK1lmYWtSVzBtK1JrNUN5dzlwTXRDenpSbXV2R2Y2NnhleitY?=
 =?utf-8?B?L25kY3JibmtJM0hLTHFuTmlhRXBnYUxtMHhiVm9idXlsL0U1WE55UGhQeG1G?=
 =?utf-8?B?ZXVlcE9adlEvQ0xIbERGcDU5aUc3OWFVaGFIUTB5TWNkQXNyUlNPaGdIQ0dT?=
 =?utf-8?B?dzVhMUI3djVxYXU1SnlrWGhBUHZiSTZPK0ptWnZaZTRwcStJYSswRnJGNmxR?=
 =?utf-8?B?Z3VQcjhSWGdaM3ZDbmJXb3ArZ0pZZUNWOXlVdFN5NkVjZ2ZtV1R0eVNjSWht?=
 =?utf-8?B?SzR4cTlybExyMm9tRzc1VGE2VFpmWmNlSVZaaG5VUXMxdm14ZU9ocVhoVHhU?=
 =?utf-8?B?ZElkaEhLMG83YkdUR2tLdXkvRlM1elFvdHBrU0EyalhPdWdQelljTGFWbjlE?=
 =?utf-8?B?Zm1NNGI2dVRGVjJ4SVZTb2hFZTEvZ0oxVW9nalBpaDFuZkl5cnJNM3BBUCtZ?=
 =?utf-8?B?dFdsT0NodlBtdlRsTE9rQ3JlNmlLSlRWQzU2V3lQTG5zWnFlSHRpUXc2bElE?=
 =?utf-8?B?Wi82YWYvWGcrbGl5d00rS0VBM284c3ZrblUzWml0SWtBcGVHWG9FdTAzS1lW?=
 =?utf-8?B?UmFWMzBaU0xZWE1aM24vL1NJK0RZQlEyUkFYT0pCakh0cERRcWx2dGUrbzlv?=
 =?utf-8?B?bGFBUS96aXZYNnI0UTBuMDVDWml4UTRoalpSdENQUTdCeWtKaDllckpNZXRM?=
 =?utf-8?B?ZEFGcUhUaTdpMEQvc1UvT3c2a0phU1dPczJrMG13UGZ3QS90OVVLbk9LWHV1?=
 =?utf-8?B?VzlzMGM3RHJ4VU9VUFVvdU9EQlREYnNCblFUdnA2YVAxeUVaUmd6TjI3OFFy?=
 =?utf-8?B?OFR3akg0RExQMGcxa21Ra1dNNW13MlZoN2VuWGk5ekcvQkVmZXVHSGlvNUlo?=
 =?utf-8?B?VFVVUFVOOHFUYmlIUHF6dXdIdTBLdXFzM081aGgrbDdwdHlmZGh1ZngvWWRi?=
 =?utf-8?B?SGtOSjJxaHN4NzI1UkVoWkU1SUo3M3hJM0xzc2g4MURGMmdhNFFvR2lXdVg0?=
 =?utf-8?B?QXdIMytwckF4dnVibkxtcnRrWVh3S3gzUDUzYmFKdElibnY1VGxxV0lMZ0o3?=
 =?utf-8?B?YTJaSVV4YWZxKzcvQytKVUlNdG5LZ1VvM0NpMUVMdWJ6SjlUTzJkd1ZnYnov?=
 =?utf-8?B?Zmk0eTdwajBhWDRRR00yQmNRT1g1V0tURzgzd2FKKzBZWDJvemlWVmdzdzAx?=
 =?utf-8?B?MDB3R2d2OXJIOFNHRmpScEQyYlVlN3lZMFlhekErK1o4b1dPNE90cGlnV1cw?=
 =?utf-8?B?RkE0WXd1cDh2M3YxVlFUNzlCbWxDZzcvd2h1MkpsNlNxZm12aUJFQUxqSTdD?=
 =?utf-8?B?VGFMMzBWYkFVNHR0UnR2RUtySXJJN0NIOWdrc004SjVJYVB5dGoza05hM0Fx?=
 =?utf-8?B?Q1NoVmlHSTdYY0R0eW5ZL2UzVWlRT2R5SlJ1eUlvZ0t1OW4wYUNtZmNoM0Fj?=
 =?utf-8?B?TzIrcForZTQ3VXRUL2Z6aTdRSkJUMDhBTkM0QkVWRVBSYmFFejJsSHlQajZB?=
 =?utf-8?B?ZndvSEZhcm9VM3VkY1E3Q2JWYUFHc2oyZVBobW9xVXNjOG5BdUlLSkpSNUZY?=
 =?utf-8?B?WFhPcXJiWmpZZmVZUHV0cUFyWk9meXdvRFFKd1Q0OFRHYUlVZjExbURhbVhj?=
 =?utf-8?B?Yy9EUmxVdytqRVJGQkFzOFNUcWFTeW1vS1lVcEgzR21KeGV6bjZnaFY2djNt?=
 =?utf-8?B?em02ek5kWHd0bklmU1o1R0RuM2JiUGYxeERCMVRzTURjUm81VDNnWTIwN2pV?=
 =?utf-8?B?N2xoQThuYkxzOGJUMndGVTBKT3RlZlVHRnVXenlpRWlKQThvRngwOWdqUTZq?=
 =?utf-8?Q?jjl5xkH2XLfUhteI1CKTo88=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9090EFE3231FD343BD5FE67130B68F60@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51facfb4-878f-47c8-513f-08dc15d16ffa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 13:54:05.0562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZlVqvaZoxYcDpedNPHji7AMW/1DqfrUb9uQBTe7SJFlz5LIDleXH5jLaIhgPsPWjTxqUqy3gbTCqs9pYWiBYGh9wSvTD9UUO+o3vk8+DdcUBzfxfDdThG7mQgosuxh3O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193676

SGkgRXRpZW5uZSwNCg0KR2l0SHViIGFsc28gcHJvdmlkZXMgdGFyYmFsbHMgZm9yIHRoZSB1bm1v
ZGlmaWVkIHNvdXJjZSBjb2RlLA0KZS5nLjpodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGli
ZXhwYXQvYXJjaGl2ZS9yZWZzL3RhZ3MvUl8yXzVfMC50YXIuZ3oNCg0KVGhpcyBjb3JyZXNwb25k
cyB0byB0aGUgIlNvdXJjZSBDb2RlIiBhc3NldCB0aGF0IEdpdGh1YiBhdXRvbWF0aWNhbGx5DQph
ZGRzIHRvIHJlbGVhc2VzLCBzZWU6DQpodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhw
YXQvcmVsZWFzZXMvdGFnL1JfMl81XzANCg0KU28gaWYgZG93bmxvYWQgc3BlZWRzIGFyZSBhIGNv
bmNlcm4sIHVzaW5nIHRoZSBzb3VyY2UgYXJjaGl2ZSB0YXJzDQp3b3VsZCBiZSBhIHZhbGlkIGFs
dGVybmF0aXZlLg0KDQpCZXN0LA0KSmFzcGVyDQoNCk9uIE1vbiwgMjAyNC0wMS0xNSBhdCAxMDox
NSArMDEwMCwgRXRpZW5uZSBDb3Jkb25uaWVyIHdyb3RlOg0KPiBIaSBKYXNwZXIsDQo+IG9uZSB0
aGluZyB0byBrZWVwIGluIG1pbmQgaXMgdGhhdCBmb3Igc29tZSByZXBvc2l0b3JpZXMsIGRvd25s
b2FkaW5nDQo+IGEgcmVsZWFzZSB0YXJiYWxsIGlzIHNpZ25pZmljYW50bHkgZmFzdGVyIHRoYW4g
Y2xvbmluZyB0aGUgd2hvbGUNCj4gcmVwb3NpdG9yeSAoc2luY2UgdGhlIHRhcmJhbGwgaXMgbXVj
aCBzbWFsbGVyIHRoYW4gdGhlIGdpdCByZXBvc2l0b3J5DQo+IGNvbnRhaW5pbmcgdGhlIGVudGly
ZSBnaXQgaGlzdG9yeSkuDQo+IA0KPiBFdGllbm5lDQo+IA0KPiBPbiBNb24sIEphbiAxNSwgMjAy
NCBhdCA3OjM44oCvQU0gQWxleGFuZGVyIEthbmF2aW4NCj4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+IHdyb3RlOg0KPiA+IE9uIE1vbiwgMTUgSmFuIDIwMjQgYXQgMDc6MjYsIEFsZXhhbmRlciBL
YW5hdmluIHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA8YWxleC5rYW5hdmlu
PWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiA+IHdyb3RlOg0KPiA+IA0KPiA+
ID4gSSdtIGFsc28gY3VyaW91cyBhYm91dCB3aGF0IG9zc2Vsb3Qgb3V0cHV0cyB0aGF0IGNhbid0
IGJlIGRvbmUNCj4gPiA+IHdpdGggYQ0KPiA+ID4gb2UtY29yZSBjbGFzcyBkaXJlY3RseT8gSXMg
c29tZXRoaW5nIG1pc3NpbmcgaW4gZXhpc3RpbmcgY3JlYXRlLQ0KPiA+ID4gc3BkeA0KPiA+ID4g
Y2xhc3Nlcz8gSGVyZSdzIGZvciBleGFtcGxlIHdoYXQgb3NzZWxvdCBwcm92aWRlcyBmb3IgYnVz
eWJveCwNCj4gPiA+IGJ1dCBJDQo+ID4gPiBjYW4ndCByZWFsbHkgbWFrZSBzZW5zZSBvZiBpdDoN
Cj4gPiA+IA0KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL09wZW4tU291cmNlLUNvbXBsaWFuY2Uv
cGFja2FnZS1hbmFseXNpcy90cmVlL21haW4vYW5hbHlzZWQtcGFja2FnZXMvYnVzeWJveC92ZXJz
aW9uLTEuMzYuMQ0KPiA+IA0KPiA+IE9rYXksIEkndmUgcmVhZCB0aGUgUkVBRE1FIGZpbGUgaW4g
dGhhdCByZXBvLCBhbmQgaWYgaSB1bmRlcnN0b29kDQo+ID4gaXQNCj4gPiByaWdodCwgdGhlIHBy
b2Nlc3MgaXM6DQo+ID4gLSBydW4gZm9zc29sb2d5DQo+ID4gLSBoYXZlIGEgaHVtYW4gaW5zcGVj
dCB0aGUgb3V0cHV0LCBhbmQgY29ycmVjdCBpdCBvbiBhIGZpbGUgYnkgZmlsZQ0KPiA+IGJhc2lz
ICh0cmVtZW5kb3VzIHdhc3RlIG9mIHRpbWUgYW5kIGxpbWl0ZWQgZGV2ZWxvcGVyIHJlc291cmNl
cw0KPiA+IGV2ZW4NCj4gPiB3aGVuIGRvbmUgdGhlICdvcGVuIHNvdXJjZSB3YXknIGlmIHlvdSBh
c2sgbWUgYnV0IHdoYXRldnMpDQo+ID4gLSBwbGFjZSB0aGUgY29ycmVjdGVkIG91dHB1dCBpbnRv
IHRoZSBhYm92ZSByZXBvc2l0b3J5DQo+ID4gDQo+ID4gRG8geW91IHJlYWxseSByZWFsbHkgbmVl
ZCB0aGUgJ2h1bWFuIGNvcnJlY3RlZCcgcGFydCBvZiBhbGwgdGhpcz8NCj4gPiBJdA0KPiA+IHdp
bGwgbmV2ZXIgcG9zc2libHkgY292ZXIgYWxsIG9mIHRoZSBwYWNrYWdlcyB5b3UgbmVlZCB0byBz
aGlwIGFuZA0KPiA+IG1hdGNoIGFsbCB0aGVpciB2ZXJzaW9ucy4gSWYgbm90LCB0aGVuIG1heWJl
IHVzaW5nIGFuZCBpbXByb3ZpbmcNCj4gPiB0aGlzDQo+ID4gbGF5ZXIgaXMgYSBiZXR0ZXIgd2F5
IG91dD8NCj4gPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cHMtM0FfX2dpdC55b2N0b3Byb2plY3Qub3JnX21ldGEtMkRzcGR4c2Nhbm5lcl8mZD1Ed0lCYVEm
Yz1uY0RUbXBoa0pUdmpJRFBoMGhwRl80dkNIdmFiZ0drSUNDMmVwY2tmZGl3JnI9QWhrYk5vblZ1
TUlHUmZQeF9RajlUc1JpaDFEVUxKVEtVa1NHYTY2bTY3RSZtPXI3eklRMWhDdWF3NFdpXzNwdW0w
V01vQUd0UmNuUDQ2WklVU2s1VTM5TTA2VWRqQm9HMkZoemdYU3JGcUFwTXAmcz1UUnBNTkc1R0JG
TjlISGhiR0V1RGNpdmM5TDNNNFlKb0JpT0Nmbk1wdmdFJmU9DQo+ID4gDQo+ID4gQWxleA0KPiA+
IA0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMx
OTM2MzQpOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1o
dHRwcy0zQV9fbGlzdHMub3BlbmVtYmVkZGVkLm9yZ19nX29wZW5lbWJlZGRlZC0yRGNvcmVfbWVz
c2FnZV8xOTM2MzQmZD1Ed0lGYVEmYz1uY0RUbXBoa0pUdmpJRFBoMGhwRl80dkNIdmFiZ0drSUND
MmVwY2tmZGl3JnI9QWhrYk5vblZ1TUlHUmZQeF9RajlUc1JpaDFEVUxKVEtVa1NHYTY2bTY3RSZt
PXI3eklRMWhDdWF3NFdpXzNwdW0wV01vQUd0UmNuUDQ2WklVU2s1VTM5TTA2VWRqQm9HMkZoemdY
U3JGcUFwTXAmcz16M0NGeFdWVGpjRXN0Ql9uR19KUEFUcVdTbVBhM1ZERDBLLUFmVnVkZmY0JmU9
DQo+ID4gTXV0ZSBUaGlzIFRvcGljOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50
LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMub3BlbmVtYmVkZGVkLm9yZ19tdF8xMDM3MzAx
ODZfNzA0ODc3MSZkPUR3SUZhUSZjPW5jRFRtcGhrSlR2aklEUGgwaHBGXzR2Q0h2YWJnR2tJQ0My
ZXBja2ZkaXcmcj1BaGtiTm9uVnVNSUdSZlB4X1FqOVRzUmloMURVTEpUS1VrU0dhNjZtNjdFJm09
cjd6SVExaEN1YXc0V2lfM3B1bTBXTW9BR3RSY25QNDZaSVVTazVVMzlNMDZVZGpCb0cyRmh6Z1hT
ckZxQXBNcCZzPUhyM3Fra1ptYWc1SWg5MUtIVXV4VkRJcWNWS0hMdmdaTUF3YXpGZVdsU2smZT0N
Cj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBv
aW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMub3BlbmVtYmVkZGVkLm9yZ19nX29wZW5l
bWJlZGRlZC0yRGNvcmVfdW5zdWImZD1Ed0lGYVEmYz1uY0RUbXBoa0pUdmpJRFBoMGhwRl80dkNI
dmFiZ0drSUNDMmVwY2tmZGl3JnI9QWhrYk5vblZ1TUlHUmZQeF9RajlUc1JpaDFEVUxKVEtVa1NH
YTY2bTY3RSZtPXI3eklRMWhDdWF3NFdpXzNwdW0wV01vQUd0UmNuUDQ2WklVU2s1VTM5TTA2VWRq
Qm9HMkZoemdYU3JGcUFwTXAmcz1ia3V6OEMxMl9Bb0hGQmgxbnNDOUVBZ3kxQ1VSN0c1eW1ieEVk
WGFicUE0JmU9DQo+ID4gwqAgW2Vjb3Jkb25uaWVyQHNuYXAuY29tXQ0KPiA+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+ID4gDQo=

