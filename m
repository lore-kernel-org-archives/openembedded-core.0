Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDA1C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:46:00 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.50])
 by mx.groups.io with SMTP id smtpd.web10.7915.1749131154911378344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AAbWaRf5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=AAbWaRf5;
 spf=pass (domain: arm.com, ip: 40.107.159.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e/8VQSwqb2mMbSzZ/wtLQ2612antl+r17qvQX/W81TSR1+J1G6VHRwB16gVwMO4aRWTmd1uDDeHxM2ZtM3cZcLP0HizkzrQN8jA3gUC7lTgAg9LkC3K1h7eVQqhScjdT1iOgYtlKccjByIiQEnYBv7kWpIoDXkwsziK3oBSs+kR50Q1kpt80zBERhRw1XGzk2GrJbOnqYmVeGtDM2uIOJq3g2MC7vAMNlDvpn9bIdWhch15H+QocR5RwKS3X9qy70DueCLeRjw68Xg6VWYckbkbYKot/PUuLZl1GUvaxtwpqPXtihqsc+CiLkIdWsJNz815RmtFDS2lyhRzLO8UGew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APPCtrOHwSIYTlAHpZdfWwnyGihVWVmDw+phiLIhX54=;
 b=fYXbEdDV08GNUPwSYA2R6F0vjeJXbNVvRT6bNTGK7UJF0We0MpTKwv87qUvbcjLOP7ZfSBkfh0GM8p6NRfdUVyRgdss9cuWz4FZ1fcYpL2BDIJuKRfRg6rmJMSwVWHjxwycoeS/xUBkw8TN8wsuDR9aWkSLUtbzuIuE20vTnXePU19HYBh57NhvFKc7BsW7VVScFu4cSXmb3RuudnXRwtEZ7/3w6e5QgVqOelnu+EsLYP8bNJJZtmt+GS442jt2yWdfDd8SsHtKicqgcZqeyuKcAjB988peywDT4BOQZJpY6xNAfuPFN5CjHZwbGEBFjfJKheM6/e+2BWBb2kVvEmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APPCtrOHwSIYTlAHpZdfWwnyGihVWVmDw+phiLIhX54=;
 b=AAbWaRf5zWcvY/a+Hyl1zAMuooFE2JMJLWufOfA0ppsuys7kFxeZq0Vl8fX+EQ158n5BZuKDn0vJ3o23wxCfcykKVXUMPBGTe2lCIntcmqYLLBgUvSyXB/7w/Sm7xBJPXpjx0jHV8bKGSBOch1dRCxm9KygkbDntV7CtuUVf8dg=
Received: from AM0PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::26)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 13:45:49 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::b7) by AM0PR10CA0016.outlook.office365.com
 (2603:10a6:208:17c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Thu,
 5 Jun 2025 13:45:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 13:45:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtbTotwL7A7s5nrAUJOUqjUaSo/FO3B83ebkccjs3vLvlxzeU/Yj9iHNQse1nTOio9NFDD6mW6q5uwVL1ib3+b+VUevf1hhb0oW1DbMiQZjbc6EyWYlFvFVpIdQ9rFKjoj1i5OB4g4/xtK+xKo0VZBHD8IQOLIHFr2pdFt5jC5v7ZiYtoN8XJEBP/mG923VsXP5OE0XTE1e/X/ZHGYQpz0MUJxuT5Lkn00yatSUyYYIedsLAjDzNU9Lt1ndZuC+o/9xiCHATcBK8r0shx6zCarbSGlJX6zX1mxBusNTlc8siEkBYsSRt79wFPcQBR4ZKZqPboTaFrHNnNBua1Y1vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APPCtrOHwSIYTlAHpZdfWwnyGihVWVmDw+phiLIhX54=;
 b=uemA2eK51CaVHq0QZrIsrLiv+RWLhAkECHPbzQ4pdP7d0VWvoDQHSBvwHuWjntYGeupVpCc8oLsnDdoFpsfKKggNyjSkoJoTWsfO90CovcZCB4JBbmbZvIk9Nu9TLtZtLwRCyBbYaLqyBEeFNWuTiWu05YeFpnacP73+uPrZHLN32qX0oFmnOrrc2UiGfRNW+fcXe+BkrxpORTQmIfcYtewVA9Zje9qhhS9EaVr2AnMUlgMZGxX9IjPDSVUFoZ1A0FhjNe8o7C6NSdng1k84a5tI1/YKkJYN+ysKzHmxbwobya3nBA8GOR8s3dqgA79G0Ujs5jUG8DxRmrBCqru7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APPCtrOHwSIYTlAHpZdfWwnyGihVWVmDw+phiLIhX54=;
 b=AAbWaRf5zWcvY/a+Hyl1zAMuooFE2JMJLWufOfA0ppsuys7kFxeZq0Vl8fX+EQ158n5BZuKDn0vJ3o23wxCfcykKVXUMPBGTe2lCIntcmqYLLBgUvSyXB/7w/Sm7xBJPXpjx0jHV8bKGSBOch1dRCxm9KygkbDntV7CtuUVf8dg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8622.eurprd08.prod.outlook.com (2603:10a6:20b:55d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 13:45:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 13:45:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 2/2] tcf-agent: Add $@ to RANLIB
Thread-Topic: [OE-core] [PATCH v5 2/2] tcf-agent: Add $@ to RANLIB
Thread-Index: AQHb1KI7aKh/AzH9k0WC8myoZwa9w7P0ltGA
Date: Thu, 5 Jun 2025 13:45:15 +0000
Message-ID: <65A0C80D-49F4-4F66-BB45-BD6A798AEA12@arm.com>
References: <20250603161135.1013947-1-raj.khem@gmail.com>
 <20250603161135.1013947-2-raj.khem@gmail.com>
In-Reply-To: <20250603161135.1013947-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8622:EE_|AMS0EPF0000019F:EE_|AS8PR08MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 4985f65e-edd5-43f5-43f5-08dda4374731
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TTlsWFJjYjlVRmdZWXJrci9ZWXhUYStDZElDa2JUYWFGV2NmRHRjOHgxd1RP?=
 =?utf-8?B?aFU0TDRrc3lFeGlCb05HNDAvSm0wZ00wUDR0VzZHdVErOFh2SHhSUi8xQVZS?=
 =?utf-8?B?V2puN2I4SlgyWGdqSEVQR0xOY28wc3preGJ1QTdxYWVneVNETnJwTDhieFhl?=
 =?utf-8?B?KzVGNHpSdnl4YmVaRU1qM3g0SDBQanhXZ0hCM2dxVmw3MXkvNDNubUhDS0tw?=
 =?utf-8?B?K3g3VFREemlsRTF0VHNNNXJOZ3piemJ3RW5lMCtHT0k3aE11dk1jNmNJS0l6?=
 =?utf-8?B?VnYxd3NaUE5uQk40ZTJteXVjOGRleExXSkpTRW9sbk9yRk45Z0tNVVQ3ZVpJ?=
 =?utf-8?B?TC9pSmwrTHhXYWpydnh5cEhKYk9xN2xtTkdwbVJEbWdFd1NuYk05TzZPaGdv?=
 =?utf-8?B?b0dJSnl3RDRYSFNQcTR1eGRjWEF6Q3dZRFdmamQ5VUlueFFkdE5xcDBhdEtl?=
 =?utf-8?B?TzZhM1lQMTNYU1BwazByRGVtYUJHYWlwZ2VLMTRhN01QZzNJdzQ5WEZEeHAy?=
 =?utf-8?B?M1VUQWMzWEhKdkM1cllzd1p3RW5QdG1RWjVlSlpzM1hhZVlpRzNwcS9EVndH?=
 =?utf-8?B?NUN1RUNjL1NuZkFsdjhxblQ4ZjV5T3R3SkVQcGlIQ2l1dHVmbWlId2c5cGpy?=
 =?utf-8?B?OXg4NFV5M2wvMngyWlJRaUNtZ21JNy93Ym1XanpsdXhrZXlHUzhoaVBraEJW?=
 =?utf-8?B?T0VuSjdhUmt2ZU84OWUrdC9qMFVIWG5UZ0M0QkQ5akkzWVpwSnhmQ0lVL2x6?=
 =?utf-8?B?cExWdnIwV3pNdWYwSjYvK0V4ZkdQMStWRmkrTU9IRGNCWkM3clMvaXpsRU9t?=
 =?utf-8?B?Mm9UQ0M5SUxadHZPRFpGaHloTEJWeWhHc0JsOWl3M0FYVkg2Z2p4QTZJYmhT?=
 =?utf-8?B?Vm1udkRXbHExeGk3eWR6SS9kUDdhUlpoZHNXM1BvUW9aeUxmYmpaSWtFV3JI?=
 =?utf-8?B?SjdJKzJyYllVaVNzU2I5cG5lUU0ydGE3N09nZ05TQlhOcmdwOUZwc05SL1Za?=
 =?utf-8?B?Wjl4RHBQV2R4Q1ZWYmR3UERpMWxDS2llWTNvL1RjeWl5YndLSThJOFA5VDBs?=
 =?utf-8?B?L2pmVU1iWEttMmEzNHdFWlU4ak5Ca3ZxVU9nZnM0dlRrOHJkK2R3QzJORTg2?=
 =?utf-8?B?dTE4TTdUMkt4VkJmaG96T0xKMXFkZVFWTWtMNERKUlltLzYvaUM3ZUtmVEo3?=
 =?utf-8?B?MEplM3M4eE1FemN4eXpQWGNuL0tHRVZjVzExRFFNYStBSVRqbmxTTllWbVRh?=
 =?utf-8?B?cU1xZjZPL0pYck9aZmIyRnRNanNMOWY5SkJLRy82cFR2TUxXV2lHeXRGaVp2?=
 =?utf-8?B?Y3ZHalpEUit4Y2I1dDJpaW5kSkhkL3NVRG1zbGpLWHRPeFdTbmpqdWZ0c0R0?=
 =?utf-8?B?L21rMTNvK3lFVUVtWk5JZWF2V1FvQXlhUkJoekxyNTVLUzJ3bnMxL1l6UzI5?=
 =?utf-8?B?enR5R3YzQVpNbXF5N0pGQnA5aFRuMXZaQ2RUUU9XRXNJTGt5dTJpSE9nR2FB?=
 =?utf-8?B?Z0NMVzBHMzBlSkVWNURhQXBLeTE0SGN5TXdVcTR5UFcyak5WS3A3Nm1CUElu?=
 =?utf-8?B?SVpFbFc0T1laSC9NWWR6QnF5UTZIOFIvN0hFbHR2SHhSR2h1NFR3VzA4RXlZ?=
 =?utf-8?B?eE1SdHJ5ZGduSGNweTJEUkcwMEJDMi9xd3Z4ZVZKVCtlM01jclg2UEFhd3dQ?=
 =?utf-8?B?VlFSanphVE44b0h4eUtTR1FzT2JaRk51bndIdW1CRWo3VlVpaDV3by9xSjRz?=
 =?utf-8?B?VkNXOUpET1huL2l5YzRyT0lWcUFFNVFLYzJVcGpiNFRNVWIxTkN5TDFQTU5n?=
 =?utf-8?B?YlBHMVpRQzRKL2xzR2tEVEtIWllkcExyUEFaYnIrT0hINTA2ZXRnYVBiNlBq?=
 =?utf-8?B?OHBuL1ovVjJoUm9VYUYvNUtodURwaHpiS0F5R2ltNmtrM3FjcVVzM2ZXeldz?=
 =?utf-8?Q?VgyBmnkLp1U=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B4C4DB97609B747B5B377A41CE5580C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8622
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f941480e-b1de-4026-0dd6-08dda43733f1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Um1EYTJ0Q0tkeFpoOUFiQ0dXbFB0Zlg1WGxEV3o3Q1MranE3YVlBZDJ1MGVm?=
 =?utf-8?B?OGFPRFcwQmpscGNJSjRDRm5jS1NDWDFMUXc4dVJMUnFWNlpOMEg0aWI2Tkgz?=
 =?utf-8?B?SytaMzZOT1FRNW8raU9UTjJ3eGdpZmwvQ1MrOEFZeDVPcFJmN2VwejEyNUZ5?=
 =?utf-8?B?cmZwbEptUngvMUFJTlh4eFdZZ2w2a0phUC8yZSt3U01pcUNzZHpWVjN4MXNi?=
 =?utf-8?B?a0RWdXFOa1pQOTJpaVkweGxkcVpuc091N0ZIM1NRcFB6YVlTK2RXN082bkdS?=
 =?utf-8?B?ZTdDdUJXZzd3WnFWcU1NT0tnelh3bUNKU3FIOFpjbzR3Ly9ScGV0SHpJcmpS?=
 =?utf-8?B?Q2JhYnRIMWRJUGlaTnJwNUZqQTFXaUxjY0lubWx5eHRXaDZpOHViMnZlSGlZ?=
 =?utf-8?B?K2h6emF6L0JTOHE4OVBnR2VIMDlpYVNJWTJnQUIvNXhWcUlvMnlYVjBuNW8w?=
 =?utf-8?B?VUMzalZFdmxNZjhoMnU0M2ZBaUZ0NTZ2NXh1UkNHVnRTUkFaVUhsdUYxc1FN?=
 =?utf-8?B?NzZYOFJPOUFGb0NPS045OVh1OWZiQmZXRW52ZlFOamM2U2h0K1hFOW5IdnVs?=
 =?utf-8?B?VmUvSWM5ZHFBZStpMmZpdGx2ZmtIRWxGZG8xTmlsbTNueU9qV3RmMWY0UDFt?=
 =?utf-8?B?NzJXbjBkeG1XYjJFWkRsbVFtNlN2dFVuZ0FSMjg5TXU0V1U3ZFBkNXpDV041?=
 =?utf-8?B?Y091SmNNcDRCOW9GWUdENUF5VElyWjZTQW11eUtibVF6NjJhQVJxR2ZUTTdk?=
 =?utf-8?B?bFRCeTdYeEdVcHMwS0tXT20rZjlYenhWTi9nUjhPQ1llZTIwL2FiR3BBdGV0?=
 =?utf-8?B?VFFjTmx1Y0NndVQ2S3Jkb3hFMjdKa09LbGoraDVkZUtEb0FNL0NSd3JTeHNV?=
 =?utf-8?B?Mit1dE42UmFOZWFnQVpMaVQxSmRnK1A2cGhVUXRRTldSdDZud3ZSUUxTejlo?=
 =?utf-8?B?d2dMZ3JscHdIdnUyVFlLL3FJM0xjNXA5SW1DSGpHTy9BeUtOVVplNXJab2xt?=
 =?utf-8?B?OW5tUGVicXdZZkZxSU11T1hBY1o0VDBXeEM5QkpuNTdJK21DWk9zKzIxcTJx?=
 =?utf-8?B?bkkwenJwenpxM2JUQzAxZGUzVTBWVzZYUWkwblBPcnR4Y1diZzZRcnpnRTBL?=
 =?utf-8?B?OGFSYUFZcUhPbU95dXBSVzhKQlBFajh3eGdEejFYZkhSVEU2YVpWZHVmanZr?=
 =?utf-8?B?K25BSmFSV04zTnZwOCt0MHljM2ljc2JXU3R6K053K3VMcEN0WFYzM25iT0hx?=
 =?utf-8?B?dGFnY2NkcEFoQk9sSCs2dnBqak5HSmpYUVJvbzdRMFV5OFVqMFZRSmRXaWdM?=
 =?utf-8?B?VDJ0c3Ria3ZiRUJvZHI5VUZLajdwTGc3cnhkRjhJSFVVSEFCYjJJV3R6VUVB?=
 =?utf-8?B?dW52QWRNMkhPMEk1djV1VjFndWVQSy9lSHI3amxJN05lZUJzNkdPVUZ1YnVl?=
 =?utf-8?B?QnNxWXpFNk9NWm1wTXJTR1F1N2toT2VZNzlvdnJiS1VDTTJscVhiUXlURTFT?=
 =?utf-8?B?bGtDb3JPQlh1RHE3VGJEYi9QbWxVbTVFNG5MUkJsWEFYSU9kZktsRXE1ejhS?=
 =?utf-8?B?SjNRdUdweVlnSGRXcDVXNFNqMWFFK2R6U2oyeUhKUEQvRHhWaEx3QWNSS2E3?=
 =?utf-8?B?WlNvMU43NHBSRDdhZTl5U0EvMTlzM0tuQ2ZvOUNvY004OFJJRGN2Ri9qdGJT?=
 =?utf-8?B?c3JCV3BCVHNVSW42TEdwTGZFaE1CZVJ5bmRVSEZ0RklBUGQ5UmtNK2VEL1VO?=
 =?utf-8?B?K0xUb0hqc2RhUkxuWWl5UmE5eU9MWmFQdUVuRXpTdERobUVtNThxYmlnYzlC?=
 =?utf-8?B?OG1QN01mbXJRdFZIK3VlYWt3NlYycVo4d3NzRGlqT1dZbHViZ0JaSlh2ckVZ?=
 =?utf-8?B?alM5Q3dOcFN0UkZYbEdIZWY0NzRCOUszOFBVZzh4M2xrbC9pSmtncGRjOFll?=
 =?utf-8?B?UC82dktaSlZ5VCtCT3p2cDVLQkJ6SnphWnVuTlVscGlZZjR1dUlMcXNIRU1a?=
 =?utf-8?B?cXNPaTdIY3RRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:45:48.0695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4985f65e-edd5-43f5-43f5-08dda4374731
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218021

T24gMyBKdW4gMjAyNSwgYXQgMTc6MTEsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxyYWoua2hlbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBTZW50IGEgcGF0Y2ggdXBzdHJlYW0gdG8gYWRkIFJBTkxJQiBmb3IgbGludXggWzJdDQo+
IA0KPiBbMV0gaHR0cHM6Ly9naXRsYWIuZWNsaXBzZS5vcmcvZWNsaXBzZS90Y2YvdGNmLmFnZW50
Ly0vYmxvYi9tYXN0ZXIvYWdlbnQvTWFrZWZpbGU/cmVmX3R5cGU9aGVhZHMjTDUzDQo+IFsyXSBo
dHRwczovL2dpdGxhYi5lY2xpcHNlLm9yZy9lY2xpcHNlL3RjZi90Y2YuYWdlbnQvLS9tZXJnZV9y
ZXF1ZXN0cy83DQoNCkFzIHlvdeKAmXZlIHNlbnQgYSBwYXRjaCwgY2FuIHdlIGFwcGx5IHRoYXQg
KHdoaWNoIHdpbGwgZGlzYXBwZWFyIHdoZW4gaXRzIG1lcmdlZCkgaW5zdGVhZCBvZiBhbiBhc3Np
Z25tZW50IGluIHRoZSByZWNpcGUgdGhhdCB3aWxsIHBvc3NpYmx5IGJlIGZvcmdvdHRlbiBhYm91
dCBhbmQgbGVmdCBmb3JldmVyPw0KDQpSb3Nz

