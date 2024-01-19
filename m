Return-Path: <davide.cardillo@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247B8C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 12:14:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.66])
 by mx.groups.io with SMTP id smtpd.web11.20568.1705666471886588714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 04:14:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@seco.com header.s=selector1 header.b=q8VsetAh;
 dkim=fail reason="dkim: body hash did not verify" header.i=@seco.com header.s=selector1 header.b=q8VsetAh;
 spf=pass (domain: seco.com, ip: 40.107.249.66, mailfrom: davide.cardillo@seco.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Bq7whMnRhOzu8n/kXn/VR4+3Z3Akqbd2an5rjzQZA+nZqyNjY9jaSdb8pOSBT1GTpluQChpYXM6qUkCkAnIUlISI0KZouh68Xc+ZbNKpua1odZD/+skiM0Hsnfuo6IGV+N6N+rhV3oFsWYiNK0+KrHrhBdV5YGKCG3dk3MqlM7L48bPEcX0chHWfq/N25nKll6iMhnxGijN6vF+pC6b8M5K0FX4xgWOg9NLM8Efy+vjiBAjSM3bWB8leL+/fgRnVHxH1ou9f4OsL6RkurW30z9ZcoZaK9ZthMeg9HVBDSNSEqXBHZ2Qys40mkNIo4wPVzH6YCBvfUlGYIJiWkVkk2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef2XzLX9u4Z3RP08PWJXxQEAZV94LDlCvfocN9NViMU=;
 b=nZz/I5oSN/0JzxwYgPII7+4YIHBpPp0rNE+bPwN3sxrGgoM6Wwl2IcI68AqvtJlCkq8/HfllU+VePj+TyppHrt9UBm5S4oE5WLrdupfSnhmfvvAROwyI9MoN7gtr0P8w25qRGygjqDT4xiuvRCACNsTPvPTfjkhf4cIc3LW5UGEIBbrL9hVJUHeddCJcU6Ki7vE9Zn0byu5ZUKqsai8Su6DEmFl3V4P7HpvjwgOKHgp4ToWNCnA5oaDMRXlstomdVG+QBpVV//odr+X1De9lvaE+WzYFkXi4uxCQOmwrW4gvhjfgFjFvdnf9BrQ6yIJnWbyYD7TA4BR8v1+UUXc3MA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=seco.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=seco.com; dkim=pass (signature was verified) header.d=seco.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com]
 dkim=[1,1,header.d=seco.com] dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef2XzLX9u4Z3RP08PWJXxQEAZV94LDlCvfocN9NViMU=;
 b=q8VsetAhyVhv4XyaBy9YCd2yZVl/664zwflgNtDufM2R0USSd50numXLVDa9auWaJubzmB1gwuFlFYV9ud8DIIf5a5kb0X2KCFNENpGtMlY/5qpjUcI5TazNSx/cj3WpoREmVGFydYQUgOoYB6aFBpizBDfT2JVDhq3koQovlpnpEUaKCreEL7682VRueCFk7qPme0BBCSIwoCmUUmTV/Rgd7e8TNCHyqOQNNM8ajmqHwk8iqvpzAGBrkbVd6QzchZV3LEttA3ssh5Pmkh0s20KW25yfB2PXxYCtq5Y+jaeSUTXXLsBrWqt+UcDwd4r2B6a3m+OIEShCEyYmHp5LTw==
Received: from DU7PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::28) by DB5PR03MB9908.eurprd03.prod.outlook.com
 (2603:10a6:10:48b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 12:14:27 +0000
Received: from DB8EUR05FT027.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:50f:cafe::ef) by DU7PR01CA0005.outlook.office365.com
 (2603:10a6:10:50f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Fri, 19 Jan 2024 12:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 DB8EUR05FT027.mail.protection.outlook.com (10.233.239.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.32 via Frontend Transport; Fri, 19 Jan 2024 12:14:27 +0000
Received: from outmta (unknown [192.168.82.135])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 52E0F20083981
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 12:14:27 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [104.47.1.50])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 5E9992008006E
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 12:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDGO66131ir31FIFjGNN8lt+zuZ00CSEqC8yTnU63fTwOtm0mF4fvLjQEFvnxuDaQC5u6nQUbYy8gNnzPEj8usXdarINf5U97zPErfEAY3nnlmVqaCAfP2NRb5vnn4+9QCO2X6jrbqviHPKUqPfcDuXxQbael67VumyR4pi59SfiovAvpZ521OD2LLzNe4sYXThteYGClegorNfkrpySWMIOvjkncmmKfsZdTwn9n1E7uojNfW4czF7TTFel5IZoVdk/irO7iQl9t6vg5Fj1FFUewfS5K2DYEZkqt34tVCUKJW50M2oc+Z+3H9MLmWOzUqkiKPgIYM7K4sADuZdEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef2XzLX9u4Z3RP08PWJXxQEAZV94LDlCvfocN9NViMU=;
 b=fzc2CRZqPeOF2eX5+ELdDkAP/kqyqGakeQ7EOb/BhdJ6khQLxNKoxWyNrFGw2paZM4+8treTUMyodNDtS6rG+42LqpQgGjy/eEf4PFhFqdC49zAuY8lEMuiPOjJKl/VHcsv+P3DxxhvS9DDur+YO38ew7z14ycdQh6mW0XOYthdVSwJ580q/pOTMWZ/OgluaHao/jkCmlu41bDBL2U/DEy4hDYXMiwyQO6eEzZVjjhqq5FVRRjfb9Jrwr+6pbcPcodI8jCpZvSAbDLBY19tVXS+JVKk/AahKcDTARw9m6pHz/jja2kVp3TlWRf5Tz7sP9/sc1EsRQa8BKT+TF7gWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef2XzLX9u4Z3RP08PWJXxQEAZV94LDlCvfocN9NViMU=;
 b=q8VsetAhyVhv4XyaBy9YCd2yZVl/664zwflgNtDufM2R0USSd50numXLVDa9auWaJubzmB1gwuFlFYV9ud8DIIf5a5kb0X2KCFNENpGtMlY/5qpjUcI5TazNSx/cj3WpoREmVGFydYQUgOoYB6aFBpizBDfT2JVDhq3koQovlpnpEUaKCreEL7682VRueCFk7qPme0BBCSIwoCmUUmTV/Rgd7e8TNCHyqOQNNM8ajmqHwk8iqvpzAGBrkbVd6QzchZV3LEttA3ssh5Pmkh0s20KW25yfB2PXxYCtq5Y+jaeSUTXXLsBrWqt+UcDwd4r2B6a3m+OIEShCEyYmHp5LTw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AM9PR03MB7348.eurprd03.prod.outlook.com (2603:10a6:20b:269::8)
 by GV1PR03MB8688.eurprd03.prod.outlook.com (2603:10a6:150:90::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 12:14:20 +0000
Received: from AM9PR03MB7348.eurprd03.prod.outlook.com
 ([fe80::3d93:1999:90a7:84a6]) by AM9PR03MB7348.eurprd03.prod.outlook.com
 ([fe80::3d93:1999:90a7:84a6%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 12:14:20 +0000
From: Davide Cardillo <davide.cardillo@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Tobias Poganiuch <tobias.poganiuch@seco.com>,
	Andrea Da Col <andrea.dacol@seco.com>,
	Daniel Rinaldi <daniel.rinaldi@seco.com>
Subject: wic: Configurable addressing of GPT main table
Date: Fri, 19 Jan 2024 13:14:14 +0100
Message-ID: <20240119121414.43990-1-davide.cardillo@seco.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::14) To AM9PR03MB7348.eurprd03.prod.outlook.com
 (2603:10a6:20b:269::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AM9PR03MB7348:EE_|GV1PR03MB8688:EE_|DB8EUR05FT027:EE_|DB5PR03MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f542f32-5e57-4069-b45d-08dc18e82eca
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JFeRm8eSVeO7/TrFRWG+lvA0ob1ADcdahjvc611e6FBsTvHBr6N0PrrV1u1YwU4zGbKZCiYd5fi8k73nVSGBFvID2UwL5iSlFNhc6kHyL6Sd+xLpQ9ZmMvAlmVFtKSl90D25D9JEuPP44eBj4pZcSCM0hU6+YxiqzXeIcP2tUxrhyit5yHJZw4w4SY8mAdjque4xJgBoAkMU8+7H1RRlkilZCBTu0sKZKFVRy7gPjMVS8v8sREhIp8LPKVii4mklO8WU6dAwmiJOyHcTCOaIhIn2VyFFYtQdCxyj/0vr+Hv8LnfQa7kgkiT+9+HU2Q06+c+AIelQxo3+nSoLuDxlkGTNwat4j1rFqfJp/bmaHzTvu8lBA4WmeUO4yrC69ZZCFwJHzzALWG4ZSOtXqMxLqc2tJzw9GFJDl85uEVEn4dvLPj4waHM0vlZz/g14sH9F6MUS5StZJyLUm0NojDXNCiMJpwgr7bk8++9qg/3/3O8BXgP95Q2r5ABw3L3uvfal4MpLNszDkrcEvETaOQg+f2ERhIFtOiV9simZjSpKXVYlxgtRMKZl2yHNoYU4xgyM0n5hnmqH2cnS8CPcag4i9FYIQ7XYh0cUPbm/fJuhC8Y=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7348.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(2616005)(36756003)(38350700005)(86362001)(52116002)(6512007)(316002)(8676002)(5660300002)(44832011)(30864003)(26005)(1076003)(107886003)(4326008)(8936002)(478600001)(66946007)(66556008)(6916009)(6666004)(38100700002)(66476007)(54906003)(41300700001)(6506007)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8688
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB8EUR05FT027.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8257f5e4-6eaa-4e07-28d9-08dc18e82a3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qHSY773eaLmoFQpFi04E5OgzaCEKDplA2XiDrF5zJXiU9JMj+GX4ZRNQO5iMaidoYBSTetCZ9E4gaks1JJozvoIe8+3TWnBGf5/N/ND2gVx9b4vXccAq1X0+wsquYoXciGzBLICV4UZRsrm3zS9JIeOZDboRZe96dbiDlp19nhq94cudBqFcbSAD477MLJwWNQ10UCeH40w+m7F8dsxLJf8RWOmj02ZYcwpdv2sYU+GjtQmC//bcmJ32g+j9lA3hDrvcpu3d5en3dpiJjQoxMDXnDzMxtMjyL+PK3cM6Fs9AJBcgrCsSZaLjyTK9D8JHs642TCQ5jEPYya3u7WfzYnJY0/lEfq83xl35nxCnNgkyKrx9tUkPaQ0AiMMqaqaJfVMC21NMqsAD6LZm/z2xOWEjar9SFgDNpO0SnaKvnA5tmen8qrM5xbt44anqBLCrU6quKarTbjIVYxAQNhHWwbKvOLd0s440HiGpmFy1JSwq6njAMWTUYtfv6xB1TwXs1AY6RkfKyGr2HLrGNAJIDofaVpZc3Jwq+2iIWcP8L/LtkY0mtbKIKnKokpppumo+63PvR/ov5xEI35TMDs1O1xG/E73R4PlF7C1gnttuNz1Y+y9hLAEzcA3Isrv24Tc4rjNS54sTnhs9hRcJ3pLp7ICLzbk5pSOW/1q2KU/1ZiXIOTH0WblHivoTAdt5QBEIZ/StUAPp+SD2q/YHcNW74omJum/jFQdu4Tzo0uKmsUk=
X-Forefront-Antispam-Report: 
	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39840400004)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(46966006)(36840700001)(6666004)(107886003)(6506007)(1076003)(6512007)(478600001)(2616005)(83380400001)(336012)(36860700001)(4326008)(6486002)(5660300002)(47076005)(41300700001)(2906002)(44832011)(30864003)(6916009)(8936002)(54906003)(70206006)(316002)(8676002)(70586007)(7636003)(7596003)(36756003)(86362001)(356005)(34070700002)(26005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 12:14:27.5345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f542f32-5e57-4069-b45d-08dc18e82eca
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR05FT027.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB9908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 12:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194038

Issue:
the usage of a gpt table with i.MX processor is not compatible by default.
This is due to a memory conflict: the main partition table is placed into
the same memory space used to flash the header of the U-Boot. This last
can not be moved since the ROM code of the i.MX6 starts to read to that
fixed address (0x400).
This problem can be solved using a feature of the GPT partition table for
witch the main table can be moved to a desired memory area.
The WIC library present in poky manages the GPT table through some
standard Linux commands (gdisk and sgdisk) which ones have already the
opportunity to perform this task.
This patch introduces this feature with the addition of some wic's options,
used also in wks file.

New partition placement behavior:
Since now all partitions are placed after the gpt table presents into the
first 1KB of memory (including both the gpt header at the first byte of
memory and the main partition table staring at 0x400).
Now the main gpt table can be placed in other address spaces and a partitio=
n
can be placed also before the gpt table. Recap:
- by default, all partitions are placed sequentially, one after the other.
The first partition implicitly starts after the GPT partition table.
- adding a flag to the item of a partition into the wks file, the partition
can be placed, starting from a fixed memory offset (neglecting the memory
space occupied by the GPT table).
Combining the moving of the main partition table and the absolute (not yet
relative) positioning of a partition, now it is possible to place one or mo=
re
=C2=A0=C2=A0=C2=A0partitions before the GPT table.

New flags:
- main-ptable-offset (size in KB): to add as property of the bootloader ite=
m.
Specifies the main partition table location in KB.
- fixed-align (boolean): to add as property of a partition. Specifies that =
the
partition must to placed with absolute offset, used in conjunction with --a=
lign
property

Example:
setting used for a wic for an i.MX6 processor, where the main parttion tabl=
e is
placed with absolute offset of 4MB

bootloader --ptable gpt --main-ptable-offset 4096K
part / --source rawcopy --sourceparams=3D"file=3Du-boot.imx" --ondisk mmcbl=
k --align 1 --size 1M --no-table --fixed-align

Test environment:
This patch is a part of Edgehog OS (https://git.seco.com/edgehog) a
custom Yocto distribution by SECO SpA (www.seco.com), used on multiple
architectures (both ARM and x86).
This solution is widely used by all SECO customers who use a hardware
solution based on NXP i.MX6 processors.

Signed-off-by: Davide Cardillo <davide.cardillo@seco.com>
Reviewed-by: Tobias Poganiuch <tobias.poganiuch@seco.com>
Tested-by: Andrea Da Col <andrea.dacol@seco.com>
Tested-by: Daniel Rinaldi <daniel.rinaldi@seco.com>
---
 scripts/lib/wic/ksparser.py              |   2 +
 scripts/lib/wic/partition.py             |   1 +
 scripts/lib/wic/plugins/imager/direct.py | 102 +++++++++++++++++++++--
 3 files changed, 97 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 0df9eb0d05..45db2eaa5d 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -148,6 +148,7 @@ class KickStart():
         part =3D subparsers.add_parser('part')
         part.add_argument('mountpoint', nargs=3D'?')
         part.add_argument('--active', action=3D'store_true')
+        part.add_argument('--fixed-align', action=3D'store_true')
         part.add_argument('--align', type=3Dint)
         part.add_argument('--offset', type=3Dsizetype("K", True))
         part.add_argument('--exclude-path', nargs=3D'+')
@@ -194,6 +195,7 @@ class KickStart():
                                 default=3D'msdos')
         bootloader.add_argument('--timeout', type=3Dint)
         bootloader.add_argument('--source')
+        bootloader.add_argument('--main-ptable-offset', type=3Dsizetype("K=
"), default=3D0)
=20
         include =3D subparsers.add_parser('include')
         include.add_argument('path', type=3Dcannedpathtype)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 5275da6ed3..1bd2b457cd 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -26,6 +26,7 @@ class Partition():
         self.args =3D args
         self.active =3D args.active
         self.align =3D args.align
+        self.fixed_align =3D args.fixed_align
         self.disk =3D args.disk
         self.device =3D None
         self.extra_space =3D args.extra_space
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index 165fc2979f..38ceb0d504 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -16,6 +16,7 @@ import random
 import shutil
 import tempfile
 import uuid
+import operator
=20
 from time import strftime
=20
@@ -66,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
         self.workdir =3D self.setup_workdir(options.workdir)
         self._image =3D None
         self.ptable_format =3D self.ks.bootloader.ptable
+        self.main_ptable_offset =3D self.ks.bootloader.main_ptable_offset
         self.parts =3D self.ks.partitions
=20
         # as a convenience, set source to the boot partition source
@@ -77,6 +79,7 @@ class DirectPlugin(ImagerPlugin):
=20
         image_path =3D self._full_path(self.workdir, self.parts[0].disk, "=
direct")
         self._image =3D PartitionedImage(image_path, self.ptable_format,
+                                       self.main_ptable_offset,
                                        self.parts, self.native_sysroot,
                                        options.extra_space)
=20
@@ -294,15 +297,27 @@ GPT_OVERHEAD =3D 34
 # Size of a sector in bytes
 SECTOR_SIZE =3D 512
=20
+class memoryRegion():
+    def __init__(self):
+        self.start_sector =3D 1
+        self.end_sector =3D 1
+        self.part_num =3D 0
+
+    def __init__(self, part_num, start_sec, end_sec):
+        self.part_num =3D part_num
+        self.start_sector =3D start_sec
+        self.end_sector =3D end_sec
+
 class PartitionedImage():
     """
     Partitioned image in a file.
     """
=20
-    def __init__(self, path, ptable_format, partitions, native_sysroot=3DN=
one, extra_space=3D0):
+    def __init__(self, path, ptable_format, main_ptable_offset, partitions=
, native_sysroot=3DNone, extra_space=3D0):
         self.path =3D path  # Path to the image file
         self.numpart =3D 0  # Number of allocated partitions
         self.realpart =3D 0 # Number of partitions in the partition table
+        self.fixedalign_part =3D 0 # Number of partitions with absolute al=
ignment
         self.primary_part_num =3D 0  # Number of primary partitions (msdos=
)
         self.extendedpart =3D 0      # Create extended partition before th=
is logical partition (msdos)
         self.extended_size_sec =3D 0 # Size of exteded partition (msdos)
@@ -311,11 +326,13 @@ class PartitionedImage():
         self.min_size =3D 0 # Minimum required disk size to fit
                           # all partitions (in bytes)
         self.ptable_format =3D ptable_format  # Partition table format
+        self.main_ptable_offset =3D main_ptable_offset # for GPT table, of=
fset
         # Disk system identifier
         self.identifier =3D random.SystemRandom().randint(1, 0xffffffff)
=20
         self.partitions =3D partitions
         self.partimages =3D []
+        self.used_memory_region =3D []
         # Size of a sector used in calculations
         self.sector_size =3D SECTOR_SIZE
         self.native_sysroot =3D native_sysroot
@@ -368,6 +385,30 @@ class PartitionedImage():
             # Converting kB to sectors for parted
             part.size_sec =3D part.disk_size * 1024 // self.sector_size
=20
+    def _add_busy_region(self, part_num, start_sec, end_sec):
+        self.used_memory_region.append(memoryRegion(part_num, start_sec, e=
nd_sec))
+        self.used_memory_region =3D sorted(self.used_memory_region, key=3D=
operator.attrgetter('start_sector'))
+
+    def _print_busy_region_list(self):
+        list =3D "Busy memory region (in sector)\n"
+        list +=3D "\tpart#\tstart\tEnd\n"
+        for num in range(len(self.used_memory_region)):
+            list +=3D"\t%s\t%s\t%s\n" % (self.used_memory_region[num].part=
_num, \
+                self.used_memory_region[num].start_sector, self.used_memor=
y_region[num].end_sector)
+        logger.debug(list)
+
+    def _check_memory_region(self, start_sec, end_sec ):
+        """ Check if the specified region is already flagges as used. Retu=
rns
+        zero if not used, 1 otherwise"""
+        for num in range(len(self.used_memory_region)):
+            region =3D self.used_memory_region[num]
+            if ( ( region.start_sector < start_sec and start_sec < region.=
end_sector) or \
+                    ( region.start_sector < end_sec and end_sec < region.e=
nd_sector) ):
+                return 1
+            if ( start_sec < region.start_sector and end_sec > region.end_=
sector ):
+                return 1
+        return 0
+
     def layout_partitions(self):
         """ Layout the partitions, meaning calculate the position of every
         partition on the disk. The 'ptable_format' parameter defines the
@@ -379,6 +420,35 @@ class PartitionedImage():
         # partitions not listed in the table are not included.
         num_real_partitions =3D len([p for p in self.partitions if not p.n=
o_table])
=20
+        # The partitions flagged as fixed alignment partition are placed i=
nto image
+        # before the others. Instead, relative-aligned partitions are plac=
ed in a
+        # serialized fashion, with control of the intersection of memory a=
reas.
+        # The base address of the relative-aligned partitions is, as befor=
e,
+        # the maximum address accupied by the partition table
+
+        # Flag as used the momoery required for partition table
+        self._add_busy_region(-1, 0, MBR_OVERHEAD)
+        if self.ptable_format =3D=3D "gpt":
+            offset =3D self.main_ptable_offset * 1024 // self.sector_size
+            self._add_busy_region(-1, offset, offset + GPT_OVERHEAD)
+
+        # Search all partition with fixed position into the image
+        for num in range(len(self.partitions)):
+            part =3D self.partitions[num]
+            if not part.fixed_align:
+                continue
+            if not part.no_table:
+                raise WicError("A partition with fixed alignment must have=
 no_table flag set")
+
+            start_sector =3D (part.align * 1024 // self.sector_size)
+            end_sector =3D start_sector + part.size_sec - 1
+            if self._check_memory_region(start_sector, end_sector) =3D=3D =
1:
+                self._print_busy_region_list()
+                raise WicError("A partition wants to use an already used m=
emory region (sectors %d - %d)" \
+                    % (start_sector, end_sector))
+            self._add_busy_region(num, start_sector, end_sector)
+            part.start =3D start_sector
+
         # Go through partitions in the order they are added in .ks file
         for num in range(len(self.partitions)):
             part =3D self.partitions[num]
@@ -403,7 +473,7 @@ class PartitionedImage():
                 if self.ptable_format =3D=3D "msdos":
                     overhead =3D MBR_OVERHEAD
                 elif self.ptable_format =3D=3D "gpt":
-                    overhead =3D GPT_OVERHEAD
+                    overhead =3D (self.main_ptable_offset * 1024 // self.s=
ector_size) + GPT_OVERHEAD
=20
                 # Skip one sector required for the partitioning scheme ove=
rhead
                 self.offset +=3D overhead
@@ -418,7 +488,7 @@ class PartitionedImage():
                     self.offset +=3D 2
=20
             align_sectors =3D 0
-            if part.align:
+            if not part.fixed_align and part.align:
                 # If not first partition and we do have alignment set we n=
eed
                 # to align the partition.
                 # FIXME: This leaves a empty spaces to the disk. To fill t=
he
@@ -440,7 +510,7 @@ class PartitionedImage():
                     # increase the offset so we actually start the partiti=
on on right alignment
                     self.offset +=3D align_sectors
=20
-            if part.offset is not None:
+            if not part.fixed_align and part.offset is not None:
                 offset =3D part.offset // self.sector_size
=20
                 if offset * self.sector_size !=3D part.offset:
@@ -455,14 +525,20 @@ class PartitionedImage():
=20
                 self.offset =3D offset
=20
-            part.start =3D self.offset
-            self.offset +=3D part.size_sec
-
             if not part.no_table:
                 part.num =3D self.realpart
             else:
                 part.num =3D 0
=20
+            if not part.fixed_align:
+                part.start =3D self.offset
+                self.offset +=3D part.size_sec
+                if self._check_memory_region(part.start, self.offset) =3D=
=3D 1:
+                    self._print_busy_region_list()
+                    raise WicError("A partition wants to use an already us=
ed memory region (sectors %d - %d)" \
+                        % (part.start, self.offset))
+                self._add_busy_region(part.num, part.start, self.offset)
+
             if self.ptable_format =3D=3D "msdos" and not part.no_table:
                 if part.type =3D=3D 'logical':
                     self.logical_part_cnt +=3D 1
@@ -483,11 +559,13 @@ class PartitionedImage():
                          part.num, part.start, self.offset - 1, part.size_=
sec,
                          part.size_sec * self.sector_size)
=20
+        self._print_busy_region_list()
+
         # Once all the partitions have been layed out, we can calculate th=
e
         # minumim disk size
         self.min_size =3D self.offset
         if self.ptable_format =3D=3D "gpt":
-            self.min_size +=3D GPT_OVERHEAD
+            self.min_size +=3D (self.main_ptable_offset * 1024 // self.sec=
tor_size) + GPT_OVERHEAD
=20
         self.min_size *=3D self.sector_size
         self.min_size +=3D self.extra_space
@@ -607,6 +685,14 @@ class PartitionedImage():
                                 (self.path, part.num, part.system_id),
                                 self.native_sysroot)
=20
+        if self.ptable_format =3D=3D "gpt" and self.main_ptable_offset > 0=
:
+            main_ptable_sectors =3D self.main_ptable_offset * 1024 // self=
.sector_size
+            logger.debug("Move the main GPT partition table forward by %s =
sector(s)", main_ptable_sectors)
+            cmd =3D "sgdisk -j %d %s" % (main_ptable_sectors, self.path)
+            #cmd =3D "(echo -e 'x'; echo -e 'j' ; echo -e '%d'; echo -e 'w=
'; echo -e 'Y') | gdisk %s" % (main_ptable_sectors, self.path)
+            exec_native_cmd(cmd, self.native_sysroot)
+
+
     def cleanup(self):
         pass
=20
--=20
2.39.2


