Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B4AD35167
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 09:58:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9520.1775037495361616868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 02:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DMmnlrJs;
 spf=pass (domain: siemens.com, ip: 52.101.66.46, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwRgjqty+mxaBosZ1ndNKHk/LGs1hewFPSqfYqFDcWIQ5VyiCceElw6NJaD4Kpyp8mDQju5jwtl80vfl71siCxDB+KQoa1TNtqExsKpB7U3Dbo8mrIua4OYtjSaeiWRHUQF+zS0H4TlXszQm+WsWLO8ylCjYRu3W/sP3w3h7Lgd9SOJZE1jaDBmc0+REeZi89aREHjNQAywGFlxwxK0/QUVsDN6dmfW5ft1NKxGLPbkX4My90ayLsO19AjJL3PYhEig+zXOY1cQaOa0AChAc/8ZxXudOQFITG/bQcnc8DpkXjXfZV/VqtrzjN94p92ySqBJYdLOMp3r7gys39KerdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9I2/Kp2qBxsgCd1wssl5n8YhPTsqZ/HOaGpnHXtimo=;
 b=uinYgJFvpUSv7TZHCpzTNMdJ8bhHyBqF78QX7jNlOlooVub1MgcchCYln2G1kxzJADLF+TzrPCZDTJOWsiFbCC7LK5mIYseQ2PlF7YUknwU/w+gVB6nbVdLDu/UzUKOMOLneNUILdJQVZJ67rOLpNYZx/E9BAX802HNRPFEiMFwKjC5LpCdnf1dYVUaJo/v7ASYIIxYGpJHAnPUFcYPV8Ya3ziXDsJDvdS+eOEJ9HOkTGypF7nttz+IqIXLasECb8PA1fjwg5MKT6vPaMO935DQ24apBOIgafa9tB7c4CZg46ftuW231m5DrROnDXsCQlSaZKMCEoai2Ala3SkbQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9I2/Kp2qBxsgCd1wssl5n8YhPTsqZ/HOaGpnHXtimo=;
 b=DMmnlrJsgvvkhX/qOWfXy8LLN3gdpxrIJKTRnfXWlfiG+sa5goCklhFowwh/JaCRyRrZMYASeMLiQTtdad23g0cRtHX6WwxzX19pzzzRt5s1UkEKHTK25FlXs8XY6hBeSnar8H7dzfQmkxe5fBEOOBMr58dBatszFvjbw4fFcmPa8gYqNu94P1xHcGDHHyiBcwMFuvGAM8ZJ2ocF9kCY6Y3DMd1I2EMrcYkr2hMxQ7YQ9r1Idvbqpmh/iMc5gUxK2DyBVaDneEHN3DpLxZN6oAyndUKCAAuYXB02jj/yOeqOUTYQ/xw8bk560UfxQwDLGoTX32oCK3wclAQnxtliiQ==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by PAWPR10MB7245.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 09:58:11 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 09:58:11 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>, "stondo@gmail.com"
	<stondo@gmail.com>, "Tondo, Stefano" <stefano.tondo.ext@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>, Joshua Watt <jpewhacker@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "marta.rybczynska@syslinbit.com"
	<marta.rybczynska@syslinbit.com>, "Marko, Peter" <Peter.Marko@siemens.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document
 generation
Thread-Topic: [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document
 generation
Thread-Index: AQHcwRl/zTKOOMHWOU2EjFR+QiyMH7XIsb0AgAALSACAAHXCgIAAoVkAgAAlxAA=
Date: Wed, 1 Apr 2026 09:58:10 +0000
Message-ID: <37522fb2c1dcceab49ab917cd0c1f880e5f23618.camel@siemens.com>
References: <20260331141956.608976-1-stondo@gmail.com>
	 <CAJdd5GazcRuxPSdgXEb170f+E5uA2oP=C2eKLqCNnLC8Y_fB6g@mail.gmail.com>
	 <e37fc3654ebe48350a6f35a51792ac1be5d4c307.camel@siemens.com>
	 <9600909.CDJkKcVGEf@brobin-bootlin>
In-Reply-To: <9600909.CDJkKcVGEf@brobin-bootlin>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|PAWPR10MB7245:EE_
x-ms-office365-filtering-correlation-id: 8bde8d8d-5f95-4728-5676-08de8fd52ef0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: 
 heKD4h4c7FeiZPYFLzUWOvo5U3MJNl4yd+2K5FkpokzIB9x1C0QJC2kT25aoC8RHiAySU6LPSqPzzdfmiALkfjf7bqpkAr0yU4fdTaIdL8ZxFHhFpXWx0fx5bzcH1b+7RNHTLnpYsHytdJxtYjxQ90yCzNeVU87ess/JCm+fqE1bCkQqH4oSPEtxtIytvT2vCW6f5xtqsr7aXVQuEwWAqTascGnOfbeHHKQXQ9m3BOwGw6SzZK6rVyyBm+cCXNW7SYehmOX+R2zv+bVRv6iJEwLgY+uTrGliXDOTyBM4zjj2xBzVEt6fYgluPgxodNRmrgz/jQxCL6B/NbFkE+J73nxrC83J5G4hnTsOQ+eg5SXC2UN1zSBZtb75X0U0fkwER3feg+oK3wxLTctxnNRBf3YRzuw+zquHoUjBp8V5y4pu5oe3D2v5w+LKv8+mtlbRMjBN8q86ty30PvbHunUM1B635NggQyPFbtffLvLgUa7Iid0c394k+bnp0jqUcgZAzWaLnWl20XQNo6Qlu8UOV1DGjaJ8mSft8JndQf3hbrEo4ECx0RQk6rJK9DPFeRuxVjWlY5egBEiDQrX9i+RChjgrRGMLcS1dU4kUyqaRmmwWZYK2OEsBO4nbs/gKimYv/LlTFbok/wmQUjJ97ok+4f3LBKZYiEaMMDZLhUtD9me1aNUTpqm9Th7U2sWVpAMjy6BW5W4+UQnDwA7ZX3dyKHfz6upRhsFH0thSUEG3lOlfb1nTYg/r4z2f0Uq7q8Me4BPCSiGXkrn9NxystrJC1nQz7Kv7z910+ShYa+RO2Qs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OVJ0TzZ0RkNkM3ZzR05TeElKUk1kaWNTbitrVWVXQWxDVE1mekphcEQvbEcv?=
 =?utf-8?B?RnpDaGY5aXdyRlBTMnFRSlZBblJaV1lrT3czYnFMWGdqVWtKRHZqNk91dGJY?=
 =?utf-8?B?WnIzRGIwUm9LOG8xYkdPQXFVdHVkYnAyN3B6ZUEvMndXWGFhczY0SFhVYUho?=
 =?utf-8?B?L1U0VmJiR0pQWkpSekNYaEJJUSsxNUVjTzhBVEpjUUFDVzNIWTcyTzFNY0pZ?=
 =?utf-8?B?OHF1aUptNkVDL244ZUdFZXpIQXY0TTRZcnhIT1ZFYTcySTMwbXZycVlIaVFs?=
 =?utf-8?B?L3J1THdVWXBtbmVTcXVNbkRLN3dIdENoRC9MbkZaVktLb28zUFI1bjV3ZGs0?=
 =?utf-8?B?Sk4zSFFSd1ovWGwvOExRZXMyRmxaZyswMFI2ZkdtUUpXbnpDZDh6VnFsWVhD?=
 =?utf-8?B?WmdxRUFjTGsxRzh1L1J6WjRHREFMWlJLK3l1VXFpd0ZrMDk4OHB5bTNpNUZv?=
 =?utf-8?B?aElpL1ltclp2TG5jT1VDbVF1TGFsb1BEQWxqMWZQN0drVEd0ODVsSThLVTho?=
 =?utf-8?B?Vm9VcGU5dEt2YmVTRWFSRnZxU0oyWDlxMWVpcjhXOFFDTTRFRVhFeEV6WGxx?=
 =?utf-8?B?ZlJoK2l0UnYwSjhiSjRlQkludWNRTHM2L3ZIS3FZckhET0JQVHllRUIwRDRQ?=
 =?utf-8?B?dXFiaENLUHpxM0taVVJwZFMxdHVYR2graXhtQjh5UzVpN2ZNVlhVcDQya3Bi?=
 =?utf-8?B?UVptc1Z3a1NHMUxvdGttSEFWZEVTYy9SSnlzQ0I3V3dGbjhKZW9pRTZVOHh2?=
 =?utf-8?B?UTJiN3NzaUhEZ1Qyb21heGZBOWRiV1FhQkl5Q3BCVWFJd3ZWbFhzVERPdGE5?=
 =?utf-8?B?YXozWk1yVnpoRngzL1pCMm9FZURBK2liUzQvNmtXc0VMSnpiL0FUNlFldTdV?=
 =?utf-8?B?S1ZwY3hWWWszVTFCSi81a0k0NWpweFZ0QWUyMTBoTXEyZTFYck9QcW4yZkRo?=
 =?utf-8?B?a3NUNFAxVGZtVG14VWlpd0J1SlRHekI4RUE5eWNpNzNFYXJEYzhWaGk3UUMw?=
 =?utf-8?B?bGN6OUFpQjRNMHMvL2tiOUpXOU00cnMrUnFpU2k5QUo2cDBqL29zQmEvN0pO?=
 =?utf-8?B?ZVJJRnNYTHE0ekxVamVia1lyU3hLNG9zYVg1aUIyV3VoTkdyQTJIWkltOVRB?=
 =?utf-8?B?VXR4d0RqUFJoYmVEWk9SL0RnaSs1MUNtamRkWHo3dGc4YzN2TG04RkhGTjd6?=
 =?utf-8?B?Q0NPdFlvS1NiV0V2b2RQR3FtNzBqb2RDbjliY25Pa29kY202UVkrTGVqNHZI?=
 =?utf-8?B?QWF0UVg5R1pmbDRmRlQwVUw5SjVFeHRZc0VGTjFuMWtka3hSNlI5UVI5OEJi?=
 =?utf-8?B?bVlIYlArR21XdSt6NmdkeDhxYkZjb1MyTTQvTVJxKzBVM1pMcUFubTRieGZh?=
 =?utf-8?B?UlphS1NSRnk5dkp6MDdmcXo0VVRLcEN5RnNQUHRSRWo5ZVRZQ0htNm1PRW9K?=
 =?utf-8?B?dTEvOXg4Qmp1SEg4Tkl0dVhCS0doKy9rU3MxRXFiUFg5djZQdy9qWkpjUTF6?=
 =?utf-8?B?MlNnSCs1MEhLODd2NnR0dEluOVBEOGowOTVhMWRXeUVNRDVnYnNza3JyNW9J?=
 =?utf-8?B?MmVIVUdOSExxbWRmYUNUWW02NHh5c0YzZ1o5Q2JybXUzbzIzcUVSUk9iVHBH?=
 =?utf-8?B?dG9OTTFreTN6aTFRSitFQm13OFE1WG5lL2V4S0RoR1EvcW1DVThMdzNwenBq?=
 =?utf-8?B?OTIvV3ljU1FrRDkyNXc3MHV0d0JHNTc5NldtaTVSdUU5eG9IZWdRZURzRGtW?=
 =?utf-8?B?Wk1LNG1lbC9hSENMWnpqQ2Q4SHFIdEhZaHhjQUsrUVh5ZzdGSjZjK2pZYitn?=
 =?utf-8?B?RHk5YkRlQzU2cDJUZ0l6aTFYMThocUJHdTlDd3FkMFR5bXpteWVkOFQzUU5k?=
 =?utf-8?B?aE53ay92czBuWHRJQlIxNTJnYmdySjVieFdIK3h6elhmWVdKUjh6anhHeWlQ?=
 =?utf-8?B?bzR5Rm80SW9MSGQ1cnpjWnNvNDlNSk1ISTgyTlQwc2lnN3dGSmhJNWxLdUJF?=
 =?utf-8?B?TGNkbWVsMk5OaTJMTllucDhhcGVlWXcwOG5GMnd4RlpsNkxJbW1OOG9pbWtj?=
 =?utf-8?B?K2pUQ2VtTjlmMml0UXFWSlhkVUYyN1hDOWxnWUpJdEozMlR1Uk1Db2RHMGF2?=
 =?utf-8?B?UktKZ1Y3ZDEzdnVMVTcvNzZmUmlvSXQ4VG9aVjhaalVQaHFJaUNoWTRTK3VF?=
 =?utf-8?B?R1BSVVBjZG5jZThQbUg3MmZYc0JwUFFxRWYyK3NQTldPSFA1UGpVNzM5TktV?=
 =?utf-8?B?MlNCRjRwT3ZUeS93YXRjZ01IL1NVYlVTaWcrTGxzOXNLdm1EQTF0T1NzRXFZ?=
 =?utf-8?B?T3ZUSk9qWitxQkYycUFaVnZlWmdvVEx5WTFzblNnSndoVnB5ZHRodz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A0B2A24F2858242B924B1F0E8EA071B@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bde8d8d-5f95-4728-5676-08de8fd52ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 09:58:10.7324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5eU+0CLGarNodL2hm1caEhU7+rU08exXJZAw+jzQfBBFIS0uXNKzBwfkvXXu25X491dPYnCmMjl5K5wPRfCVJfqh8lxjc2vjQVz/v1/GXJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 09:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234334

T24gV2VkLCAyMDI2LTA0LTAxIGF0IDA5OjQzICswMjAwLCBCZW5qYW1pbiBSb2JpbiB3cm90ZToK
PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGJlbmphbWluLnJvYmluQGJvb3RsaW4u
Y29tLiBMZWFybiB3aHkKPiB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFy
bkFib3V0U2VuZGVySWRlbnRpZmljYXRpb27CoF0KPiAKPiBIZWxsbywKPiAKPiBPbiBXZWRuZXNk
YXksIEFwcmlsIDEsIDIwMjYgYXQgMTI6MDXigK9BTSwgRnJlaWhvZmVyLCBBZHJpYW4gd3JvdGU6
Cj4gPiBJIGFncmVlIHRoYXQgZ2VuZXJhdGluZyB0aGUgU0JPTSBhbmQgdGhlbiBwcm9jZXNzaW5n
IGl0IHdpdGgKPiA+IGluZGVwZW5kZW50LCBzcGVjaWFsaXplZCB0b29scyBpcyB0aGUgcmlnaHQg
YXBwcm9hY2gg4oCUIGFuZCBJCj4gPiBiZWxpZXZlCj4gPiB0aGF0IHdhcyBhbHNvIHdoYXQgSSBw
cm9wb3NlZCwgYmFzZWQgb24gUm9zcydzIHBvc3QgaW4gdGhhdCBlYXJsaWVyCj4gPiBkaXNjdXNz
aW9uLgo+ID4gCj4gPiBUYWtpbmcgdGhpcyBmdXJ0aGVyLCB0aG91Z2gsIHJhaXNlcyBhbiBpbnRl
cmVzdGluZyBxdWVzdGlvbjogaG93Cj4gPiBjb3VsZAo+ID4gQ1ZFcyBkaXNjb3ZlcmVkIGFmdGVy
IHRoZSBTQk9NL1ZFWCB3YXMgYnVpbHQgd2l0aCBCaXRiYWtlIGJlCj4gPiBoYW5kbGVkIGluCj4g
PiBhIG1vcmUgYXV0b21hdGVkIHdheT8KPiAKPiBJ4oCZbSBub3Qgc3VyZSBJIGZ1bGx5IHVuZGVy
c3RhbmQgdGhlIHF1ZXN0aW9uLiBUaGlzIGlzIGV4YWN0bHkgdGhlCj4gcHVycG9zZQo+IG9mIGBz
Ym9tLWN2ZS1jaGVja2AuIEl0IGNhbiBiZSBleGVjdXRlZCBhdXRvbWF0aWNhbGx5IGZyb20gWW9j
dG8KPiBwb3N0LWJ1aWxkLCBvciBhdCBhbnkgdGltZSBsYXRlciBvdXRzaWRlIG9mIFlvY3RvLgoK
SSB3YXMgbm90IGF3YXJlIHRoYXQgc2JvbS1jdmUtY2hlY2sgY2FuIGV4cG9ydCB0aGUgQ1ZFIHN0
YXR1cyBhcwpPcGVuVkVYLiBJZiBzbywgdGhpcyBxdWVzdGlvbiBpcyBvYnNvbGV0ZSBhbmQgc2Jv
bS1jdmUtY2hlY2sgYWxyZWFkeQpkb2VzIHdoYXQgSSdtIHByb3Bvc2luZy4gOi0pCgo+IAo+ID4g
QSB0b29sIHdpdGggYWNjZXNzIHRvIHRoZSBsYXRlc3QgQ1ZFIGRhdGFiYXNlLCBhbiBYTCBTQk9N
LCBhbmQgdGhlCj4gPiBjb3JyZXNwb25kaW5nIHNvdXJjZSBhbmQgZGVidWcgcGFja2FnZXMgY291
bGQgbGlrZWx5IG1hcmsgbWFueSBDVkVzCj4gPiBhcwo+ID4gbm90X2FmZmVjdGVkIGF1dG9tYXRp
Y2FsbHkg4oCUIGZvciBpbnN0YW5jZSwgYmVjYXVzZSBjZXJ0YWluIHNvdXJjZQo+ID4gZmlsZXMK
PiA+IGFyZSBub3QgY29tcGlsZWQsIG9yIGEgcmVsZXZhbnQgI2lmZGVmIGlzIGRpc2FibGVkLgo+
IAo+IGBzYm9tLWN2ZS1jaGVja2AgaXMgZGVzaWduZWQgdG8gZG8gcHJlY2lzZWx5IHRoaXMsIG9y
IGF0IGxlYXN0IHRoYXQKPiBpcwo+IHRoZSBnb2FsLiBIb3dldmVyLCBzdXBwb3J0aW5nIGAjaWZk
ZWZgIGlzIG5vdCBwbGFubmVkIGluIHRoZSBzaG9ydAo+IHRlcm07Cj4gZmlsdGVyaW5nIGlzIGN1
cnJlbnRseSBkb25lIGJ5IGZpbGVuYW1lLgo+IFVuZm9ydHVuYXRlbHksIG5vdCBtYW55IENWRSBl
bnRyaWVzIGNvbnRhaW4gdGhlIGluZm9ybWF0aW9uIG5lZWRlZCB0bwo+IGF1dG9tYXRpY2FsbHkg
bWFyayB0aGVtIGFzIG5vdCBhZmZlY3RlZC4gT25seSB0aGUga2VybmVsIHR5cGljYWxseQo+IGhh
cwo+IHRoaXMgaW5mb3JtYXRpb24gcHJvcGVybHkgZmlsbGVkIGluLgoKVGhhdCBzb3VuZHMgYWxy
ZWFkeSB2ZXJ5IGdvb2QuIFRoZSBrZXJuZWwgaXMgYnkgZmFyIHRoZSBtb3N0IHJlbGV2YW50CnBh
cnQgd2hpY2ggc2hvdWxkIGJlIHN1cHBvcnRlZCBieSB0aGlzIGZlYXR1cmUuCkxldCdzIGhvcGUg
dGhhdCBvdGhlciBwcm9qZWN0cyBzdGFydCBhZGRpbmcgdGhlIHNvdXJjZSBsaW5lcyB0byB0aGVp
cgpDVkVzIGluIHRoZSBmdXR1cmUuIFRoZW4gaXQgd2lsbCBiZWNvbWUgZXZlbiBtb3JlIHZhbHVh
YmxlLgoKPiAKPiA+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZXh0ZW5kIHNib20tY3ZlLWNoZWNr
IHRvIHN1cHBvcnQgZXhwb3J0aW5nCj4gPiBhbgo+ID4gT3BlblZFWCBkb2N1bWVudCBjb3Zlcmlu
ZyBhbGwgQ1ZFcyBhdCB0aGUgdGltZSBvZiBleGVjdXRpb24/IFN1Y2ggYQo+ID4gdG9vbCB3b3Vs
ZCBuZWVkIHRvOgo+ID4gCj4gPiDCoCogRG93bmxvYWQgdGhlIENWRSBkYXRhYmFzZQo+ID4gwqAq
IEV4dHJhY3Qgc3RhdGljIENWRSBzdGF0dXMgaW5mb3JtYXRpb24gZnJvbSB0aGUgU1BEWCBkb2N1
bWVudAo+ID4gwqAqIEF0dGVtcHQgdG8gYXV0b21hdGljYWxseSBldmFsdWF0ZSB0aGUgc3RhdHVz
IG9mIENWRXMgZm91bmQgaW4KPiA+IHRoZQo+ID4gwqDCoCBkYXRhYmFzZSBidXQgbm90IG1lbnRp
b25lZCBpbiB0aGUgc3RhdGljIFNQRFgKPiAKPiBJ4oCZbSBub3Qgc3VyZSBJIGZvbGxvdyB3aGF0
IHlvdSBtZWFuLCB0aGlzIGlzIGV4YWN0bHkgd2hhdAo+IGBzYm9tLWN2ZS1jaGVja2AgaXMgYWxy
ZWFkeSB0cnlpbmcgdG8gZG8uIEl0IGNhbiBnZW5lcmF0ZSBPcGVuVkVYCj4gZmlsZXMuCj4gUGVy
aGFwcyBub3QgZXZlcnl0aGluZyBpcyBwZXJmZWN0IHlldCAoZmFyIGZyb20gaXQpLCBhbmQgc29t
ZSBwYXJ0cwo+IG1heQo+IHN0aWxsIG5lZWQgaW1wcm92ZW1lbnQuCgpIYXZpbmcgYW4gaW5pdGlh
bCB2ZXJzaW9uIHdoaWNoIGRlZmluZXMgdGhpcyBuZXcgYXJjaGl0ZWN0dXJlIHdvdWxkCmFscmVh
ZHkgYmUgYSB2ZXJ5IGJpZyBzdGVwISBUaGFuayB5b3UgZm9yIGRyaXZpbmcgdGhpcy4KCj4gCj4g
PiBUaGlzIGVzc2VudGlhbGx5IGRlc2NyaWJlcyBtZXJnaW5nIEpvc2h1YSdzIHRvb2wgd2l0aCBC
ZW5qYW1pbidzCj4gPiBzYm9tLQo+ID4gY3ZlLWNoZWNrIGludG8gYSB1bmlmaWVkIHRvb2wgdGhh
dCBjYW4gaW5nZXN0IFNQRFggZGF0YSwgTklTVAo+ID4gaW5mb3JtYXRpb24sIHNvdXJjZSBmaWxl
cywgYW5kIG1vcmUg4oCUIGFuZCBwcm9kdWNlIHZhcmlvdXMgb3V0cHV0cwo+ID4gc3VjaAo+ID4g
YXMgQ1ZFIGNoZWNrIGdyYXBocywgc3VtbWFyeSB0YWJsZXMsIGFuZCBWRVggZG9jdW1lbnRzIGlu
IG11bHRpcGxlCj4gPiB2YXJpYW50cy4KPiAKPiBgc2JvbS1jdmUtY2hlY2tgIGNhbiBnZW5lcmF0
ZSBtdWx0aXBsZSBleHBvcnQgZm9ybWF0cyBhbmQgY2FuIGJlCj4gZXh0ZW5kZWQKPiB0byBzdXBw
b3J0IGFkZGl0aW9uYWwgZm9ybWF0cy4KClRoYXQgbGVhZHMgdGhlbiB0byB0aGUgcXVlc3Rpb24g
YWJvdXQgdGhlIHB1cnBvc2Ugb2YgdGhlIHRvb2wgZnJvbQpKb3NodWEuIElmIEkgdW5kZXJzdGFu
ZCBjb3JyZWN0bHkgaXQgZG9lcyBzb21ldGhpbmcgbGlrZSBlLmcuCiAgc2JvbS1jdmUtY2hlY2sg
LS1kby1ub3QtdXNlLWN2ZS1kYi1qdXN0LWZpbHRlci1zYm9tCmNvdWxkIGRvLCByaWdodD8gVGhl
IGNvZGUgdXNlZCBmb3IgdGhhdCB3b3VsZCBwcm9iYWJseSBhbHJlYWR5IGJlIGluCnRoZSBzYm9t
LWN2ZS1jaGVjayBhbmQgcHJvYmFibHkgaGF2ZSA5OSUgb3ZlcmxhcCB3aXRoIHRoZSBjb2RlIGZy
b20KSm9zaHVhJ3MgdG9vbC4KCkknbSBqdXN0IGd1ZXNzaW5nIGFuZCB0cnlpbmcgdG8gdW5kZXJz
dGFuZCB3aGVyZSB3ZSBjb3VsZCBoZWxwLgoKVGhhbmsgeW91LApBZHJpYW4KCj4gCj4gPiBJdCdz
IGFsc28gd29ydGggYXNraW5nIGhvdyBZb2N0by1zcGVjaWZpYyBzdWNoIGEgdG9vbCB3b3VsZAo+
ID4gYWN0dWFsbHkKPiA+IG5lZWQgdG8gYmUuIEl0IGNvdWxkIHBvdGVudGlhbGx5IGJlIGdlbmVy
aWMgZW5vdWdoIHRvIHN1cHBvcnQKPiA+IHZhcmlvdXMKPiA+IExpbnV4IGRpc3RyaWJ1dGlvbnMg
4oCUIHdoaWNoIGxlYWRzIHRvIHRoZSBxdWVzdGlvbjogZG9lcyBzb21ldGhpbmcKPiA+IGxpa2UK
PiA+IHRoaXMgYWxyZWFkeSBleGlzdD8KPiAKPiBUaGUgZ29hbCBvZiBgc2JvbS1jdmUtY2hlY2tg
IGlzIG5vdCB0byBiZSB0aWVkIHRvIFlvY3RvLiBBcyBsb25nIGFzCj4geW91Cj4gY2FuIHByb3Zp
ZGUgYW4gU0JPTSBpbiBhIHN1cHBvcnRlZCBmb3JtYXQsIGBzYm9tLWN2ZS1jaGVja2Agc2hvdWxk
Cj4gd29yay4KPiBUaGF0IHNhaWQsIHRoZXJlIGlzIHN0aWxsIGEgbG90IG9mIGRldmVsb3BtZW50
IG5lZWRlZCB0byBmdWxseQo+IGFjaGlldmUKPiB0aGlzIGdvYWwuCj4gCj4gPiAKPiA+IFJlZ2Fy
ZHMsCj4gPiBBZHJpYW4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS0KPiBCZW5qYW1pbiBSb2Jpbiwg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiAK

