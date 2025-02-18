Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FE4C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:55:50 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.56])
 by mx.groups.io with SMTP id smtpd.web10.16799.1739876140222364639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NyGgJA+M;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NyGgJA+M;
 spf=pass (domain: arm.com, ip: 52.101.67.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cmHmLfuWWRtpLiff2anK/VjesdsHMxucDP6ePeWnM7BtZdmuvOi0G5IigmGnaUexconUr4K7e8lR6TEABGqZkQPCLKUQiMFhsCsXFxsLoYixjEPQkT+bfnFljHpG4h+snnx/ZPsJfbPOC5Y3yxFFr5fGoOYh7rcpDJekBWoyo7A+iARy5XJq4nXFer9KIZH5rJk3M8NCz6SMEQNkyX4+1ecfrUNDP0BlmcReXuGwGVTH1ElMqxnZnMy4cRB2DzIy4NfdWv1VSJy+/PQe7P1FiStT6a8usD6u4lwuljtb0rxj7Ti0+qyiBc4ClO3btATH8ig2l1pYSCQQhQXyBa/KJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmHW3jLq+oSpY0qJCoxTWcnsVvHygTr0M3VMbfWsM0A=;
 b=WOEu8fW+YsUKBh3zQdNxbhh3XXGrYJDIJOAMIhluxxRW6kevra6RKgo8Q5lZvDkN9KTLXEmhB9Xe1gCz9ekzLg0pI6JAwZ5bmjhAxPqQbGTXq+PZQDQ3+93ERTD5BhXYcte+z3cGi97DYkP2jbeIK9xrF8st8W/YnL6BwMFGmG2EvTiXKzpBv7UeazJV9rw0Nu3rHBhJxMTRp8jwmRB5bvOGq5OWO8iSq2GQZjbYLX+Wln+tzfChcZe1Y5xiG7xv+CHH3gb5o412r9NbrQa96u54zDfoZfBxaterP6T93HQLQqfY47kuvD9skdUMWGzG1jis/wjysjsp/hv6/ZnVGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmHW3jLq+oSpY0qJCoxTWcnsVvHygTr0M3VMbfWsM0A=;
 b=NyGgJA+MkmCZsshUVlHNLyV0JoIcmaio/iRMo95k5VakAiVbHUA4OTPOznmw+GU6CtWmWOAJVgGOmSCEq8lBL01dGNNPcov9D1Q4BxI3s86m2cFyCB+iqV04oi6qgXlRFB0NEkPfQIqSsvAmuvNSca0XKBN8xYEb8gaiTVSM0Jg=
Received: from PR1P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:344::16)
 by AS2PR08MB9666.eurprd08.prod.outlook.com (2603:10a6:20b:606::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 10:55:34 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:102:344:cafe::bf) by PR1P264CA0178.outlook.office365.com
 (2603:10a6:102:344::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 10:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.2 via
 Frontend Transport; Tue, 18 Feb 2025 10:55:33 +0000
Received: ("Tessian outbound c2a0e6651601:v567"); Tue, 18 Feb 2025 10:55:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ea500ea0c7e191f
X-TessianGatewayMetadata: jnluO+a7dH11NKYvGFx1vYq76oub5c8Cbnsd/GChMYvLObB4JA3C4zl/YjaZ24FKV6UV58Eq0TLMgLrreqrf7Hq7bErdI6+/eOjPDFGM/Yj2BPHK5ByLzeU8Rb5jua96N8c2tKiYEfk4AGJ3y/uh4R37YYTMXGUAB528SSm9xyQ=
X-CR-MTA-TID: 64aa7808
Received: from L08aa13b5f4e6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D83DCAA0-58BB-486A-9402-7E64FAA818FC.1;
	Tue, 18 Feb 2025 10:55:27 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L08aa13b5f4e6.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 18 Feb 2025 10:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFmqu52L1LH9Al0e/7kKJmO2s9mKWFE+3ex/UNSUTVPfBa3pPJeJh8ZZ+n5E4OrSYWCWLDknCWdrjgOx2DM17m3HBC5wrd96fJ+X4UZWTws6LbZWAuV95ioMj5d1psJ2qOiY0iauFxKcBTKbtJL3d+oCiA2cdhb6Xlkxo7Iwp811m/v34MTjhGdxPUnXybndJxKNgWl/TsVUM+qTWbshfCMOW9EmoUnqab5q8FIvY8rjB62s5atqVR/rXGEy6cQOiwML+lhcdjhoc2Un5KuVV98PdU4fdRD8Scgf58ImO/BPwFCuvqCnrlHC+dcdKtdXi0kxSxgwiWpfIjQRBJfMzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmHW3jLq+oSpY0qJCoxTWcnsVvHygTr0M3VMbfWsM0A=;
 b=qXcuACBZwLSRICYpK5ey7Rx8h26XjbDMp01KxRBuRtuyUmBnf21kI0pOs1ytCtfJdHWRwndTxknmuh18+KM2ve+1+u4M5K4T34Jj3YhcH8u18cMA2ubZa0DqSPDC/hY9ecpDIRN8AtEAGKPlKHK27vzseuAhx5wpSFC6F9R1OeZjRzkEa7MaClhf3JVVaIHGFGGLk5cBXOivKvOTlSMDIE6Z2e6wxWUcZkGmnuC7ut0MrYRwcFbW92OLEmVdrFIZv43lH/sOc43LZ4mV2LutZIOwx+cakNygaAtlST9eNHHvRPkJ1O4nnfSv025wc3kZtJ6VPS9WktBMFTMS5K6tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmHW3jLq+oSpY0qJCoxTWcnsVvHygTr0M3VMbfWsM0A=;
 b=NyGgJA+MkmCZsshUVlHNLyV0JoIcmaio/iRMo95k5VakAiVbHUA4OTPOznmw+GU6CtWmWOAJVgGOmSCEq8lBL01dGNNPcov9D1Q4BxI3s86m2cFyCB+iqV04oi6qgXlRFB0NEkPfQIqSsvAmuvNSca0XKBN8xYEb8gaiTVSM0Jg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9482.eurprd08.prod.outlook.com (2603:10a6:102:318::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 10:55:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8445.015; Tue, 18 Feb 2025
 10:55:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] libadwaita: upgrade 1.6.2 -> 1.6.4
Thread-Topic: [OE-core] [PATCH 2/2] libadwaita: upgrade 1.6.2 -> 1.6.4
Thread-Index: AQHbdpMJM7DWEjqQvUuY7+WzHOKTnrNM+gQA
Date: Tue, 18 Feb 2025 10:55:22 +0000
Message-ID: <58620CB3-87CE-4DE8-94F2-13BB9B759D04@arm.com>
References: <20250203232543.830904-1-simone.p.weiss@posteo.com>
 <20250203232543.830904-2-simone.p.weiss@posteo.com>
In-Reply-To: <20250203232543.830904-2-simone.p.weiss@posteo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9482:EE_|AM4PEPF00025F98:EE_|AS2PR08MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d0eb74-a5a9-4075-16fe-08dd500ac4a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Nm82Y0hnZ25WcGhvelMzRXlzbjR3aCtTTFpKMHltM1JRbUUvbHh3RWJlK0U0?=
 =?utf-8?B?aTM5azBaRkExeWxxa0VUdFNWUUxYTHh0Vm1rK214bFU4WEJFQXFrMlM3T0d6?=
 =?utf-8?B?REI5NGs1NHljVnIzVU5xTkhhWUNnc2JUeDJvdllzc2JNVmNaS3cvbTV6MVBY?=
 =?utf-8?B?c1Z0aXloRHpQR25TTEQ4SEFFOUFxVk9MYUh6UkZqeDByV081RUMxcWhWK0Uw?=
 =?utf-8?B?QklxYjBSRUtpSUVHZ2dYdlNXYS9lMHc3ZXV1WmRZbjNYTEkwUmNqbnRVUC83?=
 =?utf-8?B?MEUyVDRxaHJyditiWDNSWENTdStYdUlvVmI4c04xd2IzVWxUdHY4RGE5RHRp?=
 =?utf-8?B?Z1RIenNsbUx6L0o1TGFBaXQzMkpWRUZ4WVdWY2k4M0cwZTAxdHZlazJXWFd5?=
 =?utf-8?B?TmlNeXJIbDNhM3ppeFlRRk5WaDBMSGRZeXhIbmVpSnJqZzU2MVFuWmJzbmhE?=
 =?utf-8?B?T0xZeDBWZGl0Y3pTRzRnSGxnQk0waHp0M05LcWM3TkphZFZWUzM2VjJabS9Y?=
 =?utf-8?B?M0N3bTZWdHhGNFdqdXBBeEI4SUVHV3RLbzdMTFZnSDk0T0NqbXcrR0VBTCtN?=
 =?utf-8?B?R1dFWW5zbVptaUNXaGlGSVIyTzdCRWxTVjVmUnpwMDMrVVFJWEE2QzhtTzdY?=
 =?utf-8?B?a3BNYWxCcXdzd3hJSUpjMUJub3VJcXpndU5xb0VqcjVBWDV5MlRFYk9RSlJq?=
 =?utf-8?B?ODdneTVsbVlPTWhvdFZKTmxhNzBraSs4MGlGTVRhdmFiWU5FTkpMR2RCdnJZ?=
 =?utf-8?B?MFM5ZlZtaDJxL21xcEhZKzlReUwwbjB6VFV0OVBVWHpCLytGbUwwcmg0dlJu?=
 =?utf-8?B?UmxnMTl5aVVnR1NZODR1RFV4VFNIcXZoclV5REFWR0Q3TndjTnBsVW1Oc0pz?=
 =?utf-8?B?cE16aUo4eWwxRHJiZktvTDZSM0VuY3NXVHBCQjdFM2J0ekp0cFpiU2dmUmh1?=
 =?utf-8?B?V00rbzE0dldWTEZUeDR0UVpXMFpoZzRXRXRPSlpFVmMyM2UrM3ZPVko0NjVC?=
 =?utf-8?B?SEFvTWQ1dHlVUUJGTFN6ZVlxU0o5MUg2WUFlT21uc0tGUTIxdkFQSVRsc0RH?=
 =?utf-8?B?TkhuaDNlMVRDZHYvQ0VaRzZYTHh6ckVkbWVNMXRsUjV6RG5YS3BkZDV0U1Zu?=
 =?utf-8?B?enpxbCtGTGF6elVZejNMVU8xMDQ1aEY3TzF4T0VNQWo5STNWWGExYjRGUnJG?=
 =?utf-8?B?Z0IxQ0pjTnFyNjNmeVMzc3R3eUJIMWlSUTZhNG1iT2tkQkdOaGRHZkFHWFA1?=
 =?utf-8?B?RXhlZjk5SkZXd0diQnlJTXJmSm5ZcGoyU2FwaTU4b3k5dGVTU2pyWGRDaUhE?=
 =?utf-8?B?Zzh4OEVDSnB4d3JJN0xjaFBPYTdocVcyVGdPRTdVektxV29yR0MrdDRWRkxR?=
 =?utf-8?B?UlZZVUlQajVuUWI5aU9kS1FoYmMzTUZXRlNnRHF3cTcxWmhLblU4MjNhcmVw?=
 =?utf-8?B?VXB1b1VUU0JVQW5TcUJYTU9NMWl5TTVmOWc0emJSaktmYXNPNXJ3MTNwcE1S?=
 =?utf-8?B?UkVMUFp6cVQ0TVpSWlJ6VFRZbkQ0WEJ4b2xTNklRQk1WbSthQ1RGWUpWTkpL?=
 =?utf-8?B?c1ZtWDFtaU9YMFdibzFoUmw4cE1sT3BKakZGdmNTWEs2V0dWUEdHNExHaVF2?=
 =?utf-8?B?ME1SSkNBeXhZUlRKSmVNWmRnbVBIaDRRRXVQd3lwbWlaWWZ2WkEvQzZWTWhN?=
 =?utf-8?B?MlhMVnp6TC9oT294YWNVaHA4Szl4K2sxRTZBYnFoRG5nU3FKZXBRZ28vMnhn?=
 =?utf-8?B?dmtpWGtLbmQxbEdKTG9HNndzNkhYSzB3STUwRVRuQlV1Z1VsTEhUSmZpSjRt?=
 =?utf-8?B?ZmZPazBUZFA5bUVqd2g4OGxQTU1WSDdxYU1sYmIrb0hnMHZRdkxxUWUxUVVL?=
 =?utf-8?B?RVh5YlRsQWthQWJzbGRQTlhHU2RhaDQxWE5YdUMwNmJYVk9yOEROVjQ4TnFC?=
 =?utf-8?Q?Wz79jSfCWyZ+RAM6RwuPVmbarSq9YK8p?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E19FA4AF1A20C41B16EA4E96A86773B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c99b71cd-ad94-47fb-f351-08dd500abdfc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|35042699022|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2EyZzJyWXVJR0ZKVnRRL0V6eFB5R2E4dDZ5RDhDTFg3SGxrRE1tdHBGQ0Q4?=
 =?utf-8?B?WFF4MkY5amFGTzd5OWlwdE5rRWxLL295MnRaT2VuR0QyMGJHSnFXckFJeVFj?=
 =?utf-8?B?S3pYdVo5dEp4QldKbkwrZDBSNW5LYVhLdThNTG1QdUxTTWRBem1kQWMvck1M?=
 =?utf-8?B?aDQwQlNzY2NEdTZVNSs5UkpQRW1sbEZ5UHBZbHFmeFJUWDl3aFhSbFplNjMy?=
 =?utf-8?B?SzlCMW1FVEd0VXhGVi9EcXBTQTdDUllaUDEwbkM1ak5GRTVDYUdHaXY0cENv?=
 =?utf-8?B?eVJlWkduYStxOUQxYWk4aTh1UUZIV0lPS2JMNnZROXU1N0huSFJaMWd3bXVY?=
 =?utf-8?B?Yk53U2hCNDMzN3M2Y3hZN1N1c1lieXo4em9NUDFVUTNEZ1RVaFpMRFZqS0dT?=
 =?utf-8?B?dmQvenMrSXhubFNJT0lLZWoyODYvcVdoS2hMdnJ4elRlZ0dSSDV0UXFOd2pN?=
 =?utf-8?B?MHN1WFVYK2VJaCs5c0duK0xDZTZQeE1BTEhIamJpeVhTaEVoUVNRZTJZU0N0?=
 =?utf-8?B?dFNMcWp3MG84MGM3bi9xbHpISzhTM3EvNk1yemw1MHUwMnkyUUdQNTQzcjJs?=
 =?utf-8?B?TE01cW45WFdrdDhDV0hMU1VQVVYwMlR0WWlWZkdYWUthNERkcDU0VGFiRXBW?=
 =?utf-8?B?V1IvY05BQjJGWXkxazA0UkU2cnBJYktHUm91Q0JVQjlEbUpMTW03N01qRDNt?=
 =?utf-8?B?ZFZHejcxMUowdmdSaENXY0Y3OC9lQ0UwOVNtZzVMbkNzdG9tMjgyRkI4LzFh?=
 =?utf-8?B?alpJZ0xIMlROaWFJMjgxbFRqUTdPZXFvZzJtVTZjdFFtc2lEMU16SWpCSnlF?=
 =?utf-8?B?VmRDTkFmTzRwSWNDM09Hd2JnSGx2QnpTbnEwSXVocmE5cTdVQ2UxS0xvcFll?=
 =?utf-8?B?dFFoaDFaTHFHa2w4Q1ZVRzF6U3FjaTl2REIyREZFRWVoTmZza256a0ZLM3Vw?=
 =?utf-8?B?VTBEQkxQMU1xcTJGZk5GakxzMDVBc2tINXpKOW90MlhLUzJHOFJsUEVaVXhD?=
 =?utf-8?B?UXRMc2QrREx5eWdrK0lwU1RlcGlvYlVoK2xpc2QzdjBSbWtGOWpBNk9CT1Rm?=
 =?utf-8?B?cTllcE1qek9IUjYvQ1dpYXhaRmw2L2pmZjRvZUR2azdTSndIMVJQL2s3QjZj?=
 =?utf-8?B?VG9ldyt3K1RkYi9KRGlWSDhGT3ZpVGRaODA0REdmMzVTZDJUTTZmaUpsTUJC?=
 =?utf-8?B?RmtySXc0ajhIM1BKYU1YdnBCRlR1ZGcyWjU2ejBIUXhGT21zUmlYbDd5bXBC?=
 =?utf-8?B?ZStpL09rMzNHZFBTNDVoTDlzelFBaTdHMjdFNnR4b3VTaXRUSnB4UWtGY0V6?=
 =?utf-8?B?RDQ5TStrQ0pNOVVtSmYrb3VkVE1LeUUyTmF0L2V6Tk1DMW04YUE1eGNTTlUv?=
 =?utf-8?B?R21xSVdjYTQycC9oZ05nWjhxZ1dLV0ZQRWFEL3dpQU8zbERKbUQreVY2d2NL?=
 =?utf-8?B?dGtvUDRWdDJ1aFNXTkZ1ZjhYKzdISjBINEdJcko4VU9idlEwZG4xZ3BIQTF1?=
 =?utf-8?B?YmRNTXd2MXJxU2hzQ3V6cUNtaXhob1BpcW5maXJob3FwQ3Rld210MGRNalBY?=
 =?utf-8?B?MmMrdHRES3JNVTFNeGpYdTNLOWxPRE5BKzh2VmxBODVSSm5PdDZmSzY2b1k4?=
 =?utf-8?B?ajl4MmNZcWpaRUF6NEZ2T1Z4UVdEb09idDNVODNxWnVPMmw1L3QwRVQwUU9a?=
 =?utf-8?B?YUhKcUZaWEprR0h5YWUzcmN1R3hxNEc3YjN0Y1FURE1GbkVhaTV6eFhmd3Nn?=
 =?utf-8?B?ZktkYjVvZVcyZXBDNFprcGVTOTN1MDl1YlVMZFhIc1o4dEZQVGQ2eDFiaGtT?=
 =?utf-8?B?QTRtdzFTT01uL3E0UkoyWWt0Vk9qN25yR0VONk5nNXlSZEYzUHdkb0MvQmlh?=
 =?utf-8?B?MHdHZjd0Z1pVc3hIVElnTkpoZzlZTWhiMlB5UzV0bE4yRVd0dXp0QlBNOHBT?=
 =?utf-8?B?WWVzUExBTHFPMVF4LzlGYm9VcWpnbndWMllwSjRQbHN3cUZjNzM3SE5YWFJa?=
 =?utf-8?Q?ALVuZFZ78mKHcqhKycRAuW0eMEvL9E=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 10:55:33.4861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d0eb74-a5a9-4075-16fe-08dd500ac4a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9666
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211604

T24gMyBGZWIgMjAyNSwgYXQgMjM6MjUsIFNpbW9uZSBXZWnDnyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8c2ltb25lLnAud2Vpc3M9cG9zdGVvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEZyb206IFNpbW9uZSBXZWnDnyA8c2ltb25lLnAud2Vpc3NAcG9zdGVv
LmNvbT4NCj4gDQo+IEFkZCBzYXNzYy1uYXRpdmUgYXMgaW4gbGliYWR3YWl0YSB0aGUgaGFuZGxp
bmcgd3J0IHRvIHByZSBidWlsZCBhcnRpZmFjdHMNCj4gY2hhbmdlZCBhbmQgc2Fzc2MgaXMgbm93
IG5lZWRlZC4NCg0KVGhpcyBzZWVtZWQgb2RkIHRvIG1lLCBhbmQgSSBqdXN0IHN1Y2Nlc3NmdWxs
eSBkaWQgYSBidWlsZCBvZiAxLjYuNCB3aXRob3V0IHNhc3NjIHByZXNlbnQuICAgIFdoYXQgd2Fz
IGNhdXNpbmcgaXQgdG8gYmUgbmVlZGVkIGZvciB5b3U/DQoNClRoYW5rcywNClJvc3M=

