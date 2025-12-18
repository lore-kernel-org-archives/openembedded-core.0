Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E72D6ACE2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 10:32:14 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38859.1766053927586757587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 02:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=zL8rQc6N;
 spf=pass (domain: siemens.com, ip: 40.107.162.55, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrYiivIvse033L9gvGXLU26kqxvZferv2GP8WvFGEmx4lWtuFEiDD82hwDIknm0ZRdI2TGcldFSvtmQcNWhBbZ1Fn4umrgJQ9wEmijBMp5h1hLjGcHXJ6+1m/Kcu9hb6LGfqAwXLf9xjOmnjPADmYNRkTcOMXZgq3Kt7qc70fho2MWH5i/3GYz86umDETYtJuHrnof/Am6sjM2L/lRp/fJNHqIYwAwI6349jkWbhzgJMkJwKKHRrrAlRS8Md1UslI8El/RheKjjRz0ptNDCY4w89JVbwpuV1MW2+RBevAvuguqDkThmH8TrYufoE4yH05ziQyceW0+7Xwz2fFS+uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mr4eH0lW2g51Bn0SF5ZW2ah9yx9SVk+RqC3THuwEPoo=;
 b=xLBnT+d62MrWmAMioEVfMlNxqakqwykZljEZcZnqFlO527SCksaYGvlO7WtEIcnX9/YrkfwF/goEknnFP1/A2K4m7I0X0wNf2nFdvMMtz98l/dZZ0OvdurAhmZlYqKi4glnmygoVUMjkxblzcTcwjYNRRk+kbWCARHCz6KazH/ZBb3ZF6I793yjErUJ/I7zcHexzz0bOb5CeX9oKsoKH0FEA9qMmpsfbAw8V9UzzM/UIjt/LdpoSazVAUhvOVyc+mnlVZpZcZtQNkmi6r4gnXMvszFEl8aR2N/i1tBY/oceO9fpHAc3hfKwJ1YoX4I1ExUKcZg0bx9oIz1iqnz7m3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr4eH0lW2g51Bn0SF5ZW2ah9yx9SVk+RqC3THuwEPoo=;
 b=zL8rQc6NpnSf+++nuPh/kPqEMI3/bvKrkyZ74WkzYao7qlOBcExex+oSbh7/J45YXgwQylRDEs23Cpe7TiF4qMXGnhLQwDEqzuidz+8sQdTXfrGynMkZl3CXOAmfVCtHcxnKPDYIRGfLUlTjbgmqNCbVSlG4Z+m5Us73kPiYRo7Hj+Wsj+z/s0Wo/3FDVBFuf5WFOZE6DVeppYlk+siTQveAM3pSTz8cXXDjmaG1coHTIVt3a8Gsxn4nkbzzJdOL6SipVVSdQdUqZyknS/nyJCt/D6MQMvhZZk5fcvssBMrEdn/tsf7x8dCSeAQ1giiWWiXY2nM9/FxtNx/GwIbNFA==
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::8)
 by GV1PR10MB7569.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:8b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 10:32:03 +0000
Received: from AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f]) by AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d515:f4e4:e935:ee4f%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 10:32:03 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "erik.schumacher@iris-sensing.com" <erik.schumacher@iris-sensing.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: rdepend on mountpoint
 command
Thread-Topic: [OE-core] [PATCH v2] initramfs-framework: rdepend on mountpoint
 command
Thread-Index: AQHcbqesy0KR9OqVTUGSeCBVe3xjsLUnNcmA
Date: Thu, 18 Dec 2025 10:32:03 +0000
Message-ID: <c6cc1a74b0ca64345f846b643fd8680878908f6d.camel@siemens.com>
References: <4f922d17bac5aaadc452efb965b9d320daca8f1e.camel@iris-sensing.com>
In-Reply-To: <4f922d17bac5aaadc452efb965b9d320daca8f1e.camel@iris-sensing.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5724:EE_|GV1PR10MB7569:EE_
x-ms-office365-filtering-correlation-id: 03220556-aaf0-46fd-24ed-08de3e20af83
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?d1NQRDd0Ly9yMFYzVXdKQVFndE05YVNVTUxjbERXK1lPZlVWYWN3OUF0MGN2?=
 =?utf-8?B?Z0pZRmhPeTRzUmU4dmhWNVRLbVhnTmhmSFJwb05hVzN4YVBSSVpFYTZmWndr?=
 =?utf-8?B?dG9EV01ycC9oVXc3b0JycEtkNFkrMWFnUnRmYmNTWnE5clJoMG81SWRmT0xj?=
 =?utf-8?B?SFZXMHVkYzJFd3cva1lwSENpU205T1M3VW5MT0NVTWpId2UrbU5YMGlDV1d3?=
 =?utf-8?B?VVJTTWFBMFpUNlB1Nnh4Rm83MEE5VjZQbSs5UGlHTnViY2srdmNMeG4vWHd3?=
 =?utf-8?B?akNJdjY3dGRYM2NPbG9LM1dwV1U5SUhRWllVc3F1MDU1V2ZBL3d1Sm1obk91?=
 =?utf-8?B?WWlGK0F1VmJTZ2JuRFN4eWNlRU9XMHNGdVhaakJ6aGFhNmNwWXZVai9qY2Z2?=
 =?utf-8?B?Mm5JQVhHWGh3S0o3elRvYkJ3VWFpb091TjlYRXpqNTR6MHBUNFJyMmpaM0Nw?=
 =?utf-8?B?N3hIWGtHVUlsU1QwZ0pFcW1UQWtFV1lsckJmNU44QWRKQVB0WUh2U2lXcklm?=
 =?utf-8?B?UHNPdFhXWWR5MEhxQnVlTEE5ejFabWNPQlczYnkzMmF1U2huWk1wV2xJc2lP?=
 =?utf-8?B?VkgvSTJ1aks1cmx0TTlnUENjaFh6RnNrUVBhTVBlYjVsUVZyWG9MQkpuTGd0?=
 =?utf-8?B?dGVyWXdPVUNoT3hEdCtiVjM4SE1aV1N1OEMvVHBhdDB6WTdidTQzV3V2Mkxp?=
 =?utf-8?B?bzR5TU1yV2RSUVNML0t0SEFZUVFwWjZ6cXd4TkZiTDNpbWRVQU1yWnZvQ0pD?=
 =?utf-8?B?ZVBucFFFclpjdlNuaE9abTgyT1hmY1RFaWMrVjgyOWpjMUlzYkx2NU5qMlh6?=
 =?utf-8?B?MXBQSjYwMW5BN1ltQ3FSUWNpV21WUk9oTm80OHdoaUQvaVpuYmRhc2VmOURs?=
 =?utf-8?B?NjB6NmJiQ0JHOWFNYVZvM0J5Vk5JMFpnNjNhNGp0bVl0a0FoVVRHZmlEWkIv?=
 =?utf-8?B?Zng4N1cwNzFSWG42c244SDFmbExrYXpKZ0FPTHFKdThtelpFc1J5SGlkVzZI?=
 =?utf-8?B?UE0wSFZvWDU3aU1sM3h1cFZ5aDNVanlKbkZmU3lmU1lpQVg1Y3dMcUNTNTIw?=
 =?utf-8?B?T3pSdXFvTlBlSkVEUDVrZzFpWW1xUGVrNFZveGV3M2lyaEJaZllnZWNka1JV?=
 =?utf-8?B?OENRc2JpL01BOG5oTkZIVnlRMFc5MDd4Z2lISnNaQkpkS3dYQmNGdW52TTNu?=
 =?utf-8?B?U1QzdGN2dklhdVdwbStvZWpSVlo0eXg4eXAyRlYrbkJiK1crcExUN1pYYWNv?=
 =?utf-8?B?eFV0V1VoZmJRdkE2OFpIQnFwRittT3F4ZFJqa3puTk9KVTdYS3NKUm5ZUDVF?=
 =?utf-8?B?RFRidGRuczJCSE1IQUg0VGtXMU1vS3ZsaDJXSkYxWjE1WGt1NjNZcXFRcnYw?=
 =?utf-8?B?UmxRcnFvQWFTYU8zdGRyckJWWjVZc0NaVG5hM2tDWkZXVEhvTVBQSklxeUNo?=
 =?utf-8?B?NkYwU0ZvTlFJZngzWHU2amppa0NNSTRTT2hxWmhyT0ZmYkxmdVVHejFvcG5P?=
 =?utf-8?B?RW1pVWtjdFBERTN0ajZXbWlmSnRMbklDZStRbUFEQVV4M1p2dmtVR2ZOd2h4?=
 =?utf-8?B?V0pRRWd2SlhhUTN5M1k3dEI4dlNlMElVNy85U05scVNzdXh1QTV4VVJHdVBo?=
 =?utf-8?B?dWp3Z3FTRzF5dFBGYmlhaHVBMmUzOWZ5U0dmNGtTVnlrelFTMHdLS2l6L01y?=
 =?utf-8?B?R0FEVDFQaFJtbW05QVhRN3JJYm85YlB4NVNMaThjQ21WOVZSY04yWDc5QWU1?=
 =?utf-8?B?c0EvMzNIQVVtN2FiY0x5WjZIdENLZFVqMkpqeCtna2NSaHRKNTUxRUdveklB?=
 =?utf-8?B?TjlOckVrcjArT2NrTVhYRzRya2t5THZDc1hWakd2aVFiRkRYcUdtRTBhUU1W?=
 =?utf-8?B?MFQxdTVWQW9HZFRmOVI1aE5GSzdPOHlzeVdMeHdlWXhmV3EwUTEwSUtSenhL?=
 =?utf-8?B?eXJyemlSUjMzcW5oYjRWQktSeDhiMGRFOXZqSTJCUGswdVRPRjQ0RHVyaVho?=
 =?utf-8?B?dDRPa3VUMGVjYUNlditaV1l6Ukp6MCtFU3J2K28yYmhSSWloTFh4TW9kU2hH?=
 =?utf-8?Q?6uG55A?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b0owMk54djYxWm1Edi83UFZ4UERWblQ4VXlFSk5QeEM5SDM2YlFGUjlMRTBa?=
 =?utf-8?B?N1g0ZHZFbEo3d3BWeXpxTXo1YnIxRFFhVE1LSkNMMmhQYVhNRkYwNGxqL2Vw?=
 =?utf-8?B?VU5hdmtPb2hQekNKblUwdlUxaUdBbUVUMDZiUnRGaWZIejN0ODdCMjZHVC9u?=
 =?utf-8?B?OXRVTHh3bXVxeHAxNHc2Y0h5WExUYzdBWXR5alYvbEJMSHNocEdtcFRyT1NL?=
 =?utf-8?B?ZmphZjk2UWptY0orcUhYa2s0eFNjeExieFZMblptVWI3TzFnWUhLaXhwV0Rp?=
 =?utf-8?B?OTdFenlDZ2VRZ1hmVmxnaW1DWWpoeXNSNU5XYnJrMGVMYkZmRU04alEvVWNs?=
 =?utf-8?B?R3ZjZnBJUnA0UE9RckZmVHJXSjUzcldud0l1ZmZvZ2dFZkE2OExRTTdzbFZa?=
 =?utf-8?B?dzRIc0ZkY0ZhcVJmSzgvK3ZSakxHaTFLRmVXSkswOGVGbmUyUWdpNHJXRFRX?=
 =?utf-8?B?QnVDRm4wMXhzOXRWQWtzcUdzK1JVd2tQWDJFRUQyczRGZVJ6ejhydkVoNFd1?=
 =?utf-8?B?dS8zTk5pWXZ4dkNlRnB4bjBLb3paeVY1bVByZkRFcXdWQ0NtZk9ydGExUGhk?=
 =?utf-8?B?aWF0UGVHYlZSY0g5b0E0REt3S3ZTSk92VmRXY0dENDZSWTNYVWFaTSt6aE4x?=
 =?utf-8?B?OUthS0p4Z2h5NFJIeFUzeDEyUE44Vm9QM0xYNWJvQkRVV1NoUzFYRTIweTI4?=
 =?utf-8?B?bENUU1ZQdnVldnZMbGRXcWpiemwwSjNxd2pQOU15RjVBY1I0ZDBRTURhQUVP?=
 =?utf-8?B?anpnWGNPeG5DZ2RKSUdWYnNaN0ovbFZoT1VMSm5QWTdHdkp4WXM2SWE2YWFP?=
 =?utf-8?B?eVN6cEozaEtYNytIdUlwU2ZFWXhLOUI1ZnI1akVKc3ZPbEExNVNRb280V3JX?=
 =?utf-8?B?M0hKcUJQb0FZZHVlVENkaUxTK1RSNGg3OGFtSzFaQTM2Z05QYm9iTmpqT1Fs?=
 =?utf-8?B?NEFDeHI4aUJLYXQ3RlJEaU9hendrMVVwOVJMek5WNEhjQk94RDNNM2RiZmQz?=
 =?utf-8?B?M3BobWdiWVFKZHJONEtNdC9pcW0zeTNpNjNhRGE5RCtuV1BwdlQrZE53dnlC?=
 =?utf-8?B?NjFvRHFrTEN1aDc3RVZBVTBVTzdCZ0lrTDBOdWo0c1ZMQTBTWFpUQmE1KytI?=
 =?utf-8?B?VkpSYkVjcFdxUXphcEpxRlRIU2tYUzVtMzc0R1c0d3A4VG80d0xPMmFiWEY3?=
 =?utf-8?B?d1hiRXJSd0puWTRRMjQzVE01bGNCYWZjMU1nNlJvRHB4V3hieE9KNTFBTVdn?=
 =?utf-8?B?WlBMVDFmcEFORnFZMHlYdFdXMnJ3K3lWejF2TDV6T0EwTUNSTldnUUM5dTdy?=
 =?utf-8?B?R3RoZWNwUkRtUitLK0MrVVBzZ0U0ZVl1Tkwzak9iQ3R5Y3VNUVI0SmJBUkZl?=
 =?utf-8?B?cXN2ZnRIQVRxYTZBWkN2ZG00WTZrYU1pNTlsUTQxRlNYQm1GOUZxWjhOR1Ns?=
 =?utf-8?B?VmhraEc4TFdSOVBFZGFDa0trMjZZaEk1Z1BRTm1kMHRkcjRLL1ZBMDdFOWtm?=
 =?utf-8?B?UEhEY1lRQ2hIWlRiZDF3TnhFWmNobThHVnpnUzZvTDQ5aThmZWZpUTZUdUtk?=
 =?utf-8?B?UmM4c3FvYWViS2FpcVUzRVpFem5jVm5BemIzeEdOQ3kwMlNkbWs2SHJWOXJC?=
 =?utf-8?B?SUFublFlb2ljOGVqU2JiVGF4aW91ZnI0RFhCS0NhMWdGemJzcmZLNHZYWmQz?=
 =?utf-8?B?R2t1UmplNXVtYU1aT3FINUZIamRKTlBoMjFlRXVDdFVhc2RPR3BqTzBPNjFx?=
 =?utf-8?B?TWFjOEk2QVpndmtIS3hsdVFGTncyVk5FTURnVGlTdG82ajFkWHNkNWF0V1VD?=
 =?utf-8?B?Nlp6SVRZMkl5K3UyVEhrcW04dENReHA3WXpEaXh0azNYQXgyQkR5bStWYXF2?=
 =?utf-8?B?Y2QzZkppQXByM0EvNnB0TitibWV4ZWJpY0ZPcy83VmlUMi9YUTk0cW1nQkE5?=
 =?utf-8?B?ajF1d0RSQkUySmlZTzZXeU4wNlNDS3EreWw0dDNiVGFZMkViUnliMStkMm9K?=
 =?utf-8?B?Y2dteFhHVjVrMy9acW1Gb2R3YndlL01nSzY1cXpnWW9XQlV0WW93enhPajZN?=
 =?utf-8?B?cHFadDl6NTcyMzd4T2tSbUFDZS9udlFYaGFmU3JpRVFwMkpYRjdlbUNaS0th?=
 =?utf-8?B?RThQdzBNQ0o0QjF1S1J1NC9CNnF4K3lZYmlOWkpxbU9yTnMyMkpQOGxIbnly?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <003B90596BAFB54FB23DC5768D43E618@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5724.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 03220556-aaf0-46fd-24ed-08de3e20af83
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 10:32:03.7563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqwtZ6XbSS+F/aBQKd714t0wh8KDV2LD2Mg8y7jHZyq2aOdc97UnJrIsXYVWKwd3vaGro01ra67hkjULCGbkcyggDTdR1+c8PLH/1DDy46o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7569
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 10:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228108

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjE4ICswMDAwLCBFcmlrIFNjaHVtYWNoZXIgdmlhCmxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwg
ZnJvbQo+IGVyaWsuc2NodW1hY2hlcj1pcmlzLXNlbnNpbmcuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcuIExlYXJuIHdoeQo+IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xl
YXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbsKgXQo+IAo+IFRoZSBzY3JpcHRzIG9mIHRoZSBm
cmFtZXdvcmsgYmFzZSBwYWNrYWdlIGFuZCB0aGUgcm9vdGZzIG1vZHVsZQo+IHNjcmlwdCwKPiBi
b3RoIGRlcGVuZCBvbiB0aGUgbW91bnRwb2ludCBjb21tYW5kIGJlaW5nIGF2YWlsYWJsZSwgd2hp
Y2ggd2FzCj4gcHJldmlvdXNseSBub3QgdGhlIGNhc2UuIFRoaXMgbGVkIHRvIGJvb3QgZmFpbHVy
ZXMgd2hlbiB0cnlpbmcgdG8KPiBib290Cj4gYW55IHJvb3RmcyB3aXRoIHRoZSBjb3JlLWltYWdl
LWluaXRyYW1mcy1ib290IGluaXRyZDoKPiAKPiAvaW5pdDogZXZhbDogbGluZSAxNjogbW91bnRw
b2ludDogbm90IGZvdW5kCj4gCj4gVGhpcyBjaGFuZ2UgYWRkcyB0aGUgY29ycmVjdCBSREVQRU5E
UyB0byB0aGUgYmFzZS1wYWNrYWdlIGFuZCB0aGUKPiByb290ZnMgbW9kdWxlLgoKVGhlcmUgYXJl
IHByb2JhYmx5IHR3byB3YXlzIHRvIHNvbHZlIHRoaXMgaXNzdWU6Ci0gQ29uZmlndXJlIGJ1c3li
b3ggdG8gcHJvdmlkZSB0aGUgbW91bnRwb2ludCB1dGlsaXR5Ci0gQWRkIHRoZSBSREVQRU5EUyBv
biB1dGlsLWxpbnV4CgpTaW5jZSB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIG9mIGJ1c3lib3gg
aGFzIG1vdW50cG9pbnQgYnVpbHQtaW4sIEknbQp3b25kZXJpbmcgd2hhdCBraW5kIG9mIHNldHVw
IGxlYWRzIHRvIHRoaXMgaXNzdWUuCldvdWxkIGl0IGJlIHBvc3NpYmxlIG9yIGV2ZW4gYmV0dGVy
IHRvIGp1c3QgdXNlIHRoZSBidXN5Ym94CmltcGxlbWVudGF0aW9uIGFsc28gaW4geW91ciBzZXR1
cD8KCkEgcGF0Y2ggd2hpY2ggYWRkcyBtb3VudHBvaW50IHVuY29uZGl0aW9uYWxseSBkb2VzIG5v
dCBsb29rIHJpZ2h0IHRvCm1lLgoKUmVnYXJkcywKQWRyaWFuCgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEVyaWsgU2NodW1hY2hlciA8ZXJpay5zY2h1bWFjaGVyQGlyaXMtc2Vuc2luZy5jb20+Cj4gLS0t
Cj4gdjI6IEFkZCBTSUdHRU5fRVhDTFVERV9TQUZFX1JFQ0lQRV9ERVBTIGFuZCBhZGQgUkRFUEVO
RFMgdG8gYm90aAo+IHBhY2thZ2VzCj4gLS0tCj4gwqBtZXRhL2NvbmYvbGF5ZXIuY29uZsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfCAxICsKPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMv
aW5pdHJhbWZzLWZyYW1ld29ya18xLjAuYmIgfCA1ICsrKystCj4gwqAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9tZXRhL2Nv
bmYvbGF5ZXIuY29uZiBiL21ldGEvY29uZi9sYXllci5jb25mCj4gaW5kZXggYmEyNWNhMzAyOS4u
NTQ3N2U5ODQ2ZiAxMDA2NDQKPiAtLS0gYS9tZXRhL2NvbmYvbGF5ZXIuY29uZgo+ICsrKyBiL21l
dGEvY29uZi9sYXllci5jb25mCj4gQEAgLTYxLDYgKzYxLDcgQEAgU0lHR0VOX0VYQ0xVREVfU0FG
RV9SRUNJUEVfREVQUyArPSAiIFwKPiDCoMKgIGluaXRyYW1mcy1mcmFtZXdvcmstPiR7VklSVFVB
TC1SVU5USU1FX2Jhc2UtdXRpbHN9IFwKPiDCoMKgIGluaXRyYW1mcy1mcmFtZXdvcmstPmV1ZGV2
IFwKPiDCoMKgIGluaXRyYW1mcy1mcmFtZXdvcmstPnN5c3RlbWQgXAo+ICvCoCBpbml0cmFtZnMt
ZnJhbWV3b3JrLT51dGlsLWxpbnV4IFwKPiDCoMKgIGluaXRyYW1mcy1tb2R1bGUtaW5zdGFsbC1l
ZmktPmRvc2ZzdG9vbHMgXAo+IMKgwqAgaW5pdHJhbWZzLW1vZHVsZS1pbnN0YWxsLWVmaS0+ZTJm
c3Byb2dzIFwKPiDCoMKgIGluaXRyYW1mcy1tb2R1bGUtaW5zdGFsbC1lZmktPnBhcnRlZCBcCj4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2luaXRyZHNjcmlwdHMvaW5pdHJhbWZzLQo+
IGZyYW1ld29ya18xLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRy
YW1mcy0KPiBmcmFtZXdvcmtfMS4wLmJiCj4gaW5kZXggMmVjMDNiYzM0Yy4uNGRmMTAwMzVmYSAx
MDA2NDQKPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9pbml0cmRzY3JpcHRzL2luaXRyYW1mcy1m
cmFtZXdvcmtfMS4wLmJiCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHJkc2NyaXB0cy9p
bml0cmFtZnMtZnJhbWV3b3JrXzEuMC5iYgo+IEBAIC03OSw2ICs3OSw5IEBAIEZJTEVTOiR7UE59
LWJhc2UgPSAiL2luaXQgL2luaXQuZC85OS1maW5pc2ggL2RldiIKPiDCoCMgYW5kIG1vdW50cyB0
aGUgcm9vdGZzLiBUaGVuIDkwLXJvb3RmcyB3aWxsIHByb2NlZWQgaW1tZWRpYXRlbHkuCj4gwqBS
UkVDT01NRU5EUzoke1BOfS1iYXNlICs9ICJpbml0cmFtZnMtbW9kdWxlLXJvb3RmcyIKPiAKPiAr
IyA5OS1maW5pc2ggbmVlZHMgdGhlIG1vdW50cG9pbnQgdXRpbGl0eQo+ICtSREVQRU5EUzoke1BO
fS1iYXNlICs9ICJ1dGlsLWxpbnV4LW1vdW50cG9pbnQiCj4gKwo+IMKgU1VNTUFSWTppbml0cmFt
ZnMtbW9kdWxlLWV4ZWMgPSAiaW5pdHJhbWZzIHN1cHBvcnQgZm9yIGVhc3kKPiBleGVjdXRpb24g
b2YgYXBwbGljYXRpb25zIgo+IMKgUkRFUEVORFM6aW5pdHJhbWZzLW1vZHVsZS1leGVjID0gIiR7
UE59LWJhc2UiCj4gwqBGSUxFUzppbml0cmFtZnMtbW9kdWxlLWV4ZWMgPSAiL2luaXQuZC84OS1l
eGVjIgo+IEBAIC0xMDAsNyArMTAzLDcgQEAgUkRFUEVORFM6aW5pdHJhbWZzLW1vZHVsZS1uZnNy
b290ZnMgPSAiJHtQTn0tCj4gYmFzZSIKPiDCoEZJTEVTOmluaXRyYW1mcy1tb2R1bGUtbmZzcm9v
dGZzID0gIi9pbml0LmQvODUtbmZzcm9vdGZzIgo+IAo+IMKgU1VNTUFSWTppbml0cmFtZnMtbW9k
dWxlLXJvb3RmcyA9ICJpbml0cmFtZnMgc3VwcG9ydCBmb3IgbG9jYXRpbmcKPiBhbmQgbW91bnRp
bmcgdGhlIHJvb3QgcGFydGl0aW9uIgo+IC1SREVQRU5EUzppbml0cmFtZnMtbW9kdWxlLXJvb3Rm
cyA9ICIke1BOfS1iYXNlIgo+ICtSREVQRU5EUzppbml0cmFtZnMtbW9kdWxlLXJvb3RmcyA9ICIk
e1BOfS1iYXNlIHV0aWwtbGludXgtCj4gbW91bnRwb2ludCIKPiDCoEZJTEVTOmluaXRyYW1mcy1t
b2R1bGUtcm9vdGZzID0gIi9pbml0LmQvOTAtcm9vdGZzIgo+IAo+IMKgU1VNTUFSWTppbml0cmFt
ZnMtbW9kdWxlLWRlYnVnID0gImluaXRyYW1mcyBkeW5hbWljIGRlYnVnIHN1cHBvcnQiCj4gLS0K
PiAyLjUyLjAKPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVjZWl2
ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgj
MjI3OTgwKToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzIyNzk4MAo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL210LzExNjgxMTkwOC8zNjE2ODU4Cj4gR3JvdXAgT3duZXI6IG9wZW5lbWJl
ZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiBVbnN1YnNjcmliZToKPiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKg
Wwo+IGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0K

