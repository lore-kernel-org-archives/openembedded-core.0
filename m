Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9F9C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 14:29:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.69])
 by mx.groups.io with SMTP id smtpd.web11.20608.1744813759945809704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 07:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=wVaIDMdJ;
 spf=pass (domain: ericsson.com, ip: 40.107.22.69, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4SoVE3fY2czfj10iNwV/NieymJm7NaLeCeMLOVt7PLde09VPlt3kam5F+3n2pXr+msGC9uKn8jnEKXD7BbY3zrq39fHgJZSVyQZSZURc651B3+OT2N4rHlwaz6/frYSRqUGFMjHAUqdS0Si6qwUTZoOBufY3wUtpzNdXX/UJvm852TWdmcFVyE5YLlfuG+la3fbt+zoRO2eFBaOUAetJEeftaRbTx7oc8LP0aLSwGJcAWBVl0c9FZ+PSFfv5WEwNXpAxCuDsoYBXW6gblcjERwtXJsoXqGcB4YbNDSun+ZAovcT2+IRHULnBDcTexuOHnPdXuMyFNYsdyyj0E+F0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyHkdplejEzC+Mn7AFXuZDJncymw8CYnbxmVzvQQJYk=;
 b=RyiYgQucAlyVBCdJxeWm9A0pkvLtTDfZavSMnquiYyiTsix1pihXDfTXypyBVIgZ17rMoKUsk1ozTPq+j6uFOn11iZ/9kXCHMkMpo3+tC3C9MEgcVRpf0YcIz3qiFmAnNZVyWkH29OuAwJ1iCmkbMlGmgrg7e+ZrQKChA5spr4dZwhovbbPK52QWQT5PgfHAddEJFWVCHLLjeiGODv8i2h8KoE4m2mfM8yT6PTo1B/agBwfX1Ud5/EUKjGOb0MpEPMaahma0ZwwLUv/651irDgy1fFUoA9/CkwsIhe1VKmwFnqWlbj46Rm3l2sqUkqRD1+dZWXDBEpfwc/OeE9P2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyHkdplejEzC+Mn7AFXuZDJncymw8CYnbxmVzvQQJYk=;
 b=wVaIDMdJFRizzMuHP+VEbanzMQZ4aOsC7aRgs3iMVGBCWriVaQNql8RcRoQoT36wWbaSSyt4mAIgGhoozNaMoE/Zu21xPLPHRUA8ew+4M1nIjDEfT7EcN5vJxHcLl33wEggQ1JsWMnYDhNFesxfMVIqNazvOUQO/9AhZbf4nqwIprSlHTLCNbVFpgYua39FH7H4qZvyP5CyTV1kSr8ZLUi8w1LfIuTdaUMvKQm2tljoKIzPcsuVRZeOHU+q9xjt/8J4XX6MU9mx+lhZ4lezGvulZRq6YYRdnglt9ufW7calihAYNiAW+ti+7SppihUp7jmxg7F16MDYFf49+m7MWfg==
Received: from AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34)
 by AS8PR07MB9211.eurprd07.prod.outlook.com (2603:10a6:20b:5ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 14:29:15 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:208:e6:cafe::57) by AM0PR10CA0117.outlook.office365.com
 (2603:10a6:208:e6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Wed,
 16 Apr 2025 14:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 14:29:15 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 16:29:15 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DE43F4020C02;
	Wed, 16 Apr 2025 16:29:14 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id C73367000229; Wed, 16 Apr 2025 16:29:14 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 1/2] linux-vulns: fetch kernel.org CNA info
Date: Wed, 16 Apr 2025 16:28:58 +0200
Message-ID: <20250416142859.909037-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416142859.909037-1-daniel.turull@ericsson.com>
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A66:EE_|AS8PR07MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e053b5b-8ab9-4e48-f8f8-08dd7cf310e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3G7unp2yCIibO6L34eOClIWKHLVIGeWtff/BI6KKoJfL/AQulbOmtqBGcT6U?=
 =?us-ascii?Q?xgbHySMSnp+8KoXQoFKmAqpk0SrnvWwmQ4KgD1HWhECwl8Nb+YC6IUjbXnnI?=
 =?us-ascii?Q?x21k9WO/uPIow8nYZr/p2klCB38a/99KdoULOcG/cQlS3cN74c5YJX/hL4WB?=
 =?us-ascii?Q?lf/SbFvtA9cSHXzIcgVJjPmJFkVEC2EmiZT1SQ/eQCIAatfPvNm1dooWtrA/?=
 =?us-ascii?Q?jLQeOn/C8UKY93e2WI3Q0GTN9VEXF94q94H9JprDncW/H/TrGQHV+63GK6Tu?=
 =?us-ascii?Q?PfNEtk8zvPlhtFP2do1JPJtdF22VUXs3/gvV+oJ/KFFkEbL4SiFkDysGIYOO?=
 =?us-ascii?Q?pYyLkTJqKyREITd8Ac75G4veGmLSXnkeAfw5Lx0OgvL3VZHEnJQ8AG2Gj41F?=
 =?us-ascii?Q?06tlcPwUS7JxFgLlnMnk81ReCUtQvFBROEn7aTvKgl1ita/DCC3H4zoOfnoN?=
 =?us-ascii?Q?KSZNq2fLAw5APmXFZcjAi9ffcK/ktw6ELDAWrKltq0Gcn6SLN6PHTErh8rz0?=
 =?us-ascii?Q?9EnoMMHbmDHSWap/mqeEPRoGlc4MuJxUfE63/8JvLvpN1LruxWlrDwGvU12g?=
 =?us-ascii?Q?gE62GChFHLTZ1zloSZ0qDa7/tvWh2tgyBBsenjAHGZveZtTy0oQHAxBQDvgr?=
 =?us-ascii?Q?6wk4a/0UDYUUSD7xV4VIV27RNzNkBE5Sr2AqolRSzvaH93anxDMKWWSJpxlb?=
 =?us-ascii?Q?WeaBY5vkQQ4d2FPsQuANtEwUO5+FYUPg3xZl05C93O2ThCeL1x6LFHtpoySz?=
 =?us-ascii?Q?jTkoq7Ox0kNkYQHZifXjW3dSYWA6ifpoTNr75Uxrz4r8nx/a86arGoKJNCUX?=
 =?us-ascii?Q?qbUamhn1R7D2NpmI3WFPVZAEN6+NeYpmig1seCkS04xWgLn4VCudBex1y6Ce?=
 =?us-ascii?Q?MGeYfhTRjrBC02NNsAlTjF5ZFmKkZKg3XStqRAo5cLBNPLhKK/ujZmVhb+Yz?=
 =?us-ascii?Q?dEMVZk5R6iacpTt+c3QF5Rdr8NOQ5imZBCBAYrL0YmKEE9BseFsPJiw2144/?=
 =?us-ascii?Q?m0kPwdFww4DYikoE9OEv6PZ4PGLPi2GsRFA6763evIM9xSMdm0k1TrcTVc+t?=
 =?us-ascii?Q?qRZbIDyYGJEflJel38/AlqbotJV+75ROYOZ2Re4zBBlZRp96N68CVE3Q2I9r?=
 =?us-ascii?Q?XvOVYFX794CcMMXPi+uEauUaP27vGVoyW+cLHKBJzeF2kPedXUV9CZCZOu0I?=
 =?us-ascii?Q?7V+lqWHbm7pbq+hPhy5Gi+KRU2GAEyBwkqPmltWUUR8xiAT2pM61PVI+jIkt?=
 =?us-ascii?Q?ah30GVd2f/CA5ik/rFz8hAqtczJ8ZWcPighNsGuCD4QjXCfFFNeEb2Bp3UHD?=
 =?us-ascii?Q?l0S6nGPXq4MO6I6kGUlpdb4fHUpl86AyANC/WEO9oktzXm3lBp5q/1jiX2PZ?=
 =?us-ascii?Q?3D2Ubb8FAUC2ls7RUJ/Y/hiJ/drfQ7jlEbJSEVkQnI52wo9hz/q7RrQKsBx1?=
 =?us-ascii?Q?mpZY83XSoNJcR+S21gFoWul9ZCCINIO1+I9+LJS2fqYktM/fxz+VKf4ABt4P?=
 =?us-ascii?Q?dBJL1iKuJ3WyvZQU7aXnI+z9iy3YVvxv+R+PXR31Fb4poQinL+Q5ZkBF5w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:29:15.8192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e053b5b-8ab9-4e48-f8f8-08dd7cf310e4
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 14:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214992

From: Daniel Turull <daniel.turull@ericsson.com>

Add CVE data source for kernel.org.

It includes more information than the one provided by NVD.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/distro/include/maintainers.inc  |  1 +
 meta/recipes-core/meta/linux-vulns_git.bb | 42 +++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/meta/linux-vulns_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 8065287c17..ec427fe6a4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -468,6 +468,7 @@ RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-linux-firmware =3D "Otavio Salvador <otavio.salvador@=
ossystems.com.br>"
 RECIPE_MAINTAINER:pn-linux-libc-headers =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
+RECIPE_MAINTAINER:pn-linux-vulns =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield <bruce.ashfield@gmail=
.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <bruce.ashfield@g=
mail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <bruce.ashfield@gm=
ail.com>"
diff --git a/meta/recipes-core/meta/linux-vulns_git.bb b/meta/recipes-core/=
meta/linux-vulns_git.bb
new file mode 100644
index 0000000000..158790f082
--- /dev/null
+++ b/meta/recipes-core/meta/linux-vulns_git.bb
@@ -0,0 +1,42 @@
+SUMMARY =3D "CVE information from kernel.org"
+DESCRIPTION =3D "Repo for tracking and maintaining the CVE identifiers res=
erved \
+and assigned to the Linux kernel project."
+HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/security/vulns.git/abou=
t/"
+LICENSE =3D "GPL-2.0-only & cve-tou"
+LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0-only.txt;md5=3Dc89d4ad083689=
66d8df5a90ea96bebe4\
+                    file://LICENSES/cve-tou.txt;md5=3D0d1f8ff7666c210e0b04=
04fd9d7e6703"
+SECTION =3D "base"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/security/vulns;branch=3Dma=
ster;protocol=3Dhttps"
+inherit native
+
+SRCREV=3D"${AUTOREV}"
+PV =3D "1.0-git-${SRCREV}"
+
+S =3D "${WORKDIR}/git"
+
+KERNEL_CNA_REPO ??=3D "${DL_DIR}/CVE_CHECK/vulns"
+
+python do_unpack:append(){
+    # Make symbolic link so it is easy to find
+    import os
+    source_path =3D d.getVar("S")
+    link_path =3D d.getVar("KERNEL_CNA_REPO")
+    if os.path.exists(link_path):
+         os.remove(link_path)
+    bb.utils.mkdirhier(os.path.dirname(link_path))
+    os.symlink(source_path, link_path)
+}
+
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_cve_check
+deltask do_populate_sysroot
+deltask do_runtime_spdx
+deltask do_create_spdx
+deltask do_populate_lic
+do_fetch[nostamp] =3D "1"
+
+EXCLUDE_FROM_WORLD =3D "1"

