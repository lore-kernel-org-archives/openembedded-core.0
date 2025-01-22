Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8145C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 00:17:06 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web11.31239.1737505020951444641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 16:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=eIywmmed;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.101, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1737505021; x=1769041021;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0l4GFyT/qOkdYBXDOYhJ9GcS77SUesZ0OdIq0C4d3c0=;
  b=eIywmmedwEg4c8Zq/82qICDuCzH7fMoDg7fhT4sE9pdultYWu1quzCtN
   r+B1bqW6zxRhehJEdnrsfRO6m/IOjt4wTsYEL21hstmg89Fjmnk+FV+iR
   e+/LORaXFxUyLFllICZXFLLuTXeA3NtLuN8GvCRdUNdN50m0EwfA8iFuW
   BUsuK7TUl/q5jD1dvzKzb6ggjgA4Gkyx1/wm+SqANUwTUpilZBQD0eOsX
   5DttYhmN2YmSxi1BAxeaaZhpPIhciag47d0A3mFQBIcx8MRu7ex1/0efB
   jwuxwm4mEWOl7pYQXTVD6a3Cy4Lx29LdqGoSk0mOlpEdX8k2clltP6iRC
   Q==;
X-CSE-ConnectionGUID: 1oLASCsHRPCmWbovRc0+BA==
X-CSE-MsgGUID: dGM4b65lT3GOTsAVFniR1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="143218666"
X-IronPort-AV: E=Sophos;i="6.13,223,1732546800"; 
   d="scan'208";a="143218666"
Received: from mail-japaneastazlp17011026.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:16:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjWm3dXH8j8fjbbJ1iHlJcU1vQhHzZc2TVgtJhgsNBIE3HB8qU83NcenmT18Og2x+RYQ6ZX3Jdf3uvvAnncR3U+1MC6VNxrlzBPCQewTq3it0HgtWMZdUGQ2LMV/wSoxhEVgECL1sb3FKp7PhXHaD33+7GXKb4Ae0ztdyF/oWxdlTyvZ1xmkVsjO2846WmA0PlCdthPb9F+ZlpZlg1dG/Pcffv9Oi7agQW90/8sInvyV1bYzvOt3KocBTAQ6yqwi3xD31hm2Z/fdSS2+xHUlVjd3s21tSfpnz+SrAjFx3GVnJv72Lj+bgr6tVEMUYOd7w4KvZKmqlF9RNXOzq7CWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0l4GFyT/qOkdYBXDOYhJ9GcS77SUesZ0OdIq0C4d3c0=;
 b=rxqOfnMrGhSZrszVIObUX9z+YMA7jDQoickjnvw/rU5T116nCU4Y9yMsxVjLcW0JmWwoks2lPxFZuVfpKqnUy42+rSnMm4XpeceX2BCO9if0cfKu/c9QDWr9y2oH3cAtY9gmgIURjsM6u0q7+OyglVG91KG8dHNUqSAglX846ILpOm8I1EjrHijYZOkvtRZIElODd/ChilVWmUOwkFc7uvlJgpoNOX+yTo79kZgXl/IxDg+BrtDFU3hdCp5WqudqEPtPXqYYSMrCf8qUUXkrCTicYp451gf0fRsv3SKgw9dmJjK2pCeaxUKkTXaQmXpzrY++pxgGaRTePJmNkGM5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY4PR01MB14037.jpnprd01.prod.outlook.com
 (2603:1096:405:204::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 00:16:50 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8356.017; Wed, 22 Jan 2025
 00:16:49 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "ross.burton@arm.com"
	<ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Maohui Lei (Fujitsu)"
	<leimaohui@fujitsu.com>
Subject: RE: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Topic: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Index: AQHbZ6xZzTsZ6qT/3Ey33XrVQ0r3ubMhY4gAgAACcwCAAJBAcA==
Date: Wed, 22 Jan 2025 00:16:48 +0000
Message-ID: 
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
 <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MDdmZWJmYTYtYjQ1OC00ODYzLWEyNmEtOGY5NmUzM2Jl?=
 =?utf-8?B?OTUxO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTIyVDAwOjE2OjQxWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY4PR01MB14037:EE_
x-ms-office365-filtering-correlation-id: 45f7369c-5fd3-4ce6-5b59-08dd3a7a1054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z0RKTTZLb00yblVscXZRNkorcDFFdDRMWjhqNnJwbWpLanhjREIvNE52cjds?=
 =?utf-8?B?TDM1U2UwRnY4aER0NnkwT3NzcWNaMCtHdE9TVlkxNDJEbTVSclhZTGN5dDJH?=
 =?utf-8?B?N1RBTFlsTDBuVXNoR2RiNzd2MkxoWldKVnJrYm5DWlpzQzN6eU5qcytLUHVz?=
 =?utf-8?B?bWMwOG1Sb20yTFNCbEs3bWpPZ2dJdGhCRUs3NVN2ZDNIVVBBU3Z3N0dHbDAy?=
 =?utf-8?B?dTdESUovUFV3UWk4Y3ZmQTVTcVNUZU5OeWRhNlhnTHZCcU0zcUVoVHJJbXpD?=
 =?utf-8?B?RkxDL2hWQkVKOGE5bjA2a3d0eU5KVmlJTzlnWit3eXNrOTBQdUtxKzNvNkV0?=
 =?utf-8?B?OTRES3h0WmdnYkJOYUkza2ZqdVlIa3paWWpIbzhpTXpxdXc4dlZWSktSb2tY?=
 =?utf-8?B?THZmejBhK1RaT01RN2JFM0J5bThSODBpU0hBcW5oMDBlNDE5ZHNjMGFoblB6?=
 =?utf-8?B?QjNBMXFsSW92YlN5ZWtyLzhPWThqazl3clFlbkFnZzgyRnVmSmI4bjBudmJE?=
 =?utf-8?B?Zk9XWmYzUVVURlBBS1UwUzY4VXVCZjMvT3JUOGVWQU1tN1V2S3lXdHAxUHZQ?=
 =?utf-8?B?eWZZQndvQThLbEtKaE5YbHpQb3lvOE9QSFZSUER2aTBMQTJHYWszM3ozZEwz?=
 =?utf-8?B?bkFXK3JJbkhnUE5NZnZiSDFlSDVody9PQmF3ZFNhNFJYY1hkZjgwZFBHb1d6?=
 =?utf-8?B?Q0RKcXR4cW5PalBvdENwYXcrZnpOTjNXcVQ2c1ZuVkYvZkVnanpTTlh5Y2Jk?=
 =?utf-8?B?WWI5cSsxRzV3UjBLZ2gxTUVBRitqNzhJb1pGTy9zQWkxUWxHWnRqSlhoVXRP?=
 =?utf-8?B?QUFham9jV0JnVlZ0MHRjSzV0ajNkamVZU3czRXBQMWcralQxS0ZDSTdlRnR4?=
 =?utf-8?B?d1QvRzYyazBSRE1HMVg3aHRBRDdRcnI2ZUpoYnhwaVBVRzR3VkJrek4rVXlp?=
 =?utf-8?B?ckhrTktzbSthVmVpbE4yUlEwZVQ2cnFlcVNVZFV4UUtSaHA1Yk01RU1YZ0ND?=
 =?utf-8?B?aEVtWmh6NWkyRE5mcENEL3pRcjcvZXcwM2dFLy9PSllOYzArc1B2SFZ5WHg2?=
 =?utf-8?B?QmZmOUVvOUdLUkx2T2N0WFJVTDFNQk41bkdXQ0xoSlk1L1BxdjZ0UVd3YmVD?=
 =?utf-8?B?Sk1jczAzODRZL0NjWjdzMG5zaExReUdBU2F0M2w2K3ZHd3EvTEtkendjQzNZ?=
 =?utf-8?B?MXVja0cxenU3OUVwYjgxTTBXcGNzR3RRZmVhcElHeE1LMGJZU0dQWTQvYnI4?=
 =?utf-8?B?VFRja1Y0VHM2NGVKcGRER1pUaHg2YWdRaThvbjBjNk0vMkVjMWMrNW5WZzhj?=
 =?utf-8?B?Y1AySDFBeUd3M2N0SDU5V2NrT0FvbXJkTzVyYUEvY2N3WXNqTSsvUnVJSTRo?=
 =?utf-8?B?NnJLMC9TYnJ1eU1rVmFCMWp6VHh1ajgvZWw1aUYyUm5EQ1M3SGgraGt2bVNq?=
 =?utf-8?B?ZWFzbC80Vis0amwzRWY4VTkydUw2RVlRVTllRGNDaXJFNTJ0anRTS2lWZk8r?=
 =?utf-8?B?Q3ByRGJEYjZXQ2xMOUtvQUFZaGxRN2JlWlQxQW80MGJDeFNsVDg5RUx4b0RW?=
 =?utf-8?B?eW5TcitOWUZzUURHZkV1K0hWWWM2bytQYUorRUZ0VUxYaUlKL2RlekV1eWtX?=
 =?utf-8?B?U3ZHUk5qNHBIdU0vVUtCcGsrRUZxOUJ1YUZtT0Qxd1ZRTFppK2ZQQWJUSVlX?=
 =?utf-8?B?eW1LQnhUZS9rNmdjSXdFWlJLbGo2b2w2SWdMQU9NVEhpOGlNSk1oN3ZlRzFH?=
 =?utf-8?B?dzNYdkRFdDdYTFF5RGxrMk4xOC95L2xtc0JKRGR3MWo3UGhGWFArblNIekE1?=
 =?utf-8?B?dXRzQTNrbUo0blBDL3F3Z0wzV0QrTi9TbGdHWk1zOW9lVUdNaVFHaFpWWjBq?=
 =?utf-8?B?SHZjcDAyQW9xWStpMm9TQW9BY2YwVnE5akZwcUN0bXJpekVxdE9rMEdBRmdq?=
 =?utf-8?B?dGJ4S3E0ZitBZHYyWUdNTEZQWm5nREhSZTU5enhvS2JwMGRxdGFlZWlUQUZC?=
 =?utf-8?B?WkZROXcxYzdRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckhvbm5kTkNEUjdhMzhtYk9OSzUvc1J3Mk91QnJwaGRkSXpoU1R2aTNSMnh5?=
 =?utf-8?B?WDZoaVVNRmJxUVNqaVAyU2R0dmlOeTEyWXViS3dpYUlsaTkzdDdtcWRLSHNM?=
 =?utf-8?B?MXRNSEJ2WEFCREtrYVNaSlgrMHNHSXhVeG5XcWhUZ2EwYlI4SUlscE9RRGN5?=
 =?utf-8?B?bHZGQVh4ZDBqaUloa3FGc3VuUU1hM1JaTDVxaWRVWld2NTRWdTFQZTRyYmhP?=
 =?utf-8?B?amlROXVHTVRIM1VPODY4SzR3cDByOUpWN2R4TjR1WVhZL3ZRMDNZRXhRcEhi?=
 =?utf-8?B?NXNmV3YwbHBoRHZrZGxHNm51bGdoaVBjSEZDZVpwRUZXVU0zNHk4L28rLzZS?=
 =?utf-8?B?ME5SbzRqN3lPWC9qekpOSWJmZ3pLQitRVzZhbkxBMkxyVjJYa2JIVG5ISDE1?=
 =?utf-8?B?RDNMTitiRHh0M3JqQ0MrdS9ac0NUWTZWYldQM3crQnM1eXlCSmRlNkR4VGV6?=
 =?utf-8?B?K3MxNklLbXg4REpzMyt4azdtTCtTNzVSbGhTWTVsRnFKbXpiY2pUOW9qdEJX?=
 =?utf-8?B?NEdwY04vZXZTSVlwOFVpUlc2K2pRSVdiK1ViczdtNEc3cTY0TmdMbWpaLzZi?=
 =?utf-8?B?VUFOY3NmeEYzMitsNGVlSkRXWUZEQndNNnJlbWdwTVdhK0JheXZ0czhhdFhq?=
 =?utf-8?B?eXA4RFVIcFFyVERtbG9peUZWL21wSFZ3czNoRmNYZkQvclgyeXdJY3h3eWZR?=
 =?utf-8?B?VWNtdFYwV2pYM3NhWDdQT1Z3Z0d5eVFPR1YrVHhLVUxKWEFMTzJPYUhudmM5?=
 =?utf-8?B?a2lNalozeGRDYU5PcEpMT1RQbHQ2b1lpTGU3d25rUTVTaUNoK1FGZmtYU0lO?=
 =?utf-8?B?cC9JWkdFZDJ0d01Ocndtcm9iL1ZIVUZRMVRhZVpVTE0wYjNJNkt0NDJrUlh3?=
 =?utf-8?B?QStQQmpGZ0ZIWGpNZnNYQ3Fvek1CUWdUdFNSUm0ydGFVMTJhSktneXUwUXk0?=
 =?utf-8?B?c0dRaE1ER3NyWGplQjBOQTJCWnlwRyszellhazZISjdjZjBjN2d1cXdHbERo?=
 =?utf-8?B?NSt0SUswaWJ2eVcxUFc0bzJ4R1YvNHBMSzdlREVVNWR1TTNESXRCeGovQnBH?=
 =?utf-8?B?dy9DdVJwdVdpZkpDWUt5bW5XNTU3Ums3L3dvVkh1VTVnV0hLNFZEeFBpQ0ti?=
 =?utf-8?B?LzluQWZYUWZJbWFTMUpEczd3MDBMQWc2alFRWmNObGdoUHBBVFArbmxYaXdE?=
 =?utf-8?B?WVI1SjM4ZFFWNVBTZFdEeTk2VHVyKzhyMmlTSlE3VS9LTTBENjRHRGNUanFC?=
 =?utf-8?B?OVpWaFNNYVIyMVd1VDVrMWpCNHdIZXRWQ3NWaG5MbEhkWXpUNnROZGRQbWV1?=
 =?utf-8?B?VFRGMHlFQlhOSkZPa2RHVkx4aFJYVkJscWRwQjI1Si9idzhmOEkrM3J2ODl6?=
 =?utf-8?B?TUNGMmhOalFsallsK21hcVpudHdRQWRQTjBLdjJKMk9PUkFCRE9LRDRtTVpt?=
 =?utf-8?B?T1pZajhLM3hjSzRGeFJCM1JZR2ZPU2t1RURaOVF6M3JVa3FOU0RaVDFiZ28z?=
 =?utf-8?B?bkE0S25aelN6R1YzRGlPYlRnZHRRbGp1RWxsai9hcjFIS1lWbHB4UzF3Q1Qr?=
 =?utf-8?B?RjdNYTVDRVhkak9sZWtGbmlnZm5BOVMweXZrMHRsZmwrV0lCbGJqS21tNVBT?=
 =?utf-8?B?YVZneVJndnVPMW5jRXZ1QUJMVi9VOVoycEJnRW9CSnY0dmFwb0UyVERqTVdm?=
 =?utf-8?B?T0VMT0ZqZHZzUnd3bWVWZjdSV1dXNTQ3emZtNXdPSVExeE04bWJkY01jOU9S?=
 =?utf-8?B?YXF2bkYxMHdwOUtVZVJ2dFNMdUg3TGpxMW53WjJPWFNPZUloZWJrcm5NSDl6?=
 =?utf-8?B?aGp4RUtscjJHcFo4YzR3dktHQm53KzBVUzR4Nk9selg0cWNiTGY2WDY1cklo?=
 =?utf-8?B?dU1UZ29yeFJiclpsWGFKdzdzb1dhTk1DdmlCUWQ5RXBWUHNndGNjK2Uyd2h5?=
 =?utf-8?B?U3YrQm0zVXJTS3BvNktaNU5raXVJL3RXZ1lkVDNVTW54ZStVNHcyYWs1cVZm?=
 =?utf-8?B?M2ZER3VsU3MxNkVUZ3lkWWEzejB0U3ZSV2lzUE5CK0d1VTR3aGRoNG5wbG5j?=
 =?utf-8?B?VTRSa3p2cHJSdllHTWZ6KytVOXM5VHBnL0k3d1Rjc1FTNzdJNEM2YUMyWWxm?=
 =?utf-8?Q?DUQtl7EosiQxmx9YoejpHsHni?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	G9KWCHiNcnyZ/hEAbOibCXLh1lBLBpXiABJ6AU3U4idHEuVrWW6WkW7c/w5z1gbh74bMB6RLGK9IqPdUKwLcrWJq05FvaMkZUKX+1GIo6pVYVPeIA45tgGtQXIZs+LnlqbsNVkN2U0rDU+4IMo9wLIEUjBUeK7bFq2CROU597Lq8VfrVkLIQqdq4xb0rzG5b5Zrpnj4cPv/DAn5bmOFk61nJ/jSeNVGoPBdxjE0HA4lF/IAojb3DKTiPxjhKJjc/6qMkkWB6NUaE9CUorsPxaFdsk+X9EDBaKTV6Vyo/a6P88/yFCwXS3xcM7/hykiFP6olNHH+2a+P7U33iid5mW3DZG8VHAQwgOgQ+x8QV17vcpSIioHBWkGoalA3nECP0aL9rMmiu3nYxvdQFE/bVG+yCXZyPEIwGx/r2cx3bxxWpXkz6t7YsCrETjmp7G7jL6aLaYJijSMI2G6ct662XWC919Tz1iOzOj3RyflRVwRp6SIo5/FWA4pJv1Grk9ry2Lt6JZKmQocHLHq77jPuyOWMzpiZpBo/hTQT9Npx+P0it2MLYl7Lhri/yP4yERf/tHFKankW6CwDy4MnppzMytg20tp549wCoBbQ7bsN/8/Ty3IDxfw9/Dk7uil2a83aD
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f7369c-5fd3-4ce6-5b59-08dd3a7a1054
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 00:16:49.0291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QsbBEWWc8b0jwjrV7/r/hTMWiX6uTa3g4eHg09ct2kGITAnXGw7b5GzNx58zBKdWiPxTXyVjlkvIEN1Fk09wiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 00:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210110

VGhpcyBpc3N1ZSBoYXMgYmVlbiByYWlzZWQgdG8gdGhlIHVwc3RyZWFtLCB3aG8gc3RhdGVkIHRo
YXQgaW4gYWRkaXRpb24gdG8gbGludXgtZ251ZWFiaSwgdGhlcmUgYXJlIG1hbnkgb3RoZXIgdHlw
ZXMgdGhhdCBuZWVkIHRvIGJlIG1hdGNoZWQsIHNvIHRoZXkgaGF2ZSBpbmNsdWRlZCB0aGUgbW9k
aWZpY2F0aW9ucyBpbiB0aGUgdG8tZG8gbGlzdC4NCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWlu
Z3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1Qp
DQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUt
ODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1B
SUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiBTZW50
OiBUdWVzZGF5LCBKYW51YXJ5IDIxLCAyMDI1IDExOjQwIFBNDQo+IFRvOiByb3NzLmJ1cnRvbkBh
cm0uY29tDQo+IENjOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29t
PjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTGVpLCBNYW9o
dWkv6Zu3IOiMguaFpw0KPiA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBbT0UtY29yZV0gW1BBVENIIHYzXSBuY3Vyc2VzOiBGaXggaW5zdGFsbCBjb25mbGlj
dCB3aGVuDQo+IGVuYWJsZSBtdWx0aWxpYi4NCj4gDQo+IE9uIFR1ZSwgMjEgSmFuIDIwMjUgYXQg
MTY6MzEsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxyb3NzLmJ1
cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ID4gVGhlIGhv
c3Rfb3Mgd2hlbiBlbmFibGUgbXVsdGlsaWIgaXMgYXMgZm9sbG9pbmc6DQo+ID4gPiBob3N0X29z
IG9mIGFhcmNoNjQgOiBsaW51eC1nbnUNCj4gPiA+IGhvc3Rfb3Mgb2YgYWFyY2gzMiA6IGxpbnV4
LWdudWVhYmkNCj4gPg0KPiA+IFNlZW1zIGxpa2UgdGhlIHByb3BlciBmaXggd291bGQgYmUgdG8g
Y2hhbmdlIHRoZSBnbG9iIHRvICpsaW51eC1nbnUqIChhbmQgc2VudA0KPiB0aGF0IHVwc3RyZWFt
IGZpcnN0LCBvYnZpb3VzbHkpPw0KPiANCj4gVGhpcyBpcyBhbiBvdXRjb21lIG9mIG15IHJldmll
dzsgaW4gdGhlIGVuZCBvZiBpdCBJIGhhZCBhc2tlZCB0byBzZW5kIHRoYXQgcHJvcGVyDQo+IGZp
eCB1cHN0cmVhbSwgYnV0IHByb3ZpZGUgdGhlIG9lLWNvcmUgZml4IGFzIGEgdHdlYWsgdG8gY29u
ZmlndXJlIGZsYWdzLiBCYXNpY2FsbHkNCj4gYmVjYXVzZSB3ZSBkb24ndCBrbm93IGlmIHVwc3Ry
ZWFtIHdpbGwgdGFrZSB0aGUgcHJvcGVyIGZpeC4NCj4gDQo+IFdoYXQgd291bGQgaGVscCBpcyB0
byBpbmNsdWRlIHRoZSBsaW5rIHRvIHRoYXQgdXBzdHJlYW0gc3VibWlzc2lvbiBpbnRvIHRoaXMN
Cj4gY29tbWl0IG1lc3NhZ2UuDQo+IA0KPiBBbGV4DQo=

