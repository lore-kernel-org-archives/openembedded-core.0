Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF88C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 07:55:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web10.52663.1656402904910668048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 00:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GT/us4ax;
 spf=pass (domain: siemens.com, ip: 40.107.8.71,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz6EzPXu+Dh4B6rwz7+cpNSQhDPCYgEkWk6sVlBR6GzjjETbNdBvNJ/iIBSfqfllXJeKhu4xyha5uymcTN4DClhX1nEpKteyv7Ijbuj+dLxifz9qK1DU4woxiGJyV8OrOZbPIDfZA8D27sC/QnwKZXHnKKzKvwMn1usXaVS/V9vtpR6B6DWBJAzynQYCgQS8bKkNBWazBwdSBwF7EPqf6H0wtsQgYSqOzPfdhHMO/YyuMDKYHEu4gYg1kigRg8AUPVkCIKsPr+Uq5vZuWi1koQaxNNU/W5U9kkmZY1aKiUDgHrzq1MFepJmCwGGvjpBGsmwBKAVHGP2atXVihaD3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8S32XErkNE1nCfiCFHM31Wmj+zsOg4cRgOG3D0XG1Y=;
 b=IlZj4JJ9MuwN9O9DEtyGWu92TaE7VGXnxIXerPmJeAd8z8HWAKEc3St4vcIhri6xCVNmSBMwzb5ZXX5r7FtL0fnW97RymaPQ8osPaeoGwAQfjHqb04Jar5MmYEv2R2scAnz3UauqNRCCYLerMmC99jKC166FaZ0Gn5VumbLDwIYkUkbqYxxks+iNwXZcIoVVfdP4GBnqK5lXF1VwLgISs1N37svLEc4igHbIWsbO6wHdN3TPv8e1wDtuIwCjW5bgT1SrHc9PVY4XA12f212qcGVkB5GZ1gQzqQohwfLhVAVrVfTSOGewHgTIHyHdLTKoP/g9z8OufGjkkvl4QLWodQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8S32XErkNE1nCfiCFHM31Wmj+zsOg4cRgOG3D0XG1Y=;
 b=GT/us4axoQUrUjaUsB2REJ7gletansV8RCoqr0L4l5pfsXvfm0mQWi++yXfpUp3Eyrrsc4SYWHXUIKT19aV7TWQV/+sHrxriO+Q/K23pz5MHDf7iKGk9IyDIOh9xBl0hARklqm6y93Bopd8JEXicCuavcvjZxx9bWwjMFjFPxPLlPQiAQgIRH98+5VJWbOT/YXRhz/dV9Fzzg4ck9gxLW9fK+XfKeBv7l02xABxzsKLM+ykr5iFcPlkNCX08349aM3LUVqEILxpIe4k0i3a1xsxS5fLdPVPKv5W65Wa5y36nBQ8+Q1vXwD9c+Le+67Qe26dAogJMOwyUg/ywFN5GXw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB6PR1001MB1030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 07:55:01 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e5c4:b2fc:cecd:ee75]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e5c4:b2fc:cecd:ee75%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:55:01 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>, "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: Re: eSDK dependencies
Thread-Topic: eSDK dependencies
Thread-Index: AQHYiiIHc1CLXz+3xkuTnJctNcNK1q1jQWYAgAEzEQA=
Date: Tue, 28 Jun 2022 07:55:01 +0000
Message-ID: <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
	 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
In-Reply-To: 
 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 318057df-0862-42f6-837b-08da58db811a
x-ms-traffictypediagnostic: DB6PR1001MB1030:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 E445Oe9DP8UaUhHL5wfUZzVYiB+QH5C+8cI+TaXu2zRZkpe5fFToo2hzwbB4iUeH9GcZJ/ycC9lK+t21O5FN+aCYUY9Yp+g8DE+yL4JHGJhPD/O8SCamBMJJrHn1oDQluIMZKWhgSRjOBo8emtzPmtq932nLTUSMe57O4TdMmRqhIjlvsRLc7t715NC1LADIg/bC8YswDC4wS6+xRz6MmntN+7oHh4ikEoxRyVzZDh72qNEHx0UXqqeUvoliwjeuVPqG8TAo8vrvQnnhb20MRPcTmMdiNhI0iALqEkVatc8oe8lBk/v2iho/FUU+TXbKiYlE66u6dmyOCRreZf1hdR7RVJV989tjY9cD4oc4SU0op/hbQYI0SApI4wDq6359Ix5JMjdkMrjbt0sqwZCxd1faXn0PW00DoxMoMaYdcqnwqdOQjiAbRVyLfFH4jePJNqgN03oOxzqQ+lkbbzWDX70yzoSItTPpbjuBnRXSC8NIgtclAgN9uGkjaSA6HrtwC4nGTiUmCqcPlWIxCK+/dszyh0rba9187ofqniS9FGYyfY25CJmfGdjfOWUh6k8hlfx4KdvwEryiLceOML6ZeyGhd9Yzd/9u3PFoYHPv9+2VO9V5SrPk74W/n+vhZ6SCSF0jtIISuFgOEf9CIM0Et/wqX8Tij8rhjGBOxSf4DrdPpGQ10SSHBVxRPfNFjuyIlskaB8/J1k0u1v5w1x8gqhXJtjvGib6JZrKkh2/Qtw9CnzBQNcuhz3Ex1v3F1rYSFLISU0ZIBN9Aj1QNe1SQqrG3nefQWKbo5J3DC/DCbiuI36c2nFcJr++bEcw0af/f8H57FU4knHjaOAYg8oDmlze5pla5ICsDBo9Uqy9bupcP1wnPCrrAE7SPpmBq8vTo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(36756003)(7116003)(316002)(5660300002)(38100700002)(4326008)(8936002)(66476007)(66556008)(6486002)(122000001)(71200400001)(110136005)(66446008)(64756008)(2906002)(478600001)(76116006)(86362001)(66946007)(6506007)(54906003)(2616005)(83380400001)(91956017)(107886003)(41300700001)(26005)(186003)(6512007)(8676002)(82960400001)(966005)(38070700005)(3480700007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NFNmaGQvN3UzUFAvOVd0Y2t5WXFMTHlXdHNlbm52SFJ1NkNhV2FnRnpFakhw?=
 =?utf-8?B?ZWlwdUFvT2VBbDhIbXQ3VzF3YytHVkY2Q0pWbkU5SEU1ekFCYUNtRitaRG1z?=
 =?utf-8?B?b1l0aUNGcy9NWnhhNW1JMys1YTRKNVJGN1hqeVp5akYzeDFqZ2MrRkpRYmdO?=
 =?utf-8?B?T0RMWENrOVJVQVB4TkxlcUx0SDNpbUNyaDRucmJXcjd1akVpeGtBaklNVjY1?=
 =?utf-8?B?QTh3L1lZZVQ1Sk1jeE9YR0FQMzluU0w0RENHaGFtMEtUemdpOUk5amsxMXpv?=
 =?utf-8?B?a0xlU3o1QU1NV0JJRFg0ZUphNHlkcVFBWDhQd3gyOGFDWC8xcExwcUY3S1FL?=
 =?utf-8?B?MExxT3lsY2FJK2EvUmhabFRtSFNmRlNPZG5Qa0pnTlZsb3pUNlR1MURyU1Ft?=
 =?utf-8?B?ODJtai94QmI5V0F4RGpscUxWVERHRG1vcURycms3Z0NBNE5MQTFUUjRHU1Vm?=
 =?utf-8?B?bFg3R24yUTQ1aHpQekFlSHd6WUdaMmFVT2FTa2M0TzNlMGxhN3ZvaC9tNjgw?=
 =?utf-8?B?QlR3aHhpeG5hTURDYm9JdS9HUkV5SStmSHRtdldUekRhOC93cysvNmJIY2dP?=
 =?utf-8?B?M0NZUStLNDlJc1hmOHJIbzlQNnIzb3N3c0pJMHF4aWREa0VPNkMyWWlxTHcz?=
 =?utf-8?B?cWN6N0VLTks4VzMxVGFiZzhsV1RsaUxmbW1rSS9QY1RnWUNvYXcvZmJoQ3VS?=
 =?utf-8?B?bnZwa1JpTDY4eWtYa0JjYjFBUmVNTXpweG9jS3pkNDF3MitpK25RL1ovdldr?=
 =?utf-8?B?WnBJZkVjSHNNNnZzazdYOU4vemFpTE9xRGlNOWJjb1hjaHMvNUVjdjVmK1Va?=
 =?utf-8?B?KzQ1RjM3di9UaDVoTll3YnZqbnpuZTBNdGJPcFE1NThoNVIrMitxbWR0dTd5?=
 =?utf-8?B?M0NURVRqWVV5NW5mNmMydXdiRnROTUptcDZmMUpiRFhwR2ZMREhkRGp1aHpL?=
 =?utf-8?B?bkVJaXNZQnJmV0lLcFp0bFZ3amp6NU1FZVhoZnRneHhkMFpzcDJzVVI2S0dS?=
 =?utf-8?B?UGJjbUhrRFRUSlBLU1NubWduUmxjaThuUDl5eDFPWjZEZThyQVJTMStlSkRn?=
 =?utf-8?B?YkhoLzIrN2xWbGwzWmQ4M21VSUZBcktmOW9ybEV6eVZYRHMyVEhZMlUwYUFG?=
 =?utf-8?B?SHByQXI3YnE4RnVEZFZlM0c1djFiR1k3bE9YNHVhbDF1S0VCNnBES1lnU1gz?=
 =?utf-8?B?cS9tZThpKys5N2RsQklERnkzbFpSVisySFNzLzhMVEVDWjgrdTY2cHJhYTJw?=
 =?utf-8?B?R29tblo4RVFBVEc4Ky94L3RwLzhGVTJQYzl5bUk5SllkSmdrRktCL1B3azFV?=
 =?utf-8?B?alphZHAyS2g4Y0NvalY5d3VzTzBJVzVOb1lhV3ZyL3pJUjhYVkhMaTFTWjRU?=
 =?utf-8?B?NHQzMzhTci83NGRPUzJwYWhwc1RuaFFwVm1HVTRCaEJmT3VNRmR2OWZZQUgw?=
 =?utf-8?B?MmdXSS9XU1h0QnAzVDBYVXF2TnBCWndkSDdwMWNzYytud2lmNlVCZDhPa1hv?=
 =?utf-8?B?Z3pnWkt6YXpXZzJmWk1kZ0VSRm1sWTR1RG9oS0RtUW1lbVlyTkxIcnNKdlVD?=
 =?utf-8?B?UHNOMXNHS1k0VUtZK0VMZWh4Z2Z1VTdMMEQwZTJFakYyemdILzd4NHhVckFp?=
 =?utf-8?B?YXJnMWlLMzhoTUFaM0F4VEhrNndqQ1lZczNFd0poRWl5NnRucThXeDMxOWpZ?=
 =?utf-8?B?WHpybldSdmN0bnY2TkVVWWJnTjBoSDQ4dnpmcE16WVM4Rmpsbm1sYWFWL1B3?=
 =?utf-8?B?RUlnQng1WXpBTFppOU5NeDQrOWpuQTFZOGlYNkd1WUp3YVB5MGtHTUhHWjl0?=
 =?utf-8?B?ZldtcEh1M2lvRlVZRzB0ekhkNnRKYUE1UXNNbWdmZDdtOUUxck1SNjdhbXRp?=
 =?utf-8?B?TmhRYWZQY1ZPMEJwbGxycVlEVjE4TEkrd3NZWG84cEFxa2JUU2dPTmloU29t?=
 =?utf-8?B?SUtWN2tPZ2M1MUgzQ1plcmh4V3F2WVQrRCt2VXJjeVU3WC9COCtqbWhNN1BZ?=
 =?utf-8?B?eDZ5Sys5a1FBbWRwcGFKRXZNUVJkV051ZEJ6MEE1cXh5aGFaS1VkblpvaGV0?=
 =?utf-8?B?NDJaOGpOdHh3ejFTcnJpRThGWCswZnhpNThlc3pNWlE1MEg3RllidGpMVGZ5?=
 =?utf-8?B?WHJYTmpqd05weEM3aThWVHUyOWd6Q1l6Wi9vRGYxVlZGZk0vSkxHcW9yM0Z6?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16BE1D1EA7466D4DA5566E770C53B57D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 318057df-0862-42f6-837b-08da58db811a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:55:01.3270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 tkLeiIBGBpV+zO+0xmdEllu1euhs9Oc4V6d1juD7O1Ha+VJExclQKZBe9kavZIUrgMWhKM88OhyIYpsKIxwdGSUmAKQbHFYcE+3OU5eFgJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 07:55:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167333

SGVsbG8gUmljaGFyZCBhbmQgQWxleCwNCg0KUmljaGFyZDoNCldlIHRyaWVkIHRvIHJldmVydCB0
aGUgY29tbWl0cyB3aGljaCB5b3UgbWVudGlvbmVkIGFuZCBpdCBkaWRuJ3Qgd29yay4NCg0KQWxl
eDoNClllcywgaXMgZnVsbHkgcmVwcm9kdWNpYmxlIG9uIGxhdGVzdCBtYXN0ZXIuDQoNCmJpdGJh
a2UgY29yZS1pbWFnZS1taW5pbWFsIC1jIHBvcHVsYXRlX3Nka19leHQNCg0KZVNESyBpbnN0YWxs
ZWQgdmlhOiBwb2t5LWdsaWJjLXg4Nl82NC1jb3JlLWltYWdlLW1pbmltYWwtY29ydGV4YTE1dDJo
Zi0NCm5lb24tcWVtdWFybS10b29sY2hhaW4tZXh0LTQuMStzbmFwc2hvdC5zaA0KDQouIGVudmly
b25tZW50LXNldHVwLWNvcnRleGExNXQyaGYtbmVvbi1wb2t5LWxpbnV4LWdudWVhYmkNCmRldnRv
b2wgbW9kaWZ5IGJ1c3lib3gNCg0KU3N0YXRlIHN1bW1hcnk6IFdhbnRlZCAxNCBMb2NhbCAwIE1p
cnJvcnMgMCBNaXNzZWQgMTQgQ3VycmVudCA2ICgwJQ0KbWF0Y2gsIDMwJSBjb21wbGV0ZSkNCg0K
U28gaXQgc3RhcnRlZCBhIGNvbXBpbGF0aW9uIG9mIG1pc3NpbmcgY29tcG9uZW50cy4gV2UgYXJl
IGFzc3VtaW5nLA0KdGhhdCBlU0RLIHdpbGwgaW5jbHVkZSBhbGwgYnVpbGQgZGVwcyBmb3IgYWxs
IGNvbXBvbmVudHMgaW4gdGhlIGltYWdlDQphbmQgbm90IGp1c3QgYSBkZXBzIGZvciBpbWFnZSBp
dHNlbGYuDQoNCg0KUmVnYXJkcywNCkFuZHJlag0KDQpPbiBNb24sIDIwMjItMDYtMjcgYXQgMTQ6
MzUgKzAxMDAsIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBPbiBNb24sIDIwMjItMDYtMjcgYXQg
MTI6MzIgKzAwMDAsIFZhbGVrLCBBbmRyZWogd3JvdGU6DQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24g
cmVsYXRlZCB0byBlU0RLIGRlcGVuZGVuY2llcy4gV2UncmUgdXNpbmcgdGhlDQo+ID4gZHVuZmVs
bA0KPiA+IGJyYW5jaCB3ZXJlIGV2ZXJ5dGhpbmcgcmVsYXRlZCB0byB0aGlzIGVTREsgdG9waWMg
d29ya3MgZmluZS4gTm93DQo+ID4gd2UncmUNCj4gPiBpbiB0aGUgdHJhbnNpdGlvbiBwaGFzZSB0
byBuZXcgTFRTIGJyYW5jaCwgd2hlcmUgd2VyZSB3ZSBmb3VuZCBvbmUNCj4gPiBiaWcNCj4gPiBk
aWZmZXJlbmNlIGJldHdlZW4gZVNES3MuDQo+ID4gDQo+ID4gVGhlIG9sZCB2YXJpYW50IChkdW5m
ZWxsKSBpbmNsdWRlcyBhbGwgYXBwbGljYXRpb24gYnVpbGQNCj4gPiBkZXBlbmRlbmNpZXMsDQo+
ID4gYnV0IHRoZSBuZXcgdmFyaWFudCAoa2lya3N0b25lL21hc3RlcikgZG9lc24ndC4gTWVhbnMg
aWYgSQ0KPiA+IGluc3RhbGxlZA0KPiA+IHRoZSBlU0RLIGFuZCB1c2VkICJkZXZ0b29sIG1vZGlm
eSBteS1hcHAiIChhcHBsaWNhdGlvbiBpbnN0YWxsZWQgb24NCj4gPiB0aGUNCj4gPiBpbWFnZSkg
aXQgd29ya3Mgd2l0aG91dCBhbnkgYWRkaXRpb25hbCBidWlsZCBkZXBzIHJlY29tcGlsYXRpb24u
DQo+ID4gQnV0IG5vdywgaWYgSSBkbyB0aGUgc2FtZSBvbiB0aGUgbmV3ZXIgdmVyc2lvbiBpdCBh
bHdheXMgcmVjb21waWxlDQo+ID4gYWxsDQo+ID4gYnVpbGQgZGVwcy4NCj4gPiBJIHdhcyBhbHJl
YWR5IGxvb2tlZCwgd2hhdCBjb3VsZCBiZSBjaGFuZ2VkLCBidXQgSSBkaWRuJ3QgZmluZCBzbw0K
PiA+IGZhcg0KPiA+IHNvbWV0aGluZyBzdXNwaWNpb3VzLiBTbyB0aGUgcXVlc3Rpb24gaXMsIHdo
YXQgaGFzIGJlZW4gY2hhbmdlZCwNCj4gPiBhbmQNCj4gPiBob3cgdG8gYnJpbmcgdGhlIG9sZCB2
YXJpYW50IGJhY2s/DQo+IA0KPiBHdWVzc2luZyBpcyBoYXJkLiBTaW5jZSB5b3UncmUgYXNraW5n
IG1lIHRvIGd1ZXNzOg0KPiANCj4gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L2Nv
bW1pdC8/aWQ9NTY4ZjYyMjE0YmNhM2FjNmQzNWVlZjhkOWY0NTYyNTk2ZmI0YzlhYg0KPiANCj4g
d2hpY2ggd2FzIHBhcnRpYWxseSByZXZlcnRlZCBoZXJlOg0KPiANCj4gaHR0cHM6Ly9naXQueW9j
dG9wcm9qZWN0Lm9yZy9wb2t5L2NvbW1pdC8/aWQ9ZjIyZTFmYmRmN2JlZDExMWUwODBkMTc2ZmU1
YTM5YzUxMzkzMDhlZA0KPiANCj4gbWF5YmU/IEl0IGNvdWxkIGJlIHNvbWV0aGluZyBlbHNlLiBJ
dCB3YXNuJ3QgYSBzcGVjaWZpYyBjaGFuZ2UgdG8NCj4gcmVtb3ZlIHN1Y2ggZGVwZW5kZW5jaWVz
IGJ1dCBJIHN1c3BlY3QgaXQgY291bGQgaGF2ZSBoYXBwZW5lZCBhcyBhbg0KPiB1bmZvcmVzZWVu
IHNpZGUgZWZmZWN0IG9mIHNvbWV0aGluZyBlbHNlLg0KPiANCj4gWW91IG1heSBuZWVkIHRvIGNv
bWUgdXAgd2l0aCBhIHNpbXBsZSB0ZXN0IGNhc2UgYW5kIHRoZW4gYmlzZWN0DQo+IGJldHdlZW4N
Cj4gdGhlIHR3byByZWxlYXNlcyB0byBzZWUgd2hpY2ggY2hhbmdlIGl0IHdhcy4gT25jZSB3ZSB1
bmRlcnN0YW5kIHdoYXQNCj4gY2hhbmdlIGNhdXNlZCBpdCwgd29ya2luZyBvdXQgYSBzb2x1dGlv
biB3b3VsZCBiZSBlYXNpZXIsIGl0IGlzDQo+IHByZW1hdHVyZSB0byBldmVuIHRyeSB3aXRob3V0
IGtub3dpbmcgdGhlIGNhdXNlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4g
DQo+IA0KPiANCg0K

