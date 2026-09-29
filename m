Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C0CCA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 17:33:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2101.1790703216066305111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 10:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=bJETt0md;
 spf=pass (domain: ericsson.com, ip: 40.107.130.2, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvJ5FoBkyhg5KgGfBseR4LRCwqriI7OquwYbhum5K+qMIa269IOYZHXmHPcrP1fl+cGIUNNzsjfzC/VUGiK4ebHEKTvCg+ip0YRku1qyH3zVJQFcvh4DCja+3fGP0FSy9Q5FY5H2ovL6STobBvEdVK3u+FB2ZuUqqvin3AZ+dGEUIMMa/FKhq7BwXCKxtzsj+tKNMcUdlrB6x2mg7ITjSJnSPzvW8x2EyTiJq+h5vEdJBoFKZi4RWHqDpy/Rty4ZY5IjQXngXSc6790OG8TAoUw2CDFwQJTIm6H4qn1JrBf3bUqj5CbFVJXs8EpeOt0hSjrwbdAR2i7AcjMANKmdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNtwneu43xQA7PtkYyo8+58VzhG0F4Ht/7E2WfGyFdQ=;
 b=tsrdDXds7pvq9njinGm/FT7aIrLHfncGebCfKQs0MHToJ4MEiIjNG1vetarfl7jw7H5H4pZ1JBsAlr3eZChQEfMnspgfVXDGjQL4cyf1ye8CJOZ+qMf5vmPYFe1F94tgRP9Bx7xEfmeVde98v/rTjJ5ZxCf3G8WNAbvhQzRWd9GiugTwMxLxFtGxO8vVQG8LowBTW+A2I7cfpQByqPtsCh/Hl63qjAeHEa7yhrMLc3OX5BFvgDk33XYqCr3Mf7MTRv6S2ndPxx4mWRX9llkTtjW3cQa2c8RHnRjQWazsJI+18iVBaENlqDSIVFsg0/YUnJCMIScmgh6dV0UZS+UQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNtwneu43xQA7PtkYyo8+58VzhG0F4Ht/7E2WfGyFdQ=;
 b=bJETt0md66h2Kssm2CBg/tF0qibr3exsCZ1equhYJkQBtwHdINL7I2Uz5spGGaIgcKqd2T6wKOCttrpcCk3bPfDInCe4IjOyLJnIR3D1gRjzTEhrfmdf9m6dTudzyK+FtsUm0ZPvM7PE4t1dT78E6U1Y4NeJQBwejkPiTjf3p0qMxitzgosU6G+JpzZukOyYN1Wwh329WcawaWOyZQYfiXF/unnb8Y1mS1Tr6JmotwLzte3JD4O2sg3PtQyuCx/RqYxa/OfzNu2UcH1IOF5xLvNjhNrZujCriCHpRrDeZ91+jkK1vyOsYGQf9pO3duhS7G+IBNKmmo4jqG6EtDw1yw==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by BESPR07MB997923.eurprd07.prod.outlook.com (2603:10a6:b10:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 17:33:32 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 17:33:32 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/recipeutils: honor stable_upgrade for
 UPSTREAM_CHECK_COMMITS recipes
Thread-Topic: [OE-core] [PATCH] lib/oe/recipeutils: honor stable_upgrade for
 UPSTREAM_CHECK_COMMITS recipes
Thread-Index: AQHdT4CdqEBkTUbl6Ei4xxvzfSZxMbbl0IiAgAABwYA=
Date: Tue, 29 Sep 2026 17:33:31 +0000
Message-ID: <cbe499f9584f3404bfa6aff904e3db13db4f5cac.camel@ericsson.com>
References: <20260928193559.3922884-1-daniel.turull@ericsson.com>
	 <CANNYZj-=Vu2wPk9-phsuxLsne+j+8Zc+aOAT55DmTLZeWRs8UA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-=Vu2wPk9-phsuxLsne+j+8Zc+aOAT55DmTLZeWRs8UA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|BESPR07MB997923:EE_
x-ms-office365-filtering-correlation-id: 22e6dda5-ca73-4649-0c13-08df1e4fc836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info: 
 160zSks+KVr30jTYKQuzsR2Hd17IFLWqeF56hsnWp74vymNbHWyjSHGa077BdFTon+rL9WijCpiDI6hakMb9zFHV8q8eG0le3jAqnqO6arYteWUFffJblJiXtRKQHE/HmOKMbLvep9TeHn/zvdsUJL6gYtFcJbEBJGHw2k24TsL5BwJaQL0lFErXCLncjZH0gbYfQxn00KAdHtky2F5jSy5YxE6le49nKzFfy4Z1HExk3riM+5iqNaO47gSUmoQfufvsBx0OeiUIdZnZ9rdf2FPuWHMuHRFfttekA9MruLAK8lgg8i/HqgLydwtfjChC4I6i+2tXJrcUYjprlo92Kg3yeE1fZN9N82TCOdcItUEBPqXxY/VDhZWAn9mSL6XXP1/5dUfiaw1I90bLzI4PCq+lNW9k6eIrILr8k5kPwj+4bT6l00Ye9taTI1mjcD0wOqSS02KSahf8LDhSfxyx9YG+k3A9n8nnohZ82UAM3Mv3P4KotDQpF9IwHo/vf6ouifSGVSMXKiTDYzQutNOrQMaFzvNYjhIxcGVglJKT4oPXHrZVXYsG055hQBN1LeZ9CAqHfXrG0roc/NpxK+9JZ4DktbzOiVaIHYEFL8YY8RF+NTz0HeJxsgAN//y8Nyzd8nXBlN+zNQFtz5u4HncEenfbu6b5Xbgs999QCCM7X31Cq77/bua6XetnsQ/3+YUO5mOZOBM5GLRYM80cU6KdMeVQidpf5OmHaD9YAamA0wQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWZIS0tiWmJIbnBvU0ZOQmh6ejBlcmRFZlQ2T0hzNXpiQjcwd2NCVmRUZ3B2?=
 =?utf-8?B?M09YcDNCUkJZNzE1YkJTa0I2YVErU0wzVTJjTjNPU25PWGVHclQzNVlleUFh?=
 =?utf-8?B?NFR3U2lBSnpNL1MxL09hTVorRW1aSkIvYlJpbWZJQUlMZGZ5K0RBK3d2SFph?=
 =?utf-8?B?SVBaTXUydThaMjBxYlJpTXlQTHVXVmc0QkUvSmpoVGw3a1RSNHFrU2c3V0Q0?=
 =?utf-8?B?NWJKUFk1blNzWURFOVE0bjRUWHlBZHRMVnhkUm1ZS1p5SHRxSVdPaWNhZUFo?=
 =?utf-8?B?RUZIaTZWS2JodzFuVDZKWjlPTWJWaXRyMjYySnAzeXlGNld2S3lubTlzc25J?=
 =?utf-8?B?eHVtYk4vTC9hYjVOSXk3SDJ1VTAwL3o1NUIrY3hhNGt3VmlyMkZLZlVYS3VN?=
 =?utf-8?B?b01uL0syVW9XM0Y2dk9Ody8ya1N4MHJGbzBBQ3lHN0hhdC8reXJTK3hTVHBU?=
 =?utf-8?B?MEZ3Uks1ZEFWZ0M4OFZRUUpCMmFoM2gyN0xDMGcwdXByZVlDTFptODRZK2xC?=
 =?utf-8?B?R2RXSTlRekFiZjFULzI4OGpjSVZpakhNRDdkbWtndGFGcmJLWWFESGRtVk9V?=
 =?utf-8?B?ZnFiNVpCZTcxOEZuUWM4KzFKVTJUZGdac2sxV3lQYjA5bVd4cE5tMmJLWnNi?=
 =?utf-8?B?VzV1YkZvSkxCTGkzUXNBYlJwRnBKL21HaTFsQk1BRlA2NmwyTkVlMVN3WWd6?=
 =?utf-8?B?bUdNM3JuZ2pRU0NwS0NDQXNHUTZoZWx4akNQbXliT24zZUt2WXc5d0xYUmc0?=
 =?utf-8?B?OFl4cWFWOXFrSnpQdlBGNmJ5WmhpK1AvRHoxSnh5WEh3RjN0SEdKQ1oxeE14?=
 =?utf-8?B?eW9Mek1XY1pyL2JNVE1OQ3l6N05DbTBaOHM3Zjc4cXpWbkRHd3V2VytwaGVU?=
 =?utf-8?B?RldrTUN4T1EzQXcxSlFOUEt6T2ovQWJTQVkyVXgyQ0VKYWZTUDlPRExibmRa?=
 =?utf-8?B?cXNpZ0tXS0pYQlZRR0ludUpVRTJLd05NelYvWkhYRk5yWDRZeFZTOWhuVURy?=
 =?utf-8?B?T3FzaW0vVmZST29JWVV1MnNUZFpoVkNnNHB0aEtOTllDaXZEVGQrRmZMcFRq?=
 =?utf-8?B?bGl3eTFSOVZFMXZuSzdHZzVueEZqQVZPOG5GZnVNRkZaS3FCZUFORkduRG5k?=
 =?utf-8?B?UmJvSnZQeDVaV3FqdVVDRUluaWRobHRtUUozOTJtdTNsYzM4QW1CSi9wN3Rt?=
 =?utf-8?B?VE1oNDZTamI5OFVoRVZsejYrT1M3MjZUYXY0YiszMXAwZjNqd1gwdjNZQi9F?=
 =?utf-8?B?UFdaVmYxMHlUTEJsTkNXOUtMdVVXRWFDWmpZMGNNZWFZRHgrVzBzNG4yOTh6?=
 =?utf-8?B?MHNMVXZUUHRBd0sza0dKWVNlMmVQOVlKM25sQkROVDJkM0IzUHl1UCt2NzNG?=
 =?utf-8?B?ZnAvc3FhcG5KbGg0QlN5MWIvYVJjd21oMWc5cWxWeUlvNHgzYlJBS1FsQk0w?=
 =?utf-8?B?aG1uYnhjRVdpalZmOXdxUGkxVVRJNFR1V2x5V3FoMElOODloa05nTmhiT2E3?=
 =?utf-8?B?ZHhEY1NtdnpDd2h0cDJYWlRhZkg1Q1pCeUt3WGtnOWYxNksxUjFCUzFkV0F2?=
 =?utf-8?B?a0c2SHlFZDViV3diT09RZ0JvMVBDbGlvQXBWTEhVTlVlS3B4Q0IrZ2dZdEc0?=
 =?utf-8?B?TzFTYUZzM242TENHZjlHM095eWVsbFRONFd1V1VHY1drNnhNUUVSYU5aQzZT?=
 =?utf-8?B?YnpwTEVMWjJ2bGladktqU3R6SjYxK29WMmhVQ0JITVNiRVdCcEMzWlExZHQ3?=
 =?utf-8?B?anVkWkN6SE44bkhNcVN2UVBuY2JvVGpmOXVWb1IzNURVaHRvK3FUeGNic1lk?=
 =?utf-8?B?QStpWXJxNDFVb1RwY1JXWTFtbmZnMmtWUEx3eDNMTTN6NUdJM1VNMTVwOHNa?=
 =?utf-8?B?ekpYMis3dENMbU5seDIveEZNV1dEb2puemVqUFB3b0RuS0lXd1phU2V4RCtr?=
 =?utf-8?B?dU42QkxPenBuSDdQK3AvVzdpZ3NQL0x5V01UVHZtczBpbE5Jd2hHTHZnOFJx?=
 =?utf-8?B?MUZ6anF5RWtkL09raTRjTHZrRG9JSGZVYzBGVW5LVnVqQ3FSVTNHcVdQbDJR?=
 =?utf-8?B?M2pkcEx3T2JIOW1JY1VERE5ETnpWRitOWndGZVIzYXVuR1A4SnJxUHBsd0kr?=
 =?utf-8?B?VVVSRWtGQ3A4MHA2WTBHM0gzdWxHSjVUK0h6MXVkWklZREx3dUtGcWxLbERL?=
 =?utf-8?B?aW9Pd2tWTXYwK3ZlM0NUcFA5cnAySUZEZDRJa0hSSnVMa0RpbEczYTJjM29Z?=
 =?utf-8?B?STM3aFZyeVBaNlBRWUZRSENBZEFaUi9nWmdpaHBSb0lYakhUM1dySUxZbFhB?=
 =?utf-8?B?SXRHZXFFak5MRTNqd2p0d3F3WGwwa2ZpUEEyWGJlamlaTStTRFdtbjQ3ejkw?=
 =?utf-8?Q?McEBEPzdUZ+6sWm0zpu0nyCVIl7QeeMVcwNwvxY00GWPw?=
x-ms-exchange-antispam-messagedata-1: Q1O3Cldc5HIy2ZUSFZQmHXkrbS4rbcUwoWg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD31C23355E1564B9BA645ACD8898A39@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e6dda5-ca73-4649-0c13-08df1e4fc836
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 17:33:31.9244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GyHmVjLclMXf9kdnUV1uVePPUBnWLWanQNxQb6eBRqi3ihyY58kq21DycLwTZtNZTg6uZXYr11E3ZJawveKw1MV4DW0qyFE2tW50gOxbFJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR07MB997923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 17:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246888

T24gVHVlLCAyMDI2LTA5LTI5IGF0IDE5OjI3ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gTW9uLCAyOCBTZXB0IDIwMjYgYXQgMjE6MzYsIERhbmllbCBUdXJ1bGwgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPGRhbmllbC50dXJ1bGw9ZXJpY3Nzb24uY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IC3CoCDCoCDCoCDCoCBpZiByZC5nZXRWYXIoIlVQ
U1RSRUFNX0NIRUNLX0NPTU1JVFMiKSA9PSAiMSI6DQo+ID4gK8KgIMKgIMKgIMKgIGlmIHJkLmdl
dFZhcigiVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyIpID09ICIxIiBhbmQgbm90IHN0YWJsZV91cGdy
YWRlOg0KPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgYmIuZmV0Y2guZ2V0X3NyY3JldihyZCkNCj4g
PiDCoCDCoCDCoCDCoCDCoCDCoCDCoHVwdmVyc2lvbiA9IE5vbmUNCj4gPiDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJldmlzaW9uID0gTm9uZQ0KPiA+IEBAIC0xMDc5LDYgKzEwNzksMTIgQEAgZGVmIGdl
dF9yZWNpcGVfdXBzdHJlYW1fdmVyc2lvbihyZCwgc3RhYmxlX3VwZ3JhZGU9RmFsc2UpOg0KPiA+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdXB2ZXJzaW9uID0gdXB2ZXJzaW9uICsg
Ii1uZXctY29tbWl0cy1hdmFpbGFibGUiDQo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqBleGNlcHQg
YmIuZmV0Y2guRmV0Y2hFcnJvciBhcyBlOg0KPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
YmIud2FybigiVW5hYmxlIHRvIG9idGFpbiBsYXRlc3QgcmV2aXNpb246IHt9Ii5mb3JtYXQoZSkp
DQo+ID4gK8KgIMKgIMKgIMKgIGVsaWYgcmQuZ2V0VmFyKCJVUFNUUkVBTV9DSEVDS19DT01NSVRT
IikgPT0gIjEiOg0KPiA+IA0KPiANCj4gDQo+IMKgSXQgdG9vayBtZSBhIG1vbWVudCAoYW5kIGlu
c3BlY3RpbmcgdGhlIGFjdHVhbCBjb2RlIGFzIGl0IGlzIG5vdykgdG8gcmVhbGl6ZSB0aGF0IHlv
dSdyZSBtb2RpZnlpbmcgdGhlIHNhbWUgaWYgYmxvY2ssIGFuZCBhZGRpbmcgYW4gZWxpZiB0byBp
dDoNCj4gDQo+IGlmIHJkLmdldFZhcigiVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyIpID09ICIxIiBh
bmQgbm90IHN0YWJsZV91cGdyYWRlOg0KPiDCoC4uLiAvLyB5b2N0byBtYXN0ZXINCj4gZWxpZiBy
ZC5nZXRWYXIoIlVQU1RSRUFNX0NIRUNLX0NPTU1JVFMiKSA9PSAiMSI6DQo+IC4uLiAvLyBzdGFi
bGUgeW9jdG8gcmVsZWFzZQ0KPiANCj4gSSBhc3N1bWUgQUkgY2FuJ3Qgc2VlIHRoYXQgaXQgbWFk
ZSB0aGUgY29uZGl0aW9uYWwgbG9naWMgbGVzcyB1bmRlcnN0YW5kYWJsZSB0aGFuIGl0IHdhcywg
YnV0IHlvdSBzaG91bGQuIEJldHRlcjoNCj4gDQo+IGlmIHJkLmdldFZhcigiVVBTVFJFQU1fQ0hF
Q0tfQ09NTUlUUyIpID09ICIxIjoNCj4gwqAgaWYgbm90IHN0YWJsZV91cGdyYWRlOg0KPiDCoCAu
Li4NCj4gwqAgZWxzZToNCj4gwqAgLi4uDQo+IA0KPiBBbGV4DQoNCkFjdHVhbGx5IGl0IHdhcyBt
ZSBpbnN0cnVjdGluZyB0byBtb2RpZnkgYXMgbGVzcyBjb2RlIGFzIHBvc3NpYmxlLiBJIGhhZCBh
IGZsYXQNCmlmIGVsaWYgZWxzZSB2ZXJzaW9uLiBJJ2xsIHNlbmQgYSB2MiB3aXRoIGEgbW9yZSBj
bGVhciBsb2dpYyBhbmQgcmV3cml0ZSB0aGUNCndob2xlIGlmIHNlY3Rpb24uDQoNCkJlc3QgcmVn
YXJkcywNCkRhbmllbA0K

