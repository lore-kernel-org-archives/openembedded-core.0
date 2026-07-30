Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F67EC531D0
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:14:36 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5055.1785388465579161730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=B+rpc1Rw;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13868; q=dns/txt;
  s=iport01; t=1785388465; x=1786598065;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=XstIPXNam9MBtQyyVw2TeL6b2wyk9KanWn5hjkcOIEY=;
  b=B+rpc1RwM6xIG+MowjItznmcUJDspruBfahsEKSj7knIhNzONWkIxuZi
   RmnRbv38Q3Jet8zqkztw4MTw+tcUkj/i0qLTRgrzF1kyyZ+iyGko+ZR+d
   A5u4ghk4MTnwKKofNiFcPR6zxK1w5F6QVdU68fID+y/ZkCnW4uXbekQyg
   qE3lScimKSH+J5Xxe4bs9fPLydz3rx9LUNhbZQO6B/aOCXmaFX6B737rZ
   sQr5jYG8OfQyQA+D+ufbsT5y0HuXti0sF9uFUB3bsj2JEX9zNEdrSPYmF
   1JPes/JbsJpDTnvF5sRl/Zz8RN2EfqSoukgBVzMQxH6Ger+H59+E1nh3t
   A==;
X-CSE-ConnectionGUID: m4h5LTpYToW1yipemYPbNQ==
X-CSE-MsgGUID: stHqghgITcGcfPS8BI56Zw==
X-IPAS-Result: =?us-ascii?q?A0A1BAAh3Wpq/4//Ja1agS6BK4E9MVOBCAKBIUmIIwOFK?=
 =?us-ascii?q?4h5A54bgXQKDwEBAQ0BAS4BFQ0EAQGFBQKNZgImNQgOAQIEAwIDAQEBAQEBA?=
 =?us-ascii?q?QEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBERVSEAIBCBEEAQEvJwodC?=
 =?us-ascii?q?AIEAQ0FCBqCYYIdFkEDAQIOsFMBgT0Ciip4gQEzgQHgNxWBOIU/gwEbAQEFJ?=
 =?us-ascii?q?Ulsgl2BIhgBhHwnGxuBcoFXgmk+gQWBXAQBgV88g1eCMASCInoSG4JWPo8AU?=
 =?us-ascii?q?nIiAyYzLAFVExcLBwWBIxAzAyovLSNLBS0dcAwnEg8dFxceWBsHBRIgKkFEI?=
 =?us-ascii?q?wNBMAtDBYFUAoF4PyMZNn+BL3VKdS1pAQIQF0o4GIM2AoJYAwttPTcGDhkDB?=
 =?us-ascii?q?IE1BY0EB1shglonfYIFLpNGj0GBfKF7CiiDdYp7gSaNPogyF4VbpRELmH0jj?=
 =?us-ascii?q?WeVYCGFDQIEAgQFAhABAQaBaQE6gVlwFYMiCUoZD5c2ySd5AgkyAQEHAgcOA?=
 =?us-ascii?q?wuBaJACLYFPAQE?=
IronPort-PHdr: A9a23:RLBY9B+9CJ314v9uWBDoyV9kXcBvk6//MghQ7YIolPcVNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8EqaQ==
IronPort-Data: A9a23:fLI5dKwBe6iihB8DmKB6t+dsxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 2NLUW/QM/iDYWWgKo1xbNm1o0NXuMCBydViHQVrrVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJERqPdA8xv5GPWZxr
 O0ZMD0IXyiJodvjldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaYSJIIPVGJg9ckCwv
 X7m5mv5DTAmP/OUxwK+oliN27H9gnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dwfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:IbjuN6o0Cq7viOe1Lyv4S8caV5srLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H/BEDhex/hHZ4c2/h2AV7QZniWhILIFvAs0WKM+UybJ8STzJ846U
 4kSdkANDSSNyk1sS+Z2njELz9I+rDum87Y55a6854ud3AXV0gK1XYBNu/vKDwMeOAwP+tAKH
 Pz3LshmxOQPV4sQoCQAH4DU+Lfp9vNuq7HTHc9bSIP2U2ltx/tzKT1PSS5834lPg9n8PMP4G
 LFmwv26uGZte2nyhjT7mnX755HstrswNlOCaW3+4kowzPX5TqAVcBEYfmvrTo1qOag5BIBi9
 /XuSotOMx19jf4Yny1iQGF4Xii7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBH1r
 5R1W7xjesUMfqAplW52zH7bWAsqqOGmwtlrQfVtQ0HbWIqUs4UkWXYxjIMLH5PJlOg1GltKp
 gfMCiV3ockTbrdVQGYgkBfhPqxQ380AhCKBmIGusCTznxquUoR9TpD+CTa9U1wqK7UjPJ/lr
 n52qgErsA9cuYGKa16H+sPWs2xFyjERg/NKnubJRD9GLgAIG+lke+83FwZ3pDjRHUz9up4pL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zOdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPymisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhEk8FunaPi66YPJKqiNT7krJ9Q7GkmjJl/WiE2g==
X-Talos-CUID: 9a23:ceNxZW/gDBAms4AiuvGVv0tIGp0BTmXs8HDvel65EWtseYWfb2bFrQ==
X-Talos-MUID: 9a23:dD575QqgBRdBRoNX4sIezyp+FN5n46uPNEsimps+gJmuFHEuCSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Jul 2026 05:14:03 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 86E1318000242
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:14:03 +0000 (GMT)
X-CSE-ConnectionGUID: agofszvzQ46tkvYQ9o76+A==
X-CSE-MsgGUID: VE+hrhBBRMKsf3FejNSU7w==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,193,1779148800"; 
   d="scan'208,217";a="75561829"
Received: from mail-eastusazon11012001.outbound.protection.outlook.com (HELO BL0PR03CU003.outbound.protection.outlook.com) ([52.101.53.1])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Jul 2026 05:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jph9e5tYTSxZMHb/wyT09x6dMBGMT8NDVWs7b5BP2WFs8jMzyIicWVrHvEgU2H9AMBQ4E29hfPYrhZXCejV23gQAoGDCFjE9yhrkM1YflmkzDiAJKmgkrTkpOkQ3CFqfCtqylo4eSIabV5v93JfQisltfst4ZEK5p0moCiwWwDAfku4s+RK1zAhP92SDCfR+DtfKUGkXI9+WjajSDXrynchs8Jo6v6j4hoOF4ACL1Vo7hq3+aAksqUWv7BTy1DOxYNgzgq6w2s5spfsLbh68lcFnZb2r8FlwMY5aLCv9uQt7CSCsbg0GIYOOYOy4ye28vafLjFkVi9UUq8BnIZcxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XstIPXNam9MBtQyyVw2TeL6b2wyk9KanWn5hjkcOIEY=;
 b=eXbsuxcjx/XCjAo30wwVTMLor8qs1PuzfGAagLagDDAlZ8k23N4zuHlU8XENudzTdq/UAZroMpmEa9rPxBt9lCIM+4I3hYsoBLk44OvQPNwit13oIP52/2BO12YZau8DPMS5rNBMr3Nr8kPV+jcRpGSQVZDHaza4VH1qIXTM/lhu3IxU61BIDjDhVB5YKmFdDojD427hnuPvvI4T6Uxh5+SC1vwVs6lrL5vyuD5vUKiAeiixfka83iI7xNXQIyYCTowBw8n+ESmEjf9aouzgmffcPA4B46RoLfUakr39dS8qgVgX+ymJBOOPw3b9B+ESyxCMXiKYak21o3iPPsGVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 05:14:01 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 05:14:01 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>, "sdoshi@mvista.com"
	<sdoshi@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2026-58015
Thread-Topic: [OE-core] [scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2026-58015
Thread-Index: AQHdHfGK9rPtkC0DV0CcyzInIorSa7aERjzG
Date: Thu, 30 Jul 2026 05:14:01 +0000
Message-ID: 
 <DM4PR11MB618954D1D6C87B7D8AD9F169C4CA2@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260715172330.1149253-6-deeratho@cisco.com>
 <20260727121444.3158996-1-deeratho@cisco.com>
 <1062711.1785175099253932186@lists.openembedded.org>
In-Reply-To: <1062711.1785175099253932186@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|MN2PR11MB4758:EE_
x-ms-office365-filtering-correlation-id: 2a10db92-b6be-407f-c058-08deedf95e0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|13003099007|6133799003|56012099006|4143699003|5023799004|11063799006|10067099003|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 ri3TGdJPxezhkFtRshIAzfzoifUQVDX6TSh2auoI5+jj5HMGn6mNsbJjQYC2tpkPbt4UU2h0U/97wOUm83sU+BJbwiukU93e9YeB1VKGLcWS1BaXvq2zuTdF71qxkmPUb3TgLvY75EduAYCnbzIevoS2cC4R/TG+tAOKX4Sdyq4eE0U9qeNvGeAWNB38W0gW/11WzHPOzYp3eVi6KZX2oK08k5jZeA9p94x9R9PbVpqMfomZ2G2PkQmO+9BvbOlnfq3FEziYMr5K5iT+CsSARYmcU7t8LJnkPF/js3rjM6NREfVp0z97gXWFVLytuFfQ6hjkUcbnyC6eGek3qrvbxx60UaPIsbCeBa4tUQStsNvy/8/20iggLZYVfRbVRe3qsiO1U2CRHp+PXVS4XFXtHFwV8yyDuSfcMOtpQfOY087UrWtbs1TYSnOKGrBO5yCpIh+3muFL9D7StfeiYlV4hRKOzwsZtzp8iX8XZ3JdVCCXbSG6VGH1gjJZ2/n2nv7s2a/p4WquKaOrX9mOMWfsz2g8akmYhq+IDIbpawV4kVb626ORGE9P6XMyS/H0XGLYBBgxI9xMVR15tEe2lALF93XY68g43f4uKTk2EzYwaQTUyxxxSzvhmb3SLzEME4Jb6K9ups5tXHeKYruMW3nyp2QX9eeA7dtuDQ/0GxEVN4E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(13003099007)(6133799003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3Qw8T2KUljdpDWBz+Lh5TC80k+MWR/ePjzk9fZOwMD3z2rocHYWSEMrQt/?=
 =?iso-8859-1?Q?8AOKWHeqSkrsYlcvFW3rz0usRNGRW2Epx/s7vDEZcY79go1UUaRxOCr2JK?=
 =?iso-8859-1?Q?Q6cLpXZbvHdm4+fNwTwvhLMpvSbc7H0cAeVaxKQ0yw6bj3lBrrItE8Ndr6?=
 =?iso-8859-1?Q?W+kMYXwk0Z2+ewWXY8qHouCcGAmI7dbQhDuvaaDcyDvU7Vp/f8WJvP57yt?=
 =?iso-8859-1?Q?2wYdx3whaPQV3tvHfbiyyvJzS0iXywVzohGFimBV89+t1cMyiiArV/PkpC?=
 =?iso-8859-1?Q?kmoMFgR6gPSlBtPY9PAmoWtgYWofxmuqzvz/oqcIUTvva9EqQLRseyNy3w?=
 =?iso-8859-1?Q?I+coDw+KZPmbbVU3im+DTLEwNDEOPBEICvgm/39tjgb34adevip/WsKVd2?=
 =?iso-8859-1?Q?CEQu+5xXip+W1WtGJmXwApPOx40Kr0KeGoIzkpNpww4dU0+txNrTS/8Qhr?=
 =?iso-8859-1?Q?NIXRoXLPNUd7Xaawc92vU8HVAem+YHGeynGws/NQCFzfaQFiZ1INUD1LFA?=
 =?iso-8859-1?Q?EimSBkF/KH3xxLna1SNd1zSIboTG63N1oL6ZN/kwHaq4ydK7t6wcMTbvmV?=
 =?iso-8859-1?Q?kuMXo2AdQy8WtDpGPoBPqikNw7hBgbxd5dFyLAEHrUHYfHwXvHOmgr0ix+?=
 =?iso-8859-1?Q?fKTeEsVJ2nVDTTwnBXhQGxKSiyOyQ4DNTjKl7BZHCECC/3nSDAGzmW8UX0?=
 =?iso-8859-1?Q?i9a101JgGR7yyqkx8v4xbhba5JNJKq8kVNm3i20Hh49xH5Vg1qVZITF2ek?=
 =?iso-8859-1?Q?JkMx3QUjy0p62fzt+UJE1bE33kM21GWVBekd2tWJliUp4uXEilCVLdTpYv?=
 =?iso-8859-1?Q?9pknq4V7hl9SW0I6E2yHf3vfau/A0r09bibAl1+x6Vnr359YGY/8zOGZO7?=
 =?iso-8859-1?Q?4eDOime97mRkEV1o11g3YeF6IawPEk53iRxe03LFL7nSUhNhmXiK93+Sgm?=
 =?iso-8859-1?Q?JZUDz4bpzo3KfAJWSxQgjTXRC6j1J5MRMCrK9p197L3OILsUcqGm2E5hTI?=
 =?iso-8859-1?Q?ADZZ5Lb75Gike72zGwGvLVASa6NAUxlCiMI6lSJRFzGee6EjDd9k1XrXdb?=
 =?iso-8859-1?Q?Rq7xMJ6Q6WPR1o16v/6mQK6DjCD/FWJw9qRkqhlgvWE0ihVftvJMu4JL6p?=
 =?iso-8859-1?Q?inji6SWFEMqB7c3pAChImSLvivqKiFvUsczfClQPvXvkMbWai9+iGv4pV3?=
 =?iso-8859-1?Q?+faSKP2SP/t5ZFWq4yAWrhMKGWVc7h7WV9tZY6HWyyg7xSL9Ttx2D0B7ZQ?=
 =?iso-8859-1?Q?vGapP1I7rfZDlrCS5A/zL1ZkoXZrxVnbDGe4QuU3e1y8PXsn769UqU/hUM?=
 =?iso-8859-1?Q?A3/SDunm7HGs5nNaEl8coO2N9bG3YUAAwxzzkDbFDYUBZij2BGLecFbiY5?=
 =?iso-8859-1?Q?JWt7Gw9aBCFvpSi+zdFGsCFFIDSrqulENycIl8gbVLHQ4tAGAeJTGiDekG?=
 =?iso-8859-1?Q?/WsEc4rGDG+r7L2bgJI4noOb/s+c8sepo6VMnWb1UQwlQ0fLwY03D3xvMu?=
 =?iso-8859-1?Q?BH+x7iCNOXtnMUWAw3htXsNpxrqXM7ChThHMp12gAqDhcq0iPATsMw5Gps?=
 =?iso-8859-1?Q?jkIH8b5i68/HG4wgDq5M7V7jblmGpKkM9u8szX7vLH/R1O+Ei/L7sNELYi?=
 =?iso-8859-1?Q?E+9e0tQs32i2ynJJSvC7nxx9vu+mPZO92rO+whfegraf+foZhJVwxu1L2o?=
 =?iso-8859-1?Q?TU7rszdXRGCCU3Jn2Smfd0tjRLRKm1C9LkeAw/VVLqd/vcHkorDickWrIc?=
 =?iso-8859-1?Q?9Argltt79r7loM7WqQgMdIIQatYffEqJqhDENk40NwLf8G?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB618954D1D6C87B7D8AD9F169C4CA2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	s9ZXEl0I1yYeULq0lJhgk7wsYQwHpAHx89q364iF869r1hTSedr5sQzkg5qWfShiU/LmrWSPzcut8cnAeRkUotMLxjFj3j2DnjFZndJBRsb7Cc16jI1nJBlHrBVw476AG1/IIWyuP0Y142sXsPbRmMrBCA3xuF+nhwE3Tlh33kM8gioJc/nhNoAGHFUUwMgWnRsL+EnMvEYeQ3OwEHX6ku6yaW+3p+v/FCrVsuJok2eJZ+kaDElSpVjVOiZNf+Dm0sLQ+LfU6EnZ3XmIT60LV+rQtmJyN1jlfx/VwJeZlfiJS7/Ei+SlC+U2BuYxARj4bXFZVixlkticygev0y22+w==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a10db92-b6be-407f-c058-08deedf95e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 05:14:01.3113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5o1wD+NtTArcmn9nB/R75iQW1g8iGq/XtrgOhQsazWdXOLDOWMc+RuG7EmiSTxDQjfRecqj8lRyHv7iBBfaN9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242310

--_000_DM4PR11MB618954D1D6C87B7D8AD9F169C4CA2DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Yoann, Siddharth,

Thank you for pointing this out.

I replaced CVE-2026-58015_p2.patch with upstream commit 0919301962291a71206=
7ee0c5d273cc392f33277<https://gitlab.gnome.org/GNOME/glib/-/commit/09193019=
62291a712067ee0c5d273cc392f33277>. During validation against Glib 2.78.6, I=
 found that this unit-test commit is not standalone. It depends on these in=
tervening commits:

  1.
c0531125344bb25fd66ffb7435ed6c285de09aeb<https://gitlab.gnome.org/GNOME/gli=
b/-/commit/c0531125344bb25fd66ffb7435ed6c285de09aeb>: Improves cookie ID va=
lidation. Several test vectors in 091930196 requires this behavior.
  2.
060aea67de7517d531b8fe2cdc07aa1a00ddeb22<https://gitlab.gnome.org/GNOME/gli=
b/-/commit/060aea67de7517d531b8fe2cdc07aa1a00ddeb22>: Adds the client_get_r=
eject_reason vfunc used by the new unit test. Without it, the test does not=
 compile on GLib 2.78.6.

The complete upstream sequence is therefore:


  *
  db9c8fae398b<https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c4=
57e660ce63dd5afec8993046a>  <https://gitlab.gnome.org/GNOME/glib/-/commit/d=
b9c8fae398b0c457e660ce63dd5afec8993046a> Validate cookie context
  *
  c0531125344b<https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25=
fd66ffb7435ed6c285de09aeb>  <https://gitlab.gnome.org/GNOME/glib/-/commit/c=
0531125344bb25fd66ffb7435ed6c285de09aeb> Improve validation of cookie ID
  *
  060aea67de75<https://gitlab.gnome.org/GNOME/glib/-/commit/060aea67de7517d=
531b8fe2cdc07aa1a00ddeb22>  <https://gitlab.gnome.org/GNOME/glib/-/commit/0=
60aea67de7517d531b8fe2cdc07aa1a00ddeb22> Expose client reject reason as a n=
ew vfunc
  *
  091930196229<https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a7=
12067ee0c5d273cc392f33277>  <https://gitlab.gnome.org/GNOME/glib/-/commit/0=
919301962291a712067ee0c5d273cc392f33277> Add the unit test

I will prepare v3 with these four commits in the same order, along with the=
 requested patch-formatting corrections, and validate the complete series a=
gainst the current Scarthgap branch before resubmitting.

Regards,
Deepak Rathore

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Siddharth Doshi via lists.openembedded.org <sdo=
shi=3Dmvista.com@lists.openembedded.org>
Sent: Monday, July 27, 2026 11:28 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2026-580=
15

Hello,

Thank-you for sending the v2 promptly but i guess in hurry you copied the w=
rong helper commit.

The main fix is correct which is at -> https://gitlab.gnome.org/GNOME/glib/=
-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a

but the helper commit is here -> https://gitlab.gnome.org/GNOME/glib/-/comm=
it/0919301962291a712067ee0c5d273cc392f33277 (this mentions in git commit of=
 being helper commit to same #3931 bug)

you will need to replace patch CVE-2026-58015_p2 with contents from above c=
ommit.

Regards,
Siddharth



--_000_DM4PR11MB618954D1D6C87B7D8AD9F169C4CA2DM4PR11MB6189namp_
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
Hello Yoann, Siddharth,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thank you for pointing this out.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I replaced CVE-2026-58015_p2.patch with upstream commit <a href=3D"https://=
gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712067ee0c5d273cc392f332=
77" title=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712=
067ee0c5d273cc392f33277">
0919301962291a712067ee0c5d273cc392f33277</a>. During validation against Gli=
b 2.78.6, I found that this unit-test commit is not standalone. It depends =
on these intervening commits:</div>
<ol start=3D"1" data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:f=
alse,&quot;orderedStyleType&quot;:1}" style=3D"margin-top: 0px; margin-bott=
om: 0px; list-style-type: decimal;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation"><a href=3D"https://gitl=
ab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ffb7435ed6c285de09aeb" =
title=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ff=
b7435ed6c285de09aeb">c0531125344bb25fd66ffb7435ed6c285de09aeb</a>:
 Improves cookie ID validation. Several test vectors in 091930196 requires =
this behavior.</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div role=3D"presentation"><a href=3D"https://gitlab.gnome.org/GNOME/glib/-=
/commit/060aea67de7517d531b8fe2cdc07aa1a00ddeb22" title=3D"https://gitlab.g=
nome.org/GNOME/glib/-/commit/060aea67de7517d531b8fe2cdc07aa1a00ddeb22">060a=
ea67de7517d531b8fe2cdc07aa1a00ddeb22</a>:
 Adds the client_get_reject_reason vfunc used by the new unit test. Without=
 it, the test does not compile on GLib 2.78.6.</div>
</li></ol>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
The complete upstream sequence is therefore:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" style=
=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: disc;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">&nbsp; <a href=3D"https=
://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec899=
3046a" title=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c=
457e660ce63dd5afec8993046a">
db9c8fae398b</a><a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/db9=
c8fae398b0c457e660ce63dd5afec8993046a" title=3D"https://gitlab.gnome.org/GN=
OME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a" style=3D"text-d=
ecoration: none;"> &nbsp;</a>Validate cookie
 context</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">&nbsp; <a href=3D"https=
://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb25fd66ffb7435ed6c285de=
09aeb" title=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/c0531125344bb2=
5fd66ffb7435ed6c285de09aeb">
c0531125344b</a><a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/c05=
31125344bb25fd66ffb7435ed6c285de09aeb" title=3D"https://gitlab.gnome.org/GN=
OME/glib/-/commit/c0531125344bb25fd66ffb7435ed6c285de09aeb" style=3D"text-d=
ecoration: none;"> &nbsp;</a>Improve validation
 of cookie ID</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">&nbsp; <a href=3D"https=
://gitlab.gnome.org/GNOME/glib/-/commit/060aea67de7517d531b8fe2cdc07aa1a00d=
deb22" title=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/060aea67de7517=
d531b8fe2cdc07aa1a00ddeb22">
060aea67de75</a><a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/060=
aea67de7517d531b8fe2cdc07aa1a00ddeb22" title=3D"https://gitlab.gnome.org/GN=
OME/glib/-/commit/060aea67de7517d531b8fe2cdc07aa1a00ddeb22" style=3D"text-d=
ecoration: none;"> &nbsp;</a>Expose client
 reject reason as a new vfunc</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">&nbsp; <a href=3D"https=
://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712067ee0c5d273cc392f=
33277" title=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a=
712067ee0c5d273cc392f33277">
091930196229</a><a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/091=
9301962291a712067ee0c5d273cc392f33277" title=3D"https://gitlab.gnome.org/GN=
OME/glib/-/commit/0919301962291a712067ee0c5d273cc392f33277" style=3D"text-d=
ecoration: none;"> &nbsp;</a>Add the unit test</div>
</li></ul>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I will prepare v3 with these four commits in the same order, along with the=
 requested patch-formatting corrections, and validate the complete series a=
gainst the current Scarthgap branch before resubmitting.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Deepak Rathore</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core=
@lists.openembedded.org&gt; on behalf of Siddharth Doshi via lists.openembe=
dded.org &lt;sdoshi=3Dmvista.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 27, 2026 11:28 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH v2 6/6] glib-2.0: fix CVE-2=
026-58015</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div>Hello,<br>
<br>
Thank-you for sending the v2 promptly but i guess in hurry you copied the w=
rong helper commit.<br>
<br>
The main fix is correct which is at -&gt; <a href=3D"https://gitlab.gnome.o=
rg/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5afec8993046a" id=3D"OWA0=
8a6c47b-aaed-2926-3c9e-e01bbd3ba53a" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
https://gitlab.gnome.org/GNOME/glib/-/commit/db9c8fae398b0c457e660ce63dd5af=
ec8993046a</a><br>
<br>
but the helper commit is here -&gt; <a href=3D"https://gitlab.gnome.org/GNO=
ME/glib/-/commit/0919301962291a712067ee0c5d273cc392f33277" id=3D"OWA7ee5705=
2-408a-ed58-2805-622da6057cb7" class=3D"OWAAutoLink" data-auth=3D"NotApplic=
able">
https://gitlab.gnome.org/GNOME/glib/-/commit/0919301962291a712067ee0c5d273c=
c392f33277</a> (this mentions in git commit of being helper commit to same =
#3931 bug)<br>
<br>
you will need to replace patch <span style=3D"font-family: system-ui, &quot=
;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, &quot;Noto Sans&quot;,=
 &quot;Liberation Sans&quot;, Arial, sans-serif, &quot;Apple Color Emoji&qu=
ot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Co=
lor Emoji&quot;; font-size: 16px; color: rgb(51, 51, 51); background-color:=
 rgb(255, 255, 255);">
CVE-2026-58015_p2 with contents from above commit.<br>
<br>
</span>Regards,<br>
Siddharth<br>
<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB618954D1D6C87B7D8AD9F169C4CA2DM4PR11MB6189namp_--

