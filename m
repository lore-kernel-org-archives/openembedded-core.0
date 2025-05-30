Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F09C5AE59
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:58:29 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.2500.1748573903309573509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 19:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=i1xa4V14;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1748573903; x=1780109903;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5rJxyduq7Lh8muDurWJxX8geCAhNxu1a6u0+Q9sBpHc=;
  b=i1xa4V14YqgpCphpVZZlv9OWt3Z3ztdr4YfbClZ5Nyba1WICoo5gp5ZG
   miy7t/21hxBqpkWTmsqniifUpm8f1FTPMIY1FxEA72xWRPDk8CJaFTaUv
   R5T/5C7kVAmz7pcXa99K6Lq0LmmJQZdI5HlPv4zPfdX4lSxDHwiXL+yzn
   5kaiGu2hLNG4hzYnxz1OLNWzpWp6qp1737H7KW4M6nAyKx3DqJxY+clcT
   jIuCwNS9yyT40tplENu53/nEnlgpSKJNFuw4K6Ovpqe2Sc3ddif5QDGof
   xx++i/Ev/Ixj7szXernBUYykVpadP6O8YjaWiWb7BHt/ZndIFb2UvzYSI
   g==;
X-CSE-ConnectionGUID: XzcwEdiIRNSkTMOKhq53ug==
X-CSE-MsgGUID: FN6KyUCdSruqr+AQEbw3WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="156566661"
X-IronPort-AV: E=Sophos;i="6.16,194,1744038000"; 
   d="scan'208";a="156566661"
Received: from mail-japanwestazon11010022.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([52.101.228.22])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:58:20 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdpbwLe4XWBgyVzT5BlkjEP6kRqC31A2a3cgzH43FHWIyK4B1FWfYcVESS3PTINcTSKdceagr8vYmUafxha+LO2vsJACOkUdJNqeBWhn8gXFHc/R8lflUXr3OFLKIKOtiDOKrQD/YXU5xU44e9NP1ATKVKu3cuA+pkgZZegvo8zLGbF7jVmCK2D9pGnaeWTBy64nfAx1dnHYpY0feLQ6ucfxfpvcXa5vG+/CfthNsKggcEUkZ8Ca66xrbgcEFyeXtL/g2f4XANKatbU/miv0EnLggkV3VMB4qCg/1F4Akfue6zgLDxzepgjutL+BFFO9lBha3nS6rj1EfTqwwTsbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rJxyduq7Lh8muDurWJxX8geCAhNxu1a6u0+Q9sBpHc=;
 b=VsX1w0thO1TjW8jDyNP4w9OOpGrOz8XSjjd0ghceWnvAwT8v+qHP9jcuCFBVAT0t2e6q2JPt7isGlEHh8AokdSGKXDNjVN8gvssNow0YtquT17k5Paqy6GG63wvr2sBbmvReUWVod4tQItqZRKc715zxPfG3U6eV1OGiKMu38qF7SmH7OyVyjUAk6ynj/7qo4XR6C53InchEl/QYXVI6ylrCitb7mIh4FGPT+vd2iAMsQx/mYqMQykSnXwvJIqA8HvNL6Wikn/HBYbw3l9vc3yoC+vKBMcKg4Wl1IQGteJQz5xpefOUbo/ExOZ1vFwmTzi702TeINB05/ZlbwCZn1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYCPR01MB11866.jpnprd01.prod.outlook.com
 (2603:1096:400:3e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 02:58:17 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 02:58:15 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
Thread-Topic: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
Thread-Index: AQHbyf523verdRZtlEScX7K3/CWRZbPecpsAgAD4KeCAAAn1AIALE4VQ
Date: Fri, 30 May 2025 02:58:15 +0000
Message-ID: 
 <OSRPR01MB1159756B512144F28ECCE295C9B61A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
 <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
 <OSRPR01MB11597AA06EC57367CB529CBD19B98A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
 <08f939dc-0880-4a2f-80af-6e8d512bf8b9@gmail.com>
In-Reply-To: <08f939dc-0880-4a2f-80af-6e8d512bf8b9@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YWQ2MWEzNmEtNTMyYy00NjAzLWI3MjYtYWEzOTgzNTEz?=
 =?utf-8?B?ZmNhO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTMwVDAyOjU0OjE3WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYCPR01MB11866:EE_
x-ms-office365-filtering-correlation-id: d61fca4b-531e-4972-71f7-08dd9f25d294
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?N0FFeStGcXlqb0NpU0pUelo4amo0cUVzakd1YkJYS0txK1FEMi8wYVlzeFJi?=
 =?utf-8?B?Z2JtRG1WdEJFMjNLc00rUXhuV1YrR1B1Rm5mMElVNFVUTXkrUHA3NWtuWjJI?=
 =?utf-8?B?Z2gzSEJpTkw0Z3gxRUEvWFJXTUZHR21JbDJGYmlDSGlwQ3JTUEVpWFpMdzRy?=
 =?utf-8?B?eUNUZjBISEVvdWNyUGlUcGQ1Q0d6WDJleW15MlkzSm5ibkk1QzNEanplYnpm?=
 =?utf-8?B?RnliSUlINEpOYUpCdHMzeU03NmYxQUlQTWlDNWttWFlqQnQwOTdqYi9SK0xB?=
 =?utf-8?B?cjBLalVzbjdpd0tEaTRPVk1EK2J3dHkyYXBjTUJQSlhlaDBBdmlYeFBRSW85?=
 =?utf-8?B?T3p5M2I4bUlqTXB6V0wwMTc4dS9VLytNYzlUc3Y3Q0N5NUt2S3Q0c25CVksw?=
 =?utf-8?B?ZVpURnUzcjhxSm9QNW1xNTVhUXNMU0FVSUIxQWRBaGhPaGQvTmlFMkl0cEJk?=
 =?utf-8?B?Tkt4bXdDZ2xhU2Y4YVFXbFllTG8yZU8rc1BEUkdndngxWWJnUS9RYWswY010?=
 =?utf-8?B?cm5rOFZ6ejJxc0dpR1hjNklWUUtjUEtNTlNHOW9sVTFMUmswWjdhQ01Lella?=
 =?utf-8?B?ZU51aEJXQmFTUkZmbEtSbzJ2cEFyazk0aUx5bFJrNFA2aDBGaysyWEtGc09Z?=
 =?utf-8?B?MzJWZEV2RUdpV2dHQXVVc2JTUkkrS1lDdUs2MVYvUkFmUEhMWElHdEN0djZi?=
 =?utf-8?B?VExLMG93bFRpMElTUEhZWkM5N1AvOS8ycGo3cU92N3lCT1RaUTAycFJPUzBq?=
 =?utf-8?B?ME1UQzZSTU9EdE92UXQ4SThWdTV6UVdCcDl4WTduaVplcGJXWjZ4RE4vdHI0?=
 =?utf-8?B?cm1hNDZDQ3kyR1hEdGc4cXVMUnR6MzhPZXNPMkF0WHg1c2FmSWtMb0Q4S0pm?=
 =?utf-8?B?SW9la1Byb2c2MDUrWXBlRjNaQVdyaUZJWE92U2VGRnNFRUVteWdnTTVTRU0y?=
 =?utf-8?B?aXU4SndjZ3hmVDR1L2tvMjR0WXhSNW1zY29FcjZWNlZaTDEvdHUxeWoyV09z?=
 =?utf-8?B?OXBMQ0o1QVBYTHFlTUN3RllzdjQzaWtLL3hBa3lLZkpWL0VjeDVXL3dVbzJR?=
 =?utf-8?B?akN6akFDMk1kbi9tRjdhbnRvTy96TkxTUm1tWk9Pb2E3ZWZxUEhZTVRQZ2M3?=
 =?utf-8?B?N3hWL1JUS3I2RUJTM09wUGU3MzZEK3JTUE5lZnVHallvVHdKb0lsYlZ2eW9w?=
 =?utf-8?B?U1JqZVhES3d4Tlp3K2p5czRKVVN2VVpDTDNQUXd5dDdVVU5ET1hVS0UzYUJ6?=
 =?utf-8?B?Q2JpQWFENkcxRXN6dUd6UmwwMmFlR1pFSWhuK1Foc2pBdjJYTWFtVldBRUcr?=
 =?utf-8?B?bjlyTngzZllLQVNpSnUwWitWRG1BU1owUkwwVHpJQVFSOWNZWStHSVcycXBU?=
 =?utf-8?B?S0dzQkVKb0ljdnVQeEFYWmh1YWtva2J2QVF1QnBBdnRKa3ZjUHJrUng0dFZD?=
 =?utf-8?B?S1JMbnoydzh0Z1JRR0FYYkNnWk1YV2pxR212dDZXK3FZOUlCdXNaZ0hsVmxV?=
 =?utf-8?B?NTZlVE9FZnFUeFUwNG9RYmpjRU9qeGNGMi9hajNaaERRbDJUd3NqRE9GcHFH?=
 =?utf-8?B?VktJZUlCSlVQbVVVclNDWGM1Z2F2UlpHSE5ZUnhnWERkd2NNL3IrblNFMGIx?=
 =?utf-8?B?bjYzcjVTbW16ZkNGOERIRFFSaDc4WithM2hYZGFzb0Nwa0dWbkhOODFadVAz?=
 =?utf-8?B?ejU3U3NQMks2NURxK2RvUlRnNHR3QmVVazVldWdnaGU5VjNtdEVOdmRaUEs1?=
 =?utf-8?B?VFRVU0dmSWZGRUlWOW5NNVBnczJCWHA3T2NzU001WUtYQkZ5ZytLcXNrb1k1?=
 =?utf-8?B?SjRIRndQdHJtdjdIQ3pmQ0hVc2VEd1E1d3N1ZXJ0aEJLN3JSb2VjSkxkK2Qr?=
 =?utf-8?B?ZFZmbDl0VzczTStxc3RKZUU4MkRDWm9XUVR6cDFkYWtTT3Y1a3FnU0tCUmth?=
 =?utf-8?B?MVphQk9TdkRoRjFNUmlYRElpVmtPZjhUWU43VlFHdWIvRmdlT3lHWkpZT21F?=
 =?utf-8?B?ZmlJYXJCN1pnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emM4cnVyckNpc2EvZndDYklEd2ZVN0MvTytiejJBU012SWdObFpYZlFMQjBh?=
 =?utf-8?B?Z1dhQ3ZQOWMwWFkvK3FEZkYxaEk1clZaT0FqVzkvUFJlcVoreGx4cVZwcUdm?=
 =?utf-8?B?K3N2WVpjQmZPUWlaVWlaYjkrS0Q3TkRhNmI0T1dBb3V0SjJYQ2V6eHp6SHVt?=
 =?utf-8?B?N3kwazljL0Q1ZTFZVGpIVmVpV2NlbndCUkpwdjZ5UnpOZTlqQzVkTjJERUxR?=
 =?utf-8?B?aUEzS1FrTnNZbVloSDRuZ1krNWtPMzIvYWVWcVAzb0E4WkxCZm8rZHZyOFRK?=
 =?utf-8?B?ODVtRlpqdmcvbWxUUVpXMFV1eFJNbGhnaFJtclkrZzUya2tTbXlHODhiemNy?=
 =?utf-8?B?TGViTVJBNHMzSGJody9ta09peGtLMmJVd0I3TW9TUXJGY1VPd0RJanNWS3k3?=
 =?utf-8?B?MEU1K0w3ZVpLQVR1ZlltWXNsMVEzUFpoUDBxeHJXWVdOdHFUR29XWnJ4aXBh?=
 =?utf-8?B?OHhBeE1kUzd2YXdmVWtwdkJqUjkrQzY3eXpFQ0k0SUFad1B4TjRTN0VlcjFq?=
 =?utf-8?B?RmVKdENPcE94cEduVVB5cXZIRGR0UFF3MXRNZ3VYcFBOeU4xdkVaaU5lc2Zy?=
 =?utf-8?B?c1VjZDRsZ2xodmpqN0VJVy9VNmFnemgxU05oWGp3UUI4WTVvM1VJN00xS3Ir?=
 =?utf-8?B?UlJiVjM2Zy96Qm9pRlJ6QmFlYklqWEJRc1JvTkdyL1JHaVg5YU1HUDJDZmN4?=
 =?utf-8?B?cVdXRjhNaGc1RkVVaDFkQ3g4NW5SWDdRR3ViTWlSSTh0ampOaFN5MnNLaEUv?=
 =?utf-8?B?YWk3V0V4R0ZsNmhQSC9BeENTS3YvdHlubUFLOEx6OUE3SElEcnVBRVZnbGtT?=
 =?utf-8?B?c1dXbEtTbnpQcmJPY3VyVGRNL2pzK2FOUmJSb05LbFF4QzllZEw5NGZHbnZ1?=
 =?utf-8?B?T2tLN3JlbDl2ZTNmWm03d2daV2VzR2wvUHhzeHE4aHVLUHBmbEhFb3d1WFVM?=
 =?utf-8?B?RFM4ak9mT3VmOGtXWkRjZEFvS3ZlNzYzT2dCZW9YRFpPVVZCd1lFUFZjS0pK?=
 =?utf-8?B?Z2pyUVdtanAwcXVRczVqV2FORVdIZ1RPQTE3WUlMeFhJWGNwSXE4Y1hOUDh5?=
 =?utf-8?B?R1F6YzJ1T0tFL2hDRzhjTlIxYVVrR2N5YjcvQjU2Y0UwMUV4RldHRU0rZS93?=
 =?utf-8?B?YUZEZm5MdGR1SWtYUGg4S0IrNlZXeEg4MnV4WGhST2Z4T3ltU3M5Zlk2OWll?=
 =?utf-8?B?VHRQV0tLVWk3M3JtRU9WZ1Fxd25EWkNmaWN0OXBnYi9sUlhxWEJaRGd0YjFB?=
 =?utf-8?B?ajdRTUd1Lzgxd3NZbjQyQzl5c2tjdUxPelpCaFRsTXNBNUxaMHVzRXI4SEhM?=
 =?utf-8?B?WXRpV2lzZUk1dUtnUFJPbHd3NjlyY1BJc3IxSGREcE9FeXl3YlJUM0lhYnNY?=
 =?utf-8?B?VE9UNlBaWGlzUVJGT1JjNWRQUWprdXhtbTJnQnI0aGJJS1lmVnBlb2ZiaDhV?=
 =?utf-8?B?QXl1WFAreE52SFJCT0NjVlNyZk14UmVkRnNFZUpraWNnZy9iN01NYXVhM3BU?=
 =?utf-8?B?WVVlN1A5M0xKdVIvM21MTWY5Z1ZwN1dwaVBwYXF0V29xcmh0WFJ4SDkyaFhL?=
 =?utf-8?B?T295U1pEMkZqOG1Zd3ppSmZVSXhLMmp5cEJKRmVDOHpJZ1dTQXpRQkVUV2Ir?=
 =?utf-8?B?ejZpWHNTanhkMFZmZnJiYmFVeDdDY0dmaWxOL3JObFFiQjhiZ3A0N0l3eGFa?=
 =?utf-8?B?SmVGdlZuWjIzTkFzbVVnaXpDSFZpaElJNU5FRHhzQnBCVEh1cGZZSGdQM2Zx?=
 =?utf-8?B?ZnRuUUxDMmhFeTAxVkd6a3RSTzIzSWlZdlhNcldzVmEvd3BUU1hkVHo4OG9V?=
 =?utf-8?B?VEFpVlZONmlDN0hTb2t1bWpLNmcrdmsrcHV3MUttZ3VXaE5iRERYSlhhdTRy?=
 =?utf-8?B?SG9CSVNBcGFONE5QY0RYT0ZLNWtjcy9xdkxSYklCVG1PYmtoLzBqNkROWkJF?=
 =?utf-8?B?VmtKbUl0L3FRN2dEaEhFRzRxRi9QWGdub1JReGFYZHc2VlkyTWRpVEUxVFg2?=
 =?utf-8?B?dGFBZC9URnZQRytid2FrM1NKU2UrZ3Z2TjlnMlB4dnlBSHZ3emhUYUd4RHpn?=
 =?utf-8?B?OHZqUW9pSElLZU40Z2U3NFZyUGljQnJva3NGa2FEOWpIQit3eXFGZ01FUnVw?=
 =?utf-8?Q?e+wSLSzZNS0GkUkn5I9mhUyU3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QRAInMhpJq57zGT0OXyBILqVOgx0MKotNvD3LDUuhz9derbWOt9DAEQAZamGyDFVCWgI8I22Ej8O8WwNgd+HB2Anw6AZLn3ISgTDl21oIzpMI/yIE03wdf4eowH+HB18Ta7VG0LZ3iMpiLzAqeICfytTN/4yqGFJDrT3r5pbJNj1kag12o2xVp56nqHhSQNiWRwDpQUM10navmTK+VtHQ1NzpUguB6rChskJ8z0quJyRkaF/AgxxGakcWDk8PG3hWkQoXKWlFO6jxiTKfz6y+iD1m2TIV5TxeOTt1oNCDJ73PTfoI9gd6F+X7l1oS30nF2mynU2KxRLWu9R5g51vTHoDFtQWEDKxLW3nmjETiOFDuZ6xQGAYUoGTtJJuaSFgzU7e8bfVUUdsUjAy8bxPs0HQHsiv5IMaj1yxh05wgsDkqIicgK4nvkf2OYtQHxMH3reUdCZxz9hjGUC7V5zuwH7fxQVcjm8PNLQQKzvrP+UCLWFZFn9ol/SJ7kVfDUNfVCG8eogSN24AkdQpblRV+yDylFWmy4riD7yRpDGJahzNOH3e0wEHicyINq1ID1+JOeH7mEQPKUuSwol7BeiY9XQxWvRQ8Czm2cLq3grGkn6hYy9cAzyJs18ylIBJjl98
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61fca4b-531e-4972-71f7-08dd9f25d294
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 02:58:15.1687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aoVndw+myMBqltg+Mltm24rrm8PfZ5FGna0zTtAjLr7gPfrRNb0/W8AxJwcdnrO1gIDv04TaDFoY4OPPET3IGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 02:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217460

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogMjAyNeW5tDXmnIgyM+aXpSA5OjQ1DQo+IFRvOiBMaXUs
IFlpZGluZy/liJgg5LmZ5LiBIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPjsgYWxleC5rYW5hdmlu
QGdtYWlsLmNvbQ0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY2xhbmc6IG11bHRpbGliLWhlYWRl
ciBmaXggZm9yDQo+IGxsdm0vQ29uZmlnL2xsdm0tY29uZmlnLmggYW5kIGNsYW5nL0NvbmZpZy9j
b25maWcuaA0KPiANCj4gDQo+IA0KPiBPbiA1LzIyLzI1IDY6MjIgUE0sIFlpZGluZyBMaXUgKEZ1
aml0c3UpIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+
PiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9m
IEFsZXhhbmRlcg0KPiA+PiBLYW5hdmluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+
IFNlbnQ6IDIwMjXlubQ15pyIMjLml6UgMTg6MjINCj4gPj4gVG86IExpdSwgWWlkaW5nL+WImCDk
uZnkuIEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+ID4+IENjOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPjsNCj4gPj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY2xhbmc6IG11bHRpbGli
LWhlYWRlciBmaXggZm9yDQo+ID4+IGxsdm0vQ29uZmlnL2xsdm0tY29uZmlnLmggYW5kIGNsYW5n
L0NvbmZpZy9jb25maWcuaA0KPiA+Pg0KPiA+PiBPbiBXZWQsIDIxIE1heSAyMDI1IGF0IDA1OjE0
LCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWENCj4gPj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+PiA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiA+
PiB3cm90ZToNCj4gPj4+DQo+ID4+PiBFcnJvcjogVHJhbnNhY3Rpb24gdGVzdCBlcnJvcjoNCj4g
Pj4+ICAgIGZpbGUgL3Vzci9pbmNsdWRlL2NsYW5nL0NvbmZpZy9jb25maWcuaCBjb25mbGljdHMg
YmV0d2Vlbg0KPiA+Pj4gYXR0ZW1wdGVkIGluc3RhbGxzIG9mDQo+ID4+PiBsaWIzMi1jbGFuZy1k
ZXYtMjAuMS40LXIwLmNvcmUyXzMyIGFuZCBjbGFuZy1kZXYtMjAuMS40LXIwLmNvcmUyXzY0DQo+
ID4+PiAgICBmaWxlIC91c3IvaW5jbHVkZS9sbHZtL0NvbmZpZy9sbHZtLWNvbmZpZy5oIGNvbmZs
aWN0cyBiZXR3ZWVuDQo+ID4+PiBhdHRlbXB0ZWQgaW5zdGFsbHMgb2YgbGliMzItY2xhbmctZGV2
LTIwLjEuNC1yMC5jb3JlMl8zMiBhbmQNCj4gPj4+IGNsYW5nLWRldi0yMC4xLjQtcjAuY29yZTJf
NjQNCj4gPj4NCj4gPj4gV2hhdCBpcyB0aGUgYWN0dWFsIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
aGVhZGVycyBhbmQgd2hlcmUgZG9lcyBpdA0KPiBvcmlnaW5hdGU/DQo+ID4+IEJlZm9yZSBhbnkg
bXVsdGlsaWIgZml4ZXMgYXJlIGFwcGxpZWQsIHRoaXMgZG9lcyBuZWVkIHRvIGJlDQo+ID4+IGlu
dmVzdGlnYXRlZC4gVGhpcyBpcyByZXBlYXRlZGx5IGJlaW5nIGFza2VkIGluIHJlc3BvbnNlIHRv
IHNpbWlsYXINCj4gPj4gcGF0Y2hlcywgYW5kIGl0IHdvdWxkIGJlIGdvb2QgaWYgc3VjaCBpbnZl
c3RpZ2F0aW9ucyBoYXBwZW4gdXAgZnJvbnQuDQo+ID4NCj4gPiBMZXQgbWUgZXhwbGFpbiBpdCBt
b3JlIGNsZWFybHkNCj4gPiAxLiBUaGlzIGZpeCBzdGFydGVkIGZyb20gbXkgb3JpZ2luYWwgcGF0
Y2ggaW4gQXByaWwNCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzIxNTE5Mw0KPiA+DQo+ID4gMi4gVGhlbiBLaGVtIFJhaiByYWou
a2hlbUBnbWFpbC5jb20gbWVyZ2VkIGEgcGF0Y2ggc2V0LCBjbGFpbWluZyBpdCB3b3VsZA0KPiBy
ZXNvbHZlIHRoZSBjb25mbGljdCBpc3N1ZXMuIEJ1dCBpbiByZWFsaXR5LCBpdCBkaWRu4oCZdC4N
Cj4gPg0KPiA+IEZvciB0aGUgZGlmZmVyZW5jZSwgSSBoYXZlIHBhc3RlZCBpdCBoZXJlOg0KPiA+
DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21l
c3NhZ2UvMjE2ODExP3A9JTINCj4gPg0KPiBDJTJDJTJDMjAlMkMwJTJDMCUyQzAlM0ElM0FyZWNl
bnRwb3N0ZGF0ZSUyRnN0aWNreSUyQyUyQ2xsdm0tY28NCj4gbmZpZy5oJQ0KPiA+IDJDMjAlMkMy
JTJDMCUyQzExMjYyNDIxOQ0KPiA+DQo+ID4NCj4gPiBJIGtub3cgbXVsdGktc2NyaXB0IG9yIG11
bHRpLWhlYWRlciBpcyB0aGUgbGFzdCBzdGVwIHdlIHNob3VsZCBjb25zaWRlci4NCj4gPiBCdXQg
cmVnYXJkaW5nIHRoaXMgaXNzdWUsIGlmIHlvdSBvciBLaGVtIFJhaiBoYXZlIGFueSBnb29kIHN1
Z2dlc3Rpb25zLCBwbGVhc2UNCj4gbGV0IG1lIGtub3cuDQo+IA0KPiBUaGVzZSBhcmUgY29uZmln
dXJhdGlvbiBoZWFkZXJzIGFuZCB3aWxsIGRlcGVuZCB1cG9uIGhvdyBjbGFuZy9sbHZtIGlzIGJ1
aWx0LCBJDQo+IGhvcGVkIHRoYXQgd2UgbWF5YmUgYWJsZSB0byBnZW5lcmF0ZSBpZGVudGljYWwg
ZmlsZSBieSBlbmFibGluZyBhbGwgYmFja2VuZHMgYnV0DQo+IGl0IGhhcyBtb3JlIGVudHJpZXMg
dGhhdCB2YXJ5IGFjY29yZGluZyB0byBtdWx0aWxpYnMuDQo+IEF0IHRoaXMgcG9pbnQgdGhpcyBp
cyBiZXN0IHdlIGNhbiBkbywgaW5zdGFsbCBtdWx0aWxpYmJlZCB2ZXJzaW9ucyBvZiB0aGVzZSBo
ZWFkZXJzLg0KPiBUaGlzIHBhdGNoIGlzIGZpbmUgdG8gZ28gaW4uDQoNCg0KSGkgUmFqDQoNCkkg
bm90aWNlZCB0aGlzIHBhdGNoIHN0aWxsIGhhc24ndCBiZWVuIHRlc3RlZCBieSB0aGUgbWFzdGVy
LW5leHQgYnJhbmNoLiBTaG91bGQgd2UgY29uc2lkZXIgdGVzdGluZyBpdCBub3c/DQpPciBpcyB0
aGVyZSBhbnl0aGluZyBlbHNlIEkgY2FuIGRvPw0KDQoNCllpZGluZw0KDQoNCg0KPiANCj4gPg0K
PiA+DQo+ID4gTGl1IFlpZGluZw0KPiA+Pg0KPiA+PiBBbGV4DQoNCg==

