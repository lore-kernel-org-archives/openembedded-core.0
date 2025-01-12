Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BBEC02181
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 14:55:14 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.79])
 by mx.groups.io with SMTP id smtpd.web10.36965.1736693706488568100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 06:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=lefEvksj;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.79, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiZgSX800y8b3Ogc5hmLkVARd/yJb+w/nlHAHGebRTRQ5dfe7BZ/oD8KRh7zsY7Dp+SJml5MgQRnssIXxCY9nsCt3F1rnhm7AqV8BH1qK0HttZ9P0ErZxNiRHNQkQOPeIEbIYINwH9YL/C6ldA9VQlzhxAUKv40MCDLK4d8XuFBJQXH8Nylz0xedzu+joqr5U351DfZsc3rf1EVTUlqkCMAV0EXCC+VUKNP4MeiW2CTuInieuQEmRw40SACBSPq6ZyHJ+/I9tXNZmC6O4CsQXnxOYft6L7DhXtUunxuUzhWZF8Kvjr8FK6we7K2VzsB4gmxcyjXF3ux1yv6vuZUq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsVmsBfVSeyxYPsYR8L4KO4Gi4wZQWK6p3iX21/+iqo=;
 b=p1NhzmpfBpcWB/KlcqIwKViZWHsL46R7Y36GTZI4vU4LsaG4OFLqYO6fFGEiWgSEkf56ZOv8g94spPzwvvYuQ4xUy1q1fIp7DI72x7TGYhzJmXH+HckZYIntmj30kZDehl4C9SpRhCkFr/ekdyC7CKmPv0sCpd2XlJtgGhmhPdpyUbS3jU83VKo1fua3090Ihzv/XZPvuViDtEhEhkHiYssGAaZWg9HNZcy5w+c258uiOUIoSNJvTbpqpmZN7MIzPHjvmlgR+j0REeLY+Cvvm2Azc0PaLGjC7RI9Ze+59ya649K0bDJJGMAu7swSwO/csu83jtlZyRrp75A08YNF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsVmsBfVSeyxYPsYR8L4KO4Gi4wZQWK6p3iX21/+iqo=;
 b=lefEvksjJdVHpR765e6OJKGzjlvqcJ/LWjcu7yOF1/xdkNymf6licFZVwFyPCfDBgZ1Ur1pwij5NbGF9zP29h5KUNy3MXSDxCRqy9NPX9Wq559ChLhv19Nrnd9WFWPSPzNsEZYIKvA7sU2G3w/dm0kpS0JNdMNu8foTYWyukY19xJJcrOM/9bs473xlxzSJ27lWkn54pcb3itb3PPCNE8C2dM+4TyyEX6yyaA+ZB4uFyR6AXEhCJWOGDLeG+kB7X3MbNxTo02a5VWCGDIodJSl8NUZkLaHrxV0u0/r9QwmbD/BDdJpfRwwAVkR44kpooK3jNxxPL6iIzQQKlVhT4rQ==
Received: from BN9PR03CA0394.namprd03.prod.outlook.com (2603:10b6:408:111::9)
 by IA1PR12MB6090.namprd12.prod.outlook.com (2603:10b6:208:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 14:55:02 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:111:cafe::7b) by BN9PR03CA0394.outlook.office365.com
 (2603:10b6:408:111::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.17 via Frontend Transport; Sun,
 12 Jan 2025 14:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Sun, 12 Jan 2025 14:55:02 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 12 Jan 2025 07:54:57 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 6/7] devtool: misc cleanups
Date: Sun, 12 Jan 2025 09:53:58 -0500
Message-ID: <20250112145359.607585-7-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
References: <20250112145359.607585-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA1PR12MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: 61441c54-b3c1-4d03-e325-08dd33191806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rL63ONyfmcVXI5gXmiyN1FmUBCub2KKTC/5Ua2w8vxpUiQPOzXnmWNcEkCA5?=
 =?us-ascii?Q?ZFFnEabyFWmsOwDDIx2/gFs9jGLA5oAsxAwXBHd2q4JF30zALH43C3CHC75g?=
 =?us-ascii?Q?paG+HmEkryLHkJbs1VAzZ7Gq8n3q4eNwj568E3TpqZ0WQZTJrP8/SHpKZNf5?=
 =?us-ascii?Q?Y7FGLIIlvaWgVIexMe8Bzl3O1rMCAkYvmZPIYNYart37oCelYdLE9OaAmahv?=
 =?us-ascii?Q?wYRW+055IZMSNBTREGno6aFnvSIuX/iZBlFC1N3hM1ezxH6n0glFoUSAzqNv?=
 =?us-ascii?Q?J0Idix9kXPq4tWKJibm2HwtP/R4A8xUN965dI762bz5VuZcVKW8gKjIsKptC?=
 =?us-ascii?Q?KKfb3HGfv+I7iFn7bXY0izWuz0Ry9Ev0BU/0mgPTmQ/EZAAuyCFmwRgMNlcr?=
 =?us-ascii?Q?CopIw1HpY9W6KwdcY5ds/h9AxOUj03+aoIhvp1yCT2EPyhkphHAadx/dKgoN?=
 =?us-ascii?Q?4PfXuCJpRP/iop18yXHCuHkchrYrWi3/M6RT68VLraiEoOatQ3an6/cZH8OM?=
 =?us-ascii?Q?nhOVE5G5CwWPC8Tu3jVZf0fVDWJIPNDH+vUEFtUL6eNlo+5a9CGD/qotI8u8?=
 =?us-ascii?Q?E+858noBVoUwqDg1jw9HwWS+HcV8BpXsW+tq78FVi/w8B1x4viW29XvM+iLX?=
 =?us-ascii?Q?e7d3teUSyHTcmXBfHpegA+puklImyaXktRHi3GM0/VbWBfLHPSBVdfEYZDnb?=
 =?us-ascii?Q?yIvlbax/NVDCvnsqsYJ3QIv3zYZ/xDWWfP1uVic4DWJxxCE3NX24UfKBqWP6?=
 =?us-ascii?Q?/xvz6PLi+SZbbEgra+Jw9bDiDB9s3oVxFzllYOycJtpPKqkuqYIvEvpEGMYU?=
 =?us-ascii?Q?YQ3mzFJvE5BnQMudelcFRkgvuc1uEicxXyNk/pwHcY/StXolKfyHFCe2KHid?=
 =?us-ascii?Q?UVpT/HQ+FI1YNaZbdjBOuTQLtnpb8r0IR/4+LVUcZ/MlmLqToz1gEzK1T57W?=
 =?us-ascii?Q?XocyqNpHFjGg7uS5X6iq2MbIWGFsu5kXXh9xOZDvRCeXwg+mSSHeSHyI1Akt?=
 =?us-ascii?Q?u8fQmXDBpxpIn4s1di9ULzAkX0xB8BDLbepYBn1h7wmLt83ImXhRhB1IGVac?=
 =?us-ascii?Q?u1zstla0nfU8AFUClpUA7SXfhiiQper8NBcTPRNDUqlV/g4cpJr8GEbVvfCv?=
 =?us-ascii?Q?QydEfWBHzLqruhhOW8Magb+8z1t7GgVbit8UdrccC4RaWCdQVEZvctvzPcL9?=
 =?us-ascii?Q?+2P7IK2k6PsBxxkbPqEjmh8+Jd7V8hCN/YF9M/gyr2RWM4FAA7iIZGpZBRUF?=
 =?us-ascii?Q?MZF7jfYRS3FyjqaDGQcCQB+de8yANckwpm9/jSzBaYXYDEZLhEMuue/ya4I7?=
 =?us-ascii?Q?yYNoz+NvuGucJEcvay7lKg/++yhfwQ8lYWUMQt5sFw82BjBHyNWI3LXqT+H+?=
 =?us-ascii?Q?8EWwtZmnM/voQNfc66ULvoPYwU9yi1OBd7zrhe6zt8G3Z6pfXz8gtYhGUrpd?=
 =?us-ascii?Q?XX8+Av8EP7EmasGxMkQD0w1hFmBkW5I8sUle9s++fYaw8Q0Ewp0j/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2025 14:55:02.5531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61441c54-b3c1-4d03-e325-08dd33191806
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 14:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209693

From: Chris Laplante <chris.laplante@agilent.com>

1. Bad None comparison
2. Reliance on transitive includes in bb
3. Unbound 'ret' variable

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/devtool | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index b43a958497..1994d4b507 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -45,7 +45,7 @@ class ConfigHandler:
         try:
             ret =3D self.config_obj.get(section, option)
         except (configparser.NoOptionError, configparser.NoSectionError):
-            if default !=3D None:
+            if default is not None:
                 ret =3D default
             else:
                 raise
@@ -147,7 +147,7 @@ def create_workspace(args, config, basepath, workspace)=
:
         _enable_workspace_layer(workspacedir, config, basepath)
=20
 def _create_workspace(workspacedir, config, basepath, layerseries=3DNone):
-    import bb
+    import bb.utils
=20
     confdir =3D os.path.join(workspacedir, 'conf')
     if os.path.exists(os.path.join(confdir, 'layer.conf')):
@@ -192,7 +192,7 @@ def _create_workspace(workspacedir, config, basepath, l=
ayerseries=3DNone):
=20
 def _enable_workspace_layer(workspacedir, config, basepath):
     """Ensure the workspace layer is in bblayers.conf"""
-    import bb
+    import bb.utils
     bblayers_conf =3D os.path.join(basepath, 'conf', 'bblayers.conf')
     if not os.path.exists(bblayers_conf):
         logger.error('Unable to find bblayers.conf')
@@ -286,6 +286,7 @@ def main():
     scriptutils.logger_setup_color(logger, global_args.color)
=20
     if global_args.bbpath is None:
+        import bb
         try:
             tinfoil =3D setup_tinfoil(config_only=3DTrue, basepath=3Dbasep=
ath)
             try:
@@ -341,6 +342,7 @@ def main():
         ret =3D err.exitcode
     except argparse_oe.ArgumentUsageError as ae:
         parser.error_subcommand(ae.message, ae.subcommand)
+        ret =3D 2
=20
     return ret
=20
--=20
2.43.0


