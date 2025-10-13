Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52765CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 07:07:37 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.45])
 by mx.groups.io with SMTP id smtpd.web10.37001.1760339251315280231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 00:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=uWST02sc;
 spf=pass (domain: siemens.com, ip: 52.101.69.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsoXKKGTofLbiuvqrGEOtrAh1Bn4WfwBsJaXTj/l1eFxr5dD2y+KhL8vhQACUu5Cc4Rks9e8207QuywTzZ3q64T5b2drzKtJF88Or/1Io1ouqkF0GRnnqKSi2aCp1TqQijj60Izoq2mKcJoB3n8kY0mJlzuzG//XrvCN2fNkT2EemMgC6Jqcw02PB34w/DZ0Jlzo4nrKjxuCRO9KphgqImm9V+1EQ0CfBdWywsfDPaem6Clu8BT4wpBOlxoHStQvSqiJLJ/TSU+lKFc+PExUH0iBHSLTq0xaS4Tf0NnrsbG9Qlx3WfdEcv6Y9H56F/qN56wR7fR0gUnY2qH5Xy3M8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0XpbVj3oGABjHkRIPtP+4uAxt0sDDvoY38Le1thS5Q=;
 b=WmomuSe5w8xrGc/q4L9/ntpZTFn0lMY/85aZvH1XjjOPmTzX2ytLp7p8teKuRPo/2ODg6XeTJ1F8JgvCexyfI4BBKTWXYWNuTexzgBPgrQr+96DyzKnEpVVHJhtXIUVwrc0niqiNF7Y3SadnmD9a2wr5Cts0/VB7cqDvSvLGj/vre4k8284M8pcIuc2zZuHSfE031GUtfKO6y9HJsZMr6k1ZTxFaF0IgpHd7Lj7RQv2iLLItXmzcnLU390Y5AXOnPF4xSpp65LLyDetKUl23l2Z+y781EsPTHae6NwPG+rfQWZEz6FYsIDrRce94UAH6MsXgZcHx5+JeVSvYAciTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0XpbVj3oGABjHkRIPtP+4uAxt0sDDvoY38Le1thS5Q=;
 b=uWST02scHZfetqBgHhtHe+FBhKT6SAfYFDI2f5QqQMx6nqPcwnZH6s6lCD8U0XASD/cqvmme6Jg9RmH5oPKvBL2gh64JVnumFYw+4kBAZmtdR0LxPPjFsyhtnmnQuegQmYmlLmanpCp0Xjj31D37vz3fdYaxCF69XVK11w/Sa81cUieFuH9BJCP6KvQlHKCSw2Fvsm0MqBKlIamRPAxbDUWaLTwjgHt+ZFX9EGgw6rRBoLYbZNUtMisegY9NGjJGQRKLyzaMFj0g68ngAsghD2Gg0eM82TT61fLg5+g7Kwjqon/4XVPFCVoO9yWhasJGqirkysrRZq9180GpF1NwQQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7419.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:30f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 07:07:27 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:07:27 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcPAnpEUlKPzcbL0ePyBWu4USQ4rS/m8VggAAI5QCAAAM1EA==
Date: Mon, 13 Oct 2025 07:07:27 +0000
Message-ID: 
 <AS1PR10MB5697AF6A2B8D7D88D297EE7CFDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <186DF8D2507720C0.3474@lists.openembedded.org>
 <AS1PR10MB5697EDF33ABB021BFA11FB7BFDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj8ynORdNtr+nxm_Mbv=O_hMjoa2uhFJZ_OUH-t12vpnfg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8ynORdNtr+nxm_Mbv=O_hMjoa2uhFJZ_OUH-t12vpnfg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b44c6ce8-38e6-4aa6-9646-922507a0f53e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-13T07:07:02Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7419:EE_
x-ms-office365-filtering-correlation-id: 4ad86a22-f9ba-4c59-c05b-08de0a272b10
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bkdRVno0QXR3aXoxdXdvc2ZESlJ0MUs1SlJzV2JOVWpWYTFhOC9hRkpWaDAw?=
 =?utf-8?B?aG1YK3BncnlOKzZUKzRZN0hTMkV5VERxaTlDNGR0ZENuK1F1UUcxUXgrTzY0?=
 =?utf-8?B?VGRjYlpBZGl6MXBvV1Q4TzZZT1pVd0orWlk2SDl2U2RVKzZTaVM4cURSUklJ?=
 =?utf-8?B?NG1aVWw1WnpleW5FeTRTckRTalJITVBHNnFyMGRaV25MeXdpWmYzQVBDZitr?=
 =?utf-8?B?SnkwZ3ppR0NGMkE3NUxGb3Q3MkJnOTdQbGdWTFFpM2lkMzgrSVIzRXdzVmFV?=
 =?utf-8?B?OGdmMVJkbS9rRXVHNXpHVDFOUkszaFZIZ1NhTkNnTnpBVWp4aDV0UldhbFBa?=
 =?utf-8?B?QTlka2ZiQzQvcExnblZRWlMrUFFLQmxxcTVzVjlaRHNXOVpJNm5uckM1eXJk?=
 =?utf-8?B?d3NIQ2MrMzlCcGdFeUpQNzcrdTI0UEZjc0RiV2pMRnN4YTVXcVc3c1pxUXl4?=
 =?utf-8?B?ZWlxM3hLdHJQSXdoNkNrcUZQWDlEVUt2cUxpSlkyeVF1THJPMDBtWUQzMklp?=
 =?utf-8?B?bUYzaVhoTHZFcDEwcHdWN1RvWjBlelIzMG5rQ1dYWUtDSUszSGV0M0ppeWY4?=
 =?utf-8?B?aUFiTjNQK01ONUt6VloxeWNqaE1Uc3VIUnkzVG44ZitvaEtERWZVVEpGTnEw?=
 =?utf-8?B?UEQyQ1RtZzhFNTVLWVE0dHpxTExaQktGTjVPRzNsS2dGb05iZGg4YzA4aWto?=
 =?utf-8?B?M241a0JzbEpDd0VlS0RSYmlZMWtKQlBwNy9TMjVtUVdyRTVCRG5scFlVU3VR?=
 =?utf-8?B?TFJDN3V6SHpNWnRlQUJkdFhtT3BPSUVlc3kzcldCeGdDK1R4WUJUT1pKOG5w?=
 =?utf-8?B?SkJ3UnE0VXJibW0wSGt2ZjJUOWV4ZnU1OVpMQmNQVTVsbjlzUmdBTXlZTjFj?=
 =?utf-8?B?ampsQnBSTkxCdW95YkRqOFMveFpaZitmQzdGNmJubUI4ZlJ5NEZmd0lHZ3lo?=
 =?utf-8?B?MDNlRks5bkxCMHZXRTZpTVhHU2Nwa3V5RHZuMXl6VmhPZVVveXZjRW9qM0tU?=
 =?utf-8?B?SzQrcmttNnZoWEw5Wk5BR3MzRGhEaWkwMkVsTjQyK0Y0Zy9BRjVsZWNveWJ3?=
 =?utf-8?B?WFAwOXJWVGo5RWVCbXpYaktiNFZCVmtKeU1FU253UFZtanVlVnU4T0l6SGUy?=
 =?utf-8?B?Skl1RVJrMmNDWVVtL1A0YmUvUVNkLzFwQzJRSXBOUjA5SjhGcEhNTDNOMGVW?=
 =?utf-8?B?UnpJTmh6cmdZczloOFkxbGpQZ2thNDhxSUtSUTJ2K1NtZ244aS9RajNlMGYy?=
 =?utf-8?B?M2hZd2daTVhZRGpid1duZmZ0bnBsZU5CajFLUU5kY1FQMm43WEJpa1MrdjI3?=
 =?utf-8?B?NVhobHN6UkZ4blhUQS8rTWJSbVRYSUVHUGxEbnRkaGl4NU5qQWcyQlkzU3dH?=
 =?utf-8?B?RzduT1VLaUpFa0dIeHRHZXZYQlF2cUhvS3A3akFNUjZZUG43K2ZkcTlQWE1K?=
 =?utf-8?B?QXIralBiR3lkbHpmWGllOURzSkxlTFd5TWhlT3NENzJzYllqMVR6ZE5zaUZT?=
 =?utf-8?B?TzR5WUY0QkZjWVBkU0RReUlDeTNRMlRIWkw1ZytqT2NPNlZDUmpFZEpoMUJ6?=
 =?utf-8?B?SDk4VUhHRnNjYW11T0NyQzR1NXNydnRBMkUwR3BZQ0UzMHAySlB1RUxwOEtr?=
 =?utf-8?B?dERFMnpUc1Z3NW1MVE02SkF2d0ZrajJ2Nk5nbUxGSldPejdyb1FVRjdnQ1g3?=
 =?utf-8?B?dUFNOVQ3YndlNjdtV0g1UEFiZnNlaXdSVjV3REpPZWNYYjM1OGdwbWhSckF0?=
 =?utf-8?B?WkZlODFpT2MvUVhRTlRpUHRSWlBwRmxQaXl3blRIblZFTkRyR0s0MUV0cU02?=
 =?utf-8?B?bUtTWjl2MjF3QllEWkp1aG5FbGd1YU9QWks4d2tjTUpIaHlDb0RTOFIyNXVR?=
 =?utf-8?B?UGl4UEVwa3o4L2lBcjYzNExNUnhVNDJ3b0VGWHVzTjVPQS9EaTcwWmNZdkFQ?=
 =?utf-8?B?Sk05MUxJWWVnWW1vS3RwcFRCR3lXbm4zQzdKZGFac3FvOGZNeUJWTUl3YjhF?=
 =?utf-8?B?V0k5b1B4QWZ3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWIvTVQ4QllHTlJ5Skc3MTlNVTRjcm8wU2FEdVRodERzWEdIUTE2U014VXg5?=
 =?utf-8?B?WDg4em4xU2JXWnVoREJaSUc5VS92bG9INzdDQmRoSkp5SXBVZDhKZldON252?=
 =?utf-8?B?S3ZpamdBV01YbjZ5bG5wYi9ON1pzdkZFUHNQUG1wRHFWalUxd2RxcFlKWFhG?=
 =?utf-8?B?WnVUcEJmYUpTT0FGZTZxSng3WHd0Y3p1RTljdDZ5QnkwaHVZMWFObVl2cWw3?=
 =?utf-8?B?eFE3cXJPNkpUWE4vTzM5dnRUeXptREU4MnE0dDNTWnY0ZHUweXltQmtVSllk?=
 =?utf-8?B?R3Q0aE83NUhXYTZKa1d3QTJtODZ5R0o5Y3VYTFFsRVdqMEJ5ZXpMTGZ5aldn?=
 =?utf-8?B?U2JUdStnM2hvY0UwZjVreUN1SkFwUnQyYVppUklqRHorNlJCOTEyWVNJSXFT?=
 =?utf-8?B?cXkzdnFuL3lva3RlTmFRTlBjM21GdWRKNW55QzdydVUzMlJoZnVPUkQzd1VD?=
 =?utf-8?B?RHM4YWRqWEpUYUVCNWFFQVpxMEI4SFBlTjE4cFV5aUxPUDBQNnVrczRPaTZD?=
 =?utf-8?B?RUpkbnljT1lkQlJsaUsyY09QdkE0VDNWVzZXd1Z6LzNxVWVtdk44TzRDR0hu?=
 =?utf-8?B?WFYyQi9penkrM1N5VlQvMGlLMC9DZ3A3M250OUdINzRUQjVtZVRFajhDZGVz?=
 =?utf-8?B?MlpoU1FjZGEzNlVaZkRVUGtNM09BOVFsc2dFbWZCOUtlNW1vb0V4YkZFdHJz?=
 =?utf-8?B?OFZrZTRBeWxQQ3hXZUdEZCtzenlFbWJjd2JSeGxaNFFuVGlYeStUUW1EMHFD?=
 =?utf-8?B?Yjk4THgycEdwS29TcDAxVHNKNzljZEMvSXh5R2FPaFYrTFQxM2owM0F4cGRQ?=
 =?utf-8?B?VEZnaTdtMWVSMlplZHVjRkJINWZ3QlNDMU9ObFFpWnp6SGFISk8vK1dwRzBF?=
 =?utf-8?B?b3NlQnNIcmJwdEMwRk1HSkx3VkpCeGZuN1hMUXRucTNETkw0WHhoN1grZm1K?=
 =?utf-8?B?UjUrSG9JWUQ4SG0xdDhXNmkweUs5RTVLNFdET1JYalpoUWhodnZkSWp5Nzdk?=
 =?utf-8?B?UURkWkErVlY5Y05QMUp3UnhZaTJIM3BaMC9idm1KWGRCT3FGOTNLbmp3T1N1?=
 =?utf-8?B?VXBhYlVyRXJXRGhoeTdSYlU0cEFqWFFkYnk2SHArbncvZHFkY0NEUS9CdU4w?=
 =?utf-8?B?cGE1QjBIemJyUlJrL05UNjFTbFNMMTduQmRoNzhaWGx1UXFudzhWVG5oOExZ?=
 =?utf-8?B?eHJldUZEVFVvQldqRUZuakhKNlE5QVIwalFkbjdISks2R3E4MlJhaXdVcVFm?=
 =?utf-8?B?UFdXRTVuMGM0NzVkNTAxNUdBZFBNY0hXZUlMOHZHKzlUVVFIb2pNeHdSYWNU?=
 =?utf-8?B?OGZka2drNnZRRlNhYnFnMGRnMFQzTHBvd0NUbDljMlFHTGRKaWdTY2ZoVnJH?=
 =?utf-8?B?Tko3aCtldkdJT0ErU0ZrSWZyQzJTSGN3MzJOZkJsKytTdUlvQWRBREthakI2?=
 =?utf-8?B?czVRR25BSXRkZWJucWtWdnp1b09HMnNBdm9ZcEExeHNaNjdlWVFKWDNDaW1R?=
 =?utf-8?B?NHBFOVp0eURqN0FVTkYzeGQ5WVNhdG9tWHZ2b3djZjVqSUtSK1J0c01wRENm?=
 =?utf-8?B?cmJ2S3NOd2N2cjlXaC95OUZueFlUWUJwNmlLb1pnU2MyQjQ2eHEzQ3VHcDNk?=
 =?utf-8?B?cENKdjJ1VmE1eU5IbFNzclpLa3pSWGtZQ3lQenQwL1BGNFY1NU1Yd2R3RXpR?=
 =?utf-8?B?RDNCWjJLV01ueHNWR3dOOEQ3VnJaUUtkZlNwMUx4d2gvWGxJZ001dG9KcXVJ?=
 =?utf-8?B?eGIzRGh4ZUEzaDJJN1R4VC90OEVoandCcWJ5eTBVR3o1d0tHQzViZ0U3SDdQ?=
 =?utf-8?B?NHNJOEhHQ2lFUUM0TGNBek9xS2E1TzBQYisxQ1pyWlNPeEdsTjI0aE90VFd0?=
 =?utf-8?B?ZTVlazZMYncvMmxPL0NlUEk2OFhEVC9sejkwZVdpdUt3OXlwL2pwRVNZMVdu?=
 =?utf-8?B?RnI3bUo2UlNkZ2tRQjY4VGU0ZjRZd2x5VElmc1pOUXJRbzJYL1VyZTEvR2xi?=
 =?utf-8?B?RTlTUEtVcXZTbUVWQmlhUnB6WmQxakVOcVYwVmpOVU5OM29IRk1IUU5vL2hT?=
 =?utf-8?B?WnVzL2NzMGVDOThDZkRSK1VrNlF5N0lPeFZUcE15czZCd2IvY2lkSnEreGww?=
 =?utf-8?Q?AJ9N1d7V5HW85y8hgYHkRFQyf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad86a22-f9ba-4c59-c05b-08de0a272b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 07:07:27.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IkPR5qKZPQ5eAYrQ9AAbEEm4Q7zWgFvBMZYAwfw1rmYk9Q2Q4Ix4EKm8zz8jBmp0EaktzqahDDZJdFBOnWg/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7419
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 07:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224764

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMywg
MjAyNSA4OjU2DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1h
cmtvQHNpZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIHYyXSBzcWxpdGUzOiB1cGdy
YWRlIDMuNDguMCAtPiAzLjUwLjQNCj4gDQo+IE9uIE1vbiwgMTMgT2N0IDIwMjUgYXQgMDg6MjYs
IFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJrbz1z
aWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiA+ICtTaWduZWQt
b2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gPiArVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbVE9ET10NCj4gPg0KPiA+IEknbSBjdXJyZW50bHkgdW5h
YmxlIHRvIHJlZ2lzdGVyIG15c2VsZiBpbiBzcWxpdGUgZm9ydW0uDQo+ID4gRWl0aGVyIHJlZ2lz
dHJhdGlvbiBpcyBub3Qgd29ya2luZyBvciBvdXIgZW1haWwgc3lzdGVtIGJsb2NrcyBpdC4NCj4g
Pg0KPiA+IFdvdWxkIGJlIGdyZWF0IGlmIHNvbWVvbmUgZWxzZSB3aG8gaGFzIGFjY291bnQgb3Ig
Y2FuIHJlZ2lzdGVyIHBvc3RzIHRoaXMNCj4gcGF0Y2ggdGhlcmUgZm9yIGNvbW1lbnRzLg0KPiA+
IEFsdGVybmF0aXZlbHkgSSBjb3VsZCBtYWtlIHRoaXMgSW5hcHByb3ByaWF0ZSBbb2Utc3BlY2lm
aWNdIGZvciB0aW1lIGJlaW5nLi4uDQo+IA0KPiBUaGVyZSdzIHNvbWUgcmF0aGVyIGRpc2NvdXJh
Z2luZyBsYW5ndWFnZSBhYm91dCBtYWtpbmcgY29udHJpYnV0aW9ucw0KPiB0byBzcWxpdGUgaGVy
ZToNCj4gaHR0cHM6Ly9zcWxpdGUub3JnL2NvcHlyaWdodC5odG1sDQo+IA0KPiBUaGV5IGJhc2lj
YWxseSB3YW50IHRvIGtlZXAgaXQgcHVibGljIGRvbWFpbiAod2h5PykgYW5kIHRodXMgcmVxdWly
ZSBhDQo+IGRlY2xhcmF0aW9uIGZyb20gYW55IGNvbnRyaWJ1dG9yIHRoYXQgdGhlaXIgY29kZSBp
cyBzdWNoICh3aXRob3V0DQo+IG9mZmVyaW5nIGFueSBzcGVjaWZpYyBoZWxwIGluIGRvaW5nIHRo
YXQpLg0KPiANCj4gSSdkIHNheSB0aGlzIGlzIHRvbyBtdWNoIG9mIGEgaHVyZGxlLCBwb3N0aW5n
IGEgcGF0Y2ggb24gdGhlIGZvcnVtIGlzDQo+IG5vdCBnb2luZyB0byBjb3VudCBhcyBhbiBhY3R1
YWwgc3VibWlzc2lvbiAodGhleSB3b3VsZCBoYXZlIHRvDQo+ICdyZXdyaXRlJyB0aGUgcGF0Y2gs
IHdoYXRldmVyIHRoYXQgbWVhbnMgaW4gY2FzZSBvZiB0cml2aWFsL3NpbXBsZQ0KPiBzdWJtaXNz
aW9ucyksIGFuZCBpdCdzIHByb2JhYmx5IGJlc3QgdG8gbWFyayB0aGUgcGF0Y2ggYXMNCj4gSW5h
cHByb3ByaWF0ZSwgZXhwbGFpbmluZyB0aGlzLCBhbmQgbm90aW5nIHRoYXQgcmVnaXN0cmF0aW9u
IG9uIHRoZQ0KPiBmb3J1bSAodG8gYXQgbGVhc3QgcmVwb3J0IHRoZSBpc3N1ZSkgZGlkbid0IHN1
Y2NlZWQuDQoNClRoYW5rcyBmb3IgdGhlIHBvaW50ZXJzLCB2MyBpbmNvbWluZy4NCg0KUGV0ZXIN
Cg0KPiANCj4gQWxleA0K

