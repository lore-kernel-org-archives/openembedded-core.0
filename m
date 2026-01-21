Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95497C44525
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 12:43:31 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10902.1768999402714799187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 04:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bLewzGFf;
 spf=pass (domain: siemens.com, ip: 52.101.84.42, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCN0cZikuWNzioM/ZBbatF3N9+DXfBuaDuj0II8qxLHCNHKMKIhgYfNoB834XlU++EqsRAqtLG58hd58WRBeGS+fxvdKYMMoEnDJWl9GC8fT9W5nO7BMpKxDGJgN1QSAuZK47l7PpdNYJGXIcHRLrfGrnKGCtCTqPZ4u+82+TfrC5+LhIh8ZzvQ9AfMsbrNyEihJ7czlZ9h8BMPBd4CcVTmBkMibK7agDElaZ8CVKTl/vB7Y+4MjqAg3p26r0C1sDNBelRavvN0ZVS2atDoV1wkeHCcfujvgigkRc5BORDN0TcSYoblYQ78yTSOdLX16nONRaaNOi8bbjIxL81UBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ67ChwfU5DN5SUGUhZs52B7yjhG0cPiK68MqrK5/a4=;
 b=kobKfrCjrbbruJXJqFqnSzGOKWlJuixr8bpn5oehaEMPoRzisamsKdFnXFg8WZx5eS/aOzp7UlkOmRLJgHW2eCrusAVCELy6KEg01LkjtufNSdN1sZS3T7MLzbyDvxPXTLK8OrtxmuutWZ9hWypejb7CJZBNorNlN6vZ2M4O5A9Z9LniT9i9ifppOw0yYgdfklEBVMrLmGVqAaqaIpl5VS1hCR07Cvhme0xoRBekRz4WC6rhuBo7R11HdNve6zHpDS2iJSOPE7qaeS/nanWkJL1asgWRI3AryE9bX0665tYG0dpvme7evrmxEF/p36sDh/HYVj5c9bwDPvFp13hwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZ67ChwfU5DN5SUGUhZs52B7yjhG0cPiK68MqrK5/a4=;
 b=bLewzGFfkpNGaGwMBS1mfCu2fS1OXkCwZ6Erm2I1/KiUx06JCVg2tjGguC+5f8Kf4JP44fOsy1litVRcR8nH3Pz8wkh2nE9kr79RzGc0jPQuVBnJx1KBMJLpkP/DeH/z+tNud4nPxR+ox4pcgIqXBouNp2t6oqmtTIpuU9C8eat5TtVFVBHoqcT8IxKrGQx5Rut4KHr7fSurbh2qYazHqcKX3Iohnpxx6p9fXKv8jIGuZTa1nPMc6ci1Os03N+oTCN+/AlmyCZYlIUjqvhGMnTpUtyL7K7BSwg+v7OO75f0u4LLq1crVJaWRICl3k4GdYFNkgjJIhkUDTZyCx0x9Qg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB3PR10MB6908.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:431::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Wed, 21 Jan
 2026 12:43:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 12:43:18 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.53
Thread-Topic: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.53
Thread-Index: AQHcif9uo0FZZjsFbEe28tH0NdZqHrVckY8AgAAAdYA=
Date: Wed, 21 Jan 2026 12:43:18 +0000
Message-ID: 
 <AS1PR10MB5697AAF15115E5E64EA41EC6FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1768906687.git.yoann.congal@smile.fr>
	 <c689e7db6f4a01e0c81765e112371f64c4bf8221.1768906687.git.yoann.congal@smile.fr>
 <4cb6999862b53c7d0d3e1ab28b9770abe7156b5e.camel@pbarker.dev>
In-Reply-To: <4cb6999862b53c7d0d3e1ab28b9770abe7156b5e.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0d94bc12-05d5-423b-b0e0-a3f7bb775b86;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-21T12:39:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB3PR10MB6908:EE_
x-ms-office365-filtering-correlation-id: 7d6ea271-af5a-462d-39c0-08de58eaa76d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YU9ab0Z2RElTS2VrU001aGFhejFkVjNDQ1ZBbGx5RVlDWmQvUjNueldDYTdB?=
 =?utf-8?B?aUFER2tqcnNXS2NLZlRYN1l5RGxHdTVramZtMjBHeVZsUjFwUUNHaGtyVHp1?=
 =?utf-8?B?cnJQU1dHdGRiSFB4dVM0VTUvdUR2eGxjcE5rbmh4MGZ6Zkdjd3diazBNMWJp?=
 =?utf-8?B?UXVrNHZqSlNldVpCc2h1ellRRkpUVVpVazRQaUlXMGIvMHp0RTc1Tm5iZGth?=
 =?utf-8?B?dWpyUUFxa0NmMjIzR3NKUVM1cVNlaHd2b2tGcG4zcTEvNDl3VVRRd2FiOUNa?=
 =?utf-8?B?RUZlNElqK09CRC9iOStobStiVkhFc1pnMXpqeFYxcmhDRkxhSW13Y24ra01I?=
 =?utf-8?B?VW9qNjdNVXdvZUV4NVlMd1kyOWg1cjBYMEUydy93OERZTHJEc09DbnpOdUxs?=
 =?utf-8?B?YlNMaWU5ZlBiU0pTQVJpSmZqMjVybGUxWGZ3ZXJoZzVYYWU5ZkdOeEVZNldD?=
 =?utf-8?B?UlR1MzZlRDdrbk9GcENlSnZsSGNTN2Q2Qm9VK2VLMi9qaFRBSGoydmNMby9w?=
 =?utf-8?B?L1krZkd4blJoei90T0w3aWtWMTg0RGIxWVNXbXRuSHJmUTN6d1p0WFFuck02?=
 =?utf-8?B?RjJ6YXJsNERTQ1kwT0V4ZnJLeFd1SjN3bkUzNkovS0RoOTF4TTUxMUNLV0ZP?=
 =?utf-8?B?anJibXVQKy9JUnFUS2pteWJvRmhkcU1HalhZM3pBeEZwTU9aTHZ0VHdKaWdz?=
 =?utf-8?B?SVI1WXBPVWYzbkJiMWZmZUFaNFdNMVRjd0l5dTFGYzRNRHFDZGFCWXpIdXA1?=
 =?utf-8?B?dk5rRjYzVU1jaW9HWVhHK3pTcXdKYjhtdHNZSHhYSmZub09CT0VMWTdNYUFv?=
 =?utf-8?B?eWU0U1hDalhmZUpUNnRlYkFuTEZ0d0x4cS9USWJmUGhEWW9tOUVFR0FWTE9V?=
 =?utf-8?B?ZWF6YThZR0pWeWthaEZKNTNKL1piRzNHbGthZ2tody9iamNQNGpQSVB5OEtE?=
 =?utf-8?B?V3F5RDFRZWMzTVowMTBlemZucVh0Wkh2ZUcvN0E4dEhybk9mY0s4YVlDczZ4?=
 =?utf-8?B?TlNiR2NDSmIvLy8zckY1a2IwbTVleWZ6RDVpUFlmMVJFK3ZEK3dHeXo5aTg3?=
 =?utf-8?B?bWorRDEvNW5JMnJnbDNHMG5lcjVsU2pGelpUWldHd0NoVzRRVDNUa1JQZHdt?=
 =?utf-8?B?Q0hpWXR3dUhoelJyZUtkUVBTeUtVeDVIaS9tcXhUSy9LNTAyalZENEV5KzhU?=
 =?utf-8?B?TnQ1eW01dUpzTDNPT0RrU2hLZE1qSWVCYWdkR1gzdWtJL0Y1YTlPQzIva1JK?=
 =?utf-8?B?VTg0ekdqN3hlUEFrTlhEZGxTTEpVa09Ib3BxRVV1TFJxZ3dxTmdKZ0RiQjB0?=
 =?utf-8?B?dEE3OUZUb0lLZG5LZEExQ3YzOHlLWGd2YktINXl5Zmh5Q1FWcW1saHBIZ1Bq?=
 =?utf-8?B?bi8xKzBQMVF4VE5UckJpcjFlQjB3NCtwYnNqamh1S3hTakpRbTl5YUZ3VlM4?=
 =?utf-8?B?bFI3RExybDUyeXRiNHQwQnBaaXFzaXNmS3dIbVFEWGFtcWhNZk1FRDI2RWN0?=
 =?utf-8?B?eC9FeU5UYzk4eC9LcmdKTjJNcERmUHhob0dZQ0ZhZ255RzhpTDBQZnJJT1Mz?=
 =?utf-8?B?YlpaM2F0TnFJSXNObEdXM0tGT2NweFA2T3E2Uk1PUVhXdkZ0ajBrN0pqaWhV?=
 =?utf-8?B?a1dXVkZkeFZUMzNHdE1aSFNiZ0t4eDNhWGNLRW54MU1jY3htOFhzZ200VzNm?=
 =?utf-8?B?MFhuWkhmZTJDeEFZVFpPS3ZrMXpVdXdDbVlkajNsMDBHZk1vQzhsd3M1WWNG?=
 =?utf-8?B?OEpVUVZFUHFZdklvMkVEYlpxeVNWVEJGNzNxR1BIaVdlVGVYbTZpa3JIeW5M?=
 =?utf-8?B?dFpiZTFlSnRWQXBJSGgzSzhrdFRycHJIY2l4azNQWE1WOVoyS2JxcUlWcEsx?=
 =?utf-8?B?WHJXb1FJMERvakM5VnlwNzVaMzg1L0ZNOXFJZ3BpQmNCdkdTUkEzT1V1R1ll?=
 =?utf-8?B?RFNHSVRkeW9ZTjIxQnFrRVBmaGFNQ0dWZEFzQkVuWmVhQWYwa1Q0dGIxaXYy?=
 =?utf-8?B?Q2RoYWFrbmgrYmpNNFFqdXFPVXFwSFBpRlRGTFpIbk9Nc3NZYVdMQUNZWXVF?=
 =?utf-8?B?YkRtcHVobUdWNnF3NS9Jc0NYUVZyUTFCK0c5MTFLbWVCVU4xWGJrWmMzWGwv?=
 =?utf-8?B?MDlGTGorRGpQS3A0U0lrdFZobjdFTkZGV0VUeUh4L0M4L280cHA2dGo4Z2V3?=
 =?utf-8?Q?1E4T/iQIb6IS3/I0r6chd0c=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c29iM1NsZFNxOEpHVER5SW9vUzVJNXY2SUgvZ2t1SmhWS0lwWlZ4cXgrSEhW?=
 =?utf-8?B?YXhIdEJ2NFlFZW1kb3JreU5PQ29zclFtR1Q4U3pJeis5WXVwYVJ5aVVOdVNj?=
 =?utf-8?B?eVRURWV5emNjQW5rdWJrQm1wL0xibHAweExHcjhYRnRnamFoclVWeEFYZjM3?=
 =?utf-8?B?Vm1YTlo1YTJlM1NJQktaUXMrUHdGTkFreVkyQVMzdnAxcDdXOG9yUGFKNjBy?=
 =?utf-8?B?d2ZaRE4zYkZ4YjdjTUpvU214VC8vVnZabmF4czBmN3lQbDUvbm5SbUk3QVVv?=
 =?utf-8?B?bTE5Ukozd01Cbkk1YmV0QTRzNVFDN0tUNGZualVRZm8rdkhESjBQUW56RDBx?=
 =?utf-8?B?Mm1wdmFNNVNGYXVzNnNaRTg5b1ZZbVY4aDBGeVNkVFRaWjlVdFRxbEkxZHRG?=
 =?utf-8?B?ZjFFUktwRGlYdWtUcVlZMjRFclc1RkJHeXgrVG9QejYzaWJ0VmJqMkFSanp4?=
 =?utf-8?B?N1cyandCSC9wZDJucE5kME5zS0l1b0ZGZE12elhWb0VpNVczYXVrcmZiNUxS?=
 =?utf-8?B?OWN1Z1BQOHlwOFJ6TTR4K1BydCtNdzEwczNpa1drT3hKSUZvYk9qandxMk45?=
 =?utf-8?B?OENpbkxxSmZGL09jYUZ3TFB2U3VZMUhGVWVjeTVNNWJ6THFnOUQ0RmhmeUF4?=
 =?utf-8?B?Ym9WUURtbUhSRldVelVYS1YybkwvVzEweUJkc010ME1VdlRBY1dxREdtTVp2?=
 =?utf-8?B?eVhiUW5VMGhRcVBzVVd2T2VackgyWVBHUGdTdjBvdStlVzJZWWZKMEFPT0tV?=
 =?utf-8?B?RFhySWkzenNscG02d2tOQytmTENxRm9IQU5iT0hlRktjRU9IbXlUQUlkYTY5?=
 =?utf-8?B?MXAzcnJtdGFrOHJJU2NsY0xpOUZsOGg2ci9hQzRoYlZOUC9KVlBEL0YvTlF6?=
 =?utf-8?B?THpETTZXQXdCQmpGYkIzQWhaUE5ZVmxBZjBjb0Z4RTdISlBieks5Ry9Uempk?=
 =?utf-8?B?Wjh4RTlzMGZ6ZkdQKzQrSnJpWndSL25UOUYzTjRtN0M4M3BsRWdKV0wrT0Z0?=
 =?utf-8?B?NThiR0tONkkvdWN5RGh6QjRkZUxCaHJXbUdFS1JEZUZEVXdXRC8rUllmTVRO?=
 =?utf-8?B?NlNoa2MvQkYrd1BFOTkvQi85NERpSGhJZWM3NFJlRlZ6QmRhZVpwMGpSSisz?=
 =?utf-8?B?WGdHQ1kwVjJXT0FGVERrb1d4ZTgwdXBrbno1SUk5NndTVEttN0xIbXN5ZUhV?=
 =?utf-8?B?dnZlclgxMUd0V3FLVkVjQ3ptaWtPQ0VzWGdmcDM3dk4rcFdkbjVwVHJ1Mk5K?=
 =?utf-8?B?NCtWN09yUXFrN3NLaFY4T1k4RmxHakFGSFhoVlE1NXllTzR4Nng4OUt1LzIr?=
 =?utf-8?B?dGhPL3Y4VmdZWHhDTm9FVnlUKzVmeXI5VEZ4WHIycEJuL1hyNk4raTRtOUJK?=
 =?utf-8?B?V3N2Q3pZWnlBWDJNN1ZkbVlYOElHanlId2xCQmhEaFB5dVB3SUxSalc5M0Fx?=
 =?utf-8?B?TTcrVW1SWmdpYnI4WXorNTU1MkxrVDBmU0ZpbHBaSzJjSmJrYXRxcEl2OEFp?=
 =?utf-8?B?bnN1VFc3UUJwM0tRaTJicm5teENLdXE5Q3poSEVxME4zYjd0Z2gyZnRiK1d4?=
 =?utf-8?B?KzVRMm9HWlhNOEdQSTU3c1lZeE1MWldvb0xOajluVncwSytjU1llL0UxdVFR?=
 =?utf-8?B?V2tITjJHdldMdGY4dEVqQXZEa3MyYlJNQ0tsVDhpWjl3V2t1RVdKMWdqQWJx?=
 =?utf-8?B?Z2lacjRYb0ZQcUdXOEVBeGZ4Q3Z3N3VhMU8yeXdPNE5sMlVuNERQYXlNenVZ?=
 =?utf-8?B?bnJTU1Y4blhYQ0tIb1lDNkExb2NrUjVRRzVSZk43dEhCRk9TWXU4SVNUd3lq?=
 =?utf-8?B?bWp5bGVwM3MyM0tYN2JNalhYRnBlUGJXdGtxL1pGWERvRk9Mb0VOV3drdUxl?=
 =?utf-8?B?MGFVQytzZkJrOXpHek05cW16RHpnVE04cGJsSFV5SGtrOVNlOGxCZ3EzNHUr?=
 =?utf-8?B?UTM2RDhmNzJObjVnN2RremNRY3AvVzFBdk1rd2taRVVQUGk4Ykx0UVlSRGFG?=
 =?utf-8?B?bTJWQ3dVZzlvbldFL0ZBOEtBWFdhSndvQ0VUYU1JVW0ySGJVTXhtMjEyNGRz?=
 =?utf-8?B?UGFmMUhQWkFLR2FDTWxXSXpxL1RHRDVCMzJMUHlvU0RqWTNRbW15LzN0cHpG?=
 =?utf-8?B?YjlsTVhOVUZhMDY1TlJwU1VCR3FSREdNQVg1VkYxdjF6Y1pyRjZ2ZzNOVWtt?=
 =?utf-8?B?S3VaUVlXYUNTV05SdVRjd1VKdjRUcHNjMjhPRHlUcGpPc09hdGJiRWUreCtD?=
 =?utf-8?B?cXNHMzUzKzZNd01ZSUJxeDhDUkVUV2M2RDZYeGVSUi9pTFJSalZpQVZqUTBR?=
 =?utf-8?B?YjAxTld2UHVjTGlqZU9oUlVLRXZnaVNWanZFenBxM2xMNTFDSGI0QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6ea271-af5a-462d-39c0-08de58eaa76d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 12:43:18.7300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mo9NQvDRGy+VI9ADrk7mipf7yW8YsDWhTIE2LZLHFaVDi9VMyGma5SPbdJ2ess/UP8F3pJGWWsrZlyKS7ZBGvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 12:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229810

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBCYXJrZXIgPHBh
dWxAcGJhcmtlci5kZXY+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyMSwgMjAyNiAxMzoz
OA0KPiBUbzogeW9hbm4uY29uZ2FsQHNtaWxlLmZyOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IENjOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBl
dGVyLk1hcmtvQHNpZW1lbnMuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3doaW5sYXR0
ZXIgMDMvMTVdIGxpYnBuZzogdXBncmFkZSAxLjYuNTIgLT4gMS42LjUzDQo+IA0KPiBPbiBUdWUs
IDIwMjYtMDEtMjAgYXQgMTI6MjMgKzAxMDAsIFlvYW5uIENvbmdhbCB2aWENCj4gbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXhAbGludXRyb25peC5kZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IER1Ym9pcy1C
cmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9hbm4gQ29uZ2FsIDx5b2Fubi5jb25nYWxAc21pbGUuZnI+
DQo+IA0KPiBJcyB0aGlzIGlzIGEgY2hlcnJ5LXBpY2sgb2YgZmEzM2RlYjMwNzgzIGZyb20gbWFz
dGVyPw0KPiANCj4gSWYgc28sIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgcG9pbnQgYXQgdGhl
IGNoZXJyeS1waWNrZWQgY29tbWl0Lg0KPiBgZ2l0IGNoZXJyeS1waWNrIC14c2AgdXN1YWxseSBk
b2VzIHRoZSByaWdodCB0aGluZy4NCg0KWWVzLCBpdCdzIGEgY2hlcnJ5LXBpY2sgb2YgdGhhdCBj
b21taXQuDQpJIGFtIHZlcnkgc3BvaWxlZCBieSBjaGVycnktcGlja2luZyBpbiBwb2t5IHdoaWNo
IGhhZCB0aGUgcmVmZXJlbmNlIGFscmVhZHkgcHJlcGFyZWQuDQpXaXRoIHBva3kgZ29uZSBpdCdz
IHZlcnkgZWFzeSB0byBmb3JnZXQgdG8gYWRkIHRoZSByZWYgIm1hbnVhbGx5Ii4NCg0KV2lsbCB5
b3UgYWRkIHRoZSByZWZlcmVuY2Ugb3Igc2hvdWxkIEkgc3VibWl0IGEgdjI/DQoNClBldGVyDQoN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+IC0tDQo+IFBhdWwgQmFya2VyDQo+IA0KDQo=

