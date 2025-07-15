Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C335C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 16:29:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.13])
 by mx.groups.io with SMTP id smtpd.web10.158.1752596988837160075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 09:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VHZIbN2G;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VHZIbN2G;
 spf=pass (domain: arm.com, ip: 52.101.65.13, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qIC+6Gr1ZqBa287DLcfcax0IdFnYaarkVd17y9FJcGOpMsmHgqO09KudKbULBkX6LAXsNSh0ddmA8ioKVYPo1OJjLzEnnqnGdhFuHntk7pE8DATqh8rDcmt5KyuK0KF2zOa3BlWS+ph5ke87xQtUNP5uaPCH+4ND5FOWkg7o5y8PRgnykt4qDtc+15Gw4kz348QxBxeDlyUqRwvTclJoxSthlTHMstGnqjxNw7tGXm5dG6cFBEeNYmvzeJXugWuxZyuVCVlaGi77M+Jib8aiLVAdpt0yuqgEErKEFQh1q0CMXM4Thl+z9oe8KyIAk0FGyp5gHJ3nYIED93EOLDLgOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLjw21w43uYk+9FXvA5f9PmowBAsP1TbR4MJEmvmHKY=;
 b=KWMoAYagKGqqwhkAIs4/Q0QC0P5NEgxfjWT+eyATDFyAFDdVttGc8FQ9pu4Rn7uBHVDhnRoxlgC49JmXkX61SHGCAIAdkVO0Q7CgjavqSzXw3HIJlkZeCiaiOyDsbbFLTCubVlkQRq62PFwOf4pVUD/5ToCgO13BKNfb88ZoI02veHhzJONqOlNINb0biEbMNNPZ7oQEYCied1CRWzxnRzlpyZvTD7yqXSYf35ENQGyCfoCDmfDlzthQZOnDE+moCUlyWV3rWPUBm2CbJzQNJaj148sIKoDIqXWhnOQaouoixwR43HTQzBVZApt9keoQAxGFS4D/7jCPxogWwxCu1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLjw21w43uYk+9FXvA5f9PmowBAsP1TbR4MJEmvmHKY=;
 b=VHZIbN2G1rcAnKWt/PIl4m8JIeoQj7x0T+XV+1myfiC3560AqmrpGBliORxv8OjAlPOySdxFLgCMNA3vQ+ZI3bxPa52+0Wrg0nH9j/hoBf4xjMTO+ZsWHktZLfUrcN9LaIdK2fD+1G9vimdMAfr0P00AOe4Dg5tWMopP+kMQF8Q=
Received: from CWLP265CA0431.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::7)
 by AS4PR08MB7406.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 16:29:45 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::59) by CWLP265CA0431.outlook.office365.com
 (2603:10a6:400:1d7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 16:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Tue, 15 Jul 2025 16:29:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHR7zoVaVwZJVlTn3qq7jd+D1b/a16OnctcBRk+DXXh4XMAF+Gh5IhbQGk6VXQB43eTcMRtutxAmgyVrsJItZclOh9VC3K6TkfJIZ08ecOVlOLIy8Fc9sVon2K5ZopHDFuqn1lorOWgzDpNbMzeLPxPxwn0M83L057gzMgb0gcA6oOGUxdPDIWGIAg4d4PE+QK7x8PmArevqlDWrBRhJYZfT1mfqNwZMWF327KnBxWuH70NCvJnQYPEY6CJHscNNwFZCQ7L35lqWNWWdTG9lkT0ALogj2q72MPDq8CliQteQAteg3BLr8tCegVuWpPYjDui67gdp7oevKgMA67oRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLjw21w43uYk+9FXvA5f9PmowBAsP1TbR4MJEmvmHKY=;
 b=Fc0Wg/rvo+8YGn1rb2ogBluSwZyruzqthd5HcZCBwPI7xDamHCntIu7s5JYENUf8DkdYJKyco6uuSNqsUBHdlsLZ5DzLjQc0vm3hR70lCvnXO4Y6GltUUIBLKm2A8vfXeS2Rhdbb4MI/E1ZsfkszMPEk/LZPTpbToC+bCLwb7XQIIU96E1/j2fL4PZRUAFQqtf/9BjkRZ4azLy9rbdC/SKkmG0cQsgNICN81RXobQ+lpmMVG52sIgEvsQ5DMTh97ZShBCNnjSkGnnO2wXjtpXf/kYtgSd9U36DMIZ9E71uxu1RDQP7mM+gGpS/5z/Y5en+qR6dcYM8ByPZVGAZcIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLjw21w43uYk+9FXvA5f9PmowBAsP1TbR4MJEmvmHKY=;
 b=VHZIbN2G1rcAnKWt/PIl4m8JIeoQj7x0T+XV+1myfiC3560AqmrpGBliORxv8OjAlPOySdxFLgCMNA3vQ+ZI3bxPa52+0Wrg0nH9j/hoBf4xjMTO+ZsWHktZLfUrcN9LaIdK2fD+1G9vimdMAfr0P00AOe4Dg5tWMopP+kMQF8Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8570.eurprd08.prod.outlook.com (2603:10a6:150:82::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 16:29:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 16:29:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libclc: split out of clang
Thread-Topic: [OE-core] [PATCH] libclc: split out of clang
Thread-Index: AQHb9ZgSn0qv46Tt4Uy1mH4P/+mmqrQzR0AAgAABcQCAAA1kgIAACdkA
Date: Tue, 15 Jul 2025 16:29:06 +0000
Message-ID: <2445E616-D8A2-4480-AB94-DDDA2E37336B@arm.com>
References: <20250715143139.1829393-1-ross.burton@arm.com>
 <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
 <E2842659-CDB1-473F-91F5-9074337D1BE8@arm.com>
 <CANNYZj_eT9sKEBORBOPdCSbh86N3eTngJ6qxQexbpa9oo2EbGA@mail.gmail.com>
 <42374d49-7520-4aee-9c47-665f807dd543@oss.qualcomm.com>
In-Reply-To: <42374d49-7520-4aee-9c47-665f807dd543@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8570:EE_|AMS0EPF000001A2:EE_|AS4PR08MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: d62089a2-aabc-47f4-1972-08ddc3bcce5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZUhzQXhzbkhFL2VKUmpxRTI5UVFBV250QmFkR05EbFlZOGxXQm1ZWTJnQVQw?=
 =?utf-8?B?YWRQZWZCOWF3eVN5TGdkaEt1bm1IQkNvdlhmOXVYb1NxYjJSL09JTnZ3QUtY?=
 =?utf-8?B?dEs5dHVKT3phbmM3M0NQQnZ3Q09TMVlsUm5XUHpZWGxpRzdDcm1qcW01VnNz?=
 =?utf-8?B?ZDNXVm56WHY0YnVOVFk0S1d6TXZYU2FZdFU5NXlNQ1pVN1dNS05LSXNYNExL?=
 =?utf-8?B?b1VrSXlXcWpVN3Q0eTBsL0VTa25ZT09SMVM0WmFmMTUyRktVblZ0SzdzKzlw?=
 =?utf-8?B?eDRtK1FOWGhOa1JkMjJYTGRpTnpKL3RBTjBIWFc5NENhVzNJZ1BKRVZVVk0v?=
 =?utf-8?B?d2ZZTUoxVlpaem9raUI5d2t2UUpMUUpaTW1XMGZYMEcyZS84N2VYYXFqQWxN?=
 =?utf-8?B?SCtrS0tjSU5UcFBaV0h1UGdQVkRWLzJiYlNRa2dQV0lxWnlILysyOWZPOTVn?=
 =?utf-8?B?U2xsY21nQ0dkVWNoK1I2UFdIZFkxV2dVM3J4YmJxcEp1QXRvRFZsd09iUWd2?=
 =?utf-8?B?VWN0b21lSDYyMnRkZXZUcjRZQ21WVi9aekhPUGdqcHJVamRBTlRZczdTZ1Ry?=
 =?utf-8?B?dllSdDIxV2lxWTFJWldNaXlYaElFNmxWMHB6R3pWdWJueHNoOFRUemNpampR?=
 =?utf-8?B?RkRrZHBVSDg1MGloQy9nQ3NKV2dwSGtVbmp1SElzK1pnSEE5MGg4RW42bjJk?=
 =?utf-8?B?MjRYOUQycGh1VEc4Z3VOUDRPNFBJV0lSZWdKSy9zcmRxSTJQVm03YXlheEMx?=
 =?utf-8?B?WmV4d2txdFErYUk3ZWRJR24rd1dFdjJxWUF3dG9UdUM5Y2k0dk45d0VRNkw3?=
 =?utf-8?B?UGdUTk44MU16WkUwK1YxM0hyRFZxaWwxTmEwU2VqYVdGQ0kyR1Fobnk3dTBj?=
 =?utf-8?B?MUsxdnpqK1pJT2RVb0JSVlVZbFBNRzRHU1FBK2t6V251TXZsSDlKaEN5b0VG?=
 =?utf-8?B?cEczRyt6LzZGUnNnOFBCbzJZdUJ5bmpEWjhCcnlzMERzeGtxdCtkTW5HODFC?=
 =?utf-8?B?UHk1WWZKYXJNTlpnbWI0cjNNaHRYZFVYNU04cXM0dFBJcWxlRk5ZaWltY3Ry?=
 =?utf-8?B?QlN0TDA4SEozbmZRR2Z2ZU0vdjQvNlptMk5aQmJhanRrNktxOVNqTSt0OGQ2?=
 =?utf-8?B?bW9MTjhVQlB1ZzgwQWt6cFFQMTJmNlowRWxtTUtRZUVUT3ZuNlFxamFtL3d6?=
 =?utf-8?B?M3dhbWdhOHE2aC9HRHlSMVdicGd3Smw0RDdDdzIwb09MUms1Q2luNkp1RlF3?=
 =?utf-8?B?U0laN0ZEYUtoNFMwcW84UDFpd0lNczN5U21YNEVmQjNicHZYZXlZWTczMkdD?=
 =?utf-8?B?THNoZ0VkY25lLzJDbk8zRUNoSUE1RTVoTXdnNnc3R3NzTjNseXJOTDh0SHRB?=
 =?utf-8?B?SW9GY29FZGErWkNYU29xb1dVMTF0d0ZXUElyRXQ2U3NndFNjNVhscDAxTWZh?=
 =?utf-8?B?K0hHd1BuQ0F6VU9EWElReTFPLzhnc2t0bjdFNjNZV0hCS0hoY0ZOalZhL3Jp?=
 =?utf-8?B?cWx2UkZxZ1lhK0pFQWFSbHNyZnM0bkowWG5wUXg2NSsxVUtRZmRuTkQrQzJU?=
 =?utf-8?B?ZWVCaDBLNC9NWTl3Z2p5alBnZjhyTFFFU09veXFZcmo4TUo4WFlnTlhZUnJB?=
 =?utf-8?B?Qld5ZFpkVmNsUmltb1ZzaE53cnVCZ2Fmai9IaFlhZHFrVnJTYTMzNDdNRDdi?=
 =?utf-8?B?N01WV2lrOW9zM2VTTXI0VnlaUXlDa1BuclBuYnR1dDQvU1F1bmJMekg5RUJF?=
 =?utf-8?B?dTNubzJyYlc5b1ozR0dvUzZRblV0bTlwemdGUUhUb3pXQmJXbWt3eGpUdk5K?=
 =?utf-8?B?ZE1mS0wzMkJxaGdMYWtxdWJ5eGx4NW54cFIwS0E4QlJZQlpyZ1ZxKzRtNmsv?=
 =?utf-8?B?eDBGc2k5Y3BKdlEwSzM3ME5ZWHJsT2Mwb1o0UjlqVlptSlhWMmF5VmFpcCtj?=
 =?utf-8?B?ckViTnBISEJ5T2FHaWtXdFVReStXM1JiWGdacDBTZUZaUmIzeUs1aERtdTdh?=
 =?utf-8?B?UHVGcEFOWGZBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE60BF031150704AB7331C1FCAF84A51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8570
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4bd7edee-f8a9-4529-4c3d-08ddc3bcb7eb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVFNcFdaOEFZTlJtTitBSGlZL3g1TmwvL0FWdG1ac1hOck5mQVVMNEJJalBi?=
 =?utf-8?B?dmwydm1kVUpyYSs5NC9qRWF1MDM1Q1NtSUYzY0hINFRQcFN2ejBSOWhkeDdV?=
 =?utf-8?B?Y1k1ZFFJdE84YnpINGZJZHFIcUZwcy9aOXJiSmtOOExIN2lRNTJVTUJybW5z?=
 =?utf-8?B?bjNxMGhXejlBL0VLcnM1UFRJd0xRUnFReTlMWGdsbVUwdVpJTlBMMGtMcmJu?=
 =?utf-8?B?a3dpMnFVbGVEeWc1NGVTTTZNWXM1dDhLTHZNNzVmYzNMR0JlWWFEZkR4QmN0?=
 =?utf-8?B?MWQ5WTZHWGtDQ2RLZHdpNW5id2czcGpabk1EWkdhSEk2azZnVEFKalR4RDM4?=
 =?utf-8?B?bTRXT2dTME14aTNYcElPYStxYjdUUUpSaDlHSDFkZVBZWTBWYU5WNEhvR25l?=
 =?utf-8?B?QWR2T2dmWUFuakUwWWxRRTQ0QzR3VFA3cml6MkZ1b0RObG9QazlkNmlFZGpO?=
 =?utf-8?B?RUsvSnFrQU12NDBLV2hBb2FEOHFxVFprUCtQdm5aSUM4Wjk1RWk3UnB1QVZz?=
 =?utf-8?B?bml6OWc5bjFwZWorb21ZRWs4T2FXUGZhZWNMK0x1SFJsbFFBbGVOdlJvd1o1?=
 =?utf-8?B?dktrYTBDRGVKeUpWMzFrc1BSUG5EaERoYnBOMVVTRzhLb2VUdSsrbERMd3ZN?=
 =?utf-8?B?b3c2SGc1d2QrK0dDNHJTM1NCWEN1SGYyQ2ZBeVJ3TG9DT2JvemtSNE90R3ln?=
 =?utf-8?B?RDREa044bTVuU1B4UjlBWDVPV3JpN0RmU0tnMm5oZGpXbjg4S1dVbVE4ZjFC?=
 =?utf-8?B?UTJmK2RuZGZ1ZkprRE1xeUduTWJUalV6bGlVZ0JaZzRiZE1KNGhSSFo0cUM3?=
 =?utf-8?B?YndkZXc0SmZZcDh4bTdWaUJZbDFsNzRBU1o5dk5IUDFSa0dSelNQOXE5bFpw?=
 =?utf-8?B?bHdPaGVkNUg3RkMyeTFqQ3ErOGgxbWFWcS9BSC9jSWJmRWpTejZJa3hUblRT?=
 =?utf-8?B?TVJKZ1duSi9IZGVjdjFYZ2x4Mk9RajQxQ0JZZFE3TzF2RXBaWWxiM2grdnZH?=
 =?utf-8?B?SFpBcC9EZ20rd2I1eVMrYUhyOEZJV1c1V2dCcEZxRG0rblJHRzEyNmlldTVW?=
 =?utf-8?B?U25QNDJkRTUzckNlV0liZGtFdDVKWEJ0eTZjMlBERmZsczNOMEtJMUhMWWth?=
 =?utf-8?B?aDlrUkgxS3lpMEJ0QkxwUWU2M3YvZTZjQXNEeUJZNzNhZjA4Y2Jzczh1dWhI?=
 =?utf-8?B?Tkp4ekkxbWlUYVg1YjEyQnV3S2ZGdlptMVlaS05xZ3Bua1RWU1QrSng2UGV6?=
 =?utf-8?B?UkM4TnN3MVMrR0VIOTE3TE9ROWVZZkVuMDZZQ0ZtYy9naHJJYnczL0pPRHZ3?=
 =?utf-8?B?M29VeVJDRWllK09MbGk2YWFRZVBkdmZ4M2FkRmJNOU9rNWdScW9XNmlkSWJq?=
 =?utf-8?B?WngwVUhua3hYTVl0ZzNxcVo1Nzh4MHJUVGNPaEFPUEczWlhsQS80TTgySW8v?=
 =?utf-8?B?d252bFNpNFhLbmtqM25DMldoMVp3ZWh5M1p6b0k3NlNGTTBiMGZoSmVwUnJa?=
 =?utf-8?B?ZHRmN1FXSGhkMHdpNVo1QmZuWjV3R1VzMm1DWlBKaDNZTmdJaVg2UEhaWW9z?=
 =?utf-8?B?K1F5S2dlVWJxM0M0Vm9GUnJnYTIxMmtTUFJkb2hLazdBTUwvU0FXLzVpbC81?=
 =?utf-8?B?eURhd0lrU1N1SENld3d3Q3ZQU0VlL0pmWUtOR2NUWkk0c0RBcWdVMG5COThq?=
 =?utf-8?B?UFphOTh1NTUxSFVlVzRxYlRaaHhwSTlzQk90N3gvVUVGY01CcEYvTmswbmFR?=
 =?utf-8?B?RHcwWHhIS08yV2lWWWZ1UXhkZkFxeWRxWHNyTlNSM3doUTZPWTVLSUcxZzBQ?=
 =?utf-8?B?aGZweWRQdFZSL2RMcGVwMjJEOUFPUXNkRmIwMktWK3JOU0NNQ1JQK1Q5eDk4?=
 =?utf-8?B?Q1lMMDhlZGhoTk5Ic2E5eEJ5VjBpYTlGSXVkR1ZDaE9zbktwYlNlUHAvbXV6?=
 =?utf-8?B?YmhoQXFMeGN0R2dMY1FBRFBDUEllNE55WkRFditvTmRjTGVLV1Z0b3RnbFow?=
 =?utf-8?B?RHlQTWM5cW5jVFFRRTZnZHBSZUZoZFFPSG9Hb1RicXZiVnZ2Yi9kYXB5a0I4?=
 =?utf-8?Q?Il3U9Q?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:29:43.9578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d62089a2-aabc-47f4-1972-08ddc3bcce5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7406
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 16:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220406

T24gMTUgSnVsIDIwMjUsIGF0IDE2OjUzLCBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNo
a292QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOg0KPiANCj4gVGhlcmUgd2VyZSBwYXRjaGVzIHRv
IGdldCByaWQgb2YgdGhlIHNlY29uZCBjbGFuZyBidWlsZC4NCg0KVGhhdCBoYXZlbuKAmXQgbWVy
Z2VkPyAgQ2FuIHlvdSBwb2ludCBtZSBhdCB0aGUgZGlzY3Vzc2lvbiBmb3IgdGhlc2UgYmVjYXVz
ZSBJ4oCZbSBzdHJ1Z2dsaW5nIHRvIHJlbWVtYmVyIHdoYXQgb25lcyB0aGV5IHdlcmUuDQoNClJv
c3M=

