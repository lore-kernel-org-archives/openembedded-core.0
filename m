Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6C2EA4E07
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 13:51:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.160724.1772459470641977384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 05:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qys4IjNt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Qys4IjNt;
 spf=pass (domain: arm.com, ip: 40.107.159.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VZEKKuFgBaMLf7DYcffm9aJIPzQRaZmyyqFt+IZZvRZVd1++gTfpB+QBZSBxLZr4cxGTIQb1XI/6bQ8tDRpplmOX2r5rNvDBKb3HvSno4cwAZEO0XROftmLf1RfJS1hYmuhQ7OAKZX+5ZNdtqbs6gHJVnprYsmKJCYo9/HzaehUCivlNbMEwy6lbDHOYGlELbtxSxFmfszmBizppS4D67wJdPwbzgMskCrnZb+X83VysVSCm6cs4ikLoks4tCiGwDrcePipA42Hryig/sZxiGg+lo4NMpggOyuWYaaLAMQOygYJdqm1DPZVovt8xfGpMttEBo4VlK1j5VRX/aiq5jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUBhKtKADA/5iHwwMnxozMAf/hlruxhzk0jC0jCrCKY=;
 b=WXoPcTiNO4eb3a5zlT8k0bW3OnY2NrS3HOZeoVkiF5vkOKj/0k7QPw1LVOSWLso4SF4BIMKi1c2pr4y6IJta5+enllCQgXypcvUk9cJw4O5u02OAdd6t3tnUdlq/iAmmfd3RPHCRQieTUrNfFR+kl2Na/G+XVeE3PiNLovEdBml8J58w+8AyCqvBcWeV25sxpLQnZP4v6UgBw3+ynYLdgpnqbP/NCNmGEpi3g4dAmhqIuqVVpb/qKkY/uy+dgb5ibDziKLh9+l88b0Iq0LObeTp/ZDF6/jBCI9Xj8867xAz1J5uIoFfwsHedAScMuFlXiAMOCefdF8hcKtpGt3XV9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUBhKtKADA/5iHwwMnxozMAf/hlruxhzk0jC0jCrCKY=;
 b=Qys4IjNtRvVwngwXo+P1yBkOMYx4XYUMgTnpIyPL21n4rrEmSPwOw2fUkm136e/6gTK4jr/aAQFoZkiKGU6NyLCzbyE4VPX2cQXC/O6xvSSe++xQqzTn/OU6JdtNiZJPKboALMJ1aJfrJiihs0zpBit3ulgSL4DOQsbtA5ATOmM=
Received: from AS9PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:20b:46b::33)
 by PA4PR08MB5951.eurprd08.prod.outlook.com (2603:10a6:102:ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:51:04 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:46b:cafe::4d) by AS9PR07CA0031.outlook.office365.com
 (2603:10a6:20b:46b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 13:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Mon, 2 Mar 2026 13:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtX38oU37KaTAthiisBQLczq2x3y7pk3HYi9jLRccFIQwzngkPOe4DDWl7CxkNP8u5DscvTdqLenXHTjC5oLKeQHGxfPrREcjnrPspksOFSJp9PEcLUaBcAWQ7s9EM0r9MiutK6DTa/Jdwbz0ghVBQptRcGtzX4tSQVRj75CHU40+rNyc1SOnVdE5M7ZgB/4o9OuODpXua7F2sXKbRtfdKGzsARutazZEEHqUm6TvIw9DzvEybs2MTaeLoglOglm8AvKY3oBjugSHre71VAUVmBdMsFq1DNyJ1U8Oclq6iWYjg5dC+jffQ8Gk/LvVvFRZ0TzrteOHNxAgFzG8hBSqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUBhKtKADA/5iHwwMnxozMAf/hlruxhzk0jC0jCrCKY=;
 b=NkXOy9nlQnCA4WMe4QsZvZX+kuvxK5H9gcZXpDcmxaT/2obN3XE7VIoA45rFYRodSkVm4yB2HtbAO+U1dHN5dDsD4X/4AGjPrdrCAULsloljsnIfZwgO4DFjUeba7YHlAuk3BZpVB4/zWsEFH3bZluzi/UeFg5SkjMZ3gD/qyIA5LwfXwudHkyGd8if7vhWiIukjc09rN5M/0Rbim8v8wgUu/lGYfLkFsSF6XH9Tj90nPgEH+Um/d/xQP7huE2nm1sTPwJ6FA/vB405w3dr5EtfiIaqUmOHo05uw5KvkXPdphcLY48gvVZodA894v8jTOy/+BlgD6JkvlOS8wWAm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUBhKtKADA/5iHwwMnxozMAf/hlruxhzk0jC0jCrCKY=;
 b=Qys4IjNtRvVwngwXo+P1yBkOMYx4XYUMgTnpIyPL21n4rrEmSPwOw2fUkm136e/6gTK4jr/aAQFoZkiKGU6NyLCzbyE4VPX2cQXC/O6xvSSe++xQqzTn/OU6JdtNiZJPKboALMJ1aJfrJiihs0zpBit3ulgSL4DOQsbtA5ATOmM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9534.eurprd08.prod.outlook.com (2603:10a6:10:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 13:50:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 13:49:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] lzop: improve aclocal.m4 handling
Thread-Topic: [OE-core] [PATCH 2/4] lzop: improve aclocal.m4 handling
Thread-Index: AQHcplO1ss35YSd4jU6OlfeOqhXSBbWTxMUAgAeFcgA=
Date: Mon, 2 Mar 2026 13:49:59 +0000
Message-ID: <303FF181-61FD-4011-B379-2A541D25BACD@arm.com>
References: <20260225123727.2043715-1-ross.burton@arm.com>
 <20260225123727.2043715-2-ross.burton@arm.com>
 <DB5PR02MB102136B6FC33A6E0EC8AB347DEF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB102136B6FC33A6E0EC8AB347DEF75A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9534:EE_|AM4PEPF00027A69:EE_|PA4PR08MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 360fafb3-1a2c-43e9-ebd8-08de7862bf42
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 HDa9m9iOO+7/pe9IlUkJyEWTDJnTTe+8PxRaXk2feD9oeRjoYA7hU2oByPrWWvA9hkGezbh5B+0Hz5Vky0PwmEuugIZmvyywVTCilaFpNYdViwCAlok9djOLuQcFUENHvkMAbxwkZk40iEs89McQ8vg8mKhoX3r8smUIx7hNzG3MyeBE6bObv58rSbaKC/52Bdz9hbu0v3i+8elHuCK6ujlpyzSSNEUYV+qG0XrPWOX18wQwzFLcWWu8MpcfMF2PKcItMpi5WH4z7yYvGM/AImjwf0w6EuK554GVh6yvqH8z90NAou7raZkP+WBFUxFQUgWIu5MG4s+vsRofbk2m+9c6nZsFBulkgmTDPE9M6WZw1j9YseK+DjlWvNnn32OJ/kLw2Nx/1ioE06LDIjw28vv2SVLHEZBvvKWorzeznuPELtBYm3SswmA4beUKe9Dt/hPq596e1YFQhLBy5UrSDA2n4wRNZYlVILnPlekDCACXnDuSZYDl0z2A1O75w1x2mTRji0c0a+y8qUWvb4oslYifgI4cRgGAtE1bcWrzNSItPveZup0WwGY7BYlK5jzmNx4wneWkvzQACICB7GGVgxROoObXIUxOlLTcLkz7qnUoyE2sKjq7c/s6boP1WoIE+94OE6D0DLzTRKosxF6Q8AWh1luAwA9NDgOjSV+phPiDFIAKWFJQ6W8PsnWz2++g8eUuc6qutJq7OJFGhhsQjvzXiLBQGZOoIoJR8mxR+FHL2c0Qubn7SL4OgBLlBH5w76LjI8pr6kSHwNa44ipjvtQhm/3ao6IllOWXYBwQuFQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0BEC0BE461AD214EA0A177ED894D611E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9534
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	59c47482-051b-48c0-1c28-08de786298b7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|82310400026|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	X7PMCqMspEDqW/dgkv+u8hE8A8wqDyIRvrRHwwfpkIUROLolVsbLAgM1ICcEjCaMfK/RQ1YW6DlCbTGpcs91cDYAfTM7rf/4nZV5DLXa6peA5+kZp+QvdHYOqT6qktW6cjE/Hjgba41ZfZAfQbaUXrlbvupr1VLH740TJgfj8QLQpkGMZkCUs3ipzoBuJ3hkIASnG8dLAeJija8+txBSLOdpDCO74IhsTPyXQ6lD+qm3/tTl22g6ihGXhtTCCoDw8/Qr9VAimupyAcKu6Z/DWmaNxvi/mfVZWFW/D4IwYSRE/cA3RDAjAWFlJeHhNlVKpslPnM/EauFF9hJENTeIhN9fYgcoIp9VM4+BWD75/vpcyno1yQQIKXTg/JuYDp0H0vpxH98HAqLOuNhN65xtZAmOD4s7X6BTmPnRBuHnngi8MvmMSDyXXiTiMjjCsm3VMa/l/PiFmmqB8xrflsquI+PSLNlM56zXCLe0epKKC+5N6oCOcTee3yoB01XkrHn8Qdm1yTLu8nL0a1f1TRG7MeUAO47Xny/K8iUUZqVOdbmo2cRSRezAqefWJ3ild5fO6zhBXuRfG7wgvNaIQ10ql3GioY64RR5iQj6MTx8Vm9ZTuUZ/nYK/s1t3Ww6q3j9Ll2Cl6fKUljbQuxpOW5JNn6/pk5HqJR82VF4bvpYe1+OrvOyi0RtFarS9IikpaAIfkTFPAfbpftm9r/vzPYiB2ad4yIZmigSz+LCqoKFR0aqtw2ic6y0FxnrxEn/sJ46YMZyd0duX+4L4ZnQ4Rw9L2CR8Liz2YYK9Qyqm8Oh4WH4BNIIM+YcFgaQQEVALfTSN1jQigwaZJCezVNDqubqwGQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gXH9fV0hwuz0CV4PG1DVedoJMV1gFzLNeI+EwPWDPs/t3aM6ed7vJ06ifPS1vrDrUNCOw3QQ7P3gFEfVqIvL+s+XYBXs61Qnt972BNgn1NW+8bJ6bW2K0PFGHG/0ZtQEX+hReMZL0eqolzFA+Xwsagf/u5O/WcrmsnnT2ZiNtbeFuUk8EEXl080jMIqrpYRO2wmhG6ycle454lBJ4oAmYtXfDSCjuDOG9wsNPwcF9j20uqnuTYixvJOzojNI/61rAUIfpvMzf8gxXewt6ygubrO0xRptOjqqRGk7pgasTUbTiarICM3n/qIm0H38/LbeOdhJPEIFPY/3klknM5xgAMW6SLwbCvReQT8ghVnbkjs+WUsdrC/bUyHVuzbyXgq7+XqPLKTNiCKOqVbjYPmW/sIAGB0H0JsdR3m4Ao14o4ULwgngG7RJyEd+Dx8afu3a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:51:04.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360fafb3-1a2c-43e9-ebd8-08de7862bf42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 13:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232206



> On 25 Feb 2026, at 18:58, Peter Kjellerstedt <peter.kjellerstedt@axis.com=
> wrote:
> You forgot to remove the actual acinclude.m4 file.

Whoops. v2 sent.

Thanks,
Ross=

