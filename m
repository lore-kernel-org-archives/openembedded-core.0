Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8637CC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:38:59 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.84])
 by mx.groups.io with SMTP id smtpd.web10.22740.1747917531525808209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DGOS6w0b;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DGOS6w0b;
 spf=pass (domain: arm.com, ip: 40.107.241.84, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U4RE/XRASU0U4oVRtTBeU4PCvqPIzMnCt/aicaZcrKp3qnStxcA2AiAUI6kO1VSqKruLo5wHGePQzM4KuUlKiN33VI5S7v0r2tdYOn4e5TD0jaKA4Wct4XGWy1VTiBfYggC9RRl/tF+0y52YDIHud3offpVsfXsqUzJE2U4Q5DCZhrygIRqJkuYQNF7PZspZphuKrlm3wdKnQaPIlWfgHZCJ1m3L1FV9pIhVbFYTPFP7tr9brvmykgr4uJEHdw+ySIoTAfk2mIgEp8NEXhPC0mnivLPGC+8Geeo8HJcBoLSd/g7H293xIOAdhGU2uZysr6zNzxE6tuPd1edrjZCCAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekGGODcunodlS/uj28ezXjsA63YLsAlst9BsoJUPD0c=;
 b=RKgYK9+OLU+/jFx1cRzavq2vTFqZCTmmgAGKvzApb8EsdxJhG3RLKJ6/pEMXNI8UndGvwuS7IqvOYJeFaf/BtWPeDijhCokffI2rSTrFhFu1GdIhPgT+mSnS+UWdeWIttYF+WclG6Yf7R3ZKT9fcJd63JbA/I89qqeqS/lW/PXYkOUzivF6ZBOIcj496rokSKowVkET51nLPz39oLdOAmHtQySXauLkg2WR3o6+jAcH5wlxZkREBwujzMsl3UBOTW2Rixh27iNgsuONRyKC6oJYkpMyLUpmKXgj1oOa2mFE8zgtusWftN7f3jx7Q5JUBbs3hKSj1uFPcJu/makboGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekGGODcunodlS/uj28ezXjsA63YLsAlst9BsoJUPD0c=;
 b=DGOS6w0bDqJqczgEAGVHl4xSnpoPSTbKsNYBZr143vfWt3samKfgA4XJTfJEQP0XHEJ2rEneNKgyILbb2K5mv7hfZv8fPD2VKRua7UxQLjcMGnaJjyKXto4cXVvYD19MH6QX+2RwgzTQkC+GtrVtBmsHXDeAcXa8L/m2brKex+c=
Received: from DB8PR06CA0056.eurprd06.prod.outlook.com (2603:10a6:10:120::30)
 by DB9PR08MB8628.eurprd08.prod.outlook.com (2603:10a6:10:3d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:38:45 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::b6) by DB8PR06CA0056.outlook.office365.com
 (2603:10a6:10:120::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Thu,
 22 May 2025 12:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 12:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4U0+BsFXzvOcKWi/saQsgTqCP8Hpi5k5ifwtFoMD0gJL/A7eEz99RAmrTLkE0CpzqCZ6Rn1g1cDT3xlQK/pjMt9aDosrJesnLReiDmmTCdBvgwMEGnNm/bm6pbtjagl+7uvq/c2rMogJeOICoOPp/h/quACg3Mut6DQpWIR3NjQd4M7yKJjHisqH9UiOW1HUbIp474lWKnUdiAWykscObiWvdRDEIJJdg4abE0XFbLxRLPAul4kK20zW1gpChZPcuxZbPCLVMjK9BCv3C6dYhY7P4VUOKeY3FGj4sGfDnM3dNXAy9jziDJXLwydlGpAKZYKJKRyZIhFLzE5ZeywHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekGGODcunodlS/uj28ezXjsA63YLsAlst9BsoJUPD0c=;
 b=dHPEoiHlwWlRjji5eDkLIqWl4tb2X67LsslmU3evGAbLtb1RIz5Tv+6zyxbu6MwnEvxXaE7/JO4HCKORPqsvv7MMxeYV3tjfQv3TQ8Jf0tXYoyYid5tzl0NX+Cqq7jpqrBu9JMHKjMnSBQoq9WW1lUZC/hy61r8xRWkYtjQUsFVDqWLr+pajRh2rnnjT0Df6pdYq0SfDTWbEu8W2Nb4jfAAIEB0NmI+da9d1PPuOsaVDVJMTGspKg6aXrqG55cY0GvrPhbFdmNmTtF+dmjS61C4lD9Ej0/jeYSeZx+VkCtWTiT9OjBg7o2wEDBGlyj2jz4MfAfnIUB/Mr/mw3CAZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekGGODcunodlS/uj28ezXjsA63YLsAlst9BsoJUPD0c=;
 b=DGOS6w0bDqJqczgEAGVHl4xSnpoPSTbKsNYBZr143vfWt3samKfgA4XJTfJEQP0XHEJ2rEneNKgyILbb2K5mv7hfZv8fPD2VKRua7UxQLjcMGnaJjyKXto4cXVvYD19MH6QX+2RwgzTQkC+GtrVtBmsHXDeAcXa8L/m2brKex+c=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:38:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 12:38:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] rust: consolidate rust-llvm dependencies
Thread-Topic: [OE-core] [PATCH 2/3] rust: consolidate rust-llvm dependencies
Thread-Index: AQHbyoS0jDgqXAx2iUKl52xqt02VkLPelT8AgAACbYA=
Date: Thu, 22 May 2025 12:38:11 +0000
Message-ID: <883DBDE8-DEA4-4A97-B450-27FF5098ACF9@arm.com>
References: <20250521191449.1486927-1-ross.burton@arm.com>
 <20250521191449.1486927-2-ross.burton@arm.com>
 <001eb60e-fbb0-43ad-92aa-8f47dc32ef32@cherry.de>
In-Reply-To: <001eb60e-fbb0-43ad-92aa-8f47dc32ef32@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5767:EE_|DB1PEPF0003922E:EE_|DB9PR08MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 687ee4f0-e986-4270-ec1d-08dd992d96fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NzlzRnZxUzFzbEVySkN0cE44YzFUajBMQU80ckovYVFxcitQd2VNRytHNmE0?=
 =?utf-8?B?SEdxYS93R0dWRm80TWlsYk85L2VmZE43VVp2Z0RDRjRSdVhnL2lSMngyb2dH?=
 =?utf-8?B?S0hTZVJodGVoSjJRMUFRRDE0NkFuVFRmaVFBRzJob0hET2JPUUhyM3hOMGpj?=
 =?utf-8?B?ZkFhYWQyVG56OUM5ZTdxTTBoanhvU2hxeVE1QWsxaU9PNVpqd3RzQUE3VDhm?=
 =?utf-8?B?VWdBNzNRQWJ0YlNhNWZUQm5Qb3hIUGJ6RXFFNEhHaFJZOXNMVHFKU1B3d0JB?=
 =?utf-8?B?RVJWZmtPZXBkWnl0TzVOUWJDZFQ2MjFhUVpyTi81bTlzUi90bWk2c1VCTytw?=
 =?utf-8?B?d1ZjVGIvU3dpNEdFbDBoRDhzVGhDSGpCelhoTFBQdDMzK0N2T2dVMmtKNkMv?=
 =?utf-8?B?LytzVXd4T2RWaDUzaTZ5aW1TUmpBbWRHMHllZUhaQXpwNjV5V2NGWmg2amZM?=
 =?utf-8?B?RkFhL2s0bFNuSXNXQUkrQ0d0WkNQODB1MGJnOVFiYXVxS3pqOVFlSUd6RTBO?=
 =?utf-8?B?Z25VL3ZkN0liYkVyVE1ZYmM4VjZOK3l0U0srMjdpczQ3a3FWUW9VZlZTb0dP?=
 =?utf-8?B?czVkanlBVnVIcityckl3VHZqVmwzK1p0Y0hYMThVM2MvZDM0UzZ0NVQxanI2?=
 =?utf-8?B?WldIdjRsWm9zaUVmbUZvN3VwUENiUWhzeFpDVVpkY2drRVNIWGI2VUFTcWl5?=
 =?utf-8?B?REVQMktMRUJYMHBTQys4dm91QmMyY2VsdHlVN0NPais3M21ZQlRhazl3a3N4?=
 =?utf-8?B?UEpqN3c4MC9lKyt0MGM3a3BxM3BFTVB1VnB6aXI0a04zRG9ZU2pmcExTK1dj?=
 =?utf-8?B?Mkx0VlJSVXdZYzNmT1ZwSzZocmEzVzRqVnhvdk1OVmhtTjlIUkVadmlHT1ZS?=
 =?utf-8?B?SHVtY3grV3U5Uk4rV1lpa0tPYkk5MENmdVJhN2FQTFZtS01kQlhIV3hUajBo?=
 =?utf-8?B?cnpXaWkwbSs1QjJVOGh0RERsOGtaK2wvR0dmQ1lTcEFnTW14U0tLSGY1d0VW?=
 =?utf-8?B?TnN5SnYvZEZoSmFWT1BnWHlra051Y3gwZ1VnUTBvZXIzckk1R0RrNVZtdjc2?=
 =?utf-8?B?OWNpUWZWWXpCQzJkTzZySDFEeUtVdDVoYjBnSUlKWXcrNVJrREZxelBkV2t3?=
 =?utf-8?B?ZUhvNGtieUhLendHUlIwUm00akF3ekdkRUpXdm9DQTJjWnljbjB5UEw3VSsz?=
 =?utf-8?B?dEsrN2FIdFJmZGhtMVBFaGNRdk1MZkJnR05pUUp1T0VrOXBSeFRkeSs2blpq?=
 =?utf-8?B?clBTcjB0andsUkZoa3ErQUREVWJtZ2VMVEtMbG5aa012NTJITVpKeWNweWh5?=
 =?utf-8?B?Y2hBUEZyUlBQRTRKRGxvcnZEaEpraFl0ZDhZTHUwUHVERFFhbzZFeTFFaVA5?=
 =?utf-8?B?OWdNS1dQU2g3QlZXSG9VZ1VYaFJOc1Z0TEtkM3VYcUcrQ2huMDdxVXNVYU9R?=
 =?utf-8?B?eEg5WjFQM29KL0xYQ1JrUlRUUFJ6dk1Ub0hFRFRIZ3IyWDdXT28xdTh6Zjd4?=
 =?utf-8?B?L0FqZ3ZaZ29KOHQ3RnhETnB3c3RFUDU3cCtRRzFBUEhQVXlQbzZTN2VmTHZw?=
 =?utf-8?B?anBKazRrSHR4NVRtdVFFb0dWNmoyVThseFdIWFdIZm9YbkxvZFJ1NW9yaE9K?=
 =?utf-8?B?eWJkVVdUcm4xM3JhU2M3TVdwNUZObXJkV2ptMlVQZTNldkJWT1oxYjJmbzdk?=
 =?utf-8?B?MFdUbFpJRWFUUEpkWmR2eEZ6aXM2Vm00QUp5aFhWNjNzN2ZDaCt3K1pTSkEy?=
 =?utf-8?B?eFZKd2N5RCs1SkpCSys0TEFHMXp2aDQyL0I5MXFwMVpYbVpiZGtmbE93ZW40?=
 =?utf-8?B?cHpQcGpkTTZvMUtYSWRiZTQ2SEE1WHlzVjdST2owNzFURnhQc29pRWZhMjAw?=
 =?utf-8?B?eU9oYkZrZFU3SFRkLzFtd2tlemRTOGpiWWJFMW1TakFiV2VRcmYwNDNOajVn?=
 =?utf-8?B?cElOMnVzbW1ycnVXMXZRd0ZLeUxXK3dqUlJscURRQ2xYRDRBL3lJSnlGYm54?=
 =?utf-8?Q?f3PmU4m6Zvs1kjtepPeZazVh3NKAq4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <666752359ED63246BB401D224C7900BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	632bba9c-607c-4f36-31a6-08dd992d8369
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|376014|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHRVUGVjN1VHd202SStnUlhUVklnN3NxbVlhMldKa28weCtHVVpLNnZPVXVN?=
 =?utf-8?B?WXd5dHZmQzdjS1BUWmhlMWsyOUFzL0xSbUpzamZSNUVaT3dDUml3Rjc0SDFQ?=
 =?utf-8?B?T3pjTHMzMG83ZDcwOENYd09LcWZxWGZmYXJyT1lHS3RTbFJ4VytLbEpCZUZq?=
 =?utf-8?B?bjhRdmM1UXRvc2RodWlWWUZKaVJ6T2NqN21kbVIva1ZjTDVES1ZjZStPUWxP?=
 =?utf-8?B?NHU5RExlR1BkYTc5SENFMFN0c2F1MjVxSzNESmNaTlBRbEk5V2tVRDFHZHZ5?=
 =?utf-8?B?VGhzMHJRZHFxaUJBc2NnU0M4MDAzb01XRjYxUjBHRTBIWnFIOXFwaXhUbnhX?=
 =?utf-8?B?QXRTN3o2c0JzVWNKVXFTVW1FNXM4eWprSmtHd0VNdzNqR0wyYXNuRE5KTGQy?=
 =?utf-8?B?OGZ4ZGd3K20yS0RFYkZXS3NsUklSVnJNTHhrQXVQR1dVcTNoTnB5aXE3VDZP?=
 =?utf-8?B?ZHZlR0g5R2IxMHZINVp6Zk1SdE02OXZyaGlVN0czVHZkczZyVnpWUTgrc0lZ?=
 =?utf-8?B?S3ZkZUkvaXlvQndYellEbC9taXJibVYzN3dMdHhLbDlXVVZwcEw4VUxVb3Ev?=
 =?utf-8?B?MVdDSXNHcDhWYktzUkhjd3BpUHlzbVRCRzJsSXNhV0FWNExTZE5wSXkrM0ZI?=
 =?utf-8?B?L2F2ZEU0a1pwQ1lDWmdXcm9zWWZjdjNPbnRKcWZBNlY1bDB6aXR2bDd5aUp3?=
 =?utf-8?B?TUF5UnU3R2pYNlUzS1ZHY0U4ZEN1VzBvYWxIN0c5ZWlBMlhqR1pCVlVjQTNK?=
 =?utf-8?B?WGl2dE9keFNyY2VQNkdMT0xNNktaekZBeFBqUlZ5a1FrMDdRN3RRSFJNTmpm?=
 =?utf-8?B?ZzhvRHpoejFNVkc2enZFelpsdDEyZnVLZ1lJeFFLUGNFYUNjeEtMWWxDOU9u?=
 =?utf-8?B?ODRsS2hicENwT3R0UlJsZ3NTRklaSm5pVkRiRy82dHhVWUJscVFNeFpWaWtw?=
 =?utf-8?B?aEFtMVdXUEJ2SFNESlAvNXZ3Vkc3UWdhZnpVdGhSYjNINk5KUDNKMjNDVHk5?=
 =?utf-8?B?OVM2YUNZN09sYS9JcEY3SzE5bVZLRHpzc1UyRDlNcGpRT0JOV3hpZXovTVZ4?=
 =?utf-8?B?T3FHSFpXNUJ0MW9SQzNJdkxHSk9MSmVxZE5tK3N4RTVvcXFDK3lTU25pclZH?=
 =?utf-8?B?bVUvVVBsbUY4andNTXhXL0JwNldIeEFxQTV6UzM3S1JTNGdmd2R4Sm8yYzNW?=
 =?utf-8?B?cVVtaGlQTUZKT0JGZHJ5M3VMRWhnUHlLRjk3VFFyNUVJNWcvV3luRUUyYzlE?=
 =?utf-8?B?QzdJVWpBYnROci9HZVJzUDBFUnozUW9zKzE5S2oyRnFKZWNQdy9qalJUYUNx?=
 =?utf-8?B?TVcxVzBuTzQzRnJjSFpFL005NUVYYnZabGs1d0tIVjlpUXhXcUhJZllGVXg5?=
 =?utf-8?B?V212R2RtM3VoVXhZVm5JcFlvSkdseE1SZnBDbnViVXVFY1NxSUpXUXU0WVV6?=
 =?utf-8?B?Mjhva21tMHNCa2cwVEEzWUV0U2hZc3ROK0ZkQk1Cakx1bjBvUkV4SEN4ZnZs?=
 =?utf-8?B?aTRqZnJrdWlHODRkQXlJMEk3ck10OFNGVnFLMXgwbTZaMTFFU1EwdTV6cm9U?=
 =?utf-8?B?NE9kUWtGU1ViSHptQTZKSVNyTnBKejlSSzlwZ28yZGVpenM2VmJ1VGdvRDJQ?=
 =?utf-8?B?NWtwRkdIQ2hON0Fjb29oMDZzSjRCbm9rckF6aFEycjd0bXRETjlCUE85NEJu?=
 =?utf-8?B?NDg3YkEzUWRjcDhhMEM2WXh4RWxUdWd3aDhlYzFkcmZLcWh6aUZObXkzSFdZ?=
 =?utf-8?B?Nm5oRjlkWHdkNVFtWjhUV2FLZy9UMTR6YVZSaHB6MVFJZVBVQVAvSFRBbURm?=
 =?utf-8?B?K1VjMnkzSU9CRkVpMGpqUG1ZNjNNRmNjQ0J3WmR0SUVsSC9UcFE3QzNzRGh5?=
 =?utf-8?B?WXBldVNoQm9RRnNMTFZJcGc2ZVNCT1lHclhXSFZiUERJOHJtd0VKajNQMHNv?=
 =?utf-8?B?cEV1OWt2VmFrSEpYOHFscFZpMUVIemlxSkh5MlZJd1UybVhnT0owVVVWK0Vo?=
 =?utf-8?B?dW5sUXJ0Wjl4ZXZhS3RoM3g2UmVkS2s5R3ZsZ2RnR05qNjZFRklISWE2RFNE?=
 =?utf-8?Q?ANrtxX?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:38:44.1663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 687ee4f0-e986-4270-ec1d-08dd992d96fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217101

T24gMjIgTWF5IDIwMjUsIGF0IDEzOjI5LCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4gV2UgZG8gbG9zZSB0aGUgZm9yY2UgdmVyc2lvbiBkZXBlbmRl
bmN5IGhlcmUsIHdvdWxkIHRoYXQgYmUgYW4gaXNzdWU/DQoNCklmIHlvdSBjYW4gcG9pbnQgbWUg
YXQgdGhlIGNvZGUgdGhhdCBhY3R1YWxseSBjaGVja3MgdGhlIHZlcnNpb25zIG9mIERFUEVORFMg
dGhlbiB0aGF0IHdvdWxkIGJlIGdyZWF0Lg0KDQpNeSB1bmRlcnN0YW5kIGlzIHRoYXQgdGhleeKA
mXJlIHBhcnNlZCwgYnV0IG5ldmVyIGhhbmRsZWQuDQoNClJvc3M=

