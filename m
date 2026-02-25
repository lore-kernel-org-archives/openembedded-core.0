Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AC6F55441
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:48:08 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37500.1771987682458527418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 18:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=XyJ0XQJV;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.23, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPDNywfUdPK58ZUt0MjI7KlXBY9/OyHUlQD+NQaatH8QxxOEedY57E+t0vAKl27TSYHqvJsImjAddMa93hX7CgT12215AuP6EB+N35v3wVhq0ls0ZYGOrkPtFBeoatpMKC2OHC3PepaHkmu39PU1S4lDMVT5J5O7GIuzTJke9wKsImQuuFLkvDXTQayRhMgdokAwd8ot1VWitCuf0jLv//Ygsf4XMKI3joeNKKkPxeNNDT6KPD9ZvKCwy00Ks1BOBvcftQ3ZJiFb5KxvgNhv4wpQ9ziIm2H2NLSEvXHzOhfyF1faE9Hm3t+wc+cbGgM09OM1WxcEKx9vgXpAnNpE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7HmY19+ElwgJIJTa9F911rhA5gQr+ZldbytkPJ1154=;
 b=HxuRKsSesKaIW7GotrgfgU/3o1gYbiktu6+O87edPh86DX4HwxCm90OPJQydKhOotJ0wSICp7Bj0/OoVCJgH6MSMYu/TKT8XraeuDRF4VUFJ+oEqoV3Ek8QqJxIGEpN9dJOlkJ9k4A7F+yBppUeLX7AeLNkI2JcANin/DLFbDvxLLzzuofw0RPYMyil13QetgnVMR3Gm5igKKDk50nSqWPO/a14x+Riplo5/WBJ1a/YtCHxDXHUD7y2ndhhn+M70+EV4yx0ZD2rRK/GVLW3U38KzCt+A5iVAjKIcarSMqEk6++cLV0NvIy7GjZXOw3wmi/dCkn11o5haXbUUABotlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7HmY19+ElwgJIJTa9F911rhA5gQr+ZldbytkPJ1154=;
 b=XyJ0XQJVYNR3eLdQw2dnCagudkKyRAP4EqjMLcUZ5BBGXPNc0QlAeC47wyvUZXmNQzg7zM7j4eVlCw0vDfDbVThoGtq2o1oa4lCgMxw2vhsfvaDq3e/bbvBBBDXxrtitpQMkYz8BGGB0K7mJW5Nb6JuVvCAIY2jl4ya3aocaAqu9ezSCU1d3UjqeJR7Vi0lXp/13s/EVqCYpsUGyhmRnwQpcDXPmBtodnaugWZKds/bM8b8CHngRpfN+CC8ZdIco42s0q7mgIAfwS8I1KisblKJ6uIxfi4aIibX9+KQbcNGnALmZu+Xvk73kuL0zRuwpap9juwz01G4QVhZUtvPCRA==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYYPR01MB15134.jpnprd01.prod.outlook.com (2603:1096:405:1a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:47:57 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 02:47:57 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] orc: Enable hotdoc to produce doc
Thread-Topic: [OE-core][PATCH] orc: Enable hotdoc to produce doc
Thread-Index: AQHcpbNsSyY3B3+gBU2PRaPLht+pf7WSry6f
Date: Wed, 25 Feb 2026 02:47:57 +0000
Message-ID: 
 <TY3PR01MB1011013658016E710A5754F309B75A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <20260224035119.1597-1-liuyd.fnst@fujitsu.com>
 <CANNYZj-+vYTQW9bmOTgdNmZVTxFFSSrqoh7GQJ7EpEy+WxiSrw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-+vYTQW9bmOTgdNmZVTxFFSSrqoh7GQJ7EpEy+WxiSrw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-25T02:47:56.450Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYYPR01MB15134:EE_
x-ms-office365-filtering-correlation-id: 76edf18f-c5d9-4f33-1718-08de74184846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700021|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?c0d2elZySVYxa1daYnBySkZCbCtMckZJbEl5dUJmWmxNeTJHMlRkcG5YR2VO?=
 =?gb2312?B?OW5EWE5ZK0NreUlldTd5YThPSlZic0dlaGdnQ1pEQWMvcGZwYXhrQmphVmtE?=
 =?gb2312?B?TzNpN1ZyQWdDVU9GTGNpWkZzY2Rwak4yK1ZJQjUrRlUzbC8xVVpKUzZma3lY?=
 =?gb2312?B?ZS9IU3p0cGpEVk0ySU8rSkVBM0pzL0NoQjlRU0g4NWFxQ2JMN2FkMEgzSG9m?=
 =?gb2312?B?VjNiN0c0cWxjOUFPS3RFSTErZVB2b0NQTGxSc1VvRHRBMDdSNlJ6K24wUjYy?=
 =?gb2312?B?aXlUTThxbVk2ODYwMUZ0Y0ZkbFF5alR2TE5lQlFYU2s2SDI2YmVwR3FneDZW?=
 =?gb2312?B?TzgrSjJJaSs3MDFxWks0Y2FXaFA4dzlKT1ZrcE1CdmZGMjBFVCtFUlN4c3ho?=
 =?gb2312?B?d3FLWStyb2o4bmc3TkdpbWVoT0FvVHkvL0puWkRZcS9XcVJEM1R1ck13NjlK?=
 =?gb2312?B?NUNQTC95Wk5RSklIWFNNK29LNG9NOUZ3VG5wNWFZT1pUTDhFWTgxR3FmNlpX?=
 =?gb2312?B?dG8xNHBkZ2lVRjNhN3JFcXZSRit2OWMvSk85YXllUjUxN29WS2M5WEdGU3I5?=
 =?gb2312?B?UkVwMTE0QzBkUUF2QkVUVkJGNTVQU0RDZjV6RzJiN1IzNHg2MEV0SWFORHo1?=
 =?gb2312?B?VllhdENZaHlVYlI5S2o0dVNnWG11Y2ZkdXphcHBKcENZaGZ1cE4zclNsSlc4?=
 =?gb2312?B?TGxJeG5xUzNOclZ3OFduczdBV2tvaFkxdlZTSDFtTm5XVzJZaVN6REluVTVM?=
 =?gb2312?B?c2RQaHJQellVTWJ6cWpvZjMrNm83dkU2VkxGWjdXOC9JZWgrd3FqNmRCcjlY?=
 =?gb2312?B?WFR5elQ5Yjk2UUFGK3JOZ09ncEFPc25ZejMzdjRnRktoUVRvOW96bFZsRUJ5?=
 =?gb2312?B?UUs5c2ZHdWpYbWszcnN4VFh4YzkydjltR2VOVWJnKzl4OTBvend1TnlnaUdI?=
 =?gb2312?B?S2QyT25GTFNjZDFtaFJ6bUhzWTZZdFpkUVVYN3lKVUR1OHRnNDE1UEJYdVB0?=
 =?gb2312?B?ckMveEFQNmtqdThvZWFlcDlKcjUxWVRtQk1zL09TeldlZmZLZzVhQXJxRnBR?=
 =?gb2312?B?cllaejVMdkpnMTBiUXZ1RUFZOE9hWisvaVNuaHhiT0JJcEdQYkpjTWJzbzNJ?=
 =?gb2312?B?Rm1HL3h4UWVTaDhzTzllTXJGNndSWTJUd3R3VFVjRGJnT25hLzRxb0lRZDZU?=
 =?gb2312?B?eGpDNjIvRDcweFlnRjI1N2NUQnJGZFQwcGM5dWRpYzF6dWFhSGdBUDV6MjFj?=
 =?gb2312?B?czhaNEpuSTEvQkNaRm5YYzNZSmlFaEc0dWtsTlM2eEF5ZXJQQ3BqNDRmZ2xt?=
 =?gb2312?B?ei9iTTZUS2xIb283Q3YyWmVGZnRMYnNkYU12Q2RiMXVjRkJ5bi9yT1V5NWZS?=
 =?gb2312?B?N1dBeGE3YnJWVkFMUUl4b29sbFVQTmF4R0hyYmNXaEkxWXNNUGhiblpndkZB?=
 =?gb2312?B?RkF6S1R3YWhvTTVRT210MEFaUHVuNVp3NGVsYXhmRjA2bkRoeHBoYzhGZnUx?=
 =?gb2312?B?WXJUa0ZCSzJLMG4rT281UUtTaGhCaHRpelN6Wkg2MmxNODhsd0E0Ti83ZzlW?=
 =?gb2312?B?eDIvYjQxeVFsMDhSZXIwbVBOY3pOaDloK1gvYW8weS9EdSs2SXJ6c2x6U21G?=
 =?gb2312?B?VVdleXdEK1YxQlJTUVR1NUx0NVRnR21hR0hqQ2NaU21XR3QvVnRLY04wVEMr?=
 =?gb2312?B?OEw5RUx0K3B4Q1dtWDlCc3ZsNGVmaXVYOXNyaVVqTjE1cGZQdFB4NTVkUUtV?=
 =?gb2312?B?WjBlVkM1NVlubDFHbkxqRTlqQkdlemFRVU00UG9FVW0yRFdtQkFVQUtzSGtt?=
 =?gb2312?B?Ynd5bU8wbk1qN1E4MzYrV20xV20vTEdJK04vdjBGd3RwV0o2VW52TkErS1F1?=
 =?gb2312?B?L2tPU21uSDBGZUlGQ2ZrRE5SUFJCS0prS3p1TW5WRmFCL0U2MUQ0YmZmazYx?=
 =?gb2312?B?OFVkWnk1bGkxOWZMcUI5UWt4UmdRdXhZdmoxdlhVSXA5TzdBcXlzSWl3bVhB?=
 =?gb2312?B?dlA4dlJnMTltWkJkZDlFOGs1blI5ZURtWVQ3QXYvYWpxdGZnc2R2ekVTYnVI?=
 =?gb2312?B?M0ZHWENCVHo5ckhFVG1lQlJzUjVVcnVsbDJ0T2FSU2NBdzlwaFVQUExlRStr?=
 =?gb2312?B?bmN2R2xJRFl0N2crelVYL2VmbG1SNlNuaFFib0pOOHFoUWlqSURoWlZOWlVm?=
 =?gb2312?Q?aInfFOFSusJ73uWatlRisMdElD0bYsTCUqjG2mT51mM/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700021)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Z28rY2VZL2Rkd203Q2hmbmhZdWNodWlsQjBkWkhraWR6dVE2ZkhxUGxwU0FD?=
 =?gb2312?B?M0ZPNnZ5NTkzcTRVVkE1NEZEWDR1THBXQmQ2YTlSZGtYaHVaSDhKZEpmU01u?=
 =?gb2312?B?MUJ2OFF2bThkN1h1M1czZG03amN0V2R5YU45SEVFeG5scjNmTnVxcForNU5T?=
 =?gb2312?B?OEtUMCtEakxZbTJLMVVQbjE0Y1c2eWZ3MmdSYXltRGk1UzN2ZlFySEZOcjNr?=
 =?gb2312?B?MjVmREdlS1JhcW1zbEdQQUhtR3lDbXBic2VKUSsrKzVkU0N3MFNOeks5eTJ1?=
 =?gb2312?B?YmQwTSs5S1pNbTRTVTVib3k1ZWJ3UitlYlBVclVUTTZTZGJSMzVWLzhrcXN2?=
 =?gb2312?B?TDZ2eURXcmtvYlJ5dWNVd0ZQdnFBR1VxMFdBZXhkUzV4UUswRmFlQ29YMith?=
 =?gb2312?B?c3N0MUp6MGZ5THkvSXE3TFFSNmhwVVVxaXJIVnJTR2w3cENvZDRxQ3djQmNx?=
 =?gb2312?B?bXVoMGMxUVBXMkJtNWYvUmprSkhPcEhWNksxVUpicmxXdzNqTGJPdmorR1dk?=
 =?gb2312?B?K01NRk43a1pXNVYvSzduMXRzQXVkeUZpaE5COUowYTNGZWpDRXBsVW91WXQ2?=
 =?gb2312?B?SXo1cFZpbUFxZGRjdlJaMklxWjYwS0JZRzMvZUxVbllYeHBwRDNmd3BUVE5a?=
 =?gb2312?B?TXAwRmtlZXZVT1ZNSjBMTEV6cjBka2RSbVVtM3p4Yml0NEQ5SnQzcFh3R3Vu?=
 =?gb2312?B?RmlaOVp3Qk0vZVNpT3Z6K0kwKzF4RUdneExaQXpyVE5LNkd5Y1VZSUlyeXZl?=
 =?gb2312?B?aUhxR0FVYktoNHJ3ZFhTUDNRbWo4OW1aWDNPV1BOd0R2RklzOE1weE9LbFNH?=
 =?gb2312?B?RTIzZW91aTFmRVVsc1pYdm1RT2tPcTJXa042VzlRc1pzVkRpVEFTYmNjWkkx?=
 =?gb2312?B?TnJ3SURxc2JIMjUzMVBKNTF2RXRjczk0OGJmSUhpT05uVmhvU25BaUc5UXZk?=
 =?gb2312?B?WGE4a2l3MUZPY2FrY0VDZUsycEZjcWlKVG9HNDY2Ni9LeVovZzhBd1dDR2Rz?=
 =?gb2312?B?YVlLaERJOXNpRFlmbVF3K3c3cGlQY1ExMHFyTWovZjlwZFBlejJLSG5CNk4v?=
 =?gb2312?B?bmppbDVXeVZlSGdTRTJaV2JMOXZ4MVc2TjhVYngvNFlEcDIyV3ExQ2hrY09r?=
 =?gb2312?B?end2VmRjL285WVM3bG1VMFlYL2ZYNDBnci81MnVYcDBRdHp4QUY5Nk9LVlFu?=
 =?gb2312?B?OE9sSGlPeldBMWlteFJaSXdRTWJpUTY5N0VlZk5sdW9nb0FvSUhkYkxpNkhw?=
 =?gb2312?B?M2MwY2k3VHQrWUV6TnQ5NHFweWoweU1qMXBXekZ1Sk1CazJieEVIZFFUNVho?=
 =?gb2312?B?V2k0cEtIRUh3M2pyUkNtdUdGZWtRNXRSY1dxNEJ4dEpuN1d4dzM3ZWhLTk9o?=
 =?gb2312?B?aU9Lb0QwV294aHB6dnROTUtZWmV5V1JRaDdSbkxNcnZHbWlNaEZlUXk4OFZ4?=
 =?gb2312?B?R1EwSDFkVHpRVyszSDdlZEE4SjNRK2NUb1VaWXJEWm95QzJQYUFXSERmUlV3?=
 =?gb2312?B?dXR4eVRORkM0VGVZemkwTm1ENjZ6K1lmbnF5MG1tOTZsT1d4UWdOZlhTTHlV?=
 =?gb2312?B?K2M5aWIwYmpvcEQvWFBZejhWMTl0Z3RNNGowUnVBeGRwSXRycW83U0pVNGtK?=
 =?gb2312?B?SXA4aFduVW15M0o0OGk2a0ZmTEtyejJYeDBoMmVRc2MyNjdRbWI4ZkVDSW9h?=
 =?gb2312?B?NDNvQ3BQaCt4bVZnRTF6ZUl3eDkwZmlERFhYeHR5VmZ6S3FhOU95SmZiTjRh?=
 =?gb2312?B?Rll3dENjUzZGRWR5Zk1ENzFTMlpzYWRwaFZhU212L3F0UmZKNVNoNDZYdkQ1?=
 =?gb2312?B?Y3BndGpTK2xqNkZGN01uZk9ZZFVLa2tLNHVhSzcwWGJ6VGxlWW56UlFhVEM3?=
 =?gb2312?B?VDRzTW00aFMyNHpZSlg0WmNZZXRqUEhIbFhWZEJjM29zbDAvR2k2MzBVaWl6?=
 =?gb2312?B?L0NnbUYwZmJpUUd1YkpISFZrY29xdjludzNVVEduMGFYcWV0WmNHSTlFdE44?=
 =?gb2312?B?QTNVeS90RDRDbUdnZ0VTZUcwbE5vai9kcVpIRW05U3h3OFlzZkEyOFByTHVJ?=
 =?gb2312?B?TFFab0xBU3k5OG9Mc3hTUzRNeVZ1ZklMTy9JNVUyOTMwalh2czN1K1c4UlhS?=
 =?gb2312?B?Mi9zWnJIT2o5aXZTUk1GMG8rcVdVWTlYYzAxWk1MRnNYOEw0MHlZVUNyVEVQ?=
 =?gb2312?B?RUZHaFBLNTBmNE1jQ2NVS1B3TldiMXlZaFVuS29lNkdwRUY3dU5uNGlzZjBO?=
 =?gb2312?B?ZGZMM1NjZzFWdWJVenQxUmd2cndBVENaQWMzUW5hZ0hnYm5Rd0w4azQ3dk96?=
 =?gb2312?B?MHZQS0RYOTg1a1BCY2M5YWJuMElxZ29oMnlGeUJseGVBTm5weGdjUT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB1011013658016E710A5754F309B75ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76edf18f-c5d9-4f33-1718-08de74184846
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:47:57.2663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GNEKsDWOLkhHXeB5EjXDYJdE03EMVNqvSOg6fQtDTSO7rHMQ5bn7Mzgi/yR9/RAQSSgAlJxrDUSKUoTxoXkzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 02:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231922

--_000_TY3PR01MB1011013658016E710A5754F309B75ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KICAgWWVzLCBJIHdpbGwgYWRkICBQQUNLQUdFQ09ORklHIGZvciBob3Rkb2MgYW5k
IHNlbmQgYSB2MiBwYXRjaC4NCg0KUEFDS0FHRUNPTkZJRyA/Pz0gIiINClBBQ0tBR0VDT05GSUdb
aG90ZG9jXSA9ICIsLGhvdGRvYy1uYXRpdmUiDQoNCkxpdQ0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0Kt6K8/sjLOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4NCreiy83KsbzkOiAyMDI2xOoy1MIyNcjVIDAxOjMxDQrK1bz+yMs6IExpdSwgWWlk
aW5nL8H1INLStqEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQqzrcvNOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPg0K1vfM4jogUmU6IFtPRS1jb3JlXVtQQVRDSF0gb3JjOiBFbmFibGUgaG90
ZG9jIHRvIHByb2R1Y2UgZG9jDQoNCk9uIFR1ZSwgMjQgRmViIDIwMjYgYXQgMDQ6NTEsIFlpZGlu
ZyBMaXUgKEZ1aml0c3UpIHZpYQ0KbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1m
dWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0Kd3JvdGU6DQo+ICtERVBFTkRTICs9
ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2FwaS1kb2N1bWVudGF0
aW9uJywgJ2hvdGRvYy1uYXRpdmUnLCAnJywgZCl9Ig0KDQpVbmZvcnR1bmF0ZWx5IHRoaXMgaXMg
bm90IGdvaW5nIHRvIHdvcmsuIFlvY3RvJ3MgYXV0b2J1aWxkZXIgZG9lcyBydW4NCmJ1aWxkcyB3
aXRoIGFwaS1kb2N1bWVudGF0aW9uIGVuYWJsZWQsIGFuZCB0aGV5J3JlIGV4cGVjdGVkIHRvIHN1
Y2NlZWQNCndpdGhvdXQgYW55IGFkZGl0aW9uYWwgbGF5ZXJzLg0KDQpUaGUgY29ycmVjdCB0aGlu
ZyBpcyB0byBkZWZpbmUgYSBQQUNLQUdFQ09ORklHLCBhbmQgbGVhdmUgaXQgZGlzYWJsZWQuDQoN
CkFsZXgNCg==

--_000_TY3PR01MB1011013658016E710A5754F309B75ATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Alex</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;Yes, I will add&nbsp; PACKAGECONFIG for hotdoc and send a v2 p=
atch.</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
PACKAGECONFIG ??=3D &quot;&quot;</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
PACKAGECONFIG[hotdoc] =3D &quot;,,hotdoc-native&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"margin-left: 0px; font-family: Aptos, Aptos_EmbeddedFont, Apt=
os_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: r=
gb(0, 0, 0);" class=3D"elementToProof">
Liu</div>
<div style=3D"margin-left: 40px; font-family: Aptos, Aptos_EmbeddedFont, Ap=
tos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: =
rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C225=C8=D5 01:31<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@f=
ujitsu.com&gt;<br>
<b>=B3=AD=CB=CD:</b> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] orc: Enable hotdoc to produce doc=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 24 Feb 2026 at 04:51, Yiding Liu (Fujitsu)=
 via<br>
lists.openembedded.org &lt;liuyd.fnst=3Dfujitsu.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt; +DEPENDS +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', 'api-docum=
entation', 'hotdoc-native', '', d)}&quot;<br>
<br>
Unfortunately this is not going to work. Yocto's autobuilder does run<br>
builds with api-documentation enabled, and they're expected to succeed<br>
without any additional layers.<br>
<br>
The correct thing is to define a PACKAGECONFIG, and leave it disabled.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB1011013658016E710A5754F309B75ATY3PR01MB10110jp_--

