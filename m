Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437FBC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 22:05:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1234.1786658731775681396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 15:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oRoHg8jn;
 spf=pass (domain: siemens.com, ip: 52.101.65.3, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg1VwQKPVCnB+Iw4KeOEVM2O8sr3qaL8VgoFc2+JbDw9YgZujKOrvcIfoqd3Rl7KGNJfsq/b66P4JlTt1dEcto6uv5s2R3RGV5wED80UFnjlTJk1a1qRsYIgAjMWXPCLO7zt/UdM1Mu2satJBo1Ex9c1NouPZDtZpQAiMWCey6hbGwYbYgblwLHWV9ubsCDkrB+Hze3Gq48ShGRnRwty+WapEhlI48fOYZ5hAebuI4ulwoDhL1W3H6Cdoaupj8M2eGEIWPZSBKh7XDtLobRqFCawdmtIdZdvBOFW+i60Nwy1IZoGEAEHsXY/hz9oLJ/Xe7QXrV/cw/bO1yNucMh2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SphzMISyDTQbIYIrxkgUlsqcF4HobnKgdv5a1fChl5g=;
 b=l3EHLuiItk82Q5IMwYmoTOGUtEH1zMTu8PpMQmAIXTXXR27bw4/ExMTVafB4w45o8u02/3Mj2G5nwkqACsfKJu/cWzkxOhsvi28osjJDBkohJ8k0DjxUVgMN9tWINb8kLZlMvozvHzbCB5o6TkC6yMo4VFvpQsGoP1BnzlS89Q+8tfpA80B+EbUm+8hhakSELpRvMfOkFtKhhhfUgaYVtNuV4GOblU4xl17YLJ4vSbhJe4Qs2ko0Y6KbdPTYkh37eAor58EWdg0ufRAgOJ7PBirWbIa/psQrVnUy+3PZ5NWd+0lr2uSF4BDQb9oGwgvpFDceqc7oa59QGQv8mHzsbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SphzMISyDTQbIYIrxkgUlsqcF4HobnKgdv5a1fChl5g=;
 b=oRoHg8jnZ7v4zac0iArPiz71p4LF5zXNf4vpuROUonIg0Vw6V4F/7UrQfICEGnatCY/Wc0rF6dKXEI/LKOnS4VSp2QowYNRPjvmb8ld6Du5kgBf5q+paoqn8Td3LWbzluDWVscQnVOLaCEYUP4BblmatqgjdeNw1V0iv0GSD3mLiNuIeRfmPeFQbpe5EqWD3l7YPgpIJRrinLzF1gZy4QdycVyr3oPgA86DduJEl4GW7qVUZBATFV7PXf0GDp6gdI4ofs37/v/9yHrcYQPBDw1rnDflCon6GJx/7SE+/tMxtBDpPjuMAw8wiWDFwjpcENJN6mKCQ41BFkXVmBl/YIA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS8PR10MB6245.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 22:05:28 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 22:05:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Paul Barker <paul@pbarker.dev>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Yoann Congal
	<yoann.congal@smile.fr>, Ross Burton <ross.burton@arm.com>
Subject: RE: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Thread-Topic: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Thread-Index: AQHdJyP2NiWRtkyEXEePwSaqro3ccbab5HCAgAACtACAAKcLMA==
Date: Thu, 13 Aug 2026 22:05:27 +0000
Message-ID: 
 <AS8PR10MB5073987C262BD37F31AA9174FDDB2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260808105147.42294-1-peter.marko@siemens.com>
 <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
 <DTPlCxvbRoqnuQ1EM7zERg@bootlin.com>
In-Reply-To: <DTPlCxvbRoqnuQ1EM7zERg@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5b9ed0ca-1fec-4d39-933f-f31658665a2d;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-08-13T21:53:53Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS8PR10MB6245:EE_
x-ms-office365-filtering-correlation-id: b675feaa-45ec-47c1-3080-08def986fbe1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|55112099003|18002099003|56012099006|11063799006|38070700021|10067099003|4143699003;
x-microsoft-antispam-message-info: 
 wA9mHbtFubZbtsaJ+i23XntHPaZp38igeuKSfvZ/yshD+aH0DsuyyIMChyI6+mMhSFEH2DL2mJEc0ibVbJEWjnwTvCaFwdwJ9SjO5FoXNt3rAK7rWjdnsomPyojnt/tA4/MdYW4VIRyoKzhHZZfWSd9glXEK+VvOZynOQTfsqCZx99sAB2fh+e7+n4c1BGMOSy2ODzGPjSRc9IJZYwgaOlhuOYh3BftJ2ZdflVUT6tcf5y5Ic9VmjRTqSHkbC+GlxmluJXLkEHxp4MUzB6btEtkwts/tkMbruKt9WsMg2HOZXfukD4iMIvYDQV602N7YkMyGOkhaeT1E/XSmuL47IRvWb50JVWJBISRJhe0nUmcz8o/qtIWmkMYQ12+A0wAdhmEXPVvjdnAxmvBlY2lC1T0inOLfCPY51xgojiv6fDjE3uL6qEqfRWctr7s6RKqPOWETifv5EGZXdzbi5ahqAcEp0fL8fzabiLKNvtvTxWYG4xc5GCJb0t+iq3hJWf3mlUEg7rmssNMFmvuzDxkOotbdfEUE161kFxZ4hNszr8kQCDYwTZ50YfeIesJz/bEw9IkZjpL9I5DEn+PLlDactt4Yma28DSi6urg/D1SYWYJEZwdIjNShAayjvsz+tk9T33A4tfacpFQvmt/cclwFQJkycStSrIY0eo2KuuElHjo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(55112099003)(18002099003)(56012099006)(11063799006)(38070700021)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SFhqMENteUFKOGU4aEgyRUp4R0Rrd3ZmYWVPZ0NVd0FqUUZ2QkJzNC9MMUZp?=
 =?utf-8?B?WmFyRkdZM1kwZEFHSEZYSVd2NldTK0tpUnlOMHB2ZGViMUo0TTBxU3gwOXor?=
 =?utf-8?B?RGRzSWpRME9kT1d3ai9BMkZjbm9RdXgrdis5ZUtpeFJnMlFDRG1CNXBvS1lV?=
 =?utf-8?B?KzdGc1hiZ0dhTlR4L1JMcTR3M1FXWFBjc0J6VjFhWmdDd3J5OVY3LzYvWGVU?=
 =?utf-8?B?RmZia1RNWmkyaGozcDVHa1daMjhleVdVNXRsNnNaSnpGdTlxWVp3ZUNzd3NW?=
 =?utf-8?B?am9Lc2t3OU16aE5LbThuU1hTY2tqQ3IzWjIrSjJ1NWZPSnhlR1Nuc1JVcHlZ?=
 =?utf-8?B?aUo0VHR1STdQczc0SlFYY0UzOGl0dG5VWitrcGhkZVQrWmJ4ellLQWxxZ0Rl?=
 =?utf-8?B?c3RGUkVkVVFCam9ISFhnWFNFSDdMMk1BWTRGc1NQUEdSZGhLeTVEbGNuaTlO?=
 =?utf-8?B?WDN4K3RPbG93NFZaNVlzYWVmNlFBalpIeXYyNFVFYTVMeHNUdHNWN1prU0tJ?=
 =?utf-8?B?ZHZlUEdaSlBjRElBY3RvRW1KQ0phQU92UHJIL1hxMXd6Rzd1Yk1ZcEk2Wlgx?=
 =?utf-8?B?SlRzeVYzd0J6MTJBREp0cVBOWXJxbTFIajh0aUxVTUlhNlh1QXI1THR6L1li?=
 =?utf-8?B?cDJha0pnN1hnZW1iRjZmUWZDdU11bFJjOUNQSkRzeTFOaTlpVFdhU2x2aDc1?=
 =?utf-8?B?c0hwMU1OemdWUWF4QlJwL2ZjblRFZUJGN3U0NGJrTkt4ZEc1TGQwM2c3dW5M?=
 =?utf-8?B?S25CanphUCtwQ0JaSGJ6R3RqaVFjMUVjQjl2NmdGYzFEVnY2dWtZQVphN1U3?=
 =?utf-8?B?MXlqZGVndTNiSFpIQlZjRXVpZ1ZmcTBGT2JqeUF5YmY4cE5PMGhla2FHcjlT?=
 =?utf-8?B?UTByd2VwakhKZHRDcWJ0b3U3bkNCS2E0M1JZZHJmOEI3N2U0S01vNFFFMXI5?=
 =?utf-8?B?YWhKWjJxU3FnK01OWEN3d3BjUnMrbXkvTm5mcTBDRnBFSExKT2hrTDg0UUxR?=
 =?utf-8?B?MURxN3JQTTB3Z2diT0xiUWVETHVpSUdZb29ScHA4ZEpzNHovR0prN0tMZE5w?=
 =?utf-8?B?dzlNN3Zua1QzVTRSZ3VRbHNPTVk1VThnY2NsSm10WDNBVkxrUWF0clhQaW9x?=
 =?utf-8?B?Q3lNd3V5ZVpJaE1YTFpQRCthRWhqUkQ4RklNeTYrV2xzN0tPZFl5QW1DNXZn?=
 =?utf-8?B?OXhZNEZGSGttNkNPYy9zRzVWMy9wNGNkSW9wdkZFSlMyWDhRV1huUGZhMjdB?=
 =?utf-8?B?Wk1nODlUWVFraVBUbjlrZUtsK0R1bWJZUDB0N2x2UVYwZVNkN3pMczIzdll6?=
 =?utf-8?B?RGxOdHR2c2tEVDZOcVhlalBNUzNCbWF4SEtwK250UkhxVE9uYUFGSGRUM0xz?=
 =?utf-8?B?TVRTNDZqUUxyTW15amRHNllNc290VWxMWk45ak9LSUdYcUwvbGxTTHJBejlB?=
 =?utf-8?B?NEFxbkcrWXNoM3dCQWVkcStTZkszV0NYeEtJcWJ0eTBQbHRwZHhZQUxpcGlr?=
 =?utf-8?B?M1liRno5WExWYkFxbTAxVDJtMGZVME5kSUxqWG9oTjZNcTR2eWNSRGozSVJp?=
 =?utf-8?B?TGRtNm1DRzg5WXF5R3ZRSXVZWng5eFMwMGxVL3JmakhVK0pIT2RWcytXNkdp?=
 =?utf-8?B?Tks1UWlYNWUzOHR4NCt4RjNvdHFaazNZbGN6V2dYUVVXZnZ2WXR0T2hSbXpm?=
 =?utf-8?B?aS93bDEzS0JjMlZtL3k5dDMzRFJkNEMwRmwwQ0N6aExHVzBRRkpnUjJ3cit6?=
 =?utf-8?B?V25DalgyM2VRTUVZVFNhUUtHUUtYbys5ajJ1Y2E0d2hsVjFDa1I3aExPNWlp?=
 =?utf-8?B?aHd3Y1RkbDlZWU1oQ2YxRFFwRzFFYUFmVzJLUXFybDhmaVF1LzNHd3I4UWIz?=
 =?utf-8?B?UEM2UTRuVVAra0RHODZKQzZqaklkcTJveE5UN2lKa09vNTJudFhEc3JTMGd4?=
 =?utf-8?B?eFFLeUNWdlU0SzR1WTltTWliaWhWVUduM0VuUzdyNkpFdm9YQVNBcW9FZjBN?=
 =?utf-8?B?TlRoTUE4RGMwZUVaaGZnc2tOQkxYam9VcFIzRUxmR1lWazBZMXRjSHRwSllu?=
 =?utf-8?B?b2QrZFhkMkxJRmdvMzg4TlZFb1dJcHNOb1BZalM1VVhKVHJPRXhKZWJpRlRy?=
 =?utf-8?B?QkRGNS9ya2N3VGxRV1pEVmZNdUptV2xVVU5xTnFKeHFvQ3ppZDNONmlmekt5?=
 =?utf-8?B?amh0Mk84M2RuZTB3MTBIaHNCTzlSb2s5N3Ara3ZkanZYVTEvRjEzMG9sajVh?=
 =?utf-8?B?cUVaejVjTG05NTJRRHV6NEdDdHlyZ3Y4ZVR6Rk1aaVJPZTdjZTFSZmIxZ0gz?=
 =?utf-8?B?T1NoZUw1RzZmY3V3eDJwa3dEeVF6alBHZXUrUjhXdnNGb3BiemMvUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b675feaa-45ec-47c1-3080-08def986fbe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 22:05:27.9448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVzgl69WI6Jlc/N6V04edgUSvsHbcFWW3JzbpvtTYXCeoaqJn1VrOAuhSBTp6xaJXzlKmSEhHbf7BqmWpkEVPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6245
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 22:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243390

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
PGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDEz
LCAyMDI2IDE6NTYgUE0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0
ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnOyBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj4NCj4gQ2M6IFJpY2hhcmQg
UHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgWW9hbm4gQ29uZ2Fs
DQo+IDx5b2Fubi5jb25nYWxAc21pbGUuZnI+OyBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFt3cnlub3NlXVtSRkMgUEFUQ0ggMDAvMTFdIHNib20tY3Zl
LWNoZWNrIHVwZGF0ZQ0KPiANCj4gT24gVGh1cnNkYXksIEF1Z3VzdCAxMywgMjAyNiBhdCAxOjQ2
4oCvUE0sIFBhdWwgQmFya2VyIHdyb3RlOg0KPiA+IE9uIFNhdCwgMjAyNi0wOC0wOCBhdCAxMjo1
MSArMDIwMCwgUGV0ZXIgTWFya28gd3JvdGU6DQo+ID4gPiBUaGlzIHNlcmllcyB1cGRhdGVzIHNi
b20tY3ZlLWNoZWNrIHRvb2xpbmcgaW4gd3J5bm9zZSB0byBjdXJyZW50IG1hc3Rlci4NCj4gPiA+
IFVuZm9ydHVuYXRlbHkgaXQgc2hvd3MgdGhhdCBoYXZpbmcgY3ZlLWNoZWNrIHRvb2xpbmcgaW4g
dXBzdHJlYW0NCj4gPiA+IGNvbXBvbmVudHMgdmlvbGF0ZXMgTFRTIHBhdGNoIGFjY2VwdGFuY2Ug
cG9saWNpZXMuDQo+ID4gPg0KPiA+ID4gSW4gdGhpcyBjYXNlIHRoZSBtb3N0IHZpc2libGUgaXMg
cHl0aG9uMy1zaGFjbDJjb2RlICgxLjAuMSAtPiAxLjEuMCksDQo+ID4gPiBidXQgYWxzbyBzYm9t
LWN2ZS1jaGVjay11cGRhdGUtbnZkLW5hdGl2ZSBpbnRyb2R1Y2VzIG5ldyBmZWF0dXJlcw0KPiA+
ID4gKHdoaWNoIGlzIGFjdHVhbGx5IHRoZSByZWFzb24gd2h5IHRoaXMgdXBncmFkZSBpcyB3YW50
ZWQpLg0KPiA+ID4gRm9yIG5vdyB0aGlzIHNob3VsZCBub3QgYmUgYSBiaWcgaXNzdWUgYXMgYWxs
IHRoZSBkZXBlbmRlbmNpZXMgYXJlIHZlcnkNCj4gPiA+IG5ldyBhbmQgdXNlZCBleGNsdXNpdmVs
eSBpbiBjdmUtY2hlY2ssIGhvd2V2ZXIgYnkgdGltZSB0aGV5IG1heSBiZSB1c2VkDQo+ID4gPiBp
biBvdGhlciByZWNpcGVzIG9yIHRvb2xpbmcsIHRvby4NCj4gPiA+DQo+ID4gPiBTbyBJIGFtIHNl
bmRpbmcgdGhpcyBzZXJpZXMgYXMgUkZDIHRvIGRpc2N1c3MgZnV0dXJlIG9mIENWRSBjaGVja2lu
ZyBvbg0KPiA+ID4gTFRTIGJyYW5jaGVzLg0KPiA+ID4gKiBzaG91bGQgd2UgZ28gd2l0aCB0aGlz
IHNlcmllcyBhcyBpcyAocG9zc2libHkgdXBkYXRpbmcgcG9saWN5IHRleHQpPw0KPiA+ID4gKiBv
ciBhcmUgd2Ugc3R1Y2sgd2l0aCBvbGQgY29kZSBmb3IgbmV4dCAzLjUgeWVhcnM/DQo+ID4gPiAq
IG9yIHNlcGFyYXRlIHRoZSB0b29saW5nIHRvIG1ldGEtc2JvbS1jdmUtY2hlY2sgd2hpY2ggd291
bGQgb25seSBoYXZlDQo+ID4gPiAgIG1hc3RlciBicmFuY2ggdG8gc2VydmljZSBhbGwgY3VycmVu
dGx5IHN1cHBvcnRlZCByZWxlYXNlcz8NCj4gPiA+ICogb3IgY3JlYXRlIG1peGlucyBsYXllciAo
dG8gYmUgYWxzbyB1c2VkIGJ5IEFCIGN2ZS1tZXRyaWNzIGpvYnMpPw0KPiA+ID4gKiBvciBhcmUg
dGhlcmUgc29tZSBvdGhlciBzdWdnZXN0aW9ucyBob3cgdG8gcmV3b3JrIHRoaXMgc2VyaWVzPw0K
PiA+ID4NCj4gPiA+IE15IHByZWZlcmVuY2Ugd291bGQgYmUgdG8gaGF2ZSBjdmUtY2hlY2sgYWxp
Z25lZCBmb3IgYWxsIHN1cHBvcnRlZA0KPiA+ID4gcmVsZWFzZXMgKGV2ZW4gc2NhcnRoZ2FwKSwg
c28gSSB3b3VsZCB3ZWxjb21lIG9waW5pb25zIGFuZCBkaXNjdXNzaW9uDQo+ID4gPiBvbiB0aGlz
IHRvcGljLg0KPiANCj4gSGVsbG8gUGV0ZXIsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRha2luZyB0
aGUgdGltZSB0byBjcmVhdGUgdGhpcyBzZXJpZXMuIEkgaGFkIGJlZW4gcGxhbm5pbmcNCj4gdG8g
d29yayBvbiBpdCwgYnV0IEkgd2FzIGEgYml0IGJ1c3kgOikNCj4gDQo+ID4NCj4gPiBIaSBQZXRl
ciwNCj4gPg0KPiA+IFRoZSBUU0MgaGFzIGRpc2N1c3NlZCB0aGlzIHNlcmllcyBhbmQgaXMgaGFw
cHkgZm9yIHNib20tY3ZlLWNoZWNrIHRvIGJlDQo+ID4gdXBkYXRlZCBvbiB3cnlub3NlLiBJdCdz
IGluIGxpbmUgd2l0aCB0aGUgZXhwZWN0YXRpb25zIHdlIGhhZCB3aGVuDQo+ID4gd3J5bm9zZSB3
YXMgcmVsZWFzZWQsIGFuZCB0aGUgdXBzdHJlYW0gbWFpbnRhaW5lciBpcyBpbnZvbHZlZC4NCj4g
Pg0KPiA+IEZvciBzY2FydGhnYXAgaXQncyBhIGRpZmZlcmVudCBxdWVzdGlvbi4gVGhhdCBzdGls
bCBoYXMgdGhlDQo+ID4gY3ZlLWNoZWNrLmJiY2xhc3MgaW1wbGVtZW50YXRpb24gaW5zdGVhZCBv
ZiBzYm9tLWN2ZS1jaGVjaywgdGhpcyB3b3VsZA0KPiA+IGJlIHdob2xlIG5ldyBmcmFtZXdvcmsg
cmF0aGVyIHRoYW4gYSBzZXQgb2YgdXBkYXRlcy4gSSB3b25kZXIgaWYgdGhpcw0KPiA+IGNhbiBi
ZSBoYW5kbGVkIHZpYSBhbiBMVFMgbWl4aW4gbGF5ZXIgaW5zdGVhZCBvZiBhIGJhY2twb3J0IGlu
IE9FLWNvcmU/DQoNClBhdWwsDQoNCmFzIHRoZSBtZXRhLXNib20tY3ZlLWNoZWNrIGxheWVyIHNo
b3dzLCBzYm9tLWN2ZS1jaGVjayBjYW4gY28tZXhpc3Qgd2l0aCB0aGUgb2xkIGN2ZS1jaGVjay4N
Ckl0IGRvZXMgbm90IGhhdmUgdG8gYmUgdGhlIHN1cGVyLWludmFzaXZlIHdpdGggYnJlYWtpbmcg
Y2hhbmdlLg0KDQpTbyBpbiB0aGVvcnkgaXQgc2hvdWxkIGJlIHByZXR0eSBlYXN5IHRvIGNvcHkg
MyBjbGFzc2VzIGFuZCBidW5jaCBvZiBzdXBwb3J0IHJlY2lwZXMuDQpCdXQgSSdtIGFsc28gZmlu
ZSB3aXRoIGhhdmluZyBhbiBleHRlcm5hbCBsYXllciBmb3IgdGhhdC4NCg0KUXVlc3Rpb24gaXMg
aWYgWW9jdG8gcHJvamVjdCB3b3VsZCBhbHNvIHN3aXRjaCBjdmUtbWV0cmljcyB0byB0aGUgc2Jv
bS1jdmUtY2hlY2suDQpUaGF0IHdvdWxkIG9mIGNvdXJzZSBoaWdobHkgaW5jcmVhc2UgdGhlIG9w
ZW4gQ1ZFIG51bWJlcnMgYnV0IHdvdWxkIGFsc28gaGVscCBpZGVudGlmeSBtaXNzaW5nIENWRSBm
aXhlcy4NCg0KPiANCj4gSGVsbG8gUGF1bCwNCj4gDQo+IFRlY2huaWNhbGx5LCBJIHRoaW5rIHdl
IGNvdWxkIGJhY2twb3J0IHNib20tY3ZlLWNoZWNrIHRvIHNjYXJ0aGdhcCwgYnV0DQo+IGluZGVl
ZCBpdCBzdGlsbCBoYXMgdGhlIGN2ZS1jaGVjay5iYmNsYXNzIGltcGxlbWVudGF0aW9uLg0KPiAN
Cj4gc2JvbS1jdmUtY2hlY2sgY2FuIGJlIHJ1biBvdXRzaWRlIG9mIFlvY3RvLCBidXQgaWYgeW91
IHdhbnQgaXQgaW50ZWdyYXRlZA0KPiBpbnRvIFlvY3RvLCB0aGVyZSdzIGFscmVhZHkgYSBsYXll
ciBmb3IgdGhhdDoNCj4gaHR0cHM6Ly9naXRodWIuY29tL2Jvb3RsaW4vbWV0YS1zYm9tLWN2ZS1j
aGVjaw0KDQpCZW5qYW1pbiwNCg0KVGhpcyBpcyBzdXBlciBjb29sLg0KSG93ZXZlciwgY3ZlLW1l
dHJpY3MgdXNlcyBzYm9tLWN2ZS1jaGVjay1yZWNpcGUsIHdoaWNoIGlzIG5vdCBwYXJ0IG9mIHRo
aXMgbGF5ZXIuDQpXaGVuIHVwZGF0aW5nLCBwbGVhc2UgY29uc2lkZXIgYWRkaW5nIGl0Lg0KDQpQ
ZXRlcg0KDQo+IA0KPiBIb3dldmVyLCBJIG5lZWQgdG8gdXBkYXRlIGl0IHRvIHZlcnNpb24gMS4z
LjMuDQo+IA0KPiAtLQ0KPiBCZW5qYW1pbiBSb2JpbiwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCj4gDQo+IA0K
DQo=

