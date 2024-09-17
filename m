Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CC2C35FE4
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:40:57 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.55])
 by mx.groups.io with SMTP id smtpd.web10.15207.1726555255600270291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=qayjqj99;
 spf=pass (domain: de.bosch.com, ip: 40.107.241.55, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+sRjAjqAwjVJ7sCK0WpN53PscwvlvXxySxAqxgvqOLdRqFZp6cPvGQaqAB8izzft3Fjlux5KkBg4FGcWIk6WOqE+RM4ocFflDhOKs7vWzQUA9zJ9iYUcsuSK9AGGojQ2vBrIXD+TZBVaWeV2yLdfQTnGNs2P00x4UrPYfML/CRQpetFf8UWTcZsHSIMHeltJ0juKohZ9pItRkfdVwA1OGdYAnDciIOERXtmQROAWaA9y0EZfmF3LUSb/Q03stvuHmTGrCgxD5Z5Npds0yxuwfAxovAvuN2trfD/c/M611uNyKW+EJUjJcHGbqFtI/jFeuX4GOavwALzdgGiuLqWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9lf/kVinzVzSqSlq5knZugMBumkp3qf2RVWXmHztFk=;
 b=F49Kn+I7+sZwFJAId241t6JmkQ66hguUQHf+Hz5cEdpKAEQSyOW2XjasVMZrAhUgiWXuDb7ycFnsLp4RvprS9cFHpZIIq7HqF6Q4V7t9Nirn/Vv6V5uMbHkmDVKg+MV2xENnBJHAc4fbcL/fd3ymYHcKyatsIrQAmzKpsThPK7qM8lUdjJv4THuQa/rT9OWqdMz9ddi/sOJRII1m2Egldidk4YHJtt1/POEZcOOakx1D2G9TGy/BuuZuLJc7FuEzgI6oAQCKWNON1Xgk3fjS94BKPKBil1lK/gutbgm/TbqM95/KAXgeoeFMplwGm7CVaI6yAPdoKk66/z6HvBblAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9lf/kVinzVzSqSlq5knZugMBumkp3qf2RVWXmHztFk=;
 b=qayjqj99K+zCuV6eIc1Ra+6N+pwI2FHY5S6lnFppjEI09m3NuyI31Cl/Y6kwgiy4d5/7b9s9En+7Rzqr4plYIbHsws6y2jvNq73P/c7tHH8ma3c9CIICt2qOzSOpMHlncJAVvGsnbUW2dg4zpQu+2KNUQ5SBfQzOz6/YqCHkDzRNPiJs+9ndP/IE6EszAg3aG1RzsIqrUmzrLLiiaz9RImZ2GVAEP3b1MA6bgqQz8bO8MvlbA8dTJ7BKbR3Ynyerib3pYVkjw7j+Yy21ZnY4CtvwmrJlGjV9+dZGc70xBmlwyYdy6ADUzIRErQPWoYDcXwM+sPEDsiBMiAgm3/KG0Q==
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:423::12)
 by GVXPR10MB8863.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 06:40:52 +0000
Received: from DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036]) by DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::104a:4c1c:9bb3:3036%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 06:40:52 +0000
From: "Jonas Mark (BT-FS/ENG1-Mue)" <mark.jonas@de.bosch.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>, "pidge@baylibre.com"
	<pidge@baylibre.com>, "alex@linutronix.de" <alex@linutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Simoes Ricardo
 (BT-FS/ENG1.1-Ovr)" <Ricardo.Simoes@pt.bosch.com>
Subject: AW: [OE-core] Backport fix for inter-recipe useradd dependencies bug
 #13419
Thread-Topic: [OE-core] Backport fix for inter-recipe useradd dependencies bug
 #13419
Thread-Index: AdsIZuK9Lhmr0SrRQhe6uZfdz+y7ZwADFb4AABYo7bA=
Date: Tue, 17 Sep 2024 06:40:51 +0000
Message-ID: 
 <DU0PR10MB70765AD23A3E19198AAEBF6EAD612@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <DU0PR10MB7076812C64238EC056EFCE1AAD602@DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj90D5mtHdiviR7uG9j-ntWZHFvdPqDi3+zgxf2TmSORcA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj90D5mtHdiviR7uG9j-ntWZHFvdPqDi3+zgxf2TmSORcA@mail.gmail.com>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB7076:EE_|GVXPR10MB8863:EE_
x-ms-office365-filtering-correlation-id: b9638471-9df9-4ffb-fa9b-08dcd6e3ac80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?enZtektTNS8yaVBKK2NEYk1kengwdjhGRng3YTdSSGVGRTByeFZCbUFidTc0?=
 =?utf-8?B?LzIwRDZjeDdWOFFNdEpzOUZZdXVId1dZRUN0aGZ6eWdsd3VxY0pJc3hDcFZ1?=
 =?utf-8?B?LzVxU1pDZ3Z5T1hPOWdpOUdzdVE5MWtXQ3VrQ1ZFVW5pdndnRFh5MzFsd1Bs?=
 =?utf-8?B?Ym5jaTAvUHlVUzVWUzBtUGZvMnUreXUralVmcEtuakZ5RWc4NmkwdlJuMCtz?=
 =?utf-8?B?YWZsYWhFTTJGd1NJUkU0d3A2MGlIeGQ5eEh1eW9QZE9jaWo5ck1Fd3pURkF0?=
 =?utf-8?B?bGhiMVFPVTJJSTI2bkJRMWJHQVNFUTJPSWF3TS9IQ2pZSUc1WGY2bEs3S3pS?=
 =?utf-8?B?eGlML0FqUGtJUDdwR0ZYV04wRElBdkdQSnhEMVpjSUI3RkZ1aWtRcU0vWFk1?=
 =?utf-8?B?L3A4Y20xMEcvcnpPdjhyMkJxb0dTcHV4MmpmVDhRcFBWRjl3MnVKRkNRQ0kr?=
 =?utf-8?B?S3RzNEI0OEtod0ZyQUhhWnRWMlZMcGthNjdhOWF5TDRPTzNwL1VUTGlhMGFM?=
 =?utf-8?B?OFJSR1pHbWliSmVwT0g3Y3VySVZSamFGcnVDc0ZVbUJ0TlZIV0d6cERxejdX?=
 =?utf-8?B?U2Z2dGxMd2Y2eGpYS25BemU2ek1kQzFrcWtWWjVTbmJ6dDE3eFlGbGtKc2p2?=
 =?utf-8?B?VURVbmRQcDVXVDNnV3k4M0o4RVdFTUpGc2hjUnQ3dWdSc0oya1VCNlU0ZVJP?=
 =?utf-8?B?MEZVbWNPRkhpaTR5emxkaGRmSWNsZUF4b0I1b3dpYVVSZ050S0dGdk54azZn?=
 =?utf-8?B?Q1BJSDVxNUJsZ2p3ZUFFelQwSFVTS05naTg2SlE0MDJkWUM1NmlBcjhlNUNN?=
 =?utf-8?B?NXRqTW85YkNQa0plUTJ0d3JQd3VpUndTNU41aWlaelVtcHdQY0tmdjdCNW5l?=
 =?utf-8?B?UDdzNEVjeCt4R3hsMTB2SFdnVmdVOElIcFFWc1hPdGUyaElLb3Nwb3RmRjJF?=
 =?utf-8?B?V05RdzdndHJzNGNIQ2VIbkcrTDJXR09OTXVwQXFFZUJUNmlrTCs0T2hKd2Ns?=
 =?utf-8?B?MTczb1lER2NwbEV5UXVSZTJkS0FoMmljQzdJQ3BidlBZdHFyUDA0TkV0cVps?=
 =?utf-8?B?c3VFcVNNQzFseEJkZzNqT2JUeS9UcU5WS2VmWDNETjdIdGVjNEFacy9jMjJF?=
 =?utf-8?B?OE5LWUI5K1V1QTdObWN3ZXlWNlBhaUFiSmpKc2ZNSlpHZGNEZXdJUTZwaHRx?=
 =?utf-8?B?Tm1pczF1YXVIU0VjUHNiVk5aSEZSb245dmgzbkhMRTNvMStjaHJoZVVvMk5F?=
 =?utf-8?B?dEZqQkZweVpDV3JxVTZORTVVNG1GM2s5SXN4elU1TnJCZHFtNno0TWgxUDVy?=
 =?utf-8?B?UVJ3Yk5ZSDB2eThBUmhDVzNZRFhzSkxsVXlaTVl2NEJLeDhyM24zbmliQ3NL?=
 =?utf-8?B?Q0RTZFQzME45WGdaR3AwOXJLK1JxSE41b05EdDk2c084ODBuTFJEK3RrV290?=
 =?utf-8?B?ZTB3dnNRaFZuK24zTzBiWkFsc1BIM1hudGw3WnNTOENMSGZwWE12elpDUzRK?=
 =?utf-8?B?VEF1ZXVwRjdEcVZJUWxsc3NiV2FmNkhPcVFVWDdPRDEwelhob2NhQU53QWt4?=
 =?utf-8?B?UDRyajl0cEFhL2pZcjJKZlVVWU1veHZYd2d6WkFxMzQrV3VsWDdjU3FJVVFl?=
 =?utf-8?B?K0tCVzZxdFgxQVErbHFJUGFqd2VyOVdEd2hFaE1HT2VoWmxycTUxVzVhOXo1?=
 =?utf-8?B?ZGhUMG5LZXBKZ0l5L1lIVTh5WXF6L0xtRVQ1enVHMFgzc3UvZHpXb2srMG9w?=
 =?utf-8?B?RzNwSWVVZzUyWHRDSythbEc0L29WZGNyT29OVTBIbUJwWVpOOGF0YUZMSU5R?=
 =?utf-8?B?T1NQcjZucjNBWm9ycG9iQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YmVLUUhEamdMdHU0M1F6WWVXeFB0cGhEWUZMaytkbjF1NThyeFlsQmpiR2Fx?=
 =?utf-8?B?Z2t3NDNBWGZFT0pYQkJnRkZ0ejNCUWM3ZXJaZ2pNL0psZmQxVnJyeWdpWlEx?=
 =?utf-8?B?N3NnVHhGb2tmK3RIYUdiWG9Wd3R4NU5TK0I0Vm9jaElLQTJzeTNpSXByUmli?=
 =?utf-8?B?V2F1c3dJMlpUUy9Va2ZnZW5LL0txZFdiRXQ0OGZRNDVsN0JHSE9ydkFLNnNC?=
 =?utf-8?B?b3hCdGI2TStHcDZwOVhXTGxxdUEzNUEzNGQ0eUJhdElmVFh1R2FpZmxWZUlx?=
 =?utf-8?B?M2VqVzVhQWVqbHltNU0wVjBBR0sxN2lhUVZUMnI1QTdFSUFTL2hqTGovRFRP?=
 =?utf-8?B?M0FUdTlueHpYUkN3UjBpS1FmOFFqdlorTHl1Z1RXSlI3RjVsbE9ld24xeEZU?=
 =?utf-8?B?S1pzT1Y5VnIxSzZ1cDIxVW05Z3BvZVJlakRaUFBFVE53dENSN1ZPdkpycVVR?=
 =?utf-8?B?Ym5wR0ZST3EvZmFKalFsMG5UalcyZG1SSFhUYmJ6Yk1HT25qeVh1ZXRJTTdP?=
 =?utf-8?B?UDhpcVZKcGVJMlBWcGNNVGhXcFd1SGMyQkgxamhqelp5RUVQSG53Z291Si9H?=
 =?utf-8?B?QUQzOVpENFBYVGtzdmJXMEdzems1U3hBTEZRK014TklFenY0WkNqVDZPMzNX?=
 =?utf-8?B?Z3ZaV0ZQSDFSd2RkUGNuR21VVUhyZEV0V0xsR3Y3SzVvMlF1Z3B5eU9qNEE0?=
 =?utf-8?B?UTViTFZ5MHZFN3FvdVJySHFrdU9IRFRHc2tQaktKaWdSc1h3OXo1OTZmV0xP?=
 =?utf-8?B?SDVCM0xCdUtJUDlmK1hCTHBGN3h6aVZKcW1MTTRoNHhqMHcyOE0wb2YydHJC?=
 =?utf-8?B?UnJsbFVlOWhuUjA0b2hUVVlYbVN5TnJjZXIwQk15eFVnOGJ3MDdrVUIwZWlG?=
 =?utf-8?B?cUdubHNVV0dRdU1VOHhlRmhZZmxrU0pOZ3FQaU1Bb3FSVW5NUEFpK0hEcnRh?=
 =?utf-8?B?c0xaZURqbUJwdGJzckV6SDNBWjh4Znp1ditxRGlnQTdCcFdFQlFlUkFSNTIx?=
 =?utf-8?B?VWZHTTZJVmJ5RC8xTk4zMDB4UGdaaW81Z2dISUZVaW5IVnlaMmJWckEzeFYz?=
 =?utf-8?B?dmRrUkhmenUrc3AyWWJQbWtxS0F3OVUrQVdreXhadVUyRndQSHYyeFhsRkRO?=
 =?utf-8?B?bnZ1b2s2Ny9ZY2dyZy9NTmZhSWFKdFhqc0pYWlJpcEErV2g0eGhRTzhqeUFP?=
 =?utf-8?B?VE03Q0R0Rk83OHp2WmhpbDY3S2Fwc2I0QzRHMmZ3a2FVZjJzMlIzNUZFd3JQ?=
 =?utf-8?B?YUFKV2hzME9QSmdJVFZyQlJTdDZzT1BhOVFYeFF3UGdpV0tIbjV0bmk1ZVY5?=
 =?utf-8?B?R0ZLNGpJQU1iRVhXSnNLTVBmcmRGanJvVnBtQU5MMks5ZjNXV0xEZXJxNWd4?=
 =?utf-8?B?TnBkRmh0bUpWSUtkRFpGOUg1bktWTkVkenVseEZ0bS9LY015RHVQaHQ2Ukg2?=
 =?utf-8?B?MkUyc1l3U1U3dHB4dVU5eXRQK2JDTm5DckV2MTduWEpmcmF4aVBIS1NLRnEw?=
 =?utf-8?B?bEkxRk53LzlsYTdhQnhyTFE2MXpFWFlpeEFFWnQwd1ZkMDlYQmZaNktBblhP?=
 =?utf-8?B?VlFZQ0FDbVFJK3FTTlMwRGQzeGMxWkFyU1FURkVvWnhEQjcvWlY5VG1Ca0ZR?=
 =?utf-8?B?OXlUWjJyb2d4T3JoWXg5dlV4YWpZNit6cko4cG1LYzVrTSs1Q0JxbmhZWkE4?=
 =?utf-8?B?Z0txMHYxS1lSbWF0UEVlbGVOSmlYZWtZSFlJYmRiVFdLNGVQTXgzeUszU29W?=
 =?utf-8?B?dDJRL3RwcVRzay8yUEEwV3lyYkdPbXJPVE4xVyt4WEtXWkh0OXBrdldFZEd0?=
 =?utf-8?B?eDZVVU83c2Vkajd4WFZkblpmbEd3NGRJOVEwYlZNU3k5dzhZZnRuU2JBUmxN?=
 =?utf-8?B?V2NqWXZIUHFhNkZFb0tHcXdlK1k1T2FUN2VWNTN3VG9SaC9DT2IrV0Uzb2Zx?=
 =?utf-8?B?azRNSmJZUlVaeXVvMTFGZW9EdFZxeUtYR0QyaGYxSzZQbGpXUk8xM1BqUUx5?=
 =?utf-8?B?WHk3RW5FMEJDdUY4YVNyNmRoQ095RElDSjNGNFI0OG9Lem1TWmFMbk0zcGto?=
 =?utf-8?B?cHdkajBaamlkczhqOSszNDFENmNnaWk1ZWtiUUx0QTQ3UmFqcXlERjNkb3JR?=
 =?utf-8?Q?s4Iw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB7076.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9638471-9df9-4ffb-fa9b-08dcd6e3ac80
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 06:40:51.9459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNbD48Zxh6LPMXaj9IzsNKfiHgHLTHithWcBVa1hgedyNFfG8LNSjfDQAbcepmepWqypKyRU4/ZMg+oyj+92Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204615

SGkgQWxleGFuZGVyLA0KDQp5ZXMsIHdlJ2xsIHRyeSB0byBjaGF0IHdpdGggeW91IHdoZW4gd2Ug
c2VlIHlvdS4NCg0KSSBhbSBjb252aW5jZWQgeW91ciB3b3JrYXJvdW5kIHdvdWxkIHdvcmsuIEFj
Y29yZGluZyB0byB0aGUgYWRkdXNlcmJhc2UuYmJjbGFzcyBpdCBzaG91bGQganVzdCBnaXZlIGEg
bm90aWNlIChubyBlcnJvciwgbm8gd2FybmluZykgaW4gY2FzZSB0aGUgZ3JvdXAgYWxyZWFkeSBl
eGlzdHMuDQoNCldlIHN0YXJ0ZWQgYnkgdHJ5aW5nIHRvIGJhY2twb3J0IHRoZSBmaXggZnJvbSBT
Y2FydGhnYXAuIE1vcmUgaW4gbXkgY29taW5nIHJlcGx5IHRvIFJpY2hhcmQuDQoNCkNoZWVycywN
Ck1hcmsNCg0KLS0tLQ0K4oCLDQpWb246IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPg0KR2VzZW5kZXQ6IE1vbnRhZywgMTYuIFNlcHRlbWJlciAyMDI0IDIyOjAyDQpB
bjogSm9uYXMgTWFyayAoQlQtRlMvRU5HMS1NdWUpIDxtYXJrLmpvbmFzQGRlLmJvc2NoLmNvbT4N
CkNjOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnOyBzdGV2ZUBzYWtvbWFuLmNv
bTsgcGlkZ2VAYmF5bGlicmUuY29tOyBhbGV4QGxpbnV0cm9uaXguZGU7IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IFNpbW9lcyBSaWNhcmRvIChCVC1GUy9FTkcxLjEt
T3ZyKSA8UmljYXJkby5TaW1vZXNAcHQuYm9zY2guY29tPg0KQmV0cmVmZjogUmU6IFtPRS1jb3Jl
XSBCYWNrcG9ydCBmaXggZm9yIGludGVyLXJlY2lwZSB1c2VyYWRkIGRlcGVuZGVuY2llcyBidWcg
IzEzNDE5DQoNCldlIGNhbiBjZXJ0YWlubHkgZGlzY3VzcyBpbiBwZXJzb24gaW4gVmllbm5hIGJ1
dCBteSBhbnN3ZXIgZm9yIG5vdyBpcyB0aGF0IHlvdSBzaG91bGQgaW1wbGVtZW50IHRoZSB3b3Jr
YXJvdW5kIHN1Z2dlc3RlZCBieSBtZSBpbiB0aGUgYnVnLg0KDQpBbGV4DQoNCk9uIE1vbiAxNi4g
U2VwIDIwMjQgYXQgMjEuMzksIE1hcmsgSm9uYXMgdmlhIGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnLyA8bWFyay5qb25hcz1tYWlsdG86ZGUuYm9zY2guY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KSGVsbG8gU3RldmUgYW5kIFJpY2hhcmQsDQoNCkkgYW0gd29uZGVyaW5n
IHdoZXRoZXIgaXQgd291bGQgYmUgcmVhc29uYWJsZSB0byBhc2sgZm9yIGJhY2twb3J0aW5nIG9m
IHRoZSBmaXggZm9yIGludGVyLXJlY2lwZSB1c2VyYWRkIGRlcGVuZGVuY2llcyB0byBLaXJrc3Rv
bmU/DQoNCkkgYW0gcmVmZXJyaW5nIHRvIHRoZSBmaXggZm9yIGJ1ZyAjMTM0MTkgd2hpY2ggd2Fz
IGZpeGVkIG9uIFNjYXJ0aGdhcC4NCg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xMzQxOQ0KDQpJIHVuZGVyc3RhbmQgdGhhdCB0aGUgYmFja3BvcnRp
bmcgd291bGQgaW52b2x2ZSB0aGUgYWRkaXRpb24gb2YgVVNFUkFERF9ERVBFTkRTIHRvIHVzZXJh
ZGQuYmJjbGFzcyBhcyB3ZWxsIGEgZml4IHRvIGJpdGJha2UuDQoNCk15IGNvbGxlYWd1ZSBSaWNh
cmRvIGFuZCBJIGFyZSB2aXNpdGluZyB0aGUgT1NTRVUgdGhpcyB3ZWVrIGluIGNhc2Ugc29tZWJv
ZHkgd291bGQgbGlrZSB0byBkaXNjdXNzIHRoaXMgaW4gcGVyc29uLg0KDQpDaGVlcnMsDQpNYXJr
DQoNCkJ1aWxkaW5nIFRlY2hub2xvZ2llcywgUGFuZWwgU29mdHdhcmUgRmlyZSAoQlQtRklSL0VO
RzEtR3JiKQ0KQm9zY2ggU2ljaGVyaGVpdHNzeXN0ZW1lIEdtYkggfCBGcml0ei1TY2jDpGZmZXIt
U3RyYcOfZSA5IHwgODE3MzcgTcO8bmNoZW4gfCBHRVJNQU5ZIHwgaHR0cDovL3d3dy5ib3NjaHNl
Y3VyaXR5LmNvbS8NCg0KU2l0ejogU3R1dHRnYXJ0LCBSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJp
Y2h0IFN0dXR0Z2FydCBIUkIgMjMxMTgNCkF1ZnNpY2h0c3JhdHN2b3JzaXR6ZW5kZXI6IEZyYW5r
IE1leWVyOyBHZXNjaMOkZnRzZsO8aHJ1bmc6IFRob21hcyBRdWFudGUsIFBldGVyIEzDtmZmbGVy
LCBIZW5yaWsgU2llZ2xlLCBQZXRlciB2b24gV2FydGVuYmVyZw0KDQoNCi09LT0tPS09LT0tPS09
LT0tPS09LT0tDQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBn
cm91cC4NClZpZXcvUmVwbHkgT25saW5lICgjMjA0NjA5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMDQ2MDkNCk11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwODQ4ODQ5Ny8xNjg2NDg5
DQpHcm91cCBPd25lcjogbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlJTJCb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFttYWlsdG86YWxleC5rYW5hdmluQGdtYWlsLmNv
bV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQo=

