Return-Path: <S.Mueller-Klieser@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA267C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 16:47:43 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.121])
 by mx.groups.io with SMTP id smtpd.web10.18717.1741279654805976300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 08:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector1 header.b=n9U7H9Eg;
 spf=pass (domain: phytec.de, ip: 40.107.104.121, mailfrom: s.mueller-klieser@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPjvd3oOKQsyIBfKQ47h5hB+89hsgz2alyXrk0VGd+JZXrFyzdBIab/lS4EMIIn1R/0rN8JJEthu24qGnjx9hFS3h/xROrtG8XdVlqEnXFvs5zI1jshQZicKS3uaDbHLTpg4RKuJ8mi9J0srr5x7sz7aaXspJ3zZAdXjsO8VEbKe1qka4vJq/+Ez3WJPKMcUHy0wE5RIcthARpFhL+sEL1OGAAcyYkiGTC+2NFbpGTmuIfnORjg4J7u8juGENnrK31Rkuv/JQdZQGXxD8rduY59yBqnYyRaO/GL4Coqera4hBeaBoo502i8ilWtPYxQwJ7YmygZZtaVhxbtgkIgLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFCmSFvyTS1di3OM9AGI2saql8+d33gvSeuZhEOdpXQ=;
 b=qqmREAZkZ5/7xmJhNiEjFFZ5bVBMkJsssS1grN2qL6qG71D++R0OW2jVT8hDVpMYYaNiSmLxtVbYrvRJLnU+5nT7rbquL7NqQGKyp83BszObSLTVX1XMsiiFVG8LumtDOVhAS+NJc3hzvivDdLVcm+4z9jeR3pkNG0HK49Rt77kq/zH1pKXYjy3HGm5FUvq/Bl8e88TrRjvRm/D7v2MBz2LN57t5oOivskHHfOAmOWCKBhKKN3r2r0YBLGWY1l8Mk+oqKi4ZEHGlDFKWWnTvppfNJ5NAQN//Ah0T/9der8kwowEp8nkjz/lHgvgEQ/BgjlZhKJoclwEfipTF0/ENxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFCmSFvyTS1di3OM9AGI2saql8+d33gvSeuZhEOdpXQ=;
 b=n9U7H9Egln+Gk1BYfNN7oZoKJMLKElHWvWC1quq2jTX07onC0TNGwLpORs1Ir66O+81ivICusDAP+tY8+hH5GwPNZvhsuTAf58oZfmG+saUw+2C0VtkMj44iHeN3DyK5e6SrFt/vTL+xgiHx+fDKO0IOYLKvDdmxkrHFdEBC/2aL7vkAHafpHVXECbB4zrxak3OCfF5KZIoEwDEZcJrXL1J5zCy+E2OgQ1Wm2JiBgbtHgSJVqBVf4DeaAzFMVAfCADpFPICTxq/iI12T6DEw+IisI8TiRG4LhMVOR7UfsKozw3ZqhSthkF3GRp/5xSY11F594GjL7ub0Wo0DP0Vdmw==
Received: from DB7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:52::34)
 by DBAP195MB1019.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:1cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 16:46:54 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::75) by DB7PR02CA0021.outlook.office365.com
 (2603:10a6:10:52::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Thu,
 6 Mar 2025 16:46:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 16:46:53 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 6 Mar
 2025 17:46:53 +0100
Received: from [172.25.0.52] (172.25.0.52) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 6 Mar
 2025 17:46:52 +0100
From: =?utf-8?q?Stefan_M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
Date: Thu, 6 Mar 2025 17:46:32 +0100
Subject: [PATCH] kernel-arch: use file-prefix-map in KERNEL_CC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20250306-fix_tmpdir-v1-1-3575a7ec43af@phytec.de>
X-B4-Tracking: v=1; b=H4sIAGfRyWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNT3bTMiviS3IKUzCJdUwNDIxPLJEuzJEMzJaCGgqJUoCzYsOjY2lo
 Ax1QbNVwAAAA=
X-Change-ID: 20250305-fix_tmpdir-501249b96b16
To: <openembedded-core@lists.openembedded.org>
CC: =?utf-8?q?Stefan_M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.52]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|DBAP195MB1019:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a98116-82ad-4f30-ff89-08dd5cce7ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+eynvMvdXARPtQw7uv9e/XMSCyBMwcv5E26nQ9Eo4ru+3JoFWuCZd7lYhvaC?=
 =?us-ascii?Q?Qf8aCb1bMdvuSyWDuauJIzzhB+xHfdMWdIx5D28SDw/ECUExPf41rHo76Xpe?=
 =?us-ascii?Q?+aQSxXcTEyaNvF78W5AxLKo3j9Y2djv6uj6iTdgE+iBpflXamAPdw9xO6FtR?=
 =?us-ascii?Q?+79FKJ4GBFst66rB2SqcX66ukWVkq7DDHZ3uVtCeIk4915+Q2njQYGl/3jvF?=
 =?us-ascii?Q?UtSIe0JpA7DZchEQCDMcFMxkz7FTfdCLggCZvhkXZlUQuEs9wVpzPjppBci5?=
 =?us-ascii?Q?Tn3g+bcnSE/8/fg+WND3lq9In2voc7AGSNevlHVR14X300VnMkU57HbeM20A?=
 =?us-ascii?Q?Ad/drT/I5qWfSz9WXL4XKEhmNTmuvRdXsvH0BNO2+5nx84qYhEvUT/M06EdA?=
 =?us-ascii?Q?mWM38SiaBVDXEK4Rs5k3b9DYlW2UdXbi3At8L3lHl8JXA2M7FMon/fVTf8Bs?=
 =?us-ascii?Q?Gue0sRYUrzuX50NcRK7FWBb8Q8qhyQdj89Trn2h0rOTMDm/rdZ1JG29flU7u?=
 =?us-ascii?Q?kBKnlm1N+YJ6zC3L5VOuquRZCrzWe5bG5avcsyIOCwrk8CvimoEYNJ1rmgOD?=
 =?us-ascii?Q?6qDmlhlXrdYqdgPvTb/ejuwCh9vbU5S4aI9iKxZDA8kwPOPp5ivR8RNHOo3Y?=
 =?us-ascii?Q?KHd1spPAlsP1uNMc6PHhQk10E1uuGaALPH8yGb+tpjy2zp1jarDgn2iWksmB?=
 =?us-ascii?Q?xCALDwQpo2HHDVX9wd/Rz0tFBQqI77576uM4z9+CajClvOoyBuZbuCgXgjSM?=
 =?us-ascii?Q?qMXfdQ90fYIomALRf0vYBzkTbsTWCWiQUJjPpvECJnP9ayrl6sj/ALX09Q7+?=
 =?us-ascii?Q?8nF/iCVPR1KgnDRtddaMBk4DvOTt5UcXSrhmNrqtSNlR20tUMaAlVicZxKUU?=
 =?us-ascii?Q?cCGxXo9MlWlUqYj15zWXu/ROtZiGVJqewJ8mpk9+tRphmJNUMZBODKd8Q8XA?=
 =?us-ascii?Q?mJfCaRMjxZOcmVOFUWx/DxuyPwFYOuoMLMWhFNhYnno2UqLgIDCJYiOaBQYk?=
 =?us-ascii?Q?VsYPVu4fj2VVji+XQFdmqlVRG3I0AinP2VMmerDTF+ny4ID85t8WdFgHmk2C?=
 =?us-ascii?Q?fghSypRirO31yHFLO+2+QIJRze4IOcO/t59tVHdFP4TooDSNHE4db5eWXP5S?=
 =?us-ascii?Q?z2ggpMsMKxKlyiQjZeLbYUjDayaaZgRw14szZ8kjgSqDNFEdgnTxG2gTI9HO?=
 =?us-ascii?Q?FQ30vILErDURQMud8tdeTP4OL3kqsEZOkHH7Ies0DIFINrzBa8uEGxa3fJYi?=
 =?us-ascii?Q?Lr4A4YbwmJedOOVNFgy91gXJG3/p49F3+9SIVg+bTJfFGpxJubuT1EIVSyr1?=
 =?us-ascii?Q?sGOKrJKUVxeum9Dd/2X2TozsRdRkyGzC9J8N5NhgqIp7psKkQrbrwT2ffVxv?=
 =?us-ascii?Q?i3e+gc9ANgR09vwwiVPqKAX/wBvGpFI4OAkOFJAPB2EaG1TEJMhhFlYds16j?=
 =?us-ascii?Q?lWLROsjRkWD0M+eUHYb2XsnS2+CYZnMTqVNmUlDXKwZKQezjBNy1D9VWf5A1?=
 =?us-ascii?Q?YonLcuRrE6qsTyo=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 16:46:53.6133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a98116-82ad-4f30-ff89-08dd5cce7ffe
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP195MB1019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 16:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212399

When building external modules, macros can include absolute names of
kernel headers. The macro-prefix-map for the STAGING_KERNEL_DIR is
currently missing. Add it by switching to the file-prefix-map which
includes both.

This fixes reproducible builds and following build error:
ERROR: cryptodev-module-1.14-r0 do_package_qa: QA Issue: File <..>
cryptodev.ko <..> contains reference to TMPDIR [buildpaths]

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
I don't know if this is the preferred solution. The macro-prefix-map
could also go into the modules-base.bbclass. But then we have yet
another place where KERNEL_CC gets modified and ordering matters. With
this patch it is done similiarly to the default cc settings in
bitbake.conf except by switching to the file-prefix-map.
---
 meta/classes-recipe/kernel-arch.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/=
kernel-arch.bbclass
index b32f6137a2fe02f7a56a746cc3f4e76f1528e5a0..145ce24a48f52eb44be08c03f11=
10a228e899747 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,7 +71,11 @@ HOST_AR_KERNEL_ARCH ?=3D "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?=3D ""
 HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KERNEL_ARCH}"
=20
-KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=
=3Dbfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${K=
ERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_=
SRC_PATH}"
+KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+ -fuse-ld=3Dbfd ${DEBUG_PREFIX_MAP} \
+ -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
+ -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} \
+"
 KERNEL_LD =3D "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR =3D "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY =3D "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"

---
base-commit: fec201518be3c35a9359ec8c37675a33e458b92d
change-id: 20250305-fix_tmpdir-501249b96b16

Best regards,
--=20
Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>


