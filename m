Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0037BC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 06:47:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.9559.1721285264857216546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 23:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=osI0MHoG;
 spf=pass (domain: de.bosch.com, ip: 40.107.20.59, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJ0cHMxkUu4XKtY0//d6SySX1Ze6RXMophItWoqddiC2G97F+J+xvmfWx5rBC2RPAjSQBl3ZL9tWSLtZ1RfFgC+p/TVil2V9vzXl+NiXpEB4523bc3vkfEtx9Im6wJmnid+6T0FvufgfeZ1ZDFbCreOVHsisxTvSpSpWINYX/jXej40MuAdTU6yMCpQAMYj3tvm1wn3fBMWCL3uqhsYj8EN5We5aUOKHvH5vQukK2c+Wp/tH1fXr46DUi5zT4pAt/e18lwWqEtJhDl9F+ofaH4PKY0mLI0v81dMRJW5+EGc1ZCdYIQ5dp0WB2kmiWo5UDOJVNqDr9Lrw+OgTRvHoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV6LwveJ1xoEe03jRg5QE8roxB6Ng2U++GvbG3fu47Y=;
 b=AveX1Biwd2UACloo7AcJ7Dqq1AhOx+j7W2YBg87XwfXkS99714TzY2Whsj4izmJtc9szhA/SRs41ao9xobCCigGgUk09aZZGBSeJHF9d6YDeh2dig30/RYTQoDV8g13WE1fCn/zRZKLJTj1NfVGjZhK12r7ECqfatoN2Y4zSsKYqDUfYkBCFY7SOFGOjm5WyDuJRhKlgA2guyaGxMPqJfVBi1xwXurBoyxOfgDeBvOK0dafVNC4VluivD8G3eDryx2Dtu/9pb+tFnx95ZZMt25knZ9fCe5CI8qYJmXg4X/oQCp7VA7eLyECm85VyV1Uyeo3IW7vHKE/6UEOAU7zayA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV6LwveJ1xoEe03jRg5QE8roxB6Ng2U++GvbG3fu47Y=;
 b=osI0MHoGa4leP3fUFEDWKTkJIi481zmpBrNupiSpv+z5U9LfrCmwsoNZECY/RNJx/1AI+SdL/46z5OOlMTgHiomuak7J0d6CsUnfJQUSfxKaTRDu9sO0Nz+mjLDqee0khYkDrdoPgCLXwgPejn5n9S/jpBNY9A6//BprO4auLnLUwGiBD5pfNVGxlRYf9iqdIfH0Z8wVLQCSBTYmRGms5huoqUPRLDypwY6Vgkj9UQHGjXUO1SALfzT8C0LY9AJ1I64nvjb4CeymPhBL9ZugWZbo3tBjS2it1cI1ZjIJ5pMqovM2VPjC3XcdAPGpPHgQPRfjv45+T3lHhuCls640SA==
Received: from DB7PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:10:52::27)
 by VI1PR10MB3264.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 06:47:41 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::64) by DB7PR02CA0014.outlook.office365.com
 (2603:10a6:10:52::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Thu, 18 Jul 2024 06:47:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 06:47:41 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jul
 2024 08:47:30 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 08:47:30 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bluca@debian.org>, <luca.boccassi@microsoft.com>,
	<matt.hoosier@garmin.com>, <richard.purdie@linuxfoundation.org>,
	<mark.jonas@de.bosch.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Subject: [PATCH 2/2] volatile-binds: Remove workdir if OverlayFS fails
Date: Thu, 18 Jul 2024 08:46:34 +0200
Message-ID: <20240718064634.7276-3-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718064634.7276-1-mark.jonas@de.bosch.com>
References: <20240718064634.7276-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|VI1PR10MB3264:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d8133d-80f1-4ee7-d0d8-08dca6f58579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PWsXjPb6rvmLkM9HAMfpi61wRRf7w/+WPcVCtmIxwpa8eAh+kNGvwuZaq9bn?=
 =?us-ascii?Q?k+gTpIWCPdo/zo9nMf6AMebWftiTjf/kLL5oP4VPmHxSmGUBjgXuZIKnbg6y?=
 =?us-ascii?Q?outDWwYyz7/XVRXI78FgXEoSKPDSnC8lbs+dXVY0lIyROaToVAJcXILhkJ0N?=
 =?us-ascii?Q?dttIWA80DEDmvOa0I2dXMQYbWUb1ctqqwv3Zkbex+9UcqJD7F9jvYgBPhdDl?=
 =?us-ascii?Q?tkp5x0EKBrlsIRDw1dKfL5dQ7ljuxvv1071NGqtpMzgm1o8AQeF+C3TLecla?=
 =?us-ascii?Q?W9mLx4cxMwA5mrQnatY7sp0R5DbPs09gG1nk2Xktp4hfpgi4F0Wi14gq9j3W?=
 =?us-ascii?Q?btGJiVmRq9OyVXBzUy9yU9x3a1YjNFgtMxYMzTxYwUAjT463+EFTMvqCOAhL?=
 =?us-ascii?Q?UCSDpo8CKL0PPz5MqBOVdubL2g63raAHALLlpbSHud3qTW2Sr8U1QUGq7rKc?=
 =?us-ascii?Q?WJQy2eGYZC9sqQYlnjx4E99qhfJ+LP5JR2jTbtpCjGlK/qhgErAL7npwY6Ws?=
 =?us-ascii?Q?UFs5XBbhgKndYLpSwqCQDyLWdM2nQ9cqNg877FVlLCfhx88R5oDaixZQy25M?=
 =?us-ascii?Q?8trwFzoztgmLJmPF9LEBSRN1cUXvXQRaeNo3mobPN7cYyNRWz3ItwN3x91YC?=
 =?us-ascii?Q?dkawtqP+eGW8g34zj9wlWf94nBd8sg7MuTrNINMzxw6Bt9BmyFi10uqKCiOI?=
 =?us-ascii?Q?GWyhJXzr1knzhVjF1mOgWwQbFhqku8h8GihDNDwsbzC4Z9IVjEIc+qdQn2pE?=
 =?us-ascii?Q?ZniF8Mxce+oXZdKxX5T0VmP3VHrX1SgeCMQLfzZxG1dXknsYAmms+guFRO1l?=
 =?us-ascii?Q?2c8VclS0T7gDl2djamnE2d2gwEnbEmGRjxy+5LnCDkVwmR6OGRHZwk1ho6fk?=
 =?us-ascii?Q?wzHD9b3/ZsLjj2eR+c804+5vcfwocQaXt4e4keexY5bz4Su533g4fgnvMBU5?=
 =?us-ascii?Q?VTqXsFOGVvZlR9T7ZDmNzJQKJocvBU5PmAo7Suja73qqbntSxOoYZHakzpRA?=
 =?us-ascii?Q?9fUXoVi3H0vCpY9pHGtwiNoi2wzwruN+Idc0HqMnq29ZyoQmu4W2NiG0qgge?=
 =?us-ascii?Q?PgmXJY/8RShQKG/zRHXPlbbT7AzUo8wswtH9/NIm7yU12C/4DuG/uLKRCF2i?=
 =?us-ascii?Q?tnybyYGgu2YN2zDCW5sgkex8aA1ii4/pshHiBalD5OQCBP89SxBjQxAePwvz?=
 =?us-ascii?Q?cDO+GjOi3VB6ZsDbqyA1YPtD9knmN8wbye0WlzHxdp3xnJ6X8Db/N7NuvUfE?=
 =?us-ascii?Q?M894srWYd2MObgnmKXuDy4eDhW1dCUHs3bgj+0ZHk/uCzf9a1tkv7NlnRQo4?=
 =?us-ascii?Q?GfLdxIqZzhtinO7l5OIivwVZ7KiRxbcg+1ZxkOov3rjFg/UgJR42Sx5xTLH1?=
 =?us-ascii?Q?rZV/0OcHMv4QEMC98ZUGeeV3PzhUf7BJNGVvjVNXFUuodVHRDYl0MJcoDKYt?=
 =?us-ascii?Q?H2JPBhVst3cb8NaKoxNZ+Mk8bXuCqGEk?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:47:41.5225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d8133d-80f1-4ee7-d0d8-08dca6f58579
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3264
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202189

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

To fulfill OverlayFS workdir requirements, the mount-copybind script
creates a workdir. But if the mount operation fails for any reason,
the workdir is left there.

Then, subsequent runs of mount-copybind will again try to
create the directory and pollute system logs with failed mkdir error
messages.

This commit mitigates the problem by unconditionally removing workdir
if the OverlayFS is not used or fails to run.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-core/volatile-binds/files/mount-copybind | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/r=
ecipes-core/volatile-binds/files/mount-copybind
index da88d160ee..4f373412be 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -57,6 +57,7 @@ if [ -d "$mountpoint" ]; then
         fi
     fi
     if [ "$MOUNT_COPYBIND_AVOID_OVERLAYFS" =3D 1 ] || ! mount -t overlay o=
verlay -olowerdir=3D"$mountpoint",upperdir=3D"$spec",workdir=3D"$overlay_wo=
rkdir""$mountcontext" "$mountpoint" > /dev/null 2>&1; then
+        rm -rf "$overlay_workdir"
=20
         if [ "$specdir_existed" !=3D "yes" ]; then
             cp -aPR "$mountpoint"/. "$spec/"
--=20
2.25.1


