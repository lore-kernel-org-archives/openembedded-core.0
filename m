Return-Path: <Oliver.Rohe@wago.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459CAC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 12:33:05 +0000 (UTC)
Received: from mx07-005c9601.pphosted.com (mx07-005c9601.pphosted.com [205.220.184.198])
 by mx.groups.io with SMTP id smtpd.web10.12031.1747398782801474707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 05:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wago.com header.s=p012021 header.b=yHmOE0el;
 spf=pass (domain: wago.com, ip: 205.220.184.198, mailfrom: prvs=12317ec50a=oliver.rohe@wago.com)
Received: from pps.filterd (m0237839.ppops.net [127.0.0.1])
	by mx08-005c9601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4xnYk017965
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 14:33:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=p012021; bh=WmeJ3wtM9aMlhPS+zk/6vbgt
	EIjb4JubYTWDWoa/kds=; b=yHmOE0elQ7emIG52skAKHmTFtNDaJnTMDCBadmZG
	xhGLe2WvHik4HbI2RMkCRhxHVOW5FsHai0p+H+QW5liv4DJXxm9hxLOLfsIOsDbr
	VFY7FVvdwC0n7x6tHXPx74/H8/UrRJrE/XyWTmz4sdDnQqA6CAToiAh5aDxdsBOH
	9fqDTT1rDsGhCXw1/Qr/M3HK9evF+DlELaLe9DS5vrshtkJIIYzkC8a2Qe3SflzK
	MsxP8Ll4kZJVm78QIYgJbjl2jcmc01XVUhS+fzg1LMxOht14IQBHZ1SnH+v9F5sl
	B3cMse6qTlwSTIYrYFtk6D2mSaQ3mC3VFrnw4AAnJQSqAg==
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazlp17013006.outbound.protection.outlook.com [40.93.65.6])
	by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 46nxtnrgjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 14:33:00 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZP30cAzONRkguUYVFCELxtYV2UiQkEkimPPwQVfHuOxiYmmhD0yUF6igjYJx1P8iqNJuKMX6b02IZDA9bUTb9inrUBk2+ZjcaKyf2JO8yOCcvv3mvWpqsQ3+HWt01Od46Oo5qe7wgBNTjuc+xPw8Xi+B1E1Xa95Mdo+JA5FUt5yvG4brIP068aRnf+BTdIO8xnMEuOVzq1NAKTMZN15x/9Z7MIlIzNkmNFpdtiqTxBu0fkRYq/XxJvw7Ik3AkiQ/gfaRKjL2uToSbFrD8wM3eb2tt75Luyv9uzja6tsb9VhE9bAvO6LIVfVl7tljVAhEhwkivviwHtbp/1E1l9N3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmeJ3wtM9aMlhPS+zk/6vbgtEIjb4JubYTWDWoa/kds=;
 b=dwGUlTwh+zb9z5RwF/pqe8zWvP3vCM7Yqang5mehZ6gkc4T4w9laY9OWRTjZgH+OvQah9RZVVVIFqzDCFMUa3d9QhrE7t6koCszJO4EDeEwORgJ9JUlCaJ75P//9MqfIUKYNNesLE524Fd4v8r6titrQByQ/Z/Zkm6iM1lA9QzngJmR+Xl1trOZ+Hv7GGOqmFPTBkkQPyf5s2XVLH42CY8I3d2wp/sEluwqgbFFrJx0FSmHIlArTrxJ19oDytH4PoIrAFAga6WopdNprb8lPEnuOEqObZpuTa9ZxzbCupvJxfeptZvkRHfiTjZcA+nyuY2MFiheDjzE4WFkm/3sbMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8)
 by DB9PR08MB6540.eurprd08.prod.outlook.com (2603:10a6:10:260::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 12:32:59 +0000
Received: from DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99]) by DB4PR08MB8102.eurprd08.prod.outlook.com
 ([fe80::93b6:7bd:c4e5:7e99%4]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 12:32:58 +0000
From: Oliver ROHE <Oliver.Rohe@wago.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel-fitImage: allow overwrite the configuration dtb label
Thread-Topic: [PATCH] kernel-fitImage: allow overwrite the configuration dtb
 label
Thread-Index: AQHbxlwJ3kd3lvqCT0yrzOhlqhd1qg==
Date: Fri, 16 May 2025 12:32:58 +0000
Message-ID: 
 <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Enabled=True;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SiteId=e211c965-dd84-4c9f-bc3f-4215552a0857;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_SetDate=2025-05-16T12:32:58.455Z;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Name=Internal;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_ContentBits=0;MSIP_Label_6b160f33-c33b-4e10-8636-cf83f9ca7d3c_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR08MB8102:EE_|DB9PR08MB6540:EE_
x-ms-office365-filtering-correlation-id: 66ab1c12-de55-4929-dac7-08dd9475caac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?iDe/Q+KBuR8EpcjOUGRzEkIswS90YQkr6bgB1flVQWU4A8IBjmqU4yC91r?=
 =?iso-8859-1?Q?D7kUO1WbUJBRvaGACA/yNHM589KXdUsalaVHzEoVACroifPPLydRNye4HP?=
 =?iso-8859-1?Q?pzEC0YwJzeHdDSkNueZoIQncGEdL7c/no0tD4CmhP183jJBNQNeAg/wfap?=
 =?iso-8859-1?Q?7/bWaw3ZWeFzY+Bb7ZH9Nor3VfEnZJKOlAGWeNrgor2/4XhL+G0NT+kKzE?=
 =?iso-8859-1?Q?8xCSYTKXb50pUpo5TAkYC+qv5diTq+bvUXIWPuIXjOufiLAb1UAj+vhoBx?=
 =?iso-8859-1?Q?9wtw4uW4HRuMP4yeJzgZIwNuNt0aGSq9pU93hMuTT3JE6e21DAOoL5eY6/?=
 =?iso-8859-1?Q?NXLL5LTlW2WyHJVPhaB0SapngUs3UvYpwvqL2tmUtWA9TfgbVA1u57NrqD?=
 =?iso-8859-1?Q?5Xe1XdwX9orI9Ha0bBENUDRAz9azIXIhlIwwbKolQM72cjB/G3QG+PIHG4?=
 =?iso-8859-1?Q?04Nzp8nOMwgcpRkLYQjL7vA3ubtGIKtiruomETyDV0x5fS58lf2sF293j+?=
 =?iso-8859-1?Q?WEdqVX0aHgnuPbyW/3sgvJWc7ncehxSwbTXbJCi09/6cvN5j49khMtlAyO?=
 =?iso-8859-1?Q?6u0a/iCCtJ9RJTZOyXg7M+wmcpZ9b3M+9WnmFvno/LYi9oqWoulEtHQWNY?=
 =?iso-8859-1?Q?sBPpO6Ei4cDzhs18d/0XD11zKl9e5N/t7EIz43rbywyekSlZmU/Mi0MziS?=
 =?iso-8859-1?Q?bX4glIbqqAG1AyLZLEyEUNuJh8XZa3tSbhM/ZrdSCzC/TeqhZ/ksK6LRuD?=
 =?iso-8859-1?Q?ADC0tDQ4Fv4fApirD60A5Mbdt1ECaNS5NgqYUPkM3V+pGm/CEnx4nerYzs?=
 =?iso-8859-1?Q?r5i7ehLVJvnwL6J8R02PWF9b5muf85L4Rzf/69Y7MnhyQsUm+HpGGmvH72?=
 =?iso-8859-1?Q?nS6WbecVIDLnMr2ejhbA2uTyh7UhfivVyAC1osPGqQY3C9Rzm9Lez+48tC?=
 =?iso-8859-1?Q?KSRqayFuXQQB25oykNilGR7O3rcllyfwvyLlfpz24lZRyUjsPBYW/ch1XY?=
 =?iso-8859-1?Q?bQA1h6H16UrI3babTzykkUi/gHF1JI11iterjhV7JhNivfZcdQIZPnpX1e?=
 =?iso-8859-1?Q?xJE2oY7toEiBQ5UDtwSIhi9+yyeg0y0YcAbDwzpEEQoiCBRhtxxzU7tvqD?=
 =?iso-8859-1?Q?uZOGJtHX09kHLH3k+pNlXkonr9dOgTL2gfgHQA2V2/SbNxYrO5yJQyH7NF?=
 =?iso-8859-1?Q?mYhfcPekmscgrhYBUlVJpVTQmE8v+9pWtIiGt6nf0q9R5eSMpEJ4tOomBP?=
 =?iso-8859-1?Q?Uvmf0YtdhbOZpQcb+wwrMYGBkiG1kxPWkL9mvUEhdMCAOGTGBbzFmKdJ79?=
 =?iso-8859-1?Q?2oCL4T1zzPuIqyUgkXFs+OA8h1kdMYEH1K2Gxpkt1QWrXIAnVFTam+WO6k?=
 =?iso-8859-1?Q?WjWDxaVYnxhIC537wZ1iQKZGWiWQXbKH2feY1U8EKxSoh1sxKUjDJ0WjJa?=
 =?iso-8859-1?Q?Apjw6QiNY2S1AcuY65S7TVJKLuZFLBAA0AEI1fnyks5uWonSSUidNbQnE2?=
 =?iso-8859-1?Q?lLL3b/wrk1v1JUHqoqBaerBVMbyzG9izcdFxyKx2IJxQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8102.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hnUuPI8TOUfnDe00pOKLjnknvD8W1CTHGWnAUGbqvzvzDjBQxW5QKtYmXe?=
 =?iso-8859-1?Q?fOkNkJ5LnNEbnp2Cv+x9mmQPUSHhNVyu2e1QEBWfEW6orjsmf20bGOvF57?=
 =?iso-8859-1?Q?8R4sEB3hrXeXm2vy+FZ5kLIB4q/hKNGA+/1ulbSQyO0XXMI/Q+iHGmSmBT?=
 =?iso-8859-1?Q?Al57ixOOedASAb614Hok4xkPm3PdRyxLQss86+IP0Ei8K12M5qGaVu5ZC2?=
 =?iso-8859-1?Q?kzG8tWy5ld/IOIQLKuiJajminyCV04TtB7zhsNN/QIIPUy1G7fDniyZ596?=
 =?iso-8859-1?Q?O/Edu3Eg1ONqqqLvmbCTt230D6o7utebQpazU5M1K7ZCE9o/cfsZHJkMJ3?=
 =?iso-8859-1?Q?zTilqz09aW/gfWtwHKirvNLofQ+9+gn9Qht0q5XIrbvKcDR2epKQQiw4fh?=
 =?iso-8859-1?Q?UA6Q1JTw1Bf0lVjHtfGEuQtE+5ZpU0BgF9RYJM+Qhz0Zy5I64XGwy0mcO2?=
 =?iso-8859-1?Q?jt4zj3yKhnjPv568fceAp8ZaZUS5Q0bETkiiUF/kSiKyd2F7dXjgam/7t6?=
 =?iso-8859-1?Q?7gckwPpkmqjs2H+cejxXfAKan8pC6WsIoRe5ZP61ge7T9SXp1zSCeKoyhm?=
 =?iso-8859-1?Q?aCFvJp4FFPrCNkrBYQ8/TrzMw+8uj5l5XOH0JtlKVC23A0q5dWm8a1ZV3K?=
 =?iso-8859-1?Q?yPNDLUC4bRSfZ7jQadFuaWjBrCizNfZvkoxhWtlMXH0ZYgUUyvgTfdAejU?=
 =?iso-8859-1?Q?dLtmdeJv42ltHhMOArG5hlrQKWEtNEuo96WN0y1oh9/viZIpxYm76uBXIc?=
 =?iso-8859-1?Q?PK+7vbMCNuMsrpU6UMzvbHF1W4ZgraQdrNLSG5XDuA7YwWw0ZDwzfny2H1?=
 =?iso-8859-1?Q?a3/PoQ66DUn5/B7f6J/Lz9MjvQxierIJmF9gt2tqPCsrdoZsYiSN32Of5Y?=
 =?iso-8859-1?Q?cdGfEBD7XgVJtHbNLZ5rvpxUIT9cwk9trA+srNX4xasFdAN7/eURZZF8Pj?=
 =?iso-8859-1?Q?MVd/51k4hF0QNSfC4IiC6Gijaq6oIl5x9LQFr2DPmyECyO2+R6wlJIbP+6?=
 =?iso-8859-1?Q?c3sz/gOPBWK3cOAWn6vZbssFMqYvpdm+DQFZ/zFSqu3nUSO+QN3TLV5EEq?=
 =?iso-8859-1?Q?aKQK5cZruZksUsk78vmsNcHuALjscnw0hNFma3acajMEwO3jDDvZwh72bj?=
 =?iso-8859-1?Q?17OaOSCt2hc9uk4O8xvBVfRkP6+QL4o2SPjb425cCL9kbUFV1I7ahUGbP3?=
 =?iso-8859-1?Q?U4CHoVvFQcaUBAie2O3uNChDYKOR8apUWB4jUXz5BsRBuzgPgi1UbFykzq?=
 =?iso-8859-1?Q?tDERCgEkvY930KSUpXGMIYYVnZrfQQmCN7vWMK6XqLng1DAlp8NhWgx5Iu?=
 =?iso-8859-1?Q?6uYBUR1n4KfC+reP8PqVgkAkY6BfX1cInSWnHPNftqvcfpXRdKYkb2Cerg?=
 =?iso-8859-1?Q?tvnQrIpcRyjLuxBlAyI3jy7XXxYYW1jEkrMvrgeHi9jc3EklFJcIfzay3K?=
 =?iso-8859-1?Q?RP8UtanDPEjcowGFeBY82tu2yR8Ze7wt297MhSlSp2hT0194kKmF2DtkE7?=
 =?iso-8859-1?Q?k6hjFXpxiM2jE4zZMH/YJaIBuo0iK7nDLctTTUzr6SqE4XD9vAgVHg7NpD?=
 =?iso-8859-1?Q?p1DN5G7pnGN+EBmKQyDc3NJ2s+wO2eLgoqI/NgjfMONqCkwWyzrulPDZnb?=
 =?iso-8859-1?Q?vbqe1QSGA0wUgJEs7p7cuWboHOEvte8als?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	q/+Gjee5FnJbenPHkxrkqS1xxtkPPF0f0Ne/Lhca2WfLM6IGxqCEvmA2wtkbJSYAqXnQm4Z7vdnqakbWZ5OGNoHJsPM3EThCRFEr1jJ9bAVqWt2SXNkqbblbBD/3HEqEBsvDOvv5GvS+EXJ2YFUAgcROFu1zP8ZXkC6tEmxTLYj7ORWmSaN+bP9HMH9Gmer6KG3h1m/7vchEDUV1dUGMS7hrskaQRUW5Uy67JqDxbLEFY4pL/8DSKI7MTUhNUKdRN71Ypg2Xw0E7Bgm0XM7AT/sU4BsFjFjPOZfZoHXF/AbClzHd51MuTJVqlRBuo3sr3pTrihDcSUl8ckvTFgWWstSpid27Du2f7wuFHKK3yFBWRPcS66yj4L2HnE7ncp3tuH3SuIDQM7PFM+Q4SGMtBw1UG2BA7nvaWbBe/gJ64wQJ0phGwNPq6aV9gWZFFEE5SCJ12BhGmsquD7PS3qtNNWYPDKkx+TjbPAbsUVs5bEhBJvg+Kj9+B9siGWSAUO08Ke/gxS2fjZoPJC9pgAxdsf38Ff1g+0jZZ8Aph7od9zD+p+3zz1Jc+y/Lpm3jVDFL2K5R29vnpSLq+P/sIfq07aHTDrhxLupkTD9qTgfpAgmKugLRGDzaOZDMZ7KjVf/K
X-OriginatorOrg: wago.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8102.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ab1c12-de55-4929-dac7-08dd9475caac
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 12:32:58.8422
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CypywRbvyQ4UjHuaQgNl0mzdepZ+kLLrO+7yKklZVIecyrNuOzK7qKK/XxrQMDRbMB/T2Rgb4s1tk4ajdmIbjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6540
X-Proofpoint-ORIG-GUID: UU_vIYYfyXb8YIJbvLHj4Zy_qjutrt1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyMCBTYWx0ZWRfXz6/lSM+EL6Mc MWfTXSU1IZtZoGkPI7Cn0TBftesMyF840C5LEj9JmbJlsipX+k2ka83ODQ78GcwP0FkWLb43E/d ZaD15kAQvrIadYtCLczxDSYTY1U0d3IYdYNOozmAW7n/n+HmcbA54myjfLRVMXp+DXZHspyC5ly
 NO4i5t06lIc539HXHSupHPHa6elm75f0JtjFfEOS2gfVArBkltW3CkBiKagZ2pbu1d9cPxmgNss NYbw4LSNoDtPMszFb3cFTwviiFkiD18N48JJOtBmcwV9ZCtoi4vZku+vCrFKoMLVn953sC6ruo6 r4cXnfE4F5fcpFa/eRSrL+0xF68N3aZk1cj90F2KXbxtXWpoW2/EQ41P/K9N+t8hThcev01Ota+
 fuhTgcil4ytHD1k3HFK0k41np0U8tzPlzawsSNs4f999T1XGKBr0VHjrljLeEFN9YztHn9kx
X-Authority-Analysis: v=2.4 cv=AcOxH2XG c=1 sm=1 tr=0 ts=6827307c cx=c_pps a=ZF4yIk2HP9ccVOl7q8CAkw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=ThMX_IV2AAAA:8 a=74f54QFl7qmg7FhRMqcA:9 a=wPNLvfGTeEIA:10 a=0jcnvs3wCqEDeep41k2a:22
X-Proofpoint-GUID: UU_vIYYfyXb8YIJbvLHj4Zy_qjutrt1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 12:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216750

This allows to provide a custom label for each dtb
without having to overwrite the whole function.

Signed-off-by: Oliver Rohe <oliver.rohe@wago.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 26 ++++++++++++++-------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 07786647e1..f770d65087 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -344,6 +344,15 @@ symlink_points_below() {
        echo "$realpath"
 }

+#
+# Simple function to allow overwriting the configuration node label
+#
+# $1 ... DTB image name
+fitimage_emit_section_config_dtb_label() {
+       dtb_img=3D"$1"
+       echo "${FIT_CONF_PREFIX}${dtb_img}"
+}
+
 #
 # Emit the fitImage ITS configuration section
 #
@@ -404,7 +413,7 @@ fitimage_emit_section_config() {
        # conf node name is selected based on dtb ID if it is present,
        # otherwise its selected based on kernel ID
        if [ -n "$dtb_image" ]; then
-               conf_node=3D$conf_node$dtb_image
+               conf_node=3D$(fitimage_emit_section_config_dtb_label $dtb_i=
mage)
        else
                conf_node=3D$conf_node$kernel_id
        fi
@@ -442,13 +451,14 @@ fitimage_emit_section_config() {
                # default node is selected based on dtb ID if it is present=
,
                # otherwise its selected based on kernel ID
                if [ -n "$dtb_image" ]; then
-                       # Select default node as user specified dtb when
-                       # multiple dtb exists.
-                       if [ -n "$default_dtb_image" ]; then
-                               default_line=3D"default =3D \"${FIT_CONF_PR=
EFIX}$default_dtb_image\";"
-                       else
-                               default_line=3D"default =3D \"${FIT_CONF_PR=
EFIX}$dtb_image\";"
-                       fi
+                       # Select default node as user specified dtb when
+                       # multiple dtb exists.
+                       if [ -n "$default_dtb_image" ]; then
+                               img=3D$default_dtb_image
+                       else
+                               img=3D$dtb_img
+                       fi
+                       default_line=3D"default =3D \"$(fitimage_emit_secti=
on_config_dtb_label $img)\";"
                else
                        default_line=3D"default =3D \"${FIT_CONF_PREFIX}$ke=
rnel_id\";"
                fi
--
2.43.0

Internal

