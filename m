Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DE7C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:42:25 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33443.1782722539513235993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 01:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=LKemoEac;
 spf=pass (domain: ericsson.com, ip: 40.107.162.9, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOCZDnrYf8kCVTkiwobp2PhulYxT0iK9JUp4QUVDPMXmi/7SSbrUblDOZOD9uKCIft+E7eyvaG/j8aeU5mbDdDUl8goWWcVPuzdPpl4lsuZZhM2r7VHqgR6zLm2dc5LXDr8T08J9ULDIl6FgrvKkvt4OxTQwHRaRET6V91axBJ+d0xIe9i6FLG0VMJ0VHWeCilkJZPzojWuiWHuiKyi6pZUVBAzKfww6g+1qZjJ48jLmC48Zh3HJ2/KlvG4sx5UkSJbuufq7vCKt5xiFRtlTi1oFYoneZzd5eUwFAWA0wuxjcoviEvJ/vf2k5bsMvzvNTTmK8v0HuKiGpL7bs6t8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkkLb9jT/2b0THLsNjbGBaHJhLDYCqzx/pZKkpeETy0=;
 b=sGah3dB1wW6N2fyt14jguW2IZaBA5ajMxE5MgylrBBbEGV5yOEI4YEnoe9t1DGjhbvJTEyMCfbPIK6KoUbniCoy2ryRu/7iGd7Szag7C332lhvnKtn9LDxzM2/h2moXm8E6l5Ui2V3mc5J0pB2ypVqZ9RCY4CaYQkp8KoNtnbSAt9Odvi7NpbxAnGkz/38B0ZzTg86g31gpk8PhejsiDnocEp065/WkML46D6/tgIKJS2Y+EZo20n+LAIKRb0tp5FmjvxUJeHBdXfwj2HfkUTf5JRvdTeN9RFWd5Ec3GcTmNzMeyHW6NGrXNd974NtB+S0C2fLs0vh2Vse3A7usFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkkLb9jT/2b0THLsNjbGBaHJhLDYCqzx/pZKkpeETy0=;
 b=LKemoEac7BtT2GL5mYCMjw23szAbebwrbz0c+mtgf8aGUaBIWf0vGW/Ja0IKavoSgktfdkZpNJf8JZyo8YCt/Ag6Nes+M89R4hyIChvyinTJG6/AQ42GNY7VeywMOFykBzuSHspRr6sxZyafQ8XhfDJKZF6b/ESLJS7NgoCKamAjhE05qVfXe7unF2QEzj8/3L274hP4NiFDACtTDn81J28AP320rmNBQd6BbOKXYV6bkQ07fJ9m13ulElCaEkaNxEGjnNg6UJoh5R0JsvIUaBqLFvzt2koqrWWODBFzYeBfe1OBtVFdZceiat7HbiAQX1XZ6I/4jmF3CDt2mINzYw==
Received: from AS4P189CA0025.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::15)
 by GVUPR07MB12041.eurprd07.prod.outlook.com (2603:10a6:150:363::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 08:42:14 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::61) by AS4P189CA0025.outlook.office365.com
 (2603:10a6:20b:5db::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 08:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 08:42:14 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 29 Jun 2026 10:42:14 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id BFC454020B46;
	Mon, 29 Jun 2026 10:42:13 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 91E1A700DBB0; Mon, 29 Jun 2026 10:42:13 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH] systemd-systemctl-native: disable libpam meson option
Date: Mon, 29 Jun 2026 10:41:57 +0200
Message-ID: <20260629084157.299017-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B0:EE_|GVUPR07MB12041:EE_
X-MS-Office365-Filtering-Correlation-Id: dc138d13-d267-46b6-e571-08ded5ba51d0
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	jeKt3BFdFx+5zvUSCiF9f6tKEZcpr/5KY/IDaAC7Ik9P5nosRCf5+5fTFarpl26fNYdZSq6n1rer84lFlpsVMpYFeZyc57eXOwZb6gt3sdJB7i2r3v3/1NlUWV3l1vkhZ9TFN6Rdf152u6qwXGII24zBVj/gOExlHGgD1ldtH3NF/HymVLnSH05e5j9CeGpTSA6666MeilukfpL1IXxAee+Ki2Chq54VFag92qbzV6vO/6UhqVdXrN1C8KdqTKNNESFZFJ2qRLR0hBRI3JzjiQJVpDe9oe5T0K4vEM4xyXBO2uMmZ4bJXNeK/1ulvvWPWDvarRZEwEagIujjk1NW9IE6E8lFqarVMu/Q7Lj/2PlTApEWsJGg/xwYF104De5IIkN8og3dtGuBx2tBj9drwKA8teeiOruiJhH02GJ6KQPkiLYmp1ZTXI/Rvbr6J82K5dKxtNJwsROADoIIo1uP6hkpaJzh4z4Ce4UuV99SMssKlGV28tuV3py/a3AovAq4bK8hlqvIfBUk8OXrW4Uyq5L6m1mgnqoo7QG8yK+KlNWm5En/DePuThYJnXppsgknkBBQWEbFHhKe0O9WCPSAvgMf75G9Lk2axDkj7uo1pedYFM+f7LUCl3Kduko+fkRpLzZaDzdfEHVwRLoEm4cAVWUd+aOLx7IoV286uI5Rz8K+w2uEFzFOutu7miUsbb4xDE+HvgXgfkCIQ62t+Z9yKg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z+5VeH5JuVJfDiF7JvN5K5Wa5AxEWwDavzmyfmrIesjqKrXu4f05t2M1yDDhxPfH5uFLz+ydZ3zj+55amjMf12iyvQPs/GzhIo0+QaZqV90kuU+Ef3csWOOr+0pneNCpGcx9KSw0RD8oYtVGCmmnxGgkPohq2SJo+tuPKyMcTLLZVWJ+ntr5r7A8sxb9uZ/ozSAUcae0oLX1mMWl26iTxHtibXu6d7nwv5rC/tEm+On7YWHHeoxfb3IygMbGLfsUCkG03MpuiY541s/oo0MHHXu+hebtKh04Vma0sCSg0PjE+NlrvFBVAbdEKArZIChhi6+m+mHgQS3ERGGt8Hyiwl3FBuAReA70PAF6iGs60EfiGX6/wJ+MssK6ZFSqd5MDHw6FKuXh+pJS3YtvbcWnzuftcMyLPl02Jeegztt9QCC+8cUNXvNs9n/ACyMxGaQP
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:42:14.5828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc138d13-d267-46b6-e571-08ded5ba51d0
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR07MB12041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 08:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239737

From: Daniel Turull <daniel.turull@ericsson.com>

When building on rhel8.10 we got the following crash during do_compile

systemctl-259.5/src/shared/pam-util.c
| ../sources/systemd-systemctl-259.5/src/shared/pam-util.c:3:10: fatal erro=
r: security/pam_ext.h: No such file or directory
|     3 | #include <security/pam_ext.h>
|       |          ^~~~~~~~~~~~~~~~~~~~
| compilation terminated.
| ninja: build stopped: subcommand failed.
| INFO: autodetecting backend as ninja

libpam is not needed for systemctl task done by bitbake, therfore
disable MESON option.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/=
meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
index 3d01d60e9c..3c0dcd35a3 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
@@ -12,6 +12,7 @@ MESON_TARGET =3D "systemctl:executable"
 MESON_INSTALL_TAGS =3D "systemctl"
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
 EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
+EXTRA_OEMESON +=3D "-Dpam=3Ddisabled"
=20
 # Systemctl is supposed to operate on target, but the target sysroot is no=
t
 # determined at run-time, but rather set during configure

