Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F14BC531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 15:46:12 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26680.1784821564670202662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 08:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vWSqBkMt;
 spf=pass (domain: est.tech, ip: 52.101.65.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMgBgCHfn7I5bnMwiOU59Q2XHWVvEjx4ZW+P1fuM6Vc+UFZ2feJ3dcsJQiPhx4eNaz0zR5uwJSaw1uVnTcdISpEwsM3gSvR0gEnHkReZOFp4uHwOAN+KTdqIWdL2EDxvjNYyyrrmT5I91ouej4fVi5O2n8OpEXjt8FbgZPOtC1rx5DIsqqgnPpAIWPPoorvXF6aGBD2MZZ+CYMTIjyCrOlu7PZF3ZFZVGqX/+IyaMqXmMYz06kdJ6NkKDf4hwEqPp0GaDwaEBi7NuREInFkw107tOUceJjMkhFpe3YaST+rF2lLm0zQ+A80u20u6PrLKovohm6ei/DsYp/cTMSRfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TF1dhKxHga9gmim0M6p4QjeHGMBbcG2WfGA0oBZZEk=;
 b=j8WT72m5C/9To3VL5rDTEItycS7ceWWxXWUvpnjMSypN7UAnJ3SKy1C7J//oCspzZqhDc66cY7UdJgXQzgtztkfqn7/W4T9S3jKjMMLI6vxEKFy4k4SeDHGFXsRfwL7ZkjKv18PWv7gMsHKGop9x/T2IasUXVAJWJ789Jy0lL8Fa7rSFLnb59PN1HCAdl2dAe+C9x7dz97fs69Elm3JPJrppm35dQYiqvCbPFq9BRAqNWBzFADo92cImlG5PRgZP4CBDNvLy78ly5GCgb4l3YS4G16Hx7mnAbfAbOfjGcB7N0EkVJ1LbfDXBKbSFRKppFxUi25ONXU0whUICNKs4Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TF1dhKxHga9gmim0M6p4QjeHGMBbcG2WfGA0oBZZEk=;
 b=vWSqBkMtcu8HiaQCDAnUV7C8Ykmyd12k5m3Unv2GV4Ts6WuYUEUkwocOFrxVSjxu2hjkNAMNuqn2/oKOkjGm8IeeMvFp/rI4oyA4Q744XlLX4xMafR2tFl5DR/RdwEqTihC823ASRG4AwgfZHzydKE+Gh8Z9zM1xhNIJ3kA9rxEl6krMinf4e5Rny6a4QF+9qI/J/GRcm44DZIr8aIeko9cwtDmf1SCXWCWYY7h1RKwuuWarYQEn7+H9BxryuXdnbKYT70lipa39Axc+qbOvfUG9ZYhfRl5MQCz7HvJYrx0Pdp2oSPn6NOiRQXM8dZaWw/WxFVgOFX/AuLjm1tKU/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2492.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 15:46:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 15:46:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] ethtool: upgrade 7.0 -> 7.1
Date: Thu, 23 Jul 2026 17:45:46 +0200
Message-ID: <20260723154546.19545-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2492:EE_
X-MS-Office365-Filtering-Correlation-Id: 5052d621-82f0-428f-61d2-08dee8d17e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|10067099003|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	k0xt7Knq7tBAt/vcnH453rLFw9qFbdI7nZDY+ntziUT1llOaSKgLqq/5ef/TiplebHYQ9JkiLgMchWf/oD4MIFK0Db1ddvG80BmsRNQ6ImzEQwDa1UUP9FubD9AsheOo9dj0zC8v/a9JeVZ6VmN/xKSKMmy5TcgKlVeQzJk1I8iWF8I4swTVNr6DvFfKaVyivXWgR4dvzz8pOCprZge4EHUh3VEYchgrYhwlJinz/BWt8EqAxomvwi8lk6TKeSa7jbtrMap0jgH8avqKOMRRigaWjhy6mkRgsKWWwFQf72ufEMkhLHgQNbSh+psKhFgUx0XwghHR+NIwOoiIPe7R77R97MWgWrL3zUFofKgHUkKKklrg9AJISqpvVu0+h3WuwlcmXaPkmsGScnZObU9m7poCGhAk4N7foHivUbEpF8HIJkpcbreSZtj0+HML2md2r0HhjJpDLoAFPsuE5LBIg7Gl0+W08Va28vNibmFn18yTqOhoCzDSLt8K4NZ5t24m0kCnJe0r8ULsB/5Mcaxl1VwyASJ0HCzdQIT6rDiu62lUxCExgJ4w08+AgVdxeJ9LjeQpyXrrrXgwCQmsVveXBSG6BwQAhlckH1pRAqabzvPQAnpcVZ99itMRI0IGOo8KzEFh1tuQVICJEtMuPbOduMuF6sCruL8eBZVnCqkeS+o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nsm/WRprRxdoGZq79m2+ck0KwWJvZE5wR6Iy5QsrBTC2kgGBqJsdbdQgoLMg?=
 =?us-ascii?Q?XA9OYncpvPEIfTzzuMXWcohJfEgm4dwDuqlHnbzEeGF/FMhtPNHA1O3X7TkA?=
 =?us-ascii?Q?9IUOZjJAO2k4KsMuWxwwCX3uLhNISE8wDu2NWjBQbYy9+opn2q1zKhEU3ksA?=
 =?us-ascii?Q?4v9ubIHb3Z43sQFD+g5XpSHus9e9saCMWoHsrCiPWlLEW/BH4QoC8eMgAADL?=
 =?us-ascii?Q?91NkHSrcaZzQGo9j5RfokJkZvmygSJbeQ1+vD0Zll1D0L7EVThuWXBhH5v1H?=
 =?us-ascii?Q?Vjsgc2iyN5CK7MXQRZUtTCWDoPHoE+VNQoruSdasArUKc1pl6BmLpZyyFGY1?=
 =?us-ascii?Q?x6hh1CwCHbqEzXZerLv94MdxFSuIW/VPSWPth/wlzPZ6GtjsMBvlLHjXKap6?=
 =?us-ascii?Q?1rz4I+F5ER9nZebJrNjGVuEVd1+urAdo37Z8BlRP5HZKGlwWqrcGxP/PLb0g?=
 =?us-ascii?Q?vNYd54Gnj2MCrYxS9pnZB5KvZWhwJNKB0l53Gz3rGPCgx4EO+3kurJQKvA8E?=
 =?us-ascii?Q?V2YCp/33Ftb/D5hI1zs2puhMZ3K8e+XbReDlOaM0OHbtP6boApbkH8Qy2ELn?=
 =?us-ascii?Q?/2JIbTJjEAF5TXyruIj6/uaSRiPEi6ofbDsqGERga6IjLC+GlOKnxE8M6sFP?=
 =?us-ascii?Q?Vjuu+SFtqMQ8/Q3sKHRi2zPQBJFS/Ozg7dp23DiiR06dHgFR60W2e1i7/Kfk?=
 =?us-ascii?Q?hdbgi4Teu2G4Cyhgk6jNfd1uUa7i0TSazij7Es4K9uLfJ7jSITfkNE+Nv8sD?=
 =?us-ascii?Q?5Dn1v9Z1S1UAJ9Cr22nagA/iXsfReN01dYZo8fLVywO62iPoC5ZloS4GpDQl?=
 =?us-ascii?Q?k6u8OO8O+StOleWdI+8mOFoYWiQY8RrcISl9bI1seXIroGqqH5VcdhjN5ul3?=
 =?us-ascii?Q?at5NiF9E8rttpAMS230h62UFKGnQhog5kQnRqbktUQxajBhGEv9bDpYeHYE/?=
 =?us-ascii?Q?I6wHVeEJEN3v2dfKp7+KrW1LYyxPxLvvscmUIcOa0Dj8TCDrQDQYO0lqFJBS?=
 =?us-ascii?Q?JyfLlT6FxJDqtct0pKizd1yc0TetnkjVs4erX6mCvfgcB0+flSSbRECQ9lc4?=
 =?us-ascii?Q?mnexqbYRiio4/lZ4DlfSQeGAfY3vYlEfFiYW0HYHkQ7xbrT+YMIiTiE/v+wz?=
 =?us-ascii?Q?fnOsJ3crFfIeP/kkwzf3zlyVKjRtRf0U4eODSIS6AKyUNbk7gyiQ/ktyLxuA?=
 =?us-ascii?Q?uZOcfOEYY2gfCh29Jop5XijWP8VqlYqWkBIRN74nbXIAZs0RzqpDnizjgtH6?=
 =?us-ascii?Q?ck9knbqplS6fvf99NCNaNCtgJotadAyen8LBGUSUOk3dFp39NsBVcLQeeLSs?=
 =?us-ascii?Q?/nVWD/whTPMfOBxGETxIuN5wf34iyRima7TyQN/fKAfViLd3CnuKA07UKTdw?=
 =?us-ascii?Q?yj0n67OJmfeqImq+iH+fJaOI0YlrZuATRrkghieERWAuvwXyOlBC6XchC5Ye?=
 =?us-ascii?Q?NVi//Xc+6aDusoKVtrbuClQtcAeB0KvXCHHIyRrGMVzNy4ERuGmZoeaFKowD?=
 =?us-ascii?Q?2VWKWA4ugDkZbBEpXAVVd4OihvZZ2c97FaDu+z86VlohGjTWk9suQT/82IkT?=
 =?us-ascii?Q?TxjEDw7+nfGM/V2h+Cf6nQDuNSRLIbzrFCK+YzuSo6kXbIr0RZOZi60hIZMX?=
 =?us-ascii?Q?McDVH0VqfUtTH6lbOHBE9E46kkJuf0DJL4NSmk4HoY7NFl0gOxz+gnElkCm7?=
 =?us-ascii?Q?ZjQvGnncUOu3/4lKae5ZmhYa2yuay+CAeyT+6OgXXVlurO8E/CpZ4uOQeyas?=
 =?us-ascii?Q?XZQnw9OehenvvID/QcT9odFcsiIkKzg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5052d621-82f0-428f-61d2-08dee8d17e90
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 15:46:00.3805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1Gv1bFDYTSHAh9BroWXtHI5sxVrf6KPOolnx6rn0XNf4dCkZpEHIEUgMdzU4fIeu+lsODIAfPYX144EnO6XbPc5AhQik/MBXEurXBlbF6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 15:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241859

Changelog: https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/=
NEWS

Release notes:
	* Feature: track TX pause storm events (-I -a)
	* Feature: update doc for ETHTOOL_PFC_PREVENTION_TOUT tunable
	* Feature: RX CQE coalescing params (-c, -C)
	* Feature: allow hex dump of all pages (-m)
	* Feature: qsfp: support newer SFF-8636 compliance codes (-m)
	* Feature: sfpid: support newer SFF-8636 compliance codes (-m)
	* Fix: document --disable-netlink in help output (-h)
	* Fix: add missing newlines in FEC output (--show-fec)
	* Fix: sfpid: fix 10G Base-ER module detection (-m)
	* Misc: clarify 10000baseCR link mode in man page

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_7.0.bb =3D> ethtool_7.1.bb}              | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_7.0.bb =3D> ethtool_7.1.bb} =
(94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.pat=
ch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index dd64ef1a0b..aafc9ea715 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 3f6c7d7d311bc3abac02b4a18da7c49850fc4de4 Mon Sep 17 00:00:00 2001
+From 7fbdc5cec5c5f2b89fd183543c3d35b5f7cc5530 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 06e2086..bca01e5 100644
+index 71b998e..79eff82 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.0, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.1, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_7.0.bb b/meta/recipes-ex=
tended/ethtool/ethtool_7.1.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_7.0.bb
rename to meta/recipes-extended/ethtool/ethtool_7.1.bb
index eb5b646701..d215b27b0a 100644
--- a/meta/recipes-extended/ethtool/ethtool_7.0.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.1.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/network/ethtool=
/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
=20
-SRC_URI[sha256sum] =3D "1a17b13dba2aef3897bb66c6140d88dc19e807b7948de3773d=
37320daae5266c"
+SRC_URI[sha256sum] =3D "21cc520ae5d881f01b0dcd6d26de4d52a64b24840bc2150daf=
778a235442e61d"
=20
 UPSTREAM_CHECK_URI =3D "https://www.kernel.org/pub/software/network/ethtoo=
l/"
=20

