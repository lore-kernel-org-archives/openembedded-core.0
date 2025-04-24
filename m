Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699D8C369CB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 01:02:00 +0000 (UTC)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
 by mx.groups.io with SMTP id smtpd.web10.4650.1745456516725450052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 18:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=eRm/ddqV;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.38, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745456517; x=1776992517;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3EOoMCdV+noPjJ68rWkxX4NUcjokzXYDy9cLmm17zkM=;
  b=eRm/ddqVXn+Iw3ca+qZaWwbBkv1TX18erltU9qGE532lfv9O0XQVH8UG
   lotGLYpv/qpa6yGXLhhlQEzeD/NRJpecyzXtlAVmDShAjApU57SGjAI/i
   Y/NjBmFYGa5OTYNtRk3M/pmgRj54dJbnQZ+toVcfKchMmgehlaJh8aVG9
   Wnbxs/Sbu77gVa5csLb424/bP5bf9mn7DgpDsOdvJEQ8Z3FYbgexm8mnW
   m780J4BOukta5ZvZMPHcPEgDCz/YYb//MuzRMfUa9S8WouT5SqawG2ZsP
   SCU2Txsc8xDJqDJUc0cP7GLrs+EUW1N47JNefNmU2d5ot/T+i//HfiZrB
   Q==;
X-CSE-ConnectionGUID: +C3MgXd/SuWVJaOC3Rei/g==
X-CSE-MsgGUID: nlEFGjpqQ4asCxi9FLnBIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="160311667"
X-IronPort-AV: E=Sophos;i="6.15,233,1739804400"; 
   d="scan'208";a="160311667"
Received: from mail-japanwestazlp17011028.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:01:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxyGHoM9SuXmGrbgwC+5cIBH0cUrQ1LNWNcehxXU2DvFDExiU964P/Fp79pyo759j3ui4iqsj06cva9nLdJAsl0+GNAPkr/PUjhD877DtT0RADlsqnEvyJNBUNqrlgTUlVkN4iosIPHh0MuVBtAh7zdQnFrqQDctPNHT1J81KB4DDDNuNIzDG/4NkLm3IlP9CQ/2JRVAlbABT5iNicg7OtqyFPKlUixQqM5klL33Vw5I1x7iDSF3K7alY29fHGEkW+Rce7KUpJD7cXAW3AFOEfLjVT/L9LIvgtTOBguYSjSL+CU9eSLEbzkO3RXAe/m/CB6fUQ2y0r6Oi0z37v0sZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EOoMCdV+noPjJ68rWkxX4NUcjokzXYDy9cLmm17zkM=;
 b=rTkMx7fJRLlaD8/uq8Mmyy6dtf4z3WWjNWWT52TvSg3nB/efRdOXT3lilinExXLMOS9QUKTz1uifQ4PKyEDdSUI+qDJE3fGws4APU+VpmEJCgy9ztA7GMspR6pcX4Vt28IbhkFEQgTHTrRctmeok7lGpZCeCgzHHYOsmzLilLx6yrgMW4XefTtR2aBGGQ1PJld5fRcmAPa82CloCGQVi2yojMzRdaHv88ntnx9rU91nEY1jRJ5q4r5EZfGH8m11i6peJKvslC/sJeVdxM5uqfpaJw6+cM6CGPxOSOjqYveVzejFd8/MkyTT2HgsR9HpsooW6AuL0IHCKBw5kEhCDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYRPR01MB15523.jpnprd01.prod.outlook.com
 (2603:1096:405:288::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 01:01:37 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8632.035; Thu, 24 Apr 2025
 01:01:37 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>, "Maohui Lei (Fujitsu)"
	<leimaohui@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIXSBnc3RyZWFtZXIxLjAtZGV2OiBG?=
 =?utf-8?Q?ix_install_conflict_when_enable_multilib?=
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbszGEH9kKtmbjvUuy0D4qNO16KLOvgK2AgAKBI2A=
Date: Thu, 24 Apr 2025 01:01:37 +0000
Message-ID: 
 <OSRPR01MB11597DB3AEB3CABB9CA28F7689B852@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250422025127.605-1-leimaohui@fujitsu.com>
 <F85259CF-8D1A-4464-A296-487B30A67ED1@arm.com>
In-Reply-To: <F85259CF-8D1A-4464-A296-487B30A67ED1@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MjBmNGRmNzItNzM3Ni00ZGUwLWJjMDktNTI0NWI3ODdi?=
 =?utf-8?B?ZDA5O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTI0VDAwOjU5OjE5WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYRPR01MB15523:EE_
x-ms-office365-filtering-correlation-id: 6560c3af-af6b-437e-4fd5-08dd82cb90a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SUZ2L3RlRUMzSW52d3h0ZXVjTjB5WTFGbExNbUM1aWNPQW9UZkVkVkY5MlBx?=
 =?utf-8?B?aWIwcnpVODJxYTVUZ0V0dmNCM3JHTGdWcEhpcDdHZkNvQUtMWEdyRktsY3V2?=
 =?utf-8?B?TlREZVZWMDJuOUFldEdESEhYTlNvK2kvRTY0UmtvTG0wSjNkdFRWNzdlNlZK?=
 =?utf-8?B?U1ZxeU0xM0EwdHlWeFVITSswOVY4cDRGUWhRQy8vNW5rWk5UcGsrT1BXUFdX?=
 =?utf-8?B?K2tHVTgxRzdaSDRTMGdWS0pDbk5hTDNVVHcxSFdNa0hZVnc5TktsU3dwVTNH?=
 =?utf-8?B?c2lkR3p1T29jM2NPVHBDcjRjU3VVeVFtakl4T1NwTXRjZ0EybEI2dEhyYzZ3?=
 =?utf-8?B?dUc3eHVqNzdZa1dCK2hXZ1YzT0pJSkVLTDdYdnV4alpPekk3blh0bDBoZG9X?=
 =?utf-8?B?cmZMdkc3NWFidkp3Q1cyR3prMlpDN2RQRmpybFBrZDQ4T0x3cUpKUW1oN3lJ?=
 =?utf-8?B?WHVCbXBEOFBQdjlWcU4zRCtqYU1tOG43WUJaaGRKd1hCSytDd2RvYXlIYmpm?=
 =?utf-8?B?TG9SQkZoWTNtcU1WT3BoazJVVkxmYnh6dTdicFFQRHBJK2Ztd3Jzakl2ZTR3?=
 =?utf-8?B?OURLeVJkTFZvQ1NRQ1FkTzdpWTdneXNCSmdmMUw3OXkwTDBsVjdhT09XelhN?=
 =?utf-8?B?bnVqcUFNL1FUWGZvMkRSU1R6ZGIyeGY1UnRPTld4MlJLSkp5ZjVZeTQwSlE5?=
 =?utf-8?B?ZjJ4aUE0Vk4xa21oc2s0WEkrMG5tM3krQjZqeUpoUkxlUlZ5UkhMSFNJZWJ1?=
 =?utf-8?B?dk5oUm9PeXV4SGwyOGtEVDhQUTBlWFJVbnVyQTBhS1JJMEdhWFJPVDV2ejNs?=
 =?utf-8?B?a1AwNDhkOFIyZnZoeXlZQnNQbEtMLzcrNWtrM0RkTXU5d0UwSEl1dUl2eHJo?=
 =?utf-8?B?TVNjWUFrbi9RcFl3NGo3NWNCNmhQeEF4cUJqTXBTUC9OQzM1YVJzMmloM2Zl?=
 =?utf-8?B?OGdOUEZISEFpS2lSQ3lKdVdyUkFMZXZLQ0lyRGlkanAzd0FwVHRNeEdhS3p2?=
 =?utf-8?B?SEV0OWNmeGdXWE41MzJnN0k1elo1T09qdElQMXJxQXFmRERQRFhVTnRWSld1?=
 =?utf-8?B?bmtKR1BCa3lNYjJrRVorYzA5WXZnVEtKaTFIRVNWclI4WU9uOUk4WDdtZVFS?=
 =?utf-8?B?VmxvdVdYazZrRjlxQkxvc0lWazVkTm41bks1eUtEbHlXYnNoWTJ3RExYSFJ4?=
 =?utf-8?B?Q3gvZWpLLyt6NUUvNkxZZUJZbDZtUjJQcjBBZDNTbW43REJ0TW5MSk4zRk4r?=
 =?utf-8?B?cGRFSlBOWmt6Nk05QXhrcHo0WE1tR1p0c0s5aHBPaUhMblVENlR3YjB1dlQ2?=
 =?utf-8?B?Tm1Gd0x6bHpnbnprYzJsSW9hbXN5UE1OM3E2RTZ4MHg3bUFpeVA0Ly9vYUY3?=
 =?utf-8?B?eWVHVDZQOFVqMmNuMnBGZERydFVNMWtJRjBHeDNoS0w1MnRIdFFvOGt6elJY?=
 =?utf-8?B?bkRKQ2ZVanlYTDRlMkhGc09QMlRTOFlpeU8vMGN1bngrNnRUc0dCWnBrVWx2?=
 =?utf-8?B?bnp5SnY2UDhBTmZoU25Dc0ZOTldQSEVrUWxXUk1DdzJjbllkWGVWdTJvK3JK?=
 =?utf-8?B?Rk5NMEJhU2RPOFhIWTZnT3FCVHRPdk83amEvZkljQ3Y5Y0xwbXBKaVBIdDgr?=
 =?utf-8?B?NHhUMmdqUWFBVjJpdWMzNnNPUnpFb2dqOFRrUlZWSjR6Q1BiNVFuUUlYbllp?=
 =?utf-8?B?RXpIR1dhSTRhVHhxbE9OTGhwWVNONGRKL1JuZGYzMGF0d1BLWU12T0tpK29t?=
 =?utf-8?B?VlVEa3g2YjZzbU1KRlMyTzJEaWtVY2g2eDc4bmUvR2NtQ0hDQlJGRFJabXEx?=
 =?utf-8?B?SWpPclpTeXNqZ2dENXRQM3d4b3FmbW5NRWtQeDJMNUtSN1NORlBnN3FDREtJ?=
 =?utf-8?B?NlU3MTAwNk4vNFVZbUdxRWRTaFpqQnZ2SWQ3cXBNcGNaZ0c5TVZDUnZnREJ2?=
 =?utf-8?B?eTFSbDBLVEIreUMrbHVNNHpibGlpQUVBdmJEdHMzYnRmbFd0L0xpMFlWT3J6?=
 =?utf-8?B?OVVCbW8zZ1NRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WS9ZM2VtdmRGSE12SThBSzhYREdsR1NabGltM0VXYzJocGpDMTAxWS9lZHdz?=
 =?utf-8?B?K0JHU0ZsSEZiRVlBbGxzdko1QWtUSER0K0ZLL21uRlpBY1FOZjlYTHgrTVA4?=
 =?utf-8?B?VkJBckhVRW9wbW5FVTZCSDBTV2RrN2xSVjM1QzVEUWlsOTNXSWZ2K0RrWlFU?=
 =?utf-8?B?NWNTcTNiYXpnQjJ2ekFiNTR1aEoxakoyaWd0M3ZBTGwySUVjdUNhcURiTWh3?=
 =?utf-8?B?d0JzUy8vdWFnNzIvSHErTnRWVFJ1SXJrSGpURmdCcGJoNk8xUE5lUkY3WGla?=
 =?utf-8?B?SWhVUFR3dmUxWUlxeGJ2MFJpVnUrL283R081emdHVnBFTklFQklnYTlMazly?=
 =?utf-8?B?VWJZM1FZdFYvWkdLQmVxSGxzODMyUEdkMlhEKzNLSHlTaXovMlJTeVJ6Zzcz?=
 =?utf-8?B?b05aZGxYcGNRUE5JV2JtaFRHTjJsVXFRdjFaN1cyRVpsV1RTL0pTOFNGVGJt?=
 =?utf-8?B?RXN4K3hLcTVoWUFScXlObUwxeXpnb0hucmN1b2tURWdMWWxQeHQ3SGhkbmRD?=
 =?utf-8?B?U3dxRk52U09UWlRYUE85Z1lVaHhWT01IeGhKYXpvQXdOWkJDNnd3c010Z1RX?=
 =?utf-8?B?dWZCL3ZXVkhXMkNUaWFxdXdTdGlCUXFEVGNZUGE2TlkxWDQ0T2RCcUlJd2FY?=
 =?utf-8?B?RGRrWXBwM2JnQTkybzhEQVZkK3hXMjBoN0NzV1JRZTBtelVuSUowWCtBb2ZJ?=
 =?utf-8?B?ckZzeUxhRWczWHF1aTdzTm1IOFlVTm5OYnFlWDhka08zamRZR0taMys3d3J3?=
 =?utf-8?B?QTQ5YWZNenFsb0R4TzB5dTB0MWVtZXRkWHdoKzgxVFRTb0s3N0VKVWNIYU1I?=
 =?utf-8?B?eXUvN3BOZVd2ZXpTS29tbm13VGxpemVBOFpGcVlNYnNiTmJvN2QrOWUwS1gx?=
 =?utf-8?B?RzJwTVRDRDY0VDk4dzF0SWpGSlpwNnpyM1RRcElIYk9nNmhZMkh3a2lYaE03?=
 =?utf-8?B?Nmx4SXpvWkwyTk03K2JWWlhoejJqTXpTS1hncWxheVgrR2JrRFQ3emtsdGYy?=
 =?utf-8?B?ODZHT1M3S0pKcVM0Kzc2RTdaWlJldHpFb2Z0dUFTb3loUXRsRlNkZlcxWlZp?=
 =?utf-8?B?eldPQWIzekVQTGZWbmJrdHU0YzZWYUtCWTRCNzJzZlVNTERabVF0VEY2bS95?=
 =?utf-8?B?dmthWnUrNTFUT0ErT0ZNaG9WaU9FelJOQzEzd2wyS1RHZUcyamh0NE55dEtV?=
 =?utf-8?B?NkF1NFJBQUM4d242UXg0NGZtN0F5R2FOU0pTZ01JN2pvUCt6eGo0SEpSWWNJ?=
 =?utf-8?B?N1hsV0xvaUxSMVQraUVLZ3VsYy9zTk8wclBHaGZaN1VkSGRDQjUxZk50QWhB?=
 =?utf-8?B?anh5UmtGYzh3aWhtQUdQWEU2QnA2VjIwTFVVUkpYcGViQkczOFVvcVJMY1dr?=
 =?utf-8?B?ekFGdk9NYnd6VW83K0NERjljaGk3UW9hUHZmNTltVWhZb21WV2ZkWXJYT04w?=
 =?utf-8?B?RWFUOUgzZjIzUThuOE5nblJESWtLMHN4Z3Y3RkF3Z1RsRjRsRHlDZjlwQllE?=
 =?utf-8?B?dCtpM0Y3RGxxQ1psTi9oNm1yYVdIenYrRTZBYm8wMkxhdUc3QXZtV2ZLV0Qv?=
 =?utf-8?B?R0ZMWXJmRFU3OVBhOGxLTEZXKzRmSysrM1dVNUdvN3FobHdKbDdWRzJEZWJh?=
 =?utf-8?B?UDJ5QWJsZ3R4TTVXT0R6dVFVZXJRaXhQc1QvbHJMUW45MzBkRHBCNmhVM3k4?=
 =?utf-8?B?SW5vQ1VUNzVRQlZmaXU0OExSdndtR2E1aTRlMzh4RFpKOEZ5Y0FDQ0ZjWlJs?=
 =?utf-8?B?VGRlVjJYbHZQaGs1czdDRmk4NTU0bXg2TndSeVRpbmdRY2toVjVYbFMxYjE1?=
 =?utf-8?B?VVJXa2dHQ0lwVnRHWjFQM00wV2I0MEwrRHFnaXJCeDc4eWExejE2d1g4aHBT?=
 =?utf-8?B?K2V6YzZKbkVWTkRUbHZFVkc4UTlGdTlGZEZPUkl4aDdjYzYvakE5dUlDZ3Vv?=
 =?utf-8?B?djlsRkxJU241MmFFTEdUdHFQQzZtNEVxZHNSbE9HdXljY0xIZnBkL2srNmVJ?=
 =?utf-8?B?cUtvVkhDMDk2NktIb2JSMlZTVDdYaFpiZWtCc25NOHZQemlTN0loaGhIcWsw?=
 =?utf-8?B?YllGaU04Z2FkUGVyQktPMjNJVTlQZUFSK2RqczNZVVVaS0tXcHIyRlI5K1Rl?=
 =?utf-8?Q?1hY4iXPAiPOTV2y+AANuDaSpc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cglAGNkTWGJaR136plExHCfKDf8wxik/epN45CG4rTSm1frnI1HapXQwRI48n2Or9+7mkucQDCcQVXRxUsAaamPomP5dCU+ZoL3uVsWwNBlacRhcmP+yFBUKDoxMxwZU65FgH1LWMriz78HMy5AxSyg73qa/UBY87voq0r5R9vk1urPcUM+XxIB8oSVHozXmkRKeCeUKpA6Rmfcnk84fVx1HcCgy+8zjhtXCOEHlkIBltwlX7xzIfVmxTEip5ByiZl5vsNrHgKwrjuyQmlfW8B+6Tyb2WKMcaErPcyhtSdzm7kBjjZRSqfTPnY8K4LesmKva1MGtZBD6Py5sRfrxQeF1Svj2vHrfIoKOIvppgKHygLdDFqfl+GsKMuWP/DfDYRMGERKlwVdTbuQ3eG7AX7hguhW8Gs0wf/1gpyCCgk6MgGstOUzjUK8cuZp+/zX8klG2IUXVTNXpZN7/J4jofDEL06P5PDMltA9se+gp3yaVa/ezMGAn+0CCFlNunoXa/gc3Q6TgDEvvrqjQ6XQ8ZAGrFy17HgVNQWsNJYaa3hdMY0ZHwu2t9bdFpJH/GjGbWJiQCIiAiszD06m/XlSEzkXieoTAdRztY9gnVZvENqABrGXkUx8kiKdYBz48/1kS
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6560c3af-af6b-437e-4fd5-08dd82cb90a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 01:01:37.2920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/EPIwQGHSMsKTXyfBmHZVVZ615wdOyew8DA5s6ClJpRCrljD8ibKv66d/MDXWPBQ7VWqoXA4w3/sILzM8m4Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 01:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215320

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IOS7o+ihqCBSb3NzIEJ1cnRvbiB2aWENCj4gbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiDlj5HpgIHml7bpl7Q6IDIwMjXlubQ05pyIMjLml6UgMTg6NDUNCj4g5pS25Lu2
5Lq6OiBMZWksIE1hb2h1aS/pm7cg6IyC5oWnIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IOaK
hOmAgTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiDkuLvpopg6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnc3RyZWFtZXIxLjAtZGV2OiBGaXggaW5zdGFsbCBjb25m
bGljdCB3aGVuIGVuYWJsZQ0KPiBtdWx0aWxpYg0KPiANCj4gT24gMjIgQXByIDIwMjUsIGF0IDAz
OjUxLCBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
RXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6DQo+ID4gIGZpbGUgL3Vzci9zaGFyZS9naXIt
MS4wL0dzdC0xLjAuZ2lyIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZA0KPiA+IGluc3RhbGxz
IG9mIGxpYjMyLWdzdHJlYW1lcjEuMC1kZXYtMS4yNi4wLXIwLmNvcmUyXzMyIGFuZA0KPiA+IGdz
dHJlYW1lcjEuMC1kZXYtMS4yNi4wLXIwLmNvcmUyXzY0DQo+ID4NCj4gPiBmaXhlZC1zaXplIGRp
ZmZlcnMgYmV0d2VlbiAzMiBiaXQgYW5kIDY0IGJpdCBzeXN0ZW0NCj4gPg0KPiA+ICQgZGlmZg0K
PiA+IC9tbnQvdGVzdC9idWlsZF9hdWgvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9nc3Ry
ZWFtZXIxLjAvMS4yNi4wL2kNCj4gPiBtYWdlL3Vzci9zaGFyZS9naXItMS4wL0dzdC0xLjAuZ2ly
DQo+ID4gL21udC90ZXN0L2J1aWxkX2F1aC90bXAvd29yay9jb3JlMi0zMi1wb2t5bWxsaWIzMi1s
aW51eC9saWIzMi1nc3RyZWFtZQ0KPiA+IHIxLjAvMS4yNi4wL2ltYWdlL3Vzci9zaGFyZS9naXIt
MS4wL0dzdC0xLjAuZ2lyDQo+ID4gMzE4NjRjMzE4NjQNCj4gPiA8ICAgICAgICAgPGFycmF5IHpl
cm8tdGVybWluYXRlZD0iMCIgZml4ZWQtc2l6ZT0iOCI+DQo+ID4gLS0tDQo+ID4+ICAgICAgICA8
YXJyYXkgemVyby10ZXJtaW5hdGVkPSIwIiBmaXhlZC1zaXplPSIxMiI+DQo+ID4NCj4gPiBUaGUg
aXNzdWUgdGhhdCAiL3Vzci9zaGFyZSBpcyBhIGFyY2hpdGVjdHVyZS1pbmRlcGVuZGVudCBsb2Nh
dGlvbiBidXQNCj4gPiBjb250YWlucyBhcmNoaXRlY3R1cmUtZGVwZW5kZW50IGZpbGUiLCBpcyBh
ICJsb25nLWtub3duIHByb2JsZW0gd2l0aA0KPiBnb2JqZWN0LWludHJvc3BlY3Rpb24uIFlvdSds
bCBwcm9iYWJseSBmaW5kIGFuIGlzc3VlIG9yIHRocmVlIGZyb20gMTAgeWVhcnMgYWdvDQo+IGFi
b3V0IHRoYXQiDQo+ID4gYWNjb3JkaW5nIHRvDQo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2dzdHJlYW1lci9nc3RyZWFtZXIvLS9pc3N1ZXMvNDM3Nw0KPiA+DQo+ID4gV2UgY2Fu
IGZvdW5kIGlzc3VlIHJlcG9ydGVkIHllYXJzIGFnbywgZ3N0cmVhbWVyIGNvbW11bml0eSB3aWxs
IG5vdA0KPiA+IGhhbmRsZSB0aGlzIGlzc3VlIGZvciBub3cNCj4gPiBodHRwczovL2dpdGxhYi5n
bm9tZS5vcmcvR05PTUUvZ29iamVjdC1pbnRyb3NwZWN0aW9uLy0vaXNzdWVzP3NlYXJjaD1tDQo+
ID4gdWx0aWFyY2gNCj4gDQo+IEFuZCBJIHN0aWxsIHJlamVjdCB0aGlzIGFzIGJlaW5nIGFuIGlu
YXBwcm9wcmlhdGUgd29ya2Fyb3VuZDogeW91IHNob3VsZG7igJl0IGhhdmUgdG8NCj4gdXNlIHVw
ZGF0ZS1hbHRlcm5hdGl2ZXMgdG8gYnVpbGQgc29tZXRoaW5nIHVubGVzcyBkZXNwZXJhdGVseSBu
ZWVkZWQuDQo+IA0KPiBGb2xsb3dpbmcgdGhlIHNlYXJjaCB5b3UgcHJvdmlkZWQgd2UgY29tZSBh
Y3Jvc3MNCj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dvYmplY3QtaW50cm9zcGVj
dGlvbi8tL2lzc3Vlcy8zMjMgZm9yIHRoZQ0KPiBnZW5lcmFsIGlzc3VlIGFuZCB0aGUgYWNjZXB0
ZWQgTVINCj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dvYmplY3QtaW50cm9zcGVj
dGlvbi8tL21lcmdlX3JlcXVlc3RzLzYzDQo+IHRoYXQgd2FzIGZpbGVkIGJ5IEthbmcgS2FpIGZy
b20gV2luZCBSaXZlci4NCj4gDQo+IFRoaXMgaXMgbm90IHRoZSBzb2x1dGlvbi4gIFB1dHRpbmcg
dGhlIC5naXIgaW50byAkbGliZGlyIGlzIHRoZSBhbnN3ZXIuICBTZWUsIGZvcg0KPiBleGFtcGxl
LCB0aGUgRGViaWFuIEctSSBwb2xpY3k6DQo+IGh0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9nbm9t
ZS10ZWFtL2dvYmplY3QtaW50cm9zcGVjdGlvbi8tL2Jsb2IvZGViaWFuL2xhdGVzDQo+IHQvZGVi
aWFuL3BvbGljeS50eHQ/cmVmX3R5cGU9aGVhZHMuDQo+IA0KPiBUaGUgaW50ZXJlc3RpbmcgcXVl
c3Rpb24gaXMgd2h5IERlYmlhbiBkb2VzbuKAmXQgZmVlbCB0aGUgbmVlZCB0byBkbyB0aGlzLg0K
DQpZZXN0ZXJkYXksIEkgc3BlbnQgc2V2ZXJhbCBob3VycyB0cnlpbmcgdG8gaW5zdGFsbCBHSVIg
ZmlsZXMgaW50byBsaWJkaXIgaW5zdGVhZCBvZiBkYXRhZGlyLiBIb3dldmVyLCBpdCBzZWVtcyB0
aGlzIGlzIG5vdCBhIHN0cmFpZ2h0Zm9yd2FyZCB0YXNrLg0KDQpJIHNvdWdodCBoZWxwIGZyb20g
dGhlIEdTdHJlYW1lciBjb21tdW5pdHkgaGVyZToNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9nc3RyZWFtZXIvZ3N0cmVhbWVyLy0vaXNzdWVzLzQzODMNCg0KQWNjb3JkaW5nIHRvIHRo
ZSBvd25lcidzIHJlc3BvbnNlOg0KIlRoaXMgaXMgbm90IGdvaW5nIHRvIHdvcmsgYXMgZ29iamVj
dC1pbnRyb3NwZWN0aW9uIChhbmQgbWVzb24pIGV4cGVjdCBpdCB0byBiZSBpbnN0YWxsZWQgaW4g
L3Vzci9zaGFyZS4gVGhpcyBoYXMgdG8gYmUgZml4ZWQgaW4gZ29iamVjdC1pbnRyb3NwZWN0aW9u
IGZpcnN0LiINCg0KSSByZWFsaXplIHRoaXMgaXNu4oCZdCBzb21ldGhpbmcgdGhhdCBJIGNhbiBl
YXNpbHkgYWNjb21wbGlzaCwgc29ycnkuDQoNCkxpdSBZaWRpbmcNCj4gDQo+IFJvc3MNCg==

