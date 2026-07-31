Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75541C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 06:19:13 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.906.1785478745169783332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 23:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K5AOLiEM;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10271; q=dns/txt;
  s=iport01; t=1785478745; x=1786688345;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=mQSVTNagFDRn9fEjLy9oi6Hkn6iVHrdZLAhJnfuRayg=;
  b=K5AOLiEM9QD5D+gM9pYnBJgUxpGxkJ7RsP5Caewq0SR1xde6+YaxODg0
   oZEeMjNar/HZH01x9fZu9OfDO/GZz6ia0UtPDI/J2nJWathKm5Op3dJqe
   HA6iYL9z+Nd8AlwSkO0nWhIfyf9w8RAtEYBZOOiAM7gg4rwqpRFGXjHxx
   ddFOUYST0ZNOSYV/IOobgF682mmU16WrjY7Wb0r3m0QQ9N+7PMFQBK19d
   DmFEOztj6xvzrbExEn8RYfzFew0UZg/yJUodxeqxyOWhZ4YHb52SvSVWb
   qB2z2XQ9h33Z+TbkDrkcN3fr0dRk+exxTmD1L6S/IhF6jjd5/QUL/bq3f
   g==;
X-CSE-ConnectionGUID: dWHxbe3VRMOwCYGq5icC9A==
X-CSE-MsgGUID: fHd1WJXYQh+99Pwa+ZTenQ==
X-IPAS-Result: =?us-ascii?q?A0B0AwDZPGxq/43/Ja1agS6BK4E9ATBTgQgCgSFJiCMDh?=
 =?us-ascii?q?SuGWIIhA54bgXQKDwEBAQ0BAS4BFQ0EAQGFBQKNZgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQEBAQMBERUkAT0CAQgRAwEBA?=
 =?us-ascii?q?QEuJwodCAIEARIIGoJhgh0WQQMBAg4Gr0YBgT0Ciip4gQEzgQGDKAE/AgJAA?=
 =?us-ascii?q?dwKFAGBOIU/gxwBASqBNYJdgSIYAYR8JxsbgXKBV4JpPoEFgVwBAQECgSQQK?=
 =?us-ascii?q?x6DdYIwBIEOgRR6EhuBP4FQgWGHQ4VnUnIiAyYzLAFVExcLBwWBIxAzAyovL?=
 =?us-ascii?q?SNLBS0dcAwnEg8dFxceWBsHBRIgKkFEIwNBJAtDBYFVAoF1PyMZNnyBL3VKd?=
 =?us-ascii?q?S1qAhAXSjgYgzECgl8DC209NwYOGQMEgTUFjH0HWyCCP2EtASkCIC+BNAEBD?=
 =?us-ascii?q?h8LkyYBj1aOYJUXCiiDdYwhjT6IMheEBIFXiz2WBINQmQgjjWebDgIEAgQFA?=
 =?us-ascii?q?hABAQaBaDyBWXAVgyIJCgw0GQ+SI4UTgS3HenkCCTIBAQcCBw4DC4FohF4Di?=
 =?us-ascii?q?x+BfgEB?=
IronPort-PHdr: A9a23:cdFHhxwok5kRYBnXCzPsngc9DxPP853uNQITr50/hK0LKeKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHPGI=
IronPort-Data: A9a23:s1cqkKouM3HDi+ARnd7M3fVBQPReBmJDZBIvgKrLsJaIsI4StFCzt
 garIBnTOqqJajP8eo1yOom09UwE6MSGn4cwHAVt+CxgFH8Tp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc80s35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0upIIXFE+
 KcmEhUqcTuyqPvrwbmQG8A506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7WzFVpUicuaowy2PS1wd2lrPqNbI5f/TXHZ8OxRvD/
 D6uE2LRDDEWbeO9+Qu88jH919fQlGDJZI8ULejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9EBq13ryVtji1fyMSKAc/ieUsFGPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:UiEiK67r7Bv8pfojUgPXwcGCI+orL9Y04lQ7vn2ZFiYlEfBwxv
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
X-Talos-CUID: =?us-ascii?q?9a23=3A4bHK6mpHjH9SL666WfwMZH3mUcwaUm3XwSzuGWq?=
 =?us-ascii?q?fFk1YZ6TISFS7qYoxxg=3D=3D?=
X-Talos-MUID: 9a23:MQKr9wWWgwFAjQ/q/DHMiGhdFvdZ2qTtWRE1jpxFifWJMxUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 06:19:04 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 2ED0C180001A2
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 06:19:04 +0000 (GMT)
X-CSE-ConnectionGUID: EbpLW2pTTt+UZlAGXgv2Wg==
X-CSE-MsgGUID: ajzMcbGTRW+x+Fx63XZXHw==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208,217";a="75774467"
Received: from mail-westus2azon11012058.outbound.protection.outlook.com (HELO MW6PR02CU001.outbound.protection.outlook.com) ([52.101.48.58])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 06:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3t1oqo1ZQBBKaXDLuD1MLa35P1Za2FyKkWcGUNrrD6w/9MF1rviqXARagIwT0zDshCC9eN1maFemBPIp21t16NeRcL1iTeTjVXb0XndUrleygncs5+1FtM9A8rW+qJEIe98zOyhFHbDuVYLL4YrsAY1A6lqu84aDdKPZM+tb7fcjGibzMiNZSBCq1W3Vcty4b5vGNuq8bt97WO/geAtHOcs2m/8JCYgcmNjp5mPn6zPFjKs/rTbHRgmo6peW4wd/Msnlioj1Cu8qO2fP6UzIRErCEMMeb25AexsSjxJnQpnI5Mz9xwBd5xWrmvHxQKpIKjVpbueMA29mEWRAzwUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQSVTNagFDRn9fEjLy9oi6Hkn6iVHrdZLAhJnfuRayg=;
 b=rSx+Cefk5AKxDRX8cdUV2+mspcBuKjJLDgD8NvwHTo8/geHXW1+2nM/FkbivUgdGzQ0/U6Up93sL2u3NPn2sKNnuDwr9sJpAyuAt5IBLYV1diEr9oDePkTCFduCJAhPurLaWnBmjhizomMvPzw2yxJWV7kGouDB7RUPz1XD5o1U7CIjYIi24MkcnOj6Q+F5PfqxgCQRZrQpGCnjQYpwiUKuGO6QKo/Tsa0Tv4FUmk/MGZBGsKQqiOuKJQkb0GaPABEZCw1/7lYgAzsO3SKCjUwv/Y86j4hgbj0Qnzw3dqQsc1qXhdYY14U4VdLNEYLwOg2ahpUx/ywWtquv1a6Hmww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 06:19:00 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 06:19:00 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH v3 1/2] curl: fix CVE-2026-4873
Thread-Topic: [OE-core][wrynose][PATCH v3 1/2] curl: fix CVE-2026-4873
Thread-Index: AQHdHcZ1jP5MYY/DZUyfQIQlDaFvNbaHLTTh
Date: Fri, 31 Jul 2026 06:19:00 +0000
Message-ID: 
 <DM4PR11MB61891773AF17D0DF08A0B58EC4C82@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <20260720113041.2479444-1-deeratho@cisco.com>
	 <20260727120136.3147887-1-deeratho@cisco.com>
 <c2a720b2ece56ec5463957fadb990128b947c8fa.camel@pbarker.dev>
In-Reply-To: <c2a720b2ece56ec5463957fadb990128b947c8fa.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|IA1PR11MB6291:EE_
x-ms-office365-filtering-correlation-id: 879d445f-8177-4195-771b-08deeecb9c86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|4143699003|11063799006|8096899003|3023799007|13003099007|56012099006|38070700021|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info: 
 +RDuhh1oDhGwRQES3HGr6dxcazeE/2pph5qI8psRbAUy+j7twmamQQvo8fYH+k7kcJjQJSTcCgOyUMivFr4FQdJ0d3e3bjCStSsTG1c3BZKr/9JckJMwhILflR2gIJW5GYsMehKwv/oSP4lnH0ywiVDOZg//MfCwznAWAUcf5c6nm186Pr/YjmqOTfpqz5P9apEdogpLpMfsfWaK4zOxaf7v2e/AYBE4yLNXWS4zdgKXtq0tLgyAo/SEsOnHorJ+qPZGXeOAnZ37gAroUVIefoh9W49H25wdJToZAEJop9/bltJLZujIFNJkz+Xfd0Z7XOcqFxOoek/pjBDalbHn7ZCDNJqbZWLFjoj+clf/3mT7CSl8GmtrwJxzQ/s7tkSG/linmnwVKuKVfGYoiigb3dd+eEAZBw6uuSby/+TyHfak5OasVfVONpCcfMJrfh6Ah8o9P9aXa19xSTcsvnJ6R8b+2F80+DH3jngq6mUcuXIpwQP7KjPjmlV/beRBcbMNghkTzDeXJowPqa/o3zbdRbtj94nWrMh6wlP+/JE2cL55VnTUW2AXNhRTpmGORReHf4XPaO9n/zJ9Mr1JkJyNGgAESKBznq77pgjcTZHHJpE1/Auzfpufo4UDTXxerTSZFXyWBGRpYGCvi2BxgaIO3YcuY57T3AKUNmymQNZRLyA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(11063799006)(8096899003)(3023799007)(13003099007)(56012099006)(38070700021)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LhbF1ymKVbyTKQkQ8v8dDgRC7+oc9gzJ/kXFQqENkqg4XnWqZV4FEZ98WCHl?=
 =?us-ascii?Q?7tMPreGANVqIMmqnus9Xjrc02vxB3bLi4UFkakHnnK0uq9fGc0lvqYktxIU9?=
 =?us-ascii?Q?gaE6x3rAssorJIn171l/iq/wLzbQ8kd+rXPrXKzY40wKKV1U//bLkD1Tpr1L?=
 =?us-ascii?Q?r/NicNJGYtz+5erpbXsFWWeO5Jg6zBFzgylVM8DgXg/d0u2nUJrPK/6II9bp?=
 =?us-ascii?Q?SyKb3ty4zy+ejVSTV+f3jprlf6ZZiNv8pQv6QXr/cvu4JAALQsZ7Sz7bsb29?=
 =?us-ascii?Q?CE663SrssJQ2LLNnQEIleGHID9f5xQ2KLx6TOUDk5NnLmi3ZbhzCkESoCGMu?=
 =?us-ascii?Q?q0SLyH3bqVEDJZ2XgCFzL7njrW7/xtTrD1YO+11PJ5xowFuzmlHrxdDI5QDK?=
 =?us-ascii?Q?AY7OsgW7wieMCCQBQoqVmoRlnrVosqP0/IwPdfqSG1eXjQAa4R35d4OqJkoU?=
 =?us-ascii?Q?hj1DiD7zjXCDHSSkpSldIhXm20/XDtu6PJVlFzBskWwhkjCzLIFfkbWgeZTP?=
 =?us-ascii?Q?YrmpoATu82glAET129xwvtYpxksQqzpf0lkvnUKvNHV08CPBVwTwgC5WLelq?=
 =?us-ascii?Q?AlXSdrx+9O1sZF7tX6O8Vax23xx0RtWCKPKUcKUa3uv8q+ITbVoZqIPcBMkf?=
 =?us-ascii?Q?ElqZbFsN/Rc6zWyHD2LGQA4MNdJMWZxBbaAqXq7Rt52bmgb5cYzBzwat7Sbx?=
 =?us-ascii?Q?hblyKuMnviq8e9MigwjIfKEgHTjJWtWi4s16pgtu2VwGnpylKy8OYkpQk+fZ?=
 =?us-ascii?Q?imJJJdhzbNccyy9s77Ahsskl/UAsekfEdFrO4P/nOyr9/1/4MATaXsQeuiNx?=
 =?us-ascii?Q?Xwz4yA+Y+XJ/ZPuqckh6KD0NCIhOs8b3QjNi2IssOrQ9lI4XH/NmhyyF8nbI?=
 =?us-ascii?Q?5sEoVoFZOECJEBf5diQ4+sxiPiNAfoGt9hTtohfXjjLSfjara9GilHA2e8Tm?=
 =?us-ascii?Q?YFArIBbz33WihnYVHlNKIdu+9IyAWGjRIke4WveG5Va3gpkvxqQgy9y0fYRB?=
 =?us-ascii?Q?jowYeH8E83Fo2yuVjwFWYNgRcsuJ1W0IDyYi+JbpuNxxB5nJKuAdDVX5CBVZ?=
 =?us-ascii?Q?v2X+5NajtNpWs7nqmIP4BzlkZLPzr9Im6yrMCdYS3yLDO4cOsWPm3GOwI53j?=
 =?us-ascii?Q?GGVPWgVoiGAkwo9FEwnj4HF+tcjW6ZZLgebdl96M48CJME/wUaNbi1jgth3x?=
 =?us-ascii?Q?efPEAWR6dB6GdjVzgLuAxHjxyOS68wSnxvgpZdCSp9f/4BEKrmUqTXsXuzkR?=
 =?us-ascii?Q?8ahOWCa+zGTDpfrYGpe4tQgcaktRjJYSF+o69a3t6E7bRkYxWU3Jqxixdc2u?=
 =?us-ascii?Q?rLJrjsRE0lHDAn9QkSfTK2YU1Urrh0EMGUDDZO/FNp2MtpdB7Qut9v1y35UQ?=
 =?us-ascii?Q?RkIbSotcMinzyNATocjt6fWrf7U+FJo8zkOCPoi2xL56GHYIyw4M4cB+U95f?=
 =?us-ascii?Q?3w9qM/1CefOpoW1//HPtV1gkt764fgmr7bX2YEEQa071G3MqAKyzZQAhRDFV?=
 =?us-ascii?Q?+liHd/b3aSCa1ro6QcxI+Eez2FqWDMRBhTQoYWDszo+lzedSMStmYWmCTVw9?=
 =?us-ascii?Q?aDXwCmfBCWeFuVPPTVjl9st99hlyM0/J2v2qnC0EbyZxNupnOIsN0B/HCGGN?=
 =?us-ascii?Q?wYsrQo8/F1u/+KAfXm80pBqIpbb29ESSJpg9cDlXNub4QzZn3QvvHiS81X9b?=
 =?us-ascii?Q?YWsuaiKCcnMM86qIR+vpSx43lryA9sWSLi/xbtkr/rhl4V39?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61891773AF17D0DF08A0B58EC4C82DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Lsa5psqJdXKnHqD9gdyljR8fSNwwGyJ1jfgeVL76VJZcQqLbunVd3hStqTCnZzQ2NerQ24f3WwP4FViwLLmvKep9TilhPe6nmphudRyQL2xi8rJcQ4Cwcl9/Ulu0CeXgqVHFa5E/luM3N95zWaQ5beOqfGVuEFK7yNHxzjQT9fZyLwnIwZJW0qpcjpX/pomXRoIioTJAXkVu1AwGVSEIjx178w0EMJ1pDYo4/pEITooz4rtlT/EUA9fY6MlaLZHMZA5nJtCHSGVwRPx2GBa7uLcoGEZ2xcGUaoBhGGLS+wXHts9neXuGXoZ8zJNy2eXxM09pFlHPWMzn5IBAKABH5g==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879d445f-8177-4195-771b-08deeecb9c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 06:19:00.4951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gOZysoESJmJe8aXv9NX+WvwDTA0/2+0S0wFpn4GLiVFHmNvWNNkL7AsUIo8szWsDvaY0qgghw1JFXQ47Q2QLAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-3.cisco.com [72.163.7.164];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 06:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242410

--_000_DM4PR11MB61891773AF17D0DF08A0B58EC4C82DM4PR11MB6189namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I have addressed this issue and sent the updated patch here: openembedded-c=
ore@lists.openembedded.org | [wrynose][PATCH v4] curl: fix CVE-2026-4873<ht=
tps://lists.openembedded.org/g/openembedded-core/topic/120530931>

Please review.

Regards,
Deepak
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Paul Barker <paul@pbarker.dev>
Sent: Monday, July 27, 2026 6:20 PM
To: Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) <de=
eratho@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH v3 1/2] curl: fix CVE-2026-4873

On Mon, 2026-07-27 at 17:31 +0530, Deepak Rathore via
lists.openembedded.org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream backport for CVE-2026-4873.
> The upstream fix commit is referenced in [1], and the public
> CVE advisory is referenced in [2].
>
> [1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a6=
6e7d865
> [2] https://curl.se/docs/CVE-2026-4873.html
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> - Changes from v2 to v3:
> - Updated the patch to include the fixed commit instead of CVE_STATUS as =
per Paul's suggestion.
>  .../curl/curl/CVE-2026-4873.patch             | 32 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-4873.patch
> new file mode 100644
> index 0000000000..cd9d81a25f
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
> @@ -0,0 +1,32 @@
> +From 507e7be573b0a76fca597b75ff7cb27a66e7d865 Mon Sep 17 00:00:00 2001
> +From: Daniel Stenberg <daniel@haxx.se>
> +Date: Tue, 24 Mar 2026 08:35:08 +0100
> +Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
> + requires TLS
> +
> +Reported-by: Arkadi Vainbrand
> +
> +Closes #21082
> +
> +CVE: CVE-2026-4873
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be57=
3b0a76fca597b75ff7cb27a66e7d865]
> +
> +(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + lib/url.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index ec0457b..cc60468 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -748 +748 @@ struct url_conn_match {
> +-
> ++  BIT(req_tls); /* require TLS use from a clear-text start */
> +@@ -899,0 +900,3 @@ static bool url_match_ssl_use(struct connectdata *co=
nn,
> ++  else if(m->req_tls)
> ++    /* a clear-text STARTTLS protocol with required TLS */
> ++    return FALSE;
> +@@ -1357,0 +1361 @@ static bool url_attach_existing(struct Curl_easy *da=
ta,
> ++  match.req_tls =3D data->set.use_ssl >=3D CURLUSESSL_CONTROL;

Hi Deepak,

This patch file has no context lines, which makes it brittle. Please
send a v3 with the usual 3 lines of context (that should be the default
for git format-patch).

Best regards,

--
Paul Barker


--_000_DM4PR11MB61891773AF17D0DF08A0B58EC4C82DM4PR11MB6189namp_
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
Hi Paul,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have addressed this issue and sent the updated patch here: <a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/topic/120530931" id=3D"OWAc=
4bedbe9-2b5f-835f-e0ed-221356267b06" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org | [wrynose][PATCH v4] curl: fix CV=
E-2026-4873</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Please review.</div>
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
alf of Paul Barker &lt;paul@pbarker.dev&gt;<br>
<b>Sent:</b> Monday, July 27, 2026 6:20 PM<br>
<b>To:</b> Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cis=
co) &lt;deeratho@cisco.com&gt;; openembedded-core@lists.openembedded.org &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose][PATCH v3 1/2] curl: fix CVE-2026-487=
3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 2026-07-27 at 17:31 +0530, Deepak Rathore =
via<br>
lists.openembedded.org wrote:<br>
&gt; From: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; <br>
&gt; This patch applies the upstream backport for CVE-2026-4873.<br>
&gt; The upstream fix commit is referenced in [1], and the public<br>
&gt; CVE advisory is referenced in [2].<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/curl/curl/commit/507e7be573b0a76fca5=
97b75ff7cb27a66e7d865">
https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d86=
5</a><br>
&gt; [2] <a href=3D"https://curl.se/docs/CVE-2026-4873.html">https://curl.s=
e/docs/CVE-2026-4873.html</a><br>
&gt; <br>
&gt; Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; ---<br>
&gt; - Changes from v2 to v3:<br>
&gt; - Updated the patch to include the fixed commit instead of CVE_STATUS =
as per Paul's suggestion.<br>
&gt;&nbsp; .../curl/curl/CVE-2026-4873.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 32 +++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/curl/curl_8.19.0.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 33 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.=
patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta=
/recipes-support/curl/curl/CVE-2026-4873.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cd9d81a25f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 507e7be573b0a76fca597b75ff7cb27a66e7d865 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Daniel Stenberg &lt;daniel@haxx.se&gt;<br>
&gt; +Date: Tue, 24 Mar 2026 08:35:08 +0100<br>
&gt; +Subject: [PATCH] url: do not reuse a non-tls starttls connection if n=
ew<br>
&gt; + requires TLS<br>
&gt; +<br>
&gt; +Reported-by: Arkadi Vainbrand<br>
&gt; +<br>
&gt; +Closes #21082<br>
&gt; +<br>
&gt; +CVE: CVE-2026-4873<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/curl/curl/co=
mmit/507e7be573b0a76fca597b75ff7cb27a66e7d865">https://github.com/curl/curl=
/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865</a>]<br>
&gt; +<br>
&gt; +(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)<=
br>
&gt; +Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
&gt; +---<br>
&gt; + lib/url.c | 6 +++++-<br>
&gt; + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/url.c b/lib/url.c<br>
&gt; +index ec0457b..cc60468 100644<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -748 +748 @@ struct url_conn_match {<br>
&gt; +-<br>
&gt; ++&nbsp; BIT(req_tls); /* require TLS use from a clear-text start */<b=
r>
&gt; +@@ -899,0 +900,3 @@ static bool url_match_ssl_use(struct connectdata =
*conn,<br>
&gt; ++&nbsp; else if(m-&gt;req_tls)<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* a clear-text STARTTLS protocol with required T=
LS */<br>
&gt; ++&nbsp;&nbsp;&nbsp; return FALSE;<br>
&gt; +@@ -1357,0 +1361 @@ static bool url_attach_existing(struct Curl_easy =
*data,<br>
&gt; ++&nbsp; match.req_tls =3D data-&gt;set.use_ssl &gt;=3D CURLUSESSL_CON=
TROL;<br>
<br>
Hi Deepak,<br>
<br>
This patch file has no context lines, which makes it brittle. Please<br>
send a v3 with the usual 3 lines of context (that should be the default<br>
for git format-patch).<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB61891773AF17D0DF08A0B58EC4C82DM4PR11MB6189namp_--

