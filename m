Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C69C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 06:55:33 +0000 (UTC)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com [216.71.158.33])
 by mx.groups.io with SMTP id smtpd.web10.7696.1714114529574036700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 23:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=efJU0aTS;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.33, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1714114530; x=1745650530;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8jTBOQIutwHhn13gT09FGHW+FaxA3WE/6uasXrVE2W8=;
  b=efJU0aTSfkr3Vh7plw4nh+PRJQ6yQ8cRaksYHhfvEBzraG12E0rSARzR
   k+TGJvK5QfXaVmVL/uL1MJoip9/PfaBPYNqZuEo9deq1SIhr/FhnvGGM/
   554OZkJHLXmryalo4Fp5PJP8T2oFX9HFWVR+vhy353FaqL9NWCYtePn9c
   D/wT+D/h0z5rw6osk4E1OCFtIIPFY+PLnsgCZAFR/n28vM3SJ3JgdLMQ+
   kSAtVSGzPmcHmxBX3ERXCTj3rHr/88lzCkJTkJ/wlorBiortPzc7TKl4r
   8N9vmE3J8OrPyIe01v309xK/f4HXY1J1baDjLmUgVzcxvyk96VPamwN5J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="117969350"
X-IronPort-AV: E=Sophos;i="6.07,231,1708354800"; 
   d="scan'208";a="117969350"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 15:55:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0EQJpPm7u6M6X1/arQ5NA7r/qouD7o//UKC+wigy/QSsXLCHGdsp3B/XFHwwEq6axYyXKVWputnA05ZIxNkQYCyo7VSTb5nS0r9AjUrdBmuwH7hGikPysqNpltJMlsaoTsq3tvvSS3KTG4FE0o+1FAoQYH6PteUuMLg87I/t1KRwDmKpxh9CZELEjsYUnBiYC70iJULPjfA2HJ8gPw35vYgRgHI8tABzhEqXFA0g9u7UHgRuaR+fBJkCXZ61pIA4WdrQpkBquvJLXu0X+ZKROckBztbICib5TN2uqbaewtVIAn+aHk93gzD+MeCfR2ZUNaCQZgyH/Ddaukuo4PvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jTBOQIutwHhn13gT09FGHW+FaxA3WE/6uasXrVE2W8=;
 b=CbpxHCXnNtYqcrOY/fMJ3N+IKG2qoHFbxID2yA9NErZZcnMY2UzAQKOft2L1IEe6Opw6FhCkJSubHHdyXQPwGhf2XCqIIxzkKfBJpDR1SJttuPsl0x0WJXgZ0loZUDj3Wd6T4C2byCr5/xNA5/4F/rRsYBeRbPGDs1/nGAe3zKrqnqz8HqWWdRhjkOjnBdx1+CnTPZRNcUR23g5nre/QrOum4ACHB6eXDJOEu4gLfAckfjIIVyu7Jl5N2vrO4c6/fxPtDhpaUi78FMVf6q0b98BSJ3BMs3ZG5ncYZfv2EmTpIt80y0LCrKhEQA/81TlEIJ9TWz0uCl2VYskFmgfUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS0PR01MB5731.jpnprd01.prod.outlook.com
 (2603:1096:604:be::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Fri, 26 Apr
 2024 06:55:23 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 06:55:23 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v3] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v3] libbsd: Fix conflict error when enable
 multilib.
Thread-Index: AQHaltTG3T0Exw/BUUKnJbWAd+1sPbF4ocSAgAENpgA=
Date: Fri, 26 Apr 2024 06:55:23 +0000
Message-ID: 
 <TY3PR01MB11056396A609AFF1770D3F05EA0162@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240425055231.668897-1-leimaohui@fujitsu.com>
 <CANNYZj8U5X==Up3C8QoQf_RzEV1-9Ewo8w0Q00HJ3B-uUYBc5w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8U5X==Up3C8QoQf_RzEV1-9Ewo8w0Q00HJ3B-uUYBc5w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS0PR01MB5731:EE_
x-ms-office365-filtering-correlation-id: 7a0b0ea5-0696-454f-384d-08dc65bdd86b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009|1580799018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RWlyT1kwd3Z3aEJZUkk2dGdiemh1bFZ2WHpsVWt3L2FrL0pEb0srdXUwYzRG?=
 =?utf-8?B?emNWUVlNOXU4MW4wd0F2bTcvcHEwYXpTb2hVVVlWSnhiK21VN2ZycDVvcFpk?=
 =?utf-8?B?bHQrdmlmQkp3RUhpdERmN29COUpyRWRGRGhJM2x4R2IwVmd3cGIyTHJoYnMx?=
 =?utf-8?B?bVRJVmlPVnlmaStYNkMzSit0R2ZjTVd0cUd5ckpjZy83OThiM1ozbmhyRWR4?=
 =?utf-8?B?MTVmTHBXejc0STh4eDJCWnIrRTRZekk3SVMzSHFQaWFqMzMyNkhQaXNmbnh4?=
 =?utf-8?B?TWlCYlNFamt1U2dlZ0VqVGFzS0JiUStTclR6MU9XWklVRU9RNFVxZ0IrR0VT?=
 =?utf-8?B?WU5SVEdyYnhlT1cwR1hBK2VtZllwc1ZrTmduQmNUWHhJTUVIQks0cWNkblA5?=
 =?utf-8?B?b1hRZDdPbklUUzVBZ3AwV2duVDVzVEJhK1ZuQVJKRzdUZlFQK3UwUlpsV2xk?=
 =?utf-8?B?dTEyK2svcTlydVR3V29hUHFtcE00R01nWjFsUTdpM1o4M1FSdGRTRGJGb0Z4?=
 =?utf-8?B?bDBoUFl4SDVLc3ZqakNGS3RGOG91RWhxMXI0bjkrekFFQmd2RmxKZWRKaTlI?=
 =?utf-8?B?bEd3TENPT01GL0VlVzEzdE9nUk5nb05Gd2VnN3lBU08xZ2lUMjBnMG5SSlVS?=
 =?utf-8?B?WDJ2dXNUYkFzMllkS21TTGYvaDNTd1FqSjJJTFNXOURLblo5ejFHSEgyNHZs?=
 =?utf-8?B?MFlvUktac2JLMTE1NHc2dFJ1YTh5dHQ2bk92ZFdTakhwZzhjSWJoZlFPOGJO?=
 =?utf-8?B?OGk3RTlJcFJMSThlYU04bDlXcW9WWlB0U1ZFWnYzZlEvelJYTVBFZkEwR203?=
 =?utf-8?B?U0NLWmp4ZE94RjBXakdqWVprZURtaEdMRjMrM3lyVlRPV1cxNFNiZjFPcmV6?=
 =?utf-8?B?UXJtU0grQkhVdEpvU0x3SngvNmlYczlFVllsc3lGem56WXl4WWVlS3lrVkJZ?=
 =?utf-8?B?MnFJT0VIMk9RYmd2bTZiSzZocGt2U1VORnljVEo4dFkyOStsNy9TZWFSTzFq?=
 =?utf-8?B?MmNMRGhxamRySUQ3blJXeXlWZ0JxdVMrY1FvYTFFMmVPc3NQUmQ5UTVCODI1?=
 =?utf-8?B?V0pwOTByc05VdDNXaTNuRUxvTFlWNlV0QW8ya091QTUyUkw1MDlXSXJjaXZ4?=
 =?utf-8?B?V1Uyc1p4WnhuWEFQUmkvNjZmTWU0cFBYZVI5OUMwekdGNi9qYmtTNzAzSTdC?=
 =?utf-8?B?ZUo0N2M4M0N5MnlLQjdSWEI4MjVzNjhMNnJKN0VEV3JndS9yVFBmMlNIMGpw?=
 =?utf-8?B?Rks4Ti9hSTdkUDlHaVVTVmxCOXNIRTRod2JvUE5scVNrL0p2WlJRUW1RUUhT?=
 =?utf-8?B?d0phVi9qSVMzejBZV2lBUzRENmhHOVVWMjdUWEVwNmpFZGxBMmlMN240N3NF?=
 =?utf-8?B?VkE3cm9oK3ZJcm9KRkNxTHhteWRESFlHVUFnVkJtMU8rMkpBd3NWekdHN1px?=
 =?utf-8?B?UnJIbTE4TUdjV0Frb3dHY0tjNm8zdTRXRVdsSCtpZDJ6Z1V5c3BVdnZPYmtv?=
 =?utf-8?B?NUhmT0cyY0dNZm9yMDR6Snd1UmdqSzdPWVJ0eFliRUpHcW1LdVR2azJtUVN0?=
 =?utf-8?B?Vk1pdmt6VkhzaUI0eTRzdnpsQ2NjcERDL09rNWV4TlRWbVhpT2U3K2hIUFJE?=
 =?utf-8?B?WDZuTVQwc3JLNGNaNFB3Z0JsVHZ6amxSNE9OM2xyY0tZZDZsQnJhVkhHbUhT?=
 =?utf-8?B?WjhGNEsvV0M2Mm9SbithbkI5SXVyVlFhMHJJbmtyNmQzRG1IL0dEVzBjVW81?=
 =?utf-8?B?RzNOeE9sTDVqZFZjbjdvVCtyb0RGb1dHaWhDenVqNVMrM1l1WUNSY2RUcWkx?=
 =?utf-8?Q?xffZFWV0ZAOHl8RRsoxd2LNMNfn2u1E5hDL0M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eEcraXN6bjVDdVVFTmJEWngyVjRFUmtMMTRlaE1QN3FNZE8yYXVwRFVLS0Ri?=
 =?utf-8?B?NWJYbFBtVGRkNTFvY0pSWWpFV25nNkIvR1NOZE5nQktScGRtdDlYK0tSZnM3?=
 =?utf-8?B?UDNCVVBjUHZqOEMwdlVZWkVBVTgrbmk5WXZEaVJtbEEvRzliSEdSU0RBNEVY?=
 =?utf-8?B?eU5tV3FqZ2t0dStGYXdKaFBIQkZITDRucjYrTFAybDJ5Z0Vsbi92c0ozei9s?=
 =?utf-8?B?TC9qSDJJYWhFUEcyRzRybWpKbkp5NjJoeXBVL3BoY0xmTnhxNGJ1REVKeWd0?=
 =?utf-8?B?NklkbmM1M3JROEtEc0R2VS9TU2FpZnpSNjNVZ3ptK0U1Q0pYR09DUkhZenFh?=
 =?utf-8?B?Skl6dWFMQXpRN0E1U0cxanZmOGtPRVdLSHQ0djZGOHcrVU9SRk5hR0RZTmho?=
 =?utf-8?B?eFJHK0pudU93YUx3b2czWE42WHRZNkRXVjF6R3RNQVg4Um9PUjZUdFRwL1d4?=
 =?utf-8?B?VUNWcmYzdFpHTG1tWkgyam4zaGdOalRWL0NkWnZxRmVOWXFWUGVvUjMrcDM4?=
 =?utf-8?B?clFDZjVKbXgxVUFibHlRN09oT0hBeVVRckZtbTFySVB4SkhyWjZyejJJaHBU?=
 =?utf-8?B?VVBDRndTOUc1M0laWXpWelp1VkJuYU0rcGdyOVd2ZXlpVGxxMDlGUnBBY2ZS?=
 =?utf-8?B?QWRYbWhtQk5GaTZydHpCY0tPRUhZakVFd1BHbGRMQmhheGkrNU1tV3Y1Z2sx?=
 =?utf-8?B?L2NJWUFGWGtoMGdXcGpxZ2VEMkZWV0pYNTlOSUlXU2MwanozSUlheVpRRHlX?=
 =?utf-8?B?UDlSOFBIK2dpRllXVHNBYWFUSTFudXVPWW11bEdXWGtNNzc0VVNRbmVNc21a?=
 =?utf-8?B?MDMxd1Q2N2dzTE1pencwc1g5cy9vOFBQZEhOeG9DYmFEZ3llTDNIbzNjSWVH?=
 =?utf-8?B?ZWM4SFRTN0FoWXQ3UnkzM0RGeU5KbU5SWis5cWFWR1o4dWNQNGxrT3JrSHM5?=
 =?utf-8?B?MjVOS3VURno3VTBCSGlPMlk3eW13dmo4ZEpSTDdGZHZYZWMxcHA0VHFGQk0w?=
 =?utf-8?B?SjFPcE1BMVAzRmwxTzk4WHdxamZhdE9seXFoRE5Nekd1TTg5ZThndlZzZ1Z0?=
 =?utf-8?B?MkdSVFRZVWh2RHloaWUweVhVc0U3WEw5aFYwaE5GbjdnQWlDL3g3cmkvbjVj?=
 =?utf-8?B?MUtIeUVFUTJYYlpJSjMrRTJpbDRyZWVxRnlueFhvQWNYZk1ydE5EeVhKRk9n?=
 =?utf-8?B?OTJoQ2k4Uy9JSXMwRzhEL090cldDaHFBMVAza3J6cy9IenBDZEoxdjFoSEJL?=
 =?utf-8?B?M29yM3JiMUwxdXdvZ0szM2JQbVR5cTJkRmNkanFkQVlVek5xQXpoWWlJZzhH?=
 =?utf-8?B?Y3dXZm5PTDNTZnI5eWU5YmlqQjVlQldHT1VQSzRxc0VlSVFvTmxmbW56aVN2?=
 =?utf-8?B?SmtDR3dYSWpGd3BIaGxkN3FyOFZUd3RWWkNMRGRoUlVQN0liUWZub0ZXdXB6?=
 =?utf-8?B?Ky9FUEdIQ2FTVENCYURjWlRUQzdhMFlyU3hGbStCT0M3Rk1HOS9Ya3ZuK0VG?=
 =?utf-8?B?ZDVZWlhOUmVlc0hNdGk4bjNsS21jZlFhZGpud203blBzT0IxcmFURzh0MzZ5?=
 =?utf-8?B?bHlRL2h2Z3ZkUGtXM01GWXNFS2h0aCtYcjIrWUoxOFFNdkFYMnh0Y3AwSWFo?=
 =?utf-8?B?eGtHU0J1R1hUYUszKzZlY0h2eXB3SnFFdFJ6L0F3RVVlcVRyaHJJZGRMcGQ2?=
 =?utf-8?B?RFVvcHZlK3Racyt5QzRXQUxWLytVRmxBTGp3akN0Q0ZYYnZIRzJwcVlDYStq?=
 =?utf-8?B?YVdWeHRZN1VlN1Y1VklUN1VFT05UbWREL1VHM0VVNTRaWEJGT25NY25zeGlG?=
 =?utf-8?B?L2hHNFR5WUlYRmMydUJnQnRUcjNuNFZRdXFzZXV1VzdhYU1DNE45MWRhK2dQ?=
 =?utf-8?B?NjhiMmxGbmk2M1pwZnpEMnZLVHQxVm1qMFFnZmd4c3BrUGFReEdtR2JCY3VG?=
 =?utf-8?B?WVRWYStoUHJPNU9WY0NDZHk4b1VLMFpiNmRWSHA4YTJDWnplLy94SEttalRi?=
 =?utf-8?B?NUR4TlhpVlZFdlYwdmxsZGVCL0hZMEFjVDl5UXNmMlUxcHdwSlpHaVFheHVt?=
 =?utf-8?B?aXd1eko2dlRZek13UTVJbVNhYnhJWjFFRTd0T0Vjajh5QTJxOGdGQ05pT1Jr?=
 =?utf-8?Q?hKAhUQzufxJlacaO95gScvWYO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aurH1RgpxjLmiwSm2iohpwCmmiMcsDK8L36haqZLkIWDdKNP2xlsoKx6sZQ58NTVq/Af3RgQTW8QpKQOQ4+p7P5jJt4bmbs0PueZLk+uP1lh8DbJepaxkYNDV7uTbzSSYU6XB9P8tI47X0XLFbxs4+DPH4YroQqNz/fUE85VC7AJyWKBPTpjzRuPCCfevdakBbihdvu+1o9DOECe7aV3ZF9ryl/SKpYE/5ML9Y2d+xMamuowwkizjfgYwSFDUWEj7XLIt5N5ezQ/sozlf3V5UUH9VdaDG1ueF+BXMVIFtyjDFMYYNE4uP4c++fx9bFpe8rpkd4K0PKq3/hWVmhuBYCXj+FCrgL0kOqeDxOQZvkwBslo/7ccopkSYuTOLqq9NiYRrUb5L3ygTk6AswnLZguMo5zxemG17bNRvBwo/kQWvuqgQOpumGIBQlfD6WDYDBEbXMpHktpXJDWgGixm9DXrEDaZArmOhN/P9e4WvLwmExEx/bQrJiZUmyIbAndUDNABXIEXrryjAe8PVemRyJQJFpY9wUts0kfSqeWByOW3N1rEcQU3VIpRLA+zZzXzUMMIsEdcOcL5RjxXJmUlhOnmZKpLuzJtQICyzJ4LHtQcgSUc6tGw1PGktJxtoGyfK
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0b0ea5-0696-454f-384d-08dc65bdd86b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 06:55:23.3376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqL0A88ble0oADTRoUycWt0i9UAAMTakLZBnSmtv2eI2qn1c2HQof21QAqhj9XIrMIuzA+CKPnx2nZe51b9ezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5731
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 06:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198712

SGksIEFsZXgNCg0KPiBBZnRlciB0aGUgc2VkIGNvbW1hbmQsIHRoZXJlIGlzICNpbmNsdWRlIDxz
eXMvY2RlZnMtMzIuaD4gd2hpY2ggcmVxdWlyZXMNCj4gc3BlY2lhbCBub24tZGVmYXVsdCBhcnJh
bmdlbWVudHMgaW4gdGhlIGJ1aWxkIHN5c3RlbSwgc3BlY2lmaWNhbGx5LCB1c2luZyBsaWJic2Qg
aW4NCj4gb3ZlcmxheSBtb2RlIHdpdGggc3BlY2lhbCBjb21waWxlciBmbGFncyBhcyBkZXNjcmli
ZWQgaW4gdGhlIG1hbiBwYWdlIHlvdSByZWZlcg0KPiB0by4gQnV0IHRoYXQncyBub3QgdGhlIG9u
bHkgd2F5IHRvIHVzZSBsaWJic2QsIGFuZCB0aGUgb3RoZXIgd2F5IHdvbid0IHdvcmsuDQoNCg0K
UmVmZXJlbmNlIHRvIHRoZSBtYW4gcGFnZSwgbGliYnNkIHJlY29tbWVuZHMgb3ZlcmxheSBtb2Rl
Lg0KIlRoZSBsaWJyYXJ5IGNhbiBiZSB1c2VkIGluIGFuIG92ZXJsYXkgbW9kZSwgd2hpY2ggaXMg
dGhlIHByZWZlcnJlZCB3YXksIHNvIHRoYXQgdGhlIGNvZGUgaXMgcG9ydGFibGUgYW5kIHJlcXVp
cmVzIG5vIG1vZGlmaWNhdGlvbiB0byB0aGUgb3JpZ2luYWwgQlNEIGNvZGUuLi4uLi4uIg0KDQpG
cm9tIHRoZSBidWlsZCBsb2cgYW5kIHRoZSBzb3VyY2UgY29kZSBvZiBsaWJic2QsIEkgZm91bmQg
dGhhdCBsaWJic2QgZG9lcyBwcm92aWRlIGhlYWRlciBmaWxlIGluIG92ZXJsYXkgbW9kZSBieSBk
ZWZhdWx0IGFzIHRoZSBtYW4gcGFnZSBzYXlzLiANCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQokIGxzIHRtcC93
b3JrL2NvcnRleGE1Ny1wb2t5LWxpbnV4L2xpYmJzZC8wLjEyLjIvaW1hZ2UvdXNyL2xpYjY0L3Br
Z2NvbmZpZy8NCmxpYmJzZC1jdG9yLnBjICBsaWJic2Qtb3ZlcmxheS5wYyAgbGliYnNkLnBjDQok
IGdyZXAgaW5jbHVkZSB0bXAvd29yay9jb3J0ZXhhNTctcG9reS1saW51eC9saWJic2QvMC4xMi4y
L3RlbXAvbG9nLmRvX2NvbXBpbGUgLXINCi4uLi4uLiAtSS4uIC1pc3lzdGVtIC4uLy4uL2xpYmJz
ZC0wLjEyLjIvaW5jbHVkZS9ic2QvLi4uLi4uDQouLi4uLi4gLUkuLiAtaXN5c3RlbSAuLi8uLi9s
aWJic2QtMC4xMi4yL2luY2x1ZGUvYnNkLy4uLi4uLg0KLi4uLi4uDQokIHZpbSB0bXAvd29yay9j
b3J0ZXhhNTctcG9reS1saW51eC9saWJic2QvMC4xMi4yL2xpYmJzZC0wLjEyLjIvaW5jbHVkZS9i
c2Qvc3RyaW5nbGlzdC5oDQojaWZkZWYgTElCQlNEX09WRVJMQVkNCiNpbmNsdWRlIDxzeXMvY2Rl
ZnMuaD4NCiNlbHNlDQojaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy5oPg0KI2VuZGlmDQojaW5jbHVk
ZSA8c3lzL3R5cGVzLmg+DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkFuZCBJIEludmVzdGlnYXRlZCBzZXZl
cmFsIE9TUyhlLmcuIHNoYWRvdywgbWcsIGxpYnhkbWNwKSB0aGF0IGRlcGVuZCBvbiBsaWJic2Qu
IEZyb20gdGhlIHNvdXJjZSBjb2RlIG9mIHRoZWlycy4gSSBmb3VuZCB0aGF0IHRoZXkgZG9lcyB1
c2VkIGxpYmJzZCBpbiBvdmVybGF5IG1vZGUgYnkgZGVmYXVsdC4gDQpTdWNoIGFzIHNoYWRvdzoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQp2aW0gdG1wL3dvcmsvY29ydGV4YTU3LXBva3ktbGludXgvc2hhZG93
LzQuMTUuMC9zaGFkb3ctNC4xNS4wL2xpYi9yZWFkcGFzc3BocmFzZS5oDQouLi4uLi4NCiNpZmRl
ZiBMSUJCU0RfT1ZFUkxBWQ0KI2luY2x1ZGUgPHN5cy9jZGVmcy5oPg0KI2VuZGlmDQouLi4uLi4N
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQoNClRoZSBzYW1lIGFzIG1nIDoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQokIHZp
bSB0bXAvd29yay9jb3J0ZXhhNTctcG9reS1saW51eC9tZy8yMDIzMDUwMS9naXQvQ01ha2VMaXN0
cy50eHQNCmlmKENNQUtFX1NZU1RFTV9OQU1FIE1BVENIRVMgIkxpbnV4IikNCiAgcGtnX2NoZWNr
X21vZHVsZXMgKEJTRCBSRVFVSVJFRCBsaWJic2Qtb3ZlcmxheSkNCiAgbGlua19kaXJlY3Rvcmll
cyAoJHtCU0RfTElCUkFSWV9ESVJTfSkNCiAgc3RyaW5nIChSRVBMQUNFICI7IiAiICIgTElCQlNE
X0ZMQUdTICIke0JTRF9DRkxBR1N9IikNCiAgdGFyZ2V0X2xpbmtfbGlicmFyaWVzIChtZyAke0JT
RF9MSUJSQVJJRVN9KQ0KICBzZXQgKENNQUtFX0NfRkxBR1MgIi1XYWxsIC1EUkVHRVggLURfR05V
X1NPVVJDRSAke0xJQkJTRF9GTEFHU30gJHtOQ1VSU0VTX0ZMQUdTfSAtTCR7TkNVUlNFU19MSUJS
QVJZX0RJUlN9IikNCmVsc2UoKQ0KICBzZXQgKENNQUtFX0NfRkxBR1MgIi1XYWxsIC1EUkVHRVgg
JHtMSUJCU0RfRkxBR1N9ICR7TkNVUlNFU19GTEFHU30gLUwke05DVVJTRVNfTElCUkFSWV9ESVJT
fSIpDQplbmRpZigpDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpTbywgSSB0aGluayB0aGUgaGVhZGVyIGZp
bGUgYWZ0ZXIgb2VfbXVsdGlsaWJfaGVhZGVyIHNob3VsZCBiZSBpbiBvdmVybGF5IG1vZGUgYXMg
dGhlIG90aGVyIGhlYWRlciBmaWxlcyBpbiBsaWJic2QuDQpPZiBjb3Vyc2UsIElmIGFkZGVkICIj
aWZkZWYgTElCQlNEX09WRVJMQVkiIGludG8gdGhlIGhlYWRlciBmaWxlIGFmdGVyIG9lX211bHRp
bGliX2hlYWRlciwgbGliYnNkIHdpbGwgaGF2ZSBhIGJldHRlciBjb21wYXRpYmlsaXR5LiBXaGF0
IGRvIHlvdSB0aGluaz8NCg0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjUsIDIwMjQgNDowOCBQTQ0K
PiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XVtQQVRDSCB2M10gbGliYnNkOiBGaXggY29uZmxpY3QgZXJyb3Igd2hlbiBlbmFibGUgbXVsdGls
aWIuDQo+IA0KPiBPbiBUaHUsIDI1IEFwciAyMDI0IGF0IDA3OjUyLCBsZWltYW9odWkgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiAtIEFmdGVyIG9lX211bHRpbGliX2hlYWRlciBvbiBj
ZGVmcy5oLCB0aGUgcGF0aCBvZiBjZGVmcy02NC5oIGFuZCBjZGVmcy0zMi5oIGluDQo+IGNkZWZz
LmggbmVlZCB0byBiZSBjb3JyZWN0ZWQuIFBsZWFzZSByZWZlcmVuY2UgdG8NCj4gaHR0cHM6Ly9t
YW4uYXJjaGxpbnV4Lm9yZy9tYW4vbGliYnNkLjcgZm9yIGRldGFpbHMuDQo+IA0KPiBJIGxvb2tl
ZCBhdCB0aGlzIGluIGEgbG9jYWwgYnVpbGQsIGFuZCBJIGFjdHVhbGx5IGRvbid0IHRoaW5rIHRo
ZXkgbmVlZCB0byBiZQ0KPiBjb3JyZWN0ZWQuIFdpdGhvdXQgdGhlIHNlZCBjb21tYW5kLCB0aGVy
ZSBpcyAjaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy0zMi5oPiwNCj4gd2hpY2ggaXMgZmluZSwgYXMg
aXQncyByZWxhdGl2ZSB0byAvdXNyL2luY2x1ZGUsIGFuZCB1bmFtYmlnaW91cy4NCj4gDQo+IEFm
dGVyIHRoZSBzZWQgY29tbWFuZCwgdGhlcmUgaXMgI2luY2x1ZGUgPHN5cy9jZGVmcy0zMi5oPiB3
aGljaCByZXF1aXJlcw0KPiBzcGVjaWFsIG5vbi1kZWZhdWx0IGFycmFuZ2VtZW50cyBpbiB0aGUg
YnVpbGQgc3lzdGVtLCBzcGVjaWZpY2FsbHksIHVzaW5nIGxpYmJzZCBpbg0KPiBvdmVybGF5IG1v
ZGUgd2l0aCBzcGVjaWFsIGNvbXBpbGVyIGZsYWdzIGFzIGRlc2NyaWJlZCBpbiB0aGUgbWFuIHBh
Z2UgeW91IHJlZmVyDQo+IHRvLiBCdXQgdGhhdCdzIG5vdCB0aGUgb25seSB3YXkgdG8gdXNlIGxp
YmJzZCwgYW5kIHRoZSBvdGhlciB3YXkgd29uJ3Qgd29yay4NCj4gDQo+IFNvIHdoYXQgaXMgdGhl
IGlzc3VlIHRoYXQgaGFwcGVucyBpZiB0aGVyZSBpcyBubyBzZWQsIGFuZCBvbmx5DQo+IG9lX211
bHRpbGliX2hlYWRlcj8NCj4gDQo+IEFsZXgNCg==

