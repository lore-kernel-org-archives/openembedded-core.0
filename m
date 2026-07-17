Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96614C44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:41:07 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7469.1784266862961869844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RIpKIJ6R;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=32195; q=dns/txt;
  s=iport01; t=1784266863; x=1785476463;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=jgAaYQAqH2zyEZbAY39TqmkQ4l6RKzR2RBAfUerlW70=;
  b=RIpKIJ6RcWyES8BQp/uIWlNCJIzkgbAn4LOSou/kUkq+SmfZgpj+65l2
   xYI3vXGeerWoOHynFKjX0LpiBZpxdj7n41lTUzHEU8ZqcDhIlrU9m581A
   ATNcdvZYA5ThX0J8Hwp4pshdQrzinVHnhuYHErcfPQlunoplBQIvey4S+
   hBbxoZj8L1LINMuJq/8aM38iP8e8nXNoId4T99O22uvd+q1l9Cvabm85J
   zStqbmaK8tzFGix7g6KASJluyEMLR/rPZ8ae7z6nZ7CL9YsqxiY2lnfxv
   9/dL5GG4ID0cfRzUMglwdYwj0Z9m31h4esojuP3jWVw45WtKpJPWrRu1f
   Q==;
X-CSE-ConnectionGUID: dSKizhwvTa6/0lAXUdWIJQ==
X-CSE-MsgGUID: kON1SgPHQu6DZEsdwjr8kA==
X-IPAS-Result: =?us-ascii?q?A0BdAAByt1lq/5D/Ja1aHQEBAQEJARIBBQUBZYEZBgELA?=
 =?us-ascii?q?YE8ATBTFnICgSFJA4ggA4UrhliCIQOBE5A3jFEUgWQGDwEBAQ0CLgEVDQQBA?=
 =?us-ascii?q?YUFAo1SAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8BD?=
 =?us-ascii?q?IZaAQEBAQMBEQgxAT0CAQgRAwEBASEOJwodCAIEEwgagmGCHRZBAwECDrFhA?=
 =?us-ascii?q?YE9AolZGjd4gTSBAYMoAT8CQ9t+AQsUAYE4AYU+gxwBASqBNYJdgSIYAYR8J?=
 =?us-ascii?q?xsbgXKBFUJ5L4EJOD6BBYFcAgOBIBQrHgeDboIwBIIiehIbgT8egS1PgV8af?=
 =?us-ascii?q?osOUnIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIyEdFxYeWBsHBRIgKkFFI?=
 =?us-ascii?q?wNPPTgLQwWBVgKCCE4jHwM5f4EvdUp3LWoCEBdpQSSCFIE+AwttPTcUGwMEg?=
 =?us-ascii?q?TUFjFwHQhkjggcxBwZNKBMBKgEEEzhCDxQdWwZIkmAJOX6OIIQdikOVFwoog?=
 =?us-ascii?q?3WMIY0+iDIXhASNFIcDklELmH0jjWeVNiwthH8CBAIEBQIQAQEGgW8GLyuBL?=
 =?us-ascii?q?nAVgyIJShkPjioDFoNghRPJJXkCCQMvAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:udFsdBMQ24hJTc68Hzsl6nc2WUAX0o4cdiYP4ZYhzrVWfbvmpdLpP
 VfU4rNmi1qaFYnY6vcRk+PNqOigQm0P55+drWoPOIJBTR4LiMga3kQgDceJBFe9LavCZC0hF
 8MEX1hgl0w=
IronPort-Data: A9a23:IHTJZK0LfynIenydJfbD5Yhwkn2cJEfYwER7XKvMYLTBsI5bp2dSm
 mEeX2uGM6mDYzb0KdF1YNmwpkhXuJTQxoQwTlZt3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EtbDpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGAHoVPJ8Y5fhLCD8Jr
 fgxGA0BUTGhvrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+OW0aYCOIoXbFK25mG6bg
 USfxGvBIigHavCt5CGJ7XC21uzmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:W6t5j6nN6a3Sr9hHsclWdu8Hv0HpDfMliWdD5ihNYBxZY6Wkfp
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
X-Talos-CUID: =?us-ascii?q?9a23=3AqnZiLWrpLicDRb2ypAbiOZTmUcweUXzPzGjOH0b?=
 =?us-ascii?q?mTj5tYY2oRWCx2poxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A4XT1vg0/1Ii3Du/cLDJE0CA4UzUj4IOIUXsCqbU?=
 =?us-ascii?q?/ppeoBwFrNyiflmS0a9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:41:01 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id AD087180003D5
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:41:01 +0000 (GMT)
X-CSE-ConnectionGUID: q+mlCdewQROuAJTsVOYs3A==
X-CSE-MsgGUID: Lpn2/tjgQ3mlQByDLjbFbg==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="68503519"
Received: from mail-eastusazon11011058.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.58])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYT42jiul6tJHmLRZko2V79iKybbLjcQnIMKuc4FTjvYexZOdtWVqOjSfQQApOg539M/8hG2+7V0hUt7LL6BoUjUF2U1luE/clKi5pb1Wu+QAooGajtv++B75ZQCQ6V6u/Ew3HicjzD8azIdM7EELD7Hrvy30FkF1wBmFvzSnP6MSUV296dDbcZMZPC4q/z6pT8zGzVg3EQ8Rm5NcoM3JLWaYjSfKJ0x58t90OocYRZR8+ck4RYUADWEeFlCqbdTERO/EOpbhvbw1IQT8f4JuaIxc1++bYwJoSaY6PTmlzcMeBMzJ48OPzJFAgfMDfvJSo1mf4Cl1n2oswP96+Ak5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgAaYQAqH2zyEZbAY39TqmkQ4l6RKzR2RBAfUerlW70=;
 b=GeDPdnRJ80OkO8J5fTxyOEihHaIk17Yqw1a+y6rxD2EMASNIum+WtrqybjlpCr3cCI//pw6UsYj25oi0WOt8k1sQBMObYev9SFKeNn27oATPCHtQOpDe7HqC3uXcpzrhSzQyvNlM3D6MUqfxQMN8dkV2ByQJgCEabhzQZAgiU+g7Ll4NdBkP44RkQ7tQfjlSaJPZzyy4lBwBlBcebTho8Sd4rb+d3UDXgYMxdBVTAj1JE2WR6FiN+1Oc6sjwMZDtIoVYHl9xFWYbz/tRINRtN9UA924mtrkRo8lndGxqsgeOzygmXAgSh6AAw/wOZJvy5hBe1q2tmfCoGBRGNS/DwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:40:59 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:40:59 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 6/6] rsync: Fix CVE-2026-45232
Thread-Topic: [wrynose][PATCH v2 6/6] rsync: Fix CVE-2026-45232
Thread-Index: AQHdFawWptT59oBJoEOV46fPkdhqb7ZxMlbD
Date: Fri, 17 Jul 2026 05:40:59 +0000
Message-ID: 
 <PH0PR11MB5902BA1F7556196D9068BDB9CFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
 <20260717052059.773645-7-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-7-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 1e1c5010-d79c-4446-77a8-08dee3c5fb55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|12006099003|16056099006|13003099007|22082099003|38070700021|18002099003|8096899003|56012099006|11063799006|10067099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 Co9f6gdCInLmrBTMVdrdz3dj50Rfwa0KxwCmGGrFGMGVb14EjTp73DXfaSDHmODjQdsxMZ8I7snP49MAW/S2PKJh8IDzHqRCPGNXghoOfWBQwJfoftfYbjVWMy5TLFAesSQvs3jVauYgBEZxE/bVX9nh8/Hq5hjVS5D4KowUnSVmp4PADsO932zgmHDPnp2+e/hUhwN1G/pLMxcZLJ2M10psD/4oGPeFFNo5I6UbCjuPfMuH/b7OqWFA9j75k7Wj1FdLWcXwRycCTg6kdLFqwd5h1C56iRTK7HofNqAE9NJ1T/NNaFWwDrykexspMFnSDBNMTtbE4sRUQKmay7WZXP6/iCN5dYfJLeXnBMJWJdL1Ajrdx3ynasPfZxtYAWX7ML3tkydu6JsiOuHLrIt4y2ez+KQPMSFZMcSIi4W0qm3T3Pm5CFEXHJlO5VW0iWyA/j4xQnxoCkqzePynp1p9j3VCPx/0ts+W7WgPYs56Mq4uwlCP3oF6+EGwf04uHkWniUpn4SPkpo0M31QRjG4qGXvvEHWGpYMJ+cbXz9COvjrxnFyirmP2iPRF7JWsSaUpq2AaoUyYI2Etk0euy04Y2mj/Sx8OeBZcqe3+UTYQI4G4hQShR7+8TogirAD8VPXRelTPbkDQjJRSm0pU6avX9GI4jnIFi3tJUMJaQlcEiJ4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(12006099003)(16056099006)(13003099007)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Erm+Z0p/LPiw8fnjKlbog+ORDLbYdgHQHzHPoLBSpzPb7xkWIh8T6tzCqpsK?=
 =?us-ascii?Q?ss5/mkYCDffK1AKYHQQBuhm5cIqG3y6Ws88MESHC1WKtG65LoaX6d/bWrHYI?=
 =?us-ascii?Q?AYD8AX4Okp9nEoDVD42ELeaMF5nFigjJMe+GxjU9SpKysGoR9zcM8QATutZ4?=
 =?us-ascii?Q?+BYuAYGbizTihE0LLy3wqY1Dly2IGJoaqwjn3jv6PlEU12qQcnRB3I/Ukeqw?=
 =?us-ascii?Q?KNBnUsFXs/WFHfc4snXlmmX6abbN+xNE6+1Ioja+MPavYcPqwNBEz3fZvbjC?=
 =?us-ascii?Q?hN0uqEQrs6Zb65xy5px1JdLaZOGHzPBA0fcK+k9A05SiYoWdsxKfJ8S4IwKH?=
 =?us-ascii?Q?8vO99r4TU49NGb34SEhiYnddF28rcU8a3wbLJspFwQhNJGwstH8om2bTCvgy?=
 =?us-ascii?Q?Vd3f9TQYSQHrmK7Qty0MUN1O9Ff6ln8z8qPMM3JgLUxHRy3EAU3RkY2W6SdF?=
 =?us-ascii?Q?qX+KAHsdlIUK519+m8cLTi6uedZIabv+3wYd50m3P+E9CBh5iRMVd86GBr2h?=
 =?us-ascii?Q?k2RXsC3zBspaiZ5AD+9sV+aCwXByhVk8yYUQTJUor+ZuJTdeBhG5eK4YF71O?=
 =?us-ascii?Q?AyYhCPZE4/lB0nUik4p2t2pohcl090JRygLta1kB2ve/+YJ8NI/mFgMOBWo6?=
 =?us-ascii?Q?pK6T8QpPP2WjI9oH5APv76YmtN+0/rcCZg2TclEaQ6ejMhpGGVISss3ovFRy?=
 =?us-ascii?Q?VTyn16WpdySzKMRc6isja0fjhf5qFbB0yKj48rtahbsZkdBZUY5NFJcAra2p?=
 =?us-ascii?Q?Sd0xCajJ2OwHJZBxg00V8ys3atadiptFEjZaeWZrp/pXCdplRQQMVTD7DbKy?=
 =?us-ascii?Q?DP3lsN7zG6HOd5y1WSz9Ol6D7TMnfJszdLqAiO9xpXgyJ4xjUriQXCEzxQxw?=
 =?us-ascii?Q?7wd4sDZeyc5GMtpSnqyMuNgAmXmjRigk5BjSN6BrZHMWWFwwXmCnjm1bnOrh?=
 =?us-ascii?Q?YfIrVN7puLgYmk6AKNalPNU2zwQP+JzcCibfIWNb4sI8roGTvE+batZgtirg?=
 =?us-ascii?Q?gqlAdc6Nd2n8pncgGUxUrwtLl57RwEeoZ2/QYqScTRTkgFkCzq3wMhz1PNC6?=
 =?us-ascii?Q?lvtPC2uT0zjy60rKQQLT8v1xZNi7yi6ESiDDZdNPmLwTwNPwahgNkvw9gvM6?=
 =?us-ascii?Q?lQ1n7SaQ1UE/oC2I7AneV9qwyCApXNdh97EyokorXe530fRwMcacrOp0MtRn?=
 =?us-ascii?Q?JQ0cVHOQw/Ij2fIvV6u0N4b1T/Duj/8+q0IcW2yHeiCEnGS001aAECKm5ikg?=
 =?us-ascii?Q?R17x1Rq8nmXv0HZKox4r84pYM+2+YjAoIyA7vu2nesgtWdMD7kQlWmqYBBK3?=
 =?us-ascii?Q?HK/2KBz6G7idVkgUEs+9jHoGcfKy8hT+MBOpY2CgIqz2j/PkoEzJTi/wBEoW?=
 =?us-ascii?Q?yvZwJj+Qh0GVI9rfXuToBIrx73JfTUU70GfS1/WgZ1G9LBEMsC9p4ItPr9Qs?=
 =?us-ascii?Q?bFxUp+CU/aluEbiu4zX1oCDMuL1YeGj1EGNVg4lb41eJJbqx7k/B6atjhCRf?=
 =?us-ascii?Q?JKBufzFqFGHT9MhVzBrqzWwGLtYyMk7MgzNYbHqHpf1B03isEcbTcHU0m6wA?=
 =?us-ascii?Q?rZPyFAv4dqZWAiP3L0CgpZbxSsJZmvN3DySd8P9Tyru28ElJOABdAjbKVGIA?=
 =?us-ascii?Q?1kUEPTByIWUwZw6XZm4IWF3/vvwo+zqOGZ2pfRrtYnObl/Npm5u72XsANs1T?=
 =?us-ascii?Q?bLXJuweQaCs/4f+sv5XKtcjjAp+cIgnXOFGUCe81hKRCl7+F?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902BA1F7556196D9068BDB9CFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pU8Ji5slTQDe3O1EZNHL/NrF6gbxEZo8KwFRuFOb9DZCpCpyrMeNxpfgcNNe5IDgkdnNFqVi92bDnlWbwtdM2qI9Ch8I0faFpTntSuW6XW5nKIWaGo0EMqDmQh70SzEr12EH9pKgBvKgMjfpXsB5R3ylyv3J08EI6sbNl9j0jNYKNHyzrw2PM0A/DfF80No1EJTTBAo0TO+rNu+AVzyy0wIcqVtfmt4PFs8jSKUBUeAsQq/ATW5ow/itkBdGDm+sUoJN8VYfmGRMRY8Sf/VOcYNCn9yQgNaN0ZfuO7MbQLqhilbS1eRJAChp/XShEt+1r/hTKLNggojcBVbh/gmAAA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1c5010-d79c-4446-77a8-08dee3c5fb55
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:40:59.7335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HC1ARIOnglQ89G5mgYwWb38zN0s7BQf42W1XPkU9iP8b84Ml+uXr8HQWxS8I+vmggIhKHx/TCnZoBhQRAIpMYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241134

--_000_PH0PR11MB5902BA1F7556196D9068BDB9CFC62PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore this patch series. I will send corrected patches again.

Regards,
Ashish.

________________________________
From: Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco=
) <asparmar@cisco.com>
Sent: 17 July 2026 10:50
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 6/6] rsync: Fix CVE-2026-45232

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-45232. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1aa72f6e34459=
9f97fd4427ecba
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-8f85-j2c=
v-59m8

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-45232.patch          | 240 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 241 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-45232.patch
new file mode 100644
index 0000000000..544793bd1d
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
@@ -0,0 +1,240 @@
+From de47c801a8083f1913e149c6ee6d0e864b728995 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 13 May 2026 20:35:35 +1000
+Subject: [PATCH] socket: reject over-long proxy response line
+
+fixes a one byte stack overflow when using RSYNC_PROXY with a
+malicious proxy.
+
+Reach: only when RSYNC_PROXY is set and a malicious or MITM'd
+proxy returns the pathological response.  The byte written is
+always '\0' and the attacker doesn't choose the offset, so impact
+is corruption of one adjacent stack byte and possible later
+misbehaviour or crash -- no information disclosure beyond the
+existing rprintf of buffer contents.
+
+Reported by Aisle Research via Michal Ruprich
+
+CVE: CVE-2026-45232
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/a5=
fc5ebe7a8ef1aa72f6e344599f97fd4427ecba]
+
+(cherry picked from commit a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ socket.c                                    |  30 +++--
+ testsuite/proxy-response-line-too-long.test | 128 ++++++++++++++++++++
+ 2 files changed, 145 insertions(+), 13 deletions(-)
+ create mode 100755 testsuite/proxy-response-line-too-long.test
+
+diff --git a/socket.c b/socket.c
+index c2075adf..6a8f6f4a 100644
+--- a/socket.c
++++ b/socket.c
+@@ -47,21 +47,23 @@ static struct sigaction sigact;
+
+ static int sock_exec(const char *prog);
+
++#define PROXY_BUF_SIZE 1024
++
+ /* Establish a proxy connection on an open socket to a web proxy by using=
 the
+  * CONNECT method.  If proxy_user and proxy_pass are not NULL, they are u=
sed to
+  * authenticate to the proxy using the "Basic" proxy-authorization protoc=
ol. */
+ static int establish_proxy_connection(int fd, char *host, int port, char =
*proxy_user, char *proxy_pass)
+ {
+-      char *cp, buffer[1024];
+-      char *authhdr, authbuf[1024];
++      char *cp, buffer[PROXY_BUF_SIZE + 1];
++      char *authhdr, authbuf[PROXY_BUF_SIZE + 1];
+        int len;
+
+        if (proxy_user && proxy_pass) {
+-              stringjoin(buffer, sizeof buffer,
++              stringjoin(buffer, PROXY_BUF_SIZE,
+                         proxy_user, ":", proxy_pass, NULL);
+                len =3D strlen(buffer);
+
+-              if ((len*8 + 5) / 6 >=3D (int)sizeof authbuf - 3) {
++              if ((len*8 + 5) / 6 >=3D PROXY_BUF_SIZE - 3) {
+                        rprintf(FERROR,
+                                "authentication information is too long\n"=
);
+                        return -1;
+@@ -74,14 +76,14 @@ static int establish_proxy_connection(int fd, char *ho=
st, int port, char *proxy_
+                authhdr =3D "";
+        }
+
+-      len =3D snprintf(buffer, sizeof buffer, "CONNECT %s:%d HTTP/1.0%s%s=
\r\n\r\n", host, port, authhdr, authbuf);
+-      assert(len > 0 && len < (int)sizeof buffer);
++      len =3D snprintf(buffer, PROXY_BUF_SIZE, "CONNECT %s:%d HTTP/1.0%s%=
s\r\n\r\n", host, port, authhdr, authbuf);
++      assert(len > 0 && len < PROXY_BUF_SIZE);
+        if (write(fd, buffer, len) !=3D len) {
+                rsyserr(FERROR, errno, "failed to write to proxy");
+                return -1;
+        }
+
+-      for (cp =3D buffer; cp < &buffer[sizeof buffer - 1]; cp++) {
++      for (cp =3D buffer; cp < &buffer[PROXY_BUF_SIZE - 1]; cp++) {
+                if (read(fd, cp, 1) !=3D 1) {
+                        rsyserr(FERROR, errno, "failed to read from proxy"=
);
+                        return -1;
+@@ -90,11 +92,13 @@ static int establish_proxy_connection(int fd, char *ho=
st, int port, char *proxy_
+                        break;
+        }
+
+-      if (*cp !=3D '\n')
+-              cp++;
+-      *cp-- =3D '\0';
+-      if (*cp =3D=3D '\r')
+-              *cp =3D '\0';
++      if (cp =3D=3D &buffer[PROXY_BUF_SIZE - 1]) {
++              rprintf(FERROR, "proxy response line too long\n");
++              return -1;
++      }
++      *cp =3D '\0';
++      if (cp > buffer && cp[-1] =3D=3D '\r')
++              cp[-1] =3D '\0';
+        if (strncmp(buffer, "HTTP/", 5) !=3D 0) {
+                rprintf(FERROR, "bad response from proxy -- %s\n",
+                        buffer);
+@@ -110,7 +114,7 @@ static int establish_proxy_connection(int fd, char *ho=
st, int port, char *proxy_
+        }
+        /* throw away the rest of the HTTP header */
+        while (1) {
+-              for (cp =3D buffer; cp < &buffer[sizeof buffer - 1]; cp++) =
{
++              for (cp =3D buffer; cp < &buffer[PROXY_BUF_SIZE]; cp++) {
+                        if (read(fd, cp, 1) !=3D 1) {
+                                rsyserr(FERROR, errno,
+                                        "failed to read from proxy");
+diff --git a/testsuite/proxy-response-line-too-long.test b/testsuite/proxy=
-response-line-too-long.test
+new file mode 100755
+index 00000000..7f55c43b
+--- /dev/null
++++ b/testsuite/proxy-response-line-too-long.test
+@@ -0,0 +1,128 @@
++#!/bin/sh
++
++# Copyright (C) 2026 by Andrew Tridgell
++
++# This program is distributable under the terms of the GNU GPL (see
++# COPYING).
++
++# Regression test for the off-by-one stack OOB write in
++# establish_proxy_connection() in socket.c when a malicious or
++# man-in-the-middle HTTP proxy returns a first response line of
++# 1023+ bytes without a '\n' terminator.
++#
++# Pre-fix: the read loop walked buffer[0..sizeof-2] one byte at a
++# time, then post-loop logic did "if (*cp !=3D '\n') cp++; *cp-- =3D
++# '\0';".  If no newline arrived before the loop filled the buffer,
++# cp was left at &buffer[sizeof-1] (never written by the loop),
++# *cp held stale stack bytes, and cp++ pushed cp one past the array.
++# The null-termination then wrote one byte out of bounds on the
++# stack.  AddressSanitizer reports stack-buffer-overflow at the
++# null-termination site.
++#
++# Post-fix: the bound-exhaustion case is detected by position and
++# rejected with an "proxy response line too long" message, so no
++# OOB write occurs and rsync exits with a non-signal status.
++
++. "$suitedir/rsync.fns"
++
++command -v python3 >/dev/null 2>&1 || test_skipped "python3 not available=
"
++
++workdir=3D"$scratchdir/workdir"
++mkdir -p "$workdir"
++cd "$workdir"
++
++port_file=3D"$workdir/port"
++proxy_log=3D"$workdir/proxy.log"
++
++# A minimal TCP listener: binds to an ephemeral port on 127.0.0.1,
++# writes the chosen port to $port_file *before* accept() so the test
++# can synchronise without a sleep, accepts one connection, reads
++# until end-of-headers or 64 KiB, sends exactly 1023 bytes of 'X'
++# with no '\n', then closes.
++python3 - "$port_file" >"$proxy_log" 2>&1 <<'PYEOF' &
++import socket, sys, os
++port_file =3D sys.argv[1]
++s =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
++s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
++s.bind(("127.0.0.1", 0))
++port =3D s.getsockname()[1]
++tmp =3D port_file + ".tmp"
++with open(tmp, "w") as fp:
++    fp.write("%d\n" % port)
++os.rename(tmp, port_file)   # atomic visibility to the shell side
++s.listen(1)
++conn, _ =3D s.accept()
++conn.settimeout(5)
++try:
++    data =3D b""
++    while b"\r\n\r\n" not in data and len(data) < 65536:
++        chunk =3D conn.recv(8192)
++        if not chunk:
++            break
++        data +=3D chunk
++except socket.timeout:
++    pass
++conn.sendall(b"X" * 1023)    # exactly the buffer-1 trigger size
++try:
++    conn.shutdown(socket.SHUT_RDWR)
++except OSError:
++    pass
++conn.close()
++s.close()
++PYEOF
++proxy_pid=3D$!
++
++# Wait up to ~10s for the listener to publish its port.
++i=3D0
++while [ ! -s "$port_file" ] && [ $i -lt 10 ]; do
++    sleep 1
++    i=3D$((i + 1))
++done
++
++if [ ! -s "$port_file" ]; then
++    kill "$proxy_pid" 2>/dev/null
++    cat "$proxy_log" >&2 2>/dev/null
++    test_fail "proxy listener never published a port"
++fi
++
++port=3D`cat "$port_file"`
++case "$port" in
++    *[!0-9]*|"") kill "$proxy_pid" 2>/dev/null; test_fail "bogus port fro=
m listener: '$port'" ;;
++esac
++
++# Run rsync through the malicious proxy.  Any rsync:// URL works:
++# the proxy intercepts the CONNECT and never forwards anywhere.
++rsync_err=3D"$workdir/rsync.err"
++
++# rsync MUST exit non-zero here (the proxy is misbehaving).
++# Use `|| status=3D$?` so we capture the real exit code under `sh -e`;
++# `if ! cmd; then status=3D$?` would only ever see 0 because the `!`
++# is the last command before `$?`.
++status=3D0
++RSYNC_PROXY=3D"127.0.0.1:$port" \
++    $RSYNC rsync://example.invalid:873/whatever/ "$workdir/out/" \
++    >/dev/null 2>"$rsync_err" || status=3D$?
++
++# Reap the listener.
++wait "$proxy_pid" 2>/dev/null || true
++
++# 1. rsync must not have crashed (SIGSEGV/SIGABRT report >=3D 128).
++if [ "$status" -ge 128 ]; then
++    cat "$rsync_err" >&2
++    test_fail "rsync killed by signal (status=3D$status) -- possible stac=
k OOB regression"
++fi
++
++# 2. rsync must have actually exited non-zero (i.e. saw the bad proxy).
++if [ "$status" -eq 0 ]; then
++    cat "$rsync_err" >&2
++    test_fail "rsync returned success despite malformed proxy response"
++fi
++
++# 3. The new error message must appear.
++if ! grep -q "proxy response line too long" "$rsync_err"; then
++    cat "$rsync_err" >&2
++    test_fail "expected 'proxy response line too long' in rsync stderr"
++fi
++
++echo "OK: over-long proxy response line rejected cleanly without crashing=
"
++exit 0
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb
index d0d57defe8..2744b3a80f 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://CVE-2026-43618.patch \
            file://CVE-2026-43620.patch \
            file://CVE-2026-43617.patch \
+           file://CVE-2026-45232.patch \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf6=
9850d65fd88c52"

--
2.35.6

--_000_PH0PR11MB5902BA1F7556196D9068BDB9CFC62PH0PR11MB5902namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this patch series. I will send corrected patches again.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ashish.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashishkumar Parmar X =
(asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&gt=
;<br>
<b>Sent:</b> 17 July 2026 10:50<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;<br>
<b>Subject:</b> [wrynose][PATCH v2 6/6] rsync: Fix CVE-2026-45232</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
This patch applies the upstream v3.4.3 backport for<br>
CVE-2026-45232. The upstream fix commit is referenced in [1],<br>
and the public CVE advisory is referenced in [2].<br>
<br>
[1] <a href=3D"https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1a=
a72f6e344599f97fd4427ecba">
https://github.com/RsyncProject/rsync/commit/a5fc5ebe7a8ef1aa72f6e344599f97=
fd4427ecba</a><br>
[2] <a href=3D"https://github.com/RsyncProject/rsync/security/advisories/GH=
SA-8f85-j2cv-59m8">
https://github.com/RsyncProject/rsync/security/advisories/GHSA-8f85-j2cv-59=
m8</a><br>
<br>
Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
---<br>
&nbsp;.../rsync/files/CVE-2026-45232.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 240 ++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;2 files changed, 241 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.p=
atch<br>
<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-45232.patch<br>
new file mode 100644<br>
index 0000000000..544793bd1d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-45232.patch<br>
@@ -0,0 +1,240 @@<br>
+From de47c801a8083f1913e149c6ee6d0e864b728995 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Wed, 13 May 2026 20:35:35 +1000<br>
+Subject: [PATCH] socket: reject over-long proxy response line<br>
+<br>
+fixes a one byte stack overflow when using RSYNC_PROXY with a<br>
+malicious proxy.<br>
+<br>
+Reach: only when RSYNC_PROXY is set and a malicious or MITM'd<br>
+proxy returns the pathological response.&nbsp; The byte written is<br>
+always '\0' and the attacker doesn't choose the offset, so impact<br>
+is corruption of one adjacent stack byte and possible later<br>
+misbehaviour or crash -- no information disclosure beyond the<br>
+existing rprintf of buffer contents.<br>
+<br>
+Reported by Aisle Research via Michal Ruprich<br>
+<br>
+CVE: CVE-2026-45232<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba">https://github.com/Rsync=
Project/rsync/commit/a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba</a>]<br>
+<br>
+(cherry picked from commit a5fc5ebe7a8ef1aa72f6e344599f97fd4427ecba)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ socket.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp; 30 +++--<br>
+ testsuite/proxy-response-line-too-long.test | 128 ++++++++++++++++++++<br=
>
+ 2 files changed, 145 insertions(+), 13 deletions(-)<br>
+ create mode 100755 testsuite/proxy-response-line-too-long.test<br>
+<br>
+diff --git a/socket.c b/socket.c<br>
+index c2075adf..6a8f6f4a 100644<br>
+--- a/socket.c<br>
++++ b/socket.c<br>
+@@ -47,21 +47,23 @@ static struct sigaction sigact;<br>
+ <br>
+ static int sock_exec(const char *prog);<br>
+ <br>
++#define PROXY_BUF_SIZE 1024<br>
++<br>
+ /* Establish a proxy connection on an open socket to a web proxy by using=
 the<br>
+&nbsp; * CONNECT method.&nbsp; If proxy_user and proxy_pass are not NULL, =
they are used to<br>
+&nbsp; * authenticate to the proxy using the &quot;Basic&quot; proxy-autho=
rization protocol. */<br>
+ static int establish_proxy_connection(int fd, char *host, int port, char =
*proxy_user, char *proxy_pass)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *cp, buffer[1024];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *authhdr, authbuf[1024];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *cp, buffer[PROXY_BUF_SIZE + 1];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *authhdr, authbuf[PROXY_BUF_SIZE + 1]=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int len;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (proxy_user &amp;&amp; proxy=
_pass) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; stringjoin(buffer, sizeof buffer,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; stringjoin(buffer, PROXY_BUF_SIZE,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prox=
y_user, &quot;:&quot;, proxy_pass, NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; len =3D strlen(buffer);<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if ((len*8 + 5) / 6 &gt;=3D (int)sizeof authbuf - 3) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if ((len*8 + 5) / 6 &gt;=3D PROXY_BUF_SIZE - 3) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FE=
RROR,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;authentication information is t=
oo long\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+@@ -74,14 +76,14 @@ static int establish_proxy_connection(int fd, char *ho=
st, int port, char *proxy_<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; authhdr =3D &quot;&quot;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D snprintf(buffer, sizeof buffer, &q=
uot;CONNECT %s:%d HTTP/1.0%s%s\r\n\r\n&quot;, host, port, authhdr, authbuf)=
;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(len &gt; 0 &amp;&amp; len &lt; (int=
)sizeof buffer);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D snprintf(buffer, PROXY_BUF_SIZE, &=
quot;CONNECT %s:%d HTTP/1.0%s%s\r\n\r\n&quot;, host, port, authhdr, authbuf=
);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(len &gt; 0 &amp;&amp; len &lt; PROX=
Y_BUF_SIZE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write(fd, buffer, len) !=3D=
 len) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; rsyserr(FERROR, errno, &quot;failed to write to proxy&quot=
;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (cp =3D buffer; cp &lt; &amp;buffer[si=
zeof buffer - 1]; cp++) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (cp =3D buffer; cp &lt; &amp;buffer[PR=
OXY_BUF_SIZE - 1]; cp++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (read(fd, cp, 1) !=3D 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FE=
RROR, errno, &quot;failed to read from proxy&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+@@ -90,11 +92,13 @@ static int establish_proxy_connection(int fd, char *ho=
st, int port, char *proxy_<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*cp !=3D '\n')<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; cp++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cp-- =3D '\0';<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*cp =3D=3D '\r')<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *cp =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cp =3D=3D &amp;buffer[PROXY_BUF_SIZE -=
 1]) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; rprintf(FERROR, &quot;proxy response line too long\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cp =3D '\0';<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cp &gt; buffer &amp;&amp; cp[-1] =3D=
=3D '\r')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; cp[-1] =3D '\0';<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncmp(buffer, &quot;HTTP/=
&quot;, 5) !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; rprintf(FERROR, &quot;bad response from proxy -- %s\n&quot=
;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buffer);<b=
r>
+@@ -110,7 +114,7 @@ static int establish_proxy_connection(int fd, char *ho=
st, int port, char *proxy_<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* throw away the rest of the H=
TTP header */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (1) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (cp =3D buffer; cp &lt; &amp;buffer[sizeof buffer - 1]; cp++) {<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (cp =3D buffer; cp &lt; &amp;buffer[PROXY_BUF_SIZE]; cp++) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (read(f=
d, cp, 1) !=3D 1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FERROR, errno,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;failed to read from proxy&quot;);<br>
+diff --git a/testsuite/proxy-response-line-too-long.test b/testsuite/proxy=
-response-line-too-long.test<br>
+new file mode 100755<br>
+index 00000000..7f55c43b<br>
+--- /dev/null<br>
++++ b/testsuite/proxy-response-line-too-long.test<br>
+@@ -0,0 +1,128 @@<br>
++#!/bin/sh<br>
++<br>
++# Copyright (C) 2026 by Andrew Tridgell<br>
++<br>
++# This program is distributable under the terms of the GNU GPL (see<br>
++# COPYING).<br>
++<br>
++# Regression test for the off-by-one stack OOB write in<br>
++# establish_proxy_connection() in socket.c when a malicious or<br>
++# man-in-the-middle HTTP proxy returns a first response line of<br>
++# 1023+ bytes without a '\n' terminator.<br>
++#<br>
++# Pre-fix: the read loop walked buffer[0..sizeof-2] one byte at a<br>
++# time, then post-loop logic did &quot;if (*cp !=3D '\n') cp++; *cp-- =3D=
<br>
++# '\0';&quot;.&nbsp; If no newline arrived before the loop filled the buf=
fer,<br>
++# cp was left at &amp;buffer[sizeof-1] (never written by the loop),<br>
++# *cp held stale stack bytes, and cp++ pushed cp one past the array.<br>
++# The null-termination then wrote one byte out of bounds on the<br>
++# stack.&nbsp; AddressSanitizer reports stack-buffer-overflow at the<br>
++# null-termination site.<br>
++#<br>
++# Post-fix: the bound-exhaustion case is detected by position and<br>
++# rejected with an &quot;proxy response line too long&quot; message, so n=
o<br>
++# OOB write occurs and rsync exits with a non-signal status.<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++command -v python3 &gt;/dev/null 2&gt;&amp;1 || test_skipped &quot;python=
3 not available&quot;<br>
++<br>
++workdir=3D&quot;$scratchdir/workdir&quot;<br>
++mkdir -p &quot;$workdir&quot;<br>
++cd &quot;$workdir&quot;<br>
++<br>
++port_file=3D&quot;$workdir/port&quot;<br>
++proxy_log=3D&quot;$workdir/proxy.log&quot;<br>
++<br>
++# A minimal TCP listener: binds to an ephemeral port on 127.0.0.1,<br>
++# writes the chosen port to $port_file *before* accept() so the test<br>
++# can synchronise without a sleep, accepts one connection, reads<br>
++# until end-of-headers or 64 KiB, sends exactly 1023 bytes of 'X'<br>
++# with no '\n', then closes.<br>
++python3 - &quot;$port_file&quot; &gt;&quot;$proxy_log&quot; 2&gt;&amp;1 &=
lt;&lt;'PYEOF' &amp;<br>
++import socket, sys, os<br>
++port_file =3D sys.argv[1]<br>
++s =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)<br>
++s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)<br>
++s.bind((&quot;127.0.0.1&quot;, 0))<br>
++port =3D s.getsockname()[1]<br>
++tmp =3D port_file + &quot;.tmp&quot;<br>
++with open(tmp, &quot;w&quot;) as fp:<br>
++&nbsp;&nbsp;&nbsp; fp.write(&quot;%d\n&quot; % port)<br>
++os.rename(tmp, port_file)&nbsp;&nbsp; # atomic visibility to the shell si=
de<br>
++s.listen(1)<br>
++conn, _ =3D s.accept()<br>
++conn.settimeout(5)<br>
++try:<br>
++&nbsp;&nbsp;&nbsp; data =3D b&quot;&quot;<br>
++&nbsp;&nbsp;&nbsp; while b&quot;\r\n\r\n&quot; not in data and len(data) =
&lt; 65536:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chunk =3D conn.recv(8192)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if not chunk:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data +=3D chunk<br>
++except socket.timeout:<br>
++&nbsp;&nbsp;&nbsp; pass<br>
++conn.sendall(b&quot;X&quot; * 1023)&nbsp;&nbsp;&nbsp; # exactly the buffe=
r-1 trigger size<br>
++try:<br>
++&nbsp;&nbsp;&nbsp; conn.shutdown(socket.SHUT_RDWR)<br>
++except OSError:<br>
++&nbsp;&nbsp;&nbsp; pass<br>
++conn.close()<br>
++s.close()<br>
++PYEOF<br>
++proxy_pid=3D$!<br>
++<br>
++# Wait up to ~10s for the listener to publish its port.<br>
++i=3D0<br>
++while [ ! -s &quot;$port_file&quot; ] &amp;&amp; [ $i -lt 10 ]; do<br>
++&nbsp;&nbsp;&nbsp; sleep 1<br>
++&nbsp;&nbsp;&nbsp; i=3D$((i + 1))<br>
++done<br>
++<br>
++if [ ! -s &quot;$port_file&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; kill &quot;$proxy_pid&quot; 2&gt;/dev/null<br>
++&nbsp;&nbsp;&nbsp; cat &quot;$proxy_log&quot; &gt;&amp;2 2&gt;/dev/null<b=
r>
++&nbsp;&nbsp;&nbsp; test_fail &quot;proxy listener never published a port&=
quot;<br>
++fi<br>
++<br>
++port=3D`cat &quot;$port_file&quot;`<br>
++case &quot;$port&quot; in<br>
++&nbsp;&nbsp;&nbsp; *[!0-9]*|&quot;&quot;) kill &quot;$proxy_pid&quot; 2&g=
t;/dev/null; test_fail &quot;bogus port from listener: '$port'&quot; ;;<br>
++esac<br>
++<br>
++# Run rsync through the malicious proxy.&nbsp; Any rsync:// URL works:<br=
>
++# the proxy intercepts the CONNECT and never forwards anywhere.<br>
++rsync_err=3D&quot;$workdir/rsync.err&quot;<br>
++<br>
++# rsync MUST exit non-zero here (the proxy is misbehaving).<br>
++# Use `|| status=3D$?` so we capture the real exit code under `sh -e`;<br=
>
++# `if ! cmd; then status=3D$?` would only ever see 0 because the `!`<br>
++# is the last command before `$?`.<br>
++status=3D0<br>
++RSYNC_PROXY=3D&quot;127.0.0.1:$port&quot; \<br>
++&nbsp;&nbsp;&nbsp; $RSYNC rsync://example.invalid:873/whatever/ &quot;$wo=
rkdir/out/&quot; \<br>
++&nbsp;&nbsp;&nbsp; &gt;/dev/null 2&gt;&quot;$rsync_err&quot; || status=3D=
$?<br>
++<br>
++# Reap the listener.<br>
++wait &quot;$proxy_pid&quot; 2&gt;/dev/null || true<br>
++<br>
++# 1. rsync must not have crashed (SIGSEGV/SIGABRT report &gt;=3D 128).<br=
>
++if [ &quot;$status&quot; -ge 128 ]; then<br>
++&nbsp;&nbsp;&nbsp; cat &quot;$rsync_err&quot; &gt;&amp;2<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;rsync killed by signal (status=3D$stat=
us) -- possible stack OOB regression&quot;<br>
++fi<br>
++<br>
++# 2. rsync must have actually exited non-zero (i.e. saw the bad proxy).<b=
r>
++if [ &quot;$status&quot; -eq 0 ]; then<br>
++&nbsp;&nbsp;&nbsp; cat &quot;$rsync_err&quot; &gt;&amp;2<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;rsync returned success despite malform=
ed proxy response&quot;<br>
++fi<br>
++<br>
++# 3. The new error message must appear.<br>
++if ! grep -q &quot;proxy response line too long&quot; &quot;$rsync_err&qu=
ot;; then<br>
++&nbsp;&nbsp;&nbsp; cat &quot;$rsync_err&quot; &gt;&amp;2<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;expected 'proxy response line too long=
' in rsync stderr&quot;<br>
++fi<br>
++<br>
++echo &quot;OK: over-long proxy response line rejected cleanly without cra=
shing&quot;<br>
++exit 0<br>
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb<br>
index d0d57defe8..2744b3a80f 100644<br>
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.samba=
.org/pub/${BPN}/src/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43618.patch">file://CVE-2026-43618.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43620.patch">file://CVE-2026-43620.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43617.patch">file://CVE-2026-43617.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-45232.patch">file://CVE-2026-45232.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;2924bcb3a1ed8b551fc101f740b9f0fe0a202b11=
5027647cf69850d65fd88c52&quot;<br>
&nbsp;<br>
-- <br>
2.35.6<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5902BA1F7556196D9068BDB9CFC62PH0PR11MB5902namp_--

