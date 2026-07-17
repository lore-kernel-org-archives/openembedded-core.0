Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982FFC44515
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:40:57 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7563.1784266856492399751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FH5WVFtJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=40214; q=dns/txt;
  s=iport01; t=1784266856; x=1785476456;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=BOKP73J5GfnT2j/VCw3Wiwz8zB5rcshqt1Mn0m9peHk=;
  b=FH5WVFtJCkeCn53S6zEnhp74+wSmU+gMwS3obobxFOtkavw8Y0IAsEOp
   M49/GY2StKqGP2n/mdNe0OANcF+3umuoukZy4db5FXipLPDwe+mK0k1lr
   YkrRZnVj338globOLSKLVZ0qouwARcGE8lmn9kPaOCZA26E7JXnlmDA1s
   CYyHyW1M8Nn+BR/EmsT6LucRa0iEiEdoW2m0AljQ0hMxIvWe/UTMGpiLg
   iNK7j9F3dBg9otkEw9V69MFDHqtqADA2lg+Ge5KknzRsct/nyJT/eQ32d
   /OkYHCFrF5vwIBssv531UtXC/w0FYgMWVAfLjvx6SmtMWz8m9YSKilRJy
   g==;
X-CSE-ConnectionGUID: 9Oubz+xkRcexvsxxOSpllA==
X-CSE-MsgGUID: ebyUhhJ2S2eUrTLZkstwyQ==
X-IPAS-Result: =?us-ascii?q?A0ApAAByt1lq/4//Ja1aHQEBAQEJARIBBQUBZYEXCAELA?=
 =?us-ascii?q?YE8ATBTFnICgSFJA4ggA4RMX4ZYgiEDnhuBeAYPAQEBDQIuARUNBAEBhQUCj?=
 =?us-ascii?q?VICJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTwEMhloBA?=
 =?us-ascii?q?QEBAwEROQE9AgEIEQMBAQEhAQ0nCh0IAgQTCBqCYYIdFkEDAQIOsWEBgT0Ci?=
 =?us-ascii?q?VkaN3iBNIEBgygBPwJD234BCxQBgTgBhT6DHAEBKoE1gl2BIhgBhHwnGxuBc?=
 =?us-ascii?q?oEUAUJ5L4FBPoEFgVwCA4E0Kx4Gg2+CMASCDRV6EhuBPx6BfIFfgRiCNIhaU?=
 =?us-ascii?q?nIiAyYzLAFVExcLBwWBI0MDKi8tI0sFLR2BIyEdFxYeWBsHBRIgKkFFIwNPP?=
 =?us-ascii?q?TgLQwWBVgKCCE4jHwM5f4EvdUp3LWoCEBdpQSSCFIE+AwttPTcUGwMEgTUFj?=
 =?us-ascii?q?FwHWyOCHxkHgQ4BKwQTGCAwBkgbRAYJkygBBwyBI44gjmCVFwoog3WMIY0+g?=
 =?us-ascii?q?gSGLheEBI0UmVQLmH0jjWebDgIEAgQFAhABAQaBaDwrgS5wFYMiCUoZD44qA?=
 =?us-ascii?q?xaDYIUTySV5AgkDLwEBBwIHDgMLgWiEYYsfAiYHgU8BAQ?=
IronPort-PHdr: A9a23:Rvp0ZhWYjvumvWCq/TYCxs/WW/nV8K3PAWYlg6HPw5pUeailupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:QuHMrat4dlxIGon3VG0aRULSAOfnVA1fMUV32f8akzHdYApBsoF/q
 tZmKTjSO/ncZGT0e41yOovioRgEvJaDmIA1GgBl+C42RXgQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3a9ks11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwq8FqC3MN5
 f8iIz0dcAuTl8WN2La/Y7w57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XeiZAoUiQrLAf6GnIxws327/oWDbQUoDbG5UKxxvJ+
 woq+Uz0CAAnNNy9kwHf/0+2usv9njjnR5MrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwdfJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:T2UY6a6way1xOYrfFwPXwcGCI+orL9Y04lQ7vn2ZFiYlEfBwxv
 rPoB1E737JYW4qKQ4dcLC7VJVoMkmsi6KdgLNhcYtKMzOWw1dAQLsSibcKhgeQZxEWldQtmp
 uIEZIOcuEYZGIS5a2VkWvIdurIguP3jZxA7t2uqUuFODsaE52ImD0JczpzfHcGIzVuNN4SLr
 bZzMxBoDarZHQQaeqGJlRtZYL+juyOvqjLJTodCTAayCTmt16VwY+/PwmT3x8YXT8K+rE/7G
 jDnTX+46Woo9u7xhXf22K71eUZpDLm8LR+Lf3JrvJQBiTniw6uaogkcaaFpioJrOam70tvuM
 XQoj87Vv4Dq0/5TyWQm1/AygPg2DEh5zvJ0lmDm0bupsT/WXYTF9dBv4REaRHUgnBQ/+2UkZ
 g7nV5xhaAnSS8orx6NoOQgkCsa0HZclEBS1NL7SUYvCLf2JoUh9bD3t3klYavoVBiKmLzPVt
 MeTf301bJxbU6QaWzfsy1ExdyhWWl2IzK9K3Jy4fB8F1Nt7S1EJ4xy/r1Eop8NmahNOKVs9q
 DKNL9lm6pJSdJTZaVhBP0ZSc/yEWDVRwnQWVjiamgPOZt3ck4lkaSHqIkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmL0IdQ+h7ATW2hVXC1o/suqqRRq/n5Xv7mICeDQFchn4+ppOgeGNTSX7
 K2NIhNC/HuIGPyEcJC3hH4WZNVNX4COfdl8OoTShaLuIbGO4fqvuvUfLLaI6fsCy8tXiflDn
 4KTFHIVbN9B4CQKwjFaTTqKgfQkxbEjOBN+YDhjp0u9LQ=
X-Talos-CUID: 9a23:wrw0YG25orFF1gV+H1gp57xfS+c4eG+e3HTqKEKoF315WJquUVuU0fYx
X-Talos-MUID: 9a23:FfY/nQimaB+moTUjlwI7YsMpOc153qSuKho2y5g7ofWgBy9rJyiMtWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:55 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id C936E18000242
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:54 +0000 (GMT)
X-CSE-ConnectionGUID: vphjjtCzTIy8gfz05yo34A==
X-CSE-MsgGUID: NA4WLR/JReOg+E2oo12nrA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="88415032"
Received: from mail-westcentralusazon11010028.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.28])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwZbvwvLsI6SMGiCMHB8Rg1S1DsSV2FP3onEoQfBf5mZitlgmBGj8hOWXxVqo8DRO/gAzO+/+OVEDPcmtXEdelDu15DNPq2ENRt4Z8Fip9dvo9nzmY71qd5n/2C6gLeKobjHU4oTkgX0FoJcZQfb7ejTpVqbJzmTvnd3pzycMyDo2t1eupR38p0nvBXjBCbL+pJ6kQIw2bOKXrwytalPZ7heweQskZMAq1e41UmOzQ5SCVPARAqN1dqZCBZaZT1ZsLiCuI5bn0uKfewexwaiFGt0dAbRJ5YZIDzAGLphRbg0QQzSXvYLE6KuPxiu0BVqZxDPV3jUhrNy32PCLJoGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOKP73J5GfnT2j/VCw3Wiwz8zB5rcshqt1Mn0m9peHk=;
 b=ZofuWHfUs2a+5BzsD+TwmQGhgn/tQY4pZXHY26MdPLAjkTfSSnt3exZuAUB8O8DwPZqsRaTX7/5+xg7i5wHPitYGfbeS+4S3Rb6YNFLXmXH/SGkDPyqFPZ3XWLcwfX0pyy5JzDak800xjb3J+igY7Ha+5/cND3tk/InYD20aHiJqRbJvSVQQ8UEizg7FA1/TmMfGFlHyKpRCLqEAKBHmrtAnUmriLhJhCUwG9bWRrwiwQYo33IxSZ85dJ/2wkqVQO4tM7B8JQwevyvXSr6pfemVwDilTvpCcUYhsdog3dtl6TodQRT9JCHimkb5pJSdjmtGnmSSbndVHFZGYHGQiig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:40:52 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:40:52 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 3/6] rsync: Fix CVE-2026-43618
Thread-Topic: [wrynose][PATCH v2 3/6] rsync: Fix CVE-2026-43618
Thread-Index: AQHdFawTNzfZS1qEg0WIypPXaG8DKLZxMk4D
Date: Fri, 17 Jul 2026 05:40:52 +0000
Message-ID: 
 <PH0PR11MB5902C3774430036CB218AE36CFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
 <20260717052059.773645-4-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-4-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 288cae62-87c4-4f3b-bc23-08dee3c5f731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|25016099003|12006099003|29003799003|16056099006|13003099007|22082099003|38070700021|18002099003|8096899003|56012099006|11063799006|10067099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 6WXUGxjQKhw5mcQjGZDATXJHBtKlL0hEdrmD8qSDlrT11NRcw+RytyWAsJY1DntN4dmn3YvkB7UQd4Rr89CxUMLL8/CZ9rA1K5XCMLbvMPip8+USSsZWm9bc3z22bEjoOceL5sBGeQL+fYz+Cpa2qlKJ8Ex6HWVwyFpAZdgUeBkGmF4DJtC9dLGlMHvv3IukeV0D92VqLnWIWZJj/HOodfAjarGGZTAmIrY5Evz+8BAO9GLpoZrO05MRkGA1wepsbu1tYUHXXaGbcesxfOUt+B5lEO+JptkhGyFvxczwVIrufIKGeWO2iaUvktTx9TDvZI0XBWFvR8M5ZNCA+du1/oC+IE+2/aPYzFBDeFyKIMtQiMEsdKPftDBt3LbEpR+SPdhL1Q//vzVLN3agfIyKYLfwY9FhO3ivBqn980QCFW/V1bKfciQnP1dzjkqysXHeESqKqyedWrLozZ/h3KVOUhwnBkdZWJKdjJDsUkGrBBao0DsXDzrULCcSTdsjzOt2XyDo4hD4YLo4DfkWEmD1d7fC0QqTez5v4b2UXrH1I17loW+CCbZaNmy1GWvmKeWJ3kmo2wJfi7lQXlQEIINCanmWtc7+MICq3hIM50rUCMI0t3X+tjusU3J7P6XpYKcDR16JeZOUDn6+EbKpYOKVv5kruNax1+E2BSkQdkAJq7M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(25016099003)(12006099003)(29003799003)(16056099006)(13003099007)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dHzUu41ZG8ulfXjYdOiuHCbz5hhLU7mL/nbSCwPZMGIzeTMbuRR9L6q/6I7Q?=
 =?us-ascii?Q?GXMuxwHp5YIDeNkKfGiTv8f89xgO+kfs0iATI+jyOwDSVlG6Yd9qF9u9WKhn?=
 =?us-ascii?Q?3qlacm6p4KCELkr/wiVB6D9IPpCxa+b6GS6Rpgqp+wnUicUbcXh9k/d5qaNq?=
 =?us-ascii?Q?iarXNDkE2iW/C86G2G1JDtLTCGBjxjcqW057ekk1etYTM8w4qseoFXH9ul9P?=
 =?us-ascii?Q?bjzvpZwqdjlUpfL8vzYG7Fk453KP16EG+lJ4ZB2p2oPrZvb6KRbquvpbk6zY?=
 =?us-ascii?Q?INgfKf+6TdyuPHFr363rrGS/6jCwEhCdsTdb7wBC4XISNYLpY0oiwmauZnUU?=
 =?us-ascii?Q?uBzb2FvzQCXQmj3wgDNDV0KWVI5Mc3SpPQfATUr++f7qFE0hEVXBFdgbW7Z2?=
 =?us-ascii?Q?uhsH5bglyadCvk7b4uvmjmmFWTLnw7I5prlZ2pNJENHgCHdIUjSuk8uJc1Sc?=
 =?us-ascii?Q?1pamwJG5Bk7QV5AFMv5toKZb+49S3GkDp2zY8a6/trOJPajamAroQO0dLpB/?=
 =?us-ascii?Q?RflzJH+cF1hKfLmeEV7lQOaEL6LIOmCyCI8ykCqqSZbmqavhlAgeiK14xJMY?=
 =?us-ascii?Q?8M9ArwDCqlO128q0l8BNU5knWl1BiMEw1ab03+zAGfLr/U/r9UCJtITBz7CK?=
 =?us-ascii?Q?TKEPLigdj78ob4HCKPDnx/S6Y2OKcTdUxjVwA6WpDJo7DaUIju8vlCWPdKxj?=
 =?us-ascii?Q?iyplqRbtGnA7xd6uWWhHiViljGIXld2heSIulxQa0gxuFWG323Qna6XF4ejZ?=
 =?us-ascii?Q?LdAs6pR8mpcbru3s3vww5ZcYW9RJ+9ySHXvgB4rSQNMpW91p7mlt5AQCxK4O?=
 =?us-ascii?Q?6WitBYM2lSwuBLIN7AdzZV3t+ZU9VQbKdy422E1lGiQrsWNj/y16tjQ23pxw?=
 =?us-ascii?Q?57C9rwpuiVu+dpQYv2MuPYRieErj0kGXsm9vK6wxYwkQ9Rr5PEgJv7xI0hOE?=
 =?us-ascii?Q?4mEMi0FNLo4tTfP+BctVpAWYCLbzd83+VlVkEux/yLTuzj76bZvlBhJit+kC?=
 =?us-ascii?Q?Eh0QMdaVFBNmkweyUxyVKyMesWXQYuSgxEbIcfErl3opi6djna8El5fgrvWL?=
 =?us-ascii?Q?RL9M2KQhYbYeRI2fzebmzRSYbf0VreBeDZ1OZePw/xU7Y3X9Q56ZWT8428Ce?=
 =?us-ascii?Q?RwQ8+rqNDf7LKbWftRtdZtHkop/vPzBGyG369wk0qoCSdE0QnQwnyJIu4CF0?=
 =?us-ascii?Q?9jLtnmd8kW8VQAEPdOJS+n4Lbj1Zvyc60aANTYS0ZfLP1LmQQIIAIK2f0BkQ?=
 =?us-ascii?Q?t6ZGKTEwUp1v5d26i5o5Z19LG+41mUZ6vzA0JJAY2aaYShRlrDc8Rl1Vp1bO?=
 =?us-ascii?Q?v15RXnyYE3jdq1tFKtOBYk1cqDY9yN5iFtItyXGI3Su3QH7a06VMN+SrDJY/?=
 =?us-ascii?Q?MvBgOU/ZHypr3EEq39qRU1vfHVDyDknXvU2J23RXP7yn19NP+HpvK838vq8y?=
 =?us-ascii?Q?f4Q1ocJcZpM6tn8pS0R4Jh+wLFS/x7ZLaaTH94oWc2LpfjemMaiC4VTKCg62?=
 =?us-ascii?Q?uuTeKRyBu7zPyqsUofqxfLpEjHehOBkHVcWuU3vHUON6eO5iHtiVul4IAd41?=
 =?us-ascii?Q?tAc4batYYqIKVK+ZIg5Uw9xx1t50ecHM/PsP9KIkuJTyREXiatF68T7Y5FZH?=
 =?us-ascii?Q?viATXzXixwARaJXvUF3+Ocw2CilAG+lxgDfkgFlhUCkv8bDKSNQSY0F2T+u9?=
 =?us-ascii?Q?QAQpt8OV6biyPFfcjADVtXf0JlaqF3xvNrRQOxxSDBJIjjy2?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902C3774430036CB218AE36CFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	ebB51VWXZEiGeBJWP/Byq2zz/CaYVgb3I9mo9merv+emk+ioZ4FSXgeUMbaU8EwgtJ+bBZBF3a6QYV3k8aQvmzX0YfHSg02ykOiDCGy4LCaJUM/i9gFG53jGF/PzN8KizUcsER5N6PV2vxhWj9RKm/sTKKs7Hrm21/EDgj/q1NyVOEfJrKS/5Ro5Et328fKuVSJdODF5zwuLqIar4/f9G43Ol8YiyCdN3ZKmXM/ACuNe5hcoOh1I6b/LkbRMpA5js1jHlMBjL5UN/yGnJYC2egpJxXxr6i5iMupJZT/ZznyU1Pfgu1BRiT2Cczb75kl5uzX4bWK7+eIkk3TIkS//cw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288cae62-87c4-4f3b-bc23-08dee3c5f731
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:40:52.8122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I384qa1G6m7LEIni0lXGniiOjzORgXuA5MtDJKZIl3g8c8nK4+e51bpEmpvqCXG9g+c3eDBpSfmnS/8wCy3y9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-4.cisco.com [72.163.7.165];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241133

--_000_PH0PR11MB5902C3774430036CB218AE36CFC62PH0PR11MB5902namp_
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
Subject: [wrynose][PATCH v2 3/6] rsync: Fix CVE-2026-43618

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43618. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0=
957f0b9fa4c66a
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-g37v-g3g=
j-pmwq

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43618.patch          | 248 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-43618.patch
new file mode 100644
index 0000000000..4e5cf2dc6d
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
@@ -0,0 +1,248 @@
+From a93cfc86b6daa2dfd754bcbe261cf01afef056f4 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 29 Apr 2026 11:10:59 +1000
+Subject: [PATCH] token: harden compressed-token decoding against integer
+ overflow
+
+The receiver's three compressed-token decoders --
+recv_deflated_token (zlib), recv_zstd_token, and
+recv_compressed_token (lz4) -- accumulated rx_token (a 32-bit
+signed counter) without overflow checking. A malicious sender
+could craft a compressed-token stream that walked rx_token past
+INT32_MAX, with careful manipulation leaking process memory
+contents to the wire (environment variables, passwords, heap
+pointers, library pointers -- significantly weakening ASLR
+and facilitating further exploitation).
+
+Cap rx_token at MAX_TOKEN_INDEX =3D 0x7ffffffe. Fold the
+bookkeeping into recv_compressed_token_num() and
+recv_compressed_token_run() shared by all three decoders. Reject
+negative or out-of-range token values explicitly. Also cap the
+simple_recv_token literal-block length at the source: any
+wire-supplied length > CHUNK_SIZE is ill-formed (the matching
+simple_send_token never writes a chunk larger than CHUNK_SIZE),
+so reject before looping on attacker-controlled bytes.
+
+Reach: an authenticated daemon connection with compression
+enabled (the default for protocols >=3D 30 when both peers
+advertise it). Disabling compression on the daemon
+("refuse options =3D compress" in rsyncd.conf) is the available
+workaround.
+
+Reporter: Omar Elsayed (seks99x).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43618
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/c4=
4c90e9460c666c965446a8c0957f0b9fa4c66a]
+
+Backport Changes:
+- Resolved token.c context differences against Wrynose's 3.4.1
+  source, whose three decoder bodies do not all match upstream's
+  surrounding negative-token validation blocks.
+- The Wrynose hunk replaces the older per-decoder token bookkeeping
+  with the upstream recv_compressed_token_num() and
+  recv_compressed_token_run() helper calls at the matching zlib,
+  zstd, and lz4 decoder sites.
+
+(cherry picked from commit c44c90e9460c666c965446a8c0957f0b9fa4c66a)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ receiver.c |  11 +++++-
+ token.c    | 102 ++++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 67 insertions(+), 46 deletions(-)
+
+diff --git a/receiver.c b/receiver.c
+index 8cf8366b..a487ad5a 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -318,7 +318,12 @@ static int receive_data(int f_in, char *fname_r, int =
fd_r, OFF_T size_r,
+                }
+        }
+
+-      while ((i =3D recv_token(f_in, &data)) !=3D 0) {
++      while (1) {
++              data =3D NULL;
++              i =3D recv_token(f_in, &data);
++              if (i =3D=3D 0)
++                      break;
++
+                if (INFO_GTE(PROGRESS, 1))
+                        show_progress(offset, total_size);
+
+@@ -326,6 +331,10 @@ static int receive_data(int f_in, char *fname_r, int =
fd_r, OFF_T size_r,
+                        maybe_send_keepalive(time(NULL), MSK_ALLOW_FLUSH |=
 MSK_ACTIVE_RECEIVER);
+
+                if (i > 0) {
++                      if (!data) {
++                              rprintf(FERROR, "Invalid literal token with=
 no data [%s]\n", who_am_i());
++                              exit_cleanup(RERR_PROTOCOL);
++                      }
+                        if (DEBUG_GTE(DELTASUM, 3)) {
+                                rprintf(FINFO,"data recv %d at %s\n",
+                                        i, big_num(offset));
+diff --git a/token.c b/token.c
+index c108b3af..02dabd8d 100644
+--- a/token.c
++++ b/token.c
+@@ -291,6 +291,14 @@ static int32 simple_recv_token(int f, char **data)
+                int32 i =3D read_int(f);
+                if (i <=3D 0)
+                        return i;
++              /* simple_send_token caps each literal chunk at CHUNK_SIZE;
++               * reject anything larger so a hostile peer cannot drive th=
e
++               * read_buf below past our static CHUNK_SIZE buffer. */
++              if (i > CHUNK_SIZE) {
++                      rprintf(FERROR, "invalid uncompressed token length =
%ld [%s]\n",
++                              (long)i, who_am_i());
++                      exit_cleanup(RERR_PROTOCOL);
++              }
+                residue =3D i;
+        }
+
+@@ -493,9 +501,52 @@ static char *cbuf;
+ static char *dbuf;
+
+ /* for decoding runs of tokens */
++#define MAX_TOKEN_INDEX ((int32)0x7ffffffe)
++
+ static int32 rx_token;
+ static int32 rx_run;
+
++static NORETURN void invalid_compressed_token(void)
++{
++      rprintf(FERROR, "invalid token number in compressed stream\n");
++      exit_cleanup(RERR_PROTOCOL);
++}
++
++static int32 recv_compressed_token_num(int f, int32 flag)
++{
++      if (flag & TOKEN_REL) {
++              int32 incr =3D flag & 0x3f;
++              if (rx_token > MAX_TOKEN_INDEX - incr)
++                      invalid_compressed_token();
++              rx_token +=3D incr;
++              flag >>=3D 6;
++      } else {
++              rx_token =3D read_int(f);
++              if (rx_token < 0 || rx_token > MAX_TOKEN_INDEX)
++                      invalid_compressed_token();
++      }
++
++      if (flag & 1) {
++              rx_run =3D read_byte(f);
++              rx_run +=3D read_byte(f) << 8;
++              if (rx_run <=3D 0 || rx_token > MAX_TOKEN_INDEX - rx_run)
++                      invalid_compressed_token();
++              recv_state =3D r_running;
++      }
++
++      return -1 - rx_token;
++}
++
++static int32 recv_compressed_token_run(void)
++{
++      if (rx_run <=3D 0 || rx_token >=3D MAX_TOKEN_INDEX)
++              invalid_compressed_token();
++      ++rx_token;
++      if (--rx_run =3D=3D 0)
++              recv_state =3D r_idle;
++      return -1 - rx_token;
++}
++
+ /* Receive a deflated token and inflate it */
+ static int32 recv_deflated_token(int f, char **data)
+ {
+@@ -586,17 +637,7 @@ static int32 recv_deflated_token(int f, char **data)
+                        }
+
+                        /* here we have a token of some kind */
+-                      if (flag & TOKEN_REL) {
+-                              rx_token +=3D flag & 0x3f;
+-                              flag >>=3D 6;
+-                      } else
+-                              rx_token =3D read_int(f);
+-                      if (flag & 1) {
+-                              rx_run =3D read_byte(f);
+-                              rx_run +=3D read_byte(f) << 8;
+-                              recv_state =3D r_running;
+-                      }
+-                      return -1 - rx_token;
++                      return recv_compressed_token_num(f, flag);
+
+                case r_inflating:
+                        rx_strm.next_out =3D (Bytef *)dbuf;
+@@ -616,10 +657,7 @@ static int32 recv_deflated_token(int f, char **data)
+                        break;
+
+                case r_running:
+-                      ++rx_token;
+-                      if (--rx_run =3D=3D 0)
+-                              recv_state =3D r_idle;
+-                      return -1 - rx_token;
++                      return recv_compressed_token_run();
+                }
+        }
+ }
+@@ -828,17 +866,7 @@ static int32 recv_zstd_token(int f, char **data)
+                                return 0;
+                        }
+                        /* here we have a token of some kind */
+-                      if (flag & TOKEN_REL) {
+-                              rx_token +=3D flag & 0x3f;
+-                              flag >>=3D 6;
+-                      } else
+-                              rx_token =3D read_int(f);
+-                      if (flag & 1) {
+-                              rx_run =3D read_byte(f);
+-                              rx_run +=3D read_byte(f) << 8;
+-                              recv_state =3D r_running;
+-                      }
+-                      return -1 - rx_token;
++                      return recv_compressed_token_num(f, flag);
+
+                case r_inflated: /* zstd doesn't get into this state */
+                        break;
+@@ -869,10 +897,7 @@ static int32 recv_zstd_token(int f, char **data)
+                        break;
+
+                case r_running:
+-                      ++rx_token;
+-                      if (--rx_run =3D=3D 0)
+-                              recv_state =3D r_idle;
+-                      return -1 - rx_token;
++                      return recv_compressed_token_run();
+                }
+        }
+ }
+@@ -992,17 +1017,7 @@ static int32 recv_compressed_token(int f, char **dat=
a)
+                        }
+
+                        /* here we have a token of some kind */
+-                      if (flag & TOKEN_REL) {
+-                              rx_token +=3D flag & 0x3f;
+-                              flag >>=3D 6;
+-                      } else
+-                              rx_token =3D read_int(f);
+-                      if (flag & 1) {
+-                              rx_run =3D read_byte(f);
+-                              rx_run +=3D read_byte(f) << 8;
+-                              recv_state =3D r_running;
+-                      }
+-                      return -1 - rx_token;
++                      return recv_compressed_token_num(f, flag);
+
+                case r_inflating:
+                        avail_out =3D LZ4_decompress_safe(next_in, dbuf, a=
vail_in, size);
+@@ -1018,10 +1033,7 @@ static int32 recv_compressed_token(int f, char **da=
ta)
+                        break;
+
+                case r_running:
+-                      ++rx_token;
+-                      if (--rx_run =3D=3D 0)
+-                              recv_state =3D r_idle;
+-                      return -1 - rx_token;
++                      return recv_compressed_token_run();
+                }
+        }
+ }
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb
index 47e195ef24..f84f269692 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://CVE-2026-43619_p4.patch \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
+           file://CVE-2026-43618.patch \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf6=
9850d65fd88c52"

--
2.35.6

--_000_PH0PR11MB5902C3774430036CB218AE36CFC62PH0PR11MB5902namp_
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
<b>Subject:</b> [wrynose][PATCH v2 3/6] rsync: Fix CVE-2026-43618</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
This patch applies the upstream v3.4.3 backport for<br>
CVE-2026-43618. The upstream fix commit is referenced in [1],<br>
and the public CVE advisory is referenced in [2].<br>
<br>
[1] <a href=3D"https://github.com/RsyncProject/rsync/commit/c44c90e9460c666=
c965446a8c0957f0b9fa4c66a">
https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0957f=
0b9fa4c66a</a><br>
[2] <a href=3D"https://github.com/RsyncProject/rsync/security/advisories/GH=
SA-g37v-g3gj-pmwq">
https://github.com/RsyncProject/rsync/security/advisories/GHSA-g37v-g3gj-pm=
wq</a><br>
<br>
Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
---<br>
&nbsp;.../rsync/files/CVE-2026-43618.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 248 ++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;2 files changed, 249 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.p=
atch<br>
<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-43618.patch<br>
new file mode 100644<br>
index 0000000000..4e5cf2dc6d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch<br>
@@ -0,0 +1,248 @@<br>
+From a93cfc86b6daa2dfd754bcbe261cf01afef056f4 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Wed, 29 Apr 2026 11:10:59 +1000<br>
+Subject: [PATCH] token: harden compressed-token decoding against integer<b=
r>
+ overflow<br>
+<br>
+The receiver's three compressed-token decoders --<br>
+recv_deflated_token (zlib), recv_zstd_token, and<br>
+recv_compressed_token (lz4) -- accumulated rx_token (a 32-bit<br>
+signed counter) without overflow checking. A malicious sender<br>
+could craft a compressed-token stream that walked rx_token past<br>
+INT32_MAX, with careful manipulation leaking process memory<br>
+contents to the wire (environment variables, passwords, heap<br>
+pointers, library pointers -- significantly weakening ASLR<br>
+and facilitating further exploitation).<br>
+<br>
+Cap rx_token at MAX_TOKEN_INDEX =3D 0x7ffffffe. Fold the<br>
+bookkeeping into recv_compressed_token_num() and<br>
+recv_compressed_token_run() shared by all three decoders. Reject<br>
+negative or out-of-range token values explicitly. Also cap the<br>
+simple_recv_token literal-block length at the source: any<br>
+wire-supplied length &gt; CHUNK_SIZE is ill-formed (the matching<br>
+simple_send_token never writes a chunk larger than CHUNK_SIZE),<br>
+so reject before looping on attacker-controlled bytes.<br>
+<br>
+Reach: an authenticated daemon connection with compression<br>
+enabled (the default for protocols &gt;=3D 30 when both peers<br>
+advertise it). Disabling compression on the daemon<br>
+(&quot;refuse options =3D compress&quot; in rsyncd.conf) is the available<=
br>
+workaround.<br>
+<br>
+Reporter: Omar Elsayed (seks99x).<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43618<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a">https://github.com/Rsync=
Project/rsync/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a</a>]<br>
+<br>
+Backport Changes:<br>
+- Resolved token.c context differences against Wrynose's 3.4.1<br>
+&nbsp; source, whose three decoder bodies do not all match upstream's<br>
+&nbsp; surrounding negative-token validation blocks.<br>
+- The Wrynose hunk replaces the older per-decoder token bookkeeping<br>
+&nbsp; with the upstream recv_compressed_token_num() and<br>
+&nbsp; recv_compressed_token_run() helper calls at the matching zlib,<br>
+&nbsp; zstd, and lz4 decoder sites.<br>
+<br>
+(cherry picked from commit c44c90e9460c666c965446a8c0957f0b9fa4c66a)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ receiver.c |&nbsp; 11 +++++-<br>
+ token.c&nbsp;&nbsp;&nbsp; | 102 ++++++++++++++++++++++++++++++-----------=
------------<br>
+ 2 files changed, 67 insertions(+), 46 deletions(-)<br>
+<br>
+diff --git a/receiver.c b/receiver.c<br>
+index 8cf8366b..a487ad5a 100644<br>
+--- a/receiver.c<br>
++++ b/receiver.c<br>
+@@ -318,7 +318,12 @@ static int receive_data(int f_in, char *fname_r, int =
fd_r, OFF_T size_r,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while ((i =3D recv_token(f_in, &amp;data))=
 !=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (1) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; data =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; i =3D recv_token(f_in, &amp;data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (i =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (INFO_GTE(PROGRESS, 1))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; show_progr=
ess(offset, total_size);<br>
+ <br>
+@@ -326,6 +331,10 @@ static int receive_data(int f_in, char *fname_r, int =
fd_r, OFF_T size_r,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maybe_send=
_keepalive(time(NULL), MSK_ALLOW_FLUSH | MSK_ACTIVE_RECEIVER);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (i &gt; 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!data) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FERROR, &quot;Invalid literal token with=
 no data [%s]\n&quot;, who_am_i());<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; exit_cleanup(RERR_PROTOCOL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (DEBUG_=
GTE(DELTASUM, 3)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FINFO,&quot;data recv %d at %=
s\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; i, big_num(offset));<br>
+diff --git a/token.c b/token.c<br>
+index c108b3af..02dabd8d 100644<br>
+--- a/token.c<br>
++++ b/token.c<br>
+@@ -291,6 +291,14 @@ static int32 simple_recv_token(int f, char **data)<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; int32 i =3D read_int(f);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (i &lt;=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return i;<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* simple_send_token caps each literal chunk at CHUNK_SIZE;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * reject anything larger so a hostile peer cannot drive the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * read_buf below past our static CHUNK_SIZE buffer. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (i &gt; CHUNK_SIZE) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FERROR, &quot=
;invalid uncompressed token length %ld [%s]\n&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; (long)i, who_am_i());<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit_cleanup(RERR_PRO=
TOCOL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; residue =3D i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+@@ -493,9 +501,52 @@ static char *cbuf;<br>
+ static char *dbuf;<br>
+ <br>
+ /* for decoding runs of tokens */<br>
++#define MAX_TOKEN_INDEX ((int32)0x7ffffffe)<br>
++<br>
+ static int32 rx_token;<br>
+ static int32 rx_run;<br>
+ <br>
++static NORETURN void invalid_compressed_token(void)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FERROR, &quot;invalid token number=
 in compressed stream\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit_cleanup(RERR_PROTOCOL);<br>
++}<br>
++<br>
++static int32 recv_compressed_token_num(int f, int32 flag)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; TOKEN_REL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int32 incr =3D flag &amp; 0x3f;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (rx_token &gt; MAX_TOKEN_INDEX - incr)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invalid_compressed_to=
ken();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; rx_token +=3D incr;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; flag &gt;&gt;=3D 6;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; rx_token =3D read_int(f);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (rx_token &lt; 0 || rx_token &gt; MAX_TOKEN_INDEX)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invalid_compressed_to=
ken();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; 1) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; rx_run =3D read_byte(f);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; rx_run +=3D read_byte(f) &lt;&lt; 8;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (rx_run &lt;=3D 0 || rx_token &gt; MAX_TOKEN_INDEX - rx_run)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; invalid_compressed_to=
ken();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; recv_state =3D r_running;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;<br>
++}<br>
++<br>
++static int32 recv_compressed_token_run(void)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rx_run &lt;=3D 0 || rx_token &gt;=3D M=
AX_TOKEN_INDEX)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; invalid_compressed_token();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++rx_token;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (--rx_run =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; recv_state =3D r_idle;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;<br>
++}<br>
++<br>
+ /* Receive a deflated token and inflate it */<br>
+ static int32 recv_deflated_token(int f, char **data)<br>
+ {<br>
+@@ -586,17 +637,7 @@ static int32 recv_deflated_token(int f, char **data)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* here we=
 have a token of some kind */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; TOKEN_=
REL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_token +=3D flag &amp; 0x3f;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; flag &gt;&gt;=3D 6;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_token =3D read_int(f);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; 1) {<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_run =3D read_byte(f);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_run +=3D read_byte(f) &lt;&lt; 8;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; recv_state =3D r_running;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recv_compresse=
d_token_num(f, flag);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case r_inflating:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rx_strm.ne=
xt_out =3D (Bytef *)dbuf;<br>
+@@ -616,10 +657,7 @@ static int32 recv_deflated_token(int f, char **data)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case r_running:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++rx_token;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (--rx_run =3D=3D 0=
)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; recv_state =3D r_idle;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recv_compresse=
d_token_run();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+@@ -828,17 +866,7 @@ static int32 recv_zstd_token(int f, char **data)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* here we=
 have a token of some kind */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; TOKEN_=
REL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_token +=3D flag &amp; 0x3f;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; flag &gt;&gt;=3D 6;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_token =3D read_int(f);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; 1) {<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_run =3D read_byte(f);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_run +=3D read_byte(f) &lt;&lt; 8;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; recv_state =3D r_running;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recv_compresse=
d_token_num(f, flag);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case r_inflated: /* zstd doesn't get into this state */<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+@@ -869,10 +897,7 @@ static int32 recv_zstd_token(int f, char **data)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case r_running:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++rx_token;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (--rx_run =3D=3D 0=
)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; recv_state =3D r_idle;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recv_compresse=
d_token_run();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+@@ -992,17 +1017,7 @@ static int32 recv_compressed_token(int f, char **dat=
a)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* here we=
 have a token of some kind */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; TOKEN_=
REL) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_token +=3D flag &amp; 0x3f;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; flag &gt;&gt;=3D 6;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_token =3D read_int(f);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flag &amp; 1) {<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_run =3D read_byte(f);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rx_run +=3D read_byte(f) &lt;&lt; 8;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; recv_state =3D r_running;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recv_compresse=
d_token_num(f, flag);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case r_inflating:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; avail_out =
=3D LZ4_decompress_safe(next_in, dbuf, avail_in, size);<br>
+@@ -1018,10 +1033,7 @@ static int32 recv_compressed_token(int f, char **da=
ta)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; case r_running:<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++rx_token;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (--rx_run =3D=3D 0=
)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; recv_state =3D r_idle;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1 - rx_token;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return recv_compresse=
d_token_run();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb<br>
index 47e195ef24..f84f269692 100644<br>
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
@@ -26,6 +26,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.samba=
.org/pub/${BPN}/src/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43619_p4.patch">file://CVE-2026-43619_p4.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43619_p5.patch">file://CVE-2026-43619_p5.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43619_p6.patch">file://CVE-2026-43619_p6.patch</a> \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43618.patch">file://CVE-2026-43618.patch</a> \<br>
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

--_000_PH0PR11MB5902C3774430036CB218AE36CFC62PH0PR11MB5902namp_--

