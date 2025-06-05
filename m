Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE92C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 21:31:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.web11.19784.1749159095397323795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 14:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=CLG06A0h;
 spf=pass (domain: axis.com, ip: 52.101.70.24, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlULPX3/hZym/XEg8mk20Q+CgOdGrWEHeD4+IQdmp3szGRpN7A92uxRXOcjXf99vCa5bXjHkx+bRzxJMI4JXJQI+YOEjLHHtu1hJ8Kgv0tKdJMVO2k+8QM24f+k6nJfWHF4NxBX5zYzHT/jArRCpnS051Y0v24GWNWJ5vuFAxX+6K2xcm4L/KrxCMsjR90BGInH2d7FaBzfZaHJHyAX9+kQs2j6XZuhJkyjuEzyyytiFWrD2z5Lb4aiTbyqH6lQJRrKiSr6yceB6fepD8CMZRTso3dpPQUjHKps/KraVwm4+GkwjEbxpJogir3ttpNW/o+wIzMe9snpro0m9LVYDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOy66TwJcj/wzD0+tlrZjMMlUi9YPdUOcgt6CHBL3wo=;
 b=vXE5B6Jc72IGTmNIsOuNZSfJOFaZphLCBit/f6FdPeJyQLq0S45gLgyRV7+z/KlrpFeu2N8OssCUxzDEX50bj7Ag1BvzfFelz5ga+4899HNfa83txHXmQ/oEh6pgrBJ+f3IoFOgD88BGDtLEcZVYr6np5aVuCgV9Sr6p0FXNOzT9zLnzK1NUsXv5nTRKAAi2QuLVGFDUJ9JSq3zhMGUnEPcqB8oI/ur5EvwKIgfruFnsGxz9Q0jCWjwo4S8jjSnImDPYbagQPmdE6vO+U0rAnd9PwZQ0xVknkDaLl3n1trtSRZkQ6mgMFipKL05IZm/5tCOinh76dCHMHf9BCfs5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOy66TwJcj/wzD0+tlrZjMMlUi9YPdUOcgt6CHBL3wo=;
 b=CLG06A0hsc35QOYgvIXoKiN/m2dN2MWXVStXNSA0PYYx7GRm/iCwKpHZDUK79zz+QvjV+/Fk7j0rPCkoHKzpPQwrjAz+VnGBnytz2uGS3FA3IkhZXNtom49r1ffyYCMac3N54XxvYNmWK/V2Yry+R8GIEJxyNsVCNc0brB92ypA=
Received: from AM0PR02CA0100.eurprd02.prod.outlook.com (2603:10a6:208:154::41)
 by PAVPR02MB9136.eurprd02.prod.outlook.com (2603:10a6:102:320::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 21:31:29 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:208:154:cafe::35) by AM0PR02CA0100.outlook.office365.com
 (2603:10a6:208:154::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Thu,
 5 Jun 2025 21:31:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 21:31:29 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 23:31:26 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 23:31:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 5 Jun 2025 23:31:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 22E341390
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 23:31:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 1AE911201CD; Thu,  5 Jun 2025 23:31:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 3/3] util-linux: Improve the package licenses
Date: Thu, 5 Jun 2025 23:31:21 +0200
Message-ID: <20250605213121.2685855-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605213121.2685855-1-pkj@axis.com>
References: <20250605213121.2685855-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|PAVPR02MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d392a50-55e3-4a7e-2fb6-08dda4785583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nsX7UGVSehcI4LfiHWUCu9W5WGvTgzJsnjanIo+oo6cfUgJIszZz21fdLbHJ?=
 =?us-ascii?Q?DUyAoILs+Zc/q7Og8pLA9EmB6SnHxx4G/uFH+PygNf8MfgwBXPuNzJnTFPRe?=
 =?us-ascii?Q?IApN8qL2Xv52RH70LmpNs/iNs/EYMMHOtJl8nkTPabuc/msCbXHZlhPrZuxi?=
 =?us-ascii?Q?VOftN6PedOYv53HBnWn9ut2TGChqFKgA8H4f3fMJCBHL3mnHci8hMNhOIWjo?=
 =?us-ascii?Q?PW5cCzH9/W+YoULnovBXY0CzTkRdQJh+MkpUNr5y2Ew8E9hDNka/Uvf8raPi?=
 =?us-ascii?Q?gINsxWBnGD7Hc99P6dLCEt6WbsFE2liUwcyQ8B18uUJSV6lt/VdXPMdVMIdj?=
 =?us-ascii?Q?i013awgZtXUcfTjabkWo6f577KzWztBfbNh+/nyHNXiUmIVCucIRWGdMhxJx?=
 =?us-ascii?Q?sFBh2TRAAQrLqzk1w/INfMdWd/nX2TnJBm+6Y70XEjOKytRjwSl069+lnJ2k?=
 =?us-ascii?Q?sL1Osx+NqnK/NjL4Gfvn+XOVqY5goivQC6KEmVRUl92CkozhCo5cowRzQDqi?=
 =?us-ascii?Q?1/3zP/Be5MVnA9DCRtxx4VG9DMeLteN2rsQCDMTpXCXqxTrySCaqZLwBN/OE?=
 =?us-ascii?Q?rTIaMaNI25Fb/55AlpmeYiDA3D7YlXMARMOUlQVaKT8dj389DKM8jNx65rio?=
 =?us-ascii?Q?Tab4PWLoTDGd+YIpYYvoz8x/dDQfCao+jV73mRUQO7AuZ2Rg4YAzaEom0yC2?=
 =?us-ascii?Q?bnjKtV2aJ69FcWYhUa3deCcUYIhIj3A4X9dnvTlePhPnJ2wdYtNy1TMtlS+d?=
 =?us-ascii?Q?85Y1/dTZ/k6ZeCeqjhgu8FLJRhek8KP3SUzcNm5NybMypKD3akrs+JlX6vi8?=
 =?us-ascii?Q?bLvId7B4GM042o6TMA3GBkSMfZmLlvjSxX1LtpXpuv+XOXsovlroG65s+5ul?=
 =?us-ascii?Q?OLii3NmlRe/A3EK3PwcV9ieHC0zAc4SF/reVsCW8AiNWYqzkyH7hxIXFfBem?=
 =?us-ascii?Q?6Vmk73GiMSqKt8skRET2DaCZfQNeUhO4dgE6c4DbPE/qdhsJml5fnOp+r84/?=
 =?us-ascii?Q?DnbgDKgFx6alyJzoBiPWGkVElFVShS6eHOoPdi8SNZ6uvEP2b54s4qazhVci?=
 =?us-ascii?Q?8mVb27aBpV/O0w++aaQ2piImap8RUmMgnWHPZK8D6PrAwZPR/po3v2G/4kjM?=
 =?us-ascii?Q?kQmGM3S9VqnHKKGmEq3ueemKvnTh0X2dIvma8PMYrPEoqeho9bXbm2VBhpGB?=
 =?us-ascii?Q?ayJqBZKZLyxMha9jO325wdaKJ7x1Xm6Cr/U5/dVbefIxT/pD5+yN4UeK/YhY?=
 =?us-ascii?Q?oVOuDYYT807Cazzlu3z/rDNZMZynX3snV496gqcoBHZe4KsiXeUz1fSiFmUU?=
 =?us-ascii?Q?hgQGFF5zgdh8uKwdG6O7d0LPCBWHCgep3egMFT5/5vsZXVpUnYTSb0y+M7is?=
 =?us-ascii?Q?DmnZ9Y82M9NYPQXBjX3ixeQNm2F4e13BaS5IgNN6v8FfNHz4asPGd9rqQZuK?=
 =?us-ascii?Q?WelzNP0BtG6+ITHmFl2S8R0JJW6pTYQlnPp6Kq//Fd33Ys36fwR8lplA4fYY?=
 =?us-ascii?Q?51B4UM+LbQ38BnQ+NGpTzmTUwySDOt3+EnBv?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 21:31:29.3789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d392a50-55e3-4a7e-2fb6-08dda4785583
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 21:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218087

The default license for util-linux is GPL-2.0-or-later.

Most of the applications and the libraries are also linked with
libcommon.la, which uses these licenses:
LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & MIT

Set the above licenses for all dynamic packages, unless explicitly
specified.

In particular, this avoids setting BSD-4-Clause-UC and EUPL-1.2 on
packages where they do not belong.

License-Update: See above
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Add more specific licenses for util-linux-bash-completion and
         util-linux-dev.
PATCHv3: The changes are now in the util-linux recipe instead of the
         util-linux.inc file.

 .../util-linux/util-linux_2.41.bb             | 46 ++++++++++++++++---
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes=
-core/util-linux/util-linux_2.41.bb
index 18b8ac03b94..41fb3e59513 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -1,13 +1,44 @@
 require util-linux.inc
=20
+# Most of the applications and the libraries are linked with libcommon.la,
+# which uses these licenses
+LIBCOMMON_LICENSES =3D "LGPL-2.1-or-later & BSD-2-Clause & BSD-3-Clause & =
MIT"
+
+# The default license is GPL-2.0-or-later
+DEFAULT_LICENSES =3D "GPL-2.0-or-later & ${LIBCOMMON_LICENSES}"
+
 LICENSE =3D "GPL-1.0-or-later & GPL-2.0-only & GPL-2.0-or-later & LGPL-2.1=
-or-later & BSD-2-Clause & BSD-3-Clause & BSD-4-Clause-UC & MIT & EUPL-1.2"
+LICENSE:${PN}-bash-completion =3D "GPL-2.0-or-later"
+LICENSE:${PN}-dev =3D "${LIBCOMMON_LICENSES}"
+# All dynamic packages use ${DEFAULT_LICENSES} with the following exceptio=
ns
+LICENSE:${PN}-cal =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-col =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-colcrt =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-colrm =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-column =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-coresched =3D "EUPL-1.2 & ${LIBCOMMON_LICENSES}"
 LICENSE:${PN}-fcntl-lock =3D "MIT"
-LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later"
-LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
-LICENSE:${PN}-coresched =3D "EUPL-1.2"
+LICENSE:${PN}-fdisk =3D "GPL-1.0-or-later & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-fsfreeze =3D "GPL-1.0-or-later"
+LICENSE:${PN}-hexdump =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-kill =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libblkid =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libfdisk =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libmount =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-libsmartcols =3D "${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-logger =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-look =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-lscpu =3D "GPL-2.0-only & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-mesg =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-nsenter =3D "GPL-2.0-only & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-renice =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-rev =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-script =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-ul =3D "BSD-4-Clause-UC"
+LICENSE:${PN}-vipw =3D "BSD-4-Clause-UC & ${DEFAULT_LICENSES}"
+LICENSE:${PN}-wall =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-whereis =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
+LICENSE:${PN}-write =3D "BSD-4-Clause-UC & ${LIBCOMMON_LICENSES}"
=20
 LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D55e895a80bdd4ffc65e167=
a76d2e7569 \
                     file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
@@ -33,6 +64,9 @@ python util_linux_binpackages () {
         pn =3D d.getVar('PN')
         d.appendVar('RRECOMMENDS:%s' % pn, ' %s' % pkg)
=20
+        if not d.getVar('LICENSE:' + pkg):
+            d.setVar('LICENSE:' + pkg, '${DEFAULT_LICENSES}')
+
         if d.getVar('ALTERNATIVE:' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):

