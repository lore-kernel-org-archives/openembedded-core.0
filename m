Return-Path: <Arturo.Buzarra@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5F0C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 13:56:36 +0000 (UTC)
Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web10.9807.1666274191646160647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 06:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=O5PNCUKz;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: arturo.buzarra@digi.com)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173]) by mx-outbound23-5.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 20 Oct 2022 13:56:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNuAGe9vI1YWdMy290NkFvaVgWHZ0+PV38qcu7jqo04eQh6SYAVTkrHjmQSO2qF4wNh0SfuAPhf1UlmgItofBv3clKaYtKDtAi5I1QnzcTOAMEN0eCVd2CLBn1LKr6c3TDlgIROC2u/S0D4eO6h30GLWEUyr6qA2hujvNLPU2Eb9n6fTo9F1I1S1LcoLp9rMlxH2OFNd+oVm/6A9yt6pImjgfKy1VYSsz2GRYVbQriktVFQcFo8X9CZ1w1xs5c5NLoyVVix+N1H4vDQgDjIQuBcYFQDctnaRhHVMCKYq2Bx4WX4vX8EnTgUiOBtUVMB6w8QqYBpDUzglxTsNtdOu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfVrJEEzu/+gI/fmUCAvc1zUufDvnr5BrJzaDWDuH4E=;
 b=Bp9KBXsCAu2XiOdvIzgXf8md3TNIgEEbyvK0ufgRWALTZqI8xfd7e4kQly9xmue2+LtPz8wZh9ZXPyQTVCnYrt8QK5d+7wv8I+YcCMJTgRAmh/uwdQLSwKlNYxtNFJIhFa1A2gFH6c3m1YZ+cV1hpYr76c+fOlyT4CoBqhSaS4ZF13+IDIV08hTmR+rRmSlnq88P+mBYoJP+KpnurF7Lsp32Bor4z88D1/eiCoUxPoUDb+cWJ0prsHANOJXoH5KYGEn+d/6S6f3bO9zYWaK0k2OPjbYX0/eb/u0RcfXFDhdP8ZWG4wiWPcpjidIumVAVrIjT00EwtYTstot0gyaS9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=digi.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=digi.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfVrJEEzu/+gI/fmUCAvc1zUufDvnr5BrJzaDWDuH4E=;
 b=O5PNCUKzzNshn2yzbnjfbT7Tn/1I4QF8UJXeWamV2bBzBJJC1XDAGJSFN8/eUcAwYEoJg8g4RDkWvaNkraypPVIAnvawPKVL7lQ4FdKfTNC0LYqDqFzDKSOC/z3omB+p2y3BELHMUio/3gbMgd/Lm+oT4UWDtUFQR451izUB2beJI6sWI4EjS0kP+3/Z/kvq+bggbkN0rIBfPHnH9UWru5Gc+WkHzn+ZkzFKJJAhkDGUVkTSHsj6ZtWKgS9/QjD+Yj5tawmgXJNo0V0pWHqWytpTaqZDila9HSJr4Ydu+w1AKNu6gpfNOsSUcdEZmPHXdoB50WeaD0u+L7AYrKq0oA==
Received: from MW4PR04CA0148.namprd04.prod.outlook.com (2603:10b6:303:84::33)
 by CO1PR10MB4465.namprd10.prod.outlook.com (2603:10b6:303:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 13:56:27 +0000
Received: from MW2NAM10FT020.eop-nam10.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::4a) by MW4PR04CA0148.outlook.office365.com
 (2603:10b6:303:84::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Thu, 20 Oct 2022 13:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.30) smtp.mailfrom=digi.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.30 as permitted sender)
Received: from HPK-VMS-XCH01.digi.com (198.51.192.30) by
 MW2NAM10FT020.mail.protection.outlook.com (10.13.154.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 13:56:26 +0000
Received: from LOG-CLN-ABUZARRA3.home (172.26.105.9) by HPK-VMS-XCH01.digi.com
 (10.10.8.195) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Thu, 20 Oct
 2022 08:56:25 -0500
From: Arturo Buzarra <arturo.buzarra@digi.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] run-postinsts: Set dependency for ldconfig to avoid boot issues
Date: Thu, 20 Oct 2022 15:55:31 +0200
Message-ID: <20221020135531.57483-1-arturo.buzarra@digi.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.26.105.9]
X-ClientProxiedBy: HPK-VMS-XCH01.digi.com (10.10.8.195) To
 HPK-VMS-XCH01.digi.com (10.10.8.195)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM10FT020:EE_|CO1PR10MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e31819-80dc-4be7-dcd9-08dab2a2e1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qDmuviTNGOw9eie+5Z0vFA4Lxd9AyH0gOhKMBp5d0iNFxJtSGmEkxiXBNiHwGK72xl7PjhlvS7RavjAZYjIiEkPBPIPu6TD/Q+9RLyUgVBw84jw52rKx1iF77DtDI4sqQ7NcrjobNtPhfCO8u7MRAh55xduKDp/aGbDbJaD5FPJrK3hUyBNPtGb2ZSKdah4C+PeFap1tsa3Ca68dYmmgosiCn7CkpfGhA7L7/EshXRYBr/KrNcjOMR/0r5PassiLW2La6wvgUZ77ec/bB9PGbyhd9CfIETcO3XgQe5+vFfzBv3di/nxvrh/liULCneUeznfsHvfDTAsiscuBkIw0mMptjvdckGyMF3ppSG035emdjDSLGgD0A0ztGk4ofUexxDGns9FzULDC1kl647+wFcyVwf2+upqF5iCCoyb7jrM6lkkdc2qcWUVCigQt2nx2ce24A4at3xZQA8LZZ8YOptXu3nKLuSwi4dT8MLliZb72kfOlTJXVVZFukWp28omSqiUoyPCfMJy3myx6Oc2A15sL+hfBy4FiGAVKHVXkp3rmwqCaWkCfdNttd4znqMlbRg7j+dYmOq02azsP8jywBG5FTF02eUz90hNfWoUwKo7+QqfdiBfw2PBHA+bjFj+fI4vWWfx+i8uyXvG/TEF9uAuS/2ukM9hV+Mgj2d5Qo0jqwZDpMdk1CGqnsISE1olvr/rUnwq0pDDolghwCouj4KW+NJpnzH7Umtwi8L5xMTQqgUlJnj0kC6XchZHf0pgaWCALF6/lGij3nb9DEbGYs1vLuJelMhQXn11ok+HFUusLVautBrmOGr5ajzk1DCrUcZO2gdyTfGR9mJg3+7ZCew==
X-Forefront-Antispam-Report: 
	CIP:198.51.192.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:HPK-VMS-XCH01.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(426003)(36860700001)(81166007)(83380400001)(2616005)(86362001)(356005)(82740400003)(41300700001)(40460700003)(70206006)(6916009)(44832011)(8676002)(316002)(8936002)(70586007)(26005)(1076003)(336012)(186003)(16526019)(2906002)(5660300002)(6666004)(40480700001)(478600001)(36756003)(82310400005)(117716001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 13:56:26.8482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e31819-80dc-4be7-dcd9-08dab2a2e1d1
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.30];Helo=[HPK-VMS-XCH01.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT020.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4465
X-BESS-ID: 1666274188-105893-5349-18402-1
X-BESS-VER: 2019.1_20221004.2324
X-BESS-Apparent-Source-IP: 104.47.57.173
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.243589 [from 
	cloudscan23-254.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 13:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171992

If a package with a postsints script requires ldconfig, the package class adds
a ldconfig postinst fragment to initialize it before. Systemd has its own
ldconfig.service to initialize it and sometimes if both services are running
at the same time in the first boot, the first one will work, but the second
one will fail with the following error:

    ldconfig[141]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to /etc/ld.so.cache failed: No such file or directory

This commit adds a ordering dependency between them to make sure that only one
service is running at the same time.

Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index 7f72f3388a..b6b81d5c1a 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -1,9 +1,9 @@
 [Unit]
 Description=Run pending postinsts
 DefaultDependencies=no
-After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
+After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount ldconfig.service
 Before=sysinit.target
 
 [Service]
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
-- 
2.38.0


