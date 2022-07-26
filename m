Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5F0C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 04:33:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2949.1658810017870352274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 21:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PfTbww1R;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4206887e6d=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26Q4Sq0R020470
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 21:33:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=yzKr9nRRdvSVM0Y52kSaicvXd7h61/hPosVy1WIrX9w=;
 b=PfTbww1R/sLL1snJXOLxxHQX3EjLdUlwaaYKpCzeiD+KlMTKAWJjJ0bi1QO9ncpBRnQX
 rQuIoicDa0sSw3VwVPRmupl5KtryJiyw/hVg1tU+DInHknTFOedUL2K5Y4d5jnNBSewW
 /MAIm1/CZZW/Q5sumGZXWdKoqtRzLvVZl+4KKfr4tbI+OHYkLiGtpcyxI6+Cs9HDwQVy
 M/1HEjVzBzRcQwE9JltLITd6o8CyN0tTslhtjM6ZgfLuDtyH1/tB/+b+GwGwLHlwzXQf
 n2AOa7PC4X9063Mtu6B1ZoH+GFtGGyakdSfL863hTvJmkXnt11SXEF/vioJ3rtNZZjNx Nw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgc951y6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 21:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeU4gqeIqrpbBbg6kUF1cow1e0/7iqOvBaUP/Dz4Q5/AxZkx2/O39EdCC1mq0BMqlKa8Ib9xznWuDVQciG/T3HppASUpXH1c7B8d1OEivAALtyonVx+xPSAhIajvCQi2rNsN7djdV9b4xzq7b+TQ003ZNmHp9GlOfKwkfTIkx6OZ5Cpyna9xwQ12CIJBeeMMC9QYxtE2M8E1oMgbIhUw2SYxpi/dxHS2W/0rg4DVAOMmj7zfpyHju93RXAvR3Mr+xiRoHJvPITO8RXvZ48VLqS7NVHhgp5T6eyXYio1kxES7M0Oh9PhSeQewtb/M6DK8dKhVVZoS+Ob2huNaa2TLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzKr9nRRdvSVM0Y52kSaicvXd7h61/hPosVy1WIrX9w=;
 b=I32PAxibbm52cfgjIfwDEY+1mj94vOWAeyjGAQDmHkUZmch1tibC8jjCHr0PEWBjDGrJOVfD6seZMH66H6AKSeGRPCChwf9gzyYbhd8G8PeZwhWCV5GPeW8Ic8Vqrk2zpUR/Qr7VF+f56Q0kZB7zdF6/Y92Y32Hl+/P7k6KgKaG69MrZumt8RrjX3RNexWE9movWIshBRcAkMkj9YUMaBUv9xlSfpXEVCIzpGXn1LNd9SDIgkuoTaKbQ6UW7/nml1Q+xwUsIyA/SJ+RcdOJAdXgytR62EIA9mm3WtVGxVWUdWGFItEgRKB/oqcnFd+U9Rl3Lzr51v4+mclFDYhRFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:163::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Tue, 26 Jul 2022 04:33:32 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 04:33:32 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] dpkg: fix CVE-2022-1664
Date: Tue, 26 Jul 2022 00:33:07 -0400
Message-Id: <20220726043307.26786-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::42) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8cf7024-642c-4a8f-2557-08da6ebfff0e
X-MS-TrafficTypeDiagnostic: BN0PR11MB5695:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VzMgo165yhfjMt6rVc8k4wGyR0UtQFum4crKuPWXLZlVfL4ozsEZXvS6vpJ3agpkt4by7jgqSMnb15B3yuOUdIrAnog1zVzpOAUQnp5fK+aS11gn1+HWCLZFo1fqLXrtPHg5a4ym1UPscoJU+pcLSSMsvjSjsL6Ok/pxEqjEa0bUXbuFqpRUPf0qBqLI51P43To4Wz2Q/A+8F1p0hISqkaG4YY3TWuDpfejeVOlfQFOK+lbey4hgdFkyfU670oprcs/M/q8h/Zq5ZmnBRXFX3ceOh9gdcAViLJwIqw0FCvHvlcZdvbuhl5jGGYNAe6YRMBX5rjlrcEaG13n4CYg9GkILExW3Vtw34RqNX7ahhTzzcYJjC900aUXUWxH8iNeE+gqU0XA2EcYGvItnqsoJ1lsJcY8yq7ewmIFvIgtfdWPpVPEAG8m9FoD+yHlTYixsKA8sjdcv7H6TSRZccUUQiLurZhhSBH6cuBtPn26+hlc7L+jk9Wk0tEnqvGbeCnNkU0fNWv0SdqUU9CwOtpeeBHF6f0gvQOwQxB6sEeof0GptUP5Hjcu4S7Ocx7XBRLFEADdhQLlqkgTi2UW5ATiLb3C6s8fBppYOIEya4454zmp20UC+I87YOLZ2zHEzrTMF64w+WoW0hJWFpg4twjJ2zpRk/yduEtmJZJgwNlYsI9OJCXONh3EYO7wPV7TwYK6XdqydHC2XfJu6FGbvJewzuJKVcsuTYbf69IC+9Rn6DmRKuVSVDhbojFs9OMg+o01GZDVl7Kmtr5bjOc0tilFI8npXcoFqoj4EPfUkUjQl6FY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(2616005)(66556008)(66476007)(66946007)(8676002)(186003)(1076003)(26005)(6512007)(2906002)(6666004)(52116002)(41300700001)(6506007)(8936002)(478600001)(6486002)(36756003)(44832011)(30864003)(5660300002)(316002)(83380400001)(86362001)(38350700002)(6916009)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4ptFXBm6uKv1q59l+4JO/KIS2RiDHgmuE4KMn+6wHmsvzBogJvTuzJZVoika?=
 =?us-ascii?Q?s9ouzyIygjUa1MDNQsn0LfQvYsvnvNF3/y3cP+SNWa9xf4u4eFtqr3yiSLdZ?=
 =?us-ascii?Q?fQIQcbvMl0qPitmXOK7PT7pLcDgSVw+PsxjAAaXGDncb9TmJY1dtNl0gQnwQ?=
 =?us-ascii?Q?tkb/j89p9RB+zLdSZ4aOEeuS1rK8o2GCnh2Ff8iCGyZr5Ljxmlm0Gzwi3Dhz?=
 =?us-ascii?Q?hzL/GPZthV63oFlDLRK7ZEedohU6E6U/4fEEStMCuImwQuuJOUvcgzC4zzCE?=
 =?us-ascii?Q?wJBy/8tFg1kHfcJSTXjMs87VUJPdRNAOf67pJaC3CiYMK2N24NbQ8wnhRE/q?=
 =?us-ascii?Q?1B8VXRxq6h4ytGADA1ShG1k8pGxLUfmAddsJueLt3NY6af/am5Nticij3W90?=
 =?us-ascii?Q?FpwfiPT4Q0z0yI4xsgMT18gSq3Sm0KkJvZf+QzWCS4gsmk7nL91CUAIPS0CI?=
 =?us-ascii?Q?rQVzJ0XYHU9BaTPdZZziFAUI3IvVXQi7Nn1r2+sf1XGUwaFTxL6Yd/AZ7zVn?=
 =?us-ascii?Q?58PGqyEh9f8orpgz+IeG2DRQiwQTpJhX4DTanYNzNEboLozTrkE+bvCWj2gz?=
 =?us-ascii?Q?UjJStivoW5SNQlgc9+LNSmt4p9T8qfumOktaJi0UHNfWguu/R8odxZYR5qr6?=
 =?us-ascii?Q?eMF3b3Aku/PtOD8508M5/wh5CU+18XX1OsT0RoRBMZRxHkVQlEQnFowTpER4?=
 =?us-ascii?Q?vwW/MCJGq/ey/E8F8vlT+N928wycHzng5oAcRB42arj/NdvgoBbUZE8pF3Yu?=
 =?us-ascii?Q?QGflwsxJaBSZ4LqikDHTHJsFX/iSngl41krLSORyRMcJzM1+oS/9Hf17Gyne?=
 =?us-ascii?Q?27CnT2bpptg7kpeYopaPCwuoXf5GTnycMGCKWkDPi+19qdJ7MDbJbwM0QokJ?=
 =?us-ascii?Q?5Ji+IDAXrT+QBeBwKKNJKhoSHtRcMFMIvyFjniQ8AcvvwpmStEDru8Fd9YK6?=
 =?us-ascii?Q?YbwkkqDynatoEclK42mBojasVOeE4DeQ/B/59LGVGLwbX6qPWdnAOkMo1TMS?=
 =?us-ascii?Q?P+P6vIplcIyA6zUNYvJMa9yqLzscZFqn6IFWm8QtwO0U98tbkpbMyog/pvaN?=
 =?us-ascii?Q?xYETSI6edU+Z4CqADScsDz7AH2IQ/wA2WLywlSfLhmxe11Sgj1a5oH2R++Rf?=
 =?us-ascii?Q?z7kyuzoKes36SWyZw2S1MifitItzJ0HJXeAMfDg+vRaT+a3rIi5wCqrabxid?=
 =?us-ascii?Q?scAyQoyPXDLxsKPLpQB3DQUwm4Zy+sxTwa+83KFVg3v6Q6pgaYneRZzXVopH?=
 =?us-ascii?Q?CiUah9GuJips+WEn4FN5V0ra/FEHIozQdm0bYPonkU1oK3X2G3LBGoyOPI8n?=
 =?us-ascii?Q?crhAz0hdCdFthgvtC8J2OCR7gtYdrzBV4ZkB+AwG/f2hE9ggG3vopFqUvfWo?=
 =?us-ascii?Q?+MiZZf6JdQem1ipQxQ7RlA7wgjEhVu6kdeOUzF0ayuPBHuYyAIK3sbrgIBk6?=
 =?us-ascii?Q?/WUT1xrAs/Z8zzMEUo7n7HpOdYPlcULWfQ7Vf1O/EYAl6tgvONsJTm62yttm?=
 =?us-ascii?Q?K3SaeBYzZZTLfUR9DStNJ8YBvqleE7XoOcw6wrJjaKqXmnUWfS0zeguOTV7/?=
 =?us-ascii?Q?KCz1MYZRkVMNK8sBn04XHyw1KJ0/rwTVyQjiom4057FkierQDIce/aN2ReU4?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8cf7024-642c-4a8f-2557-08da6ebfff0e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 04:33:32.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OAA16Eph110bcOOMxOV08VVARiFc7PxkUfC0EcVgYrTtm7pkyiV7pgueKSvWpXSt66Ha3A4NAex9ki9Z2XbBqfH5x81QEPnrAWG7EE3zXLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
X-Proofpoint-GUID: GRUtCon7Wxr7BpwTkGLdoqe08sroBQjB
X-Proofpoint-ORIG-GUID: GRUtCon7Wxr7BpwTkGLdoqe08sroBQjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_13,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 04:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168492

Backport patch to fix CVE-2022-1664.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...ive-Prevent-directory-traversal-for-.patch | 328 ++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.21.4.bb     |   1 +
 2 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
new file mode 100644
index 0000000000..d249d854fb
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
@@ -0,0 +1,328 @@
+From 6d8a6799639f8853a2af1f9036bc70fddbfdd2a2 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Tue, 3 May 2022 02:09:32 +0200
+Subject: [PATCH] Dpkg::Source::Archive: Prevent directory traversal for
+ in-place extracts
+
+For untrusted v2 and v3 source package formats that include a debian.tar
+archive, when we are extracting it, we do that as an in-place extraction,
+which can lead to directory traversal situations on specially crafted
+orig.tar and debian.tar tarballs.
+
+GNU tar replaces entries on the filesystem by the entries present on
+the tarball, but it will follow symlinks when the symlink pathname
+itself is not present as an actual directory on the tarball.
+
+This means we can create an orig.tar where there's a symlink pointing
+out of the source tree root directory, and then a debian.tar that
+contains an entry within that symlink as if it was a directory, without
+a directory entry for the symlink pathname itself, which will be
+extracted following the symlink outside the source tree root.
+
+This is currently noted as expected in GNU tar documentation. But even
+if there was a new extraction mode avoiding this problem we'd need such
+new version. Using perl's Archive::Tar would solve the problem, but
+switching to such different pure perl implementation, could cause
+compatibility or performance issues.
+
+What we do is when we are requested to perform an in-place extract, we
+instead still use a temporary directory, then walk that directory and
+remove any matching entry in the destination directory, replicating what
+GNU tar would do, but in addition avoiding the directory traversal issue
+for symlinks. Which should work with any tar implementation and be safe.
+
+Reported-by: Max Justicz <max@justi.cz>
+Stable-Candidates: 1.18.x 1.19.x 1.20.x
+Fixes: commit 0c0057a27fecccab77d2b3cffa9a7d172846f0b4 (1.14.17)
+Fixes: CVE-2022-1664
+
+CVE: CVE-2022-1664
+Upstream-Status: Backport [7a6c03cb34d4a09f35df2f10779cbf1b70a5200b]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ scripts/Dpkg/Source/Archive.pm  | 122 +++++++++++++++++++++++++-------
+ scripts/t/Dpkg_Source_Archive.t | 110 +++++++++++++++++++++++++++-
+ 2 files changed, 204 insertions(+), 28 deletions(-)
+
+diff --git a/scripts/Dpkg/Source/Archive.pm b/scripts/Dpkg/Source/Archive.pm
+index 33c181b20..2ddd04af8 100644
+--- a/scripts/Dpkg/Source/Archive.pm
++++ b/scripts/Dpkg/Source/Archive.pm
+@@ -21,9 +21,11 @@ use warnings;
+ our $VERSION = '0.01';
+ 
+ use Carp;
++use Errno qw(ENOENT);
+ use File::Temp qw(tempdir);
+ use File::Basename qw(basename);
+ use File::Spec;
++use File::Find;
+ use Cwd;
+ 
+ use Dpkg ();
+@@ -110,19 +112,13 @@ sub extract {
+     my %spawn_opts = (wait_child => 1);
+ 
+     # Prepare destination
+-    my $tmp;
+-    if ($opts{in_place}) {
+-        $spawn_opts{chdir} = $dest;
+-        $tmp = $dest; # So that fixperms call works
+-    } else {
+-        my $template = basename($self->get_filename()) .  '.tmp-extract.XXXXX';
+-        unless (-e $dest) {
+-            # Kludge so that realpath works
+-            mkdir($dest) or syserr(g_('cannot create directory %s'), $dest);
+-        }
+-        $tmp = tempdir($template, DIR => Cwd::realpath("$dest/.."), CLEANUP => 1);
+-        $spawn_opts{chdir} = $tmp;
++    my $template = basename($self->get_filename()) .  '.tmp-extract.XXXXX';
++    unless (-e $dest) {
++        # Kludge so that realpath works
++        mkdir($dest) or syserr(g_('cannot create directory %s'), $dest);
+     }
++    my $tmp = tempdir($template, DIR => Cwd::realpath("$dest/.."), CLEANUP => 1);
++    $spawn_opts{chdir} = $tmp;
+ 
+     # Prepare stuff that handles the input of tar
+     $self->ensure_open('r', delete_sig => [ 'PIPE' ]);
+@@ -145,22 +141,94 @@ sub extract {
+     # have to be calculated using mount options and other madness.
+     fixperms($tmp) unless $opts{no_fixperms};
+ 
+-    # Stop here if we extracted in-place as there's nothing to move around
+-    return if $opts{in_place};
+-
+-    # Rename extracted directory
+-    opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tmp);
+-    my @entries = grep { $_ ne '.' && $_ ne '..' } readdir($dir_dh);
+-    closedir($dir_dh);
+-    my $done = 0;
+-    erasedir($dest);
+-    if (scalar(@entries) == 1 && ! -l "$tmp/$entries[0]" && -d _) {
+-	rename("$tmp/$entries[0]", $dest)
+-	    or syserr(g_('unable to rename %s to %s'),
+-	              "$tmp/$entries[0]", $dest);
++    # If we are extracting "in-place" do not remove the destination directory.
++    if ($opts{in_place}) {
++        my $canon_basedir = Cwd::realpath($dest);
++        # On Solaris /dev/null points to /devices/pseudo/mm@0:null.
++        my $canon_devnull = Cwd::realpath('/dev/null');
++        my $check_symlink = sub {
++            my $pathname = shift;
++            my $canon_pathname = Cwd::realpath($pathname);
++            if (not defined $canon_pathname) {
++                return if $! == ENOENT;
++
++                syserr(g_("pathname '%s' cannot be canonicalized"), $pathname);
++            }
++            return if $canon_pathname eq $canon_devnull;
++            return if $canon_pathname eq $canon_basedir;
++            return if $canon_pathname =~ m{^\Q$canon_basedir/\E};
++            warning(g_("pathname '%s' points outside source root (to '%s')"),
++                    $pathname, $canon_pathname);
++        };
++
++        my $move_in_place = sub {
++            my $relpath = File::Spec->abs2rel($File::Find::name, $tmp);
++            my $destpath = File::Spec->catfile($dest, $relpath);
++
++            my ($mode, $atime, $mtime);
++            lstat $File::Find::name
++                or syserr(g_('cannot get source pathname %s metadata'), $File::Find::name);
++            ((undef) x 2, $mode, (undef) x 5, $atime, $mtime) = lstat _;
++            my $src_is_dir = -d _;
++
++            my $dest_exists = 1;
++            if (not lstat $destpath) {
++                if ($! == ENOENT) {
++                    $dest_exists = 0;
++                } else {
++                    syserr(g_('cannot get target pathname %s metadata'), $destpath);
++                }
++            }
++            my $dest_is_dir = -d _;
++            if ($dest_exists) {
++                if ($dest_is_dir && $src_is_dir) {
++                    # Refresh the destination directory attributes with the
++                    # ones from the tarball.
++                    chmod $mode, $destpath
++                        or syserr(g_('cannot change directory %s mode'), $File::Find::name);
++                    utime $atime, $mtime, $destpath
++                        or syserr(g_('cannot change directory %s times'), $File::Find::name);
++
++                    # We should do nothing, and just walk further tree.
++                    return;
++                } elsif ($dest_is_dir) {
++                    rmdir $destpath
++                        or syserr(g_('cannot remove destination directory %s'), $destpath);
++                } else {
++                    $check_symlink->($destpath);
++                    unlink $destpath
++                        or syserr(g_('cannot remove destination file %s'), $destpath);
++                }
++            }
++            # If we are moving a directory, we do not need to walk it.
++            if ($src_is_dir) {
++                $File::Find::prune = 1;
++            }
++            rename $File::Find::name, $destpath
++                or syserr(g_('cannot move %s to %s'), $File::Find::name, $destpath);
++        };
++
++        find({
++            wanted => $move_in_place,
++            no_chdir => 1,
++            dangling_symlinks => 0,
++        }, $tmp);
+     } else {
+-	rename($tmp, $dest)
+-	    or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
++        # Rename extracted directory
++        opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tmp);
++        my @entries = grep { $_ ne '.' && $_ ne '..' } readdir($dir_dh);
++        closedir($dir_dh);
++
++        erasedir($dest);
++
++        if (scalar(@entries) == 1 && ! -l "$tmp/$entries[0]" && -d _) {
++            rename("$tmp/$entries[0]", $dest)
++                or syserr(g_('unable to rename %s to %s'),
++                          "$tmp/$entries[0]", $dest);
++        } else {
++            rename($tmp, $dest)
++                or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
++        }
+     }
+     erasedir($tmp);
+ }
+diff --git a/scripts/t/Dpkg_Source_Archive.t b/scripts/t/Dpkg_Source_Archive.t
+index 7b70da68e..504fbe1d4 100644
+--- a/scripts/t/Dpkg_Source_Archive.t
++++ b/scripts/t/Dpkg_Source_Archive.t
+@@ -16,12 +16,120 @@
+ use strict;
+ use warnings;
+ 
+-use Test::More tests => 1;
++use Test::More tests => 4;
++use Test::Dpkg qw(:paths);
++
++use File::Spec;
++use File::Path qw(make_path rmtree);
+ 
+ BEGIN {
+     use_ok('Dpkg::Source::Archive');
+ }
+ 
++use Dpkg;
++
++my $tmpdir = test_get_temp_path();
++
++rmtree($tmpdir);
++
++sub test_touch
++{
++    my ($name, $data) = @_;
++
++    open my $fh, '>', $name
++        or die "cannot touch file $name\n";
++    print { $fh } $data if $data;
++    close $fh;
++}
++
++sub test_path_escape
++{
++    my $name = shift;
++
++    my $treedir = File::Spec->rel2abs("$tmpdir/$name-tree");
++    my $overdir = File::Spec->rel2abs("$tmpdir/$name-overlay");
++    my $outdir = "$tmpdir/$name-out";
++    my $expdir = "$tmpdir/$name-exp";
++
++    # This is the base directory, where we are going to be extracting stuff
++    # into, which include traps.
++    make_path("$treedir/subdir-a");
++    test_touch("$treedir/subdir-a/file-a");
++    test_touch("$treedir/subdir-a/file-pre-a");
++    make_path("$treedir/subdir-b");
++    test_touch("$treedir/subdir-b/file-b");
++    test_touch("$treedir/subdir-b/file-pre-b");
++    symlink File::Spec->abs2rel($outdir, $treedir), "$treedir/symlink-escape";
++    symlink File::Spec->abs2rel("$outdir/nonexistent", $treedir), "$treedir/symlink-nonexistent";
++    symlink "$treedir/file", "$treedir/symlink-within";
++    test_touch("$treedir/supposed-dir");
++
++    # This is the overlay directory, which we'll pack and extract over the
++    # base directory.
++    make_path($overdir);
++    make_path("$overdir/subdir-a/aa");
++    test_touch("$overdir/subdir-a/aa/file-aa", 'aa');
++    test_touch("$overdir/subdir-a/file-a", 'a');
++    make_path("$overdir/subdir-b/bb");
++    test_touch("$overdir/subdir-b/bb/file-bb", 'bb');
++    test_touch("$overdir/subdir-b/file-b", 'b');
++    make_path("$overdir/symlink-escape");
++    test_touch("$overdir/symlink-escape/escaped-file", 'escaped');
++    test_touch("$overdir/symlink-nonexistent", 'nonexistent');
++    make_path("$overdir/symlink-within");
++    make_path("$overdir/supposed-dir");
++    test_touch("$overdir/supposed-dir/supposed-file", 'something');
++
++    # Generate overlay tar.
++    system($Dpkg::PROGTAR, '-cf', "$overdir.tar", '-C', $overdir, qw(
++        subdir-a subdir-b
++        symlink-escape/escaped-file symlink-nonexistent symlink-within
++        supposed-dir
++        )) == 0
++        or die "cannot create overlay tar archive\n";
++
++   # This is the expected directory, which we'll be comparing against.
++    make_path($expdir);
++    system('cp', '-a', $overdir, $expdir) == 0
++        or die "cannot copy overlay hierarchy into expected directory\n";
++
++    # Store the expected and out reference directories into a tar to compare
++    # its structure against the result reference.
++    system($Dpkg::PROGTAR, '-cf', "$expdir.tar", '-C', $overdir, qw(
++        subdir-a subdir-b
++        symlink-escape/escaped-file symlink-nonexistent symlink-within
++        supposed-dir
++        ), '-C', $treedir, qw(
++        subdir-a/file-pre-a
++        subdir-b/file-pre-b
++        )) == 0
++        or die "cannot create expected tar archive\n";
++
++    # This directory is supposed to remain empty, anything inside implies a
++    # directory traversal.
++    make_path($outdir);
++
++    my $warnseen;
++    local $SIG{__WARN__} = sub { $warnseen = $_[0] };
++
++    # Perform the extraction.
++    my $tar = Dpkg::Source::Archive->new(filename => "$overdir.tar");
++    $tar->extract($treedir, in_place => 1);
++
++    # Store the result into a tar to compare its structure against a reference.
++    system($Dpkg::PROGTAR, '-cf', "$treedir.tar", '-C', $treedir, '.');
++
++    # Check results
++    ok(length $warnseen && $warnseen =~ m/points outside source root/,
++       'expected warning seen');
++    ok(system($Dpkg::PROGTAR, '--compare', '-f', "$expdir.tar", '-C', $treedir) == 0,
++       'expected directory matches');
++    ok(! -e "$outdir/escaped-file",
++       'expected output directory is empty, directory traversal');
++}
++
++test_path_escape('in-place');
++
+ # TODO: Add actual test cases.
+ 
+ 1;
+-- 
+2.33.0
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
index 681909f0bf..7ef6233ee4 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
+           file://0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
-- 
2.33.0


