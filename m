Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C9CC48BEF
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web11.5289.1708110006007900816
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=WKHgILXo;
 spf=pass (domain: axis.com, ip: 40.107.20.85, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Grxuu8CrYNLqb1X6a2v1tSul56IYOjY053Uy9WhHgEHYAzwJtRr6JaLjKqy9UczQpUPQMIPk4KPOxdmYS0xn10QIpd7Ut35+QY9NiPStKORlyW1rzqwXYuJ8sxJRoDnsX2jV5EiRYsea5tHqYrGFiBfquMaexeqgUQdlb0EqlYXJILRnRUPXS0voHMN+XfxSuij6q7Z9h/fhx9pCOiR2+S8UQhAYjwd89KeYtBPzKkl5j37UfQSiMHrlv6oaRMtXUYstK/hrk9cNnovpB/HEcFe/tWj6pnp+xXtzAe18PybF0i+fu9WbZe0kSbI/+IGZe08qT2KEgvtaa6zd0KyF4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz4g+PiDJCndTTvG4nyEZMrLvuy9Txk0v5JE0DdWCZ8=;
 b=CDry5Job9ttVe/rTxUa+sbbomjm/hUaUs9GljnrYI7NE3wnofIhhLijRGJir0aoADITzspj0ON7FN92zHsW2lt7GUhwpKh9wPm+l0MiF4JnmsschuC0WojvtJV+WTuTPL3oWTv+mhikltl3xAlwiAdsTQeS+UesdpuJXNcOLcYZ8T6bMYrdTkVVkeIHpjo9X5wUBk9jRXQxWw/4CXqQrN15xIb5kNqq3a8TGm+Pf9WdsDtEklIal6t+e2iGzwEMRzmUs7V+uegzh5Gh7qS3n/lWEFufpEwSuL8QLJo5Hr0OiNlaoHry7V0cbOZsvszmRGwr81WnyoHyoZqci++63eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz4g+PiDJCndTTvG4nyEZMrLvuy9Txk0v5JE0DdWCZ8=;
 b=WKHgILXobA0vpYsBZMOoT4aCJavz0C7sbFaQ2/wQtcsJUjOHe6z6j5WooYuCUrDgNFFiwLRKiicTy95NAFydCKzasqUIOkv9Te1wJJxy18yOom0pZa0r32SHu+LUI8BW2l3/vA6caSNrbIIN7dxC0dc7IhboDHQcVyM9d4xVIss=
Received: from AS4PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::17)
 by AM9PR02MB6529.eurprd02.prod.outlook.com (2603:10a6:20b:2c9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Fri, 16 Feb
 2024 19:00:03 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::45) by AS4PR09CA0027.outlook.office365.com
 (2603:10a6:20b:5d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Fri, 16 Feb 2024 19:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 19:00:03 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:02 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 8750914698
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ02QT2607010
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ02282607009
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:02 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/7] devtool: _extract_source: Correct the removal of an old backup directory
Date: Fri, 16 Feb 2024 19:59:51 +0100
Message-ID: <20240216185956.2606978-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216185956.2606978-1-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|AM9PR02MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: a6113214-bb82-432e-8bf4-08dc2f217b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AWl2fHb8NnLeBxzXfUCbQ4oU6ANJo6KaHF7jwZZnxGQVXkN1naU2nsT8p3Yay+GXXTYeOpzxRED7l9WJMgaEKK5UCznYQNNiUrIhEGd4Fc8TMwZBU55U41l9EJWfBEiV+0pOEiR7kBg3UV1CP/79isOCqtiP05jQ624bxJrurwngJ1xI78Fya3wAy22pbIHOTE62uCFQnYf1hS09w5ffFeX6KtyZ6+sWPWf/tLFw4sECqHUezXgHks8JlapJFO1L+6cYFokFltBmCooVNRvGvnO3jfYXcujY87sn3PX6wKa2Eqz+45KKkpXJwi9paH0hXJkphnsl+D39bHrW1QDy/K8zFUAz+PimK5sYCiiB5QgWm8Kzi1DOe17IDuq5ppFhcPy4IjCr5NZHACGDq4d/um92TdXR9HvKDwhR+hDleUxM6XkIiRi3LI7F5XcrDSAco4416mV2GgL749KwjuRNrISqvLv1JU6eVTLR6We374TFisnwobE+rncrFPHglVK6HCryn9LECK+pWlbxh6JrP9V//IQ+rmBYtLutJ/NddFNTnJBsxitHarFx7YhLaTgQNztCAAys3h5z1CcDpIFWEFITU4XOGsdaA6kKQykFJE6g7IeBuLrHEhkIZH/t0ZaQw3yMW+kG2jVHjJJs2Pgisb1jwWnnJpF3oluYdLR+Fwo=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(186009)(36860700004)(82310400011)(64100799003)(1800799012)(451199024)(46966006)(40470700004)(42186006)(6666004)(316002)(8676002)(6916009)(8936002)(5660300002)(2906002)(70206006)(70586007)(478600001)(1076003)(36756003)(2616005)(41300700001)(26005)(81166007)(83380400001)(336012)(426003)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:03.0633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6113214-bb82-432e-8bf4-08dc2f217b6f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6529
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195793

Also correct the comment describing what is happening.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index dd9232da1c..ccb7ea851b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -667,13 +667,13 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, config, basepath, works
         if sync:
             bb.process.run('git fetch file://' + srcsubdir + ' ' + devbran=
ch + ':' + devbranch, cwd=3Dsrctree)
=20
-            # Move oe-local-files directory to srctree
-            # As the oe-local-files is not part of the constructed git tre=
e,
-            # remove them directly during the synchrounizating might surpr=
ise
-            # the users.  Instead, we move it to oe-local-files.bak and re=
mind
-            # user in the log message.
+            # Move the oe-local-files directory to srctree.
+            # As oe-local-files is not part of the constructed git tree,
+            # removing it directly during the synchronization might surpri=
se
+            # the user.  Instead, we move it to oe-local-files.bak and rem=
ind
+            # the user in the log message.
             if os.path.exists(srctree_localdir + '.bak'):
-                shutil.rmtree(srctree_localdir, srctree_localdir + '.bak')
+                shutil.rmtree(srctree_localdir + '.bak')
=20
             if os.path.exists(srctree_localdir):
                 logger.info('Backing up current local file directory %s' %=
 srctree_localdir)

