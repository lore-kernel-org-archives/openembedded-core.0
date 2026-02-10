Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC6DEA8108
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 12:14:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18120.1770725688407551457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 04:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qh8QPNvj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qh8QPNvj;
 spf=pass (domain: arm.com, ip: 40.107.159.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QiFIFO+rezuYR/3MMzN15Zx9CWsJt8GOSPOhRFnXpEYNGFLse6C2fHxFaA4CWSkAoqwh1ahbeDenzNxPhTRToT1sKP4+ETmx8XbuFVtDPLBReBfVhie4fWtcm7JNZE0kwJ5QtWe0T69kd3M4o7cRIJDCLK5UpTaKZovFTsJSiBSPEVPjMxmqzktu6JuKYKiml8HYhI6o4sA2Aho1PvmjmJ5sK8o0L6wbfzKxYtiVEt9zad3OQUwgH0yGl6s8VV/s8yzx622av8cnqeNedOllAoPK5pAuafcWEHh+cz4vz0T5dg/v8NUBjVo8MUx15V5xfUrgn//96bkEvTVUCDpKRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRjv4hO0WXV6Bp8KSRVEppn6tCRGSMY60Eoq3LGY9Oo=;
 b=SX68Ci7ZAejzCKM/21gWQbO3FIPE7JLc5OCSPZ+QStFWMDtv/QZFKKk9ldNkQB6soJp4sj5Pd0DceBSHNdeGzzynHfca48faulMhZZIFKNaM0axOG8FtGfcz1D/R30toTCHFbIUHhI7m0p7tcZ88RcCGdN/LCWJEXVzcEOVYh7OSkkhiSE3Jy9XGY7zDKuA6pI9ZsN38Lgm3ZfxAtJ7zXXNJgtStqbZH1GgRiO84/8P8IzZOD0pVmFYPIAYeltTthQ23eGD3G/pe7SoX1023oDUIeYJ8TI3+Xd10NFzlIcchKMXfMvSvLjNBpySWZ1k9HWNtqIt95h5loyWfN15iEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRjv4hO0WXV6Bp8KSRVEppn6tCRGSMY60Eoq3LGY9Oo=;
 b=Qh8QPNvjtT9fZvHcEM1JGR3kX2SKGi/ZUsrCuJy/QVBX3NLv0gUxGnM8B+dDAxUJA3yioL7ZGlEusI9kOvs0/avwDNsuoks/jdvqs1fQSSjnSu/Hw8FOaODQDWyLK+eyIopVmvOtzeQ3mvYGyzEYCRsb5V89hy2d5Iu4y7TzeiY=
Received: from DU6P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::15)
 by DB3PR08MB9899.eurprd08.prod.outlook.com (2603:10a6:10:433::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 12:14:41 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::19) by DU6P191CA0014.outlook.office365.com
 (2603:10a6:10:540::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 12:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 12:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEDwZAKkqmZStN7hAHmAffJpaDBOsDY28eLw4aAYCRCz9eP1j1BnMrTc3VWb4ZybY6qoq5BZDzxy1eTIgxJYKsk+ynC9Lo3+IB5y92/RkrTRnn6CLTGUBZUR9lVLXfNVAY0rA38fKG6vZI7LP8UNFiDTd0YhJWDD3l/S5KBRRR0zSugQyMME10gu5pzeOpC/Rco5vcakdeur4jgk4P/J6UydHfHee/eTqVNe4y7Hg5rTfzoh0uz/OTlprldn3gdZyFOBFvSTzlzX0dY/vLhyH1HOfT7/GcW34LjTrKKDYIelW8F+jiHIi3YHsBu2VSaTUKfkuDZRKQ/BlNTDQluTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRjv4hO0WXV6Bp8KSRVEppn6tCRGSMY60Eoq3LGY9Oo=;
 b=V7VQ9/+g1qrE1w8lnMX1+OEguY7XsiS9Wncgm8Dsa1Tdft3dZDWfj/sL2W0V6Gv7FvYZZb2unfy6Aynb0QEfsEb8zAFLPYrXljJJQb0X3rImJrOIABlEaL5eWQfzMY/xaxeXzG6nqq1vigpQrfSr4D8hnVOONzfFbo4ZUqdKxfWghgbAsmgQwFPUTTrS2Tdyu02SF89KZPYfj41an2QnvxeGRMufiDfuhaE/J4Yv+O5pUOAFM6ZpQ1Amb3resqW/yer9uuTi5J4x4NGlbtFWfDwBlin1V/yqONKLWMiivkMFMXXIrsHdHijWRUYOTyU+Aml17C3jkcUsiKTNaXvgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRjv4hO0WXV6Bp8KSRVEppn6tCRGSMY60Eoq3LGY9Oo=;
 b=Qh8QPNvjtT9fZvHcEM1JGR3kX2SKGi/ZUsrCuJy/QVBX3NLv0gUxGnM8B+dDAxUJA3yioL7ZGlEusI9kOvs0/avwDNsuoks/jdvqs1fQSSjnSu/Hw8FOaODQDWyLK+eyIopVmvOtzeQ3mvYGyzEYCRsb5V89hy2d5Iu4y7TzeiY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10289.eurprd08.prod.outlook.com (2603:10a6:20b:636::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 12:13:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:13:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libconfig: add ptest support
Thread-Topic: [OE-core][PATCH v3] libconfig: add ptest support
Thread-Index: AQHclea8bSV3zdfh9Eyf/j1jDkqLBLV74YYA
Date: Tue, 10 Feb 2026 12:13:38 +0000
Message-ID: <56068E4F-CD6A-4E3D-A685-52994C77FFDF@arm.com>
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <20260204145811.19113-1-pratik.farkase@est.tech>
In-Reply-To: <20260204145811.19113-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10289:EE_|DB5PEPF00014B88:EE_|DB3PR08MB9899:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d72f92-acc4-4845-983d-08de689df811
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Vm84emR4S2hKcU9yTzhzTldBVTlwWGdJd3JyQXlkbjF3Vjg5MjhUWk1ZRnJy?=
 =?utf-8?B?ME12blNBRDIwWHVyVitzRWt1bzVXM3Y5cVZ3bDlhSHA5azB2a2ZERTIwTkN1?=
 =?utf-8?B?OTJKU0pGbFhkTTlVRVZoeVZKemZJZGU0blVFV3lTbGhtT29Ob2IyYmQrYWpS?=
 =?utf-8?B?TkdmeUtrTXJTQjJ2YmFjVWk5MWh1ZFV1bDdUclErTGl3UmVmOE5kRUJ0YUh5?=
 =?utf-8?B?M2VDZk9acHpnYXhNaSttcHhkRFpOckJXeExjMitkQS9nendzYm1acWZncHVw?=
 =?utf-8?B?enBOK0s4d0RraVZONlhFV09nK05JUkVBNUMyY010UStkbWYyY3o3ZUgzbENj?=
 =?utf-8?B?cGRxRVhKamU4Zm91QVRMNzZmQk5hVWtqdlJBN1JsZWNDRUJLbkJ1QWhiVjRl?=
 =?utf-8?B?WjhPM0VoWUFHVVJtZnAzYy8vaGNidFQ4anFyYjNwbzZVWjROTnFhaUNRWklC?=
 =?utf-8?B?NDNpcEUwVURVL1Y0TjkvTUZaQXVNeEczSW1XRFd4YjRTUWkzOGhLMWc2U0k4?=
 =?utf-8?B?dlpzVXV2OWdVN01obGRwaVpESE93ckU0ZENyMjQ2VzkzSnBhVEZnVlhMQitC?=
 =?utf-8?B?ZlYwZUNLdEVQRWNHUnFHNGQxbklPMlhkZHE2eWcycVBxOHp0U1p2V2NYaVBm?=
 =?utf-8?B?NXBiUEN1bisvWUd0NnZwNnRVOEhJREJoTnZyRnZpS1k5emNhL2VkQUczak9R?=
 =?utf-8?B?dlJlbmxxaXQ2Z3UrNTh0YkhTays3OGgybWZWb1M3b0E4b3BmWDdWMzhibE5V?=
 =?utf-8?B?a2plbkNxbmxIa3JmNURkV09GZXplby9WU2tVNnhCcUpOUW5QU3o4UUlkTTdh?=
 =?utf-8?B?UTlubHZoNWc0eDlLeU9zODBzSkd6RzVyblJKdnFnSVZ5ZlJxMmNZZ3FTN3FS?=
 =?utf-8?B?VGJwZktJODRHZlp1NmZVa3A3QlY3cUVDazNUV1Uyd2xibGVmWVZLTSt0bnox?=
 =?utf-8?B?cW43a1hMcFp5RjlQMy9JVStJUTloVU0vazl1VWZJSExTYkQ0Kzd4ckMwSnNC?=
 =?utf-8?B?NzNkL3Y2MXpyTGNNV2VRWGE3Z2VRalh0bUZyY3RiYlFxT01RUlRKY0w3Wllm?=
 =?utf-8?B?NzJsNDRLMnEvSFcwLzlpUGEyRGpGMytYOGVXQ1pvRWZ1cXJpc3hPN0dEd2Ja?=
 =?utf-8?B?VVh2bzloT3RHMzkrOWVIYURnOTFNL210ZjFmYTRScTVHWlZsTVJiRDVzNTFW?=
 =?utf-8?B?WFpiR0h3enpZa1I5cmxPaXFpYzN2dWZnYXJveWV6VjdPeFRkOGtxTWdWL2lk?=
 =?utf-8?B?Vm5ZV0syb0NyaHlKK1hhVVFKcFMvMHBFTDdSRUgzbmUwN0Q4NHRyTDlYMDhn?=
 =?utf-8?B?aVZZcFhPRDdLdXZZOEltcjlxbU80U0RuSjF1eWFONzV1V29lY05jV2d4cEcy?=
 =?utf-8?B?RGhVaSs4MDZLaXZaQjlKaDZmaUljUEVYZVJqSkdEazBtSXNzNjlyQlZ0bU1B?=
 =?utf-8?B?emplTWRBQVo5bHBJRU1BcHVaRWF3c2ZNckdNKzRnVjJvemZaYkdQRkFJV2lF?=
 =?utf-8?B?bEFzQ3FkT3k2ajdITjU2TTZBOHNGLzQzT2VlTU5sLytJaDlmeWFFdjVHNzQ3?=
 =?utf-8?B?UU1ITUwyd3VnRndYdkNNYUlwV3BJU2dnVnp3VDFiS3NvV3B2Y1pRMlBZU3Jp?=
 =?utf-8?B?TU9sSlBHK2dXRmoxYmlyM29jQUV0clR3N0VicXhtUkgyZ1NUSnNHNXlzNFJ4?=
 =?utf-8?B?M3dSY1FBUVh1ZTJzNXY1V0xmSTdYNzAxRW1ZSVJKMGphN1FTSDV6RlVlUWRi?=
 =?utf-8?B?bjdFSzA1ei9LZjJiYmozZU04YUY4Z253NS81YkZWWjJWRE1RZG9GSFdyTElh?=
 =?utf-8?B?SHM5akRFbTliQ1ZNelNkbTV3Q0w2Z3Iwb2xOU3hJaFBjbDZwL2lmRjZxV1RW?=
 =?utf-8?B?ZzJnaDNMTE9jNzVTMVhIYXdMaTNqZkVTdzVPdmFUdGhEbXdDLzl5WkNXdHl3?=
 =?utf-8?B?TTRzb1ZLV2Jvbytid3A4ckVZNXdhMzRKY0oyU0FJSzJSMWxaV2lGOU5sb3Ro?=
 =?utf-8?B?UGZXWk9qcnhQSHZqVWcyb1p0aG5MVXVJNkZMN3ZNdGhvcXpSMFZLNm1pd2pY?=
 =?utf-8?B?S1JJaVFzKzFlUFBtQUtYWk0rdjBNVW1yUXpQNVBGcEtFWE5EbDM4RXFPU1h5?=
 =?utf-8?B?dTY4VkwvZ2J5djdJcnpaWlkxL2NRWWNsS3QrUU51bittYmpGZWt2S1k4dkpT?=
 =?utf-8?Q?YfNpaGFFhYJY48X5polOLzw=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F938728BF67FAB409B745109D6521F80@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10289
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c9c6b413-cb66-4417-abd6-08de689dd2a8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|35042699022|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3c2MW42S01OMDNicjNwVGVSZ0xCV0lma1laMnFncENiRzZrTXozRWw2VXlT?=
 =?utf-8?B?YXpvUWdaZW9jUTFiYy9iUG1uRVcrbWdFUWNNVlZjNEw5SUozaFUrR2VUNlNl?=
 =?utf-8?B?V0xRTXdKeGtDRzVaOGNqZml2dnBjM0NET3VGLzJNR3Nhdng5NG43NmtsY0k4?=
 =?utf-8?B?SWxJdTJxY01tTUlsSUNONkcyMlpZUTNaRWlsZzJ1WHN1YjJJUFI4Y2JTK1gr?=
 =?utf-8?B?Wk1lQjJQUkY3dzhydEYzcG5TdlJrRVpDaHk0UitxZ29lSnNVT2J0Y2crNXpF?=
 =?utf-8?B?NjdNQ1Z3M3ZmbHpZbDdVKzdFUkIxTDdMMWxSZSt2dWFmNU5QdWEvdjdWRXdN?=
 =?utf-8?B?QVlhSnhPSlhoT3ZtWXBqcUZYR2NlTVFSVHJqM05hM2UvSG5nTUJUeDVuR2U5?=
 =?utf-8?B?bE91dDhoY3p3aDRJQjI2MDlvVUtFUEQxSnhqcVZTSXFoQTdQNFpaYXdvUDJx?=
 =?utf-8?B?ZVpIMTJPRjhCd2ZRUkxLaENxR053eGFndlNsOGdoYjIvNmZqdE9USWxFRjFD?=
 =?utf-8?B?UmdNYlRJTnVKdUZ3MmcwTERXSHBqdnJKc01tMktVTEJhcDVIeTcwRDJZNTU3?=
 =?utf-8?B?RnluSUtIWllqUXZpaGY2MGhpZE9nN3dwMUljeUtyV0JyUzZIQTFzZWVITUZr?=
 =?utf-8?B?NzFyV0FWd2Z1R3QwZlFrZzZ6V2poNnpZMDArQnp2Sm05eTBUK285V1QzdFNQ?=
 =?utf-8?B?TGxXMS85U0R0eXhqcWlVSWp2SXpycnN3aHhYS0ttMmR0dUU1cVE5TllPNUhr?=
 =?utf-8?B?ZXhudHljKzk0R1FlcFRXTElWNGI4anU1UGUyVUh2VmlsUlJwRDJEWVNUaHQ0?=
 =?utf-8?B?dldocm5oUkxOc1d5RmVXWWU4UzlsK3dEeDZZTlhlbHNGWkoraGxybXRJUHQ5?=
 =?utf-8?B?Um5tUzVzZHBRTGJaUUJtQVIyZkE1S2ZkL0FTQlpHS3FKRnBKTTVjV1ZBVldP?=
 =?utf-8?B?WFhudEVxZjdiak0zeHB5b1dDUzlMZ0JQQlZKNmRVQ25naWpWckZTa25RZ2Nh?=
 =?utf-8?B?NTZrcWVLQlk0SkI1RmZZVUFlTGlha05Ud2lzNXFxZzBsUEJteFZZSmU5MHVS?=
 =?utf-8?B?N1ZhZlRHZVlXbTBJRS9PTmlDK1JBbXhCVU55TnM5OTQwbGE5MzRIVHZMUjNz?=
 =?utf-8?B?T3FGQzBGRUdydjYwVVRKMFYxcUowNDRaYll6c2ozRjFvUjNXT05DMEQrNmRW?=
 =?utf-8?B?Ujg4WURBZlZaRWZoUXMzUUpDY1I3VmpIQWNBK1BkaDRpL09XY05ub215N0U1?=
 =?utf-8?B?Nk1keDM2OEhzcTFndlMyVHZSa1dJR3RhYSsvdEEwbXFMRmNDVUNnK25wdkwy?=
 =?utf-8?B?V21XYXRGZFVnWjBzeUd1RU5LdzdwMXFWL0doUENZRDNaaDJ4Z3VmVUxOMWNv?=
 =?utf-8?B?bENIaDhjQ0dXYzd5cGlVTkpMNVVtOW1KNjNhT2RKZzJyNStUVkp4Y0NjUHBS?=
 =?utf-8?B?dkZwdjVsenh3RGdycVkzS1BpajF3SURadnY4K3gzcDNiSnUxa1N5cExIV0VS?=
 =?utf-8?B?aFNCeGVieVMvamJ1QmViNEtGUy9rL0l6WTFic1dRbHRjQ2hPV2JoaGpaSlA1?=
 =?utf-8?B?amEzOVV5NjJJRUQ5b0lGQTBCV1ZIOExPdzVwV0RpeEpPWlJRSTlJV3ZVUzAx?=
 =?utf-8?B?Q1VJTHJzUU9jN0tFN2tFQzhNcFNWV0JGNS8yZTJ4NVc2RUJHaytKMnJZU25H?=
 =?utf-8?B?WS9sb0ZtU3lrMFlOSHEyd0RXNHkzUndKeWVhbEZPb1ZUcnNTazBHVi9OcllW?=
 =?utf-8?B?bmJ3UkJyOFBEdjdSVEN3Z3VRQ1A0S3V1RE9nSnR0a0RQemJPWHFzVHJNOW1r?=
 =?utf-8?B?MHpxZVJ1bmJyTzhtOTdGMko4MzlLTU5sTEV6bTVhdldDNDBLdmwvem5qSnVz?=
 =?utf-8?B?eStRelN0NGF5a1M0SitHY3BHQVZYZ0dqUm1PVjJBSk9BMVppdzdBRVZudGN3?=
 =?utf-8?B?bndQN0tRWTFTalZMOFcxVlpXbWxTaE9XbUJBTHRhbzZERC9NNUVhS2hwWS9J?=
 =?utf-8?B?dEJHeVMrQVBFcnI5RXNLbGdDS3EzREFMRElHbHkzdExDU0JRbThhYi8rSGRV?=
 =?utf-8?B?cmFvaWZVYjB1Qjc1M255VWFRK0xMUG03aHBnczBDRzVhMk9qd3FVRjQxS2VU?=
 =?utf-8?B?S21UTVlUWFdicnlBNUk2ZytWbXhiWDM4aUN4SEE0UXlkQWN3ZXZwQ0FvenBx?=
 =?utf-8?B?Y2k3WUVQakZjQXc4Z3BJWFQ5Skt6VDFScWJCcGFDWEJ5V3BYVEZQd3ZTTUdF?=
 =?utf-8?B?d2ZmWitlR0Nuc0lMdmhmR2NqR3VnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(35042699022)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1dAlHBJp1wO41bgkPBW5U32JQuYjFeVq30PVZelcFnE6Y4OZgsjqoeCRfEBE+XD6IYQH2N6TkaGfLhcnJCM/uiitrMV0jQ9xOqcq/AUL4VCfFg0feRV7KK7n0RnItyfK88fpx7yO40fJMewM9j4yngi0J7U0jvaxObQ6XEPZZbI+/WSDzAmYwX2Donog0K0huzpFoywV20j4FsoaOMwSUvLoEnEf85SmHeWoa99I6KKgHbxQamyyZqSChelZbn5Mq/0kxOTbLgGpAs3O02GntA8EmMdzL/vkEDRQzKizvFOQ+aEXeUhh2uuPq6ydth8fDN6VAVg6oAYXrbT5O01O1Hfbhs4kOX0qtBj5p6OlgyZ+mrqxIC1Y5aHzJHfhJQsorpZlU5oV5GHMTJ8Uvx36McayviJaHNy/ApMTenvopqQEYlL8qFGqyiOrqpUSMJAe
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:14:41.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d72f92-acc4-4845-983d-08de689df811
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 12:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230891

SGkgUGF0cmlrLA0KDQo+IE9uIDQgRmViIDIwMjYsIGF0IDE0OjU4LCBQcmF0aWsgRmFya2FzZSB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0KPiArICAg
IGluc3RhbGwgLWQgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMNCj4gKw0KPiArICAgIGlmIFsgLWYg
JHtCfS90ZXN0cy9saWJjb25maWdfdGVzdHMgXTsgdGhlbg0KPiArICAgICAgICAke0J9L2xpYnRv
b2wgLS1tb2RlPWluc3RhbGwgaW5zdGFsbCAtbSAwNzU1ICR7Qn0vdGVzdHMvbGliY29uZmlnX3Rl
c3RzICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzL2xpYmNvbmZpZ190ZXN0cw0KPiArICAgIGZpDQo+
ICsNCj4gKyAgICBpZiBbIC1kICR7U30vdGVzdHMvdGVzdGRhdGEgXTsgdGhlbg0KPiArICAgICAg
ICBjcCAtciAke1N9L3Rlc3RzL3Rlc3RkYXRhICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0KPiAr
ICAgIGZpDQo+ICt9DQoNClNhbWUgY29tbWVudHMgYXJlIGJlZm9yZTogZG9u4oCZdCB1c2UgY29u
ZGl0aW9ucyB3aGVuIGluc3RhbGxpbmcgb3IgcnVubmluZyB0aGUgdGVzdHMgdW5sZXNzIHRoZXJl
4oCZcyBhIHZlcnkgZ29vZCByZWFzb246IHdlIF93YW50XyB0aGUgYnVpbGQgb3IgdGVzdHMgdG8g
ZmFpbCBpZiB0aGluZ3MgY2hhbmdlLg0KDQoodGhpcyBvbmUgaGFzbuKAmXQgbWVyZ2VkLCBzbyBw
bGVhc2Ugc2VuZCBhIHY0KQ0KDQpUaGFua3MsDQpSb3NzDQoNCg==

