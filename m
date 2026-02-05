Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A00EA7959
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 02:59:27 +0000 (UTC)
Received: from TY3P286CU002.outbound.protection.outlook.com (TY3P286CU002.outbound.protection.outlook.com [52.101.229.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12612.1770260358851382639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 18:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=qbgKir6i;
 spf=pass (domain: fujitsu.com, ip: 52.101.229.67, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NF6AFpKmD6MQIoBBmWpw7NWjQFXCBik1OLNaqTIbWMsk8DMvYDTsBSgSWhgu0oefaKtrZGg7zgZmBNbJq33qTXV50NfzAIc0qg7XcDvke8a2NhqiY5FF/YSHrLEDOKl5jS+we81Gb8S7d0wwgAaIndLxHFZlBvpMppqkOuyBaTjuH1pYkNZiYWRNPWoMmkJYrK00JvJrh46zDQ5zCgteBQiRrpFD8ArDJz7K1vz7RR6PLQqiuOgttMa3Ou3UyJCkyytNnR5yRKAE3t2bYwlcGi0B6ksIVMa1bZPVsXD+vrdLNTzBWGNg9+VzzMmGqGq9Oz3J7TRqgpOp1JNUPC7dIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUEuk0Tdf65WxV1Bh1/qSlv9WZr7S2WBqicgikKtPOo=;
 b=AhGNLPmhwqzOSaPn8WONtiSABr0rqFrh4GPvsJlLykC1fKWJBxa3noTAKE134OyzCA10AjI9yPErLAwRMta4BOQZHJzL0na8L1J7Fg5IM/+/i2LhlbdLixde9HCn8baJ+sm0Ru3lxqn3RuqCo1Hj9GRXHa15SVxvkx5a8yBnXYb/B19DGZTx8xl8uGqHxJ6vHe+xW3IzRCrVptCqloIugjtgZYqfRpZJIp/GG8sKY1Io3VyBdbrJ67cpIKns4Gpb0FYoaQvgWQkpTecSgrBgyuu6HGfrfZ01ChJS0GbiblU0vl+TdKC/6Wcqao2KbkjOdmx7DKuRBs6TAa7FV1K0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUEuk0Tdf65WxV1Bh1/qSlv9WZr7S2WBqicgikKtPOo=;
 b=qbgKir6iqnSkFJQ9FZO8T7wbDW/ZCocF2VZlHbo9BHnl2bXDsy1J2XATOkuLkqSn4agZfsqgNX9MEb3a/49AhNzApDaOL/wjvu8aiNG0VReYVj2iNDmPl8FUttQSRhPRBmwUvXjpGljNOk/N/dWIclA+xVwV0f3L83zi2jzK6ZnjzQ3LuqLzk3xX10ho/wD0eB07GBg75dBH6KYNShTSAp912NpM86WSBkDI8Nv/tsk8GNjEn/NvrYfTQuFsswUgZ5vvVLXWZh4+YOcT+4qMDVVDwwbo3qdYHvFCjkulZO7gLU/TrgtUfN4S9m/+V7SDXEe0WZ1XaMmtXthh5CIcmQ==
Received: from OS3PR01MB10106.jpnprd01.prod.outlook.com (2603:1096:604:1e3::9)
 by TY7PR01MB14571.jpnprd01.prod.outlook.com (2603:1096:405:242::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 02:59:14 +0000
Received: from OS3PR01MB10106.jpnprd01.prod.outlook.com
 ([fe80::3f28:58af:d760:e254]) by OS3PR01MB10106.jpnprd01.prod.outlook.com
 ([fe80::3f28:58af:d760:e254%3]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 02:59:14 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIDYvNl0gb3JjOiBFbmFibGUgaG90ZG9j?=
 =?gb2312?Q?_to_produce_doc?=
Thread-Topic: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
Thread-Index: AQHckRIdFxGjs2+yRkygseyoFd9O5LVp+IWbgAl8Dso=
Date: Thu, 5 Feb 2026 02:59:14 +0000
Message-ID: 
 <OS3PR01MB101063210892B4305F30BCF669B99A@OS3PR01MB10106.jpnprd01.prod.outlook.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
 <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
 <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY3PR01MB1011061788269D6E4EAC2C8999B9FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-05T02:59:13.147Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB10106:EE_|TY7PR01MB14571:EE_
x-ms-office365-filtering-correlation-id: b8bd0d0e-23a0-42dd-c909-08de64628b5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|7053199007|38070700021|13003099007|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?RjVkcDkzWlpmaWlVZENDZXlyalJ6b0Yvb0IycC81L3c0Yiszd3lNUk95dVpE?=
 =?gb2312?B?NWZETmIvL1lkTGFVV3NnVmErZFIrL2dHcStLTzQ5YWN0K1FGNitBSlpHRENM?=
 =?gb2312?B?K2E5QmVqUXJ2YkRPRWVXOHFtZ1VsV1BJS1VSaUkyaG91cVQyamgrWnZhVlJm?=
 =?gb2312?B?azYwOU4yeFc4alZjbHJOSWpEOHZYRU1MdmpkN0dkTFh3eFc4UlNKZCt5eGEz?=
 =?gb2312?B?SkZiYkN3cXJwNUY1UEh1a2lpODBwbHlONHZsYjVjUkZqc0ZyQlprUTJZMDlZ?=
 =?gb2312?B?YTRDUU5CK2RPNWFEVUIyRzRETStldHRtK0M3ZnRVM3hVazlmQTlGQjBjRzFi?=
 =?gb2312?B?SXJTNWVXRVlkVUR0M1kxMnJBOUloTWtsVWczcjMvRU5aaktnaXVCbWU4MlVR?=
 =?gb2312?B?cmJIQjFCcG9pZ3BjZTFQQ2JPTHoyeW00d1NoN2ZCcXBCQnhJMHRuNVdVWGZH?=
 =?gb2312?B?aUkzL0pCTUZyc0NBdDVYTm1HWkpNRmpSNW1aZnJQaVhFL0VEYTRGeDVsT2NU?=
 =?gb2312?B?Q1VoNzU3SnV6a09XQUVTS0ZScSsrMk9VTlFHMElrTUJObmpjZXAzMWEzMko3?=
 =?gb2312?B?ZzRrRkNjMTRyeDFqK1J4bXJnekVjYXJIVnJHZUV6ZFZ4U0ZaQmRrd0xhRG5X?=
 =?gb2312?B?aHl4YmRpTm5ieC92aW5kZ1VQaXZrWWF5YkJGNXpHdmFNNFpOckk4ZDZ5N2hx?=
 =?gb2312?B?Wm1VVktjbHBGN1pYL3crVFhpbkJoUlhjOElab1dXSzJHNlZaRjlrUmNVRnEv?=
 =?gb2312?B?UHRBdi94MzFnYkhRelI0WnI3S0IxS0FSQ2FsdEV2d2FwTVBYRjlvNVVCSEhJ?=
 =?gb2312?B?VHJWdksvUlF5akYxTWNJeExRbHhQZm93NWtWZ29TdGpnMXRIa2tQdDhnRXhR?=
 =?gb2312?B?eHZ0WWYxaks5dzZsTllCbVRzaUJmWHBpMXQvTU5BZlE2VGlHRDdqL3laa2tV?=
 =?gb2312?B?WEtHakdIRnJ5eG5RT2ZwSkw2aEFGSCtVOE9KZVdVakIyM3JLdkNNTlJXb0Js?=
 =?gb2312?B?b1FzRldlTmlCMXBVa0xxVmZONGUxUk9YZ28vZ1NzdFlrNDlnYzExRTg2SmRs?=
 =?gb2312?B?QXhmaG96MjNnQ2FsallCQjF3OUFKNzhwM3J5eUVqYUNHNi95RVpnNDBFT1FO?=
 =?gb2312?B?bFBCZVorZjdrV2ZlV2FXT2dFSVpMU20xNStyRndSN2ZSN1FSMkp6MFVIOFFH?=
 =?gb2312?B?N0lMN3ZWZS9pOXNVdlV0OHdvTHVkY0Jrd0JtNVVBTEFxZWN6Zlh0ZGJoZ01K?=
 =?gb2312?B?bnJjd0tMcFNCUkVxQW94R3c1MWlKS296amxkelU3WDZ4d0N1QVlIOGozbXlK?=
 =?gb2312?B?amZGOGYvOTZUOXRSVytBRWdic0M4V1lVVVNRYmZhU2djQmZsaW5rOVVNOHhj?=
 =?gb2312?B?UTdyL1dQUjBTZlBCRXRZd3ppQis4OWN2QjNQa1hkOURnK2dIWUVtZGJSWTlS?=
 =?gb2312?B?UmdIRzBvbDNybVpQUG1ueGgzek80eG5OYmE2dURscHM2Uk9GUXoyaXZZNTlI?=
 =?gb2312?B?ODNqTzV3V1ZTTElnNGRXMEZRM0E0NXFGT3dRWmF0ZDZHTVltbURWdUhPUlRi?=
 =?gb2312?B?NUl2SXB2SkJGSzlTRkxwQm5wcWpaZnA3Z1FpbFVLcm9Dak9wN2NEL1RLQ3Er?=
 =?gb2312?B?RzlvaFhHankvcnVSd1lCWThYemkrZWh0K1E5UWVzQnA5Smc4ODRnUGJlL1Z0?=
 =?gb2312?B?S1lRQ3JoYk8wNjI5TkIyK29VSW50eXB6YTdKZnlSQ2MwTXNlcENxTzU3aDlr?=
 =?gb2312?B?U3puOUxHeHEvYXIvcndNN1FGUGdBWDZQZjRXOU5sL1BQckVySEhZUW1ja2Fz?=
 =?gb2312?B?WFI0WmxFbTcrZ3hPZnE3RGZzU2d4TEJLZHBVTnpOVnFXbVRUTE1hOFVVbUph?=
 =?gb2312?B?ZmFyRHBFTzRiaFcwVmVCdXFmUFpncTE1MWZCMW9IMGEyL0wyTVo2dTc5OHd5?=
 =?gb2312?B?T3NTeW9IY0NNVnlEQnBYK3BGM3VzdkN5Q2VkTjIxRFZCNHh3UUhyUGQ3MzB3?=
 =?gb2312?B?WVBxMjdRekJTYXYvMVEwSXZsRlNnTkxXZmMyeGtCQzdyQTZEM1A5WjhFR0tp?=
 =?gb2312?B?ejhiTkNkdHp6cUV6bTJzZ3duZ0JhTGNHVXJKV0xHUERxQm5yOEMydW1oN0w5?=
 =?gb2312?B?bk51dHZIN0d0UVpqM0IrTWJDdFF4K2ErV2VVVkFJNkhEVXZ0VC9ITUZmaFB6?=
 =?gb2312?B?SkE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB10106.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(7053199007)(38070700021)(13003099007)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?NHdsK0ZBRVJhMVl1bEVBYXZhMkhrQ2dlbEZjaWh1RVVaSkkzYngyTDlsaUhF?=
 =?gb2312?B?cUN2YkMrcW1reExib04zZWhSMHkzV0hvUWNuTEVqUzMxd051cUlLQzV4THU5?=
 =?gb2312?B?UXIxakNqdVJnSDlvamU2VXVoUnhZMllpZndPMGMvSXlsVUluSDFldnNDemFo?=
 =?gb2312?B?MFhYM0V0SXp0V1dlYTZNc0tsSE9nZm40Y1BNSVRaSWwrZVE3SWZHL3BueXYv?=
 =?gb2312?B?b3p6NFprbXRvUU45NEdaVktPZm9yVEtSUWZKcHpZTkVpaUtLOThTNmF0cDNC?=
 =?gb2312?B?QS9UZkw2QXo2cjVzV29DUkJZMGRXVnpjS3lmUFZDMHdnTTRmUkMzdHh1a2pz?=
 =?gb2312?B?NCtXaVlvUUIyaXVaczBiM1ZDYm03Q3dWTnBKdVpsc1l5U0RaYXZQQkNKbk1T?=
 =?gb2312?B?RTZWVG9TWXI4Y2RDUmtndnVsSUtCRWxjcnlFWTBzeksxSE9lNDhhOWNoRVE2?=
 =?gb2312?B?Ymp4WEtnQXhJbWsyZ0VYMU5ZWDJHZkt1UnA4NkR4c2x4ZVhEZEJvaWlGR1py?=
 =?gb2312?B?S0NaL1k5TFdITmcyQXVRZFduVVZvRHljU0VHaGp5SlJnc0VNVUd3ZTEzY2g2?=
 =?gb2312?B?bnJGMlhmMXdOWDU4WFdBQjNwbEFocW1XSER6ODUxZ3ZnNVlFQ3p3SEVzcVov?=
 =?gb2312?B?d3I2RUM5N3hocU9UaTBTQ2dtTlk0TDNDVVJXZTJjVWxYN2ZsRWF2c3ZQVFAw?=
 =?gb2312?B?cGJQVHk0aGZYZndUTU5WWkg5bHhLN0hSaXZCVS9lMEUrM2NUalRpcVZNV0N5?=
 =?gb2312?B?UkprUDRBMk4vUEs0UUVRZlc1djAxemFhVXF1TWJQZ1Jqemt3WXhPWG1GK3Ro?=
 =?gb2312?B?VkdSU0p3R3o0aEgrOEV3Y1NVQlpKMWx1YitETWFTbDJZR2ZPbzFxWTRGMDE5?=
 =?gb2312?B?R2FRRmUzYUVGQmoxQi9RWEtzaG1uUXZCRnNBNElBc0JNcVdIWlBkSHp0T2Fu?=
 =?gb2312?B?WFpiTEtlZExybExOcFhBbFlKaWVpbExyRHQyS241d3lhd3ovdnhOZVJ3VDUx?=
 =?gb2312?B?bExJZFVBOTRsSmtlZmNnSm1BWElEMEl2S0IzYXNHYStLSG02bnJPN3dNckJn?=
 =?gb2312?B?S2cxSlFEcUhVdHlZM3RKZGFMc0NESjJNa2gzSkw3dnR4WG55eC80Mk5Rcm9M?=
 =?gb2312?B?c1loVjdXM3dVUVkzLzlwamhtL055N1RmWmlubExFSXVQM0dvZTYzbERNU2ZD?=
 =?gb2312?B?akxLVDJYdmh3RUR4WHVVeFV0RktOdmV1YU1FRDgxSE5NN2NWMllyb09TK0Y3?=
 =?gb2312?B?TXdqbk0xRVJkWG0xRkQ1ak50ejU0L1NYcmZkb21SR1pqSUNHSlpySjZLT2ZS?=
 =?gb2312?B?Zlo0K01KWUhST2VmUFROWXZUWjhIbUcrV1p5cEZvRTZ0YmZTeUJ3Y09nZzJF?=
 =?gb2312?B?ckVEajFFREEwQmtta0gxRDJ4ZEFpT1ZCQ2tYN0ROemdqaEZDNkJhSWFjQkZx?=
 =?gb2312?B?RUp0dVBpaWlqS01yMFBTU2V2S082RTk4Q3pab3pvU0JRVG40SWZCcmJOblkx?=
 =?gb2312?B?UXRiQVdSR1BXVFhYYzdQakkrSG5jby9ISTBJT0ZvTytBMVpoNjBxeUJ1QWd0?=
 =?gb2312?B?Q2M4VE1NQlJtY3RrbUlqazBxN0pYTUpPSE1FSkovUEZ2aUJ1d2wzYVYzTGN3?=
 =?gb2312?B?VUZvbW9ZZmdqQ2ZtRUEvUWJ6WGk2MjJQQlk1WkZFVnVuR0VNMzBOL2xXdith?=
 =?gb2312?B?RHRobVpJRVVOZkY2Q1Y3bWtNeDlzNFJ0aWNOVjNEOUM0bWVjQklvOHNiL3VG?=
 =?gb2312?B?NlV4WVRXUmYzVmVaMTBldENWSmhmQnl3U09YQ2NOS3VOL0pRMmh1dFJYc3hr?=
 =?gb2312?B?YnVQUHNxaWJSaWs1STJEbU5WeWJLakVjTGZJd0hkb1lsYXRVTnpHRkRPQklr?=
 =?gb2312?B?cml6MENsMC84REtlNHFQMkZ1ZFh6NUlIZFhlUFhQcC9BZ3pmdDh5ZExBemFP?=
 =?gb2312?B?Q1d0azJkRE5xdW4zR2RQdWxRODV6b1ltb1dkaEpQMC92K2hnbWdvQ2d3ZVYw?=
 =?gb2312?B?dU9kNWI0b3JPa1BQUlVxN3RubUJCZjhJbkJwaGcxdU5uKzZLaUlDeTBac21t?=
 =?gb2312?B?T3pVTWVyZUphNFZEUDdZN2ZnZk1YaVBIQ2M3aEY5ZythU1Jtd0c5UWlUaFox?=
 =?gb2312?B?T0J6MkxmemFGYjd3WGpnbUQ0aG12YlBFaEJPUkxMaEVoZXAwRk5MeXA0eUNM?=
 =?gb2312?B?SVlBekZoMGs2ZXZOUExTaDlTQTVYRllpVkI5S0RVRlp2RExuRkVwMEpsRWlz?=
 =?gb2312?B?SUlxRXN4azc1eHM1cmkrWHh3NytDRzh3b3p5c3dFejlhMStWMm1iVkloSWMy?=
 =?gb2312?B?cXprYXhwakJYRjMzVkw4RzhjUGJsTXQ5blo1enRVZmJqcUFHUnRZQT09?=
Content-Type: multipart/alternative;
	boundary="_000_OS3PR01MB101063210892B4305F30BCF669B99AOS3PR01MB10106jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10106.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bd0d0e-23a0-42dd-c909-08de64628b5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 02:59:14.0799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5pPXfnft5VbHgwu1HgZmvN53Qdn4nlAzuPkQ/RrQSpJH+to9cRwdgo0wnEAVXGQhUDj9tOBqE58x60JIGBcXHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 02:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230563

--_000_OS3PR01MB101063210892B4305F30BCF669B99AOS3PR01MB10106jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogTGl1LCBZaWRp
bmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCreiy83KsbzkOiAyMDI2xOox1MIz
MMjVIDEwOjE5DQrK1bz+yMs6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPg0Ks63LzTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCtb3zOI6ILvYuLQ6IFtPRS1j
b3JlXVtQQVRDSCA2LzZdIG9yYzogRW5hYmxlIGhvdGRvYyB0byBwcm9kdWNlIGRvYw0KDQpIaSBB
bGV4DQoNCiAgICAgSSBzZWFyY2ggdGhlIGNoYW5nZWxvZyBpbiBnaXQgbG9nLCBhbmQgZm91bmQg
dGhhdCBiZXNpZGVzIG9yYywgZ3N0cmVhbWVyMS4wLXZhYXBpLCAgZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZSBhbmQgZ3N0cmVhbWVyMS4wIHVzZWQgaG90ZG9jIGluIG5ldyB2ZXJzaW9uLg0KDQpM
aXUNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0Kt6LLzcqxvOQ6IDIwMjbE6jHUwjI5yNUg
MTk6MjYNCsrVvP7IyzogTGl1LCBZaWRpbmcvwfUg0tK2oSA8bGl1eWQuZm5zdEBmdWppdHN1LmNv
bT4NCrOty806IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBSZTogW09FLWNvcmVd
W1BBVENIIDYvNl0gb3JjOiBFbmFibGUgaG90ZG9jIHRvIHByb2R1Y2UgZG9jDQoNClRoYW5rcyBm
b3IgbG9va2luZyBpbnRvIHRoaXMuIEFyZSB0aGVyZSBvdGhlciByZWNpcGVzIGluIG9lLWNvcmUg
dGhhdA0KaGF2ZSBob3Rkb2Mgc3VwcG9ydD8gWW91IGNhbiBwZXJoYXBzIHVucGFjayBldmVyeXRo
aW5nICh3aXRob3V0DQpidWlsZGluZyBpdCksIGFuZCB0aGVuIGdyZXAgaW4gV09SS0RJUiBmb3Ig
aG90ZG9jLg0KDQpJZiB0aGVyZSdzIGp1c3Qgb3JjLCB3ZSBjb3VsZCBwcm9iYWJseSBhZGQgaG90
ZG9jIHRvIG1ldGEtb3BlbmVtYmVkZGVkIGZpcnN0Lg0KDQpUaGUgcGVuZGluZyBwYXRjaCBuZWVk
cyB0byBiZSBzdWJtaXR0ZWQgdXBzdHJlYW0uDQoNCkFsZXgNCg0KT24gVGh1LCAyOSBKYW4gMjAy
NiBhdCAwNDo1NCwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQp3cm90
ZToNCj4NCj4gU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNv
bT4NCj4gLS0tDQo+ICAuLi4vb3JjL29yYy8wMDAxLUZpeC1ob3Rkb2MtcnVuLWVycm9yLnBhdGNo
ICAgfCAzNyArKysrKysrKysrKysrKysrKysrDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3Jj
L29yY18wLjQuNDIuYmIgICAgICAgfCAgNSArKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcmMvb3JjLzAwMDEtRml4LWhvdGRvYy1ydW4tZXJyb3IucGF0Y2gNCj4N
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjLzAwMDEtRml4LWhv
dGRvYy1ydW4tZXJyb3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yYy8wMDAx
LUZpeC1ob3Rkb2MtcnVuLWVycm9yLnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjI3N2NlMDM4ZjgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yYy8wMDAxLUZpeC1ob3Rkb2MtcnVuLWVycm9yLnBhdGNo
DQo+IEBAIC0wLDAgKzEsMzYgQEANCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4IGhvdGRvYyBydW4g
ZXJyb3IuDQo+ICsNCj4gK0ZpeCB0aGUgZm9sbG93aW5nIGVycm9yLg0KPiArfCBSdW5uaW5nIGN1
c3RvbSBpbnN0YWxsIHNjcmlwdCAndG1wL3dvcmsveDg2LTY0LXYzLXBva3ktbGludXgvb3JjLzAu
NC40Mi9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9tZXNvbi5yZWFsIC0taW50ZXJuYWwg
aG90ZG9jIC0taW5zdGFsbCBvcmMtZG9jL2h0bWwgLS1kb2NkaXIgL3Vzci9zaGFyZS9kb2Mvb3Jj
L2h0bWwgLS1uYW1lIG9yYyAtLWJ1aWxkZGlyIHRtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4
L29yYy8wLjQuNDIvYnVpbGQvZG9jIHRtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4L29yYy8w
LjQuNDIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vaG90ZG9jIHJ1biAtLWNvbmYtZmls
ZSBvcmMtZG9jLmpzb24nDQo+ICt8IC0tLSBzdGRvdXQgLS0tDQo+ICt8DQo+ICt8IC0tLSBzdGRl
cnIgLS0tDQo+ICt8IEVSUk9SOiBbZG9jLXRyZWVdOiAoaW5kZXgtZXh0ZW5zaW9uLW5vdC1mb3Vu
ZCk6IHRtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4L29yYy8wLjQuNDIvc291cmNlcy9vcmMt
MC40LjQyL2RvYy9zaXRlbWFwLnR4dDo4OjEwOiBObyBleHRlbnNpb24gbmFtZWQgYyBmb3IgaW5k
ZXggcGFnZQ0KPiArfCAwMDAwNjogICAgICAgICAgICAgICAgdHV0b3JpYWwubWQNCj4gK3wgMDAw
MDc6ICAgICAgICAgICAgICAgIG9wY29kZXMubWQNCj4gK3wgMDAwMDg6ICAgICAgICBjLWluZGV4
DQo+ICt8ICAgICAgICAgICAgICAgXg0KPiArfCAwMDAwOToNCj4gK3wNCj4gKw0KPiArUmVtb3Zl
IGMtaW5kZXggYXMgaXQgaXMgbm90IGluIHRoZSBkb2MgZGlyZWN0b3J5Lg0KPiArDQo+ICtVcHN0
cmVhbS1TdGF0dXM6IFBlbmRpbmcNCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8
bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gKy0tLQ0KPiArIGRvYy9zaXRlbWFwLnR4dCB8IDEg
LQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQg
YS9kb2Mvc2l0ZW1hcC50eHQgYi9kb2Mvc2l0ZW1hcC50eHQNCj4gK2luZGV4IDU2OGIzNjcuLjQw
YTdmOTkgMTAwNjQ0DQo+ICstLS0gYS9kb2Mvc2l0ZW1hcC50eHQNCj4gKysrKyBiL2RvYy9zaXRl
bWFwLnR4dA0KPiArQEAgLTUsNCArNSwzIEBAIGluZGV4Lm1kDQo+ICsgICAgICAgICAgICAgICBj
b25jZXB0cy5tZA0KPiArICAgICAgICAgICAgICAgdHV0b3JpYWwubWQNCj4gKyAgICAgICAgICAg
ICAgIG9wY29kZXMubWQNCj4gKy0gICAgICBjLWluZGV4DQo+ICstLQ0KPiArMi40My4wDQo+ICsN
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40Mi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40Mi5iYg0KPiBpbmRleCBmNTZiOTA1
OGMyLi5iNzNjOGRmMDRkIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3Jj
L29yY18wLjQuNDIuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40
LjQyLmJiDQo+IEBAIC00LDExICs0LDE0IEBAIERFU0NSSVBUSU9OID0gIk9wdGltaXNlZCBJbm5l
ciBMb29wIFJ1bnRpbWUgQ29tcGlsZXIgaXMgYSBMaWJyYXJ5IGFuZCBzZXQgb2YgdG9vDQo+ICBM
SUNFTlNFID0gIkJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVzZSINCj4gIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTE0MDBiZDlkMDllOGFmNTZiOWVjOTgyYjNkODU3OTdl
Ig0KPg0KPiAtU1JDX1VSSSA9ICJodHRwOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMv
b3JjL29yYy0ke1BWfS50YXIueHoiDQo+ICtTUkNfVVJJID0gImh0dHA6Ly9nc3RyZWFtZXIuZnJl
ZWRlc2t0b3Aub3JnL3NyYy9vcmMvb3JjLSR7UFZ9LnRhci54eiBcDQo+ICsgICAgICAgICAgIGZp
bGU6Ly8wMDAxLUZpeC1ob3Rkb2MtcnVuLWVycm9yLnBhdGNoIFwNCj4gKyAgICAgICAgICAiDQo+
ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2VjOTEyYWI1OWFmM2NjOTc4NzRjNDU2YTU2YThhZTFl
ZWM1MjBjMzg1ZWM0NDdlOGExMDJiMmJkMTIyYzkwYyINCj4NCj4gIGluaGVyaXQgbWVzb24gcGtn
Y29uZmlnDQo+DQo+ICtERVBFTkRTID0gImhvdGRvYy1uYXRpdmUiDQo+ICAjIGRpc3Rpbmd1aXNo
IGZyb20gYXBhY2hlOm9yYw0KPiAgQ1ZFX1BST0RVQ1QgPSAiZ3N0cmVhbWVyOm9yYyINCj4NCj4g
LS0NCj4gMi40My4wDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzIzMDExOCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL21lc3NhZ2UvMjMwMTE4DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNzUyMTQ1NC8xNjg2NDg5DQo+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS91bnN1YiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4NCg==

--_000_OS3PR01MB101063210892B4305F30BCF669B99AOS3PR01MB10106jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Liu, Yi=
ding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@fujitsu.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA1=D4=C230=C8=D5 10:19<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;=
<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> =BB=D8=B8=B4: [OE-core][PATCH 6/6] orc: Enable hotdoc =
to produce doc</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif">
<span style=3D"font-size:12pt; color:rgb(0,0,0)">Hi Alex<br>
<br>
&nbsp; &nbsp; &nbsp;I search the changelog in git log, and found that besid=
es&nbsp;</span><span style=3D"font-size:11pt; color:rgb(0,0,0)">orc, gstrea=
mer1.0-vaapi, &nbsp;gstreamer1.0-plugins-base and gstreamer1.0 used hotdoc =
in new version.<br>
<br>
Liu</span></div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Alexa=
nder Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA1=D4=C229=C8=D5 19:26<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce=
 doc</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Thanks for looking into this. Are there other re=
cipes in oe-core that<br>
have hotdoc support? You can perhaps unpack everything (without<br>
building it), and then grep in WORKDIR for hotdoc.<br>
<br>
If there's just orc, we could probably add hotdoc to meta-openembedded firs=
t.<br>
<br>
The pending patch needs to be submitted upstream.<br>
<br>
Alex<br>
<br>
On Thu, 29 Jan 2026 at 04:54, Yiding Liu (Fujitsu) via<br>
lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt;<br>
&gt; Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../orc/orc/0001-Fix-hotdoc-run-error.patch&nbsp;&nbsp; | 37 +++=
++++++++++++++++<br>
&gt;&nbsp; meta/recipes-devtools/orc/orc_0.4.42.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 5 ++-<br>
&gt;&nbsp; 2 files changed, 41 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-hotdoc=
-run-error.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.p=
atch b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..277ce038f8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch<br=
>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +Subject: [PATCH] Fix hotdoc run error.<br>
&gt; +<br>
&gt; +Fix the following error.<br>
&gt; +| Running custom install script 'tmp/work/x86-64-v3-poky-linux/orc/0.=
4.42/recipe-sysroot-native/usr/bin/meson.real --internal hotdoc --install o=
rc-doc/html --docdir /usr/share/doc/orc/html --name orc --builddir tmp/work=
/x86-64-v3-poky-linux/orc/0.4.42/build/doc
 tmp/work/x86-64-v3-poky-linux/orc/0.4.42/recipe-sysroot-native/usr/bin/hot=
doc run --conf-file orc-doc.json'<br>
&gt; +| --- stdout ---<br>
&gt; +|<br>
&gt; +| --- stderr ---<br>
&gt; +| ERROR: [doc-tree]: (index-extension-not-found): tmp/work/x86-64-v3-=
poky-linux/orc/0.4.42/sources/orc-0.4.42/doc/sitemap.txt:8:10: No extension=
 named c for index page<br>
&gt; +| 00006:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tutorial.md<br>
&gt; +| 00007:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; opcodes.md<br>
&gt; +| 00008:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-index<br>
&gt; +|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; ^<br>
&gt; +| 00009:<br>
&gt; +|<br>
&gt; +<br>
&gt; +Remove c-index as it is not in the doc directory.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt; +Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
&gt; +---<br>
&gt; + doc/sitemap.txt | 1 -<br>
&gt; + 1 file changed, 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/doc/sitemap.txt b/doc/sitemap.txt<br>
&gt; +index 568b367..40a7f99 100644<br>
&gt; +--- a/doc/sitemap.txt<br>
&gt; ++++ b/doc/sitemap.txt<br>
&gt; +@@ -5,4 +5,3 @@ index.md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; concepts.md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; tutorial.md<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; opcodes.md<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c-index<br>
&gt; +--<br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-de=
vtools/orc/orc_0.4.42.bb<br>
&gt; index f56b9058c2..b73c8df04d 100644<br>
&gt; --- a/meta/recipes-devtools/orc/orc_0.4.42.bb<br>
&gt; +++ b/meta/recipes-devtools/orc/orc_0.4.42.bb<br>
&gt; @@ -4,11 +4,14 @@ DESCRIPTION =3D &quot;Optimised Inner Loop Runtime C=
ompiler is a Library and set of too<br>
&gt;&nbsp; LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D1400b=
d9d09e8af56b9ec982b3d85797e">file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3=
d85797e</a>&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop.org/src/orc=
/orc-${PV}.tar.xz">http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.x=
z</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D""></a>http://gstreamer.freedesktop.org/s=
rc/orc/orc-${PV}.tar.xz \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-hotdoc-run-error.patch">file://0001-Fix-hotdoc-run-erro=
r.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;7ec912ab59af3cc97874c456a56a8ae1eec=
520c385ec447e8a102b2bd122c90c&quot;<br>
&gt;<br>
&gt;&nbsp; inherit meson pkgconfig<br>
&gt;<br>
&gt; +DEPENDS =3D &quot;hotdoc-native&quot;<br>
&gt;&nbsp; # distinguish from apache:orc<br>
&gt;&nbsp; CVE_PRODUCT =3D &quot;gstreamer:orc&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#230118): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/230118">
https://lists.openembedded.org/g/openembedded-core/message/230118</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11752145=
4/1686489">
https://lists.openembedded.org/mt/117521454/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_OS3PR01MB101063210892B4305F30BCF669B99AOS3PR01MB10106jp_--

