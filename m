Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7F8D262B0
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:30:39 +0000 (UTC)
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7004.1768980632438424180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iLk1kUoh;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20019; q=dns/txt;
  s=iport01; t=1768980632; x=1770190232;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=pJ80yfvD2Q76f+lKETcFEWB2JQKTbhNQYmWjmvJ2hT8=;
  b=iLk1kUoh88pvpvnhketnrnjhVCzM+TBCNnHgqYgdmMcJf+F1wXH/RnhE
   iRahvT2962qzFRkpG9mwfZNocUzRzFTXAdlNFAoiLX72WysVYhFreqq3H
   eV1BqYIWaDzCGTX6wzxNJrJqnluBMe360ebSJrSTv9utBWZ90wR/DK2Zw
   3/Fu66Fb3jpCpOnW4oGgfQ26FP1W0FW6qzxr8+HP0HkWkMmzrmb7ej5m8
   Z9oxH9rXy14Gh31WMw3ptH3sssEDsz18NP2lQa3B4ep0Rrm1OluCwSg5a
   kWmzNq63np6OwkQbDgnj6okpKNt3D4z2i8wrJQg1m/vqaGplgmHDWmTH8
   g==;
X-CSE-ConnectionGUID: V92y62oHRgW1lO/wI+S5BA==
X-CSE-MsgGUID: /46TWscRT56XZ7gYAJs5UQ==
X-IPAS-Result: =?us-ascii?q?A0D5AgBQf3Bp/9VK/pBagQklgSuBPQEwUwcPbwKBIUkDi?=
 =?us-ascii?q?CADhSyIeQOeGoF/DwEBAQ0CLgEOFAQBAYUHAo0BAiY0CQ4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4YVCDIBDIZaAQEBAQMBEWcQAgEIE?=
 =?us-ascii?q?QQBASgHJwoUCQgCBA4FCBqCYYIdFkADAQIOolUBgUACiit4gTSBAeAhAQsUA?=
 =?us-ascii?q?QWBM4UDOIJ9GgEBBSVJa4JagR40HYRAJxsbgXKBV4I3MT6CYQQBF4EdKzQIE?=
 =?us-ascii?q?INHgi8EgiJ6FB2TalJyIgMmMywBVRMXCwcFgSNDAyovLSMPPAUtHYEjIR0XE?=
 =?us-ascii?q?x9YGwcFEyNTBhsGHBICAwECAjpTDIF1AgIEghB7ggEPhwWBAAUubxoOIgIsF?=
 =?us-ascii?q?WsDC209NxQbAwSBNQWOG1tFgi4BgQ0rASItCyEWD4ESk0ePP45flRcKKIN0i?=
 =?us-ascii?q?niBJo0+iDIXhASBV6UQmQYigjaLMZVgIIUNAgQCBAUCEAEBBoFSFjwrG4ETc?=
 =?us-ascii?q?BU7gmcJSRkPh36GYYIdhjjCUXgCARApAgcBCgEBAwmRaoF9AQE?=
IronPort-PHdr: A9a23:UUV/vxUIa4inlewH8WgGBK4yb/vV8K3PAWYlg6HPw5pUeailupP6M
 1OaubNmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:m0PY7avT910lXiipkZR6ExemWefnVApfMUV32f8akzHdYApBsoF/q
 tZmKTiCb/aINjH1fot1bom/9E9TvpKExtMxTQY4qixjQSsQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYTdJ5xYuajhKs/vZ8Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwxLctED8U8
 twiJw9UajfEmMP1+++RY7w57igjBJGD0II3s3x6iDWcBvE8TNWaGePB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYwx/5JEWxI9EglH/fiFAoU69rqss6G+Vxwt0uFToGIaPIYfbGpUL9qqej
 iWaoVjGGRogCIHB+Qja/UOFpPSSoBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dwfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:hK3xv6w8VyLSDomTi4dKKrPxaugkLtp133Aq2lEZdPULSL36qy
 n+ppQmPEHP6Qr5AEtQ5+xoWJPtfZvdnaQFh7X5To3SLTUO2VHYYr2KgrGSuQEIdxeOktK1kJ
 0QDJSWa+eATGSS7/yKnTVQeuxIqLLogcLY4Ns2jU0dMT2CAJsQljuRfzzraXGeMzM2fabReq
 DsgfavjgDQCkg/X4CQPFVAde7FoNHAiZLhZjA7JzNP0mOzpALtwoTXVzyD0Dkjcx4n+9ofGG
 7+/DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijsohzAXvUjZ5Sy+BQO5M2/4lcjl9
 fB5z06Od5o1n/Xdmap5TPwxgjb1io04XOK8y7bvZKjm729eNsJMbsHuWtrSGqe16PmhqAk7E
 t/5RPci3OQN2KZoM2y3amSa/ggrDvFnZNrq59gs5UYa/pfVFeUxrZvoX+81/w7bXjHAIxLKp
 gaMOjMoPlRal+UdHbfoy1mx8GtRG06GlOcTlEFodH96UkaoJlV9TpS+CUkpAZLyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZQ2PLtBJB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8Wo/YVjnB8GC1IBCthrNXGK+VzLwzdw23ek0hpTsAL7wdSGTQlEnlMWt5/0ZH83AQv
 62fIlbBvfyRFGeUbqhHzeOEqW6BUNuJvH94OxLL25mivi7XbHXig==
X-Talos-CUID: 9a23:3L1SImEVj9gJ6ptfqmJZpRQFRJoiUkfS8y7UBAinKCVSFZe8HAo=
X-Talos-MUID: 9a23:tBihWAhx9ZKbu4T5cNd++8Mpc5s235u1A3oxzMs2iZaLBAVSIGqgtWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jan 2026 07:30:30 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 9B4A818000ADC
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:30:29 +0000 (GMT)
X-CSE-ConnectionGUID: FKNVXA0FTxSrBAB6Iv7Teg==
X-CSE-MsgGUID: hIpyBlNaSmSBhC4g17WNeA==
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208,217";a="67244337"
Received: from mail-byapr08cu00306.outbound.protection.outlook.com (HELO BYAPR08CU003.outbound.protection.outlook.com) ([40.93.1.110])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jan 2026 07:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFuqhwhPHX0WaWoCQQZewCNM4210MC8jWlJTRFSveN+jQw1fkMcN54JuG/QHicsgAXP2abxF9yUIzaJb6oB9RdnX2NWU2E7cfpwenfDftyfHQsVivh5Kad5DYRv44k5YhXz3F7HIlO8Rw1NVDobkSgqZ1wg9JurRvkODtk7arM4UnOUnbrDjyH3bO4t1+LGDC3dHFOM6AsBOAE/Bl3zfKa7m/14inJ+vF2RV8GMeeGQao64abICilliarQNpty1kWopsPzHjPOebo9MHDhaaoHmCAujUO40uk/ZcTVgjQ5ha4yKGDNi2UDYUBQYSrDbcoT0hebiXWfmKn6EuJ29bvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ80yfvD2Q76f+lKETcFEWB2JQKTbhNQYmWjmvJ2hT8=;
 b=IP/V6tFSytte7v6KIwQipkIYM1hTQ9kFK2MKGnhL37BV7JjDacDtx8+U+hTxFc3Xjsy/nBajMg+4TkyQ56/Anp5vVop+6NlV59ozHRtVuX2YKwjjM/mw2njPFP4UvzyFM5FNjPZAK+DI2By9qc1ZsOhnGeJegZUBRHJzUVlQmgyhq34zBGzKWvSM+xe342fg84S+oYN67gldbY6FQlMFpjg5wX+dDDoFWSX2kwRLGp0YoApm7CLFldo75bMuhQH8zH/5QMheHIKPFiyj57gm1o9Tk9q4XSCgZZ7jsDXPLpzLErIzQ3OEoVJg8LGrR52XxclZuHzGhekw4YEBjdw2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16)
 by BN9PR11MB5321.namprd11.prod.outlook.com (2603:10b6:408:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 21 Jan
 2026 07:30:25 +0000
Received: from DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::f6a0:8764:5448:20be]) by DS0PR11MB7405.namprd11.prod.outlook.com
 ([fe80::f6a0:8764:5448:20be%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 07:30:25 +0000
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<hetpat@cisco.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] Fix CVE CVSS scoring to use maximum
 score from all sources
Thread-Topic: [OE-core] [scarthgap] [PATCH] Fix CVE CVSS scoring to use
 maximum score from all sources
Thread-Index: AQHchFt4WO/OLNc5b0+8J3rzzOn3G7VUncgAgAeoNPA=
Date: Wed, 21 Jan 2026 07:30:24 +0000
Message-ID: 
 <DS0PR11MB74058D1A2E3E3A611DD9AE4EDC96A@DS0PR11MB7405.namprd11.prod.outlook.com>
References: <20260113070840.115911-1-hetpat@cisco.com>
 <CAMSfU+5u5Th9njzGNjCbx5kuiaspf_27FcocZnpq3OxDyyse2g@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+5u5Th9njzGNjCbx5kuiaspf_27FcocZnpq3OxDyyse2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7405:EE_|BN9PR11MB5321:EE_
x-ms-office365-filtering-correlation-id: 5cf01f65-cc6a-4227-6565-08de58bef165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?M+MBUH80dSQsVmHpWcEfw+UMo/0d69wdk3eVttNvYkebcmBHR0MEgyJ9?=
 =?Windows-1252?Q?2X7NYseu7y7l1WW8+6Sn7rTT+hd/jeOD7i/Ft+bAnvVWBhafvajIh3Q6?=
 =?Windows-1252?Q?gi78PGFlFSyVtRjH5i4aGARty8pws9kup0c/ShFUwLlkTIsLxdoB5v64?=
 =?Windows-1252?Q?iy1oqkji5FHP4oD1t3MGa/GpJteuHcwnEEEyQsZhdl4y8p+oclyUoYVn?=
 =?Windows-1252?Q?HSz/TIjpup7hCXeXVQGF+j5V+ZDbBFiOGv4Vtg5dbfjk65msUbXAvJNs?=
 =?Windows-1252?Q?FQjEajdHpJ67cwpoTwuwS84Clt1/IcJbJC5P9oBDjGTChSIzVIy5J9co?=
 =?Windows-1252?Q?G0wumU3Hibhwe3nr5ZsDarzBoD45f6mdSok7jojXxvEH3CVaRghEXD4A?=
 =?Windows-1252?Q?JqUgYOPFhLWazrm90HqUh384lM0qBTCY+UZPydgX681yJ6MGi7jQbNhY?=
 =?Windows-1252?Q?u2GOp/A5yFvTfkK2RNXN03MVjXgZ5nYJTR0377KNP1jut5E5f+adchaU?=
 =?Windows-1252?Q?1uNtGbvq/Dj6kSOdShcZvHFRAzCBP+eYoW9ZVwcSdGS6GTc3ArlpYoqq?=
 =?Windows-1252?Q?jcogmRYjCko8e776UJpOE6QAOdAj3S41EFKofTWeBvplBbYavJa9HuU2?=
 =?Windows-1252?Q?ALjsOSK77P9A6zIbmRAVsmrjx56+/rC3DFgZZ5nYtvB8RF/yFNKx8Kgy?=
 =?Windows-1252?Q?gt5nHd2Dyqz+PbM7MVn5lSN2lwpWAojVWpx7j+//HQlgJBbbriKrgJCn?=
 =?Windows-1252?Q?uZczxx18seiNE/pt6LADO6cgQTyvM3BUl38ZTbUXPpFwU8VDDwh6LEpE?=
 =?Windows-1252?Q?NJUEJ7bE2pcJGZWobW3087cxYZfg4Ftz/3TIS2Q70EoylteNeVxdwnMc?=
 =?Windows-1252?Q?qLgoL0b0X7GrT133sCYpJSPBw3UP4eWNP2SMPPjYkataDcKYeD5PqEDI?=
 =?Windows-1252?Q?Pp59R2y9oFbKLXRHNzHdhD+TuZ0JwWUVB86oeJyG8+gFldZwkSu629+S?=
 =?Windows-1252?Q?/2ETziB3WdrWI66QJvQQsl1PRE7CT7SuQpUfkSZQWGY9SzoAYDo5v96x?=
 =?Windows-1252?Q?+b8hvKuK/5oPa6+iHpWgBXOWp+JO2h/fWnn4KgOYYANoRTA4L56ntHRz?=
 =?Windows-1252?Q?a0PmxrYwaEL91G1Tt7MkIfEncQ/qRM0HKyhGpvMlLSenso0OA10lxfVR?=
 =?Windows-1252?Q?BErTzIHS/CM7Ayb827PtwR6NRxKXMaUX0i1OOWD5gN2TZZZ+3//1m6ZK?=
 =?Windows-1252?Q?2X3JftKq8fL6u7l4jRq7309Ixlcs+khSh/VFBUnMIlQ6ighmzYD/u2bW?=
 =?Windows-1252?Q?VU9mCk3vJXzkTMd0ZFiGgna3GusuORVeiM6sIMoCORPg8dFRZm0QcBdP?=
 =?Windows-1252?Q?4gQbG7pWgUzbiNUVOTBZVdMEnKOPvyviwmsVh3T45himJbTyXIX6AVyC?=
 =?Windows-1252?Q?PbNc1YqIi6mChcsLpOcvFToKkXx2EpXhFZwDP/YwYkXw4svbb1gBt8Z1?=
 =?Windows-1252?Q?8ZTbsC0zY94ps13RuqgMHnsNpBBZWxRJRIPuHJNhG2hDVGy9fztpffp0?=
 =?Windows-1252?Q?eg4w413YJR6Smgflvqgmy1D65Q54YGWLiiY+oiNj0YY8btE5ChMerVEl?=
 =?Windows-1252?Q?BfdeLpp1r8+j7lO7ZLppymWjwORVLuGNKJmjrB3azExa6LQzIxIdPpx4?=
 =?Windows-1252?Q?vUmiVUTQAQ8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?gJMkCV1ly6SJbMwbuqRH5rXKNC2T+y5AkUR7bZiJd3HVhplRpoiKwxYe?=
 =?Windows-1252?Q?ZfqRnj6R+px8hgzF1gtY/noOJA1ygVAyD2VmLAEhWgMF7qGmlfUITqSJ?=
 =?Windows-1252?Q?8UVBaj36qV7FLaiv7BlDSvKoc2FnJiahvCy/oVDMjBf4xWDCWc3zHZON?=
 =?Windows-1252?Q?znVgzYDM+UA3tuYeDCmm8zEdKYpyW5j03BfoARjODYCo+jz0IWMw5Zw5?=
 =?Windows-1252?Q?o/h0r7fK3/wFgtY/QquzbuE8gfPhSu3y4kWe2Bb6SxJJiSTa6GmA/xxy?=
 =?Windows-1252?Q?/4VVsgvGp40jKppFD0EouXSiU7t+Hxd7QkwlGEd6EH2igVocqOf3ZUGm?=
 =?Windows-1252?Q?7a+mhUWspV/Lrq6RX05JsMEMPgJTrsetydMMkz+C1ZSuG3gYbdWlPlvk?=
 =?Windows-1252?Q?Oi0KryINz7O7udwgiKozW4IUrcojNogTRkgkl/MTGUSEhWlgSlJrQ9Lg?=
 =?Windows-1252?Q?teuMUk3WR01IH6lSMjGBoHZYOSdW5SamrluN8NGSn+Nl6DejOPrwybnY?=
 =?Windows-1252?Q?zXO9otLBG5oS0MhVvlxO4d1h6/EKSH9+15648zxpeIhLQINO4n9QOs1t?=
 =?Windows-1252?Q?vDc6LlRap5/cmxD2OkaBOPMo4dVkC7LRnDzAeGmzSSZOaVU06x+D8UZ3?=
 =?Windows-1252?Q?BsEihnhGN5jQXCOVya2cZkrTOWp8nNQBOErm4YN1l0Vg1FbRviuugSWP?=
 =?Windows-1252?Q?FdSQOv0OkXigOwcJ1iblQcUTGkTD/e2WcSnxaID5vQEKaFJC0Qb+q3rO?=
 =?Windows-1252?Q?W5l8yKR06Sj/WjRfXmmPCF6HNrDt+ILRN0A5zTHw0mgLuJM7iSddiVNV?=
 =?Windows-1252?Q?wxIk9LNvysqsxpHWUW7PlGD+7iIgyP+59k1U3Eh7c/3sWW5Z6tKMQ1nB?=
 =?Windows-1252?Q?PQ0v9aFzLQd9Psuz1RUp2pvYCk7PhxZO+GaKJGLtJ9OM73tu+IW13JM8?=
 =?Windows-1252?Q?5tcyQGFJ9s0wpufY2CkNIOdXpN4FqN2ju+05gwqMPNVE8VXckb75S7CS?=
 =?Windows-1252?Q?nOKdAN4hts1dyBO/SR+5x0UVnLdW43wqR0wn6m2WSTqHjKoKeUp3B5g8?=
 =?Windows-1252?Q?8LzixZEIQDJ3sJYsMNGOC9ekxTBlEbndApNCXznZADoU4R753u2XQ+2b?=
 =?Windows-1252?Q?5JsuQHlYaYKSWRYhwCI+odoXnKabR7bDFP9Im78rpHfc7JCSGSt6RfdA?=
 =?Windows-1252?Q?eQ2fkDicHXkCls0c1xFT6AUtNBW6B7EH/xhePHW7yNMMLvvgER8x+o9M?=
 =?Windows-1252?Q?3Q3/BfG+wBSvnzJQbV6YRpX73ZiOsMsCaxCt0GSyEGBMBKX2rpp7JRwY?=
 =?Windows-1252?Q?E57DF0k8yglohhhlMYI/67uOESbWF5iSfrWxNvj3FLMBxo/6KGcn4apd?=
 =?Windows-1252?Q?Nl6t6tTUAmIwibgxvKViQMSzk6u+hQq8Pee9NRbCjclXIaheLTg+reT+?=
 =?Windows-1252?Q?tuVwNICXLuGGrnXVDaxMXsCGfblOsBWF8S1fs7J3hO05Ip5pv2LbOYCg?=
 =?Windows-1252?Q?sE7ZK4YdwR5vUyTHsVSRvGAxblrHU9l+5a1DRKIkdqmLlkvaNyva290l?=
 =?Windows-1252?Q?YZjVYPr9K9MNf+rAgf3M4KzYnMM+9h150/gh+oaw6+gfw0gKt7P2Toc4?=
 =?Windows-1252?Q?II2B25IVg1BfMO5KbolscO0QHhMkwS/XbVLM+bVQ727Hj83cOZyRuywk?=
 =?Windows-1252?Q?NIpJGtPR3QD6o9nhgdk43Fb1mg4weJWibpsFX/FtlEAoa+xc9cF8d0cw?=
 =?Windows-1252?Q?xCy3lq4w+DLG6TEDVN+A1oSnlzDAEfiqmg/mM5G90NPXiFqR5hslQc4V?=
 =?Windows-1252?Q?MWEt/+b0Z4zb8ItEbN4Vlt6MCzx4p6hyejqtiu3bx4QumtRj?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB74058D1A2E3E3A611DD9AE4EDC96ADS0PR11MB7405namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf01f65-cc6a-4227-6565-08de58bef165
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 07:30:24.9803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3To4gRvb58rhXvFTYyT/bfF0HCJMee3bcsQuhSbonIlZ99NkxPgX1x3oOkeS3MTeSAKw9Di/OdgQwhYMTLqgBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5321
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229794

--_000_DS0PR11MB74058D1A2E3E3A611DD9AE4EDC96ADS0PR11MB7405namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Yes, this patch directly addresses Bug 15931 (CVE Reporting wrong CVSSv3 sc=
ore). The bug reports two issues:


  1.
The code only extracted the first element [0] from the CVSS metrics arrays,=
 which could be a Secondary source with a lower score instead of the Primar=
y source
  2.
The cvssv3 =3D cvssv3 or ... logic meant v3.0 scores took precedence over v=
3.1 scores

This patch fixes both by iterating through all metric entries and selecting=
 the maximum score.

I will send this patch to the master first. Once merged, I'll submit a back=
port request to the stable branches.

Thanks,
Het
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Friday, January 16, 2026 4:01 PM
To: Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) <hetpat@ci=
sco.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; xe-linux-external(mailer list) <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] Fix CVE CVSS scoring to use maxi=
mum score from all sources



Le mar. 13 janv. 2026 =E0 08:08, Het Patel via lists.openembedded.org<http:=
//lists.openembedded.org> <hetpat=3Dcisco.com@lists.openembedded.org<mailto=
:cisco.com@lists.openembedded.org>> a =E9crit :
From: Het Patel <hetpat@cisco.com<mailto:hetpat@cisco.com>>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
source with a lower score instead of the Primary source with the
actual severity score.

This fix takes maximum CVSS score.

Hello,

Does this patch interact with the open bug 15931 =96 CVE Reporting wrong CV=
SSv3 score (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15931) ?

Also, does this need to be fixed on master and/or whinlatter?
If yes, you should first send this patch (adapted most likely) to master. T=
hen, once merged, send a backport request to the stable branches.

Thanks!


Signed-off-by: Het Patel <hetpat@cisco.com<mailto:hetpat@cisco.com>>
---
 .../meta/cve-update-nvd2-native.bb<http://cve-update-nvd2-native.bb>      =
      | 55 +++++++++++++------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb<http://cve-up=
date-nvd2-native.bb> b/meta/recipes-core/meta/cve-update-nvd2-native.bb<htt=
p://cve-update-nvd2-native.bb>
index 945bd1d927..28d5810d5d 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb<http://cve-update-nv=
d2-native.bb>
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb<http://cve-update-nv=
d2-native.bb>
@@ -352,32 +352,55 @@ def update_db(conn, elt):
         if desc['lang'] =3D=3D 'en':
             cveDesc =3D desc['value']
     date =3D elt['cve']['lastModified']
+
+    # Extract maximum CVSS scores from all sources (Primary and Secondary)
+    cvssv2 =3D 0.0
     try:
-        accessVector =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssDat=
a']['accessVector']
-        vectorString =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssDat=
a']['vectorString']
-        cvssv2 =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['b=
aseScore']
+        # Iterate through all cvssMetricV2 entries and find the maximum sc=
ore
+        for metric in elt['cve']['metrics']['cvssMetricV2']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv2:
+                cvssv2 =3D score
+                accessVector =3D metric['cvssData']['accessVector']
+                vectorString =3D metric['cvssData']['vectorString']
     except KeyError:
-        cvssv2 =3D 0.0
-    cvssv3 =3D None
+        pass
+
+    cvssv3 =3D 0.0
     try:
-        accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V30'][0]['cvssData']['attackVector']
-        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V30'][0]['cvssData']['vectorString']
-        cvssv3 =3D elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['=
baseScore']
+        # Iterate through all cvssMetricV30 entries and find the maximum s=
core
+        for metric in elt['cve']['metrics']['cvssMetricV30']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 =3D score
+                accessVector =3D accessVector or metric['cvssData']['attac=
kVector']
+                vectorString =3D vectorString or metric['cvssData']['vecto=
rString']
     except KeyError:
         pass
+
     try:
-        accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V31'][0]['cvssData']['attackVector']
-        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V31'][0]['cvssData']['vectorString']
-        cvssv3 =3D cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cv=
ssData']['baseScore']
+        # Iterate through all cvssMetricV31 entries and find the maximum s=
core
+        for metric in elt['cve']['metrics']['cvssMetricV31']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 =3D score
+                accessVector =3D accessVector or metric['cvssData']['attac=
kVector']
+                vectorString =3D vectorString or metric['cvssData']['vecto=
rString']
     except KeyError:
         pass
-    cvssv3 =3D cvssv3 or 0.0
+
+    cvssv4 =3D 0.0
     try:
-        accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V40'][0]['cvssData']['attackVector']
-        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V40'][0]['cvssData']['vectorString']
-        cvssv4 =3D elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['=
baseScore']
+        # Iterate through all cvssMetricV40 entries and find the maximum s=
core
+        for metric in elt['cve']['metrics']['cvssMetricV40']:
+            score =3D metric['cvssData']['baseScore']
+            if score > cvssv4:
+                cvssv4 =3D score
+                accessVector =3D accessVector or metric['cvssData']['attac=
kVector']
+                vectorString =3D vectorString or metric['cvssData']['vecto=
rString']
     except KeyError:
-        cvssv4 =3D 0.0
+        pass
+
     accessVector =3D accessVector or "UNKNOWN"
     vectorString =3D vectorString or "UNKNOWN"






--
Yoann Congal
Smile ECS

--_000_DS0PR11MB74058D1A2E3E3A611DD9AE4EDC96ADS0PR11MB7405namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes, this patch directly addresses Bug 15931 (CVE Reporting wrong CVSSv3 sc=
ore). The bug reports two issues:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<ol style=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: decimal;=
" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" start=3D=
"1">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">The code only extracted=
 the first element
<span style=3D"color: rgb(12, 100, 192);">[0] </span>from the CVSS metrics =
arrays, which could be a Secondary source with a lower score instead of the=
 Primary source</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation" class=3D"elementToProof">The <span style=3D"colo=
r: rgb(12, 100, 192);">
cvssv3 =3D cvssv3 or ... </span>logic meant v3.0 scores took precedence ove=
r v3.1 scores</div>
</li></ol>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
This patch fixes both by iterating through all metric entries and selecting=
 the maximum score.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will send this patch to the master first. Once merged, I'll submit a back=
port request to the stable branches.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Het</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, January 16, 2026 4:01 PM<br>
<b>To:</b> Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt=
;hetpat@cisco.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; xe-linux-external(mailer list) &lt;xe-linux-exte=
rnal@cisco.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap] [PATCH] Fix CVE CVSS scoring to u=
se maximum score from all sources</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div dir=3D"ltr"><br>
</div>
<br>
<div class=3D"x_gmail_quote x_gmail_quote_container">
<div dir=3D"ltr" class=3D"x_gmail_attr">Le&nbsp;mar. 13 janv. 2026 =E0&nbsp=
;08:08, Het Patel via <a href=3D"http://lists.openembedded.org">
lists.openembedded.org</a> &lt;hetpat=3D<a href=3D"mailto:cisco.com@lists.o=
penembedded.org">cisco.com@lists.openembedded.org</a>&gt; a =E9crit&nbsp;:<=
br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
From: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com" target=3D"_blank">h=
etpat@cisco.com</a>&gt;<br>
<br>
The CVE check system was incorrectly reporting lower CVSS scores when<br>
multiple scoring sources were available in the NVD database. This<br>
occurred because the code only extracted the first element from the<br>
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary<br>
source with a lower score instead of the Primary source with the<br>
actual severity score.<br>
<br>
This fix takes maximum CVSS score.<br>
</blockquote>
<div><br>
</div>
<div>Hello,</div>
<div><br>
</div>
<div>Does this patch interact with the open bug 15931 =96 CVE Reporting wro=
ng CVSSv3 score (<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?=
id=3D15931">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15931</a>) =
?</div>
<div><br>
</div>
<div>Also, does this need to be fixed on master and/or whinlatter?</div>
<div>If yes, you should first send this patch (adapted most likely) to mast=
er. Then, once merged, send a backport request to the stable branches.</div=
>
<div><br>
</div>
<div>Thanks!</div>
<div>&nbsp;</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<br>
Signed-off-by: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com" target=3D"=
_blank">hetpat@cisco.com</a>&gt;<br>
---<br>
&nbsp;.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"noreferr=
er" target=3D"_blank">cve-update-nvd2-native.bb</a>&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; | 55 +++++++++++++------<br>
&nbsp;1 file changed, 39 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> b/=
meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
index 945bd1d927..28d5810d5d 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -352,32 +352,55 @@ def update_db(conn, elt):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if desc['lang'] =3D=3D 'en':<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cveDesc =3D desc['value']<b=
r>
&nbsp; &nbsp; &nbsp;date =3D elt['cve']['lastModified']<br>
+<br>
+&nbsp; &nbsp; # Extract maximum CVSS scores from all sources (Primary and =
Secondary)<br>
+&nbsp; &nbsp; cvssv2 =3D 0.0<br>
&nbsp; &nbsp; &nbsp;try:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D elt['cve']['metrics']['cvssMe=
tricV2'][0]['cvssData']['accessVector']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D elt['cve']['metrics']['cvssMe=
tricV2'][0]['cvssData']['vectorString']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cvssv2 =3D elt['cve']['metrics']['cvssMetricV2=
'][0]['cvssData']['baseScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; # Iterate through all cvssMetricV2 entries and=
 find the maximum score<br>
+&nbsp; &nbsp; &nbsp; &nbsp; for metric in elt['cve']['metrics']['cvssMetri=
cV2']:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; score =3D metric['cvssData']['ba=
seScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if score &gt; cvssv2:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cvssv2 =3D score<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D m=
etric['cvssData']['accessVector']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D m=
etric['cvssData']['vectorString']<br>
&nbsp; &nbsp; &nbsp;except KeyError:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cvssv2 =3D 0.0<br>
-&nbsp; &nbsp; cvssv3 =3D None<br>
+&nbsp; &nbsp; &nbsp; &nbsp; pass<br>
+<br>
+&nbsp; &nbsp; cvssv3 =3D 0.0<br>
&nbsp; &nbsp; &nbsp;try:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D accessVector or elt['cve']['m=
etrics']['cvssMetricV30'][0]['cvssData']['attackVector']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D vectorString or elt['cve']['m=
etrics']['cvssMetricV30'][0]['cvssData']['vectorString']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cvssv3 =3D elt['cve']['metrics']['cvssMetricV3=
0'][0]['cvssData']['baseScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; # Iterate through all cvssMetricV30 entries an=
d find the maximum score<br>
+&nbsp; &nbsp; &nbsp; &nbsp; for metric in elt['cve']['metrics']['cvssMetri=
cV30']:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; score =3D metric['cvssData']['ba=
seScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if score &gt; cvssv3:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cvssv3 =3D score<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D a=
ccessVector or metric['cvssData']['attackVector']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D v=
ectorString or metric['cvssData']['vectorString']<br>
&nbsp; &nbsp; &nbsp;except KeyError:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pass<br>
+<br>
&nbsp; &nbsp; &nbsp;try:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D accessVector or elt['cve']['m=
etrics']['cvssMetricV31'][0]['cvssData']['attackVector']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D vectorString or elt['cve']['m=
etrics']['cvssMetricV31'][0]['cvssData']['vectorString']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cvssv3 =3D cvssv3 or elt['cve']['metrics']['cv=
ssMetricV31'][0]['cvssData']['baseScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; # Iterate through all cvssMetricV31 entries an=
d find the maximum score<br>
+&nbsp; &nbsp; &nbsp; &nbsp; for metric in elt['cve']['metrics']['cvssMetri=
cV31']:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; score =3D metric['cvssData']['ba=
seScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if score &gt; cvssv3:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cvssv3 =3D score<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D a=
ccessVector or metric['cvssData']['attackVector']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D v=
ectorString or metric['cvssData']['vectorString']<br>
&nbsp; &nbsp; &nbsp;except KeyError:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pass<br>
-&nbsp; &nbsp; cvssv3 =3D cvssv3 or 0.0<br>
+<br>
+&nbsp; &nbsp; cvssv4 =3D 0.0<br>
&nbsp; &nbsp; &nbsp;try:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D accessVector or elt['cve']['m=
etrics']['cvssMetricV40'][0]['cvssData']['attackVector']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D vectorString or elt['cve']['m=
etrics']['cvssMetricV40'][0]['cvssData']['vectorString']<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cvssv4 =3D elt['cve']['metrics']['cvssMetricV4=
0'][0]['cvssData']['baseScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; # Iterate through all cvssMetricV40 entries an=
d find the maximum score<br>
+&nbsp; &nbsp; &nbsp; &nbsp; for metric in elt['cve']['metrics']['cvssMetri=
cV40']:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; score =3D metric['cvssData']['ba=
seScore']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if score &gt; cvssv4:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cvssv4 =3D score<b=
r>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; accessVector =3D a=
ccessVector or metric['cvssData']['attackVector']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vectorString =3D v=
ectorString or metric['cvssData']['vectorString']<br>
&nbsp; &nbsp; &nbsp;except KeyError:<br>
-&nbsp; &nbsp; &nbsp; &nbsp; cvssv4 =3D 0.0<br>
+&nbsp; &nbsp; &nbsp; &nbsp; pass<br>
+<br>
&nbsp; &nbsp; &nbsp;accessVector =3D accessVector or &quot;UNKNOWN&quot;<br=
>
&nbsp; &nbsp; &nbsp;vectorString =3D vectorString or &quot;UNKNOWN&quot;<br=
>
<br>
<br>
<br>
<br>
</blockquote>
</div>
<div><br clear=3D"all">
</div>
<br>
<span class=3D"x_gmail_signature_prefix">-- </span><br>
<div dir=3D"ltr" class=3D"x_gmail_signature">
<div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font>
<div><font face=3D"Raleway, regular">Smile ECS</font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DS0PR11MB74058D1A2E3E3A611DD9AE4EDC96ADS0PR11MB7405namp_--

