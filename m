Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87325C369D1
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 12:25:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.70])
 by mx.groups.io with SMTP id smtpd.web10.41136.1727353521907577663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 05:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Psxy3rXj;
 spf=pass (domain: axis.com, ip: 52.101.70.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO0Yd0tVMqCHq3gYQ45MOs6PplDYTAspVhs1eF+sh+drZO2JztfEnxiNthD12hp1YrsYpbwVrQdAwazgbOpJ+wSU5rmnZG7dTdGr71NPJFVrAOGRoBIn8SE72QKBLghtO0JCqkZ5GeT+9wqGZ1xGHB2l3crJxSlX3TC+RH7iZ0vATDQlTBd9bRclx8FJ9seujIEnU78MfYB+j17uFjg882KTERxpTSWo1Rcl8RoL5TDzDmiiMdId/HnYUFLsjzgHf6lw2yTT7HchR/GbszAu0Twc7G+taceArJDnBOWauRPJOy2uEQR7oP10dJy+IaONM9vAJ/J4yWcjpf1HeruU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rmilmeu0KIwLNmdoNdpXswHAHIPvjflH+udbsVtmDQ0=;
 b=pfavAH4kPQyqo0vSPJVLdspA6u1uTBlZ3K/iS2ogINCuLrHDyC000p16zgno6oO8AxagrtPG+oZUGrhFEdlW58HQm92rW9xPIqaP8DjJyx2nnhBtN5VQwAtc6H19WtzCxIdgOUplauvQn8ZhQYQF5ZJBkOZ6EgqlfHjOxVZ3iPAe8l8lMO670x1OWDbUbijeUlCTQownF99gA577Y7/CSk5k10J3kv1QMSvDXHJbAtvuQJFHYJ++WX/PMpJZNZWENVg2H/jwd/44SCw6ypvHKTXAx6AO5g1qgNDoUdGKFTcFpTTwSN1LZ/pmmftxw4QdLg3wdBjARF7uVvWwV0CRrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rmilmeu0KIwLNmdoNdpXswHAHIPvjflH+udbsVtmDQ0=;
 b=Psxy3rXjrNzZTJpmPKIsk1v7cx+tWH/COq7qHudqaZHf4247lgaa07Hk/aHTrNDlVtXO2FiO5xkPCArp5XXPrUhAkPaw0ylcxsOucImn9Bblec/P1soVq/zmx6HAF8PXojG6XAxNLwVZ2sgGROH+xawbSNwJurr27kCwo9nfAYU=
Received: from AM5PR1001CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::49)
 by DB5PR02MB10120.eurprd02.prod.outlook.com (2603:10a6:10:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 12:25:12 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:206:2:cafe::e2) by AM5PR1001CA0036.outlook.office365.com
 (2603:10a6:206:2::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Thu, 26 Sep 2024 12:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 12:25:12 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 14:25:11 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 14:25:11 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Sep 2024 14:25:11 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 881681B1
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 14:25:11 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 48QCPBo81711720
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 14:25:11 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 48QCPBa21711719
	for openembedded-core@lists.openembedded.org; Thu, 26 Sep 2024 14:25:11 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][PATCH] image.bbclass: Drop support for ImageQAFailed exceptions in image_qa
Date: Thu, 26 Sep 2024 14:25:06 +0200
Message-ID: <20240926122506.1711698-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|DB5PR02MB10120:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cd7734-2720-472c-d7dd-08dcde2644ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qarZkdidwvuPwCF8dPUVaL80i3leOpFu7yeP7TYQEqkA4OwPDLrvlqcKa6y/?=
 =?us-ascii?Q?eqTaWBTqVRulLSjpwdX73621ravbwS6zQl8FdKn6U63dNz0AM4o/MJ8FuqPg?=
 =?us-ascii?Q?d3fRN+uYu2O/vT0ZUQuEK2rDp0dDqfhkm5zfJwD2rJ73j8QtT6lsXFQfj8LN?=
 =?us-ascii?Q?wzaWuWIsRIeig+JSMwy13sRPVgYYjGQZv0meURvVUC1HfsHXUFuPDuu1SB2s?=
 =?us-ascii?Q?2dQkfNDbKrDjRDIsMTpMl12KFtPpxoWqXyfOJGe00FG6aLjoDxRi2KbRGAnX?=
 =?us-ascii?Q?RQyVpJpGfXnbpyleGbu5kYYq5l+op/PhfQuRViG1lu7Xn3fr44y7VSAOaKjC?=
 =?us-ascii?Q?SrfjbDT7HVxrpZU53VD3gdLrVc8mpYUm+i6dUrTjeOVDJ9OLYKpmkXIhHF0f?=
 =?us-ascii?Q?elR44YMzmvQ9DeXHyOcQMfvCdm2dGXZmNwjejccrrzBJ50QJUQAU3c/UPQIw?=
 =?us-ascii?Q?OXU9jIh6EgCI72EPWPn3xm8k+mVLIu/c4NKwZtDq4KLhFl5OBFfQ5r2C7EMM?=
 =?us-ascii?Q?ZUhsvImKMpyUG3uuIUOhT9/w4d8RKWMQoVWwqKBYvUiKZ0r5Dyzqeb96xxRX?=
 =?us-ascii?Q?P7X2VdbUxWbnvxTONbH7A4A25Rkhy3+k6q5gKEW5p2fYEUQXm5v1UWoiQ6xG?=
 =?us-ascii?Q?jARGnl4lQ7XJTaigjW62Y6vsKVlnY9MCnHN9DXmRiETpevQWQFNVCqABZNmj?=
 =?us-ascii?Q?fH737JpgpAkrrLJMAZWkjb/9xIZTinEfo4inhuLDoTSPeqsg/J6tDK8HCK29?=
 =?us-ascii?Q?MA9n+VKBf+fLbPvqO2N+xXwUk5cfnIACN8ivCVLr1e028LSlhPPaA5aVmign?=
 =?us-ascii?Q?7CmjFNGf4f8ozwRZsHKdiJvRz+tuQUh7IGOoGrRMVzo9+bqobrB/2cz7W7PG?=
 =?us-ascii?Q?s7GC+Ojts4hUTLadszNPYXBR16/hfmu4xjLjCRWbdljIgwCUecJcJ1jYPOVe?=
 =?us-ascii?Q?ic/uBdMyoQ57dEXI/R3zqfht9K1rHA8AvwKr6XKZl7+jhmqyezpwAtQi562Z?=
 =?us-ascii?Q?Vikz0XhY46nQT8karwaVfmGs1l16JnELF6EdiLQ4bMLuiQrJHYxa2y5Z5Up0?=
 =?us-ascii?Q?1Gt6BE9DsIH2IQlvY2g/QOYPH2HSd2BF2U/cQj2+TAY28XfOVtdCFya2P/1R?=
 =?us-ascii?Q?OUR1DE4btULttIDaIH2WyLiKi40Bzwn4W2Cbraa6lan9u6VodguDul8f3qqG?=
 =?us-ascii?Q?ramy9wvNYOsplynxSMdANb+uMjRucLU+KuTK7oIlMDQP1m2283S02JVonzU8?=
 =?us-ascii?Q?Kf8Kb0xg71cW7W8affBTDAdpCuxIay+GBWaXBV+2E+CSPpJsCNAL6gFKBTwd?=
 =?us-ascii?Q?nrC58VdamhoSZ9a14zU+CElkv4BgL5pzcPdqT+cM0rgSedwM6vF2eTqYyGwv?=
 =?us-ascii?Q?Vc1q31AUgAg4SVtU0f3K5JH0Q3DI?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 12:25:12.1756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cd7734-2720-472c-d7dd-08dcde2644ac
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204981

After commit 905e224849fbbed1719e0add231b00e2d570b3b4 (image_qa: fix
error handling), any unexpected exceptions in do_image_qa() would result
in a variable being set, but never used, effectively hiding the error.

Since image_qa now calls oe.qa.exit_if_errors(), remove the support for
oe.utils.ImageQAFailed and instead rely on the called functions to call
oe.qa.handle_error() themselves. This matches what do_package_qa() does.

Also update the description of do_image_qa() to explain that the called
functions are expected to call oe.qa.handle_error() themselves.

[ YOCTO #15601 ]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/image.bbclass | 15 ++++-----------
 meta/lib/oe/utils.py              | 13 -------------
 2 files changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 834ae03f3c..00f1d58f23 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -324,27 +324,20 @@ addtask do_image_complete_setscene
 # IMAGE_QA_COMMANDS +=3D " \
 #     image_check_everything_ok \
 # "
+#
 # This task runs all functions in IMAGE_QA_COMMANDS after the rootfs
 # construction has completed in order to validate the resulting image.
 #
 # The functions should use ${IMAGE_ROOTFS} to find the unpacked rootfs
 # directory, which if QA passes will be the basis for the images.
 #
-# The functions should use oe.utils.ImageQAFailed(description, name) to ra=
ise
-# errors. The name must be listed in ERROR_QA or WARN_QA to prompt.
+# The functions are expected to call oe.qa.handle_error() to report any
+# problems.
 fakeroot python do_image_qa () {
-    from oe.utils import ImageQAFailed
-
     qa_cmds =3D (d.getVar('IMAGE_QA_COMMANDS') or '').split()
=20
     for cmd in qa_cmds:
-        try:
-            bb.build.exec_func(cmd, d)
-        except oe.utils.ImageQAFailed as e:
-            qamsg =3D 'Image QA function %s failed: %s\n' % (e.name, e.des=
cription)
-            oe.qa.handle_error(e.name, qamsg, d)
-        except Exception as e:
-            qamsg =3D qamsg + '\tImage QA function %s failed: %s\n' % (cmd=
, e)
+        bb.build.exec_func(cmd, d)
=20
     oe.qa.exit_if_errors(d)
 }
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 83f1440887..c9c7a47041 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -482,19 +482,6 @@ def get_multilib_datastore(variant, d):
         localdata.setVar("MLPREFIX", "")
     return localdata
=20
-class ImageQAFailed(bb.BBHandledException):
-    def __init__(self, description, name=3DNone, logfile=3DNone):
-        self.description =3D description
-        self.name =3D name
-        self.logfile=3Dlogfile
-
-    def __str__(self):
-        msg =3D 'Function failed: %s' % self.name
-        if self.description:
-            msg =3D msg + ' (%s)' % self.description
-
-        return msg
-
 def sh_quote(string):
     import shlex
     return shlex.quote(string)

