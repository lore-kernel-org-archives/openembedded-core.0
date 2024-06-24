Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FC7C2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 10:59:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web11.137873.1719226744822915454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 03:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Wvyir0eU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Wvyir0eU;
 spf=pass (domain: arm.com, ip: 40.107.6.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BeHcLun5KwmncvEUDUvRwI75TktN3sOE2qxcOQXwm2wBSE/UfCJr2ZuWTKZrCvC+FBkxjsZZhVD2LfiMuK6PTqOhT51AL5CAQ6cUkdPZhGOz33ZYllpPcCKa5uy41VhESo7fQdgltpi6heYqxB4TvgEfUPj5I/dO+1iDfFx/1Y+bvhxlOsJgtRR37sL+SiUYMsqqYknHz+SCJHpfd6qbY7xb/tIP4z3cxJIevhs6IX/Q/p9TYpGSAW9eOfP2uoSBfZNId33OlZ5zF3mA9yzmih3ooPYp7GT/9xcyPVFtBLHNNzK9XqgTHqTQsxfkf7MjYUTU2kuC+dClTewN/gOWcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOxQjmWuMp6pO+0NpRfwptJbXyMc6losQxEmxzl+xq4=;
 b=KoxTj21+VqV6rTADCXgQ5ugOe02AVhY39EFXxH9AjMOnvRzTx1Um25z0or6BRZ2qa5ljGZHUl9pqKRSVUSVXWfP7+jNn7ziui7lEDcscvPgW9E0SKR+XFE38eyKubLdTSMWh6M9vHBRpkk40wQrS1HQuYVOdht19A3ohTY2LhFo8AdbZc6mDZ9SDKuquYQ6boZcbVKMRn5Oj/5X/H+jxdPGWNuiWdBQ1QoEVsdjSz7PAUA5z2RYcCeHmyOhLpat0U0UomgVuMfXnIoEXmdlwKMFMb4Uqwnt1oQIXMmWt+Ljcm4hk9Pr7gSuGbt+yivsGLM2M1lylvaLnyTAFfHtXow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOxQjmWuMp6pO+0NpRfwptJbXyMc6losQxEmxzl+xq4=;
 b=Wvyir0eU2Fomh9T+Df80sRf44tOmILnlTBdVVoc2XgNYbsD4YxlxElBYQK5F32BuXpyfQtAndJEzNTD/Cs37DE4kFp+pxi7VRVIGmNyCnPQjuaaT/FnoMMNCUm7V4HkCtkCU0TbWZtram//1qP3Pe85OcJfG0Uo//ZvguuoYoS0=
Received: from AM0PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:208:122::27)
 by FRZPR08MB10925.eurprd08.prod.outlook.com (2603:10a6:d10:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 10:59:01 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:208:122:cafe::85) by AM0PR04CA0014.outlook.office365.com
 (2603:10a6:208:122::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Mon, 24 Jun 2024 10:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 24 Jun 2024 10:59:01 +0000
Received: ("Tessian outbound 9f627775ce8e:v347"); Mon, 24 Jun 2024 10:59:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7157b6753d350195
X-CR-MTA-TID: 64aa7808
Received: from 7164504b2285.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A1508AD2-239A-46A0-8B03-2A731EB42F31.1;
	Mon, 24 Jun 2024 10:58:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7164504b2285.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 24 Jun 2024 10:58:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISJ4YuuSAUs5LkKiDpQtxOCenCpTwIXJuN1dx4Y+77q6EZOCvhRDSKM0QXF/GBgaYFuATg3nt/sgyN+/x5+CB1FflEVov4SX10XImOuRKYthC4NGdKnytAAKhuqzGdcDnY4cs2u7dxX6kLSulmRCntPxy15XiFvqAzb3mVOQpV8TzFV4Ra4HcMDmeGnfh5kwKq8278kjIsuBLm434jYJ9gmgff8s5Ckb6sA6sl5xHqF/mFan3MG97Duv18kykIhshPH882MhHi9MwQPba2IqTVVuvPTAewdNZm9lokn8UPgg/EmWIABfyuwjfGki+0BTtnJ4keN8pzU7EjEDleYSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOxQjmWuMp6pO+0NpRfwptJbXyMc6losQxEmxzl+xq4=;
 b=PqHjRHRwW6lrxiuZxsG4RJZxhWRjY3oGDAo2dJ95JUflM8Gqk5V3fu7TgRE02fLlIqqCQ8/chR3hd+JSXkxevCOwailpF7CFI/H0XFdYGtKxF/pmwgtu3Yv6kb379LOFGVudyY36EGeb2GshHnT+NjcOZdee6nB2KeIfoO0k0ASziwSLarQ1sSbhg4k8jc/03Nzbwa619mrr6BetbH76/DTmQJaxyd0ilVz2+SzPKkk9pvrfAPx08si1roZU3VwDBB4NczFpbJtkMULcHYNKz+x+h9cK7LpzsYjbkcIPXqguyVfRIFmaXVGeRqvMC5PD7pxDdQVTSHUkFkk1aj3s0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOxQjmWuMp6pO+0NpRfwptJbXyMc6losQxEmxzl+xq4=;
 b=Wvyir0eU2Fomh9T+Df80sRf44tOmILnlTBdVVoc2XgNYbsD4YxlxElBYQK5F32BuXpyfQtAndJEzNTD/Cs37DE4kFp+pxi7VRVIGmNyCnPQjuaaT/FnoMMNCUm7V4HkCtkCU0TbWZtram//1qP3Pe85OcJfG0Uo//ZvguuoYoS0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7642.eurprd08.prod.outlook.com (2603:10a6:102:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 10:58:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 10:58:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudnimar@noxmedical.com" <gudnimar@noxmedical.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from
 RDEPENDS
Thread-Topic: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from
 RDEPENDS
Thread-Index: 
 AQHawmqoWjRk5aOEm0iOHXoU6/dsYLHPUU4AgAEaUYCAABbwgIAAAxcAgAAVTACAAT6lAIAAOdyAgASyqAA=
Date: Mon, 24 Jun 2024 10:58:51 +0000
Message-ID: <5AC01807-D515-4C5E-9602-DFBFE3C61CC3@arm.com>
References: 
 <CANNYZj-EGg9+gAJroitaLvm0hxKco7FjvsPnVvwAb2DXnnmF4Q@mail.gmail.com>
 <6942.1718968451842741709@lists.openembedded.org>
In-Reply-To: <6942.1718968451842741709@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7642:EE_|AM3PEPF00009BA0:EE_|FRZPR08MB10925:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe1ea68-b56b-4253-3f63-08dc943ca7a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WTJzWFZaWE13MFdoMXA4b1BpbzhXR1ZGNzRrTW5XRTJPWlpCdnFIRjFyQXJo?=
 =?utf-8?B?NWNMdi9iUkhVOGp6QUE0U0svdTJKdGNCOUJyMWxFWXBOeE9HbHdYd0Y5ZERU?=
 =?utf-8?B?RWtOM0M1OEZXd0s1ZWZEQlhycnlNbTNYUng5NmYyVWxHKzFFS2tEdnVITVhy?=
 =?utf-8?B?VEZFVUM1MzNRdjVRTHR6VUNtQ0xTNHdzZlJURTY4cUEwSmE5OG9kUTZpdEIy?=
 =?utf-8?B?bG85QitPMndjOCszNEFXTjRQT0Voc0pYUTZyeStEUFRqMDNkN0crYU9pdXZm?=
 =?utf-8?B?ZlZqSDRjdzJ3Z2N6NWdNQ0dHN3MveGZybWwybHQ2WlgrdkphdlpPcGhQaTJZ?=
 =?utf-8?B?NmJzWDdKU25heTBONHI0cnlWOTRMTHByT2poNDV3WHg4VkhrL01DVDJFMDlu?=
 =?utf-8?B?RlVjRjBPbmdPTlZXRXZyVXJFWWJFRkl3MFpHMUM2M001My9teFZwVldvOCs0?=
 =?utf-8?B?YlRDR2k2dHBxMFU3TVVkVWRoZWd6RjA0TnBEd1NRcG9aZFpFQUNyNUR6Y0pi?=
 =?utf-8?B?M0hUZFJRNEhxZ0lFdlRrRXhTaS9mVWc2NTZJcW0xWmEzL3NGSzdQaXR0ZVhs?=
 =?utf-8?B?MDFDTnZ4SWtuN2E4NUVVdTdobmViTkV4OWJNd0N5VUZKVzlEUmJIdmFVOGFl?=
 =?utf-8?B?OVFPWWgvN1FzNmJBWVRhOHhRSHZ4dXRoM2VQdGhndS9IV3JHOWt3UEJRdVFh?=
 =?utf-8?B?cTJnZ0tPTDRPeFR0RVU3UEVsUmlGNXNFd3ZuNkd6TGpYcXNsaWpvMnBsUWpl?=
 =?utf-8?B?YzBjK1hVNzQ0Z0hKbUNuSFZ4RUR3TXUxZ2h2bDV1RUxaNzhpMG1jNDZiWGVM?=
 =?utf-8?B?amdNaXdubURGMkMxbDNDaTl1NDF4NHlaYWpNY2VEdjhZUlpDODNNTEpKTjkx?=
 =?utf-8?B?UkR3a2RkWG5jN0NWNUU1NXZGRFpqSWg4dHlzaDI0cWhrKzltL0gwSTF0TVg5?=
 =?utf-8?B?ZmVjc3R1YklUNFFPYVB1V3ZYeUowNUNWbGVsVXFtKzJjajBMdkJteVFNbVJq?=
 =?utf-8?B?QXh5SW9oS2UxOUlCTWxZTXNFSEovV2ZMbTRSUitQZzhnM2YzOCtGNk40U3E5?=
 =?utf-8?B?ZW1idGNOTjVNUkh0OXY1S2M0bGh4b2pPMldqeTRoVEJIRm9QYlllVzBBcmR5?=
 =?utf-8?B?bFE5ZTVnOGtEK1Y2VlRUWmFmZkVjdjhBOWdYQmxnMkFIWW4rR1VFOWdQZFZI?=
 =?utf-8?B?QkpiR2ZJdjRiaVVvdGJHcmlrOW8rQnZsVm9WL0Izd1daODZyVTd6OS91VS9Y?=
 =?utf-8?B?aG1NWnMyTmV6SVBYWE9teHRqV3I3RmJDdSs5Z2pheDdkbHRBajI1bUhFOHhr?=
 =?utf-8?B?TDd4RmJIajRDbFhGakVVR3dNUjIydEZTZlhGMGhaRXNqUlVFZmNBdGlURWZD?=
 =?utf-8?B?b205ZVJUaml4cHpBUEYyd0cxQXRCNGl6MExETlk2SmhrZUdyYmV4NWVLd01n?=
 =?utf-8?B?QTBLOWNxYUFuem44RHp3S3d4YzZBM1JaODBneG9FSmx5WnVsQ0w3c3VIZWRB?=
 =?utf-8?B?Q212b0gzeVBCalVFZms4VW9RMGNOMDR6eTFFZm9zZVBIZ2oxMGh0Yk50R1BJ?=
 =?utf-8?B?UDVZYXpjajMxL2RhajJCQ0Nsdk9yWEkyR001TGc1WlBKcmNWREdiWkl2WlhQ?=
 =?utf-8?B?enA4ZmZaZFhrTGptOUZlbVJVRS8wUjdFR3VxOG80cEVTSVJJV1FyS1hydEtk?=
 =?utf-8?B?dEpWMm05ZDVnemgya1l5V1hiTGpiY0UybFovdFo2cEIvWUxKMGhHbSs3Sjg2?=
 =?utf-8?B?RndLeDJ0T1k0Zmx4eTltaXAvZ2JETlVOL2I1VkRVNTFOYUI3VVhKSE15V1Vs?=
 =?utf-8?Q?Z61sMP/EUXXJpxrDmYSBZUL0Nhp4x6Vx76n2U=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C85D91AD7CFD1045B464987FF303BF46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7642
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cff800a0-e8f0-4c58-a4c2-08dc943ca1a7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|376011|35042699019|82310400023|36860700010;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZEN6T3FZUnlMUWtwM0U5TitXRE1FRzNxVGZXak9oeEZJZ0U1UW1YMmZ2YlNO?=
 =?utf-8?B?V3p2WkNkNGZPakk4U2xTQTZyRlFEUU4rR0xGVzJTWFdRMTM2M0g2MTY1WU9p?=
 =?utf-8?B?eUVBRVJZSkZocmh0NU12anE5V3A2K3ZuUGZYbTVRTDA2V2VTUnV5VkZKcDQy?=
 =?utf-8?B?b243NGpSQ2Y5eWJlSVBHUHdvcm8xanJ4eVM1MEdZYWJIZHNGb0Z5VGoxSkdG?=
 =?utf-8?B?THduaXFETXM5QVp4ZjVKMUlLZUZFN2Y4WlgrVEZNMGFQak9oVWVSTXhyMmZC?=
 =?utf-8?B?UXZkQU9CUC9mVFN1SzRTVndIRjZ6U0ZCN3YvUjRJdWppc1g0QjFuZFcva0ZL?=
 =?utf-8?B?UnR6enkzcml3N0MrOVZkU0tWNkVNVGV6RWhNempheVE1cHlIVm5hakpXVy9n?=
 =?utf-8?B?YjdvTEYwdEkzS3VFSmRTcHZQWjJiaW9lZVdNVXNWeGN4T1IyanpJbk5raG1l?=
 =?utf-8?B?RG9UK3VMc1EySGdkQ2RHTFlvRW9halFhczhmbndmd1h6SlZmMGVzbk42OE1n?=
 =?utf-8?B?WmdVTkRzMm90Z3lBeHVIV1hQNnhCTFdhWXIxVFU5S05jdnZmcWZYamZKdDMr?=
 =?utf-8?B?eXBDS0xkYlFyb0p6a1pkb1pMckJQb1JsOXRNTmEyRkI2a1R4VVV6bC9tTW9I?=
 =?utf-8?B?U1IvRHd1YWE3M3RvK2FheHRVQzJtcDlpTmRPY0JvTEdIVktPMXFFWklRanB2?=
 =?utf-8?B?UnY4Y29JMVFGbWZYWFJKSTN4aGsxTkQrenVvRS95WnlBcENmbVZCR1lMYTFB?=
 =?utf-8?B?c3lrTzFaeFFHK1E3K0xmNzdRUHZJSjJSb3VHSGtlY1Z0ODFNZ0lFVFJXdkp5?=
 =?utf-8?B?ZDVZUjdMTThwV1p5R2YyZElJaFAvY1ZMSHZXUGlzQVpGRVlJZGlaVFpCUXM3?=
 =?utf-8?B?TW1yZzhHbkZUS1psN3pFa0tCOC9ZL3drMlNBbXRNdWlXUVZTR21WQXdVZStR?=
 =?utf-8?B?LzdBTU9oRzNUcHF1U1c0WFdoZTgwdFg1czNhYTZjaWtNR3p4OGtxS2ZsUnRX?=
 =?utf-8?B?NEhkVHBSWW5kUExwLzlGSEMxS3VjOTBOcHdPYUxFZGRoNE5VMlRVc1lNVUgz?=
 =?utf-8?B?UUppY2g1UTlxbjRMSHBwTnJtQ3JBUFpVMTdTUTVvSzVQWXIzK1RyZG1pbUFQ?=
 =?utf-8?B?Q1paZjkrVTlaZExrbUtBSlZadVQxcVcwb1J4aFY1Snh1eXRtWS9TOHhrVG5H?=
 =?utf-8?B?QUlZdHVhVFR1WFc0Uk9rRW8zWURXSnNqU2VSZVk0RWgxQy84eFVmaFJ0ZU5D?=
 =?utf-8?B?b1Y0ajF1bUl5d2xSVFZFQXBReDR1bGM0eFYrOW1CSXYvS0xveHNzYjNaVXo5?=
 =?utf-8?B?R2VTNU5Ma0drWlV6Um52YXp1MUxDSGxJQ21lTmhZaHlOMlNCVWNTVHh5Lzdy?=
 =?utf-8?B?U3ptd2o5TUdDRnZha0dEZFB3bUMwaWtvUFNoQUZqbmEwczh4bDN6cjF6My9q?=
 =?utf-8?B?RUJHTWhSNnNRZWYxOTZsMjcwbEZPemtKSkR0QTRpZWpPM1U0ZXlzM3k3dmQw?=
 =?utf-8?B?TFlsT0pvV0lUZjdueWhaK0VsR3QycUVIeHplVjJyVndPQ2VSL3Z1TVV4bXBZ?=
 =?utf-8?B?eWlqQm5xVzI4cnhGM0ZWUU9hQm56cHRmbmRtdVRSTmswSHRRb29yL3NILzdB?=
 =?utf-8?B?WmpYbmwzK1FwMnFxeEFaSzZFUTdVeSthd1hGYkxFWXVHZUkwcktMcUZGdFRF?=
 =?utf-8?B?RUNkbDZyMC91MlQwUnBrcHE5eVE0c3NzTmZ4UUpyK0t2aWpKay95dGt2ZFZG?=
 =?utf-8?B?bTFRV3FYZzBBSlhFR0xOQ2lJYWZvcXV5Y1FJcGdXWUpEdWw4b3R2dVNQY0Fm?=
 =?utf-8?B?VzNiUnk5QVdwQTMvUy9UUitoWjBlakNCTUJDR0ErcXpxb2JIQ01JYWhFRHZx?=
 =?utf-8?B?K0E2WEpkOUxTM1ZtNS9PTVhEQXB0R1p5ZWVnYlViZmkwVXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(1800799021)(376011)(35042699019)(82310400023)(36860700010);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 10:59:01.0872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe1ea68-b56b-4253-3f63-08dc943ca7a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10925
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 10:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201075

T24gMjEgSnVuIDIwMjQsIGF0IDEyOjE0LCBHdcOwbmkgTcOhciBHaWxiZXJ0IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxndWRuaW1hcj1ub3htZWRpY2FsLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IENyZWF0aW5nIGEgJHtQTn0tdG9vbHMgcGFja2FnZSBzb3Vu
ZHMgcmVhc29uYWJsZSB0byBtZS4gDQoNCkFzIHlvdeKAmXZlIGEgdmVzdGVkIGludGVyZXN0IGhl
cmUsIHdpbGwgeW91IGJlIGFibGUgdG8gcHJvZHVjZSBhIHBhdGNoPw0KDQpUaGFua3MsDQpSb3Nz

