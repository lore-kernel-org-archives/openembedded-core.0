Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5798CC369DE
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 12:26:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.14])
 by mx.groups.io with SMTP id smtpd.web10.41159.1727353569232394382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 05:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jzatN8HF;
 spf=pass (domain: axis.com, ip: 52.101.66.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzuWaL2du4CP5X0CQ+pC2BWvcMs6XNS4RZ4rjg29IJ8+r4f5omP292iJVatfM4KNjWV801nWpDqeO7oVtk88HpK8VrxfH5Kxcx6xveZK9Bf26bZs97QZs3244B4LU9/0M+Ljps5hgXVUExW53Ldo/Dm0llXBnyR92iWRoX07l+2asBQieX/miv0sjjhdykaKD7AXJzKoQFqEmQCnGU8dVb3rHXXtuHWgJoP67jNev2oC/yYK2YyQgIex/MuyRFrjE5OAbRxKM5Yt84e2+zciRkNotlm04v9ZfZUGzWr04OYpHTogh2Az4NFIKxecq8ayc7ZFxeayJ/I+0oZbEbqvEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTgT+0zow25D9/sVnOg9E6UneTFFBxmWN0ePbv+7dYM=;
 b=Ci508esbIG31DdCP/XMbL+fmTAr6XuE6OelUO/RUR2kFZt3OTqQwSBnQk5HREqG+Tl/cPi73gtVqC+4rRCYzxMMqJMnJzD6tNHtfQ/JZlHPJuCskDsqGuR074676V+hoPTjvbzjqv+hx4HzzZSqPw4gx5E3Dky5xMviaZi2JxDDMgxZqJvhzLYNbpR0aUPcg/5u7YJ6iJdLxsLZinahCal1P8i6B8yS1IHs5q43R22Jf0NQGxQjHN7GPcqeIJaTA3+1WnBp641wujpQKvduKgTM05j+dRLtUPUFMegEDHE8O6LtTY/k0Zstzsb/+8qWCvuO3xaOPbvWlNNL6INH22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTgT+0zow25D9/sVnOg9E6UneTFFBxmWN0ePbv+7dYM=;
 b=jzatN8HFmXP0FsAdvj7XGViS7pEhLZKjL14UX2nNH96cNsKHdOKbShBfp2xWSA7OKbUTX1KVh5Gk8+d/uBw/cdk6Cq4KR8Ze/CwYfg+hO09d6+ygXLfowjxzjylfyLfahOdo1o3CgsGvPqRXR9ltkcrH3Rww8yZLunEmyHWdXMw=
Received: from DB8PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:10:a0::25)
 by GV1PR02MB11081.eurprd02.prod.outlook.com (2603:10a6:150:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Thu, 26 Sep
 2024 12:26:02 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:a0:cafe::50) by DB8PR09CA0012.outlook.office365.com
 (2603:10a6:10:a0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28 via Frontend
 Transport; Thu, 26 Sep 2024 12:26:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 12:26:02 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 14:26:01 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 26 Sep 2024 14:26:01 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id B3EC71B1
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 14:26:01 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 48QCQ1WX1711821
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 14:26:01 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 48QCQ18U1711820
	for openembedded-core@lists.openembedded.org; Thu, 26 Sep 2024 14:26:01 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [styhead][PATCH] image.bbclass: Don't catch and ignore unexpected exceptions in image_qa
Date: Thu, 26 Sep 2024 14:25:59 +0200
Message-ID: <20240926122559.1711799-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61E:EE_|GV1PR02MB11081:EE_
X-MS-Office365-Filtering-Correlation-Id: aba241be-e514-46cf-4361-08dcde266287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?leWvPGc/P6Ba9R/K7gdyXRYJ54P35Kr6X6ERhyuYc0K9s70NezGUlxajliv2?=
 =?us-ascii?Q?cFKX2d6VzphoSdPtgSbmxasBFAvjybCVwy8hhYAP6qqv0VBlZy4SQ3lkC9fm?=
 =?us-ascii?Q?Sa/V3gS9VaFLuxToiKBKMaS9wM8FPTA27U4xXVGudAu40KZR9qB4lBQMsSDC?=
 =?us-ascii?Q?Vx45qymmcCNf7LCNHCf8bHl1AKVhHJfUwoDKNHcBSqGcZQaHwGYJy+BXYLMx?=
 =?us-ascii?Q?KMICf5hFP64wktfoKyLst237MhHpzTU5QPD5xe+Qg1OiHczUl+wdSI/+fWtg?=
 =?us-ascii?Q?cdCBx8hC4WV7rl4BTcDmyzP8WlHaHreqbAMF3ubZFhEUMzy0fNQrBfUHZlfF?=
 =?us-ascii?Q?6HM+wAKf1Jd/e2R6Ltiq87n5+occLFE0P8e0xvSTRUtS4bQP3UY9Hx8PlEr1?=
 =?us-ascii?Q?+UWA9zlzx1/YKAmWcSlWttCHldG+j/VR6dHg5bQKHSPIXIhVwSSRctHXEgcM?=
 =?us-ascii?Q?iTkOuTTrYOgEYZkC+N13xH4lQOwm/AXycEcloB/D8XTFC90yh8Bg9SAg/pW7?=
 =?us-ascii?Q?kYaAQpgzc1LllG7h0RaLpRRez/wDqrCE+iCIiS3kf2prhD1RKXh4/c/qPs+H?=
 =?us-ascii?Q?1sw5GdCxi6yX54/XfN1G5+LJfTkVoBtJJpPqPPCX1Jj0V8jNkcjgY1M9z4Aw?=
 =?us-ascii?Q?USt6Dep1nPw2cc/uQv+TXlg56xrP7VDCmtYCK7UVEXvR14I1Q0QqKM1Xcbih?=
 =?us-ascii?Q?Hfca6HikoEpJ8V9OKYfohAaw5IP3yNNFhrL1LkUs3jNDGb9XbAjHfx1409k3?=
 =?us-ascii?Q?LqM+WsMxyPQOPiu1vl3jWmfbQRCpp16QU1clN93QlYi1vwhxcbRCLyELplfA?=
 =?us-ascii?Q?0d55SgcerFoc9Vs4cMWD4xMZOxdsa4smTsmaV9Top6DtnTAYfa6cJQMtoUI9?=
 =?us-ascii?Q?wATc/8osy0ir3ttsyEEg7WufbEDrgM/PDI5sl0qpsWx0FJ+2a7qxIRmySLWW?=
 =?us-ascii?Q?KJ64lkWT449rir2ML00OYuEoJzFaVPP+PTRGpxG+6hH5P54G8TBBJy7Wgdj1?=
 =?us-ascii?Q?FcFVszVX/ob/S8c41wQBYJCSMvKdRSocolaSrFqyrf3ita+etFpeFOOhNUfX?=
 =?us-ascii?Q?mVme/f41BT0fIBug6wj6wr6DJw2PCUiA13sjTDXdz3Y5HkvvPJbCWAjnSjVs?=
 =?us-ascii?Q?fgNHagRghulYMMe5V4RXSxZ7mgWkOIWby/AYucBi2O5Fi4rBK66yMDTFfQ5/?=
 =?us-ascii?Q?HsIrx3e5OiegzEF7/Cx7Am19HdbmCr+NY5wFq0+ODVgq/DmGFklpkprzkeuB?=
 =?us-ascii?Q?BZQupCglXm5pToLqyHjBmHT2GKlFMH0wm1tlSutSOThZgAYjbgyfwKBmgx7I?=
 =?us-ascii?Q?vKY6HsEM7VSQpYtp5ooSzLydWCmVtFC2m9z08ncRj4RGo0HffzpgU8JKKvNP?=
 =?us-ascii?Q?pkMNNcFrZwtsNmg16oixfqTwnIJd?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 12:26:02.2141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba241be-e514-46cf-4361-08dcde266287
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB11081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 12:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204982

After commit 905e224849fbbed1719e0add231b00e2d570b3b4 (image_qa: fix
error handling), any unexpected exceptions in do_image_qa() would result
in a variable being set, but never used, effectively hiding the error.

Drop the catch for Exception and let any such exceptions pass through.

Also update the description of do_image_qa() to explain that the called
functions are expected to call oe.qa.handle_error() themselves, and that
the support for oe.utils.ImageQAFailed is deprecated and will be removed
in the next major release of OE-Core.

[ YOCTO #15601 ]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/image.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 834ae03f3c..793b550bfb 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -324,14 +324,19 @@ addtask do_image_complete_setscene
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
+# problems. Alternatively, they can raise
+# oe.utils.ImageQAFailed(description, name), in which case the name
+# needs to be present in either ERROR_QA or WARN_QA for the message to
+# show. Raising ImageQAFailed is deprecated and will be removed in the
+# next major release of OE Core.
 fakeroot python do_image_qa () {
     from oe.utils import ImageQAFailed
=20
@@ -343,8 +348,6 @@ fakeroot python do_image_qa () {
         except oe.utils.ImageQAFailed as e:
             qamsg =3D 'Image QA function %s failed: %s\n' % (e.name, e.des=
cription)
             oe.qa.handle_error(e.name, qamsg, d)
-        except Exception as e:
-            qamsg =3D qamsg + '\tImage QA function %s failed: %s\n' % (cmd=
, e)
=20
     oe.qa.exit_if_errors(d)
 }

