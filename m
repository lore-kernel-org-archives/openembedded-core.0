Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AA2C2BB85
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:11:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web10.51752.1718899856203303656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 09:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YmIr1U9O;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YmIr1U9O;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d2+BtlDBKvaYEQ9Z7jxsizvC2IhWT0WPdYlAQw7la3MNcWe16Ocg5tpODG9E+2NXLZnDpy0m3pTei42lNu3sV/AV5vkPm83oOKty1+eKiXqwTKomj5NvmyvgBMzaOXiZgEMqSCxLGyYQ8Tr7v4x8AFybeMWM/fzOnZc1BfcqP1umJHrKPnztK71NpIJ7TxEfQDg9KlPgk7Ku2WiLsUwNsSOpkxSC/a6vBtYimuIBU0yDOl+k95h8a4GdqAQ8dHsTtDD6HREg2tyqnH8rRPo9zoH7MGWrdR/7Fe8tD9pdjmltnUZo8W6D+n3D7SI2m2HFji96yq/HqV3Mr6lm+DodQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwn8hfrO8lHMSqrN5YqUBabp8GUchkrhn+5G8sPadH8=;
 b=BioaNBAwOYFGHqkeVae3AD1wgZgoYqlz8gVVdyvDpqiDinDexbhKP/+ipZ4I+ZqplgO4j73RZgx9i2U1WuntkVDofICoXrpAknQS8OdFrEBms/OjDsSGqGFG8/drhBBeE/0dAcj59w5ArZu3zAxEhvE04u7kCXsrqMPsDQrMbIRzA+k7wm3Svavzr0SqBeEQXIox09KS8IB4tXj+4/0dYoV7GzS15olLleFbSQ320I1qqaCCXCMR6dFFVkHuVXlJf/6jPIECEHl90UmxVAwbtrD6xyZmgRwpyKa26Dw2BUNg3QJbzOqD0gmB3RammXJRpTmYtlUhKqgxWOstP0lbmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwn8hfrO8lHMSqrN5YqUBabp8GUchkrhn+5G8sPadH8=;
 b=YmIr1U9OVLitq7jA3FYFDvdLKNj9v/rjpGVManjGaw+osGQNtwD6qGwTUc3Y/PFbxpaSdSviVkK71bShjvL/atBq63iuFS/Yml5rnZ0d41re+AcgU48eTuRpvr0UhIZ4nQEZllHq6P5QJXxB6AlSpXsbdmYexF9xhnQVbxwsDBI=
Received: from DU6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::18)
 by GV1PR08MB7730.eurprd08.prod.outlook.com (2603:10a6:150:51::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 16:10:50 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::48) by DU6P191CA0005.outlook.office365.com
 (2603:10a6:10:540::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 16:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 20 Jun 2024 16:10:50 +0000
Received: ("Tessian outbound 1986e26a179a:v339"); Thu, 20 Jun 2024 16:10:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 059a0c85151aba2b
X-CR-MTA-TID: 64aa7808
Received: from 0b8ce2f8fd8a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 949CEC44-7097-4630-A7FA-F371A8181422.1;
	Thu, 20 Jun 2024 16:10:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b8ce2f8fd8a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Jun 2024 16:10:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOsi77P1ohfqKd4WLipOQNaLA22YZrtDuDeD/fNsOH83370CtQoxZUSHJ2r9adgaui+fyAql3lFvGeAlEtvGUFmT+ffCcxthfVEwwe+rX/PgmszC8w98TpocJ5OJvxpqyfAyDOBKVqEKNMjRtNrrDuV3xoxh471G4QvDWDdy55WBREGhJNjn8ApiP3srowU41EsC00qYBfceGTbjsZuc/LDRg34evNxXcIkIoo9UeJhSEy17M+RitbYS3fEokR6u/qTz96lsNLi5w48ursD2t5T0tj7F20WvlSYUNiYLt1uwInTqhzYA/nlZ4+zLQbybAB9olCqFqzwzqIX98CMGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwn8hfrO8lHMSqrN5YqUBabp8GUchkrhn+5G8sPadH8=;
 b=cAZO0S1VSm43ckJg/dIt+98+M+PvvNXn+5GTISj7CD9a/EuZbVu98ZsKrNSyMJ0cRVdDYrI2LRy+SPHSr+tKoxrySVcXwFqsIUyv0Y+YJIAacthMrelKwKBfgVwFJW9Nlp8lwqBtESGRzlPXL8CjzdfgR472Q7IhctG91xGHIb61Qlf+Ji+SD3cngJ2IoYuW2gTWbaY8gxVreMYm0QHYJth9r5mX041y1mzIPtBbBYLgCLGiPRyJPa2DdSpGUy2d0KzKdBLfHjQsltaLHFoi2aILSWD1O2RZwO0oFLbHJmk46lL4RH5ljuAw3hJmZ6CFANV0p9nkHCdu5WgMevZGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwn8hfrO8lHMSqrN5YqUBabp8GUchkrhn+5G8sPadH8=;
 b=YmIr1U9OVLitq7jA3FYFDvdLKNj9v/rjpGVManjGaw+osGQNtwD6qGwTUc3Y/PFbxpaSdSviVkK71bShjvL/atBq63iuFS/Yml5rnZ0d41re+AcgU48eTuRpvr0UhIZ4nQEZllHq6P5QJXxB6AlSpXsbdmYexF9xhnQVbxwsDBI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7700.eurprd08.prod.outlook.com (2603:10a6:10:393::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 16:10:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 16:10:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Topic: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Index: AQHawaqpLc7aIiu/bEOyG9mkh/YHurHPhDWAgAFRNIA=
Date: Thu, 20 Jun 2024 16:10:41 +0000
Message-ID: <040A68B5-AF86-4553-B98C-8CF2F1BBA509@arm.com>
References: <20240618181226.2693197-1-alejandro@enedino.org>
 <202406192003378ecde446@mail.local>
In-Reply-To: <202406192003378ecde446@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7700:EE_|DB1PEPF00039232:EE_|GV1PR08MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 875a146f-d515-4a9e-84ae-08dc91438d6e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|376011|1800799021|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MGtwNE1vT2MwRW1OdTU4Z1JjTWZvWlkxKzF0RHd1QnhpMXJKbHNEM1Y3N0Z1?=
 =?utf-8?B?N21jNmpKOHR0Um8zQ0hFT0tyaCszV3FVOTF2SkNZd01nWDFQdVFzK0VjQWdH?=
 =?utf-8?B?TnRKUnJ3N2IxcG0wakszaXRwbkVPZEp5R3Q2cVQwNXhKdEZ0YW90MjFPeHox?=
 =?utf-8?B?aXQySEN6dHdJaTB2a1lJMFJhYnpyQ3pHRDJTRmRvOUd5eW9XQkhGNXZLZkFL?=
 =?utf-8?B?a3ZrNGZ1amZPa3VBQktERkZveHIzWFE2RDM2V0NOcGw1SU9lOGxWRTlyMjEx?=
 =?utf-8?B?dDU0dVpCODd2M3dYK0tJMTJNOS9JMG5NRU8reFU4cTNKREtaSDZpcCtUOWVn?=
 =?utf-8?B?KzBpQVZ0TlJDbE9TL3lacUNrR2x5K2NQRnc5b3BjVEhjWVYyVXdMeVAxZW5M?=
 =?utf-8?B?VVdkeERSK1RCVE5mTHFidm1jZWJEQmowMXdSK0dvSFd2czhWZ2FxTzdKa1JZ?=
 =?utf-8?B?SEM4TUkrYVdrY1JXQktUN2VFOFRHWTNpRndsNS9CaHVRUnQzWTgwUGNkdG0y?=
 =?utf-8?B?RlMwTVdLVnN4VzU3YlZjZnZxbkdIc1pvMFRWNWhOVmpUWm9JM3AyNkd5QVNE?=
 =?utf-8?B?M21PazM0aTYwZzJmOWJrU2lhNjBzK2xwVU9IK1RQbVM2Q1N5VTViZlFOZkpq?=
 =?utf-8?B?bTlKSW0zeDJjMjNCSC9CMEhUam85ZU1FRHNuc3VZNWU5MU9oRGF3ckc3eEVX?=
 =?utf-8?B?SkI5S1BSYmh4ZWR0NU5sQlpxN3htYnlxRytaTld4VUdJbVU3dFR5NSsrbzZp?=
 =?utf-8?B?Unp1eDRlbmQya1JQbDFVNEtLaEVXTzNSSStMRUlYZlFhUWNnS3ZXOFhPQnJN?=
 =?utf-8?B?aDYxNG1WRUFTejBjVFFicmJPR2tabTFKV0RoZWViZDFSN09aSFV0Qnhjc00v?=
 =?utf-8?B?RG5SeHRMYXBPY3Z0TEg0dHgxNHMweFdCTnFINmNQZmJjVldPUCtsZTJ3bUtH?=
 =?utf-8?B?ZnFyamJTUFdvdm9KV0JJYmJCUEVMaEpjWm9vS3Q1RWZyRksvV0F5R243aHFW?=
 =?utf-8?B?V3hkaisvV1BWNGF0NlRHVk5HLzZEbCtXSmQxaHV2dXdwbUwyY2tacXRNR2tO?=
 =?utf-8?B?ZXlMNGVyNjZnaXNnaFhjNTBrdU13VzlTb1Izelp1WmhTcytZeWlUeFRjWStE?=
 =?utf-8?B?c25kZUhKb0d3Uy9McmRnTlYrS0k4bTVpQXZDdGc5Vk93NTR1clhRZnZMT0tR?=
 =?utf-8?B?Zm1SS2FlNkVQTXYydUhzZ2wxRlVXOUtKS2x6QkFnbkdpRDRjTm5WVkdiSVNH?=
 =?utf-8?B?aFRFNFVsdTAza2treSthOWJoL3RkRnlaWWFXYjgyanZSalh3eHlCN01jbDNr?=
 =?utf-8?B?NUpKR1ZlbGtTNzU5OUpuOExtSkdDMFBVVXo1NnVSbXVrVFNKRU55c0lHYW1G?=
 =?utf-8?B?REliSEY0bkhnVGJkcU9UbGg2YmtBT01XQUk3L3RJS3JDNjFiTEhXd3JWci90?=
 =?utf-8?B?U3pGMmUxdVlqSkVUTk5EK09oUTF5NzJOMk55N0QvQUxtazV1eXVTajlVVExF?=
 =?utf-8?B?L2VRT2s0eTNmaVBab0NZVWNPSmtOTDllYXRnY2ZuT3pTOTBZcUwvVlFQZ2Uy?=
 =?utf-8?B?d3ZTRU9QbWZid2kzcjJZSEllcjdyZWNmY0N1WDJxQmNOSFk2TEJGMENVQm5i?=
 =?utf-8?B?UDFselU5V21rSCtDWUVUbWNuaG5wN1Z6UEp4ZXVuL1JjTnVQcGdsSDNNWTlX?=
 =?utf-8?B?RFQ0QnF0V1RLcm0valltYmFXVUNNTFdMNURXTDZBb2hMTnNGYWV2eVF6cVRh?=
 =?utf-8?Q?fkNtK0xSd72aI4r6GU2YyLHOqSoDWvNPR3H50qp?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9ABDED25E28E24FB700A19CDE02B023@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7700
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b311bdc-4c0b-4380-bd27-08dc91438868
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|82310400023|1800799021|36860700010|35042699019|34020700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NndsanlTZktoRGRFYU1iYzRKWGtsRDlwZWZNeVRQaHB2aGQrV293T2ovbi90?=
 =?utf-8?B?YzlCbjBvWktHeXNTVVFuSTNQRTFFaE5tT0NBZFZOUzcxK2l3NU0zdVJWVGpi?=
 =?utf-8?B?SFNmSk5hN2xlTkgzYWZ1N2ViaG02ZkMvblRISVhIUkF5VkE5MHExbGVUUGwy?=
 =?utf-8?B?MVBuWUZWSXdtWmNoM1M2amM1R1RhbTNxSmt2TEpzdk1TK2VVNW10Qk14MW5p?=
 =?utf-8?B?YlJjaDE0ci96aDJzRkh6V1ZPeFFreHJqciszcE1kQ0pwOSszcXlGQURrZjdY?=
 =?utf-8?B?aU1XaEMrNGtLMTQ4Nm5xTW1vMjlwNnZhS2tvNi9iU3BIclNkYTkxWW13Y2J5?=
 =?utf-8?B?anJycEhVK1d1V2lxZ1I0UTBQaHYveHVjeXY5TEhlZHd1b05yM3FtcXBOMDQy?=
 =?utf-8?B?R0x5dGlJbFBKT01MQUlDN2IxVWRPN1BYalBNWGF4RGhpUkJIaUJqSGhlTEJ1?=
 =?utf-8?B?S0V0VUQraEN4WkVveE5FRmtMSUtEaHp3bUNhb1VaQm1sZmJhdXozd3Y1Q3Y1?=
 =?utf-8?B?S0Z0cFNXSkR3aU4valdjaDAvcjBEaENQWFRZbmd6SDg3QWdRTWkrMmZHUGkv?=
 =?utf-8?B?Y2c2NmI0cWRkaEcrbVBDUUM5M2lrYXJqZTVoc2FBaDhYclVzQk1TOEU2MTRt?=
 =?utf-8?B?TnFUd2MxaG5DOWswWEN0blkxZlBBUHdjakhVbnRUWE9YemRhMUdzVnE3RGx2?=
 =?utf-8?B?OUt3ajVka0ZJK3ZtczBVZzh2ZGZKQ25MamxEQXlwZ3RQdDBKeWl3MHVuY0pK?=
 =?utf-8?B?MFNZWXg3OTBxdVorOEJ1MmVlb1NNT3YxZWUvUTNVUDEyWFdhTlRDeGsyQWVS?=
 =?utf-8?B?RDd5Nm5sLzhqcURMeGxXNkpRV241UXZ4dENKYXlsODc4Z2E5T0R3dFBMUEFB?=
 =?utf-8?B?QnAyMW9GQkJGV0xxNVZJS1I1UEk2Q05acURISEtuSmVQL0ZIUEQyUzlUSU5T?=
 =?utf-8?B?MEtqNDllNDFYRERCZWtWamZFa242RlpZTll3M0t4T1VRUWl1MU9EUFZKMUpZ?=
 =?utf-8?B?ZktLZm5wUTFVRnpDbUFZN202Rk4zM2dLTFUxK3hVV1NjeTBta3pWeFY4NkNX?=
 =?utf-8?B?UjNhV1ZDOTB4bEpJZ1hIdXBaMFd5THo2Z1RscTBaY0Nxc1U1OHY4M3lFZ1lL?=
 =?utf-8?B?OFRLNmlDN25QN2VTc24yeFZnOG9iZUtWMFZ0NjVHNnBlYjZQVkY3RzlhM2tS?=
 =?utf-8?B?dGphOHJhYzRSYXZnYjYzMHJ0Q21uOWV1QXRoeHBzTStDc291MDZpUzlJeVBM?=
 =?utf-8?B?Q3diVEtvMjZoN0dGT0RaejVKSnFCK1BQY0JxWjlIekZ3YUdBdm5nQWV1SU5V?=
 =?utf-8?B?QnkrV29obnl4VmtrZEJuSTdIWGVkRldIOUxrT1lRNmsrRWVUY3UvSjZFN3F6?=
 =?utf-8?B?dnh5TGM3MVNOVTY2Nnc2U09mT3VyRXJuZjZrRkVKV1J0YlZxdVpOY1R6OURS?=
 =?utf-8?B?Snl5bS9zdDcvUkZNYkdHQlJ4Tk4xTFQxSkxXaXY0RnRnYU4vYStnckVON0I0?=
 =?utf-8?B?QVA4S0ZpSms4RC9YL20xYVNYOGdpTzV2eVdZbXBINTdXYUlLcktkc2R3Wmdw?=
 =?utf-8?B?dUk2SVE1d2JtTkJJZERaRzU1NEx1c1o2NnpkZ1BhMXVNbzhiWlpwY0sxeFhy?=
 =?utf-8?B?NzdmUVZQSFZEZmZNYlBNYVlmUmVGam1RcmcxWUVicThPVndrc0YzN0ttR0Zl?=
 =?utf-8?B?Q21HOHVJUGlWUXJjTjVCVkRKcTNhUnJway9hTDVVUStHZ0htemJVSWdOdWpy?=
 =?utf-8?B?ZWd6QzFNNWV4RXNqN3dYbGxveDhkTUUwMlk1VEJLa0pjV0x0cndpY1lVaTVO?=
 =?utf-8?Q?fukuaNnBwyypsOpndum35D8o1eDKH3YR2LG4w=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(376011)(82310400023)(1800799021)(36860700010)(35042699019)(34020700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:10:50.1278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 875a146f-d515-4a9e-84ae-08dc91438d6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7730
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 16:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200965

DQoNCj4gT24gMTkgSnVuIDIwMjQsIGF0IDIxOjAzLCBBbGV4YW5kcmUgQmVsbG9uaSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8YWxleGFuZHJlLmJlbGxvbmk9Ym9vdGxpbi5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+IFRoaXMgY2F1c2Vz
IHNlbGZ0ZXN0IGZhaWx1cmVzOg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84MC9idWlsZHMvNjgzMy9zdGVwcy8xNC9sb2dzL3N0
ZGlvDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVp
bGRlcnMvNzkvYnVpbGRzLzY4Nzcvc3RlcHMvMTUvbG9ncy9zdGRpbw0KPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzg2L2J1aWxkcy82OTAy
L3N0ZXBzLzE0L2xvZ3Mvc3RkaW8NCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3R5cGhvb24vIy9idWlsZGVycy84Ny9idWlsZHMvNjg4OC9zdGVwcy8xNC9sb2dzL3N0ZGlv
DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRl
cnMvMTI3L2J1aWxkcy8zNDk1L3N0ZXBzLzE1L2xvZ3Mvc3RkaW8NCg0KVGhvc2UgbG9vayBhIGxv
dCBsaWtlIHRoZXnigJlyZSBKb3No4oCZcyBTUERYIGNoYW5nZXMgbm90IHRoaXMuICBDYW4gd2Ug
cGljayB0aGVzZSBiYWNrIGludG8geW91ciBtYXN0ZXItbmV4dCBicmFuY2ggQWxleD8NCg0KUm9z
cw==

