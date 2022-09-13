Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597F9C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 11:26:19 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.56])
 by mx.groups.io with SMTP id smtpd.web11.3443.1663068369969795143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=g4gm605b;
 spf=pass (domain: vaisala.com, ip: 40.107.1.56,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANDDazEXLsHF5Xpshq6ZbrCcro9h52HopnjcYtJSlYDgBcgpJTQkumYOqCCjIeUm/rL0Svrpz/1yRu03F5t6RXANjPyVSCR9rzGurdxUSyFFZzAxVSgKtfDZoP1MN/MQ60Bp6lIongaklHLqmzFGX1482n11lLyywKYnOsDsb8JuyNK4XPDPFdagSvePzWVs5sH20mig/qWFJWyuqhJGiWOprZZ+b2h7uL1T2HuO2DfYeZvfNNbWB5UkTBwO1pgAzIbiiAsmLtODkhq0Qu9ljY/G54xB6+kB3TIBSwruFhqUgoxXSC0hC8e4GbSKamGU7rG5VLXc9sj86zz9LwFS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJNX++68u/JReuLLyKa4oxy869+Lx29N2JRl1AGhR9M=;
 b=XJEmblI4q4dH1YDlYG2XPJVH5xz5Eje4inMBQ4Q8TJc2bIakzu3toJZfsN4C+7KZr3CS/N4b6Rbztmg95FUNsByi9xKevILDLBes6Y/4EP6YiFZAtbIIuUdT++D/jd3V0QWhpp1QKgClze0ye8e8AIk4xVxSINdCJTGA1GYPwwVIsoPT89HNWG1dJZVybocInzO0EC+7r0Tg5446PPM6YEDtbWVX9oBIKQk87p4tehWAk0xhsAz4/S3UsDs2OueaYB2LKaS6X9nVJawduZ5atkAXQLvebxnMsFZlUEzu4Po+WK459L1h1VK7+fyI7ptPmA/ezHFhNuVB1uwksNE9vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJNX++68u/JReuLLyKa4oxy869+Lx29N2JRl1AGhR9M=;
 b=g4gm605b/D0k4+JQpUSfYEEYOF5b1S9dgvZuQf7f2kSJiQSHvXxyKRuNsdAlENQyYdU12vVxFSRPNKToSZsfrTUwNcMPY2/7+jbmYeqwuqvZBybxvP+FKwdpcckk07K8fIHZcFM3dmDYWtFqAIY5zX20c8ByRqlTb3Zsi4ayaA2Inuw8PrypchbIUEzkGt0sBQFaz1sT0iEFgayQUIsz/tAaWM05pJjbAn/T+POELqKRYH+dcP7MmXp2aDi4hb68JzAzlwuF4oGfYrkFhTMXxVKxMJ/rrQhzTAVshprbjFQ8GPs39PVO+5AZNLfChATvCkgdzoX05ci++1Vm8pStvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PA4PR06MB7279.eurprd06.prod.outlook.com (2603:10a6:102:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Tue, 13 Sep
 2022 11:26:06 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 11:26:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] systemd: Fix unwritable /var/lock when no
 sysvinit handling
Date: Tue, 13 Sep 2022 11:25:48 +0000
Message-ID: <20220913112549.1458008-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::29) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PA4PR06MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: f5189591-cd80-45d1-7d74-08da957abfa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vOQwsghkE2yNgpppD8gNpRIn/wr4R1z24DonR/q4rwBplMirt3WdlS+/NM0fXQs8wcb9I0xxMWL71wZUq3+atpdRrEUZN1K1wGb5BuYhalHOyS4iwpbNeN13+fyO7c79qIN1S732bUg/cBAzgS0i/fbyNO+YKuXjR9JdT1eqZny2SScPGlIlrR/Kvbzp9r6GL8REKQMR5MoVhom3v1fmTdviaOkaM8Y94pxCiuki9/QKc516tYnDOESp3AgfF6ZAvKEzJt3tgVGmg42W/VAW2wZ5PMXhPHyfFmsBHCrtObHYxDdHsVPXCXJ/NNvJc7LQh7jXUCFCdewkqRzRBlINIvVoawdwylvI6I2xiwAIVLTMqGl+Ci7idnf2aKYfz5yJgCy1ZNp7yvmrZTe5WufH1nuytywFmfMRb1MNJB95KXfYLxrQRB30FCFZkrBD6Bo5b5WWQ8GyyzedRIj5rhS43yatGnz7QMr1p1SB0ACUD+dYLDrrUHp6bMMDDQA8mVdi4+EEtdA7t5toI7S73QMuXZ+wRsvT2vtrlPKoxs2aB6RNzTG67DbvB0A4kTW3K02nA40X6XzzI+p+bDvatD3nHwIWcjZ+7u2Y9VP5+EVXPAwxqe1W2tZvQLMSBwQW84T1MsHLqlDiFcft+RBCOdP88T6TbfXeSJNmycHLO/pYAgVrrkeWTrVL9W0RiYoso3MV1RXlzFSTU+UKN6LTiJYVPIYIuZTXfxpSzSQXuQs2DLH9o9+C+dPgIYJYHna/sU155ls0F9LuvAP680XL8lj4qcM0pkhJlS4CH1rCbMmKkic=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39850400004)(396003)(136003)(366004)(451199015)(478600001)(66946007)(41300700001)(4326008)(26005)(966005)(36756003)(86362001)(2906002)(186003)(6512007)(6666004)(66476007)(2616005)(6506007)(8676002)(6486002)(6916009)(316002)(54906003)(44832011)(66556008)(8936002)(1076003)(83380400001)(52116002)(38100700002)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e56uoLQNIUldXOFrhp6mhOYm23MugGy/i+HxSrVKbX5voCuAgWzutWVMrzH4?=
 =?us-ascii?Q?Of5qtr0oAQ6fbtiUNi/M3HwfGVNDiDDUZFrkRZit/2/b6Qt/rMvhTNF6GD8f?=
 =?us-ascii?Q?M+cfKBeFfrExaZH49LVTwU8nzMNmEouvEZqGgo9HTNX3sIhPHsvvVQ7B3Qib?=
 =?us-ascii?Q?dK+M3v/vkSHN4wVoEz8l8PJhtrMu0J3ptnUVqy8u2shiqYIH4J0CzfPAUQOU?=
 =?us-ascii?Q?z2Tx6VFuI099+n5Kfm+gW6iTpmzeaBNPkiC/Pv5hbgyuJBr87hfo7Jfbj2eI?=
 =?us-ascii?Q?13KFyG68rS9a+LIgmNkyhl1kY/DNdt/RQ5fyILCFrROpKemuUoyCZRyHHalQ?=
 =?us-ascii?Q?wx5zinWvCGnRYvzwXx0GgJP0Kre6qMeXbdlhne8+28Ul8bLDcIKWfbolsyRy?=
 =?us-ascii?Q?BY+DSzWa5brHIO1+tkWO1O9AK2obLnNR8PLD+3e62HctLvKMZIIIbPR7PbCG?=
 =?us-ascii?Q?cZgEsrYL1U5QjD2U7wrHSgIynGuvq+k7OX6ax6JvzPDJ950jcFD8FBxEyUMz?=
 =?us-ascii?Q?/ZaLhkQRLcUT00s8AFfOlXuguCA3FbyR0BorSH82rsdc8EhQRtWVSvNC+p7C?=
 =?us-ascii?Q?YyKiTGzjv+0wv0mbbD/umcQVm4qcgUIQzh+TDBUS7LIG7s3pMJE1QvCnEGZ9?=
 =?us-ascii?Q?US8Gl9L2Cr5GwrCIyw7/8FKUyINxqsvgkOLiafiBX407ULestl2PpDhp6M+9?=
 =?us-ascii?Q?vLaJ65J1aGREbUl5+xa8qq1gVephfhV0w8yv+9/GZFjXKDkSydjaew+KhPWs?=
 =?us-ascii?Q?XkR7rXm1Wuos7aGVK2Xy0cqJ25ZScixtBeQYQ/Esg+14d7keQVIZWBTRBx7T?=
 =?us-ascii?Q?3LBTnsvuXjiiFKTuI8v87hNd9/1bBg1eNR0K+qk/6wdzKhecqD4mG/UfkBHt?=
 =?us-ascii?Q?ed4bjF/I2e1aMhiDwjwa3pWL8X5/Lw3Mlf24z9BLOMNPtStMvUCjhcG2M7I7?=
 =?us-ascii?Q?ygXd8i+zMaImWXT2zIiqIOPkVW6UpCpBOf+3P6jjZaCly4LFdMZVlkUZxSkt?=
 =?us-ascii?Q?C/B/5JAtHRgtct5pd6Ni7/Q++xRBjpI1acHa1EAdFErX3hNDsC9AZgvnE6L9?=
 =?us-ascii?Q?w0q9HwxZygs9ZBHvivGpx8J7JkYXmJoWz/9OjbxOBrVoXKCee5mxTEjLUL0u?=
 =?us-ascii?Q?jWYCfGC+5fBmgjbeJ/JO1eCiEz98EDkJbZotDUg6hJGEoLOrWO2mA8H68fWQ?=
 =?us-ascii?Q?rmOIK+E3V4trNNxkEU0+4vzf6XY/t9Ij4R6XBtz8HCW0PbUHbMaQahp9uWap?=
 =?us-ascii?Q?iLMCGumsbiDK7AKQmey53JeX+YZiGfcp8dNxKX1qY9XQLJ0SgRis48VG3Es0?=
 =?us-ascii?Q?iKi62Y3g/sGdcdiYwBydLLg/2t2yBSPHh/XZfMLol1qHJnuzCdmCHvR2TU7w?=
 =?us-ascii?Q?60xqYdmoeVjNAKpf55QZOSamrLCLLOnpv9fvg+fwuzO9spIKzPblJAqVHcR5?=
 =?us-ascii?Q?fXQe3Yk70lcYtBBK95ISQch2L2MFa15O9CmkzledZyCy1hSSHMyZZ1p/3TAQ?=
 =?us-ascii?Q?q0PD9X/ZqXWMquRMiBbdle8f0itphxjiM2hEXcpYJcrAw6YKHz/X2n2KypOL?=
 =?us-ascii?Q?ShiITip7PiD150inIi7FbOfsGDs1pB/wfGdN3MWO21eKSimAZR6DoBHvNOZp?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5189591-cd80-45d1-7d74-08da957abfa6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 11:26:06.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xFH7FitsZOFMLvZzF314qPr7ljYnJ7sQFKcWFqueZSmEwnOd83mmKeLliRIc0RCSF0rzoK0h+70zqlC1TVP3UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 11:26:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170570

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Commit 8089cefed8e83c0348037768c292058f1bcbbbe5 ("systemd: Add
PACKAGECONFIG for sysvinit") decoupled enabling of systemd's sysvinit
handling behavior behind a distinct PACKAGECONFIG feature.

This new option affects among other things the installing of
tmpfiles.d/legacy.conf, which is responsible for creating /run/lock
directory, which is pointed to by /var/lock symlink provided by
base-files package.

In case the option is not enabled, then base-files provided /var/lock
is a dangling symlink on resulting rootfs, causing problems with
certain Linux userspace components that rely on existence of writable
/var/lock directory. As an example:

  # fw_printenv
  Error opening lock file /var/lock/fw_printenv.lock

Since Filesystem Hierarchy Standard Version 3.0 states in
https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s09.html that

  Lock files should be stored within the /var/lock directory structure.

Ensure the /run/lock directory is always created, so that lock files
can be stored under /var/lock also when 'sysvinit' handling is
disabled.

(From OE-Core rev: 85e5ee2c35cf5778c3aefda45f526e8f6a511131)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/me=
ta/recipes-core/systemd/systemd/00-create-volatile.conf
index 87cbe1e7d3..c4277221a2 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -3,5 +3,6 @@
 # inside /var/log.
=20
=20
+d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
--=20
2.35.1


