Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2401C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 14:08:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web10.49866.1740060485185521507
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 06:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fpBdcLo/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fpBdcLo/;
 spf=pass (domain: arm.com, ip: 40.107.20.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wwTMdrhyLZ51MfgKcWrBJxuDObxkXdpiAtL8VTjV8Bp3H94ejb6+ygz0OXRfWxqxj1gA/iTjhmZl4SI1+WfsDhlwW/MOnNfDUNNu1HnZzxLW3vyvvu/wkULhtwuW3UBMgHSKtZUFv4eNjjAUGR0A05kejSM60D7SmjTv8+657vNiySi5Hk3lNuMr+QuSucJZ9jHyRG02UiN15qWDBmN7CereRNT5IgDy06/y2+bQSadSFApJJET6IEbFDhVdTlW1WJtUYLcNxOlrKDwcGbtjv+y8xFUDTarX61Vzfn5f04353OSqVd6xZgmxiGRKEVYjoAC+P8DIZYAXIOncP+sK2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCt5NQF0xyFwobQd5M4BgCSGmKUtuAZe+FXVxvAm1Ec=;
 b=WXBke5sSiO1ZrwEhTGSIuhY1SubJBrm43uknUkssTOCXeDCUcMvlXjTL5CaYhv3i3WPOTvsoJgd6wlDRbYjhDf0biFHThe4heVNTlD/NGRz1X9EwQxkeW7WMzXRMD5SOCLZv3MPOOXe3IMimmHOZX8l8XR8ej6VtVc9iAam/4cNWj1E+Ea4iwCEWpAmPGE1o1huqNcsHeip6USHR2k2AeHXKSXVc0/I6fkxWy6m6yejuINWFq+MecvYSm22GZPRtR6w4S7ZQmIdik95/P4A4lLQgZeliRIulNtKcnfLMrQN4wKmprXxZYK2b5jj4RbVTKgVl0Owb97GmAWp9Q22oIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCt5NQF0xyFwobQd5M4BgCSGmKUtuAZe+FXVxvAm1Ec=;
 b=fpBdcLo/Ss3LOjqjBbSdrpee/Fxy5AY2uDrPX2mpJSpM2s7fS/pvTNwXestxwkaPaqF6pbnUXz0xLihuqUzbQ68l6eP/pEh1ly4/Alw7LqpojQi/rY7m+EBUpddtFf8Awq7DjMJXc0jB+GIzLvPto5IwiHR9t84cXMzThrs5i1w=
Received: from DUZP191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::6) by
 AS4PR08MB7480.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:07:58 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::42) by DUZP191CA0042.outlook.office365.com
 (2603:10a6:10:4f8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.15 via Frontend Transport; Thu,
 20 Feb 2025 14:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Thu, 20 Feb 2025 14:07:58 +0000
Received: ("Tessian outbound f34969e68f18:v567"); Thu, 20 Feb 2025 14:07:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53f86014515cffb2
X-TessianGatewayMetadata: GcLDYeM9fa8GA6s0pVtZ2fJwhSk50Qyo3BeSnwZYmfqvTdan7BrLJN9pBkMsVmE7iuHH8fUVgszGXFTDGfI4cb2n6fCDFd5nRpwSiFTujP4uDSWIULZpzwPzI5Uc5++CKwDOScIyBwJR+tpcdGLZ3iXZEj/TNo9eP9N/oyq2hwk=
X-CR-MTA-TID: 64aa7808
Received: from Ld490d069624a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6E84EBA3-7BC3-40D0-9DCB-6A80221A47A1.1;
	Thu, 20 Feb 2025 14:07:51 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld490d069624a.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Feb 2025 14:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1BBi2EgZFIRLbNKVAhErQZ+6C5gn20fncU3mLFJlq86nHEZ/1EuzG9tr6QmA26SqYOud6zsKLOUYVCFQWm53orGG20C8YOXobVIxPhVD6gDCdoQ7UI1jkD5V08Uo8rCbx1fRs3ue0ZOENckb01iww02cuuLenVHN1+nUozK9YmUkYbR4gE12tTMByE/dSjfwtCFzcu8S1sWaoOHXrJJvuf61HAS2oL+HJcHu59tN91Q4kMXdAKJpTPuuA4OHnc0qeooH9kK9qARgLXM4KbKH/Hwajb/VMMKRzUQ85cYBaZVo0627vOsK5DKFraWoAG5Mutb9D1MA8I0wDzoKl2lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCt5NQF0xyFwobQd5M4BgCSGmKUtuAZe+FXVxvAm1Ec=;
 b=U/VrFuHEkd/KaRVj7lepjP+GsEZ6CjAPAn5eacoC57biQQcABlmxRrFsFzenYckhms/gtq89ehIFnJWeKYxzyvWup5ibOcezpmgy4S1P79NO5va/jy8FGdF4fagTwx9GtgzitupXzDoxzz584SuBIT8eB6zWCC2z8xCW3/La+6gAUrYE5Cr3wxefLuiBxHHUW4BVUuT0Joh0TbWQV/pVfWUQuh5sUIWOItuoBaZvEkNO8Mw/Bm/uo6pCM0xXQsMmuzV7Gs+pOlKkpLA9trmaZkw9CLY/HCsOepZYbqqMKudgXdI/aWFhvW4pg5kSLMc0oZfTvYO5/R7Pqoapvgma3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCt5NQF0xyFwobQd5M4BgCSGmKUtuAZe+FXVxvAm1Ec=;
 b=fpBdcLo/Ss3LOjqjBbSdrpee/Fxy5AY2uDrPX2mpJSpM2s7fS/pvTNwXestxwkaPaqF6pbnUXz0xLihuqUzbQ68l6eP/pEh1ly4/Alw7LqpojQi/rY7m+EBUpddtFf8Awq7DjMJXc0jB+GIzLvPto5IwiHR9t84cXMzThrs5i1w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9512.eurprd08.prod.outlook.com (2603:10a6:10:44c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 14:07:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 14:07:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "uvv.mail@gmail.com" <uvv.mail@gmail.com>
CC: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Thread-Topic: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Thread-Index: AQHbgrqX2sHRWL+ZiUmJxjuf9Qa01rNQPCMA
Date: Thu, 20 Feb 2025 14:07:49 +0000
Message-ID: <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
In-Reply-To: <20250219103908.42513-1-uvv.mail@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9512:EE_|DB1PEPF000509FE:EE_|AS4PR08MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b68bc8d-6fd3-42a9-3dee-08dd51b7fa99
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dFdlREZiYTEzLzhXd090ck5BMWhKSU81S0o4MlFDZUZkUms0cXJzYnZvVnNa?=
 =?utf-8?B?OHVOOURGNXpDQzRmNGoxK1l1M0FnblBiNSs2Nk1FVXRTdlBvdW1oaUlPVlZ5?=
 =?utf-8?B?Z2I4WEJWMDNKNUhFNmJmUEtVajF4MEVobmIxRU4valZwdmVzZnVqQVJLeTV5?=
 =?utf-8?B?NVdXcjZ4MXNkaGhobzh1bkxxYzJPcWk1Y3NxRDJlTHNGRzZzV2h6OXhnRkwz?=
 =?utf-8?B?Vy8rUGtncjFLWk9aYTA0NVc1dnVabFEwbitiR1hjbmdSd1pPWHZwcmY4TFdL?=
 =?utf-8?B?ODFqa08vcktGMHpNSHhzRnVKcy8zNUhQZEZSVnEzSW1KTTNzY3I2WXVUVlpw?=
 =?utf-8?B?RUV0b3ZWdnRkYk1sRjdja0FvamdUVnhYYVRUdGd5S2hCSXJaS2FjNWQxYkdC?=
 =?utf-8?B?RFlYelZzdGdWcnBVdkEwejZaNUZpaUhCT1FScXFwQmFlaWxSOVFvc0hBclBw?=
 =?utf-8?B?bzJ0ZlNOWFIzSkRQWVJRdEVtNE8xSDNNdHFENkw4V1JWeW9KWlFFNm1OSjdT?=
 =?utf-8?B?SURFWVBvVWYxaDhyYkk4cXFoN2pwL2dGYnFSQUxXaWZydTRvbXV2ODBmOUR3?=
 =?utf-8?B?UmlIMi8xY3FJN1U2b2ppeHBYdlovaFI3aXhNVHpiRmg5ZWhheXhmV25yTHlT?=
 =?utf-8?B?WktlK0lubGZINFZGbG5udzh3bTBtWWhpelU2ajJIWDlYZ0Y3UWxZK2JVc1V4?=
 =?utf-8?B?N1R5K2FFdkppcktNdkhiUmY0ZVVSUVhMQUdyUWR0ODYrN1NMNmZsWlQxcDZx?=
 =?utf-8?B?YjVleC9tZnVRRG0yS0wxMUxsN1FweVFocmFYM0Jkc21WcVppeEhlaTB1dlc4?=
 =?utf-8?B?bXVhSWFlU0lDRllwTXR5U2xuWlk4U2hkTHdPOEg0dkZPZkpuR1pIUUNCQWk4?=
 =?utf-8?B?V1pBUWluVHdIakxxdDN3UmxDKzNkNlovTm8wbWhxN0tON1B1Um1zams0YVhX?=
 =?utf-8?B?M1d0WndjWUlvODh5b2xhWkQ2Y1VPRGpNRXdHVGVTWnZ1SlpuL0xpMTkyQm11?=
 =?utf-8?B?VHd2aCtDTTE2ZkREbFVmcGhNd0UwemZLOGthTFM4dSsrNGJlNnF6dDA2SzVm?=
 =?utf-8?B?b0djM3ZPTDRJSzhXYlZhM1NRVnVSdUdUUUQ4clpiaW0ySDV6V2tYVTYybHFw?=
 =?utf-8?B?d1gvY2dpL3hUSjhMYmN6eHFwUGVIS0ZLTzlYMSt2b1hMT0dyQnZITk1NSmJw?=
 =?utf-8?B?TzcrU0U3TzNZY3pMSUNpZHRPMkptSWtQN2NweWZSOUhRSFN2c2pWZDZ3UE8x?=
 =?utf-8?B?aXpveHJjWWVhdExOc2E1RVZ3MjlWc08vVmVSNmd4NGtYOTRZS0VLR2RibFhZ?=
 =?utf-8?B?U2tEaUcxSEJTYmZtS3g2TmVuazllUFUrYWNOUHYvWldUOHAzWGEwTEp0Tkti?=
 =?utf-8?B?SEZDSHhyYmJIUTB4bjBOV3hkYTNoNFF2NzBkVHZ3Tnp3WktUcUFXL0xzM0RS?=
 =?utf-8?B?OS9oUU1aTTU3TGxRM2Y2V0cyZyt5TzcrU3ZtTzhQQmlES1I3bFh5QlROMk9M?=
 =?utf-8?B?T204bFV2QWJ0ekdETjQzZDNMOGE4dFZzOWxCOVViRDVOQXR5bXhHcXR0dTZR?=
 =?utf-8?B?bXpYb1NpM1F3aXp1cmxVY1dHRUpqTElFZkhxS2dvZlFyajlwVXY2c1lmaUtv?=
 =?utf-8?B?dkZjOXh4aXlqbTY2SGRFT3pIOWtiM2dRalBpYTA1d3dxeW5QYVhXMFBrckI4?=
 =?utf-8?B?VFh4Ujk4cmY2aEFCK2pRUjltaXRrdEZOTzlZK1UzTCtqbmVVcHRoNFRTMVdN?=
 =?utf-8?B?ZEVUWWlxWHNLVnhQdTdCZ1cvOWY4TVVObzdhb2hPUmVkd2U3YVFwSGlESFBX?=
 =?utf-8?B?MnMxSk15dVdIbmFaVDlSTysrSHpFd2s4TTQ1cFdRUk9seC9lb0I3R0Q5VU1N?=
 =?utf-8?B?V2hvZEZEOXFFbytXSHFwZ2ZnTzZMT29PV0lLVVc0OUNSWFJRbHI5VzNxOFlW?=
 =?utf-8?Q?UE8FlxsbHLzi6XahGeE4xP4n9iuQSt1H?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <64DAA726921879468F3D6F2D83E3721B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8d0a74f7-618c-4d5f-5cd9-08dd51b7f5aa
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WU1MMU9RRUlvSURFUEx1VGh5OHBWQlVFOXZiRlZBUEN3Q2E5bHcyNmxmWmZl?=
 =?utf-8?B?NW1ZRXNUNzBwRUs5UHRRaVg4UkdvVERqQWRwVjg1WjhZUVA2RkdBWEg0OUN4?=
 =?utf-8?B?c0JmMHlrNlZ3eVRKVVZlMTYydTdFcmdWc3laTkdiMFA2SStkRFdVaVdVSlN4?=
 =?utf-8?B?bGhJbTQ5L0JKRzZoaGtpa3FRVWxaOXFxa0VZNHhwN1gyRTZ6RGVueGdVU2Yw?=
 =?utf-8?B?aHRTQWtqNVZNaStzVWxMdXYxbkFEMVBkbGs1cGE3cEZiaTNod3VpTnZjeEZk?=
 =?utf-8?B?QWlKMVJoSzZmRldIbllmTGNKb2ttYnpTcVdRQlBRTTNiU1ppbVcxSElFVUZ5?=
 =?utf-8?B?dVFhd1hVREtHUlQ2LzBmMFdWbWVZRmVpVHNqL3ZJaHgzVjh5U3dNazhPL1VP?=
 =?utf-8?B?UGxTTnBFdDQ0NlprUFg2WWwyT0hHeUNYZDFlcDRZYkQ3dmxxSGRnMnRjZTBa?=
 =?utf-8?B?RFlFQ0RRdjNmekFrVnBvUWx6dW9HS0xmMVdtVHZvdDMwUnZvb3JSMVhmZXpI?=
 =?utf-8?B?MkFNK0plZml4NWk0bysxMSswSjBRWk1RNWNpaEdGRU1XV1pyUFAzNE9KL3lj?=
 =?utf-8?B?TkRqVG1EVkcyTm5VRkp6TFJPenVEM3RzQU1FSXprbVNwemUra2JEYzBkWldD?=
 =?utf-8?B?QzlWK0s4ZHZTWFZkVUt6Q1duQVExdWc3QnhhWkhCS2NaTG1xY0ZKczNudW4v?=
 =?utf-8?B?QlFVL294clNHTGxzZEpZNFE2TGNnTlZseFh5QzdnOUpYTlp2SWhxK2hCditO?=
 =?utf-8?B?VDRoSUFDQ29ucWd2dGlMaGQ3eThBQXhCaWxNODlDUEpXMWtueDhzRk8rd0lP?=
 =?utf-8?B?Tjk2cmx6bXMrSUpiY3k4eFhMbWoxU2Y2L3FXTlcwYkwvSTE3dkVDaExtT2lL?=
 =?utf-8?B?T2R1T3U0VGZCMDZqbUs5M1U2OTZaRmQyRmUvdHZmMENSOWg0WTZMR0d1MFNw?=
 =?utf-8?B?YTdmUENyWlhleUppUHJDZWp0WDlHNlU3Qkh3R2VCVnNwbUZvY0J0WnFjTEhq?=
 =?utf-8?B?eXFLampOdmJ2Q05OMzQxYzFBQndNWDNIcTlFcURjVEtvZk41NVdIVDkxNkJh?=
 =?utf-8?B?QmNJd2lqbktzNzRMTDFyU1o3eHVSYk5CblhHNHVqVHZBRk1CMkR0YVV4VEpV?=
 =?utf-8?B?dmU2Q0p2SjUzbFJaT3FEWE5yYkI0Z2MvZk01N2NMdUlHUlVWRm9KM29kbytw?=
 =?utf-8?B?M3FNMk9pWFpGemIxckpQRVlZTTd4aFJxcExRSWluS0g2SkZhOXB3RHh5dUxn?=
 =?utf-8?B?T3ZZU2N2VHoyUEpTZkx0dTl4eVkyY2FiYVNhV1VKQVNsZmZpdms0cFJFaVp0?=
 =?utf-8?B?Rnk5N05hNUc0VjZNZlVHdlp4eDhWMm9DTzFzYXFrWStXRXhOcjJaREkxQmhG?=
 =?utf-8?B?M0UyTUpCYnp4THQwanhwU0lsTm5FQUNlWkwwV2FOSkNiazFKdGtvcU5DejhE?=
 =?utf-8?B?KzFaWTNDYXJyWVlBQ0d6WXZ2WXNFRGJsc2RQV3NFeWhZb25idVRmZGtLWFlL?=
 =?utf-8?B?bmY3aHVLd1o5NmEwNDd0cEVSQnpNbWk3Mkx1TEkyb0pudklsYysyU2RubTlP?=
 =?utf-8?B?UEdJSVFOSEtaalltTXpLU0pPNDZJaEtRL1lIZUt3TW45cFArVHlzTjE2Y3VU?=
 =?utf-8?B?a1JsemRZcnd1cVVzUnhsYUMxWDFjSWJmZ0lhWlNVQ056VUExbmtpMzlzeDRZ?=
 =?utf-8?B?YkJEUGMweHZ2aEtXT3FUVkVaemg1bmE0Yi83MVlHV2hZVHJFTnNQQ0M5V3VV?=
 =?utf-8?B?YkpUczdqUWdpVGNUWGxPUWsyNXcyR3E5b3VXUEw0Skd3ZjQrK2ticlVwemE3?=
 =?utf-8?B?alFGcjcxaXhSSlN5T21hUmxzVGp6cFZKTmRuVko1UXJhN0s1d2s1aU1RRUpt?=
 =?utf-8?B?SWdEYjBrZFVaeGFyMmYxMXdML1lGcStrSWhvT0w1U3lwK0tLbFAwVFNwSG44?=
 =?utf-8?B?YjZWMnRiK2dqcVlSUEpsQzkyREo0RWYxU3RPMVZ2VGtPcitCNmJuME9abDJF?=
 =?utf-8?Q?0oRIsIESAQGHaulS1s3DhTCatSOhps=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 14:07:58.1690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b68bc8d-6fd3-42a9-3dee-08dd51b7fa99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7480
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 14:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211758

T24gMTkgRmViIDIwMjUsIGF0IDEwOjM5LCBWeWFjaGVzbGF2IFl1cmtvdiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8dXZ2Lm1haWw9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gRnJvbTogVnlhY2hlc2xhdiBZdXJrb3YgPHV2di5tYWlsQGdtYWlsLmNv
bT4NCj4gDQo+IEluc3RlYWQgb2YgdGhlIHB5dGhvbiByZS1pbXBsZW1lbnRhdGlvbiBidWlsZCB0
aGUgYWN0dWFsIHN5c3RlbWN0bCBmcm9tDQo+IHRoZSBzeXN0ZW1kIHNvdXJjZSB0cmVlLiBUaGUg
cHl0aG9uIHNjcmlwdCB3YXMgdXNlZCB3aGVuIHN5c3RlbWQgZGlkbid0DQo+IHByb3ZpZGUgYW4g
b3B0aW9uIHRvIGJ1aWxkIGluZGl2aWR1YWwgZXhlY3V0YWJsZXMuIEl0IGlzIHBvc3NpYmxlIGlu
IHRoZQ0KPiBtZWFudGltZSwgc28gaW5zdGVhZCBvZiBhbHdheXMgYWRhcHRpbmcgdGhlIHNjcmlw
dCB3aGVuIHRoZXJlJ3MgYSBuZXcNCj4gZnVuY3Rpb25hbGl0eSwgd2Ugc2ltcGx5IHVzZSB1cHN0
cmVhbSBpbXBsZW1lbnRhdGlvbi4NCg0KSWYgSSBjb21wYXJlIGFuIGltYWdlIGJ1aWx0IHdpdGgg
bWFzdGVyIGFuZCB0aGlzLCB0aGVyZeKAmXMgb25lIG5vdGFibGUgY2hhbmdlIGluIHRoZSBmaWxl
IGxpc3Q6DQoNCkNoYW5nZXMgdG8gaW1hZ2VzL3FlbXVhcm02NC9nbGliYy9jb3JlLWltYWdlLWZ1
bGwtY21kbGluZSAoZmlsZXMtaW4taW1hZ2UudHh0KToNCiAgL2V0Yy9tYWNoaW5lLWlkIHdhcyBy
ZW1vdmVkDQoNClRoZSBnb29kIG5ld3MgaXMgdGhhdCBhcGFydCBmcm9tIHRoYXQgdGhlIGZpbmFs
IGltYWdlcyBhcmUgaWRlbnRpY2FsLCBidXQgdGhhdCBjaGFuZ2Ugd2FzbuKAmXQgZXhwZWN0ZWQu
DQoNClJvc3M=

