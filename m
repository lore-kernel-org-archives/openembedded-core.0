Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CAFC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 10:54:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.64])
 by mx.groups.io with SMTP id smtpd.web11.58892.1721991265651089836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 03:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=haxrmGJR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=haxrmGJR;
 spf=pass (domain: arm.com, ip: 40.107.247.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Xp7OMgoRBGBsH0eXn7fRoGDUggAmMAIZbmp7fu+p+Pn5VFHoCCndqHaZdZC6cTA8Z+K1Yg19mymd24AChpEEsPR+C7Fuu7YG28+7KS0L0797/6aOH8iWzDQeAbSreIpK2kk5XamyePzmVPBfE4q2F1WqP0xA952OLIBP5UlBHdgw3LCNj5ri8W4Ypy22FOQARPVyNry9DziFwfRewin3I3XIVYYngy2A4xUi8LXxz7mcRK5ncOC6cPTUlF6u7mF22jwRvsrPdlptpoZVSgSfMTBMtwi6mwmbWjQzB9v4acgvcKShabFwr0dxrHxvJpcQhOVOjVROb+AQK2MIaYVk4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLh8CxUn9HjMah5vmoXXAfakOs8/Qx3SG2xpIH3vv00=;
 b=uABqWIXkpvPwA4EHJb6Upnib1NcGlJQo/a8crZezuKCCIMHcsK5vTJ1AaYGF5tdxxMCf2ztKQdSSKkJxJHT1/eq7ggUnwMML7Al+DTDRo0zIjfHXLMLUuI7KnoUfd2EIt8Nbs6nXs1DNAKlWArxmau4HaOE70O57FRq5Y46L1+2nQ+gkP/G1fQvrk/Jx9QikChv6M6TqODel8D59DP9ARTaZ61uhU0vZqpZcYTYIC0vRAgooVD9ZM2qCxfR6ZdveXD5jUIwtXgtUlJE3yq3x27HMAhJCw8RvbJ0u0+1z8KNZRSITugitEOmyjGBVhxqrf5+7357EeIrTooCocFJTJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLh8CxUn9HjMah5vmoXXAfakOs8/Qx3SG2xpIH3vv00=;
 b=haxrmGJR3d1ISLWnxlDVUovL5RB+lD7Kee3LKt6/tuship0a2NDCZ7u/7qs8bXLhGlCaLR0z5IH5vlgqh/DQNdtcQffiRyUS7YbjfW9ntksMCOiM/pEl6b7ar/TQJ5xOLA6YYqy5awS2FBDkoHvLNe7FVRTwxxbrjV5tZzp2NH4=
Received: from AM9P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::26)
 by DB9PR08MB9801.eurprd08.prod.outlook.com (2603:10a6:10:462::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 10:54:20 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::fc) by AM9P193CA0021.outlook.office365.com
 (2603:10a6:20b:21e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Fri, 26 Jul 2024 10:54:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Fri, 26 Jul 2024 10:54:20 +0000
Received: ("Tessian outbound ab09e808a502:v365"); Fri, 26 Jul 2024 10:54:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72806597cfef7fd7
X-CR-MTA-TID: 64aa7808
Received: from L0e2e1b6efb90.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 53219CB0-71A4-4AEF-B8AE-A7FCB824565F.1;
	Fri, 26 Jul 2024 10:54:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L0e2e1b6efb90.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jul 2024 10:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuKIiA8kJY6zcupo9ShYv+Mr1efYGZkbbgFF4DIKcsT47gzHKaWCP/lj3/fB6+i3JVIO4B5TKVN94senX3HF429LjVmpZPARX6O4R6u6u01xJZD9sbG8uo7MDUUMqJRR12YmBPFT+MwgUp/MZjiTucD8tE6W+g4P2U9M/atCJUeXqmuKfJquLLZ9NQ+Nz4HqcGNK7xIBMxGQxu6IQOGWVEsYrMtFGB6QX4sFcnvMaIWR2Z9eYr78o0OYagPKIZh3Zd8xCpBNhxZzPNGzic0V5kQrNaLP8MiKB3/OVVp0uiENwI5GH+hsMLE2mRZA7KEDt2rrzxqvpr1+Mc93zPecLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLh8CxUn9HjMah5vmoXXAfakOs8/Qx3SG2xpIH3vv00=;
 b=r59PEeueo1+/ZVhFCCqyOnayZBa/C+JtDO+TnYrRFYm2lQ12IgeIhDvl/h6NZWuiYodXhXsEouSxidi75m59sXut9dqyf9AMUPPoHV6foxncqjCbAZf2K5oWbTSr8hGGQUu9HR4TSOOE+707w/he12qSJOIb9TlbJ3rS4DRXqxAjoXPSJzOd7lW4p1GQW7Ebt34FhP9ncave3CHOO8pQd4F9HlXjVhVcg12g4zg2pk/aPfvuWtNnudD49SrO94h9stW77rMzu58mW0rzpxxLRz3q9/+lt17nFsSqeshxJ+MyW30THyuTg6kdGk39cRtvzufwMN1C1jTTIBA0eI+/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLh8CxUn9HjMah5vmoXXAfakOs8/Qx3SG2xpIH3vv00=;
 b=haxrmGJR3d1ISLWnxlDVUovL5RB+lD7Kee3LKt6/tuship0a2NDCZ7u/7qs8bXLhGlCaLR0z5IH5vlgqh/DQNdtcQffiRyUS7YbjfW9ntksMCOiM/pEl6b7ar/TQJ5xOLA6YYqy5awS2FBDkoHvLNe7FVRTwxxbrjV5tZzp2NH4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10554.eurprd08.prod.outlook.com (2603:10a6:10:52d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 10:54:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 10:54:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "li.wang@windriver.com" <li.wang@windriver.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [openembedded-core][master][PATCH] use monotonic time
Thread-Topic: [OE-core] [openembedded-core][master][PATCH] use monotonic time
Thread-Index: AQHa30oETIwcrJSB8UqXbUcJl7OPRbII1aaA
Date: Fri, 26 Jul 2024 10:54:09 +0000
Message-ID: <13E67CDC-D389-481F-8A0F-E6BB796D1C21@arm.com>
References: <20240726104843.1009770-1-li.wang@windriver.com>
In-Reply-To: <20240726104843.1009770-1-li.wang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10554:EE_|AM3PEPF0000A794:EE_|DB9PR08MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cc674f-6e1a-4eab-4782-08dcad614d7a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?qSHx8eD5gNXMWyAW91mtzdsB0s9CvY3NAfGaz8aLcPhj9NuhRjea/I5WZTo4?=
 =?us-ascii?Q?oxzieAEPkNwhwp/aSFlmenVS1NbKCuANr3m31DLAadpdCIU1kQmyVaSMXYJ2?=
 =?us-ascii?Q?lDPZSvKXi/PaJM1K9pH2sRLuqAVv0VXWm7AWBYDz78HDbOcfVBcyTdJTOC8g?=
 =?us-ascii?Q?BmUbkfde0c3KuT4ykFyE5swPssZfFnl1FAEHxTsHM4wHsmqhYO8WPqSVU0Fu?=
 =?us-ascii?Q?wKze5Bhn5TAmuRwnYbBd4KHO+HpEM5Ck6+kQ6k7MRjKopr3B+hSgeKuS2m85?=
 =?us-ascii?Q?wx9V8RnaCG9KX5KldFZ0Exd2DL92J6Wx024keGh3Ee1QWO0fRjSVqgeMbE1O?=
 =?us-ascii?Q?zj6irhfuO0m8OVx8r5Be7DswViMb594hFZdsbUrtcBIi0GOL57LBsatisby6?=
 =?us-ascii?Q?VS4R6Bb9WYM4Esn5iyzpP2Kx16slUrSTfj9t5O2zQKn3dkGOjTfSPXcuyfqz?=
 =?us-ascii?Q?LBbeY1ZD/UnZmw3bBpqLMg5AyDVXiS7V1pZ4AZfYyPxMHDZgMLq+TULALQop?=
 =?us-ascii?Q?2qJGkfKz1oS/u/qmfLRpGfWwWlx9Pwr9j/aeQbqAZkLerb12o8/L03jwpBix?=
 =?us-ascii?Q?C2AwlIkTkglflYXFvOCkYGdOasozXcf5hAJp3xx+8clPQiFDZMJt/By9HLTV?=
 =?us-ascii?Q?G1dMxzoVYNGbaFdg3FIXKHhxjnjo5T2XrOMpqZE5btTCZV05xLKHCdY1wSK6?=
 =?us-ascii?Q?SS26hjbqJQmyhHDYVJn0LpnTkGGrDXYIEZs5vCc/zM+TJxac2ygg+Ei1RlGG?=
 =?us-ascii?Q?swXuBNwlULhkdm+YzNUk1PTquIrfQoBM47x5sZIFgKdNAVJHkfKUqePMwSHh?=
 =?us-ascii?Q?dCU9XviHvUdxW1m/3B/7Sb7ZyZnUHp7lT8oNDRp3OOny4OiinR4vUYAqfjT4?=
 =?us-ascii?Q?tP+3KjpF+RxIicZoZW/jwFnTaMci2tNCM1kVa2qA6qYSI4Rx2ldiNZCGy9Uz?=
 =?us-ascii?Q?HKXG4pGElQY0ek5dCnOe3lGKyPNV1M/f7npAvLK0o1Ujx2rHYrN0Gzxe42GY?=
 =?us-ascii?Q?29jM3a6pCYJc7+/bYGAsfnx9nCOwm8z9bZYpa5Vp763LYHNGdS6/Uc3rdaJ8?=
 =?us-ascii?Q?a0vR38rgBvH9LTSkumwtru+oCrXrO6wnVOAUjsVWolSPaPucOIN0/11SA74u?=
 =?us-ascii?Q?/2QM9eawlzdNbhPtKyrttiirIhyDb6jpEMyV6nRYef1lQEgASGhrRo/E1FCI?=
 =?us-ascii?Q?RJ20Q/p2f6u/XIDmpwQ+400czcL37ZI2j1vhnjIOxsXZLrX9xhIxsJ1RaRJj?=
 =?us-ascii?Q?8ued8ycmsqOyPotDOMkCZhtQT/iX7bQS1QjjjBGwu7eXE7DEAqyqM0fTI2XU?=
 =?us-ascii?Q?K9tDRrhbuOWIJsMRwVeCvmSj9W+UAK+qwEbifTvE6TtNJ13FSZJ/VztOnZYq?=
 =?us-ascii?Q?OhHmiw4=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8BBF6F09D3F25A46928A17A6D5842606@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10554
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d6273d32-8eb9-4070-b3dd-08dcad614713
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|34020700016|4022899009|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6jFjiDCRSWl6wTiP1dMUGkPAwQqrHmQkXLuDKCXI+Likyy9aLS4Za3VgkMQM?=
 =?us-ascii?Q?xnJmqFECugVdRkIvUBPnrRjG2yVGoIRd1r3Z+5Dx/GUSBX7b9xkdt5HjpJMt?=
 =?us-ascii?Q?nVBlvmqCu9/v7pjfQJmGSHlLorX4XHfQIVNkUVCqGBODw8LLYw7Iq1+GwZ1y?=
 =?us-ascii?Q?D3tKzATSShkkv/dSTTzMw79YUcD/SvVr+7vNSZIcCS0Djbfw4P0meN/u+hhO?=
 =?us-ascii?Q?936TCLwVerPZkYgnb8E2td5NFWG+bE+GnW2P0rfPUlR66I/1iBFA/yUDUCKm?=
 =?us-ascii?Q?w3SMIRw94ZQqLDREaUJzvhh2MnbPREEceaw2dS+XsTojC2ZUZo3w/9J+cyE5?=
 =?us-ascii?Q?7FvoV6VeZdWM3udoTC46zXQHCU63uRvf4RsiObM0kSNEdh8uvg0vqR5xUau1?=
 =?us-ascii?Q?bqNlCpE8tHGT1Y2k9tiRz9ziZyZZO4M8jg8u64crA19Nr9drUR1V7f1r0G+i?=
 =?us-ascii?Q?lb027CkXOW5dbOuNqYv7A9nLFXMz2JOJU/MTmVvrXKNDUbKZmHtfH+jemHId?=
 =?us-ascii?Q?/q4u3x5KrYLcoCxIWa42B3njthvRbKgMhWlDVm5bj1s4Lo77PeAH2hJBJF5H?=
 =?us-ascii?Q?vRK93YRqLCXVOdeGlFVG0+q0M+JOc6ZZGl/9yuv5WVt6vBgulUAGMQojF7E8?=
 =?us-ascii?Q?cMx/xBKCRqhJced31NsLPIVeGKS7qg1RdjR9liZ+qThTmSw8bUYSrtO/H9YA?=
 =?us-ascii?Q?+NERGW+kYnj3KuOW/hQNlbOWfap21DflGCkOZI3Sqs5+0l2QB9Q+St/fUpAf?=
 =?us-ascii?Q?51eQ+WMMxA3YWeW+WpJdAVmcP5tMgRsWgEFQGbRMTQA0VPxavNCGtoTH4S06?=
 =?us-ascii?Q?v8TOrlv6odTpWfRM45RSe/u8tt6hXnGP6V9nS8Y8ks1SFrDLQr7nYF0ZIKWs?=
 =?us-ascii?Q?O6gUjvifMg5xlRxasXgXzOxNwFck+F53jHV7sjjxxSJ/R4Yxi0BMXH8PNTTV?=
 =?us-ascii?Q?mTEyb7E9LOFRPiTStfGCjVvQuVOgRS9FohY8jsW0mNaSpsJYMOiblPxOlX9d?=
 =?us-ascii?Q?6uxUDdfeO/uLyFaddJkHI4B1ZG0202clxfNaBRH8DzjiQn7k+h0gQ9BKgdhp?=
 =?us-ascii?Q?oBqON9XZ1JayGrFyMTz2U3tBtD0hwtkguEyQkobRR3R0575P0wrMmDJyxH+T?=
 =?us-ascii?Q?8nM4QMExMAIQXZ5Xs7IYemsRZncMC6aJp9hrxGhAfML6Yf0KY+6Nxzo3vtkj?=
 =?us-ascii?Q?Zxp/9AmB+IGrcUM27aqOpCN2u6ohzxmF0daJeCFkOrj5tUEXb+4/PRmRFLuf?=
 =?us-ascii?Q?gHFMADeoO9Chvl5QlakGnu9Lj+CHNtVQeVHBsrEw5lmqWiYZLbs4RxQUgFMI?=
 =?us-ascii?Q?Bka7F2xavp8IdM596c2iZFKzHeUbTZuhqIug4qbtKX0d1Wt2WL/xZ2tERCFu?=
 =?us-ascii?Q?LlJ/vgM7/R7dN4DRvp63yhjGWGPMX1tFeYbGQhRg2/MuucI2QA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(34020700016)(4022899009)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 10:54:20.2278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cc674f-6e1a-4eab-4782-08dcad614d7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 10:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202521

Missing the recipe name in the shortlog.

Ross

> On 26 Jul 2024, at 11:48, Li Wang via lists.openembedded.org <li.wang=3Dw=
indriver.com@lists.openembedded.org> wrote:
>=20
> when using xinet.d to limit rsync connections and time is set back,
> the connection limit is reached very quickly and rsync gets deactivated,
> if time is changed again, rsync is never reactivated.
>=20
> date -s "xxx"
> xinetd[xxx]: Deactivating service rsync due to excessive incoming connect=
ions. Restarting in 10 seconds.
>=20
> the timer of xinet.d is based on time() function, and it is affected by s=
ystem time.
>=20
> Signed-off-by: Li Wang <li.wang@windriver.com>
> ---
> .../xinetd/xinetd/use-monotonic-time.patch    | 246 ++++++++++++++++++
> .../xinetd/xinetd_2.3.15.4.bb                 |   1 +
> 2 files changed, 247 insertions(+)
> create mode 100644 meta/recipes-extended/xinetd/xinetd/use-monotonic-time=
.patch
>=20
> diff --git a/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch=
 b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> new file mode 100644
> index 0000000000..2144c3cba2
> --- /dev/null
> +++ b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
> @@ -0,0 +1,246 @@
> +use monotonic time
> +
> +when using xinet.d to limit rsync connections and time is set back,
> +the connection limit is reached very quickly and rsync gets deactivated,
> +if time is changed again, rsync is never reactivated.
> +
> +date -s "xxx"
> +xinetd[xxx]: Deactivating service rsync due to excessive incoming connec=
tions. Restarting in 10 seconds.
> +
> +the timer of xinet.d is based on time() function, and it is affected by =
system time.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Li Wang <li.wang@windriver.com>
> +---
> + src/access.c       |    6 +++---
> + src/builtins.c     |    4 ++--
> + src/internals.c    |    2 +-
> + src/log.c          |    2 +-
> + src/sensor.c       |    6 +++---
> + src/server.c       |    2 +-
> + src/service.c      |    4 ++--
> + src/signals.c      |    2 +-
> + src/time.c         |    2 +-
> + src/xlog/filelog.c |    2 +-
> + src/xtimer.c       |   15 ++++++++++++---
> + src/xtimer.h       |    1 +
> + 12 files changed, 29 insertions(+), 19 deletions(-)
> +
> +--- a/src/access.c
> ++++ b/src/access.c
> +@@ -70,7 +70,7 @@ static void cps_service_restart(void)
> +    time_t nowtime;
> +    const char *func =3D "cps_service_restart";
> +=20
> +-   nowtime =3D time(NULL);
> ++   nowtime =3D _time(NULL);
> +    for( i=3D0; i < pset_count( SERVICES(ps) ); i++ ) {
> +       struct service *sp;
> +       struct service_config *scp;
> +@@ -104,7 +104,7 @@ void cps_service_stop(struct service *sp
> +    msg(LOG_ERR, "service_stop",=20
> + "Deactivating service %s due to %s.  Restarting in %d seconds.",=20
> + SC_NAME(scp), reason, (int)SC_TIME_WAIT(scp));
> +-   nowtime =3D time(NULL);
> ++   nowtime =3D _time(NULL);
> +    SC_TIME_REENABLE(scp) =3D nowtime + SC_TIME_WAIT(scp);
> +    xtimer_add(cps_service_restart, SC_TIME_WAIT(scp));
> + }
> +@@ -284,7 +284,7 @@ access_e parent_access_control( struct s
> +    /* CPS handler */
> +    if( SC_TIME_CONN_MAX(scp) !=3D 0 ) {
> +       int time_diff;
> +-      nowtime =3D time(NULL);
> ++      nowtime =3D _time(NULL);
> +       time_diff =3D nowtime - SC_TIME_LIMIT(scp) ;
> +=20
> +       if( SC_TIME_CONN(scp) =3D=3D 0 ) {
> +--- a/src/builtins.c
> ++++ b/src/builtins.c
> +@@ -237,7 +237,7 @@ static void daytime_protocol( char *buf,
> +    int         size =3D *buflen ;
> +    int      cc ;
> +=20
> +-   (void) time( &now ) ;
> ++   (void) _time( &now ) ;
> +    tmp =3D localtime( &now ) ;
> +    cc =3D strx_nprint( buf, size,
> +       "%02d %s %d %02d:%02d:%02d",
> +@@ -308,7 +308,7 @@ static void time_protocol( unsigned char
> +    time_t now ;
> +    unsigned long base1900;
> +=20
> +-   (void) time( &now ) ;
> ++   (void) _time( &now ) ;
> +    base1900 =3D (unsigned long)now + TIME_OFFSET ;
> +    timep[0] =3D base1900 >> 24;
> +    timep[1] =3D base1900 >> 16;
> +--- a/src/internals.c
> ++++ b/src/internals.c
> +@@ -85,7 +85,7 @@ void dump_internal_state(void)
> +     * Print the program name, version, and timestamp.
> +     * Note that the program_version variable contains the program name.
> +     */
> +-   (void) time( &current_time ) ;
> ++   (void) _time( &current_time ) ;
> +    Sprint( dump_fd, "INTERNAL STATE DUMP: %s\n", program_version ) ;
> +    Sprint( dump_fd, "Current time: %s\n", ctime( &current_time ) ) ;
> +=20
> +--- a/src/log.c
> ++++ b/src/log.c
> +@@ -202,7 +202,7 @@ void svc_log_exit( struct service *sp, c
> +    {
> +       time_t current_time ;
> +=20
> +-      (void) time( &current_time ) ;
> ++      (void) _time( &current_time ) ;
> +       cc =3D strx_nprint( &buf[ len ], bufsize, " duration=3D%ld(sec)",
> +          (long)(current_time - SERVER_STARTTIME( serp )) ) ;
> +       len +=3D cc ;
> +--- a/src/sensor.c
> ++++ b/src/sensor.c
> +@@ -68,7 +68,7 @@ void process_sensor( const struct servic
> +                time_t nowtime;
> +                char time_buf[40], *tmp;
> +=20
> +-       nowtime =3D time(NULL);
> ++       nowtime =3D _time(NULL);
> +       msg(LOG_CRIT, func,
> +           "Adding %s to the global_no_access list for %d minutes",
> +            dup_addr, SC_DENY_TIME(SVC_CONF(sp)));
> +@@ -113,7 +113,7 @@ void process_sensor( const struct servic
> +                {
> +                   time_t nowtime, new_time;
> +=20
> +-                  nowtime =3D time(NULL);
> ++                  nowtime =3D _time(NULL);
> +                   new_time =3D (time_t)nowtime+(60*SC_DENY_TIME(SVC_CON=
F(sp)));                     if (difftime(new_time, (time_t)stored_time) > =
0.0)
> +          {   /* new_time is longer save it   */
> +     char time_buf[40], *new_exp_time;
> +@@ -163,7 +163,7 @@ static void scrub_global_access_list( vo
> +    {
> +       int found_one =3D 0;
> +       unsigned u;
> +-      time_t nowtime =3D time(NULL);
> ++      time_t nowtime =3D _time(NULL);
> +=20
> +       for (u=3D0; u < count; u++)
> +       {
> +--- a/src/server.c
> ++++ b/src/server.c
> +@@ -228,7 +228,7 @@ status_e server_start( struct server *se
> +          return( FAILED ) ;
> +=20
> +       default:
> +-         (void) time( &SERVER_STARTTIME(serp) ) ;
> ++         (void) _time( &SERVER_STARTTIME(serp) ) ;
> +          SVC_INC_RUNNING_SERVERS( sp ) ;
> +=20
> +          /*
> +--- a/src/service.c
> ++++ b/src/service.c
> +@@ -840,7 +840,7 @@ static status_e failed_service(struct se
> +       SVC_LAST_DGRAM_ADDR(sp) =3D (union xsockaddr *)last;
> +             }
> +=20
> +-            (void) time( &current_time ) ;
> ++            (void) _time( &current_time ) ;
> +             if ( sinp->sin_addr.s_addr =3D=3D last->sin_addr.s_addr &&
> +                                           sinp->sin_port =3D=3D last->s=
in_port )
> +             {
> +@@ -867,7 +867,7 @@ static status_e failed_service(struct se
> +       SVC_LAST_DGRAM_ADDR( sp ) =3D (union xsockaddr *)last;
> +             }
> +=20
> +-            (void) time( &current_time ) ;
> ++            (void) _time( &current_time ) ;
> +             if ( IN6_ARE_ADDR_EQUAL(&(sinp->sin6_addr), &(last->sin6_ad=
dr)) &&=20
> +                  sinp->sin6_port =3D=3D last->sin6_port )
> +             {
> +--- a/src/signals.c
> ++++ b/src/signals.c
> +@@ -301,7 +301,7 @@ static void bad_signal(void)
> +    else if ( total_signal_count > MAX_SIGNAL_COUNT )
> +       _exit( 1 ) ;      /* in case of a problem in exit(3) */
> +   =20
> +-   (void) time( &current_time ) ;
> ++   (void) _time( &current_time ) ;
> +=20
> +    if ( interval_signal_count > 0 &&
> +             current_time - interval_start <=3D SIGNAL_INTERVAL )
> +--- a/src/time.c
> ++++ b/src/time.c
> +@@ -41,7 +41,7 @@ bool_int ti_current_time_check( const ps
> +    int16_t     min_current ;
> +    struct tm   *tmp ;
> +=20
> +-   (void) time( &current_time ) ;
> ++   (void) _time( &current_time ) ;
> +    tmp =3D localtime( &current_time ) ;
> +    min_current =3D tmp->tm_hour * 60 + tmp->tm_min ;
> +=20
> +--- a/src/xlog/filelog.c
> ++++ b/src/xlog/filelog.c
> +@@ -190,7 +190,7 @@ static int filelog_write( xlog_s *xp, co
> + if ( flp->fl_state !=3D FL_OPEN )
> + return( flp->fl_error ) ;
> +=20
> +- (void) time( &current_time ) ;
> ++ (void) _time( &current_time ) ;
> + tmp =3D localtime( &current_time ) ;
> + cc =3D Sprint( flp->fl_fd, "%02d/%d/%d@%02d:%02d:%02d",
> + tmp->tm_year%100, tmp->tm_mon+1, tmp->tm_mday,
> +--- a/src/xtimer.c
> ++++ b/src/xtimer.c
> +@@ -11,6 +11,15 @@
> + #include "pset.h"
> + #include "msg.h"
> +=20
> ++time_t _time(time_t *t)
> ++{
> ++ struct timespec ts;
> ++ clock_gettime(CLOCK_MONOTONIC, &ts);
> ++ if(t)
> ++ *t =3D ts.tv_sec;
> ++ return ts.tv_sec;
> ++}
> ++
> + /* A note on the usage of timers in these functions:
> +  * The timers are composed of 3 elements, a pointer to a callback funct=
ion,
> +  * the expire time of the timer, and a unique (pseudo-monotomically inc=
reasing)
> +@@ -68,7 +77,7 @@ int xtimer_add( void (*func)(void), time
> + return -1;
> + }
> +=20
> +- tmptime =3D time(NULL);
> ++ tmptime =3D _time(NULL);
> + if( tmptime =3D=3D -1 ) {
> + free( new_xtimer );
> + return -1;
> +@@ -107,7 +116,7 @@ int xtimer_poll(void)
> +=20
> + for( i =3D 0; i < pset_count( xtimer_list ); i++ ) {
> + xtime_h *cur_timer =3D pset_pointer( xtimer_list, i );
> +- time_t cur_time    =3D time(NULL);
> ++ time_t cur_time    =3D _time(NULL);
> +=20
> + /* The list is sorted, low to high.  If there's no
> + * timers left, return.
> +@@ -163,7 +172,7 @@ time_t xtimer_nexttime(void)
> + if( pset_count(xtimer_list) =3D=3D 0 )
> + return -1;
> +=20
> +- ret =3D ((xtime_h *)pset_pointer(xtimer_list, 0))->when - time(NULL) ;
> ++ ret =3D ((xtime_h *)pset_pointer(xtimer_list, 0))->when - _time(NULL) =
;
> + if( ret < 0 )
> + ret =3D 0;
> + return( ret );
> +--- a/src/xtimer.h
> ++++ b/src/xtimer.h
> +@@ -22,4 +22,5 @@ int xtimer_poll(void);
> + int xtimer_remove(int);
> + time_t xtimer_nexttime(void);
> +=20
> ++time_t _time(time_t *t);
> + #endif /* _X_TIMER_H */
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recip=
es-extended/xinetd/xinetd_2.3.15.4.bb
> index c6d356d227..94fc28ff6e 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "git://github.com/openSUSE/xinetd.git;proto=
col=3Dhttps;branch=3Dmaster \
>            file://xinetd.init \
>            file://xinetd.default \
>            file://xinetd.service \
> +           file://use-monotonic-time.patch \
>            "
>=20
> SRCREV =3D "6a4af7786630ce48747d9687e2f18f45ea6684c4"
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202520): https://lists.openembedded.org/g/openembedde=
d-core/message/202520
> Mute This Topic: https://lists.openembedded.org/mt/107559216/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


