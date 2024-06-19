Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66CBC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 08:34:21 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web10.16179.1718786052978666761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 01:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=RSZW+PmP;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1718786052; x=1750322052;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=MPKfDyqQqlDR77ma/VqpOGBHK3lrkWMq+y352PWrues=;
  b=RSZW+PmP23Pdx5T5XzgdM/4DIPKBboiGOCGn2F43qFSaDExMK6QmOUVI
   245Rb8EAZol3TgaONSGX+SZthuwMmIMfldb9fdfDjgO38qos4wc5zNmSk
   dtQRzHvc9Y7UwTeaKdqIzGMRTXxRamJGA27bolxXlQ10rxUPKVzb7JLxV
   0UBq8dzqGtZyYc66FFONUsleBF39aNAWUvXVgKQW/WGPaKXfQhloz0vWm
   rJZ3Rm6QOY6mgUiptqfip+rJTja4GZvSYOsJG5XvzouEXdXPrQ/GYa7qn
   H7ZKQVwj1r+hfFR2utdMD38lQ3sg17hhu3I3bOyhXiwfGhx44ub4CxYTM
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33954946"
X-IronPort-AV: E=Sophos;i="6.08,249,1712588400"; 
   d="scan'208";a="33954946"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 17:34:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLLfX2JWwxYapEy28XwAeUcpNOwCFbCaxEoNDTeyx8rk5CWDFkD4XfXctoVY/G53/j1fMYDzxtqcKTpf+/cEw4IU8w1aJef9mndgKxCmPikuT7N8FHCz26Dg0FU3iqrOasRt2JabpQJ2cjzfOJO5BJ6MLZ/gQwinI1S/XScg2Da2ElVrqp6+3UIQTt/Ova3DxW3j3s5nC6hswrsUPEmW68es3hZfL3a8zSqwD3hEUD8F8BANlBCEMEXlNo4h1y+GZpcVHzUbH+yEMqDXjTp4d0OFLyU3Ce/sP0A24hUKpfbH4331WyoogwZQtqLHB4hmyKyreuqMsEo2PZRLMDCA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPKfDyqQqlDR77ma/VqpOGBHK3lrkWMq+y352PWrues=;
 b=eMqCvKNIYKN5aoxY6RZLg3hn0eeMS7IGJU5CXAYI5kDuQfw4n+cDknDtwQJkRYWk9aDRJcODqnKD0sDnn/LY/wGxTzJF6NamkPVw2JQXAR/gL4t1pc0bqgS4NlCi6/uOow2/IjqehN+/L+w1dTRlyYTNxCL2vAVzNksZCa4FNF81KQZj1F8ntk20sROMAdNirFyO/hp3HkL5foiIdsATfwjijIOj6u8PMbtmsS/CJKB2iN5rlLaFUk8+C66IPw1LfiuKfQDVsAP7jXzU5OsiPGwrT6se+1F9HTY41wPqiAo65jA5q3H1nml8LTwHClS9SKLHPMYQjOf/zs1k2BU69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYWPR01MB11324.jpnprd01.prod.outlook.com
 (2603:1096:400:3f2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 08:34:02 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7677.029; Wed, 19 Jun 2024
 08:34:02 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
 enable multilib.
Thread-Index: AQHamtgyUw84X7Yq90eRZtMNpmOVjLHCjGIAgAyCXVA=
Date: Wed, 19 Jun 2024 08:34:02 +0000
Message-ID: 
 <TY3PR01MB110569862C0F28F18C7520766A0CF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240430082706.51856-1-leimaohui@fujitsu.com>
 <55dfaabcdf802dc7fc114346f445e1b587cbf468.camel@linuxfoundation.org>
In-Reply-To: 
 <55dfaabcdf802dc7fc114346f445e1b587cbf468.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ODA5ZjliN2YtM2NlNy00Y2YxLTkzYjUtMjcwZGQwNDRh?=
 =?utf-8?B?MmJhO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDYtMTlUMDg6MjU6MThaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYWPR01MB11324:EE_
x-ms-office365-filtering-correlation-id: 6e11b7a9-8ae5-4f0c-59a1-08dc903a92bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|376011|366013|1800799021|38070700015|1580799024;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cEtaN2kvY0hKOVlZRnQvQmNyRmoreHQ3OTJ2UHlvMmxqaFMwLzhWcDk1Y0x6?=
 =?utf-8?B?YXJEYzZzdzhRZHVHS1pMUkNjRjhEK2djTUlqS3B6dTVNWXdJSGdLMVZYWWtS?=
 =?utf-8?B?RGFKajJFeERWQ2pEVzBwbk8zNnF3Nk1vZ0pMcnNyTFVseXBwRzdiNjFtZ1hP?=
 =?utf-8?B?cnlwaXJwVm5GaWw1R2dlZWhOY3lTZ3ZDU2xrRTlrM0ZyTmw2cnNTbGppWGtR?=
 =?utf-8?B?M2JSOUxyTUdPV1ovYlB2Y1pSN1FMVm1rV2ZET0l0ekhqYXVZVXRSTW4xMStz?=
 =?utf-8?B?anByRDVwTk1EVVB2M056SmYyZkV2L3FKSjVDZnFVT1pKemFDcGJGdTZ1OFpn?=
 =?utf-8?B?NjAwdVk5UnBCL0dHcklucytOemNvbHNUMUpOM2JjQXBraldTZWRDV3ZOWFky?=
 =?utf-8?B?MTlrQkwzbVBNbVIvZTRXQjE4YXQyWWpQMEJiWFhJcTROa2ZoTjMveVpKS29Q?=
 =?utf-8?B?RWtGVm1kRVF5SlJUbXhrSEF0YXZSV2YySVJFNGQzQzhPdm1WQ1VWNFlzcmI2?=
 =?utf-8?B?YTQrSGFHZEdYWmJnbUxGNURZdkM5SjYwcmpOL0JoVE1LWG02L3dvSTRLVWov?=
 =?utf-8?B?dXJnaVNXWG1CNldiVVRoOStxenRaWisySmtLQzVXMm1CTmF5QVhTUm1ILzZ4?=
 =?utf-8?B?cm55aG9kQ09uU1dlN3lLOUxPcU1mK0tJVWlBd1FyUVRaeUVXYXo5U0V3bWNx?=
 =?utf-8?B?aHJ2N1ZRcVovTmw0ZHgvVUFhWVp1anJYZVJLQXJjbTg0QWQ4L0xxZExGYjdS?=
 =?utf-8?B?dkRrbEMxODkyVVdUdnFucHJ4TDBMZFBFSXdJaGZ3a2NhcDBBczZaTGxERVVl?=
 =?utf-8?B?U24xUHVRbzlnbjRTSmJRL3B1L2ZuUEJidmJxaWJXYmM2ai9nREt6QkpkbFhC?=
 =?utf-8?B?RXJXNUc1OUQ5STRQcno5RWdpTmNYeEJRdHkzZzl3cEhyMzFOZ0VvS1FNenZx?=
 =?utf-8?B?VGdJSEdFYWc4VTZzUXVZbDZEc2llYlhiMlRJUXJaZC8wTHRyK0lNMzhWM2xr?=
 =?utf-8?B?c082NENRMXhjbEEyMzhkRnhoZlV0a0VTZWpuaEYxRmhBVnNwK0RRRTlUaDFz?=
 =?utf-8?B?RGpqWUZqT3dCLzQzcjRKamNTNi9xMi80NWh1THRyRDlKNkVmUWc4RUszclVn?=
 =?utf-8?B?WFBpaUZxZDAzTVBER2x2ZVhTYkJ1QVZMQy9JeFFQai9KcXhMN2xGWGIzR2hK?=
 =?utf-8?B?SnEvVXVKNmNpT3hLdGFuejlXNVhXNHhldEwzL3lpKzd1SGRpRlZBRGpOVDNC?=
 =?utf-8?B?NUZqb3JpQXRtLzMwN2ZFUEhWMG5jZTdkYTF5b1NRSWdMV0FiME56ZHd4TkR1?=
 =?utf-8?B?Nk83ZVJQdHhqaEJsbFVFMzZiY1BGWXNwaXU4VmJxVGJnRVhIenVPWlhyQ0ZO?=
 =?utf-8?B?Mk1nalhIL1E3d3NSSjR4ZDdka094aTdsMmQreW1GU1J5MDhSZWxlRzVHcjV2?=
 =?utf-8?B?ZUk0aW8wVU04UVB3aXBxMFh5Zyt0T0NPVDlMc2lkaXZEZ2VXcVJ6Zk1EQkFv?=
 =?utf-8?B?aUFuQ3MrZXJpWDJ4MFFNeCtkeXRoczhNZGFRWXhZVCtMelNwazN2QS9kZS9s?=
 =?utf-8?B?bTdVQTBuNlV1NDdVVXZ6ck1nUVAvQkl2ZzVQUU9tbGFMT0JKNHM0UnJ2OWRL?=
 =?utf-8?B?Nm5NOHpDdXgyQzhjTXpGcTN1SzhZTWdwbFMwaG81NnpuV2RVRGtzdEhNK1Fv?=
 =?utf-8?B?QWgzSEtGSWdxM3NIK3g1YjZVSWFJM284Q3owRDUrempONU5pR0pkWFhkOVQz?=
 =?utf-8?B?NUZXSDhseHp4VmlMd0ViU05nWmpab0puSW9GaytNazdnRWVyYnZpbE9TME1K?=
 =?utf-8?B?c252cFprS0JkM0FmVXhWdz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(38070700015)(1580799024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dno3dFFiYWR1YWQxeTlOTkU4VkwwV2dvb29XbWIrMTZ1WG9FN25TTmZZTVB5?=
 =?utf-8?B?UHlJUzVDMkd3OXNRcHo1bjJnK2VDd1R0L2FPQk44SDJ1UU01cUpHRGtjTEp3?=
 =?utf-8?B?QzduNkQvUkxjK2R5RzBBTGNFdjRkRmgrZ0NjTWMzaVA0ajZFOHFJcDFrQkJh?=
 =?utf-8?B?b2l0ME81bkhsWkp0K29PRkNJZy95MEM0bW9Ca04vOThvZ1lJb1U2Szh2ZnNy?=
 =?utf-8?B?dG9kVnlrTXQxME03V29SM0d0dUd2L3plMm5BcXpOQUh3MVpjc0hpNklLVXF1?=
 =?utf-8?B?L3R2NU53T2VHZU5zS0ZOWTZZT05WUWVPeDlWNFdpYUQzcUpsdVNFTmd1cGFt?=
 =?utf-8?B?RUZidHZ6WHlJRi9xM3NlNkZiamtOTEEzSG9nYmJyVkRxYTVKMjRYSXJSZmV5?=
 =?utf-8?B?b21SRFAvUExLbzh4Y21MZzd3T0RteWNKNm52Z0tLekxaSWR1dDRjU2hvQXR4?=
 =?utf-8?B?Z1ZNaXBrcSt1NEdXVVoyalJ4YVRzVTd4b3Q5MU5IM0IwQ2xibXo5UlhvNEk5?=
 =?utf-8?B?c0JST0k3ZndpSTY1Vk85azIrMGNvSHJHejgxcDc4WDNHT3FsYzkzZnNCeXpr?=
 =?utf-8?B?VmZ3RHFUSjkvelhIUnlGaUVQai9lZnBOditXRkpWUFpzU2VwUkNhaGtGdEY5?=
 =?utf-8?B?VFZPYjE3ZWlTQTVXOFNlL0EzcFdRUXp6dmxxcjBBZ3J2Z05xOUZaamVtVUlO?=
 =?utf-8?B?dWQvVTlGRnZ4cVF0RWhQMDNIL2QzZTM0dXBCUmJDcFNqeEVJMEVUSzhhdUto?=
 =?utf-8?B?RTh6Z3ppb3dqWk9LNExsaUpjK3A3d1poWkJNZmNNK1oxR1JScTFiaFMzcVc3?=
 =?utf-8?B?YVVoSW8rVlFnSk51KzJUOVZLSG9DR3dsOWlQSXN3Z0g2aUlONmlMc2lpRkR2?=
 =?utf-8?B?dzRhWUdrV00ySUE5bjVVOWk5c1B6NXZPNlJiYldVR0hsT2lYNlZ0dXdreFVt?=
 =?utf-8?B?ckcwSXN4amhMMGZTT1FHb3BhYVd3Wm5UZ2U5R2Q5WTA0ODBmdmgzZDkycHd3?=
 =?utf-8?B?NkY3eHppVHUvTmYzdmFkOWhtQnptTERvR3J2WTkxNW1VWlE0Z1prTTVhbFlh?=
 =?utf-8?B?UklobWpDajlQWERIdzFmUU5CSWF5WVR1QjM3Z1FBQzhWeTVZVWZkMUhkUUhZ?=
 =?utf-8?B?dUlhdlZiTWlvemNvRkF4cndEaVZiUlFrdEFhNlh6SXU1aFpmK00rTm9YcnZR?=
 =?utf-8?B?MHlxUmEwNTQvVHcrT3JPbkxHaGdtM3BjWXZoVXU5UnBCOHpYaHlSSWNNVjE1?=
 =?utf-8?B?TTdvdUJRUGx0Q1BSMFo0N3E2RVVJNXVVTzZ5RElGancrQkhpaS9XQU93RTFa?=
 =?utf-8?B?Y1R5MnNzWW0wT1hHMUZSdk9ZcVNlYWg5UkVia2ZoWHZxNnNIWmZBdGIyVXJT?=
 =?utf-8?B?Z2x6bWdwK0c0eCtCTnJmRkFwTmJ3eEYwWFpaWUJXQjF2elBsMUVGUlBNTitv?=
 =?utf-8?B?bVkrUDhsYy9PaThHSzF6QzhPZUdhSGpGakQ2cnRpa0xGV1p1ZWZ5ZEJ4Yk9Z?=
 =?utf-8?B?Nk1RbStOK1g0eXY5S3dQYWcwcjlsU04zbGJzcEJqeDNnSkoyVzhndUlCc2ly?=
 =?utf-8?B?RXl2SzBXUktBK0FxVXBmd1k5c2dEQThwamRUUjVKK0ZtQi93TnJRQi9SVVlC?=
 =?utf-8?B?cWpoaWV6d0xoQnpBRG9rdnllRGMwUDdKSEVsQng3YUF4aU5FUlR5b3F3bUlm?=
 =?utf-8?B?ZWRkekVCWjhkdjRFTGxQd2NmcW9uSjQ2elRHeWJEcDgwR0ZqNkZycG13eXIx?=
 =?utf-8?B?VjlXSGY5Ymx6b2VxMDRzbzV2YnM3SEtWSzMyU0xwM1Z1MUpZN1lHcHJTZ2pJ?=
 =?utf-8?B?UHg4aFVPTmJBVzhHc0xFWE5VUjk2ZkcybE84ZG1jakhraEhCV04wNDVzT2VF?=
 =?utf-8?B?YUVzS1I5aHIyMVBxOHdoQi9Ya2tNN1NzYmsvZG16MUhwOU5PdmFxOTRueENF?=
 =?utf-8?B?VXlZWVpHYURIdC9WTzJpV1F4R1Q4Wm1La0RwWWphZFBER0ZJZEUxeHMxR3Z0?=
 =?utf-8?B?VXRMbmgrT1VESVpJa3d3blYwanlJWnRrSTVOQjlKMEJ4ZUZKZmRZV3dxMWJ1?=
 =?utf-8?B?N2dqTUJUVEdRaWJjdGpZRlAxRURCVFNicVZEMmUwWFNWRUkvUk01TVRlOVNP?=
 =?utf-8?Q?3PUaWhfDb9fK8aYR7hteWnlSz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6DL9lr1nWDfwARKtf7Y2KWgNDyoS8mdFoAlmo/43es+/B5r4kl5zlghBhsFs73LRvgvZhdxoZM4dqR5Ncye1ka6CKwk3ef1JAVnXDy+dfhRsiJZ7oI8LQJeQORsH3Ry+3NmV7Qw4HnnrKrZ6r7MO7cie5FOLaDbMqx+LlV23FMpeOMdwFHn3+J+KOCnukCMkINgmsuzFWGpL8WUvG11JamXlnQTmvi28N95hvW9hoWbmr5NirzFr2rTZXf9TRvhw0qbnjDgzkIAsWoJg3MgpSgGxgg/l2mgMtgbbTV/P8uSAqD9DcdmEIencJZK0B4xJH+Fc1cyYAKRjxYzyeOtgDn+kZsToPJRQiX4Lql0yQf1NqikxNPKkidOCwZPzDPH8zpWvqCLdLzG9UVl4PB5H2/SvB/PaW6gIW6a1VFM7/nJYvbeQa1BQsFku13zgUXD84ebonbGLDGjjpk1Wa+6VrzFqh77a+IVf636QhLQBychcq4AIgz6QVzP9TajoPrtZZbOT7w9qJ8YgWbPygUaWsfn8EqJTgARTbK5KZGKy3jNeBTENe4A5V9XgOCy4+fW5yPNcJvdvkehHX9CQW66tKSjwTTrW8dVNgG+g1c6/EYPbUyXVDPjzm30Xmsa/VrjQ
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e11b7a9-8ae5-4f0c-59a1-08dc903a92bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 08:34:02.3943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2NTl7J3H0E7WGNrBIpq2IQB6N6Xuvuqvp/EHCrhYOK6e6uHi0UBsrZycSCaZxVOA7eadINKTu1f+IqUx7K+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11324
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200886

SGksIA0KDQpJdCByZWFsbHkgdG9vayBzbyBsb25nIHRpbWUgdG8gdGVzdCB0aGlzIHBhdGNoLiBe
Xg0KSXQgc2VlbXMgdGhhdCBubyBtYXR0ZXIgaG93IHRvIGNoYW5nZSB0aGUgaGVhZGVyIGZpbGUs
IHRoZXJlIGFyZSBhbHdheXMgZGlmZmVyZW50IGZhaWx1cmVzLg0KSSdsbCB0cnkgdG8gYXNrIHRo
aXMgaXNzdWUgaW4gdXBzdHJlYW0gb2YgbGliYnNkLiBUaGFuayB5b3UgdmVyeSBtdWNoLiANCg0K
QmVzdCByZWdhcmRzDQpMZWkNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTEsIDIwMjQgNToyNCBQTQ0KPiBUbzogTGVpLCBNYW9o
dWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2NF1bUEFUQ0hd
IGxpYmJzZDogRml4IGNvbmZsaWN0IGVycm9yIHdoZW4NCj4gZW5hYmxlIG11bHRpbGliLg0KPiAN
Cj4gT24gVHVlLCAyMDI0LTA0LTMwIGF0IDE2OjI3ICswODAwLCBsZWltYW9odWkgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4gRnJvbTogTGVpIE1hb2h1aSA8bGVpbWFv
aHVpQGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gLSBGaXggdGhlIGNvbmZsaWN0IGVycm9yIGJ5IG9l
X211bHRpbGliX2hlYWRlci4gVGhlIGNvbmZsaWN0IGVycm9yIGlzIGFzIHRoZQ0KPiBmb2xsb3dp
bmc6DQo+ID4gRXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6DQo+ID4gwqAgZmlsZSAvdXNy
L2luY2x1ZGUvYnNkL3N5cy9jZGVmcy5oIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZA0KPiA+
IGluc3RhbGxzIG9mIGxpYmJzZC1kZXYtMC4xMi4xLXIwLmNvcmUyXzY0IGFuZA0KPiA+IGxpYjMy
LWxpYmJzZC1kZXYtMC4xMi4xLXIwLmNvcmUyXzMyDQo+ID4NCj4gPiBUaGUgZGlmZmVyZW5jZSBv
ZiBic2Qvc3lzL2NkZWZzLmggYmV0d2VlbiBsaWJic2QtZGV2IGFuZCBsaWIzMi1saWJic2QtZGV2
DQo+IGlzIGFzIGZvbGxvd2luZzoNCj4gPg0KPiA+IMKgLyogRGVmaW5lIHRoZSBBQkkgZm9yIHRo
ZSBjdXJyZW50IHN5c3RlbS4gKi8NCj4gPiDCoC0jZGVmaW5lIExJQkJTRF9TWVNfVElNRV9CSVRT
IDY0DQo+ID4gwqArI2RlZmluZSBMSUJCU0RfU1lTX1RJTUVfQklUUyAzMg0KPiA+IMKgI2RlZmlu
ZSBMSUJCU0RfU1lTX0hBU19USU1FNjQgMQ0KPiA+DQo+ID4gLSBBZnRlciBvZV9tdWx0aWxpYl9o
ZWFkZXIgb24gY2RlZnMuaCwgdGhlIHBhdGggb2YgY2RlZnMtNjQuaCBhbmQgY2RlZnMtMzIuaA0K
PiBpbiBjZGVmcy5oIG5lZWQgdG8gYmUgY29ycmVjdGVkIGZvciBvdmVybGF5LW1vZGUuIFBsZWFz
ZSByZWZlcmVuY2UgdG8NCj4gaHR0cHM6Ly9tYW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjfC
oGZvciBkZXRhaWxzLg0KPiA+IMKgIEBAIC0xMiwxOSArMTIsMTkgQEANCj4gPiDCoCNpZmRlZiBf
TUlQU19TSU0NCj4gPg0KPiA+IMKgI2lmIF9NSVBTX1NJTSA9PSBfQUJJTzMyDQo+ID4gLSNpbmNs
dWRlIDxic2Qvc3lzL2NkZWZzLTMyLmg+DQo+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtMzIuaD4N
Cj4gPiDCoCNlbGlmIF9NSVBTX1NJTSA9PSBfQUJJTjMyDQo+ID4gLSNpbmNsdWRlIDxic2Qvc3lz
L2NkZWZzLW4zMi5oPg0KPiA+ICsjaW5jbHVkZSA8c3lzL2NkZWZzLW4zMi5oPg0KPiA+IMKgI2Vs
c2UNCj4gPiDCoCNlcnJvciAiVW5rbm93biBfTUlQU19TSU0iDQo+ID4gwqAjZW5kaWYNCj4gPg0K
PiA+IMKgI2Vsc2UgLyogX01JUFNfU0lNIGlzIG5vdCBkZWZpbmVkICovDQo+ID4gLSNpbmNsdWRl
IDxic2Qvc3lzL2NkZWZzLTMyLmg+DQo+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtMzIuaD4NCj4g
PiDCoCNlbmRpZg0KPiA+DQo+ID4gwqAjZWxpZiBfX1dPUkRTSVpFID09IDY0DQo+ID4gLSNpbmNs
dWRlIDxic2Qvc3lzL2NkZWZzLTY0Lmg+DQo+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtNjQuaD4N
Cj4gPiDCoCNlbHNlDQo+ID4gwqAjZXJyb3IgIlVua25vd24gX19XT1JEU0laRSBkZXRlY3RlZCIN
Cj4gPiDCoCNlbmRpZiAvKiBtYXRjaGVzICNpZiBfX1dPUkRTSVpFID09IDMyICovDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+ID4g
LS0tDQo+ID4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMi5iYiB8
IDEwICsrKysrKysrKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNk
L2xpYmJzZF8wLjEyLjIuYmINCj4gPiBpbmRleCA3ZDVlODhmMjkzLi4xNzkxZDk3ZGZkIDEwMDY0
NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4yLmJi
DQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliYnNkL2xpYmJzZF8wLjEyLjIuYmIN
Cj4gPiBAQCAtNDAsOCArNDAsMTYgQEAgU1JDX1VSSSA9DQo+ICJodHRwczovL2xpYmJzZC5mcmVl
ZGVza3RvcC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiINCj4gPg0KPiA+IMKgU1JD
X1VSSVtzaGEyNTZzdW1dID0NCj4gImI4OGNjOTE2M2QwYzY1MmFhZjM5YTk5OTkxZDk3NGRkYmEx
YzNhOTcxMWRiOGYxYjU4MzhhZjJhMTQ3MzEwDQo+IDE0Ig0KPiA+DQo+ID4gLWluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZw0KPiA+ICtpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgbXVsdGls
aWJfaGVhZGVyDQo+ID4NCj4gPiDCoERFUEVORFMgKz0gImxpYm1kIg0KPiA+DQo+ID4gK2RvX2lu
c3RhbGw6YXBwZW5kICgpIHsNCj4gPiArwqDCoCBvZV9tdWx0aWxpYl9oZWFkZXIgYnNkL3N5cy9j
ZGVmcy5oDQo+ID4gK8KgwqAgIyBJdCBoYXNuJ3QgYmVlbiB0ZXN0ZWQgd2hlbiBsaWJic2QgaXMg
dXNlZCBpbiAnbmFtZXNwYWNlZA0KPiA+ICtoZWFkZXJzJyBtb2RlIGFjY29yZGluZyB0bw0KPiA+
ICvCoMKgICMgaHR0cHM6Ly9tYW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjcuDQo+ID4gK8Kg
wqAgc2VkIC1pICdzOiNpbmNsdWRlIDxic2Qvc3lzL2NkZWZzOiNpbmNsdWRlIDxzeXMvY2RlZnM6
ZycNCj4gPiArJHtEfSR7aW5jbHVkZWRpcn0vYnNkL3N5cy9jZGVmcy5oIH0NCj4gPiArDQo+ID4g
Kw0KPiA+IMKgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiANCj4gRmlyc3Rs
eSwgSSBrbm93IHNldmVyYWwgb2YgdXMgYXJlIG5vdCBjb252aW5jZWQgdGhpcyBpcyB0aGUgcmln
aHQgdGhpbmcgdG8gZG8uDQo+IFdlJ3ZlIG5vdCBiZWVuIGFibGUgdG8gZWFzaWx5IGRlc2NyaWJl
IHdoeSB3ZSdyZSB1bmVhc3kgYWJvdXQgaXQuIFdlIGRpZCBkbw0KPiBzb21lIHdpZGVyIHRlc3Rp
bmcgd2l0aCB0aGlzIHBhdGNoIGFuZCBpdCBjYXVzZXMgc2V2ZXJhbCBlcnJvcnMgaW4NCj4gbWV0
YS1vcGVuZW1iZWRlZWQ6DQo+IA0KPiBodHRwczovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vy
cm9ycy9CdWlsZC8xODY1NjcvDQo+IA0KPiBzbyB3ZSBjYW4ndCBtZXJnZSBzb21ldGhpbmcgd2l0
aCB0aGlzIGFwcHJvYWNoLg0KPiANCj4gV2UgcmVhbGx5IGRvIG5lZWQgdG8gc3RpY2sgd2l0aCB0
aGUgd2F5IHVwc3RyZWFtIHVzZSB0aGVpciBjb2RlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmlj
aGFyZA0KPiANCg0K

