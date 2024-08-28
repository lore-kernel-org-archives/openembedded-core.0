Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1BEC54754
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:04:33 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web10.9198.1724835865627424659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=JoK084G4;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1724835866; x=1756371866;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XMl3kGxjeHxVRMGLpE8rkkGgvEyHHB6g+7svOJ+SMdI=;
  b=JoK084G4Xf+CQHTQZfvNK4vHa5UKLMQlv7WUhVxMC14C9Ng/R6IFcExr
   UghOjNCqc7zDaE+hVyhkSWiSxnPsPY47IS6EdLEuh/ty1Ymu5nhy00+rt
   qRfOr7Mwuy/X+NjeuFN+JnqISBBL5Sh8VSXrdGY5JwmXd+b/pb6laCC1l
   r+9nY0Bgj268wnsHQghFRQbqTBTkedrH2+3axHZSWAzi9rGfD+M4sZhco
   8ig/8kQ/0kdCEaWFdWONv9BBk5+RrVK/LKNxiBJYlvcR/Va9/i3oKhRhe
   8DJuIxaGGG9q5P7MDhyBJ4obYXicMeaTxXhVkR24n1b6w21pAqxYrpDHp
   Q==;
X-CSE-ConnectionGUID: m1Ae8QzbTdKvas/oANoB1Q==
X-CSE-MsgGUID: CY5pPBrXQDGiud0iKBt/Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="129578861"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="129578861"
Received: from mail-japanwestazlp17010002.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.2])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 18:04:23 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEeygwnU7D7irl9w+zJ5TYFbOr7KzE5p3iH4SZpJWs5ocZeOfwFXR+c7C2ozZhgM5jPRuG0Bf3NZo2qblBCQNwa0keAIhptQX1VqM5Q/AJtC4KG4QbSXqpIBrC8rHTO+RdJCgTwqztMq1rh0Peaqb0BA5wlY+nnPgRcwZzmcYrQoT4PU9Clkozm1HzMHgpR5eHpFivWvCRph9xRVq0boJ3PI1MNNHzz5N3Y9HQlEZvq2Jm8lZR1UwBaUvm2Ow+gmUWoHFUrfmVDTHU+XBcA6foaOt2Cj49HGWW71Zh6OnRr8xGp8TJNTri7ZtA2B08dKc3RNJk7L2gGRQ9EOROqm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMl3kGxjeHxVRMGLpE8rkkGgvEyHHB6g+7svOJ+SMdI=;
 b=kpxJhdGk6Y/WeJ3al99amQjCBV46xSfrPTd+X4epaB25Eek9LidKvMwh9Ut/cJPeT97YSzgzZ9q3BsF71Sp8wiN9bbcnA+7R35nLyySLKLwX3/coHF0sc8hA5MMVM51UJ/ntlBLcsVc6oLuHe4ZoZVlMyjc/JwJGmKXkGmZ8Z8RcLAx1B1zUtL8qHxnIP6uCRjgrBNjZD22rs8/l3qH4YS4+jO7SknFkPiKZGm7QVd2WdP1JPPgWS99/FqZEBRPq0/JlOPrKVZ7mUcHDctqapy/g3cGm40skQJIbIJaZaQiAuUnFWT7GZ5kbhhe0qCE9yIEd/inbJbZKK99bQMz/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS3PR01MB7828.jpnprd01.prod.outlook.com
 (2603:1096:604:161::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 09:04:19 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 09:04:19 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] util-linux: use update-alternatives to solve
 conflicts with lastlog2
Thread-Topic: [OE-core] [PATCH] util-linux: use update-alternatives to solve
 conflicts with lastlog2
Thread-Index: AQHa+STK9YCqCZCuU0WaLeB+1EE2JLI8XgwQ
Date: Wed, 28 Aug 2024 09:04:18 +0000
Message-ID: 
 <TYWPR01MB118613A796F30E757B5ED7D10DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
 <1724833600-2270-2-git-send-email-wangmy@fujitsu.com>
 <CANNYZj9SxQYZz3HUNzcS4EG_h9WYOPu_X1xW-MJXdmRkrJd8ew@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9SxQYZz3HUNzcS4EG_h9WYOPu_X1xW-MJXdmRkrJd8ew@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZDMyMTMyZTYtMzk3Yy00NTZjLTliZWUtY2I3MDc0NjRh?=
 =?utf-8?B?MjhhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDgtMjhUMDg6NTY6MjdaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS3PR01MB7828:EE_
x-ms-office365-filtering-correlation-id: 1794a6c0-8390-4c38-6748-08dcc7406625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SnBnN3NKdmJ5aDAwUWkxcWxIM2U3Z0FFT0xkS3NkZVRkSDdBK3F5SWVmalRI?=
 =?utf-8?B?TEw2blhDeFpoYmZvQmpLdStSVVlacGh5SjVKZFdCc3BGaEs2OVovU2tGVmdJ?=
 =?utf-8?B?Tmx6UWFFU0V6aGJ2SWxQM0JWcXM5bzRqTGJpd3B4UTJ1MUZ3eldkdThOczFl?=
 =?utf-8?B?THhYTFZjY2NWZjZFa1pLUzU1Y29OVUZaeDQxbzFxMGZxVkphdjF6N1NZUUhF?=
 =?utf-8?B?WUQ2bVUwMXRJc0s3LzVraGFHK05EZEhvaTlaTk1wbktnMFJ3eEdpYzNWS2U0?=
 =?utf-8?B?RzlQa0Q1T0ZBc0J1Wng3UHBqVXhOdnVYbi9abUs2c3MyRU9DNXZtQzFRbUV2?=
 =?utf-8?B?WTFONmdzZTlYVTEvSG1aSXo4K0F5SzlhdmZpNGZNelpKaVUwRit1KzN0eEN2?=
 =?utf-8?B?QnBSVnZvaSs5dnQ4K0s1czkwUXNpSlRpdldsRmlGaTAvQVdIZkhZS2VyZDdK?=
 =?utf-8?B?dzhvZjQwb2lpVWllbWsyQUlMMHdBV1REV1dyRnk3M2N2U3NaT255MHJFeGMw?=
 =?utf-8?B?WTA0ZjlySVMrVmp1ZDE5ZTRneWNVWnhKRDNTMFpzOWNTYXVTc0V5eU9iQzVI?=
 =?utf-8?B?QTVuUTJFbGg2MHdFYVhyQ3ZKYVN6TlIzODlkaWRnR0x1L3F3YURuZ3pGOEkr?=
 =?utf-8?B?ZlZDb2ZyVzVMSW1pV01aU0pKeFk3RkVxSGRQTW81eWQvbFlybzBqeWxCZW1L?=
 =?utf-8?B?WTRmS29BOUd3Y1N3WTMzRVdJbE9VOTNWNFFaa0kyQkdva1V4ZUFPb3dvam5r?=
 =?utf-8?B?bTVmMjBKczY2NTJmTE5OVXk4aFN5SVlVNnVyTGV1OGdrSkFZQ1JhR0Q3eGl3?=
 =?utf-8?B?U2tuNGVTbWFKR252THhjZ09aY3JVWCt0dnpmK3dIM25TaDgvSVFqQ1B2c0cr?=
 =?utf-8?B?Q3Jubk00TUtPRFJkMlZaRDczdzhQQ1hEWG5GT25zcGlCOGpxaUNrbnZrVWFN?=
 =?utf-8?B?bE9FUGluaFZ1QUhLUGhtOHFOWlQ1STNJSHNlTFduZ1pCREVjZXJGZVhrYVF6?=
 =?utf-8?B?MzZudDR5R3dVSWdxYXZJQUhhQzdDdXEvUkkxREovQllTd3VXWmpGWmdQZFZD?=
 =?utf-8?B?UElEU3luRmZvMkcxMWtqVHpiN0UyMzYwYzIxQUcrcUN4d0tCR1VzQlhld1lo?=
 =?utf-8?B?SlZxSm1MR29Ya3NVTVE3cWc1NThvVVFmaDEwVEMybjZyN0NkYm5hQ3B1ZXVu?=
 =?utf-8?B?ZXZQN0JrYnJLVkZ3TjN4MytWSGtFTEZaenZlSVhmc0F2N3gxZ0MyK0hEYWwr?=
 =?utf-8?B?bkIvTDcwMC9nQ2ROcWk1Mk1mZGNtTmlHbWw5VldMOXlUa0NFZGFiNmpEUjJq?=
 =?utf-8?B?U0RNTEhtdmxnZmhxT0IwbHpvVTVENG9mOW92cDRJVDFNNWRSaG9GLzhKSDRP?=
 =?utf-8?B?d2J6YXI5aVVHUzR1Nk56QnQyTHdxR2xlS1p1K0lVdURlODBIVzlQcW5wTG9x?=
 =?utf-8?B?TEM5a1gvYXNlL29tNEZHaTMyNHJuVUZjNDdVY0tUdXRPdjRwY2pmem1DQ1R6?=
 =?utf-8?B?VDlGM0g0Z1NGUmpzTmVhUDd6Z1FHQ3hFbUJnUlYxaEw5QklZWUZ1Y3UwV055?=
 =?utf-8?B?YnBsTk1hckFWU0N1QVBmc3RzZ3BpV0tabXZOekhDUmVIT0J1eE5LSUtmbS9V?=
 =?utf-8?B?ZVE4d1I1MUw4bkhyT05ORGgvQmZJdUwyQUgzcHp6S3NIc2lBb3pZdFpTcHAy?=
 =?utf-8?B?N2oyQ3ZDazV2c3VVc21tN2IwUFhEcjhkeVArcFJENDUvNDUzOUNQSDRjdy9N?=
 =?utf-8?B?SGZBOHJjaWRYLytoQ2x6Vld4WVpZWFplOERrWStUL1JEdFV3VEZ1ZkJTLzNm?=
 =?utf-8?B?WUVQb3RSRWFCMDdPZVF1WEF2Tm9BZFpkY2ZHZVB1QWNrQU5wQlZlcjJqM3Fi?=
 =?utf-8?Q?0hjjqV3EvNDQw?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aUQrcnFHdjlPWjRmMktWRkdJRTBmOUtxVFZzK0NtNmFnUFlhUUQyVHhHQy9v?=
 =?utf-8?B?a290SGhlTEV3SXM0MmJLRm5qZ0FITURITngza3ROQ2VmRGlwK2F0cHc4Nzhx?=
 =?utf-8?B?ZFdYOThWaWlVQk5wakhQTlF6T0lldlBZcVFQRTRyNzFaOVh5V1VLeWIwdk1G?=
 =?utf-8?B?QVRsTmVMVkpVWS94bkVnSkdFYlUrdjM2bzVGWGFvMTJlUkx2ekQxTmIyTnQw?=
 =?utf-8?B?dWgzT0I2WWtMUzI1OENRTFQ0RkoxN2VIZFIyTEFPMWllY0pla2M4bEhpUVhv?=
 =?utf-8?B?Q3k0VlNpS0lvSEVQcE5lVUtJVGozOEszYXc2Z0tGWTZQd1lEZ2I2b0JMWVND?=
 =?utf-8?B?OUFTTDhDM01FWWtiTzVOcFhKa2t4Nm5oL0REZzRuOGQ5SXh5ay82ZFFEdXB0?=
 =?utf-8?B?SVNPMGNsYy8rVXNRL2RqaHBwWmV0N3FSdkhoUC9oNXNqQm4yZThyV0dhQzJW?=
 =?utf-8?B?Tlp1ZWg5YURkZWI3bHBzZ3JvU3NobzNrb1JiMlRGMzlOMzU1WGxFZXpFbmxE?=
 =?utf-8?B?WXNzNTRXZEhFWGF6cDZBQXAzNHkxRW85ZGhBQkpRbmNrbEVBd0dhY0ZrNzJy?=
 =?utf-8?B?WlhFRjVyYTB4QzdDN21tZE9rQmowUlBJc2tQc20rRVcrdjRIZTBvVnZyNC9B?=
 =?utf-8?B?MlZGUlkreXA1Z1ZPbVRVSVgxMm1ibTZzVi9QWm11NWZHOXN5ZC9id0I1RXFL?=
 =?utf-8?B?YzlYdXEvU2RteWZ4QTJhYlNJL2JZOTNPRnFpMk5XV01GNlJqTFZaRmxadE9t?=
 =?utf-8?B?WkY5ZHExZ05lWkhxaWlnQ1MzanBxNnB5Zy94Rmd2TUY0QVZMb3VYVVNSNTlW?=
 =?utf-8?B?KzZrcEZwMkY0eW56VlJURWJ0VUVublBFRmQzTkdMc2FaMDZWV3JEbjlsRFVZ?=
 =?utf-8?B?cWdvTDd5TEFsZGd6Qk5JRUpuWCtSbWQ0V0F4U1ZpWldwUzl0SmtUeDBYbEZD?=
 =?utf-8?B?ZEFPZ1Y5Z0R5MTIrQ3ZheDFjdEdzSmZiYmRLU25pSFhJM0hyTUhjYVg5ZXY1?=
 =?utf-8?B?WVRTeSthK0ltQ3FaMWRYcFNDK2xFMmM5djRKTXBmK3FGS0wxbjk0c0NodEgz?=
 =?utf-8?B?SzFhNFgvS3NqY3VuU3hWT05EMnRzY3dnOWJVbVc5aW9UQ1ZtNFNBUGduVzVU?=
 =?utf-8?B?SDI1eHlSTUJReVdXSkxJNW9aWjdaM0VobmdTMll6THVoZG5vMDB6L1RPR0V2?=
 =?utf-8?B?T1RGc2xZU3gvNC9GNDlVZTRwYk9hSlhod09CT2lQaVd5SHNWVVJVQkZYRDJy?=
 =?utf-8?B?ZjYrUjVkWTU5V05yRGx4b1VPVGFSK3FCeVV3bnc4NDhhNHRzMWJxV0hxZ2R2?=
 =?utf-8?B?TDlmblRRaWQvSEZ5djN0TDNWb3YxVmZBOUdzSHFNWmlLN2dXME5rNWJjL3JX?=
 =?utf-8?B?QWt4WnJ5SWJrVnhnVnhVUEVTeFluYVhGRXgwTzMxSWtGT1RlVmRQeS9kUUVP?=
 =?utf-8?B?Qit6anNuQzNIdkFuL1ByVVRsY0ZRQU5hSEMzSEJySEFRWXdFbENtY3JZRDJW?=
 =?utf-8?B?VW03TVdJaHhSclFaWTBGQmpsZFBSUUhzNW1tdWRpYTFURDhENnhSZnBnQ3o4?=
 =?utf-8?B?aE14eDhXSmpnMjBHWVFNZTREUHZxY1c5dVgwQ1JyMnZMN0xmQTl0R3MzYWlX?=
 =?utf-8?B?UmtRSHBLMkcvYU9PV0J3SlVvRnR3K3Q5K2dwb1g1TGlWaU4zRzQ4V3FaWm0z?=
 =?utf-8?B?WU9ycFJDTEtEOGdGaVNOejdPZTRSV3hadzNMaWtmWWdpNXU2aFRORlNqay8y?=
 =?utf-8?B?a1ZadERFejBxM01DQkEvcVhWYVZQWi9lSEVmOFV0VzAwM1FlQ3RycDNJQTNt?=
 =?utf-8?B?bmZuMVdmUE8xRFF6SjJia0phbjhqTnc4RjAwRXJHSE5LaEpxQ09RaEZZd0xj?=
 =?utf-8?B?U3hoOXp2bllGaDNJVlIxdGZaK0hqUGZPRm4raGZhb1U5K0djR2RJc0F2M2Uw?=
 =?utf-8?B?ZGJHZG9yTkRKcXFSTnRETVJ1VGFlSktpVXltN085WEp6QmJjRnZCb3A3c0VV?=
 =?utf-8?B?QzhhQlRUTG10djRxd2dieWVyenRzbVl1YXAzRFRqOEJTMHlWcVFoS0lBenp0?=
 =?utf-8?B?UHJQV3hoRmsxVXlBUWFiVlJVaGI2NXN3ZnVWcU8yd1N6QzkzU0MwODVZQWJh?=
 =?utf-8?Q?J71UNrYaaBwpOQyFN+ikkzmdt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eBH4znemn9iK1xhi2jOx5Nmib0Kd/kXnVtVjEj/OPPYtLr1u0mBqW3JF6/HIzoayYWfz/6gk5M+/fAiVIxyKZa3trWkpQjr37zttlMY2ITyDnB7yNQqfelmvma+rQWeO1G8ejQCkup96GSap5dIfUPxSycP/xHeEf1XlndEMctMBH1UjSncrW+UIlF7V2nZvxnzF//6U4UK73ZbrZnMp7WczhpXCflQQZHLuH5tXMCHH0Y/pv2kgHlnTK5UCpDpR3xd+SltzxsA7C7jDcrrEugqVYb/Y/hkG7W4/HoYFyTjWKMzw+NjLSsUVJO4OK2FHMJ/RDWZ7W1Dxd+fkopbvCh0VY7Vi7RkgiyO1tWBzCuEBRvjppR5em4699BNjo4Jn58Jpq+CQL4xGCYi/a9bx7LhuEIJqqOFxh9vdE5VNCUs4f6lNj8fIBu95E1ypUkTucp6J39xCV6gDqQ7yZmLOGLZ7wT4eeccK3IloFgWgs6J8r4d9VPnuju2Pu+R9gPOnYLe2k98FpTLn9qUaFlNSlPtjE7wi+Yq9Qlq4rlVL1agoCZf/PKb1a3lKTutqEQsCWFYJyEMxyUDIBGv64wMJhmiZ4IZWHA8B8tdlWX7y7EjqoA5BrdGpGMjTnKuetiXD
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1794a6c0-8390-4c38-6748-08dcc7406625
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 09:04:18.5209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VG5g7FDjHEbu2IsjNge8jxBARsY4uHLZPPqJjfInTRizveDzfncD1G04cR/qkIW+886mn1jQBKtk3m7jegWnYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 09:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203873

SSBmb3VuZCB0aGF0IHRoZSBsYXN0bG9nMiBoYXZlIGJlZW4gbWVyZ2VkIGludG8gdXRpbC1saW51
eDoNCmh0dHBzOi8vZ2l0aHViLmNvbS90aGt1a3VrL2xhc3Rsb2cyL2NvbW1pdC82MGJlYTlkY2Vl
MGZhMThlYTNkY2UwMzcyYTE0ZjVlNGYxNzdhZGE2DQoNClRoZXJlIGFyZSB0d28gc29sdXRpb25z
Og0KMS4gZGVsZXRlIGxhc3Rsb2cyDQoyLiBBZGQgUkNPTkZMSUNUUyBvcHRpb24gZm9yIGNvbnRy
b2wNCg0KV2hpY2ggb3B0aW9uIGlzIGJldHRlciB0byBjaG9vc2U/IE9yIGlmIHRoZXJlIGFyZSBh
bnkgb3RoZXIgYmV0dGVyIHN1Z2dlc3Rpb25zLCBwbGVhc2UgbGV0IG1lIGtub3cNCg0KICAtLQ0K
QmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9H
WSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENo
aW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiAr
ODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyOCwgMjAyNCA0OjMyIFBNDQo+
IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSF0gdXRpbC1saW51eDogdXNlIHVwZGF0ZS1hbHRlcm5hdGl2ZXMgdG8g
c29sdmUNCj4gY29uZmxpY3RzIHdpdGggbGFzdGxvZzINCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBpcyB0aGUgcmlnaHQgd2F5IHRvIHJlc29sdmUgdGhlIHByb2JsZW0uIFlvdSBzaG91bGQgYmUg
aW5zdGFsbGluZw0KPiBvbmUgb3IgdGhlIG90aGVyLCBidXQgbm90IGJvdGguDQo+IA0KPiBBbGV4
DQo+IA0KPiBPbiBXZWQsIDI4IEF1ZyAyMDI0IGF0IDEwOjI3LCB3YW5nbXkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5j
b20+DQo+ID4NCj4gPiBFcnJvcjogVHJhbnNhY3Rpb24gdGVzdCBlcnJvcjoNCj4gPiAgIGZpbGUg
L3Vzci9iaW4vbGFzdGxvZzIgY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkIGluc3RhbGxzIG9m
DQo+IGxhc3Rsb2cyLTEuMi4wLXIwLmNvcmUyXzY0IGFuZCB1dGlsLWxpbnV4LWxhc3Rsb2cyLTIu
NDAuMS1yMC5jb3JlMl82NA0KPiA+ICAgZmlsZSAvdXNyL2xpYi9zZWN1cml0eS9wYW1fbGFzdGxv
ZzIuc28gY29uZmxpY3RzIGJldHdlZW4gYXR0ZW1wdGVkDQo+ID4gaW5zdGFsbHMgb2YgbGFzdGxv
ZzItMS4yLjAtcjAuY29yZTJfNjQgYW5kDQo+ID4gdXRpbC1saW51eC1sYXN0bG9nMi0yLjQwLjEt
cjAuY29yZTJfNjQNCj4gPg0KPiA+IGxhc3Rsb2cyIGFsc28gdXNlcyB0aGUgZG9jICcvdXNyL2Jp
bi9sYXN0bG9nMicgYW5kDQo+ICcvdXNyL2xpYi9zZWN1cml0eS9wYW1fbGFzdGxvZzIuc28nLg0K
PiA+IGxhc3Rsb2cyIGhhcyBhIHByaW9yaXR5IG9mIDEwMC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmIgfCA0ICsrKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmINCj4gPiBi
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmINCj4gPiBp
bmRleCBhOGUzNDY1MzlhLi5lMjFhMTZhYjg0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQwLjIuYmINCj4gPiArKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MC4yLmJiDQo+ID4gQEAgLTI5OCw2
ICsyOTgsMTAgQEAgQUxURVJOQVRJVkVfTElOS19OQU1FW3Vuc2hhcmVdID0NCj4gIiR7YmluZGly
fS91bnNoYXJlIg0KPiA+ICBBTFRFUk5BVElWRV9MSU5LX05BTUVbdXRtcGR1bXBdID0gIiR7Ymlu
ZGlyfS91dG1wZHVtcCINCj4gPiAgQUxURVJOQVRJVkVfTElOS19OQU1FW3V1aWRnZW5dID0gIiR7
YmluZGlyfS91dWlkZ2VuIg0KPiA+ICBBTFRFUk5BVElWRV9MSU5LX05BTUVbd2FsbF0gPSAiJHti
aW5kaXJ9L3dhbGwiDQo+ID4gK0FMVEVSTkFUSVZFOiR7UE59LWxhc3Rsb2cyID0gImxhc3Rsb2cy
IHBhbV9sYXN0bG9nMiINCj4gPiArQUxURVJOQVRJVkVfTElOS19OQU1FW2xhc3Rsb2cyXSA9ICIk
e2JpbmRpcn0vbGFzdGxvZzIiDQo+ID4gK0FMVEVSTkFUSVZFX1RBUkdFVFtwYW1fbGFzdGxvZzJd
ID0gIiR7bGliZGlyfS9zZWN1cml0eS9wYW1fbGFzdGxvZzIuc28iDQo+ID4gK0FMVEVSTkFUSVZF
X0xJTktfTkFNRVtwYW1fbGFzdGxvZzJdID0NCj4gIiR7bGliZGlyfS9zZWN1cml0eS9wYW1fbGFz
dGxvZzIuc28iDQo+ID4NCj4gPiAgQUxURVJOQVRJVkU6JHtQTn0tZG9jID0gIlwNCj4gPiAgYmxr
aWQuOCBlamVjdC4xIGZpbmRmcy44IGZzY2suOCBraWxsLjEgbGFzdC4xIGxhc3RiLjEgbGliYmxr
aWQuMw0KPiA+IGxvZ2dlci4xIG1lc2cuMSBcDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiA+
DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIw
Mzg3MCk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8yMDM4NzANCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMDgxMzg1MzAvMTY4NjQ4OQ0KPiA+IEdyb3VwIE93bmVyOiBv
cGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJz
Y3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3Jl
L3Vuc3ViDQo+ID4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gPg0K

