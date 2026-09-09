Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA665C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 14:32:24 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13640.1788964336858484113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 07:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tiZrHBDX;
 spf=pass (domain: siemens.com, ip: 52.101.84.23, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvMPjgI0Baceh5lDUi5wsc/mtp22oVXPpKZJbEBrU1JU+IvwXGShku2i68K+VFbNS8BcLX1vaPAVaHpbxq7CkmKgI0gGxYPwv68WU1zJpEdCDrooSDWR0SI4b1ka/tuh6tXySHKXBRDkKplK/bDui77ZaHGlOmfk7vENjqIzKOxJfoyXMPVIoFb6ggUitsQtH6w3lquE9UCQbNpZk59uGc29PwO0T1ZWU8Fk9CsCGzgAJszYzVnICaYHnSS+9go7iRT2Bvy3qLgrSa05q4Z12XCFyGcegfUrprV48gg/wQQaYelX8rtKCtNpKu76Yu7yX71YLajEGgv+v7qQDFGxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to01r56M+jklcnbj75KVFaJGJJubvXSyjZeh7vzRVlA=;
 b=v1bQj8X5P/IyQvayjmopl+cMdjfX5mIUAnElojh3YKUYmS6tkGwzlt78qhndET0/Be9pNXUHXkuH+J4sOfJ49A2gRTypQNyxkgMGHv66zrrQv1xZFt8xUy2tUPida9gX5gSqelkcN8ykEWKv5TSTBDAtHPbqBs2lfUCB4RBOFqNuHI09Xp2sECvv4JeKH6y87fYNCjcwe2f1z7wZ1rLIFbOjsc5eT0OONvZBUHDmYam0cXJvEfD4awFOWK3tcnXjZjhJ5Uu0KSfCP2FUCo9bLG8Krgvl0bnU8vILiZL/+aXm3tf9LX/1pI4ahwGpTER648pEOa+inA6pHnHSXAV4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to01r56M+jklcnbj75KVFaJGJJubvXSyjZeh7vzRVlA=;
 b=tiZrHBDXliA563aQfmmUSaJfY9l+BZIfYQXvsGRhCeMG7xzKCVzH2S/4bAZUV0EHWReYA+W/nMQ+6dECWN35+IfwN3ie4qPMlFndo9ocUfB4uZ7cJT7y16nVvTygrfPP5n1Vcq4IjrS0Q6MhN9SSFHNzexv0h2xlExhVpyjXQ1iQsMRrpO6RkrOdNXAUsy8LT1BQh+JnopMYZ66gLwMghGrw7T6PCe7P62MBydwTdHZle/Tr/kr04WIFOcX6/lBtDIGpeS4MW5r92tj2LOQhsfQt2+SGR3ylbRcsDdg9oKhAb5CGwlr6pJf41dRdUDvvS3qiZkaRYjkb4/8WnFfYFQ==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by VI1PR10MB8255.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 14:32:12 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 14:32:12 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH v2] time64: enable 64-bit
 time/file-offset flags for 32-bit nativesdk
Thread-Topic: [OE-core] [scarthgap][PATCH v2] time64: enable 64-bit
 time/file-offset flags for 32-bit nativesdk
Thread-Index: AQHdOVaozdUehuQ5s0ipndCY2n0Gh7bGAfqAgABZLHA=
Date: Wed, 9 Sep 2026 14:32:12 +0000
Message-ID: 
 <AS2PR10MB7347C72A4BA6CD1CD5C5A20FDBB02@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
 <20260831144026.3048020-1-peter.tatrai.ext@siemens.com>
 <DLANZ4P17648.3II74EWL42T08@smile.fr>
In-Reply-To: <DLANZ4P17648.3II74EWL42T08@smile.fr>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8467a744-7d80-4966-a9d4-e9f49a13dd5c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-09T14:24:25Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|VI1PR10MB8255:EE_
x-ms-office365-filtering-correlation-id: 8cabfe80-f5c5-423e-bf16-08df0e7f2313
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|55112099003|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 0W4SbUB246aU82QvMvvtZzOqmj+0/wfqZFiLaKJv5zND/oAYc09OXL+ECfu/MiEJrEeFk5TIz8YXrWlj+SKvBmbMigjo34NgE9D8pIbaAoeuYSzvMqBtoL2x9ojQ3SwSrQAR5lKutGyzCqtaurlftUdb/OM+yRabmzTNLvTgRq4ZSYaPp8nr9D7Q6+pOTecGCs2Q3asvGNjnDVJ1FtJbB1CO+RsJ9TrYc3rKIRxz/XEIAS4ocev55IBwiBNRGoGpUXe81D42q4la8CuNWuzcqkBljM1zu5X9wyIeIcNEVCC43X6uJVi7dQ5bK6dr3hwd7E3jiqe9ur6uXVQXO2Ecxsl5uCt0p+l1KhJD1gawQAVKsQKfaWsHUXENu/J1J/az19302Qepe3bimYglbAB6qff8+51UR5o42E0UXs0oTC59gs3BPOkh4lHvveFqQ3AYGI+iiv74e7rZiVxOEhZxjaRw6Tk/ILy5XGO8+EksgOAy09gp1UeTfwzRCSJbs/YMp+0nuO4JnuqwstFt9pyU/vPjMQtU6PmvIagqvAXBs1uhyFvjHLobxG4tQgVZsQVtXRRUU6lC7mhjVeg/dCTHsx/8vZM4cxvQhRzqoKfcgHU3/wH0nHTYhcshhEBGsx1qfl7b/2YLi38a+W+u4fzEeXAqI0zv8b/t834W9r5cyJ8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(55112099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QjQvRDhRZWtUY1FOUTVEdzg2NEdlQ3hHZ0ovN2dnbGVNZFJFc1dxUHFUNFBV?=
 =?utf-8?B?b21qaUx0bVVoYzluOW4zdW1kMnNmVWpiMFZCOE1tSjI1REpSbmN2cGhYejk3?=
 =?utf-8?B?WnlZZmh0RGs1eFdUTUVpZ2hBTUppaWxYRThxYVlCbGo0anZQdlY1UVRFTU9y?=
 =?utf-8?B?NytUaEw5N2VNanhuS3liWlRQVG8xMzVKMU5xK2FNeWJ4QmNRVzUvdWR2K1VB?=
 =?utf-8?B?a1E5c3Y3TWlIbTV4Y2FEQnVOK3cwSm5Fc1o2RmNVb2hGaUwwSjZzeXBaQnRl?=
 =?utf-8?B?UEU2TVZGZ2RTb2NqaXBIaXZ5Wm1IK1JRdTRwZkt2NGZUcXRvOTBKRXBRREUr?=
 =?utf-8?B?RlJxL0l2N2t4OWxxdHNRWDUvRVUyWE5KeTMyc0dTVCsvSlF6cUdiZlkzQlRp?=
 =?utf-8?B?cjVKZGsySllia2hxVGYrUFlsckloODROZHlXaTFnSkJXOUFQcjFIUWVuWldQ?=
 =?utf-8?B?MGtjOURuRXpjSU0zU01kZTNHRTZZZUpIRCtVQ053RXU2SDlPc2QzT1NEK3lh?=
 =?utf-8?B?eS9CVkxzakxMa3RWSG9wWjRiRU55azJ5cEVpMjJDKzgyejZMQTJCaXhzNFZu?=
 =?utf-8?B?enVqSGRmZFJocXZ1RGZLTENEb0NpSndMaDR0UGFKZEtMVmZyYVhGajQxdWRV?=
 =?utf-8?B?dVJyUlFQelRrMWNKeUoxSWdNbmVjRzNIdUhCdjdkai9Pc0tBcDZoTzNUckRT?=
 =?utf-8?B?VEZhL3M0a29PMXFOTExlR0thcml0YnNWMUNiT2hRTm1LaHpSWXY3WG1NUTU1?=
 =?utf-8?B?aVNzdHFtUnlWT281NjE4VGg0aHArTjk1TE9oWTh6RGZVN29CTFRaT0hQaTN4?=
 =?utf-8?B?MU12S3U1VWE5ZytLdno5cTBjM2FmOWNpMmtnM1dib3BIcGlHZkEyd0ZTbEg3?=
 =?utf-8?B?OFBoZFk5N2lva0NrNDY3OTBiNjVJUitud2NVM0t1Mm1Jdi9yclppNTFTZ1px?=
 =?utf-8?B?aVZRTi9tQnQ5emF5ZU4vSDlyUFlJK2M3UTlKaVNVeXNjTkxwUUw0bDVsMGJ2?=
 =?utf-8?B?QjdRTFJkUFlla3JIMUlaUlkydFhYM2UxeE8vOVVnMDg0dnp2MmZESnR1OWJh?=
 =?utf-8?B?VDBQcHc3TCtIbGc5UURnaHFEMlUzMWRZbXdnMGY1N0NkZ3daRy9JWGYwcnFk?=
 =?utf-8?B?aG95Y1JRQyt5RU1WVUMydjFrTGxETmh4N2NoS0o0cXUrSWRubjFpVGtiSEJ6?=
 =?utf-8?B?dGVaZWlUQk1yelhXa0czUURlQXptVkhPOVlNZDVGVGhzRXBxcVFpOWc5OWY4?=
 =?utf-8?B?bHhWMExjWDgvbHovZVNwbTE2Y0VEd3RuWEFuSVJhOFR6VmJtNmZMc0RxalZy?=
 =?utf-8?B?SWR3eVdzaEFReUF2ZitPSVdjQzU2b0hRZWlTUTFmakRibWZyNm5YYytwVEpj?=
 =?utf-8?B?cDQ4OEJ0ZXhJZXRZMUZKZVpwQk5ZVVprRTZuNVhiUjk3ZzJLUDhNd1FoVFB2?=
 =?utf-8?B?RWw0TUV1NGR5WmpXaHJ3RGlvK1RBeHRtNlJjNzhsbXA2L1pKR1NIUTlLSEtV?=
 =?utf-8?B?MVNWOG1sZ2tlRkh6M2YwRW9LSExYMjhETGsxUGVMclhxUFlVdFAzRHlITUdD?=
 =?utf-8?B?ditDMmk1L2hSQjArcjA3QVZHSjZ4eEQ1TUZUblpiSVlURmwyUmM1TFBzN09C?=
 =?utf-8?B?Q0I3bDFWU3hGUXE4OWZWejMvRGlVQlRLWVBEMTk1eFBzdXBVY1kyRjRXV0VT?=
 =?utf-8?B?MExMa01ZbWVPU2NmZVFhRVdGWXNzRWVtT0ZZcHJOblcyU3JncE1xOWlnRVE4?=
 =?utf-8?B?dFhRZXcyck1ma3lIdGpxakplODE2NWZXZ3UwUUNBS0w5dkxDOVFhTnRJUlM3?=
 =?utf-8?B?TU5LbW9pWjVjdWcwbWIvaUlKcWtFRU52dUtjc2JBTEttcXM2ckhlQzdodjZI?=
 =?utf-8?B?N0s1OVE5KzAvbjVoOHY4ckN1d2RZTFV1RjVsSWg1ay9GV2NwSVoyOUpWV0VP?=
 =?utf-8?B?REZqb3BLVE5URXgxOURFZE1NR2lTNWFLVmtaWVl2QmZUUU8xcVZvZWJSU0FY?=
 =?utf-8?B?Q2tSakoxQzJ5VEkzRjFFRFJVYzU2TlNpSGQ1UE9CajczY2pHaGlmTGcxQnA4?=
 =?utf-8?B?RTVuN1ByZk5Yc0FyU0t1RjduZE13TFlrVUhaQjZVa2RCeGRha3owbnd6SThB?=
 =?utf-8?B?Q1VzS3lXUU5qa0Z3Tm9BbHNSdHpoMlo4aFo0Yll3MTVSQ3VRQVRwMDFuRVZh?=
 =?utf-8?B?NFE4cWYyM2RNZkMzYmU3ODFGVzJQYmpRcllWVGgxNjhSaWNDV2pyRkdJM1dt?=
 =?utf-8?B?SW8waHNvV2dhYVhDdHRJNEtocG0yNm1OWlc4WTk5WCs3MGZxbm8yUFFoQnFr?=
 =?utf-8?B?Q0RVTHlta1Q4c2wzTlBLNTViZXBxbzZ4ODFVdzVkZUJqNTZZNlhMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cabfe80-f5c5-423e-bf16-08df0e7f2313
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 14:32:12.1936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EgYIutNdi1U2H0iz/7LfqQuTdlFHOLrps7fXmSMHMLTYPT+7XTOiWEww0LKRKRS+8KEwwYgUl1cjn9aDNl+C8FNGpUZsULDTgiglK2MM5WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 14:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245477

SGVsbG8gWW9hbm4sDQoNCj4gSSB0aGluayB0aGlzIHBhdGNoIHN0aWxsIGNhdXNlcyBpc3N1ZXM6
DQo+IG1ldGEtbWluZ3cgdWJ1bnR1MjIwNC12ay0xIHNjYXJ0aGdhcCBjb21wbGV0ZWQgYXQgMjAy
Ni0wOS0wOSAwODo1MzoyMiswMDowMA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdmFsa3lyaWUvPyMvYnVpbGRlcnMvNy9idWlsZHMvMzQ4MS9zdGVwcy8xNS9sb2dzL3MN
Cj4gdGRpbw0KPiANCj4gQ2FuIHlvdSBsb29rIGludG8gaXQ/DQoNClRoYW5rcyBmb3IgdGhlIHJl
cG9ydC4gVGhlIGZhaWx1cmUgd2FzIGNhdXNlZCBieSB0aGUgc2FtZSBmbGFncyBiZWluZyBhcHBs
aWVkIHRvDQpuYXRpdmVzZGstbWluZ3ctdzY0LXJ1bnRpbWUuIFRoZSBNaW5HVyBydW50aW1lIHBy
b3ZpZGVzIHRoZSBXaW5kb3dzIENSVA0KcmF0aGVyIHRoYW4gZ2xpYmMsIGFuZCDCoF9GSUxFX09G
RlNFVF9CSVRTPTY0IGNoYW5nZXMgaXRzIHN0YXTCoGRlY2xhcmF0aW9ucywNCndoaWNoIGNhdXNl
ZCB0aGUgY29uZmxpY3Rpbmcgd3N0YXTCoHR5cGVzIGluIHRoZSBidWlsZC4NCg0KSSByZXByb2R1
Y2VkIHRoZSBpc3N1ZSBsb2NhbGx5IHdpdGggdjIgdXNpbmcgU0RLTUFDSElORT0iaTY4Ni1taW5n
dzMyIiBhbmQNCmNvbmZpcm1lZCB0aGF0IGV4Y2x1ZGluZyBuYXRpdmVzZGstbWluZ3ctdzY0LXJ1
bnRpbWUgZml4ZXMgaXQuDQoNCkkndmUgc2VudCBhIHYzIHBhdGNoIGhlcmU6DQpodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzI0NTQ3Mw0K
DQpCZXN0IHJlZ2FyZHMsDQpQZXRlcg0K

