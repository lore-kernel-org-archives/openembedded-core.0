Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5A7D41C21
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 11:07:02 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6994.1765451212646183180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 03:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FdvnKiJF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FdvnKiJF;
 spf=pass (domain: arm.com, ip: 52.101.69.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PUQ/cvpe3s68fk3bRf6RmhP5afFE6OLoZYe3Vj1SJetSw6M7iXoVII8z+uutQ+6C13ArEMI8iSP/P/4IIESIETzyjvtoevJJS/Xvv4fzNh3j9/pqcevxaR9APUCpZborl/ilrR2DSlamUG2FGZ991tYrxFtfbiBI8C0vnujdGCtDHgBsyhry05YPoHMNBvykb+0/DyQzFDLsIJxOuOmmJuCXXgZ1UaI0iPdNw9Qf2vvTBjOPp4AYwtp31cT0m4p2SU1ouWr5vdrl2w35H/KAlYYIv9ei4TlgNQ8bRE7J3PMAIYVg4/q5MGyNgbezXwBFhr6EUNZ6VgJWV+d0u6Y8Og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrH08KnSI6W4RkiC4Iv8dfhFRnrWC5O5apIA4KDXuj0=;
 b=sGmfsoSxkHGDcdGcg+vXdO4AHUde6ZpQaA7f8SVAr6y1XOzyI6OdR0UW8NM8S19r7dTHEqVVGP6Aze22n42wOdjH1dZk9rx4GuH2Gpesdc2eD3Nl6piBxkIo0sZ9C6Q92oj7O2Q4N5GAI4unNlHMktp4esIHaIUAUWJOP4wd0Fxf01KK1Pb9JEbay4/wy9CKjrWNGW2EvAODZLOeD0d/G0eyV4MXlGowIaVVGWSmHmyZ11qJ6Dkaqv3t6lkHiWTkVQyl0Gp+yRn1J96iqiLjW/zmFhFBc8GpiXZNhNisJo8DONETDwGUr9ZvRrJMvgJwwAHqn9BsDKcsbTgCWyQ5SA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=karlstorz.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrH08KnSI6W4RkiC4Iv8dfhFRnrWC5O5apIA4KDXuj0=;
 b=FdvnKiJFESH07LJrLHEphhry1lJVLOcI9icC7qF6TTyRlycTOe2t1x1CgPHYWKHOaZD1vNrG2aj2d/OX4jnrOjtz5FmVsmvjzlblyFk6rTqXImizmxlwV+7fcmCGxSXuSKmhpizCXAhYtEVHcxKMZCa1/uwOvOcwyBVoacgE1dc=
Received: from DU7P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::6) by
 AS8PR08MB9623.eurprd08.prod.outlook.com (2603:10a6:20b:618::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 11:06:48 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::fe) by DU7P191CA0026.outlook.office365.com
 (2603:10a6:10:54e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Thu,
 11 Dec 2025 11:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Thu, 11 Dec 2025 11:06:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUxpCWWcvpv2tF11G5C051E2SciI5qtwOFrsgyAhcIgg9OIJ0R7FKfWI8y+D4N+XFM+PaPi+u6cb/1qtwvpVYP8Em7O89JOQ2QB4u/aMD4HMwK6ey40XsXrvLBbEfmgq91i/Dyn4upBmK3WIF8a8qbTN3Nea8ou/K+WArQGJPX62SqQfT6fiM2473S+ufvd88abHeWL/KJi3EHaoZgGE9jTfxQc5nUtgJ4X6oYTksVRPtM7iv3DOxKzwClTmDnFqTq8fHWAKaP4ni/7RHlbKhY3H1Nr7iM2eFWt/GEwJhrb0q3SlZ9GPBUob9FKXfZKU3uc+ilfV9hjr/ELCoPwf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrH08KnSI6W4RkiC4Iv8dfhFRnrWC5O5apIA4KDXuj0=;
 b=rjJRZ0YVAdgEyJs4iwSdExNkbpZSUIPiINf5QgtcehDQIkqTdlVkGKy650h7j41pcCw5kdIR7rb8ofHhk+Wz9l+yqg59nA2wromyh6eyYzHDFaSXg+qlzj+PSnwqsI7konalB+FEmm5pe2rpHju5lEGlYSISU5vKjwKQtR7C2pTjXBTNO+KAe1ORYKkXcBZK4dCxSviEnfOuXGMtFg7DnTDXQXWR/8t9bktT+pnmewoBNaaHoCHe6eZMw594EazRiBZQnJuiQvOGeyiAiNm+aE/GmYIPASn+qtOP60e1CoCugdYa0agrgQKNR/lsOeEKXYTDkAlAGiLTSZWu8kzAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrH08KnSI6W4RkiC4Iv8dfhFRnrWC5O5apIA4KDXuj0=;
 b=FdvnKiJFESH07LJrLHEphhry1lJVLOcI9icC7qF6TTyRlycTOe2t1x1CgPHYWKHOaZD1vNrG2aj2d/OX4jnrOjtz5FmVsmvjzlblyFk6rTqXImizmxlwV+7fcmCGxSXuSKmhpizCXAhYtEVHcxKMZCa1/uwOvOcwyBVoacgE1dc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9020.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 11:05:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:05:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Pascal.Weisser.ext@karlstorz.com" <Pascal.Weisser.ext@karlstorz.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] Add HOMEPAGE variable to several recipes.
Thread-Topic: [OE-core] [PATCH 0/3] Add HOMEPAGE variable to several recipes.
Thread-Index: AQHcaQ7eBT/xdN0u9Eqs0m/HgFU2XbUcP+aAgAAKHYA=
Date: Thu, 11 Dec 2025 11:05:42 +0000
Message-ID: <952C109B-6A6C-4388-B937-6200BFE718E1@arm.com>
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
 <9bc6fecf-3234-4b46-8bad-84d93a5e030f@cherry.de>
In-Reply-To: <9bc6fecf-3234-4b46-8bad-84d93a5e030f@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9020:EE_|DU6PEPF0000A7E0:EE_|AS8PR08MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a178c1-2ee4-431b-d417-08de38a560c6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d0pUVHRLUlQ1UTlCcyt3OUtBeXNiM0owZVNDQWFnaEhsODg2RWU4cDByUFRj?=
 =?utf-8?B?N3JzTVJZTDdYVkZpTHgyM0MwU1BYWHhQSGRONXI4UFhBRjFiR3pWLzN1NjFL?=
 =?utf-8?B?c3ZzRm1qN1MyN1FoUjIxOC9vWGhPcFBRUnJVdnFjejdKcVFLNzBWbFZ3ODJX?=
 =?utf-8?B?UXFBdnhrYTNKalpvQlloSVdlbWZIR24vZzJsZ09QSVc2dU9ndktobEhhRmZI?=
 =?utf-8?B?STZvR2xVSXRtaGt5MHJoTW9Oek1wYWNmT09IK29jM3hzTFBkTDBkT2F6SXNl?=
 =?utf-8?B?eFE2ZXdMdmdNMHFSZUFWMXJMWlFNem5XVm52ZjY3NnVzOXl3VCsrbTl4Zkhm?=
 =?utf-8?B?YTM4TS9jL1hNN0lKTkpkalhScGpBZ1FOakNiZjZpcHVBd0N4UisxZGFFVG56?=
 =?utf-8?B?QTl2UllJMHI4SGJDU1QzaVpkQWpabjRYd2FnQnBKSVdacmR0cFpYMG5PYTho?=
 =?utf-8?B?L1VGbDdTTHYra0pWb20rLzNaNWVjcHFuVXpiVXBNOGM5SDdiUHNER21meE95?=
 =?utf-8?B?T2pIeHl1eEVJcnltL21EWGpVNTR2a2xRUGZMKzExNVVUNVlrK1ZsbHF2bmRW?=
 =?utf-8?B?dUU5SEJndUNqelBPdkdVdlhXQUg2WlNrTXYrN0JqTmJyUkYwTHY3U0Nzc1ZM?=
 =?utf-8?B?dk5IczhtSmdoUitXN2RyWjJMVjM3ZVdITmk1VUtra0JsaE1RSVlIM3hEazJr?=
 =?utf-8?B?K3BrVDJCZzhWUHIveGZmM2ovdnEvM2UyTWNTMDdkR1ZGcDM2M25HUjg3WDB6?=
 =?utf-8?B?Y0JwRkhBb0ZvYzBETlg2YzNhcVNBS25nMDNMMEhlZkNvSnJyYXFXdE5pSnBj?=
 =?utf-8?B?ci9vZEtqdFc2dlVxS2lzelhseHlXajNrY1NVQVFUTnRxTUQxUVVwU00vRG5N?=
 =?utf-8?B?S21BQ1dCUG9WU3d4aU5kMWxGcXc5WGVZdkdBYUlWNTQ1TlVleEN5VHE3N1hZ?=
 =?utf-8?B?Z2tvVXZNU0IyVDBlN01WckNJSUZRRGpHZGhxbVA0LzhMTERaM1ZWRUxjdG5L?=
 =?utf-8?B?STFpbEdEUnRCcVVVRTZST2c4QXhXYXFqNkNlalYwY3ROMHJSTUtJM0M1R05C?=
 =?utf-8?B?aXBoZ2tFd0ZvWjA5YWxaVFIvMGc1QzVianM3Qi9rVTFhNmZEUFFLQ1JTVSt2?=
 =?utf-8?B?OTUzQ2Z3RUc1Z25BZXNZQTBiVHdEUStaRGtVSWFZOW1WZEN3ejlQcDhWQTVx?=
 =?utf-8?B?QTU4d3hFQjVpTVB2bzk4WWFjQWRuMm9McklrSTdHY2ZaSm5VNzM2U2E1TXJa?=
 =?utf-8?B?YmlLU3V1eUc5STgyYXAzbExpcFdFMXdHWndhaTBCemhUcWhVSmJlZ3gwWE5V?=
 =?utf-8?B?blFncHBlUUEyZDR1My9CbXhVd3NRVksyK25qMmJNamtQeVVyOXY4WkRCcG1p?=
 =?utf-8?B?RTRyZUVjWlpWaDJCOGhneGpwOWZhYkhLaTVsMWtacSt4c0NXclNHcU1VKys3?=
 =?utf-8?B?c25iYUtjcDlXaUlWbi9tZXROWi90TlBFYVJuMktiTEViemZZc0JrNUpucWUz?=
 =?utf-8?B?dXg3c2ZCdmNadkR1OGhLNkdpcmg1WmN3d3FVUFhqOUMySzRZM0o2UjhVMVNX?=
 =?utf-8?B?M0RaUW9DdVE3QnJkTWVqa3pjcm9LRWtQOHZDRWxRaXE2Y1ZXMDl0RXIyY1hQ?=
 =?utf-8?B?azFoRjdoTUpvOTV4OEozSUFLQ3l3cDVYZTNid2RhM1FkSmt2OE4xdjZ5SXor?=
 =?utf-8?B?RjJSa09SanpydXZJY0FmMllJUTViYWRaRit1ekUyNFhLR0luTTJOY2swbzdJ?=
 =?utf-8?B?bjl0V0JISDQydEprU3BpdWpYelNEWlBocmt5MytwRGlURG9qUVIyakR6Z0dJ?=
 =?utf-8?B?ZndRRXhSWGVEL1Zid3ByZE55QmxoZFlCcVNvQ0NCb1NaQVlHbjZ5VHF5WURx?=
 =?utf-8?B?bGI4QndadFVrQWk4d1hnNWtzRGh6alBPNXB2YXZVM2szbFNrOVRoRzdpQVAy?=
 =?utf-8?B?cGxSTmpDRTl1MUFrbHF5UDRma0JuVTRvazdrNm9FQUh1WnhIWUhiRVJTU1hy?=
 =?utf-8?B?MFV0ZmhWdFh1TFVPdzhBaWFTQ05uejY1TW5TdWRaTXFNTGtYRWtiZ1h5MEdr?=
 =?utf-8?Q?DW4oUc?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F6F367ED71A004FB9D402E99D42A7E5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9020
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4d535304-f986-4739-e224-08de38a539bb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|376014|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bGpVdU44YWhYUHN0Q1JaTzMrRnpQSXE3UHlKamFBUkc3Z0hUWXo0ZU1sYndi?=
 =?utf-8?B?R3ljMitTK0N3K2NISnB2VDl1Mmh3cW5hM3huMnVXVnpMeEhVUzhWY0lZR1lK?=
 =?utf-8?B?SGlkdmtPNTRDRTlXT1l3dEpQWEtkb1hwaEdsdkd3UU0xVUlhZVBIZ3VOZmV4?=
 =?utf-8?B?V0VZcjZac1FFQ0JIWGFtZDhYdSs1cWZTbnVGdzlLdURJbTF4QlhOZDVVM0FY?=
 =?utf-8?B?dUIyN1N3dnBqcUt5eFdhckZUb1RucTRkdlo3VmgvWXVNNWszRXdBaWFFdnNY?=
 =?utf-8?B?ZmVqd2U5Y3VseG9XeTdGTWFMZVJmdml5L1AwUDFILzBBMDlQMmozeDNCWEtk?=
 =?utf-8?B?dEh3NnRsaEpTWkloSGJkUWd2THowVUttbjBJQ2E4L0Y2a0ZobnJvcVhaTFhM?=
 =?utf-8?B?SGVxUWhteXFld2xDOUpCOHRnWnhuSi9BU24xdVNUc3U0K0k2Qm9ycjdwRHp0?=
 =?utf-8?B?emM1QjJyMEw5L1ViWk01SzM1MWVuMFdyYitZa21uZDFoYXA2UVNwcGYzaGhJ?=
 =?utf-8?B?UHFubDdqekcyTjJ6YWJYaVNtSjM2aFloZXQ4MGtDeHFxRTR4UGxJQzI3QVdY?=
 =?utf-8?B?dFhCWHM2RUFjMll5MW9XYXdsVmtHM29renpFeFhqdFExUmFRS2d0cXJlNVh5?=
 =?utf-8?B?R1pPNVZBNS92NEJZNDZsS1V6T2RIck5zdTEyV2xVSXNZYThoRXh3bjlEN29T?=
 =?utf-8?B?SU81ZDZNWHBkZlNId09vSTJVVTliYUIva3d4S0gzUnBCWmV1bC8xNkd1Y1hK?=
 =?utf-8?B?WDlOWjU3WHZZTDFLTTVoeWppcVRkV2hRU2NTc1JwQUFzaHl3NXNMSkh4c3RD?=
 =?utf-8?B?M3lHVWRYdVlFbitTeHBzbm1BR2RRL1M1dm5uZnpnRXhxdUpWQ0hSSkxmVFpi?=
 =?utf-8?B?RFdOdjJDRnFRdU9HY0EwMU9ITlVvekJHaFV2WHlSNEd4NWF6L0NyaEI2Q1dW?=
 =?utf-8?B?aWZWYlNGMkxFVm1uTmZBdXJNSnZOSVZZRWtOUVVSWG00Z1VLTWNuMVN4alcz?=
 =?utf-8?B?TWQyNGE1blRXbUpPTzVDdSsxM0l5R1hleklqTXI0WXZiZExSNnRBcUMwMFVM?=
 =?utf-8?B?VVRyZ3JRR1JYc3EwZVBmR01CMllXMy9wZDRFOXhFczI5akhKN284Z1hacXNW?=
 =?utf-8?B?Yk9tUCsxNGpLanUzTWkrcXRNUVU2MTJwa2g0N1lwM3R0cHJ1a0liazdETUY0?=
 =?utf-8?B?aStPMG4wcXlZa1RkWm0yMGRPa3l2aG50WGJsRWdqY1Exc244SEhnSFhHWnVm?=
 =?utf-8?B?aHdPMnJPOHJFR0RtUFNVcGdEZjJHSm91bE9HU3lHTDFXcTBobkRaRmNleStt?=
 =?utf-8?B?VzlxTWxVNVczeEVZTHp5Y1lZa1ppQ2grOVB6c3JGRjRVTExOc2RSTnlDMGRZ?=
 =?utf-8?B?eWJaM2QrM0RTQWdRTDB0N2cvQjRnVVYrLzllMG1VSjZ2cTZUeXVNNFV6N3hn?=
 =?utf-8?B?MnQxTjUzVEp6NmswUlJKM1JqNnp6cU0wUGQ5aFFjZ1hxMUhsVExaMHl1RTVR?=
 =?utf-8?B?TkdvVVM5Vmo5TzRsbzNEd0t4enRZelNWZjNGS3ZaMTZIT3YxbWhNNmdHdjFn?=
 =?utf-8?B?WXZGR2RPZmpkWTh1M2ZyajNrRWpnRHA2UTdJQi9SOG1ndmRWQ0RweXd2MHlX?=
 =?utf-8?B?ZktRd2x5RUd1THJMQVo1Vlo2dVN3SytNanBKQisveVovZ2lacmNvelQxRU9u?=
 =?utf-8?B?V09KREVWY0xvWHhzbWZIS2o3YjhRb21MMWNUM0NFL3FJMWhSVmx4UUdkY1lw?=
 =?utf-8?B?aGxFVkEvdFBtYTlnVmsxOHVqcEljWWU4WVcrOHdUemhsRUVOMnhsdjVhc1hh?=
 =?utf-8?B?c05MMldtSDNyL011T21MWFZrUlpkL3dISW9GOS80aFdOQnVOOUJrOFMrUnF1?=
 =?utf-8?B?cE1PT1Z0THVHWVpxT2pZTGVoeTNuNG00YUF6bVdMejJER2ZvU2ZkM0xlVHVQ?=
 =?utf-8?B?ekNRRTBXQXV3MkZGNFYyaVZlNjJIZWh5ZWdDVFNmK3BZbGt4ZHZsTERodGFU?=
 =?utf-8?B?QnFIMDVnY3BkTDRuSHBXOStlVDJDdG1tR2M5Tzd3RmRPaVNKZ0orUW9XQXNw?=
 =?utf-8?B?OUxYRlJJUjhXekdHNnp6VFF1Y3BlNTJBd2xaVFg5QTdnVmx6aWFuZWFlSHc1?=
 =?utf-8?Q?7Fao=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:06:47.7107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a178c1-2ee4-431b-d417-08de38a560c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 11:07:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227520

T24gMTEgRGVjIDIwMjUsIGF0IDEwOjI5LCBRdWVudGluIFNjaHVseiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cXVlbnRpbi5zY2h1bHo9Y2hlcnJ5LmRlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gSGkgUGFzY2FsLA0KPiANCj4gT24gMTIvOS8yNSAyOjIyIFBNLCBX
ZWlzc2VyLCBQYXNjYWwuZXh0IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiAN
Cj4gWW91IGhhdmUgbm90IGV4cGxhaW5lZCB3aGF0IHRoaXMgaGVscHMgd2l0aD8gVGhlIFVSTCB0
aGF0IHdvdWxkIGJlIHNwZWNpZmllZCBhZnRlciB0aGlzIGlzIGFwcGxpZWQgaXNuJ3QgdGhhdCB1
c2VmdWwsIHNvIHdoYXQgZG9lcyBpdCBkbyBmb3IgeW91IHRoYXQgdGhpcyBuZWVkcyB0byBiZSBh
cHBsaWVkPyBFc3NlbnRpYWxseSBzaG9ydGVuZWQgdG86ICJ3aHk/4oCdDQoNCkFncmVlZC4gVGhl
IGhvbWVwYWdlIGxpbmsgaXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYWJvdXQgd2hhdCB0aGUg
cmVjaXBlIHByb3ZpZGVzLCBzdWNoIGFzIGRvY3VtZW50YXRpb24uIFBvaW50aW5nIHRvIHRoZSB5
b2N0b3Byb2plY3QgdG9wLWxldmVsIHBhZ2UgZG9lc27igJl0IGdpdmUgYW55IG1vcmUgaW5mb3Jt
YXRpb24gIChhbmQgYXJndWFibHksIGl0IHNob3VsZCBiZSBvcGVuZW1iZWRkZWQub3JnKS4NCg0K
Um9zcw==

