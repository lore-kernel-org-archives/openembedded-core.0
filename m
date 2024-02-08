Return-Path: <davide.cardillo@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19021C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:50:47 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.109])
 by mx.groups.io with SMTP id smtpd.web10.15870.1707393035920070099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@seco.com header.s=selector1 header.b=z5ayjfm7;
 dkim=fail reason="dkim: body hash did not verify" header.i=@seco.com header.s=selector1 header.b=z5ayjfm7;
 spf=pass (domain: seco.com, ip: 40.107.15.109, mailfrom: davide.cardillo@seco.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XTovylUlYDRZLZFXnz/E3wYDDMDVj6rsP81HxlY+0WIhUH02O+getMp0qK+OxOTtGhdkLWsdzQoEHHeMYPbkLs2F4ZTG0vWs73clA5C2fHRquUjcR8W38LR6fk8HR+H1wzSAxkkP1hbCOVsNLBJOBeI5N+yB2EDV09yGHy0JIuGRE1a/Jyj2ZsQOAAvMPPvYYzX4VlRdeliHL/r7yVzSV2tytB505hX/8bm6XrB/xhqfqol8Q0IVt8hMb2GjNzE6v6Y/yAxM6Jwk3vcsXy47Xh8+5p9c0QdTX1Wk9ZQL0OyqtF6e0fq/hQNH/mS4swmPRThlJHvrpY4PPSRO5tYq0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HegePnH3wldUQzCFVg5cOEYsmhS2OAUGx3CuoMQW3hQ=;
 b=JNZPkEwvD1gykUEibS89phbQBbiiDBw/dCmVqWUfoLVf3w0HuufPs+EfzQja7IsY5bByzW+1LnV7K6BpPQPpfl8dKW1KdM3pk1lxejRJhHa+DEYsTQIrxC33SWjESfOQ6zlfpK2vq39EgnzVcHyQj49sDJAR+ykxGnd9EodapdmIP02/hv9/eWESXNtr1Uuw9WV7TgcdMUae8CqRJHSHLjPzpla3M8zyy5nEeuXG4DqFWK+mnoNKJUjeFsZr+FFzYkqI/BBzj5ADtRn/4dJREacqvXbpEso8zUmwtLeIbcuetoVboeK88D0Q7o8Kgb/ZB+O6q1ycK0MuHAC7QtXJ2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.80) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=seco.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=seco.com; dkim=pass (signature was verified) header.d=seco.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com]
 dkim=[1,1,header.d=seco.com] dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HegePnH3wldUQzCFVg5cOEYsmhS2OAUGx3CuoMQW3hQ=;
 b=z5ayjfm7kXLOCUkYmemRFdKYZVbfuXLURG3e0hJj6vs3jA107eeB8AsYkUG+OwbdyukJVGkcabhx5JT8XSNHCvaQ2dv1jNDJbZ3zlaOt1c9QthIZeXp6TU6cyShcNGAFZUNiyDx876PM2dbyS4+t8yyWkvAd5yF/NyT/0eRY3H66UCWgCdtl89Wj06wWIDkMHQGKbVqo1HjncNryPBDtqLVT3JjjKuAyJ5RMN01ZCHJChFK+D+pfmlJzZGxAj1Rx5aiRMwplaAtxjsmVEmIS4bSuBOR2fNH8sj4EYNTqhE9pJSRmxGYi7F7D9ihCfWLvcptmWDoIAw0EsHqffI+68g==
Received: from DB8P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::19)
 by AS2PR03MB9837.eurprd03.prod.outlook.com (2603:10a6:20b:60a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 11:50:30 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::fb) by DB8P191CA0009.outlook.office365.com
 (2603:10a6:10:130::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39 via Frontend
 Transport; Thu, 8 Feb 2024 11:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.80) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 11:50:28 +0000
Received: from outmta (unknown [192.168.82.140])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 368AD20080F89
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Feb 2024 11:50:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.169])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 12FA02008006F
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Feb 2024 11:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmNVzKi/rA4X37fYod7n8Rz0J/2DWfdMZQCWhB2/YVuzoNOjm8caFdvwN7mW4/LTVywQiWgzb6k5fK4ZozwPCOshZpWpTlzQWenafveHx5ABM613ty48oZ+0IN7jq2jOwS+TOZ3ptMkpKRY9BLtY2RosXGXPgGrc0elkZ6/FCMKtdMFl1+AAZIsWonZ+wLtfX0RROXlmuNsVYq4zz42o0EwlhVgCM5VJjONzFfsbWm1BaW0fP6XbcMTYPAHcNNtOETkdn6y0hMpliN8xia6JX8f6dSfBADLUmbpAgEE2+/BvQIzeIxt1S/1FjFPrZi8AVlFwxEkGT7e8WfpD7Czx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HegePnH3wldUQzCFVg5cOEYsmhS2OAUGx3CuoMQW3hQ=;
 b=BH4OB0riRqnBfhBh0NVTggPgxReEra/KYzSOePaw7L79FH25p07gzE+sNUUmm44tzKzS4N/VXlNO7+NzLJts3y/lqBibuKTb7eEMV0A+7ckCIIohBo6YsKMcZK8H42ivfADb+yvPwPvz0wncxmFL4ivjfUarobNhqIPpLGv/MhcgLIWjqS98i7nUYogufxkjZzBnQmMVAXdwLXqK0Sc81cGYiKKWD4c4JRe7lf73yUHOL52cJlCpOs1jIrrfOHxwL+DM/qrYcI4SIE7xrqTnB05Z7ZoNdtwyhV8EpWTL/3MImtKRHxpJKSm9Cu1fRTY6xQj0ErpXraxWP/5lU5wSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HegePnH3wldUQzCFVg5cOEYsmhS2OAUGx3CuoMQW3hQ=;
 b=z5ayjfm7kXLOCUkYmemRFdKYZVbfuXLURG3e0hJj6vs3jA107eeB8AsYkUG+OwbdyukJVGkcabhx5JT8XSNHCvaQ2dv1jNDJbZ3zlaOt1c9QthIZeXp6TU6cyShcNGAFZUNiyDx876PM2dbyS4+t8yyWkvAd5yF/NyT/0eRY3H66UCWgCdtl89Wj06wWIDkMHQGKbVqo1HjncNryPBDtqLVT3JjjKuAyJ5RMN01ZCHJChFK+D+pfmlJzZGxAj1Rx5aiRMwplaAtxjsmVEmIS4bSuBOR2fNH8sj4EYNTqhE9pJSRmxGYi7F7D9ihCfWLvcptmWDoIAw0EsHqffI+68g==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AM9PR03MB7348.eurprd03.prod.outlook.com (2603:10a6:20b:269::8)
 by AM9PR03MB7742.eurprd03.prod.outlook.com (2603:10a6:20b:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 11:50:24 +0000
Received: from AM9PR03MB7348.eurprd03.prod.outlook.com
 ([fe80::3d93:1999:90a7:84a6]) by AM9PR03MB7348.eurprd03.prod.outlook.com
 ([fe80::3d93:1999:90a7:84a6%7]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 11:50:24 +0000
From: Davide Cardillo <davide.cardillo@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Tobias Poganiuch <tobias.poganiuch@seco.com>,
	Andrea Da Col <andrea.dacol@seco.com>,
	Daniel Rinaldi <daniel.rinaldi@seco.com>
Subject: [PATCH v2] wic: Configurable addressing of GPT main table
Date: Thu,  8 Feb 2024 12:50:17 +0100
Message-ID: <20240208115017.23047-1-davide.cardillo@seco.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZRAP278CA0016.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::26) To AM9PR03MB7348.eurprd03.prod.outlook.com
 (2603:10a6:20b:269::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AM9PR03MB7348:EE_|AM9PR03MB7742:EE_|DU2PEPF00028D08:EE_|AS2PR03MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0bfd28-3b96-466b-15fd-08dc289c2549
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: cacxhUOjEj1v5D2+ZieoB8i89u7ClbWHYlv5HyqDB03ZMbtYmfDoWEdNVgZhXHN4C+D9ov1WDZFwKd8TEi7w9GOMO5jZxK19e5RkmWpe+Cv25ihJpX91nbU1uKi1NsLxd0Tk2NKS7S/sbcuLRlxdqZG/wR/lmXF7H7YRR8rBiDiFVBBgIxS80w3VOYp+c5xmDmhsUIOKBftDj4fdS4RFqlprpnT+vO5FnqyptFqjgXLXYQvhMDlxEuEHPeoBgs2shj2mh2++6w8zyql6pgN8+AjsJs1iHbBPzyXaUNM0M1N3QpX8yRs0I3cfNusju3iQQgPtmCfZWL12NAuoKIHLf1cjYmofjRIgjoYXucRcELLPndRkoM0Zt79GGHQQE86DCS3TopsChSn1Vxl3Ii1hpc3Ab5HTdwAiX7NwcZVdAZKSfmMfkfw05xJWfiytf/oGBCRygrjSdR15S963OJdkMLULfjgCrbd9IZB4EtHlda2HM6/XyZmckPh/e9AQHMB3hvhFTOfivjYO3U16F/zlTq7H5uj2EfJ1DjEBrEYmu7mQqAIeTPPTh50bLJdkTxECYqrWZGqbc18BqsWy85bIBxugx5PnROAzAqU+FNQjW5E=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7348.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39850400004)(376002)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(41300700001)(6916009)(8676002)(44832011)(4326008)(8936002)(86362001)(30864003)(36756003)(6506007)(2616005)(52116002)(478600001)(107886003)(6486002)(6512007)(1076003)(66556008)(38350700005)(66946007)(66476007)(54906003)(26005)(6666004)(5660300002)(316002)(2906002)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7742
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	760dec29-0589-48e7-df0d-08dc289c22da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dNCwyiAEdDBfIWn9d3k+JuBXnumbdm+3vRmMcKDq6RNP3LwG6/+kPaktRlT6z1bXP2yD4TiaUtaLAPrgVrswHCR1TQbtH6YUNMODMEPyIpBIpXGfXRxSuhydixCOEkZ9AfHF5dGtcV3s8wD052PwjvSgSV6XsoH6soGOacSH3euGlrTYhWlTPNg1f9VbsDi4TkJq772OosxobGXfQ7MOKJeuNunPuhAIvtcyCmlyWLhHpx7kjn/Z9mW5Z3NLA47IEzQ7I0UHtGZBZ18JBHqswJOaJbVUu1w/9ToDpkO0VV/tmPEYG1wwLpo+A2NicQl2YNjM1EPDZLy8sO1BdcdAUeFpeb/nCDYT7knGc/2FRgpRuxaSSUljrkDf2UII63sfWk7FjKvqsMphoSqIFwLUu4Yaj4sfGbQhLakEbmwhGcfa6n3j67Ht0C84H2zPhdmZB27RdptCMziHoesaneEm2xJsTGncgXx05LMIpxpiYkto4V6T1dGUUSLnx1ofFyDEFueNHAOt5xgA9QkIjDM62PrPohf2HOWeLiI2gtW5GyyfoNFQ6Tssvok7k6agSvDkyU2olUFLlsSA5m2hBYyWag==
X-Forefront-Antispam-Report: 
	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(396003)(346002)(230922051799003)(64100799003)(82310400011)(451199024)(1800799012)(186009)(46966006)(40470700004)(36840700001)(1076003)(41300700001)(2616005)(26005)(86362001)(336012)(107886003)(5660300002)(30864003)(478600001)(2906002)(6486002)(70586007)(70206006)(54906003)(44832011)(316002)(8676002)(8936002)(36756003)(4326008)(6512007)(6666004)(6916009)(6506007)(356005)(82740400003)(7596003)(7636003)(83380400001);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 11:50:28.4386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0bfd28-3b96-466b-15fd-08dc289c2549
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9837
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195140

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
 scripts/lib/wic/plugins/imager/direct.py | 101 +++++++++++++++++++++--
 3 files changed, 96 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..e9c83cf1a3 100644
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
@@ -197,6 +198,7 @@ class KickStart():
                                 default=3D'msdos')
         bootloader.add_argument('--timeout', type=3Dint)
         bootloader.add_argument('--source')
+        bootloader.add_argument('--main-ptable-offset', type=3Dsizetype("K=
"), default=3D0)
=20
         include =3D subparsers.add_parser('include')
         include.add_argument('path', type=3Dcannedpathtype)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 795707ec5d..953ff1c9c6 100644
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
index 9b619e41c1..5b0beac1eb 100644
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
@@ -295,15 +298,27 @@ GPT_OVERHEAD =3D 34
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
@@ -312,6 +327,7 @@ class PartitionedImage():
         self.min_size =3D 0 # Minimum required disk size to fit
                           # all partitions (in bytes)
         self.ptable_format =3D ptable_format  # Partition table format
+        self.main_ptable_offset =3D main_ptable_offset # for GPT table, of=
fset
         # Disk system identifier
         if os.getenv('SOURCE_DATE_EPOCH'):
             self.identifier =3D random.Random(int(os.getenv('SOURCE_DATE_E=
POCH'))).randint(1, 0xffffffff)
@@ -320,6 +336,7 @@ class PartitionedImage():
=20
         self.partitions =3D partitions
         self.partimages =3D []
+        self.used_memory_region =3D []
         # Size of a sector used in calculations
         self.sector_size =3D SECTOR_SIZE
         self.native_sysroot =3D native_sysroot
@@ -372,6 +389,30 @@ class PartitionedImage():
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
@@ -383,6 +424,35 @@ class PartitionedImage():
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
@@ -411,7 +481,7 @@ class PartitionedImage():
                 if self.ptable_format =3D=3D "msdos":
                     overhead =3D MBR_OVERHEAD
                 elif self.ptable_format in ("gpt", "gpt-hybrid"):
-                    overhead =3D GPT_OVERHEAD
+                    overhead =3D (self.main_ptable_offset * 1024 // self.s=
ector_size) + GPT_OVERHEAD
=20
                 # Skip one sector required for the partitioning scheme ove=
rhead
                 self.offset +=3D overhead
@@ -426,7 +496,7 @@ class PartitionedImage():
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
@@ -448,7 +518,7 @@ class PartitionedImage():
                     # increase the offset so we actually start the partiti=
on on right alignment
                     self.offset +=3D align_sectors
=20
-            if part.offset is not None:
+            if not part.fixed_align and part.offset is not None:
                 offset =3D part.offset // self.sector_size
=20
                 if offset * self.sector_size !=3D part.offset:
@@ -463,14 +533,20 @@ class PartitionedImage():
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
@@ -491,11 +567,13 @@ class PartitionedImage():
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
         if self.ptable_format in ("gpt", "gpt-hybrid"):
-            self.min_size +=3D GPT_OVERHEAD
+            self.min_size +=3D (self.main_ptable_offset * 1024 // self.sec=
tor_size) + GPT_OVERHEAD
=20
         self.min_size *=3D self.sector_size
         self.min_size +=3D self.extra_space
@@ -662,6 +740,13 @@ class PartitionedImage():
                     mbr =3D mbr_file.read(512)
                     image_file.write(mbr)
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
     def cleanup(self):
         pass
=20
--=20
2.39.2


