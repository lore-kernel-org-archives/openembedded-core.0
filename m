Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C846EC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 01:05:00 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.4342.1714439089826648413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 18:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=eNf8/YJO;
 spf=neutral (domain: fujitsu.com, ip: 68.232.151.212, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1714439089; x=1745975089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0sGg1zUUItCJ+DUX8PfofPBW3oJqFCfQGnUolGSs3mk=;
  b=eNf8/YJO8yEagHY2zfFLW2MONQ5kVlE96TnJ7tnNdMZAupyGyl/hCuRs
   ggvWd84knfltrq/mXE7tDD+dBZ+znuJX5Z+XL+hnm9L3NcpU2WQ8iuAE9
   JC2Cto3HXvd0h74C0NgvIjpLdT14xC9MdI/yXuJmvkwZi57h8+DMnMXfF
   wQ4o+Ih5TKLE02pG2OuNDCTlgGA9eWd7pyGv4dLvj+wvgxwaxvR0UbJ6D
   t2QMNEWf4Md1sgKNLxncleIMFthm79TyXvkfd/IvddoumMei5pJnbyJyt
   2LbS2ar8iHMY4tYJ3MYCDSP+6dk46UtLsTkhsxhT2m3N2bS/8UWl1++St
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="29344574"
X-IronPort-AV: E=Sophos;i="6.07,241,1708354800"; 
   d="scan'208";a="29344574"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 10:04:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZRTOuqY+wLdGN1g2hl2rtAKL2ZGL1C5bFHKrcdIY6TIOvob4nWm8E17lJGtFOvJK085kLTsqAZ5fayhriZLIFr9nebtIkARV1bOxq7OIiBqwgJRg+LDLD2UsTwd40HJjCtdQXKtrQhdFNWBc/7Leoa0PEW4EpKoatNVGQ6uSUc1SDMk/jcKMLvVKH2YWON1Y/tVmmyHZSDeTkO/flCpjrCnyLSRnEZP9oJ+CWyTZXGTR4RpH/qThk+BnRL6MziMecHdOVDZN5k6IzBOBjvFeceZlLkY5sYMp08/KDJGI//2AcJLQG/HaDHSuV3TYOVBaIu5qr6fWeWZbfUIyNH58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sGg1zUUItCJ+DUX8PfofPBW3oJqFCfQGnUolGSs3mk=;
 b=AvMntRViMCNZkB5vhKLp/Yv/Dvxl3LxnGAsula+OGDrqRVYAkTWUub6/t8i/ZfvF2mjfXAAQpx66EhihQZ9/JQZMQtUIG7T2JJrUtaQX5ui+HUTqIOoXKdHQVShpSnqJZfv0rZhVj/SEE3jIp1CpsrnDNf7CCZ7mbXORdH0l2mohf7gasW/MgEfhZil9lj+q1ZQOAxlculbBdy4SJpXwBoNyW/IlwS1TvPLArLCQ/NVPR9nVHY5aGBmhoOz6pSiK0Rmxhepna4+mPseG29HgAW335O4AXgHjGvvAjKdke5yI7sNRxTML4YldhCsfrZ0+U1wLlBTKG+CN6SP6HN+IbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TY3PR01MB9932.jpnprd01.prod.outlook.com
 (2603:1096:400:22c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 01:04:43 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e%6]) with mapi id 15.20.7519.030; Tue, 30 Apr 2024
 01:04:43 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v3] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v3] libbsd: Fix conflict error when enable
 multilib.
Thread-Index: 
 AQHaltTG3T0Exw/BUUKnJbWAd+1sPbF4ocSAgAENpgCAAI1/AIACwaVQgAIYfwCAAO8qwA==
Date: Tue, 30 Apr 2024 01:04:43 +0000
Message-ID: 
 <TY3PR01MB1105688FD9EB1496A077F52FDA01A2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240425055231.668897-1-leimaohui@fujitsu.com>
 <CANNYZj8U5X==Up3C8QoQf_RzEV1-9Ewo8w0Q00HJ3B-uUYBc5w@mail.gmail.com>
 <TY3PR01MB11056396A609AFF1770D3F05EA0162@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CANNYZj-RMjrhBZxxmTNrCE+L38YmX1_bvtZnwnBkQLst1XBjkA@mail.gmail.com>
 <TY3PR01MB11056BE6139DB78A63C9871B2A0142@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CANNYZj9qz5cfwKjubtb4vobdZhVi1sFnTtfFAqGjA_VsFj+FrQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9qz5cfwKjubtb4vobdZhVi1sFnTtfFAqGjA_VsFj+FrQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NDY0YzIzYWMtNmJkNi00OTYyLWI0Y2UtZTY2MjNiODhh?=
 =?utf-8?B?NTY2O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDQtMzBUMDE6MDE6MzFaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TY3PR01MB9932:EE_
x-ms-office365-filtering-correlation-id: 963fccee-2490-46b3-9791-08dc68b18523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|376005|1800799015|1580799018|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?d2V0aGFvblpGdW5WeFNuMWN3eEsrQ01KQzlWUW9EdTFOMlJYc2g1MW9ub1hG?=
 =?utf-8?B?dm10R1U0dEJMTlpMcFVkb01MR0t0V3J2UjBqZElaWDN3dkplWmFoQWhkWkJQ?=
 =?utf-8?B?QnE1STllb3FFRys5UlFDVGphRjhBYm1CRWRTai9SVTJSZ1FJSW5wdnpzVEZk?=
 =?utf-8?B?NWtWYkVtK01lNjJMZmRvbkxpY3RJaXMzc1Iyd2hETER1bTFyaEx4TEN3enJO?=
 =?utf-8?B?RjlLRHB2VlBZYUcyWG1JcnNSTGEzamxJMnhDd2hxN1A2WTlBZXBxVUxBNHpj?=
 =?utf-8?B?Qzhsa2EveDZWREhJY1FkM0RvU2Vpdm5DQ2lCdXZ0dWhJRGl0N3hUVlRPNExp?=
 =?utf-8?B?L1VrSkMrZ0VoZ0hmcm9KQkVGQTZvQ3VZdFVhWXJtbEI5TVI3VkR6Ykt4T0RW?=
 =?utf-8?B?eTFrNnVlaWNCWEwySllqempGUXcxcHBaSE9GNWNuS2ZBaHBURU8xUFl0blFy?=
 =?utf-8?B?U0VqVW5vcDZiRGtRMWF3SWM1MnFtRWZVZTNvNE9rdFVzUVpvWlcxK3lZV3l5?=
 =?utf-8?B?WmU5TEdZRDllSDFieVlQVVZpelIrVkljbExHc1R3T2ljamVlVHV4Zm5iQnBt?=
 =?utf-8?B?eDZDN0svR2oxTU56bWFFK094cXQvbDMyV28zOFRLQ1FnL3hoZE14UmlCM2p2?=
 =?utf-8?B?RmpOMjlvaXYwdlhINUNEUTkwQzc2R2FscnR4Q0hSV2Q5YjhxME9YSW9ubWR3?=
 =?utf-8?B?Nno3MjRYVy9OMjJUWWUweEtXSjdieVU2YnlUdTR4V3diTjVPV2lNQVlZRlR2?=
 =?utf-8?B?UDJ2ck9ZZHZwYmVTUVdTNGRZSFZwYnZDZkN5eUNBZVFCbUV0eVdzV3NLSjhv?=
 =?utf-8?B?b0JzUXN1ZEl0KzI4RUFENko0dXJQK2I3TVpuc2MybEdVK2dtd0FDay9pemxR?=
 =?utf-8?B?UnVTbC9YeWhrcFA2d0svSUNleGltS2xkWnhSYWk3a0kxYUVvYmhodHIzWEVP?=
 =?utf-8?B?UURCU2swTWJxZWk2Z0hVR0NBUFhKTnBYSmpOaDhJa3lSbTk2NWg4aGlCTkdK?=
 =?utf-8?B?bERXem84QnJjd2xNVjBuU2J4d3FlVjFJeVdPeEltM0wralFzcXhxaHV4NU5v?=
 =?utf-8?B?MFc3WUZmSTJFV29ndGRtanpHRHZzWVo0OWRORVl4eWdYRWQrVWgrcGdHZG9I?=
 =?utf-8?B?ZnZMcUMrQnUxVDJWRXlLaE1EK3RIMDhIWlJmQmI0NXVFM1cyN2pab1h6cjl6?=
 =?utf-8?B?bk0wcnJVMWxXakNwZ0xsYXEzUlRBenZiQk1jNHUzTnlFdmhBaG5LcWNhVDFy?=
 =?utf-8?B?OWljRHIvOFI3R09Ta1RZZWdrMGJON0VIc1BiMlEzem5NSGJGYVBuRmJ3K29V?=
 =?utf-8?B?ckNsTXY2TTRlM0tMSWlWOE9DalozZmtaY0d2MmFxZFlwSDJrUXpUaDFhUWQv?=
 =?utf-8?B?elhmK09HN1BJZXU5bnoxSy9sL2lKSmFyNk5ab24reEZwdjdlcXRmVEVqT1pa?=
 =?utf-8?B?NlFRK0U4ODBBQ0dXbDFqem9rYTkvRVNrdndRNXAxa3dGQVpTaXoxaC9LNGlP?=
 =?utf-8?B?SW96bHFvK0RwV1lTdGFPTjdDUzREeDVrSlJLQlRtZ3d6dGwvZE5jTUtxako3?=
 =?utf-8?B?c01ONm4vS1ZtWlVabWFtVWhWVlh3bFl4amtvTWdKYWVzOUYvZWVETml2ZTNO?=
 =?utf-8?B?eDV0Z3FjY0ZORFl6L1IvdVZVRUwwOE1XKzdBcmlpbWFQOGZ0UnB1YmhESjZF?=
 =?utf-8?B?VFZPcjF3SWV0S25HV3IzZjNwTi9JUTNYZUNPcW5LeGNPOVROWk1YY25CdzAr?=
 =?utf-8?Q?z+KWx3fwcz6jGJeU8c08kAwmVSvaBZFgJR1tms4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RzdmbmxMV1ZPOVk2NjExaWpWNnFMczJjbkl1aU9scnNaQ3lxaVMxY0F1UnBt?=
 =?utf-8?B?UTZaaFN3SU1NWDR4bUlCaG4yK0RqRG9qZmNwZnRtNEVoVmtXN2F0R2h0T1FO?=
 =?utf-8?B?Ly8wU3FJbmMxaDhrWkMvOGdWSVNEcDM3cTQ4dnJ3Uzh2ZzQrSzdLMnpJQ0x4?=
 =?utf-8?B?T0NYWExFRTY2ZEFwRWNYNnZIT3lzRmo4T1JjMXZSeVJlS0FxbnBBemxZeHZG?=
 =?utf-8?B?TDE2VGo4Ryt4U1dnbDEyN1gwTmFjdlVmUXNHTkU2a2pDRlFaY3I3eEtqSHBS?=
 =?utf-8?B?ZFcwOUFiUWlWYVFRMDlaQm42MjRLM3d4WktqTmN0b2QvOWVkaGE2WmZISFB0?=
 =?utf-8?B?RUsyZEFyNmJ2bGxaSUFVa215a0J1dGw5bDVRTkQ3VXFOdis3cXJ5WWhsVnIz?=
 =?utf-8?B?b1FHNHpnM3pDelRwQXE5VHBRayswV0RCVkpNVHNRaGxOWEc3OTlnQXpCak0w?=
 =?utf-8?B?VWtqWFlyN2RwcFNkYU5ncXV3cWxrTEVyQmRMSENkMkFDMlNTSE4xbkZxRDRS?=
 =?utf-8?B?czhMN1pTUEFhSW8rVnhpTTYxc3ZEaGU0d1E4WXhRbFZBZHI1Ykc1bHdUNnB3?=
 =?utf-8?B?NTgzOHRjd1FtZk1jSXlpN0dBNXJabERMM09yUDErVXpieVo5YlFWaVNvV25Y?=
 =?utf-8?B?YlNyQnNGVjhUbUZiblhmSmJjL0F1dmRUbjNFZy8ySUV5RElvOEF1bmczeGZa?=
 =?utf-8?B?NktOTzZzTFF4NUowb2RVcWNtdGw1WGJWR1pycGVYQWI1SXFIOFVPWGRQL29j?=
 =?utf-8?B?WUdQYURrUGJHMkxvbUJjR252MytKQnhoSEl0SWVTblpRKzY1Z0JiZkFpYnkw?=
 =?utf-8?B?K0IzZlNuWXg3dFJPa0orUnh2bzQydVVFbmFDZldOM2NsMFZoTG04QUtiMmE4?=
 =?utf-8?B?d1YzbW12ZlBYZ0NSbmg3a21WUW11d0h2ZXQwZ1RMeHRvSE9DcEYyd091MkRq?=
 =?utf-8?B?dXJQbERRVjhpdjJ2b0RJdUhpcGtvMXA5a3RIdFEvKytzaFBOZUZ3WWFlOW1D?=
 =?utf-8?B?ZzFtYk5MbmliWmJVb1RVYitVS0hlME9NOXA4eE5iSEtvRUVTaFpqak5wdVN5?=
 =?utf-8?B?bzl1cm1KMzBaTC9uQXNRemp5b0xoZlpCeWVqL1I1ZUxMS3pBdzR0dDBKZ2Fn?=
 =?utf-8?B?WklSUWVFRVFWTlc1dHN4a3BDUDA1eTFkeGVZQjVsQ1VzM3EvZGFUMnl0Ri9O?=
 =?utf-8?B?eDRDYnhTTXQzWFB5NVFCUDFXdERoN2hjdW9HRk82M2ZENEFCaUQ5OE9KZklY?=
 =?utf-8?B?VFkxVEc5eWRieGlaT0ZWV2E2R1liR1JGTjFhU3lkbUFBTm5TYnBLM1IyMjhs?=
 =?utf-8?B?RTRLcFVEUGFaWkVoZVl0Zkl5MDNMcytHMTY3aXAzbURLU05lN2NoZ0NSWWFZ?=
 =?utf-8?B?ZHhPRDZVOWlhSlRpVndkeXMwVkdLN2J6NDNkbkVtWHRPZEEyaG9kNFE5dVNG?=
 =?utf-8?B?eWNzdUxzTVU5Q3U5VDR4U2NIdUFKOEZkbkdFYjRTU2E3OXF0TGFIVXN3REZv?=
 =?utf-8?B?S0RZQXhhZDVLV2ZjcDVMRWg2VUlabHFYS1BFMFFxY0ZiQUdDUzJtZDFqem4x?=
 =?utf-8?B?ajBLUFozbzNickp1emVRM3R3YTlFMTkvUWlMNWM3bDY0V09JYWZXYnVJY2cv?=
 =?utf-8?B?VTZZUUxUYjNUNWNWTWlqWWdvVlVJaHB0WG5tOE9weHVENWtOK0Jib1RGbks4?=
 =?utf-8?B?L1pjbzdUKzdnY0pJd2daN2tNNmlVL1dqN2EyVkZEdnhyZ0tsQmdxVTY2alht?=
 =?utf-8?B?VFozcElSdGwrSVdNVFgvL2hJcEJtYjlVQ292YjBDdDhNYzZRQk5PeTdPemE3?=
 =?utf-8?B?U2NuYmY4TThLOHZrMWxlU2Qyckx3anhDZXBIWWcxbkdNU1VTN01MRDB0a1Nl?=
 =?utf-8?B?aEdRMGE0NUE1UnJxalVqcWsrOWdQR2NaT1JPM0xMVnl1SDJCbXBlMEpJVG05?=
 =?utf-8?B?NVk0bHlwMnFCdk10Q09kVEFhQmVDaDh3Y2hTZ0Z5Si9iNU9SUjdQTHc4TUNR?=
 =?utf-8?B?b01ycVJiZjRUVUZ5ZGhQQlZEeHpwa3JOd1ZmUGdSNUZDL1FhVmZVeE92RnhD?=
 =?utf-8?B?ekdPeVZQTHEvZGd5cTh6VmVzTURJeGtVeUl4Z3hsT3JEUFd4Tk0xU3NlS3Zp?=
 =?utf-8?Q?rHAJx4c4qOfGuckxOhHPAx8S3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qOKeRa/cppe1dfzXCaYUcIgv8TDk7z+Rn9Otd8sVtbD/c9oYmwLL65EegQSgEMQ3Ynt829H2WxXoSW/UDA8QoCtx9eFCM+N2NzVRZwkPsx8Hq/yhBj7Ct4/bZ3uufOwf9GzylX65JJNSgTtExrT3WNBRvRFKodSwXe7GP9qpDpeSctvtvGnVNNJmMm/vJJUCHNCPTLDIiJ48+qUQLt40oLE/9HTpWi1UboGkQhJ36mh5xcTlc5Pu+wG4wSOnrlse6z+hP7T+npYq084JJRaC4d3tM1bwA490xor3T3ehvhhJFzB9FRtrxMFh9aF1wvc/9CHui1nK3bQ2mJsg5YVcb/nGkEL1rE5rvqeKn1GAFpEvXXaEDNNWdD1+otj2bccgWxVV4I7wDJdbHnstLkTZ6TKsTWKaJ71hxelLED1kSrEUjsP7uBS2s6IDpakMVADavFkTvUDUwXTfuu3wyLbuLV5M8BVLtMldHAOHT+86fscmWFqXEwt6b3AoQ3stlG325HaRED8LkybxRT4F912O1W9lqwbmhijU8ZN0x7+I1VWREkCAib5NM/kKM8hge2S3LW+zdWdnzY1LqfrvPNJuD9nfE91zCbaolRVSj1iv18G/tgXTheKx3/KNLMAo4SCJ
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963fccee-2490-46b3-9791-08dc68b18523
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 01:04:43.1408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8hYQdTN7eduGGV9F14KB/2fu/xJXUMkz5LM1+8dJ9G3ix4phXBHSrZofBSmGsCj1ibyaAsjxzaVcZN3a/r9Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 01:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198753

SGksIEFsZXgNCg0KDQo+IC0gdGhlIHBhdGNoIGlzIG9rOyBidXQgcGxlYXNlIGFkZCBhIG5vdGUg
KGEgY29tbWVudCBpbiB0aGUgcmVjaXBlIGp1c3QgYWJvdmUNCj4gc2VkKSB0aGF0IGl0IGhhc24n
dCBiZWVuIHRlc3RlZCB3aGVuIGxpYmJzZCBpcyB1c2VkIGluICduYW1lc3BhY2VkIGhlYWRlcnMn
DQo+IG1vZGUgYWNjb3JkaW5nIHRvDQo+IGh0dHBzOi8vbWFuLmFyY2hsaW51eC5vcmcvbWFuL2xp
YmJzZC43DQoNCk9LLCBJIHdpbGwgYWRkIHRoaXMgbm90ZSBpbnRvIHJlY2lwZSB0b28gYW5kIHNl
bmQgVjQgcGF0Y2guIA0KDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAyOSwgMjAyNCA2OjQ2IFBNDQo+IFRvOiBM
ZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENI
IHYzXSBsaWJic2Q6IEZpeCBjb25mbGljdCBlcnJvciB3aGVuIGVuYWJsZQ0KPiBtdWx0aWxpYi4N
Cj4gDQo+IE9uIFN1biwgMjggQXByIDIwMjQgYXQgMDU6MTcsIE1hb2h1aSBMZWkgKEZ1aml0c3Up
IDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IHdyb3RlOg0KPiA+IEknIHNvcnJ5LiBCdXQgbXkg
Zmlyc3QgVjEgdmVyc2lvbiBwYXRjaCB3aXRob3V0IHNlZCAoanVzdCBvZV9tdWx0aWxpYiBwYXJ0
cykNCj4gZGlkIG5vdCBwYXNzIEtoZW0gUmFqJ3MgY29tcGlsZSB0ZXN0IChiaXRiYWtlIG1nDQo+
IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNzU5NDczLyku
IEknbSBub3Qgc3VyZSBpZiBpdCBpcw0KPiB0aGUgcHJvYmxlbSB5b3Ugd2FudCB0byBrbm93Lg0K
PiA+IFNvLCBJIHJlcHJvZHVjZSB0aGUgYnVpbGQgZXJyb3IgYW5kIGZvdW5kIHRoYXQgdGhlIGNk
ZWZzLmggdGhhdCBjcmVhdGVkIGJ5DQo+IG11bHRpbGliX2hlYWRlciBoYXMgdGhlIHBhdGggIiNp
bmNsdWRlIDxic2Qvc3lzL2NkZWZzLTMyLmg+Ii4NCj4gPiBCdXQgbWcgZmluZCBoZXJkZXIgZmls
ZXMgd2l0aG91dCBuYW1lc3BhY2VkIHdpdGggYnNkLy4gU28sIGl0IGZhaWxlZC4NCj4gU2hhZG93
IGhhcyB0aGUgc2FtZSBidWlsZCBpc3N1ZS4NCj4gPiBTbywgSSBzdWJtaXR0ZWQgVjIgcGF0Y2gg
d2l0aCBzZWQuDQo+IA0KPiBSaWdodCwgdGhpcyBpcyB0aGUgZXJyb3I6DQo+IA0KPiB8IEluIGZp
bGUgaW5jbHVkZWQgZnJvbQ0KPiAvc3J2L3N0b3JhZ2UvYWxleC95b2N0by9idWlsZC1tdWx0aWxp
Yi90bXAvd29yay94ODZfNjQtcG9reW1sbGliNjQtbGludXgvDQo+IGxpYjY0LW1nLzIwMjMwNTAx
L2xpYjY0LXJlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2JzZC9zeXMvY2RlZnMuaDoyNywNCj4g
fCAgICAgICAgICAgICAgICAgIGZyb20NCj4gL3Nydi9zdG9yYWdlL2FsZXgveW9jdG8vYnVpbGQt
bXVsdGlsaWIvdG1wL3dvcmsveDg2XzY0LXBva3ltbGxpYjY0LWxpbnV4Lw0KPiBsaWI2NC1tZy8y
MDIzMDUwMS9saWI2NC1yZWNpcGUtc3lzcm9vdC91c3IvaW5jbHVkZS9ic2Qvc3lzL3F1ZXVlLmg6
MzksDQo+IHwgICAgICAgICAgICAgICAgICBmcm9tIHJlZ2lvbi5jOjEyOg0KPiB8DQo+IC9zcnYv
c3RvcmFnZS9hbGV4L3lvY3RvL2J1aWxkLW11bHRpbGliL3RtcC93b3JrL3g4Nl82NC1wb2t5bWxs
aWI2NC1saW51eC8NCj4gbGliNjQtbWcvMjAyMzA1MDEvbGliNjQtcmVjaXBlLXN5c3Jvb3QvdXNy
L2luY2x1ZGUvYnNkL3N5cy9jZGVmcy02NC5oOjQ5Og0KPiAyNDoNCj4gZXJyb3I6IG5vIGluY2x1
ZGUgcGF0aCBpbiB3aGljaCB0byBzZWFyY2ggZm9yIHN5cy9jZGVmcy5oDQo+IHwgICAgNDkgfCAj
aWYgX19oYXNfaW5jbHVkZV9uZXh0KDxzeXMvY2RlZnMuaD4pDQo+IHwgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn4NCj4gDQo+IEknbSB1dHRlcmx5IGNvbmZ1c2Vk
IGJ5IHRoYXQuIFdoeSBjYW4ndCB0aGUgY29tcGlsZXIgZmluZA0KPiB1c3IvaW5jbHVkZS9zeXMv
Y2RlZnMuaD8NCj4gV2h5IGlzIGl0IHRoZW4gaGFwcGlseSBmaW5kaW5nIGl0IHdoZW4gYnNkLyBw
cmVmaXggaXMgZHJvcHBlZCBmcm9tDQo+IGNkZWZzLTY0IGluY2x1ZGUgc3RhdGVtZW50IGluIHVz
ci9pbmNsdWRlL2JzZC9zeXMvY2RlZnMuaCA/DQo+IA0KPiBCdXQgdGhlIGZpeCBkb2VzIHNlZW0g
dG8gaGVscCwgYW5kIG1ha2VzIG11bHRpbGliIHNlbGVjdGlvbiBoZWFkZXIgbWF0Y2gNCj4gbGli
YnNkIGhlYWRlcnMgKGluIG92ZXJsYXkgbW9kZSkuDQo+IA0KPiBTbzoNCj4gLSB0aGUgcGF0Y2gg
aXMgb2s7IGJ1dCBwbGVhc2UgYWRkIGEgbm90ZSAoYSBjb21tZW50IGluIHRoZSByZWNpcGUganVz
dCBhYm92ZQ0KPiBzZWQpIHRoYXQgaXQgaGFzbid0IGJlZW4gdGVzdGVkIHdoZW4gbGliYnNkIGlz
IHVzZWQgaW4gJ25hbWVzcGFjZWQgaGVhZGVycycNCj4gbW9kZSBhY2NvcmRpbmcgdG8NCj4gaHR0
cHM6Ly9tYW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjcNCj4gDQo+IEFsZXgNCg==

