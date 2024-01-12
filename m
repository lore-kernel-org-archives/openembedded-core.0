Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F718C4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:14:14 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.9476.1705072448904674474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dGzebFd9;
 spf=pass (domain: axis.com, ip: 40.107.21.50, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2ES1KafMQc/KA+tFQrX67O0PTEcQbh7WTf5YUPOnIjGphPOFXbpwXtvuUSykBiYX40r5ydnW9ir93j+49Lmh5eaT8JQMlx2k/S0qQ4LDB+FWWEPxtkpAOYsxVqzafonFXfFKKjUKPeoewAsz0wEMD4E1+oHijVwK8BB+DCegEKSfrTIBMcc/3qKvRTpt01S/keWEsEHhOBygR+hdY6IFZO79mNh9sfOFh5td7MU5fFOlS3uc38BTlnoeELJ605QvBXOJAR4AQ58nU2waUqmxL+b5XrLw5bZOPjnm44CZ5kOn1wOZ4M8/bHNqL1NmuWRgaNRLDd05RJduZ3MUlBtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQJQql6BTfGQcocKJla9HZ54pIJw8RpfL9J0eBlwzso=;
 b=hlplqTwIqHRauGRUQjivcObyK3YOaQdS8hyHxWDxTBi6+vYHuxfjVglvCIXB6/bZsndZQXGWB8xk2x9TIE7i4FeUNND7XJJg+d/BcpRdbeyBpFiasLpYR32PLfwRO60PJUpJZXJu6F/KcVIJc4TigRzJxDLse/XN0B5i6DpHggHShFVNRqiGOeHCdqcfKxqYxcwLsZxnoy4tF/9435yOMrTQxOHwSnAg7UWRlY/D/op3aEKOiAMQN/eCPB9yB9axp8fvMqw62lng9vdOzGMBvWiqz4KBck6pnpGXcSW8FtUXgLotexvghRzL/csDhC2CU42/+kq6EZ6ifAewVFL4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQJQql6BTfGQcocKJla9HZ54pIJw8RpfL9J0eBlwzso=;
 b=dGzebFd99g/hb+tZLTicBgBMnQukN1DT6Um6AYiXZtP6212NrXMi79rzyDsHcQvIX9nP4RLIeD/R5/9s+DY8Jj+lJ0VxcknCUcKBB7yjwnflN2blvr89cf1fyRNx7jTfp0WJu7OlBM90KCSinUDHTtYO9aRv76xMz0I0FzMQgns=
Received: from AM0PR01CA0153.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::22) by VI0PR02MB10704.eurprd02.prod.outlook.com
 (2603:10a6:800:204::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 15:14:04 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::2a) by AM0PR01CA0153.outlook.office365.com
 (2603:10a6:208:aa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 15:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Fri, 12 Jan 2024 15:14:03 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:14:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Jan 2024 16:14:03 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id AB0C511F9C
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 16:14:03 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 9EED08F4A6; Fri, 12 Jan 2024 16:14:03 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/3] insane.bbclass: Check for adjtime in check_32_bit_symbols
Date: Fri, 12 Jan 2024 16:14:01 +0100
Message-ID: <20240112151403.3810910-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|VI0PR02MB10704:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc9ec87-6e65-4406-42db-08dc13811d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jt0gL5GpzedDKhnFvcZBG3Y1dePnzZ7z0SDXfK1JDw2Wtpcuelw7eBgbMSK1FCG6tBosD3oPitbgmfo93AyRuHA+chxShA1zTJ6pNsdrWnxJjGcGEJMmoTZgKpjnUg4Pqv229s+mZNDNR3HpQL1pyWeWIqGShTddtLMAmcRMwNZyqT9+4pm2FxCWPCOnH/P557gZnjmHeLlpDj5uiNaZV4zLv5h8J/oAJAMRvJTS/5cyq9kjE4KbgP8OEp/QEUJQBhvwumAjZyzXsi6e1sWPmGsm9J7wGSIC5wgUZ2A2nIuuDGPZfXOSnGLOvuosOPuN7FbETZU47RThbsvnLbvWoIGrTao1SZbH8tEX4NvvDykKeGs1ogBUj2+1dRKNWY7vbyO8UXBo0a1WweNjR5yOOA6wU1TmwABI2JlnxUQTucYj0l+RmScUtaBG7/87BV6i/qKZz30RLGNMe5izE+FpApRUr4vFsVq99zHRdtPoWO07Eujn7U+jywSqO5qKs9cWfMddY8VrHqe0vP98USwGbebtkFVh0uRVCdnSG9TwiPQx76uMi2i0eDg2SMX63aADIE/nEAUM6vZu9vYsA/PWgaB+GvgQeoUkXl41LndIgTzkuaxKclpLWSD0uuzEzKoK+YblY/iM131chEhQbFlkk1l4ZUi+dgD4bf5l9NEbMXFX5HklfbWfl5lWaQPUnO7kWsACM6mo1WHaSEqUbP6zgk41ofYMIk45v1M3RGQDRUzzeN9tW1o410Qe4vhfnxGtaIEN9RgUeWjEWlNKJpoo0w==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(336012)(426003)(6266002)(26005)(83380400001)(2616005)(1076003)(82740400003)(478600001)(47076005)(36860700001)(5660300002)(41300700001)(2906002)(4744005)(42186006)(8676002)(316002)(70586007)(8936002)(6916009)(70206006)(36756003)(356005)(81166007)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:14:03.9816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc9ec87-6e65-4406-42db-08dc13811d20
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10704
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193591

adjtime was overlooked in the original commit.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 6f3cd3026d..69741a6a79 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -534,6 +534,7 @@ def check_32bit_symbols(path, packagename, d, elf, mess=
ages):
         # /usr/include/signal.h
         "sigtimedwait",
         # /usr/include/sys/time.h
+        "adjtime",
         "futimes", "futimesat", "getitimer", "gettimeofday", "lutimes",
         "setitimer", "settimeofday", "utimes",
         # /usr/include/sys/timex.h
--=20
2.39.2


