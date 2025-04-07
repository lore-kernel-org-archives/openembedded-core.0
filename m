Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8998C36002
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 02:28:25 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web11.37616.1743992898506085512
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 19:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=avZjDlo0;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743992898; x=1775528898;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aqCXyL8jSXcirWlYptpt6bIthVtkJMehMzDBSER8HtY=;
  b=avZjDlo0zjGPRl/mVvuxyVsmENcB61XvNt/FxucXpajBWUfZHq1AMeq4
   pizwHyC6sUvv4Ues9RPyioubFczNErab+HqW4rQkp93Ov/i2v3q1VxOG3
   JYjRev3VG0d1hbLkXc0HD0VPCepdl+xVTC9uonMzqn3IeS1q8cXIPICMX
   yh4PcT28rKBLZlDDYS5AYl6jnwy5qtKSo/w7CfZgGcHAg5KXw8765lBtA
   nQXsfrqqSn01L85H1haPdOJZ75v9wG8HCxh4Pl6VHySeBZc4iBMgpjABi
   xBf63nG+pDwcb2def8HzsmQgBd92LDXjayJWFGzPwXaNW8LAqgqwbeTo7
   Q==;
X-CSE-ConnectionGUID: 4p5rlKTITuaj+/WNLkfqVg==
X-CSE-MsgGUID: tN7jIDDLR8qJipyh6WbIRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="63029223"
X-IronPort-AV: E=Sophos;i="6.15,193,1739804400"; 
   d="scan'208";a="63029223"
Received: from mail-japanwestazlp17010003.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.3])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:28:15 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ws6yOgyTx4XWjgCLru6S2vsOkP48CdHZjmjahv04VwAEaK+ZtZbHfG2D8srG2tKmFxR9mq8Cj0cLiQ4ACpZ8+DN1hMABTqNiJMeKD5SvYlohnxhHIks/+ZE30u58KVXfGRI/ISsFrtCDTdE5IFtQB65OeJE70WxN3LzouNGuKldPr8WPDuD6qkzNRr1vD/5OtV+mHY8Box9lZ6yF+CF11B1nFc9cTSXeMCdQGzEkaShUdoI6EjNivN1clUYWxW1FIg8BUZuMbQq/jrjDSgxS0QGt0fLoPetBQUkTr2bbVOFi1ObMWiANaJPF+6M+d7kFeWdEuZEO2NuapmHEtsRryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqCXyL8jSXcirWlYptpt6bIthVtkJMehMzDBSER8HtY=;
 b=q0i20Yc6UlAD4VlA86aQM/bv5nQy6BFpJmaJDm4GF/m+0k7y3U1jyBFfO7ND9uRkKfu37okZOV7x+AaD1KeNjNPQIWTPtl2iy6fYAmIGw3IX+nZX/CpyjghuoLBRb4OsdAWFvBvLZvP7eQtYzGZh5z6Hz7cO5AjuLxn9z+VkKSH4U60LNUs2i7GerZ/V1LF/0JatGaZyFsPQh6A74BJN5JL4Wh+rbrmUm1SHAmYjC3QVzvNdxtd+dxYk13l0Mh3hFeajgxbuupjuV4+ZypWYSJOXGhVfEu1t3WoKXA4RYhwB76TgvnVTMjmklw00kfHg6nP5Mum0TeF0t2vJnMP2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS0PR01MB6401.jpnprd01.prod.outlook.com
 (2603:1096:604:106::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 02:28:09 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 02:28:08 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Khem Raj
	<raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 2/2] python3-pdm
 python3-pdm-{backend,build-locked}: move from meta-python
Thread-Topic: [OE-core] [PATCH v2 2/2] python3-pdm
 python3-pdm-{backend,build-locked}: move from meta-python
Thread-Index: AQHbpEPviuRY2GL9jkmlhDrnHM/r4rORl6oAgAXpH9A=
Date: Mon, 7 Apr 2025 02:28:08 +0000
Message-ID: 
 <TY3PR01MB1105679875F3D2150926E40E0A0AA2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250403025551.2159-1-leimaohui@fujitsu.com>
 <20250403025551.2159-2-leimaohui@fujitsu.com>
 <D8WUP0YFP44E.1R84PVEYQIAT6@bootlin.com>
In-Reply-To: <D8WUP0YFP44E.1R84PVEYQIAT6@bootlin.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9Nzg3OTM3NTEtMDIzYy00NGYyLTk5ZjEtNmExZjJmZmQ1?=
 =?utf-8?B?OThiO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTA3VDAyOjI3OjU1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS0PR01MB6401:EE_
x-ms-office365-filtering-correlation-id: 268d1428-6072-43d9-65dd-08dd757bd5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YllrdVNKc2srZUs5cHNDS2pET3pNYXlFOWh2TnRaWFlFdmU5dkErNjNiWEJy?=
 =?utf-8?B?bE1iSmZ3aUx1ek50cW10ZW9HNkcvL1VaekZEM1FCY3JSVGgzZ28vM3dMNXBt?=
 =?utf-8?B?eDRQWXVKd0R5ditXLzI2RWFBK1hDQ01QeURWNmhxZ3hoSHFGamlXeHA1ZEI4?=
 =?utf-8?B?NjlySmNBeFNKUDRLL1B6djZhUVdUaXpVS2JmQWFjdUJtWVkrc0VibGt3MFcx?=
 =?utf-8?B?MlJlcU1yWmYwcWVnQm5UcWFONUVvT1Q2SmdmenBkREVqR2dSNlR4cWxnaThB?=
 =?utf-8?B?aXVVUGdwZ1JVRkU3K2s5a0NWMEp6UGpLaEM5RXlndnh5Tm0vVFZUV0NJUTdM?=
 =?utf-8?B?KzYrcStzYnNxTEVDZm1XYkh0ZXpNamdZOEtLS1gyMXplbnZKLytWN3E3N016?=
 =?utf-8?B?akowV3plaGpHT0dyZzhPdUJNa1RxZ3BEWW9rTXhqMnpIS0ZPNkdHREp3T0Y4?=
 =?utf-8?B?UDljTW9FM1dVVzJaZ3M3U0lpUTRVc2ZscE45ZVppcGcrQmgvRXRxTzh3TTl0?=
 =?utf-8?B?bFZOd2h3N2pMTVNPR3hISCtURE9KRi9JVFlJWGU3cFZrZmpNZEU4NXBkY1ZK?=
 =?utf-8?B?emZuYWFlQkZiTHJQOWxwS250djl0QUZqVEdyc1VaZzVIcEJ5UFBSc3I2WE5Z?=
 =?utf-8?B?SEJGbnVNZ2NLeTV1WVF6dGN6dDRzZnpwa0FKZGYxb1dmNGVBNW9GdmNHTG1M?=
 =?utf-8?B?elpWNklMem5kaW9oZUZmanoxMlBZSnBBaThYMVdlRGFhS0tFN0lyZ25Vamhn?=
 =?utf-8?B?VlczQnpCcWhScjRuMm9iblBCcEoyVnlpcFJzRklIR0NxU0pyY0tNVVlXYjdV?=
 =?utf-8?B?UG1GbmlHTjJXRDNjYnF1Z0VhMFJhSU5waUh4aFljZElTaXN1bFFFMWVrYWw2?=
 =?utf-8?B?RWNXWXVxQ1NDdS80dXhUREtUeXBkMTdsZlVBSElvYTVlRE83K0ZKZTNxZWVt?=
 =?utf-8?B?MHRsbnZQZlovWVJwRFA0UVdjVFZ4Q3VnWW5Xemp6ck55b1UwWnFqcVViZWRm?=
 =?utf-8?B?dCt0cTNJd3E1cDZwTEJzS1c1ODVDWUFkMktvV09PeldoZzZnSDNuWFlMTmRM?=
 =?utf-8?B?MmZUTThFU3FSM01xbTJ3N0lFQ3pXWGl0TXQ2NWhNemZWem9rTFZoNkgvYllP?=
 =?utf-8?B?aTFTSG8yR0wxcVpyb3F5NnlhWUhVOVJISExPZW5OVEowOXhmWmF4U1RWL1Bi?=
 =?utf-8?B?WE9yR3o1azZEdm9rVDNoQlJRYlJmSWd1Nk00T28vcGZ2SXJickE0OEVFWWpL?=
 =?utf-8?B?TllmanhzL2s0UUlvNmdILzZ5UE5pU3JZM1JaMWVSaEI5YWlYYVpJalNYTTFi?=
 =?utf-8?B?dHZSR0tBZ3QxN3QzYjFuZkJZRitRS0N3Vit3V3ZDdmYxc3l5NHk0azZCU2E1?=
 =?utf-8?B?TkgrVWw1M2RwaUxRam9hZHd5cnhkSDB2VlFyd0pqSkRDT3FmM3JPbVlRMUtu?=
 =?utf-8?B?cnl4QUl6YTduSE9uREJiZUhXM0xDd09uU3RGVzhrTUJHODRpeElGc0ZiZFdn?=
 =?utf-8?B?Y1NkSmFTdlpUOEluU3BtNFZNOWlvNDZlMEFxZzhtYWE4dG5zZFBIbDNudmNE?=
 =?utf-8?B?cTYvUnNBNmtPeEFPU0tVbEM1WWFTZ3l5b2FIM05kYUcwVTg3RlZZbHhvc1Nk?=
 =?utf-8?B?YVhsU3MyVmU0cnpESTBLeHk5ZHBXc3ZhQVFPOEhYcjF1SHlEYTVQRXExM1JH?=
 =?utf-8?B?cXNOajhXY0o4bWNNWDFId2ZWYWg2THFpclhiQTMwN1pTSy9aQjFxWHJ2Slpy?=
 =?utf-8?B?Ty9KUVhjYTVpb2NQY2NvTXFzSElnTlZRLy9xZjFhUVlMU0haajZ6U0JjNzBH?=
 =?utf-8?B?WFNEY1NZM29XeFp3ZS9hSktMVW45blZ2Z0xiaDA2MGJJRUhub1J6b0F6RDZT?=
 =?utf-8?B?Rkc4RU96RG5TUHU4QzhXNTRlc1d4NFh3bTVDMld5UXlFU1E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cURKSjVyVUoveUZEN3FzSDNER2s4a0tYeWlPUnpqYjhJbjJ2MWptaVY3bXpj?=
 =?utf-8?B?NjNKektTQzdrNTV4bEhzSzhCNFJackh2QWRManFmTTBrVWNnQWxmYW1LR3Mr?=
 =?utf-8?B?NG05ZlVoc0NBNHovdksrVEN1TlVHcGxWNXVGcGg1TEp6TlNpQWZaK0R4RXAw?=
 =?utf-8?B?andtR1pUanlYM1NnUkJEN2lXeWdsdDB0UytqdkVnZ2YrZzF2RzUyQVlnZlpI?=
 =?utf-8?B?TDVnOEFveWVDeWFnWjhtNENjeFIwaTFFN1lYUE05SmlUNGJqeDE1bTJFeXV0?=
 =?utf-8?B?S2FwYnRXZWMzdm0wK2xkTEhFTkU0TlJGblVha2JxMlVzYmd1dlJ5VEY4UWJZ?=
 =?utf-8?B?WHp6eGtYWWpxOE5yYTQxRjNCcFQzTlhDK3JPYzBQakh0dWJYWXZLeE9UU2FQ?=
 =?utf-8?B?Z01NK0UrWnB2N2Z3TFdaQUZaaEc4NzYyUG5mMnQyWDFyd2ZDYjFoQnNEdzlV?=
 =?utf-8?B?MVVaUkR1b2NNQlRNTit3enJRU0ZLd0RzR2MrdmVlY3lRd2d0eTVJT3lBQlhx?=
 =?utf-8?B?UUJwb0Z4TjhhOG5IVkJCRXQrbmhJOHlQcVVaODYyb21HeUxhOXJJQ3h5T25h?=
 =?utf-8?B?b1VqYjVodi9YZ214RzZrSmthekZMckZCN0ViZFhUdWdxZEVkQWUyOEdZUmhh?=
 =?utf-8?B?NG1hTW5qeE50YmpNNVNRRk9tWTFGK3pOWnZrT0s2ck9iZmVwTFdIYys0ZGlk?=
 =?utf-8?B?aExBUWRJOGx5QkZFcnh0bDMvZGJ2UmlYYzl1QUtPM3RqQi9ZWnlRUGNWUm80?=
 =?utf-8?B?OVFpWnd5dUxHSXU1a1FPeTdkbnpMMllia0ZOcmFKRDVrL2ZEL0hOa2J0aXFi?=
 =?utf-8?B?c2s0dnFCYVJyMmdqRGNJSnZUbGszcVhpcTIyZ1NzUG56bjNWL1k1QUh0bzMw?=
 =?utf-8?B?eks1OHU5Y05ZdU5tUlFxSDM1NHpUajJya3kxWTZIc3ZtVTNjajQ4d3I3dVo4?=
 =?utf-8?B?ZGZTeWw2MVJjVFBpZEFqOGdLZlBvZFBZMlpzNTF0WCtLUENTMWFHTVh0WjhK?=
 =?utf-8?B?bmVTM0kxZFJJZFhoS1NrZ0Vwelk0ZnRYRWVWK1MwOW44Tm4yVW9rUlhsRW8z?=
 =?utf-8?B?d2VrT3F4c0g0aUM2MGF1aUdIS3BxeFAxTlB3U2VhMnRuaFRQdVh3SHB6dTJQ?=
 =?utf-8?B?V2g5NWl3TERmY3FPZWlXakFRK0hyblVSZWlkZW02blh4SVg4c09aRlNrZkhF?=
 =?utf-8?B?RXJyanhuUzJ3Z2V0eDNyTVJNN1FmaGFHVVdXcUJycGxjWjhjZHh4QXFEVENL?=
 =?utf-8?B?cWs1b3U2R000VlJpcVVMZWYzVnRRM05jK3lkcjA0cC9uWFdiWU1WcWFBSTZj?=
 =?utf-8?B?VDRyblFvajhxVndLdzBITGliMktNN0ZaT0xZNUljQ0dTSUJEeXFrSnZuYU1q?=
 =?utf-8?B?TWtINXNrdEQvY1NEOVJmN1Zuc1F3dFR1MTNFTSt6MGJBMXBlcXdSTlRRc3hx?=
 =?utf-8?B?WjlHUnlsalEyNU94OG9LVVEvSHp1NmgyMDZUd0lGODgrYnVTQmU5M1daMysr?=
 =?utf-8?B?YktvMkJQU2QvT0JPM3R0SDg3aHVyL0FSUEdXd2t3dHpaQVQzRkFXdEVHMExl?=
 =?utf-8?B?M3NIZW55WkZSeC9YWEtkUVRLc2Y5UGRBaGNvNW5Tc0hQc1ZTNERiMGV4eWFz?=
 =?utf-8?B?UWdZQVFzNXhPNU5ydWJya2FWMVdLVndvWjJTYi9IYW8xd2J2SWR4NWtKMDFZ?=
 =?utf-8?B?QVJ3T0JHZW5mT1J5N2hRa2JxOTNHRVVCWkVCTHhOMXZqTnNIRUhEcGwwZTN1?=
 =?utf-8?B?QjdrS2tKWEthMzlGOHpXOWZLT0pYb2orejFyZGFqc3BHdG9KbWEyUWxsV2Fa?=
 =?utf-8?B?Q3ZDalpsWlQ1aHRyUlFVR1RKeWd0aDk5OXQ2RU1iMWFuUFVzcFQrUWtoblFz?=
 =?utf-8?B?ZDAxazBMRktZWHFvcUVaMjNzK0RtcFJBSnp6WTB4aXhJbE1xakRMV1YzVkVj?=
 =?utf-8?B?OEpHWmRQU2lqbExDMTAzb1lIQThoNEJpQloyZXhVd0VQRUR0czRVMDFCV1d2?=
 =?utf-8?B?eXIzVkxlaGQzQnpzTmRSV2RZdGNNWmwzWlZOeTIveitJdjNxd3lsNkJNMmQ0?=
 =?utf-8?B?R1ZtZmpGSlQ5ZGJNNHA2UzVPNTU3VmtVdCtjb1RJWlNUTXY3L3M2WVhJOUVS?=
 =?utf-8?Q?qGoqu8QzZsf8vIg5Nxblwz4bT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	275hLYBar8SG2MusPAIIS4dzEh+15+EiTQEhgOWoOwsI4GKVLfhdmWKcBWbiBs4jH9ncYRfhhOPavh3txcR625nf67+QmMqzCDtphcNUU5C5ERMQnR5wkVrRV/oeBZTBG4puBN0Tbz175p6fCY+QpQlxMzuO++58q8YUkel3+fSUWNDZJEAWo/TDNHfVfQEAZNe6gyJHT/qhqgX/iwbIQYA+ghBdrC5J/am41f49vX0pG4Vsg0P04BchKLb82AFvTH2qa5R71acBc2mN+IHXoKCGAIS5erqgyceV7JP0Y8irp4NK4Ec/XDvD3ZI6Ux/z/V4IpVAaAdrxwM9UJrNYPirDMY8hxnPc/K+FhJuLuxKbieSlqx1hBgv61d//PJK4n9roOus8cXqRKoenG3AUpOL1sgOEovOtU7XO51c3rIqsUInuKzGG1vp4aNIrK/mbeVS1It45NbUP0lizgTQE8ITdNvMQdwf4VBtH02fji7u7an5N97eCiRMcivVX1XAJM//9XfvtKvUMCszHwS92NPwp4d2N4p+vnywol/yKeTxEjpCimDZM8xPmwd090oyevdZi9k7lGN8rrsC6OAr6Upjq7znn3rd/RDVHkPySjFATQ6yRMNPlxOzih18/lwjo
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268d1428-6072-43d9-65dd-08dd757bd5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 02:28:08.3761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5EmFT2q/GoIxT4B1b66dHoXcRmE+qYGUnJcA4oWOx3fiz9/vGweAIJbUme/IniATL4XVIocXvvhiEksKAfRnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6401
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214391

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBBcHJpbCAzLCAyMDI1IDQ6MTIgUE0NCj4gVG86IExlaSwgTWFvaHVpL+mbtyDojILmhacg
PGxlaW1hb2h1aUBmdWppdHN1LmNvbT47IEtoZW0gUmFqDQo+IDxyYWoua2hlbUBnbWFpbC5jb20+
OyBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjIgMi8yXSBweXRob24zLXBkbQ0KPiBweXRob24zLXBkbS17
YmFja2VuZCxidWlsZC1sb2NrZWR9OiBtb3ZlIGZyb20gbWV0YS1weXRob24NCj4gDQo+IE9uIFRo
dSBBcHIgMywgMjAyNSBhdCA0OjU1IEFNIENFU1QsIGxlaW1hb2h1aSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBweXRob24zLXBkbSBhbmQgcHl0aG9uMy1wZG0tYmFj
a2VuZCBhcmUgZGVwZW5kZW5jaWVzIG9mDQo+ID4gcHl0aG9uMy13ZWJjb2xvcnMgcHl0aG9uMy1w
ZG0gaXRzZWxmIGRlcGVuZHMgb24NCj4gPiBweXRob24zLXBkbS1idWlsZC1sb2NrZWQNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4g
PiAtLS0NCj4gDQo+IEhpIExlaSwNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1wZG0tYnVpbGQtbG9ja2VkXzAuMy41LmJiDQo+ID4gQEAgLTAsMCArMSwxNCBAQA0K
PiA+ICtTVU1NQVJZID0gInBkbSBwbHVnaW4gdG8gcHVibGlzaCBsb2NrZWQgZGVwZW5kZW5jaWVz
IGFzDQo+IG9wdGlvbmFsLWRlcGVuZGVuY2llcyINCj4gPiArTElDRU5TRSA9ICJNSVQiDQo+ID4g
K0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE5MzgyY2RmOWMxNDNk
ZjRmMDBiOWNhYTBiNjBjNzVhIg0KPiA+ICsNCj4gDQo+IFdlIGhhdmUgYSB3YXJuaW5nIG9uIHRo
ZSBhdXRvYnVpbGRlciBhYm91dCB0aGlzLCBhcyBpdCBsYWNrcyB0aGUgSE9NRVBBR0UNCj4gbGlu
azoNCj4gDQo+IFdBUk5JTkc6IHB5dGhvbjMtcGRtLWJ1aWxkLWxvY2tlZC0wLjMuNS1yMCBkb19y
ZWNpcGVfcWE6IFFBIElzc3VlOiBSZWNpcGUNCj4gcHl0aG9uMy1wZG0tYnVpbGQtbG9ja2VkIGlu
DQo+IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hLWZ1bGwvYnVpbGQvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRoDQo+IG9uMy1wZG0tYnVpbGQtbG9ja2VkXzAuMy41LmJiIGRv
ZXMgbm90IGNvbnRhaW4gYSBIT01FUEFHRS4gUGxlYXNlIGFkZCBhbg0KPiBlbnRyeS4gW21pc3Np
bmctbWV0YWRhdGFdDQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dmFsa3lyaWUvIy9idWlsZGVycy8yOS9idWlsZHMvMTMzMy9zdGVwcw0KPiAvMTMvbG9ncy9zdGRp
bw0KPiANCj4gQ2FuIHlvdSBmaXggdGhpcyBwbGVhc2U/DQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVw
bHksIHBsZWFzZSByZWZlciB0byB2MyBwYXRjaA0KDQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

