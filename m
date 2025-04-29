Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234F3C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 14:39:14 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.20])
 by mx.groups.io with SMTP id smtpd.web10.98.1745937552421802461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 07:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=InLTW8Hs;
 spf=pass (domain: ericsson.com, ip: 52.101.70.20, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qtx2BbE4VH/t0NXzd7jjEHangJ0KBXNU5GnGNexcSyjaBxliTtrxdg+vDQ83VCll2OV81ZscU4pOW6ueOgHuF9LYtYViGUmRI40kaUstUTZ34bmxy39jrWlkrd/7EO4zD9haOaId2R4uMNym+PO7cpd+6o2JzqPi1hkrVE0NJTl1uIXa1TlvT+Sxd/Dsd+9GgCKeLDUhx4F2Z/1le5T8/C+iyzWu11fHRYGpap5X564QS9wEuWv7ch0FfxVJ156y7KTC2maL0O1tPs042HHE+MR/yjT/lDS7gT//0yYHW8pSCudjRr5sw+Bh4V33nqH7gOX6edbhp7qWp05+uqKpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/B7GtLxPEWtYx7CA1R098ShUtnmiactZ2YE8qdmIaq4=;
 b=s0jQ8XFstnMmESuJIAfH/0lrxSoyZVEMnU8BSWFv1SaQXOBdrdkZyhPsrUWPnxlmGZlATUaYd2HfpqRUu6scHueoS+w+v03LGYSKoGqcBAJmEVHhJEbRBBTz1GyQU/IvibhxNcDuU8PZvuuqwdnNet4U+Yb9r5e1aDuVf8umM5kLso0E5lEd2hf3/m/N1GtG2O88ErHPEe5pnjn/QGkDPNO56N1a8hVIz1JmBsjYkAINi+hQZ/QEbmTGxqPDROOfHEpemKHkbsUWL3XHr5xaVGOX7PK/2FwIrpRO8jnoThYLMhiXjSxpKrSfB101duNmxQ6WcHOjl0D8wzxIFCXz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B7GtLxPEWtYx7CA1R098ShUtnmiactZ2YE8qdmIaq4=;
 b=InLTW8HsIYKpcMD/i8kqJ3Kb5xUtYZkNdYqTLkz9ID+JvCqAS7N+6NzWmta0H4fQyX+r0xixKuMLUS8CQS12fGb61fIc2lXO6A/v0T2ibBfRgMmdn1AYpxCxzc01a68mI8Mc6LtqLi4sJRWmPbYhH6jc5A0NtvuMUn/TSLIxalJRf7T6xwBk9YXzoleD10nFrX4vGowx10OYe4zamKes5stSrZ6e0UvGmQ+4s53t+GTyBbDab0p+a+6/ACLFvizXlAYI1nm0+1VzzkTMXJrwjcMClE6ZW4geLQNhQeJFB/e6qtetzc11+rxTnWH8dmePLUaVamwWvLxZQH2csHnsUg==
Received: from PR3P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::10)
 by AS8PR07MB7910.eurprd07.prod.outlook.com (2603:10a6:20b:39c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 14:39:08 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:102:55:cafe::d7) by PR3P191CA0035.outlook.office365.com
 (2603:10a6:102:55::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 14:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 14:39:08 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id C10DB4020847;
	Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id A8B3E700022A; Tue, 29 Apr 2025 16:39:07 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Peter.Marko@siemens.com>, Daniel Turull <daniel.turull@ericsson.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
Date: Tue, 29 Apr 2025 16:38:57 +0200
Message-ID: <20250429143904.634082-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429143904.634082-1-daniel.turull@ericsson.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C717:EE_|AS8PR07MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: e0964c0b-37b7-4dc5-928c-08dd872b998b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Txz30frRQf9TOxNaYmm7074uqm3nJFHRbbXjlT7uy24NKhioAuYNZj4tLFcc?=
 =?us-ascii?Q?b6FkmaA8RidiLdHn0HgF7B6kv1Wc0sZkomISsVJ2TIZ8L1KNXfDeifXKoahL?=
 =?us-ascii?Q?BHo5Xao9kZZldQXkgIS/iu+hb1Xc4aLr3JsyY+Q0rf6eWuFBEiSqOfR+iLPQ?=
 =?us-ascii?Q?bVxL2MubN0SW4UmN87HCsN90QNo2+WmXkdBurTyba/GsyRPCC+0Kl++jLfSg?=
 =?us-ascii?Q?gRE81IDIuwGmZub4g8A14AmS0s+uzCmnkl91mdrez5czedRPHhrOW2rSBOct?=
 =?us-ascii?Q?Xgysgs5tId9KEmtOKDOnHkqmpWI2K16pqmGoeXOVlIcnMGakSW4TFgJOobMC?=
 =?us-ascii?Q?omVLK/qljD7uQIRdZEKL3GONl5h+ADHYCQOIeGX37KKBfqySRE1CyMv0y47L?=
 =?us-ascii?Q?NZBqqmed2qUYVaqdzpYX84VQcWMGtbFIPOgZ29JCOSc7/GYLYQVscH+kpfey?=
 =?us-ascii?Q?N5wbUaIM3rYhG6d9+m7ESKDMB7ADSp1VeN8Gg8hh3Id9IS8NPqfihHbzpLwW?=
 =?us-ascii?Q?RwtYg9vCstWBAfi+4e+2F4R8jcuP3TwT1OumvBTZB2omxVjmbDTHjQVzDcN9?=
 =?us-ascii?Q?LzWyoZKu9eJviPRjWDdFzwoqjE3jJKMiOE8ygLhIwSeO5gpYxSz7GfyxwAWK?=
 =?us-ascii?Q?5HhbK71uM/p5Cfn9LRfnDxi7i0IFTByZ6NAXW3nuankjPN4li+Hs/NDZHh65?=
 =?us-ascii?Q?vphEA1QS/r4KtNPKIpxtdRN+EnT7I/PsTXnzAX6HEMAwScmSPF3W27Tt69KG?=
 =?us-ascii?Q?tHr0GzzOukw3f0ctPAQgYN3yVImjzRx73xYaR7GXaOsrRe3zCCZZPi5/mcA/?=
 =?us-ascii?Q?cugKhhzFDLIb/dlpNg0gNoARuV1Egj01jbZkWa9Wqbw17OQGqTV4QGWsAl5Z?=
 =?us-ascii?Q?lw85pkDpmZ0pntuK/Q9MXH53pqc0YW3sBeL0Pi6UIq+iio3YIe4PrvzmDxSG?=
 =?us-ascii?Q?JeW5/VEfn+VqmzEHNSOlFwp+noUrADyvRc/GwCd4sPNVXF59TIWsO8dLSnjB?=
 =?us-ascii?Q?QN2iJbrw5b7JGC0wk+M03DkV9OWJrZWg6PnTy8QBUf+mB6MKu4mKtAM4XHcN?=
 =?us-ascii?Q?YNmi4D0vl+g+Ry85Lc7KScIGoqraTyBRRShQhDNh8X3I9tenvBNS/Iucrk+/?=
 =?us-ascii?Q?fTTGhCyyKVCG5m0xCgNYbHesLbwrsnzlQvn2SPIkg1UXyLxcUKjOMrMe6OQS?=
 =?us-ascii?Q?Aetlhw3pV1RrcZyvUP9eVF2q4upy3k+/ssjqBJJSaIKID5j8tD380Zmd63fV?=
 =?us-ascii?Q?3jOTmFn8UHukJZ6qexp70jtWe056EzZoNdAskpGq6mhO1xk/kJvKgqn4UCVM?=
 =?us-ascii?Q?IrSq/bVCOOZ3nFhZ9KyvW1Pk/rDNl2MIjOjeAlHMB5poqT5LTDr0z4/9j12l?=
 =?us-ascii?Q?B8kgzJadt6MB1V5VngBlifj/BXT/lAgU6+d1myYc5CjfzMQS1R/poM9tUCh0?=
 =?us-ascii?Q?+hmtu09EmhBXE4qqw0a5jUzi+cCQcRVfwHWBc8+SSuCtAf/uoIzmyFbuS4VV?=
 =?us-ascii?Q?vIkwhbUqYEiB0t8Ld/D7aNNy0zBJHyp9Wq3hK6p2fa2sU/qoqrP+lGHTdw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:39:08.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0964c0b-37b7-4dc5-928c-08dd872b998b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7910
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215667

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

