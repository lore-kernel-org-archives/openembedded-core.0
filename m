Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B40CC4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 17:35:40 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.117])
 by mx.groups.io with SMTP id smtpd.web11.12745.1707759332263993625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 09:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=ZS6m09R9;
 spf=pass (domain: infinera.com, ip: 40.107.220.117, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMFr5WVDwVMEvxhaHVlirteaWWS0bYyib8JmG3CXHVVL0mUlwAp+PpR4nOg/ly5tizAePlVVDWv9QUGb8npQdjJ46fagdLP5fzKjoJ72loj0HyCII0cXSdQIltuBt88jYyLsPalrEMW6G1VZ3ANntm033GuY4btf1xrdFlAPgbFCxjXd3cpH2tyjme1uQe9k4EsWYG5yR1Sc/4AAU83K5E185FIN8QC5/Wy1RM8nfWBgTvHeKMOj+Qpr4zbjPAf9rmWxi9XHN3j3KvOZLVDxROSp1dmaO1qiZHBXkBAgWy0D1DbokPjeujcqWRaZNAGhfAnuKkhANGsBYNCEQos4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSuQ9r4v7WEEidkC78EbyrXIlGiMwve8i86NJVy/FwM=;
 b=cf7uGKkcLoGuKRdVOAAY7vQlefBsjiRx01jHbhAgiekWQTzLUTXcsw1FOghGf9e54ahU7jCBkMWVj7Fnqi0eOQ2beNHwZfsioIO083u7drtsY9YjNtbJ22H0uUQq3O0THne3tL8TnaF19GXhlSEwDsFmPQhab/oI4rgnjG/3meuSIUA/dEmWmCNjlkIXFXiumdc3IqmJIA/eFg6RoHFzMmwtsTXaWdpIZSdRKdb69j61L/xz00hjYx+JZAsYE2Re025sAcU9ONsb/J6ZRiydWiTipPwdAcge/ZXTvIL/Dwx6tDXjMpRtnYOK6egtPztNZgxL9B/5OFuXo4eBX6NL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSuQ9r4v7WEEidkC78EbyrXIlGiMwve8i86NJVy/FwM=;
 b=ZS6m09R9h7NgEX14uyShunlQaNY+/mh7QRru1vjIwJM/l/yp29b2nbIn3dRFX1L9L2cjhJUiU69FskQTGHQFnLUKbmho6uDyJDwZ/A2AbPwWh5waZDG+f8jsdhDO5c7hX563GdFnwG+JBqZ2Cp9z+y5qz7jAvyglPd0jX1Ee6A3QyAiqN24dl7AP4MFe8qaKu0MFIpiZZUbqwwyySIexng4mnnpuGT9RrgWZwWlMjUniBPZ6faPZvsAX/RDN9yMaylCCe/C7CVD8WX2MN8fjKZ/Hel8r+DswwOophrK8wf2GyAbF9pQ7/nWXvgnb6sh79slUbKvXtjMSOasgKv1Rnw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by MN2PR10MB4368.namprd10.prod.outlook.com (2603:10b6:208:1d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Mon, 12 Feb
 2024 17:35:29 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 17:35:28 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] own class import fails in nanbeild
Thread-Topic: [OE-core] own class import fails in nanbeild
Thread-Index: AQHaXdY0UQUR5UwFCkaI3o9PRGH5SbEG9TkAgAAC1oA=
Date: Mon, 12 Feb 2024 17:35:28 +0000
Message-ID: <b986253f35b5dfaa2249f5a1805f9a102d32ab12.camel@infinera.com>
References: <9aaeb9e948caa2285b16f15003bab3cc8f348ade.camel@infinera.com>
	 <0F8F18C7-1492-4C96-9ED9-AB21F9D99F72@arm.com>
In-Reply-To: <0F8F18C7-1492-4C96-9ED9-AB21F9D99F72@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|MN2PR10MB4368:EE_
x-ms-office365-filtering-correlation-id: b55349a8-cbd5-4ccc-915e-08dc2bf10119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jnylAUduJFJdnL7+tNPdRZAMhzpm1PfCjy1iR4rbD+2k98FomeAX30n+B02D3aPC5IzqlhiFMXjVMax3eExYThecnGJUMKi8xat5WWSq3MKVmz5i7Z4D4PsVKjRfmEaj1j/1PRlvBnuOGys1cMLxaHeHQH8qMaF5fC2rzaCewxPKpG0fX9Muoxr1W/nXfUxKPT+ghEhjDEkbE/a5JUkRXhs9NdE3qboqPTTNdpbkYcbYACeYQOH7JZrZ+MQUboUYeoqPO/YHTdGlqk4U8XS+PoBHhIMTf5jZcHxNHxqULZ7CXimF4ZlxFwUKz36dFPgpm4PAjJ+PcDDTs30XlE44R91paxeJ63srZ80JrOjTCAKflL/uIOUA3GS747ocyrCw17kEOcUcb8NnnckWq3/9G/BXVirWwFcXnOr/GhtIOFQVbIlmh2cnxGqUjOlJMb2ERCYz+f03wQxY/EwE+Llhy4hjAPKtLs52Eouk3zQUp2q+wwSujk2oRGzXFoo/MGyELQk5MOPimU0G57vgxe9FaiRJP8Vy4Y6VMxbproU5X64/GxsPdYPhwFoLPMxZXgMOUFYD9tgeTl4q/GQ4J1y5LrbCt8Dtk1xry1SQY+SZoXc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(71200400001)(2616005)(41300700001)(45080400002)(2906002)(4326008)(66946007)(76116006)(8936002)(5660300002)(66556008)(8676002)(64756008)(66446008)(66476007)(478600001)(38070700009)(316002)(966005)(53546011)(6486002)(6506007)(6512007)(86362001)(122000001)(38100700002)(6916009)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?LzJuYk1JTmdSUkowY1N6dTg3WFpHZlZRanBxejU4d0xVZTRwSndueHY0akhF?=
 =?utf-8?B?NFhSaytDWU42VlErbW9TMTdXZUZSQSt0cGoyY2N1a3lyZzNpejFDVXlGNXNv?=
 =?utf-8?B?Q0MyOUpSOTRrdkNjcCs2VzkwMGNUai96UmdoUDBvOGZVYndaRk5NVlpqcGhn?=
 =?utf-8?B?TEd1QlRQejUyc1FYWFFRQ2tNMVdHNW1kWjhmSlZvR2hKUXlvdVJVdVBHakhv?=
 =?utf-8?B?UVNmdHE5UWE0NUxZUWYwOTB2WG0zNTBkY1ZVek5kVGNDVmRFeEdxVmtZNlBW?=
 =?utf-8?B?ZEo3QTRUbmgvSEwwUjg4L0ZjZVYvSkZjemJ4UEszbTFiNlMwejNkamVtME5x?=
 =?utf-8?B?Nk42UmZTT29hSmR3ZXZUMWttN2o4SUxvemJqMnVNNVFIajkwb3JLU0dCbFI3?=
 =?utf-8?B?QkYzVG5HekR5TEgvTGQ2U20vd1R5MEg1NXBBeVlSVUlRMjFuV1RrS2FHcjZq?=
 =?utf-8?B?TjhwRzVNUGxVL2ZmcXRvTGkxMC9TQUhTVlJTdW9jd0ZoUGp2OFFKOVlUUERM?=
 =?utf-8?B?V2JGTXJKcmR6ZVRFRnB1RW9UU1NleGN3ZG1MU3RiOEVkMjZsQUxwdldEMmxs?=
 =?utf-8?B?d0JueTk1Lytvc2dteXpQeWY0VzdSWGppUWF5VkZhck5OQ1BPc0orMzFtRHBB?=
 =?utf-8?B?R1ZycnJibHlyUkMvcEJaN2QyNHIyZmlKb0xJRVdvYnR0cHpybDZCRW41bndP?=
 =?utf-8?B?cnYrMjBKS3kxZ3M3SnBNSVV6cndtdC9YempXU2ZxZGNEMGREZlVIMHNZaXhp?=
 =?utf-8?B?bnlKT0Q4QWZSbng1bUpVT09nSEFoSUV3eUlVSVJQMGxmODkwZXZYTXF3OU4x?=
 =?utf-8?B?b2ZXaDZkR1k2MHhvS0FVRFN4WFJieHk4V3o1dDUrcUFXVEp2RFhlODdreGRj?=
 =?utf-8?B?WjBIK1piSUZkOC95SCtycWMyLzZmWWlnTWNPUUVGcWFxak51Zzk0b3BXUmpH?=
 =?utf-8?B?N3ZBdWtlajhxdnlGQkdpSmNXZjEwMTVLRjFJQmdVZFZ0NWQ3Q2dqdGU3SVRC?=
 =?utf-8?B?Ym92R1puVEhCNmE1WENoUlNtZko0aEgvMXRIaHZoTGloQlh4bnpWUXVwdmc5?=
 =?utf-8?B?VGRpbEhJZkZ3cDFLYTI2SDNZS2hzNWM0UW5mSzY2VUNSdTNYTWQzcHVwT0xX?=
 =?utf-8?B?c0dLVklLQ1JUVStvL3Zjc2JQR3RHZzNoUXpIS1JBcFc0bWVpemlmYkJCNW55?=
 =?utf-8?B?TS9tY1lTSi9XcmxBalVFUUpZSEhPcTY4VFllcUNRajRsd1Y5SCsvanhyWTlu?=
 =?utf-8?B?UWZLM283ZjN6SjVuUi9yVVZsblNsekpWMHc2MWNtbnl0NlpIWEE4MlplbW5M?=
 =?utf-8?B?NWd6UVpiQnBMdkNPRkp0Mm1SN3g4S09QeWd4dCtaZlVudlplMUFtV1VZQTM5?=
 =?utf-8?B?dWsrM0hLOXA1bEo1c2dwbk5jeFp3Q05Nb1hWckVodG5IV0huQ1VieWc0RjNK?=
 =?utf-8?B?T0tUQnoxRWllZi9ZUDhlbWpwcUtCTHlvNFNXYmpnUlJRdE5uUHd5VUVzdXNI?=
 =?utf-8?B?QlI0K1NlUmRUUzhkSmloY2Fmb3UrNnduR2I4d3Q3K21ZKzdPQ0JTVkdxZFlu?=
 =?utf-8?B?NG5UTDFWS3hrKzY4WmJpcDhEakhncVJvSHB1VnVIWG8wZVpvdGRaK2dvOXFa?=
 =?utf-8?B?aVZTZ09kRFNXMGlqekpKUzJMM2pCZkdXNlVrb0x4dW1DQzBjbUNhcDZ3SlZh?=
 =?utf-8?B?RExjM2xzeGQvZnpORm5vczBJTkE2aTNQZDB2SDg2K2VMOHkwQXRLYW1acXBz?=
 =?utf-8?B?ZU1lTWg4TmRXYnpBZWZzSUgrNjcwMVZ1S21lUkRUaDhpV1V0dStoVktsWkFS?=
 =?utf-8?B?RVFnamFieVptYjlRSjllZzkyb2xKMXc2L0FzbHdrWnp6OVlWcGpBa0Y4Y1kv?=
 =?utf-8?B?VWhMWkhEQW5MMWl5YmlrbXZoU0RmZ1Y5YkV0Nml4WS94UmhzTTNBTHpMMFdQ?=
 =?utf-8?B?SEVhSTVrS3JTZHRyczNLS0lCWWRBaHdvQm5qRWluT2VzMms5eEN5N1NkeXRl?=
 =?utf-8?B?ZDVBUjRlblFQaDEzZ1NqNUNGZHhQNVJUaTVVYmEvQmVWbjVKdG9YcCt1UEhl?=
 =?utf-8?B?SHU0cWZMYzExZ2R5bHo3UWpZd1VyaG5EdFVNWHlIQ0dacGlacnpXSy9DNHpV?=
 =?utf-8?B?bHZZSkVJZmRPNlJ4OHl1L0I0LzhVSk1Hcno1Zk1JMUVNcWgyR3VIZXMraHcr?=
 =?utf-8?Q?WBAu2IsUHF+iI9nfq1G8QQBmR+HQHHXTgqc1ldDD/RGE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E353CDFD60C004198DA22A1FABE59A0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55349a8-cbd5-4ccc-915e-08dc2bf10119
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 17:35:28.5230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyiKQ1plWGIcN+sv0JByDJLZMwOx2xu1S5RXjRVA2s5r6FbqnWkx9GJ0zW67D8utzGFgI8x6EfA3tG1M7/8lxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4368
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 17:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195351

T24gTW9uLCAyMDI0LTAyLTEyIGF0IDE3OjI1ICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gMTIgRmViIDIwMjQsIGF0IDE3OjA5LCBKb2FraW0gVGplcm5sdW5kIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxKb2FraW0uVGplcm5sdW5kPWluZmluZXJhLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgd29ya3MgaW4ga2lya3N0b25lIGJ1dCBu
b3cgaXQgZmFpbHMsIEkgZ290Og0KPiA+DQo+ID4gY2F0IG1ldGEteHIvY2xhc3Nlcy94cl9saWMu
YmJjbGFzcw0KPiA+IHB5dGhvbiB4cl9saWNfYnVpbGRfcmVwb3J0KCkgew0KPiA+ICAgIGZyb20g
eHJfbGljIGltcG9ydCBtYWluDQo+ID4gICAgbWFpbi5idWlsZF9yZXBvcnQoZCkNCj4gPiB9DQo+
ID4NCj4gPiBJTUFHRV9QT1NUUFJPQ0VTU19DT01NQU5EICs9ICJ4cl9saWNfYnVpbGRfcmVwb3J0
OyAiDQo+ID4NCj4gPiBhbmQ6DQo+ID4gbHMgbWV0YS14ci9saWIveHJfbGljLw0KPiA+IC4vICAg
YWdncmVnYXRvci5weSBleHRyYV9saWNlbnNlLm1hbmlmZXN0ICBodG1sLnB5ICAgIG1haW4ucHkg
ICAgdXRpbC5weQ0KPiA+IC4uLyAgZXhjbHVkZV95b2N0b19wYWNrYWdlcy50eHQgIC5naXRpZ25v
cmUgbGljZW5zZXMvICBzdGF0aWNfaW5mby5weQ0KPiA+DQo+ID4gYnVpbGRpbmcgdGhlIGltYWdl
IEkgZ2V0IHRoaXMgZXJyb3I6DQo+ID4gRmlsZTogJy9ob21lL2pvY2tlL3lvY3RvLXhyL21ldGEt
eHIvY2xhc3Nlcy94cl9saWMuYmJjbGFzcycsIGxpbmVubzogMiwgZnVuY3Rpb246IHhyX2xpY19i
dWlsZF9yZXBvcnQNCj4gPiAgICAgMDAwMTpweXRob24geHJfbGljX2J1aWxkX3JlcG9ydCgpIHsN
Cj4gPiAqKiogMDAwMjogICAgZnJvbSB4cl9saWMgaW1wb3J0IG1haW4NCj4gPiAgICAgMDAwMzog
ICAgbWFpbi5idWlsZF9yZXBvcnQoZCkNCj4gPiAgICAgMDAwNDp9DQo+ID4gICAgIDAwMDU6DQo+
ID4gICAgIDAwMDY6SU1BR0VfUE9TVFBST0NFU1NfQ09NTUFORCArPSAieHJfbGljX2J1aWxkX3Jl
cG9ydDsgIg0KPiA+IEV4Y2VwdGlvbjogTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxlIG5h
bWVkICd4cl9saWMnDQo+ID4NCj4gPiBub3cgYml0YmFrZSBjYW5ub3QgZmluZCB0aGUgeHJfbGlj
IHB5dGhvbiBtb2R1bGUuDQo+ID4gQW55IHBvaW50ZXJzIHdoYXQgSSBtaXNzZWQgPw0KPg0KPiBT
ZWUgdGhpcyBzZWN0aW9uIG9mIHRoZSBtaWNrbGVkb3JlIG1pZ3JhdGlvbiBndWlkZToNCj4NCj4g
aHR0cHM6Ly9kb2NzLnlvY3RvcHJvamVjdC5vcmcvbWlncmF0aW9uLWd1aWRlcy9taWdyYXRpb24t
NC4yLmh0bWwjcHl0aG9uLWxpYnJhcnktY29kZS1leHRlbnNpb25zDQo+DQo+IFJvc3MNCg0KVGhh
dCBtYWRlIG15IGRheSEgVGhhbmsgeW91IDopDQoNCiBKb2FraW0NCg==

