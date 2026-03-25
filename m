Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A292106B50D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:11:01 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21021.1774440657751777011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=bC57as4f;
 spf=pass (domain: ericsson.com, ip: 40.107.162.41, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQfZgwTr9U3iElgrN2CXS9M8rIeHTvtfOUXIfmG5yoS6392oKky9I1f+X4zr9Hew5XBWIaCPNcNACb8ithPscpap1GhEyAcoA4/cFqOEdcfSmeuv3JdvLcK93W+qXJPk/z+PypPXQ021wfnJ7XRUjo2NET/CPD/Qiv0d6SUxpOV5+pJ4e4ScCD79vWZEnMI97x8YkMob37aSXqjUVSplmmVuMRt99pk4UaeYEduz+7yCQuQUhkwizUG1RRq9NiE6B2t5hPd/rigxqm/+2V6otGhse/ux+BxuAJZ6+envA5chxtm0RtJQeKoZd8uNrSRu442F+NncGcJ2buGWCD8SIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTQuuTHtqjPC1tvSFjcMANDa+KiB/Tf6YdyEbNDN0A8=;
 b=f92rW6tvlMZIxPwr05irsGvlzzoXcoZhMHnVuL3D/GZvcru6lFa6H1rcTaPHmTg6L03/fHJxsHQb4vcx4ibhrHdzfWdoKXztloLQtnzxN8untmtRfWMfOzavnQyfeiWYC2UcMFwxVCHGQFOBhRIYwqSgetxcysgYGaNPF0Qcymb/s/CiI3m/f5fxIxPv7ZbPI9XzCJTgbGHQ94pHMlRqnVPENrRYI3rHW53bjP2vKmJaz9By255bjNwIcT2jmZRwKZ+H2Mw32pkv0/1Z4dla3yo7wYy+7Y3DSvv72tsu3VRozcFkTirqS7VMErGbgU7zxnRU4U7DFfF/29oSFoPVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTQuuTHtqjPC1tvSFjcMANDa+KiB/Tf6YdyEbNDN0A8=;
 b=bC57as4fQ5q3jQ00Iw2CA0K4VZkpScbohVR5lS51HN6WbsWPthQaJBdlq2ZO4nYqJzK/lwTD+8b2bLD7GNASnjsUkhDuo3eM3LviAn/VPzMiarj4oYmGiLIQq7y0Z/+n/Wh1xh7qss3X51kN6wYT1/nmkS2wn8aOuLLpDQW6bgCihEVKRuOzKnQo9bDDDEf/rGFUr2H6UUEaY0NUDYX+r0BymQues7DF+DfoF4WFJKAMw6B6bI/ps7KxFn6tdjKfXkMcBabegrZQwT0FRR0MzTl/TISSTWGk7rNptzWQ2RASZ5Q2akbIv+huVJ0P8RWBZDEZSqiDRSQCaWxIqHrlWA==
Received: from AS4P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::10)
 by VI1PR0701MB6976.eurprd07.prod.outlook.com (2603:10a6:800:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 12:10:52 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::ee) by AS4P189CA0006.outlook.office365.com
 (2603:10a6:20b:5d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 12:10:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 12:10:52 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 13:10:43 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 624A142977B1;
	Wed, 25 Mar 2026 09:40:30 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4CA91700CF09; Wed, 25 Mar 2026 09:40:30 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>, "Daniel
 Turull" <daniel.turull@ericsson.com>
Subject: [PATCH 1/2] python3-kirk: Add version 4.0.0
Date: Wed, 25 Mar 2026 09:40:19 +0100
Message-ID: <20260325084021.3915804-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|VI1PR0701MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 95b807a5-d1a5-44e5-afcb-08de8a678f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WcdWwklTiaWlFjkn7LSn5dYG5Y89nsl97s/xifrgCWNNXRGXm2vwbMzlRD5vpxkEX8zeIC3GQR7NO8VJb0244qX3Jhp+fWDz/M9G/U8X6VBLyngPg3lPXM9P13QGrPQc3wP7WQMD70tHKYfixf+60shhDPrxohtHONA5efR/fKrs74AOIrcM/Pvfp0vAzVT6iEQP8IvfyHfz5sQY/bAv7x92wiF9Rw8mLMmGP7Dzv2z8h+DoyOU73qtKqDIrs3dpVvmR8KBleUWvyhFUJRQVKVPuf2Ps5dg/aszUKAJWHUXdtWFWCyJQQq6qIv9DHnEuQttdkt1lcxQ3eB0JtX73Rh+NK6uvZogHI8zpCIMSYYJSldLzGTFnzJsNs18Lkp3TOz/wDy4HHp7tfdqgjvczZnT965n0K4kz6Ibb+AkGLQA/F47GEF20ai0raYgeUlb8hahFVKy8Hdp0EXLxtVtqKuSPmjIU/sfOSMXraer58106Qj0+RR4sTrYU4E3MKJMOzsoH9AdCAvtiuoUlJorBH0M0+zBiSxj6LmF2JzIzzeXuZMOQsLcjkxgJET7IMEAoqnew7WXDv/l+fxgTnaneYtiZubfWwUBm9J10OPBUPTQJlIkC1qZkQ8fL6xzCZIwYj3f3vYyDQ8bLbCmUhdOmbB90mWU1V75rjHmtcA2tRYthwm7U6LXgiLxvT59pWKPYh32rA3ca/51Y6sTgBisYhzTpYMnE02AuBBeygXKvqyC9/eTErO9Uyv5ioeZx5lwqvNu4nBXsCczLQI4jRsjYvA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9Y4boq/nlaoU2vmdcQ2rxG4Qs0oqVguWptTVgo/rvcLQa3paTZvD0Zj1zmtje6JxUm+c0MyQvs/zY7xOjc3hf7Zm7nuleNgnqIjmfT2r7Ay53aRaNScGV2+a2/sh/y4XqjjsuqVZU6/iDfCSMX6iSFGPSUfBEGEDtVlkM5F2cmoU0YTOIwuevmE7x9I3sepRQBaKO5+/ZDvuAEQn5oslYZYI7o8S49NWwTPEKyhqflp44WN+bUpeXBcezIgnLneQRwc5bCTZG/I1IrDX05gjgCqoWCKUcmAcg94CEn+jbTVKDSz316M78W8NiaKKSPw/tav6xDkm2xzN/CIx9+WpOp86xXyCGoDtZz0uw7kFDMNioetWIbUqaHYBxTks/rcDXEEuBq6q7FQBOsyn93mVGcHtUdILfGhHQ91SxGkzHTtDQxI/kJrf/CnGJKgE5M+A
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 12:10:52.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b807a5-d1a5-44e5-afcb-08de8a678f36
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233892

From: Daniel Turull <daniel.turull@ericsson.com>

Kirk application is a fork of runltp-ng and it=E2=80=99s the official LTP
tests executor.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 +
 .../python3-kirk/python3-kirk_4.0.0.bb         | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
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
index 0000000000..75edfc2fe4
--- /dev/null
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.0.0.bb
@@ -0,0 +1,18 @@
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
+SRC_URI =3D "git://github.com/linux-test-project/kirk;protocol=3Dhttps;bra=
nch=3Dmaster"
+
+PV =3D "4.0.0"
+SRCREV =3D "32b224021b9c657953f5b2f61ca4744b9b3c5961"
+
+RDEPENDS:${PN} +=3D "python3-asyncio python3-json"
+
+inherit python_setuptools_build_meta
+

