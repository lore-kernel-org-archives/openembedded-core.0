Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEBBC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:23:37 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.55])
 by mx.groups.io with SMTP id smtpd.web11.7958.1748946213422093241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=O0Q+QGjT;
 spf=pass (domain: axis.com, ip: 52.101.71.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPpOJPNhx88wQX7lMWksNgQmoJgtoQBbv+mtHtRBwtDhAhXpIS4+JMXfvX4r90Uwg+EptfH5l0uY6HM7Cz+SjmqdaCWNm8QJm038ZvQbMbz1jLIDrOb5atKCXE4EozkMOWDjWKN0biOjutJ+sX5YsqqNZgE3CfHyChwzEl0OuEjgPBuaFlAGMsZYzxpp5rUSWjs+iDrtrSyUgBw+uQeboOHFhA156wMF22v41bJBY4hhaPgPgy6MZpXvKakMpy457jglHCX+Hy5fkJiMxiRhqkxS0fwwN/qR/1euTMaainMMHpak2+ZgYa7yJQlBCsLgrB4phs+gZ3p81AHDSJHIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj0zfo/2L6Jue2ExSmX2lzF2smLnw3x0w3bdVEbPSAA=;
 b=lXE9mbAD7K+bnaHi9YZRGVzZx/8qT7S15QmeitPMSfMytkNaR8e0+2bPyCXwYh5ZFdtzK1xJLce8wIc7sR3EuBmCmEeeplTRRMf4sJa70uhkdD4sLXVI4UbulwKAbYXF/bWansv6flymbVLXM9WhuTiaX639fX8cpj1/QxYplyB0TmSLXy+0a9lSit1j+AaUNmMEb38KJG81fFgOxjJUORnn9flMP0ruK7giKP4yNUW/TWNMh2Wr+qsvPC3C7WZilvyZCxH9OHD/RDbQ2pN90XHpp56CKd4DsAGXifm/W9qWnwfIO8jVq0iAfBjei+0N+y15/4K5MJX/FGWoULN8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj0zfo/2L6Jue2ExSmX2lzF2smLnw3x0w3bdVEbPSAA=;
 b=O0Q+QGjTvaQ7878aJdSKu2OMiZsEZ/nsv9yT49xzw5y5DrWUVDzLNf11D12tVqhbVIEKKj1Br311Luy8z60RGMiog1sxo7fFHVmjV8buhDiheo5elk5cMcbWk17Ng2edblD8mo+cYQwf/mvfURrdM1yDCHLgqsWu60t+XLUoCpE=
Received: from AS4PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::8)
 by AM9PR02MB7121.eurprd02.prod.outlook.com (2603:10a6:20b:26d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Tue, 3 Jun
 2025 10:23:27 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::10) by AS4PR10CA0016.outlook.office365.com
 (2603:10a6:20b:5d8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Tue,
 3 Jun 2025 10:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 10:23:26 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 3 Jun
 2025 12:23:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 3 Jun 2025 12:23:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 81306728
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Jun 2025 12:23:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7C05E129240; Tue,  3 Jun 2025 12:23:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] util-linux: Improve the package licenses
Date: Tue, 3 Jun 2025 12:23:20 +0200
Message-ID: <20250603102320.2344115-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000198:EE_|AM9PR02MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e45022e-65c3-4f5c-06ba-08dda288adad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nxQra0yr4WoRLPlQ4k50qHB9fDr8ohMFg4Oz1681zbXSMnVPKg6bGze1yu2J?=
 =?us-ascii?Q?FzS6egeFVi9z8yy10wMr13fHd8lPi2yyPFVudYE7bcwDxilcDJLPoeNi/DOI?=
 =?us-ascii?Q?hEjeGiUHeFx3N8sMTHqZBOg5r2Yi0GkGsUhr4yAOyMXPMJuOywZHXnyfvuGh?=
 =?us-ascii?Q?hbmlyKr1xoK/VTjttWWXgB96UN8AOl9tZ1qibUCI6O5QkW2vRqUEMicLbXn8?=
 =?us-ascii?Q?MujdFScOFQrNjtiU4rXEsGVip8NhVETEXurLSHkcM5Zu41is+fbhq/4rzYAv?=
 =?us-ascii?Q?jGuK+xY56itveHaCb9207saTIgJQRIlA+alIx4vOLWoj7HwxssTueAXBN/EV?=
 =?us-ascii?Q?4zEmUFyDAEmnPGYSsmm+cTgEPhohR7iNDyoqH454G2QBiIgi2f4UVIBhzTsQ?=
 =?us-ascii?Q?xgjPA12e60wGZoh86p3RxVDHx8B2qeSFtrPYn4drrdTGBiM2Snf+M3VXntHI?=
 =?us-ascii?Q?6HNPtwxIbu3D/A3v9DskI60evhMvKybDw7+nDHrLTCqIp7xGcqxoyF1Aws7L?=
 =?us-ascii?Q?63D23WI/c2uTlZKpsALYabyrebLcZuP2/DEDFjfbpYmO/i51B95sgMquwDHL?=
 =?us-ascii?Q?s6bAACa6kMh+PZlHfIQimbbf8RHevOPi81vB1+mHMC7AJN8OCgSyRyjRnia2?=
 =?us-ascii?Q?kS8XsPmsyhIwMMxf8F9MIgG4r/qLwv11vB965UShSfUf2NVDUifn8ZZtqYBJ?=
 =?us-ascii?Q?bexuVltk+kcBLt7aL3OsrVzMF27rzG+3lRoUketVV1YWd9/j49oAaMo+0OyN?=
 =?us-ascii?Q?5v4S6aq14+UIOKcIoHylUpSG1+XqEdigmFTCMJYV5+wpcMgKyHnoHw0hWQ0i?=
 =?us-ascii?Q?SxGodJRVtEcQbimLlQT38QppXzbJsRk6AQg6EU6zY/5MgknnRHbiKRw6O6nQ?=
 =?us-ascii?Q?JJP0iFIurY+u/8uhAX5xNw625UWKnI57Huq76UXdACRzPhQtD9Y05xMzzn4p?=
 =?us-ascii?Q?8Ov2IdNqHt5o8EpgBSRWZcpUH30iPp+83H/F9h+kgWpJUrP4iuxksLP+S764?=
 =?us-ascii?Q?xQCir5kSrICPvLynr1XbZqFVJ7zNPkoTs2JA0ozUEKhGphTy6v4D++Co2L8X?=
 =?us-ascii?Q?lEIQZqrYVVzmzqbu7z/c/0UuYFTAtXCQ7iqnzisjWXg68kij8xJdweG7agdu?=
 =?us-ascii?Q?taSn8BBQ4HgnSErx4584qfCEj18bZj4/RzN0vNXY7M8Uk4TA3C/d1HM5XuOA?=
 =?us-ascii?Q?WtjBrf/FJdgJQuEeOB5W0TRXGoecAEKVs/bCkA15laZYT9yuQV4FDRW1TKZ2?=
 =?us-ascii?Q?TxdKid8LBEsWmlFCzY6+u1GRzE5AV7HuF3l4z9MMMRHSsFD6g1mO/yOwaevX?=
 =?us-ascii?Q?aJbOQQKLW0pSCxQCEnJKDYVaJ46T5RDOTiwKDhrlRoMZM6rY2kbeV23bG5at?=
 =?us-ascii?Q?0iPWrjAP/bVWDo7ZbhgApFxA/MbStpm1bMc2WqaiKhneSrLLKUEFHeAILxU9?=
 =?us-ascii?Q?p0d0AKIQjfD8rqmRdHuggUdgax7LINiiU8cRsJanzGDwiuax+3rcoJCxaJQR?=
 =?us-ascii?Q?mUBM5m6KuTnkJSioU0QazstVncb1TttFUpvp?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 10:23:26.9118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e45022e-65c3-4f5c-06ba-08dda288adad
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217799

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

 meta/recipes-core/util-linux/util-linux.inc   | 43 ++++++++++++++++---
 .../util-linux/util-linux_2.41.bb             |  3 ++
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index b0f2a9d497..d41e3991a5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -6,14 +6,45 @@ disk partitioning, kernel message management, filesystem =
creation, and system lo
=20
 SECTION =3D "base"
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
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes=
-core/util-linux/util-linux_2.41.bb
index 00036e8a68..6cc7708e06 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.bb
@@ -11,6 +11,9 @@ python util_linux_binpackages () {
         pn =3D d.getVar('PN')
         d.appendVar('RRECOMMENDS:%s' % pn, ' %s' % pkg)
=20
+        if not d.getVar('LICENSE:' + pkg):
+            d.setVar('LICENSE:' + pkg, '${DEFAULT_LICENSES}')
+
         if d.getVar('ALTERNATIVE:' + pkg):
             return
         if d.getVarFlag('ALTERNATIVE_LINK_NAME', modulename):

