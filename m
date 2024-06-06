Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38741C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 11:05:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.11616.1717671919177451382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 04:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BSooj+mP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BSooj+mP;
 spf=pass (domain: arm.com, ip: 40.107.21.83, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NpWucC86GnW8L871BQE5pNe5cNo2l2oQohti7lZEqryEKuwySv3DhHwOz066EyXfLxougrsnl3qarmTyoc+8OvtNrsATY7vMYh9bgwLkRO6/0Ife2JinxYWverXkyngoy7i8kG8REVQfRjutW+nSVlRiVJ5EEiFjbgzPh6Fg+0N4xMSaExPXcjg7kdNc7liAjZhBw3lFL5he4Nm3OgMgrchCdHmBUQdEtrJ09RTqK0iQxJ0/T0K4XHybihhWlIcMGntUrXp13pCDIFzGlzHjY+UijkJ2QxzpPUrppMUEsmQO5rj2vvx7gSkGPf28uqORhF22hlRUNNODfmgQ1aeqFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13xu48997d2OXk4fTHG0/xWbuPwd84JrgUKwXsjOW+M=;
 b=JUAdY6zmlZjmmkOD7bfY87ZLC2dwEr5tpLI+EjntpEQYsD3k9FLUwAMBi6qSvMx/4ofYPL2K/d4+V/Yk05UIUbRXnMnt6DSjPfWkEjNe5tNOLHHZZQRwiZLRaXFQa7cLvb1BqSbfvK6Hq0Jse+4EvOzhYr8vU0FcT9hL2IyPvjM0FKuxv/gkKnK3rOPYAVsMHdZHuNZ1Ocu0iPq7hO8jHxy1mElVfIFtHVQDYwPPodaNmznDEu7lq1AksG88VD5E9MTCAbXUx3NnF8ffpo5Woa1MYMuJVgWbX+uYz8krJOJ5Ve68VfjC3AXe9Gpw35jmSCz0m6wElHrZ2q1dPvujRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13xu48997d2OXk4fTHG0/xWbuPwd84JrgUKwXsjOW+M=;
 b=BSooj+mPI/uHR/UkHScIz8FLa5xUGxNJA/LdU7ioA+Qxqut2sFU2i1we3m0tKIGSQvMupy5dNmzFAoWJnEPqEh2u9zQoM/mISbZQFwATNM7bdjW+1ShewayD7B6doWFvFpnjeyW+CzUuUOttujE7bsCEG+5BN0Kww3Lj+DEcYgU=
Received: from DB8PR03CA0003.eurprd03.prod.outlook.com (2603:10a6:10:be::16)
 by AS8PR08MB10026.eurprd08.prod.outlook.com (2603:10a6:20b:632::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 6 Jun
 2024 11:05:16 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::e6) by DB8PR03CA0003.outlook.office365.com
 (2603:10a6:10:be::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 11:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Thu, 6 Jun 2024 11:05:15 +0000
Received: ("Tessian outbound 9d4318e1cabb:v327"); Thu, 06 Jun 2024 11:05:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b942592724af5c3a
X-CR-MTA-TID: 64aa7808
Received: from c6faf107484d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA2CF253-5653-491B-A0DD-042F4BCE8940.1;
	Thu, 06 Jun 2024 11:05:08 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6faf107484d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Jun 2024 11:05:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKClU/aPE5w/8+filUk9feue5y81hwoBMoTgLwATSqQ/5M7D9bIH/YSQGC9QLhDGkpKxGD/VDhk/2Q90MGgk7qLPKxj2koeHFzxWhHhwBNSrlrFo+OguLkiZ5pXf4LjBbHUSYSZWXA8+CvGYeEcPS5zImtoK1evL/L3Iab3DMD161D6opeXWln4chK1Pzyy+faUzOhAfd+NNNYWnzi3ZFRQSBaU5ZusuyVRAzKNdEHSiqugq42ixd+BPSE3XD9Fpo7v3ZJidSEa6v0ARJiJ8lARDy0lCHvdqPht1f01fkZoW/+PN8b9MnSSO6G/MhCJTTt/1R8vID5uWkiz5DOsCEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13xu48997d2OXk4fTHG0/xWbuPwd84JrgUKwXsjOW+M=;
 b=eI4V1padg7V5AQHCKf5YpNUC/4sTgYJKEYwybZrRL4BsapuizhdISvAxhACJXlwyVi7tYjQ91+A0A3tf9dS8qBEiQX/oGtmY1FQE5Bdq8vjZnEZHospz06iRApHJJ7an5oLMJTMWhCSi33i2hTXbr/MGmMGEZw1Krxx4r9HVScgax9sOtdoQm4yXeiFQCgVW/H+7ryQANc4SsDTS4ODbpg+DMPXQSkojgJM7hAnaYnXZSRg+72iy/AxIEIc78qILKVDXyz0hfUacl7hzeuYWXx3UPd2GIQo8SgkQW59BtZS4sbSilqBBJsR2rr8y9tO7Cob5OWdQgKVxFPY6RXuDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13xu48997d2OXk4fTHG0/xWbuPwd84JrgUKwXsjOW+M=;
 b=BSooj+mPI/uHR/UkHScIz8FLa5xUGxNJA/LdU7ioA+Qxqut2sFU2i1we3m0tKIGSQvMupy5dNmzFAoWJnEPqEh2u9zQoM/mISbZQFwATNM7bdjW+1ShewayD7B6doWFvFpnjeyW+CzUuUOttujE7bsCEG+5BN0Kww3Lj+DEcYgU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5668.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 11:05:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 11:05:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3-docutils: upgrade 0.20.1 -> 0.21.2
Thread-Topic: [OE-core][PATCH] python3-docutils: upgrade 0.20.1 -> 0.21.2
Thread-Index: AQHatoeEAzBbqcq8/Eu3NRhiFm1D9bG6laqA
Date: Thu, 6 Jun 2024 11:05:05 +0000
Message-ID: <FB6C2136-98A4-4204-ACF6-15A6EFF19162@arm.com>
References: <20240604135942.2721706-1-tgamblin@baylibre.com>
In-Reply-To: <20240604135942.2721706-1-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5668:EE_|DB1PEPF000509F4:EE_|AS8PR08MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6e50bc-0223-4574-0af7-08dc86188b80
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RC9jQno5VW9QSTdRY2luVHJSSVRVUVpCaWkyZkFyS290SHhNbVRJdi9SMy8r?=
 =?utf-8?B?NmRGRTJGZlUyWFRSa3NoUEhYYzIzN0kyb3JaNDlCTGY1ZDAwQkZXejFuOUpt?=
 =?utf-8?B?V1NuTDlyUkJhV3h2eGwzMjN0cGJUMUJwc09hR3kvaGZROHU5VkdUNzhXQXZp?=
 =?utf-8?B?TmJGNDhVLzZDODg0OUd2T2NDd2dOR2xZcmsrS0dMeXdhU0k0UWJUb2pzbXUx?=
 =?utf-8?B?bWplUVFXK3ByQlNFNFJtQTZyampFWWRGeXN3RFB1cXNWUDFCckxtaXhtNm5Q?=
 =?utf-8?B?a3hqRE1oV1hQd0JPbnRhMmhCN2V4UDZCSEppeXlrV1N3Qm5BdzVEbjJubzJX?=
 =?utf-8?B?OC9wdjlHam4wMGdqdnlYeldzOUY3L3BQQ29wVVRLaWNjMFNQaXllUHJlaTFa?=
 =?utf-8?B?bzBjbURaSTNkS0xGT0NuRlNialM0K1FueFo3aFdnRFRjcVNEaXdqWWduNXFZ?=
 =?utf-8?B?QUZOY0dYK0N3anUvKzhzT1FGQWNQcGZLQ0xhaWtjUkNJQ1BZYWMxV2h0Tnhl?=
 =?utf-8?B?dmZBcnJNNzVZbEVaZ0VMU1NwUVJkUXJ2M2J2VTlGRmR0ZTlQUTR4QzY5SFdP?=
 =?utf-8?B?Z1hzMTAvWkI2M3J4TzJ6TXlXdlVCV0M2Z2xTSEdWVzVnOGQvN05IYko4bjNm?=
 =?utf-8?B?R1EwQ0QrOHkvaFFiZlQ0OWI3eFdSZ3JqM1FHNmFwWWlaWGZiYWhHWXowZVUw?=
 =?utf-8?B?di9qWGkyekQya1JSM01xVGFud2ZoaGFDc0JibmNZWTZNcHJPMVV4WlAzUXVD?=
 =?utf-8?B?dTY2QVloTE9jTDRMZ0prSUlGK1NibGZvcXdqbWNCVUJ3NndjanlSZ3F1QmdW?=
 =?utf-8?B?ZVJOT3N2L3IvbGQ0dEp2NTJ1ZzdMWFdoVDAzb2pDdTMyU1NnVFNFditEKzhq?=
 =?utf-8?B?MzdzamtWdUJZalFHcFNOemh0cU9TSldnaVVZQmRHWm9FN3ZTZS9ZN1lKR0Z1?=
 =?utf-8?B?YUttNkNTN3JJUWFMbmZZYUJLeHdjbWZLNnc3VDZ6dmVIeDZ4Vm5qSlpVZkIr?=
 =?utf-8?B?V3p3ZHlSbWY2eGptVldyY01kSUdOR1ZaSVFIbFZKenFKSXRjM1FZNVN4Y3k5?=
 =?utf-8?B?UWZlVmI4MlNES0trMEwyZDNrYlFDQTZFS1FwVVBKVWRUenFQd0tMbXhvejE5?=
 =?utf-8?B?NGwrQjhFMUU3NmQ0cmtjdkxsQjdtVFRnQWZVa3liL0NmbEUxMWpQdHhxeVhT?=
 =?utf-8?B?ZUhLbGRNeVlMNWFjbE9DZStqLzQ3WVVPV1VnWkVKaktMWmhFKzB4QzFtNklU?=
 =?utf-8?B?L2RldjYyaEV0aU9oa2k0WXhEQUlWQVBrTTVVNksxb1VwMzVGMWJ4M2ZQbzRl?=
 =?utf-8?B?QlNNM2Nra04xWENKcEMyNEVJTHdYZEx1VlloYlNUYlhvTDQrSXMyMVRybDg1?=
 =?utf-8?B?WXY1QXEzTlJTRDh4eVlnTHhDZWVqLzFzWTFFNUtCZHppOTMzMGFFUXF6TEJM?=
 =?utf-8?B?dnRJNGZER1dzWTRNOUQzME5GYStiOFlRWUtWZTYrU2owaXFoTGhtREtoVktO?=
 =?utf-8?B?a3l2aFB5eHQyc1dtd1A1aSt6dnBFL05xeFdKRktiL242TWRkN3R6Y0xqTGIv?=
 =?utf-8?B?V3FlUTRUYXZKL0daZ2h4RmI2K2hYbGRSN09pQjFqdlgzS3kyemhCZTJFTGZU?=
 =?utf-8?B?Y2pRMmc4SEl3SDZwQ3NITExRMEQ1elcyZzFtTmFvQlI2L01rcmhhRnN1UGV3?=
 =?utf-8?B?NTh0ZmoyVzBWQ015MCtkVnl2b0ZsTjFYMTdwRVpUbFJRY2QxZGR2azQwdk9z?=
 =?utf-8?B?eVVwNW5MNWNaWHZCV3dCU29yNEZTMTAyUGttT0trVXZZbjdIODZZTU50My9D?=
 =?utf-8?Q?VaGd+dxR6lgtA9M3s65Q9tVLjadpNz4LdEd14=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F741406708C19D4880D81F1BBD1E62F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	726bc3c5-72d3-45d9-da2f-08dc86188548
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|36860700004|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekJLSnU4WXlrNWR5VTJ5WTY2TGVjdGVneUd2Z0NJSFpjbGFCQk5pR3ZvT21N?=
 =?utf-8?B?VUJ6R0tZWUVsYy85OWhVbCtITFpiUXVENTcvcEVYT2Q0VS9iUlRMVG85c0JZ?=
 =?utf-8?B?RmovNCt0UEpxeS9VRU4wZE12OGpDQ05VdzFNcjVkRi84U05nM3lheTR6WUZl?=
 =?utf-8?B?NGJnYkRzTGhKODZuMVB4bFN1dUZxYlV6b2RDVkJWZHM5M0d2RHNYbDg0VmJx?=
 =?utf-8?B?VnducG5vVXp1c3BHbjFnbkcvU2ttaUc3U1REc3laRXNNNkg4c1NaTzV6VXpS?=
 =?utf-8?B?bkJNY0lXd2djU3JKS1BOY0NSZlZVTDZzYktpT2ZBNUU5amdLR2tjK2kzZDR4?=
 =?utf-8?B?TkZkUkhwT3MyNGszZlJrZHR6ZWhGTmlyZXh3STVmRUxRYWZlUXR1WjhGMnNh?=
 =?utf-8?B?aG15QUs5UnBLQU9ML1VOcks2SkR2QTVLQXRXL1JSVUdJUlhBUGdZSHFSZS9v?=
 =?utf-8?B?TWc2VXQ0ZGhvTDRhczE5SmxqT1V3L1M1ajA4OVF2Z2JvY2VlNVJOWkJ2aVAy?=
 =?utf-8?B?Vm5YV2NGWEp0RS9YUjBmQm5yK0NOdzhySklEVGh5S2xNODZXaXlTaXltMjFk?=
 =?utf-8?B?dUxUOG84YUp6Z1pHeUo4Vmg4YmNOeHZSc1JqUzhDS291NFZXT0xrUVhIaFlR?=
 =?utf-8?B?dzFvMkU3MzZqVUNDdG83RWpva3oyb0E3T0N5TklTK0JzVURPTUZVV0pYVDRO?=
 =?utf-8?B?b0JWdXJSUXhNZWFSd2ZaUmpxQTdMempQbzRPdWpNcDJ1eEJRaXdNb1FIdTZq?=
 =?utf-8?B?L21TL0NEZnVDMDR6U1hiblFhejM2NkdMOHVTT0dqNGk1aFdGSFAyK3ZyaFNO?=
 =?utf-8?B?VUc5SENCdVArenZTTmEwUVQ5Wk1sd0c0OHJ4Q3V3b3FXUEF6YWpuc3YzRCth?=
 =?utf-8?B?YWpsOVRFdE1DeDFBU3l4YVdRcW4xRkpBT2hzdzQwbTR4QWpHZVZMdnkwSkhh?=
 =?utf-8?B?dHdFY3RRT09kUTh6Z0RlSFJJU2djejFMZlh6T2tYNDUyWUJUaklINWJ1SVlQ?=
 =?utf-8?B?UFRzdkFBZUgxa1BvbS9vdTdDWkEwNmhhRUNjMmk1T0lUbWpjb1JkUTNEdllW?=
 =?utf-8?B?M1dqYSt6VHVMNjZCSkpTZENrbldwR0pJVk85WnRhbU5mcGgzMjhuMWMwRzhM?=
 =?utf-8?B?REdVaEV0aDNielREM2tUaUNQQ0hPQktkMUIweHU3WGNOcjAvU0JmR09UQWhy?=
 =?utf-8?B?cndpSks5ZmlPRlpSblVib2R1aE5WYW9xWGlGNFIvbXY3K3JEQ3FSdFAwd2lm?=
 =?utf-8?B?eTlaaSs4SlJjdEMyMGdueHVwdzlENkFsNXhlZkJGeThqZ3dkbkUvS0swTm5q?=
 =?utf-8?B?eHNwT0lyR2Q1ZysrODJXSjFTZGpUdHNTK3BCUlZtRGt6eFZyNG5abzNSeG1n?=
 =?utf-8?B?WEtQWUVZUzd1NTkra29FT2wvSnlML0RsOXBpQlVXdVFmSDdYQ21kZ3BhRUpl?=
 =?utf-8?B?SWlGdFYwekYxRnA3YUZrbFMrMlY0Mkt1UUtkM3VZNWFpM2tBanhwV0NJY29j?=
 =?utf-8?B?dmxxZXRwMU5RK0F4MktRaUo0WVYzSmd1UG8vM2NjTzgvVlNkSWhwZi9BMzNU?=
 =?utf-8?B?Y040bHlJU1grcTdIbllZMmFsTCtHVUZmKzdYZWdOT0VKSWMxREJxc0w4VHlN?=
 =?utf-8?B?VTQ3bFJSOUhSUmlmVE02UDAxTTRoQmYweFkyUERqQjBGcEUvOXA4Q1Q5YXJo?=
 =?utf-8?B?MVMvUXFyRGVObWYrRjlrSDJ1UVB0U2s1cGVMcjE2OTcwM010STBRa2xuTTZz?=
 =?utf-8?B?OWpKZGFFcWpSZEJqQUhkcWsrdW9CN3o2Q1lHd2tkeTc1clJ6WmdZb1FINStn?=
 =?utf-8?B?SnpVL0U2aDlOaHo2bEVlUEorSlp6Y1RHWGxHN0VnOEJxRGNLUkwwbG4veHdQ?=
 =?utf-8?B?RjFIdjJNUUxmTlZFUEFyeGFsRFJrRjYwV0hXWnJrTVd3T2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(35042699013)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 11:05:15.7529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6e50bc-0223-4574-0af7-08dc86188b80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 11:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200395

T24gNCBKdW4gMjAyNCwgYXQgMTQ6NTksIFRyZXZvciBHYW1ibGluIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDx0Z2FtYmxpbj1iYXlsaWJyZS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICtMSUNFTlNFID0gIlpQTC0yLjEgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9u
bHkiDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnR4dDttZDU9MzgyNDMw
YTA5YTQ0NTM4MThhYTY2MThmMjA5MDQ5MWIiDQoNClRoYXQgTElDRU5TRSBkb2VzIG5vdCBtYXRj
aCB0aGUgQ09QWUlORy50eHQuICBDYW4gd2UgcmVmcmVzaCBpdD8NCg0KTm90YWJseSB0aGUgYnVs
ayBvZiB0aGUgY29kZSBpcyDigJxwdWJsaWMgZG9tYWlu4oCdICh1cmdoISksIHRoYXQgbGljZW5z
ZSBsaXN0IGFyZSB0aGUgZXhjZXB0aW9ucy4NCg0KUm9zcw==

