Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF42DC54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 05:38:36 +0000 (UTC)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web10.407.1710999509874797266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 22:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=WOzq7Pez;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1710999509; x=1742535509;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tH5flxDYfaCkeYjnt9tahD0tEHAlaEpNtmQ2Ahv4KqM=;
  b=WOzq7PezJc5fcMPwKzyZIY4q9xLOK5Y3RIAKQSf4ZSkY7PBf3xWda10u
   jRnkBoPdDmJ/dD46MCSFy9aq+aiMO3a4BSVwDEGAGQjiF1F9DKuQa0dYc
   +Ic+srn/Hik3JkojeJgwdwVhtI46v8fBTaQsi3KsS6cs5nogF5gBoV9F8
   lDcvWJ1iouio7+z9GM/JfRlHut2JG5Pyu147NbG56j6pIVqlNJqsuXiBD
   XbGOqfPISilcc08D28iLjP35QMrx43ApC4wL8J119l/J4e8ry+9W0OfA8
   8RRL60Amm1H4My6r43HRS8h2iUdRVDokDqNsMT7FCraG8ZpMmvwvr4dyl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="114933290"
X-IronPort-AV: E=Sophos;i="6.07,142,1708354800"; 
   d="scan'208";a="114933290"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 14:38:26 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/q5BnojPsi9ijJXgM7aGl3szzbHK4nlIoz4mF3SnricYAp77xnaztEQHfE+0vGg5GB8MgNc+e0QHGjgL3nOzG4CjB8JmGgDPiufPfn4lj0MUCfVY99oscQATAPZHt0rtx7bps2ng4EXYSuumPRo0j2VK2Be7zPKV9cCJwZ4AZJN7YqBRqO+CYK6Kr8SVNCBX/gm+KKOjccdhGBZKIbW1hbM4/E5u9yIS0OBOCnxwIAAZuS+0//2CumD3WgpwkTIKV3C5XuycQvxjDF9AgdBztE8oZw2dmvQ95XWivoObE4/ew/qZzxweV6M7JWMchk9bVCUvdEniNuj8aFUjBtYuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tH5flxDYfaCkeYjnt9tahD0tEHAlaEpNtmQ2Ahv4KqM=;
 b=movmAWStSbKlLDuqplzmOGMdpC6YY9NV/k8tbOlaPH5wELtL4ksLVLEEqvT0493sgw1LnkoYlDkLWAmzDaamT7J7NkwwfZoACw4Swq5TNz32SzYt+4YDX6yV7+Def/oRvQ7oVdHVI7ciZAGqzFvBGMP77vtFWtkRsfVbnzb1EMbO82GpNN/R96n+iKBhGaXAhCOoTumrESkA3pir97FexalckVFVtsWohavPYHdBnxSmvXtygicCrYnyjcGnqX+D1uUQbJvhNFpoJc3pXZExSdQOwVMqIl6WbKbUP822JfToZnSNr5H8xOfsZFfgt74AgK9Z5fNUzaR9xr03Gz1mbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS3PR01MB10187.jpnprd01.prod.outlook.com
 (2603:1096:604:1e2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 05:38:24 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::4189:9809:9327:afc8%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 05:38:24 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] libbsd: Fix conflict error when enable multlib.
Thread-Topic: [OE-core] [PATCH] libbsd: Fix conflict error when enable
 multlib.
Thread-Index: AQHaeZa+e4q8+IC4REam4zjoq/wgEbFAGcuAgAFNlNCAABHugIAAM9Hg
Date: Thu, 21 Mar 2024 05:38:24 +0000
Message-ID: 
 <TY3PR01MB11056BA0B2F986D0C72F972DCA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240319004524.1270639-1-leimaohui@fujitsu.com>
 <CAMKF1sp69BBJjUCFZ2Jnk3jE8O-kmhFfLg0CjxodykmZbvP_Vw@mail.gmail.com>
 <TY3PR01MB110567C69384E6A28000C11FEA0322@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CAMKF1srfhd0_iMxwxxJhmwiRGNr7pptOpQq4isJW5yDU5R9Eew@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srfhd0_iMxwxxJhmwiRGNr7pptOpQq4isJW5yDU5R9Eew@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZGU4M2JjNWQtNmIzMS00N2E0LTlkYTctMDk1YzhkNzc3?=
 =?utf-8?B?NTlkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTAzLTIxVDA1OjMzOjA3WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS3PR01MB10187:EE_
x-ms-office365-filtering-correlation-id: 437a1d63-3775-44c4-01bb-08dc49692058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8s9CFBSUBtBAbzTbwVgtrZUlPo+iFIBT3xhQBbNwc2PhIEM6d7uFHFCJv7WwvcxLM8CXu7hwvRH8uN15oWVGICNRlUwI7o028bY6YMWk8LslUvitx0QbXuOXPy5kEth5omBx6OpKRvFBOoSemUzl5BSbH2+aNp8Zl/0bUK7tHhwvHAzOl4GjOSBTv6wZKCxJK1apg4AE7RdXbq/jv4lGBOat2096t9pee9Rrwt/m41kGfDukrbUBfVkpkSn95RPiop9iwDpbvZqppFqV7LTl78XOMNzE8ENZbIRP9XTb6U7EuA15vp8rJSH2EnoPXMBKGhYwDoNWG7fjUE4UzHxu2RDgQ0ZPo8XTUr+u7a5y+LxmjFt5N92OeQur+TMPD2qtAKSls/5iNzq+f99SdynVh0dvB1lE/Z2W0EYWAnthZ0O4BPLQfbqmah2qxJ14sI1lvfhhfp+teQmiYa7VoxPYtIaX9Bs0yYZ012a/ePEA4EuN2sNK4AX/st/gluCrRX/tbWvt1ml+2vzTAj8ekasN4YwkEiNAgxfVpk/PgXqz7ojFb7bz8d4UN0cpjQs0G7QwsKl/DrvLbBYozCvb6MwPjzQMwaD79/jjZqpF6ZW67KfFhPfX/R/eQir67mQPyfeEM9sEx7Jij82zz0jB7ZjsMS8QdD/f1sX194sxz9d1rlaWAcTqmHsSOcnhA2YZKp1T
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VExERHBIcWFFN0xuYlRscnhsNmx4a0laUERNZktQMkJJVnR4TFdUNFYvc0lx?=
 =?utf-8?B?eUs5d05qUDZuMXBtdWJLN0tBU1haVlVwUloya1R0Ym5nS1g5b0hXdkdiNksy?=
 =?utf-8?B?WHRaeGhlOENaODVSZEhvT25KOFpVdENnTVdDaytaN2dqa05tbEZZWngrd21n?=
 =?utf-8?B?eFBKSlJqTkxwNm5pUTZoa3pyL0JBSDNEMXQzQ0cvYVdoOHE1S3lHalN2VjVz?=
 =?utf-8?B?TjF4RWVKOXRiN2w5U3BOTVg3TjhKeEc1dFdlOE1MZk4vNW1rM2JNS2tPZzRr?=
 =?utf-8?B?a2pmSGVOTFk3VXNVWFptS3JPbkZtVDEybStidjJsY05HZVR1ZTdaMFRQdzJJ?=
 =?utf-8?B?Ukt4MGVjMXRzWU04ZkxUNkMyRDhZbEtYa25Db3hJRm93aWNWRTRPcWIrMFZy?=
 =?utf-8?B?OGsweWRKNXNjYktPNEc0RUJmbjVJOXlyQWhzVnkxMDBxbkpGSGxEcmdkbnV1?=
 =?utf-8?B?Zml1V21Kdmx4L1ZodDQzTENoSWRKVHMwcEc5OTRrWlVuc1FmbGptekQvaXdo?=
 =?utf-8?B?aExzVURIQnpoYVkyRXprOXlPSFAzN21WMHVwZW9ka1N1YTJGeUpVZWNha3Q1?=
 =?utf-8?B?Z3BrM3d2SUVta0hBWCt3TUVIRmNZZlUxT0s5WXFOZGV2NjFLZHhPNFhHa0tT?=
 =?utf-8?B?MVJ4NkZ6ZmtLcHlnR25zS2FOQkpEOFl2VitPR3phQ0RpWHpPMEdYVmdyRDN4?=
 =?utf-8?B?cWY1VDlRa2ZYZE9LVXVyRDJpOWpjUFAxNkRvaHlaK1RYUGc0K0FHUlM3Nmd2?=
 =?utf-8?B?WlJOaEFZQVRjV1FTMzIzWXJ0QTgzVnRNMXNiaFAyMExQUGVVdXlsdnlkMkxr?=
 =?utf-8?B?R2NkRTY0YnFmdTVDNnhtaEJleGtjZkY0VXhYMFhtYmpLVCtEQmVJSDQ3Ulo0?=
 =?utf-8?B?VktvMDB1T0U5bCtobk45YTVHTHZNTEs2Skx2TEJCU3pOV0xVNy9iUVlUeVdM?=
 =?utf-8?B?ZTlQV1dBNW9BK3AwRHZhNENEVE9nVXdvcUJ4VTN5LzhCS0JNQ0g2NlQ0QXBu?=
 =?utf-8?B?VDhFbXkvelFoS2hEMTA4OTZ3QUlqVTZwblh3YlZOeVBjUUowSFAwL1FRdHZX?=
 =?utf-8?B?V0o1Mmw2Y0Rid0FtSGxRdXJZaXc2ejhZTnBqQWIrTk5uSU45TTM4aFd2U24y?=
 =?utf-8?B?OGdkVXp1OHBCdkdoVDQ0RERTZGlRd1JQTmRpblNyRXRzUTBxd24yaElVT054?=
 =?utf-8?B?YXZXTlhRNWR5Vzk2THZjS2FUdHZVRmdieHdzdzJob2ZmK0llV2dFNU1TOU8z?=
 =?utf-8?B?djB4dVJLdkMvUndPc2FFNEgzaXZuNHJKSjVVUkdMdjNRa29GVUNPbGtNRDlo?=
 =?utf-8?B?S0pMbFNUck5mNk5jMWpiMnFJUHMwWjNqY3ZFaXQ3ejlFNWVLTUlOdFZDL0dT?=
 =?utf-8?B?L012QkVIMFdld0tYbHZENUNEU3BZeXBxbkcxMjBuVS9DQUZUa0dYd3BqS0h3?=
 =?utf-8?B?WEwxZjF6TG1LYWpSejlWeGFZckVKOTJ2ZjlBeDhtUThOdncySlFvd2tscUhl?=
 =?utf-8?B?MkV6TXJ5a3BGOW5KazExeXh4VnI1V0R4aHVyYndDWTlFdFlPOU5yeURmVllK?=
 =?utf-8?B?NEtCdlo5L2ppUFBmcHU4QjcxUWlXRFZXWTdzZ0wyZm9HZi9HWlg5anFrSU9a?=
 =?utf-8?B?WHpOVEtGQ2RnTzlxZ3BhY3ZzYktzbWtaSVJJK01ObkFGMFc1amswSy9rcEtp?=
 =?utf-8?B?b0JONXE3MHhvcGNOVUcrQ09jbEdGbE5YdUpUZG0yZHpkMThaQ2hGRGowQ0Yr?=
 =?utf-8?B?TFdXZWd2aGVvSnlQL002Z25mM2cwZGxab2tsdXd5RXRHZEx2a0xnemJhZzIr?=
 =?utf-8?B?T0syNjgzYlVFYzdlMWhXMHBBZmIzMTBrS05iTkRZZHJNTEZ2c3ViWWprZDdW?=
 =?utf-8?B?dXhvR3JRbDNpSHNZRWNOVEl3aTMrMFRkQ3J5TVY3WDErQnNWdzlUNnc5djFJ?=
 =?utf-8?B?dHBMdlZwNVRXVC9heGQ3NE5Rck11SW5JNlZ1VkMvenNzUEhyZE1MRDJSczdC?=
 =?utf-8?B?bG1JbGZDUUNLVVcwaW04c3AzMFZXYkh0Lzl5Vlh3REFwcUREM3UxYmZaL3ZO?=
 =?utf-8?B?SEMzV2tFcnVVYXMxaVc5U0hrdGVqSHB4NVRyOXM1SDhlUnV1TXl6b1gwcW5j?=
 =?utf-8?Q?+0TxtvEJUezttd5hplLJbHX2/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ZYS4wX39AQllfUD5yZoTvlNVrQK5BYa1xlR9FYq3foOmMI9aNACzmGbUwgYUsrstqVrIUZrMendVHk7DSRuBbrcU4Caa8fowRKZpOt57Krl3hi1OgMD5m46wK70Aa3VUyglwsY2lD17texss+QknFw4c3lEzVywDehlQWqelefQ2RQVfg6SQxTnZuNPQjbbLB2tGNRMmj5nYKlsLgYATTk4/25zSvg+3BA/twKQjy3duErd3FqGif44Y9PkK2dYioKc0k2qYJltRVQJGDYRdBx8OpUeq5aappMcwSVrsBCdiXovVJiP4c2x8LiZHxsZeckhq1g14f+jlkNCS7H2kVHx11OwXSjFI60p/h7xdRNR8pv9DPDQQ/OF+JsLw3EuRuxNL/AH8JkVLb4GB8dZY9LeiLcaGPjhu93eZ1kuYLnEWtVvle7mJ8WdRCIbfaUbzjNr3dAn8PTitDa7xAE5JWeFpBq1yEJAEYvP/GFw/iyfYKkUtxuj7yC3kl9oh8+dmssLrEH/nPaJoM/iXwo55luA3YZsND9eGf6om4TP76pTQqDNAwkucxnbzqafze48cRh8ltV2ySxolZ1HKU4wsmfXYmnhWY4pxHjkMOnC5tUqjwT49vwkI4vkbxhCJxYD9
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437a1d63-3775-44c4-01bb-08dc49692058
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 05:38:24.2389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ws41i9ov8K2KMI6kgUUXXsNAXAMbG7gVEBlYKFSrrqo76ltVeyPozOKv9Im5crCJn0ITPcBLkztQpGTBSoLbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197409

SGksIA0KDQo+IEkgZ3Vlc3MgeW91IG1pZ2h0IG5lZWQgdG8gdGhyb3cgaW4gbWV0YS1jbGFuZyBp
bnRvIGxheWVycyBhbmQgdXNlIFRPT0xDSEFJTiA9DQo+ICJjbGFuZyIgcGVyaGFwcy4NCg0KSSB0
cmllZCBhZ2FpbiB3aXRoIHRoZSBmb2xsb3dpbmcgc3RlcHMuIEJpdCBJIHN0aWxsIGRpZG4ndCBy
ZXByb2R1Y2VkIHRoZSBlcnJvci4gSXMgdGhlcmUgYW55dGhpbmcgSSBtaXNzZWQ/DQoNCiQgZ3Jl
cCBjbGFuZyBjb25mL2xvY2FsLmNvbmYNClRPT0xDSEFJTiA9ICJjbGFuZyINCiQgZ3JlcCBjbGFu
ZyBjb25mL2JibGF5ZXJzLmNvbmYNCiAgL2Rldi9jb21tb24vaG9tZS9sZWltaC9jb21tdW5pdHkv
bWV0YS1jbGFuZyBcDQokIGJpdGJha2UgbGliYnNkDQpCdWlsZCBDb25maWd1cmF0aW9uOg0KQkJf
VkVSU0lPTiAgICAgICAgICAgPSAiMi43LjMiDQpCVUlMRF9TWVMgICAgICAgICAgICA9ICJ4ODZf
NjQtbGludXgiDQpOQVRJVkVMU0JTVFJJTkcgICAgICA9ICJ1bml2ZXJzYWwiDQpUQVJHRVRfU1lT
ICAgICAgICAgICA9ICJpNjg2LXBva3ktbGludXgiDQpNQUNISU5FICAgICAgICAgICAgICA9ICJx
ZW11eDg2Ig0KRElTVFJPICAgICAgICAgICAgICAgPSAicG9reSINCkRJU1RST19WRVJTSU9OICAg
ICAgID0gIjQuMytzbmFwc2hvdC0wOGQwNTQ0YmUzZTE4ODFiNjIzZjE4OTMxNjMxZTQxMmE5YTAx
NThkIg0KVFVORV9GRUFUVVJFUyAgICAgICAgPSAibTMyIGNvcmUyIg0KVEFSR0VUX0ZQVSAgICAg
ICAgICAgPSAiIg0KbWV0YQ0KbWV0YS1wb2t5DQptZXRhLXlvY3RvLWJzcCAgICAgICA9ICJtYXN0
ZXI6MDhkMDU0NGJlM2UxODgxYjYyM2YxODkzMTYzMWU0MTJhOWEwMTU4ZCINCm1ldGEtY2xhbmcg
ICAgICAgICAgID0gIm1hc3Rlcjo4MWU1ZjRlZWY5M2I1ZTFkNjUwN2RhYWY3NGZjZTI4YTJjY2Q3
Y2Y3Ig0KLi4uLi4uDQokDQoNCg0KQmVzdCByZWdhcmRzDQpMZWkNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBC
ZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDIxLCAyMDI0IDEwOjIw
IEFNDQo+IFRvOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiBDYzogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSF0gbGliYnNkOiBGaXggY29uZmxpY3QgZXJyb3Igd2hlbiBlbmFibGUgbXVs
dGxpYi4NCj4gDQo+IE9uIFdlZCwgTWFyIDIwLCAyMDI0IGF0IDY6MjDigK9QTSBNYW9odWkgTGVp
IChGdWppdHN1KSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEhp
Lg0KPiA+DQo+ID4gPiBUaGlzIGNhdXNlcyBtZyBidWlsZCBmYWlsdXJlcyBzZWUNCj4gPiA+IGh0
dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFpbHMvNzU5NDczLw0KPiA+
DQo+ID4gSSdtIHNvcnJ5IHRoYXQgSSBjYW4ndCByZXByb2R1Y2UgdGhpcyBlcnJvci4gSSB1c2Vk
IHRoZSBkZWZhdWx0IHFlbXV4ODYuY29uZiwNCj4gYW5kIGJpdGJha2UgbGliYnNkLiBUaGVyZSBp
cyBubyBlcnJvci4NCj4gPiBTbywgY2FuIHlvdSBzaG93IG1lIHlvdXIgY29uZmlnIG9mIGk2ODYt
eW9lLWxpbnV4Pw0KPiANCj4gSSBndWVzcyB5b3UgbWlnaHQgbmVlZCB0byB0aHJvdyBpbiBtZXRh
LWNsYW5nIGludG8gbGF5ZXJzIGFuZCB1c2UgVE9PTENIQUlOID0NCj4gImNsYW5nIiBwZXJoYXBz
Lg0KPiANCj4gPg0KPiA+IEJlc3QgcmVnYXJkcw0KPiA+IExlaQ0KPiA+DQo+ID4NCj4gPg0KPiA+
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMjAsIDIw
MjQgMToyMiBQTQ0KPiA+ID4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
DQo+ID4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+
ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGxpYmJzZDogRml4IGNvbmZsaWN0IGVy
cm9yIHdoZW4gZW5hYmxlIG11bHRsaWIuDQo+ID4gPg0KPiA+ID4gVGhpcyBjYXVzZXMgbWcgYnVp
bGQgZmFpbHVyZXMgc2VlDQo+ID4gPiBodHRwczovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vy
cm9ycy9EZXRhaWxzLzc1OTQ3My8NCj4gPiA+DQo+ID4gPiBPbiBNb24sIE1hciAxOCwgMjAyNCBh
dCA1OjQ14oCvUE0gbGVpbWFvaHVpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiA8
bGVpbWFvaHVpPWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+
ID4gPg0KPiA+ID4gPiBGcm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+
ID4gPiA+DQo+ID4gPiA+IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0KPiA+ID4gPiAg
IGZpbGUgL3Vzci9pbmNsdWRlL2JzZC9zeXMvY2RlZnMuaCBjb25mbGljdHMgYmV0d2VlbiBhdHRl
bXB0ZWQNCj4gPiA+ID4gaW5zdGFsbHMgb2YgbGliYnNkLWRldi0wLjEyLjEtcjAuY29yZTJfNjQg
YW5kDQo+ID4gPiA+IGxpYjMyLWxpYmJzZC1kZXYtMC4xMi4xLXIwLmNvcmUyXzMyDQo+ID4gPiA+
DQo+ID4gPiA+IFRoZSBkaWZmZXJlbmNlIG9mIGJzZC9zeXMvY2RlZnMuaCBiZXR3ZWVuIGxpYmJz
ZC1kZXYgYW5kDQo+ID4gPiA+IGxpYjMyLWxpYmJzZC1kZXYgaXMgYXMgZm9sbG93aW5nOg0KPiA+
ID4gPg0KPiA+ID4gPiAgLyogRGVmaW5lIHRoZSBBQkkgZm9yIHRoZSBjdXJyZW50IHN5c3RlbS4g
Ki8gIC0jZGVmaW5lDQo+ID4gPiA+IExJQkJTRF9TWVNfVElNRV9CSVRTIDY0ICArI2RlZmluZSBM
SUJCU0RfU1lTX1RJTUVfQklUUyAzMg0KPiAjZGVmaW5lDQo+ID4gPiA+IExJQkJTRF9TWVNfSEFT
X1RJTUU2NCAxDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxl
aW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIuMS5iYiB8IDYgKysrKystDQo+ID4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+ID4g
PiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTIu
MS5iYg0KPiA+ID4gPiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4x
LmJiDQo+ID4gPiA+IGluZGV4IDE2MWRjNmRmNDMuLjg0ZWRkOWJhZmEgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4xLmJiDQo+ID4g
PiA+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMi4xLmJiDQo+
ID4gPiA+IEBAIC00MCw4ICs0MCwxMiBAQCBTUkNfVVJJID0NCj4gPiA+ICJodHRwczovL2xpYmJz
ZC5mcmVlZGVza3RvcC5vcmcvcmVsZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiINCj4gPiA+ID4N
Cj4gPiA+ID4gIFNSQ19VUklbc2hhMjU2c3VtXSA9DQo+ID4gPg0KPiAiZDc3NDdmOGVjMWJhYTZm
ZjVjMDk2YTlkZDU4N2MwNjEyMzNkZWM5MGRhMGYxYWVkZDY2ZDgzMGY2ZGI2OTk2YSINCj4gPiA+
ID4NCj4gPiA+ID4gLWluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZw0KPiA+ID4gPiAraW5oZXJp
dCBhdXRvdG9vbHMgcGtnY29uZmlnIG11bHRpbGliX2hlYWRlcg0KPiA+ID4gPg0KPiA+ID4gPiAg
REVQRU5EUyArPSAibGlibWQiDQo+ID4gPiA+DQo+ID4gPiA+ICtkb19pbnN0YWxsOmFwcGVuZCAo
KSB7DQo+ID4gPiA+ICsgICAgICAgb2VfbXVsdGlsaWJfaGVhZGVyIGJzZC9zeXMvY2RlZnMuaCB9
DQo+ID4gPiA+ICsNCj4gPiA+ID4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIN
Cj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4zNC4xDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+
ID4gPiA+DQo=

