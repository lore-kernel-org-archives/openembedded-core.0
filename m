Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBD7CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:31:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.556.1790699504428367125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C182kCGG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473248f204=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE9HOT743618
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:31:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=seYpVWu/dOl/d04yBDMjr3Vd02iUYeSr0mFxEZECztw=; b=
	C182kCGGiWh3fO2XJSrxfjXwmwst7EuX3MffoZxSte570hgE6KRQaXSRKC1ruHRy
	mFN08Wu+pRCgQPS1J02YGksUkASIuKYjG2wd5jsJWojFEp51d974OQCPhAJmNIsm
	F421DY+UJYiEjkymsnvJV9Q4U3qYpyI9zEnOwrvKgTF6G5SzVLoxgoG7Wbn4ivAG
	4dnsKAX4BibxZl5BPUonk524eZ+GvKxTAkYa7avEvwFUlPnJucUEP1HgL26BBESw
	ePVYIhw5VjS71ZDLAxKKKhL2kQxzF6fGhMnn7Ok/jWHzY04BAMrNmzyLtVXhi+bQ
	BJQ18RBmfRxWBG0ted5plQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020120.outbound.protection.outlook.com [52.101.46.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gxdjgvpve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xh5UA3/yN54gApKSnLl45NgSeZlPIN52Qv8VelWb5Osf/QG/pQ60b+zYcNDz+k9DibVtSXSbm80ggz4rHWCmh99rxehmYC7EPpIHwn3p4jwFcGQTBO8FyYpnsCXiQZDMdQroxWmL1dFoZphDTc9Gl/kdX1LISqupZoRBQhWUm1jL4dFAjqFa0wbEl19vNAOS66rQVFVzdgYdDncN9j7uDkSycf2t7wOpc24UozktAmpxQUkjDIEviG/YedSIDy60cawAYqQ6TXGZXFrAregIZZgaeaf2rxrC1IvEXnV/4pOa6p/vAxk1F1II+NtNwtgx/fpCLp348AMTU/Y1gjOqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seYpVWu/dOl/d04yBDMjr3Vd02iUYeSr0mFxEZECztw=;
 b=jqPL4JoHHydN0IB8khL3940nN0R30JoZys2H1eKgQKyTPhVfROM1pOwGTZSQx4kPIZ6pw/U6dFiLgVjw7/4bHxru2rgNKHgR2eIjRY3HoNwgVz5bG4h1ipn3cGJBTa8Ms+Zd7j6SphlrVTnNqHq/6KrB4MTQ8RNyQDxjM3A0AkvTu/F9FDkK/yuF/jRQQNW0mac5zlPGbACvACm6rxuXs1WxE399SW/V4i9bRTcQovjWH2EmLdNfA0ucPSl8xHWhhPnZ9IUY8U+4Z8WvpadwBhJqlvPR6c0Ax/DlhAdAmA2nbGtl6pA1Cn8xPEuuPCgdEHOsdvMiQZ6udGhTOFT8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by DM3PPF74831EF4B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 16:31:40 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::57cd:f606:2a6e:4d1e]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::57cd:f606:2a6e:4d1e%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:31:40 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] less: upgrade 704 -> 710
Thread-Topic: [PATCH] less: upgrade 704 -> 710
Thread-Index: AQHdUCvfD3+w9+v1vU2bjekC9ZAUtLblvJMAgAADFoA=
Date: Tue, 29 Sep 2026 16:31:39 +0000
Message-ID: <0920899b-01ee-41cb-abb1-98cf2c0877ce@windriver.com>
References: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
 <9a6b6928-0db6-4f88-954d-870ff32f8348@windriver.com>
In-Reply-To: <9a6b6928-0db6-4f88-954d-870ff32f8348@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2864:EE_|DM3PPF74831EF4B:EE_
x-ms-office365-filtering-correlation-id: 3599ca40-88c1-4ba9-ecbf-08df1e4723ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|260925022911599003|260925021311599003|260925021911599003|10067099003|56012099006|11063799006|4143699003|12006099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 hQI2m8Dyt8Un0Hly2P8ddwbPrx7tAe2TKYnVL4ZPzJ4JZ2o+z00oFYfKUnFZ+S5C0Q9FHQlWG+/tIK+reBeB500smKotyLK6XBN7xaN+uanUUaaqrBXpwB1ZRLHaz7y4724TWwWA+4I7PQ0RzKXKfMK25jZ1vchMj4/az240D9pUsHUuP26OULOvvoclG7S5zXOojULy+DUi0CexEfjjJ5idjjPhQ42aB5z6M/1PZuIlF+2O0ZfZf+lhoFkzLnH22h4r7ng3Vgm6DuK/Dw2609ZX35z6088Kxhc/0PiOhWECMr0r7GNrCNAVmgzBSZsNUegniD5vDUtsSZZ5MkuVT0kLH+pX7DBzdnRdMvmWWCFNxI7mcp88//5aGKOX8yyePi7J52pvbaCnCFipGC5MTtzqTqpReKLT6M+O7SM5lyPypB5Xwdl9TQ9JLiTvd65wA5fkNsq0wwJ3nWz6jpxBII1MHSLjlkiOegSJbXWNmfNapcW5XKQbsmR39mSXQB5k75Qr+XlT5JNaQCyMq7WMs9viKglHqxcRe3nkJofk7CXFX3TdMvgk+B/IiEMUibxePqKPAnDoQRgXYfRUVuHxSMQ0Fae4WMRakzXIOOroMvLXk2dmdgbLdY/lNnsU9sQzpml5x0D9OXq8s3M5iBUoOkUbVghgQ6amm1WSYtc+ZXM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2864.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(4143699003)(12006099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2xsWE5sS05PTVgyTlVjRUc2cEtra0plOWQxT09TTnFUWkNMUEphWXgrVmYr?=
 =?utf-8?B?M3gzRkhlcCtaZ09MOEoxajBrYy9rV0xvaC9PdXlyU2tKSTJrQ3JsVDkrZVEr?=
 =?utf-8?B?aDN3OEE1ai94bWgyM3JxTTQ1WDVXeG10SkdiK2NPRU1yaHp6WE96Q2J1eVZB?=
 =?utf-8?B?TFFUTFV1T3VpcFNxNjVQVVVzbURqVER6WUlqbm9KT2p3SUkyYk1WczZBb0Fs?=
 =?utf-8?B?NmF1aUdjZEJKc2FqKzVUVkUyTXdOZ3ZYK3VCaGx5dHBoZFNwVVk4UXMzUkdr?=
 =?utf-8?B?dmxYcFBSNEJLbWJMaDBtS3M4QURxNVNGc1MxU2FNSTJETUtNT3VCZk9GcGZL?=
 =?utf-8?B?d3hUYmZDN0FxanVVNTdYUVpCWG1zQ1ZoK1NneCtSWDhPZ09ETWtEbXVNY3Vz?=
 =?utf-8?B?ZkZuSFl6ZkwvZzNabFlaWUcydmtqUFVOWkpaL0hyQnpJMVk0Z0N6VVZWbnlG?=
 =?utf-8?B?ODJiWFEyK3FsaXQwKzRiMDNwNXJmeGYyQi9mTlJ5WmVxV0kwWXM2WS9Dc3Rj?=
 =?utf-8?B?WkVTblgxYWhvTWtFMFNyeWlHa0VMNkIrUmRNbWRoK29NemlSWFg0UHAvaWF5?=
 =?utf-8?B?Nm9wYjcwazVuZnZvM2NsdFlGdG1mVlZsRDhPUURGTHZlYWQzNGx4Z0g0WFBx?=
 =?utf-8?B?Z3ZFaVMyM0tJWjZmOExvMndoLzdTZ3B0RDk0SnZQVjA1SWs3WXByQUJXcHA5?=
 =?utf-8?B?YVVlSzRLbGN4blgxNkdTZTFoNmJUK21IRjFscC9wRDBidjJBa2ZZdGdUTVl6?=
 =?utf-8?B?RHhPQWl2MStkNDkxNUNTWTdjc1BFVjZDQ0p1K1pBSS9hdWh1YzVxOGVZYXhK?=
 =?utf-8?B?NlpFUU5vUE1qZHJkNnNEUnNoUHJJSFBlVHRuQ3JaQ3dOWFBpeGZwYnIyVlhP?=
 =?utf-8?B?SnpXdFAyckM0WFJxNjhQSmhIb0dUSUgyS2Q0bjNEaGFLYXFqWXNPdk5oUW9j?=
 =?utf-8?B?TEtLdzFPVS9RZmd1YWUyMGZIYlRWdEFZanRXS3FCajhENDE1U1hLQkNQcHpI?=
 =?utf-8?B?UnRuL28wWGpFbjZwc1gxUGtZYkwyVUtvdkd1VG5JdE45N0Y3RFh0WVh6YlBk?=
 =?utf-8?B?RklYRGJ2T1ZRMFNUYTMwellSTGtpMVRPOGc1WHNCeUtjcndNczlPRVZndE1i?=
 =?utf-8?B?dG03UmMrTjhrdlBNUFh6T0x6eUw1dFRNK2dFVE9IMVhyT204Y2xRc0Z6VlNR?=
 =?utf-8?B?ZkkxbG5ndWYyOWx3UHNvaFllWDlPQnVtZGt2clVQbVlzVnpXZUp6RUo0M2tQ?=
 =?utf-8?B?WkNsdnRhQmhxSmwxQkRaLzZxT0I5UzFnODFnZmNrVWY0cTM0YTF6M0loak9B?=
 =?utf-8?B?allvUWkxejVJU3JiUkZzdjFKYXZsa0gwT3FBcGtWWjB0NXYrZEs0YnBzblpB?=
 =?utf-8?B?K2lBVWpvRmg4bWd6aVF1WElHQUFpSmpDdXgwTlF0ZjZwMHd0MTdMTllwbFlU?=
 =?utf-8?B?VWhPUndyUGIzWG9pS2Q0Q0N2VHJZWFZMT0R6N2pXaTVlUytVN2o5bVFvVHZM?=
 =?utf-8?B?RVdDbkJXdUdGRzA4SWRXRkcva1dDWDJDV2VjNVZFTlFmRmRmTDFKdk9aeUFj?=
 =?utf-8?B?c05Rd2FxdVFBUGZ4eUY1Uk94Rk96ZERkc3Y5Zms2NXpUVjQ4U0Q2eDVQbnRE?=
 =?utf-8?B?SXA3ejYwekl5dFB1d2h1QnFBbXBYYWhRdElKTlc0enVJRDJVelhJaFNuRWo2?=
 =?utf-8?B?SDk4Ym1WWmhPd3czaW9vOHFsSEtKaHlIWEhLemttZ2E3VVBoM0lrU2hHOW5T?=
 =?utf-8?B?dVhhaFg0ekxZVTk2RytuWjhmN1RmdEhrVnJGZkNCUFAwNkxtNFl3bFNBcUd5?=
 =?utf-8?B?WUh5TG45V2ExQnFFL2JaMGtwV3dZcFpLUE82aUorSi9oSkhBaUpWSUZ3OU9a?=
 =?utf-8?B?Zmh0TWU2QTZuSEhKTklWc1FkU0REY3JreWxwZkZEUjZoRytHQkNnclZ1SGl5?=
 =?utf-8?B?NVBQcVVJVTdQM0JlUHF5Sk5hbUpWVG5CeDZyQjFEM01vV2EvanBhWmdxZitx?=
 =?utf-8?B?L21rMWxhb2UxMFlDYlduLzMzOVlROU82b0Jsc0ZFRm5COUdGajdRNjQwQlZq?=
 =?utf-8?B?R2krS2ovQ0NKQmJQRHpwalI2ZloveUwrRHU0TEpCWTNGN0JSZVJtRkFScG13?=
 =?utf-8?B?OVVudHZXNHRONkh6QkQxR09QS0M0SzZNRzJUNzJmNFFoam9zWjV1ck1jSWhj?=
 =?utf-8?B?Vzg4Zk5FOExOYlJ3dXBacDNubWRtbk1ILzJzUWxvaUt3aEVYdVNURHNkbFJB?=
 =?utf-8?B?NnVhVTdYdDVnUUM4NVI0WmgrTlRPMlQ5NzNNRGRRTGo0K3ozUkdNcStXUjBF?=
 =?utf-8?B?L3l3cS82cm5FZkZJd0NNellLR2NvR2pobVRWUVFSSitSWmRjUEdSRklQR1NW?=
 =?utf-8?Q?uG8oN6uEjyPcU/b0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A3C9A59723ABE4786FD06C41F4BD3BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	EmlCqZG3sxaMNm5X1q5DuF/4yTw/yjFdfprCRC6ZgV8SUCijXBMaPc6K/arTGo98ytMENLQkSmmI35woDXslF5ffQAzuBdWK6hHmFKAT/E+lNuYhrV4xO0Mx/7+TgNNwf+JJwZY57MaVPkeu/arQQx9xMQde828LI5mvXw4Mz+WiVpruWvTeHwNroSeE88Fv+xhdmDBUNACbkCM4AxRZrC3BNc5OC6Od6vBgY02K7mmYka7Ihxq5n2IfiIdAfibvFsYr/v12DSYvlGARChzLJEtffhpYVukzHEk64E5oBTvFJ2se9uUW4ivRIa3ghZjAx4czN+YW7KcPYZQpx5G2oA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3599ca40-88c1-4ba9-ecbf-08df1e4723ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 16:31:40.0285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZdBcyLaveO5pG1wrNM1mwVnAVll00H6VlklD2PaEi9G185OPtSArMi0eHISKp/7qLq73BglwNGK8w5RHcKVUgvMJBOR3XqWTUWsqtZwXkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF74831EF4B
X-Authority-Analysis: v=2.4 cv=C/F8WgP+ c=1 sm=1 tr=0 ts=6abbe7ef cx=c_pps
 a=8oFNIrebv7KdPcC3sjE6Hg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=4avBbA3pAAAA:8 a=t7CeM3EgAAAA:8
 a=XcHSACoFa6J3ClyBIIYA:9 a=QEXdDO2ut3YA:10 a=FNuvnhAvCZ4ZEIA-sn9Q:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NOsJV9L-L7PFHIzJNIDQvk9XBcInFlGi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NSBTYWx0ZWRfX7s6UnquCEkyk
 GAeToYFyn6HqomO5SESwNFr7Xxd89fKMOz90tJK63COEUC52z3jjur2Zljb3qfTPhwrp1j76SAT
 FVyPkI+5bSodPTpYwhcUf5waO4ohIa2U/+oqooe8a7PnEUr876dk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NSBTYWx0ZWRfX3FH4SbEwz+uH
 tYBfHNolJ3bvZzp1lG/IANShOwChKuWWovgbSolsK7rkaQxTxzdl/sreIyuOPgAQH6TuxVeG36n
 f/Nd0pTzw5TkT+TjtVg2w2/ZltMJfkF/Z5wWttD2Ww2pMSBHf8hdU3maR3ccyjuBY9WLewbD4fh
 6yT7Qy7WmSxJBYgLi38um+LERq16mxW3Z2ECJ766/MipbW9BdL6NLS9wA5dqzB2ukubHKwGwQYX
 7DDXZUKQRrGWcWwDjqTWP5Q6D1wZlb66Zf31pTgo1uIraDBUEhOFl5j+bucjU/mR5s42wiSwClh
 g/NL7TZ/cYXNSjLVhLe++NZewFHcC5EFqxzbTEeCpZrCHkzbHiCEszDljJuZM3a80Um6HUnhXke
 wcEz9SE2HxVyaMUKnQ9hWhhIo1LndEYQ16VaJ0+6PdHrCP4HPVt1CZ5Fo1I9JtK9mw9V8esOBrU
 gDem8wM8ix0ciA+Ub0A==
X-Proofpoint-GUID: NOsJV9L-L7PFHIzJNIDQvk9XBcInFlGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246880

T24gOS8yOS8yMDI2IDExOjIwIEFNLCBNYWNMZW9kLCBSYW5keSB3cm90ZToNCj4gT24gMjAyNi0w
OS0yOSAxMjowMSwgU3VtYW50aCBHYXZpbmkgd3JvdGU6DQo+PiBDaGFuZ2Vsb2cgaXMgaGVyZToN
Cj4+DQo+PiAqaHR0cHM6Ly9ncmVlbndvb2Rzb2Z0d2FyZS5jb20vbGVzcy9uZXdzLjcxMC5odG1s
DQo+IFJlY2VudGx5LCB3ZSBwcmVmZXIgdGhhdCB0aGUgcmVsZWFzZSBub3Rlcy9jaGFuZ2Vsb2cg
Y29udGVudCBiZSANCj4gZHVwbGljYXRlZCBpbiB0aGUgY29tbWl0IGxvZw0KPiBzbyB0aGF0IGl0
J3MgYXZhaWxhYmxlIHNob3VsZCB0aGUgcGFnZSBkaXNhcHBlYXIgZnJvbSB0aGUgaW50ZXJuZXQu
DQo+IA0KPiBUaGUgQVVIIHJlcG9ydCBoYWQgdGhhdDoNCj4gDQo+ICDCoCDCoFtPRS1jb3JlXSBb
QVVIXSBsZXNzOiB1cGdyYWRpbmcgdG8gNzEwIFNVQ0NFRURFRA0KPiANCj4gT3RoZXJ3aXNlLCB0
aGlzIHNlZW1zIGZpbmUuDQo+IA0KPiAuLi9SYW5keQ0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IFN1
bWFudGggR2F2aW5pPHN1bWFudGguZ2F2aW5pQHdpbmRyaXZlci5jb20+DQo+PiAtLS0NCj4+ICAg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mve2xlc3NfNzA0LmJiID0+IGxlc3NfNzEwLmJifSB8
IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+PiAgIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy97bGVzc183MDQuYmIgPT4g
bGVzc183MTAuYmJ9ICg5NCUpDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9sZXNzL2xlc3NfNzA0LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183
MTAuYmINCj4+IHNpbWlsYXJpdHkgaW5kZXggOTQlDQo+PiByZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcwNC5iYg0KPj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9sZXNzL2xlc3NfNzEwLmJiDQo+PiBpbmRleCBkYzg0MWE5YWU2Li5mM2Y1ZWJkNmEx
IDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3MvbGVzc183MDQuYmIN
Cj4+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNzEwLmJiDQo+PiBAQCAt
MjksNyArMjksNyBAQCBTUkNfVVJJID0iaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20v
JHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3ogXCBmaWxlOi8vIA0KPj4gcnVuLXB0ZXN0IFwgIg0K
Pj4gICANCj4+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjBhMGIwYTJiYjI1MjVmYTUzYzdlZWU5
YmViODU0YjRjOWNmMTcyZWFiYjIwOWFmNzAyMDc0MzU0N2JmZTlmYiINCj4+ICtTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZDEwMDhmYjc4ZGNhZTEzMjNkZGFiNjY0YmNiMzUyYTYxZjAyMmIxYjEzMWJk
ODAxODU0OGUwMjFkOTc1ZWM3YSINCj4+ICAgDQo+PiAgIFVQU1RSRUFNX0NIRUNLX1VSSSA9Imh0
dHA6Ly93d3cuZ3JlZW53b29kc29mdHdhcmUuY29tL2xlc3MvZG93bmxvYWQuaHRtbCINCj4+ICAg
DQo+IA0KPiANCj4gLS0gDQo+ICMgUmFuZHkgTWFjTGVvZA0KPiAjIFdpbmQgUml2ZXIgTGludXgN
Cj4gDQoNClVuZGVyc3Rvb2QsIEkgd2lsbCBiZSBzZW5kaW5nIFYyIHdpdGggY2hhbmdlbG9nIGNv
bnRlbnQNCg0KLS0gDQojIFN1bWFudGggR2F2aW5pDQojIFdpbmQgUml2ZXIgTGludXgNCg==

