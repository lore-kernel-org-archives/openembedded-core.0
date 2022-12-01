Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A0BC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 12:34:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web11.41823.1669898081865168017
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 04:34:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mykBsM5W;
 spf=pass (domain: arm.com, ip: 40.107.21.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTFx2Vzdb9YnEDQjg3VaSJiUPNKI6+k+Pl1MKUhPhr72s7tz+uQ0ZcGkSaplVFvtR72OIIgP6qqokwmJ0GiQJUJZqlRoeYHDkpf+VNv2nnDSET1a9sSZBI5bVXjuUuUMKM14HmGO4FVHgBpgbVlx9N7oqs0i3YF3TKRuu25gnwRyNhr+huhQnT4GG9N2mJXDhQbwTJh3rssPNmlX6fgNLcMkIRhpWsIxG8CtkIsaIkIpd+4APA3gfqYojdq1+7Hc1R/lcptpKCIw+kf1Uls2JyboLq8k4ENIXgiKRWuHP06HxLwkcDJqY9rpYknml2UJJ7r8F4sAvFoXFfmQHt0/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9Y6B+0VqourwosW2HJ6XBhxVANaJnAIYTr8juJZNAs=;
 b=M7gLDy8zB3W2j8CsTti6X6ia/OxD/GKNs8aFg98+gXxtIV6xFdeTCuvn2uBVupVTwA2255Fz0zPcXYdB/6agexovSCOmt09YEQfAThBOkIXIqUbEW/h0xhlDAIRmeWtPgFBBriH0t7BkR/D/HC/dtNIuC0xN0pqJGUK1r6MTQU477n8hNR1+o4GVZKIIYS46EEua+IXInbfNTg+X+SeEd2SJ+EBiZXjuPeIbZhcgk6dk8KvK8Vo7Pd+BwQWC/wpTzj3DwAp1hNyCQGx9iienelfskYpqKA1yIR8agmpsCmFJO8C/3ioKerxgDcrPGZB2N0obSs5NTsN1IZh3GIeaIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9Y6B+0VqourwosW2HJ6XBhxVANaJnAIYTr8juJZNAs=;
 b=mykBsM5WO4YKUYd2VteiMQjmxHXF/JogXO+cG3mWqhausiX/mfJdGLsbY1Hv6ex3GMvt4uhHWdgPCgIzL9uDDe8q6ZfZ67ntFtxnwAOrSENbMFwmhVBDYkvNikJMygHqPRNpHOnYJmbnN0KPhGyTPzl9cbOnrEjGae89gfXNq/M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB9879.eurprd08.prod.outlook.com (2603:10a6:150:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 12:34:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 12:34:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
Thread-Topic: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
Thread-Index: AQHZBVoLjHjadAJm40eTO1fNEmQcQq5Y98gA
Date: Thu, 1 Dec 2022 12:34:36 +0000
Message-ID: <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
References: <20221201075324.353632-1-f_l_k@t-online.de>
In-Reply-To: <20221201075324.353632-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|GV2PR08MB9879:EE_
x-ms-office365-filtering-correlation-id: c1c5cc56-ebda-4f2f-c8cc-08dad398682a
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TvfD7GyoAlm/osC1mNdfaNkjHQIgrAiTOyHCuYIP9G/gxAsu79v0l8pbEiTQPNMdac5LinAV92uFpkWN1pb6baRuUWktGWBxkRJwyYrH7lTezZ2p5CcffDmgL5VwDiHlwu4k7tnAg0jn6rZPpbzRuy7/SNKxQOUIwPqm2NmT+uYrdedunJcyXEfbdEpjXr0PYbTf2wgrBrHlisPSYILqWq9T3ahwnpbl7a8u2e598IMVlOr2btCdO8l4LKvS4cc5ZVHXrbK425x06K8XnGf+SSnBl0LeBXYEMMupGj1x7Rvmd5xoIJ7utdzSBaZxxuf0sqTx6MbGVIIZD6T1In9hNL6qDTkuSHHQHCvMsUSDR1qy+bNKd0mVE0qecQ92a7TWTGYLoBLAUem8dzcv8tAQ/P9uvfz81PWEI6chScmSelGjA0DJ1DWAnDyTvPWwSgIj88Tyv5zsICpidDpkcjQef7Zs1hLuTjdKGBiQBbwmUk+LUlTQS/qdURuRffnbY+DnhZW9l1oPZia12/a6TbPnp0unf3IYiF/CbFrVLEpJBxF6NYMTbVtiXTXisHWie0BlIDFsmopbT3w0+uBCGIGsV2DO0K636WrEwCqhuR5ACTTsuCHCZ5XsaWkim/CTW5B1s947844cjP4+WYlYBtuMTpviz3rAv4tWHDcphP4HqV+1iAmo3MHQptMsHID5NCTguMw3bA64YlYIN8xwBYSw3p8zKjFwe7bnrJL7QabqZR52VwSHn0wSkJX09rIZrmiAOng2qnJMZGVCGhncVuz/tA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(376002)(346002)(136003)(366004)(451199015)(6506007)(478600001)(6512007)(26005)(71200400001)(66946007)(86362001)(6486002)(66574015)(8676002)(91956017)(83380400001)(64756008)(4326008)(76116006)(6916009)(316002)(66556008)(66476007)(66446008)(966005)(8936002)(33656002)(36756003)(186003)(41300700001)(2616005)(2906002)(38070700005)(122000001)(38100700002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NTZ3UUx0OTlnNW5Xd0VjbGVUTWRPUERJeEZwUEFFWWptWi8vekZPamloTldh?=
 =?utf-8?B?RXBZQ1ZSRGJ2TklJYkJieFZncG03SzhWZ2laaFQ5K2JEejFKUndxVGVQalo0?=
 =?utf-8?B?Mm10bjJBdk1yWU5vYVlkQWpzUHlTTlZZSWExZHJHclZROGZHMlE1ZngvM0Q0?=
 =?utf-8?B?UWFtd0lSWDhvU1NjSERiWHVvelZ4bTc2aER4ejBxNndZbVpQelAya0MzamJD?=
 =?utf-8?B?YlJ4bkt3WGtZbHdlMnJwVFJGdThTeDNDOEdmaE1ZdGY0NkdkQWZXckRSL3NY?=
 =?utf-8?B?bks4NzJkcERjMWlTMEw1NUlhVUtlSXVUVnZGZE9VRFdteWdRVUdQaE1zWUk1?=
 =?utf-8?B?K3JqbE8rZ3gxa0c2WGdINHUxTjRtK3BKVExpZTFZMGVnQmJjR3BEZUVMTzdm?=
 =?utf-8?B?S0hwVHlqQ01KeUFjQWd1M1NnblZCUGZQdkpJME9FRjBXTXBBbmFFL201SmtE?=
 =?utf-8?B?K3BOQTVpRS9pRTQwek1PdjhGWjNBY3RmVHl1cGozUFM4anQ4VytvWTF0WkJs?=
 =?utf-8?B?NEliNFd4bDhrVHVPWEJTdTltZnBwT1VXOUViZ3NnaC8zNTVaWkErSlVUcnFP?=
 =?utf-8?B?b0FpcldPTFFlc3VwbTlNczlKUExzMHk5RC82UnJpMmw0emJCMjAxZUdPaDlV?=
 =?utf-8?B?eSthUnRDQmY1aHdpTmNOKzR4TmlPa1pkOVlhMkh1OHBlU3oydU53elZRc3VC?=
 =?utf-8?B?d0lUMlhWUW9vNTUySGNIeVV2MTNtSnFyRTUxQmNUNDdYd2lnc25WUzN1QjBB?=
 =?utf-8?B?V0tJUFdHbEtDRHUrYmQzL1diTmJHUGRKY1BxUFpJTmhPbEk5RDBHWFhibkNi?=
 =?utf-8?B?YkprU0o0a21QdWsrc1VIZmVSOTdUaU1xVlJiNElFQnB3ODh5eHE1SERWR3lr?=
 =?utf-8?B?K2c2SElXRzBTeTlHTTNob0RGVFEwMUM3Ry9JVm9DeXFJUFRKdm9pU2R3RDlj?=
 =?utf-8?B?TmIwN1BYWGRFTXJHNjdVeVdHMkRzQ0hNcEwzQUFLc3BvM2pyWFRjeTFtTTho?=
 =?utf-8?B?QnhsRjM5d0FUbXNkKy9JM1Z6bW9MVUFVSVNKSnZldi8vNkJjZmplc3lQOHRn?=
 =?utf-8?B?d3cwN3BKMTdlQ2YxRXI3dTNFYTE4aWhGU0tmWFE4VGc3Q3VCcUY2NkhDVU1P?=
 =?utf-8?B?dU5LZ3FyK3AwcXRUOWt3b2NMRHhlWmlIMjByanVVbEV0ZHNCenFCS2xPNW82?=
 =?utf-8?B?TTdPZEgvdjN2eDM3aEd1YTM3U2NCTm8zREZJS096YnNldE1PNlN3RlIyblNN?=
 =?utf-8?B?U3c1WnhzNUdTa09lcDhCbXNIUzJOQ0M5RUFzeE04cEZKNGNYTWZMVllPMCtB?=
 =?utf-8?B?Q1ovenVNUkFRWmk4UytvZmkxWUdBUFFYVWIzR2hqVEFtcUdrelV2Sm1jR3hx?=
 =?utf-8?B?dFpKQnJJd2xnZm1ueHgrUjB0bHhRcnN0Q1NKYmxZcEpZRXlhNlF1bCs2dG9V?=
 =?utf-8?B?cURtWWFCekNNckxuNm9yeDFsSnRCb09MRVVLUWhQNnR0YUpNWFY3bDRqQndE?=
 =?utf-8?B?SDZwMkFHYlQxc3FCbkFtR0lsMm84OUZWaC9lbkgzQzY2L1VKSG44K2hvblBk?=
 =?utf-8?B?UzEwb2tFeEZXaTZmNmo1ODRVWkdnVWx6dFdYeGZyc0VHZVFWbGNkMEpUSUI5?=
 =?utf-8?B?N0RsWjM4K1VtTTM4QVJnYVl3SzFLV2x2MVRCbFdGRy9HaWJHQkRKdHBodVl2?=
 =?utf-8?B?QmcvYkx6RFNqc2pJdk1GZzdtTnFmc29saWhJaTFBVEJ1Vm8rbHdwanROUjB6?=
 =?utf-8?B?c1haMUM5aTBtSFJabGRjMDVjM1BRU1VtNWxVMHFrOGRtUVlib1BleXlYUlNi?=
 =?utf-8?B?TS9KL3dwWnd4WW1PRXVMNFg3S2ZWeVIxdGpIc3M4ZDRMMFhOTXRvVDNoVTkz?=
 =?utf-8?B?VDRnWjdkK2RZYnM4amxJUTVjcWY0NXpwcmdkYTE0T29KVkdrNm9yQU9BUjF2?=
 =?utf-8?B?bDA3ZTRld0JWMEhzcjVyM1M5QWZPY0xoWjJYdzY3MGtTNisrOW05TVNYczRN?=
 =?utf-8?B?TTZpZUFoTHlVVlFoZmJ1YmU1dzk1Q242ZDBEbUk4T1BKM2tldEg2WEwzRUR2?=
 =?utf-8?B?QXdPa0xkdmF2NFY0SlZCWklDVHFicDlIZFFnQ1I5SEN6a1hLblpmSVdmMTVL?=
 =?utf-8?Q?vZq0MjH7Nk00kO0Xld5PT0ZoW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E90377C2CCAC349B8B6BDC6A0138C0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c5cc56-ebda-4f2f-c8cc-08dad398682a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 12:34:36.1845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/YKaY77e9GQwxsndzg9g5f6Q8QgmtirCgBVUwosf8Tc0+JrNvy+829rvjIzLXTZPb4Msys3c+p/GDJTbQ5O2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9879
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174054

SeKAmW0gYSBiaWcgR05PTUUgZmFuWzFdIGJ1dCBJIHdvbmRlciBpZiBtb3ZpbmcgcGllY2VzIG9m
IHRoZSBHVEs0L0dOT01FNCBzdGFjayBpbnRvIG9lLWNvcmUgYmVjYXVzZSB3ZSB3YW50IHRvIHVw
Z3JhZGUgZXBpcGhhbnkgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLg0KDQpJdOKAmXMgbm90IHRo
ZSBmdWxsIEdOT01FIHN0YWNrIGFzIHdl4oCZcmUganVzdCBwaWNraW5nIHRoZSBidWlsZCBkZXBl
bmRlbmNpZXMgZm9yIEVwaXBoYW55LCBzbyBhbnlvbmUgd2hvIHdhbnRzIHRvIHVzZSB0aGUgR05P
TUUgc3RhY2sgd2lsbCBuZWVkIG1ldGEtZ25vbWUuIEl04oCZcyBub3QgcmVhbGx5IGEgcHJvcGVy
IHRlc3Qgb2YgR1RLNCBiZWNhdXNlIGVwaXBoYW55IGlzbuKAmXQgaW4gYW55IGltYWdlcywgc28g
d2lsbCBvbmx5IGdldCBidWlsdCBpbiB0aGUgZmV3IHdvcmxkIGJ1aWxkcyBvbiB0aGUgYXV0b2J1
aWxkZXIuICBCZWNhdXNlIGl0IGlzIGluIG5vIGltYWdlcyB0aGVyZSBpcyBubyBydW50aW1lIFFB
IGZvciBpdCwgd2UgY291bGQgY2FycnkgYSBHVEs0IGluIG9lLWNvcmUgdGhhdCBjcmFzaGVzIG9u
IHN0YXJ0dXAgZm9yIGEgbG9uZyB0aW1lIGJlZm9yZSBhbnlvbmUgbm90aWNlZC4NCg0KV2ViS2l0
IHN1cHBvcnRzIGJvdGggR1RLMyBhbmQgR1RLNFsyXSwgc28gaXTigJlzIGVhc3kgZW5vdWdoIGZv
ciBvZS1jb3JlIHRvIGVpdGhlciBoYXZlIG9uZSByZWNpcGUgd2l0aCAgUEFDS0FHRUNPTkZJR3Ms
IG9yIGEgd2VsbCB3cml0dGVuIGZsZXhpYmxlIHJlY2lwZSB0aGF0IGhhcyBhIEdUSzMgdmFyaWF0
aW9uIGluIGNvcmUgYW5kIGEgR1RLNCB2YXJpYXRpb24gaW4gbWV0YS1nbm9tZS4gIEkgYmVsaWV2
ZSB3ZWJraXRndGsgYWxzbyBzaGlwcyBhIGR1bWItYnJvd3NlciBhcHBsaWNhdGlvbiB0aGF0IHdv
dWxkIGJlIGVub3VnaCB0byB2ZXJpZnkgdGhhdCB3ZWJraXRndGsgYWN0dWFsbHkgd29ya3MsIGJl
Y2F1c2UgaW4gcHJvZHVjdGlvbiB1c2UgdGhlIGNob2ljZSBvZiBicm93c2VyIHdpbGwgYmUgYmFz
ZWQgb24gbW9yZSB0aGFuIGp1c3Qgd2hhdCBpcyBpbiBjb3JlOiBtYXliZSBhIGN1c3RvbSBzaGVs
bCB1c2luZyB3ZWJraXQsIG1heWJlIGNocm9taXVtLCBtYXliZSBzb21ldGhpbmcgZWxzZSBlbnRp
cmVseS4NCg0KSeKAmWQgZXZlbiBnbyBhcyBmYXIgYXMgc2F5aW5nIHRoYXQgbWF5YmUgdGhlIG1l
dGEtZ25vbWUgbWFpbnRhaW5lcnMgc2hvdWxkIHRhbGsgdG8gdGhlIGF1dG9idWlsZGVyIG1haW50
YWluZXJzIGFuZCBnZXQgbWV0YS1nbm9tZSBhZGRlZCB0byB0aGUgYXV0b2J1aWxkZXIgdGVzdCBt
YXRyaXguICBHTk9NRSBoYXMgc3Ryb25nIHN1cHBvcnQgZm9yIGluc3RhbGxlZCB0ZXN0cyBzbyB3
ZSBjYW4gZXhlY3V0ZSB0aGUgcHRlc3RzIG9uIHRoZSBhdXRvYnVpbGRlciwgYW5kIGhhdmUgc29t
ZSBiYXNpYyBydW50aW1lIHRlc3RzIHRvIHZlcmlmeSB0aGF0IEdOT01FIHN0YXJ0cy4NCg0KUm9z
cw0KDQpbMV0gZXgtZ25vbWUtZ2FtZXMgbWFpbnRhaW5lciwgd3JvdGUgYW5kIG1haW50YWluZWQg
c291bmQtanVpY2VyLCBhdHRlbmRlZCBzZXZlcmFsIEdVQURFQ3MsIHdhcyBhY3RpdmUgaW4gdGhl
IEdOT01FIE1vYmlsZSB3b3JraW5nIGdyb3VwLiBZZXMsIHRoaXMgaXMgaGlzdG9yaWMsIGJ1dCB3
b3JraW5nIG9uIEdOT01FIDMgaXMgd2hhdCB0b29rIG1lIGZyb20gcHJvcHJpZXRhcnkgc29mdHdh
cmUgdG8gd29ya2luZyBvbiBvcGVuIHNvdXJjZSBmdWxsLXRpbWUuDQoNClsyXSBodHRwczovL2dp
dGh1Yi5jb20vV2ViS2l0L1dlYktpdC9ibG9iL2FiNDZjM2ViYjkyZDExMzQ2MTRmNGY5ODkxODky
N2QzMzgwNjJkNzQvU291cmNlL2NtYWtlL09wdGlvbnNHVEsuY21ha2UjTDE4NA==

