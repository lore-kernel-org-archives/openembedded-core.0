Return-Path: <jst@mbs-solutions.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CC5C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:08 +0000 (UTC)
Received: from FR6P281CU001.outbound.protection.outlook.com (FR6P281CU001.outbound.protection.outlook.com [52.101.171.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28.1790346542816276088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 07:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mbs-solutions.de header.s=selector1 header.b=A5chdBy8;
 spf=pass (domain: mbs-solutions.de, ip: 52.101.171.98, mailfrom: jst@mbs-solutions.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri8nPMhr+h0p4r6vQFqYvYj4+vuW5tDswiyxo1zNWD6tsMf3KDE9kxmGNF31aLyS2ciDsAEylFDwPARhUCXHrE/l+oRHvnUmkszWJSmqZFwUBmXdCpctEpdrLp0YUCSck68PTG8lIdUMH25aUU6EdzzxM8P1YIBNYn0PyFbAHXYLmybqKcjmx0y7BXU5wQcsE4auRJtwd8hWFZp5YAUVgu8zMopzEf0r/KTevZbUZNA/PgTjAJQ3h2eya6enTC8HR0JPtysK+zWqYQ5d0YBVD6ndz6wYatTqpNcDYvv9qIjxK8GDpIGD0l25t35ageIvZ0TaQqWgtizQslXJMV4uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwMrGTftm6y3azD4E+Ft+AUimIjBSSyHz8JPEedBuxI=;
 b=kT2YqpDvNREPcdWDAdB3cdOlZGxeQ1XKHTzmBBPDeM/qWItuvxMEZqbpV5XDQsxQIJ06VV2//e59uhIbSWxIg29hLB/z2g5G+rXSgWfjAn0hRiIDspr0OzlUbHth3ONiM08zQE4hw+GsGGsopq88jINg+KJhnpO6gl553ET3Z/qZhW3GVgPLCx5LbCpGKeiZIP2HGjZldsYrC91E+r1bge//ZPS1Scs7P3ufhM/DxJ1logVvpbqeA8oydxVUHVtSa8pEkkQ0ZAmX2DkLEY3YCP6k1u/xfWpm/uCKSiODbHZV+OBLu4DjH1q3UuJLBmNZKsdXO/mF9EhrpE8GPHmTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mbs-solutions.de; dmarc=pass action=none
 header.from=mbs-solutions.de; dkim=pass header.d=mbs-solutions.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mbs-solutions.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwMrGTftm6y3azD4E+Ft+AUimIjBSSyHz8JPEedBuxI=;
 b=A5chdBy8NfyPg7ME7PzzmYcCdk6ehVM51wOgIbwo5uShLBFW5obg7tKb8LtCeZMleKLGHDjOuN+T7MGj70P5U3qyI1+mHNFNX9vcI7uNNTdbLQVggVooBRdzE5qQXFo+OWWLxuFCDOvKXEFGvcD8HJn8hLf0kZRrNqAGZSAeFpYVyx8DznEFhF8gBhPCNHFhUhen+tbsGnURf+P6egCGD73X/r47lXXRAbcWjZSFUY+TL4ELmzXdBx03FZWC7ceQiA4OPnk8640YEbjW+VrFfdtBS381FZ8vKvO4i6LQtT0e2pvnN8DxXazAtFB8BVgQ2o77ORiDCfFu1OhQOxhZHg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mbs-solutions.de;
Received: from BE1P281MB2289.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:3a::7) by
 FR6P281MB6119.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d2::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Fri, 25 Sep 2026 14:28:58 +0000
Received: from BE1P281MB2289.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1a7e:ff31:a95f:d534]) by BE1P281MB2289.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1a7e:ff31:a95f:d534%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:28:57 +0000
From: =?UTF-8?q?Jan=20Strater-B=C3=BCddefeld?= <jst@mbs-solutions.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Jan=20Strater-B=C3=BCddefeld?= <jst@mbs-solutions.de>,
	Ross Burton <Ross.Burton@arm.com>
Subject: [PATCH] compiler-rt: Use specific arm architecture instead of 'arm'
Date: Fri, 25 Sep 2026 16:28:20 +0200
Message-ID: <20260925142820.853791-1-jst@mbs-solutions.de>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To BE1P281MB2289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:3a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2289:EE_|FR6P281MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cd828d-0ba5-4070-f1c9-08df1b1155af
X-ETR: Bypass spam filtering for authenticated sender 'mbs-solutions.de'
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10070799003|10067099003|56012099006|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	U3OJBwSrL85KWDO4AuydvcU0Z+pLzAYcNxECryyffueXG4kWaAWQIK8T5KFmpLiSa+ViWYIc5oSa9ZYCkW5rFi++eTpZw2PFCkR4PmsIkmrS15fzUtnhXRwxZlfLb7m1RcRUeAAy1MWHtDmyXqwVeG6za2KAn34e57MSCmIZ0p7wDbmwqbQcS/cMYngQzlqmWFna9jF6aQl9HwfnXprj58gA1UODfHtXqXk9b5GFB8hehvMJrQJU97sKGmLs14uHkTWqAKSLgGKsBYiXvHEWAG/i09LMUg8HwaF9Vu8h3qO3QPXWH6zmDA1gilb5NsERYmCKPSgLuBui34kAEFq4WMYXj0ZjS2BV3XT9wIN9MLh5+XvZZBPb+4iN6XFTXKA93KzhvRV2PK7oLQ6sP8t3UahGULS9GnWTmw8FQk+vFCH3H4STVguj2GTVvQD+esQ2OmdyTX/MulSFDPyGaH/92uB4SVRMGe32jDoetV11V7eKNutysqx2XMkci+kMX9m+FFCjww7zh/h7nWCY/zbln88FcNx1v0W3gA9cY353veA8QJBAXggWxsthHg5f+GFHJQWEOOIDNzPjglVzE4QWIonqtbUhhYKNKQSbc4TZBHJ6Wc+B0+oGsOu7vYFpw5T4Ob8hcseMYBlqRtD03UfLBdD3lduO3JAXFdW2Q1OopGE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2289.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10070799003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xEICaD4MRrHMyZeSSKEX+0K2yg/JO0hkmPah0N5eYjK8w7IdWXtaUl/nGv6W?=
 =?us-ascii?Q?PFuU5IGj3d0Ty45oO+G75vOvuPVx+sAygtFsGtzQ9zxidr0goApEllqjnVqI?=
 =?us-ascii?Q?WU+d6SUzox2MMnLuEKINJ8whqkOsa058eDPui65mNOgRs453tf4yIfyVQCuy?=
 =?us-ascii?Q?VFSSCAOPUM1D0euqAmxyghaT6VNAN3EPQHykFcpUFeTX0VJrEEUMm24mempF?=
 =?us-ascii?Q?5NyOZvEygBXPX9ELcJtN7n80N21Y23978ZXfHA3p1AV2oiuZXPTaqVBKwHjl?=
 =?us-ascii?Q?DTmU8mWsKLjp3kfA2DsQ/jaSD6KXSlf8xioWpZuiCsSrFH74GGrmrx4ct+/e?=
 =?us-ascii?Q?S5zVCnZFxD2kESycXD9LM6c+7rfyLHG2lq2BIlZ5tf74Ggqa3Yqm2jHFETdm?=
 =?us-ascii?Q?AXrm5SpneIITAAUW0mQe33dV0kMkPYhJOco4mdW3jTm85LRl5nSPLZslr5wA?=
 =?us-ascii?Q?inCSE6QOnIybUnB8GR4y2Xk0sRZnx58ria3rlIzepiptamxxiz+QDZedUpeW?=
 =?us-ascii?Q?ZTAsNKN23URgKdVvCt3uDmbs+mIs3Q3VeOjCDobQpsa1DTh10JKcnO8kAZ/6?=
 =?us-ascii?Q?faQeoyK5MhuiZOAdqHP0SthO+ZZk2YfQsLm6BgN37HNw+adGeJ7P18q4GXSK?=
 =?us-ascii?Q?gZWn6jtuDvFd4a1JLAQOgz3YKFhvqVqTiVOc00MSL65RbfNjiw1u4m1Geafi?=
 =?us-ascii?Q?i06pixhfvgx5b6p6bVcit2yxOmfpVsL6e5uSQtAMjO20Er/oZMWdmm0s/q1S?=
 =?us-ascii?Q?m588ZajeGM+T6ckXtCeVcmS6znQMSyiQ27lf3OnNpBVYwJHQKa5/XszSeLrM?=
 =?us-ascii?Q?qf0aUB2xEwfskXnmTAqrXFQm5aHih7UYvdhsM8jaAr1Vsn6dbDy2TADU214Q?=
 =?us-ascii?Q?5HNtTQ5dZT5JEbXqZI/aEfO/NBfjm/B12Dd6COn0ZIIsVLMESxlx/eN9PV+z?=
 =?us-ascii?Q?7QNjGs/6OrHbwbsd1zYYBzgsanOtg5rZeeIKYIHy1z0msfdDc4rkEwJlzXmB?=
 =?us-ascii?Q?3ka+dSl7KU7/DL9jmY0UQXkBrLIBSCwR8pSKOOfyPtJGCabPmvoRpg1j1Wob?=
 =?us-ascii?Q?O8nMxyVsNUzz7CnxHsuEqwHeUJ6DZnyTtP4FESdzRKRaOYc3TPap3+AxlXy3?=
 =?us-ascii?Q?bSr9u1aRZ9PQSmFRUjzFCx9MX7jQrFzXyoFbirJe2T/IxslwT2V07zQw7XSp?=
 =?us-ascii?Q?Rb55KInETLvp+jWc2JkLrDAFAmGg4A04uGfHkDzBWVeiRxyrl5AaGoAmlD8p?=
 =?us-ascii?Q?F+7pyaZLmUKxRul3tUbnan5Zg+n9MAEsCRu/VEqp8feOzXh67LKI7kxp5cJW?=
 =?us-ascii?Q?I/TpKvbUjQ+OqG/aPOfyf6KlnBg0YsG0h1Bp88HM5Be73biZ2Jk8HlZXr+p8?=
 =?us-ascii?Q?1OVpnJ3302RCyDQrP4kNbm1pxFxe3iaXdFxfET0chVbCN79KoVw8z6GeG2Im?=
 =?us-ascii?Q?1Ii3qmzXMXH/cvPl4CrBi9CFwNEY7qrYH/LL4qM11nk+lr+uua41NUbMH8Ij?=
 =?us-ascii?Q?51dfkoVbbc4TuCztz9ehjTOOm6TpGXMe+C/A5EmFIjjqbPJq+fcvPhqmMlu1?=
 =?us-ascii?Q?vs557vbMG0vb1M9tOfTIICG9Fkl59MNSmhqjLH7r6Jtmz64dRKZ4Pqs2kIzS?=
 =?us-ascii?Q?ed9P13Z8l51aRrtHi+zv7nNVGTzs5ZEDL1ThfWS3MW9VSER7DU6k1YlMLPgQ?=
 =?us-ascii?Q?O6Bzcy8J/C6yPG4RHfYNIixEPjxyxbsCdisNSHVojl2mFMiofHDVePjrCAS+?=
 =?us-ascii?Q?lIsRhl9Cc3D0W4yDNAH9lSLUoXBYJ4MXOQ6NvyOYaDfNG9Eu0lCjKErPRwYB?=
X-MS-Exchange-AntiSpam-MessageData-1: 3yvUFoenmyR1kw==
X-OriginatorOrg: mbs-solutions.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cd828d-0ba5-4070-f1c9-08df1b1155af
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2289.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:28:57.8715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 778c8b78-467e-4379-adca-743b91174c8a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSiVc8ahQZ/N9Md/W2QrAZBYojgZoP3XSBlDDfRjZijpW3aMFWhox2OEDsw/To3zQiCMO/xrX7J/vrGarlFb0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB6119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 14:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246621

Fixes [YOCTO #16424]

The build system of compiler-rt can auto-detect some architectures like
'armv6m' via the `-march` compiler flag.
For other targets, the arch type to build for must be set via the target
triple `CMAKE_C_COMPILER_TARGET`.
Before this commit, the arch type was simply 'arm'.

This commit also removes setting the variable
`COMPILER_RT_DEFAULT_TARGET_ARCH` because it is overridden anyway.

AI-Generated: Uses GitHub Copilot

Signed-off-by: Jan Strater-B=C3=BCddefeld <jst@mbs-solutions.de>
Cc: Ross Burton <Ross.Burton@arm.com>
---
 .../recipes-devtools/clang/compiler-rt_git.bb | 22 +++++++++++--------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-=
devtools/clang/compiler-rt_git.bb
index a265c2aa93..d6c06302c2 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -49,13 +49,18 @@ TOOLCHAIN =3D "clang"
 TOOLCHAIN_NATIVE =3D "clang"
=20
 def get_compiler_rt_arch(bb, d):
-    if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, =
d):
-        return 'armv5te'
-    elif bb.utils.contains('TUNE_FEATURES', 'armv4 thumb', True, False, d)=
:
-        return 'armv4t'
-    elif bb.utils.contains('TUNE_FEATURES', 'arm vfp callconvention-hard',=
 True, False, d):
-        return 'armhf'
-    return d.getVar('HOST_ARCH')
+    import re
+   =20
+    tune_args =3D d.getVar('TUNE_CCARGS_MARCH') or ''
+
+    match =3D re.search(r'-march=3D(\S+)', tune_args)
+    arch =3D match.group(1) if match else d.getVar('HOST_ARCH')
+
+    return arch
+
+def get_compiler_rt_target(bb, d):
+    host_sys =3D d.getVar('HOST_SYS')
+    return get_compiler_rt_arch(bb, d) + '-' + host_sys.split('-', 1)[1]
=20
 INSTALL_VER ?=3D "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native =3D "${@oe.utils.trim_version("${PV}", 1)}"
@@ -78,7 +83,6 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
                   -DCOMPILER_RT_BUILD_SANITIZERS=3DOFF \
                   -DCOMPILER_RT_BUILD_MEMPROF=3DOFF \
                   -DCOMPILER_RT_BUILD_LIBFUZZER=3DOFF \
-                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@get_compiler_rt_a=
rch(bb, d)} \
                   -DLLVM_ENABLE_RUNTIMES=3D${RUNTIMES} \
                   -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=3DOFF \
@@ -86,7 +90,7 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
                   -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
                   -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
                   -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
-                  -DCMAKE_C_COMPILER_TARGET=3D${HOST_SYS} \
+                  -DCMAKE_C_COMPILER_TARGET=3D${@get_compiler_rt_target(bb=
, d)} \
                   -DCOMPILER_RT_INSTALL_PATH=3D${nonarch_libdir}/clang/${I=
NSTALL_VER} \
                   ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "${LLVMLI=
BGCCOPTS}", "", d)} \
 "
--=20
2.55.0


