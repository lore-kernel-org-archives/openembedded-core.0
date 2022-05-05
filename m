Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143AAC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 04:19:53 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web11.7070.1651724384409952515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 21:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Oo5fHjV+;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.87,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1651724384; x=1683260384;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VBXpa/JFXu9ArOQ7c8PmanInYhMzju3P7i4B3ODpelg=;
  b=Oo5fHjV+zEuFRSmPf5BMS1+shfAZeUkH0YZmjLNcLuGzimJjv64o97EK
   uJ0cHA18zDMIo454EJF5+iJC75fMGXuphsFSWKv2UpilmlapBSNM3hvWx
   LN6JO5T5KcLSyrYX3v8H9nSfHELugCLE6zZYhSO4ijYDOXR62Sf1EU8kv
   0nI7bCLeAuNYwi/joBy8tZ5evyMUhGWNVF5nogA86A9m8Sv9EOw5RNvD6
   /9xffUjJdQxuVJmlbOUr1+P7jTPHGsCtMbUJUJ/D6sQsWkROrdeOBn2cK
   ZGdcYwHU6PywyNkdpTmZLQALNroZoLEqHCqwY8FyQHQk5rJt1m27D+6bU
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="55228382"
X-IronPort-AV: E=Sophos;i="5.91,200,1647270000";
   d="scan'208";a="55228382"
Received: from mail-os0jpn01lp2106.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.106])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 13:19:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSiUAQqwDAiUkxHbKCMI2gqgWA7Twt/sScF/FfbUHiPnpSItFapzAVLqoKTOLP4ZrHMfi3uuP3ZFs0WiKfYl9QDVyTr13aOUsMCu2ufrMrNuEK1crwfEd7TffyWQYSaATCIsF1x2lazY5bPLdvkagZQcI601p/vuKoO9HNy/AnHQ6fnjAGGHba8LuVFV1DhpC0iy7ESRRXrEuI06rg0AzSmNPe/gLxQy9aEg7s9ZlgE3kEVpSDk/jzAc4mkPjVT+HNl8O0xutenpzwpXiUDTLzhudCZKAn5XhWYMe2Ck9XUBUeM3nsOME6lDQ+U8TwSM2ZqbfWd5Nsg2vpVPC685UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBXpa/JFXu9ArOQ7c8PmanInYhMzju3P7i4B3ODpelg=;
 b=gmNiAXn3l5dnI6Ll9oYGJULoZXwv4K+3nwY7uLN+FnCSRHrnsXcQQEseWp/dwSCGE75kNACvHuUBpHlzdtoBf/fSL+za+5nXkktnyaPWknJfTp/ILZrBeD7RTG+s1LP/SK2JPSQwAWSVArzf5aPhvNeilZG2oJ8QN8VInL5fX6ZUPZAZYnLmcRw+3wwrd0in8tLviYksuwnpJtCQev/VHtggcUJ2wQgP9yN5xY/qfQ61PeOitcbFoVpUSD4NLDMnjmRZaaNh/hFNJJD/mhidN6HDJe8XS1x1YNV4ZJDW5OaANikQ7oeYBFjkKTS3NUjTCamOiuWmMqHPjF0K4dKE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBXpa/JFXu9ArOQ7c8PmanInYhMzju3P7i4B3ODpelg=;
 b=W/eHSqqQTHlF6a0OPZNGvt4MJ0reupFyY1VGrB8mAIwIb3c4aN/YAZLuYk/I4lmg/a91wjQIE4LMAxLPJpIlFghTmY36/QUrChVUStsfVLs2rXSyBBD9/rmAd9VpwOnS+rmbO0Kep3K/jH+c8nOf9aaSoXufAM+2O0NzFGBOkPM=
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com (2603:1096:604:cd::13)
 by TYCPR01MB8085.jpnprd01.prod.outlook.com (2603:1096:400:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 04:19:37 +0000
Received: from OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254]) by OS0PR01MB6178.jpnprd01.prod.outlook.com
 ([fe80::a99b:c0f1:bfe7:8254%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 04:19:37 +0000
From: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gnutls: Added fips support option.
Thread-Topic: [OE-core] [PATCH] gnutls: Added fips support option.
Thread-Index: AQHYWtJc0OuL69Qvb02kFBRcyS3fZq0E+ZYAgAEW1ICAAGjZgIAJOnMA
Date: Thu, 5 May 2022 04:19:37 +0000
Message-ID: 
 <OS0PR01MB6178BDE0810BABB5034104C0A0C29@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
 <CANNYZj_5zAZvg_rbPw4C-YNA6ptohpxvDOXbCdNvj3Bom08b3g@mail.gmail.com>
 <OS0PR01MB6178D7CB066B54B254C078E0A0FC9@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj_qUUccE2Bntys3vQiPF=+u6UpFMXwhTmT9Ey1S=0XCuQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_qUUccE2Bntys3vQiPF=+u6UpFMXwhTmT9Ey1S=0XCuQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 521827c2-a5cb-448c-1fe3-08da2e4e7774
x-ms-traffictypediagnostic: TYCPR01MB8085:EE_
x-microsoft-antispam-prvs: 
 <TYCPR01MB8085A888355A4498B9A5D1F3A0C29@TYCPR01MB8085.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yt7JdPLu0NhWYFexyUAn0hlJ9dO/XKnRxTYmRu98AtUxAHQK/MODgjwq1Q5JSg92ghdf1gFz45cuPbQyuWU1psdKjbLhJ2FSsVW+wNOEQ9szMKxYKzdPSqxfL0CHaoUswfQuXj8qWJa1+GSgDzNUoY5fvA9CQ37g/onTgVchGrIRxSU3JCgl6T+FFsaRH4yUtQ9EQGoHuOVaYO3xjRYlJ/eRmpZnQVBFzbIzy6vyZS04q3WsR/4+/ToVbNLUF25NnZ8jtY/LPFK/v4e82Br1DbssTBoIHZqDv3RUmQIwqFAlPN90k9rWyvBCGOP2Qux9wrxb5qZILG/QRRrKP4lb1lcz8cWTzvJ+GInllhcR7VOfG0V1FUBSRTtKCBzGNq9paJ1ulkrijwi7aO8aWjSKKXmEx2bp/sproJUy9t/DM/pJht0h5X8H8G+fwL7NFD4iK5E+yYD2+D1We3l4Vrggx0653jIMcuTrs8n2hbI/Cuashy9UIvtTKquDwaW9X6o5rzIJ9FZTFcY6BwBcImA6y2KRUGETb03ZW177KYoicn9G0v/UePRlvNYI3VH9QnXpJXq2RfiwfnsoLqQk8brd8Qs0pRoZigZ38bxofFZylgLpzW93BvwnXYMZ9g9GttJCP7GURRfb6F/ojQGAVVSnSqtr5jStzNYuSeZ0q4mGW7yaeLto8/Ul1mrzgf5YYU8DE11EA2abHOMqJ2a37VVLFA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB6178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(38100700002)(8676002)(2906002)(66476007)(76116006)(4326008)(66556008)(66946007)(66446008)(38070700005)(64756008)(122000001)(53546011)(7696005)(9686003)(26005)(8936002)(86362001)(52536014)(85182001)(82960400001)(316002)(5660300002)(6916009)(71200400001)(33656002)(508600001)(55016003)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZTVablc5Vkp0emtQd1VyWmZ4VnN1a2EzdllLWDQrZUFReURFaVRtYXdEaDF6?=
 =?utf-8?B?djBZZ2k0K09weE1iUG5PNGgwTnVlZWFRdWlROHc4OE5Dc005amp2eHVRQlRt?=
 =?utf-8?B?Y0Iydnp2bEpkUjVWK3VRd2JUV0lJK2R0VDZ1RGx0VDFlUzFtemxzT0pqNlpO?=
 =?utf-8?B?R284dnpqdnVBaEJiclFITGtiMHBUV04vdlF5UFlRQ0szT2I2akpvTWhBR1Z4?=
 =?utf-8?B?cWc3TFhRSmUvQUxUNm10SjNXOHRuM3hLdDBwSWl6TXkvblFQcTVKTjNzMHI2?=
 =?utf-8?B?VDFudTJKa3BQZzJNVWxGZEpoc3U2eEo3ZytrZE54OTVjQVdtcmlzbTE4Rzht?=
 =?utf-8?B?TkJwUnZPcFIrN2RlWHpOSUtnVkRBcTVHWjNrVExKaUptYjNVUkJoVHBYY2pO?=
 =?utf-8?B?bURqTWJxQTdZWXo4QldEOEZ6NktzME1SY08ydnQrcmU3QU12ZSs5cTZ6R3VJ?=
 =?utf-8?B?L0FNYWFmdFZjZm4zcHhITUV5Zyt4QTZqWGdmVjNiaTlZMVIzSU1Ec0c2MmFD?=
 =?utf-8?B?UXVWczdnWFdiemNzNndVZG90d2NFbmgwRGJkd2V2THBET1p3eEVPcUd6NGhs?=
 =?utf-8?B?SU5NSTRUaUlHbXNraHp0Rld3bWZCNU9sWkJBK3BUVFQrd1lwNjAyeXp2bGw2?=
 =?utf-8?B?RFhaY3l1NmN1OHE3Z2xiTktOUFhwK3BObmVRS2IvRUdWWVlsRTgyOU85M0l2?=
 =?utf-8?B?UHl0OW9STWVRaGNrYzRlYlhJMm9EakxTTUR5aE5ZaXRDeldodTRBR0Voei9o?=
 =?utf-8?B?Q21YV0lucm50U0lyUEx6cGs3WmEyY2RRWXZWQXVENytPeWpQODR0dHZkMzNv?=
 =?utf-8?B?NmF2WG5EUGdYSlRPeVZYU1B5dVRwN1lOWlNGa0RNT0kzYnpFR0daSzV5T1U1?=
 =?utf-8?B?REE4a0trUlFTVDFxS3pWSEZxRkdaQnU3OGp2b2pkeXV1ZUNQVnlUdUt6WWJD?=
 =?utf-8?B?RUN6c280Z3JYdnRnQmFZRkRGeG5LT0E4dXlxNTVUV0h5MlRHZWNrTytPVjhI?=
 =?utf-8?B?N1dkZS80VXhici85ZUpUUjVMUDUzVjlvYkUzMGZRNFpvVlpKRzFFMTU0TjVs?=
 =?utf-8?B?bVYwTFd1Y3grUVlucWNFL2wxM3R0T3lDcjBNdFFyS3I4ZXhxeWV3Rlk0YVJt?=
 =?utf-8?B?ZWYzbEJnaEtIR2JNQzRxOStYaDdzMzdYY0RyUFJkM0JpcnBZWkcvMHhMM04v?=
 =?utf-8?B?VXFMY29RY2ZQSHNiWXJHMkdVUWlENThoWjhTSEE2RGNacThiV3MzL3RyKzhP?=
 =?utf-8?B?UFp3V1JyazZkaW9iMHNMMVJqc09kSjB3NlM3dVREdjR5NzJLbEljYjVzcVk0?=
 =?utf-8?B?TFB2NDc0VExCMlUzN2treTUxTVpVcWFMbURCS0NsemVPR21vTFQvUytsMVNV?=
 =?utf-8?B?dDRjK3l0STNZb0ZOUHVyVTlpL3NJMFMwYmFBRUtpMW9OYkJkZ3FkYXJ1MVg5?=
 =?utf-8?B?dTd3UWhzbzdCeXdORi9rbXNRQm9DaUNhUVJIK3dvQnp2c3pwejBqSmV3NXlQ?=
 =?utf-8?B?L3Z4OUFxZTJIekR5cE9BLzRQMWs2WnkyeFFnWTZ6MUJpRitUbG82R1d4K2NH?=
 =?utf-8?B?cnB2SFRydzFkWHVLUlVVWGszbUM0b3ltOHdNTXVna2wwVkl4VzlwVkRkZmpF?=
 =?utf-8?B?b1c4ODZJcjN2K2k0NnZ5NUM0eHM0K0VUY3BRZHJZKzc1c1J1a3pJeDRBT3Vz?=
 =?utf-8?B?MGlIKy8zL0M1SUxXcFltbVFCbEpyVkpiYzcvVGhJNUxoWTJpbzhINFVXYzUy?=
 =?utf-8?B?WjNkY3V3ZEpZNEErWTJ3OUsyUVk5WUthLzIxenNMSHI1WHcydDJnQmJSS3dG?=
 =?utf-8?B?QWhncHF0R2NuTURhYUs4UmJZNTNtMld5dzNjbmVGcUpVUGwwd29nU3NXNTJn?=
 =?utf-8?B?c3dacHAzbXBycGNiaXdvNzVNMVFQY2NUNHZNT2hlb1daNlZtbkFvVW11bm9l?=
 =?utf-8?B?UnFhRDh2QkJyRlNFUkYxTU9yQ2ZhOXE5cEVIQkhWbUJzdXgvc0tnZ2hzL081?=
 =?utf-8?B?K1NpUm8rQzJyVkJMQVN1YXZOdWx6TzlGV09rVFFWNk5Fc0JqdnNrZGVCb2hl?=
 =?utf-8?B?anlXWjArVko4eUhuWENvUm1iWHIrZm9XSHFDRTEvQXhWczRCcDZGV25OVUhv?=
 =?utf-8?B?U1JZaUUzOGg4TEU5dEJjSmZLOXVCWFJOVEJCMlhmWjE5Z05PdzluNG84MkVS?=
 =?utf-8?B?NGpyc3Q5VVpDdVlnZjQyOGEzbHJ6ZzhkVFJkTTIyd2V0UTd5RlBoeVByRTFw?=
 =?utf-8?B?Y21sSi9zVXNuTkRKVGVYaGFqRTFWYXlwVTdDSytueHlscWh4TlE4M0hZbExs?=
 =?utf-8?B?ak9CTEg0T083UU5xTDhGZzgzOER1NytxSnFscGNISzlURkxvcktFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 521827c2-a5cb-448c-1fe3-08da2e4e7774
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 04:19:37.2616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ere3SQ7yFWz09pb5vAB+rcuIdTaewGyVXfcIYqt3e/gJjMOp4a5DA4/smPIMQy9uYJ6wvTw1vkmlBCHeeIfoyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 04:19:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165228

SGksIEFsZXgNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IGJlY2F1c2UgbXkgaG9saWRheS4N
Cg0KPiBDYW4geW91IHBsZWFzZSBzaG93IHRoZSBmcmFnbWVudCBpbiB0aGUgTWFrZWZpbGUgd2hl
cmUgdGhlIHRhcmdldCBiaW5hcnkgaXMNCj4gZXhlY3V0ZWQ/IEl0IGlzIGJldHRlciB0byBtYWtl
IGEgcmVhbCBwYXRjaCB0aGF0IGNoYW5nZXMgaXQgdG8gcnVuIGEgbmF0aXZlIGJpbmFyeSwNCj4g
aW5zdGVhZCBvZiBjaGFuZ2luZyBpdCB3aXRoIHNlZC4gKHNlZCBwYXRjaGluZyBpcyBwcm9ibGVt
YXRpYyBiZWNhdXNlIGl0J3Mgbm90IGNsZWFyDQo+IGZyb20gdGhlIHJlY2lwZSB3aGF0IGlzIGJl
aW5nIGRvbmUgZXhhY3RseSwgYW5kIGhvdyB0aGUgb3JpZ2luYWwgYW5kIHRoZSBjaGFuZ2VkDQo+
IGNvZGUgbG9va3MgbGlrZSkuDQoNClllcywgQXQgZmlyc3QgSSB3YW50ZWQgdG8gZml4IHRoaXMg
aXNzdWUgYnkgYSBwYXRjaCwgYnV0IEkgaGFkIG5vIGlkZWEuIFRoZSBiaW5hcnkgaXMganVzdCBh
IGZpbGUgZXhpc3RzIGluIHRoZSBidWlsZCBkaXJlY3RvcnkgYW5kIGl0IGNhbid0IGJlIGZvdW5k
IGluICJQQVRIIi4NClNvIEkgaGFkIHRvIGluc3RhbGwgaXQgaW50byAke0R9IG9mIG5hdGl2ZSwg
dGhlbiBzcGVjaWZ5IGFuIGFic29sdXRlIHBhdGggb2YgbmF0aXZlIGJ5IHNlZCBjb21tYW5kIGZv
ciB0YXJnZXQgYW5kIG5hdGl2ZXNkay4NCg0KVGhlIGZvbGxvd2luZyBpcyB0aGUgcGFydCB3aGVy
ZSBleGVjdXRlIHRoZSB0YXJnZXQvbmF0aXZlc2RrKG5hdGl2ZXNkayBhbHNvIGhhcyB0aGUgaXNz
dWUpIGJpbmFyeS4NCiQgY2F0IHRtcC93b3JrL2NvcmUyLTMyLXBva3ktbGludXgvZ251dGxzLzMu
Ny40LXIwL2J1aWxkL2xpYi9NYWtlZmlsZQ0KLi4uLi4uDQoubGlicy8uJChnbnV0bHNfc28pLmht
YWM6IGxpYmdudXRscy5sYSBmaXBzaG1hYw0KICAgICAgICAkKEFNX1ZfR0VOKSAkKGJ1aWxkZGly
KS9maXBzaG1hYyAubGlicy8kKGdudXRsc19zbykgPiAkQC10ICYmIG12ICRALXQgJEANCi4uLi4u
Lg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4g
U2VudDogRnJpZGF5LCBBcHJpbCAyOSwgMjAyMiAzOjA1IFBNDQo+IFRvOiBMZWksIE1hb2h1aSA8
bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hd
IGdudXRsczogQWRkZWQgZmlwcyBzdXBwb3J0IG9wdGlvbi4NCj4gDQo+IE9uIEZyaSwgMjkgQXBy
IDIwMjIgYXQgMDY6NTEsIGxlaW1hb2h1aUBmdWppdHN1LmNvbSA8bGVpbWFvaHVpQGZ1aml0c3Uu
Y29tPg0KPiB3cm90ZToNCj4gPiBTb3JyeSwgSXQgc2VlbXMgdGhhdCBJIHNob3VsZCBhZGQgYW4g
ZXhwbGFpbiBpbiBjb21taXQgbWVzc2FnZS4NCj4gPiBJIGZvdW5kIHRoYXQgaWYgZW5hYmxlIGZp
cHMsIGEgYmluYXJ5IGJ1aWxkIGZvciB0YXJnZXQgd2lsbCBiZSBleGVjdXRlZCBpbg0KPiBkb19j
b21waWxlIHRhc2suIFRoZSBsb2coTUFDSElORSA/PSAicWVtdWFybTY0IikgaXMgYXMgdGhlIGZv
bGxvd2luZzoNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gPiB8IC4vZmlwc2htYWMgLmxpYnMvbGliZ251dGxzLnNvLjMwID4gLmxp
YnMvLmxpYmdudXRscy5zby4zMC5obWFjLXQgJiYNCj4gPiB8IG12IC5saWJzLy5saWJnbnV0bHMu
c28uMzAuaG1hYy10IC5saWJzLy5saWJnbnV0bHMuc28uMzAuaG1hYw0KPiA+IHwgbGlidG9vbDog
bGluazogKGNkICIubGlicyIgJiYgcm0gLWYgImxpYmdudXRsc3h4LnNvLjMwIiAmJiBsbiAtcw0K
PiA+IHwgImxpYmdudXRsc3h4LnNvLjMwLjAuMCIgImxpYmdudXRsc3h4LnNvLjMwIikNCj4gPiB8
IGxpYnRvb2w6IGxpbms6IChjZCAiLmxpYnMiICYmIHJtIC1mICJsaWJnbnV0bHN4eC5zbyIgJiYg
bG4gLXMNCj4gPiB8ICJsaWJnbnV0bHN4eC5zby4zMC4wLjAiICJsaWJnbnV0bHN4eC5zbyIpDQo+
ID4gfCAvbGliL2xkLWxpbnV4LWFhcmNoNjQuc28uMTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQ0KPiA+DQo+ID4gU28sIEkgdHdlYWtlZCBkb19jb21waWxlL2RvX2luc3RhbGwgdG8gdXNlIGZp
cHNobWFjIGZyb20gbmF0aXZlIGluc3RlYWQgb2YNCj4gdGFyZ2V0LiBJZiB0aGVyZSBpcyBiZXR0
ZXIgd2F5LCBwbGVhc2UgdGVsbCBtZS4NCj4gPiBBbmQgaWYgdGhlcmUgYXJlIG5vIHF1ZXN0aW9u
cywgSSdsbCBzZW5kIGEgdjIgcGF0Y2ggd2l0aCBhbiBpc3N1ZSBmaXhlZCBmb3IgbXVsdGlsaWIu
DQo+IA0KPiBDYW4geW91IHBsZWFzZSBzaG93IHRoZSBmcmFnbWVudCBpbiB0aGUgTWFrZWZpbGUg
d2hlcmUgdGhlIHRhcmdldCBiaW5hcnkgaXMNCj4gZXhlY3V0ZWQ/IEl0IGlzIGJldHRlciB0byBt
YWtlIGEgcmVhbCBwYXRjaCB0aGF0IGNoYW5nZXMgaXQgdG8gcnVuIGEgbmF0aXZlIGJpbmFyeSwN
Cj4gaW5zdGVhZCBvZiBjaGFuZ2luZyBpdCB3aXRoIHNlZC4gKHNlZCBwYXRjaGluZyBpcyBwcm9i
bGVtYXRpYyBiZWNhdXNlIGl0J3Mgbm90IGNsZWFyDQo+IGZyb20gdGhlIHJlY2lwZSB3aGF0IGlz
IGJlaW5nIGRvbmUgZXhhY3RseSwgYW5kIGhvdyB0aGUgb3JpZ2luYWwgYW5kIHRoZSBjaGFuZ2Vk
DQo+IGNvZGUgbG9va3MgbGlrZSkuDQo+IA0KPiBBbGV4DQo=

