Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AB0C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 03:32:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5575.1717644771906504138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 20:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6887b57725=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4561oQEB024338
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jun 2024 20:32:51 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f4gew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 20:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePfIMgOr4PBMs/QaUDQJ5+gt5jQVChwNIqKkjJo7Xmlv+lcy5vXyghrGVVfQnxHoH31CrrDTqEwJ6Wyd+gen/IFD1PlCnuxl28PYi6gqYkhwUF0FSFjnDIDeOtf5fIk1uTi5fIMhHQl9RKnLOH52aYsZh3qOzbN2sqnZgPuC/0U/w5gN4cujClP+CM6SE2JX5CBIMpu39Wc3xPx2y7Y2idpv7B0pVOlN4k2KAJVwL2Y+GgAIm9/ICE2W3bReWKeL2N5VvbY+fdhZiz5rSFojeRQuGXbcfgM9hRcemCltKaAntDl5k7txjqsYVinqG9MxJXNgxSOAW2z/c593ibWjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhrtvBafG0gdFNyv9gT8gFAK0z/uCCK1Ky3Nh8iyqgE=;
 b=Fxi3Jkze4zlUCh6q/5L4Pcz3GSOEaYlmsiU6s2nz283WDuvFcTjB9c1Mi4KBVNkSz+LNuy/PMtv7pZnAeEesct2dYmcPSjuWySX9v956GscHMeS3cpbB3TlPOlKKF+LARmbocQm70x9NLWRuisAZe36rYP9Uwm+xJjqKGV/baSL+X5Hba7ZSSS4xhx3gMeikndZXK+RPU+FYfwO7HPbIbSo6UiOzxk0p0s+kkh/zbi7sO1YBF6rURtoj24HuZPqaIjePV7T9UqOMG6CSG9RsXuH1d+RZpH95Wj89q3zyLDzYoDqmdv6F7YMjQZhyYQcCk8PNQPMVV/7gsRwsilI2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.31; Thu, 6 Jun 2024 03:32:43 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 03:32:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] dpkg: upgrade 1.21.4 -> 1.21.22
Date: Thu,  6 Jun 2024 11:32:33 +0800
Message-Id: <20240606033233.2634220-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7ad5df-d184-493f-ac76-08dc85d9530b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BUTH0qC9iTl4E0qZxfDEMe14aUJ39cCWEQTlxJoq5WAXE1dabbxH+YuRAb/Q?=
 =?us-ascii?Q?5TjgZK+cxhYtBlgOWnhqy5Pq9GNO4mbt5vYvznIhFnLh54pE3t2+e0bpkO6H?=
 =?us-ascii?Q?ue7Mvrksax4Hk8UcKStwUksrNMA3wjWR+GVUoKTSxg90diUgS+eN3YvlKxo6?=
 =?us-ascii?Q?SMLgLbq95i9W3U633/Y1eIxG/6C39Qn1XVDbMgCrEadsHC7srljkDsaSGNAy?=
 =?us-ascii?Q?6jA9BRnS0baa/jl4/cRT7pynDxOrfUb7nye3iYhe749jr/Fr8h62eIuEwUgP?=
 =?us-ascii?Q?+7fe8DWSPgy0DE2uXePLcK9VJob0yeZuCRn9J4nKUmGRN9vbSSLBh1O8LdkQ?=
 =?us-ascii?Q?fFygKxcnhu4m+tvcvaUH8m192/8BAkN+aOe3uwe7L/Oi9ZOPT2R8MNqeECrJ?=
 =?us-ascii?Q?23nYZCanPF8TZD4V8fLA+ha2FBdf7iaardBmhgYqfOFSPazcN6/3iRpCKQB9?=
 =?us-ascii?Q?mAX0j0nUopxESwKokYppRlnHVMpmqCT0hzhyCAlh2ZGKhacp0VuUpEksAFuC?=
 =?us-ascii?Q?E6v2kmmeFFMAMkBwV6ZDVrxq40eFqkxmByi6GvBygDWG+sH2uYlQmCc8EdvZ?=
 =?us-ascii?Q?FkjWyIbygpTyf72r+vStRPGUxbv+1L2x3Mhfg8bNmCp965sGkDjCy37KKZls?=
 =?us-ascii?Q?iA5KNVz3rFeYptD5tu4bFk6cw1lXWIuXvWr3i8dTr4i8vcrYNIaR59jNuRdi?=
 =?us-ascii?Q?9xQo3WbFCYxwxX2S5htoswwzpYhl7rjWfythN86P8+5edV3doXnwqJShsQ6J?=
 =?us-ascii?Q?YonhuATxRZsTocqVVeujC/uyS0hejeohtKQjh52ZNc5TBA69Gw1pZFZyv8TC?=
 =?us-ascii?Q?zqXPZgduf43j2L44aHQSH09KizU8diw4rRbg554JasLVJzJlN38FweO+ddRy?=
 =?us-ascii?Q?yVnKktbgaUP+VhaOfzkWkmvSeBIWFQnB5B/3XSB2RA6N0cPdgIZ1PoRG7OPW?=
 =?us-ascii?Q?Apz4SXoqOOSE1c4vIBeWLRakU8r7Ns2UFFdbg1u4+37id4yhoaBQoO1TwsUl?=
 =?us-ascii?Q?ACJ1DkHctlE0clMAlNaqYsegpoDDkTHvr4bIbSlV6EplHYzkKKuP8moBPPI+?=
 =?us-ascii?Q?XT+vus0lI2uojb6lQxvG8uR4HrOVmpaDQZXPwOfQOv4H5PJwOIgy6bYajzT7?=
 =?us-ascii?Q?+naXcqzYdDXLnfH9tohfk7HV5pmBwfrOjWsW6+ZX6m5cXKijt9K/XSOhnLOn?=
 =?us-ascii?Q?xu3uWhH7mozz7qXkEdAy1nf0n+YgCrJp5werW6ZTcG5IuFGKyVKirQcwPCl6?=
 =?us-ascii?Q?wm0kyvBedI/lOhG2SYqEfFUESvAtVmpXUVRoGXZsQKgCR1tqxujXa97I2Bth?=
 =?us-ascii?Q?B23y2mfKVoVEcPm+kSTUtFpYvN2+xdCSCS8vLSAzroPMOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BkhBtJrOgaPzOsvqq2OcyM/DBrorbr7NSc5NUJ6G2ZJ+b2E+XaLx61oR4Vp7?=
 =?us-ascii?Q?i/B4oaZRnxR5DHZb9OAEp1DGmAtpFx++RWCfgOWuvsskmsmWIIOi1Ke9IE3j?=
 =?us-ascii?Q?OkmOcUx2d9RdKImo9FEl+FbeyOUn/+5SIlni7Cu8KSq8zsGSKWERR6sPNhtW?=
 =?us-ascii?Q?ZhIgo2dpg4puhVql5dezaIxW1SpIOPveGoa2gjJiN3+XFpF3DkJpH4bcEqRG?=
 =?us-ascii?Q?zm2s7abL4lGdptveB1uMg/O7yqSN3HVXCeyKeOkIj4XulWHUFbR0qve08VGZ?=
 =?us-ascii?Q?3joAWfPVvweVjyup248y/f87cPKIvDY/ojkO6ryyx6zv/tnDOviVnZoGImWy?=
 =?us-ascii?Q?siDdkvYEfLjuWFOBbVvjMih2Dl+yRAFKkNUw2k1fZRYZ6slnldRdbIrjRFRE?=
 =?us-ascii?Q?VKgCirg+ebOeuWYfuGySI7J+xlIbWtGKJFn1wyJgFFfCezyOnatoIiViBLTJ?=
 =?us-ascii?Q?4p6yCGnTfxsbZkxyfohB40OaU7kV2D5DqHCl2GrISu9x/YgC3W+8R4M4bBQ/?=
 =?us-ascii?Q?zqPSFEkjcruN5R3uzb/OfxN8rcdp/mPrubfyFeAeZAmVlc0K/HqGU8k25eU8?=
 =?us-ascii?Q?ftdLX7QWRfGcDTOkHq/KF98cQHguB9rsBk9DYwzJio5KhYMSsyAH8VeiwpRX?=
 =?us-ascii?Q?QhcRxaKdWJslFB+imI3NYEOyoJv9whZqxlkfkmfExe74hGaUXkL2Ezmc7Te/?=
 =?us-ascii?Q?N+sETgPRm5uKMfL2r7q0lQS6Tx4yHFcQVdzRvCTUbYE8YCDY+RLUt08GnQVU?=
 =?us-ascii?Q?fY2T9trIgjZULYIkbyyxuHyvSgHMssEaS4Ky3kFnV8vKQDgNyWbiwQR6SnoL?=
 =?us-ascii?Q?R5Y4rhSzoT/+1xn6B8DBvrNAwl23f5JQd4whd64lJXiyb1owaMs/HuGwuDpe?=
 =?us-ascii?Q?7W29H0xMORKzwbFo1TZVRbGKD9fkS+pRyYjKMG659FBS3R8nbe6WtHZbOuLN?=
 =?us-ascii?Q?O+xlFm5V9OwZ+W2MzJ4oripX9Jz6/a21qLOh4H4r5RzoV8QNWz5XZDFL5HXW?=
 =?us-ascii?Q?ruqtLORBJehyvA6vAUj0GtNsCtrDkwHnVO1qeNMJeYO1HI1Xph9xbogs67wm?=
 =?us-ascii?Q?AmUUKKKTnGf2i2x19zkdS+VO5JDNB28EV5kkkFbjL520Yl8BBI6eZBWQzHWT?=
 =?us-ascii?Q?yTQ6AXds2zd2UZXk+kF28O7jnD4oLX8twJ8iGpsbTHNuK1GiqyVZ1BAjxRv/?=
 =?us-ascii?Q?H5JTxhofyvdLj3ny7RSVWIkOwxxxAhycbJKdcisgBb/3hnJhCZyeSORBnjd4?=
 =?us-ascii?Q?yqqEi3Vtlm5BzGRymT/jfnEW8NLf4GUqz4qv7jPaTZqqSG0otW83yf+o5v/H?=
 =?us-ascii?Q?kClibVN8HrhaZQP9sNsdOu+r22XaKxIP++j0uLYP0DTkmm+qTzkOnf8DFqPn?=
 =?us-ascii?Q?3DxwDBtjSTxlLCAaHfVFh4Pmq+bnlwOVyDLz8QRJojiHkDPdCvq2G19em1Sg?=
 =?us-ascii?Q?q7eejm+BrVKCvCNxHNe2jvew2VJ2RvnbnajAl8LROf7TDW7H+I22Rw2nnZ5M?=
 =?us-ascii?Q?VGfJ2N/71XApvWBBXOBjC0G2NyObYE+B+AUv7Yll2GqCX+PVeLM1r7qn05uK?=
 =?us-ascii?Q?Rd+TumtH5XEKl2EqvNa7qmSTg64GDSCCruMJ9csY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7ad5df-d184-493f-ac76-08dc85d9530b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 03:32:43.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHmjmDEeLvpANLglaiX7gov/gmDs9ICkaCfDpfgn4Ep1xvECaZPaY+Z2RBpE0T2RNeBdKdiW8BrKi1UFh33egg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-Proofpoint-GUID: CBXNeIfEOcQMujJYCiZ3j1UV2_LqngUw
X-Proofpoint-ORIG-GUID: CBXNeIfEOcQMujJYCiZ3j1UV2_LqngUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_08,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 03:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200382

ChangeLog:
https://salsa.debian.org/dpkg-team/dpkg/-/raw/1.21.x/debian/changelog

* Add new dependency libmd
* Update SRC_URI
* Refresh patch
* Drop backport patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc           |   4 +-
 ...ive-Prevent-directory-traversal-for-.patch | 328 ------------------
 ...s-expect-D-to-be-set-when-running-in.patch |  14 +-
 .../dpkg/{dpkg_1.21.4.bb => dpkg_1.21.22.bb}  |   5 +-
 4 files changed, 11 insertions(+), 340 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb => dpkg_1.21.22.bb} (86%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 0d17a98b80..b3e8c05d62 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "https://salsa.debian.org/dpkg-team/dpkg"
 DESCRIPTION = "The primary interface for the dpkg suite is the dselect program. A more low-level and less user-friendly interface is available in the form of the dpkg command."
 SECTION = "base"
 
-DEPENDS = "zlib bzip2 perl ncurses"
-DEPENDS:class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
+DEPENDS = "zlib bzip2 perl ncurses libmd"
+DEPENDS:class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native libmd-native"
 RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
 RDEPENDS:${PN}:class-native = ""
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
deleted file mode 100644
index d249d854fb..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
+++ /dev/null
@@ -1,328 +0,0 @@
-From 6d8a6799639f8853a2af1f9036bc70fddbfdd2a2 Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@debian.org>
-Date: Tue, 3 May 2022 02:09:32 +0200
-Subject: [PATCH] Dpkg::Source::Archive: Prevent directory traversal for
- in-place extracts
-
-For untrusted v2 and v3 source package formats that include a debian.tar
-archive, when we are extracting it, we do that as an in-place extraction,
-which can lead to directory traversal situations on specially crafted
-orig.tar and debian.tar tarballs.
-
-GNU tar replaces entries on the filesystem by the entries present on
-the tarball, but it will follow symlinks when the symlink pathname
-itself is not present as an actual directory on the tarball.
-
-This means we can create an orig.tar where there's a symlink pointing
-out of the source tree root directory, and then a debian.tar that
-contains an entry within that symlink as if it was a directory, without
-a directory entry for the symlink pathname itself, which will be
-extracted following the symlink outside the source tree root.
-
-This is currently noted as expected in GNU tar documentation. But even
-if there was a new extraction mode avoiding this problem we'd need such
-new version. Using perl's Archive::Tar would solve the problem, but
-switching to such different pure perl implementation, could cause
-compatibility or performance issues.
-
-What we do is when we are requested to perform an in-place extract, we
-instead still use a temporary directory, then walk that directory and
-remove any matching entry in the destination directory, replicating what
-GNU tar would do, but in addition avoiding the directory traversal issue
-for symlinks. Which should work with any tar implementation and be safe.
-
-Reported-by: Max Justicz <max@justi.cz>
-Stable-Candidates: 1.18.x 1.19.x 1.20.x
-Fixes: commit 0c0057a27fecccab77d2b3cffa9a7d172846f0b4 (1.14.17)
-Fixes: CVE-2022-1664
-
-CVE: CVE-2022-1664
-Upstream-Status: Backport [7a6c03cb34d4a09f35df2f10779cbf1b70a5200b]
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- scripts/Dpkg/Source/Archive.pm  | 122 +++++++++++++++++++++++++-------
- scripts/t/Dpkg_Source_Archive.t | 110 +++++++++++++++++++++++++++-
- 2 files changed, 204 insertions(+), 28 deletions(-)
-
-diff --git a/scripts/Dpkg/Source/Archive.pm b/scripts/Dpkg/Source/Archive.pm
-index 33c181b20..2ddd04af8 100644
---- a/scripts/Dpkg/Source/Archive.pm
-+++ b/scripts/Dpkg/Source/Archive.pm
-@@ -21,9 +21,11 @@ use warnings;
- our $VERSION = '0.01';
- 
- use Carp;
-+use Errno qw(ENOENT);
- use File::Temp qw(tempdir);
- use File::Basename qw(basename);
- use File::Spec;
-+use File::Find;
- use Cwd;
- 
- use Dpkg ();
-@@ -110,19 +112,13 @@ sub extract {
-     my %spawn_opts = (wait_child => 1);
- 
-     # Prepare destination
--    my $tmp;
--    if ($opts{in_place}) {
--        $spawn_opts{chdir} = $dest;
--        $tmp = $dest; # So that fixperms call works
--    } else {
--        my $template = basename($self->get_filename()) .  '.tmp-extract.XXXXX';
--        unless (-e $dest) {
--            # Kludge so that realpath works
--            mkdir($dest) or syserr(g_('cannot create directory %s'), $dest);
--        }
--        $tmp = tempdir($template, DIR => Cwd::realpath("$dest/.."), CLEANUP => 1);
--        $spawn_opts{chdir} = $tmp;
-+    my $template = basename($self->get_filename()) .  '.tmp-extract.XXXXX';
-+    unless (-e $dest) {
-+        # Kludge so that realpath works
-+        mkdir($dest) or syserr(g_('cannot create directory %s'), $dest);
-     }
-+    my $tmp = tempdir($template, DIR => Cwd::realpath("$dest/.."), CLEANUP => 1);
-+    $spawn_opts{chdir} = $tmp;
- 
-     # Prepare stuff that handles the input of tar
-     $self->ensure_open('r', delete_sig => [ 'PIPE' ]);
-@@ -145,22 +141,94 @@ sub extract {
-     # have to be calculated using mount options and other madness.
-     fixperms($tmp) unless $opts{no_fixperms};
- 
--    # Stop here if we extracted in-place as there's nothing to move around
--    return if $opts{in_place};
--
--    # Rename extracted directory
--    opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tmp);
--    my @entries = grep { $_ ne '.' && $_ ne '..' } readdir($dir_dh);
--    closedir($dir_dh);
--    my $done = 0;
--    erasedir($dest);
--    if (scalar(@entries) == 1 && ! -l "$tmp/$entries[0]" && -d _) {
--	rename("$tmp/$entries[0]", $dest)
--	    or syserr(g_('unable to rename %s to %s'),
--	              "$tmp/$entries[0]", $dest);
-+    # If we are extracting "in-place" do not remove the destination directory.
-+    if ($opts{in_place}) {
-+        my $canon_basedir = Cwd::realpath($dest);
-+        # On Solaris /dev/null points to /devices/pseudo/mm@0:null.
-+        my $canon_devnull = Cwd::realpath('/dev/null');
-+        my $check_symlink = sub {
-+            my $pathname = shift;
-+            my $canon_pathname = Cwd::realpath($pathname);
-+            if (not defined $canon_pathname) {
-+                return if $! == ENOENT;
-+
-+                syserr(g_("pathname '%s' cannot be canonicalized"), $pathname);
-+            }
-+            return if $canon_pathname eq $canon_devnull;
-+            return if $canon_pathname eq $canon_basedir;
-+            return if $canon_pathname =~ m{^\Q$canon_basedir/\E};
-+            warning(g_("pathname '%s' points outside source root (to '%s')"),
-+                    $pathname, $canon_pathname);
-+        };
-+
-+        my $move_in_place = sub {
-+            my $relpath = File::Spec->abs2rel($File::Find::name, $tmp);
-+            my $destpath = File::Spec->catfile($dest, $relpath);
-+
-+            my ($mode, $atime, $mtime);
-+            lstat $File::Find::name
-+                or syserr(g_('cannot get source pathname %s metadata'), $File::Find::name);
-+            ((undef) x 2, $mode, (undef) x 5, $atime, $mtime) = lstat _;
-+            my $src_is_dir = -d _;
-+
-+            my $dest_exists = 1;
-+            if (not lstat $destpath) {
-+                if ($! == ENOENT) {
-+                    $dest_exists = 0;
-+                } else {
-+                    syserr(g_('cannot get target pathname %s metadata'), $destpath);
-+                }
-+            }
-+            my $dest_is_dir = -d _;
-+            if ($dest_exists) {
-+                if ($dest_is_dir && $src_is_dir) {
-+                    # Refresh the destination directory attributes with the
-+                    # ones from the tarball.
-+                    chmod $mode, $destpath
-+                        or syserr(g_('cannot change directory %s mode'), $File::Find::name);
-+                    utime $atime, $mtime, $destpath
-+                        or syserr(g_('cannot change directory %s times'), $File::Find::name);
-+
-+                    # We should do nothing, and just walk further tree.
-+                    return;
-+                } elsif ($dest_is_dir) {
-+                    rmdir $destpath
-+                        or syserr(g_('cannot remove destination directory %s'), $destpath);
-+                } else {
-+                    $check_symlink->($destpath);
-+                    unlink $destpath
-+                        or syserr(g_('cannot remove destination file %s'), $destpath);
-+                }
-+            }
-+            # If we are moving a directory, we do not need to walk it.
-+            if ($src_is_dir) {
-+                $File::Find::prune = 1;
-+            }
-+            rename $File::Find::name, $destpath
-+                or syserr(g_('cannot move %s to %s'), $File::Find::name, $destpath);
-+        };
-+
-+        find({
-+            wanted => $move_in_place,
-+            no_chdir => 1,
-+            dangling_symlinks => 0,
-+        }, $tmp);
-     } else {
--	rename($tmp, $dest)
--	    or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
-+        # Rename extracted directory
-+        opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tmp);
-+        my @entries = grep { $_ ne '.' && $_ ne '..' } readdir($dir_dh);
-+        closedir($dir_dh);
-+
-+        erasedir($dest);
-+
-+        if (scalar(@entries) == 1 && ! -l "$tmp/$entries[0]" && -d _) {
-+            rename("$tmp/$entries[0]", $dest)
-+                or syserr(g_('unable to rename %s to %s'),
-+                          "$tmp/$entries[0]", $dest);
-+        } else {
-+            rename($tmp, $dest)
-+                or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
-+        }
-     }
-     erasedir($tmp);
- }
-diff --git a/scripts/t/Dpkg_Source_Archive.t b/scripts/t/Dpkg_Source_Archive.t
-index 7b70da68e..504fbe1d4 100644
---- a/scripts/t/Dpkg_Source_Archive.t
-+++ b/scripts/t/Dpkg_Source_Archive.t
-@@ -16,12 +16,120 @@
- use strict;
- use warnings;
- 
--use Test::More tests => 1;
-+use Test::More tests => 4;
-+use Test::Dpkg qw(:paths);
-+
-+use File::Spec;
-+use File::Path qw(make_path rmtree);
- 
- BEGIN {
-     use_ok('Dpkg::Source::Archive');
- }
- 
-+use Dpkg;
-+
-+my $tmpdir = test_get_temp_path();
-+
-+rmtree($tmpdir);
-+
-+sub test_touch
-+{
-+    my ($name, $data) = @_;
-+
-+    open my $fh, '>', $name
-+        or die "cannot touch file $name\n";
-+    print { $fh } $data if $data;
-+    close $fh;
-+}
-+
-+sub test_path_escape
-+{
-+    my $name = shift;
-+
-+    my $treedir = File::Spec->rel2abs("$tmpdir/$name-tree");
-+    my $overdir = File::Spec->rel2abs("$tmpdir/$name-overlay");
-+    my $outdir = "$tmpdir/$name-out";
-+    my $expdir = "$tmpdir/$name-exp";
-+
-+    # This is the base directory, where we are going to be extracting stuff
-+    # into, which include traps.
-+    make_path("$treedir/subdir-a");
-+    test_touch("$treedir/subdir-a/file-a");
-+    test_touch("$treedir/subdir-a/file-pre-a");
-+    make_path("$treedir/subdir-b");
-+    test_touch("$treedir/subdir-b/file-b");
-+    test_touch("$treedir/subdir-b/file-pre-b");
-+    symlink File::Spec->abs2rel($outdir, $treedir), "$treedir/symlink-escape";
-+    symlink File::Spec->abs2rel("$outdir/nonexistent", $treedir), "$treedir/symlink-nonexistent";
-+    symlink "$treedir/file", "$treedir/symlink-within";
-+    test_touch("$treedir/supposed-dir");
-+
-+    # This is the overlay directory, which we'll pack and extract over the
-+    # base directory.
-+    make_path($overdir);
-+    make_path("$overdir/subdir-a/aa");
-+    test_touch("$overdir/subdir-a/aa/file-aa", 'aa');
-+    test_touch("$overdir/subdir-a/file-a", 'a');
-+    make_path("$overdir/subdir-b/bb");
-+    test_touch("$overdir/subdir-b/bb/file-bb", 'bb');
-+    test_touch("$overdir/subdir-b/file-b", 'b');
-+    make_path("$overdir/symlink-escape");
-+    test_touch("$overdir/symlink-escape/escaped-file", 'escaped');
-+    test_touch("$overdir/symlink-nonexistent", 'nonexistent');
-+    make_path("$overdir/symlink-within");
-+    make_path("$overdir/supposed-dir");
-+    test_touch("$overdir/supposed-dir/supposed-file", 'something');
-+
-+    # Generate overlay tar.
-+    system($Dpkg::PROGTAR, '-cf', "$overdir.tar", '-C', $overdir, qw(
-+        subdir-a subdir-b
-+        symlink-escape/escaped-file symlink-nonexistent symlink-within
-+        supposed-dir
-+        )) == 0
-+        or die "cannot create overlay tar archive\n";
-+
-+   # This is the expected directory, which we'll be comparing against.
-+    make_path($expdir);
-+    system('cp', '-a', $overdir, $expdir) == 0
-+        or die "cannot copy overlay hierarchy into expected directory\n";
-+
-+    # Store the expected and out reference directories into a tar to compare
-+    # its structure against the result reference.
-+    system($Dpkg::PROGTAR, '-cf', "$expdir.tar", '-C', $overdir, qw(
-+        subdir-a subdir-b
-+        symlink-escape/escaped-file symlink-nonexistent symlink-within
-+        supposed-dir
-+        ), '-C', $treedir, qw(
-+        subdir-a/file-pre-a
-+        subdir-b/file-pre-b
-+        )) == 0
-+        or die "cannot create expected tar archive\n";
-+
-+    # This directory is supposed to remain empty, anything inside implies a
-+    # directory traversal.
-+    make_path($outdir);
-+
-+    my $warnseen;
-+    local $SIG{__WARN__} = sub { $warnseen = $_[0] };
-+
-+    # Perform the extraction.
-+    my $tar = Dpkg::Source::Archive->new(filename => "$overdir.tar");
-+    $tar->extract($treedir, in_place => 1);
-+
-+    # Store the result into a tar to compare its structure against a reference.
-+    system($Dpkg::PROGTAR, '-cf', "$treedir.tar", '-C', $treedir, '.');
-+
-+    # Check results
-+    ok(length $warnseen && $warnseen =~ m/points outside source root/,
-+       'expected warning seen');
-+    ok(system($Dpkg::PROGTAR, '--compare', '-f', "$expdir.tar", '-C', $treedir) == 0,
-+       'expected directory matches');
-+    ok(! -e "$outdir/escaped-file",
-+       'expected output directory is empty, directory traversal');
-+}
-+
-+test_path_escape('in-place');
-+
- # TODO: Add actual test cases.
- 
- 1;
--- 
-2.33.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 75ae848264..5e52427caf 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -1,4 +1,4 @@
-From dd11ed66640f79143e42d778b58fdd5a61fb5836 Mon Sep 17 00:00:00 2001
+From 115fed94be9c61d2a8de21e7d169b5872e9ebd09 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
@@ -12,21 +12,21 @@ ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
 ---
- src/main/script.c | 54 +++--------------------------------------------
- 1 file changed, 3 insertions(+), 51 deletions(-)
+ src/main/script.c | 53 +++--------------------------------------------
+ 1 file changed, 3 insertions(+), 50 deletions(-)
 
 diff --git a/src/main/script.c b/src/main/script.c
-index abe65b6..0edb8f1 100644
+index b4f369dfa..559a49cc5 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
-@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
- static const char *
+@@ -97,58 +97,11 @@ static const char *
  maintscript_pre_exec(struct command *cmd)
  {
+ 	const char *instdir = dpkg_fsys_get_dir();
 -	const char *admindir = dpkg_db_get_dir();
 -	const char *changedir;
 -	size_t instdirlen = strlen(instdir);
--
+ 
 -	if (instdirlen > 0 && in_force(FORCE_SCRIPT_CHROOTLESS))
 -		changedir = instdir;
 -	else
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
similarity index 86%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
index 7ef6233ee4..04bcc93321 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.21.x \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -14,11 +14,10 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
-           file://0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "5563bdb608b3413639b69f1c76567cb66ff1a961"
+SRCREV = "48482e4f16467e05a08aa3b3b8048e08f0024609"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


