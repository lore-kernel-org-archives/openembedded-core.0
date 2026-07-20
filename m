Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FA4C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:39:39 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7994.1784551176262622758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hcEIiXrx;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=35691; q=dns/txt;
  s=iport01; t=1784551176; x=1785760776;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=1XfHHGcozamC67DW1Ow0OMoFq4o0cPRrdTfpn+d+Eb4=;
  b=hcEIiXrxtxbfI8LImU8ZVFOGIWPdDKGXf5TokPU2QVUpQBVWU7l97kjQ
   mhH186zmz9hYRispuZDE19PlWXVaYGQGm1R1u0V7pVSpKm6tazS6VcfD9
   8A3yp2TMvKGRwfSTjGKxHfZnTOiDfKHyrksaGXradXHTY2d7nVNdXnPUI
   kkFDPFBLP6HmLMTNOoCKE6TnHwaVWPsfuvyi/mzUhgb+bHmfPZ/Kj27xw
   aV8IVsb/PzWfH/A8bPKFwbOQg49OEXYsw1yqcObsuKVLw5rZC9R/krkib
   zHVkEodi82lx3TBBQzZgwin6HvKarEZ58Q5UyT38EosEMujMIC4cYy7AI
   A==;
X-CSE-ConnectionGUID: tNGKpUr8Qh+EvzZCNEEvLQ==
X-CSE-MsgGUID: nGBGw72mQfiDcBfjhlFGPQ==
X-IPAS-Result: =?us-ascii?q?A0A7AABuFl5q/5X/Ja1aHQEBAQEJARIBBQUBZYEXCAELA?=
 =?us-ascii?q?YE8MVOBCAKBIUkDiCADhExfhliCIQOeGxSBZAYPAQEBDQIuARUNBAEBghKCc?=
 =?us-ascii?q?wKNUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaA?=
 =?us-ascii?q?QEBAQIBAREIDVcLAgEIEQMBAQEBIAENJwodCAIEARIIGoJhgh0WGicDAQIOp?=
 =?us-ascii?q?SOLfgGBPQKJWRo3eIEBM4EBg2gCQ9wKFAGBOAGFPoMcAQEqgTWCXYEiGAGEf?=
 =?us-ascii?q?CcbG4FygRVCgmk+gQWBXAIDgSAUASoeg3WCMASCInoSG3JNGAaBfYEKV4wQU?=
 =?us-ascii?q?nIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxYeWBsHBRIgKkFFI?=
 =?us-ascii?q?wNPPzgLQwWBVwKCBU4jHwM5f4EvdUp3LWoCEBdKOCSCEgKBOwIHAwttPTcGD?=
 =?us-ascii?q?hkDBIE1BYxQB1sjgXBIB3sTASoBIC80An8PGQYWAjCScSqPJUeBNYxkk2SBM?=
 =?us-ascii?q?woog3WMIY0+iDIXhASBV4s9BItIjggLmH0jjWeWAIUOAgQCBAUCEAEBBoFoP?=
 =?us-ascii?q?IFZcBWDIglKGQ+OKhmDYIQHgQzEdHkLAy8BAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-PHdr: A9a23:xRabIhLMoldJHfd+SdmcuVQyDhhOgF28FhQe5pxijKpBbeH/uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:yCWBbqveSt0m/By56y/XyZpRJOfnVA1fMUV32f8akzHdYApBsoF/q
 tZmKWnQPv2KZDCgL9ggYYuz9UkG6pKEytFgHgI4+y9mEyIagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z8Esy1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5sBYInlz7
 6whKHMgcAKxrMSb7ayfc7w57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHTH50FxR/I+
 Aoq+Uz/LTs1K4PFzAOL816nrOHNnSfVd7orQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwdZJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:7/jOZ6GKI6Cz6gfCpLqF4ZLXdLJyesId70hD6qkvc203TiXIra
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
X-Talos-CUID: 9a23:kbL/CW+c3tLeI3RS6pSVv1IyNeM9T2eN9XeTDlGqO01PZZCLbWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A91fj+Q7YmvfN7L5lAjMyTn8TxoxuzI6BFx9XlKw?=
 =?us-ascii?q?IuuWPHyJyOzOzowyOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:39:22 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 5675F180001F4
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:39:22 +0000 (GMT)
X-CSE-ConnectionGUID: mb26rLZfSHiibJvMbZgxgA==
X-CSE-MsgGUID: X6faRXPJQbKEd2nbpGvVPA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="88782548"
Received: from mail-westcentralusazon11013070.outbound.protection.outlook.com (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.201.70])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:39:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABgzAUKma5nrwIADom0xKxT2xsWIQN55y3JPTF2KDWLQlyYZrtzkjN7sj/jBOmsLsQsa6qSzPBCZppAkgTYhOJaj0gUbtfS1ydXbSN9xtS2YBxjNY7kCwK5jK79cRd7ex120jM+wZGWqiWeSHhrfnlznrzxpW7nRl65VXQ1/X6WwYUAv+Vlo+ZRG7jNRxCYD1bYcknKrmbwrLNZ+BaaB4Sfe6Ze0ZmaHzcyDdaixBIg1dJh+ehUYsEmYDWPBTgU+1aJyxJ7uT3+vA6y1biQtWPsWAgEyw8ufThNwfnwlgDs1ALldPbnJ/tc2En358naenSqzNfmqqV5TUjfRWoo67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XfHHGcozamC67DW1Ow0OMoFq4o0cPRrdTfpn+d+Eb4=;
 b=RhCF0WIbT3OHSah9bZDblWlCNhTVwdf2/1ur6RW9nJ8/qFUJT7v/NIC7tu2iG+6jW15Kwo4gpZne/C+lJDWuDOmvaIejulUV+Kok+X9Bj1cBjYsLi8SlZWUe/t7v8miJ1MSC1x8swczA4KKyYGRwhxRWyIglkzM6AvDf6Os0s3TXHPvSuB9NvIxJVICz1uArpb+w+MphUKifyc8i7T51etqt7gwyHeyC2l4ZrswrbNlsqikBAGS9oVaID4svOcgvB6vs3tnHWCOrQkdQgtWX4uU7b/+mT7Nf5WE6B7XbSwCgIETvWKZmFCZlvw93hoUreib5ZIuZgzuLyHe5ZNxXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 by SA2PR11MB4826.namprd11.prod.outlook.com (2603:10b6:806:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 12:39:19 +0000
Received: from CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec]) by CY5PR11MB6187.namprd11.prod.outlook.com
 ([fe80::1640:273b:4b9:29ec%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 12:39:19 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
Thread-Topic: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079
Thread-Index: AQHdAwPGmbka7w43kke3FJHrdbMoobZUjCcAgCH2FRE=
Date: Mon, 20 Jul 2026 12:39:19 +0000
Message-ID: 
 <CY5PR11MB6187FB6F4790AEC08A95E75CC4C32@CY5PR11MB6187.namprd11.prod.outlook.com>
References: <20260623113037.28968-1-adongare@cisco.com>
 <20260623113037.28968-8-adongare@cisco.com>
 <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
In-Reply-To: <DJL0OIF53N7U.2AAPEB2LOEEDT@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6187:EE_|SA2PR11MB4826:EE_
x-ms-office365-filtering-correlation-id: 00fa2043-5c32-46d7-c0b1-08dee65beb3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|8096899003|6133799003|11063799006|10067099003|4143699003|56012099006|13003099007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 CbE/hh8LGpPwYNSreMEs0V4ABOOWAB+5K9pNenMp4hOYO398pyS5tq4g4glHdj66blVqRXO+SsH+jo3AVdqPWGHOTKtJhll3YBV5jRQodWmjPWoikfb48DeTgod8C1J/JDXVZ1WBab57gfy6/QunRJHe2+4Iz/Xy4UOx9ckm2lvmsk0TqYHcO1IBnK0gi4jp5HFf3C/s6mdt3+Vh9L6+AMiyWbmjMKMMnXI3qLCat+qRORye5VEXUaatvD3kCApQXFO1AoeKmxbgQZ/TunqFg8odlI9EGQNSDmu22WRzpWGNsPZu7dm64SxlhnMG8jrWmKT1dHpUA2rr8+hBiBUObDpFWZgImafLFac4Tf/CgU+C44NXOcu0swYnRySl44RjwPMQmIimvmMea850y8FKlVIHLRXXcrzjQ+SO2IZMDyNcjoQ0W8jMZrI0loSgNfzpowKWqMSxFOLfgfyfsbV76LcP5aeU1tsFcyQ0gZyNzX98GyMmvi7KR1LrlZMscZbpIcWCfHZ4H7+TRb2wxdieiqZd/X9bsVdaG+Dg8ES/QF5L7E6EJxWVchAvPJDLFtDwWiweR9qqh9F16NkW9K+JjzxCrYNwWq+m8BmM0/EQRAxSKOcmKHZZWOWNviR618ng84BpF1Df7g+6fzOs2Q4FEQ1jGy5gGSTVZWZcYVRKN2k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(8096899003)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(13003099007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?sBqln6tWSzoZJbfYwxjHOjwWSUTrKCBRjAz9EI4tFxrR/OH6Qpzz1LV3bT?=
 =?iso-8859-1?Q?aO2M5U+eYDM4oeC7pn3+BDRvO+GJMmaUOJTbE+RZcQcMCcnkB2e16SgCSe?=
 =?iso-8859-1?Q?lGceG4gM7LCF8CfOW0vOvQlZOSgyfX5gYA4JJeXopUshsfhuZmsrt9kVTc?=
 =?iso-8859-1?Q?r7OK5QCm0YXa1Q2RVHlZDCyKOKYD5rzRk5B5pFWaRWf8+aDifX4aaGeETh?=
 =?iso-8859-1?Q?QIF4bbursvu18fkajq2bri5Ll3Ar5MJuoKZaOkITfffKxGIhg/IgtC5miw?=
 =?iso-8859-1?Q?7pHVKCFVOBWv4l+zgopTLIz+obqh47zTmn+t4Fsbi2f6GDq/zCgT0ePW9i?=
 =?iso-8859-1?Q?EJWZuJF/x9AQ+JZHLMs43fOE2t0UNuT5S3EPfTRJEXei6E/8wK24pzW4XF?=
 =?iso-8859-1?Q?8qcPJwt3SX65/fuXB08ZV3RH251Ft2xMsANXDs9L5yh4KCYa6d383Q+yQP?=
 =?iso-8859-1?Q?lw6xL+eQ/ZQtBMVAAaahkMrFXkFa5Z86a/yf1vS7W19n66j9vUIyIojB1K?=
 =?iso-8859-1?Q?IyH+N2tz8nGbJiYFZka1x4IK+ONmmxpoX3qNvqpqeWGjhZQgmMleNr1F2r?=
 =?iso-8859-1?Q?v2MgAiD0CHjG8YG6KwrRkL7SN+5CLO7WJKRmfzCe5wsNDxbLsny12OhJQW?=
 =?iso-8859-1?Q?E9/8P4UMr9ykb+paSW4tu8I3tbNrmFP9lMmH5ZcQdejynkVEQgzjK2QXBh?=
 =?iso-8859-1?Q?GfDkATe+db/UXvMuchH0SO02GqPhLndHQOWCiItDTTvumWanMB9BLbrRGk?=
 =?iso-8859-1?Q?zd0cGXP8Tjn6VYn+LlI8ZOreW/zz3T6Y2VQ+D/PrlkhW+oDSOhOK/scN1Z?=
 =?iso-8859-1?Q?Uf+n/ZTmZFDAv1jS7K61lsGAXvAQvJHFWWScvYudxRXSOU8/VEv1vpAFj3?=
 =?iso-8859-1?Q?udtNdgUZ6b35TKY1j9R/PaC/lqxjEGl57HMFPxMIzBfcv90glRaWW8Mvmf?=
 =?iso-8859-1?Q?5l1T/HLZrCL92Lu7Nrm3dnA3Fk1tFrXJns5muEk2WtJBAXYBWeg+WPr0Dz?=
 =?iso-8859-1?Q?qF5kkzLzdJmiznPXrlXtPlSVULQlVBgvpO9hs0LaJ77B55MonwMzegYVw2?=
 =?iso-8859-1?Q?nUr9asTyMtOYPXqPTbLSQvbOSBD3c3GkAxhYOqDyNxu4hz3+iGoK1uqHBn?=
 =?iso-8859-1?Q?D9cWfYThebyjbgHGPeQqmwq3HAzIrq3Wd5vRuW8iC/U6jN3WkmTA55vZ/V?=
 =?iso-8859-1?Q?4TbrGxGLqxuZNPQOUhwFIN3b+1IwL95YZ27BtQXkeiwsuORf9VnlKIIKwL?=
 =?iso-8859-1?Q?WSIjD8f4ZSfs4MmgIWfV4eadq35mZlSWwb9IQYQw7D48fBZSQ9r/pPV1en?=
 =?iso-8859-1?Q?v7ownzdMBlrY+QYMGox5beOU4Owobh9myRjeJ/aJVgQRR7813W1sOpQz2T?=
 =?iso-8859-1?Q?MFHl3vbdKDuMzAK1O7+O6oUMOdk9rFxDZd6/s0f7trQCYd6KiFLyiygh6V?=
 =?iso-8859-1?Q?okE2XNK2JjZ4KjHYN+KQqVzjSuZxUYwy0PmASXjb+XjbAbBAX158nbJq6I?=
 =?iso-8859-1?Q?Vq4P5RIG1JJD0KIyQm7ov7/s1JOvmQWfSb6hjyGA+B616V4xuChX1uw3mm?=
 =?iso-8859-1?Q?kVwz0f6rNWo8f0mPd58YmKzAMbogpxoHpT0TsF6PhyEe5FiLS0z769oOK/?=
 =?iso-8859-1?Q?lFcibLnL3JA/nwNgE0bV96DR7/W6JLoYv8iM9KryJgbIfHRIi5vJs4CDAf?=
 =?iso-8859-1?Q?nhm86bxowRtVpL0RFIqjAP4RS6Hhzyjwv0idnM9lS7KdCQR0xSLebMz1CZ?=
 =?iso-8859-1?Q?uQNjRKTeOQzkqvBqve4dta4prUqIf+8nS7HViw50HWMMWd?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR11MB6187FB6F4790AEC08A95E75CC4C32CY5PR11MB6187namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	DhvTqCea+mY+D6HpIwGoqAIiaxTm6nmNlpEE8x4MhnK0TIY3wJLgDIypuEsg6GrWTIwkJBxP8zZLCJFbau95YHYkyxbd7l57DRVwCw8yRxCUM4Crt10eEs9fNe7uicvfispjZM3imHn/nWXR0U9nvPaFGH5w/++N7lhyNbSLmMMoYaRXXq1KYvQX+QpjjiCYWLAsLzJaU0jQ//bcuEqjBguBLyrY99yV7T24T4v0Bf/XYqVcYPkNCpiURoyymEBgTdnEL7pdu3CDlO/26NO6oyWkweKt3KoUOIUrccI6ofGKaJiu8n6hlR4nyKlve3a15Py80sjtQxVsbUdl9qH8dA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fa2043-5c32-46d7-c0b1-08dee65beb3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 12:39:19.6010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPclGs2IOok4V1Ztpl99Ukbz5XdhHAOPdFp22wb1ZY9HwRyjQgc/AQpAeIiC+aKpokzNvw5swHIm1dOvB/vKbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4826
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241391

--_000_CY5PR11MB6187FB6F4790AEC08A95E75CC4C32CY5PR11MB6187namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,
Thank you for your review.
Regarding your request below:
"Can you send a v2 of the whole series with this cleaned up?
Please split CVE-2026-41079 and CVE-2026-27447 into another series as those=
 need a wrynose fix."
The wrynose fixes for both CVE-2026-41079 and CVE-2026-27447 have since bee=
n merged.
Given that the required wrynose fixes are already in place, could you pleas=
e confirm whether you would still prefer the v2 submission to be split into=
 two separate series, or if we can resend the cleaned-up v2 as a single pat=
ch series?
Thanks for your guidance.
Regards,
Deepak Rathore
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, June 29, 2026 3:27 AM
To: Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) <adon=
gare@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-cor=
e@lists.openembedded.org>
Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>; to@ci=
sco.com <to@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41079

On Tue Jun 23, 2026 at 1:30 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Pick the upstream patch [1] as mentioned in [2].
>
> [1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a921=
97ca99609b3f080
> [2] https://security-tracker.debian.org/tracker/CVE-2026-41079
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>

As far as I know, this fix is also needed on wrynose:
CVE-2026-41079 impacts "up to 2.4.17 excluding" per NVD and wrynose has 2.4=
.16.

Can you send a fix for wrynose so I can take this one for scarthgap?

> ---
>  meta/recipes-extended/cups/cups.inc           |  1 +
>  .../cups/cups/CVE-2026-27447.patch            |  4 +-
>  .../cups/cups/CVE-2026-34978.patch            | 25 +++++--
>  .../cups/CVE-2026-34980-regression_p2.patch   |  8 +--
>  .../cups/cups/CVE-2026-34990.patch            | 19 ++---
>  .../cups/cups/CVE-2026-41079.patch            | 72 +++++++++++++++++++

This patch touches a lot of patches added previously in the series. I
think this is a mistake and those changes should either be dropped or
squashed in the proper commit.

Can you send a v2 of the whole series with this cleaned up?
Please split CVE-2026-41079 and CVE-2026-27447 into another series as
those need a wrynose fix.

Thanks!


>  6 files changed, 106 insertions(+), 23 deletions(-)
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch


>
> diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
> index c2bf572bf5..64f71c9465 100644
> --- a/meta/recipes-extended/cups/cups.inc
> +++ b/meta/recipes-extended/cups/cups.inc
> @@ -31,6 +31,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
>             file://CVE-2026-34990.patch \
>             file://CVE-2026-39314.patch \
>             file://CVE-2026-39316.patch \
> +           file://CVE-2026-41079.patch \
>             "
>
>  GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-27447.patch
> index 77a26dae64..1884acfa9f 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch
> @@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md
>  index 4a2e25d..0da2c55 100644
>  --- a/CHANGES.md
>  +++ b/CHANGES.md
> -@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)
> +@@ -21,6 +21,8 @@
>   Changes in CUPS v2.4.10 (2024-06-18)
> - -----------------------------
> + ------------------------------------
>
>  +- CVE-2026-27447: The scheduler treated local user and group names as c=
ase-
>  +  insensitive.
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-34978.patch
> index d05bc85588..b4b83a41d0 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
> @@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md
>  index 7a5e8813f..429ee874f 100644
>  --- a/CHANGES.md
>  +++ b/CHANGES.md
> -@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)
> - Changes in CUPS v2.4.10 (2024-06-18)
> - ------------------------------------
> -
> +@@ -24,6 +24,8 @@
>   - CVE-2026-27447: The scheduler treated local user and group names as c=
ase-
>     insensitive.
> -- Fixed cupsd crash if user does not exist (Issue #1555)
> + - Fixed cupsd crash if user does not exist (Issue #1555)
>  +- CVE-2026-34978: The RSS notifier could write outside the scheduler's =
RSS
>  +  directory.
>   - Fixed error handling when reading a mixed `1setOf` attribute.
> @@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644
>  +    {
>  +      send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify=
-recipient-uri URI \"%s\"."), recipient);
>  +      ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, =
"notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
> ++      return;
> ++    }
> +       }
> +       else if (!strcmp(attr->name, "notify-pull-method") &&
> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
> +@@ -6010,6 +6016,12 @@ create_subscriptions(
> +                      "notify-status-code", IPP_ATTRIBUTES);
> +        return;
> +      }
> ++    else if (!strcmp(scheme, "rss") && strstr(resource, "../") !=3D NUL=
L)
> ++    {
> ++      send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify=
-recipient-uri URI \"%s\"."), recipient);
> ++      ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, =
"notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
> ++      return;
> ++    }
> +       }
> +       else if (!strcmp(attr->name, "notify-pull-method") &&
> +                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2=
.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
> index 73846cb8a3..0cf63b10af 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.patch
> @@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644
>   #
>   # Test the lp command.
>   #
> --# Copyright =A9 2020-2024 by OpenPrinting.
> -+# Copyright =A9 2020-2026 by OpenPrinting.
> - # Copyright =A9 2007-2019 by Apple Inc.
> - # Copyright =A9 1997-2005 by Easy Software Products, all rights reserve=
d.
> +-# Copyright =A9 2020-2024 by OpenPrinting.
> ++# Copyright =A9 2020-2026 by OpenPrinting.
> + # Copyright =A9 2007-2019 by Apple Inc.
> + # Copyright =A9 1997-2005 by Easy Software Products, all rights reserve=
d.
>   #
>  @@ -72,8 +72,8 @@ echo ""
>
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-34990.patch
> index e3d6e10a23..916cdc09a3 100644
> --- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch
> @@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644
>     {
>       OSStatus                status;         /* Status */
>       char            authdata[HTTP_MAX_VALUE];
> -@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)      /* I - Clie=
nt connection */
> +@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)      /* I - Clie=
nt connection */
>   #endif /* HAVE_AUTHORIZATION_H */
>   #if defined(SO_PEERCRED) && defined(AF_LOCAL)
> --  else if (!strncmp(authorization, "PeerCred ", 9) &&
> +-  else if (PeerCred !=3D CUPSD_PEERCRED_OFF && !strncmp(authorization, =
"PeerCred ", 9) &&
>  -           con->http->hostaddr->addr.sa_family =3D=3D AF_LOCAL && con->=
best)
>  +  else if (PeerCred !=3D CUPSD_PEERCRED_OFF &&
>  +           !strncmp(authorization, "PeerCred ", 9) &&
> @@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644
>     {
>       send_ipp_status(con, IPP_STATUS_ERROR_FORBIDDEN, _("Only local user=
s can create a local printer."));
>       return;
> -@@ -5621,9 +5621,15 @@ create_local_printer(
> -
> -   ptr =3D ippGetString(device_uri, 0, NULL);
> -
> --  if (!ptr || !ptr[0])
> -+  if (!ptr || !ptr[0])
> -  {
> --    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%=
s\" has empty value."), "device-uri");
> -+    send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST, _("Attribute \"%=
s\" has empty value."), "device-uri");
> +@@ -5634,6 +5634,12 @@ create_local_printer(
>
>       return;
>     }
>  +  else if (strncmp(ptr, "ipp://", 6) && strncmp(ptr, "ipps://", 7))
>  +  {
>  +    send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad device-u=
ri \"%s\"."), ptr);
> -+
> ++
>  +    return;
>  +  }
> +
> +   printer_geo_location =3D ippFindAttribute(con->request, "printer-geo-=
location", IPP_TAG_URI);
> +   printer_info         =3D ippFindAttribute(con->request, "printer-info=
", IPP_TAG_TEXT);
>  diff --git a/scheduler/job.c b/scheduler/job.c
>  index 880c25f..6c033de 100644
>  --- a/scheduler/job.c
> diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-41079.patch
> new file mode 100644
> index 0000000000..f216c84e30
> --- /dev/null
> +++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
> @@ -0,0 +1,72 @@
> +From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00 2001
> +From: Michael R Sweet <msweet@msweet.org>
> +Date: Mon, 13 Apr 2026 11:50:23 -0400
> +Subject: [PATCH] Limit num_bytes for SNMP string values.
> +
> +CVE: CVE-2026-41079
> +Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b=
7c2525a885f528d243c3a92197ca99609b3f080]
> +
> +(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
> +Signed-off-by: Anil Dongare <adongare@cisco.com>
> +---
> + cups/snmp-private.h | 6 +++---
> + cups/snmp.c         | 8 ++++++--
> + 2 files changed, 9 insertions(+), 5 deletions(-)
> +
> +diff --git a/cups/snmp-private.h b/cups/snmp-private.h
> +index 52b8740..015f53e 100644
> +--- a/cups/snmp-private.h
> ++++ b/cups/snmp-private.h
> +@@ -1,7 +1,7 @@
> + /*
> +  * Private SNMP definitions for CUPS.
> +  *
> +- * Copyright =A9 2020-2024 by OpenPrinting.
> ++ * Copyright =A9 2020-2026 by OpenPrinting.
> +  * Copyright =A9 2007-2014 by Apple Inc.
> +  * Copyright =A9 2006-2007 by Easy Software Products, all rights reserv=
ed.
> +  *
> +@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;      /**** ASN1 =
request/object types ****/
> +
> + typedef struct cups_snmp_string_s   /**** String value ****/
> + {
> +-  unsigned char     bytes[CUPS_SNMP_MAX_STRING];
> +-                                    /* Bytes in string */
> +   unsigned  num_bytes;              /* Number of bytes */
> ++  unsigned char     bytes[CUPS_SNMP_MAX_STRING + 1];
> ++                                    /* Bytes in string */
> + } cups_snmp_string_t;
> +
> + union cups_snmp_value_u                     /**** Object value ****/
> +diff --git a/cups/snmp.c b/cups/snmp.c
> +index 54e348f..3222ff3 100644
> +--- a/cups/snmp.c
> ++++ b/cups/snmp.c
> +@@ -1,7 +1,7 @@
> + /*
> +  * SNMP functions for CUPS.
> +  *
> +- * Copyright =A9 2020-2024 by OpenPrinting.
> ++ * Copyright =A9 2020-2026 by OpenPrinting.
> +  * Copyright =A9 2007-2019 by Apple Inc.
> +  * Copyright =A9 2006-2007 by Easy Software Products, all rights reserv=
ed.
> +  *
> +@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,      /* =
I - Buffer */
> +              case CUPS_ASN1_OCTET_STRING :
> +              case CUPS_ASN1_BIT_STRING :
> +              case CUPS_ASN1_HEX_STRING :
> +-                packet->object_value.string.num_bytes =3D length;
> +                  asn1_get_string(&bufptr, bufend, length,
> +                                  (char *)packet->object_value.string.by=
tes,
> +                                  sizeof(packet->object_value.string.byt=
es));
> ++
> ++                if (length >=3D sizeof(packet->object_value.string.byte=
s))
> ++                  packet->object_value.string.num_bytes =3D sizeof(pack=
et->object_value.string.bytes) - 1;
> ++                else
> ++                  packet->object_value.string.num_bytes =3D length;
> +                  break;
> +
> +              case CUPS_ASN1_OID :
> +--
> +2.43.7
> +


--
Yoann Congal
Smile ECS


--_000_CY5PR11MB6187FB6F4790AEC08A95E75CC4C32CY5PR11MB6187namp_
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
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for your review.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regarding your request below:</div>
<blockquote class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
&quot;Can you send a v2 of the whole series with this cleaned up?<br>
Please split CVE-2026-41079 and CVE-2026-27447 into another series as those=
 need a wrynose fix.&quot;</div>
</blockquote>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
The wrynose fixes for both CVE-2026-41079 and CVE-2026-27447 have since bee=
n merged.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Given that the required wrynose fixes are already in place, could you pleas=
e confirm whether you would still prefer the v2 submission to be split into=
 two separate series, or if we can resend the cleaned-up v2 as a single pat=
ch series?</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thanks for your guidance.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Deepak Rathore</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, June 29, 2026 3:27 AM<br>
<b>To:</b> Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco=
) &lt;adongare@cisco.com&gt;; openembedded-core@lists.openembedded.org &lt;=
openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> xe-linux-external (Internal Group) &lt;xe-linux-external@cisco.c=
om&gt;; to@cisco.com &lt;to@cisco.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH 8/8] cups: Fix CVE-2026-41=
079</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Tue Jun 23, 2026 at 1:30 PM CEST, Anil D=
ongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.opene=
mbedded.org wrote:<br>
&gt; From: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt;<br>
&gt; Pick the upstream patch [1] as mentioned in [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/OpenPrinting/cups/commit/b7c2525a885=
f528d243c3a92197ca99609b3f080" id=3D"OWA8cf46e6f-3e09-b0af-2a1c-9d9a3ee1b81=
6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99=
609b3f080</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-41=
079" id=3D"OWAb5958805-119e-7d7a-8a6d-3b48bdab7c66" class=3D"OWAAutoLink" d=
ata-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-41079</a><br>
&gt;<br>
&gt; Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
<br>
As far as I know, this fix is also needed on wrynose:<br>
CVE-2026-41079 impacts &quot;up to 2.4.17 excluding&quot; per NVD and wryno=
se has 2.4.16.<br>
<br>
Can you send a fix for wrynose so I can take this one for scarthgap?<br>
<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-extended/cups/cups.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; .../cups/cups/CVE-2026-27447.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-<br>
&gt;&nbsp; .../cups/cups/CVE-2026-34978.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 25 +++++--<br>
&gt;&nbsp; .../cups/CVE-2026-34980-regression_p2.patch&nbsp;&nbsp; |&nbsp; =
8 +--<br>
&gt;&nbsp; .../cups/cups/CVE-2026-34990.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 19 ++---<br>
&gt;&nbsp; .../cups/cups/CVE-2026-41079.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 72 +++++++++++++++++++<br>
<br>
This patch touches a lot of patches added previously in the series. I<br>
think this is a mistake and those changes should either be dropped or<br>
squashed in the proper commit.<br>
<br>
Can you send a v2 of the whole series with this cleaned up?<br>
Please split CVE-2026-41079 and CVE-2026-27447 into another series as<br>
those need a wrynose fix.<br>
<br>
Thanks!<br>
<br>
<br>
&gt;&nbsp; 6 files changed, 106 insertions(+), 23 deletions(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-4107=
9.patch<br>
<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extend=
ed/cups/cups.inc<br>
&gt; index c2bf572bf5..64f71c9465 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups.inc<br>
&gt; +++ b/meta/recipes-extended/cups/cups.inc<br>
&gt; @@ -31,6 +31,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}=
/cups-${PV}-source.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2026-34990.patch" id=3D"OWA077a816f-04ed-348e-b4f7-=
721ce81ca857" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-34990.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2026-39314.patch" id=3D"OWA2d336237-7382-4c7b-4d4e-=
ef59fb275706" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-39314.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2026-39316.patch" id=3D"OWA3de04801-8b5c-55c4-2378-=
f761dd082469" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-39316.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-41079.patch" id=3D"OWA1fc63638-60d9-c23e-3686-753cfb8ad=
b33" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2026-41079.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/OpenPrin=
ting/cups/releases" id=3D"OWAf592ef7c-61c3-f585-4a80-70f11878df02" class=3D=
"OWAAutoLink" data-auth=3D"NotApplicable">https://github.com/OpenPrinting/c=
ups/releases</a>&quot;<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch b/me=
ta/recipes-extended/cups/cups/CVE-2026-27447.patch<br>
&gt; index 77a26dae64..1884acfa9f 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-27447.patch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-27447.patch<br>
&gt; @@ -22,9 +22,9 @@ diff --git a/CHANGES.md b/CHANGES.md<br>
&gt;&nbsp; index 4a2e25d..0da2c55 100644<br>
&gt;&nbsp; --- a/CHANGES.md<br>
&gt;&nbsp; +++ b/CHANGES.md<br>
&gt; -@@ -4,6 +4,8 @@ CHANGES - OpenPrinting CUPS 2.4.10 - (2024-06-18)<br>
&gt; +@@ -21,6 +21,8 @@<br>
&gt;&nbsp;&nbsp; Changes in CUPS v2.4.10 (2024-06-18)<br>
&gt; - -----------------------------<br>
&gt; + ------------------------------------<br>
&gt;&nbsp;&nbsp;<br>
&gt;&nbsp; +- CVE-2026-27447: The scheduler treated local user and group na=
mes as case-<br>
&gt;&nbsp; +&nbsp; insensitive.<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/me=
ta/recipes-extended/cups/cups/CVE-2026-34978.patch<br>
&gt; index d05bc85588..b4b83a41d0 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch<br>
&gt; @@ -22,13 +22,10 @@ diff --git a/CHANGES.md b/CHANGES.md<br>
&gt;&nbsp; index 7a5e8813f..429ee874f 100644<br>
&gt;&nbsp; --- a/CHANGES.md<br>
&gt;&nbsp; +++ b/CHANGES.md<br>
&gt; -@@ -21,9 +21,11 @@ Changes in CUPS v2.4.11 (2024-09-30)<br>
&gt; - Changes in CUPS v2.4.10 (2024-06-18)<br>
&gt; - ------------------------------------<br>
&gt; -<br>
&gt; +@@ -24,6 +24,8 @@<br>
&gt;&nbsp;&nbsp; - CVE-2026-27447: The scheduler treated local user and gro=
up names as case-<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; insensitive.<br>
&gt; -- Fixed cupsd crash if user does not exist (Issue #1555)<br>
&gt; + - Fixed cupsd crash if user does not exist (Issue #1555)<br>
&gt;&nbsp; +- CVE-2026-34978: The RSS notifier could write outside the sche=
duler's RSS<br>
&gt;&nbsp; +&nbsp; directory.<br>
&gt;&nbsp;&nbsp; - Fixed error handling when reading a mixed `1setOf` attri=
bute.<br>
&gt; @@ -100,3 +97,21 @@ index 2d80a960e..2dc7376c1 100644<br>
&gt;&nbsp; +&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_=
ERROR_NOT_POSSIBLE, _(&quot;Bad notify-recipient-uri URI \&quot;%s\&quot;.&=
quot;), recipient);<br>
&gt;&nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ippAddInteger(con-&gt;response, =
IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, &quot;notify-status-code&quot;, IPP_STA=
TUS_ERROR_ATTRIBUTES_OR_VALUES);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!strcmp(attr-&gt;name, =
&quot;notify-pull-method&quot;) &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; attr-&gt;value_tag =3D=3D IPP_TAG_KEYWORD)<br>
&gt; +@@ -6010,6 +6016,12 @@ create_subscriptions(<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;notify-stat=
us-code&quot;, IPP_ATTRIBUTES);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; else if (!strcmp(scheme, &quot;rss&quot;) &amp;&a=
mp; strstr(resource, &quot;../&quot;) !=3D NULL)<br>
&gt; ++&nbsp;&nbsp;&nbsp; {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR=
_NOT_POSSIBLE, _(&quot;Bad notify-recipient-uri URI \&quot;%s\&quot;.&quot;=
), recipient);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ippAddInteger(con-&gt;response, IPP_T=
AG_SUBSCRIPTION, IPP_TAG_ENUM, &quot;notify-status-code&quot;, IPP_STATUS_E=
RROR_ATTRIBUTES_OR_VALUES);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (!strcmp(attr-&gt;name, =
&quot;notify-pull-method&quot;) &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; attr-&gt;value_tag =3D=3D IPP_TAG_KEYWORD)<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression=
_p2.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.pa=
tch<br>
&gt; index 73846cb8a3..0cf63b10af 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.pat=
ch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-34980-regression_p2.pat=
ch<br>
&gt; @@ -43,10 +43,10 @@ index 25e9d65..fe60890 100644<br>
&gt;&nbsp;&nbsp; #<br>
&gt;&nbsp;&nbsp; # Test the lp command.<br>
&gt;&nbsp;&nbsp; #<br>
&gt; --# Copyright =A9 2020-2024 by OpenPrinting.<br>
&gt; -+# Copyright =A9 2020-2026 by OpenPrinting.<br>
&gt; - # Copyright =A9 2007-2019 by Apple Inc.<br>
&gt; - # Copyright =A9 1997-2005 by Easy Software Products, all rights rese=
rved.<br>
&gt; +-# Copyright =A9&nbsp;2020-2024 by OpenPrinting.<br>
&gt; ++# Copyright =A9&nbsp;2020-2026 by OpenPrinting.<br>
&gt; + # Copyright =A9&nbsp;2007-2019 by Apple Inc.<br>
&gt; + # Copyright =A9&nbsp;1997-2005 by Easy Software Products, all rights=
 reserved.<br>
&gt;&nbsp;&nbsp; #<br>
&gt;&nbsp; @@ -72,8 +72,8 @@ echo &quot;&quot;<br>
&gt;&nbsp;&nbsp;<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch b/me=
ta/recipes-extended/cups/cups/CVE-2026-34990.patch<br>
&gt; index e3d6e10a23..916cdc09a3 100644<br>
&gt; --- a/meta/recipes-extended/cups/cups/CVE-2026-34990.patch<br>
&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-34990.patch<br>
&gt; @@ -147,10 +147,10 @@ index 1dd520d..56855fc 100644<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OSStatus&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Status */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; authdata[HTTP_MAX_VALUE];<br>
&gt; -@@ -399,7 +399,8 @@ cupsdAuthorize(cupsd_client_t *con)&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* I - Client connection */<br>
&gt; +@@ -399,6 +399,7 @@ cupsdAuthorize(cupsd_client_t *con)&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* I - Client connection */<br>
&gt;&nbsp;&nbsp; #endif /* HAVE_AUTHORIZATION_H */<br>
&gt;&nbsp;&nbsp; #if defined(SO_PEERCRED) &amp;&amp; defined(AF_LOCAL)<br>
&gt; --&nbsp; else if (!strncmp(authorization, &quot;PeerCred &quot;, 9) &a=
mp;&amp;<br>
&gt; +-&nbsp; else if (PeerCred !=3D CUPSD_PEERCRED_OFF &amp;&amp; !strncmp=
(authorization, &quot;PeerCred &quot;, 9) &amp;&amp;<br>
&gt;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; co=
n-&gt;http-&gt;hostaddr-&gt;addr.sa_family =3D=3D AF_LOCAL &amp;&amp; con-&=
gt;best)<br>
&gt;&nbsp; +&nbsp; else if (PeerCred !=3D CUPSD_PEERCRED_OFF &amp;&amp;<br>
&gt;&nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !s=
trncmp(authorization, &quot;PeerCred &quot;, 9) &amp;&amp;<br>
&gt; @@ -202,24 +202,19 @@ index b0d1f5b..11dcd39 100644<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ER=
ROR_FORBIDDEN, _(&quot;Only local users can create a local printer.&quot;))=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; -@@ -5621,9 +5621,15 @@ create_local_printer(<br>
&gt; -<br>
&gt; -&nbsp;&nbsp; ptr =3D ippGetString(device_uri, 0, NULL);<br>
&gt; -<br>
&gt; --&nbsp; if (!ptr || !ptr[0])<br>
&gt; -+&nbsp; if (!ptr || !ptr[0])<br>
&gt; -&nbsp; {<br>
&gt; --&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST=
, _(&quot;Attribute \&quot;%s\&quot; has empty value.&quot;), &quot;device-=
uri&quot;);<br>
&gt; -+&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR_BAD_REQUEST=
, _(&quot;Attribute \&quot;%s\&quot; has empty value.&quot;), &quot;device-=
uri&quot;);<br>
&gt; +@@ -5634,6 +5634,12 @@ create_local_printer(<br>
&gt;&nbsp;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; +&nbsp; else if (strncmp(ptr, &quot;ipp://&quot;, 6) &amp;&amp; =
strncmp(ptr, &quot;ipps://&quot;, 7))<br>
&gt;&nbsp; +&nbsp; {<br>
&gt;&nbsp; +&nbsp;&nbsp;&nbsp; send_ipp_status(con, IPP_STATUS_ERROR_NOT_PO=
SSIBLE, _(&quot;Bad device-uri \&quot;%s\&quot;.&quot;), ptr);<br>
&gt; -+<br>
&gt; ++<br>
&gt;&nbsp; +&nbsp;&nbsp;&nbsp; return;<br>
&gt;&nbsp; +&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp; printer_geo_location =3D ippFindAttribute(con-&gt;reques=
t, &quot;printer-geo-location&quot;, IPP_TAG_URI);<br>
&gt; +&nbsp;&nbsp; printer_info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; =3D ippFindAttribute(con-&gt;request, &quot;printer-info&quot;, IPP_TA=
G_TEXT);<br>
&gt;&nbsp; diff --git a/scheduler/job.c b/scheduler/job.c<br>
&gt;&nbsp; index 880c25f..6c033de 100644<br>
&gt;&nbsp; --- a/scheduler/job.c<br>
&gt; diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/me=
ta/recipes-extended/cups/cups/CVE-2026-41079.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f216c84e30<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch<br>
&gt; @@ -0,0 +1,72 @@<br>
&gt; +From b8730b3e18852d203f7fa86a05ed0a8aa3a791e5 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Michael R Sweet &lt;msweet@msweet.org&gt;<br>
&gt; +Date: Mon, 13 Apr 2026 11:50:23 -0400<br>
&gt; +Subject: [PATCH] Limit num_bytes for SNMP string values.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-41079<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenPrinting=
/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080" id=3D"OWA54b6f20d-7e=
02-72bd-871c-bf9e87563db5" class=3D"OWAAutoLink" data-auth=3D"NotApplicable=
">https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca=
99609b3f080</a>]<br>
&gt; +<br>
&gt; +(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)<=
br>
&gt; +Signed-off-by: Anil Dongare &lt;adongare@cisco.com&gt;<br>
&gt; +---<br>
&gt; + cups/snmp-private.h | 6 +++---<br>
&gt; + cups/snmp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8 ++++=
++--<br>
&gt; + 2 files changed, 9 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/cups/snmp-private.h b/cups/snmp-private.h<br>
&gt; +index 52b8740..015f53e 100644<br>
&gt; +--- a/cups/snmp-private.h<br>
&gt; ++++ b/cups/snmp-private.h<br>
&gt; +@@ -1,7 +1,7 @@<br>
&gt; + /*<br>
&gt; +&nbsp; * Private SNMP definitions for CUPS.<br>
&gt; +&nbsp; *<br>
&gt; +- * Copyright =A9&nbsp;2020-2024 by OpenPrinting.<br>
&gt; ++ * Copyright =A9&nbsp;2020-2026 by OpenPrinting.<br>
&gt; +&nbsp; * Copyright =A9&nbsp;2007-2014 by Apple Inc.<br>
&gt; +&nbsp; * Copyright =A9&nbsp;2006-2007 by Easy Software Products, all =
rights reserved.<br>
&gt; +&nbsp; *<br>
&gt; +@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /**** ASN1 request/object types ****/<br>
&gt; +<br>
&gt; + typedef struct cups_snmp_string_s&nbsp;&nbsp; /**** String value ***=
*/<br>
&gt; + {<br>
&gt; +-&nbsp; unsigned char&nbsp;&nbsp;&nbsp;&nbsp; bytes[CUPS_SNMP_MAX_STR=
ING];<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Byte=
s in string */<br>
&gt; +&nbsp;&nbsp; unsigned&nbsp; num_bytes;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Number of bytes */<br>
&gt; ++&nbsp; unsigned char&nbsp;&nbsp;&nbsp;&nbsp; bytes[CUPS_SNMP_MAX_STR=
ING + 1];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Byte=
s in string */<br>
&gt; + } cups_snmp_string_t;<br>
&gt; +<br>
&gt; + union cups_snmp_value_u&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 /**** Object value ****/<br>
&gt; +diff --git a/cups/snmp.c b/cups/snmp.c<br>
&gt; +index 54e348f..3222ff3 100644<br>
&gt; +--- a/cups/snmp.c<br>
&gt; ++++ b/cups/snmp.c<br>
&gt; +@@ -1,7 +1,7 @@<br>
&gt; + /*<br>
&gt; +&nbsp; * SNMP functions for CUPS.<br>
&gt; +&nbsp; *<br>
&gt; +- * Copyright =A9 2020-2024 by OpenPrinting.<br>
&gt; ++ * Copyright =A9 2020-2026 by OpenPrinting.<br>
&gt; +&nbsp; * Copyright =A9&nbsp;2007-2019 by Apple Inc.<br>
&gt; +&nbsp; * Copyright =A9&nbsp;2006-2007 by Easy Software Products, all =
rights reserved.<br>
&gt; +&nbsp; *<br>
&gt; +@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; /* I - Buffer */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; case CUPS_ASN1_OCTET_STRING :<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; case CUPS_ASN1_BIT_STRING :<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; case CUPS_ASN1_HEX_STRING :<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; packet-&gt;object_value.string.num_bytes =3D length;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asn1_get_string(&amp;bufptr, bufend, leng=
th,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)packet-&gt;o=
bject_value.string.bytes,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(packet-&gt;ob=
ject_value.string.bytes));<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; if (length &gt;=3D sizeof(packet-&gt;object_value.st=
ring.bytes))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packet-&gt;object_value.string.num_bytes=
 =3D sizeof(packet-&gt;object_value.string.bytes) - 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packet-&gt;object_value.string.num_bytes=
 =3D length;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; case CUPS_ASN1_OID :<br>
&gt; +--<br>
&gt; +2.43.7<br>
&gt; +<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_CY5PR11MB6187FB6F4790AEC08A95E75CC4C32CY5PR11MB6187namp_--

