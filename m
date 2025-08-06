Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A31C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:22:41 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web10.21148.1754472153891343646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=yjXBbitX;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.101, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1754472154; x=1786008154;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XqJroJ72tmoCs8Ug5uQFZU7f3e9ZL6HR1uY+XuoQjQ4=;
  b=yjXBbitX2z6zGPvBiuJgar0z8oBWP06h7lVz1cuMoXYIj2ofpeW7XQha
   0l14xdis/r/AQc5MVCaS8RjBzkWxqsrZrXJ5Hf7cLwN2fIrTo+gKawe+I
   dDY9r3iyLrX7GRWc4U61JM26gxyup7IKezAxSENN0n59L3hj3O8PZd2HS
   V6Qov0UOkzvZNiPE4SzWb5MjI3gN2S9lNk6Ts12pbmqVtXyRkWlYoGt/q
   4VABSqcF0hhkQvNDqAEOLqCWpq3PVG7hJr1lrFdU32h6BRG8KZwjuqXBN
   vcSP0M3jWFJfZxSk0a8ZpmwL/H/so6KRPhXxESaqzuJoelNhM3JLT5Msc
   A==;
X-CSE-ConnectionGUID: UmGYAMEFR9muPq0tGDF4Rg==
X-CSE-MsgGUID: Gyqi2t4GSsC1yEFcZTPe0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="163661710"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="163661710"
Received: from mail-japanwestazon11011046.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.46])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 18:22:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQfCWRxJJuuoGJ24F0NTMlyyq78WrbX4JFVWbszZfE5S2KogCowlhp4iJwrTJaJxbbbFy7H87zoFCvgGcyOnIgEcBrm7uGcFJBNqEBGrzLo/pWPJLxdnQWxXc35z9n8OUHGtZhdyVwSQZaqdcv5SWmFiUyFrJAh9PC3BmIuYeoMcoeJn8wrJBiaVvZHlsoMhHBiLQDKhbFP3qUV3iKXOTBq1a433MunGUcpLXnQckMnXAeahstO8Di61r6o0wcNHl7h2cTH1LPQgO4tYdw+YG4z2xzTYVH+IlvzCosMQnSbbC/fafFnGWe0IgkmcgQtz7/HcG2aYxu2rISQXSapV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqJroJ72tmoCs8Ug5uQFZU7f3e9ZL6HR1uY+XuoQjQ4=;
 b=zPnPZ+FvEkF7/0fbV7oh7bUdC2/CCgAPSuPdF8KUGAS0eIw7JmN8EbD0LIMAGV0QLNrPUhiMlwlbd2UONypYrs1HS80Ufdv3duaJaTU5bE7OEUWskKZTD/UOqqjzTncWrq/bekuRp93JJONg5nUanx7nQL4AKh4/6Pqytw/nJmNGtIu0dxDwfm+tJeb6dXkz2aQ08RbGZ4BOhMIznanaag/bR5suHLfaOZMJ92zuXehG+sTBf6I4yeVz+EiRyIsLj82t+Dr4LT8H6eDpP22rRZUdxwwYMpOWTz9AnOvlSLC4n7nR8lnxCYxlZ6EVPhno2L4Vgq9TN/YvTvkyxbs94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TY3PR01MB10222.jpnprd01.prod.outlook.com
 (2603:1096:400:1d9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 09:22:02 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 09:22:01 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/9] vulkan-headers: upgrade 1.4.313 -> 1.4.321
Thread-Topic: [OE-core] [PATCH 1/9] vulkan-headers: upgrade 1.4.313 -> 1.4.321
Thread-Index: AQHcBq2rjEtE5I/6RUiddOyWmQH2a7RVVbIAgAADiUA=
Date: Wed, 6 Aug 2025 09:22:01 +0000
Message-ID: 
 <OSRPR01MB11597E642A830CC886147ED959B2DA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
 <CANNYZj_Tws5Pd6mJhXWfsJuJ2gPYWzs3kDG19YWgvOM2jSJPHw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_Tws5Pd6mJhXWfsJuJ2gPYWzs3kDG19YWgvOM2jSJPHw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZWQ1MWMxNjQtOTI1Yy00YzEzLTliZWQtNGYwNDY2N2U2?=
 =?utf-8?B?ZDEzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjUtMDgtMDZUMDk6MjA6MDRaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TY3PR01MB10222:EE_
x-ms-office365-filtering-correlation-id: 60468597-1eba-4886-4f44-08ddd4cab37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OFFMVjFZaENZbys5Sk1NTGRoaUtJbjZrOUk0NUpaeEs2RDQ0VnlLRVU5akhK?=
 =?utf-8?B?SzFndi9kQVc2REJCTng3alJLM2NlUE13elFMbXplNnA2eTk3YVZGMUdnd2Fa?=
 =?utf-8?B?aklLeHgvSUZqZnpES1ByeVA5ZkJ0TXRnWmIrV0xMZFl2RVdoclhyWmR3d1lC?=
 =?utf-8?B?NjNjRjZoMmtNazNZbWRLenYvUERuaEU5UHVhSmc5RlIweU9ZNzdzODFNVEdz?=
 =?utf-8?B?QzhCQ2xZdnA1aVpPZ2UweW5lejFNTi9EV0YvTmJteXNyMC95cjZ1Y2U1T01N?=
 =?utf-8?B?UGw5U3hlTi9uZDNYTWJGRmNGQWFDWDBodzJ2bjR0Q0NGYWk4U1YwNXFPam1u?=
 =?utf-8?B?RTQzaDJvOXFpaGRiVng1NThtOXFBZFZCR3B1dzY1UVhVYUJkeHAzYzVhQzFF?=
 =?utf-8?B?ZnZRcEtjcXRoUjI5THRDUVowdlhUSy95UmJDNGFzbTljcG96a1djZDRnMk1G?=
 =?utf-8?B?QzVSL3ZmS3FRQ0tWVHIxQS81VGRwZE4zZ2VGc3Ywd3dUQ0VlSUh6bnVWR1lF?=
 =?utf-8?B?MUlsSGNLb1QzT3FHTTVkeFVvbUZGbE5tM2Zrb3VrbkhXRVVLV2RleG1hOXZr?=
 =?utf-8?B?cXBjRS9EZzN6VXp3SHVnT3d6S05YNXhzUXgwQzNwbVVyWThWVWI3dEp6U0Vt?=
 =?utf-8?B?bkU3V2ZhWjBubklsRzBoUHBmOGRNVnFqeTJ4dFhLU0E0Q01rMjlqaStLSU9D?=
 =?utf-8?B?dFJhUE53OTA0cmxwcVhEdjRkS3hoNGpuL2Rnc3NockZVamhkNHltWGw4ZUJn?=
 =?utf-8?B?TXNnRmZqU2wwWHE3YWwzYTFGUTNDYUdqSFMzWGdNWVhoK09SS3daMThnUWlQ?=
 =?utf-8?B?Sjl1VGFYUnZueEF6WmpXVDQwQWNVbXhkcGxiWUhJYUc3VFhPdFlwdi9yV0lt?=
 =?utf-8?B?djNNTUVSYmI0UUtHSGJNTytyWEptd3d3Q3V6cDZIY0JvNGlSNWsyWStnck5Y?=
 =?utf-8?B?cWhjSHRWNnpXOTVrbE5CU0pSSmQ2M0xzM2htZUdDZHA4d2k1Nk5QVHdJVkJw?=
 =?utf-8?B?ais1dFUvVlVUb1hJdlFJN1dyYkEybEsyT09iQW5VOUZyTjdwSFlSazdHN01l?=
 =?utf-8?B?U0ZrZ3JKS3oxeHFpKzFQZ2FJaGhwZmxQQ2gxK245VWNhV3VDMlJ3bm9yRzg2?=
 =?utf-8?B?K2FZNTgycTVCdVpsMWtORkl3M1Z0dVF0YUtzNzlVVzhGT3pyVjZsWlkza1Vj?=
 =?utf-8?B?aER3R1B4eDZlYXptZ1pwZk5vazRzZThocVBlTTBUZ3ZPWHNxSlA1Rnl6R0Ni?=
 =?utf-8?B?RDdhcHp2bmV3YmhncU5tb3BleEMxYUlIUXdrSzh4bWdrZ2NCaEc0d2JrMk5p?=
 =?utf-8?B?bHFUQTZpdU5JZkhlVlByQXZvTWFIdGVsMWRWWXdBRlkrZzJSc1lSQXcrMkhx?=
 =?utf-8?B?S25IREVPZjRhVnU4UXFDci9vSE5XSXdpWW44RkRUamg3ZVBLUFg0LzBWRER6?=
 =?utf-8?B?azl1VXIzYVhvQ2VYWFluSkFIek4vNGk1TVNiMDlNNGR5dGdmR2swdGJPUjNs?=
 =?utf-8?B?VHgxSXZXQnoxdExIY3VBQTFNVzUxTnBScGprNDdUMUNQNnhlekk2WllEZHhN?=
 =?utf-8?B?bXYwZ2RYTEt0dTRMRjYySTVlUUR2QTM1c0JXMXRHQnllaGdDMkx0S0t3bGg3?=
 =?utf-8?B?dnV0eVl6Qjk5bXQ4dEhuTXQrSjU0VzJxTkRPOXJPd09vcnlja1RvekV5bnVs?=
 =?utf-8?B?WEo3b0N4NExsNW5ibWE5anBBSmdCSHJROWUxWEdJek5wV2NTN3RoNnlObXIr?=
 =?utf-8?B?Y29iOHErY3ByWW5xT3d4RzJ6WDg2T044Rm4zTGxsMTZVS2ZaWDJqOXRXNDZY?=
 =?utf-8?B?azZXaEtlZ242ZzZ5YzQvalZXKzBNaTA0ZU1CUjlORU1wcmQvci9rTlI0eWFQ?=
 =?utf-8?B?UnVqLzhPRytyS1BBTklBZXVsQm5RYUJKK1lXR2kvdEZuT3ZiN0owUEtKUVFj?=
 =?utf-8?B?UGJ5MklLWEJhYldZdnc1VVF3OUc0eDhBdll6K0pFd05RYWduUS9qVm9xQkUv?=
 =?utf-8?B?R3JFRDdxTm1PTFYwKzJqdVcrOU51enFJOWRDbWRaak0yL0VyYnA3OXFmK1F5?=
 =?utf-8?Q?P27xLW?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VzQ0MXFXdGtnL2xZcEVkajVjVkFZSk1hVTJSMFVKcS9wblIzUUxqVWttUDlz?=
 =?utf-8?B?bFdBLzNnaUd5SjIwZGgza1pGK3ZYekp5ZDZ1TjdlcENqTFRHU1hRcUpvcVRs?=
 =?utf-8?B?cExZL2xZajlRTnJ6UGt5RjJ5WHFtRlE5OGcyOVJ0RHF4VGtSbmRjSldZa0dK?=
 =?utf-8?B?UmtHbmRRSFVudHIvRmE4M05BRTEyQmZUMS82cWtjejlmNzJjSE40ZTM4dE0y?=
 =?utf-8?B?Z3lyUzJhT0RETWNjM1k0L1pmR1liLzc3dGthcFo3V0R0NE16TytLMFd6NzFI?=
 =?utf-8?B?ZWhtT280Uk8zRk9GRDB5WjJXUmVRMzZLeGR0OFZLdk9UMEdvdHBTWVhiWHdR?=
 =?utf-8?B?MW1lc0liZS9aMmxsZG9zcnhMblpZQnYzL3RjdUFzWVNTOVZNakhzL2kxbmdn?=
 =?utf-8?B?aHl5VWswUThHbHNKNElWRkwwcXBITnlicTV4VXF4RWxJZUhVVWRSc2pHNzQ1?=
 =?utf-8?B?ekg3ckZEeUx1S25ERkRSeFVYeXk1ZzYxV3FhenRvcXJFNmg3SWlWNTZhbjF5?=
 =?utf-8?B?VHNtLzBsTDZoWEtKbFhxUmhCU0NQQWx1ZkdKZDBNYVVxTUtZTERkaXIrK1B3?=
 =?utf-8?B?NlBWU0pIaUJNWG1VbGtIa3Y4VG1JRDJvTTF1T1VldlBpZitOdy80NExVZ215?=
 =?utf-8?B?amlXL1hrRGsrUlh4QXFWQzZZS3ZWMGloMi9EM0RzNVhqRlFYVmdwalNWUEEv?=
 =?utf-8?B?bDBTeHpxWFBvTWJhbVBGQXc3MDY2WXhrMTJBN0E2UHdNencxUmtqV0tNQWho?=
 =?utf-8?B?ay8yaWF1YWJhS1pVb3JZTU51Q0JENm83VEt0L0lSWjN1ZWN3RFZHc3p6TzdE?=
 =?utf-8?B?MTV3K20wY3pIOFVkUXo5Y3l5U29tcE95eG5SKzgxbGdRYi94Vm93TmpuanZS?=
 =?utf-8?B?UFM3WjMyLytiZDVmNXZJekdXbjNNa1hNcGNMVSt6M0gzaXJIMkVRNFhXTGZY?=
 =?utf-8?B?c2Iwb3Z1VDhaMW9QSytLWVRSRGJEZTg2dXJYcWdRdExxN1lYb1FweEV6VVBV?=
 =?utf-8?B?UCtIWnZBYk9pL1E3UkhiNkUvOXJWZjhWcURlVVl2TWVzMVQvK0hUdERDcW50?=
 =?utf-8?B?eHhyK2czTFRqdXlmZ1lTV3FyKzErWXlTZ24vaDgyeVBHcGJ3bm9WNmZXWWRD?=
 =?utf-8?B?V3ZMdkRjMWNSUVRyK0h1YndXODRYVXZEVXBhb3FDLysxN0Z0MjhteG1zOXFO?=
 =?utf-8?B?RmRNTkExaHN6NlFFa09GNHJMS2ZUVHY0QTl5TnlLeW94azMxR3lOdWozMmV5?=
 =?utf-8?B?UW5HUjVNbWowc2wvYnRraUVNZmREYnZmdkhVTHhuYTk5TWNZSFUrYjJoZFBF?=
 =?utf-8?B?TDRBeGZNQ3lMMkN0NkpNRTNpaTRQbkI0dTRTLzAxbFRVK0M4OE1LMnF2VDM1?=
 =?utf-8?B?Nk1lOXZvdEhlUTVjNE42OXpIZzZMUFowWWVRZEJRR2xlT2RUY1ltc09kMmZ6?=
 =?utf-8?B?V3V1d1Z4YWFjZXFKajhQZUh6cHpCMVcxNCs4OHFrN2RjR1I4MW5wUjJJMnIw?=
 =?utf-8?B?YnIvSzlJcGRKOFpVVDN1UlZNTVp1REpodDZvSXZsbnJpeTBKVVlaR3FIMnZu?=
 =?utf-8?B?Zmt5MGlRcWk4RzVSZEpzN0FjU0xQZGgzVXhITUNvdkp0U0FJdDFuemx3dFlS?=
 =?utf-8?B?ck1ySzM0WS9kVExQS2ptNDlGc0dQbzVLbncwWndCTU42ZmZRcHZxU0RNTWZZ?=
 =?utf-8?B?Slh2MzVWZXNUQWF4K3dablp3SnY2ZUVyckxnRWZob2syN000VGF5Rlo1RXox?=
 =?utf-8?B?Z2xSbGh6VWdPemdLTG81UW1PY0R1OFlxK2hxU0QxWkJBZC8vRG5GMWxtdi9t?=
 =?utf-8?B?NGZmL2xjZWxDd3dQNDdrRHJjQm5zSzNkYm5JNU9FRlRaTEZkRWVZcDBlUmt3?=
 =?utf-8?B?OW04MlFMbnk2aG83OEJma3RmZi8xdy85RThEL0pKYUdRTGNWSzFtVExYZVYr?=
 =?utf-8?B?S1g5K0czUVBEN0s2a3B6c2hYZUJPWXpENFpNZFkvT1IycCtLYytRVFhqVXli?=
 =?utf-8?B?cHhqRnFUMzVDNG1PQ3NzUU5zWktPemtWMXhRRTBacS83c3NQODFONE1Razl6?=
 =?utf-8?B?cDRJTDhDcGw4aVl3WW5JbG9Yb1V1TlE2WHpITW1mVEVSakNOZG9xM0ZpWnZq?=
 =?utf-8?Q?iMmx7IXvyBloe9RK4X8Xe8+6R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	c/vd74RUrL1YA4QQY4gvC66jAmzboadkaJmtITuTowmHuT4nVzSZIX9f751EmAttroUqU3ntT5o1OSpTMUs2EQqfg17pE8yVfUUfPCA3oOsZs8tMcyzLqQnm1OftkCV4Nmpx7ieEryiOoHrySagdRyo7dtZGoMjjiJf0H6lvGLIgwL/ZOh3/NIYhJKANEcMriHxlYYW//9SneGPjGQH0Wv9c//jGxueNsnUoRt4YpEeHDgbCeroCZ+HS2/4XedLn7M2ZRYu+BUFHUkvE0JVsO49Pf5zhGYnmpfKr3nOmYv8IFJtThgZYUAEj8wHnRbQuJZqnja4AD42fa2bxDH0ddJeeeTbqGQZa1OofuyvXE7PA4L9YkqZQFa5/pg2+JiTRg2HMgwItATBd0goDotCkpdF0d4101xRe90rwNXCyw6dsilpiIRVChfKjDaSxS5ocHjfzVje8FeLr6NLXGWdF0/Xb4vM6Z5El/Oz8NOgc0+mHXjwvzqH4R+3fRb00d/de4TGeVCj95JCQAWxwqn41XDFvmnlyKBBQJR5FYpi2U1SbTDSILc6mv8L7Zm+AMptuIigAH1GMVMqghONAJH5sOS/jsrM1ona2u4tt5Sc9Awg4Bp80tXaGygDFn1X4X63X
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60468597-1eba-4886-4f44-08ddd4cab37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 09:22:01.5788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xd2swIddsSHr5WRKguO4R7aHvlqa7UHOcVfHqJlXplPtMyeg4YZh2JIVGXntiWNwhfs4vsvcOqcrffCHvCbH5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10222
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221514

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4YW5kZXIgS2FuYXZpbiB2aWENCj4gbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA2LCAyMDI1IDU6
MDcgUE0NCj4gVG86IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RAZnVqaXRzdS5j
b20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvOV0gdnVsa2FuLWhlYWRlcnM6IHVwZ3JhZGUg
MS40LjMxMyAtPg0KPiAxLjQuMzIxDQo+IA0KPiBUaGUgcGF0Y2hlcyBhcmUgbnVtYmVyZWQgMSB0
byA5LCBidXQgSSBvbmx5IHNlZSBzaXggcGF0Y2hlcz8NCk1heWJlIHNvbWV0aGluZyB3YXMgd3Jv
bmcgd2l0aCBteSBjb21wYW55J3MgbWFpbCBzZXJ2ZXIuIA0KU29tZXRpbWVzIEl0IG1pc3NlZCBz
b21lIGVtYWlscy4NCj4gDQo+IEl0J3MgYWxzbyBwcmVmZXJyZWQgdG8gdXBkYXRlIHZ1bGthbiBp
dGVtcyBhcyBhIHNpbmdsZSBwYXRjaCB0byBwcmVzZXJ2ZQ0KPiBiaXNlY3RhYmlsaXR5Lg0KDQpQ
bGVhc2UgcmVmZXIgdG8gVjIgc2luZ2xlIHBhdGNoDQoNCj4gDQo+IEFsZXgNCj4gDQo+IE9uIFdl
ZCwgNiBBdWcgMjAyNSBhdCAxMDo1NiwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gPGxpdXlkLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4NCj4gd3JvdGU6DQo+ID4NCj4gPiBDaGFuZ2Vsb2c6DQo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tSGVhZGVycy9jb21wYXJlL3Z1bGthbi1zZGstDQo+
IDEuNC4NCj4gPiAzMTMuMC4uLnZ1bGthbi1zZGstMS40LjMyMS4wDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+
ICAuLi57dnVsa2FuLWhlYWRlcnNfMS40LjMxMy4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4z
MjEuMC5iYn0gfCAyDQo+ID4gKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pICByZW5hbWUNCj4gPiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3t2dWxrYW4taGVhZGVyc18xLjQuMzEzLjAuYmIgPT4NCj4gPiB2dWxrYW4taGVhZGVyc18xLjQu
MzIxLjAuYmJ9ICg5NSUpDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzEzLjAuYmINCj4gPiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjMyMS4wLmJiDQo+ID4gc2ltaWxh
cml0eSBpbmRleCA5NSUNCj4gPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMTMuMC5iYg0KPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMjEuMC5iYg0KPiA+IGluZGV4
IDExMzZlNDc5NWEuLmIzNDEzYjBlNmIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzEzLjAuYmINCj4gPiArKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi1oZWFkZXJzXzEuNC4zMjEuMC5iYg0KPiA+
IEBAIC0xMSw3ICsxMSw3IEBAIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCAmIE1JVCINCj4gPiAgTElD
X0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9MWJjMzU1ZDhjNDE5NmY3
NzRjOGI4N2VkMWE4ZGQ2MjUiDQo+ID4gIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJv
bm9zR3JvdXAvVnVsa2FuLQ0KPiBIZWFkZXJzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRw
cyINCj4gPg0KPiA+IC1TUkNSRVYgPSAiNDA5YzE2YmU1MDJlMzlmZTcwZGQ2ZmUyZDlhZDQ4NDJl
ZjJjOWE1MyINCj4gPiArU1JDUkVWID0gIjJjZDkwZjlkMjBkZjU3ZWFjMjE0YzE0OGYzYWVkODg1
MzcyZGRjZmUiDQo+ID4NCj4gPiAgaW5oZXJpdCBjbWFrZQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjQz
LjANCj4gPg0KPiA+DQo+ID4NCj4gPg0K

