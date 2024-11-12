Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F63E6781D
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 20:08:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.32])
 by mx.groups.io with SMTP id smtpd.web11.96588.1731442069261788497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 12:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=NICoYEGy;
 spf=pass (domain: siemens.com, ip: 52.101.67.32, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENhaSVfn7jvJAHWaNW7NX0UiJunLalQQNHIdsuaLlDc308QyFIE57q2T5B+X82nSyFiLP97yqWCtRtOR3Jie5sbFSb6lL+nOtTRVhsJFaKv9iET+LLhMlmQ6BGuMHal2N7CvaxV28M/ieMdbxhL0XpoAEyDYyLLRBhbKrTleTo/rIj6MsC/V24C2fuCV5Wx7vyfLW++Yvnq2VEvJ2mE0MPUI5dxSASrz77l0rQBiu4p1ktm7NskhQ/g4AWchwcqLV18UWCSmJyT8hATk+8mw08P92btdlOxHxPSkiPgnuaP1QmCKTdxbYlF9sk8yV3OROPojpwCBe4LmH+FAcTFalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLgqRrLhgeLeRSZjANMIfQZFI6jUqu2MTLCYK4ri0m0=;
 b=RE50uX6MBrvVfhPzUMmjZ+HVma2txvHymrNxmXaLrrabvzP3U9nxyw17CgdFggML3ri4M0Qp/K5swIYT80Qa7lqKVOVo1bhGodBCopnyaPg3nw2IutA0NnaTJ+0eEJ+aD7VwLNug7FwBXkZmm/fvckPYPYvlayiYH+d4QXPzu0YdvPUnA76lLtBJFRoi4bLQAQispgalCuX66475NMg8bANuOsZcu+Y8xHv2uTv26z1tgADLVyuhK0WQRcZbYGWUm2tuIHp7HWp7EwI1ou8Hma1NCbNVjVM1g9GZEsGUXdM/NTZ2ZGV+qNCRw7vy8N8vheY+izcyiImKnMrE0DcRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLgqRrLhgeLeRSZjANMIfQZFI6jUqu2MTLCYK4ri0m0=;
 b=NICoYEGywYSu071HaT28BsetU64ZwhkWW6q6qJNulB1PihC+K4EjXZVVqm87bx/L9RYAGQ+ig53B90mmAYMjBal/fs6yEhPr/X0ErOVAJAkWrEWm4T6Nq3DedmURSWEZI0+E7NyAFEE5Fz/76mIIlwc86gUhHKCJP6ZkCU8+0Wiq+7E3WSdc8QeS2v+yLS574kfqBY15gdDbh3x3cZFGTQcXiXh66llQwc/gp31UN3UqVrq/i8EdAHFiMuX6xlRTA/Sc/On4TwzgzWfuy8Vs2CFxkFsVbb6Z5UFoJmeXMx1JP35T0UEaWnFeqpTY9G11D4C6wfQwoop7Kb4eeM9zrA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA4PR10MB5515.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:270::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.15; Tue, 12 Nov
 2024 20:07:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 20:07:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [meta-oe][PATCH] curl: upgrade 8.10.1 -> 8.11.0
Thread-Topic: [OE-core] [meta-oe][PATCH] curl: upgrade 8.10.1 -> 8.11.0
Thread-Index: AQHbMvXFTYi93Vg4mkWTPJdX6PvGr7KyAK4AgAITAQCAAAJ5IA==
Date: Tue, 12 Nov 2024 20:07:46 +0000
Message-ID: 
 <AS1PR10MB5697D8D971CCA169C8AF8250FD592@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241109222058.1949835-1-peter.marko@siemens.com>
 <1CE2D433-AA61-482E-A0C8-5C1AB7299907@arm.com>
 <ZzOyqKFGwKIBv5Uc@bootlin-mathieu>
In-Reply-To: <ZzOyqKFGwKIBv5Uc@bootlin-mathieu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=34d3b116-d9c7-453c-86ea-1f00fbf3c8bd;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-11-12T20:04:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA4PR10MB5515:EE_
x-ms-office365-filtering-correlation-id: e8adcf54-3729-4b78-91c7-08dd0355acb3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OWhsTmdLUXVkZDk0OVBHazFJak9zbWg4ZzFYOFBYZ2d2Slp1VE15WXplazMx?=
 =?utf-8?B?Z3U2YkVLNzZFSjYzTm9tQmRYeHdyeWtnVzJ1a1orSWk3ZEo0TDh0R0ZUNTNO?=
 =?utf-8?B?SzFqM2M5b1F4RkJrTFNzVHNVL1JBdHhFbTd3Z2pFbGNhaFBQb2xoWERhczha?=
 =?utf-8?B?QVNrTm5MOWxad05JVXdmck14OVVmY3dKOTdlb1hZbXpVdW91QkFKaTE4Wk8w?=
 =?utf-8?B?NU11QkV0bGI1QU5SZEU4RlR2QWV1ZEg1N0JiTFB3ajFXTUIyOWRmMC9UUkRI?=
 =?utf-8?B?TU1teHdGZnZkTTJ0NzF2MGhlRHhNVzhQMk5uVUlQUFB4anFQQ1V3UGpzK0N2?=
 =?utf-8?B?dnZzOUxIcXB2YjNPY2hEeG95OGxOYkZPQXpST25Nb1dTM0lGcWk0M0R1aGpK?=
 =?utf-8?B?amdmWUlEVjBnVkJrZGhyVTZDc2tHbDdCbmprL3JmaG0rNS9sek5QY1E0bWNI?=
 =?utf-8?B?S1dZeFBIeGxPNWErd0lWRnFjZjFmeWsvZHJjTURWY0dRdTdCUEM2L3pwYndJ?=
 =?utf-8?B?RXhBMWNuS1dvN0o4dTJPcXQ5b0hiTEhaeEJQcW9GKys5YkVleHZmYXNiWHNI?=
 =?utf-8?B?dDQ4UXdlS1RROE1sL3lXYTZYaDJPWnBTVjk4ZVVCZFV1REJyQ1ZYdEJxbG5x?=
 =?utf-8?B?V3c2dWVndWp3YWJnMWFHbE5hQ2ZLbXdzTGhERmV4b0dYUmlRcGt1YzJJd3M4?=
 =?utf-8?B?czJlTndybVBYNmZ6NDZLNlVDaEUxeWJlcnZlZCtaVUVjaGNDZXpjWDlhbDVF?=
 =?utf-8?B?T3A4ZjFDNVFkOXM3TVpxNmhUVnJSbk82SEJ2dFh5UlZtNkltWFhTbVBkSW9j?=
 =?utf-8?B?R09PUXFnbWVtZXJxZXIxYmVjb253dmM1OXBnRGs2eElKR2lUby9jOGpjNXUv?=
 =?utf-8?B?RFZRTWpaMVoxbnA1c09iZ2ZtdHBMejNHZW9VNmM4bGNTNEJzcE9HbVdLZWVz?=
 =?utf-8?B?cmV0SklPV0lrcERHOWpmcThqejBuZk4wREZGWU02VytxQ0YvTk5reXFhUjBt?=
 =?utf-8?B?UmxvWlZGQUFwZHdXNE02RW1pVFpuOGFpeHNTZURCZTloVkwwNlZlY1V3STRr?=
 =?utf-8?B?QlNUaUlBbk1kcFlIY3F5UGp0YlZ5azl2UTRMY2RlVGFwZDE3cFpiOXJFMEUy?=
 =?utf-8?B?S1lVQTNkZ1pRZGRYaDAzbkJld05SaDUzZEFaMzEzM05HSVRyYkZWaDc5bkpL?=
 =?utf-8?B?ZThUeWlYME9jSmhSRG11blpjS3NUdTdzZVpiZDdQc1lLZGJYTzh0aU94eVpG?=
 =?utf-8?B?eUw5dTE2R0FUc1NJWTdvcDZKTEV2YmpaMTlESzBiNHBacm9mSWJlbnd1SGRX?=
 =?utf-8?B?QWJQbHUrNi8yWGF1ejV6OFZsUWlaU0RKenQ0bFpVSkNoUE5uYkp6blVEQ2pG?=
 =?utf-8?B?aUlVZzRXdldrVXFMQXBPaE5CYXh6K1gvQmRjVVZzN1V6dnJ4RlJEOE1LMHNE?=
 =?utf-8?B?b25OVW02QzNKNDdZZVRITWFtdlo1c0tzNG53UXNNNVc3STU2TWhrQU5vdFZN?=
 =?utf-8?B?WGtrTXljcjhsMUNlTWl5U25MeUdockgzUHVZeUwrK09nSkF4azVFVHBITVpj?=
 =?utf-8?B?N3gxbzNwNVJmRWU2UWdYaGVDaEt2Y2k1R2IwU1RlRDdyTURGQXppRDNERSs4?=
 =?utf-8?B?VitqTXprRklka1hWajZJL0N4S0dMamtseS9IMTYrOUlzMUgzY0ZJcmJuTUV4?=
 =?utf-8?B?d2NUemhSZ1VqRExDMG44eHdvRCtTbWU3QW40ZmlSWnpKOGN0Y0h3VEI4akoy?=
 =?utf-8?Q?zffICqxivIaRFG//HBoFylIHW56tbYS+8iBBJOZ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b3NSMGlYUk9nMTBqWVMvU2R4V3VVNjJjMXcwWnUzK01Mck1EMTFoUzZXSzFH?=
 =?utf-8?B?bkI4UTJnY1ZhOHlFTjFjUnpweXZaVVowTGFkTUlsZUh5Mmphbi92Vndrekx6?=
 =?utf-8?B?R1RmMlZQemIrb1RMeW5LeStKRG84STZOdWZPbHEzUUlmb0JnaWdxNHExcHhC?=
 =?utf-8?B?MWlLOTRWYVZQaTJNRzJFNlNRbngwSVZ6dHJFQXdiY0RRVTMrZElOVG9SL2dO?=
 =?utf-8?B?dVNndXBuMW9nc043dU9LSjFnYnpuT0tFWnllRlBYL2l2MCt5eDRuWEJVWU5P?=
 =?utf-8?B?SEw3TXpNUmp3Q1VhQllqT1hvNUtHc0poTytKcXdqZWRkWmMxN0F2cmZqcGI0?=
 =?utf-8?B?T2FkQWFpWGRzdG1CNnhCY3BUWExnN1U1anFyK1VqV3VpT1JxZzJMMDdlNTBp?=
 =?utf-8?B?YjdVaC82YTVVRnBYa05FSklidnRjL3lmUG5UcFNTRzdjakJWZDVTQ0hKRlky?=
 =?utf-8?B?TkxtSUdkKzNUZUFTMFhYNFIyVzloZGQvUGVLM25lU3hWOFgzck4xTXpWL05n?=
 =?utf-8?B?SmxvdjNvK3NSN3dhdXdWejkvZmhZMDZHdnQ0eXBpSU9teHp6c21WanBBcDQx?=
 =?utf-8?B?YmZZUk1KTlBPWG12WmloVkhTbmNZOVNLL1Z6SzBBbHQwczZVTHRMaWlsNFg4?=
 =?utf-8?B?eGcvMTk1L0NpajJjaVh2S0tpQ2prM2hoZ2d5bkVLYnZTWE1pT2laRjA5bERy?=
 =?utf-8?B?dyt5WjNKSG1wSzFDV3pIY2U2dGlaai9OZ25pRU5RaXk4WGhvWER0MGU2Nkls?=
 =?utf-8?B?emhuQUs1Tkd1TndnQTl1ek1EUVJkZkRraXh2VmUvOEg2OUoyd3RyWXBDczNT?=
 =?utf-8?B?MEpWRS8rczJVendBZkRaV0FrTVZnNGw4dFdLTkM1amptWWhzRjlKSWdnMzBK?=
 =?utf-8?B?ZXRCYVNmekE3cWNkbU90bkVmeVhGbzJQUUVhQTZzdUtrVnNkQzh4WHdBOTg1?=
 =?utf-8?B?UXUwT3F5UXgyZjNxS21vMEdkTTN5RVZ2bUFNdUppWVErTDRsN0VxbVFRdUMz?=
 =?utf-8?B?S2ZNbWgwL2JtcWtjMWJZZytPOGY2Tjk5WnhUaHJXa0NMS2h3T1pVY1NTRm1B?=
 =?utf-8?B?bzhtY0Y0UGpEUEw2OXRzWVVFWXAxdzVidUFQSkcxazBxaW1LR2gxVFhMWnV4?=
 =?utf-8?B?ekZrQnoxYmxlRzAyUzZrOThxdFBDc2NURVIyUkRJanVWcjdnaUl3NUJHL0Vr?=
 =?utf-8?B?Njkxb1dyUUtqZGpydktodlQ0cy9YNTBKczdENmVCS2JPM3c0Y2MzZThITm9o?=
 =?utf-8?B?NWJ5UUpNczJ0ZzVzV1AzY3dCeHVDMU12dmw0cXNtNHZzYVpTM2QrTkJyN1Yr?=
 =?utf-8?B?ZzNUSlN1R0dIRzdpTUtMMCtlQ0QxejFTbzZGN2hrZzVjOEkzeVVBbUJocHdZ?=
 =?utf-8?B?bmlTRTMwMnpnanZ6VGs2UUdkVG5MWHJGSEcrOHQ4emYzQ1dIZDNOK3VnNkhM?=
 =?utf-8?B?Q0sra1BIY0FmYkNwSTArZDhoWXNXNlorcjArYkdpWm9yWGMrbG9Hb084U0Zr?=
 =?utf-8?B?K0hPbHR3NDFPNWh6cnIwOG9xc3pRL1dlTUlVb2FSbVZvVE1pNjZXMkppdXV6?=
 =?utf-8?B?ckQ5ZEJZVzRqdVBqbEY1c1duTmdiNTRGV0pvQVYrUkt3bFhOMGpwWiszV2ZY?=
 =?utf-8?B?SVR3OUE0eHlSdHVQQ3cvS1d6TDY0S2sxSXhFQTBpc0xxQlBmQk9RbzJ4M2Rx?=
 =?utf-8?B?S3hYTUlveDZqRU02QmlqNXBSZ2NHaW4yOGQ5VVRvV2RIUGVGbW8rYmt5NU04?=
 =?utf-8?B?ZG5QTDdGZEd6T3VPNEpDdkJoaWE5UkkzL05FV0U5ZFZYSHlhWFcyUFg1QUxD?=
 =?utf-8?B?c2RTd3krYzlQcE9Bc2N0N2xXTWM3Lyt5RDZpOFdEaHZtU2VHUzlHcjFpZEY5?=
 =?utf-8?B?REJYUmt3RWdBS1owWEVPZXBFVml2dWVDdWwrUGFGYkgzcjJZU1krRTJ4Y1la?=
 =?utf-8?B?aXYxak5wSkh1QmQ3MXdtSVk0TzFNR2RJRFpRSERzM1dQZ0JkWFJkd2ZjQlVC?=
 =?utf-8?B?RmhDR2tZQUhSbHp6Tnl2czAxSEtidXVkVDlqdUl5WEo5aTRSNTlqbnpTR2FF?=
 =?utf-8?B?ZVk5RFNqY1RISnRIc0xNcWdPbC9lNUNaNGxpUm9DYVBnMTNpOTRxRnQxQ0s0?=
 =?utf-8?Q?pA620mLhVpV8I+UNYeXiLmWFV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e8adcf54-3729-4b78-91c7-08dd0355acb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 20:07:46.0971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1KQnctnT4YhLr4uqAoaU2kqF2d/PejS0FHLROEB/3Ef5Nz77BvMz6rBJAIvHlyuJCfviOT1w86ABvEuh9t+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 20:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207064

T0ssDQpJJ2xsIHdhaXQgYSBiaXQgd2l0aCB0aGlzLCBJIGRvbid0IGxpa2UgYmFja3BvcnRpbmcg
bWFueSByYW5kb20gcGF0Y2hlcy4NCkFsc28gbXkgcGF0Y2ggZm9yIGJ1aWxkcGF0aHMgaXMgZXZv
bHZpbmcgdXBzdHJlYW0sIG1heWJlIHdlIGNhbiBnZXQgc29tZXRoaW5nIGNsZWFuZXIuDQoNCkkg
dGhpbmsgSSdsbCBqdXN0IGJhY2twb3J0IHRoZSBDVkUgcGF0Y2ggZm9yIG5vdyBsYXRlciB0aGlz
IHdlZWsuDQpTaW1pbGFybHksIGFsc28gZm9yIG9wZW5zc2wgd2hlcmUgdGhlIHVwZ3JhZGUgaXMg
YmxvY2tlZCBieSBweXRob24zIGNvbXBhdGliaWxpdHkgaXNzdWUuDQoNClBldGVyDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMtQnJpYW5kIDxt
YXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVt
YmVyIDEyLCAyMDI0IDIwOjU1DQo+IFRvOiByb3NzLmJ1cnRvbkBhcm0uY29tDQo+IENjOiBNYXJr
bywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4g
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFttZXRhLW9lXVtQQVRDSF0gY3VybDogdXBncmFkZSA4LjEwLjEgLT4gOC4xMS4w
DQo+IA0KPiBPbiBNb24sIE5vdiAxMSwgMjAyNCBhdCAxMjoxNDo0OFBNICswMDAwLCBSb3NzIEJ1
cnRvbiB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBjdXJsIDguMTEu
MCBpcyBrbm93biB0byBoYXZlIHNvbWUgcmVncmVzc2lvbnMgaW4sIGZvciBleGFtcGxlIGZyb20g
dGhlIGN1cmwtDQo+IGRpc3Ryb3MgbGlzdDoNCj4gPg0KPiA+IOKAnOKAnSINCj4gPiBBcyB5b3Ug
cHJvYmFibHkga25vdywgdGhlcmUgd2VyZSBzb21lIHJlZ3Jlc3Npb25zIGluIHRoZSBsYXRlc3Qg
cmVsZWFzZSA4LjExLjAuDQo+ID4NCj4gDQo+IEhpLA0KPiANCj4gWWVzLCBJIGNvbmZpcm0gd2Ug
YXJlIGFmZmVjdGVkIGJ5IHRoZXNlIGtpbmQgb2YgaXNzdWVzIGlmIHdlIGRvIG1lcmdlDQo+IHRo
ZSBwYXRjaDoNCj4gDQo+IGZhdGFsOiB1bmFibGUgdG8gYWNjZXNzICdodHRwczovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2dpdC9kYnVzLXdhaXQvJzoNCj4gLm5ldHJjIHBhcnNlciBlcnJvcg0KPiAN
Cj4gaHR0cHM6Ly92YWxreXJpZS55b2N0b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvMzEvYnVpbGRz
LzQxMA0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0K

