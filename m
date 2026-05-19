Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056AFCD4F5B
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:34:45 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16496.1779176063534381969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=WeCpGBpz;
 spf=pass (domain: siemens.com, ip: 52.101.69.38, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVHuMbKTkR3ya4Ia4jqSwCIW6+/qpM285/rHzStHUegDHQcQYer4HM+3Ff/wsS8UkHtxedwsdz1kSwsb+Qasl9wKFdlqyCrWQfv1i6ZXDx4QuO90/A/8zXJKl+OY8PGcWhrPthUJOfnDOC4E87ExSMVaDa0PawiYOnjOMwgNV1OL67g+jqEfV9Vk+I2hDGJ2352OZN4QdJE5dZIdlkXBgwJWOdKtDqjZvKdgxGN4ysoUzpmAsM3Mlsc3NzQhalYYo5XmI27OVtuX8HlEYDzwfHEv9XR3e3dX/2/y57ec7PgEFkLraP5jItpOCN0wyNePXuahg/GuYBjGFEcSBcb2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj2BIdZMzwrss85njXZJJPSgwml30ek5G8PjTOMiYaw=;
 b=sctlWBXkAF4zGxvgirvr533pWNrANYc4D26HIRHzYoULmsgliJBYKCWoc07QuvIR2X7xbh4ZwNPL7dXfhV5NruEkUVBjauRHuJgfOkovmHNxlOO1aBK8S7vXxamriUyXb5GEX66c57BcBVr5+/FW7309xWpVt0ODDUii4LXspxjbwIaI1GqaWnSDbpodbCPNr1SUJI79HTisiZ/rLUp/+1Y2DpBqdniFwh9NZsx0P+YbLibISW/r+Aiydb0KT64u3N6h7BfanOmpRQZbxMoCTxp90ByL/qT1N4nJ3A0Xf6QCF2c9BSse2sUCCbEKOLejam7PyPHwp2wvESpdSUYJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj2BIdZMzwrss85njXZJJPSgwml30ek5G8PjTOMiYaw=;
 b=WeCpGBpzDf9LGT25S+6HNtIugLxmmB/+fB41PtgB6WmnOtgrByyEUl8fTG6/bt99P+IIvM7hcLCczVIDzamc0kJuC7Z3WSG7NJAIDTsVaStopBqXIU+GEpu/B+wlTzElIXMvKDxlfK/SSfum6d1GHtqWabfgPMM+HoZWAy3A1LIuVLsbpteKsDWyX1fe5iB1oeb4pAlOXWUGrwSEJBnColD4ehyrz6+XHArnI/+jFaF9dFcTRnJ1xpd3Lu6EkgZM/ae6qeBV2KbRcgodfOSDyU4lmbI5nwbADZiVpM+VTdCeYxxneNmcLhfUQbNxA+vM0Dc/EUaF9sJMCrzXQBw8Iw==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by GV2PR10MB6139.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 07:34:15 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 07:34:15 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "jamin_lin@aspeedtech.com" <jamin_lin@aspeedtech.com>, "paul@pbarker.dev"
	<paul@pbarker.dev>
CC: OE-core <openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>, Vince Chang <vince_chang@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
Thread-Topic: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
Thread-Index: AQHc5E8yVorB/k0zaUColFebuiYitbYUEgWAgABDMwCAADlUAIAABB+wgABofgA=
Date: Tue, 19 May 2026 07:34:15 +0000
Message-ID: <ee619ab87ee5000ebc6aa4ffbd66a46f406d5c58.camel@siemens.com>
References: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
	 <f8757960b4f15bf66d30fad45ab7b0a1512b036a.camel@pbarker.dev>
	 <CAB3asfiuneQrWbw28UeBf_+63xyuGdM0F6GdKE6wa+sSPoKqRg@mail.gmail.com>
	 <TYPPR06MB8206B723A776C8C292BE4876FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
	 <TYPPR06MB82067560309D2AE88ED0DD62FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
In-Reply-To: 
 <TYPPR06MB82067560309D2AE88ED0DD62FC002@TYPPR06MB8206.apcprd06.prod.outlook.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|GV2PR10MB6139:EE_
x-ms-office365-filtering-correlation-id: 2ed15927-31fa-496b-3aed-08deb579074d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|56012099003|18002099003|22082099003|4143699003|38070700021|55112099003|11063799003;
x-microsoft-antispam-message-info: 
 U2cqGoJQuHn3ceyD8JWD40CEUq4q6PQGTA4icN2gdrjaLQ/kRXxJ0yyhTEaSYrQY97A+VD/bkL2BCMCbdtDQM/j16304qtxNPp5zDKwRaV8hTCrGTp4M3ynY+dsdWceuMiqBJJwRMonbeIdBr8AdQ+uCrxWeGpI6B6CQj7T34OHxIgnyYby39oLXiCzMgJNTMg6s0ElPNkY1zgsL9JyJe5ZdD5IdwF4vX3tefNw4tQb6lynY8+Sk/ydujc6RCHc3W/emytA9sEM3w3E9jA9Nb0pVCI8ABqY33r4dEpAPdHTIZBKh0GEtzbsIcdLJ7iBZqwoOJRDD0yKErBnfdPDt59oQKdTR//NHsHOH/0saFhw0d1zYKqz8uaPsFoKACvX1v7X+IUOQP36kP08jpBgaRaBGK8c7hs5TyytpC6SiCQmpUhWPO/pwPgS8eUDg/6+AmMUEdQ7FKns0op1Zpp89lQcMy7HYKzUm09nKudd35u1ffRPyFUcLFj0nJT3K51/f2RqtMvhHahQoE8aVODkeRxqeRsYrlsXeDIe9BLFfK1q36RRMs1pzeuRDvmgX5lQ7KNBXT6EhMop0prd/3x9NuRgzgNAT6zhcyLldGRQYxryLqlYCl5BKFSOTcD71GGVZ6xrsh2BBX3+4XJGSUDzcZ4MxwGIUcwG6UtV9xDFJJKlHAWVRmOku2NVuHEpMV4SxQ+c9Erg9/YJeLGr0tpgTXg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(56012099003)(18002099003)(22082099003)(4143699003)(38070700021)(55112099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dWVpM3ZVWUVOSlRTT1pySC9uTGlvSHhqRVM5ejBYSGlnNHlhVUk4T2JmQ2RH?=
 =?utf-8?B?OVQwRmNGL05oRmZqUk5pMXE0NDg2QjlqRHBoN3Y3S3BvcDBqU2c0RjVUSS9a?=
 =?utf-8?B?aENqOHZIRlZBRDkvQm1SaThtZHlQQm9SUUdZWWFGSHE1MThhcjgrMjc3LzBX?=
 =?utf-8?B?WVhRMTdOdVltSGo0VGlrbzZVM1JiU09tTFcrZHlHWVEvWU5oY0E4WkluNUZh?=
 =?utf-8?B?bUcxY3h5bXFsMUVmNVFlNTlqWkZ4b1UxWi9MbEwyRWpKMHV2VFZ2T3BwT0lv?=
 =?utf-8?B?a3llQU9PeTBDRjdRUXJlNnZjbHYvZTZiUTFmcWw0VHdBRHpjMFlWQkJNa09G?=
 =?utf-8?B?aUxuNCt6OHZObGZJeFZ4Njg5T21WSTB6ak1OUW9vaDJPVnBRS2drRU1wT1I2?=
 =?utf-8?B?bGpKdmZVQXpyaVcraWlJTTRrNVp5b0NTMnVVMVFsTG1nWEZHVWlaSURqdkFt?=
 =?utf-8?B?NFFuSng1MVFNMVVUbjJPVElpcHhhYlJGdjRuZTdULzVDd2FCdmRObWVXamNO?=
 =?utf-8?B?RDIxWlhlM2NLaTMwZjVQU011ZVI0Z1FKSGQxMlJQRVYxU1RqYjVZODBrUU40?=
 =?utf-8?B?a0hHeXdrSGlOWU52c3NaRGRCaUNMK1Z0cWo2WU0vWHExc3NLeEZvM1d3c3pW?=
 =?utf-8?B?a05hLzdSL3JuazRoam9kRVI2YjVScVdoYS81VWFDNUdzMDhad0Njek5ER1hW?=
 =?utf-8?B?aXl3TTh6di9VRVVESmRkNDliRHlBT2dlS0ZyU3VaNjV1eERKaWNNb3lzYWNr?=
 =?utf-8?B?ZnozTUZJa05mZk04cXk3azJmcEtrekk3M0NtYzRWQ0FRVGZkaXhubnc2YWZq?=
 =?utf-8?B?aGs2SlM0a0tYNGgwOEJuVUs3YTVnNzlLTkhXVTFWcG1MSEFXcUdsZjY2TE9J?=
 =?utf-8?B?eWM5VUM3TWFudWIrNnJZY09JMU8zeVpDMG85Y3NJT2FJMVdNays3ZlZrd2FD?=
 =?utf-8?B?d0lmbk55NXVJekFRWktYZ2kyaStuSTlOS1N0azlZR2M1c3ZDSnAya3NwZktq?=
 =?utf-8?B?SzJxWFV1THA3dExWMTF6ckJCSzVZUXgrM0FyY1lJUEN3TkpPeTAyVVVTcjc2?=
 =?utf-8?B?MVBrMGE1ODNCQWxtWTY1aDk3NEx0MVJvVG9HUVEwZ010MC9PUHBkZXorQ1dT?=
 =?utf-8?B?ak9LVlVZdzFEdVRFRzF4cEV5d21kZlNLVGpvUFY1Zkk3a3J2YzRCZFlSbjlW?=
 =?utf-8?B?L2RHWjRCQ25mWmtZK0tQYy9QdEdkbkhaY28xcFBvWXUvL1RVUlBaTmZ3UVF1?=
 =?utf-8?B?OXNPSmVtTmRhQzg1UDF5clE2dnVFTHFaYzNWM0RTUHgzQjB2ZDcxaTh6SVdM?=
 =?utf-8?B?TFUyeGxKbC9qcWxDK0FxaWlvajRPZ21mV2hxMmNXTU5LWUNINlI4dG0vdGlZ?=
 =?utf-8?B?ZFl1VGkxNldDMGpMdVBVZ0xEb0U4cG1HZ0xOM1RXaldSWGwwWEtDVTE1YzJT?=
 =?utf-8?B?UHA4Q05JYWFtZFg3alROWjFVSEkwREJoZFZHQjVOaGxpRm96eGhuVWtrNW83?=
 =?utf-8?B?Qkx0ek04VW5nMWVZcmlmOEN3NmJxV3RuMzJ1bTdzSXljRXhlUjJTdnJQczBk?=
 =?utf-8?B?THVPTWRRWUtjMkZsU28yUGJhTEhvYjBBT1h3NnFLZzc5SkhjSmsxQVRna3Jk?=
 =?utf-8?B?RG1zblNpdkxKUlRkb1Q3RDJqaWd4NDRSa1BNdGZxKzJ0ZlJycDNPOXRSc0o4?=
 =?utf-8?B?SGplNE5EeC8rU3RYUTNYZ0ZJVzR6N2ZveXpJRnBnMmRaS1g1aXB3QXpwMHd2?=
 =?utf-8?B?Y2t0WFBLWG9MUWIzNU5oWVYzdUV4UGZMV1pRVEhFQ3M3SFh2S09DbkJ2bkti?=
 =?utf-8?B?VjFDeWxXc2xuekVudklGR1RyYm1SOEczL1FXNkhtSmdtSk5kNGpURFV0QXJN?=
 =?utf-8?B?dTBGb01iZXE0YzJKSUE1bmN0aVFTQjFCeDl3MEQwWDFEMlJxOGZnNUprR0pt?=
 =?utf-8?B?NHlSckluV2JVN2wrbzZnQjBnU2cvb2tSOVFiSUwzdHlIMHA0dDYyeUhveW8y?=
 =?utf-8?B?OXdSaExjekhLTkRpRzMrVENJdmpRRnpiUEZGbTQ4KzBkV1kxRE1PTDE2c2w4?=
 =?utf-8?B?cXNwSHVwMkVhZU80dXovK3J3bGFnVWp6bWRTTmF6Vm04cnpLWVV3N0l0eVBV?=
 =?utf-8?B?dHd6QW5YNlJMRnRQTnpabVJNdzFyWStyeEdpUDJrdHFLVHRWMURXK0FVTm51?=
 =?utf-8?B?OXlSbmFMT3hndE5HUUxaMTBRYlVPZWJKaGlpUEhaZWVhaU5DN3FvUS8wMmJB?=
 =?utf-8?B?TCtBaXVvQ01QN1J2dkhtcWxCN3Zjc2J5WTFJM2Zqck53bWsxVC9nWEM1L3dE?=
 =?utf-8?B?WURuS3RPMWtSSkV1TmZyZFBKSUVwNEwweTEzWHdCN3NFVnlTOHdaZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1344558969C31C41A020FE48B5F3D939@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed15927-31fa-496b-3aed-08deb579074d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 07:34:15.0841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BQFC6/sotpW1It7gPqWpS3aapHF9F1K1sdj940K9CqAyJFSzbVoOPlJeZcHkSbZ08h0roVOpWYHV5BERV5N5RG5RXthS/Ti6xjcazv6lSvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237289

SGkgSmFtaW4sIGhpIFBhdWwKCkFmdGVyIGxvb2tpbmcgaW50byB0aGUgY29kZSBvZiBta2ltYWdl
LCBJIGFncmVlIHdpdGggdGhlIHBhdGNoLiBJdCBpcwpjb3JyZWN0IHRoYXQgcnNhLXNpZ24uYyBu
ZWVkcyBrZXkgKyBjcnQgZmlsZXMgYnV0IGVjZHNhLWxpYmNyeXB0by5jCnVzZXMgYSBwZW0gZmls
ZS4KCk15IGNvbmNsdXNpb24gaXM6IFRoZSBwYXRjaCBjYW4gYmUgbWVyZ2VkLgoKVGhhbmsgeW91
LgoKUmVnYXJkcywKQWRyaWFuCgoKT24gVHVlLCAyMDI2LTA1LTE5IGF0IDAxOjIzICswMDAwLCBK
YW1pbiBMaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKd3JvdGU6Cj4gCj4gRnJvbTogSmFt
aW4gTGluCj4gU2VudDogVHVlc2RheSwgTWF5IDE5LCAyMDI2IDk6MTcgQU0KPiBUbzogJ0Fkcmlh
biBGcmVpaG9mZXInIDxhZHJpYW4uZnJlaWhvZmVyQGdtYWlsLmNvbT4KPiBDYzogT0UtY29yZSA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFRyb3kgTGVlCj4gPHRy
b3lfbGVlQGFzcGVlZHRlY2guY29tPjsgVmluY2UgQ2hhbmcgPHZpbmNlX2NoYW5nQGFzcGVlZHRl
Y2guY29tPjsKPiBwYXVsQHBiYXJrZXIuZGV2Cj4gU3ViamVjdDogUkU6IFtPRS1jb3JlXSBbUEFU
Q0ggdjFdIGtlcm5lbC1maXQtaW1hZ2U6IENoZWNrIHNpZ25pbmcga2V5Cj4gZmlsZXMgYmFzZWQg
b24gYWxnb3JpdGhtCj4gwqAKPiBIaSBBZHJpYW4sIFBhdWwKPiDCoAo+IFRoYW5rcyBmb3IgdGhl
IHJldmlldyBhbmQgc3VnZ2VzdGlvbnMuCj4gwqAKPiBUaGUgaGFuZGxpbmcgb2YgUlNBIGFuZCBF
Q0RTQSBrZXlzIGluIG1raW1hZ2UgaXMgZGlmZmVyZW50Lgo+IMKgCj4gRm9yIEVDRFNBLCBta2lt
YWdlIG9ubHkgdXNlcyB0aGUgLnBlbSBmaWxlIGZvcm1hdCBhcyB0aGUgcHJpdmF0ZSBrZXkKPiBm
b3Igc2lnbmluZyB0aGUgaW1hZ2UuCj4gSXQgZG9lcyBub3QgdXNlIHNlcGFyYXRlIC5rZXkgYW5k
IC5jcnQgZmlsZXMuIEhvd2V2ZXIsIE9FL2ZpdGltYWdlLnB5Cj4gY3VycmVudGx5IHJlcXVpcmVz
IHVzZXJzIHRvIHByb3ZpZGUgYm90aCAua2V5IGFuZCAuY3J0IGZpbGVzLgo+IMKgCj4gQXMgYSBy
ZXN1bHQsIHdoZW4gdXNlcnMgd2FudCB0byB1c2UgdGhlIEVDRFNBIGFsZ29yaXRobSwgdGhleSBh
cmUKPiByZXF1aXJlZCB0byBwcmVwYXJlIC5wZW0sIC5rZXksIGFuZCAuY3J0IGZpbGVzLCBldmVu
IHRob3VnaCBvbmx5IHRoZQo+IC5wZW0gZmlsZSBpcyBhY3R1YWxseSB1c2VkIGJ5IG1raW1hZ2Uu
Cj4gVGhlIC5rZXkgYW5kIC5jcnQgZmlsZXMgYXJlIG9ubHkgbmVlZGVkIHRvIHNhdGlzZnkgdGhl
IE9FL2ZpdGltYWdlLnB5Cj4gcmVxdWlyZW1lbnRzLgo+IMKgCj4gUGxlYXNlIGFsc28gcmVmZXIg
dG8gdGhlIEVDRFNBIGltcGxlbWVudGF0aW9uIGluIFUtQm9vdDoKPiBodHRwczovL2dpdGh1Yi5j
b20vdS1ib290L3UtYm9vdC9ibG9iL21hc3Rlci9saWIvZWNkc2EvZWNkc2EtbGliY3J5cHRvLmMK
PiDCoAo+IElmIHlvdSBiZWxpZXZlIHRoYXQgdXNlcnMgc2hvdWxkIHN0aWxsIGJlIHJlcXVpcmVk
IHRvIHByb3ZpZGUgLmtleQo+IGFuZCAuY3J0IGZpbGVzIGluIE9FL2ZpdGltYWdlLCB0aGVuIHRo
aXMgcGF0Y2ggY2FuIGJlIGRyb3BwZWQuCj4gwqAKPiBUaGFua3MsCj4gSmFtaW4KPiAKPiA+IAo+
ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMyMzcyNjUp
Ogo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
bWVzc2FnZS8yMzcyNjUKPiA+IE11dGUgVGhpcyBUb3BpYzoKPiA+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC8xMTkzMjcxNTIvMzYxNjg1OAo+ID4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiA+IFVuc3Vic2NyaWJl
Ogo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
dW5zdWLCoFsKPiA+IGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb21dCj4gPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQo+ID4gCg==

