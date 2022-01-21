Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE77C433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:32:20 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.62])
 by mx.groups.io with SMTP id smtpd.web08.10588.1642764732058053170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=I6H4xqWq;
 spf=pass (domain: siemens.com, ip: 40.107.1.62,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JonisU7u3Tx4Pq2auq2syE2G3iJ+ccgsXoCOHIhRWNEHJPw9chNWexZ4UZ/68l2jJs/eo7LfvhyheDNFCpofRPL5+y4fb7U+HIzjJrR0eDl46LbSgX/p31jRiDBWd/nvcNTJNnRGGKRiK+erQBtY+0bP3xKems5b9uo6bQOmZ/+hmsXsYRU2aPoGzS1W+r45jnWmKkH8YqnIA8Zz+YZnQr10RoZdt+YfSLtRpEA+Lv97nA8c9BC1NrYP30Q6dJUuJxI4kbwBTujGN+R8I4DM1tMiYwTx0LXT5SS9iy2Saa/EvgPUccZRHW667qSmjV13UZg+XgM5d/IO+1HauBr4fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGDmSgCHUaNktV8VLuIvtTQu/Ja8SvIs9v4TK6UkMFc=;
 b=ewjiOyym0e8j9zM4VnerHj2NmfC1JCR1HV6ScyKhUE9/DE4sPQotNNv77XHo8eiPLMeeorVW5HvQvgLDXZnrx112q6nW6VvBrgzswNQHAIrW1lgvdqXPOT4MkdA04p3N/MzKeIbv3mbD2Xf6SR0VdHB5KteKJRKOvvQV3ZZsymDe1zJGbXNutuWbAuStY9PJrkj/YFdInVQIgS1NFOx9v5ViiFNW0bU/ZrhIvSRZyP6tR9F5v4itUGBd1EQ8ivJ/wpDmGkTlqA3tSlq5JcGxj38UDlibWHPMLfEg50XZF3G7AITGLUwSUFxfVw3kovlNeYavNyZTvpWuauC4p/MeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGDmSgCHUaNktV8VLuIvtTQu/Ja8SvIs9v4TK6UkMFc=;
 b=I6H4xqWq3ctCWacntrhSaFrIMlFPw+05HiAzyy2QzN9/CrQWrdf273B1BGB647WuYU+rbswclTu9jcWDImAxKsqcye1rGxZpaZAsbzJDvXuE++1cF5kQ2dEolqCovTc9n8LnSKY2ZEczHCUJu6Myksg9XYQuvCnUmObSi/wqAKbI2qekeB3Muuj2juCS4pYjW255LwBo0/+ez3RrcY9RdCCChv/P2UxAOQm00D7IpBTLkzzvo6mcQIS9yesOwy+W7xS8m7+4c1C2IUJ/eOYkW0Mea9pxMQb7MnNGbkLfvcpy6gHysGOKZ2lJiheaieKrLP6xD3NJTmWftry8TwPeag==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by PRAPR10MB5155.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:27b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 11:32:09 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::111a:bb31:64aa:3088]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::111a:bb31:64aa:3088%4]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 11:32:09 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: qemu tests
Thread-Topic: qemu tests
Thread-Index: AQHYDrqGmM/Pesb4FkOA9KopOwM1aw==
Date: Fri, 21 Jan 2022 11:32:08 +0000
Message-ID: <af147eec110b7964f388fb5f0398042a7310cb90.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fc1142a-b227-4fa7-7765-08d9dcd1a8ef
x-ms-traffictypediagnostic: PRAPR10MB5155:EE_
x-microsoft-antispam-prvs: 
 <PRAPR10MB5155FEAB5C7DDF8E4D9795A1925B9@PRAPR10MB5155.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ScxykrNyEc3sasGNNzG/7iCuaabJ2QVvl+gLo2Gn2JJPnxIn8ALzMlxmfTD/n/pmS/fYpLQVsRlzo7egDLhORYsioYnNIhXMXjalNz0B4Ew14HWV3OMnnYHWRQNpyU+E3MVl8rbsKXG8bYL3X7z1QXHd5sMPTBdbyCuMSWmbDmbGbKz3rh5m7FqagY+5x5KiKqlK7OjRKlkAucVddvWKeVQ/nKdJlI4/mgDIIrb5a0unu/AwdmsGlnqQo79gs5XUWxtlTvhRjhik9ekWVrBoSnHbpX5XQmlFPtY0AS2WOp7gkfbiFozufJ88VfVOqdM3cNp7trCiRQwLmHm9JNVYu8p7tV9DSQCrFgHJjJkA2s/3VTJFbU6nwy2Bs40sBUWGcbUYQnNYe/6549wyrRQpbAg7DG5OPhCdalaaGW6TdIAwFvnBzVNtnSfLxS5yQgarAel7vQm5aARkb4u1WiYh4+C7nfbEtab0CghcEJw2j/pb8bJ/T1AIRVTvF9LUwsNfG9tLIEH/Ie3LjcayS754HG97299jjqEq4ryK+B7vpRbwcQ83JA1g9sduvnEtuDHn/dvflHn5OG0/prerirwWqq1F70WxBj6fpT8sMQPzXrv2/FVsH1lEYHZs490eu3IvQPKbC0S54xbirWGwu8WTUVLLlQLTMf1AGXh4ICvP7Si4nAuyQWKeJlAx9Hr/u/M0u4i7nLwCc9qX33lArskRYQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(8936002)(36756003)(38070700005)(7116003)(6916009)(6486002)(508600001)(26005)(186003)(6512007)(316002)(3480700007)(107886003)(71200400001)(122000001)(38100700002)(2616005)(82960400001)(91956017)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(5660300002)(4326008)(54906003)(86362001)(6506007)(8676002)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZnBpd2lrMXNvRDRPWkJZdFRMbG9Lc3dLMGFQT21QTUZKYzFVWHB0SlBwMkxU?=
 =?utf-8?B?TG5QdTEvUkszQ05pQTlHNVVwQjNYMDV5WEdodlVVbVdsODRkRlJJUFlSaWNy?=
 =?utf-8?B?TjlidUlsY05aUEJNRkV1UE5XSjNrMTgvQ2FTSXczMGZrbVRtWXFkQmt3V1Jj?=
 =?utf-8?B?QVBwS0tYMlFycVhvTEw4SlJXV3JsSXEydGtKMTdKdFVSeDZCRXg0aUFreW5B?=
 =?utf-8?B?TVpNd1JHYTlQRlhoYVo5Zk9SRVRXWHFiZGt2dWhOelBpaWRoOHU4cnhEU3Z0?=
 =?utf-8?B?bzNvME1CMEdoTDBVSGNzekIveTlhNi9vSFFUTlJ0djI2N0lIR0wwSEIxbjMw?=
 =?utf-8?B?RUkzbEQ2TjE3SVc4TzhOL3U5eXdFT2tvVFhuS3EvUXhNNlkxUzdkRDdoNEd0?=
 =?utf-8?B?SW1oMm5LcGhadnljaWFicjQzN0UvQjVvZFlDVzJqUHk0M1NGWnlTZ1NIL2NR?=
 =?utf-8?B?YkxzZXB0R1RZeFhNZzdDUHYxL2lUYU1ob0RFMVU3cXZwclVkdTRsakNkY3lr?=
 =?utf-8?B?RUVtSzc4TlluNm5VeGtXbEVEZjBxQkU5Nzl4ZWQxeHUyMlRMQ2tvOFJFcnhB?=
 =?utf-8?B?c0FURnNvMXZ3eVVVRTV5dm5kOXFWdDZWdUZaczYvWFBMN01SalVDaHpPU210?=
 =?utf-8?B?NVRVK25mWEVaRVpFanZycWh6VUVMNnVlWWJGc1ppNXBLRWhmYkpxYkNoelN1?=
 =?utf-8?B?U0JSQU9mUVpQYm1scHhVbGIxTUxIYkNTc213R3ZnR2xYN0V2QzFZK0FqME9p?=
 =?utf-8?B?ZXplUWdHL2lSdkV3NXJxZjhuMUtNb2F0MTZlSHJsbXBYeE9jQTlGcUJuVzhj?=
 =?utf-8?B?QUMzclZsVWpqSllJdW8zdTdHdVlOQjlzN3BRZEFhWlZUM0x2Uk1QOFBwbE1G?=
 =?utf-8?B?UCtTZjhRUVdYT0dtL0FydHIyR0F2eWlqQkw0V1ZVeWR3YXpVRVl2a1plVGR3?=
 =?utf-8?B?ZkkvVk1DdUdrQU92K1lJRW9oa1ZrVVRWNDRSN2prRjdHV1RIblFzQW8yUGNN?=
 =?utf-8?B?eWNjRjlDY1JZdkI5VlRENDEyTURNeU40MERNVFJpNGhWckZlbVRwRzRodldh?=
 =?utf-8?B?MnZkLzBKRS9ObU9YV3AydDZRSmd0ZlBVeUJGdGhjUGI1MmJ5RTlIb3AvaGhT?=
 =?utf-8?B?Tm5nbDZaQ2UyWTBJYWZaSVQ4eGQydTdHQ1ljM1A2ZjNCYlFZbHlWVVZzODJa?=
 =?utf-8?B?aCtiaTB2RGRGbFdmSHZGcHR1SGJKSG5Uc3p3K0ZneVFMYmxSdk5mRFF4R3hM?=
 =?utf-8?B?djNMR2xSUWJQaldJNUxZQTVaUk5hNVhNNStLMi9jZFZYRk5oZmlRbCtxYU5R?=
 =?utf-8?B?WFhNMWtWUFNsb1EwQUxnUmd2VWg3dVk2bk84V2srY3YzY01EWHdFUlI3bklP?=
 =?utf-8?B?RzFHUjV3aDdhbGRLcUFhOGRIQjErT1hBeFBTUllHQUlVWkgrK0Y2NkJGMmYy?=
 =?utf-8?B?aG9uWng3amRqN04zUHhVdEpBMUp5bkJNaDVsQXZLWGVwNDBCYmFETXBKVGM5?=
 =?utf-8?B?U0ZlZWRBTDVmbHYwcSticDRjNEt0K1BQUG1tdTdYallJZmI4TGZMM2pzWmNK?=
 =?utf-8?B?S3ZvTVhXU3VyK1FOY3F1MncxT0hZbjBuZlh5ekZuZGV2YTMwaTNkeHlsdlly?=
 =?utf-8?B?RS92eTNrckhhNFdUQ1h2YmJLNTNKeW5mVGFnd3lVcnFHUjlXMXJGOWFWbU1C?=
 =?utf-8?B?YUdPeENURm1KQmlCNXNmYjFDNWNCRkZ2V09ZWWRFNHM0K01hdVFVV3RyR202?=
 =?utf-8?B?Sm9wRFBnc3NMUjAwdW44cWtuZ2xjNVFGaTBna1daRzRLYkZqVXR2eDErbWlM?=
 =?utf-8?B?Sy9oendDOS9TTTdESFhrK21KWGNvY0ZwcTZrZFViK3hodVFCMTdBUUoyMFJM?=
 =?utf-8?B?QlhsUjd3YnFvUGpPYWxHSjloL0ZVRlB6NXhkemtVZlkrdWdGenRQVmNWbVMr?=
 =?utf-8?B?N3NmQ0w5V1M0ZytONFUwYnFGTk9EVm11eVFzc0NnY1A2Q3pkck45QkVXL1Jh?=
 =?utf-8?B?eXBWVmJNaWxZQTc4ZldjZFM5RjZPVm9BeXJ3eVR3L1Vzbks0UzhKbTNZWHEr?=
 =?utf-8?B?NXBJc3JWbDgzUnJsZWhqTGYxQ1lXK0pPekxqVU9qTjg0QmFELzV6UUljcmU0?=
 =?utf-8?B?SEt6WDl1QnUvWEVEV2YrWlhDQVh4M3orNy8wSGd0UWtrR0d4RkltazJreHhk?=
 =?utf-8?B?N3duWVhxU0h6cjhVdVc0NmJtWnY1ZFhiNFh3Sk5OZHlSa3k0RWFLa0M5eVQ0?=
 =?utf-8?Q?WvIln8hYXn67bxAkGoVUiwUN6aJQ5Mhjep0KMKgQQ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D9B62D239FBB24D9B4823696D633CA0@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fc1142a-b227-4fa7-7765-08d9dcd1a8ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 11:32:08.8615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 gPHhV7Hb4H5P0utuHHhaVxf2DvpkFQecY2GQ06DTn5/+ZyH1qRNpSNMWzmDP+gofiE5v6BxrRhMSOLUkjok+17mvp+OpxiDF9vC+Xx23ja8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 11:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160817

SGkgYWxsLA0KDQpJIGhhdmUgYSBnZW5lcmljIHF1ZXN0aW9uIGFib3V0IHRlc3RpbWFnZSB0YXNr
LiBDdXJyZW50bHkNCidURVNUSU1BR0VERVBFTkRTOmFwcGVuZDpxZW11YWxsID0gIiBxZW11LW5h
dGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290DQpxZW11LWhlbHBlci1uYXRpdmU6ZG9fcG9wdWxhdGVf
c3lzcm9vdCBxZW11LWhlbHBlci0NCm5hdGl2ZTpkb19hZGR0b19yZWNpcGVfc3lzcm9vdCInIG1l
YW5zIHRoYXQgbm8gb3RoZXIgbWFjaGluZSB0aGVuIHFlbXUqDQpoYXMgdGhlIGZlYXR1cmUgYXZh
aWxhYmxlLiBTbyB3aGVuICJybV93b3JrIiBpcyBlbmFibGVkIGFuZCAnLWMNCnRlc3RpbWFnZScg
aXMgZ29pbmcgdG8gYmUgcnVuLCB0aSBmYWlsLCBiZWNhdXNlIHN5c3Jvb3QtbmF0aXZlIHN0dWZm
IGlzDQpub3QgYXZhaWxhYmxlLiBEb2VzIGl0IG1lYW5zLCB0aGF0IEkgaGF2ZSB0byBhZGQgdGhl
IHRob3NlIGNvbnRlbnQgdG8NCm15IG5vdC1xZW11IG1hY2hpbmUsIG9yIGl0J3MgYSBmZWF0dXJl
Pw0KDQpNYXliZSBpdCBjb3VsZCBiZSB0cmFuc2ZlcnJlZCBpbnRvIHZhcmlhYmxlIGxpa2U6DQoi
VEVTVElNQUdFREVQRU5EU19xZW11IiBhbmQgdGhlbiBJIGNhbiBpdCBhc3NpZ24gdG8gbXkgbWFj
aGluZSBhcyB3ZWxsLg0KDQpIb3cgdG8gZGVhbCB3aXRoIHRoYXQ/DQoNClJlZ2FyZHMsDQpBbmRy
ZWoNCg==

