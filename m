Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.86])
 by mx.groups.io with SMTP id smtpd.web08.6786.1604450832607415202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 16:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hb75djAI;
 spf=pass (domain: windriver.com, ip: 40.107.220.86, mailfrom: yongxin.liu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYcjLhJXnw3sUf+fS+bgZboW7Xlgb3ybz5l9qIXGLQi0IlWxAYuEw6OXJyCeHbW2/PrI82ebBdjjDWW9WM7sYyvXRuxVC0RumLZUmlNVbs5NhP9keKRyLKUGQ6oMkOXMq3vk07OhojcIYIcCVPl6fUNvUwJ9lER9PnmzlmnQJ6D4vjDE7Ue1l0W8ItPhEpScCXCZsVZQp0QyS0TOtDH8e8TjG4tPVEP9Najn5qz0py9m9YBGj4lc9PgA+2TpmgcpYx4uyWXCRxbXOTdA/boaR6p2WbzOW6PeRtSeV0yi7A7yseZKM0rBX8W6BzAcG92YsFFAB3xVPm+Vb0hgKnle7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq3MFLUj7oledPvXR9isiH4/DN8KzrOS5eoH8oLQQv4=;
 b=ScquWeIioZwO6pcfl/wYlrNfOMV6jqvv9Apkz4lDCPTtm42YuiAjJ+lCJOGf7cRicLJMsAL0ZhsEQz73Tnx4VcM+vsFrhtJqY2RIEVfMZtPNAltbWrehZF9FGe+1bpnLb3KL2WROdGHzaWnjWZYxX1p3j7KkAeX7N7mCBIhkXsiMN/L2/LnUyosJEgueNMCd9zolA6jTbw6gQQ9CcsKkSbnUwjGB6TvGLwnFL/kIbOS7A6V0k1liPFB+58sDFVgWzyyGtCfytSsGJJRy/Q61+061fVucYlFcWP4STrnsfB5kUSHKtYxf50kp73KXUqDcSGR1xmECSfstKla+YWIstw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq3MFLUj7oledPvXR9isiH4/DN8KzrOS5eoH8oLQQv4=;
 b=hb75djAIrvCp1uIGdUxGUfFZlt9XAVtNKQP9WnTYJiVMGBT5qLctKis07ZDUbE3pQ/oPw+fa1/nHBo7keuD7wdI4WKm2VrlgfIcWzTyGiFnd1tXLtahR73WAyhGsyZDmFl01xH+LZfCy0lFqE8u44abNIrfhTRLQGZDFCggiaZY=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Wed, 4 Nov
 2020 00:47:10 +0000
Received: from BYAPR11MB2600.namprd11.prod.outlook.com
 ([fe80::9c3a:15e0:fe83:ffd9]) by BYAPR11MB2600.namprd11.prod.outlook.com
 ([fe80::9c3a:15e0:fe83:ffd9%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 00:47:10 +0000
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: richard.purdie@linuxfoundation.org,
	steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Randy.MacLeod@windriver.com
Subject: [OE-core][PATCH] grub: clean up CVE patches
Date: Wed,  4 Nov 2020 08:43:33 +0800
Message-Id: <20201104004333.41367-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0075.apcprd04.prod.outlook.com
 (2603:1096:202:15::19) To BYAPR11MB2600.namprd11.prod.outlook.com
 (2603:10b6:a02:c8::15)
Return-Path: yongxin.liu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK2PR04CA0075.apcprd04.prod.outlook.com (2603:1096:202:15::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 00:47:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67734196-45a9-4afb-256d-08d8805b29d9
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3895EDA1515F460742CFED33E5EF0@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	88LnoL9ncBazl09t1mSvZEc0BqlrYLAYrZzu7fwzpZK7t3Y8rv/0w7kZv8FkzuSBiW3aF/Ymu7PhR4IJo3OfJofGxld2GtQQ5k72h5ly7Ih/OqxP6az2Yx6dhEZmzz+nnMbVF9/Guk7OuTi+xs4pQb5q1Jrg4facpLNmreMPrS7Vh4XkJe5EpfMQVAvPW1C3fAMYc4lxPUQQvShALZfHt14bapaL5Gyl3gydz801yiMUt6gWe8kbHT26rqsYNdHp3fTI/B1nxDqnhpD0/WWjRryh4RpguFE6AZ2+l3VvifA7qVz5A2wpYljYIOggrMJFTQGLKlLYKBIVExiClc6cli7qOsboCyxgxJCp4UfsLkwMHgqM9/OF7oCJSJAs5rX3KQx4tIQOVpK4XzrdvZ1JbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2600.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39840400004)(366004)(66946007)(66556008)(36756003)(2616005)(83380400001)(478600001)(186003)(8676002)(30864003)(52116002)(1076003)(956004)(316002)(5660300002)(107886003)(66476007)(6486002)(6666004)(966005)(26005)(8936002)(2906002)(16526019)(86362001)(4326008)(6506007)(6512007)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8Sw+ICHfX9RbR01NcKsqo1RXA8yXVW01zW9RUkPe4YF6R+6GfXgu3NlP8tuO4SjQ+3bPPEm4y4tbbBFLAM9RWosxee/axsReBBcodf7noXdNSEM+2pgY7xvxTBRSBRVjDOYi8KdEGq+WqAupdCHGt0VMp+hh9+lilXfPI2hanF+66JpL7QZK3z0/lAmLjGyIrISeiYSPTcPxUTtleuDJxNZhK3WGNiYNDSpyeJP6mFQVoq+zU5yRR/t5SIbDORER9Wa15hwMlQ0SdOvDBUY6u6LIkqaFPKLIUtGJ0mCkg6Bc84C+pYyUNgKg8Z4+3Dpr9xX94NEjJgAjyyk1ji14W4HzJlCom7/N2r2r6Vz8O8tQpJlqPtLVeqf6tPITUg8gRXtBgu7dvN85Vu6VTOQlrYUNmvrQXDcb9M/Ggb9zKrfsoCzikH/BNN0+G9+K6WT/X7yABUslR+eyraOpI1CMKB1n1q7OoY6JuDwsLWI+AtoG1TYpueiNdRgsDQfWrWJ24SxELpumop7B412Rx70zEA7uuSynyOuL/uZzKagdsvLznaHv8MVdpzp2BrjamR+on5tHRvXYFd8RyadZcspwEKbYcxiNfB/c9YNRwXASS9YhkY+H7ULkAkpWpyt39i55h6tXgxOFIkArJMm2d4+K6g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67734196-45a9-4afb-256d-08d8805b29d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2600.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 00:47:10.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBYx+zy/urU71IewAv/6UtKJQTw8F8F2m4+abRsqKyVeC4ZtqiWGQMEtvoW7e1QpBEZgRub21+oprh1pqDfzUNV97OwICuYYSCG6mOd/qVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Content-Type: text/plain

Clean up several patches introduced in commit 6732918498 ("grub:fix
several CVEs in grub 2.04").

1) Add CVE tags to individual patches.
2) Rename upstream patches and prefix them with CVE tags.
3) Add description of reference to upstream patch.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 ...VE-2020-14308-calloc-Use-calloc-at-most-places.patch} | 10 +++++++---
 ...-Use-overflow-checking-primitives-where-we-do-.patch} | 10 +++++++---
 ...-Avoid-a-use-after-free-when-redefining-a-func.patch} | 10 +++++++---
 ...-Fix-integer-overflows-in-initrd-size-handling.patch} | 10 +++++++---
 ...-Make-sure-we-always-have-an-overflow-checking.patch} |  0
 ...h => lvm-Add-LVM-cache-logical-volume-handling.patch} |  0
 ...th-Add-some-arithmetic-primitives-that-check-f.patch} |  0
 ...-Remove-unused-fields-from-grub_script_functio.patch} |  0
 meta/recipes-bsp/grub/grub2.inc                          | 16 ++++++++--------
 9 files changed, 36 insertions(+), 20 deletions(-)
 rename meta/recipes-bsp/grub/files/{0003-calloc-Use-calloc-at-most-places.patch => CVE-2020-14308-calloc-Use-calloc-at-most-places.patch} (99%)
 rename meta/recipes-bsp/grub/files/{0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch => CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch} (99%)
 rename meta/recipes-bsp/grub/files/{0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch => CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch} (95%)
 rename meta/recipes-bsp/grub/files/{0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch => CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch} (96%)
 rename meta/recipes-bsp/grub/files/{0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch => calloc-Make-sure-we-always-have-an-overflow-checking.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0002-lvm-Add-LVM-cache-logical-volume-handling.patch => lvm-Add-LVM-cache-logical-volume-handling.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch => safemath-Add-some-arithmetic-primitives-that-check-f.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0006-script-Remove-unused-fields-from-grub_script_functio.patch => script-Remove-unused-fields-from-grub_script_functio.patch} (100%)

diff --git a/meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
similarity index 99%
rename from meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
index eb3e42c3af..637e368cb0 100644
--- a/meta/recipes-bsp/grub/files/0003-calloc-Use-calloc-at-most-places.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14308-calloc-Use-calloc-at-most-places.patch
@@ -19,11 +19,15 @@ Among other issues, this fixes:
 
 Fixes: CVE-2020-14308
 
-Upstream-Status: Backport [commit f725fa7cb2ece547c5af01eeeecfe8d95802ed41
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-14308
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f725fa7cb2ece547c5af01eeeecfe8d95802ed41
+
 [YL: don't patch on grub-core/lib/json/json.c, which is not existing in grub 2.04]
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
diff --git a/meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
similarity index 99%
rename from meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
index 146602cd3e..896a2145d4 100644
--- a/meta/recipes-bsp/grub/files/0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
@@ -26,11 +26,15 @@ Among other issues, this fixes:
 
 Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
 
-Upstream-Status: Backport [commit 3f05d693d1274965ffbe4ba99080dc2c570944c6
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
+
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
  grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----
diff --git a/meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
similarity index 95%
rename from meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
index fedfc5d203..329e554a68 100644
--- a/meta/recipes-bsp/grub/files/0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch
@@ -19,11 +19,15 @@ dependent on the current behaviour without being broken.
 
 Fixes: CVE-2020-15706
 
-Upstream-Status: Backport [commit 426f57383d647406ae9c628c472059c27cd6e040
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-15706
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=426f57383d647406ae9c628c472059c27cd6e040
+
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
  grub-core/script/execute.c  |  2 ++
diff --git a/meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
similarity index 96%
rename from meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch
rename to meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
index 0731f0ec53..d4f9300c0a 100644
--- a/meta/recipes-bsp/grub/files/0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch
@@ -7,12 +7,16 @@ These could be triggered by a crafted filesystem with very large files.
 
 Fixes: CVE-2020-15707
 
-Upstream-Status: Backport [commit e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
-from https://git.savannah.gnu.org/git/grub.git]
-
 Signed-off-by: Colin Watson <cjwatson@debian.org>
 Reviewed-by: Jan Setje-Eilers <jan.setjeeilers@oracle.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-15707
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
+
 Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
 ---
  grub-core/loader/linux.c | 74 +++++++++++++++++++++++++++++++++++-------------
diff --git a/meta/recipes-bsp/grub/files/0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch b/meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch
rename to meta/recipes-bsp/grub/files/calloc-Make-sure-we-always-have-an-overflow-checking.patch
diff --git a/meta/recipes-bsp/grub/files/0002-lvm-Add-LVM-cache-logical-volume-handling.patch b/meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0002-lvm-Add-LVM-cache-logical-volume-handling.patch
rename to meta/recipes-bsp/grub/files/lvm-Add-LVM-cache-logical-volume-handling.patch
diff --git a/meta/recipes-bsp/grub/files/0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch b/meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch
rename to meta/recipes-bsp/grub/files/safemath-Add-some-arithmetic-primitives-that-check-f.patch
diff --git a/meta/recipes-bsp/grub/files/0006-script-Remove-unused-fields-from-grub_script_functio.patch b/meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/0006-script-Remove-unused-fields-from-grub_script_functio.patch
rename to meta/recipes-bsp/grub/files/script-Remove-unused-fields-from-grub_script_functio.patch
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7c53193ebd..ff17dbe8b7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,14 +19,14 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://CVE-2020-10713.patch \
-           file://0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch \
-           file://0002-lvm-Add-LVM-cache-logical-volume-handling.patch \
-           file://0003-calloc-Use-calloc-at-most-places.patch \
-           file://0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch \
-           file://0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
-           file://0006-script-Remove-unused-fields-from-grub_script_functio.patch \
-           file://0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
-           file://0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
+           file://calloc-Make-sure-we-always-have-an-overflow-checking.patch \
+           file://lvm-Add-LVM-cache-logical-volume-handling.patch \
+           file://CVE-2020-14308-calloc-Use-calloc-at-most-places.patch \
+           file://safemath-Add-some-arithmetic-primitives-that-check-f.patch \
+           file://CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
+           file://script-Remove-unused-fields-from-grub_script_functio.patch \
+           file://CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
+           file://CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.14.4

