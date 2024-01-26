Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE12C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:52:42 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.77])
 by mx.groups.io with SMTP id smtpd.web10.18053.1706280752788679269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=fKAlo2AC;
 spf=pass (domain: infinera.com, ip: 40.107.93.77, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKONQ0CpGjshfca5U68Lf0cW6iiCl6e8r+GAWpWhvjsNLixFKcyd+uvdj1Im73P//oUuKIRc8ZF/ONL8XTlrRzApFuN1POcaHU11I7yQ3Ajw5TXObTkqdXKZzBTt4b7xbexXSa/MAj9FDdfedz25tUXy2DDyYsXy6E9cvLq5HRspuCsDbzONZZ9yYyKqTyQgcX7kTUYG6rtWvKBi+hjahNXdvGjlMJShxQWqdqAvfKb9tbO9cjfZ+pzvp5eJIn0k0ojwQxa+HTkETkylo3yYdh+538t/0wzjMTntWLXn1Z/c97MuSMfvNtTWAEKSMBk4vo0ZG5HJDMo3z5tegVVsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liRDcBc0UBilDuXlkJV7NfQOwemUGucEg+vTBFaRqeY=;
 b=LRM2TBCCZP73wI0PPbyBFZmsg47ml5JNotnyrM55etLBnwVk4GzARIrTRNdrm+QtOssSaEEDWnAliDdfwWl4CvZiuEcIfl+FHqO5qS8U22/9TPMoAHkXZ7hJDzLwHU7Fak9/VJ7R9XLTKSo10SOGVDTmkwIGlbgvzBaZyInziHJdQCp4HuSu27dFw4giCA7P+w54RNkiutlTrcsp0YBH6qeg4I59ilTlLByyLNQXqc+TqbZ6Evh5KIHNo0sRgHnScE4IeXlKrmPZKB5X/RJUxVQ2mR7FN/LoEyewjnEdowLpDWHo1zHQaGMck2bmGiRsk3tC/HhNWJbiHWC/yAx5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liRDcBc0UBilDuXlkJV7NfQOwemUGucEg+vTBFaRqeY=;
 b=fKAlo2ACQNsoXQ9zPBzvag4QI5eSrG0m3ltNU9HF+1ph6iNY/oVMWGVfzBnONrI41aQo0eb6tUAnbEFgvGQkmCO2WbFyEw2AznQG3M1ZTu7+MSXwuzriQ98k1x6pzOtrakiUp6JaA4bKpLl+EfQcCj2yZ4W/C2nv7IXAZg3afx7KLN6gTzVN15RWRWkHkM9uI0MCAs4k9lBdpdlp4qSLcUFexG5RfO3sf4yiBm9I8C28s+rGaqiI8EERz1g92cu9jyQmSJpaKSHsRGyVEOETnNKrt8Yqt4GadCkVvrZvda/mwvQgFmYvb1aZz2Dqo7VT+XsMf6TIjieZvoU4RLC6pw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4421.namprd10.prod.outlook.com (2603:10b6:510:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Fri, 26 Jan
 2024 14:52:28 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 14:52:28 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Topic: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Index: AQHaUEgkMNzCIETAnkmJ7AygmSs1ubDsAvKAgAARooCAAANfgIAAFguA
Date: Fri, 26 Jan 2024 14:52:28 +0000
Message-ID: <7b811dd50bf9451b3a221c547fe13328f2dac140.camel@infinera.com>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
	 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
	 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
	 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH0PR10MB4421:EE_
x-ms-office365-filtering-correlation-id: 3d682a15-e4b1-401f-2cf9-08dc1e7e6ac6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zG8X3F38u+wtgRFavBqxlmUfARz/xf2ntb5p9gESJM65zm5UEI5esoF8DpE28eDMMdQu3OT5lwn9kAdQpgprojNYEp19AEhCT+9oMLpy9t9H78+9NLhbiDvW1FdO1ciR9mXEz3Yqkv9VpOpWGL+0CotP+DMXGJArDgEM/Ta+dHbXL/Ho654J9z0BwVKNJYXI+1gWJ/Syn82ISXTlmYgVSuUev0qVS1AMCNOM0dj39vENqwpBCFXOj97O4pOh/VkIKuhk1/PPSrkv4GMQpaJrJ2BOAta6jubsuIl4nTdihiDtZYH/8bK1Huld1zSZHidAR4EZwpj/Iw6O96tiP1z6DmRrpwHjJl3qPz3qeq5XFgzJ3lwrhF4yOXZWedUBxYmirmRJkNRtTBFY64PtXIjzFD5myYgWrJUV5C6b2IFc5H1dptGyvFDt+AKWdHdm8j6J3UqLsan6AVrWogcPeTpmLABnpTKz2rNT7vbKVynGXbgFiQdQcO4y1zV+4ROS2AWzxzAbOXvtDZpmmftKjjKYpaZ+k3FHtJRRyQUhggIw5xshFTYm2fAV4vfvinClcP+c/bL3H5FPlfx1BfLBOF1tc+GvTlYMIpy7E7HNB7l5sM89RNGdQ3DAMS0gsEzRr27I
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39850400004)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(71200400001)(41300700001)(76116006)(86362001)(66476007)(36756003)(2616005)(66446008)(316002)(91956017)(38070700009)(66556008)(6512007)(6916009)(66946007)(64756008)(8936002)(122000001)(6506007)(8676002)(38100700002)(4326008)(2906002)(5660300002)(4744005)(478600001)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2NDZ1hWbmFCVzR3b0t4aVpXMFpFSlRwQzFoanprQW00SDJsOUFMWC8vaFFW?=
 =?utf-8?B?MVhuYzBuaVdZYWFCdzU5N29QangySHhZMjJCNlMwcnR3SEdKKzVLblRWRVZE?=
 =?utf-8?B?bDlpK2h2ZkhZUm5IcTZuOUsxaVgxOU00c1h4VXNKeUozOWRTSG52YW5vU2FY?=
 =?utf-8?B?N2krb3V5OXJOWHhUOEM0ZGVGVVl6SENtby8wQ1NUYk9sU3JqNVk3cGhhR291?=
 =?utf-8?B?dnRzc25NZnYxSU5BYjRKNy9VVllLdFh3cEhxQTY4M2FpQkJGU2FOSzIwQ3FS?=
 =?utf-8?B?ODliNy9xYVV0OE5QUGhFSXlxRWQydTNaSlVCVjVTMVd1TFdLYkEra0kyT1JL?=
 =?utf-8?B?OHlDV1dPZlNIQkthUlBWQk1SRXpTNUh5S3VUY1RFN1ByWncweld2bU1EazRm?=
 =?utf-8?B?TkxZVzJxQzNqaDVuU1ZkWDVHOTF0QXdxdXlrZnlFMkErYm1GV3NCR1pXNlBu?=
 =?utf-8?B?ck9rc1pqMndEdjY2TVJYZ3gyUzNJc2VxMGFlZTZabXFESDE4QnRNQ0h5NFZ5?=
 =?utf-8?B?QVhZWVdxeFVOR0dBWnh4K3Vnc2NKd2E1Zmh2VjBRZU9NSFJad1dnTDBWWUx2?=
 =?utf-8?B?WWlCNkV3OTV6WWM2L2hBblBkb3IxempNQllwSXRrTkJzai9yYUdGbG5iU0x6?=
 =?utf-8?B?Q2FvcXRyaDJzOFN4VWpiTUNzc3cza0xQYVF6bGUvcXV3WjdJTWNIR2J2V00r?=
 =?utf-8?B?cmhPRHRXTHZtbWJKcWdNK25WWnNoWE1NcWZudDM5YU9HR1Y5dklqR0ZtSHR1?=
 =?utf-8?B?cnQxTnAxNDdFRHBXZU1sQWQ5eFlHdlA5bmpGUDE0V0s4dTVnTXZOQnh3U1lB?=
 =?utf-8?B?R1NtMjhTUTRDbFNNa0liWkxrYWhGbWp4MTdvWkEweVRwVjJsSFovWGNKZTZs?=
 =?utf-8?B?RFNQRW5hTVBqQlUvTGhTY3RRUU9HZnhSeTI0QnJRZURabWdiU00yWXhIZXJR?=
 =?utf-8?B?d0xYSDcwalN5L1phUWhBUlRXVUo1cHgwQi9JSEV1dUNVQkVBREZDNnFLTGZZ?=
 =?utf-8?B?ZEdGeHlLUHBoZkZkTjV1SHF5UytNUVBpbm1vQ01LUnA0ZkdvM3M0eWw5VGtD?=
 =?utf-8?B?MUdXZWJhdGtpWUpDa25qVGRucnBVTzZBY2dITitmZ3BlWFI1QWpVSzl0cGNn?=
 =?utf-8?B?QkUwemwwakF1REIyZ2YyUWhtOCtNeERBbHJpbHoyWDAvQnoxaGdSRnlpWHh3?=
 =?utf-8?B?YkhaVHJFbmkvN1RjbFVjWjJZTEtQQ05HTkRPbkM2ZDZFeDRXVzllVGNQUjV0?=
 =?utf-8?B?SlRzeFVmK3cyWmliY25YTnRpYXRMTFJreTNxS1gxTUJEcmlFaGhDRDFaSFNz?=
 =?utf-8?B?TFI5c1J5TFd1TVdMbjFXbzJFckdvWEY5RXA2RnJnNFZIaDJBZSt2TUJhS0t6?=
 =?utf-8?B?Q1l4QzFqNHByOXNDdmNYdm1GanFScFRWOUZqc0VMMzNqUUYxRGFUaUFlYWlG?=
 =?utf-8?B?KzZ6QllHb2hINkZKMTFqTGNPUjc0ZDRzZmdxT2FINi85M0Y0MWtDSGlsNW1y?=
 =?utf-8?B?N2gzRDlrRGlQb1o4NDN3U3V1MDQrU0c3YUdscC9wRXZ2d0xXbm1iVEZ1NEdQ?=
 =?utf-8?B?QXF2MG45M2lHbEEvVEhRVG5odmVwZFl4S3ZmeDV0QStFU3R1cUdUUXRGRm9S?=
 =?utf-8?B?Q1huOXVmZFFoV0ZoZDBFS1hZTWo4RWtFU3ZDdTJnbk5ZdEwxTHdpY1RXL0l0?=
 =?utf-8?B?REZIRjVVYVo5SEZnWXMrK0I0blZPOC9iNWk2R1ZPQ1oydVB5RXBPT2V2c3Vi?=
 =?utf-8?B?Q293Tm90VTFleTIwaHpVd0JhanNBUFhabUtocEFOV1VMbktXUWs3TmNRdFRx?=
 =?utf-8?B?YjFORCtnZGFTbFRwZHk0ZGpkai81WDQzaTdvd2lxWXZLbWVXMEMzYnRLNU1h?=
 =?utf-8?B?UHNJbHlGNDBPS20wL091clFDR2ZUNmhQUmN3b01xb1FCcHlEdXZNMURZdllY?=
 =?utf-8?B?N1VDeTBwVlVXUjBuaExoa1FpYTJ1VlFqMk1yejR0NHlyRmM1cldaRnc1NFUr?=
 =?utf-8?B?Y3hXNGdmTU1LZ0NNZzF1cUt6V2lSZkJzZ1A3Tk5BWHB1S1pWdURKVk5ySHpW?=
 =?utf-8?B?WU9qd0hZN3ByenorcWNWVElQYmc1bEVXT1l4aDlRWHJjU2IzMW9haGZrSWgz?=
 =?utf-8?B?SmtrQU1XRUNZRDMwMlFKd0xjdFB4Yy9yazZ2YUhlVVBLWmpkK0Ftc0t4N1d0?=
 =?utf-8?Q?14Dtt+oA7KO4pJU3V11dlj4t5gpoylndRespTkyobJLK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B74927F5C15F9459583812BC372E19D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d682a15-e4b1-401f-2cf9-08dc1e7e6ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 14:52:28.5430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXAT1TbOuwWT9YVkkDqKRpLIDq5+8e5yOGPYrjj+15aA6037V2tT9mZJL2vt3PV3OfH8XHuhpJ4h1LlMqJTH5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194385

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDE0OjMzICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gT24gRnJpLCAyNiBKYW4gMjAyNCBhdCAx
NDoyMSwgSm9ha2ltIFRqZXJubHVuZA0KPiA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+
IHdyb3RlOg0KPiA+IEkgd2lsbCB0cnkgd29ya2Fyb3VuZCB0aGVzZSBzb21laG93IGJ1dCB3aWxs
IG5vdCBnbyBzbyBmYXIgYXMgY3JlYXRpbmcgYSBuZXcgTUFDSElORSBqdXN0IHRvDQo+ID4gcnVu
IHRoZXNlIHRlc3RzLg0KPiANCj4gV2h5IHdvdWxkIHlvdSBuZWVkIGEgbmV3IG1hY2hpbmU/IFlv
dSBvbmx5IG5lZWQgYSBuZXcgY29uZmlndXJhdGlvbg0KPiB0ZW1wbGF0ZSBpbiBhZGRpdGlvbiB0
byBleGlzdGluZyBvbmUgKGUuZy4NCj4gY29uZi90ZW1wbGF0ZXMvcmVwcm8tdGVzdC9sb2NhbC5j
b25mLnNhbXBsZSBhbmQgYmJsYXllci5jb25mLnNhbXBsZSkuDQo+IFRoZW4gaW5pdGlhbGl6ZSB0
aGUgYnVpbGQgd2l0aCBURU1QTEFURUNPTkYgcG9pbnRpbmcgdG8gdGhhdC4NCj4gDQo+ID4gQnV0
IG5vdyB5b3Uga25vdyB3aGF0IHRoZSBtYWluIGlzc3VlIGlzLCBob3BlZnVsbHkgeW91IGNhbiBm
aXggdGhlc2Ugc29tZWhvdy4NCj4gPiBXaHkgbm90IGZvcmNlIG9mZmVuZGluZyBjb25maWcgb2Zm
IGluc3RlYWQgb2YgZXJyb3Igb3V0KGluIGtpcmtzdG9uZSB0b28gcGxlYXNlKT8NCj4gDQpBIHRo
b3VnaHQganVzdCBvY2N1cnJlZCB0byBtZSwgdGhlc2UgdmFycyhTQU5JVFlfVEVTVEVEX0RJU1RS
T1MsIGJ1aWxkaGlzdG9yeSBldGMuKSwNCmRvIHRoZXkgbmVlZCB0byBiZSBvZmYgaW4gdGhlIG9y
aWdpbmFsIG1hY2hpbmUgd2hlbiBidWlsZGluZyB1cCB0aGUgU1NUQVRFID8NCkkgZmlndXJlZCB0
aGV5IGp1c3QgbmVlZGVkIHRvIGJlIG9mZiBmb3IgdGhlIHJlcHJvIGJ1aWxkKGluIHh4eHgtc3Qg
ZGlyKSBidXQNCm5vdyBJIGFtIG5vdCBzdXJlIGFueSBtb3JlLg0KDQogSm9ja2UNCg==

