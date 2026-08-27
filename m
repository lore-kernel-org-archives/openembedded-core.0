Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6A3C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:46:25 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35233.1787834777573034246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 05:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P36IPk27;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5568; q=dns/txt;
  s=iport01; t=1787834777; x=1789044377;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=nsxY3ZQnBRW8muUG3EkevTBkhOZrJ9Qt1TufEJBEiPQ=;
  b=P36IPk27OIRfbIyOqXaUZ/kxP8N3puQzlsuMTtl2E0gl+63N+wTn3uRd
   +TdnsO7yG0Rpzs6aC2vF4wrzVB6d3p+3emucEwYW2G9VoAp/GY8Mi80v5
   j5qCf0tc8Nt3/0W9DPSyiRIJPzvf7mjTdXM5DuC48b5trjA3V3FtDePYA
   R7HUnHZ/HRbHmIlGZF8PuKvjWzoJ3DrBp0mgORizWuANmCs79q3nYNEIi
   65PGhTl2a/zhfAEXHY5do8SOkWJqyBMzdvRf28dapCZCARnaZxN6m5sLC
   vm69V3jwr5pEuIdm+q9KgZWtvrPAxAjGfmKM6VaK4PJa1S1vhEw6g30fj
   g==;
X-CSE-ConnectionGUID: A4H+qlNOSMqOLAhiwkTiiA==
X-CSE-MsgGUID: hU/x0KzFQSq51SN9w0posA==
X-IPAS-Result: =?us-ascii?q?A0DXBABZMJBq/44QJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkEiB8DhSuGWIIkoBkPAQEBDQEBLgEbBwQBAYUFAo1uAiY3Bg4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwGBCAIBCBEEAQEBL?=
 =?us-ascii?q?icKHQgCBAESCIJ7gh0WQQMBAg61KgKKHHiBNIEB4DkVgTiFP4MeAQEqgTWCX?=
 =?us-ascii?q?YEjGAEbhGEnGxuBcoFXgmk+gQWBXAQBF4EdK4QTgjAEgiJ6EhuCMSSBVI8jU?=
 =?us-ascii?q?nIiAyYzLAFVExcLBwWBIxAzAyAKLy0CFA0iDxoFLR1wDCcSDx0XFx5YGwYFE?=
 =?us-ascii?q?iAqQUQjAxMrgRlBAoF1PyMZNnyBCV6BKylhAhAXRi4VggcCglqBJ14CAUlDD?=
 =?us-ascii?q?gdHQwttPTcGDxkDBIE1BY4DB1sfgVuCLU8xgRM1onKBfIxklRcKKIN2jCKNP?=
 =?us-ascii?q?ogyF4QEgVeLPZlUmQgjgjaLMZsOAgQCBAUCEAEBBoF+JoFZcBWDIgkKQBkPj?=
 =?us-ascii?q?l+IV8cGeQIBOgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:WSHl/xQfWaBqmhUvbOCZ1RFZvNpso47LVj580XJvo7tKdqLm+IztI
 wmDo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:JdtHVagIZbfSHwnqNcvdLL2bX161OBEKZh0ujC45NGQN5FlHY01je
 htvW22DPvmDMzD0coh0Pd/g8EJX7cKBytYwTAZqrXw2FnhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jc8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUxpsY0GGVo0
 sc9MRcpRxCCmOGKwbOSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYD/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKFI4zaHp8Nwx3wS
 mTu/1m+Ekk5JvKm8iPYq0mK1/CXhSTgcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:27UWHKkxYjF+ngwoffQR3Pe/u9/pDfMliWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj+fZq9z/JICPoqTMmftWjdySeVxe5ZnPDfKlHbaknDH6tmpN
 tdmstFeZLN5DpB/LzHCWCDer5KrqjkgcWVbKXlvgpQpGpRGsddBnJCe36m+zpNNXB77PQCZf
 2hz/sCjQCNPV4QacO2DGQEWe/sm/3n/aiNXTc2QzQcxE2rlz2H1J7WeiL04j4uFx9fy7Yr9m
 bI1zf++riitP+DzBrd3X/47phdmtfto+EzSvBkjPJ7FhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nL4ZAiO0FvQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6nAnoMp33M
 twriGkXttsfFH9dRbGlpz1viJR5w2JSL0Z4KguZklkIM4jgXlq3NUiFQ1uYc899WnBmfEa+a
 FVfbHhDbBtABKnRkGcmHVzy9qxWXl2NBKHTk8e/vGx6VFt7StEJ49y/r1Dop/Gn6hNEaWt64
 n/Q9dVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjnwQrPMkfwIDduRCdQ15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNffWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104j2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6PvPEQYQKbRqXSx+MFLEGBxZlg9GEkDPw4jjQo
X-Talos-CUID: 9a23:g46XUm+WsXZ7t+uTCyWVv2dIOoM8dlv691LJBGuRCWd2S4GUSHbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Am7lKMQzZXQ/qJuUbtwHaDzz+p6SaqKSTT1BVsoc?=
 =?us-ascii?q?ogvKdaHVLHWaC1CywWaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 12:46:16 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 79D8618000213
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:46:16 +0000 (GMT)
X-CSE-ConnectionGUID: GVBkjxwTQ86V4aMcnUr2RQ==
X-CSE-MsgGUID: qm955IcfQTuNVK/6tbFhzw==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208,217";a="84838942"
Received: from mail-westusazon11010041.outbound.protection.outlook.com (HELO BYAPR05CU005.outbound.protection.outlook.com) ([52.101.85.41])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 12:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYPNa015U241o9G4Owc476/D1Lg5Vl4vXy0DNvp4UDLQjyXMkyBeDnPt5fJXCGSfFQRYv8kPgxkqjPYMq6kmt1zFoBGID1i/SlIlrrs5zp+32hUhKYdjEq26fXUxah8hG0UEYi4vpQy+RjIP1kdw9xHf02782Cbg3hF2LZ6ubjtPFhhuX/hp4Q5EZ1Xi8LX+xde+6Kg0OnYFx7gYhX/gf+hqcBaUnapvZr/8YF1cFQdAiFu/SPAq+vr2Ni42Y1aB0kVdsped2ILu6hYJGI4Gtie0UZ9i2esDqf+9gI0XAAuoY9SZIk3gUmkdyb+u+1Oh3u450GO2BoHe1JVLGt95nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsxY3ZQnBRW8muUG3EkevTBkhOZrJ9Qt1TufEJBEiPQ=;
 b=gQYS6Cn/Yn99PH0FUiwsfUabVvJwlJqHf9ajCKwT8v/KaI0ptwDXgvPMtV6rFjsFxKUI1Hb4MvIm52wdOgVviEAOvIZdsxlJBXDuadqHUNutRnytluxRXReR+iuo8JMNoJ9YvyGq2IEyxF4aO+qFV7i192jVn3Fq21tFesz5MCpE4yTTlEtTkc7v16uK5vjpdSmLjUWNA04lKLUj04nw4NplCyjzKMbH9MAj1caveOOKP3DrTVi+zfVYsw9m65/pfdUvPusUnxXTjkcK9XrY9nL1L0P5VV5LOBK9BXRC8Ulv+GhXn1br0nvvYD8rsWwCj1TgnpaZJEwCxFzTi8QN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Thu, 27 Aug
 2026 12:46:13 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 12:46:13 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2 1/2] binutils: fix CVE-2026-3441
 and CVE-2026-3442
Thread-Topic: [OE-core] [scarthgap][PATCH v2 1/2] binutils: fix CVE-2026-3441
 and CVE-2026-3442
Thread-Index: AQHdDtOADo1IfZ9Q5UWPQDIveazUvbayCVcAgAAXTICAAATetQ==
Date: Thu, 27 Aug 2026 12:46:13 +0000
Message-ID: 
 <DM4SPRMB0074E56FF30DBC0264DC3376C4AD2@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
 <20260513172734.3995341-1-sudumbha@cisco.com>
 <DIZPUVCH66VP.2S19RRFXIN3RT@smile.fr>
 <400669.1783512925172136878@lists.openembedded.org>
 <2326647.1787828526675209926@lists.openembedded.org>
 <DKZQ3D64CM1E.3IRQBQ2SFDOMA@smile.fr>
In-Reply-To: <DKZQ3D64CM1E.3IRQBQ2SFDOMA@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|MN2PR11MB4661:EE_
x-ms-office365-filtering-correlation-id: 614148db-722c-4f60-57d2-08df04392d8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|8096899003|38070700021|4143699003|22082099003|10067099003|13003099007|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 k1ZwJRzAa/jjNxUH3FjybgXBv/98xVpVykRy3z8sxL/fScDqy8n1eayfqyQo4QsDZqF33Qu6MNr4b+ShVr0/aGuR0NUnH2iSkQmiLJXlfmHapinC0Jrxfv4SYrmzVwS3/dARtG09U4SR8uQ6/TwhtWCAOn8vY7N2j84SF5AGtEhV/vK4t+kkgAo3N6f978WmgPpQgEfj3unh2AjyvqSidJyoNiAKQXUhisK4HtGWyjtfyV5R5+rrZ3aTFk628YX4AID3Dt+ra1p0F6dggneRkDTUmT2h6Nm60qXVTNR0h1JYgpxZSM4VunlojqXEDsg+47j64S5v8nxVQbL83KnhtWdNSWG5YZ5BFkEuxt/RD1dbCbV0A5EpTnoW5SNY7rZopsaUoAEnAOC+JNTYduogjQ7u2i3jFfYgLOOzw00tWZWaskinJ3El6155BgsoK1d7LScdWOQTVTLHqlC2i34BE5XRrf4/d9ILQdJC5UwW5C6ekK/PH/MlMo3BtAfbMHDTNUhA5+c89/BhNK0tOwvva+nV3g3o/McZ1ZQzUZjjBBPbawgf3zBmGnRW5BjKh8PZoZVUnXEZ8XiRLnToB3fyzordb/iDq6UCVbx3RRyb3pF+r8pXodr3v+kc6Knx/7xO3j+MHIpqHXWm7V+depetOO0T4krdKN9tzxG0oYD7log=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(8096899003)(38070700021)(4143699003)(22082099003)(10067099003)(13003099007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+4TzzQawBhIcle75vU/1JZ+0sZtte4LejvDeH6pJTdkas+d7Q0Xa6tANdm?=
 =?iso-8859-1?Q?DLXeQLYGOpXiBPB/FcgUphPllbrBLIB6AzABnPE7HcUlVAUUe4hPZbLLlz?=
 =?iso-8859-1?Q?T5+wtVpqg0N88/PIc8YqhK0DBMVKqrsvmFMwVNIOWRWuJG/NFJb+dUK4/1?=
 =?iso-8859-1?Q?ZqbYJGjUymGzCEDh083ASO6jm3I109Xt9s7QA/w7D4hvfuVuEj8hSuBQ3i?=
 =?iso-8859-1?Q?3aMvm8h93i+TjfeoelMFWKG4ERpzy0DgVw4DSMPOAqMGD9iq4Em+89mdHk?=
 =?iso-8859-1?Q?gWFLtqW/0b4qeSbr36o4QuwtNASFO32/f2iotnmnjaTD4QNvKqPCKoZkrZ?=
 =?iso-8859-1?Q?BAiybSZhco+wGZpqoT6jem+cfAXH6fCSiidhRao8OyWqAVNBioPr8yNJbp?=
 =?iso-8859-1?Q?XtBm9tt2Pdu3N+2y1leXfhcO0cOS5ms3qwj6UMeHzE/dBEATx41UFqSs6I?=
 =?iso-8859-1?Q?Ggvc3Nx639rfjaI8Ba25CYsx3BErgFnhZEwj7AYeMRGeok9vSb0080WY3q?=
 =?iso-8859-1?Q?Vx28JWpByGStetcI/0p3IBsKcPcD5ZA6N6v2jW5m0zjmea/5wKZFdvwRQQ?=
 =?iso-8859-1?Q?ADWBNjyjMaV9HjJhj9/X8tpnCQMZkT98Z2q7imoNXn0EsTN1nsgHXT8KI4?=
 =?iso-8859-1?Q?zU7sSSYzlm2LmjLXlr7uXlEdY2da0J2l/c33BT+b5Oar7n6JzSeDBU+b/i?=
 =?iso-8859-1?Q?+oYSARLp4TNDDJu3/NMbUnNf57j55z9Jc493CYD+1SAcXwT10MEW8VRcJc?=
 =?iso-8859-1?Q?zuipzkykfUyxkPXEjNKO0h21Wot8fIDdGnlwXb6cQzVlz0NJVsZHYKRJXZ?=
 =?iso-8859-1?Q?Xh6FCNQh2kcLbn2iJOxr//j6NMs1Z0h4Iyys3mj5vmhdLB3ZuZ/UIJinro?=
 =?iso-8859-1?Q?9CqIknXP7Nd4shS67iC9tr0AmnpLySkTN8S0BXHKbjjEyygPnTZutx6Ji+?=
 =?iso-8859-1?Q?8fSO2SRkteH3cTf6fr0QYnMF1mDWLRaJtFsKfgNgHGO//6fCWYyUog+h/I?=
 =?iso-8859-1?Q?xALWEvHWQLWw2iMQ/bTuFbUXaL6MitAZPowusahMOqvdwT8gKFo4d6btdr?=
 =?iso-8859-1?Q?3ibrL4HSDyF20vsbXRFHn1XsaTbQhuXxodfKPn1+ZjYvVPzBxAsz67i1Ua?=
 =?iso-8859-1?Q?MPciUkA6eMDczZTkv+LsTbEPgOmH0UqhLO15Pxy2pTVYd0UEcLtKAuM2Bu?=
 =?iso-8859-1?Q?F80vF6ucqD7vpzAYA4Lp0bg2kQY6axuw79uKWAmxG/Lq2YLc2U6pBWhqRx?=
 =?iso-8859-1?Q?AaaHE9ptqeEXXRH6IX6Leda/JMGm33+iIZu35LzR14btjY9rflgowoCk1/?=
 =?iso-8859-1?Q?eBBh7kJPpouWF1i0uEaRJ4PKft1zQ643oGSWYQn3XflL/WWUDvn/EUQm7C?=
 =?iso-8859-1?Q?KYHNqsthGyj3haJ/zDutRMCCkLzL1snb5/pNOnbqQAJ3TZgv+3F1TNULB1?=
 =?iso-8859-1?Q?Z4kJh27NGIdi3vGf+Gy1i3UR5GmSbLTQ2ahAwz236Rl2LCcQgehTwtePAh?=
 =?iso-8859-1?Q?Xe8ajid0TIi36AqO6Z6hzYxdIu89leF+84Lko+fDD70SUGOAoEInTbq5Y5?=
 =?iso-8859-1?Q?GJftTUC0GC8C5bv0ZKGn0a3NzNbNjrwUKlwqG+aHxASJK0ZDPJzOgBiT8w?=
 =?iso-8859-1?Q?DGuZUlWfCWMlqD/gQwxvw7Rzmv6/gV3kp0dtN39INtFNQcdtZupFa38jDM?=
 =?iso-8859-1?Q?r+pBzRl70vafYxABTAVAAi09Mn8k5pDQhGKlmoqYHZ52ix5NZ3VxHn+Kg+?=
 =?iso-8859-1?Q?0CRiRBBXrQZkdnf71ZP11iYDFt3NSlklRkRCvngIvpDvj/?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB0074E56FF30DBC0264DC3376C4AD2DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	XETJwAfepeakANX5axF3SMDZ2zmdjepZKvsXfvXvJ+0ezxE6hXSUvQAb7OPIm/2jNmJM+2wYlp+usra0Ey0fiCjLnVK+0dJzwDCHWqev+dFgefdvjvRuzTkVIZxisgy9MCkQSKIItPZL9de1S0hTmfRroiKlXJILb9f9/txXdsDErev10cKuAp9WhtiSTOKEPAjv550RZZL1ExdNtlaRdDvEwQgg17JbQnja4EOEibE7zzCg6oDyJn3n/Xlj/mTDZzmnADVQ9T5/KBeoj0K6TQl532Hre2aioMt49odyIpjwCJppzqy8UhfD/BGABeJfZElKAa8KSRsbIpKsanx21g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614148db-722c-4f60-57d2-08df04392d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 12:46:13.3365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SLkJBeLAC56RQWKx9Vk9OyS/dN0AOudEWUbttUeY7c75kDgpQeyU6woF7mZUJmsDzx4VAya+YL8Or2nAStH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244484

--_000_DM4SPRMB0074E56FF30DBC0264DC3376C4AD2DM4SPRMB0074namprd_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann.
I noticed that there are four additional patches currently queued in the st=
able/scarthgap-nut branch of openembedded-core-contrib: openembedded-core-c=
ontrib - OpenEmbedded Core user contribution trees<https://git.openembedded=
.org/openembedded-core-contrib/log/?h=3Dstable%2Fscarthgap-nut&qt=3Dgrep&q=
=3Dbinutils>
I'll rebase/refresh this series on top of the latest queue and resend the u=
pdated patches for review.
Thanks for the feedback.
Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Thursday, August 27, 2026 5:55 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 1/2] binutils: fix CVE-2026-344=
1 and CVE-2026-3442

On Thu Aug 27, 2026 at 1:02 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> Hi Yoann,
>
> Any update on this? As per last update, Sudhir has sent the patches for m=
aster and wrynose branch as well. Can you please review?

See https://patchwork.yoctoproject.org/project/oe-core/patch/20260513172734=
.3995341-2-sudumbha@cisco.com/#40079
I've dropped this series. Please refresh/resend it.

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4SPRMB0074E56FF30DBC0264DC3376C4AD2DM4SPRMB0074namprd_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks, Yoann.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I noticed that there are four additional patches currently queued in the st=
able/scarthgap-nut branch of openembedded-core-contrib:
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
stable%2Fscarthgap-nut&amp;qt=3Dgrep&amp;q=3Dbinutils" id=3D"OWAa3a13643-a0=
f6-f14b-a471-02b81669304f" class=3D"OWAAutoLink">
openembedded-core-contrib - OpenEmbedded Core user contribution trees</a></=
div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I'll rebase/refresh this series on top of the latest queue and resend the u=
pdated patches for review.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks for the feedback.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, August 27, 2026 5:55 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH v2 1/2] binutils: fix CVE-2=
026-3441 and CVE-2026-3442</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Thu Aug 27, 2026 at 1:02 PM CEST, Deepak=
 Rathore via lists.openembedded.org wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; Any update on this? As per last update, Sudhir has sent the patches fo=
r master and wrynose branch as well. Can you please review?<br>
<br>
See <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
60513172734.3995341-2-sudumbha@cisco.com/#40079" id=3D"OWAd7524ea8-3bb0-65c=
4-211f-1de962f2ac59" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://patchwork.yoctoproject.org/project/oe-core/patch/20260513172734.399=
5341-2-sudumbha@cisco.com/#40079</a><br>
I've dropped this series. Please refresh/resend it.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4SPRMB0074E56FF30DBC0264DC3376C4AD2DM4SPRMB0074namprd_--

