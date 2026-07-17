Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9039BC44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:41:37 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7577.1784266890015421160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bHI4dwMC;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=113177; q=dns/txt;
  s=iport01; t=1784266890; x=1785476490;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=AFwD/fjiUhZTkvQqMEvbDQu6DUFZVnFl+bSlqQ3XnlY=;
  b=bHI4dwMCUphKWY9ic7Z3GXCJdX5AvNCPbJyubk4cva4xPBTMaTbZs00L
   mkGSicnTkuRTZyHpSUmXvpMiHTrzUJQFBCKodYYJMCLnN5tVWjP/Ohc0Q
   19IXMfxI23lnTDSP762EHcDnrR6LAlshCIo1WRo129EIuNkVxMNKc5wNd
   29i+JFVwdhrbCfuq6RVfKuPKvY5o1JF4YLaYcjrFyT3/yRPT0cZS87Arn
   H6DSspWVEEwAmXgcJEVNtgOfAKHq0I4RfqRewV82FG7oVqZ0aUlNgJ//X
   /eVyVPBJiTuLGQqFgphg9l9xOVAChNmBa01ttZAjfUDx2ozbXilgUK1Fw
   g==;
X-CSE-ConnectionGUID: 2lOMbH+QRTWW07g3LPnqjA==
X-CSE-MsgGUID: vGt/0ZcjSOSa4uGDUNciIw==
X-IPAS-Result: =?us-ascii?q?A0ApAAByt1lq/5P/Ja1RCR0BAQEBCQESAQUFAWWBFwgBC?=
 =?us-ascii?q?wGBPAEwUxZyAoEhSYgjA4RMX4ZYgiEDgROQN4xRFIFkBg8BAQENAi4BFQ0EA?=
 =?us-ascii?q?QGFBQKNUgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPA?=
 =?us-ascii?q?QyGWgEBAQEDAREIAQwkARsiAgEIEQMBAQEhAQ0nCh0IAgQKCQgXA4Jhgh0WQ?=
 =?us-ascii?q?QMBAg4GsVsBgT0CiVkaN3iBATOBAYMoAT8CQ9t+AQsUAYE4AYU+gxwBASqBN?=
 =?us-ascii?q?YJdgSIYAYR8JxsbgXKBFUJ5L4EJOD6BBYFcAgIBF4EADQ0DEBseg3WCMASCI?=
 =?us-ascii?q?noSG4E9Ah4ygUqBX4EYiw5SciIDJjMsAVUTFwsHBYEjQwMqLy0jSwUtHYEjI?=
 =?us-ascii?q?R0XFh5YGwcFEiAqQUUjA089OAtDBYFWAoIITiMfAzl/gS91SnctagIQF2lBJ?=
 =?us-ascii?q?IIUgT4DC209NxQbAwSBNQWMXAdbI4FwLxkHASwEDBscBxMBBwwYBBwCJgcBL?=
 =?us-ascii?q?xIHASoSAhUMDAQfBQYLAh8ZA5I9IwgBATh+jiBHg1aKQ5UXCiiDdYwhjT6CB?=
 =?us-ascii?q?IYuF4QEjRSHA5JRC5h9I4I2izGVNAc4hRsCBAIEBQIQAQEGgWg8K4EZDgdwF?=
 =?us-ascii?q?YMiCUoZD1aNNR8DFoNghROBPcdoeQIJMgEBBwIHDgMLgWiEYYsfAiYHgU8BA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:f+WMQBE/1z6ZwuTXaayc3p1GfhMY04WdBeZdwoAsh7QLdbys4NG7e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:Rbi+paqytcgLMW501kLOaCfb9sVeBmJDZBIvgKrLsJaIsI4StFCzt
 garIBmDa6zbY2b2ctFzPou28klU65TVzIMwG1Q9ryphQ35Dp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8U035pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rxzJkRE1
 b8hEgwyUUjciLmS+LSiSMA506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHJwPxh3B/
 z2uE2LRHD4Gc4Stwji+1Uml2vLgsR7dU4MzC+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMJottdQ9Qnoh0
 Vrhc87VOAGDeYa9EBq13ryVtji1fyMSKAc/ieUsFGPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:DFTlv62j7iwJ97dSyipb6QqjBbtxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K+90cm7LU80hqQFn7X5XI3SEDUO11HYV72KgbGSpwEIXheOitK1tp
 0QPJSWaueAd2SS5PySiGLXYrRQpeVvsprY+Ns2pE0dKz2CHpsQlzuRfTzra3GeKjM2YqYRJd
 633OYCjTymfngcc8S8AVc4f8Wrnbf2vaOjSyQrQzo85iezrR7A0tPHOind8gYVUjtJz7tnym
 7Yjgz/6JyktvGw2jXc22XQ45k+oqqu9jJEPqOxo/lQDg+pphejZYxnVbHHlisyuvuT5FEjl8
 SJiws8PuxogkmhPl2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZSB3E8EAt1esMk5
 6jnljp9aa/Pymw2BgV1OK4EC2CUXDE50bKpNRjykC3l7FuMYO547ZvpH+9W61wbR4SoLpXYN
 WGSvuspcp+QBe9c23TuHVpzZiHW3Q+GQrDf2050/bliAS/WBtCvhYlLAt1pAZbyHowJqM0lN
 jsI+BmkqpDQdQRar84DOAdQdGvAmiIWh7UNnmOSG6XX53vFki94qIf2o9FrN2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlO/grWSGuwUDzxwoUGjqIJ94HUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10n1WoVUK3MZTMoJ0+xLEW6ms4bOMMnnp+bbePHcKP7kFislQHr2Bj
 8ZUD36NKx7nzaWs7/D8W/ssl/WCzjCFMhLYdrnFsAouf0wCrE=
X-Talos-CUID: 9a23:NqNn32wvEEXzpDN3H2/bBgVOHucAeF2e9U3sHHDgVmkybIWTUF25rfY=
X-Talos-MUID: 9a23:3GXk2AZN9NqtoOBTqRDww2lQP8VTxJ+nVF0ivaggsMilKnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:41:27 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 0EE3318000241
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:41:27 +0000 (GMT)
X-CSE-ConnectionGUID: 8rYR/s8CQ1ODy86ZNhRo7g==
X-CSE-MsgGUID: 8c32kiDzS525PXBcarqkgg==
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="64929467"
Received: from mail-westcentralusazon11010059.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.59])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:41:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cj5AE7xQVCIb47c+RddCm6Zx/sGAXCTJZxnIKlHk8w9Jt8gSbJBkSAMtrc8XVBZ2T5LOSARdWoW4yNL+9ZIMkp0Xb7QMpPu7hF7FbeXbQXGQtPqqPMM+YoUWtOdImhT/+wdiU4Bdcmwq6DQXX78NgKgUAYc8W6A0Ss2etfZvzlF5PIb+GCJPI1ZTF8Rwk99/qKcvm1nSMxyi/FQaHO1iukHMEhkko4UtehrHcsgSRFWmc9eDWjBTENO25IXRM2oBrFaFfsyHFbGuAp5fkc9qZ0CwpOipXrIoECDelFvs6QgKXP+4j9rdmEjphzHVNGpfUbYCP6ygIwzIvfl14rs4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFwD/fjiUhZTkvQqMEvbDQu6DUFZVnFl+bSlqQ3XnlY=;
 b=jr6/A7zqwTQmEtSweLF7VmDki2Z/T6ODQIJVNbk2DXKk26iz2vonjQeVAlNCkeUwftcHi1d/AS0cBoswE1rWxNolQLFoISlytcI8XBmplBMkth1TpfbngKt8X4TQegsD9S5B4QZbiWstEyQSebzes4t/KPXwlRbRFQm/nryoH4Zdd6r38hakwAWuAhnAKKpJceIPxujZ112C8q2jGwEQFVten/64Hyvregnznh83yDT5hLFPykLhLplBUBGH+U6zkH2YDUAlcHUg1sttGjZjCBPAaTke5lPFBROhkHQcLYiPRbzQC4t/wQog8AIAFyp9YwHEQTk1mq4xMKFInUdnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:41:22 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:41:22 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 1/6] rsync: Fix CVE-2026-29518
Thread-Topic: [wrynose][PATCH v2 1/6] rsync: Fix CVE-2026-29518
Thread-Index: AQHdFawWREkZXuqDQEadeclHReTIhrZxMnBD
Date: Fri, 17 Jul 2026 05:41:22 +0000
Message-ID: 
 <PH0PR11MB59027477B501C6421A69E289CFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
 <20260717052059.773645-2-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-2-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: 1afd0f04-e8a0-4f2d-ca47-08dee3c60898
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|12006099003|16056099006|13003099007|22082099003|38070700021|18002099003|8096899003|56012099006|5023799004|11063799006|10067099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 bgvWkMVx1TSMxM7XiEqTI4BG2tPLR3aiD2UiRrBLyjtP9YhYO/S4POcljpMrtJTEPUfsoywNfcjkediI7+FkISZTP5dblm/0ZaJ5De+1Cq0Hfwra1RKEk3VuMetoHf10fDpHfHyJ0gVwLC5V65+l+Vzmh2+NjbCvGNXCl3gtfQQr90sDB2QbJz7t1UoW0qTFxVbfZRlmzzSgEE3sZj+NJrNiL9g2LEClNNHRmyKMAaaN+/5g3/NB91DiCGRwMpgSNK1ZCKilHFkRO5fH6aDDis3Emv/GaypvTatXzQnUsFof27wBDX4O6bQoeTfMgwGuNRU+zyEIQgpyiDxVWQvLZP0Urui7X5lh1XBBHZjehgWJZHx2RbSTafKBcCfFKCmduLaqJFoXAoOw5+sPHPUV3DzqOLl2vtCcV6qUePeGh4rMt3/AVsmAtWb3EYle0scudux4nncLGqkf1E+4ZoJkUeIF+t2tY2WMOp3FXX6twWMK8ltsVXeWMNc9h1iHc37jqBj28vO55nhN7gPiyEobkwmhWwzYzVX4qJ6NZfHQoAFTHQxc2EU8US1fgxSzXORUoU6sBlaZW+F7rc06Q5TEbRUXydiJKm5jVpJKDuTYbeo0BCFYzd01rTpT2rtXmAWla4HJ5bHZasVGsDSc6ZVXxi//wWA8ycF0dRLvn0nPAA0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(12006099003)(16056099006)(13003099007)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?RMc8FjrVkacpGzOOa1UjA/ketRYzMOg1GVeOPAZ9h7nqH9Uwcurb+jj1?=
 =?Windows-1252?Q?YdnrZ9SsvDxp/HuqbpW8qhqm5Hv6rHww6KUUxcKlD+XTKgTRSGqcD/sl?=
 =?Windows-1252?Q?vYzXePWIuGr0wnjg/imY5RJe0QRGrsoVBxIK6WP4uTcNSmsXWoONSqFE?=
 =?Windows-1252?Q?O9eDbn8Tc0rOBD1rBFwixo3/W6fTDGZePHKOq6C8yvj1fiCDx1lWQQqh?=
 =?Windows-1252?Q?BeJxciNsZPuDXr+NU1eSOQsDv0ZDfv5Hm/5q8mt+8Vt4gVuJCGei7a5Q?=
 =?Windows-1252?Q?4f61lJ+0ikngHCySqfaydd4O/YDpcdYbAVjuZFsiRwlwBU9kyvfa6vuX?=
 =?Windows-1252?Q?hNm0vtDcv/oDeyoJ4amyRC2cq7gVFe8GUIESC8+dqtEPY/KuiS5pMiPS?=
 =?Windows-1252?Q?bCqUFp+ZWWh3/zMl4wZDmp0IUdqs0h6Y7HY/cKfPrmhTNSnt0g215UMT?=
 =?Windows-1252?Q?tvrfVFvTm2qFszXSbCWyh2BtLVz9S1mpqw4rS1FQ9k6FgxiWDjAogBNf?=
 =?Windows-1252?Q?6GjrgAEUaG18W9qJJ6TPqQdRuwDLfzZbf1eY68bfIjnIQ4KrSvDpvk1A?=
 =?Windows-1252?Q?2TdduKfVoObQxfvCYo2D8SPMpm6il9FkrSPizlcWobueU2d0FXZfVJAl?=
 =?Windows-1252?Q?FMosBANKQh89Mc0Htv2rpuhN8hGRmdbuXhyZHVF8o8eq0aYflV12u9J4?=
 =?Windows-1252?Q?lVcsZeLcnuBbz5aO2h3QDxiVqnHLqiC2Wod3dKtgIVWl6AsbdhFUVxZg?=
 =?Windows-1252?Q?JLNb9hoyckjEvXvbM8ahcNa9qY+x05HbQH+QBwFgl45rHuPPorw/xI8/?=
 =?Windows-1252?Q?jt6/w4z5FijYQKAQW+x4U2CzA9EoMtooQ9bjXRbTqTSqYFd+wAbgLfNU?=
 =?Windows-1252?Q?GZgLNZyXaa1XXCJqbYLxOhLSm5ffly6G1qpFIm+CB1Oh569IA8/U0Ja7?=
 =?Windows-1252?Q?80EOJXFdT0+GCCsB3lbGR3aOaZvN1otYpRwR05BxWnjnc4Q91H6hd+M2?=
 =?Windows-1252?Q?sQYBcFlamIJaE8C42SlNq7GHrGSWMXosNuFslsJ96n6vLkj81Vfnr32B?=
 =?Windows-1252?Q?EWSYJX1Noe5YgwQeCye9WqH+t8DnKvINf28o2X6Zl2wN2E5DosmF+wYL?=
 =?Windows-1252?Q?Pdh5Dh/Y8oUqfQQRW9gmCAAoc6T0tp8FO4MkT6kNzNGE4mtkRrnVgWQ5?=
 =?Windows-1252?Q?aB8Ff8hcDpRNE8CK+ygYbvixrjUoLBXCnWa85swk0GRDMfOjCwG91aK7?=
 =?Windows-1252?Q?PXtgo99xdv9TBylW+fX6oI5WWq+fVxigN162A5ZW8fdp3UA2/CsXP2R9?=
 =?Windows-1252?Q?lU8w4bzccn6IOaas3n8xwgm3ml+sp+wNWt51cGjnHnOFGNaoYXKrXYZw?=
 =?Windows-1252?Q?W37G3zY9bNMe8HYkv0O2VIP0ApktJdqInkjp8Pj71gA8U2W7qIetFMlF?=
 =?Windows-1252?Q?oZ9T9SJRxVfJj0fDDlogohrcKFlx4igTBnLQ2k/60UR2iyE1bwujspKR?=
 =?Windows-1252?Q?YlBnTwjCmT5EyaypmwJdf9w1ixdnEOe/+brxs/V6nVSdgASUPJgetI0t?=
 =?Windows-1252?Q?quU1LAUPkip+OImGvi6PCRyBSX238LEWG6ZIM5j0VbOOAbnlt/5olEnr?=
 =?Windows-1252?Q?Mrvor23AotJEPPEMVzUpH0mLNctlTzJNUnTF/71jZkmxmO7qWxJ+61ti?=
 =?Windows-1252?Q?Wc5kpZ7pu61dlpCziiwkx3LD+dB+IVCEhE/zst87IQ3THu735Nu8bURQ?=
 =?Windows-1252?Q?44chRcPwUvdBxO2878YwLV+CpdypuL6VUtcVVjQrEwS1DqlY4K96Xjxo?=
 =?Windows-1252?Q?+FHROn55Hg8d/Vb+DdVufj2QMt16y7ngSW1Tiv8eQAZbo1cy?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB59027477B501C6421A69E289CFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	jHMzGO0RB0jaaZBGhKDxILd0ZUb5HJ4z7iFk9fg3IzyyVMsc0piqZKGGxAX5UwlhkuGoxHX3qSv4aIWD1p2QqtV7uVNtKcTtPc2IgCajTF+0wSz2HthVuTR+8SW4qtCbfZMZKdG/tict5HSW4qQcQ02PP2TlZlJYQg1FJ7jhDuLpGiqSh7d31EzCU7yX54mExYsrUNwXmehr6vC1NrhBwqmZLA+WUC3Bd+cG+gAAwzU09ZWoL0QClMrek0GioyTNeG8zFn8aF3swYHUPO4d2M5xBhi3aqHE4rZ9S/0S0R6bpquNLA/rFHl5bMm4olI4e0bdVKr0f9FR9FBGWcFNGGw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afd0f04-e8a0-4f2d-ca47-08dee3c60898
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:41:22.0330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tv1URYQ5oOzlE6eX+9zPXCTNZlxJUlZLl//MOsvd+bPg7Yn2ANMHmDMWWj6Cxm4o0JqhixIZpCv78BPHKpeZ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-1.cisco.com [72.163.7.162];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241136

--_000_PH0PR11MB59027477B501C6421A69E289CFC62PH0PR11MB5902namp_
Content-Type: text/plain; charset="Windows-1252"
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
Subject: [wrynose][PATCH v2 1/6] rsync: Fix CVE-2026-29518

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch backports the upstream rsync v3.4.3 security fix train for
CVE-2026-29518. The direct CVE fixes are [3] and [4]:

- [3] enables secure_relative_open() for daemon modules running with
  "use chroot =3D no", closing the receiver-side basis-file TOCTOU.
- [4] routes the sender read path through secure_relative_open() from
  the trusted module root, closing the matching sender-side TOCTOU.

This patch also carries [1] and [2] from the same upstream v3.4.3
security/update train. These are supporting secure_relative_open()
changes, not standalone direct CVE fixes: [1] uses Linux
openat2(RESOLVE_BENEATH) to preserve the same confinement while allowing
legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the
equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's
rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits
before the direct CVE-2026-29518 commits.

The upstream fixed release is referenced in [5], and the public CVE
record is referenced in [6]. Individual backported commit links are
also recorded in the embedded patch headers.

[1] https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18fe2=
fd6cd79adef8a1
[2] https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec8b=
829524c3809a43
[3] https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569faa=
60216582fb6c5d
[4] https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba05033=
7ef32092f2894c
[5] https://github.com/RsyncProject/rsync/releases/tag/v3.4.3
[6] https://www.cve.org/CVERecord?id=3DCVE-2026-29518

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-29518_p1.patch       | 392 ++++++++++++++++++
 .../rsync/files/CVE-2026-29518_p2.patch       |  98 +++++
 .../rsync/files/CVE-2026-29518_p3.patch       | 328 +++++++++++++++
 .../rsync/files/CVE-2026-29518_p4.patch       |  71 ++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   4 +
 5 files changed, 893 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.pat=
ch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.pat=
ch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
new file mode 100644
index 0000000000..fcb7b777fe
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
@@ -0,0 +1,392 @@
+From e7b575413b962ac042079a55530577b20c7eee44 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 30 Apr 2026 08:39:22 +1000
+Subject: [PATCH] syscall: use openat2(RESOLVE_BENEATH) on Linux for
+ secure_relative_open
+
+The CVE fix in commit c35e283 made secure_relative_open() walk every
+component of relpath with O_NOFOLLOW. That blocks every symlink in the
+path, which is stricter than the threat model required: legitimate
+directory symlinks within the destination tree (e.g. when using -K /
+--copy-dirlinks) are also rejected, breaking delta transfers with
+"failed verification -- update discarded".  See issue #715.
+
+On Linux 5.6+, openat2(RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS) gives
+us exactly what we want: the kernel rejects any resolution that would
+escape the starting directory (via "..", absolute paths, or symlinks
+pointing outside dirfd) while still following symlinks that resolve
+within it. /proc magic-links are blocked too.
+
+Use openat2 first; fall back to the existing per-component O_NOFOLLOW
+walk on ENOSYS (kernel < 5.6). The lexical "../" checks at the head
+of the function are kept as defense in depth. The Linux gate is
+plain #ifdef __linux__: the runtime ENOSYS fallback covers the only
+case that actually matters (header present + old kernel), and any
+Linux build environment without linux/openat2.h will fail with a
+clear "no such file" error rather than silently disabling the
+protection.
+
+Verified manually that openat2(RESOLVE_BENEATH) blocks all four
+escape patterns (absolute symlink, ../ symlink, lexical .., absolute
+path) while allowing direct and within-tree symlinks. The new
+testsuite/symlink-dirlink-basis.test (taken from PR #864 by Samuel
+Henrique) exercises the issue #715 regression and passes; full
+make check passes 47/47.
+
+Test: testsuite/symlink-dirlink-basis.test (8 scenarios)
+Fixes: https://github.com/RsyncProject/rsync/issues/715
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/4f=
a7156ccdb2ad34b034d18fe2fd6cd79adef8a1]
+
+(cherry picked from commit 4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ syscall.c                            |  62 ++++++-
+ testsuite/symlink-dirlink-basis.test | 247 +++++++++++++++++++++++++++
+ 2 files changed, 304 insertions(+), 5 deletions(-)
+ create mode 100755 testsuite/symlink-dirlink-basis.test
+
+diff --git a/syscall.c b/syscall.c
+index 34a9bba0..d66c9fdd 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -33,6 +33,11 @@
+ #include <sys/syscall.h>
+ #endif
+
++#ifdef __linux__
++#include <sys/syscall.h>
++#include <linux/openat2.h>
++#endif
++
+ #include "ifuncs.h"
+
+ extern int dry_run;
+@@ -715,12 +720,49 @@ int do_open_nofollow(const char *pathname, int flags=
)
+ /*
+   open a file relative to a base directory. The basedir can be NULL,
+   in which case the current working directory is used. The relpath
+-  must be a relative path, and the relpath must not contain any
+-  elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
+-  applies to all path components, not just the last component)
+-
+-  The relpath must also not contain any ../ elements in the path
++  must be a relative path. The kernel must guarantee that resolution
++  cannot escape basedir (or the cwd, when basedir is NULL): no ".."
++  jumps above the start, no symlinks pointing outside, no absolute
++  paths, no /proc magic-link tricks.
++
++  Symlinks *within* basedir are followed normally =97 earlier rsync
++  versions rejected every symlink with O_NOFOLLOW on each component,
++  which broke legitimate directory symlinks on the receiver side
++  (https://github.com/RsyncProject/rsync/issues/715). The escape
++  prevention is handled by the kernel via openat2(RESOLVE_BENEATH)
++  on Linux 5.6+; older systems fall back to the per-component
++  O_NOFOLLOW walk below.
++
++  The relpath must also not contain any ../ elements in the path.
+ */
++
++#ifdef __linux__
++static int secure_relative_open_linux(const char *basedir, const char *re=
lpath, int flags, mode_t mode)
++{
++      struct open_how how;
++      int dirfd, retfd;
++
++      memset(&how, 0, sizeof how);
++      how.flags =3D flags;
++      how.mode =3D mode;
++      how.resolve =3D RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS;
++
++      if (basedir =3D=3D NULL) {
++              dirfd =3D AT_FDCWD;
++      } else {
++              dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY)=
;
++              if (dirfd =3D=3D -1)
++                      return -1;
++      }
++
++      retfd =3D syscall(SYS_openat2, dirfd, relpath, &how, sizeof how);
++
++      if (dirfd !=3D AT_FDCWD)
++              close(dirfd);
++      return retfd;
++}
++#endif
++
+ int secure_relative_open(const char *basedir, const char *relpath, int fl=
ags, mode_t mode)
+ {
+        if (!relpath || relpath[0] =3D=3D '/') {
+@@ -734,6 +776,16 @@ int secure_relative_open(const char *basedir, const c=
har *relpath, int flags, mo
+                return -1;
+        }
+
++#ifdef __linux__
++      {
++              int fd =3D secure_relative_open_linux(basedir, relpath, fla=
gs, mode);
++              /* ENOSYS =3D kernel < 5.6 doesn't have the syscall even th=
ough
++               * glibc/kernel-headers do; fall through to the portable pa=
th. */
++              if (fd !=3D -1 || errno !=3D ENOSYS)
++                      return fd;
++      }
++#endif
++
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
+        // really old system, all we can do is live with the risks
+        if (!basedir) {
+diff --git a/testsuite/symlink-dirlink-basis.test b/testsuite/symlink-dirl=
ink-basis.test
+new file mode 100755
+index 00000000..9065dd81
+--- /dev/null
++++ b/testsuite/symlink-dirlink-basis.test
+@@ -0,0 +1,247 @@
++#!/bin/sh
++
++# Test that updating a file through a directory symlink works when using
++# -K (--copy-dirlinks). This is a regression test for:
++#   https://github.com/RsyncProject/rsync/issues/715
++#
++# The CVE fix in commit c35e283 introduced secure_relative_open() which
++# uses O_NOFOLLOW on all path components, breaking legitimate directory
++# symlinks on the receiver side. The fix splits the path into basedir
++# (dirname, symlinks followed) and basename (O_NOFOLLOW) so that
++# directory symlinks are traversed while the final file component is
++# still protected.
++#
++# The regression only manifests when delta matching is triggered (i.e.,
++# the sender finds matching blocks in the old file). Small files with
++# completely different content are transferred in full and don't trigger
++# the bug. We use a large file with a small modification to ensure
++# delta transfer is used.
++#
++# In addition to the original regression, this test covers edge cases
++# in the fix itself:
++#   - --backup with directory symlinks (finish_transfer pointer identity)
++#   - --partial-dir with protocol < 29 (fnamecmp !=3D partialptr guard)
++#   - --inplace with directory symlinks (updating_basis_or_equiv check)
++#   - Files without a dirname (top-level files, no split needed)
++
++. "$suitedir/rsync.fns"
++
++RSYNC_RSH=3D"$scratchdir/src/support/lsh.sh"
++export RSYNC_RSH
++
++# $HOME is set to $scratchdir by rsync.fns
++# localhost: destination will cd to $HOME (i.e., $scratchdir)
++
++# Helper: create a large file suitable for delta transfers.
++# ~32KB is large enough for rsync's block matching to find matches.
++make_testfile() {
++    dd if=3D/dev/urandom of=3D"$1" bs=3D1024 count=3D32 2>/dev/null \
++      || test_fail "failed to create test file $1"
++}
++
++# Set up source tree
++srcbase=3D"$tmpdir/src"
++
++######################################################################
++# Test 1: Basic directory symlink update (the original issue #715)
++######################################################################
++
++mkdir -p "$HOME/real-dir"
++ln -s real-dir "$HOME/dir"
++
++mkdir -p "$srcbase/dir"
++make_testfile "$srcbase/dir/file"
++
++# First transfer (initial): should create the file through the symlink
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path=3D"$RSYNC" dir/file localho=
st:) \
++    || test_fail "test 1: initial transfer failed"
++
++if [ ! -f "$HOME/real-dir/file" ]; then
++    test_fail "test 1: initial transfer did not create file through symli=
nk"
++fi
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 1: initial transfer content mismatch"
++
++# Small modification to trigger delta transfer
++echo "appended update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++# Second transfer (update): was failing with "failed verification"
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path=3D"$RSYNC" dir/file localho=
st:) \
++    || test_fail "test 1: update through directory symlink failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 1: update transfer content mismatch"
++
++######################################################################
++# Test 2: Compression (-z) as in the original reproducer
++######################################################################
++
++echo "another line" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptzv --rsync-path=3D"$RSYNC" dir/file localh=
ost:) \
++    || test_fail "test 2: compressed update through directory symlink fai=
led"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 2: compressed update content mismatch"
++
++######################################################################
++# Test 3: Nested directory symlinks (nested/sub/data.txt where
++#          "nested" is a symlink to "nested_real")
++######################################################################
++
++mkdir -p "$HOME/nested_real/sub"
++ln -s nested_real "$HOME/nested"
++
++mkdir -p "$srcbase/nested/sub"
++make_testfile "$srcbase/nested/sub/data.txt"
++
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path=3D"$RSYNC" nested/sub/data.=
txt localhost:) \
++    || test_fail "test 3: initial nested transfer failed"
++
++echo "appended nested" >> "$srcbase/nested/sub/data.txt"
++sleep 1
++touch "$srcbase/nested/sub/data.txt"
++
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path=3D"$RSYNC" nested/sub/data.=
txt localhost:) \
++    || test_fail "test 3: update through nested directory symlink failed"
++
++diff "$srcbase/nested/sub/data.txt" "$HOME/nested_real/sub/data.txt" >/de=
v/null \
++    || test_fail "test 3: nested update content mismatch"
++
++######################################################################
++# Test 4: --backup with directory symlinks
++#
++# Exercises the finish_transfer() "fnamecmp =3D=3D fname" pointer
++# comparison that determines whether to update fnamecmp to the
++# backup name. If broken, --backup would reference a renamed file
++# for xattr handling.
++######################################################################
++
++# Reset destination
++rm -f "$HOME/real-dir/file" "$HOME/real-dir/file~"
++
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --rsync-path=3D"$RSYNC" dir/file localho=
st:) \
++    || test_fail "test 4: initial transfer for backup test failed"
++
++echo "backup update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --backup --rsync-path=3D"$RSYNC" dir/fil=
e localhost:) \
++    || test_fail "test 4: update with --backup through directory symlink =
failed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 4: backup update content mismatch"
++
++if [ ! -f "$HOME/real-dir/file~" ]; then
++    test_fail "test 4: backup file was not created"
++fi
++
++######################################################################
++# Test 5: --inplace with directory symlinks
++#
++# Exercises the updating_basis_or_equiv check which uses
++# "fnamecmp =3D=3D fname". With --inplace, rsync writes directly to
++# the destination file instead of a temp file.
++######################################################################
++
++rm -f "$HOME/real-dir/file" "$HOME/real-dir/file~"
++
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --inplace --rsync-path=3D"$RSYNC" dir/fi=
le localhost:) \
++    || test_fail "test 5: initial inplace transfer failed"
++
++echo "inplace update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --inplace --rsync-path=3D"$RSYNC" dir/fi=
le localhost:) \
++    || test_fail "test 5: inplace update through directory symlink failed=
"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 5: inplace update content mismatch"
++
++######################################################################
++# Test 6: Top-level file (no dirname, no split needed)
++#
++# Ensures the dirname/basename split is not attempted for files
++# at the top level (file->dirname is NULL).
++######################################################################
++
++make_testfile "$srcbase/topfile"
++mkdir -p "$HOME"
++
++(cd "$srcbase" && $RSYNC -Rlptv --rsync-path=3D"$RSYNC" topfile localhost=
:) \
++    || test_fail "test 6: initial top-level transfer failed"
++
++echo "toplevel update" >> "$srcbase/topfile"
++sleep 1
++touch "$srcbase/topfile"
++
++(cd "$srcbase" && $RSYNC -Rlptv --rsync-path=3D"$RSYNC" topfile localhost=
:) \
++    || test_fail "test 6: top-level update failed"
++
++diff "$srcbase/topfile" "$HOME/topfile" >/dev/null \
++    || test_fail "test 6: top-level update content mismatch"
++
++######################################################################
++# Test 7: --partial-dir with protocol < 29
++#
++# For protocol < 29, fnamecmp_type stays FNAMECMP_FNAME even when
++# fnamecmp is set to partialptr. The dirname/basename split must
++# NOT trigger in this case (guarded by "fnamecmp =3D=3D fname").
++######################################################################
++
++rm -f "$HOME/real-dir/file"
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=3D28 --partial-dir=3D.rsync-p=
artial \
++    --rsync-path=3D"$RSYNC" dir/file localhost:) \
++    || test_fail "test 7: initial proto28 partial-dir transfer failed"
++
++echo "partial-dir update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=3D28 --partial-dir=3D.rsync-p=
artial \
++    --rsync-path=3D"$RSYNC" dir/file localhost:) \
++    || test_fail "test 7: proto28 partial-dir update through dirlink fail=
ed"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 7: proto28 partial-dir update content mismatch"
++
++######################################################################
++# Test 8: Protocol < 29 basic directory symlink update
++#
++# Exercises the protocol < 29 code path and its fallback logic
++# (clearing basedir on retry).
++######################################################################
++
++rm -f "$HOME/real-dir/file"
++make_testfile "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=3D28 \
++    --rsync-path=3D"$RSYNC" dir/file localhost:) \
++    || test_fail "test 8: initial proto28 transfer failed"
++
++echo "proto28 update" >> "$srcbase/dir/file"
++sleep 1
++touch "$srcbase/dir/file"
++
++(cd "$srcbase" && $RSYNC -KRlptv --protocol=3D28 \
++    --rsync-path=3D"$RSYNC" dir/file localhost:) \
++    || test_fail "test 8: proto28 update through directory symlink failed=
"
++
++diff "$srcbase/dir/file" "$HOME/real-dir/file" >/dev/null \
++    || test_fail "test 8: proto28 update content mismatch"
++
++# The script would have aborted on error, so getting here means we've won=
.
++exit 0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
new file mode 100644
index 0000000000..661f23db76
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
@@ -0,0 +1,98 @@
+From 0675997f170b6463dd20306ee97e346e79196335 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 30 Apr 2026 08:44:11 +1000
+Subject: [PATCH] syscall: also use O_RESOLVE_BENEATH on FreeBSD and MacOS
+
+FreeBSD and MacOS have O_RESOLVE_BENEATH as an openat() flag with the same
+"must not escape dirfd" semantics as Linux's RESOLVE_BENEATH. The
+kernel rejects ".." escapes, absolute symlinks, and symlinks whose
+target lies outside dirfd, while still following symlinks that
+resolve within it -- the same trade-off that fixes issue #715 on
+Linux.
+
+Add a parallel BSD path in secure_relative_open(), gated on
+declared. Unlike Linux, BSD doesn't have the header/runtime split
+where the symbol can exist without kernel support, so no runtime
+fallback is needed: if the flag compiles in, the kernel honours it.
+
+OpenBSD and NetBSD have no equivalent kernel primitive and continue
+to use the existing per-component O_NOFOLLOW walk; issue #715
+remains visible on those platforms (a userland resolver or
+unveil(2)-based fence would be follow-up work).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/7f=
60ec001a0be63b770707ec8b829524c3809a43]
+
+(cherry picked from commit 7f60ec001a0be63b770707ec8b829524c3809a43)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ syscall.c | 40 +++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/syscall.c b/syscall.c
+index d66c9fdd..9033196f 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -729,9 +729,13 @@ int do_open_nofollow(const char *pathname, int flags)
+   versions rejected every symlink with O_NOFOLLOW on each component,
+   which broke legitimate directory symlinks on the receiver side
+   (https://github.com/RsyncProject/rsync/issues/715). The escape
+-  prevention is handled by the kernel via openat2(RESOLVE_BENEATH)
+-  on Linux 5.6+; older systems fall back to the per-component
+-  O_NOFOLLOW walk below.
++  prevention is handled by:
++    Linux 5.6+:                openat2(RESOLVE_BENEATH)
++    FreeBSD 13+:               openat() with O_RESOLVE_BENEATH
++    macOS 15+ / iOS 18+:       openat() with O_RESOLVE_BENEATH (same
++                               flag name, picked up by the same #ifdef;
++                               flag value differs from FreeBSD)
++  Other systems fall back to the per-component O_NOFOLLOW walk below.
+
+   The relpath must also not contain any ../ elements in the path.
+ */
+@@ -763,6 +767,32 @@ static int secure_relative_open_linux(const char *bas=
edir, const char *relpath,
+ }
+ #endif
+
++#ifdef O_RESOLVE_BENEATH
++/* FreeBSD 13+ and macOS 15+ (Sequoia) / iOS 18+: O_RESOLVE_BENEATH is
++ * an openat() flag with the same "must not escape dirfd" semantics as
++ * Linux's RESOLVE_BENEATH. The kernel rejects ".." escapes, absolute
++ * symlinks, and symlinks whose target lies outside dirfd. (FreeBSD and
++ * Apple use different flag bit values, but the same symbolic name.) */
++static int secure_relative_open_resolve_beneath(const char *basedir, cons=
t char *relpath, int flags, mode_t mode)
++{
++      int dirfd, retfd;
++
++      if (basedir =3D=3D NULL) {
++              dirfd =3D AT_FDCWD;
++      } else {
++              dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY)=
;
++              if (dirfd =3D=3D -1)
++                      return -1;
++      }
++
++      retfd =3D openat(dirfd, relpath, flags | O_RESOLVE_BENEATH, mode);
++
++      if (dirfd !=3D AT_FDCWD)
++              close(dirfd);
++      return retfd;
++}
++#endif
++
+ int secure_relative_open(const char *basedir, const char *relpath, int fl=
ags, mode_t mode)
+ {
+        if (!relpath || relpath[0] =3D=3D '/') {
+@@ -786,6 +816,10 @@ int secure_relative_open(const char *basedir, const c=
har *relpath, int flags, mo
+        }
+ #endif
+
++#ifdef O_RESOLVE_BENEATH
++      return secure_relative_open_resolve_beneath(basedir, relpath, flags=
, mode);
++#endif
++
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
+        // really old system, all we can do is live with the risks
+        if (!basedir) {
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch
new file mode 100644
index 0000000000..9c138b5437
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch
@@ -0,0 +1,328 @@
+From edfd5b913c9afdb0f340cf8135544399206f6e62 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 31 Dec 2025 10:01:23 +1100
+Subject: [PATCH] syscall+clientserver: am_chrooted and use_secure_symlinks=
 for
+ daemon-no-chroot (CVE-2026-29518)
+
+CVE-2026-29518: an rsync daemon configured with "use chroot =3D no"
+is exposed to a TOCTOU race on parent path components. A local
+attacker with write access to a module can replace a parent
+directory component with a symlink between the receiver's check
+and its open(), redirecting reads (basis-file disclosure) and
+writes (file overwrite) outside the module. Under elevated daemon
+privilege this allows privilege escalation. Default
+"use chroot =3D yes" is not exposed.
+
+Add secure_relative_open() in syscall.c. It walks the parent
+components under RESOLVE_BENEATH (Linux 5.6+) /
+O_RESOLVE_BENEATH (FreeBSD 13+, macOS 15+) / per-component
+O_NOFOLLOW elsewhere, anchored at a trusted dirfd, so a parent-
+symlink swap is rejected by the kernel. Route the receiver's
+basis-file open in receiver.c through it when use_secure_symlinks
+is set in clientserver.c rsync_module().
+
+Reporters: Nullx3D (Batuhan SANCAK); Damien Neil; Michael Stapelberg.
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/f1=
c24ab03bc85cb2638a569faa60216582fb6c5d]
+
+(cherry picked from commit f1c24ab03bc85cb2638a569faa60216582fb6c5d)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ clientserver.c |  25 +++++++++
+ options.c      |   9 ++++
+ receiver.c     |  22 ++++++--
+ syscall.c      | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 192 insertions(+), 3 deletions(-)
+
+diff --git a/clientserver.c b/clientserver.c
+index 7c897abc..b6eba098 100644
+--- a/clientserver.c
++++ b/clientserver.c
+@@ -30,6 +30,7 @@ extern int list_only;
+ extern int am_sender;
+ extern int am_server;
+ extern int am_daemon;
++extern int am_chrooted;
+ extern int am_root;
+ extern int msgs2stderr;
+ extern int rsync_port;
+@@ -38,6 +39,7 @@ extern int ignore_errors;
+ extern int preserve_xattrs;
+ extern int kluge_around_eof;
+ extern int munge_symlinks;
++extern int use_secure_symlinks;
+ extern int open_noatime;
+ extern int sanitize_paths;
+ extern int numeric_ids;
+@@ -981,6 +983,7 @@ static int rsync_module(int f_in, int f_out, int i, co=
nst char *addr, const char
+                        io_printf(f_out, "@ERROR: chroot failed\n");
+                        return -1;
+                }
++              am_chrooted =3D 1;
+                module_chdir =3D module_dir;
+        }
+
+@@ -1003,6 +1006,15 @@ static int rsync_module(int f_in, int f_out, int i,=
 const char *addr, const char
+                }
+        }
+
++      /* Enable secure symlink handling for any non-chrooted daemon modul=
e.
++       * This prevents TOCTOU race attacks where an attacker could switch=
 a
++       * directory to a symlink between path validation and file open.
++       * Match the gate used by the do_*_at() wrappers in syscall.c
++       * (am_daemon && !am_chrooted) -- the protection has nothing to do
++       * with symlink munging, so a module configured with
++       * "munge symlinks =3D false" must still get the secure-open path. =
*/
++      use_secure_symlinks =3D am_daemon && !am_chrooted;
++
+        if (gid_list.count) {
+                gid_t *gid_array =3D gid_list.items;
+                if (setgid(gid_array[0])) {
+@@ -1305,6 +1317,19 @@ int start_daemon(int f_in, int f_out)
+                        rsyserr(FLOG, errno, "daemon chroot(\"%s\") failed=
", p);
+                        return -1;
+                }
++              /* Deliberately do NOT set am_chrooted here.  am_chrooted
++               * gates the per-module symlink-race defenses
++               * (secure_relative_open() and the do_*_at() wrappers in
++               * syscall.c) and means "the kernel is enforcing path
++               * confinement at the module boundary".  The daemon chroot
++               * confines path resolution to the daemon-chroot directory,
++               * not to any individual module path -- modules sharing the
++               * daemon chroot are still distinguishable filesystem
++               * subtrees and a sender-controlled symlink in module A
++               * could redirect a syscall to module B (or to other files
++               * inside the daemon chroot) without the per-module
++               * defenses.  Leave am_chrooted=3D0 here so secure_relative=
_open()
++               * still fires for "use chroot =3D no" modules. */
+                if (chdir("/") < 0) {
+                        rsyserr(FLOG, errno, "daemon chdir(\"/\") failed")=
;
+                        return -1;
+diff --git a/options.c b/options.c
+index 578507c6..87c91376 100644
+--- a/options.c
++++ b/options.c
+@@ -113,11 +113,20 @@ int mkpath_dest_arg =3D 0;
+ int allow_inc_recurse =3D 1;
+ int xfer_dirs =3D -1;
+ int am_daemon =3D 0;
++/* Set after a successful per-module chroot ("use chroot =3D yes") in
++ * clientserver.c. NOT set for the daemon-level "daemon chroot =3D /X"
++ * chroot: that confines path resolution to /X, but module paths
++ * /X/modA, /X/modB, etc. are not chroot boundaries, so the per-module
++ * symlink-race defenses (secure_relative_open() / do_*_at() in
++ * syscall.c, gated by `am_daemon && !am_chrooted`) must still fire
++ * even when the daemon is inside a daemon chroot. */
++int am_chrooted =3D 0;
+ int connect_timeout =3D 0;
+ int keep_partial =3D 0;
+ int safe_symlinks =3D 0;
+ int copy_unsafe_links =3D 0;
+ int munge_symlinks =3D 0;
++int use_secure_symlinks =3D 0;
+ int size_only =3D 0;
+ int daemon_bwlimit =3D 0;
+ int bwlimit =3D 0;
+diff --git a/receiver.c b/receiver.c
+index edfbb210..5a2c8c5a 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -70,6 +70,7 @@ extern int fuzzy_basis;
+
+ extern struct name_num_item *xfer_sum_nni;
+ extern int xfer_sum_len;
++extern int use_secure_symlinks;
+
+ static struct bitbag *delayed_bits =3D NULL;
+ static int phase =3D 0, redoing =3D 0;
+@@ -214,7 +215,12 @@ int open_tmpfile(char *fnametmp, const char *fname, s=
truct file_struct *file)
+         * access to ensure that there is no race condition.  They will be
+         * correctly updated after the right owner and group info is set.
+         * (Thanks to snabb@epipe.fi for pointing this out.) */
+-      fd =3D do_mkstemp(fnametmp, (file->mode|added_perms) & INITACCESSPE=
RMS);
++      /* When use_secure_symlinks is on (non-chroot daemon with munge_sym=
links),
++       * use secure_mkstemp to prevent symlink race attacks on parent dir=
ectories. */
++      if (use_secure_symlinks)
++              fd =3D secure_mkstemp(fnametmp, (file->mode|added_perms) & =
INITACCESSPERMS);
++      else
++              fd =3D do_mkstemp(fnametmp, (file->mode|added_perms) & INIT=
ACCESSPERMS);
+
+ #if 0
+        /* In most cases parent directories will already exist because the=
ir
+@@ -854,11 +860,21 @@ int recv_files(int f_in, int f_out, char *local_name=
)
+                /* We now check to see if we are writing the file "inplace=
" */
+                if (inplace || one_inplace)  {
+                        fnametmp =3D one_inplace ? partialptr : fname;
+-                      fd2 =3D do_open(fnametmp, O_WRONLY|O_CREAT, 0600);
++                      /* When use_secure_symlinks is on (non-chroot daemo=
n),
++                       * use secure open to prevent symlink race attacks =
where an
++                       * attacker could switch a directory to a symlink b=
etween
++                       * path validation and file open. */
++                      if (use_secure_symlinks)
++                              fd2 =3D secure_relative_open(NULL, fnametmp=
, O_WRONLY|O_CREAT, 0600);
++                      else
++                              fd2 =3D do_open(fnametmp, O_WRONLY|O_CREAT,=
 0600);
+ #ifdef linux
+                        if (fd2 =3D=3D -1 && errno =3D=3D EACCES) {
+                                /* Maybe the error was due to protected_re=
gular setting? */
+-                              fd2 =3D do_open(fname, O_WRONLY, 0600);
++                              if (use_secure_symlinks)
++                                      fd2 =3D secure_relative_open(NULL, =
fname, O_WRONLY, 0600);
++                              else
++                                      fd2 =3D do_open(fname, O_WRONLY, 06=
00);
+                        }
+ #endif
+                        if (fd2 =3D=3D -1) {
+diff --git a/syscall.c b/syscall.c
+index 9033196f..dcecda1a 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -877,6 +877,145 @@ cleanup:
+ #endif // O_NOFOLLOW, O_DIRECTORY
+ }
+
++/* Fill buf with len random bytes.  Prefers /dev/urandom for cryptographi=
c
++ * quality; falls back to rand() if /dev/urandom cannot be opened or read
++ * (e.g. inside a chroot or container without /dev populated). */
++static void rand_bytes(unsigned char *buf, size_t len)
++{
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++      int fd =3D open("/dev/urandom", O_RDONLY | O_CLOEXEC);
++      if (fd >=3D 0) {
++              ssize_t n =3D read(fd, buf, len);
++              close(fd);
++              if (n =3D=3D (ssize_t)len) {
++                      return;
++              }
++      }
++      for (size_t i =3D 0; i < len; i++) {
++              buf[i] =3D (unsigned char)rand();
++      }
++}
++
++/*
++  Secure version of mkstemp that prevents symlink attacks on parent direc=
tories.
++  Like secure_relative_open(), this walks the path checking each componen=
t
++  with O_NOFOLLOW to prevent TOCTOU race conditions.
++
++  The template may be relative or absolute, but must not contain ../ comp=
onents.
++  Returns fd on success, -1 on error.
++*/
++int secure_mkstemp(char *template, mode_t perms)
++{
++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)
++      /* Fall back to regular mkstemp on old systems */
++      return do_mkstemp(template, perms);
++#else
++      char *lastslash;
++      int dirfd =3D AT_FDCWD;
++      int fd =3D -1;
++
++      if (!template) {
++              errno =3D EINVAL;
++              return -1;
++      }
++      if (strncmp(template, "../", 3) =3D=3D 0 || strstr(template, "/../"=
)) {
++              errno =3D EINVAL;
++              return -1;
++      }
++
++      /* For absolute paths, start the secure walk from "/" rather than C=
WD. */
++      if (template[0] =3D=3D '/') {
++              dirfd =3D open("/", O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++              if (dirfd < 0)
++                      return -1;
++      }
++
++      /* Find the last slash to separate directory from filename */
++      lastslash =3D strrchr(template, '/');
++      if (lastslash) {
++              char *path_copy =3D my_strdup(template, __FILE__, __LINE__)=
;
++              if (!path_copy)
++                      return -1;
++
++              /* Null-terminate at the last slash to get directory part *=
/
++              path_copy[lastslash - template] =3D '\0';
++
++              /* Walk the directory path securely */
++              for (const char *part =3D strtok(path_copy, "/");
++                   part !=3D NULL;
++                   part =3D strtok(NULL, "/"))
++              {
++                      int next_fd =3D openat(dirfd, part, O_RDONLY | O_DI=
RECTORY | O_NOFOLLOW);
++                      if (next_fd =3D=3D -1) {
++                              int save_errno =3D errno;
++                              free(path_copy);
++                              if (dirfd !=3D AT_FDCWD) close(dirfd);
++                              errno =3D (save_errno =3D=3D ELOOP) ? ELOOP=
 : save_errno;
++                              return -1;
++                      }
++                      if (dirfd !=3D AT_FDCWD) close(dirfd);
++                      dirfd =3D next_fd;
++              }
++              free(path_copy);
++      }
++
++      /* Now create the temp file in the securely-opened directory */
++      perms |=3D S_IWUSR;
++
++      /* Generate unique filename - we need to modify the template in pla=
ce */
++      char *filename =3D lastslash ? lastslash + 1 : template;
++      size_t filename_len =3D strlen(filename);
++
++      if (filename_len < 6) {
++              if (dirfd !=3D AT_FDCWD) close(dirfd);
++              errno =3D EINVAL;
++              return -1;
++      }
++      char *suffix =3D filename + filename_len - 6; /* Points to XXXXXX *=
/
++      if (strcmp(suffix, "XXXXXX") !=3D 0) {
++              if (dirfd !=3D AT_FDCWD) close(dirfd);
++              errno =3D EINVAL;
++              return -1;
++      }
++
++      /* Try random suffixes until we find one that works */
++      static const char letters[] =3D "abcdefghijklmnopqrstuvwxyzABCDEFGH=
IJKLMNOPQRSTUVWXYZ0123456789";
++      for (int tries =3D 0; tries < 100; tries++) {
++              unsigned char rbytes[6];
++              rand_bytes(rbytes, sizeof(rbytes));
++              for (int i =3D 0; i < 6; i++)
++                      suffix[i] =3D letters[rbytes[i] % (sizeof(letters) =
- 1)];
++
++              fd =3D openat(dirfd, filename, O_RDWR | O_CREAT | O_EXCL | =
O_NOFOLLOW, perms);
++              if (fd >=3D 0)
++                      break;
++              if (errno !=3D EEXIST) {
++                      if (dirfd !=3D AT_FDCWD) close(dirfd);
++                      return -1;
++              }
++      }
++
++      if (fd >=3D 0) {
++              if (fchmod(fd, perms) !=3D 0 && preserve_perms) {
++                      int errno_save =3D errno;
++                      close(fd);
++                      unlinkat(dirfd, filename, 0);
++                      if (dirfd !=3D AT_FDCWD) close(dirfd);
++                      errno =3D errno_save;
++                      return -1;
++              }
++#if defined HAVE_SETMODE && O_BINARY
++              setmode(fd, O_BINARY);
++#endif
++      }
++
++      if (dirfd !=3D AT_FDCWD) close(dirfd);
++      return fd;
++#endif
++}
++
+ /*
+   varient of do_open/do_open_nofollow which does do_open() if the
+   copy_links or copy_unsafe_links options are set and does
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch
new file mode 100644
index 0000000000..ba9ef808b4
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch
@@ -0,0 +1,71 @@
+From 302e3116633ed953e0c1cc2d6878d7a22b6bf9b8 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sun, 1 Mar 2026 09:28:40 +1100
+Subject: [PATCH] sender: fix read-path TOCTOU by opening from module root
+ (CVE-2026-29518)
+
+The sender's file open was vulnerable to the same TOCTOU symlink
+race as the receiver-side basis-file open. change_pathname() calls
+chdir() into subdirectories, which follows symlinks; an attacker
+could race to swap a directory for a symlink between the chdir and
+the file open, allowing reads of privileged files through the
+daemon.
+
+Reconstruct the full relative path (F_PATHNAME + fname) and open
+via secure_relative_open() from the trusted module_dir, which
+walks each path component without following symlinks. This is
+independent of CWD, so the chdir race is neutralised.
+
+CVE-2026-29518.
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-29518
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/85=
9d44fa4f1420775e4ba050337ef32092f2894c]
+
+(cherry picked from commit 859d44fa4f1420775e4ba050337ef32092f2894c)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ sender.c | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/sender.c b/sender.c
+index b1588b70..99f431fe 100644
+--- a/sender.c
++++ b/sender.c
+@@ -48,6 +48,8 @@ extern int make_backups;
+ extern int inplace;
+ extern int inplace_partial;
+ extern int batch_fd;
++extern int use_secure_symlinks;
++extern char *module_dir;
+ extern int write_batch;
+ extern int file_old_total;
+ extern BOOL want_progress_now;
+@@ -352,7 +354,25 @@ void send_files(int f_in, int f_out)
+                        exit_cleanup(RERR_PROTOCOL);
+                }
+
+-              fd =3D do_open_checklinks(fname);
++              if (use_secure_symlinks) {
++                      /* Open from module root to prevent TOCTOU race whe=
re
++                       * change_pathname's chdir follows a directory syml=
ink.
++                       * Reconstruct the full path relative to module_dir
++                       * from F_PATHNAME (path) and f_name (fname). */
++                      char secure_path[MAXPATHLEN];
++                      int slen =3D snprintf(secure_path, sizeof secure_pa=
th, "%s%s%s", path, slash, fname);
++                      if (slen >=3D (int)sizeof secure_path) {
++                              io_error |=3D IOERR_GENERAL;
++                              rprintf(FERROR_XFER, "path too long: %s%s%s=
\n", path, slash, fname);
++                              free_sums(s);
++                              if (protocol_version >=3D 30)
++                                      send_msg_int(MSG_NO_SEND, ndx);
++                              continue;
++                      }
++                      fd =3D secure_relative_open(module_dir, secure_path=
, O_RDONLY, 0);
++              } else {
++                      fd =3D do_open_checklinks(fname);
++              }
+                if (fd =3D=3D -1) {
+                        if (errno =3D=3D ENOENT) {
+                                enum logcode c =3D am_daemon && protocol_v=
ersion < 28 ? FERROR : FWARNING;
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb
index 509be486b8..e2fe0128d5 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -16,6 +16,10 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/$=
{BP}.tar.gz \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.pat=
ch \
            file://CVE-2025-10158.patch \
+           file://CVE-2026-29518_p1.patch \
+           file://CVE-2026-29518_p2.patch \
+           file://CVE-2026-29518_p3.patch \
+           file://CVE-2026-29518_p4.patch \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf6=
9850d65fd88c52"

--
2.35.6

--_000_PH0PR11MB59027477B501C6421A69E289CFC62PH0PR11MB5902namp_
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
<b>Subject:</b> [wrynose][PATCH v2 1/6] rsync: Fix CVE-2026-29518</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
This patch backports the upstream rsync v3.4.3 security fix train for<br>
CVE-2026-29518. The direct CVE fixes are [3] and [4]:<br>
<br>
- [3] enables secure_relative_open() for daemon modules running with<br>
&nbsp; &quot;use chroot =3D no&quot;, closing the receiver-side basis-file =
TOCTOU.<br>
- [4] routes the sender read path through secure_relative_open() from<br>
&nbsp; the trusted module root, closing the matching sender-side TOCTOU.<br=
>
<br>
This patch also carries [1] and [2] from the same upstream v3.4.3<br>
security/update train. These are supporting secure_relative_open()<br>
changes, not standalone direct CVE fixes: [1] uses Linux<br>
openat2(RESOLVE_BENEATH) to preserve the same confinement while allowing<br=
>
legitimate in-tree symlinks, fixing upstream issue #715; [2] adds the<br>
equivalent FreeBSD/macOS O_RESOLVE_BENEATH path. Debian's<br>
rsync 3.4.1+ds1-5+deb13u3 security update also carries these commits<br>
before the direct CVE-2026-29518 commits.<br>
<br>
The upstream fixed release is referenced in [5], and the public CVE<br>
record is referenced in [6]. Individual backported commit links are<br>
also recorded in the embedded patch headers.<br>
<br>
[1] <a href=3D"https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad3=
4b034d18fe2fd6cd79adef8a1">
https://github.com/RsyncProject/rsync/commit/4fa7156ccdb2ad34b034d18fe2fd6c=
d79adef8a1</a><br>
[2] <a href=3D"https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63=
b770707ec8b829524c3809a43">
https://github.com/RsyncProject/rsync/commit/7f60ec001a0be63b770707ec8b8295=
24c3809a43</a><br>
[3] <a href=3D"https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb=
2638a569faa60216582fb6c5d">
https://github.com/RsyncProject/rsync/commit/f1c24ab03bc85cb2638a569faa6021=
6582fb6c5d</a><br>
[4] <a href=3D"https://github.com/RsyncProject/rsync/commit/859d44fa4f14207=
75e4ba050337ef32092f2894c">
https://github.com/RsyncProject/rsync/commit/859d44fa4f1420775e4ba050337ef3=
2092f2894c</a><br>
[5] <a href=3D"https://github.com/RsyncProject/rsync/releases/tag/v3.4.3">h=
ttps://github.com/RsyncProject/rsync/releases/tag/v3.4.3</a><br>
[6] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2026-29518">https://w=
ww.cve.org/CVERecord?id=3DCVE-2026-29518</a><br>
<br>
Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
---<br>
&nbsp;.../rsync/files/CVE-2026-29518_p1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 392 ++++++++++++++++++<br>
&nbsp;.../rsync/files/CVE-2026-29518_p2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 98 +++++<br>
&nbsp;.../rsync/files/CVE-2026-29518_p3.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 328 +++++++++++++++<br>
&nbsp;.../rsync/files/CVE-2026-29518_p4.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 71 ++++<br>
&nbsp;meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 4 +<br>
&nbsp;5 files changed, 893 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p=
1.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p=
2.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p=
3.patch<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p=
4.patch<br>
<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch<br>
new file mode 100644<br>
index 0000000000..fcb7b777fe<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch<br>
@@ -0,0 +1,392 @@<br>
+From e7b575413b962ac042079a55530577b20c7eee44 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Thu, 30 Apr 2026 08:39:22 +1000<br>
+Subject: [PATCH] syscall: use openat2(RESOLVE_BENEATH) on Linux for<br>
+ secure_relative_open<br>
+<br>
+The CVE fix in commit c35e283 made secure_relative_open() walk every<br>
+component of relpath with O_NOFOLLOW. That blocks every symlink in the<br>
+path, which is stricter than the threat model required: legitimate<br>
+directory symlinks within the destination tree (e.g. when using -K /<br>
+--copy-dirlinks) are also rejected, breaking delta transfers with<br>
+&quot;failed verification -- update discarded&quot;.&nbsp; See issue #715.=
<br>
+<br>
+On Linux 5.6+, openat2(RESOLVE_BENEATH | RESOLVE_NO_MAGICLINKS) gives<br>
+us exactly what we want: the kernel rejects any resolution that would<br>
+escape the starting directory (via &quot;..&quot;, absolute paths, or syml=
inks<br>
+pointing outside dirfd) while still following symlinks that resolve<br>
+within it. /proc magic-links are blocked too.<br>
+<br>
+Use openat2 first; fall back to the existing per-component O_NOFOLLOW<br>
+walk on ENOSYS (kernel &lt; 5.6). The lexical &quot;../&quot; checks at th=
e head<br>
+of the function are kept as defense in depth. The Linux gate is<br>
+plain #ifdef __linux__: the runtime ENOSYS fallback covers the only<br>
+case that actually matters (header present + old kernel), and any<br>
+Linux build environment without linux/openat2.h will fail with a<br>
+clear &quot;no such file&quot; error rather than silently disabling the<br=
>
+protection.<br>
+<br>
+Verified manually that openat2(RESOLVE_BENEATH) blocks all four<br>
+escape patterns (absolute symlink, ../ symlink, lexical .., absolute<br>
+path) while allowing direct and within-tree symlinks. The new<br>
+testsuite/symlink-dirlink-basis.test (taken from PR #864 by Samuel<br>
+Henrique) exercises the issue #715 regression and passes; full<br>
+make check passes 47/47.<br>
+<br>
+Test: testsuite/symlink-dirlink-basis.test (8 scenarios)<br>
+Fixes: <a href=3D"https://github.com/RsyncProject/rsync/issues/715">https:=
//github.com/RsyncProject/rsync/issues/715</a><br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-29518<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1">https://github.com/Rsync=
Project/rsync/commit/4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1</a>]<br>
+<br>
+(cherry picked from commit 4fa7156ccdb2ad34b034d18fe2fd6cd79adef8a1)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ syscall.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 62 ++++++-<br>
+ testsuite/symlink-dirlink-basis.test | 247 +++++++++++++++++++++++++++<br=
>
+ 2 files changed, 304 insertions(+), 5 deletions(-)<br>
+ create mode 100755 testsuite/symlink-dirlink-basis.test<br>
+<br>
+diff --git a/syscall.c b/syscall.c<br>
+index 34a9bba0..d66c9fdd 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -33,6 +33,11 @@<br>
+ #include &lt;sys/syscall.h&gt;<br>
+ #endif<br>
+ <br>
++#ifdef __linux__<br>
++#include &lt;sys/syscall.h&gt;<br>
++#include &lt;linux/openat2.h&gt;<br>
++#endif<br>
++<br>
+ #include &quot;ifuncs.h&quot;<br>
+ <br>
+ extern int dry_run;<br>
+@@ -715,12 +720,49 @@ int do_open_nofollow(const char *pathname, int flags=
)<br>
+ /*<br>
+&nbsp;&nbsp; open a file relative to a base directory. The basedir can be =
NULL,<br>
+&nbsp;&nbsp; in which case the current working directory is used. The relp=
ath<br>
+-&nbsp; must be a relative path, and the relpath must not contain any<br>
+-&nbsp; elements in the path which follow symlinks (ie. like O_NOFOLLOW, b=
ut<br>
+-&nbsp; applies to all path components, not just the last component)<br>
+-<br>
+-&nbsp; The relpath must also not contain any ../ elements in the path<br>
++&nbsp; must be a relative path. The kernel must guarantee that resolution=
<br>
++&nbsp; cannot escape basedir (or the cwd, when basedir is NULL): no &quot=
;..&quot;<br>
++&nbsp; jumps above the start, no symlinks pointing outside, no absolute<b=
r>
++&nbsp; paths, no /proc magic-link tricks.<br>
++<br>
++&nbsp; Symlinks *within* basedir are followed normally =97 earlier rsync<=
br>
++&nbsp; versions rejected every symlink with O_NOFOLLOW on each component,=
<br>
++&nbsp; which broke legitimate directory symlinks on the receiver side<br>
++&nbsp; (<a href=3D"https://github.com/RsyncProject/rsync/issues/715">http=
s://github.com/RsyncProject/rsync/issues/715</a>). The escape<br>
++&nbsp; prevention is handled by the kernel via openat2(RESOLVE_BENEATH)<b=
r>
++&nbsp; on Linux 5.6+; older systems fall back to the per-component<br>
++&nbsp; O_NOFOLLOW walk below.<br>
++<br>
++&nbsp; The relpath must also not contain any ../ elements in the path.<br=
>
+ */<br>
++<br>
++#ifdef __linux__<br>
++static int secure_relative_open_linux(const char *basedir, const char *re=
lpath, int flags, mode_t mode)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct open_how how;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dirfd, retfd;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;how, 0, sizeof how);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; how.flags =3D flags;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; how.mode =3D mode;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; how.resolve =3D RESOLVE_BENEATH | RESOLVE_=
NO_MAGICLINKS;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (basedir =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D AT_FDCWD;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd =3D=3D -1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retfd =3D syscall(SYS_openat2, dirfd, relp=
ath, &amp;how, sizeof how);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDCWD)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return retfd;<br>
++}<br>
++#endif<br>
++<br>
+ int secure_relative_open(const char *basedir, const char *relpath, int fl=
ags, mode_t mode)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!relpath || relpath[0] =3D=
=3D '/') {<br>
+@@ -734,6 +776,16 @@ int secure_relative_open(const char *basedir, const c=
har *relpath, int flags, mo<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
++#ifdef __linux__<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int fd =3D secure_relative_open_linux(basedir, relpath, flags, mode);=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* ENOSYS =3D kernel &lt; 5.6 doesn't have the syscall even though<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * glibc/kernel-headers do; fall through to the portable path. *=
/<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fd !=3D -1 || errno !=3D ENOSYS)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return fd;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++#endif<br>
++<br>
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // really old system, all we ca=
n do is live with the risks<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!basedir) {<br>
+diff --git a/testsuite/symlink-dirlink-basis.test b/testsuite/symlink-dirl=
ink-basis.test<br>
+new file mode 100755<br>
+index 00000000..9065dd81<br>
+--- /dev/null<br>
++++ b/testsuite/symlink-dirlink-basis.test<br>
+@@ -0,0 +1,247 @@<br>
++#!/bin/sh<br>
++<br>
++# Test that updating a file through a directory symlink works when using<=
br>
++# -K (--copy-dirlinks). This is a regression test for:<br>
++#&nbsp;&nbsp; <a href=3D"https://github.com/RsyncProject/rsync/issues/715=
">https://github.com/RsyncProject/rsync/issues/715</a><br>
++#<br>
++# The CVE fix in commit c35e283 introduced secure_relative_open() which<b=
r>
++# uses O_NOFOLLOW on all path components, breaking legitimate directory<b=
r>
++# symlinks on the receiver side. The fix splits the path into basedir<br>
++# (dirname, symlinks followed) and basename (O_NOFOLLOW) so that<br>
++# directory symlinks are traversed while the final file component is<br>
++# still protected.<br>
++#<br>
++# The regression only manifests when delta matching is triggered (i.e.,<b=
r>
++# the sender finds matching blocks in the old file). Small files with<br>
++# completely different content are transferred in full and don't trigger<=
br>
++# the bug. We use a large file with a small modification to ensure<br>
++# delta transfer is used.<br>
++#<br>
++# In addition to the original regression, this test covers edge cases<br>
++# in the fix itself:<br>
++#&nbsp;&nbsp; - --backup with directory symlinks (finish_transfer pointer=
 identity)<br>
++#&nbsp;&nbsp; - --partial-dir with protocol &lt; 29 (fnamecmp !=3D partia=
lptr guard)<br>
++#&nbsp;&nbsp; - --inplace with directory symlinks (updating_basis_or_equi=
v check)<br>
++#&nbsp;&nbsp; - Files without a dirname (top-level files, no split needed=
)<br>
++<br>
++. &quot;$suitedir/rsync.fns&quot;<br>
++<br>
++RSYNC_RSH=3D&quot;$scratchdir/src/support/lsh.sh&quot;<br>
++export RSYNC_RSH<br>
++<br>
++# $HOME is set to $scratchdir by rsync.fns<br>
++# localhost: destination will cd to $HOME (i.e., $scratchdir)<br>
++<br>
++# Helper: create a large file suitable for delta transfers.<br>
++# ~32KB is large enough for rsync's block matching to find matches.<br>
++make_testfile() {<br>
++&nbsp;&nbsp;&nbsp; dd if=3D/dev/urandom of=3D&quot;$1&quot; bs=3D1024 cou=
nt=3D32 2&gt;/dev/null \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || test_fail &quot;failed to create test f=
ile $1&quot;<br>
++}<br>
++<br>
++# Set up source tree<br>
++srcbase=3D&quot;$tmpdir/src&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 1: Basic directory symlink update (the original issue #715)<br>
++######################################################################<br=
>
++<br>
++mkdir -p &quot;$HOME/real-dir&quot;<br>
++ln -s real-dir &quot;$HOME/dir&quot;<br>
++<br>
++mkdir -p &quot;$srcbase/dir&quot;<br>
++make_testfile &quot;$srcbase/dir/file&quot;<br>
++<br>
++# First transfer (initial): should create the file through the symlink<br=
>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --rsync-path=3D&quot;$=
RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 1: initial transfer failed&quo=
t;<br>
++<br>
++if [ ! -f &quot;$HOME/real-dir/file&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;test 1: initial transfer did not creat=
e file through symlink&quot;<br>
++fi<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 1: initial transfer content mi=
smatch&quot;<br>
++<br>
++# Small modification to trigger delta transfer<br>
++echo &quot;appended update&quot; &gt;&gt; &quot;$srcbase/dir/file&quot;<b=
r>
++sleep 1<br>
++touch &quot;$srcbase/dir/file&quot;<br>
++<br>
++# Second transfer (update): was failing with &quot;failed verification&qu=
ot;<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --rsync-path=3D&quot;$=
RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 1: update through directory sy=
mlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 1: update transfer content mis=
match&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 2: Compression (-z) as in the original reproducer<br>
++######################################################################<br=
>
++<br>
++echo &quot;another line&quot; &gt;&gt; &quot;$srcbase/dir/file&quot;<br>
++sleep 1<br>
++touch &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptzv --rsync-path=3D&quot;=
$RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 2: compressed update through d=
irectory symlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 2: compressed update content m=
ismatch&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 3: Nested directory symlinks (nested/sub/data.txt where<br>
++#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;nested&quot=
; is a symlink to &quot;nested_real&quot;)<br>
++######################################################################<br=
>
++<br>
++mkdir -p &quot;$HOME/nested_real/sub&quot;<br>
++ln -s nested_real &quot;$HOME/nested&quot;<br>
++<br>
++mkdir -p &quot;$srcbase/nested/sub&quot;<br>
++make_testfile &quot;$srcbase/nested/sub/data.txt&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --rsync-path=3D&quot;$=
RSYNC&quot; nested/sub/data.txt localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 3: initial nested transfer fai=
led&quot;<br>
++<br>
++echo &quot;appended nested&quot; &gt;&gt; &quot;$srcbase/nested/sub/data.=
txt&quot;<br>
++sleep 1<br>
++touch &quot;$srcbase/nested/sub/data.txt&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --rsync-path=3D&quot;$=
RSYNC&quot; nested/sub/data.txt localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 3: update through nested direc=
tory symlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/nested/sub/data.txt&quot; &quot;$HOME/nested_real/sub=
/data.txt&quot; &gt;/dev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 3: nested update content misma=
tch&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 4: --backup with directory symlinks<br>
++#<br>
++# Exercises the finish_transfer() &quot;fnamecmp =3D=3D fname&quot; point=
er<br>
++# comparison that determines whether to update fnamecmp to the<br>
++# backup name. If broken, --backup would reference a renamed file<br>
++# for xattr handling.<br>
++######################################################################<br=
>
++<br>
++# Reset destination<br>
++rm -f &quot;$HOME/real-dir/file&quot; &quot;$HOME/real-dir/file~&quot;<br=
>
++<br>
++make_testfile &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --rsync-path=3D&quot;$=
RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 4: initial transfer for backup=
 test failed&quot;<br>
++<br>
++echo &quot;backup update&quot; &gt;&gt; &quot;$srcbase/dir/file&quot;<br>
++sleep 1<br>
++touch &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --backup --rsync-path=
=3D&quot;$RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 4: update with --backup throug=
h directory symlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 4: backup update content misma=
tch&quot;<br>
++<br>
++if [ ! -f &quot;$HOME/real-dir/file~&quot; ]; then<br>
++&nbsp;&nbsp;&nbsp; test_fail &quot;test 4: backup file was not created&qu=
ot;<br>
++fi<br>
++<br>
++######################################################################<br=
>
++# Test 5: --inplace with directory symlinks<br>
++#<br>
++# Exercises the updating_basis_or_equiv check which uses<br>
++# &quot;fnamecmp =3D=3D fname&quot;. With --inplace, rsync writes directl=
y to<br>
++# the destination file instead of a temp file.<br>
++######################################################################<br=
>
++<br>
++rm -f &quot;$HOME/real-dir/file&quot; &quot;$HOME/real-dir/file~&quot;<br=
>
++<br>
++make_testfile &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --inplace --rsync-path=
=3D&quot;$RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 5: initial inplace transfer fa=
iled&quot;<br>
++<br>
++echo &quot;inplace update&quot; &gt;&gt; &quot;$srcbase/dir/file&quot;<br=
>
++sleep 1<br>
++touch &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --inplace --rsync-path=
=3D&quot;$RSYNC&quot; dir/file localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 5: inplace update through dire=
ctory symlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 5: inplace update content mism=
atch&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 6: Top-level file (no dirname, no split needed)<br>
++#<br>
++# Ensures the dirname/basename split is not attempted for files<br>
++# at the top level (file-&gt;dirname is NULL).<br>
++######################################################################<br=
>
++<br>
++make_testfile &quot;$srcbase/topfile&quot;<br>
++mkdir -p &quot;$HOME&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -Rlptv --rsync-path=3D&quot;$R=
SYNC&quot; topfile localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 6: initial top-level transfer =
failed&quot;<br>
++<br>
++echo &quot;toplevel update&quot; &gt;&gt; &quot;$srcbase/topfile&quot;<br=
>
++sleep 1<br>
++touch &quot;$srcbase/topfile&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -Rlptv --rsync-path=3D&quot;$R=
SYNC&quot; topfile localhost:) \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 6: top-level update failed&quo=
t;<br>
++<br>
++diff &quot;$srcbase/topfile&quot; &quot;$HOME/topfile&quot; &gt;/dev/null=
 \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 6: top-level update content mi=
smatch&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 7: --partial-dir with protocol &lt; 29<br>
++#<br>
++# For protocol &lt; 29, fnamecmp_type stays FNAMECMP_FNAME even when<br>
++# fnamecmp is set to partialptr. The dirname/basename split must<br>
++# NOT trigger in this case (guarded by &quot;fnamecmp =3D=3D fname&quot;)=
.<br>
++######################################################################<br=
>
++<br>
++rm -f &quot;$HOME/real-dir/file&quot;<br>
++make_testfile &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --protocol=3D28 --part=
ial-dir=3D.rsync-partial \<br>
++&nbsp;&nbsp;&nbsp; --rsync-path=3D&quot;$RSYNC&quot; dir/file localhost:)=
 \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 7: initial proto28 partial-dir=
 transfer failed&quot;<br>
++<br>
++echo &quot;partial-dir update&quot; &gt;&gt; &quot;$srcbase/dir/file&quot=
;<br>
++sleep 1<br>
++touch &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --protocol=3D28 --part=
ial-dir=3D.rsync-partial \<br>
++&nbsp;&nbsp;&nbsp; --rsync-path=3D&quot;$RSYNC&quot; dir/file localhost:)=
 \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 7: proto28 partial-dir update =
through dirlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 7: proto28 partial-dir update =
content mismatch&quot;<br>
++<br>
++######################################################################<br=
>
++# Test 8: Protocol &lt; 29 basic directory symlink update<br>
++#<br>
++# Exercises the protocol &lt; 29 code path and its fallback logic<br>
++# (clearing basedir on retry).<br>
++######################################################################<br=
>
++<br>
++rm -f &quot;$HOME/real-dir/file&quot;<br>
++make_testfile &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --protocol=3D28 \<br>
++&nbsp;&nbsp;&nbsp; --rsync-path=3D&quot;$RSYNC&quot; dir/file localhost:)=
 \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 8: initial proto28 transfer fa=
iled&quot;<br>
++<br>
++echo &quot;proto28 update&quot; &gt;&gt; &quot;$srcbase/dir/file&quot;<br=
>
++sleep 1<br>
++touch &quot;$srcbase/dir/file&quot;<br>
++<br>
++(cd &quot;$srcbase&quot; &amp;&amp; $RSYNC -KRlptv --protocol=3D28 \<br>
++&nbsp;&nbsp;&nbsp; --rsync-path=3D&quot;$RSYNC&quot; dir/file localhost:)=
 \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 8: proto28 update through dire=
ctory symlink failed&quot;<br>
++<br>
++diff &quot;$srcbase/dir/file&quot; &quot;$HOME/real-dir/file&quot; &gt;/d=
ev/null \<br>
++&nbsp;&nbsp;&nbsp; || test_fail &quot;test 8: proto28 update content mism=
atch&quot;<br>
++<br>
++# The script would have aborted on error, so getting here means we've won=
.<br>
++exit 0<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch<br>
new file mode 100644<br>
index 0000000000..661f23db76<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch<br>
@@ -0,0 +1,98 @@<br>
+From 0675997f170b6463dd20306ee97e346e79196335 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Thu, 30 Apr 2026 08:44:11 +1000<br>
+Subject: [PATCH] syscall: also use O_RESOLVE_BENEATH on FreeBSD and MacOS<=
br>
+<br>
+FreeBSD and MacOS have O_RESOLVE_BENEATH as an openat() flag with the same=
<br>
+&quot;must not escape dirfd&quot; semantics as Linux's RESOLVE_BENEATH. Th=
e<br>
+kernel rejects &quot;..&quot; escapes, absolute symlinks, and symlinks who=
se<br>
+target lies outside dirfd, while still following symlinks that<br>
+resolve within it -- the same trade-off that fixes issue #715 on<br>
+Linux.<br>
+<br>
+Add a parallel BSD path in secure_relative_open(), gated on<br>
+declared. Unlike Linux, BSD doesn't have the header/runtime split<br>
+where the symbol can exist without kernel support, so no runtime<br>
+fallback is needed: if the flag compiles in, the kernel honours it.<br>
+<br>
+OpenBSD and NetBSD have no equivalent kernel primitive and continue<br>
+to use the existing per-component O_NOFOLLOW walk; issue #715<br>
+remains visible on those platforms (a userland resolver or<br>
+unveil(2)-based fence would be follow-up work).<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-29518<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/7f60ec001a0be63b770707ec8b829524c3809a43">https://github.com/Rsync=
Project/rsync/commit/7f60ec001a0be63b770707ec8b829524c3809a43</a>]<br>
+<br>
+(cherry picked from commit 7f60ec001a0be63b770707ec8b829524c3809a43)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ syscall.c | 40 +++++++++++++++++++++++++++++++++++++---<br>
+ 1 file changed, 37 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/syscall.c b/syscall.c<br>
+index d66c9fdd..9033196f 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -729,9 +729,13 @@ int do_open_nofollow(const char *pathname, int flags)=
<br>
+&nbsp;&nbsp; versions rejected every symlink with O_NOFOLLOW on each compo=
nent,<br>
+&nbsp;&nbsp; which broke legitimate directory symlinks on the receiver sid=
e<br>
+&nbsp;&nbsp; (<a href=3D"https://github.com/RsyncProject/rsync/issues/715"=
>https://github.com/RsyncProject/rsync/issues/715</a>). The escape<br>
+-&nbsp; prevention is handled by the kernel via openat2(RESOLVE_BENEATH)<b=
r>
+-&nbsp; on Linux 5.6+; older systems fall back to the per-component<br>
+-&nbsp; O_NOFOLLOW walk below.<br>
++&nbsp; prevention is handled by:<br>
++&nbsp;&nbsp;&nbsp; Linux 5.6+:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openat2(RESOLVE_BENEATH)<br=
>
++&nbsp;&nbsp;&nbsp; FreeBSD 13+:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openat() with O_RESOLVE_BENEATH<=
br>
++&nbsp;&nbsp;&nbsp; macOS 15+ / iOS 18+:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; openat() with O_RESOLVE_BENEATH (same<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flag name, picked up by the same #ifdef;<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flag value differs from FreeBSD)<br>
++&nbsp; Other systems fall back to the per-component O_NOFOLLOW walk below=
.<br>
+ <br>
+&nbsp;&nbsp; The relpath must also not contain any ../ elements in the pat=
h.<br>
+ */<br>
+@@ -763,6 +767,32 @@ static int secure_relative_open_linux(const char *bas=
edir, const char *relpath,<br>
+ }<br>
+ #endif<br>
+ <br>
++#ifdef O_RESOLVE_BENEATH<br>
++/* FreeBSD 13+ and macOS 15+ (Sequoia) / iOS 18+: O_RESOLVE_BENEATH is<br=
>
++ * an openat() flag with the same &quot;must not escape dirfd&quot; seman=
tics as<br>
++ * Linux's RESOLVE_BENEATH. The kernel rejects &quot;..&quot; escapes, ab=
solute<br>
++ * symlinks, and symlinks whose target lies outside dirfd. (FreeBSD and<b=
r>
++ * Apple use different flag bit values, but the same symbolic name.) */<b=
r>
++static int secure_relative_open_resolve_beneath(const char *basedir, cons=
t char *relpath, int flags, mode_t mode)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dirfd, retfd;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (basedir =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D AT_FDCWD;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd =3D=3D -1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retfd =3D openat(dirfd, relpath, flags | O=
_RESOLVE_BENEATH, mode);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDCWD)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return retfd;<br>
++}<br>
++#endif<br>
++<br>
+ int secure_relative_open(const char *basedir, const char *relpath, int fl=
ags, mode_t mode)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!relpath || relpath[0] =3D=
=3D '/') {<br>
+@@ -786,6 +816,10 @@ int secure_relative_open(const char *basedir, const c=
har *relpath, int flags, mo<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+ <br>
++#ifdef O_RESOLVE_BENEATH<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return secure_relative_open_resolve_beneat=
h(basedir, relpath, flags, mode);<br>
++#endif<br>
++<br>
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // really old system, all we ca=
n do is live with the risks<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!basedir) {<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch<br>
new file mode 100644<br>
index 0000000000..9c138b5437<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch<br>
@@ -0,0 +1,328 @@<br>
+From edfd5b913c9afdb0f340cf8135544399206f6e62 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Wed, 31 Dec 2025 10:01:23 +1100<br>
+Subject: [PATCH] syscall+clientserver: am_chrooted and use_secure_symlinks=
 for<br>
+ daemon-no-chroot (CVE-2026-29518)<br>
+<br>
+CVE-2026-29518: an rsync daemon configured with &quot;use chroot =3D no&qu=
ot;<br>
+is exposed to a TOCTOU race on parent path components. A local<br>
+attacker with write access to a module can replace a parent<br>
+directory component with a symlink between the receiver's check<br>
+and its open(), redirecting reads (basis-file disclosure) and<br>
+writes (file overwrite) outside the module. Under elevated daemon<br>
+privilege this allows privilege escalation. Default<br>
+&quot;use chroot =3D yes&quot; is not exposed.<br>
+<br>
+Add secure_relative_open() in syscall.c. It walks the parent<br>
+components under RESOLVE_BENEATH (Linux 5.6+) /<br>
+O_RESOLVE_BENEATH (FreeBSD 13+, macOS 15+) / per-component<br>
+O_NOFOLLOW elsewhere, anchored at a trusted dirfd, so a parent-<br>
+symlink swap is rejected by the kernel. Route the receiver's<br>
+basis-file open in receiver.c through it when use_secure_symlinks<br>
+is set in clientserver.c rsync_module().<br>
+<br>
+Reporters: Nullx3D (Batuhan SANCAK); Damien Neil; Michael Stapelberg.<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-29518<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/f1c24ab03bc85cb2638a569faa60216582fb6c5d">https://github.com/Rsync=
Project/rsync/commit/f1c24ab03bc85cb2638a569faa60216582fb6c5d</a>]<br>
+<br>
+(cherry picked from commit f1c24ab03bc85cb2638a569faa60216582fb6c5d)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ clientserver.c |&nbsp; 25 +++++++++<br>
+ options.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 9 ++++<br>
+ receiver.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 22 ++++++--<br>
+ syscall.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 139 +++++++++++++++++++++++++++=
++++++++++++++++++++++<br>
+ 4 files changed, 192 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/clientserver.c b/clientserver.c<br>
+index 7c897abc..b6eba098 100644<br>
+--- a/clientserver.c<br>
++++ b/clientserver.c<br>
+@@ -30,6 +30,7 @@ extern int list_only;<br>
+ extern int am_sender;<br>
+ extern int am_server;<br>
+ extern int am_daemon;<br>
++extern int am_chrooted;<br>
+ extern int am_root;<br>
+ extern int msgs2stderr;<br>
+ extern int rsync_port;<br>
+@@ -38,6 +39,7 @@ extern int ignore_errors;<br>
+ extern int preserve_xattrs;<br>
+ extern int kluge_around_eof;<br>
+ extern int munge_symlinks;<br>
++extern int use_secure_symlinks;<br>
+ extern int open_noatime;<br>
+ extern int sanitize_paths;<br>
+ extern int numeric_ids;<br>
+@@ -981,6 +983,7 @@ static int rsync_module(int f_in, int f_out, int i, co=
nst char *addr, const char<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_printf(=
f_out, &quot;@ERROR: chroot failed\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; am_chrooted =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; module_chdir =3D module_dir;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+@@ -1003,6 +1006,15 @@ static int rsync_module(int f_in, int f_out, int i,=
 const char *addr, const char<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Enable secure symlink handling for any =
non-chrooted daemon module.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This prevents TOCTOU race attacks =
where an attacker could switch a<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * directory to a symlink between pat=
h validation and file open.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Match the gate used by the do_*_at=
() wrappers in syscall.c<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (am_daemon &amp;&amp; !am_chrooted=
) -- the protection has nothing to do<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * with symlink munging, so a module =
configured with<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * &quot;munge symlinks =3D false&quo=
t; must still get the secure-open path. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_secure_symlinks =3D am_daemon &amp;&am=
p; !am_chrooted;<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gid_list.count) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; gid_t *gid_array =3D gid_list.items;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (setgid(gid_array[0])) {<br>
+@@ -1305,6 +1317,19 @@ int start_daemon(int f_in, int f_out)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FL=
OG, errno, &quot;daemon chroot(\&quot;%s\&quot;) failed&quot;, p);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Deliberately do NOT set am_chrooted here.&nbsp; am_chrooted<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * gates the per-module symlink-race defenses<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * (secure_relative_open() and the do_*_at() wrappers in<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * syscall.c) and means &quot;the kernel is enforcing path<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * confinement at the module boundary&quot;.&nbsp; The daemon ch=
root<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * confines path resolution to the daemon-chroot directory,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * not to any individual module path -- modules sharing the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * daemon chroot are still distinguishable filesystem<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * subtrees and a sender-controlled symlink in module A<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * could redirect a syscall to module B (or to other files<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * inside the daemon chroot) without the per-module<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * defenses.&nbsp; Leave am_chrooted=3D0 here so secure_relative=
_open()<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * still fires for &quot;use chroot =3D no&quot; modules. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (chdir(&quot;/&quot;) &lt; 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rsyserr(FL=
OG, errno, &quot;daemon chdir(\&quot;/\&quot;) failed&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;=
<br>
+diff --git a/options.c b/options.c<br>
+index 578507c6..87c91376 100644<br>
+--- a/options.c<br>
++++ b/options.c<br>
+@@ -113,11 +113,20 @@ int mkpath_dest_arg =3D 0;<br>
+ int allow_inc_recurse =3D 1;<br>
+ int xfer_dirs =3D -1;<br>
+ int am_daemon =3D 0;<br>
++/* Set after a successful per-module chroot (&quot;use chroot =3D yes&quo=
t;) in<br>
++ * clientserver.c. NOT set for the daemon-level &quot;daemon chroot =3D /=
X&quot;<br>
++ * chroot: that confines path resolution to /X, but module paths<br>
++ * /X/modA, /X/modB, etc. are not chroot boundaries, so the per-module<br=
>
++ * symlink-race defenses (secure_relative_open() / do_*_at() in<br>
++ * syscall.c, gated by `am_daemon &amp;&amp; !am_chrooted`) must still fi=
re<br>
++ * even when the daemon is inside a daemon chroot. */<br>
++int am_chrooted =3D 0;<br>
+ int connect_timeout =3D 0;<br>
+ int keep_partial =3D 0;<br>
+ int safe_symlinks =3D 0;<br>
+ int copy_unsafe_links =3D 0;<br>
+ int munge_symlinks =3D 0;<br>
++int use_secure_symlinks =3D 0;<br>
+ int size_only =3D 0;<br>
+ int daemon_bwlimit =3D 0;<br>
+ int bwlimit =3D 0;<br>
+diff --git a/receiver.c b/receiver.c<br>
+index edfbb210..5a2c8c5a 100644<br>
+--- a/receiver.c<br>
++++ b/receiver.c<br>
+@@ -70,6 +70,7 @@ extern int fuzzy_basis;<br>
+ <br>
+ extern struct name_num_item *xfer_sum_nni;<br>
+ extern int xfer_sum_len;<br>
++extern int use_secure_symlinks;<br>
+ <br>
+ static struct bitbag *delayed_bits =3D NULL;<br>
+ static int phase =3D 0, redoing =3D 0;<br>
+@@ -214,7 +215,12 @@ int open_tmpfile(char *fnametmp, const char *fname, s=
truct file_struct *file)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * access to ensure that t=
here is no race condition.&nbsp; They will be<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * correctly updated after=
 the right owner and group info is set.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (Thanks to snabb@epipe.=
fi for pointing this out.) */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D do_mkstemp(fnametmp, (file-&gt;mode=
|added_perms) &amp; INITACCESSPERMS);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* When use_secure_symlinks is on (non-chr=
oot daemon with munge_symlinks),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * use secure_mkstemp to prevent syml=
ink race attacks on parent directories. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (use_secure_symlinks)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fd =3D secure_mkstemp(fnametmp, (file-&gt;mode|added_perms) &amp; INI=
TACCESSPERMS);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fd =3D do_mkstemp(fnametmp, (file-&gt;mode|added_perms) &amp; INITACC=
ESSPERMS);<br>
+ <br>
+ #if 0<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* In most cases parent directo=
ries will already exist because their<br>
+@@ -854,11 +860,21 @@ int recv_files(int f_in, int f_out, char *local_name=
)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; /* We now check to see if we are writing the file &quot;in=
place&quot; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (inplace || one_inplace)&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fnametmp =
=3D one_inplace ? partialptr : fname;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd2 =3D do_open(fname=
tmp, O_WRONLY|O_CREAT, 0600);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* When use_secure_sy=
mlinks is on (non-chroot daemon),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * use secure op=
en to prevent symlink race attacks where an<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * attacker coul=
d switch a directory to a symlink between<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * path validati=
on and file open. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (use_secure_symlin=
ks)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; fd2 =3D secure_relative_open(NULL, fnametmp, O_W=
RONLY|O_CREAT, 0600);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; fd2 =3D do_open(fnametmp, O_WRONLY|O_CREAT, 0600=
);<br>
+ #ifdef linux<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd2 =
=3D=3D -1 &amp;&amp; errno =3D=3D EACCES) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Maybe the error was due to protect=
ed_regular setting? */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; fd2 =3D do_open(fname, O_WRONLY, 0600);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (use_secure_symlinks)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
fd2 =3D secure_relative_open(NULL, fname, O_WRONLY, 0600);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
fd2 =3D do_open(fname, O_WRONLY, 0600);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd2 =
=3D=3D -1) {<br>
+diff --git a/syscall.c b/syscall.c<br>
+index 9033196f..dcecda1a 100644<br>
+--- a/syscall.c<br>
++++ b/syscall.c<br>
+@@ -877,6 +877,145 @@ cleanup:<br>
+ #endif // O_NOFOLLOW, O_DIRECTORY<br>
+ }<br>
+ <br>
++/* Fill buf with len random bytes.&nbsp; Prefers /dev/urandom for cryptog=
raphic<br>
++ * quality; falls back to rand() if /dev/urandom cannot be opened or read=
<br>
++ * (e.g. inside a chroot or container without /dev populated). */<br>
++static void rand_bytes(unsigned char *buf, size_t len)<br>
++{<br>
++#ifndef O_CLOEXEC<br>
++#define O_CLOEXEC 0<br>
++#endif<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd =3D open(&quot;/dev/urandom&quot;, =
O_RDONLY | O_CLOEXEC);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &gt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ssize_t n =3D read(fd, buf, len);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; close(fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (n =3D=3D (ssize_t)len) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (size_t i =3D 0; i &lt; len; i++) {<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; buf[i] =3D (unsigned char)rand();<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++}<br>
++<br>
++/*<br>
++&nbsp; Secure version of mkstemp that prevents symlink attacks on parent =
directories.<br>
++&nbsp; Like secure_relative_open(), this walks the path checking each com=
ponent<br>
++&nbsp; with O_NOFOLLOW to prevent TOCTOU race conditions.<br>
++<br>
++&nbsp; The template may be relative or absolute, but must not contain ../=
 components.<br>
++&nbsp; Returns fd on success, -1 on error.<br>
++*/<br>
++int secure_mkstemp(char *template, mode_t perms)<br>
++{<br>
++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY) || !defined(AT_FDCWD)<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Fall back to regular mkstemp on old sys=
tems */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return do_mkstemp(template, perms);<br>
++#else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *lastslash;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dirfd =3D AT_FDCWD;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd =3D -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!template) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D EINVAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncmp(template, &quot;../&quot;, 3) =
=3D=3D 0 || strstr(template, &quot;/../&quot;)) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D EINVAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For absolute paths, start the secure wa=
lk from &quot;/&quot; rather than CWD. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (template[0] =3D=3D '/') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; dirfd =3D open(&quot;/&quot;, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Find the last slash to separate directo=
ry from filename */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lastslash =3D strrchr(template, '/');<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lastslash) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; char *path_copy =3D my_strdup(template, __FILE__, __LINE__);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!path_copy)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Null-terminate at the last slash to get directory part */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; path_copy[lastslash - template] =3D '\0';<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; /* Walk the directory path securely */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (const char *part =3D strtok(path_copy, &quot;/&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; part !=3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; part =3D strtok(NULL, &quot;/&quot;))<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int next_fd =3D opena=
t(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (next_fd =3D=3D -1=
) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; int save_errno =3D errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; free(path_copy);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D (save_errno =3D=3D ELOOP) ? ELOOP : sa=
ve_errno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDC=
WD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dirfd =3D next_fd;<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; free(path_copy);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Now create the temp file in the securel=
y-opened directory */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perms |=3D S_IWUSR;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Generate unique filename - we need to m=
odify the template in place */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *filename =3D lastslash ? lastslash +=
 1 : template;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t filename_len =3D strlen(filename);<=
br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (filename_len &lt; 6) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D EINVAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *suffix =3D filename + filename_len -=
 6; /* Points to XXXXXX */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(suffix, &quot;XXXXXX&quot;) !=
=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; errno =3D EINVAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Try random suffixes until we find one t=
hat works */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static const char letters[] =3D &quot;abcd=
efghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789&quot;;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int tries =3D 0; tries &lt; 100; trie=
s++) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; unsigned char rbytes[6];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; rand_bytes(rbytes, sizeof(rbytes));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (int i =3D 0; i &lt; 6; i++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suffix[i] =3D letters=
[rbytes[i] % (sizeof(letters) - 1)];<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fd =3D openat(dirfd, filename, O_RDWR | O_CREAT | O_EXCL | O_NOFOLLOW=
, perms);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fd &gt;=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (errno !=3D EEXIST) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDC=
WD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fd &gt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (fchmod(fd, perms) !=3D 0 &amp;&amp; preserve_perms) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int errno_save =3D er=
rno;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unlinkat(dirfd, filen=
ame, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDC=
WD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errno =3D errno_save;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++#if defined HAVE_SETMODE &amp;&amp; O_BINARY<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; setmode(fd, O_BINARY);<br>
++#endif<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dirfd !=3D AT_FDCWD) close(dirfd);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return fd;<br>
++#endif<br>
++}<br>
++<br>
+ /*<br>
+&nbsp;&nbsp; varient of do_open/do_open_nofollow which does do_open() if t=
he<br>
+&nbsp;&nbsp; copy_links or copy_unsafe_links options are set and does<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch b/me=
ta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch<br>
new file mode 100644<br>
index 0000000000..ba9ef808b4<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch<br>
@@ -0,0 +1,71 @@<br>
+From 302e3116633ed953e0c1cc2d6878d7a22b6bf9b8 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Sun, 1 Mar 2026 09:28:40 +1100<br>
+Subject: [PATCH] sender: fix read-path TOCTOU by opening from module root<=
br>
+ (CVE-2026-29518)<br>
+<br>
+The sender's file open was vulnerable to the same TOCTOU symlink<br>
+race as the receiver-side basis-file open. change_pathname() calls<br>
+chdir() into subdirectories, which follows symlinks; an attacker<br>
+could race to swap a directory for a symlink between the chdir and<br>
+the file open, allowing reads of privileged files through the<br>
+daemon.<br>
+<br>
+Reconstruct the full relative path (F_PATHNAME + fname) and open<br>
+via secure_relative_open() from the trusted module_dir, which<br>
+walks each path component without following symlinks. This is<br>
+independent of CWD, so the chdir race is neutralised.<br>
+<br>
+CVE-2026-29518.<br>
+<br>
+Co-Authored-By: Claude Opus 4.6 &lt;noreply@anthropic.com&gt;<br>
+<br>
+CVE: CVE-2026-29518<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/859d44fa4f1420775e4ba050337ef32092f2894c">https://github.com/Rsync=
Project/rsync/commit/859d44fa4f1420775e4ba050337ef32092f2894c</a>]<br>
+<br>
+(cherry picked from commit 859d44fa4f1420775e4ba050337ef32092f2894c)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ sender.c | 22 +++++++++++++++++++++-<br>
+ 1 file changed, 21 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/sender.c b/sender.c<br>
+index b1588b70..99f431fe 100644<br>
+--- a/sender.c<br>
++++ b/sender.c<br>
+@@ -48,6 +48,8 @@ extern int make_backups;<br>
+ extern int inplace;<br>
+ extern int inplace_partial;<br>
+ extern int batch_fd;<br>
++extern int use_secure_symlinks;<br>
++extern char *module_dir;<br>
+ extern int write_batch;<br>
+ extern int file_old_total;<br>
+ extern BOOL want_progress_now;<br>
+@@ -352,7 +354,25 @@ void send_files(int f_in, int f_out)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit_clean=
up(RERR_PROTOCOL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; fd =3D do_open_checklinks(fname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (use_secure_symlinks) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Open from module r=
oot to prevent TOCTOU race where<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * change_pathna=
me's chdir follows a directory symlink.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Reconstruct t=
he full path relative to module_dir<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * from F_PATHNA=
ME (path) and f_name (fname). */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char secure_path[MAXP=
ATHLEN];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int slen =3D snprintf=
(secure_path, sizeof secure_path, &quot;%s%s%s&quot;, path, slash, fname);<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (slen &gt;=3D (int=
)sizeof secure_path) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; io_error |=3D IOERR_GENERAL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FERROR_XFER, &quot;path too long: %s%s%s=
\n&quot;, path, slash, fname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; free_sums(s);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (protocol_version &gt;=3D 30)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
send_msg_int(MSG_NO_SEND, ndx);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D secure_relativ=
e_open(module_dir, secure_path, O_RDONLY, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D do_open_checkl=
inks(fname);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (fd =3D=3D -1) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (errno =
=3D=3D ENOENT) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum logcode c =3D am_daemon &amp;&am=
p; protocol_version &lt; 28 ? FERROR : FWARNING;<br>
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb<br>
index 509be486b8..e2fe0128d5 100644<br>
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
@@ -16,6 +16,10 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.samb=
a.org/pub/${BPN}/src/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://determism.patch">file://determism.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Add-missing-prototypes-to-function-declarations.patch">
file://0001-Add-missing-prototypes-to-function-declarations.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-10158.patch">file://CVE-2025-10158.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-29518_p1.patch">file://CVE-2026-29518_p1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-29518_p2.patch">file://CVE-2026-29518_p2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-29518_p3.patch">file://CVE-2026-29518_p3.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-29518_p4.patch">file://CVE-2026-29518_p4.patch</a> \<br>
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

--_000_PH0PR11MB59027477B501C6421A69E289CFC62PH0PR11MB5902namp_--

