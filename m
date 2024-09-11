Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE18EE01FA
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 00:57:30 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web11.12166.1726016239892508022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 17:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=ZsK9SN2b;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1726016240; x=1757552240;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ae56kTglArjaubq+9tju/7D3aUfr6+HuUmdnlW4KKNg=;
  b=ZsK9SN2bJBwNh6DaY2vQ4uRVBDJNEF8CmtjNGkakma+ZJzLYIyzynht9
   cvxWoWwoQElPFlPPedsFY44ZnLFLpfbqj0uqN3PWNr6ixrJSvaMMZhPxe
   BqWxt620u+RWEnu8un9TdozHL5qpzwFayZaCFHud9zjLbaKd7SISvaEJn
   5/NnKYqco+zVMMWeelwjYSNCWIJUGzJ6ZjMSlFXVU0gWUCrL5ns5D6IfC
   mh059BDrvWzBCu/lfWs3e9v1t7MZG+9Q+rGNsCJxk19ogNgZo7XXem+Af
   IQuajHPkB6NfnMeUEA36PakwX/L4btuvRf9Idjnu/SujOGVNW4lgQ0fWe
   w==;
X-CSE-ConnectionGUID: cOv5Dpz4TV62RJhXqWFqRw==
X-CSE-MsgGUID: psAk26BHSY6muEc1V5Ydvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="41505054"
X-IronPort-AV: E=Sophos;i="6.10,218,1719846000"; 
   d="scan'208";a="41505054"
Received: from mail-japanwestazlp17011026.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 09:57:17 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APBG6ec98aZ4RAA31+2XMmRXu7cDf9yAQrXjWSdnhwat1YZQQhCguBI1hQHqPm5YzhglUvgDOePkMEesSFvoeHQEnvCXARDD1AoD3sozM0JI91uXyrj6JcPGw89II67UsHrYTDq2bUSJK1ZhkCzKAvFtG8x1JkQP9Fh8IevbhndUFBYXRpJtfDsC5ZknNhT8bkaKoPv7/s9kqsDI7XcnigGfo28wXcXmth8/wisQA0khiZ00zN0JLYynS1MCqS8vroLS8D60prnwWIIFYk06Qp7VEJz3iiB/CHCYvd4nJI/bFyW7HTrEMOv24t4elrsqOFRTL3GfKcRK/al4O5pJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae56kTglArjaubq+9tju/7D3aUfr6+HuUmdnlW4KKNg=;
 b=FVQt+PEHqV+zxUfGY11/KhBuzPe4RLsUv8LEn5E5CBU1dLSXa0T9DFiqVBAZBFcAb6rXVjggJBRiGVmjH9+DfVWVUUc6lAdEipWrgoAAAdbK9CSj9ZK9HakhPvQfKe8bxjOweuZL9HGiM90Md02/l0QdOz5imvy7myuW2Nrm3euUm1ZYVBeg2ed4YbTgoy0pGAawuO/z5TpPk4JPAnakkogojc+WobOdDVfe6QR1WEP/lnGfkTSAMjEkiuXyhuYVlccluAXQ+E/YzFSYX/RC1eLVyk277R8PxJjCIrbmBru2AFJWdipiu7ThA9bAfyI7I+b0wlM31O23gO/UyE5ksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS7PR01MB11883.jpnprd01.prod.outlook.com
 (2603:1096:604:236::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 00:57:13 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 00:57:13 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
Thread-Topic: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
Thread-Index: AQHa/dvum2Yv2cjVHE2/cNm7Bqfbf7JGmw+AgAA6iRCAAGyOgIAKh2uQ
Date: Wed, 11 Sep 2024 00:57:12 +0000
Message-ID: 
 <TYWPR01MB11861E1ECD39B7393DD34BF27DC9B2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
	 <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
	 <42ac587c4e691d9c2526e9088de9bc27bb92b0b9.camel@linuxfoundation.org>
	 <TYWPR01MB11861E7CD3D6346AD5F7A1748DC9C2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <cb42ff87d8f75d838619c9073dd9e1e9781d7235.camel@linuxfoundation.org>
In-Reply-To: 
 <cb42ff87d8f75d838619c9073dd9e1e9781d7235.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZGFmYzhhMGQtMTM1Zi00NDAzLTliYzQtNTZlMWM0MzBk?=
 =?utf-8?B?NDQ4O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDktMTFUMDA6MzY6MjlaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS7PR01MB11883:EE_
x-ms-office365-filtering-correlation-id: f57d5869-1ee8-40f6-960e-08dcd1fcac1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NkZsbUdtZ0lPYTFTdzU4dFZpSStiL0x4Z3kvSSsrdW13QzB3Y1g0ejZRVmQ1?=
 =?utf-8?B?eFB5bjZZOWhMRk54V0JKZVp5aVZqOE1GWFBBeTBoMEliRnNDUERVZjlxd2xH?=
 =?utf-8?B?TEFsTGplWkpQa3JwcnVhYysrU0JnODc5bXZzZjgrc1VtY2E3L2pwZ1I1QThE?=
 =?utf-8?B?bHlBcnhHTU9WQ2lqUEV4YUs1RlIxN3J3UG9FNHhQRDlJQnB5dDFNWFVlZS81?=
 =?utf-8?B?T1VvNEpQVXpodWt4enBCMWhUOGVRZUtpc2o2NGM5Q1FuVjJNT0NKdTNKWHdi?=
 =?utf-8?B?QjlMWTluWWVkMHordnVBbCt6akRWcGVPU25Oa0NpTWt3V3ZNd05Tdm02RnNs?=
 =?utf-8?B?L2xPNFRkMzVPeHV0N3ZDZGlERG96QnFDTkloSGFxdEVIbEZ4NElZdE1TbWJW?=
 =?utf-8?B?RzN5dDU2cy90K0picTBORC84OGVlVTU1eTZtemVzYWlpS21makQzT2Q4WUJI?=
 =?utf-8?B?Vm85U0dMZmlmd1lTN3JiVnBCRGxpQkhCMlhHczJSWi8rdjRkTzF4cmVYcUxT?=
 =?utf-8?B?c1JFYlA4YTlEU3F0bzFONDRaS2krTEJLYTB6dm1ocnFTcU15MExRamVVblh0?=
 =?utf-8?B?UEhHZmx5OUM4c2VqR0g3NWtqbHhiczlicHNiRkc3WDNqNlhhNG0yOEpraktJ?=
 =?utf-8?B?U0pnb1dJbm5YemhWUklOZzk4QlVpa05nWVBya21KZ0toc3lHd2g2ZndJbms4?=
 =?utf-8?B?ME83OVVGM3krcHVpdnQ1SXhPS3l6MGJITDE1b1c3SW0zSG41MjhyNnNNMmVl?=
 =?utf-8?B?RWhJS2VXRnZBTEtUUlk1N3MyMHZtRGoxcnNUK1VoL2RvdC81MG1SVmRvdzYx?=
 =?utf-8?B?aGswMzVua1ZMQWJWdEdEWFh6L1ZBOVl0TDBJSHZaaHhxV2ZVSXFQWDBJaUZP?=
 =?utf-8?B?ZW1za3lKU2poSlVxVmJwZlpvWE1nWnpORnViZDQzK3lzQlBraGpWZExlM1dh?=
 =?utf-8?B?SWx0RDlvQUN5MEhnb3NjN2l0YnBPN2xxTThsZUZhM0hJWUVpdm1mZE5VOHkv?=
 =?utf-8?B?UC9BUlRNdXVGV2tKbkhsUFlMK1hJNXRlWjFDd21VTmNEcDM2SkVKRXJqa3Jm?=
 =?utf-8?B?eStCaCtJdVNFM04wQVRmRXFnVm1tb2xMd2pwNGxQalgyMG1tcUVhNFZLSFgx?=
 =?utf-8?B?QXl1UWcwRGxMUHpKNmZBSE1GUjZ1QmN2blpvVDJGZmtJU3RtNlNNaWJVSXJ1?=
 =?utf-8?B?VWFjc2RHMVloRGFjTzVJR0NqMkliY3VWQ1E4UDA0UUxEVkZlaGV6dWR4U0Ji?=
 =?utf-8?B?S1dNWUVqbnVROXozK2ZLWm42TVBtVkhCNTBjUWVxS1RvcDZQeGIxSE1sOGFD?=
 =?utf-8?B?cEtZSjRwUHpRa3Q4UzNIYWZiUlRwdWh2aU11aWZnNTYzR3JxUWV0dDdVK0Zm?=
 =?utf-8?B?bFNrZkt1UFVRbmxIbjAwdGlvUTBGT2xyV1FYRE41Q3B6MC94a3NCQm5RZmx3?=
 =?utf-8?B?azdLak9pTm9zSUQvMTRmc3ZoUUQ5ajZqbUZEc0d5SlkzR2p1Um4wOTBrdC8x?=
 =?utf-8?B?dnAvTzAyZ1ZRMEwzUnFPMXY4bUZQaDNYVThnWkcxbzRaSnZsM1FRc1c5NEJ1?=
 =?utf-8?B?bUQzV0ZQT1ZHKzJabUFOYU05YjRaRk5PdWczTnowNzYyWWNnaGRVSTIyMXg5?=
 =?utf-8?B?Q0wrNVN3dGlGQTFFSkluLzhqRFRHOGdVb1MraHZZbUtTUy8wMU8rU0tYM21u?=
 =?utf-8?B?SDh0Vk5saytYNjFpV3dFWWZ0Z3NydjVOUTBndTRkT0Y5cFhpTWgzQ015dlVG?=
 =?utf-8?B?cmIycEpBN1B1UnBNelE0ZTBOZkRjQmk5VHhhSkF2dldKa3pGMi8xUnZubGRT?=
 =?utf-8?B?WkNvSDdMWlFTcjJrWk14aFNQd2VuM25xbWVTdjVtWjVtTnJYcG5raHNqTlV3?=
 =?utf-8?B?NWxPTWtZZndUalk1aWt1bit1b2wzMmIwMmhPWGpxN3FkRnhVQ3p3V1Jsb3Mx?=
 =?utf-8?Q?IRGQVfN9KEk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RXNDVWlXS0dhc1F4NXFPT1o1Rmk1LzJ1cnBmVU95UjR1aWYvSllzVE9iNFZ6?=
 =?utf-8?B?TjBTcVUrZTdhVzAvU24zVWpvTEJqZTc4L3ZreFRqYzRmcWdXcTBvZmhlNFhm?=
 =?utf-8?B?dXRWVlIzSFBBZHI4aTNHMlZrd2Q3V2hlTG96eGtxd2VNTVNSb1ZWZzk0aUln?=
 =?utf-8?B?aU91cVJrMjBob2w1Q2J6eEhlaUVGV0Q1V0RnRVdMOTNpeWNqY2VINXcrc0Ru?=
 =?utf-8?B?cUFsT2swZHpDWnVyTDJ3VGNjY2lkNTRGSFNoaE5Kc01oeVEzcFdGQjY4UXdM?=
 =?utf-8?B?VHdFcmhUZ00wNWtqeXRxekExemtCSkRxeHBnRjhuWkM3S0lqcklZR0U1QklP?=
 =?utf-8?B?ekQwVnl3ZXloUFBKV1JMcGdwcG1wUVFiOUxqVU1nMEN4aGN3VStqdm8wb0hM?=
 =?utf-8?B?d0JIeVRjSzdvME80TElPcnpnbW9RcVFnS1R5NXRtU3R0Y0dkWTY0L0h1dzdw?=
 =?utf-8?B?YlZlZkl2YmxreVg5eVJ2YzhoZlA1cE5OekpScUJBbWc0aHo2blduQjFqamha?=
 =?utf-8?B?VGhKSDc4cnFPTzBmM3NhK3pRTVNMME5nOFhiY1Z0aDAzYTZkVk5oTVBtSHJR?=
 =?utf-8?B?eUdPeEsvaVlJeXc1UTlZNzdEN3BlTUt1QnYxNndITkNLQ2pWekZnY3RQd1pM?=
 =?utf-8?B?aFExSDRUamREcXJOUHhtSkhDTzBSVzBHQ1Q1M1kwZjJ6YTc4VXVIT1N0VDFx?=
 =?utf-8?B?UDV0ZmR5bXRzZ3U2bWhyYmZDNFlybTZrYUlzNmJxQWVldnpSdEdsb3JvZ2NN?=
 =?utf-8?B?N3I5WFVMa3RSRE5UdTAzRXdiQ01HZGdEZmxyMlV3RWsrMGJJTTlWdElIemcy?=
 =?utf-8?B?K1g2aSt3aXZoZUlPZjhvbEk4bnE2eW51NXlabGM0Q05DMTg1MDdoandhTVF2?=
 =?utf-8?B?Z2FKQTZScjVseXZIejJsN1lpZEZhaTdPWmUyTm92eVNNNFhTei9EcHNFWGp1?=
 =?utf-8?B?dlBYMTdMRVB6eDdVUUp3TDZTUU9qRTJiWjlTeHdnL0tTMVkvOHYvV2tCbmFL?=
 =?utf-8?B?QktYQ3hFajJkMnFQblhSZHp4c0VpT0xuZDY2Nnk4SWUvS0VJSlp3YWV3UVNV?=
 =?utf-8?B?cTlXM0VGUGZDQ0NSaTFoblhBeXlNYVRqcjNWcEFPcUhsVkNXVFlSZjF1Znhw?=
 =?utf-8?B?NmhTZUpteC9XRWFXWDhzb1pXNlVCeUcvdHp6OFp1TWQ0cVRud2tnQUY0UUhM?=
 =?utf-8?B?OG9mZG9JNi9PZDJtZVdKbnQwV29lenNmdGNML1NQbGpGQkxoeXpPYmNHUnV5?=
 =?utf-8?B?UUhuSmJPS0Y5V0pIUlZxSzQ2dUpiemdnZkpwbWMvMTBGSElhSEtXQ2dmMmVJ?=
 =?utf-8?B?djhmWkcySjJLMDYzYnB1OU1EWVVmUEt2Wm5sZGo4MGVyYzY3OHVwK0JDNlNM?=
 =?utf-8?B?SnRaRm95cHM5SXlNcncxVmVqVkJtTXdoQXhZcVRzTFVDaDMxOWw5czM5M2ZK?=
 =?utf-8?B?QjFrSFRoSGNQQjIrZUNDU3hkYlNWbjczSDFqak53eTh6bmpPNExuNnlsWDZY?=
 =?utf-8?B?VDBHVzlBVW52elBuNHY2dFV0SHhMYnBzeURiWEYvVjdNTldxM1lPTmh4ejI1?=
 =?utf-8?B?Y3BCSjRWVXFqUk5CZXUrYU1jS1hsazdWWU4zOHJGdWlFQWQ2b2VYZDd5NHN3?=
 =?utf-8?B?NnozMjdVQzgzRXZMNml3aW45cFRMTGw2dDJMNFFreXU5Ym9Ydk1ZRGRsWDE0?=
 =?utf-8?B?NWdwdE9xdkh1M2RHWHB4UFcrVGpSaDBQKzAyZm5ZT3o5M0N6RXRSTXhSQXhU?=
 =?utf-8?B?OFpXTkZIa3QyVHhwVlBCRDNBbCtNMDlTbklrQXRiSG03Y1dsQ0hvMUxZeFBh?=
 =?utf-8?B?V1piLzBmNFpoUkZrQ0lNSVdmTmFZbDJEcUtLSHp1VEVqVjlLSXZscHczOXh2?=
 =?utf-8?B?N29GRWEyWngvNHY5TVlmOVMzWVZKV2JyUm5qTDFrZzVkaDYya2pjei9yMkt6?=
 =?utf-8?B?R3VrMndLSmhaUFYxSEJEai9LRlJHbDgvNWoyTHlndHVDbFgxN2xJUXdFYUt2?=
 =?utf-8?B?VC9qQ1RTMkcySzlpSUdibWREUTRRRXVPcDBTUm50Zm9pTFYxOGpnQ08rd1ZH?=
 =?utf-8?B?ZGhFMDlXaDV4VGtGNTI0a0t5UXlhMmNFck1uSlFUZnJaMTA3aWdWQXl4TlNF?=
 =?utf-8?Q?HbJw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qiHhMHUtVyS7IifsPLPsRrqAKtP8t2DboL91dWd2ybHv2a29k/w3YwTcug9Kly35IabPWZanybACeQGuO42l1L0omCbOAYPzNGH7zwcn6tEgzjxP5oMT4geejGWkj0QaVdOsbG/OZfM2x0IpErEt0IeZSQDGRO8ePCfpJG+JXANYJHf3v7GJiFgmNmNK40AuUqdRPiRVINV3FqKRt6a9ckSdO3GS18CC3QxRdnuTVmLMkywXOOgGCIvR1GMW9GvpA1XZfrWB9Eib+NF8rStZA857ezKqzaGyA0uaMcqWzauDugml3Nz7lm4NnZLb6Z8mHaw7JPuRkRnsOPUE45+ijxi76Bk+k+tzuAXbSDhPs2Xf/Qk139rHlEIyEMexEt6LB4j5ZVewOv5nEuBtwp2HB3xfiggrA2yOGPuN9YAX5Bd2vmxWXJeIZ22cy4tTaklgJHuKh9M1fb6Um5djqi9Uf7XmjvXiodKe/yzjMPwV5P032DLh7fla82tBSC/dgLeTNHdm5vQqTnAvSoOCIZsVlrqwBKP2+gC5nXgOzDTDBs9xRPvo/BR2NPFcNgGIpYtvKOrs2qauZqKCDSjXCf8CGm3o38thtR7eOYLRGrhtCZmGThigZpurbS4HCiv1Cmjl
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f57d5869-1ee8-40f6-960e-08dcd1fcac1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 00:57:12.8874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IZfv5EJ9saCNc/UJZSmWZ7Zl1+KRgqNakY3yO8eNaxib9/byeZsLbAoSCjyDiYmP4Xsf/I41OASHgDB1UjlHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11883
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 00:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204371

SSBoYXZlIGNvbnNpZGVyZWQgdHdvIHNvbHV0aW9ucyB0byB0aGlzIHByb2JsZW06DQoxLiBBZGQg
cnN0Mm1hbiBhbmQgcnN0MmhodG1sNSBjb21tYW5kcyB0byBIT1NUVE9PTFMgaW4gYml0YmFrZS5j
b25mDQoyLiBDcmVhdGUgbmF0aXZlIGZvciByc3QybWFuIGFuZCByc3QyaGh0bWw1IHRvIHByb3Zp
ZGUgc3VwcG9ydCBmb3Igb3RoZXIgcGFja2FnZXMgdGhhdCByZXF1aXJlIHRoZW0NCldoaWNoIHNv
bHV0aW9uIGlzIGJldHRlcj8gT3IgaWYgdGhlcmUgYXJlIG90aGVyIGJldHRlciBzb2x1dGlvbnMs
IHBsZWFzZSBsZXQgbWUga25vdw0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklU
U1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vu
emh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0t
ODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215
QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6
IFdlZG5lc2RheSwgU2VwdGVtYmVyIDQsIDIwMjQgMzo0OSBQTQ0KPiBUbzogV2FuZywgTWluZ3l1
L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMDYv
MjJdIGpzb24tZ2xpYjogdXBncmFkZSAxLjguMCAtPiAxLjEwLjANCj4gDQo+IE9uIFdlZCwgMjAy
NC0wOS0wNCBhdCAwMToyNSArMDAwMCwgTWluZ3l1IFdhbmcgKEZ1aml0c3UpIHdyb3RlOg0KPiA+
IEkgc2V0IG1hY2hpbmU9cWVtdXg4Nl82NCwgRElTVFJPPSJwb2t5LWFsdGNmZyIsIGJ1dCBJIGRp
ZCBub3QNCj4gPiByZXByb2R1Y2UgdGhpcyBpc3N1ZS4NCj4gPiBJcyB0aGVyZSBhbnkgb3RoZXIg
c2V0dGluZyBuZWNlc3Nhcnk/DQo+IA0KPiBUaGF0IGJ1aWxkIGFsc28gYWRkczoNCj4gDQo+IERJ
U1RST19GRUFUVVJFUzphcHBlbmQgPSAnIGFwaS1kb2N1bWVudGF0aW9uJw0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0K

