Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4364FCC9C4
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 05:17:03 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33521.1773119814915334357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 22:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=rBXtDioh;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.15, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPC8gKE4PocJNgwZP7av/IgJIgjf2CIsD/e1TVHBfVOpGz9LBXp0zXhm4ls4eGioKRic8p3zmJu/MZ4nbWNAkxFLAD87l7MSokLw1M6O2rZQLTDwtK5d9YvTNHHKIpH9HSjY+8JMYnNxoBWT5lqY2HVmH+YWiqUJCNN6vwow5QsolOhWiW4VFvdl7No+ZAFxsQXQu4J6xHysmCt8GvS/fLVEK5W9ACcn6hjfo7H41posZZas8HiZND0sCew0C1TBOjG78nHzq9Op8mOtfpUu9xxKsolVxK6+25ZEVzjvHXRKSvC+8GGJ0zPxqMheNCOumB9oWmKVUTsPd/jbiSQEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooi8zlwVZ1YqovGpK4x3VvM2s599i1yoWTNcZKsFcQM=;
 b=fG2odLOMtlDUCakIwodJI96CQbCFa4rYLLpdV138+IMSPdi/e2kc1ZnkEmOwcZmNbrmXp5hTjYEonCG+xEJOE9BMdnFOt6xzlYTUQgCSTxv5ppEje5lVO6RvLlvg1H8ova422nKeOEiW4k5QNCnpKhDEuf+5OPOvMt/fwmdTDc90OoGplD2fbGhsD1mt9TRpkHUUDoQvJDdTW7XNylftrWDyS1w6jV8RALW+OXmmmhJBWFiaTvwYw7Htp9YBm9JjcjyNYvZ7ae4CbuJmGRn1XRXrUdCnIij6HigE7/6Ynkk+1/514kzuzZ5CwzZK2WHME5OgfWUqAp3agkSAvMuCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooi8zlwVZ1YqovGpK4x3VvM2s599i1yoWTNcZKsFcQM=;
 b=rBXtDiohC5xy4/wzWoSP1VPOBwzJM1lvAEZ0H/Ls3/Ex4c42HukgvVTRvh7OJEAtTmqmLg8hri2meuHl6BVMXisFbdgCC15Te8lZnqBopEyTGQfHglb9ly1etf1TTso3GtkXqWjaCdlvAqk05azkGjYhilD87ChL6HDiYRjJM3cPn/Xq2jR5F0pgPcD5nZHux8Gg+OPNt6I7wcyMj3jtICVdDf/V17LV0/b12jfOVSZahOI4xpIOQAfoc19O62dfr6que0GtJEDImT3jUjvLO5n2+mVSxmF+F1pP9vsFgjo1auW1c/bcnTqdAaL8MyogAz21KphOs6oBhQvSF3xeYg==
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com (2603:1096:604:386::5)
 by TYYPR01MB12418.jpnprd01.prod.outlook.com (2603:1096:405:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 05:16:50 +0000
Received: from OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97]) by OS7PR01MB14444.jpnprd01.prod.outlook.com
 ([fe80::749f:a1f1:c336:5d97%6]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 05:16:50 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
Thread-Topic: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
Thread-Index: AQHcr+ltnh7eLyVBrEeJnLHIJzxlO7WnEX3x
Date: Tue, 10 Mar 2026 05:16:50 +0000
Message-ID: 
 <OS7PR01MB1444484634209A3F18545AEC99B46A@OS7PR01MB14444.jpnprd01.prod.outlook.com>
References: <20260225033725.708-1-liuyd.fnst@fujitsu.com>
 <CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-10T05:16:49.671Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14444:EE_|TYYPR01MB12418:EE_
x-ms-office365-filtering-correlation-id: ab45f900-d71d-473f-6d1e-08de7e643c2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|1580799027|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 FY3fe3gxdbMROivW6AuZ8JkCrdR++RJSlvPJBYvP+CD7TPReS6cJQVB8vPTXKePzx+8zcuYWa1qQ82vv3ilBHzwg2UWpsFwRBntJheVKQv1+BsTGlfAOsG64KflDSvIx5AglszObDvMJ+xrVNcrDWshtzfOLBD9WH9ZRyq/Wj3e32083NvBJCItzl3klgzctp1twwAqHe2d9Kf8BjyZNiDasctFVDKaKBFEDtO8XGPepqgcvxq0+Fnv3dqAs5X42ryqawLdrY1A6d7pnB5a4boC039itpjMvvLrk/iVvQ1A24Bg0eyE4gQWjlvgYq1uPgEi6sxpAiVvjvt0X8qDBoNw3NkNPMzdKu0ckmjvEQ6c3KEQ7AeWHz1MZtw7BWXAqKEqPN/l01Ipt2zl0WsqWG3GMu4YDek286ZQ1O54gzLcl0TvSAdbgtOwj3m5M2uMVH/v+eq2wH7jPyM80E8GwfOiE2XTvW+qevd3nkA69ffoZnbZn4Eao5r5GFaf08yYGW2Vepw6N47hlcYMkrClqHL4HiFOj9gimtbcl/a5v+lbJb5H0Z3yLsYUjrQsJKFpvCrL9A5Z8097qJeuRzwSiH376VE25VrOG7Q7FvZKDP9QxtTlI/hBio5D7Gek4L2xeDMo8rWRll76PbffDbvfXPGR7JV1VUI0ZTpN4jeW5+dh5v5YYXqPwqzdhAGkMDdx6XP7JXH9u7XUZP5TmdVUtDZrC6n4shMxNCPNwpqeISGIypgU8vCZ+50Z3I/fYoQQE89F0gOV84O9Lw4yJQnbZ8+9iCbpwUwMxJK6CWuCbACBdWCx3du+k+KBxKaa1zGiu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB14444.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(1580799027)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?US92WUdFcGwrMHlqb1lrMldVTVY0MUJQYUIwZ1psbGtybGNUa2diZ3FJUHRr?=
 =?gb2312?B?Vjd2TC9hbDVGZDVjRGxBajBMZXBSVzZYR1kwdDIzOGI0dytyU0ZmVk8xVWpE?=
 =?gb2312?B?TEl0SmRqeUpUNzJVb0NLVG9wem92UTZKRkFnb01RZjFOUC9pcElvV1A0SWhM?=
 =?gb2312?B?cUZ6TVRweWxXT0ZCekJDWlVsTmlNTlp1WnR6aGhIbk9MVW80ei94SllsTGIz?=
 =?gb2312?B?R1EyRGYvek9hQ0Z5eW94dHZzQVVpeVNQNjRxVUxaOWN0Q252Q2l3TWE4ZUxi?=
 =?gb2312?B?eHNTbEN2MkdGNGRZY2JxdUlKSmoxZU4vOEFYdmNXUG9vWk5WQXVQb3JEVkVl?=
 =?gb2312?B?Q1hmU25neXBSMzVqNmVxZHdqNlRIbVNGdy83dDVDa2Ezbnd1QUo5S2xpVC9V?=
 =?gb2312?B?S0VVOXdSbGlDajZlTk4ydDNtYXkvYVNObXVhQTZBdWRuNndLTk9vK1paelNh?=
 =?gb2312?B?YktSN3lSVTdjK3kzbnFsZ0oxdm1vQkdrOXNLMFhMNzh6MlM4SWwxZ3ZCWmcv?=
 =?gb2312?B?NHNEUTFkYlYxcFNFQXFKZlh0Vnh4dVRkY1g1dEZSVG1KcWJZaUZMWFBGdkdL?=
 =?gb2312?B?cCtYcXoyM0M3UzFOTjljbGs5V2NYWFd2ZE5iU3RMK01YODZndlJDQjFJbFE4?=
 =?gb2312?B?eUZEbDEyc3BNWDg3cFByUDdxVFc3NEdzTTFHaXFubUVZWlBJY1FoZGE5V1hH?=
 =?gb2312?B?MmVLeVh5MDVHNVpJOTZYYWd3Ky83aDhIVXRpcVlDSXpOMjcxeWFwOUxGMWM4?=
 =?gb2312?B?aU9OemFSZFljbVl1Z3ZKNUs4NGNiQUVRRW8yRmhBL2JWbXBWRzgyWXcxWFpp?=
 =?gb2312?B?NFM3VXlQT2pDV2xoWVJ4TmIvUEQrQTk3b2N2a2ZhNmxNaXAwczFjbTViVHkx?=
 =?gb2312?B?R0s0cEZIdnM5NkR6MjBtNmI5L2Q2QW5oZHVwZVpKUUkzQTRkblg0VGdzanlX?=
 =?gb2312?B?NU1PTjQydmltYSs3RDdPd3Uyc1VMSUdVOG1OcHJOa2lxUzI4M211WWVVeSt1?=
 =?gb2312?B?VG9hbzZoTHQvNlJobGlTSUEwMnR4VVVJWW1MYXM1Y3FMKzIyQUJWRE5rVkwr?=
 =?gb2312?B?bFlBYjRIbUZJWGp2U3VyeE95dmFOTWlZczNoZUlQQ243UlV4SVpoenk5VHRw?=
 =?gb2312?B?c1pxWnhFWmc1TWU1Q1lmK0NsWTNlWXYyTG1oTTVaMG01UXJpcUtzM0d4QTNB?=
 =?gb2312?B?ajlGV3lSUmJpaDIzT0YraE1MWU5kN3FHanFyMWxBYnRhRDRtbjRCQ0pSRFJZ?=
 =?gb2312?B?VWs3QkxUbGJVSjFySjJGeU9NbHJWb0RwU25uTHJ5VFRxekhvRERacitKZE9M?=
 =?gb2312?B?UWduRmVoMnpGczc1OEx6WVVtL0tRUGZxbWJuVGVwVStMRUVtMDRVcEVuSUEy?=
 =?gb2312?B?UjB3ajBCaE80UW5WT2FsRmhjNEkvMEtrSjNwUC80UVVYMkova0FWUUhlQjUw?=
 =?gb2312?B?ODVYN1JhZTRHWjdhZkQ4T1M2SlZCRXJITUtrTjdNWGlIRDZObWRJNDYrSlBh?=
 =?gb2312?B?bUJjZTB1YWlqMDQvajZDZ3BQQktvUjBNTmw4NWlFdWJyYjROZ0s3U2I5MFZp?=
 =?gb2312?B?Mi9SVGd6WVNlWUFNQU01SEtManVjNkR0NGNEOW14NHhjc2lrRFNPWGl0NzRH?=
 =?gb2312?B?dWVQL1JYRFU3TklpRVI0VmMrVWIyQW44eWhlVU44M3dwK2J1UTc0VFNWTGlu?=
 =?gb2312?B?bFBBdWpNSjdTdUhMZmp5ektnd0JzYTRhcGxkYVdmZUxmMUZsSm5oUXkrQUov?=
 =?gb2312?B?dTdYQ3oxcVM1UEFjMjV2SlNXSFFzM0Y4K0NicVp5MStIVi96QUZ6N0ROZGsr?=
 =?gb2312?B?TCtNNEJza0VzU05MRjE5dEFQdFc1bjNLMHZUc3hhVlFEWU1sVjdiMGNrVi9u?=
 =?gb2312?B?aEtWMkVRc1hHTjlDa09lS2dhTXVLUjY0bWRpb25UTWI0UFB0K2d0OWhPaGpz?=
 =?gb2312?B?SlV1cmdSL1M3eFRWUnkrWlFlQUhJZEU0SjBJTFFvV0hBNzVrc1hEeUhQTnR5?=
 =?gb2312?B?Um1zVWloNjMxNFVxRDlKRW05ZHBvdjExU2JyblpaRE5Xd2xmeGJVbVZUdjZu?=
 =?gb2312?B?RE16UDFMMHNkazhkZ2RFcWZGZkZBeStlWUhUT1I4R1pCaTdUYlNZTlBsKzdD?=
 =?gb2312?B?TUVRcFZpdXBlUGRqTTRmWTFGdGNFYXFteXltWHl2bEpWZjVaK2xuT0ZxVUpl?=
 =?gb2312?B?cGhmUlBqcTQxLzBsbXNhNW5UVXVtVGFQR0JQWGJpNzd2Um5uWi9FSDlGaXZa?=
 =?gb2312?B?aWZjaTNEcC9kZml2VS9pSFY4eFgxQkhDOHNFbEl4d0REMTc3ZFRadmI5OWk0?=
 =?gb2312?B?YnkwTWp0RVRtSTRpYWcwSTJyS2FQRlQxWmlWR0M3UDluZGR4OVR1dz09?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB1444484634209A3F18545AEC99B46AOS7PR01MB14444jp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	nitblJPVZObYISHtGy08WHYJ0zyh59csnTRJV1ebCkCLN4v5Ei0Uc4PacaRSCglyr2cNjx82HBDK/T7SsboJsYlxT4B9NQq4q2WFZvQqBVDiy4e+AWhCY0xloYkXq4CHuJ5sVNQjLvXYmuAvnNgSVBk4Xie6BjPFxzW8e9TnxfjinR+whdrAE3nN03C3DekcfBx/BNXKsih/LV/ldOYtGwFAPDIDhRUmBbXbbu6rUBM/WIRuYx1gkmKr5tQ2ZqGWmTpzam/HcOsCSak0J6WDSbIXvdfaPdWF21Kp9mNeWbHAqW9g97Ts4Qk47Q0lL/oDtfGS9ZFxiwPhjaAG3dOeyA==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14444.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab45f900-d71d-473f-6d1e-08de7e643c2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 05:16:50.4228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWi5HLYIKiS/WH6IBA/Mhq10lTT8BmW1jqt3guOMe6IJpI/jOf1e5pkVcAcgTWqPkNoi+68yyth54ALkuJKcbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12418
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232759

--_000_OS7PR01MB1444484634209A3F18545AEC99B46AOS7PR01MB14444jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SEkgQWxleA0KICAgSG93IGFib3V0IGNoYW5nZSB0aGlzIGxpbmUNCiAgICAgPiArUEFDS0FHRUNP
TkZJR1tob3Rkb2NdID0gIiwsaG90ZG9jLW5hdGl2ZSINCiAgIHRvDQogICBQQUNLQUdFQ09ORklH
W2hvdGRvY10gPSAiLURob3Rkb2M9ZW5hYmxlZCwtRGhvdGRvYz1kaXNhYmxlZCxob3Rkb2MtbmF0
aXZlIg0KDQpMaXUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0Kt6LLzcqxvOQ6IDIwMjbE
6jPUwjEwyNUgMDE6MjMNCsrVvP7IyzogTGl1LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBm
dWppdHN1LmNvbT4NCrOty806IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AYXJtLmNvbT47IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPg0K1vfM4jogUmU6IFtPRS1jb3JlXVtQQVRDSCB2Ml0gb3JjOiBF
bmFibGUgaG90ZG9jIHRvIHByb2R1Y2UgZG9jDQoNCk9uIFdlZCwgMjUgRmViIDIwMjYgYXQgMDQ6
MzcsIFlpZGluZyBMaXUgKEZ1aml0c3UpIHZpYQ0KbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bGl1
eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Kd3JvdGU6DQo+ICtQ
QUNLQUdFQ09ORklHW2hvdGRvY10gPSAiLCxob3Rkb2MtbmF0aXZlIg0KDQpUaGVyZSdzIGFjdHVh
bGx5IGEgYnVpbGQgb3B0aW9uIGNhbGxlZCAnaG90ZG9jJywgdG8gY29udHJvbCB3aGV0aGVyDQpk
b2NzIGFyZSBidWlsdCBvciBub3QuIFNvIGl0IHNob3VsZCBiZSB1c2VkIHRvIGVuc3VyZSBidWls
ZA0KZGV0ZXJtaW5pc20gYW5kIHJlcHJvZHVjaWJpbGl0eSwgYXMgb3RoZXJ3aXNlIHRoaXMgaXMg
YSBmbG9hdGluZw0KZmVhdHVyZSB0aGF0IGdldHMgZW5hYmxlZCAob3Igbm90KSBkZXBlbmRpbmcg
b24gd2hldGhlciBob3Rkb2MtbmF0aXZlDQppcyBpbiBzeXNyb290Lg0KDQpBbGV4DQo=

--_000_OS7PR01MB1444484634209A3F18545AEC99B46AOS7PR01MB14444jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
HI Alex&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;How about change this line&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp; &nbsp;&gt; +PACKAGECONFIG[hotdoc] =3D &quot;,,hotdoc-native&q=
uot;&nbsp;&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;to&nbsp;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
&nbsp; &nbsp;PACKAGECONFIG[hotdoc] =3D &quot;-Dhotdoc=3Denabled,-Dhotdoc=3D=
disabled,hotdoc-native&quot;</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">
Liu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>=B7=A2=BC=FE=C8=CB:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.co=
m&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b>&nbsp;2026=C4=EA3=D4=C210=C8=D5 01:23<br>
<b>=CA=D5=BC=FE=C8=CB:</b>&nbsp;Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.f=
nst@fujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;open=
embedded-core@lists.openembedded.org&gt;; Ross Burton &lt;ross.burton@arm.c=
om&gt;; Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>=D6=F7=CC=E2:</b>&nbsp;Re: [OE-core][PATCH v2] orc: Enable hotdoc to pro=
duce doc</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Wed, 25 Feb 2026 at 04:3=
7, Yiding Liu (Fujitsu) via<br>
lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt; +PACKAGECONFIG[hotdoc] =3D &quot;,,hotdoc-native&quot;<br>
<br>
There's actually a build option called 'hotdoc', to control whether<br>
docs are built or not. So it should be used to ensure build<br>
determinism and reproducibility, as otherwise this is a floating<br>
feature that gets enabled (or not) depending on whether hotdoc-native<br>
is in sysroot.<br>
<br>
Alex</div>
</body>
</html>

--_000_OS7PR01MB1444484634209A3F18545AEC99B46AOS7PR01MB14444jp_--

