Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB07C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:34:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.11369.1715859270373744880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Sjlk0WWC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Sjlk0WWC;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=c+FlhvX1QwG6EQicglEjpW9+LP1s7PQX2CtoFTC+BCI5ZOsWKLl2mTK03CxdYjDFP8+0tFyrRrax4vRhomXpMdf8AeTBrc/AJw/BnmxdgmlaZh/e7BJLtmlBK/sTgbkKAiJtJs2NFj3pyrMjDnAEnGl2iG32H3w+N/ShwFHPR+i0DEU0QNQ+ta77IrYb7EK40TEav0uR8R4k4Egfv2Fhqun5T0TLKcbAsA+ItiNBXdASWFm+bRpuvgZmaDSobrl8Oa3BhIuGELLTWvlX/2/qzCWM4Mpdk+yU/FMn6NIpXf4N0zGtZSytLf/RR/e29YjOY4SFoFQrwCKouu7u2Fbrbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a6/bQmdXoJ6uzT9OnqmfZQ7nukWetIkFgc9CLVrh1k=;
 b=H6bJoZe5zqxTUl8QOBX3cpIZhL/5PBS8Y0s7jxs7NI3uILf53QE/n3hkXz8hfHSdsdAQTgMo9Qq/fHzEvX3G4htOAQ6VQXS0UhmL9jjMgn+J0ixe1UXExPSsA5TVIYlm2Jr8U+ACQ4z18qWDrT9tV03SEqp7gv0Y3dH/98+AlX/F5jB3uaxuam0F2M755Q0944OxXr4nRfcFobU7wa4hSGSXcM2CzvcpIf3PHP6kq/2LqURU/1kVu0Yrt7QOnt02bYBVcKQuZ2xTIMkEJ3Ll8jKWxMES9n4i8v5Pdmoi3s1EIXFO5Pq575+qoYpliIeq4vHd2uGrYzKdp0Vw46QNfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a6/bQmdXoJ6uzT9OnqmfZQ7nukWetIkFgc9CLVrh1k=;
 b=Sjlk0WWCiyyCTW4GQtIvJMLniftPIvzEIR0MX0c/0/WCBIFhCQnSJFdnmxalwpKV0hg8XDXfobIeh2UlR8AcX6N0TDNuNkkanlw6ytZ44oWQqyM65meH7ql05tNeLjjxGR731CiQh4fe0gpZ/fKTZck6bWfUmyIKDrWMPrbdQ7w=
Received: from DUZPR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::19) by PAWPR08MB9029.eurprd08.prod.outlook.com
 (2603:10a6:102:341::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 11:34:25 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::57) by DUZPR01CA0061.outlook.office365.com
 (2603:10a6:10:3c2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Thu, 16 May 2024 11:34:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Thu, 16 May 2024 11:34:25 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315"); Thu, 16 May 2024 11:34:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8f02ba66d7778e6
X-CR-MTA-TID: 64aa7808
Received: from c18317b3d1db.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4C12C0E2-67FF-4354-BC3D-B53F0818AC30.1;
	Thu, 16 May 2024 11:34:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c18317b3d1db.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 May 2024 11:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMJqQEYtnk3DyGaN5i/e7Z+BDBcXRhqfMH9ovqEd4qkJbuREF7FowiZV+nHSJUlPeBjsZDFu3pbHmSOitRAJ/BHkUt8f62jTUTiOjLSE662WWAv18sg2tb3liXmWS2dgZ4N4+WJsdvTNwrAviWqQ+eRuRKiWBRMIY5VoY2WX1RiW/jQi1nHTRikhiRrfSVCeBoZKhV0XU4I+Q6W5o6d6VX7iz5BHUuKnLKJr7L8O04/qU5CbAi3oOz4qHBEXkZZtbgKiCxaDhNFA2c/0xN9SkIB+2tTuD7Uw/nhYTbb4+pxP9KmZFPwLqxEGAM3dE0EvhWCE1I2pKdxsQDRPonXCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a6/bQmdXoJ6uzT9OnqmfZQ7nukWetIkFgc9CLVrh1k=;
 b=cF5DvQhu4ZCQs+h1Zc2DiDR11s4nGoXuCJ2kESWwJBTpWWyNCiAAbtXAtOkt3ycp3YYsC0vlZRhlp/pzTlKdf+Hn2k7EoYtMqsCnheHPlWC/HbAbMcgwoCMMWXGn8qnEd1u8skiTUuisXYFIPIl3rQi06ADwlRbccs94JUNRYtV4JK7LTLsM51voRTTiyOulL+X3nre8IcDpd5JSEt0KvCeDVTmfa4ifYcoiHb/89D//SBz1LO0kIcgXiJpqUyvoFbIu2GwM29MG8zKsj1jhH8B6nXk88+85kIOXrQnvgouhLLr5iSZXMcCUje/e4pkGc/S8IWbNKx82ieMioP5MPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a6/bQmdXoJ6uzT9OnqmfZQ7nukWetIkFgc9CLVrh1k=;
 b=Sjlk0WWCiyyCTW4GQtIvJMLniftPIvzEIR0MX0c/0/WCBIFhCQnSJFdnmxalwpKV0hg8XDXfobIeh2UlR8AcX6N0TDNuNkkanlw6ytZ44oWQqyM65meH7ql05tNeLjjxGR731CiQh4fe0gpZ/fKTZck6bWfUmyIKDrWMPrbdQ7w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB11019.eurprd08.prod.outlook.com (2603:10a6:800:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 11:34:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 11:34:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] What does "do_menuconfig is disabled" really mean?
Thread-Topic: [OE-core] What does "do_menuconfig is disabled" really mean?
Thread-Index: AQHap4C+PZEKiwVRn0++zSgFktazPrGZuukA
Date: Thu, 16 May 2024 11:34:16 +0000
Message-ID: <5CA79700-0B9F-4593-83B4-731FC508A6E2@arm.com>
References: <e56f7e6d-d5e1-419b-a52b-c1e25f984343@topic.nl>
In-Reply-To: <e56f7e6d-d5e1-419b-a52b-c1e25f984343@topic.nl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB11019:EE_|DB5PEPF00014B9E:EE_|PAWPR08MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bc3550-ee75-4911-3b48-08dc759c23d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VWlwSmJTOW9QeThkeXVBMll2U0E4Vm9OUHdBbU0wUURnZjNjZmtRTmJyaksw?=
 =?utf-8?B?Mk9XZm1iVGtxa21YbXF0WEZyWFJXc2FzOXJjcVhtOFQ0TW11ZnJkS2tkT0xC?=
 =?utf-8?B?SGN5SEpKeitKc2JhNWYxMGVuUDZVblFPR2pIMDVya1ZDWHozbThra0w4Tmcw?=
 =?utf-8?B?QmszaC95NEpKbFdpMG9xYU1Yb3ZtOU9OcWJQV2YxZEJqeVpBdHFNUmZaaEha?=
 =?utf-8?B?UDRndllaNnFtMzdqU2ZoalpGUWFsT1gyVWx5eWRTSXVvVUZOWXBMM0pTUlAx?=
 =?utf-8?B?UnloZWNtdmFWNzdlZ0RXUW5hQUQxRzhPNG53aFFJNCt2Q3BkdnpMQno1Vjkw?=
 =?utf-8?B?djFpK2QvSFhKdEQybWJRV3FsVjV4NXlsSm13SkRtcTYvK0hwNjFYUDN1bDc4?=
 =?utf-8?B?Y0hNVW0ybEhsQ2pOdXZsNE0zeVR6czFEOTkycWVZOC9IZkQyOC81RTY4MVYr?=
 =?utf-8?B?bjdpRXRLell3UGlDZUhTL3hvMW1yaTN6NDY4NUVBazE2SUlZT21lZXBNc3VE?=
 =?utf-8?B?SkRPNW1Hd2VHeDhZeWhNTHpseDBNMHdNdlFyUDJHK2lwNjloWkdndkVkd3p6?=
 =?utf-8?B?QmphczA3MFhCZTZkMFBxUFZQYzE1bC9JN1JtdHRYUTBlTFNYQWdKRkwvRDhZ?=
 =?utf-8?B?dm1oVTVhQzhFMEdDenE4RDlDL000ck00ZzdvOTVDYWVnSDdpR25QSXdnU1ZF?=
 =?utf-8?B?V2VTdnlBRGtVcGVOa1kxUERaUGFoenNYbTNrVG5wZ0pwN2VuTWF3RkMzM2Iz?=
 =?utf-8?B?QkIyV3hKYm9VZVpJN1BXMm5EZndRa083ejdSMERkbCs3SG1RN21SdTU5aitC?=
 =?utf-8?B?Qm1nZlRSVENXK0R1ejg1YXBBVU5CRUxOVVVVUmh1Wmh1aXpEVmdQSnZRSlZI?=
 =?utf-8?B?YzFxSWVRQ29VU2hRZmsvNUtNb1JmZWFZTzhsQzlpd1dKcVR3bUpxNk5IMlZU?=
 =?utf-8?B?ZEZQcUxzNUhTZjlxUFhnZ0ZRVkh2Yk05d05jMVpqK2Z6Z0FjOC9saVpBM2tk?=
 =?utf-8?B?TU0zNmtvaGhnaWRFL0xRV3h6KzE0T2cvZWR4bGNJZjdPSmVjQ1hCUXR0dy8v?=
 =?utf-8?B?QVVsOWRySzB6MktrQTJPN1NaWll1akxZOUZWVHNMTnNtbFlGOFNtanl1WGUv?=
 =?utf-8?B?cFExZWhxVVRaWklPS2JpdE0wVml4Qmc5VGZIeG11NGJJZDNycDY1K2ova3Q4?=
 =?utf-8?B?OWE0YUlRY1JjSlVqdWN3SEpJelZsOG1kMGNqR3pFTXdweGdsOFlRaFdlQlg0?=
 =?utf-8?B?aFM2NFBHV0NGS05IQVY1NWxFcDZCRzkwcWVWVzJtT05FNlJCQWVZSFVneWhn?=
 =?utf-8?B?S3N2YWJHS25EUGMvK05kSHYwUkZmdjhBVnoyS1gyZzhjdGxPMFRMVHVCVGp1?=
 =?utf-8?B?a0svTHJwV3V5L3dnWXQ4WmlleW5GcjNkbjNQWGl5N3J3eWwyWjk2ZGUwNXRE?=
 =?utf-8?B?ZWxwMnp2eGd6WGUrYWRtZjJkSlRid0YvRzR5eXJpQTVNNVE4OVM0cXY5YytU?=
 =?utf-8?B?bzd1ejhKWW9iRFBvaDJuK09VNkRzVzliVHFnVVZ5Q2ZEOURqTVlnbGhic3hn?=
 =?utf-8?B?a0c0TEZoWFRscmN4Ri82NXdSMEwrTktOK1NROWY0eno0K3pPNHhLOWh4K3lJ?=
 =?utf-8?B?dEpQQlNmVWJDY294dmlxM1NyYnhISTdhWDBCbjBNaGIyUGFlSm5sNTd0YlJ6?=
 =?utf-8?B?QWlWSzQ1TE81blF3TjV3aVFpVDd0M0l2c2F5MUlXTVZUeEZRNGlhZU1SUFVI?=
 =?utf-8?B?MUdkUzl6d0tHWlVxMVVNVkxhVDA2Qk9DbFV2UjZzb0g2RXM4Qll4K1Z2ZUFw?=
 =?utf-8?B?SjBtR0ZwaExNQmFlWXlYQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D6C6FE51356EB429198CC77A97610F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11019
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31df493c-c1c8-4316-0cb0-08dc759c1e9b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|376005|35042699013|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEpOUnRWeDltRER2QVFCVzhXUzJGRjRLV1A1Z29OMlJqQkpwQTBhV3IvcWZO?=
 =?utf-8?B?VUVPS29ILzRyWG5aU0hzTnE2eVEwVTBDTUduRi9nNnNDeHNpRWpMc25lemVi?=
 =?utf-8?B?Q1hmYXRRWFBaQ2VFT0F6a3RJOGZRVEEvSUFnSktFZzg1dmlMeTNKc29wbmxk?=
 =?utf-8?B?K1ZlWjJLZjNYWVFrM09YRUVLWHdiWFBQNWhYdTViVUhsSkJkYXdxVW94YjBC?=
 =?utf-8?B?aFF4RHVJck1qMnJWTVFmd0tvUXRyRHRtOEV0YWwvakdESTY5MStrMC9haWVJ?=
 =?utf-8?B?WUVYUitQbjZCVGxkTUw4T2EzUWJYTnErYk9INHFldEI0NHZjMXVJY3g4Ynhq?=
 =?utf-8?B?TitJMGtvRVBmV3dpaGVKeDlxVktBcUZFeThMS0RKa0NYdE55bWMrMmdqa2Zx?=
 =?utf-8?B?Zmh1TVR5amtDNlBKb2I5YWdhajlQQXMrTVBtQTFTTExOKzEzRDZmUnFrWEk2?=
 =?utf-8?B?NUc3cUJMOGgycmxLTWNvNWZGMWM5ZlpPNDNyN09kUVRSa2hweWlPTHZxYzFQ?=
 =?utf-8?B?YlcwdXFndmdBOVZWOVM0S0I0Q2NFTWxhd2FJdlo4c0kyTjVMYVBiMVJJVzFo?=
 =?utf-8?B?MlpuUHBRcjkvZVBDM2ZITzVrQmpNVERCdkVLKy9XMXY3ZEl4Q2g0dmZtOFpw?=
 =?utf-8?B?VVFjaXFLYnVIQU9NM2NSVjV1QWdsdmg1OXJITjBVbzN3S0JhWlB1V2VUTkpn?=
 =?utf-8?B?aE5RTnVRUk1udng5YUdHTVd6UW1xN1ZVWE9MVGtRL3lBTnBUY3prTWw1MUpm?=
 =?utf-8?B?eFJoZjMwT0RJS1k4L3BFMGtZZXJuOHVENzNITnFUMWRzUitYd3pWSjRXenV0?=
 =?utf-8?B?OU9GTWcrTk9NQ0hnUW1xdzVJZ214M0hhQmt6bkppOGRMT1BMUHUwNmkvUGR0?=
 =?utf-8?B?QzRZSnlDMDRyaWd5R1NuWXhYc2hUb2svVUg5ajFBa3NSQ3hWSTBONE9YUnk4?=
 =?utf-8?B?L3hZOVpVTkpETmg3aEg3eHJtTEhraEFMQk40dGx0eGYvK3RYbDdaaEJ0VG1w?=
 =?utf-8?B?ZDM1cjlvZitvMm9sSW8vcjVZSEpJcHpaajN1NzQwd3dPOXZNRjBQd3V1ODUw?=
 =?utf-8?B?ZXYxaVhNTVVHMkRWRlVHZHArZ0tHdWlmWEtPZy8rOEtWemlJcmtZZzFkZ3Bm?=
 =?utf-8?B?eXJzU1I3RDNxM3o5T0N5d256OVhlM1F0djFucEJCVi9oeHlncXByMGU5SndM?=
 =?utf-8?B?VFBLbmNnNGZiYnBKckNtMGtUNU1KLzJCdHpmNFJCQWs1NnV1V1hWRW1ieUxF?=
 =?utf-8?B?a2JUbHFUaGZzTFhiUGlVaXJBWDZiN2pHa2w3RnVjb25tQ3g3YTdKSXRoTDM0?=
 =?utf-8?B?VHlwOWZCbTRWcnRNL1BVd2hkQWRTc1FsUFZnb0QxcW5GTjN3MGt0VWFaQTM4?=
 =?utf-8?B?QUJvL1lyZWFTVmUxSVhQWm5RdU05UDZiak93SkFDTEdhYytNQWlTaS9kSUxu?=
 =?utf-8?B?UmZmZWtrbys4WW92Qy80cDh2OWtwbElpY0NJYWpPbzJuOTJvbEM0cnI5MC93?=
 =?utf-8?B?clAybm9RV1BvaGxmc2lLVHFYNDhqR3Q4KzJkWWh3TFpQaTd2cGZwWGZVcHNB?=
 =?utf-8?B?ZmVFdUsxcm8zRG01aHJnMjh3bUxWNlB3NDJubGJBRWFGK2xTSnZlNS9nQStR?=
 =?utf-8?B?TExQbG9EZFdlRUkxaHBGM1VvQWNWajRMcHZ2Z1FzYlhKNExpTjVwUGFab2ZJ?=
 =?utf-8?B?ZjdoanZ4cjdId0VyQkZVYUNaUEVjSnFRK2lJajlWWlRXVVhlREJyaFRVN1hp?=
 =?utf-8?B?LzBST2pURVFPZDM4a1BKeG1EV0xnZmJlNi8xVVg1YmpTeDAwV2srQUt3RWpX?=
 =?utf-8?B?czhIUkdVbGt6NXhVbDBDMVZpV1VuaHRtNEpybTRpcUtJTkZqYkpkZEVDLzFp?=
 =?utf-8?Q?KBtC6d3yAu6JW?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(35042699013)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 11:34:25.6201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bc3550-ee75-4911-3b48-08dc759c23d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199482

T24gMTYgTWF5IDIwMjQsIGF0IDEyOjAzLCBNaWtlIExvb2lqbWFucyB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8bWlrZS5sb29pam1hbnM9dG9waWMubmxAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBVc2luZyBzY2FydGdhcCBicmFuY2gsIHRyeWluZyB0byBjcmVhdGUg
YSBrZXJuZWwgcmVjaXBlIGZvciBhIGN1c3RvbSBMUzEwMjggbWFjaGluZS4NCj4gDQo+IFRoZSBy
ZWNpcGUgaW4gbWV0YS1mcmVlc2NhbGUgZm9yIHRoZSBsczEwMjhhcmRiIGlzIGhvcGVsZXNzbHkg
b3V0ZGF0ZWQgYW5kIHByb2R1Y2VzIGEgNS4xMCBrZXJuZWwuDQo+IA0KPiBTbyBmb3IgbXkgY3Vz
dG9tIGJvYXJkIGJhc2VkIG9uIHRoZSBsczEwMjggSSB3YW50IHRvIGNyZWF0ZSBhIHJlY2lwZSB0
aGF0IGJ1aWxkcyBhIG1haW5saW5lIGtlcm5lbCAoSSBkb24ndCBuZWVkIEdQVSBvciBmYW5jeSB0
aGluZ3MgdGhhdCByZXF1aXJlIGZpcm13YXJlIG9yIHNwZWNpYWwgZHJpdmVycywgc28gbWFpbmxp
bmUgc2hvdWxkIGJlIGZpbmUpLg0KPiANCj4gSSBzdGFydGVkIG91dCB0cnlpbmcgdG8gZ2V0IGxp
bnV4LXlvY3RvIHRvIGJ1aWxkIGZvciBteSBib2FyZCwgc28gY29waWVkIHRoZSAic2tlbGV0b24i
IHJlY2lwZSwgYWRqdXN0ZWQgYSBiaXQgKGFkZCBDT01QQVRJQkxFX01BQ0hJTkUgYW5kIGEgZGVm
Y29uZmlnKS4NCj4gDQo+IEJ1dCB3aGVuIEkgdGhlbiBydW4gImJpdGJha2UgLWMgbWVudWNvbmZp
ZyB2aXJ0dWFsL2tlcm5lbCIgSSBhbHdheXMgZ2V0IHRoaXMgbWVzc2FnZToNCj4gDQo+IEVSUk9S
OiBsaW51eC15b2N0by0qLTYuNitnaXQtcjAgZG9fbWVudWNvbmZpZzogZG9fbWVudWNvbmZpZyBp
cyBkaXNhYmxlZCwgcGxlYXNlIGNoZWNrIEtDT05GSUdfQ09ORklHX0VOQUJMRV9NRU5VQ09ORklH
IHZhcmlhYmxlLg0KPiANCj4gSSB0cmllZCBzdGFydGluZyB3aXRoIGEgY29weSBvZiByZWNpcGVz
IGxpa2UgbGludXgtZnNjbCwgc2FtZSBlcnJvci4gQWx3YXlzLg0KPiANCj4gKG5vdGU6IEkndmUg
cnVuICJtZW51Y29uZmlnIiBhIG1pbGxpb24gdGltZXMgYnkgbm93LCBmb3IgZG96ZW5zIG9mIGJv
YXJkcywgc28gaXQncyBub3QgdGhlIHN5c3RlbSkuDQo+IA0KPiBJIHRyaWVkIGFkZGluZw0KPiBL
Q09ORklHX0NPTkZJR19FTkFCTEVfTUVOVUNPTkZJRz0idHJ1ZSINCj4gdG8gbXkgcmVjaXBlLCBi
dXQgdGhhdCBhbHNvIGhhZCBubyBlZmZlY3QuDQo+IA0KPiBUaGUgbG9nIGZpbGUgYWxzbyBjb250
YWlucyBubyBpbmZvcm1hdGlvbiB3aGF0c29ldmVyLg0KPiANCj4gV2hhdCdzIHRoZSByZWFsIGlz
c3VlPw0KDQpjbWwxLmJiY2xhc3MgaGFzIHRoaXM6DQoNCktDT05GSUdfQ09ORklHX0VOQUJMRV9N
RU5VQ09ORklHID8/PSDigJx0cnVlIg0K4oCmDQogICAgaWYgbm90IGJiLnV0aWxzLnRvX2Jvb2xl
YW4oZC5nZXRWYXIoIktDT05GSUdfQ09ORklHX0VOQUJMRV9NRU5VQ09ORklHIikpOg0KICAgICAg
ICBiYi5mYXRhbCgiZG9fbWVudWNvbmZpZyBpcyBkaXNhYmxlZCwgcGxlYXNlIGNoZWNrIEtDT05G
SUdfQ09ORklHX0VOQUJMRV9NRU5VQ09ORklHIHZhcmlhYmxlLuKAnSkNCg0KU28gaWYgeW914oCZ
cmUgc2VlaW5nIHRoYXQgbWVzc2FnZSB0aGVuIF9zb21ldGhpbmdfIGlzIGFzc2lnbmluZyB0aGF0
IHZhcmlhYmxlIHRvIGZhbHNlLiBVc2UgYml0YmFrZS1nZXR2YXIgdG8gaWRlbnRpZnkgd2hhdCB0
aGF0IGlzLg0KDQpSb3Nz

