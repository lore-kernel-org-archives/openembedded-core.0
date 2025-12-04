Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C09D29FAE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:37:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51104.1764873420471952875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZhQhrSPd;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZhQhrSPd;
 spf=pass (domain: arm.com, ip: 52.101.65.30, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GIdbq0xhcMTMLARD6FYHR7zo3EztjbaJ1k28ZCIj1b8iCOY9t5b0MTKm6iu5/0TohNQE55MMoQg+7rn/e1e6MgGNoGsF/WeAqy1jVQL/mpelVOEinZ1270BD6fLgAH2sl7VGA8Znb016V0OQ0IgLE+yg0DZQfRfx/xPg8aArtW6ncME6IUww7pyFJtMxqtqYvwGDwG76+nFKfJK/NZeFeUjSoIKRiJo/30X9dzPmGp1rQgpI+DDL73Rmd3pLeMATArtyMTf65uSY2uKJ0vOHln8v7sRg3S3iHoYcBFC9IEljJTfamjizAVq3fXiEgO/w2ZYmU/mxrxoeMP4EAs7Wzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKKuCzzXv+YLEORJ0i+LM2O7WshEShQ21xLbCqysAGs=;
 b=tEzhwsckieM34gRRwDVOJlakhg6BrkW5qkRlJq+OUe7OkBGxZ4YAzcr7O/2QUM+PMul77504VC7p3BehXFJccuWXIR2Q98T9wXfX5awm3w1lGeKmsnJ/JFiQa6eUxoqxwCivZdTa5kmVvGT7uoIbDaDWlnVoYN2vQdmeSImDHYSl0y8mKpPtkXnefaOtH//mi9zz0Oc5x355aA4oIdLo7XQ6yUl+1e9vTsr7yDbdNQ04iXemzxM11iW2kxX1vjN586VuQHuCHQWaHfZog13dF60JfxI9QCxXPXIzpsGwCeynK0pj7vIOdQn7XR0l9ODZi8TadXbP0M8owKN5jszZsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKKuCzzXv+YLEORJ0i+LM2O7WshEShQ21xLbCqysAGs=;
 b=ZhQhrSPd4g+HyozA1asQTNrxKsQTrqFQy1goIozyWbqdBELuCTzVfOsmlBx5OjHzwY6N8tJyNz/h/bVNg6iQGpXZntHNJ0v/fwDJUvFeRk+ugu4RKg6kTykC2OZsweQ66LheYN7OtfURsHiyVFykZU/d4c/wRp+63Fyo6cgHkeU=
Received: from DU7P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::17)
 by PA4PR08MB6303.eurprd08.prod.outlook.com (2603:10a6:102:e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 18:36:53 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::93) by DU7P250CA0024.outlook.office365.com
 (2603:10a6:10:54f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Thu,
 4 Dec 2025 18:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Thu, 4 Dec 2025 18:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIXiBJeZDnSbKqRpsHRTFn+H8BxAMteH/Jz9Yrhn1sWtRojtHRejnvYWLcEAXGRkX5TSEu4zaUPM0LO73lATUUe/Eld1Qlap7uwOJeulAR8okdqp8tYHoEnKp/AB9n2htpmNgJIl9mNVE98dMSaa5/ddkLs84cY32D4xYIpwfJLuUGqD9UsS5lQryPSkHQGh7L0MzC1FgRPhwbN8MHFtySbsG3A+l2yeWRRUFdjN+FiEfkYARfZ2rfKQ1GjxBMpBdCwwMvqPt2kMKejmS8go4lFHiIzhoDsvgy55UDOohfbjPZmsT7LZVJWYpp2H5Fmu4eOfheJKR6Bfa1SKrCDF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKKuCzzXv+YLEORJ0i+LM2O7WshEShQ21xLbCqysAGs=;
 b=g0Y0uZb0VhYz/A1Hd/l4Ri7gLJw9BclR714MOBnCKl0BUOaTZ8Q1ZgFn4KjOKJxYrhUtCtOmqx56hO9xr5ariFJLMfdcnRPnUIsWYnLIa0FQnaPGDgdVyeYVq7aeSxIFcYm0FxaRo9qmQMyNM/f2ScQ4F8LY5zI9v9b6Zp/K5iWpf5H3Qx0tCMao4ZDoeOahMjFgdwLWiYttbuvYj/xKf9w7PfTYrGMjmrkjBudIaYd6pDbKbtImBsUeLfmvHP5qDnKPaBaPPN3FkFV5WUweoqbbuU8XJfKhrzHtklrcIqelUCQ7rQG1q6o9qJz/ErdV+Xik9GHccI0WdkguU6W5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKKuCzzXv+YLEORJ0i+LM2O7WshEShQ21xLbCqysAGs=;
 b=ZhQhrSPd4g+HyozA1asQTNrxKsQTrqFQy1goIozyWbqdBELuCTzVfOsmlBx5OjHzwY6N8tJyNz/h/bVNg6iQGpXZntHNJ0v/fwDJUvFeRk+ugu4RKg6kTykC2OZsweQ66LheYN7OtfURsHiyVFykZU/d4c/wRp+63Fyo6cgHkeU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9973.eurprd08.prod.outlook.com (2603:10a6:20b:641::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:35:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 18:35:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for
 multilibs
Thread-Topic: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for
 multilibs
Thread-Index: AQHcYDSnsYFy0V0HdkWpW1YJRmWKELUR2SeA
Date: Thu, 4 Dec 2025 18:35:47 +0000
Message-ID: <6F4CEC32-3094-4B06-9C62-89C97A07649F@arm.com>
References: <20251128065949.7462-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251128065949.7462-1-liuyd.fnst@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9973:EE_|DU6PEPF0000A7E4:EE_|PA4PR08MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: b096195d-fb2a-445f-533d-08de33641799
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YllDMXdOeDBXVGVoNVgxV1JhVDc3TlBCNDk4cFFOWVpxVkdOMGRHaVV2QVFo?=
 =?utf-8?B?aGllbEo2U0dPNDFpQXNaVnRxY0xrUkhLdFdDd3M5dVBmYS91RHFpQ2ZzMlZi?=
 =?utf-8?B?QzhBcVc3WXQ1MEJ6THNpSzAxcTU3Q0Y2ck5XbFI2OXJPTTNxb29wRHdpKzJY?=
 =?utf-8?B?aUtQUW9Xb3JxamJmL3F1UVo2YzR2eS9xUGZDUTVoNE1ZQWdoLzA0K0paNTVU?=
 =?utf-8?B?QjUxZXVVdGJCUVljN2l6WjY3RklSSFBJbnJaS0lMNDNPQ3drMjdkR3NSbGpy?=
 =?utf-8?B?c1pEbDRSTXpvU3gzRlhmaVptbEJtTXI5TGVGYTVjNEk0MWtielUzTlZtUUlt?=
 =?utf-8?B?Z3VKRzZndnF0WG9rcHMyc0V4L3FTdjcySW8rMEJFMkxzdlFWQ21PQmRqWFJ2?=
 =?utf-8?B?YmRQYU1iWFFxQVczQmZGSVVkYmxrMzF1UkRyMmR6eHJTNWN1VWwyM05RYnhV?=
 =?utf-8?B?T0hFaThwZEt3eHN6WWJuZlpEQjlVZ2ZlT0piakttRFkzNjBnTXNGcitHTE5n?=
 =?utf-8?B?REc4U1FCZWhrc0huWDVUL3NSUzdVckx2aTFPOFR6bS90cUZudGZ0cmsvQXJi?=
 =?utf-8?B?NHBVWGhncm01NElVR3BzenFXNVRZeER6YTVrT0IyZUJsTURKSmtXUDVNV2FY?=
 =?utf-8?B?LzNIUUNRSC9BSU1GVnRZdUlia1BuTFJOWktaZmprQ1pFU1RieEp6cWRmSmZt?=
 =?utf-8?B?cC94Ti9nZElkSFZZbUFqL1lVMEd2MTYzdEo2N3V6ZElHRzVqemZFV3RFcklF?=
 =?utf-8?B?dEFOUUs3NlBaQm5UREQ4YVIrNU80cEo2ZG5zUExpNlFCemo3YUw1VUwzUjQ3?=
 =?utf-8?B?YlFGVHJ2QU5id2JpWm95SmRobUdVL21ZM2cwd2ttT1BWa0Q0dyt5Zlp3MDg3?=
 =?utf-8?B?L3h6dnFsWC8rWEVsS2NrUWFqTno0LzVVOFZ2STE2WjRxOVFLMjkxZXFEOC9a?=
 =?utf-8?B?RFkxMUx5azhsTzZzN1p4cEJXcnZIOVNwOS9aYWF0dVB3RlpCTTlYMXFQd1BM?=
 =?utf-8?B?dVF4cDRGeU1MSmtYT1p1akNhT3pKc2tRZ1BnMjE2bDJXekFhTk1PR20rRXBM?=
 =?utf-8?B?OWJ2cjVDUVoyUG9IcFRCZXBCZjJFQW5Ub3g1TlFNd3ZLeHJkdXBuNkRGdTF4?=
 =?utf-8?B?K0x3V1llMmJZM2plVWhJUmZtalc3VFVUaFJaczJUSlNQbDVFeGpsYWEyTE0y?=
 =?utf-8?B?OWFaY1hCME03Mzd4NVU1Q2pMZUJwU0NSb3ZyOUh6UXZ3M3p0Vmk3VGE4WlAw?=
 =?utf-8?B?eHJIV0NPWU8xTDdoWHRpalVWMTRVRTFickg1Rit0OEYrOXhDMy9lZWczcFp2?=
 =?utf-8?B?UXNzTGRONmZUQ29EazVHNVBWUFJjM21SOThhcTFidUo5NnJtTm03MWZJeDZp?=
 =?utf-8?B?OVpLTGRHRy9VNVJqZGdMeTVWL0JzMVpML1FKNFBGZ2FmMWJxdUtBWC8ydEpP?=
 =?utf-8?B?VmpEWmdmTnZTYnJnYkpMTlhSc0pubmJ2WHY5VWp3QWVaWmpKNUpqdjUvU2NJ?=
 =?utf-8?B?M0RieGk2SllHb1M1Zk9ZRWd3Y1plblVFNFBaejBTU3NjZXd2UTFTbGlIZGF6?=
 =?utf-8?B?ZWxYejRSeGtydU9JRnh0ZlhpcUF5TVhtVkJGcml4dVhRV2xGZy9zeFV4aHZs?=
 =?utf-8?B?dkxUUXoxSjdQcDJFeDVlTlBWQS9Bck56S0lVbXhOcDVyNE02c0ExWkppZnpD?=
 =?utf-8?B?NnhlRTNZRlNVSVJiUE5neFVBRE94dzZ5NjB6Znd0cWdwSzZVKzNQYnZqTGl5?=
 =?utf-8?B?V1FjTkg4M2hzRjVRcW5vSGxrc3ZWa21aaVMvUzU5OThNdGhWY2Y3d2Y0TzVH?=
 =?utf-8?B?UDN5U2NaMzZSaXpWVCt5R2hVNmJnMGRDd2FoQmlrK3BEZ1RNM1pkQytwYjlm?=
 =?utf-8?B?bUZ2dmlZTzB2Uy83L2FaZzlRdVVlSjl6bExxbWRON2FoczJsQ09vL01CSVRY?=
 =?utf-8?B?Y2QxTVFYY1NGZjVNdXRSSEhOWGtCYjFpS0oxd0pHbEVVNWZITDcyWk9OTmJi?=
 =?utf-8?B?SjF3aFJ0WDNBeVdOTjRpYmRuQVgvV0RtS21pVjd3YXRrNHBCUkZPaFEwL0pI?=
 =?utf-8?Q?XVZW9O?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <797D9A746FCE554C9D2A4C0309FD88DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9973
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e1dd28f8-9c33-4f34-f384-08de3363f151
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2RUelorN1dxYnk3SjRGYTYrVzBBcmxDcDlNMFNZdy9odHlxcWhqV2JnUnBL?=
 =?utf-8?B?RU80QU5TdmlyV24yakE0MlRxeG9KaTlYNzVSd2YrWVUrMFFSTVNHa1BieW5Z?=
 =?utf-8?B?M2pseXZCdTJSanZMWDZFd0h2dUI5RWszT2QwZ2UwUFg1NTJkSzZHcTNpenp2?=
 =?utf-8?B?N1lVaGE1c1JEY0Jjc0xnSlpPN09MQU5oTnhFNEhsV1ZZQUhjaVUvTkpaWWJP?=
 =?utf-8?B?WEsyR1lsbVhlY2xOTDVQMmF4RUtDVE1IRGVES0RlZ2Ridi85YlRTTGpkVDBp?=
 =?utf-8?B?dWtkUnBWLzJlSmtwQklXa1hhUzZpS3pCK2Rua3ppWlRNSHN2anIyWHdDREFC?=
 =?utf-8?B?TElMNENuS1IyVlhFK3NWb2V6UHRQdkV1Y29wQlZrdmczcHJPZ1lxalJJSWxv?=
 =?utf-8?B?Y25zNHlQM001SmNHa1JxcGVzOE92UkRQdjFWM3ZseXhsWVhJN0FPUHplZ043?=
 =?utf-8?B?QjQyaC9nR2lOWGhMVGJaNEZxemgva2Q0a1FVTTZxNFIxZXBPdFlST01nWHl0?=
 =?utf-8?B?T1VXMnhPZHlhdFFDc282VlR3czByT3NpNC9tbzlYTUZsaVpmMkFJZzgyTk03?=
 =?utf-8?B?UVArVVAvQ0FIdVNiNnNKVFAvMk00L2RNVUFWZ0FUVVUwQWpGTkJYeDdDczRY?=
 =?utf-8?B?OTZIeUxpbWVIMkxxK3crcDQwMkdiemRsTG1WVVRJZFhXR3FERWFESlh2ZHRj?=
 =?utf-8?B?SVhhWXRZZzExaHh5OWRmOE1mUlNjbGY4ZURNZnV6VmhlVzJqTXpXQVZ3TlpY?=
 =?utf-8?B?RjRjMGxSc2pXN3Bqam85em5iYmN1ais1Q2J1MzJlV3lsekNUMUlVL0ZqclFB?=
 =?utf-8?B?TnhLaVhlT29NY3RyYVdiNHozakdOSTlMVjgxc2YxSGF0cm9qbnl0N0UwUzhM?=
 =?utf-8?B?eTdmU3c1a1hMVWxmTWJvY2hMeTZBOE93UXBBUkNyWDhXYWg2TTNHNUh0K0E1?=
 =?utf-8?B?OGxpdkFEenR5M3BSU2hxWUZPTkhhckFiazVRT3ZXd2o1M0hpUm5iS2ZWRFNo?=
 =?utf-8?B?cU0rOEpQSmowaGxoNUxMa0gwSHVFd0Z2OGdtbFVPOUdGUjQ2VVVKZnl3MU5S?=
 =?utf-8?B?UmdCOHJKZXM4cFJHUnkwekZZN1FCR0JVZlZCNVhYWGVYV1dmU0dQTW5scnZa?=
 =?utf-8?B?b1BET2M1amlZNnRjNmMyZnFGTEY0cFIwU2p3V0I2Q0RWK2hGaEpQYUQrUVcw?=
 =?utf-8?B?M2lCLzVFNExmOHRtem5JWEtIb3lXS2FXRldLVlRWYU5JUG8yNWlNK0FjNDdo?=
 =?utf-8?B?QmJuMGRLemVBaDJER0RtYTJ4Q1FWOHllT1luNVQrTGRDblZVTXBjc2VXU3hM?=
 =?utf-8?B?dE5TeVNWemtwVlVodFl3bUpMekwwQXkwdEVldGlvcS9QRVBIZTVuQXp2UXRP?=
 =?utf-8?B?czhQQnZUdG4zMG50aGJuVnNaVFprZlBJVU03TlQ2eUpNSXRMODdoWWhGRGxS?=
 =?utf-8?B?UEQyYWZQaWdqNC91SlhwNVZvTFk0RUJqRktJbGl0QzFvRWdpTXpKakFld0ZW?=
 =?utf-8?B?UmtiZ2F5Y2JBbmt0V1hTU0tJb1p1US9FLytreTlrOTJ0UkFmMkFJbWQ5UE45?=
 =?utf-8?B?QWNhLzJ2SGdWNGhCTE1iSjhqT0JsMmFabzU0MjJxL0JMaFdneXZSaG1Cc3Za?=
 =?utf-8?B?UHpUUEYyV1VqUXNtbFVKbkZLWStBSkxRQ1E0c0w1UnhDd2VUa0UvRjVSbzEv?=
 =?utf-8?B?c2dLQnAwMXB5TXl2MUZ3Q3FYSjd6MGg4bkxrdURvZ1lFS3lWbFI5Nzc3L0xm?=
 =?utf-8?B?VFJ1azdmYWcwMkcvUjZseWYvaklWa1lMeUxMUzQ4Y0kzNitpa0lyZXhOemtk?=
 =?utf-8?B?bWs5NE5icVRlNHlJWm01TnJPK0lIVDh2TFlNSXFlTzJyZFd1UnlkelBHYk44?=
 =?utf-8?B?VCtINnd2MS8yVXI4S3gxQXNqTk8rZHpUQlI3QlZaMHZyMGk1R284OTFlWTln?=
 =?utf-8?B?bCtEVnVocHlYMTJTbjhkbEJPSC93TlI4Y1c5enR5cklBWUszZ01IUXc4YTFp?=
 =?utf-8?B?UFpKVW5YZWR1WS9UWHBhdEpZQ0hVYnZzbUJDRW9nbFhSVEJDeXF4Mnh6NDV6?=
 =?utf-8?B?WlA3K0tmM2UxUXZxeHJuNTZNNEQwVjk1M1FtZz09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(35042699022)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:36:51.8417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b096195d-fb2a-445f-533d-08de33641799
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227323

T24gMjggTm92IDIwMjUsIGF0IDA2OjU5LCBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IFdoZW4gZW5hYmxpbmcgbXVsdGlsaWJzLHRoZSBta2RpciBj
b21tYW5kIHdpbGwgYmUgZmFpbGVkIHdoaWNoIHdpbGwgY2F1c2Ugc3Vic2VxdWVudCBjb21tYW5k
IG5vdCBiZWluZyBleGVjdXRlZC4NCj4gU28gYXBwZW5kICItcCIgcGFyYW1ldGVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gLS0t
DQo+IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEwLmJiIHwgMiArLQ0K
PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnV0bHMvZ251dGxzXzMuOC4xMC5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXRscy9nbnV0bHNfMy44LjEwLmJiDQo+IGluZGV4IDJl
ZjcxYTEyMTMuLjU2YTg0Zjc2ZjAgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXRscy9nbnV0bHNfMy44LjEwLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXRscy9nbnV0bHNfMy44LjEwLmJiDQo+IEBAIC05MCw3ICs5MCw3IEBAIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIG5hdGl2ZXNkayINCj4gcGtnX3Bvc3RpbnN0X29udGFyZ2V0OiR7UE59LWZpcHMg
KCkgew0KPiAgICAgaWYgdGVzdCAteCAke2JpbmRpcn0vZmlwc2htYWMNCj4gICAgIHRoZW4NCj4g
LSAgICAgICAgbWtkaXIgJHtzeXNjb25mZGlyfS9nbnV0bHMNCj4gKyAgICAgICAgbWtkaXIgLXAg
JHtzeXNjb25mZGlyfS9nbnV0bHMNCj4gICAgICAgICB0b3VjaCAke3N5c2NvbmZkaXJ9L2dudXRs
cy9jb25maWcNCj4gICAgICAgICAke2JpbmRpcn0vZmlwc2htYWMgJHtsaWJkaXJ9L2xpYmdudXRs
cy5zby4zMC4qLiogPiAke2xpYmRpcn0vLmxpYmdudXRscy5zby4zMC5obWFjDQo+ICAgICAgICAg
JHtiaW5kaXJ9L2ZpcHNobWFjICR7bGliZGlyfS9saWJuZXR0bGUuc28uOC4qID4gJHtsaWJkaXJ9
Ly5saWJuZXR0bGUuc28uOC5obWFjDQoNCkkgZG9u4oCZdCB1bmRlcnN0YW5kIGhvdyB0aGlzIGhh
cHBlbnMsIGFzIHN5c2NvbmZkaXIgaXMgL2V0YyBpbiBhbGwgbXVsdGlsaWIgY29uZmlndXJhdGlv
bnM/DQoNCkNhbiB5b3UgZXhwbGFpbiB3aGF0IHBhdGggaXMgdGhlIHByb2JsZW0gaGVyZSwgdGhp
cyBhcHBlYXJzIHRvIGJlIHNheWluZyB0aGF0IC9ldGMgZG9lc27igJl0IGV4aXN0IG9uIHRhcmdl
dCwgd2hpY2ggZG9lc27igJl0IHNlZW0gbGlrZWx5Lg0KDQpSb3Nz

