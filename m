Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96C6C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 07:56:14 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web11.10008.1739346973189050484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 23:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=WytM8ewR;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20914; q=dns/txt;
  s=iport; t=1739346973; x=1740556573;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=7+VeB8AmZl1QR98CYZT2fxo7yZkmRSZvhF3XAwLlg2Q=;
  b=WytM8ewRe3nRva9hGJXgv+PTM8OEGwgSZ1eZ5IFR6X4P/gW6cCOUiGdt
   vzk4sa9iLEYyD6BYRUhBJfag42eHJmZL5GJcsbvHn2gQNbMjlEXztJhKr
   GfrLmmbeg7l5LrtgaXlvUpddgvbACnA4+hPU9iNxZlUNQTQkYSCNxtDnf
   Q=;
X-CSE-ConnectionGUID: LbXecVCYQ9Wse2PzOGgFxQ==
X-CSE-MsgGUID: Rr7iz+TiQMCvupyug9hY6A==
X-IPAS-Result: =?us-ascii?q?A0AJAACKUqxn/5UQJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFAJYEcAgEBAQEBCwGBQDFSB3QCgRxIiCEDhS2IdAOLY?=
 =?us-ascii?q?5IxgSUDVg8BAQENAi4BBg8EAQGCE4J0AosIAiY2Bw4BAgQBAQEBAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4V7DYZaAQEBAQMBEWIFDAQCAQgOAwQBA?=
 =?us-ascii?q?QEnByAHChQJCAIEDgUIGoJhghwNBwMxAwGjKAGBQAKKK3iBNIEB3TsNglqBS?=
 =?us-ascii?q?AGIMB4BKoEyggaHACcbgg2BV4IwOD6CH0IEAYFfBS8Ig1eCLwSCL4FALgGCW?=
 =?us-ascii?q?GeGSo9EhEWKAlJ1IgMmMywBVRMXCwcFgSlIA4ERI4EjBTRBOQGCDWlJOgINA?=
 =?us-ascii?q?jWCHnyCK4IegjuEQ4RNhViCEoFjAwMWEYMheByFIx1AAwttPTcUGwUEgTUFn?=
 =?us-ascii?q?TcHAxBbATyEGzgaQwEqBoETA2iTbY8wjlqUIHEKKINzjBiNOIF/hi0XhVqke?=
 =?us-ascii?q?Jh8kgqWegIEAgQFAg8BAQaBUR0HLoFZcBWDIglJGQ+OLRaIa8FQeAI6AgcLA?=
 =?us-ascii?q?QEDCZIaAQE?=
IronPort-PHdr: A9a23:Yv2coRdoqQzpFEGLLr7k+mAHlGM/gIqcDmcuAtIPkblCdOGk55v9e
 RCZ7vR2h1iPVoLeuLpIiOvT5rjpQndIoY2Av3YLbIFWWlcbhN8XkQ0tDI/NCUDyIPPwKS1vN
 M9DT1RiuXq8NCBo
IronPort-Data: A9a23:XafNqa6oq5cCS5BDBLDDlAxRtGDGchMFZxGqfqrLsTDasY5as4F+v
 mcaDDiAMvbfNzfxf9B/O4/n8h4BucfQm4UwTAU//yhmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH1dOC89RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr+KUzBHf/g2QpajhNsfrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGYco9+1JKlB3p
 MMDJWo1fDesiMym+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0wn1lQ/UPrSmM+vgXP+bzpEs3qepLE85C7YywkZPL3Fa4OLKofQHpsN9qqej
 ljcoGXrQS0bDfm01yed42+j1+/+wwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWUHmJWeSGmW8fGfqjbaBMTfBTZqifMsJefd3+TenQ==
IronPort-HdrOrdr: A9a23:VKZ5+qsf1ZAAGwg3xcdSvn0C7skCNoAji2hC6mlwRA09TyXGrb
 HMoB1L73/JYWgqOU3IwerwRpVoIUmxyXZ0ibNhW4tKLzOWyVdATbsSorcKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKw/oSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAaISDA8VOj+LH8DWOTIut3Mk7zbQTNuPXQawTjLpwmFrJrhHTal/jp2aV5yKLEZnl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVAi+EsHfpWK1RH5m5+BwlquCm71gn1P
 PWpQ07Ash143TNOkmovBrW3RX62jpG0Q6g9bbYuwqgnSXKfkN/NyNzv/MfTvIf0TtngDhI6t
 MP44tejesPMfqPplWk2zGCbWAbqqP9mwtQrQdUtQ0fbWPbA4Uh97D2OyhuYcw99C6W0vFULM
 B+SM7b//pYalWccjTQuXRu2sWlWjApEg6BWVVqgL3e79F6pgEw86Ij/r1Vol4QsJYmD5VU7e
 XNNapl0LlIU88NdKp4QOMMW9G+BGDBSQ/FdDv6GyWqKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFFdVr3Q7dU7iAdCHmJdL7hfOSmOgWimF8LAS27Fp/rnnALb7OyyKT14j18OmvvUEG8XeH+
 2+PZpHasWTZFcG2bw5qTEWd6MiXkX2Cvdlz+rTc2j+1v72Fg==
X-Talos-CUID: 9a23:Q8dbr2xrLqI7oAvV1vjXBgUwEPAoeUP2/U6BHFS1U157b5KaZ0+prfY=
X-Talos-MUID: 9a23:4o6QLAtD78GRWZ4UQM2nvis9NdUr36WXLWsTjI0XpsbVNR0uEmLI
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2025 07:56:12 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 0BE2E18000160
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:56:12 +0000 (GMT)
X-CSE-ConnectionGUID: 068Qwm5XQ8m7fKF8XO0BpQ==
X-CSE-MsgGUID: F9DwEf2gTXiZGvBzBZI8dQ==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.13,279,1732579200"; 
   d="scan'208,217";a="47213802"
Received: from mail-bn7nam10lp2043.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.43])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2025 07:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9RUZzcsJBsVBvXV6G2tveAztqAp1w3FgayVXvsynSZFgLqdaZD43cKAHARv0UN6HLtDGbXfsp1nOhEqtwjT6JMVhC0hmayvE2TzzDU5xGPGzEGAoK8EO5E5CeRtJFkoefEqKopYCiCGz5dXkHavzMIT5Bx/I275HfcQfM2jj6etFZTGicFTS3etIy7TVhZDnRyw3yf0Jr6bh5U1P3/oGMgCijVgLve3f2eK2SRGK/+deUoY1HAP9D8UBq5S8+x7egxnGNleBbM3sfSuT7DGUKT/pRVbG8dlZkmcjyCYreOzS9WXkNXueH9oeGTn+/gahoagXz1HnF//BZsWEIcPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+VeB8AmZl1QR98CYZT2fxo7yZkmRSZvhF3XAwLlg2Q=;
 b=LmP6NpmihF3zpYgpVzkhpSia1OYQhxifTDJmdg1gC9zOhdD81E+FQ8z54mqhn9WgLZmBuQ1xGPQktl+/dFiC/jfay0c/53P+Zm7QJKSuKHTfg+mOuAc1G48GiQG21J/b0lIIgcHeH05CeJlDtxBrKbwzf7X0BNvqbfMmN/I7CidlGdYBFKhIap1yAk0wIpzrndVL+Kpy+iLPv6ig6PYe6c1eiDVg/+51wy5pwmcwifpalBRzOTWR9pwu4VTv5Yjo0YLZx4/HAihetixzwb6fdurySy2DawJcQVbvvX6RjlmqS6t/0aSKMoqYv65IqmyQP7EbXJ5VKGEihbno1ow3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by LV8PR11MB8605.namprd11.prod.outlook.com (2603:10b6:408:1e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Wed, 12 Feb
 2025 07:56:09 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::3a7a:496b:1b5a:362b%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 07:56:08 +0000
From: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)"
	<oobitots@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton
	<Ross.Burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Ruslan Bilovol (rbilovol)"
	<rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Topic: [OE-core] [PATCH] systemd: move systemctl utility to separate
 subpackage
Thread-Index: 
 AQHbeKZRchNZZrPMpUmlkztBmF+albNAcbkAgAABw6+AAALQAIAATwuggAAJYQCAAD7mAIABXkcFgAAJMACAAN47NQ==
Date: Wed, 12 Feb 2025 07:56:08 +0000
Message-ID: 
 <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
References: <20250206144907.1924993-1-oobitots@cisco.com>
 <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4902:EE_|LV8PR11MB8605:EE_
x-ms-office365-filtering-correlation-id: 0b61a30a-1d5a-45c2-62a6-08dd4b3ab5c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?yHltiMs+865BX0mqsfLf+DFWU6Hr4KLxm8w/wGDvmNV7tZueBL0d4sMl?=
 =?Windows-1252?Q?biJ3ptGSucfEIedX61/9TpTz8HMHRg1n6PyDskRUS+pImWX6urIwsXev?=
 =?Windows-1252?Q?JK7vV/kbgedCVG1zLfqH0LcC1d/dRsfFskef8wIk+TDHzvOpR5KIiRUB?=
 =?Windows-1252?Q?OyYBHuRDy4bi6MxE5+1juQekHD9lltJEUNsvUhFukdcKHGORheNsSnYa?=
 =?Windows-1252?Q?JZBW4GYc/0Y5aq05LKo9WkZD00Wahj8m1jEDrLouotQu+6tVLFabvodj?=
 =?Windows-1252?Q?lvAdRme5o3TBksa4iqC7dihv2mqxrcXmy82E7rJqEOyNFn3HYiPuqUJx?=
 =?Windows-1252?Q?gp2Lc47VnvJhkb9UJjrPUb8gXR5DD1GNd/6ojzHFGpWOGL/ZmrWq3go4?=
 =?Windows-1252?Q?t0VCdAxODl30GNM5XCtD4dRa4HsepiAdCWyHufD+qyMI4YQJlXZ6n/WK?=
 =?Windows-1252?Q?WAx7+uL4g0u9G9lg7CV6DZIgjAktcwacvvuYaBVGcEuARtAfGUUdLtus?=
 =?Windows-1252?Q?13BO2KYcHQ8ClsYJdm8Dhb/fc/rA9dnHPIAXtNhEp+rPWPVLAfTLMuKD?=
 =?Windows-1252?Q?85b63u5m74JSvN5oYGkvmfJ/2DVWxVqvmUlxeqbvo15cz/aoVFNxAePp?=
 =?Windows-1252?Q?Jp0C40yd4umGCaiS/mOEz9kQwMsYF3b8aDRDzJnQ3ls7Dvyg7MTgoxJS?=
 =?Windows-1252?Q?bFTVISTXaQ/wEvDeQx+TFF96Zp9lV0URJObCELLVsKXllArpwV/g5aKg?=
 =?Windows-1252?Q?kN/eZ7DS87UQMDBTI3/vy6pFf8fIoPddHU8paDDal73pjlqZ5Uo3gTrl?=
 =?Windows-1252?Q?xUFq3+9vkLf3fNong+BYlrHucaYoldettgppJO+kInG/m4vcaB9p4X+X?=
 =?Windows-1252?Q?sL29R5AhFdzlcQiO27KX4e8cv3m8WWv9eX8ciHTgFsMVTy8fB3s1OgLb?=
 =?Windows-1252?Q?z+o+NJn4MMkICsEu2Nee4+hdhHwxvyNAvS0NWVN3KAVllW0dCFrnJuPR?=
 =?Windows-1252?Q?C49ECj44/7q5bMzyBubGykcBCmYjY4dHpmi7c+LaabArlHSxDDqeq5F+?=
 =?Windows-1252?Q?aQdIOmWlBDu0gZIeR/uKqSnPBOIii6Ok7824kpRggI2ZK+5FbW1zXKFx?=
 =?Windows-1252?Q?s5xVQhcJ6dCfKIeCQQKvIRF6xLsuPwiKLvNXqxAyDVzhj4J08GGn72VG?=
 =?Windows-1252?Q?v0PLQGY6h0bOIPN6EMa6SU6DK+mPYdSe4t1NcB88t/NV+7ljkAd1wDbd?=
 =?Windows-1252?Q?TkCnATLiqlaJQ3kS0FV48erb9oqgGK8CAOHB5LJQ8QgGCxfVutivA8KT?=
 =?Windows-1252?Q?GczClVO85wHRiUZOfsMSKIT1L9hJSQ8vklKWxnxDDag//yEma43fOhEA?=
 =?Windows-1252?Q?7m3tIurR/vsKSN8FyS/nn710z8ffNJuJqElJc6mphOmEFkXVBmYCBspm?=
 =?Windows-1252?Q?K/WCQBrEKDh3J6FpDgpJ5hg8RRoURoe2oC2XIXUkFpwnlD0uxYsQT95q?=
 =?Windows-1252?Q?rf+tsAkj?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?K97+fRW+eWA4/jCV22hgXRySdabU1ubV1fKginMt9eDqo6Y+a0lB7JVt?=
 =?Windows-1252?Q?04yUopyTzBKa6YVB6MWtDdgBiEuDADyXYUKYhe4FX+o4768gFSnyCvMf?=
 =?Windows-1252?Q?sDM+RExa+WWg3WiFNfzlT+o6V1nGiyJZqpqshjfHE2ZPt+BRqfYvpr0t?=
 =?Windows-1252?Q?WWgcs2OoEB2SikXZ1etFNDnIJKJxr2AgKp9jNIKIH1UGkQBkrjyBCeDQ?=
 =?Windows-1252?Q?+ryNYtFwQz6PkPf76fsbrs6C1clekwwkJcxxtyz+jQgeCg+GgV4Z1Peh?=
 =?Windows-1252?Q?iz36PZcGjkR9uOqNcmorqLomy/swcODyKFdQLNZ++M1mla61Z5//ghOA?=
 =?Windows-1252?Q?vkE9+oEC0ElRiUybxOhu6s+ZYT8YaxlDTpdZbKDRR/zUMnloxtPjIryx?=
 =?Windows-1252?Q?i6hwoEjlRf1PbWpe2Uwg4LezhdlbtkWTREXR+afOCGFQxpW2aDzj5+kd?=
 =?Windows-1252?Q?5htdh7UDe3vogmdRKmUs0TjHpUkGt0RFBHdWxM6KBb2J9t6tYrlpsBOR?=
 =?Windows-1252?Q?XBuoJBxiJ5AW0o1vy12SVSDL92SWF/etR5iOvqQhTBEoNbs1YamvyTmh?=
 =?Windows-1252?Q?7OuhtYBPuD05klddVTZ3PNS5VULma0AoPkmMVgO4s2+b9GfD22yO5Tf6?=
 =?Windows-1252?Q?KGx1cRDMvgsCZy+crG0dpoMMVGhQCpMciXZaHg5R/L5/Yz3tSxVoWhhx?=
 =?Windows-1252?Q?rE9rFkdtrhyaIWwmKITLAWNY0YEOnvCW133SruWGIZHL1WEknsVY5Raa?=
 =?Windows-1252?Q?HEKitofCfNIpbsBmpHhuis4kzUD/4iQ8m1wD5LHTRTOqyOKapvBmTJzP?=
 =?Windows-1252?Q?HZcIS2qXm0K9TXY/ETLxDo2onA83igaXpi+Yx0Yaw+gag4jdypVvb3oQ?=
 =?Windows-1252?Q?2KgQKsN0nTlwJKD+M9xXh5aSpggguzVzXDT+Xm9aungL3AGVOv3CYxk9?=
 =?Windows-1252?Q?JaVE4EFmKfa8V1Qkg3TSefTm3EnHZ5mywu7148ewQRhGckVDTJaDGUJb?=
 =?Windows-1252?Q?zwna+7kYX3l6g0SDz8hZe9scCUHnLUL8c0RQ0yBASI38X4KV8uGxSnTo?=
 =?Windows-1252?Q?Mjmxlxx020WpHsmLUYRK4nTY/5Y0pcxxpjqrwibxQ1/HihvutWtJdits?=
 =?Windows-1252?Q?9KfK7/5MWEN9IMahVfgkVJscNriXrggW6PsiX3wvXRrJSiDZzZPhd/Or?=
 =?Windows-1252?Q?HWc1z9P8lkmw/4rK2lhrrTipl9md034T1oSfk266IXB5vn4YV+16g2fx?=
 =?Windows-1252?Q?j4u52QRa/FuWHE6eioZaBKveQ875PeWXq7YKOn9jE2Nkv4MYPr+wtj7H?=
 =?Windows-1252?Q?FfL7oDBd1GAxs3j+Mqsf3nX1OKYf/BpY1Ejkl3UxRGQRb8sCQLaIREfq?=
 =?Windows-1252?Q?jtGGYE7Ub4yLqtt8P+u7W2uRQRdu9UgQY5dxcvSbp8/DjIawHVziyIXZ?=
 =?Windows-1252?Q?zkklnxtFper3YAasubB3jqONRquP7p6iY4ZMTnH7dDZuN2nVMMDPEGLE?=
 =?Windows-1252?Q?stjb2IZKv/K85gPUD7FQU6W03/DSHALTIk0HgjRxCzUwaVCFcGSxRXw1?=
 =?Windows-1252?Q?h+xk1THp1fTftaPSYmEdFwTdojTYeiYVo93oIvHl9OYBXtV7jjgEMFrT?=
 =?Windows-1252?Q?mEIA1N/+JdHSXEuT9AHACVLMeoQo6luhiI7Ps1ovH88xqiU3qoi+bsNu?=
 =?Windows-1252?Q?lf6jh3PQfhBCGwRk/ehs/X6dVukEWjpMYk1a+wXEI0brzR7MXRz90w?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SA2PR11MB49064A61A32F35C2E519AA36D7FC2SA2PR11MB4906namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b61a30a-1d5a-45c2-62a6-08dd4b3ab5c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 07:56:08.5300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOhxluNAkVz81D4xK68VVfzXHp5CRw9pK7kIl4OfSpwODHV6QISp6QIwnwab8ouQ766nhnvnaYpJtvDbT2qYhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8605
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211210

--_000_SA2PR11MB49064A61A32F35C2E519AA36D7FC2SA2PR11MB4906namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Component deliver something and it's content consist of:

  *
binaries/libraries/scripts, etc. that delivered by this component (service)=
 itself
  *
binaries/libraries, etc. on which component depends on

Technically content is per component subdirectory. Every component has its =
own isolated content.

If we have N components each require only systemd-systemctl it mean every c=
omponent will store (on disk) whole systemd/libsystemd package files instea=
d of systemctl binary.

Regards,
Oleksiy

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, February 11, 2025 19:31
To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@c=
isco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Ross Burton <Ross.Bur=
ton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core@l=
ists.openembedded.org>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

This still doesn=92t make sense. Any target file is contained in one and on=
ly one package. Where is the duplication?

Alex

On Tue 11. Feb 2025 at 19.04, Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC=
 INC at Cisco) <oobitots@cisco.com<mailto:oobitots@cisco.com>> wrote:
I'm sorry, I confused you mentioned term sysroot. It's not about yocto - we=
 just use the same term because it's very similar
to how it works into yocto.
We got packages as a result of  yocto build and use these artefacts (packag=
es) on next stage to populate
software components content. For some reason we can't use the same approach=
 with hardlink to deduplicate
components content.

Regards,
Oleksiy

________________________________
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com<mailto:peter.kjellers=
tedt@axis.com>>
Sent: Monday, February 10, 2025 22:05
To: alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.com> <alex.kanavin@gma=
il.com<mailto:alex.kanavin@gmail.com>>; Oleksiy Obitotskyy -X (oobitots - G=
LOBALLOGIC INC at Cisco) <oobitots@cisco.com<mailto:oobitots@cisco.com>>
Cc: Ross Burton <Ross.Burton@arm.com<mailto:Ross.Burton@arm.com>>; openembe=
dded-core@lists.openembedded.org<mailto:openembedded-core@lists.openembedde=
d.org> <openembedded-core@lists.openembedded.org<mailto:openembedded-core@l=
ists.openembedded.org>>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com<mail=
to:rbilovol@cisco.com>>
Subject: RE: [OE-core] [PATCH] systemd: move systemctl utility to separate =
subpackage

Additionally, changing the packaging does not affect what is added to
the sysroot.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@l=
ists.openembedded.org> <openembedded-
> core@lists.openembedded.org<mailto:core@lists.openembedded.org>> On Behal=
f Of Alexander Kanavin via
> lists.openembedded.org<http://lists.openembedded.org>
> Sent: den 10 februari 2025 18:20
> To: oobitots@cisco.com<mailto:oobitots@cisco.com>
> Cc: Ross Burton <Ross.Burton@arm.com<mailto:Ross.Burton@arm.com>>; openem=
bedded-
> core@lists.openembedded.org<mailto:core@lists.openembedded.org>; Ruslan B=
ilovol (rbilovol)
> <rbilovol@cisco.com<mailto:rbilovol@cisco.com>>
> Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separat=
e
> subpackage
>
> They're not actually copied. They're hard-linked from
> sysroots-components/. This is a cheap operation and it doesn't waste
> disk space.
>
> Alex
>
> On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via
> lists.openembedded.org<http://lists.openembedded.org> <oobitots=3Dcisco.c=
om@lists.openembedded.org<mailto:cisco.com@lists.openembedded.org>>
> wrote:
> >
> > Hi Alexander,
> >
> > By 'deploying whole systemd' I mean next:
> >
> > Every component copy and installs packages with libraries, utilities an=
d
> config files in component local sysroot, i.e. directory used to create
> final component image:
> >
> > libsystemd0_255.4
> > libsystemd-shared_255.4
> > systemd_255.4
> >
> > So, on disk we have duplication of files for every component that depen=
d
> on the systemctl.
> > In case of separate subpackage we have one root component depend on the
> systemd and all other components will contain only systemd-systemctl
> package content.
> >
> > Of course, I understand it's quite a specific scenario.
> >
> > Regards,
> > Oleksiy
> >
> > ________________________________
> > From: Alexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gma=
il.com>>
> > Sent: Monday, February 10, 2025 13:03
> > To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)
> <oobitots@cisco.com<mailto:oobitots@cisco.com>>
> > Cc: Ross Burton <Ross.Burton@arm.com<mailto:Ross.Burton@arm.com>>; open=
embedded-
> core@lists.openembedded.org<mailto:core@lists.openembedded.org> <openembe=
dded-core@lists.openembedded.org<mailto:openembedded-core@lists.openembedde=
d.org>>;
> Ruslan Bilovol (rbilovol) <rbilovol@cisco.com<mailto:rbilovol@cisco.com>>
> > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to
> separate subpackage
> >
> > On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
> > lists.openembedded.org<http://lists.openembedded.org> <oobitots=3Dcisco=
.com@lists.openembedded.org<mailto:cisco.com@lists.openembedded.org>>
> > wrote:
> > > We have next situation:
> > > - a lot of software components that depend on packages and deploy all
> packages they depend on locally inside component.
> > > - some components directly depend on systemctl only (e.g. this binary
> used in scripts), so for every component we have to deploy whole systemd
> locally.
> > > - finally, all/some of those components will be merged in some way an=
d
> will use systemd/libsystemd, but until then it will be nice to get rid of
> such duplication.
> >
> > I'm sorry, but this does not quite make sense. You need to more
> > specifically describe what 'deploying whole systemd' means, and why is
> > that problematic.
> >
> > Alex
> >
> >
> >

--_000_SA2PR11MB49064A61A32F35C2E519AA36D7FC2SA2PR11MB4906namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Component deliver something and it's content consist of:</div>
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;u=
norderedStyleType&quot;:2}">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); list-s=
tyle-type: &quot;- &quot;;">
<div class=3D"elementToProof">binaries/libraries/scripts, etc. that deliver=
ed by this component (service) itself&nbsp;</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); l=
ist-style-type: &quot;- &quot;;">
<div class=3D"elementToProof">binaries/libraries, etc. on which component d=
epends on</div>
</li></ul>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Technically content is per component subdirectory. Every component has its&=
nbsp;own isolated content.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
If we have N components each require only systemd-systemctl it mean every c=
omponent will store (on disk) whole systemd/libsystemd package files instea=
d of systemctl binary.</div>
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
Oleksiy</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr" style=3D"color: inherit;"><span style=
=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
"><b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, February 11, 2025 19:31<br>
<b>To:</b>&nbsp;Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)=
 &lt;oobitots@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;; Ros=
s Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.openembedded.=
org &lt;openembedded-core@lists.openembedded.org&gt;; Ruslan Bilovol (rbilo=
vol) &lt;rbilovol@cisco.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</span>
<div>&nbsp;</div>
</div>
<div style=3D"direction: ltr;">This still doesn=92t make sense. Any target =
file is contained in one and only one package. Where is the duplication?</d=
iv>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr;">Alex</div>
<div><br>
</div>
<div style=3D"direction: ltr;">On Tue 11. Feb 2025 at 19.04, Oleksiy Obitot=
skyy -X (oobitots - GLOBALLOGIC INC at Cisco) &lt;<a href=3D"mailto:oobitot=
s@cisco.com" id=3D"OWAfb0c204e-edac-2e7b-abbb-f685f6969e90" class=3D"OWAAut=
oLink">oobitots@cisco.com</a>&gt; wrote:</div>
<blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-l=
eft: 1px solid rgb(204, 204, 204);">
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
I'm sorry, I confused you mentioned term sysroot. It's not about yocto - we=
 just use the same term because it's very similar</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
to how it works into yocto.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
We got packages as a result of&nbsp; yocto build and use these artefacts (p=
ackages) on next stage to populate</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
software components content. For some reason we can't use the same approach=
 with hardlink to deduplicate</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
components content.</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Regards,</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
Oleksiy</div>
<div id=3D"x_m_4630877715923648911appendonsend" style=3D"color: inherit;"><=
/div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"x_m_4630877715923648911divRplyFwdMsg" style=3D"color=
: inherit;">
<span style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rg=
b(0, 0, 0);"><b>From:</b>&nbsp;Peter Kjellerstedt &lt;<a href=3D"mailto:pet=
er.kjellerstedt@axis.com" id=3D"OWAef83ce01-a367-c969-a0a9-a622b1d26f35" cl=
ass=3D"OWAAutoLink">peter.kjellerstedt@axis.com</a>&gt;<br>
<b>Sent:</b>&nbsp;Monday, February 10, 2025 22:05<br>
<b>To:</b>&nbsp;<a href=3D"mailto:alex.kanavin@gmail.com" id=3D"OWA1eb32b6f=
-aff5-8bb0-1dfd-101f8f2d52f1" class=3D"OWAAutoLink">alex.kanavin@gmail.com<=
/a>&nbsp;&lt;<a href=3D"mailto:alex.kanavin@gmail.com" id=3D"OWA54b87dbe-91=
56-bfd7-ba3b-b34e5116b9c9" class=3D"OWAAutoLink">alex.kanavin@gmail.com</a>=
&gt;;
 Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) &lt;<a href=3D=
"mailto:oobitots@cisco.com" id=3D"OWAd88de468-94e4-33b3-b577-110624450c39" =
class=3D"OWAAutoLink">oobitots@cisco.com</a>&gt;<br>
<b>Cc:</b>&nbsp;Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" id=
=3D"OWAaa33b0aa-65b1-c0e5-0f8e-c3ec3ab5d0a9" class=3D"OWAAutoLink">Ross.Bur=
ton@arm.com</a>&gt;;
<a href=3D"mailto:openembedded-core@lists.openembedded.org" id=3D"OWA3b6cf7=
19-dd3f-5504-8a87-4eae0acd605a" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org</a>&nbsp;&lt;<a href=3D"mailto:ope=
nembedded-core@lists.openembedded.org" id=3D"OWA1465ad0f-ec05-9dc9-1f31-fe8=
ca8e83a45" class=3D"OWAAutoLink">openembedded-core@lists.openembedded.org</=
a>&gt;; Ruslan Bilovol (rbilovol) &lt;<a href=3D"mailto:rbilovol@cisco.com"=
 id=3D"OWA342467e1-1835-2fce-be16-4ab1dd12bc35" class=3D"OWAAutoLink">rbilo=
vol@cisco.com</a>&gt;<br>
<b>Subject:</b>&nbsp;RE: [OE-core] [PATCH] systemd: move systemctl utility =
to separate subpackage</span>
<div>&nbsp;</div>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">Additionally, changing the =
packaging does not affect what is added to<br>
the sysroot.<br>
<br>
//Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" id=
=3D"OWAb20bce61-d99c-51bd-3c28-d2a72b8c54e8" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org</a>&nbsp;&lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" id=3D"OWA5d9605ae-fb13-=
6c8d-c777-2e1506abe815" class=3D"OWAAutoLink">
core@lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin via<br>
&gt; <a href=3D"http://lists.openembedded.org" id=3D"OWA76559f4e-d828-17e5-=
dfd9-f05124046077" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
lists.openembedded.org</a><br>
&gt; Sent: den 10 februari 2025 18:20<br>
&gt; To: <a href=3D"mailto:oobitots@cisco.com" id=3D"OWA44be2cc0-ed23-2a7d-=
13b6-3fef09945c95" class=3D"OWAAutoLink">
oobitots@cisco.com</a><br>
&gt; Cc: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" id=3D"OWA3c=
88c0c7-bed7-0e8c-777d-7ec7c5465f3a" class=3D"OWAAutoLink">Ross.Burton@arm.c=
om</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" id=3D"OWA73a57956-974b-=
4ed0-cca2-fa3a596c0d2c" class=3D"OWAAutoLink">
core@lists.openembedded.org</a>; Ruslan Bilovol (rbilovol)<br>
&gt; &lt;<a href=3D"mailto:rbilovol@cisco.com" id=3D"OWA9e0ac62a-a55e-5c63-=
b5f0-6676b186a17e" class=3D"OWAAutoLink">rbilovol@cisco.com</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to sepa=
rate<br>
&gt; subpackage<br>
&gt;<br>
&gt; They're not actually copied. They're hard-linked from<br>
&gt; sysroots-components/. This is a cheap operation and it doesn't waste<b=
r>
&gt; disk space.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via<br>
&gt; <a href=3D"http://lists.openembedded.org" id=3D"OWAcfa109a9-ed6a-b2bc-=
03c9-2c0eed3e334e" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
lists.openembedded.org</a>&nbsp;&lt;oobitots=3D<a href=3D"mailto:cisco.com@=
lists.openembedded.org" id=3D"OWAf1d975a0-7391-26e5-eb6d-c3d7c4aef877" clas=
s=3D"OWAAutoLink">cisco.com@lists.openembedded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Alexander,<br>
&gt; &gt;<br>
&gt; &gt; By 'deploying whole systemd' I mean next:<br>
&gt; &gt;<br>
&gt; &gt; Every component copy and installs packages with libraries, utilit=
ies and<br>
&gt; config files in component local sysroot, i.e. directory used to create=
<br>
&gt; final component image:<br>
&gt; &gt;<br>
&gt; &gt; libsystemd0_255.4<br>
&gt; &gt; libsystemd-shared_255.4<br>
&gt; &gt; systemd_255.4<br>
&gt; &gt;<br>
&gt; &gt; So, on disk we have duplication of files for every component that=
 depend<br>
&gt; on the systemctl.<br>
&gt; &gt; In case of separate subpackage we have one root component depend =
on the<br>
&gt; systemd and all other components will contain only systemd-systemctl<b=
r>
&gt; package content.<br>
&gt; &gt;<br>
&gt; &gt; Of course, I understand it's quite a specific scenario.<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Oleksiy<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" id=3D"OWA48624382-c8a0-2c61-3b51-2ec82e9d79f7" class=3D"OWAAutoLink">a=
lex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; Sent: Monday, February 10, 2025 13:03<br>
&gt; &gt; To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)<b=
r>
&gt; &lt;<a href=3D"mailto:oobitots@cisco.com" id=3D"OWA88b36548-5aba-83bb-=
60c4-cc1265277ca9" class=3D"OWAAutoLink">oobitots@cisco.com</a>&gt;<br>
&gt; &gt; Cc: Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" id=3D"=
OWAdb5fb04f-27f8-f613-d153-010e84de97c4" class=3D"OWAAutoLink">Ross.Burton@=
arm.com</a>&gt;; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" id=3D"OWAbb55fcf5-a5c6-=
cb18-e682-f6f4d198d410" class=3D"OWAAutoLink">
core@lists.openembedded.org</a>&nbsp;&lt;<a href=3D"mailto:openembedded-cor=
e@lists.openembedded.org" id=3D"OWA8e217e55-4274-ea5c-facf-bdd3ac430277" cl=
ass=3D"OWAAutoLink">openembedded-core@lists.openembedded.org</a>&gt;;<br>
&gt; Ruslan Bilovol (rbilovol) &lt;<a href=3D"mailto:rbilovol@cisco.com" id=
=3D"OWAbd8a128b-9673-ad2f-756e-1c7e2a2c0070" class=3D"OWAAutoLink">rbilovol=
@cisco.com</a>&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to=
<br>
&gt; separate subpackage<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" id=3D"OWA097bc21c-0bd9-=
8039-d6a2-86ff88c8b65f" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
lists.openembedded.org</a>&nbsp;&lt;oobitots=3D<a href=3D"mailto:cisco.com@=
lists.openembedded.org" id=3D"OWA75249ac1-ac2e-17b3-4812-bbe708bdeeeb" clas=
s=3D"OWAAutoLink">cisco.com@lists.openembedded.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; We have next situation:<br>
&gt; &gt; &gt; - a lot of software components that depend on packages and d=
eploy all<br>
&gt; packages they depend on locally inside component.<br>
&gt; &gt; &gt; - some components directly depend on systemctl only (e.g. th=
is binary<br>
&gt; used in scripts), so for every component we have to deploy whole syste=
md<br>
&gt; locally.<br>
&gt; &gt; &gt; - finally, all/some of those components will be merged in so=
me way and<br>
&gt; will use systemd/libsystemd, but until then it will be nice to get rid=
 of<br>
&gt; such duplication.<br>
&gt; &gt;<br>
&gt; &gt; I'm sorry, but this does not quite make sense. You need to more<b=
r>
&gt; &gt; specifically describe what 'deploying whole systemd' means, and w=
hy is<br>
&gt; &gt; that problematic.<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;</div>
</blockquote>
</body>
</html>

--_000_SA2PR11MB49064A61A32F35C2E519AA36D7FC2SA2PR11MB4906namp_--

