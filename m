Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811B11061B12
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 15:29:22 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54154.1774884560010329342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 08:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=CXWNLk9L;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 52.101.85.15, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eec3F3vY/GEgAlYran4PLwOokHQVsW0lLgnMz2siUvZaUU+t6FBdMmLdiYS8wJ+62+WexPFboc0Hsh9U8WVLw9Lts/pqkSp3NdhAjnMem4LfoYrrH9V8YQzGU19PnfGQstDriWN7m7J7UIK4gkr4Hqa1BlYM6OzxdT+Bi9EdqTL3RYuiwI7yRKcX0Yddw/4bgyPwSzeArpiQRc0bvrBVBF1Ex37QBydOEFA2+D7wW1cgwZyiYmOsPT/Yf2lc462OdMF1E34pt+Qd0jDHgyH5uItWOr5KE1TGIUAeehonxKXr9Xxenqu02AxyA20KbOeaDG+duOArkLuIs3A8ipWj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFwMS4SB/9lI8XydN1GCKreipzh9WjzABJSc+qaS88c=;
 b=ZDmZSDoafllmHgz6WoUiywnj7Lzwrg31BiQiL9WGfpZHiHB6HmAgyTudxVh05GOtV6wXrcVvLHoBZTR9dmDyzpw8BReSXVfbA//M8veHT0se49iS3LK53iolPYJLs+SMjfspg3ywcJvvzHl7Uko+rYu0ec14mhElKF/a33dyW/BshjzFs26TL+OyGNWqcfN3djbjtp7y1XQhXwKqJLCrUdU4QBNrEb3zd35imqLljt+QkpsWbc46sM+nXB/8Ow7c8cIUe9SlyuBPPGdpAXJoDIPB0X2mKewNqOcovRDujl9dda9huBlf+HmbNTylUK37QjdhiiQude56r7zpvYykFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFwMS4SB/9lI8XydN1GCKreipzh9WjzABJSc+qaS88c=;
 b=CXWNLk9LlCKuPgTjkSwgIvySpne4TvwuUuwEVlDOeQCXOt2IIc3PRQ0gp4mKo4aGxTnQ+0ZtV9IVwTg640OjbutXX2EyMmxYAsHMj8u5EQRLoPnXooxmZ7VEqZL+/KFrSDLPbSzBXGZUJO3bRC6V7xtUry1EA1Rns81P9cwOytU=
Received: from SA0PR11CA0091.namprd11.prod.outlook.com (2603:10b6:806:d1::6)
 by IA0PR12MB8087.namprd12.prod.outlook.com (2603:10b6:208:401::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:29:15 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::fa) by SA0PR11CA0091.outlook.office365.com
 (2603:10b6:806:d1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:29:15 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:29:14 -0500
Received: from xcosswyocto01.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:29:14 -0500
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][master][PATCH] u-boot: Fix indentation in do_deploy SPL binary block
Date: Mon, 30 Mar 2026 09:29:14 -0600
Message-ID: <20260330152914.4155774-1-sandeep.gundlupet-raju@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|IA0PR12MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ccca33-303c-42da-3a58-08de8e7119f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	A3KmUBF4bZvUH+qb2J3PwW52jbObinkAwNeYOB9ZG7r821iw+OkeEZ01MJ7PM1SyHenJBVsgYsdLqUBfLTi750ZqV/ZWMGfxHA2H4yUc4NZQAocFuZHnwf5ScEAmQ8JcZDO5CnVgjEKUX8LLGRVztlQGrY5sYVrxRzgnnL3jbKYPhnM7Bro8PCqwCDJqg1bCSN1AEjGoq0hAVfhoDJSm3a+pYBfxbwWhF1gnF9pci0brrhVxwjXS4kP9GUfa0NmwqGwtJAq02pNFqUiVZOlNHl5UxxZmaSFJTzP7ozZjjboPEptcGgdubaS3jBU5EoauYdnbqcR2jaqsRgUbiV855ZUb59uN6jc1yiP/Crq2yl+GcBQygOElEy/pR1QuRi0rfIbVWkmA9DyRx9KbWM4INQRRUW2u/+o6UO6T+MNFUPSI1d2OAEjdN9CCkaWl8eEBRtHVF3wGpW4P3/iIqUe1NH+2TEvGDJQ9gmI/JLqivxXVhEMIarslgl4joLDrONc5FuHw7xQXLmqCF/dKq3VOAacl6twPKY0LpwR7Ms/12sQX4XOC5Kbkp79RqgVYuS8JeBFy88JV11ffI7U8ofFYqF+F0pAtd5f8wt0DVxmEcimcqdBR+9YCYxRNnZMF0IhrsadsWVT+LeOuvQT1NTdYJLPzgyxIwc5cVZhg1aBWsu5WXGBt7HKUIFZD37nuOYoqFNH0mqfbIhRdeDunXNUdrMrpb9LW4+pEvx5Xcln4E78/9qY/G04Z//aYbiLVB+/HPUklxnQC2Ko54QrtSu7Ixw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B4pJl6vZpG8XZp+OVmfEamuh2oPwZkJa7GKIr7A4L8tUf99btYdTlUyxGj9YNQweeVtaBbLqr23FkAspU+/Agr3LDI2XAie0BLpNMp0SlxatViqFzlezOYpd3HAvY9NTKAGhhfM2SIblZvdwHKLugdUAi3fETMEBYlfs3EU4HWuu/juguADRtbWaR6pY+SRqxUBUin/rsDK63a1UE7Oo1fC5s+g4uA/grFSuZ8Liv2NJuQFeanAJT+z275fXAdQa/nlZBZfcBmSWeTgyrJIZnr77tV9Ffc0zHsemzMISvkPZjnwus7REI8lRpvI/JyQG1Qbs9WuQESQdMP0LbOV6ScwRjQFBMyg6lQ/yzPRSh/f9wnzv+pk0q2H95kpJbQY532GkaOo3ZcsKuJGyH0261NbdzGOJ5ax1BIziaEuHvH7Vte4hioT8ZfsktY9XTod0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:29:15.0924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ccca33-303c-42da-3a58-08de8e7119f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 15:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234249

Normalize leading whitespace on the 'if [ -n "${SPL_BINARY}" ]' and
matching 'then' lines in do_deploy to be consistent with the surrounding
code. Spaces-only change, no logic change.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 01137cb495..a75948dfc3 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -337,8 +337,8 @@ do_deploy () {
         fi
     fi
=20
-     if [ -n "${SPL_BINARY}" ]
-     then
+    if [ -n "${SPL_BINARY}" ]
+    then
         if [ -n "${UBOOT_CONFIG}" ]
         then
             for config in ${UBOOT_MACHINE}; do
--=20
2.34.1


