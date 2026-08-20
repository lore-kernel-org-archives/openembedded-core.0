Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22FCC5DF81
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:11:10 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3069.1787217060598279062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Z2e10bZl;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11136; q=dns/txt;
  s=iport01; t=1787217060; x=1788426660;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=KfJWdWZ10TdaWO1q/Nqa61r3zXKllHReRgQzuUwwkZ0=;
  b=Z2e10bZlssFDTcSdlJo+R4b04I8EKzUBjwbIKVVHUAAKAWAEioyOUGlo
   E/oRD2YLoKN8l8SEOWgpQZpqZ/v9/l1SRG5ZGmw7sX3UqCDivMu2OoMwX
   vzbQgNshmCvIeoITgydrjDW3nVGDlZGmDz8opLk3AqteMQv7UJK+pFN96
   0frltqVQo5R8aFc4Ma3Lxfs2Nn5Ksa2KrXvRtSf6Bewr8rwHh0x2yAzJx
   tNaYvhpiBszfz0Frz7ghk0nuvJFCZzv9IZ8b6SIrLKjGshOR5KqaMahMr
   uBkRrx7T/ObFN2gkNR79mqrQ87LzVIFpiP8m+P+M5/v+Dlelp8sSc/1MG
   A==;
X-CSE-ConnectionGUID: oKTxCBGqQrGRImqkEJIKgg==
X-CSE-MsgGUID: Fa+CVSUwRmSjWFYwQf3CIw==
X-IPAS-Result: =?us-ascii?q?A0BwAwANxIZq/5X/Ja1agS6BK4E9ATBTgQgCgSEaL4gjA?=
 =?us-ascii?q?4UriHkDnhuBfg8BAQENAi4BFQ0EAQGFBQKNawImNAkOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBeBACAQgRBAEBAS4nCh0IA?=
 =?us-ascii?q?gQBDQUIgnuCHRZBAwECDrgfAooceIE0gQGDaAJD3AwVgTiFP4MDGwEBBSVJb?=
 =?us-ascii?q?IJdgSMYARuEYScbG4FygVeCaT6BBYFcAQMBF4EdKzyDV4IwBIIiehIbgi0EF?=
 =?us-ascii?q?SaBVI5vUnIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxceWBsGB?=
 =?us-ascii?q?RIgKkFEIwM+OIEIQQKBdT8jGTZ8gQlegSsqYQECEBdGLhWCCgKCcIEoXgIBS?=
 =?us-ascii?q?UUOCRcLbT03Bg4ZAwSBNQWNZQdbIIJMFYEAIAQwHyQlNTcPAZNlj0GOYJUXC?=
 =?us-ascii?q?iiDdop7gSaNPogyF4QEgVeLPZlUC5h9I41nlWAghQ4CBAIEBQIQAQEGgWg8K?=
 =?us-ascii?q?4EcCwdwFTuCZwlKGQ9YkUuBf4MUxwZ5AgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:DVLntxaE99VBbsFIELOgJYD/LTAchN3EVzX9orI9gL5IN6O78IunZ
 grU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:3hyO56t/z7bb93SsNmFUOD347ufnVA5fMUV32f8akzHdYApBsoF/q
 tZmKWCHPPmKYWv9f9tzbovjpxwPuJLSyNVlQAI5r31mEntGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/cVLEUpk2
 uUhMh83TxWahM+U4ZG0Rbw57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4XbFZkKxhbAz
 o7A10rwQTokD+GA8z++8E2Ct/D2k3jQeZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2QHY909v8hwTjsvv
 rOUo+7U6fVUmOT9YVqW96yfqnW5Pi19EIPITXZsodctizU7nLwOsw==
IronPort-HdrOrdr: A9a23:Msux5aMn9uRmhMBcT8H255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NaZLUbbUQSTXftfBOfZslnd8mjFh5FgPM
 RbAuZD4b/LfCVHZK/BiWHSfadDsby6GeKT9JvjJhxWPHhXgtRbnnxE43GgYzVLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRi+erAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 B2NiOixt9q5CH77WPADuvzJldXf42P0CMfeNso/jhiuE0lGedsRMIkjRho+dw7bVLHAcgcYZ
 pT5YfnlbZrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomJrdLQT9TpF+CTZ9U1wqa7UR/R/lp
 b5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZes60l/22tbKCY8OlaqXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/HBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKh+zi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHjZpY5ummmZ5rAQD2JwXsrKtmuwwE68vl4CrFx
X-Talos-CUID: 9a23:EsSnPG5PZvl+nDieLtss820oCusPXWTk1ljqAkqhCktLaZ6aRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3Aar+Pvg7R+Re/GREmksqnv4cqxoxG6ueFNnswjq8?=
 =?us-ascii?q?DgMu7Gx1vAjnGpxWoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:10:59 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 8F15F18000276
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:10:59 +0000 (GMT)
X-CSE-ConnectionGUID: ntYMjBWhQUC7yAbMcbRSPw==
X-CSE-MsgGUID: u3FVNxD9R52qwxQjAgrMxg==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208,217";a="72067377"
Received: from mail-westus3azon11011068.outbound.protection.outlook.com (HELO PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.68])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlKYEsjXLxSlcp5AhvxzJ9zFKDYYO9H+7j44OuJ//wQw9L/YifVVMTEgdFloYqmEDsPWzNhh9MrJz7T5r879rdESk5ZKStRl3tesH62t+Sl02XnK82qYGhGWRy5YMjanne6dXQZgSxBrDe/7EJVFq0qczq6uJN/J9FCcu2wNCu8K9l8MVRgIXozuJ0/vBJtUsdXYr04kuHMVB+jV6jcSP8BN+8PZHzPAc6JNCyE/dQ8W2yrNStz+9bv2SNW+lz7eYvOazSK/bXuiEBivObQ3YXdHDjFB9cQuGYkWL9vbRnKFkFKHGTx7JhgXOeqd2F16aalJLLnX2zHFNvZnMOllNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfJWdWZ10TdaWO1q/Nqa61r3zXKllHReRgQzuUwwkZ0=;
 b=IlQm8WFAR1Pg4InD0mQV9i3I0SJKrlaBZUsnzLfby2cshUS884Ndia5g3Uk115IBNvIMIb2qN6rp4DTjD+vSw7fHYtfsrUWKQRp0Q9fHUEIw2JGnK5RlF6ZOSMjAQYDUrbKRyYznqdZw3rvwzY1iSICgYiDN33qadRIRxTyU7ERKcNa3oO9YsKLAx4ICSknWSlK/GDgQU2uhh2yfZGlf0i5PMmgW/8E5OAXoFzbmtvg8SWYnh6pzu1SOgXWBfcSgNuemof2Y+QTAJd7vpBOxboWQNuN6XPgnOXT8ARJXfAHJlZ+vpshIfNwUZxspB8T0ELyZEXjqxg9sjRIK63JW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 09:09:56 +0000
Received: from PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f]) by PH7PR11MB8598.namprd11.prod.outlook.com
 ([fe80::18b7:978:c9e6:2f3f%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 09:09:56 +0000
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hthakar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Hetvi Thakar -X (hthakar - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
Thread-Topic: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469
Thread-Index: AQHdGcKmH0rsILOl702okFbNKKNK6bZ5z52AgAD72xuALAgV9Q==
Date: Thu, 20 Aug 2026 09:09:55 +0000
Message-ID: 
 <PH7PR11MB85986421972394BF2C2D53E8ADA42@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260722101230.34771-1-hthakar@cisco.com>
 <DK5AB0SRDKFY.7NIL8TCKZUUN@smile.fr>
 <18C4DECEC4DDFC1A.1355869@lists.openembedded.org>
In-Reply-To: <18C4DECEC4DDFC1A.1355869@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8598:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: 1ca704d5-4f13-4b9e-8a2f-08defe9acd8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 16Puxp9yHdLBK+JBVSEmJ8efAuUIQM6e6KqQS/SgmTCpj74FxYeLK+8sHP25LwkH4PFqNkUih1/UfUHdZ83gD7wjFEnvixF85vbQcAIcim/Qp4UzuxsB2HovpodGu+WjHUy6UFsC3S61MEZZOsgwTkjWhnHoCn7efnKG5pq6P30UBaZzRNATdEJ9U+ZOsAVgM9wJFEhVbt5kQUK2iRXfY14uptX71mM7nIAr0+TXaXzFc6Bmvc3/+VPvPaWYM6w5P5TyPrrkkGo33lEJ0zj4oS15xv6BDBSjL9Tqfrw8XeD2sNAdkjeubdWwKoVMVD00njYAnpSYvh7RMqF2xj1NdxCP3JcUAqG15p23CJ5w2OSS0CaqIZKQchRzcQY3XW5+eEKsrMkwNpgc0DDJ9UQlCI1xt4U2jMzaqudQ3/B9FhIbF0wwoJbejmsei3sYRg6jGRlV8wlZ8MJupc8Ve46Zi/pd4ZEQo6PFv1c6tjNi0fFcgpnEXW3zPwhlsSJXHbyz60i8nxshYcjL68fUS5GtPIn6JigMwRkL4j3ceMNctuBP4srXLlarQmjYGElASp2hTAXcT7SgPg2wAWYK6P0D+IFvzqjrAOq7QmXx8y9R3KfjfZ4aVEtwiTitLrKZb+TfUi5ipu4cJHw2TJAIRV8yRJh2bSuBs61Tu/o2GyjQduQG1Z3owig7kDyupezh3rzXDFuSW6i5cMdB73/mfvEualAGCfKiadxFVxUtHganki0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?h8eymFYvPwk38LiDAeUraKVXZhH1Z6gBM62J2GfkLplUvLorTvaJlaVfApYU?=
 =?us-ascii?Q?sYYiFnzoRPfvuXycMGat1NGYBXHxRszxhphqkB0hTuOfYkZnM/SzYu3a8Uo4?=
 =?us-ascii?Q?uhVLQtCalpMJQA7AZiP2d8DLyIs1dvIIMHBAvJ+OD4bB+t2lVc9PWXEWxpwv?=
 =?us-ascii?Q?pe8BJsZ4ZfyUbrYI4oQxyuKAMr4xstJJezfQ3Mr+8QSKTT+u5oXbsSrOKbpZ?=
 =?us-ascii?Q?izUP85awWqWmRvYm3f5G6hHtzm6n7uSE3Iaf4TJ18FhoX9wgSgAM9NNUkWsV?=
 =?us-ascii?Q?p5lRz+5bbRzwkAdjlVlsoc5J7BaAGSiA8BjNnLRJUUXsehyX221pP4s7cLd6?=
 =?us-ascii?Q?97NWvW+A72NBxHsbXmN67Demq2w+GtwLIgQwZKIeMNOyn6rXGXzKw2bdlchN?=
 =?us-ascii?Q?Khz7EMrhcg/cOrAez/xK3o80UwA3DqOruL5fwSRZM0KMY77TL+oHfpSFPanS?=
 =?us-ascii?Q?OuJH2ZHBeouOjiNAzobCJYYf79xPATnLBPmHyDB4lJXNGvRlMsxe9fHuRf+s?=
 =?us-ascii?Q?UcYZ+yCq+J6NdEpJY/3zQxFr1HkUsKBZdGtZMlpQzclI6qe/vjlfFwKNfaRq?=
 =?us-ascii?Q?4XVYfaLkJhy+EC8f7GzgnacCtmPwuAeMRZqmG3I9YvFHK0MxBRVaTjHKHl3t?=
 =?us-ascii?Q?YnGcZCFv8vjviBVMRMcp5bDk3kMbsltu2TKX4GroAm0bJ6mJsQVGRB7jCZiR?=
 =?us-ascii?Q?rPzNI9LJ94haJGupUwlfYEUUT5w+1rb7x4j6TXup8JU9GrHTSegay+nhA6Uq?=
 =?us-ascii?Q?r19uh06ndScGofSH/KdzhR/uH8NxAValKwzJOihmQG3LpphZdtj6aEAqkuu5?=
 =?us-ascii?Q?gX+L+UUIAP1deo6BeMl6tIpHZsiXNThmpv3SSl5Yq4HUn4AtFa8IHxpVMbLg?=
 =?us-ascii?Q?3h0zranjDDKQ/SIk9n4a13P4HkcDT/iYHiTR5v+SblRoVp2oGiAdo2r6Xu8j?=
 =?us-ascii?Q?cWCXid0+BYxkE+CllOnp+PC/dXV5pzqUxKcROHBxr1673MyE0VxqUyeRSsfY?=
 =?us-ascii?Q?kIBGmwfQwhelvlpGvtjSQCTUMoFDkngbxw/baIEBXR/HTCk+39BDtwg1RvuQ?=
 =?us-ascii?Q?AT3TUhuKfNq04yb+gut4Ed6qaRPvX1upxHFgK+XU1bxXpJvV4XpgfNf6vwWL?=
 =?us-ascii?Q?WxWZV9xAoCAX4v84sodlUqowpzjcC4jZuAP5Er+xtgLHzSVNx0xwJkLx8/W/?=
 =?us-ascii?Q?sCZq5lnKPxV/OzvOgR+4d7XaSz5lFzKxwnNHFerDhNR0GSzR8EIIW/lb3WF1?=
 =?us-ascii?Q?8GlXJsw6+IJS+K4s0shUluZXYor9PA/w//B1IFsgiaTs0K7k3OJh5eCi7YFm?=
 =?us-ascii?Q?/XD4fO5Ir33ecfKy/0je9wGvu8/bNcYQOOejICCr7PXGtsWxKAc1rXULpRrJ?=
 =?us-ascii?Q?er/UvEdtK/d4ARIkd6w1aRlBv2vM8JAskXhl6bTHwaZ05ZUANbqbLfo+8L+c?=
 =?us-ascii?Q?KsOdvzl06trDBnF5ICE5DEHDUBo0OFUozzmU9dF3wvmOVHFknN7OVsCPxQ1j?=
 =?us-ascii?Q?ASkRzIZb4EDS2Y945GGxE3LGoNPopzSsf4nrm838XaB4bnWaC8xtaPaPQeiV?=
 =?us-ascii?Q?+ywcDHVUIIzBR8HzBfVoWqrkVAbK+UNa8Fz2KBnX8Wi+nxntmeyhYFNDaeSz?=
 =?us-ascii?Q?RzmMjimg9B4DRPpixMnJ4g93o8BwnOaSydCBd41w3mYP0U4C+P0HeamZqtiJ?=
 =?us-ascii?Q?V5yfEYQkn6VWphtgMofzEv+n3sJu7VCu/+irkKNRiUs7xx5x?=
Content-Type: multipart/alternative;
	boundary="_000_PH7PR11MB85986421972394BF2C2D53E8ADA42PH7PR11MB8598namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	KokgNUlPVDTUUpu5Emd4OMB4oHUGAj7NiEkAnrLKmN9rZQYLh8K5x5BIjU94IQtcl4NmAdOF2vSm0mUInkg5Ay+QW8OnNAEM0xFf6Vq1t6f/4TttqOWB0R5GDd+KlMSc7maxIQKWNql3jqPs63UmJMGTKmcVYUJZgGxzyrdZpU4yrUy7jydhltf4dPVJ7+6UTPkdF0Y/KhncZC/x6fwBhA2kc3nExlAk+F3xgZkoYSUVTyVgrnm4fNRhAB5TTp/I2Rn951SUSUl/ZsW8cIkuz01uOHBbVgEAXsmMUAkBnmGbHrUdK/8X3dpeemnVpNLa3IJK9BYiGbuuJl3zhaMOlw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca704d5-4f13-4b9e-8a2f-08defe9acd8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 09:09:55.9789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPXjHwNdVr2UXpi5p0yM2+lhf4Xw0ZAQZq3dHnanaDU3VB7rYlHvGumCSBwbs98IIOv9LYqYCnWHHGrLc2nKKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243843

--_000_PH7PR11MB85986421972394BF2C2D53E8ADA42PH7PR11MB8598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
I hope you're doing well.
I wanted to follow up on the patch below. It appears it may have been misse=
d during the review process. Could you please take a look when you have a c=
hance and share your feedback?
Thank you for your time.
Regards,
Hetvi

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE =
LIMITED at Cisco) via lists.openembedded.org <hthakar=3Dcisco.com@lists.ope=
nembedded.org>
Sent: 23 July 2026 14:15
To: Yoann Congal <yoann.congal@smile.fr>; openembedded-core@lists.openembed=
ded.org <openembedded-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469

Hi,

I reviewed the earlier series.
It looks like the follow-up upstream regression fixes for
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
These follow-up commits are required to complete the backport, and I
have included them in my series .
I kindly request you to review my series as well.

Thanks,
Hetvi Thakar
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 22 July 2026 23:13
To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hthak=
ar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-core@=
lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-58469

On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> It also includes the upstream follow-up fixes referenced in [3]
> and [4]. These correct the trailing whitespace check introduced
> by the original fix and add the required <ctype.h> include for
> isspace().
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7=
a4fb0b6f7826
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
> [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a=
00386c3f3bcf
> [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac=
298c24fe00a1
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

I received another similar series 2 hours before yours:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48993
Can you help review it?

Regards,
--
Yoann Congal
Smile ECS


--_000_PH7PR11MB85986421972394BF2C2D53E8ADA42PH7PR11MB8598namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 11pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 11pt; color: rgb(0, 0, 0);">
I hope you're doing well.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 11pt; color: rgb(0, 0, 0);">
I wanted to follow up on the patch below. It appears it may have been misse=
d during the review process. Could you please take a look when you have a c=
hance and share your feedback?</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 11pt; color: rgb(0, 0, 0);">
Thank you for your time.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; margin-top: 1em; margin-bottom: 1em; font-family: Aptos,=
 Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; f=
ont-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Hetvi</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE
 LIMITED at Cisco) via lists.openembedded.org &lt;hthakar=3Dcisco.com@lists=
.openembedded.org&gt;<br>
<b>Sent:</b> 23 July 2026 14:15<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; openembedded-core@li=
sts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-5846=
9</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Hi,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
I reviewed the earlier series.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
It looks like the follow-up upstream regression fixes for</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
CVE-2026-58469 and CVE-2026-58472 were not included in the backport.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
These follow-up commits are required to complete the backport, and I</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
have included them in my series .</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
I kindly request you to review my series as well.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Thanks,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:11pt; color:=
rgb(0,0,0)">
Hetvi Thakar</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yoann Congal &lt;yo=
ann.congal@smile.fr&gt;<br>
<b>Sent:</b> 22 July 2026 23:13<br>
<b>To:</b> Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 &lt;hthakar@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;op=
enembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/4] wget: Fix CVE-2026-5846=
9</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Wed Jul 22, 2026 at 12:12 PM CEST, Hetvi Thak=
ar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedd=
ed.org wrote:<br>
&gt; From: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix as referenced in [2],<br>
&gt; using the commit shown in [1].<br>
&gt;<br>
&gt; It also includes the upstream follow-up fixes referenced in [3]<br>
&gt; and [4]. These correct the trailing whitespace check introduced<br>
&gt; by the original fix and add the required &lt;ctype.h&gt; include for<b=
r>
&gt; isspace().<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153=
f69537c7cbc2a7a4fb0b6f7826">
https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4fb0b=
6f7826</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58469">https:=
//nvd.nist.gov/vuln/detail/CVE-2026-58469</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77=
bde220fc575c8a00386c3f3bcf">
https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a00386c=
3f3bcf</a><br>
&gt; [4] <a href=3D"https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc994=
2b78b2bf736aac298c24fe00a1">
https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac298c24=
fe00a1</a><br>
&gt;<br>
&gt; Signed-off-by: Hetvi Thakar &lt;hthakar@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
I received another similar series 2 hours before yours:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D48993">https://patchwork.yoctoproject.org/project/oe-core/list/?series=
=3D48993</a><br>
Can you help review it?<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH7PR11MB85986421972394BF2C2D53E8ADA42PH7PR11MB8598namp_--

