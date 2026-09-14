Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6054FC88E75
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:03:16 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20796.1789394588595371618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 07:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qQfYWJoB;
 spf=pass (domain: est.tech, ip: 52.101.83.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upUx8t40nW70qC+8S4mjOGe0kpQc9oHFUzmxfc+fXy+uYCzPMZYi06iC2A6y7ohvDngEp0c2LpOsPXjtEWjJKom9DuYwXUXTF1MQc8cUAUfs/2VbdWen4dH63RBex9UWMmQo8HIOv6A8uqqmqAt82Oi/5creywOS7Rd6yKAYzbzW5k0MMwUn229q8z8EHepIZCPFMLcdPv/v0DqVWdpnFKO4Nb+7J/NA8qN1arEANM2Wg+eD6gMW/sGU9xwgL7r4jUN/Vy5RAYLdHqgxhaYWpIacnJvW0pMnWH8LWq9JVyUIJ0+az4B8M8/+MvWeyL6W5wOf2VR1YfsHDP0Odc6nVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEFk3TiQS6K6Cc7ZGZLpzBgjd+GoCO/KkczGoVeNCLw=;
 b=omoVvGIB4Ftcd4VSL63z/mLlxNFnDZ/Dqgkd/dlvZiCYPsVcAvRXyrBnI3fwTorTOKYV72PtmHe6x1vpiEhhQXiM5tL6AuZJ+IKAAEY3MXkLWNtnVG4DINFeGvx7Wvy1Q3T73DHstLyZoGUdS+QRTVOaMSpCS7HFf9YwlBlK0FK/ezKO/elgZrvtPYsaPInpTBD71EAOjjIqj6d82SrVKlY0lhKeasYIFTxY1UxtIYBt5wTFx5JewbfgOps0mjcXJGWxA+pT0lxRj+l4lNQJ+3Z9w7iccCXsTibLfb4pjEGoP8d4cUrTHvQNReD3LuSw1xYfnhk0FIA/XExPIfdmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEFk3TiQS6K6Cc7ZGZLpzBgjd+GoCO/KkczGoVeNCLw=;
 b=qQfYWJoBMOUnJhLDP6tRPWLStOd0WbYDhb/L+ZAUR2SyOA1U6qA376Z3WJVzwpt1ncLAfQI1/f30o0UeP//UPMn83XmYQz87nA/+IQgbxcTcIknlRUCXBjRUOPJ6gQIMAyeE1z390j7nGAeiCer/VTfUPdvUuP2xTIfhE4G/rhbTzcd0SyYVDuP92Ht66gw2+O7DGIJUnee/Aqi0+GVgXGqL46mN4H9CI5R1zhP2Ldx+4NHjg8kQF8r+Ff/VlUmIjFut5IYB8Q6aVtsImyElyLs4OedMt3M/ww+J5DJ+QkV03D0O6Ww6Twrk25pf5KzGWFGcoD6vAwb9a+vgeQ1/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by MIWP189MB224194.EURP189.PROD.OUTLOOK.COM (2603:10a6:290:ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:03:03 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 14:03:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: Upgrade 2.88.3 -> 2.90.0
Date: Mon, 14 Sep 2026 16:03:01 +0200
Message-ID: <20260914140301.88530-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|MIWP189MB224194:EE_
X-MS-Office365-Filtering-Correlation-Id: 07962741-e20d-4210-c11a-08df1268e496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|1800799024|11063799006|56012099006|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	8216Hk+yTQh/PcGwg3ahjBcSfc1t7cr89GyuwD91y62bhdgx/X7qtYY631aHU0ltUXrMtZwJUviS1jI8xy5Q/DtgmI7gnqK0J+xLysdOmfxpFJXy8gSeYioHczS0ti8J46SkKDmOYp+9LJliecPwZrQlYg5q8nd9dWMOer0I2RaBErLjJ8S8UCHbc8fxXznKhyU/dype2ZN5R8DZgnbBWRCCRLMWsT9d2b9RZDgrcj0i00mDDyEp9/ooD3ll+Es9uidtUCryfvdra5vb5IX7xERmcTHspCII9fm6kwJEedW7OGONt9gKCZxMvwVTxCT1W41bhw8tqetr8w9k9+FVn2pbnmuJUfw5ekTzigcflLB8xtlKwWF+X4URvIvbhWfK3LEqYXR2eSCL7EdvpVHbrNdydeg7Q1XmTbeiaMbHJRV82g6yMPnomWhPX924lR6+lthxQWyC809vZR0ELy1pbok1SzRW006rOi0fJoTnnzqj8NNztfX1Q03BsIopP0E3AR5UMbPkawkOAoSdksMpzUjdH4yYN5UYRGOyrxLJ8ppqh7GIX6Qehr36iJ2YPQuylT+7dLCV6L1DEh73hOJu/QzgFXYZ/Lg+dKWZtu9cSUA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yb9OPw52BWp84BFoSjAal+Eh9NQLwpC4DNtu/o5uYnL/N5qkN0Kzi0XFeBr9?=
 =?us-ascii?Q?2i67xIh/GWD+Cwj/qfgFBlZOxOxs2ZWfkS1EoBHE0G9ScfhIvsDQ4XjQnxFf?=
 =?us-ascii?Q?Gxb3YN4G9mBResBlXf7WZutolduKDt/nvgktXgHgPAXeNgKqbXZPH7T2p8Je?=
 =?us-ascii?Q?fZSEICsHscTyFTQiKql8fS+FBxObxkpq0wPyT/2eDGz9n7DSrFApCGTiXz0B?=
 =?us-ascii?Q?k4/wYdcv7WWhKHpJBlHEcwdNoeChClibPX45JmhYxdmgkk/jIxiqGOwWgE25?=
 =?us-ascii?Q?EuBR7NHi80rhl6TuExwJ+ijqdfB58tSPXFkmkyAUU5Nsr3oGatHPZDC6LVVj?=
 =?us-ascii?Q?fPyMXMqa/lIuseOrOfVw/P0/XWsaVb01gah7s67pqtxTEtTADQ7skfMrUQdi?=
 =?us-ascii?Q?64+vzFEQCNs9FxjmCXXy1kHTGtFb5tEpw/2hCM0i/IQaFH5JnTlse7dPGIGV?=
 =?us-ascii?Q?184W5faI8F5uwFw1Gcefm9F3G9nVH/8oKP8kj3nhtbsWpqEsGUH0+8eovN9a?=
 =?us-ascii?Q?dBDFI8wD+8OVhiZ4ya77Zl7KppSAoOke1iypJd3vPX2rOeONZXrRLd2PxzCx?=
 =?us-ascii?Q?57lweKqqN8U9v+tWm5iGsC3hT9g73PgXjabCV5VAGw7c5kZmFI4E7ogPCwqa?=
 =?us-ascii?Q?QlvM45tJOkbpsP0ZsB6Bz0fPfPyDwn6Rc/1uUYprE6dYxiVg9Ep499t4Ugsv?=
 =?us-ascii?Q?DVrNh6NaeNPw9zh7STA1kr062gYjOZ9o39ICcwqn2jgGYVCNDD7lSfYagnXp?=
 =?us-ascii?Q?PbdDUwCWZKbrFfQvvGQKqFsf7ZXL9cgrw2kyr4i6tYjNYTfRDVVbqUF9SWqN?=
 =?us-ascii?Q?pW25uMmI+is7N0wmIbzK3dNrkgoc3rdxHO82y6T2DNO+UZwYaf/ET4cZulov?=
 =?us-ascii?Q?nBjV11SPa1Mc3kdO3YK/6qTJ+CVLpkWSDgrLS6AriTY3NgN2I6qF3PmfDRyU?=
 =?us-ascii?Q?/spKdsk5Wiq5DQfNUuq3JDo/tsf6Cu2j6ieBasi9zyhI8rc9/0xtNenGTKpT?=
 =?us-ascii?Q?cNznK1splvr8acpHjeHFIe7z/TCaXFwOyqVFfK6YQxb9sgnXZWf+kXQ3XJTg?=
 =?us-ascii?Q?Nw83kHmvAdJSzmpgpNS+N760GYzhpb/aQi/5L9VUOYHL6QlyBJY8zUeIQLlY?=
 =?us-ascii?Q?Y9PlkpR6p+oAndTWjupHxjIKVMObxzba/kSC6Q2cbjEeTLOY7Cp2tXYrz1Zp?=
 =?us-ascii?Q?4KjS7pW9Y8EhJ1cSthGDtjfW3OF+Prcj65sI/B3AJ7sf+koSs0YWQ7NQgObN?=
 =?us-ascii?Q?K6fD+AfkhtoVNa0sqXEVjeX0umVEO7LDT2kPUZyBxv3sxuRJQRow5If6VZPp?=
 =?us-ascii?Q?XlO1VXlHeHpbAtLfMHCHu9WPljI4rLJiHie0dy08U5kVJpnl0C86HT81DNfP?=
 =?us-ascii?Q?Ejh6ZtjI3C8+pvSIf04+3sPdL8LtI0M/mUL+fYkaXyHl66DLfnZIleN3iz7A?=
 =?us-ascii?Q?9DDfNFLnRjKiqoQ7lvChKNsEqNdDc4ehWanPVNl/Z7thlX6bLke4Oal1Q7oO?=
 =?us-ascii?Q?MqYg+P2RLOIcEAwBfdqXn56VGhlgG58DFWvjAW9Wc5QuQiwtk0S0fNTQvDdv?=
 =?us-ascii?Q?4D07Cy3ypkehYCP8XL7IO9t6OOArbS0tiRU+MxyJ4Fpg0/Z2yqRflGvjAQQX?=
 =?us-ascii?Q?V8eCmlKpx7flXytH5KzAfcZjSQJAWRWJHBU7VlsWCvZqUyrCt5w0ybki64mB?=
 =?us-ascii?Q?7wlgMHCCpmo8DGwgbTCZ1F8cXd1+m1vqkpIXwkkKMVHGu3/G1Sw1d8PBLTLh?=
 =?us-ascii?Q?+WCKfeAZuyhEyRDE/b9p1GKm5mkYimoTp5OKMgDp3lpKBWJmK8o9EXF9pCnv?=
X-MS-Exchange-AntiSpam-MessageData-1: H6dnWRAxJ50r9SnGC4gVbbanQFR+D8LVYY0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 07962741-e20d-4210-c11a-08df1268e496
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:03:03.2946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4VrMKO8OVFvinzsBAYxLJJrJlJc1mE+Ahtd6DoF7N5rgOrNX2WVfUSnQ9X7e7JBm/vaKDwm7sy59C/NxEahiQd0Ai5LXp10N8W4QDZAAks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWP189MB224194
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 14:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245785

NEWS:
https://gitlab.gnome.org/GNOME/glib/-/releases/2.90.0
https://gitlab.gnome.org/GNOME/glib/-/releases/2.89.4

- Remove below patches where are part of release now
  CVE-2026-58016-1.patch
  CVE-2026-58016-2.patch
  0001-gio-tests-services-Fix-installed-service-file-using-.patch
  0001-gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-a.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...t-write-bindir-into-pkg-config-files.patch |  2 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  2 +-
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 35 -------
 ..._DEFINE_TYPE-parent_class-variable-a.patch | 44 ---------
 ...on-Run-atomics-test-on-clang-as-well.patch |  2 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  2 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 92 ------------------
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 96 -------------------
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../files/skip-monotonic-time-similar.patch   |  6 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.3.bb =3D> glib-2.0-initial_2.90.0.bb} |  0
 ...{glib-2.0_2.88.3.bb =3D> glib-2.0_2.90.0.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  8 +-
 18 files changed, 15 insertions(+), 286 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-service=
s-Fix-installed-service-file-using-.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_=
DEFINE_TYPE-parent_class-variable-a.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.3.bb =3D> glib-2.=
0-initial_2.90.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.3.bb =3D> glib-2.0_2.90.0=
.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into=
-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-writ=
e-bindir-into-pkg-config-files.patch
index c22ef9fdb3..41b2dfb5c4 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-co=
nfig-files.patch
@@ -1,4 +1,4 @@
-From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
+From 2ccf2016cae7dad83cbc3f00e3fefa3ca16ae707 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config file=
s
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uc=
libc-Linux.patch
index bd7a04cccf..2b1a2134c8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux=
.patch
@@ -1,4 +1,4 @@
-From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
+From 8ec44223e9cdedc4ca5b0c2b806c02c215f07b45 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch
index 8f6fd98472..6968f725ed 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-lib=
exec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
+From e18fd4c362b3e23ec10ac1c223ad9c5ee6b5993a Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-=
Remove-the-warning-about-deprecated-paths-in-schemas.patch
index d64576b11e..022094bb17 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprec=
ated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
+From b920bbb775210dc81fff3e12260ee0cd9d4e6ef1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 579999fd6d..402859149a 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-o=
ut-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
+From d15b734a85ff94c8b80ccb1ad22154741140152e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-i=
nstalled-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-=
gio-tests-services-Fix-installed-service-file-using-.patch
deleted file mode 100644
index 755e51cdd3..0000000000
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installe=
d-service-file-using-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ed5956d0000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 30 Jul 2026 11:28:36 +0000
-Subject: [PATCH] gio/tests/services: Fix installed service file containing
- build path
-
-The refactoring in !5259 changed the installed service file's
-configure_file() to use the build output as input instead of the
-original .in template. Since @installed_tests_dir@ is already
-substituted in the build output, the installed version gets the
-build directory path instead of the install prefix.
-
-Use the .in template directly as input for the installed version.
-
-Closes #4011
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ed=
5956d]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- gio/tests/services/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.bui=
ld
-index 1111111..2222222 100644
---- a/gio/tests/services/meson.build
-+++ b/gio/tests/services/meson.build
-@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
-     # Build a second copy of the service file for the installed
-     # version of the tests.
-     installed_service_file =3D configure_file(
--      input: service_file,
-+      input: service_file_name + '.in',
-       output: service_file_name + '.to-install',
-       configuration: installed_cdata,
-     )
diff --git a/meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_DEFINE_=
TYPE-parent_class-variable-a.patch b/meta/recipes-core/glib-2.0/files/0001-=
gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-a.patch
deleted file mode 100644
index 642e02550b..0000000000
--- a/meta/recipes-core/glib-2.0/files/0001-gtype-Mark-the-G_DEFINE_TYPE-pa=
rent_class-variable-a.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1567250294e9666747ee63f5c6364bbceadd300b Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Sun, 30 Aug 2026 11:39:28 +0530
-Subject: [PATCH] gtype: Mark the G_DEFINE_TYPE parent_class variable as un=
used
-
-clang 23 added -Wunused-but-set-global, which fires on the
-type_name##_parent_class variable that _G_DEFINE_TYPE_EXTENDED_BEGIN_PRE
-emits whenever a type never chains up to its parent:
-
-  error: variable 'my_thing_parent_class' set but not used
-  [-Werror,-Wunused-but-set-global]
-
-Projects that promote the unused-but-set group to an error (pango, for
-one) now fail to build with clang 23, and they cannot fix it on their
-side because the variable comes from this macro.
-
-Annotate it G_GNUC_UNUSED, the same treatment the adjacent
-get_instance_private helper already gets.
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
-Fixes: #4038
-
-Upstream-Status: Backport [1567250294e9666747ee63f5c6364bbceadd300b]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gobject/gtype.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gobject/gtype.h b/gobject/gtype.h
-index 1d383a8ea..de5188f9f 100644
---- a/gobject/gtype.h
-+++ b/gobject/gtype.h
-@@ -2295,7 +2295,7 @@ static void     type_name##_class_intern_init (gpoin=
ter klass) \
- static void     type_name##_init              (TypeName        *self); \
- static void     type_name##_class_init        (TypeName##Class *klass); \
- static GType    type_name##_get_type_once     (void); \
--static gpointer type_name##_parent_class =3D NULL; \
-+G_GNUC_UNUSED static gpointer type_name##_parent_class =3D NULL; \
- static gint     TypeName##_private_offset; \
- \
- _G_DEFINE_TYPE_EXTENDED_CLASS_INIT(TypeName, type_name) \
---=20
-2.43.0
-
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-ato=
mics-test-on-clang-as-well.patch
index 3f9b9e4741..bbb85c2355 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang=
-as-well.patch
@@ -1,4 +1,4 @@
-From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
+From ebb658f1387978e88eee317920c15fae59d11ba1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-=
meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 0912859698..abf45bd809 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd=
-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
+From b4b512340934801a004b69d37c83846ca63afc34 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not=
-hardcode-python-path-into-various-tools.patch
index c032d575eb..3ad5ab3f6d 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-int=
o-various-tools.patch
@@ -1,4 +1,4 @@
-From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
+From dedb9b25edc15c63c4068b87fb6ae2e205ab30da Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
deleted file mode 100644
index f6883ba85c..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <no=
de>
- element nesting
-
-The check for whether a `<node>` element in D-Bus introspection XML was
-nested correctly was broken. `<node>` elements can only be at the top
-level, or nested immediately within another `<node>` element.
-
-Fix the check and add some unit tests for it.
-
-Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
-uses example XML strings adapted from their report.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3932
-
-CVE: CVE-2026-58016
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c9=
da977c178fbfc0e4caf99f9fdf5dc433d6fcc2]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- gio/gdbusintrospection.c        |  2 +-
- gio/tests/gdbus-introspection.c | 33 +++++++++++++++++++++++++++++++++
- 2 files changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index df5daa3..78a63e2 100644
---- a/gio/gdbusintrospection.c
-+++ b/gio/gdbusintrospection.c
-@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
-   /* --------------------------------------------------------------------=
-------------------------------- */
-   if (strcmp (element_name, "node") =3D=3D 0)
-     {
--      if (!(g_slist_length (stack) >=3D 1 || strcmp (stack->next->data, "=
node") !=3D 0))
-+      if (stack->next !=3D NULL && strcmp (stack->next->data, "node") !=
=3D 0)
-         {
-           g_set_error_literal (error,
-                                G_MARKUP_ERROR,
-diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspecti=
on.c
-index cb99c94..05710d4 100644
---- a/gio/tests/gdbus-introspection.c
-+++ b/gio/tests/gdbus-introspection.c
-@@ -300,6 +300,38 @@ test_extra_data (void)
-   g_dbus_node_info_unref (info);
- }
-=20
-+static void
-+test_invalid (void)
-+{
-+  const struct
-+    {
-+      const char *xml;
-+      GMarkupError expected_error_code;
-+    }
-+  vectors[] =3D
-+    {
-+      { "", G_MARKUP_ERROR_EMPTY },
-+      { "<node><interface name=3D\"I\"><method name=3D\"M\"><node><interf=
ace name=3D\"I2\"></interface></node></method>", G_MARKUP_ERROR_INVALID_CON=
TENT },
-+      { "<node><interface name=3D\"I\"><signal name=3D\"S\"><node><interf=
ace name=3D\"I2\"><signal name=3D\"S2\"></signal></interface></node></signa=
l>", G_MARKUP_ERROR_INVALID_CONTENT },
-+      { "<node><interface name=3D\"I\"><property name=3D\"P\" type=3D\"s\=
" access=3D\"read\"><node><interface name=3D\"I2\"></interface></node></pro=
perty>", G_MARKUP_ERROR_INVALID_CONTENT },
-+      { "<node><interface name=3D\"I\"><method name=3D\"M\"><arg type=3D\=
"\"><node><interface name=3D\"I2\"><method name=3D\"M2\"></method></interfa=
ce></node></arg>", G_MARKUP_ERROR_INVALID_CONTENT },
-+    };
-+
-+  for (size_t i =3D 0; i < G_N_ELEMENTS (vectors); i++)
-+    {
-+      GDBusNodeInfo *node;
-+      GError *local_error =3D NULL;
-+
-+      g_test_message ("Testing parsing of %s gives an error", vectors[i].=
xml);
-+
-+      node =3D g_dbus_node_info_new_for_xml (vectors[i].xml, &local_error=
);
-+      g_assert_error (local_error, G_MARKUP_ERROR, (int) vectors[i].expec=
ted_error_code);
-+      g_assert_null (node);
-+
-+      g_clear_error (&local_error);
-+    }
-+}
-+
- /* ----------------------------------------------------------------------=
------------------------------ */
-=20
- int
-@@ -317,6 +349,7 @@ main (int   argc,
-   g_test_add_func ("/gdbus/introspection-generate", test_generate);
-   g_test_add_func ("/gdbus/introspection-default-direction", test_default=
_direction);
-   g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
-+  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-=20
-   ret =3D session_bus_run ();
-=20
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta=
/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
deleted file mode 100644
index 3acb16f75d..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH] gdbusintrospection: Add some assertions before array
- dereferences
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The state handling inside the D-Bus introspection XML parser is
-complicated, and it=E2=80=99s possible that these dereferences of the
-`len - 1`th element might get reached when the array is empty.
-
-Make failures like that more debuggable by adding an assertion on the
-length beforehand.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Helps: #3932
-
-CVE: CVE-2026-58016
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/65=
6ad4582cb1d7a7fa8bafe3ce8aec6aa3c17da0]
-
-Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
----
- gio/gdbusintrospection.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 78a63e2..4df8e87 100644
---- a/gio/gdbusintrospection.c
-+++ b/gio/gdbusintrospection.c
-@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
-+  g_assert (data->annotations->len > 0);
-   return data->annotations->pdata[data->annotations->len - 1];
- }
-=20
-@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
-+  g_assert (data->args->len > 0);
-   return data->args->pdata[data->args->len - 1];
- }
-=20
-@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
-+  g_assert (data->out_args->len > 0);
-   return data->out_args->pdata[data->out_args->len - 1];
- }
-=20
-@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
-+  g_assert (data->methods->len > 0);
-   return data->methods->pdata[data->methods->len - 1];
- }
-=20
-@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
-+  g_assert (data->signals->len > 0);
-   return data->signals->pdata[data->signals->len - 1];
- }
-=20
-@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
-+  g_assert (data->properties->len > 0);
-   return data->properties->pdata[data->properties->len - 1];
- }
-=20
-@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
-+  g_assert (data->interfaces->len > 0);
-   return data->interfaces->pdata[data->interfaces->len - 1];
- }
-=20
-@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
- {
-   if (create_new)
-     g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
-+  g_assert (data->nodes->len > 0);
-   return data->nodes->pdata[data->nodes->len - 1];
- }
-=20
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta=
/recipes-core/glib-2.0/files/relocate-modules.patch
index 6c982ca735..d5d97f3a4a 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
+From c41b9b46ab9ada1c3a3e0d63ef1a0535a3c92457 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native bu=
ilds
diff --git a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.p=
atch b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
index 2ccefb6f3f..9cb03bc65c 100644
--- a/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-monotonic-time-similar.patch
@@ -1,6 +1,6 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From f663a6986d82001cc6f60c3625c3dc532651dcb1 Mon Sep 17 00:00:00 2001
 From: Pratik Farkase <pratik.farkase@est.tech>
-Date: Tue, 5 Aug 2026 08:00:00 +0000
+Date: Wed, 5 Aug 2026 08:00:00 +0000
 Subject: [PATCH] Skip /monotonic-time-ns/similar test
=20
 The test_similar test compares g_get_monotonic_time() and
@@ -19,7 +19,7 @@ Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
  1 file changed, 1 deletion(-)
=20
 diff --git a/glib/tests/monotonic-time.c b/glib/tests/monotonic-time.c
-index 1234567..abcdef0 100644
+index 04ff898..dae0533 100644
 --- a/glib/tests/monotonic-time.c
 +++ b/glib/tests/monotonic-time.c
 @@ -153,7 +153,6 @@ main (int argc, char *argv[])
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/rec=
ipes-core/glib-2.0/files/skip-timeout.patch
index 7bc83adf6b..86e2883a27 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
+From 8f34800e6f3ad201b3fd6f6b333f32c45b2df591 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.90.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index d80cf6f267..51d3827757 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -225,7 +225,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
=20
 PE =3D "1"
=20
-SRC_URI +=3D "\
+SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEB=
N}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=3Darchive \
            file://run-ptest \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schema=
s.patch \
@@ -236,16 +236,12 @@ SRC_URI +=3D "\
            file://0010-Do-not-hardcode-python-path-into-various-tools.patc=
h \
            file://skip-timeout.patch \
            file://skip-monotonic-time-similar.patch \
-           file://CVE-2026-58016-1.patch \
-           file://CVE-2026-58016-2.patch \
-           file://0001-gio-tests-services-Fix-installed-service-file-using=
-.patch \
-           file://0001-gtype-Mark-the-G_DEFINE_TYPE-parent_class-variable-=
a.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidf=
d-features-on-native-g.patch \
                               "
=20
-SRC_URI[archive.sha256sum] =3D "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8=
b8ce72fdf79bbbdc9b383b"
+SRC_URI[archive.sha256sum] =3D "17d15cac2af80a33271127408e0abc2748eb297c59=
5c2a26409e81e14e7d1b8f"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curren=
t
 # build (using siteinfo) and add them to EXTRA_OEMESON.

