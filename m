Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC67EC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:49:18 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26028.1788169757771709385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LDq/eP5m;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9092; q=dns/txt;
  s=iport01; t=1788169757; x=1789379357;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=fl/KOg6F6NvH+wY704wT5O+kEU3rWM2RkU5S/EgyEeM=;
  b=LDq/eP5mzSNkOayvv4wsdT3IKRyZrqAWG8MXrubp6jOIPy4aWarnqPKy
   /Ge/PhMa9V5VxxC6yOWfZ2QbieizKmSaT7bfA2BOhSxYwzfrCQC426VUD
   /J9CwbwM+VsY1WfNxKChR1zP30xlmjyAoaK0LDM5ejqMfMAaebUHqhz70
   /tGasKn9ZEyPKyr58skb5JUvjX34/BeO1FIify7/YDdWuJBzoXUprFnYr
   RDwf8axj/1HpCM14MEYqZ+LThCBdvYlmCY7XsVm9yFoqlTEhSTkB17VMW
   aXGzd5XdtBBKY8SApYWumwtRXehhcGeF7cua/oOUwaY+dJrbOoVe/Q11G
   A==;
X-CSE-ConnectionGUID: jvaey8BrTaiXcxJWg3fUkw==
X-CSE-MsgGUID: ugOP/O5jQvGykzvwBaPB0A==
X-IPAS-Result: =?us-ascii?q?A0CTBABWTZVq/5H/Ja1agS6BK4E9ATBTgQgCgSFJiCMDh?=
 =?us-ascii?q?SuGWIIhA54bgXQKDwEBAQ0BAS4BFQ0EAQGFBQKNcwImNgcOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBSgE9AgEIEQMBAQEBG?=
 =?us-ascii?q?BYnCh0IAgQBEgiCe4IdFkEDAQIOBrZnAooceIE0gQGDKAE/AgJAAdwMFAGBO?=
 =?us-ascii?q?IU/gx4BASqBNYJdgSMYARuEYScbG4FygVeCaT6BBYFcAgECgTQrHjCDRYIwB?=
 =?us-ascii?q?IIiehIbgT9yJYFUihGFI1JyIgMmMywBVRMXCwcFgSMQMwMqLy0jSwUtHXAMJ?=
 =?us-ascii?q?xIPHRcXHlgbBgUSICpBRCMDPoEZQQKBdD8jGTZ6gQlegSspYQIQF0YuFYIIA?=
 =?us-ascii?q?oJagSdeAgFJQw4HR1MJBAttPTcGDxkDBIE1BY4OB1sfgkoBYSgFAQceBAJPg?=
 =?us-ascii?q?UQZEQsWolyiRIEzCiiDdowijT6IMheFW6URC5h9I41nmw4CBAIEBQIQAQEGg?=
 =?us-ascii?q?W8DMoFZcBU7gmcJFjQZD1aRTYUTgS3FWXkCCTIBAQcCBw4DC4FokAAmgVgBA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:Zi2EPxIPo1NSLfueUdmcuVQyDhhOgF28FhQe5pxijKpBbeH5uZ/jJ
 0fYo/5qiQyBUYba7qdcgvHN++D7WGMG6Iqcqn1KbpFWVhEEhMlX1wwtCcKIEwv6edbhbjcxG
 4JJU1oNwg==
IronPort-Data: A9a23:ugEhvq2LpbX+RbKnLvbD5Yhwkn2cJEfYwER7XKvMYLTBsI5bp2MGy
 WAcXDvTbqreZGCgKY1zbNjgp0wOupHTz9JnTVY43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24vajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDl8/MJxI0PxLCGB+/
 uw6Fz9WYC2AmLfjqF67YrEEasULNsLnOsYb/3pn1zycVaZgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUidC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW3aYCMIILaHq25mG6Fq
 UX+uEOkACgEG82c2ySa2HuUrLfmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuwbRRHu7yOQnXb/bCRxQ5e8wBMRYPeTUfolTc43uQ=
IronPort-HdrOrdr: A9a23:1J3cXq8BjJB69T9WoGduk+HRdr1zdoMgy1knxilNoENuA6+lfp
 GV/MjziyWUtN9IYgBepTnhAsW9qADnhOBICOgqTPuftWbdyRCVxe1ZnO/fKnjbalHDH41mpO
 hdmspFeafN5DFB5K6QjnjbYrMdKZu8gd2VbIzlvhFQpHRRGtldBnBCe3+m+yNNNW57LKt8Pq
 CxouBAoD2tc2kWaMOUOlkpNtKom/T70LjdTVojHRAI1Cmi5AnE1JfKVzSI1BYXVD1ChYwl7X
 XElALB4KCiueGQyxPX1WPfhq4m1ucJzOEtOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYJJa1ImjPsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhLhebgDS5yMbzZJBOe
 NwriCkXqhsfFf9dRfGlp/1vtZR5wyJSE8Z4KsuZrpkINIjgfFq3NQiFQhuYeY99WrBmfAa+a
 9VfYDhzccTV0+GZHbEuWQq6tmtUnMvWiqieCE5y5eoO/w8pgEl86Per/ZvxEvp+P8GOup5zv
 WBPaJymL5USMgKKap7GecaWMOyTnfAWBTWLQupUB/a/Yw8SjvwQqTMkf0IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnL2JFQ6BjCTGi0QDyok6hlltVEk6y5QKCuPTyISVgoncflq/IDAtfDU/
 L2PJ5NGffsIWbnBI4M1QzjXJtZL2UYTaQuy5wGckPLptiOJpzht+TdfvqWLL3xESw8Ume6GX
 cHVCibHrQ30qlqYA6OvPH8YQKYRqWkx+MDLEHzxZln9LQw
X-Talos-CUID: =?us-ascii?q?9a23=3AWu0uimipHH5uPS4Efu2+mRUPFjJucGPUwWaACVW?=
 =?us-ascii?q?EAGdZQ623dlDL9p5njJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ApRm0Kg9tVBfM5LF4R21XXV6Qf9pnxJzpLx0PqIs?=
 =?us-ascii?q?pqsqWKzNaMg+31B3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 09:49:16 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id B813718000443
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:49:16 +0000 (GMT)
X-CSE-ConnectionGUID: cVwodfMlTPaMyH15wRjaqQ==
X-CSE-MsgGUID: b12YwxRuSOWX7lSQ1fd4WA==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,252,1779148800"; 
   d="scan'208,217";a="72785913"
Received: from mail-southcentralusazon11013020.outbound.protection.outlook.com (HELO SA9PR02CU001.outbound.protection.outlook.com) ([40.93.196.20])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Aug 2026 09:49:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmuJahRBb1YBlY5Vsmgskk6PXvxsvbTrIvh+ien5O0Q90O3s7AvvRLhmmD1nMRAdqrTxD+yGAK92v57GvZ2ETWlz1JobXAahK5qMF38nmfxrxasOdFXInjqcZZ4ERNZYWDQMeOLHeq9bYqoBFGLUslRo3n8h8r5ij1DCcYvtwmVuIbZtLKBichKKV/Ww7lV5H2huK7uyGxgSUMKZ91Itv3bjTXjwVL8OhmPuNNfNp0MF0SASjEi0rREiOd0Ds6MCwUvNqPpIcEwFfFiOtWFguf1jz1T877ldNZgx7MgrivyyJGAjPrwf1E3bX+KRL4HKM1wLeHfzbz6XeY/j12Nu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl/KOg6F6NvH+wY704wT5O+kEU3rWM2RkU5S/EgyEeM=;
 b=a8gX3FJIHWiSyX4bDX8v4rGv3kC7nXFsdo0KFwEwE7Gx/Zot4jNO51YfTlhuhYOU3p19iN7Kb/J2ubvWhoV5H+wuIqhSDBuKxh9jKklOUtrFzcR2TrPcWHxkQd+TVY68QCtSVE9BcPQG34juo8RaC/eCrpIHeO4kTEgiibJb5irRxNchqjmurygDb2kbhji0JFzgt0AdwVjsJxpDVuhXpo4V7lXzibeWeQaztWQt87/uVE0hexJwNQnr/+F4jte89CeHIp4ETViTasEVwX0Asw/dL/xT1hzpoLk8/ZVfj3rwok5pQx/erErR+2UyPTAibfFO6LH16RBWEw9HEXKp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4SPRMB0074.namprd11.prod.outlook.com (2603:10b6:8:1cc::23) by
 DS4PPF1DFB73954.namprd11.prod.outlook.com (2603:10b6:f:fc02::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:49:15 +0000
Received: from DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7]) by DM4SPRMB0074.namprd11.prod.outlook.com
 ([fe80::6a69:dea7:cb45:38c7%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:49:15 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 6/8] curl: fix CVE-2026-11856
Thread-Topic: [OE-core][wrynose][PATCH 6/8] curl: fix CVE-2026-11856
Thread-Index: AQHdNwFIBkSmlVp9akSpFt/lpThtALa37bpU
Date: Mon, 31 Aug 2026 09:49:15 +0000
Message-ID: 
 <DM4SPRMB0074F405FC6510E934BBA5B0C4A92@DM4SPRMB0074.namprd11.prod.outlook.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
 <20260805083103.2633995-7-deeratho@cisco.com>
 <DL0OISA3XTZ0.1FABX40IWA0V6@smile.fr>
In-Reply-To: <DL0OISA3XTZ0.1FABX40IWA0V6@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0074:EE_|DS4PPF1DFB73954:EE_
x-ms-office365-filtering-correlation-id: d1a10779-3eb8-45fc-56ac-08df07451e33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|56012099006|13003099007|8096899003|38070700021|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 w8j/he5v9PYq6CCrJeay8qW/o4VT7c6P9K5+SZ4+KbJw2rrmyrhT8Fg+S99IFrkVmrdZaGZmDcnHsfXUFPcJUVmosmNytJF8pPeIm5Z6PSPRxR1xEZde7bqxGsndMH470+w2Zqks3E8vG4uHc4VtvyxssTy45mkLqriDK3TNoq8hEfELY+E0LBSHK/LLVJV9nFhRfbfBlenDpQNqTa2VllmmGXa4+LyOz9WzpE1RTyZz2ROC1xu92Q6f91XVAlpQ6IKyqDfKQQITYnpSmR8XFuOIaCcTtkxZSb2vQsI3IL+IVK0cDZrjsYxIAePLmohuweaIIMvBcjhX3ozjqBJnmezMr0F+AMu7R/dWw9abSokuPXkQi9Zqtv3hWHWJUo343/sgWe8Chs9z4C3RERrTC/QmfBnTqpvLWEeGiKV7MmI+GShTIIIiLtBifb5zLMJ/X+4ImnhauNicegMFA3LqF+02+vyDB/ptjzhs8ClKwEpi/JM2Cd/W+4xNvGdeMDssz4IGu+NEnmABLIgZWY/n0F4FQpQ7Cy75l8gT3XwaHzVL4Y6hiXSk+DRgfnTUj27UX0g0FvaM8Ib9fUv8bNqeByguAphoxlA73gW0akOGygPNz1Ix0NVVeUqJOLoA9BO4u1Ia0CBopjgqdlTd6tYZvlCXM4J7XGLn8PEHm17pjjQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0074.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(13003099007)(8096899003)(38070700021)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6Mrduzul5XV/4HH96z7jBWfnsyUPj79gBjo3TGcSxQg+uJX6eMBv6QtOUghM?=
 =?us-ascii?Q?OTYdVUjsg2XVdAIhqWUsekOF9rz07oh8+AV8NX82F40b9ipC5zSw4J93cFx6?=
 =?us-ascii?Q?l8rA+JX1EpB9kE8tAxSykhTlSA8QT1NSHgtd5WuWXQkgniaqgDbX6Hv2UIAr?=
 =?us-ascii?Q?/vjX6pVMnEgT+xp2o3Ef9kgH8Il1FDn6Mhen71AgM3g6rHkG3O+bOqR+P03I?=
 =?us-ascii?Q?MlEPG8OUMjAg4AeEVxyLCwIW3VD2MkKcrfh5XGfqjoFgNRFMULwAc12PE3Ev?=
 =?us-ascii?Q?QMTFgSPabqEjXaR3uKsNLsWZgNNUt+dqoB578SGm6UgYjH4JMvKGJ+ZTxzHR?=
 =?us-ascii?Q?tqRaHdwjYI7ZmiMuthgGk6trKgPgUctnnhKaShcPzxspmNxoUZR+zNiDrHHl?=
 =?us-ascii?Q?+0qh/Scl1nGdYkYcGn28u1FTG4KoPL/iWvq0uoS/CmSmXaCStqYdHmvuH7EE?=
 =?us-ascii?Q?gGZSNbVuM21WiHwz0x3+VltA918ePiel6URgHPew9CbxOZbcNZtkfwAr0KFD?=
 =?us-ascii?Q?74eh1geN3+DP9win7J/GdUWok21NwerDdNbDykQkz3tyMnkUWq3++z6M1VCy?=
 =?us-ascii?Q?K9JdMJsJkTQ4k1J3NBiDV5rllbV1iEAKR9dVWogO91CXK2ju3GIzVpJC5dOB?=
 =?us-ascii?Q?yzYh+3TvbljgFb9qnaxDlJ793yU1Pt8vzcf1iGCrx3MPfe+IWOfZMqKWYfP2?=
 =?us-ascii?Q?E+Hc/fWhP/bjjmBnTfdkz6Boq92orUQENq2ttgap4M3h/0FasEo8euR1DRlQ?=
 =?us-ascii?Q?5weI1BHkLXlImJOUn4CI2br4x+9Fm6UbpJZeC5a4JB1qwm3dU85YCsFl478q?=
 =?us-ascii?Q?yRNN4O0sN/OBbvqwRjAfGKqVFJ1mjFc1fUmcw4+FfvyqjTGWMPIzzm4Ki4Py?=
 =?us-ascii?Q?uONOLKziAssBvdWS60rHViIdaxu/BvIN69E6KFBl8zuTMLu6FkW87vwGC+RH?=
 =?us-ascii?Q?VlDOZRScTfx15o0uyHZR2IxWLxtq8XlheIJkHI8tmhW+WKQ9cl/zwR6Wn1Rl?=
 =?us-ascii?Q?0jEnWx64DcEVsJaHCtPCyJrcAuk9i93k3O2d8n+Yp+bLh6A0qDeBWzt3Qk2a?=
 =?us-ascii?Q?jeZm4otmKv/LAnzp0m6z8j8A81qtn/tdPqioz50XBrPA7zvp1nvxOdlI++ds?=
 =?us-ascii?Q?SavuHU707Rl57xF8y6tjsVP3NdtLN7p04O2JZmYFnPEeqRlyoDZrqxhEDKIo?=
 =?us-ascii?Q?++QChBUuuX3a2BoEWVnlNbZ7dN/8A7sMNQVtOso23CGkb7JeSjeCBSA8MmEY?=
 =?us-ascii?Q?u4Pr4VarNRHr4nKAVfmJBujSczpuC6NzTV/ttS0Rz8xdfnW+8+3dRlv/FWa6?=
 =?us-ascii?Q?darh1RinMtQpXBs6nBZWWdTJp4B5lAv6xIggs2uNKxVO8Ra2/A5xHzkgIySs?=
 =?us-ascii?Q?h51oaMdtZEAeJRxJOGUuf3JV3vjvAtoXVFdh2olFlgraDrKgkbyZ0VV3+MEj?=
 =?us-ascii?Q?+2ZdscM3EjlP3NuW0hjY4Z3D4FPL+PmX7hmNKq2L8G/q6nG/y1CoKrJM0k4X?=
 =?us-ascii?Q?7p8AKsMBmXVOwRPkuO09Sbcbfgw3qY8UNy8HjcAOLbn/IZF+TEPUzeJcXGMP?=
 =?us-ascii?Q?GwGDTGJhBzLggC/+OdsuzKBZs522aP9jNjWdc73nHGBNSKUOZR1nEOxLHmAq?=
 =?us-ascii?Q?Bx+AP1JLXGxlTVUefAV7SLWwyXq54fubEt0ijclqblVTH/REVDkxSG6vTyGf?=
 =?us-ascii?Q?gJlduaomNDjpT6XRWNS4IVIBjeK3TCp/2wyF60/R+5oAnRHF?=
Content-Type: multipart/alternative;
	boundary="_000_DM4SPRMB0074F405FC6510E934BBA5B0C4A92DM4SPRMB0074namprd_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	o5eDyr2E4r65GhQ9Z+zcNm/yiDnh06WnQNrKfQRwHEQP6qcj/ysQf/7gTyjGWeFvW0KG9bUOw4KtFW8KP1N/taWEcGeYlJZg84rQ2gwT0yARF3fSJ3MFZXDHWdUD3NgXbfcLcJZOgnNTxWx2xJ9vHVA7dDmRZurJnd2sfbj3+wjWPxZvG7JFkQ25PhZHOIjYPa2prYhSReU7bA8B8rEIf8JmnV2KaRobF2zfnqYf+8VaBOSbN35NmAFwjeC9QQ9SZcdbHLSAB51zqftVvwAxEPQeixMT/Yvu6/9qSWYTqDm9pXXzW4AJXMOCdVRQfPoD91dEoiF/7oZwY+WV23cqWA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a10779-3eb8-45fc-56ac-08df07451e33
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 09:49:15.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pg5YfLGGHL814EGIcGbjx64djJ2NnhFlBsVihLM5+KNzHbCCJHJH3XIqUZ2vkLS0+/fYfhKIbhJsfT2AlgJZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1DFB73954
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244761

--_000_DM4SPRMB0074F405FC6510E934BBA5B0C4A92DM4SPRMB0074namprd_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann, for your review.

Let me review your suggestion and comments in both patches.

Regards,
Deepak
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Friday, August 28, 2026 8:54 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 6/8] curl: fix CVE-2026-11856

On Wed Aug 5, 2026 at 10:31 AM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream curl security backports for
> CVE-2026-11856. The main fix commit is referenced in [1], the
> Digest proxy-state follow-up is referenced in [2], and the public
> curl advisory is referenced in [3]. The individual backported commit
> links are recorded in the embedded patch headers.
>
> [1] https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45cae0f96f=
fabc535
> [2] https://github.com/curl/curl/commit/7ec25148c06b049d3252172ff17fae85b=
19c54c9
> [3] https://curl.se/docs/CVE-2026-11856.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../curl/curl/CVE-2026-11856_p1.patch         | 372 ++++++++++++++++++
>  .../curl/curl/CVE-2026-11856_p2.patch         |  72 ++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
>  3 files changed, 446 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p1.patc=
h
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p2.patc=
h
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch b/met=
a/recipes-support/curl/curl/CVE-2026-11856_p1.patch
> new file mode 100644
> index 0000000000..80fb18a7c1
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch
> @@ -0,0 +1,372 @@
> +From 3349fbcb7876456cadc3cc3a8d3e8aff29406906 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Mon, 13 Jul 2026 23:17:23 -0700
> +Subject: [PATCH] digest: flush state on origin or credential change
> +
> +Verified by test 1686
> +
> +Closes #21944
> +
> +CVE: CVE-2026-11856
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/5c6b48803=
57ab3e72967c1c45cae0f96ffabc535]
> +
> +Backport Changes:
> +- Wrynose curl 8.19.0 does not have upstream Curl_peer or
> +  struct Curl_creds. This backport stores the host Digest origin
> +  and user/password on digestdata, then flushes stale host Digest
> +  state before reuse when either value changes.
> +- Kept Wrynose test-list ordering and added only the upstream
> +  test1686/lib1686 regression coverage.

Same as previous patch of the series, this is new code that does not
look like the fix from upstream (I can't accept/understand backporting
adaptation but here, I feel like this is too much)

I'll hold this one as well.

Regards,
--
Yoann Congal
Smile ECS


--_000_DM4SPRMB0074F405FC6510E934BBA5B0C4A92DM4SPRMB0074namprd_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks, Yoann, for your review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Let me review your suggestion and comments in both patches.</div>
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
Deepak</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Friday, August 28, 2026 8:54 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH 6/8] curl: fix CVE-2026-11856<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Aug 5, 2026 at 10:31 AM CEST, Deepak Rathor=
e via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream curl security backports for<br>
&gt; CVE-2026-11856. The main fix commit is referenced in [1], the<br>
&gt; Digest proxy-state follow-up is referenced in [2], and the public<br>
&gt; curl advisory is referenced in [3]. The individual backported commit<b=
r>
&gt; links are recorded in the embedded patch headers.<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/5c6b4880357ab3e7296=
7c1c45cae0f96ffabc535">
https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45cae0f96ffabc53=
5</a><br>
&gt; [2] <a href=3D"https://github.com/curl/curl/commit/7ec25148c06b049d325=
2172ff17fae85b19c54c9">
https://github.com/curl/curl/commit/7ec25148c06b049d3252172ff17fae85b19c54c=
9</a><br>
&gt; [3] <a href=3D"https://curl.se/docs/CVE-2026-11856.html">https://curl.=
se/docs/CVE-2026-11856.html</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../curl/curl/CVE-2026-11856_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 372 ++++++++++++++++++<br>
&gt;&nbsp; .../curl/curl/CVE-2026-11856_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 72 ++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.19.0.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 446 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856=
_p1.patch<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856=
_p2.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch b/=
meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..80fb18a7c1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch<br>
&gt; @@ -0,0 +1,372 @@<br>
&gt; +From 3349fbcb7876456cadc3cc3a8d3e8aff29406906 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Mon, 13 Jul 2026 23:17:23 -0700<br>
&gt; +Subject: [PATCH] digest: flush state on origin or credential change<b=
r>
&gt; +<br>
&gt; +Verified by test 1686<br>
&gt; +<br>
&gt; +Closes #21944<br>
&gt; +<br>
&gt; +CVE: CVE-2026-11856<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/5c6b4880357ab3e72967c1c45cae0f96ffabc535">https://github.com/curl/curl=
/commit/5c6b4880357ab3e72967c1c45cae0f96ffabc535</a>]<br>
&gt; +<br>
&gt; +Backport Changes:<br>
&gt; +- Wrynose curl 8.19.0 does not have upstream Curl_peer or<br>
&gt; +&nbsp; struct Curl_creds. This backport stores the host Digest origin=
<br>
&gt; +&nbsp; and user/password on digestdata, then flushes stale host Diges=
t<br>
&gt; +&nbsp; state before reuse when either value changes.<br>
&gt; +- Kept Wrynose test-list ordering and added only the upstream<br>
&gt; +&nbsp; test1686/lib1686 regression coverage.<br>
<br>
Same as previous patch of the series, this is new code that does not<br>
look like the fix from upstream (I can't accept/understand backporting<br>
adaptation but here, I feel like this is too much)<br>
<br>
I'll hold this one as well.<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4SPRMB0074F405FC6510E934BBA5B0C4A92DM4SPRMB0074namprd_--

