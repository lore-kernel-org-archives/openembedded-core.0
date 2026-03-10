Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802A0FD4F30
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 19:30:24 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.893.1773163460660064900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 10:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h6gbNo+B;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: mattware@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7241; q=dns/txt;
  s=iport01; t=1773163460; x=1774373060;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SYm09jHU+lRY7pg3PntgVWRJNu6Tj/J36SQfP1LYxF8=;
  b=h6gbNo+BGldNgq3Hb2IFyUptyKQ280+9FG6/0kOEo7LEy42hfRryeWJZ
   cxIPbZvjIhfjKcfoBYEIm+Jg9FGAyitR0akfXknbF5nwWycuNOOrIr7er
   SjPN5y6hpJD3TmOegH2pJTy3pLG+nov1H/5e01xUwdsoY/Vy7mEabY50L
   yfLKIH6PffjwBZG6TxaLR5RJgkGpFx32dED45iRqY5s0YCh57J4q4kojY
   KPoV29Vzxd+RDIYfIw/OKLinxw9WNixUYxFBwLssgR8GmrkRo/T4wuZHf
   IGKVC+rPiEp5DoNmXfrtlHaxH5NJKrn3d+PVxHUQbL9e/y3jb6HoUT3VP
   w==;
X-CSE-ConnectionGUID: WhNAP+Y4Rxqu39q/HL6VXg==
X-CSE-MsgGUID: A+IbCdf4TCuI46C133ouCg==
X-IPAS-Result: =?us-ascii?q?A0CNDABRU7Bp/5IQJK1agQklgmgxUwd+AoEPEkmIIwOFL?=
 =?us-ascii?q?Ih8i2SLX4hWDwEBAQ0CLgEIGgQBAYUHAo0iAiY4EwECBAEBAQEDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwERWQ4QAgEIDgMEAQEBL?=
 =?us-ascii?q?iAHCh0IAgQOBQgagmGCHRYHAzYDAQKhLQGBPQKKKniBNIEB3UMNgl6BTYU8g?=
 =?us-ascii?q?nkeAQEqgTWCCFOBIRkbhF8nG4FJRIFXgmg+gh9CBAGBXzyDV4IvBIIigQ6JC?=
 =?us-ascii?q?oNGhlNSciIDJjMsAVUTFwsHBYEjQwOBBiNLBS0dgSMhHRcUH1gbBwUSISqBS?=
 =?us-ascii?q?XiCAQ+GankDLngOIgIoElw4Ej4LWgWCSAMLbT03FBsDBIE1BY0QXD6CcYEfg?=
 =?us-ascii?q?UKjVIF8oQlxCoQcjB6NPoIAhjIXhASBV6UQmQaCWI86kVuFKQIEAgQFAhABA?=
 =?us-ascii?q?QaBfyWBWXAVgyIJSRkPlzTEG3gCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:u/he5hyHRxcC07/XCzPsngc9DxPP853uNQITr50/hK0LKOKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:sbeTpK+t5XwLSWMmSvuNDrUD2H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 moXDGqOOPeJNmH3fd1+O4zj8U5SucSAz9JgTgFp/HpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsaTtMs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kJPasxwqVGXVte7
 OFDeSlKTjTdudK5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cPXWjOX9PYH46tOKhmmXgeidVgFmUvqEwpWPUyWSd1ZCxboKMJ4TWGp89ckCwj
 yHn9U/1DE0mH8G+lWSuqyn3gfLkknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBVy4PTyVKb5ots8peqSEW6
 2JlVujBXFRHmLaUUnmasLyTqFuP1eI9dwfuuQdsodM53uTe
IronPort-HdrOrdr: A9a23:yKno56N8LwgV0sBcT6T255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NaZLUbbUQSTXftfBOfZslnd8mjFh5FgPM
 RbAuZD4b/LfCVHZK/BiWHSfadDsby6GeKT9JvjJhxWPHhXgtRbnnxE43GgYzVLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRi+erAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 B2NiOixt9q5CH77WPADuvzJldXf42P0CMfeNso/jhiuE0lGedsRMIkjRho+dw7bVLHAcgcYZ
 pT5YfnlbZrmZfwVQGFgoGpq+bcBEjaEnq9Mzo/k93Q3D5MkH9jyUwEgMQZg3cb7Zo4D4JJ/u
 LeL81T5ftzp+ItHOpA7d06MICKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw4O2xYpQHwJY7hZ
 yECTpjxCIPUlOrDdfL0IxA8xjLTmn4VTPxyttG75w8vrHnXrLkPSCKVVhrmcq9pPcUBNHdRp
 +ISd9rKu6mKXGrFZdC3gX4VZUXIX4CUNcNstJ+QF6KqtKjEPyiigUaSoekGFPAK0dSZoqkOA
 p3YNHaHrQ10nyW
X-Talos-CUID: 9a23:MFPZLG247Wg22FaQVc4yy7xfJcADW0We/SvqM1alUjdwD52xF2Gg9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AUGaLew8SFSjCu36djOl9gGOQf+4rwq6FBE5Rrb4?=
 =?us-ascii?q?bmpXaHnUrYDCApzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 17:24:19 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 8F3121800045E
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 17:24:19 +0000 (GMT)
X-CSE-ConnectionGUID: g9ZglOL8RX6o3qFVQ7Qp9g==
X-CSE-MsgGUID: wfccWu+mQAy4LFFHxxWxdg==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,112,1770595200"; 
   d="scan'208,217";a="52856685"
Received: from mail-bn1pr07cu00302.outbound.protection.outlook.com (HELO BN1PR07CU003.outbound.protection.outlook.com) ([40.93.12.2])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Mar 2026 17:24:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dthjwndx/afKpJ4hRozYf3al7K8C5uiHZoCy7aI/ZQBWBm0RU5zUNnsyFpeupj5jqd83cuR+9eeoYMTO7baW8yS4i8Rdl9K4G0SgAqNARMPnFOoG41bmXzFnVbVdyKS1kWMAbKDR/2lnafsAq/QbVrt7tEwvwPiGv6nCmp9kOJmym1UcQ7Xw85sIaPyVhkGNJ7gmMsb5WBXMsK99pjeXuk9oi0cOHLT9uU7Pw3DV7EaZzhUF4H3WsMwdn1BMKpQ/fbbLzDC+W/fl9Y+hG+ooMVvyDTPieeUh52OhjPbCH+LKT4I0fU5xHpFxYp8rC629+8d0kbp2lAO2RayaxrJ36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYm09jHU+lRY7pg3PntgVWRJNu6Tj/J36SQfP1LYxF8=;
 b=btdh13qQdLrZrGQRxwgY5XHS3XwMqFK7Z+Yw6ye3d3RKnV1TEFbBJdKpQF64x2Z/cQuOVqFSqEwntSkkwv+nxnuCW8rAGCFWj4/+YKvL1NpzqYYhlSJL69nNGKmxOfqmXX95gQH0z/yEX2gkLpgax6Vv+TU/hxqVtQdODWN3/ym+4qJB56bc8ZnGBcTvPlVeGRy8D9cXv76iiLfhCApBtv0ShUh4VFiR81ARsnVZehl8RslQMPNNpQ2Xs8VWieVkbEPra3NSAKEchLaRDdc4RZTMTgrLC5OyGu4dwrpehbraoK4KCUOpYqLWYrk7rXj10HlZBayAX2NTa7QKteNMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 17:24:17 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c833:7d01:2404:671d%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 17:24:17 +0000
From: "Matthew Ware (mattware)" <mattware@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Elliot Sparling (esparlin)"
	<esparlin@cisco.com>, Robert Yang <liezhi.yang@windriver.com>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
Thread-Topic: [OE-core] RPM 6 in Wrynose
Thread-Index: AQHcsIcBVqcb/yDdrEaJ311V201mR7Wnt8YAgAANaJqAAD75Pw==
Date: Tue, 10 Mar 2026 17:24:17 +0000
Message-ID: 
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
References: 
 <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7705:EE_|SA2PR11MB4953:EE_
x-ms-office365-filtering-correlation-id: 488831c0-f4df-420e-7b4a-08de7ec9dba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|8096899003|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 Sm4lOyO8Kv2X3btbkdD++kswjyHFVen9pq9OANfdecSa56RPmr85oCVm6TYdbjFPUhg0ZoBXvbVflO31PaOSTq0YuhevJBxjBU+LMxCQyJgEQN7wOiulHep7mlnIMZJtlaUwF/99YLEykH93Yf3Se6qEPfru/8uwh6ARx2N4DGT5o94y9HH6HKMEjrxGEXm3PVa1Jc+uatMnZ3zFW78j/feoOhxfR5gZizkoSlnO3+wx8eXBuHkyyOdrjZlyYMSQW6GJmoiBZLSJL4jMETsyd9thq+3ErZi8kES65djUiGsAKN0BbWO/lDHYxywMjMYE+Lulh07ibNz4Q47SUsclxI2M716jHwss9NLXD3XR6IrdnrUQzlx58NnUSfKx5ccExHIZq+9/RUXaFVY+THuVDekyyQGvSIn4PLrGmm8M7b19RtSrxVvtt6ev0eqkXSvuEMsiflDvgHo5tdvRQFp3E5FMV4TjN1yoRw1tNLLIOpwxASRaX6R6CppspEzDU4Z1DIyvbZzzE829U8XwV4bgJ8BZxRjnyeIntPcDdJv5fAgGZfpFuzuBE+cbPTXvml2YFm1KyF/YJeWmuKn+xyGTy8xDINNAjyhtc/l95nTUp/6H9ocCgnUFAVcWWZGUVSJEhAY7zO7df0+Mn90AD2amf0T2uv3d30k/SB99D43DsNdSo9TF5N1Xw/nLCZhhgIJTsFkDkPwz+NMPhbawV2e90ufsSvFUXZuPOZBWaFADSBqJrDoCnitzRSWC3XUf4K2WeuUCsIXk1/WhXdJI6XRlSGkFmbmEpOq8+Yap3GAHWCE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(8096899003)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?jEU7jyI/qUyyFNapOOQhP1O1bWjVx7by5/lKVAvRcEacpCMsV1g6beAvw/?=
 =?iso-8859-1?Q?VZqTfU3CoFUrC/ABO/7IX0Eu2kC3O97CLMP3HYbZuJcVAimvC7cxYChuAl?=
 =?iso-8859-1?Q?GCI+P4Safu+A2setFEjd/aAjX9UsRzNwhZG+/txvx2YCdgc5gdnZ/713oM?=
 =?iso-8859-1?Q?AGMfRhJtf3YWR7dBWFBpo+cJtn4coCPR6xUDRb4Jl/+tIAA+5W9D58pHss?=
 =?iso-8859-1?Q?kuKHjLDdA1t/L7/Dr7V4KB+GiDOwW1+dN6kc+srvYiHkCu4OKyQo8AQ7q4?=
 =?iso-8859-1?Q?0ilH/AXJQji/LPA3BAw+Zk/V87+9cqR8WnDUb81L9n4o+keBHin1pLD4zN?=
 =?iso-8859-1?Q?fEEUNJnVs6dcqJ3/FczsXdPEYZyBvO38e5wT7A5PZaEdpuQiFPHPGbTm30?=
 =?iso-8859-1?Q?r+KKaQyMzNBXOYpHE9GsO36TJEhRSR9KnO0ZVxjcuctzOE9E81gyUm6S8R?=
 =?iso-8859-1?Q?R8EiiP4jgb+R3Mqv1vF+kKdMtfTQ868O/NjLgD5AeaJG265lIptiJ7KzN9?=
 =?iso-8859-1?Q?Ds05zkVgyILnrOXDw6QSUdGmrtaC7kV2Su9lsNaxwZ/bZPrPLoLWxM0JCh?=
 =?iso-8859-1?Q?ua5KRdTx11odFTomUCJvUJo/Sh3r0JGwnVdItx/5jT7+E4mfW9j0fCIaQh?=
 =?iso-8859-1?Q?/aNMgTgkFz9s5NlYNR144SQU1GqmY6mz6h1Mkt+//pnPgdL6nSqEPKqUh1?=
 =?iso-8859-1?Q?OmmZLg4Ug+JhN8sX19gNfGu+/Ua0FyAYifD6SlVsxreygI/ACP3iVDk1qr?=
 =?iso-8859-1?Q?MbKFErpT1Gu6shtR0YNXcPe2xzu98KNV3ZTdXCONMMgMIMYBBia5Kb1ewq?=
 =?iso-8859-1?Q?JqyTEjqgqIVzWoMZ4Z+YMCe3U8BTl0ulAXkKhVXSgqp+SI57AfcN6r7J3d?=
 =?iso-8859-1?Q?nxU83M8rKz+qFh11p9fhsuxisU0Ayc+IDYGo9no29yc8i3HRu0Ppft2Cis?=
 =?iso-8859-1?Q?MAkUNn7j3LrWh/oI6aCD85r/J8591YqVzeLl6jwh/EhFlfflRIp2xXQe3Z?=
 =?iso-8859-1?Q?zSVRdeoRm5/tvjQcBnfOztxyCq246KcjF+sW16CfLPHVdhSxqaO7NVIx6O?=
 =?iso-8859-1?Q?fXOlN0v8SmwLBZnCV87R3jRLHpot2pGyAp6lat3ehJjw/+C2F67ZrDsUf5?=
 =?iso-8859-1?Q?sJ7o60uPu5rzhTXx1TpKFIMQ1QApyiIdZSjmy2uC08NyOT+kz43HFty9nf?=
 =?iso-8859-1?Q?pmuylUmz/lzVgSOYnB7cKDvwAfXId76Sul2G8m3W1Zx38rEhHm/dPiyp+B?=
 =?iso-8859-1?Q?qZ9kd+Ue6yBM0bKyXMQ9cvdCrWrXxFYWtcN8fUEiwAjWsggvHJsPRAYGj9?=
 =?iso-8859-1?Q?cVx8Cc3HDgDLLiGoOWur53IvfshKjL0s+AteWrVjqIUbJbbABGOZ7N/QGd?=
 =?iso-8859-1?Q?yVxsoJ/nciHlKscmjytELJHbhS/BtSXEqxpzBKHhAecOBEoX6XP3Mh7lTc?=
 =?iso-8859-1?Q?OLWJVvWSFvM9UqA0J086sauzL7qc4svkELEO/KLITyvh7afzHiXAzh/hjH?=
 =?iso-8859-1?Q?jxwqYqFhbYpmWKt5zyu51hKGfLoiWYBn1OybBaO+l9x7FJjdQlAN14rNQf?=
 =?iso-8859-1?Q?ukYrKBQqWJ4V6IQTsEF0htTeG5fdO3W5Hz4iXWN3RI6U2M7i8SJaGSpgL9?=
 =?iso-8859-1?Q?4bVVUmAdpeJ//InpbfucMj8DhDxuuc3FCQ73y6AjcIBrLjHW5fSbc3NqAV?=
 =?iso-8859-1?Q?7iOx8b+L0Z+nla5YaJyyx5zIG3u2eLqopS6qTXCfUWuPVqqji5KprfwlyK?=
 =?iso-8859-1?Q?/q3qQfkn39QKRArWgghtxJZYGVRlyAzZHBnsIAyDDrbC08+mi8i8D4fcWp?=
 =?iso-8859-1?Q?w42UvPgvABYHsFUPiMqo6lLMTWhyXdkRKsZKxU904Lc2mNWbYndi?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	PsQB0/Luo4VvkCBdewxGMeggFJRxu9TvRnzB6bP8OrXybkuVeOTWeXKnXkJsR69IBMWrZsz3cbcWcgJYOa0aUHgkT6Yif3KhrdMFxl9faidBpS2P3DHa+ECatJ9BZGioF7CfKoGKWiefpn+t1fozCap0E2C1rMDgUrOwvF0n1IEzoyDXFewt2V/1b+6oE3Znf9pYSHcb+iPafYGYkD1bDBnYQwY1mJMDq3iXdpn9UjqUlCugVH+ifc7c7ZsUiPYlgJ+P7FWUAk50gi/EDppRl6LphJbULdwwBZqKFiO/bpOhxN7ihPrutfPLIMYfBOmOgGix4p8eyPo9M2iWkmh/xw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488831c0-f4df-420e-7b4a-08de7ec9dba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 17:24:17.1345
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFEqjeIeLyQf6v2m3UBV/m6JfgtwAYK1hJsFRaO05NCAqtbO7isCAGv/YVS0WdZT4BMrTmXqFXN1HzoC+TDjAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB77056419029EAA594968E1DECD46ASN7PR11MB7705namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 19:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232827

--_000_SN7PR11MB77056419029EAA594968E1DECD46ASN7PR11MB7705namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Also, since we're here: is there any plan to move to DNF 5? I see Wrynose i=
s staying on 4.x, but wondered if there was a plan/aim for DNF 5.

Thanks,
Matt


________________________________
From: Matthew Ware (mattware) <mattware@cisco.com>
Sent: Tuesday, March 10, 2026 2:09 PM
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Elliot Sparling (esparlin) <esparlin@cisco.com>; Robert Yang =
<liezhi.yang@windriver.com>; Mathieu Dubois-Briand <mathieu.dubois-briand@b=
ootlin.com>
Subject: Re: [OE-core] RPM 6 in Wrynose

I'm not sure if we'd be able to help, I certainly don't have any expertise =
in OE. What are the remaining issues, and when do they need to be resolved =
by to make it into Wrynose? I'll see whether we can offer any help.


________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Tuesday, March 10, 2026 12:50 PM
To: Matthew Ware (mattware) <mattware@cisco.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Elliot Sparling (esparlin) <esparlin@cisco.com>; Robert Yang =
<liezhi.yang@windriver.com>; Mathieu Dubois-Briand <mathieu.dubois-briand@b=
ootlin.com>
Subject: Re: [OE-core] RPM 6 in Wrynose

On Tue, 10 Mar 2026 at 13:24, Matthew Ware (mattware) via
lists.openembedded.org <mattware=3Dcisco.com@lists.openembedded.org>
wrote:
> I see that the next OpenEmbedded release, Wrynose, currently uses RPM 4.2=
0.1, but that there are efforts to use RPM 6 instead. I was wondering, what=
 is the current state of the RPM 6 effort? Is it looking likely that Wrynos=
e will take RPM 6?

It still has issues, so whether the update makes it in wrynose is
unclear, and the effort may not be ready in time. Rpm updates tend to
break all over the place in all kinds of corner cases, and fixing
issues often reveals new issues, especially when the person working on
the update isn't able to run yocto CI pipeline themselves.

If rpm 6 in wrynose is important to you, help is very welcome.
Mathieu/Robert should be able point to particular remaining issues.

Alex

--_000_SN7PR11MB77056419029EAA594968E1DECD46ASN7PR11MB7705namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Also, since we're here: is there any plan to move to DNF 5? I see Wrynose i=
s staying on 4.x, but wondered if there was a plan/aim for DNF 5.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Matt</div>
<div id=3D"appendonsend"></div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Matthew Ware (mattware) &lt;mattware@cisco.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, March 10, 2026 2:09 PM<br>
<b>To:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; Elliot Sparling (esparlin) &lt;esparlin@cis=
co.com&gt;; Robert Yang &lt;liezhi.yang@windriver.com&gt;; Mathieu Dubois-B=
riand &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] RPM 6 in Wrynose </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-family: Aptos, Aptos_EmbeddedFont, Aptos=
_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);">
I'm not sure if we'd be able to help, I certainly don't have any expertise =
in OE. What are the remaining issues, and when do they need to be resolved =
by to make it into Wrynose? I'll see whether we can offer any help.</div>
<div id=3D"x_appendonsend"></div>
<div style=3D"direction: ltr;"><br>
</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, March 10, 2026 12:50 PM<br>
<b>To:</b>&nbsp;Matthew Ware (mattware) &lt;mattware@cisco.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; Elliot Sparling (esparlin) &lt;esparlin@cis=
co.com&gt;; Robert Yang &lt;liezhi.yang@windriver.com&gt;; Mathieu Dubois-B=
riand &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] RPM 6 in Wrynose</div>
<div style=3D"direction: ltr; font-family: Calibri, Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; font-size: 11pt;">On Tue, 10 Mar 2026 at 13:2=
4, Matthew Ware (mattware) via<br>
lists.openembedded.org &lt;mattware=3Dcisco.com@lists.openembedded.org&gt;<=
br>
wrote:<br>
&gt; I see that the next OpenEmbedded release, Wrynose, currently uses RPM =
4.20.1, but that there are efforts to use RPM 6 instead. I was wondering, w=
hat is the current state of the RPM 6 effort? Is it looking likely that Wry=
nose will take RPM 6?<br>
<br>
It still has issues, so whether the update makes it in wrynose is<br>
unclear, and the effort may not be ready in time. Rpm updates tend to<br>
break all over the place in all kinds of corner cases, and fixing<br>
issues often reveals new issues, especially when the person working on<br>
the update isn't able to run yocto CI pipeline themselves.<br>
<br>
If rpm 6 in wrynose is important to you, help is very welcome.<br>
Mathieu/Robert should be able point to particular remaining issues.<br>
<br>
Alex</div>
</body>
</html>

--_000_SN7PR11MB77056419029EAA594968E1DECD46ASN7PR11MB7705namp_--

