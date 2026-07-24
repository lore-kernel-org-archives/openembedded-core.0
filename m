Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1D5C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 04:49:42 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12820.1784868581300058329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 21:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LSU8AEU7;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11698; q=dns/txt;
  s=iport01; t=1784868581; x=1786078181;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=AWZB2Hu0E3yuQpP71M0To/z/bd1Y1PQLNpSofNlVwqQ=;
  b=LSU8AEU7Kyfz+yT8sEpwwHzL5wc6Jsiz2lbpPwSD2zPC5v628EcPPtSj
   upmAXJQi1STuNuaxvqsFC8E/oJNEdjW3OkwPi5zq0pOamX8qDzp1Pnx/m
   vxR7611hiIIWPBQavLNOuH2E5Qv4T6mVwe+KV9+0jVpEW3gYr4JeqfgQF
   BMzWw/SHU93iU2D/zaOP8BcYRVSti6o9T+CXETUcSEycJa8Qh+QT9UWqL
   HH2WBv9GtryZ88Us4cPlEtyB4greUnT+QA8NJjAzCxTHmHknBI41TMnQM
   u7QjVuqN7ytYEPs/pN7QSfHcP6ellYATmVltv8uYh738ZshMzalYqAk4Q
   w==;
X-CSE-ConnectionGUID: sG/bDybAQ2ubphi/3O4yvg==
X-CSE-MsgGUID: ubIsrG4TTjmzR0fqLKjqDQ==
X-IPAS-Result: =?us-ascii?q?A0AXBABf7mJq/4//Ja1agS6BK4E9ATBTgQgCgQ8SSQSIH?=
 =?us-ascii?q?wOFK4h5A5FKjFGBdAoPAQEBDQIuARUNBAEBhQUCjV8CJjQJDgECBAMCAwEBA?=
 =?us-ascii?q?QEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgEBAQEDARE5AS0QAgEIEQQBA?=
 =?us-ascii?q?QEdEScKHQgCBAENBQgagmGCHRZBAwECDrV4AYE9AooqeIE0gQGDKAE/AkPcC?=
 =?us-ascii?q?hWBOIU/gwEbAQEFJUlsgl2BIhgBhHwnGxuBcoFXgmk+gQWBXAICAReBHSs8g?=
 =?us-ascii?q?1eCMASCInoSG4NJgV+Ma1JyIgMmMywBVRMXCwcFgSMQMwMqLy0jSwUtHXAMJ?=
 =?us-ascii?q?xIPHRcWHlgbBwUSICpBRSMDQTY4C0MFgVYCgXg/Ix8DOX+BL3VKdy1pAQIQF?=
 =?us-ascii?q?0o4JINJAoE3AwttPTcGDhkDBIE1BYx/B1sjgj8BgQ4BByRPgTUPH6MIjmCVF?=
 =?us-ascii?q?woog3WMIY0+iDIXhASBV4s9hwOSUQuYfSONZ5U0ByUIGYUNAgQCBAUCEAEBB?=
 =?us-ascii?q?oFoPIFEDgdwFYMiCQpAGQ+SI4UTxQl5AgEIMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-PHdr: A9a23:D21EAhE8HmedDDtbGqfm0J1GfhMY04WdBeZdwoAsh7QLdbys4NG5e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:f1FRfqrVRlMGmiOQuhORezVYeVheBmJDZBIvgKrLsJaIsI4StFCzt
 garIBnQbP3eYWHzLt53YYzn/R4D6pXVzdNmQAJq+S8wRXkT8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8k834JwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v1YRmti5
 PYxEWoQZAiDhqXt5+6qVOY506zPLOGzVG8ekmtrwTecCbMtRorOBv2Uo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LU/rSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHJ4EwhrC/
 D2uE2LRHxs7L8awlQa58He+vLfBhAfYWps+LejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNpottdQ9Qnoh0
 Vrhc87VOAGDeYa9EBq13ryVtji1fyMSKAc/ieUsFGPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:q5jiDqnYm33TYatGFYadjBj9N/npDfMsiWdD5ihNYBxZY6Wkfp
 +V7ZcmPE7P6Ar5BktApTnZAtj/fZq9z/JICYl4B8bFYOCUghrYEGgC1/qs/9SOIVyFygcw79
 YFT0E6MqyOMbEYt7e13ODbKadc/DDvysnB7omurQYJcegpUdAd0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvGRV0nKu6AKj0uWe/Fq9fXlJTgTyInKnccgjWmvHeD0pK/NwKX8Cs/flp0rIsKwC
 zoggb57qKsv7WBzAPA12jc1pJSmNHw4NpODs6Bh6EuW3TRYwCTC7hJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kds11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KDoM293amMa/hZrDvynZMQq59Us5WZa/pGVFZll/1awKqSKuZZIMu10vF9LA
 AkNrCt2B8fSyLoU5mehBgu/PWcGlIuAxyBXk8O/uaR0zRQgTRF6nFw/r1Eop/Fn6hNF6WtII
 //Q/lVfL0idL5lUYttQOgGWse5EWrLXFbFN3+TO03uEOUdN2vKsIOf2sR+2AiGQu1B8HIJou
 WLbHpI8WopP07+A8yH25NGthjLXWWmRDzojsVT/YJwtLHwTKfidXTrciFjr+Kw5/EERsHLUf
 e6P5xbR/flMGv1AI5MmwnzQYNbJ3USWNAc/tw7R1WNqMTWLZCCjJ2XTN/DYL72VTo0UGL2BX
 UOGDD1OcVb90iuHmT1hRDAMkmdM3AXPagAZpQy09Jjv7TlbLc8xzT9oW7Jkv22FQ==
X-Talos-CUID: 9a23:iR7vWmFzsMog1JrJqmJ82wkeNtEvW0SH0X3II07/UkE1WaOaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A3wvxGA1ZNg+oD1Me3hVD1sEv7jUj/q6PE1oizak?=
 =?us-ascii?q?6ucyWD3R+IhO+ji2be9py?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 04:49:40 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 402131800027A
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 04:49:40 +0000 (GMT)
X-CSE-ConnectionGUID: 1SZRvCjISai1tE0v77IcRw==
X-CSE-MsgGUID: RzEbE8OhThWh3O1xWsJECA==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,181,1779148800"; 
   d="scan'208,217";a="74831604"
Received: from mail-eastusazon11011025.outbound.protection.outlook.com (HELO BL2PR02CU003.outbound.protection.outlook.com) ([52.101.52.25])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Jul 2026 04:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtiwfMnKlXrwMQCQmxDjbxnNQ2oNfU+aNy84SmtXhbTkK+G7aGCTsJulmoVAJlqwHZkpHNX8cjYK/KGtOdb+Xk6g/Z5XKvkQ9BiV/Dtwkv8NWosXMQk4R1sDfzNzCd7eVHLwWtW9IiNAXHPimHL7NFC+2QVTJuF5LXjT9Jb9YZS7d+OfDXMVt8YNhBryU4Oj3eUBUVrqyOaGXVeVAq3CSTN6G4rmrWz3Z4lr3NsovDF6yFTMI02exZu1TQL7gFrPYibCKhtwZ+r9ohDiGNYo3VDeTxmGU1REQflBD6VaTXgTKq/BLoyOgr7nOH7E/wOI43FRHrrv00WFjGWHyl+19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWZB2Hu0E3yuQpP71M0To/z/bd1Y1PQLNpSofNlVwqQ=;
 b=SO9IFlTw6fzoEwam2qoEa1/uIWyYfpBN8CToXKypaZuHsCqW/q3ccIupM95Kiz+AfKFOfZKBKF04ydH+HCEh3o1rxsziKftv34bMGqs3kw7mTgX43cHS69bECpPLp9ESaX1mj48/AzAg9VLY3DWQAl0SVG7jeVPdMV2KiTtpi+CgiWqI2u0XAXn9/G3pmvWHsCEVeI1xrBbIl039iLd9ZIOecrSRNQ4ft7iUe2XpBys/2TyZ2dvpxoQYXj9dS8vMwYiFnOrghg0ztPKFSi/Max2ERV4tQqBvC1kaJbNiWZblxwTtXEVOcjGgWecPbntSa+g8AN3/fRAPHfpPnuBj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 04:49:33 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 04:49:33 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Thread-Topic: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Thread-Index: AQHc+mUoPWNwtzk+sEGobmto1GtfqrZKgIUAgBZhxACAARE4hoAZH6wAgAFHaq4=
Date: Fri, 24 Jul 2026 04:49:33 +0000
Message-ID: 
 <PH0PR11MB590227CC768C33B5C5228D91CFCF2@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
 <DJFJLZY26OV8.76VQNOV5VDTV@smile.fr> <DJRNRSGCJSS1.3IN9OYGAAPQRV@smile.fr>
 <PH0PR11MB5902323581BA2A35BBF25BCECFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
 <DK5U5SYK16CF.2W33HEF9ZSW8Y@smile.fr>
In-Reply-To: <DK5U5SYK16CF.2W33HEF9ZSW8Y@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|CO1PR11MB5108:EE_
x-ms-office365-filtering-correlation-id: 19ab2edf-a5f1-4df5-f680-08dee93ef4bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|38070700021|10067099003|8096899003|56012099006|4143699003|11063799006|6133799003|13003099007|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 dLBTgbHLjtFxTseN9YJuxJBnXRhryeFjglRfygz3R45Lw3gWqYa+vWrAE890d+bv3Wge1vevTLPWtTe/ZmAa5x8uycCvimWmclRzNktiW8ECgUL575oVgtDdsBuOHN6fulJvIS9VE28VNG5/nhoi5g+yzQ/AsHYPzNXwp1yOkKToEt9DWmvZ6gG4Zu71ckw8qQhwKuDXOfYMxiT7BMTa5GK4WdB/lm7gAX3WNSFLHLvy79RRBhUDZecLZe39lZKRZLW4QG/XZQ6O/U9k8/UEYcy2NEN1EBMaQFbsBvc8SHG6YPlGuudD9s3LPiGDV5I+RyiAXN3QNsnwNz8gS6GmguSub5Hgd6fJbKBD/6Tvs3GBRatJuXKe/mBBKaH3gYAaU9OElL85o9hMiP3G9exAi9R2C8uNQgTc+RYl2x0fM8ahRKWPaMK/uDvz2WO0SnlhIs+ODBZaOT69z+J3UO9wcyPE03rjNuCRAIex33TnlUyvzGpU1xm3NQN9/sBAShEUAf58V35Yr2leqP1nW9GfkTCIpFVvKATKGaHxHaTVcdIaWcRw74d+/kTHY2gz+gpSKEzMILo4td4ze0S87oaxPOgjfJt3efR8g6B1dxrlTgecNYKtW+3cfH8iYmm8yMZw8nnrWXRBnMwPfJNr2/OyBXHZpkRrBLtYH2bOoK6ehfoSzuIU/SlSgIkMSBS1nijEqRcuHuyo70883kO7ga3SdbX5smF3ipEYucLfAwHc3KM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(38070700021)(10067099003)(8096899003)(56012099006)(4143699003)(11063799006)(6133799003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qyiI9ildbbKG75TcTyd148GIZ15GIpY6egqeb0vEx6SXJq4ldFHAu3i7Xf4A?=
 =?us-ascii?Q?h0PFjuXu5agIoo/8JyX7woSl+AfmB4qrdg4j8bK17ik+0REYrkC72YYZ2fDf?=
 =?us-ascii?Q?FDBd8RtsNJvSoyGbLuDul1cbup5wI308sT9bawK5LO4Yd6MIKriIee8ls1HC?=
 =?us-ascii?Q?KWRkw8iwzTf2kIDaWvyMV8JD6j2Z9dpKolpr7nAvJsae7Gy1pYXxz990GYvr?=
 =?us-ascii?Q?QsV0PTZ5uJB4jxj6bFWnsPAJ+aUFG+1N8CoiNyYFL9Y7+aWQIQ2zhKGCAK5s?=
 =?us-ascii?Q?XdcMpSU9BKeI8aCQPgh8zj1dG1ZBxRoXcy5LUUER2hgHjwf+V+GuF+NDN6AF?=
 =?us-ascii?Q?TnLbsUV3/SehRnND8u/JjHMdkLpKIj6DmdVqZg7dXJkNBy6JXLCjpZm9r0pb?=
 =?us-ascii?Q?YTlgQy3zKfFarE4W/iTkdKkS+D+YjAksH1T/qk6NSv/U1t+mCEsFoIeR29AT?=
 =?us-ascii?Q?QSX8gwXxm15s0NHkrvjGBNImIuGL/zyD7ccQCqp8irQSPCg/3+Opicy7JbE3?=
 =?us-ascii?Q?vihaPaghsyWZ4bf43gnpE8CHC6hRi3Vo3KRurVIoiPHYgl4ZAA7lwgKxoVsb?=
 =?us-ascii?Q?jJAQESkHxsf7m2fPdKdNCVyvuWWqJGX+m46/XXgKNBtV+OHhOJ+axuhiYbAc?=
 =?us-ascii?Q?81vtqdgJXvAXVl7hWDQUHKy6me6pv2mn18OYpx7iLEGQicZD9leU8vb4MyjV?=
 =?us-ascii?Q?owvv6M6PkytNKng83hCVuIW0+1pYKkHdTgBgbpYhPd1Nu5gEnkZOOF/mm/6o?=
 =?us-ascii?Q?NZhYDvfu7OBOa/B4NOHCiixqoTLNnrgKGNp9h9Q4FJ11+8ulgz+ern+FNF3x?=
 =?us-ascii?Q?CkY72w3H85LCVC251cd33rgJ43fSF8ztNWRuMTNen1Am0Pq58/KJplaOIdzc?=
 =?us-ascii?Q?qOfxGlhrwDB110lRqfq7Arzgg5C8ZB0kDNnht8wwJ0RLUMK3QrzTQkmI+1j1?=
 =?us-ascii?Q?lS2ZbojsLaXrQ9tvRrP8f2xJRMo+TtMxma5RDfvo0u1VxCXji6Nmv9YWhTNl?=
 =?us-ascii?Q?ERbvNVpD8yizJsSZ+QUOJGwVk8cZ3jrAyGr+pDXnsCPIjfXZoOw0Uw3MyRKp?=
 =?us-ascii?Q?9yt3KPEJcxEootUuTLzjX7I+UaICCmFLjIai6nYphIjEr0Pom966uPyAPUG7?=
 =?us-ascii?Q?B1CNV5gJaOP+lgsvnXxfNjwESvXCyBTapfG/iTF9zr4fN5ZOhfop139FP7jP?=
 =?us-ascii?Q?r37M8/J9yWlwTccCqf2FflAhvP2LA7j854wlCVCoi16C+ChhQaDuHPBojl0l?=
 =?us-ascii?Q?m63uRX4lu++L1eXF4CUtUT44Xa6P4ichNmtz5UHu1GPWRvbpVp9zbKwIftSO?=
 =?us-ascii?Q?bm657ih6Qs1UuJpQwV/VC8uOrjwN2UcOaV+9Q7hF0q+SHtrE151vkNSqQiuR?=
 =?us-ascii?Q?eNls2WlV9LcK/E6ujV/lfHGl9pIc2i/Tktc8xljv1Rj8jJtf4PJlXYCmIs3y?=
 =?us-ascii?Q?qwgBfWqo7N00ix9bcznIUTKZQa2QeN0FjafyLwMr0Q5aJu6Ret/2SOyHZ6Mz?=
 =?us-ascii?Q?cWrpOXVkcFyqJUSp34fMy7QB+PPbXiFAxxy4H1GI3XwB5rdE2nLmVyMNbh1B?=
 =?us-ascii?Q?tURpwFbg9bYi7/B5UE6Mb+rBVPaTVZElrUMHXxP1wzp7PXTgkZt6FvImauL2?=
 =?us-ascii?Q?3HyXUaMZYPzbeTYGeX3a3F/ghmHTaOHk6swnA8+5lxbWn0khlOCaxTabUw99?=
 =?us-ascii?Q?3gogWwL4a56SDeQom3nZ8legvE+RcC5a89GI3NJUV5xI5noI?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB590227CC768C33B5C5228D91CFCF2PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	slsRaL5CJpolVdWhP7UXg3jyeicS8hZ7EqUq6pmtsNCtP5IeVD3jcT9ibKkjxUGfQEyT+ysdptofAYs9S/iKWBHNZkQ0YTlAoCQ5mEVxI0Ze8bS4EKaOp/FNrd2D7x5NXGMhTztUmHSerUEHFqNIF37Ni6Z1L2XGhgeeEGF0ox0mfay1cmYcJZwhv+8x6Z8Q9fhF2spzJi1mZP8Qwh4vycOEnd60UuX8+RDyIbbYpkY60yd+eLNfDAuiUU+PNnhqLKVpKIAtu0f/KA/wx+38UYh32WgVgQ1AWfIiun9eAi7V8QVdJHuNLww8Y3BaKVtLM+djnal7lMxaCkgDvf6sXA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ab2edf-a5f1-4df5-f680-08dee93ef4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 04:49:33.4948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QGEfr8MTc7nkVXoL8xXhhWBC12LFto3WJKDLHXEJwtIHj8ENs6FFkO2xJLEShLCaTVRZZYm58mWf6XoaR6hBGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 04:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241887

--_000_PH0PR11MB590227CC768C33B5C5228D91CFCF2PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 Hi Yoann,

Thanks for the reminder.

I have now sent the v3 rsync patch series for wrynose. It includes the upda=
tes requested during the review of the previous version.

Please let me know if any further changes are needed.

Regards,
Ashish
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 23 July 2026 14:46
To: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518

On Tue Jul 7, 2026 at 11:52 AM CEST, Ashishkumar Parmar -X (asparmar - E IN=
FOCHIPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for the reminder.
>
> Yes, I am already working on the required rsync fixes for wrynose first, =
as suggested, and plan to send the wrynose series in the next 2-3 days.
>
> Once that is posted, I will follow up on this series accordingly.
>
> Regards,
> Ashish

Hello Ashish,

As a reminder, this series is still blocked pending a v3 wrynose series
(you told me to drop v2):
https://lore.kernel.org/all/20260717052059.773645-1-asparmar@cisco.com/

My plan is to keep checking this for a few weeks but ultimately drop
this series if this situation does not change.

Regards,
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 06 July 2026 22:49
> To: Yoann Congal <yoann.congal@smile.fr>; Ashishkumar Parmar -X (asparmar=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) <asparmar@cisco.com>; openembedded=
-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
>
> On Mon Jun 22, 2026 at 1:31 PM CEST, Yoann Congal wrote:
>> On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E =
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>>
>>> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
>>> where a non-chrooted rsync daemon could be exposed to a parent path
>>> TOCTOU race that allowed file access outside the module.
>>>
>>> Also include the dependent upstream fix that followed the CVE fix:
>>> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>>>   opening files from the module root, closing the same race on the
>>>   read side.
>>>
>>> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8b=
a841b94ffe19cd2505
>>> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c=
7a525a1f5566f10c85
>>> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>>>
>>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>>> ---
>>
>> Hello,
>>
>> It looks like this whole series is needed for wrynose (rsync 3.4.1).
>> Can you send fixes there first, and, then, ping here?
>
> Hello Ashishkumar,
>
> Gentle ping for this patch series. Do you plan to send the needed
> wrynose series?
>
> Regards,
>
>>
>> Thanks!
>>
>>>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>>>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>>>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>>>  3 files changed, 405 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1=
.patch
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2=
.patch
>
> --
> Yoann Congal
> Smile ECS


--
Yoann Congal
Smile ECS


--_000_PH0PR11MB590227CC768C33B5C5228D91CFCF2PH0PR11MB5902namp_
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
&nbsp;Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the reminder.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have now sent the v3 rsync patch series for wrynose. It includes the upda=
tes requested during the review of the previous version.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please let me know if any further changes are needed.</div>
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
Ashish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 23 July 2026 14:46<br>
<b>To:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;; openembedded-core@lists.openembedded.or=
g &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-295=
18</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Jul 7, 2026 at 11:52 AM CEST, Ashishkumar P=
armar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; Thanks for the reminder.<br>
&gt;<br>
&gt; Yes, I am already working on the required rsync fixes for wrynose firs=
t, as suggested, and plan to send the wrynose series in the next 2-3 days.<=
br>
&gt;<br>
&gt; Once that is posted, I will follow up on this series accordingly.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Ashish<br>
<br>
Hello Ashish,<br>
<br>
As a reminder, this series is still blocked pending a v3 wrynose series<br>
(you told me to drop v2):<br>
<a href=3D"https://lore.kernel.org/all/20260717052059.773645-1-asparmar@cis=
co.com/">https://lore.kernel.org/all/20260717052059.773645-1-asparmar@cisco=
.com/</a><br>
<br>
My plan is to keep checking this for a few weeks but ultimately drop<br>
this series if this situation does not change.<br>
<br>
Regards,<br>
&gt; ________________________________<br>
&gt; From: Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
&gt; Sent: 06 July 2026 22:49<br>
&gt; To: Yoann Congal &lt;yoann.congal@smile.fr&gt;; Ashishkumar Parmar -X =
(asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&gt=
;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.ope=
nembedded.org&gt;<br>
&gt; Cc: xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.com=
&gt;<br>
&gt; Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518=
<br>
&gt;<br>
&gt; On Mon Jun 22, 2026 at 1:31 PM CEST, Yoann Congal wrote:<br>
&gt;&gt; On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparma=
r - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:=
<br>
&gt;&gt;&gt; From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Pick the upstream backport [1] for CVE-2026-29518 as mentioned=
 in [3],<br>
&gt;&gt;&gt; where a non-chrooted rsync daemon could be exposed to a parent=
 path<br>
&gt;&gt;&gt; TOCTOU race that allowed file access outside the module.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Also include the dependent upstream fix that followed the CVE =
fix:<br>
&gt;&gt;&gt; - CVE-2026-29518_p2.patch [2] secures sender read-path opens b=
y<br>
&gt;&gt;&gt;&nbsp;&nbsp; opening files from the module root, closing the sa=
me race on the<br>
&gt;&gt;&gt;&nbsp;&nbsp; read side.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1] <a href=3D"https://github.com/RsyncProject/rsync/commit/1a=
5ad81add1004354a3d8ba841b94ffe19cd2505">
https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba841b94f=
fe19cd2505</a><br>
&gt;&gt;&gt; [2] <a href=3D"https://github.com/RsyncProject/rsync/commit/99=
b36291d06ca66229942c7a525a1f5566f10c85">
https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a525a1f=
5566f10c85</a><br>
&gt;&gt;&gt; [3] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-295=
18">https://www.cve.org/CVERecord?id=3DCVE-2026-29518</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<b=
r>
&gt;&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; It looks like this whole series is needed for wrynose (rsync 3.4.1=
).<br>
&gt;&gt; Can you send fixes there first, and, then, ping here?<br>
&gt;<br>
&gt; Hello Ashishkumar,<br>
&gt;<br>
&gt; Gentle ping for this patch series. Do you plan to send the needed<br>
&gt; wrynose series?<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt;&gt;&nbsp; .../rsync/files/CVE-2026-29518_p1.patch&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 330 ++++++++++++++++++<br>
&gt;&gt;&gt;&nbsp; .../rsync/files/CVE-2026-29518_p2.patch&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; |&nbsp; 73 ++++<br>
&gt;&gt;&gt;&nbsp; meta/recipes-devtools/rsync/rsync_3.2.7.bb&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp; 2 +<br>
&gt;&gt;&gt;&nbsp; 3 files changed, 405 insertions(+)<br>
&gt;&gt;&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE=
-2026-29518_p1.patch<br>
&gt;&gt;&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE=
-2026-29518_p2.patch<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB590227CC768C33B5C5228D91CFCF2PH0PR11MB5902namp_--

