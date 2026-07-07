Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B780C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 09:53:13 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.170732.1783417988253420746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 02:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RBSOMbCm;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8711; q=dns/txt;
  s=iport01; t=1783417988; x=1784627588;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=bcRm8A2pxSqwlZ/rDADzx0EyKuqI8YXr67Jj+m7zCvg=;
  b=RBSOMbCmCKWFeeinSU1OPcYyBnVYyrK4wtPunaqMB3Kb2crBPgq2NXXr
   yFjgyyMbA3MNabOW9uZezpgH9SHQluQEEfNP53Hvy2017D0vll36L1/gw
   mqrYJuwT3voy6/Ia/71LjExCjrkS2v8OBMqVdcdPLa8V80JNgFjSGiryk
   RPnia977KHjNlGPEJQhpqgirKq1YywGUkX/R62poWQFm3FTzkWDtgKyfG
   EtFoZ/JXnjdKafg11E7W9cG9tNCJyHaGe8jPRm7P9mx4QWpThn791L+Fw
   DaHkGXZfMtJtPM6B16RxwrwdRASW2JrkYK41QonXD0/yq/NWuDSBXa0wQ
   g==;
X-CSE-ConnectionGUID: 6UDbyPBISQiX86TmDbxTAg==
X-CSE-MsgGUID: zN0cyMAaQ+Ke7+suYciIag==
X-IPAS-Result: =?us-ascii?q?A0B0AwAczExq/4r/Ja1agS6BK4E9ATBTgQgCgSFJiCMDh?=
 =?us-ascii?q?SyIeQOXRIZXgXQKDwEBAQ0CLgEVDQQBAYUGAo1NAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAgEBETkBLRACAQgRBAEBA?=
 =?us-ascii?q?S4nCh0IAgQBDQUIGoJhgh0WGScDAQIOrRMBgT0Ciip4gTSBAYMoAT8CQ9wIF?=
 =?us-ascii?q?YE4hT+DABsBAQUlSWyCXYEhGAGEfCcbG4FygVeCaT6BBYFcAgIBF4EdKzyDV?=
 =?us-ascii?q?4IwBIIiehIbg3OBYYs4UnIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnE?=
 =?us-ascii?q?g8dFxYeWBsHBRIgKkFFIwMcWD84C0MFgVkCgghOIx8DOX+BMHVKeS2BAgECE?=
 =?us-ascii?q?B4KbEIkgVEDC209NwYOGwMEgTUFjBYHWxcPgj2BDgEHJE+BNS6jCI5glRcKK?=
 =?us-ascii?q?IN1jCGNPogyF4QEgVeSQJJRC5h9I41nlTQshS0CBAIEBQIQAQEGgWg8gUQOB?=
 =?us-ascii?q?3AVgyIJShkPkiOFE8keeQIJMgEBBwIHDgMLgWiQAIF9AQE?=
IronPort-PHdr: A9a23:HDfsVRRgZAIVtg0UKqOpUkmixdpso47LVj580XJvo6hFfqLm+IztI
 wmFo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:LrVnY6ImK6rpoQqyFE+RipQlxSXFcZb7ZxGr2PjKsXjdYENS0zEBz
 2sbWWvXO6mDMGLxfN8iPNixpxkDvZbSyNRmGQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGYrajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0wMW08LLUy291OAFEeq
 8AdBDodUjmM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjOm0bYWLJ4DULSlTtlS+/
 mnX2k3wO1I5OYPc0ie0+XONj+CayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXJ9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:RtwhqaD2gF7B8U/lHeissseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskduZJhBo7y90KnpewK7yXcH2/hhAV7CZniohILGFvAZ0WKP+UyFJ8S6zJ8j6U
 4CSdkxNDSTNykGsS+S2mDReLhQoqjjzEnrv5aj854Hd3ASV0gU1XYDNu/tKDwPeOApP+tfKL
 OsouB8i36Lf3MRYs6nBn8DcdTiirTw/q7OUFotPTJizBOBow+JxdfBfiSw71MzQjlPybAt/S
 z/lRDl5qKsive/yhXN/W7e5ZZblbLau5p+7cq35fQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lzw2m5RBD3nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxri7VY6tt0U6t
 MI44vZjesTMfrzplW72zH6bWAtqqNymwt6rQcntQ0abWLZUs4IkWVQxjIPLH5KJlOL1GluKp
 gcMCib3ocXTXqqK1bEo2Jo3NugGl43HhuAXww+n/b96UkNoJi8pHFomPD2WRw7hc8Ao5Uo3Z
 W3Do140L5JVcMYdqR7GaMIRta2EHXERVbWPHuVOkmPLtBMB5vhke++3FwO3pDgRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOthTAWn+0UzjhwtxXo8ERgMyxeJP7dSmYDFw+mcqppPsSRsXdRv
 aoIZpTR/vuN3HnF4pF1xD3H5NSNX4dWssIvctTYSPCnuvbbonx8uDLevfaI7TgVT4iR2PkG3
 MGGCP+Ic1Rh3rbE0MQQCKhLU8FVnaPiq6YSpKqitT74LJ9QrFxjg==
X-Talos-CUID: 9a23:8xne7W1LIdFawYpbiv89ZrxfRP0JeGzl5lbrGk6IWThVTZGfWWO59/Yx
X-Talos-MUID: 9a23:/GmxuQg5AJG0fte4Yygyz8MpJuEw6LWLIUk00rYL5IqfKB17OhaUg2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 09:52:53 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 0DDFF180001D2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 09:52:53 +0000 (GMT)
X-CSE-ConnectionGUID: DRVfx6fgRuyq7UzDMDUc3A==
X-CSE-MsgGUID: TZ9FP2VvRN2niKqrHzZC8A==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,153,1779148800"; 
   d="scan'208,217";a="67300808"
Received: from mail-westus3azon11011052.outbound.protection.outlook.com (HELO PH0PR06CU001.outbound.protection.outlook.com) ([40.107.208.52])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Jul 2026 09:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3KQdFvwUMxE9D8eh3LUabHWh8M6awcccsc/zh2GLHSbXPccIsDbGmQ1CIqZveZhVev02rBDrvRAJ91FJbGXAQ+6IBMRfHovDfQio9qqCvzwUO/G9BCcKE0ZGVEP7i8ckwg1BfV7DDaPu3nFn0td6XKa86ACmaWH28oxyx/mTbwkqX4OKv5IKZ6tmQzt/OHZ2qpYnurec9AiQeG3sazTjPuOfyO+W3nOuUta5PgV0XvTmha+qOg/ZaTT2Fgv1jxNcB+jvnuOvtnGpjUgeWIwIXkcE60yWIE21yBvaS8pwR0Eww6CZCcq3pjn3kzU7XbPp9+VmmR546pha91xZdZclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcRm8A2pxSqwlZ/rDADzx0EyKuqI8YXr67Jj+m7zCvg=;
 b=VRHASntWAwfhekP8X24S2WzzSUaZgI87MN7nK7Jj7KPPoWwBhi1KsUiR+GKuwmFFDiDC45dxvmuUSWf0aVuzpy3tx0fjYdwOPPxEbKRG94sBjIzsT27VI4J9XRhB0Je4r1kAk5ziO7BUOYmIakOrJm97P3S13b9JkP1PJAqZp6yJ5lhWT08701rgcCrYbQWc9A+p7dvlsKwru5h4PubY346owF702bdBiKLsXjzLBvSDDtrPGcLA0xTd64CHlrRMSd+2uZn1xPMEh2JC5+ScjGzPkHRl77qPX3t7ZXL0Ih1zURM3PJFBY6kgaQFdp9+C/oQOFvkYrn7D8NPWfEkpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 09:52:50 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 09:52:49 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Thread-Topic: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
Thread-Index: AQHc+mUoPWNwtzk+sEGobmto1GtfqrZKgIUAgBZhxACAARE4hg==
Date: Tue, 7 Jul 2026 09:52:49 +0000
Message-ID: 
 <PH0PR11MB5902323581BA2A35BBF25BCECFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260612121514.2282121-1-asparmar@cisco.com>
 <DJFJLZY26OV8.76VQNOV5VDTV@smile.fr> <DJRNRSGCJSS1.3IN9OYGAAPQRV@smile.fr>
In-Reply-To: <DJRNRSGCJSS1.3IN9OYGAAPQRV@smile.fr>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|IA4PR11MB9393:EE_
x-ms-office365-filtering-correlation-id: b2866cb5-fe62-45c8-ae1f-08dedc0d8185
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|13003099007|18002099003|22082099003|11063799006|6133799003|4143699003|8096899003|56012099006;
x-microsoft-antispam-message-info: 
 6MuCjLDZH618TMoKcF+hZTpngYCZHNSOHiPxOlLGMa1DbT33gLepnthlKe1SNu3eZGD7lEeiAyVahWunfdCGauIB6IDinNlWkVtzjAWGJcb435cVOMgIgSOi4y12v1OnMVljoKYZiYlKijd8RgsHkAaYw9Msbp5SLfDWcChNMsfUbEyRvz5y04TsxTFwtwxcyTitXQOc0YwPGE5Ij2jCmj91JWesl6+iCxWUytCD6VVB/FeXwdnQe03PosD8QGUVRxPYdDxFd0Nh7CUDCnO5AohXlhOSUa0IvKcPvmtLMPJeVPXH2h4di3+Bmvw/JOSCjms6hjpUWk6qNMFXtgS5b0MjQ7/FSIG7e8VCSqL9znTiimkWIjbN18eLenBS6DJfRnMQ9A5lJM48L29sFtagr5YzWYoL3EYkTBe3VnMTkaICI768YOHNMO8KqM5yBLw/qrGr5QTqNsR1S+J8Scr+iiAV3ALdy8p8LV78oGsePY5EIz2G+tJIJQlYUyZAjp9gPP1z0ImCBZAzchiJR1R8FaKKQl0RsYoL/AVYD5bjQmaZLhj3MdAqs4Bwm/8trUVptwP2r9WFH2dIpyHikmxcLuGQRBWaBVZfy0fdFsNErAGKegDoc6VK8Yo126XQV+mNf8n5n/NJ144j4/KYdgeLMWScVISO+MyxdWeYJPTZfYvhH1dwU4BLqnbJDx2V2eaXhlQUi+j2rhdsEU+N5UFVEHVzJWB5BfMVmSkMNKAKy9E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(13003099007)(18002099003)(22082099003)(11063799006)(6133799003)(4143699003)(8096899003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/4VfJLaeuCd17ojOgvPbY1n5+pT2O02b9lUHasNmS2Xrd5yIQakH82bEWCOS?=
 =?us-ascii?Q?ZbDiEm2lkdHmOEI5usHoNAXPKO0tpycSh/e99gVv83HDySKLfPqgSfAodB/J?=
 =?us-ascii?Q?4Mjm/COgTVDwoZZrIzEMDqta2RTpGm9u1FXxujkthvNtwtZPWz+DIUNpffWX?=
 =?us-ascii?Q?F0/DmTL01pU5glSz9ufuzMByHQrQnDSzU1pY+6fPoyK2+2OE0RZRRj9saTEi?=
 =?us-ascii?Q?k1qpzHtLL7a+IDhFvfjs8wpXPmtKHTRlA6cCL9SI6chthLzm4Ikw1vuxRmdP?=
 =?us-ascii?Q?mS6+V2pTmH78UUztWoZ37e/yfO1zWmj71ZSeJzYPJ9srFizxcSRrBAQsjf+A?=
 =?us-ascii?Q?8zvW7gT2QaCzgbbNi4K+oM0mKk9zrb/9bzS+on8PEw05A1SgOxhsVFzqPcav?=
 =?us-ascii?Q?38bVwkOjMgJC2O42IiRGM17RsxgqVbpZGK8hQbeBHTULzkcOeRd3O+/ELb8U?=
 =?us-ascii?Q?y4Na9It3FvNb/DEbVOxf0y8YhP1BgDzFa+4iz51jMIY35TW94p5A/AMIsLy9?=
 =?us-ascii?Q?FqTGNTjXfrZoFCpe6Gl9F+U5e11LBMszv5qsS4xYxSvEQbxtK2GV80UwTcBy?=
 =?us-ascii?Q?AoSp+pD3/7mG+2iIYqugd1U0CcDZ8G+a/KMXQdwvZ1btDU1/6GE4SrNqLowO?=
 =?us-ascii?Q?lzlSDrVraGCKuK6ZWsoVYvwAK7dTRq3t78bovEb9J0nElviV4xZDr4F4ehYD?=
 =?us-ascii?Q?DELrhcouMAoC933ATLl36ISVWIZC5A6+CERroEs0qBslznHq3OIa7uZqYHd4?=
 =?us-ascii?Q?7nlKXNr9CEPKpVTI9eaKi/ZaFmrZTBVlphZFY3vk2ZQDpyVjgeDhVrv0d5o5?=
 =?us-ascii?Q?K9lkQxMdQPfGlP0usuRTI5B0hiUbFCA9UReZvL4fWvkctEXgHOJv/mBSk9t+?=
 =?us-ascii?Q?bNAgGcH05Uqh1QfU8ddR7k849R6ig6hGCnjaDoloMaMZoZ7SVEKd8q7D8wyO?=
 =?us-ascii?Q?RLc+x5KAh7pJp01VdGr28sAS+DiTXztIK3X+ARHhO5XNtrsGZNUqD/jHcHW1?=
 =?us-ascii?Q?QTcOivM9hHF2/Icn/tfV7YBnBHzoPzdi9y3ulAp8KxSQWC2SJSNjX8CXulNd?=
 =?us-ascii?Q?Xs8Gon8FTy9sxnFP3to3DUK8OW+zQ37g1B0lWkLbEGpIK2M7NH+Nrd4svWDN?=
 =?us-ascii?Q?3CCafIfYlpgWQo2axHbiwf0YCdcGQQfhcbwsjwNAmBpa77XqxVXyiT22Dp8/?=
 =?us-ascii?Q?WqUmR8fP1M73pLTcIw1zkQmm0al9nEvvBUZJ7MQS42Dznr4eaxafvNaJ2QPW?=
 =?us-ascii?Q?Y3u4C4WwP+27XMkXyc6ID06BH0gndp6ugWhdUPc6y8tRW1NSONM55qO7px60?=
 =?us-ascii?Q?Th9Af0JYv3TjM09oioAFcNcmohYh0j3UMEU/3mXPtPJKCGSTVn42l5Lf3dkq?=
 =?us-ascii?Q?ZaPAvu/am+fUa2huS/hTnx4YFvhJQ0D7ZWZysbSF0BpD6e7BObaXHP/fpznD?=
 =?us-ascii?Q?ATT7GFPZWzJ/GUVNUyk+Pyw51KTUCYyNE19waiWUOpqLLUuYa9/eI7BtzPM5?=
 =?us-ascii?Q?2wDKl3KwnrrJJwULYrO0ubbGp8JUY+Zhrvi8LdLgBHcyriFlzjL1Mj8dL7OD?=
 =?us-ascii?Q?O019tplZ3zsOEUCrPenWfkj0ZUDPeZZgdcQKAvE0aQbw4LX36eeaUg4+bzyJ?=
 =?us-ascii?Q?cgff6KvF3PA/hDbGC1VXFp2G5yyHOveVISvHT730UPr8GsUxx3cheeDkxxji?=
 =?us-ascii?Q?uSehTVNLBleHENEvruuccRLgETaoKfrYoMGtfwzpkc+H+spl?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902323581BA2A35BBF25BCECFF02PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pfW5ODWikCL5UccyJ9dwB0J0GPqjd21rgu6sH3W22lG6xa3Vx32Z2W2gFMNBgvAxksR3cvaKMuG7Jb0QfaDzrTK5aXAS6TafDw8x8Sqc2SUoXV84WHphaGCCPsUaQEzZLEpTTGYZ79dQUDtSarw3KL5CMPxtxqzg1IDt6fucaieekmvePmOWBlmIX6K5yhYXmxGaXVR6q1pbvoY7oFHFgUvQerwDNZoY+ZQw0YS2FLAQFeCO08SaoQmRzRkQMtCtw9mHKeMYjo5q4La9o/170H1RmlUMja0rh1M0UObmtoNM/IED6gsagdbufFbJ1B0Je2+Ks0JzaMGZyTf9c3BUJA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2866cb5-fe62-45c8-ae1f-08dedc0d8185
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 09:52:49.8667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VFhuJMHhrjtUI/mUfV64r9vGWQTLwOmNJ+pZ3HHqqxKYBX1YIsXSdqRKnoFDRi13Yp3gq+K/+qo9Asxru7W1Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 09:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240375

--_000_PH0PR11MB5902323581BA2A35BBF25BCECFF02PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the reminder.

Yes, I am already working on the required rsync fixes for wrynose first, as=
 suggested, and plan to send the wrynose series in the next 2-3 days.

Once that is posted, I will follow up on this series accordingly.

Regards,
Ashish
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 06 July 2026 22:49
To: Yoann Congal <yoann.congal@smile.fr>; Ashishkumar Parmar -X (asparmar -=
 E INFOCHIPS PRIVATE LIMITED at Cisco) <asparmar@cisco.com>; openembedded-c=
ore@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518

On Mon Jun 22, 2026 at 1:31 PM CEST, Yoann Congal wrote:
> On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E I=
NFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>
>> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
>> where a non-chrooted rsync daemon could be exposed to a parent path
>> TOCTOU race that allowed file access outside the module.
>>
>> Also include the dependent upstream fix that followed the CVE fix:
>> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>>   opening files from the module root, closing the same race on the
>>   read side.
>>
>> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba=
841b94ffe19cd2505
>> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7=
a525a1f5566f10c85
>> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>>
>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> ---
>
> Hello,
>
> It looks like this whole series is needed for wrynose (rsync 3.4.1).
> Can you send fixes there first, and, then, ping here?

Hello Ashishkumar,

Gentle ping for this patch series. Do you plan to send the needed
wrynose series?

Regards,

>
> Thanks!
>
>>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>>  3 files changed, 405 insertions(+)
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.=
patch
>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.=
patch

--
Yoann Congal
Smile ECS


--_000_PH0PR11MB5902323581BA2A35BBF25BCECFF02PH0PR11MB5902namp_
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
Hi Yoann,</div>
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
Yes, I am already working on the required rsync fixes for wrynose first, as=
 suggested, and plan to send the wrynose series in the next 2-3 days.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Once that is posted, I will follow up on this series accordingly.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Ashish</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> 06 July 2026 22:49<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; Ashishkumar Parmar -=
X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&=
gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.o=
penembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-295=
18</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Jun 22, 2026 at 1:31 PM CEST, Yoann Congal =
wrote:<br>
&gt; On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - =
E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<br>
&gt;&gt; From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;&gt;<br>
&gt;&gt; Pick the upstream backport [1] for CVE-2026-29518 as mentioned in =
[3],<br>
&gt;&gt; where a non-chrooted rsync daemon could be exposed to a parent pat=
h<br>
&gt;&gt; TOCTOU race that allowed file access outside the module.<br>
&gt;&gt;<br>
&gt;&gt; Also include the dependent upstream fix that followed the CVE fix:=
<br>
&gt;&gt; - CVE-2026-29518_p2.patch [2] secures sender read-path opens by<br=
>
&gt;&gt;&nbsp;&nbsp; opening files from the module root, closing the same r=
ace on the<br>
&gt;&gt;&nbsp;&nbsp; read side.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://github.com/RsyncProject/rsync/commit/1a5ad8=
1add1004354a3d8ba841b94ffe19cd2505">
https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8ba841b94f=
fe19cd2505</a><br>
&gt;&gt; [2] <a href=3D"https://github.com/RsyncProject/rsync/commit/99b362=
91d06ca66229942c7a525a1f5566f10c85">
https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c7a525a1f=
5566f10c85</a><br>
&gt;&gt; [3] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-29518">=
https://www.cve.org/CVERecord?id=3DCVE-2026-29518</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
&gt;&gt; ---<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; It looks like this whole series is needed for wrynose (rsync 3.4.1).<b=
r>
&gt; Can you send fixes there first, and, then, ping here?<br>
<br>
Hello Ashishkumar,<br>
<br>
Gentle ping for this patch series. Do you plan to send the needed<br>
wrynose series?<br>
<br>
Regards,<br>
<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt;&gt;&nbsp; .../rsync/files/CVE-2026-29518_p1.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 330 ++++++++++++++++++<br>
&gt;&gt;&nbsp; .../rsync/files/CVE-2026-29518_p2.patch&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 73 ++++<br>
&gt;&gt;&nbsp; meta/recipes-devtools/rsync/rsync_3.2.7.bb&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp; 2 +<br>
&gt;&gt;&nbsp; 3 files changed, 405 insertions(+)<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-202=
6-29518_p1.patch<br>
&gt;&gt;&nbsp; create mode 100644 meta/recipes-devtools/rsync/files/CVE-202=
6-29518_p2.patch<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5902323581BA2A35BBF25BCECFF02PH0PR11MB5902namp_--

