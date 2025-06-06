Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF383C61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:38:33 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.web10.223.1749227909839208227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MtAxXQDx;
 spf=pass (domain: siemens.com, ip: 40.107.159.0, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVz0U1EQhsrbyuqRNcKiCka0aJk1OScA6fklcNzJEuryZoG1Ds2Xh90OzirqeZJ5ytcS1qb8cgxMr6HXUGdjJYBfIXhox+LAh/lI/Y2flKdyNQT2jg9Cjcyxf8QeC4Sxganh/+Qj8OUsiOBfRvIIeVln5Mokes9zDt7HRZtOTwtEjp1fi9ahtoM3X8B0il3J16jdN1T+BihIHghTvN53xEeFj2kjY3LGv+gDUaLWHoQYuiQoSxpMkgrrujoSFls13GMtC1eCgWoa6NnZEBHmoyF5srCaHRUF1ZepYQWQMtEhUCac5c4s+eTIwy3HKIVrH5h6terV1Wp0oPtICgftsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sevsghtv/AzhnLPXOL+HesPOwLg2xNUbI9/MAFnX6VA=;
 b=Vj/ZA8jKzy/As6xuawZwWaA4E3ICWemD3pCOhE2edn4j9KkhE2iq0rd3pbZTb2M+vol7829k0JNNnDQyInZk/qyhTuJW1PI9+3PZ6hnDWtnJOYNjUTbV5Q/Wqeo0bO/lajvKeTCkwm8KIKGpZj0U5eRxADTtWa2eo1R3QyEgZmHDrO0FgdKPysCrihQNFxP7ICUrPOOW3d3oYgBMYc+27ON8J3K1xtDJG/RGWghlHrDRrIdbNGo5+yXrZrsKYHNxcPXrImlkem8/baiAw/dqaqcptj8f/bG+bp0mxwmVfS3uId10RUdczRBMWlEdJA/PMRwG4daHiU/JdG+dxeHshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sevsghtv/AzhnLPXOL+HesPOwLg2xNUbI9/MAFnX6VA=;
 b=MtAxXQDxm17ndr39b7Ymoah5MuuOp5NeXiLbL2Ivgv6RRm6VS+98RI3DjpTwZt9x3E1Nb84JfmIKrCSyMtFDeRSWz0PKn9dVNW0IddPBR1M8ECWO+LZZAvzxmMFudKGYcjQM7HLFUNxT1XVS6KZacABlsVLGPn9wlhkoiJTsKW9JGsd/1GzY93pzgd9jPoYmCMP5r+z+dsmzJuiMeaSHbo3hXnkWPMA6edYAfNz5pV28fwWuzhkIiDE0gn5vUFKFl6a7JIVLJGpNmsoLogY8pYkL514bbKN910GEvf+vcQz04nPoX+WPxOhL6veaTd5DdqEwjJB8pAuSQWPWTv85YQ==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by GV2PR10MB6744.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 16:38:25 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 16:38:25 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Francesco Dolcini <francesco@dolcini.it>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>, "hiago.franco@toradex.com"
	<hiago.franco@toradex.com>
Subject: Re: [meta-ti] [PATCH v7 00/20] FIT image improvements
Thread-Topic: [meta-ti] [PATCH v7 00/20] FIT image improvements
Thread-Index: AQHb1GDs5szeaGrcPUqPWcSZpgkA3rP18woAgAA+HwCAABw1gIAADLcA
Date: Fri, 6 Jun 2025 16:38:25 +0000
Message-ID: <18e1d8d1ea024b599492d6b237fb23a5e37cc1a1.camel@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
	 <20250606102936.GA29790@francesco-nb>
	 <81913717cdad27b7ffb9c29a39fd5b6883190c22.camel@siemens.com>
	 <20250606155253.GB18383@denix.org>
In-Reply-To: <20250606155253.GB18383@denix.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|GV2PR10MB6744:EE_
x-ms-office365-filtering-correlation-id: e6d2ba15-2f1e-498e-4def-08dda5188f06
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NitWdm1aT2lvZ2RGa1Yvc3A4R043ODRsc3NHY3hiQm9xYlUrMGlDcXN2bnc3?=
 =?utf-8?B?dmtVNy9hdjZXcjNKSGU0azlPZEVpaWxwSW40SGpPN2YzcEh2RkFlNGZ6bEla?=
 =?utf-8?B?QSs0S25JODBDY003cFdWQ1JnaXZuUjcrYkJiVmdHY2tOdHVpUzNXYlVaSnRX?=
 =?utf-8?B?RHd6R1VlQUNPcUpFUTFpT2xCaU5CajVFK1FXOXpDb1hoWjN0MUhVZVlzWXl2?=
 =?utf-8?B?UWJKa2hrd3preXBFSVBxck1VbmtiWUJheXl2Z1h4N0FwaEU4aVdlV3FCSEkv?=
 =?utf-8?B?MFVLMDcrdENiM3l3VGxNSVRwUWxLT3JBd1Z1NDFsK1VscEw3Z2xDdUxmZkIr?=
 =?utf-8?B?aHJ2Q003ODAxVkFEUmk4Ulo3NU9BQmtMR2JXelBONWtzbFI5TUVPVFFpVzRx?=
 =?utf-8?B?SnRycG5rMGNhalRxSnd1bGh1b1VBNW82RHBOemdwTXNSTnVTU1Y5NkJlTnd5?=
 =?utf-8?B?WUVUV0ViYTM1ajFBSjZScjAxVnl4TWRIWFRlTHNPV1ZvenZSaDNvWGZvTy84?=
 =?utf-8?B?VzRXRW4zWDJnNERzbHJtVVZHajR0U2ZxL3hXU3hyY0pJbndCL25TQWZ1VXBH?=
 =?utf-8?B?SkRXMWxNWHBSc2x5cyt4aFBvMk93Z3pveUx0WmJwUzgzcHJvc3dBYWczZ29N?=
 =?utf-8?B?UU13WVp2K1I1SzdOc3NKVzNMQitEclB4ZHNmU3pMaFpKVUwyYm5ucjdwZFkx?=
 =?utf-8?B?d3JaUVNaMmZMMEEyVXRDTjViL0R6MDRSc2FVTGpVV0pTVXVHK0g4aFc1dytC?=
 =?utf-8?B?U3MxeGU3a2xIazE3SVhCSytEVVpjSldBbnpSSGJQNlRWcFV6YXZJQytRMTdQ?=
 =?utf-8?B?N2cxUG5VMjdoaHo1dnpud3lSemRmT2V5aXJTQ2VpNGU1NWhlaHBKS0RZTlpN?=
 =?utf-8?B?c2tqMjJqbzBEZDNQS0x5emZRYnJMYXM3MmFNSUxYaStjY201STFpSHVLeG9p?=
 =?utf-8?B?MEpBV3k2Si95M3YycEx6Y2k2TjdLUThGd3RwSk5HaWFsN1dudkRvRUkrU1dI?=
 =?utf-8?B?ajJlRDR2bys5K2o1b0JnT3hzZ1RRY0hrVDdPbWQ1N3VBbXE5MFNCeUtQNFdu?=
 =?utf-8?B?TlZrNU5sRW55eGYvejBBbzI5R2wvbjA1MDVmaEFJdERneElqRExrZkdTZm41?=
 =?utf-8?B?R041UVFieFZTTHZxYkk5alFxSlpmeGRJQlpobGM0eHBaR3ptQU84aGhaQVBV?=
 =?utf-8?B?aXNJQ0U4cFYxT1lPdXpzZHE2UnJJanNxYlJDYjhaWk1zZ2VHMloyTjhUeVM4?=
 =?utf-8?B?cGhVVEdQUjMveGlTNkkzbkJXWjMvOENHT2ppOWZrOHVlMGtCd1JVYXFkWTBM?=
 =?utf-8?B?QUtGUFoxRnB3elBreFRwYWpjMHN6emJVeXJzcFNYRnlSU29DY2NuTUd0Z05Y?=
 =?utf-8?B?c2JPSjZQR3VnL2V0NUd3MjJaL0UvTGNEcTROUU5RMW9nZ3V0QkVlWXgwUm1H?=
 =?utf-8?B?ME52OTI3SHFMWjBiQythQ2RCanpYOExTR29vRTJSY3NxUDY0NXVKQmdxVHky?=
 =?utf-8?B?Yi81dHhROE1jUWZTcStnbUtjeFNXQjZmWTBSRjZzc2pWWFlFYjFXdUQyNXVT?=
 =?utf-8?B?NjdKbEwvdk9WdWVFOHRlUEJWYm5ObzVzUHVzZEZlZG5Ud1duOXROeXhvUTc4?=
 =?utf-8?B?RnA4cHUwWnZvK0t4MnlyeXhGSHE2QXo2RkdLOFN0UHlOY01xT2FrQWRGZzdi?=
 =?utf-8?B?dnBySXhrcVZOdFNiWmIzKzVEQytNZ015UUpJeUpycmtUSzBDYkZycm01VTVz?=
 =?utf-8?B?aFBISTZiMVBxa1BaZGo3K1FlbmZSMXc2QlM3SjM5NFFpOTBkRmYzbHZrMVd2?=
 =?utf-8?B?TkdjRk8za0ZNMHMveFpCL0VwOWpaWnJkOTBvMVZVUzhiYmZ6Yjd2dXVucHE0?=
 =?utf-8?B?eWMxZk0vZmtNU0hMYzNCTU85V0paUW1Qd28zaDN2MEhqeVdzM2VDdVMzMVVk?=
 =?utf-8?Q?Lc8Mv+FDnnE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WUdFQk54Q0JsYzlibjNaKzUzcktEOHlzSjVOVy9UR1J6YnAreHlxclN6MmR5?=
 =?utf-8?B?WTdweUVPSWpQY1I4MkhPUkRPTk1waFFuL1Nma2JURHdleWVhYzczLytZaXBD?=
 =?utf-8?B?SC9uM2VWUWRpNGUxa1VEYnBBMitCRFJkb3B1OWRiMVlZdzQ0dkRFeXJ0VFoy?=
 =?utf-8?B?WGZkbEdnUnByb0kyYVZOOU9OWXJUR2l6STB4cFdyNHNDTXQrTU9LMTM1clJt?=
 =?utf-8?B?S29BeXg2SU8xTUdzU2RORHJPR2YvcVRucFNvaUliTHhjUVcxL0YrMXhNWkpn?=
 =?utf-8?B?emNZZU9Fb0tlREpsak9ZdEdpRG84YTNWV3I2TW5kczcvdU50UGN4eXMzQWxM?=
 =?utf-8?B?WldDeTRTVlBPZTIvalVzTGFBallacXg4WkhsODlEZXBZbWFZMVhDSitzbUtL?=
 =?utf-8?B?cGwySDdsN005YVNkTEw2Z0dEc0FEQWtJOEJvWnBmQ2t2aVdRbnVPdEh0ZjRX?=
 =?utf-8?B?VDZ3ZTdSL0x1S1NlZEUrdzQvaG81b2cwVkdJY2gzaFEvVlVZdzAvb09xdVZZ?=
 =?utf-8?B?QzlDZHRMS3FaTDR1RWVrUit5WXJKQlhQOE1lUFZpZW0xZWg4WTVBTXlqd21a?=
 =?utf-8?B?R2Zkc3pCV1VIVnRzUWFmaWZNQy81d2dIYnA1c1dGR2prS2lIMks2cWlSaCtF?=
 =?utf-8?B?a1B5c0VsRWNxaVBCWjBadEMva1I3a2dVaHJwK3J0VWtzNDd3MTdjWXR3SjZZ?=
 =?utf-8?B?QUNXa0tOVUlONDYyZ2E4S2JQdlNoRmlRUHpiWEJxaWpqM2N3OXd5MzVhNnc0?=
 =?utf-8?B?THpNQlVycVZWNStQNE0yOElWbm9LNjRBajNBYUdLNGVWWjJlRHFSeGk1TXdQ?=
 =?utf-8?B?TXByNFhiWEhrTXc5T3AvaFZOSnZsTDBDS3dIZlNNY0Q0dm4vcWZXb3M5clhW?=
 =?utf-8?B?bmRKaVFhcUFuQ3VieDEvSXlVVEV1ODBBbmJTUElrNlRwZWF3ZGx2bDUzR0R0?=
 =?utf-8?B?UE80N01KeTJqTFc1WHhtbEtHVGEzckp2K1NRa1g3ZDBjRHFyL3haSjNKYnJ0?=
 =?utf-8?B?VjdWVjJ4a1dSNTFCQlJaVy9mT3k3TlM5VTBRcU1HK1MwWE0wWHlnczVGOFIr?=
 =?utf-8?B?aTlWdDJXdFVaaHRKK011N0NZOFE5QmtEMnRIaFhaVmdyM0pRODE5RHd2K2Rr?=
 =?utf-8?B?cUViNmpYQmtaTzMrTGVoSDhubTVScHViWWMvdUNwV1JGQ1loQnY0TCs5dGNs?=
 =?utf-8?B?dEl2UlpCbmpQaWhyQjM3THZSRUhjazZYMXRzYmdTZk9Kb0F3S05mZHV3UElq?=
 =?utf-8?B?TnZVK3labjdRMEwzSG4wQVE2SlpSbUFaQldjMnBCOFp6MWplc2FIcjNIWHQy?=
 =?utf-8?B?QnJoOWxJNmtJbFdsMk83b3NxaGRhSnlHT2ZmaVZqZjlSZzJSWmxOUmVSK1Bj?=
 =?utf-8?B?aVhSL0UxQ3VncUdzeWZPc01qSDNpTndaTjlNRFRITHZlL2RSZURiOFpvanNy?=
 =?utf-8?B?R1AvMnBvY3ZqNFJEL0pWV2x3T3pvWVRWdmpQcXFZODBBZklXVk9sczBlS2tk?=
 =?utf-8?B?OUdXL1VWcjkrQ0ZQRWduSm0zY0xEaWdvbjNFaGszd2ZkelBINm9yWFJEalJI?=
 =?utf-8?B?SW50eHJYVVR6WUVrbk5mNUdiOXh5ZFdaU3NvVzFIekwreUsySFNLT2s1MDQ5?=
 =?utf-8?B?dldGNmlFQWh0NVZOU0VRbGhSS2JzWXJmakRDOFlxRzJkUXQ5bkUzZE9oWi9C?=
 =?utf-8?B?dTJCYUl5U0pPUHdpeCtwazdwR1p6eVNKWHlHa1NhbDRtOWMwSzBXanp0WGpP?=
 =?utf-8?B?SmRhcnMvRy8yTTd4WWxNL3cyR25LWHJjOEZpSHQzZUNlclZ1UVJYdTlyeldl?=
 =?utf-8?B?cDJSTDArMzh1VGlXMFZYNGYvWGVhNkM5T3hCY2hHeGV2dkhPQ1U5UThFMitW?=
 =?utf-8?B?UXY5VTJVVll5bzNPeE9EUVcxVVR2ekIrK201aFRLcXFoSURzMiswbk5NVDVq?=
 =?utf-8?B?ZWpzOUxQWFR1cU40ekg5aVduUXMzSzZ4SUhUZkhsM0Nlbm81bFFOQjJZemV6?=
 =?utf-8?B?dnhabjR0WnR5NnVSOUg5TEpNTVZkbG83WVlscWtpaStqTlBleG1OTWtJOHRY?=
 =?utf-8?B?bW9uamZqZHhBcVF1TXNVeENZckREWFJUTCswNEFhem1EOTZnZFhMUE0rWG9x?=
 =?utf-8?B?aGgzd215Qm5RTFNKV3ptTU0wY014bTMzS20vY3k3SnZXVTRFNmxwWkUwOGsy?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE5148F4A2DEE34BB4CF7AD8CD1B0B69@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d2ba15-2f1e-498e-4def-08dda5188f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 16:38:25.3674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: auz5RIxUytn7Ek636WpNNhzXDXGQYyfQuvftDYjHDQC6Hy2V8VWKc+jaAdKCEBEdbwecxuzVPcXn7HFrJ49Xew0TAI8vTcWzGrb1fHLdlWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218176

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDExOjUyIC0wNDAwLCBEZW55cyBEbXl0cml5ZW5rbyB3cm90
ZToNCj4gT24gRnJpLCBKdW4gMDYsIDIwMjUgYXQgMDI6MTE6NTdQTSArMDAwMCwgQWRyaWFuIEZy
ZWlob2ZlciB2aWENCj4gbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyB3cm90ZToNCj4gPiBIaSBGcmFu
Y2VzY28NCj4gPg0KPiA+IENvbmdyYXR1bGF0ZSwgeW91ciBDSSBpcyBmYXN0ZXIgdGhhbiBJIGFt
IHdpdGggdXBkYXRpbmcgdGhlDQo+ID4gZG9jdW1lbnRhdGlvbiA6LSkuIEJ1dCBpbiB0aGUgbWVh
biB0aW1lIHB1Ymxpc2hlZCB0aGUgY29ycmVzcG9uZGluZw0KPiA+IGRvY3VtZW50YXRpb24gdXBk
YXRlIHRvbzoNCj4gPiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9kb2NzL21lc3Nh
Z2UvNzAxNw0KPiA+DQo+ID4gWWVzLCB1bmZvcnR1bmF0ZWx5IHRoZXJlIGlzIGEgYnJlYWtpbmcg
Y2hhbmdlLiBUaGUgbW9kaWZpY2F0aW9uIGhhcw0KPiA+IHVuZGVyZ29uZSBleHRlbnNpdmUgcmV2
aWV3IHRocm91Z2ggc2V2ZXJhbCBtb250aHMgb2YgdGVjaG5pY2FsDQo+ID4gbWVldGluZ3MNCj4g
PiBhbmQgcGF0Y2ggcmV2aWV3IHNlc3Npb25zLiBBIHZlcnkgYnJpZWYgbWlncmF0aW9uIGd1aWRl
IGlzIGhlcmUuDQo+ID4NCj4gPiBDb21pbmcgZnJvbSBhIGNvbmZpZ3VyYXRpb24gbGlrZToNCj4g
PiAgIEtFUk5FTF9JTUFHRVRZUEUgPSAiZml0SW1hZ2UiDQo+ID4gICBLRVJORUxfQ0xBU1NFUyA9
ICJrZXJuZWwtZml0aW1hZ2UiDQo+ID4gYW5kIGJ1aWxkaW5nIGEga2VybmVsIGxpa2U6DQo+ID4g
ICBiaXRiYWtlIGxpbnV4LXlvY3RvDQo+ID4NCj4gPiBuZWVkcyB0byBiZSBjaGFuZ2VkIHRvOg0K
PiA+ICAgS0VSTkVMX0NMQVNTRVMgPSAia2VybmVsLWZpdC1leHRyYS1hcnRpZmFjdHMiDQo+ID4g
YW5kIGJ1aWxkaW5nIGEga2VybmVsIGxpa2U6DQo+ID4gICBiaXRiYWtlIGxpbnV4LXlvY3RvLWZp
dGltYWdlDQo+DQo+IFF1aWNrIHF1ZXN0aW9uIGhlcmUgLSBjYW4geW91IHN0aWxsIHByb2R1Y2Ug
bXVsdHBsZSBrZXJuZWwgdHlwZXMgaW4gYQ0KPiBzaW5nbGUNCj4gZ28gZnJvbSBhIHNpbmdsZSBr
ZXJuZWwgcmVjaXBlPyBFLmcuIG9sZCBLRVJORUxfSU1BR0VUWVBFUyA9ICJJbWFnZQ0KPiBmaXRJ
bWFnZSINCj4NCj4gT3IgYXJlIHRob3NlIG5vdyBtdXR1YWxseSBleGNsdXNpdmU/DQoNCkV2ZXJ5
dGhpbmcgc2hvdWxkIGJlIHBvc3NpYmxlLiBUaGUgb25seSBsaXR0bGUgZGV0YWlsIHdoaWNoIGNo
YW5nZXMgaXMNCnRoYXQgdGhlIGtlcm5lbC5iYmNsYXNzIGRvZXMgbm8gbG9uZ2VyIGhhbmRsZSB0
aGUgS0VSTkVMX0lNQUdFVFlQRShTKQ0KZml0SW1hZ2UuDQoNCkZvciBleGFtcGxlIGlmIHlvdSBk
bzoNCiAgS0VSTkVMX0lNQUdFVFlQRVMgPSAiSW1hZ2UgekltYWdlIGJ6SW1hZ2UgdUltYWdlIg0K
YW5kIGNhbGwNCiAgYml0YmFrZSBsaW51eC15b2N0bw0KWW91IGdldCBhbGwgdGhlc2UgaW1hZ2Vz
IGFzIHBhY2thZ2VzIGFzIHdlbGwgYXMgZGVwbG95ZWQgdG8NCkRFUExPWV9ESVJfSU1BR0UuIE5v
dGhpbmcgY2hhbmdlcy4NCg0KaWYgeW91IGNhbGwNCiAgYml0YmFrZSBsaW51eC15b2N0by1maXRp
bWFnZQ0KdGhlIHNhbWUgaGFwcGVucy4NCkFkZGl0aW9uYWxseSB5b3UgYWxzbyBnZXQgdGhlIGZp
dEltYWdlIGFzIGEgcGFja2FnZSAod2hpY2ggaXMgbmV3KSBhbmQNCnRoZSBmaXRJbWFnZSBpbiB0
aGUgREVQTE9ZX0RJUl9JTUFHRS4NCg0KQWRyaWFuDQoNCj4NCj4NCj4gPiBJIGhvcGUgdGhhdCBo
ZWxwcy4gT3RoZXJ3aXNlLCBwbGVhc2UgbGV0IG1lIGtub3cuDQo+ID4gQWRyaWFuDQo+ID4NCj4g
Pg0KPiA+DQo+ID4NCj4gPiBPbiBGcmksIDIwMjUtMDYtMDYgYXQgMTI6MjkgKzAyMDAsIEZyYW5j
ZXNjbyBEb2xjaW5pIHdyb3RlOg0KPiA+ID4gSGVsbG8gQWRyaWFuLA0KPiA+ID4NCj4gPiA+IE9u
IFR1ZSwgSnVuIDAzLCAyMDI1IGF0IDEwOjIzOjExQU0gKzAyMDAsIEFkcmlhbkYgd3JvdGU6DQo+
ID4gPiA+IEZyb206IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5j
b20+DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIHJlLXdyaXRlcyB0aGUgRklU
IGltYWdlIHJlbGF0ZWQgY29kZS4gVGhlDQo+ID4gPiA+IGdvYWwgaXMNCj4gPiA+ID4gdG8NCj4g
PiA+ID4gZml4IFtZT0NUTyAjMTI5MTJdIHdoaWNoIGlzIGEgbG9uZyBzdGFuZGluZyBpc3N1ZS4N
Cj4gPiA+DQo+ID4gPiBJIGRpZCBub3QgaGF2ZSB0aW1lIHRvIGxvb2sgaW50byB0aGUgZGV0YWls
cyB5ZXQsIGJ1dCBpdCBzZWVtcw0KPiA+ID4gdGhhdA0KPiA+ID4gdGhpcw0KPiA+ID4gYnJlYWtz
IGJ1aWxkIHdpdGggbWV0YS10aS4NCj4gPiA+DQo+ID4gPiA+IDA2LTA1OjE4OjA2OjMzICBFUlJP
UjogUGFyc2VFcnJvciBhdA0KPiA+ID4gPiAvd29ya2Rpci9vZS9idWlsZC8uLi9sYXllcnMvb3Bl
bmVtYmVkZGVkLWNvcmUvbWV0YS9jbGFzc2VzLQ0KPiA+ID4gPiByZWNpcGUva2VybmVsLmJiY2xh
c3M6MTgzOiBDb3VsZCBub3QgaW5oZXJpdCBmaWxlDQo+ID4gPiA+IGNsYXNzZXMva2VybmVsLQ0K
PiA+ID4gPiBmaXRpbWFnZS5iYmNsYXNzDQo+ID4gPiA+IDA2LTA1OjE4OjA2OjMzICBFUlJPUjog
UGFyc2luZyBoYWx0ZWQgZHVlIHRvIGVycm9ycywgc2VlIGVycm9yDQo+ID4gPiA+IG1lc3NhZ2Vz
IGFib3ZlDQo+ID4gPg0KPiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZG9sY2luaS84MjQw
YTIyOTUxNmU3YTkzMzU2ZWJiYTU2NjMxZDNjMA0KPiA+ID4NCj4gPiA+IEZyYW5jZXNjbw0KPiA+
ID4NCg0K

