Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AF7D12687
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 11:15:08 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.74])
 by mx.groups.io with SMTP id smtpd.web11.15341.1730805303089655145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 03:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ev9f6cEE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ev9f6cEE;
 spf=pass (domain: arm.com, ip: 40.107.241.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MqGKeMlDNCIkub/+K6UGz7rC0s/95eUCf8HPZqUUHjVdaCOaOTR8Zpykf4TkQPbml0IOnSfL8co/Yc1PsWBLkxpwGmunp9tRn7WeLiweshB6K8jCk3PD14yvLt4wZb9yS6JTA657eTSf3IPudKiySL+r3HR9Eknj+AO5beVI11xOlM+kiYSRC2yHBtDMx2Hysl1rmQiZVXDJA6j655nu9hH5/OD0Uj1IrC1FcYN9Vmd9eBwO+ySAanfGs2H5xh2w6f87msctW10VUWbmLbjqAmRyPq12g+nwDjYDHUKZB2tNjXeyTA8+9pX2SHfK7UTWw6oL7YqUgGQ1NMxOgvkTsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WlU2TWkOWEtr8hP+X+GEdWnqp0xuDmUGQ97OEkrqbU=;
 b=QFjizplkMf6Gg3pwMbkk5w++EGFjBGMHSkt+JJG4lEnKJ2C05DuBMQ/LwUcEdDxso/63dTJ3ShPeZ4nA1fpMv06wO7b3hXDatWtrcSgIPYXj6/bGY+b51Hi3OBDqpfq8eAAllrKamxCOAO6ddLozVTJQNWY2cxgYQpnzmz7KZKTXt1eaxTJMvK9WaHNcH1+c85FsZSAC3+O4HVxj1OAhQ6iPjCE4nZUxwinrFryefIVBRsx4eRfKCgvlvChPu69lLjBfqAvsBT2UAq+0Y5Dr52gjOku3wUxkTjlna4Uul+jeakItbF3Ff+zAfmiRFKBJ8AFPmR/2Vry/MXmofJRCYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WlU2TWkOWEtr8hP+X+GEdWnqp0xuDmUGQ97OEkrqbU=;
 b=Ev9f6cEEM5PtRPMoD4L5pYLLnPBJHxNfKOabNRAtEnC5Go33rXmkOqqsYX9I2W8lTIBn2Lh1j2sq1xVhLq/Yf71Vk/vVstLVuVc648Q7RA3sVFuZocZwJ8avSdSv3ITCgm9xdD7TbMYdjGwW5dYd+UFJXqRRFae8NXC9H2+K8HM=
Received: from AM9P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::13)
 by AS2PR08MB9426.eurprd08.prod.outlook.com (2603:10a6:20b:5ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.35; Tue, 5 Nov
 2024 11:14:57 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:21d:cafe::50) by AM9P192CA0008.outlook.office365.com
 (2603:10a6:20b:21d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Tue, 5 Nov 2024 11:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Tue, 5 Nov 2024 11:14:56 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490"); Tue, 05 Nov 2024 11:14:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6c4747cc05b7574
X-TessianGatewayMetadata: i9q33M1y9nNPBMAWgLFvG5s/hXwtB/k+wUMTqjmPMth5NFM0YlpuIm6ARwNiFfRDYrc1JXCvpRkJcVvhPsNgsiJKy6iAj9wko9u4HFaMa3h0ZPdPOQHdoiiJK4d8FhxwDhbrXPIo2emPAq+wp2D7k18dvY1YepQ3/dJ5hyv5JyE=
X-CR-MTA-TID: 64aa7808
Received: from Lf1db5f8fcd3f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 742FE280-F3F4-4282-B958-E51173E903A5.1;
	Tue, 05 Nov 2024 11:14:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf1db5f8fcd3f.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 05 Nov 2024 11:14:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7lvp99eiKJMkOpXfutCw518eYR9H4JF+eoXwZmKrzTZiuVOcuWruwR7aAvrkHC7SmXizNEGSXaKSFuNh426mzVrBIuBfvz34ldjMlk7UGogU+nNzS6Mc0c3jLZUx+5RMrbUqlzk20LKN/jWDS2VK2Nmr23HM4MEgcuWxOJmHz6ilTDGdQ6KDy4U9Z0iSa6868YTizTWBF4ONEaZheZ/wX/YqUPI9Nd4pfJmKbFuUBiOfmZBa6U1pUVVpM31WNKIJ+vGqu2tR+JzFksiGMEGVYRuEfiG5I/7FTTYH8yMfe0NPoGiSuwvJoO3iyLn4LR2tZFve6OaSVlZjjzyEIae4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WlU2TWkOWEtr8hP+X+GEdWnqp0xuDmUGQ97OEkrqbU=;
 b=F3xoUvkKizOBM9kPyYwAIKiH/ycpGIr8X/Ui+xGicV2XdRkejWJLZmk8hnTLb+ephUS0QTJ7yI/xnWhKc7VmKyBUec0em0TEjIUFG/DpW1uhiuWEvihdES/Ojw2dNP+p2UDoUPkCLqlSKeEzGecMNuwTXJ/pGMfpZVYINotiVj7RYt/LRt7K+MzYTM0E0gL3nRO1KnNHSEFEujnOQBggOB6BsIkmxa8tH9Rz/fytghZWnP6esRYWLAJkzNhmUR1fklv8ypWHHtvKTHNIhCKpblNbTqhOkSzZ7sqzs9PJTc9Z0GQRmIdknUtEjW+023yIXXwa0ZOUZvLpJPQyAtY1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WlU2TWkOWEtr8hP+X+GEdWnqp0xuDmUGQ97OEkrqbU=;
 b=Ev9f6cEEM5PtRPMoD4L5pYLLnPBJHxNfKOabNRAtEnC5Go33rXmkOqqsYX9I2W8lTIBn2Lh1j2sq1xVhLq/Yf71Vk/vVstLVuVc648Q7RA3sVFuZocZwJ8avSdSv3ITCgm9xdD7TbMYdjGwW5dYd+UFJXqRRFae8NXC9H2+K8HM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9956.eurprd08.prod.outlook.com (2603:10a6:20b:637::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 11:14:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 11:14:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Robert Yang <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] nfs-utils: 2.7.1 -> 2.8.1
Thread-Topic: [OE-core] [PATCH 1/1] nfs-utils: 2.7.1 -> 2.8.1
Thread-Index: AQHbLsoSVoIAB2Ww6E+Q3hOx8Xzn/7KoikSA
Date: Tue, 5 Nov 2024 11:14:47 +0000
Message-ID: <F21B89BD-5291-4D98-AB27-5DB54FEFFAA6@arm.com>
References: <cover.1730732225.git.liezhi.yang@windriver.com>
 <ec364dc24b0f05d9ab9086f77dd50f37175e9be9.1730732225.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <ec364dc24b0f05d9ab9086f77dd50f37175e9be9.1730732225.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9956:EE_|AM2PEPF0001C712:EE_|AS2PR08MB9426:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a0cb9f-907b-4eae-4c44-08dcfd8b149c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N0IrQmh4bFVNQm9uN2NrWThwU2pQeUhyMHNsS2J5OGJoalNTYmtXaEpCejU4?=
 =?utf-8?B?TzdYQlhieXQrUTBwT2xuVnRxdlhEQm9hZDYvcXJIYzRCQi9BbmVyRGw2bXBG?=
 =?utf-8?B?L1hwdXRuQ0thZmtFT2Y2eEJwNktjbUd6M2txdU1LVDUrMnhVeDNyMHFLZ3NX?=
 =?utf-8?B?STU2UmVzUElyYVBSbjNBL0hBUEI3VzBSbC9QajduaXY1ZDB2aXdJN0t3KytV?=
 =?utf-8?B?ZkgxaDlXL2taMkpmWWxRM2NHYlgrbmFPcnlkM3p5RTNmU1lZMjBtc3FZU3pj?=
 =?utf-8?B?Mm51ZitDYUZYRDhTczl1MVkwWGw4SElPeElNZGt0MXBWYmY4aVRpQlNUdXg4?=
 =?utf-8?B?SGxKN1Z1aUZSMTFFSWp0NXY2WVQzaitwSEZBVEc4allFdXBJQndVRVN4Nmxu?=
 =?utf-8?B?U0RpZEg5UkMvUGtCMERETlByMXI4TzU1a0JFb2VhUzdRQ21oYUZWS1JFUFQ2?=
 =?utf-8?B?TW01ZitPSVhmcVg1QlkvUHY2Q0xWMXgzUkVNWk05bnU4RjhHb0RjWlV3NnpK?=
 =?utf-8?B?NU9JTk9QMTA3ejdZWFRDbkFQd3lEdXVsa1ZuOUIzNFkxZGllRHR5QUM0NC9L?=
 =?utf-8?B?bGZYMEc1MUV3QXVyVU5KSFQzOHByanhmN3hGTm5abFp4amIyZ1orRkR6UGk1?=
 =?utf-8?B?WFZDbGM3L2V3QTcxNXVxRVlxdk5TWEw2SGFXZ3JPK0RpcW1UMUZ4YUd2OVVv?=
 =?utf-8?B?V2lySDZSRzcyZWxRdStIMVJvNklEQzkyMUFzc0NRbFU5RmVNRk10RkljRHBh?=
 =?utf-8?B?RG8yZzFpOHVIRXhFQ2NZZTZUS3dUUmtBekVXamJraTc4TUVzREM4OG1BS2Zy?=
 =?utf-8?B?SmlVQ2xCNDFZMWdOY3FreTc3YURLV0QzeFB1M0FBS0VPUGwzNDZodG1iQXNE?=
 =?utf-8?B?UTBDS0ZXWUcrNGxoL21iZnUyVENoSEJBcHozdXpKQ2FUYUcwelJncWhmODNP?=
 =?utf-8?B?VWFseXIyUmR1bXUwTUlzS3lPNVRVNlhidlk4REFGSUFzd001YjRxdkVJd284?=
 =?utf-8?B?N3R4KzFDTytlbUVwNnFMdWY2UGsrVjQ1dVdIVk1LUTI5am9DRTFrYjBLTHg3?=
 =?utf-8?B?UWg3bWNMNkdtQ2Zvb1Ewc1hzbzFJcmlHNlBvSWZSUTQvZWhBV08vUy9COUUz?=
 =?utf-8?B?V2Fxb0lkd0I4QVVTeUJST0VSa2liUzhlcElGeFFneWRTVWxoc1JKdE4wOTNT?=
 =?utf-8?B?ek9sNSt0UzdkMkZEdXhpMFkxTWI2MDFSOUkvQnVPSS81KzdybFJSOWFvU2JS?=
 =?utf-8?B?VEpHRWNvMWhScHI1Y1Y4Ynh6dnovWW5EcWlzUUZObjBxbmdBNlNnbWd5TzEw?=
 =?utf-8?B?d3Z4eW5XOHRSVVRZNW1Hcm9GcVVsKzNYWklnUkdKZmoweC9qbkRpRjVMMkxQ?=
 =?utf-8?B?N2pUVzAvcWdpMkU5QXNYaDRoSVdOWlgvVFl6ZVM5UlBIZnYreFJ0cGs5UGZK?=
 =?utf-8?B?QnZjbThDaUgyL3FvZmY4RlR1ZFdkRUNEaFhvR0lvM2ZVS0hUY2RKSllJOE5m?=
 =?utf-8?B?T1h5TVJNWXAwSDZjWkYvRlB5R1laVE1MQ21pYmh3SmJ0YU9MMk83d3J2RTRj?=
 =?utf-8?B?cEhiQjFJOXh4aTRmWnRNTzY1U2c4c3lYT0Z6RldYbjhjMUp0aWdNd0plVWp1?=
 =?utf-8?B?dXMxMDdNWmNoSWE2QXpONFBtdiszckMrNW14eXBUZ3hYeWdBcWY1QlZ5ZDJY?=
 =?utf-8?B?NEZhSXBPU29nYzZLcnFoaE1IYnVTcG9vUG1KbVk1TkFCLzU0dm1oUEJHRzBD?=
 =?utf-8?B?Q0tYMjM1S3Foa2tPVkdDdVBQbnk5T2VsSXl6dzRjQ3dZdTZpblRmSjY2bFNk?=
 =?utf-8?Q?lNVVrBo4FUKpfJXgX0ipXX9HU+eAgy7Pl/FL0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A5FDF6D9445CB44925C5930A74C9E8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9956
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01e2f796-7693-443e-e019-08dcfd8b0f07
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N3VzQUhsY3NOTDU0UFk1clZnNkpveDF1Tzk3ZWJzSlJqeU9mTytNY1JBT0g4?=
 =?utf-8?B?aERoR0gvS0VMbWlpbkZlTHNrSDlTcXByVzA1T0lrVVVVQ2NpWHJRTVlpbW05?=
 =?utf-8?B?ckFQdW5WNUpXdmZIalAzVlQ0cTNPTE1aUlc5MEsxOXRWZ1JxZSttQkVxalRD?=
 =?utf-8?B?UElRY0xnbGtUMk5Zak5KSHRWcjlTVGU2RzdZU1FHWndsejh6T2RrNVBoU2FZ?=
 =?utf-8?B?d2w4YTVvY1hPeFZLRENxVytrVFVsTGZ0MWtXbjBienNqSTZ5QWQvNjdaQjF3?=
 =?utf-8?B?NjVDUlVHSVQzU3dzMkVkRWdLVmpETWtqQjZDNldvY3hLT1ZqRU9mZ21BZUpJ?=
 =?utf-8?B?UzBoci9YdC9LNjgyUXUrd2xSRW5DSXErVGlLOVc3T2xlTWRTK2d2V09Gd0ZO?=
 =?utf-8?B?Wlh5eWNjOVBseGNmcmE5RzZ3TVlmd2pnOVdHZFUzSXNEbDJqVnQ1aEF1SFl4?=
 =?utf-8?B?SG5DTkNlU2dITG5SWGd1SnlQSXN5MmIyUjZtTktHOFU1eDlLRGhlc253OVpU?=
 =?utf-8?B?b1daVWFrU215UlRMSnBBOFN2M0FSR0xReWxoYWNudlNQVVYrdWdOcnRFU2N5?=
 =?utf-8?B?UU84aHZkdFluYjB4RE01MEFVeE14QWhwR3ZTaTZ0Y0pGTUo2NDFVcGVYSEpP?=
 =?utf-8?B?M1lwYnhER1FjVnJiOHUrSFhBSkhMTEJ1UWFCRThwN2RXYXJuM0ZjQU9sOVpG?=
 =?utf-8?B?bHBLTmllVGJjMVhRWER4TWE4cVpFVW8wNE8zbnJWVStDZDFjcldCaSs2V0tG?=
 =?utf-8?B?N1Y0eG5UTURLd3JFVlBhKzlFVEJRdE02SWphUHhwM3l2UnV6RlBqNWFYVG1U?=
 =?utf-8?B?QjJ6WFNhWE5QUmpmcm9ENitDem45dTBHMEFCMnJ5TklINUEyeXFzSmdYNkti?=
 =?utf-8?B?YlM1RjVEaGlYN1FBOG5HTndHa3daa2labjlmRjVMajF4eWhWODFVM2ttZUhZ?=
 =?utf-8?B?QXExR2w5c3pMcWVmdkZ0YzExTW5DTnZvQ04vZ1c4UjFNcWhRNVlBSUtsTmdn?=
 =?utf-8?B?d04rTGpVeWZ4V3NmTnhmV0RGSlk3NDNKaGY4R01LUWRhN24wMHI1bzlXTy9k?=
 =?utf-8?B?b2FlbGQ2eENZZ3gyb1RWelpwcmFsYVgwK0xSVHdOTW51eXZ4NGsxM0NDRFA0?=
 =?utf-8?B?eC8yU1ZBNkZQL2t2c1BZT0txTUdMR3AyMlRuSUtISndTZUg3Ti9UdmMxS0lH?=
 =?utf-8?B?WHVxZnV6RUJnOFVMT0QzSVlNVWMxakcwTGJZVlhScTNKVzUzREFtSVJZWHdt?=
 =?utf-8?B?L0trWmErOWs0YjFBVGM4UlFUYXFsbjdTV3RxT1RYRisyWUYzMkNDREtBNzQz?=
 =?utf-8?B?cVhkYjhHRzh4SW5pcGk5QjRuSHY2dkxuR3NxWEFEd2lsV0djS29wRTIyVjVI?=
 =?utf-8?B?cnNLRHR6d0I2b3lqYVdsVEVldDRDYit2TGltdm5wTWF4bmpDRkU4dUVVMmhI?=
 =?utf-8?B?N2VidlNEcFhmMXl3ZURxV08rT3BBcWhlWDFUcUl4eVA3b2NhMWQzaE5FTHlo?=
 =?utf-8?B?MEgxaHZqalNYU280Z2pxcUdDVTFtOHk5NmYxakM4VXVMSjRKNHhaYjBkb3Nm?=
 =?utf-8?B?TmZxaWFkU3FqcFVRZFFiVGR6YkJ3azNHZkJnRFl5Nkxta2NEQ1JKL0JsR21D?=
 =?utf-8?B?Y1JrRGFmVGJQLy9vTTJLUWFuRi9ZTzFqaGNOdkVmZVk4OWczVmJxMUJKVXEz?=
 =?utf-8?B?RnVMaGxodEFPcGlHN2ZvY0EyTzRxVGkzLzE2VEljNlNmbU9DYndEaVMzMkp2?=
 =?utf-8?B?VU1jMkNCd2Z5Q0I2b0VrV0NXT28ySUtUMnRtTUNIQjJPaHk3bDl1cDMvbWdu?=
 =?utf-8?B?QlNVRElLL0I2K1JTclM3V0s1UGtNK1Y2M2luK0UrQzQ2KzI5eCt3ZXcydUpC?=
 =?utf-8?B?QWVpRGxGZGtJTWFjRUV6WFJldEhON3JoeW5vQnpjdnA4Unc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 11:14:56.7367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a0cb9f-907b-4eae-4c44-08dcfd8b149c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 11:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206701

T24gNCBOb3YgMjAyNCwgYXQgMTQ6NTgsIFJvYmVydCBZYW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxsaWV6aGkueWFuZz13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArUEFDS0FHRUNPTkZJR1tuZnNkY3RsXSA9ICItLWVuYWJsZS1uZnNkY3RsLC0t
ZGlzYWJsZS1uZnNkY3RsLGxpYm5sLHJlYWRsaW5l4oCdDQoNCklzIHJlYWRsaW5lIG1lYW50IHRv
IGJlIGEgcnVudGltZSBkZXBlbmRlbmN5PyAgSeKAmWQgZXhwZWN0IGl0IHRvIGxpbmsgdG8gdGhl
IGxpYnJhcnkgc28gdGhlIGRlcGVuZGVuY3kgd291bGQgYmUgYXV0b21hdGljYWxseSBnZW5lcmF0
ZWQuIElzIHRoaXMgYSB0eXBvIGFuZCBpdOKAmXMgbWVhbnQgdG8gYmUgYSBidWlsZC10aW1lIGRl
cGVuZGVuY3ksIG9yIGRvZXMgaXQgZG8gc29tZXRoaW5nIHVudXN1YWwgdGhhdCBtZWFucyBpdCBu
ZWVkcyBhbiBleHBsaWNpdCBydW50aW1lIGRlcGVuZGVuY3k/DQoNClRoYW5rcywNClJvc3MNCg0K

