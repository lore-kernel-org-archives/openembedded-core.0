Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE11C47071
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 14:15:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.12425.1700230544765033744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 06:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=dsiz3xqu;
 spf=pass (domain: welotec.com, ip: 40.107.22.62, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASrHIyd9fEkeE3bZNcQNibCo73AY28qEAKz6nhvACtUuwZAI3OpYpX05ujmdouPCu9BWb4wI4OuxbdT7cWtLfHKit5vcFwuRsclh0g3dEYk/LaDbwf73Rsv6hYlEGeDdAUu50uCY8eetopiIO3L8fJQXBnPSqlCo9GggpnXU1J3hqxA/VcM5E6Avs1k1jSNditUQTq2WPd2Dwe/GW8ViTejjLKRiSRqqvqJhivn0wYy43Z1LXcAlvBqNddyE6YztQUGCn6jq8eExcKcXp/r3Hudxij5B2oiKNDhRuh0EdwuUILIQwyvzhPHpK7x4oZtQcM1+ZAcJiOzDMkMblP14tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68sQhbDtzmsj56p5nfIetT84RIDd/miwfwtYlLq65mQ=;
 b=oRojPKDpf7zAsEvfZakEfMBujPTQ38KqqaXkIlpX3wXb50Aurv/wYi7orVXsiX7Na8+UCzkpG1QKnKvVz2Cf9NvG/Wc7xr7OVafEomBMFIUi0CEeDrXE9pMfFneiuD3qmgMraDKmffSQ5PEv+McPtcOAZkZMMd0VuJEAldPuFEQHY9+TQX4WyWbzOWK84gmtYZ19Ggaht8ZzEB2CXK6Vljz3en3fxCLgjIfLnBnDvKBB5SUT5AABwZeKGYS37SVEwJggyJjTIXN+QjxFfXA065tuXRcF1BmqrXazw9Y/+GQVeEP6MgRHdWSs3k+xm54METZVvg1XyBZkS3aAYEsXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68sQhbDtzmsj56p5nfIetT84RIDd/miwfwtYlLq65mQ=;
 b=dsiz3xqu1rIof+jWPIM8fO2+DkYMcHc6tLqFYKOZhbAeyvHdnlgaq1qR0cixP1sbEewjHJS+8dtPYC1ZtbwD7z8mtZV+w/Q6GYR6xsy6XwShJkd53huheWfVgkqOwPKmd5t5rbF4S+bpe/ZJ6pAIpkv8rH3fOqC+T6vv3n98EQMmEXGobLo4kBw/ejY5Gb6N2UksRgfD/20IaMU4qp2a6FcOJrs1WYO9cg3KEQPsxna1xfCZGWaiXoCr7xQfZ7tk8a2ZNAeAUlwTgWwzgTDIxOah3h+skx9LL4D7eDBgrhVxJOcRGTpfEdIS6tlxSZP2Ow9ZxtmAM1R/1ekS2DLK0g==
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16)
 by AM8PR04MB7907.eurprd04.prod.outlook.com (2603:10a6:20b:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.11; Fri, 17 Nov
 2023 14:15:40 +0000
Received: from DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906]) by DB8PR04MB6475.eurprd04.prod.outlook.com
 ([fe80::c1fa:48a1:bd41:c906%7]) with mapi id 15.20.7025.009; Fri, 17 Nov 2023
 14:15:39 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
Subject: Re: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
Thread-Topic: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
Thread-Index: AQHaGA4iCSDTrCfxLkGGqPf6+/ZcorB78vsAgAAHGoCAApbjgA==
Date: Fri, 17 Nov 2023 14:15:39 +0000
Message-ID: <3772886.kQq0lBPeGt@latitude>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
 <9a6435e91f517739cd565d0f597cf07521b16075.camel@linuxfoundation.org>
 <1797ED345C35561D.20281@lists.openembedded.org>
In-Reply-To: <1797ED345C35561D.20281@lists.openembedded.org>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6475:EE_|AM8PR04MB7907:EE_
x-ms-office365-filtering-correlation-id: 40aa471b-1ff9-47d3-fc91-08dbe777ad54
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +abrMp4JUp//BeLMcYBNTzkiYDr/AQxnflgDTAiZbIVq7DcEThUU07Qj/fufioxqHXRrz/P6WpRIPPPviSOmGUWLwEVul0JVSMhUR2HjHhgBi9oRgxkYWZXosBQfdAyVVWE+G4RUbkCiGLj+kbqonE9pgNXyNlQvjLiCCQH0n06HKpDEhusrvDjvnnjCttrXQEafEA0LzxIYRMTZSqbiPn0B8KSa6wWiUd8QcwATX/6mupXfOkQ1d/OenL41bytinHJYYAzbjotgjpg7Qg5mBLgMz9/PAx2M/385r+69jyHY2ser9a4RsCwz1BY65D/KutvpxehvRwTbGVlIhLd3BdiX+Nrd1C+exjb3MA88SBjXGTrA+GsBWRjW3UPsWMmsEwGw7h/jJKlRCIl1CBbCKTY+dF8BiCf5yl16r9lVJOXLiV2cUmCrPiCrjJ9g0P6Ybv5LyD3AhkpqVWGYiJAIWWz6gGgbeKdW8gKYnbC81p9pk2mXVdrbaciOEU4Im+BuHGB68oAWZx6MkH1gPBzZJTUQXD+nhD+2VME7+A1AicHIO1fMgbLPEJ93lBZVva6+iUjyzOgc4AMBc63sJ3WxOGEhJmb/QzGlAIQD6OucbWdKMEPUKkyVvQh1x4NOX1oOkZ5ey4IvrJlBHQhy1+wt+Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6475.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(346002)(376002)(366004)(39840400004)(1800799009)(186009)(451199024)(64100799003)(41300700001)(4001150100001)(8676002)(122000001)(8936002)(4326008)(83380400001)(26005)(107886003)(86362001)(5660300002)(91956017)(110136005)(9686003)(6512007)(38070700009)(66556008)(66446008)(64756008)(85182001)(76116006)(66476007)(316002)(38100700002)(85202003)(66946007)(33716001)(2906002)(6506007)(71200400001)(6486002)(478600001)(39026012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TW4rTWlOQTJiem53SGhXYTNzWjBoVUxXTTJFTkJ5WEc0Lzl4eTUyNUQ5cnZ5?=
 =?utf-8?B?eXMxYkVIRlZWdktPcnBpZ3cyQnF2ZFg5amdranVtRnBNbDdFS3ozWkl5QjVF?=
 =?utf-8?B?SC90QTdkMkwzR1FRZWErUXNYbEtKV2crZkljbHhtaGMrbmw5VUNCRVZqY2Rp?=
 =?utf-8?B?ekdGQjFramZNZXRuMmN5Wmg2MkZiZWdiSDQ2elRkbDFhbG95cmdDZ08vSmVN?=
 =?utf-8?B?WWlVcnZqekt3aGpMWTBNZ0pGOTEwR3pSYk1uLzd6K0ZOVG9iaWpjN2Z6V0Zt?=
 =?utf-8?B?bnBOWm1SU2FDSW1qM28zTVJmSkFDMDI2b0tmaGhITEdjU0Q2R0JuWTBkRTZR?=
 =?utf-8?B?NGJkQTY2TmZjSTdUUW5OY1U4YkkyNTFIYW5UTm1ZdkZxV3RLVkdRcjZDY1dv?=
 =?utf-8?B?TzVMY1l3ejFlQ0JqNzkydzVoYUs0bGR2TDllVnp3TDYxVlFKbXRYcVRISEVy?=
 =?utf-8?B?TGp0UTlmRTFaUHRxUlh4Z25naGw0ZUc4UWZxZkU4c2NWTlBaNmxJMnJoMVBF?=
 =?utf-8?B?RHdHVVFXSklvYytDczBDVmhCV2ZaWXBoWUVZSVA2UmRvMEZlWFBMNTY3YkFV?=
 =?utf-8?B?Z2FhUWxkVERxVDVTN2hxQWdWR1pKV2l6MG1LMDQzejBJcHpmRWJqKy9hbVlQ?=
 =?utf-8?B?REd0dys5L3RqdHFsV1pVR21CeFR3VkVOL3hNZUJnY0ZQTFM5Y0txUWtvamtk?=
 =?utf-8?B?Q1JxRlJHNjJQQnZKazBMNkZWbUk0WEhiZyt4RHZwbXhjeVM5eGtEMHg5N0Rs?=
 =?utf-8?B?d2I2bUYyVkxLSHhMK1U2eVRlRlY3MW9YcVRXTmxiNFZybUdKL25uM2hLelho?=
 =?utf-8?B?SGlPb3VtUGZ5MTZ6S1hOVE9URm9zWGxoc1pQUk4xM0FKeE5JdFpidlVYRmNj?=
 =?utf-8?B?ak9YNWR5WDhvcXJpSjhlOVRPczVnOFpKaWpTQTEyaysyQjlQbGJDankyNnVK?=
 =?utf-8?B?eFo4WmIzZ0orcllON0ZpUE1uRlNKMXcrSnRSSzN0ZGpEVnNwcFZWelI4eGRa?=
 =?utf-8?B?MTFIM3BRUTM3T2pPWFNBK1lqNHhHcDJLV3o0NTRMMjBoYU1mUzNoYTIya0ZN?=
 =?utf-8?B?aTJPcm9RVGdXTlk5Nm5uNWFlbUJ0Q3J0cGNiM05TTkZmNXhyUW1iRmE1cFls?=
 =?utf-8?B?QjkxUjg4MzJHZS92Z2NjVzFmMjIyb3hmWWpDVTcvVWdudUQxYXdDK2VkVTk4?=
 =?utf-8?B?NHk1TlNybStNZi9hcFBSVUlDNW9GaGI3bEptem9CMnhlUm1ZaG9MMVRvR0VJ?=
 =?utf-8?B?bFIxUlVodm5IY0pGS1Ezc3JpS0lwcFJWQU5BSFd5Q2JZdytzbC9IUUU0TVZy?=
 =?utf-8?B?ZmZDRUt3alUvRTNTdStHdjk5bmlPbllETk1rdDRPM2ljZG01L1I5MUVmdnl3?=
 =?utf-8?B?eW1wSGJCUkR6UEhuU1JiMFc4Y3Z0Q0hyTk9XcTNENmZMbVhQbnpSend1YVRm?=
 =?utf-8?B?Wit2VjkySmo1M2hYd2JiTDhuWFhLcXNvV0ZPSUszcEhhdmpZRkN3cHFrbVNJ?=
 =?utf-8?B?elFkT1lTeWY5QTNPbDMwVmVwYks4YXppSFVWMUJ3N1ptakNzSTNXUjZSNnBP?=
 =?utf-8?B?WG1ZZzlxaVZDZzFkMUpYbWFBRmxzeVF5RTg0c1k1c1VyU1E1MjdzeThzMSsv?=
 =?utf-8?B?bkpJd2lkRmpnWTV3ZUpIQjBPalYrd0g3RzQ0YlFIekFjR0M3MU5sUDdjTmZ1?=
 =?utf-8?B?L1JVcmV6V2ppV2NvZDMwOE1TUlpOekkra0grdCtNcHhvU3duY3grNmYwZmly?=
 =?utf-8?B?YWRpSlRVWHc1Z20rOWlJMnBsTnhUbHRyZDRxK1krRHM0TDF5YnVjSWQwL3NX?=
 =?utf-8?B?Q2xZekFjZFBqTVFKa3J2Y0ZWK1NrOTcrc1JabkJrK29SV3lQS0RWTmQxWkxh?=
 =?utf-8?B?SmpYejZ5MlpWVkdOOTNGZzU2a0c5VWZFTDVCRFhkSFJvQnVla0YwL3owclAr?=
 =?utf-8?B?U3M4eFV2eXh3MFYwTUNYOFRwc3VkK1JwZHROREtUYVkyQ3FVQkliaE5Pa011?=
 =?utf-8?B?RVpOUnJuK1pLdzJVWGhGc0kzRDNaUDFhNTQ2dWxmeklwN09sRW04Z0VhUnJm?=
 =?utf-8?B?dS83VmdUdGxCSlhqdno0Qm5ucU5VazJ5dUNUcG9WS1YyYUZlNmRKaUs5ZnRv?=
 =?utf-8?Q?itMNe6lKWUwuzR9fJYGZ69qk7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A50C50F47B6364D8ECA95374FF277FB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6475.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40aa471b-1ff9-47d3-fc91-08dbe777ad54
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 14:15:39.8071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA5jcERRzOAtBzDqyOyEPawQO3OjIdb0nQtYqzxynkFTiovzLvQQMeWZpjtfK1X5NqAL6XGJeG7D75KnUGHLfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 14:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190852

RG5pYSDFm3JvZGEsIDE1IGxpc3RvcGFkYSAyMDIzIDIzOjQzOjA2IENFVCBQaW90ciDFgW9iYWN6
IHZpYSAKbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBwaXN6ZToKPiBEbmlhIMWbcm9kYSwgMTUgbGlz
dG9wYWRhIDIwMjMgMjM6MTc6NDAgQ0VUIFJpY2hhcmQgUHVyZGllIHBpc3plOgo+ID4gT24gV2Vk
LCAyMDIzLTExLTE1IGF0IDIyOjUyICswMTAwLCBQaW90ciDFgW9iYWN6IHdyb3RlOgo+ID4gPiBC
eSBkZWZhdWx0IGN1cmwgaXMgYmVpbmcgY29uZmlndXJlZCB3aXRoOgo+ID4gPiAKPiA+ID4gLS13
aXRoLWNhLWJ1bmRsZT0ke3N5c2NvbmZkaXJ9L3NzbC9jZXJ0cy9jYS1jZXJ0aWZpY2F0ZXMuY3J0
Cj4gPiA+IAo+ID4gPiB3aGljaCBjYXVzZXMgYW4gaXNzdWUgZm9yIG5hdGl2ZSBidWlsZCwgd2hl
biBjYWxsaW5nCj4gPiA+IGN1cmwtbmF0aXZlIGNvbW1hbmQsIGFzIGNlcnRpZmljYXRlcyBmaWxl
IGlzIG1pc3NpbmcuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQaW90ciDFgW9iYWN6IDxw
LmxvYmFjekB3ZWxvdGVjLmNvbT4KPiA+ID4gLS0tCj4gPiA+IAo+ID4gPiAgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvY3VybC9jdXJsXzguNC4wLmJiIHwgMSArCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9jdXJsL2N1cmxfOC40LjAuYmIKPiA+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJs
L2N1cmxfOC40LjAuYmIgaW5kZXggNWY5NzczMGJmNC4uZjBlMDk4NjhmNgo+ID4gPiAxMDA2NDQK
PiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguNC4wLmJiCj4gPiA+
ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF84LjQuMC5iYgo+ID4gPiBAQCAt
MTMwLDYgKzEzMCw3IEBAIFBBQ0tBR0VTID0rICJsaWIke0JQTn0iCj4gPiA+IAo+ID4gPiAgRklM
RVM6bGliJHtCUE59ID0gIiR7bGliZGlyfS9saWIqLnNvLioiCj4gPiA+ICBSUkVDT01NRU5EUzps
aWIke0JQTn0gKz0gImNhLWNlcnRpZmljYXRlcyIKPiA+ID4gCj4gPiA+ICtERVBFTkRTOmFwcGVu
ZDpjbGFzcy1uYXRpdmUgPSAiIGNhLWNlcnRpZmljYXRlcy1uYXRpdmUiCj4gPiA+IAo+ID4gPiAg
RklMRVM6JHtQTn0gKz0gIiR7ZGF0YWRpcn0venNoIgo+ID4gCj4gPiBJIHRoaW5rIHRoaXMgY2Fu
IGJlIGFuIFJERVBFTkRTOiR7UE59OmFwcGVuZDpjbGFzcy1uYXRpdmUgd2hpY2ggd291bGQKPiA+
IGhhdmUgdGhlIGFkdmFudGFnZSBvZiBub3QgYmxvY2tpbmcgdGhlIGJ1aWxkIG9mIGN1cmwtbmF0
aXZlIG9uIGNhLWNlcnRzCj4gPiBhbmQgb25seSByZXF1aXJlIGl0IGF0IHJ1bnRpbWUgZm9yIHJ1
bm5pbmcgaXQ/Cj4gCj4gSSBjYW4gdGVzdCBpdCBhbmQgZ2V0IGJhY2sgdG8geW91IHdpdGggYW5z
d2VyIGlmIGl0IGlzIHdvcmtpbmcgZm9yIG1lCgpPSyB0aGlzIHdpbGwgbm90IHdvcmsgYXMgSSBl
eHBlY3RlZCwgYmVjYXVzZSBhcyB3cml0dGVuIGluIHBhdGNoJ3MgY29tbWVudCwgCnRoZSAtLXdp
dGgtY2EtYnVuZGxlIGlzIGJlaW5nIHNldCB0bzoKCiR7c3lzY29uZmRpcn0vc3NsL2NlcnRzL2Nh
LWNlcnRpZmljYXRlcy5jcnQKCmFuZCB0aGlzIGV4cGFuZHMgb24gbmF0aXZlIHRvOgoKYnVpbGQv
dG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2N1cmwtbmF0aXZlLzcuODIuMC1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvCmV0Yy9zc2wvY2VydHMvY2EtY2VydGlmaWNhdGVzLmNydAoKU28gaW4g
Z2VuZXJhbCBJIG5lZWQgdG8gdXNlIERFUEVORFMgaW5zdGVhZCBvZiBSREVQRU5EUyBvciBqdXN0
IHNldCAtLXdpdGgtY2EtCmJ1bmRsZSB3aXRoIGRpZmZlcmVudCBwYXRoIGluIGNhc2Ugb2YgRVhU
UkFfT0VDT05GOjpjbGFzcy1uYXRpdmUuCgpVbmZvcnR1bmF0ZWx5IGFzIEkgYWxyZWFkeSBjaGVj
a2VkIHRoZSAke3N5c2NvbmZkaXJ9IGluIC0td2l0aC1jYS1idW5kbGUgaXMgCmJlaW5nIGNvbnZl
cnRlZCB0byB2YWx1ZSBiZWZvcmUgcGFzc2luZyB0byAtLXdpdGgtY2EtYnVuZGxlIGFuZCB0aHVz
IGl0IGFsd2F5cyAKZXF1YWxzOgoKYnVpbGQvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2N1
cmwtbmF0aXZlLzcuODIuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvCmV0YwoKbWVhbmluZyB0
aGF0IGV2ZW4gaWYgSSBydW4gY3VybC1uYXRpdmUgZnJvbSBkaWZmZXJlbnQgcmVjaXBlIHN5c3Jv
b3QgbmF0aXZlIGl0IAppcyBhbHJlYWR5IHNldCB3aXRoIGl0IGFuZCBzZWFyY2hlcyBmb3IgaXQg
aW4gdGhhdCBwYXRoLgoKVGhlIG90aGVyIG9wdGlvbiBpcyB0byB1bnNldCAtLXdpdGgtY2EtYnVu
ZGxlIGZvciBuYXRpdmUgYW5kIHRoYW4gaXQgd2lsbCAKc2VhcmNoIGZvciBpdCBpbiBjb21tb24g
cGxhY2VzIHNldCBpbiB0aGUgc291cmNlIGNvZGUsIHdoaWNoIHdvcmtzIGJ1dCBzdGlsbCAKaXQg
bWF5L3dpbGwgdXNlIGNhLWNlcnRpZmljYXRlLmNydCBzdG9yZWQgbm90IGluIHJlY2lwZSBzeXNy
b290IG5hdGl2ZSBidXQgZnJvbSAKdGhlIGhvc3Qgc3lzdGVtIHdoaWNoIGlzIG9idmlvdXNseSBu
b3QgdGhlIHdheSB3ZSB3YW50IGl0IHRvLgoKTXkgcHJvcG91c2FsIHdvdWxkIGJlIHRvIHNvbWVo
b3cgcGFzcyBhIGRpZmZlcmVudCB2YXJpYWJsZSB0aGFuICR7c3lzY29uZmRpcn0gCmludG8gLS13
aXRoLWNhLWJ1bmRsZSB3aGljaCB3aWxsIGJlIHNldCBpbiBzeXNyb290IG5hdGl2ZSBpbnN0ZWFk
IG9mIGJpdGJha2UgCmFuZCB3aGVuIGN1cmwtbmF0aXZlIGlzIGJlaW5nIHJ1biBleHBhbmRlZCB0
byBwcm9wZXIgcGF0aCwgYnV0IEkgZHVubm8gaWYgCnRoZXJlIGlzIHN1Y2g/CgpCUgpQaW90cgo+
IAo+ID4gSSBzdXNwZWN0IGJpdGJha2UgaXMgc3RydWdnbGluZyB0byAic2VlIiB0aGUgUlJFQ09N
RU5EUyBvbiBhIG5vbi1QTgo+ID4gcGFja2FnZSBmb3IgdGhlIG5hdGl2ZSByZWNpcGUgZXh0ZW5z
aW9uLgo+IAo+IGN1cmwtbmF0aXZlIGhhcyBhbHJlYWR5IFJSRUNPTU1FTkRTOmxpYiR7QlBOfSAr
PSAiY2EtY2VydGlmaWNhdGVzIiBidXQgaXQKPiB3YXMgbm90IHdvcmtpbmcgZm9yIG1lIHdpdGhv
dXQgREVQRU5EUzphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIgo+IGNhLWNlcnRpZmljYXRlcy0gbmF0
aXZlIgo+IAo+ID4gQ2hlZXJzLAo+ID4gCj4gPiBSaWNoYXJkCj4gCj4gQlIKPiBQaW90cgo=

