Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED564D6910C
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 13:36:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web10.94417.1732800991569361361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 05:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hndI2/Nn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hndI2/Nn;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f8Q4pN+VcXF0I3qaQj28a3CbLWPze5X6eJfbRQvIyMZL/zFMj0axwfNEW45CGTpNbWQH8HK/lHkdIIUTHdUEHWThWNXGJjyL1Z3sNSf1JGuQleyegvgeQBLhAaOQmCruIEWa+NjUyoYrxoKGkDfy7Ma6eCbHa/G+H7KVWHjbSqljR3nhJpE7tNeD5I9MWRORM0yEoqGwSffiaDFhFd5qQJ/POs9RYYeySORxO0mTzKK9MrtfFH+pJx3VzFl3+3vQY5nM1DoLFa1imLfpmCkqaz+vWZyKvrye7OSjcOGknDZJD2DXPX44cl3bXgyC2/wgEM3bKUuz3W9SKFa4wPk8Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMQNUyVgUfsNRlCzWC5Uzg9OoybhQDPten62dZg3ltc=;
 b=g4ZZ1H+bIwlSW5e00tcLZxuYQ95jEbJz9Gh0Jg1Un3uYBdeKGRmlkU+PxmM/5sxQ15ShhUno/ivvFRpBc5UNSDkh2zCG4PdhWxHeAh2rKPfM1r/WKLWVBTGRYls69GTRiJfMtETOG1Hq/OX2kIf9GfOSMFXsG3woVaSLc9WthLuf2SZ8tjOHlxey3TMdw6tBn1mCw5e8XnPCSOSvo1iWUh0jsfQyRFM3VaWk6WFADYQgRQcHIkTOpWbtQm7Yqnk4cm2/Se1Tqml570d9EPIkEG3ReAPhnlCuTlymxK35JvMCkKrOInHfGeubEchQS1OL4V1Npktpdi6dn3LMk8yu5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMQNUyVgUfsNRlCzWC5Uzg9OoybhQDPten62dZg3ltc=;
 b=hndI2/NnQrnSH0E1vnQWKvuUjr7yXiNDUAyEoK8m8XCGV+OS4AbTmKhNomz/LjKVNigGXZPZXFHOG6P//VSw2ugmcEzp7DjLquQTi3qjIQgL0P9k1Ze+/fqSBPYz+SntKU7ptFRtKQEpKmKPQvmw9qXFYFAZcQ/PPdVKjqyvXpw=
Received: from AM0PR02CA0125.eurprd02.prod.outlook.com (2603:10a6:20b:28c::22)
 by AS2PR08MB8830.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Thu, 28 Nov
 2024 13:36:26 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::19) by AM0PR02CA0125.outlook.office365.com
 (2603:10a6:20b:28c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Thu,
 28 Nov 2024 13:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 13:36:25 +0000
Received: ("Tessian outbound 4eb3d11e9250:v514"); Thu, 28 Nov 2024 13:36:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a43d6c4eb65894c7
X-TessianGatewayMetadata: waWcK1w74uIaWciBPQeME2/snvSCm2a6D2Sna1fxBps6m7M4XsyQic6o9vYZV9foKrTlkq3+Yk7lHiRzn8RlQurGWPDmQiVjdJM96sOM1Ffy3whz60fJZmwQjSHvgv9VTiiMib8vFzX04f8DEPeXy4R8xe/MFDOjxRNNGnT1Pa8=
X-CR-MTA-TID: 64aa7808
Received: from L98f5ab9dcc88.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 95BD9634-C117-472C-83E0-ED81A0906D48.1;
	Thu, 28 Nov 2024 13:36:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L98f5ab9dcc88.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 13:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNlcGW1/a2E0dDDcmK8wGWGrFilK8xIl8F8ciwDPBLqHfhdkgWnztjnU1CyzdJK3tGmv6B8vH6p3YpJNvWmzcflO2X8ccyuhpO4D6qpwfc5t7sMZnyzbCQJaJYYAhRJzuDfZx9/7tLF5YoZ9mdiE8KQgg82HQOKR4eekLmZoh4zpPhcug+Z8QBoeu8lvXi/JYv0zpwNS7bILmglOwhjTGnKYqZC4jwSVARMjzxrs3FZGGKwaTvKmFGktCDo47BmzDFx11dXyEyiIQashvuUXUoDewQE38yPLTXSot5NJgDq4UkZWaEtETMbvz7vdYDXoF6pJVnD1UXYwHNYQy9CdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMQNUyVgUfsNRlCzWC5Uzg9OoybhQDPten62dZg3ltc=;
 b=MtxOY/wRGNds+PlFNOvwaNxi8JmD23Xd6frQ1espYflaGGtC5RqcXlZ0mTTiP0M3XjbkyJMF7UfNnLKvsLg9apGU2XwZiZO9Tu+9wNh2IaK+lYxc5SokhkrV7hdC5rSCd62QOd9ZOKf/cPxah08tVXeC3SxhgHXVOVPYpJhJpAVMP1vjU3INjFcjPawEa30Fcyz82zUD+EStcEVILYWRAkymvGW+BtM/wuv99g4HbcdUXORUFi0EJf6STAiZbJUJ8dF1VdPw+alLlok5te68jNIfeGqgO0N8yQHajJ22ZinXmzYuxSLTDk+4jc4hBeaYavlmECr+uokSBOqqqARFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMQNUyVgUfsNRlCzWC5Uzg9OoybhQDPten62dZg3ltc=;
 b=hndI2/NnQrnSH0E1vnQWKvuUjr7yXiNDUAyEoK8m8XCGV+OS4AbTmKhNomz/LjKVNigGXZPZXFHOG6P//VSw2ugmcEzp7DjLquQTi3qjIQgL0P9k1Ze+/fqSBPYz+SntKU7ptFRtKQEpKmKPQvmw9qXFYFAZcQ/PPdVKjqyvXpw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10454.eurprd08.prod.outlook.com (2603:10a6:150:15d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Thu, 28 Nov
 2024 13:36:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 13:36:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
Thread-Topic: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
Thread-Index: AQHbQOomg43r/y+kvkCrMhZvznLxKbLMsxoA
Date: Thu, 28 Nov 2024 13:36:12 +0000
Message-ID: <C8D6F167-2022-40F4-A4AB-7EB334C2C821@arm.com>
References: 
 <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
In-Reply-To: 
 <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10454:EE_|AM3PEPF0000A796:EE_|AS2PR08MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: d0756498-424b-42dd-214f-08dd0fb1a794
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N1Q3M1k2dktmTFAwRk53TlBZeWN0eEZvV1ZiSzVEMVpzTHBUWFlHRlV6SWlR?=
 =?utf-8?B?Wk5OQkR4OTdqS3JYcTBYUFZhWTRSK2RhNHdpYXZlK20vS3F4VW9GY2c5cmZ6?=
 =?utf-8?B?eUlyR0R6dnFMR3hicnZEc0ZiaVNsL0FzQVk3OWRrcWNlVFpXZU5qL1AyaUli?=
 =?utf-8?B?dFNhODJwd0NETHdMRE5Hdnl0bXdxNkZvQkxNa09iVVpmUGtTckRPbDJrOU9x?=
 =?utf-8?B?TlJsUUc5aXRmbkZBUVdFRUgzMExJV28zdHVORmNZNVJDdjZxTGpxNmNzaEFP?=
 =?utf-8?B?dTdZVDh4S1NjKzJNeVJaQ0JRYS8xWDhrR3BEb01Fc25JWGhrY09MOHBPUjhi?=
 =?utf-8?B?QUtwSkM4VklBb2pvcWdISGJlemtDUGNsc2ZTKzZqVm52cUhWNUY5V0F2M2Fs?=
 =?utf-8?B?OENIbGNMd2xtZ1E4TEFBV0tRbTNEWDF0a0t1NXNtR1RYM2g3MGcweXpZU0l4?=
 =?utf-8?B?TmlKVEp3TWwvYlozMTNYSFM4SjVuWXpCMFhDN1U5UTJGcS85eHlRd3ZpZXpD?=
 =?utf-8?B?V1laL3dFOVhXMExraXlOUmVKWUlZSFdYd1JDODRYTkdnd2Y5T3h5azFxd3M1?=
 =?utf-8?B?Vzg1QmdzeTdvQmkzeGdtNnpSMUh3QU1uZmlIQlpPckhKYTIxbG1DQy84cEJS?=
 =?utf-8?B?MWFacGo3eGpLOWdSY0p0NFFmLzhjdjlQSGZDMGxpb3o5cHk0SDBGaThuSVBH?=
 =?utf-8?B?VWNHUFpoZGZWd1ZVbGwrakxQS1J1RVhMMzhsQXJqZWhnQWx1VVZ0UHlRN2NS?=
 =?utf-8?B?WnNYNnJJVU1Jd09RNzRTQnpzUGZGRkorL3dVVDkzSVJPVHFnKysvTXc0eVhq?=
 =?utf-8?B?cDhzOStxRGd3clh1ZlFrMjNBdDNWVVBKMUprYXVQNTVCZGw3c3N4V2RIUlNQ?=
 =?utf-8?B?TTdvLzIrTnE3VGVZNWpHUTNOZnA4Qzl0a29KQm9QWUdUT3UvdE1uK1JKLzdP?=
 =?utf-8?B?bVVhU1pHUklWRzYydWVjL3hRMzZ3dkc4Ty9CRk9kM2RNTkx2NHpoT2ZaSVJk?=
 =?utf-8?B?aGRIbDJIcmhFMGxuUjJyY0VBRWlUK2dQc1dYamRmcHFUeEdXOEhPQjMyUGJu?=
 =?utf-8?B?TGhXWXpQSTZoeHFyYVFzS0dMSEZ2aWZETlRHYVRob1dZb2c1ZnZOeGIydkYz?=
 =?utf-8?B?Mk0zcHk1YVErcWJROHpuMyswMmN2WFN6NitFcUJycVFhbThSTEVWZFNtTFp3?=
 =?utf-8?B?R3VGUUtOMXM0RlROdlFZd2cxVGI4dGQ5RFp6d2lYR2VSZVNKR2srcVZpL3Z0?=
 =?utf-8?B?QjcyMENPOU53aWc0UWZpR1JUa2NsR2lNUW9jTERNT1l5NXY4NU1TZHRpbnBC?=
 =?utf-8?B?NjljUlprUWtzaDFndWk3c3A0L3ZJS20wYTBjSFdxaFhCQVhmb1B3QnE0bWV3?=
 =?utf-8?B?eUZiUFdYOFRVYWcyYnJ2RzNsaXhmUkgxZHZ1cVBEbG52YkNhOGdGZ2hEK2ha?=
 =?utf-8?B?SkQraGY5ejFhSWdHaldwa0N2cGFEV3ZkQTRXaERoa2JXWFcyM2pJc2pMc0Mx?=
 =?utf-8?B?Rlg5Rlh3b1BFVFdYN2tqUmRIcUhRS1l2aG5sUEdMakUrYTFZZGtielFwM2dZ?=
 =?utf-8?B?c1gyeUw0a1p0RCtVZUZna29ubzJwVURVVVB4S1owVzF5Tm8xMURmTFFkODQy?=
 =?utf-8?B?WVpjZGE1Qy9Nc0pkL2lxSlJ1bGoyMTk1cmxYTnNWQ3FqUHJVS2NoaWRzQzZX?=
 =?utf-8?B?VkxheUZFUitLaWJEaXVKR254QzdHUVp0ZDBVc1RzUjZwV05DUzBzTWtqK0Nl?=
 =?utf-8?B?emFmUVdtQ1lRTTd0cGtGQ25Qb3pNZTlIbTkwcmdYa0pTdFMwTVRuZDJ0cFdE?=
 =?utf-8?B?aFRrVjBOTUpuc2JBS2ZyWWszWGVtSW5GaFpLZnE5a2xOMjRENzFObUxwdjh3?=
 =?utf-8?B?VnlOZjNCL1kzbGp1cWNXeThaVk1nSlExbTJodDBqU2Jhb2c9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <274EED37B2B0874FA43DC1E3245E1C28@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10454
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	44b3e085-9f55-4341-2ac7-08dd0fb1a037
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|35042699022|30052699003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VkFoaTljVXo0aEcrWkRiaDVxQU5xVWJRMkhROU1YZ3JMdk1RTzJwSkhTU0VJ?=
 =?utf-8?B?SmZVcVVIZVhZcm5oUGxxYU9OSDd5bkRrWkpnVytjTTBkTllVWEMyNGlmV0Qz?=
 =?utf-8?B?ZVpLQTkvU2dIc1ZPMjFhZGl5MnpzSmQ5cS9oOUxJR250eDNKS2NuZ2hLUFBl?=
 =?utf-8?B?SmFNS1BuZzJRNGhsSTdKMmV0SUhXRU5jZkFQdUl1bEdnRTBsSmVMelVtR2NZ?=
 =?utf-8?B?Q0h2WVUvMTZuWU85UzNzb0hnVTNtbVVTUVcwajZ0aWdNRnI2UFlOazd0RDNM?=
 =?utf-8?B?WXBjM0RVYXpCc1dhUWpLU285clYrY2ZzSHBkV2J3UFBlYU5HeEZsckxRWi9u?=
 =?utf-8?B?TG5WdzRvUFRCUUYreDlzSWZPcGVoRWNCY0RUL1M0Q2hwVTJiZnB0NDlpVDla?=
 =?utf-8?B?TE9tUG9ITGRzM2tpQ1drWDNYWDlIUlBnSjZRRkRodVRhVHZUeUVmOFdnQVdD?=
 =?utf-8?B?NWNZM0Z1NGhtT3J4MWVNR1NKL25SSS8xSU9iNkhONVdBam8vTXk1dkxxbVc0?=
 =?utf-8?B?aEhTalpkRlpQeU9vOEtuZEUxenRXWU1NNm9TazVqbjJCajVVZmRQSTNHSFVx?=
 =?utf-8?B?V0hDUU02eGFLT016QUgvbitFaFp6SEdwZitsSFVmU1VkZ0pIU3VBekFvZjRs?=
 =?utf-8?B?cS90TTBpZDk2TzNKZGpOQ3pIT3JEMjl3c1VZY0QyNXJGOXAvbHpBbXZDcS8v?=
 =?utf-8?B?UERVN2g3YkNBTmI0UzVVRks3aDR6Rmx4Q0xmOERkTmNyaFBBbHU2MHRKU25s?=
 =?utf-8?B?cjlDYmV5SFJwc3YwMy9WUDU3TDZCd2JWM1FqajVXZGZMckRWQTBlUWtYRmdH?=
 =?utf-8?B?Qll2QWhLUytkU0ZINk5sK3U0NWJkYngrUm5nYkt4QXVxR0d5VWJMNjNCQ3B0?=
 =?utf-8?B?UFZ3aDBBa2I3SnFZQnVIcC9GNDlueEg4QlNTVmQ1NFR5NG1MV0Z0dmI2c0RF?=
 =?utf-8?B?eUtIVkx0M2VieGNMakFUZHN6NUVqYjIrdFdKN3hDRzlrUVpzcEI1Z2tKc2oy?=
 =?utf-8?B?ZHQ1T2FlamMzNkZJOTdOQzR4aHhrZElUOC95M3d3Z21YMFd4cXM1WDVJRDlE?=
 =?utf-8?B?ZG1sUk1PY1hlMkI4SE1UeXU1VExFYTJwcGFnQkg2QjVIeUoxZzgzN0lscTc2?=
 =?utf-8?B?T0tkcHN0eTlXd1NzV1NEZy9DV3ZTc1NIUGFJZHlFVk43TTd1Ym16TDRRSEtG?=
 =?utf-8?B?WGdTc2g2MWdGOVljeFdEdU90d3NETUN0VkcrMUtCV2FKNmdKKzVwbTNodWQ2?=
 =?utf-8?B?eTJzN1FMV3BjU212RStuVUpjK2MrV2R3TkhialIvNFNOdUdHV3ZpQkZaSUxi?=
 =?utf-8?B?U3pqcElwK3FBcHNXV05jeEMwdXRXbWlPK2dRbkdSVXoydi8xY0VoOVd4R2kw?=
 =?utf-8?B?cEhIUWRpOE1LaW0wMzErczI2aE9kTVFMeU5ncTJDb0VDb1FvQ0paUEt0ZWlX?=
 =?utf-8?B?b1kwcUZDdWIvYkRYTmtzUXdKd21Hbi9td0xBbDIzdThYM0tzcmkwWjFrWTJL?=
 =?utf-8?B?RENLUHBGa3NQQkY2cHlDWGZWV2xTZ2dEVkhNVjJRRVJiUlA2bW41ZmlvV0wy?=
 =?utf-8?B?YTQrbjFYNGNHekU0YWVyOTd1T3ZWaHFSamwra2g3cjAzRnBwTmxBNVltZUgv?=
 =?utf-8?B?eWRWalZjYkFzNXhzS2pSMGFlYzZXU3ZhNDdoaVBVc0FsNnFldXNjZWJwUGJB?=
 =?utf-8?B?L1AxRFBmdEMzUHZyVFpGVGdLeUE5cW50L1RMZjdSS1VjNGYxTWIxTEFrNWI4?=
 =?utf-8?B?SXk0SzNXa0dqYjV2M29ZZkRCa1drL0tFZzh1am4zTElVRWpPdHVKamE3M3NF?=
 =?utf-8?B?TEd5OHIyOU50UXdJQkx0VVd4RnZKTXY3YW4xZmF4OEJDK1o3NmhWNFowUjZ3?=
 =?utf-8?B?OWJjT0k2Q1Q3ajhWTHpoSjhjclZER0VJNW5BTGljM21ScWlXWWRybG54ZndZ?=
 =?utf-8?Q?PdusB5MjPRf7STTSzhAcjHCxrGWAlhJR?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(35042699022)(30052699003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 13:36:25.0984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0756498-424b-42dd-214f-08dd0fb1a794
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 13:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207990

T24gMjcgTm92IDIwMjQsIGF0IDE2OjMzLCBKw7ZyZyBTb21tZXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGpvZXJnLnNvbW1lcj1uYXZpbWF0aXguZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKw7ZyZyBTb21tZXIgPGpvZXJnLnNvbW1lckBuYXZpbWF0
aXguZGU+DQo+IA0KPiBXZSBoYXZlIGEgc3lzdGVtIHdpdGggOTYgQ1BVcyBhbmQgMTI4IGFyZSBu
b3QgdW5jb21tb24uIFRoZSBib3JkZXIgb2YgNjQNCj4gbGltaXRzIHRoZSBudW1iZXIgb2YgcGFy
YWxsZWwgdGFza3MgbWFrZSBvciBuaW5qYSBzcGF3bnMsIGJlY2F1c2UgdGhlIHZhbHVlDQo+IGdv
ZXMgaW50byBgUEFSQUxMRUxfTUFLRSA/PSAiLWogJHtAb2UudXRpbHMuY3B1X2NvdW50KCl9ImAu
IElmIG9ubHkgYSBzaW5nbGUNCj4gcmVjaXBlIGdldHMgYnVpbGQgKGUuZy4gcnVzdCwgZHVlIHRv
IGRlcGVuZGVuY2llcykgdGhpcyBsZWF2ZXMgb25lIHRoaXJkIG9mDQo+IG91ciBDUFVzIGlkbGUu
DQoNCjE5MiBzZWVtcyBsaWtlIGl0IHdhcyBhcmJpdHJhcmlseSBjaG9zZW4gYXMg4oCcbW9yZSB0
aGFuIHlvdXIgY3VycmVudCBzeXN0ZW3igJ06IGlmIHdl4oCZcmUgZG9pbmcgdGhhdCB0aGVuIHdl
IHNob3VsZCBqdXN0IHJlbW92ZSB0aGUgbWF4aW11bSBjYXAgYnkgcmV2ZXJ0aW5nIHRoZSBjb21t
aXQgdGhhdCBhZGRlZCBpdCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNClRoZSBwb2ludCBvZiB0aGUg
ZGVmYXVsdCBpcyB0byBiZSByZWFzb25hYmxlLCBhbmQgaW4gbXkgYmVuY2htYXJraW5nIG9uIGEg
c3lzdGVtIHdpdGggMTI4IGNvcmVzIGdvaW5nIGJleW9uZCA2NCBvbmx5IGdpdmVzIHlvdSBtb3Jl
IGNoYW5jZSBvZiBPT01zLCBJL08gY29udGVudGlvbiwgYW5kIG90aGVyIHVzZXJzIG9mIHRoZSBw
cmVzdW1hYmx5IHNoYXJlZCBtYWNoaW5lIGJlaW5nIGFuZ3J5Lg0KDQpJZiB5b3UgaGF2ZSBhIHBv
d2VyZnVsIHNlcnZlciB0aGF0IG9ubHkgZG9lcyBhIHNpbmdsZSBidWlsZCB0aGVuIHlvdeKAmXJl
IHdlbGNvbWUgdG8gc2V0IFBBUkFMTEVMX01BS0UgPSDigJwtajEyOOKAnSBpbiB5b3VyIGJ1aWxk
IGVudmlyb25tZW50IHRvIHRha2UgZnVsbCBhZHZhbnRhZ2Ugb2YgaXQuDQoNClJvc3M=

