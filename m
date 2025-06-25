Return-Path: <maxj.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B36C77B7F
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 02:12:06 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web10.6041.1750817520227968556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 19:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=yjhwEoFM;
 spf=pass (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: maxj.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1750817520; x=1782353520;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zQOqOJbLXqYLS97roap5Q6iDzDewyAktpRTV+YGhzIM=;
  b=yjhwEoFMMHFiea1Lm3agNvwHvHwS/e6ymO8byfYKC2JVpmtGT9IoUfaU
   +d+CROFpg6CJwcJkw6edQqlXbMlwF6q41a4gpeUm613UMPwkDSb27C9EO
   3OZ8UNLr5H4co9xq9dMLXT7IXtJAkeL0eGW5Fsfw4ncrR9q+tzvLSVFVz
   8DYcA1n/6pUVlM43TY1YikR7wKtGRiG5bdZl4tv9Gqnoi2x5PyS9rzMK6
   d8hTHzd5QZtVFzO5CQjyC6+wlLBYX/ntM/c10iz3pWZzBBvpEPUcFc+0c
   0a2QLnUxchgfUx+hiL7aL3GyBuCNOliQfFnBVjd1no2o4Ary0gJA+kCmI
   A==;
X-CSE-ConnectionGUID: CYuSXVbVRtGxZhw7P9pcAA==
X-CSE-MsgGUID: We0Xoe5QR8OZAtZmWy7T1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="159713833"
X-IronPort-AV: E=Sophos;i="6.16,263,1744038000"; 
   d="scan'208";a="159713833"
Received: from mail-japaneastazon11010052.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([52.101.229.52])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 11:11:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBrsjrLJRs31toiX6X6LY41gxre17jnO4L9wxGqf1ny3DDpSd//GvcUkPiUUzKkY2W3dZjborKQkLLe8aKs8V1RiF8T7AQPsdkYHGbtcVpJuxFMdWWmDAKRC1+1izY4NY3Iuy1tFrYUtFykIozBzHRkMfLE+bbizEmV5X5BJ1hj0UDDlQCK/uPNrNe2s/lBsfnEcOBsLpmMhR8UWRx7fM5lTI0CT9pbuUoNtnHyEnWkMO6StMCZG7BsrSsygmfGavVYTK9AppMRBU7gFElBXH6zBAuPUWbTTQRjEGmhTjlqDT/u3RdcrmK3c9leORgA4LJ1UNyh3CAJGrEnE0Aingw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQOqOJbLXqYLS97roap5Q6iDzDewyAktpRTV+YGhzIM=;
 b=CvgwxzPWqK2YicfkLj/PgiQp8+60SQ+gB0PKIxjuGRHjyr2K9fShLipJv9lv2wuhAiUOC0qnwS4lyAcdmd9+wtI6Q250AiJ0VIcmvUl3ddgjiwzQXBnUStYUke05stjLXDyTl6X9+oXZR8hCq4ppNueBElFiHEzzCisGNclL27d7OZWNXSq/rn//ECedPtW5Nv5OKjZMJ766hLWwyWECekVexuUTwX2+xdaHQ2qP7wWvyv0rZGyCONNJgO7Z//emdxr/AJZ7oovsa7145/GSMl9/7WyjrwI7XZu16qv21eh5vTpXsQy6PTEyMelxPoN/slNUoKzkZKG261GuYumgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 (2603:1096:400:3cc::12) by TYCPR01MB6772.jpnprd01.prod.outlook.com
 (2603:1096:400:b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:11:52 +0000
Received: from TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9]) by TY3PR01MB12071.jpnprd01.prod.outlook.com
 ([fe80::479:9f00:f244:9b9%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:11:51 +0000
From: "Xinjian Ma (Fujitsu)" <maxj.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>, "Yiding Liu
 (Fujitsu)" <liuyd.fnst@fujitsu.com>, Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>, "Dora, Sunil Kumar"
	<SunilKumar.Dora@windriver.com>
Subject: 
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtPRS1jb3JlXSBbUEFUQ0hdIGNsYW5nOiBtdWx0?=
 =?utf-8?B?aWxpYi1oZWFkZXIgZml4IGZvciBsbHZtL0NvbmZpZy9sbHZtLWNvbmZpZy5o?=
 =?utf-8?Q?_and_clang/Config/config.h?=
Thread-Topic: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIXSBjbGFuZzogbXVsdGlsaWItaGVh?=
 =?utf-8?B?ZGVyIGZpeCBmb3IgbGx2bS9Db25maWcvbGx2bS1jb25maWcuaCBhbmQgY2xh?=
 =?utf-8?Q?ng/Config/config.h?=
Thread-Index: AQHbyf6KL8NVyEd6sUKPcGrRvjMhtLQP44MAgAA88TCAAVApgIAB6EGQ
Date: Wed, 25 Jun 2025 02:11:51 +0000
Message-ID: 
 <TY3PR01MB120716ECB72A3A1CDB6849E7FE87BA@TY3PR01MB12071.jpnprd01.prod.outlook.com>
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
	 <488c0487-f767-4c4e-b74e-cdd1ba93ffe7@windriver.com>
	 <TY3PR01MB120716B2F88E4BEC62380F198E879A@TY3PR01MB12071.jpnprd01.prod.outlook.com>
 <4e7cb5788380fda8d01c8c159fc424174a7ee7c8.camel@linuxfoundation.org>
In-Reply-To: 
 <4e7cb5788380fda8d01c8c159fc424174a7ee7c8.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YzIyMzhiM2UtMzJkNy00NmM1LTk0NGUtZWM2NTk1ZTU5?=
 =?utf-8?B?ZTk4O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA2LTI1VDAyOjExOjE5WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12071:EE_|TYCPR01MB6772:EE_
x-ms-office365-filtering-correlation-id: 0f746b9f-1336-439a-6262-08ddb38da63e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MVNUR1QyV1B5cHhncUh2a0N5NkQyOVQ5MW9acmFyR244aXhzckd0SjZIMkFn?=
 =?utf-8?B?SkxISnVobGxoVVpWR2tORENaS1dIbjFRazFsT0phazUvaGZXNWJ6VUFCY3li?=
 =?utf-8?B?WHBQcWN5c3E5TDBDTWoxUTVESWthMW40QWt3amxNcGhPek9jWmJrcjE5bzE5?=
 =?utf-8?B?dGRYUG5PVUt6T096eHdUcmdiYzRBYiswM0IxdjBPNVpCZ3hoa3VOOXQzR3BH?=
 =?utf-8?B?aTF1MjZjblBTOG1wNk5zVWlUcmdJNVgzYU5wdkV2S2s0VmtMNnNpTlNaMjZC?=
 =?utf-8?B?a0xBNHpwekZIcmI4QlJ4Rk9WVTgzQjRVVGpyT2FhNlgyY1RVQTV0ZWVZaThk?=
 =?utf-8?B?K3orSXJxM3BHK0pFRytsWldhbE5TUmk4SWlYUndMZDZ2WlB5K2tpUlZDcjlu?=
 =?utf-8?B?bktpRStRbE1nVEJzbjhTQU5nZTNSTDRhS1VZQ0piMHJYWHB4VzBTcTBhdmxj?=
 =?utf-8?B?Y0d0MmM2KzJRN1hXQ1VKZVZvTUlZbmNiUFdQQ25MQSt6S2tMd3dnakFUVUFB?=
 =?utf-8?B?d3pBZDJsY25MeFhxZ21BVEVscENxVU1VR0lPS0lwYU1aWDlZelhjVGJGZXFy?=
 =?utf-8?B?U0dQQ3NQbm1tMGwwQlZTWGF5d0lqZjJwL3pzY0QycTg3djhGa3I0SjVZa0tY?=
 =?utf-8?B?dG1UZ1VHOVRDY2tWSkp1Rzh4RTdBV1dXUFZzMWt4a3QvcW5Qc1dLK0UwUHph?=
 =?utf-8?B?SiszREtORGxGa1hJKzA1a2ZYMVB4ZW1wVlJVYVUvMHhTb2FyR3N2UkttU3Nz?=
 =?utf-8?B?aGk1cy9WUHNXdG9XRVJ4dkQxYlR4Z2R6VFJ0YnJPZkFIVUpiUWpRSERoZVhi?=
 =?utf-8?B?VXNDMnhVVmZnMjg0K1NJRHZYZGhZTWFveUR2aERXV2IzbE94RTlXR3NOc2l4?=
 =?utf-8?B?VDhRSHZDbHpiZDZtblo1TTlCYTFKSWRDRER5MnNrNSt3OVJ2dWRNOGdTd3ZM?=
 =?utf-8?B?ZEpMeUZUSG5WcGdEeDA2aFVuVEJMbjFLaGF1WXBNYktrNm9QRXp6L3hvUE1q?=
 =?utf-8?B?L3RHMXE0dXNPakdvbytyM3RMUmNXeUloN1dqaTcxNlZFbVJGSVNoc3JpRXhF?=
 =?utf-8?B?ZzJmRUhtUWlkSmRHSnovcG5ESlg5MG9LZGNOcndjeHlEVFVVMWxQb0R3VjhN?=
 =?utf-8?B?RzNFaDFBV0ZpZDZheFo0cXI4RGNYblR5VFBSMXRQbk1WRk5lTDdCTHZpb3NE?=
 =?utf-8?B?MnhwWVZ4MHBadVZZRUEwZXZHbFNwR3ZFRXAxbGV5MXB1VXM3cDNxczhOQmUw?=
 =?utf-8?B?MEtrcjFYK216YXFWemxoNkRKR0sxYm1qSld2eXo1U2NRQnlJa1RKcHRxT3Mv?=
 =?utf-8?B?N3h1NnMyOHF3TlhmR3MveVJzbEJaT3VKNm5obTB5eit0dlQ4bC95ZWVmWTc5?=
 =?utf-8?B?ZHFxVEt3NDBwWUlLNGdVTElZOGphdjE3dTYwSjZwMHk3aGczWi94L1lTbzJD?=
 =?utf-8?B?NVVLd0lFQlFQZk84OGFnc2RLOGwvTVJSMEFaMlB5bTFQUFpsV2gxdE5XczNT?=
 =?utf-8?B?MWNpM21kT00wbkxVTi8veWd0WEN2a3c5Mlk1RWx3VDd1TldXcVJ3ampQNCtC?=
 =?utf-8?B?NWt3OHNRM2VDTEwvdEp6cFB3UDB4cVZXQTZianN3R2FKWGJtdzhseHcxOVp0?=
 =?utf-8?B?MFphUVJtTkEyNHFCU3c3Mk9OY1dDcDBlN0tZWXZKS1RpTTFIR3NVS2VLN0la?=
 =?utf-8?B?VGZVVkxRTEFsVWd3eFdUNmJzSHZUZzJNQXo1bmhVY1E1ZktGSnJMOGVlNmE1?=
 =?utf-8?B?dHhVaVJhcFpOZXFUTzk5TFM1MlpsZHpaeFJGdTNUNmh5eHU1TnBXZDR6Z3ZU?=
 =?utf-8?B?cnd2YmZxTUlMcFVoT0ZnV3NFMEZvdy92ZHByTXZmZlNuTkd0VUdNUXplNnlr?=
 =?utf-8?B?aVJ4SDRHYUl2TnhHSkpoeElCNkxqZmFibjIxVktqelhJV29BRkpXdndkL2RN?=
 =?utf-8?B?TzVuY3dnQWFmSC91bldCMGZON1prSWw2dDU4eDFUZWFVUGZsWDBod1N5dm5Q?=
 =?utf-8?B?azdKaGJaNDVZWUh6akh2ejI1elBNbmtIS3hGQWIrL0pzbFNxK0w4YmhqMEVp?=
 =?utf-8?Q?ISQtFu?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12071.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3ZnNWNFbXVmcEVFY0RrL3poSDZwckxOMllDcjNHRUNUbXBhdW4xQWxJTEd2?=
 =?utf-8?B?VXA2ZWg4YWUrd0NUcTd6R0hVZDMyMjcwTzY1a0RPMk5rVmpkbkxPMk1LZEQz?=
 =?utf-8?B?YmpldU9rSXZoS2JBdUtybVJnMC9idWl0a0hHWWFGSWRsUHNEaktSL2VEcE9D?=
 =?utf-8?B?M296QWRPSXJRM09VMXlDSk96U1BYMHZQWXhpZkkyckl0blhTNitsQ25MeXJy?=
 =?utf-8?B?YXAwYUxsMHRVNTdxTE5iTmpUU3R2Szk3ZHloZ1dtZ20yZzdQVGJaN2ZybFdw?=
 =?utf-8?B?SWJzMEZkVWZQUHRhbVg2VGFBeElhNGZ2aVNSTHJxeUk5Vk1xeWI5WlkwOUpz?=
 =?utf-8?B?V0Z6aEs0Q3owSEl2dnlTVVdVZ09jZG0xUCtWMktndXVHb3k4dE9vdHBaMC9U?=
 =?utf-8?B?UVFwajQ0dWJsSkt6WWJhQzZvSS9oOXRVYmhtbDRlZnY5Z2tUNXM0eEtSNmsz?=
 =?utf-8?B?UXozUlg3aDBpRWZYc1IvVDZjOWo0ZmdKTkhvL1dwYUp2TWs3ZU5HaUpCbzFH?=
 =?utf-8?B?bzlld0dTQVpxUzBJSjQzdkJhbERmOUxLa1hNRzIrbDZMY2I2MjJ1clBoNXlW?=
 =?utf-8?B?cmp4SUxoZW9JbVd3VWZrTFFpWkUzR3hRT3FjYzljbXhxaGFCYUZWc0VINTk3?=
 =?utf-8?B?L0hUQjN5Y3NDb21VdytlRVZ1SFh2NlhQVkpidS81Um94NmtYaHBaaGw1cnVn?=
 =?utf-8?B?N2NXTVJ0SmduU29nQkxWQnRPZUpNYmJ1N0xwbzlUU05tQXg2L0tiR0dCTnBR?=
 =?utf-8?B?WmMrU3ZXWUIyMENOaGtMZ2djdFBKbkNwTjJhSEJvdjRBTUgyOHgxVVByRTBp?=
 =?utf-8?B?UTNsUC83TlNwWDNxR3YxNjhhM3RWcGM2RFRCbWpHTGg2OU12aEVCMkNiMHBQ?=
 =?utf-8?B?aGF0NWtnOFNraURpNHZJRThWTFpPd09CVWxsUXgwbDNoS2VCR3JWVFNRTUNT?=
 =?utf-8?B?OFhHbVVMMzRuVkdhblBhLzZFdzNxZXJyQWZ4NjJWcVJTSktIaUxmeFZqVzBZ?=
 =?utf-8?B?N2xkWDVreE00VENGbUpRY1ZCbzJ4OWxaeHBIdlZ2VDBnUDk5LzQ2RFd3eHY4?=
 =?utf-8?B?WWltcFZhL1ljaTArbXdlVk4vYXpUdlRmSEJtalRIZEsyQWtpc3FyVDhjSWYz?=
 =?utf-8?B?SWtIalhpYjBlK2FGdjZSK0F4ZXY1K0l0aE9PQTJXZ05CdTRla2pQc2llWEdI?=
 =?utf-8?B?MUY1bjZFUXhVWGpQTWFha29FMUhWdVZvbWpwTWVRYUJmbGV4NnFyOC8rNUFS?=
 =?utf-8?B?S0E0cnVjVm9ldHk2ZzhKZ3UzV204bFhpWmd5Q3lsemV2NjFPdHRLOW9OM0pE?=
 =?utf-8?B?NVVjZ28xNFZsUnNIRnp1WkdrYTlDZDBxQnBEQlZ1ZDJiK2c3ckFwcmxPV2tM?=
 =?utf-8?B?L1R6VnRZRVQ5U0E3dFdlUUErRzIrYy95NC9UZ2ltVmR0bzR0VVFkRVlRaGdh?=
 =?utf-8?B?ZE1OekdlQ1V6aFpzNExmTGNTR2xEQnRPRVNYK0s5ang1ZzFyaW1aOGlLcDhm?=
 =?utf-8?B?eTdYeTdqWHl4dnhRS2dPV1dsN0JCU2JrV1gxZzlVV0x5cVUrRUYvRjJ0WW5M?=
 =?utf-8?B?SjVxeHZFbC9JRTU3ZFRJM1dnR1k4ZGpsVEFPR1ZxdHpaTGFBNlo5ZkV6YUlv?=
 =?utf-8?B?Q293Y0NRZXpYSUZDMmoxSFhOTVQvZWhWeXJqbVNTUm1qTE5Hb1F1NzlnbjNF?=
 =?utf-8?B?NFRhd3UwTlhoZHQ4NWN6cjNvaDJJZlo1TzM0cnlwUWVGZ0lDTkdLcmlXcnBB?=
 =?utf-8?B?SC8vT0ZkaXBUSWdyUTZ6QjRqTGZ6enZ3RW5KOTBBMHZwOGF4ckxTbzZ0MUdK?=
 =?utf-8?B?dXArY29RQU1JYTVYdS9TTVVMMEJhK1R5RDVpREZQQ2JSTjZOTGJlbkZjVE85?=
 =?utf-8?B?L2xJN0cxVklDTDdMRUFOSzNOaXhvbmtHM1U1N0FMcXN3dE5IQ3lmNnBhd2o4?=
 =?utf-8?B?QWY0UVRGUGFGck1HTWhTQmVoRzBmRjdmVXphRXkzbnZ4NHJ0bVZHY0E1aCsz?=
 =?utf-8?B?ckxtTXRoSytPdjFuWk1LTmZZdHNsYmUzTU5oTXF5cnpPcnVVVnVmd1NWbTRz?=
 =?utf-8?B?MnF1ZGxjaU1kZURHR2x0QUloaG9wQWgyS0wvSHFwaENaQ1FZRFJQOVhuK2hn?=
 =?utf-8?Q?kH221qhn7y+3EjhIKoQ1ivilk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6iiQLP4w3hFuAxuhh+DPhoYBIbtcYIcnLSEkZQ9QNma63Wxyz/epT+o6i4c+LRldOOt45gCQ4bOcMNgEsfX94GtOxzP4neVFRMmYTuccVf6/PIn39JDNy07xr0zwBPH5r+UJXo30sUvGrgiQdhZ+AD+cGljfoMoOn75fv3KLg9ChXYimgK/QOwxcOAUQqg0dO/zWp5vIlnJatthGdtL0BIBakmxT/GrbqtV8/4JCIeDAnQitb4qeEN57DH2YgHiwjRibGz3orslvZT8lCQguchC4sMrpEu+STrwZbiBfqL0+IHs1U2j3kzpC2Ao/vfAi3QYwf7JoSbtbkXiRug78cMQU+6JTT7iEa017bSIxeUG0yQLb98xp1rT6onNdiBmBN3nbFFCQTNbQtb3Q13OFljbE0NjVUUaDzDc3xVle5l3AcVoQ5LmN9uaMftqiletvkD9z/MO4CT5yT/L92dm7fvtAJrgcg10BHlW5x8wdjYNOZmxqan5oMbFck6v8TaCuoFYBxAgCKRe7O4sVuQFiDh2ItUO+ooqcgI0A8ZSjACQkxLiaYUpLZle0tKvaTUiJ3Bs6H4eV3XCNu3pG9IovhMm9O1zNezXzUc7gkfmA6aoEdyw7dT50ixYuChh9jccX
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12071.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f746b9f-1336-439a-6262-08ddb38da63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 02:11:51.7081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhvJiAxjTzjYwsBnq7oHdw5a64Bht8TyrqPHjKbFKolcBOoafblClTh+/IzUZ9nPVAWjeqLxp4keWMhdBY9TaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 02:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219297

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiDlj5HpgIHml7bpl7Q6IDIw
MjXlubQ25pyIMjTml6UgNTowNA0KPiDmlLbku7bkuro6IE1hLCBYaW5qaWFuL+mprCDmlrDlu7og
PG1heGouZm5zdEBmdWppdHN1LmNvbT47DQo+IHJhbmR5Lm1hY2xlb2RAd2luZHJpdmVyLmNvbTsg
TGl1LCBZaWRpbmcv5YiYIOS5meS4gSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT47DQo+IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IOaKhOmAgTogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgS29ra29uZGEsIFN1bmRlZXANCj4gPFN1bmRlZXAuS29ra29u
ZGFAd2luZHJpdmVyLmNvbT47IERvcmEsIFN1bmlsIEt1bWFyDQo+IDxTdW5pbEt1bWFyLkRvcmFA
d2luZHJpdmVyLmNvbT4NCj4g5Li76aKYOiBSZTog5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIXSBj
bGFuZzogbXVsdGlsaWItaGVhZGVyIGZpeCBmb3INCj4gbGx2bS9Db25maWcvbGx2bS1jb25maWcu
aCBhbmQgY2xhbmcvQ29uZmlnL2NvbmZpZy5oDQo+IA0KPiBPbiBNb24sIDIwMjUtMDYtMjMgYXQg
MDM6MDMgKzAwMDAsIFhpbmppYW4gTWEgKEZ1aml0c3UpIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHdyb3RlOg0KPiA+IMKgKg0KPiA+IMKgwqDCoGlmIEkgaW5zdGFsbCBib3RoIGNsYW5n
IGFuZCBsaWIzMi1jbGFuZ8KgIHdoYXQgb3B0aW9ucyB0byBzZWxlY3QgdG8NCj4gPiBnZXQgdGhl
IGRlc2lyZWQgbXVsdGlsaWIuDQo+ID4gwqAqIOKAi+KAi1J1bnRpbWXigIvigIs6IFVzZXJzIG11
c3QgZXhwbGljaXRseSBzcGVjaWZ5IGFyY2hpdGVjdHVyZS4NCj4gPiBGb3IgZXhhbXBsZSwgJGNs
YW5nIC1tMzIgaGVsbG8uY8KgIyBTaG91bGQgZmluZCAzMi1iaXQgaGVhZGVycw0KPiA+IGF1dG9t
YXRpY2FsbHkgJGNsYW5nIC1tNjQgaGVsbG8uY8KgIyBTaG91bGQgZmluZCA2NC1iaXQgaGVhZGVy
cw0KPiA+IGF1dG9tYXRpY2FsbHkNCj4gDQo+IERpZCB5b3UgdGVzdCB0aGlzIHdvcmtzIGNvcnJl
Y3RseSBvbiB0YXJnZXQ/DQpZZXMsIEkgaGF2ZSB0ZXN0ZWQgYXMgZm9sbG93czoNCg0KQWZ0ZXIg
ZG9pbmcgcmVwcm9kdWNlIHN0ZXBzIGluIHRoZSBjb21tZW50DQoNCiQgcnVucWVtdSBub2dyYXBo
aWMNCiQgY2F0IG11bHRpbGliX3Rlc3QuYw0KI2luY2x1ZGUgPHN0ZGlvLmg+DQojaW5jbHVkZSA8
c3RkaW50Lmg+DQojaW5jbHVkZSA8bGx2bS9Db25maWcvbGx2bS1jb25maWcuaD4NCg0KaW50IG1h
aW4oKSB7DQogICAgcHJpbnRmKCI9PT0gTXVsdGlsaWIgSGVhZGVyIFRlc3QgPT09XG4iKTsNCg0K
ICAgIHByaW50ZigiUG9pbnRlciBzaXplOiAlenUgYml0c1xuIiwgc2l6ZW9mKHZvaWQqKSo4KTsN
Cg0KICAgIHByaW50ZigiTExWTV9WRVJTSU9OX01BSk9SOiAlZFxuIiwgTExWTV9WRVJTSU9OX01B
Sk9SKTsNCiAgICBwcmludGYoIkxMVk1fVkVSU0lPTl9NSU5PUjogJWRcbiIsIExMVk1fVkVSU0lP
Tl9NSU5PUik7DQoNCiAgICAjaWZkZWYgX19pMzg2X18NCiAgICBwcmludGYoIkhlYWRlciBwYXRo
OiAzMi1iaXQgKF9faTM4Nl9fIGRlZmluZWQpXG4iKTsNCiAgICAjZWxzZQ0KICAgIHByaW50Zigi
SGVhZGVyIHBhdGg6IDY0LWJpdFxuIik7DQogICAgI2VuZGlmDQoNCiAgICBwcmludGYoIj09PT09
PT09PT09PT09PT09PT09PT09PT09PVxuIik7DQogICAgcmV0dXJuIDA7DQp9DQoNCiQgY2xhbmcg
LW0zMiBtdWx0aWxpYl90ZXN0LmMgLW8gdGVzdDMyDQokIGNsYW5nIC1tNjQgbXVsdGlsaWJfdGVz
dC5jIC1vIHRlc3Q2NA0KDQoNClRoZW4gaGVyZSBhcmUgdGhlIG91dHB1dHM6DQpyb290QHFlbXV4
ODYtNjQ6fi9tdWx0aWxpYiMgLi90ZXN0MzINCj09PSBNdWx0aWxpYiBIZWFkZXIgVGVzdCA9PT0N
ClBvaW50ZXIgc2l6ZTogMzIgYml0cw0KTExWTV9WRVJTSU9OX01BSk9SOiAyMA0KTExWTV9WRVJT
SU9OX01JTk9SOiAxDQpIZWFkZXIgcGF0aDogMzItYml0IChfX2kzODZfXyBkZWZpbmVkKQ0KPT09
PT09PT09PT09PT09PT09PT09PT09PT09DQpyb290QHFlbXV4ODYtNjQ6fi9tdWx0aWxpYiMgLi90
ZXN0NjQNCj09PSBNdWx0aWxpYiBIZWFkZXIgVGVzdCA9PT0NClBvaW50ZXIgc2l6ZTogNjQgYml0
cw0KTExWTV9WRVJTSU9OX01BSk9SOiAyMA0KTExWTV9WRVJTSU9OX01JTk9SOiAxDQpIZWFkZXIg
cGF0aDogNjQtYml0DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0KDQpBbmQgSSBhbHNv
IGNoZWNrZWQgY29udGVudCBvZiBoZWFkZXIgZmlsZSAvdXNyL2luY2x1ZGUvY2xhbmcvQ29uZmln
L2NvbmZpZy5oDQoNCg0Kcm9vdEBxZW11eDg2LTY0On4vbXVsdGlsaWIjIGNhdCAvdXNyL2luY2x1
ZGUvY2xhbmcvQ29uZmlnL2NvbmZpZy5oDQovKg0KICogQ29weXJpZ2h0IChDKSAyMDA1LTIwMTEg
YnkgV2luZCBSaXZlciBTeXN0ZW1zLCBJbmMuDQogKg0KICogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IE1JVA0KICoNCiAqLw0KDQojaW5jbHVkZSA8Yml0cy93b3Jkc2l6ZS5oPg0KDQojaWYgX19X
T1JEU0laRSA9PSAzMg0KDQojaWZkZWYgX01JUFNfU0lNDQoNCiNpZiBfTUlQU19TSU0gPT0gX0FC
SU8zMg0KI2luY2x1ZGUgPGNsYW5nL0NvbmZpZy9jb25maWctMzIuaD4NCiNlbGlmIF9NSVBTX1NJ
TSA9PSBfQUJJTjMyDQojaW5jbHVkZSA8Y2xhbmcvQ29uZmlnL2NvbmZpZy1uMzIuaD4NCiNlbHNl
DQojZXJyb3IgIlVua25vd24gX01JUFNfU0lNIg0KI2VuZGlmDQoNCiNlbHNlIC8qIF9NSVBTX1NJ
TSBpcyBub3QgZGVmaW5lZCAqLw0KI2luY2x1ZGUgPGNsYW5nL0NvbmZpZy9jb25maWctMzIuaD4N
CiNlbmRpZg0KDQojZWxpZiBfX1dPUkRTSVpFID09IDY0DQojaW5jbHVkZSA8Y2xhbmcvQ29uZmln
L2NvbmZpZy02NC5oPg0KI2Vsc2UNCiNlcnJvciAiVW5rbm93biBfX1dPUkRTSVpFIGRldGVjdGVk
Ig0KI2VuZGlmIC8qIG1hdGNoZXMgI2lmIF9fV09SRFNJWkUgPT0gMzIgKi8NCg0KDQpyb290QHFl
bXV4ODYtNjQ6fi9tdWx0aWxpYiMgbHMgLWwgLXQgL3Vzci9pbmNsdWRlL2NsYW5nL0NvbmZpZy9j
b25maWcqDQotcnctci0tci0tIDEgcm9vdCByb290IDIzNzkgQXByICA1ICAyMDExIC91c3IvaW5j
bHVkZS9jbGFuZy9Db25maWcvY29uZmlnLTMyLmgNCi1ydy1yLS1yLS0gMSByb290IHJvb3QgMjM4
MSBBcHIgIDUgIDIwMTEgL3Vzci9pbmNsdWRlL2NsYW5nL0NvbmZpZy9jb25maWctNjQuaA0KLXJ3
LXItLXItLSAxIHJvb3Qgcm9vdCAgNTY0IEFwciAgNSAgMjAxMSAvdXNyL2luY2x1ZGUvY2xhbmcv
Q29uZmlnL2NvbmZpZy5oDQoNCg0KDQo+IA0KPiBUaGUgY29tbWl0IG1lc3NhZ2Ugb25seSBtZW50
aW9ucyBidWlsZCB0aW1lIHRlc3RpbmcgYW5kIGRvZXNuJ3QgbWVudGlvbiBhbnkNCj4gcnVudGlt
ZSB0ZXN0aW5nLg0KPiANCj4gSSBhcHByZWNpYXRlIHRoZSBwYXRjaCBmaXhlcyBidWlsZCBpc3N1
ZXMgYnV0IHRoZXJlIGlzbid0IG11Y2ggcG9pbnQgaW4gZG9pbmcgdGhhdCBpZg0KPiB0aGluZ3Mg
YXJlIHN0aWxsIGJyb2tlbiBhdCBydW50aW1lLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFy
ZA0K

