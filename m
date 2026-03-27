Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6E310ED667
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:28:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71765.1774614505846714004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=h/kCamcU;
 spf=pass (domain: ericsson.com, ip: 52.101.65.33, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lcwrlw796RreyS4k3HPB3TyY1dda0GJmGEqwUAfqz03/mb7HuXb/U9Tpj3W809NSq1gtcIYJFuemovJamrAQa8tHvvOTzQy251BOgDaBxlYnPmcaO/Ll9NsN4xZIeSXFeXkP0/WWPUhulsb3PcfAwn6FlwgPY3nN+z/Ro4nNIB2dlX+Dvc2K0zQ2E6nXr88j3rZKY0TvbsO6tRgHp9nYETY36XWvf9yGLMvZHQrs/iBxteQueYHa/Y9pgyq7doRwSOVnQhzOdzy0yIGElUbShgchH4raaOYHlwxqRZdasrb7kHCBTp2ssRPLIg5jyiaLmzwibhN4CZLO7zH1FIAKNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kA/ZvFUn1InKAHmP8a556x2Uv+bGZaK4oo7K5gOnpo8=;
 b=nWtKRVzZm0cdDd5DJJaWjTXnVEwPam+HlXEshFIDGZNzgV/UemZ5IFRhQA9KJqBwngDdoU+6FIFExoKBa8rg1M+LXXFCa/u3reo7tVGW1og45yHydag4nWUGZgb6vm4lADaho2zi8+L3mOtznSwXfrOUBOUBTTeQ3fnFLikpqqerOZjBQl/13pH8nCUFDvXDZe6FQpPn+7XLAKURFIdGjjTQUJI5v6Fpl7Fy5PqkTpkpmRCG/G1SSC9kZVhyv3UO+UkUaoGOI7nbCqgZFSHfBH4cyyauydA+A94h3P2L3rBLNe2lwaao2jOy8kvl5wLlJwaI2aP0U4rqN04Iq1Q/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kA/ZvFUn1InKAHmP8a556x2Uv+bGZaK4oo7K5gOnpo8=;
 b=h/kCamcUQBpleNVAIiB6gs5kBtmc27yLN3jGa8DMMRKuT3/tgQ+GVdovYWnPkth0svRcrRyMmihCpKKASf+mNjfVQUy1I3klyepukAJ05W+8hGqNtw0mek5QImurbCdhAsmmbnIlc/WRFvu0lxQZItsGLYXt4shTQXgqmFIdM1UHUIUad04Iw6xgBBEaqlzPcGOMAkX11bqf+oFrzIceHUMjDTm95q0RKHWT7VuTU/hVub3AruLl9yNftZ0975fpjILoH70/v9CLv4PsYy11U4Z7V7Jx1dqrC/lCg2LO/JvyC2SMmswu1GVzuI4swi4gsU3Fwvpyw0FolXioAfxtVw==
Received: from DUZPR01CA0192.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::15) by DB9PR07MB7322.eurprd07.prod.outlook.com
 (2603:10a6:10:216::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 12:28:21 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::a2) by DUZPR01CA0192.outlook.office365.com
 (2603:10a6:10:4b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 12:28:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 12:28:21 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 13:28:20 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 6F7F84030AE3;
	Fri, 27 Mar 2026 13:28:12 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 0F521700CF09; Fri, 27 Mar 2026 13:28:09 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <alex.kanavin@gmail.com>,
	<pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 1/6] python3-kirk: Add version 4.0.0
Date: Fri, 27 Mar 2026 13:27:53 +0100
Message-ID: <20260327122758.1851989-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DB9PR07MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0975d6-ef45-43b7-22e3-08de8bfc553e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	K6mnYuiKWGf89aulpHQ3Me7frEB99EF9ZGYtbs+fC7bKhjpjlY4JfH0L4MOfHDFy6Lo0Ew7gjf2467SrUtM9+Bon+LfTiT2lMdx0c32Gn5GMi4ubgggf/II551fVx4CovxvCyMWhJfj9x68lHdxJ+JDOiAdS59/I1UXIIy0oihiEIYKTQ3ZDHeoGKvwYICeCNmUWiLriFD3Wp31AcX2wvl96yQmkax3KeZfge1IYb5ZzgX17aq9jYFF1YvYVPGDDHKBGa1z9gs+Ci0os1aJghL7eVM/hZvjcKo1SY+dKH3r7Ah633/YfADhBk2NIbicfngd3K40Jqlb1FdZ/wYGUu5N54xeixKLnMRcT3rPx0Oy4QdnCAUPyyBaOKKFTwGuM+S8xP56e6IKwNiZAwBBvlPk0bH5BsdGDTrjHbCrVIwTtvwgqtMOUPjG24/O4fMu6XAoJmJ+kzrfdCwUmppgcQMpfYrSjmr7iOFhvywJnQEzyP/xoPbYL+BkYh4/3GmteiRSJEkZtTgGQ5e7Kzn9102h0s6FHqzCw79AAYTkp5yuR/zBppOyYPCO8RvOZ1aUIFgfB9XV2NX9YSH/X75Jtbr484FcQsgdHLXt85ER4tbKz7P279gQBvWAhPNDk2BqM+2KRfLAdSFx5fTxkDQ48rll29D3fOFUOfqHVuIxrNGH7WXeWDtPfBE97WdBr0z1WyOqUy9kgCAP6jjJLkMwlYew7wBFExSZArXQpDU+94NtKXfKQ8/W1aVJhDlgBTYe0Ro+C34Uc0VnMZz7k3PA0WA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aJW7mAvewDYizvyGkHfHzso9ePPjOA1I86e6ivAvXg/vQBktxpr/rmV96CSWVfv4aXLg5llYMZqVIzcZ3yZb7K7epuQg1Sa9ME8kFje6MmYJ0ZpY6CIGYNzrBWVbORQKIHgzi7B59CN4OQUjrxjshevfvbUXl2J2jhXsmsiV8kI44TZOECYLAaVIsbxPK0wbaVjawtgqOyHaxkuSbWClHEzLB7dwF2rPlQv9g/UoYQMT79n1IbkGKP+v/g/bSujUn2+4fR7IM5TpJdj+cE3MIleEIJgXMIqrvOceD1Ac5hyHl1gDpfb2bPqYgy4FE9/UZX97geKcz7gKtS6QDWC5r0/3sbwSihSvR2kaxHM8ycziceayhmNvj2suAqoC74dJrRvWz17lq1edWijDWK9nxzm0oYnWsx1BGweaHCe5x+iCbEjBUKZ2PJMbffHaXusr
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:28:21.0555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0975d6-ef45-43b7-22e3-08de8bfc553e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7322
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234081

From: Daniel Turull <daniel.turull@ericsson.com>

Kirk application is a fork of runltp-ng and it=E2=80=99s the official LTP
tests executor.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---

v2: use pypi bbclass instead of github repository
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../python3-kirk/python3-kirk_4.0.0.bb           | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index f9a600ff11..9cd58dbac0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -665,6 +665,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 =3D "Richard Purdie=
 <richard.purdie@linuxfound
 RECIPE_MAINTAINER:pn-python3-jsonpointer =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema-specifications =3D "Bruce Ashfield=
 <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-kirk =3D "Daniel Turull <daniel.turull@ericss=
on.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c =3D "Joshua Watt <JPEWhacker@gma=
il.com>"
 RECIPE_MAINTAINER:pn-python3-license-expression =3D "Wang Mingyu <wangmy@f=
ujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-lxml =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb b/met=
a/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
new file mode 100644
index 0000000000..af53d2edf3
--- /dev/null
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Linux Test Project tests executor"
+HOMEPAGE =3D "https://github.com/linux-test-project/kirk"
+DESCRIPTION =3D "Kirk application is a fork of runltp-ng and it=E2=80=99s =
the official \
+LTP tests executor. It provides support for remote testing via Qemu, SSH, =
\
+LTX, parallel execution and much more."
+SECTION =3D "console/utils"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f=
0"
+
+SRC_URI[sha256sum] =3D "4606f46dfdb7be1e1c2de8d8f040037459a9de8a07fa1123ce=
e4b68c7f7cb764"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE =3D "kirk"
+
+RDEPENDS:${PN} +=3D "python3-asyncio python3-json"

