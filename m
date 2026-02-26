Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D77FFD9E13
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 21:08:34 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80898.1772140105580018441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 13:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=igCGTiRv;
 spf=pass (domain: axis.com, ip: 52.101.72.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI3DvtjmeyPCMN/p/qfHh3inzq8ZBPq6E4ImbOPXbTRzMeke5s0SIGc8MAevcXLETZGqW6y85bVby5ZZAGqQkVF/pCqmk1FgjXNsHKfI8F1u0z9eUFiG1enQUH9OIh+MyWRycBdlJJB6/JP52tHdAc7yRBCPpnZfs1widZQ95gUocHZCGcfmw9rOpiC446+BgW1XAn0AelHQHNj3JKz3WHKGTxUVdEI8GRp2GMJQYVFZlpjUjDPvSyxdc1dhcpAnVqZCX7fgO5mjgr9mdXGK7VO86V1DfsMpb0+qbmWipvVvUztsR5L7/xIxgv1dm0eo+wrfLXaQkH3pMtfaKkSYbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mC+sh/jA2WIiSMPVMThNflJLu4ypbL56oUTetRauAXk=;
 b=kWJZYc/6XGkk2KucAD4Dg2SBYTdYN7GNVP8jzIDFMH/uypCYh+QuUFnc4T4cYCoQ4BEqvhw8fNDdnllB446E9gHm08YdOYQpLp/02DBeWwdY2bI9Z5Mep9Q0nVXiRTTNzepEGJYZKA8Qdw+ZQpo0mhVQjHkXfh0c4GoFMRdyb04EL37owZbLvrEnv/Cmq6k2oX9iwb7um3YwObe0f9GkeS/f98JOZ8HPdsjsA2KCjgpweOkn35AJMhuPVFWTENVQwTnGJhKD17Mf7kcDS18C1QUDmup8oHGPHaA9Fr/FCmM80542KrNMUC8hg6Zhqa0FE2DD4yD+1OHtY3Oa2PEZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC+sh/jA2WIiSMPVMThNflJLu4ypbL56oUTetRauAXk=;
 b=igCGTiRv12iSCS9+bkzpFPTBVFBoue8YtHerIU8s6OnRgF+HdWNrN7RGwhX1jTNkldK0kSxCnMy8zo7XLeLmgGpmi+FGWfbf6D7phzAOhjTtLBDudYqMvSHnCPKBDA884eDQnvbZ9SXMIS6ZCPk5GpF2cVm+hsamPyxsWzWUf8g=
Received: from DB9PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:1db::20)
 by AM7PR02MB6353.eurprd02.prod.outlook.com (2603:10a6:20b:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 21:08:21 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::53) by DB9PR06CA0015.outlook.office365.com
 (2603:10a6:10:1db::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 21:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 21:08:21 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 26 Feb
 2026 22:08:21 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 26 Feb
 2026 22:08:20 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 26 Feb 2026 22:08:20 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E020776E;
	Thu, 26 Feb 2026 22:08:20 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id DA54212035B; Thu, 26 Feb 2026 22:08:20 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Subject: [PATCH] openssl: Package /etc/ssl/openssl.conf.d in openssl-conf
Date: Thu, 26 Feb 2026 22:08:08 +0100
Message-ID: <20260226210808.3393803-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AM7PR02MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed185d3-db88-4868-f91b-08de757b2c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	EXJpQ7OFiPcahCm6vp16Rgwsj8jo5LwVZBu3O/n7Pc5IduBJ189kLGLBoNImLl8YnrrHzQU+VLjvBiw1IJUtU2RICWx3xsSWXSEbbNGuX5UtnHy9nYVDX+Gw8B/5XaId/foxMNlYZug02dfy3PueMEg3JHGUPqGvyMPWl+zokzwYlKxhezkfw/nj+XUIE/ocJk7xbcBOsfEpBXqc3tKAPfI4hfgaDxUa+4/+yDH0jK++YMb1JgczCIoNt7CAL5wLVzi8obh3J1V+NLBlsT3lO+FaoTa12RyL0tMRcYNSqWIZAryAd7g+ZeaNuonhMELEu3gDuqN8Cnf+DXXsu7WjOuW+ESnIEeSigxKecXwl/R/BDMX3aqavhf0sUj1iHBSaSu1goL7vj5kAazmf3pxDmrqkOubM3vu2/wiBb73ltbd8Do2yowi6l+fAUgAQ4iyKoe1DT7Eh5TcnhHHYTJcGGWjSvyiNqO8uJIgrg7k5VgiIGDWxOcKQbnDh753e6hut+dTrbcBuq4XzOu+lXRLAdr2BbVh9hIi9GwMDuz7ZhNd2BY+J1GcLs55YCsCgYAobBeeGDVV7J36J5mzdvy3unmP2ISt0tfipfX9uwdcI7/0hZeWo5JTBMKnLxYNgNvlbe0P/9fc8rxnKIBgoiwaBbhsz7hWIrLIouArdQqtH5McF95JNtnz/Fks5uuv5p58xhAytA8S8XH5IpkvSI3fiQ4voMuPsvAP8FapAuQmbrMrDV+Dh3ptpoW8Cg5t4nHa/s6IwQ8a+0a4C1i/+X/FbZWetQWJHuU9q18zu6CM43BknwAP2/g8IkK0otfCFLd4ODHyb9eWl1mfobMK8xcgVlg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6o+tZP+FZBsw40zCC/DdYeQdTGl+Bh6dd+4j3vpZ7fCwsenDBYDdDhHcNr430ovmteddUE8EpvKfLtRS7uy9LyCwWUX8eYT/nL73N5ej4Nak8+9AWUiyq7nb9LmYyx0ZGCwBP4NMgP5ruIHUrOOPFAOimCzL0IMwZwFZ7tQVKvp13QQGsoj+wDcoTRFOlqvnp7NWnCims1e8utzE5B06TY0Ujm6Ehjg6YDZBYj+z1sS6kN5tKVdFo278q/R/WXmUhKhATMun3SF3CKVpL3gqOOTp8+Zq7691+rNdpfALken6wLEWGFVmE+zt+M4uLS4CasGDhiszFbjt1seQtObSRjCauktLVCTQ55U5djxZ3dICyWeyKXv67YGcopnZpP7wQTSQUGEuM5hcjaZLUMSqb0OesnnyIsujaEMbsRVbKgbtJ35JRdy3d/WFeOeud4L0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:08:21.4990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed185d3-db88-4868-f91b-08de757b2c28
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 21:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232063

Since the /etc/ssl/openssl.conf file is packaged in openssl-conf, it
makes sense to also add the new /etc/ssl/openssl.conf.d directory to the
same package.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/reci=
pes-connectivity/openssl/openssl_3.5.5.bb
index a713d4bbcd..7799647415 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -269,7 +269,7 @@ PACKAGES =3D+ "libcrypto libssl openssl-conf ${PN}-engi=
nes ${PN}-misc ${PN}-ossl-m
=20
 FILES:libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
 FILES:libssl =3D "${libdir}/libssl${SOLIBS}"
-FILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf \
+FILES:openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf* \
                       ${libdir}/ssl-3/openssl.cnf* \
                       "
 FILES:${PN}-engines =3D "${libdir}/engines-3"

