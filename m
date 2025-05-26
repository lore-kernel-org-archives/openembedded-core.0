Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA4C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 22:05:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web10.38522.1748297100449693418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 15:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=LL0h/pfu;
 spf=pass (domain: siemens.com, ip: 40.107.22.88, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI+PkMw9iiRKjOJ9AFcb+MZca/XDFoQATgMUNbJeSSS40+D2lslP6BGQcdtb0vpUomK6onfPoUXxFkU+xf0Relkdex9+afSGGIYKeeM/9BForvwCuRHejhK/Wq6HZGp4XOqkcvzL9aToowcBDIplhU9jzoTiB9ur2hHgo3kC0VKCdnEBGTXmqgHRE57zWjbB9mprWBNtD2Cy7HtxrScVGpVuG1t09EkvDD1cZjYkNR19vXz+F37ECE1X7ArBBeOCdTQJsimtlvipXd5Tn1FbqhwPIVQvfXJrRryJL2hpZ/gBauifH/5amIfkEQwZKLvI/msLmdDiuQfiPmkxCUN7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYtfccMyLeWC6b45hLPrqHy8or7mlfh81Yp7xxhQCx0=;
 b=K7if47WCdZwOslHGJvJOmKrnuaQTX3Ftn9UIqS3driJnQ1BR6sq0GNdnv5xpNKu+jnM+BztI9Je4ntRB7/0DWr7BrJ+ytn9Gk98l5Ag58pNCreJwlt85Ri4agP2DQvF0EWDP7jJ/85+lDpXZRNBWOTYDX8XIdBprJjsO/rZku1u3dN2qU8y1JMs33HJyioADRLQtrtUJILtdfsrEAWyjn7RCoAfYbgnLfzNnMPyFQ+6GIbyxWICCn27Uw9x7wQrSl/fqdEX/2UnWiaKB1BHKPQV4CBEprk9PYC1m5CNgsZE/jChL9xiEc6XU35wbof1CEmPgAhD+4jt8A0cd1Gc+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYtfccMyLeWC6b45hLPrqHy8or7mlfh81Yp7xxhQCx0=;
 b=LL0h/pfuDw53VkZEa70HIQvqC9YS9FhgXrlvFXmDmk4CMSmo5AijEDdIw1tBXBe+aOvpFkphxaf2URbIJk0uBQSPLayYlaoLCssyYEDX9kqF+9LRRS1PHS3rKyz8jJqr25uLqNn1dBaGviJrFuypw+lYqaFwFus2CZ7hDDfrjZq2OW/9VA8v1IlF6rM8RLLiSafNVirXR1rY9nCw4f838WpRIicPlrya8myQrIxqHroHammvHQA0UxZDy/GzqJFioD2eVu0pPPJuA30d02pv3MLgV4BIdcHkPHB21JmjCIkK++dVqFWKtZonGG/OmCTjxhShnCdgxlSdf5HgjBmLTQ==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by GV1PR10MB8775.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 22:04:57 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 22:04:56 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Marco Felsch
	<m.felsch@pengutronix.de>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: "yocto@pengutronix.de" <yocto@pengutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH v4 07/16] kernel-fit-image.bbclass: add a new FIT
 image implementation
Thread-Topic: [yocto] [PATCH v4 07/16] kernel-fit-image.bbclass: add a new FIT
 image implementation
Thread-Index: 
 AQHbyK5r3TfZPaDpNk2kXOc68FMXzLPaZEoAgAEgFgCAAxcKAIAALxOAgAaHYgCAADEwgA==
Date: Mon, 26 May 2025 22:04:56 +0000
Message-ID: <0f8f0477e22505514617ad3a4f0cfcb317fc1993.camel@siemens.com>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
	 <20250519110838.82978-8-adrian.freihofer@siemens.com>
	 <20250519201556.m5cve4ufizexazuy@pengutronix.de>
	 <90f23d0316b620b0654efb1fb51755d6c8dfc0e4.camel@siemens.com>
	 <01e21e2c-3b4a-426d-8dcc-a956e83c4632@pengutronix.de>
	 <b9506b3b3ec1d9a4fb170cf41744827ffa506ad6.camel@siemens.com>
	 <adbb5ba6-cb06-4b58-8981-61ce8feb4c91@pengutronix.de>
In-Reply-To: <adbb5ba6-cb06-4b58-8981-61ce8feb4c91@pengutronix.de>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|GV1PR10MB8775:EE_
x-ms-office365-filtering-correlation-id: 21b8da73-216b-4060-653b-08dd9ca159af
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SnRLYWhPTzVNb3VYTmR6akV2dHlLR1pZbEtOczR5RndEWjExK2p5eTVHc1pT?=
 =?utf-8?B?L2orV3gzbXo5SlVhUHZpM0dYRUJ3Q0RGa1hRUGh4ZXFHd1ZiZnhrN2FCYlRV?=
 =?utf-8?B?Y3IyT2tvSHp1b25kRSszbDhoNVkzMkcrS2xybmlHOW1Ta1pwMTZBRnZyek9W?=
 =?utf-8?B?bE9GR0d1Y0plVUppL1haM3pOOG9pNWdzc2xJbkZha0FWdHgyT2tYRlRkVVF6?=
 =?utf-8?B?aHkvS1cyNjN2b0hMQ1BNRlhpbkkzQWZES1dBZjNyT01BZ0N1TjJVU0VoMEhz?=
 =?utf-8?B?eXhjMW9qdlVOZVZEWEZvMDQ0NDFDd0JsR005cEY4VmRzOXFPNmtQYzVWdGhX?=
 =?utf-8?B?emtVQ3VSQmhxb3djcTFaSmE3Sjd5UFJjTTNCQ1dMeERrSDBHQWZnODFrU2Nt?=
 =?utf-8?B?dU9FZHl4MDRjRjV5aTlrZ0hFdzdMS2ZEUUYzZlZxeERpSGpOa0lrN1lFVlVt?=
 =?utf-8?B?L0FhUDdvTktydHlMVnZiNi81L0QxS3lyUXRLeVIra0duRXVUR0Jacm54YlZ5?=
 =?utf-8?B?UkdFZUF1SExjeU1vRjFtR3VBdTNrcDdLemgzTk5RRXJNS2w3RkdvVktRcmFo?=
 =?utf-8?B?dDc5eGdGbmh1cmowRG1vVUhlWEMwdjdZaEUrQkI2R3NVOUVlU1ZtUEVVZnZ4?=
 =?utf-8?B?WlZmbWd0ZGFEY1RuM3A2QlZRVXRjeDhIekVoK1hRWWpERFlIMWV5QzBPRmpv?=
 =?utf-8?B?SVp3bHVNL2ZGeWN0eGQ3V0dWNzlaU2FmcGFwbFppOFpyM1RuS24vU3hNblIy?=
 =?utf-8?B?K2NCelNuRytFdG9iOW8vV2tCNHZ0aWNJbzVLdndFSjlhZXNkKzJtV21vY3ha?=
 =?utf-8?B?aTZqTURmbldNZTQwSCtBbDV4NWl4MktJb0xDUkNxajJYVDFiN1Fkc05EZTQ5?=
 =?utf-8?B?bTdST2R0V0RmUGppaUExT1JsZElVK1N5OWNCaTBmM3JpNVBFU2JQQTVlazFy?=
 =?utf-8?B?Y1BaOHVrMmdRNUdISStaM3lybTllT3dzVXF3U091K3NFMEVEaU5McXl4alB1?=
 =?utf-8?B?eDh3YS8vVklpTE9WMUpWaU1SZVkyNmdHQmN1eU9uVWVOZUEwdW0rd3g4S3E3?=
 =?utf-8?B?NnJXRlE3RTE4TWNjbkgrSlIrZEpRR09OSUlVUTBZcVRvbTdGdkozVjZwczUz?=
 =?utf-8?B?allPRUZhUUJWYnNnWVhCaGNRMHdZSCsyaSt2SzNueWJzUnVYdFhYa1hIS1ZE?=
 =?utf-8?B?eXNTNGt4R3lWWG8yY2gxL2NyOGtPUkxBMmR4cmZ5aGlyV2dVRG5qSzJXclZF?=
 =?utf-8?B?MVVTSDBQOG9UODRNQS84dGlESkMzQzgxejdpZ2pmUW1STzdjTGdFc21QMnhi?=
 =?utf-8?B?aEo5cFJ6NTFQM1ZCVi8yMTRGOWplNCs3Q0gwQm82blBzcVJOTkFIam9MaW95?=
 =?utf-8?B?UG82YVN6emYydmFBcG4vZW5XY093WlA2Y0h2WUtZejNvUkh4Z0NsTnJlREdI?=
 =?utf-8?B?aWg1Z0cvS0N0U3d4SHdKOXZwSEc1d0ZXMWhMWlJMUGwxNVFyeDdyV1pnbGVS?=
 =?utf-8?B?dmJBWnJ1SFBJT21jRytQM0pZeXFvaW1aelJ2TFh0WEw2eDdEOXFxZDAxRnRh?=
 =?utf-8?B?Yy8va0lZaWp2TllVa0Jwc254R2IxdFBidTRoUW5TK0dTelpIUm8weVhXWFFw?=
 =?utf-8?B?WVoyK2l2SXlCYnRnVFNVaVdQUWMwdCtBK1BXaFJsUVlYZnJUMkQ1Z25tcmFE?=
 =?utf-8?B?RWlDYVNUNlZsVTR0SEhJOHpHY0ZHTFphSk1vOUF3Mjl0SDYrdERoOFpPSlVa?=
 =?utf-8?B?dksvcXVsSXQ3SnpIUnd4NUhFdkxkcXd2K1FyVTh5dGNBdlVMbmJoUG02ZHlH?=
 =?utf-8?B?SC9iMzg0U2Y2QmFZU0IzRUNiK2FRczBhZDA2aFhrdkxVUFh6Vk1YamEzcE5p?=
 =?utf-8?B?Y1ZGRktxcEtScElWS2l4VGh2VDRtVDIvaDhVc1dmaXVzcWlQM25JdjZmWnJ6?=
 =?utf-8?B?ZGpZbUJKUHJ4ZWpBemp6L09Oa21BWVBnQVdLMkxXZkwrQ1Vhbk52QW5uRWVZ?=
 =?utf-8?Q?BF22NJxrJqZBn3q+wbn7iAHrLvPeVQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WlVPUkZDQUNISkVUbk52RHpzdGFqTVhyaWdLQy9zbGdDT044SmFrM2pQR1Fq?=
 =?utf-8?B?VEp1MVZVY0c3VktCdEtBY1A4K1MvZFFRaW10dzZFQm1rSklNbEQrUW1US29o?=
 =?utf-8?B?ejlXcFU2d2pvVzJ6Y3ZmNGFwV0hVemhTUldaSDI2K3F0MmZrR05Uckp0YzM2?=
 =?utf-8?B?ZUdNSFRaM1dybFkzdUtFR2tzQW5Ecml6TFo0enRRNFBtMHhCUXo4S0FjdFpJ?=
 =?utf-8?B?eU5yQjdKN1pEMmxzM2NGSlhHWnNsTXM5djlsbTVUaUo1YnZjdEp5WlB6UUJR?=
 =?utf-8?B?WmRwTisvRnZqU1YyTjdwcmRyS25OTVdOU1dDZFdBQUJoMGd5Rk4xckx0OWxo?=
 =?utf-8?B?MzAwbC9ZcEQ1ektCQ3UyZkRVelZFQnJCdEkycFl5U1o2bytvc0dQU0RTZE11?=
 =?utf-8?B?NGxYQXRRMXhWdG5ORnNnK0liZXNxZXFDTjZFMFd4VXdVb0VnL002UElLNGls?=
 =?utf-8?B?K05ZT0pyMlRJY0I3QlIvZ0duSmRZWlBqMFhwNEFNRll3N3JSZVhMMFdPUmMv?=
 =?utf-8?B?Z3RMZ1dJdXVCaE5jbTFsdW15YVd5Y2xybWhnUDNyaTMyV09INm9QVWY0UDg2?=
 =?utf-8?B?N2FYK1BRQkdBdGdMckxJekVtVENhL01oZ25RL3VBOTl5WkpBc3RBdzB5djRn?=
 =?utf-8?B?c3ZvN2RmTVVFeE9ZZnBQejVQQk9yRlVyRHkvTXJUSDNVN0tSRDBPS2UrOXgv?=
 =?utf-8?B?VUhGcHRPM0xxbkFTa1dleHp0TUFaWG13NkNBL0ErM2t1OWNyYm1GcjRIaEZa?=
 =?utf-8?B?d0J4K1Z0aWxoa1NEa1BBNjRucUg3d2NSL1NxVWlMQXd3Q1ozU3RtcUF6Nm1P?=
 =?utf-8?B?cnRzbXZJUVNpRjNELzk0dGRhcDRQdjZQcFFJbUZld0dZRGFVcW00dDZzZFJm?=
 =?utf-8?B?ZXlSUVBmVlVQWE1TYVEya0pzR3k0TTFMRzlML3FoQStHZjVIV0hpSytlSDVP?=
 =?utf-8?B?TTdGbnhhaldtdDBnejZVQXIwK28weUh6OFY5WGRaKy9rMmMySklkTTZRbmpO?=
 =?utf-8?B?bUFCYm5jb05TN2hVRXFSb1c1aDA4UmUyOWErT2JFanFmbHUvb2JBR1hVWXBh?=
 =?utf-8?B?Tlg1eDVsUGdSVnJJQWdxL0hoOW8xaWtLUDFMS0Q0VE5pZk5QbWhWRDZQd2Yr?=
 =?utf-8?B?Y29YNUpkbnZzSzJ4NVYwK2JNMDFPWmFFMHloT0dTTG1GVzVGTUJqY2w2VGZV?=
 =?utf-8?B?SHdVbTdqMm5nd3VuR1VZaFdZaGVxRjlCVTNXelNPTnN3bUlRSnJYWmZsZm15?=
 =?utf-8?B?bE54RFNJR3lIY3pmWG1RZWE0TEsyVFVXcndnaGwvL2Q0WkI4dXcvR0gxbGpv?=
 =?utf-8?B?WlJwL3l6ZGZ3Q1FpYkkyTXdMNzVTcmtHWHlhcmRWZzZ2UEJjNVk4YW1TT1Ro?=
 =?utf-8?B?YWhraEZxSVVEdXBqUzc2bVR6aERXdjZwUGpWWGtDN2NvUWczc1IrM3BuQW8x?=
 =?utf-8?B?ZE1vMnBISGRGeGliQkRFODdOOWZkK2lXS3VId3o1dWxBdDVrUktFTmF4NHI2?=
 =?utf-8?B?RlpPdS9abHNkR1ZwY0FydjR2RGVmN0RzSmE5TGFaL0RFWnZLRWhWbmhuYU92?=
 =?utf-8?B?ak5IRlRXZXR6RERETldVeXcxcWZYYVhMWVp3T1A5OFdSVFhmRzBEcWFnSTFq?=
 =?utf-8?B?Q2tJVld0RlRVR0Z5WEM2VTAzVCtic2JzRUdoazcxT2llNW8xeUo4QkJyZWI1?=
 =?utf-8?B?c2tkdVYyeURScTJxdE5uTlVwRVFVNllnWFNMVVNyY0xFeG5tZ2V0MnhSTU5S?=
 =?utf-8?B?WkFvbGZsWXVIRDk5dVJlbVg1Y29jRm9YZGtHUlFUd09iUzRpSkQzZWI4UkJN?=
 =?utf-8?B?eDAwV2VvL0NqVTk2U1hXYy95aHBPQ3lLV0VWSFlWSnNYUWt0VnhoZUdxem1a?=
 =?utf-8?B?RjUrZVNzdFpOazdQbDJocU9iYkorR1llWEI2dGhsYUg2dmlmNzZueFVZeVBm?=
 =?utf-8?B?TlBLdURqZ3RMWkNXRWtVQ1BKZSt1aHlIbm9VTUV1aVVzTGJ3bWgxd0FtZHQ0?=
 =?utf-8?B?ODBvaG5KUFptdk1mNTM3Zlh6YkxnZlVidjlZaFRkOVNJS0lnRzBsdkRvU05t?=
 =?utf-8?B?RDFTNzZ4dkgyTW9MUlppdlBFVGUwRFV4RXpYLytrdHhiMjVYeEhOWVRKZXBj?=
 =?utf-8?B?Z2tVRUJyL3hxMzFjbjhONmJTaXhPZGhLQTdYaUJlWmloNGl2MTFkRFJkV3BL?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0100B2065079C94A82F2633E74D32695@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b8da73-216b-4060-653b-08dd9ca159af
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 22:04:56.4541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9CZsIy5MSoQd7Uyyw1UDAziXAoF+DKjtpWeZiFL7XcEDwMy78PfjPjjBbWePZT7EB+n3/LwjLN9TIPd9DjDpLGvO/9yoN5E1JaFXqZIXsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8775
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 22:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217279

CkhpIFJpY2hhcmQKClNob3J0IHN1bW1hcnk6IFdlIG5lZWQgYSB2NiBmb3IgdGhlIEZJVCBpbWFn
ZSBwYXRjaGVzLgoKSGkgQWhtYWQKCj4gSG1tLCBJIGFtIGxvb2tpbmcgYXQgMTQvMTcgYW5kIGl0
IHNlZW1zIHRoZSBnZW5lcmF0aW9uIG9mIHRoZQo+IGNvbXBhdGlibGUKPiBwcm9wZXJ0eSBpcyBi
ZWluZyBkcm9wcGVkPyBJcyB0aGlzIGludGVudGlvbmFsPwo+IAoKTm8sIGl0J3Mgbm90IGludGVu
dGlvbmFsLgoKQWZ0ZXIgcmV2aWV3aW5nIHRoZSBkZXRhaWxzIGFuZCBnaXQgaGlzdG9yeSwgbXkg
cGF0Y2hlcyB3b3VsZCByZW1vdmUKdHdvIHVuZG9jdW1lbnRlZCBhbmQgdW50ZXN0ZWQgZmVhdHVy
ZXMuIEZpcnN0LCB3aGVuIGEgRFRCIGluCkVYVEVSTkFMX0tFUk5FTF9ERVZJQ0VUUkVFIGRpcmVj
dG9yeSBoYXMgYSBjb21wYXRpYmxlIHByb3BlcnR5LCB0aGlzCnByb3BlcnR5IHNob3VsZCBiZSBh
ZGRlZCB0byB0aGUgY29uZmlndXJhdGlvbiBzZWN0aW9uIG9mIHRoZSBpdHMtZmlsZS4KU2Vjb25k
LCB3aGVuIHRoZXJlJ3MgYSBzeW1saW5rIGluIEVYVEVSTkFMX0tFUk5FTF9ERVZJQ0VUUkVFIGRp
cmVjdG9yeQpwb2ludGluZyB0byBhIERUQiBpbiB0aGUgc2FtZSBkaXJlY3RvcnksIGl0IHNob3Vs
ZCBhZGQgYW4gYWRkaXRpb25hbApjb25maWd1cmF0aW9uIG5vZGUgYnV0IG5vIGFkZGl0aW9uYWwg
aW1hZ2Ugbm9kZSBmb3IgdGhlIERUQiBpbiB0aGUgaXRzLgoKV2UgbmVlZCBhIHY2IHBhdGNoIHRv
IGltcHJvdmUgdGVzdCBjb3ZlcmFnZSBmb3IgdGhlc2UgY2FzZXMgYW5kIGZpeAp0aGVzZSB1c2Ug
Y2FzZXMuIEknbSBhbHNvIGNvbnNpZGVyaW5nIGhvdyB3ZSBjb3VsZCBzdXBwb3J0IGFkZGl0aW9u
YWwKY29uZmlndXJhdGlvbiBzZWN0aW9ucyBiZXlvbmQgZXh0ZXJuYWwgRFRCcywgYnV0IHRoYXQg
d291bGQgYmUgYQpmZWF0dXJlIGZvciBhIGZ1dHVyZSBwYXRjaC1zZXQuCgpDYW4geW91IGNvbmZp
cm0gdGhhdCBteSB1bmRlcnN0YW5kaW5nIGlzIG5vdyBjb3JyZWN0PwoKVGhhbmsgeW91IGZvciB0
aGUgcmV2aWV3LgpBZHJpYW4K

