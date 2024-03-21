Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F98C54E67
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 01:20:07 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web10.4076.1710984006470869798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 18:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=b++gwQjj;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1710984007; x=1742520007;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0B4FTANOfoJYjl3be/yJdG9EMFWMKHgs1xe8duxDItg=;
  b=b++gwQjj8C49+i4ubezEgUKJYdbupLDF7TDk8oHgPyp1UgSNd/S65OcM
   qnhDyLCTHVpJQkHxCSa1+Y2Zb513RdUasTAxZT9YpmCRWOMmI3kg6Y76u
   4E97qiprSSFCl6umo3DIM8AX/Cs11mkc7uJKN85NUg3npWTWURrLKEM5s
   z+EaBchomQNznF9c2FJgjM4Iq3Zuriohn3bzxvfxNa73l+u/z6/LB6AC6
   pIRi0jytpQHR7QrK5HO4BWOpFpJYE1/FH2pUZPJVMbofmrzSWjdwZrNeN
   amCjLj0o7GB+kAu0UGjo19RjdExKMY5qyJPfz2nZEJDHpyu12HclL5lSa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="114588768"
X-IronPort-AV: E=Sophos;i="6.07,141,1708354800"; 
   d="scan'208";a="114588768"
Received: from mail-tycjpn01lp2169.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.169])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 10:20:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0uUkoW0BeU4s26IZzGEiU06zUO9AMqSeZ+3h7pOL2cc5CZwsyySugJbtUNT9HsBS1/6ATLuCiZhQcmY4k/nF5Q+h9Ola3sQIP1bvUtTBMWMlH7rIUFOBPBmXJtbXiy62WycUzcNaclogaLiCiWYzvmnA9dRzPEZVH+X8fOvnKl3TkcLFcNafDNt9ph6Eo8p83XmZq1Zr0RSOmxMNPpste41+LEmLxd8sQvwncNwp6y2JBOk9zcGyu9U/Rf8bNOaeADlWgNswEGU20bh1WaFGFzzWKTrrT/+0IuLcwrE7hCV7zVlfkz1luSDqFEmdHUOhxcBALciz/hAYZGsdXXc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B4FTANOfoJYjl3be/yJdG9EMFWMKHgs1xe8duxDItg=;
 b=HZ01GOBZaqd73+utPswTBU1H/whIwqd0iyYmd+hWzMsHBUq3JpZPK7M71JoCbfNU1afq5CE1MA20yI+UBJSjMAGOYW998PPZcippUL1rWaO/qvbr1Kn/ZoCECzA9kJFnp7zbRojdd9rd0v+MbX6FIoEIybVjQ9YyEmeNofMpB6raxK6x1/1dv72n/3jfTCvF13awWrMsEL3pG3t47VryE0ExVrowK6Ytspn+JuIHB3+wBNLX6aeB9t/NX5eN4/odWb+XoBCLScbNjmH/MlUmGo5FKyLsrtRIkJLEI88EyDcN2s2k9uTFfgaVUJOAY+K3P+oL2zlqOeIaQLR3Cabn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB9416.jpnprd01.prod.outlook.com
 (2603:1096:400:195::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.35; Thu, 21 Mar
 2024 01:20:00 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 01:20:00 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libbsd: Fix conflict error when enable multlib.
Thread-Topic: [OE-core] [PATCH] libbsd: Fix conflict error when enable
 multlib.
Thread-Index: AQHaeZa+e4q8+IC4REam4zjoq/wgEbFAGcuAgAFNlNA=
Date: Thu, 21 Mar 2024 01:19:59 +0000
Message-ID: 
 <TY3PR01MB110567C69384E6A28000C11FEA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240319004524.1270639-1-leimaohui@fujitsu.com>
 <CAMKF1sp69BBJjUCFZ2Jnk3jE8O-kmhFfLg0CjxodykmZbvP_Vw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp69BBJjUCFZ2Jnk3jE8O-kmhFfLg0CjxodykmZbvP_Vw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NDI0NTNkOWItZjEzZC00N2Q3LTgxZDMtYzEzMzZkZjQ0?=
 =?utf-8?B?MTVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDMtMjFUMDE6MTU6MzVaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB9416:EE_
x-ms-office365-filtering-correlation-id: e2d5ce81-02ea-4599-82b6-08dc4945071e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WJyHQt21BMa2NN/gYPy2Xh3wXwNjy1xSgi4KW+S78+PqWQdnbhtBDP41XHwpMapey9IEuGtHV1G1Yjn+JigwUhcpzb02/Y2zNJwSfcwplB+/brFSRxkVmK8b690WpeXhuSBA6phFXC8RNWQjRQGF1MX9o3BqEPe1iHuk3J5ASJjkpPdqYWwwif3WlYa9UFILM9k2ZSV9nBxk74RaeRPjLw9sKRK0+YmInYeefy5megTQWYI6vbVTbQDiS15jERnHyWQcv/k94+B6QnTuNA3G8jP+AEkp9rymPyUFnaPFaarYlK50NqZeCuLGF5tmVtx3TJ4XB+7II+1a+j2DrFmqKHRu9BypMTlM2HRheMVob24DlTlWJbbBsfBNsJUD+eidEunS0IGeCW1CX3MsC57CM2CCawMQG6AxHEJQRoEOkV+xSvLBfUzyShi/JidhYA/OjksupngwcctqYEuhElOsgKCYYxxlDuiVXV1UfpxvCkF8syp4UM5xYUuIFERfuvd68yEmT0iFvH6HY8tZ388c8CPYfxtugHnnxsZxWVwYMzdfgIUnd+ZrhSGYUlYLypcBoa1Tg9XdMXgfYs+PI6XRrOFa0NV7+ze35oAEP3SNrVoe/U8uY6NZ7jAaWvx8RqdkWe5jBYf7RA5/bYQ9d6Qh1mpprPP8guXYdo8i8qYS1wbk7mj518o2ewNJMgtDWgPN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TXFTTFhmQm55eVJJbHQ0a3c4SG84ZjN4YVdIQXY0ZjhyZ2VXS1d3NWw0dWRZ?=
 =?utf-8?B?b21ieWQ1ZVd0S3F4VnltbUdTZVdSWWJuMG83dXpuQ0VkbUJndzAwRVpjZGZN?=
 =?utf-8?B?VEgrd3Y4UUVzNWRoYzlIazFTeDlLMWF1Y2l2UFlyOTgwanplOTJRT01LcW41?=
 =?utf-8?B?ZmlzK1RCa0svQUxMTEMzcjlFcDYyVWwwUFNoa2FyVjJxS29jL2FjMWxrbjNn?=
 =?utf-8?B?U2J6TkNzWW9Ia3VGYnd1a24vR0RmYVBiT1Y1dE5ibDBPdmUwT3M1a1NvbWxx?=
 =?utf-8?B?UmUrSHJqZEJLY2dhRlhqZXBZVFBVVjlOMXR5MnpUd2oxYURHb2NOUG41Kzl4?=
 =?utf-8?B?b0xUV2ZPTVU2WktqYnZLeEJSbWMwdXZuZjBxS2JSaEZQTCtyZTJmbHY5L2ZV?=
 =?utf-8?B?aStTd0Q4SXIwU3QwTzRGNHZrc0pkVEpiU09VRGhwSWY2Ky9nRHhmNUJrRWJW?=
 =?utf-8?B?SVZ1Sm5yMGRsZjBLMDJSUEluS0RSVVlLNEJEaVQxSUVhcll2ektEemJoaW9O?=
 =?utf-8?B?aWVqa3QzTWVWd21EWjFPS0Z5dEtmRUFnZGVhVjdKOElzWWJ4SWJPQm9kK0FS?=
 =?utf-8?B?V2VGNk9ZMVhpY2YwU0NWSEJvWFdNWGRoVEU2dHVCSXM4WGFYOHAyV1JxVjNl?=
 =?utf-8?B?ODdpMXJ0a3lUZ0JqSkJFODZFdUgrMUo0QkhQUmNFZG9JaklNazlpd3VNdEk4?=
 =?utf-8?B?ZjNrYTNaYkwxaEpsWEQ0VDJGK3RLUjR4cUVmd0FnOG5pSmNxZ1R0aGREWVRl?=
 =?utf-8?B?SXRjb0NibEwwcWlGcXhTdHEraTEyV0tRQXIxMkNFWjNlS2U4djloQThDbE5J?=
 =?utf-8?B?dzNSZ201cW8rQVJVNkVOUkoxeGsxZVg5cGx6RlVyQkp5RVR5S01vcFJFT1VW?=
 =?utf-8?B?OVowZnJUekVTS1BtRXFqWEo3Y1J0aXhnY2x0TXRKVER1bXhvb1BjQmc1TFRx?=
 =?utf-8?B?VlZlL0NjSlRuazFPeEMxSGk3NHhjZEZybHlpYmUzNlk2akpGMFZNQnV6MVkx?=
 =?utf-8?B?UTdlRlJOZnNxQkhjWDBHQS94akFrNXhWeGJJTHRPK3FLZTMxZE9tSFJONHg0?=
 =?utf-8?B?eDcyd2xXRHpPUXlDa1RYMnRuTmtXUmZ3M3JZN2ZxT2FENU01VFY5Qkl6Nm80?=
 =?utf-8?B?ZmdCNEpwZ255UW5QZks5N1ErbFhCeXNMcGFnUlhDS0lyRFJMRllxUTRXRFlQ?=
 =?utf-8?B?cHhrRjV6ckg2OHRkZWlpbmJ0UDd3YnpibkZBeFdGaXBNaHZBdHVJSlE0MlFw?=
 =?utf-8?B?d0xJLzNBUXM2eXZrUjFFU2IwNjYxVWIyb2JzSGxxNEV2Rmg0aktpOG1NMEov?=
 =?utf-8?B?RFoxeDFDMEhjVnM4R2JvbW5MNUpOaVNkdkdqRVc0R00xUkdrSS9zUVVta1VU?=
 =?utf-8?B?N1hidkFONHVBVk9LdW1ncExtVmJMWC8vVVM1NWVBUWw2eE93ejhCUVRvUTQw?=
 =?utf-8?B?ZURFcEJWd1FDb3J5ajJpU3VRc1pVWGJtSHNWdFIzQStWcGlGanNGeitHajJX?=
 =?utf-8?B?ZnJoYVI3SnY5blpNNFIrSjdIR0xSRWJLMUVhb3l1M0ZGSDRtcm9qL0VFc2ph?=
 =?utf-8?B?djdXUkRZdXNTaFFWZUc3cWd1ZVFGRGtaNEFSVkFNWTN4ak9Qb3lkb1RlNnVx?=
 =?utf-8?B?d3V6WThETTVOT2ZGUEw1NlVxQktkT2lkRXdJK01MK1F0Tzd5TWtvVjVrbGNl?=
 =?utf-8?B?YUQzZ0srZ0ZFVTBQQ096eTdZYjBGVVIzV0twU2kzNzBjRzN1UmF5YXdYRFk4?=
 =?utf-8?B?MVZkUlZUTkJSSk9PWjRTZXl6cGMvR3YwUU40Qkc5OU85Vy9XRTJaeHY1ajYy?=
 =?utf-8?B?bUZEdk1NZ3l6eXV3TVAwekh4SmhWN3VONkZmb3ZLMDB2S0RxREtzTWxwSUNU?=
 =?utf-8?B?d2ZNeWZpUEg5aEcvYkpZMkNuYW13UjFCK2xOSVBRQzNSVGd6dUIzUHQ2cTJV?=
 =?utf-8?B?VlVyYldDd0lGdmN5WkhLbklBZFdhcDRtVEJpdzJDb2ZVU0tiUkg1OEl4ZUd3?=
 =?utf-8?B?TWxrcUJLWEJPbmxUWWZjd1AvOCtyaGNqeTBaSVEyZTMySmlRc291Ri9LZmhT?=
 =?utf-8?B?MXNoNTVLOXo4TDQzWG5hc3JRYlVNY1kwQS9vN0tJVFY5UWRkTktmaERNNEhW?=
 =?utf-8?Q?CXwOLgzFDw7JrSgkM+FmBfaN8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DONYMM/WbQz3CFt8Bj8Sqpx717Ro3cWbvYwrzH6uuBWL2mfWbXU124kWnx6bL5FIKUkkzkdQ0U3yzpxDflqHR2PGioWjmtDlcFaxux5kRv8LlAlrIAk+ThrL/+uYlRctus8Dld2YAtdoH1qXDIj8M6IkMak1c4lxJXoq6mFBRSXIvoDbhTXlPUp3iys1pKhxGAcNSPCePV2x7PorkWte+MUZQbM8KxbiqdSZGYurbLBM1jpRMei/Y0JdmKFHZ94xXHV15jLMPnrb8+uzaScJMEEatPosI+KMGGw3IUwLq1ht1drfyGowJUw72v9Spu56l0HToCd0Jmr1GNDIMZF7LHsQ/Dmecy1lejrxaVj0qAzwzr54UT9bpbOVQ76s0UPV7B/mIzLYb9X6NJpxZMpZb2+6klyCGdEHU2IvSMB9scqYG66sDYuFxcVR6UJoViTacwUJOVQ1OQ7DepSMFLHDtK3RENUfGxfZAs2pNz8PkqDyFxwAgk3tOL+Ww+Q3ZTvdng6yDtjGl5OiCd03nxITsUx8S3sAMdqAlgySRbUxfHVQqHLBEsnAvp4w6uWQE4JicYXfEIUjNGTW6HBZ2ydlwfQ7SNrv6J1C3BYlgLPEhqOcyZrQYoN48ABIT9WfqLwm
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d5ce81-02ea-4599-82b6-08dc4945071e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 01:20:00.0228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmWeAsxWm/vMxIQp/I/aijdSLJEY+fbM12TFELGhw2FTFdlr4E25aX2pb1X3lUn0Z1ifxTHmf4pd/ifOlVWC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 01:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197403

SGkuDQoNCj4gVGhpcyBjYXVzZXMgbWcgYnVpbGQgZmFpbHVyZXMgc2VlDQo+IGh0dHBzOi8vZXJy
b3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNzU5NDczLw0KDQpJJ20gc29ycnkg
dGhhdCBJIGNhbid0IHJlcHJvZHVjZSB0aGlzIGVycm9yLiBJIHVzZWQgdGhlIGRlZmF1bHQgcWVt
dXg4Ni5jb25mLCBhbmQgYml0YmFrZSBsaWJic2QuIFRoZXJlIGlzIG5vIGVycm9yLg0KU28sIGNh
biB5b3Ugc2hvdyBtZSB5b3VyIGNvbmZpZyBvZiBpNjg2LXlvZS1saW51eD8NCg0KQmVzdCByZWdh
cmRzDQpMZWkNCg0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDIw
LCAyMDI0IDE6MjIgUE0NCj4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBsaWJic2Q6IEZpeCBjb25mbGljdCBlcnJvciB3aGVu
IGVuYWJsZSBtdWx0bGliLg0KPiANCj4gVGhpcyBjYXVzZXMgbWcgYnVpbGQgZmFpbHVyZXMgc2Vl
DQo+IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNzU5NDcz
Lw0KPiANCj4gT24gTW9uLCBNYXIgMTgsIDIwMjQgYXQgNTo0NeKAr1BNIGxlaW1hb2h1aSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8bGVpbWFvaHVpPWZ1aml0c3UuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFv
aHVpQGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gRXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6
DQo+ID4gICBmaWxlIC91c3IvaW5jbHVkZS9ic2Qvc3lzL2NkZWZzLmggY29uZmxpY3RzIGJldHdl
ZW4gYXR0ZW1wdGVkDQo+ID4gaW5zdGFsbHMgb2YgbGliYnNkLWRldi0wLjEyLjEtcjAuY29yZTJf
NjQgYW5kDQo+ID4gbGliMzItbGliYnNkLWRldi0wLjEyLjEtcjAuY29yZTJfMzINCj4gPg0KPiA+
IFRoZSBkaWZmZXJlbmNlIG9mIGJzZC9zeXMvY2RlZnMuaCBiZXR3ZWVuIGxpYmJzZC1kZXYgYW5k
DQo+ID4gbGliMzItbGliYnNkLWRldiBpcyBhcyBmb2xsb3dpbmc6DQo+ID4NCj4gPiAgLyogRGVm
aW5lIHRoZSBBQkkgZm9yIHRoZSBjdXJyZW50IHN5c3RlbS4gKi8gIC0jZGVmaW5lDQo+ID4gTElC
QlNEX1NZU19USU1FX0JJVFMgNjQgICsjZGVmaW5lIExJQkJTRF9TWVNfVElNRV9CSVRTIDMyICAj
ZGVmaW5lDQo+ID4gTElCQlNEX1NZU19IQVNfVElNRTY0IDENCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjEuYmIgfCA2ICsrKysrLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjEu
YmINCj4gPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4xLmJiDQo+
ID4gaW5kZXggMTYxZGM2ZGY0My4uODRlZGQ5YmFmYSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMS5iYg0KPiA+ICsrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4xLmJiDQo+ID4gQEAgLTQwLDggKzQwLDEy
IEBAIFNSQ19VUkkgPQ0KPiAiaHR0cHM6Ly9saWJic2QuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2Vz
LyR7QlBOfS0ke1BWfS50YXIueHoiDQo+ID4NCj4gPiAgU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4g
ImQ3NzQ3ZjhlYzFiYWE2ZmY1YzA5NmE5ZGQ1ODdjMDYxMjMzZGVjOTBkYTBmMWFlZGQ2NmQ4MzBm
NmRiNjk5NmEiDQo+ID4NCj4gPiAtaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnDQo+ID4gK2lu
aGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBtdWx0aWxpYl9oZWFkZXINCj4gPg0KPiA+ICBERVBF
TkRTICs9ICJsaWJtZCINCj4gPg0KPiA+ICtkb19pbnN0YWxsOmFwcGVuZCAoKSB7DQo+ID4gKyAg
ICAgICBvZV9tdWx0aWxpYl9oZWFkZXIgYnNkL3N5cy9jZGVmcy5oIH0NCj4gPiArDQo+ID4gIEJC
Q0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+
DQo+ID4NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5l
ICgjMTk3MzE1KToNCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzE5NzMxNQ0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwNTAxNjE3MS8xOTk3OTE0DQo+ID4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvdW5zdWINCj4gPiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPiA+IC09LT0tPS09LT0tPS09
LT0tPS09LT0tDQo+ID4NCg==

