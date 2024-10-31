Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC29D74958
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:47:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.11654.1730378866002005071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 05:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m6tt2Ufm;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m6tt2Ufm;
 spf=pass (domain: arm.com, ip: 40.107.22.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vrC2rD1kIlHN4RDl/56H5ye0ux+juuhvk4JcOHLUH2QR5TOsA4XJMOs3vUDswwBHSZNwbTT4WT06/7zOGjb2dt4t5VJiclhP7o9ERNoZle6EbFN/gSCAQOKGQeKFGmjFCxpl/JfknOuqhwCDhR4TvRXDeCDEl7zzPdPcMo0/HMR6Clyp7wrt+K++/SIMsOuGO/LcLl7omsGj8Pnk6hHruhP00A4rSOEMUo6+s8O6XorVu3ggtghdb1vuNG53Toqn+2n1ZYKzRqx9a3NJ5IYYYtO3pM2SyjHRuAmR9CMmZfjUDbD2t9FnTawLLKOoEkMLmeZ8zf3HZUIgnAL/ydeo4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAVIcsnxpopyiWALxgiT3JILUujSG3MrhOLVYeE665w=;
 b=Mqz5uWPO84V+QpYXc9yNOYYZLEicd9yTnr7ODlTUbwE1TDD6bk8I4Tt5bD3+/iuQseUoTYw3Vpbs69k9WNH9YmUoKmPofghLCNU+Rq1p9Ag6GC95pq2tUxJseo2kTUVomF9gpl6sUBTW59ljp+ujMX7fY1dJ3qpf7p7dAmbJfuv0fxIduc7ndL8MrjfNPNJNFpu8gKl3CaF4Jhg5Vxx0/ay+LVRg3IgrGSUkxftFcpVa2sRIirxlCf1EJJIeWd1ZRX5r1Srv9hEqa4uE+aY7CUllXFG3534+2HGUqA19+856pGepLYtyNWm/3bY6UNfTVHBcFKzhAsx4K1S3pL7l2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAVIcsnxpopyiWALxgiT3JILUujSG3MrhOLVYeE665w=;
 b=m6tt2Ufmq+hvP5YnzBMI/vhf2wHmXLRzsHYvjEr6TsygXwYrprgLRH3RRGYwPaSp4iWXgvnbSkBQh6KrXVvWw9T4QbG/BwPxeb7CnrGByffijhhdW8Swk3l94JxVRoefhlVanm1F6Dm72+uWr7h/2T1DgXpjLolWGBX/A2uSkTM=
Received: from AM6PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::29)
 by GV1PR08MB8476.eurprd08.prod.outlook.com (2603:10a6:150:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Thu, 31 Oct
 2024 12:47:40 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:209:89:cafe::de) by AM6PR10CA0016.outlook.office365.com
 (2603:10a6:209:89::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23 via Frontend
 Transport; Thu, 31 Oct 2024 12:47:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Thu, 31 Oct 2024 12:47:40 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Thu, 31 Oct 2024 12:47:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad32f6582e1f290b
X-TessianGatewayMetadata: L1+/pV2DlwHgGJnYvxXSB7DTwpfnCjuPhX5jFg5QEvTI4+ogqHaLroQoRs7SXkuSShUlsSgal6PFuMxXypf41vujgK1ZY/uEdiFavClE40njhkwY2ecjyzl5GGjjOwnOhZAJtQD32arZT0iTFDsGBE5Nv1IODdlgtIKBI/4OvpY=
X-CR-MTA-TID: 64aa7808
Received: from L4ea0b7248b38.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 02339DD0-8496-4468-9CB1-E63F27F56A6E.1;
	Thu, 31 Oct 2024 12:47:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4ea0b7248b38.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 31 Oct 2024 12:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGL++VZx1erqhAVJJH43eoLWmOxhTkPKVcjIegqe/623x3wMnowjYFRXD3EHygW+HJlPLwCPHrNtAKNOmSNn0WvSsTCrYGMX+lc1Go9YKkOpkyQRJrvH4ly0gsjajVhsjxqUuqqwcW3c6N/jqln94+6XK5sz/WsP80fvCRoQENuBUgpK/ZqEJ+TGaSlfXHjcSbehP9XcFKcLknau6sKTlnBR2iOnWwuDypqU8d4sbfZyULqQXcSlEHZEK32mh6sVubgp6CeXGZT0+PxnvB7iic9SNMV71/+HHSdtXopIYIRlJtY1YKEb6q/DwLkuazDvLVIWx5oFqk/V2hCz8CdJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAVIcsnxpopyiWALxgiT3JILUujSG3MrhOLVYeE665w=;
 b=V24zaDxkNmjJf2TvQVW65mBdDGDLgEKSmP3lyNejTgGHRib2EiYTWUzqe55qO5FTTXj6BzgmTuPpGHfwrm3mr9Or2adN4YqQDomlq/ZFIAsUnO0xvl1uAqlgAoKHiewUq5BCZP4ypVqaWaa2tPGkNbFM1H5gvsQRppBST39H8y8LoCO/qGfroL8FQw9BqGmRi4ItPQub01o3OofmX2QxTWp9HWewtvIOGOU2fk/0pf5QjhWwtT1KMsAq6xJermYxBF2Q9/6ij2Ck31t0iVFov7gW+TUotBan2XFTnwrmAi6jlZQGYE8h/LcIm5bfnI+gOZS4qZmQ+kUIV4EVSZs2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAVIcsnxpopyiWALxgiT3JILUujSG3MrhOLVYeE665w=;
 b=m6tt2Ufmq+hvP5YnzBMI/vhf2wHmXLRzsHYvjEr6TsygXwYrprgLRH3RRGYwPaSp4iWXgvnbSkBQh6KrXVvWw9T4QbG/BwPxeb7CnrGByffijhhdW8Swk3l94JxVRoefhlVanm1F6Dm72+uWr7h/2T1DgXpjLolWGBX/A2uSkTM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7378.eurprd08.prod.outlook.com (2603:10a6:150:22::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 12:47:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 12:47:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/package: cleanup objdump invocation when
 scanning for library dependencies
Thread-Topic: [OE-core] [PATCH] lib/package: cleanup objdump invocation when
 scanning for library dependencies
Thread-Index: AQHbKh3YwOWPpIHc1ESsUr2iPf+OzbKfCtKAgAHG/gA=
Date: Thu, 31 Oct 2024 12:47:31 +0000
Message-ID: <134B7E73-C54B-4C22-A187-181C77F2D166@arm.com>
References: <20241029161548.2662190-1-ross.burton@arm.com>
 <ZyH-q9xosoqu6FIp@bootlin-mathieu>
In-Reply-To: <ZyH-q9xosoqu6FIp@bootlin-mathieu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7378:EE_|AMS1EPF0000004E:EE_|GV1PR08MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db2ce69-3f31-4bf3-a295-08dcf9aa34a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S3J3WUxsME5ka09yQTE0dGJoL00rWi9Gb0JnMW8yUFA3OElEelpwL3BGb2Zx?=
 =?utf-8?B?SjRLZDU0bHhuRExzNndYRndacXhsUkVYNHNSc20wN3ZzQklCYlgyYVBHb3gv?=
 =?utf-8?B?MXNCR3VpNjNKeGRCMGs5STlnTkFwd08xQVRuN1RTOWVqdklmSnFjTnl5eGt1?=
 =?utf-8?B?YmxSYXFBTWZzZTllR2c1Kzg0VWxKQ3BQaFlZaUI3RGJYczJxalE1bnM3Z0NY?=
 =?utf-8?B?cnEzZDBlZzJXS2lNcW15SWlZRHBlbmtVUlNxcUZSOXBVS0ZqR2ZNZ0lBUGN1?=
 =?utf-8?B?VlFSbHlDWEtDV1JNUnNpRG9IUE5Gd3czcHRCSUQwdUFFV3RFSElyQkhlV3pt?=
 =?utf-8?B?ZWpTamJETjdNM0ROdEdRVjNXdWFpZzJjN00vNVluTXozTEJ1WVdCcFo2cStB?=
 =?utf-8?B?dnZPN09oREtJTm5EVkI0L1JJSEhaQmpuRHkycHF4ZTlzcFM2UkVmcXNLaVRY?=
 =?utf-8?B?dUVGaTA4WGN1aXNMRVlha0R4U3ZxZlEwMG40WXRjdUxHbDlYM2hOVlZGYXZE?=
 =?utf-8?B?OENST0VQMStTN1IyVjJodENSMk9xNysrM2JMWW9kc2pmN3dyTStpTkpQc080?=
 =?utf-8?B?ajF2ckRUQ3lCMFRFNjV4VktHM20vYXVaUFlXYzl2aUVmVjhyQ1MvcGVkQzBO?=
 =?utf-8?B?SzFGYmFLZEJ3bVJpZE5kU0owV3YyYjVaL0JvcGxtZklLR0hJUnNXUmxETU1O?=
 =?utf-8?B?K2hhYlRIUHNYQWtPcWV3Sm5JbHF5TTNkM1AxSkV4SXFPSjFwRnlTazd0YnVm?=
 =?utf-8?B?SXozZlJaRjY5b1VDcHZBNGk0T0ZLSklWNEtXZEpnUWQwRFdLbFI5akNRaG5n?=
 =?utf-8?B?V0Z1NkY1cWVvNERmUDhSbmtwaUw0MkV4QWpJU2lsUHRvTnEzc3B2aXNtMyt1?=
 =?utf-8?B?L0padDYxa01xWUlUaTlLcENVL3BNWC9Ib1BvdzlVb0IzUGE3R2sxeFZDQWZC?=
 =?utf-8?B?eFJJNERGWU1UQ3UzSklibjZ2d2hvdnpmeWlPeS9nVEtZeGszSExnZnFRamtO?=
 =?utf-8?B?SnBlTWRVN1JIdW5rLzI3cVRRU3FnV2NQVUUvd3ZIQWwyMUJPL0VzdXZ0SHJD?=
 =?utf-8?B?a1dIbjlwZzRDSDU3S3QvcDUwMG8veHJ4MzYrcGxTc2ZNQjlqNkRKZEtDUGQr?=
 =?utf-8?B?MS83MWdzcGw5c3hPZkFVZVdxamJIK1RTcmNVcHdrelEvVTZqTEQyQmFCaFQ5?=
 =?utf-8?B?cEp2bEJNNUt5Z3VPSFE4bVNMdlA2eXUrdHRJQlVpZzA1VFBpeHMzWnVFREhv?=
 =?utf-8?B?L3k4MXhPY0VFcElMU29lQU01KzY4dG52YmF6U25ZMU8rVmpCWXF1N3M2VWtS?=
 =?utf-8?B?SXBEVzdqQU9XUDFQQzJJRTE5WnphdjB1RXlCMmJBY3BPc05paTZZaEZLRUpw?=
 =?utf-8?B?STdKaTg1b3ZYVjNvYWJWeHkxTFVmVTFzbXpjWVVKaVdtZFVUckR3c05BbFpS?=
 =?utf-8?B?dWVXZ21VeTIrUGNDR0RFenFyRFd2eHdPd0RuL0pMQ2l3OWxtZmRzdjZGeGZN?=
 =?utf-8?B?Q28wVjdXTmtFTHpON2hDTUJZZktPTlcyOE13Z2ludUl1Q281VWM1cUhMQlNM?=
 =?utf-8?B?NXk2Zkg4N3ZmTlVEMEJtT01Va20xTVNtZ2N2SzJoWkVQaDRkRmovV0MwQnRZ?=
 =?utf-8?B?b2htZ0Y1WjYvbFlabEo4ckV3K3NQK3MraWJWQ205b3hveDh2d2NjdjB6OW91?=
 =?utf-8?B?Q0JENW9SMVZ1MFh6ZStyMllTZXJXeW5uUjFQODlPYjlBZmpBbXZjbkJoaE9u?=
 =?utf-8?B?ZUVoU2ZkTHZGVENJUVZnZDBEc1ozTWVkSE83MWZ4OG9HQUIyYnBWbzZZZURH?=
 =?utf-8?Q?uR1wOeBoQOY2y6KKXIZR1QgQNsS6t3J1wz7HE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <95780708347FB843A6C44C167030CE0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7378
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	93cd4f7d-e7f7-481d-1886-08dcf9aa2f3f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RWkzNHhWYlAyOFFPWmdxaHQzcTM0VElUR0YzRmJLdDNSSEQ0aXYzYms3cVUy?=
 =?utf-8?B?SFM1L2crTnV1WUsvUVNSa0kyOFRQdlRYblBYL3lXSVVWTVV2VklHREtBYzVo?=
 =?utf-8?B?UDFzWDQzTHNvNUYyL3Z0cDArZVhIMWROMExwNUJ3eFpONlVNbWdYYzdwTkZL?=
 =?utf-8?B?aVVnMU5WS05rSHQyL1ZJYWsxNis2elJWeWVWVmgyZ0h4TERhQStNQ1ptNktF?=
 =?utf-8?B?MzM0cDJXbzAxVTVIbFhONlE3UmZKUUtHaHY4bisrYXR3aFkwbzZnVDFGNHht?=
 =?utf-8?B?ZlA2TW1lUms5aTh1bGRKcFYvYUI5ZEk2ODZ0VEhrNGJOdnJxYk9QR015VFJR?=
 =?utf-8?B?RFpyeUtPaFFWTUNVZEtwd3BuU3FkSjlvcVNoRTdwR3RLbEc5WlZkVkRPeWZ1?=
 =?utf-8?B?aFFndGo4K202WlA4bFRtNFY1VEpXSitFU1A2L1htMDJVdkNsSUhhSlhqc1h0?=
 =?utf-8?B?b0ZTaFUvYlhQcjBYa0dSdzFuT3AvY1NGSFd2d3UzRVY2eTMra21rd1QzSW82?=
 =?utf-8?B?Q0M2Y1Y4b25kQ0tpZUZYay9ZeVpvZ3NwNFBhd0Fwamg4Z2xqUy84SjRpbnhn?=
 =?utf-8?B?TmVrMTFMVlgxSFVpVHpnNmxPbktIWnNnSWRGT0ROdE9DaTJWOEdSWWJqOW1k?=
 =?utf-8?B?UzRUZTMvb3BNdnUvTEpKWWwzQi93Q3EzVEh0MmllcG8vVTF2SGpIYjRqaXd3?=
 =?utf-8?B?anMxaUd2U01uWUxCVS9hYTAvK0o0TlNTMTl2azR5YVFNaWdUSHVlNHU2SGpu?=
 =?utf-8?B?TzFQcUdjSzhDQzdmSlRpWHFNbFZ0OWxHRmx1d2hsVHZ1bThzOFM5U2xuRThF?=
 =?utf-8?B?SER6bml2aXV1RjRKUEdGNmZEUUJiV2JoaEZPdWxiN2M4bll4QWJ5Sks0SlRt?=
 =?utf-8?B?UW5FV3lDY2k3R2R4T3pYSlB5Nm82ZTh2a014eUl2RGw1NDhFalpGRzBZMmFB?=
 =?utf-8?B?VFhKREtiaDZDRUFhREVpN2F3RVQ3WnpJWThJWWV5NFVOUGhhS1plZlV3MnVZ?=
 =?utf-8?B?VlJNTmNKRk1MNXowODdiczNjQUV1cnkva0JOL3EraFRNd3RBazQxQXhXVVQz?=
 =?utf-8?B?Z1l0Y29CUWpVNWdxUnR6aXVDd0lpNjRpMG55Qko3cXljcjU4SUNnYnlDT296?=
 =?utf-8?B?K3NIRzZyUWpsV0gzbmhVL2hkSjVjSkExZHFPam5Lc1VBWlI1NGd3cUMzRjNr?=
 =?utf-8?B?b1NuQ0M1WWUyL1lWZ0RkRUFJVXZJQ1lLb3M2cVdRUGxKQlBxSGhkMm01WnNP?=
 =?utf-8?B?SFI0UFBQbmVZRE1zam1rMHRYM3BVeTByOUtvc1VkYXBvZERLTUIvSlV2Ymoy?=
 =?utf-8?B?dFd5M09vaUN3R0c1aWdqazdpTFFXOTJBdmp6RFkzaENPR2w4TTdRY3lrS2lR?=
 =?utf-8?B?UUxPSmg3cnVlbDFjcHAyc1ZVSW5hYThuR01TMjhrWVBjZWxFZTRXdFkva3Vr?=
 =?utf-8?B?Q3RPTzQrblVZREE3bENWbG5OVVBrbFZWWDJyQzdFRnh4ZG1NSkZQWE14YWsv?=
 =?utf-8?B?VDkxR3dFbFlvNCs5UXlEL2VDTy9sSUtyQXlnRnFvVWpXV2ZyTEpTY0RDNWhF?=
 =?utf-8?B?WjcrbHB6eTJadURGWFY0MEpUQVp2emY3VHBsZ0dpWk1pVXM5YzB5MXV2WWVG?=
 =?utf-8?B?MW1HcXVMUldPTy91aGgvNUFjK20vNWl2a1JnckNKWmt4eTQxc0hVTUo5SE9X?=
 =?utf-8?B?UW5RVU9qTXlEckY3OVNCb1JKeUp5bmxtMG4weFgxTWhDVlVwVENGelU2Wm50?=
 =?utf-8?B?K0xCeXFKcXMxd3hmdTF3SkpXbkd2U2MwZWU2bGYrMUtMVUR5RDdnWmVNWUxj?=
 =?utf-8?B?T0l5djBuVUF3dktBbjYraUtFeTZnZGdHM3V5UUpkTHpTUWI1VWFuc1FPeE1a?=
 =?utf-8?B?cmcwbmR2VVJhdWxkMnBxeVMzeW1vWkxhV3F6T0Q0a2ZkYlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 12:47:40.2325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db2ce69-3f31-4bf3-a295-08dcf9aa34a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8476
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 12:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206582

T24gMzAgT2N0IDIwMjQsIGF0IDA5OjM4LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE9jdCAyOSwg
MjAyNCBhdCAwNDoxNTo0OFBNICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4+IEluc3RlYWQg
b2YgdXNpbmcgb3MucG9wZW4oKSBkaXJlY3RseSwgYW5kIHBhc3NpbmcgYSBzdHJpbmcgdGhlbiBo
YXZpbmcNCj4+IHRvIHF1b3RlIHRoZSBhcmd1bWVudHMsIHVzZSBzdWJwcm9jZXNzLnJ1bigpIGFu
ZCBwYXNzIGEgbGlzdCBvZiBhcmd1bWVudHMuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4gLS0tDQo+IA0KPiBIaSBSb3NzLA0KPiAN
Cj4gSXQgc2VlbXMgdGhpcyBicmVha3MgYSBsb3Qgb2YgdGhpbmdzIG9uIHRoZSBhdXRvYnVpbGRl
ciwgSSBnZXQgbG90IG9mDQo+IGZhaWxzIGxpa2U6DQo+IEZpbGVOb3RGb3VuZEVycm9yOiBbRXJy
bm8gMl0gTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeToNCj4gJ3g4Nl82NC1wb2t5LWxpbnV4LW9i
amR1bXDigJkNCg0KVGhpcyBpcyBmdW46IHRoZSBvbGQgY29kZSBzaWxlbnRseSBpZ25vcmVkIHRo
ZSBjYXNlIHdoZW4gaXQgd2FzIG1lYW50IHRvIGJlIHJ1bm5pbmcgb2JqZHVtcCBvbiBiaW5hcmll
cyBidXQgb2JqZHVtcCBpcyBub3QgaW4gdGhlIHN5c3Jvb3QuIEZvciBleGFtcGxlLCBxZW11d3Jh
cHBlciBoYXMgSU5ISUJJVF9ERUZBVUxUX0RFUFMgc28gbm8gYmludXRpbHMsIGJ1dCB0aGUgcGFj
a2FnaW5nIGNvZGUgdHJpZXMgdG8gcnVuIG9iamNvcHkgb24gZXZlcnl0aGluZyBleGVjdXRhYmxl
IHN0aWxsLg0KDQpJ4oCZbGwgYWRkIG1vcmUgZXJyb3IgaGFuZGxpbmcgcGF0aHMuDQoNClJvc3M=

