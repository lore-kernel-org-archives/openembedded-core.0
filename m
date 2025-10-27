Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E0CCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:37:54 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.29])
 by mx.groups.io with SMTP id smtpd.web10.1864.1761597463570668068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=W0ju3gRu;
 spf=pass (domain: siemens.com, ip: 52.101.72.29, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epiG723JbHqquDdNEk0T77foImuD39YTs0VyGO8oAngOveO00Gpv4Ru4J4vTJeXyITI7tvKN65UIhAiFDsJk+zOVtLsxOKi1/13iJMmHxZlqojKdW16z6nlY/2D1y6eaqb4hOpJ5OZ/XvHpnk67L9hpgPmu0g+QDaiVPgqJR8EVF3VkWvl6HiRjN5yPIqnsDh8ufHGoyFhkO0dA1kzu25vDVEqe3DLniLWuoF/8d7KQpNj/WMyntq6DIccMcb9zH7A9NPWzt+wRciZlqUfnnxu0XwUdmndZuh+UvNXGos7x9Pu0kAMgEMbAmC8bmP29FMN2FL16kf0m6hnolNEy5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/K9BEPhdcTRzF764jsAe8vifbWb/+RRw8BNWUR9uu3k=;
 b=ZVn5fKtAebMMg8RKaewb+5RMurjph+OrD9ZOQCHGcqJUqTj/7sLy4qqSokq9zvP3X4qcBKqQXCgWCyIiS8r6e58aq8q42Jsyw1ZkjJQkg9k3vyHJO4rTpI5rC84KyVyq2wiQUHb4lbd9kV1CMzJHfWGM3HdYZsMQvJXoZTOvDarGYsbVuNxSXoRXnANAop9HeKE+ih+AOQZ9YFp/J3tdlucQ/sy5bs8LIowtasp0WxvuatIDwPQFzzSLZQ+ZFBZFrEyl/Bnvp4lbBg8bIxObNn7sBuAExAGoa629paJjGfwlKEvhtftgDcMC7vkd4pnNYGwHSo2/DyD3CZpgkeXPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/K9BEPhdcTRzF764jsAe8vifbWb/+RRw8BNWUR9uu3k=;
 b=W0ju3gRu5u/qflvmxnDLp4KD0LwSS4QJY0jfD0kkvs7eyBgo0o7CAjWWXC/tEQidWUeLRevnjWCTOqrEPwmAGgdg4NwCNDQ9Fhlhvwu1uK2DP4kbG4trRuCeY7FLgvZtHbkkj6Tyh1W/izjMZfSakA/CEsEv5tlOPsGzXBRtI7yZ/jTR3d9p/58Z4zhU7ICEc+4bNV0Lqe8LHAEhKQOrJco3rx5vYPpDER306rhig6z21Nq0nWEo9RFTkAuFHJtOlIpkKwZDdVniJekN5KJKATgEnWFccMq9FFPLJ7+njQd3lmKdNsYh79TINqCkQn03XDQgyp+I38bHrITM2/wpgQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7163.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:313::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 20:37:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 20:37:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 5/5] binutils: patch CVE-2025-11494
Thread-Topic: [OE-core][PATCH 5/5] binutils: patch CVE-2025-11494
Thread-Index: AQHcQg49F6WXSfEAgk6k7/26g12fK7TN96iAgAiGvPA=
Date: Mon, 27 Oct 2025 20:37:39 +0000
Message-ID: 
 <AS1PR10MB56978A3DA977A8EDB85E86DFFDFCA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251020220912.483748-1-peter.marko@siemens.com>
 <20251020220912.483748-5-peter.marko@siemens.com>
 <DDORZHMNHUIA.19MW98T9MIS1M@bootlin.com>
In-Reply-To: <DDORZHMNHUIA.19MW98T9MIS1M@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=023a4537-ac3b-44e9-be89-2176b2636125;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-27T20:35:36Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7163:EE_
x-ms-office365-filtering-correlation-id: 87e2793b-4bc4-4c98-176b-08de1598abea
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QUIrOVNIZEFBVitNVnpGbEpvWllmVHkvWWZuU1AzOU03WCs1d1Z1T3k0QkFV?=
 =?utf-8?B?cTBlQmk5UENiVFRvSnYyTDVoTDNIcDVocGhtM0pBaGFxWFdPc0FsWGRkU1V2?=
 =?utf-8?B?cDNoZEd4UWFEbXFGV1FYaDBOUWhLdFEvQkF2STRtZHpJVjU0NFc4anMrT250?=
 =?utf-8?B?bG1FeEJST2hQOFI0NW5wdjEzRnFYeWp0Rk1qQzAvV3hPcm5kekhGeStpM0hV?=
 =?utf-8?B?TXd3bnFXU0ZGQ3cxWmFnOVRhbENPSEJEK29Od3pGYVV1dXc3VDdyMHpOYlpy?=
 =?utf-8?B?SFFPWTZrZmRvQXJZTzJRL01QTlMvRS9NWXdqNjJXOWkyYkNxSWQ4dG9lOFdZ?=
 =?utf-8?B?MjNtWDE5VnZ4Y1g2Z2hybmhXZTM3M3h0MlgwU2tmVjZHTlhNN2l3WnpiNE1i?=
 =?utf-8?B?Wm9LU0E4b0ppd2NmNUlOK3ZEZmh6ZGs5b081aUNhS2RrNTBFRHpuTnZLaTZP?=
 =?utf-8?B?Wkl0Q2FVSHlQM0MyVitKdHI0TVhVNm1YMHBHRTJlS2Q5d0NwM0FEM2c4b3dn?=
 =?utf-8?B?MFJPaDV5ajJVSE1OVTJvdXM0T0lYSUV1VXZ6K3BPSUtwTTNjY2R1YkllWFBU?=
 =?utf-8?B?TFYzcEl6QkEvUzhMTUJva0kvRURqQm5GMVRmTTNTNEplVzdyU21yaTJpL3p2?=
 =?utf-8?B?Z2Z4UmgwQUFnTkkvcHZvb1Y4NnpwZ3FzSGJOZ3RxYXRFUUdhT1JqeGRTUXRJ?=
 =?utf-8?B?Qm84dzdyVTBsRk5lNDkwTGJGbU9XR3p2RzZGWk8wVE9saTZtb1RyVmJaenVQ?=
 =?utf-8?B?TW85ZmZqZkxCYVVxWnFFdXVpTG83eVdNc2VVSFowblhJMVJhbWFvdXFVZXZk?=
 =?utf-8?B?ZVROYWVZY2x0TThLVkhTTjhVWklQbllSZHJ1QysrbVhmYU5qTG9CSHFVbStS?=
 =?utf-8?B?WlNNNGNsV1QwalUzcXNCV0hSMGl3czVpQVc4dzNTYlFBcUtpc0hjb2Fjeldj?=
 =?utf-8?B?b3RKWjVDYjJidkNtdWF6cVNEK0dxSEtRV05EbU9FN2FBRHhoTFVGdUVxM3F4?=
 =?utf-8?B?U2NwYnh3a0lqQVVPODh5amlHTjgyak5rSjhZT1VYeklKUnh0ajd3V0dGd2ZI?=
 =?utf-8?B?bUI1NldabEpxZXphWlpVeWx2YlcySkw3VzZrRklYV3YwQXVnOFNZazFQY3VH?=
 =?utf-8?B?TGo4VlJLR21vZHd6ekoxQzdibXByMDErVkttZk0yeVQ5bVJ2K1Z1R2VZY2tF?=
 =?utf-8?B?TW02bkFUUzRERlFVWE9lNDN0ZjVVdzJxeXhwSUh2OFA3KzhLTytVV3FkekdK?=
 =?utf-8?B?UWpUMnpyZWI2STZZOXY4Uk1CNjVKMDVubm1VSTlkdFg1ckVSam1mb2UxNFVQ?=
 =?utf-8?B?bUhHQ1pEWDNuNCsvZzYwbVJHN2hwSmFNN2gwN1lEYUZzNzJneTJlcmpHYXEw?=
 =?utf-8?B?UmE0Q1JYWGlrLzdhaWtpTVQ1UG9hL2lFQ2lGNGZiOHVhcmtRbG9iQVZYVENh?=
 =?utf-8?B?U3p0YTFhdmFZdHF5R29aeFA0blVocExyL0xEZzZJVUJpWkJpM3FqRGRtaXhS?=
 =?utf-8?B?ZGhzRGFLU0d2cnkva3ROdlhVLytvdFk5dm9ydWlicUx4TjFMQ2c1ZGUrS3Jm?=
 =?utf-8?B?ZFBQWlFZbkJla05qNFd6U0VyZzU3dGF2dEhpOXVnNGFZN0ZWR29TUHVwNGNK?=
 =?utf-8?B?T3U2SmI1OTMweFpJRmQxOUdQdWNyYUk2d2JDR0lSUjFRTURCYzNRa1NvNXYx?=
 =?utf-8?B?M1JPZVNEZXpZUThmWmZIamZCbXBXYVVoU1d3MTlUK09XZzBjZUtIVGRzaVhi?=
 =?utf-8?B?VEFXbytFMUZyNkNZT3hvY3ZMR3Q3bWQ3QkRURVNoYU5UejhRSyttVEk5ZTBE?=
 =?utf-8?B?dlhLVndVQm55aTFtSU1MNmc0dUhtMUdmUU1LRHg3dGhmSVFtODZkOE9zdC9E?=
 =?utf-8?B?bWJ0YTJNODd1NTlKMWxpUzhTM2hCSklScUtDWUZ2K2p0WW5IQzVuaG13Y0pr?=
 =?utf-8?B?MXh4b09vb1NnMC9YUGUxekx6Q2V5dnVjR1plK0tSSWFpL1dEZVN2UlBPbFRp?=
 =?utf-8?B?ZTZnaEw3bUhBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Sm5RU2FtTGJrdE8vcGRhdWtDcVFYVjE2TjhOQXl6L0tFamxCSW9rSHNxMGMy?=
 =?utf-8?B?dk4zeUxDOGRObStGWUpHV2ZxQWNYNDJvZGd4UXVQMHNYeTd1U0I0K1ArQ1BI?=
 =?utf-8?B?SjA5bG8vVXYvQTZtOFNRRno4NmZaTXNrRFhnUHlpckYyeW5nN0F3NHpDcUJO?=
 =?utf-8?B?RytyQ0ZSTktvKzQ5aFRzYTFOVDZNVHVadXQ2UjRuZ2JGMVRySlZVdHRnbUpK?=
 =?utf-8?B?Y1psMk15YkVaMkVUZzJKU2N4T0ZYZm50VGZwWFNEYnNobnBCMlFUanU3UE4r?=
 =?utf-8?B?THNueXI2dU5sOU45dW50RGl0cDhyUlgySnAxdzdXRHhpNlpERDk2NXZ4Mmdu?=
 =?utf-8?B?cFVXMUNHT0lIQWFKV3FGdEROSU5tamRVNzJ5RC81OVdXejR1TVR5eXdBNXhG?=
 =?utf-8?B?MHFLZUw5SkJUWS9GRFViOUxKdmJnOVh0V25reWJZcXppVTc1dk1zRFRQVU9N?=
 =?utf-8?B?NVM3YlZRWThmTU9ZNytnUkZ0VlNHWXRWZ3p5RW1LR0JYVEI5L1podndlSmhy?=
 =?utf-8?B?NlUvc2hSUXpseGxzWUtQNC8rbkN6RVdSejlEYmV0L2w5Wm1nQlV6WldWYU9B?=
 =?utf-8?B?ZmFLYjkyVEx4ZFFzbHNHdjYwK0VrWldIcXNBbEE0cTVvY1QrNjVPdjl4ekFt?=
 =?utf-8?B?aEtOTGZTYkRPUGpLb3hpYXhDSFBjWDB2ZGJ4RU92aEZ5eGZDaFlWTVZqUDBs?=
 =?utf-8?B?dFdSUExZdW92M1RpZ2U3Zm5FeXc2QkN3TVFzM05tTWZvYjZzYm4xZDRwYjRh?=
 =?utf-8?B?a3VUdTFJN2d6bXdTbjJDbTE1cTJ1SU9GMEVEVmVNMlNhcmgzdVB0UTU5cXBU?=
 =?utf-8?B?NTBTL2htWXEveUJHd2hwUHoyYVJPZkpKaENxZlVqNGsrelJuNGFKeW1admVy?=
 =?utf-8?B?djAvZkcrbU1hYVdhY0lqazY4bWtvbko1ek9rd20yWVNUNGRGbVJnL2NlQWZ2?=
 =?utf-8?B?Q01TWnpTWGJKaGpNQTFaL1VWYU16d0hSV21xZFo1UEc1NXRFeXI3SjdqemNF?=
 =?utf-8?B?TDVnSC96NFUwbWliNnE3UXpnRmhjdGVkVzJFTTF5V2xubzZEVDUrQ3lTR0RK?=
 =?utf-8?B?cWZDNnRnMFBQYWpURUhRZ3pYdEd0dXE2Y0NWRHRRN2ZEdEd4TDJGUnZBb0NJ?=
 =?utf-8?B?WFA5eWJsbW1SeGRMUWJlbkh2anlUbkErWXByV1lucVE4TnJzYmM2YzNGU0xx?=
 =?utf-8?B?RVEvb3pya0w5bGpQSzhhd0lNeTdPUG1ZcTZRSGVvSktpNGtvU2J6MGtTT2dn?=
 =?utf-8?B?dHlQZmxkYm5reUtjNGU0blFTQWpLUzBGaEt5ZmMzd1N6Mml1eTNvakVaWksy?=
 =?utf-8?B?eHVzUXZSUVZOajdhODRJZTlQVStBMG1Fa0NiV0tVRWpJNXROV0Q5TWVLVm9v?=
 =?utf-8?B?Y3FPU21MZ1pycHJjMG1GYW5NRVFydGZjZVVxWFo0WlNYOUZyUDFpZnB5anNj?=
 =?utf-8?B?M3lWZFBXYWhhendiMncva0IzZk1GZGJITWFEdGRwa3BmMTBtdGpWRUF1R0dw?=
 =?utf-8?B?Q2hvaUhRb2JHdWJqN3Q3b20xN0h4NGY2QjNYekw1UWl5QTJjcDRhR0dYVnow?=
 =?utf-8?B?Z1V0YXcrSkh1ZFlVRlp6RGgveHQyTi9vbUpxYWY3YkhHaGU2UzFCQWJVZksw?=
 =?utf-8?B?QVVCdVNCcUR2WjNxc3NhbDRxVWZzR0pXUUFmNEhsSEZ2Q2xBU1RoVVkvM1o4?=
 =?utf-8?B?bllCbUptNGh5dVhFczgrQUpKa0t3SUdmQlFKUFhQNUplOTNNcHFkajRvc2xE?=
 =?utf-8?B?TGh4Y0JkRUR5Yk9aK0hLWE51MTd5Y3R4VTVhVytIM2syaVMzMWNBeE9LZFRz?=
 =?utf-8?B?Q01uZHFJWHZ0V2hmd0g0MUtEb3Jha3V5ci9lZlZDMHN2b3ZMYVRaQndxeExL?=
 =?utf-8?B?cjFId0xpVm5tRDkwTi9tdEZYaGswbDB6a3JMVTNoWnpvR1ZiekJWbk1kMlRz?=
 =?utf-8?B?cHFLdUJ5SHkza05VdHN6bkZqOTUyQXVvUTRLTHJISXhjUllUQlIxVm5ZM1Ru?=
 =?utf-8?B?MWR4VTl4Nkt4NTc3a2s0a0RYc3NpaDh3UjhjcVhiYmJ3VzZsVll2RHFTdS8x?=
 =?utf-8?B?dHhSVTVXZzdaQkRlMEcwZnhXREwvN2hIMUpONi9qdGFtRWYvK3lGV1Z4WFVl?=
 =?utf-8?Q?SERgd9RqI/Pgm/oZX/uoMuYcX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e2793b-4bc4-4c98-176b-08de1598abea
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 20:37:39.6435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jRIzOZquQWdz3buiQ8D0YE39UtqXCUlR1I6AOzlub8zEXg+8gk11dEHsn7JYcmAuLshLI+F+zPT/q7CG12b4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225358

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgT2N0b2JlciAyMiwgMjAyNSAxMjoyMw0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVV
IFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCA1
LzVdIGJpbnV0aWxzOiBwYXRjaCBDVkUtMjAyNS0xMTQ5NA0KPiANCj4gT24gVHVlIE9jdCAyMSwg
MjAyNSBhdCAxMjowOSBBTSBDRVNULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVu
cy5jb20+DQo+ID4NCj4gPiBQaWNrIGNvbW1pdCBwZXIgTlZEIENWRSByZXBvcnQuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+
ID4gLS0tDQo+IA0KPiBIaSBQZXRlciwNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4gSSBz
dXNwZWN0IHRoZSBsYXN0IG9uZSBpcyByZXNwb25zaWJsZSBvZiBhDQo+IHJlcHJvZHVjaWJpbGl0
eSBpc3N1ZSBpbiBnbnUtZWZpOg0KPiANCj4gQXNzZXJ0aW9uRXJyb3I6IFRoZSBmb2xsb3dpbmcg
ZGViIHBhY2thZ2VzIGFyZSBkaWZmZXJlbnQgYW5kIG5vdCBpbiBleGNsdXNpb24gbGlzdDoNCj4g
L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3JlcHJvZHVjaWJsZS9idWlsZC9idWlsZC1zdC9y
ZXByb2R1Y2libGVCLQ0KPiBleHRlbmRlZC90bXAvZGVwbG95L2RlYi8uL3g4Ni02NC12My9nbnUt
ZWZpXzQuMC4yLXIwX2FtZDY0LmRlYg0KPiBUaGUgZm9sbG93aW5nIGlwayBwYWNrYWdlcyBhcmUg
ZGlmZmVyZW50IGFuZCBub3QgaW4gZXhjbHVzaW9uIGxpc3Q6DQo+IC9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9yZXByb2R1Y2libGUvYnVpbGQvYnVpbGQtc3QvcmVwcm9kdWNpYmxlQi0NCj4g
ZXh0ZW5kZWQvdG1wL2RlcGxveS9pcGsvLi94ODYtNjQtdjMvZ251LWVmaV80LjAuMi1yMF94ODYt
NjQtdjMuaXBrDQo+IFRoZSBmb2xsb3dpbmcgcnBtIHBhY2thZ2VzIGFyZSBkaWZmZXJlbnQgYW5k
IG5vdCBpbiBleGNsdXNpb24gbGlzdDoNCj4gL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3Jl
cHJvZHVjaWJsZS9idWlsZC9idWlsZC1zdC9yZXByb2R1Y2libGVCLQ0KPiBleHRlbmRlZC90bXAv
ZGVwbG95L3JwbS8uL3g4Nl82NF92My9nbnUtZWZpLTQuMC4yLXIwLng4Nl82NF92My5ycG0NCj4g
DQo+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3JlcHJvLWZhaWwvb2UtcmVwcm9kdWNp
YmxlLTIwMjUxMDIxLXUwamFwOWsyLw0KPiANCj4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGVz
ZT8NCj4gDQoNCkkgaGF2ZSBjaGVja2VkIHRoaXMgYnV0IEkgZG9uJ3QgcmVhbGx5IGtub3cgaG93
IHRvIGZpeCBpdC4NCk1heWJlIHRoZXJlIGFyZSBhZGRpdGlvbmFsIGNvbW1pdHMgbmVlZGVkLCBi
dXQgbm90IHN1cmUgaG93IHRvIGZpbmQgdGhlbS4NCkxldCdzIGtlZXAgdGhpcyBvdXQgYW5kIHdh
bnQgZm9yIHRhZyB0byBzZWUuLi4NCg0KUGV0ZXINCg0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4g
DQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

