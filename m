Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ABDC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:42:39 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.46])
 by mx.groups.io with SMTP id smtpd.web10.48682.1745847751611030780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=AV51LApn;
 spf=pass (domain: ericsson.com, ip: 40.107.104.46, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXRgqCgjsDeVsOwZLzmQm7YPoTFJgv+9mzL1/h5qlJw9SX8+2DStE92ys75uEoXNa52IbNPPtoIaIdCpJ82XULLry8q0QBOckpbSiKJWmkAYosP8C0iU67Nn30UtrFP62cuMeP2sU0FtTbRz8AOZ/0V9y7cr54lTSRQ+NsbBKhTTIfTmMArwg8gfyARVrKFQYCT5tatAYr/frbZ66ps3HRGGNb5eG7rtfl2txncorGOCjiRMmYDNbYsArO+7ePpwpMlu7ybQNKUKGk8BG96YTPdgBC2CIi73Lp+PunMLP0g4Ym2pdx3sSyuehUjtjxvw3uBe174ukAghxBi2iRJWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/B7GtLxPEWtYx7CA1R098ShUtnmiactZ2YE8qdmIaq4=;
 b=Jkr5HyFAXQAIRyEd0ZOqydqetkGx8XkoSbAnJIweXor2aM22PxlaeDc+fZCmoSqL6Z4o7mIACbVlTnnqftUdz92jsK0fJ5d6tMp7Q7fnbpVEBlyGNwDXjGiYH5eUFmi+4Ft5C1iK7cD2d4Etg7tjmhLglhYeUvJOZgr8KnQbnzIkSMkj9zIdrhYcNFNPNrSC6z9E5/BmDofTkK2qECrfIb0bn/Ei4igkbM1gXvVumxjHxxbFhBmzL0wgPx/1OLoJ8lRXHJWEZlX9ALhvDwDoRgjQiR4WLTk7yYzYCwmkoXzxPUsNu3RUnqOxFv5kRc/fVI5DciNLrjNADLLpJvK3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B7GtLxPEWtYx7CA1R098ShUtnmiactZ2YE8qdmIaq4=;
 b=AV51LApnmoacFi+0nTnOp4yiUVEfMNdHYIKbykH4NF1foV2q3WXyAROqGuCUqYsrpfK5bSlQC//6N2tTq/6SHKaS22TA1XDpkK5QYZtCrWWQRa7aCpjEZiy3v70WanJFOl7r/rksA5Nzi1fCCBRG6dMH4v3crNjEMOgs+To7qqzeV9boKaKy4BwZrCsnnr+pAk1AtUE+LH37efaSefuyCJv5UQ0DxGJAhPQGH8U58VrOR6NqPOh+Wz5phWPBi7CVI1PTnRkaS63u0+hnpFlUgsxbrjfSKcYXPB0HT7Pqtx5dD3Sc98chdDcLAUAjo1k8kUjRBo98LHD26pQo5lzkqA==
Received: from DB8PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:10:be::45)
 by VI1PR07MB6685.eurprd07.prod.outlook.com (2603:10a6:800:18f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 13:42:27 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::3f) by DB8PR03CA0032.outlook.office365.com
 (2603:10a6:10:be::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 13:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:42:27 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:27 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 99CCA402061B;
	Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 842A27000229; Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 1/6] linux-vulns: fetch kernel.org CNA info
Date: Mon, 28 Apr 2025 15:42:00 +0200
Message-ID: <20250428134205.900354-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428134205.900354-1-daniel.turull@ericsson.com>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|VI1PR07MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: a7aab0b2-aafc-42df-6e7a-08dd865a841f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ix6qAXubw+kHhvG9o2uAwhgGmedlkPbiITjA9gm+caIp5I2jizIZ83PCzvaQ?=
 =?us-ascii?Q?l6LKEfutT7MpDEb4qhmCY5Yo6Ed3Eh/H7gWWk60QAGdm1axIjfdYal/VvR5k?=
 =?us-ascii?Q?JH0DBtTg+FyhMWnUPB2WbxX6APXn0pTbFcKyd7G0upmLbKL9di921ZFxxesD?=
 =?us-ascii?Q?XUbB4ANMIOQiSaRyEmhLDgBpsomHZZz/LN0bEOP0gWx/s32EdIYbG61APqjH?=
 =?us-ascii?Q?QWa55OS9V9kxDFdThaZ55GoQsWGq3SP7N1JNoDvwvX7jk+PTZBxeWma+2JWh?=
 =?us-ascii?Q?rSxJOMVutlUJM/KaOBBorLTL+zUOc2kcm57ArYEVxRmZRBQ0EoHi4zNjMhfk?=
 =?us-ascii?Q?3hx2c9gXYKT3OirFTU5t3qjMOm5PZLlBVR+b6UF1WF7mJWJn7irchk1dCrCr?=
 =?us-ascii?Q?UKuYXW7JFeI2oM/0NvS+qJ3WKinD9uDbqNdjeGy/lriWzmyKhSCYkm7x8MBh?=
 =?us-ascii?Q?s3Lq4wKx5ZAzlx5rEQ8vCQemnS5CDDgGfy3y5ntyAMn6LyrA4YR8eC+k2jE2?=
 =?us-ascii?Q?GvzJog5VgCr31NPoSk6tylY+dpTbar105cBG8atXhR/t5Bg0VNC+u+FIS1cU?=
 =?us-ascii?Q?DrO0eesubBvvwYvnifsJUGXc36n2n+tZjkEvSYFDKd0yfAP1gHf2+G7orjjm?=
 =?us-ascii?Q?9BAB1T08nde5ePiC2bV3ehQWiVtxiEA+DvioH6h+pWLxeWlyaWfvwuXHYC+6?=
 =?us-ascii?Q?XXhBBx49haTdO8hdnuRRycRauJdw60YvjuNtcCsImp6AM3u9EbCQUGxIjZiM?=
 =?us-ascii?Q?UBx5nTiaY3fylooTgHZxdEoTs6nELFoSDkRuhV9+md7ditE+VysbkqCsArDf?=
 =?us-ascii?Q?piiKibAd+j/x5EIouFXVgsJHXN8LNTr4iUhp7aVUi2jeSC7UIZtOryITrG9y?=
 =?us-ascii?Q?+eTdq6wY5K7YzZbNT5bmi8eO/SwZp0uPA3fkDr525tGHA9HsI7y7d5KpXWST?=
 =?us-ascii?Q?ivs6E11aqY2zKEyzVnMsQrQooDRP+g+LU3qDhRu7m9mugxyF57Dg/bMBMIUZ?=
 =?us-ascii?Q?od6JQi3ovDlTUoBWLqGP4m/uUNN2BCtMfGfN2iIXrZASZqcVZFhHs/8nxT9D?=
 =?us-ascii?Q?mRbpRRB15lJ/vr+NVtW/WFcndwKpncSstOw7+3i1NzsptYNDKzun8yJm+2T2?=
 =?us-ascii?Q?oCFTMX55jcrvw3iqaooLDCVmlOkN9a78YL0rFpqzf8I9kx4TbaH5rwDPbVkZ?=
 =?us-ascii?Q?iBQPA8bC0M/87lG7L87uiB0ptYB0RDgMqQUqfbKejLUpugkv2tKfqEDuzF8N?=
 =?us-ascii?Q?nzvR+o2X+cr6MUGM0b8VF6G3smRb1xfpwgbot7mPfTFqg08fJXoS7twrfq/t?=
 =?us-ascii?Q?ewEfOcgBRvYSflkHQlvenQn26OwKPK4VckMTYmxc6o5ZGAYPp9LAK+evV1lG?=
 =?us-ascii?Q?PEYsHql5RZfx4/hEPiy0ca0CSS6dd0hS9NkemOh14XCVzt++Wf2mMzzpoB2j?=
 =?us-ascii?Q?7hYDK9vOjgnRu1XQvM7X7tsLkoacc1Wv/cqnPnihBnNgEfH1sJrt+aLip9Q5?=
 =?us-ascii?Q?zQ9IYFff0r1qOXwN0jELB9G8Umn+NY9z7bY1uqezj3i8sAlDeOM9ViVxMg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:42:27.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aab0b2-aafc-42df-6e7a-08dd865a841f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6685
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215600

From: Daniel Turull <daniel.turull@ericsson.com>

Add CVE data source for kernel.org.

It includes more information than the one provided by NVD.
Use similar mechanism and same variables as cve-check to define
when to update.

To use without internet access, change variable VULNS_URL to a local
copy or mirror.

CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/conf/distro/include/maintainers.inc  |  1 +
 meta/recipes-core/meta/linux-vulns_git.bb | 76 +++++++++++++++++++++++
 2 files changed, 77 insertions(+)
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
index 0000000000..fc48558eb8
--- /dev/null
+++ b/meta/recipes-core/meta/linux-vulns_git.bb
@@ -0,0 +1,76 @@
+SUMMARY =3D "CVE information from kernel.org"
+DESCRIPTION =3D "Repo for tracking and maintaining the CVE identifiers res=
erved \
+and assigned to the Linux kernel project."
+HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/security/vulns.git/abou=
t/"
+LICENSE =3D "GPL-2.0-only & cve-tou"
+SECTION =3D "base"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+inherit native
+inherit nopackages
+
+VULNS_URL ?=3D "https://git.kernel.org/pub/scm/linux/security/vulns"
+CVE_CHECK_KERNEL_DB_DIR ??=3D "${DL_DIR}/CVE_CHECK/vulns"
+
+# Use same intervals as cve-update-db-native. By default: once a day (24*6=
0*60).
+# Use 0 to force the update
+# Use a negative value to skip the update
+
+CVE_DB_UPDATE_INTERVAL ??=3D "86400"
+
+python do_fetch(){
+    import os
+    import bb.utils
+
+    bb.utils.export_proxies(d)
+    db_file =3D d.getVar("CVE_CHECK_KERNEL_DB_DIR")
+    repo_url =3D d.getVar("VULNS_URL")
+
+    try:
+        import time
+        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+
+        if update_interval < 0:
+            bb.note("Kernel CVE database update skipped")
+            return
+        if time.time() - os.path.getmtime(db_file) < update_interval:
+            bb.debug(2,"Kernel CVE database, recently updated, skipping")
+            return
+
+    except OSError:
+        pass
+
+    bb.utils.mkdirhier(os.path.dirname(db_file))
+    # Configure cmd
+    if not os.path.exists(db_file):
+        cmd =3D f"git clone {repo_url} {db_file}"
+    else:
+        cmd =3D f"git -C {db_file} pull"
+    try:
+        bb.fetch2.runfetchcmd(cmd, d)
+    except bb.fetch2.FetchError as e:
+        bb.warn(f"Kernel vulns repo url not accessible. {repo_url}")
+        bb.warn("Set VULNS_URL in local.conf to point to a local copy or m=
irror")
+}
+
+do_clean() {
+    rm -rf ${CVE_CHECK_KERNEL_DB_DIR}
+}
+
+deltask do_patch
+deltask do_unpack
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_runtime_spdx
+deltask do_create_spdx
+deltask do_populate_lic
+deltask do_cve_check
+
+do_fetch[nostamp] =3D "1"
+do_fetch[file-checksums] =3D ""
+do_fetch[vardeps] =3D ""
+
+EXCLUDE_FROM_WORLD =3D "1"

