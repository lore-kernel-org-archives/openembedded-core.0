Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19E9C4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:50:30 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2827.1784526616414144078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 22:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QlwAQ1Fp;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4937; q=dns/txt;
  s=iport01; t=1784526616; x=1785736216;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=VCi9SUD8d+VBmcw1lUQdNKNmvGGVFxaPFVmJFGto06M=;
  b=QlwAQ1Fp3V6I4MsFbvKXlXCYCDa8+jPojbxe2pMVNG8kup+HB0NLICMd
   xdOwvJ8zmKZj6YasgnKaIB/TXcdKqXbd2H29ooWXyHf8Mx7qCnzM9o1X+
   ldJ0GvUPrj/BhGesuqt+e/PFkyKfFXKPsia4Ru0UY8ndHjtzCo7NTEK0X
   3wzmufQAxJqdEMxxLY7EvDW/Q0WF/b4lW+Dk7/c+2aHptLnBq5JNXlVtp
   XK+5A4dquycoFQLylmWTADLMDYknFSMZsDbi7ehX+owEqJ1DGNa0mibw3
   HOrjRT6b7oP+5nRzxiuUrKljtcf/f2nK4HIrZc9063MQX7P+djgXJdU1X
   w==;
X-CSE-ConnectionGUID: CZgfNEdbQkSPH4AURiIlJA==
X-CSE-MsgGUID: jkmFrDI5TN6W5mCho93XwQ==
X-IPAS-Result: =?us-ascii?q?A0ByAwAGtl1q/48QJK1aHgEBCxIMZYEgC4E9ATBTgQgCg?=
 =?us-ascii?q?SFJBIgfA4UrhliCJJdEhleBfg8BAQEOAS4BFQ0EAQGFBQKNUwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBERViAgEIB?=
 =?us-ascii?q?A0EAQEBLicKHQgCBAESCBqCYYIdFkEDAQIOsDABgT0Ciip4gQEzgQGDaAJD3?=
 =?us-ascii?q?AoVgTiFP4MBGwEBBSVJbIJdgSIYARuEYScbG4FygVeCaT6BBYFcAQMBgTQrh?=
 =?us-ascii?q?BOCMASCInoSG4NagWGMFlJyIgMmMywBVRMXCwcFgSMQMwMgCi8tAhQNIg8aB?=
 =?us-ascii?q?S0dcAwnEg8dFxYeWBsHBRIgKkFFIwMUOz84C0MFgVcCgghOIx8DOX+BMHVKd?=
 =?us-ascii?q?y1qAhAXSjgkg0sCBwMLbT03Bg4ZAwSBNQWMUAdbI4N5T5UqLY8Uo3cKKIN1i?=
 =?us-ascii?q?nuBJo0+iDIXhASBV6URC5h9I4I2izGVYIUuAgQCBAUCEAEBBoFoPIFHCwdwF?=
 =?us-ascii?q?YMiCQpAGQ+UIoMUySF5AgEBBzIBAQcCBw4DC4FokACBfgEB?=
IronPort-PHdr: A9a23:rvWoxhZMrFvITrR2En61Tmn/LTAchN3EVzX9orIuj7ZIN6O78IunZ
 grU5O5mixnCWoCIo/5Hiu+Dq6n7QiRA+peOtnkebYZBHwEIk8QYngEsQYaFBET3IeSsbnkSF
 8VZX1gj9Ha+WXU=
IronPort-Data: A9a23:NViojq1G9m+UbhiigPbD5Ytwkn2cJEfYwER7XKvMYLTBsI5bpzICm
 zFMXjiDOP3fYWbxLd1yPtm09koCsJ/Xyd9qHgI63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EuajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGJ3M5M6s19uxOAlp21
 aAxFQoMTxShrrfjqF67YrEEasULJc3vOsYb/3pn1zycVahgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2ME+ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZj+i3a4WIIYXULSlTtkSbo
 0zc00WkPjdEC4Ga4jqCoymcmdaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4qBLRRksaaeTjSW8bL8kN94EXR9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:FfTcDaFkLOZ07oaSpLqF4ZLXdLJyesId70hD6qkvc203TiXIra
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
X-Talos-CUID: 9a23:OkL+5G+xfNXnzLRzMX2Vv2UmFc4DX3HX9XTrG2/kIFtTSZyRa3bFrQ==
X-Talos-MUID: 9a23:p9GX3gQoeQ0Vlms/RXTuhzRMLutJvpiIVn9QlL4GvJjfBTNJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 05:50:13 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id A5C281800010A
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:50:13 +0000 (GMT)
X-CSE-ConnectionGUID: 6fTspt/0RweZjV0EcjYlsA==
X-CSE-MsgGUID: KwOvtU0ITGSOPCGPVu4+mA==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208,217";a="56136293"
Received: from mail-eastus2azon11010026.outbound.protection.outlook.com (HELO BN1PR04CU002.outbound.protection.outlook.com) ([52.101.56.26])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 05:50:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWoLCbZ9OSrXKaV7qmp2cmCbhb0GZ8jXncRWL8RUHZHIddV9mNy0Om3XgKf0bqtO0m7Cevkt8WQnFDppZPmJYhW3vLJPHbSnCsK7KkiYsUx/ZBzfuC79aBM5I4/0N5D6bz09gkmIuP/kuy9msX1jt/nDdG2Tc9wzDdxwm0TgOZD3NIPLYCeDVZidKqhatClO6I+g+0SJdQto+fUjeLleRFBWaQ1AgQDPg6nTOxAbP7CsNPNxCd4zkA9A3mDr7cbzsWuWIN0gxuRma1u3TQ0OMJDX8G4T44OlWXSMUSqy3ztJLhIEQ0evcRAB28Vj/KmT4mCqoVQ9JicnSZO8WA4Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCi9SUD8d+VBmcw1lUQdNKNmvGGVFxaPFVmJFGto06M=;
 b=kxrn1KPJBUjzoEq2oooiQKW7g9NN9Xf8tXrhlRsyibrbWfbWT76LsgnwXEG30ryLXIur4GE2MG2GrOUAodyM9hIjgJgczylxIKcQ6fDBYYi/4gzdBk7rzk3Yt00FXsGdAWHPNzW5cRuriEZSr/fNmlUIDQw3moYh2v5JV/y4O55Bj0NkHAFVkRBDAcbxCPxVgZ/FNDUzE0KxRgbU4wZKm4eHptEQK3Am7Z4uOxsqpX/KmniBGTxs7NMTdpv0qOYnrfq2xk+mf7ahlubKamLT5i3vcKcXG67XxJOr9sH9J/MmEltUNXwEC15V1z2vr1xRQcfN1QjLFd0eYPrW6fNhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SN4PR11MB9943.namprd11.prod.outlook.com (2603:10b6:806:4ff::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.16; Mon, 20 Jul 2026 05:50:11 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 05:50:11 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] glib-2.0: fix CVE-2026-58010
Thread-Topic: [OE-core][scarthgap][PATCH 1/6] glib-2.0: fix CVE-2026-58010
Thread-Index: AQHdF9HK4T8j6gnot02rPdqaDdK4Y7Z154YM
Date: Mon, 20 Jul 2026 05:50:11 +0000
Message-ID: 
 <DM4PR11MB6189B970157EBF5263B88BB3C4C32@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260715172330.1149253-1-deeratho@cisco.com>
 <DK2X2VY96TAM.AZ9YPZM0BHHO@smile.fr>
In-Reply-To: <DK2X2VY96TAM.AZ9YPZM0BHHO@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SN4PR11MB9943:EE_
x-ms-office365-filtering-correlation-id: e02a353c-1911-4610-e3f5-08dee622c365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|8096899003|13003099007|38070700021|10067099003;
x-microsoft-antispam-message-info: 
 CiqZgS3vRAQeLm3psYGOOMTbGMAnpDO3nG6l8cIDWdf8fSi8ZjRLZprTMOSZhvfCK/IbiQAtoNmDwu9Q0PHi3lIM+r2x+2hGf3FGDnUvYsOdK674tNoymj26q+DW0Vapdj8g+we8En9MPD9N3op5Gtf38BIHYd6nLrcP4LdNuHHx5Ro0/yZd54px8wgmq02a5XJX0uVynLsTDpNdVXYtXGAD2QoGUGm66E22qHHaE6VIj93D7sWF+aE0ipKkpmle7xnVc2y7lX79nasyVGxHMk0rncGh0KCC3zPX7W0czcK9Zi4zDiKGXRDlwHGB+9KaxDJyDYWx+WNmrVCmmBs4OdY7jT9ZUVzrJigmVdtNkQunaq2dF+3Mz6QAKMt15PDxM+YrVzAFPGJgiuWzcIFp10VsiRz+3EmSfyKy0wMoG/SSUQWi/ftxvf4C91v49XwtI+R7SpgW1Pe1WBvsZ6da91SqweMgW44yrTkYST+mz3wWpK4+/Ij9sO6B1X2pP9pO2UorwrFrIR1pKAEkvUqNVw31WGuqJN7w296FaCgdJcA0kmNtYj4zbwii1/Qh7SZ9Ji3S6Ys4JkJcUeeqy2K8giiuA1p/JGHZn9mLCcLGSqQ8imXre3mG/Ayg8HkMIGhT5KHJbibZa6ouZiy4bg6lfFbr6wjXvwBlDJV3DnQC0m8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(8096899003)(13003099007)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?A6mkeEvWssuf7jNfuOusBlwi5SlxNKbgoQ8iEfi/NOUMaG+bvJARk05TE+5J?=
 =?us-ascii?Q?yKhJBOfStMSqHkw98ASm0pAVFgN1VXqcFaaMbaQvVaHPD62B0/T1xirHcF1o?=
 =?us-ascii?Q?bSu56PhO9lLVP0elpCpgocTyrZYeMZ9AYWMZvXLBOTbMSOz2sFqmwRGkRR3l?=
 =?us-ascii?Q?68Sa1EDmxegIsYQTWNV3kz+tiPSlFg4XoLOF4vLghzs8T3Gl+J4i2oCx1+oO?=
 =?us-ascii?Q?Gxwnf76Fa8QxQGcKwQ9G2R7AHMxxNNKb6FHUiDJq/U1L22li0UeY4eT6ZctX?=
 =?us-ascii?Q?QVwiorGze4QJLFEPVN3/7CcKnuY/wKVuqaObiR8fEvWeFBLxozOJ3sZ5T0Md?=
 =?us-ascii?Q?pKfKzMOmYmSa1aHt1rPojLO6SuxFGcabkfXAbfKa0IeOf3qUt0q+6yETMQ6f?=
 =?us-ascii?Q?7TKPNLGKhvDgmI4YZIdVuyqldeqWKOTH/xkEy4CMgjmxU1NJMQzuEUOxhLfn?=
 =?us-ascii?Q?29J2tv18IfKOBLsCXgeTnUI6sjOEdi5xAlSZyKRciOEKuJJ5fn/UrcMTAMhb?=
 =?us-ascii?Q?dHa0QZEBo+WFSUkb4BLv+Lct5NoaBqYBKIbIOB9KQAyKis/wqzz5vIBXzvaP?=
 =?us-ascii?Q?6z478cqYIv/mBK/X9SZz7wkeuZkHFE0XJDmtF5iHwLGEFVuC/cJDUaCL4k9G?=
 =?us-ascii?Q?AbGvQYNW3zkQ8nDvFpUICp0RqpXr7zEw9IZjki9e1aLxac/3SZrG2d+zFeBg?=
 =?us-ascii?Q?Yo+RsyQztTIBNMqZayyPy9GK2SbKnfqt8sc5zVGnT9hnFTrGsoLFbpfnlpYJ?=
 =?us-ascii?Q?jq8LSkfv1PRRulzGT6RJwdBNlh7hug3Y8G7cNXcvWSajxykwd/m34fFR+bhF?=
 =?us-ascii?Q?0E9SJr3EQXLOynHYjAnJx3lWYJ2U4WVpOW/7pKFNRbOkGavYX5DMRpLRGCok?=
 =?us-ascii?Q?jkE3UmP0ciAXzFIyZAYFQHn3uYbRN34vuQaSVNl0QVJaSVJTd5qs6eW6nRES?=
 =?us-ascii?Q?Mr1AXCrB/XzRN/8iuZDmz0fg0U5VaGMdiqPvxcsx1uP4TefNaw6DOQlolPHD?=
 =?us-ascii?Q?HfJH1q8IcgzI0+sySd8uSln4lnqMqZzNnakHAhOS1E2xx6+zSDt1r9HQGkzK?=
 =?us-ascii?Q?YR69QByxCno7ITYWZj7KaiVzPDja1wT1+62558Oe6yF726aH7qwkc3pl7RYC?=
 =?us-ascii?Q?RYgrQ+wG40niynV2k4b00rjr1HwlzBQ83Cya5ESMkiTgRa2/vOo0xM9Ur6Xp?=
 =?us-ascii?Q?wioHnSYSoSG6fUBTIeRMY4SPBNfIOzZVgm4G6NV/LdUCg9XPVMLjYV5nHDjN?=
 =?us-ascii?Q?Jl8p3sWOy65IVFgcKqZXYOWHeks5ZWAwcroCdKWw949DJQnNbT6zRFImdfwp?=
 =?us-ascii?Q?uGQ/ou/wlERJai40KH6LzGQ7geHJcgEsH+bYp+JmLSgD+IpIpzzSJOICtlmq?=
 =?us-ascii?Q?rl46CpEAzfbO4Jms7VAGo7jXAupTDXy2g6eZ2ID7sl747baGb36HriYq5Qfr?=
 =?us-ascii?Q?e3TTQYAjCbTd1+JjIg8c0eAAqumcSWKMPN67pV48WedNzUFzU2HfxIirXk24?=
 =?us-ascii?Q?MAhHudMsYKomrfwvTzCw0P1Hab5PZ2i+hfHxqeeDxqmUv9zb1TsIkyKvw55x?=
 =?us-ascii?Q?VC/S0aHqWHNnyc499IEPUiNs2QR/ZR8/Fy66fMa3uhjj08HxDhi5zzskApw+?=
 =?us-ascii?Q?oquItIlpOcr/4JTMzl3TnKxpZFBEb6Gc4rLrXjuJXWSOudCh38aNw81afdck?=
 =?us-ascii?Q?D1iBI3DTVhDlFn3FoBzOJo+SAUiYTlwXyOCY5MNCnnn/cgEr?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189B970157EBF5263B88BB3C4C32DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Lf9WHZCyoTASvivL4ImWdMsm49UUGckfFJaOOCok3jvlrvq/of0g1/ejm9KOq5sYwFgeA0xRWrpvAgn+y53W35dQN7SUoNlPBDrYtLulVeigTR2UB4pKMXTSFb9mV1dn5hHMbCTR/51mmDgEBVJor2XyrK7QgRG5EGGBAIu+SdxT4sch8xAiHpXAG8V2KC48axb6aUBnTprfvCxG+bGl2tmX3yePnc4n1hHZatAW7LuLuOZLOQzCP5RlsB+A1LxchQNziiKyFPBT8orI46pgaQrRm7WNy/oXobCP8Wu6PRHRQpLAlYcYLiqLkQi05LKNLVAU3z6IrZXf88C67Jcxew==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02a353c-1911-4610-e3f5-08dee622c365
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 05:50:11.4162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nKD9das5A4qcmQwyPeRx34rJM4tNFtQeW9PltdXEm6+CLkgIV1+E4xJx7YXzDW9myLAONEqnBkSx9vrBvJmVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9943
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241323

--_000_DM4PR11MB6189B970157EBF5263B88BB3C4C32DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, Yoann, for the update.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, July 20, 2026 4:26 AM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] glib-2.0: fix CVE-2026-58010

On Wed Jul 15, 2026 at 7:23 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream 2.86.5 backport for
> CVE-2026-58010. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2].
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e82=
4f0ac77484cc997f
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

FYI, I will merge [wrynose][PATCH] glib-2.0: upgrade 2.88.0 -> 2.88.2
https://lore.kernel.org/openembedded-core/20260719221822.3458326-1-peter.ma=
rko@siemens.com/T/#u
first, then this series.

Thanks!
--
Yoann Congal
Smile ECS


--_000_DM4PR11MB6189B970157EBF5263B88BB3C4C32DM4PR11MB6189namp_
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
Thanks, Yoann, for the update.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 4:26 AM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH 1/6] glib-2.0: fix CVE-2026-=
58010</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Jul 15, 2026 at 7:23 PM CEST, Deepak Rathor=
e via lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt;<br>
&gt; This patch applies the upstream 2.86.5 backport for<br>
&gt; CVE-2026-58010. The upstream fix commit is referenced in [1],<br>
&gt; and the public CVE advisory is referenced in [2].<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56=
111ef989811e824f0ac77484cc997f">
https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e824f0ac7=
7484cc997f</a><br>
&gt; [2] <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-58010">https:=
//nvd.nist.gov/vuln/detail/CVE-2026-58010</a><br>
&gt;<br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
<br>
Hello,<br>
<br>
FYI, I will merge [wrynose][PATCH] glib-2.0: upgrade 2.88.0 -&gt; 2.88.2<br=
>
<a href=3D"https://lore.kernel.org/openembedded-core/20260719221822.3458326=
-1-peter.marko@siemens.com/T/#u">https://lore.kernel.org/openembedded-core/=
20260719221822.3458326-1-peter.marko@siemens.com/T/#u</a><br>
first, then this series.<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB6189B970157EBF5263B88BB3C4C32DM4PR11MB6189namp_--

