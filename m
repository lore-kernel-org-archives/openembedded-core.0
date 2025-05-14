Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B852C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:41:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.105817.1747237257611271886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=h49qQ5Lv;
 spf=pass (domain: ericsson.com, ip: 40.107.22.62, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BszWeeW92pLkmrfXkHK9qi2yr1E4jyQXGAHaeOLqrmH9fkfsDxk8uabcKC2L3GvaUY/yEjpMTBvXRf+ZDUODnH5jfJPBGEg6KoEWV0cwVEFmppa5eUp/LCr49DAxY8LcElWgvnZDqAtG96ISlRLqWhmyqbaMvBZEO6ywq8zaVxhvpSUltV5ZWSLWXvIhRiiyKsx/WT7lfbRC9HMVBpC8CfFW/g4hte42b2+KT35y8cqBbpEBNiqo4VTpyrDTnowci7YCESCjTPnaohrTYerIkyvN0tO2O39U6lW1o9Suuv8zzxy+noE4Rs5pusXHIHVp6srLHbF0raqheqOEuLxB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0XZBT+CcBsku8vVTZ1kS3EbkLEq6kMOnnbdoJkkKcc=;
 b=lj6qRHBdzxgI6OUwoyjqFv91lxg3AgtYvhmTDwXd5C1VIUEzb3g8HbU82Fkp8nLJnaP8bqa3Qty2ULJZdR4COxYw0BhMSEoSof8+ftPYcHQLJL0w9JiRmf/Okf/gfm6KPUatog0XsoKGpoTt4fJ8YlkYmwS15Go09oviAx+erEYtff8GKbZQzD9B0Nm4gKmGyWJyFVyHcHJbZUZzmNac3kKrwv/jaD8Sx2WBwuWe+JF5eeDIFr0hxtFMrhHEou/RQzTw0J34F0ip9gVQplCQ2IqbGUvQ7CI8mJYv6sL+0QvYDNzOKBJlZQXxedWJ2WFIrPtUVMo+WBiiEIiZ/lyTAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0XZBT+CcBsku8vVTZ1kS3EbkLEq6kMOnnbdoJkkKcc=;
 b=h49qQ5Lv2jIFXrs09S85f7nng2yXZoyCqLxEzXnRsfLxTfj4jeDlxlZaCoXm5sb2edoXiOhDYEGabNnZLBieqUuWEqTT+xU0mi6F0AxSIkQKDc22eDh8AvsQdmBslvt36HejZBt+ZmKtbQfxVBJyzUjxmwLCNd4qTfSdj0h16ixjmrT819U/MsrHUKNX4Xuln/11jlEYCPUY5/1TME9KD2j7nNm7TX3lwxZ+X6ytuTZOEaZ7fIKR1qpVWSJUsObknlR4+f84N8LqMWgbFaBfUqN+kQD2r9b4d84J7mt8g4Sk8K5X/G1lQ8LdnY+/ZKxCwmCzIMTGk7ZT4KhTAJf+kw==
Received: from AM9P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::30)
 by AS8PR07MB9464.eurprd07.prod.outlook.com (2603:10a6:20b:63d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 15:40:51 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::e) by AM9P193CA0025.outlook.office365.com
 (2603:10a6:20b:21e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Wed,
 14 May 2025 15:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 15:40:51 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 17:40:51 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 4C27941CB796;
	Wed, 14 May 2025 15:11:54 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 34C9170E61C0; Wed, 14 May 2025 15:11:54 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Marta Rybczynska
	<rybczynska@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, "Peter
 Marko" <peter.marko@siemens.com>
Subject: [PATCH v4 2/3] kernel: add support to extract compiled files
Date: Wed, 14 May 2025 15:11:45 +0200
Message-ID: <20250514131146.501451-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514131146.501451-1-daniel.turull@ericsson.com>
References: <20250514131146.501451-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A6:EE_|AS8PR07MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 291480b9-f939-4eb3-0257-08dd92fdb50a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/+5izu9RD9skKbzQDmC1qJHVSh4H8Qm9+rhsE2M9ku2gML4k8/lPKVfQ9WFN?=
 =?us-ascii?Q?Q8LlPfc1Hy15lnp00rc5PunHKu67c9X3fz9uKxjPr3SNhSC7IfgueL2GsWZp?=
 =?us-ascii?Q?wVTG3woD/pZpiZcvFvK64xUWCj153eE2kNoiC/I8vHoAP14+xR6c77/qrokA?=
 =?us-ascii?Q?3QZopa1Ebmo/Hm1Mv3yMX4xvqgKLTHANIZGoTlLrTneyoiVerxMks79LPsWx?=
 =?us-ascii?Q?USZBhB0bJtbEIoEHeSrAZd5l+u1gn9xN5rSCxr4o7kJJEqex9DWVhAV+MynW?=
 =?us-ascii?Q?pcJUHldQv34bg86JraKcMmmlQv8oxBaQy5aW0+/QxqiKlXDLjyRK0kkWS5lW?=
 =?us-ascii?Q?E1VaVo/Ba0LtZBzVBlZormrR2Ei6T5XboYqmoc80hgonepfLej8deAN6rmBg?=
 =?us-ascii?Q?jBxFc/ze8TxGeS10z+kZRQCYnBfsgxiA+LFk18CL1ekOdZrJ9rnrhV3iHn1X?=
 =?us-ascii?Q?n+E5po3LtV6Aa/KyM7ZK09ZeGnYaLOU4L8WOChZu8BVSBrJj1NBK8MfWyoZj?=
 =?us-ascii?Q?OtFKAjJwYm81xAZ+aG3gTNVgM/9dHpKxVfVOuuqj1aZkfEfVsQVxvh+nvmk6?=
 =?us-ascii?Q?DMMPr26+9a+0bgAW6w8KPMvoOGLEZLaCJwFE9YKHigLiBA/0Ovi4JGaUdayu?=
 =?us-ascii?Q?54mmoD0NxHKckNQk3fuHd/uSJNPA61M4YzHHbbbumE/Yh1kX+llIjYbLJExL?=
 =?us-ascii?Q?keLo5BLDGER50gZb5q8HuFFGhIMfD+4v7891CjAzp2WMWcIf7gVmecvBnTXN?=
 =?us-ascii?Q?PKEWv8UQ65LSaQEFmRWoz85lvK/7oMhERf1ZQpR4/PbRiMlQSkQUKo7w9PAE?=
 =?us-ascii?Q?nw8yaK17zxONHLTviKz9s1rldQsoapzbAr/ghxQR/TcLQaqu2rlgFwns94Pe?=
 =?us-ascii?Q?THQMB18yQf3tAdB8q/ArhEsFjmL9VJ+bC14sn7cRHfBPKTmoavXaJLyuY2n/?=
 =?us-ascii?Q?ggwTxq5oL7/4qp4Q3efuqvS04vOa/anyUXH3y+IbL8n+tiBk9vSzFgLRf48S?=
 =?us-ascii?Q?ytT5Yd70llGofzhpnByOV/ZAOzigJe5Ac5NccB3KyaZRjAv0T8aYL9HK1OZi?=
 =?us-ascii?Q?XvtuYeyZ9o03MCXjAgVorqJcM0+r1i9ddVw1lDI6XrKea4qj6Og3lfiTZhq3?=
 =?us-ascii?Q?wtLmYRSXHzfGP4kMznBG5OMxqxJxwqpIXvgQLGMFKOktiTquQiUx7OsfgSZu?=
 =?us-ascii?Q?mHA3C4ONhFvRPiwnEPlvxRSR3SbJV13RvhkYl+gh1ba/u7c1L14AQOogtm8Q?=
 =?us-ascii?Q?Kztf+Fn3URvrfVxDx/e6KCnCGqQd9GLzzrQjgfH0nKdvzn8PlSMnsb1t7V0L?=
 =?us-ascii?Q?pYhX4KVtF9FjnRDTlZ8gFyAOp+QkDQeUCUtZcuxxfA/I6ZInVVCLCFuf4k6t?=
 =?us-ascii?Q?KrD0qVEy+jrbP4PgpGi4u6q4TrGWAiCHkg3sEycB4lPdPWoR4UzU6z5yTDcM?=
 =?us-ascii?Q?MzqrlO3YtS+1BShU5mardwmTLFiVcIzsjtY21RN7NS43jEWxfKovdSK7VzgM?=
 =?us-ascii?Q?7Czi/4ssTRzWV/OWUOhLI4i4YcqCM7Tg9hJy?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 15:40:51.6768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291480b9-f939-4eb3-0257-08dd92fdb50a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9464
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216503

From: Daniel Turull <daniel.turull@ericsson.com>

Use gen_compile_commands.py to extract files used during compilation
for the used kernel configuration.

To enable set SPDX_INCLUDED_COMPILED_SOURCES=3D"1"

The location can be controlled with KERNEL_FILES_DIR

CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes-recipe/kernel.bbclass | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass
index 36ce659762..acef8b86ce 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -159,6 +159,9 @@ set -e
     image_task =3D d.getVar('INITRAMFS_TASK')
     if image_task:
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") =3D=3D "1":
+        bb.build.addtask('do_save_compiled_files', 'do_build', 'do_compile=
 do_compile_kernelmodules', d)
+        d.appendVarFlag('do_create_spdx', 'depends', f'{pn}:do_save_compil=
ed_files')
 }
=20
 # Here we pull in all various kernel image types which we support.
@@ -867,3 +870,19 @@ EXPORT_FUNCTIONS do_deploy
=20
 # Add using Device Tree support
 inherit kernel-devicetree
+
+# in case we don't use spdx bbclass
+SPDX_COMPILED_SOURCES_DIR ?=3D "${LOG_DIR}/spdx-compiled/${PN}"
+SPDX_COMPILED_SOURCES ?=3D "${SPDX_COMPILED_SOURCES_DIR}/compiled_src-${MA=
CHINE}-${BP}.txt"
+
+KERNEL_COMPILED_FILES ?=3D "${SPDX_COMPILED_SOURCES_DIR}/compiled_commands=
-${MACHINE}-${BP}.json"
+
+do_save_compiled_files() {
+    bbdebug 1 "Saving compiled files in ${SPDX_COMPILED_SOURCES}"
+    mkdir -p ${SPDX_COMPILED_SOURCES_DIR}
+    ${S}/scripts/clang-tools/gen_compile_commands.py -o ${KERNEL_COMPILED_=
FILES} -d ${B}
+    # Make paths releative to the kernel source
+    sed -i 's|${B}/||g' ${KERNEL_COMPILED_FILES}
+    sed -i 's|${S}/||g' ${KERNEL_COMPILED_FILES}
+    grep '"file": ' ${KERNEL_COMPILED_FILES} | awk '{print $2}' | tr -d '"=
' > ${SPDX_COMPILED_SOURCES}
+}

