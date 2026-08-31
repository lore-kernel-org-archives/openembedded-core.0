Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE9AC61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:55:28 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26115.1788170121480920881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NBk8IW4s;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8804; q=dns/txt;
  s=iport01; t=1788170121; x=1789379721;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=U0odvLhuK7s1cuvqsQXzH5DbsUacr4meN7J4eRSwZKA=;
  b=NBk8IW4s4yzc/ii2CH2lOCoy0jUguwxUVYJ7B6lD1TwIYGmGUvV+bH76
   IFNNj1AG3Zt3Y1aodMProHDZFWBiRmxjerTqOAk7YWbxYeHuWt+wVGkEm
   cfnZzs55dJexWJn4TKBXffpsMg3vYFZltQbBeGwQYG+GqBMPTXZa+DBIX
   teW3kzfyZxfZonPsVaCm3GXjQvM+d8U3aLCo1xcRQ79tjBexUo8WmHvDO
   pxEEl8msCZoKx8yxPAjbUYz3j1k3uAiXBbJsJDKL2xlKbL+LP6hmu48F6
   bWpF7uHkhXEjT9R/YcYaN45TPPVniG4hd3zU0F3O6ucE1cQeIOwPCQs8J
   A==;
X-CSE-ConnectionGUID: SmfWvQU7QomPdyiabw1e7Q==
X-CSE-MsgGUID: 8EL0pvHRT3Sw4Xgtrilc0Q==
X-IPAS-Result: =?us-ascii?q?A0BvAwCwTpVq/4oQJK1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkDiCADhSuGWIIhA54bgXQKDwEBAQ4BLgEJGQQBAYUFAo1zAiY0CQ4BAgQDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThhUIMg2GWgEBAQEDAYEIAgEIE?=
 =?us-ascii?q?QQBAQEuJwodCAIEARIIgnuCHRZBAwECDga2aQKKHHiBNIEBg1oFCQJD3AwVg?=
 =?us-ascii?q?TiFP4MeAQEqgTWCXYEjGAEbhGEnGxuBcoFXgmk+gQWBXAECAQEXgTcRhBOCM?=
 =?us-ascii?q?ASCInoSG4IxJZEIUnIiAyYzLAFVExcLBwWBIxAzAyAKLy0CFA0iDxoFLR1wD?=
 =?us-ascii?q?CcSDx0XFx5YGwYFEiAqQUQjAxMrgRlBAoF0PyMZNnqBCV6BKylhAhAXRi4Vg?=
 =?us-ascii?q?ggCglqBJ14CAUlDDgdHUwkEC209NwYPGQMEgTUFjg4HWx+CSz1SKQIigUpAB?=
 =?us-ascii?q?gEPoniBfKF7CiiDdowijT6IMheEBIFXiz2HA5JRmQgjgjaLMZYAhQ4CBAIEB?=
 =?us-ascii?q?QIQAQEGgWg8gUcLB3AVgyIJShkPhU6MVYF/gxTHBnkCAQgDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiQAoF8AQE?=
IronPort-PHdr: A9a23:AmBywhzoK0mgGYXXCzPsngc9DxPP8539OgoTr50/hK0LKOKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:z0VqNa2INY6T53Tx7/bD5Ytwkn2cJEfYwER7XKvMYLTBsI5bpzQOy
 jMeDz2AOa6PZmOhftFxa4m/9h8C7MXWzd83Sgpr3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24vajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGN0Q4ApMhx7lOBmR2+
 e0ZIToSNx3cvrfjqF67YrEEasULJc3vOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2N0Sojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZgOKwYYeJIoTTLSlTtha1g
 jre4UTDPkohK4Cvxiaf83an3taayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXF9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:g4An6KEfXOAOaVBqpLqF4ZLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJ03I+ertBEDyewKjyXcV2/hcAV7MZnichILFFvAH0WKm+UydJ8SczJ8T6U
 4DSdkFNDSYNzET5qiKgnjcLz9j+qj7zEnCv5a5854Zd3ATV0gW1XYBNu/0KDwQeCB2QbACON
 634M1BqzC8eXIRQPiaKxA+NdTrlpngrr6jRQQJKSIGxWC14A+A2frXAhKY1hARX3d1x6s+8W
 /Kqgr95q+ymfC2wB3R2gbontprcd3apedrNYipsIw4Oz/sggGnaMBKQLuZpg04p+mp9RIDjM
 TMiw1IBbUy11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFst6g55DeBex0TtigDg86t
 MI44uqjesSMfryplW72zEObWAtqqOAmwtmrQfUtQ0HbWJRUs4IkWVVxjIlLH5JJlOL1GlgKp
 guMOjsoNBLbFidc3fV+kNrwNCqQzAPOy3ueDlYhiRQuAImwUyQCCAjtZYidntszuNPd7BUo+
 vDKahmj7dIU4sfar98Hv4IRY+tBnXKWg+kChPYHb3LLtBPB5v2ke++3JwloOWxPJAYxpo7n5
 rMFFteqG4pYkrrTcmDxodC/BzBSHi0GW2F8LAS27Fp/rnnALb7OyyKT14j18OmvvUEG8XeH/
 K+IohfDfPvJXbnXYxJwwr9UZ9PLmR2arxehv8rH1aV5s7bIIzjseLWNP7VObr2CD4hHnjyB3
 MSNQKDUvmoLnrbLUMQrCKhL08FIHaPj66YOJKqitQu9A==
X-Talos-CUID: 9a23:7tnKj23Cd0tPClmYfnsvxbxfIcUrTWPk8SjpJEqABXdoQbeKEFLPwfYx
X-Talos-MUID: 9a23:6EoexwbulYOKr+BT5xLI3Cl8FP1UuJ+xVHACjY8Hv8LcDHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 09:55:20 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id 6F095180003D1
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:55:20 +0000 (GMT)
X-CSE-ConnectionGUID: EDBpxNhXQsGjAGvj0icrMA==
X-CSE-MsgGUID: Oo68c0wGQCuh8xmz7VnDMA==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208,217";a="59892849"
Received: from mail-westusazon11010003.outbound.protection.outlook.com (HELO BYAPR05CU005.outbound.protection.outlook.com) ([52.101.85.3])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 09:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6+r8Pm40svwF5rSQEXGCdtiICe+JjcUIPfeH3dYEaWeG6OQVd96yRYOyy1HBv8yGMk4ID3u8dmYQn+yEwe1kluqh5GCdbrwmciDWoS7gTtLD9R9IupGmKpa+2401DFLX00xVT0QMz9q3a0+oR52Tv8uIcRauUdxjTsycZwNtvYxX8bF2S37ETBL5AUL+H/famRljpc2ZKhftYkLiuzKB4owt/FZK86iM5psnr0aS3AWi2ZWoEE5A2zim8M6BpSvV2vZ/KVK7PBN9BI3kp6HafwvHlPCwry3OCg7Dy10rm/+o2//l0tew+tws5dwGrTwYezdslRa3mRRU3rVvcN7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0odvLhuK7s1cuvqsQXzH5DbsUacr4meN7J4eRSwZKA=;
 b=lkAgaRqdgdvByezHTKuuDS5li+Pgj8U2ZH1K02PVIStD+inTn6gSrsTOOAG8JuINblrt/5CyXi6/zgpuuoyGmRgsoLmReXndCtdrBBuQuP5klPmKl8N2vCRmNU2F5i6bAeecWucsZ+vQpzkpv/QdLf9fvaBp2xGQrU41USU8PhOJDmlW4GlGYuFgIP36KBy/Dn6lixQPdbahYlO/YoJWp57OYcxJhufMb1HmnsDx0QWr5T1apc5G8wi7c3clArKleBx+lD8arA1AVe5CDNY6MYQLhqJzWoopPYoPgPl0v3A13N/W7+vnmROPq2dd9bJ6lH3bRNXi9RUtKCoyMvk9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 DS7PR11MB8826.namprd11.prod.outlook.com (2603:10b6:8:256::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 09:55:17 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:55:17 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] binutils: fix CVE-2026-3441 and
 CVE-2026-3442
Thread-Topic: [OE-core][wrynose][PATCH] binutils: fix CVE-2026-3441 and
 CVE-2026-3442
Thread-Index: AQHdDW+MA6A8tkbRH0Gs68jmBGzWprayKkaAgAYW+lA=
Date: Mon, 31 Aug 2026 09:55:17 +0000
Message-ID: 
 <DM4SPRMB00746CCE4700D43920F1F69EC4A92@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20260706174652.4053594-2-sudumbha@cisco.com>
 <DKZQM58DFF46.1QQ8FRST5L5KI@smile.fr>
In-Reply-To: <DKZQM58DFF46.1QQ8FRST5L5KI@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|DS7PR11MB8826:EE_
x-ms-office365-filtering-correlation-id: 47cf4cd4-c44d-49fd-3a2b-08df0745f673
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|8096899003|38070700021|10067099003|56012099006|4143699003|11063799006|13003099007|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 IhQqpqIoFF1Lq/tDvChdPrE1ZR2NmBaOXNGVR8i67O82wdkKlTF4P0lpgnkWoHyiZ2Gh650wMNr8ddnDgrz7Sx5ERDix8R7W7sdRtzYq35eM273QXnlOkDNh4H79KPySkTUvq9YVSQktFtX4lXh9LmgQn5/wR5RtRmawlm3DpXZgRYldvUqX7JOxoC9uHnvQa7bOj8NiIF0sELO2ETZJYthGs09YY183KGNHSYPy8Jkjw5ccVK9x4K3qLO+N63/lmNnTiAVNp8c/4p1770Yr/IH2PquWb5dKQo9X49bR28YL1tpb0Zg2igNlvzCCeQT1Qo4hqWEDEDqu3nPchcVFUu8cylxXgka3P+48d7erqyiMZc7zDOrNFvMTb1m2DFoW39/PF5FKvEHR2sXj71ZN+S9ncdnhBZP090sYz2xCJAzm5NKZpF+jgcHktbJXwz84SkqgxKjjzqhqGtrOAsuAxoc2R8Jus5kPhp6eQSSSn8eh4cY9g7F5E8VV9eEXgZVn0+ARZdoJQwvgoTha3NcxnqKcSfEJ0xWKOAu6HrU/fvJtdaCRzXcoGbBx3Hbza4qq2LBsxqRd0LCPNEdIK8mmun3oW2S7jEB6wA7UbAULNHRQW6pJuymApYs4RudGhlRDNwyuubKGfJBY+hiZCF4fbRZDhjI7/rsBJKsaVSA9Skk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(8096899003)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?sDGzbvuxXaR7CytzFZA+b2GQ1b+9LH/h8j8VMPbxq0b2FC0JeqW3A7QA9t?=
 =?iso-8859-1?Q?5bnym8bgjBYdYvNQ66u/RLX5cDkzlKw4uNxP1665mcDxmToCjJHSBazMTk?=
 =?iso-8859-1?Q?RDqcPAo6J7tI8ady/QPmSSNXEYeZaM1iAzRZ1ShT5ZegbWviliQRfluC/o?=
 =?iso-8859-1?Q?Jpzxk9hYQGXSdJMvDI5pPuj55K3lpv7wPfPe7uIEuniPkv++IevseencvP?=
 =?iso-8859-1?Q?SBYiZu62okhFICZEN3JvXW1ROTnrDTN3qn1k/TI0Lpzm0qIyFjRahFnC3M?=
 =?iso-8859-1?Q?B9Pwq1f1gvg4DzJd7Rb219rdPg7Lwf29jCesyeVxaBRTi2eBBd2dcM3XfZ?=
 =?iso-8859-1?Q?WhCFULpNP1exCocMCxw5eIjRAlUQaaWz1S2UnI2v8RiUz9m/ri0hdWxg5v?=
 =?iso-8859-1?Q?EDN33suk3omaeXjUGHq4eAF6FFLWrWsODJciRN2/xwltbXlc9TGYa6Squ0?=
 =?iso-8859-1?Q?ECl7hNw4qbf7QjHY7Fu3aVpRPpWTwnRvNk6mXTHm3jFTNDp+sWLIsloh9y?=
 =?iso-8859-1?Q?Ph4aR30dpApxT8b1P2IgzOhS2he1LKQiwcFWF74oNviJSY9SNUc76UlNRG?=
 =?iso-8859-1?Q?O2xln9vzbHs81N/yBoLmTxFHpGcwSiSJhue9relGKMNc67pLy1NLwHsXxB?=
 =?iso-8859-1?Q?0PZbt0nWL55pUEymVRb8zgNls2SG6hVm5SsUj/ZsCU07eXqhohFetMd0in?=
 =?iso-8859-1?Q?XfUD4ahixdNYJISDeRS3AMwpHnfJU+B5kkPLR4EHMAjsjzu86CHc720ZPk?=
 =?iso-8859-1?Q?wRAiJ3AVfWr9GjkXG26jQC+slSjlpSFBRDes5uwNs7mglfvoRdZwh/KVo4?=
 =?iso-8859-1?Q?E6TjojXrfILP8Jb3x3vcpaIC1lnpmsEsdh4WQVAh33Kgxu3KLeoQqIzyr4?=
 =?iso-8859-1?Q?jUD5sQPmyTi7V6pTSruhDuG0Nke3wEBqL7918hvnd5Mgu8DCkOY5J85ulw?=
 =?iso-8859-1?Q?y3KnKZ1Ci6R8kLfw03RXvaXIOu91ZDp+RmUGWTDsxV4uszAcgIsxD+TzY7?=
 =?iso-8859-1?Q?lsr4i8wuKd9UOqxLLunmzid33YKPXnNb0RC9vIo1B0LoXEudONWd9nXxm7?=
 =?iso-8859-1?Q?YzgHaRbWTYJWIxTC4NL5XWoC2nJJ0gMtzuyqhHsHzQpMHUcniUFiZAQsmn?=
 =?iso-8859-1?Q?L8gvfRLCvQe2JbBveoC4x9NL8V/CnZ6c7VrM38n9OoPgv3GytqXyuRgGuH?=
 =?iso-8859-1?Q?I1smddM4fjmCnOa4pnJm8Dn+zxCKNGXgy9z94kIFrS43xwME5rTW+J3Gmj?=
 =?iso-8859-1?Q?7d/1vEk2ppDh6znyllhXj4AoZm/TR+WrhrdCHNS1v6CEFwuTWH+SpLcxgE?=
 =?iso-8859-1?Q?KnD8jTRx1s5EutFifKYgA0cgup4+FHC73uTMG6oLuDi6+90aKvW0tR0sxm?=
 =?iso-8859-1?Q?U0EudAppGhZPSH3ogldDET3HOVWD+OrZWLN43VD8OFjm8dYmYAQtmXV0zc?=
 =?iso-8859-1?Q?ASNDadyTpoI6iYiJd+XHVUA3pd4RKDeqBsrnXfT7HW3BoNsaKv6pMYWoYV?=
 =?iso-8859-1?Q?YPhHawj6i76kuiaw/cVLH9hRvEZzNlMebKwENzVhT8jmuUs5Q38+0qmuKJ?=
 =?iso-8859-1?Q?E3GwSLneuveBB1FNznQCVqahr/rSnO814BKktnYwcvX4PgMpYCDVkn34xz?=
 =?iso-8859-1?Q?lGSwK5D2M0TWAQaKMf86edtTf/evaVON1zcrADFZqVwbJL/Qcck4d4Oalf?=
 =?iso-8859-1?Q?LW99YWh0/MB6WVJfBFHBaORNWg7RJO5MOr8v01FsfFgt8fJ9wSTqEbHbKw?=
 =?iso-8859-1?Q?5oki4godfKxNx+tLuDQKrZDRw3K/UBxZka/xwxUcI9pMVd?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB00746CCE4700D43920F1F69EC4A92DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	UJ4TJpFRnisXBLCsVhNTrayRoFffZJl/3+YGCy0ahHJP6WIhDK/J74PPDWQq3cWkoIjApOUYpxfflo5thIvZION6v89SSMgNUPE8Rkg4461j8PI8uMQ4x5sViPbb9KHIF6bQeaHVo6oJQo8ucuiCAG5s/eVbbdD3BeICauOV4c/YNVOuvPv4Al0x/W/jPKyNTw/CuuED59PhnOMQVL31oA3RuRwKGGairHnQWL8i8m6lyA02/QIHvfBwaVLECq1DtpoAg5od5cxBcBOWzsz5nC+6302de0ON7mvTUjHrBFEcckUFKsM9jhnZ8vti4ojx7dqG3S/9eXv/V/PhnIVKPw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47cf4cd4-c44d-49fd-3a2b-08df0745f673
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 09:55:17.8573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYFoJYLghPLJefpX+/a39Lpo2SLCW0cpP4DT9hYsVtBxSSHI0Y0A74o1B5WyLgcKNojcyEovp5XqYup25qLi0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8826
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244762

--_000_DM4SPRMB00746CCE4700D43920F1F69EC4A92DM4SPRMB0074namprd_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann,
Yes, according to the current NVD data, all binutils versions are listed as=
 affected.
I'll send a correction request with NVD to help update the record and align=
 it with the upstream fix status.
Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Thursday, August 27, 2026 6:20 PM
To: sudumbha@cisco.com <sudumbha@cisco.com>; openembedded-core@lists.openem=
bedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] binutils: fix CVE-2026-3441 and CVE-=
2026-3442

On Mon Jul 6, 2026 at 7:46 PM CEST, Sudhir Dumbhare via lists.openembedded.=
org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1], which addresses two out-of-bound=
s
> read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The chang=
es
> shown in [2] are referenced by [3] and [4].
>
> [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dc2bf7=
de1eb77a91d7a3c86d56408bf57de540faf
> [2] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd=
/xcofflink.c;h=3D1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=3Dfde21c9f9583=
baff05e72e390e6bb896d02f9d43;hb=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf;=
hpb=3Dd7f532cb3a46527
> [3] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3441
> [4] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3442
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3441
> https://nvd.nist.gov/vuln/detail/CVE-2026-3442
> https://www.suse.com/security/cve/CVE-2026-3441.html
> https://www.suse.com/security/cve/CVE-2026-3442.html
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  .../binutils/binutils-2.46.inc                |  1 +
>  .../CVE-2026-3441_CVE-2026-3442.patch         | 51 +++++++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441=
_CVE-2026-3442.patch

Because binutils was upgraded in master to 2.47 (with this patch in it),
It should be considered fixed. Could you send a modification request to
NVD to help clean the data? Also, please consider sending a CVE_STATUS
patch for this CVE for master.

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4SPRMB00746CCE4700D43920F1F69EC4A92DM4SPRMB0074namprd_
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
Thanks, Yoann,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Yes, according to the current NVD data, all binutils versions are listed as=
 affected.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I'll send a correction request with NVD to help update the record and align=
 it with the upstream fix status.</div>
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
<b>Sent:</b> Thursday, August 27, 2026 6:20 PM<br>
<b>To:</b> sudumbha@cisco.com &lt;sudumbha@cisco.com&gt;; openembedded-core=
@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br=
>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH] binutils: fix CVE-2026-3441 a=
nd CVE-2026-3442</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Mon Jul 6, 2026 at 7:46 PM CEST, Sudhir =
Dumbhare via lists.openembedded.org wrote:<br>
&gt; From: Sudhir Dumbhare &lt;sudumbha@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix [1], which addresses two out-of-bo=
unds<br>
&gt; read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The ch=
anges<br>
&gt; shown in [2] are referenced by [3] and [4].<br>
&gt;<br>
&gt; [1] <a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dco=
mmit;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf" id=3D"OWA86f74da9-1895-8=
4ce-d76b-a878b838da83" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dc2bf7de1eb7=
7a91d7a3c86d56408bf57de540faf</a><br>
&gt; [2] <a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dbl=
obdiff;f=3Dbfd/xcofflink.c;h=3D1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=
=3Dfde21c9f9583baff05e72e390e6bb896d02f9d43;hb=3Dc2bf7de1eb77a91d7a3c86d564=
08bf57de540faf;hpb=3Dd7f532cb3a46527" id=3D"OWA7d0aedb9-b9e6-1b68-3351-ce76=
982f5c6f" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd/xcoff=
link.c;h=3D1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=3Dfde21c9f9583baff05=
e72e390e6bb896d02f9d43;hb=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf;hpb=3D=
d7f532cb3a46527</a><br>
&gt; [3] <a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-34=
41" id=3D"OWAb440009d-5075-4487-5052-b439a55d877d" class=3D"OWAAutoLink" da=
ta-auth=3D"NotApplicable">
https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3441</a><br>
&gt; [4] <a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-34=
42" id=3D"OWA8b545572-8177-6ee2-2d2f-89f4fbcc092a" class=3D"OWAAutoLink" da=
ta-auth=3D"NotApplicable">
https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3442</a><br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3441" id=3D"OWA7f=
3a60f1-86d5-9dd5-0d61-89f806898213" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-3441</a><br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" id=3D"OWA06=
d3d12c-f626-374c-fe02-e9f49ac7bc4a" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-3442</a><br>
&gt; <a href=3D"https://www.suse.com/security/cve/CVE-2026-3441.html" id=3D=
"OWAf823ac19-a08e-556a-7b5f-6e617cb5f3c3" class=3D"OWAAutoLink" data-auth=
=3D"NotApplicable">
https://www.suse.com/security/cve/CVE-2026-3441.html</a><br>
&gt; <a href=3D"https://www.suse.com/security/cve/CVE-2026-3442.html" id=3D=
"OWA00a9c5fa-d43e-681d-4d66-0d2fa95e7e0c" class=3D"OWAAutoLink" data-auth=
=3D"NotApplicable">
https://www.suse.com/security/cve/CVE-2026-3442.html</a><br>
&gt;<br>
&gt; Signed-off-by: Sudhir Dumbhare &lt;sudumbha@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../binutils/binutils-2.46.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; .../CVE-2026-3441_CVE-2026-3442.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 51 +++++++++++++++++++<br>
&gt;&nbsp; 2 files changed, 52 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2=
026-3441_CVE-2026-3442.patch<br>
<br>
Because binutils was upgraded in master to 2.47 (with this patch in it),<br=
>
It should be considered fixed. Could you send a modification request to<br>
NVD to help clean the data? Also, please consider sending a CVE_STATUS<br>
patch for this CVE for master.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4SPRMB00746CCE4700D43920F1F69EC4A92DM4SPRMB0074namprd_--

