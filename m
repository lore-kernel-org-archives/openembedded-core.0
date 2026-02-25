Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A81FD3773
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 16:28:34 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49347.1772036913047872990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 08:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=HjX/zPmM;
 spf=pass (domain: de.bosch.com, ip: 40.107.162.48, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWw6hdO2y0aUxlpTRUZ1I9GtT+SsMZ9Pn+rJQtSDKmtPQPImCLb3dXBBCmyEkqh78KFAjS0tmY+yDwkv4JrmWfu4LFgpwKFQPNtmic3CXq94p7ZhX5YAPur6KIhxk2zozZkvc8b3JJFLn5xroe2mHSc4gr+rNYzg48TSUZVlKf6MMXpJn30Bpji16misSFvbA6e7nvW8DCmFn5SkRjIpud7yr1p37NvSBzhgo+qnmxFPlcTzBMDUGvXCCGe+kyNOPaSfolKWDDth802vXClc+wlWIJjpI7F+v0IIDlQFAhv5U3J37aZtbolRsNYVDH5cZFwMszImll/wPyDxaEPLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5Geu9lSgmMxnmIia+sfJODrmXDkMLgb/XpFrkA06O4=;
 b=H5Zr8HKzRIJGigbhshAZR27ykrVv/Zv7YXxHbCFpOG35KDBOoX1Eop/qT1cfR6rQVZ4CsB5zrRGVSYz64O05LBX3nE7jIsvG8RdvSHretNCILzkXoKZr1z8aSMqngkYbtqIzFiEo0ssDbXIG5VyhXHu2yaB5Lf6h81NQI9UAKVYviDJ3vNcY2RIhV1wouaCILJGkySxsmfqA88pOwvyp2/pZHQYsN/lbZIjCg1p5g/q53G8GmfVle0tW0XlFJdlBLJgwto2gxrmbt1QN9CbckESOGQVYafD5sigRBr207P65TeMl2P45mbu/Rcn9aAlvYSLmz3TrvpR2nZHbJpOVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5Geu9lSgmMxnmIia+sfJODrmXDkMLgb/XpFrkA06O4=;
 b=HjX/zPmMFvG0Zz7vrQZ3ORPYfbCpD7z+S9uvIwRTLRRmfRBUuNVlMnuK7T8JiOG13ocV3pzOp48qtINvzbKQrzrimnhmOYJOszNKiAJvvYw0roUWsEmsTAV9tl8ZZIUeWgez0aI00NqtB/p9mrCGQfl4/Ho3FeoJWT95VqMlr5Ew34Boh75+gDO30XyaP+Yxfwtxp/UNYvQiKu2HcnuQJ2/kBs65JGoXRK8yIWvJa/aelRnGjksecAfoo1YhN08u83XW6ojM71XMHN3hPF4F3q6jBTvkpMa1uJeFwMk6pJqlJTMOapwUZ5gA9SA1R6cKku1BArpuOfxFj9Z9/l/5gA==
Received: from AS9PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:20b:46a::27)
 by AS8PR10MB6922.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 16:28:28 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::6d) by AS9PR04CA0048.outlook.office365.com
 (2603:10a6:20b:46a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 16:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 16:28:28 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 25 Feb
 2026 17:28:27 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.70.204) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Feb 2026 17:28:27 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: Leon Anavi <leon.anavi@konsulko.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Ryan Eatmon <reatmon@ti.com>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH] u-boot: Copy U-Boot script to B when suffix is not scr
Date: Wed, 25 Feb 2026 17:27:47 +0100
Message-ID: <20260225162747.1809-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.70.204]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|AS8PR10MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: d2d9afa3-1e29-4ff6-e66e-08de748ae82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	iAMctdU7o88QCeF2ihV78JPDY9QUffSzZsd0LX8Q/xHSaTiqV+zq4MnqVi1XO0t561t5pQOStl+062LOhfUiMuR13djeDm7gf3A5JcF8vRiiYnJ2yT8NR3j8o3UQXxyl6KJbB/EUVCSkDmmeQY44Hbn4nKs+pJoGp6wc0Vhd8lfRtL1HVftsdf+xnzyfamnAKvMG7ADSxG0yvtqzz0OQBcwlj8j7t+54kSsvjAdT6vj8ADKqsuS4R76fZKkcH4Y7cZk/vpO2V8io52U7f2HUmwjEJY7VFOgc9Sve1TJrZI5IVW+w5IPhDC1UjEI2M/rGEvDJ992yhRaQ3ldsEkq0p4uuF92q+LbduzoYzD2+t5zSOfRE5FD1b2t0tWrmuHGIx4aQJYG6W8Xqg0hmE9dECchVSej8prObkmx+80Cjl/lt9KH1pubOEZjM8NWwPXBQ6fmLsxOz7QVkXlM5TGG+7fvVQJOxoBSuByH0DUgRgpx3ZLqLKQwxp2UZhrTmwKJR5b5r0JFL6jk+IP9a7f7Pohisbx++bMOWpizXV1DXhWmxzupzzrFh8tps+TqTkRmN6YTqGUrRL0TmQmF+XMk6Ug37zv1eOQzzXwNJIKZgZ0twXSc0mk8Utd3UZj1VQIb4D9XXyW6m5KIB86b7mh4UoY5kAxnSAjlkyfVLuiZcqlCkiUFsDMptZP3r5RidPpSBq2y94eI2Ns4rBdNKu6no8HCEJ06+BcrrjSHrJfJNsnBTXbeuJazJC4PFLCvSBUPHxRi5Bghe/RsNV/xsx5E7W1qq56gUCCGxDgBK+QYoLjo=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1RgHu98Mx0Kk+H1n0w8F3AwpSahvm+NP41esTqYG3NRsKaPw/M5UFzImjWVR/crZsKrypmzeV4f0tAM/0aaSzUkYUEQv0lL6OMqzzwLt5i+eY+DD1ScZ6vi/wC11yMkRlZTCRxVcl/7mhkZ5QtK5KlI7oFjb2j3YZjrFmm9WzSbSwYjsObXmASA9q/sz/QgBH3pS7QVREoSgbMxi/zaILDp4zj3SjbhrKKKWazl7nYEkgayJddhSGwu2ykrjI8c6+1ku2wGQX2P1acN8FbxGZKRh/teJTyPMgsqNoiLhxqrh5F1On5+gthGAeMMVFKOckVJ9rVtTBlivdO7ShonEkfSSen2wEKQ1R6Q6M66aP3k7UeliFDMnV3IPWiaxMc2SAHPtuPWJ1FqAH+hIs6WYDKQyzEY6XFbkwb3vDy3xd3GpbX2J8dXgPkAglBi0xrc9
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 16:28:28.2042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d9afa3-1e29-4ff6-e66e-08de748ae82d
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6922
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 16:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231968

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

With the introduction of the UNPACKDIR variable, commit [1] changed the
expected location of UBOOT_ENV_BINARY to B. This works fine when
UBOOT_ENV_SUFFIX is "scr" but it does not copy the script when it is
not. As documented in [2], it is expected that with any other value of
UBOOT_ENV_SUFFIX the script gets installed verbatim.

This commit fixes that by copying UNPACKDIR/UBOOT_ENV_SRC to
B/UBOOT_ENV_BINARY when UBOOT_ENV_SUFFIX is not "scr", as documented.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D62ff94ff40e=
823065178318133d54e44a3d8a46d

[2] https://docs.yoctoproject.org/ref-manual/variables.html#term-UBOOT_ENV

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index a58bba2160..01137cb495 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -65,9 +65,15 @@ do_compile () {
         uboot_compile
     fi
=20
-    if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" =3D "scr" ]
+    if [ -n "${UBOOT_ENV}" ]
     then
-        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR=
}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
+        # If UBOOT_ENV_SUFFIX is set to scr the script is packaged as a uI=
mage otherwise it gets installed verbatim.
+        if [ "${UBOOT_ENV_SUFFIX}" =3D "scr" ]
+        then
+            ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPAC=
KDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
+        else
+            install -m 644 ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_=
BINARY}
+        fi
     fi
 }
=20
--=20
2.34.1


