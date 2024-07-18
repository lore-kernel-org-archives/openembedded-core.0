Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C092C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 06:47:39 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.76])
 by mx.groups.io with SMTP id smtpd.web10.9555.1721285253788918722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 23:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=kWXWfKUV;
 spf=pass (domain: de.bosch.com, ip: 40.107.105.76, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdMj6elIA7y79plfHcYr4oUA8N+S2SphzBUUubYuc2dKM2Up9x0Zq3zRKwZuhiEY03qeKW+CQ4p3KjK4dCTkEtsC3TPgiVQNc+TTIjVz5sOQAZ+I5CPsZv15gcZvUGzfM5QktMl4Vd1vdBpkMGfz96heEtT4fkiTykfnOluwLP86XUlsLc//hvlJA3FxGBcwr2LDgVIlc01a3TQvw7yHC4VQLKMdm9mm6ujZWbBeV/3tNcwibmK2qaDAlMUYjKMr6bK04VOlWjK0tVTYcDVsvnIBax+kGXe8gKKS38vjR+izM4nk1hWO4uHdmY6vQIA6mjS0A3QbZkl7jMjAUZrHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpmtY0szrl1Bzva/rRtTBtMtwgTu+u/x3IEhA/eAg9A=;
 b=FuF8N8dMNkryD6kX3AhS4b+tITVbl8xZQzxpgKsDPQWhcoh1kF3KdHfDYZzId3NantsYYWT7XbcHavGRzlyeHWJII48fImsjOcXPzlFdngOqCUt1QiIZinnI4uRhYtXWPy9JCD7Y5PXfCu8h666nGx3gPlvz20a6XtXQjw45LOZiUL28UaqYsfSndgkxxCRPBRAi5zER45+xuI1ki5L/q1FKlDz+Fvvtj7LivwXwESKlc07/yfm1up3QN3IBLi7Z3U5CHsyHzfqV5N9fsBL/IK6GP4YSS5TUW3Kfxs1Gs3QlSO1Le6EzLqlz12J14M8UkcjWTMFYlhYttdvkFDV+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpmtY0szrl1Bzva/rRtTBtMtwgTu+u/x3IEhA/eAg9A=;
 b=kWXWfKUVF9U9D7hSJ1TT39yiDBdKXFNw2ylOe65edIwkDVcGBfnl8nQqu8xkPXsOOgc9v2iTZRZ7KcQrgQTNZPUJTH2mfyImMIiYUA8g+H9jMiiSzXVxN/f4lDderfh83heS3aSJyEPfx09cfRQfBnT9En1bT+1XsFTKy26hesoSB5oWvguwPEyXJiYt4WWRjBs3bKEB+Thl8HQVfxhp/dqShwkOGFYQfiJ+BkgF1+n8/3YwN5jIehAJ4vj901EqWpo21MM3WnJxeGm+BVgU8dNAhlWRMEgBM7KIN0TFdtQnSs+i3esdEMqjxyd7P15cTZyueswFT3ZHxtxuhskXoA==
Received: from AS9PR0301CA0019.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::29) by DU0PR10MB5432.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:32b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 06:47:30 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:468:cafe::5f) by AS9PR0301CA0019.outlook.office365.com
 (2603:10a6:20b:468::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Thu, 18 Jul 2024 06:47:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 06:47:29 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jul
 2024 08:47:18 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 08:47:18 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bluca@debian.org>, <luca.boccassi@microsoft.com>,
	<matt.hoosier@garmin.com>, <richard.purdie@linuxfoundation.org>,
	<mark.jonas@de.bosch.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Subject: [PATCH 1/2] volatile-binds: Do not create workdir if OverlayFS is disabled
Date: Thu, 18 Jul 2024 08:46:33 +0200
Message-ID: <20240718064634.7276-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718064634.7276-1-mark.jonas@de.bosch.com>
References: <20240718064634.7276-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|DU0PR10MB5432:EE_
X-MS-Office365-Filtering-Correlation-Id: d720ae68-6a75-46eb-1eed-08dca6f57e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S3JvLoPFTZitT2wmvBRDgkEyTI/aPuGtDNzdGNtjZDT8U4/jOBjXViFNwlCe?=
 =?us-ascii?Q?qVIO3Gv7IUKI1edCDuVtidaT0X/87fjElDsB4l8LfU2SQ5QAHXrKlNM4rBFw?=
 =?us-ascii?Q?Mb0llmGtx+WtHVwvLwvOo7oZIMo5NFX8SMjAV242bkrG1nU+Vp09XirzNnSP?=
 =?us-ascii?Q?0/BmdZHXGpIqYV4PFwiJCpeJhYk27Uu54LxMMf6LD/daMFxZZQ1IgnPZFP9+?=
 =?us-ascii?Q?xgytMZiRJLUiAXNjFKsZ7pZ1cBnHDGwCgPVyNbrboh0BDYKwaRJoyY2OygB6?=
 =?us-ascii?Q?+Fyz1dMPKh0qTDdBhrl7s/WZ0vAbU9YNzXDtqNhhdxktDV9KrK3QBF7iZtrm?=
 =?us-ascii?Q?9esGE0eXwQ1pJmRZ78tzzGvcRt1JkJgWLmt6C+EKaUePEyaF/B5uHdI0zJEV?=
 =?us-ascii?Q?AWv8Ezydow1e99NqjOJbfpSRqhyfjroDZmhUa0sBL4ixnXzpTFBpFSqg3ax0?=
 =?us-ascii?Q?Dv49Xwr5tPwlVctLgIH0U/yfiJREfff4Bjo6eWK53t8Pvup9QqDhpZ0PRLpd?=
 =?us-ascii?Q?a7xuwtUeyH5AaIVwxz1ZUy5/SpYNXWrMKLk8lsXVDSy+5nSv8D6pZCRPXzqD?=
 =?us-ascii?Q?hjDaB1sNuknIX7jaNKrq9O/DJOPvyS9/M+faJAESFPJfdztz8WxfDw3k8j4H?=
 =?us-ascii?Q?6WVPuuJv/UtPhyqPuNtJ7fROqQhiIY9QvOtsfAoL3MeXRJNn+/0mGZOSyCGp?=
 =?us-ascii?Q?mBxIJbFUmOyBg8VaZB38pL5tw7twMR8O8lOoj7iRnMBJzuc9KK4qfFtOsO1N?=
 =?us-ascii?Q?aZmYIkAuhyOqi0HbB27tbxOGADBwmQeEHS7wHmNAerGrCJjiajSVZZu0jVAP?=
 =?us-ascii?Q?GKUOq3+aZopN14P1zD/LGE2Rsk9QqfjryKnGYefTr4U901BMUWbjlLhdhBn9?=
 =?us-ascii?Q?/G+28ruQs7BX/cToOfJ2EA6rkrAFcScB9qvyiAnFTMj57uD9G8pmbgdZJKWJ?=
 =?us-ascii?Q?bVXbU7mg9FSJIK0c4SbEBP+ohhO2W+OF+m02TLnfxTeV8e2/qbzPqHDiKQ3m?=
 =?us-ascii?Q?FBhwBuDFk/Usu6REPKWuPKBjfwa9B69TyDKu6crUqf4zmQ8qbm0AXuRfy2d+?=
 =?us-ascii?Q?ZX44YuCRMZJNdbFw5Ytm3UaeUYrjGYVCktS61qILoEsUu/yUP1PUnzn/7ftY?=
 =?us-ascii?Q?Wty81elcoGChp6w0WGnjWuxWxaJB0ndEi1XHIp8SNEaqeMChx/kLfxEC3V+2?=
 =?us-ascii?Q?bfVTufSTbrO3CD8BoStu6GKATdt6yreKl4l6tkR85rbQQuJY1Gbo4gaJXNcW?=
 =?us-ascii?Q?Lk5/80hy5df2joEk0pZivCCElGXal4R/xx6xaLJiZJnn9SzhtnrIKl2ciH1c?=
 =?us-ascii?Q?nHoF8EQ5ld3R6z+aJgl9R8hxSFj3zKkYmfZdq/Rt0rzpyTOo8EzaR4d/5PiK?=
 =?us-ascii?Q?gxcu5ptB+ggLuCkMUvHr4+QcdVVZGhfNbjlxReXOLlVedkLjcOePRYiIMu9P?=
 =?us-ascii?Q?nK9NMBPfbj595wxLMMv2n5pgaiRqYtVg?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:47:29.8208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d720ae68-6a75-46eb-1eed-08dca6f57e79
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202188

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

When the mountpoint parameter is a directory, the mount-copybind will
first try to use OverlayFS. Because of that, it needs to create the
OverlayFS workdir (determined by the overlay_workdir).

But if the environment variable MOUNT_COPYBIND_AVOID_OVERLAYFS is set
to "1", the script uses bind mount. In that case, the overlay_workdir
is useless, leaving the spec parent directory in a dirty state.

This commit changes mount-copybind so that the overlay_workdir is only
created when MOUNT_COPYBIND_AVOID_OVERLAYFS is not set to 1.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-core/volatile-binds/files/mount-copybind | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/r=
ecipes-core/volatile-binds/files/mount-copybind
index ddc4357615..da88d160ee 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -45,7 +45,9 @@ if [ -d "$mountpoint" ]; then
=20
     # Fast version of calculating `dirname ${spec}`/.`basename ${spec}`-wo=
rk
     overlay_workdir=3D"${spec%/*}/.${spec##*/}-work"
-    mkdir "${overlay_workdir}"
+    if [ "$MOUNT_COPYBIND_AVOID_OVERLAYFS" !=3D 1 ]; then
+        mkdir "${overlay_workdir}"
+    fi
=20
     # Try to mount using overlay, which is must faster than copying files.
     # If that fails, fall back to slower copy.
--=20
2.25.1


