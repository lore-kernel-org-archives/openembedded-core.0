Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7090FC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:42:38 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7074.1784547754120418355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H4dnbfuu;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8405; q=dns/txt;
  s=iport01; t=1784547754; x=1785757354;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=iBMySP1qkXrx1d2gEJLOdXusj33DHx4aqZ/rK2k2hS0=;
  b=H4dnbfuu4W/Zi7vxz3n6/2w3n4OlwiTiB3+b/RCydiVSp/QWj770s5m1
   OUuhM6heGCIJdP9Y4kgJbSnDAEo35yZ0qbddH2HuLdyJaJ4dLN/hMInDn
   JFqzER8r8Y6/u4hiRysnbtLxf97cTZV9f/2xNW2fwNK/j3CHlhjH2d7TW
   aw5x9dEkFis28H8KF3l5rEpac9B5PWU+NhuJ8i7KjyvM0ecu0ddiaqvJi
   s9DSA+KmNASCm1lKsw64vvrBEXKXjjduas05TiY5Gvj1iXbyMn/zWJONZ
   nHJtZp44ZrqiWWrk/+hTnARoaq0jBozEbYhtGITsRgp+AMP7DGh5jSBuu
   g==;
X-CSE-ConnectionGUID: bW0Ycez2S0i0M0snuirc0g==
X-CSE-MsgGUID: rDbdU4a6QES20a1SBQ62Sw==
X-IPAS-Result: =?us-ascii?q?A0BzAwDXCF5q/4r/Ja1aHgEBCxIMZYEgC4E9MVOBCAKBI?=
 =?us-ascii?q?UkDiCADhSuGWIIhA5dEhlcUgWAKDwEBAQ0BAS4BGwcEAQGFBQKNUwImNAkOA?=
 =?us-ascii?q?QIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBEXcCA?=
 =?us-ascii?q?QgRBAEBARUZJwodCAIEARIIGoJhgh0WQQMBAg4GsHsBgT0Ciip4gTSBAYNaB?=
 =?us-ascii?q?QkCAkAB3AoVgTiFP4MBGwEBBSVJbIJdgSIYAYR8JxsbgXKBFUKCaT6BBYFcA?=
 =?us-ascii?q?QMBgRYSAQsHASM9g1aCMASCInoSG4NagWGMEFJyIgMmMywBVRMXCwcFgSMQM?=
 =?us-ascii?q?wMgCi8tAhQNIg8aBS0dcAwnEg8dFxYeWBsHBRIgKkFFIwMUOz84C0MFgVcCg?=
 =?us-ascii?q?gVOIx8DOX+BL3VKdy1qAhAXSjgkghICgTsCBwMLbT03Bg4ZAwSBNQWMUAdbI?=
 =?us-ascii?q?4FNc2BRBgJPgR0nGQaTR49BgXyMZJNkgTMKKIN1inuBJo0+iDIXhVulEZkII?=
 =?us-ascii?q?41nlWCFLgIEAgQFAhABAQaBaDxpPx8KAQdwFYMiCQpAGQ+SI4F/gxTFOHkCA?=
 =?us-ascii?q?QMFAwItAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-PHdr: A9a23:WiSt0xS5cv+t5nxX17M4Cy9MT9pso47LVj580XJvo6hFfqLm+IztI
 wmGo/5sl1TOG47c7qEMh+nXtvX4UHcbqdaasX8EeYBRTRJNl8gMngIhDcLEQU32JfLndWo7S
 exJVURu+DewNk09JQ==
IronPort-Data: A9a23:KMbtkqt17e8ZkvBp+s6EawamWufnVA1fMUV32f8akzHdYApBsoF/q
 tZmKTyEPareNDCheohxbdu19E0Hv5XRzddjHAJpryA3EnkXgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3Z8Esy1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw8NkvMGpD5
 6YjcDFVS0iYgf+32rnjRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHSGZkJzx/E+
 Aoq+UzjLhsWCYCWlwOoySj0j7b0txqlArkNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YYLtcnr8QxAzct0
 zdlgu/UONCmi5XMIVq1/baPpjT0Mi8QRVLurwddJefZy7EPeL0Osy8=
IronPort-HdrOrdr: A9a23:GSrxmqgeN8zmBncp0XjHMX+0znBQX9N23DAbv31ZSRFFG/FwyP
 re/8jzhCWVtN9OYhAdcIi7Sda9qBPnmaKdkrNhQ4tKPTOW9FdAQ7sSlrcKrweQfxEWs9QtqZ
 uIEJIOR+EYb2IK9/oSiTPQe71Psbv3lZxAx92uskuFJjsaDZ2Imj0JcjpzZXcGPTWua6BJc6
 a0145snRblU3IRaciwG3kCWMb+h/CjrvjbSC9DLSQKrC2Vgx2VyJOSKXWl9yZbfyJEwL8k/2
 SAqArk+6Wlvci8zx/Xx0XT455VlNaJ8KoMOCWLsKcoAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6lvKF1vF4SfF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZ0Uw9p9txuZ
 g7nF5x9qAnTy8orh6No+QgZCsa0XZcZkBS19L7ukYvFLf2roUh9LD3snklSKvoVxiKmbzPWN
 MefP00oswmMG+yXjT+onRlxsCqUzAYGxeLRVVHh+muugImx0yQCyAjtZEidrBqzuNmd3FJit
 60QZhAhfVASNQbYrl6A/pEScyrCnbVSRaJK26KJ0/7fZt3cE4lhqSHqYnd3tvaMKAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79wh04eMCYbDIGmGUhQjgsGgq/IQDonSXO
 uyIotfB7vmIXH1EYhE0gXiU91ZKGUYUscSptEnMmj+6P7jO8nvrKjWYfzTLL3iHXItXX7+GG
 IKWHzpKMBJ/imQKwnFadjqKgTQk2DEjOZN+fLhjpouIaA2R/hxjjQ=
X-Talos-CUID: 9a23:poUdTG9zcTN+1Fc4C12Vv0QrQvEuf2+H9y/Re2rgEmB0SaeeEVDFrQ==
X-Talos-MUID: 9a23:lPveGwqE+XOq/pdfL6gezytOPstVv63wMW02y80P4vKuDHIqACjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:42:33 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 165B818000286
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:42:33 +0000 (GMT)
X-CSE-ConnectionGUID: VSDTxz5JQWmHh8B4t7G4ow==
X-CSE-MsgGUID: FEmTwhRHSteQyE3VpIGNnw==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="65207281"
Received: from mail-eastus2azon11010013.outbound.protection.outlook.com (HELO BN1PR04CU002.outbound.protection.outlook.com) ([52.101.56.13])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 11:42:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7U3bOANLzPgSmmGh07sMjfxhoeHFKiAQOZgdOfN+4JvWqUosCQ2v3h5/F+cEidf6axlohmgtIqNK7LBp3krYtF8zSawJBztm6b74dYl+2eN+aU5P/aTxyrMD8TpEFz9jivqe1dh63ExZnBotTMLYBV+k7MBOkYvtg47rxd5QFKxEPBD0uH8YCUYk0jX99QwxTB9vpNn3ckWEf/+AXeby/6xeZghhF9PZ4/QabF4DZPhViQNz9rTys3wDJFPW6ZlZxz8RSsZwmZ6YRPlqy2irA7mIzyCtkgWvGwR00s7bnFdZddMB3cRSzrxSArllQTrnP2WOTINdUGiAPj3spWRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBMySP1qkXrx1d2gEJLOdXusj33DHx4aqZ/rK2k2hS0=;
 b=CoNNEpRn0veZKvtQhyPRQ0IubxTtuYo/3n0PTTqSVvhraehDYDpWqEqQpnmI8I61DePhGSM3Zdh5MX15t7jVaMzCbM9BdbS8tRcN1LvaJ4fvHL6dEsTv03QyRcSwBwzY4BLZveaMgOP2mCxVcyuL9a/yx0swn5XdeBaiOHkeFryLY+djxzZSNAXxXYP+8AFpIiVQp/Pg9TtZJpHKUNc/FaJ8zIBtFhOZJKZU995SteKghVAAif/TdzvDB+rep9zBorDglo/ZiS/Kc0ZUvHirxqRPCWnKSyN7Rl6tDpEi1mbfuH3vW7R4S+rOiUi+3ZD/XlmvD2Fd59Y9PO3FTCHavQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 11:42:30 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 11:42:30 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832
Thread-Topic: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832
Thread-Index: AQHdGDm1qanBtRWfckmbKRcrN4jxfrZ2SOjj
Date: Mon, 20 Jul 2026 11:42:30 +0000
Message-ID: 
 <DM4PR11MB6189ABFEC40B6F64BB48462BC4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260720110548.2458865-1-deeratho@cisco.com>
 <DK3CWFWYP9UE.5WID74XZESIV@smile.fr>
In-Reply-To: <DK3CWFWYP9UE.5WID74XZESIV@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|DS4PPF2A0C3F85C:EE_
x-ms-office365-filtering-correlation-id: 3bb028b0-ab12-4d84-659f-08dee653fb6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|8096899003|11063799006|10067099003|4143699003|56012099006|13003099007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 XpVRznKhJVGk3WKaNjjdN65eg8gbH6Tv+fo8IJD7HfiXJ8vrc/6glia5a0nULWJd2JxEQ1IlhmuRMy/AGDSwJlMqEs2usvus3M1zix6BSG1diSWlKQK71o7cU2098HCb66l77pg+Qu4hscYCefpNpt/5f/oZcDqQ0iSl258u/4+FpAieRCYx1ghFByM8mTYZaSqZMBTCaafBfPyf4inGH1qLehotz1gtdykfzmjumfADprXfPIAHVHSZWtqucK275Uy96VunmA1oNp/ZvR7S7seTg/LqDPfu2siP0QM0OmPVp56E0jtpGuRuAbZUEQnnELOveMwUljv0bYE3pml9w5gve3jW0FJQIGmVDmpiczAKflljGRj4QCxIojaZdIvS4d95tVqs3xvICbYpLQbC1BemwQY+KLEYBf3WUJsNISTVyFNj/XPv647HgtY6EwpcMsY+UrPXnckZdyLkyO2UXXEGorFoJngYR5vqAAP24QFuNJX7RvMDSSb1nJNIKZEKrpUPW6SitJdOBSp9ITn5XLHiB1QwsE04Lb/N6SReypb8K0YsXCzWXd+AvAeiOSFX/LqAYSvfP2/IUsi9UFeocaqC6+5w8siubBL27DBMetdi52uMFaWpGC7GwRsUBLPnsZ9M4JESpy9K/5K9JvGXKpCHtqzLlPPtvCBqRzEXaM8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(8096899003)(11063799006)(10067099003)(4143699003)(56012099006)(13003099007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MVGq4Y+3l0kpZWUWGtbBguh9hHCkPoH21eEVxEEYsoOmbU8J8Zdz1Hz2DU?=
 =?iso-8859-1?Q?/kMfEPokeL6/Is1fJR/3bQT258HlMfop+fE7UuMu3Vht4E0JY2kEQ+iq8D?=
 =?iso-8859-1?Q?b/DFgJ7IJO5brG8uHUODtSluNOzVHg6B3i4B0qRwwL0OvX0dhvfEGkuJZ8?=
 =?iso-8859-1?Q?xH+4RY6+whl5qXS3u8v0l9bRMQ2HOGqr7c63sLRgidjuACrVcw45koRYer?=
 =?iso-8859-1?Q?J081+xjhi75WNofApYYUGu33i9IJNfvlTVX96u9cRqPL6ZaNDY4yqXcXkW?=
 =?iso-8859-1?Q?yHcvLjf2ErO7P0tQcp+1QKcbJRrmhSLhDNOP5rU6gLnk1bOoCAuSBPMZOD?=
 =?iso-8859-1?Q?/GXtH0nIJQtMgxWkXR/WaLkf7Qh2DdbaOdIyLsS3xHJ374QGMFrOrnRjR6?=
 =?iso-8859-1?Q?1DZJqf08IRvC9nEx9FA0neKmrFAW98VDz5vNKdZbP/OSvBpxpUd9E7k8Ux?=
 =?iso-8859-1?Q?L8seIbei+sP4+AIXsfC1coRnR+dEFSAp9Wl3xpV6DaJWFIgttvulSeNZFs?=
 =?iso-8859-1?Q?75UEgHIM2I54t4rvUVPTFns7DtrsaSGD1ANlQPgQ9XYfNl2ZcUyNjWKadv?=
 =?iso-8859-1?Q?YglxILDEFR/s1YkvxPM8S1PBemRK4nrH7xcwulEIWAog99EhBbB5owHtcU?=
 =?iso-8859-1?Q?HxIAufvNK7fN4eQGXsLWj24Ia+V1zTg8qAFEO3PjfnKXAmN1vT+UpBb+N5?=
 =?iso-8859-1?Q?R+qVkDkuf/o4oUzgKheshUcVEEuwNcfNH1YJOONjsFW/cVS79LIblxW0L8?=
 =?iso-8859-1?Q?4dTFLXcBm8pt2R8eqeSx+CIvN5LPQTmo8hsV4XKImmRuYCGFSKsVJJZik+?=
 =?iso-8859-1?Q?0D6lNx4K6UNiXEYrMYw1GAXom7OZmh4MsYFv6FM2DkzlkGy9MYGQF16IX2?=
 =?iso-8859-1?Q?c6BmSOoKuECSSTiF2Ii6cqRyUG/BhpHcRRcvkrRc5ig901W/FG0h4vb/c1?=
 =?iso-8859-1?Q?x7peevzHeRoGozgqGV1n0j5Y/6ViUNQQK/CcmZvwatOiiy6IpnT2h2ApCB?=
 =?iso-8859-1?Q?yPOjmnfomHp1cAkyCBx5ppt6wU8JlLfu0JwhVIrqvh83YdQuUqkZsb1cKd?=
 =?iso-8859-1?Q?CnBh2JmJIXzG8SSRgA7ygi5BO/iSnuxE9tnBKp43Keo3yhKYpD3jbT6Pkw?=
 =?iso-8859-1?Q?Q6crNoZIk66kDWiyATZZ768DZCUcSaXh2sPE60pglDtjnGS9vJWRObpiD5?=
 =?iso-8859-1?Q?eTlGBfPq/zhvc+4TYxt/oKjQFzdaT4MzATNTv+9aD8Cw//dGMf0hmlHEeC?=
 =?iso-8859-1?Q?KyBk7DPcfh8dxwic/1BbLbJZxxei0ILud/2sCjhjVSPnXZmxwat4DZT2la?=
 =?iso-8859-1?Q?PF0qoffcQKQIHONHcxFtqx7lGSYim9A6XdUteuC04StUSGA8c0o/vFz1fw?=
 =?iso-8859-1?Q?mEOol8hmuERrzIYXjY0I1e4th6kytiqtaqbiyKDm0MAGGocJaGTmALb3mt?=
 =?iso-8859-1?Q?iPDm/xuwvwcxek4GZB6eDuWWwZpNVAE19SNhNda5ch33hANOvOwQ+Gt498?=
 =?iso-8859-1?Q?cmUtjeOqw+80p3wzQ+70CAYPEWNPdC5Gf+KzJho1wBbToSkZ3U/3DtdoGw?=
 =?iso-8859-1?Q?mg+C1bsrQzaTPIIl0RcK67dja/IM6MM8lqsBw19xF9G58brPu3HF11G3n0?=
 =?iso-8859-1?Q?L0b6FHkc/kE4MhiHkRSzvPApNeoJY3jRMeyAuf3GM/qBxp8rtt1A0QMTWM?=
 =?iso-8859-1?Q?bJZJKdoqUTrcBZrBglxUNhfLOb3y1pCPc+TcasUX5LRZMAyRMtNhDDUu2j?=
 =?iso-8859-1?Q?G36WdAnSA0BsaDdl3QFKph02RvkeSbQz+CkvTGzDfun2mT?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189ABFEC40B6F64BB48462BC4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Zoq9loiqzHZ6uiLhBcX2dgSunbc8UeCEQFtUtEdFm1lz3tX/er5EQk8NypnQHm+02C5hhvYeRVNqozJQ7X6mHRtdct+s86hT6t5B0sC5M5wQYFnpKARlbJB1hWEUxYvZPf0KK6FBmeUrlG1Ct3bsMZ481qDS5s2LG6/XzhbolBkHSBmirg1rGx4T22gJJQeV6XMpqZrXVqUrWBQvjoR/PXMNQegG+RvXM1iBzqyw6huLTudxfMHkgtZCeJMT1xwzF+B4RCFwmGAGMALFO1jgL5ErA963yXJWodnrA44VPVyKWMt+PnVkP69bshSM2pEpK5qLNAO3gKBPMmT4vkCK7A==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb028b0-ab12-4d84-659f-08dee653fb6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 11:42:30.7742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkyFh0lks79WEI9MVWDCfpHlGkrIEEYCpzyaClWD7OelENfmmlZuAV6oUwRLkhwyon/MeccuRIwwwMEpDJh8LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241373

--_000_DM4PR11MB6189ABFEC40B6F64BB48462BC4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent v2 of this CVEs as below:

  1.
https://lists.openembedded.org/g/openembedded-core/topic/120357169
  2.
https://lists.openembedded.org/g/openembedded-core/topic/120357170

Thanks for your review.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, July 20, 2026 4:49 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832

On Mon Jul 20, 2026 at 1:05 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream fix [1] and test coverage [2], as
> referenced in [3], to address multi-record OCSP response handling where
> GnuTLS could check revocation status from the wrong OCSP entry.
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c14468=
33051e48670c2
> [2] https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2=
421ff35d37d2e
> [3] https://security-tracker.debian.org/tracker/CVE-2026-3832
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3832
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

All that series should be tagged v2 with a changelog where appropriate:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#tak=
ing-patch-review-into-account

Can you resend it with the v2 tag? You can use -v2 if you use git-send-emai=
l.

Adding these tags/changelog helps me a lot when tracking patch status.

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB6189ABFEC40B6F64BB48462BC4C32DM4PR11MB6189namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have sent v2 of this CVEs as below:</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://list=
s.openembedded.org/g/openembedded-core/topic/120357169">https://lists.opene=
mbedded.org/g/openembedded-core/topic/120357169</a></div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://lists.openembedded.org/g/open=
embedded-core/topic/120357170">https://lists.openembedded.org/g/openembedde=
d-core/topic/120357170</a></div>
</li></ol>
<div style=3D"margin-top: 0px; margin-bottom: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks for your review.</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"margin-top: 0px; margin-bottom: 0px;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Yoann Congal via lists.openembedde=
d.org &lt;yoann.congal=3Dsmile.fr@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 4:49 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832=
</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">On Mon Jul 20, 2026 at 1:05 PM CEST, Deepak=
 Rathore via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream fix [1] and test coverage [2], as<br>
&gt; referenced in [3], to address multi-record OCSP response handling wher=
e<br>
&gt; GnuTLS could check revocation status from the wrong OCSP entry.<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dc=
caf7d3b0c1446833051e48670c2" id=3D"OWA3744efac-2bcd-2f0f-896f-8c098fa26d65"=
 class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c1446833051e=
48670c2</a><br>
&gt; [2] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8=
c5d8e9a03334f2421ff35d37d2e" id=3D"OWA05ef0ac1-97cc-1057-739e-fd1662a74ef1"=
 class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2421ff3=
5d37d2e</a><br>
&gt; [3] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-38=
32" id=3D"OWA170785c0-ece1-843c-874f-f289cf1d57b6" class=3D"OWAAutoLink" da=
ta-auth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-3832</a><br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3832" id=3D"OWA2d=
2b615e-8d5c-b28e-c135-d3630a8baf46" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">
https://nvd.nist.gov/vuln/detail/CVE-2026-3832</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
All that series should be tagged v2 with a changelog where appropriate:<br>
<a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/submit-chang=
es.html#taking-patch-review-into-account" id=3D"OWA659118a3-dc58-5d03-0d8b-=
66986dd031b3" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">https://doc=
s.yoctoproject.org/dev/contributor-guide/submit-changes.html#taking-patch-r=
eview-into-account</a><br>
<br>
Can you resend it with the v2 tag? You can use -v2 if you use git-send-emai=
l.<br>
<br>
Adding these tags/changelog helps me a lot when tracking patch status.<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB6189ABFEC40B6F64BB48462BC4C32DM4PR11MB6189namp_--

