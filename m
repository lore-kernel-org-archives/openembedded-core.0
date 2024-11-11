Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F377D2E9E6
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:13:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web10.58986.1731330803078394623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 05:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fmP5jzQw;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fmP5jzQw;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dxUohs/8GFlxTuDZP834ovrrc4HWxNuqLUnq+7PrbISp8yZoW+5U5aj9KoZC3XdjWN1Yyk662VUx/0V/kmAhE0zkyXyplEH/yZ/nQdDGxQQLqA9fPKyUJpOZJ0Z3nWb1k23ZFFfm4kr/LrX5VdL415AOQSZ0ATRfozS2KNjvTE2hg/lAS4kCpAleaCT6pU3ZfATiQvhEWkFw5khsYbRdFanWyfSKGQzXl4cDfFyXWdgPLwVJ14unqPntQFI1oK6LSDpYaZjoTqB/N+uR8pL+fuPym/FaIm0S91PFGj2ojo0MUQleBihHOkKnVjGusFonQS90W34OV/+h3/UpbyN75A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ1+kHrf7WC9z0IoxsAiQSRnRRQPNQ6uk3BaYUOMg+c=;
 b=iZt5DTSo26xCTXx/0zqFg4vk82CHzkoMnDfgfQotj3udSSyG3UaxLNd9kOtmsI4aHI98GtBGzFdN/3hPeI0dxNlOVI0t3gwBClX8uYHPo8Ea8f5WdvQo9IkQX5F7CmrFD2faFnNrjMocmbZ30W/AhWPLo6ibQbBBjZzBzZHM9nGdkmV8/N84JKq71B6xUVo7p+mXLfkBVNKIE3ceJZhOIw6F7gfbJ6ceT7nePvC1jrTjjQ2UUxRpX86keKfsJNuehK+eAiMvppUhLmLbqNFsYAUOWkvuZwAKi0QKXIH/BtStai2a2ZcdzugqBW6N6EonINeKVeQjEStaPDL5IPWtFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ1+kHrf7WC9z0IoxsAiQSRnRRQPNQ6uk3BaYUOMg+c=;
 b=fmP5jzQw83YvYcOnfWvorTWOtUHaHfNtKEk/ceIInHVWbvIWcArnqfVsgdCIXEiVnYpsR6ujRkB4vZpp0tl85i5vRzEBgOsUtoe4F7avhZorm5RB9Rm7I+MNKVtgZ2dG25YzWKxM9G0gNQw6YFYTjjvoogqWyKfEACoFnA/FokE=
Received: from DU2PR04CA0360.eurprd04.prod.outlook.com (2603:10a6:10:2b4::28)
 by AM7PR08MB5464.eurprd08.prod.outlook.com (2603:10a6:20b:10a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:13:17 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::a) by DU2PR04CA0360.outlook.office365.com
 (2603:10a6:10:2b4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 13:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 13:13:16 +0000
Received: ("Tessian outbound 6d1cdc6e2d10:v490"); Mon, 11 Nov 2024 13:13:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e554a303a4bf7b24
X-TessianGatewayMetadata: agdhHezWG7Bug5I5e2P5Niu0OG4vJ8hJOcoZi9CjBvoLbxHTbEKlCN8EH9l38u4Iiu62nhIqTANiWiTEli0id+c482euJWSQcsAC/N4D+nVHzf7vll4gkB0euoqJpxxCele9jIrgWnyoAVzbqwXh2QfnEihGPeJADgA4j7UA0XE=
X-CR-MTA-TID: 64aa7808
Received: from Le4eb86f9bb65.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A38CD66E-BFC7-4FB2-8A9C-1D7DCDC3578E.1;
	Mon, 11 Nov 2024 13:13:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le4eb86f9bb65.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 11 Nov 2024 13:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL2KM9jwzPxacEjYNEzMnNWCgo9qk61Qk3hMut0PLLJ9sYVZS+lB6tld6mOmtLFphyWN6Y2EHpY4WklFqhNkkJCGbzjJPfTPEXt71WRDFSKgIiTa2e5+y2WDjHpqEY96VijU6bZMM2ygCyaWXqW4DA7CkOOoOT8nUV7TobSXV19Iln9gB9Kg7YlQeQzgBZdWd3YkrvWmifXIWtxGH/CHhaNZruOBxOVtDtFvO2r3hn3ubyzkDbgyHBc1hjm7CrTFbXHyZOxz/dVCV1p1bwrzYEwHUZ/iAZajwYDhxGinps0GlbU4jnXrOCB6FKzP1faFX6RK0G94Mhn7soKhNGUchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ1+kHrf7WC9z0IoxsAiQSRnRRQPNQ6uk3BaYUOMg+c=;
 b=cg56/YhrtEI82/1YbLNxSzRhzbCYqeb41nUpUEKmA8h3NqxSfJpSTVvHtgk79JJAuexK29ySEy4YpZytf6MlnsTZij8Y7oWKrD5yusxQGzMYNiec+BuM8tQbU0vS43mqXTMvoAq9nYO4YQ8IDKa3fwqPrSj9UkfUFZq2jyd3vjLYcEMqiva674u5H+tDJNKYL8X4EZJ5BAJdMqi851Hlplty3RF55Eq+V8XqjxNSNvyvcozRGXrWNRWcG8vGtGqg0yff/vMa5A/kL6JnqZefptn5IbdlQln2gZ6N44Qn3GrWOmMN5ddkW9w8wa6DcBy/iVIsmWC07wz5KveJYyXo9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ1+kHrf7WC9z0IoxsAiQSRnRRQPNQ6uk3BaYUOMg+c=;
 b=fmP5jzQw83YvYcOnfWvorTWOtUHaHfNtKEk/ceIInHVWbvIWcArnqfVsgdCIXEiVnYpsR6ujRkB4vZpp0tl85i5vRzEBgOsUtoe4F7avhZorm5RB9Rm7I+MNKVtgZ2dG25YzWKxM9G0gNQw6YFYTjjvoogqWyKfEACoFnA/FokE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7320.eurprd08.prod.outlook.com (2603:10a6:102:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:13:08 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 13:13:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudni.m.g@gmail.com" <gudni.m.g@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Question: Need advise with providing native Bluetooth
 sockets for Python
Thread-Topic: [OE-core] Question: Need advise with providing native Bluetooth
 sockets for Python
Thread-Index: AQHbMq4J4SmOOT/aekukCpazSH+/KLKvB+cAgAAnB4CAAuKQAA==
Date: Mon, 11 Nov 2024 13:13:08 +0000
Message-ID: <955C8BA5-CE09-4E48-9CBA-6D7C37920301@arm.com>
References: <20128.1731163792219546941@lists.openembedded.org>
 <20128.1731172173460804344@lists.openembedded.org>
In-Reply-To: <20128.1731172173460804344@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7320:EE_|DB5PEPF00014B8D:EE_|AM7PR08MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: 41918620-3ef0-4e34-f412-08dd02529b29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cGtLdy9WcXNZbFlNRWw4Z3FEclZwR2ZZQ0NyaS9Ya0NDSTI2cVFMUDdQZzRq?=
 =?utf-8?B?SEYwdCtjVU1ibm53Q3FsbDJjaTI2Y0xYQWpNVkwzSmVDMm5JSmJxRm4yWDdW?=
 =?utf-8?B?Wk8zamQzSzByRnZEb3Rub0N5RmpybmVuVHU5VFpMTFFBMmpra09yclRIUHJM?=
 =?utf-8?B?YkJrcnBFUUpMSGc3RS9ja3g4Wmc3SEJoVlp4Qk5RNzVCeHlaN0Y4ZGhBZm5p?=
 =?utf-8?B?YnE2dmpDaHBRTGJndTJacG53RlgvSktzSThpMDduRFVFVU9Qbm9FR2hUNzdO?=
 =?utf-8?B?b1dCUjZ0QzRYUWJrR2tva3VyQ0RCRmJWaW5Pc25CVUxoRmhBNnRBUUlaRCt2?=
 =?utf-8?B?NkgrNFJmNVcveHMySCtIbkE1dXM3NEp5U3FtenpXWmtETnRmTTZQako2ckhG?=
 =?utf-8?B?OFM4V3lzTEFiSXN0U0FiSHJUQU9lWEc2UEoyckllZlFsT2xGZElMTEpOdy93?=
 =?utf-8?B?UEJqN0hyOGJ5aE1ydURoVnhTL2p4dllTclJhdnRxelZITHU4V09vUUg5Zk93?=
 =?utf-8?B?Q2pNMXM4Q3hncnZnem13TjMya3BIbUhoYVhHREtidXV0ZnNyOUJXTVJkSmhS?=
 =?utf-8?B?QVUrSk9td0J3MlhLTjh0YjBHdnBGZXhGL1NSaFBjUnFhQmxpYzJWQWdXOUFm?=
 =?utf-8?B?VWNxeFMrcVZTWlkwZ1VTNVpNWDJyV2NQVG44L0E2R2lTREZUZFJWUVRSU1RZ?=
 =?utf-8?B?dDRvOXdZNFU4M0U1dHN4disyRkhaTHhTcEFlVlFGeXVYcjZDajNlZkVlZDlY?=
 =?utf-8?B?eVpyQ2xEK2RmK2NqZGNGd0drRjBvRTFHSHVIeGZZbTlxcXdnWDNtTnNYSUMy?=
 =?utf-8?B?QVZmdXdYZlA4aVRaNHhPRVJicWRHVzZBS3g0T0lLWHRzVWF4WWtrZnlpQkpY?=
 =?utf-8?B?SVpSanhsYzEya3Nkb2phNU0vaEVqMTdnVVRjT0lMc1pycURMbkZJaWdVOTV2?=
 =?utf-8?B?d05rQjZQV2VHVVBwZ2kvc05Gdm85d3hkTUx2dmdncDdVc2kyL2N4WHUzYWxo?=
 =?utf-8?B?aGVML1lObUYrQ0tsb3VtQWxuVG1oeDVDTkh6Skd6SHRyUFVmZFh2eXErTW9q?=
 =?utf-8?B?SUVVTWU4RURFZTJGc2p1TXNTRkhXbjFZNWF6eTFUcEdRMDgxZUZGUkNOdXh2?=
 =?utf-8?B?NU4rRlJWZy9WdnpnWXZiVXJiTmJYSFcxbmloVmJyd2VtM1hvWThsYUswNkpY?=
 =?utf-8?B?Wm9JamNWYWwwVlBIdEhIaklFNkxJcXY0NmdHY3p1bk5tRGtNcVBmRkt1dEVi?=
 =?utf-8?B?aFM5VW5zRURKdDlBWUQ1UEk5d2ZTd214RXduT0RUUUJCSk1zaE1XUlBsVUJY?=
 =?utf-8?B?SnAxR3p5UmcrMS92Vnl5UXZnN2ppTEhwK0QrVmVjOVVudm4vbVJ1ellJbGNr?=
 =?utf-8?B?bEJzaEswTThaVlRwdiszbHI5TkwxNk5LcGpCMEZXUFhpc0VHd0lRNnRqZHQ4?=
 =?utf-8?B?dkdDdWUwTFhQcGw0b011WnZ1TEVwSFcwNlVwLytzbHk3c2F2RE1PdUh0Tlp4?=
 =?utf-8?B?NXlDUUZFckdPN0FWeE11d2xuRzNTaXJTWEhtd0RpQmNtTnNqNWJWRGZKNW5l?=
 =?utf-8?B?S3UxakVBY0F3UHMzeFkxcklmVC9USSs3NnQ5TUZtc3cyU2hCL0w0cmY0WFlh?=
 =?utf-8?B?aElwdnpZdmwraFpXOEFYMXhIT2tkbUViNUdTTEthZWdVcmRpTUE1WGgxNTBm?=
 =?utf-8?B?a3pqZE8xMkVNZy9rakVKektFMVVidjBxSVRHNEEwS1I5UXNwR2VWdU9aaHBE?=
 =?utf-8?B?dk1QOE52eTIyblpybHVTT1ZzNHVKd3pFSXhFdERpL0NxcVE2SmovMG9od3Va?=
 =?utf-8?Q?sGB6up8dLluoaYLlb00VmJVtTLZKvLvs0BSts=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3BC27A24E109F41B929F8A0F22FF3FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7320
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f15e0c16-e7ed-4576-f4cb-08dd02529616
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXhjd1o4c3FVYjVWVFRhQmZ2MU1RYmdUZTRKcHZxWktqNlFUcXNtWmg3ajdD?=
 =?utf-8?B?YW9OVXRsS1V3akE3Ukl0RituK1dZK0c3ODhTTU5CR3F3c2I2NHIzZW4xSW5l?=
 =?utf-8?B?dE1DUVhzWkZqTlJpOUhDMmdocndVTGoyOFZaL2FWTmRCUXRlb2pDQnVxYWxQ?=
 =?utf-8?B?RmgxOVY2Y0kyOE14ekdJelk0bFl2S210VzYrbnZ4eWdIcWlIQUlIakVRbGNu?=
 =?utf-8?B?Ykg1NUljak05TFhnRktjY3hzOUUvYVBhTzE2TmgzMGlLNFdVMkhycDFxZTZS?=
 =?utf-8?B?anhxdVVoczV3OTltcklOQ0Y3OWdMcmRPVlB6TGRJV1V6NGtkK21mNDNBVFBy?=
 =?utf-8?B?dEJIamFCSmFPUXJMbC9xdUowSWtpc1Vya2lrRktremlENFJJV2x1aTV3eWg5?=
 =?utf-8?B?bWNBNGkvYS92UVYrdVlpaG50VUpGeDJTQUlCZmlhWlppczZLalBrQTlmZ2Jh?=
 =?utf-8?B?eklFcUc2eUxZSmZBMnhqa0ZqTng3bDVuOVNnVlkzOUIxNWVSRnRLSzNwdm5Q?=
 =?utf-8?B?aWZWMHRKeFdmMVBqTDRKQ09OTUZmMVdTRkVYaS8vT2pPOEtpUE5WU09LZXJj?=
 =?utf-8?B?eFdSbjlORG93UmxodDJlbWRxNk9zb0FTZkIyUjBQZVJmUUlwR3QxTDlmWTh1?=
 =?utf-8?B?TTZsYUtMVmR0amhBeEFOdWhpZkhkN1BERnZ2M3RLcnRNalVqL25ZRHpydnFQ?=
 =?utf-8?B?Ukdaa0RMa1VQZXRONUkxYnY5OGltK1AvM3RjN2F6eGNrWFNheVJldHpta0F2?=
 =?utf-8?B?TkFvQ3JINER2QkJtaitTSURqRWNWZU51eWJqQnVPcXFwWW5Va2FoRVdmbDd4?=
 =?utf-8?B?djBFU2EyYWx5dUF0NldXSVMweU9KZmJpa3RiWE96VmJSZ1hTT3N5TWhzdmpn?=
 =?utf-8?B?RWxwZlRVR0NaQWtsUWZVQ0ZTMzl1TldXRDJaUTR6ZUczWmwxR3RZNFNYaXhL?=
 =?utf-8?B?ejU1cE4rSkZLeHBhRTFTaWZBN0x4Ym9Dcy9lTGsrTnJReSt4cCtIalNvT0JJ?=
 =?utf-8?B?dzlDb05kS2VtK0pZbGloYXFCSEd1SHA5UnRrWVNMRlFjY05GZEs0NWJHTHY4?=
 =?utf-8?B?VUM0TzlXN1QvSXk3TlNEbHZERG8yZzBtL09CL1NlbytCMER2cjNHbTJlUVZx?=
 =?utf-8?B?a3ZLWXdOMGdaK2F3bXpLTXhlSXFnOFhTeUlMM0FTUVhYRWYyUnpWRGQ0MUJV?=
 =?utf-8?B?OFBOUmcvdGtHWjJYdTQ4bTNnR1JaaWRIWlZSYi9pQUREZ2V4TTNkcmNjMC94?=
 =?utf-8?B?ZTBxb2NIMlc2anNRSkk3M21uMWdtOFJXb0c3QUlicVpmWnBDaEh6L2l5UXlO?=
 =?utf-8?B?S05aSjBJL3RNemh4T0Nja2d6cUNLTTNRQWwwUzl6R1hhS0ttSzVEUHY2dmdM?=
 =?utf-8?B?VkxOS1dFclYwbDJGQkdQOGFVZUN0TUU3dU9uYzdYbjc0U2NRbG9IU044anpl?=
 =?utf-8?B?L1RSbTVHb1pNSVdWalBjOGh2dnhlZ3o2N2Y3ZTZnY1prMFhaclk0RFlBdmIx?=
 =?utf-8?B?MDZURHpXdVFKYXo3ZjVGb0d4VUVDSS82Q3gwdG0rTGo1L0taVTNJbHl0QUxz?=
 =?utf-8?B?R29ENFVuTGw0UnR0ZlpRcUowV2YrSVAwTG1zSXcrVURISWtydVN3TXFJbWcw?=
 =?utf-8?B?ZXFtLzd3QVovZWw0NHNwWWRaZjY1SVhuVmJ6SDNSTTVmSHgwYnlycEZQTVRi?=
 =?utf-8?B?bDN0YktpYldLK0czQVdYNlovQi9lRUJYSzlMSmtRR0Ruc3BHTUY1c0dwNHBl?=
 =?utf-8?B?SGJQZ0xuSDludjNDY1VSNHdMWFljZldwdDhLY1JRQUkwRXRRV2pvak5hYzRP?=
 =?utf-8?B?UGNoRzdlUzNDYitzYzFDcGJrUXpoTWI3aWRYQTBxeGZ2WWdNSmtpNXV0UzZC?=
 =?utf-8?B?RlBrb2lvZWl0OERIcnRFMWNLMzVGZnZqbENpbHBTS0tTdXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:13:16.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41918620-3ef0-4e34-f412-08dd02529b29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206952

T24gOSBOb3YgMjAyNCwgYXQgMTc6MDksIEd1w7BuaSBNw6FyIEdpbGJlcnQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPGd1ZG5pLm0uZz1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBBZGRpbmcgdGhpcyB0byBibHVlejUgYmJhcHBlbmQ6DQo+ICAgUEFD
S0FHRUNPTkZJRzpjbGFzcy1uYXRpdmUgPSAiIg0KPiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSIN
Cj4gICBBbmQgdG8gcHl0aG9uMyBiYmFwcGVuZDoNCj4gREVQRU5EUzphcHBlbmQ6Y2xhc3MtdGFy
Z2V0ID0gIiAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2JsdWV0b290
aCcsICdibHVlejUtbmF0aXZlJywgJycsIGQpfSINCj4gICBTZWVtcyB0byBkbyB0aGUgdHJpY2su
DQoNCkFkZGluZyBhIFBBQ0tBR0VDT05GSUcgZm9yIGxpYnJhcnkgdGhhdCBpcyBvbiBieSBkZWZh
dWx0IGFuZCB0aGVuIFBBQ0tBR0VDT05GSUc6Y2xhc3MtbmF0aXZlID0g4oCcbGlicmFyeeKAnSBz
ZWVtcyBsaWtlIGEgbmVhdCBhbmQgc2VsZi1kb2N1bWVudGluZyB3YXkgb2YgaGFuZGxpbmcgdGhp
cy4NCg0KUm9zcw==

