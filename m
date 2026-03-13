Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C06B105F7B5
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:14:35 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18190.1773414866621635355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hC94WCqe;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.68, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZEr+nPG3jXwXkQetni/OOrXdaBIgr3nYSQ01zY/UXLuSYzBliLPaAP/PvSdrrrUxdqof/UhNwq+5Tll0fkmGHPygFxFy58EuOVUC/BHmJgP22i01xIiD8jHkTL75O9AEfHm0a3Q9f/1xZUlR935Gfi0Y4rVtRUjy0b+Crch2rZX7XNQKroVT+HzZeIZXo4YPXGhM5UbOhc5vRL3pyiQu7ZMVv9rmYQ7d3tgIiaEV1zGIB14QRWWCQf+CHRDLfzTXGktQw6o+16guDskv9vsw0LrG9iPkTAPN9F6DyRslVWkH5XK8vDY4OLzqwaKgA6ZrKdopGsYclRcX2GUiPC1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ckog5bQXZm3yG+ExGEzf+aHnmq1I50eq05X4n20gnc=;
 b=RifOw4VmPoUKJeV5iUtfSDj5JFnxRP7ZVqsmi10Bo0DXJCrgih1EmX5ovr+x2awvXANzCehH4pxJ83HlGI939bfz3S5ZFDM/hEsf3KJsC0rOcpkQrQ0je/mqH6DkxTaw3Pjitk31cUFn9CZ3G/vDUfGFIjoNrtBAimqHUkzgRelZiIFPk3s8vWWsmNzCOjB+CGi2G8+h6yA9KpZY7u8klmNz1d/AtJVAGJTjTw6hUmBNAL3AnGuUQ2FHUjYwcFuZNX7+iNHe3cwoGcR+pfyFSVOQ2WUVg9nH/VY+HAR5ORRSiAIYjMn9do+VpIiWxlQkbULhn9x3Q/lJN6/n6nMOxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ckog5bQXZm3yG+ExGEzf+aHnmq1I50eq05X4n20gnc=;
 b=hC94WCqe32aFz4p+DXvvFbly7TYEHAFTlkCsys6i7gavo/STYFw3dVVJQTmCjkfra8sigLjqRWx+UVohkJrILhaQD2pfGHBakMIigGLADfkbjpwzduzjv4m5SMhWVA9OoTQMG1MzCp8Z7gINEFSAKXblzUtIbm6JldAKNQ48BVM=
Received: from SA9PR13CA0138.namprd13.prod.outlook.com (2603:10b6:806:27::23)
 by CY5PR10MB5940.namprd10.prod.outlook.com (2603:10b6:930:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:14:23 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::73) by SA9PR13CA0138.outlook.office365.com
 (2603:10b6:806:27::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 15:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 15:14:23 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:14:23 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:14:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:14:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DFEMDW232437
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:14:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w14DW-0000000FbhS-3Tvx
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Mar 2026 10:14:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/2] uboot-config: Change indentation for KCONFIG_CONFIG_ROOTDIR check
Date: Fri, 13 Mar 2026 10:14:21 -0500
Message-ID: <20260313151422.3719829-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|CY5PR10MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 1646a1b2-f270-4a76-8736-08de8113357b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Hs/gKKZWKxniWXjkrTRSc8BGDRk6T8fS4X4wfSddsPrZuLybGcGX+1nG7A4+xX1IaOzSKyPBP4KXffvRtWoP0YRvzuGeXVvOI5tniQlGq1KpS8NH5zrxv9EIlslhXUSAFk2XQmqeus2R/vg8/vXT1T4KgbtM3XRf68Qdq5BFPRkHXKguxqtWNBJVgEtOLm/cVkOxDMoJyPqYMqYyR4nb2u0XPrTtDl97Jkd2eOdJvWTNLJRW5esStL+NSj2DNo35NO55dPZv1LWDoh2RBtpSGgkTuvtasTuznEYjQ8/HojWEzaOPjn9mpd970uxLcGRNvzaci3Y6divcvMGAWNWIZDb5ecvG8I42KcEQ4chhT22lWDWiistpY9JF/uV2MsS/3Um6ZPclafFyImq6XAZE3lBq/YVBtYfu1fl9BizJfM3ogLGXmq4yPG/Y+YbKEcCd/9GZd9uq3HgMUPIhNS1VSVtro9qXXZWwh7emx85roc8C/U9c+GdeHgaPgm9uqAeerEd8YDg2EjG+cg5jKxqxm0VrNw5fHdpgiF8RvA1zU2Z1VuLStSy92MPYUleOaR5qdjhPzPIkyzgdyXsXEc1gJrBFpGd6VPs++NO/GhbWe5oGV+FRHxZnTyRr7O5F1Ci9FLAHMvnzLvN5EUB19YkRsQMp59OMMYYJHrVMhLeCRp84g1CkXGKS/hlEoyR/D+NXFfxUEga2v9GK9E4Y1eFr9I5Ek6ara3ABTCxneTn+hxSJ66YsPlLyfxg0BmLYiEyq/a6mlVzV+xYvulNPLyEaYw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BPZ18lvaY7B7GMI3rmtzukP/R5cO3yccyWOSj+6M7RBzMRGBNU+h7Efeh1QXlmKhfpA5ugxesqbWnSGuh+61bJVjtjKaiiRVadH9H7d2WDos5+y7Ecfatkor/qhxhWjjn9oYepwILWeEG4W455wkbPD4TpBxOcmp9qnKsrQiM0teGwvdUpmimecOmUpYNBK8y0HiB3GZTS0b8wAG+nEa1+J7vh/9lrOtPv5m0rucaSd8OPc/EkZ8rVmVM+GJg1i2PI37GnO12okSJPB9y+yT5mfWF+CR4N2JDCoc+TRwnMBTxPPfsjj2aZtzqbcRfp3IGGgatX6jjyQYww0bZ51UFHT2NMIJOzqDBWf01b0IIeK0VnPK5aKH4yyPVMkR7ivHf2iitTn9vydVI5D7u6pGFnadQqL9/6DMEiwdMwL/v6hliJGBQ65FfpNuSSxDQj9Y
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:14:23.4113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1646a1b2-f270-4a76-8736-08de8113357b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233045

The current check is in the inner loop of UBOOT_CONFIG, but the check is
attempting to only apply to the case when there is a single entry in
UBOOT_CONFIG.  Shift the indention to be outside of the for loop and
only execute once.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/uboot-config.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index f7848396c1..9e24db1f48 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -247,15 +247,15 @@ python () {
             bb.debug(1, "Appending '%s' to UBOOT_CONFIG_FRAGMENTS." % frag=
ments)
             d.appendVar('UBOOT_CONFIG_FRAGMENTS', fragments + " ? ")
=20
-            # This recipe might be inherited e.g. by the kernel recipe via=
 kernel-fitimage.bbclass
-            # Ensure the uboot specific menuconfig settings do not leak in=
to other recipes
-            if 'u-boot' in recipename:
-                if len(ubootconfig) =3D=3D 1:
-                    builddir =3D "%s-%s" % (d.getVar("UBOOT_MACHINE").stri=
p(), config)
-                    d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}"=
, builddir))
-                else:
-                    # Disable menuconfig for multiple configs
-                    d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
+        # This recipe might be inherited e.g. by the kernel recipe via ker=
nel-fitimage.bbclass
+        # Ensure the uboot specific menuconfig settings do not leak into o=
ther recipes
+        if 'u-boot' in recipename:
+            if len(ubootconfig) =3D=3D 1:
+                builddir =3D "%s-%s" % (d.getVar("UBOOT_MACHINE").strip(),=
 config)
+                d.setVar('KCONFIG_CONFIG_ROOTDIR', os.path.join("${B}", bu=
ilddir))
+            else:
+                # Disable menuconfig for multiple configs
+                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
 }
=20
 uboot_config_get_indexed_value () {
--=20
2.43.0


