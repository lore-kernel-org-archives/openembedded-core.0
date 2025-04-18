Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCAFC369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 07:34:55 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web11.7384.1744961685916328528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 00:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=yQZ462Q+;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1744961687; x=1776497687;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5sFcyxNdfBHgJrTlJqJgVbnR4dtNVT33VyYMNEvf+rI=;
  b=yQZ462Q+cUi5/jIGDAg8MVR5+RZk0/dkWTUrUDS8MIfjRTeydJ2IELXf
   4E/2oyucH8IQnZiCq7syYEc9lI02mh4oNn9CNEO+PbrX9snJTwgsmCvkv
   aWn8kA1UN6H89ZT1++rfq9mlxsAZYz1MLh79z08Og/iSAGJ0xrQDX8haf
   AQdHFbBzJMtareJz+msajvaSfwBduEODIzWyIo42Pah+dIX/kuglnJBJW
   rEJtl0IwX128pS1eRECzrhSR3WqJ0DcoeLUL6JC6iffR8FvvuQXT84VpL
   8D3rsZWJ+9vnXa/6zEWe+MxM3I2fNWc9rv/BVYiGJwaYhqV7l6LmfGF+K
   Q==;
X-CSE-ConnectionGUID: F1dVabnYTPaXM+9kSY6WPQ==
X-CSE-MsgGUID: Tnvd7cxPSwG6uxznlSsC0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="153093073"
X-IronPort-AV: E=Sophos;i="6.15,221,1739804400"; 
   d="scan'208";a="153093073"
Received: from mail-japaneastazlp17011027.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 16:34:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0bl2mv4PU/LGz3up4RZWetvWRE/eYWggE9kP5T5j1ARlkzbwX75vXaplX4fcPi0GZkxqXcTNxVljL2RvvrPgzFihZB9Hta7/3rgKn0lGX2LZX+/UDrQa6aTjL9aZWJ7f7pRqXp4N8aoLotpO8bcaOk0jZWH69qAyhI1lpTtYEANnO+dN9ok8BdbNyTCrWnpzfGFxVygfqindK0bmTY0pxTHi08i0zyuTIErcafX1BArnjRq5IBhpXiyf+/8qSR9ZV9TTYFz05l8PbbRX1aalz37OaoH56m4SahmAuxUM+hwhC3iEEJvBh3dUQTMyAkmUfKz8SrNp5e+p25EOhVn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sFcyxNdfBHgJrTlJqJgVbnR4dtNVT33VyYMNEvf+rI=;
 b=Bb+xOA8+YTfbj5aLu8U/neK2bdx8Nk5FUPH4BL6s5KnNwuvfgXdpNaGaVU/oKNLQ78VuaXK5u/zLQF9v2xu3LzRElP+t4PpuxJZh8tTVKsBG/l72hv+B354vTm/cRIY2bSbCMF4upmWxJjwAi0sZ26uZ1t2bqdwJu/SYM9UzaRQFxTcGmFPLF22MXUNZ3rC4wBpa3Cc8V+R+a7jVJvBY+Zh2nBjD6WV4w9kMez/3zgRmNKANmhPRGmBQBR5Xwnmz80kGLU3vX/HsX/K4mNEQvMSK2Up9QdNON7sz3EhCw3g0IepWQ1tvKHp3KfphxvqWImFglV79CN89lhLLGIgTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OSZPR01MB9596.jpnprd01.prod.outlook.com
 (2603:1096:604:1d1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Fri, 18 Apr
 2025 07:34:30 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 07:34:30 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Jose Quaresma <quaresma.jose@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Topic: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbr36rarxnpp/XVkCsCoJrzyeq4rOnopYAgAAHKYCAAAeNgIABV8me
Date: Fri, 18 Apr 2025 07:34:29 +0000
Message-ID: 
 <TY3PR01MB11056626CC23D8A6C87F0670DA0BF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250417095402.762-1-leimaohui@fujitsu.com>
 <B405C158-14A8-4AAD-9F0E-302D53EFB8A9@arm.com>
 <TY3PR01MB1207152E3206CDAA49967024AE8BC2@TY3PR01MB12071.jpnprd01.prod.outlook.com>
 <03A30531-74C7-471B-ACCD-AAC97899CB04@arm.com>
In-Reply-To: <03A30531-74C7-471B-ACCD-AAC97899CB04@arm.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=True;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-04-18T07:34:29.589Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OSZPR01MB9596:EE_
x-ms-office365-filtering-correlation-id: 04fa664e-3b2a-4e4b-b43b-08dd7e4b748d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?R0ZjS1FHcms3cnhQZXJwMHJvK0Rudk5yNVJoVWFINUhtR1pWcGI4UVhLaUk3?=
 =?utf-8?B?YkRUVlFZV1VDVThaalY1aitzMThSV294MU14SnNBQUtaVmdNbi8zWnJjUlBa?=
 =?utf-8?B?Vm9XTytTRGNyRUFETTdJQ1k5Y3BmQUdwWG9wYnppUGtQQU1iQ3hMYkR5QjRM?=
 =?utf-8?B?VVp1TlJwOHVQbTBrV3VHUTczTHdwQ0FsNHdXQXF5eFhuczNKdFBmSUcvYWVR?=
 =?utf-8?B?Z0pCaHJWKy9IQkJISWxLNm9wMGYwazRoa3hmVDJxNDdmdDZhVGpPenpMQjBE?=
 =?utf-8?B?N3VJaXhUdUJXWEJ5L2wvQ0dYZmJEeXVTR0M4MDlHRnVlaWJWTVl1TzMwVlhD?=
 =?utf-8?B?YUdjWmpzSThsUVRMT0E2VEdsNS9xWDZja1NDUHBxWUFsZjJtTmVGd3hiY3Ra?=
 =?utf-8?B?NEpzcVE2NGxmYmFhVnNtRVR2TkRRSndqYlhua3ZtZXA3Q3A2Uk1waTRGb2xP?=
 =?utf-8?B?eE9HWk5XcVliNVYrcVpLRjYzZ25idlNvUTFSMXpJbDh4ckJVUklGbCtUbFFU?=
 =?utf-8?B?eVV5blhtMVIvMDhKWGN3Z3A1cmpGTHF5R0VqVDErTmpYcVFnbDMwdkoySG1X?=
 =?utf-8?B?UExyQ01EVkN0K3FTNE44VHJnb2x6NGVUQW5uY0d3Vm5yNVV0Rk5QZEJDMmpK?=
 =?utf-8?B?c1JYMitueFJmSTRBd005a3pTOWtMemcvRGg4V1Z2S1VJWGtUcHo2WVRpZlN6?=
 =?utf-8?B?SmZpbjZSSS81Q2IxZWpZOGZJYy8veGt2ZnREWmpZeHdhODMzakdhWHpnbjdY?=
 =?utf-8?B?ZmlHV0E2S2taOWdkUHBTQkVlcFhkdWVnZEl2NHQzY3pQNHhlcjIza1hQUStS?=
 =?utf-8?B?bmU3d3hnSWt5c2kzaUZUTDVRYWY3Z1VXL2JDOGRVTzNXeDJxQkNWM0FycWVi?=
 =?utf-8?B?Szd1ZHJ1Ym82WHZOd0IrSXVBRy8zWkZySHVQb2ZEUjN6N3JUVGE5T2RlZlAv?=
 =?utf-8?B?SWE1R0JnWUlQcTVHY3R2UDR4eXlnZEVmL1VkTmhsWEczOG5ESFQwV3ZJbmZt?=
 =?utf-8?B?WlVHN1VMRXF4MjFqdWRMYWxBVlFHam5PczRJQnRnMnk5NTNpNmhEOFlxc29t?=
 =?utf-8?B?L0oyMW1OSlRFYVR5eDdLV21maG1uYzBwTkdqN2lxNktMOGVwZmpXUnpTNFJw?=
 =?utf-8?B?TjhoZVNhWE9kL0EvbmQ1MENiaE4xSDMrN2NveXhVSU9JV210TTJtR1VqNld3?=
 =?utf-8?B?dmR4KzUzMC9rV2hGcUpxNUkzYi9JblhCQlV6LzY4MTNKY0VSam5NOVk4Vmox?=
 =?utf-8?B?MmI4OEpJSWYxa3ZVdkEva0grS0cvbTQ4bWtrdmZXTjRUTjJkSTVuQS9yRU1Y?=
 =?utf-8?B?Nmt2Ymk3NkZ0R1l0TUFrRnFHcmJOMjJNNkx6YUNzcEVhRmtmQXM2dUQ3dnJt?=
 =?utf-8?B?NDVmV1pNWVJ6ZlJRVlhhMVlxU01wemczcnlzM2Jialp5ZDRsSGV1NDJ1YU1E?=
 =?utf-8?B?RndWM2NlY2RmQzNtVUY0QnBDRjVXMGNWc2g0WkRFOGxjdzk3d1hHbVZ5cmE4?=
 =?utf-8?B?L3hpb0V3QnJvSUtIbElnZmJIaDlESWthTkRtaGZhcHVxOVNvS21tSXBWSGFp?=
 =?utf-8?B?bW4ycFhwbXQzRkxGQXVxTjBieUFLN0docGVrcFpZK2sxUjlXMTNiOHovdmRy?=
 =?utf-8?B?VStaUzVRbEF0L2RYQi9DRXZaV2hlK3ltZkU3L2N0K0oyemVoZVBXcEFaV3d3?=
 =?utf-8?B?VWxVQnFmdWh5dE90K1N3NERhZ09JRGF2OGU5bXhIUVZ2UjJBNXpTeTJNNDB0?=
 =?utf-8?B?eXhKVFRNL2J2UGFTN1EvbEF2R3lkUzhRN1czRGQzbkZGZWYxcXJXWHhueWkv?=
 =?utf-8?B?dVN0bXJvUyt5NE13Nnh5NkdNTTB3bS9BTGQ3UW5XTGdKN2hMbVY3VVdIcXhG?=
 =?utf-8?B?b1RqazVUVGFJRzhaaHMzelAvekhvSUdGNkpNTS9zSmJsdU1wMjNqREFiODly?=
 =?utf-8?B?ZEtGVldOQmVOYmpGTVJMS3EydTNDNjFzMTRrcEdnS2UwU2ozRWxzNVA2dExP?=
 =?utf-8?B?eGtrNUp0NVdRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QUZ6Z0dQNXIzT0pTY0FYalc1L2tULzhHdVY1U0Y3VFhxcXVkVExSYW5LUFIv?=
 =?utf-8?B?TFk2TENyeElOZmRKMVdXYzNZellRaEV5OVdwZkMyQXdIUkFXVk1WbnBCbFVK?=
 =?utf-8?B?ME1Cc0RtQmozOFl5YTZmRTNKLzBFcko5dGRsQXFhbVpWVXNoZ0JVM2s5bS81?=
 =?utf-8?B?dmJIK2Z0WWRpYW1VOEpCVnFQWEdZc1JhR2JPV3NCeS9tM0FxQ1BJbGxsc1VU?=
 =?utf-8?B?TDl2U1VyOGdxRjNKVWlaZ2YxdXRMQzE4U2drNHVyTkRuemV3ZmRJa3EyOUNv?=
 =?utf-8?B?NDZ2TGRCQzdET1V1bG1McmY0dUZ3SlcrNzVuUW9hZis2RlBIS2xKanN3bnBY?=
 =?utf-8?B?dkpJbUs5YTJIWmRhTEFJVDdPcFNuaXVsTXRUVFdCY0dRYzBhMzhpcnI5ZndI?=
 =?utf-8?B?V0k4Y3FZZURXKzJScmlHRWgvTmRLMkFqdDMvcitzTE1XdVdmR3NGWUIycEJv?=
 =?utf-8?B?clBBL25pODVuY3ZsV2ZRcWNKQS9McklvTENGME5LaCtSSW1mSnIyTFN1dTdR?=
 =?utf-8?B?RFZwMjVIaGoxYVlkbVlFQjFxOG96Wjg0VVBJY3l4Qk1XK1pSNXdzTElTckkx?=
 =?utf-8?B?OTBlNmI3TWZwWWZ5SWhaVmVGZ3VHb2Nid0JMcHhLU3lJODFHM0RpM0FjS1FC?=
 =?utf-8?B?YWFSZ29KWnZVOWRQbVR0RjBEd1FwdDZUZWpBZHNWcWNyYWE3bW5IL1IrOGxF?=
 =?utf-8?B?dzBMaHBuRldLYzhIQ2lCdW5HcXAzZlB0UXF6RzduQTYwTFpVNk9OaXRQNFo0?=
 =?utf-8?B?M2xCUkUvZlhQa09mVWtlYjJ3b3BLd0ozcHk0aEJhNE9hWDl3YjlWL0d3N09r?=
 =?utf-8?B?ckFvRmh3OGNXaU1OVWkrbE04THl2Wm5OVG41UzlNbmZWLzJZdjY4VzJncWxt?=
 =?utf-8?B?ZFBvR0kwTXFUTlJmMmFUNjhMVnA0cmhUbnhTbnhFT3VzWnJBQnFvMDVud0Yx?=
 =?utf-8?B?WjR2eFd2NUFvbFNFRmdhL2JiU0Mwck5RaExxc2t3d3FYemVKZzhLMXJCZ25S?=
 =?utf-8?B?RkgyM0pyVExqRHhheFNYVTQ2SkhHWDBoc2RzSzBrbXZtY2lkWWY0SEw3R3Ry?=
 =?utf-8?B?d3VKbkpwRWhUelFxaWFyeWlqL0k1SjBiUTRUdzlLYWZOTFZ1WGNRNnI1bE1O?=
 =?utf-8?B?R0x0NnJRbDFpZzVPQzNkOXhaamc4Nm56djJ3NWI4YzRWSitYTHg3QzJDQW15?=
 =?utf-8?B?eDRieUpnWHVzWVVsTDdBaXdnSmxUSndlb0NqeUpwdXIwRlFKVjlvT1pwR0lp?=
 =?utf-8?B?Y05TSzNudlN3VXdoUDNCaXVDT251bkpnMXZCcjdHMHFsNWJJODBpZXhxSFJG?=
 =?utf-8?B?NGJsaHRmeWZjWEZRUWkxRm1XVUtyMHRlVHhsMFNNdVVCRmxLa1BOZmFLV21X?=
 =?utf-8?B?b05FZlpvY3k4TFNpaStiSCs3UHpGKzRkbzAyYmY0VForWkIxbWZFNjlDNS9O?=
 =?utf-8?B?ZVRvRmMrcHF4d0EvMFZSTzVsRWhtVEE4U09PM3FTdUtDZlhrUkh2dWlzUU83?=
 =?utf-8?B?NDNseUVuV3MxOVV1ZXdKWVZUTkJTeFVVdlpMUXdid0lBQVNFcmFMUmZZK1B4?=
 =?utf-8?B?SkRGR1I4YVdHRFhISmhMQ3ZPQ3lDSGdhUk5meXFHazRuMmRmOTFTakpxbGtU?=
 =?utf-8?B?blhFNWVGa29hUFJwczM2WW54aW1zcDdWbks3K2VQbnJrYTBad0JiV052Ynla?=
 =?utf-8?B?RTNmRGw5U2RGK2NPZjNkbTJOUlFYdEs1TGpnMnQ0V3hZRWgwTnVwOVpCcG41?=
 =?utf-8?B?cmhUV1FBNVVmbk9qcFZWek4ra0o0Kzlqais5RERtRXlTUjRSNXlQNG56SUdp?=
 =?utf-8?B?OEE1UDJXZUswTmNzZkFXNE9QU1M1VUVVMEZRTWs4UVFMLzlrQ1lvSy80czFN?=
 =?utf-8?B?OXlhdHIwb1QvYXNXbExqU0pyK0FRQmVVMnZBWEthK0VLNENmTlpvVWUrNVJ4?=
 =?utf-8?B?TmNrelp2MWIxdEtWeXNXMTJmMXJCT1RpRVlJK09ZaUZ5cEt1allwQklSdnZH?=
 =?utf-8?B?SXNZWW52Z1N4M2NmRW1vSmZGRlhuYTZuVEhUMndMMTdxY25DbHlDVEFhdERn?=
 =?utf-8?B?V1VaNjRiSldjL3BFZnNRRkxqU3JNelZBcnlWcTRsZWFpWk9zeVc1LzE3RkFu?=
 =?utf-8?Q?SOUn5LQjaRXhlVbRC03Txa0dv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	p0E/Ql6AxLzmC74CNTS6V1UZHqD5F5oApOuyfBAeUMnR1zCT7oDcxUocZdfmNwDQc7iqHG2/JKYHa8nbXuiHge1RDbCGDGVEltb99kozLEDlkXtSe8O1Qus9orU31rPcrU/ff2sCDlJOn+OWfDXmsVhzlDPnHoc6ejMBBIvznyEGLGnEpOAUq+pbh6LHbqSr4TXatWJkOHG04nuCchUI+LBtvoSOPCXns/Wf6V0hXEA9hEpdX49uzLdiwzr3mUqhyug02AxS/B6LmMiy5qaz4rz2ADdYXrLH3nWOhL2NTQwSt88WnPlQUru5H/qUHLWOQunsjV9WcFA7Za4OFoBOWVjXvQl0uymG0e6aYfHn/J6eR3RAGy+T9VJUYID3ukg0LisKsl7s5MTQF8eN/S8uvpp4tASNjxbHVoozdUHL4Q2scCOLbC67pRp9uhN5c9KrrjdQn3OwUhcYunjQzp6Ledm9cDioBPc8XlnSLiOQg0+traAAVsE0ll/L1rk96mGjbD5bMCet7TwzzG8/RljIfUMR9vio25km4WkoI6VA2yqPciErF/+mof3veDF18E9MkjjZX5bp3u+PWuY8NZbrxQ1vI+pb8kpuWB9PBLlzGxxFiMJVLO8abYfcyNWP7Qi5
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04fa664e-3b2a-4e4b-b43b-08dd7e4b748d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 07:34:29.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DnKOpLlIJdx2D60JJrPfM9+PkyaoaDpTA3I5YkfDY7x/ZO0RLuE/g9Cr+YAxPfvDYg9FFIOSxOzKWxKjroBrxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9596
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 07:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215122

SGksIFJvc3MKCk9uIDE3IEFwciAyMDI1LCBhdCAxMTozNCwgWGluamlhbiBNYSAoRnVqaXRzdSkg
PG1heGouZm5zdEBmdWppdHN1LmNvbT4gd3JvdGU6Cj4+IElmIHRoaXMgZmlsZSBpcyBkaWZmZXJl
bnQgb24gYWNyb3NzIGFyY2hpdGVjdHVyZXMgdGhlbiBpdCBzaG91bGRu4oCZdCBiZSBpbnN0YWxs
ZWQgaW50bwo+PiAkZGF0YWRpciwgYnV0ICRsaWJkaXIuwqAgQWJ1c2luZyBtdWx0aWxpYl9zY3Jp
cHRzIGxpa2UgdGhpcyBpcyBub3QgY29ycmVjdC4KPiBCdXQgL3Vzci9zaGFyZS9naXItMS4wL0dz
dC0xLjAuZ2lyIGRvIGRpZmZlcnMgYWNyb3NzIGFyY2hpdGVjdHVyZXMsIGFuZCBpdCBpcyBub3Qg
aW4gJGxpYmRpciBidXQgJGRhdGFkaXIgCj4gaWYgd2Ugc2hvdWxkbid0IHVzZSBtdWx0aWxpYl9z
Y3JpcHRzLCB0aGVuIHdoYXQgd2Ugc2hvdWxkIGRvIGluIHRoaXMga2luZCBvZiBzaXR1YXRpb24/
Cgo+VGFsayB0byB1cHN0cmVhbSwgZWl0aGVyIGl0IHNob3VsZCBiZSBpbiBkYXRhZGlyIGFuZCBu
b3QgY29udGFpbiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgaW5mb3JtYXRpb24sIG9yIGl0IHNob3Vs
ZCBiZSBtb3ZlZCB0byBsaWJkaXIuCgpJIGhhdmUgY3JlYXRlZCBhbiBpc3N1ZSBpbiBnc3RyZWFt
ZXIgcHJvamVjdDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJlYW1lci9nc3Ry
ZWFtZXIvLS9pc3N1ZXMvNDM3NwogCmFuZCBtYWludGFpbmVyIGhhcyByZXBsaWVkOgoiLmdpciBm
aWxlcyBhcmUgaW4gZ2VuZXJhbCBub3QgcGxhdGZvcm0taW5kZXBlbmRlbnQgYW5kIHRoZXJlJ3Mg
bm90IG11Y2ggd2UgY2FuIGRvIGFib3V0IHRoYXQuIgogClNvLCBzZWVtcyB1cHN0cmVhbSB3aWxs
IG5vdCBoYW5kbGUgdGhpcyBpc3N1ZS4uLgoKQmVzdCByZWdhcmRzCkxlaQo=

