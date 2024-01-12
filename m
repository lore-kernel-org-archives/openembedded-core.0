Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684F6C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:03:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.57])
 by mx.groups.io with SMTP id smtpd.web11.9166.1705071788845045876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FWzSMKv5;
 spf=pass (domain: axis.com, ip: 40.107.22.57, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MN83NOt5GADF6rexPqFCvCo7IvdaxJtrAFGurBVnGEezgJYJjhJ74LWcH4SStC4kxYHgGa4KaYpZzNZ2sk+94QTCqtNcCTd0pajYQ1CAEJ2pK73z+rQ/NmM6LVJ3RzmQtjiOdndtQfsYbF8m4pdK/MeVsnndeDVkn1FZP3ESEsl/EY3mNNp8g2c4rayumtAxasWZ2grYjIVNjDwr3NlUJLNUlpwWudN0IqlH2Brna6ib1f3oaeleZaZol5cqBJ2Xee5rEhj6uHIe5ODfBTCXgKtPzhOv8p2MpserzlwTQFdVs9hP8X7iN9WRbHBg+DHl2cdLJNjkFFBxRjOy5wlqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQJQql6BTfGQcocKJla9HZ54pIJw8RpfL9J0eBlwzso=;
 b=lAsw9b59v1QMWFCVskBhNSIUpdoJMosT/DVhbwmqOa/HxkrnS48wGbjrkvKc2nRQLXTQ5OdjrCtJ87yo3Pj861HZAHDjMGGItx/C8oLx5t8a+J7le5ll2nkkUGOyf7u6Je2YF7BQTUfwQY4d+LXI3ApCrUqZXa9YtM83n9Kux+WR0rOy0t/DM4fqGjusdjzLNUUgjjvlqG2F5uzUDF3xp2SNJB27mKo7hXskBj7kOPKfD3zw245klasUtUkrmwLdJOXCWYdVYMOFYIgUCDva2vITiGNmRd/9d+WJMEAq2sT5MjNSJGk9bIAqQoCVxgpXNTmX+AFtlVVeMS/B8z/2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQJQql6BTfGQcocKJla9HZ54pIJw8RpfL9J0eBlwzso=;
 b=FWzSMKv5gF6HPXMLf+6cjnL5UVYex3PF1lA9xcHlSDIaMCqJxIYrnoFu0prvfsFwbxXOUwxAzAXPvyLxRTPvayhH932VXrLRsnG1dz76bmhrbKBf2Oqge8ClVARa0gKCZ1OK9g53nJIiv5xR13KqN1uhQCWhlkMStChQV5g/01Q=
Received: from AS9PR06CA0505.eurprd06.prod.outlook.com (2603:10a6:20b:49b::31)
 by PAVPR02MB9643.eurprd02.prod.outlook.com (2603:10a6:102:300::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 15:03:04 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::82) by AS9PR06CA0505.outlook.office365.com
 (2603:10a6:20b:49b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 15:03:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 15:03:03 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:03:03 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Jan
 2024 16:03:03 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Jan 2024 16:03:03 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7260E11F77
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 16:03:03 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 65B3F8F4A6; Fri, 12 Jan 2024 16:03:03 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] insane.bbclass: Check for adjtime in check_32_bit_symbols
Date: Fri, 12 Jan 2024 16:03:01 +0100
Message-ID: <20240112150303.3807006-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000049:EE_|PAVPR02MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: 254a3406-f539-4af2-487e-08dc137f93b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QS8D6WbVrBmgyOZ8NJVbpYRXq9eyEgGMq5mESQVcWCxGh81e61zpf57zZLOeLJ041LqfMxj8BCIQB05G8EYChfvuZ43ZYyz91ddGkYM7eEwb0c/4KymTUopHZX6QBSyghsCDDz5egu2jKSj9f91rFF1uQS/yCNh83kejlVi11jxxK4LfzWGox9jkPJqtCuqj6mroHWVu2a5j035BVAIeef8xTlbNIDI5fXGJkL0eEEABkVTCmk3XgqBGRwU4xzSAqN/IkycNwu+5CLU21hrtaMPNexTXaPbiPyT7WKvnAdfqI/r80RsjTi0/TIXHHScNy6vzypyuysOa2cYaxFtmVKhPWbiG2M29/dcEZe29wYpkCugpAP4FVekJ9wWHsBek5DfjnCur9Fv42MR0+kzJlLUuWzc83SJrCvgZpnLhu//soqclzteKaCE3+JTu3Hn3oVOYOB/mvswvl/y3u2zWigwwp/ALH/Q+/p3+yQYWYeSytGFLtL0rVT38Lz5WiujukpHcnu3CbnywyOwuw4DwjYYtYQIKTeg+/dXY35uSq4xU31z0oeT0DeqJZpKgXfFnYM/pd8+av/+NLbrp411ZxP47gne6xbAlYVX1TknucXBSgoIey/vHzDzzUSxS+N1GHGSG3ORuCdJjeBV3i9FMrYKq9HxgwtSG8uJ/gzbYNs2NuJ/fRVZAK1qgXmf5mLXN5JBG/Ij+f0WI7JkKpbfu0/ddIg/FSsSsOI4M7ncvYU5w8STLNITmxDA8wleKb1C1j0cw5rgVWSUn3lHTQA+DHQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(1076003)(47076005)(426003)(2616005)(83380400001)(26005)(70586007)(81166007)(5660300002)(336012)(82740400003)(70206006)(4744005)(41300700001)(356005)(42186006)(8936002)(36860700001)(8676002)(2906002)(316002)(6916009)(478600001)(6266002)(36756003)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 15:03:03.8942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 254a3406-f539-4af2-487e-08dc137f93b1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193586

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


