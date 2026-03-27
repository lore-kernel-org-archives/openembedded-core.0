Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2405A10ED66A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:28:39 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71783.1774614518204675865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=Puo3/3dC;
 spf=pass (domain: ericsson.com, ip: 40.107.159.55, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxoLp5/4YsGi/qYcw/ihVAJv2SD52m1KsIvOuAp2PrdOjIQu3SwlouYuGY78dOGzI/zdkOv087dRmBl7aj10/PE9D6sUqyqqkwNrXdg0pzdzrsCeVJHB/FWz/kE3ZOl83E5Xuk6rbliChqN8yiRisNSLIOP1QOwFMqqxhjMT4E0O2nGpQ13CWH7/KyAqjj5r/RO+jgW+KXEX9X5TAj5ln2/Bk7btTskktJylqQ/LnWl4P3l7oQUSPM91f5iCMa7lpf0vdQmlLIFvs+d8pMml38O10hmOVZ5CzS5CrTZGlU6a9VpYzYW+x4aofdpy7/zpIcutz60I3nw39QNCJuRZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WctTh8lKKPwdHFedbN+6iCAAnNyQgRS6OH7eedGhdMs=;
 b=GeprFrlumMAL4OAOEcmVu0OdFDPAohK9V38CqstnQaaGA3Y+jkaAEb8xBUkrVy++GkW/BhkphguGgFn8HkGs/Qpyn8gZvPJ5Nbxm0wiYvvrdXp2auoJABCF5NSoT6iRTxU7WIjpbYny3uGAyZpi3oeiAjtrteOKDMugNAbUbM6xBRgSI1M5O0XIxEyVT7QkPrW9sSV1nXJ4wbmGZsbJri3fmBWCNkz1M5ukAuPdVc7Cy6H4GWC4bcDCHnVd2K14CNUVnEaEW4Z+DShHpF/VdYUyVzM1SRBckLuB++ZPr2b03oP+tkK3pXsetOfYlVgY1SqNp5r9s43DfJbFKDppbAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WctTh8lKKPwdHFedbN+6iCAAnNyQgRS6OH7eedGhdMs=;
 b=Puo3/3dCn41q/tIrsq0qUUFPwSTRuSosrVqDx1uieBE7PhTAI207h22WcPPdKllTvd1dPg6hnmtuZjpBD36/sg2aK29O+O61BAr3VNadWj/D67leXTLN6PPgUbb1wZ/UUQHqatbZWJ2Jpi0JV28gLSAq3Kwd6xPp2hpP2pnVPOlcvKi2PbtAWQf6n8g2iZSAeFIbMy2PjXBCaZeIezlX2e+km3uV/8c4LtSIBuxqxhmTjasKoYnp98vpzdX84/Aw5JmGtW/5goQXL9ZqzQ6yTUCYLdAsVoU2YxHkm68TMteHHodftK3iGc+juc49haZ+4RMBfb6zOA53N3Kf6T5CNA==
Received: from DU2PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:10:3b::19)
 by DU0PR07MB8572.eurprd07.prod.outlook.com (2603:10a6:10:316::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 12:28:31 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::d6) by DU2PR04CA0014.outlook.office365.com
 (2603:10a6:10:3b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 12:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 12:28:31 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 13:28:30 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 76F6940217DE;
	Fri, 27 Mar 2026 13:28:16 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 5AB3C700CF09; Fri, 27 Mar 2026 13:28:16 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <alex.kanavin@gmail.com>,
	<pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 6/6] oeqa: ltp - add LTP_WORKERS to allow parallelization
Date: Fri, 27 Mar 2026 13:27:58 +0100
Message-ID: <20260327122758.1851989-6-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327122758.1851989-1-daniel.turull@ericsson.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|DU0PR07MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: 18659860-1696-4059-a8db-08de8bfc5b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	V5dCrEn2oUsvDVQCsY1vdz69CfXX7d/GefK2T+ZchhilJdQeHHVBih3kIidKNPWt7pO9R28JJvG2UfjkmU7JNrUSeYgjeLFbzPJRD/XTdYVDR0V/GWb1P2mptl+JqzNgKLCHPVRjsPt3ERGzq05Kdem3f86xjUUDVpnQqkUshGl2dcSXer1+UHUhWkleG0Z6LQgvmwlH2uUlgL2mtvpmfNJMUrnOpVWWwB+kvL1GP1mbtANCWdVirVT88671GPVeIUy52uE2giMZ1EywbuvGti+U/i+1r9NCT2wgAOi6ODXCanlEMg5K8lYyH7iVbdiCz8zaDKLXcHu0J4KiaXzUIzJZqViaQsu5Fe8ToX5bEYUFBJHmZXm69RrfuALOflhXv7jjn/ULYuG29MjOAenEbV7gSB/HFs+9qhtJFzZPLt/Yx2EDV3aVuv+nY7mFwa44t4bH2KAZsH1mCANqvdjUU7rozDAVc92uxb1GLovcnJd/xjHbQlyLQsyumz2dkBZWJPIFVch2/3TXuOSluSUiK8Okzt64A9M7Xt8yx8YhRE5ZDEnHqVb/SZyrCZ7nXSPTBDI0CkMc5dafK8DPu885KsaaFSm4V7gZmrqZ1BVaL7YePTyOhGGDOrPX0jo2qtY0seBDyRSVSejdHTgj89xAbklfeDrbz13IxE/6eLPnbwyvt6HveMyOvxdW9vmKadNG4ILZlOHNx5XK3PdnaJuW7m8iooOfPztRukYgfMSkjuggQrbSSqoI3AC7EtYovmXNdG9B+5CE73E9MyXxCs4lGg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wYZ7A54ZpClYttdlJJyr0LWwwggKZXB/AzVCgSvZgGOKG52XQZI2ogVvdmxE5tjVHQuE/RuoT9EUcpMU7k1o65I1v5/SzV3lufvn2VKzoMK99hJu5TYrcfYjKOy9CquuLzW/pySwRDoVWFf3W+dZWNrvRNqaoYQrCS1gvnhW1au6m8mlRUZ7prNNFn7XGO4uoHanI3FXb/NeL9prD+MToaQ14PJebTHWG+fkBH+kWau07nWTQBMlvIciRfCSs21g3I3ktNBs5ZmDIxnX+Q7afR5MBA8SUEu6Epq00ugfX8e8Cwi03Pms70p6S+x33eXLRy+0ebSnCwuuhLAUenbFie46IFmKG+rmttvzAjU+1KdBcNK5iYU6yjNiJu9q76miUfpvKrp0HFqenRMA6ac88D4gzFdaotbA6A1vlxpyPrdYlCrR2jHfSMG44AJ1fZrq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:28:31.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18659860-1696-4059-a8db-08de8bfc5b52
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8572
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234085

From: Daniel Turull <daniel.turull@ericsson.com>

Add new configurable variable to execute multiple workers in parallel.
kirk adds the option that was not available in runltp.

Tested in qemux86-64 with configuration:

IMAGE_CLASSES +=3D "testimage"
CORE_IMAGE_EXTRA_INSTALL +=3D "ltp openssh"
TEST_SUITES =3D "ping ssh ltp"
QB_MEM =3D "32768"
QB_CPU_KVM =3D "-cpu host -smp 16"
QB_SMP =3D "-smp 16"
LTP_WORKERS =3D "16"
IMAGE_ROOTFS_EXTRA_SPACE =3D "2097152"

bitbake core-image-minimal
bitbake core-image-minimal -c testimage

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cas=
es/ltp.py
index b855e76907..ae6a275110 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -68,7 +68,9 @@ class LtpTest(LtpTestBase):
             # LTP appends to log files, so ensure we start with a clean lo=
g
             self.target.deleteFiles("/opt/ltp/results/", "%s.json" % ltp_g=
roup)
=20
-            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s=
.json -n -d /opt/ltp --exec-timeout 20m' % (ltp_group, ltp_group)
+            # LTP_WORKERS: number of parallel test workers (default: 1)
+            workers =3D self.td.get('LTP_WORKERS', '1')
+            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s=
.json -n -d /opt/ltp --exec-timeout 20m --workers %s' % (ltp_group, ltp_gro=
up, workers)
=20
             starttime =3D time.time()
             (status, output) =3D self.target.run(cmd, timeout=3D1200)

