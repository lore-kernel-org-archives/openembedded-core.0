Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB38C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 12:09:10 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29228.1785154145077659862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 05:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LE8LSpG6;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9157; q=dns/txt;
  s=iport01; t=1785154145; x=1786363745;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=TIz6g7+hdUT1V9lA2kAiNPvhKZFwsnfp5+B+WpMLT/M=;
  b=LE8LSpG6JzT/zwRFk9F7L0sLyJ1V6mO06cdOEhxpeNzOYvQOKZos8oZy
   4GBlrl+Lk1eEe1V1kPA6Z4eZwZfOU5/s6kVH614SsV4KtWSkfTj1rZ3nb
   PC/buejYSNLB7sJI4wG64lCwRXn3oLIOQqDhw916hlLt56SUu0YYM+oZ/
   pB4dQmDb8zlN5nMrcfdu0XTkUCSUK0ygwcZC+iHhEJdX5UMxD+9FhROt4
   X4mx4nRSRfRNV7O/UBfKqLkJRpgjppjs6Z3W6RRpBcTsf0OLQMp/X91N3
   CeoVjf9ro308FBsGDsiMZEpwIKxYEmb9rqZ74888RUSjgy8B1oGUsK3sj
   A==;
X-CSE-ConnectionGUID: eDzIYH5KTwCuj16KvF7cKQ==
X-CSE-MsgGUID: G+dU1pMtTIqOXLQ7ibZt7A==
X-IPAS-Result: =?us-ascii?q?A0BzAwDpSWdq/5EQJK1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJiCMDhSuIeQOeG4F0Cg8BAQEOAS4BGwcEAQGFBQKNYAImNAkOAQIEAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBETkBLRACAQgRB?=
 =?us-ascii?q?AEBAS4nCh0IAgQBCQQFCBqCYYIdFkEDAQIOBrgvAYE9AooqeIE0gQGDKAExB?=
 =?us-ascii?q?QkCAkAB3AoUAYE4hT+DHAEBKoE1gl2BIhgBgkmCMycbG4FygRVCgmk+gQWBX?=
 =?us-ascii?q?AEBAQEBgTQrPINXgjAEgiJ6EhuBXVB3JYFhjHtSciIDJjMsAVUTFwsHBYEjE?=
 =?us-ascii?q?DMDKi8tI0sFLR1wDCcSDx0XFh5YGwcFEiAqQUUjA0E2OAtDBYFXAoF4PyMfA?=
 =?us-ascii?q?zl/gS91SnctaQECEBdKOCSDSwKBUAMLbT03Bg4ZAwSBNQWNCwdbI4JAEEoHL?=
 =?us-ascii?q?SoCBEuBHRgPJAaifY5glRcKKIN1jCGNPogyF4QEgVeLPZYEg1CZCCONZ5sOA?=
 =?us-ascii?q?gQCBAUCEAEBBoFoPDmBDgsHcBWDIgkKDDQZD5IjgX+DFIEtwVB5AgEBATgBA?=
 =?us-ascii?q?QcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:tkFLVhUNvgLcG8IqAgxDmyQavGnV8K3PAWYlg6HPw5pHdqClupP6M
 1Oav7NmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:ULuk2K5LN6+THDAWbMH7gAxRtGDGchMFZxGqfqrLsTDasY5as4F+v
 mYbD2zUaP3ZYDSgctwnaIvk9E4EvZXXn9UyQFNo/ng8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OtPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eMKEK29dXXEJy6
 tcFKmlTTQ6t2OmV+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3Fb4qEK4LXFZ8J9qqej
 k2F81mgGjQGCP2G7gqhyy2tjN3TwgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTZqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:I5i2cK7Z4CEFF99EgQPXwciCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ8dcLC7VJVpQRvnhPhICPoqTMaftWjdySSVxe5ZnPHfKlHbaknDH6tmpN
 hdmstFeZPN5DpB/LvHCWCDer5KrqjkgcWVbKXlvgtQpGpRGthdBnJCe32m+zpNNXF77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04j4uFx9fy7Yr9m
 bI1zf++riitP+DzBrd3X/47phdmtfto+EzRfBkjPJ7FhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nL4ZAiO0FjQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6nAnoMp33M
 twriCkXttsfFb9dRbGlp/1viJR5wyJSL0Z4LcuZklkIM8jgXlq3NQiFQ1uYcw99WnBmfAa+a
 FVfbLhDbBtABOnRkGcmHVzy9qxWXl2NBKHTk8e/vGx6VFt7SpEJ49y/r1Cop/Gn6hNFqWt64
 n/Q9ZVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjjwQrPMkf0IDduRCdc15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfbWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104/2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6wvPEQYQKaRqXSx+MGLEGBxZln9GEkDPw5jjQo
X-Talos-CUID: =?us-ascii?q?9a23=3AXdTWkWpsC8+iNx1+j8kgqe7mUc0JYFzs7CrzH1C?=
 =?us-ascii?q?TFGQwFp6LZwCb25oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AU7PWAA9X69ZoQ5xXCYzEM92Qf+gr75n3EGURrbQ?=
 =?us-ascii?q?fnPmgDHNxMQWB0x3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Jul 2026 12:09:04 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id EB77818000208
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:09:03 +0000 (GMT)
X-CSE-ConnectionGUID: LU58a8hsRh2+xQsQkvA61w==
X-CSE-MsgGUID: 63v25KeHSeGGYYEwG9+i1w==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,188,1779148800"; 
   d="scan'208,217";a="56695862"
Received: from mail-westus3azon11011021.outbound.protection.outlook.com (HELO PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.21])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Jul 2026 12:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+AjxUfh83IaDCwtYJmW4wUs7+vUJtrKzXvILPrCa9IkHFRZZqe88QVjH5x+Jzgac3TtIJ5wd2yB+gycMKyBLjV03V+jfvRh1toMr/8B1e74hCwxDMCvu3o/MqF0dkaYZgu4jWZ68J1znkfkZU7+cysmCO8f1I0muN8dwGCYU7OdeUjSv4VFr6KO5rJVBNfSM6vUfFzbIIcbsKat/3juUMi0UW5bdH7K47M6xS7Z3bLzx4MYvAr0uXI2TFlWuZh1LpIO6xazG88/r6Sc5Y5eDanPsq8J3vMjLFM0UgiirP4e8S+Ncf3NTWF8vpZZmP1Q8VRXnT4KeVpVUoOZvBCx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIz6g7+hdUT1V9lA2kAiNPvhKZFwsnfp5+B+WpMLT/M=;
 b=iRnKIxYhY+en8wDRdyj3cipKyMfyWBM6bFM0XVCmaE9MVRQIlqhWtr1ZbFZGMPV2IH6VX3iJlwt8+yhM82S4W3AA65iGZM0PdBdIMIp32iL2K0ny6E4Xs5xTSVJ0lc3Ii1FQttaaeNhmst6s2+GGfYN8tC1XJ8pDW2CNGjVRyhXfJoAXxdreJOMSBT0YpybKhGLd5CiUeH6mXDxv+8xrdo9/C5NiiIT1liyXJi915C/qRvsvWiJlMKtc3wkxscoZRWquHvgNJbiAMLJI9SnumuHYRGHEfUGPpPM0qAz02a3M6x1dfZvUPWSxn9twrhk0oXk5Z9ehHL7VX4GDVJXDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 12:09:01 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 12:09:01 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Paul Barker <paul@pbarker.dev>
Subject: Re: [OE-core][wrynose][PATCH v2 1/5] curl: ignore CVE-2026-4873
Thread-Topic: [OE-core][wrynose][PATCH v2 1/5] curl: ignore CVE-2026-4873
Thread-Index: AQHdHaOU7RyORnIPe0m6tRXjHgj1FbaBRbQK
Date: Mon, 27 Jul 2026 12:09:01 +0000
Message-ID: 
 <DM4PR11MB6189DCD6CA0D4215773A0DF1C4CC2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
 <20260720113041.2479444-1-deeratho@cisco.com>
 <DK97W7M88L8W.1HURYFN46R2F4@smile.fr>
In-Reply-To: <DK97W7M88L8W.1HURYFN46R2F4@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|CY8PR11MB7686:EE_
x-ms-office365-filtering-correlation-id: eae03802-6d14-46e1-a209-08deebd7d840
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|3023799007|38070700021|8096899003|13003099007|6133799003;
x-microsoft-antispam-message-info: 
 4d1OsENVnf2J81eM34Hw6hJcXsmJuXIGYaLpkA2auDsMRDi5fMOdW8n9HZQt8AxC/k6oAwZftDS2/UspmKdMejMpEv4J8VRSDYpU+RkIDth0aj5r4YL5OGyD7Mgiw5rK/kjUntleZnEf09fSfhM1r/WJ3M2lv8OyYqCZ1QPHQfTS1MFlK+VmDRq4JYuJn9/vvbSsivw0e5jK9ynTCpBnkZe1CXwmEPF0kg34fzv4lx5xamkdwMhUoP34nzrze2Zddy0u5/ilxIyyBMREwGjMwFhGKK419vB4077WNIRXudgeRJYhbiJZjKqOn6If3luxiUuWsK5EyUTQvnEl9vrEcwHBEUXwCaw5+53QiSgTS/QCFNJroR/zpsCTXzd7vcY2kxVJltNNxbICCSf+8gpBOnsFx6XnsNE37n+lWxT9OIRAPY19lIQ9bbfM4RXik1hz+T7WgsVGt10b5S4Fyq7HvUZ2jBVdnmw4GRu7HwsoGZQIH8qGy24A4fuLZtlCFUF0YqARbMqhCncJtGwISOD0+n0LgiISMBMwlwh8U2phNqsPPgJ/Pzvso94IfLt3c2B33XY+mPZiRSfm6m6G9ROn+hMlKd26ygLD9aIkHjRUoRIXNlEmgbomIjPwPp0pvfnEYbr0qwqLzPm+tQJ8nYX6puxC42SOiQOgDe09eqZgiPQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(38070700021)(8096899003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?X/BO+eIRWs7A7ZvyZPkQHurXja2kxaLSO1xiAyXkWnJwFabYi0111T9PgFRU?=
 =?us-ascii?Q?/eJijJd6cEr4yNVfg9O2IwRXeG/IQBWOUrNjj/coKKugN8T8r2yWGRjum+Ji?=
 =?us-ascii?Q?QlUMzQQc2ySRXfPzpBOdJNYHkh225mK1nmOj1WFhUKmYmLf6srpuM51mqrDP?=
 =?us-ascii?Q?WZCIzQzbOziBeLQ38xHe4oBt3eQ/rS8X+eUjO1G9W6JlQZw7C6os0biRm+Xt?=
 =?us-ascii?Q?xoS3FmXfzgby0mN5cCo1e0TUyDibxj2DeojZoXKhpJj7mPuYjYa9RnNixe0f?=
 =?us-ascii?Q?HenDunkl+v7hyPPBxlfGRpaNOgDuVI6x7uh2swPy2K1C/Y72nLukgGyDYgh/?=
 =?us-ascii?Q?rbtkFVvtQtyI4bwxuLu8Xe2cWq0U2L4gASqvzT+UV+ghx2FBKyx8HEIL392G?=
 =?us-ascii?Q?wC3wkMFO5eCzcQLS5sJDNaF+yeEd8EFaCRDwh+iuKzy1x7Qk6075/SCBq58L?=
 =?us-ascii?Q?tV423coRKy/XvKuFDyJ+4BBhtL5p/lHPMegrE7Gk3Ol/BS1NudY9VSGM5dwM?=
 =?us-ascii?Q?7kOSYSEH/iKOMXeZDumaOLdQEA+9A9hmewR5Lmz80AtSUFt4tUKOrQ1POAyB?=
 =?us-ascii?Q?o1jbLn3gtbLlIr5Wc3ZuNly+z0ZDJaxzF4RuqwDS2s9GAodUDXIz2dBB9p6A?=
 =?us-ascii?Q?PhmIQVulvq/zZRTsLJ87OvJvr1vIErTwKzbhhBwoSHC0Bv3iSflliONXP1Ev?=
 =?us-ascii?Q?RXjK/24dNsw+ePX/eRFDyVTy4oqyQiOOcOfzj/YXjUC07/QqH51E+2Lk6L3J?=
 =?us-ascii?Q?eGEkv8v1c9p5GkhQkVx9oLT42gQjFCCcbP9JeVXPiJ2+GpvmjYvvbfLldG4O?=
 =?us-ascii?Q?XEZL+rRQN6pZgXEIoxlCWEXklx2k1cFsml1t4gfGj4/gLJeG7IRf0llH7olY?=
 =?us-ascii?Q?MMxsqH3Wz30GH2z6Qefx/KEpuZVRS4ZB7MviTzklHTJdQhRXg1EVsfrAxcE3?=
 =?us-ascii?Q?HJcC0miQ0TGhyvzzUOLwDx3KtxOoISYI15aFHKI2D9iWLf9oOvDU0y+U2ITC?=
 =?us-ascii?Q?SFtW3slhq93/bQE2HZPd6epmbHolJu/Y4cKXcYounb9ERHaJMqkiUIHDrUOb?=
 =?us-ascii?Q?QEqjUcLKtZTFUY0yXlZhLZMVq5N2J6qWxwieXyzlRkc4fl/QIxll1sh5EBxn?=
 =?us-ascii?Q?1ZwOrS8UvcZJz7TOZ9GB+sfuRVKrFp+ys7yy6bK+/zyHf6bepisB5sRUVBAb?=
 =?us-ascii?Q?AuSnzhb9EhU2E/asMtfuQErrc3Tf8WFOTNNd1YGJX3kdzyXDH84SRCdOAzQj?=
 =?us-ascii?Q?TtjHRqkH1quTsbqb7w52VpxwJk/sNcNCWgDEgJbI8KSoVRghMSNFx3xCnk7m?=
 =?us-ascii?Q?DHWKtEuT0XHro+l+CWHjPu8gD1K/DRQf+9X3VP/WdABj3wmzjdZZ99bj2ZX7?=
 =?us-ascii?Q?ztnkXBbNXspMwlQhDBZxwrbLz2u74gz/KYszXClsh5VdJs9+zx+0RakOXCtx?=
 =?us-ascii?Q?YNTjk+n3I523JbkEfR/U7qdQ1uB0tVu+crUIUJfUVNE71J0cWop9ssHzwo/2?=
 =?us-ascii?Q?rkhY6io/Y6VqqReqM9XX03r2IKzJKTnNefhRcTwM31wHKeJ8/M+qzVahzp2x?=
 =?us-ascii?Q?/iDManPbXYU3b+gkovBykAmlMvRPFGajTicvvVUgOr/m9fHuN5LsP4xrsLhN?=
 =?us-ascii?Q?pjw1iU5BsVBM9C+NBRNeSv6SEp4P9geAvgVmbZIk3G+9RFB1LLw25JMEdaJY?=
 =?us-ascii?Q?p6t1Q11Actvb6PxLImpN1ZWvST6wlsIgeEk9aOGmMhAXSWu+?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189DCD6CA0D4215773A0DF1C4CC2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	epqfitMvAWrs1QvGryh9kmQbZvAyehTcj2cs086YNLSRxCcCUZnKhm6zq8TurTIE3+AKb1Pa1OdOcqY+WTOh4ponMaR6UB04Av5nOvYlgzJwRXjMPc5s0aMKePAvWC1DZrWVJyLK6M3J6SMm5JpejEcd6rrmGZds2GlPlJ4KcMB3DNl1pYLikufnCRj173Wlio6th5Ptzbl8D0axBBIETFq9B8INVwosKVfLJGDUxNNJ3vJ45PZVkv/pPDAix6uEk7Zk/t2qJrykWSeQl5R/blNXERn4UHUKHhP2/ahFQfelOdujDElhccPC8cvKreXEyOy+9gyvgco3nGnoGOvHZA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae03802-6d14-46e1-a209-08deebd7d840
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 12:09:01.1382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsWWLXMqaId2BLRfZGyKrBQmG1QkADKATOm8oFqfLcIcunWUQPEL89PFTwNkV4anURiDiC8RC75eDyeVCZBM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242091

--_000_DM4PR11MB6189DCD6CA0D4215773A0DF1C4CC2DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent the updated patch here: openembedded-core@lists.openembedded.or=
g | [wrynose][PATCH v3 1/2] curl: fix CVE-2026-4873<https://lists.openembed=
ded.org/g/openembedded-core/topic/120465499>

Please review.

Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, July 27, 2026 2:10 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Cc: Paul Barker <paul@pbarker.dev>
Subject: Re: [OE-core][wrynose][PATCH v2 1/5] curl: ignore CVE-2026-4873

On Mon Jul 20, 2026 at 1:30 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In wrynose, these protocols are optional PACKAGECONFIG entries and are =
not
>   enabled by default in curl_8.19.0.bb, so record this CVE as configurati=
on-not-applicable
>   for the default recipe configuration.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> - Changes from v1 to v2: Refresh the patches on top of the latest
> wrynose branch.
>  meta/recipes-support/curl/curl_8.19.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index 3326f478b5..1cda69401b 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D "4eb41489790d19e190d7ac7e18e8285=
7cdd68af8f4e66b292ced562d33
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
>  CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VERIFYPEER was disa=
bled on google cloud services causing a potential man in the middle attack"
> +CVE_STATUS[CVE-2026-4873] =3D "${@bb.utils.contains_any('PACKAGECONFIG',=
 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop=
3/smtp support is not enabled in PACKAGECONFIG', d)}"
>
>  inherit autotools pkgconfig binconfig multilib_header ptest
>

In [0], Paul wrote:
> could we replace this with a backport of the
> actual CVE fix? It looks relatively simple [1].
>[1]: https://github.com/curl/curl/commit/507e7be573b0a76fca597b75

[0]: https://lore.kernel.org/openembedded-core/cover.1784740870.git.yoann.c=
ongal@smile.fr/T/#m3759a41c8902eec71c87aa6db4ed2cfd406834c5:

Regards,
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB6189DCD6CA0D4215773A0DF1C4CC2DM4PR11MB6189namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have sent the updated patch here: <a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/topic/120465499" id=3D"OWA08db29bd-5dbe-62c3-5598-72=
dec94efff9" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org | [wrynose][PATCH v3 1/2] curl: fi=
x CVE-2026-4873</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Please review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Deepak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, July 27, 2026 2:10 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> Paul Barker &lt;paul@pbarker.dev&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH v2 1/5] curl: ignore CVE-2026-=
4873</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Jul 20, 2026 at 1:30 PM CEST, Deepak Rathor=
e via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiate=
d with<br>
&gt;&nbsp;&nbsp; clear-text IMAP, POP3, or SMTP can later be reused for a T=
LS-required<br>
&gt;&nbsp;&nbsp; transfer.<br>
&gt; - In wrynose, these protocols are optional PACKAGECONFIG entries and a=
re not<br>
&gt;&nbsp;&nbsp; enabled by default in curl_8.19.0.bb, so record this CVE a=
s configuration-not-applicable<br>
&gt;&nbsp;&nbsp; for the default recipe configuration.<br>
&gt;<br>
&gt; Reference:<br>
&gt; - <a href=3D"https://curl.se/docs/CVE-2026-4873.html">https://curl.se/=
docs/CVE-2026-4873.html</a><br>
&gt; - <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-4873">https://n=
vd.nist.gov/vuln/detail/CVE-2026-4873</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt; - Changes from v1 to v2: Refresh the patches on top of the latest<br>
&gt; wrynose branch.<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.19.0.bb | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-s=
upport/curl/curl_8.19.0.bb<br>
&gt; index 3326f478b5..1cda69401b 100644<br>
&gt; --- a/meta/recipes-support/curl/curl_8.19.0.bb<br>
&gt; +++ b/meta/recipes-support/curl/curl_8.19.0.bb<br>
&gt; @@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D &quot;4eb41489790d19e190d7ac7=
e18e82857cdd68af8f4e66b292ced562d33<br>
&gt;&nbsp; # Curl has used many names over the years...<br>
&gt;&nbsp; CVE_PRODUCT =3D &quot;haxx:curl haxx:libcurl curl:curl curl:libc=
url libcurl:libcurl daniel_stenberg:curl&quot;<br>
&gt;&nbsp; CVE_STATUS[CVE-2024-32928] =3D &quot;ignored: CURLOPT_SSL_VERIFY=
PEER was disabled on google cloud services causing a potential man in the m=
iddle attack&quot;<br>
&gt; +CVE_STATUS[CVE-2026-4873] =3D &quot;${@bb.utils.contains_any('PACKAGE=
CONFIG', 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text =
imap/pop3/smtp support is not enabled in PACKAGECONFIG', d)}&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; inherit autotools pkgconfig binconfig multilib_header ptest<br>
&gt;&nbsp; <br>
<br>
In [0], Paul wrote:<br>
&gt; could we replace this with a backport of the<br>
&gt; actual CVE fix? It looks relatively simple [1].<br>
&gt;[1]: <a href=3D"https://github.com/curl/curl/commit/507e7be573b0a76fca5=
97b75">https://github.com/curl/curl/commit/507e7be573b0a76fca597b75</a><br>
<br>
[0]: <a href=3D"https://lore.kernel.org/openembedded-core/cover.1784740870.=
git.yoann.congal@smile.fr/T/#m3759a41c8902eec71c87aa6db4ed2cfd406834c5:">
https://lore.kernel.org/openembedded-core/cover.1784740870.git.yoann.congal=
@smile.fr/T/#m3759a41c8902eec71c87aa6db4ed2cfd406834c5:</a><br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB6189DCD6CA0D4215773A0DF1C4CC2DM4PR11MB6189namp_--

